@implementation APAudioFormatAPACIsAllowedForCurrentDeviceAsSender

void __APAudioFormatAPACIsAllowedForCurrentDeviceAsSender_block_invoke()
{
  if (IsAppleTV() && MGGetProductType() != 1110205732)
    goto LABEL_12;
  if (APSIsAPMSpeaker_sCheckOnce != -1)
    dispatch_once(&APSIsAPMSpeaker_sCheckOnce, &__block_literal_global_9);
  if (APSIsAPMSpeaker_sIsAPMSpeaker)
    goto LABEL_12;
  if (APSIsIPhone_onceToken != -1)
    dispatch_once(&APSIsIPhone_onceToken, &__block_literal_global_18);
  if ((APSIsIPhone_sIsiPhone & 1) != 0)
    goto LABEL_12;
  if (APSIsIPad_onceToken != -1)
    dispatch_once(&APSIsIPad_onceToken, &__block_literal_global_19);
  if (APSIsIPad_sIsiPad == 1)
LABEL_12:
    APAudioFormatAPACIsAllowedForCurrentDeviceAsSender_apacAllowed = 1;
}

@end
