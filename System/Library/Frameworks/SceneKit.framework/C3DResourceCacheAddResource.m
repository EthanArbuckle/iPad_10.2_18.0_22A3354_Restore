@implementation C3DResourceCacheAddResource

uint64_t __C3DResourceCacheAddResource_block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (*(_QWORD *)(result + 40) == a3)
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

@end
