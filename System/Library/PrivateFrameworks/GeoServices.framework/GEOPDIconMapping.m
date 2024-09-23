@implementation GEOPDIconMapping

- (GEOPDIconMapping)init
{
  GEOPDIconMapping *v2;
  GEOPDIconMapping *v3;
  GEOPDIconMapping *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDIconMapping;
  v2 = -[GEOPDIconMapping init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDIconMapping)initWithData:(id)a3
{
  GEOPDIconMapping *v3;
  GEOPDIconMapping *v4;
  GEOPDIconMapping *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDIconMapping;
  v3 = -[GEOPDIconMapping initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)addCartoZoom:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;

  if (a1)
  {
    v3 = a2;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 96) & 0x20) == 0)
    {
      v4 = *(void **)(a1 + 8);
      if (v4)
      {
        v5 = v4;
        objc_sync_enter(v5);
        GEOPDIconMappingReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCartoZooms_tags);
        objc_sync_exit(v5);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
    -[GEOPDIconMapping _addNoFlagsCartoZoom:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 96) |= 0x20u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
    *(_WORD *)(a1 + 96) |= 0x400u;
  }
}

- (void)_addNoFlagsCartoZoom:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 32);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 32);
      *(_QWORD *)(a1 + 32) = v5;

      v4 = *(void **)(a1 + 32);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (void)addCartoZoomIndoor:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;

  if (a1)
  {
    v3 = a2;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 96) & 0x10) == 0)
    {
      v4 = *(void **)(a1 + 8);
      if (v4)
      {
        v5 = v4;
        objc_sync_enter(v5);
        GEOPDIconMappingReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCartoZoomIndoors_tags);
        objc_sync_exit(v5);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
    -[GEOPDIconMapping _addNoFlagsCartoZoomIndoor:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 96) |= 0x10u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
    *(_WORD *)(a1 + 96) |= 0x400u;
  }
}

- (void)_addNoFlagsCartoZoomIndoor:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 24);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 24);
      *(_QWORD *)(a1 + 24) = v5;

      v4 = *(void **)(a1 + 24);
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
  v8.super_class = (Class)GEOPDIconMapping;
  -[GEOPDIconMapping description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDIconMapping dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDIconMapping _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  const __CFString *v8;
  void *v9;
  id v10;
  id v11;
  const __CFString *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  id v18;
  id v19;
  unsigned int v20;
  __CFString *v21;
  const __CFString *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  void *v29;
  const __CFString *v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t j;
  void *v36;
  void *v37;
  const __CFString *v38;
  void *v39;
  id v40;
  id v41;
  void *v42;
  void *v43;
  const __CFString *v44;
  void *v45;
  const __CFString *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  id v52;
  _QWORD v54[4];
  id v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _BYTE v64[128];
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  -[GEOPDIconMapping readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
  if ((*(_WORD *)(a1 + 96) & 0x80) == 0)
  {
    v5 = *(void **)(a1 + 8);
    if (v5)
    {
      v6 = v5;
      objc_sync_enter(v6);
      GEOPDIconMappingReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCountryCode_tags);
      objc_sync_exit(v6);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  v7 = *(id *)(a1 + 48);
  if (v7)
  {
    if (a2)
      v8 = CFSTR("countryCode");
    else
      v8 = CFSTR("country_code");
    objc_msgSend(v4, "setObject:forKey:", v7, v8);
  }

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
  if ((*(_WORD *)(a1 + 96) & 0x40) == 0)
  {
    v9 = *(void **)(a1 + 8);
    if (v9)
    {
      v10 = v9;
      objc_sync_enter(v10);
      GEOPDIconMappingReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCountryCode3A_tags);
      objc_sync_exit(v10);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  v11 = *(id *)(a1 + 40);
  if (v11)
  {
    if (a2)
      v12 = CFSTR("countryCode3A");
    else
      v12 = CFSTR("country_code_3a");
    objc_msgSend(v4, "setObject:forKey:", v11, v12);
  }

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 88));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v14 = CFSTR("poiType");
  else
    v14 = CFSTR("poi_type");
  objc_msgSend(v4, "setObject:forKey:", v13, v14);

  if ((*(_WORD *)(a1 + 96) & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 93));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v16 = CFSTR("isIconSuppressed");
    else
      v16 = CFSTR("is_icon_suppressed");
    objc_msgSend(v4, "setObject:forKey:", v15, v16);

  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
  if ((*(_WORD *)(a1 + 96) & 0x100) == 0)
  {
    v17 = *(void **)(a1 + 8);
    if (v17)
    {
      v18 = v17;
      objc_sync_enter(v18);
      GEOPDIconMappingReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readState_tags);
      objc_sync_exit(v18);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  v19 = *(id *)(a1 + 56);
  if (v19)
    objc_msgSend(v4, "setObject:forKey:", v19, CFSTR("state"));

  if ((*(_WORD *)(a1 + 96) & 1) != 0)
  {
    v20 = *(_DWORD *)(a1 + 84) + 9;
    if (v20 < 0xD && ((0x1FC1u >> v20) & 1) != 0)
    {
      v21 = off_1E1C04B00[v20];
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 84));
      v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    if (a2)
      v22 = CFSTR("cartoSignificance");
    else
      v22 = CFSTR("carto_significance");
    objc_msgSend(v4, "setObject:forKey:", v21, v22);

  }
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
    v60 = 0u;
    v61 = 0u;
    v62 = 0u;
    v63 = 0u;
    v24 = *(id *)(a1 + 32);
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v60, v65, 16);
    if (v25)
    {
      v26 = *(_QWORD *)v61;
      do
      {
        for (i = 0; i != v25; ++i)
        {
          if (*(_QWORD *)v61 != v26)
            objc_enumerationMutation(v24);
          v28 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v28, "jsonRepresentation");
          else
            objc_msgSend(v28, "dictionaryRepresentation");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "addObject:", v29);

        }
        v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v60, v65, 16);
      }
      while (v25);
    }

    if (a2)
      v30 = CFSTR("cartoZoom");
    else
      v30 = CFSTR("carto_zoom");
    objc_msgSend(v4, "setObject:forKey:", v23, v30);

  }
  if (objc_msgSend(*(id *)(a1 + 24), "count"))
  {
    v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    v32 = *(id *)(a1 + 24);
    v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v56, v64, 16);
    if (v33)
    {
      v34 = *(_QWORD *)v57;
      do
      {
        for (j = 0; j != v33; ++j)
        {
          if (*(_QWORD *)v57 != v34)
            objc_enumerationMutation(v32);
          v36 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * j);
          if ((a2 & 1) != 0)
            objc_msgSend(v36, "jsonRepresentation");
          else
            objc_msgSend(v36, "dictionaryRepresentation");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "addObject:", v37);

        }
        v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v56, v64, 16);
      }
      while (v33);
    }

    if (a2)
      v38 = CFSTR("cartoZoomIndoor");
    else
      v38 = CFSTR("carto_zoom_indoor");
    objc_msgSend(v4, "setObject:forKey:", v31, v38);

  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
  if ((*(_WORD *)(a1 + 96) & 0x200) == 0)
  {
    v39 = *(void **)(a1 + 8);
    if (v39)
    {
      v40 = v39;
      objc_sync_enter(v40);
      GEOPDIconMappingReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readVectorPoiDisplayDv_tags);
      objc_sync_exit(v40);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  v41 = *(id *)(a1 + 64);
  v42 = v41;
  if (v41)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v41, "jsonRepresentation");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = CFSTR("vectorPoiDisplayDv");
    }
    else
    {
      objc_msgSend(v41, "dictionaryRepresentation");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = CFSTR("vector_poi_display_dv");
    }
    objc_msgSend(v4, "setObject:forKey:", v43, v44);

  }
  if ((*(_WORD *)(a1 + 96) & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 92));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v46 = CFSTR("aoiZoom");
    else
      v46 = CFSTR("aoi_zoom");
    objc_msgSend(v4, "setObject:forKey:", v45, v46);

  }
  v47 = *(void **)(a1 + 16);
  if (v47)
  {
    objc_msgSend(v47, "dictionaryRepresentation");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = v48;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v48, "count"));
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v54[0] = MEMORY[0x1E0C809B0];
      v54[1] = 3221225472;
      v54[2] = __46__GEOPDIconMapping__dictionaryRepresentation___block_invoke;
      v54[3] = &unk_1E1C00600;
      v51 = v50;
      v55 = v51;
      objc_msgSend(v49, "enumerateKeysAndObjectsUsingBlock:", v54);
      v52 = v51;

    }
    else
    {
      v52 = v48;
    }
    objc_msgSend(v4, "setObject:forKey:", v52, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDIconMapping _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  void *v4;
  id v5;
  int *v6;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      v5 = v4;
      objc_sync_enter(v5);
      if (a2)
        v6 = (int *)&readAll__recursiveTag_2582;
      else
        v6 = (int *)&readAll__nonRecursiveTag_2583;
      GEOPDIconMappingReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
      _GEOPDIconMappingCallReadAllRecursiveWithoutSynchronized(a1);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

void __46__GEOPDIconMapping__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  id v5;
  uint64_t v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  id v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  id v14;
  const __CFString *v15;
  void *v16;
  int v17;
  const __CFString *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  id v23;
  const __CFString *v24;
  void *v25;
  id v26;
  int v27;
  const __CFString *v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  GEOPDCartoIconZoom *v36;
  void *v37;
  uint64_t v38;
  const __CFString *v39;
  void *v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  GEOPDCartoIconZoom *v47;
  void *v48;
  uint64_t v49;
  const __CFString *v50;
  void *v51;
  GEOPDVectorPoiDisplayDV *v52;
  id v53;
  const __CFString *v54;
  void *v55;
  unsigned int v56;
  const __CFString *v57;
  void *v58;
  GEOPDZoomInfo *v59;
  void *v60;
  id v61;
  const __CFString *v62;
  void *v63;
  unsigned int v64;
  const __CFString *v65;
  void *v66;
  GEOPDZoomInfo *v67;
  void *v68;
  id v69;
  const __CFString *v70;
  void *v71;
  GEOPDCustomLandmark *v72;
  id v73;
  const __CFString *v74;
  void *v75;
  unsigned int v76;
  uint64_t v77;
  GEOPDGeographicCoordinate *v78;
  GEOPDGeographicCoordinate *v79;
  GEOPDGeographicCoordinate *v80;
  GEOPDCustomLandmark *v81;
  const __CFString *v82;
  void *v83;
  GEOPDZoomInfo *v84;
  void *v85;
  id v86;
  const __CFString *v87;
  void *v88;
  GEOPDZoomInfo *v89;
  void *v90;
  id v91;
  const __CFString *v92;
  void *v93;
  id v94;
  int v95;
  const __CFString *v96;
  void *v97;
  char v98;
  GEOPDVectorPoiDisplayDV *v99;
  const __CFString *v100;
  void *v101;
  char v102;
  GEOPDGeographicCoordinate *v104;
  void *v105;
  void *v106;
  void *v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  _BYTE v116[128];
  _BYTE v117[128];
  uint64_t v118;

  v118 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = objc_msgSend(a1, "init");
  if (!v6)
    goto LABEL_181;
  if (a3)
    v7 = CFSTR("countryCode");
  else
    v7 = CFSTR("country_code");
  objc_msgSend(v5, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = (void *)objc_msgSend(v8, "copy");
    v10 = v9;
    *(_WORD *)(v6 + 96) |= 0x80u;
    *(_WORD *)(v6 + 96) |= 0x400u;
    objc_storeStrong((id *)(v6 + 48), v9);

  }
  if (a3)
    v11 = CFSTR("countryCode3A");
  else
    v11 = CFSTR("country_code_3a");
  objc_msgSend(v5, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v13 = (void *)objc_msgSend(v12, "copy");
    v14 = v13;
    *(_WORD *)(v6 + 96) |= 0x40u;
    *(_WORD *)(v6 + 96) |= 0x400u;
    objc_storeStrong((id *)(v6 + 40), v13);

  }
  if (a3)
    v15 = CFSTR("poiType");
  else
    v15 = CFSTR("poi_type");
  objc_msgSend(v5, "objectForKeyedSubscript:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v17 = objc_msgSend(v16, "unsignedIntValue");
    *(_WORD *)(v6 + 96) |= 0x400u;
    *(_DWORD *)(v6 + 88) = v17;
  }

  if (a3)
    v18 = CFSTR("isIconSuppressed");
  else
    v18 = CFSTR("is_icon_suppressed");
  objc_msgSend(v5, "objectForKeyedSubscript:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v20 = objc_msgSend(v19, "BOOLValue");
    *(_WORD *)(v6 + 96) |= 0x400u;
    *(_WORD *)(v6 + 96) |= 4u;
    *(_BYTE *)(v6 + 93) = v20;
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("state"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v22 = (void *)objc_msgSend(v21, "copy");
    v23 = v22;
    *(_WORD *)(v6 + 96) |= 0x100u;
    *(_WORD *)(v6 + 96) |= 0x400u;
    objc_storeStrong((id *)(v6 + 56), v22);

  }
  if (a3)
    v24 = CFSTR("cartoSignificance");
  else
    v24 = CFSTR("carto_significance");
  objc_msgSend(v5, "objectForKeyedSubscript:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v26 = v25;
    if ((objc_msgSend(v26, "isEqualToString:", CFSTR("SIGNIFICANCE_DEFAULT")) & 1) != 0)
    {
      v27 = -9;
    }
    else if ((objc_msgSend(v26, "isEqualToString:", CFSTR("SIGNIFICANCE_EXTRA_EXTRA_LOW")) & 1) != 0)
    {
      v27 = -3;
    }
    else if ((objc_msgSend(v26, "isEqualToString:", CFSTR("SIGNIFICANCE_EXTRA_LOW")) & 1) != 0)
    {
      v27 = -2;
    }
    else if ((objc_msgSend(v26, "isEqualToString:", CFSTR("SIGNIFICANCE_LOW")) & 1) != 0)
    {
      v27 = -1;
    }
    else if ((objc_msgSend(v26, "isEqualToString:", CFSTR("SIGNIFICANCE_MEDIUM")) & 1) != 0)
    {
      v27 = 0;
    }
    else if ((objc_msgSend(v26, "isEqualToString:", CFSTR("SIGNIFICANCE_HIGH")) & 1) != 0)
    {
      v27 = 1;
    }
    else if ((objc_msgSend(v26, "isEqualToString:", CFSTR("SIGNIFICANCE_EXTRA_HIGH")) & 1) != 0)
    {
      v27 = 2;
    }
    else if (objc_msgSend(v26, "isEqualToString:", CFSTR("SIGNIFICANCE_EXTRA_EXTRA_HIGH")))
    {
      v27 = 3;
    }
    else
    {
      v27 = -9;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_49;
    v27 = objc_msgSend(v25, "intValue");
  }
  *(_WORD *)(v6 + 96) |= 0x400u;
  *(_WORD *)(v6 + 96) |= 1u;
  *(_DWORD *)(v6 + 84) = v27;
LABEL_49:

  if (a3)
    v28 = CFSTR("cartoZoom");
  else
    v28 = CFSTR("carto_zoom");
  objc_msgSend(v5, "objectForKeyedSubscript:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v114 = 0u;
    v115 = 0u;
    v112 = 0u;
    v113 = 0u;
    v30 = v29;
    v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v112, v117, 16);
    if (v31)
    {
      v32 = v31;
      v33 = *(_QWORD *)v113;
      do
      {
        v34 = 0;
        do
        {
          if (*(_QWORD *)v113 != v33)
            objc_enumerationMutation(v30);
          v35 = *(void **)(*((_QWORD *)&v112 + 1) + 8 * v34);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v36 = [GEOPDCartoIconZoom alloc];
            if (v36)
              v37 = (void *)-[GEOPDCartoIconZoom _initWithDictionary:isJSON:](v36, v35, a3);
            else
              v37 = 0;
            -[GEOPDIconMapping addCartoZoom:](v6, v37);

          }
          ++v34;
        }
        while (v32 != v34);
        v38 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v112, v117, 16);
        v32 = v38;
      }
      while (v38);
    }

  }
  if (a3)
    v39 = CFSTR("cartoZoomIndoor");
  else
    v39 = CFSTR("carto_zoom_indoor");
  objc_msgSend(v5, "objectForKeyedSubscript:", v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v110 = 0u;
    v111 = 0u;
    v108 = 0u;
    v109 = 0u;
    v41 = v40;
    v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v108, v116, 16);
    if (v42)
    {
      v43 = v42;
      v44 = *(_QWORD *)v109;
      do
      {
        v45 = 0;
        do
        {
          if (*(_QWORD *)v109 != v44)
            objc_enumerationMutation(v41);
          v46 = *(void **)(*((_QWORD *)&v108 + 1) + 8 * v45);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v47 = [GEOPDCartoIconZoom alloc];
            if (v47)
              v48 = (void *)-[GEOPDCartoIconZoom _initWithDictionary:isJSON:](v47, v46, a3);
            else
              v48 = 0;
            -[GEOPDIconMapping addCartoZoomIndoor:](v6, v48);

          }
          ++v45;
        }
        while (v43 != v45);
        v49 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v108, v116, 16);
        v43 = v49;
      }
      while (v49);
    }

  }
  if (a3)
    v50 = CFSTR("vectorPoiDisplayDv");
  else
    v50 = CFSTR("vector_poi_display_dv");
  objc_msgSend(v5, "objectForKeyedSubscript:", v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_175;
  v52 = [GEOPDVectorPoiDisplayDV alloc];
  if (v52)
  {
    v53 = v51;
    v52 = -[GEOPDVectorPoiDisplayDV init](v52, "init");
    if (!v52)
    {
LABEL_173:

      goto LABEL_174;
    }
    if (a3)
      v54 = CFSTR("poiClass");
    else
      v54 = CFSTR("poi_class");
    objc_msgSend(v53, "objectForKeyedSubscript:", v54);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v56 = objc_msgSend(v55, "unsignedIntValue");
      *(_WORD *)&v52->_flags |= 0x400u;
      *(_WORD *)&v52->_flags |= 2u;
      v52->_poiClass = v56;
    }

    if (a3)
      v57 = CFSTR("classZoom");
    else
      v57 = CFSTR("class_zoom");
    objc_msgSend(v53, "objectForKeyedSubscript:", v57);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v59 = [GEOPDZoomInfo alloc];
      if (v59)
        v60 = (void *)-[GEOPDZoomInfo _initWithDictionary:isJSON:](v59, v58, a3);
      else
        v60 = 0;
      v61 = v60;
      *(_WORD *)&v52->_flags |= 0x80u;
      *(_WORD *)&v52->_flags |= 0x400u;
      objc_storeStrong((id *)&v52->_classZoom, v60);

    }
    if (a3)
      v62 = CFSTR("containmentClass");
    else
      v62 = CFSTR("containment_class");
    objc_msgSend(v53, "objectForKeyedSubscript:", v62);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v64 = objc_msgSend(v63, "unsignedIntValue");
      *(_WORD *)&v52->_flags |= 0x400u;
      *(_WORD *)&v52->_flags |= 1u;
      v52->_containmentClass = v64;
    }

    if (a3)
      v65 = CFSTR("containmentZoom");
    else
      v65 = CFSTR("containment_zoom");
    objc_msgSend(v53, "objectForKeyedSubscript:", v65);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v67 = [GEOPDZoomInfo alloc];
      if (v67)
        v68 = (void *)-[GEOPDZoomInfo _initWithDictionary:isJSON:](v67, v66, a3);
      else
        v68 = 0;
      v69 = v68;
      *(_WORD *)&v52->_flags |= 0x100u;
      *(_WORD *)&v52->_flags |= 0x400u;
      objc_storeStrong((id *)&v52->_containmentZoom, v68);

    }
    if (a3)
      v70 = CFSTR("customLandmark");
    else
      v70 = CFSTR("custom_landmark");
    objc_msgSend(v53, "objectForKeyedSubscript:", v70);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v72 = [GEOPDCustomLandmark alloc];
      if (v72)
      {
        v73 = v71;
        v72 = -[GEOPDCustomLandmark init](v72, "init");
        if (v72)
        {
          v105 = v51;
          if (a3)
            v74 = CFSTR("landmarkId");
          else
            v74 = CFSTR("landmark_id");
          v107 = v73;
          objc_msgSend(v73, "objectForKeyedSubscript:", v74);
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v76 = objc_msgSend(v75, "unsignedIntValue");
            *(_BYTE *)&v72->_flags |= 1u;
            v72->_landmarkId = v76;
          }

          v73 = v107;
          objc_msgSend(v107, "objectForKeyedSubscript:", CFSTR("position"));
          v77 = objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          v106 = (void *)v77;
          v51 = v105;
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v78 = [GEOPDGeographicCoordinate alloc];
            if ((a3 & 1) != 0)
              v79 = -[GEOPDGeographicCoordinate initWithJSON:](v78, "initWithJSON:", v106);
            else
              v79 = -[GEOPDGeographicCoordinate initWithDictionary:](v78, "initWithDictionary:", v106);
            v80 = v79;
            v104 = v79;
            objc_storeStrong((id *)&v72->_position, v80);

            v73 = v107;
          }

        }
      }
      v81 = v72;
      *(_WORD *)&v52->_flags |= 0x200u;
      *(_WORD *)&v52->_flags |= 0x400u;
      objc_storeStrong((id *)&v52->_customLandmark, v72);

    }
    if (a3)
      v82 = CFSTR("classZoomDriving");
    else
      v82 = CFSTR("class_zoom_driving");
    objc_msgSend(v53, "objectForKeyedSubscript:", v82);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v84 = [GEOPDZoomInfo alloc];
      if (v84)
        v85 = (void *)-[GEOPDZoomInfo _initWithDictionary:isJSON:](v84, v83, a3);
      else
        v85 = 0;
      v86 = v85;
      *(_WORD *)&v52->_flags |= 0x20u;
      *(_WORD *)&v52->_flags |= 0x400u;
      objc_storeStrong((id *)&v52->_classZoomDriving, v85);

    }
    if (a3)
      v87 = CFSTR("classZoomNavigation");
    else
      v87 = CFSTR("class_zoom_navigation");
    objc_msgSend(v53, "objectForKeyedSubscript:", v87);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v89 = [GEOPDZoomInfo alloc];
      if (v89)
        v90 = (void *)-[GEOPDZoomInfo _initWithDictionary:isJSON:](v89, v88, a3);
      else
        v90 = 0;
      v91 = v90;
      *(_WORD *)&v52->_flags |= 0x40u;
      *(_WORD *)&v52->_flags |= 0x400u;
      objc_storeStrong((id *)&v52->_classZoomNavigation, v90);

    }
    if (a3)
      v92 = CFSTR("treeDisplayType");
    else
      v92 = CFSTR("tree_display_type");
    objc_msgSend(v53, "objectForKeyedSubscript:", v92);
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v94 = v93;
      if ((objc_msgSend(v94, "isEqualToString:", CFSTR("TREE_DISPLAY_TYPE_DEFAULT")) & 1) != 0)
      {
        v95 = 0;
      }
      else if ((objc_msgSend(v94, "isEqualToString:", CFSTR("TREE_DISPLAY_TYPE_NONE")) & 1) != 0)
      {
        v95 = 1;
      }
      else if ((objc_msgSend(v94, "isEqualToString:", CFSTR("TREE_DISPLAY_TYPE_ALL")) & 1) != 0)
      {
        v95 = 2;
      }
      else if ((objc_msgSend(v94, "isEqualToString:", CFSTR("TREE_DISPLAY_TYPE_DENSE")) & 1) != 0)
      {
        v95 = 3;
      }
      else if (objc_msgSend(v94, "isEqualToString:", CFSTR("TREE_DISPLAY_TYPE_SPARSE")))
      {
        v95 = 4;
      }
      else
      {
        v95 = 0;
      }

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_167:

        if (a3)
          v96 = CFSTR("inMiniPoiMarket");
        else
          v96 = CFSTR("in_mini_poi_market");
        objc_msgSend(v53, "objectForKeyedSubscript:", v96);
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v98 = objc_msgSend(v97, "BOOLValue");
          *(_WORD *)&v52->_flags |= 0x400u;
          *(_WORD *)&v52->_flags |= 8u;
          v52->_inMiniPoiMarket = v98;
        }

        goto LABEL_173;
      }
      v95 = objc_msgSend(v93, "intValue");
    }
    *(_WORD *)&v52->_flags |= 0x400u;
    *(_WORD *)&v52->_flags |= 4u;
    v52->_treeDisplayType = v95;
    goto LABEL_167;
  }
LABEL_174:
  v99 = v52;
  *(_WORD *)(v6 + 96) |= 0x200u;
  *(_WORD *)(v6 + 96) |= 0x400u;
  objc_storeStrong((id *)(v6 + 64), v52);

LABEL_175:
  if (a3)
    v100 = CFSTR("aoiZoom");
  else
    v100 = CFSTR("aoi_zoom");
  objc_msgSend(v5, "objectForKeyedSubscript:", v100);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v102 = objc_msgSend(v101, "BOOLValue");
    *(_WORD *)(v6 + 96) |= 0x400u;
    *(_WORD *)(v6 + 96) |= 2u;
    *(_BYTE *)(v6 + 92) = v102;
  }

LABEL_181:
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDIconMappingReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  PBDataReader *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPDIconMappingIsDirty((uint64_t)self) & 1) == 0)
  {
    v14 = self->_reader;
    objc_sync_enter(v14);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v15);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v14);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDIconMapping readAll:]((uint64_t)self, 0);
    if (self->_countryCode)
      PBDataWriterWriteStringField();
    if (self->_countryCode3A)
      PBDataWriterWriteStringField();
    PBDataWriterWriteUint32Field();
    if ((*(_WORD *)&self->_flags & 4) != 0)
      PBDataWriterWriteBOOLField();
    if (self->_state)
      PBDataWriterWriteStringField();
    if ((*(_WORD *)&self->_flags & 1) != 0)
      PBDataWriterWriteInt32Field();
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v6 = self->_cartoZooms;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v21 != v8)
            objc_enumerationMutation(v6);
          PBDataWriterWriteSubmessage();
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      }
      while (v7);
    }

    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v10 = self->_cartoZoomIndoors;
    v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v17;
      do
      {
        for (j = 0; j != v11; ++j)
        {
          if (*(_QWORD *)v17 != v12)
            objc_enumerationMutation(v10);
          PBDataWriterWriteSubmessage();
        }
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
      }
      while (v11);
    }

    if (self->_vectorPoiDisplayDv)
      PBDataWriterWriteSubmessage();
    if ((*(_WORD *)&self->_flags & 2) != 0)
      PBDataWriterWriteBOOLField();
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v16);
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  NSMutableArray *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  id v25;
  void *v26;
  PBUnknownFields *v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
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
      GEOPDIconMappingReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_26;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDIconMapping readAll:]((uint64_t)self, 0);
  v9 = -[NSString copyWithZone:](self->_countryCode, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v9;

  v11 = -[NSString copyWithZone:](self->_countryCode3A, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v11;

  *(_DWORD *)(v5 + 88) = self->_poiType;
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    *(_BYTE *)(v5 + 93) = self->_isIconSuppressed;
    *(_WORD *)(v5 + 96) |= 4u;
  }
  v13 = -[NSString copyWithZone:](self->_state, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v13;

  if ((*(_WORD *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 84) = self->_cartoSignificance;
    *(_WORD *)(v5 + 96) |= 1u;
  }
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v15 = self->_cartoZooms;
  v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v34 != v17)
          objc_enumerationMutation(v15);
        v19 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * i), "copyWithZone:", a3);
        -[GEOPDIconMapping addCartoZoom:](v5, v19);

      }
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    }
    while (v16);
  }

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v20 = self->_cartoZoomIndoors;
  v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
  if (v21)
  {
    v22 = *(_QWORD *)v30;
    do
    {
      for (j = 0; j != v21; ++j)
      {
        if (*(_QWORD *)v30 != v22)
          objc_enumerationMutation(v20);
        v24 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * j), "copyWithZone:", a3, (_QWORD)v29);
        -[GEOPDIconMapping addCartoZoomIndoor:](v5, v24);

      }
      v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    }
    while (v21);
  }

  v25 = -[GEOPDVectorPoiDisplayDV copyWithZone:](self->_vectorPoiDisplayDv, "copyWithZone:", a3);
  v26 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v25;

  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    *(_BYTE *)(v5 + 92) = self->_aoiZoom;
    *(_WORD *)(v5 + 96) |= 2u;
  }
  v27 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v27;
LABEL_26:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *countryCode;
  NSString *countryCode3A;
  __int16 flags;
  __int16 v8;
  NSString *state;
  NSMutableArray *cartoZooms;
  NSMutableArray *cartoZoomIndoors;
  GEOPDVectorPoiDisplayDV *vectorPoiDisplayDv;
  __int16 v13;
  BOOL v14;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_31;
  -[GEOPDIconMapping readAll:]((uint64_t)self, 1);
  -[GEOPDIconMapping readAll:]((uint64_t)v4, 1);
  countryCode = self->_countryCode;
  if ((unint64_t)countryCode | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](countryCode, "isEqual:"))
      goto LABEL_31;
  }
  countryCode3A = self->_countryCode3A;
  if ((unint64_t)countryCode3A | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](countryCode3A, "isEqual:"))
      goto LABEL_31;
  }
  if (self->_poiType != *((_DWORD *)v4 + 22))
    goto LABEL_31;
  flags = (__int16)self->_flags;
  v8 = *((_WORD *)v4 + 48);
  if ((flags & 4) != 0)
  {
    if ((v8 & 4) == 0)
      goto LABEL_31;
    if (self->_isIconSuppressed)
    {
      if (!*((_BYTE *)v4 + 93))
        goto LABEL_31;
    }
    else if (*((_BYTE *)v4 + 93))
    {
      goto LABEL_31;
    }
  }
  else if ((v8 & 4) != 0)
  {
    goto LABEL_31;
  }
  state = self->_state;
  if ((unint64_t)state | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](state, "isEqual:"))
      goto LABEL_31;
    flags = (__int16)self->_flags;
    v8 = *((_WORD *)v4 + 48);
  }
  if ((flags & 1) != 0)
  {
    if ((v8 & 1) == 0 || self->_cartoSignificance != *((_DWORD *)v4 + 21))
      goto LABEL_31;
  }
  else if ((v8 & 1) != 0)
  {
    goto LABEL_31;
  }
  cartoZooms = self->_cartoZooms;
  if ((unint64_t)cartoZooms | *((_QWORD *)v4 + 4)
    && !-[NSMutableArray isEqual:](cartoZooms, "isEqual:"))
  {
    goto LABEL_31;
  }
  cartoZoomIndoors = self->_cartoZoomIndoors;
  if ((unint64_t)cartoZoomIndoors | *((_QWORD *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](cartoZoomIndoors, "isEqual:"))
      goto LABEL_31;
  }
  vectorPoiDisplayDv = self->_vectorPoiDisplayDv;
  if ((unint64_t)vectorPoiDisplayDv | *((_QWORD *)v4 + 8))
  {
    if (!-[GEOPDVectorPoiDisplayDV isEqual:](vectorPoiDisplayDv, "isEqual:"))
      goto LABEL_31;
  }
  v13 = *((_WORD *)v4 + 48);
  v14 = (v13 & 2) == 0;
  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    if ((v13 & 2) != 0)
    {
      if (self->_aoiZoom)
      {
        if (!*((_BYTE *)v4 + 92))
          goto LABEL_31;
      }
      else if (*((_BYTE *)v4 + 92))
      {
        goto LABEL_31;
      }
      v14 = 1;
      goto LABEL_32;
    }
LABEL_31:
    v14 = 0;
  }
LABEL_32:

  return v14;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  unsigned int poiType;
  NSUInteger v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  NSUInteger v13;

  -[GEOPDIconMapping readAll:]((uint64_t)self, 1);
  v13 = -[NSString hash](self->_countryCode, "hash");
  v3 = -[NSString hash](self->_countryCode3A, "hash");
  if ((*(_WORD *)&self->_flags & 4) != 0)
    v4 = 2654435761 * self->_isIconSuppressed;
  else
    v4 = 0;
  poiType = self->_poiType;
  v6 = -[NSString hash](self->_state, "hash");
  if ((*(_WORD *)&self->_flags & 1) != 0)
    v7 = 2654435761 * self->_cartoSignificance;
  else
    v7 = 0;
  v8 = -[NSMutableArray hash](self->_cartoZooms, "hash");
  v9 = -[NSMutableArray hash](self->_cartoZoomIndoors, "hash");
  v10 = -[GEOPDVectorPoiDisplayDV hash](self->_vectorPoiDisplayDv, "hash");
  if ((*(_WORD *)&self->_flags & 2) != 0)
    v11 = 2654435761 * self->_aoiZoom;
  else
    v11 = 0;
  return v3 ^ v13 ^ v4 ^ v6 ^ (2654435761 * poiType) ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
}

- (void)clearUnknownFields:(uint64_t)a1
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 96) |= 8u;
    *(_WORD *)(a1 + 96) |= 0x400u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
    v2 = *(void **)(a1 + 16);
    *(_QWORD *)(a1 + 16) = 0;

    -[GEOPDIconMapping readAll:](a1, 0);
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v3 = *(id *)(a1 + 32);
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v34;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v34 != v6)
            objc_enumerationMutation(v3);
          v8 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * v7);
          if (v8)
          {
            v9 = *(void **)(v8 + 8);
            *(_QWORD *)(v8 + 8) = 0;

          }
          ++v7;
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
      }
      while (v5);
    }

    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v10 = *(id *)(a1 + 24);
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v30;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v30 != v13)
            objc_enumerationMutation(v10);
          v15 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v14);
          if (v15)
          {
            v16 = *(void **)(v15 + 8);
            *(_QWORD *)(v15 + 8) = 0;

          }
          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
      }
      while (v12);
    }

    v17 = *(_QWORD *)(a1 + 64);
    if (v17)
    {
      os_unfair_lock_lock_with_options();
      *(_WORD *)(v17 + 92) |= 0x10u;
      *(_WORD *)(v17 + 92) |= 0x400u;
      os_unfair_lock_unlock((os_unfair_lock_t)(v17 + 72));
      v18 = *(void **)(v17 + 16);
      *(_QWORD *)(v17 + 16) = 0;

      -[GEOPDVectorPoiDisplayDV readAll:](v17, 0);
      v19 = *(_QWORD *)(v17 + 40);
      if (v19)
      {
        v20 = *(void **)(v19 + 8);
        *(_QWORD *)(v19 + 8) = 0;

      }
      v21 = *(_QWORD *)(v17 + 48);
      if (v21)
      {
        v22 = *(void **)(v21 + 8);
        *(_QWORD *)(v21 + 8) = 0;

      }
      v23 = *(_QWORD *)(v17 + 56);
      if (v23)
      {
        v24 = *(void **)(v23 + 8);
        *(_QWORD *)(v23 + 8) = 0;

      }
      v25 = *(_QWORD *)(v17 + 24);
      if (v25)
      {
        v26 = *(void **)(v25 + 8);
        *(_QWORD *)(v25 + 8) = 0;

      }
      v27 = *(_QWORD *)(v17 + 32);
      if (v27)
      {
        v28 = *(void **)(v27 + 8);
        *(_QWORD *)(v27 + 8) = 0;

      }
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vectorPoiDisplayDv, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_countryCode3A, 0);
  objc_storeStrong((id *)&self->_cartoZooms, 0);
  objc_storeStrong((id *)&self->_cartoZoomIndoors, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
