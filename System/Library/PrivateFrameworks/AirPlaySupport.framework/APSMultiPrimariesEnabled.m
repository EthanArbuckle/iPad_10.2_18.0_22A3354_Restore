@implementation APSMultiPrimariesEnabled

void __APSMultiPrimariesEnabled_block_invoke()
{
  if (APSIsAPMSpeaker_sCheckOnce != -1)
    dispatch_once(&APSIsAPMSpeaker_sCheckOnce, &__block_literal_global_9);
  if (APSIsAPMSpeaker_sIsAPMSpeaker)
  {
    if (APSSettingsIsFeatureEnabledInDomain())
      APSMultiPrimariesEnabled_sMultiPrimariesEnabled = 1;
  }
}

@end
