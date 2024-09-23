@implementation SFDownloadDispatcher

void __49___SFDownloadDispatcher_sharedDownloadDispatcher__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedDownloadDispatcher_instance;
  sharedDownloadDispatcher_instance = (uint64_t)v1;

}

@end
