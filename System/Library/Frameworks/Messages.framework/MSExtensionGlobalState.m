@implementation MSExtensionGlobalState

void __41___MSExtensionGlobalState_sharedInstance__block_invoke()
{
  _MSExtensionGlobalState *v0;
  void *v1;

  v0 = objc_alloc_init(_MSExtensionGlobalState);
  v1 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = (uint64_t)v0;

}

@end
