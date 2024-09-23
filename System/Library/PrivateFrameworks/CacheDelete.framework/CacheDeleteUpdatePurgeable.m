@implementation CacheDeleteUpdatePurgeable

void __CacheDeleteUpdatePurgeable_block_invoke(uint64_t a1)
{
  const void *v2;

  CacheDeleteUpdatePurgeableSync(*(void **)(a1 + 32));
  v2 = *(const void **)(a1 + 32);
  if (v2)
    CFRelease(v2);
}

@end
