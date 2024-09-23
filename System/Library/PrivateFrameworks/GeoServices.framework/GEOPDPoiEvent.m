@implementation GEOPDPoiEvent

- (uint64_t)hasGreenTeaWithValue:(uint64_t)a1
{
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  -[GEOPDPoiEvent _readEventId](a1);
  if ((objc_msgSend(*(id *)(a1 + 40), "hasGreenTeaWithValue:", a2) & 1) != 0)
    return 1;
  -[GEOPDPoiEvent _readPoiIds](a1);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = *(id *)(a1 + 64);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v9), "hasGreenTeaWithValue:", a2, (_QWORD)v11) & 1) != 0)
        {
          v4 = 1;
          goto LABEL_14;
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v7)
        continue;
      break;
    }
  }
  v4 = 0;
LABEL_14:

  return v4;
}

- (GEOPDPoiEvent)init
{
  GEOPDPoiEvent *v2;
  GEOPDPoiEvent *v3;
  GEOPDPoiEvent *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDPoiEvent;
  v2 = -[GEOPDPoiEvent init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDPoiEvent)initWithData:(id)a3
{
  GEOPDPoiEvent *v3;
  GEOPDPoiEvent *v4;
  GEOPDPoiEvent *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDPoiEvent;
  v3 = -[GEOPDPoiEvent initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readEventId
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 96) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPoiEventReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readEventId_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (id)eventId
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDPoiEvent _readEventId]((uint64_t)a1);
    a1 = (id *)v1[5];
  }
  return a1;
}

- (void)_readName
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 96) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPoiEventReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readName_tags_5866);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (id)name
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDPoiEvent _readName]((uint64_t)a1);
    a1 = (id *)v1[6];
  }
  return a1;
}

- (void)_readEventCategorys
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 96) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPoiEventReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readEventCategorys_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (id)eventCategorys
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDPoiEvent _readEventCategorys]((uint64_t)a1);
    a1 = (id *)v1[3];
  }
  return a1;
}

- (void)addEventCategory:(uint64_t)a1
{
  id v3;

  if (a1)
  {
    v3 = a2;
    -[GEOPDPoiEvent _readEventCategorys](a1);
    -[GEOPDPoiEvent _addNoFlagsEventCategory:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 96) |= 4u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
    *(_WORD *)(a1 + 96) |= 0x200u;
  }
}

- (void)_addNoFlagsEventCategory:(uint64_t)a1
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

- (void)_readPoiIds
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 96) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPoiEventReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPoiIds_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (id)poiIds
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDPoiEvent _readPoiIds]((uint64_t)a1);
    a1 = (id *)v1[8];
  }
  return a1;
}

- (void)addPoiId:(uint64_t)a1
{
  id v3;

  if (a1)
  {
    v3 = a2;
    -[GEOPDPoiEvent _readPoiIds](a1);
    -[GEOPDPoiEvent _addNoFlagsPoiId:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 96) |= 0x80u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
    *(_WORD *)(a1 + 96) |= 0x200u;
  }
}

- (void)_addNoFlagsPoiId:(uint64_t)a1
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

- (void)_readEventDateTimes
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 96) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPoiEventReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readEventDateTimes_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (id)eventDateTimes
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDPoiEvent _readEventDateTimes]((uint64_t)a1);
    a1 = (id *)v1[4];
  }
  return a1;
}

- (void)addEventDateTime:(uint64_t)a1
{
  id v3;

  if (a1)
  {
    v3 = a2;
    -[GEOPDPoiEvent _readEventDateTimes](a1);
    -[GEOPDPoiEvent _addNoFlagsEventDateTime:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 96) |= 8u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
    *(_WORD *)(a1 + 96) |= 0x200u;
  }
}

- (void)_addNoFlagsEventDateTime:(uint64_t)a1
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
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 96) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPoiEventReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTimezone_tags_5869);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (id)timezone
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDPoiEvent _readTimezone]((uint64_t)a1);
    a1 = (id *)v1[9];
  }
  return a1;
}

- (void)_readPerformers
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 96) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPoiEventReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPerformers_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (id)performers
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDPoiEvent _readPerformers]((uint64_t)a1);
    a1 = (id *)v1[7];
  }
  return a1;
}

- (void)addPerformer:(uint64_t)a1
{
  id v3;

  if (a1)
  {
    v3 = a2;
    -[GEOPDPoiEvent _readPerformers](a1);
    -[GEOPDPoiEvent _addNoFlagsPerformer:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 96) |= 0x40u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
    *(_WORD *)(a1 + 96) |= 0x200u;
  }
}

- (void)_addNoFlagsPerformer:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 56);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 56);
      *(_QWORD *)(a1 + 56) = v5;

      v4 = *(void **)(a1 + 56);
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
  v8.super_class = (Class)GEOPDPoiEvent;
  -[GEOPDPoiEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDPoiEvent dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDPoiEvent _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  void *v28;
  const __CFString *v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t k;
  void *v36;
  void *v37;
  const __CFString *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t m;
  void *v48;
  void *v49;
  void *v50;
  const __CFString *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  id v57;
  _QWORD v59[4];
  id v60;
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
  _BYTE v77[128];
  _BYTE v78[128];
  _BYTE v79[128];
  _BYTE v80[128];
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  -[GEOPDPoiEvent readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDPoiEvent eventId]((id *)a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v5, "jsonRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = CFSTR("eventId");
    }
    else
    {
      objc_msgSend(v5, "dictionaryRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = CFSTR("event_id");
    }
    objc_msgSend(v4, "setObject:forKey:", v7, v8);

  }
  -[GEOPDPoiEvent name]((id *)a1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v9, "jsonRepresentation");
    else
      objc_msgSend(v9, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("name"));

  }
  if (objc_msgSend(*(id *)(a1 + 24), "count"))
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
    v73 = 0u;
    v74 = 0u;
    v75 = 0u;
    v76 = 0u;
    v13 = *(id *)(a1 + 24);
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v73, v80, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v74;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v74 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v18, "jsonRepresentation");
          else
            objc_msgSend(v18, "dictionaryRepresentation");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addObject:", v19);

        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v73, v80, 16);
      }
      while (v15);
    }

    if (a2)
      v20 = CFSTR("eventCategory");
    else
      v20 = CFSTR("event_category");
    objc_msgSend(v4, "setObject:forKey:", v12, v20);

  }
  if (objc_msgSend(*(id *)(a1 + 64), "count"))
  {
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 64), "count"));
    v69 = 0u;
    v70 = 0u;
    v71 = 0u;
    v72 = 0u;
    v22 = *(id *)(a1 + 64);
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v69, v79, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v70;
      do
      {
        for (j = 0; j != v24; ++j)
        {
          if (*(_QWORD *)v70 != v25)
            objc_enumerationMutation(v22);
          v27 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * j);
          if ((a2 & 1) != 0)
            objc_msgSend(v27, "jsonRepresentation");
          else
            objc_msgSend(v27, "dictionaryRepresentation");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "addObject:", v28);

        }
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v69, v79, 16);
      }
      while (v24);
    }

    if (a2)
      v29 = CFSTR("poiId");
    else
      v29 = CFSTR("poi_id");
    objc_msgSend(v4, "setObject:forKey:", v21, v29);

  }
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
    v65 = 0u;
    v66 = 0u;
    v67 = 0u;
    v68 = 0u;
    v31 = *(id *)(a1 + 32);
    v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v65, v78, 16);
    if (v32)
    {
      v33 = v32;
      v34 = *(_QWORD *)v66;
      do
      {
        for (k = 0; k != v33; ++k)
        {
          if (*(_QWORD *)v66 != v34)
            objc_enumerationMutation(v31);
          v36 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * k);
          if ((a2 & 1) != 0)
            objc_msgSend(v36, "jsonRepresentation");
          else
            objc_msgSend(v36, "dictionaryRepresentation");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "addObject:", v37);

        }
        v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v65, v78, 16);
      }
      while (v33);
    }

    if (a2)
      v38 = CFSTR("eventDateTime");
    else
      v38 = CFSTR("event_date_time");
    objc_msgSend(v4, "setObject:forKey:", v30, v38);

  }
  -[GEOPDPoiEvent timezone]((id *)a1);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v39;
  if (v39)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v39, "jsonRepresentation");
    else
      objc_msgSend(v39, "dictionaryRepresentation");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v41, CFSTR("timezone"));

  }
  if (objc_msgSend(*(id *)(a1 + 56), "count"))
  {
    v42 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 56), "count"));
    v61 = 0u;
    v62 = 0u;
    v63 = 0u;
    v64 = 0u;
    v43 = *(id *)(a1 + 56);
    v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v61, v77, 16);
    if (v44)
    {
      v45 = v44;
      v46 = *(_QWORD *)v62;
      do
      {
        for (m = 0; m != v45; ++m)
        {
          if (*(_QWORD *)v62 != v46)
            objc_enumerationMutation(v43);
          v48 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * m);
          if ((a2 & 1) != 0)
            objc_msgSend(v48, "jsonRepresentation");
          else
            objc_msgSend(v48, "dictionaryRepresentation");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "addObject:", v49);

        }
        v45 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v61, v77, 16);
      }
      while (v45);
    }

    objc_msgSend(v4, "setObject:forKey:", v42, CFSTR("performer"));
  }
  if ((*(_WORD *)(a1 + 96) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 92));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v51 = CFSTR("expectedAttendance");
    else
      v51 = CFSTR("expected_attendance");
    objc_msgSend(v4, "setObject:forKey:", v50, v51);

  }
  v52 = *(void **)(a1 + 16);
  if (v52)
  {
    objc_msgSend(v52, "dictionaryRepresentation");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = v53;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v53, "count"));
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v59[0] = MEMORY[0x1E0C809B0];
      v59[1] = 3221225472;
      v59[2] = __43__GEOPDPoiEvent__dictionaryRepresentation___block_invoke;
      v59[3] = &unk_1E1C00600;
      v56 = v55;
      v60 = v56;
      objc_msgSend(v54, "enumerateKeysAndObjectsUsingBlock:", v59);
      v57 = v56;

      v54 = v57;
    }
    objc_msgSend(v4, "setObject:forKey:", v54, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDPoiEvent _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  void *v4;
  id v5;
  int *v6;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      v5 = v4;
      objc_sync_enter(v5);
      if (a2)
        v6 = (int *)&readAll__recursiveTag_5893;
      else
        v6 = (int *)&readAll__nonRecursiveTag_5894;
      GEOPDPoiEventReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
      _GEOPDPoiEventCallReadAllRecursiveWithoutSynchronized((id *)a1);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

void __43__GEOPDPoiEvent__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  return GEOPDPoiEventReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  __int16 flags;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t k;
  NSMutableArray *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t m;
  uint64_t n;
  os_unfair_lock_s *v24;
  char IsDirty;
  PBDataReader *v26;
  void *v27;
  NSMutableArray *obj;
  uint64_t v29;
  uint64_t v30;
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
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  _BYTE v52[128];
  _BYTE v53[128];
  _BYTE v54[128];
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (!self->_reader)
    goto LABEL_7;
  os_unfair_lock_assert_owner(&self->_readerLock);
  flags = (__int16)self->_flags;
  if ((flags & 0x210) != 0)
    goto LABEL_7;
  if ((flags & 0x20) != 0)
  {
    if (GEOLocalizedStringIsDirty((uint64_t)self->_name))
    {
LABEL_7:
      os_unfair_lock_unlock(&self->_readerLock);
      -[GEOPDPoiEvent readAll:]((uint64_t)self, 0);
      if (self->_eventId)
        PBDataWriterWriteSubmessage();
      if (self->_name)
        PBDataWriterWriteSubmessage();
      v45 = 0u;
      v46 = 0u;
      v43 = 0u;
      v44 = 0u;
      v7 = self->_eventCategorys;
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v43, v54, 16);
      if (v8)
      {
        v9 = *(_QWORD *)v44;
        do
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v44 != v9)
              objc_enumerationMutation(v7);
            PBDataWriterWriteSubmessage();
          }
          v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v43, v54, 16);
        }
        while (v8);
      }

      v41 = 0u;
      v42 = 0u;
      v39 = 0u;
      v40 = 0u;
      v11 = self->_poiIds;
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v39, v53, 16);
      if (v12)
      {
        v13 = *(_QWORD *)v40;
        do
        {
          for (j = 0; j != v12; ++j)
          {
            if (*(_QWORD *)v40 != v13)
              objc_enumerationMutation(v11);
            PBDataWriterWriteSubmessage();
          }
          v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v39, v53, 16);
        }
        while (v12);
      }

      v37 = 0u;
      v38 = 0u;
      v35 = 0u;
      v36 = 0u;
      v15 = self->_eventDateTimes;
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v35, v52, 16);
      if (v16)
      {
        v17 = *(_QWORD *)v36;
        do
        {
          for (k = 0; k != v16; ++k)
          {
            if (*(_QWORD *)v36 != v17)
              objc_enumerationMutation(v15);
            PBDataWriterWriteSubmessage();
          }
          v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v35, v52, 16);
        }
        while (v16);
      }

      if (self->_timezone)
        PBDataWriterWriteSubmessage();
      v33 = 0u;
      v34 = 0u;
      v31 = 0u;
      v32 = 0u;
      v19 = self->_performers;
      v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v31, v51, 16);
      if (v20)
      {
        v21 = *(_QWORD *)v32;
        do
        {
          for (m = 0; m != v20; ++m)
          {
            if (*(_QWORD *)v32 != v21)
              objc_enumerationMutation(v19);
            PBDataWriterWriteSubmessage();
          }
          v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v31, v51, 16);
        }
        while (v20);
      }

      if ((*(_WORD *)&self->_flags & 1) != 0)
        PBDataWriterWriteInt32Field();
      -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4);
      goto LABEL_44;
    }
    flags = (__int16)self->_flags;
  }
  if ((flags & 0x1CC) != 0)
    goto LABEL_7;
  if ((flags & 0x40) != 0)
  {
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    obj = self->_performers;
    v30 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
    if (v30)
    {
      v29 = *(_QWORD *)v48;
      while (2)
      {
        for (n = 0; n != v30; ++n)
        {
          if (*(_QWORD *)v48 != v29)
            objc_enumerationMutation(obj);
          v24 = *(os_unfair_lock_s **)(*((_QWORD *)&v47 + 1) + 8 * n);
          if (v24)
          {
            os_unfair_lock_lock_with_options();
            IsDirty = _GEOPDPerformerIsDirty((uint64_t)v24);
            os_unfair_lock_unlock(v24 + 16);
            if ((IsDirty & 1) != 0)
            {

              goto LABEL_7;
            }
          }
        }
        v30 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
        if (v30)
          continue;
        break;
      }
    }

  }
  v26 = self->_reader;
  objc_sync_enter(v26);
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "writeData:", v27);
  os_unfair_lock_unlock(p_readerLock);

  objc_sync_exit(v26);
LABEL_44:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  NSMutableArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  NSMutableArray *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  NSMutableArray *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t k;
  void *v27;
  id v28;
  void *v29;
  NSMutableArray *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t m;
  void *v34;
  PBUnknownFields *v35;
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
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  _BYTE v54[128];
  _BYTE v55[128];
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x200) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOPDPoiEventReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_36;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDPoiEvent readAll:]((uint64_t)self, 0);
  v9 = -[GEOPDMapsIdentifier copyWithZone:](self->_eventId, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v9;

  v11 = -[GEOLocalizedString copyWithZone:](self->_name, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v11;

  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v13 = self->_eventCategorys;
  v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v49, v56, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v50;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v50 != v15)
          objc_enumerationMutation(v13);
        v17 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v49 + 1) + 8 * i), "copyWithZone:", a3);
        -[GEOPDPoiEvent addEventCategory:](v5, v17);

      }
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v49, v56, 16);
    }
    while (v14);
  }

  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v18 = self->_poiIds;
  v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v45, v55, 16);
  if (v19)
  {
    v20 = *(_QWORD *)v46;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v46 != v20)
          objc_enumerationMutation(v18);
        v22 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * j), "copyWithZone:", a3);
        -[GEOPDPoiEvent addPoiId:](v5, v22);

      }
      v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v45, v55, 16);
    }
    while (v19);
  }

  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v23 = self->_eventDateTimes;
  v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v41, v54, 16);
  if (v24)
  {
    v25 = *(_QWORD *)v42;
    do
    {
      for (k = 0; k != v24; ++k)
      {
        if (*(_QWORD *)v42 != v25)
          objc_enumerationMutation(v23);
        v27 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * k), "copyWithZone:", a3);
        -[GEOPDPoiEvent addEventDateTime:](v5, v27);

      }
      v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v41, v54, 16);
    }
    while (v24);
  }

  v28 = -[GEOTimezone copyWithZone:](self->_timezone, "copyWithZone:", a3);
  v29 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v28;

  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v30 = self->_performers;
  v31 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v37, v53, 16);
  if (v31)
  {
    v32 = *(_QWORD *)v38;
    do
    {
      for (m = 0; m != v31; ++m)
      {
        if (*(_QWORD *)v38 != v32)
          objc_enumerationMutation(v30);
        v34 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * m), "copyWithZone:", a3, (_QWORD)v37);
        -[GEOPDPoiEvent addPerformer:](v5, v34);

      }
      v31 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v37, v53, 16);
    }
    while (v31);
  }

  if ((*(_WORD *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 92) = self->_expectedAttendance;
    *(_WORD *)(v5 + 96) |= 1u;
  }
  v35 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v35;
LABEL_36:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  GEOPDMapsIdentifier *eventId;
  GEOLocalizedString *name;
  NSMutableArray *eventCategorys;
  NSMutableArray *poiIds;
  NSMutableArray *eventDateTimes;
  GEOTimezone *timezone;
  NSMutableArray *performers;
  __int16 v12;
  BOOL v13;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_20;
  -[GEOPDPoiEvent readAll:]((uint64_t)self, 1);
  -[GEOPDPoiEvent readAll:]((uint64_t)v4, 1);
  eventId = self->_eventId;
  if ((unint64_t)eventId | *((_QWORD *)v4 + 5))
  {
    if (!-[GEOPDMapsIdentifier isEqual:](eventId, "isEqual:"))
      goto LABEL_20;
  }
  name = self->_name;
  if ((unint64_t)name | *((_QWORD *)v4 + 6))
  {
    if (!-[GEOLocalizedString isEqual:](name, "isEqual:"))
      goto LABEL_20;
  }
  eventCategorys = self->_eventCategorys;
  if ((unint64_t)eventCategorys | *((_QWORD *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](eventCategorys, "isEqual:"))
      goto LABEL_20;
  }
  poiIds = self->_poiIds;
  if ((unint64_t)poiIds | *((_QWORD *)v4 + 8))
  {
    if (!-[NSMutableArray isEqual:](poiIds, "isEqual:"))
      goto LABEL_20;
  }
  eventDateTimes = self->_eventDateTimes;
  if ((unint64_t)eventDateTimes | *((_QWORD *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](eventDateTimes, "isEqual:"))
      goto LABEL_20;
  }
  timezone = self->_timezone;
  if ((unint64_t)timezone | *((_QWORD *)v4 + 9))
  {
    if (!-[GEOTimezone isEqual:](timezone, "isEqual:"))
      goto LABEL_20;
  }
  performers = self->_performers;
  if ((unint64_t)performers | *((_QWORD *)v4 + 7))
  {
    if (!-[NSMutableArray isEqual:](performers, "isEqual:"))
      goto LABEL_20;
  }
  v12 = *((_WORD *)v4 + 48);
  v13 = (v12 & 1) == 0;
  if ((*(_WORD *)&self->_flags & 1) != 0)
  {
    if ((v12 & 1) != 0 && self->_expectedAttendance == *((_DWORD *)v4 + 23))
    {
      v13 = 1;
      goto LABEL_21;
    }
LABEL_20:
    v13 = 0;
  }
LABEL_21:

  return v13;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;

  -[GEOPDPoiEvent readAll:]((uint64_t)self, 1);
  v3 = -[GEOPDMapsIdentifier hash](self->_eventId, "hash");
  v4 = -[GEOLocalizedString hash](self->_name, "hash");
  v5 = -[NSMutableArray hash](self->_eventCategorys, "hash");
  v6 = -[NSMutableArray hash](self->_poiIds, "hash");
  v7 = -[NSMutableArray hash](self->_eventDateTimes, "hash");
  v8 = -[GEOTimezone hash](self->_timezone, "hash");
  v9 = -[NSMutableArray hash](self->_performers, "hash");
  if ((*(_WORD *)&self->_flags & 1) != 0)
    v10 = 2654435761 * self->_expectedAttendance;
  else
    v10 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timezone, 0);
  objc_storeStrong((id *)&self->_poiIds, 0);
  objc_storeStrong((id *)&self->_performers, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_eventId, 0);
  objc_storeStrong((id *)&self->_eventDateTimes, 0);
  objc_storeStrong((id *)&self->_eventCategorys, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
