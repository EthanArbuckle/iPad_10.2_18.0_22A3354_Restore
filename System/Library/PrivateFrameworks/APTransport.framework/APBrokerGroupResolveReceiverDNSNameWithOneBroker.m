@implementation APBrokerGroupResolveReceiverDNSNameWithOneBroker

void ___APBrokerGroupResolveReceiverDNSNameWithOneBroker_block_invoke(uint64_t a1, int a2, CFTypeRef cf)
{
  uint64_t v6;
  int v7;
  const void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v6 = *(_QWORD *)(a1 + 48);
  v7 = gLogCategory_APBrokerGroup;
  if (gLogCategory_APBrokerGroup <= 50)
  {
    if (gLogCategory_APBrokerGroup == -1)
    {
      if (!_LogCategory_Initialize())
        goto LABEL_9;
      v7 = gLogCategory_APBrokerGroup;
    }
    if (v7 == -1)
      _LogCategory_Initialize();
    LogPrintF();
  }
LABEL_9:
  if (a2)
  {
    APSLogErrorAt();
LABEL_16:
    *(_DWORD *)(v6 + 4) = a2;
    goto LABEL_13;
  }
  if (!cf)
  {
    APSLogErrorAt();
    a2 = -6705;
    goto LABEL_16;
  }
  *(_BYTE *)v6 = 1;
  *(_DWORD *)(v6 + 4) = 0;
  v8 = *(const void **)(v6 + 8);
  *(_QWORD *)(v6 + 8) = cf;
  CFRetain(cf);
  if (v8)
    CFRelease(v8);
LABEL_13:
  (*(void (**)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), v9, v10, v11, v12, v13);
  _Block_release(*(const void **)(a1 + 32));
}

@end
