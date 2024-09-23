@implementation HandleCachedPropertyFailedToLoad

void __remoteXPCAssetClient_HandleCachedPropertyFailedToLoad_block_invoke(uint64_t a1)
{
  const void *v2;

  FigCFDictionarySetInt32();
  v2 = *(const void **)(a1 + 48);
  if (v2)
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(*(_QWORD *)(a1 + 32) + 24), *(const void **)(a1 + 40), v2);
}

void __remoteXPCAssetTrackClient_HandleCachedPropertyFailedToLoad_block_invoke(uint64_t a1)
{
  const void *v2;

  FigCFDictionarySetInt32();
  v2 = *(const void **)(a1 + 48);
  if (v2)
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(*(_QWORD *)(a1 + 32) + 32), *(const void **)(a1 + 40), v2);
}

@end
