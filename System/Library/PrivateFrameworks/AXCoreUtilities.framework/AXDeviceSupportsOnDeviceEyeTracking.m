@implementation AXDeviceSupportsOnDeviceEyeTracking

uint64_t __AXDeviceSupportsOnDeviceEyeTracking_block_invoke()
{
  uint64_t result;

  result = AXRuntimeCheck_isANEDeviceH13plus();
  if ((_DWORD)result)
    result = _os_feature_enabled_impl();
  AXDeviceSupportsOnDeviceEyeTracking__AXDeviceSupportsOnDeviceEyeTracking = result;
  return result;
}

@end
