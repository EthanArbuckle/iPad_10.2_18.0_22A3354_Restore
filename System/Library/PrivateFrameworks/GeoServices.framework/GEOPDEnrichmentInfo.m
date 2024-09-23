@implementation GEOPDEnrichmentInfo

+ (GEOPDEnrichmentInfo)enrichmentInfoWithPlaceData:(id)a3
{
  id v3;
  id v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v3 = a3;
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__36;
  v11 = __Block_byref_object_dispose__36;
  v12 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __68__GEOPDEnrichmentInfo_PlaceDataExtras__enrichmentInfoWithPlaceData___block_invoke;
  v6[3] = &unk_1E1C09768;
  v6[4] = &v7;
  objc_msgSend(v3, "enumerateComponentOfType:enumerationOptions:usingBlock:", 93, 1, v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (GEOPDEnrichmentInfo *)v4;
}

void __68__GEOPDEnrichmentInfo_PlaceDataExtras__enrichmentInfoWithPlaceData___block_invoke(uint64_t a1, id *a2, _BYTE *a3)
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[GEOPDComponent values](a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v9);
        if (v10 && *(_QWORD *)(v10 + 184))
        {
          -[GEOPDComponentValue enrichmentInfo]((id *)v10);
          v11 = objc_claimAutoreleasedReturnValue();
          v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
          v13 = *(void **)(v12 + 40);
          *(_QWORD *)(v12 + 40) = v11;

          *a3 = 1;
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

}

- (void)clearUnknownFields:(uint64_t)a1
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    os_unfair_lock_lock_with_options();
    *(_BYTE *)(a1 + 84) |= 1u;
    *(_BYTE *)(a1 + 84) |= 0x80u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
    v4 = *(void **)(a1 + 16);
    *(_QWORD *)(a1 + 16) = 0;

    if (a2)
    {
      -[GEOPDEnrichmentInfo readAll:](a1, 0);
      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      v5 = *(id *)(a1 + 24);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v20;
        do
        {
          v9 = 0;
          do
          {
            if (*(_QWORD *)v20 != v8)
              objc_enumerationMutation(v5);
            objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v9++), "clearUnknownFields:", 1);
          }
          while (v7 != v9);
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
        }
        while (v7);
      }

      v17 = 0u;
      v18 = 0u;
      v15 = 0u;
      v16 = 0u;
      v10 = *(id *)(a1 + 48);
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v16;
        do
        {
          v14 = 0;
          do
          {
            if (*(_QWORD *)v16 != v13)
              objc_enumerationMutation(v10);
            objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v14++), "clearUnknownFields:", 1, (_QWORD)v15);
          }
          while (v12 != v14);
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
        }
        while (v12);
      }

    }
  }
}

- (GEOPDEnrichmentInfo)init
{
  GEOPDEnrichmentInfo *v2;
  GEOPDEnrichmentInfo *v3;
  GEOPDEnrichmentInfo *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDEnrichmentInfo;
  v2 = -[GEOPDEnrichmentInfo init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDEnrichmentInfo)initWithData:(id)a3
{
  GEOPDEnrichmentInfo *v3;
  GEOPDEnrichmentInfo *v4;
  GEOPDEnrichmentInfo *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDEnrichmentInfo;
  v3 = -[GEOPDEnrichmentInfo initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readSourceName
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_BYTE *)(a1 + 84) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDEnrichmentInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSourceName_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (id)sourceName
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDEnrichmentInfo _readSourceName]((uint64_t)a1);
    a1 = (id *)v1[8];
  }
  return a1;
}

- (void)_readSourceId
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_BYTE *)(a1 + 84) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDEnrichmentInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSourceId_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (id)sourceId
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDEnrichmentInfo _readSourceId]((uint64_t)a1);
    a1 = (id *)v1[7];
  }
  return a1;
}

- (void)_readShowcaseId
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_BYTE *)(a1 + 84) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDEnrichmentInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readShowcaseId_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (id)showcaseId
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDEnrichmentInfo _readShowcaseId]((uint64_t)a1);
    a1 = (id *)v1[4];
  }
  return a1;
}

- (void)_readPoiNames
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_BYTE *)(a1 + 84) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDEnrichmentInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPoiNames_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (id)poiNames
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDEnrichmentInfo _readPoiNames]((uint64_t)a1);
    a1 = (id *)v1[3];
  }
  return a1;
}

- (void)addPoiName:(uint64_t)a1
{
  id v3;

  if (a1)
  {
    v3 = a2;
    -[GEOPDEnrichmentInfo _readPoiNames](a1);
    -[GEOPDEnrichmentInfo _addNoFlagsPoiName:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_BYTE *)(a1 + 84) |= 2u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
    *(_BYTE *)(a1 + 84) |= 0x80u;
  }
}

- (void)_addNoFlagsPoiName:(uint64_t)a1
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

- (void)_readShowcaseTitles
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_BYTE *)(a1 + 84) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDEnrichmentInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readShowcaseTitles_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (id)showcaseTitles
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDEnrichmentInfo _readShowcaseTitles]((uint64_t)a1);
    a1 = (id *)v1[6];
  }
  return a1;
}

- (void)addShowcaseTitle:(uint64_t)a1
{
  id v3;

  if (a1)
  {
    v3 = a2;
    -[GEOPDEnrichmentInfo _readShowcaseTitles](a1);
    -[GEOPDEnrichmentInfo _addNoFlagsShowcaseTitle:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_BYTE *)(a1 + 84) |= 0x10u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
    *(_BYTE *)(a1 + 84) |= 0x80u;
  }
}

- (void)_addNoFlagsShowcaseTitle:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 48);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 48);
      *(_QWORD *)(a1 + 48) = v5;

      v4 = *(void **)(a1 + 48);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (void)_readShowcaseImageUrls
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_BYTE *)(a1 + 84) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDEnrichmentInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readShowcaseImageUrls_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (id)showcaseImageUrls
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDEnrichmentInfo _readShowcaseImageUrls]((uint64_t)a1);
    a1 = (id *)v1[5];
  }
  return a1;
}

- (void)addShowcaseImageUrl:(uint64_t)a1
{
  id v3;

  if (a1)
  {
    v3 = a2;
    -[GEOPDEnrichmentInfo _readShowcaseImageUrls](a1);
    -[GEOPDEnrichmentInfo _addNoFlagsShowcaseImageUrl:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_BYTE *)(a1 + 84) |= 8u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
    *(_BYTE *)(a1 + 84) |= 0x80u;
  }
}

- (void)_addNoFlagsShowcaseImageUrl:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 40);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 40);
      *(_QWORD *)(a1 + 40) = v5;

      v4 = *(void **)(a1 + 40);
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
  v8.super_class = (Class)GEOPDEnrichmentInfo;
  -[GEOPDEnrichmentInfo description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDEnrichmentInfo dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDEnrichmentInfo _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  const __CFString *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  _QWORD v38[4];
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  -[GEOPDEnrichmentInfo readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDEnrichmentInfo sourceName]((id *)a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (a2)
      v6 = CFSTR("sourceName");
    else
      v6 = CFSTR("source_name");
    objc_msgSend(v4, "setObject:forKey:", v5, v6);
  }

  -[GEOPDEnrichmentInfo sourceId]((id *)a1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    if (a2)
      v8 = CFSTR("sourceId");
    else
      v8 = CFSTR("source_id");
    objc_msgSend(v4, "setObject:forKey:", v7, v8);
  }

  -[GEOPDEnrichmentInfo showcaseId]((id *)a1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    if (a2)
      v10 = CFSTR("showcaseId");
    else
      v10 = CFSTR("showcase_id");
    objc_msgSend(v4, "setObject:forKey:", v9, v10);
  }

  if (objc_msgSend(*(id *)(a1 + 24), "count"))
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v12 = *(id *)(a1 + 24);
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v45;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v45 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v17, "jsonRepresentation");
          else
            objc_msgSend(v17, "dictionaryRepresentation");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObject:", v18);

        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
      }
      while (v14);
    }

    if (a2)
      v19 = CFSTR("poiName");
    else
      v19 = CFSTR("poi_name");
    objc_msgSend(v4, "setObject:forKey:", v11, v19);

  }
  if (objc_msgSend(*(id *)(a1 + 48), "count"))
  {
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v21 = *(id *)(a1 + 48);
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v41;
      do
      {
        for (j = 0; j != v23; ++j)
        {
          if (*(_QWORD *)v41 != v24)
            objc_enumerationMutation(v21);
          v26 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * j);
          if ((a2 & 1) != 0)
            objc_msgSend(v26, "jsonRepresentation");
          else
            objc_msgSend(v26, "dictionaryRepresentation");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "addObject:", v27);

        }
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
      }
      while (v23);
    }

    if (a2)
      v28 = CFSTR("showcaseTitle");
    else
      v28 = CFSTR("showcase_title");
    objc_msgSend(v4, "setObject:forKey:", v20, v28);

  }
  if (*(_QWORD *)(a1 + 40))
  {
    -[GEOPDEnrichmentInfo showcaseImageUrls]((id *)a1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v30 = CFSTR("showcaseImageUrl");
    else
      v30 = CFSTR("showcase_image_url");
    objc_msgSend(v4, "setObject:forKey:", v29, v30);

  }
  v31 = *(void **)(a1 + 16);
  if (v31)
  {
    objc_msgSend(v31, "dictionaryRepresentation");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v32;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v32, "count"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v38[0] = MEMORY[0x1E0C809B0];
      v38[1] = 3221225472;
      v38[2] = __49__GEOPDEnrichmentInfo__dictionaryRepresentation___block_invoke;
      v38[3] = &unk_1E1C00600;
      v35 = v34;
      v39 = v35;
      objc_msgSend(v33, "enumerateKeysAndObjectsUsingBlock:", v38);
      v36 = v35;

      v33 = v36;
    }
    objc_msgSend(v4, "setObject:forKey:", v33, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDEnrichmentInfo _dictionaryRepresentation:]((uint64_t)self, 1);
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
        v6 = (int *)&readAll__recursiveTag_3305;
      else
        v6 = (int *)&readAll__nonRecursiveTag_3306;
      GEOPDEnrichmentInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
      _GEOPDEnrichmentInfoCallReadAllRecursiveWithoutSynchronized(a1);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

void __49__GEOPDEnrichmentInfo__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  const __CFString *v6;
  void *v7;
  void *v8;
  id v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  id v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  id v17;
  const __CFString *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  uint64_t v25;
  GEOLocalizedString *v26;
  GEOLocalizedString *v27;
  GEOLocalizedString *v28;
  const __CFString *v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t j;
  uint64_t v36;
  GEOLocalizedString *v37;
  GEOLocalizedString *v38;
  GEOLocalizedString *v39;
  const __CFString *v40;
  void *v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t k;
  void *v47;
  void *v48;
  void *v50;
  void *v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
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
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    a1 = objc_msgSend((id)a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("sourceName");
      else
        v6 = CFSTR("source_name");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = (void *)objc_msgSend(v7, "copy");
        v9 = v8;
        *(_BYTE *)(a1 + 84) |= 0x40u;
        *(_BYTE *)(a1 + 84) |= 0x80u;
        objc_storeStrong((id *)(a1 + 64), v8);

      }
      if (a3)
        v10 = CFSTR("sourceId");
      else
        v10 = CFSTR("source_id");
      objc_msgSend(v5, "objectForKeyedSubscript:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v12 = (void *)objc_msgSend(v11, "copy");
        v13 = v12;
        *(_BYTE *)(a1 + 84) |= 0x20u;
        *(_BYTE *)(a1 + 84) |= 0x80u;
        objc_storeStrong((id *)(a1 + 56), v12);

      }
      if (a3)
        v14 = CFSTR("showcaseId");
      else
        v14 = CFSTR("showcase_id");
      objc_msgSend(v5, "objectForKeyedSubscript:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v16 = (void *)objc_msgSend(v15, "copy");
        v17 = v16;
        *(_BYTE *)(a1 + 84) |= 4u;
        *(_BYTE *)(a1 + 84) |= 0x80u;
        objc_storeStrong((id *)(a1 + 32), v16);

      }
      if (a3)
        v18 = CFSTR("poiName");
      else
        v18 = CFSTR("poi_name");
      objc_msgSend(v5, "objectForKeyedSubscript:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v62 = 0u;
        v63 = 0u;
        v60 = 0u;
        v61 = 0u;
        v50 = v19;
        v20 = v19;
        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v60, v66, 16);
        if (v21)
        {
          v22 = v21;
          v23 = *(_QWORD *)v61;
          do
          {
            for (i = 0; i != v22; ++i)
            {
              if (*(_QWORD *)v61 != v23)
                objc_enumerationMutation(v20);
              v25 = *(_QWORD *)(*((_QWORD *)&v60 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v26 = [GEOLocalizedString alloc];
                if ((a3 & 1) != 0)
                  v27 = -[GEOLocalizedString initWithJSON:](v26, "initWithJSON:", v25);
                else
                  v27 = -[GEOLocalizedString initWithDictionary:](v26, "initWithDictionary:", v25);
                v28 = v27;
                -[GEOPDEnrichmentInfo addPoiName:](a1, v27);

              }
            }
            v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v60, v66, 16);
          }
          while (v22);
        }

        v19 = v50;
      }

      if (a3)
        v29 = CFSTR("showcaseTitle");
      else
        v29 = CFSTR("showcase_title");
      objc_msgSend(v5, "objectForKeyedSubscript:", v29, v50);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v58 = 0u;
        v59 = 0u;
        v56 = 0u;
        v57 = 0u;
        v51 = v30;
        v31 = v30;
        v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v56, v65, 16);
        if (v32)
        {
          v33 = v32;
          v34 = *(_QWORD *)v57;
          do
          {
            for (j = 0; j != v33; ++j)
            {
              if (*(_QWORD *)v57 != v34)
                objc_enumerationMutation(v31);
              v36 = *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * j);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v37 = [GEOLocalizedString alloc];
                if ((a3 & 1) != 0)
                  v38 = -[GEOLocalizedString initWithJSON:](v37, "initWithJSON:", v36);
                else
                  v38 = -[GEOLocalizedString initWithDictionary:](v37, "initWithDictionary:", v36);
                v39 = v38;
                -[GEOPDEnrichmentInfo addShowcaseTitle:](a1, v38);

              }
            }
            v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v56, v65, 16);
          }
          while (v33);
        }

        v30 = v51;
      }

      if (a3)
        v40 = CFSTR("showcaseImageUrl");
      else
        v40 = CFSTR("showcase_image_url");
      objc_msgSend(v5, "objectForKeyedSubscript:", v40, v51);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v54 = 0u;
        v55 = 0u;
        v52 = 0u;
        v53 = 0u;
        v42 = v41;
        v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v52, v64, 16);
        if (v43)
        {
          v44 = v43;
          v45 = *(_QWORD *)v53;
          do
          {
            for (k = 0; k != v44; ++k)
            {
              if (*(_QWORD *)v53 != v45)
                objc_enumerationMutation(v42);
              v47 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * k);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v48 = (void *)objc_msgSend(v47, "copy");
                -[GEOPDEnrichmentInfo addShowcaseImageUrl:](a1, v48);

              }
            }
            v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v52, v64, 16);
          }
          while (v44);
        }

      }
    }
  }

  return a1;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDEnrichmentInfoReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  PBDataReader *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), *(_BYTE *)&self->_flags <= 1u))
  {
    v18 = self->_reader;
    objc_sync_enter(v18);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v19);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v18);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDEnrichmentInfo readAll:]((uint64_t)self, 0);
    if (self->_sourceName)
      PBDataWriterWriteStringField();
    if (self->_sourceId)
      PBDataWriterWriteStringField();
    if (self->_showcaseId)
      PBDataWriterWriteStringField();
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v6 = self->_poiNames;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v29;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v29 != v8)
            objc_enumerationMutation(v6);
          PBDataWriterWriteSubmessage();
          ++v9;
        }
        while (v7 != v9);
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
      }
      while (v7);
    }

    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v10 = self->_showcaseTitles;
    v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v25;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v25 != v12)
            objc_enumerationMutation(v10);
          PBDataWriterWriteSubmessage();
          ++v13;
        }
        while (v11 != v13);
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
      }
      while (v11);
    }

    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v14 = self->_showcaseImageUrls;
    v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v21;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v21 != v16)
            objc_enumerationMutation(v14);
          PBDataWriterWriteStringField();
          ++v17;
        }
        while (v15 != v17);
        v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
      }
      while (v15);
    }

    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v20);
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  NSMutableArray *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  NSMutableArray *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_BYTE *)&self->_flags & 0x80000000) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOPDEnrichmentInfoReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDEnrichmentInfo readAll:]((uint64_t)self, 0);
  v8 = -[NSString copyWithZone:](self->_sourceName, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v8;

  v10 = -[NSString copyWithZone:](self->_sourceId, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v10;

  v12 = -[NSString copyWithZone:](self->_showcaseId, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v12;

  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v14 = self->_poiNames;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v39;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v39 != v16)
          objc_enumerationMutation(v14);
        v18 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * v17), "copyWithZone:", a3);
        -[GEOPDEnrichmentInfo addPoiName:](v5, v18);

        ++v17;
      }
      while (v15 != v17);
      v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
    }
    while (v15);
  }

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v19 = self->_showcaseTitles;
  v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
  if (v20)
  {
    v21 = *(_QWORD *)v35;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v35 != v21)
          objc_enumerationMutation(v19);
        v23 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * v22), "copyWithZone:", a3);
        -[GEOPDEnrichmentInfo addShowcaseTitle:](v5, v23);

        ++v22;
      }
      while (v20 != v22);
      v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
    }
    while (v20);
  }

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v24 = self->_showcaseImageUrls;
  v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
  if (v25)
  {
    v26 = *(_QWORD *)v31;
    do
    {
      v27 = 0;
      do
      {
        if (*(_QWORD *)v31 != v26)
          objc_enumerationMutation(v24);
        v28 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * v27), "copyWithZone:", a3, (_QWORD)v30);
        -[GEOPDEnrichmentInfo addShowcaseImageUrl:](v5, v28);

        ++v27;
      }
      while (v25 != v27);
      v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
    }
    while (v25);
  }

  objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *sourceName;
  NSString *sourceId;
  NSString *showcaseId;
  NSMutableArray *poiNames;
  NSMutableArray *showcaseTitles;
  NSMutableArray *showcaseImageUrls;
  char v11;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((-[GEOPDEnrichmentInfo readAll:]((uint64_t)self, 1),
         -[GEOPDEnrichmentInfo readAll:]((uint64_t)v4, 1),
         sourceName = self->_sourceName,
         !((unint64_t)sourceName | v4[8]))
     || -[NSString isEqual:](sourceName, "isEqual:"))
    && ((sourceId = self->_sourceId, !((unint64_t)sourceId | v4[7]))
     || -[NSString isEqual:](sourceId, "isEqual:"))
    && ((showcaseId = self->_showcaseId, !((unint64_t)showcaseId | v4[4]))
     || -[NSString isEqual:](showcaseId, "isEqual:"))
    && ((poiNames = self->_poiNames, !((unint64_t)poiNames | v4[3]))
     || -[NSMutableArray isEqual:](poiNames, "isEqual:"))
    && ((showcaseTitles = self->_showcaseTitles, !((unint64_t)showcaseTitles | v4[6]))
     || -[NSMutableArray isEqual:](showcaseTitles, "isEqual:")))
  {
    showcaseImageUrls = self->_showcaseImageUrls;
    if ((unint64_t)showcaseImageUrls | v4[5])
      v11 = -[NSMutableArray isEqual:](showcaseImageUrls, "isEqual:");
    else
      v11 = 1;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  uint64_t v6;
  uint64_t v7;

  -[GEOPDEnrichmentInfo readAll:]((uint64_t)self, 1);
  v3 = -[NSString hash](self->_sourceName, "hash");
  v4 = -[NSString hash](self->_sourceId, "hash") ^ v3;
  v5 = -[NSString hash](self->_showcaseId, "hash");
  v6 = v4 ^ v5 ^ -[NSMutableArray hash](self->_poiNames, "hash");
  v7 = -[NSMutableArray hash](self->_showcaseTitles, "hash");
  return v6 ^ v7 ^ -[NSMutableArray hash](self->_showcaseImageUrls, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceName, 0);
  objc_storeStrong((id *)&self->_sourceId, 0);
  objc_storeStrong((id *)&self->_showcaseTitles, 0);
  objc_storeStrong((id *)&self->_showcaseImageUrls, 0);
  objc_storeStrong((id *)&self->_showcaseId, 0);
  objc_storeStrong((id *)&self->_poiNames, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
