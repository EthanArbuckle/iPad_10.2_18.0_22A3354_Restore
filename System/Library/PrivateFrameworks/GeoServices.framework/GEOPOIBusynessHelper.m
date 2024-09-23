@implementation GEOPOIBusynessHelper

- (GEOPOIBusynessHelper)init
{
  GEOPOIBusynessHelper *result;

  result = (GEOPOIBusynessHelper *)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GEOMethodNotAvailableException"), CFSTR("This method is unavailable."));
  __break(1u);
  return result;
}

+ (void)checkIsEnabledForLocation:(id)a3 radius:(int)a4 workQueue:(id)a5 result:(id)a6
{
  id v10;
  id v11;
  void (**v12)(id, _QWORD, void *);
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  unsigned __int8 v24;
  unsigned __int8 v25;
  unsigned __int8 v26;
  uint64_t v27;
  void *v28;
  NSObject *v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  _QWORD v36[4];
  id v37;
  void (**v38)(id, _QWORD, void *);
  uint8_t *v39;
  id v40;
  int v41;
  unsigned __int8 v42;
  unsigned __int8 v43;
  uint8_t buf[8];
  uint8_t *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = (void (**)(id, _QWORD, void *))a6;
  v13 = (void *)objc_msgSend(v10, "copy");
  objc_msgSend(v13, "setHorizontalAccuracy:", (double)a4);
  objc_msgSend(v13, "coordinate");
  v15 = v14;
  v17 = v16;
  +[GEOResourceManifestManager modernManager](GEOResourceManifestManager, "modernManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "activeTileGroup");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "activeTileSetForStyle:", 74);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    v21 = GEOMapPointForCoordinate(v15, v17);
    v23 = v22;
    v24 = objc_msgSend(v20, "minimumZoomLevelForMapPoint:");
    v25 = objc_msgSend(v20, "maximumZoomLevelForMapPoint:", v21, v23);
    v26 = v25;
    v27 = v24;
    if (v24 >= v25)
    {
      v31 = v25;
      v32 = (void *)MEMORY[0x1E0CB35C8];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Nonsense zooms. min: %d max: %d"), v27, v25);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "GEOErrorWithCode:reason:", -2006, v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      GEOGetPOIBusynessLog();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)&buf[4] = v27;
        LOWORD(v45) = 1024;
        *(_DWORD *)((char *)&v45 + 2) = v31;
        _os_log_impl(&dword_1885A9000, v35, OS_LOG_TYPE_FAULT, "Invalid zooms for tile style POI_BUSYNESS. min: %d max: %d", buf, 0xEu);
      }

      v12[2](v12, 0, v34);
    }
    else
    {
      *(_QWORD *)buf = 0;
      v45 = buf;
      v46 = 0x3032000000;
      v47 = __Block_byref_object_copy__80;
      v48 = __Block_byref_object_dispose__80;
      v49 = -[GEOGeographicMetadataTileFetcher initForTileStyle:options:]([GEOGeographicMetadataTileFetcher alloc], "initForTileStyle:options:", 74, 7);
      v28 = (void *)*((_QWORD *)v45 + 5);
      v36[0] = MEMORY[0x1E0C809B0];
      v36[1] = 3221225472;
      v36[2] = __74__GEOPOIBusynessHelper_checkIsEnabledForLocation_radius_workQueue_result___block_invoke;
      v36[3] = &unk_1E1C14158;
      v41 = a4;
      v38 = v12;
      v40 = a1;
      v42 = v24;
      v43 = v26;
      v37 = v13;
      v39 = buf;
      objc_msgSend(v28, "fetchMetadataForLocation:responseQueue:block:", v37, v11, v36);

      _Block_object_dispose(buf, 8);
    }
  }
  else
  {
    GEOGetPOIBusynessLog();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1885A9000, v29, OS_LOG_TYPE_INFO, "POI_BUSYNESS tile style not defined, will fail.", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -6, CFSTR("POI_BUSYNESS tile style not defined."));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v12[2](v12, 0, v30);

  }
}

void __74__GEOPOIBusynessHelper_checkIsEnabledForLocation_radius_workQueue_result___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  int v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;

  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v5, "count"))
  {
    v7 = *(_DWORD *)(a1 + 64);
    if (v7 <= 10)
      v7 = 10;
    if (v7 >= 250)
      v8 = 250;
    else
      v8 = v7;
    v9 = *(void **)(a1 + 56);
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(unsigned __int8 *)(a1 + 68);
    v12 = *(unsigned __int8 *)(a1 + 69);
    v17 = 0;
    objc_msgSend(v9, "_checkAvailablePOIForLocation:radius:minZoom:maxZoom:tiles:error:", v10, v8, v11, v12, v5, &v17);
    v13 = v17;
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v15 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = 0;

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:underlyingError:", -2000, CFSTR("No tiles returned"), v6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
}

+ (BOOL)_checkAvailablePOIForLocation:(id)a3 radius:(int)a4 minZoom:(unsigned __int8)a5 maxZoom:(unsigned __int8)a6 tiles:(id)a7 error:(id *)a8
{
  int v10;
  id v13;
  id v14;
  uint64_t v15;
  const unsigned __int8 *v16;
  double v17;
  double v18;
  void *v19;
  id v20;
  NSObject *v21;
  const char *v22;
  NSObject *v23;
  uint32_t v24;
  int v25;
  uint64_t v26;
  void *v27;
  BOOL v28;
  _QWORD v30[4];
  id v31;
  uint64_t *v32;
  uint64_t *v33;
  uint64_t *v34;
  unsigned __int8 v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  char v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  int v49;
  uint8_t buf[4];
  int v51;
  __int16 v52;
  int v53;
  __int16 v54;
  uint64_t v55;
  uint64_t v56;

  v10 = a6;
  v56 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a7;
  objc_msgSend(v13, "coordinate");
  GEOGetQuadKeysWithinRadiusFromCoordinate(v10, a4, v15, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = 0;
  v47 = &v46;
  v48 = 0x2020000000;
  v49 = 0;
  v42 = 0;
  v43 = &v42;
  v44 = 0x2020000000;
  v45 = 0;
  v36 = 0;
  v37 = &v36;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__80;
  v40 = __Block_byref_object_dispose__80;
  v41 = 0;
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __89__GEOPOIBusynessHelper__checkAvailablePOIForLocation_radius_minZoom_maxZoom_tiles_error___block_invoke;
  v30[3] = &unk_1E1C14180;
  v32 = &v36;
  v20 = v19;
  v35 = a5;
  v31 = v20;
  v33 = &v46;
  v34 = &v42;
  objc_msgSend(v14, "enumerateKeysAndObjectsUsingBlock:", v30);
  if (*((_BYTE *)v43 + 24))
  {
    GEOGetPOIBusynessLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      goto LABEL_7;
    *(_DWORD *)buf = 67109120;
    v51 = v10;
    v22 = "POI found at zoom %d, Analytics allowed";
    v23 = v21;
    v24 = 8;
  }
  else
  {
    GEOGetPOIBusynessLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      goto LABEL_7;
    v25 = *((_DWORD *)v47 + 6);
    v26 = v37[5];
    *(_DWORD *)buf = 67109634;
    v51 = v25;
    v52 = 1024;
    v53 = v10;
    v54 = 2112;
    v55 = v26;
    v22 = "No POIs found in %d tiles at zoom %d, Analytics disabled. Last error: %@";
    v23 = v21;
    v24 = 24;
  }
  _os_log_impl(&dword_1885A9000, v23, OS_LOG_TYPE_DEBUG, v22, buf, v24);
LABEL_7:

  if (*((_BYTE *)v43 + 24))
    v27 = 0;
  else
    v27 = (void *)v37[5];
  *a8 = objc_retainAutorelease(v27);
  v28 = *((_BYTE *)v43 + 24) != 0;

  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v42, 8);
  _Block_object_dispose(&v46, 8);

  return v28;
}

void __89__GEOPOIBusynessHelper__checkAvailablePOIForLocation_radius_minZoom_maxZoom_tiles_error___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  GEOGloriaDB *v9;
  uint64_t v10;
  void *v11;
  GEOGloriaDB *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  _BYTE *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = [GEOGloriaDB alloc];
  v10 = objc_msgSend(v7, "unsignedLongLongValue");
  GEOGetPOIBusynessLog();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[GEOGloriaDB initWithFileURL:rootQuadKey:metadataClass:dataClass:log:](v9, "initWithFileURL:rootQuadKey:metadataClass:dataClass:log:", v8, v10, 0, 0, v11);

  if (v12)
  {
    v23 = a4;
    v13 = objc_msgSend(v7, "unsignedLongLongValue");
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v14 = *(id *)(a1 + 32);
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v25;
      while (2)
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v25 != v17)
            objc_enumerationMutation(v14);
          v19 = objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "unsignedLongLongValue");
          if (GEOQuadKeyAncestorAt(v19, *(unsigned __int8 *)(a1 + 64)) == v13)
          {
            ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
            if (-[GEOGloriaDB containsQuadKey:](v12, "containsQuadKey:", v19))
            {
              *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
              *v23 = 1;
              goto LABEL_14;
            }
          }
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        if (v16)
          continue;
        break;
      }
    }
LABEL_14:

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -2003, CFSTR("DB returned nil"));
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v22 = *(void **)(v21 + 40);
    *(_QWORD *)(v21 + 40) = v20;

  }
}

+ (id)dpClientVersionHashWithMCPOIBusynessVersion:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("GEO:%@.MC:%@"), CFSTR("1"), a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataUsingEncoding:", 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_geo_MD5Hash");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_geo_hexString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (void)generateDPPOIBusynessForLocation:(id)a3 radii:(id)a4 workQueue:(id)a5 result:(id)a6
{
  id v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  unsigned __int8 v17;
  unsigned __int8 v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  uint64_t i;
  int v25;
  unsigned int v26;
  uint64_t v27;
  void *v28;
  double v29;
  NSObject *v30;
  void *v31;
  int v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  uint64_t v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  unsigned __int8 v44;
  unsigned __int8 v45;
  void *v47;
  id v48;
  void (**v49)(id, _QWORD, void *);
  void *v50;
  void *v51;
  id obj;
  _QWORD v53[4];
  id v54;
  id v55;
  void (**v56)(id, _QWORD, void *);
  _BYTE *v57;
  id v58;
  unsigned __int8 v59;
  unsigned __int8 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _BYTE buf[24];
  uint64_t (*v66)(uint64_t, uint64_t);
  void (*v67)(uint64_t);
  id v68;
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  obj = a4;
  v48 = a5;
  v49 = (void (**)(id, _QWORD, void *))a6;
  v47 = v9;
  v51 = (void *)objc_msgSend(v9, "copy");
  +[GEOResourceManifestManager modernManager](GEOResourceManifestManager, "modernManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "activeTileGroup");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "activeTileSetForStyle:", 75);
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  if (v50)
  {
    objc_msgSend(v51, "coordinate");
    v14 = GEOMapPointForCoordinate(v12, v13);
    v16 = v15;
    v17 = objc_msgSend(v50, "minimumZoomLevelForMapPoint:");
    v18 = objc_msgSend(v50, "maximumZoomLevelForMapPoint:", v14, v16);
    v19 = v17;
    if (v17 >= v18)
    {
      v32 = v18;
      v33 = (void *)MEMORY[0x1E0CB35C8];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Nonsense zooms. min: %d max: %d"), v19, v18);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "GEOErrorWithCode:reason:", -2006, v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      GEOGetPOIBusynessLog();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)&buf[4] = v19;
        *(_WORD *)&buf[8] = 1024;
        *(_DWORD *)&buf[10] = v32;
        _os_log_impl(&dword_1885A9000, v36, OS_LOG_TYPE_FAULT, "Invalid zooms for tile style POI_DP_BUSYNESS. min: %d max: %d", buf, 0xEu);
      }

      v49[2](v49, MEMORY[0x1E0C9AA70], v35);
    }
    else
    {
      v44 = v18;
      v45 = v17;
      objc_msgSend(MEMORY[0x1E0C99E10], "orderedSetWithCapacity:", objc_msgSend(obj, "count"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = 0u;
      v64 = 0u;
      v61 = 0u;
      v62 = 0u;
      obj = obj;
      v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v69, 16);
      if (v21)
      {
        v22 = 0;
        v23 = *(_QWORD *)v62;
        do
        {
          for (i = 0; i != v21; ++i)
          {
            if (*(_QWORD *)v62 != v23)
              objc_enumerationMutation(obj);
            v25 = objc_msgSend(*(id *)(*((_QWORD *)&v61 + 1) + 8 * i), "intValue");
            if (v25 <= 10)
              v26 = 10;
            else
              v26 = v25;
            if (v26 >= 0xFA)
              v27 = 250;
            else
              v27 = v26;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v27);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "addObject:", v28);

            if (v22 <= (int)v27)
              v22 = v27;
          }
          v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v69, 16);
        }
        while (v21);
        v29 = (double)v22;
      }
      else
      {
        v29 = 0.0;
      }

      v37 = objc_msgSend(v20, "count");
      if (v37 == objc_msgSend(obj, "count"))
        goto LABEL_30;
      GEOGetPOIBusynessLog();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v20;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = obj;
        _os_log_impl(&dword_1885A9000, v38, OS_LOG_TYPE_ERROR, "Clamped radii (%@) has fewer than the original (%@)", buf, 0x16u);
      }

      if (objc_msgSend(v20, "count"))
      {
LABEL_30:
        objc_msgSend(v20, "array");
        v39 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v51, "setHorizontalAccuracy:", v29);
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x3032000000;
        v66 = __Block_byref_object_copy__80;
        v67 = __Block_byref_object_dispose__80;
        v68 = -[GEOGeographicMetadataTileFetcher initForTileStyle:options:]([GEOGeographicMetadataTileFetcher alloc], "initForTileStyle:options:", 75, 7);
        v40 = *(void **)(*(_QWORD *)&buf[8] + 40);
        v53[0] = MEMORY[0x1E0C809B0];
        v53[1] = 3221225472;
        v53[2] = __80__GEOPOIBusynessHelper_generateDPPOIBusynessForLocation_radii_workQueue_result___block_invoke;
        v53[3] = &unk_1E1C141A8;
        v56 = v49;
        v58 = a1;
        v54 = v51;
        v59 = v45;
        v60 = v44;
        obj = v39;
        v55 = obj;
        v57 = buf;
        objc_msgSend(v40, "fetchMetadataForLocation:responseQueue:block:", v54, v48, v53);

        _Block_object_dispose(buf, 8);
      }
      else
      {
        v41 = (void *)MEMORY[0x1E0CB35C8];
        objc_msgSend(obj, "componentsJoinedByString:", CFSTR(", "));
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "GEOErrorWithCode:reason:", -2007, v42);
        v43 = (void *)objc_claimAutoreleasedReturnValue();

        v49[2](v49, MEMORY[0x1E0C9AA70], v43);
      }
    }
  }
  else
  {
    GEOGetPOIBusynessLog();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1885A9000, v30, OS_LOG_TYPE_INFO, "POI_DP_BUSYNESS tile style not defined, will fail.", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -6, CFSTR("POI_DP_BUSYNESS tile style not defined."));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v49[2](v49, MEMORY[0x1E0C9AA70], v31);

  }
}

void __80__GEOPOIBusynessHelper_generateDPPOIBusynessForLocation_radii_workQueue_result___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;

  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v5, "count"))
  {
    v7 = *(void **)(a1 + 64);
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(_QWORD *)(a1 + 40);
    v10 = *(unsigned __int8 *)(a1 + 72);
    v11 = *(unsigned __int8 *)(a1 + 73);
    v17 = 0;
    objc_msgSend(v7, "_generateDPPOIBusynessForLocation:radii:minZoom:maxZoom:dpBusynessTiles:error:", v8, v9, v10, v11, v5, &v17);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v17;
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v15 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = 0;

    if (v12)
      v16 = v12;
    else
      v16 = (void *)MEMORY[0x1E0C9AA70];
    (*(void (**)(_QWORD, void *, id))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), v16, v13);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:underlyingError:", -2000, CFSTR("No tiles returned"), v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

+ (id)_generateDPPOIBusynessForLocation:(id)a3 radii:(id)a4 minZoom:(unsigned __int8)a5 maxZoom:(unsigned __int8)a6 dpBusynessTiles:(id)a7 error:(id *)a8
{
  int v9;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  int v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  uint64_t v25;
  const unsigned __int8 *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  void *v32;
  void *v33;
  id v34;
  id v37;
  void *v40;
  _QWORD v41[4];
  id v42;
  id v43;
  id v44;
  uint64_t *v45;
  id v46;
  double v47;
  double v48;
  int v49;
  int v50;
  unsigned __int8 v51;
  char v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t (*v56)(uint64_t, uint64_t);
  void (*v57)(uint64_t);
  id v58;

  v9 = a6;
  v11 = a3;
  v37 = a4;
  v12 = a7;
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v12;
  if ((GEOConfigGetBOOL(GeoServicesConfig_POIBusynessDPUseUTC, (uint64_t)off_1EDF4DF78) & 1) != 0)
    objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneForSecondsFromGMT:", 0);
  else
    objc_msgSend(MEMORY[0x1E0C99E80], "localTimeZone");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTimeZone:", v14);

  v15 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v11, "timestamp");
  objc_msgSend(v15, "dateWithTimeIntervalSinceReferenceDate:");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "components:fromDate:", 544, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "weekday") - 1;
  v19 = objc_msgSend(v17, "hour");
  objc_msgSend(v11, "coordinate");
  v21 = v20;
  v23 = v22;
  objc_msgSend(v11, "horizontalAccuracy");
  GEOGetQuadKeysWithinRadiusFromCoordinate(v9, (int)v24, v25, v26, v21, v23);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = 0;
  v54 = &v53;
  v55 = 0x3032000000;
  v56 = __Block_byref_object_copy__80;
  v57 = __Block_byref_object_dispose__80;
  v58 = 0;
  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __102__GEOPOIBusynessHelper__generateDPPOIBusynessForLocation_radii_minZoom_maxZoom_dpBusynessTiles_error___block_invoke;
  v41[3] = &unk_1E1C141D0;
  v46 = a1;
  v47 = v21;
  v48 = v23;
  v49 = v18;
  v50 = v19;
  v29 = v37;
  v42 = v29;
  v51 = a5;
  v52 = v9;
  v30 = v27;
  v43 = v30;
  v31 = v28;
  v44 = v31;
  v45 = &v53;
  objc_msgSend(v40, "enumerateKeysAndObjectsUsingBlock:", v41);
  if (objc_msgSend(v31, "count"))
    v32 = 0;
  else
    v32 = (void *)v54[5];
  *a8 = objc_retainAutorelease(v32);
  v33 = v44;
  v34 = v31;

  _Block_object_dispose(&v53, 8);
  return v34;
}

void __102__GEOPOIBusynessHelper__generateDPPOIBusynessForLocation_radii_minZoom_maxZoom_dpBusynessTiles_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  id v21;

  v5 = *(void **)(a1 + 64);
  v6 = a3;
  v7 = objc_msgSend(a2, "unsignedLongLongValue");
  v8 = *(unsigned int *)(a1 + 88);
  v9 = *(unsigned int *)(a1 + 92);
  v10 = *(unsigned __int8 *)(a1 + 96);
  v11 = *(_BYTE *)(a1 + 97);
  v12 = *(_QWORD *)(a1 + 32);
  v13 = *(_QWORD *)(a1 + 40);
  v14 = *(double *)(a1 + 72);
  v15 = *(double *)(a1 + 80);
  v21 = 0;
  LOBYTE(v20) = v11;
  objc_msgSend(v5, "_generateDPPOIBusynessForCoordinate:tileId:dpBusynessTileURL:dayOfWeek:hourOfDay:radii:minZoom:maxZoom:tileIds:error:", v7, v6, v8, v9, v12, v10, v14, v15, v20, v13, &v21);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = v21;
  v18 = v21;
  objc_msgSend(*(id *)(a1 + 48), "addEntriesFromDictionary:", v16);
  v19 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  if (!*(_QWORD *)(v19 + 40))
    goto LABEL_4;
  if (!objc_msgSend(v16, "count"))
  {
    v19 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
LABEL_4:
    objc_storeStrong((id *)(v19 + 40), v17);
  }

}

+ (id)_generateDPPOIBusynessForCoordinate:(id)a3 tileId:(unint64_t)a4 dpBusynessTileURL:(id)a5 dayOfWeek:(unsigned int)a6 hourOfDay:(unsigned int)a7 radii:(id)a8 minZoom:(unsigned __int8)a9 maxZoom:(unsigned __int8)a10 tileIds:(id)a11 error:(id *)a12
{
  unsigned int v12;
  uint64_t v14;
  uint64_t v15;
  double var1;
  double var0;
  GEOGloriaDB *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  GEOGloriaDB *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  unint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  unint64_t v36;
  uint64_t v37;
  int v38;
  _QWORD *v39;
  uint64_t v40;
  double v41;
  uint64_t v42;
  id v43;
  uint64_t v44;
  unint64_t v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t k;
  void *v49;
  double v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  unint64_t v55;
  id v56;
  NSObject *v57;
  id obj;
  uint64_t v60;
  uint64_t v61;
  id v62;
  id v63;
  uint64_t j;
  _QWORD *v65;
  id v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  GEOGloriaDB *v71;
  int v72;
  unint64_t v73;
  unint64_t UInteger;
  id v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  _QWORD v88[5];
  uint64_t v89;
  uint64_t *v90;
  uint64_t v91;
  int v92;
  uint8_t buf[4];
  int v94;
  __int16 v95;
  int v96;
  __int16 v97;
  int v98;
  _BYTE v99[128];
  _BYTE v100[128];
  _QWORD v101[5];
  _BYTE v102[128];
  uint64_t v103;

  v12 = a9;
  v14 = *(_QWORD *)&a7;
  v15 = *(_QWORD *)&a6;
  var1 = a3.var1;
  var0 = a3.var0;
  v103 = *MEMORY[0x1E0C80C00];
  v63 = a5;
  v66 = a8;
  v62 = a11;
  v19 = [GEOGloriaDB alloc];
  v20 = objc_opt_class();
  v21 = objc_opt_class();
  GEOGetPOIBusynessLog();
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[GEOGloriaDB initWithFileURL:rootQuadKey:metadataClass:dataClass:log:](v19, "initWithFileURL:rootQuadKey:metadataClass:dataClass:log:", v63, a4, v20, v21, v22);

  v71 = v23;
  if (v23)
  {
    v89 = 0;
    v90 = &v89;
    v91 = 0x2020000000;
    v92 = 0;
    v88[0] = MEMORY[0x1E0C809B0];
    v88[1] = 3221225472;
    v88[2] = __141__GEOPOIBusynessHelper__generateDPPOIBusynessForCoordinate_tileId_dpBusynessTileURL_dayOfWeek_hourOfDay_radii_minZoom_maxZoom_tileIds_error___block_invoke;
    v88[3] = &unk_1E1C141F8;
    v88[4] = &v89;
    if (-[GEOGloriaDB unsafeMetadata:](v23, "unsafeMetadata:", v88))
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v62, "count"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v86 = 0u;
      v87 = 0u;
      v84 = 0u;
      v85 = 0u;
      v25 = v62;
      v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v84, v102, 16);
      if (v26)
      {
        v72 = 0;
        v27 = *(_QWORD *)v85;
        do
        {
          for (i = 0; i != v26; ++i)
          {
            if (*(_QWORD *)v85 != v27)
              objc_enumerationMutation(v25);
            v29 = objc_msgSend(*(id *)(*((_QWORD *)&v84 + 1) + 8 * i), "unsignedLongLongValue");
            if (GEOQuadKeyAncestorAt(v29, v12) == a4)
            {
              -[GEOGloriaDB dataForQuadKey:](v71, "dataForQuadKey:", v29);
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              if (v30)
                objc_msgSend(v24, "addObject:", v30);

              ++v72;
            }
          }
          v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v84, v102, 16);
        }
        while (v26);
      }
      else
      {
        v72 = 0;
      }

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%llu"), a4);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v101[0] = v31;
      v101[1] = &stru_1E1C241D0;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), v15);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v101[2] = v32;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), v14);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v101[3] = v33;
      v101[4] = &stru_1E1C241D0;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v101, 5);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = (void *)objc_msgSend(v34, "mutableCopy");

      UInteger = GEOConfigGetUInteger(GeoServicesConfig_POIBusynessDPSliceSize, (uint64_t)off_1EDF4DF68);
      v36 = *((unsigned int *)v90 + 6);
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v75 = (id)objc_claimAutoreleasedReturnValue();
      v82 = 0u;
      v83 = 0u;
      v80 = 0u;
      v81 = 0u;
      obj = v24;
      v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v80, v100, 16);
      if (v37)
      {
        v38 = 0;
        v60 = v37;
        v61 = *(_QWORD *)v81;
        v73 = v36 / UInteger;
        do
        {
          for (j = 0; j != v60; ++j)
          {
            if (*(_QWORD *)v81 != v61)
              objc_enumerationMutation(obj);
            v39 = *(_QWORD **)(*((_QWORD *)&v80 + 1) + 8 * j);
            if (v39)
            {
              -[GEOBusynessPoiLookupTile _readLatitudeE7s](*(_QWORD *)(*((_QWORD *)&v80 + 1) + 8 * j));
              v69 = v39[2];
              -[GEOBusynessPoiLookupTile _readLongitudeE7s]((uint64_t)v39);
              v68 = v39[5];
              -[GEOBusynessPoiLookupTile _readLatitudeE7s]((uint64_t)v39);
              v67 = v39[3];
              if (v67)
              {
                v65 = v39;
                v40 = 0;
                do
                {
                  v70 = v40;
                  v41 = GEOCalculateDistanceRadius(var0, var1, (double)*(int *)(v69 + 4 * v40) * 0.0000001, (double)*(int *)(v68 + 4 * v40) * 0.0000001, 6367000.0);
                  v42 = *((unsigned int *)v65 + 19);
                  v78 = 0u;
                  v79 = 0u;
                  v76 = 0u;
                  v77 = 0u;
                  v43 = v66;
                  v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v76, v99, 16);
                  if (v44)
                  {
                    v45 = (v70 + v42) / UInteger;
                    v46 = (v70 + v42) % UInteger;
                    v47 = *(_QWORD *)v77;
                    do
                    {
                      for (k = 0; k != v44; ++k)
                      {
                        if (*(_QWORD *)v77 != v47)
                          objc_enumerationMutation(v43);
                        v49 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * k);
                        objc_msgSend(v49, "doubleValue");
                        if (v41 < v50)
                        {
                          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), objc_msgSend(v49, "intValue"));
                          v51 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v35, "setObject:atIndexedSubscript:", v51, 1);

                          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), v45);
                          v52 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v35, "setObject:atIndexedSubscript:", v52, 4);

                          objc_msgSend(v35, "componentsJoinedByString:", CFSTR("."));
                          v53 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v75, "objectForKeyedSubscript:", v53);
                          v54 = (void *)objc_claimAutoreleasedReturnValue();
                          if (!v54)
                          {
                            v55 = UInteger;
                            if (v45 >= v73)
                              v55 = *((unsigned int *)v90 + 6) % UInteger;
                            objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", v55);
                            v54 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v75, "setObject:forKeyedSubscript:", v54, v53);
                          }
                          v56 = objc_retainAutorelease(v54);
                          *(_BYTE *)(objc_msgSend(v56, "mutableBytes") + v46) = 1;

                          ++v38;
                        }
                      }
                      v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v76, v99, 16);
                    }
                    while (v44);
                  }

                  v40 = v70 + 1;
                }
                while (v70 + 1 != v67);
              }
            }
          }
          v60 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v80, v100, 16);
        }
        while (v60);
      }
      else
      {
        v38 = 0;
      }

      GEOGetPOIBusynessLog();
      v57 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67175169;
        v94 = v38;
        v95 = 1025;
        v96 = v72;
        v97 = 1025;
        v98 = a10;
        _os_log_impl(&dword_1885A9000, v57, OS_LOG_TYPE_DEBUG, "Found %{private}d DP matches in %{private}d tiles at zoom %{private}d", buf, 0x14u);
      }

      *a12 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -2005, CFSTR("DB metadata was invalid"));
      *a12 = (id)objc_claimAutoreleasedReturnValue();
      v75 = (id)MEMORY[0x1E0C9AA70];
    }
    _Block_object_dispose(&v89, 8);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -2003, CFSTR("DB returned nil"));
    *a12 = (id)objc_claimAutoreleasedReturnValue();
    v75 = (id)MEMORY[0x1E0C9AA70];
  }

  return v75;
}

BOOL __141__GEOPOIBusynessHelper__generateDPPOIBusynessForCoordinate_tileId_dpBusynessTileURL_dayOfWeek_hourOfDay_radii_minZoom_maxZoom_tileIds_error___block_invoke(uint64_t a1, uint64_t a2)
{
  int v2;

  if (a2)
    v2 = *(_DWORD *)(a2 + 24);
  else
    v2 = 0;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v2;
  return *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) != 0;
}

@end
