@implementation HKLogInfrastructure

os_log_t __HKLogInfrastructure_block_invoke()
{
  os_log_t result;

  result = os_log_create("com.apple.HealthKit", "infrastructure");
  HKLogInfrastructure_category = (uint64_t)result;
  return result;
}

@end
