@implementation ANLogHandleAnalyticsDaily

void __ANLogHandleAnalyticsDaily_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.intercom", "AnalyticsDaily");
  v1 = (void *)ANLogHandleAnalyticsDaily_logger;
  ANLogHandleAnalyticsDaily_logger = (uint64_t)v0;

}

@end
