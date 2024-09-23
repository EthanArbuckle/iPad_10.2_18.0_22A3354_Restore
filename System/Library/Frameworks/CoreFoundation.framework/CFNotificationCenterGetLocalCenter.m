@implementation CFNotificationCenterGetLocalCenter

uint64_t __CFNotificationCenterGetLocalCenter_block_invoke()
{
  uint64_t result;

  result = _CFXNotificationCenterCreate(&__kCFAllocatorSystemDefault, _kCFXNotificationConfigurationStandardLocalConfiguration);
  __taskCenter = result;
  return result;
}

@end
