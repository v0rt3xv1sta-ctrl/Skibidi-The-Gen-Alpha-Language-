@echo off
REM SKIBIDI AUTO-INSTALLER & RUNNER - SIGMA EDITION 💀
REM This script installs Python if needed and runs SKIBIDI

setlocal enabledelayedexpansion

echo.
echo ========================================
echo 🔥 SKIBIDI INSTALLER 💀
echo ========================================
echo.

REM Check if Python is installed
python --version >nul 2>&1
if errorlevel 1 (
    echo ⚠️ PYTHON NOT FOUND! INSTALLING...
    echo.
    
    REM Download Python installer
    echo Downloading Python 3.11...
    powershell -Command "& {[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; (New-Object System.Net.WebClient).DownloadFile('https://www.python.org/ftp/python/3.11.0/python-3.11.0-amd64.exe', 'python-installer.exe')}"
    
    echo.
    echo Installing Python...
    python-installer.exe /quiet InstallAllUsers=1 PrependPath=1
    
    echo.
    echo ✅ Python installed!
    echo Cleaning up installer...
    del python-installer.exe
    
    REM Restart to refresh PATH
    echo Restarting Command Prompt...
    cmd /k
    exit /b
) else (
    echo ✅ Python found!
)

echo.
echo ========================================

REM Check if skibidi.py exists
if not exist "skibidi.py" (
    echo.
    echo ⚠️ ERROR: skibidi.py not found in this folder!
    echo.
    echo Make sure skibidi.py is in the SAME FOLDER as this .bat file!
    echo.
    pause
    exit /b
)

echo.
echo 🚀 RUNNING SKIBIDI IDE...
echo ========================================
echo.

python skibidi.py

echo.
echo ========================================
pause