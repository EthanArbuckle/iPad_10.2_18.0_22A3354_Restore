@implementation NFDeviceHasExtendedColorDisplay

uint64_t __NFDeviceHasExtendedColorDisplay_block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  NFDeviceHasExtendedColorDisplay_hasExtendedColorDisplay = result;
  return result;
}

@end
