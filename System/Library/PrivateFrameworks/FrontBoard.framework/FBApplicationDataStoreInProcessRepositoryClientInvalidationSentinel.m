@implementation FBApplicationDataStoreInProcessRepositoryClientInvalidationSentinel

+ (id)sentinel
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79__FBApplicationDataStoreInProcessRepositoryClientInvalidationSentinel_sentinel__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sentinel_onceToken != -1)
    dispatch_once(&sentinel_onceToken, block);
  return (id)sentinel_sentinel;
}

void __79__FBApplicationDataStoreInProcessRepositoryClientInvalidationSentinel_sentinel__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sentinel_sentinel;
  sentinel_sentinel = (uint64_t)v1;

}

@end
