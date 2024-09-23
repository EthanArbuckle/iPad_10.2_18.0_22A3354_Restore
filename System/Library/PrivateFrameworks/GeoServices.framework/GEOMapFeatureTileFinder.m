@implementation GEOMapFeatureTileFinder

- (GEOMapFeatureTileFinder)initWithZoomLevel:(unint64_t)a3 tileSize:(int)a4 tileScale:(int)a5 tileSetStyle:(int)a6 requestParameters:(id)a7
{
  id v13;
  GEOMapFeatureTileFinder *v14;
  GEOMapFeatureTileFinder *v15;
  uint64_t v16;
  GEOTileLoader *tileLoader;
  objc_super v19;

  v13 = a7;
  v19.receiver = self;
  v19.super_class = (Class)GEOMapFeatureTileFinder;
  v14 = -[GEOMapFeatureTileFinder init](&v19, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_requestParameters, a7);
    v15->_zoomLevel = a3;
    v15->_tileSize = a4;
    v15->_tileScale = a5;
    v15->_tileSetStyle = a6;
    objc_msgSend(v13, "tileLoader");
    v16 = objc_claimAutoreleasedReturnValue();
    tileLoader = v15->_tileLoader;
    v15->_tileLoader = (GEOTileLoader *)v16;

  }
  return v15;
}

- (void)setExistingRequest:(id)a3
{
  id v5;
  GEOTileLoader *v6;
  GEOTileLoader *tileLoader;
  id v8;

  v5 = a3;
  if (v5)
  {
    v8 = v5;
    objc_storeStrong((id *)&self->_tileFinderRequest, a3);
    -[_GEOMapFeatureAccessRequest tileLoader](self->_tileFinderRequest, "tileLoader");
    v6 = (GEOTileLoader *)objc_claimAutoreleasedReturnValue();
    tileLoader = self->_tileLoader;
    self->_tileLoader = v6;

    v5 = v8;
  }

}

- (unint64_t)tileKeyWithX:(uint64_t)a3 y:
{
  unsigned int v3;
  unint64_t v4;
  __int128 v7;

  v3 = *(_DWORD *)(a1 + 32);
  v4 = 128;
  if (v3 > 0x19 || ((1 << v3) & 0x200101C) == 0)
    v4 = (unint64_t)(v3 == 26) << 7;
  *(_QWORD *)((char *)&v7 + 1) = (a3 << 46) | ((*(_QWORD *)(a1 + 16) & 0x3FLL) << 40);
  LOBYTE(v7) = 2;
  return v7 & 0xFFFFFFFFFFFFFF7FLL | v4;
}

- (id)findTileWithKey:(uint64_t)a3 handler:(uint64_t)a4 completionHandler:(void *)a5
{
  id v8;
  id v9;
  GEOTileKeyList *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v20[0] = a3;
  v20[1] = a4;
  v8 = a5;
  v9 = a6;
  v10 = objc_alloc_init(GEOTileKeyList);
  -[GEOTileKeyList addKey:](v10, "addKey:", v20);
  v11 = MEMORY[0x1E0C809B0];
  if (v8)
  {
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __69__GEOMapFeatureTileFinder_findTileWithKey_handler_completionHandler___block_invoke;
    v18[3] = &unk_1E1C0FFF0;
    v19 = v8;
    v12 = (void *)MEMORY[0x18D765024](v18);

  }
  else
  {
    v12 = 0;
  }
  v16[0] = v11;
  v16[1] = 3221225472;
  v16[2] = __69__GEOMapFeatureTileFinder_findTileWithKey_handler_completionHandler___block_invoke_3;
  v16[3] = &unk_1E1C10038;
  v17 = v9;
  v13 = v9;
  objc_msgSend(a1, "_findTilesInList:preloadToDiskOnly:tileDecoder:handler:completionHandler:", v10, 0, &__block_literal_global_118, v12, v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

uint64_t __69__GEOMapFeatureTileFinder_findTileWithKey_handler_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __69__GEOMapFeatureTileFinder_findTileWithKey_handler_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "decodedRepresentation");
}

uint64_t __69__GEOMapFeatureTileFinder_findTileWithKey_handler_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a3);
  return result;
}

- (id)findTilesAround:(id)a3 radius:(double)a4 handler:(id)a5 completionHandler:(id)a6
{
  double var1;
  double var0;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;

  var1 = a3.var1;
  var0 = a3.var0;
  v11 = a5;
  v12 = a6;
  _GEOTileKeysForCoordinate(self->_zoomLevel, self->_tileSetStyle, self->_tileSize, self->_tileScale, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))GEOVoltaireTileKeyMake, var0, var1, a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x1E0C809B0];
  if (v11)
  {
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __76__GEOMapFeatureTileFinder_findTilesAround_radius_handler_completionHandler___block_invoke;
    v21[3] = &unk_1E1C0FFF0;
    v22 = v11;
    v15 = (void *)MEMORY[0x18D765024](v21);

  }
  else
  {
    v15 = 0;
  }
  v19[0] = v14;
  v19[1] = 3221225472;
  v19[2] = __76__GEOMapFeatureTileFinder_findTilesAround_radius_handler_completionHandler___block_invoke_3;
  v19[3] = &unk_1E1C10038;
  v20 = v12;
  v16 = v12;
  -[GEOMapFeatureTileFinder _findTilesInList:preloadToDiskOnly:tileDecoder:handler:completionHandler:](self, "_findTilesInList:preloadToDiskOnly:tileDecoder:handler:completionHandler:", v13, 0, &__block_literal_global_3_4, v15, v19);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

uint64_t __76__GEOMapFeatureTileFinder_findTilesAround_radius_handler_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __76__GEOMapFeatureTileFinder_findTilesAround_radius_handler_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "decodedRepresentation");
}

uint64_t __76__GEOMapFeatureTileFinder_findTilesAround_radius_handler_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a3);
  return result;
}

- (id)findTileDataAround:(id)a3 radius:(double)a4 handler:(id)a5 completionHandler:(id)a6
{
  double var1;
  double var0;
  id v11;
  uint64_t tileSetStyle;
  uint64_t tileScale;
  uint64_t (*v14)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  unint64_t zoomLevel;
  uint64_t tileSize;
  id v17;
  void *v18;
  id v19;
  void *v20;
  _QWORD v22[4];
  id v23;

  var1 = a3.var1;
  var0 = a3.var0;
  v11 = a6;
  tileScale = self->_tileScale;
  tileSetStyle = self->_tileSetStyle;
  if ((_DWORD)tileSetStyle == 89)
    v14 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_GEOQuadIDTileKeyMakeWrapper;
  else
    v14 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))GEOVoltaireTileKeyMake;
  zoomLevel = self->_zoomLevel;
  tileSize = self->_tileSize;
  v17 = a5;
  _GEOTileKeysForCoordinate(zoomLevel, tileSetStyle, tileSize, tileScale, v14, var0, var1, a4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __79__GEOMapFeatureTileFinder_findTileDataAround_radius_handler_completionHandler___block_invoke_2;
  v22[3] = &unk_1E1C10038;
  v23 = v11;
  v19 = v11;
  -[GEOMapFeatureTileFinder _findTilesInList:preloadToDiskOnly:tileDecoder:handler:completionHandler:](self, "_findTilesInList:preloadToDiskOnly:tileDecoder:handler:completionHandler:", v18, 0, &__block_literal_global_4_1, v17, v22);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

id __79__GEOMapFeatureTileFinder_findTileDataAround_radius_handler_completionHandler___block_invoke(int a1, id a2)
{
  return a2;
}

uint64_t __79__GEOMapFeatureTileFinder_findTileDataAround_radius_handler_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a3);
  return result;
}

- (id)preloadTilesAround:(id)a3 radius:(double)a4 preloadToDiskOnly:(BOOL)a5 completionHandler:(id)a6
{
  _BOOL8 v6;
  double var1;
  double var0;
  id v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v16[4];
  id v17;

  v6 = a5;
  var1 = a3.var1;
  var0 = a3.var0;
  v11 = a6;
  _GEOTileKeysForCoordinate(self->_zoomLevel, self->_tileSetStyle, self->_tileSize, self->_tileScale, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))GEOVoltaireTileKeyMake, var0, var1, a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __89__GEOMapFeatureTileFinder_preloadTilesAround_radius_preloadToDiskOnly_completionHandler___block_invoke_2;
  v16[3] = &unk_1E1C10038;
  v17 = v11;
  v13 = v11;
  -[GEOMapFeatureTileFinder _findTilesInList:preloadToDiskOnly:tileDecoder:handler:completionHandler:](self, "_findTilesInList:preloadToDiskOnly:tileDecoder:handler:completionHandler:", v12, v6, &__block_literal_global_5_0, 0, v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

uint64_t __89__GEOMapFeatureTileFinder_preloadTilesAround_radius_preloadToDiskOnly_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "decodedRepresentation");
}

uint64_t __89__GEOMapFeatureTileFinder_preloadTilesAround_radius_preloadToDiskOnly_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (id)_tileFinderRequest
{
  _GEOMapFeatureAccessRequest *tileFinderRequest;
  _GEOMapFeatureAccessRequest *v4;
  _GEOMapFeatureAccessRequest *v5;
  void *v6;

  tileFinderRequest = self->_tileFinderRequest;
  if (!tileFinderRequest)
  {
    v4 = -[_GEOMapFeatureAccessRequest initWithTileLoader:]([_GEOMapFeatureAccessRequest alloc], "initWithTileLoader:", self->_tileLoader);
    v5 = self->_tileFinderRequest;
    self->_tileFinderRequest = v4;

    tileFinderRequest = self->_tileFinderRequest;
  }
  -[GEOMapFeatureTileFinder _tileLoaderClientIdentifier](self, "_tileLoaderClientIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_GEOMapFeatureAccessRequest addTileRequest:](tileFinderRequest, "addTileRequest:", v6);

  return self->_tileFinderRequest;
}

- (id)_findTilesInList:(id)a3 preloadToDiskOnly:(BOOL)a4 tileDecoder:(id)a5 handler:(id)a6 completionHandler:(id)a7
{
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  __int128 v18;
  void (**v19)(id, uint64_t, uint64_t);
  void *v20;
  __int128 v21;
  void *v22;
  BOOL v23;
  _BOOL4 v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _BOOL4 v28;
  _BOOL4 v29;
  BOOL v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  id v34;
  id v35;
  id v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t i;
  uint64_t v41;
  void *v42;
  GEOTileLoader *tileLoader;
  void *v44;
  void *v45;
  NSObject *v46;
  dispatch_group_t v47;
  void *v48;
  NSString *tileLoaderClientIdentifier;
  GEOTileLoader *v50;
  NSObject *v51;
  NSObject *v52;
  id v54;
  id v55;
  id v56;
  void (**v57)(id, uint64_t, uint64_t);
  void *v58;
  id v59;
  id v60;
  void (**v61)(void);
  _BOOL4 v62;
  id obj;
  void *v64;
  uint64_t v65;
  _QWORD block[4];
  void (**v67)(id, uint64_t, uint64_t);
  uint64_t *v68;
  uint64_t *v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  _QWORD v74[5];
  id v75;
  id v76;
  id v77;
  void (**v78)(void);
  uint64_t *v79;
  uint8_t *v80;
  uint64_t *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  BOOL v85;
  _QWORD v86[5];
  id v87;
  id v88;
  id v89;
  uint8_t *v90;
  uint64_t *v91;
  uint64_t v92;
  uint64_t v93;
  _QWORD v94[4];
  id v95;
  id v96;
  uint64_t *v97;
  uint8_t *v98;
  uint64_t v99;
  uint64_t *v100;
  uint64_t v101;
  uint64_t (*v102)(uint64_t, uint64_t);
  void (*v103)(uint64_t);
  id v104;
  uint64_t v105;
  uint64_t *v106;
  uint64_t v107;
  uint64_t v108;
  uint8_t v109[128];
  uint8_t buf[8];
  _BYTE v111[24];
  void (*v112)(uint64_t);
  id v113;
  uint64_t v114;

  v62 = a4;
  v114 = *MEMORY[0x1E0C80C00];
  v60 = a3;
  v59 = a6;
  v57 = (void (**)(id, uint64_t, uint64_t))a7;
  v11 = a5;
  -[GEOMapFeatureTileFinder _tileFinderRequest](self, "_tileFinderRequest");
  v56 = (id)objc_claimAutoreleasedReturnValue();
  if (v11)
    v12 = v11;
  else
    v12 = &__block_literal_global_8_1;
  v58 = (void *)objc_msgSend(v12, "copy");

  if (objc_msgSend(v60, "count"))
  {
    if (-[_GEOMapFeatureAccessRequestParameters allowNetworkTileLoad](self->_requestParameters, "allowNetworkTileLoad"))
      v13 = 3;
    else
      v13 = 1;
    if (v62)
    {
      v14 = objc_msgSend(v60, "count");
      v15 = objc_msgSend(v60, "firstKey");
      v16 = objc_msgSend(v60, "keyAtIndex:", v14 - 1);
      GEOGetGEOMapFeatureAccessLog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        if ((*(_BYTE *)v15 & 0x7F) == 0xC)
        {
          *((_QWORD *)&v18 + 1) = *(unsigned __int16 *)(v15 + 9) | ((unint64_t)*(unsigned __int8 *)(v15 + 11) << 16);
          *(_QWORD *)&v18 = *(_QWORD *)(v15 + 1);
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%llu_%d_type_%d"), (unint64_t)(v18 >> 6), v18 & 0x3F, ((*(unsigned __int16 *)(v15 + 9) | (*(unsigned __int8 *)(v15 + 11) << 16)) >> 6) & 0x3FFF);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d.%d.%d_provider_%d_type_%d"), ((*(_QWORD *)(v15 + 1) >> 46) | (*(_DWORD *)(v15 + 9) << 18)) & 0x3FFFFFF, ((*(unsigned int *)(v15 + 9) | ((unint64_t)(*(unsigned __int16 *)(v15 + 13) | (*(unsigned __int8 *)(v15 + 15) << 16)) << 32)) >> 8) & 0x3FFFFFF, (*(_QWORD *)(v15 + 1) >> 40) & 0x3FLL, *(_BYTE *)v15 & 0x7F, *(unsigned __int16 *)(v15 + 13) >> 2);
        }
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if ((*(_BYTE *)v16 & 0x7F) == 0xC)
        {
          *((_QWORD *)&v21 + 1) = *(unsigned __int16 *)(v16 + 9) | ((unint64_t)*(unsigned __int8 *)(v16 + 11) << 16);
          *(_QWORD *)&v21 = *(_QWORD *)(v16 + 1);
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%llu_%d_type_%d"), (unint64_t)(v21 >> 6), v21 & 0x3F, ((*(unsigned __int16 *)(v16 + 9) | (*(unsigned __int8 *)(v16 + 11) << 16)) >> 6) & 0x3FFF);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d.%d.%d_provider_%d_type_%d"), ((*(_QWORD *)(v16 + 1) >> 46) | (*(_DWORD *)(v16 + 9) << 18)) & 0x3FFFFFF, ((*(unsigned int *)(v16 + 9) | ((unint64_t)(*(unsigned __int16 *)(v16 + 13) | (*(unsigned __int8 *)(v16 + 15) << 16)) << 32)) >> 8) & 0x3FFFFFF, (*(_QWORD *)(v16 + 1) >> 40) & 0x3FLL, *(_BYTE *)v16 & 0x7F, *(unsigned __int16 *)(v16 + 13) >> 2);
        }
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 67109634;
        *(_DWORD *)&buf[4] = v14;
        *(_WORD *)v111 = 2112;
        *(_QWORD *)&v111[2] = v20;
        *(_WORD *)&v111[10] = 2112;
        *(_QWORD *)&v111[12] = v22;
        _os_log_impl(&dword_1885A9000, v17, OS_LOG_TYPE_DEFAULT, "Preloading %d tiles from %@ to %@", buf, 0x1Cu);

      }
      v13 |= 0x204uLL;
    }
    v23 = -[_GEOMapFeatureAccessRequestParameters cachedTilesCallbackImmediately](self->_requestParameters, "cachedTilesCallbackImmediately");
    v24 = -[_GEOMapFeatureAccessRequestParameters allowOfflineData](self->_requestParameters, "allowOfflineData");
    if (v62)
    {
      v25 = v13;
      v26 = v13;
    }
    else
    {
      if (-[_GEOMapFeatureAccessRequestParameters allowStaleData](self->_requestParameters, "allowStaleData"))
        v27 = v13 | 0x40;
      else
        v27 = v13;
      v28 = -[_GEOMapFeatureAccessRequestParameters preferStaleData](self->_requestParameters, "preferStaleData");
      v29 = v13 != v27;
      v30 = !v28 || !v29;
      if (v28 && v29)
        v31 = v13;
      else
        v31 = v27;
      if (v30)
        v26 = v13;
      else
        v26 = v27;
      if (v24)
        v25 = v13 | 0x400;
      else
        v25 = v13;
      v13 = v31;
    }
    v65 = v26;
    v32 = 0;
    *(_QWORD *)buf = 0;
    *(_QWORD *)v111 = buf;
    *(_QWORD *)&v111[8] = 0x3032000000;
    *(_QWORD *)&v111[16] = __Block_byref_object_copy__62;
    v112 = __Block_byref_object_dispose__62;
    v113 = 0;
    v99 = 0;
    v100 = &v99;
    v105 = 0;
    v106 = &v105;
    v107 = 0x2020000000;
    v108 = 0;
    v101 = 0x3032000000;
    v102 = __Block_byref_object_copy__62;
    v103 = __Block_byref_object_dispose__62;
    v104 = 0;
    v33 = MEMORY[0x1E0C809B0];
    if (v24)
    {
      v94[0] = MEMORY[0x1E0C809B0];
      v94[1] = 3221225472;
      v94[2] = __100__GEOMapFeatureTileFinder__findTilesInList_preloadToDiskOnly_tileDecoder_handler_completionHandler___block_invoke_9;
      v94[3] = &unk_1E1C10080;
      v97 = &v105;
      v95 = v59;
      v96 = v58;
      v98 = buf;
      v32 = (void *)objc_msgSend(v94, "copy");

    }
    v86[0] = v33;
    v86[1] = 3221225472;
    v86[2] = __100__GEOMapFeatureTileFinder__findTilesInList_preloadToDiskOnly_tileDecoder_handler_completionHandler___block_invoke_11;
    v86[3] = &unk_1E1C100A8;
    v34 = v32;
    v92 = v25;
    v93 = v65;
    v86[4] = self;
    v87 = v34;
    v90 = buf;
    v91 = &v105;
    v35 = v59;
    v88 = v35;
    v36 = v58;
    v89 = v36;
    v74[0] = v33;
    v74[1] = 3221225472;
    v74[2] = __100__GEOMapFeatureTileFinder__findTilesInList_preloadToDiskOnly_tileDecoder_handler_completionHandler___block_invoke_12;
    v74[3] = &unk_1E1C100D0;
    v82 = v65;
    v83 = v13;
    v79 = &v99;
    v55 = (id)objc_msgSend(v86, "copy");
    v75 = v55;
    v84 = v25;
    v80 = buf;
    v54 = v34;
    v76 = v54;
    v74[4] = self;
    v85 = v62;
    v37 = v36;
    v77 = v37;
    v81 = &v105;
    v61 = (void (**)(void))v35;
    v78 = v61;
    v64 = (void *)objc_msgSend(v74, "copy");
    v72 = 0u;
    v73 = 0u;
    v70 = 0u;
    v71 = 0u;
    obj = v60;
    v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, v109, 16);
    if (v38)
    {
      v39 = *(_QWORD *)v71;
      do
      {
        for (i = 0; i != v38; ++i)
        {
          if (*(_QWORD *)v71 != v39)
            objc_enumerationMutation(obj);
          v41 = *(_QWORD *)(*((_QWORD *)&v70 + 1) + 8 * i);
          if (-[_GEOMapFeatureAccessRequestParameters cachedTilesCallbackImmediately](self->_requestParameters, "cachedTilesCallbackImmediately"))
          {
            if (v62)
            {
              v42 = 0;
            }
            else
            {
              tileLoader = self->_tileLoader;
              -[_GEOMapFeatureAccessRequestParameters auditToken](self->_requestParameters, "auditToken");
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              -[GEOTileLoader cachedTileForKey:auditToken:](tileLoader, "cachedTileForKey:auditToken:", v41, v44);
              v42 = (void *)objc_claimAutoreleasedReturnValue();

            }
            (*((void (**)(id, void *))v37 + 2))(v37, v42);
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            if (v45)
            {
              ++v106[3];
              if (v61)
                v61[2]();
              goto LABEL_53;
            }

          }
          v46 = *(NSObject **)(*(_QWORD *)v111 + 40);
          if (!v46)
          {
            v47 = dispatch_group_create();
            v48 = *(void **)(*(_QWORD *)v111 + 40);
            *(_QWORD *)(*(_QWORD *)v111 + 40) = v47;

            v46 = *(NSObject **)(*(_QWORD *)v111 + 40);
          }
          dispatch_group_enter(v46);
          tileLoaderClientIdentifier = self->_tileLoaderClientIdentifier;
          v50 = self->_tileLoader;
          -[_GEOMapFeatureAccessRequestParameters auditToken](self->_requestParameters, "auditToken");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          -[_GEOMapFeatureAccessRequestParameters queue](self->_requestParameters, "queue");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          -[GEOTileLoader loadKey:priority:forClient:options:reason:auditToken:callbackQ:beginNetwork:callback:](v50, "loadKey:priority:forClient:options:reason:auditToken:callbackQ:beginNetwork:callback:", v41, 2147483646, tileLoaderClientIdentifier, v65, 4, v42, v45, 0, v64);
          v23 = 0;
LABEL_53:

        }
        v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, v109, 16);
      }
      while (v38);
    }

    if (v23)
    {
      v57[2](v57, v106[3], v100[5]);
    }
    else
    {
      v51 = *(NSObject **)(*(_QWORD *)v111 + 40);
      -[_GEOMapFeatureAccessRequestParameters queue](self->_requestParameters, "queue");
      v52 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __100__GEOMapFeatureTileFinder__findTilesInList_preloadToDiskOnly_tileDecoder_handler_completionHandler___block_invoke_13;
      block[3] = &unk_1E1C016C8;
      v67 = v57;
      v68 = &v105;
      v69 = &v99;
      dispatch_group_notify(v51, v52, block);

    }
    _Block_object_dispose(&v99, 8);

    _Block_object_dispose(&v105, 8);
    _Block_object_dispose(buf, 8);

    v19 = v57;
  }
  else
  {
    v19 = v57;
    if (v57)
      v57[2](v57, 0, 0);
  }

  return v56;
}

id __100__GEOMapFeatureTileFinder__findTilesInList_preloadToDiskOnly_tileDecoder_handler_completionHandler___block_invoke(int a1, id a2)
{
  return a2;
}

void __100__GEOMapFeatureTileFinder__findTilesInList_preloadToDiskOnly_tileDecoder_handler_completionHandler___block_invoke_9(_QWORD *a1, uint64_t a2, void *a3, uint64_t a4, void *a5, void *a6)
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  __int128 v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  if (v11)
  {
    GEOGetGEOMapFeatureAccessLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      if ((*(_BYTE *)a2 & 0x7F) == 0xC)
      {
        *((_QWORD *)&v14 + 1) = *(unsigned __int16 *)(a2 + 9) | ((unint64_t)*(unsigned __int8 *)(a2 + 11) << 16);
        *(_QWORD *)&v14 = *(_QWORD *)(a2 + 1);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%llu_%d_type_%d"), (unint64_t)(v14 >> 6), v14 & 0x3F, ((*(unsigned __int16 *)(a2 + 9) | (*(unsigned __int8 *)(a2 + 11) << 16)) >> 6) & 0x3FFF, v18, v19);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d.%d.%d_provider_%d_type_%d"), ((*(_QWORD *)(a2 + 1) >> 46) | (*(_DWORD *)(a2 + 9) << 18)) & 0x3FFFFFF, ((*(unsigned int *)(a2 + 9) | ((unint64_t)(*(unsigned __int16 *)(a2 + 13) | (*(unsigned __int8 *)(a2 + 15) << 16)) << 32)) >> 8) & 0x3FFFFFF, (*(_QWORD *)(a2 + 1) >> 40) & 0x3FLL, *(_BYTE *)a2 & 0x7F, *(unsigned __int16 *)(a2 + 13) >> 2);
      }
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v21 = v17;
      v22 = 2112;
      v23 = v11;
      _os_log_impl(&dword_1885A9000, v13, OS_LOG_TYPE_ERROR, "Error while fetching offline tile %@: %@", buf, 0x16u);

    }
  }
  else
  {
    ++*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24);
    v15 = a1[4];
    if (v15)
    {
      (*(void (**)(void))(a1[5] + 16))();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, uint64_t, void *))(v15 + 16))(v15, a2, v16);

    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1[7] + 8) + 40));

}

void __100__GEOMapFeatureTileFinder__findTilesInList_preloadToDiskOnly_tileDecoder_handler_completionHandler___block_invoke_11(_QWORD *a1, uint64_t a2, void *a3, uint64_t a4, void *a5, void *a6)
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  __int128 v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  if (v11)
  {
    GEOGetGEOMapFeatureAccessLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      if ((*(_BYTE *)a2 & 0x7F) == 0xC)
      {
        *((_QWORD *)&v14 + 1) = *(unsigned __int16 *)(a2 + 9) | ((unint64_t)*(unsigned __int8 *)(a2 + 11) << 16);
        *(_QWORD *)&v14 = *(_QWORD *)(a2 + 1);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%llu_%d_type_%d"), (unint64_t)(v14 >> 6), v14 & 0x3F, ((*(unsigned __int16 *)(a2 + 9) | (*(unsigned __int8 *)(a2 + 11) << 16)) >> 6) & 0x3FFF, v28, v29);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d.%d.%d_provider_%d_type_%d"), ((*(_QWORD *)(a2 + 1) >> 46) | (*(_DWORD *)(a2 + 9) << 18)) & 0x3FFFFFF, ((*(unsigned int *)(a2 + 9) | ((unint64_t)(*(unsigned __int16 *)(a2 + 13) | (*(unsigned __int8 *)(a2 + 15) << 16)) << 32)) >> 8) & 0x3FFFFFF, (*(_QWORD *)(a2 + 1) >> 40) & 0x3FLL, *(_BYTE *)a2 & 0x7F, *(unsigned __int16 *)(a2 + 13) >> 2);
      }
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v31 = v17;
      v32 = 2112;
      v33 = v11;
      _os_log_impl(&dword_1885A9000, v13, OS_LOG_TYPE_ERROR, "Error while retrying loading tile %@: %@", buf, 0x16u);

    }
    v18 = v11;
    objc_msgSend(v18, "domain");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    GEOErrorDomain();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v19, "isEqual:", v20) & 1) != 0)
    {
      v21 = objc_msgSend(v18, "code");

      if (v21 == -2)
        goto LABEL_16;
    }
    else
    {

    }
    if (a1[5] && a1[10] != a1[11])
    {
      dispatch_group_enter(*(dispatch_group_t *)(*(_QWORD *)(a1[8] + 8) + 40));
      v22 = a1[4];
      v24 = *(_QWORD *)(v22 + 40);
      v23 = *(void **)(v22 + 48);
      v25 = a1[10];
      objc_msgSend(*(id *)(v22 + 8), "auditToken");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1[4] + 8), "queue");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "loadKey:priority:forClient:options:reason:auditToken:callbackQ:beginNetwork:callback:", a2, 2147483646, v24, v25, 4, v26, v27, 0, a1[5]);

    }
  }
  else
  {
    ++*(_QWORD *)(*(_QWORD *)(a1[9] + 8) + 24);
    v15 = a1[6];
    if (v15)
    {
      (*(void (**)(void))(a1[7] + 16))();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, uint64_t, void *))(v15 + 16))(v15, a2, v16);

    }
  }
LABEL_16:
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1[8] + 8) + 40));

}

void __100__GEOMapFeatureTileFinder__findTilesInList_preloadToDiskOnly_tileDecoder_handler_completionHandler___block_invoke_12(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, void *a6)
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  __int128 v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  id *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  void *v36;
  uint64_t v37;
  NSObject *v38;
  __int128 v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint8_t buf[4];
  id v45;
  __int16 v46;
  id v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  if (v11)
  {
    GEOGetGEOMapFeatureAccessLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      if ((*(_BYTE *)a2 & 0x7F) == 0xC)
      {
        *((_QWORD *)&v14 + 1) = *(unsigned __int16 *)(a2 + 9) | ((unint64_t)*(unsigned __int8 *)(a2 + 11) << 16);
        *(_QWORD *)&v14 = *(_QWORD *)(a2 + 1);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%llu_%d_type_%d"), (unint64_t)(v14 >> 6), v14 & 0x3F, ((*(unsigned __int16 *)(a2 + 9) | (*(unsigned __int8 *)(a2 + 11) << 16)) >> 6) & 0x3FFF, v41, v42);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d.%d.%d_provider_%d_type_%d"), ((*(_QWORD *)(a2 + 1) >> 46) | (*(_DWORD *)(a2 + 9) << 18)) & 0x3FFFFFF, ((*(unsigned int *)(a2 + 9) | ((unint64_t)(*(unsigned __int16 *)(a2 + 13) | (*(unsigned __int8 *)(a2 + 15) << 16)) << 32)) >> 8) & 0x3FFFFFF, (*(_QWORD *)(a2 + 1) >> 40) & 0x3FLL, *(_BYTE *)a2 & 0x7F, *(unsigned __int16 *)(a2 + 13) >> 2);
      }
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v45 = v15;
      v46 = 2112;
      v47 = v11;
      _os_log_impl(&dword_1885A9000, v13, OS_LOG_TYPE_ERROR, "Error loading tile %@: %@", buf, 0x16u);

    }
    if ((*(_BYTE *)(a1 + 96) & 0x40) != 0)
    {
      objc_msgSend(v11, "domain");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      GEOErrorDomain();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v16, "isEqual:", v17) & 1) != 0)
      {
        v18 = objc_msgSend(v11, "code");

        if (v18 == -8)
          goto LABEL_18;
      }
      else
      {

      }
    }
    v19 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v22 = *(void **)(v19 + 40);
    v20 = (id *)(v19 + 40);
    v21 = v22;
    if (v22)
      v23 = v21;
    else
      v23 = v11;
    objc_storeStrong(v20, v23);
LABEL_18:
    v24 = v11;
    objc_msgSend(v24, "domain");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    GEOErrorDomain();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v25, "isEqual:", v26) & 1) != 0)
    {
      v27 = objc_msgSend(v24, "code");

      if (v27 == -2)
        goto LABEL_25;
    }
    else
    {

    }
    v28 = *(_QWORD *)(a1 + 104);
    if (v28 == *(_QWORD *)(a1 + 96))
    {
      v29 = *(_QWORD *)(a1 + 48);
      if (!v29)
      {
LABEL_25:
        v30 = 0;
LABEL_39:

        goto LABEL_40;
      }
      v28 = *(_QWORD *)(a1 + 112);
    }
    else
    {
      v29 = *(_QWORD *)(a1 + 40);
    }
    v30 = (void *)MEMORY[0x18D765024](v29);
    if (v30 && v28 != *(_QWORD *)(a1 + 96))
    {
      dispatch_group_enter(*(dispatch_group_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40));
      v31 = *(_QWORD *)(a1 + 32);
      v32 = *(void **)(v31 + 48);
      v43 = *(_QWORD *)(v31 + 40);
      objc_msgSend(*(id *)(v31 + 8), "auditToken");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "queue");
      v34 = v10;
      v35 = v12;
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "loadKey:priority:forClient:options:reason:auditToken:callbackQ:beginNetwork:callback:", a2, 2147483646, v43, v28, 4, v33, v36, 0, v30);

      v12 = v35;
      v10 = v34;

    }
    goto LABEL_39;
  }
  if (!*(_BYTE *)(a1 + 120))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (v30)
    {
      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24);
      v37 = *(_QWORD *)(a1 + 64);
      if (v37)
        (*(void (**)(uint64_t, uint64_t, void *))(v37 + 16))(v37, a2, v30);
    }
    else
    {
      GEOGetGEOMapFeatureAccessLog();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        if ((*(_BYTE *)a2 & 0x7F) == 0xC)
        {
          *((_QWORD *)&v39 + 1) = *(unsigned __int16 *)(a2 + 9) | ((unint64_t)*(unsigned __int8 *)(a2 + 11) << 16);
          *(_QWORD *)&v39 = *(_QWORD *)(a2 + 1);
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%llu_%d_type_%d"), (unint64_t)(v39 >> 6), v39 & 0x3F, ((*(unsigned __int16 *)(a2 + 9) | (*(unsigned __int8 *)(a2 + 11) << 16)) >> 6) & 0x3FFF, v41, v42);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d.%d.%d_provider_%d_type_%d"), ((*(_QWORD *)(a2 + 1) >> 46) | (*(_DWORD *)(a2 + 9) << 18)) & 0x3FFFFFF, ((*(unsigned int *)(a2 + 9) | ((unint64_t)(*(unsigned __int16 *)(a2 + 13) | (*(unsigned __int8 *)(a2 + 15) << 16)) << 32)) >> 8) & 0x3FFFFFF, (*(_QWORD *)(a2 + 1) >> 40) & 0x3FLL, *(_BYTE *)a2 & 0x7F, *(unsigned __int16 *)(a2 + 13) >> 2);
        }
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v45 = v10;
        v46 = 2112;
        v47 = v40;
        _os_log_impl(&dword_1885A9000, v38, OS_LOG_TYPE_ERROR, "Error reading tile: %@ (%@)", buf, 0x16u);

      }
    }
    goto LABEL_39;
  }
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24);
LABEL_40:
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40));

}

uint64_t __100__GEOMapFeatureTileFinder__findTilesInList_preloadToDiskOnly_tileDecoder_handler_completionHandler___block_invoke_13(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[4] + 16))(a1[4], *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24), *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));
}

- (id)_tileLoaderClientIdentifier
{
  NSString *tileLoaderClientIdentifier;
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  NSString *v8;
  NSString *v9;

  tileLoaderClientIdentifier = self->_tileLoaderClientIdentifier;
  if (!tileLoaderClientIdentifier)
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@<%p>(%@)"), v6, self, v7);
    v8 = (NSString *)objc_claimAutoreleasedReturnValue();
    v9 = self->_tileLoaderClientIdentifier;
    self->_tileLoaderClientIdentifier = v8;

    tileLoaderClientIdentifier = self->_tileLoaderClientIdentifier;
  }
  return tileLoaderClientIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tileFinderRequest, 0);
  objc_storeStrong((id *)&self->_tileLoader, 0);
  objc_storeStrong((id *)&self->_tileLoaderClientIdentifier, 0);
  objc_storeStrong((id *)&self->_requestParameters, 0);
}

@end
