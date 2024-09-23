@implementation GEOPDAutocompleteParametersAllEntriesWithBrowse

- (GEOPDAutocompleteParametersAllEntriesWithBrowse)init
{
  GEOPDAutocompleteParametersAllEntriesWithBrowse *v2;
  GEOPDAutocompleteParametersAllEntriesWithBrowse *v3;
  GEOPDAutocompleteParametersAllEntriesWithBrowse *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDAutocompleteParametersAllEntriesWithBrowse;
  v2 = -[GEOPDAutocompleteParametersAllEntriesWithBrowse init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDAutocompleteParametersAllEntriesWithBrowse)initWithData:(id)a3
{
  GEOPDAutocompleteParametersAllEntriesWithBrowse *v3;
  GEOPDAutocompleteParametersAllEntriesWithBrowse *v4;
  GEOPDAutocompleteParametersAllEntriesWithBrowse *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDAutocompleteParametersAllEntriesWithBrowse;
  v3 = -[GEOPDAutocompleteParametersAllEntriesWithBrowse initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)dealloc
{
  objc_super v3;

  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOPDAutocompleteParametersAllEntriesWithBrowse;
  -[GEOPDAutocompleteParametersAllEntriesWithBrowse dealloc](&v3, sel_dealloc);
}

- (void)_readQuery
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 224));
    if ((*(_BYTE *)(a1 + 254) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDAutocompleteParametersAllEntriesWithBrowseReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readQuery_tags_785);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 224));
  }
}

- (BOOL)hasQuery
{
  -[GEOPDAutocompleteParametersAllEntriesWithBrowse _readQuery]((uint64_t)self);
  return self->_query != 0;
}

- (NSString)query
{
  -[GEOPDAutocompleteParametersAllEntriesWithBrowse _readQuery]((uint64_t)self);
  return self->_query;
}

- (void)setQuery:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x8800000u;
  objc_storeStrong((id *)&self->_query, a3);
}

- (void)_readViewportInfo
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 224));
    if ((*(_BYTE *)(a1 + 255) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDAutocompleteParametersAllEntriesWithBrowseReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readViewportInfo_tags_786);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 224));
  }
}

- (BOOL)hasViewportInfo
{
  -[GEOPDAutocompleteParametersAllEntriesWithBrowse _readViewportInfo]((uint64_t)self);
  return self->_viewportInfo != 0;
}

- (GEOPDViewportInfo)viewportInfo
{
  -[GEOPDAutocompleteParametersAllEntriesWithBrowse _readViewportInfo]((uint64_t)self);
  return self->_viewportInfo;
}

- (void)setViewportInfo:(id)a3
{
  *(_DWORD *)&self->_flags |= 0xC000000u;
  objc_storeStrong((id *)&self->_viewportInfo, a3);
}

- (int)maxResults
{
  os_unfair_lock_s *p_readerLock;
  $EAFDE4515419465CA71EC8A4C4CE129B flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_BYTE *)&flags & 2) != 0)
    return self->_maxResults;
  else
    return 15;
}

- (void)setMaxResults:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x8000002u;
  self->_maxResults = a3;
}

- (void)setHasMaxResults:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 134217730;
  else
    v3 = 0x8000000;
  self->_flags = ($EAFDE4515419465CA71EC8A4C4CE129B)(*(_DWORD *)&self->_flags & 0xFFFFFFFD | v3);
}

- (BOOL)hasMaxResults
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (BOOL)highlightDiff
{
  os_unfair_lock_s *p_readerLock;
  $EAFDE4515419465CA71EC8A4C4CE129B flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  return (*(_BYTE *)&flags & 8) != 0 && self->_highlightDiff;
}

- (void)setHighlightDiff:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x8000008u;
  self->_highlightDiff = a3;
}

- (void)setHasHighlightDiff:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 134217736;
  else
    v3 = 0x8000000;
  self->_flags = ($EAFDE4515419465CA71EC8A4C4CE129B)(*(_DWORD *)&self->_flags & 0xFFFFFFF7 | v3);
}

- (BOOL)hasHighlightDiff
{
  return (*(_BYTE *)&self->_flags >> 3) & 1;
}

- (void)_readCategorySuggestionEntryMetadata
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 224));
    if ((*(_BYTE *)(a1 + 254) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDAutocompleteParametersAllEntriesWithBrowseReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCategorySuggestionEntryMetadata_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 224));
  }
}

- (BOOL)hasCategorySuggestionEntryMetadata
{
  -[GEOPDAutocompleteParametersAllEntriesWithBrowse _readCategorySuggestionEntryMetadata]((uint64_t)self);
  return self->_categorySuggestionEntryMetadata != 0;
}

- (NSData)categorySuggestionEntryMetadata
{
  -[GEOPDAutocompleteParametersAllEntriesWithBrowse _readCategorySuggestionEntryMetadata]((uint64_t)self);
  return self->_categorySuggestionEntryMetadata;
}

- (void)setCategorySuggestionEntryMetadata:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x8080000u;
  objc_storeStrong((id *)&self->_categorySuggestionEntryMetadata, a3);
}

- (void)_readCategorySuggestionEntry
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 224));
    if ((*(_BYTE *)(a1 + 254) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDAutocompleteParametersAllEntriesWithBrowseReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCategorySuggestionEntry_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 224));
  }
}

- (BOOL)hasCategorySuggestionEntry
{
  -[GEOPDAutocompleteParametersAllEntriesWithBrowse _readCategorySuggestionEntry]((uint64_t)self);
  return self->_categorySuggestionEntry != 0;
}

- (GEOPDAutocompleteEntry)categorySuggestionEntry
{
  -[GEOPDAutocompleteParametersAllEntriesWithBrowse _readCategorySuggestionEntry]((uint64_t)self);
  return self->_categorySuggestionEntry;
}

- (void)setCategorySuggestionEntry:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x8100000u;
  objc_storeStrong((id *)&self->_categorySuggestionEntry, a3);
}

- (BOOL)interleaveCategorySuggestions
{
  return self->_interleaveCategorySuggestions;
}

- (void)setInterleaveCategorySuggestions:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x8000010u;
  self->_interleaveCategorySuggestions = a3;
}

- (void)setHasInterleaveCategorySuggestions:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 134217744;
  else
    v3 = 0x8000000;
  self->_flags = ($EAFDE4515419465CA71EC8A4C4CE129B)(*(_DWORD *)&self->_flags & 0xFFFFFFEF | v3);
}

- (BOOL)hasInterleaveCategorySuggestions
{
  return (*(_BYTE *)&self->_flags >> 4) & 1;
}

- (void)_readVenueIdentifier
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 224));
    if ((*(_BYTE *)(a1 + 255) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDAutocompleteParametersAllEntriesWithBrowseReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readVenueIdentifier_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 224));
  }
}

- (BOOL)hasVenueIdentifier
{
  -[GEOPDAutocompleteParametersAllEntriesWithBrowse _readVenueIdentifier]((uint64_t)self);
  return self->_venueIdentifier != 0;
}

- (GEOPDVenueIdentifier)venueIdentifier
{
  -[GEOPDAutocompleteParametersAllEntriesWithBrowse _readVenueIdentifier]((uint64_t)self);
  return self->_venueIdentifier;
}

- (void)setVenueIdentifier:(id)a3
{
  *(_DWORD *)&self->_flags |= 0xA000000u;
  objc_storeStrong((id *)&self->_venueIdentifier, a3);
}

- (BOOL)supportDirectionIntentSuggestions
{
  return self->_supportDirectionIntentSuggestions;
}

- (void)setSupportDirectionIntentSuggestions:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x8000080u;
  self->_supportDirectionIntentSuggestions = a3;
}

- (void)setHasSupportDirectionIntentSuggestions:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 134217856;
  else
    v3 = 0x8000000;
  self->_flags = ($EAFDE4515419465CA71EC8A4C4CE129B)(*(_DWORD *)&self->_flags & 0xFFFFFF7F | v3);
}

- (BOOL)hasSupportDirectionIntentSuggestions
{
  return *(_BYTE *)&self->_flags >> 7;
}

- (void)_readRetainedSearch
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 224));
    if ((*(_BYTE *)(a1 + 255) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDAutocompleteParametersAllEntriesWithBrowseReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRetainedSearch_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 224));
  }
}

- (BOOL)hasRetainedSearch
{
  -[GEOPDAutocompleteParametersAllEntriesWithBrowse _readRetainedSearch]((uint64_t)self);
  return self->_retainedSearch != 0;
}

- (GEOPDRetainedSearchMetadata)retainedSearch
{
  -[GEOPDAutocompleteParametersAllEntriesWithBrowse _readRetainedSearch]((uint64_t)self);
  return self->_retainedSearch;
}

- (void)setRetainedSearch:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x9000000u;
  objc_storeStrong((id *)&self->_retainedSearch, a3);
}

- (BOOL)supportUnresolvedDirectionIntent
{
  return self->_supportUnresolvedDirectionIntent;
}

- (void)setSupportUnresolvedDirectionIntent:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x8000800u;
  self->_supportUnresolvedDirectionIntent = a3;
}

- (void)setHasSupportUnresolvedDirectionIntent:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 134219776;
  else
    v3 = 0x8000000;
  self->_flags = ($EAFDE4515419465CA71EC8A4C4CE129B)(*(_DWORD *)&self->_flags & 0xF7FFF7FF | v3);
}

- (BOOL)hasSupportUnresolvedDirectionIntent
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 3) & 1;
}

- (void)_readSupportedListTypes
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 224));
    if ((*(_BYTE *)(a1 + 254) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDAutocompleteParametersAllEntriesWithBrowseReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSupportedListTypes_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 224));
  }
}

- (unint64_t)supportedListTypesCount
{
  -[GEOPDAutocompleteParametersAllEntriesWithBrowse _readSupportedListTypes]((uint64_t)self);
  return self->_supportedListTypes.count;
}

- (int)supportedListTypes
{
  -[GEOPDAutocompleteParametersAllEntriesWithBrowse _readSupportedListTypes]((uint64_t)self);
  return self->_supportedListTypes.list;
}

- (void)clearSupportedListTypes
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x10000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x8000000u;
  PBRepeatedInt32Clear();
}

- (void)addSupportedListType:(int)a3
{
  -[GEOPDAutocompleteParametersAllEntriesWithBrowse _readSupportedListTypes]((uint64_t)self);
  if (self)
    PBRepeatedInt32Add();
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x10000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x8000000u;
}

- (int)supportedListTypeAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_supportedListTypes;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEOPDAutocompleteParametersAllEntriesWithBrowse _readSupportedListTypes]((uint64_t)self);
  p_supportedListTypes = &self->_supportedListTypes;
  count = self->_supportedListTypes.count;
  if (count <= a3)
  {
    v7 = (void *)MEMORY[0x1E0C99DA0];
    v8 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "exceptionWithName:reason:userInfo:", v8, v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "raise");

  }
  return p_supportedListTypes->list[a3];
}

- (void)setSupportedListTypes:(int *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x10000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x8000000u;
  PBRepeatedInt32Set();
}

- (id)supportedListTypesAsString:(int)a3
{
  if (a3 < 3)
    return off_1E1C04690[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsSupportedListTypes:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("INTERLEAVED")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("SECTION_ONLY_FOR_QUERY")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_readQuerySuggestionEntry
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 224));
    if ((*(_BYTE *)(a1 + 254) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDAutocompleteParametersAllEntriesWithBrowseReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readQuerySuggestionEntry_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 224));
  }
}

- (BOOL)hasQuerySuggestionEntry
{
  -[GEOPDAutocompleteParametersAllEntriesWithBrowse _readQuerySuggestionEntry]((uint64_t)self);
  return self->_querySuggestionEntry != 0;
}

- (GEOPDAutocompleteEntry)querySuggestionEntry
{
  -[GEOPDAutocompleteParametersAllEntriesWithBrowse _readQuerySuggestionEntry]((uint64_t)self);
  return self->_querySuggestionEntry;
}

- (void)setQuerySuggestionEntry:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x8400000u;
  objc_storeStrong((id *)&self->_querySuggestionEntry, a3);
}

- (BOOL)supportClientRankingFeatureMetadata
{
  return self->_supportClientRankingFeatureMetadata;
}

- (void)setSupportClientRankingFeatureMetadata:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x8000040u;
  self->_supportClientRankingFeatureMetadata = a3;
}

- (void)setHasSupportClientRankingFeatureMetadata:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 134217792;
  else
    v3 = 0x8000000;
  self->_flags = ($EAFDE4515419465CA71EC8A4C4CE129B)(*(_DWORD *)&self->_flags & 0xFFFFFFBF | v3);
}

- (BOOL)hasSupportClientRankingFeatureMetadata
{
  return (*(_BYTE *)&self->_flags >> 6) & 1;
}

- (int)maxQueryBuilderSuggestions
{
  os_unfair_lock_s *p_readerLock;
  $EAFDE4515419465CA71EC8A4C4CE129B flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_BYTE *)&flags & 1) != 0)
    return self->_maxQueryBuilderSuggestions;
  else
    return 5;
}

- (void)setMaxQueryBuilderSuggestions:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x8000001u;
  self->_maxQueryBuilderSuggestions = a3;
}

- (void)setHasMaxQueryBuilderSuggestions:(BOOL)a3
{
  self->_flags = ($EAFDE4515419465CA71EC8A4C4CE129B)(*(_DWORD *)&self->_flags & 0xFFFFFFFE | a3 | 0x8000000);
}

- (BOOL)hasMaxQueryBuilderSuggestions
{
  return *(_DWORD *)&self->_flags & 1;
}

- (BOOL)supportSectionHeader
{
  return self->_supportSectionHeader;
}

- (void)setSupportSectionHeader:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x8000200u;
  self->_supportSectionHeader = a3;
}

- (void)setHasSupportSectionHeader:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 134218240;
  else
    v3 = 0x8000000;
  self->_flags = ($EAFDE4515419465CA71EC8A4C4CE129B)(*(_DWORD *)&self->_flags & 0xFFFFFDFF | v3);
}

- (BOOL)hasSupportSectionHeader
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 1) & 1;
}

- (void)_readSupportedAutocompleteResultCellTypes
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 224));
    if ((*(_BYTE *)(a1 + 253) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDAutocompleteParametersAllEntriesWithBrowseReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSupportedAutocompleteResultCellTypes_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 224));
  }
}

- (unint64_t)supportedAutocompleteResultCellTypesCount
{
  -[GEOPDAutocompleteParametersAllEntriesWithBrowse _readSupportedAutocompleteResultCellTypes]((uint64_t)self);
  return self->_supportedAutocompleteResultCellTypes.count;
}

- (int)supportedAutocompleteResultCellTypes
{
  -[GEOPDAutocompleteParametersAllEntriesWithBrowse _readSupportedAutocompleteResultCellTypes]((uint64_t)self);
  return self->_supportedAutocompleteResultCellTypes.list;
}

- (void)clearSupportedAutocompleteResultCellTypes
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x4000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x8000000u;
  PBRepeatedInt32Clear();
}

- (void)addSupportedAutocompleteResultCellType:(int)a3
{
  -[GEOPDAutocompleteParametersAllEntriesWithBrowse _readSupportedAutocompleteResultCellTypes]((uint64_t)self);
  if (self)
    PBRepeatedInt32Add();
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x4000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x8000000u;
}

- (int)supportedAutocompleteResultCellTypeAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_supportedAutocompleteResultCellTypes;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEOPDAutocompleteParametersAllEntriesWithBrowse _readSupportedAutocompleteResultCellTypes]((uint64_t)self);
  p_supportedAutocompleteResultCellTypes = &self->_supportedAutocompleteResultCellTypes;
  count = self->_supportedAutocompleteResultCellTypes.count;
  if (count <= a3)
  {
    v7 = (void *)MEMORY[0x1E0C99DA0];
    v8 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "exceptionWithName:reason:userInfo:", v8, v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "raise");

  }
  return p_supportedAutocompleteResultCellTypes->list[a3];
}

- (void)setSupportedAutocompleteResultCellTypes:(int *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x4000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x8000000u;
  PBRepeatedInt32Set();
}

- (id)supportedAutocompleteResultCellTypesAsString:(int)a3
{
  if (a3 < 5)
    return off_1E1C046A8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsSupportedAutocompleteResultCellTypes:(id)a3
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

- (BOOL)supportRapAffordance
{
  return self->_supportRapAffordance;
}

- (void)setSupportRapAffordance:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x8000100u;
  self->_supportRapAffordance = a3;
}

- (void)setHasSupportRapAffordance:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 134217984;
  else
    v3 = 0x8000000;
  self->_flags = ($EAFDE4515419465CA71EC8A4C4CE129B)(*(_DWORD *)&self->_flags & 0xFFFFFEFF | v3);
}

- (BOOL)hasSupportRapAffordance
{
  return *((_BYTE *)&self->_flags + 1) & 1;
}

- (void)_readKnownRefinementTypes
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 224));
    if ((*(_BYTE *)(a1 + 253) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDAutocompleteParametersAllEntriesWithBrowseReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readKnownRefinementTypes_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 224));
  }
}

- (unint64_t)knownRefinementTypesCount
{
  -[GEOPDAutocompleteParametersAllEntriesWithBrowse _readKnownRefinementTypes]((uint64_t)self);
  return self->_knownRefinementTypes.count;
}

- (int)knownRefinementTypes
{
  -[GEOPDAutocompleteParametersAllEntriesWithBrowse _readKnownRefinementTypes]((uint64_t)self);
  return self->_knownRefinementTypes.list;
}

- (void)clearKnownRefinementTypes
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x2000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x8000000u;
  PBRepeatedInt32Clear();
}

- (void)addKnownRefinementType:(int)a3
{
  -[GEOPDAutocompleteParametersAllEntriesWithBrowse _readKnownRefinementTypes]((uint64_t)self);
  if (self)
    PBRepeatedInt32Add();
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x2000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x8000000u;
}

- (int)knownRefinementTypeAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_knownRefinementTypes;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEOPDAutocompleteParametersAllEntriesWithBrowse _readKnownRefinementTypes]((uint64_t)self);
  p_knownRefinementTypes = &self->_knownRefinementTypes;
  count = self->_knownRefinementTypes.count;
  if (count <= a3)
  {
    v7 = (void *)MEMORY[0x1E0C99DA0];
    v8 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "exceptionWithName:reason:userInfo:", v8, v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "raise");

  }
  return p_knownRefinementTypes->list[a3];
}

- (void)setKnownRefinementTypes:(int *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x2000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x8000000u;
  PBRepeatedInt32Set();
}

- (id)knownRefinementTypesAsString:(int)a3
{
  if (a3 < 7)
    return off_1E1C04F58[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsKnownRefinementTypes:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RESULT_REFINEMENT_TYPE_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RESULT_REFINEMENT_TYPE_TOGGLE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RESULT_REFINEMENT_TYPE_RANGE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RESULT_REFINEMENT_TYPE_MULTI_SELECT")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RESULT_REFINEMENT_TYPE_SORT")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RESULT_REFINEMENT_GUIDES_HOME")) & 1) != 0)
  {
    v4 = 5;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("RESULT_REFINEMENT_TYPE_OPEN_OPTIONS")))
  {
    v4 = 6;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)placeSummaryRevision
{
  os_unfair_lock_s *p_readerLock;
  $EAFDE4515419465CA71EC8A4C4CE129B flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_BYTE *)&flags & 4) != 0)
    return self->_placeSummaryRevision;
  else
    return 0;
}

- (void)setPlaceSummaryRevision:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x8000004u;
  self->_placeSummaryRevision = a3;
}

- (void)setHasPlaceSummaryRevision:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 134217732;
  else
    v3 = 0x8000000;
  self->_flags = ($EAFDE4515419465CA71EC8A4C4CE129B)(*(_DWORD *)&self->_flags & 0xFFFFFFFB | v3);
}

- (BOOL)hasPlaceSummaryRevision
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (id)placeSummaryRevisionAsString:(int)a3
{
  if (a3 < 0x24)
    return off_1E1C04F90[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsPlaceSummaryRevision:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NAME")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CATEGORY")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DISTANCE")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PRICE")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HOURS")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ADDRESS")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RATINGS")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRANSIT_SHIELDS")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("USER_GENERATED_GUIDES")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CURATED_GUIDES")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EV_CHARGERS_NUMBER")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UGC_USER_SUBMITTED_RECOMMENDATIONS")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("STRING")) & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SERVER_OVERRIDE")) & 1) != 0)
  {
    v4 = 14;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CONTAINMENT")) & 1) != 0)
  {
    v4 = 15;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RECENT")) & 1) != 0)
  {
    v4 = 16;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HIGHLIGHT_MAIN")) & 1) != 0)
  {
    v4 = 17;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HIGHLIGHT_EXTRA")) & 1) != 0)
  {
    v4 = 18;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PUBLISHER_NAME_FOR_GUIDE")) & 1) != 0)
  {
    v4 = 19;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NUM_PLACES_IN_GUIDE")) & 1) != 0)
  {
    v4 = 20;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PUBLISHER_DESCRIPTION")) & 1) != 0)
  {
    v4 = 21;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SECONDARY_NAME")) & 1) != 0)
  {
    v4 = 22;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FACTOID")) & 1) != 0)
  {
    v4 = 23;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ARP_RATINGS")) & 1) != 0)
  {
    v4 = 24;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REAL_TIME_EV_CHARGER_AVAILABILITY")) & 1) != 0)
  {
    v4 = 25;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DETOUR_TIME")) & 1) != 0)
  {
    v4 = 26;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HIKING_DIFFICULTY")) & 1) != 0)
  {
    v4 = 27;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HIKING_TRAIL_LENGTH")) & 1) != 0)
  {
    v4 = 28;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PHOTO_CAROUSEL")) & 1) != 0)
  {
    v4 = 29;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("IN_USER_LIBRARY")) & 1) != 0)
  {
    v4 = 30;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("USER_NOTE")) & 1) != 0)
  {
    v4 = 31;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HIKE_ROUTE_FACTOID_ELEVATION_GAIN_LOSS")) & 1) != 0)
  {
    v4 = 32;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HIKE_ROUTE_TYPE")) & 1) != 0)
  {
    v4 = 33;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HIKE_ROUTE_DURATION")) & 1) != 0)
  {
    v4 = 34;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("HIKE_ROUTE_LENGTH")))
  {
    v4 = 35;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_readSupportedPlaceSummaryFormatTypes
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 224));
    if ((*(_BYTE *)(a1 + 254) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDAutocompleteParametersAllEntriesWithBrowseReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSupportedPlaceSummaryFormatTypes_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 224));
  }
}

- (unint64_t)supportedPlaceSummaryFormatTypesCount
{
  -[GEOPDAutocompleteParametersAllEntriesWithBrowse _readSupportedPlaceSummaryFormatTypes]((uint64_t)self);
  return self->_supportedPlaceSummaryFormatTypes.count;
}

- (int)supportedPlaceSummaryFormatTypes
{
  -[GEOPDAutocompleteParametersAllEntriesWithBrowse _readSupportedPlaceSummaryFormatTypes]((uint64_t)self);
  return self->_supportedPlaceSummaryFormatTypes.list;
}

- (void)clearSupportedPlaceSummaryFormatTypes
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x20000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x8000000u;
  PBRepeatedInt32Clear();
}

- (void)addSupportedPlaceSummaryFormatType:(int)a3
{
  -[GEOPDAutocompleteParametersAllEntriesWithBrowse _readSupportedPlaceSummaryFormatTypes]((uint64_t)self);
  if (self)
    PBRepeatedInt32Add();
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x20000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x8000000u;
}

- (int)supportedPlaceSummaryFormatTypeAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_supportedPlaceSummaryFormatTypes;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEOPDAutocompleteParametersAllEntriesWithBrowse _readSupportedPlaceSummaryFormatTypes]((uint64_t)self);
  p_supportedPlaceSummaryFormatTypes = &self->_supportedPlaceSummaryFormatTypes;
  count = self->_supportedPlaceSummaryFormatTypes.count;
  if (count <= a3)
  {
    v7 = (void *)MEMORY[0x1E0C99DA0];
    v8 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "exceptionWithName:reason:userInfo:", v8, v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "raise");

  }
  return p_supportedPlaceSummaryFormatTypes->list[a3];
}

- (void)setSupportedPlaceSummaryFormatTypes:(int *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x20000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x8000000u;
  PBRepeatedInt32Set();
}

- (id)supportedPlaceSummaryFormatTypesAsString:(int)a3
{
  if (a3 < 5)
    return off_1E1C050B0[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsSupportedPlaceSummaryFormatTypes:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PLACE_SUMMARY_FORMAT_TYPE_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PLACE_SUMMARY_FORMAT_TYPE_BOLD")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PLACE_SUMMARY_FORMAT_TYPE_ITALICS")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PLACE_SUMMARY_FORMAT_TYPE_STRIKETHROUGH")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("PLACE_SUMMARY_FORMAT_TYPE_TAPPABLE_ENTITY")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_readEvChargingParameters
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 224));
    if ((*(_BYTE *)(a1 + 254) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDAutocompleteParametersAllEntriesWithBrowseReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readEvChargingParameters_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 224));
  }
}

- (BOOL)hasEvChargingParameters
{
  -[GEOPDAutocompleteParametersAllEntriesWithBrowse _readEvChargingParameters]((uint64_t)self);
  return self->_evChargingParameters != 0;
}

- (GEOPDSSearchEvChargingParameters)evChargingParameters
{
  -[GEOPDAutocompleteParametersAllEntriesWithBrowse _readEvChargingParameters]((uint64_t)self);
  return self->_evChargingParameters;
}

- (void)setEvChargingParameters:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x8200000u;
  objc_storeStrong((id *)&self->_evChargingParameters, a3);
}

- (void)_readSupportedHighlightTypes
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 224));
    if ((*(_BYTE *)(a1 + 253) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDAutocompleteParametersAllEntriesWithBrowseReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSupportedHighlightTypes_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 224));
  }
}

- (unint64_t)supportedHighlightTypesCount
{
  -[GEOPDAutocompleteParametersAllEntriesWithBrowse _readSupportedHighlightTypes]((uint64_t)self);
  return self->_supportedHighlightTypes.count;
}

- (int)supportedHighlightTypes
{
  -[GEOPDAutocompleteParametersAllEntriesWithBrowse _readSupportedHighlightTypes]((uint64_t)self);
  return self->_supportedHighlightTypes.list;
}

- (void)clearSupportedHighlightTypes
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x8000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x8000000u;
  PBRepeatedInt32Clear();
}

- (void)addSupportedHighlightType:(int)a3
{
  -[GEOPDAutocompleteParametersAllEntriesWithBrowse _readSupportedHighlightTypes]((uint64_t)self);
  if (self)
    PBRepeatedInt32Add();
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x8000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x8000000u;
}

- (int)supportedHighlightTypeAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_supportedHighlightTypes;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEOPDAutocompleteParametersAllEntriesWithBrowse _readSupportedHighlightTypes]((uint64_t)self);
  p_supportedHighlightTypes = &self->_supportedHighlightTypes;
  count = self->_supportedHighlightTypes.count;
  if (count <= a3)
  {
    v7 = (void *)MEMORY[0x1E0C99DA0];
    v8 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "exceptionWithName:reason:userInfo:", v8, v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "raise");

  }
  return p_supportedHighlightTypes->list[a3];
}

- (void)setSupportedHighlightTypes:(int *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x8000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x8000000u;
  PBRepeatedInt32Set();
}

- (id)supportedHighlightTypesAsString:(int)a3
{
  if (a3 < 3)
    return off_1E1C04708[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsSupportedHighlightTypes:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AUTOCOMPLETE_RESULT_HIGHLIGHT_TYPE_BOLD_HIGHLIGHT")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AUTOCOMPLETE_RESULT_HIGHLIGHT_TYPE_GRAYSCALE_DARKER_GRAY")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("AUTOCOMPLETE_RESULT_HIGHLIGHT_TYPE_GRAYSCALE_DARKER_GRAY_INVERSE")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_readAutocompleteOriginationInfo
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 224));
    if ((*(_BYTE *)(a1 + 254) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDAutocompleteParametersAllEntriesWithBrowseReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAutocompleteOriginationInfo_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 224));
  }
}

- (BOOL)hasAutocompleteOriginationInfo
{
  -[GEOPDAutocompleteParametersAllEntriesWithBrowse _readAutocompleteOriginationInfo]((uint64_t)self);
  return self->_autocompleteOriginationInfo != 0;
}

- (GEOPDAutocompleteOriginationInfo)autocompleteOriginationInfo
{
  -[GEOPDAutocompleteParametersAllEntriesWithBrowse _readAutocompleteOriginationInfo]((uint64_t)self);
  return self->_autocompleteOriginationInfo;
}

- (void)setAutocompleteOriginationInfo:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x8040000u;
  objc_storeStrong((id *)&self->_autocompleteOriginationInfo, a3);
}

- (BOOL)supportClientRankingCompositeFeatures
{
  return self->_supportClientRankingCompositeFeatures;
}

- (void)setSupportClientRankingCompositeFeatures:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x8000020u;
  self->_supportClientRankingCompositeFeatures = a3;
}

- (void)setHasSupportClientRankingCompositeFeatures:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 134217760;
  else
    v3 = 0x8000000;
  self->_flags = ($EAFDE4515419465CA71EC8A4C4CE129B)(*(_DWORD *)&self->_flags & 0xFFFFFFDF | v3);
}

- (BOOL)hasSupportClientRankingCompositeFeatures
{
  return (*(_BYTE *)&self->_flags >> 5) & 1;
}

- (BOOL)supportStructuredRapAffordance
{
  return self->_supportStructuredRapAffordance;
}

- (void)setSupportStructuredRapAffordance:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x8000400u;
  self->_supportStructuredRapAffordance = a3;
}

- (void)setHasSupportStructuredRapAffordance:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 134218752;
  else
    v3 = 0x8000000;
  self->_flags = ($EAFDE4515419465CA71EC8A4C4CE129B)(*(_DWORD *)&self->_flags & 0xFFFFFBFF | v3);
}

- (BOOL)hasSupportStructuredRapAffordance
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 2) & 1;
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
  v8.super_class = (Class)GEOPDAutocompleteParametersAllEntriesWithBrowse;
  -[GEOPDAutocompleteParametersAllEntriesWithBrowse description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDAutocompleteParametersAllEntriesWithBrowse dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDAutocompleteParametersAllEntriesWithBrowse _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  id v10;
  int *v11;
  int v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  const __CFString *v23;
  id v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  void *v28;
  void *v29;
  const __CFString *v30;
  id v31;
  void *v32;
  const __CFString *v33;
  void *v34;
  void *v35;
  void *v36;
  const __CFString *v37;
  id v38;
  void *v39;
  const __CFString *v40;
  void *v41;
  _QWORD *v42;
  unint64_t v43;
  uint64_t v44;
  __CFString *v45;
  const __CFString *v46;
  void *v47;
  void *v48;
  void *v49;
  const __CFString *v50;
  id v51;
  int v52;
  void *v53;
  const __CFString *v54;
  void *v55;
  _QWORD *v56;
  unint64_t v57;
  uint64_t v58;
  __CFString *v59;
  const __CFString *v60;
  void *v61;
  const __CFString *v62;
  void *v63;
  _QWORD *v64;
  unint64_t v65;
  uint64_t v66;
  __CFString *v67;
  const __CFString *v68;
  uint64_t v69;
  __CFString *v70;
  void *v71;
  const __CFString *v72;
  void *v73;
  const __CFString *v74;
  const __CFString *v75;
  void *v76;
  _QWORD *v77;
  unint64_t v78;
  uint64_t v79;
  __CFString *v80;
  const __CFString *v81;
  void *v82;
  void *v83;
  void *v84;
  const __CFString *v85;
  id v86;
  void *v87;
  _QWORD *v88;
  unint64_t v89;
  uint64_t v90;
  __CFString *v91;
  const __CFString *v92;
  void *v93;
  void *v94;
  void *v95;
  const __CFString *v96;
  id v97;
  int v98;
  void *v99;
  const __CFString *v100;
  void *v101;
  const __CFString *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  id v107;
  id v108;
  id v109;
  _QWORD v111[4];
  id v112;

  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)a1, "query");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("query"));

  objc_msgSend((id)a1, "viewportInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v6, "jsonRepresentation");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = CFSTR("viewportInfo");
    }
    else
    {
      objc_msgSend(v6, "dictionaryRepresentation");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = CFSTR("viewport_info");
    }
    v10 = v8;

    objc_msgSend(v4, "setObject:forKey:", v10, v9);
  }

  v11 = &OBJC_IVAR___GEOTransitVehicleInfo__pickupDropoffType;
  v12 = *(_DWORD *)(a1 + 252);
  if ((v12 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 232));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v14 = CFSTR("maxResults");
    else
      v14 = CFSTR("max_results");
    objc_msgSend(v4, "setObject:forKey:", v13, v14);

    v12 = *(_DWORD *)(a1 + 252);
  }
  if ((v12 & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 240));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v16 = CFSTR("highlightDiff");
    else
      v16 = CFSTR("highlight_diff");
    objc_msgSend(v4, "setObject:forKey:", v15, v16);

  }
  objc_msgSend((id)a1, "categorySuggestionEntryMetadata");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v17, "base64EncodedStringWithOptions:", 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v19, CFSTR("categorySuggestionEntryMetadata"));

    }
    else
    {
      objc_msgSend(v4, "setObject:forKey:", v17, CFSTR("category_suggestion_entry_metadata"));
    }
  }

  objc_msgSend((id)a1, "categorySuggestionEntry");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v20)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v20, "jsonRepresentation");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = CFSTR("categorySuggestionEntry");
    }
    else
    {
      objc_msgSend(v20, "dictionaryRepresentation");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = CFSTR("category_suggestion_entry");
    }
    v24 = v22;

    objc_msgSend(v4, "setObject:forKey:", v24, v23);
  }

  if ((*(_BYTE *)(a1 + 252) & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 241));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v26 = CFSTR("interleaveCategorySuggestions");
    else
      v26 = CFSTR("interleave_category_suggestions");
    objc_msgSend(v4, "setObject:forKey:", v25, v26);

  }
  objc_msgSend((id)a1, "venueIdentifier");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v27;
  if (v27)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v27, "jsonRepresentation");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = CFSTR("venueIdentifier");
    }
    else
    {
      objc_msgSend(v27, "dictionaryRepresentation");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = CFSTR("venue_identifier");
    }
    v31 = v29;

    objc_msgSend(v4, "setObject:forKey:", v31, v30);
  }

  if ((*(_BYTE *)(a1 + 252) & 0x80) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 244));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v33 = CFSTR("supportDirectionIntentSuggestions");
    else
      v33 = CFSTR("support_direction_intent_suggestions");
    objc_msgSend(v4, "setObject:forKey:", v32, v33);

  }
  objc_msgSend((id)a1, "retainedSearch");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v34;
  if (v34)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v34, "jsonRepresentation");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = CFSTR("retainedSearch");
    }
    else
    {
      objc_msgSend(v34, "dictionaryRepresentation");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = CFSTR("retained_search");
    }
    v38 = v36;

    objc_msgSend(v4, "setObject:forKey:", v38, v37);
  }

  if ((*(_BYTE *)(a1 + 253) & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 248));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v40 = CFSTR("supportUnresolvedDirectionIntent");
    else
      v40 = CFSTR("support_unresolved_direction_intent");
    objc_msgSend(v4, "setObject:forKey:", v39, v40);

  }
  if (*(_QWORD *)(a1 + 104))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = (_QWORD *)(a1 + 96);
    if (*(_QWORD *)(a1 + 104))
    {
      v43 = 0;
      do
      {
        v44 = *(int *)(*v42 + 4 * v43);
        if (v44 >= 3)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v44);
          v45 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v45 = off_1E1C04690[v44];
        }
        objc_msgSend(v41, "addObject:", v45);

        ++v43;
        v42 = (_QWORD *)(a1 + 96);
      }
      while (v43 < *(_QWORD *)(a1 + 104));
    }
    if (a2)
      v46 = CFSTR("supportedListType");
    else
      v46 = CFSTR("supported_list_type");
    objc_msgSend(v4, "setObject:forKey:", v41, v46);

    v11 = &OBJC_IVAR___GEOTransitVehicleInfo__pickupDropoffType;
  }
  objc_msgSend((id)a1, "querySuggestionEntry");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = v47;
  if (v47)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v47, "jsonRepresentation");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = CFSTR("querySuggestionEntry");
    }
    else
    {
      objc_msgSend(v47, "dictionaryRepresentation");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = CFSTR("query_suggestion_entry");
    }
    v51 = v49;

    objc_msgSend(v4, "setObject:forKey:", v51, v50);
  }

  v52 = *(_DWORD *)(a1 + 252);
  if ((v52 & 0x40) == 0)
  {
    if ((v52 & 1) == 0)
      goto LABEL_71;
LABEL_110:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 228));
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v74 = CFSTR("maxQueryBuilderSuggestions");
    else
      v74 = CFSTR("max_query_builder_suggestions");
    objc_msgSend(v4, "setObject:forKey:", v73, v74);

    if ((*(_DWORD *)(a1 + 252) & 0x200) == 0)
      goto LABEL_76;
    goto LABEL_72;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 243));
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v72 = CFSTR("supportClientRankingFeatureMetadata");
  else
    v72 = CFSTR("support_client_ranking_feature_metadata");
  objc_msgSend(v4, "setObject:forKey:", v71, v72);

  v52 = *(_DWORD *)(a1 + 252);
  if ((v52 & 1) != 0)
    goto LABEL_110;
LABEL_71:
  if ((v52 & 0x200) != 0)
  {
LABEL_72:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 246));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v54 = CFSTR("supportSectionHeader");
    else
      v54 = CFSTR("support_section_header");
    objc_msgSend(v4, "setObject:forKey:", v53, v54);

  }
LABEL_76:
  if (*(_QWORD *)(a1 + 56))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = (_QWORD *)(a1 + 48);
    if (*(_QWORD *)(a1 + 56))
    {
      v57 = 0;
      do
      {
        v58 = *(int *)(*v56 + 4 * v57);
        if (v58 >= 5)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v58);
          v59 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v59 = off_1E1C046A8[v58];
        }
        objc_msgSend(v55, "addObject:", v59);

        ++v57;
        v56 = (_QWORD *)(a1 + 48);
      }
      while (v57 < *(_QWORD *)(a1 + 56));
    }
    if (a2)
      v60 = CFSTR("supportedAutocompleteResultCellType");
    else
      v60 = CFSTR("supported_autocomplete_result_cell_type");
    objc_msgSend(v4, "setObject:forKey:", v55, v60);

    v11 = &OBJC_IVAR___GEOTransitVehicleInfo__pickupDropoffType;
  }
  if ((*(_BYTE *)(a1 + 253) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 245));
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v62 = CFSTR("supportRapAffordance");
    else
      v62 = CFSTR("support_rap_affordance");
    objc_msgSend(v4, "setObject:forKey:", v61, v62);

  }
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = (_QWORD *)(a1 + 24);
    if (*(_QWORD *)(a1 + 32))
    {
      v65 = 0;
      do
      {
        v66 = *(int *)(*v64 + 4 * v65);
        if (v66 >= 7)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v66);
          v67 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v67 = off_1E1C04F58[v66];
        }
        objc_msgSend(v63, "addObject:", v67);

        ++v65;
        v64 = (_QWORD *)(a1 + 24);
      }
      while (v65 < *(_QWORD *)(a1 + 32));
    }
    if (a2)
      v68 = CFSTR("knownRefinementType");
    else
      v68 = CFSTR("known_refinement_type");
    objc_msgSend(v4, "setObject:forKey:", v63, v68);

    v11 = &OBJC_IVAR___GEOTransitVehicleInfo__pickupDropoffType;
  }
  if ((*(_BYTE *)(a1 + 252) & 4) != 0)
  {
    v69 = *(int *)(a1 + 236);
    if (v69 >= 0x24)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 236));
      v70 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v70 = off_1E1C04F90[v69];
    }
    if (a2)
      v75 = CFSTR("placeSummaryRevision");
    else
      v75 = CFSTR("place_summary_revision");
    objc_msgSend(v4, "setObject:forKey:", v70, v75);

  }
  if (*(_QWORD *)(a1 + 128))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v77 = (_QWORD *)(a1 + 120);
    if (*(_QWORD *)(a1 + 128))
    {
      v78 = 0;
      do
      {
        v79 = *(int *)(*v77 + 4 * v78);
        if (v79 >= 5)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v79);
          v80 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v80 = off_1E1C050B0[v79];
        }
        objc_msgSend(v76, "addObject:", v80);

        ++v78;
        v77 = (_QWORD *)(a1 + 120);
      }
      while (v78 < *(_QWORD *)(a1 + 128));
    }
    if (a2)
      v81 = CFSTR("supportedPlaceSummaryFormatType");
    else
      v81 = CFSTR("supported_place_summary_format_type");
    objc_msgSend(v4, "setObject:forKey:", v76, v81);

    v11 = &OBJC_IVAR___GEOTransitVehicleInfo__pickupDropoffType;
  }
  objc_msgSend((id)a1, "evChargingParameters");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v83 = v82;
  if (v82)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v82, "jsonRepresentation");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      v85 = CFSTR("evChargingParameters");
    }
    else
    {
      objc_msgSend(v82, "dictionaryRepresentation");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      v85 = CFSTR("ev_charging_parameters");
    }
    v86 = v84;

    objc_msgSend(v4, "setObject:forKey:", v86, v85);
  }

  if (*(_QWORD *)(a1 + 80))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    v88 = (_QWORD *)(a1 + 72);
    if (*(_QWORD *)(a1 + 80))
    {
      v89 = 0;
      do
      {
        v90 = *(int *)(*v88 + 4 * v89);
        if (v90 >= 3)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v90);
          v91 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v91 = off_1E1C04708[v90];
        }
        objc_msgSend(v87, "addObject:", v91);

        ++v89;
        v88 = (_QWORD *)(a1 + 72);
      }
      while (v89 < *(_QWORD *)(a1 + 80));
    }
    if (a2)
      v92 = CFSTR("supportedHighlightType");
    else
      v92 = CFSTR("supported_highlight_type");
    objc_msgSend(v4, "setObject:forKey:", v87, v92);

    v11 = &OBJC_IVAR___GEOTransitVehicleInfo__pickupDropoffType;
  }
  objc_msgSend((id)a1, "autocompleteOriginationInfo");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  v94 = v93;
  if (v93)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v93, "jsonRepresentation");
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      v96 = CFSTR("autocompleteOriginationInfo");
    }
    else
    {
      objc_msgSend(v93, "dictionaryRepresentation");
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      v96 = CFSTR("autocomplete_origination_info");
    }
    v97 = v95;

    objc_msgSend(v4, "setObject:forKey:", v97, v96);
  }

  v98 = *(_DWORD *)(a1 + v11[899]);
  if ((v98 & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 242));
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v100 = CFSTR("supportClientRankingCompositeFeatures");
    else
      v100 = CFSTR("support_client_ranking_composite_features");
    objc_msgSend(v4, "setObject:forKey:", v99, v100);

    v98 = *(_DWORD *)(a1 + 252);
  }
  if ((v98 & 0x400) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 247));
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v102 = CFSTR("supportStructuredRapAffordance");
    else
      v102 = CFSTR("support_structured_rap_affordance");
    objc_msgSend(v4, "setObject:forKey:", v101, v102);

  }
  v103 = *(void **)(a1 + 16);
  if (v103)
  {
    objc_msgSend(v103, "dictionaryRepresentation");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    v105 = v104;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v104, "count"));
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      v111[0] = MEMORY[0x1E0C809B0];
      v111[1] = 3221225472;
      v111[2] = __77__GEOPDAutocompleteParametersAllEntriesWithBrowse__dictionaryRepresentation___block_invoke;
      v111[3] = &unk_1E1C00600;
      v107 = v106;
      v112 = v107;
      objc_msgSend(v105, "enumerateKeysAndObjectsUsingBlock:", v111);
      v108 = v107;

      v105 = v108;
    }
    objc_msgSend(v4, "setObject:forKey:", v105, CFSTR("Unknown Fields"));

  }
  v109 = v4;

  return v109;
}

- (id)jsonRepresentation
{
  return -[GEOPDAutocompleteParametersAllEntriesWithBrowse _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __77__GEOPDAutocompleteParametersAllEntriesWithBrowse__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOPDAutocompleteParametersAllEntriesWithBrowse)initWithDictionary:(id)a3
{
  return (GEOPDAutocompleteParametersAllEntriesWithBrowse *)-[GEOPDAutocompleteParametersAllEntriesWithBrowse _initWithDictionary:isJSON:](self, a3, 0);
}

- (id)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  GEOPDViewportInfo *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  GEOPDAutocompleteEntry *v23;
  uint64_t v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  GEOPDVenueIdentifier *v30;
  void *v31;
  const __CFString *v32;
  void *v33;
  const __CFString *v34;
  void *v35;
  GEOPDRetainedSearchMetadata *v36;
  void *v37;
  const __CFString *v38;
  void *v39;
  const __CFString *v40;
  void *v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t i;
  void *v47;
  id v48;
  uint64_t v49;
  const __CFString *v50;
  void *v51;
  GEOPDAutocompleteEntry *v52;
  uint64_t v53;
  void *v54;
  const __CFString *v55;
  void *v56;
  const __CFString *v57;
  void *v58;
  const __CFString *v59;
  void *v60;
  const __CFString *v61;
  void *v62;
  id v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t j;
  void *v68;
  id v69;
  uint64_t v70;
  const __CFString *v71;
  void *v72;
  const __CFString *v73;
  void *v74;
  id v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t k;
  void *v80;
  id v81;
  uint64_t v82;
  const __CFString *v83;
  void *v84;
  id v85;
  uint64_t v86;
  const __CFString *v87;
  void *v88;
  id v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t m;
  void *v94;
  id v95;
  uint64_t v96;
  const __CFString *v97;
  void *v98;
  GEOPDSSearchEvChargingParameters *v99;
  void *v100;
  const __CFString *v101;
  void *v102;
  id v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t n;
  void *v108;
  id v109;
  uint64_t v110;
  const __CFString *v111;
  void *v112;
  GEOPDAutocompleteOriginationInfo *v113;
  uint64_t v114;
  void *v115;
  const __CFString *v116;
  void *v117;
  const __CFString *v118;
  void *v119;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  int v125;
  id v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  _BYTE v147[128];
  _BYTE v148[128];
  _BYTE v149[128];
  _BYTE v150[128];
  _BYTE v151[128];
  uint64_t v152;

  v152 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (!a1)
    goto LABEL_340;
  v6 = (id)objc_msgSend(a1, "init");

  if (!v6)
  {
    a1 = 0;
    goto LABEL_340;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("query"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(v6, "setQuery:", v8);

  }
  if (a3)
    v9 = CFSTR("viewportInfo");
  else
    v9 = CFSTR("viewport_info");
  objc_msgSend(v5, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = [GEOPDViewportInfo alloc];
    if ((a3 & 1) != 0)
      v12 = -[GEOPDViewportInfo initWithJSON:](v11, "initWithJSON:", v10);
    else
      v12 = -[GEOPDViewportInfo initWithDictionary:](v11, "initWithDictionary:", v10);
    v13 = (void *)v12;
    objc_msgSend(v6, "setViewportInfo:", v12);

  }
  if (a3)
    v14 = CFSTR("maxResults");
  else
    v14 = CFSTR("max_results");
  objc_msgSend(v5, "objectForKeyedSubscript:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setMaxResults:", objc_msgSend(v15, "intValue"));

  if (a3)
    v16 = CFSTR("highlightDiff");
  else
    v16 = CFSTR("highlight_diff");
  objc_msgSend(v5, "objectForKeyedSubscript:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setHighlightDiff:", objc_msgSend(v17, "BOOLValue"));

  if (a3)
    v18 = CFSTR("categorySuggestionEntryMetadata");
  else
    v18 = CFSTR("category_suggestion_entry_metadata");
  objc_msgSend(v5, "objectForKeyedSubscript:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v19, 0);
    objc_msgSend(v6, "setCategorySuggestionEntryMetadata:", v20);

  }
  if (a3)
    v21 = CFSTR("categorySuggestionEntry");
  else
    v21 = CFSTR("category_suggestion_entry");
  objc_msgSend(v5, "objectForKeyedSubscript:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v23 = [GEOPDAutocompleteEntry alloc];
    if ((a3 & 1) != 0)
      v24 = -[GEOPDAutocompleteEntry initWithJSON:](v23, "initWithJSON:", v22);
    else
      v24 = -[GEOPDAutocompleteEntry initWithDictionary:](v23, "initWithDictionary:", v22);
    v25 = (void *)v24;
    objc_msgSend(v6, "setCategorySuggestionEntry:", v24);

  }
  if (a3)
    v26 = CFSTR("interleaveCategorySuggestions");
  else
    v26 = CFSTR("interleave_category_suggestions");
  objc_msgSend(v5, "objectForKeyedSubscript:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setInterleaveCategorySuggestions:", objc_msgSend(v27, "BOOLValue"));

  if (a3)
    v28 = CFSTR("venueIdentifier");
  else
    v28 = CFSTR("venue_identifier");
  objc_msgSend(v5, "objectForKeyedSubscript:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v30 = [GEOPDVenueIdentifier alloc];
    if (v30)
      v31 = (void *)-[GEOPDVenueIdentifier _initWithDictionary:isJSON:]((uint64_t)v30, v29, a3);
    else
      v31 = 0;
    objc_msgSend(v6, "setVenueIdentifier:", v31);

  }
  if (a3)
    v32 = CFSTR("supportDirectionIntentSuggestions");
  else
    v32 = CFSTR("support_direction_intent_suggestions");
  objc_msgSend(v5, "objectForKeyedSubscript:", v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setSupportDirectionIntentSuggestions:", objc_msgSend(v33, "BOOLValue"));

  if (a3)
    v34 = CFSTR("retainedSearch");
  else
    v34 = CFSTR("retained_search");
  objc_msgSend(v5, "objectForKeyedSubscript:", v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v36 = [GEOPDRetainedSearchMetadata alloc];
    if (v36)
      v37 = (void *)-[GEOPDRetainedSearchMetadata _initWithDictionary:isJSON:]((uint64_t)v36, v35, a3);
    else
      v37 = 0;
    objc_msgSend(v6, "setRetainedSearch:", v37);

  }
  if (a3)
    v38 = CFSTR("supportUnresolvedDirectionIntent");
  else
    v38 = CFSTR("support_unresolved_direction_intent");
  objc_msgSend(v5, "objectForKeyedSubscript:", v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setSupportUnresolvedDirectionIntent:", objc_msgSend(v39, "BOOLValue"));

  if (a3)
    v40 = CFSTR("supportedListType");
  else
    v40 = CFSTR("supported_list_type");
  objc_msgSend(v5, "objectForKeyedSubscript:", v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v126 = v5;
  v125 = a3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v145 = 0u;
    v146 = 0u;
    v143 = 0u;
    v144 = 0u;
    v121 = v41;
    v42 = v41;
    v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v143, v151, 16);
    if (!v43)
      goto LABEL_89;
    v44 = v43;
    v45 = *(_QWORD *)v144;
    while (1)
    {
      for (i = 0; i != v44; ++i)
      {
        if (*(_QWORD *)v144 != v45)
          objc_enumerationMutation(v42);
        v47 = *(void **)(*((_QWORD *)&v143 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v48 = v47;
          if ((objc_msgSend(v48, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
          {
            v49 = 0;
          }
          else if ((objc_msgSend(v48, "isEqualToString:", CFSTR("INTERLEAVED")) & 1) != 0)
          {
            v49 = 1;
          }
          else if (objc_msgSend(v48, "isEqualToString:", CFSTR("SECTION_ONLY_FOR_QUERY")))
          {
            v49 = 2;
          }
          else
          {
            v49 = 0;
          }

        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            continue;
          v49 = objc_msgSend(v47, "intValue");
        }
        objc_msgSend(v6, "addSupportedListType:", v49);
      }
      v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v143, v151, 16);
      if (!v44)
      {
LABEL_89:

        v5 = v126;
        a3 = v125;
        v41 = v121;
        break;
      }
    }
  }

  if (a3)
    v50 = CFSTR("querySuggestionEntry");
  else
    v50 = CFSTR("query_suggestion_entry");
  objc_msgSend(v5, "objectForKeyedSubscript:", v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v52 = [GEOPDAutocompleteEntry alloc];
    if ((a3 & 1) != 0)
      v53 = -[GEOPDAutocompleteEntry initWithJSON:](v52, "initWithJSON:", v51);
    else
      v53 = -[GEOPDAutocompleteEntry initWithDictionary:](v52, "initWithDictionary:", v51);
    v54 = (void *)v53;
    objc_msgSend(v6, "setQuerySuggestionEntry:", v53);

  }
  if (a3)
    v55 = CFSTR("supportClientRankingFeatureMetadata");
  else
    v55 = CFSTR("support_client_ranking_feature_metadata");
  objc_msgSend(v5, "objectForKeyedSubscript:", v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setSupportClientRankingFeatureMetadata:", objc_msgSend(v56, "BOOLValue"));

  if (a3)
    v57 = CFSTR("maxQueryBuilderSuggestions");
  else
    v57 = CFSTR("max_query_builder_suggestions");
  objc_msgSend(v5, "objectForKeyedSubscript:", v57);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setMaxQueryBuilderSuggestions:", objc_msgSend(v58, "intValue"));

  if (a3)
    v59 = CFSTR("supportSectionHeader");
  else
    v59 = CFSTR("support_section_header");
  objc_msgSend(v5, "objectForKeyedSubscript:", v59);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setSupportSectionHeader:", objc_msgSend(v60, "BOOLValue"));

  if (a3)
    v61 = CFSTR("supportedAutocompleteResultCellType");
  else
    v61 = CFSTR("supported_autocomplete_result_cell_type");
  objc_msgSend(v5, "objectForKeyedSubscript:", v61);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v141 = 0u;
    v142 = 0u;
    v139 = 0u;
    v140 = 0u;
    v122 = v62;
    v63 = v62;
    v64 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v139, v150, 16);
    if (!v64)
      goto LABEL_140;
    v65 = v64;
    v66 = *(_QWORD *)v140;
    while (1)
    {
      for (j = 0; j != v65; ++j)
      {
        if (*(_QWORD *)v140 != v66)
          objc_enumerationMutation(v63);
        v68 = *(void **)(*((_QWORD *)&v139 + 1) + 8 * j);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v69 = v68;
          if ((objc_msgSend(v69, "isEqualToString:", CFSTR("AUTOCOMPLETE_RESULT_CELL_TYPE_DEFAULT")) & 1) != 0)
          {
            v70 = 0;
          }
          else if ((objc_msgSend(v69, "isEqualToString:", CFSTR("AUTOCOMPLETE_RESULT_CELL_TYPE_PROMINENT_QUERY")) & 1) != 0)
          {
            v70 = 1;
          }
          else if ((objc_msgSend(v69, "isEqualToString:", CFSTR("AUTOCOMPLETE_RESULT_CELL_TYPE_PROMINENT_RESULT")) & 1) != 0)
          {
            v70 = 2;
          }
          else if ((objc_msgSend(v69, "isEqualToString:", CFSTR("AUTOCOMPLETE_RESULT_CELL_TYPE_TWO_LINE")) & 1) != 0)
          {
            v70 = 3;
          }
          else if (objc_msgSend(v69, "isEqualToString:", CFSTR("AUTOCOMPLETE_RESULT_CELL_TYPE_PROMINENT_RESULT_TWO_LINE")))
          {
            v70 = 4;
          }
          else
          {
            v70 = 0;
          }

        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            continue;
          v70 = objc_msgSend(v68, "intValue");
        }
        objc_msgSend(v6, "addSupportedAutocompleteResultCellType:", v70);
      }
      v65 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v139, v150, 16);
      if (!v65)
      {
LABEL_140:

        v5 = v126;
        a3 = v125;
        v62 = v122;
        break;
      }
    }
  }

  if (a3)
    v71 = CFSTR("supportRapAffordance");
  else
    v71 = CFSTR("support_rap_affordance");
  objc_msgSend(v5, "objectForKeyedSubscript:", v71);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setSupportRapAffordance:", objc_msgSend(v72, "BOOLValue"));

  if (a3)
    v73 = CFSTR("knownRefinementType");
  else
    v73 = CFSTR("known_refinement_type");
  objc_msgSend(v5, "objectForKeyedSubscript:", v73);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v137 = 0u;
    v138 = 0u;
    v135 = 0u;
    v136 = 0u;
    v75 = v74;
    v76 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v135, v149, 16);
    if (!v76)
      goto LABEL_177;
    v77 = v76;
    v78 = *(_QWORD *)v136;
    while (1)
    {
      for (k = 0; k != v77; ++k)
      {
        if (*(_QWORD *)v136 != v78)
          objc_enumerationMutation(v75);
        v80 = *(void **)(*((_QWORD *)&v135 + 1) + 8 * k);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v81 = v80;
          if ((objc_msgSend(v81, "isEqualToString:", CFSTR("RESULT_REFINEMENT_TYPE_UNKNOWN")) & 1) != 0)
          {
            v82 = 0;
          }
          else if ((objc_msgSend(v81, "isEqualToString:", CFSTR("RESULT_REFINEMENT_TYPE_TOGGLE")) & 1) != 0)
          {
            v82 = 1;
          }
          else if ((objc_msgSend(v81, "isEqualToString:", CFSTR("RESULT_REFINEMENT_TYPE_RANGE")) & 1) != 0)
          {
            v82 = 2;
          }
          else if ((objc_msgSend(v81, "isEqualToString:", CFSTR("RESULT_REFINEMENT_TYPE_MULTI_SELECT")) & 1) != 0)
          {
            v82 = 3;
          }
          else if ((objc_msgSend(v81, "isEqualToString:", CFSTR("RESULT_REFINEMENT_TYPE_SORT")) & 1) != 0)
          {
            v82 = 4;
          }
          else if ((objc_msgSend(v81, "isEqualToString:", CFSTR("RESULT_REFINEMENT_GUIDES_HOME")) & 1) != 0)
          {
            v82 = 5;
          }
          else if (objc_msgSend(v81, "isEqualToString:", CFSTR("RESULT_REFINEMENT_TYPE_OPEN_OPTIONS")))
          {
            v82 = 6;
          }
          else
          {
            v82 = 0;
          }

        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            continue;
          v82 = objc_msgSend(v80, "intValue");
        }
        objc_msgSend(v6, "addKnownRefinementType:", v82);
      }
      v77 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v135, v149, 16);
      if (!v77)
      {
LABEL_177:

        v5 = v126;
        a3 = v125;
        break;
      }
    }
  }

  if (a3)
    v83 = CFSTR("placeSummaryRevision");
  else
    v83 = CFSTR("place_summary_revision");
  objc_msgSend(v5, "objectForKeyedSubscript:", v83);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v85 = v84;
    if ((objc_msgSend(v85, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
    {
      v86 = 0;
    }
    else if ((objc_msgSend(v85, "isEqualToString:", CFSTR("NAME")) & 1) != 0)
    {
      v86 = 1;
    }
    else if ((objc_msgSend(v85, "isEqualToString:", CFSTR("CATEGORY")) & 1) != 0)
    {
      v86 = 2;
    }
    else if ((objc_msgSend(v85, "isEqualToString:", CFSTR("DISTANCE")) & 1) != 0)
    {
      v86 = 3;
    }
    else if ((objc_msgSend(v85, "isEqualToString:", CFSTR("PRICE")) & 1) != 0)
    {
      v86 = 4;
    }
    else if ((objc_msgSend(v85, "isEqualToString:", CFSTR("HOURS")) & 1) != 0)
    {
      v86 = 5;
    }
    else if ((objc_msgSend(v85, "isEqualToString:", CFSTR("ADDRESS")) & 1) != 0)
    {
      v86 = 6;
    }
    else if ((objc_msgSend(v85, "isEqualToString:", CFSTR("RATINGS")) & 1) != 0)
    {
      v86 = 7;
    }
    else if ((objc_msgSend(v85, "isEqualToString:", CFSTR("TRANSIT_SHIELDS")) & 1) != 0)
    {
      v86 = 8;
    }
    else if ((objc_msgSend(v85, "isEqualToString:", CFSTR("USER_GENERATED_GUIDES")) & 1) != 0)
    {
      v86 = 9;
    }
    else if ((objc_msgSend(v85, "isEqualToString:", CFSTR("CURATED_GUIDES")) & 1) != 0)
    {
      v86 = 10;
    }
    else if ((objc_msgSend(v85, "isEqualToString:", CFSTR("EV_CHARGERS_NUMBER")) & 1) != 0)
    {
      v86 = 11;
    }
    else
    {
      if ((objc_msgSend(v85, "isEqualToString:", CFSTR("UGC_USER_SUBMITTED_RECOMMENDATIONS")) & 1) != 0)
      {
        v86 = 12;
      }
      else if ((objc_msgSend(v85, "isEqualToString:", CFSTR("STRING")) & 1) != 0)
      {
        v86 = 13;
      }
      else if ((objc_msgSend(v85, "isEqualToString:", CFSTR("SERVER_OVERRIDE")) & 1) != 0)
      {
        v86 = 14;
      }
      else if ((objc_msgSend(v85, "isEqualToString:", CFSTR("CONTAINMENT")) & 1) != 0)
      {
        v86 = 15;
      }
      else if ((objc_msgSend(v85, "isEqualToString:", CFSTR("RECENT")) & 1) != 0)
      {
        v86 = 16;
      }
      else if ((objc_msgSend(v85, "isEqualToString:", CFSTR("HIGHLIGHT_MAIN")) & 1) != 0)
      {
        v86 = 17;
      }
      else if ((objc_msgSend(v85, "isEqualToString:", CFSTR("HIGHLIGHT_EXTRA")) & 1) != 0)
      {
        v86 = 18;
      }
      else if ((objc_msgSend(v85, "isEqualToString:", CFSTR("PUBLISHER_NAME_FOR_GUIDE")) & 1) != 0)
      {
        v86 = 19;
      }
      else if ((objc_msgSend(v85, "isEqualToString:", CFSTR("NUM_PLACES_IN_GUIDE")) & 1) != 0)
      {
        v86 = 20;
      }
      else if ((objc_msgSend(v85, "isEqualToString:", CFSTR("PUBLISHER_DESCRIPTION")) & 1) != 0)
      {
        v86 = 21;
      }
      else if ((objc_msgSend(v85, "isEqualToString:", CFSTR("SECONDARY_NAME")) & 1) != 0)
      {
        v86 = 22;
      }
      else if ((objc_msgSend(v85, "isEqualToString:", CFSTR("FACTOID")) & 1) != 0)
      {
        v86 = 23;
      }
      else if ((objc_msgSend(v85, "isEqualToString:", CFSTR("ARP_RATINGS")) & 1) != 0)
      {
        v86 = 24;
      }
      else if ((objc_msgSend(v85, "isEqualToString:", CFSTR("REAL_TIME_EV_CHARGER_AVAILABILITY")) & 1) != 0)
      {
        v86 = 25;
      }
      else if ((objc_msgSend(v85, "isEqualToString:", CFSTR("DETOUR_TIME")) & 1) != 0)
      {
        v86 = 26;
      }
      else if ((objc_msgSend(v85, "isEqualToString:", CFSTR("HIKING_DIFFICULTY")) & 1) != 0)
      {
        v86 = 27;
      }
      else if ((objc_msgSend(v85, "isEqualToString:", CFSTR("HIKING_TRAIL_LENGTH")) & 1) != 0)
      {
        v86 = 28;
      }
      else if ((objc_msgSend(v85, "isEqualToString:", CFSTR("PHOTO_CAROUSEL")) & 1) != 0)
      {
        v86 = 29;
      }
      else if ((objc_msgSend(v85, "isEqualToString:", CFSTR("IN_USER_LIBRARY")) & 1) != 0)
      {
        v86 = 30;
      }
      else if ((objc_msgSend(v85, "isEqualToString:", CFSTR("USER_NOTE")) & 1) != 0)
      {
        v86 = 31;
      }
      else if ((objc_msgSend(v85, "isEqualToString:", CFSTR("HIKE_ROUTE_FACTOID_ELEVATION_GAIN_LOSS")) & 1) != 0)
      {
        v86 = 32;
      }
      else if ((objc_msgSend(v85, "isEqualToString:", CFSTR("HIKE_ROUTE_TYPE")) & 1) != 0)
      {
        v86 = 33;
      }
      else if ((objc_msgSend(v85, "isEqualToString:", CFSTR("HIKE_ROUTE_DURATION")) & 1) != 0)
      {
        v86 = 34;
      }
      else if (objc_msgSend(v85, "isEqualToString:", CFSTR("HIKE_ROUTE_LENGTH")))
      {
        v86 = 35;
      }
      else
      {
        v86 = 0;
      }
      v5 = v126;
      a3 = v125;
    }

    goto LABEL_261;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v86 = objc_msgSend(v84, "intValue");
LABEL_261:
    objc_msgSend(v6, "setPlaceSummaryRevision:", v86);
  }

  if (a3)
    v87 = CFSTR("supportedPlaceSummaryFormatType");
  else
    v87 = CFSTR("supported_place_summary_format_type");
  objc_msgSend(v5, "objectForKeyedSubscript:", v87);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v133 = 0u;
    v134 = 0u;
    v131 = 0u;
    v132 = 0u;
    v123 = v88;
    v89 = v88;
    v90 = objc_msgSend(v89, "countByEnumeratingWithState:objects:count:", &v131, v148, 16);
    if (!v90)
      goto LABEL_289;
    v91 = v90;
    v92 = *(_QWORD *)v132;
    while (1)
    {
      for (m = 0; m != v91; ++m)
      {
        if (*(_QWORD *)v132 != v92)
          objc_enumerationMutation(v89);
        v94 = *(void **)(*((_QWORD *)&v131 + 1) + 8 * m);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v95 = v94;
          if ((objc_msgSend(v95, "isEqualToString:", CFSTR("PLACE_SUMMARY_FORMAT_TYPE_UNKNOWN")) & 1) != 0)
          {
            v96 = 0;
          }
          else if ((objc_msgSend(v95, "isEqualToString:", CFSTR("PLACE_SUMMARY_FORMAT_TYPE_BOLD")) & 1) != 0)
          {
            v96 = 1;
          }
          else if ((objc_msgSend(v95, "isEqualToString:", CFSTR("PLACE_SUMMARY_FORMAT_TYPE_ITALICS")) & 1) != 0)
          {
            v96 = 2;
          }
          else if ((objc_msgSend(v95, "isEqualToString:", CFSTR("PLACE_SUMMARY_FORMAT_TYPE_STRIKETHROUGH")) & 1) != 0)
          {
            v96 = 3;
          }
          else if (objc_msgSend(v95, "isEqualToString:", CFSTR("PLACE_SUMMARY_FORMAT_TYPE_TAPPABLE_ENTITY")))
          {
            v96 = 4;
          }
          else
          {
            v96 = 0;
          }

        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            continue;
          v96 = objc_msgSend(v94, "intValue");
        }
        objc_msgSend(v6, "addSupportedPlaceSummaryFormatType:", v96);
      }
      v91 = objc_msgSend(v89, "countByEnumeratingWithState:objects:count:", &v131, v148, 16);
      if (!v91)
      {
LABEL_289:

        v5 = v126;
        a3 = v125;
        v88 = v123;
        break;
      }
    }
  }

  if (a3)
    v97 = CFSTR("evChargingParameters");
  else
    v97 = CFSTR("ev_charging_parameters");
  objc_msgSend(v5, "objectForKeyedSubscript:", v97);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v99 = [GEOPDSSearchEvChargingParameters alloc];
    if (v99)
      v100 = -[GEOPDSSearchEvChargingParameters _initWithDictionary:isJSON:](v99, v98, a3);
    else
      v100 = 0;
    objc_msgSend(v6, "setEvChargingParameters:", v100);

  }
  if (a3)
    v101 = CFSTR("supportedHighlightType");
  else
    v101 = CFSTR("supported_highlight_type");
  objc_msgSend(v5, "objectForKeyedSubscript:", v101);
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v129 = 0u;
    v130 = 0u;
    v127 = 0u;
    v128 = 0u;
    v124 = v102;
    v103 = v102;
    v104 = objc_msgSend(v103, "countByEnumeratingWithState:objects:count:", &v127, v147, 16);
    if (!v104)
      goto LABEL_320;
    v105 = v104;
    v106 = *(_QWORD *)v128;
    while (1)
    {
      for (n = 0; n != v105; ++n)
      {
        if (*(_QWORD *)v128 != v106)
          objc_enumerationMutation(v103);
        v108 = *(void **)(*((_QWORD *)&v127 + 1) + 8 * n);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v109 = v108;
          if ((objc_msgSend(v109, "isEqualToString:", CFSTR("AUTOCOMPLETE_RESULT_HIGHLIGHT_TYPE_BOLD_HIGHLIGHT")) & 1) != 0)
          {
            v110 = 0;
          }
          else if ((objc_msgSend(v109, "isEqualToString:", CFSTR("AUTOCOMPLETE_RESULT_HIGHLIGHT_TYPE_GRAYSCALE_DARKER_GRAY")) & 1) != 0)
          {
            v110 = 1;
          }
          else if (objc_msgSend(v109, "isEqualToString:", CFSTR("AUTOCOMPLETE_RESULT_HIGHLIGHT_TYPE_GRAYSCALE_DARKER_GRAY_INVERSE")))
          {
            v110 = 2;
          }
          else
          {
            v110 = 0;
          }

        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            continue;
          v110 = objc_msgSend(v108, "intValue");
        }
        objc_msgSend(v6, "addSupportedHighlightType:", v110);
      }
      v105 = objc_msgSend(v103, "countByEnumeratingWithState:objects:count:", &v127, v147, 16);
      if (!v105)
      {
LABEL_320:

        v5 = v126;
        a3 = v125;
        v102 = v124;
        break;
      }
    }
  }

  if (a3)
    v111 = CFSTR("autocompleteOriginationInfo");
  else
    v111 = CFSTR("autocomplete_origination_info");
  objc_msgSend(v5, "objectForKeyedSubscript:", v111);
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v113 = [GEOPDAutocompleteOriginationInfo alloc];
    if ((a3 & 1) != 0)
      v114 = -[GEOPDAutocompleteOriginationInfo initWithJSON:](v113, "initWithJSON:", v112);
    else
      v114 = -[GEOPDAutocompleteOriginationInfo initWithDictionary:](v113, "initWithDictionary:", v112);
    v115 = (void *)v114;
    objc_msgSend(v6, "setAutocompleteOriginationInfo:", v114);

  }
  if (a3)
    v116 = CFSTR("supportClientRankingCompositeFeatures");
  else
    v116 = CFSTR("support_client_ranking_composite_features");
  objc_msgSend(v5, "objectForKeyedSubscript:", v116);
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setSupportClientRankingCompositeFeatures:", objc_msgSend(v117, "BOOLValue"));

  if (a3)
    v118 = CFSTR("supportStructuredRapAffordance");
  else
    v118 = CFSTR("support_structured_rap_affordance");
  objc_msgSend(v5, "objectForKeyedSubscript:", v118);
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setSupportStructuredRapAffordance:", objc_msgSend(v119, "BOOLValue"));

  a1 = v6;
LABEL_340:

  return a1;
}

- (GEOPDAutocompleteParametersAllEntriesWithBrowse)initWithJSON:(id)a3
{
  return (GEOPDAutocompleteParametersAllEntriesWithBrowse *)-[GEOPDAutocompleteParametersAllEntriesWithBrowse _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_880;
    else
      v8 = (int *)&readAll__nonRecursiveTag_881;
    GEOPDAutocompleteParametersAllEntriesWithBrowseReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEOPDAutocompleteParametersAllEntriesWithBrowseCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPDAutocompleteParametersAllEntriesWithBrowseIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDAutocompleteParametersAllEntriesWithBrowseReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  id v5;
  $EAFDE4515419465CA71EC8A4C4CE129B flags;
  unint64_t v7;
  $EAFDE4515419465CA71EC8A4C4CE129B v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  $EAFDE4515419465CA71EC8A4C4CE129B v13;
  PBDataReader *v14;
  void *v15;
  id v16;

  v16 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPDAutocompleteParametersAllEntriesWithBrowseIsDirty((uint64_t)self) & 1) == 0)
  {
    v14 = self->_reader;
    objc_sync_enter(v14);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "writeData:", v15);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v14);
    goto LABEL_63;
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDAutocompleteParametersAllEntriesWithBrowse readAll:](self, "readAll:", 0);
  if (self->_query)
    PBDataWriterWriteStringField();
  v5 = v16;
  if (self->_viewportInfo)
  {
    PBDataWriterWriteSubmessage();
    v5 = v16;
  }
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    v5 = v16;
    flags = self->_flags;
  }
  if ((*(_BYTE *)&flags & 8) != 0)
  {
    PBDataWriterWriteBOOLField();
    v5 = v16;
  }
  if (self->_categorySuggestionEntryMetadata)
  {
    PBDataWriterWriteDataField();
    v5 = v16;
  }
  if (self->_categorySuggestionEntry)
  {
    PBDataWriterWriteSubmessage();
    v5 = v16;
  }
  if ((*(_BYTE *)&self->_flags & 0x10) != 0)
  {
    PBDataWriterWriteBOOLField();
    v5 = v16;
  }
  if (self->_venueIdentifier)
  {
    PBDataWriterWriteSubmessage();
    v5 = v16;
  }
  if ((*(_BYTE *)&self->_flags & 0x80) != 0)
  {
    PBDataWriterWriteBOOLField();
    v5 = v16;
  }
  if (self->_retainedSearch)
  {
    PBDataWriterWriteSubmessage();
    v5 = v16;
  }
  if ((*((_BYTE *)&self->_flags + 1) & 8) != 0)
  {
    PBDataWriterWriteBOOLField();
    v5 = v16;
  }
  if (self->_supportedListTypes.count)
  {
    v7 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      v5 = v16;
      ++v7;
    }
    while (v7 < self->_supportedListTypes.count);
  }
  if (self->_querySuggestionEntry)
  {
    PBDataWriterWriteSubmessage();
    v5 = v16;
  }
  v8 = self->_flags;
  if ((*(_BYTE *)&v8 & 0x40) == 0)
  {
    if ((*(_BYTE *)&v8 & 1) == 0)
      goto LABEL_32;
LABEL_60:
    PBDataWriterWriteInt32Field();
    v5 = v16;
    if ((*(_DWORD *)&self->_flags & 0x200) == 0)
      goto LABEL_34;
    goto LABEL_33;
  }
  PBDataWriterWriteBOOLField();
  v5 = v16;
  v8 = self->_flags;
  if ((*(_BYTE *)&v8 & 1) != 0)
    goto LABEL_60;
LABEL_32:
  if ((*(_WORD *)&v8 & 0x200) != 0)
  {
LABEL_33:
    PBDataWriterWriteBOOLField();
    v5 = v16;
  }
LABEL_34:
  if (self->_supportedAutocompleteResultCellTypes.count)
  {
    v9 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      v5 = v16;
      ++v9;
    }
    while (v9 < self->_supportedAutocompleteResultCellTypes.count);
  }
  if ((*((_BYTE *)&self->_flags + 1) & 1) != 0)
  {
    PBDataWriterWriteBOOLField();
    v5 = v16;
  }
  if (self->_knownRefinementTypes.count)
  {
    v10 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      v5 = v16;
      ++v10;
    }
    while (v10 < self->_knownRefinementTypes.count);
  }
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    v5 = v16;
  }
  if (self->_supportedPlaceSummaryFormatTypes.count)
  {
    v11 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      v5 = v16;
      ++v11;
    }
    while (v11 < self->_supportedPlaceSummaryFormatTypes.count);
  }
  if (self->_evChargingParameters)
  {
    PBDataWriterWriteSubmessage();
    v5 = v16;
  }
  if (self->_supportedHighlightTypes.count)
  {
    v12 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      v5 = v16;
      ++v12;
    }
    while (v12 < self->_supportedHighlightTypes.count);
  }
  if (self->_autocompleteOriginationInfo)
  {
    PBDataWriterWriteSubmessage();
    v5 = v16;
  }
  v13 = self->_flags;
  if ((*(_BYTE *)&v13 & 0x20) != 0)
  {
    PBDataWriterWriteBOOLField();
    v5 = v16;
    v13 = self->_flags;
  }
  if ((*(_WORD *)&v13 & 0x400) != 0)
  {
    PBDataWriterWriteBOOLField();
    v5 = v16;
  }
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v5);
LABEL_63:

}

- (void)clearSensitiveFields:(unint64_t)a3
{
  GEOPDAutocompleteParametersAllEntriesWithBrowseClearSensitiveFields(self, a3, 1);
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[GEOPDAutocompleteParametersAllEntriesWithBrowse _readAutocompleteOriginationInfo]((uint64_t)self);
  if (-[GEOPDAutocompleteOriginationInfo hasGreenTeaWithValue:](self->_autocompleteOriginationInfo, "hasGreenTeaWithValue:", v3))
  {
    return 1;
  }
  -[GEOPDAutocompleteParametersAllEntriesWithBrowse _readCategorySuggestionEntry]((uint64_t)self);
  if (-[GEOPDAutocompleteEntry hasGreenTeaWithValue:](self->_categorySuggestionEntry, "hasGreenTeaWithValue:", v3))
    return 1;
  -[GEOPDAutocompleteParametersAllEntriesWithBrowse _readQuerySuggestionEntry]((uint64_t)self);
  if (-[GEOPDAutocompleteEntry hasGreenTeaWithValue:](self->_querySuggestionEntry, "hasGreenTeaWithValue:", v3))
    return 1;
  -[GEOPDAutocompleteParametersAllEntriesWithBrowse _readViewportInfo]((uint64_t)self);
  return -[GEOPDViewportInfo hasGreenTeaWithValue:](self->_viewportInfo, "hasGreenTeaWithValue:", v3);
}

- (void)copyTo:(id)a3
{
  $EAFDE4515419465CA71EC8A4C4CE129B flags;
  id *v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  $EAFDE4515419465CA71EC8A4C4CE129B v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t j;
  unint64_t v13;
  unint64_t v14;
  uint64_t k;
  unint64_t v16;
  unint64_t v17;
  uint64_t m;
  unint64_t v19;
  unint64_t v20;
  uint64_t n;
  $EAFDE4515419465CA71EC8A4C4CE129B v22;
  id *v23;

  v23 = (id *)a3;
  -[GEOPDAutocompleteParametersAllEntriesWithBrowse readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v23 + 1, self->_reader);
  *((_DWORD *)v23 + 54) = self->_readerMarkPos;
  *((_DWORD *)v23 + 55) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_query)
    objc_msgSend(v23, "setQuery:");
  if (self->_viewportInfo)
    objc_msgSend(v23, "setViewportInfo:");
  flags = self->_flags;
  v5 = v23;
  if ((*(_BYTE *)&flags & 2) != 0)
  {
    *((_DWORD *)v23 + 58) = self->_maxResults;
    *((_DWORD *)v23 + 63) |= 2u;
    flags = self->_flags;
  }
  if ((*(_BYTE *)&flags & 8) != 0)
  {
    *((_BYTE *)v23 + 240) = self->_highlightDiff;
    *((_DWORD *)v23 + 63) |= 8u;
  }
  if (self->_categorySuggestionEntryMetadata)
  {
    objc_msgSend(v23, "setCategorySuggestionEntryMetadata:");
    v5 = v23;
  }
  if (self->_categorySuggestionEntry)
  {
    objc_msgSend(v23, "setCategorySuggestionEntry:");
    v5 = v23;
  }
  if ((*(_BYTE *)&self->_flags & 0x10) != 0)
  {
    *((_BYTE *)v5 + 241) = self->_interleaveCategorySuggestions;
    *((_DWORD *)v5 + 63) |= 0x10u;
  }
  if (self->_venueIdentifier)
  {
    objc_msgSend(v23, "setVenueIdentifier:");
    v5 = v23;
  }
  if ((*(_BYTE *)&self->_flags & 0x80) != 0)
  {
    *((_BYTE *)v5 + 244) = self->_supportDirectionIntentSuggestions;
    *((_DWORD *)v5 + 63) |= 0x80u;
  }
  if (self->_retainedSearch)
  {
    objc_msgSend(v23, "setRetainedSearch:");
    v5 = v23;
  }
  if ((*((_BYTE *)&self->_flags + 1) & 8) != 0)
  {
    *((_BYTE *)v5 + 248) = self->_supportUnresolvedDirectionIntent;
    *((_DWORD *)v5 + 63) |= 0x800u;
  }
  if (-[GEOPDAutocompleteParametersAllEntriesWithBrowse supportedListTypesCount](self, "supportedListTypesCount"))
  {
    objc_msgSend(v23, "clearSupportedListTypes");
    v6 = -[GEOPDAutocompleteParametersAllEntriesWithBrowse supportedListTypesCount](self, "supportedListTypesCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
        objc_msgSend(v23, "addSupportedListType:", -[GEOPDAutocompleteParametersAllEntriesWithBrowse supportedListTypeAtIndex:](self, "supportedListTypeAtIndex:", i));
    }
  }
  if (self->_querySuggestionEntry)
    objc_msgSend(v23, "setQuerySuggestionEntry:");
  v9 = self->_flags;
  if ((*(_BYTE *)&v9 & 0x40) == 0)
  {
    if ((*(_BYTE *)&v9 & 1) == 0)
      goto LABEL_31;
LABEL_63:
    *((_DWORD *)v23 + 57) = self->_maxQueryBuilderSuggestions;
    *((_DWORD *)v23 + 63) |= 1u;
    if ((*(_DWORD *)&self->_flags & 0x200) == 0)
      goto LABEL_33;
    goto LABEL_32;
  }
  *((_BYTE *)v23 + 243) = self->_supportClientRankingFeatureMetadata;
  *((_DWORD *)v23 + 63) |= 0x40u;
  v9 = self->_flags;
  if ((*(_BYTE *)&v9 & 1) != 0)
    goto LABEL_63;
LABEL_31:
  if ((*(_WORD *)&v9 & 0x200) != 0)
  {
LABEL_32:
    *((_BYTE *)v23 + 246) = self->_supportSectionHeader;
    *((_DWORD *)v23 + 63) |= 0x200u;
  }
LABEL_33:
  if (-[GEOPDAutocompleteParametersAllEntriesWithBrowse supportedAutocompleteResultCellTypesCount](self, "supportedAutocompleteResultCellTypesCount"))
  {
    objc_msgSend(v23, "clearSupportedAutocompleteResultCellTypes");
    v10 = -[GEOPDAutocompleteParametersAllEntriesWithBrowse supportedAutocompleteResultCellTypesCount](self, "supportedAutocompleteResultCellTypesCount");
    if (v10)
    {
      v11 = v10;
      for (j = 0; j != v11; ++j)
        objc_msgSend(v23, "addSupportedAutocompleteResultCellType:", -[GEOPDAutocompleteParametersAllEntriesWithBrowse supportedAutocompleteResultCellTypeAtIndex:](self, "supportedAutocompleteResultCellTypeAtIndex:", j));
    }
  }
  if ((*((_BYTE *)&self->_flags + 1) & 1) != 0)
  {
    *((_BYTE *)v23 + 245) = self->_supportRapAffordance;
    *((_DWORD *)v23 + 63) |= 0x100u;
  }
  if (-[GEOPDAutocompleteParametersAllEntriesWithBrowse knownRefinementTypesCount](self, "knownRefinementTypesCount"))
  {
    objc_msgSend(v23, "clearKnownRefinementTypes");
    v13 = -[GEOPDAutocompleteParametersAllEntriesWithBrowse knownRefinementTypesCount](self, "knownRefinementTypesCount");
    if (v13)
    {
      v14 = v13;
      for (k = 0; k != v14; ++k)
        objc_msgSend(v23, "addKnownRefinementType:", -[GEOPDAutocompleteParametersAllEntriesWithBrowse knownRefinementTypeAtIndex:](self, "knownRefinementTypeAtIndex:", k));
    }
  }
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    *((_DWORD *)v23 + 59) = self->_placeSummaryRevision;
    *((_DWORD *)v23 + 63) |= 4u;
  }
  if (-[GEOPDAutocompleteParametersAllEntriesWithBrowse supportedPlaceSummaryFormatTypesCount](self, "supportedPlaceSummaryFormatTypesCount"))
  {
    objc_msgSend(v23, "clearSupportedPlaceSummaryFormatTypes");
    v16 = -[GEOPDAutocompleteParametersAllEntriesWithBrowse supportedPlaceSummaryFormatTypesCount](self, "supportedPlaceSummaryFormatTypesCount");
    if (v16)
    {
      v17 = v16;
      for (m = 0; m != v17; ++m)
        objc_msgSend(v23, "addSupportedPlaceSummaryFormatType:", -[GEOPDAutocompleteParametersAllEntriesWithBrowse supportedPlaceSummaryFormatTypeAtIndex:](self, "supportedPlaceSummaryFormatTypeAtIndex:", m));
    }
  }
  if (self->_evChargingParameters)
    objc_msgSend(v23, "setEvChargingParameters:");
  if (-[GEOPDAutocompleteParametersAllEntriesWithBrowse supportedHighlightTypesCount](self, "supportedHighlightTypesCount"))
  {
    objc_msgSend(v23, "clearSupportedHighlightTypes");
    v19 = -[GEOPDAutocompleteParametersAllEntriesWithBrowse supportedHighlightTypesCount](self, "supportedHighlightTypesCount");
    if (v19)
    {
      v20 = v19;
      for (n = 0; n != v20; ++n)
        objc_msgSend(v23, "addSupportedHighlightType:", -[GEOPDAutocompleteParametersAllEntriesWithBrowse supportedHighlightTypeAtIndex:](self, "supportedHighlightTypeAtIndex:", n));
    }
  }
  if (self->_autocompleteOriginationInfo)
    objc_msgSend(v23, "setAutocompleteOriginationInfo:");
  v22 = self->_flags;
  if ((*(_BYTE *)&v22 & 0x20) != 0)
  {
    *((_BYTE *)v23 + 242) = self->_supportClientRankingCompositeFeatures;
    *((_DWORD *)v23 + 63) |= 0x20u;
    v22 = self->_flags;
  }
  if ((*(_WORD *)&v22 & 0x400) != 0)
  {
    *((_BYTE *)v23 + 247) = self->_supportStructuredRapAffordance;
    *((_DWORD *)v23 + 63) |= 0x400u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  $EAFDE4515419465CA71EC8A4C4CE129B flags;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  $EAFDE4515419465CA71EC8A4C4CE129B v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  $EAFDE4515419465CA71EC8A4C4CE129B v29;
  PBUnknownFields *v30;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*((_BYTE *)&self->_flags + 3) & 8) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOPDAutocompleteParametersAllEntriesWithBrowseReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_28;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDAutocompleteParametersAllEntriesWithBrowse readAll:](self, "readAll:", 0);
  v9 = -[NSString copyWithZone:](self->_query, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 184);
  *(_QWORD *)(v5 + 184) = v9;

  v11 = -[GEOPDViewportInfo copyWithZone:](self->_viewportInfo, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 208);
  *(_QWORD *)(v5 + 208) = v11;

  flags = self->_flags;
  if ((*(_BYTE *)&flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 232) = self->_maxResults;
    *(_DWORD *)(v5 + 252) |= 2u;
    flags = self->_flags;
  }
  if ((*(_BYTE *)&flags & 8) != 0)
  {
    *(_BYTE *)(v5 + 240) = self->_highlightDiff;
    *(_DWORD *)(v5 + 252) |= 8u;
  }
  v14 = -[NSData copyWithZone:](self->_categorySuggestionEntryMetadata, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 152);
  *(_QWORD *)(v5 + 152) = v14;

  v16 = -[GEOPDAutocompleteEntry copyWithZone:](self->_categorySuggestionEntry, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 160);
  *(_QWORD *)(v5 + 160) = v16;

  if ((*(_BYTE *)&self->_flags & 0x10) != 0)
  {
    *(_BYTE *)(v5 + 241) = self->_interleaveCategorySuggestions;
    *(_DWORD *)(v5 + 252) |= 0x10u;
  }
  v18 = -[GEOPDVenueIdentifier copyWithZone:](self->_venueIdentifier, "copyWithZone:", a3);
  v19 = *(void **)(v5 + 200);
  *(_QWORD *)(v5 + 200) = v18;

  if ((*(_BYTE *)&self->_flags & 0x80) != 0)
  {
    *(_BYTE *)(v5 + 244) = self->_supportDirectionIntentSuggestions;
    *(_DWORD *)(v5 + 252) |= 0x80u;
  }
  v20 = -[GEOPDRetainedSearchMetadata copyWithZone:](self->_retainedSearch, "copyWithZone:", a3);
  v21 = *(void **)(v5 + 192);
  *(_QWORD *)(v5 + 192) = v20;

  if ((*((_BYTE *)&self->_flags + 1) & 8) != 0)
  {
    *(_BYTE *)(v5 + 248) = self->_supportUnresolvedDirectionIntent;
    *(_DWORD *)(v5 + 252) |= 0x800u;
  }
  PBRepeatedInt32Copy();
  v22 = -[GEOPDAutocompleteEntry copyWithZone:](self->_querySuggestionEntry, "copyWithZone:", a3);
  v23 = *(void **)(v5 + 176);
  *(_QWORD *)(v5 + 176) = v22;

  v24 = self->_flags;
  if ((*(_BYTE *)&v24 & 0x40) == 0)
  {
    if ((*(_BYTE *)&v24 & 1) == 0)
      goto LABEL_17;
LABEL_30:
    *(_DWORD *)(v5 + 228) = self->_maxQueryBuilderSuggestions;
    *(_DWORD *)(v5 + 252) |= 1u;
    if ((*(_DWORD *)&self->_flags & 0x200) == 0)
      goto LABEL_19;
    goto LABEL_18;
  }
  *(_BYTE *)(v5 + 243) = self->_supportClientRankingFeatureMetadata;
  *(_DWORD *)(v5 + 252) |= 0x40u;
  v24 = self->_flags;
  if ((*(_BYTE *)&v24 & 1) != 0)
    goto LABEL_30;
LABEL_17:
  if ((*(_WORD *)&v24 & 0x200) != 0)
  {
LABEL_18:
    *(_BYTE *)(v5 + 246) = self->_supportSectionHeader;
    *(_DWORD *)(v5 + 252) |= 0x200u;
  }
LABEL_19:
  PBRepeatedInt32Copy();
  if ((*((_BYTE *)&self->_flags + 1) & 1) != 0)
  {
    *(_BYTE *)(v5 + 245) = self->_supportRapAffordance;
    *(_DWORD *)(v5 + 252) |= 0x100u;
  }
  PBRepeatedInt32Copy();
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    *(_DWORD *)(v5 + 236) = self->_placeSummaryRevision;
    *(_DWORD *)(v5 + 252) |= 4u;
  }
  PBRepeatedInt32Copy();
  v25 = -[GEOPDSSearchEvChargingParameters copyWithZone:](self->_evChargingParameters, "copyWithZone:", a3);
  v26 = *(void **)(v5 + 168);
  *(_QWORD *)(v5 + 168) = v25;

  PBRepeatedInt32Copy();
  v27 = -[GEOPDAutocompleteOriginationInfo copyWithZone:](self->_autocompleteOriginationInfo, "copyWithZone:", a3);
  v28 = *(void **)(v5 + 144);
  *(_QWORD *)(v5 + 144) = v27;

  v29 = self->_flags;
  if ((*(_BYTE *)&v29 & 0x20) != 0)
  {
    *(_BYTE *)(v5 + 242) = self->_supportClientRankingCompositeFeatures;
    *(_DWORD *)(v5 + 252) |= 0x20u;
    v29 = self->_flags;
  }
  if ((*(_WORD *)&v29 & 0x400) != 0)
  {
    *(_BYTE *)(v5 + 247) = self->_supportStructuredRapAffordance;
    *(_DWORD *)(v5 + 252) |= 0x400u;
  }
  v30 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v30;
LABEL_28:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *query;
  GEOPDViewportInfo *viewportInfo;
  $EAFDE4515419465CA71EC8A4C4CE129B flags;
  int v8;
  NSData *categorySuggestionEntryMetadata;
  GEOPDAutocompleteEntry *categorySuggestionEntry;
  $EAFDE4515419465CA71EC8A4C4CE129B v11;
  int v12;
  GEOPDVenueIdentifier *venueIdentifier;
  GEOPDRetainedSearchMetadata *retainedSearch;
  GEOPDAutocompleteEntry *querySuggestionEntry;
  $EAFDE4515419465CA71EC8A4C4CE129B v16;
  int v17;
  int v18;
  int v19;
  GEOPDSSearchEvChargingParameters *evChargingParameters;
  GEOPDAutocompleteOriginationInfo *autocompleteOriginationInfo;
  $EAFDE4515419465CA71EC8A4C4CE129B v22;
  int v23;
  BOOL v24;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_109;
  -[GEOPDAutocompleteParametersAllEntriesWithBrowse readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  query = self->_query;
  if ((unint64_t)query | *((_QWORD *)v4 + 23))
  {
    if (!-[NSString isEqual:](query, "isEqual:"))
      goto LABEL_109;
  }
  viewportInfo = self->_viewportInfo;
  if ((unint64_t)viewportInfo | *((_QWORD *)v4 + 26))
  {
    if (!-[GEOPDViewportInfo isEqual:](viewportInfo, "isEqual:"))
      goto LABEL_109;
  }
  flags = self->_flags;
  v8 = *((_DWORD *)v4 + 63);
  if ((*(_BYTE *)&flags & 2) != 0)
  {
    if ((v8 & 2) == 0 || self->_maxResults != *((_DWORD *)v4 + 58))
      goto LABEL_109;
  }
  else if ((v8 & 2) != 0)
  {
    goto LABEL_109;
  }
  if ((*(_BYTE *)&flags & 8) != 0)
  {
    if ((v8 & 8) == 0)
      goto LABEL_109;
    if (self->_highlightDiff)
    {
      if (!*((_BYTE *)v4 + 240))
        goto LABEL_109;
    }
    else if (*((_BYTE *)v4 + 240))
    {
      goto LABEL_109;
    }
  }
  else if ((v8 & 8) != 0)
  {
    goto LABEL_109;
  }
  categorySuggestionEntryMetadata = self->_categorySuggestionEntryMetadata;
  if ((unint64_t)categorySuggestionEntryMetadata | *((_QWORD *)v4 + 19)
    && !-[NSData isEqual:](categorySuggestionEntryMetadata, "isEqual:"))
  {
    goto LABEL_109;
  }
  categorySuggestionEntry = self->_categorySuggestionEntry;
  if ((unint64_t)categorySuggestionEntry | *((_QWORD *)v4 + 20))
  {
    if (!-[GEOPDAutocompleteEntry isEqual:](categorySuggestionEntry, "isEqual:"))
      goto LABEL_109;
  }
  v11 = self->_flags;
  v12 = *((_DWORD *)v4 + 63);
  if ((*(_BYTE *)&v11 & 0x10) != 0)
  {
    if ((v12 & 0x10) == 0)
      goto LABEL_109;
    if (self->_interleaveCategorySuggestions)
    {
      if (!*((_BYTE *)v4 + 241))
        goto LABEL_109;
    }
    else if (*((_BYTE *)v4 + 241))
    {
      goto LABEL_109;
    }
  }
  else if ((v12 & 0x10) != 0)
  {
    goto LABEL_109;
  }
  venueIdentifier = self->_venueIdentifier;
  if ((unint64_t)venueIdentifier | *((_QWORD *)v4 + 25))
  {
    if (!-[GEOPDVenueIdentifier isEqual:](venueIdentifier, "isEqual:"))
      goto LABEL_109;
    v11 = self->_flags;
    v12 = *((_DWORD *)v4 + 63);
  }
  if ((*(_BYTE *)&v11 & 0x80) != 0)
  {
    if ((v12 & 0x80) == 0)
      goto LABEL_109;
    if (self->_supportDirectionIntentSuggestions)
    {
      if (!*((_BYTE *)v4 + 244))
        goto LABEL_109;
    }
    else if (*((_BYTE *)v4 + 244))
    {
      goto LABEL_109;
    }
  }
  else if ((v12 & 0x80) != 0)
  {
    goto LABEL_109;
  }
  retainedSearch = self->_retainedSearch;
  if ((unint64_t)retainedSearch | *((_QWORD *)v4 + 24))
  {
    if (!-[GEOPDRetainedSearchMetadata isEqual:](retainedSearch, "isEqual:"))
      goto LABEL_109;
    v11 = self->_flags;
    v12 = *((_DWORD *)v4 + 63);
  }
  if ((*(_WORD *)&v11 & 0x800) != 0)
  {
    if ((v12 & 0x800) == 0)
      goto LABEL_109;
    if (self->_supportUnresolvedDirectionIntent)
    {
      if (!*((_BYTE *)v4 + 248))
        goto LABEL_109;
    }
    else if (*((_BYTE *)v4 + 248))
    {
      goto LABEL_109;
    }
  }
  else if ((v12 & 0x800) != 0)
  {
    goto LABEL_109;
  }
  if (!PBRepeatedInt32IsEqual())
    goto LABEL_109;
  querySuggestionEntry = self->_querySuggestionEntry;
  if ((unint64_t)querySuggestionEntry | *((_QWORD *)v4 + 22))
  {
    if (!-[GEOPDAutocompleteEntry isEqual:](querySuggestionEntry, "isEqual:"))
      goto LABEL_109;
  }
  v16 = self->_flags;
  v17 = *((_DWORD *)v4 + 63);
  if ((*(_BYTE *)&v16 & 0x40) != 0)
  {
    if ((v17 & 0x40) == 0)
      goto LABEL_109;
    if (self->_supportClientRankingFeatureMetadata)
    {
      if (!*((_BYTE *)v4 + 243))
        goto LABEL_109;
    }
    else if (*((_BYTE *)v4 + 243))
    {
      goto LABEL_109;
    }
  }
  else if ((v17 & 0x40) != 0)
  {
    goto LABEL_109;
  }
  if ((*(_BYTE *)&v16 & 1) != 0)
  {
    if ((v17 & 1) == 0 || self->_maxQueryBuilderSuggestions != *((_DWORD *)v4 + 57))
      goto LABEL_109;
  }
  else if ((v17 & 1) != 0)
  {
    goto LABEL_109;
  }
  if ((*(_WORD *)&v16 & 0x200) != 0)
  {
    if ((v17 & 0x200) == 0)
      goto LABEL_109;
    if (self->_supportSectionHeader)
    {
      if (!*((_BYTE *)v4 + 246))
        goto LABEL_109;
    }
    else if (*((_BYTE *)v4 + 246))
    {
      goto LABEL_109;
    }
  }
  else if ((v17 & 0x200) != 0)
  {
    goto LABEL_109;
  }
  if (!PBRepeatedInt32IsEqual())
    goto LABEL_109;
  v18 = *((_DWORD *)v4 + 63);
  if ((*((_BYTE *)&self->_flags + 1) & 1) != 0)
  {
    if ((v18 & 0x100) == 0)
      goto LABEL_109;
    if (self->_supportRapAffordance)
    {
      if (!*((_BYTE *)v4 + 245))
        goto LABEL_109;
    }
    else if (*((_BYTE *)v4 + 245))
    {
      goto LABEL_109;
    }
  }
  else if ((v18 & 0x100) != 0)
  {
    goto LABEL_109;
  }
  if (!PBRepeatedInt32IsEqual())
    goto LABEL_109;
  v19 = *((_DWORD *)v4 + 63);
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    if ((v19 & 4) == 0 || self->_placeSummaryRevision != *((_DWORD *)v4 + 59))
      goto LABEL_109;
  }
  else if ((v19 & 4) != 0)
  {
    goto LABEL_109;
  }
  if (!PBRepeatedInt32IsEqual())
    goto LABEL_109;
  evChargingParameters = self->_evChargingParameters;
  if ((unint64_t)evChargingParameters | *((_QWORD *)v4 + 21))
  {
    if (!-[GEOPDSSearchEvChargingParameters isEqual:](evChargingParameters, "isEqual:"))
      goto LABEL_109;
  }
  if (!PBRepeatedInt32IsEqual())
    goto LABEL_109;
  autocompleteOriginationInfo = self->_autocompleteOriginationInfo;
  if ((unint64_t)autocompleteOriginationInfo | *((_QWORD *)v4 + 18))
  {
    if (!-[GEOPDAutocompleteOriginationInfo isEqual:](autocompleteOriginationInfo, "isEqual:"))
      goto LABEL_109;
  }
  v22 = self->_flags;
  v23 = *((_DWORD *)v4 + 63);
  if ((*(_BYTE *)&v22 & 0x20) != 0)
  {
    if ((v23 & 0x20) == 0)
      goto LABEL_109;
    if (self->_supportClientRankingCompositeFeatures)
    {
      if (!*((_BYTE *)v4 + 242))
        goto LABEL_109;
    }
    else if (*((_BYTE *)v4 + 242))
    {
      goto LABEL_109;
    }
  }
  else if ((v23 & 0x20) != 0)
  {
    goto LABEL_109;
  }
  if ((*(_WORD *)&v22 & 0x400) != 0)
  {
    if ((v23 & 0x400) != 0)
    {
      if (self->_supportStructuredRapAffordance)
      {
        if (!*((_BYTE *)v4 + 247))
          goto LABEL_109;
      }
      else if (*((_BYTE *)v4 + 247))
      {
        goto LABEL_109;
      }
      v24 = 1;
      goto LABEL_110;
    }
LABEL_109:
    v24 = 0;
    goto LABEL_110;
  }
  v24 = (*((_DWORD *)v4 + 63) & 0x400) == 0;
LABEL_110:

  return v24;
}

- (unint64_t)hash
{
  $EAFDE4515419465CA71EC8A4C4CE129B flags;
  $EAFDE4515419465CA71EC8A4C4CE129B v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  $EAFDE4515419465CA71EC8A4C4CE129B v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  NSUInteger v32;

  -[GEOPDAutocompleteParametersAllEntriesWithBrowse readAll:](self, "readAll:", 1);
  v32 = -[NSString hash](self->_query, "hash");
  v31 = -[GEOPDViewportInfo hash](self->_viewportInfo, "hash");
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 2) != 0)
  {
    v30 = 2654435761 * self->_maxResults;
    if ((*(_BYTE *)&flags & 8) != 0)
      goto LABEL_3;
  }
  else
  {
    v30 = 0;
    if ((*(_BYTE *)&flags & 8) != 0)
    {
LABEL_3:
      v29 = 2654435761 * self->_highlightDiff;
      goto LABEL_6;
    }
  }
  v29 = 0;
LABEL_6:
  v28 = -[NSData hash](self->_categorySuggestionEntryMetadata, "hash");
  v27 = -[GEOPDAutocompleteEntry hash](self->_categorySuggestionEntry, "hash");
  if ((*(_BYTE *)&self->_flags & 0x10) != 0)
    v26 = 2654435761 * self->_interleaveCategorySuggestions;
  else
    v26 = 0;
  v25 = -[GEOPDVenueIdentifier hash](self->_venueIdentifier, "hash");
  if ((*(_BYTE *)&self->_flags & 0x80) != 0)
    v24 = 2654435761 * self->_supportDirectionIntentSuggestions;
  else
    v24 = 0;
  v23 = -[GEOPDRetainedSearchMetadata hash](self->_retainedSearch, "hash");
  if ((*((_BYTE *)&self->_flags + 1) & 8) != 0)
    v22 = 2654435761 * self->_supportUnresolvedDirectionIntent;
  else
    v22 = 0;
  v21 = PBRepeatedInt32Hash();
  v20 = -[GEOPDAutocompleteEntry hash](self->_querySuggestionEntry, "hash");
  v4 = self->_flags;
  if ((*(_BYTE *)&v4 & 0x40) == 0)
  {
    v19 = 0;
    if ((*(_BYTE *)&v4 & 1) != 0)
      goto LABEL_17;
LABEL_20:
    v18 = 0;
    if ((*(_WORD *)&v4 & 0x200) != 0)
      goto LABEL_18;
    goto LABEL_21;
  }
  v19 = 2654435761 * self->_supportClientRankingFeatureMetadata;
  if ((*(_BYTE *)&v4 & 1) == 0)
    goto LABEL_20;
LABEL_17:
  v18 = 2654435761 * self->_maxQueryBuilderSuggestions;
  if ((*(_WORD *)&v4 & 0x200) != 0)
  {
LABEL_18:
    v17 = 2654435761 * self->_supportSectionHeader;
    goto LABEL_22;
  }
LABEL_21:
  v17 = 0;
LABEL_22:
  v5 = PBRepeatedInt32Hash();
  if ((*((_BYTE *)&self->_flags + 1) & 1) != 0)
    v6 = 2654435761 * self->_supportRapAffordance;
  else
    v6 = 0;
  v7 = PBRepeatedInt32Hash();
  if ((*(_BYTE *)&self->_flags & 4) != 0)
    v8 = 2654435761 * self->_placeSummaryRevision;
  else
    v8 = 0;
  v9 = PBRepeatedInt32Hash();
  v10 = -[GEOPDSSearchEvChargingParameters hash](self->_evChargingParameters, "hash");
  v11 = PBRepeatedInt32Hash();
  v12 = -[GEOPDAutocompleteOriginationInfo hash](self->_autocompleteOriginationInfo, "hash");
  v13 = self->_flags;
  if ((*(_BYTE *)&v13 & 0x20) != 0)
  {
    v14 = 2654435761 * self->_supportClientRankingCompositeFeatures;
    if ((*(_WORD *)&v13 & 0x400) != 0)
      goto LABEL_30;
LABEL_32:
    v15 = 0;
    return v31 ^ v32 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v18 ^ v17 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v14 ^ v15;
  }
  v14 = 0;
  if ((*(_WORD *)&v13 & 0x400) == 0)
    goto LABEL_32;
LABEL_30:
  v15 = 2654435761 * self->_supportStructuredRapAffordance;
  return v31 ^ v32 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v18 ^ v17 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v14 ^ v15;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  GEOPDViewportInfo *viewportInfo;
  uint64_t v6;
  int v7;
  GEOPDAutocompleteEntry *categorySuggestionEntry;
  uint64_t v9;
  GEOPDVenueIdentifier *venueIdentifier;
  void *v11;
  GEOPDRetainedSearchMetadata *retainedSearch;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  GEOPDAutocompleteEntry *querySuggestionEntry;
  id v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  uint64_t v24;
  uint64_t v25;
  uint64_t k;
  uint64_t v27;
  uint64_t v28;
  uint64_t m;
  GEOPDSSearchEvChargingParameters *evChargingParameters;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t n;
  GEOPDAutocompleteOriginationInfo *autocompleteOriginationInfo;
  id v37;
  uint64_t v38;
  int v39;
  id v40;

  v40 = a3;
  objc_msgSend(v40, "readAll:", 0);
  v4 = v40;
  if (*((_QWORD *)v40 + 23))
  {
    -[GEOPDAutocompleteParametersAllEntriesWithBrowse setQuery:](self, "setQuery:");
    v4 = v40;
  }
  viewportInfo = self->_viewportInfo;
  v6 = *((_QWORD *)v4 + 26);
  if (viewportInfo)
  {
    if (!v6)
      goto LABEL_9;
    -[GEOPDViewportInfo mergeFrom:](viewportInfo, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_9;
    -[GEOPDAutocompleteParametersAllEntriesWithBrowse setViewportInfo:](self, "setViewportInfo:");
  }
  v4 = v40;
LABEL_9:
  v7 = *((_DWORD *)v4 + 63);
  if ((v7 & 2) != 0)
  {
    self->_maxResults = *((_DWORD *)v4 + 58);
    *(_DWORD *)&self->_flags |= 2u;
    v7 = *((_DWORD *)v4 + 63);
  }
  if ((v7 & 8) != 0)
  {
    self->_highlightDiff = *((_BYTE *)v4 + 240);
    *(_DWORD *)&self->_flags |= 8u;
  }
  if (*((_QWORD *)v4 + 19))
  {
    -[GEOPDAutocompleteParametersAllEntriesWithBrowse setCategorySuggestionEntryMetadata:](self, "setCategorySuggestionEntryMetadata:");
    v4 = v40;
  }
  categorySuggestionEntry = self->_categorySuggestionEntry;
  v9 = *((_QWORD *)v4 + 20);
  if (categorySuggestionEntry)
  {
    if (!v9)
      goto LABEL_21;
    -[GEOPDAutocompleteEntry mergeFrom:](categorySuggestionEntry, "mergeFrom:");
  }
  else
  {
    if (!v9)
      goto LABEL_21;
    -[GEOPDAutocompleteParametersAllEntriesWithBrowse setCategorySuggestionEntry:](self, "setCategorySuggestionEntry:");
  }
  v4 = v40;
LABEL_21:
  if ((*((_BYTE *)v4 + 252) & 0x10) != 0)
  {
    self->_interleaveCategorySuggestions = *((_BYTE *)v4 + 241);
    *(_DWORD *)&self->_flags |= 0x10u;
  }
  venueIdentifier = self->_venueIdentifier;
  v11 = (void *)*((_QWORD *)v4 + 25);
  if (venueIdentifier)
  {
    if (!v11)
      goto LABEL_29;
    -[GEOPDVenueIdentifier mergeFrom:]((uint64_t)venueIdentifier, v11);
  }
  else
  {
    if (!v11)
      goto LABEL_29;
    -[GEOPDAutocompleteParametersAllEntriesWithBrowse setVenueIdentifier:](self, "setVenueIdentifier:", *((_QWORD *)v4 + 25));
  }
  v4 = v40;
LABEL_29:
  if ((*((_BYTE *)v4 + 252) & 0x80) != 0)
  {
    self->_supportDirectionIntentSuggestions = *((_BYTE *)v4 + 244);
    *(_DWORD *)&self->_flags |= 0x80u;
  }
  retainedSearch = self->_retainedSearch;
  v13 = (void *)*((_QWORD *)v4 + 24);
  if (retainedSearch)
  {
    if (!v13)
      goto LABEL_37;
    -[GEOPDRetainedSearchMetadata mergeFrom:]((uint64_t)retainedSearch, v13);
  }
  else
  {
    if (!v13)
      goto LABEL_37;
    -[GEOPDAutocompleteParametersAllEntriesWithBrowse setRetainedSearch:](self, "setRetainedSearch:", *((_QWORD *)v4 + 24));
  }
  v4 = v40;
LABEL_37:
  if ((*((_BYTE *)v4 + 253) & 8) != 0)
  {
    self->_supportUnresolvedDirectionIntent = *((_BYTE *)v4 + 248);
    *(_DWORD *)&self->_flags |= 0x800u;
  }
  v14 = objc_msgSend(v4, "supportedListTypesCount");
  if (v14)
  {
    v15 = v14;
    for (i = 0; i != v15; ++i)
      -[GEOPDAutocompleteParametersAllEntriesWithBrowse addSupportedListType:](self, "addSupportedListType:", objc_msgSend(v40, "supportedListTypeAtIndex:", i));
  }
  querySuggestionEntry = self->_querySuggestionEntry;
  v18 = v40;
  v19 = *((_QWORD *)v40 + 22);
  if (querySuggestionEntry)
  {
    if (!v19)
      goto LABEL_48;
    -[GEOPDAutocompleteEntry mergeFrom:](querySuggestionEntry, "mergeFrom:");
  }
  else
  {
    if (!v19)
      goto LABEL_48;
    -[GEOPDAutocompleteParametersAllEntriesWithBrowse setQuerySuggestionEntry:](self, "setQuerySuggestionEntry:");
  }
  v18 = v40;
LABEL_48:
  v20 = *((_DWORD *)v18 + 63);
  if ((v20 & 0x40) != 0)
  {
    self->_supportClientRankingFeatureMetadata = *((_BYTE *)v18 + 243);
    *(_DWORD *)&self->_flags |= 0x40u;
    v20 = *((_DWORD *)v18 + 63);
    if ((v20 & 1) == 0)
    {
LABEL_50:
      if ((v20 & 0x200) == 0)
        goto LABEL_52;
      goto LABEL_51;
    }
  }
  else if ((v20 & 1) == 0)
  {
    goto LABEL_50;
  }
  self->_maxQueryBuilderSuggestions = *((_DWORD *)v18 + 57);
  *(_DWORD *)&self->_flags |= 1u;
  if ((*((_DWORD *)v18 + 63) & 0x200) != 0)
  {
LABEL_51:
    self->_supportSectionHeader = *((_BYTE *)v18 + 246);
    *(_DWORD *)&self->_flags |= 0x200u;
  }
LABEL_52:
  v21 = objc_msgSend(v18, "supportedAutocompleteResultCellTypesCount");
  if (v21)
  {
    v22 = v21;
    for (j = 0; j != v22; ++j)
      -[GEOPDAutocompleteParametersAllEntriesWithBrowse addSupportedAutocompleteResultCellType:](self, "addSupportedAutocompleteResultCellType:", objc_msgSend(v40, "supportedAutocompleteResultCellTypeAtIndex:", j));
  }
  if ((*((_BYTE *)v40 + 253) & 1) != 0)
  {
    self->_supportRapAffordance = *((_BYTE *)v40 + 245);
    *(_DWORD *)&self->_flags |= 0x100u;
  }
  v24 = objc_msgSend(v40, "knownRefinementTypesCount");
  if (v24)
  {
    v25 = v24;
    for (k = 0; k != v25; ++k)
      -[GEOPDAutocompleteParametersAllEntriesWithBrowse addKnownRefinementType:](self, "addKnownRefinementType:", objc_msgSend(v40, "knownRefinementTypeAtIndex:", k));
  }
  if ((*((_BYTE *)v40 + 252) & 4) != 0)
  {
    self->_placeSummaryRevision = *((_DWORD *)v40 + 59);
    *(_DWORD *)&self->_flags |= 4u;
  }
  v27 = objc_msgSend(v40, "supportedPlaceSummaryFormatTypesCount");
  if (v27)
  {
    v28 = v27;
    for (m = 0; m != v28; ++m)
      -[GEOPDAutocompleteParametersAllEntriesWithBrowse addSupportedPlaceSummaryFormatType:](self, "addSupportedPlaceSummaryFormatType:", objc_msgSend(v40, "supportedPlaceSummaryFormatTypeAtIndex:", m));
  }
  evChargingParameters = self->_evChargingParameters;
  v31 = v40;
  v32 = (void *)*((_QWORD *)v40 + 21);
  if (evChargingParameters)
  {
    if (!v32)
      goto LABEL_74;
    -[GEOPDSSearchEvChargingParameters mergeFrom:]((uint64_t)evChargingParameters, v32);
  }
  else
  {
    if (!v32)
      goto LABEL_74;
    -[GEOPDAutocompleteParametersAllEntriesWithBrowse setEvChargingParameters:](self, "setEvChargingParameters:", *((_QWORD *)v40 + 21));
  }
  v31 = v40;
LABEL_74:
  v33 = objc_msgSend(v31, "supportedHighlightTypesCount");
  if (v33)
  {
    v34 = v33;
    for (n = 0; n != v34; ++n)
      -[GEOPDAutocompleteParametersAllEntriesWithBrowse addSupportedHighlightType:](self, "addSupportedHighlightType:", objc_msgSend(v40, "supportedHighlightTypeAtIndex:", n));
  }
  autocompleteOriginationInfo = self->_autocompleteOriginationInfo;
  v37 = v40;
  v38 = *((_QWORD *)v40 + 18);
  if (autocompleteOriginationInfo)
  {
    if (!v38)
      goto LABEL_83;
    -[GEOPDAutocompleteOriginationInfo mergeFrom:](autocompleteOriginationInfo, "mergeFrom:");
  }
  else
  {
    if (!v38)
      goto LABEL_83;
    -[GEOPDAutocompleteParametersAllEntriesWithBrowse setAutocompleteOriginationInfo:](self, "setAutocompleteOriginationInfo:");
  }
  v37 = v40;
LABEL_83:
  v39 = *((_DWORD *)v37 + 63);
  if ((v39 & 0x20) != 0)
  {
    self->_supportClientRankingCompositeFeatures = *((_BYTE *)v37 + 242);
    *(_DWORD *)&self->_flags |= 0x20u;
    v39 = *((_DWORD *)v37 + 63);
  }
  if ((v39 & 0x400) != 0)
  {
    self->_supportStructuredRapAffordance = *((_BYTE *)v37 + 247);
    *(_DWORD *)&self->_flags |= 0x400u;
  }

}

- (PBUnknownFields)unknownFields
{
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v5;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*((_BYTE *)&self->_flags + 1) & 0x10) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      v5 = reader;
      objc_sync_enter(v5);
      GEOPDAutocompleteParametersAllEntriesWithBrowseReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_884);
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

  v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x8001000u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEOPDAutocompleteParametersAllEntriesWithBrowse readAll:](self, "readAll:", 0);
    -[GEOPDViewportInfo clearUnknownFields:](self->_viewportInfo, "clearUnknownFields:", 1);
    -[GEOPDAutocompleteEntry clearUnknownFields:](self->_categorySuggestionEntry, "clearUnknownFields:", 1);
    -[GEOPDVenueIdentifier clearUnknownFields:]((uint64_t)self->_venueIdentifier, 1);
    -[GEOPDRetainedSearchMetadata clearUnknownFields:]((uint64_t)self->_retainedSearch, 1);
    -[GEOPDAutocompleteEntry clearUnknownFields:](self->_querySuggestionEntry, "clearUnknownFields:", 1);
    -[GEOPDSSearchEvChargingParameters clearUnknownFields:]((uint64_t)self->_evChargingParameters, 1);
    -[GEOPDAutocompleteOriginationInfo clearUnknownFields:](self->_autocompleteOriginationInfo, "clearUnknownFields:", 1);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewportInfo, 0);
  objc_storeStrong((id *)&self->_venueIdentifier, 0);
  objc_storeStrong((id *)&self->_retainedSearch, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_querySuggestionEntry, 0);
  objc_storeStrong((id *)&self->_evChargingParameters, 0);
  objc_storeStrong((id *)&self->_categorySuggestionEntry, 0);
  objc_storeStrong((id *)&self->_categorySuggestionEntryMetadata, 0);
  objc_storeStrong((id *)&self->_autocompleteOriginationInfo, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
