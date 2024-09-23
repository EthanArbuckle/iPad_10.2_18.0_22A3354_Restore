@implementation AXSetNextElementCacheUniqueUID

uint64_t ___AXSetNextElementCacheUniqueUID_block_invoke(uint64_t result)
{
  _ElementCacheUniqueID = *(_QWORD *)(result + 32) - 1;
  return result;
}

@end
