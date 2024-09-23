@implementation SetCachedAssetPropertyValue

void __remoteXPCAsset_SetCachedAssetPropertyValue_block_invoke(uint64_t a1)
{
  const void *v2;
  const void *v3;

  FigCFDictionarySetInt32();
  v2 = *(const void **)(a1 + 40);
  if (!CFEqual(CFSTR("assetProperty_MakeReadAheadAssertionWhenCreatingByteStream"), v2)
    && !CFEqual(CFSTR("assetProperty_OriginalReadAheadAssertion"), v2)
    && !CFEqual(CFSTR("assetProperty_FormatReader"), v2))
  {
    if (*(_QWORD *)(a1 + 48))
      v3 = *(const void **)(a1 + 48);
    else
      v3 = (const void *)*MEMORY[0x1E0C9B0D0];
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(*(_QWORD *)(a1 + 32) + 32), *(const void **)(a1 + 40), v3);
  }
}

@end
