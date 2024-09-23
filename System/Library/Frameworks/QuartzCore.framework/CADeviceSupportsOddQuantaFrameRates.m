@implementation CADeviceSupportsOddQuantaFrameRates

uint64_t __CADeviceSupportsOddQuantaFrameRates_block_invoke()
{
  uint64_t result;

  result = MGIsDeviceOneOfType();
  if ((_DWORD)result)
  {
    result = _os_feature_enabled_impl();
    CADeviceSupportsOddQuantaFrameRates::enabled = result;
  }
  return result;
}

@end
