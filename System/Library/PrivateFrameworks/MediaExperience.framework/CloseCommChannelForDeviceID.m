@implementation CloseCommChannelForDeviceID

void __routingContextRemoteXPC_CloseCommChannelForDeviceID_block_invoke(uint64_t a1)
{
  CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(*(_QWORD *)(a1 + 32) + 64), *(const void **)(a1 + 40));
}

uint64_t __routingContextResilientRemote_CloseCommChannelForDeviceID_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(uint64_t, uint64_t, uint64_t);

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 168);
  if (v5)
    return v5(a2, v3, v4);
  else
    return 4294954514;
}

uint64_t __routingContext_CloseCommChannelForDeviceID_block_invoke(_QWORD *a1)
{
  uint64_t result;

  result = MXSystemRemotePool_CloseCommChannel(a1[5], a1[6]);
  *(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = result;
  return result;
}

@end
