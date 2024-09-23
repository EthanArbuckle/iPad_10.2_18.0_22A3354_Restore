@implementation AVTDeviceIsGreenTea

uint64_t __AVTDeviceIsGreenTea_block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  AVTDeviceIsGreenTea_deviceIsGreenTea = result;
  return result;
}

@end
