@implementation GEOGeographicMetadataRequester

- (id)_doTerritoryRegulatoryLookup:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  GEOGloriaDB *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  GEOGloriaDB *v17;
  GEOGloriaDB *v18;
  void *v19;
  void *v20;
  GEOGloriaDB *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  NSObject *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  id v46;
  id v47;
  void *v48;
  void *v49;
  GEOGeographicMetadataRequester *v51;
  id *v52;
  _QWORD v53[4];
  id v54;
  GEOGloriaDB *v55;
  id v56;
  id v57;
  id v58;
  id v59;
  uint8_t buf[4];
  id v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "stringByAppendingPathComponent:", CFSTR("tiles/data"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingPathComponent:", CFSTR("names/data"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "fileExistsAtPath:", v7) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "fileExistsAtPath:", v8);

    if ((v11 & 1) != 0)
    {
      v51 = self;
      v52 = a4;
      v12 = [GEOGloriaDB alloc];
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v7);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_opt_class();
      v15 = objc_opt_class();
      GEOGetGeographicMetadataLog();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[GEOGloriaDB initWithFileURL:rootQuadKey:metadataClass:dataClass:log:](v12, "initWithFileURL:rootQuadKey:metadataClass:dataClass:log:", v13, 0, v14, v15, v16);

      if (!v17)
      {
        v34 = (void *)MEMORY[0x1E0CB35C8];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to open Gloria tile DB at \"%@\"), v7);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "GEOErrorWithCode:reason:", -17, v35);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

        v33 = 0;
LABEL_27:

        goto LABEL_28;
      }
      v18 = [GEOGloriaDB alloc];
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v8);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      GEOGetGeographicMetadataLog();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = -[GEOGloriaDB initWithFileURL:rootQuadKey:log:](v18, "initWithFileURL:rootQuadKey:log:", v19, 0, v20);

      if (!v21)
      {
        v36 = (void *)MEMORY[0x1E0CB35C8];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to open Gloria name DB at \"%@\"), v8);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "GEOErrorWithCode:reason:", -17, v37);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

        v33 = 0;
LABEL_26:

        goto LABEL_27;
      }
      objc_msgSend(v6, "stringByAppendingPathComponent:", CFSTR("ISO_Country_Codes_31661_3to2.plist"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "fileExistsAtPath:", v22);

      if (!v24)
      {
        v28 = 0;
LABEL_22:
        if (objc_msgSend(v28, "count"))
        {
          -[GEOGeographicMetadataRequester location](v51, "location");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99E20], "set");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "coordinate");
          v41 = v40;
          v43 = v42;
          objc_msgSend(v38, "horizontalAccuracy");
          v45 = v44;
          v53[0] = MEMORY[0x1E0C809B0];
          v53[1] = 3221225472;
          v53[2] = __69__GEOGeographicMetadataRequester__doTerritoryRegulatoryLookup_error___block_invoke;
          v53[3] = &unk_1E1C05F58;
          v54 = v38;
          v55 = v21;
          v56 = v28;
          v46 = v39;
          v57 = v46;
          v47 = v38;
          -[GEOGloriaDB unsafeEnumerateDataAtLocation:radius:visitor:](v17, "unsafeEnumerateDataAtLocation:radius:visitor:", v53, v41, v43, v45);
          v48 = v57;
          v33 = v46;

        }
        else
        {
          v49 = (void *)MEMORY[0x1E0CB35C8];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to read ISO 3 to 2 mapping at \"%@\"), v22);
          v47 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "GEOErrorWithCode:reason:", -17, v47);
          v33 = 0;
          *v52 = (id)objc_claimAutoreleasedReturnValue();
        }

        goto LABEL_26;
      }
      v59 = 0;
      v25 = v22;
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:options:error:", v22, 0, &v59);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v59;
      if (!objc_msgSend(v26, "length") || v27)
      {
        GEOGetGeographicMetadataLog();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1885A9000, v30, OS_LOG_TYPE_ERROR, "Could not read ISO 3 to 2 cc mapping", buf, 2u);
        }
        v28 = 0;
      }
      else
      {
        v58 = 0;
        objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v26, 0, 0, &v58);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = v58;
        v27 = v29;
        if (v28 && !v29)
          goto LABEL_21;
        GEOGetGeographicMetadataLog();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v61 = v27;
          _os_log_impl(&dword_1885A9000, v30, OS_LOG_TYPE_ERROR, "Could not read ISO 3 to 2 cc mapping: %@", buf, 0xCu);
        }
      }

LABEL_21:
      v22 = v25;
      goto LABEL_22;
    }
  }
  else
  {

  }
  v31 = (void *)MEMORY[0x1E0CB35C8];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DB missing, expected dbs at \"%@\" and \"%@\"), v7, v8);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "GEOErrorWithCode:reason:", -17, v32);
  *a4 = (id)objc_claimAutoreleasedReturnValue();

  v33 = 0;
LABEL_28:

  return v33;
}

void __69__GEOGeographicMetadataRequester__doTerritoryRegulatoryLookup_error___block_invoke(uint64_t a1, unint64_t a2, void *a3)
{
  id *v5;
  NSObject *v6;
  int v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  id *v13;
  GEOTerritoryRegulatoryInfo *v14;
  id *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t v20[128];
  uint8_t buf[4];
  id *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  unint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  GEOGetGeographicMetadataLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    if (v5)
      v7 = objc_msgSend(v5[1], "count");
    else
      v7 = 0;
    *(_DWORD *)buf = 134218497;
    v22 = v5;
    v23 = 1025;
    v24 = v7;
    v25 = 2049;
    v26 = a2;
    _os_log_impl(&dword_1885A9000, v6, OS_LOG_TYPE_DEBUG, "Got tileData %p with %{private}d infos for quadKey %{private}llu", buf, 0x1Cu);
  }

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v15 = v5;
  -[GEOTerritoryDataTileData territorys](v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        v13 = *(id **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (GEOTerritoryDataTerritoryInfoContainsLocation(v13, a2, *(void **)(a1 + 32)))
        {
          v14 = -[GEOTerritoryRegulatoryInfo initWithUnsafeTerritoryData:nameDB:iso3to2Mapping:]([GEOTerritoryRegulatoryInfo alloc], "initWithUnsafeTerritoryData:nameDB:iso3to2Mapping:", v13, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
          if (v14)
            objc_msgSend(*(id *)(a1 + 56), "addObject:", v14);
        }
        else
        {
          GEOGetGeographicMetadataLog();
          v14 = (GEOTerritoryRegulatoryInfo *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(&v14->super, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138477827;
            v22 = v13;
            _os_log_impl(&dword_1885A9000, &v14->super, OS_LOG_TYPE_DEBUG, "Did not match info %{private}@", buf, 0xCu);
          }
        }

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }

}

void __110__GEOGeographicMetadataRequester__fetchPossibleTerritoriesForLocation_retryCount_responseQueue_responseBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v2 = *(void **)(v1 + 40);
  *(_QWORD *)(v1 + 40) = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong(&self->_responseTerritoryBlock, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong(&self->_processBlock, 0);
  objc_storeStrong((id *)&self->_fetcher, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_lastError, 0);
  objc_storeStrong((id *)&self->_lastUsedTileKeysMaxZoom, 0);
  objc_storeStrong((id *)&self->_lastUsedTileKeysMinZoom, 0);
  objc_storeStrong((id *)&self->_nextLocation, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_isolater, 0);
}

+ (void)_fetchPossibleTerritoriesForLocation:(id)a3 retryCount:(unint64_t)a4 responseQueue:(id)a5 responseBlock:(id)a6
{
  NSObject *v8;
  id v9;
  void *v10;
  double v11;
  double Double;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  _QWORD block[4];
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  GEOGeographicMetadataRequester *v25;

  v8 = a5;
  v9 = a6;
  v10 = (void *)objc_msgSend(a3, "copy");
  objc_msgSend(v10, "horizontalAccuracy");
  if (v11 <= GEOConfigGetDouble(GeoServicesConfig_TerritoryRegulatoryMinimumRadius, (uint64_t)off_1EDF4DFB8))
    Double = GEOConfigGetDouble(GeoServicesConfig_TerritoryRegulatoryMinimumRadius, (uint64_t)off_1EDF4DFB8);
  else
    objc_msgSend(v10, "horizontalAccuracy");
  objc_msgSend(v10, "setHorizontalAccuracy:", Double);
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__16;
  v24 = __Block_byref_object_dispose__16;
  v25 = -[GEOGeographicMetadataRequester initWithType:mcc:mnc:queue:delegate:territoryBlock:]([GEOGeographicMetadataRequester alloc], "initWithType:mcc:mnc:queue:delegate:territoryBlock:", 0, 0, 0, v8, 0, v9);
  if (v21[5])
  {
    v13 = objc_msgSend(v10, "copy");
    v14 = v21[5];
    v15 = *(void **)(v14 + 24);
    *(_QWORD *)(v14 + 24) = v13;

    v16 = (void *)v21[5];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __110__GEOGeographicMetadataRequester__fetchPossibleTerritoriesForLocation_retryCount_responseQueue_responseBlock___block_invoke_2;
    v17[3] = &unk_1E1C03348;
    v17[4] = &v20;
    objc_msgSend(v16, "_fetchTerritories:", v17);
  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __110__GEOGeographicMetadataRequester__fetchPossibleTerritoriesForLocation_retryCount_responseQueue_responseBlock___block_invoke;
    block[3] = &unk_1E1C01F48;
    v19 = v9;
    dispatch_async(v8, block);

  }
  _Block_object_dispose(&v20, 8);

}

+ (void)fetchPossibleTerritoriesForLocation:(id)a3 responseQueue:(id)a4 responseBlock:(id)a5
{
  objc_msgSend(a1, "_fetchPossibleTerritoriesForLocation:retryCount:responseQueue:responseBlock:", a3, 0, a4, a5);
}

- (GEOGeographicMetadataRequester)initWithType:(unint64_t)a3 mcc:(unsigned __int16)a4 mnc:(unsigned __int16)a5 queue:(id)a6 delegate:(id)a7 territoryBlock:(id)a8
{
  uint64_t v11;
  uint64_t v12;
  id v15;
  unint64_t v16;
  unint64_t v17;
  GEOGeographicMetadataRequester *v18;
  GEOGeographicMetadataRequester *v19;
  uint64_t v20;
  geo_isolater *isolater;
  uint64_t global_queue;
  OS_dispatch_queue *workQueue;
  id v24;
  id WeakRetained;
  id responseTerritoryBlock;
  uint64_t v27;
  uint64_t *v28;
  GEOGeographicMetadataRegulatoryFetcher *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  GEOGeographicMetadataFetcher *fetcher;
  GEOGeographicMetadataRequester *v34;
  NSObject *v36;
  const char *v37;
  GEOGeographicMetadataRequester *v38;
  uint8_t buf[16];
  objc_super v40;

  v11 = a5;
  v12 = a4;
  v15 = a6;
  v16 = (unint64_t)a7;
  v17 = (unint64_t)a8;
  v40.receiver = self;
  v40.super_class = (Class)GEOGeographicMetadataRequester;
  v18 = -[GEOGeographicMetadataRequester init](&v40, sel_init);
  v19 = v18;
  if (!v18)
    goto LABEL_29;
  if (!(v16 | v17))
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
LABEL_29:
      v34 = 0;
      goto LABEL_25;
    }
    *(_WORD *)buf = 0;
    v36 = MEMORY[0x1E0C81028];
    v37 = "Assertion failed: delegate != ((void *)0) || territoryBlock != ((void *)0)";
LABEL_31:
    _os_log_fault_impl(&dword_1885A9000, v36, OS_LOG_TYPE_FAULT, v37, buf, 2u);
    goto LABEL_29;
  }
  v38 = v18;
  v20 = geo_isolater_create_with_format();
  isolater = v19->_isolater;
  v19->_isolater = (geo_isolater *)v20;

  v19->_type = a3;
  qos_class_self();
  global_queue = geo_get_global_queue();
  workQueue = v19->_workQueue;
  v19->_workQueue = (OS_dispatch_queue *)global_queue;

  objc_storeStrong((id *)&v19->_delegateQueue, a6);
  if (v16)
  {
    v24 = objc_storeWeak((id *)&v19->_delegate, (id)v16);
    v19->_delegateSupportsNoChange = objc_opt_respondsToSelector() & 1;

    WeakRetained = objc_loadWeakRetained((id *)&v19->_delegate);
    v19->_delegateSupportsErrors = objc_opt_respondsToSelector() & 1;

    responseTerritoryBlock = objc_loadWeakRetained((id *)&v19->_delegate);
    v19->_delegateSupportsSkipNotifications = objc_opt_respondsToSelector() & 1;
  }
  else
  {
    if (!v17)
      goto LABEL_8;
    v27 = objc_msgSend((id)v17, "copy", v38);
    responseTerritoryBlock = v19->_responseTerritoryBlock;
    v19->_responseTerritoryBlock = (id)v27;
  }

LABEL_8:
  v28 = &GEOConfigKey_InvalidBOOL;
  switch(a3)
  {
    case 0uLL:
      v29 = objc_alloc_init(GEOGeographicMetadataRegulatoryFetcher);
      goto LABEL_22;
    case 1uLL:
      goto LABEL_13;
    case 2uLL:
      v28 = &GeoServicesConfig_SmartDataModeAllowCellular;
      goto LABEL_13;
    case 3uLL:
      v28 = &GeoServicesConfig_CellPerfScoreAllowCellular;
      goto LABEL_13;
    case 4uLL:
      v28 = &GeoServicesConfig_CellCoverageAllowCellular;
LABEL_13:
      v30 = 2;
      if (*v28)
      {
        v31 = v28[1];
        if (v31)
        {
          if (GEOConfigGetBOOL(*v28, v31))
            v30 = 6;
          else
            v30 = 7;
        }
      }
      if (a3 - 1 > 3)
        v32 = 0xFFFFFFFFLL;
      else
        v32 = dword_189CCC540[a3 - 1];
      v29 = -[GEOGeographicMetadataTileFetcher initForTileStyle:mcc:mnc:options:]([GEOGeographicMetadataTileFetcher alloc], "initForTileStyle:mcc:mnc:options:", v32, v12, v11, v30);
LABEL_22:
      fetcher = v19->_fetcher;
      v19->_fetcher = (GEOGeographicMetadataFetcher *)v29;

      break;
    default:
      break;
  }
  if (!v19->_fetcher)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      goto LABEL_29;
    *(_WORD *)buf = 0;
    v36 = MEMORY[0x1E0C81028];
    v37 = "Assertion failed: _fetcher != ((void *)0)";
    goto LABEL_31;
  }
  v34 = v19;
LABEL_25:

  return v34;
}

- (GEOGeographicMetadataRequester)initWithDataType:(unint64_t)a3 delegateQueue:(id)a4 delegate:(id)a5
{
  id v8;
  id v9;
  GEOGeographicMetadataRequester *v10;
  _DWORD v12[2];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  if (a3 <= 4 && ((1 << a3) & 0x1A) != 0)
  {
    self = -[GEOGeographicMetadataRequester initWithType:mcc:mnc:queue:delegate:territoryBlock:](self, "initWithType:mcc:mnc:queue:delegate:territoryBlock:", a3, 0, 0, v8, v9, 0);
    v10 = self;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      v12[0] = 67109120;
      v12[1] = a3;
      _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Unreachable reached: Invalid type: %d", (uint8_t *)v12, 8u);
    }
    v10 = 0;
  }

  return v10;
}

- (id)initSmartDataModeDataWithMcc:(unsigned __int16)a3 mnc:(unsigned __int16)a4 delegateQueue:(id)a5 delegate:(id)a6
{
  uint64_t v7;
  uint64_t v8;
  id v10;
  id v11;
  GEOGeographicMetadataRequester *v12;
  uint8_t v14[16];

  v7 = a4;
  v8 = a3;
  v10 = a5;
  v11 = a6;
  if ((_DWORD)v8 && (_DWORD)v7)
  {
    self = -[GEOGeographicMetadataRequester initWithType:mcc:mnc:queue:delegate:territoryBlock:](self, "initWithType:mcc:mnc:queue:delegate:territoryBlock:", 2, v8, v7, v10, v11, 0);
    v12 = self;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: mcc != 0 && mnc != 0", v14, 2u);
    }
    v12 = 0;
  }

  return v12;
}

- (void)reportCorrupt:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  GEOGetGeographicMetadataLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_1885A9000, v5, OS_LOG_TYPE_DEBUG, "Reporting corrupt resource at \"%@\", (uint8_t *)&v6, 0xCu);
  }

  -[GEOGeographicMetadataFetcher reportCorrupt:](self->_fetcher, "reportCorrupt:", v4);
}

- (unint64_t)metadataType
{
  unint64_t type;
  _DWORD v4[2];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  type = self->_type;
  if (type - 1 >= 4)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      v4[0] = 67109120;
      v4[1] = type;
      _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Unreachable reached: Invalid _type(%u)", (uint8_t *)v4, 8u);
    }
    return -1;
  }
  return type;
}

- (unsigned)mcc
{
  unint64_t type;
  NSObject *v4;
  const char *v5;
  uint32_t v6;
  _DWORD v8[2];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  type = self->_type;
  if (type > 4)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      return -1;
    v8[0] = 67109120;
    v8[1] = type;
    v4 = MEMORY[0x1E0C81028];
    v5 = "Unreachable reached: Invalid _type(%u)";
    v6 = 8;
LABEL_6:
    _os_log_fault_impl(&dword_1885A9000, v4, OS_LOG_TYPE_FAULT, v5, (uint8_t *)v8, v6);
    return -1;
  }
  if (type != 2)
    return -1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      return -1;
    LOWORD(v8[0]) = 0;
    v4 = MEMORY[0x1E0C81028];
    v5 = "Assertion failed: [_fetcher isKindOfClass:GEOGeographicMetadataTileFetcher.class]";
    v6 = 2;
    goto LABEL_6;
  }
  return -[GEOGeographicMetadataFetcher mcc](self->_fetcher, "mcc");
}

- (unsigned)mnc
{
  unint64_t type;
  NSObject *v4;
  const char *v5;
  uint32_t v6;
  _DWORD v8[2];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  type = self->_type;
  if (type > 4)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      return -1;
    v8[0] = 67109120;
    v8[1] = type;
    v4 = MEMORY[0x1E0C81028];
    v5 = "Unreachable reached: Invalid _type(%u)";
    v6 = 8;
LABEL_6:
    _os_log_fault_impl(&dword_1885A9000, v4, OS_LOG_TYPE_FAULT, v5, (uint8_t *)v8, v6);
    return -1;
  }
  if (type != 2)
    return -1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      return -1;
    LOWORD(v8[0]) = 0;
    v4 = MEMORY[0x1E0C81028];
    v5 = "Assertion failed: [_fetcher isKindOfClass:GEOGeographicMetadataTileFetcher.class]";
    v6 = 2;
    goto LABEL_6;
  }
  return -[GEOGeographicMetadataFetcher mnc](self->_fetcher, "mnc");
}

+ (void)fetchDataForLocation:(id)a3 type:(unint64_t)a4 responseQueue:(id)a5 responseBlock:(id)a6
{
  id v9;
  NSObject *v10;
  id v11;
  GEOGeographicMetadataRequester *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v19[6];
  _QWORD block[4];
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  GEOGeographicMetadataRequester *v27;
  _QWORD v28[4];
  id v29;
  id v30;
  uint8_t buf[8];
  uint8_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  _GEOGeographicMetadataRequesterDelegateDataBlockAdapter *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  v11 = a6;
  if (a4 <= 4 && ((1 << a4) & 0x1A) != 0)
  {
    *(_QWORD *)buf = 0;
    v32 = buf;
    v33 = 0x3032000000;
    v34 = __Block_byref_object_copy__16;
    v35 = __Block_byref_object_dispose__16;
    v36 = -[_GEOGeographicMetadataRequesterDelegateDataBlockAdapter initWithBlock:]([_GEOGeographicMetadataRequesterDelegateDataBlockAdapter alloc], "initWithBlock:", v11);
    v22 = 0;
    v23 = &v22;
    v24 = 0x3032000000;
    v25 = __Block_byref_object_copy__16;
    v26 = __Block_byref_object_dispose__16;
    v12 = [GEOGeographicMetadataRequester alloc];
    v27 = -[GEOGeographicMetadataRequester initWithType:mcc:mnc:queue:delegate:territoryBlock:](v12, "initWithType:mcc:mnc:queue:delegate:territoryBlock:", a4, 0, 0, v10, *((_QWORD *)v32 + 5), 0);
    if (v23[5])
    {
      v13 = objc_msgSend(v9, "copy");
      v14 = v23[5];
      v15 = *(void **)(v14 + 24);
      *(_QWORD *)(v14 + 24) = v13;

      v16 = (void *)v23[5];
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __88__GEOGeographicMetadataRequester_fetchDataForLocation_type_responseQueue_responseBlock___block_invoke_2;
      v19[3] = &unk_1E1C05E68;
      v19[4] = &v22;
      v19[5] = buf;
      objc_msgSend(v16, "_fetchData:", v19);
    }
    else
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __88__GEOGeographicMetadataRequester_fetchDataForLocation_type_responseQueue_responseBlock___block_invoke_22;
      block[3] = &unk_1E1C01F48;
      v21 = v11;
      dispatch_async(v10, block);

    }
    _Block_object_dispose(&v22, 8);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid GEOGeographicMetadataType: %d"), a4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __88__GEOGeographicMetadataRequester_fetchDataForLocation_type_responseQueue_responseBlock___block_invoke;
    v28[3] = &unk_1E1BFF970;
    v29 = v17;
    v30 = v11;
    v18 = v17;
    dispatch_async(v10, v28);
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = a4;
      _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Unreachable reached: Invalid type: %d", buf, 8u);
    }

  }
}

void __88__GEOGeographicMetadataRequester_fetchDataForLocation_type_responseQueue_responseBlock___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -10, *(_QWORD *)(a1 + 32));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

uint64_t __88__GEOGeographicMetadataRequester_fetchDataForLocation_type_responseQueue_responseBlock___block_invoke_22(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __88__GEOGeographicMetadataRequester_fetchDataForLocation_type_responseQueue_responseBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = 0;

}

+ (void)fetchSmartDataModeDataForLocation:(id)a3 mcc:(unsigned __int16)a4 mnc:(unsigned __int16)a5 responseQueue:(id)a6 responseBlock:(id)a7
{
  uint64_t v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  id v13;
  uint64_t v14;
  id v15;
  GEOGeographicMetadataRequester *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  _QWORD v21[6];
  _QWORD v22[4];
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  GEOGeographicMetadataRequester *v29;
  uint8_t buf[8];
  uint8_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  _GEOGeographicMetadataRequesterDelegateDataBlockAdapter *v35;
  _QWORD block[4];
  id v37;
  id v38;

  v9 = a5;
  v10 = a4;
  v11 = a3;
  v12 = a6;
  v13 = a7;
  v14 = MEMORY[0x1E0C809B0];
  if (v10 <= 0x3E7 && v9 < 0x3E8)
  {
LABEL_6:
    *(_QWORD *)buf = 0;
    v31 = buf;
    v32 = 0x3032000000;
    v33 = __Block_byref_object_copy__16;
    v34 = __Block_byref_object_dispose__16;
    v35 = -[_GEOGeographicMetadataRequesterDelegateDataBlockAdapter initWithBlock:]([_GEOGeographicMetadataRequesterDelegateDataBlockAdapter alloc], "initWithBlock:", v13);
    v24 = 0;
    v25 = &v24;
    v26 = 0x3032000000;
    v27 = __Block_byref_object_copy__16;
    v28 = __Block_byref_object_dispose__16;
    v16 = [GEOGeographicMetadataRequester alloc];
    v29 = -[GEOGeographicMetadataRequester initWithType:mcc:mnc:queue:delegate:territoryBlock:](v16, "initWithType:mcc:mnc:queue:delegate:territoryBlock:", 2, v10, v9, v12, *((_QWORD *)v31 + 5), 0);
    if (v25[5])
    {
      v17 = objc_msgSend(v11, "copy");
      v18 = v25[5];
      v19 = *(void **)(v18 + 24);
      *(_QWORD *)(v18 + 24) = v17;

      v20 = (void *)v25[5];
      v21[0] = v14;
      v21[1] = 3221225472;
      v21[2] = __104__GEOGeographicMetadataRequester_fetchSmartDataModeDataForLocation_mcc_mnc_responseQueue_responseBlock___block_invoke_2;
      v21[3] = &unk_1E1C05E68;
      v21[4] = &v24;
      v21[5] = buf;
      objc_msgSend(v20, "_fetchData:", v21);
    }
    else
    {
      v22[0] = v14;
      v22[1] = 3221225472;
      v22[2] = __104__GEOGeographicMetadataRequester_fetchSmartDataModeDataForLocation_mcc_mnc_responseQueue_responseBlock___block_invoke_25;
      v22[3] = &unk_1E1C01F48;
      v23 = v13;
      dispatch_async(v12, v22);

    }
    _Block_object_dispose(&v24, 8);

    _Block_object_dispose(buf, 8);
    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid MCC (%hu) or MNC (%hu) must be in the range [0, 999]"), v10, v9);
  block[0] = v14;
  block[1] = 3221225472;
  block[2] = __104__GEOGeographicMetadataRequester_fetchSmartDataModeDataForLocation_mcc_mnc_responseQueue_responseBlock___block_invoke;
  block[3] = &unk_1E1BFF970;
  v37 = (id)objc_claimAutoreleasedReturnValue();
  v38 = v13;
  v15 = v37;
  dispatch_async(v12, block);
  if (v10 <= 0x3E7 && v9 < 0x3E8)
  {

    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: mcc <= 999 && mnc <= 999", buf, 2u);
  }

LABEL_10:
}

void __104__GEOGeographicMetadataRequester_fetchSmartDataModeDataForLocation_mcc_mnc_responseQueue_responseBlock___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -10, *(_QWORD *)(a1 + 32));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

uint64_t __104__GEOGeographicMetadataRequester_fetchSmartDataModeDataForLocation_mcc_mnc_responseQueue_responseBlock___block_invoke_25(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __104__GEOGeographicMetadataRequester_fetchSmartDataModeDataForLocation_mcc_mnc_responseQueue_responseBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = 0;

}

- (void)_fetchData:(id)a3
{
  id v4;
  void *v5;
  id completionBlock;
  void *v7;
  id processBlock;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *, void *);
  void *v12;
  id v13;
  id location;

  v4 = a3;
  v5 = (void *)objc_msgSend(v4, "copy");
  completionBlock = self->_completionBlock;
  self->_completionBlock = v5;

  objc_initWeak(&location, self);
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __45__GEOGeographicMetadataRequester__fetchData___block_invoke;
  v12 = &unk_1E1C05E90;
  objc_copyWeak(&v13, &location);
  v7 = (void *)MEMORY[0x18D765024](&v9);
  processBlock = self->_processBlock;
  self->_processBlock = v7;

  -[GEOGeographicMetadataRequester _fetch](self, "_fetch", v9, v10, v11, v12);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

void __45__GEOGeographicMetadataRequester__fetchData___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "_processResponse:error:", v6, v5);

}

- (void)_processResponse:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void (**v11)(_QWORD);
  NSSet *lastUsedTileKeysMaxZoom;
  uint64_t v13;
  unint64_t retryCounter;
  NSObject *v15;
  id completionBlock;
  NSObject *v17;
  NSObject *delegateQueue;
  _QWORD v19[5];
  id v20;
  _QWORD *v21;
  _QWORD *v22;
  uint8_t buf[16];
  _QWORD v24[8];
  _QWORD v25[5];
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;
  _QWORD v31[5];
  id v32;
  _QWORD block[5];
  id v34;

  v6 = a3;
  v7 = a4;
  if (!v7 && objc_msgSend(v6, "count"))
  {
    v9 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v6, "allKeys");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setWithArray:", v10);
    v11 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();

    if (!-[NSSet isEqualToSet:](self->_lastUsedTileKeysMinZoom, "isEqualToSet:", v11))
    {
      lastUsedTileKeysMaxZoom = self->_lastUsedTileKeysMaxZoom;
      self->_lastUsedTileKeysMaxZoom = 0;

    }
    v31[0] = 0;
    v31[1] = v31;
    v31[2] = 0x3032000000;
    v31[3] = __Block_byref_object_copy__16;
    v31[4] = __Block_byref_object_dispose__16;
    v32 = 0;
    v27 = 0;
    v28 = &v27;
    v29 = 0x2020000000;
    v30 = 0;
    v25[0] = 0;
    v25[1] = v25;
    v25[2] = 0x3032000000;
    v25[3] = __Block_byref_object_copy__16;
    v25[4] = __Block_byref_object_dispose__16;
    v26 = 0;
    v13 = MEMORY[0x1E0C809B0];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __57__GEOGeographicMetadataRequester__processResponse_error___block_invoke_2;
    v24[3] = &unk_1E1C05EB8;
    v24[4] = self;
    v24[5] = v31;
    v24[6] = &v27;
    v24[7] = v25;
    objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v24);
    if (*((_BYTE *)v28 + 24))
    {
      retryCounter = self->_retryCounter;
      if (retryCounter < GEOConfigGetUInteger(GeoServicesConfig_MAResourceCorruptMaxRetries, (uint64_t)off_1EDF4E108))
      {
        GEOGetGeographicMetadataLog();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1885A9000, v15, OS_LOG_TYPE_INFO, "Reported corrupt tile resource, will retry request", buf, 2u);
        }

        ++self->_retryCounter;
        -[GEOGeographicMetadataRequester _fetch](self, "_fetch");
        goto LABEL_18;
      }
      if (*((_BYTE *)v28 + 24))
      {
        GEOGetGeographicMetadataLog();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1885A9000, v17, OS_LOG_TYPE_ERROR, "Reported corrupt tile resource but out of retries, will return whatever we've got", buf, 2u);
        }

      }
    }
    objc_storeStrong((id *)&self->_lastUsedTileKeysMinZoom, v11);
    delegateQueue = self->_delegateQueue;
    v19[0] = v13;
    v19[1] = 3221225472;
    v19[2] = __57__GEOGeographicMetadataRequester__processResponse_error___block_invoke_30;
    v19[3] = &unk_1E1C03ED8;
    v19[4] = self;
    v20 = 0;
    v21 = v31;
    v22 = v25;
    dispatch_async(delegateQueue, v19);

LABEL_18:
    _Block_object_dispose(v25, 8);

    _Block_object_dispose(&v27, 8);
    _Block_object_dispose(v31, 8);

    goto LABEL_19;
  }
  if (!self->_delegateSupportsErrors)
  {
    v11 = (void (**)(_QWORD))MEMORY[0x18D765024](self->_completionBlock);
    completionBlock = self->_completionBlock;
    self->_completionBlock = 0;

    v11[2](v11);
LABEL_19:

    goto LABEL_20;
  }
  v8 = self->_delegateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__GEOGeographicMetadataRequester__processResponse_error___block_invoke;
  block[3] = &unk_1E1C00738;
  block[4] = self;
  v34 = v7;
  dispatch_async(v8, block);

LABEL_20:
}

void __57__GEOGeographicMetadataRequester__processResponse_error___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void (**v8)(void);

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 112));
  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v3, "location");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "geoGeographicMetadataRequester:failedWithError:forLocation:", v3, v4, v5);

  v8 = (void (**)(void))MEMORY[0x18D765024](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 136));
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 136);
  *(_QWORD *)(v6 + 136) = 0;

  v8[2]();
}

void __57__GEOGeographicMetadataRequester__processResponse_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id obj;

  v5 = a3;
  v6 = *(void **)(a1 + 32);
  v7 = objc_msgSend(a2, "unsignedLongLongValue");
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  obj = *(id *)(v8 + 40);
  objc_msgSend(v6, "_doSimpleLookup:rootQuadKey:error:", v5, v7, &obj);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v8 + 40), obj);
  v10 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (v10)
  {
    objc_msgSend(v10, "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    GEOErrorDomain();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v11, "isEqual:", v12) & 1) != 0)
    {
      v13 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "code");

      if (v13 == -17)
      {
        objc_msgSend(*(id *)(a1 + 32), "reportCorrupt:", v5);
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
      }
    }
    else
    {

    }
  }
  if (v9)
  {
    v14 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    if (!v14)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v17 = *(void **)(v16 + 40);
      *(_QWORD *)(v16 + 40) = v15;

      v14 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    }
    objc_msgSend(v14, "addObjectsFromArray:", v9);
  }

}

void __57__GEOGeographicMetadataRequester__processResponse_error___block_invoke_30(_QWORD *a1)
{
  uint64_t v2;
  id WeakRetained;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void (**v12)(void);

  if (*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40))
  {
    v2 = a1[4];
    if (*(_BYTE *)(v2 + 121))
    {
      WeakRetained = objc_loadWeakRetained((id *)(v2 + 112));
      v4 = (void *)a1[4];
      v5 = a1[5];
      objc_msgSend(v4, "location");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "geoGeographicMetadataRequester:failedWithError:forLocation:", v4, v5, v6);
LABEL_8:

      v2 = a1[4];
    }
  }
  else
  {
    v2 = a1[4];
    if (*(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40))
    {
      WeakRetained = objc_loadWeakRetained((id *)(v2 + 112));
      v7 = (void *)a1[4];
      v8 = *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40);
      objc_msgSend(v7, "location");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "geoGeographicMetadataRequester:returnedNewResults:forLocation:", v7, v8, v6);
      goto LABEL_8;
    }
    if (*(_BYTE *)(v2 + 120))
    {
      WeakRetained = objc_loadWeakRetained((id *)(v2 + 112));
      v9 = (void *)a1[4];
      objc_msgSend(v9, "location");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "geoGeographicMetadataRequester:resultsDidNotChangeForLocation:", v9, v6);
      goto LABEL_8;
    }
  }
  v12 = (void (**)(void))MEMORY[0x18D765024](*(_QWORD *)(v2 + 136));
  v10 = a1[4];
  v11 = *(void **)(v10 + 136);
  *(_QWORD *)(v10 + 136) = 0;

  v12[2]();
}

uint64_t __110__GEOGeographicMetadataRequester__fetchPossibleTerritoriesForLocation_retryCount_responseQueue_responseBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_fetchTerritories:(id)a3
{
  id v4;
  void *v5;
  id completionBlock;
  void *v7;
  id processBlock;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *, void *);
  void *v12;
  id v13;
  id location;

  v4 = a3;
  v5 = (void *)objc_msgSend(v4, "copy");
  completionBlock = self->_completionBlock;
  self->_completionBlock = v5;

  objc_initWeak(&location, self);
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __52__GEOGeographicMetadataRequester__fetchTerritories___block_invoke;
  v12 = &unk_1E1C05E90;
  objc_copyWeak(&v13, &location);
  v7 = (void *)MEMORY[0x18D765024](&v9);
  processBlock = self->_processBlock;
  self->_processBlock = v7;

  -[GEOGeographicMetadataRequester _fetch](self, "_fetch", v9, v10, v11, v12);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

void __52__GEOGeographicMetadataRequester__fetchTerritories___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "_processTerritories:error:", v6, v5);

}

- (void)_processTerritories:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  unint64_t retryCounter;
  unint64_t UInteger;
  _BOOL4 v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *delegateQueue;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  _QWORD block[5];
  id v28;
  uint8_t buf[4];
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v7 && objc_msgSend(v6, "count") == 1)
  {
    objc_msgSend(v6, "allValues");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "path");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0;
    -[GEOGeographicMetadataRequester _doTerritoryRegulatoryLookup:error:](self, "_doTerritoryRegulatoryLookup:error:", v10, &v26);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v26;
    v13 = v12;
    if (v12)
    {
      objc_msgSend(v12, "domain");
      v14 = objc_claimAutoreleasedReturnValue();
      GEOErrorDomain();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if ((-[NSObject isEqual:](v14, "isEqual:", v15) & 1) == 0)
      {

LABEL_17:
        goto LABEL_18;
      }
      v16 = objc_msgSend(v13, "code");

      if (v16 == -17)
      {
        -[GEOGeographicMetadataRequester reportCorrupt:](self, "reportCorrupt:", v9);
        retryCounter = self->_retryCounter;
        UInteger = GEOConfigGetUInteger(GeoServicesConfig_MAResourceCorruptMaxRetries, (uint64_t)off_1EDF4E108);
        GEOGetGeographicMetadataLog();
        v14 = objc_claimAutoreleasedReturnValue();
        v19 = os_log_type_enabled(v14, OS_LOG_TYPE_INFO);
        if (retryCounter < UInteger)
        {
          if (v19)
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1885A9000, v14, OS_LOG_TYPE_INFO, "Reported corrupt MAResource, will retry request", buf, 2u);
          }

          ++self->_retryCounter;
          -[GEOGeographicMetadataRequester _fetch](self, "_fetch");
          goto LABEL_19;
        }
        if (v19)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1885A9000, v14, OS_LOG_TYPE_INFO, "Reported corrupt MAResource but out of retries, will fail", buf, 2u);
        }
        goto LABEL_17;
      }
    }
LABEL_18:
    delegateQueue = self->_delegateQueue;
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __60__GEOGeographicMetadataRequester__processTerritories_error___block_invoke_33;
    v23[3] = &unk_1E1C01790;
    v23[4] = self;
    v24 = v11;
    v25 = v13;
    dispatch_async(delegateQueue, v23);

LABEL_19:
    goto LABEL_15;
  }
  GEOGetGeographicMetadataLog();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 138412290;
    v30 = v7;
    _os_log_impl(&dword_1885A9000, v20, OS_LOG_TYPE_FAULT, "Got error and/or nil path when trying to locate the territory db. This should never happen: %@", buf, 0xCu);
  }

  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -13, CFSTR("Missing territory db"));
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v21 = self->_delegateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__GEOGeographicMetadataRequester__processTerritories_error___block_invoke;
  block[3] = &unk_1E1C00738;
  block[4] = self;
  v28 = v7;
  v13 = v7;
  dispatch_async(v21, block);

LABEL_15:
}

void __60__GEOGeographicMetadataRequester__processTerritories_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void (**v4)(void);

  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 128) + 16))();
  v4 = (void (**)(void))MEMORY[0x18D765024](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 136));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 136);
  *(_QWORD *)(v2 + 136) = 0;

  v4[2]();
}

void __60__GEOGeographicMetadataRequester__processTerritories_error___block_invoke_33(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void (**v9)(void);

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 128);
  v3 = objc_msgSend(*(id *)(a1 + 40), "count");
  v4 = *(void **)(a1 + 40);
  if (objc_msgSend(v4, "count"))
    v5 = 0;
  else
    v5 = *(_QWORD *)(a1 + 48);
  if (v3)
    v6 = v4;
  else
    v6 = 0;
  (*(void (**)(uint64_t, void *, uint64_t))(v2 + 16))(v2, v6, v5);
  v9 = (void (**)(void))MEMORY[0x18D765024](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 136));
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 136);
  *(_QWORD *)(v7 + 136) = 0;

  v9[2]();
}

- (GEOLocation)location
{
  void *v3;
  geo_isolater *v5;

  v5 = self->_isolater;
  _geo_isolate_lock_data();
  v3 = (void *)-[GEOLocation copy](self->_location, "copy");
  _geo_isolate_unlock();

  return (GEOLocation *)v3;
}

- (void)setLocation:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  NSObject *delegateQueue;
  void *v8;
  _QWORD v9[5];
  _QWORD block[11];
  id v11;
  uint64_t *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;

  v4 = a3;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__16;
  v18 = __Block_byref_object_dispose__16;
  v19 = 0;
  v5 = MEMORY[0x1E0C809B0];
  block[6] = MEMORY[0x1E0C809B0];
  block[7] = 3221225472;
  block[8] = __46__GEOGeographicMetadataRequester_setLocation___block_invoke;
  block[9] = &unk_1E1C05EE0;
  v12 = &v20;
  v13 = &v14;
  block[10] = self;
  v6 = v4;
  v11 = v6;
  geo_isolate_sync_data();
  if (*((_BYTE *)v21 + 24))
  {
    if (v15[5] && self->_delegateSupportsSkipNotifications)
    {
      delegateQueue = self->_delegateQueue;
      block[0] = v5;
      block[1] = 3221225472;
      block[2] = __46__GEOGeographicMetadataRequester_setLocation___block_invoke_2;
      block[3] = &unk_1E1BFF920;
      block[4] = self;
      block[5] = &v14;
      dispatch_async(delegateQueue, block);
    }
  }
  else
  {
    v9[0] = v5;
    v9[1] = 3221225472;
    v9[2] = __46__GEOGeographicMetadataRequester_setLocation___block_invoke_3;
    v9[3] = &unk_1E1BFF6F8;
    v9[4] = self;
    v8 = (void *)MEMORY[0x18D765024](v9);
    if (self->_responseTerritoryBlock)
      -[GEOGeographicMetadataRequester _fetchTerritories:](self, "_fetchTerritories:", v8);
    else
      -[GEOGeographicMetadataRequester _fetchData:](self, "_fetchData:", v8);

  }
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
}

void __46__GEOGeographicMetadataRequester_setLocation___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 72);
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 32));
    v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 32);
    *(_QWORD *)(v3 + 32) = v2;

  }
  else
  {
    v5 = objc_msgSend(*(id *)(a1 + 40), "copy");
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 24);
    *(_QWORD *)(v6 + 24) = v5;

    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 72) = 1;
  }
}

void __46__GEOGeographicMetadataRequester_setLocation___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 112));
  objc_msgSend(WeakRetained, "geoGeographicMetadataRequester:skippedLocation:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));

}

void __46__GEOGeographicMetadataRequester_setLocation___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  id v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3032000000;
  v7 = __Block_byref_object_copy__16;
  v8 = __Block_byref_object_dispose__16;
  v9 = 0;
  v2 = MEMORY[0x1E0C809B0];
  v3 = *(_QWORD *)(a1 + 32);
  geo_isolate_sync_data();
  if (v5[5])
    objc_msgSend(*(id *)(a1 + 32), "setLocation:", v2, 3221225472, __46__GEOGeographicMetadataRequester_setLocation___block_invoke_4, &unk_1E1BFF920, v3, &v4);
  _Block_object_dispose(&v4, 8);

}

void __46__GEOGeographicMetadataRequester_setLocation___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 72) = 0;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 32));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 32);
  *(_QWORD *)(v2 + 32) = 0;

}

- (void)_fetch
{
  int BOOL;
  id v4;
  uint64_t *v5;
  char v6;
  GEOLocationShifter *v7;
  void *v8;
  double v9;
  double v10;
  uint64_t v11;
  _QWORD v12[5];
  _QWORD v13[4];
  id v14;
  GEOGeographicMetadataRequester *v15;
  uint8_t buf[16];

  if (self->_processBlock)
  {
    switch(self->_type)
    {
      case 0uLL:
        BOOL = GEOConfigGetBOOL(GeoServicesConfig_TerritoryRegulatoryAssetIsShiftedInChina, (uint64_t)off_1EDF4DFA8);
        -[GEOGeographicMetadataRequester location](self, "location");
        v4 = (id)objc_claimAutoreleasedReturnValue();
        if (BOOL)
          goto LABEL_11;
        goto LABEL_14;
      case 1uLL:
        v5 = &GeoServicesConfig_SmartInterfaceSelectionIsShiftedInChina;
        goto LABEL_10;
      case 2uLL:
        v5 = &GeoServicesConfig_SmartDataModeIsShiftedInChina;
        goto LABEL_10;
      case 3uLL:
        v5 = &GeoServicesConfig_CellPerfScoreIsShiftedInChina;
        goto LABEL_10;
      case 4uLL:
        v5 = &GeoServicesConfig_CellCoverageIsShiftedInChina;
LABEL_10:
        v6 = GEOConfigGetBOOL(*v5, v5[1]);
        -[GEOGeographicMetadataRequester location](self, "location");
        v4 = (id)objc_claimAutoreleasedReturnValue();
        if ((v6 & 1) == 0)
          goto LABEL_14;
LABEL_11:
        if (objc_msgSend(v4, "referenceFrame") == 2
          || (objc_msgSend(v4, "coordinate"),
              !+[GEOLocationShifter isLocationShiftRequiredForCoordinate:](GEOLocationShifter, "isLocationShiftRequiredForCoordinate:")))
        {
LABEL_14:
          -[GEOGeographicMetadataFetcher fetchMetadataForLocation:responseQueue:block:](self->_fetcher, "fetchMetadataForLocation:responseQueue:block:", v4, self->_workQueue, self->_processBlock);
        }
        else
        {
          v7 = objc_alloc_init(GEOLocationShifter);
          objc_msgSend(v4, "latLng");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "horizontalAccuracy");
          v10 = v9;
          v11 = MEMORY[0x1E0C809B0];
          v13[0] = MEMORY[0x1E0C809B0];
          v13[1] = 3221225472;
          v13[2] = __40__GEOGeographicMetadataRequester__fetch__block_invoke;
          v13[3] = &unk_1E1C05F08;
          v4 = v4;
          v14 = v4;
          v15 = self;
          v12[0] = v11;
          v12[1] = 3221225472;
          v12[2] = __40__GEOGeographicMetadataRequester__fetch__block_invoke_3;
          v12[3] = &unk_1E1C00E10;
          v12[4] = self;
          -[GEOLocationShifter shiftLatLng:accuracy:withCompletionHandler:mustGoToNetworkCallback:errorHandler:callbackQueue:](v7, "shiftLatLng:accuracy:withCompletionHandler:mustGoToNetworkCallback:errorHandler:callbackQueue:", v8, v13, 0, v12, self->_workQueue, v10);

        }
        break;
      default:
        -[GEOGeographicMetadataRequester location](self, "location");
        v4 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_14;
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: _processBlock != ((void *)0)", buf, 2u);
  }
}

void __40__GEOGeographicMetadataRequester__fetch__block_invoke(uint64_t a1, double a2, double a3)
{
  GEOLatLng *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  v4 = -[GEOLatLng initWithCoordinate:]([GEOLatLng alloc], "initWithCoordinate:", a2, a3);
  objc_msgSend(*(id *)(a1 + 32), "setLatLng:", v4);

  objc_msgSend(*(id *)(a1 + 32), "setReferenceFrame:", 2);
  v5 = MEMORY[0x1E0C809B0];
  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(id *)(a1 + 32);
  geo_isolate_sync_data();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 88), "fetchMetadataForLocation:responseQueue:block:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 80), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 96), v5, 3221225472, __40__GEOGeographicMetadataRequester__fetch__block_invoke_2, &unk_1E1C00738, v6);

}

void __40__GEOGeographicMetadataRequester__fetch__block_invoke_2(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 24), *(id *)(a1 + 40));
}

uint64_t __40__GEOGeographicMetadataRequester__fetch__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 96) + 16))();
}

- (id)_doSimpleLookup:(id)a3 rootQuadKey:(unint64_t)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  unsigned __int8 v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  GEOGloriaDB *v24;
  void *v25;
  uint64_t v26;
  GEOGloriaDB *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  NSSet *lastUsedTileKeysMaxZoom;
  id v38;
  NSSet *v39;
  id *v40;
  NSSet *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  __CFString *v45;
  void *v46;
  uint64_t v47;
  id v48;
  uint64_t v50;
  _QWORD v51[4];
  id v52;
  _QWORD v53[4];
  id v54;

  v8 = a3;
  -[GEOGeographicMetadataRequester location](self, "location");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  v11 = 76;
  switch(self->_type)
  {
    case 0uLL:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v12 = objc_opt_class();
        objc_msgSend(v8, "URLByAppendingPathComponent:", CFSTR("tiles/data"));
        v13 = 0;
        v14 = v8;
        v8 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_10;
      }
      v48 = 0;
      goto LABEL_33;
    case 1uLL:
      goto LABEL_8;
    case 2uLL:
      v11 = 80;
      goto LABEL_8;
    case 3uLL:
      v11 = 81;
      goto LABEL_8;
    case 4uLL:
      v11 = 94;
LABEL_8:
      objc_msgSend(v9, "coordinate");
      v16 = v15;
      v18 = v17;
      +[GEOResourceManifestManager modernManager](GEOResourceManifestManager, "modernManager");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "activeTileGroup");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "activeTileSetForStyle:", v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v14)
      {
        v43 = (void *)MEMORY[0x1E0CB3940];
        v44 = v11 - 76;
        if (v44 >= 0x13)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v11);
          v45 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v45 = off_1E1C05F78[v44];
        }
        objc_msgSend(v43, "stringWithFormat:", CFSTR("Tile style %@ not defined"), v45);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        v46 = (void *)MEMORY[0x1E0CB35C8];
        v47 = -2000;
        goto LABEL_31;
      }
      v13 = objc_msgSend(v14, "maximumZoomLevelForMapPoint:", GEOMapPointForCoordinate(v16, v18));
      v12 = 0;
LABEL_10:

LABEL_11:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "path");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v21, "fileExistsAtPath:", v22);

        if ((v23 & 1) == 0)
        {
          v42 = (void *)MEMORY[0x1E0CB35C8];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DB missing, expected at \"%@\"), v8);
          goto LABEL_30;
        }
        v24 = [GEOGloriaDB alloc];
        GEOGetGeographicMetadataLog();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = -[GEOGloriaDB initWithFileURL:rootQuadKey:metadataClass:dataClass:log:](v24, "initWithFileURL:rootQuadKey:metadataClass:dataClass:log:", v8, a4, v12, 0, v25);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_22:
          v42 = (void *)MEMORY[0x1E0CB35C8];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to open Gloria DB at \"%@\"), v8);
LABEL_30:
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v46 = v42;
          v47 = -17;
LABEL_31:
          objc_msgSend(v46, "GEOErrorWithCode:reason:", v47, v28);
          v48 = 0;
          *a5 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_32;
        }
        if ((int)objc_msgSend(v8, "fileDescriptor") <= 0)
        {
          v42 = (void *)MEMORY[0x1E0CB35C8];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DB missing, file descriptor was invalid"), v50);
          goto LABEL_30;
        }
        v27 = [GEOGloriaDB alloc];
        GEOGetGeographicMetadataLog();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = -[GEOGloriaDB initWithFileHandle:rootQuadKey:metadataClass:dataClass:log:](v27, "initWithFileHandle:rootQuadKey:metadataClass:dataClass:log:", v8, a4, v12, 0, v25);
      }
      v28 = (void *)v26;

      if (!v28)
        goto LABEL_22;
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_opt_class();
      objc_msgSend(v10, "coordinate");
      v32 = v31;
      v34 = v33;
      objc_msgSend(v10, "horizontalAccuracy");
      v36 = v35;
      if (v12 == v30)
      {
        v53[0] = MEMORY[0x1E0C809B0];
        v53[1] = 3221225472;
        v53[2] = __68__GEOGeographicMetadataRequester__doSimpleLookup_rootQuadKey_error___block_invoke;
        v53[3] = &unk_1E1C05F30;
        v40 = &v54;
        v54 = v29;
        objc_msgSend(v28, "enumerateDataAtLocation:radius:visitor:", v53, v32, v34, v36);
      }
      else
      {
        lastUsedTileKeysMaxZoom = self->_lastUsedTileKeysMaxZoom;
        v51[0] = MEMORY[0x1E0C809B0];
        v51[1] = 3221225472;
        v51[2] = __68__GEOGeographicMetadataRequester__doSimpleLookup_rootQuadKey_error___block_invoke_53;
        v51[3] = &unk_1E1C05F30;
        v38 = v29;
        v52 = v38;
        objc_msgSend(v28, "enumerateDataAtLocation:radius:zoom:ifDifferentFrom:visitor:", v13, lastUsedTileKeysMaxZoom, v51, v32, v34, v36);
        v39 = (NSSet *)objc_claimAutoreleasedReturnValue();
        if (-[NSSet isEqualToSet:](v39, "isEqualToSet:", self->_lastUsedTileKeysMaxZoom) && !objc_msgSend(v38, "count"))
        {

          v48 = 0;
          goto LABEL_36;
        }
        v40 = &v52;
        v41 = self->_lastUsedTileKeysMaxZoom;
        self->_lastUsedTileKeysMaxZoom = v39;

      }
      v48 = v29;
LABEL_36:

LABEL_32:
LABEL_33:

      return v48;
    default:
      v13 = 0;
      v12 = 0;
      goto LABEL_11;
  }
}

void __68__GEOGeographicMetadataRequester__doSimpleLookup_rootQuadKey_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  __int16 v9;
  int v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  GEOGetGeographicMetadataLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v7 = 134218497;
    v8 = v5;
    v9 = 1025;
    v10 = objc_msgSend(v5, "length");
    v11 = 2049;
    v12 = a2;
    _os_log_impl(&dword_1885A9000, v6, OS_LOG_TYPE_DEBUG, "Got tileData %p of %{private}d bytes for quadKey %{private}llu", (uint8_t *)&v7, 0x1Cu);
  }

  objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
}

void __68__GEOGeographicMetadataRequester__doSimpleLookup_rootQuadKey_error___block_invoke_53(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  __int16 v9;
  int v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  GEOGetGeographicMetadataLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v7 = 134218497;
    v8 = v5;
    v9 = 1025;
    v10 = objc_msgSend(v5, "length");
    v11 = 2049;
    v12 = a2;
    _os_log_impl(&dword_1885A9000, v6, OS_LOG_TYPE_DEBUG, "Got tileData %p of %{private}d bytes for quadKey %{private}llu", (uint8_t *)&v7, 0x1Cu);
  }

  objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
}

@end
