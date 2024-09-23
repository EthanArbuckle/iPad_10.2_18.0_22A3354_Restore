@implementation ACHLogMetrics

void __ACHLogMetrics_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.ActivityAchievements", "metrics");
  v1 = (void *)ACHLogMetrics_category;
  ACHLogMetrics_category = (uint64_t)v0;

}

@end
