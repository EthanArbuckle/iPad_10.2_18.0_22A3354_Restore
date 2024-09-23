@implementation GEOPDAutocompleteEntry

- (GEOPDAutocompleteEntry)init
{
  GEOPDAutocompleteEntry *v2;
  GEOPDAutocompleteEntry *v3;
  GEOPDAutocompleteEntry *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDAutocompleteEntry;
  v2 = -[GEOPDAutocompleteEntry init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDAutocompleteEntry)initWithData:(id)a3
{
  GEOPDAutocompleteEntry *v3;
  GEOPDAutocompleteEntry *v4;
  GEOPDAutocompleteEntry *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDAutocompleteEntry;
  v3 = -[GEOPDAutocompleteEntry initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readHighlightMain
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(_BYTE *)(a1 + 185) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDAutocompleteEntryReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readHighlightMain_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (BOOL)hasHighlightMain
{
  -[GEOPDAutocompleteEntry _readHighlightMain]((uint64_t)self);
  return self->_highlightMain != 0;
}

- (GEOPDAutocompleteEntryHighlightLine)highlightMain
{
  -[GEOPDAutocompleteEntry _readHighlightMain]((uint64_t)self);
  return self->_highlightMain;
}

- (void)setHighlightMain:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x404000u;
  objc_storeStrong((id *)&self->_highlightMain, a3);
}

- (void)_readHighlightExtra
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(_BYTE *)(a1 + 185) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDAutocompleteEntryReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readHighlightExtra_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (BOOL)hasHighlightExtra
{
  -[GEOPDAutocompleteEntry _readHighlightExtra]((uint64_t)self);
  return self->_highlightExtra != 0;
}

- (GEOPDAutocompleteEntryHighlightLine)highlightExtra
{
  -[GEOPDAutocompleteEntry _readHighlightExtra]((uint64_t)self);
  return self->_highlightExtra;
}

- (void)setHighlightExtra:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x402000u;
  objc_storeStrong((id *)&self->_highlightExtra, a3);
}

- (int)type
{
  os_unfair_lock_s *p_readerLock;
  $EC00EBA47C74C596B32E42AC7A87C130 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_BYTE *)&flags & 8) != 0)
    return self->_type;
  else
    return 0;
}

- (void)setType:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x400008u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4194312;
  else
    v3 = 0x400000;
  self->_flags = ($EC00EBA47C74C596B32E42AC7A87C130)(*(_DWORD *)&self->_flags & 0xFFFFFFF7 | v3);
}

- (BOOL)hasType
{
  return (*(_BYTE *)&self->_flags >> 3) & 1;
}

- (id)typeAsString:(int)a3
{
  if (a3 < 0xA)
    return off_1E1C058C0[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("QUERY")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BUSINESS")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ADDRESS")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CATEGORY")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BRAND_PROFILE")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("OFFLINE_AREA")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CLIENT_RESOLVED")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DIRECTION_INTENT")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("COLLECTION")) & 1) != 0)
  {
    v4 = 8;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("PUBLISHER")))
  {
    v4 = 9;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_readQuery
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(_BYTE *)(a1 + 186) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDAutocompleteEntryReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readQuery_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (BOOL)hasQuery
{
  -[GEOPDAutocompleteEntry _readQuery]((uint64_t)self);
  return self->_query != 0;
}

- (GEOPDAutocompleteEntryQuery)query
{
  -[GEOPDAutocompleteEntry _readQuery]((uint64_t)self);
  return self->_query;
}

- (void)setQuery:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x480000u;
  objc_storeStrong((id *)&self->_query, a3);
}

- (void)_readBusiness
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(_BYTE *)(a1 + 185) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDAutocompleteEntryReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readBusiness_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (BOOL)hasBusiness
{
  -[GEOPDAutocompleteEntry _readBusiness]((uint64_t)self);
  return self->_business != 0;
}

- (GEOPDAutocompleteEntryBusiness)business
{
  -[GEOPDAutocompleteEntry _readBusiness]((uint64_t)self);
  return self->_business;
}

- (void)setBusiness:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x400100u;
  objc_storeStrong((id *)&self->_business, a3);
}

- (void)_readAddress
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(_BYTE *)(a1 + 184) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDAutocompleteEntryReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAddress_tags_1);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (BOOL)hasAddress
{
  -[GEOPDAutocompleteEntry _readAddress]((uint64_t)self);
  return self->_address != 0;
}

- (GEOPDAutocompleteEntryAddress)address
{
  -[GEOPDAutocompleteEntry _readAddress]((uint64_t)self);
  return self->_address;
}

- (void)setAddress:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x400040u;
  objc_storeStrong((id *)&self->_address, a3);
}

- (void)_readCategory
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(_BYTE *)(a1 + 185) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDAutocompleteEntryReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCategory_tags_1);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (BOOL)hasCategory
{
  -[GEOPDAutocompleteEntry _readCategory]((uint64_t)self);
  return self->_category != 0;
}

- (GEOPDAutocompleteEntryCategory)category
{
  -[GEOPDAutocompleteEntry _readCategory]((uint64_t)self);
  return self->_category;
}

- (void)setCategory:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x400200u;
  objc_storeStrong((id *)&self->_category, a3);
}

- (void)_readBrandProfile
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(_BYTE *)(a1 + 184) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDAutocompleteEntryReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readBrandProfile_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (BOOL)hasBrandProfile
{
  -[GEOPDAutocompleteEntry _readBrandProfile]((uint64_t)self);
  return self->_brandProfile != 0;
}

- (GEOPDAutocompleteEntryBrandProfile)brandProfile
{
  -[GEOPDAutocompleteEntry _readBrandProfile]((uint64_t)self);
  return self->_brandProfile;
}

- (void)setBrandProfile:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x400080u;
  objc_storeStrong((id *)&self->_brandProfile, a3);
}

- (void)_readOfflineArea
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(_BYTE *)(a1 + 185) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDAutocompleteEntryReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readOfflineArea_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (BOOL)hasOfflineArea
{
  -[GEOPDAutocompleteEntry _readOfflineArea]((uint64_t)self);
  return self->_offlineArea != 0;
}

- (GEOPDAutocompleteEntryOfflineArea)offlineArea
{
  -[GEOPDAutocompleteEntry _readOfflineArea]((uint64_t)self);
  return self->_offlineArea;
}

- (void)setOfflineArea:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x408000u;
  objc_storeStrong((id *)&self->_offlineArea, a3);
}

- (void)_readClientResolved
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(_BYTE *)(a1 + 185) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDAutocompleteEntryReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readClientResolved_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (BOOL)hasClientResolved
{
  -[GEOPDAutocompleteEntry _readClientResolved]((uint64_t)self);
  return self->_clientResolved != 0;
}

- (GEOPDAutocompleteEntryClientResolved)clientResolved
{
  -[GEOPDAutocompleteEntry _readClientResolved]((uint64_t)self);
  return self->_clientResolved;
}

- (void)setClientResolved:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x400400u;
  objc_storeStrong((id *)&self->_clientResolved, a3);
}

- (void)_readDirectionIntent
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(_BYTE *)(a1 + 185) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDAutocompleteEntryReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDirectionIntent_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (BOOL)hasDirectionIntent
{
  -[GEOPDAutocompleteEntry _readDirectionIntent]((uint64_t)self);
  return self->_directionIntent != 0;
}

- (GEOPDAutocompleteEntryDirectionIntent)directionIntent
{
  -[GEOPDAutocompleteEntry _readDirectionIntent]((uint64_t)self);
  return self->_directionIntent;
}

- (void)setDirectionIntent:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x401000u;
  objc_storeStrong((id *)&self->_directionIntent, a3);
}

- (void)_readRetainSearch
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(_BYTE *)(a1 + 186) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDAutocompleteEntryReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRetainSearch_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (BOOL)hasRetainSearch
{
  -[GEOPDAutocompleteEntry _readRetainSearch]((uint64_t)self);
  return self->_retainSearch != 0;
}

- (GEOPDRetainedSearchMetadata)retainSearch
{
  -[GEOPDAutocompleteEntry _readRetainSearch]((uint64_t)self);
  return self->_retainSearch;
}

- (void)setRetainSearch:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x500000u;
  objc_storeStrong((id *)&self->_retainSearch, a3);
}

- (void)_readParsecRankingFeatures
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(_BYTE *)(a1 + 186) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDAutocompleteEntryReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readParsecRankingFeatures_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (BOOL)hasParsecRankingFeatures
{
  -[GEOPDAutocompleteEntry _readParsecRankingFeatures]((uint64_t)self);
  return self->_parsecRankingFeatures != 0;
}

- (GEOPDParsecRankingFeatures)parsecRankingFeatures
{
  -[GEOPDAutocompleteEntry _readParsecRankingFeatures]((uint64_t)self);
  return self->_parsecRankingFeatures;
}

- (void)setParsecRankingFeatures:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x410000u;
  objc_storeStrong((id *)&self->_parsecRankingFeatures, a3);
}

- (int)sortPriority
{
  return self->_sortPriority;
}

- (void)setSortPriority:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x400004u;
  self->_sortPriority = a3;
}

- (void)setHasSortPriority:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4194308;
  else
    v3 = 0x400000;
  self->_flags = ($EC00EBA47C74C596B32E42AC7A87C130)(*(_DWORD *)&self->_flags & 0xFFFFFFFB | v3);
}

- (BOOL)hasSortPriority
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (int)autocompleteResultCellType
{
  os_unfair_lock_s *p_readerLock;
  $EC00EBA47C74C596B32E42AC7A87C130 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_BYTE *)&flags & 2) != 0)
    return self->_autocompleteResultCellType;
  else
    return 0;
}

- (void)setAutocompleteResultCellType:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x400002u;
  self->_autocompleteResultCellType = a3;
}

- (void)setHasAutocompleteResultCellType:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4194306;
  else
    v3 = 0x400000;
  self->_flags = ($EC00EBA47C74C596B32E42AC7A87C130)(*(_DWORD *)&self->_flags & 0xFFFFFFFD | v3);
}

- (BOOL)hasAutocompleteResultCellType
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (id)autocompleteResultCellTypeAsString:(int)a3
{
  if (a3 < 5)
    return off_1E1C05698[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsAutocompleteResultCellType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AUTOCOMPLETE_RESULT_CELL_TYPE_DEFAULT")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AUTOCOMPLETE_RESULT_CELL_TYPE_PROMINENT_QUERY")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AUTOCOMPLETE_RESULT_CELL_TYPE_PROMINENT_RESULT")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AUTOCOMPLETE_RESULT_CELL_TYPE_TWO_LINE")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("AUTOCOMPLETE_RESULT_CELL_TYPE_PROMINENT_RESULT_TWO_LINE")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_readServerResultScoreMetadata
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(_BYTE *)(a1 + 186) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDAutocompleteEntryReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readServerResultScoreMetadata_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (BOOL)hasServerResultScoreMetadata
{
  -[GEOPDAutocompleteEntry _readServerResultScoreMetadata]((uint64_t)self);
  return self->_serverResultScoreMetadata != 0;
}

- (GEOPDServerResultScoreMetadata)serverResultScoreMetadata
{
  -[GEOPDAutocompleteEntry _readServerResultScoreMetadata]((uint64_t)self);
  return self->_serverResultScoreMetadata;
}

- (void)setServerResultScoreMetadata:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x600000u;
  objc_storeStrong((id *)&self->_serverResultScoreMetadata, a3);
}

- (BOOL)enableQueryAcceleratorAffordance
{
  return self->_enableQueryAcceleratorAffordance;
}

- (void)setEnableQueryAcceleratorAffordance:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x400010u;
  self->_enableQueryAcceleratorAffordance = a3;
}

- (void)setHasEnableQueryAcceleratorAffordance:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4194320;
  else
    v3 = 0x400000;
  self->_flags = ($EC00EBA47C74C596B32E42AC7A87C130)(*(_DWORD *)&self->_flags & 0xFFFFFFEF | v3);
}

- (BOOL)hasEnableQueryAcceleratorAffordance
{
  return (*(_BYTE *)&self->_flags >> 4) & 1;
}

- (void)_readQueryAcceleratorCompletionString
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(_BYTE *)(a1 + 186) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDAutocompleteEntryReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readQueryAcceleratorCompletionString_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (BOOL)hasQueryAcceleratorCompletionString
{
  -[GEOPDAutocompleteEntry _readQueryAcceleratorCompletionString]((uint64_t)self);
  return self->_queryAcceleratorCompletionString != 0;
}

- (NSString)queryAcceleratorCompletionString
{
  -[GEOPDAutocompleteEntry _readQueryAcceleratorCompletionString]((uint64_t)self);
  return self->_queryAcceleratorCompletionString;
}

- (void)setQueryAcceleratorCompletionString:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x440000u;
  objc_storeStrong((id *)&self->_queryAcceleratorCompletionString, a3);
}

- (void)_readCollection
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(_BYTE *)(a1 + 185) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDAutocompleteEntryReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCollection_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (BOOL)hasCollection
{
  -[GEOPDAutocompleteEntry _readCollection]((uint64_t)self);
  return self->_collection != 0;
}

- (GEOPDAutocompleteEntryCollection)collection
{
  -[GEOPDAutocompleteEntry _readCollection]((uint64_t)self);
  return self->_collection;
}

- (void)setCollection:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x400800u;
  objc_storeStrong((id *)&self->_collection, a3);
}

- (void)_readPublisher
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(_BYTE *)(a1 + 186) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDAutocompleteEntryReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPublisher_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (BOOL)hasPublisher
{
  -[GEOPDAutocompleteEntry _readPublisher]((uint64_t)self);
  return self->_publisher != 0;
}

- (GEOPDAutocompleteEntryPublisher)publisher
{
  -[GEOPDAutocompleteEntry _readPublisher]((uint64_t)self);
  return self->_publisher;
}

- (void)setPublisher:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x420000u;
  objc_storeStrong((id *)&self->_publisher, a3);
}

- (unsigned)autocompleteOriginationTypeNumber
{
  return self->_autocompleteOriginationTypeNumber;
}

- (void)setAutocompleteOriginationTypeNumber:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x400001u;
  self->_autocompleteOriginationTypeNumber = a3;
}

- (void)setHasAutocompleteOriginationTypeNumber:(BOOL)a3
{
  self->_flags = ($EC00EBA47C74C596B32E42AC7A87C130)(*(_DWORD *)&self->_flags & 0xFFFFFFFE | a3 | 0x400000);
}

- (BOOL)hasAutocompleteOriginationTypeNumber
{
  return *(_DWORD *)&self->_flags & 1;
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
  v8.super_class = (Class)GEOPDAutocompleteEntry;
  -[GEOPDAutocompleteEntry description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDAutocompleteEntry dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDAutocompleteEntry _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  id v14;
  uint64_t v15;
  __CFString *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  const __CFString *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  const __CFString *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  const __CFString *v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  const __CFString *v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  const __CFString *v52;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  const __CFString *v57;
  id v58;
  int v59;
  void *v60;
  const __CFString *v61;
  uint64_t v62;
  __CFString *v63;
  const __CFString *v64;
  void *v65;
  void *v66;
  void *v67;
  const __CFString *v68;
  id v69;
  void *v70;
  const __CFString *v71;
  void *v72;
  const __CFString *v73;
  void *v74;
  void *v75;
  id v76;
  void *v77;
  void *v78;
  id v79;
  void *v80;
  const __CFString *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  id v86;
  id v87;
  id v88;
  _QWORD v90[4];
  id v91;

  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)a1, "highlightMain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v5, "jsonRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = CFSTR("highlightMain");
    }
    else
    {
      objc_msgSend(v5, "dictionaryRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = CFSTR("highlight_main");
    }
    v9 = v7;

    objc_msgSend(v4, "setObject:forKey:", v9, v8);
  }

  objc_msgSend((id)a1, "highlightExtra");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v10, "jsonRepresentation");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = CFSTR("highlightExtra");
    }
    else
    {
      objc_msgSend(v10, "dictionaryRepresentation");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = CFSTR("highlight_extra");
    }
    v14 = v12;

    objc_msgSend(v4, "setObject:forKey:", v14, v13);
  }

  if ((*(_BYTE *)(a1 + 184) & 8) != 0)
  {
    v15 = *(int *)(a1 + 176);
    if (v15 >= 0xA)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 176));
      v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = off_1E1C058C0[v15];
    }
    objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("type"));

  }
  objc_msgSend((id)a1, "query");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v17, "jsonRepresentation");
    else
      objc_msgSend(v17, "dictionaryRepresentation");
    v19 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKey:", v19, CFSTR("query"));
  }

  objc_msgSend((id)a1, "business");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v20)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v20, "jsonRepresentation");
    else
      objc_msgSend(v20, "dictionaryRepresentation");
    v22 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKey:", v22, CFSTR("business"));
  }

  objc_msgSend((id)a1, "address");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (v23)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v23, "jsonRepresentation");
    else
      objc_msgSend(v23, "dictionaryRepresentation");
    v25 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKey:", v25, CFSTR("address"));
  }

  objc_msgSend((id)a1, "category");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v26;
  if (v26)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v26, "jsonRepresentation");
    else
      objc_msgSend(v26, "dictionaryRepresentation");
    v28 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKey:", v28, CFSTR("category"));
  }

  objc_msgSend((id)a1, "brandProfile");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v29;
  if (v29)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v29, "jsonRepresentation");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = CFSTR("brandProfile");
    }
    else
    {
      objc_msgSend(v29, "dictionaryRepresentation");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = CFSTR("brand_profile");
    }
    v33 = v31;

    objc_msgSend(v4, "setObject:forKey:", v33, v32);
  }

  objc_msgSend((id)a1, "offlineArea");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v34;
  if (v34)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v34, "jsonRepresentation");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = CFSTR("offlineArea");
    }
    else
    {
      objc_msgSend(v34, "dictionaryRepresentation");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = CFSTR("offline_area");
    }
    v38 = v36;

    objc_msgSend(v4, "setObject:forKey:", v38, v37);
  }

  objc_msgSend((id)a1, "clientResolved");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v39;
  if (v39)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v39, "jsonRepresentation");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = CFSTR("clientResolved");
    }
    else
    {
      objc_msgSend(v39, "dictionaryRepresentation");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = CFSTR("client_resolved");
    }
    v43 = v41;

    objc_msgSend(v4, "setObject:forKey:", v43, v42);
  }

  objc_msgSend((id)a1, "directionIntent");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = v44;
  if (v44)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v44, "jsonRepresentation");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = CFSTR("directionIntent");
    }
    else
    {
      objc_msgSend(v44, "dictionaryRepresentation");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = CFSTR("direction_intent");
    }
    v48 = v46;

    objc_msgSend(v4, "setObject:forKey:", v48, v47);
  }

  objc_msgSend((id)a1, "retainSearch");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = v49;
  if (v49)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v49, "jsonRepresentation");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = CFSTR("retainSearch");
    }
    else
    {
      objc_msgSend(v49, "dictionaryRepresentation");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = CFSTR("retain_search");
    }
    v53 = v51;

    objc_msgSend(v4, "setObject:forKey:", v53, v52);
  }

  objc_msgSend((id)a1, "parsecRankingFeatures");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = v54;
  if (v54)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v54, "jsonRepresentation");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = CFSTR("parsecRankingFeatures");
    }
    else
    {
      objc_msgSend(v54, "dictionaryRepresentation");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = CFSTR("parsec_ranking_features");
    }
    v58 = v56;

    objc_msgSend(v4, "setObject:forKey:", v58, v57);
  }

  v59 = *(_DWORD *)(a1 + 184);
  if ((v59 & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 172));
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v61 = CFSTR("sortPriority");
    else
      v61 = CFSTR("sort_priority");
    objc_msgSend(v4, "setObject:forKey:", v60, v61);

    v59 = *(_DWORD *)(a1 + 184);
  }
  if ((v59 & 2) != 0)
  {
    v62 = *(int *)(a1 + 168);
    if (v62 >= 5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 168));
      v63 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v63 = off_1E1C05698[v62];
    }
    if (a2)
      v64 = CFSTR("autocompleteResultCellType");
    else
      v64 = CFSTR("autocomplete_result_cell_type");
    objc_msgSend(v4, "setObject:forKey:", v63, v64);

  }
  objc_msgSend((id)a1, "serverResultScoreMetadata");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = v65;
  if (v65)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v65, "jsonRepresentation");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v68 = CFSTR("serverResultScoreMetadata");
    }
    else
    {
      objc_msgSend(v65, "dictionaryRepresentation");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v68 = CFSTR("server_result_score_metadata");
    }
    v69 = v67;

    objc_msgSend(v4, "setObject:forKey:", v69, v68);
  }

  if ((*(_BYTE *)(a1 + 184) & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 180));
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v71 = CFSTR("enableQueryAcceleratorAffordance");
    else
      v71 = CFSTR("enable_query_accelerator_affordance");
    objc_msgSend(v4, "setObject:forKey:", v70, v71);

  }
  objc_msgSend((id)a1, "queryAcceleratorCompletionString");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  if (v72)
  {
    if (a2)
      v73 = CFSTR("queryAcceleratorCompletionString");
    else
      v73 = CFSTR("query_accelerator_completion_string");
    objc_msgSend(v4, "setObject:forKey:", v72, v73);
  }

  objc_msgSend((id)a1, "collection");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v75 = v74;
  if (v74)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v74, "jsonRepresentation");
    else
      objc_msgSend(v74, "dictionaryRepresentation");
    v76 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKey:", v76, CFSTR("collection"));
  }

  objc_msgSend((id)a1, "publisher");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = v77;
  if (v77)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v77, "jsonRepresentation");
    else
      objc_msgSend(v77, "dictionaryRepresentation");
    v79 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKey:", v79, CFSTR("publisher"));
  }

  if ((*(_BYTE *)(a1 + 184) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 164));
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v81 = CFSTR("autocompleteOriginationTypeNumber");
    else
      v81 = CFSTR("autocomplete_origination_type_number");
    objc_msgSend(v4, "setObject:forKey:", v80, v81);

  }
  v82 = *(void **)(a1 + 16);
  if (v82)
  {
    objc_msgSend(v82, "dictionaryRepresentation");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    v84 = v83;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v83, "count"));
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      v90[0] = MEMORY[0x1E0C809B0];
      v90[1] = 3221225472;
      v90[2] = __52__GEOPDAutocompleteEntry__dictionaryRepresentation___block_invoke;
      v90[3] = &unk_1E1C00600;
      v86 = v85;
      v91 = v86;
      objc_msgSend(v84, "enumerateKeysAndObjectsUsingBlock:", v90);
      v87 = v86;

      v84 = v87;
    }
    objc_msgSend(v4, "setObject:forKey:", v84, CFSTR("Unknown Fields"));

  }
  v88 = v4;

  return v88;
}

- (id)jsonRepresentation
{
  return -[GEOPDAutocompleteEntry _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __52__GEOPDAutocompleteEntry__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOPDAutocompleteEntry)initWithDictionary:(id)a3
{
  return (GEOPDAutocompleteEntry *)-[GEOPDAutocompleteEntry _initWithDictionary:isJSON:](self, a3, 0);
}

- (id)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  GEOPDAutocompleteEntryHighlightLine *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  GEOPDAutocompleteEntryHighlightLine *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  GEOPDAutocompleteEntryQuery *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  GEOPDAutocompleteEntryBusiness *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  GEOPDAutocompleteEntryAddress *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  GEOPDAutocompleteEntryCategory *v32;
  uint64_t v33;
  void *v34;
  const __CFString *v35;
  void *v36;
  GEOPDAutocompleteEntryBrandProfile *v37;
  uint64_t v38;
  void *v39;
  const __CFString *v40;
  void *v41;
  GEOPDAutocompleteEntryOfflineArea *v42;
  uint64_t v43;
  void *v44;
  const __CFString *v45;
  void *v46;
  GEOPDAutocompleteEntryClientResolved *v47;
  uint64_t v48;
  void *v49;
  const __CFString *v50;
  void *v51;
  GEOPDAutocompleteEntryDirectionIntent *v52;
  uint64_t v53;
  void *v54;
  const __CFString *v55;
  void *v56;
  GEOPDRetainedSearchMetadata *v57;
  void *v58;
  const __CFString *v59;
  void *v60;
  GEOPDParsecRankingFeatures *v61;
  uint64_t v62;
  void *v63;
  const __CFString *v64;
  void *v65;
  const __CFString *v66;
  void *v67;
  id v68;
  uint64_t v69;
  const __CFString *v70;
  void *v71;
  GEOPDServerResultScoreMetadata *v72;
  id v73;
  const __CFString *v74;
  void *v75;
  float v76;
  const __CFString *v77;
  void *v78;
  const __CFString *v79;
  void *v80;
  void *v81;
  void *v82;
  GEOPDAutocompleteEntryCollection *v83;
  uint64_t v84;
  void *v85;
  void *v86;
  GEOPDAutocompleteEntryPublisher *v87;
  uint64_t v88;
  void *v89;
  const __CFString *v90;
  void *v91;

  v5 = a2;
  if (!a1)
    goto LABEL_176;
  a1 = (id)objc_msgSend(a1, "init");

  if (!a1)
    goto LABEL_176;
  if (a3)
    v6 = CFSTR("highlightMain");
  else
    v6 = CFSTR("highlight_main");
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = [GEOPDAutocompleteEntryHighlightLine alloc];
    if ((a3 & 1) != 0)
      v9 = -[GEOPDAutocompleteEntryHighlightLine initWithJSON:](v8, "initWithJSON:", v7);
    else
      v9 = -[GEOPDAutocompleteEntryHighlightLine initWithDictionary:](v8, "initWithDictionary:", v7);
    v10 = (void *)v9;
    objc_msgSend(a1, "setHighlightMain:", v9);

  }
  if (a3)
    v11 = CFSTR("highlightExtra");
  else
    v11 = CFSTR("highlight_extra");
  objc_msgSend(v5, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v13 = [GEOPDAutocompleteEntryHighlightLine alloc];
    if ((a3 & 1) != 0)
      v14 = -[GEOPDAutocompleteEntryHighlightLine initWithJSON:](v13, "initWithJSON:", v12);
    else
      v14 = -[GEOPDAutocompleteEntryHighlightLine initWithDictionary:](v13, "initWithDictionary:", v12);
    v15 = (void *)v14;
    objc_msgSend(a1, "setHighlightExtra:", v14);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("type"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v17 = v16;
    if ((objc_msgSend(v17, "isEqualToString:", CFSTR("QUERY")) & 1) != 0)
    {
      v18 = 0;
    }
    else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("BUSINESS")) & 1) != 0)
    {
      v18 = 1;
    }
    else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("ADDRESS")) & 1) != 0)
    {
      v18 = 2;
    }
    else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("CATEGORY")) & 1) != 0)
    {
      v18 = 3;
    }
    else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("BRAND_PROFILE")) & 1) != 0)
    {
      v18 = 4;
    }
    else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("OFFLINE_AREA")) & 1) != 0)
    {
      v18 = 5;
    }
    else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("CLIENT_RESOLVED")) & 1) != 0)
    {
      v18 = 6;
    }
    else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("DIRECTION_INTENT")) & 1) != 0)
    {
      v18 = 7;
    }
    else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("COLLECTION")) & 1) != 0)
    {
      v18 = 8;
    }
    else if (objc_msgSend(v17, "isEqualToString:", CFSTR("PUBLISHER")))
    {
      v18 = 9;
    }
    else
    {
      v18 = 0;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_45;
    v18 = objc_msgSend(v16, "intValue");
  }
  objc_msgSend(a1, "setType:", v18);
LABEL_45:

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("query"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v20 = [GEOPDAutocompleteEntryQuery alloc];
    if ((a3 & 1) != 0)
      v21 = -[GEOPDAutocompleteEntryQuery initWithJSON:](v20, "initWithJSON:", v19);
    else
      v21 = -[GEOPDAutocompleteEntryQuery initWithDictionary:](v20, "initWithDictionary:", v19);
    v22 = (void *)v21;
    objc_msgSend(a1, "setQuery:", v21);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("business"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v24 = [GEOPDAutocompleteEntryBusiness alloc];
    if ((a3 & 1) != 0)
      v25 = -[GEOPDAutocompleteEntryBusiness initWithJSON:](v24, "initWithJSON:", v23);
    else
      v25 = -[GEOPDAutocompleteEntryBusiness initWithDictionary:](v24, "initWithDictionary:", v23);
    v26 = (void *)v25;
    objc_msgSend(a1, "setBusiness:", v25);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("address"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v28 = [GEOPDAutocompleteEntryAddress alloc];
    if ((a3 & 1) != 0)
      v29 = -[GEOPDAutocompleteEntryAddress initWithJSON:](v28, "initWithJSON:", v27);
    else
      v29 = -[GEOPDAutocompleteEntryAddress initWithDictionary:](v28, "initWithDictionary:", v27);
    v30 = (void *)v29;
    objc_msgSend(a1, "setAddress:", v29);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("category"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v32 = [GEOPDAutocompleteEntryCategory alloc];
    if ((a3 & 1) != 0)
      v33 = -[GEOPDAutocompleteEntryCategory initWithJSON:](v32, "initWithJSON:", v31);
    else
      v33 = -[GEOPDAutocompleteEntryCategory initWithDictionary:](v32, "initWithDictionary:", v31);
    v34 = (void *)v33;
    objc_msgSend(a1, "setCategory:", v33);

  }
  if (a3)
    v35 = CFSTR("brandProfile");
  else
    v35 = CFSTR("brand_profile");
  objc_msgSend(v5, "objectForKeyedSubscript:", v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v37 = [GEOPDAutocompleteEntryBrandProfile alloc];
    if ((a3 & 1) != 0)
      v38 = -[GEOPDAutocompleteEntryBrandProfile initWithJSON:](v37, "initWithJSON:", v36);
    else
      v38 = -[GEOPDAutocompleteEntryBrandProfile initWithDictionary:](v37, "initWithDictionary:", v36);
    v39 = (void *)v38;
    objc_msgSend(a1, "setBrandProfile:", v38);

  }
  if (a3)
    v40 = CFSTR("offlineArea");
  else
    v40 = CFSTR("offline_area");
  objc_msgSend(v5, "objectForKeyedSubscript:", v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v42 = [GEOPDAutocompleteEntryOfflineArea alloc];
    if ((a3 & 1) != 0)
      v43 = -[GEOPDAutocompleteEntryOfflineArea initWithJSON:](v42, "initWithJSON:", v41);
    else
      v43 = -[GEOPDAutocompleteEntryOfflineArea initWithDictionary:](v42, "initWithDictionary:", v41);
    v44 = (void *)v43;
    objc_msgSend(a1, "setOfflineArea:", v43);

  }
  if (a3)
    v45 = CFSTR("clientResolved");
  else
    v45 = CFSTR("client_resolved");
  objc_msgSend(v5, "objectForKeyedSubscript:", v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v47 = [GEOPDAutocompleteEntryClientResolved alloc];
    if ((a3 & 1) != 0)
      v48 = -[GEOPDAutocompleteEntryClientResolved initWithJSON:](v47, "initWithJSON:", v46);
    else
      v48 = -[GEOPDAutocompleteEntryClientResolved initWithDictionary:](v47, "initWithDictionary:", v46);
    v49 = (void *)v48;
    objc_msgSend(a1, "setClientResolved:", v48);

  }
  if (a3)
    v50 = CFSTR("directionIntent");
  else
    v50 = CFSTR("direction_intent");
  objc_msgSend(v5, "objectForKeyedSubscript:", v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v52 = [GEOPDAutocompleteEntryDirectionIntent alloc];
    if ((a3 & 1) != 0)
      v53 = -[GEOPDAutocompleteEntryDirectionIntent initWithJSON:](v52, "initWithJSON:", v51);
    else
      v53 = -[GEOPDAutocompleteEntryDirectionIntent initWithDictionary:](v52, "initWithDictionary:", v51);
    v54 = (void *)v53;
    objc_msgSend(a1, "setDirectionIntent:", v53);

  }
  if (a3)
    v55 = CFSTR("retainSearch");
  else
    v55 = CFSTR("retain_search");
  objc_msgSend(v5, "objectForKeyedSubscript:", v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v57 = [GEOPDRetainedSearchMetadata alloc];
    if (v57)
      v58 = (void *)-[GEOPDRetainedSearchMetadata _initWithDictionary:isJSON:]((uint64_t)v57, v56, a3);
    else
      v58 = 0;
    objc_msgSend(a1, "setRetainSearch:", v58);

  }
  if (a3)
    v59 = CFSTR("parsecRankingFeatures");
  else
    v59 = CFSTR("parsec_ranking_features");
  objc_msgSend(v5, "objectForKeyedSubscript:", v59);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v61 = [GEOPDParsecRankingFeatures alloc];
    if ((a3 & 1) != 0)
      v62 = -[GEOPDParsecRankingFeatures initWithJSON:](v61, "initWithJSON:", v60);
    else
      v62 = -[GEOPDParsecRankingFeatures initWithDictionary:](v61, "initWithDictionary:", v60);
    v63 = (void *)v62;
    objc_msgSend(a1, "setParsecRankingFeatures:", v62);

  }
  if (a3)
    v64 = CFSTR("sortPriority");
  else
    v64 = CFSTR("sort_priority");
  objc_msgSend(v5, "objectForKeyedSubscript:", v64);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setSortPriority:", objc_msgSend(v65, "intValue"));

  if (a3)
    v66 = CFSTR("autocompleteResultCellType");
  else
    v66 = CFSTR("autocomplete_result_cell_type");
  objc_msgSend(v5, "objectForKeyedSubscript:", v66);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v68 = v67;
    if ((objc_msgSend(v68, "isEqualToString:", CFSTR("AUTOCOMPLETE_RESULT_CELL_TYPE_DEFAULT")) & 1) != 0)
    {
      v69 = 0;
    }
    else if ((objc_msgSend(v68, "isEqualToString:", CFSTR("AUTOCOMPLETE_RESULT_CELL_TYPE_PROMINENT_QUERY")) & 1) != 0)
    {
      v69 = 1;
    }
    else if ((objc_msgSend(v68, "isEqualToString:", CFSTR("AUTOCOMPLETE_RESULT_CELL_TYPE_PROMINENT_RESULT")) & 1) != 0)
    {
      v69 = 2;
    }
    else if ((objc_msgSend(v68, "isEqualToString:", CFSTR("AUTOCOMPLETE_RESULT_CELL_TYPE_TWO_LINE")) & 1) != 0)
    {
      v69 = 3;
    }
    else if (objc_msgSend(v68, "isEqualToString:", CFSTR("AUTOCOMPLETE_RESULT_CELL_TYPE_PROMINENT_RESULT_TWO_LINE")))
    {
      v69 = 4;
    }
    else
    {
      v69 = 0;
    }

    goto LABEL_135;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v69 = objc_msgSend(v67, "intValue");
LABEL_135:
    objc_msgSend(a1, "setAutocompleteResultCellType:", v69);
  }

  if (a3)
    v70 = CFSTR("serverResultScoreMetadata");
  else
    v70 = CFSTR("server_result_score_metadata");
  objc_msgSend(v5, "objectForKeyedSubscript:", v70);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v72 = [GEOPDServerResultScoreMetadata alloc];
    if (v72)
    {
      v73 = v71;
      v72 = -[GEOPDServerResultScoreMetadata init](v72, "init");
      if (v72)
      {
        if (a3)
          v74 = CFSTR("normalizedScore");
        else
          v74 = CFSTR("normalized_score");
        objc_msgSend(v73, "objectForKeyedSubscript:", v74);
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v75, "floatValue");
          *(_BYTE *)&v72->_flags |= 1u;
          v72->_normalizedScore = v76;
        }

      }
    }
    objc_msgSend(a1, "setServerResultScoreMetadata:", v72);

  }
  if (a3)
    v77 = CFSTR("enableQueryAcceleratorAffordance");
  else
    v77 = CFSTR("enable_query_accelerator_affordance");
  objc_msgSend(v5, "objectForKeyedSubscript:", v77);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setEnableQueryAcceleratorAffordance:", objc_msgSend(v78, "BOOLValue"));

  if (a3)
    v79 = CFSTR("queryAcceleratorCompletionString");
  else
    v79 = CFSTR("query_accelerator_completion_string");
  objc_msgSend(v5, "objectForKeyedSubscript:", v79);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v81 = (void *)objc_msgSend(v80, "copy");
    objc_msgSend(a1, "setQueryAcceleratorCompletionString:", v81);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("collection"));
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v83 = [GEOPDAutocompleteEntryCollection alloc];
    if ((a3 & 1) != 0)
      v84 = -[GEOPDAutocompleteEntryCollection initWithJSON:](v83, "initWithJSON:", v82);
    else
      v84 = -[GEOPDAutocompleteEntryCollection initWithDictionary:](v83, "initWithDictionary:", v82);
    v85 = (void *)v84;
    objc_msgSend(a1, "setCollection:", v84);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("publisher"));
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v87 = [GEOPDAutocompleteEntryPublisher alloc];
    if ((a3 & 1) != 0)
      v88 = -[GEOPDAutocompleteEntryPublisher initWithJSON:](v87, "initWithJSON:", v86);
    else
      v88 = -[GEOPDAutocompleteEntryPublisher initWithDictionary:](v87, "initWithDictionary:", v86);
    v89 = (void *)v88;
    objc_msgSend(a1, "setPublisher:", v88);

  }
  if (a3)
    v90 = CFSTR("autocompleteOriginationTypeNumber");
  else
    v90 = CFSTR("autocomplete_origination_type_number");
  objc_msgSend(v5, "objectForKeyedSubscript:", v90);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setAutocompleteOriginationTypeNumber:", objc_msgSend(v91, "unsignedIntValue"));

  a1 = a1;
LABEL_176:

  return a1;
}

- (GEOPDAutocompleteEntry)initWithJSON:(id)a3
{
  return (GEOPDAutocompleteEntry *)-[GEOPDAutocompleteEntry _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_12;
    else
      v8 = (int *)&readAll__nonRecursiveTag_12;
    GEOPDAutocompleteEntryReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEOPDAutocompleteEntryCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPDAutocompleteEntryIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDAutocompleteEntryReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  id v5;
  $EC00EBA47C74C596B32E42AC7A87C130 flags;
  PBDataReader *v7;
  void *v8;
  id v9;

  v9 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPDAutocompleteEntryIsDirty((uint64_t)self) & 1) == 0)
  {
    v7 = self->_reader;
    objc_sync_enter(v7);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "writeData:", v8);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v7);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDAutocompleteEntry readAll:](self, "readAll:", 0);
    if (self->_highlightMain)
      PBDataWriterWriteSubmessage();
    v5 = v9;
    if (self->_highlightExtra)
    {
      PBDataWriterWriteSubmessage();
      v5 = v9;
    }
    if ((*(_BYTE *)&self->_flags & 8) != 0)
    {
      PBDataWriterWriteInt32Field();
      v5 = v9;
    }
    if (self->_query)
    {
      PBDataWriterWriteSubmessage();
      v5 = v9;
    }
    if (self->_business)
    {
      PBDataWriterWriteSubmessage();
      v5 = v9;
    }
    if (self->_address)
    {
      PBDataWriterWriteSubmessage();
      v5 = v9;
    }
    if (self->_category)
    {
      PBDataWriterWriteSubmessage();
      v5 = v9;
    }
    if (self->_brandProfile)
    {
      PBDataWriterWriteSubmessage();
      v5 = v9;
    }
    if (self->_offlineArea)
    {
      PBDataWriterWriteSubmessage();
      v5 = v9;
    }
    if (self->_clientResolved)
    {
      PBDataWriterWriteSubmessage();
      v5 = v9;
    }
    if (self->_directionIntent)
    {
      PBDataWriterWriteSubmessage();
      v5 = v9;
    }
    if (self->_retainSearch)
    {
      PBDataWriterWriteSubmessage();
      v5 = v9;
    }
    if (self->_parsecRankingFeatures)
    {
      PBDataWriterWriteSubmessage();
      v5 = v9;
    }
    flags = self->_flags;
    if ((*(_BYTE *)&flags & 4) != 0)
    {
      PBDataWriterWriteInt32Field();
      v5 = v9;
      flags = self->_flags;
    }
    if ((*(_BYTE *)&flags & 2) != 0)
    {
      PBDataWriterWriteInt32Field();
      v5 = v9;
    }
    if (self->_serverResultScoreMetadata)
    {
      PBDataWriterWriteSubmessage();
      v5 = v9;
    }
    if ((*(_BYTE *)&self->_flags & 0x10) != 0)
    {
      PBDataWriterWriteBOOLField();
      v5 = v9;
    }
    if (self->_queryAcceleratorCompletionString)
    {
      PBDataWriterWriteStringField();
      v5 = v9;
    }
    if (self->_collection)
    {
      PBDataWriterWriteSubmessage();
      v5 = v9;
    }
    if (self->_publisher)
    {
      PBDataWriterWriteSubmessage();
      v5 = v9;
    }
    if ((*(_BYTE *)&self->_flags & 1) != 0)
    {
      PBDataWriterWriteUint32Field();
      v5 = v9;
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v5);
  }

}

- (void)clearSensitiveFields:(unint64_t)a3
{
  GEOPDAutocompleteEntryClearSensitiveFields(self, a3, 1);
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[GEOPDAutocompleteEntry _readAddress]((uint64_t)self);
  if (-[GEOPDAutocompleteEntryAddress hasGreenTeaWithValue:](self->_address, "hasGreenTeaWithValue:", v3))
    return 1;
  -[GEOPDAutocompleteEntry _readBusiness]((uint64_t)self);
  if (-[GEOPDAutocompleteEntryBusiness hasGreenTeaWithValue:](self->_business, "hasGreenTeaWithValue:", v3))
    return 1;
  -[GEOPDAutocompleteEntry _readCollection]((uint64_t)self);
  if (-[GEOPDAutocompleteEntryCollection hasGreenTeaWithValue:](self->_collection, "hasGreenTeaWithValue:", v3))
    return 1;
  -[GEOPDAutocompleteEntry _readOfflineArea]((uint64_t)self);
  if (-[GEOPDAutocompleteEntryOfflineArea hasGreenTeaWithValue:](self->_offlineArea, "hasGreenTeaWithValue:", v3))
    return 1;
  -[GEOPDAutocompleteEntry _readPublisher]((uint64_t)self);
  if (-[GEOPDAutocompleteEntryPublisher hasGreenTeaWithValue:](self->_publisher, "hasGreenTeaWithValue:", v3))
    return 1;
  -[GEOPDAutocompleteEntry _readQuery]((uint64_t)self);
  return -[GEOPDAutocompleteEntryQuery hasGreenTeaWithValue:](self->_query, "hasGreenTeaWithValue:", v3);
}

- (void)copyTo:(id)a3
{
  id *v4;
  $EC00EBA47C74C596B32E42AC7A87C130 flags;
  id *v6;

  v6 = (id *)a3;
  -[GEOPDAutocompleteEntry readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v6 + 1, self->_reader);
  *((_DWORD *)v6 + 38) = self->_readerMarkPos;
  *((_DWORD *)v6 + 39) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_highlightMain)
    objc_msgSend(v6, "setHighlightMain:");
  if (self->_highlightExtra)
    objc_msgSend(v6, "setHighlightExtra:");
  v4 = v6;
  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
    *((_DWORD *)v6 + 44) = self->_type;
    *((_DWORD *)v6 + 46) |= 8u;
  }
  if (self->_query)
  {
    objc_msgSend(v6, "setQuery:");
    v4 = v6;
  }
  if (self->_business)
  {
    objc_msgSend(v6, "setBusiness:");
    v4 = v6;
  }
  if (self->_address)
  {
    objc_msgSend(v6, "setAddress:");
    v4 = v6;
  }
  if (self->_category)
  {
    objc_msgSend(v6, "setCategory:");
    v4 = v6;
  }
  if (self->_brandProfile)
  {
    objc_msgSend(v6, "setBrandProfile:");
    v4 = v6;
  }
  if (self->_offlineArea)
  {
    objc_msgSend(v6, "setOfflineArea:");
    v4 = v6;
  }
  if (self->_clientResolved)
  {
    objc_msgSend(v6, "setClientResolved:");
    v4 = v6;
  }
  if (self->_directionIntent)
  {
    objc_msgSend(v6, "setDirectionIntent:");
    v4 = v6;
  }
  if (self->_retainSearch)
  {
    objc_msgSend(v6, "setRetainSearch:");
    v4 = v6;
  }
  if (self->_parsecRankingFeatures)
  {
    objc_msgSend(v6, "setParsecRankingFeatures:");
    v4 = v6;
  }
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 4) != 0)
  {
    *((_DWORD *)v4 + 43) = self->_sortPriority;
    *((_DWORD *)v4 + 46) |= 4u;
    flags = self->_flags;
  }
  if ((*(_BYTE *)&flags & 2) != 0)
  {
    *((_DWORD *)v4 + 42) = self->_autocompleteResultCellType;
    *((_DWORD *)v4 + 46) |= 2u;
  }
  if (self->_serverResultScoreMetadata)
  {
    objc_msgSend(v6, "setServerResultScoreMetadata:");
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_flags & 0x10) != 0)
  {
    *((_BYTE *)v4 + 180) = self->_enableQueryAcceleratorAffordance;
    *((_DWORD *)v4 + 46) |= 0x10u;
  }
  if (self->_queryAcceleratorCompletionString)
  {
    objc_msgSend(v6, "setQueryAcceleratorCompletionString:");
    v4 = v6;
  }
  if (self->_collection)
  {
    objc_msgSend(v6, "setCollection:");
    v4 = v6;
  }
  if (self->_publisher)
  {
    objc_msgSend(v6, "setPublisher:");
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *((_DWORD *)v4 + 41) = self->_autocompleteOriginationTypeNumber;
    *((_DWORD *)v4 + 46) |= 1u;
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
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  $EC00EBA47C74C596B32E42AC7A87C130 flags;
  id v34;
  void *v35;
  uint64_t v36;
  void *v37;
  id v38;
  void *v39;
  id v40;
  void *v41;
  PBUnknownFields *v42;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*((_BYTE *)&self->_flags + 2) & 0x40) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOPDAutocompleteEntryReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_16;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDAutocompleteEntry readAll:](self, "readAll:", 0);
  v9 = -[GEOPDAutocompleteEntryHighlightLine copyWithZone:](self->_highlightMain, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v9;

  v11 = -[GEOPDAutocompleteEntryHighlightLine copyWithZone:](self->_highlightExtra, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v11;

  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
    *(_DWORD *)(v5 + 176) = self->_type;
    *(_DWORD *)(v5 + 184) |= 8u;
  }
  v13 = -[GEOPDAutocompleteEntryQuery copyWithZone:](self->_query, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 128);
  *(_QWORD *)(v5 + 128) = v13;

  v15 = -[GEOPDAutocompleteEntryBusiness copyWithZone:](self->_business, "copyWithZone:", a3);
  v16 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v15;

  v17 = -[GEOPDAutocompleteEntryAddress copyWithZone:](self->_address, "copyWithZone:", a3);
  v18 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v17;

  v19 = -[GEOPDAutocompleteEntryCategory copyWithZone:](self->_category, "copyWithZone:", a3);
  v20 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v19;

  v21 = -[GEOPDAutocompleteEntryBrandProfile copyWithZone:](self->_brandProfile, "copyWithZone:", a3);
  v22 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v21;

  v23 = -[GEOPDAutocompleteEntryOfflineArea copyWithZone:](self->_offlineArea, "copyWithZone:", a3);
  v24 = *(void **)(v5 + 96);
  *(_QWORD *)(v5 + 96) = v23;

  v25 = -[GEOPDAutocompleteEntryClientResolved copyWithZone:](self->_clientResolved, "copyWithZone:", a3);
  v26 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v25;

  v27 = -[GEOPDAutocompleteEntryDirectionIntent copyWithZone:](self->_directionIntent, "copyWithZone:", a3);
  v28 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v27;

  v29 = -[GEOPDRetainedSearchMetadata copyWithZone:](self->_retainSearch, "copyWithZone:", a3);
  v30 = *(void **)(v5 + 136);
  *(_QWORD *)(v5 + 136) = v29;

  v31 = -[GEOPDParsecRankingFeatures copyWithZone:](self->_parsecRankingFeatures, "copyWithZone:", a3);
  v32 = *(void **)(v5 + 104);
  *(_QWORD *)(v5 + 104) = v31;

  flags = self->_flags;
  if ((*(_BYTE *)&flags & 4) != 0)
  {
    *(_DWORD *)(v5 + 172) = self->_sortPriority;
    *(_DWORD *)(v5 + 184) |= 4u;
    flags = self->_flags;
  }
  if ((*(_BYTE *)&flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 168) = self->_autocompleteResultCellType;
    *(_DWORD *)(v5 + 184) |= 2u;
  }
  v34 = -[GEOPDServerResultScoreMetadata copyWithZone:](self->_serverResultScoreMetadata, "copyWithZone:", a3);
  v35 = *(void **)(v5 + 144);
  *(_QWORD *)(v5 + 144) = v34;

  if ((*(_BYTE *)&self->_flags & 0x10) != 0)
  {
    *(_BYTE *)(v5 + 180) = self->_enableQueryAcceleratorAffordance;
    *(_DWORD *)(v5 + 184) |= 0x10u;
  }
  v36 = -[NSString copyWithZone:](self->_queryAcceleratorCompletionString, "copyWithZone:", a3);
  v37 = *(void **)(v5 + 120);
  *(_QWORD *)(v5 + 120) = v36;

  v38 = -[GEOPDAutocompleteEntryCollection copyWithZone:](self->_collection, "copyWithZone:", a3);
  v39 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v38;

  v40 = -[GEOPDAutocompleteEntryPublisher copyWithZone:](self->_publisher, "copyWithZone:", a3);
  v41 = *(void **)(v5 + 112);
  *(_QWORD *)(v5 + 112) = v40;

  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 164) = self->_autocompleteOriginationTypeNumber;
    *(_DWORD *)(v5 + 184) |= 1u;
  }
  v42 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v42;
LABEL_16:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  GEOPDAutocompleteEntryHighlightLine *highlightMain;
  GEOPDAutocompleteEntryHighlightLine *highlightExtra;
  int v7;
  GEOPDAutocompleteEntryQuery *query;
  GEOPDAutocompleteEntryBusiness *business;
  GEOPDAutocompleteEntryAddress *address;
  GEOPDAutocompleteEntryCategory *category;
  GEOPDAutocompleteEntryBrandProfile *brandProfile;
  GEOPDAutocompleteEntryOfflineArea *offlineArea;
  GEOPDAutocompleteEntryClientResolved *clientResolved;
  GEOPDAutocompleteEntryDirectionIntent *directionIntent;
  GEOPDRetainedSearchMetadata *retainSearch;
  GEOPDParsecRankingFeatures *parsecRankingFeatures;
  $EC00EBA47C74C596B32E42AC7A87C130 flags;
  int v19;
  GEOPDServerResultScoreMetadata *serverResultScoreMetadata;
  NSString *queryAcceleratorCompletionString;
  GEOPDAutocompleteEntryCollection *collection;
  GEOPDAutocompleteEntryPublisher *publisher;
  BOOL v24;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_63;
  -[GEOPDAutocompleteEntry readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  highlightMain = self->_highlightMain;
  if ((unint64_t)highlightMain | *((_QWORD *)v4 + 11))
  {
    if (!-[GEOPDAutocompleteEntryHighlightLine isEqual:](highlightMain, "isEqual:"))
      goto LABEL_63;
  }
  highlightExtra = self->_highlightExtra;
  if ((unint64_t)highlightExtra | *((_QWORD *)v4 + 10))
  {
    if (!-[GEOPDAutocompleteEntryHighlightLine isEqual:](highlightExtra, "isEqual:"))
      goto LABEL_63;
  }
  v7 = *((_DWORD *)v4 + 46);
  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_type != *((_DWORD *)v4 + 44))
      goto LABEL_63;
  }
  else if ((v7 & 8) != 0)
  {
    goto LABEL_63;
  }
  query = self->_query;
  if ((unint64_t)query | *((_QWORD *)v4 + 16) && !-[GEOPDAutocompleteEntryQuery isEqual:](query, "isEqual:"))
    goto LABEL_63;
  business = self->_business;
  if ((unint64_t)business | *((_QWORD *)v4 + 5))
  {
    if (!-[GEOPDAutocompleteEntryBusiness isEqual:](business, "isEqual:"))
      goto LABEL_63;
  }
  address = self->_address;
  if ((unint64_t)address | *((_QWORD *)v4 + 3))
  {
    if (!-[GEOPDAutocompleteEntryAddress isEqual:](address, "isEqual:"))
      goto LABEL_63;
  }
  category = self->_category;
  if ((unint64_t)category | *((_QWORD *)v4 + 6))
  {
    if (!-[GEOPDAutocompleteEntryCategory isEqual:](category, "isEqual:"))
      goto LABEL_63;
  }
  brandProfile = self->_brandProfile;
  if ((unint64_t)brandProfile | *((_QWORD *)v4 + 4))
  {
    if (!-[GEOPDAutocompleteEntryBrandProfile isEqual:](brandProfile, "isEqual:"))
      goto LABEL_63;
  }
  offlineArea = self->_offlineArea;
  if ((unint64_t)offlineArea | *((_QWORD *)v4 + 12))
  {
    if (!-[GEOPDAutocompleteEntryOfflineArea isEqual:](offlineArea, "isEqual:"))
      goto LABEL_63;
  }
  clientResolved = self->_clientResolved;
  if ((unint64_t)clientResolved | *((_QWORD *)v4 + 7))
  {
    if (!-[GEOPDAutocompleteEntryClientResolved isEqual:](clientResolved, "isEqual:"))
      goto LABEL_63;
  }
  directionIntent = self->_directionIntent;
  if ((unint64_t)directionIntent | *((_QWORD *)v4 + 9))
  {
    if (!-[GEOPDAutocompleteEntryDirectionIntent isEqual:](directionIntent, "isEqual:"))
      goto LABEL_63;
  }
  retainSearch = self->_retainSearch;
  if ((unint64_t)retainSearch | *((_QWORD *)v4 + 17))
  {
    if (!-[GEOPDRetainedSearchMetadata isEqual:](retainSearch, "isEqual:"))
      goto LABEL_63;
  }
  parsecRankingFeatures = self->_parsecRankingFeatures;
  if ((unint64_t)parsecRankingFeatures | *((_QWORD *)v4 + 13))
  {
    if (!-[GEOPDParsecRankingFeatures isEqual:](parsecRankingFeatures, "isEqual:"))
      goto LABEL_63;
  }
  flags = self->_flags;
  v19 = *((_DWORD *)v4 + 46);
  if ((*(_BYTE *)&flags & 4) != 0)
  {
    if ((v19 & 4) == 0 || self->_sortPriority != *((_DWORD *)v4 + 43))
      goto LABEL_63;
  }
  else if ((v19 & 4) != 0)
  {
    goto LABEL_63;
  }
  if ((*(_BYTE *)&flags & 2) != 0)
  {
    if ((v19 & 2) == 0 || self->_autocompleteResultCellType != *((_DWORD *)v4 + 42))
      goto LABEL_63;
  }
  else if ((v19 & 2) != 0)
  {
    goto LABEL_63;
  }
  serverResultScoreMetadata = self->_serverResultScoreMetadata;
  if ((unint64_t)serverResultScoreMetadata | *((_QWORD *)v4 + 18))
  {
    if (!-[GEOPDServerResultScoreMetadata isEqual:](serverResultScoreMetadata, "isEqual:"))
      goto LABEL_63;
    flags = self->_flags;
    v19 = *((_DWORD *)v4 + 46);
  }
  if ((*(_BYTE *)&flags & 0x10) != 0)
  {
    if ((v19 & 0x10) != 0)
    {
      if (self->_enableQueryAcceleratorAffordance)
      {
        if (!*((_BYTE *)v4 + 180))
          goto LABEL_63;
        goto LABEL_52;
      }
      if (!*((_BYTE *)v4 + 180))
        goto LABEL_52;
    }
LABEL_63:
    v24 = 0;
    goto LABEL_64;
  }
  if ((v19 & 0x10) != 0)
    goto LABEL_63;
LABEL_52:
  queryAcceleratorCompletionString = self->_queryAcceleratorCompletionString;
  if ((unint64_t)queryAcceleratorCompletionString | *((_QWORD *)v4 + 15)
    && !-[NSString isEqual:](queryAcceleratorCompletionString, "isEqual:"))
  {
    goto LABEL_63;
  }
  collection = self->_collection;
  if ((unint64_t)collection | *((_QWORD *)v4 + 8))
  {
    if (!-[GEOPDAutocompleteEntryCollection isEqual:](collection, "isEqual:"))
      goto LABEL_63;
  }
  publisher = self->_publisher;
  if ((unint64_t)publisher | *((_QWORD *)v4 + 14))
  {
    if (!-[GEOPDAutocompleteEntryPublisher isEqual:](publisher, "isEqual:"))
      goto LABEL_63;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_DWORD *)v4 + 46) & 1) == 0 || self->_autocompleteOriginationTypeNumber != *((_DWORD *)v4 + 41))
      goto LABEL_63;
    v24 = 1;
  }
  else
  {
    v24 = (*((_DWORD *)v4 + 46) & 1) == 0;
  }
LABEL_64:

  return v24;
}

- (unint64_t)hash
{
  $EC00EBA47C74C596B32E42AC7A87C130 flags;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  NSUInteger v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;

  -[GEOPDAutocompleteEntry readAll:](self, "readAll:", 1);
  v25 = -[GEOPDAutocompleteEntryHighlightLine hash](self->_highlightMain, "hash");
  v24 = -[GEOPDAutocompleteEntryHighlightLine hash](self->_highlightExtra, "hash");
  if ((*(_BYTE *)&self->_flags & 8) != 0)
    v23 = 2654435761 * self->_type;
  else
    v23 = 0;
  v22 = -[GEOPDAutocompleteEntryQuery hash](self->_query, "hash");
  v21 = -[GEOPDAutocompleteEntryBusiness hash](self->_business, "hash");
  v20 = -[GEOPDAutocompleteEntryAddress hash](self->_address, "hash");
  v19 = -[GEOPDAutocompleteEntryCategory hash](self->_category, "hash");
  v18 = -[GEOPDAutocompleteEntryBrandProfile hash](self->_brandProfile, "hash");
  v17 = -[GEOPDAutocompleteEntryOfflineArea hash](self->_offlineArea, "hash");
  v16 = -[GEOPDAutocompleteEntryClientResolved hash](self->_clientResolved, "hash");
  v15 = -[GEOPDAutocompleteEntryDirectionIntent hash](self->_directionIntent, "hash");
  v14 = -[GEOPDRetainedSearchMetadata hash](self->_retainSearch, "hash");
  v13 = -[GEOPDParsecRankingFeatures hash](self->_parsecRankingFeatures, "hash");
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 4) != 0)
  {
    v4 = 2654435761 * self->_sortPriority;
    if ((*(_BYTE *)&flags & 2) != 0)
      goto LABEL_6;
  }
  else
  {
    v4 = 0;
    if ((*(_BYTE *)&flags & 2) != 0)
    {
LABEL_6:
      v5 = 2654435761 * self->_autocompleteResultCellType;
      goto LABEL_9;
    }
  }
  v5 = 0;
LABEL_9:
  v6 = -[GEOPDServerResultScoreMetadata hash](self->_serverResultScoreMetadata, "hash");
  if ((*(_BYTE *)&self->_flags & 0x10) != 0)
    v7 = 2654435761 * self->_enableQueryAcceleratorAffordance;
  else
    v7 = 0;
  v8 = -[NSString hash](self->_queryAcceleratorCompletionString, "hash");
  v9 = -[GEOPDAutocompleteEntryCollection hash](self->_collection, "hash");
  v10 = -[GEOPDAutocompleteEntryPublisher hash](self->_publisher, "hash");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v11 = 2654435761 * self->_autocompleteOriginationTypeNumber;
  else
    v11 = 0;
  return v24 ^ v25 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v18 ^ v17 ^ v16 ^ v15 ^ v14 ^ v13 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  GEOPDAutocompleteEntryHighlightLine *highlightMain;
  uint64_t v6;
  GEOPDAutocompleteEntryHighlightLine *highlightExtra;
  uint64_t v8;
  GEOPDAutocompleteEntryQuery *query;
  uint64_t v10;
  GEOPDAutocompleteEntryBusiness *business;
  uint64_t v12;
  GEOPDAutocompleteEntryAddress *address;
  uint64_t v14;
  GEOPDAutocompleteEntryCategory *category;
  uint64_t v16;
  GEOPDAutocompleteEntryBrandProfile *brandProfile;
  uint64_t v18;
  GEOPDAutocompleteEntryOfflineArea *offlineArea;
  uint64_t v20;
  GEOPDAutocompleteEntryClientResolved *clientResolved;
  uint64_t v22;
  GEOPDAutocompleteEntryDirectionIntent *directionIntent;
  uint64_t v24;
  GEOPDRetainedSearchMetadata *retainSearch;
  void *v26;
  GEOPDParsecRankingFeatures *parsecRankingFeatures;
  uint64_t v28;
  int v29;
  GEOPDServerResultScoreMetadata *serverResultScoreMetadata;
  void *v31;
  float *v32;
  GEOPDAutocompleteEntryCollection *collection;
  uint64_t v34;
  GEOPDAutocompleteEntryPublisher *publisher;
  uint64_t v36;
  _QWORD *v37;

  v37 = a3;
  objc_msgSend(v37, "readAll:", 0);
  v4 = v37;
  highlightMain = self->_highlightMain;
  v6 = v37[11];
  if (highlightMain)
  {
    if (!v6)
      goto LABEL_7;
    -[GEOPDAutocompleteEntryHighlightLine mergeFrom:](highlightMain, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[GEOPDAutocompleteEntry setHighlightMain:](self, "setHighlightMain:");
  }
  v4 = v37;
LABEL_7:
  highlightExtra = self->_highlightExtra;
  v8 = v4[10];
  if (highlightExtra)
  {
    if (!v8)
      goto LABEL_13;
    -[GEOPDAutocompleteEntryHighlightLine mergeFrom:](highlightExtra, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_13;
    -[GEOPDAutocompleteEntry setHighlightExtra:](self, "setHighlightExtra:");
  }
  v4 = v37;
LABEL_13:
  if ((v4[23] & 8) != 0)
  {
    self->_type = *((_DWORD *)v4 + 44);
    *(_DWORD *)&self->_flags |= 8u;
  }
  query = self->_query;
  v10 = v4[16];
  if (query)
  {
    if (!v10)
      goto LABEL_21;
    -[GEOPDAutocompleteEntryQuery mergeFrom:](query, "mergeFrom:");
  }
  else
  {
    if (!v10)
      goto LABEL_21;
    -[GEOPDAutocompleteEntry setQuery:](self, "setQuery:");
  }
  v4 = v37;
LABEL_21:
  business = self->_business;
  v12 = v4[5];
  if (business)
  {
    if (!v12)
      goto LABEL_27;
    -[GEOPDAutocompleteEntryBusiness mergeFrom:](business, "mergeFrom:");
  }
  else
  {
    if (!v12)
      goto LABEL_27;
    -[GEOPDAutocompleteEntry setBusiness:](self, "setBusiness:");
  }
  v4 = v37;
LABEL_27:
  address = self->_address;
  v14 = v4[3];
  if (address)
  {
    if (!v14)
      goto LABEL_33;
    -[GEOPDAutocompleteEntryAddress mergeFrom:](address, "mergeFrom:");
  }
  else
  {
    if (!v14)
      goto LABEL_33;
    -[GEOPDAutocompleteEntry setAddress:](self, "setAddress:");
  }
  v4 = v37;
LABEL_33:
  category = self->_category;
  v16 = v4[6];
  if (category)
  {
    if (!v16)
      goto LABEL_39;
    -[GEOPDAutocompleteEntryCategory mergeFrom:](category, "mergeFrom:");
  }
  else
  {
    if (!v16)
      goto LABEL_39;
    -[GEOPDAutocompleteEntry setCategory:](self, "setCategory:");
  }
  v4 = v37;
LABEL_39:
  brandProfile = self->_brandProfile;
  v18 = v4[4];
  if (brandProfile)
  {
    if (!v18)
      goto LABEL_45;
    -[GEOPDAutocompleteEntryBrandProfile mergeFrom:](brandProfile, "mergeFrom:");
  }
  else
  {
    if (!v18)
      goto LABEL_45;
    -[GEOPDAutocompleteEntry setBrandProfile:](self, "setBrandProfile:");
  }
  v4 = v37;
LABEL_45:
  offlineArea = self->_offlineArea;
  v20 = v4[12];
  if (offlineArea)
  {
    if (!v20)
      goto LABEL_51;
    -[GEOPDAutocompleteEntryOfflineArea mergeFrom:](offlineArea, "mergeFrom:");
  }
  else
  {
    if (!v20)
      goto LABEL_51;
    -[GEOPDAutocompleteEntry setOfflineArea:](self, "setOfflineArea:");
  }
  v4 = v37;
LABEL_51:
  clientResolved = self->_clientResolved;
  v22 = v4[7];
  if (clientResolved)
  {
    if (!v22)
      goto LABEL_57;
    -[GEOPDAutocompleteEntryClientResolved mergeFrom:](clientResolved, "mergeFrom:");
  }
  else
  {
    if (!v22)
      goto LABEL_57;
    -[GEOPDAutocompleteEntry setClientResolved:](self, "setClientResolved:");
  }
  v4 = v37;
LABEL_57:
  directionIntent = self->_directionIntent;
  v24 = v4[9];
  if (directionIntent)
  {
    if (!v24)
      goto LABEL_63;
    -[GEOPDAutocompleteEntryDirectionIntent mergeFrom:](directionIntent, "mergeFrom:");
  }
  else
  {
    if (!v24)
      goto LABEL_63;
    -[GEOPDAutocompleteEntry setDirectionIntent:](self, "setDirectionIntent:");
  }
  v4 = v37;
LABEL_63:
  retainSearch = self->_retainSearch;
  v26 = (void *)v4[17];
  if (retainSearch)
  {
    if (!v26)
      goto LABEL_69;
    -[GEOPDRetainedSearchMetadata mergeFrom:]((uint64_t)retainSearch, v26);
  }
  else
  {
    if (!v26)
      goto LABEL_69;
    -[GEOPDAutocompleteEntry setRetainSearch:](self, "setRetainSearch:", v4[17]);
  }
  v4 = v37;
LABEL_69:
  parsecRankingFeatures = self->_parsecRankingFeatures;
  v28 = v4[13];
  if (parsecRankingFeatures)
  {
    if (!v28)
      goto LABEL_75;
    -[GEOPDParsecRankingFeatures mergeFrom:](parsecRankingFeatures, "mergeFrom:");
  }
  else
  {
    if (!v28)
      goto LABEL_75;
    -[GEOPDAutocompleteEntry setParsecRankingFeatures:](self, "setParsecRankingFeatures:");
  }
  v4 = v37;
LABEL_75:
  v29 = *((_DWORD *)v4 + 46);
  if ((v29 & 4) != 0)
  {
    self->_sortPriority = *((_DWORD *)v4 + 43);
    *(_DWORD *)&self->_flags |= 4u;
    v29 = *((_DWORD *)v4 + 46);
  }
  if ((v29 & 2) != 0)
  {
    self->_autocompleteResultCellType = *((_DWORD *)v4 + 42);
    *(_DWORD *)&self->_flags |= 2u;
  }
  serverResultScoreMetadata = self->_serverResultScoreMetadata;
  v31 = (void *)v4[18];
  if (serverResultScoreMetadata)
  {
    if (!v31)
      goto LABEL_87;
    v32 = v31;
    if (((_BYTE)v32[5] & 1) != 0)
    {
      serverResultScoreMetadata->_normalizedScore = v32[4];
      *(_BYTE *)&serverResultScoreMetadata->_flags |= 1u;
    }

  }
  else
  {
    if (!v31)
      goto LABEL_87;
    -[GEOPDAutocompleteEntry setServerResultScoreMetadata:](self, "setServerResultScoreMetadata:");
  }
  v4 = v37;
LABEL_87:
  if ((v4[23] & 0x10) != 0)
  {
    self->_enableQueryAcceleratorAffordance = *((_BYTE *)v4 + 180);
    *(_DWORD *)&self->_flags |= 0x10u;
  }
  if (v4[15])
  {
    -[GEOPDAutocompleteEntry setQueryAcceleratorCompletionString:](self, "setQueryAcceleratorCompletionString:");
    v4 = v37;
  }
  collection = self->_collection;
  v34 = v4[8];
  if (collection)
  {
    if (!v34)
      goto LABEL_97;
    -[GEOPDAutocompleteEntryCollection mergeFrom:](collection, "mergeFrom:");
  }
  else
  {
    if (!v34)
      goto LABEL_97;
    -[GEOPDAutocompleteEntry setCollection:](self, "setCollection:");
  }
  v4 = v37;
LABEL_97:
  publisher = self->_publisher;
  v36 = v4[14];
  if (publisher)
  {
    if (!v36)
      goto LABEL_103;
    -[GEOPDAutocompleteEntryPublisher mergeFrom:](publisher, "mergeFrom:");
  }
  else
  {
    if (!v36)
      goto LABEL_103;
    -[GEOPDAutocompleteEntry setPublisher:](self, "setPublisher:");
  }
  v4 = v37;
LABEL_103:
  if ((v4[23] & 1) != 0)
  {
    self->_autocompleteOriginationTypeNumber = *((_DWORD *)v4 + 41);
    *(_DWORD *)&self->_flags |= 1u;
  }

}

- (PBUnknownFields)unknownFields
{
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v5;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_BYTE *)&self->_flags & 0x20) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      v5 = reader;
      objc_sync_enter(v5);
      GEOPDAutocompleteEntryReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_2);
      objc_sync_exit(v5);

    }
  }
  os_unfair_lock_unlock(p_readerLock);
  return self->_unknownFields;
}

- (void)clearUnknownFields:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_readerLock;
  PBUnknownFields *unknownFields;
  GEOPDServerResultScoreMetadata *serverResultScoreMetadata;
  PBUnknownFields *v8;

  v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x400020u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEOPDAutocompleteEntry readAll:](self, "readAll:", 0);
    -[GEOPDAutocompleteEntryHighlightLine clearUnknownFields:](self->_highlightMain, "clearUnknownFields:", 1);
    -[GEOPDAutocompleteEntryHighlightLine clearUnknownFields:](self->_highlightExtra, "clearUnknownFields:", 1);
    -[GEOPDAutocompleteEntryQuery clearUnknownFields:](self->_query, "clearUnknownFields:", 1);
    -[GEOPDAutocompleteEntryBusiness clearUnknownFields:](self->_business, "clearUnknownFields:", 1);
    -[GEOPDAutocompleteEntryAddress clearUnknownFields:](self->_address, "clearUnknownFields:", 1);
    -[GEOPDAutocompleteEntryCategory clearUnknownFields:](self->_category, "clearUnknownFields:", 1);
    -[GEOPDAutocompleteEntryBrandProfile clearUnknownFields:](self->_brandProfile, "clearUnknownFields:", 1);
    -[GEOPDAutocompleteEntryOfflineArea clearUnknownFields:](self->_offlineArea, "clearUnknownFields:", 1);
    -[GEOPDAutocompleteEntryClientResolved clearUnknownFields:](self->_clientResolved, "clearUnknownFields:", 1);
    -[GEOPDAutocompleteEntryDirectionIntent clearUnknownFields:](self->_directionIntent, "clearUnknownFields:", 1);
    -[GEOPDRetainedSearchMetadata clearUnknownFields:]((uint64_t)self->_retainSearch, 1);
    -[GEOPDParsecRankingFeatures clearUnknownFields:](self->_parsecRankingFeatures, "clearUnknownFields:", 1);
    serverResultScoreMetadata = self->_serverResultScoreMetadata;
    if (serverResultScoreMetadata)
    {
      v8 = serverResultScoreMetadata->_unknownFields;
      serverResultScoreMetadata->_unknownFields = 0;

    }
    -[GEOPDAutocompleteEntryCollection clearUnknownFields:](self->_collection, "clearUnknownFields:", 1);
    -[GEOPDAutocompleteEntryPublisher clearUnknownFields:](self->_publisher, "clearUnknownFields:", 1);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverResultScoreMetadata, 0);
  objc_storeStrong((id *)&self->_retainSearch, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_queryAcceleratorCompletionString, 0);
  objc_storeStrong((id *)&self->_publisher, 0);
  objc_storeStrong((id *)&self->_parsecRankingFeatures, 0);
  objc_storeStrong((id *)&self->_offlineArea, 0);
  objc_storeStrong((id *)&self->_highlightMain, 0);
  objc_storeStrong((id *)&self->_highlightExtra, 0);
  objc_storeStrong((id *)&self->_directionIntent, 0);
  objc_storeStrong((id *)&self->_collection, 0);
  objc_storeStrong((id *)&self->_clientResolved, 0);
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_business, 0);
  objc_storeStrong((id *)&self->_brandProfile, 0);
  objc_storeStrong((id *)&self->_address, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
