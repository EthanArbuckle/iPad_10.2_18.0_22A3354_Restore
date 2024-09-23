@implementation DCSDictionaryAssetAttributesWillBePurged

void __DCSDictionaryAssetAttributesWillBePurged_block_invoke(uint64_t a1)
{
  __DCSDictionaryAssetUpdatePreferences(*(const void **)(a1 + 32), 1);
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

@end
