@implementation HKLogSharing

os_log_t __HKLogSharing_block_invoke()
{
  os_log_t result;

  result = os_log_create("com.apple.HealthKit", "sharing");
  HKLogSharing_sharingCategory = (uint64_t)result;
  return result;
}

@end
