@implementation AFDeviceSupportsUSBTypeCDisplay

uint64_t __AFDeviceSupportsUSBTypeCDisplay_block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  AFDeviceSupportsUSBTypeCDisplay_supportsAppleDisplay = result;
  return result;
}

@end
