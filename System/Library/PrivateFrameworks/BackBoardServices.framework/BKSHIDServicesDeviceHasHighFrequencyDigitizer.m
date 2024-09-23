@implementation BKSHIDServicesDeviceHasHighFrequencyDigitizer

uint64_t __BKSHIDServicesDeviceHasHighFrequencyDigitizer_block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  BKSHIDServicesDeviceHasHighFrequencyDigitizer_hasHighFrequencyDigitizer = result;
  return result;
}

@end
