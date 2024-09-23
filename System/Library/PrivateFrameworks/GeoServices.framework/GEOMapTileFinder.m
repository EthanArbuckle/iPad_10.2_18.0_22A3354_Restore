@implementation GEOMapTileFinder

- (id)_initWithMap:(id)a3 zoomLevel:(unint64_t)a4 tileSize:(int)a5 tileScale:(int)a6 tileStyle:(int)a7 center:(id)a8 radius:(double)a9
{
  double var1;
  double var0;
  id result;
  objc_super v17;

  var1 = a8.var1;
  var0 = a8.var0;
  v17.receiver = self;
  v17.super_class = (Class)GEOMapTileFinder;
  result = -[GEOMapRequest initWithManager:](&v17, sel_initWithManager_, a3);
  if (result)
  {
    *((_QWORD *)result + 5) = a4;
    *((_DWORD *)result + 12) = a5;
    *((_DWORD *)result + 13) = a6;
    *((_DWORD *)result + 14) = a7;
    *((double *)result + 8) = var0;
    *((double *)result + 9) = var1;
    *((double *)result + 10) = a9;
  }
  return result;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)GEOMapTileFinder;
  -[GEOMapRequest dealloc](&v2, sel_dealloc);
}

+ (id)realisticTileFinderForMap:(id)a3 center:(id)a4 radius:(double)a5
{
  double var1;
  double var0;
  id v9;
  uint64_t v10;
  void *v11;

  var1 = a4.var1;
  var0 = a4.var0;
  v9 = a3;
  if (+[GEOMapAccess supportsRoadMapAccess](GEOMapAccess, "supportsRoadMapAccess"))
  {
    if (objc_msgSend(v9, "useMapMatchingTilesetForRoads"))
      v10 = 53;
    else
      v10 = 18;
    v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithMap:zoomLevel:tileSize:tileScale:tileStyle:center:radius:", v9, objc_msgSend(v9, "roadsZoomLevel"), 2, 0, v10, var0, var1, a5);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)detailedTransitTileFinderForMap:(id)a3 center:(id)a4 radius:(double)a5
{
  double var1;
  double var0;
  id v9;
  void *v10;

  var1 = a4.var1;
  var0 = a4.var0;
  v9 = a3;
  v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithMap:zoomLevel:tileSize:tileScale:tileStyle:center:radius:", v9, objc_msgSend(v9, "transitZoomLevel"), 2, 0, 37, var0, var1, a5);

  return v10;
}

+ (id)transitGeometryTileFinderForMap:(id)a3 center:(id)a4 radius:(double)a5
{
  double var1;
  double var0;
  id v9;
  void *v10;

  var1 = a4.var1;
  var0 = a4.var0;
  v9 = a3;
  v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithMap:zoomLevel:tileSize:tileScale:tileStyle:center:radius:", v9, objc_msgSend(v9, "transitZoomLevel"), 2, 0, 1, var0, var1, a5);

  return v10;
}

+ (id)buildingsTileFinderForMap:(id)a3 center:(id)a4 radius:(double)a5
{
  double var1;
  double var0;
  id v9;
  void *v10;

  var1 = a4.var1;
  var0 = a4.var0;
  v9 = a3;
  v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithMap:zoomLevel:tileSize:tileScale:tileStyle:center:radius:", v9, objc_msgSend(v9, "buildingsZoomLevel"), 2, 0, 11, var0, var1, a5);

  return v10;
}

- (void)cancel
{
  void *v3;
  NSObject *v4;
  _QWORD block[5];

  -[GEOMapTileFinder map](self, "map");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "callbackQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __26__GEOMapTileFinder_cancel__block_invoke;
  block[3] = &unk_1E1C00178;
  block[4] = self;
  dispatch_async(v4, block);

}

id __26__GEOMapTileFinder_cancel__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  objc_super v5;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 96) = 1;
  +[GEOTileLoader modernLoader](GEOTileLoader, "modernLoader");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  GEOTileLoaderClientIdentifier(*(void **)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cancelAllForClient:", v3);

  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)GEOMapTileFinder;
  return objc_msgSendSuper2(&v5, sel_cancel);
}

- (GEOMapAccess)map
{
  return (GEOMapAccess *)self->super._requestManager;
}

- (void)_fetchDataForKeys:(const void *)a3
{
  void *v5;
  int v6;
  uint64_t v7;
  uint64_t *i;
  void *v9;
  BOOL v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _BOOL4 v17;
  void *v18;
  NSObject *v19;
  _QWORD v20[6];
  _QWORD block[5];
  _QWORD v22[3];
  __int128 v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (!-[GEOMapRequest isFinished](self, "isFinished"))
  {
    v22[0] = 0;
    v22[1] = v22;
    v22[2] = 0x2020000000;
    if (*((_QWORD *)a3 + 3))
    {
      -[GEOMapTileFinder map](self, "map");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "allowsNetworkTileLoad");

      if (v6)
        v7 = 3;
      else
        v7 = 1;
      for (i = (uint64_t *)*((_QWORD *)a3 + 2); i; i = (uint64_t *)*i)
      {
        v24 = *((_OWORD *)i + 1);
        if (self->_isCanceling)
          break;
        if (self->super._isFinished)
          break;
        -[GEOMapTileFinder map](self, "map");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v9 == 0;

        if (v10)
          break;
        +[GEOTileLoader modernLoader](GEOTileLoader, "modernLoader");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        GEOTileLoaderClientIdentifier(self);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[GEOMapTileFinder map](self, "map");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "callbackQueue");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v20[0] = MEMORY[0x1E0C809B0];
        v20[1] = 3221225472;
        v20[2] = __38__GEOMapTileFinder__fetchDataForKeys___block_invoke_2;
        v20[3] = &unk_1E1C0CE48;
        v20[4] = self;
        v20[5] = v22;
        objc_msgSend(v11, "loadKey:priority:forClient:options:reason:callbackQ:beginNetwork:callback:", &v24, 2147483646, v12, v7, 4, v14, 0, v20);

      }
    }
    else if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread")
           && (-[GEOMapTileFinder map](self, "map"),
               v15 = (void *)objc_claimAutoreleasedReturnValue(),
               objc_msgSend(v15, "callbackQueue"),
               v16 = (void *)objc_claimAutoreleasedReturnValue(),
               v17 = v16 == (void *)MEMORY[0x1E0C80D38],
               v16,
               v15,
               v17))
    {
      -[GEOMapRequest complete](self, "complete");
    }
    else
    {
      -[GEOMapTileFinder map](self, "map");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "callbackQueue");
      v19 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __38__GEOMapTileFinder__fetchDataForKeys___block_invoke;
      block[3] = &unk_1E1C00178;
      block[4] = self;
      dispatch_async(v19, block);

    }
    _Block_object_dispose(v22, 8);
  }
}

uint64_t __38__GEOMapTileFinder__fetchDataForKeys___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "complete");
}

void __38__GEOMapTileFinder__fetchDataForKeys___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, void *a6)
{
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void (**v16)(_QWORD, _QWORD, _QWORD);
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;

  v20 = a3;
  v10 = a5;
  v11 = a6;
  v12 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v12 + 96) || *(_BYTE *)(v12 + 32))
    goto LABEL_11;
  if (v10)
  {
    objc_msgSend((id)v12, "map");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "tileErrorHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
      goto LABEL_9;
    objc_msgSend(*(id *)(a1 + 32), "map");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "tileErrorHandler");
    v16 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, uint64_t, id))v16)[2](v16, a2, v10);

  }
  else
  {
    v17 = *(_QWORD *)(v12 + 88);
    if (!v17)
      goto LABEL_9;
    objc_msgSend(v20, "decodedRepresentation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v17 + 16))(v17, v15);
  }

LABEL_9:
  v18 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v19 = *(_QWORD *)(v18 + 24) - 1;
  *(_QWORD *)(v18 + 24) = v19;
  if (!v19)
    objc_msgSend(*(id *)(a1 + 32), "complete");
LABEL_11:

}

- (uint64_t)findTiles:(uint64_t)a3 excludingKey:(uint64_t)a4
{
  double v6;
  double v7;
  double v8;
  int v9;
  unsigned int v10;
  int v11;
  uint64_t v12;
  _QWORD v14[6];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, _QWORD *);
  uint64_t (*v19)(uint64_t);
  _OWORD v20[2];
  uint64_t v21;
  int v22;

  objc_msgSend((id)a1, "setTileHandler:");
  v15 = 0;
  v16 = &v15;
  v17 = 0x5812000000;
  v18 = __Block_byref_object_copy__52;
  v19 = __Block_byref_object_dispose__52;
  memset(v20, 0, sizeof(v20));
  v21 = 0;
  v22 = 1065353216;
  v6 = *(double *)(a1 + 64);
  v7 = *(double *)(a1 + 72);
  v8 = *(double *)(a1 + 80);
  v9 = *(_DWORD *)(a1 + 40);
  v10 = *(_DWORD *)(a1 + 56);
  v11 = *(_DWORD *)(a1 + 48);
  v12 = *(unsigned int *)(a1 + 52);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __43__GEOMapTileFinder_findTiles_excludingKey___block_invoke;
  v14[3] = &unk_1E1C0CE70;
  v14[4] = &v15;
  v14[5] = a4;
  GEOTileKeysForCoordinate(v9, v10, v11, v12, v14, v6, v7, v8);
  objc_msgSend((id)a1, "_fetchDataForKeys:", v16 + 6);
  _Block_object_dispose(&v15, 8);
  return std::__hash_table<std::__hash_value_type<unsigned int,zilch::HuffmanCode::KeyInfo>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,zilch::HuffmanCode::KeyInfo>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,zilch::HuffmanCode::KeyInfo>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,zilch::HuffmanCode::KeyInfo>>>::~__hash_table((uint64_t)v20 + 8);
}

_QWORD *__43__GEOMapTileFinder_findTiles_excludingKey___block_invoke(_QWORD *result, _QWORD *a2)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;

  v2 = (uint64_t *)result[5];
  if (!v2)
    return std::__hash_table<_GEOTileKey,std::hash<_GEOTileKey>,std::equal_to<_GEOTileKey>,std::allocator<_GEOTileKey>>::__emplace_unique_key_args<_GEOTileKey,_GEOTileKey const&>(*(_QWORD *)(result[4] + 8) + 48, a2, a2);
  v4 = *v2;
  v3 = v2[1];
  if (*a2 != v4 || a2[1] != v3)
    return std::__hash_table<_GEOTileKey,std::hash<_GEOTileKey>,std::equal_to<_GEOTileKey>,std::allocator<_GEOTileKey>>::__emplace_unique_key_args<_GEOTileKey,_GEOTileKey const&>(*(_QWORD *)(result[4] + 8) + 48, a2, a2);
  return result;
}

- (uint64_t)findTilesAdjacentToTile:(uint64_t)a3 containingPoint:(float *)a4 tileHandler:(uint64_t)a5
{
  uint64_t v8;
  int v9;
  float v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  __int128 v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "setTileHandler:", a5);
  if (*a4 >= 0.00000011921)
  {
    if ((float)(1.0 - *a4) >= 0.00000011921)
    {
      v9 = 0;
      v8 = 0;
    }
    else
    {
      v9 = 1;
      v8 = 1;
    }
  }
  else
  {
    v8 = 0xFFFFFFFFLL;
    v9 = 1;
  }
  v10 = a4[1];
  if (v10 >= 0.00000011921)
  {
    if ((float)(1.0 - v10) >= 0.00000011921)
    {
      v17 = 0u;
      v18 = 0u;
      LODWORD(v19) = 1065353216;
      if (!v9)
        goto LABEL_15;
      v11 = 0;
LABEL_14:
      *(_QWORD *)&v20 = objc_msgSend(a1, "_adjacentTileKey:dirX:dirY:", a3, v8, v11, v17, v18, v19);
      *((_QWORD *)&v20 + 1) = v15;
      std::__hash_table<_GEOTileKey,std::hash<_GEOTileKey>,std::equal_to<_GEOTileKey>,std::allocator<_GEOTileKey>>::__emplace_unique_key_args<_GEOTileKey,_GEOTileKey>((uint64_t)&v17, &v20, &v20);
      goto LABEL_15;
    }
    v11 = 0xFFFFFFFFLL;
  }
  else
  {
    v11 = 1;
  }
  v17 = 0u;
  v18 = 0u;
  LODWORD(v19) = 1065353216;
  if ((v9 & 1) == 0)
    goto LABEL_14;
  *(_QWORD *)&v20 = objc_msgSend(a1, "_adjacentTileKey:dirX:dirY:", a3, v8, 0, v17, v18, v19);
  *((_QWORD *)&v20 + 1) = v12;
  std::__hash_table<_GEOTileKey,std::hash<_GEOTileKey>,std::equal_to<_GEOTileKey>,std::allocator<_GEOTileKey>>::__emplace_unique_key_args<_GEOTileKey,_GEOTileKey>((uint64_t)&v17, &v20, &v20);
  *(_QWORD *)&v20 = objc_msgSend(a1, "_adjacentTileKey:dirX:dirY:", a3, 0, v11);
  *((_QWORD *)&v20 + 1) = v13;
  std::__hash_table<_GEOTileKey,std::hash<_GEOTileKey>,std::equal_to<_GEOTileKey>,std::allocator<_GEOTileKey>>::__emplace_unique_key_args<_GEOTileKey,_GEOTileKey>((uint64_t)&v17, &v20, &v20);
  *(_QWORD *)&v20 = objc_msgSend(a1, "_adjacentTileKey:dirX:dirY:", a3, v8, v11);
  *((_QWORD *)&v20 + 1) = v14;
  std::__hash_table<_GEOTileKey,std::hash<_GEOTileKey>,std::equal_to<_GEOTileKey>,std::allocator<_GEOTileKey>>::__emplace_unique_key_args<_GEOTileKey,_GEOTileKey>((uint64_t)&v17, &v20, &v20);
LABEL_15:
  objc_msgSend(a1, "_fetchDataForKeys:", &v17);
  return std::__hash_table<std::__hash_value_type<unsigned int,zilch::HuffmanCode::KeyInfo>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,zilch::HuffmanCode::KeyInfo>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,zilch::HuffmanCode::KeyInfo>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,zilch::HuffmanCode::KeyInfo>>>::~__hash_table((uint64_t)&v17);
}

- (void)findTiles:(id)a3
{
  -[GEOMapTileFinder findTiles:excludingKey:](self, "findTiles:excludingKey:", a3, 0);
}

- (unint64_t)_adjacentTileKey:(uint64_t)a3 dirX:(int)a4 dirY:
{
  unsigned int v7;
  unint64_t v8;
  __int128 v11;

  GEOTileKeyAssertIsStandard(a3);
  v7 = *(_DWORD *)(a1 + 56);
  v8 = 128;
  if (v7 > 0x19 || ((1 << v7) & 0x200101C) == 0)
    v8 = (unint64_t)(v7 == 26) << 7;
  *(_QWORD *)((char *)&v11 + 1) = *(_QWORD *)(a3 + 1) & 0x3F0000000000 | ((unint64_t)((int)((((*(_QWORD *)(a3 + 1) >> 46) | (*(_DWORD *)(a3 + 9) << 18)) & 0x3FFFFFF) + a4 + (1 << ((unsigned __int16)WORD2(*(_QWORD *)(a3 + 1)) >> 8))) % (1 << ((unsigned __int16)WORD2(*(_QWORD *)(a3 + 1)) >> 8))) << 46);
  LOBYTE(v11) = 2;
  return v11 & 0xFFFFFFFFFFFFFF7FLL | v8;
}

- (id)tileHandler
{
  return self->_tileHandler;
}

- (void)setTileHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (unint64_t)zoomLevel
{
  return self->_zoomLevel;
}

- (int)tileSize
{
  return self->_tileSize;
}

- (int)tileScale
{
  return self->_tileScale;
}

- (int)tileStyle
{
  return self->_tileStyle;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_tileHandler, 0);
}

@end
