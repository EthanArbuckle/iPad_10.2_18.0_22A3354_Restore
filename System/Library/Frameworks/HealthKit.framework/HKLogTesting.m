@implementation HKLogTesting

os_log_t __HKLogTesting_block_invoke()
{
  os_log_t result;

  result = os_log_create("com.apple.HealthKit", "testing");
  HKLogTesting_testingCategory = (uint64_t)result;
  return result;
}

@end
