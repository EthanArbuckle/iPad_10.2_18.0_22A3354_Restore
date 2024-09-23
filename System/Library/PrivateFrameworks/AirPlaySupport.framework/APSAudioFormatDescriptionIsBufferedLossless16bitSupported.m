@implementation APSAudioFormatDescriptionIsBufferedLossless16bitSupported

uint64_t __APSAudioFormatDescriptionIsBufferedLossless16bitSupported_block_invoke()
{
  uint64_t result;

  result = FigGetCFPreferenceNumberWithDefault();
  if ((_BYTE)result)
    APSAudioFormatDescriptionIsBufferedLossless16bitSupported_lossless16bitSupported = 1;
  return result;
}

@end
