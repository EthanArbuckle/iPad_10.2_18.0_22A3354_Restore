@implementation AFDeviceSupportsGM

uint64_t __AFDeviceSupportsGM_block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  AFDeviceSupportsGM_isGMDevice = result;
  return result;
}

@end
