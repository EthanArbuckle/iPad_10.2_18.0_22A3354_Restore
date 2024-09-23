@implementation APSAudioFormatDescriptionListAddSupportedFormatsForPassthrough

uint64_t __APSAudioFormatDescriptionListAddSupportedFormatsForPassthrough_block_invoke()
{
  uint64_t result;

  APSAudioFormatDescriptionListAddSupportedFormatsForPassthrough_sPassthroughEnabled = APSSettingsIsFeatureEnabled(CFSTR("BufferedPassthrough"));
  APSAudioFormatDescriptionListAddSupportedFormatsForPassthrough_sPassthroughDDPAtmosEnabled = APSSettingsIsFeatureEnabled(CFSTR("BufferedPassthroughDDP"));
  result = APSSettingsIsFeatureEnabled(CFSTR("BufferedPassthroughEncrypted"));
  APSAudioFormatDescriptionListAddSupportedFormatsForPassthrough_sPassthroughEncryptedEnabled = result;
  return result;
}

@end
