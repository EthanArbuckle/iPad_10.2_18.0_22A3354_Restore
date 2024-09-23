@implementation XPC

void __dsrxpc_callback_handleEmitFrame_XPC_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  const void *v7;
  const void *v8;
  const void *v9;
  __int128 v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = 0;
  if (dsrxpc_tryDecrementPendingFrameInfoOutstandingEmitCountToEmit(*(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16)))
  {
    v2 = *(_QWORD *)(a1 + 32);
    v3 = *(uint64_t **)(a1 + 40);
    v4 = *(_QWORD *)(a1 + 48);
    v5 = *(unsigned int *)(a1 + 64);
    v6 = *(unsigned int *)(a1 + 68);
    v12 = *(_OWORD *)(a1 + 72);
    v13 = *(_QWORD *)(a1 + 88);
    v10 = *(_OWORD *)(a1 + 96);
    v11 = *(_QWORD *)(a1 + 112);
    dsrxpc_handleEmitFrame(v2, v3, v4, v5, v6, &v12, &v10);
  }
  if (!FigXPCCreateBasicMessage())
    FigXPCRemoteClientSendSyncMessage();
  FigXPCRelease();
  v7 = *(const void **)(a1 + 48);
  if (v7)
    CFRelease(v7);
  v8 = *(const void **)(a1 + 40);
  if (v8)
    CFRelease(v8);
  v9 = *(const void **)(a1 + 32);
  if (v9)
    CFRelease(v9);
}

@end
