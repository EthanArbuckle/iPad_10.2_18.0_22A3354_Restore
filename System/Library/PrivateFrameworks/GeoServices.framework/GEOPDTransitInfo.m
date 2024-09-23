@implementation GEOPDTransitInfo

+ (id)transitInfoForPlaceData:(id)a3
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
  v6[2] = __61__GEOPDTransitInfo_PlaceDataExtras__transitInfoForPlaceData___block_invoke;
  v6[3] = &unk_1E1C09718;
  v6[4] = &v7;
  objc_msgSend(v3, "enumerateValidComponentValuesOfType:usingBlock:", 10, v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __61__GEOPDTransitInfo_PlaceDataExtras__transitInfoForPlaceData___block_invoke(uint64_t a1, id *a2, BOOL *a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;

  -[GEOPDComponentValue transitInfo](a2);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  *a3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) != 0;
}

- (uint64_t)hasGreenTeaWithValue:(uint64_t)result
{
  uint64_t v3;
  id v4;
  uint64_t v5;
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
  if (result)
  {
    v3 = result;
    -[GEOPDTransitInfo _readTransitConnections](result);
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v4 = *(id *)(v3 + 80);
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v11;
      while (2)
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(v4);
          v9 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8);
          if (v9)
          {
            -[GEOPDTransitConnection _readMapsId](*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8));
            if ((objc_msgSend(*(id *)(v9 + 32), "hasGreenTeaWithValue:", a2, (_QWORD)v10) & 1) != 0)
            {

              return 1;
            }
          }
          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        if (v6)
          continue;
        break;
      }
    }

    -[GEOPDTransitInfo _readTransitMarketId](v3);
    return objc_msgSend(*(id *)(v3 + 96), "hasGreenTeaWithValue:", a2);
  }
  return result;
}

- (GEOPDTransitInfo)init
{
  GEOPDTransitInfo *v2;
  GEOPDTransitInfo *v3;
  GEOPDTransitInfo *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDTransitInfo;
  v2 = -[GEOPDTransitInfo init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDTransitInfo)initWithData:(id)a3
{
  GEOPDTransitInfo *v3;
  GEOPDTransitInfo *v4;
  GEOPDTransitInfo *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDTransitInfo;
  v3 = -[GEOPDTransitInfo initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readLines
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(_WORD *)(a1 + 116) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDTransitInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLines_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

- (id)lines
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDTransitInfo _readLines]((uint64_t)a1);
    a1 = (id *)v1[4];
  }
  return a1;
}

- (void)addLine:(uint64_t)a1
{
  id v3;

  if (a1)
  {
    v3 = a2;
    -[GEOPDTransitInfo _readLines](a1);
    -[GEOPDTransitInfo _addNoFlagsLine:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 116) |= 8u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
    *(_WORD *)(a1 + 116) |= 0x800u;
  }
}

- (void)_addNoFlagsLine:(uint64_t)a1
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

- (id)lineAtIndex:(id *)a1
{
  id *v3;

  if (a1)
  {
    v3 = a1;
    -[GEOPDTransitInfo _readLines]((uint64_t)a1);
    objc_msgSend(v3[4], "objectAtIndex:", a2);
    a1 = (id *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (void)_readSystems
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(_WORD *)(a1 + 116) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDTransitInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSystems_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

- (id)systems
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDTransitInfo _readSystems]((uint64_t)a1);
    a1 = (id *)v1[8];
  }
  return a1;
}

- (void)addSystem:(uint64_t)a1
{
  id v3;

  if (a1)
  {
    v3 = a2;
    -[GEOPDTransitInfo _readSystems](a1);
    -[GEOPDTransitInfo _addNoFlagsSystem:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 116) |= 0x80u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
    *(_WORD *)(a1 + 116) |= 0x800u;
  }
}

- (void)_addNoFlagsSystem:(uint64_t)a1
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

- (void)_readLabels
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(_WORD *)(a1 + 116) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDTransitInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLabels_tags_6912);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

- (id)labels
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDTransitInfo _readLabels]((uint64_t)a1);
    a1 = (id *)v1[3];
  }
  return a1;
}

- (void)addLabel:(uint64_t)a1
{
  id v3;

  if (a1)
  {
    v3 = a2;
    -[GEOPDTransitInfo _readLabels](a1);
    -[GEOPDTransitInfo _addNoFlagsLabel:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 116) |= 4u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
    *(_WORD *)(a1 + 116) |= 0x800u;
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

- (void)_readTransitConnections
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(_WORD *)(a1 + 116) & 0x200) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDTransitInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTransitConnections_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

- (id)transitConnections
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDTransitInfo _readTransitConnections]((uint64_t)a1);
    a1 = (id *)v1[10];
  }
  return a1;
}

- (void)addTransitConnection:(uint64_t)a1
{
  id v3;

  if (a1)
  {
    v3 = a2;
    -[GEOPDTransitInfo _readTransitConnections](a1);
    -[GEOPDTransitInfo _addNoFlagsTransitConnection:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 116) |= 0x200u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
    *(_WORD *)(a1 + 116) |= 0x800u;
  }
}

- (void)_addNoFlagsTransitConnection:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 80);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 80);
      *(_QWORD *)(a1 + 80) = v5;

      v4 = *(void **)(a1 + 80);
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
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(_WORD *)(a1 + 116) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDTransitInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSearchDisplayName_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

- (id)searchDisplayName
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDTransitInfo _readSearchDisplayName]((uint64_t)a1);
    a1 = (id *)v1[5];
  }
  return a1;
}

- (void)_readTransitMarketId
{
  void *v2;
  id v3;

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
  if ((*(_WORD *)(a1 + 116) & 0x400) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      v3 = v2;
      objc_sync_enter(v3);
      GEOPDTransitInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTransitMarketId_tags);
      objc_sync_exit(v3);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
}

- (void)_readTitle
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(_WORD *)(a1 + 116) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDTransitInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTitle_tags_6914);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

- (id)title
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDTransitInfo _readTitle]((uint64_t)a1);
    a1 = (id *)v1[9];
  }
  return a1;
}

- (void)_readSubTitle
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(_WORD *)(a1 + 116) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDTransitInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSubTitle_tags_6915);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

- (id)subTitle
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDTransitInfo _readSubTitle]((uint64_t)a1);
    a1 = (id *)v1[7];
  }
  return a1;
}

- (void)_readStopInfos
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(_WORD *)(a1 + 116) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDTransitInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readStopInfos_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

- (id)stopInfos
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDTransitInfo _readStopInfos]((uint64_t)a1);
    a1 = (id *)v1[6];
  }
  return a1;
}

- (void)addStopInfo:(uint64_t)a1
{
  id v3;

  if (a1)
  {
    v3 = a2;
    -[GEOPDTransitInfo _readStopInfos](a1);
    -[GEOPDTransitInfo _addNoFlagsStopInfo:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 116) |= 0x20u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
    *(_WORD *)(a1 + 116) |= 0x800u;
  }
}

- (void)_addNoFlagsStopInfo:(uint64_t)a1
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

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)GEOPDTransitInfo;
  -[GEOPDTransitInfo description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDTransitInfo dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDTransitInfo _dictionaryRepresentation:]((uint64_t)self, 0);
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
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t k;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t m;
  void *v35;
  void *v36;
  const __CFString *v37;
  void *v38;
  const __CFString *v39;
  id v40;
  void *v41;
  void *v42;
  const __CFString *v43;
  void *v44;
  void *v45;
  const __CFString *v46;
  void *v47;
  const __CFString *v48;
  void *v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t n;
  void *v55;
  void *v56;
  const __CFString *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  id v63;
  _QWORD v65[4];
  id v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
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
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  _BYTE v87[128];
  _BYTE v88[128];
  _BYTE v89[128];
  _BYTE v90[128];
  _BYTE v91[128];
  uint64_t v92;

  v92 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  -[GEOPDTransitInfo readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
    v83 = 0u;
    v84 = 0u;
    v85 = 0u;
    v86 = 0u;
    v6 = *(id *)(a1 + 32);
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v83, v91, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v84;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v84 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v11, "jsonRepresentation");
          else
            objc_msgSend(v11, "dictionaryRepresentation");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v12);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v83, v91, 16);
      }
      while (v8);
    }

    objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("line"));
  }
  if (objc_msgSend(*(id *)(a1 + 64), "count"))
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 64), "count"));
    v79 = 0u;
    v80 = 0u;
    v81 = 0u;
    v82 = 0u;
    v14 = *(id *)(a1 + 64);
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v79, v90, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v80;
      do
      {
        for (j = 0; j != v16; ++j)
        {
          if (*(_QWORD *)v80 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * j);
          if ((a2 & 1) != 0)
            objc_msgSend(v19, "jsonRepresentation");
          else
            objc_msgSend(v19, "dictionaryRepresentation");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addObject:", v20);

        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v79, v90, 16);
      }
      while (v16);
    }

    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("system"));
  }
  if (objc_msgSend(*(id *)(a1 + 24), "count"))
  {
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
    v75 = 0u;
    v76 = 0u;
    v77 = 0u;
    v78 = 0u;
    v22 = *(id *)(a1 + 24);
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v75, v89, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v76;
      do
      {
        for (k = 0; k != v24; ++k)
        {
          if (*(_QWORD *)v76 != v25)
            objc_enumerationMutation(v22);
          v27 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * k);
          if ((a2 & 1) != 0)
            objc_msgSend(v27, "jsonRepresentation");
          else
            objc_msgSend(v27, "dictionaryRepresentation");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "addObject:", v28);

        }
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v75, v89, 16);
      }
      while (v24);
    }

    objc_msgSend(v4, "setObject:forKey:", v21, CFSTR("label"));
  }
  if (objc_msgSend(*(id *)(a1 + 80), "count"))
  {
    v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 80), "count"));
    v71 = 0u;
    v72 = 0u;
    v73 = 0u;
    v74 = 0u;
    v30 = *(id *)(a1 + 80);
    v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v71, v88, 16);
    if (v31)
    {
      v32 = v31;
      v33 = *(_QWORD *)v72;
      do
      {
        for (m = 0; m != v32; ++m)
        {
          if (*(_QWORD *)v72 != v33)
            objc_enumerationMutation(v30);
          v35 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * m);
          if ((a2 & 1) != 0)
            objc_msgSend(v35, "jsonRepresentation");
          else
            objc_msgSend(v35, "dictionaryRepresentation");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "addObject:", v36);

        }
        v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v71, v88, 16);
      }
      while (v32);
    }

    if (a2)
      v37 = CFSTR("transitConnection");
    else
      v37 = CFSTR("transit_connection");
    objc_msgSend(v4, "setObject:forKey:", v29, v37);

  }
  -[GEOPDTransitInfo searchDisplayName]((id *)a1);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  if (v38)
  {
    if (a2)
      v39 = CFSTR("searchDisplayName");
    else
      v39 = CFSTR("search_display_name");
    objc_msgSend(v4, "setObject:forKey:", v38, v39);
  }

  -[GEOPDTransitInfo _readTransitMarketId](a1);
  v40 = *(id *)(a1 + 96);
  v41 = v40;
  if (v40)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v40, "jsonRepresentation");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = CFSTR("transitMarketId");
    }
    else
    {
      objc_msgSend(v40, "dictionaryRepresentation");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = CFSTR("transit_market_id");
    }
    objc_msgSend(v4, "setObject:forKey:", v42, v43);

  }
  -[GEOPDTransitInfo title]((id *)a1);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  if (v44)
    objc_msgSend(v4, "setObject:forKey:", v44, CFSTR("title"));

  -[GEOPDTransitInfo subTitle]((id *)a1);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  if (v45)
  {
    if (a2)
      v46 = CFSTR("subTitle");
    else
      v46 = CFSTR("sub_title");
    objc_msgSend(v4, "setObject:forKey:", v45, v46);
  }

  if ((*(_WORD *)(a1 + 116) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 88));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v48 = CFSTR("transitId");
    else
      v48 = CFSTR("transit_id");
    objc_msgSend(v4, "setObject:forKey:", v47, v48);

  }
  if (objc_msgSend(*(id *)(a1 + 48), "count"))
  {
    v49 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
    v67 = 0u;
    v68 = 0u;
    v69 = 0u;
    v70 = 0u;
    v50 = *(id *)(a1 + 48);
    v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v67, v87, 16);
    if (v51)
    {
      v52 = v51;
      v53 = *(_QWORD *)v68;
      do
      {
        for (n = 0; n != v52; ++n)
        {
          if (*(_QWORD *)v68 != v53)
            objc_enumerationMutation(v50);
          v55 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * n);
          if ((a2 & 1) != 0)
            objc_msgSend(v55, "jsonRepresentation");
          else
            objc_msgSend(v55, "dictionaryRepresentation");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "addObject:", v56);

        }
        v52 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v67, v87, 16);
      }
      while (v52);
    }

    if (a2)
      v57 = CFSTR("stopInfo");
    else
      v57 = CFSTR("stop_info");
    objc_msgSend(v4, "setObject:forKey:", v49, v57);

  }
  v58 = *(void **)(a1 + 16);
  if (v58)
  {
    objc_msgSend(v58, "dictionaryRepresentation");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = v59;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v59, "count"));
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v65[0] = MEMORY[0x1E0C809B0];
      v65[1] = 3221225472;
      v65[2] = __46__GEOPDTransitInfo__dictionaryRepresentation___block_invoke;
      v65[3] = &unk_1E1C00600;
      v62 = v61;
      v66 = v62;
      objc_msgSend(v60, "enumerateKeysAndObjectsUsingBlock:", v65);
      v63 = v62;

      v60 = v63;
    }
    objc_msgSend(v4, "setObject:forKey:", v60, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDTransitInfo _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  void *v4;
  id v5;
  int *v6;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      v5 = v4;
      objc_sync_enter(v5);
      if (a2)
        v6 = (int *)&readAll__recursiveTag_6937;
      else
        v6 = (int *)&readAll__nonRecursiveTag_6938;
      GEOPDTransitInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
      _GEOPDTransitInfoCallReadAllRecursiveWithoutSynchronized((id *)a1);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

void __46__GEOPDTransitInfo__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (BOOL)readFrom:(id)a3
{
  return GEOPDTransitInfoReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  uint64_t v6;
  __int16 flags;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  GEOPDTransitInfo *v18;
  NSMutableArray *v19;
  os_unfair_lock_s *v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  id v24;
  void *v25;
  NSMutableArray *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  NSMutableArray *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
  NSMutableArray *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t k;
  NSMutableArray *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t m;
  NSMutableArray *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t n;
  uint64_t v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
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
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  _BYTE v79[128];
  _BYTE v80[128];
  _BYTE v81[128];
  _BYTE v82[128];
  _BYTE v83[128];
  _BYTE v84[128];
  _BYTE v85[128];
  _BYTE v86[128];
  uint64_t v87;

  v87 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  v6 = 8;
  if (!self->_reader)
    goto LABEL_37;
  os_unfair_lock_assert_owner(&self->_readerLock);
  flags = (__int16)self->_flags;
  if ((flags & 0xFFC) != 0)
    goto LABEL_37;
  if ((flags & 0x80) != 0)
  {
    v77 = 0u;
    v78 = 0u;
    v75 = 0u;
    v76 = 0u;
    v8 = self->_systems;
    v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v75, v86, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v76;
LABEL_6:
      v11 = 0;
      while (1)
      {
        if (*(_QWORD *)v76 != v10)
          objc_enumerationMutation(v8);
        if ((GEOPBTransitSystemIsDirty(*(os_unfair_lock_s **)(*((_QWORD *)&v75 + 1) + 8 * v11)) & 1) != 0)
          goto LABEL_36;
        if (v9 == ++v11)
        {
          v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v75, v86, 16);
          if (v9)
            goto LABEL_6;
          break;
        }
      }
    }

    flags = (__int16)self->_flags;
  }
  if ((flags & 4) != 0)
  {
    v73 = 0u;
    v74 = 0u;
    v71 = 0u;
    v72 = 0u;
    v8 = self->_labels;
    v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v71, v85, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v72;
LABEL_16:
      v14 = 0;
      while (1)
      {
        if (*(_QWORD *)v72 != v13)
          objc_enumerationMutation(v8);
        if ((GEOPDTransitLabelIsDirty(*(os_unfair_lock_s **)(*((_QWORD *)&v71 + 1) + 8 * v14)) & 1) != 0)
          break;
        if (v12 == ++v14)
        {
          v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v71, v85, 16);
          if (v12)
            goto LABEL_16;
          goto LABEL_22;
        }
      }
LABEL_36:

LABEL_37:
      os_unfair_lock_unlock(p_readerLock);
      -[GEOPDTransitInfo readAll:]((uint64_t)self, 0);
      v65 = 0u;
      v66 = 0u;
      v63 = 0u;
      v64 = 0u;
      v26 = self->_lines;
      v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v63, v83, 16);
      if (v27)
      {
        v28 = *(_QWORD *)v64;
        do
        {
          for (i = 0; i != v27; ++i)
          {
            if (*(_QWORD *)v64 != v28)
              objc_enumerationMutation(v26);
            PBDataWriterWriteSubmessage();
          }
          v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v63, v83, 16);
        }
        while (v27);
      }

      v61 = 0u;
      v62 = 0u;
      v59 = 0u;
      v60 = 0u;
      v30 = self->_systems;
      v31 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v59, v82, 16);
      if (v31)
      {
        v32 = *(_QWORD *)v60;
        do
        {
          for (j = 0; j != v31; ++j)
          {
            if (*(_QWORD *)v60 != v32)
              objc_enumerationMutation(v30);
            PBDataWriterWriteSubmessage();
          }
          v31 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v59, v82, 16);
        }
        while (v31);
      }

      v57 = 0u;
      v58 = 0u;
      v55 = 0u;
      v56 = 0u;
      v34 = self->_labels;
      v35 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v34, "countByEnumeratingWithState:objects:count:", &v55, v81, 16);
      if (v35)
      {
        v36 = *(_QWORD *)v56;
        do
        {
          for (k = 0; k != v35; ++k)
          {
            if (*(_QWORD *)v56 != v36)
              objc_enumerationMutation(v34);
            PBDataWriterWriteSubmessage();
          }
          v35 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v34, "countByEnumeratingWithState:objects:count:", &v55, v81, 16);
        }
        while (v35);
      }

      v53 = 0u;
      v54 = 0u;
      v51 = 0u;
      v52 = 0u;
      v38 = self->_transitConnections;
      v39 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v38, "countByEnumeratingWithState:objects:count:", &v51, v80, 16);
      if (v39)
      {
        v40 = *(_QWORD *)v52;
        do
        {
          for (m = 0; m != v39; ++m)
          {
            if (*(_QWORD *)v52 != v40)
              objc_enumerationMutation(v38);
            PBDataWriterWriteSubmessage();
          }
          v39 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v38, "countByEnumeratingWithState:objects:count:", &v51, v80, 16);
        }
        while (v39);
      }

      if (self->_searchDisplayName)
        PBDataWriterWriteStringField();
      if (self->_transitMarketId)
        PBDataWriterWriteSubmessage();
      if (self->_title)
        PBDataWriterWriteStringField();
      if (self->_subTitle)
        PBDataWriterWriteStringField();
      if ((*(_WORD *)&self->_flags & 1) != 0)
        PBDataWriterWriteUint64Field();
      v49 = 0u;
      v50 = 0u;
      v47 = 0u;
      v48 = 0u;
      v42 = self->_stopInfos;
      v43 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v42, "countByEnumeratingWithState:objects:count:", &v47, v79, 16);
      if (v43)
      {
        v44 = *(_QWORD *)v48;
        do
        {
          for (n = 0; n != v43; ++n)
          {
            if (*(_QWORD *)v48 != v44)
              objc_enumerationMutation(v42);
            PBDataWriterWriteSubmessage();
          }
          v43 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v42, "countByEnumeratingWithState:objects:count:", &v47, v79, 16);
        }
        while (v43);
      }

      -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4);
      goto LABEL_83;
    }
LABEL_22:

    flags = (__int16)self->_flags;
  }
  if ((flags & 0x200) != 0)
  {
    v69 = 0u;
    v70 = 0u;
    v67 = 0u;
    v68 = 0u;
    v15 = self->_transitConnections;
    v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v67, v84, 16);
    if (v16)
    {
      v46 = *(_QWORD *)v68;
      while (2)
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v68 != v46)
            objc_enumerationMutation(v15);
          v18 = self;
          v19 = v15;
          v20 = p_readerLock;
          v21 = v6;
          v22 = *(_QWORD *)(*((_QWORD *)&v67 + 1) + 8 * v17);
          if (v22)
          {
            os_unfair_lock_lock_with_options();
            os_unfair_lock_assert_owner((const os_unfair_lock *)(v22 + 64));
            v23 = *(_BYTE *)(v22 + 68) & 0x3C;
            os_unfair_lock_unlock((os_unfair_lock_t)(v22 + 64));
            if (v23)
            {
              p_readerLock = v20;
              v8 = v19;
              self = v18;
              goto LABEL_36;
            }
          }
          ++v17;
          v6 = v21;
          p_readerLock = v20;
          v15 = v19;
          self = v18;
        }
        while (v16 != v17);
        v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v67, v84, 16);
        if (v16)
          continue;
        break;
      }
    }

  }
  v24 = *(id *)((char *)&self->super.super.isa + v6);
  objc_sync_enter(v24);
  *(_QWORD *)(*(char **)((char *)&self->super.super.isa + v6) + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  objc_msgSend(*(id *)((char *)&self->super.super.isa + v6), "seekToOffset:", self->_readerMarkPos);
  objc_msgSend(*(id *)((char *)&self->super.super.isa + v6), "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "writeData:", v25);
  os_unfair_lock_unlock(p_readerLock);

  objc_sync_exit(v24);
LABEL_83:

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
  NSMutableArray *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t k;
  void *v23;
  NSMutableArray *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t m;
  void *v28;
  uint64_t v29;
  void *v30;
  id v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  NSMutableArray *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t n;
  void *v41;
  PBUnknownFields *v42;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
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
  _BYTE v67[128];
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
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
      GEOPDTransitInfoReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_43;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDTransitInfo readAll:]((uint64_t)self, 0);
  v62 = 0u;
  v63 = 0u;
  v60 = 0u;
  v61 = 0u;
  v9 = self->_lines;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v60, v68, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v61;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v61 != v11)
          objc_enumerationMutation(v9);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v60 + 1) + 8 * i), "copyWithZone:", a3);
        -[GEOPDTransitInfo addLine:](v5, v13);

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v60, v68, 16);
    }
    while (v10);
  }

  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  v14 = self->_systems;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v56, v67, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v57;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v57 != v16)
          objc_enumerationMutation(v14);
        v18 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v56 + 1) + 8 * j), "copyWithZone:", a3);
        -[GEOPDTransitInfo addSystem:](v5, v18);

      }
      v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v56, v67, 16);
    }
    while (v15);
  }

  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  v19 = self->_labels;
  v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v52, v66, 16);
  if (v20)
  {
    v21 = *(_QWORD *)v53;
    do
    {
      for (k = 0; k != v20; ++k)
      {
        if (*(_QWORD *)v53 != v21)
          objc_enumerationMutation(v19);
        v23 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v52 + 1) + 8 * k), "copyWithZone:", a3);
        -[GEOPDTransitInfo addLabel:](v5, v23);

      }
      v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v52, v66, 16);
    }
    while (v20);
  }

  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v24 = self->_transitConnections;
  v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v48, v65, 16);
  if (v25)
  {
    v26 = *(_QWORD *)v49;
    do
    {
      for (m = 0; m != v25; ++m)
      {
        if (*(_QWORD *)v49 != v26)
          objc_enumerationMutation(v24);
        v28 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v48 + 1) + 8 * m), "copyWithZone:", a3);
        -[GEOPDTransitInfo addTransitConnection:](v5, v28);

      }
      v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v48, v65, 16);
    }
    while (v25);
  }

  v29 = -[NSString copyWithZone:](self->_searchDisplayName, "copyWithZone:", a3);
  v30 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v29;

  v31 = -[GEOPDMapsIdentifier copyWithZone:](self->_transitMarketId, "copyWithZone:", a3);
  v32 = *(void **)(v5 + 96);
  *(_QWORD *)(v5 + 96) = v31;

  v33 = -[NSString copyWithZone:](self->_title, "copyWithZone:", a3);
  v34 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v33;

  v35 = -[NSString copyWithZone:](self->_subTitle, "copyWithZone:", a3);
  v36 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v35;

  if ((*(_WORD *)&self->_flags & 1) != 0)
  {
    *(_QWORD *)(v5 + 88) = self->_transitId;
    *(_WORD *)(v5 + 116) |= 1u;
  }
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v37 = self->_stopInfos;
  v38 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v37, "countByEnumeratingWithState:objects:count:", &v44, v64, 16);
  if (v38)
  {
    v39 = *(_QWORD *)v45;
    do
    {
      for (n = 0; n != v38; ++n)
      {
        if (*(_QWORD *)v45 != v39)
          objc_enumerationMutation(v37);
        v41 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * n), "copyWithZone:", a3, (_QWORD)v44);
        -[GEOPDTransitInfo addStopInfo:](v5, v41);

      }
      v38 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v37, "countByEnumeratingWithState:objects:count:", &v44, v64, 16);
    }
    while (v38);
  }

  v42 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v42;
LABEL_43:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSMutableArray *lines;
  NSMutableArray *systems;
  NSMutableArray *labels;
  NSMutableArray *transitConnections;
  NSString *searchDisplayName;
  GEOPDMapsIdentifier *transitMarketId;
  NSString *title;
  NSString *subTitle;
  __int16 v13;
  NSMutableArray *stopInfos;
  char v15;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_25;
  -[GEOPDTransitInfo readAll:]((uint64_t)self, 1);
  -[GEOPDTransitInfo readAll:]((uint64_t)v4, 1);
  lines = self->_lines;
  if ((unint64_t)lines | *((_QWORD *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](lines, "isEqual:"))
      goto LABEL_25;
  }
  systems = self->_systems;
  if ((unint64_t)systems | *((_QWORD *)v4 + 8))
  {
    if (!-[NSMutableArray isEqual:](systems, "isEqual:"))
      goto LABEL_25;
  }
  labels = self->_labels;
  if ((unint64_t)labels | *((_QWORD *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](labels, "isEqual:"))
      goto LABEL_25;
  }
  transitConnections = self->_transitConnections;
  if ((unint64_t)transitConnections | *((_QWORD *)v4 + 10))
  {
    if (!-[NSMutableArray isEqual:](transitConnections, "isEqual:"))
      goto LABEL_25;
  }
  searchDisplayName = self->_searchDisplayName;
  if ((unint64_t)searchDisplayName | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](searchDisplayName, "isEqual:"))
      goto LABEL_25;
  }
  transitMarketId = self->_transitMarketId;
  if ((unint64_t)transitMarketId | *((_QWORD *)v4 + 12))
  {
    if (!-[GEOPDMapsIdentifier isEqual:](transitMarketId, "isEqual:"))
      goto LABEL_25;
  }
  title = self->_title;
  if ((unint64_t)title | *((_QWORD *)v4 + 9))
  {
    if (!-[NSString isEqual:](title, "isEqual:"))
      goto LABEL_25;
  }
  subTitle = self->_subTitle;
  if ((unint64_t)subTitle | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](subTitle, "isEqual:"))
      goto LABEL_25;
  }
  v13 = *((_WORD *)v4 + 58);
  if ((*(_WORD *)&self->_flags & 1) != 0)
  {
    if ((v13 & 1) == 0 || self->_transitId != *((_QWORD *)v4 + 11))
      goto LABEL_25;
  }
  else if ((v13 & 1) != 0)
  {
LABEL_25:
    v15 = 0;
    goto LABEL_26;
  }
  stopInfos = self->_stopInfos;
  if ((unint64_t)stopInfos | *((_QWORD *)v4 + 6))
    v15 = -[NSMutableArray isEqual:](stopInfos, "isEqual:");
  else
    v15 = 1;
LABEL_26:

  return v15;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSUInteger v7;
  unint64_t v8;
  NSUInteger v9;
  NSUInteger v10;
  unint64_t v11;

  -[GEOPDTransitInfo readAll:]((uint64_t)self, 1);
  v3 = -[NSMutableArray hash](self->_lines, "hash");
  v4 = -[NSMutableArray hash](self->_systems, "hash");
  v5 = -[NSMutableArray hash](self->_labels, "hash");
  v6 = -[NSMutableArray hash](self->_transitConnections, "hash");
  v7 = -[NSString hash](self->_searchDisplayName, "hash");
  v8 = -[GEOPDMapsIdentifier hash](self->_transitMarketId, "hash");
  v9 = -[NSString hash](self->_title, "hash");
  v10 = -[NSString hash](self->_subTitle, "hash");
  if ((*(_WORD *)&self->_flags & 1) != 0)
    v11 = 2654435761u * self->_transitId;
  else
    v11 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ -[NSMutableArray hash](self->_stopInfos, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitMarketId, 0);
  objc_storeStrong((id *)&self->_transitConnections, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_systems, 0);
  objc_storeStrong((id *)&self->_subTitle, 0);
  objc_storeStrong((id *)&self->_stopInfos, 0);
  objc_storeStrong((id *)&self->_searchDisplayName, 0);
  objc_storeStrong((id *)&self->_lines, 0);
  objc_storeStrong((id *)&self->_labels, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
