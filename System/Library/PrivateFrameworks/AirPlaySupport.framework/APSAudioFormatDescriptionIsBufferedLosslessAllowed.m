@implementation APSAudioFormatDescriptionIsBufferedLosslessAllowed

void __APSAudioFormatDescriptionIsBufferedLosslessAllowed_block_invoke()
{
  if (FigGetCFPreferenceNumberWithDefault())
    APSAudioFormatDescriptionIsBufferedLosslessAllowed_losslessAllowed = 1;
  if (IsAppleTV())
    goto LABEL_7;
  if (APSIsAPMSpeaker_sCheckOnce != -1)
    dispatch_once(&APSIsAPMSpeaker_sCheckOnce, &__block_literal_global_9);
  if (APSIsAPMSpeaker_sIsAPMSpeaker)
LABEL_7:
    APSAudioFormatDescriptionIsBufferedLosslessAllowed_losslessAllowed = 1;
}

@end
