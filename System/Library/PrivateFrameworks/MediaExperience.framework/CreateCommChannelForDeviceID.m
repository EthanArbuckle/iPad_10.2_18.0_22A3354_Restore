@implementation CreateCommChannelForDeviceID

void __routingContextRemoteXPC_CreateCommChannelForDeviceID_block_invoke(uint64_t a1)
{
  CFDictionarySetValue(*(CFMutableDictionaryRef *)(*(_QWORD *)(a1 + 32) + 64), *(const void **)(a1 + 40), *(const void **)(a1 + 48));
}

uint64_t __routingContextResilientRemote_CreateCommChannelForDeviceID_block_invoke(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t, uint64_t, uint64_t);

  v3 = a1[4];
  v4 = a1[5];
  v5 = a1[6];
  v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 152);
  if (v6)
    return v6(a2, v3, v4, v5);
  else
    return 4294954514;
}

uint64_t __routingContext_CreateCommChannelForDeviceID_block_invoke(_QWORD *a1)
{
  uint64_t result;

  result = MXSystemRemotePool_CreateCommChannel(a1[5], a1[6], a1[7]);
  *(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = result;
  return result;
}

@end
