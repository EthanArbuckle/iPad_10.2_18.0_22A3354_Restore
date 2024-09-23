@implementation AAUIFamilyDetailsCache

+ (id)sharedCache
{
  if (sharedCache_onceToken_0 != -1)
    dispatch_once(&sharedCache_onceToken_0, &__block_literal_global_10);
  return (id)sharedCache__sharedCache;
}

void __37__AAUIFamilyDetailsCache_sharedCache__block_invoke()
{
  AAUIFamilyDetailsCache *v0;
  void *v1;

  v0 = objc_alloc_init(AAUIFamilyDetailsCache);
  v1 = (void *)sharedCache__sharedCache;
  sharedCache__sharedCache = (uint64_t)v0;

}

- (void)invalidate
{
  id v2;

  objc_msgSend(getFAFamilyDetailsCacheClass(), "sharedCache");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidate");

}

- (unint64_t)pendingInviteCount
{
  void *v2;
  unint64_t v3;

  objc_msgSend(getFAFamilyDetailsCacheClass(), "sharedCache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "pendingInviteCount");

  return v3;
}

@end
