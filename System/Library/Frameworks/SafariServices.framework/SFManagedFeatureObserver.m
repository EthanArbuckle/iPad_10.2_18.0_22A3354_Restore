@implementation SFManagedFeatureObserver

void __43___SFManagedFeatureObserver_sharedObserver__block_invoke()
{
  _SFManagedFeatureObserver *v0;
  void *v1;

  v0 = objc_alloc_init(_SFManagedFeatureObserver);
  v1 = (void *)sharedObserver_sharedObserver;
  sharedObserver_sharedObserver = (uint64_t)v0;

}

@end
