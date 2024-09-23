@implementation LSDAppProtectionAccessManager

void __48___LSDAppProtectionAccessManager_sharedInstance__block_invoke()
{
  _LSDAppProtectionAccessManager *v0;
  void *v1;

  v0 = objc_alloc_init(_LSDAppProtectionAccessManager);
  v1 = (void *)+[_LSDAppProtectionAccessManager sharedInstance]::sharedInstance;
  +[_LSDAppProtectionAccessManager sharedInstance]::sharedInstance = (uint64_t)v0;

}

@end
