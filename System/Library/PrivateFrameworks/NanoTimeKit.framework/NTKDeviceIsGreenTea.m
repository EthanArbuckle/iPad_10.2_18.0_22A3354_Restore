@implementation NTKDeviceIsGreenTea

uint64_t __NTKDeviceIsGreenTea_block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  NTKDeviceIsGreenTea_deviceIsGreenTea = result;
  return result;
}

@end
