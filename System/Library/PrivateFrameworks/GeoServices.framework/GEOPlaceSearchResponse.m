@implementation GEOPlaceSearchResponse

- (GEOPlaceSearchResponse)init
{
  GEOPlaceSearchResponse *v2;
  GEOPlaceSearchResponse *v3;
  GEOPlaceSearchResponse *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPlaceSearchResponse;
  v2 = -[GEOPlaceSearchResponse init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPlaceSearchResponse)initWithData:(id)a3
{
  GEOPlaceSearchResponse *v3;
  GEOPlaceSearchResponse *v4;
  GEOPlaceSearchResponse *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPlaceSearchResponse;
  v3 = -[GEOPlaceSearchResponse initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (int)status
{
  return self->_status;
}

- (void)setStatus:(int)a3
{
  *(_WORD *)&self->_flags |= 0x400u;
  self->_status = a3;
}

- (id)statusAsString:(int)a3
{
  __CFString *v3;
  id result;

  if (a3 > 29)
  {
    if (a3 > 49)
    {
      if (a3 == 50)
        return CFSTR("STATUS_DEDUPED");
      if (a3 == 60)
        return CFSTR("VERSION_MISMATCH");
    }
    else
    {
      if (a3 == 30)
        return CFSTR("NEEDS_REFINEMENT");
      if (a3 == 40)
        return CFSTR("FAILED_NOT_AUTHORIZED");
    }
LABEL_15:
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
    return v3;
  }
  else
  {
    v3 = CFSTR("STATUS_SUCCESS");
    switch(a3)
    {
      case 0:
        return v3;
      case 1:
        v3 = CFSTR("STATUS_FAILED");
        return v3;
      case 2:
        result = CFSTR("STATUS_INCOMPLETE");
        break;
      case 3:
      case 4:
        goto LABEL_15;
      case 5:
        result = CFSTR("INVALID_REQUEST");
        break;
      default:
        if (a3 != 20)
          goto LABEL_15;
        result = CFSTR("FAILED_NO_RESULT");
        break;
    }
  }
  return result;
}

- (int)StringAsStatus:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("STATUS_SUCCESS")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("STATUS_FAILED")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("STATUS_INCOMPLETE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("INVALID_REQUEST")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FAILED_NO_RESULT")) & 1) != 0)
  {
    v4 = 20;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NEEDS_REFINEMENT")) & 1) != 0)
  {
    v4 = 30;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FAILED_NOT_AUTHORIZED")) & 1) != 0)
  {
    v4 = 40;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("STATUS_DEDUPED")) & 1) != 0)
  {
    v4 = 50;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("VERSION_MISMATCH")))
  {
    v4 = 60;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_readPlaceResults
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 104) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPlaceSearchResponseReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPlaceResults_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (NSMutableArray)placeResults
{
  -[GEOPlaceSearchResponse _readPlaceResults]((uint64_t)self);
  return self->_placeResults;
}

- (void)setPlaceResults:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *placeResults;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x400u;
  placeResults = self->_placeResults;
  self->_placeResults = v4;

}

- (void)clearPlaceResults
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x400u;
  -[NSMutableArray removeAllObjects](self->_placeResults, "removeAllObjects");
}

- (void)addPlaceResult:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOPlaceSearchResponse _readPlaceResults]((uint64_t)self);
  -[GEOPlaceSearchResponse _addNoFlagsPlaceResult:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x400u;
}

- (void)_addNoFlagsPlaceResult:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 48);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 48);
      *(_QWORD *)(a1 + 48) = v5;

      v4 = *(void **)(a1 + 48);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)placeResultsCount
{
  -[GEOPlaceSearchResponse _readPlaceResults]((uint64_t)self);
  return -[NSMutableArray count](self->_placeResults, "count");
}

- (id)placeResultAtIndex:(unint64_t)a3
{
  -[GEOPlaceSearchResponse _readPlaceResults]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_placeResults, "objectAtIndex:", a3);
}

+ (Class)placeResultType
{
  return (Class)objc_opt_class();
}

- (void)_readMapRegion
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 104) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPlaceSearchResponseReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMapRegion_tags_2518);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (BOOL)hasMapRegion
{
  -[GEOPlaceSearchResponse _readMapRegion]((uint64_t)self);
  return self->_mapRegion != 0;
}

- (GEOMapRegion)mapRegion
{
  -[GEOPlaceSearchResponse _readMapRegion]((uint64_t)self);
  return self->_mapRegion;
}

- (void)setMapRegion:(id)a3
{
  *(_WORD *)&self->_flags |= 0x410u;
  objc_storeStrong((id *)&self->_mapRegion, a3);
}

- (void)_readSuggestionEntryLists
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 104) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPlaceSearchResponseReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSuggestionEntryLists_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (NSMutableArray)suggestionEntryLists
{
  -[GEOPlaceSearchResponse _readSuggestionEntryLists]((uint64_t)self);
  return self->_suggestionEntryLists;
}

- (void)setSuggestionEntryLists:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *suggestionEntryLists;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x100u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x400u;
  suggestionEntryLists = self->_suggestionEntryLists;
  self->_suggestionEntryLists = v4;

}

- (void)clearSuggestionEntryLists
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x100u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x400u;
  -[NSMutableArray removeAllObjects](self->_suggestionEntryLists, "removeAllObjects");
}

- (void)addSuggestionEntryLists:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOPlaceSearchResponse _readSuggestionEntryLists]((uint64_t)self);
  -[GEOPlaceSearchResponse _addNoFlagsSuggestionEntryLists:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x100u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x400u;
}

- (void)_addNoFlagsSuggestionEntryLists:(uint64_t)a1
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

- (unint64_t)suggestionEntryListsCount
{
  -[GEOPlaceSearchResponse _readSuggestionEntryLists]((uint64_t)self);
  return -[NSMutableArray count](self->_suggestionEntryLists, "count");
}

- (id)suggestionEntryListsAtIndex:(unint64_t)a3
{
  -[GEOPlaceSearchResponse _readSuggestionEntryLists]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_suggestionEntryLists, "objectAtIndex:", a3);
}

+ (Class)suggestionEntryListsType
{
  return (Class)objc_opt_class();
}

- (void)_readSuggestionMetadata
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 104) & 0x200) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPlaceSearchResponseReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSuggestionMetadata_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (BOOL)hasSuggestionMetadata
{
  -[GEOPlaceSearchResponse _readSuggestionMetadata]((uint64_t)self);
  return self->_suggestionMetadata != 0;
}

- (NSData)suggestionMetadata
{
  -[GEOPlaceSearchResponse _readSuggestionMetadata]((uint64_t)self);
  return self->_suggestionMetadata;
}

- (void)setSuggestionMetadata:(id)a3
{
  *(_WORD *)&self->_flags |= 0x600u;
  objc_storeStrong((id *)&self->_suggestionMetadata, a3);
}

- (void)_readNamedFeatures
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 104) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPlaceSearchResponseReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readNamedFeatures_tags_2520);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (NSMutableArray)namedFeatures
{
  -[GEOPlaceSearchResponse _readNamedFeatures]((uint64_t)self);
  return self->_namedFeatures;
}

- (void)setNamedFeatures:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *namedFeatures;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x400u;
  namedFeatures = self->_namedFeatures;
  self->_namedFeatures = v4;

}

- (void)clearNamedFeatures
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x400u;
  -[NSMutableArray removeAllObjects](self->_namedFeatures, "removeAllObjects");
}

- (void)addNamedFeatures:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOPlaceSearchResponse _readNamedFeatures]((uint64_t)self);
  -[GEOPlaceSearchResponse _addNoFlagsNamedFeatures:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x400u;
}

- (void)_addNoFlagsNamedFeatures:(uint64_t)a1
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

- (unint64_t)namedFeaturesCount
{
  -[GEOPlaceSearchResponse _readNamedFeatures]((uint64_t)self);
  return -[NSMutableArray count](self->_namedFeatures, "count");
}

- (id)namedFeaturesAtIndex:(unint64_t)a3
{
  -[GEOPlaceSearchResponse _readNamedFeatures]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_namedFeatures, "objectAtIndex:", a3);
}

+ (Class)namedFeaturesType
{
  return (Class)objc_opt_class();
}

- (int)statusCodeInfo
{
  os_unfair_lock_s *p_readerLock;
  __int16 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 2) != 0)
    return self->_statusCodeInfo;
  else
    return 1;
}

- (void)setStatusCodeInfo:(int)a3
{
  *(_WORD *)&self->_flags |= 0x402u;
  self->_statusCodeInfo = a3;
}

- (void)setHasStatusCodeInfo:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1026;
  else
    v3 = 1024;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasStatusCodeInfo
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
}

- (id)statusCodeInfoAsString:(int)a3
{
  if ((a3 - 1) < 4)
    return off_1E1C0F2C0[a3 - 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsStatusCodeInfo:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TIMEOUT")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("INCOMPLETE_MATCH")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LOW_CONFIDENCE")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("AMBIGUOUS")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (double)turnaroundTime
{
  return self->_turnaroundTime;
}

- (void)setTurnaroundTime:(double)a3
{
  *(_WORD *)&self->_flags |= 0x401u;
  self->_turnaroundTime = a3;
}

- (void)setHasTurnaroundTime:(BOOL)a3
{
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFE | a3 | 0x400;
}

- (BOOL)hasTurnaroundTime
{
  return *(_WORD *)&self->_flags & 1;
}

- (void)_readNearbySectionHeader
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 104) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPlaceSearchResponseReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readNearbySectionHeader_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (BOOL)hasNearbySectionHeader
{
  -[GEOPlaceSearchResponse _readNearbySectionHeader]((uint64_t)self);
  return self->_nearbySectionHeader != 0;
}

- (NSString)nearbySectionHeader
{
  -[GEOPlaceSearchResponse _readNearbySectionHeader]((uint64_t)self);
  return self->_nearbySectionHeader;
}

- (void)setNearbySectionHeader:(id)a3
{
  *(_WORD *)&self->_flags |= 0x440u;
  objc_storeStrong((id *)&self->_nearbySectionHeader, a3);
}

- (BOOL)isChainResultSet
{
  return self->_isChainResultSet;
}

- (void)setIsChainResultSet:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x404u;
  self->_isChainResultSet = a3;
}

- (void)setHasIsChainResultSet:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1028;
  else
    v3 = 1024;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFB | v3;
}

- (BOOL)hasIsChainResultSet
{
  return (*(_WORD *)&self->_flags >> 2) & 1;
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
  v8.super_class = (Class)GEOPlaceSearchResponse;
  -[GEOPlaceSearchResponse description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPlaceSearchResponse dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPlaceSearchResponse _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  int v5;
  __CFString *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t k;
  void *v35;
  void *v36;
  __int16 v37;
  unsigned int v38;
  __CFString *v39;
  void *v40;
  void *v41;
  const __CFString *v42;
  void *v43;
  const __CFString *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  id v50;
  _QWORD v52[4];
  id v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _BYTE v66[128];
  _BYTE v67[128];
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_DWORD *)(a1 + 96);
  if (v5 <= 29)
  {
    v6 = CFSTR("STATUS_SUCCESS");
    switch(v5)
    {
      case 0:
        goto LABEL_19;
      case 1:
        v6 = CFSTR("STATUS_FAILED");
        break;
      case 2:
        v6 = CFSTR("STATUS_INCOMPLETE");
        break;
      case 3:
      case 4:
        goto LABEL_14;
      case 5:
        v6 = CFSTR("INVALID_REQUEST");
        break;
      default:
        if (v5 != 20)
          goto LABEL_14;
        v6 = CFSTR("FAILED_NO_RESULT");
        break;
    }
    goto LABEL_19;
  }
  if (v5 > 49)
  {
    if (v5 == 50)
    {
      v6 = CFSTR("STATUS_DEDUPED");
      goto LABEL_19;
    }
    if (v5 == 60)
    {
      v6 = CFSTR("VERSION_MISMATCH");
      goto LABEL_19;
    }
LABEL_14:
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 96));
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }
  if (v5 == 30)
  {
    v6 = CFSTR("NEEDS_REFINEMENT");
    goto LABEL_19;
  }
  if (v5 != 40)
    goto LABEL_14;
  v6 = CFSTR("FAILED_NOT_AUTHORIZED");
LABEL_19:
  objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("status"));

  if (objc_msgSend(*(id *)(a1 + 48), "count"))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
    v62 = 0u;
    v63 = 0u;
    v64 = 0u;
    v65 = 0u;
    v8 = *(id *)(a1 + 48);
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v62, v68, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v63;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v63 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v13, "jsonRepresentation");
          else
            objc_msgSend(v13, "dictionaryRepresentation");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v14);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v62, v68, 16);
      }
      while (v10);
    }

    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("placeResult"));
  }
  objc_msgSend((id)a1, "mapRegion");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v15, "jsonRepresentation");
    else
      objc_msgSend(v15, "dictionaryRepresentation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v17, CFSTR("mapRegion"));

  }
  if (objc_msgSend(*(id *)(a1 + 56), "count"))
  {
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 56), "count"));
    v58 = 0u;
    v59 = 0u;
    v60 = 0u;
    v61 = 0u;
    v19 = *(id *)(a1 + 56);
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v58, v67, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v59;
      do
      {
        for (j = 0; j != v21; ++j)
        {
          if (*(_QWORD *)v59 != v22)
            objc_enumerationMutation(v19);
          v24 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * j);
          if ((a2 & 1) != 0)
            objc_msgSend(v24, "jsonRepresentation");
          else
            objc_msgSend(v24, "dictionaryRepresentation");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "addObject:", v25);

        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v58, v67, 16);
      }
      while (v21);
    }

    objc_msgSend(v4, "setObject:forKey:", v18, CFSTR("suggestionEntryLists"));
  }
  objc_msgSend((id)a1, "suggestionMetadata");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v26;
  if (v26)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v26, "base64EncodedStringWithOptions:", 0);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v28, CFSTR("suggestionMetadata"));

    }
    else
    {
      objc_msgSend(v4, "setObject:forKey:", v26, CFSTR("suggestionMetadata"));
    }
  }

  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    v30 = *(id *)(a1 + 32);
    v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v54, v66, 16);
    if (v31)
    {
      v32 = v31;
      v33 = *(_QWORD *)v55;
      do
      {
        for (k = 0; k != v32; ++k)
        {
          if (*(_QWORD *)v55 != v33)
            objc_enumerationMutation(v30);
          v35 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * k);
          if ((a2 & 1) != 0)
            objc_msgSend(v35, "jsonRepresentation");
          else
            objc_msgSend(v35, "dictionaryRepresentation");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "addObject:", v36);

        }
        v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v54, v66, 16);
      }
      while (v32);
    }

    objc_msgSend(v4, "setObject:forKey:", v29, CFSTR("namedFeatures"));
  }
  v37 = *(_WORD *)(a1 + 104);
  if ((v37 & 2) != 0)
  {
    v38 = *(_DWORD *)(a1 + 92) - 1;
    if (v38 >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 92));
      v39 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v39 = off_1E1C0F2C0[v38];
    }
    objc_msgSend(v4, "setObject:forKey:", v39, CFSTR("statusCodeInfo"));

    v37 = *(_WORD *)(a1 + 104);
  }
  if ((v37 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 72));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v40, CFSTR("turnaroundTime"));

  }
  objc_msgSend((id)a1, "nearbySectionHeader");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  if (v41)
  {
    if (a2)
      v42 = CFSTR("nearbySectionHeader");
    else
      v42 = CFSTR("nearby_section_header");
    objc_msgSend(v4, "setObject:forKey:", v41, v42);
  }

  if ((*(_WORD *)(a1 + 104) & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 100));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v44 = CFSTR("isChainResultSet");
    else
      v44 = CFSTR("is_chain_result_set");
    objc_msgSend(v4, "setObject:forKey:", v43, v44);

  }
  v45 = *(void **)(a1 + 16);
  if (v45)
  {
    objc_msgSend(v45, "dictionaryRepresentation");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = v46;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v46, "count"));
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v52[0] = MEMORY[0x1E0C809B0];
      v52[1] = 3221225472;
      v52[2] = __52__GEOPlaceSearchResponse__dictionaryRepresentation___block_invoke;
      v52[3] = &unk_1E1C00600;
      v49 = v48;
      v53 = v49;
      objc_msgSend(v47, "enumerateKeysAndObjectsUsingBlock:", v52);
      v50 = v49;

      v47 = v50;
    }
    objc_msgSend(v4, "setObject:forKey:", v47, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPlaceSearchResponse _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __52__GEOPlaceSearchResponse__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOPlaceSearchResponse)initWithDictionary:(id)a3
{
  return (GEOPlaceSearchResponse *)-[GEOPlaceSearchResponse _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  GEOPlaceResult *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  GEOMapRegion *v17;
  uint64_t v18;
  void *v19;
  const __CFString *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  GEOSuggestionEntryList *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  GEOSuggestionEntry *v28;
  uint64_t v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t j;
  void *v35;
  void *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t k;
  void *v41;
  id v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  unsigned int v48;
  void *v49;
  id v50;
  unint64_t *v51;
  void *v52;
  void *v53;
  id v54;
  void *v55;
  GEOLatLng *v56;
  GEOLatLng *v57;
  GEOLatLng *v58;
  GEOLatLng *v59;
  void *v60;
  void *v61;
  id v62;
  void *v63;
  void *v64;
  id v65;
  void *v66;
  void *v67;
  id v68;
  void *v69;
  id v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t m;
  uint64_t v74;
  GEONamedFeature *v75;
  GEONamedFeature *v76;
  GEONamedFeature *v77;
  uint64_t v78;
  void *v79;
  void *v80;
  id v81;
  void *v82;
  char v83;
  void *v84;
  id v85;
  int v86;
  uint64_t v87;
  void *v88;
  void *v89;
  void *v90;
  id v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t n;
  uint64_t v95;
  GEONamedFeature *v96;
  uint64_t v97;
  void *v98;
  void *v99;
  id v100;
  uint64_t v101;
  void *v102;
  const __CFString *v103;
  void *v104;
  void *v105;
  const __CFString *v106;
  void *v107;
  const __CFString *v109;
  void *v110;
  id obj;
  void *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  id v116;
  id v117;
  id v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  void *v122;
  void *v123;
  uint64_t v124;
  id v125;
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
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  _BYTE v155[128];
  _BYTE v156[128];
  _BYTE v157[128];
  _BYTE v158[128];
  _BYTE v159[128];
  _BYTE v160[128];
  _BYTE v161[128];
  uint64_t v162;

  v162 = *MEMORY[0x1E0C80C00];
  v117 = a2;
  if (!a1 || (v123 = (void *)objc_msgSend(a1, "init")) == 0)
  {
    v123 = 0;
    goto LABEL_206;
  }
  objc_msgSend(v117, "objectForKeyedSubscript:", CFSTR("status"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("STATUS_SUCCESS")) & 1) != 0)
    {
      v6 = 0;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("STATUS_FAILED")) & 1) != 0)
    {
      v6 = 1;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("STATUS_INCOMPLETE")) & 1) != 0)
    {
      v6 = 2;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("INVALID_REQUEST")) & 1) != 0)
    {
      v6 = 5;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("FAILED_NO_RESULT")) & 1) != 0)
    {
      v6 = 20;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("NEEDS_REFINEMENT")) & 1) != 0)
    {
      v6 = 30;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("FAILED_NOT_AUTHORIZED")) & 1) != 0)
    {
      v6 = 40;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("STATUS_DEDUPED")) & 1) != 0)
    {
      v6 = 50;
    }
    else if (objc_msgSend(v5, "isEqualToString:", CFSTR("VERSION_MISMATCH")))
    {
      v6 = 60;
    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_28;
    v6 = objc_msgSend(v4, "intValue");
  }
  objc_msgSend(v123, "setStatus:", v6);
LABEL_28:

  objc_msgSend(v117, "objectForKeyedSubscript:", CFSTR("placeResult"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v137 = 0u;
    v138 = 0u;
    v135 = 0u;
    v136 = 0u;
    v8 = v7;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v135, v157, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v136;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v136 != v10)
            objc_enumerationMutation(v8);
          v12 = *(_QWORD *)(*((_QWORD *)&v135 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v13 = [GEOPlaceResult alloc];
            if ((a3 & 1) != 0)
              v14 = -[GEOPlaceResult initWithJSON:](v13, "initWithJSON:", v12);
            else
              v14 = -[GEOPlaceResult initWithDictionary:](v13, "initWithDictionary:", v12);
            v15 = (void *)v14;
            objc_msgSend(v123, "addPlaceResult:", v14);

          }
        }
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v135, v157, 16);
      }
      while (v9);
    }

  }
  objc_msgSend(v117, "objectForKeyedSubscript:", CFSTR("mapRegion"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v17 = [GEOMapRegion alloc];
    if ((a3 & 1) != 0)
      v18 = -[GEOMapRegion initWithJSON:](v17, "initWithJSON:", v16);
    else
      v18 = -[GEOMapRegion initWithDictionary:](v17, "initWithDictionary:", v16);
    v19 = (void *)v18;
    objc_msgSend(v123, "setMapRegion:", v18);

  }
  objc_msgSend(v117, "objectForKeyedSubscript:", CFSTR("suggestionEntryLists"));
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v133 = 0u;
    v134 = 0u;
    v131 = 0u;
    v132 = 0u;
    obj = v110;
    v114 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v131, v156, 16);
    if (!v114)
      goto LABEL_162;
    v20 = CFSTR("content_type");
    v113 = *(_QWORD *)v132;
    if (a3)
      v20 = CFSTR("contentType");
    v109 = v20;
    while (1)
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v132 != v113)
        {
          v22 = v21;
          objc_enumerationMutation(obj);
          v21 = v22;
        }
        v115 = v21;
        v23 = *(void **)(*((_QWORD *)&v131 + 1) + 8 * v21);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v24 = [GEOSuggestionEntryList alloc];
          if (v24)
          {
            v116 = v23;
            v119 = -[GEOSuggestionEntryList init](v24, "init");
            if (v119)
            {
              objc_msgSend(v116, "objectForKeyedSubscript:", CFSTR("suggestionEntries"));
              v112 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v141 = 0u;
                v142 = 0u;
                v139 = 0u;
                v140 = 0u;
                v118 = v112;
                v121 = objc_msgSend(v118, "countByEnumeratingWithState:objects:count:", &v139, v158, 16);
                if (v121)
                {
                  v120 = *(_QWORD *)v140;
                  do
                  {
                    v25 = 0;
                    do
                    {
                      if (*(_QWORD *)v140 != v120)
                      {
                        v26 = v25;
                        objc_enumerationMutation(v118);
                        v25 = v26;
                      }
                      v124 = v25;
                      v27 = *(void **)(*((_QWORD *)&v139 + 1) + 8 * v25);
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        v28 = [GEOSuggestionEntry alloc];
                        if (v28)
                        {
                          v125 = v27;
                          v29 = -[GEOSuggestionEntry init](v28, "init");
                          if (v29)
                          {
                            objc_msgSend(v125, "objectForKeyedSubscript:", CFSTR("displayLine"));
                            v30 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_opt_class();
                            if ((objc_opt_isKindOfClass() & 1) != 0)
                            {
                              v153 = 0u;
                              v154 = 0u;
                              v151 = 0u;
                              v152 = 0u;
                              v31 = v30;
                              v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v151, v161, 16);
                              if (v32)
                              {
                                v33 = *(_QWORD *)v152;
                                do
                                {
                                  for (j = 0; j != v32; ++j)
                                  {
                                    if (*(_QWORD *)v152 != v33)
                                      objc_enumerationMutation(v31);
                                    v35 = *(void **)(*((_QWORD *)&v151 + 1) + 8 * j);
                                    objc_opt_class();
                                    if ((objc_opt_isKindOfClass() & 1) != 0)
                                    {
                                      v36 = (void *)objc_msgSend(v35, "copy");
                                      -[GEOSuggestionEntry addDisplayLine:](v29, v36);

                                    }
                                  }
                                  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v151, v161, 16);
                                }
                                while (v32);
                              }

                            }
                            objc_msgSend(v125, "objectForKeyedSubscript:", CFSTR("textHighlights"));
                            v122 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_opt_class();
                            if ((objc_opt_isKindOfClass() & 1) != 0)
                            {
                              v149 = 0u;
                              v150 = 0u;
                              v147 = 0u;
                              v148 = 0u;
                              v37 = v122;
                              v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v147, v160, 16);
                              if (v38)
                              {
                                v39 = *(_QWORD *)v148;
                                do
                                {
                                  for (k = 0; k != v38; ++k)
                                  {
                                    if (*(_QWORD *)v148 != v39)
                                      objc_enumerationMutation(v37);
                                    v41 = *(void **)(*((_QWORD *)&v147 + 1) + 8 * k);
                                    objc_opt_class();
                                    if ((objc_opt_isKindOfClass() & 1) != 0)
                                    {
                                      v42 = v41;
                                      objc_msgSend(v42, "objectForKeyedSubscript:", CFSTR("lineNumber"));
                                      v43 = (void *)objc_claimAutoreleasedReturnValue();
                                      objc_opt_class();
                                      if ((objc_opt_isKindOfClass() & 1) != 0)
                                      {
                                        v44 = objc_msgSend(v43, "unsignedIntValue");
                                        v45 = 0x200000000;
                                      }
                                      else
                                      {
                                        v44 = 0;
                                        v45 = 0;
                                      }

                                      objc_msgSend(v42, "objectForKeyedSubscript:", CFSTR("startIndex"));
                                      v46 = (void *)objc_claimAutoreleasedReturnValue();
                                      objc_opt_class();
                                      if ((objc_opt_isKindOfClass() & 1) != 0)
                                        v45 |= objc_msgSend(v46, "unsignedIntValue") | 0x400000000;

                                      objc_msgSend(v42, "objectForKeyedSubscript:", CFSTR("length"));
                                      v47 = (void *)objc_claimAutoreleasedReturnValue();
                                      objc_opt_class();
                                      if ((objc_opt_isKindOfClass() & 1) != 0)
                                      {
                                        v48 = objc_msgSend(v47, "unsignedIntValue");
                                        v45 |= 0x100000000uLL;
                                      }
                                      else
                                      {
                                        v48 = 0;
                                      }

                                      os_unfair_lock_lock((os_unfair_lock_t)(v29 + 112));
                                      if ((*(_WORD *)(v29 + 116) & 2) == 0)
                                      {
                                        v49 = *(void **)(v29 + 8);
                                        if (v49)
                                        {
                                          v50 = v49;
                                          objc_sync_enter(v50);
                                          GEOSuggestionEntryReadSpecified(v29, *(_QWORD *)(v29 + 8), (int *)&_readTextHighlights_tags);
                                          objc_sync_exit(v50);

                                        }
                                      }
                                      os_unfair_lock_unlock((os_unfair_lock_t)(v29 + 112));
                                      if (-[GEOSuggestionEntry _reserveTextHighlights:](v29, 1uLL))
                                      {
                                        v51 = (unint64_t *)(*(_QWORD *)(v29 + 24) + 16 * *(_QWORD *)(v29 + 32));
                                        *v51 = v48 | (unint64_t)(v44 << 32);
                                        v51[1] = v45;
                                        ++*(_QWORD *)(v29 + 32);
                                      }
                                      os_unfair_lock_lock_with_options();
                                      *(_WORD *)(v29 + 116) |= 2u;
                                      os_unfair_lock_unlock((os_unfair_lock_t)(v29 + 112));
                                      *(_WORD *)(v29 + 116) |= 0x200u;
                                    }
                                  }
                                  v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v147, v160, 16);
                                }
                                while (v38);
                              }

                            }
                            objc_msgSend(v125, "objectForKeyedSubscript:", CFSTR("iconID"));
                            v52 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_opt_class();
                            if ((objc_opt_isKindOfClass() & 1) != 0)
                            {
                              v53 = (void *)objc_msgSend(v52, "copy");
                              v54 = v53;
                              *(_WORD *)(v29 + 116) |= 0x10u;
                              *(_WORD *)(v29 + 116) |= 0x200u;
                              objc_storeStrong((id *)(v29 + 64), v53);

                            }
                            objc_msgSend(v125, "objectForKeyedSubscript:", CFSTR("latlng"));
                            v55 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_opt_class();
                            if ((objc_opt_isKindOfClass() & 1) != 0)
                            {
                              v56 = [GEOLatLng alloc];
                              if ((a3 & 1) != 0)
                                v57 = -[GEOLatLng initWithJSON:](v56, "initWithJSON:", v55);
                              else
                                v57 = -[GEOLatLng initWithDictionary:](v56, "initWithDictionary:", v55);
                              v58 = v57;
                              v59 = v57;
                              *(_WORD *)(v29 + 116) |= 0x20u;
                              *(_WORD *)(v29 + 116) |= 0x200u;
                              objc_storeStrong((id *)(v29 + 72), v58);

                            }
                            objc_msgSend(v125, "objectForKeyedSubscript:", CFSTR("suggestionEntryMetadata"));
                            v60 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_opt_class();
                            if ((objc_opt_isKindOfClass() & 1) != 0)
                            {
                              v61 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v60, 0);
                              v62 = v61;
                              *(_WORD *)(v29 + 116) |= 0x100u;
                              *(_WORD *)(v29 + 116) |= 0x200u;
                              objc_storeStrong((id *)(v29 + 96), v61);

                            }
                            objc_msgSend(v125, "objectForKeyedSubscript:", CFSTR("searchQueryDisplayString"));
                            v63 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_opt_class();
                            if ((objc_opt_isKindOfClass() & 1) != 0)
                            {
                              v64 = (void *)objc_msgSend(v63, "copy");
                              v65 = v64;
                              *(_WORD *)(v29 + 116) |= 0x80u;
                              *(_WORD *)(v29 + 116) |= 0x200u;
                              objc_storeStrong((id *)(v29 + 88), v64);

                            }
                            objc_msgSend(v125, "objectForKeyedSubscript:", CFSTR("calloutTitle"));
                            v66 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_opt_class();
                            if ((objc_opt_isKindOfClass() & 1) != 0)
                            {
                              v67 = (void *)objc_msgSend(v66, "copy");
                              v68 = v67;
                              *(_WORD *)(v29 + 116) |= 4u;
                              *(_WORD *)(v29 + 116) |= 0x200u;
                              objc_storeStrong((id *)(v29 + 48), v67);

                            }
                            objc_msgSend(v125, "objectForKeyedSubscript:", CFSTR("namedFeature"));
                            v69 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_opt_class();
                            if ((objc_opt_isKindOfClass() & 1) != 0)
                            {
                              v145 = 0u;
                              v146 = 0u;
                              v143 = 0u;
                              v144 = 0u;
                              v70 = v69;
                              v71 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v143, v159, 16);
                              if (v71)
                              {
                                v72 = *(_QWORD *)v144;
                                do
                                {
                                  for (m = 0; m != v71; ++m)
                                  {
                                    if (*(_QWORD *)v144 != v72)
                                      objc_enumerationMutation(v70);
                                    v74 = *(_QWORD *)(*((_QWORD *)&v143 + 1) + 8 * m);
                                    objc_opt_class();
                                    if ((objc_opt_isKindOfClass() & 1) != 0)
                                    {
                                      v75 = [GEONamedFeature alloc];
                                      if ((a3 & 1) != 0)
                                        v76 = -[GEONamedFeature initWithJSON:](v75, "initWithJSON:", v74);
                                      else
                                        v76 = -[GEONamedFeature initWithDictionary:](v75, "initWithDictionary:", v74);
                                      v77 = v76;
                                      -[GEOSuggestionEntry addNamedFeature:](v29, v76);

                                    }
                                  }
                                  v71 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v143, v159, 16);
                                }
                                while (v71);
                              }

                            }
                          }

                        }
                        else
                        {
                          v29 = 0;
                        }
                        -[GEOSuggestionEntryList addSuggestionEntries:](v119, (void *)v29);

                      }
                      v25 = v124 + 1;
                    }
                    while (v124 + 1 != v121);
                    v78 = objc_msgSend(v118, "countByEnumeratingWithState:objects:count:", &v139, v158, 16);
                    v121 = v78;
                  }
                  while (v78);
                }

              }
              objc_msgSend(v116, "objectForKeyedSubscript:", CFSTR("localizedSectionHeader"));
              v79 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v80 = (void *)objc_msgSend(v79, "copy");
                v81 = v80;
                *(_BYTE *)(v119 + 60) |= 8u;
                *(_BYTE *)(v119 + 60) |= 0x20u;
                objc_storeStrong((id *)(v119 + 24), v80);

              }
              objc_msgSend(v116, "objectForKeyedSubscript:", CFSTR("showSectionHeader"));
              v82 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v83 = objc_msgSend(v82, "BOOLValue");
                *(_BYTE *)(v119 + 60) |= 0x20u;
                *(_BYTE *)(v119 + 60) |= 2u;
                *(_BYTE *)(v119 + 56) = v83;
              }

              objc_msgSend(v116, "objectForKeyedSubscript:", v109);
              v84 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v85 = v84;
                if ((objc_msgSend(v85, "isEqualToString:", CFSTR("AUTOCOMPLETE_SECTION_CONTENT_TYPE_UNKNOWN")) & 1) != 0)
                {
                  v86 = 0;
                }
                else if ((objc_msgSend(v85, "isEqualToString:", CFSTR("AUTOCOMPLETE_SECTION_CONTENT_TYPE_PRIMARY")) & 1) != 0)
                {
                  v86 = 1;
                }
                else if ((objc_msgSend(v85, "isEqualToString:", CFSTR("AUTOCOMPLETE_SECTION_CONTENT_TYPE_RELATED_RESULTS")) & 1) != 0)
                {
                  v86 = 2;
                }
                else if (objc_msgSend(v85, "isEqualToString:", CFSTR("AUTOCOMPLETE_SECTION_CONTENT_TYPE_PARTIAL_MATCHES")))
                {
                  v86 = 3;
                }
                else
                {
                  v86 = 0;
                }

LABEL_154:
                *(_BYTE *)(v119 + 60) |= 0x20u;
                *(_BYTE *)(v119 + 60) |= 1u;
                *(_DWORD *)(v119 + 52) = v86;
              }
              else
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v86 = objc_msgSend(v84, "intValue");
                  goto LABEL_154;
                }
              }

            }
            objc_msgSend(v123, "addSuggestionEntryLists:", v119, v109);
          }
          else
          {
            v119 = 0;
            objc_msgSend(v123, "addSuggestionEntryLists:", 0, v109);
          }

        }
        v21 = v115 + 1;
      }
      while (v115 + 1 != v114);
      v87 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v131, v156, 16);
      v114 = v87;
      if (!v87)
      {
LABEL_162:

        break;
      }
    }
  }

  objc_msgSend(v117, "objectForKeyedSubscript:", CFSTR("suggestionMetadata"));
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v89 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v88, 0);
    objc_msgSend(v123, "setSuggestionMetadata:", v89);

  }
  objc_msgSend(v117, "objectForKeyedSubscript:", CFSTR("namedFeatures"));
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v129 = 0u;
    v130 = 0u;
    v127 = 0u;
    v128 = 0u;
    v91 = v90;
    v92 = objc_msgSend(v91, "countByEnumeratingWithState:objects:count:", &v127, v155, 16);
    if (v92)
    {
      v93 = *(_QWORD *)v128;
      do
      {
        for (n = 0; n != v92; ++n)
        {
          if (*(_QWORD *)v128 != v93)
            objc_enumerationMutation(v91);
          v95 = *(_QWORD *)(*((_QWORD *)&v127 + 1) + 8 * n);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v96 = [GEONamedFeature alloc];
            if ((a3 & 1) != 0)
              v97 = -[GEONamedFeature initWithJSON:](v96, "initWithJSON:", v95);
            else
              v97 = -[GEONamedFeature initWithDictionary:](v96, "initWithDictionary:", v95);
            v98 = (void *)v97;
            objc_msgSend(v123, "addNamedFeatures:", v97, v109);

          }
        }
        v92 = objc_msgSend(v91, "countByEnumeratingWithState:objects:count:", &v127, v155, 16);
      }
      while (v92);
    }

  }
  objc_msgSend(v117, "objectForKeyedSubscript:", CFSTR("statusCodeInfo"));
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v100 = v99;
    if ((objc_msgSend(v100, "isEqualToString:", CFSTR("TIMEOUT")) & 1) != 0)
    {
      v101 = 1;
    }
    else if ((objc_msgSend(v100, "isEqualToString:", CFSTR("INCOMPLETE_MATCH")) & 1) != 0)
    {
      v101 = 2;
    }
    else if ((objc_msgSend(v100, "isEqualToString:", CFSTR("LOW_CONFIDENCE")) & 1) != 0)
    {
      v101 = 3;
    }
    else if (objc_msgSend(v100, "isEqualToString:", CFSTR("AMBIGUOUS")))
    {
      v101 = 4;
    }
    else
    {
      v101 = 1;
    }

    goto LABEL_192;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v101 = objc_msgSend(v99, "intValue");
LABEL_192:
    objc_msgSend(v123, "setStatusCodeInfo:", v101, v109);
  }

  objc_msgSend(v117, "objectForKeyedSubscript:", CFSTR("turnaroundTime"));
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v102, "doubleValue");
    objc_msgSend(v123, "setTurnaroundTime:");
  }

  if (a3)
    v103 = CFSTR("nearbySectionHeader");
  else
    v103 = CFSTR("nearby_section_header");
  objc_msgSend(v117, "objectForKeyedSubscript:", v103, v109);
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v105 = (void *)objc_msgSend(v104, "copy");
    objc_msgSend(v123, "setNearbySectionHeader:", v105);

  }
  if (a3)
    v106 = CFSTR("isChainResultSet");
  else
    v106 = CFSTR("is_chain_result_set");
  objc_msgSend(v117, "objectForKeyedSubscript:", v106);
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v123, "setIsChainResultSet:", objc_msgSend(v107, "BOOLValue"));

LABEL_206:
  return v123;
}

- (GEOPlaceSearchResponse)initWithJSON:(id)a3
{
  return (GEOPlaceSearchResponse *)-[GEOPlaceSearchResponse _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_2543;
    else
      v8 = (int *)&readAll__nonRecursiveTag_2544;
    GEOPlaceSearchResponseReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEOPlaceSearchResponseCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPlaceSearchResponseIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPlaceSearchResponseReadAllFrom((uint64_t)self, a3, 0);
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
  __int16 flags;
  PBDataReader *v19;
  void *v20;
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
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPlaceSearchResponseIsDirty((uint64_t)self) & 1) == 0)
  {
    v19 = self->_reader;
    objc_sync_enter(v19);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v20);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v19);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPlaceSearchResponse readAll:](self, "readAll:", 0);
    PBDataWriterWriteInt32Field();
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v6 = self->_placeResults;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v30;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v30 != v8)
            objc_enumerationMutation(v6);
          PBDataWriterWriteSubmessage();
          ++v9;
        }
        while (v7 != v9);
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
      }
      while (v7);
    }

    if (self->_mapRegion)
      PBDataWriterWriteSubmessage();
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v10 = self->_suggestionEntryLists;
    v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
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
          PBDataWriterWriteSubmessage();
          ++v13;
        }
        while (v11 != v13);
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
      }
      while (v11);
    }

    if (self->_suggestionMetadata)
      PBDataWriterWriteDataField();
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v14 = self->_namedFeatures;
    v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v22;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v22 != v16)
            objc_enumerationMutation(v14);
          PBDataWriterWriteSubmessage();
          ++v17;
        }
        while (v15 != v17);
        v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
      }
      while (v15);
    }

    flags = (__int16)self->_flags;
    if ((flags & 2) != 0)
    {
      PBDataWriterWriteInt32Field();
      flags = (__int16)self->_flags;
    }
    if ((flags & 1) != 0)
      PBDataWriterWriteDoubleField();
    if (self->_nearbySectionHeader)
      PBDataWriterWriteStringField();
    if ((*(_WORD *)&self->_flags & 4) != 0)
      PBDataWriterWriteBOOLField();
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v21);
  }

}

- (void)clearSensitiveFields:(unint64_t)a3
{
  GEOPlaceSearchResponseClearSensitiveFields((uint64_t)self, a3, 1);
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;
  BOOL v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int *v14;
  uint64_t j;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t k;
  uint64_t v22;
  uint64_t v24;
  __int128 v25;
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
  _BYTE v37[128];
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v3 = a3;
  v40 = *MEMORY[0x1E0C80C00];
  -[GEOPlaceSearchResponse _readMapRegion]((uint64_t)self);
  if (-[GEOMapRegion hasGreenTeaWithValue:](self->_mapRegion, "hasGreenTeaWithValue:", v3))
    return 1;
  -[GEOPlaceSearchResponse _readPlaceResults]((uint64_t)self);
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v6 = self->_placeResults;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v30;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v30 != v9)
          objc_enumerationMutation(v6);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * i), "hasGreenTeaWithValue:", v3) & 1) != 0)
        {
LABEL_31:
          v5 = 1;
          goto LABEL_32;
        }
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
      if (v8)
        continue;
      break;
    }
  }

  -[GEOPlaceSearchResponse _readSuggestionEntryLists]((uint64_t)self);
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v6 = self->_suggestionEntryLists;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v26;
    v14 = &OBJC_IVAR___GEORPMerchantLookupContext__readerMarkLength;
    v24 = *(_QWORD *)v26;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v26 != v13)
          objc_enumerationMutation(v6);
        v16 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * j);
        if (v16)
        {
          -[GEOSuggestionEntryList _readSuggestionEntries](*(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * j));
          v35 = 0u;
          v36 = 0u;
          v33 = 0u;
          v34 = 0u;
          v17 = *(id *)(v16 + v14[670]);
          v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
          if (v18)
          {
            v19 = v18;
            v20 = *(_QWORD *)v34;
            while (2)
            {
              for (k = 0; k != v19; ++k)
              {
                if (*(_QWORD *)v34 != v20)
                  objc_enumerationMutation(v17);
                v22 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * k);
                if (v22)
                {
                  -[GEOSuggestionEntry _readLatlng](*(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * k));
                  if ((objc_msgSend(*(id *)(v22 + 72), "hasGreenTeaWithValue:", v3) & 1) != 0)
                  {

                    goto LABEL_31;
                  }
                }
              }
              v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
              if (v19)
                continue;
              break;
            }
          }

        }
        v13 = v24;
        v14 = &OBJC_IVAR___GEORPMerchantLookupContext__readerMarkLength;
      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
    }
    while (v12);
  }
  v5 = 0;
LABEL_32:

  return v5;
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
  unint64_t v12;
  unint64_t v13;
  uint64_t k;
  void *v15;
  __int16 flags;
  id *v17;
  id *v18;

  v18 = (id *)a3;
  -[GEOPlaceSearchResponse readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v18 + 1, self->_reader);
  *((_DWORD *)v18 + 20) = self->_readerMarkPos;
  *((_DWORD *)v18 + 21) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  *((_DWORD *)v18 + 24) = self->_status;
  if (-[GEOPlaceSearchResponse placeResultsCount](self, "placeResultsCount"))
  {
    objc_msgSend(v18, "clearPlaceResults");
    v4 = -[GEOPlaceSearchResponse placeResultsCount](self, "placeResultsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[GEOPlaceSearchResponse placeResultAtIndex:](self, "placeResultAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "addPlaceResult:", v7);

      }
    }
  }
  if (self->_mapRegion)
    objc_msgSend(v18, "setMapRegion:");
  if (-[GEOPlaceSearchResponse suggestionEntryListsCount](self, "suggestionEntryListsCount"))
  {
    objc_msgSend(v18, "clearSuggestionEntryLists");
    v8 = -[GEOPlaceSearchResponse suggestionEntryListsCount](self, "suggestionEntryListsCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
      {
        -[GEOPlaceSearchResponse suggestionEntryListsAtIndex:](self, "suggestionEntryListsAtIndex:", j);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "addSuggestionEntryLists:", v11);

      }
    }
  }
  if (self->_suggestionMetadata)
    objc_msgSend(v18, "setSuggestionMetadata:");
  if (-[GEOPlaceSearchResponse namedFeaturesCount](self, "namedFeaturesCount"))
  {
    objc_msgSend(v18, "clearNamedFeatures");
    v12 = -[GEOPlaceSearchResponse namedFeaturesCount](self, "namedFeaturesCount");
    if (v12)
    {
      v13 = v12;
      for (k = 0; k != v13; ++k)
      {
        -[GEOPlaceSearchResponse namedFeaturesAtIndex:](self, "namedFeaturesAtIndex:", k);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "addNamedFeatures:", v15);

      }
    }
  }
  flags = (__int16)self->_flags;
  v17 = v18;
  if ((flags & 2) != 0)
  {
    *((_DWORD *)v18 + 23) = self->_statusCodeInfo;
    *((_WORD *)v18 + 52) |= 2u;
    flags = (__int16)self->_flags;
  }
  if ((flags & 1) != 0)
  {
    v18[9] = *(id *)&self->_turnaroundTime;
    *((_WORD *)v18 + 52) |= 1u;
  }
  if (self->_nearbySectionHeader)
  {
    objc_msgSend(v18, "setNearbySectionHeader:");
    v17 = v18;
  }
  if ((*(_WORD *)&self->_flags & 4) != 0)
  {
    *((_BYTE *)v17 + 100) = self->_isChainResultSet;
    *((_WORD *)v17 + 52) |= 4u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  id v14;
  void *v15;
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  uint64_t v21;
  void *v22;
  NSMutableArray *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t k;
  void *v27;
  __int16 flags;
  uint64_t v29;
  void *v30;
  PBUnknownFields *v31;
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
  _BYTE v45[128];
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x400) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOPlaceSearchResponseReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_33;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPlaceSearchResponse readAll:](self, "readAll:", 0);
  *(_DWORD *)(v5 + 96) = self->_status;
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v9 = self->_placeResults;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v42 != v11)
          objc_enumerationMutation(v9);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addPlaceResult:", v13);

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
    }
    while (v10);
  }

  v14 = -[GEOMapRegion copyWithZone:](self->_mapRegion, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v14;

  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v16 = self->_suggestionEntryLists;
  v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
  if (v17)
  {
    v18 = *(_QWORD *)v38;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v38 != v18)
          objc_enumerationMutation(v16);
        v20 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * j), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addSuggestionEntryLists:", v20);

      }
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
    }
    while (v17);
  }

  v21 = -[NSData copyWithZone:](self->_suggestionMetadata, "copyWithZone:", a3);
  v22 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v21;

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v23 = self->_namedFeatures;
  v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
  if (v24)
  {
    v25 = *(_QWORD *)v34;
    do
    {
      for (k = 0; k != v24; ++k)
      {
        if (*(_QWORD *)v34 != v25)
          objc_enumerationMutation(v23);
        v27 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * k), "copyWithZone:", a3, (_QWORD)v33);
        objc_msgSend((id)v5, "addNamedFeatures:", v27);

      }
      v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
    }
    while (v24);
  }

  flags = (__int16)self->_flags;
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 92) = self->_statusCodeInfo;
    *(_WORD *)(v5 + 104) |= 2u;
    flags = (__int16)self->_flags;
  }
  if ((flags & 1) != 0)
  {
    *(double *)(v5 + 72) = self->_turnaroundTime;
    *(_WORD *)(v5 + 104) |= 1u;
  }
  v29 = -[NSString copyWithZone:](self->_nearbySectionHeader, "copyWithZone:", a3, (_QWORD)v33);
  v30 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v29;

  if ((*(_WORD *)&self->_flags & 4) != 0)
  {
    *(_BYTE *)(v5 + 100) = self->_isChainResultSet;
    *(_WORD *)(v5 + 104) |= 4u;
  }
  v31 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v31;
LABEL_33:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSMutableArray *placeResults;
  GEOMapRegion *mapRegion;
  NSMutableArray *suggestionEntryLists;
  NSData *suggestionMetadata;
  NSMutableArray *namedFeatures;
  __int16 flags;
  __int16 v11;
  NSString *nearbySectionHeader;
  BOOL v13;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_28;
  -[GEOPlaceSearchResponse readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if (self->_status != *((_DWORD *)v4 + 24))
    goto LABEL_28;
  placeResults = self->_placeResults;
  if ((unint64_t)placeResults | *((_QWORD *)v4 + 6))
  {
    if (!-[NSMutableArray isEqual:](placeResults, "isEqual:"))
      goto LABEL_28;
  }
  mapRegion = self->_mapRegion;
  if ((unint64_t)mapRegion | *((_QWORD *)v4 + 3))
  {
    if (!-[GEOMapRegion isEqual:](mapRegion, "isEqual:"))
      goto LABEL_28;
  }
  suggestionEntryLists = self->_suggestionEntryLists;
  if ((unint64_t)suggestionEntryLists | *((_QWORD *)v4 + 7))
  {
    if (!-[NSMutableArray isEqual:](suggestionEntryLists, "isEqual:"))
      goto LABEL_28;
  }
  suggestionMetadata = self->_suggestionMetadata;
  if ((unint64_t)suggestionMetadata | *((_QWORD *)v4 + 8))
  {
    if (!-[NSData isEqual:](suggestionMetadata, "isEqual:"))
      goto LABEL_28;
  }
  namedFeatures = self->_namedFeatures;
  if ((unint64_t)namedFeatures | *((_QWORD *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](namedFeatures, "isEqual:"))
      goto LABEL_28;
  }
  flags = (__int16)self->_flags;
  v11 = *((_WORD *)v4 + 52);
  if ((flags & 2) != 0)
  {
    if ((v11 & 2) == 0 || self->_statusCodeInfo != *((_DWORD *)v4 + 23))
      goto LABEL_28;
  }
  else if ((v11 & 2) != 0)
  {
    goto LABEL_28;
  }
  if ((flags & 1) != 0)
  {
    if ((v11 & 1) == 0 || self->_turnaroundTime != *((double *)v4 + 9))
      goto LABEL_28;
  }
  else if ((v11 & 1) != 0)
  {
    goto LABEL_28;
  }
  nearbySectionHeader = self->_nearbySectionHeader;
  if ((unint64_t)nearbySectionHeader | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](nearbySectionHeader, "isEqual:"))
      goto LABEL_28;
    flags = (__int16)self->_flags;
    v11 = *((_WORD *)v4 + 52);
  }
  v13 = (v11 & 4) == 0;
  if ((flags & 4) != 0)
  {
    if ((v11 & 4) != 0)
    {
      if (self->_isChainResultSet)
      {
        if (!*((_BYTE *)v4 + 100))
          goto LABEL_28;
      }
      else if (*((_BYTE *)v4 + 100))
      {
        goto LABEL_28;
      }
      v13 = 1;
      goto LABEL_29;
    }
LABEL_28:
    v13 = 0;
  }
LABEL_29:

  return v13;
}

- (unint64_t)hash
{
  uint64_t status;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int16 flags;
  uint64_t v10;
  double turnaroundTime;
  double v12;
  long double v13;
  double v14;
  unint64_t v15;
  NSUInteger v16;
  uint64_t v17;

  -[GEOPlaceSearchResponse readAll:](self, "readAll:", 1);
  status = self->_status;
  v4 = -[NSMutableArray hash](self->_placeResults, "hash");
  v5 = -[GEOMapRegion hash](self->_mapRegion, "hash");
  v6 = -[NSMutableArray hash](self->_suggestionEntryLists, "hash");
  v7 = -[NSData hash](self->_suggestionMetadata, "hash");
  v8 = -[NSMutableArray hash](self->_namedFeatures, "hash");
  flags = (__int16)self->_flags;
  if ((flags & 2) != 0)
  {
    v10 = 2654435761 * self->_statusCodeInfo;
    if ((flags & 1) != 0)
      goto LABEL_3;
LABEL_8:
    v15 = 0;
    goto LABEL_11;
  }
  v10 = 0;
  if ((flags & 1) == 0)
    goto LABEL_8;
LABEL_3:
  turnaroundTime = self->_turnaroundTime;
  v12 = -turnaroundTime;
  if (turnaroundTime >= 0.0)
    v12 = self->_turnaroundTime;
  v13 = floor(v12 + 0.5);
  v14 = (v12 - v13) * 1.84467441e19;
  v15 = 2654435761u * (unint64_t)fmod(v13, 1.84467441e19);
  if (v14 >= 0.0)
  {
    if (v14 > 0.0)
      v15 += (unint64_t)v14;
  }
  else
  {
    v15 -= (unint64_t)fabs(v14);
  }
LABEL_11:
  v16 = -[NSString hash](self->_nearbySectionHeader, "hash");
  if ((*(_WORD *)&self->_flags & 4) != 0)
    v17 = 2654435761 * self->_isChainResultSet;
  else
    v17 = 0;
  return v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ (2654435761 * status) ^ v10 ^ v15 ^ v16 ^ v17;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  GEOMapRegion *mapRegion;
  uint64_t v11;
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
  __int16 v22;
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
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  self->_status = *((_DWORD *)v4 + 24);
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v5 = *((id *)v4 + 6);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v32 != v8)
          objc_enumerationMutation(v5);
        -[GEOPlaceSearchResponse addPlaceResult:](self, "addPlaceResult:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
    }
    while (v7);
  }

  mapRegion = self->_mapRegion;
  v11 = *((_QWORD *)v4 + 3);
  if (mapRegion)
  {
    if (v11)
      -[GEOMapRegion mergeFrom:](mapRegion, "mergeFrom:");
  }
  else if (v11)
  {
    -[GEOPlaceSearchResponse setMapRegion:](self, "setMapRegion:");
  }
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v12 = *((id *)v4 + 7);
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v28;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v28 != v15)
          objc_enumerationMutation(v12);
        -[GEOPlaceSearchResponse addSuggestionEntryLists:](self, "addSuggestionEntryLists:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * j));
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
    }
    while (v14);
  }

  if (*((_QWORD *)v4 + 8))
    -[GEOPlaceSearchResponse setSuggestionMetadata:](self, "setSuggestionMetadata:");
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v17 = *((id *)v4 + 4);
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v23, v35, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v24;
    do
    {
      for (k = 0; k != v19; ++k)
      {
        if (*(_QWORD *)v24 != v20)
          objc_enumerationMutation(v17);
        -[GEOPlaceSearchResponse addNamedFeatures:](self, "addNamedFeatures:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * k), (_QWORD)v23);
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v23, v35, 16);
    }
    while (v19);
  }

  v22 = *((_WORD *)v4 + 52);
  if ((v22 & 2) != 0)
  {
    self->_statusCodeInfo = *((_DWORD *)v4 + 23);
    *(_WORD *)&self->_flags |= 2u;
    v22 = *((_WORD *)v4 + 52);
  }
  if ((v22 & 1) != 0)
  {
    self->_turnaroundTime = *((double *)v4 + 9);
    *(_WORD *)&self->_flags |= 1u;
  }
  if (*((_QWORD *)v4 + 5))
    -[GEOPlaceSearchResponse setNearbySectionHeader:](self, "setNearbySectionHeader:");
  if ((*((_WORD *)v4 + 52) & 4) != 0)
  {
    self->_isChainResultSet = *((_BYTE *)v4 + 100);
    *(_WORD *)&self->_flags |= 4u;
  }

}

- (PBUnknownFields)unknownFields
{
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v5;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_WORD *)&self->_flags & 8) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      v5 = reader;
      objc_sync_enter(v5);
      GEOPlaceSearchResponseReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_2547);
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
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSMutableArray *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  GEOPlaceSearchResponse *v32;
  NSMutableArray *obj;
  uint64_t v34;
  uint64_t v35;
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
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  _BYTE v57[128];
  _BYTE v58[128];
  _BYTE v59[128];
  _BYTE v60[128];
  uint64_t v61;

  v3 = a3;
  v61 = *MEMORY[0x1E0C80C00];
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x408u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEOPlaceSearchResponse readAll:](self, "readAll:", 0);
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v7 = self->_placeResults;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v44, v58, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v45;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v45 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * v11++), "clearUnknownFields:", 1);
        }
        while (v9 != v11);
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v44, v58, 16);
      }
      while (v9);
    }

    -[GEOMapRegion clearUnknownFields:](self->_mapRegion, "clearUnknownFields:", 1);
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v32 = self;
    obj = self->_suggestionEntryLists;
    v35 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v40, v57, 16);
    if (v35)
    {
      v34 = *(_QWORD *)v41;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v41 != v34)
            objc_enumerationMutation(obj);
          v13 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * v12);
          if (v13)
          {
            os_unfair_lock_lock_with_options();
            *(_BYTE *)(v13 + 60) |= 4u;
            *(_BYTE *)(v13 + 60) |= 0x20u;
            os_unfair_lock_unlock((os_unfair_lock_t)(v13 + 48));
            v14 = *(void **)(v13 + 16);
            *(_QWORD *)(v13 + 16) = 0;

            -[GEOSuggestionEntryList readAll:](v13, 0);
            v50 = 0u;
            v51 = 0u;
            v48 = 0u;
            v49 = 0u;
            v15 = *(id *)(v13 + 32);
            v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v48, v59, 16, v32);
            if (v16)
            {
              v17 = v16;
              v18 = *(_QWORD *)v49;
              do
              {
                v19 = 0;
                do
                {
                  if (*(_QWORD *)v49 != v18)
                    objc_enumerationMutation(v15);
                  v20 = *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * v19);
                  if (v20)
                  {
                    os_unfair_lock_lock_with_options();
                    *(_WORD *)(v20 + 116) |= 1u;
                    *(_WORD *)(v20 + 116) |= 0x200u;
                    os_unfair_lock_unlock((os_unfair_lock_t)(v20 + 112));
                    v21 = *(void **)(v20 + 16);
                    *(_QWORD *)(v20 + 16) = 0;

                    -[GEOSuggestionEntry readAll:](v20, 0);
                    objc_msgSend(*(id *)(v20 + 72), "clearUnknownFields:", 1);
                    v54 = 0u;
                    v55 = 0u;
                    v52 = 0u;
                    v53 = 0u;
                    v22 = *(id *)(v20 + 80);
                    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
                    if (v23)
                    {
                      v24 = v23;
                      v25 = *(_QWORD *)v53;
                      do
                      {
                        v26 = 0;
                        do
                        {
                          if (*(_QWORD *)v53 != v25)
                            objc_enumerationMutation(v22);
                          objc_msgSend(*(id *)(*((_QWORD *)&v52 + 1) + 8 * v26++), "clearUnknownFields:", 1);
                        }
                        while (v24 != v26);
                        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
                      }
                      while (v24);
                    }

                  }
                  ++v19;
                }
                while (v19 != v17);
                v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v48, v59, 16);
              }
              while (v17);
            }

          }
          ++v12;
        }
        while (v12 != v35);
        v35 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v40, v57, 16);
      }
      while (v35);
    }

    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v27 = v32->_namedFeatures;
    v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v36, v56, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v37;
      do
      {
        v31 = 0;
        do
        {
          if (*(_QWORD *)v37 != v30)
            objc_enumerationMutation(v27);
          objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * v31++), "clearUnknownFields:", 1, v32);
        }
        while (v29 != v31);
        v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v36, v56, 16);
      }
      while (v29);
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestionMetadata, 0);
  objc_storeStrong((id *)&self->_suggestionEntryLists, 0);
  objc_storeStrong((id *)&self->_placeResults, 0);
  objc_storeStrong((id *)&self->_nearbySectionHeader, 0);
  objc_storeStrong((id *)&self->_namedFeatures, 0);
  objc_storeStrong((id *)&self->_mapRegion, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
