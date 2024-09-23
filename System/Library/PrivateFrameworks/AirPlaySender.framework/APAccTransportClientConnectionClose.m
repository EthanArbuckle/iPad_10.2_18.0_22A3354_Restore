@implementation APAccTransportClientConnectionClose

void __APAccTransportClientConnectionClose_block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  const void *v5;

  v2 = a1[6];
  if (*(_QWORD *)(v2 + 32))
  {
    CFDictionaryApplyBlock();
    v2 = a1[6];
  }
  v3 = *(_QWORD *)(v2 + 24);
  if (v3)
  {
    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = ((uint64_t (*)(uint64_t))softLinkacc_transportClient_destroyConnection[0])(v3);
    if (*(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24))
      v4 = 50;
    else
      v4 = 90;
    if (v4 >= gLogCategory_APAccTransportClientConnection
      && (gLogCategory_APAccTransportClientConnection != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v5 = *(const void **)(a1[6] + 24);
    if (v5)
    {
      CFRelease(v5);
      *(_QWORD *)(a1[6] + 24) = 0;
    }
  }
  else
  {
    APSLogErrorAt();
    *(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = -6709;
  }
}

void __APAccTransportClientConnectionClose_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *v3;
  _QWORD block[5];

  v3 = *(NSObject **)(a3 + 24);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __accTransportClientEndpointInvalidate_block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a3;
  dispatch_sync(v3, block);
}

@end
