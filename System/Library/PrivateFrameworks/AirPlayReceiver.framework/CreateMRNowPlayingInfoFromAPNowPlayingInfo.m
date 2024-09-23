@implementation CreateMRNowPlayingInfoFromAPNowPlayingInfo

void ___CreateMRNowPlayingInfoFromAPNowPlayingInfo_block_invoke(uint64_t a1, void *key, const void *a3)
{
  const void *Value;
  const void *v7;

  if (_getMetadataKeyMap_s_onceToken != -1)
    dispatch_once(&_getMetadataKeyMap_s_onceToken, &__block_literal_global_144);
  Value = CFDictionaryGetValue((CFDictionaryRef)_getMetadataKeyMap_s_metadataKeyMap, key);
  if (Value)
  {
    v7 = Value;
    if (!CFEqual((CFTypeRef)*MEMORY[0x24BDBD430], a3))
      CFDictionaryAddValue(*(CFMutableDictionaryRef *)(a1 + 32), v7, a3);
  }
}

@end
