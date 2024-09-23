@implementation APBrokerGroupAuthenticateWithOneBroker

void ___APBrokerGroupAuthenticateWithOneBroker_block_invoke(uint64_t a1, uint64_t a2, CFTypeRef cf, uint64_t a4, uint64_t a5, uint64_t a6)
{
  int v7;
  uint64_t v9;
  int v10;
  CFTypeRef v11;

  v7 = a2;
  v9 = *(_QWORD *)(a1 + 48);
  v10 = gLogCategory_APBrokerGroup;
  if (gLogCategory_APBrokerGroup <= 50)
  {
    if (gLogCategory_APBrokerGroup == -1)
    {
      if (!_LogCategory_Initialize())
        goto LABEL_9;
      v10 = gLogCategory_APBrokerGroup;
    }
    if (v10 == -1)
      _LogCategory_Initialize();
    LogPrintF();
  }
LABEL_9:
  if (v7 == -6754)
  {
    *(_DWORD *)(v9 + 4) = -6754;
  }
  else if (v7)
  {
    *(_DWORD *)(v9 + 4) = v7;
  }
  else
  {
    *(_DWORD *)(v9 + 4) = 0;
    *(_BYTE *)v9 = 1;
    if (cf)
      v11 = CFRetain(cf);
    else
      v11 = 0;
    *(_QWORD *)(v9 + 8) = v11;
  }
  (*(void (**)(_QWORD, uint64_t, CFTypeRef, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a2, cf, a4, a5, a6);
  _Block_release(*(const void **)(a1 + 32));
}

@end
