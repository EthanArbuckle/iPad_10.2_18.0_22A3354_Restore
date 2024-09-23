@implementation GetSurfaceCachePeakNonVolatileSize

uint64_t __GetSurfaceCachePeakNonVolatileSize_block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = CI::gCacheNonVolatileSizePeak;
  return result;
}

@end
