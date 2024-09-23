@implementation CPAnalyticsLog

void __CPAnalyticsLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.photos.CPAnalytics", "Generic");
  v1 = (void *)CPAnalyticsLog_log;
  CPAnalyticsLog_log = (uint64_t)v0;

}

@end
