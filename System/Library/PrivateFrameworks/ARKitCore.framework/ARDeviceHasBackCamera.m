@implementation ARDeviceHasBackCamera

uint64_t __ARDeviceHasBackCamera_block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  ARDeviceHasBackCamera_s_deviceHasBackCamera = result;
  return result;
}

@end
