@implementation APReceiverSystemInfoAllowsP2PConnectionFromMACAddress

void __APReceiverSystemInfoAllowsP2PConnectionFromMACAddress_block_invoke(uint64_t a1)
{
  uint64_t v2;
  const __CFString *v3;
  char v4;
  char cStr[16];
  __int128 v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 40);
  v7 = 0u;
  v8 = 0u;
  *(_OWORD *)cStr = 0u;
  v6 = 0u;
  if (*(_QWORD *)(v2 + 416))
  {
    HardwareAddressToCString();
    v3 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x24BDBD240], cStr, 0x8000100u);
    cStr[0] = 0;
    v4 = 1;
    if (CFStringCompare(*(CFStringRef *)(v2 + 416), v3, 1uLL))
    {
      if (gLogCategory_APReceiverSystemInfo <= 90
        && (gLogCategory_APReceiverSystemInfo != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      v4 = 0;
    }
    if (v3)
      CFRelease(v3);
  }
  else
  {
    v4 = 1;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v4;
}

@end
