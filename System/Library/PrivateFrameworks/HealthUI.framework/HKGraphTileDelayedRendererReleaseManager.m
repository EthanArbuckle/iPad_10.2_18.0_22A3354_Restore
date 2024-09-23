@implementation HKGraphTileDelayedRendererReleaseManager

void __54___HKGraphTileDelayedRendererReleaseManager_singleton__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)singleton_singletonDelayedRendererReleaseManager;
  singleton_singletonDelayedRendererReleaseManager = (uint64_t)v1;

}

@end
