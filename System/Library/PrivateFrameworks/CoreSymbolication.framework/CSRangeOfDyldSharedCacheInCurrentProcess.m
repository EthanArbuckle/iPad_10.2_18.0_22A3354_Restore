@implementation CSRangeOfDyldSharedCacheInCurrentProcess

uint64_t __CSRangeOfDyldSharedCacheInCurrentProcess_block_invoke()
{
  uint64_t result;

  result = _dyld_get_shared_cache_range();
  CSRangeOfDyldSharedCacheInCurrentProcess::range = result;
  *(_QWORD *)algn_1EF08DCA8 = 0;
  return result;
}

@end
