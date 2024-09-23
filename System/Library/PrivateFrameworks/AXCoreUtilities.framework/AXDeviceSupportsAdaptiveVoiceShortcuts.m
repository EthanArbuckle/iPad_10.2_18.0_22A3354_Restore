@implementation AXDeviceSupportsAdaptiveVoiceShortcuts

uint64_t __AXDeviceSupportsAdaptiveVoiceShortcuts_block_invoke()
{
  uint64_t result;

  result = _os_feature_enabled_impl();
  if ((result & 1) == 0)
    AXDeviceSupportsAdaptiveVoiceShortcuts__AXDeviceSupportsAdaptiveVoiceShortcuts = 1;
  return result;
}

@end
