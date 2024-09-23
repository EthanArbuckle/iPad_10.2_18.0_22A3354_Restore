@implementation APAudioFormatAtmosIsAllowedForCurrentDeviceAsReceiver

void __APAudioFormatAtmosIsAllowedForCurrentDeviceAsReceiver_block_invoke()
{
  if (APSSettingsIsFeatureEnabled(CFSTR("BufferedSurround")))
    APAudioFormatAtmosIsAllowedForCurrentDeviceAsReceiver_atmosAllowed = 1;
  if (IsAppleTV() && MGGetProductType() != 1110205732)
    APAudioFormatAtmosIsAllowedForCurrentDeviceAsReceiver_atmosAllowed = 1;
  if (APSIsAPMSpeaker_sCheckOnce != -1)
    dispatch_once(&APSIsAPMSpeaker_sCheckOnce, &__block_literal_global_9);
  if (APSIsAPMSpeaker_sIsAPMSpeaker)
    APAudioFormatAtmosIsAllowedForCurrentDeviceAsReceiver_atmosAllowed = 1;
}

@end
