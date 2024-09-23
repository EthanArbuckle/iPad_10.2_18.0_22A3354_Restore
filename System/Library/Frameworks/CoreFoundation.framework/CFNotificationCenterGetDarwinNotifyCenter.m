@implementation CFNotificationCenterGetDarwinNotifyCenter

uint64_t __CFNotificationCenterGetDarwinNotifyCenter_block_invoke()
{
  uint64_t result;

  result = _CFXNotificationCenterCreate(&__kCFAllocatorSystemDefault, _kCFXNotificationConfigurationStandardDarwinConfiguration);
  __darwinCenter = result;
  return result;
}

@end
