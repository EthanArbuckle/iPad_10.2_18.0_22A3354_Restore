@implementation AVAssetDownloadCache

- (AVAssetDownloadCache)initWithAsset:(id)a3
{
  AVAssetDownloadCache *v4;
  AVAssetDownloadCacheInternal *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AVAssetDownloadCache;
  v4 = -[AVAssetCache _init](&v7, sel__init);
  if (v4)
  {
    v5 = objc_alloc_init(AVAssetDownloadCacheInternal);
    v4->_internal = v5;
    if (!v5 || (objc_msgSend(a3, "_figAsset"), FigAssetCacheInspectorCreate_Remote()))
    {

      return 0;
    }
  }
  return v4;
}

- (BOOL)isPlayableOffline
{
  uint64_t CMBaseObject;
  void (*v3)(uint64_t, _QWORD, _QWORD, _QWORD);
  void (*v5)(uint64_t, _QWORD, _QWORD, _QWORD);

  v5 = 0;
  CMBaseObject = FigAssetCacheInspectorGetCMBaseObject();
  v3 = *(void (**)(uint64_t, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 48);
  if (v3)
  {
    v3(CMBaseObject, *MEMORY[0x1E0CC33D0], *MEMORY[0x1E0C9AE00], &v5);
    v3 = v5;
  }
  return v3 == (void (*)(uint64_t, _QWORD, _QWORD, _QWORD))*MEMORY[0x1E0C9AE50];
}

- (id)_asset
{
  return objc_loadWeak((id *)&self->_internal->asset);
}

- (id)URL
{
  uint64_t CMBaseObject;
  void (*v3)(uint64_t, _QWORD, _QWORD, void **);
  void *v4;
  void *v6;

  v6 = 0;
  CMBaseObject = FigAssetCacheInspectorGetCMBaseObject();
  v3 = *(void (**)(uint64_t, _QWORD, _QWORD, void **))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 48);
  if (v3)
  {
    v3(CMBaseObject, *MEMORY[0x1E0CC33C8], *MEMORY[0x1E0C9AE00], &v6);
    v4 = v6;
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)mediaSelectionOptionsInMediaSelectionGroup:(id)a3
{
  void *v5;
  CMBaseObject *assetCacheInspector;
  uint64_t v7;
  void (*v8)(CMBaseObject *, uint64_t, _QWORD, id *);
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  _QWORD v18[5];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  id v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v23 = 0;
  assetCacheInspector = self->_internal->assetCacheInspector;
  v7 = objc_msgSend(a3, "dictionary");
  v8 = *(void (**)(CMBaseObject *, uint64_t, _QWORD, id *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 8);
  if (v8)
  {
    v8(assetCacheInspector, v7, 0, &v23);
    v9 = v23;
  }
  else
  {
    v9 = 0;
  }
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v20;
    v13 = MEMORY[0x1E0C809B0];
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v20 != v12)
          objc_enumerationMutation(v9);
        v15 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v14);
        v16 = (void *)objc_msgSend(a3, "options");
        v18[0] = v13;
        v18[1] = 3221225472;
        v18[2] = __67__AVAssetDownloadCache_mediaSelectionOptionsInMediaSelectionGroup___block_invoke;
        v18[3] = &unk_1E3034928;
        v18[4] = v15;
        objc_msgSend(v5, "addObject:", objc_msgSend((id)objc_msgSend(a3, "options"), "objectAtIndex:", objc_msgSend(v16, "indexOfObjectPassingTest:", v18)));
        ++v14;
      }
      while (v11 != v14);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v11);
  }

  return (id)objc_msgSend(v5, "copy");
}

uint64_t __67__AVAssetDownloadCache_mediaSelectionOptionsInMediaSelectionGroup___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isEqualToDictionary:", objc_msgSend(a2, "dictionary"));
  if ((_DWORD)result)
    *a4 = 1;
  return result;
}

- (void)dealloc
{
  AVAssetDownloadCacheInternal *internal;
  CMBaseObject *assetCacheInspector;
  objc_super v5;

  internal = self->_internal;
  if (internal)
  {
    assetCacheInspector = internal->assetCacheInspector;
    if (assetCacheInspector)
    {
      CFRelease(assetCacheInspector);
      internal = self->_internal;
    }

  }
  v5.receiver = self;
  v5.super_class = (Class)AVAssetDownloadCache;
  -[AVAssetDownloadCache dealloc](&v5, sel_dealloc);
}

- (BOOL)isDefunct
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v5)(uint64_t, unsigned __int8 *);
  int v6;
  int v7;
  CMBaseObject *assetCacheInspector;
  _QWORD *v9;
  unsigned int (*v10)(CMBaseObject *, unsigned __int8 *);
  unsigned __int8 v12;

  v12 = 0;
  if (-[AVAssetDownloadCache _asset](self, "_asset"))
  {
    v3 = objc_msgSend(-[AVAssetDownloadCache _asset](self, "_asset"), "_figAsset");
    v4 = *(_QWORD **)(CMBaseObjectGetVTable() + 8);
    if (*v4 < 5uLL)
      goto LABEL_9;
    v5 = (uint64_t (*)(uint64_t, unsigned __int8 *))v4[11];
    if (!v5)
      goto LABEL_9;
    v6 = v5(v3, &v12);
    v7 = v12;
    if (v12)
      return v7 == 1;
    if (v6)
    {
LABEL_9:
      v7 = 1;
      return v7 == 1;
    }
  }
  assetCacheInspector = self->_internal->assetCacheInspector;
  v9 = *(_QWORD **)(CMBaseObjectGetVTable() + 8);
  if (*v9 < 5uLL)
  {
    LOBYTE(v10) = 0;
  }
  else
  {
    v10 = (unsigned int (*)(CMBaseObject *, unsigned __int8 *))v9[11];
    if (v10)
      LOBYTE(v10) = v10(assetCacheInspector, &v12) == 0;
  }
  if ((v10 & 1) != 0)
    v7 = v12;
  else
    v7 = 1;
  if (v12)
    v7 = v12;
  return v7 == 1;
}

@end
