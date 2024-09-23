@implementation APSSettingsIsFeatureEnabled

uint64_t __APSSettingsIsFeatureEnabled_block_invoke()
{
  uint64_t result;

  APSSettingsIsFeatureEnabled_sFeatureCache = (uint64_t)CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  result = FigSimpleMutexCreate();
  APSSettingsIsFeatureEnabled_sFeatureCacheMutex = result;
  return result;
}

@end
