@implementation GEORoutePreloaderStatisticsInfo

- (GEORoutePreloaderStatisticsInfo)init
{
  GEORoutePreloaderStatisticsInfo *result;

  result = (GEORoutePreloaderStatisticsInfo *)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GEOMethodNotAvailableException"), CFSTR("This method is unavailable."));
  __break(1u);
  return result;
}

- (GEORoutePreloaderStatisticsInfo)initWithTransportType:(int)a3
{
  GEORoutePreloaderStatisticsInfo *v4;
  uint64_t v5;
  geo_isolater *isolation;
  double v7;
  GEORoutePreloaderStatisticsInfo *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)GEORoutePreloaderStatisticsInfo;
  v4 = -[GEORoutePreloaderStatisticsInfo init](&v10, sel_init);
  if (v4)
  {
    v5 = geo_isolater_create();
    isolation = v4->_isolation;
    v4->_isolation = (geo_isolater *)v5;

    v4->_transportType = a3;
    GEOGetMonotonicTime();
    v4->_startMonotonicTimestamp = v7;
    v4->_loggingEnabled = GEOConfigGetBOOL(GeoServicesConfig_RoutePreloaderLogHitsAndMisses, (uint64_t)off_1EDF4CEA8);
    v8 = v4;
  }

  return v4;
}

- (void)incrementTileLoadStatistic:(int64_t)a3 amount:(unint64_t)a4
{
  geo_isolate_sync_data();
}

_QWORD *__69__GEORoutePreloaderStatisticsInfo_incrementTileLoadStatistic_amount___block_invoke(_QWORD *result)
{
  uint64_t v1;

  v1 = result[4] + 8 * result[5];
  *(_QWORD *)(v1 + 56) += result[6];
  return result;
}

- (void)loadedTileKey:(uint64_t)a1 source:(uint64_t)a2 sizeInBytes:(uint64_t)a3
{
  NSObject *v5;
  int v6;
  uint8_t buf[4];
  int v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = 0;
  if (GEOTileKeyStyle(a3, &v6))
  {
    geo_isolate_sync_data();
    if (*(_BYTE *)(a1 + 48))
    {
      GEOGetRoutePreloaderLog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 68157955;
        v8 = 16;
        v9 = 2097;
        v10 = a3;
        _os_log_impl(&dword_1885A9000, v5, OS_LOG_TYPE_DEBUG, "Preloaded tile key: %{private,geo:TileKey}.*P", buf, 0x12u);
      }

    }
  }
}

void __68__GEORoutePreloaderStatisticsInfo_loadedTileKey_source_sizeInBytes___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 56));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 112);
  v18 = (id)v2;
  if (!v3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 112);
    *(_QWORD *)(v5 + 112) = v4;

    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 112);
    v2 = (uint64_t)v18;
  }
  v7 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v3, "objectForKeyedSubscript:", v2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "numberWithUnsignedInteger:", objc_msgSend(v8, "unsignedIntegerValue") + 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "setObject:forKeyedSubscript:", v9, v18);

  if (*(_QWORD *)(a1 + 40) == 2)
  {
    v10 = *(void **)(*(_QWORD *)(a1 + 32) + 120);
    v11 = v18;
    if (!v10)
    {
      v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v13 = *(_QWORD *)(a1 + 32);
      v14 = *(void **)(v13 + 120);
      *(_QWORD *)(v13 + 120) = v12;

      v10 = *(void **)(*(_QWORD *)(a1 + 32) + 120);
      v11 = v18;
    }
    v15 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v10, "objectForKeyedSubscript:", v11);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 48) + objc_msgSend(v16, "unsignedIntegerValue"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "setObject:forKeyedSubscript:", v17, v18);

  }
}

- (void)missedTileKey:(uint64_t)a1 loadedSuccessfully:(uint64_t)a2 sizeInBytes:(uint64_t)a3
{
  NSObject *v5;
  uint8_t buf[4];
  int v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  geo_isolate_sync_data();
  if (*(_BYTE *)(a1 + 48))
  {
    GEOGetRoutePreloaderLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 68157955;
      v7 = 16;
      v8 = 2097;
      v9 = a3;
      _os_log_impl(&dword_1885A9000, v5, OS_LOG_TYPE_DEBUG, "Missed tile key: %{private,geo:TileKey}.*P", buf, 0x12u);
    }

  }
}

void __80__GEORoutePreloaderStatisticsInfo_missedTileKey_loadedSuccessfully_sizeInBytes___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned int v18;

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(a1 + 56))
  {
    ++*(_QWORD *)(v1 + 32);
    v18 = 0;
    if (GEOTileKeyStyle(*(_QWORD *)(a1 + 40), &v18))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v18);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = *(void **)(*(_QWORD *)(a1 + 32) + 128);
      if (!v4)
      {
        v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        v6 = *(_QWORD *)(a1 + 32);
        v7 = *(void **)(v6 + 128);
        *(_QWORD *)(v6 + 128) = v5;

        v4 = *(void **)(*(_QWORD *)(a1 + 32) + 128);
      }
      v8 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v4, "objectForKeyedSubscript:", v3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "numberWithUnsignedInteger:", objc_msgSend(v9, "unsignedIntegerValue") + 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "setObject:forKeyedSubscript:", v10, v3);

      v11 = *(void **)(*(_QWORD *)(a1 + 32) + 136);
      if (!v11)
      {
        v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        v13 = *(_QWORD *)(a1 + 32);
        v14 = *(void **)(v13 + 136);
        *(_QWORD *)(v13 + 136) = v12;

        v11 = *(void **)(*(_QWORD *)(a1 + 32) + 136);
      }
      v15 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v11, "objectForKeyedSubscript:", v3);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 48) + objc_msgSend(v16, "unsignedIntegerValue"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "setObject:forKeyedSubscript:", v17, v3);

    }
  }
  else
  {
    ++*(_QWORD *)(v1 + 40);
  }
}

- (void)finishAndReportIfNecessaryForDistance:(double)a3
{
  void *v5;
  double v6;
  double v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[9];
  unsigned int v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(_QWORD *);
  void *v18;
  GEORoutePreloaderStatisticsInfo *v19;
  uint8_t *v20;
  uint64_t *v21;
  uint64_t *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  uint8_t buf[8];
  uint8_t *v37;
  uint64_t v38;
  char v39;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  GEOGetMonotonicTime();
  v7 = v6 - self->_startMonotonicTimestamp;
  if (v7 <= 0.0)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: totalDuration > 0", buf, 2u);
    }
  }
  else
  {
    *(_QWORD *)buf = 0;
    v37 = buf;
    v38 = 0x2020000000;
    v39 = 0;
    v32 = 0;
    v33 = &v32;
    v34 = 0x2020000000;
    v35 = 0;
    v28 = 0;
    v29 = &v28;
    v30 = 0x2020000000;
    v31 = 0;
    v24 = 0;
    v25 = &v24;
    v26 = 0x2020000000;
    v27 = 0;
    v8 = MEMORY[0x1E0C809B0];
    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __73__GEORoutePreloaderStatisticsInfo_finishAndReportIfNecessaryForDistance___block_invoke;
    v18 = &unk_1E1C21EE8;
    v19 = self;
    v20 = buf;
    v21 = &v32;
    v22 = &v28;
    v23 = &v24;
    geo_isolate_sync_data();
    if (v37[24])
    {
      objc_msgSend(v5, "dateByAddingTimeInterval:", -v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v9, v5);
      objc_msgSend(v10, "duration");
      v13[0] = v8;
      v13[1] = 3221225472;
      v13[2] = __73__GEORoutePreloaderStatisticsInfo_finishAndReportIfNecessaryForDistance___block_invoke_18;
      v13[3] = &unk_1E1C21F10;
      v13[8] = v11;
      v14 = vcvtad_u64_f64(a3 / 1000.0);
      v13[4] = self;
      v13[5] = &v32;
      v13[6] = &v28;
      v13[7] = &v24;
      geoAnalyticsSendEventLazy(CFSTR("com.apple.GeoServices.routepreloader.session"), v13);
      +[GEORequestCounter sharedCounter](GEORequestCounter, "sharedCounter");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "recordRoutePreloadSessionAt:transportType:tilesPreloaded:tilesUsed:tilesMissed:", v10, self->_transportType, v33[3], v29[3], v25[3]);

    }
    _Block_object_dispose(&v24, 8);
    _Block_object_dispose(&v28, 8);
    _Block_object_dispose(&v32, 8);
    _Block_object_dispose(buf, 8);
  }

}

void __73__GEORoutePreloaderStatisticsInfo_finishAndReportIfNecessaryForDistance___block_invoke(_QWORD *a1)
{
  NSObject *v2;
  _BOOL4 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  __CFString *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  __CFString *v29;
  NSObject *v30;
  _QWORD *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  id obj;
  id obja;
  void *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint8_t buf[4];
  uint64_t v52;
  __int16 v53;
  uint64_t v54;
  __int16 v55;
  uint64_t v56;
  __int16 v57;
  uint64_t v58;
  __int16 v59;
  uint64_t v60;
  __int16 v61;
  uint64_t v62;
  __int16 v63;
  uint64_t v64;
  __int16 v65;
  uint64_t v66;
  __int16 v67;
  uint64_t v68;
  __int16 v69;
  void *v70;
  __int16 v71;
  void *v72;
  _BYTE v73[128];
  _BYTE v74[128];
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = *(_QWORD *)(a1[4] + 56) != 0;
  if (*(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24))
  {
    GEOGetRoutePreloaderLog();
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = os_log_type_enabled(v2, OS_LOG_TYPE_INFO);

    if (v3)
    {
      objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("\tLoaded tiles:\n"));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = 0u;
      v50 = 0u;
      v47 = 0u;
      v48 = 0u;
      obj = *(id *)(a1[4] + 112);
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v74, 16);
      if (v4)
      {
        v5 = *(_QWORD *)v48;
        do
        {
          for (i = 0; i != v4; ++i)
          {
            if (*(_QWORD *)v48 != v5)
              objc_enumerationMutation(obj);
            v7 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
            v8 = objc_msgSend(v7, "unsignedIntegerValue");
            objc_msgSend(*(id *)(a1[4] + 112), "objectForKeyedSubscript:", v7);
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            v10 = objc_msgSend(v9, "unsignedIntegerValue");

            objc_msgSend(*(id *)(a1[4] + 120), "objectForKeyedSubscript:", v7);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = objc_msgSend(v11, "unsignedIntegerValue");

            v13 = v8;
            v14 = v8;
            v15 = CFSTR("RASTER_STANDARD");
            switch(v14)
            {
              case 0:
                break;
              case 1:
                v15 = CFSTR("VECTOR_STANDARD");
                break;
              case 2:
                v15 = CFSTR("VECTOR_TRAFFIC_SEGMENTS_FOR_RASTER");
                break;
              case 3:
                v15 = CFSTR("VECTOR_TRAFFIC_INCIDENTS_FOR_RASTER");
                break;
              case 4:
                v15 = CFSTR("VECTOR_TRAFFIC_SEGMENTS_AND_INCIDENTS_FOR_RASTER");
                break;
              case 5:
                v15 = CFSTR("RASTER_STANDARD_BACKGROUND");
                break;
              case 6:
                v15 = CFSTR("RASTER_HYBRID");
                break;
              case 7:
                v15 = CFSTR("RASTER_SATELLITE");
                break;
              case 8:
                v15 = CFSTR("RASTER_TERRAIN");
                break;
              case 11:
                v15 = CFSTR("VECTOR_BUILDINGS");
                break;
              case 12:
                v15 = CFSTR("VECTOR_TRAFFIC");
                break;
              case 13:
                v15 = CFSTR("VECTOR_POI");
                break;
              case 14:
                v15 = CFSTR("SPUTNIK_METADATA");
                break;
              case 15:
                v15 = CFSTR("SPUTNIK_C3M");
                break;
              case 16:
                v15 = CFSTR("SPUTNIK_DSM");
                break;
              case 17:
                v15 = CFSTR("SPUTNIK_DSM_GLOBAL");
                break;
              case 18:
                v15 = CFSTR("VECTOR_REALISTIC");
                break;
              case 19:
                v15 = CFSTR("VECTOR_LEGACY_REALISTIC");
                break;
              case 20:
                v15 = CFSTR("VECTOR_ROADS");
                break;
              case 21:
                v15 = CFSTR("RASTER_VEGETATION");
                break;
              case 22:
                v15 = CFSTR("VECTOR_TRAFFIC_SKELETON");
                break;
              case 23:
                v15 = CFSTR("RASTER_COASTLINE_MASK");
                break;
              case 24:
                v15 = CFSTR("RASTER_HILLSHADE");
                break;
              case 25:
                v15 = CFSTR("VECTOR_TRAFFIC_WITH_GREEN");
                break;
              case 26:
                v15 = CFSTR("VECTOR_TRAFFIC_STATIC");
                break;
              case 27:
                v15 = CFSTR("RASTER_COASTLINE_DROP_MASK");
                break;
              case 28:
                v15 = CFSTR("VECTOR_TRAFFIC_SKELETON_WITH_HISTORICAL");
                break;
              case 29:
                v15 = CFSTR("VECTOR_SPEED_PROFILES");
                break;
              case 30:
                v15 = CFSTR("VECTOR_VENUES");
                break;
              case 31:
                v15 = CFSTR("RASTER_DOWN_SAMPLED");
                break;
              case 32:
                v15 = CFSTR("RASTER_COLOR_BALANCED");
                break;
              case 33:
                v15 = CFSTR("RASTER_SATELLITE_NIGHT");
                break;
              case 34:
                v15 = CFSTR("SPUTNIK_VECTOR_BORDER");
                break;
              case 35:
                v15 = CFSTR("RASTER_SATELLITE_DIGITIZE");
                break;
              case 36:
                v15 = CFSTR("RASTER_HILLSHADE_PARKS");
                break;
              case 37:
                v15 = CFSTR("VECTOR_TRANSIT");
                break;
              case 38:
                v15 = CFSTR("RASTER_STANDARD_BASE");
                break;
              case 39:
                v15 = CFSTR("RASTER_STANDARD_LABELS");
                break;
              case 40:
                v15 = CFSTR("RASTER_HYBRID_ROADS");
                break;
              case 41:
                v15 = CFSTR("RASTER_HYBRID_LABELS");
                break;
              case 42:
                v15 = CFSTR("FLYOVER_C3M_MESH");
                break;
              case 43:
                v15 = CFSTR("FLYOVER_C3M_JPEG_TEXTURE");
                break;
              case 44:
                v15 = CFSTR("FLYOVER_C3M_ASTC_TEXTURE");
                break;
              case 45:
                v15 = CFSTR("RASTER_SATELLITE_ASTC");
                break;
              case 46:
                v15 = CFSTR("RASTER_HYBRID_ROADS_AND_LABELS");
                break;
              case 47:
                v15 = CFSTR("VECTOR_TRANSIT_SELECTION");
                break;
              case 48:
                v15 = CFSTR("VECTOR_COVERAGE");
                break;
              case 52:
                v15 = CFSTR("FLYOVER_METADATA");
                break;
              case 53:
                v15 = CFSTR("VECTOR_ROAD_NETWORK");
                break;
              case 54:
                v15 = CFSTR("VECTOR_LAND_COVER");
                break;
              case 55:
                v15 = CFSTR("VECTOR_DEBUG");
                break;
              case 56:
                v15 = CFSTR("VECTOR_STREET_POI");
                break;
              case 57:
                v15 = CFSTR("MUNIN_METADATA");
                break;
              case 58:
                v15 = CFSTR("VECTOR_SPR_MERCATOR");
                break;
              case 59:
                v15 = CFSTR("VECTOR_SPR_MODELS");
                break;
              case 60:
                v15 = CFSTR("VECTOR_SPR_MATERIALS");
                break;
              case 61:
                v15 = CFSTR("VECTOR_SPR_METADATA");
                break;
              case 62:
                v15 = CFSTR("VECTOR_TRACKS");
                break;
              case 63:
                v15 = CFSTR("VECTOR_RESERVED_2");
                break;
              case 64:
                v15 = CFSTR("VECTOR_STREET_LANDMARKS");
                break;
              case 65:
                v15 = CFSTR("COARSE_LOCATION_POLYGONS");
                break;
              case 66:
                v15 = CFSTR("VECTOR_SPR_ROADS");
                break;
              case 67:
                v15 = CFSTR("VECTOR_SPR_STANDARD");
                break;
              case 68:
                v15 = CFSTR("VECTOR_POI_V2");
                break;
              case 69:
                v15 = CFSTR("VECTOR_POLYGON_SELECTION");
                break;
              case 70:
                v15 = CFSTR("VL_METADATA");
                break;
              case 71:
                v15 = CFSTR("VL_DATA");
                break;
              case 72:
                v15 = CFSTR("PROACTIVE_APP_CLIP");
                break;
              case 73:
                v15 = CFSTR("VECTOR_BUILDINGS_V2");
                break;
              case 74:
                v15 = CFSTR("POI_BUSYNESS");
                break;
              case 75:
                v15 = CFSTR("POI_DP_BUSYNESS");
                break;
              case 76:
                v15 = CFSTR("SMART_INTERFACE_SELECTION");
                break;
              case 77:
                v15 = CFSTR("VECTOR_ASSETS");
                break;
              case 78:
                v15 = CFSTR("SPR_ASSET_METADATA");
                break;
              case 79:
                v15 = CFSTR("VECTOR_SPR_POLAR");
                break;
              case 80:
                v15 = CFSTR("SMART_DATA_MODE");
                break;
              case 81:
                v15 = CFSTR("CELLULAR_PERFORMANCE_SCORE");
                break;
              case 82:
                v15 = CFSTR("VECTOR_SPR_MODELS_OCCLUSION");
                break;
              case 83:
                v15 = CFSTR("VECTOR_TOPOGRAPHIC");
                break;
              case 84:
                v15 = CFSTR("VECTOR_POI_V2_UPDATE");
                break;
              case 85:
                v15 = CFSTR("VECTOR_LIVE_DATA_UPDATES");
                break;
              case 86:
                v15 = CFSTR("VECTOR_TRAFFIC_V2");
                break;
              case 87:
                v15 = CFSTR("VECTOR_ROAD_SELECTION");
                break;
              case 88:
                v15 = CFSTR("VECTOR_REGION_METADATA");
                break;
              case 89:
                v15 = CFSTR("RAY_TRACING");
                break;
              case 90:
                v15 = CFSTR("VECTOR_CONTOURS");
                break;
              case 91:
                v15 = CFSTR("RASTER_SATELLITE_POLAR");
                break;
              case 92:
                v15 = CFSTR("VMAP4_ELEVATION");
                break;
              case 93:
                v15 = CFSTR("VMAP4_ELEVATION_POLAR");
                break;
              case 94:
                v15 = CFSTR("CELLULAR_COVERAGE_PLMN");
                break;
              case 95:
                v15 = CFSTR("RASTER_SATELLITE_POLAR_NIGHT");
                break;
              case 96:
                v15 = CFSTR("UNUSED_96");
                break;
              case 97:
                v15 = CFSTR("UNUSED_97");
                break;
              case 98:
                v15 = CFSTR("UNUSED_98");
                break;
              case 99:
                v15 = CFSTR("UNUSED_99");
                break;
              case 100:
                v15 = CFSTR("UNUSED_100");
                break;
              case 101:
                v15 = CFSTR("UNUSED_101");
                break;
              case 102:
                v15 = CFSTR("UNUSED_102");
                break;
              case 103:
                v15 = CFSTR("UNUSED_103");
                break;
              case 104:
                v15 = CFSTR("UNUSED_104");
                break;
              case 105:
                v15 = CFSTR("UNUSED_105");
                break;
              case 106:
                v15 = CFSTR("UNUSED_106");
                break;
              case 107:
                v15 = CFSTR("UNUSED_107");
                break;
              case 108:
                v15 = CFSTR("UNUSED_108");
                break;
              case 109:
                v15 = CFSTR("UNUSED_109");
                break;
              case 110:
                v15 = CFSTR("UNUSED_110");
                break;
              case 111:
                v15 = CFSTR("UNUSED_111");
                break;
              case 112:
                v15 = CFSTR("UNUSED_112");
                break;
              case 113:
                v15 = CFSTR("UNUSED_113");
                break;
              case 114:
                v15 = CFSTR("UNUSED_114");
                break;
              case 115:
                v15 = CFSTR("UNUSED_115");
                break;
              case 116:
                v15 = CFSTR("UNUSED_116");
                break;
              case 117:
                v15 = CFSTR("UNUSED_117");
                break;
              case 118:
                v15 = CFSTR("UNUSED_118");
                break;
              case 119:
                v15 = CFSTR("UNUSED_119");
                break;
              default:
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v13);
                v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
                break;
            }
            objc_msgSend(v42, "appendFormat:", CFSTR("\t\t%@: %llu (%llu bytes)\n"), v15, v10, v12);

          }
          v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v74, 16);
        }
        while (v4);
      }

      objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("\tMissed tiles:\n"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = 0u;
      v46 = 0u;
      v43 = 0u;
      v44 = 0u;
      obja = *(id *)(a1[4] + 128);
      v17 = 0;
      v18 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v43, v73, 16);
      if (v18)
      {
        v19 = *(_QWORD *)v44;
        do
        {
          for (j = 0; j != v18; ++j)
          {
            if (*(_QWORD *)v44 != v19)
              objc_enumerationMutation(obja);
            v21 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * j);
            v22 = objc_msgSend(v21, "unsignedIntegerValue");
            objc_msgSend(*(id *)(a1[4] + 128), "objectForKeyedSubscript:", v21);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_msgSend(v23, "unsignedIntegerValue");

            objc_msgSend(*(id *)(a1[4] + 136), "objectForKeyedSubscript:", v21);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = objc_msgSend(v25, "unsignedIntegerValue");

            v27 = v22;
            v28 = v22;
            v29 = CFSTR("RASTER_STANDARD");
            switch(v28)
            {
              case 0:
                break;
              case 1:
                v29 = CFSTR("VECTOR_STANDARD");
                break;
              case 2:
                v29 = CFSTR("VECTOR_TRAFFIC_SEGMENTS_FOR_RASTER");
                break;
              case 3:
                v29 = CFSTR("VECTOR_TRAFFIC_INCIDENTS_FOR_RASTER");
                break;
              case 4:
                v29 = CFSTR("VECTOR_TRAFFIC_SEGMENTS_AND_INCIDENTS_FOR_RASTER");
                break;
              case 5:
                v29 = CFSTR("RASTER_STANDARD_BACKGROUND");
                break;
              case 6:
                v29 = CFSTR("RASTER_HYBRID");
                break;
              case 7:
                v29 = CFSTR("RASTER_SATELLITE");
                break;
              case 8:
                v29 = CFSTR("RASTER_TERRAIN");
                break;
              case 11:
                v29 = CFSTR("VECTOR_BUILDINGS");
                break;
              case 12:
                v29 = CFSTR("VECTOR_TRAFFIC");
                break;
              case 13:
                v29 = CFSTR("VECTOR_POI");
                break;
              case 14:
                v29 = CFSTR("SPUTNIK_METADATA");
                break;
              case 15:
                v29 = CFSTR("SPUTNIK_C3M");
                break;
              case 16:
                v29 = CFSTR("SPUTNIK_DSM");
                break;
              case 17:
                v29 = CFSTR("SPUTNIK_DSM_GLOBAL");
                break;
              case 18:
                v29 = CFSTR("VECTOR_REALISTIC");
                break;
              case 19:
                v29 = CFSTR("VECTOR_LEGACY_REALISTIC");
                break;
              case 20:
                v29 = CFSTR("VECTOR_ROADS");
                break;
              case 21:
                v29 = CFSTR("RASTER_VEGETATION");
                break;
              case 22:
                v29 = CFSTR("VECTOR_TRAFFIC_SKELETON");
                break;
              case 23:
                v29 = CFSTR("RASTER_COASTLINE_MASK");
                break;
              case 24:
                v29 = CFSTR("RASTER_HILLSHADE");
                break;
              case 25:
                v29 = CFSTR("VECTOR_TRAFFIC_WITH_GREEN");
                break;
              case 26:
                v29 = CFSTR("VECTOR_TRAFFIC_STATIC");
                break;
              case 27:
                v29 = CFSTR("RASTER_COASTLINE_DROP_MASK");
                break;
              case 28:
                v29 = CFSTR("VECTOR_TRAFFIC_SKELETON_WITH_HISTORICAL");
                break;
              case 29:
                v29 = CFSTR("VECTOR_SPEED_PROFILES");
                break;
              case 30:
                v29 = CFSTR("VECTOR_VENUES");
                break;
              case 31:
                v29 = CFSTR("RASTER_DOWN_SAMPLED");
                break;
              case 32:
                v29 = CFSTR("RASTER_COLOR_BALANCED");
                break;
              case 33:
                v29 = CFSTR("RASTER_SATELLITE_NIGHT");
                break;
              case 34:
                v29 = CFSTR("SPUTNIK_VECTOR_BORDER");
                break;
              case 35:
                v29 = CFSTR("RASTER_SATELLITE_DIGITIZE");
                break;
              case 36:
                v29 = CFSTR("RASTER_HILLSHADE_PARKS");
                break;
              case 37:
                v29 = CFSTR("VECTOR_TRANSIT");
                break;
              case 38:
                v29 = CFSTR("RASTER_STANDARD_BASE");
                break;
              case 39:
                v29 = CFSTR("RASTER_STANDARD_LABELS");
                break;
              case 40:
                v29 = CFSTR("RASTER_HYBRID_ROADS");
                break;
              case 41:
                v29 = CFSTR("RASTER_HYBRID_LABELS");
                break;
              case 42:
                v29 = CFSTR("FLYOVER_C3M_MESH");
                break;
              case 43:
                v29 = CFSTR("FLYOVER_C3M_JPEG_TEXTURE");
                break;
              case 44:
                v29 = CFSTR("FLYOVER_C3M_ASTC_TEXTURE");
                break;
              case 45:
                v29 = CFSTR("RASTER_SATELLITE_ASTC");
                break;
              case 46:
                v29 = CFSTR("RASTER_HYBRID_ROADS_AND_LABELS");
                break;
              case 47:
                v29 = CFSTR("VECTOR_TRANSIT_SELECTION");
                break;
              case 48:
                v29 = CFSTR("VECTOR_COVERAGE");
                break;
              case 52:
                v29 = CFSTR("FLYOVER_METADATA");
                break;
              case 53:
                v29 = CFSTR("VECTOR_ROAD_NETWORK");
                break;
              case 54:
                v29 = CFSTR("VECTOR_LAND_COVER");
                break;
              case 55:
                v29 = CFSTR("VECTOR_DEBUG");
                break;
              case 56:
                v29 = CFSTR("VECTOR_STREET_POI");
                break;
              case 57:
                v29 = CFSTR("MUNIN_METADATA");
                break;
              case 58:
                v29 = CFSTR("VECTOR_SPR_MERCATOR");
                break;
              case 59:
                v29 = CFSTR("VECTOR_SPR_MODELS");
                break;
              case 60:
                v29 = CFSTR("VECTOR_SPR_MATERIALS");
                break;
              case 61:
                v29 = CFSTR("VECTOR_SPR_METADATA");
                break;
              case 62:
                v29 = CFSTR("VECTOR_TRACKS");
                break;
              case 63:
                v29 = CFSTR("VECTOR_RESERVED_2");
                break;
              case 64:
                v29 = CFSTR("VECTOR_STREET_LANDMARKS");
                break;
              case 65:
                v29 = CFSTR("COARSE_LOCATION_POLYGONS");
                break;
              case 66:
                v29 = CFSTR("VECTOR_SPR_ROADS");
                break;
              case 67:
                v29 = CFSTR("VECTOR_SPR_STANDARD");
                break;
              case 68:
                v29 = CFSTR("VECTOR_POI_V2");
                break;
              case 69:
                v29 = CFSTR("VECTOR_POLYGON_SELECTION");
                break;
              case 70:
                v29 = CFSTR("VL_METADATA");
                break;
              case 71:
                v29 = CFSTR("VL_DATA");
                break;
              case 72:
                v29 = CFSTR("PROACTIVE_APP_CLIP");
                break;
              case 73:
                v29 = CFSTR("VECTOR_BUILDINGS_V2");
                break;
              case 74:
                v29 = CFSTR("POI_BUSYNESS");
                break;
              case 75:
                v29 = CFSTR("POI_DP_BUSYNESS");
                break;
              case 76:
                v29 = CFSTR("SMART_INTERFACE_SELECTION");
                break;
              case 77:
                v29 = CFSTR("VECTOR_ASSETS");
                break;
              case 78:
                v29 = CFSTR("SPR_ASSET_METADATA");
                break;
              case 79:
                v29 = CFSTR("VECTOR_SPR_POLAR");
                break;
              case 80:
                v29 = CFSTR("SMART_DATA_MODE");
                break;
              case 81:
                v29 = CFSTR("CELLULAR_PERFORMANCE_SCORE");
                break;
              case 82:
                v29 = CFSTR("VECTOR_SPR_MODELS_OCCLUSION");
                break;
              case 83:
                v29 = CFSTR("VECTOR_TOPOGRAPHIC");
                break;
              case 84:
                v29 = CFSTR("VECTOR_POI_V2_UPDATE");
                break;
              case 85:
                v29 = CFSTR("VECTOR_LIVE_DATA_UPDATES");
                break;
              case 86:
                v29 = CFSTR("VECTOR_TRAFFIC_V2");
                break;
              case 87:
                v29 = CFSTR("VECTOR_ROAD_SELECTION");
                break;
              case 88:
                v29 = CFSTR("VECTOR_REGION_METADATA");
                break;
              case 89:
                v29 = CFSTR("RAY_TRACING");
                break;
              case 90:
                v29 = CFSTR("VECTOR_CONTOURS");
                break;
              case 91:
                v29 = CFSTR("RASTER_SATELLITE_POLAR");
                break;
              case 92:
                v29 = CFSTR("VMAP4_ELEVATION");
                break;
              case 93:
                v29 = CFSTR("VMAP4_ELEVATION_POLAR");
                break;
              case 94:
                v29 = CFSTR("CELLULAR_COVERAGE_PLMN");
                break;
              case 95:
                v29 = CFSTR("RASTER_SATELLITE_POLAR_NIGHT");
                break;
              case 96:
                v29 = CFSTR("UNUSED_96");
                break;
              case 97:
                v29 = CFSTR("UNUSED_97");
                break;
              case 98:
                v29 = CFSTR("UNUSED_98");
                break;
              case 99:
                v29 = CFSTR("UNUSED_99");
                break;
              case 100:
                v29 = CFSTR("UNUSED_100");
                break;
              case 101:
                v29 = CFSTR("UNUSED_101");
                break;
              case 102:
                v29 = CFSTR("UNUSED_102");
                break;
              case 103:
                v29 = CFSTR("UNUSED_103");
                break;
              case 104:
                v29 = CFSTR("UNUSED_104");
                break;
              case 105:
                v29 = CFSTR("UNUSED_105");
                break;
              case 106:
                v29 = CFSTR("UNUSED_106");
                break;
              case 107:
                v29 = CFSTR("UNUSED_107");
                break;
              case 108:
                v29 = CFSTR("UNUSED_108");
                break;
              case 109:
                v29 = CFSTR("UNUSED_109");
                break;
              case 110:
                v29 = CFSTR("UNUSED_110");
                break;
              case 111:
                v29 = CFSTR("UNUSED_111");
                break;
              case 112:
                v29 = CFSTR("UNUSED_112");
                break;
              case 113:
                v29 = CFSTR("UNUSED_113");
                break;
              case 114:
                v29 = CFSTR("UNUSED_114");
                break;
              case 115:
                v29 = CFSTR("UNUSED_115");
                break;
              case 116:
                v29 = CFSTR("UNUSED_116");
                break;
              case 117:
                v29 = CFSTR("UNUSED_117");
                break;
              case 118:
                v29 = CFSTR("UNUSED_118");
                break;
              case 119:
                v29 = CFSTR("UNUSED_119");
                break;
              default:
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v27);
                v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
                break;
            }
            objc_msgSend(v16, "appendFormat:", CFSTR("\t\t%@: %llu (%llu bytes)\n"), v29, v24, v26);

            v17 += v26;
          }
          v18 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v43, v73, 16);
        }
        while (v18);
      }

      GEOGetRoutePreloaderLog();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        v31 = (_QWORD *)a1[4];
        v32 = v31[7];
        v33 = v31[8];
        v34 = v31[9];
        v36 = v31[11];
        v35 = v31[12];
        v37 = v31[13];
        v39 = v31[4];
        v38 = v31[5];
        *(_DWORD *)buf = 134220546;
        v52 = v32;
        v53 = 2048;
        v54 = v33;
        v55 = 2048;
        v56 = v35;
        v57 = 2048;
        v58 = v34;
        v59 = 2048;
        v60 = v36;
        v61 = 2048;
        v62 = v37;
        v63 = 2048;
        v64 = v39;
        v65 = 2048;
        v66 = v17;
        v67 = 2048;
        v68 = v38;
        v69 = 2114;
        v70 = v42;
        v71 = 2114;
        v72 = v16;
        _os_log_impl(&dword_1885A9000, v30, OS_LOG_TYPE_INFO, "Preload session complete. Final statistics:\n\tTiles attempted: %llu\n\tTiles loaded from network: %llu\n\tBytes loaded from network: %{bytes}llu\n\tTiles already in cache: %llu\n\tTiles failed: %llu\n\tTiles used: %llu\n\tMissed tiles (subsequently successful): %llu\n\tMissed bytes: %{bytes}llu\n\tMissed tiles (subsequently failed): %llu\n\n%{public}@\n\n%{public}@", buf, 0x70u);
      }

    }
    *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = *(_QWORD *)(a1[4] + 64);
    *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) = *(_QWORD *)(a1[4] + 104);
    *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 24) = *(_QWORD *)(a1[4] + 40) + *(_QWORD *)(a1[4] + 32);
  }
}

id __73__GEORoutePreloaderStatisticsInfo_finishAndReportIfNecessaryForDistance___block_invoke_18(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  double v9;
  void *v10;
  unint64_t v11;
  double v12;
  void *v13;
  void *v14;
  _QWORD v16[8];
  _QWORD v17[9];

  v17[8] = *MEMORY[0x1E0C80C00];
  v16[0] = CFSTR("transportType");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(*(_QWORD *)(a1 + 32) + 16));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v2;
  v16[1] = CFSTR("duration");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 64));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v3;
  v16[2] = CFSTR("distance");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 72));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v4;
  v16[3] = CFSTR("tilesPreloaded");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17[3] = v5;
  v16[4] = CFSTR("tilesUsed");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17[4] = v6;
  v16[5] = CFSTR("tilesMissed");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17[5] = v7;
  v16[6] = CFSTR("tilesUsedRatio");
  v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  if (v8)
    v9 = (double)*(unint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) / (double)v8;
  else
    v9 = -1.0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17[6] = v10;
  v16[7] = CFSTR("tilesMissedRatio");
  v11 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  if (v11)
    v12 = (double)*(unint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) / (double)v11;
  else
    v12 = -1.0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[7] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tileTypeToMissedBytes, 0);
  objc_storeStrong((id *)&self->_tileTypeToMissedCount, 0);
  objc_storeStrong((id *)&self->_tileTypeToBytes, 0);
  objc_storeStrong((id *)&self->_tileTypeToCount, 0);
  objc_storeStrong((id *)&self->_isolation, 0);
}

@end
