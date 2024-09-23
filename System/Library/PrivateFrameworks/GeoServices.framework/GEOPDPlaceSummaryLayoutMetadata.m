@implementation GEOPDPlaceSummaryLayoutMetadata

- (GEOPDPlaceSummaryLayoutMetadata)init
{
  GEOPDPlaceSummaryLayoutMetadata *v2;
  GEOPDPlaceSummaryLayoutMetadata *v3;
  GEOPDPlaceSummaryLayoutMetadata *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDPlaceSummaryLayoutMetadata;
  v2 = -[GEOPDPlaceSummaryLayoutMetadata init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDPlaceSummaryLayoutMetadata)initWithData:(id)a3
{
  GEOPDPlaceSummaryLayoutMetadata *v3;
  GEOPDPlaceSummaryLayoutMetadata *v4;
  GEOPDPlaceSummaryLayoutMetadata *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDPlaceSummaryLayoutMetadata;
  v3 = -[GEOPDPlaceSummaryLayoutMetadata initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (int)useCaseType
{
  os_unfair_lock_s *p_readerLock;
  char flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 1) != 0)
    return self->_useCaseType;
  else
    return 0;
}

- (void)setUseCaseType:(int)a3
{
  *(_BYTE *)&self->_flags |= 9u;
  self->_useCaseType = a3;
}

- (void)setHasUseCaseType:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3 | 8;
}

- (BOOL)hasUseCaseType
{
  return *(_BYTE *)&self->_flags & 1;
}

- (id)useCaseTypeAsString:(int)a3
{
  if (a3 < 3)
    return off_1E1C0E308[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsUseCaseType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PLACE_SUMMARY_USE_CASE_TYPE_UNKNONWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PLACE_SUMMARY_USE_CASE_TYPE_AUTOCOMPLETE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("PLACE_SUMMARY_USE_CASE_TYPE_SEARCH")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_readLayoutTemplatePairs
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if ((*(_BYTE *)(a1 + 48) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceSummaryLayoutMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLayoutTemplatePairs_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (NSMutableArray)layoutTemplatePairs
{
  -[GEOPDPlaceSummaryLayoutMetadata _readLayoutTemplatePairs]((uint64_t)self);
  return self->_layoutTemplatePairs;
}

- (void)setLayoutTemplatePairs:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *layoutTemplatePairs;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 8u;
  layoutTemplatePairs = self->_layoutTemplatePairs;
  self->_layoutTemplatePairs = v4;

}

- (void)clearLayoutTemplatePairs
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 8u;
  -[NSMutableArray removeAllObjects](self->_layoutTemplatePairs, "removeAllObjects");
}

- (void)addLayoutTemplatePair:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOPDPlaceSummaryLayoutMetadata _readLayoutTemplatePairs]((uint64_t)self);
  -[GEOPDPlaceSummaryLayoutMetadata _addNoFlagsLayoutTemplatePair:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 8u;
}

- (void)_addNoFlagsLayoutTemplatePair:(uint64_t)a1
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

- (unint64_t)layoutTemplatePairsCount
{
  -[GEOPDPlaceSummaryLayoutMetadata _readLayoutTemplatePairs]((uint64_t)self);
  return -[NSMutableArray count](self->_layoutTemplatePairs, "count");
}

- (id)layoutTemplatePairAtIndex:(unint64_t)a3
{
  -[GEOPDPlaceSummaryLayoutMetadata _readLayoutTemplatePairs]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_layoutTemplatePairs, "objectAtIndex:", a3);
}

+ (Class)layoutTemplatePairType
{
  return (Class)objc_opt_class();
}

- (void)_readDyanmicContextServerOverrides
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if ((*(_BYTE *)(a1 + 48) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceSummaryLayoutMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDyanmicContextServerOverrides_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (NSMutableArray)dyanmicContextServerOverrides
{
  -[GEOPDPlaceSummaryLayoutMetadata _readDyanmicContextServerOverrides]((uint64_t)self);
  return self->_dyanmicContextServerOverrides;
}

- (void)setDyanmicContextServerOverrides:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *dyanmicContextServerOverrides;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 8u;
  dyanmicContextServerOverrides = self->_dyanmicContextServerOverrides;
  self->_dyanmicContextServerOverrides = v4;

}

- (void)clearDyanmicContextServerOverrides
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 8u;
  -[NSMutableArray removeAllObjects](self->_dyanmicContextServerOverrides, "removeAllObjects");
}

- (void)addDyanmicContextServerOverride:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOPDPlaceSummaryLayoutMetadata _readDyanmicContextServerOverrides]((uint64_t)self);
  -[GEOPDPlaceSummaryLayoutMetadata _addNoFlagsDyanmicContextServerOverride:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 8u;
}

- (void)_addNoFlagsDyanmicContextServerOverride:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 16);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 16);
      *(_QWORD *)(a1 + 16) = v5;

      v4 = *(void **)(a1 + 16);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)dyanmicContextServerOverridesCount
{
  -[GEOPDPlaceSummaryLayoutMetadata _readDyanmicContextServerOverrides]((uint64_t)self);
  return -[NSMutableArray count](self->_dyanmicContextServerOverrides, "count");
}

- (id)dyanmicContextServerOverrideAtIndex:(unint64_t)a3
{
  -[GEOPDPlaceSummaryLayoutMetadata _readDyanmicContextServerOverrides]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_dyanmicContextServerOverrides, "objectAtIndex:", a3);
}

+ (Class)dyanmicContextServerOverrideType
{
  return (Class)objc_opt_class();
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
  v8.super_class = (Class)GEOPDPlaceSummaryLayoutMetadata;
  -[GEOPDPlaceSummaryLayoutMetadata description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDPlaceSummaryLayoutMetadata dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDPlaceSummaryLayoutMetadata _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  uint64_t v5;
  __CFString *v6;
  const __CFString *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
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
  const __CFString *v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)(a1 + 48) & 1) != 0)
  {
    v5 = *(int *)(a1 + 44);
    if (v5 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 44));
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = off_1E1C0E308[v5];
    }
    if (a2)
      v7 = CFSTR("useCaseType");
    else
      v7 = CFSTR("use_case_type");
    objc_msgSend(v4, "setObject:forKey:", v6, v7);

  }
  if (objc_msgSend(*(id *)(a1 + 24), "count"))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v9 = *(id *)(a1 + 24);
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v32 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v14, "jsonRepresentation");
          else
            objc_msgSend(v14, "dictionaryRepresentation");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v15);

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      }
      while (v11);
    }

    if (a2)
      v16 = CFSTR("layoutTemplatePair");
    else
      v16 = CFSTR("layout_template_pair");
    objc_msgSend(v4, "setObject:forKey:", v8, v16);

  }
  if (objc_msgSend(*(id *)(a1 + 16), "count"))
  {
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 16), "count"));
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v18 = *(id *)(a1 + 16);
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v28;
      do
      {
        for (j = 0; j != v20; ++j)
        {
          if (*(_QWORD *)v28 != v21)
            objc_enumerationMutation(v18);
          v23 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * j);
          if ((a2 & 1) != 0)
            objc_msgSend(v23, "jsonRepresentation");
          else
            objc_msgSend(v23, "dictionaryRepresentation");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "addObject:", v24);

        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
      }
      while (v20);
    }

    if (a2)
      v25 = CFSTR("dyanmicContextServerOverride");
    else
      v25 = CFSTR("dyanmic_context_server_override");
    objc_msgSend(v4, "setObject:forKey:", v17, v25);

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDPlaceSummaryLayoutMetadata _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOPDPlaceSummaryLayoutMetadata)initWithDictionary:(id)a3
{
  return (GEOPDPlaceSummaryLayoutMetadata *)-[GEOPDPlaceSummaryLayoutMetadata _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  id v8;
  uint64_t v9;
  const __CFString *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  GEOPDPlaceSummaryResultLayoutTemplatePair *v18;
  uint64_t v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  uint64_t v28;
  GEOPDPlaceSummaryDynamicContextServerOverride *v29;
  uint64_t v30;
  void *v31;
  id v33;
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
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (!a1)
    goto LABEL_53;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_53;
  if (a3)
    v6 = CFSTR("useCaseType");
  else
    v6 = CFSTR("use_case_type");
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
    if ((objc_msgSend(v8, "isEqualToString:", CFSTR("PLACE_SUMMARY_USE_CASE_TYPE_UNKNONWN")) & 1) != 0)
    {
      v9 = 0;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("PLACE_SUMMARY_USE_CASE_TYPE_AUTOCOMPLETE")) & 1) != 0)
    {
      v9 = 1;
    }
    else if (objc_msgSend(v8, "isEqualToString:", CFSTR("PLACE_SUMMARY_USE_CASE_TYPE_SEARCH")))
    {
      v9 = 2;
    }
    else
    {
      v9 = 0;
    }

    goto LABEL_17;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = objc_msgSend(v7, "intValue");
LABEL_17:
    objc_msgSend(a1, "setUseCaseType:", v9);
  }

  if (a3)
    v10 = CFSTR("layoutTemplatePair");
  else
    v10 = CFSTR("layout_template_pair");
  objc_msgSend(v5, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v33 = v5;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v12 = v11;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v39;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v39 != v15)
            objc_enumerationMutation(v12);
          v17 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v18 = [GEOPDPlaceSummaryResultLayoutTemplatePair alloc];
            if ((a3 & 1) != 0)
              v19 = -[GEOPDPlaceSummaryResultLayoutTemplatePair initWithJSON:](v18, "initWithJSON:", v17);
            else
              v19 = -[GEOPDPlaceSummaryResultLayoutTemplatePair initWithDictionary:](v18, "initWithDictionary:", v17);
            v20 = (void *)v19;
            objc_msgSend(a1, "addLayoutTemplatePair:", v19);

          }
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
      }
      while (v14);
    }

    v5 = v33;
  }

  if (a3)
    v21 = CFSTR("dyanmicContextServerOverride");
  else
    v21 = CFSTR("dyanmic_context_server_override");
  objc_msgSend(v5, "objectForKeyedSubscript:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v23 = v22;
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v35;
      do
      {
        for (j = 0; j != v25; ++j)
        {
          if (*(_QWORD *)v35 != v26)
            objc_enumerationMutation(v23);
          v28 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * j);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v29 = [GEOPDPlaceSummaryDynamicContextServerOverride alloc];
            if ((a3 & 1) != 0)
              v30 = -[GEOPDPlaceSummaryDynamicContextServerOverride initWithJSON:](v29, "initWithJSON:", v28);
            else
              v30 = -[GEOPDPlaceSummaryDynamicContextServerOverride initWithDictionary:](v29, "initWithDictionary:", v28);
            v31 = (void *)v30;
            objc_msgSend(a1, "addDyanmicContextServerOverride:", v30);

          }
        }
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
      }
      while (v25);
    }

    v5 = v33;
  }

LABEL_53:
  return a1;
}

- (GEOPDPlaceSummaryLayoutMetadata)initWithJSON:(id)a3
{
  return (GEOPDPlaceSummaryLayoutMetadata *)-[GEOPDPlaceSummaryLayoutMetadata _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v7;
  int *v8;

  v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if (v3)
      v8 = (int *)&readAll__recursiveTag_195;
    else
      v8 = (int *)&readAll__nonRecursiveTag_196;
    GEOPDPlaceSummaryLayoutMetadataReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEOPDPlaceSummaryLayoutMetadataCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPDPlaceSummaryLayoutMetadataIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDPlaceSummaryLayoutMetadataReadAllFrom((uint64_t)self, a3, 0);
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
  if (self->_reader && (_GEOPDPlaceSummaryLayoutMetadataIsDirty((uint64_t)self) & 1) == 0)
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
    -[GEOPDPlaceSummaryLayoutMetadata readAll:](self, "readAll:", 0);
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      PBDataWriterWriteInt32Field();
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v6 = self->_layoutTemplatePairs;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v21;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v21 != v8)
            objc_enumerationMutation(v6);
          PBDataWriterWriteSubmessage();
          ++v9;
        }
        while (v7 != v9);
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      }
      while (v7);
    }

    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v10 = self->_dyanmicContextServerOverrides;
    v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v17;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v17 != v12)
            objc_enumerationMutation(v10);
          PBDataWriterWriteSubmessage();
          ++v13;
        }
        while (v11 != v13);
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
      }
      while (v11);
    }

  }
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
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

  v3 = a3;
  v26 = *MEMORY[0x1E0C80C00];
  -[GEOPDPlaceSummaryLayoutMetadata _readDyanmicContextServerOverrides]((uint64_t)self);
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = self->_dyanmicContextServerOverrides;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v21;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v21 != v8)
        objc_enumerationMutation(v5);
      if ((objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v9), "hasGreenTeaWithValue:", v3) & 1) != 0)
        goto LABEL_18;
      if (v7 == ++v9)
      {
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
        if (v7)
          goto LABEL_3;
        break;
      }
    }
  }

  -[GEOPDPlaceSummaryLayoutMetadata _readLayoutTemplatePairs]((uint64_t)self);
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = self->_layoutTemplatePairs;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
LABEL_11:
    v13 = 0;
    while (1)
    {
      if (*(_QWORD *)v17 != v12)
        objc_enumerationMutation(v5);
      if ((objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v13), "hasGreenTeaWithValue:", v3, (_QWORD)v16) & 1) != 0)
        break;
      if (v11 == ++v13)
      {
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
        if (v11)
          goto LABEL_11;
        goto LABEL_17;
      }
    }
LABEL_18:
    v14 = 1;
    goto LABEL_19;
  }
LABEL_17:
  v14 = 0;
LABEL_19:

  return v14;
}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t j;
  void *v11;
  id *v12;

  v12 = (id *)a3;
  -[GEOPDPlaceSummaryLayoutMetadata readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v12 + 1, self->_reader);
  *((_DWORD *)v12 + 8) = self->_readerMarkPos;
  *((_DWORD *)v12 + 9) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *((_DWORD *)v12 + 11) = self->_useCaseType;
    *((_BYTE *)v12 + 48) |= 1u;
  }
  if (-[GEOPDPlaceSummaryLayoutMetadata layoutTemplatePairsCount](self, "layoutTemplatePairsCount"))
  {
    objc_msgSend(v12, "clearLayoutTemplatePairs");
    v4 = -[GEOPDPlaceSummaryLayoutMetadata layoutTemplatePairsCount](self, "layoutTemplatePairsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[GEOPDPlaceSummaryLayoutMetadata layoutTemplatePairAtIndex:](self, "layoutTemplatePairAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addLayoutTemplatePair:", v7);

      }
    }
  }
  if (-[GEOPDPlaceSummaryLayoutMetadata dyanmicContextServerOverridesCount](self, "dyanmicContextServerOverridesCount"))
  {
    objc_msgSend(v12, "clearDyanmicContextServerOverrides");
    v8 = -[GEOPDPlaceSummaryLayoutMetadata dyanmicContextServerOverridesCount](self, "dyanmicContextServerOverridesCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
      {
        -[GEOPDPlaceSummaryLayoutMetadata dyanmicContextServerOverrideAtIndex:](self, "dyanmicContextServerOverrideAtIndex:", j);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addDyanmicContextServerOverride:", v11);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  NSMutableArray *v8;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_BYTE *)&self->_flags & 8) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOPDPlaceSummaryLayoutMetadataReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (NSMutableArray *)(id)v5;
      objc_sync_exit(v7);

      goto LABEL_21;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDPlaceSummaryLayoutMetadata readAll:](self, "readAll:", 0);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 44) = self->_useCaseType;
    *(_BYTE *)(v5 + 48) |= 1u;
  }
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v9 = self->_layoutTemplatePairs;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v24 != v11)
          objc_enumerationMutation(v9);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addLayoutTemplatePair:", v13);

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v10);
  }

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = self->_dyanmicContextServerOverrides;
  v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v20;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v20 != v15)
          objc_enumerationMutation(v8);
        v17 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * j), "copyWithZone:", a3, (_QWORD)v19);
        objc_msgSend((id)v5, "addDyanmicContextServerOverride:", v17);

      }
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v14);
  }
LABEL_21:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSMutableArray *layoutTemplatePairs;
  NSMutableArray *dyanmicContextServerOverrides;
  char v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_11;
  -[GEOPDPlaceSummaryLayoutMetadata readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 1) == 0 || self->_useCaseType != *((_DWORD *)v4 + 11))
      goto LABEL_11;
  }
  else if ((*((_BYTE *)v4 + 48) & 1) != 0)
  {
LABEL_11:
    v7 = 0;
    goto LABEL_12;
  }
  layoutTemplatePairs = self->_layoutTemplatePairs;
  if ((unint64_t)layoutTemplatePairs | *((_QWORD *)v4 + 3)
    && !-[NSMutableArray isEqual:](layoutTemplatePairs, "isEqual:"))
  {
    goto LABEL_11;
  }
  dyanmicContextServerOverrides = self->_dyanmicContextServerOverrides;
  if ((unint64_t)dyanmicContextServerOverrides | *((_QWORD *)v4 + 2))
    v7 = -[NSMutableArray isEqual:](dyanmicContextServerOverrides, "isEqual:");
  else
    v7 = 1;
LABEL_12:

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;

  -[GEOPDPlaceSummaryLayoutMetadata readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v3 = 2654435761 * self->_useCaseType;
  else
    v3 = 0;
  v4 = -[NSMutableArray hash](self->_layoutTemplatePairs, "hash") ^ v3;
  return v4 ^ -[NSMutableArray hash](self->_dyanmicContextServerOverrides, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
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
  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  if ((*((_BYTE *)v4 + 48) & 1) != 0)
  {
    self->_useCaseType = *((_DWORD *)v4 + 11);
    *(_BYTE *)&self->_flags |= 1u;
  }
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = *((id *)v4 + 3);
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
        -[GEOPDPlaceSummaryLayoutMetadata addLayoutTemplatePair:](self, "addLayoutTemplatePair:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v9++));
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
  v10 = *((id *)v4 + 2);
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
        -[GEOPDPlaceSummaryLayoutMetadata addDyanmicContextServerOverride:](self, "addDyanmicContextServerOverride:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v14++), (_QWORD)v15);
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v12);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutTemplatePairs, 0);
  objc_storeStrong((id *)&self->_dyanmicContextServerOverrides, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
