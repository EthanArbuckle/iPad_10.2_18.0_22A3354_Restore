@implementation APReceiverSBufConsumerPushVideoSBuf

uint64_t __APReceiverSBufConsumerPushVideoSBuf_block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(uint64_t, uint64_t);
  uint64_t result;

  v2 = a1[5];
  v3 = a1[6];
  v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 32);
  if (v4)
    result = v4(v2, v3);
  else
    result = 4294954514;
  *(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = result;
  return result;
}

@end
