@implementation FBLogInterfaceOrientationObserver

void __FBLogInterfaceOrientationObserver_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.FrontBoard", "InterfaceOrientationObserver");
  v1 = (void *)FBLogInterfaceOrientationObserver___logObj;
  FBLogInterfaceOrientationObserver___logObj = (uint64_t)v0;

}

@end
