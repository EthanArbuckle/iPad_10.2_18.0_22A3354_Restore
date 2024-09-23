@implementation GEOMapAssetMetadata

- (GEOMapAssetMetadata)initWithVectorTiles:(id)a3 enableASTCTextures:(BOOL)a4
{
  id v7;
  GEOMapAssetMetadata *v8;
  GEOMapAssetMetadata *v9;
  GEOMapAssetMetadata *v10;
  objc_super v12;

  v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)GEOMapAssetMetadata;
  v8 = -[GEOMapAssetMetadata init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_tiles, a3);
    v9->_enableASTCTextures = a4;
    v10 = v9;
  }

  return v9;
}

- (id)keysForMetroAvailability:(BOOL)a3
{
  _BOOL4 v3;
  GEOTileKeyList *v5;
  uint64_t v6;
  uint64_t v7;
  unsigned __int8 v8;
  unsigned int v9;
  uint64_t i;
  void *v11;
  _BOOL4 enableASTCTextures;
  GEOTileKeyList *v13;
  id v14;
  void *v15;
  uint64_t v16;
  std::__shared_weak_count *v17;
  unint64_t *p_shared_owners;
  unint64_t v19;
  NSArray *obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;
  std::__shared_weak_count *v27;
  _BYTE v28[128];
  uint64_t v29;

  v3 = a3;
  v29 = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc_init(GEOTileKeyList);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = self->_tiles;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v23;
    if (v3)
      v8 = 2;
    else
      v8 = 1;
    v9 = v8;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v23 != v7)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        enableASTCTextures = self->_enableASTCTextures;
        v13 = v5;
        v14 = v11;
        v15 = v14;
        if (v14)
        {
          objc_msgSend(v14, "vectorTilePtr");
          if (v26)
          {
            v16 = *(_QWORD *)(v26 + 2240);
            if (v16)
            {
              _addAssetsForMarketMask(v13, *(_QWORD *)(v26 + 2240), 3u, enableASTCTextures);
              _addAssetsForMarketMask(v13, v16, v9, enableASTCTextures);
            }
          }
        }
        else
        {
          v26 = 0;
          v27 = 0;
        }
        v17 = v27;
        if (v27)
        {
          p_shared_owners = (unint64_t *)&v27->__shared_owners_;
          do
            v19 = __ldaxr(p_shared_owners);
          while (__stlxr(v19 - 1, p_shared_owners));
          if (!v19)
          {
            ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
            std::__shared_weak_count::__release_weak(v17);
          }
        }

      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
    }
    while (v6);
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tiles, 0);
}

@end
