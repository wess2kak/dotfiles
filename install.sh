#!/bin/sh

e=$(id -u)
err="Run this script as a user with sudo!"
if [ "$e" != "0" ] || [ "${SUDO_USER:-${USER}}" = "root" ]; then
    echo "${err}"; exit 1
fi

#TODO: .toprc in home directory if ubuntu
# Make config directories if they don't already exist
mkdir -p /home/"${SUDO_USER:-${USER}}"/.config/nano
mkdir -p ~/.config/nano
#mkdir -p /home/"${SUDO_USER:-${USER}}"/.config/procps/
#mkdir -p ~/.config/procps/
# Copy config files for programs to appropriate locations
cp nanorc /home/"${SUDO_USER:-${USER}}"/.config/nano/
cp nanorc-root ~/.config/nano/nanorc
#cp toprc /home/"${SUDO_USER:-${USER}}"/.config/procps/
#cp toprc ~/.config/procps/

echo "\033[32mdone!\033[0m"
