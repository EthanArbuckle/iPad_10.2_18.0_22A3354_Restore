@implementation AXDeviceSupportsHapticMusic

uint64_t __AXDeviceSupportsHapticMusic_block_invoke()
{
  uint64_t result;

  result = _os_feature_enabled_impl();
  if ((_DWORD)result)
  {
    if ((MGIsDeviceOneOfType() & 1) != 0)
      result = 0;
    else
      result = MGGetBoolAnswer();
    AXDeviceSupportsHapticMusic_Supported = result;
  }
  return result;
}

@end
