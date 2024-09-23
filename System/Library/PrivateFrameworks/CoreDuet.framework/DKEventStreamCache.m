@implementation DKEventStreamCache

uint64_t __35___DKEventStreamCache_sharedCached__block_invoke()
{
  _DKEventStreamCache *v0;
  void *v1;

  v0 = objc_alloc_init(_DKEventStreamCache);
  v1 = (void *)sharedCached_sharedCache;
  sharedCached_sharedCache = (uint64_t)v0;

  return objc_msgSend((id)sharedCached_sharedCache, "setCountLimit:", 10);
}

@end
