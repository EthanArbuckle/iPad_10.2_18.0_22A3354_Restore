@implementation HKLogAssertions

os_log_t __HKLogAssertions_block_invoke()
{
  os_log_t result;

  result = os_log_create("com.apple.HealthKit", "assertions");
  HKLogAssertions_category = (uint64_t)result;
  return result;
}

@end
