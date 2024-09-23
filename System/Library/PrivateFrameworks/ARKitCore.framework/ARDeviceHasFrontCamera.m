@implementation ARDeviceHasFrontCamera

uint64_t __ARDeviceHasFrontCamera_block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  ARDeviceHasFrontCamera_s_deviceHasFrontCamera = result;
  return result;
}

@end
