@implementation GetSurfaceCacheNonVolatileSize

uint64_t __GetSurfaceCacheNonVolatileSize_block_invoke(uint64_t result)
{
  unint64_t v1;
  unint64_t v2;

  v1 = atomic_load(&CI::gCacheSize);
  v2 = atomic_load(&CI::gVolatileSize);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = v1 - v2;
  return result;
}

@end
