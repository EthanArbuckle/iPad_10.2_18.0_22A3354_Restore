@implementation AirPlayReceiverServerPlatformInitialize

void __AirPlayReceiverServerPlatformInitialize_block_invoke_2(uint64_t a1)
{
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 52))
  {
    if (gLogCategory_AirPlayReceiverPlatform <= 50
      && (gLogCategory_AirPlayReceiverPlatform != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    AirPlayReceiverServerSendMediaRemoteCommand(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 216), 1885495660);
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 52) = 0;
  }
}

void __AirPlayReceiverServerPlatformInitialize_block_invoke_3(uint64_t a1)
{
  if (CFObjectGetPropertyInt64Sync())
  {
    if (gLogCategory_AirPlayReceiverPlatform <= 50
      && (gLogCategory_AirPlayReceiverPlatform != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    AirPlayReceiverServerSendMediaRemoteCommand(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 216), 1885499506);
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 52) = 1;
  }
}

uint64_t __AirPlayReceiverServerPlatformInitialize_block_invoke_4()
{
  return CFObjectControlAsync();
}

uint64_t __AirPlayReceiverServerPlatformInitialize_block_invoke_5(uint64_t a1, const void *a2, const void *a3, const void *a4, CFTypeRef *a5)
{
  int v10;
  uint64_t v12;
  const void *v13;
  const void *v14;
  const void *v15;
  CFTypeID v16;
  CFTypeID TypeID;

  if ((const void *)objc_msgSend(MEMORY[0x24BDBCEF8], "null") == a4 || a4 == 0)
  {
    v12 = *(_QWORD *)(a1 + 32);
    v13 = a2;
    v14 = a3;
    v15 = 0;
    return AirPlayReceiverServerControl(v12, v10, v13, v14, v15, a5);
  }
  v16 = CFGetTypeID(a4);
  TypeID = CFDictionaryGetTypeID();
  if (v16 == TypeID)
  {
    v12 = *(_QWORD *)(a1 + 32);
    v13 = a2;
    v14 = a3;
    v15 = a4;
    return AirPlayReceiverServerControl(v12, v10, v13, v14, v15, a5);
  }
  return 4294960582;
}

CFTypeRef __AirPlayReceiverServerPlatformInitialize_block_invoke_6(uint64_t a1, CFTypeRef cf1, uint64_t a3, _DWORD *a4)
{
  return AirPlayReceiverServerCopyProperty(*(_QWORD *)(a1 + 32), (int)cf1, cf1, a3, a4);
}

uint64_t __AirPlayReceiverServerPlatformInitialize_block_invoke_7(uint64_t a1, CFTypeRef cf1, uint64_t a3, uint64_t a4)
{
  return AirPlayReceiverServerSetProperty(*(_QWORD *)(a1 + 32), (int)cf1, cf1, a4, a4);
}

@end
