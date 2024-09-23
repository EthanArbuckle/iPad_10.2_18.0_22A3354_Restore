@implementation GEOLogMsgEventClientACSuggestions

- (GEOLogMsgEventClientACSuggestions)init
{
  GEOLogMsgEventClientACSuggestions *v2;
  GEOLogMsgEventClientACSuggestions *v3;
  GEOLogMsgEventClientACSuggestions *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOLogMsgEventClientACSuggestions;
  v2 = -[GEOLogMsgEventClientACSuggestions init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOLogMsgEventClientACSuggestions)initWithData:(id)a3
{
  GEOLogMsgEventClientACSuggestions *v3;
  GEOLogMsgEventClientACSuggestions *v4;
  GEOLogMsgEventClientACSuggestions *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOLogMsgEventClientACSuggestions;
  v3 = -[GEOLogMsgEventClientACSuggestions initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readQuery
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_WORD *)(a1 + 88) & 0x1000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventClientACSuggestionsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readQuery_tags_6);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasQuery
{
  -[GEOLogMsgEventClientACSuggestions _readQuery]((uint64_t)self);
  return self->_query != 0;
}

- (NSString)query
{
  -[GEOLogMsgEventClientACSuggestions _readQuery]((uint64_t)self);
  return self->_query;
}

- (void)setQuery:(id)a3
{
  *(_WORD *)&self->_flags |= 0x3000u;
  objc_storeStrong((id *)&self->_query, a3);
}

- (void)_readQueryTokens
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_WORD *)(a1 + 88) & 0x800) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventClientACSuggestionsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readQueryTokens_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (NSMutableArray)queryTokens
{
  -[GEOLogMsgEventClientACSuggestions _readQueryTokens]((uint64_t)self);
  return self->_queryTokens;
}

- (void)setQueryTokens:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *queryTokens;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x800u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
  queryTokens = self->_queryTokens;
  self->_queryTokens = v4;

}

- (void)clearQueryTokens
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x800u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
  -[NSMutableArray removeAllObjects](self->_queryTokens, "removeAllObjects");
}

- (void)addQueryTokens:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOLogMsgEventClientACSuggestions _readQueryTokens]((uint64_t)self);
  -[GEOLogMsgEventClientACSuggestions _addNoFlagsQueryTokens:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x800u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
}

- (void)_addNoFlagsQueryTokens:(uint64_t)a1
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

- (unint64_t)queryTokensCount
{
  -[GEOLogMsgEventClientACSuggestions _readQueryTokens]((uint64_t)self);
  return -[NSMutableArray count](self->_queryTokens, "count");
}

- (id)queryTokensAtIndex:(unint64_t)a3
{
  -[GEOLogMsgEventClientACSuggestions _readQueryTokens]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_queryTokens, "objectAtIndex:", a3);
}

+ (Class)queryTokensType
{
  return (Class)objc_opt_class();
}

- (void)_readEntries
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_WORD *)(a1 + 88) & 0x400) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventClientACSuggestionsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readEntries_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (NSMutableArray)entries
{
  -[GEOLogMsgEventClientACSuggestions _readEntries]((uint64_t)self);
  return self->_entries;
}

- (void)setEntries:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *entries;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x400u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
  entries = self->_entries;
  self->_entries = v4;

}

- (void)clearEntries
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x400u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
  -[NSMutableArray removeAllObjects](self->_entries, "removeAllObjects");
}

- (void)addEntries:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOLogMsgEventClientACSuggestions _readEntries]((uint64_t)self);
  -[GEOLogMsgEventClientACSuggestions _addNoFlagsEntries:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x400u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
}

- (void)_addNoFlagsEntries:(uint64_t)a1
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

- (unint64_t)entriesCount
{
  -[GEOLogMsgEventClientACSuggestions _readEntries]((uint64_t)self);
  return -[NSMutableArray count](self->_entries, "count");
}

- (id)entriesAtIndex:(unint64_t)a3
{
  -[GEOLogMsgEventClientACSuggestions _readEntries]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_entries, "objectAtIndex:", a3);
}

+ (Class)entriesType
{
  return (Class)objc_opt_class();
}

- (int)selectedIndex
{
  os_unfair_lock_s *p_readerLock;
  __int16 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 8) != 0)
    return self->_selectedIndex;
  else
    return -1;
}

- (void)setSelectedIndex:(int)a3
{
  *(_WORD *)&self->_flags |= 0x2008u;
  self->_selectedIndex = a3;
}

- (void)setHasSelectedIndex:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8200;
  else
    v3 = 0x2000;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFF7 | v3;
}

- (BOOL)hasSelectedIndex
{
  return (*(_WORD *)&self->_flags >> 3) & 1;
}

- (int)trigger
{
  os_unfair_lock_s *p_readerLock;
  __int16 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 0x20) != 0)
    return self->_trigger;
  else
    return 0;
}

- (void)setTrigger:(int)a3
{
  *(_WORD *)&self->_flags |= 0x2020u;
  self->_trigger = a3;
}

- (void)setHasTrigger:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8224;
  else
    v3 = 0x2000;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFDF | v3;
}

- (BOOL)hasTrigger
{
  return (*(_WORD *)&self->_flags >> 5) & 1;
}

- (id)triggerAsString:(int)a3
{
  if (a3 < 4)
    return *((id *)&off_1E1C14A78 + a3);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsTrigger:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AC_LOG_TRIGGER_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KEYPRESS")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RESPONSE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("SUPPRESS")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)keypressStatus
{
  os_unfair_lock_s *p_readerLock;
  __int16 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 4) != 0)
    return self->_keypressStatus;
  else
    return 0;
}

- (void)setKeypressStatus:(int)a3
{
  *(_WORD *)&self->_flags |= 0x2004u;
  self->_keypressStatus = a3;
}

- (void)setHasKeypressStatus:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8196;
  else
    v3 = 0x2000;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFB | v3;
}

- (BOOL)hasKeypressStatus
{
  return (*(_WORD *)&self->_flags >> 2) & 1;
}

- (id)keypressStatusAsString:(int)a3
{
  if (a3 < 5)
    return *((id *)&off_1E1C14A98 + a3);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsKeypressStatus:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KEYPRESS_STATUS_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SUBMITTED")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("THROTTLED")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BATCHED")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("OMITTED")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)withinSectionSelectedIndex
{
  os_unfair_lock_s *p_readerLock;
  __int16 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 0x40) != 0)
    return self->_withinSectionSelectedIndex;
  else
    return -1;
}

- (void)setWithinSectionSelectedIndex:(int)a3
{
  *(_WORD *)&self->_flags |= 0x2040u;
  self->_withinSectionSelectedIndex = a3;
}

- (void)setHasWithinSectionSelectedIndex:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8256;
  else
    v3 = 0x2000;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFBF | v3;
}

- (BOOL)hasWithinSectionSelectedIndex
{
  return (*(_WORD *)&self->_flags >> 6) & 1;
}

- (int)selectedSectionIndex
{
  os_unfair_lock_s *p_readerLock;
  __int16 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 0x10) != 0)
    return self->_selectedSectionIndex;
  else
    return -1;
}

- (void)setSelectedSectionIndex:(int)a3
{
  *(_WORD *)&self->_flags |= 0x2010u;
  self->_selectedSectionIndex = a3;
}

- (void)setHasSelectedSectionIndex:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8208;
  else
    v3 = 0x2000;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFEF | v3;
}

- (BOOL)hasSelectedSectionIndex
{
  return (*(_WORD *)&self->_flags >> 4) & 1;
}

- (BOOL)isRetainedQuery
{
  return self->_isRetainedQuery;
}

- (void)setIsRetainedQuery:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x2100u;
  self->_isRetainedQuery = a3;
}

- (void)setHasIsRetainedQuery:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8448;
  else
    v3 = 0x2000;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFEFF | v3;
}

- (BOOL)hasIsRetainedQuery
{
  return HIBYTE(*(_WORD *)&self->_flags) & 1;
}

- (BOOL)isRerankerTriggered
{
  return self->_isRerankerTriggered;
}

- (void)setIsRerankerTriggered:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x2080u;
  self->_isRerankerTriggered = a3;
}

- (void)setHasIsRerankerTriggered:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8320;
  else
    v3 = 0x2000;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFF7F | v3;
}

- (BOOL)hasIsRerankerTriggered
{
  return (*(_WORD *)&self->_flags >> 7) & 1;
}

- (int64_t)overallLatencyInMs
{
  return self->_overallLatencyInMs;
}

- (void)setOverallLatencyInMs:(int64_t)a3
{
  *(_WORD *)&self->_flags |= 0x2001u;
  self->_overallLatencyInMs = a3;
}

- (void)setHasOverallLatencyInMs:(BOOL)a3
{
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFE | a3 | 0x2000;
}

- (BOOL)hasOverallLatencyInMs
{
  return *(_WORD *)&self->_flags & 1;
}

- (BOOL)shouldDifferentiateClientAndServerResults
{
  return self->_shouldDifferentiateClientAndServerResults;
}

- (void)setShouldDifferentiateClientAndServerResults:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x2200u;
  self->_shouldDifferentiateClientAndServerResults = a3;
}

- (void)setHasShouldDifferentiateClientAndServerResults:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8704;
  else
    v3 = 0x2000;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFDFF | v3;
}

- (BOOL)hasShouldDifferentiateClientAndServerResults
{
  return (*(_WORD *)&self->_flags >> 9) & 1;
}

- (unsigned)autocompleteSequenceNumber
{
  return self->_autocompleteSequenceNumber;
}

- (void)setAutocompleteSequenceNumber:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x2002u;
  self->_autocompleteSequenceNumber = a3;
}

- (void)setHasAutocompleteSequenceNumber:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8194;
  else
    v3 = 0x2000;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasAutocompleteSequenceNumber
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
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
  v8.super_class = (Class)GEOLogMsgEventClientACSuggestions;
  -[GEOLogMsgEventClientACSuggestions description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOLogMsgEventClientACSuggestions dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgEventClientACSuggestions _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  __int16 v16;
  void *v17;
  const __CFString *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  const __CFString *v27;
  void *v28;
  const __CFString *v29;
  void *v30;
  const __CFString *v31;
  void *v32;
  const __CFString *v33;
  void *v34;
  const __CFString *v35;
  void *v36;
  const __CFString *v37;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    objc_msgSend((id)a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)a1, "query");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("query"));

    if (*(_QWORD *)(a1 + 32))
    {
      objc_msgSend((id)a1, "queryTokens");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
        v7 = CFSTR("queryTokens");
      else
        v7 = CFSTR("query_tokens");
      objc_msgSend(v4, "setObject:forKey:", v6, v7);

    }
    if (objc_msgSend(*(id *)(a1 + 16), "count"))
    {
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 16), "count"));
      v39 = 0u;
      v40 = 0u;
      v41 = 0u;
      v42 = 0u;
      v9 = *(id *)(a1 + 16);
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v40;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v40 != v12)
              objc_enumerationMutation(v9);
            v14 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
            if ((a2 & 1) != 0)
              objc_msgSend(v14, "jsonRepresentation");
            else
              objc_msgSend(v14, "dictionaryRepresentation");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "addObject:", v15);

          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
        }
        while (v11);
      }

      objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("entries"));
    }
    v16 = *(_WORD *)(a1 + 88);
    if ((v16 & 8) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 68));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
        v18 = CFSTR("selectedIndex");
      else
        v18 = CFSTR("selected_index");
      objc_msgSend(v4, "setObject:forKey:", v17, v18);

      v16 = *(_WORD *)(a1 + 88);
      if ((v16 & 0x20) == 0)
      {
LABEL_23:
        if ((v16 & 4) == 0)
          goto LABEL_24;
        goto LABEL_40;
      }
    }
    else if ((v16 & 0x20) == 0)
    {
      goto LABEL_23;
    }
    v19 = *(int *)(a1 + 76);
    if (v19 >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 76));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v20 = (void *)*((_QWORD *)&off_1E1C14A78 + v19);
    }
    objc_msgSend(v4, "setObject:forKey:", v20, CFSTR("trigger"));

    v16 = *(_WORD *)(a1 + 88);
    if ((v16 & 4) == 0)
    {
LABEL_24:
      if ((v16 & 0x40) == 0)
        goto LABEL_25;
      goto LABEL_47;
    }
LABEL_40:
    v21 = *(int *)(a1 + 64);
    if (v21 >= 5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 64));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v22 = (void *)*((_QWORD *)&off_1E1C14A98 + v21);
    }
    if (a2)
      v23 = CFSTR("keypressStatus");
    else
      v23 = CFSTR("keypress_status");
    objc_msgSend(v4, "setObject:forKey:", v22, v23);

    v16 = *(_WORD *)(a1 + 88);
    if ((v16 & 0x40) == 0)
    {
LABEL_25:
      if ((v16 & 0x10) == 0)
        goto LABEL_26;
      goto LABEL_51;
    }
LABEL_47:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 80));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v25 = CFSTR("withinSectionSelectedIndex");
    else
      v25 = CFSTR("within_section_selected_index");
    objc_msgSend(v4, "setObject:forKey:", v24, v25);

    v16 = *(_WORD *)(a1 + 88);
    if ((v16 & 0x10) == 0)
    {
LABEL_26:
      if ((v16 & 0x100) == 0)
        goto LABEL_27;
      goto LABEL_55;
    }
LABEL_51:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 72));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v27 = CFSTR("selectedSectionIndex");
    else
      v27 = CFSTR("selected_section_index");
    objc_msgSend(v4, "setObject:forKey:", v26, v27);

    v16 = *(_WORD *)(a1 + 88);
    if ((v16 & 0x100) == 0)
    {
LABEL_27:
      if ((v16 & 0x80) == 0)
        goto LABEL_28;
      goto LABEL_59;
    }
LABEL_55:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 85));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v29 = CFSTR("isRetainedQuery");
    else
      v29 = CFSTR("is_retained_query");
    objc_msgSend(v4, "setObject:forKey:", v28, v29);

    v16 = *(_WORD *)(a1 + 88);
    if ((v16 & 0x80) == 0)
    {
LABEL_28:
      if ((v16 & 1) == 0)
        goto LABEL_29;
      goto LABEL_63;
    }
LABEL_59:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 84));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v31 = CFSTR("isRerankerTriggered");
    else
      v31 = CFSTR("is_reranker_triggered");
    objc_msgSend(v4, "setObject:forKey:", v30, v31);

    v16 = *(_WORD *)(a1 + 88);
    if ((v16 & 1) == 0)
    {
LABEL_29:
      if ((v16 & 0x200) == 0)
        goto LABEL_30;
      goto LABEL_67;
    }
LABEL_63:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(a1 + 24));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v33 = CFSTR("overallLatencyInMs");
    else
      v33 = CFSTR("overall_latency_in_ms");
    objc_msgSend(v4, "setObject:forKey:", v32, v33);

    v16 = *(_WORD *)(a1 + 88);
    if ((v16 & 0x200) == 0)
    {
LABEL_30:
      if ((v16 & 2) == 0)
        return v4;
LABEL_71:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 60));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
        v37 = CFSTR("autocompleteSequenceNumber");
      else
        v37 = CFSTR("autocomplete_sequence_number");
      objc_msgSend(v4, "setObject:forKey:", v36, v37);

      return v4;
    }
LABEL_67:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 86));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v35 = CFSTR("shouldDifferentiateClientAndServerResults");
    else
      v35 = CFSTR("should_differentiate_client_and_server_results");
    objc_msgSend(v4, "setObject:forKey:", v34, v35);

    if ((*(_WORD *)(a1 + 88) & 2) == 0)
      return v4;
    goto LABEL_71;
  }
  return 0;
}

- (id)jsonRepresentation
{
  return -[GEOLogMsgEventClientACSuggestions _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLogMsgEventClientACSuggestions)initWithDictionary:(id)a3
{
  return (GEOLogMsgEventClientACSuggestions *)-[GEOLogMsgEventClientACSuggestions _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
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
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  uint64_t v23;
  GEOClientACSuggestionEntry *v24;
  uint64_t v25;
  void *v26;
  const __CFString *v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  const __CFString *v32;
  void *v33;
  id v34;
  uint64_t v35;
  const __CFString *v36;
  void *v37;
  const __CFString *v38;
  void *v39;
  const __CFString *v40;
  void *v41;
  const __CFString *v42;
  void *v43;
  const __CFString *v44;
  void *v45;
  const __CFString *v46;
  void *v47;
  const __CFString *v48;
  void *v49;
  void *v51;
  id v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _BYTE v61[128];
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (!a1)
    goto LABEL_107;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_107;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("query"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(a1, "setQuery:", v7);

  }
  if (a3)
    v8 = CFSTR("queryTokens");
  else
    v8 = CFSTR("query_tokens");
  objc_msgSend(v5, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v52 = v5;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v59 = 0u;
    v60 = 0u;
    v57 = 0u;
    v58 = 0u;
    v10 = v9;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v57, v62, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v58;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v58 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v16 = (void *)objc_msgSend(v15, "copy");
            objc_msgSend(a1, "addQueryTokens:", v16);

          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v57, v62, 16);
      }
      while (v12);
    }

    v5 = v52;
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("entries"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    v51 = v17;
    v18 = v17;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v53, v61, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v54;
      do
      {
        for (j = 0; j != v20; ++j)
        {
          if (*(_QWORD *)v54 != v21)
            objc_enumerationMutation(v18);
          v23 = *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * j);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v24 = [GEOClientACSuggestionEntry alloc];
            if ((a3 & 1) != 0)
              v25 = -[GEOClientACSuggestionEntry initWithJSON:](v24, "initWithJSON:", v23);
            else
              v25 = -[GEOClientACSuggestionEntry initWithDictionary:](v24, "initWithDictionary:", v23);
            v26 = (void *)v25;
            objc_msgSend(a1, "addEntries:", v25, v51);

          }
        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v53, v61, 16);
      }
      while (v20);
    }

    v17 = v51;
    v5 = v52;
  }

  if (a3)
    v27 = CFSTR("selectedIndex");
  else
    v27 = CFSTR("selected_index");
  objc_msgSend(v5, "objectForKeyedSubscript:", v27, v51);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setSelectedIndex:", objc_msgSend(v28, "intValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("trigger"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v30 = v29;
    if ((objc_msgSend(v30, "isEqualToString:", CFSTR("AC_LOG_TRIGGER_UNKNOWN")) & 1) != 0)
    {
      v31 = 0;
    }
    else if ((objc_msgSend(v30, "isEqualToString:", CFSTR("KEYPRESS")) & 1) != 0)
    {
      v31 = 1;
    }
    else if ((objc_msgSend(v30, "isEqualToString:", CFSTR("RESPONSE")) & 1) != 0)
    {
      v31 = 2;
    }
    else if (objc_msgSend(v30, "isEqualToString:", CFSTR("SUPPRESS")))
    {
      v31 = 3;
    }
    else
    {
      v31 = 0;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_52;
    v31 = objc_msgSend(v29, "intValue");
  }
  objc_msgSend(a1, "setTrigger:", v31);
LABEL_52:

  if (a3)
    v32 = CFSTR("keypressStatus");
  else
    v32 = CFSTR("keypress_status");
  objc_msgSend(v5, "objectForKeyedSubscript:", v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v34 = v33;
    if ((objc_msgSend(v34, "isEqualToString:", CFSTR("KEYPRESS_STATUS_UNKNOWN")) & 1) != 0)
    {
      v35 = 0;
    }
    else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("SUBMITTED")) & 1) != 0)
    {
      v35 = 1;
    }
    else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("THROTTLED")) & 1) != 0)
    {
      v35 = 2;
    }
    else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("BATCHED")) & 1) != 0)
    {
      v35 = 3;
    }
    else if (objc_msgSend(v34, "isEqualToString:", CFSTR("OMITTED")))
    {
      v35 = 4;
    }
    else
    {
      v35 = 0;
    }

    goto LABEL_70;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v35 = objc_msgSend(v33, "intValue");
LABEL_70:
    objc_msgSend(a1, "setKeypressStatus:", v35);
  }

  if (a3)
    v36 = CFSTR("withinSectionSelectedIndex");
  else
    v36 = CFSTR("within_section_selected_index");
  objc_msgSend(v5, "objectForKeyedSubscript:", v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setWithinSectionSelectedIndex:", objc_msgSend(v37, "intValue"));

  if (a3)
    v38 = CFSTR("selectedSectionIndex");
  else
    v38 = CFSTR("selected_section_index");
  objc_msgSend(v5, "objectForKeyedSubscript:", v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setSelectedSectionIndex:", objc_msgSend(v39, "intValue"));

  if (a3)
    v40 = CFSTR("isRetainedQuery");
  else
    v40 = CFSTR("is_retained_query");
  objc_msgSend(v5, "objectForKeyedSubscript:", v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setIsRetainedQuery:", objc_msgSend(v41, "BOOLValue"));

  if (a3)
    v42 = CFSTR("isRerankerTriggered");
  else
    v42 = CFSTR("is_reranker_triggered");
  objc_msgSend(v5, "objectForKeyedSubscript:", v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setIsRerankerTriggered:", objc_msgSend(v43, "BOOLValue"));

  if (a3)
    v44 = CFSTR("overallLatencyInMs");
  else
    v44 = CFSTR("overall_latency_in_ms");
  objc_msgSend(v5, "objectForKeyedSubscript:", v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setOverallLatencyInMs:", objc_msgSend(v45, "longLongValue"));

  if (a3)
    v46 = CFSTR("shouldDifferentiateClientAndServerResults");
  else
    v46 = CFSTR("should_differentiate_client_and_server_results");
  objc_msgSend(v5, "objectForKeyedSubscript:", v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setShouldDifferentiateClientAndServerResults:", objc_msgSend(v47, "BOOLValue"));

  if (a3)
    v48 = CFSTR("autocompleteSequenceNumber");
  else
    v48 = CFSTR("autocomplete_sequence_number");
  objc_msgSend(v5, "objectForKeyedSubscript:", v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setAutocompleteSequenceNumber:", objc_msgSend(v49, "unsignedIntValue"));

LABEL_107:
  return a1;
}

- (GEOLogMsgEventClientACSuggestions)initWithJSON:(id)a3
{
  return (GEOLogMsgEventClientACSuggestions *)-[GEOLogMsgEventClientACSuggestions _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_679_1;
    else
      v8 = (int *)&readAll__nonRecursiveTag_680_1;
    GEOLogMsgEventClientACSuggestionsReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEOLogMsgEventClientACSuggestionsCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgEventClientACSuggestionsIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgEventClientACSuggestionsReadAllFrom((uint64_t)self, a3, 0);
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
  __int16 flags;
  PBDataReader *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOLogMsgEventClientACSuggestionsIsDirty((uint64_t)self) & 1) == 0)
  {
    v15 = self->_reader;
    objc_sync_enter(v15);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v16);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v15);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOLogMsgEventClientACSuggestions readAll:](self, "readAll:", 0);
    if (self->_query)
      PBDataWriterWriteStringField();
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v6 = self->_queryTokens;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v22;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v22 != v8)
            objc_enumerationMutation(v6);
          PBDataWriterWriteStringField();
          ++v9;
        }
        while (v7 != v9);
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v7);
    }

    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v10 = self->_entries;
    v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v18;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v18 != v12)
            objc_enumerationMutation(v10);
          PBDataWriterWriteSubmessage();
          ++v13;
        }
        while (v11 != v13);
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
      }
      while (v11);
    }

    flags = (__int16)self->_flags;
    if ((flags & 8) != 0)
    {
      PBDataWriterWriteInt32Field();
      flags = (__int16)self->_flags;
    }
    if ((flags & 0x20) != 0)
    {
      PBDataWriterWriteInt32Field();
      flags = (__int16)self->_flags;
    }
    if ((flags & 4) != 0)
    {
      PBDataWriterWriteInt32Field();
      flags = (__int16)self->_flags;
    }
    if ((flags & 0x40) != 0)
    {
      PBDataWriterWriteInt32Field();
      flags = (__int16)self->_flags;
    }
    if ((flags & 0x10) != 0)
    {
      PBDataWriterWriteInt32Field();
      flags = (__int16)self->_flags;
    }
    if ((flags & 0x100) != 0)
    {
      PBDataWriterWriteBOOLField();
      flags = (__int16)self->_flags;
    }
    if ((flags & 0x80) != 0)
    {
      PBDataWriterWriteBOOLField();
      flags = (__int16)self->_flags;
    }
    if ((flags & 1) != 0)
    {
      PBDataWriterWriteInt64Field();
      flags = (__int16)self->_flags;
    }
    if ((flags & 0x200) != 0)
    {
      PBDataWriterWriteBOOLField();
      flags = (__int16)self->_flags;
    }
    if ((flags & 2) != 0)
      PBDataWriterWriteUint32Field();
  }

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
  __int16 flags;
  id *v13;

  v13 = (id *)a3;
  -[GEOLogMsgEventClientACSuggestions readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v13 + 1, self->_reader);
  *((_DWORD *)v13 + 12) = self->_readerMarkPos;
  *((_DWORD *)v13 + 13) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_query)
    objc_msgSend(v13, "setQuery:");
  if (-[GEOLogMsgEventClientACSuggestions queryTokensCount](self, "queryTokensCount"))
  {
    objc_msgSend(v13, "clearQueryTokens");
    v4 = -[GEOLogMsgEventClientACSuggestions queryTokensCount](self, "queryTokensCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[GEOLogMsgEventClientACSuggestions queryTokensAtIndex:](self, "queryTokensAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addQueryTokens:", v7);

      }
    }
  }
  if (-[GEOLogMsgEventClientACSuggestions entriesCount](self, "entriesCount"))
  {
    objc_msgSend(v13, "clearEntries");
    v8 = -[GEOLogMsgEventClientACSuggestions entriesCount](self, "entriesCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
      {
        -[GEOLogMsgEventClientACSuggestions entriesAtIndex:](self, "entriesAtIndex:", j);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addEntries:", v11);

      }
    }
  }
  flags = (__int16)self->_flags;
  if ((flags & 8) != 0)
  {
    *((_DWORD *)v13 + 17) = self->_selectedIndex;
    *((_WORD *)v13 + 44) |= 8u;
    flags = (__int16)self->_flags;
    if ((flags & 0x20) == 0)
    {
LABEL_13:
      if ((flags & 4) == 0)
        goto LABEL_14;
      goto LABEL_25;
    }
  }
  else if ((flags & 0x20) == 0)
  {
    goto LABEL_13;
  }
  *((_DWORD *)v13 + 19) = self->_trigger;
  *((_WORD *)v13 + 44) |= 0x20u;
  flags = (__int16)self->_flags;
  if ((flags & 4) == 0)
  {
LABEL_14:
    if ((flags & 0x40) == 0)
      goto LABEL_15;
    goto LABEL_26;
  }
LABEL_25:
  *((_DWORD *)v13 + 16) = self->_keypressStatus;
  *((_WORD *)v13 + 44) |= 4u;
  flags = (__int16)self->_flags;
  if ((flags & 0x40) == 0)
  {
LABEL_15:
    if ((flags & 0x10) == 0)
      goto LABEL_16;
    goto LABEL_27;
  }
LABEL_26:
  *((_DWORD *)v13 + 20) = self->_withinSectionSelectedIndex;
  *((_WORD *)v13 + 44) |= 0x40u;
  flags = (__int16)self->_flags;
  if ((flags & 0x10) == 0)
  {
LABEL_16:
    if ((flags & 0x100) == 0)
      goto LABEL_17;
    goto LABEL_28;
  }
LABEL_27:
  *((_DWORD *)v13 + 18) = self->_selectedSectionIndex;
  *((_WORD *)v13 + 44) |= 0x10u;
  flags = (__int16)self->_flags;
  if ((flags & 0x100) == 0)
  {
LABEL_17:
    if ((flags & 0x80) == 0)
      goto LABEL_18;
    goto LABEL_29;
  }
LABEL_28:
  *((_BYTE *)v13 + 85) = self->_isRetainedQuery;
  *((_WORD *)v13 + 44) |= 0x100u;
  flags = (__int16)self->_flags;
  if ((flags & 0x80) == 0)
  {
LABEL_18:
    if ((flags & 1) == 0)
      goto LABEL_19;
    goto LABEL_30;
  }
LABEL_29:
  *((_BYTE *)v13 + 84) = self->_isRerankerTriggered;
  *((_WORD *)v13 + 44) |= 0x80u;
  flags = (__int16)self->_flags;
  if ((flags & 1) == 0)
  {
LABEL_19:
    if ((flags & 0x200) == 0)
      goto LABEL_20;
LABEL_31:
    *((_BYTE *)v13 + 86) = self->_shouldDifferentiateClientAndServerResults;
    *((_WORD *)v13 + 44) |= 0x200u;
    if ((*(_WORD *)&self->_flags & 2) == 0)
      goto LABEL_22;
    goto LABEL_21;
  }
LABEL_30:
  v13[3] = (id)self->_overallLatencyInMs;
  *((_WORD *)v13 + 44) |= 1u;
  flags = (__int16)self->_flags;
  if ((flags & 0x200) != 0)
    goto LABEL_31;
LABEL_20:
  if ((flags & 2) != 0)
  {
LABEL_21:
    *((_DWORD *)v13 + 15) = self->_autocompleteSequenceNumber;
    *((_WORD *)v13 + 44) |= 2u;
  }
LABEL_22:

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
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  __int16 flags;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
  {
LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOLogMsgEventClientACSuggestions readAll:](self, "readAll:", 0);
    v9 = -[NSString copyWithZone:](self->_query, "copyWithZone:", a3);
    v10 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v9;

    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v11 = self->_queryTokens;
    v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v28 != v13)
            objc_enumerationMutation(v11);
          v15 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * i), "copyWithZone:", a3);
          objc_msgSend((id)v5, "addQueryTokens:", v15);

        }
        v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      }
      while (v12);
    }

    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v16 = self->_entries;
    v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    if (v17)
    {
      v18 = *(_QWORD *)v24;
      do
      {
        for (j = 0; j != v17; ++j)
        {
          if (*(_QWORD *)v24 != v18)
            objc_enumerationMutation(v16);
          v20 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * j), "copyWithZone:", a3, (_QWORD)v23);
          objc_msgSend((id)v5, "addEntries:", v20);

        }
        v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
      }
      while (v17);
    }

    flags = (__int16)self->_flags;
    if ((flags & 8) != 0)
    {
      *(_DWORD *)(v5 + 68) = self->_selectedIndex;
      *(_WORD *)(v5 + 88) |= 8u;
      flags = (__int16)self->_flags;
      if ((flags & 0x20) == 0)
      {
LABEL_21:
        if ((flags & 4) == 0)
          goto LABEL_22;
        goto LABEL_33;
      }
    }
    else if ((flags & 0x20) == 0)
    {
      goto LABEL_21;
    }
    *(_DWORD *)(v5 + 76) = self->_trigger;
    *(_WORD *)(v5 + 88) |= 0x20u;
    flags = (__int16)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_22:
      if ((flags & 0x40) == 0)
        goto LABEL_23;
      goto LABEL_34;
    }
LABEL_33:
    *(_DWORD *)(v5 + 64) = self->_keypressStatus;
    *(_WORD *)(v5 + 88) |= 4u;
    flags = (__int16)self->_flags;
    if ((flags & 0x40) == 0)
    {
LABEL_23:
      if ((flags & 0x10) == 0)
        goto LABEL_24;
      goto LABEL_35;
    }
LABEL_34:
    *(_DWORD *)(v5 + 80) = self->_withinSectionSelectedIndex;
    *(_WORD *)(v5 + 88) |= 0x40u;
    flags = (__int16)self->_flags;
    if ((flags & 0x10) == 0)
    {
LABEL_24:
      if ((flags & 0x100) == 0)
        goto LABEL_25;
      goto LABEL_36;
    }
LABEL_35:
    *(_DWORD *)(v5 + 72) = self->_selectedSectionIndex;
    *(_WORD *)(v5 + 88) |= 0x10u;
    flags = (__int16)self->_flags;
    if ((flags & 0x100) == 0)
    {
LABEL_25:
      if ((flags & 0x80) == 0)
        goto LABEL_26;
      goto LABEL_37;
    }
LABEL_36:
    *(_BYTE *)(v5 + 85) = self->_isRetainedQuery;
    *(_WORD *)(v5 + 88) |= 0x100u;
    flags = (__int16)self->_flags;
    if ((flags & 0x80) == 0)
    {
LABEL_26:
      if ((flags & 1) == 0)
        goto LABEL_27;
      goto LABEL_38;
    }
LABEL_37:
    *(_BYTE *)(v5 + 84) = self->_isRerankerTriggered;
    *(_WORD *)(v5 + 88) |= 0x80u;
    flags = (__int16)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_27:
      if ((flags & 0x200) == 0)
        goto LABEL_28;
      goto LABEL_39;
    }
LABEL_38:
    *(_QWORD *)(v5 + 24) = self->_overallLatencyInMs;
    *(_WORD *)(v5 + 88) |= 1u;
    flags = (__int16)self->_flags;
    if ((flags & 0x200) == 0)
    {
LABEL_28:
      if ((flags & 2) == 0)
        return (id)v5;
LABEL_29:
      *(_DWORD *)(v5 + 60) = self->_autocompleteSequenceNumber;
      *(_WORD *)(v5 + 88) |= 2u;
      return (id)v5;
    }
LABEL_39:
    *(_BYTE *)(v5 + 86) = self->_shouldDifferentiateClientAndServerResults;
    *(_WORD *)(v5 + 88) |= 0x200u;
    if ((*(_WORD *)&self->_flags & 2) == 0)
      return (id)v5;
    goto LABEL_29;
  }
  v7 = reader;
  objc_sync_enter(v7);
  if ((*(_WORD *)&self->_flags & 0x2000) != 0)
  {
    objc_sync_exit(v7);

    goto LABEL_5;
  }
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  GEOLogMsgEventClientACSuggestionsReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  v8 = (id)v5;
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *query;
  NSMutableArray *queryTokens;
  NSMutableArray *entries;
  __int16 flags;
  __int16 v9;
  BOOL v10;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_67;
  -[GEOLogMsgEventClientACSuggestions readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  query = self->_query;
  if ((unint64_t)query | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](query, "isEqual:"))
      goto LABEL_67;
  }
  queryTokens = self->_queryTokens;
  if ((unint64_t)queryTokens | *((_QWORD *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](queryTokens, "isEqual:"))
      goto LABEL_67;
  }
  entries = self->_entries;
  if ((unint64_t)entries | *((_QWORD *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](entries, "isEqual:"))
      goto LABEL_67;
  }
  flags = (__int16)self->_flags;
  v9 = *((_WORD *)v4 + 44);
  if ((flags & 8) != 0)
  {
    if ((v9 & 8) == 0 || self->_selectedIndex != *((_DWORD *)v4 + 17))
      goto LABEL_67;
  }
  else if ((v9 & 8) != 0)
  {
    goto LABEL_67;
  }
  if ((flags & 0x20) != 0)
  {
    if ((v9 & 0x20) == 0 || self->_trigger != *((_DWORD *)v4 + 19))
      goto LABEL_67;
  }
  else if ((v9 & 0x20) != 0)
  {
    goto LABEL_67;
  }
  if ((flags & 4) != 0)
  {
    if ((v9 & 4) == 0 || self->_keypressStatus != *((_DWORD *)v4 + 16))
      goto LABEL_67;
  }
  else if ((v9 & 4) != 0)
  {
    goto LABEL_67;
  }
  if ((flags & 0x40) != 0)
  {
    if ((v9 & 0x40) == 0 || self->_withinSectionSelectedIndex != *((_DWORD *)v4 + 20))
      goto LABEL_67;
  }
  else if ((v9 & 0x40) != 0)
  {
    goto LABEL_67;
  }
  if ((flags & 0x10) != 0)
  {
    if ((v9 & 0x10) == 0 || self->_selectedSectionIndex != *((_DWORD *)v4 + 18))
      goto LABEL_67;
  }
  else if ((v9 & 0x10) != 0)
  {
    goto LABEL_67;
  }
  if ((*(_WORD *)&self->_flags & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 44) & 0x100) == 0)
      goto LABEL_67;
    if (self->_isRetainedQuery)
    {
      if (!*((_BYTE *)v4 + 85))
        goto LABEL_67;
    }
    else if (*((_BYTE *)v4 + 85))
    {
      goto LABEL_67;
    }
  }
  else if ((*((_WORD *)v4 + 44) & 0x100) != 0)
  {
    goto LABEL_67;
  }
  if ((flags & 0x80) != 0)
  {
    if ((v9 & 0x80) == 0)
      goto LABEL_67;
    if (self->_isRerankerTriggered)
    {
      if (!*((_BYTE *)v4 + 84))
        goto LABEL_67;
    }
    else if (*((_BYTE *)v4 + 84))
    {
      goto LABEL_67;
    }
  }
  else if ((v9 & 0x80) != 0)
  {
    goto LABEL_67;
  }
  if ((flags & 1) != 0)
  {
    if ((v9 & 1) == 0 || self->_overallLatencyInMs != *((_QWORD *)v4 + 3))
      goto LABEL_67;
  }
  else if ((v9 & 1) != 0)
  {
    goto LABEL_67;
  }
  if ((*(_WORD *)&self->_flags & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 44) & 0x200) != 0)
    {
      if (self->_shouldDifferentiateClientAndServerResults)
      {
        if (!*((_BYTE *)v4 + 86))
          goto LABEL_67;
        goto LABEL_62;
      }
      if (!*((_BYTE *)v4 + 86))
        goto LABEL_62;
    }
LABEL_67:
    v10 = 0;
    goto LABEL_68;
  }
  if ((*((_WORD *)v4 + 44) & 0x200) != 0)
    goto LABEL_67;
LABEL_62:
  if ((flags & 2) != 0)
  {
    if ((v9 & 2) == 0 || self->_autocompleteSequenceNumber != *((_DWORD *)v4 + 15))
      goto LABEL_67;
    v10 = 1;
  }
  else
  {
    v10 = (v9 & 2) == 0;
  }
LABEL_68:

  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  uint64_t v5;
  __int16 flags;
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

  -[GEOLogMsgEventClientACSuggestions readAll:](self, "readAll:", 1);
  v3 = -[NSString hash](self->_query, "hash");
  v4 = -[NSMutableArray hash](self->_queryTokens, "hash");
  v5 = -[NSMutableArray hash](self->_entries, "hash");
  flags = (__int16)self->_flags;
  if ((flags & 8) != 0)
  {
    v7 = 2654435761 * self->_selectedIndex;
    if ((flags & 0x20) != 0)
    {
LABEL_3:
      v8 = 2654435761 * self->_trigger;
      if ((flags & 4) != 0)
        goto LABEL_4;
      goto LABEL_14;
    }
  }
  else
  {
    v7 = 0;
    if ((flags & 0x20) != 0)
      goto LABEL_3;
  }
  v8 = 0;
  if ((flags & 4) != 0)
  {
LABEL_4:
    v9 = 2654435761 * self->_keypressStatus;
    if ((flags & 0x40) != 0)
      goto LABEL_5;
    goto LABEL_15;
  }
LABEL_14:
  v9 = 0;
  if ((flags & 0x40) != 0)
  {
LABEL_5:
    v10 = 2654435761 * self->_withinSectionSelectedIndex;
    if ((flags & 0x10) != 0)
      goto LABEL_6;
    goto LABEL_16;
  }
LABEL_15:
  v10 = 0;
  if ((flags & 0x10) != 0)
  {
LABEL_6:
    v11 = 2654435761 * self->_selectedSectionIndex;
    if ((*(_WORD *)&self->_flags & 0x100) != 0)
      goto LABEL_7;
    goto LABEL_17;
  }
LABEL_16:
  v11 = 0;
  if ((*(_WORD *)&self->_flags & 0x100) != 0)
  {
LABEL_7:
    v12 = 2654435761 * self->_isRetainedQuery;
    if ((flags & 0x80) != 0)
      goto LABEL_8;
    goto LABEL_18;
  }
LABEL_17:
  v12 = 0;
  if ((flags & 0x80) != 0)
  {
LABEL_8:
    v13 = 2654435761 * self->_isRerankerTriggered;
    if ((flags & 1) != 0)
      goto LABEL_9;
    goto LABEL_19;
  }
LABEL_18:
  v13 = 0;
  if ((flags & 1) != 0)
  {
LABEL_9:
    v14 = 2654435761 * self->_overallLatencyInMs;
    if ((*(_WORD *)&self->_flags & 0x200) != 0)
      goto LABEL_10;
LABEL_20:
    v15 = 0;
    if ((flags & 2) != 0)
      goto LABEL_11;
LABEL_21:
    v16 = 0;
    return v4 ^ v3 ^ v5 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16;
  }
LABEL_19:
  v14 = 0;
  if ((*(_WORD *)&self->_flags & 0x200) == 0)
    goto LABEL_20;
LABEL_10:
  v15 = 2654435761 * self->_shouldDifferentiateClientAndServerResults;
  if ((flags & 2) == 0)
    goto LABEL_21;
LABEL_11:
  v16 = 2654435761 * self->_autocompleteSequenceNumber;
  return v4 ^ v3 ^ v5 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16;
}

- (void)mergeFrom:(id)a3
{
  id v4;
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
  __int16 v15;
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
  objc_msgSend(v4, "readAll:", 0);
  if (*((_QWORD *)v4 + 5))
    -[GEOLogMsgEventClientACSuggestions setQuery:](self, "setQuery:");
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = *((id *)v4 + 4);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(v5);
        -[GEOLogMsgEventClientACSuggestions addQueryTokens:](self, "addQueryTokens:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v7);
  }

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v10 = *((id *)v4 + 2);
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v17;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v17 != v13)
          objc_enumerationMutation(v10);
        -[GEOLogMsgEventClientACSuggestions addEntries:](self, "addEntries:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * j), (_QWORD)v16);
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v12);
  }

  v15 = *((_WORD *)v4 + 44);
  if ((v15 & 8) != 0)
  {
    self->_selectedIndex = *((_DWORD *)v4 + 17);
    *(_WORD *)&self->_flags |= 8u;
    v15 = *((_WORD *)v4 + 44);
    if ((v15 & 0x20) == 0)
    {
LABEL_19:
      if ((v15 & 4) == 0)
        goto LABEL_20;
      goto LABEL_31;
    }
  }
  else if ((v15 & 0x20) == 0)
  {
    goto LABEL_19;
  }
  self->_trigger = *((_DWORD *)v4 + 19);
  *(_WORD *)&self->_flags |= 0x20u;
  v15 = *((_WORD *)v4 + 44);
  if ((v15 & 4) == 0)
  {
LABEL_20:
    if ((v15 & 0x40) == 0)
      goto LABEL_21;
    goto LABEL_32;
  }
LABEL_31:
  self->_keypressStatus = *((_DWORD *)v4 + 16);
  *(_WORD *)&self->_flags |= 4u;
  v15 = *((_WORD *)v4 + 44);
  if ((v15 & 0x40) == 0)
  {
LABEL_21:
    if ((v15 & 0x10) == 0)
      goto LABEL_22;
    goto LABEL_33;
  }
LABEL_32:
  self->_withinSectionSelectedIndex = *((_DWORD *)v4 + 20);
  *(_WORD *)&self->_flags |= 0x40u;
  v15 = *((_WORD *)v4 + 44);
  if ((v15 & 0x10) == 0)
  {
LABEL_22:
    if ((v15 & 0x100) == 0)
      goto LABEL_23;
    goto LABEL_34;
  }
LABEL_33:
  self->_selectedSectionIndex = *((_DWORD *)v4 + 18);
  *(_WORD *)&self->_flags |= 0x10u;
  v15 = *((_WORD *)v4 + 44);
  if ((v15 & 0x100) == 0)
  {
LABEL_23:
    if ((v15 & 0x80) == 0)
      goto LABEL_24;
    goto LABEL_35;
  }
LABEL_34:
  self->_isRetainedQuery = *((_BYTE *)v4 + 85);
  *(_WORD *)&self->_flags |= 0x100u;
  v15 = *((_WORD *)v4 + 44);
  if ((v15 & 0x80) == 0)
  {
LABEL_24:
    if ((v15 & 1) == 0)
      goto LABEL_25;
    goto LABEL_36;
  }
LABEL_35:
  self->_isRerankerTriggered = *((_BYTE *)v4 + 84);
  *(_WORD *)&self->_flags |= 0x80u;
  v15 = *((_WORD *)v4 + 44);
  if ((v15 & 1) == 0)
  {
LABEL_25:
    if ((v15 & 0x200) == 0)
      goto LABEL_26;
LABEL_37:
    self->_shouldDifferentiateClientAndServerResults = *((_BYTE *)v4 + 86);
    *(_WORD *)&self->_flags |= 0x200u;
    if ((*((_WORD *)v4 + 44) & 2) == 0)
      goto LABEL_28;
    goto LABEL_27;
  }
LABEL_36:
  self->_overallLatencyInMs = *((_QWORD *)v4 + 3);
  *(_WORD *)&self->_flags |= 1u;
  v15 = *((_WORD *)v4 + 44);
  if ((v15 & 0x200) != 0)
    goto LABEL_37;
LABEL_26:
  if ((v15 & 2) != 0)
  {
LABEL_27:
    self->_autocompleteSequenceNumber = *((_DWORD *)v4 + 15);
    *(_WORD *)&self->_flags |= 2u;
  }
LABEL_28:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_queryTokens, 0);
  objc_storeStrong((id *)&self->_entries, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
