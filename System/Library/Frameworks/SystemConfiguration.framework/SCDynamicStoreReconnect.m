@implementation SCDynamicStoreReconnect

uint64_t ____SCDynamicStoreReconnect_block_invoke(uint64_t a1)
{
  uint64_t result;

  result = __SCDynamicStoreAddSession(*(_QWORD *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end
