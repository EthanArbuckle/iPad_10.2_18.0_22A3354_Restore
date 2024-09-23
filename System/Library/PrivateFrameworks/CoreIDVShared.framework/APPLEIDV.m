@implementation APPLEIDV

void __APPLEIDV_LOG_CLIENT_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.CoreIDV", "AppleIDVClient");
  v1 = (void *)APPLEIDV_LOG_CLIENT_log;
  APPLEIDV_LOG_CLIENT_log = (uint64_t)v0;

}

@end
