@implementation CDAutoSuCache

void __29___CDAutoSuCache_sharedCache__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedCache_sharedInstance;
  sharedCache_sharedInstance = (uint64_t)v1;

}

@end
