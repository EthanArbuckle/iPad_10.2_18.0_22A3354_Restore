@implementation NSDictionary

void __76__NSDictionary_GKCollectionUtils___gkSubDictionaryWithKeys_mappedToNewKeys___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", a2);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v5 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "objectAtIndex:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v7, v6);

  }
}

void __60__NSDictionary_GKImageAdditions___gkImageCacheKeyPathsByKey__block_invoke()
{
  void *v0;

  v0 = (void *)_gkImageCacheKeyPathsByKey_sKeyPaths;
  _gkImageCacheKeyPathsByKey_sKeyPaths = (uint64_t)&unk_1E75FB230;

}

void __77__NSDictionary_GKImageAdditions___gkClientImageDictionaryForServerImageURLs___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  id v6;
  id v7;

  v4 = *(void **)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v6 = a3;
  objc_msgSend(v5, "objectForKey:", a2);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v7, v6);

}

@end
