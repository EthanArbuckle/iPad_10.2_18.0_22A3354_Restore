@implementation APSAudioFormatDescriptionIsBufferedLossless20bitSupported

uint64_t __APSAudioFormatDescriptionIsBufferedLossless20bitSupported_block_invoke()
{
  uint64_t result;

  result = FigGetCFPreferenceNumberWithDefault();
  if ((_BYTE)result)
    APSAudioFormatDescriptionIsBufferedLossless20bitSupported_lossless20bitSupported = 1;
  return result;
}

@end
