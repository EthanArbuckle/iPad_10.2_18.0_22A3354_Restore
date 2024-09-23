@implementation RIPShouldCacheImages

const void *__RIPShouldCacheImages_block_invoke()
{
  const void *result;
  BOOL v1;

  if (RIPGetCacheState_predicate != -1)
    dispatch_once(&RIPGetCacheState_predicate, &__block_literal_global_9_12336);
  RIPShouldCacheImages_should_cache = *(_BYTE *)(RIPGetCacheState_cache_state + 34);
  v1 = 1;
  result = get_BOOLean_property("RIPIMAGECACHE", (const void *(*)(const char *))copy_local_domain_value, &v1);
  if ((_DWORD)result)
    RIPShouldCacheImages_should_cache = v1;
  return result;
}

@end
