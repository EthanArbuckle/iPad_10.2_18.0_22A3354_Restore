@implementation HKLogAnalytics

os_log_t __HKLogAnalytics_block_invoke()
{
  os_log_t result;

  result = os_log_create("com.apple.HealthKit", "analytics");
  HKLogAnalytics_category = (uint64_t)result;
  return result;
}

@end
