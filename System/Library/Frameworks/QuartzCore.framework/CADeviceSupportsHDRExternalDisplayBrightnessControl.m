@implementation CADeviceSupportsHDRExternalDisplayBrightnessControl

uint64_t __CADeviceSupportsHDRExternalDisplayBrightnessControl_block_invoke()
{
  uint64_t result;

  result = _os_feature_enabled_impl();
  CADeviceSupportsHDRExternalDisplayBrightnessControl::enabled = result;
  return result;
}

@end
