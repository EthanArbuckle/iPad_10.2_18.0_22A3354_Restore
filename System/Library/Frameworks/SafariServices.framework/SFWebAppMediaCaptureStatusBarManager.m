@implementation SFWebAppMediaCaptureStatusBarManager

void __54___SFWebAppMediaCaptureStatusBarManager_sharedManager__block_invoke()
{
  _SFWebAppMediaCaptureStatusBarManager *v0;
  void *v1;

  v0 = objc_alloc_init(_SFWebAppMediaCaptureStatusBarManager);
  v1 = (void *)sharedManager_sharedInstance;
  sharedManager_sharedInstance = (uint64_t)v0;

}

@end
