@implementation MetricsLog

void __MetricsLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.CompanionServices", "Metrics");
  v1 = (void *)MetricsLog_log;
  MetricsLog_log = (uint64_t)v0;

}

@end
