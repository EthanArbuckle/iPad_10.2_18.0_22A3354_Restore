@implementation NSSNewsAnalyticsPBEventAccumulatorLog

void __NSSNewsAnalyticsPBEventAccumulatorLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.news", "Analytics");
  v1 = (void *)NSSNewsAnalyticsPBEventAccumulatorLog_result;
  NSSNewsAnalyticsPBEventAccumulatorLog_result = (uint64_t)v0;

}

@end
