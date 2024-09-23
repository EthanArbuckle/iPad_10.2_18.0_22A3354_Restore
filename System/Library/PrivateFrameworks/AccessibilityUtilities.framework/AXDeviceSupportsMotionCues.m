@implementation AXDeviceSupportsMotionCues

uint64_t __AXDeviceSupportsMotionCues_block_invoke()
{
  uint64_t result;

  result = _os_feature_enabled_impl();
  if ((_DWORD)result)
    AXDeviceSupportsMotionCues_DeviceSupportsMotionCues = 1;
  return result;
}

@end
