@implementation HandleCachedPropertyLoaded

void __remoteXPCAssetClient_HandleCachedPropertyLoaded_block_invoke(uint64_t a1)
{
  const void *v2;

  FigCFDictionarySetInt32();
  if (*(_QWORD *)(a1 + 48) && !*(_DWORD *)(a1 + 64))
  {
    if (*(_QWORD *)(a1 + 56))
      v2 = *(const void **)(a1 + 56);
    else
      v2 = (const void *)*MEMORY[0x1E0C9B0D0];
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(*(_QWORD *)(a1 + 32) + 32), *(const void **)(a1 + 40), v2);
  }
}

void __remoteXPCAssetTrackClient_HandleCachedPropertyLoaded_block_invoke(uint64_t a1)
{
  const void *v2;

  FigCFDictionarySetInt32();
  if (*(_QWORD *)(a1 + 48) && !*(_DWORD *)(a1 + 64))
  {
    if (*(_QWORD *)(a1 + 56))
      v2 = *(const void **)(a1 + 56);
    else
      v2 = (const void *)*MEMORY[0x1E0C9B0D0];
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(*(_QWORD *)(a1 + 32) + 40), *(const void **)(a1 + 40), v2);
  }
}

@end
