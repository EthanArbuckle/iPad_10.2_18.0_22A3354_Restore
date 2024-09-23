@implementation Suspend

void __screenstreamudp_Suspend_block_invoke(uint64_t a1)
{
  const void *v2;
  _QWORD *v3;
  uint64_t DerivedStorage;
  const void *v5;

  v2 = *(const void **)(a1 + 32);
  if (*(_QWORD *)(a1 + 48))
    v3 = (_QWORD *)(a1 + 56);
  else
    v3 = 0;
  DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (*(_BYTE *)(DerivedStorage + 24))
  {
    APSLogErrorAt();
    screenstreamudp_dispatchCallback(v2, v3, -16762);
    screenstreamudp_handleFatalError(v2, -16762, CFSTR("Suspend failed"));
  }
  else if (*(_BYTE *)(DerivedStorage + 26))
  {
    if (*(_BYTE *)(DerivedStorage + 25))
    {
      if (!*(_BYTE *)(DerivedStorage + 248))
      {
        objc_msgSend(*(id *)(DerivedStorage + 40), "stopWithCompletion:", v3);
        screenstreamudp_teardownStream();
        if (gLogCategory_APEndpointStreamScreenUDP <= 50
          && (gLogCategory_APEndpointStreamScreenUDP != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
      }
    }
  }
  v5 = *(const void **)(a1 + 40);
  if (v5)
    CFRelease(v5);
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

void __audioEngineCarPlay_Suspend_block_invoke(uint64_t a1)
{
  uint64_t v1;
  const void *v3;
  _QWORD v4[4];

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v1 + 120))
  {
    *(_BYTE *)(v1 + 120) = 0;
    v3 = *(const void **)(v1 + 88);
    if (v3)
    {
      CFRelease(v3);
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88) = 0;
    }
    CFRetain(*(CFTypeRef *)(a1 + 40));
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 0x40000000;
    v4[2] = __audioEngineCarPlay_Suspend_block_invoke_2;
    v4[3] = &__block_descriptor_tmp_23_0;
    dispatch_async(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 128), v4);
  }
}

void __audioEngineCarPlay_Suspend_block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  void (*v5)(uint64_t);
  const void *v6;
  _QWORD *v7;
  const void *v8;
  const void *v9;
  const void *v10;
  const void *v11;
  uint64_t v12;

  v2 = *(_QWORD *)(a1 + 32);
  *(_BYTE *)(v2 + 136) = 0;
  v3 = *(_QWORD *)(v2 + 184);
  if (v3)
  {
    v4 = *(_QWORD **)(CMBaseObjectGetVTable() + 16);
    if (*v4 >= 2uLL)
    {
      v5 = (void (*)(uint64_t))v4[5];
      if (v5)
        v5(v3);
    }
    v2 = *(_QWORD *)(a1 + 32);
    v6 = *(const void **)(v2 + 184);
    if (v6)
    {
      CFRelease(v6);
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 184) = 0;
      v2 = *(_QWORD *)(a1 + 32);
    }
  }
  *(_QWORD *)(v2 + 176) = 0;
  *(_OWORD *)(v2 + 144) = 0u;
  *(_OWORD *)(v2 + 160) = 0u;
  v7 = *(_QWORD **)(a1 + 32);
  v8 = (const void *)v7[24];
  if (v8)
  {
    CFRelease(v8);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 192) = 0;
    v7 = *(_QWORD **)(a1 + 32);
  }
  v9 = (const void *)v7[25];
  if (v9)
  {
    CFRelease(v9);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 200) = 0;
    v7 = *(_QWORD **)(a1 + 32);
  }
  v10 = (const void *)v7[26];
  if (v10)
  {
    CFRelease(v10);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 208) = 0;
    v7 = *(_QWORD **)(a1 + 32);
  }
  v7[27] = 0;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 224) = 0;
  v12 = *(_QWORD *)(a1 + 32);
  v11 = *(const void **)(a1 + 40);
  *(_DWORD *)(v12 + 232) = 0;
  *(_BYTE *)(v12 + 236) = 0;
  CFRelease(v11);
}

uint64_t __audioHoseManagerBuffered_Suspend_block_invoke(uint64_t a1)
{
  uint64_t result;

  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = audioHoseManagerBuffered_releaseCryptors(*(_QWORD *)(a1 + 40), MEMORY[0x1E0CA2E18]);
  if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    return APSLogErrorAt();
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = audioHoseManagerBuffered_releaseMagicCookies(*(_QWORD *)(a1 + 40), MEMORY[0x1E0CA2E18]);
  result = *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  if ((_DWORD)result)
    return APSLogErrorAt();
  return result;
}

void __screenstream_Suspend_block_invoke(uint64_t a1)
{
  const void *v2;
  _BYTE *DerivedStorage;
  _BYTE *v4;
  uint64_t v5;
  void (*v6)(uint64_t);
  int v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  const void *v11;
  _QWORD block[7];
  int v13;

  v2 = *(const void **)(a1 + 32);
  DerivedStorage = (_BYTE *)CMBaseObjectGetDerivedStorage();
  if (DerivedStorage[24])
  {
    v7 = -16762;
    APSLogErrorAt();
  }
  else
  {
    v4 = DerivedStorage;
    if (!DerivedStorage[26] || !DerivedStorage[25])
    {
LABEL_10:
      v7 = 0;
      goto LABEL_11;
    }
    screenstream_stopStatsTimer();
    v5 = *((_QWORD *)v4 + 20);
    v6 = *(void (**)(uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 24);
    if (v6)
      v6(v5);
    screenstream_teardownTransportStream();
    CMBufferQueueReset(*((CMBufferQueueRef *)v4 + 13));
    screenStream_setResumedAndNotifiyObservers(v2, 0);
    v7 = 0;
    if (gLogCategory_APEndpointStreamScreen <= 50)
    {
      if (gLogCategory_APEndpointStreamScreen != -1 || _LogCategory_Initialize())
        LogPrintF();
      goto LABEL_10;
    }
  }
LABEL_11:
  if (*(_QWORD *)(a1 + 48))
  {
    CFRetain(*(CFTypeRef *)(a1 + 32));
    v8 = *(_QWORD *)(a1 + 48);
    v9 = *(NSObject **)(*(_QWORD *)(a1 + 56) + 96);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 0x40000000;
    block[2] = __screenstream_Suspend_block_invoke_2;
    block[3] = &__block_descriptor_tmp_82;
    v10 = *(_QWORD *)(a1 + 32);
    block[4] = v8;
    block[5] = v10;
    v13 = v7;
    block[6] = *(_QWORD *)(a1 + 64);
    dispatch_async(v9, block);
  }
  v11 = *(const void **)(a1 + 40);
  if (v11)
    CFRelease(v11);
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

void __screenstream_Suspend_block_invoke_2(uint64_t a1)
{
  (*(void (**)(_QWORD, _QWORD, _QWORD))(a1 + 32))(*(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 56), *(_QWORD *)(a1 + 48));
  CFRelease(*(CFTypeRef *)(a1 + 40));
}

@end
