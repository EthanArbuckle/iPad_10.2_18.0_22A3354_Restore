@implementation AXDeviceSupportsVoiceBankingSpeech

uint64_t __AXDeviceSupportsVoiceBankingSpeech_block_invoke()
{
  uint64_t result;

  if ((_os_feature_enabled_impl() & 1) == 0)
    AXDeviceSupportsVoiceBankingSpeech__AXDeviceSupportsVoiceBankingSpeech = 1;
  if (soft_MGGetBoolAnswer((uint64_t)CFSTR("green-tea"))
    && (_AXDeviceIsVoicebankingAllowedForLocale(CFSTR("cmn")) & 1) == 0)
  {
    AXDeviceSupportsVoiceBankingSpeech__AXDeviceSupportsVoiceBankingSpeech = 1;
  }
  result = AXRuntimeCheck_HasANE();
  if ((result & 1) == 0)
    AXDeviceSupportsVoiceBankingSpeech__AXDeviceSupportsVoiceBankingSpeech = 1;
  return result;
}

@end
