@implementation DCSDictionaryAssetAttributesDownloaded

void __DCSDictionaryAssetAttributesDownloaded_block_invoke(uint64_t a1)
{
  __DCSDictionaryAssetUpdatePreferences(*(const void **)(a1 + 32), 0);
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

@end
