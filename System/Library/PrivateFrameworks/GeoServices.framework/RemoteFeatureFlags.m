@implementation RemoteFeatureFlags

uint64_t MapsFeaturesConfig_RemoteFeatureFlags_Metadata_block_invoke()
{
  return objc_msgSend(MEMORY[0x1E0C99E60], "set");
}

@end
