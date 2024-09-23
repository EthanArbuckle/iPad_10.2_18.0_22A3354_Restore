@implementation AirPlayReceiverSessionSendMediaRemoteCommand

void __AirPlayReceiverSessionSendMediaRemoteCommand_block_invoke(uint64_t a1)
{
  int v2;
  __int128 v5;
  uint64_t v6;
  int v7;

  v2 = *(_DWORD *)(a1 + 56);
  if (v2 == 1885435251 || v2 == 1937010544 || v2 == 1886154867)
  {
    v7 = 0;
    if (CFObjectGetPropertyInt64Sync())
    {
      v5 = 0uLL;
      v6 = 0;
      AirPlayReceiverSessionSetRateAndAnchorTime(*(_QWORD *)(a1 + 32), 0, MEMORY[0x24BE03810], MEMORY[0x24BE03810], &v5);
    }
  }
  if (gLogCategory_AirPlayReceiverCore <= 50
    && (gLogCategory_AirPlayReceiverCore != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  AirPlayReceiverSessionSendCommandForObject(*(_QWORD *)(a1 + 32), 0, *(const void **)(a1 + 48), 0, 0);
  CFRelease(*(CFTypeRef *)(a1 + 32));
  CFRelease(*(CFTypeRef *)(a1 + 48));
}

@end
