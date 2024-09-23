@implementation LoggingFramework

void __LoggingFramework_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.hid.AppleHIDFeedback", "Framework");
  v1 = (void *)LoggingFramework___logObj;
  LoggingFramework___logObj = (uint64_t)v0;

}

@end
