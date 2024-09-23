@implementation GEOPDSPunchInHints

- (GEOPDSPunchInHints)init
{
  GEOPDSPunchInHints *v2;
  GEOPDSPunchInHints *v3;
  GEOPDSPunchInHints *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDSPunchInHints;
  v2 = -[GEOPDSPunchInHints init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDSPunchInHints)initWithData:(id)a3
{
  GEOPDSPunchInHints *v3;
  GEOPDSPunchInHints *v4;
  GEOPDSPunchInHints *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDSPunchInHints;
  v3 = -[GEOPDSPunchInHints initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)setAppId:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_BYTE *)(a1 + 68) |= 2u;
    *(_BYTE *)(a1 + 68) |= 0x20u;
    objc_storeStrong((id *)(a1 + 24), a2);
  }

}

- (void)_readQueryHints
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 68) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDSPunchInHintsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readQueryHints_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)queryHints
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDSPunchInHints _readQueryHints]((uint64_t)a1);
    a1 = (id *)v1[4];
  }
  return a1;
}

- (void)setQueryHints:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_BYTE *)(a1 + 68) |= 4u;
    *(_BYTE *)(a1 + 68) |= 0x20u;
    objc_storeStrong((id *)(a1 + 32), a2);
  }

}

- (void)_readResultHints
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 68) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDSPunchInHintsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readResultHints_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (void)addResultHints:(uint64_t)a1
{
  id v3;

  if (a1)
  {
    v3 = a2;
    -[GEOPDSPunchInHints _readResultHints](a1);
    -[GEOPDSPunchInHints _addNoFlagsResultHints:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_BYTE *)(a1 + 68) |= 8u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
    *(_BYTE *)(a1 + 68) |= 0x20u;
  }
}

- (void)_addNoFlagsResultHints:(uint64_t)a1
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

- (void)_readTappedResultHint
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 68) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDSPunchInHintsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTappedResultHint_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (void)setTappedResultHint:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_BYTE *)(a1 + 68) |= 0x10u;
    *(_BYTE *)(a1 + 68) |= 0x20u;
    objc_storeStrong((id *)(a1 + 48), a2);
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
  v8.super_class = (Class)GEOPDSPunchInHints;
  -[GEOPDSPunchInHints description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDSPunchInHints dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSPunchInHints _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  const __CFString *v20;
  id v21;
  void *v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  _QWORD v32[4];
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  -[GEOPDSPunchInHints readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
  if ((*(_BYTE *)(a1 + 68) & 2) == 0)
  {
    v5 = *(void **)(a1 + 8);
    if (v5)
    {
      v6 = v5;
      objc_sync_enter(v6);
      GEOPDSPunchInHintsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAppId_tags_0);
      objc_sync_exit(v6);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  v7 = *(id *)(a1 + 24);
  if (v7)
  {
    if (a2)
      v8 = CFSTR("appId");
    else
      v8 = CFSTR("app_id");
    objc_msgSend(v4, "setObject:forKey:", v7, v8);
  }

  -[GEOPDSPunchInHints queryHints]((id *)a1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v9, "jsonRepresentation");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = CFSTR("queryHints");
    }
    else
    {
      objc_msgSend(v9, "dictionaryRepresentation");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = CFSTR("query_hints");
    }
    objc_msgSend(v4, "setObject:forKey:", v11, v12);

  }
  if (objc_msgSend(*(id *)(a1 + 40), "count"))
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v14 = *(id *)(a1 + 40);
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v35 != v16)
            objc_enumerationMutation(v14);
          v18 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v18, "jsonRepresentation");
          else
            objc_msgSend(v18, "dictionaryRepresentation");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addObject:", v19);

        }
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
      }
      while (v15);
    }

    if (a2)
      v20 = CFSTR("resultHints");
    else
      v20 = CFSTR("result_hints");
    objc_msgSend(v4, "setObject:forKey:", v13, v20);

  }
  -[GEOPDSPunchInHints _readTappedResultHint](a1);
  v21 = *(id *)(a1 + 48);
  v22 = v21;
  if (v21)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v21, "jsonRepresentation");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = CFSTR("tappedResultHint");
    }
    else
    {
      objc_msgSend(v21, "dictionaryRepresentation");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = CFSTR("tapped_result_hint");
    }
    objc_msgSend(v4, "setObject:forKey:", v23, v24);

  }
  v25 = *(void **)(a1 + 16);
  if (v25)
  {
    objc_msgSend(v25, "dictionaryRepresentation");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v26;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v26, "count"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v32[0] = MEMORY[0x1E0C809B0];
      v32[1] = 3221225472;
      v32[2] = __48__GEOPDSPunchInHints__dictionaryRepresentation___block_invoke;
      v32[3] = &unk_1E1C00600;
      v29 = v28;
      v33 = v29;
      objc_msgSend(v27, "enumerateKeysAndObjectsUsingBlock:", v32);
      v30 = v29;

    }
    else
    {
      v30 = v26;
    }
    objc_msgSend(v4, "setObject:forKey:", v30, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDSPunchInHints _dictionaryRepresentation:]((uint64_t)self, 1);
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
        v6 = (int *)&readAll__recursiveTag_248_0;
      else
        v6 = (int *)&readAll__nonRecursiveTag_249_0;
      GEOPDSPunchInHintsReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
      _GEOPDSPunchInHintsCallReadAllRecursiveWithoutSynchronized(a1);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

void __48__GEOPDSPunchInHints__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  void *v8;
  const __CFString *v9;
  void *v10;
  GEOPDSPunchInQueryHints *v11;
  id v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  GEOPDSPunchInResultHints *v27;
  void *v28;
  uint64_t v29;
  const __CFString *v30;
  void *v31;
  GEOPDSPunchInResultHints *v32;
  void *v33;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("appId");
      else
        v6 = CFSTR("app_id");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = (void *)objc_msgSend(v7, "copy");
        -[GEOPDSPunchInHints setAppId:]((uint64_t)a1, v8);

      }
      if (a3)
        v9 = CFSTR("queryHints");
      else
        v9 = CFSTR("query_hints");
      objc_msgSend(v5, "objectForKeyedSubscript:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = [GEOPDSPunchInQueryHints alloc];
        if (v11)
        {
          v12 = v10;
          v11 = -[GEOPDSPunchInQueryHints init](v11, "init");
          if (v11)
          {
            if (a3)
              v13 = CFSTR("originalSearchQuery");
            else
              v13 = CFSTR("original_search_query");
            objc_msgSend(v12, "objectForKeyedSubscript:", v13);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v15 = (void *)objc_msgSend(v14, "copy");
              -[GEOPDSPunchInQueryHints setOriginalSearchQuery:]((uint64_t)v11, v15);

            }
            if (a3)
              v16 = CFSTR("completedSearchQuery");
            else
              v16 = CFSTR("completed_search_query");
            objc_msgSend(v12, "objectForKeyedSubscript:", v16);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v18 = (void *)objc_msgSend(v17, "copy");
              -[GEOPDSPunchInQueryHints setCompletedSearchQuery:]((uint64_t)v11, v18);

            }
          }

        }
        -[GEOPDSPunchInHints setQueryHints:]((uint64_t)a1, v11);

      }
      if (a3)
        v19 = CFSTR("resultHints");
      else
        v19 = CFSTR("result_hints");
      objc_msgSend(v5, "objectForKeyedSubscript:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v35 = v5;
        v38 = 0u;
        v39 = 0u;
        v36 = 0u;
        v37 = 0u;
        v21 = v20;
        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
        if (v22)
        {
          v23 = v22;
          v24 = *(_QWORD *)v37;
          do
          {
            v25 = 0;
            do
            {
              if (*(_QWORD *)v37 != v24)
                objc_enumerationMutation(v21);
              v26 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v25);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v27 = [GEOPDSPunchInResultHints alloc];
                if (v27)
                  v28 = (void *)-[GEOPDSPunchInResultHints _initWithDictionary:isJSON:](v27, v26, a3);
                else
                  v28 = 0;
                -[GEOPDSPunchInHints addResultHints:]((uint64_t)a1, v28);

              }
              ++v25;
            }
            while (v23 != v25);
            v29 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
            v23 = v29;
          }
          while (v29);
        }

        v5 = v35;
      }

      if (a3)
        v30 = CFSTR("tappedResultHint");
      else
        v30 = CFSTR("tapped_result_hint");
      objc_msgSend(v5, "objectForKeyedSubscript:", v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v32 = [GEOPDSPunchInResultHints alloc];
        if (v32)
          v33 = (void *)-[GEOPDSPunchInResultHints _initWithDictionary:isJSON:](v32, v31, a3);
        else
          v33 = 0;
        -[GEOPDSPunchInHints setTappedResultHint:]((uint64_t)a1, v33);

      }
    }
  }

  return a1;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSPunchInHintsReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  PBDataReader *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPDSPunchInHintsIsDirty((uint64_t)self) & 1) == 0)
  {
    v10 = self->_reader;
    objc_sync_enter(v10);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v11);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v10);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDSPunchInHints readAll:]((uint64_t)self, 0);
    if (self->_appId)
      PBDataWriterWriteStringField();
    if (self->_queryHints)
      PBDataWriterWriteSubmessage();
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v6 = self->_resultHints;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v13;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v6);
          PBDataWriterWriteSubmessage();
          ++v9;
        }
        while (v7 != v9);
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

    if (self->_tappedResultHint)
      PBDataWriterWriteSubmessage();
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v12);
  }

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
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v3 = result;
    -[GEOPDSPunchInHints _readResultHints](result);
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v4 = *(id *)(v3 + 40);
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v12;
      while (2)
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v12 != v7)
            objc_enumerationMutation(v4);
          v9 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8);
          if (v9)
          {
            -[GEOPDSPunchInResultHints _readCenter](*(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8));
            if ((objc_msgSend(*(id *)(v9 + 24), "hasGreenTeaWithValue:", a2, (_QWORD)v11) & 1) != 0)
            {

              return 1;
            }
          }
          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        if (v6)
          continue;
        break;
      }
    }

    -[GEOPDSPunchInHints _readTappedResultHint](v3);
    v10 = *(_QWORD *)(v3 + 48);
    if (v10
      && (-[GEOPDSPunchInResultHints _readCenter](v10),
          (objc_msgSend(*(id *)(v10 + 24), "hasGreenTeaWithValue:", a2) & 1) != 0))
    {
      return 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
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
      GEOPDSPunchInHintsReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDSPunchInHints readAll:]((uint64_t)self, 0);
  v8 = -[NSString copyWithZone:](self->_appId, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v8;

  v10 = -[GEOPDSPunchInQueryHints copyWithZone:](self->_queryHints, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v10;

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v12 = self->_resultHints;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v21;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v21 != v14)
          objc_enumerationMutation(v12);
        v16 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v15), "copyWithZone:", a3, (_QWORD)v20);
        -[GEOPDSPunchInHints addResultHints:](v5, v16);

        ++v15;
      }
      while (v13 != v15);
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v13);
  }

  v17 = -[GEOPDSPunchInResultHints copyWithZone:](self->_tappedResultHint, "copyWithZone:", a3);
  v18 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v17;

  objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *appId;
  GEOPDSPunchInQueryHints *queryHints;
  NSMutableArray *resultHints;
  GEOPDSPunchInResultHints *tappedResultHint;
  char v9;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((-[GEOPDSPunchInHints readAll:]((uint64_t)self, 1),
         -[GEOPDSPunchInHints readAll:]((uint64_t)v4, 1),
         appId = self->_appId,
         !((unint64_t)appId | v4[3]))
     || -[NSString isEqual:](appId, "isEqual:"))
    && ((queryHints = self->_queryHints, !((unint64_t)queryHints | v4[4]))
     || -[GEOPDSPunchInQueryHints isEqual:](queryHints, "isEqual:"))
    && ((resultHints = self->_resultHints, !((unint64_t)resultHints | v4[5]))
     || -[NSMutableArray isEqual:](resultHints, "isEqual:")))
  {
    tappedResultHint = self->_tappedResultHint;
    if ((unint64_t)tappedResultHint | v4[6])
      v9 = -[GEOPDSPunchInResultHints isEqual:](tappedResultHint, "isEqual:");
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
  NSUInteger v3;
  unint64_t v4;
  uint64_t v5;

  -[GEOPDSPunchInHints readAll:]((uint64_t)self, 1);
  v3 = -[NSString hash](self->_appId, "hash");
  v4 = -[GEOPDSPunchInQueryHints hash](self->_queryHints, "hash") ^ v3;
  v5 = -[NSMutableArray hash](self->_resultHints, "hash");
  return v4 ^ v5 ^ -[GEOPDSPunchInResultHints hash](self->_tappedResultHint, "hash");
}

- (void)mergeFrom:(uint64_t)a1
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
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
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (a1)
  {
    -[GEOPDSPunchInHints readAll:]((uint64_t)v3, 0);
    v5 = (void *)*((_QWORD *)v4 + 3);
    if (v5)
      -[GEOPDSPunchInHints setAppId:](a1, v5);
    v6 = *(_QWORD *)(a1 + 32);
    v7 = (void *)*((_QWORD *)v4 + 4);
    if (v6)
    {
      if (v7)
        -[GEOPDSPunchInQueryHints mergeFrom:](v6, v7);
    }
    else if (v7)
    {
      -[GEOPDSPunchInHints setQueryHints:](a1, v7);
    }
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v8 = *((id *)v4 + 5);
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
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
          -[GEOPDSPunchInHints addResultHints:](a1, *(void **)(*((_QWORD *)&v15 + 1) + 8 * v12++));
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v10);
    }

    v13 = *(_QWORD *)(a1 + 48);
    v14 = (void *)*((_QWORD *)v4 + 6);
    if (v13)
    {
      if (v14)
        -[GEOPDSPunchInResultHints mergeFrom:](v13, v14);
    }
    else if (v14)
    {
      -[GEOPDSPunchInHints setTappedResultHint:](a1, v14);
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
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
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
      -[GEOPDSPunchInHints readAll:](a1, 0);
      -[GEOPDSPunchInQueryHints clearUnknownFields:](*(_QWORD *)(a1 + 32), 1);
      v12 = 0u;
      v13 = 0u;
      v10 = 0u;
      v11 = 0u;
      v5 = *(id *)(a1 + 40);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
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
            -[GEOPDSPunchInResultHints clearUnknownFields:](*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++), 1);
          }
          while (v7 != v9);
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        }
        while (v7);
      }

      -[GEOPDSPunchInResultHints clearUnknownFields:](*(_QWORD *)(a1 + 48), 1);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tappedResultHint, 0);
  objc_storeStrong((id *)&self->_resultHints, 0);
  objc_storeStrong((id *)&self->_queryHints, 0);
  objc_storeStrong((id *)&self->_appId, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
