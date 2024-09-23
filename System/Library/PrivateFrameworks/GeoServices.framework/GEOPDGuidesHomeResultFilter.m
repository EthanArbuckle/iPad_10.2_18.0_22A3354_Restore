@implementation GEOPDGuidesHomeResultFilter

- (void)clearUnknownFields:(uint64_t)a1
{
  void *v2;
  uint64_t v3;
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
    *(_BYTE *)(a1 + 56) |= 2u;
    *(_BYTE *)(a1 + 56) |= 0x10u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
    v2 = *(void **)(a1 + 16);
    *(_QWORD *)(a1 + 16) = 0;

    -[GEOPDGuidesHomeResultFilter readAll:](a1, 0);
    v3 = *(_QWORD *)(a1 + 24);
    if (v3)
    {
      v4 = *(void **)(v3 + 8);
      *(_QWORD *)(v3 + 8) = 0;

      -[GEOPDRelatedSearchSuggestion clearUnknownFields:](*(_QWORD *)(v3 + 16), 1);
    }
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v5 = *(id *)(a1 + 32);
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
          -[GEOPDGuidesHomeResultFilter clearUnknownFields:](*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++));
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v7);
    }

  }
}

- (GEOPDGuidesHomeResultFilter)init
{
  GEOPDGuidesHomeResultFilter *v2;
  GEOPDGuidesHomeResultFilter *v3;
  GEOPDGuidesHomeResultFilter *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDGuidesHomeResultFilter;
  v2 = -[GEOPDGuidesHomeResultFilter init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDGuidesHomeResultFilter)initWithData:(id)a3
{
  GEOPDGuidesHomeResultFilter *v3;
  GEOPDGuidesHomeResultFilter *v4;
  GEOPDGuidesHomeResultFilter *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDGuidesHomeResultFilter;
  v3 = -[GEOPDGuidesHomeResultFilter initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (uint64_t)filterType
{
  uint64_t v1;
  char v2;

  if (result)
  {
    v1 = result;
    os_unfair_lock_lock_with_options();
    v2 = *(_BYTE *)(v1 + 56);
    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 48));
    if ((v2 & 1) != 0)
      return *(unsigned int *)(v1 + 52);
    else
      return 0;
  }
  return result;
}

- (void)_readFilterConcept
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(_BYTE *)(a1 + 56) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDGuidesHomeResultFilterReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readFilterConcept_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (id)filterConcept
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDGuidesHomeResultFilter _readFilterConcept]((uint64_t)a1);
    a1 = (id *)v1[3];
  }
  return a1;
}

- (void)setFilterConcept:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_BYTE *)(a1 + 56) |= 4u;
    *(_BYTE *)(a1 + 56) |= 0x10u;
    objc_storeStrong((id *)(a1 + 24), a2);
  }

}

- (void)addSubFilter:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;

  if (a1)
  {
    v3 = a2;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(_BYTE *)(a1 + 56) & 8) == 0)
    {
      v4 = *(void **)(a1 + 8);
      if (v4)
      {
        v5 = v4;
        objc_sync_enter(v5);
        GEOPDGuidesHomeResultFilterReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSubFilters_tags);
        objc_sync_exit(v5);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
    -[GEOPDGuidesHomeResultFilter _addNoFlagsSubFilter:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_BYTE *)(a1 + 56) |= 8u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
    *(_BYTE *)(a1 + 56) |= 0x10u;
  }
}

- (void)_addNoFlagsSubFilter:(uint64_t)a1
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

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)GEOPDGuidesHomeResultFilter;
  -[GEOPDGuidesHomeResultFilter description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDGuidesHomeResultFilter dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDGuidesHomeResultFilter _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  int v5;
  __CFString *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
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
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  _QWORD v28[4];
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  -[GEOPDGuidesHomeResultFilter readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)(a1 + 56) & 1) != 0)
  {
    v5 = *(_DWORD *)(a1 + 52);
    if (v5)
    {
      if (v5 == 1)
      {
        v6 = CFSTR("GUIDES_HOME_RESULT_FILTER_TYPE_CONCEPT");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 52));
        v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v6 = CFSTR("GUIDES_HOME_RESULT_FILTER_TYPE_UNKNOWN");
    }
    if (a2)
      v7 = CFSTR("filterType");
    else
      v7 = CFSTR("filter_type");
    objc_msgSend(v4, "setObject:forKey:", v6, v7);

  }
  -[GEOPDGuidesHomeResultFilter filterConcept]((id *)a1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v8, "jsonRepresentation");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = CFSTR("filterConcept");
    }
    else
    {
      objc_msgSend(v8, "dictionaryRepresentation");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = CFSTR("filter_concept");
    }
    objc_msgSend(v4, "setObject:forKey:", v10, v11);

  }
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v13 = *(id *)(a1 + 32);
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v31 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v18, "jsonRepresentation");
          else
            objc_msgSend(v18, "dictionaryRepresentation");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addObject:", v19);

        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      }
      while (v15);
    }

    if (a2)
      v20 = CFSTR("subFilter");
    else
      v20 = CFSTR("sub_filter");
    objc_msgSend(v4, "setObject:forKey:", v12, v20);

  }
  v21 = *(void **)(a1 + 16);
  if (v21)
  {
    objc_msgSend(v21, "dictionaryRepresentation");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v22, "count"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __57__GEOPDGuidesHomeResultFilter__dictionaryRepresentation___block_invoke;
      v28[3] = &unk_1E1C00600;
      v25 = v24;
      v29 = v25;
      objc_msgSend(v23, "enumerateKeysAndObjectsUsingBlock:", v28);
      v26 = v25;

      v23 = v26;
    }
    objc_msgSend(v4, "setObject:forKey:", v23, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDGuidesHomeResultFilter _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  void *v4;
  id v5;
  int *v6;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      v5 = v4;
      objc_sync_enter(v5);
      if (a2)
        v6 = (int *)&readAll__recursiveTag_2508;
      else
        v6 = (int *)&readAll__nonRecursiveTag_2509;
      GEOPDGuidesHomeResultFilterReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
      _GEOPDGuidesHomeResultFilterCallReadAllRecursiveWithoutSynchronized(a1);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

void __57__GEOPDGuidesHomeResultFilter__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (uint64_t)_initWithDictionary:(uint64_t)a3 isJSON:
{
  id v5;
  uint64_t v6;
  const __CFString *v7;
  void *v8;
  id v9;
  int v10;
  const __CFString *v11;
  void *v12;
  GEOPDGuidesHomeResultFilterTypeConcept *v13;
  id v14;
  const __CFString *v15;
  void *v16;
  GEOPDRelatedSearchSuggestion *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  GEOPDGuidesHomeResultFilter *v27;
  void *v28;
  uint64_t v29;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = objc_msgSend(a1, "init");
  if (!v6)
    goto LABEL_48;
  if ((_DWORD)a3)
    v7 = CFSTR("filterType");
  else
    v7 = CFSTR("filter_type");
  objc_msgSend(v5, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = v8;
    if ((objc_msgSend(v9, "isEqualToString:", CFSTR("GUIDES_HOME_RESULT_FILTER_TYPE_UNKNOWN")) & 1) != 0)
      v10 = 0;
    else
      v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("GUIDES_HOME_RESULT_FILTER_TYPE_CONCEPT"));

    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = objc_msgSend(v8, "intValue");
LABEL_12:
    *(_BYTE *)(v6 + 56) |= 0x10u;
    *(_BYTE *)(v6 + 56) |= 1u;
    *(_DWORD *)(v6 + 52) = v10;
  }

  if ((_DWORD)a3)
    v11 = CFSTR("filterConcept");
  else
    v11 = CFSTR("filter_concept");
  objc_msgSend(v5, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v13 = [GEOPDGuidesHomeResultFilterTypeConcept alloc];
    if (v13)
    {
      v14 = v12;
      v13 = -[GEOPDGuidesHomeResultFilterTypeConcept init](v13, "init");
      if (v13)
      {
        if ((_DWORD)a3)
          v15 = CFSTR("relatedSearchSuggestion");
        else
          v15 = CFSTR("related_search_suggestion");
        objc_msgSend(v14, "objectForKeyedSubscript:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v17 = [GEOPDRelatedSearchSuggestion alloc];
          if (v17)
            v18 = -[GEOPDRelatedSearchSuggestion _initWithDictionary:isJSON:](v17, v16, a3);
          else
            v18 = 0;
          -[GEOPDGuidesHomeResultFilterTypeConcept setRelatedSearchSuggestion:]((uint64_t)v13, v18);

        }
      }

    }
    -[GEOPDGuidesHomeResultFilter setFilterConcept:](v6, v13);

  }
  if ((_DWORD)a3)
    v19 = CFSTR("subFilter");
  else
    v19 = CFSTR("sub_filter");
  objc_msgSend(v5, "objectForKeyedSubscript:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v31 = v5;
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v21 = v20;
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v33;
      do
      {
        v25 = 0;
        do
        {
          if (*(_QWORD *)v33 != v24)
            objc_enumerationMutation(v21);
          v26 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * v25);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v27 = [GEOPDGuidesHomeResultFilter alloc];
            if (v27)
              v28 = (void *)-[GEOPDGuidesHomeResultFilter _initWithDictionary:isJSON:](v27, v26, a3);
            else
              v28 = 0;
            -[GEOPDGuidesHomeResultFilter addSubFilter:](v6, v28);

          }
          ++v25;
        }
        while (v23 != v25);
        v29 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
        v23 = v29;
      }
      while (v29);
    }

    v5 = v31;
  }

LABEL_48:
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDGuidesHomeResultFilterReadAllFrom((uint64_t)self, a3, 0);
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
  if (self->_reader && (_GEOPDGuidesHomeResultFilterIsDirty((uint64_t)self) & 1) == 0)
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
    -[GEOPDGuidesHomeResultFilter readAll:]((uint64_t)self, 0);
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      PBDataWriterWriteInt32Field();
    if (self->_filterConcept)
      PBDataWriterWriteSubmessage();
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v6 = self->_subFilters;
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

    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v12);
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  id v9;
  void *v10;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  PBUnknownFields *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_BYTE *)&self->_flags & 0x10) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOPDGuidesHomeResultFilterReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_15;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDGuidesHomeResultFilter readAll:]((uint64_t)self, 0);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 52) = self->_filterType;
    *(_BYTE *)(v5 + 56) |= 1u;
  }
  v9 = -[GEOPDGuidesHomeResultFilterTypeConcept copyWithZone:](self->_filterConcept, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v9;

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v11 = self->_subFilters;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v19 != v13)
          objc_enumerationMutation(v11);
        v15 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v18);
        -[GEOPDGuidesHomeResultFilter addSubFilter:](v5, v15);

      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v12);
  }

  v16 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v16;
LABEL_15:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  GEOPDGuidesHomeResultFilterTypeConcept *filterConcept;
  NSMutableArray *subFilters;
  char v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_11;
  -[GEOPDGuidesHomeResultFilter readAll:]((uint64_t)self, 1);
  -[GEOPDGuidesHomeResultFilter readAll:]((uint64_t)v4, 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 1) == 0 || self->_filterType != *((_DWORD *)v4 + 13))
      goto LABEL_11;
  }
  else if ((*((_BYTE *)v4 + 56) & 1) != 0)
  {
LABEL_11:
    v7 = 0;
    goto LABEL_12;
  }
  filterConcept = self->_filterConcept;
  if ((unint64_t)filterConcept | *((_QWORD *)v4 + 3)
    && !-[GEOPDGuidesHomeResultFilterTypeConcept isEqual:](filterConcept, "isEqual:"))
  {
    goto LABEL_11;
  }
  subFilters = self->_subFilters;
  if ((unint64_t)subFilters | *((_QWORD *)v4 + 4))
    v7 = -[NSMutableArray isEqual:](subFilters, "isEqual:");
  else
    v7 = 1;
LABEL_12:

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;

  -[GEOPDGuidesHomeResultFilter readAll:]((uint64_t)self, 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v3 = 2654435761 * self->_filterType;
  else
    v3 = 0;
  v4 = -[GEOPDGuidesHomeResultFilterTypeConcept hash](self->_filterConcept, "hash") ^ v3;
  return v4 ^ -[NSMutableArray hash](self->_subFilters, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subFilters, 0);
  objc_storeStrong((id *)&self->_filterConcept, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
