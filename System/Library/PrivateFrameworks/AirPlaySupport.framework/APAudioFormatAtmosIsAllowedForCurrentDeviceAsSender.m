@implementation APAudioFormatAtmosIsAllowedForCurrentDeviceAsSender

void __APAudioFormatAtmosIsAllowedForCurrentDeviceAsSender_block_invoke()
{
  if (APSSettingsIsFeatureEnabled(CFSTR("BufferedSurround")))
    APAudioFormatAtmosIsAllowedForCurrentDeviceAsSender_atmosAllowed = 1;
  if (IsAppleTV() && MGGetProductType() != 1110205732)
    goto LABEL_8;
  if (APSIsAPMSpeaker_sCheckOnce != -1)
    dispatch_once(&APSIsAPMSpeaker_sCheckOnce, &__block_literal_global_9);
  if (APSIsAPMSpeaker_sIsAPMSpeaker)
LABEL_8:
    APAudioFormatAtmosIsAllowedForCurrentDeviceAsSender_atmosAllowed = 1;
}

@end
