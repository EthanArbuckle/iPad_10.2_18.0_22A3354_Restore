@implementation GEOSnapScoreMetadata

- (GEOSnapScoreMetadata)init
{
  GEOSnapScoreMetadata *v2;
  GEOSnapScoreMetadata *v3;
  GEOSnapScoreMetadata *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOSnapScoreMetadata;
  v2 = -[GEOSnapScoreMetadata init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOSnapScoreMetadata)initWithData:(id)a3
{
  GEOSnapScoreMetadata *v3;
  GEOSnapScoreMetadata *v4;
  GEOSnapScoreMetadata *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOSnapScoreMetadata;
  v3 = -[GEOSnapScoreMetadata initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readOriginPoint
{
  void *v2;
  id v3;

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
  if ((*(_BYTE *)(a1 + 68) & 0x10) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      v3 = v2;
      objc_sync_enter(v3);
      GEOSnapScoreMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readOriginPoint_tags);
      objc_sync_exit(v3);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
}

- (void)setOriginPoint:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_BYTE *)(a1 + 68) |= 0x10u;
  *(_BYTE *)(a1 + 68) |= 0x20u;
  objc_storeStrong((id *)(a1 + 48), a2);

}

- (void)_readOriginAccessPoints
{
  void *v2;
  id v3;

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
  if ((*(_BYTE *)(a1 + 68) & 8) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      v3 = v2;
      objc_sync_enter(v3);
      GEOSnapScoreMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readOriginAccessPoints_tags);
      objc_sync_exit(v3);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
}

- (void)addOriginAccessPoint:(uint64_t)a1
{
  id v3;

  if (a1)
  {
    v3 = a2;
    -[GEOSnapScoreMetadata _readOriginAccessPoints](a1);
    -[GEOSnapScoreMetadata _addNoFlagsOriginAccessPoint:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_BYTE *)(a1 + 68) |= 8u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
    *(_BYTE *)(a1 + 68) |= 0x20u;
  }
}

- (void)_addNoFlagsOriginAccessPoint:(uint64_t)a1
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

- (void)_readDestinationPoints
{
  void *v2;
  id v3;

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
  if ((*(_BYTE *)(a1 + 68) & 4) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      v3 = v2;
      objc_sync_enter(v3);
      GEOSnapScoreMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDestinationPoints_tags);
      objc_sync_exit(v3);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
}

- (void)addDestinationPoint:(uint64_t)a1
{
  id v3;

  if (a1)
  {
    v3 = a2;
    -[GEOSnapScoreMetadata _readDestinationPoints](a1);
    -[GEOSnapScoreMetadata _addNoFlagsDestinationPoint:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_BYTE *)(a1 + 68) |= 4u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
    *(_BYTE *)(a1 + 68) |= 0x20u;
  }
}

- (void)_addNoFlagsDestinationPoint:(uint64_t)a1
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

- (void)_readDestinationAccessPoints
{
  void *v2;
  id v3;

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
  if ((*(_BYTE *)(a1 + 68) & 2) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      v3 = v2;
      objc_sync_enter(v3);
      GEOSnapScoreMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDestinationAccessPoints_tags);
      objc_sync_exit(v3);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
}

- (void)addDestinationAccessPoint:(uint64_t)a1
{
  id v3;

  if (a1)
  {
    v3 = a2;
    -[GEOSnapScoreMetadata _readDestinationAccessPoints](a1);
    -[GEOSnapScoreMetadata _addNoFlagsDestinationAccessPoint:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_BYTE *)(a1 + 68) |= 2u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
    *(_BYTE *)(a1 + 68) |= 0x20u;
  }
}

- (void)_addNoFlagsDestinationAccessPoint:(uint64_t)a1
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
  v8.super_class = (Class)GEOSnapScoreMetadata;
  -[GEOSnapScoreMetadata description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOSnapScoreMetadata dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOSnapScoreMetadata _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t k;
  void *v33;
  void *v34;
  const __CFString *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  _QWORD v43[4];
  id v44;
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
  _BYTE v57[128];
  _BYTE v58[128];
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  -[GEOSnapScoreMetadata readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOSnapScoreMetadata _readOriginPoint](a1);
  v5 = *(id *)(a1 + 48);
  v6 = v5;
  if (v5)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v5, "jsonRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = CFSTR("originPoint");
    }
    else
    {
      objc_msgSend(v5, "dictionaryRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = CFSTR("origin_point");
    }
    objc_msgSend(v4, "setObject:forKey:", v7, v8);

  }
  if (objc_msgSend(*(id *)(a1 + 40), "count"))
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    v10 = *(id *)(a1 + 40);
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v53, v59, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v54;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v54 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v15, "jsonRepresentation");
          else
            objc_msgSend(v15, "dictionaryRepresentation");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v16);

        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v53, v59, 16);
      }
      while (v12);
    }

    if (a2)
      v17 = CFSTR("originAccessPoint");
    else
      v17 = CFSTR("origin_access_point");
    objc_msgSend(v4, "setObject:forKey:", v9, v17);

  }
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v19 = *(id *)(a1 + 32);
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v50;
      do
      {
        for (j = 0; j != v21; ++j)
        {
          if (*(_QWORD *)v50 != v22)
            objc_enumerationMutation(v19);
          v24 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * j);
          if ((a2 & 1) != 0)
            objc_msgSend(v24, "jsonRepresentation");
          else
            objc_msgSend(v24, "dictionaryRepresentation");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "addObject:", v25);

        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
      }
      while (v21);
    }

    if (a2)
      v26 = CFSTR("destinationPoint");
    else
      v26 = CFSTR("destination_point");
    objc_msgSend(v4, "setObject:forKey:", v18, v26);

  }
  if (objc_msgSend(*(id *)(a1 + 24), "count"))
  {
    v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v28 = *(id *)(a1 + 24);
    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v45, v57, 16);
    if (v29)
    {
      v30 = v29;
      v31 = *(_QWORD *)v46;
      do
      {
        for (k = 0; k != v30; ++k)
        {
          if (*(_QWORD *)v46 != v31)
            objc_enumerationMutation(v28);
          v33 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * k);
          if ((a2 & 1) != 0)
            objc_msgSend(v33, "jsonRepresentation");
          else
            objc_msgSend(v33, "dictionaryRepresentation");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "addObject:", v34);

        }
        v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v45, v57, 16);
      }
      while (v30);
    }

    if (a2)
      v35 = CFSTR("destinationAccessPoint");
    else
      v35 = CFSTR("destination_access_point");
    objc_msgSend(v4, "setObject:forKey:", v27, v35);

  }
  v36 = *(void **)(a1 + 16);
  if (v36)
  {
    objc_msgSend(v36, "dictionaryRepresentation");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v37;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v37, "count"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v43[0] = MEMORY[0x1E0C809B0];
      v43[1] = 3221225472;
      v43[2] = __50__GEOSnapScoreMetadata__dictionaryRepresentation___block_invoke;
      v43[3] = &unk_1E1C00600;
      v40 = v39;
      v44 = v40;
      objc_msgSend(v38, "enumerateKeysAndObjectsUsingBlock:", v43);
      v41 = v40;

      v38 = v41;
    }
    objc_msgSend(v4, "setObject:forKey:", v38, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOSnapScoreMetadata _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  void *v4;
  id v5;
  int *v6;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      v5 = v4;
      objc_sync_enter(v5);
      if (a2)
        v6 = (int *)&readAll__recursiveTag_5672;
      else
        v6 = (int *)&readAll__nonRecursiveTag_5673;
      GEOSnapScoreMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
      _GEOSnapScoreMetadataCallReadAllRecursiveWithoutSynchronized((id *)a1);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

void __50__GEOSnapScoreMetadata__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  GEOSnapScorePoint *v8;
  GEOSnapScorePoint *v9;
  GEOSnapScorePoint *v10;
  const __CFString *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  GEOSnapScorePoint *v19;
  GEOSnapScorePoint *v20;
  GEOSnapScorePoint *v21;
  const __CFString *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  uint64_t v29;
  GEOSnapScorePoint *v30;
  GEOSnapScorePoint *v31;
  GEOSnapScorePoint *v32;
  const __CFString *v33;
  void *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t k;
  uint64_t v40;
  GEOSnapScorePoint *v41;
  GEOSnapScorePoint *v42;
  GEOSnapScorePoint *v43;
  id v45;
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
  _BYTE v58[128];
  _BYTE v59[128];
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("originPoint");
      else
        v6 = CFSTR("origin_point");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = [GEOSnapScorePoint alloc];
        if ((a3 & 1) != 0)
          v9 = -[GEOSnapScorePoint initWithJSON:](v8, "initWithJSON:", v7);
        else
          v9 = -[GEOSnapScorePoint initWithDictionary:](v8, "initWithDictionary:", v7);
        v10 = v9;
        -[GEOSnapScoreMetadata setOriginPoint:]((uint64_t)a1, v9);

      }
      if (a3)
        v11 = CFSTR("originAccessPoint");
      else
        v11 = CFSTR("origin_access_point");
      objc_msgSend(v5, "objectForKeyedSubscript:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v45 = v5;
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v56 = 0u;
        v57 = 0u;
        v54 = 0u;
        v55 = 0u;
        v13 = v12;
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v54, v60, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v55;
          do
          {
            for (i = 0; i != v15; ++i)
            {
              if (*(_QWORD *)v55 != v16)
                objc_enumerationMutation(v13);
              v18 = *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v19 = [GEOSnapScorePoint alloc];
                if ((a3 & 1) != 0)
                  v20 = -[GEOSnapScorePoint initWithJSON:](v19, "initWithJSON:", v18);
                else
                  v20 = -[GEOSnapScorePoint initWithDictionary:](v19, "initWithDictionary:", v18);
                v21 = v20;
                -[GEOSnapScoreMetadata addOriginAccessPoint:]((uint64_t)a1, v20);

              }
            }
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v54, v60, 16);
          }
          while (v15);
        }

        v5 = v45;
      }

      if (a3)
        v22 = CFSTR("destinationPoint");
      else
        v22 = CFSTR("destination_point");
      objc_msgSend(v5, "objectForKeyedSubscript:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v52 = 0u;
        v53 = 0u;
        v50 = 0u;
        v51 = 0u;
        v24 = v23;
        v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
        if (v25)
        {
          v26 = v25;
          v27 = *(_QWORD *)v51;
          do
          {
            for (j = 0; j != v26; ++j)
            {
              if (*(_QWORD *)v51 != v27)
                objc_enumerationMutation(v24);
              v29 = *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * j);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v30 = [GEOSnapScorePoint alloc];
                if ((a3 & 1) != 0)
                  v31 = -[GEOSnapScorePoint initWithJSON:](v30, "initWithJSON:", v29);
                else
                  v31 = -[GEOSnapScorePoint initWithDictionary:](v30, "initWithDictionary:", v29);
                v32 = v31;
                -[GEOSnapScoreMetadata addDestinationPoint:]((uint64_t)a1, v31);

              }
            }
            v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
          }
          while (v26);
        }

        v5 = v45;
      }

      if (a3)
        v33 = CFSTR("destinationAccessPoint");
      else
        v33 = CFSTR("destination_access_point");
      objc_msgSend(v5, "objectForKeyedSubscript:", v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v48 = 0u;
        v49 = 0u;
        v46 = 0u;
        v47 = 0u;
        v35 = v34;
        v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v46, v58, 16);
        if (v36)
        {
          v37 = v36;
          v38 = *(_QWORD *)v47;
          do
          {
            for (k = 0; k != v37; ++k)
            {
              if (*(_QWORD *)v47 != v38)
                objc_enumerationMutation(v35);
              v40 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * k);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v41 = [GEOSnapScorePoint alloc];
                if ((a3 & 1) != 0)
                  v42 = -[GEOSnapScorePoint initWithJSON:](v41, "initWithJSON:", v40);
                else
                  v42 = -[GEOSnapScorePoint initWithDictionary:](v41, "initWithDictionary:", v40);
                v43 = v42;
                -[GEOSnapScoreMetadata addDestinationAccessPoint:]((uint64_t)a1, v42);

              }
            }
            v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v46, v58, 16);
          }
          while (v37);
        }

        v5 = v45;
      }

    }
  }

  return a1;
}

- (BOOL)readFrom:(id)a3
{
  return GEOSnapScoreMetadataReadAllFrom((uint64_t)self, a3, 0);
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
  if (self->_reader && (_GEOSnapScoreMetadataIsDirty((uint64_t)self) & 1) == 0)
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
    -[GEOSnapScoreMetadata readAll:]((uint64_t)self, 0);
    if (self->_originPoint)
      PBDataWriterWriteSubmessage();
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v6 = self->_originAccessPoints;
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
    v10 = self->_destinationPoints;
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
    v14 = self->_destinationAccessPoints;
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
          PBDataWriterWriteSubmessage();
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

- (uint64_t)hasGreenTeaWithValue:(uint64_t)result
{
  id *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v3 = (id *)result;
    -[GEOSnapScoreMetadata _readDestinationAccessPoints](result);
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v4 = v3[3];
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v26;
LABEL_4:
      v8 = 0;
      while (1)
      {
        if (*(_QWORD *)v26 != v7)
          objc_enumerationMutation(v4);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v8), "hasGreenTeaWithValue:", a2) & 1) != 0)
          break;
        if (v6 == ++v8)
        {
          v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
          if (v6)
            goto LABEL_4;
          goto LABEL_10;
        }
      }
    }
    else
    {
LABEL_10:

      -[GEOSnapScoreMetadata _readDestinationPoints]((uint64_t)v3);
      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      v4 = v3[4];
      v9 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v30, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v22;
LABEL_12:
        v12 = 0;
        while (1)
        {
          if (*(_QWORD *)v22 != v11)
            objc_enumerationMutation(v4);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v12), "hasGreenTeaWithValue:", a2) & 1) != 0)
            break;
          if (v10 == ++v12)
          {
            v10 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v30, 16);
            if (v10)
              goto LABEL_12;
            goto LABEL_18;
          }
        }
      }
      else
      {
LABEL_18:

        -[GEOSnapScoreMetadata _readOriginAccessPoints]((uint64_t)v3);
        v19 = 0u;
        v20 = 0u;
        v17 = 0u;
        v18 = 0u;
        v4 = v3[5];
        v13 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v29, 16);
        if (!v13)
        {
LABEL_26:

          -[GEOSnapScoreMetadata _readOriginPoint]((uint64_t)v3);
          return objc_msgSend(v3[6], "hasGreenTeaWithValue:", a2);
        }
        v14 = v13;
        v15 = *(_QWORD *)v18;
LABEL_20:
        v16 = 0;
        while (1)
        {
          if (*(_QWORD *)v18 != v15)
            objc_enumerationMutation(v4);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v16), "hasGreenTeaWithValue:", a2, (_QWORD)v17) & 1) != 0)
            break;
          if (v14 == ++v16)
          {
            v14 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v29, 16);
            if (v14)
              goto LABEL_20;
            goto LABEL_26;
          }
        }
      }
    }

    return 1;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  void *v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  NSMutableArray *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
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
  _BYTE v38[128];
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_BYTE *)&self->_flags & 0x20) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOSnapScoreMetadataReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOSnapScoreMetadata readAll:]((uint64_t)self, 0);
  v8 = -[GEOSnapScorePoint copyWithZone:](self->_originPoint, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v8;

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v10 = self->_originAccessPoints;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v35;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v35 != v12)
          objc_enumerationMutation(v10);
        v14 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * v13), "copyWithZone:", a3);
        -[GEOSnapScoreMetadata addOriginAccessPoint:](v5, v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
    }
    while (v11);
  }

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v15 = self->_destinationPoints;
  v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v31;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v31 != v17)
          objc_enumerationMutation(v15);
        v19 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * v18), "copyWithZone:", a3);
        -[GEOSnapScoreMetadata addDestinationPoint:](v5, v19);

        ++v18;
      }
      while (v16 != v18);
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
    }
    while (v16);
  }

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v20 = self->_destinationAccessPoints;
  v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
  if (v21)
  {
    v22 = *(_QWORD *)v27;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v27 != v22)
          objc_enumerationMutation(v20);
        v24 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * v23), "copyWithZone:", a3, (_QWORD)v26);
        -[GEOSnapScoreMetadata addDestinationAccessPoint:](v5, v24);

        ++v23;
      }
      while (v21 != v23);
      v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
    }
    while (v21);
  }

  objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  GEOSnapScorePoint *originPoint;
  NSMutableArray *originAccessPoints;
  NSMutableArray *destinationPoints;
  NSMutableArray *destinationAccessPoints;
  char v9;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((-[GEOSnapScoreMetadata readAll:]((uint64_t)self, 1),
         -[GEOSnapScoreMetadata readAll:]((uint64_t)v4, 1),
         originPoint = self->_originPoint,
         !((unint64_t)originPoint | v4[6]))
     || -[GEOSnapScorePoint isEqual:](originPoint, "isEqual:"))
    && ((originAccessPoints = self->_originAccessPoints, !((unint64_t)originAccessPoints | v4[5]))
     || -[NSMutableArray isEqual:](originAccessPoints, "isEqual:"))
    && ((destinationPoints = self->_destinationPoints, !((unint64_t)destinationPoints | v4[4]))
     || -[NSMutableArray isEqual:](destinationPoints, "isEqual:")))
  {
    destinationAccessPoints = self->_destinationAccessPoints;
    if ((unint64_t)destinationAccessPoints | v4[3])
      v9 = -[NSMutableArray isEqual:](destinationAccessPoints, "isEqual:");
    else
      v9 = 1;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;

  -[GEOSnapScoreMetadata readAll:]((uint64_t)self, 1);
  v3 = -[GEOSnapScorePoint hash](self->_originPoint, "hash");
  v4 = -[NSMutableArray hash](self->_originAccessPoints, "hash") ^ v3;
  v5 = -[NSMutableArray hash](self->_destinationPoints, "hash");
  return v4 ^ v5 ^ -[NSMutableArray hash](self->_destinationAccessPoints, "hash");
}

- (void)mergeFrom:(uint64_t)a1
{
  id *v3;
  id *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t k;
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
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (a1)
  {
    -[GEOSnapScoreMetadata readAll:]((uint64_t)v3, 0);
    v5 = *(void **)(a1 + 48);
    v6 = v4[6];
    if (v5)
    {
      if (v6)
        objc_msgSend(v5, "mergeFrom:");
    }
    else if (v6)
    {
      -[GEOSnapScoreMetadata setOriginPoint:](a1, v4[6]);
    }
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v7 = v4[5];
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v31 != v10)
            objc_enumerationMutation(v7);
          -[GEOSnapScoreMetadata addOriginAccessPoint:](a1, *(void **)(*((_QWORD *)&v30 + 1) + 8 * i));
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
      }
      while (v9);
    }

    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v12 = v4[4];
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v27;
      do
      {
        for (j = 0; j != v14; ++j)
        {
          if (*(_QWORD *)v27 != v15)
            objc_enumerationMutation(v12);
          -[GEOSnapScoreMetadata addDestinationPoint:](a1, *(void **)(*((_QWORD *)&v26 + 1) + 8 * j));
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
      }
      while (v14);
    }

    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v17 = v4[3];
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v22, v34, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v23;
      do
      {
        for (k = 0; k != v19; ++k)
        {
          if (*(_QWORD *)v23 != v20)
            objc_enumerationMutation(v17);
          -[GEOSnapScoreMetadata addDestinationAccessPoint:](a1, *(void **)(*((_QWORD *)&v22 + 1) + 8 * k));
        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v22, v34, 16);
      }
      while (v19);
    }

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
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
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
  if (a1)
  {
    os_unfair_lock_lock_with_options();
    *(_BYTE *)(a1 + 68) |= 1u;
    *(_BYTE *)(a1 + 68) |= 0x20u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
    v4 = *(void **)(a1 + 16);
    *(_QWORD *)(a1 + 16) = 0;

    if (a2)
    {
      -[GEOSnapScoreMetadata readAll:](a1, 0);
      objc_msgSend(*(id *)(a1 + 48), "clearUnknownFields:", 1);
      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      v5 = *(id *)(a1 + 40);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v29;
        do
        {
          v9 = 0;
          do
          {
            if (*(_QWORD *)v29 != v8)
              objc_enumerationMutation(v5);
            objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * v9++), "clearUnknownFields:", 1);
          }
          while (v7 != v9);
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
        }
        while (v7);
      }

      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      v10 = *(id *)(a1 + 32);
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v25;
        do
        {
          v14 = 0;
          do
          {
            if (*(_QWORD *)v25 != v13)
              objc_enumerationMutation(v10);
            objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v14++), "clearUnknownFields:", 1);
          }
          while (v12 != v14);
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
        }
        while (v12);
      }

      v22 = 0u;
      v23 = 0u;
      v20 = 0u;
      v21 = 0u;
      v15 = *(id *)(a1 + 24);
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v21;
        do
        {
          v19 = 0;
          do
          {
            if (*(_QWORD *)v21 != v18)
              objc_enumerationMutation(v15);
            objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v19++), "clearUnknownFields:", 1, (_QWORD)v20);
          }
          while (v17 != v19);
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
        }
        while (v17);
      }

    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originPoint, 0);
  objc_storeStrong((id *)&self->_originAccessPoints, 0);
  objc_storeStrong((id *)&self->_destinationPoints, 0);
  objc_storeStrong((id *)&self->_destinationAccessPoints, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
