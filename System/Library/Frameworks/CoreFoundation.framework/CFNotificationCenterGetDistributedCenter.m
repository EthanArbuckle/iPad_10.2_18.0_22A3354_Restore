@implementation CFNotificationCenterGetDistributedCenter

uint64_t __CFNotificationCenterGetDistributedCenter_block_invoke()
{
  uint64_t result;

  result = _CFXNotificationCenterCreate(&__kCFAllocatorSystemDefault, _kCFXNotificationConfigurationStandardDistributedConfiguration);
  __hostCenter = result;
  return result;
}

@end
