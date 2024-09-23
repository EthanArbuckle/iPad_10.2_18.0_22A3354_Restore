@implementation APBrokerGroupStartReceiverPolling

void __APBrokerGroupStartReceiverPolling_block_invoke(uint64_t a1)
{
  uint64_t v2;
  const void *v3;
  uint64_t v4;
  int v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  dispatch_time_t v10;
  _QWORD v11[5];
  _QWORD handler[5];

  if (!*(_BYTE *)(*(_QWORD *)(a1 + 40) + 112))
  {
    v2 = FigCFWeakReferenceHolderCreateWithReferencedObject();
    if (v2)
    {
      v3 = (const void *)v2;
      v4 = *(_QWORD *)(a1 + 40);
      *(_BYTE *)(v4 + 112) = 1;
      if (gLogCategory_APBrokerGroup <= 50)
      {
        if (gLogCategory_APBrokerGroup != -1 || (v5 = _LogCategory_Initialize(), v4 = *(_QWORD *)(a1 + 40), v5))
        {
          LogPrintF();
          v4 = *(_QWORD *)(a1 + 40);
        }
      }
      *(_QWORD *)(*(_QWORD *)(a1 + 40) + 120) = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, *(dispatch_queue_t *)(v4 + 104));
      v6 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 120);
      if (v6)
      {
        v7 = MEMORY[0x1E0C809B0];
        handler[0] = MEMORY[0x1E0C809B0];
        handler[1] = 0x40000000;
        handler[2] = __APBrokerGroupStartReceiverPolling_block_invoke_2;
        handler[3] = &__block_descriptor_tmp_29_0;
        handler[4] = v3;
        dispatch_source_set_event_handler(v6, handler);
        v8 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 120);
        v11[0] = v7;
        v11[1] = 0x40000000;
        v11[2] = __APBrokerGroupStartReceiverPolling_block_invoke_4;
        v11[3] = &__block_descriptor_tmp_30_0;
        v11[4] = v3;
        dispatch_source_set_cancel_handler(v8, v11);
        v9 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 120);
        v10 = dispatch_time(0, 0);
        dispatch_source_set_timer(v9, v10, 0xFFFFFFFFFFFFFFFFLL, 0);
        dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(a1 + 40) + 120));
      }
      else
      {
        APSLogErrorAt();
        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = -6728;
        CFRelease(v3);
      }
    }
    else
    {
      APSLogErrorAt();
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = -6728;
    }
  }
}

void __APBrokerGroupStartReceiverPolling_block_invoke_2()
{
  uint64_t v0;
  NSObject *v1;
  _QWORD block[5];

  v0 = FigCFWeakReferenceHolderCopyReferencedObject();
  if (v0)
  {
    v1 = *(NSObject **)(v0 + 96);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 0x40000000;
    block[2] = __APBrokerGroupStartReceiverPolling_block_invoke_3;
    block[3] = &__block_descriptor_tmp_28_1;
    block[4] = v0;
    dispatch_async(v1, block);
  }
}

void __APBrokerGroupStartReceiverPolling_block_invoke_3(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 32);
  if (gLogCategory_APBrokerGroup <= 50 && (gLogCategory_APBrokerGroup != -1 || _LogCategory_Initialize()))
    LogPrintF();
  _APBrokerGroupCallAllBrokers(v2, &__block_literal_global_8, __block_literal_global_61);
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

void __APBrokerGroupStartReceiverPolling_block_invoke_4(uint64_t a1)
{
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

@end
