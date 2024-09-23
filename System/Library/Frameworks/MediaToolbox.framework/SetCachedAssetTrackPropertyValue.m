@implementation SetCachedAssetTrackPropertyValue

void __remoteXPCAssetTrack_SetCachedAssetTrackPropertyValue_block_invoke(uint64_t a1)
{
  const void *v2;

  FigCFDictionarySetInt32();
  if (*(_QWORD *)(a1 + 48))
    v2 = *(const void **)(a1 + 48);
  else
    v2 = (const void *)*MEMORY[0x1E0C9B0D0];
  CFDictionarySetValue(*(CFMutableDictionaryRef *)(*(_QWORD *)(a1 + 32) + 40), *(const void **)(a1 + 40), v2);
}

@end
