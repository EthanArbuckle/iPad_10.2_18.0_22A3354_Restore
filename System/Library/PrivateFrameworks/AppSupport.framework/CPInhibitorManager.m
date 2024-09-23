@implementation CPInhibitorManager

void __37___CPInhibitorManager_sharedInstance__block_invoke()
{
  _CPInhibitorManager *v0;
  void *v1;

  v0 = objc_alloc_init(_CPInhibitorManager);
  v1 = (void *)sharedInstance__sharedManager;
  sharedInstance__sharedManager = (uint64_t)v0;

}

@end
