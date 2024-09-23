@implementation ANLogHandleCoreAnalytics

void __ANLogHandleCoreAnalytics_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.intercom", "CoreAnalytics");
  v1 = (void *)ANLogHandleCoreAnalytics_logger;
  ANLogHandleCoreAnalytics_logger = (uint64_t)v0;

}

@end
