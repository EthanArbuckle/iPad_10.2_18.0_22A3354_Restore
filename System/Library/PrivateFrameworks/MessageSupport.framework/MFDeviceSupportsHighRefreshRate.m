@implementation MFDeviceSupportsHighRefreshRate

uint64_t __MFDeviceSupportsHighRefreshRate_block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  MFDeviceSupportsHighRefreshRate_deviceSupportsHighRefreshRate = result;
  return result;
}

@end
