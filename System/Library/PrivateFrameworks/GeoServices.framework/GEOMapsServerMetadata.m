@implementation GEOMapsServerMetadata

- (GEOMapsServerMetadata)init
{
  GEOMapsServerMetadata *v2;
  GEOMapsServerMetadata *v3;
  GEOMapsServerMetadata *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOMapsServerMetadata;
  v2 = -[GEOMapsServerMetadata init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOMapsServerMetadata)initWithData:(id)a3
{
  GEOMapsServerMetadata *v3;
  GEOMapsServerMetadata *v4;
  GEOMapsServerMetadata *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOMapsServerMetadata;
  v3 = -[GEOMapsServerMetadata initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readSuggestionEntryMetadataTappedOn
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(_BYTE *)(a1 + 52) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOMapsServerMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSuggestionEntryMetadataTappedOn_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasSuggestionEntryMetadataTappedOn
{
  -[GEOMapsServerMetadata _readSuggestionEntryMetadataTappedOn]((uint64_t)self);
  return self->_suggestionEntryMetadataTappedOn != 0;
}

- (NSData)suggestionEntryMetadataTappedOn
{
  -[GEOMapsServerMetadata _readSuggestionEntryMetadataTappedOn]((uint64_t)self);
  return self->_suggestionEntryMetadataTappedOn;
}

- (void)setSuggestionEntryMetadataTappedOn:(id)a3
{
  *(_BYTE *)&self->_flags |= 0xCu;
  objc_storeStrong((id *)&self->_suggestionEntryMetadataTappedOn, a3);
}

- (void)_readSuggestionEntryMetadataDisplayeds
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(_BYTE *)(a1 + 52) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOMapsServerMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSuggestionEntryMetadataDisplayeds_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (NSMutableArray)suggestionEntryMetadataDisplayeds
{
  -[GEOMapsServerMetadata _readSuggestionEntryMetadataDisplayeds]((uint64_t)self);
  return self->_suggestionEntryMetadataDisplayeds;
}

- (void)setSuggestionEntryMetadataDisplayeds:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *suggestionEntryMetadataDisplayeds;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 8u;
  suggestionEntryMetadataDisplayeds = self->_suggestionEntryMetadataDisplayeds;
  self->_suggestionEntryMetadataDisplayeds = v4;

}

- (void)clearSuggestionEntryMetadataDisplayeds
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 8u;
  -[NSMutableArray removeAllObjects](self->_suggestionEntryMetadataDisplayeds, "removeAllObjects");
}

- (void)addSuggestionEntryMetadataDisplayed:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOMapsServerMetadata _readSuggestionEntryMetadataDisplayeds]((uint64_t)self);
  -[GEOMapsServerMetadata _addNoFlagsSuggestionEntryMetadataDisplayed:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 8u;
}

- (void)_addNoFlagsSuggestionEntryMetadataDisplayed:(uint64_t)a1
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

- (unint64_t)suggestionEntryMetadataDisplayedsCount
{
  -[GEOMapsServerMetadata _readSuggestionEntryMetadataDisplayeds]((uint64_t)self);
  return -[NSMutableArray count](self->_suggestionEntryMetadataDisplayeds, "count");
}

- (id)suggestionEntryMetadataDisplayedAtIndex:(unint64_t)a3
{
  -[GEOMapsServerMetadata _readSuggestionEntryMetadataDisplayeds]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_suggestionEntryMetadataDisplayeds, "objectAtIndex:", a3);
}

+ (Class)suggestionEntryMetadataDisplayedType
{
  return (Class)objc_opt_class();
}

- (void)_readMapsSearchResults
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(_BYTE *)(a1 + 52) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOMapsServerMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMapsSearchResults_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (NSMutableArray)mapsSearchResults
{
  -[GEOMapsServerMetadata _readMapsSearchResults]((uint64_t)self);
  return self->_mapsSearchResults;
}

- (void)setMapsSearchResults:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *mapsSearchResults;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 1u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 8u;
  mapsSearchResults = self->_mapsSearchResults;
  self->_mapsSearchResults = v4;

}

- (void)clearMapsSearchResults
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 1u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 8u;
  -[NSMutableArray removeAllObjects](self->_mapsSearchResults, "removeAllObjects");
}

- (void)addMapsSearchResult:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOMapsServerMetadata _readMapsSearchResults]((uint64_t)self);
  -[GEOMapsServerMetadata _addNoFlagsMapsSearchResult:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 1u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 8u;
}

- (void)_addNoFlagsMapsSearchResult:(uint64_t)a1
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

- (unint64_t)mapsSearchResultsCount
{
  -[GEOMapsServerMetadata _readMapsSearchResults]((uint64_t)self);
  return -[NSMutableArray count](self->_mapsSearchResults, "count");
}

- (id)mapsSearchResultAtIndex:(unint64_t)a3
{
  -[GEOMapsServerMetadata _readMapsSearchResults]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_mapsSearchResults, "objectAtIndex:", a3);
}

+ (Class)mapsSearchResultType
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
  v8.super_class = (Class)GEOMapsServerMetadata;
  -[GEOMapsServerMetadata description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOMapsServerMetadata dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOMapsServerMetadata _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
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
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)a1, "suggestionEntryMetadataTappedOn");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = v5;
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v5, "base64EncodedStringWithOptions:", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("suggestionEntryMetadataTappedOn"));

      if (!*(_QWORD *)(a1 + 24))
        goto LABEL_19;
      goto LABEL_8;
    }
    objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("suggestion_entry_metadata_tapped_on"));

    if (*(_QWORD *)(a1 + 24))
      goto LABEL_17;
  }
  else if (*(_QWORD *)(a1 + 24))
  {
    if (a2)
    {
LABEL_8:
      v8 = (void *)MEMORY[0x1E0C99DE8];
      objc_msgSend((id)a1, "suggestionEntryMetadataDisplayeds");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "arrayWithCapacity:", objc_msgSend(v9, "count"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v34 = 0u;
      v35 = 0u;
      v32 = 0u;
      v33 = 0u;
      objc_msgSend((id)a1, "suggestionEntryMetadataDisplayeds");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v33;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v33 != v14)
              objc_enumerationMutation(v11);
            objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * i), "base64EncodedStringWithOptions:", 0);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "addObject:", v16);

          }
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
        }
        while (v13);
      }

      v17 = CFSTR("suggestionEntryMetadataDisplayed");
      goto LABEL_18;
    }
LABEL_17:
    objc_msgSend((id)a1, "suggestionEntryMetadataDisplayeds");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = CFSTR("suggestion_entry_metadata_displayed");
LABEL_18:
    objc_msgSend(v4, "setObject:forKey:", v10, v17);

  }
LABEL_19:
  if (objc_msgSend(*(id *)(a1 + 16), "count"))
  {
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 16), "count"));
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v19 = *(id *)(a1 + 16);
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v29;
      do
      {
        for (j = 0; j != v21; ++j)
        {
          if (*(_QWORD *)v29 != v22)
            objc_enumerationMutation(v19);
          v24 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * j);
          if ((a2 & 1) != 0)
            objc_msgSend(v24, "jsonRepresentation");
          else
            objc_msgSend(v24, "dictionaryRepresentation", (_QWORD)v28);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "addObject:", v25, (_QWORD)v28);

        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
      }
      while (v21);
    }

    if (a2)
      v26 = CFSTR("mapsSearchResult");
    else
      v26 = CFSTR("maps_search_result");
    objc_msgSend(v4, "setObject:forKey:", v18, v26, (_QWORD)v28);

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOMapsServerMetadata _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOMapsServerMetadata)initWithDictionary:(id)a3
{
  return (GEOMapsServerMetadata *)-[GEOMapsServerMetadata _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  uint64_t v25;
  GEOMapsSearchResult *v26;
  uint64_t v27;
  void *v28;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
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
        v6 = CFSTR("suggestionEntryMetadataTappedOn");
      else
        v6 = CFSTR("suggestion_entry_metadata_tapped_on");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v7, 0);
        objc_msgSend(a1, "setSuggestionEntryMetadataTappedOn:", v8);

      }
      if (a3)
        v9 = CFSTR("suggestionEntryMetadataDisplayed");
      else
        v9 = CFSTR("suggestion_entry_metadata_displayed");
      objc_msgSend(v5, "objectForKeyedSubscript:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v30 = v5;
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v37 = 0u;
        v38 = 0u;
        v35 = 0u;
        v36 = 0u;
        v11 = v10;
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v36;
          do
          {
            for (i = 0; i != v13; ++i)
            {
              if (*(_QWORD *)v36 != v14)
                objc_enumerationMutation(v11);
              v16 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v16, 0);
                objc_msgSend(a1, "addSuggestionEntryMetadataDisplayed:", v17);

              }
            }
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
          }
          while (v13);
        }

        v5 = v30;
      }

      if (a3)
        v18 = CFSTR("mapsSearchResult");
      else
        v18 = CFSTR("maps_search_result");
      objc_msgSend(v5, "objectForKeyedSubscript:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v33 = 0u;
        v34 = 0u;
        v31 = 0u;
        v32 = 0u;
        v20 = v19;
        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
        if (v21)
        {
          v22 = v21;
          v23 = *(_QWORD *)v32;
          do
          {
            for (j = 0; j != v22; ++j)
            {
              if (*(_QWORD *)v32 != v23)
                objc_enumerationMutation(v20);
              v25 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * j);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v26 = [GEOMapsSearchResult alloc];
                if ((a3 & 1) != 0)
                  v27 = -[GEOMapsSearchResult initWithJSON:](v26, "initWithJSON:", v25);
                else
                  v27 = -[GEOMapsSearchResult initWithDictionary:](v26, "initWithDictionary:", v25);
                v28 = (void *)v27;
                objc_msgSend(a1, "addMapsSearchResult:", v27);

              }
            }
            v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
          }
          while (v22);
        }

        v5 = v30;
      }

    }
  }

  return a1;
}

- (GEOMapsServerMetadata)initWithJSON:(id)a3
{
  return (GEOMapsServerMetadata *)-[GEOMapsServerMetadata _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_595;
    else
      v8 = (int *)&readAll__nonRecursiveTag_596;
    GEOMapsServerMetadataReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEOMapsServerMetadataCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOMapsServerMetadataIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOMapsServerMetadataReadAllFrom((uint64_t)self, a3, 0);
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
  if (self->_reader && (_GEOMapsServerMetadataIsDirty((uint64_t)self) & 1) == 0)
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
    -[GEOMapsServerMetadata readAll:](self, "readAll:", 0);
    if (self->_suggestionEntryMetadataTappedOn)
      PBDataWriterWriteDataField();
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v6 = self->_suggestionEntryMetadataDisplayeds;
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
          PBDataWriterWriteDataField();
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
    v10 = self->_mapsSearchResults;
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
  uint64_t i;
  BOOL v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  -[GEOMapsServerMetadata _readMapsSearchResults]((uint64_t)self);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_mapsSearchResults;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "hasGreenTeaWithValue:", v3, (_QWORD)v12) & 1) != 0)
        {
          v10 = 1;
          goto LABEL_11;
        }
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v7)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
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
  -[GEOMapsServerMetadata readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v12 + 1, self->_reader);
  *((_DWORD *)v12 + 10) = self->_readerMarkPos;
  *((_DWORD *)v12 + 11) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_suggestionEntryMetadataTappedOn)
    objc_msgSend(v12, "setSuggestionEntryMetadataTappedOn:");
  if (-[GEOMapsServerMetadata suggestionEntryMetadataDisplayedsCount](self, "suggestionEntryMetadataDisplayedsCount"))
  {
    objc_msgSend(v12, "clearSuggestionEntryMetadataDisplayeds");
    v4 = -[GEOMapsServerMetadata suggestionEntryMetadataDisplayedsCount](self, "suggestionEntryMetadataDisplayedsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[GEOMapsServerMetadata suggestionEntryMetadataDisplayedAtIndex:](self, "suggestionEntryMetadataDisplayedAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addSuggestionEntryMetadataDisplayed:", v7);

      }
    }
  }
  if (-[GEOMapsServerMetadata mapsSearchResultsCount](self, "mapsSearchResultsCount"))
  {
    objc_msgSend(v12, "clearMapsSearchResults");
    v8 = -[GEOMapsServerMetadata mapsSearchResultsCount](self, "mapsSearchResultsCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
      {
        -[GEOMapsServerMetadata mapsSearchResultAtIndex:](self, "mapsSearchResultAtIndex:", j);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addMapsSearchResult:", v11);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  PBDataReader *reader;
  PBDataReader *v7;
  uint64_t v8;
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
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
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
      GEOMapsServerMetadataReadAllFrom((uint64_t)v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return v5;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOMapsServerMetadata readAll:](self, "readAll:", 0);
  v8 = -[NSData copyWithZone:](self->_suggestionEntryMetadataTappedOn, "copyWithZone:", a3);
  v9 = (void *)v5[4];
  v5[4] = v8;

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v10 = self->_suggestionEntryMetadataDisplayeds;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v26;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v26 != v12)
          objc_enumerationMutation(v10);
        v14 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v13), "copyWithZone:", a3);
        objc_msgSend(v5, "addSuggestionEntryMetadataDisplayed:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v11);
  }

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v15 = self->_mapsSearchResults;
  v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v22;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v22 != v17)
          objc_enumerationMutation(v15);
        v19 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v18), "copyWithZone:", a3, (_QWORD)v21);
        objc_msgSend(v5, "addMapsSearchResult:", v19);

        ++v18;
      }
      while (v16 != v18);
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v16);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSData *suggestionEntryMetadataTappedOn;
  NSMutableArray *suggestionEntryMetadataDisplayeds;
  NSMutableArray *mapsSearchResults;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((-[GEOMapsServerMetadata readAll:](self, "readAll:", 1),
         objc_msgSend(v4, "readAll:", 1),
         suggestionEntryMetadataTappedOn = self->_suggestionEntryMetadataTappedOn,
         !((unint64_t)suggestionEntryMetadataTappedOn | v4[4]))
     || -[NSData isEqual:](suggestionEntryMetadataTappedOn, "isEqual:"))
    && ((suggestionEntryMetadataDisplayeds = self->_suggestionEntryMetadataDisplayeds,
         !((unint64_t)suggestionEntryMetadataDisplayeds | v4[3]))
     || -[NSMutableArray isEqual:](suggestionEntryMetadataDisplayeds, "isEqual:")))
  {
    mapsSearchResults = self->_mapsSearchResults;
    if ((unint64_t)mapsSearchResults | v4[2])
      v8 = -[NSMutableArray isEqual:](mapsSearchResults, "isEqual:");
    else
      v8 = 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;

  -[GEOMapsServerMetadata readAll:](self, "readAll:", 1);
  v3 = -[NSData hash](self->_suggestionEntryMetadataTappedOn, "hash");
  v4 = -[NSMutableArray hash](self->_suggestionEntryMetadataDisplayeds, "hash") ^ v3;
  return v4 ^ -[NSMutableArray hash](self->_mapsSearchResults, "hash");
}

- (void)mergeFrom:(id)a3
{
  id *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
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
  v4 = (id *)a3;
  objc_msgSend(v4, "readAll:", 0);
  if (v4[4])
    -[GEOMapsServerMetadata setSuggestionEntryMetadataTappedOn:](self, "setSuggestionEntryMetadataTappedOn:");
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = v4[3];
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        -[GEOMapsServerMetadata addSuggestionEntryMetadataDisplayed:](self, "addSuggestionEntryMetadataDisplayed:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v7);
  }

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v10 = v4[2];
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        -[GEOMapsServerMetadata addMapsSearchResult:](self, "addMapsSearchResult:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * j), (_QWORD)v15);
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v12);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestionEntryMetadataTappedOn, 0);
  objc_storeStrong((id *)&self->_suggestionEntryMetadataDisplayeds, 0);
  objc_storeStrong((id *)&self->_mapsSearchResults, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
