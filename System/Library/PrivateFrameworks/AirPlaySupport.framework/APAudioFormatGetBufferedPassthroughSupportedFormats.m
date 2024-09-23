@implementation APAudioFormatGetBufferedPassthroughSupportedFormats

uint64_t __APAudioFormatGetBufferedPassthroughSupportedFormats_block_invoke()
{
  uint64_t result;

  APAudioFormatGetBufferedPassthroughSupportedFormats_sPassthroughEnabled = APSSettingsIsFeatureEnabled(CFSTR("BufferedPassthrough"));
  APAudioFormatGetBufferedPassthroughSupportedFormats_sPassthroughDDPAtmosEnabled = APSSettingsIsFeatureEnabled(CFSTR("BufferedPassthroughDDP"));
  result = APSSettingsIsFeatureEnabled(CFSTR("BufferedPassthroughEncrypted"));
  APAudioFormatGetBufferedPassthroughSupportedFormats_sPassthroughEncryptedEnabled = result;
  return result;
}

@end
