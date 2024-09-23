@implementation ANLogHandleUtils

void __ANLogHandleUtils_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.intercom", "Utils");
  v1 = (void *)ANLogHandleUtils_logger;
  ANLogHandleUtils_logger = (uint64_t)v0;

}

@end
