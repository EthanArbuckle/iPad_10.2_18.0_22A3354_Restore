@implementation CKBalloonViewCache

void __CKBalloonViewCache_block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;

  v0 = CKDefaultCacheLimit();
  CKCreateMultiCache(v0);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)CKBalloonViewCache_sBalloonViewCache;
  CKBalloonViewCache_sBalloonViewCache = v1;

}

@end
