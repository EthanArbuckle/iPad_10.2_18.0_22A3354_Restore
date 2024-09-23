@implementation APSIsPermanentSpeakerGroupingEnabled

uint64_t __APSIsPermanentSpeakerGroupingEnabled_block_invoke()
{
  uint64_t result;

  result = APSSettingsIsFeatureEnabled(CFSTR("PermanentSpeakerGrouping"));
  APSIsPermanentSpeakerGroupingEnabled_sPSGEnabled = result;
  return result;
}

@end
