FROM wuerges/boca

RUN apt-get -y update \ 
   && apt-get -y install \
   quotatool \
   debootstrap \
   schroot \
   && rm -rf /var/lib/apt/lists/*
    
RUN DISTRIB_CODENAME=bullseye > /etc/lsb-release
RUN mkdir -p /var/lib/AccountsService/users/
RUN boca-createjail || true

ENTRYPOINT /usr/sbin/boca-autojudge
