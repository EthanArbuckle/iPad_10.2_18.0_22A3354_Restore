@implementation GetSurfaceCacheCountAllocated

uint64_t __GetSurfaceCacheCountAllocated_block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = CI::gCacheCountAllocated;
  return result;
}

@end
