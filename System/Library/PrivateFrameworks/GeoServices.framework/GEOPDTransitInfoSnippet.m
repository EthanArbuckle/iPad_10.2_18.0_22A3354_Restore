@implementation GEOPDTransitInfoSnippet

+ (id)transitInfoSnippetForPlaceData:(id)a3
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
  v6[2] = __75__GEOPDTransitInfoSnippet_PlaceDataExtras__transitInfoSnippetForPlaceData___block_invoke;
  v6[3] = &unk_1E1C09718;
  v6[4] = &v7;
  objc_msgSend(v3, "enumerateValidComponentValuesOfType:usingBlock:", 27, v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __75__GEOPDTransitInfoSnippet_PlaceDataExtras__transitInfoSnippetForPlaceData___block_invoke(uint64_t a1, id *a2, BOOL *a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;

  -[GEOPDComponentValue transitInfoSnippet](a2);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  *a3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) != 0;
}

- (uint64_t)clearUnknownFields:(uint64_t)result
{
  uint64_t v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
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
  if (result)
  {
    v1 = result;
    os_unfair_lock_lock_with_options();
    *(_WORD *)(v1 + 112) |= 4u;
    *(_WORD *)(v1 + 112) |= 0x800u;
    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 104));
    v2 = *(void **)(v1 + 16);
    *(_QWORD *)(v1 + 16) = 0;

    -[GEOPDTransitInfoSnippet readAll:](v1, 0);
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v3 = *(id *)(v1 + 24);
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v20;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v20 != v6)
            objc_enumerationMutation(v3);
          objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v7++), "clearUnknownFields:", 1);
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      }
      while (v5);
    }

    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v8 = *(id *)(v1 + 32);
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v16;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v16 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v12++), "clearUnknownFields:", 1, (_QWORD)v15);
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
      }
      while (v10);
    }

    v13 = *(_QWORD *)(v1 + 72);
    if (v13)
    {
      v14 = *(void **)(v13 + 8);
      *(_QWORD *)(v13 + 8) = 0;

    }
    objc_msgSend(*(id *)(v1 + 48), "clearUnknownFields:", 1, (_QWORD)v15);
    return objc_msgSend(*(id *)(v1 + 56), "clearUnknownFields:", 1);
  }
  return result;
}

- (GEOPDTransitInfoSnippet)init
{
  GEOPDTransitInfoSnippet *v2;
  GEOPDTransitInfoSnippet *v3;
  GEOPDTransitInfoSnippet *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDTransitInfoSnippet;
  v2 = -[GEOPDTransitInfoSnippet init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDTransitInfoSnippet)initWithData:(id)a3
{
  GEOPDTransitInfoSnippet *v3;
  GEOPDTransitInfoSnippet *v4;
  GEOPDTransitInfoSnippet *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDTransitInfoSnippet;
  v3 = -[GEOPDTransitInfoSnippet initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readSystemNames
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 112) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDTransitInfoSnippetReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSystemNames_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (id)systemNames
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDTransitInfoSnippet _readSystemNames]((uint64_t)a1);
    a1 = (id *)v1[8];
  }
  return a1;
}

- (void)addSystemName:(uint64_t)a1
{
  id v3;

  if (a1)
  {
    v3 = a2;
    -[GEOPDTransitInfoSnippet _readSystemNames](a1);
    -[GEOPDTransitInfoSnippet _addNoFlagsSystemName:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 112) |= 0x100u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
    *(_WORD *)(a1 + 112) |= 0x800u;
  }
}

- (void)_addNoFlagsSystemName:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 64);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 64);
      *(_QWORD *)(a1 + 64) = v5;

      v4 = *(void **)(a1 + 64);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (void)_readArtworks
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 112) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDTransitInfoSnippetReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readArtworks_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (id)artworks
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDTransitInfoSnippet _readArtworks]((uint64_t)a1);
    a1 = (id *)v1[3];
  }
  return a1;
}

- (void)addArtwork:(uint64_t)a1
{
  id v3;

  if (a1)
  {
    v3 = a2;
    -[GEOPDTransitInfoSnippet _readArtworks](a1);
    -[GEOPDTransitInfoSnippet _addNoFlagsArtwork:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 112) |= 8u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
    *(_WORD *)(a1 + 112) |= 0x800u;
  }
}

- (void)_addNoFlagsArtwork:(uint64_t)a1
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

- (void)_readSearchDisplayName
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 112) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDTransitInfoSnippetReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSearchDisplayName_tags_6955);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (id)searchDisplayName
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDTransitInfoSnippet _readSearchDisplayName]((uint64_t)a1);
    a1 = (id *)v1[5];
  }
  return a1;
}

- (void)_readLabels
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 112) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDTransitInfoSnippetReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLabels_tags_6956);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (id)labels
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDTransitInfoSnippet _readLabels]((uint64_t)a1);
    a1 = (id *)v1[4];
  }
  return a1;
}

- (void)addLabel:(uint64_t)a1
{
  id v3;

  if (a1)
  {
    v3 = a2;
    -[GEOPDTransitInfoSnippet _readLabels](a1);
    -[GEOPDTransitInfoSnippet _addNoFlagsLabel:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 112) |= 0x10u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
    *(_WORD *)(a1 + 112) |= 0x800u;
  }
}

- (void)_addNoFlagsLabel:(uint64_t)a1
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

- (void)_readTimezone
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 112) & 0x200) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDTransitInfoSnippetReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTimezone_tags_6957);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (id)timezone
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDTransitInfoSnippet _readTimezone]((uint64_t)a1);
    a1 = (id *)v1[9];
  }
  return a1;
}

- (void)_readTransitName
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 112) & 0x400) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDTransitInfoSnippetReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTransitName_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (id)transitName
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDTransitInfoSnippet _readTransitName]((uint64_t)a1);
    a1 = (id *)v1[11];
  }
  return a1;
}

- (void)_readStopLocationForTrip
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 112) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDTransitInfoSnippetReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readStopLocationForTrip_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (id)stopLocationForTrip
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDTransitInfoSnippet _readStopLocationForTrip]((uint64_t)a1);
    a1 = (id *)v1[6];
  }
  return a1;
}

- (void)_readStyleAttributesForTrip
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 112) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDTransitInfoSnippetReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readStyleAttributesForTrip_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (id)styleAttributesForTrip
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDTransitInfoSnippet _readStyleAttributesForTrip]((uint64_t)a1);
    a1 = (id *)v1[7];
  }
  return a1;
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
  v8.super_class = (Class)GEOPDTransitInfoSnippet;
  -[GEOPDTransitInfoSnippet description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDTransitInfoSnippet dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDTransitInfoSnippet _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  void *v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  const __CFString *v31;
  void *v32;
  void *v33;
  void *v34;
  const __CFString *v35;
  void *v36;
  void *v37;
  void *v38;
  const __CFString *v39;
  void *v40;
  const __CFString *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  id v47;
  _QWORD v49[4];
  id v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  -[GEOPDTransitInfoSnippet readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_QWORD *)(a1 + 64))
  {
    -[GEOPDTransitInfoSnippet systemNames]((id *)a1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v6 = CFSTR("systemName");
    else
      v6 = CFSTR("system_name");
    objc_msgSend(v4, "setObject:forKey:", v5, v6);

  }
  if (objc_msgSend(*(id *)(a1 + 24), "count"))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    v8 = *(id *)(a1 + 24);
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v55, v60, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v56;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v56 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v13, "jsonRepresentation");
          else
            objc_msgSend(v13, "dictionaryRepresentation");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v14);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v55, v60, 16);
      }
      while (v10);
    }

    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("artwork"));
  }
  -[GEOPDTransitInfoSnippet searchDisplayName]((id *)a1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    if (a2)
      v16 = CFSTR("searchDisplayName");
    else
      v16 = CFSTR("search_display_name");
    objc_msgSend(v4, "setObject:forKey:", v15, v16);
  }

  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v18 = *(id *)(a1 + 32);
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v51, v59, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v52;
      do
      {
        for (j = 0; j != v20; ++j)
        {
          if (*(_QWORD *)v52 != v21)
            objc_enumerationMutation(v18);
          v23 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * j);
          if ((a2 & 1) != 0)
            objc_msgSend(v23, "jsonRepresentation");
          else
            objc_msgSend(v23, "dictionaryRepresentation");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "addObject:", v24);

        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v51, v59, 16);
      }
      while (v20);
    }

    objc_msgSend(v4, "setObject:forKey:", v17, CFSTR("label"));
  }
  if ((*(_WORD *)(a1 + 112) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 80));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v26 = CFSTR("transitId");
    else
      v26 = CFSTR("transit_id");
    objc_msgSend(v4, "setObject:forKey:", v25, v26);

  }
  -[GEOPDTransitInfoSnippet timezone]((id *)a1);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v27;
  if (v27)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v27, "jsonRepresentation");
    else
      objc_msgSend(v27, "dictionaryRepresentation");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v29, CFSTR("timezone"));

  }
  -[GEOPDTransitInfoSnippet transitName]((id *)a1);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (v30)
  {
    if (a2)
      v31 = CFSTR("transitName");
    else
      v31 = CFSTR("transit_name");
    objc_msgSend(v4, "setObject:forKey:", v30, v31);
  }

  -[GEOPDTransitInfoSnippet stopLocationForTrip]((id *)a1);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v32;
  if (v32)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v32, "jsonRepresentation");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = CFSTR("stopLocationForTrip");
    }
    else
    {
      objc_msgSend(v32, "dictionaryRepresentation");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = CFSTR("stop_location_for_trip");
    }
    objc_msgSend(v4, "setObject:forKey:", v34, v35);

  }
  -[GEOPDTransitInfoSnippet styleAttributesForTrip]((id *)a1);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v36;
  if (v36)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v36, "jsonRepresentation");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = CFSTR("styleAttributesForTrip");
    }
    else
    {
      objc_msgSend(v36, "dictionaryRepresentation");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = CFSTR("style_attributes_for_trip");
    }
    objc_msgSend(v4, "setObject:forKey:", v38, v39);

  }
  if ((*(_WORD *)(a1 + 112) & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 108));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v41 = CFSTR("isHidden");
    else
      v41 = CFSTR("is_hidden");
    objc_msgSend(v4, "setObject:forKey:", v40, v41);

  }
  v42 = *(void **)(a1 + 16);
  if (v42)
  {
    objc_msgSend(v42, "dictionaryRepresentation");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = v43;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v43, "count"));
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v49[0] = MEMORY[0x1E0C809B0];
      v49[1] = 3221225472;
      v49[2] = __53__GEOPDTransitInfoSnippet__dictionaryRepresentation___block_invoke;
      v49[3] = &unk_1E1C00600;
      v46 = v45;
      v50 = v46;
      objc_msgSend(v44, "enumerateKeysAndObjectsUsingBlock:", v49);
      v47 = v46;

      v44 = v47;
    }
    objc_msgSend(v4, "setObject:forKey:", v44, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDTransitInfoSnippet _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  void *v4;
  id v5;
  int *v6;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      v5 = v4;
      objc_sync_enter(v5);
      if (a2)
        v6 = (int *)&readAll__recursiveTag_6978;
      else
        v6 = (int *)&readAll__nonRecursiveTag_6979;
      GEOPDTransitInfoSnippetReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
      _GEOPDTransitInfoSnippetCallReadAllRecursiveWithoutSynchronized((id *)a1);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

void __53__GEOPDTransitInfoSnippet__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  uint64_t v22;
  GEOPBTransitArtwork *v23;
  GEOPBTransitArtwork *v24;
  GEOPBTransitArtwork *v25;
  const __CFString *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t k;
  uint64_t v36;
  GEOPDTransitLabel *v37;
  GEOPDTransitLabel *v38;
  GEOPDTransitLabel *v39;
  const __CFString *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  GEOTimezone *v44;
  void *v45;
  id v46;
  const __CFString *v47;
  void *v48;
  void *v49;
  id v50;
  const __CFString *v51;
  void *v52;
  GEOLatLng *v53;
  GEOLatLng *v54;
  GEOLatLng *v55;
  GEOLatLng *v56;
  const __CFString *v57;
  void *v58;
  GEOStyleAttributes *v59;
  GEOStyleAttributes *v60;
  GEOStyleAttributes *v61;
  GEOStyleAttributes *v62;
  const __CFString *v63;
  void *v64;
  char v65;
  void *v67;
  void *v68;
  id v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  _BYTE v82[128];
  _BYTE v83[128];
  _BYTE v84[128];
  uint64_t v85;

  v85 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = objc_msgSend(a1, "init");
  if (v6)
  {
    if (a3)
      v7 = CFSTR("systemName");
    else
      v7 = CFSTR("system_name");
    objc_msgSend(v5, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v80 = 0u;
      v81 = 0u;
      v78 = 0u;
      v79 = 0u;
      v9 = v8;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v78, v84, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v79;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v79 != v12)
              objc_enumerationMutation(v9);
            v14 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v15 = (void *)objc_msgSend(v14, "copy");
              -[GEOPDTransitInfoSnippet addSystemName:](v6, v15);

            }
          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v78, v84, 16);
        }
        while (v11);
      }

    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("artwork"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v69 = v5;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v76 = 0u;
      v77 = 0u;
      v74 = 0u;
      v75 = 0u;
      v67 = v16;
      v17 = v16;
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v74, v83, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v75;
        do
        {
          for (j = 0; j != v19; ++j)
          {
            if (*(_QWORD *)v75 != v20)
              objc_enumerationMutation(v17);
            v22 = *(_QWORD *)(*((_QWORD *)&v74 + 1) + 8 * j);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v23 = [GEOPBTransitArtwork alloc];
              if ((a3 & 1) != 0)
                v24 = -[GEOPBTransitArtwork initWithJSON:](v23, "initWithJSON:", v22);
              else
                v24 = -[GEOPBTransitArtwork initWithDictionary:](v23, "initWithDictionary:", v22);
              v25 = v24;
              -[GEOPDTransitInfoSnippet addArtwork:](v6, v24);

            }
          }
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v74, v83, 16);
        }
        while (v19);
      }

      v5 = v69;
    }

    if (a3)
      v26 = CFSTR("searchDisplayName");
    else
      v26 = CFSTR("search_display_name");
    objc_msgSend(v5, "objectForKeyedSubscript:", v26, v67);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v28 = (void *)objc_msgSend(v27, "copy");
      v29 = v28;
      *(_WORD *)(v6 + 112) |= 0x20u;
      *(_WORD *)(v6 + 112) |= 0x800u;
      objc_storeStrong((id *)(v6 + 40), v28);

    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("label"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v72 = 0u;
      v73 = 0u;
      v70 = 0u;
      v71 = 0u;
      v68 = v30;
      v31 = v30;
      v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v70, v82, 16);
      if (v32)
      {
        v33 = v32;
        v34 = *(_QWORD *)v71;
        do
        {
          for (k = 0; k != v33; ++k)
          {
            if (*(_QWORD *)v71 != v34)
              objc_enumerationMutation(v31);
            v36 = *(_QWORD *)(*((_QWORD *)&v70 + 1) + 8 * k);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v37 = [GEOPDTransitLabel alloc];
              if ((a3 & 1) != 0)
                v38 = -[GEOPDTransitLabel initWithJSON:](v37, "initWithJSON:", v36);
              else
                v38 = -[GEOPDTransitLabel initWithDictionary:](v37, "initWithDictionary:", v36);
              v39 = v38;
              -[GEOPDTransitInfoSnippet addLabel:](v6, v38);

            }
          }
          v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v70, v82, 16);
        }
        while (v33);
      }

      v30 = v68;
      v5 = v69;
    }

    if (a3)
      v40 = CFSTR("transitId");
    else
      v40 = CFSTR("transit_id");
    objc_msgSend(v5, "objectForKeyedSubscript:", v40, v68);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v42 = objc_msgSend(v41, "unsignedLongLongValue");
      *(_WORD *)(v6 + 112) |= 0x800u;
      *(_WORD *)(v6 + 112) |= 1u;
      *(_QWORD *)(v6 + 80) = v42;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("timezone"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v44 = [GEOTimezone alloc];
      if (v44)
        v45 = -[GEOTimezone _initWithDictionary:isJSON:](v44, v43);
      else
        v45 = 0;
      v46 = v45;
      *(_WORD *)(v6 + 112) |= 0x200u;
      *(_WORD *)(v6 + 112) |= 0x800u;
      objc_storeStrong((id *)(v6 + 72), v45);

    }
    if (a3)
      v47 = CFSTR("transitName");
    else
      v47 = CFSTR("transit_name");
    objc_msgSend(v5, "objectForKeyedSubscript:", v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v49 = (void *)objc_msgSend(v48, "copy");
      v50 = v49;
      *(_WORD *)(v6 + 112) |= 0x400u;
      *(_WORD *)(v6 + 112) |= 0x800u;
      objc_storeStrong((id *)(v6 + 88), v49);

    }
    if (a3)
      v51 = CFSTR("stopLocationForTrip");
    else
      v51 = CFSTR("stop_location_for_trip");
    objc_msgSend(v5, "objectForKeyedSubscript:", v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v53 = [GEOLatLng alloc];
      if ((a3 & 1) != 0)
        v54 = -[GEOLatLng initWithJSON:](v53, "initWithJSON:", v52);
      else
        v54 = -[GEOLatLng initWithDictionary:](v53, "initWithDictionary:", v52);
      v55 = v54;
      v56 = v54;
      *(_WORD *)(v6 + 112) |= 0x40u;
      *(_WORD *)(v6 + 112) |= 0x800u;
      objc_storeStrong((id *)(v6 + 48), v55);

    }
    if (a3)
      v57 = CFSTR("styleAttributesForTrip");
    else
      v57 = CFSTR("style_attributes_for_trip");
    objc_msgSend(v5, "objectForKeyedSubscript:", v57);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v59 = [GEOStyleAttributes alloc];
      if ((a3 & 1) != 0)
        v60 = -[GEOStyleAttributes initWithJSON:](v59, "initWithJSON:", v58);
      else
        v60 = -[GEOStyleAttributes initWithDictionary:](v59, "initWithDictionary:", v58);
      v61 = v60;
      v62 = v60;
      *(_WORD *)(v6 + 112) |= 0x80u;
      *(_WORD *)(v6 + 112) |= 0x800u;
      objc_storeStrong((id *)(v6 + 56), v61);

    }
    if (a3)
      v63 = CFSTR("isHidden");
    else
      v63 = CFSTR("is_hidden");
    objc_msgSend(v5, "objectForKeyedSubscript:", v63);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v65 = objc_msgSend(v64, "BOOLValue");
      *(_WORD *)(v6 + 112) |= 0x800u;
      *(_WORD *)(v6 + 112) |= 2u;
      *(_BYTE *)(v6 + 108) = v65;
    }

  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDTransitInfoSnippetReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  __int16 flags;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t j;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t k;
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t m;
  NSMutableArray *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  PBDataReader *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
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
  _BYTE v41[128];
  _BYTE v42[128];
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader
    && (os_unfair_lock_assert_owner(&self->_readerLock), flags = (__int16)self->_flags, (flags & 0xFF8) == 0))
  {
    if ((flags & 0x10) != 0)
    {
      v39 = 0u;
      v40 = 0u;
      v37 = 0u;
      v38 = 0u;
      v19 = self->_labels;
      v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v37, v44, 16);
      if (v20)
      {
        v21 = *(_QWORD *)v38;
        while (2)
        {
          for (i = 0; i != v20; ++i)
          {
            if (*(_QWORD *)v38 != v21)
              objc_enumerationMutation(v19);
            if ((GEOPDTransitLabelIsDirty(*(os_unfair_lock_s **)(*((_QWORD *)&v37 + 1) + 8 * i)) & 1) != 0)
            {

              goto LABEL_3;
            }
          }
          v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v37, v44, 16);
          if (v20)
            continue;
          break;
        }
      }

    }
    v23 = self->_reader;
    objc_sync_enter(v23);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v24);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v23);
  }
  else
  {
LABEL_3:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDTransitInfoSnippet readAll:]((uint64_t)self, 0);
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v7 = self->_systemNames;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v34;
      do
      {
        for (j = 0; j != v8; ++j)
        {
          if (*(_QWORD *)v34 != v9)
            objc_enumerationMutation(v7);
          PBDataWriterWriteStringField();
        }
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
      }
      while (v8);
    }

    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v11 = self->_artworks;
    v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v29, v42, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v30;
      do
      {
        for (k = 0; k != v12; ++k)
        {
          if (*(_QWORD *)v30 != v13)
            objc_enumerationMutation(v11);
          PBDataWriterWriteSubmessage();
        }
        v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v29, v42, 16);
      }
      while (v12);
    }

    if (self->_searchDisplayName)
      PBDataWriterWriteStringField();
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v15 = self->_labels;
    v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v25, v41, 16);
    if (v16)
    {
      v17 = *(_QWORD *)v26;
      do
      {
        for (m = 0; m != v16; ++m)
        {
          if (*(_QWORD *)v26 != v17)
            objc_enumerationMutation(v15);
          PBDataWriterWriteSubmessage();
        }
        v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v25, v41, 16);
      }
      while (v16);
    }

    if ((*(_WORD *)&self->_flags & 1) != 0)
      PBDataWriterWriteUint64Field();
    if (self->_timezone)
      PBDataWriterWriteSubmessage();
    if (self->_transitName)
      PBDataWriterWriteStringField();
    if (self->_stopLocationForTrip)
      PBDataWriterWriteSubmessage();
    if (self->_styleAttributesForTrip)
      PBDataWriterWriteSubmessage();
    if ((*(_WORD *)&self->_flags & 2) != 0)
      PBDataWriterWriteBOOLField();
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v25);
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  uint64_t v19;
  void *v20;
  NSMutableArray *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t k;
  void *v25;
  id v26;
  void *v27;
  uint64_t v28;
  void *v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  PBUnknownFields *v34;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
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
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x800) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOPDTransitInfoSnippetReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_31;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDTransitInfoSnippet readAll:]((uint64_t)self, 0);
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v9 = self->_systemNames;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v45;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v45 != v11)
          objc_enumerationMutation(v9);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * i), "copyWithZone:", a3);
        -[GEOPDTransitInfoSnippet addSystemName:](v5, v13);

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
    }
    while (v10);
  }

  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v14 = self->_artworks;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v41;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v41 != v16)
          objc_enumerationMutation(v14);
        v18 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * j), "copyWithZone:", a3);
        -[GEOPDTransitInfoSnippet addArtwork:](v5, v18);

      }
      v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
    }
    while (v15);
  }

  v19 = -[NSString copyWithZone:](self->_searchDisplayName, "copyWithZone:", a3);
  v20 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v19;

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v21 = self->_labels;
  v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v36, v48, 16);
  if (v22)
  {
    v23 = *(_QWORD *)v37;
    do
    {
      for (k = 0; k != v22; ++k)
      {
        if (*(_QWORD *)v37 != v23)
          objc_enumerationMutation(v21);
        v25 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * k), "copyWithZone:", a3, (_QWORD)v36);
        -[GEOPDTransitInfoSnippet addLabel:](v5, v25);

      }
      v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v36, v48, 16);
    }
    while (v22);
  }

  if ((*(_WORD *)&self->_flags & 1) != 0)
  {
    *(_QWORD *)(v5 + 80) = self->_transitId;
    *(_WORD *)(v5 + 112) |= 1u;
  }
  v26 = -[GEOTimezone copyWithZone:](self->_timezone, "copyWithZone:", a3, (_QWORD)v36);
  v27 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v26;

  v28 = -[NSString copyWithZone:](self->_transitName, "copyWithZone:", a3);
  v29 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v28;

  v30 = -[GEOLatLng copyWithZone:](self->_stopLocationForTrip, "copyWithZone:", a3);
  v31 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v30;

  v32 = -[GEOStyleAttributes copyWithZone:](self->_styleAttributesForTrip, "copyWithZone:", a3);
  v33 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v32;

  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    *(_BYTE *)(v5 + 108) = self->_isHidden;
    *(_WORD *)(v5 + 112) |= 2u;
  }
  v34 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v34;
LABEL_31:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSMutableArray *systemNames;
  NSMutableArray *artworks;
  NSString *searchDisplayName;
  NSMutableArray *labels;
  __int16 v9;
  GEOTimezone *timezone;
  NSString *transitName;
  GEOLatLng *stopLocationForTrip;
  GEOStyleAttributes *styleAttributesForTrip;
  __int16 v14;
  BOOL v15;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_25;
  -[GEOPDTransitInfoSnippet readAll:]((uint64_t)self, 1);
  -[GEOPDTransitInfoSnippet readAll:]((uint64_t)v4, 1);
  systemNames = self->_systemNames;
  if ((unint64_t)systemNames | *((_QWORD *)v4 + 8))
  {
    if (!-[NSMutableArray isEqual:](systemNames, "isEqual:"))
      goto LABEL_25;
  }
  artworks = self->_artworks;
  if ((unint64_t)artworks | *((_QWORD *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](artworks, "isEqual:"))
      goto LABEL_25;
  }
  searchDisplayName = self->_searchDisplayName;
  if ((unint64_t)searchDisplayName | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](searchDisplayName, "isEqual:"))
      goto LABEL_25;
  }
  labels = self->_labels;
  if ((unint64_t)labels | *((_QWORD *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](labels, "isEqual:"))
      goto LABEL_25;
  }
  v9 = *((_WORD *)v4 + 56);
  if ((*(_WORD *)&self->_flags & 1) != 0)
  {
    if ((v9 & 1) == 0 || self->_transitId != *((_QWORD *)v4 + 10))
      goto LABEL_25;
  }
  else if ((v9 & 1) != 0)
  {
    goto LABEL_25;
  }
  timezone = self->_timezone;
  if ((unint64_t)timezone | *((_QWORD *)v4 + 9) && !-[GEOTimezone isEqual:](timezone, "isEqual:"))
    goto LABEL_25;
  transitName = self->_transitName;
  if ((unint64_t)transitName | *((_QWORD *)v4 + 11))
  {
    if (!-[NSString isEqual:](transitName, "isEqual:"))
      goto LABEL_25;
  }
  stopLocationForTrip = self->_stopLocationForTrip;
  if ((unint64_t)stopLocationForTrip | *((_QWORD *)v4 + 6))
  {
    if (!-[GEOLatLng isEqual:](stopLocationForTrip, "isEqual:"))
      goto LABEL_25;
  }
  styleAttributesForTrip = self->_styleAttributesForTrip;
  if ((unint64_t)styleAttributesForTrip | *((_QWORD *)v4 + 7))
  {
    if (!-[GEOStyleAttributes isEqual:](styleAttributesForTrip, "isEqual:"))
      goto LABEL_25;
  }
  v14 = *((_WORD *)v4 + 56);
  v15 = (v14 & 2) == 0;
  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    if ((v14 & 2) == 0)
    {
LABEL_25:
      v15 = 0;
      goto LABEL_26;
    }
    if (self->_isHidden)
    {
      if (!*((_BYTE *)v4 + 108))
        goto LABEL_25;
    }
    else if (*((_BYTE *)v4 + 108))
    {
      goto LABEL_25;
    }
    v15 = 1;
  }
LABEL_26:

  return v15;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  NSUInteger v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v13;

  -[GEOPDTransitInfoSnippet readAll:]((uint64_t)self, 1);
  v13 = -[NSMutableArray hash](self->_systemNames, "hash");
  v3 = -[NSMutableArray hash](self->_artworks, "hash");
  v4 = -[NSString hash](self->_searchDisplayName, "hash");
  v5 = -[NSMutableArray hash](self->_labels, "hash");
  if ((*(_WORD *)&self->_flags & 1) != 0)
    v6 = 2654435761u * self->_transitId;
  else
    v6 = 0;
  v7 = -[GEOTimezone hash](self->_timezone, "hash");
  v8 = -[NSString hash](self->_transitName, "hash");
  v9 = -[GEOLatLng hash](self->_stopLocationForTrip, "hash");
  v10 = -[GEOStyleAttributes hash](self->_styleAttributesForTrip, "hash");
  if ((*(_WORD *)&self->_flags & 2) != 0)
    v11 = 2654435761 * self->_isHidden;
  else
    v11 = 0;
  return v3 ^ v13 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitName, 0);
  objc_storeStrong((id *)&self->_timezone, 0);
  objc_storeStrong((id *)&self->_systemNames, 0);
  objc_storeStrong((id *)&self->_styleAttributesForTrip, 0);
  objc_storeStrong((id *)&self->_stopLocationForTrip, 0);
  objc_storeStrong((id *)&self->_searchDisplayName, 0);
  objc_storeStrong((id *)&self->_labels, 0);
  objc_storeStrong((id *)&self->_artworks, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
