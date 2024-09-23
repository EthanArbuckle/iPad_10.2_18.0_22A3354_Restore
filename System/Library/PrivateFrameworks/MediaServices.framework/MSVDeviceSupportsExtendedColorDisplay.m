@implementation MSVDeviceSupportsExtendedColorDisplay

uint64_t __MSVDeviceSupportsExtendedColorDisplay_block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  MSVDeviceSupportsExtendedColorDisplay___deviceSupportsExtendedColorDisplay = result;
  return result;
}

@end
