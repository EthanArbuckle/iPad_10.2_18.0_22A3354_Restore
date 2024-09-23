@implementation GEOPBOfflineTileMetadata

- (void)addTileStyleAvailability:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 8);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 8);
      *(_QWORD *)(a1 + 8) = v5;

      v4 = *(void **)(a1 + 8);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)GEOPBOfflineTileMetadata;
  -[GEOPBOfflineTileMetadata description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPBOfflineTileMetadata dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPBOfflineTileMetadata _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 8), "count"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 8), "count"));
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v6 = *(id *)(a1 + 8);
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v11, "jsonRepresentation");
          else
            objc_msgSend(v11, "dictionaryRepresentation", (_QWORD)v14);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v12, (_QWORD)v14);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v8);
    }

    objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("tileStyleAvailability"));
  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPBOfflineTileMetadata _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (uint64_t)_initWithDictionary:(void *)a1 isJSON:(void *)a2
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  GEOPBTileStyleZoomAvailability *v12;
  GEOPBTileStyleZoomAvailability *v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v17;
  int v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  id v27;
  int v28;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (!a1)
  {
    v4 = 0;
    goto LABEL_279;
  }
  v4 = objc_msgSend(a1, "init");
  if (v4)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("tileStyleAvailability"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_278;
    v30 = v5;
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v6 = v5;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
    if (!v7)
      goto LABEL_277;
    v8 = v7;
    v9 = *(_QWORD *)v37;
    v31 = v6;
    v32 = v4;
    v33 = *(_QWORD *)v37;
    while (1)
    {
      v10 = 0;
      v34 = v8;
      do
      {
        if (*(_QWORD *)v37 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v10);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v12 = [GEOPBTileStyleZoomAvailability alloc];
          if (v12)
          {
            v13 = v12;
            v14 = v11;
            v15 = -[GEOPBTileStyleZoomAvailability init](v13, "init");
            if (v15)
            {
              objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("style"));
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              v35 = v14;
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v17 = v16;
                if ((objc_msgSend(v17, "isEqualToString:", CFSTR("RASTER_STANDARD")) & 1) != 0)
                {
                  v18 = 0;
                }
                else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("VECTOR_STANDARD")) & 1) != 0)
                {
                  v18 = 1;
                }
                else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("VECTOR_TRAFFIC_SEGMENTS_FOR_RASTER")) & 1) != 0)
                {
                  v18 = 2;
                }
                else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("VECTOR_TRAFFIC_INCIDENTS_FOR_RASTER")) & 1) != 0)
                {
                  v18 = 3;
                }
                else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("VECTOR_TRAFFIC_SEGMENTS_AND_INCIDENTS_FOR_RASTER")) & 1) != 0)
                {
                  v18 = 4;
                }
                else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("RASTER_STANDARD_BACKGROUND")) & 1) != 0)
                {
                  v18 = 5;
                }
                else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("RASTER_HYBRID")) & 1) != 0)
                {
                  v18 = 6;
                }
                else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("RASTER_SATELLITE")) & 1) != 0)
                {
                  v18 = 7;
                }
                else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("RASTER_TERRAIN")) & 1) != 0)
                {
                  v18 = 8;
                }
                else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("VECTOR_BUILDINGS")) & 1) != 0)
                {
                  v18 = 11;
                }
                else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("VECTOR_TRAFFIC")) & 1) != 0)
                {
                  v18 = 12;
                }
                else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("VECTOR_POI")) & 1) != 0)
                {
                  v18 = 13;
                }
                else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("SPUTNIK_METADATA")) & 1) != 0)
                {
                  v18 = 14;
                }
                else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("SPUTNIK_C3M")) & 1) != 0)
                {
                  v18 = 15;
                }
                else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("SPUTNIK_DSM")) & 1) != 0)
                {
                  v18 = 16;
                }
                else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("SPUTNIK_DSM_GLOBAL")) & 1) != 0)
                {
                  v18 = 17;
                }
                else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("VECTOR_REALISTIC")) & 1) != 0)
                {
                  v18 = 18;
                }
                else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("VECTOR_LEGACY_REALISTIC")) & 1) != 0)
                {
                  v18 = 19;
                }
                else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("VECTOR_ROADS")) & 1) != 0)
                {
                  v18 = 20;
                }
                else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("RASTER_VEGETATION")) & 1) != 0)
                {
                  v18 = 21;
                }
                else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("VECTOR_TRAFFIC_SKELETON")) & 1) != 0)
                {
                  v18 = 22;
                }
                else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("RASTER_COASTLINE_MASK")) & 1) != 0)
                {
                  v18 = 23;
                }
                else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("RASTER_HILLSHADE")) & 1) != 0)
                {
                  v18 = 24;
                }
                else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("VECTOR_TRAFFIC_WITH_GREEN")) & 1) != 0)
                {
                  v18 = 25;
                }
                else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("VECTOR_TRAFFIC_STATIC")) & 1) != 0)
                {
                  v18 = 26;
                }
                else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("RASTER_COASTLINE_DROP_MASK")) & 1) != 0)
                {
                  v18 = 27;
                }
                else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("VECTOR_TRAFFIC_SKELETON_WITH_HISTORICAL")) & 1) != 0)
                {
                  v18 = 28;
                }
                else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("VECTOR_SPEED_PROFILES")) & 1) != 0)
                {
                  v18 = 29;
                }
                else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("VECTOR_VENUES")) & 1) != 0)
                {
                  v18 = 30;
                }
                else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("RASTER_DOWN_SAMPLED")) & 1) != 0)
                {
                  v18 = 31;
                }
                else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("RASTER_COLOR_BALANCED")) & 1) != 0)
                {
                  v18 = 32;
                }
                else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("RASTER_SATELLITE_NIGHT")) & 1) != 0)
                {
                  v18 = 33;
                }
                else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("SPUTNIK_VECTOR_BORDER")) & 1) != 0)
                {
                  v18 = 34;
                }
                else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("RASTER_SATELLITE_DIGITIZE")) & 1) != 0)
                {
                  v18 = 35;
                }
                else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("RASTER_HILLSHADE_PARKS")) & 1) != 0)
                {
                  v18 = 36;
                }
                else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("VECTOR_TRANSIT")) & 1) != 0)
                {
                  v18 = 37;
                }
                else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("RASTER_STANDARD_BASE")) & 1) != 0)
                {
                  v18 = 38;
                }
                else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("RASTER_STANDARD_LABELS")) & 1) != 0)
                {
                  v18 = 39;
                }
                else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("RASTER_HYBRID_ROADS")) & 1) != 0)
                {
                  v18 = 40;
                }
                else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("RASTER_HYBRID_LABELS")) & 1) != 0)
                {
                  v18 = 41;
                }
                else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("FLYOVER_C3M_MESH")) & 1) != 0)
                {
                  v18 = 42;
                }
                else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("FLYOVER_C3M_JPEG_TEXTURE")) & 1) != 0)
                {
                  v18 = 43;
                }
                else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("FLYOVER_C3M_ASTC_TEXTURE")) & 1) != 0)
                {
                  v18 = 44;
                }
                else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("RASTER_SATELLITE_ASTC")) & 1) != 0)
                {
                  v18 = 45;
                }
                else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("RASTER_HYBRID_ROADS_AND_LABELS")) & 1) != 0)
                {
                  v18 = 46;
                }
                else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("VECTOR_TRANSIT_SELECTION")) & 1) != 0)
                {
                  v18 = 47;
                }
                else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("VECTOR_COVERAGE")) & 1) != 0)
                {
                  v18 = 48;
                }
                else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("FLYOVER_METADATA")) & 1) != 0)
                {
                  v18 = 52;
                }
                else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("VECTOR_ROAD_NETWORK")) & 1) != 0)
                {
                  v18 = 53;
                }
                else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("VECTOR_LAND_COVER")) & 1) != 0)
                {
                  v18 = 54;
                }
                else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("VECTOR_DEBUG")) & 1) != 0)
                {
                  v18 = 55;
                }
                else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("VECTOR_STREET_POI")) & 1) != 0)
                {
                  v18 = 56;
                }
                else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("MUNIN_METADATA")) & 1) != 0)
                {
                  v18 = 57;
                }
                else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("VECTOR_SPR_MERCATOR")) & 1) != 0)
                {
                  v18 = 58;
                }
                else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("VECTOR_SPR_MODELS")) & 1) != 0)
                {
                  v18 = 59;
                }
                else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("VECTOR_SPR_MATERIALS")) & 1) != 0)
                {
                  v18 = 60;
                }
                else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("VECTOR_SPR_METADATA")) & 1) != 0)
                {
                  v18 = 61;
                }
                else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("VECTOR_TRACKS")) & 1) != 0)
                {
                  v18 = 62;
                }
                else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("VECTOR_RESERVED_2")) & 1) != 0)
                {
                  v18 = 63;
                }
                else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("VECTOR_STREET_LANDMARKS")) & 1) != 0)
                {
                  v18 = 64;
                }
                else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("COARSE_LOCATION_POLYGONS")) & 1) != 0)
                {
                  v18 = 65;
                }
                else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("VECTOR_SPR_ROADS")) & 1) != 0)
                {
                  v18 = 66;
                }
                else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("VECTOR_SPR_STANDARD")) & 1) != 0)
                {
                  v18 = 67;
                }
                else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("VECTOR_POI_V2")) & 1) != 0)
                {
                  v18 = 68;
                }
                else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("VECTOR_POLYGON_SELECTION")) & 1) != 0)
                {
                  v18 = 69;
                }
                else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("VL_METADATA")) & 1) != 0)
                {
                  v18 = 70;
                }
                else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("VL_DATA")) & 1) != 0)
                {
                  v18 = 71;
                }
                else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("PROACTIVE_APP_CLIP")) & 1) != 0)
                {
                  v18 = 72;
                }
                else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("VECTOR_BUILDINGS_V2")) & 1) != 0)
                {
                  v18 = 73;
                }
                else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("POI_BUSYNESS")) & 1) != 0)
                {
                  v18 = 74;
                }
                else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("POI_DP_BUSYNESS")) & 1) != 0)
                {
                  v18 = 75;
                }
                else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("SMART_INTERFACE_SELECTION")) & 1) != 0)
                {
                  v18 = 76;
                }
                else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("VECTOR_ASSETS")) & 1) != 0)
                {
                  v18 = 77;
                }
                else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("SPR_ASSET_METADATA")) & 1) != 0)
                {
                  v18 = 78;
                }
                else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("VECTOR_SPR_POLAR")) & 1) != 0)
                {
                  v18 = 79;
                }
                else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("SMART_DATA_MODE")) & 1) != 0)
                {
                  v18 = 80;
                }
                else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("CELLULAR_PERFORMANCE_SCORE")) & 1) != 0)
                {
                  v18 = 81;
                }
                else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("VECTOR_SPR_MODELS_OCCLUSION")) & 1) != 0)
                {
                  v18 = 82;
                }
                else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("VECTOR_TOPOGRAPHIC")) & 1) != 0)
                {
                  v18 = 83;
                }
                else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("VECTOR_POI_V2_UPDATE")) & 1) != 0)
                {
                  v18 = 84;
                }
                else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("VECTOR_LIVE_DATA_UPDATES")) & 1) != 0)
                {
                  v18 = 85;
                }
                else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("VECTOR_TRAFFIC_V2")) & 1) != 0)
                {
                  v18 = 86;
                }
                else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("VECTOR_ROAD_SELECTION")) & 1) != 0)
                {
                  v18 = 87;
                }
                else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("VECTOR_REGION_METADATA")) & 1) != 0)
                {
                  v18 = 88;
                }
                else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("RAY_TRACING")) & 1) != 0)
                {
                  v18 = 89;
                }
                else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("VECTOR_CONTOURS")) & 1) != 0)
                {
                  v18 = 90;
                }
                else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("RASTER_SATELLITE_POLAR")) & 1) != 0)
                {
                  v18 = 91;
                }
                else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("VMAP4_ELEVATION")) & 1) != 0)
                {
                  v18 = 92;
                }
                else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("VMAP4_ELEVATION_POLAR")) & 1) != 0)
                {
                  v18 = 93;
                }
                else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("CELLULAR_COVERAGE_PLMN")) & 1) != 0)
                {
                  v18 = 94;
                }
                else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("RASTER_SATELLITE_POLAR_NIGHT")) & 1) != 0)
                {
                  v18 = 95;
                }
                else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("UNUSED_96")) & 1) != 0)
                {
                  v18 = 96;
                }
                else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("UNUSED_97")) & 1) != 0)
                {
                  v18 = 97;
                }
                else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("UNUSED_98")) & 1) != 0)
                {
                  v18 = 98;
                }
                else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("UNUSED_99")) & 1) != 0)
                {
                  v18 = 99;
                }
                else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("UNUSED_100")) & 1) != 0)
                {
                  v18 = 100;
                }
                else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("UNUSED_101")) & 1) != 0)
                {
                  v18 = 101;
                }
                else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("UNUSED_102")) & 1) != 0)
                {
                  v18 = 102;
                }
                else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("UNUSED_103")) & 1) != 0)
                {
                  v18 = 103;
                }
                else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("UNUSED_104")) & 1) != 0)
                {
                  v18 = 104;
                }
                else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("UNUSED_105")) & 1) != 0)
                {
                  v18 = 105;
                }
                else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("UNUSED_106")) & 1) != 0)
                {
                  v18 = 106;
                }
                else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("UNUSED_107")) & 1) != 0)
                {
                  v18 = 107;
                }
                else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("UNUSED_108")) & 1) != 0)
                {
                  v18 = 108;
                }
                else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("UNUSED_109")) & 1) != 0)
                {
                  v18 = 109;
                }
                else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("UNUSED_110")) & 1) != 0)
                {
                  v18 = 110;
                }
                else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("UNUSED_111")) & 1) != 0)
                {
                  v18 = 111;
                }
                else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("UNUSED_112")) & 1) != 0)
                {
                  v18 = 112;
                }
                else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("UNUSED_113")) & 1) != 0)
                {
                  v18 = 113;
                }
                else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("UNUSED_114")) & 1) != 0)
                {
                  v18 = 114;
                }
                else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("UNUSED_115")) & 1) != 0)
                {
                  v18 = 115;
                }
                else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("UNUSED_116")) & 1) != 0)
                {
                  v18 = 116;
                }
                else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("UNUSED_117")) & 1) != 0)
                {
                  v18 = 117;
                }
                else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("UNUSED_118")) & 1) != 0)
                {
                  v18 = 118;
                }
                else if (objc_msgSend(v17, "isEqualToString:", CFSTR("UNUSED_119")))
                {
                  v18 = 119;
                }
                else
                {
                  v18 = 0;
                }

                v14 = v35;
LABEL_248:
                *(_BYTE *)(v15 + 40) |= 2u;
                *(_DWORD *)(v15 + 36) = v18;
              }
              else
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v18 = objc_msgSend(v16, "intValue");
                  goto LABEL_248;
                }
              }

              objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("zoom"));
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v42 = 0u;
                v43 = 0u;
                v40 = 0u;
                v41 = 0u;
                v20 = v19;
                v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
                if (v21)
                {
                  v22 = v21;
                  v23 = *(_QWORD *)v41;
                  do
                  {
                    for (i = 0; i != v22; ++i)
                    {
                      if (*(_QWORD *)v41 != v23)
                        objc_enumerationMutation(v20);
                      v25 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        objc_msgSend(v25, "unsignedIntValue");
                        PBRepeatedUInt32Add();
                      }
                    }
                    v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
                  }
                  while (v22);
                }

                v6 = v31;
                v4 = v32;
              }

              objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("size"));
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v27 = v26;
                if ((objc_msgSend(v27, "isEqualToString:", CFSTR("PX128")) & 1) != 0)
                {
                  v28 = 0;
                }
                else if ((objc_msgSend(v27, "isEqualToString:", CFSTR("PX256")) & 1) != 0)
                {
                  v28 = 1;
                }
                else if (objc_msgSend(v27, "isEqualToString:", CFSTR("PX512")))
                {
                  v28 = 2;
                }
                else
                {
                  v28 = 0;
                }

LABEL_271:
                *(_BYTE *)(v15 + 40) |= 1u;
                *(_DWORD *)(v15 + 32) = v28;
              }
              else
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v28 = objc_msgSend(v26, "intValue");
                  goto LABEL_271;
                }
              }

              v14 = v35;
            }

          }
          else
          {
            v15 = 0;
          }
          -[GEOPBOfflineTileMetadata addTileStyleAvailability:](v4, (void *)v15);

          v9 = v33;
          v8 = v34;
        }
        ++v10;
      }
      while (v10 != v8);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
      if (!v8)
      {
LABEL_277:

        v5 = v30;
LABEL_278:

        break;
      }
    }
  }
LABEL_279:

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPBOfflineTileMetadataReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_tileStyleAvailabilitys;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = self->_tileStyleAvailabilitys;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v10), "copyWithZone:", a3, (_QWORD)v13);
        -[GEOPBOfflineTileMetadata addTileStyleAvailability:]((uint64_t)v5, v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSMutableArray *tileStyleAvailabilitys;
  char v6;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    tileStyleAvailabilitys = self->_tileStyleAvailabilitys;
    if ((unint64_t)tileStyleAvailabilitys | v4[1])
      v6 = -[NSMutableArray isEqual:](tileStyleAvailabilitys, "isEqual:");
    else
      v6 = 1;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return -[NSMutableArray hash](self->_tileStyleAvailabilitys, "hash");
}

- (void)mergeFrom:(uint64_t)a1
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    v3 = *(id *)(a2 + 8);
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v9;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v9 != v6)
            objc_enumerationMutation(v3);
          -[GEOPBOfflineTileMetadata addTileStyleAvailability:](a1, *(void **)(*((_QWORD *)&v8 + 1) + 8 * v7++));
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      }
      while (v5);
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tileStyleAvailabilitys, 0);
}

@end
