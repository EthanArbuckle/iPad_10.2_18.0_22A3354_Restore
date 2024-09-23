@implementation CKAudioProgressImageCache

void __CKAudioProgressImageCache_block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;

  v0 = CKDefaultCacheLimit();
  CKCreateCache(v0);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)CKAudioProgressImageCache_sAudioProgressImageCache;
  CKAudioProgressImageCache_sAudioProgressImageCache = v1;

}

@end
