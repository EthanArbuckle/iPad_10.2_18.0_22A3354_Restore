@implementation ANLogHandleAnalytics

void __ANLogHandleAnalytics_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.intercom", "Analytics");
  v1 = (void *)ANLogHandleAnalytics_logger;
  ANLogHandleAnalytics_logger = (uint64_t)v0;

}

@end
