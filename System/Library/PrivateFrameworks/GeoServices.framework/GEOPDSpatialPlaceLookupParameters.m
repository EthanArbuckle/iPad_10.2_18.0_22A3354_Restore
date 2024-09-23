@implementation GEOPDSpatialPlaceLookupParameters

- (GEOPDSpatialPlaceLookupParameters)init
{
  GEOPDSpatialPlaceLookupParameters *v2;
  GEOPDSpatialPlaceLookupParameters *v3;
  GEOPDSpatialPlaceLookupParameters *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDSpatialPlaceLookupParameters;
  v2 = -[GEOPDSpatialPlaceLookupParameters init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDSpatialPlaceLookupParameters)initWithData:(id)a3
{
  GEOPDSpatialPlaceLookupParameters *v3;
  GEOPDSpatialPlaceLookupParameters *v4;
  GEOPDSpatialPlaceLookupParameters *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDSpatialPlaceLookupParameters;
  v3 = -[GEOPDSpatialPlaceLookupParameters initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)dealloc
{
  objc_super v3;

  PBRepeatedInt32Clear();
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOPDSpatialPlaceLookupParameters;
  -[GEOPDSpatialPlaceLookupParameters dealloc](&v3, sel_dealloc);
}

- (void)_readCenter
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_WORD *)(a1 + 144) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDSpatialPlaceLookupParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCenter_tags_6506);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (void)setCenter:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_WORD *)(a1 + 144) |= 0x80u;
    *(_WORD *)(a1 + 144) |= 0x400u;
    objc_storeStrong((id *)(a1 + 96), a2);
  }

}

- (void)_readCategoryFilters
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_WORD *)(a1 + 144) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDSpatialPlaceLookupParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCategoryFilters_tags_6507);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (void)addCategoryFilter:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPDSpatialPlaceLookupParameters _readCategoryFilters](a1);
    PBRepeatedInt32Add();
    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 144) |= 0x10u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
    *(_WORD *)(a1 + 144) |= 0x400u;
  }
}

- (void)_readMapRegion
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_WORD *)(a1 + 144) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDSpatialPlaceLookupParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMapRegion_tags_6508);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (void)setMapRegion:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_WORD *)(a1 + 144) |= 0x100u;
    *(_WORD *)(a1 + 144) |= 0x400u;
    objc_storeStrong((id *)(a1 + 104), a2);
  }

}

- (void)setPoiIconCategoryFilter:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_WORD *)(a1 + 144) |= 0x200u;
    *(_WORD *)(a1 + 144) |= 0x400u;
    objc_storeStrong((id *)(a1 + 112), a2);
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
  v8.super_class = (Class)GEOPDSpatialPlaceLookupParameters;
  -[GEOPDSpatialPlaceLookupParameters description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDSpatialPlaceLookupParameters dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSpatialPlaceLookupParameters _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  __int16 v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD *v12;
  unint64_t v13;
  uint64_t v14;
  __CFString *v15;
  const __CFString *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  const __CFString *v20;
  id v21;
  void *v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  const __CFString *v30;
  uint64_t v31;
  __CFString *v32;
  const __CFString *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  _QWORD v41[4];
  id v42;

  if (!a1)
    return 0;
  -[GEOPDSpatialPlaceLookupParameters readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDSpatialPlaceLookupParameters _readCenter](a1);
  v5 = *(id *)(a1 + 96);
  v6 = v5;
  if (v5)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v5, "jsonRepresentation");
    else
      objc_msgSend(v5, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("center"));

  }
  v8 = *(_WORD *)(a1 + 144);
  if ((v8 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 136));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("radius"));

    v8 = *(_WORD *)(a1 + 144);
  }
  if ((v8 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 132));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("count"));

  }
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (_QWORD *)(a1 + 24);
    if (*(_QWORD *)(a1 + 32))
    {
      v13 = 0;
      do
      {
        v14 = *(int *)(*v12 + 4 * v13);
        if (v14 >= 0x18)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v14);
          v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v15 = off_1E1C0C2C0[v14];
        }
        objc_msgSend(v11, "addObject:", v15);

        ++v13;
        v12 = (_QWORD *)(a1 + 24);
      }
      while (v13 < *(_QWORD *)(a1 + 32));
    }
    if (a2)
      v16 = CFSTR("categoryFilter");
    else
      v16 = CFSTR("category_filter");
    objc_msgSend(v4, "setObject:forKey:", v11, v16);

  }
  if (*(_QWORD *)(a1 + 80))
  {
    PBRepeatedUInt32NSArray();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v18 = CFSTR("includeIconCategoryFilter");
    else
      v18 = CFSTR("include_icon_category_filter");
    objc_msgSend(v4, "setObject:forKey:", v17, v18);

  }
  if (*(_QWORD *)(a1 + 56))
  {
    PBRepeatedUInt32NSArray();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v20 = CFSTR("excludeIconCategoryFilter");
    else
      v20 = CFSTR("exclude_icon_category_filter");
    objc_msgSend(v4, "setObject:forKey:", v19, v20);

  }
  -[GEOPDSpatialPlaceLookupParameters _readMapRegion](a1);
  v21 = *(id *)(a1 + 104);
  v22 = v21;
  if (v21)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v21, "jsonRepresentation");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = CFSTR("mapRegion");
    }
    else
    {
      objc_msgSend(v21, "dictionaryRepresentation");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = CFSTR("map_region");
    }
    objc_msgSend(v4, "setObject:forKey:", v23, v24);

  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
  if ((*(_WORD *)(a1 + 144) & 0x200) == 0)
  {
    v25 = *(void **)(a1 + 8);
    if (v25)
    {
      v26 = v25;
      objc_sync_enter(v26);
      GEOPDSpatialPlaceLookupParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPoiIconCategoryFilter_tags_1);
      objc_sync_exit(v26);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  v27 = *(id *)(a1 + 112);
  v28 = v27;
  if (v27)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v27, "jsonRepresentation");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = CFSTR("poiIconCategoryFilter");
    }
    else
    {
      objc_msgSend(v27, "dictionaryRepresentation");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = CFSTR("poi_icon_category_filter");
    }
    objc_msgSend(v4, "setObject:forKey:", v29, v30);

  }
  if ((*(_WORD *)(a1 + 144) & 4) != 0)
  {
    v31 = *(int *)(a1 + 140);
    if (v31 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 140));
      v32 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v32 = off_1E1C0C2A8[v31];
    }
    if (a2)
      v33 = CFSTR("spatialPlaceLookupRequestVersion");
    else
      v33 = CFSTR("spatial_place_lookup_request_version");
    objc_msgSend(v4, "setObject:forKey:", v32, v33);

  }
  v34 = *(void **)(a1 + 16);
  if (v34)
  {
    objc_msgSend(v34, "dictionaryRepresentation");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v35;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v35, "count"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v41[0] = MEMORY[0x1E0C809B0];
      v41[1] = 3221225472;
      v41[2] = __63__GEOPDSpatialPlaceLookupParameters__dictionaryRepresentation___block_invoke;
      v41[3] = &unk_1E1C00600;
      v38 = v37;
      v42 = v38;
      objc_msgSend(v36, "enumerateKeysAndObjectsUsingBlock:", v41);
      v39 = v38;

      v36 = v39;
    }
    objc_msgSend(v4, "setObject:forKey:", v36, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDSpatialPlaceLookupParameters _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  void *v4;
  id v5;
  int *v6;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      v5 = v4;
      objc_sync_enter(v5);
      if (a2)
        v6 = (int *)&readAll__recursiveTag_6526;
      else
        v6 = (int *)&readAll__nonRecursiveTag_6527;
      GEOPDSpatialPlaceLookupParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
      _GEOPDSpatialPlaceLookupParametersCallReadAllRecursiveWithoutSynchronized(a1);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

void __63__GEOPDSpatialPlaceLookupParameters__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v7 = *(void **)(a1 + 32);
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v5, "base64EncodedStringWithOptions:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "description");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v8, v9);

  }
  else
  {
    objc_msgSend(v10, "description");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v5, v8);
  }

}

- (uint64_t)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v4;
  void *v5;
  GEOLatLng *v6;
  GEOLatLng *v7;
  GEOLatLng *v8;
  void *v9;
  int v10;
  void *v11;
  int v12;
  const __CFString *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  id v20;
  const __CFString *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  void *v27;
  id v28;
  const __CFString *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t k;
  void *v34;
  void *v35;
  id v36;
  const __CFString *v37;
  void *v38;
  GEOMapRegion *v39;
  GEOMapRegion *v40;
  GEOMapRegion *v41;
  const __CFString *v42;
  void *v43;
  GEOPDPoiIconCategoryFilter *v44;
  void *v45;
  const __CFString *v46;
  void *v47;
  id v48;
  int v49;
  void *v51;
  void *v52;
  id v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _BYTE v67[128];
  _BYTE v68[128];
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v54 = a2;
  if (!a1)
  {
    v4 = 0;
    goto LABEL_119;
  }
  v4 = objc_msgSend(a1, "init");
  if (v4)
  {
    objc_msgSend(v54, "objectForKeyedSubscript:", CFSTR("center"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = [GEOLatLng alloc];
      if ((a3 & 1) != 0)
        v7 = -[GEOLatLng initWithJSON:](v6, "initWithJSON:", v5);
      else
        v7 = -[GEOLatLng initWithDictionary:](v6, "initWithDictionary:", v5);
      v8 = v7;
      -[GEOPDSpatialPlaceLookupParameters setCenter:](v4, v7);

    }
    objc_msgSend(v54, "objectForKeyedSubscript:", CFSTR("radius"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = objc_msgSend(v9, "intValue");
      *(_WORD *)(v4 + 144) |= 0x400u;
      *(_WORD *)(v4 + 144) |= 2u;
      *(_DWORD *)(v4 + 136) = v10;
    }

    objc_msgSend(v54, "objectForKeyedSubscript:", CFSTR("count"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = objc_msgSend(v11, "intValue");
      *(_WORD *)(v4 + 144) |= 0x400u;
      *(_WORD *)(v4 + 144) |= 1u;
      *(_DWORD *)(v4 + 132) = v12;
    }

    if (a3)
      v13 = CFSTR("categoryFilter");
    else
      v13 = CFSTR("category_filter");
    objc_msgSend(v54, "objectForKeyedSubscript:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v65 = 0u;
      v66 = 0u;
      v63 = 0u;
      v64 = 0u;
      v15 = v14;
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v63, v69, 16);
      if (!v16)
        goto LABEL_53;
      v17 = *(_QWORD *)v64;
      while (1)
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v64 != v17)
            objc_enumerationMutation(v15);
          v19 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v20 = v19;
            if ((objc_msgSend(v20, "isEqualToString:", CFSTR("SPATIAL_PLACE_LOOKUP_CATEGORY_UNKNOWN")) & 1) == 0
              && (objc_msgSend(v20, "isEqualToString:", CFSTR("SPATIAL_PLACE_LOOKUP_CATEGORY_ENTERTAINMENT")) & 1) == 0
              && (objc_msgSend(v20, "isEqualToString:", CFSTR("SPATIAL_PLACE_LOOKUP_CATEGORY_AMUSEMENTPARK")) & 1) == 0
              && (objc_msgSend(v20, "isEqualToString:", CFSTR("SPATIAL_PLACE_LOOKUP_CATEGORY_AQUARIUM")) & 1) == 0
              && (objc_msgSend(v20, "isEqualToString:", CFSTR("SPATIAL_PLACE_LOOKUP_CATEGORY_ZOO")) & 1) == 0
              && (objc_msgSend(v20, "isEqualToString:", CFSTR("SPATIAL_PLACE_LOOKUP_CATEGORY_STADIUM")) & 1) == 0
              && (objc_msgSend(v20, "isEqualToString:", CFSTR("SPATIAL_PLACE_LOOKUP_CATEGORY_SKATE_PARK")) & 1) == 0
              && (objc_msgSend(v20, "isEqualToString:", CFSTR("SPATIAL_PLACE_LOOKUP_CATEGORY_CULTURE")) & 1) == 0
              && (objc_msgSend(v20, "isEqualToString:", CFSTR("SPATIAL_PLACE_LOOKUP_CATEGORY_LANDMARK")) & 1) == 0
              && (objc_msgSend(v20, "isEqualToString:", CFSTR("SPATIAL_PLACE_LOOKUP_CATEGORY_MUSEUM")) & 1) == 0
              && (objc_msgSend(v20, "isEqualToString:", CFSTR("SPATIAL_PLACE_LOOKUP_CATEGORY_RESTAURANT")) & 1) == 0
              && (objc_msgSend(v20, "isEqualToString:", CFSTR("SPATIAL_PLACE_LOOKUP_CATEGORY_NIGHTLIFE")) & 1) == 0
              && (objc_msgSend(v20, "isEqualToString:", CFSTR("SPATIAL_PLACE_LOOKUP_CATEGORY_PARK")) & 1) == 0
              && (objc_msgSend(v20, "isEqualToString:", CFSTR("SPATIAL_PLACE_LOOKUP_CATEGORY_AIRPORT")) & 1) == 0
              && (objc_msgSend(v20, "isEqualToString:", CFSTR("SPATIAL_PLACE_LOOKUP_CATEGORY_SHOPPING")) & 1) == 0
              && (objc_msgSend(v20, "isEqualToString:", CFSTR("SPATIAL_PLACE_LOOKUP_CATEGORY_BEACH")) & 1) == 0
              && (objc_msgSend(v20, "isEqualToString:", CFSTR("SPATIAL_PLACE_LOOKUP_CATEGORY_MOUNTAIN")) & 1) == 0
              && (objc_msgSend(v20, "isEqualToString:", CFSTR("SPATIAL_PLACE_LOOKUP_CATEGORY_FITNESS")) & 1) == 0
              && (objc_msgSend(v20, "isEqualToString:", CFSTR("SPATIAL_PLACE_LOOKUP_CATEGORY_ACTIVITY")) & 1) == 0
              && (objc_msgSend(v20, "isEqualToString:", CFSTR("SPATIAL_PLACE_LOOKUP_CATEGORY_DIVING")) & 1) == 0
              && (objc_msgSend(v20, "isEqualToString:", CFSTR("SPATIAL_PLACE_LOOKUP_CATEGORY_HIKING")) & 1) == 0
              && (objc_msgSend(v20, "isEqualToString:", CFSTR("SPATIAL_PLACE_LOOKUP_CATEGORY_PERFORMANCE")) & 1) == 0
              && (objc_msgSend(v20, "isEqualToString:", CFSTR("SPATIAL_PLACE_LOOKUP_CATEGORY_HOSPITAL")) & 1) == 0)
            {
              objc_msgSend(v20, "isEqualToString:", CFSTR("SPATIAL_PLACE_LOOKUP_CATEGORY_AMUSEMENTPARK_RIDE"));
            }

          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
              continue;
            objc_msgSend(v19, "intValue");
          }
          -[GEOPDSpatialPlaceLookupParameters addCategoryFilter:](v4);
        }
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v63, v69, 16);
        if (!v16)
        {
LABEL_53:

          break;
        }
      }
    }

    if (a3)
      v21 = CFSTR("includeIconCategoryFilter");
    else
      v21 = CFSTR("include_icon_category_filter");
    objc_msgSend(v54, "objectForKeyedSubscript:", v21);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v61 = 0u;
      v62 = 0u;
      v59 = 0u;
      v60 = 0u;
      v22 = v51;
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v59, v68, 16);
      if (v23)
      {
        v24 = *(_QWORD *)v60;
        do
        {
          for (j = 0; j != v23; ++j)
          {
            if (*(_QWORD *)v60 != v24)
              objc_enumerationMutation(v22);
            v26 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * j);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v26, "unsignedIntValue");
              os_unfair_lock_lock((os_unfair_lock_t)(v4 + 128));
              if ((*(_WORD *)(v4 + 144) & 0x40) == 0)
              {
                v27 = *(void **)(v4 + 8);
                if (v27)
                {
                  v28 = v27;
                  objc_sync_enter(v28);
                  GEOPDSpatialPlaceLookupParametersReadSpecified(v4, *(_QWORD *)(v4 + 8), (int *)&_readIncludeIconCategoryFilters_tags);
                  objc_sync_exit(v28);

                }
              }
              os_unfair_lock_unlock((os_unfair_lock_t)(v4 + 128));
              PBRepeatedUInt32Add();
              os_unfair_lock_lock_with_options();
              *(_WORD *)(v4 + 144) |= 0x40u;
              os_unfair_lock_unlock((os_unfair_lock_t)(v4 + 128));
              *(_WORD *)(v4 + 144) |= 0x400u;
            }
          }
          v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v59, v68, 16);
        }
        while (v23);
      }

    }
    if (a3)
      v29 = CFSTR("excludeIconCategoryFilter");
    else
      v29 = CFSTR("exclude_icon_category_filter");
    objc_msgSend(v54, "objectForKeyedSubscript:", v29);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v57 = 0u;
      v58 = 0u;
      v55 = 0u;
      v56 = 0u;
      v30 = v52;
      v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v55, v67, 16);
      if (v31)
      {
        v32 = *(_QWORD *)v56;
        do
        {
          for (k = 0; k != v31; ++k)
          {
            if (*(_QWORD *)v56 != v32)
              objc_enumerationMutation(v30);
            v34 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * k);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v34, "unsignedIntValue");
              os_unfair_lock_lock((os_unfair_lock_t)(v4 + 128));
              if ((*(_WORD *)(v4 + 144) & 0x20) == 0)
              {
                v35 = *(void **)(v4 + 8);
                if (v35)
                {
                  v36 = v35;
                  objc_sync_enter(v36);
                  GEOPDSpatialPlaceLookupParametersReadSpecified(v4, *(_QWORD *)(v4 + 8), (int *)&_readExcludeIconCategoryFilters_tags);
                  objc_sync_exit(v36);

                }
              }
              os_unfair_lock_unlock((os_unfair_lock_t)(v4 + 128));
              PBRepeatedUInt32Add();
              os_unfair_lock_lock_with_options();
              *(_WORD *)(v4 + 144) |= 0x20u;
              os_unfair_lock_unlock((os_unfair_lock_t)(v4 + 128));
              *(_WORD *)(v4 + 144) |= 0x400u;
            }
          }
          v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v55, v67, 16);
        }
        while (v31);
      }

    }
    if (a3)
      v37 = CFSTR("mapRegion");
    else
      v37 = CFSTR("map_region");
    objc_msgSend(v54, "objectForKeyedSubscript:", v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v39 = [GEOMapRegion alloc];
      if ((a3 & 1) != 0)
        v40 = -[GEOMapRegion initWithJSON:](v39, "initWithJSON:", v38);
      else
        v40 = -[GEOMapRegion initWithDictionary:](v39, "initWithDictionary:", v38);
      v41 = v40;
      -[GEOPDSpatialPlaceLookupParameters setMapRegion:](v4, v40);

    }
    if (a3)
      v42 = CFSTR("poiIconCategoryFilter");
    else
      v42 = CFSTR("poi_icon_category_filter");
    objc_msgSend(v54, "objectForKeyedSubscript:", v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v44 = [GEOPDPoiIconCategoryFilter alloc];
      if (v44)
        v45 = -[GEOPDPoiIconCategoryFilter _initWithDictionary:isJSON:](v44, v43, a3);
      else
        v45 = 0;
      -[GEOPDSpatialPlaceLookupParameters setPoiIconCategoryFilter:](v4, v45);

    }
    if (a3)
      v46 = CFSTR("spatialPlaceLookupRequestVersion");
    else
      v46 = CFSTR("spatial_place_lookup_request_version");
    objc_msgSend(v54, "objectForKeyedSubscript:", v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v48 = v47;
      if ((objc_msgSend(v48, "isEqualToString:", CFSTR("SPATIAL_PLACE_LOOKUP_REQUEST_VERSION_UNKNOWN")) & 1) != 0)
      {
        v49 = 0;
      }
      else if ((objc_msgSend(v48, "isEqualToString:", CFSTR("SPATIAL_PLACE_LOOKUP_REQUEST_VERSION_V1")) & 1) != 0)
      {
        v49 = 1;
      }
      else if (objc_msgSend(v48, "isEqualToString:", CFSTR("SPATIAL_PLACE_LOOKUP_REQUEST_VERSION_V2")))
      {
        v49 = 2;
      }
      else
      {
        v49 = 0;
      }

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_118:

        goto LABEL_119;
      }
      v49 = objc_msgSend(v47, "intValue");
    }
    *(_WORD *)(v4 + 144) |= 0x400u;
    *(_WORD *)(v4 + 144) |= 4u;
    *(_DWORD *)(v4 + 140) = v49;
    goto LABEL_118;
  }
LABEL_119:

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSpatialPlaceLookupParametersReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  __int16 flags;
  id v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  PBDataReader *v10;
  void *v11;
  id v12;

  v12 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (!self->_reader
    || (os_unfair_lock_assert_owner(&self->_readerLock), (*(_WORD *)&self->_flags & 0x5F0) != 0)
    || (*(_WORD *)&self->_flags & 0x200) != 0
    && GEOPDPoiIconCategoryFilterIsDirty((uint64_t)self->_poiIconCategoryFilter))
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDSpatialPlaceLookupParameters readAll:]((uint64_t)self, 0);
    if (self->_center)
      PBDataWriterWriteSubmessage();
    flags = (__int16)self->_flags;
    v6 = v12;
    if ((flags & 2) != 0)
    {
      PBDataWriterWriteInt32Field();
      v6 = v12;
      flags = (__int16)self->_flags;
    }
    if ((flags & 1) != 0)
    {
      PBDataWriterWriteInt32Field();
      v6 = v12;
    }
    if (self->_categoryFilters.count)
    {
      v7 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        v6 = v12;
        ++v7;
      }
      while (v7 < self->_categoryFilters.count);
    }
    if (self->_includeIconCategoryFilters.count)
    {
      v8 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        v6 = v12;
        ++v8;
      }
      while (v8 < self->_includeIconCategoryFilters.count);
    }
    if (self->_excludeIconCategoryFilters.count)
    {
      v9 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        v6 = v12;
        ++v9;
      }
      while (v9 < self->_excludeIconCategoryFilters.count);
    }
    if (self->_mapRegion)
    {
      PBDataWriterWriteSubmessage();
      v6 = v12;
    }
    if (self->_poiIconCategoryFilter)
    {
      PBDataWriterWriteSubmessage();
      v6 = v12;
    }
    if ((*(_WORD *)&self->_flags & 4) != 0)
    {
      PBDataWriterWriteInt32Field();
      v6 = v12;
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v6);
  }
  else
  {
    v10 = self->_reader;
    objc_sync_enter(v10);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "writeData:", v11);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v10);
  }

}

- (uint64_t)hasGreenTeaWithValue:(uint64_t)result
{
  uint64_t v3;

  if (result)
  {
    v3 = result;
    -[GEOPDSpatialPlaceLookupParameters _readCenter](result);
    if ((objc_msgSend(*(id *)(v3 + 96), "hasGreenTeaWithValue:", a2) & 1) != 0)
    {
      return 1;
    }
    else
    {
      -[GEOPDSpatialPlaceLookupParameters _readMapRegion](v3);
      return objc_msgSend(*(id *)(v3 + 104), "hasGreenTeaWithValue:", a2);
    }
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  id v9;
  void *v10;
  __int16 flags;
  id v12;
  void *v13;
  id v14;
  void *v15;
  PBUnknownFields *v16;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x400) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOPDSpatialPlaceLookupParametersReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_12;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDSpatialPlaceLookupParameters readAll:]((uint64_t)self, 0);
  v9 = -[GEOLatLng copyWithZone:](self->_center, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 96);
  *(_QWORD *)(v5 + 96) = v9;

  flags = (__int16)self->_flags;
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 136) = self->_radius;
    *(_WORD *)(v5 + 144) |= 2u;
    flags = (__int16)self->_flags;
  }
  if ((flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 132) = self->_count;
    *(_WORD *)(v5 + 144) |= 1u;
  }
  PBRepeatedInt32Copy();
  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  v12 = -[GEOMapRegion copyWithZone:](self->_mapRegion, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 104);
  *(_QWORD *)(v5 + 104) = v12;

  v14 = -[GEOPDPoiIconCategoryFilter copyWithZone:](self->_poiIconCategoryFilter, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 112);
  *(_QWORD *)(v5 + 112) = v14;

  if ((*(_WORD *)&self->_flags & 4) != 0)
  {
    *(_DWORD *)(v5 + 140) = self->_spatialPlaceLookupRequestVersion;
    *(_WORD *)(v5 + 144) |= 4u;
  }
  v16 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v16;
LABEL_12:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  GEOLatLng *center;
  __int16 flags;
  __int16 v7;
  GEOMapRegion *mapRegion;
  GEOPDPoiIconCategoryFilter *poiIconCategoryFilter;
  __int16 v10;
  BOOL v11;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_25;
  -[GEOPDSpatialPlaceLookupParameters readAll:]((uint64_t)self, 1);
  -[GEOPDSpatialPlaceLookupParameters readAll:]((uint64_t)v4, 1);
  center = self->_center;
  if ((unint64_t)center | *((_QWORD *)v4 + 12))
  {
    if (!-[GEOLatLng isEqual:](center, "isEqual:"))
      goto LABEL_25;
  }
  flags = (__int16)self->_flags;
  v7 = *((_WORD *)v4 + 72);
  if ((flags & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_radius != *((_DWORD *)v4 + 34))
      goto LABEL_25;
  }
  else if ((v7 & 2) != 0)
  {
LABEL_25:
    v11 = 0;
    goto LABEL_26;
  }
  if ((flags & 1) != 0)
  {
    if ((v7 & 1) == 0 || self->_count != *((_DWORD *)v4 + 33))
      goto LABEL_25;
  }
  else if ((v7 & 1) != 0)
  {
    goto LABEL_25;
  }
  if (!PBRepeatedInt32IsEqual())
    goto LABEL_25;
  if (!PBRepeatedUInt32IsEqual())
    goto LABEL_25;
  if (!PBRepeatedUInt32IsEqual())
    goto LABEL_25;
  mapRegion = self->_mapRegion;
  if ((unint64_t)mapRegion | *((_QWORD *)v4 + 13))
  {
    if (!-[GEOMapRegion isEqual:](mapRegion, "isEqual:"))
      goto LABEL_25;
  }
  poiIconCategoryFilter = self->_poiIconCategoryFilter;
  if ((unint64_t)poiIconCategoryFilter | *((_QWORD *)v4 + 14))
  {
    if (!-[GEOPDPoiIconCategoryFilter isEqual:](poiIconCategoryFilter, "isEqual:"))
      goto LABEL_25;
  }
  v10 = *((_WORD *)v4 + 72);
  v11 = (v10 & 4) == 0;
  if ((*(_WORD *)&self->_flags & 4) != 0)
  {
    if ((v10 & 4) == 0 || self->_spatialPlaceLookupRequestVersion != *((_DWORD *)v4 + 35))
      goto LABEL_25;
    v11 = 1;
  }
LABEL_26:

  return v11;
}

- (unint64_t)hash
{
  unint64_t v3;
  __int16 flags;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;

  -[GEOPDSpatialPlaceLookupParameters readAll:]((uint64_t)self, 1);
  v3 = -[GEOLatLng hash](self->_center, "hash");
  flags = (__int16)self->_flags;
  if ((flags & 2) != 0)
  {
    v5 = 2654435761 * self->_radius;
    if ((flags & 1) != 0)
      goto LABEL_3;
  }
  else
  {
    v5 = 0;
    if ((flags & 1) != 0)
    {
LABEL_3:
      v6 = 2654435761 * self->_count;
      goto LABEL_6;
    }
  }
  v6 = 0;
LABEL_6:
  v7 = PBRepeatedInt32Hash();
  v8 = PBRepeatedUInt32Hash();
  v9 = PBRepeatedUInt32Hash();
  v10 = -[GEOMapRegion hash](self->_mapRegion, "hash");
  v11 = -[GEOPDPoiIconCategoryFilter hash](self->_poiIconCategoryFilter, "hash");
  if ((*(_WORD *)&self->_flags & 4) != 0)
    v12 = 2654435761 * self->_spatialPlaceLookupRequestVersion;
  else
    v12 = 0;
  return v5 ^ v3 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
}

- (void)clearUnknownFields:(uint64_t)a1
{
  void *v4;

  if (a1)
  {
    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 144) |= 8u;
    *(_WORD *)(a1 + 144) |= 0x400u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
    v4 = *(void **)(a1 + 16);
    *(_QWORD *)(a1 + 16) = 0;

    if (a2)
    {
      -[GEOPDSpatialPlaceLookupParameters readAll:](a1, 0);
      objc_msgSend(*(id *)(a1 + 96), "clearUnknownFields:", 1);
      objc_msgSend(*(id *)(a1 + 104), "clearUnknownFields:", 1);
      -[GEOPDPoiIconCategoryFilter clearUnknownFields:](*(_QWORD *)(a1 + 112), 1);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_poiIconCategoryFilter, 0);
  objc_storeStrong((id *)&self->_mapRegion, 0);
  objc_storeStrong((id *)&self->_center, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
