@implementation JEMetricsOSLog

void __JEMetricsOSLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.JetEngine", "Metrics");
  v1 = (void *)JEDefaultMetricsOSLog;
  JEDefaultMetricsOSLog = (uint64_t)v0;

}

@end
