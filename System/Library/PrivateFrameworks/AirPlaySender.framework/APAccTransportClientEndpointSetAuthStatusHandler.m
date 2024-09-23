@implementation APAccTransportClientEndpointSetAuthStatusHandler

void __APAccTransportClientEndpointSetAuthStatusHandler_block_invoke(uint64_t a1)
{
  uint64_t v2;
  const void *v3;
  void *v4;
  uint64_t v5;
  const void *v6;
  uint64_t v7;
  int v8;
  _QWORD v9[5];

  v2 = *(_QWORD *)(a1 + 48);
  if (*(_BYTE *)(v2 + 16) || !*(_QWORD *)(v2 + 48))
  {
    APSLogErrorAt();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v8 = -6709;
  }
  else
  {
    v3 = *(const void **)(v2 + 72);
    if (v3)
    {
      _Block_release(v3);
      *(_QWORD *)(*(_QWORD *)(a1 + 48) + 72) = 0;
    }
    v4 = _Block_copy(*(const void **)(a1 + 32));
    v5 = *(_QWORD *)(a1 + 48);
    *(_QWORD *)(v5 + 72) = v4;
    if (v4)
    {
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __APAccTransportClientEndpointSetAuthStatusHandler_block_invoke_2;
      v9[3] = &unk_1E826DB78;
      v9[4] = v5;
      ((void (*)(uint64_t))softLinkacc_transportClient_setConnectionAuthStatusDidChangeHandler[0])((uint64_t)v9);
      goto LABEL_7;
    }
    APSLogErrorAt();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v8 = -6728;
  }
  *(_DWORD *)(v7 + 24) = v8;
LABEL_7:
  if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    ((void (*)(uint64_t))softLinkacc_transportClient_setConnectionAuthStatusDidChangeHandler[0])(0);
    v6 = *(const void **)(*(_QWORD *)(a1 + 48) + 72);
    if (v6)
    {
      _Block_release(v6);
      *(_QWORD *)(*(_QWORD *)(a1 + 48) + 72) = 0;
    }
  }
}

void __APAccTransportClientEndpointSetAuthStatusHandler_block_invoke_2(uint64_t a1, const void *a2, char a3)
{
  _QWORD *v5;
  NSObject *v6;
  _QWORD block[6];
  char v8;

  v5 = *(_QWORD **)(a1 + 32);
  if (gLogCategory_APAccTransportClientEndpoint <= 50
    && (gLogCategory_APAccTransportClientEndpoint != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  CFRetain(v5);
  CFRetain(a2);
  v6 = v5[3];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __APAccTransportClientEndpointSetAuthStatusHandler_block_invoke_3;
  block[3] = &__block_descriptor_49_e5_v8__0l;
  block[4] = v5;
  block[5] = a2;
  v8 = a3;
  dispatch_async(v6, block);
}

void __APAccTransportClientEndpointSetAuthStatusHandler_block_invoke_3(uint64_t a1)
{
  if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 16) && FigCFEqual())
    (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 72) + 16))();
  CFRelease(*(CFTypeRef *)(a1 + 40));
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

@end
