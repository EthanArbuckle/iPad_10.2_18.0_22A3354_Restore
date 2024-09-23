@implementation MTMetricsKitOSLog

void __MTMetricsKitOSLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.amp-ae-eng.MetricsKit", "general");
  v1 = (void *)MTDefaultOSLog;
  MTDefaultOSLog = (uint64_t)v0;

}

@end
