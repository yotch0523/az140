write-host "init credential for Azure files"
$fileServer="saenxavd.file.core.windows.net"
$user="localhost\saenxavd"
$secret=$Args[0]

cmdkey.exe /add:$fileServer /user:$($user) /pass:$($secret)
# Disable Windows Defender Credential Guard (only needed for Windows 11 22H2)
New-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa" -Name "LsaCfgFlags" -Value 0 -force
write-host "finished!!"