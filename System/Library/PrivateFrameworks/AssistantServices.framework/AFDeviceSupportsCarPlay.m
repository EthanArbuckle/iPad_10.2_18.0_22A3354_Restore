@implementation AFDeviceSupportsCarPlay

uint64_t __AFDeviceSupportsCarPlay_block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  AFDeviceSupportsCarPlay_supportsCarPlay = result;
  return result;
}

@end
