@implementation DownloadCatalogAndRequery

void __figMobileAsset_DownloadCatalogAndRequery_block_invoke(uint64_t a1)
{
  _QWORD *Value;
  void *v3;
  const void *v4;
  const void *v5;
  const void *v6;
  const void *v7;
  uint64_t v8;
  const void *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t);
  void *v13;
  uint64_t v14;
  _QWORD *v15;
  int v16;

  if (figMobileAsset_IsAssetTypeRegistered(*(void **)(a1 + 32)))
  {
    Value = CFDictionaryGetValue((CFDictionaryRef)gRegisteredAssetTypes, *(const void **)(a1 + 32));
    if (CFAbsoluteTimeGetCurrent() - *((double *)Value + 6) > *((double *)Value + 5))
    {
      figMobileAsset_UpdateLastUpdatedTime(*(CFTypeRef *)(a1 + 32));
      v3 = (void *)MEMORY[0x193FFC34C]();
      v4 = *(const void **)(a1 + 32);
      if (v4)
        CFRetain(v4);
      v5 = (const void *)Value[1];
      if (v5)
        CFRetain(v5);
      v6 = (const void *)Value[2];
      if (v6)
        CFRetain(v6);
      v7 = (const void *)Value[3];
      if (v7)
        CFRetain(v7);
      v8 = *(_QWORD *)(a1 + 32);
      v10 = MEMORY[0x1E0C809B0];
      v11 = 3221225472;
      v12 = __figMobileAsset_DownloadCatalogAndRequery_block_invoke_2;
      v13 = &__block_descriptor_52_e8_v16__0q8l;
      v16 = *(_DWORD *)(a1 + 40);
      v14 = v8;
      v15 = Value;
      objc_msgSend((id)sMAAssetClass, "startCatalogDownload:then:");
      objc_autoreleasePoolPop(v3);
    }
  }
  v9 = *(const void **)(a1 + 32);
  if (v9)
    CFRelease(v9);
}

void __figMobileAsset_DownloadCatalogAndRequery_block_invoke_2(uint64_t a1, uint64_t a2)
{
  const void *v3;
  _QWORD *v4;
  const void *v5;
  const void *v6;
  const void *v7;

  if (!a2)
    figMobileAsset_QueryMostRecentAsset(*(_QWORD *)(a1 + 32), (*(_DWORD *)(a1 + 48) + 1), **(unsigned int **)(a1 + 40), 0, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24));
  v3 = *(const void **)(a1 + 32);
  if (v3)
    CFRelease(v3);
  v4 = *(_QWORD **)(a1 + 40);
  v5 = (const void *)v4[1];
  if (v5)
  {
    CFRelease(v5);
    v4 = *(_QWORD **)(a1 + 40);
  }
  v6 = (const void *)v4[2];
  if (v6)
  {
    CFRelease(v6);
    v4 = *(_QWORD **)(a1 + 40);
  }
  v7 = (const void *)v4[3];
  if (v7)
    CFRelease(v7);
}

@end
