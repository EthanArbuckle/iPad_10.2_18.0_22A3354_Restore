@implementation GEOGeographicMetadataTileFetcher

- (id)initForTileStyle:(int)a3 options:(unint64_t)a4
{
  GEOGeographicMetadataTileFetcher *v4;
  GEOGeographicMetadataTileFetcher *v5;
  uint8_t v7[16];

  v4 = self;
  if (a3 == 80)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: tileStyle != GEOTileSetStyle_SMART_DATA_MODE", v7, 2u);
    }
    v5 = 0;
  }
  else
  {
    v4 = (GEOGeographicMetadataTileFetcher *)-[GEOGeographicMetadataTileFetcher initForTileStyle:mcc:mnc:options:](self, "initForTileStyle:mcc:mnc:options:", *(_QWORD *)&a3, 0xFFFFLL, 0xFFFFLL, a4);
    v5 = v4;
  }

  return v5;
}

- (id)initForTileStyle:(int)a3 mcc:(unsigned __int16)a4 mnc:(unsigned __int16)a5 options:(unint64_t)a6
{
  GEOGeographicMetadataTileFetcher *v10;
  BOOL v11;
  GEOGeographicMetadataTileFetcher *v12;
  uint64_t global_queue;
  OS_dispatch_queue *workQueue;
  GEOGeographicMetadataTileFetcher *v15;
  objc_super v17;
  uint8_t buf[16];

  v10 = self;
  v11 = a5 >= 0x3E8u || a4 >= 0x3E8u;
  if (v11 && (a5 & a4) != 0xFFFF)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: (mcc <= 999 && mnc <= 999) || (mcc == 65535 && mnc == 65535)", buf, 2u);
    }
    v15 = 0;
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)GEOGeographicMetadataTileFetcher;
    v12 = -[GEOGeographicMetadataTileFetcher init](&v17, sel_init);
    if (v12)
    {
      qos_class_self();
      global_queue = geo_get_global_queue();
      workQueue = v12->_workQueue;
      v12->_workQueue = (OS_dispatch_queue *)global_queue;

      v12->_tileStyle = a3;
      v12->_options = a6;
      v12->_mcc = a4;
      v12->_mnc = a5;
    }
    v10 = v12;
    v15 = v10;
  }

  return v15;
}

- (uint64_t)_tileKeyMakeWithCoordinate:(uint64_t)a3 zoom:(const unsigned __int8 *)a4
{
  return GEOGloriaQuadIDTileKeyMakeWithCoordinate(a2, a5, a6, *(unsigned int *)(a1 + 16), a3, a4);
}

- (void)reportCorrupt:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  int tileStyle;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  char v12;
  __int128 v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NSMapTable objectForKey:](self->_resultItems, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = objc_msgSend(v5, "unsignedLongLongValue");
    tileStyle = self->_tileStyle;
    if (self->_mcc > 0x3E7u || self->_mnc > 0x3E7u)
    {
      v13 = xmmword_189CE1060;
      v12 = __clz(v7);
      *(_QWORD *)((char *)&v13 + 1) = ((unint64_t)(char)(63
                                                                                             - v12
                                                                                             + (((63 - v12) & 0x80) >> 7)) >> 1) | (v7 << 6);
      *(_WORD *)((char *)&v13 + 9) = (v7 >> 58) & 0x3F | ((tileStyle & 0x3FFF) << 6);
      BYTE11(v13) = (unsigned __int16)(tileStyle & 0x3FFF) >> 10;
      v10 = *((_QWORD *)&v13 + 1);
      v9 = v13;
    }
    else
    {
      v9 = GEOCellularInfoTileKeyMakeWithQuadKey(v7);
    }
    +[GEOTileLoader modernLoader](GEOTileLoader, "modernLoader", v9, v10);
    v11 = objc_claimAutoreleasedReturnValue();
    -[NSObject reportCorruptTile:](v11, "reportCorruptTile:", &v13);
  }
  else
  {
    GEOGetGeographicMetadataLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      LODWORD(v13) = 138412290;
      *(_QWORD *)((char *)&v13 + 4) = v4;
      _os_log_impl(&dword_1885A9000, v11, OS_LOG_TYPE_ERROR, "Unable to report corrupt tile, not tile key matching given item was found: \"%@\", (uint8_t *)&v13, 0xCu);
    }
  }

}

- (void)_fetchTiles:(uint64_t)a3 withOptions:(void *)a4 queue:(void *)a5 completion:
{
  id v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  GEOTileKeyList *v13;
  void *v14;
  dispatch_group_t v15;
  NSObject *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  id v28;
  GEOTileKeyList *v29;
  id v30;
  id v31;
  GEOTileKeyList *v32;
  id v33;
  void *v34;
  id v35;
  uint64_t v36;
  _QWORD block[4];
  id v39;
  GEOTileKeyList *v40;
  id v41;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _QWORD v47[4];
  id v48;
  GEOTileKeyList *v49;
  id v50;
  NSObject *v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v8 = a2;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  v36 = a1;
  if (a1)
  {
    v34 = v10;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v8, "count"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[GEOTileKeyList initWithCapacity:]([GEOTileKeyList alloc], "initWithCapacity:", objc_msgSend(v8, "count"));
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = dispatch_group_create();
    v47[0] = MEMORY[0x1E0C809B0];
    v47[1] = 3221225472;
    v47[2] = __77__GEOGeographicMetadataTileFetcher__fetchTiles_withOptions_queue_completion___block_invoke;
    v47[3] = &unk_1E1C15120;
    v33 = v12;
    v48 = v33;
    v32 = v13;
    v49 = v32;
    v31 = v14;
    v50 = v31;
    v16 = v15;
    v51 = v16;
    v17 = (void *)MEMORY[0x18D765024](v47);
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v35 = v8;
    v18 = v8;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v44;
      do
      {
        v22 = 0;
        do
        {
          v23 = v9;
          if (*(_QWORD *)v44 != v21)
            objc_enumerationMutation(v18);
          v24 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * v22);
          dispatch_group_enter(v16);
          +[GEOTileLoader modernLoader](GEOTileLoader, "modernLoader");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p>"), v36, v18);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = v24;
          v9 = v23;
          objc_msgSend(v25, "loadKey:priority:forClient:options:reason:callbackQ:beginNetwork:callback:", v27, 0x3FFFFFFFLL, v26, a3, 4, v23, 0, v17);

          ++v22;
        }
        while (v20 != v22);
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
      }
      while (v20);
    }

    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __77__GEOGeographicMetadataTileFetcher__fetchTiles_withOptions_queue_completion___block_invoke_78;
    block[3] = &unk_1E1C126C8;
    v11 = v34;
    v39 = v33;
    v40 = v32;
    v41 = v31;
    v42 = v34;
    v28 = v31;
    v29 = v32;
    v30 = v33;
    dispatch_group_notify(v16, v9, block);

    v8 = v35;
  }

}

void __77__GEOGeographicMetadataTileFetcher__fetchTiles_withOptions_queue_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, void *a6)
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  const char *v14;
  NSObject *v15;
  os_log_type_t v16;
  uint32_t v17;
  void *v18;
  void *v19;
  __int128 v20;
  void *v21;
  unsigned int v22;
  int v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  if (v11)
  {
    objc_msgSend(*(id *)(a1 + 40), "addKey:", a2);
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v11);
    goto LABEL_3;
  }
  if ((objc_msgSend(v10, "hasFileDescriptor") & 1) == 0)
  {
    objc_msgSend(v10, "fileURL");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v18)
    {
      objc_msgSend(*(id *)(a1 + 40), "addKey:", a2);
LABEL_3:
      GEOGetGeographicMetadataLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v23 = 138412290;
        v24 = v11;
        v14 = "Received tile with no corresponding file. Error : %@";
        v15 = v13;
        v16 = OS_LOG_TYPE_ERROR;
        v17 = 12;
LABEL_9:
        _os_log_impl(&dword_1885A9000, v15, v16, v14, (uint8_t *)&v23, v17);
        goto LABEL_10;
      }
      goto LABEL_10;
    }
  }
  v19 = *(void **)(a1 + 32);
  *((_QWORD *)&v20 + 1) = *(unsigned __int16 *)(a2 + 9) | ((unint64_t)*(unsigned __int8 *)(a2 + 11) << 16);
  *(_QWORD *)&v20 = *(_QWORD *)(a2 + 1);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", (unint64_t)(v20 >> 6));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v10, v21);

  GEOGetGeographicMetadataLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    v22 = ((*(unsigned __int16 *)(a2 + 9) | (*(unsigned __int8 *)(a2 + 11) << 16)) >> 6) & 0x3FFF;
    v23 = 67109120;
    LODWORD(v24) = v22;
    v14 = "Received (style %d)";
    v15 = v13;
    v16 = OS_LOG_TYPE_DEBUG;
    v17 = 8;
    goto LABEL_9;
  }
LABEL_10:

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void __77__GEOGeographicMetadataTileFetcher__fetchTiles_withOptions_queue_completion___block_invoke_78(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  id v4;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 48), "firstObject");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, uint64_t, id))(v3 + 16))(v3, v1, v2, v4);

}

void __72__GEOGeographicMetadataTileFetcher__fetchTilesForZoom_queue_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  uint8_t buf[4];
  int v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  GEOGetGeographicMetadataLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67240448;
    v19 = objc_msgSend(v7, "count");
    v20 = 1026;
    v21 = objc_msgSend(v8, "count");
    _os_log_impl(&dword_1885A9000, v10, OS_LOG_TYPE_DEBUG, "Fetched %{public}d tiles and failed %{public}d \"fresh\" tiles", buf, 0xEu);
  }

  if (objc_msgSend(v8, "count") && *(_BYTE *)(a1 + 56))
  {
    if (*(_BYTE *)(a1 + 57))
      v11 = 321;
    else
      v11 = 65;
    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(void **)(a1 + 40);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __72__GEOGeographicMetadataTileFetcher__fetchTilesForZoom_queue_completion___block_invoke_79;
    v14[3] = &unk_1E1C15148;
    v15 = v7;
    v17 = *(id *)(a1 + 48);
    v16 = v9;
    -[GEOGeographicMetadataTileFetcher _fetchTiles:withOptions:queue:completion:](v12, v8, v11, v13, v14);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __72__GEOGeographicMetadataTileFetcher__fetchTilesForZoom_queue_completion___block_invoke_79(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  _DWORD v12[2];
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  GEOGetGeographicMetadataLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v12[0] = 67240448;
    v12[1] = objc_msgSend(v5, "count");
    v13 = 1026;
    v14 = objc_msgSend(v6, "count");
    _os_log_impl(&dword_1885A9000, v7, OS_LOG_TYPE_DEBUG, "Fetched %{public}d tiles and failed %{public}d \"stale\" tiles", (uint8_t *)v12, 0xEu);
  }

  v8 = objc_msgSend(*(id *)(a1 + 32), "count");
  v9 = objc_msgSend(v5, "count");
  if (v8 && v9)
  {
    v10 = (void *)objc_msgSend(v5, "mutableCopy");
    objc_msgSend(v10, "addEntriesFromDictionary:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    if (v8)
    {
      v11 = *(id *)(a1 + 32);
    }
    else
    {
      if (!v9)
      {
        v10 = (void *)MEMORY[0x1E0C9AA70];
        goto LABEL_11;
      }
      v11 = v5;
    }
    v10 = v11;
  }
LABEL_11:
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (void)fetchMetadataForLocation:(id)a3 responseQueue:(id)a4 block:(id)a5
{
  void (**v7)(id, _QWORD, __CFString *);
  GEOLocation *v8;
  GEOLocation *location;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  unsigned __int8 v20;
  unsigned __int8 v21;
  int v22;
  OS_dispatch_queue *workQueue;
  uint64_t v24;
  OS_dispatch_queue *v25;
  _QWORD *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  uint64_t v31;
  const unsigned __int8 *v32;
  uint64_t v33;
  GEOTileKeyList *v34;
  unsigned int v35;
  double v36;
  double v37;
  double v38;
  uint64_t v39;
  const unsigned __int8 *v40;
  double v41;
  uint64_t v42;
  NSObject *v43;
  double v44;
  int v45;
  int v46;
  unint64_t options;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  _QWORD *v51;
  OS_dispatch_queue *v52;
  __CFString *v53;
  int v54;
  void *v55;
  void *v56;
  NSObject *v57;
  uint64_t tileStyle;
  __CFString *v59;
  NSObject *v60;
  void *v61;
  void *v62;
  __CFString *v63;
  _QWORD v64[5];
  __CFString *v65;
  _QWORD v66[2];
  _BYTE buf[24];
  void *v68;
  GEOGeographicMetadataTileFetcher *v69;
  OS_dispatch_queue *v70;
  id v71;
  BOOL v72;
  char v73;
  _QWORD v74[4];

  v74[2] = *MEMORY[0x1E0C80C00];
  v7 = (void (**)(id, _QWORD, __CFString *))a5;
  v8 = (GEOLocation *)objc_msgSend(a3, "copy");
  location = self->_location;
  self->_location = v8;

  -[GEOLocation coordinate](self->_location, "coordinate");
  v11 = v10;
  v13 = v12;
  +[GEOResourceManifestManager modernManager](GEOResourceManifestManager, "modernManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "activeTileGroup");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "activeTileSetForStyle:", self->_tileStyle);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    v17 = GEOMapPointForCoordinate(v11, v13);
    v19 = v18;
    v20 = objc_msgSend(v16, "minimumZoomLevelForMapPoint:");
    v21 = objc_msgSend(v16, "maximumZoomLevelForMapPoint:", v17, v19);
    v22 = v20;
    if (v20 >= v21)
    {
      v54 = v21;
      v55 = (void *)MEMORY[0x1E0CB35C8];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Nonsense zooms. min: %d max: %d"), v20, v21);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "GEOErrorWithCode:reason:", -2006, v56);
      v53 = (__CFString *)objc_claimAutoreleasedReturnValue();

      GEOGetGeographicMetadataLog();
      v57 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_FAULT))
      {
        tileStyle = self->_tileStyle;
        v59 = CFSTR("RASTER_STANDARD");
        switch((int)tileStyle)
        {
          case 0:
            break;
          case 1:
            v59 = CFSTR("VECTOR_STANDARD");
            break;
          case 2:
            v59 = CFSTR("VECTOR_TRAFFIC_SEGMENTS_FOR_RASTER");
            break;
          case 3:
            v59 = CFSTR("VECTOR_TRAFFIC_INCIDENTS_FOR_RASTER");
            break;
          case 4:
            v59 = CFSTR("VECTOR_TRAFFIC_SEGMENTS_AND_INCIDENTS_FOR_RASTER");
            break;
          case 5:
            v59 = CFSTR("RASTER_STANDARD_BACKGROUND");
            break;
          case 6:
            v59 = CFSTR("RASTER_HYBRID");
            break;
          case 7:
            v59 = CFSTR("RASTER_SATELLITE");
            break;
          case 8:
            v59 = CFSTR("RASTER_TERRAIN");
            break;
          case 11:
            v59 = CFSTR("VECTOR_BUILDINGS");
            break;
          case 12:
            v59 = CFSTR("VECTOR_TRAFFIC");
            break;
          case 13:
            v59 = CFSTR("VECTOR_POI");
            break;
          case 14:
            v59 = CFSTR("SPUTNIK_METADATA");
            break;
          case 15:
            v59 = CFSTR("SPUTNIK_C3M");
            break;
          case 16:
            v59 = CFSTR("SPUTNIK_DSM");
            break;
          case 17:
            v59 = CFSTR("SPUTNIK_DSM_GLOBAL");
            break;
          case 18:
            v59 = CFSTR("VECTOR_REALISTIC");
            break;
          case 19:
            v59 = CFSTR("VECTOR_LEGACY_REALISTIC");
            break;
          case 20:
            v59 = CFSTR("VECTOR_ROADS");
            break;
          case 21:
            v59 = CFSTR("RASTER_VEGETATION");
            break;
          case 22:
            v59 = CFSTR("VECTOR_TRAFFIC_SKELETON");
            break;
          case 23:
            v59 = CFSTR("RASTER_COASTLINE_MASK");
            break;
          case 24:
            v59 = CFSTR("RASTER_HILLSHADE");
            break;
          case 25:
            v59 = CFSTR("VECTOR_TRAFFIC_WITH_GREEN");
            break;
          case 26:
            v59 = CFSTR("VECTOR_TRAFFIC_STATIC");
            break;
          case 27:
            v59 = CFSTR("RASTER_COASTLINE_DROP_MASK");
            break;
          case 28:
            v59 = CFSTR("VECTOR_TRAFFIC_SKELETON_WITH_HISTORICAL");
            break;
          case 29:
            v59 = CFSTR("VECTOR_SPEED_PROFILES");
            break;
          case 30:
            v59 = CFSTR("VECTOR_VENUES");
            break;
          case 31:
            v59 = CFSTR("RASTER_DOWN_SAMPLED");
            break;
          case 32:
            v59 = CFSTR("RASTER_COLOR_BALANCED");
            break;
          case 33:
            v59 = CFSTR("RASTER_SATELLITE_NIGHT");
            break;
          case 34:
            v59 = CFSTR("SPUTNIK_VECTOR_BORDER");
            break;
          case 35:
            v59 = CFSTR("RASTER_SATELLITE_DIGITIZE");
            break;
          case 36:
            v59 = CFSTR("RASTER_HILLSHADE_PARKS");
            break;
          case 37:
            v59 = CFSTR("VECTOR_TRANSIT");
            break;
          case 38:
            v59 = CFSTR("RASTER_STANDARD_BASE");
            break;
          case 39:
            v59 = CFSTR("RASTER_STANDARD_LABELS");
            break;
          case 40:
            v59 = CFSTR("RASTER_HYBRID_ROADS");
            break;
          case 41:
            v59 = CFSTR("RASTER_HYBRID_LABELS");
            break;
          case 42:
            v59 = CFSTR("FLYOVER_C3M_MESH");
            break;
          case 43:
            v59 = CFSTR("FLYOVER_C3M_JPEG_TEXTURE");
            break;
          case 44:
            v59 = CFSTR("FLYOVER_C3M_ASTC_TEXTURE");
            break;
          case 45:
            v59 = CFSTR("RASTER_SATELLITE_ASTC");
            break;
          case 46:
            v59 = CFSTR("RASTER_HYBRID_ROADS_AND_LABELS");
            break;
          case 47:
            v59 = CFSTR("VECTOR_TRANSIT_SELECTION");
            break;
          case 48:
            v59 = CFSTR("VECTOR_COVERAGE");
            break;
          case 52:
            v59 = CFSTR("FLYOVER_METADATA");
            break;
          case 53:
            v59 = CFSTR("VECTOR_ROAD_NETWORK");
            break;
          case 54:
            v59 = CFSTR("VECTOR_LAND_COVER");
            break;
          case 55:
            v59 = CFSTR("VECTOR_DEBUG");
            break;
          case 56:
            v59 = CFSTR("VECTOR_STREET_POI");
            break;
          case 57:
            v59 = CFSTR("MUNIN_METADATA");
            break;
          case 58:
            v59 = CFSTR("VECTOR_SPR_MERCATOR");
            break;
          case 59:
            v59 = CFSTR("VECTOR_SPR_MODELS");
            break;
          case 60:
            v59 = CFSTR("VECTOR_SPR_MATERIALS");
            break;
          case 61:
            v59 = CFSTR("VECTOR_SPR_METADATA");
            break;
          case 62:
            v59 = CFSTR("VECTOR_TRACKS");
            break;
          case 63:
            v59 = CFSTR("VECTOR_RESERVED_2");
            break;
          case 64:
            v59 = CFSTR("VECTOR_STREET_LANDMARKS");
            break;
          case 65:
            v59 = CFSTR("COARSE_LOCATION_POLYGONS");
            break;
          case 66:
            v59 = CFSTR("VECTOR_SPR_ROADS");
            break;
          case 67:
            v59 = CFSTR("VECTOR_SPR_STANDARD");
            break;
          case 68:
            v59 = CFSTR("VECTOR_POI_V2");
            break;
          case 69:
            v59 = CFSTR("VECTOR_POLYGON_SELECTION");
            break;
          case 70:
            v59 = CFSTR("VL_METADATA");
            break;
          case 71:
            v59 = CFSTR("VL_DATA");
            break;
          case 72:
            v59 = CFSTR("PROACTIVE_APP_CLIP");
            break;
          case 73:
            v59 = CFSTR("VECTOR_BUILDINGS_V2");
            break;
          case 74:
            v59 = CFSTR("POI_BUSYNESS");
            break;
          case 75:
            v59 = CFSTR("POI_DP_BUSYNESS");
            break;
          case 76:
            v59 = CFSTR("SMART_INTERFACE_SELECTION");
            break;
          case 77:
            v59 = CFSTR("VECTOR_ASSETS");
            break;
          case 78:
            v59 = CFSTR("SPR_ASSET_METADATA");
            break;
          case 79:
            v59 = CFSTR("VECTOR_SPR_POLAR");
            break;
          case 80:
            v59 = CFSTR("SMART_DATA_MODE");
            break;
          case 81:
            v59 = CFSTR("CELLULAR_PERFORMANCE_SCORE");
            break;
          case 82:
            v59 = CFSTR("VECTOR_SPR_MODELS_OCCLUSION");
            break;
          case 83:
            v59 = CFSTR("VECTOR_TOPOGRAPHIC");
            break;
          case 84:
            v59 = CFSTR("VECTOR_POI_V2_UPDATE");
            break;
          case 85:
            v59 = CFSTR("VECTOR_LIVE_DATA_UPDATES");
            break;
          case 86:
            v59 = CFSTR("VECTOR_TRAFFIC_V2");
            break;
          case 87:
            v59 = CFSTR("VECTOR_ROAD_SELECTION");
            break;
          case 88:
            v59 = CFSTR("VECTOR_REGION_METADATA");
            break;
          case 89:
            v59 = CFSTR("RAY_TRACING");
            break;
          case 90:
            v59 = CFSTR("VECTOR_CONTOURS");
            break;
          case 91:
            v59 = CFSTR("RASTER_SATELLITE_POLAR");
            break;
          case 92:
            v59 = CFSTR("VMAP4_ELEVATION");
            break;
          case 93:
            v59 = CFSTR("VMAP4_ELEVATION_POLAR");
            break;
          case 94:
            v59 = CFSTR("CELLULAR_COVERAGE_PLMN");
            break;
          case 95:
            v59 = CFSTR("RASTER_SATELLITE_POLAR_NIGHT");
            break;
          case 96:
            v59 = CFSTR("UNUSED_96");
            break;
          case 97:
            v59 = CFSTR("UNUSED_97");
            break;
          case 98:
            v59 = CFSTR("UNUSED_98");
            break;
          case 99:
            v59 = CFSTR("UNUSED_99");
            break;
          case 100:
            v59 = CFSTR("UNUSED_100");
            break;
          case 101:
            v59 = CFSTR("UNUSED_101");
            break;
          case 102:
            v59 = CFSTR("UNUSED_102");
            break;
          case 103:
            v59 = CFSTR("UNUSED_103");
            break;
          case 104:
            v59 = CFSTR("UNUSED_104");
            break;
          case 105:
            v59 = CFSTR("UNUSED_105");
            break;
          case 106:
            v59 = CFSTR("UNUSED_106");
            break;
          case 107:
            v59 = CFSTR("UNUSED_107");
            break;
          case 108:
            v59 = CFSTR("UNUSED_108");
            break;
          case 109:
            v59 = CFSTR("UNUSED_109");
            break;
          case 110:
            v59 = CFSTR("UNUSED_110");
            break;
          case 111:
            v59 = CFSTR("UNUSED_111");
            break;
          case 112:
            v59 = CFSTR("UNUSED_112");
            break;
          case 113:
            v59 = CFSTR("UNUSED_113");
            break;
          case 114:
            v59 = CFSTR("UNUSED_114");
            break;
          case 115:
            v59 = CFSTR("UNUSED_115");
            break;
          case 116:
            v59 = CFSTR("UNUSED_116");
            break;
          case 117:
            v59 = CFSTR("UNUSED_117");
            break;
          case 118:
            v59 = CFSTR("UNUSED_118");
            break;
          case 119:
            v59 = CFSTR("UNUSED_119");
            break;
          default:
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), tileStyle);
            v59 = (__CFString *)objc_claimAutoreleasedReturnValue();
            break;
        }
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v59;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v20;
        *(_WORD *)&buf[18] = 1024;
        *(_DWORD *)&buf[20] = v54;
        _os_log_impl(&dword_1885A9000, v57, OS_LOG_TYPE_FAULT, "Invalid zooms for tile style %@. min: %d max: %d", buf, 0x18u);

      }
      v7[2](v7, 0, v53);
    }
    else
    {
      workQueue = self->_workQueue;
      v24 = MEMORY[0x1E0C809B0];
      v64[0] = MEMORY[0x1E0C809B0];
      v64[1] = 3221225472;
      v64[2] = __81__GEOGeographicMetadataTileFetcher_fetchMetadataForLocation_responseQueue_block___block_invoke;
      v64[3] = &unk_1E1C052D0;
      v64[4] = self;
      v65 = v7;
      v25 = workQueue;
      v26 = v64;
      -[GEOLocation coordinate](self->_location, "coordinate");
      v28 = v27;
      v30 = v29;
      *(double *)v66 = v27;
      *(double *)&v66[1] = v29;
      v74[0] = -[GEOGeographicMetadataTileFetcher _tileKeyMakeWithCoordinate:zoom:]((uint64_t)self, v20, v31, v32, v27, v29);
      v74[1] = v33;
      v34 = -[GEOTileKeyList initWithCapacity:]([GEOTileKeyList alloc], "initWithCapacity:", 4);
      -[GEOTileKeyList addKey:](v34, "addKey:", v74);
      v35 = -45;
      v36 = 45.0;
      do
      {
        -[GEOLocation horizontalAccuracy](self->_location, "horizontalAccuracy");
        v38 = GEOCoordinate2DAlongBearing(v28, v30, v36, v37);
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = 0;
        *(_QWORD *)buf = -[GEOGeographicMetadataTileFetcher _tileKeyMakeWithCoordinate:zoom:]((uint64_t)self, v20, v39, v40, v38, v41);
        *(_QWORD *)&buf[8] = v42;
        -[GEOTileKeyList addKey:](v34, "addKey:", buf);
        v36 = v36 + 90.0;
        v35 += 90;
      }
      while (v35 < 0x10E);
      GEOGetGeographicMetadataLog();
      v43 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
      {
        -[GEOLocation horizontalAccuracy](self->_location, "horizontalAccuracy");
        v45 = (int)v44;
        v46 = -[GEOTileKeyList count](v34, "count");
        *(_DWORD *)buf = 68158723;
        *(_DWORD *)&buf[4] = 16;
        *(_WORD *)&buf[8] = 2097;
        *(_QWORD *)&buf[10] = v66;
        *(_WORD *)&buf[18] = 1025;
        *(_DWORD *)&buf[20] = v22;
        LOWORD(v68) = 1024;
        *(_DWORD *)((char *)&v68 + 2) = v45;
        HIWORD(v68) = 1025;
        LODWORD(v69) = v46;
        _os_log_impl(&dword_1885A9000, v43, OS_LOG_TYPE_DEBUG, "Coordinate %{private,geo:coordinate}.*P zoom %{private}d and radius %d will require %{private}d tile(s)", buf, 0x24u);
      }

      options = self->_options;
      v48 = (options >> 2) & 1;
      if ((options & 1) != 0)
        v49 = 11;
      else
        v49 = 3;
      v50 = v49 & 0xFFFFFFFFFFFFFEFFLL | ((((self->_options & 4) >> 2) & 1) << 8);
      *(_QWORD *)buf = v24;
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __72__GEOGeographicMetadataTileFetcher__fetchTilesForZoom_queue_completion___block_invoke;
      v68 = &unk_1E1C15170;
      v72 = (options & 2) != 0;
      v51 = v26;
      v73 = v48;
      v71 = v51;
      v69 = self;
      v52 = v25;
      v70 = v52;
      -[GEOGeographicMetadataTileFetcher _fetchTiles:withOptions:queue:completion:]((uint64_t)self, v34, v50, v52, buf);

      v53 = v65;
    }
  }
  else
  {
    v53 = CFSTR("RASTER_STANDARD");
    switch(self->_tileStyle)
    {
      case 0:
        break;
      case 1:
        v53 = CFSTR("VECTOR_STANDARD");
        break;
      case 2:
        v53 = CFSTR("VECTOR_TRAFFIC_SEGMENTS_FOR_RASTER");
        break;
      case 3:
        v53 = CFSTR("VECTOR_TRAFFIC_INCIDENTS_FOR_RASTER");
        break;
      case 4:
        v53 = CFSTR("VECTOR_TRAFFIC_SEGMENTS_AND_INCIDENTS_FOR_RASTER");
        break;
      case 5:
        v53 = CFSTR("RASTER_STANDARD_BACKGROUND");
        break;
      case 6:
        v53 = CFSTR("RASTER_HYBRID");
        break;
      case 7:
        v53 = CFSTR("RASTER_SATELLITE");
        break;
      case 8:
        v53 = CFSTR("RASTER_TERRAIN");
        break;
      case 0xB:
        v53 = CFSTR("VECTOR_BUILDINGS");
        break;
      case 0xC:
        v53 = CFSTR("VECTOR_TRAFFIC");
        break;
      case 0xD:
        v53 = CFSTR("VECTOR_POI");
        break;
      case 0xE:
        v53 = CFSTR("SPUTNIK_METADATA");
        break;
      case 0xF:
        v53 = CFSTR("SPUTNIK_C3M");
        break;
      case 0x10:
        v53 = CFSTR("SPUTNIK_DSM");
        break;
      case 0x11:
        v53 = CFSTR("SPUTNIK_DSM_GLOBAL");
        break;
      case 0x12:
        v53 = CFSTR("VECTOR_REALISTIC");
        break;
      case 0x13:
        v53 = CFSTR("VECTOR_LEGACY_REALISTIC");
        break;
      case 0x14:
        v53 = CFSTR("VECTOR_ROADS");
        break;
      case 0x15:
        v53 = CFSTR("RASTER_VEGETATION");
        break;
      case 0x16:
        v53 = CFSTR("VECTOR_TRAFFIC_SKELETON");
        break;
      case 0x17:
        v53 = CFSTR("RASTER_COASTLINE_MASK");
        break;
      case 0x18:
        v53 = CFSTR("RASTER_HILLSHADE");
        break;
      case 0x19:
        v53 = CFSTR("VECTOR_TRAFFIC_WITH_GREEN");
        break;
      case 0x1A:
        v53 = CFSTR("VECTOR_TRAFFIC_STATIC");
        break;
      case 0x1B:
        v53 = CFSTR("RASTER_COASTLINE_DROP_MASK");
        break;
      case 0x1C:
        v53 = CFSTR("VECTOR_TRAFFIC_SKELETON_WITH_HISTORICAL");
        break;
      case 0x1D:
        v53 = CFSTR("VECTOR_SPEED_PROFILES");
        break;
      case 0x1E:
        v53 = CFSTR("VECTOR_VENUES");
        break;
      case 0x1F:
        v53 = CFSTR("RASTER_DOWN_SAMPLED");
        break;
      case 0x20:
        v53 = CFSTR("RASTER_COLOR_BALANCED");
        break;
      case 0x21:
        v53 = CFSTR("RASTER_SATELLITE_NIGHT");
        break;
      case 0x22:
        v53 = CFSTR("SPUTNIK_VECTOR_BORDER");
        break;
      case 0x23:
        v53 = CFSTR("RASTER_SATELLITE_DIGITIZE");
        break;
      case 0x24:
        v53 = CFSTR("RASTER_HILLSHADE_PARKS");
        break;
      case 0x25:
        v53 = CFSTR("VECTOR_TRANSIT");
        break;
      case 0x26:
        v53 = CFSTR("RASTER_STANDARD_BASE");
        break;
      case 0x27:
        v53 = CFSTR("RASTER_STANDARD_LABELS");
        break;
      case 0x28:
        v53 = CFSTR("RASTER_HYBRID_ROADS");
        break;
      case 0x29:
        v53 = CFSTR("RASTER_HYBRID_LABELS");
        break;
      case 0x2A:
        v53 = CFSTR("FLYOVER_C3M_MESH");
        break;
      case 0x2B:
        v53 = CFSTR("FLYOVER_C3M_JPEG_TEXTURE");
        break;
      case 0x2C:
        v53 = CFSTR("FLYOVER_C3M_ASTC_TEXTURE");
        break;
      case 0x2D:
        v53 = CFSTR("RASTER_SATELLITE_ASTC");
        break;
      case 0x2E:
        v53 = CFSTR("RASTER_HYBRID_ROADS_AND_LABELS");
        break;
      case 0x2F:
        v53 = CFSTR("VECTOR_TRANSIT_SELECTION");
        break;
      case 0x30:
        v53 = CFSTR("VECTOR_COVERAGE");
        break;
      case 0x34:
        v53 = CFSTR("FLYOVER_METADATA");
        break;
      case 0x35:
        v53 = CFSTR("VECTOR_ROAD_NETWORK");
        break;
      case 0x36:
        v53 = CFSTR("VECTOR_LAND_COVER");
        break;
      case 0x37:
        v53 = CFSTR("VECTOR_DEBUG");
        break;
      case 0x38:
        v53 = CFSTR("VECTOR_STREET_POI");
        break;
      case 0x39:
        v53 = CFSTR("MUNIN_METADATA");
        break;
      case 0x3A:
        v53 = CFSTR("VECTOR_SPR_MERCATOR");
        break;
      case 0x3B:
        v53 = CFSTR("VECTOR_SPR_MODELS");
        break;
      case 0x3C:
        v53 = CFSTR("VECTOR_SPR_MATERIALS");
        break;
      case 0x3D:
        v53 = CFSTR("VECTOR_SPR_METADATA");
        break;
      case 0x3E:
        v53 = CFSTR("VECTOR_TRACKS");
        break;
      case 0x3F:
        v53 = CFSTR("VECTOR_RESERVED_2");
        break;
      case 0x40:
        v53 = CFSTR("VECTOR_STREET_LANDMARKS");
        break;
      case 0x41:
        v53 = CFSTR("COARSE_LOCATION_POLYGONS");
        break;
      case 0x42:
        v53 = CFSTR("VECTOR_SPR_ROADS");
        break;
      case 0x43:
        v53 = CFSTR("VECTOR_SPR_STANDARD");
        break;
      case 0x44:
        v53 = CFSTR("VECTOR_POI_V2");
        break;
      case 0x45:
        v53 = CFSTR("VECTOR_POLYGON_SELECTION");
        break;
      case 0x46:
        v53 = CFSTR("VL_METADATA");
        break;
      case 0x47:
        v53 = CFSTR("VL_DATA");
        break;
      case 0x48:
        v53 = CFSTR("PROACTIVE_APP_CLIP");
        break;
      case 0x49:
        v53 = CFSTR("VECTOR_BUILDINGS_V2");
        break;
      case 0x4A:
        v53 = CFSTR("POI_BUSYNESS");
        break;
      case 0x4B:
        v53 = CFSTR("POI_DP_BUSYNESS");
        break;
      case 0x4C:
        v53 = CFSTR("SMART_INTERFACE_SELECTION");
        break;
      case 0x4D:
        v53 = CFSTR("VECTOR_ASSETS");
        break;
      case 0x4E:
        v53 = CFSTR("SPR_ASSET_METADATA");
        break;
      case 0x4F:
        v53 = CFSTR("VECTOR_SPR_POLAR");
        break;
      case 0x50:
        v53 = CFSTR("SMART_DATA_MODE");
        break;
      case 0x51:
        v53 = CFSTR("CELLULAR_PERFORMANCE_SCORE");
        break;
      case 0x52:
        v53 = CFSTR("VECTOR_SPR_MODELS_OCCLUSION");
        break;
      case 0x53:
        v53 = CFSTR("VECTOR_TOPOGRAPHIC");
        break;
      case 0x54:
        v53 = CFSTR("VECTOR_POI_V2_UPDATE");
        break;
      case 0x55:
        v53 = CFSTR("VECTOR_LIVE_DATA_UPDATES");
        break;
      case 0x56:
        v53 = CFSTR("VECTOR_TRAFFIC_V2");
        break;
      case 0x57:
        v53 = CFSTR("VECTOR_ROAD_SELECTION");
        break;
      case 0x58:
        v53 = CFSTR("VECTOR_REGION_METADATA");
        break;
      case 0x59:
        v53 = CFSTR("RAY_TRACING");
        break;
      case 0x5A:
        v53 = CFSTR("VECTOR_CONTOURS");
        break;
      case 0x5B:
        v53 = CFSTR("RASTER_SATELLITE_POLAR");
        break;
      case 0x5C:
        v53 = CFSTR("VMAP4_ELEVATION");
        break;
      case 0x5D:
        v53 = CFSTR("VMAP4_ELEVATION_POLAR");
        break;
      case 0x5E:
        v53 = CFSTR("CELLULAR_COVERAGE_PLMN");
        break;
      case 0x5F:
        v53 = CFSTR("RASTER_SATELLITE_POLAR_NIGHT");
        break;
      case 0x60:
        v53 = CFSTR("UNUSED_96");
        break;
      case 0x61:
        v53 = CFSTR("UNUSED_97");
        break;
      case 0x62:
        v53 = CFSTR("UNUSED_98");
        break;
      case 0x63:
        v53 = CFSTR("UNUSED_99");
        break;
      case 0x64:
        v53 = CFSTR("UNUSED_100");
        break;
      case 0x65:
        v53 = CFSTR("UNUSED_101");
        break;
      case 0x66:
        v53 = CFSTR("UNUSED_102");
        break;
      case 0x67:
        v53 = CFSTR("UNUSED_103");
        break;
      case 0x68:
        v53 = CFSTR("UNUSED_104");
        break;
      case 0x69:
        v53 = CFSTR("UNUSED_105");
        break;
      case 0x6A:
        v53 = CFSTR("UNUSED_106");
        break;
      case 0x6B:
        v53 = CFSTR("UNUSED_107");
        break;
      case 0x6C:
        v53 = CFSTR("UNUSED_108");
        break;
      case 0x6D:
        v53 = CFSTR("UNUSED_109");
        break;
      case 0x6E:
        v53 = CFSTR("UNUSED_110");
        break;
      case 0x6F:
        v53 = CFSTR("UNUSED_111");
        break;
      case 0x70:
        v53 = CFSTR("UNUSED_112");
        break;
      case 0x71:
        v53 = CFSTR("UNUSED_113");
        break;
      case 0x72:
        v53 = CFSTR("UNUSED_114");
        break;
      case 0x73:
        v53 = CFSTR("UNUSED_115");
        break;
      case 0x74:
        v53 = CFSTR("UNUSED_116");
        break;
      case 0x75:
        v53 = CFSTR("UNUSED_117");
        break;
      case 0x76:
        v53 = CFSTR("UNUSED_118");
        break;
      case 0x77:
        v53 = CFSTR("UNUSED_119");
        break;
      default:
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_tileStyle);
        v53 = (__CFString *)objc_claimAutoreleasedReturnValue();
        break;
    }
    GEOGetGeographicMetadataLog();
    v60 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v53;
      _os_log_impl(&dword_1885A9000, v60, OS_LOG_TYPE_INFO, "%@ tile style not defined, will fail.", buf, 0xCu);
    }

    v61 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ tile style not defined."), v53);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "GEOErrorWithCode:reason:", -6, v62);
    v63 = (__CFString *)objc_claimAutoreleasedReturnValue();

    v7[2](v7, 0, v63);
  }

}

void __81__GEOGeographicMetadataTileFetcher_fetchMetadataForLocation_responseQueue_block___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *, void *);
  void *v20;
  id v21;
  id v22;
  id v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v5, "count"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 2, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0;
    v26 = &v25;
    v27 = 0x3032000000;
    v28 = __Block_byref_object_copy__85;
    v29 = __Block_byref_object_dispose__85;
    v30 = 0;
    v17 = MEMORY[0x1E0C809B0];
    v18 = 3221225472;
    v19 = __81__GEOGeographicMetadataTileFetcher_fetchMetadataForLocation_responseQueue_block___block_invoke_90;
    v20 = &unk_1E1C15198;
    v10 = v7;
    v21 = v10;
    v11 = v9;
    v22 = v11;
    v24 = &v25;
    v12 = v8;
    v23 = v12;
    objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", &v17);
    if (objc_msgSend(v12, "count", v17, v18, v19, v20))
      v13 = v12;
    else
      v13 = 0;
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 40), v13);
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 48), v9);
    v14 = *(_QWORD *)(a1 + 40);
    if (objc_msgSend(v10, "count"))
      v15 = v10;
    else
      v15 = 0;
    if (objc_msgSend(v10, "count"))
      v16 = 0;
    else
      v16 = v26[5];
    (*(void (**)(uint64_t, id, uint64_t))(v14 + 16))(v14, v15, v16);

    _Block_object_dispose(&v25, 8);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:underlyingError:", -2000, CFSTR("No tiles returned"), v6);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __81__GEOGeographicMetadataTileFetcher_fetchMetadataForLocation_responseQueue_block___block_invoke_90(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;

  v14 = a2;
  v5 = a3;
  if (objc_msgSend(v5, "hasFileDescriptor"))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3608]), "initWithFileDescriptor:closeOnDealloc:", objc_msgSend(v5, "consumeFileDescriptor"), 1);
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v14);
    v7 = *(void **)(a1 + 40);
  }
  else
  {
    objc_msgSend(v5, "fileURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -2001, CFSTR("Tile is missing a file"));
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v13 = *(void **)(v12 + 40);
      *(_QWORD *)(v12 + 40) = v11;

      goto LABEL_7;
    }
    objc_msgSend(v5, "fileURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v9, v14);

    v10 = *(void **)(a1 + 40);
    objc_msgSend(v5, "fileURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v10;
  }
  objc_msgSend(v7, "setObject:forKey:", v14, v6);

  objc_msgSend(*(id *)(a1 + 48), "addObject:", v5);
LABEL_7:

}

- (int)tileStyle
{
  return self->_tileStyle;
}

- (unsigned)mnc
{
  return self->_mnc;
}

- (unsigned)mcc
{
  return self->_mcc;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultItems, 0);
  objc_storeStrong((id *)&self->_tileDatas, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

@end
