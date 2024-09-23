@implementation MSVDeviceHasCellularBaseband

uint64_t __MSVDeviceHasCellularBaseband_block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  MSVDeviceHasCellularBaseband___deviceHasCellularBaseband = result;
  return result;
}

@end
