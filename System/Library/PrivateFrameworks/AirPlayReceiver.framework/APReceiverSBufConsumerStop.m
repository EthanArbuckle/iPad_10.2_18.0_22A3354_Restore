@implementation APReceiverSBufConsumerStop

uint64_t __APReceiverSBufConsumerStop_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t (*v3)(uint64_t);
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(uint64_t (**)(uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 24);
  if (v3)
    result = v3(v2);
  else
    result = 4294954514;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end
