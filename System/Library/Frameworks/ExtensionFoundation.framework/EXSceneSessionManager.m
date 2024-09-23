@implementation EXSceneSessionManager

void __40___EXSceneSessionManager_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[_EXSceneSessionManager _init]([_EXSceneSessionManager alloc], "_init");
  v1 = (void *)sharedInstance_sharedInstance_0;
  sharedInstance_sharedInstance_0 = (uint64_t)v0;

}

@end
