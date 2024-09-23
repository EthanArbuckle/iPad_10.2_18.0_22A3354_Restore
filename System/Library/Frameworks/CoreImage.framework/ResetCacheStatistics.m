@implementation ResetCacheStatistics

void __ResetCacheStatistics_block_invoke()
{
  const char *v0;

  CI::gCacheCountPeak = 0;
  CI::gCacheSizePeak = 0;
  CI::gCacheNonVolatileSizePeak = 0;
  CI::gCacheCountAllocated = 0;
  CI::gCacheBytesAllocated = 0;
  CI::gCacheBytesFilled = 0;
  if (CI::gPeakNonVolatileList)
    CFArrayRemoveAllValues((CFMutableArrayRef)CI::gPeakNonVolatileList);
  if (CI_LOG_SURFACE_CACHE())
    CI::LogCacheState((CI *)1, (uint64_t)"ResetCacheStatistics", v0);
}

@end
