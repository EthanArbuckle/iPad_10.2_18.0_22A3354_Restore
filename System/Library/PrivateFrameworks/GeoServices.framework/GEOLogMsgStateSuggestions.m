@implementation GEOLogMsgStateSuggestions

- (GEOLogMsgStateSuggestions)init
{
  GEOLogMsgStateSuggestions *v2;
  GEOLogMsgStateSuggestions *v3;
  GEOLogMsgStateSuggestions *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOLogMsgStateSuggestions;
  v2 = -[GEOLogMsgStateSuggestions init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOLogMsgStateSuggestions)initWithData:(id)a3
{
  GEOLogMsgStateSuggestions *v3;
  GEOLogMsgStateSuggestions *v4;
  GEOLogMsgStateSuggestions *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOLogMsgStateSuggestions;
  v3 = -[GEOLogMsgStateSuggestions initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readSearchString
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if ((*(_BYTE *)(a1 + 56) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateSuggestionsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSearchString_tags_4);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (BOOL)hasSearchString
{
  -[GEOLogMsgStateSuggestions _readSearchString]((uint64_t)self);
  return self->_searchString != 0;
}

- (NSString)searchString
{
  -[GEOLogMsgStateSuggestions _readSearchString]((uint64_t)self);
  return self->_searchString;
}

- (void)setSearchString:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x30u;
  objc_storeStrong((id *)&self->_searchString, a3);
}

- (void)_readDisplayedResults
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if ((*(_BYTE *)(a1 + 56) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateSuggestionsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDisplayedResults_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (NSMutableArray)displayedResults
{
  -[GEOLogMsgStateSuggestions _readDisplayedResults]((uint64_t)self);
  return self->_displayedResults;
}

- (void)setDisplayedResults:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *displayedResults;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x20u;
  displayedResults = self->_displayedResults;
  self->_displayedResults = v4;

}

- (void)clearDisplayedResults
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 8u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x20u;
  -[NSMutableArray removeAllObjects](self->_displayedResults, "removeAllObjects");
}

- (void)addDisplayedResult:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOLogMsgStateSuggestions _readDisplayedResults]((uint64_t)self);
  -[GEOLogMsgStateSuggestions _addNoFlagsDisplayedResult:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x20u;
}

- (void)_addNoFlagsDisplayedResult:(uint64_t)a1
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

- (unint64_t)displayedResultsCount
{
  -[GEOLogMsgStateSuggestions _readDisplayedResults]((uint64_t)self);
  return -[NSMutableArray count](self->_displayedResults, "count");
}

- (id)displayedResultAtIndex:(unint64_t)a3
{
  -[GEOLogMsgStateSuggestions _readDisplayedResults]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_displayedResults, "objectAtIndex:", a3);
}

+ (Class)displayedResultType
{
  return (Class)objc_opt_class();
}

- (int)selectedIndex
{
  return self->_selectedIndex;
}

- (void)setSelectedIndex:(int)a3
{
  *(_BYTE *)&self->_flags |= 0x24u;
  self->_selectedIndex = a3;
}

- (void)setHasSelectedIndex:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 36;
  else
    v3 = 32;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasSelectedIndex
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (int)searchFieldType
{
  os_unfair_lock_s *p_readerLock;
  char flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 2) != 0)
    return self->_searchFieldType;
  else
    return 0;
}

- (void)setSearchFieldType:(int)a3
{
  *(_BYTE *)&self->_flags |= 0x22u;
  self->_searchFieldType = a3;
}

- (void)setHasSearchFieldType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 34;
  else
    v3 = 32;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasSearchFieldType
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (id)searchFieldTypeAsString:(int)a3
{
  if (a3 < 4)
    return off_1E1C23070[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsSearchFieldType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SEARCH_FIELD_TYPE_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SEARCH_FIELD_TYPE_NORMAL")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SEARCH_FIELD_TYPE_DIRECTIONS_START")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("SEARCH_FIELD_TYPE_DIRECTIONS_END")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)acSequenceNumber
{
  return self->_acSequenceNumber;
}

- (void)setAcSequenceNumber:(int)a3
{
  *(_BYTE *)&self->_flags |= 0x21u;
  self->_acSequenceNumber = a3;
}

- (void)setHasAcSequenceNumber:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3 | 0x20;
}

- (BOOL)hasAcSequenceNumber
{
  return *(_BYTE *)&self->_flags & 1;
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
  v8.super_class = (Class)GEOLogMsgStateSuggestions;
  -[GEOLogMsgStateSuggestions description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOLogMsgStateSuggestions dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgStateSuggestions _dictionaryRepresentation:]((uint64_t)self, 0);
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
  const __CFString *v15;
  char v16;
  void *v17;
  const __CFString *v18;
  uint64_t v19;
  __CFString *v20;
  const __CFString *v21;
  void *v22;
  const __CFString *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    objc_msgSend((id)a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)a1, "searchString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      if (a2)
        v6 = CFSTR("searchString");
      else
        v6 = CFSTR("search_string");
      objc_msgSend(v4, "setObject:forKey:", v5, v6);
    }

    if (objc_msgSend(*(id *)(a1 + 16), "count"))
    {
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 16), "count"));
      v25 = 0u;
      v26 = 0u;
      v27 = 0u;
      v28 = 0u;
      v8 = *(id *)(a1 + 16);
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v26;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v26 != v11)
              objc_enumerationMutation(v8);
            v13 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
            if ((a2 & 1) != 0)
              objc_msgSend(v13, "jsonRepresentation");
            else
              objc_msgSend(v13, "dictionaryRepresentation");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "addObject:", v14);

          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
        }
        while (v10);
      }

      if (a2)
        v15 = CFSTR("displayedResult");
      else
        v15 = CFSTR("displayed_result");
      objc_msgSend(v4, "setObject:forKey:", v7, v15);

    }
    v16 = *(_BYTE *)(a1 + 56);
    if ((v16 & 4) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 52));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
        v18 = CFSTR("selectedIndex");
      else
        v18 = CFSTR("selected_index");
      objc_msgSend(v4, "setObject:forKey:", v17, v18);

      v16 = *(_BYTE *)(a1 + 56);
      if ((v16 & 2) == 0)
      {
LABEL_24:
        if ((v16 & 1) == 0)
          return v4;
LABEL_37:
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 44));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (a2)
          v23 = CFSTR("acSequenceNumber");
        else
          v23 = CFSTR("ac_sequence_number");
        objc_msgSend(v4, "setObject:forKey:", v22, v23);

        return v4;
      }
    }
    else if ((*(_BYTE *)(a1 + 56) & 2) == 0)
    {
      goto LABEL_24;
    }
    v19 = *(int *)(a1 + 48);
    if (v19 >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 48));
      v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v20 = off_1E1C23070[v19];
    }
    if (a2)
      v21 = CFSTR("searchFieldType");
    else
      v21 = CFSTR("search_field_type");
    objc_msgSend(v4, "setObject:forKey:", v20, v21);

    if ((*(_BYTE *)(a1 + 56) & 1) == 0)
      return v4;
    goto LABEL_37;
  }
  return 0;
}

- (id)jsonRepresentation
{
  return -[GEOLogMsgStateSuggestions _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLogMsgStateSuggestions)initWithDictionary:(id)a3
{
  return (GEOLogMsgStateSuggestions *)-[GEOLogMsgStateSuggestions _initWithDictionary:isJSON:](self, a3, 0);
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
  GEOAutoCompleteResultInfo *v17;
  uint64_t v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  id v24;
  uint64_t v25;
  const __CFString *v26;
  void *v27;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (!a1)
    goto LABEL_53;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_53;
  if (a3)
    v6 = CFSTR("searchString");
  else
    v6 = CFSTR("search_string");
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(a1, "setSearchString:", v8);

  }
  if (a3)
    v9 = CFSTR("displayedResult");
  else
    v9 = CFSTR("displayed_result");
  objc_msgSend(v5, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v29 = v5;
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v11 = v10;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v31 != v14)
            objc_enumerationMutation(v11);
          v16 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v17 = [GEOAutoCompleteResultInfo alloc];
            if ((a3 & 1) != 0)
              v18 = -[GEOAutoCompleteResultInfo initWithJSON:](v17, "initWithJSON:", v16);
            else
              v18 = -[GEOAutoCompleteResultInfo initWithDictionary:](v17, "initWithDictionary:", v16);
            v19 = (void *)v18;
            objc_msgSend(a1, "addDisplayedResult:", v18);

          }
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      }
      while (v13);
    }

    v5 = v29;
  }

  if (a3)
    v20 = CFSTR("selectedIndex");
  else
    v20 = CFSTR("selected_index");
  objc_msgSend(v5, "objectForKeyedSubscript:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setSelectedIndex:", objc_msgSend(v21, "intValue"));

  if (a3)
    v22 = CFSTR("searchFieldType");
  else
    v22 = CFSTR("search_field_type");
  objc_msgSend(v5, "objectForKeyedSubscript:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v24 = v23;
    if ((objc_msgSend(v24, "isEqualToString:", CFSTR("SEARCH_FIELD_TYPE_UNKNOWN")) & 1) != 0)
    {
      v25 = 0;
    }
    else if ((objc_msgSend(v24, "isEqualToString:", CFSTR("SEARCH_FIELD_TYPE_NORMAL")) & 1) != 0)
    {
      v25 = 1;
    }
    else if ((objc_msgSend(v24, "isEqualToString:", CFSTR("SEARCH_FIELD_TYPE_DIRECTIONS_START")) & 1) != 0)
    {
      v25 = 2;
    }
    else if (objc_msgSend(v24, "isEqualToString:", CFSTR("SEARCH_FIELD_TYPE_DIRECTIONS_END")))
    {
      v25 = 3;
    }
    else
    {
      v25 = 0;
    }

    goto LABEL_46;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v25 = objc_msgSend(v23, "intValue");
LABEL_46:
    objc_msgSend(a1, "setSearchFieldType:", v25);
  }

  if (a3)
    v26 = CFSTR("acSequenceNumber");
  else
    v26 = CFSTR("ac_sequence_number");
  objc_msgSend(v5, "objectForKeyedSubscript:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setAcSequenceNumber:", objc_msgSend(v27, "intValue"));

LABEL_53:
  return a1;
}

- (GEOLogMsgStateSuggestions)initWithJSON:(id)a3
{
  return (GEOLogMsgStateSuggestions *)-[GEOLogMsgStateSuggestions _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_7834;
    else
      v8 = (int *)&readAll__nonRecursiveTag_7835;
    GEOLogMsgStateSuggestionsReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEOLogMsgStateSuggestionsCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgStateSuggestionsIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgStateSuggestionsReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  char flags;
  PBDataReader *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_BYTE *)&self->_flags & 0x38) == 0))
  {
    v11 = self->_reader;
    objc_sync_enter(v11);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v12);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v11);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOLogMsgStateSuggestions readAll:](self, "readAll:", 0);
    if (self->_searchString)
      PBDataWriterWriteStringField();
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v6 = self->_displayedResults;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v6);
          PBDataWriterWriteSubmessage();
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v7);
    }

    flags = (char)self->_flags;
    if ((flags & 4) != 0)
    {
      PBDataWriterWriteInt32Field();
      flags = (char)self->_flags;
    }
    if ((flags & 2) != 0)
    {
      PBDataWriterWriteInt32Field();
      flags = (char)self->_flags;
    }
    if ((flags & 1) != 0)
      PBDataWriterWriteInt32Field();
  }

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  char flags;
  id *v9;

  v9 = (id *)a3;
  -[GEOLogMsgStateSuggestions readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v9 + 1, self->_reader);
  *((_DWORD *)v9 + 8) = self->_readerMarkPos;
  *((_DWORD *)v9 + 9) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_searchString)
    objc_msgSend(v9, "setSearchString:");
  if (-[GEOLogMsgStateSuggestions displayedResultsCount](self, "displayedResultsCount"))
  {
    objc_msgSend(v9, "clearDisplayedResults");
    v4 = -[GEOLogMsgStateSuggestions displayedResultsCount](self, "displayedResultsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[GEOLogMsgStateSuggestions displayedResultAtIndex:](self, "displayedResultAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addDisplayedResult:", v7);

      }
    }
  }
  flags = (char)self->_flags;
  if ((flags & 4) == 0)
  {
    if ((*(_BYTE *)&self->_flags & 2) == 0)
      goto LABEL_9;
LABEL_13:
    *((_DWORD *)v9 + 12) = self->_searchFieldType;
    *((_BYTE *)v9 + 56) |= 2u;
    if ((*(_BYTE *)&self->_flags & 1) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
  *((_DWORD *)v9 + 13) = self->_selectedIndex;
  *((_BYTE *)v9 + 56) |= 4u;
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
    goto LABEL_13;
LABEL_9:
  if ((flags & 1) != 0)
  {
LABEL_10:
    *((_DWORD *)v9 + 11) = self->_acSequenceNumber;
    *((_BYTE *)v9 + 56) |= 1u;
  }
LABEL_11:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  uint64_t v9;
  void *v10;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  char flags;
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
  if (!reader)
  {
LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOLogMsgStateSuggestions readAll:](self, "readAll:", 0);
    v9 = -[NSString copyWithZone:](self->_searchString, "copyWithZone:", a3);
    v10 = *(void **)(v5 + 24);
    *(_QWORD *)(v5 + 24) = v9;

    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v11 = self->_displayedResults;
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
          objc_msgSend((id)v5, "addDisplayedResult:", v15);

        }
        v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v12);
    }

    flags = (char)self->_flags;
    if ((flags & 4) != 0)
    {
      *(_DWORD *)(v5 + 52) = self->_selectedIndex;
      *(_BYTE *)(v5 + 56) |= 4u;
      flags = (char)self->_flags;
      if ((flags & 2) == 0)
      {
LABEL_14:
        if ((flags & 1) == 0)
          return (id)v5;
LABEL_15:
        *(_DWORD *)(v5 + 44) = self->_acSequenceNumber;
        *(_BYTE *)(v5 + 56) |= 1u;
        return (id)v5;
      }
    }
    else if ((*(_BYTE *)&self->_flags & 2) == 0)
    {
      goto LABEL_14;
    }
    *(_DWORD *)(v5 + 48) = self->_searchFieldType;
    *(_BYTE *)(v5 + 56) |= 2u;
    if ((*(_BYTE *)&self->_flags & 1) == 0)
      return (id)v5;
    goto LABEL_15;
  }
  v7 = reader;
  objc_sync_enter(v7);
  if ((*(_BYTE *)&self->_flags & 0x20) != 0)
  {
    objc_sync_exit(v7);

    goto LABEL_5;
  }
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  GEOLogMsgStateSuggestionsReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  v8 = (id)v5;
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *searchString;
  NSMutableArray *displayedResults;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_20;
  -[GEOLogMsgStateSuggestions readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  searchString = self->_searchString;
  if ((unint64_t)searchString | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](searchString, "isEqual:"))
      goto LABEL_20;
  }
  displayedResults = self->_displayedResults;
  if ((unint64_t)displayedResults | *((_QWORD *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](displayedResults, "isEqual:"))
      goto LABEL_20;
  }
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 4) == 0 || self->_selectedIndex != *((_DWORD *)v4 + 13))
      goto LABEL_20;
  }
  else if ((*((_BYTE *)v4 + 56) & 4) != 0)
  {
LABEL_20:
    v7 = 0;
    goto LABEL_21;
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 2) == 0 || self->_searchFieldType != *((_DWORD *)v4 + 12))
      goto LABEL_20;
  }
  else if ((*((_BYTE *)v4 + 56) & 2) != 0)
  {
    goto LABEL_20;
  }
  v7 = (*((_BYTE *)v4 + 56) & 1) == 0;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 1) == 0 || self->_acSequenceNumber != *((_DWORD *)v4 + 11))
      goto LABEL_20;
    v7 = 1;
  }
LABEL_21:

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  -[GEOLogMsgStateSuggestions readAll:](self, "readAll:", 1);
  v3 = -[NSString hash](self->_searchString, "hash");
  v4 = -[NSMutableArray hash](self->_displayedResults, "hash");
  if ((*(_BYTE *)&self->_flags & 4) == 0)
  {
    v5 = 0;
    if ((*(_BYTE *)&self->_flags & 2) != 0)
      goto LABEL_3;
LABEL_6:
    v6 = 0;
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      goto LABEL_4;
LABEL_7:
    v7 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7;
  }
  v5 = 2654435761 * self->_selectedIndex;
  if ((*(_BYTE *)&self->_flags & 2) == 0)
    goto LABEL_6;
LABEL_3:
  v6 = 2654435761 * self->_searchFieldType;
  if ((*(_BYTE *)&self->_flags & 1) == 0)
    goto LABEL_7;
LABEL_4:
  v7 = 2654435761 * self->_acSequenceNumber;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  char v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  if (*((_QWORD *)v4 + 3))
    -[GEOLogMsgStateSuggestions setSearchString:](self, "setSearchString:");
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = *((id *)v4 + 2);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        -[GEOLogMsgStateSuggestions addDisplayedResult:](self, "addDisplayedResult:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i), (_QWORD)v11);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  v10 = *((_BYTE *)v4 + 56);
  if ((v10 & 4) == 0)
  {
    if ((*((_BYTE *)v4 + 56) & 2) == 0)
      goto LABEL_12;
LABEL_16:
    self->_searchFieldType = *((_DWORD *)v4 + 12);
    *(_BYTE *)&self->_flags |= 2u;
    if ((*((_BYTE *)v4 + 56) & 1) == 0)
      goto LABEL_14;
    goto LABEL_13;
  }
  self->_selectedIndex = *((_DWORD *)v4 + 13);
  *(_BYTE *)&self->_flags |= 4u;
  v10 = *((_BYTE *)v4 + 56);
  if ((v10 & 2) != 0)
    goto LABEL_16;
LABEL_12:
  if ((v10 & 1) != 0)
  {
LABEL_13:
    self->_acSequenceNumber = *((_DWORD *)v4 + 11);
    *(_BYTE *)&self->_flags |= 1u;
  }
LABEL_14:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchString, 0);
  objc_storeStrong((id *)&self->_displayedResults, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
