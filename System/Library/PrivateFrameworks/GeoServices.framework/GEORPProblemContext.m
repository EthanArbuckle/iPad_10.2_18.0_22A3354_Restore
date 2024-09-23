@implementation GEORPProblemContext

- (GEORPProblemContext)init
{
  GEORPProblemContext *v2;
  GEORPProblemContext *v3;
  GEORPProblemContext *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEORPProblemContext;
  v2 = -[GEORPProblemContext init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPProblemContext)initWithData:(id)a3
{
  GEORPProblemContext *v3;
  GEORPProblemContext *v4;
  GEORPProblemContext *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEORPProblemContext;
  v3 = -[GEORPProblemContext initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (GEOSessionID)sessionId
{
  GEOSessionID *p_sessionId;
  unint64_t high;
  unint64_t low;
  GEOSessionID result;

  p_sessionId = &self->_sessionId;
  high = self->_sessionId._high;
  low = p_sessionId->_low;
  result._low = low;
  result._high = high;
  return result;
}

- (void)setSessionId:(GEOSessionID)a3
{
  *(_DWORD *)&self->_flags |= 0x2000001u;
  self->_sessionId = a3;
}

- (void)setHasSessionId:(BOOL)a3
{
  self->_flags = ($C1B93A348CBC2642A5F7A481C310B991)(*(_DWORD *)&self->_flags & 0xFFFFFFFE | a3 | 0x2000000);
}

- (BOOL)hasSessionId
{
  return *(_DWORD *)&self->_flags & 1;
}

- (int)pinType
{
  os_unfair_lock_s *p_readerLock;
  $C1B93A348CBC2642A5F7A481C310B991 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_BYTE *)&flags & 0x10) != 0)
    return self->_pinType;
  else
    return -1;
}

- (void)setPinType:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x2000010u;
  self->_pinType = a3;
}

- (void)setHasPinType:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 33554448;
  else
    v3 = 0x2000000;
  self->_flags = ($C1B93A348CBC2642A5F7A481C310B991)(*(_DWORD *)&self->_flags & 0xFFFFFFEF | v3);
}

- (BOOL)hasPinType
{
  return (*(_BYTE *)&self->_flags >> 4) & 1;
}

- (id)pinTypeAsString:(int)a3
{
  if ((a3 + 1) < 0xB)
    return off_1E1C0EEB0[a3 + 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsPinType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PIN_TYPE_UNKNOWN")) & 1) != 0)
  {
    v4 = -1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SEARCH_RESULT")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("POI_ICON")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DROPPED_PIN")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CONTACT")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CURRENT_LOCATION")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BOOKMARK")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EXTERNAL")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PIN_TYPE_SEARCH_AUTOCOMPLETE")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BRAND_ICON")) & 1) != 0)
  {
    v4 = 8;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("SHARED_LOCATION")))
  {
    v4 = 9;
  }
  else
  {
    v4 = -1;
  }

  return v4;
}

- (void)_readOriginalPlace
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 216));
    if ((*(_BYTE *)(a1 + 230) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPProblemContextReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readOriginalPlace_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 216));
  }
}

- (BOOL)hasOriginalPlace
{
  -[GEORPProblemContext _readOriginalPlace]((uint64_t)self);
  return self->_originalPlace != 0;
}

- (GEOPlace)originalPlace
{
  -[GEORPProblemContext _readOriginalPlace]((uint64_t)self);
  return self->_originalPlace;
}

- (void)setOriginalPlace:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x2020000u;
  objc_storeStrong((id *)&self->_originalPlace, a3);
}

- (void)_readMapLocation
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 216));
    if ((*(_BYTE *)(a1 + 229) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPProblemContextReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMapLocation_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 216));
  }
}

- (BOOL)hasMapLocation
{
  -[GEORPProblemContext _readMapLocation]((uint64_t)self);
  return self->_mapLocation != 0;
}

- (GEORPMapLocation)mapLocation
{
  -[GEORPProblemContext _readMapLocation]((uint64_t)self);
  return self->_mapLocation;
}

- (void)setMapLocation:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x2004000u;
  objc_storeStrong((id *)&self->_mapLocation, a3);
}

- (void)_readVisibleTileSets
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 216));
    if ((*(_BYTE *)(a1 + 231) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPProblemContextReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readVisibleTileSets_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 216));
  }
}

- (NSMutableArray)visibleTileSets
{
  -[GEORPProblemContext _readVisibleTileSets]((uint64_t)self);
  return self->_visibleTileSets;
}

- (void)setVisibleTileSets:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *visibleTileSets;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x1000000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x2000000u;
  visibleTileSets = self->_visibleTileSets;
  self->_visibleTileSets = v4;

}

- (void)clearVisibleTileSets
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x1000000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x2000000u;
  -[NSMutableArray removeAllObjects](self->_visibleTileSets, "removeAllObjects");
}

- (void)addVisibleTileSet:(id)a3
{
  id v4;

  v4 = a3;
  -[GEORPProblemContext _readVisibleTileSets]((uint64_t)self);
  -[GEORPProblemContext _addNoFlagsVisibleTileSet:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x1000000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x2000000u;
}

- (void)_addNoFlagsVisibleTileSet:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 200);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 200);
      *(_QWORD *)(a1 + 200) = v5;

      v4 = *(void **)(a1 + 200);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)visibleTileSetsCount
{
  -[GEORPProblemContext _readVisibleTileSets]((uint64_t)self);
  return -[NSMutableArray count](self->_visibleTileSets, "count");
}

- (id)visibleTileSetAtIndex:(unint64_t)a3
{
  -[GEORPProblemContext _readVisibleTileSets]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_visibleTileSets, "objectAtIndex:", a3);
}

+ (Class)visibleTileSetType
{
  return (Class)objc_opt_class();
}

- (void)_readTileStateLog
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 216));
    if ((*(_BYTE *)(a1 + 230) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPProblemContextReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTileStateLog_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 216));
  }
}

- (BOOL)hasTileStateLog
{
  -[GEORPProblemContext _readTileStateLog]((uint64_t)self);
  return self->_tileStateLog != 0;
}

- (NSString)tileStateLog
{
  -[GEORPProblemContext _readTileStateLog]((uint64_t)self);
  return self->_tileStateLog;
}

- (void)setTileStateLog:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x2400000u;
  objc_storeStrong((id *)&self->_tileStateLog, a3);
}

- (void)_readPlace
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 216));
    if ((*(_BYTE *)(a1 + 230) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPProblemContextReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPlace_tags_4);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 216));
  }
}

- (BOOL)hasPlace
{
  -[GEORPProblemContext _readPlace]((uint64_t)self);
  return self->_place != 0;
}

- (GEOPDPlace)place
{
  -[GEORPProblemContext _readPlace]((uint64_t)self);
  return self->_place;
}

- (void)setPlace:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x2100000u;
  objc_storeStrong((id *)&self->_place, a3);
}

- (void)_readDirectionsRequests
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 216));
    if ((*(_BYTE *)(a1 + 229) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPProblemContextReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDirectionsRequests_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 216));
  }
}

- (NSMutableArray)directionsRequests
{
  -[GEORPProblemContext _readDirectionsRequests]((uint64_t)self);
  return self->_directionsRequests;
}

- (void)setDirectionsRequests:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *directionsRequests;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x200u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x2000000u;
  directionsRequests = self->_directionsRequests;
  self->_directionsRequests = v4;

}

- (void)clearDirectionsRequests
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x200u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x2000000u;
  -[NSMutableArray removeAllObjects](self->_directionsRequests, "removeAllObjects");
}

- (void)addDirectionsRequest:(id)a3
{
  id v4;

  v4 = a3;
  -[GEORPProblemContext _readDirectionsRequests]((uint64_t)self);
  -[GEORPProblemContext _addNoFlagsDirectionsRequest:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x200u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x2000000u;
}

- (void)_addNoFlagsDirectionsRequest:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 72);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 72);
      *(_QWORD *)(a1 + 72) = v5;

      v4 = *(void **)(a1 + 72);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)directionsRequestsCount
{
  -[GEORPProblemContext _readDirectionsRequests]((uint64_t)self);
  return -[NSMutableArray count](self->_directionsRequests, "count");
}

- (id)directionsRequestAtIndex:(unint64_t)a3
{
  -[GEORPProblemContext _readDirectionsRequests]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_directionsRequests, "objectAtIndex:", a3);
}

+ (Class)directionsRequestType
{
  return (Class)objc_opt_class();
}

- (void)_readDirectionsResponses
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 216));
    if ((*(_BYTE *)(a1 + 229) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPProblemContextReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDirectionsResponses_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 216));
  }
}

- (NSMutableArray)directionsResponses
{
  -[GEORPProblemContext _readDirectionsResponses]((uint64_t)self);
  return self->_directionsResponses;
}

- (void)setDirectionsResponses:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *directionsResponses;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x400u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x2000000u;
  directionsResponses = self->_directionsResponses;
  self->_directionsResponses = v4;

}

- (void)clearDirectionsResponses
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x400u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x2000000u;
  -[NSMutableArray removeAllObjects](self->_directionsResponses, "removeAllObjects");
}

- (void)addDirectionsResponse:(id)a3
{
  id v4;

  v4 = a3;
  -[GEORPProblemContext _readDirectionsResponses]((uint64_t)self);
  -[GEORPProblemContext _addNoFlagsDirectionsResponse:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x400u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x2000000u;
}

- (void)_addNoFlagsDirectionsResponse:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 80);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 80);
      *(_QWORD *)(a1 + 80) = v5;

      v4 = *(void **)(a1 + 80);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)directionsResponsesCount
{
  -[GEORPProblemContext _readDirectionsResponses]((uint64_t)self);
  return -[NSMutableArray count](self->_directionsResponses, "count");
}

- (id)directionsResponseAtIndex:(unint64_t)a3
{
  -[GEORPProblemContext _readDirectionsResponses]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_directionsResponses, "objectAtIndex:", a3);
}

+ (Class)directionsResponseType
{
  return (Class)objc_opt_class();
}

- (void)_readLastSearchString
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 216));
    if ((*(_BYTE *)(a1 + 229) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPProblemContextReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLastSearchString_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 216));
  }
}

- (BOOL)hasLastSearchString
{
  -[GEORPProblemContext _readLastSearchString]((uint64_t)self);
  return self->_lastSearchString != 0;
}

- (NSString)lastSearchString
{
  -[GEORPProblemContext _readLastSearchString]((uint64_t)self);
  return self->_lastSearchString;
}

- (void)setLastSearchString:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x2001000u;
  objc_storeStrong((id *)&self->_lastSearchString, a3);
}

- (double)creationDate
{
  return self->_creationDate;
}

- (void)setCreationDate:(double)a3
{
  *(_DWORD *)&self->_flags |= 0x2000002u;
  self->_creationDate = a3;
}

- (void)setHasCreationDate:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 33554434;
  else
    v3 = 0x2000000;
  self->_flags = ($C1B93A348CBC2642A5F7A481C310B991)(*(_DWORD *)&self->_flags & 0xFFFFFFFD | v3);
}

- (BOOL)hasCreationDate
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (void)_readAuxiliaryControls
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 216));
    if ((*(_BYTE *)(a1 + 228) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPProblemContextReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAuxiliaryControls_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 216));
  }
}

- (NSMutableArray)auxiliaryControls
{
  -[GEORPProblemContext _readAuxiliaryControls]((uint64_t)self);
  return self->_auxiliaryControls;
}

- (void)setAuxiliaryControls:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *auxiliaryControls;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x2000000u;
  auxiliaryControls = self->_auxiliaryControls;
  self->_auxiliaryControls = v4;

}

- (void)clearAuxiliaryControls
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x2000000u;
  -[NSMutableArray removeAllObjects](self->_auxiliaryControls, "removeAllObjects");
}

- (void)addAuxiliaryControl:(id)a3
{
  id v4;

  v4 = a3;
  -[GEORPProblemContext _readAuxiliaryControls]((uint64_t)self);
  -[GEORPProblemContext _addNoFlagsAuxiliaryControl:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x2000000u;
}

- (void)_addNoFlagsAuxiliaryControl:(uint64_t)a1
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

- (unint64_t)auxiliaryControlsCount
{
  -[GEORPProblemContext _readAuxiliaryControls]((uint64_t)self);
  return -[NSMutableArray count](self->_auxiliaryControls, "count");
}

- (id)auxiliaryControlAtIndex:(unint64_t)a3
{
  -[GEORPProblemContext _readAuxiliaryControls]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_auxiliaryControls, "objectAtIndex:", a3);
}

+ (Class)auxiliaryControlType
{
  return (Class)objc_opt_class();
}

- (unint64_t)originatingAuxiliaryControlIndex
{
  return self->_originatingAuxiliaryControlIndex;
}

- (void)setOriginatingAuxiliaryControlIndex:(unint64_t)a3
{
  *(_DWORD *)&self->_flags |= 0x2000004u;
  self->_originatingAuxiliaryControlIndex = a3;
}

- (void)setHasOriginatingAuxiliaryControlIndex:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 33554436;
  else
    v3 = 0x2000000;
  self->_flags = ($C1B93A348CBC2642A5F7A481C310B991)(*(_DWORD *)&self->_flags & 0xFFFFFFFB | v3);
}

- (BOOL)hasOriginatingAuxiliaryControlIndex
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (void)_readTransitLineTileInfo
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 216));
    if ((*(_BYTE *)(a1 + 230) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPProblemContextReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTransitLineTileInfo_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 216));
  }
}

- (BOOL)hasTransitLineTileInfo
{
  -[GEORPProblemContext _readTransitLineTileInfo]((uint64_t)self);
  return self->_transitLineTileInfo != 0;
}

- (GEORPTransitLineTileInfo)transitLineTileInfo
{
  -[GEORPProblemContext _readTransitLineTileInfo]((uint64_t)self);
  return self->_transitLineTileInfo;
}

- (void)setTransitLineTileInfo:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x2800000u;
  objc_storeStrong((id *)&self->_transitLineTileInfo, a3);
}

- (void)_readPlaceInfo
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 216));
    if ((*(_BYTE *)(a1 + 230) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPProblemContextReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPlaceInfo_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 216));
  }
}

- (BOOL)hasPlaceInfo
{
  -[GEORPProblemContext _readPlaceInfo]((uint64_t)self);
  return self->_placeInfo != 0;
}

- (GEORPPlaceInfo)placeInfo
{
  -[GEORPProblemContext _readPlaceInfo]((uint64_t)self);
  return self->_placeInfo;
}

- (void)setPlaceInfo:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x2080000u;
  objc_storeStrong((id *)&self->_placeInfo, a3);
}

- (void)_readLastUserTypedSearchString
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 216));
    if ((*(_BYTE *)(a1 + 229) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPProblemContextReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLastUserTypedSearchString_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 216));
  }
}

- (BOOL)hasLastUserTypedSearchString
{
  -[GEORPProblemContext _readLastUserTypedSearchString]((uint64_t)self);
  return self->_lastUserTypedSearchString != 0;
}

- (NSString)lastUserTypedSearchString
{
  -[GEORPProblemContext _readLastUserTypedSearchString]((uint64_t)self);
  return self->_lastUserTypedSearchString;
}

- (void)setLastUserTypedSearchString:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x2002000u;
  objc_storeStrong((id *)&self->_lastUserTypedSearchString, a3);
}

- (int)deviceGmtOffset
{
  return self->_deviceGmtOffset;
}

- (void)setDeviceGmtOffset:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x2000008u;
  self->_deviceGmtOffset = a3;
}

- (void)setHasDeviceGmtOffset:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 33554440;
  else
    v3 = 0x2000000;
  self->_flags = ($C1B93A348CBC2642A5F7A481C310B991)(*(_DWORD *)&self->_flags & 0xFFFFFFF7 | v3);
}

- (BOOL)hasDeviceGmtOffset
{
  return (*(_BYTE *)&self->_flags >> 3) & 1;
}

- (void)_readCurrentAbAssignmentResponse
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 216));
    if ((*(_BYTE *)(a1 + 228) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPProblemContextReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCurrentAbAssignmentResponse_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 216));
  }
}

- (BOOL)hasCurrentAbAssignmentResponse
{
  -[GEORPProblemContext _readCurrentAbAssignmentResponse]((uint64_t)self);
  return self->_currentAbAssignmentResponse != 0;
}

- (GEOABAssignmentResponse)currentAbAssignmentResponse
{
  -[GEORPProblemContext _readCurrentAbAssignmentResponse]((uint64_t)self);
  return self->_currentAbAssignmentResponse;
}

- (void)setCurrentAbAssignmentResponse:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x2000080u;
  objc_storeStrong((id *)&self->_currentAbAssignmentResponse, a3);
}

- (void)_readAutocompleteSuggestionLists
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 216));
    if ((*(_BYTE *)(a1 + 228) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPProblemContextReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAutocompleteSuggestionLists_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 216));
  }
}

- (NSMutableArray)autocompleteSuggestionLists
{
  -[GEORPProblemContext _readAutocompleteSuggestionLists]((uint64_t)self);
  return self->_autocompleteSuggestionLists;
}

- (void)setAutocompleteSuggestionLists:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *autocompleteSuggestionLists;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x2000000u;
  autocompleteSuggestionLists = self->_autocompleteSuggestionLists;
  self->_autocompleteSuggestionLists = v4;

}

- (void)clearAutocompleteSuggestionLists
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x2000000u;
  -[NSMutableArray removeAllObjects](self->_autocompleteSuggestionLists, "removeAllObjects");
}

- (void)addAutocompleteSuggestionList:(id)a3
{
  id v4;

  v4 = a3;
  -[GEORPProblemContext _readAutocompleteSuggestionLists]((uint64_t)self);
  -[GEORPProblemContext _addNoFlagsAutocompleteSuggestionList:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x2000000u;
}

- (void)_addNoFlagsAutocompleteSuggestionList:(uint64_t)a1
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

- (unint64_t)autocompleteSuggestionListsCount
{
  -[GEORPProblemContext _readAutocompleteSuggestionLists]((uint64_t)self);
  return -[NSMutableArray count](self->_autocompleteSuggestionLists, "count");
}

- (id)autocompleteSuggestionListAtIndex:(unint64_t)a3
{
  -[GEORPProblemContext _readAutocompleteSuggestionLists]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_autocompleteSuggestionLists, "objectAtIndex:", a3);
}

+ (Class)autocompleteSuggestionListType
{
  return (Class)objc_opt_class();
}

- (void)_readCurrentEnvironmentManifestUrls
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 216));
    if ((*(_BYTE *)(a1 + 229) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPProblemContextReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCurrentEnvironmentManifestUrls_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 216));
  }
}

- (BOOL)hasCurrentEnvironmentManifestUrls
{
  -[GEORPProblemContext _readCurrentEnvironmentManifestUrls]((uint64_t)self);
  return self->_currentEnvironmentManifestUrls != 0;
}

- (GEORPCurrentEnvironmentManifestURLs)currentEnvironmentManifestUrls
{
  -[GEORPProblemContext _readCurrentEnvironmentManifestUrls]((uint64_t)self);
  return self->_currentEnvironmentManifestUrls;
}

- (void)setCurrentEnvironmentManifestUrls:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x2000100u;
  objc_storeStrong((id *)&self->_currentEnvironmentManifestUrls, a3);
}

- (void)_readDirectionsWaypointPlaceInfos
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 216));
    if ((*(_BYTE *)(a1 + 229) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPProblemContextReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDirectionsWaypointPlaceInfos_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 216));
  }
}

- (NSMutableArray)directionsWaypointPlaceInfos
{
  -[GEORPProblemContext _readDirectionsWaypointPlaceInfos]((uint64_t)self);
  return self->_directionsWaypointPlaceInfos;
}

- (void)setDirectionsWaypointPlaceInfos:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *directionsWaypointPlaceInfos;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x800u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x2000000u;
  directionsWaypointPlaceInfos = self->_directionsWaypointPlaceInfos;
  self->_directionsWaypointPlaceInfos = v4;

}

- (void)clearDirectionsWaypointPlaceInfos
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x800u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x2000000u;
  -[NSMutableArray removeAllObjects](self->_directionsWaypointPlaceInfos, "removeAllObjects");
}

- (void)addDirectionsWaypointPlaceInfo:(id)a3
{
  id v4;

  v4 = a3;
  -[GEORPProblemContext _readDirectionsWaypointPlaceInfos]((uint64_t)self);
  -[GEORPProblemContext _addNoFlagsDirectionsWaypointPlaceInfo:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x800u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x2000000u;
}

- (void)_addNoFlagsDirectionsWaypointPlaceInfo:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 88);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 88);
      *(_QWORD *)(a1 + 88) = v5;

      v4 = *(void **)(a1 + 88);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)directionsWaypointPlaceInfosCount
{
  -[GEORPProblemContext _readDirectionsWaypointPlaceInfos]((uint64_t)self);
  return -[NSMutableArray count](self->_directionsWaypointPlaceInfos, "count");
}

- (id)directionsWaypointPlaceInfoAtIndex:(unint64_t)a3
{
  -[GEORPProblemContext _readDirectionsWaypointPlaceInfos]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_directionsWaypointPlaceInfos, "objectAtIndex:", a3);
}

+ (Class)directionsWaypointPlaceInfoType
{
  return (Class)objc_opt_class();
}

- (void)_readServicesState
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 216));
    if ((*(_BYTE *)(a1 + 230) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPProblemContextReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readServicesState_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 216));
  }
}

- (BOOL)hasServicesState
{
  -[GEORPProblemContext _readServicesState]((uint64_t)self);
  return self->_servicesState != 0;
}

- (GEOServicesState)servicesState
{
  -[GEORPProblemContext _readServicesState]((uint64_t)self);
  return self->_servicesState;
}

- (void)setServicesState:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x2200000u;
  objc_storeStrong((id *)&self->_servicesState, a3);
}

- (void)_readPersonalizedMaps
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 216));
    if ((*(_BYTE *)(a1 + 230) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPProblemContextReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPersonalizedMaps_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 216));
  }
}

- (BOOL)hasPersonalizedMaps
{
  -[GEORPProblemContext _readPersonalizedMaps]((uint64_t)self);
  return self->_personalizedMaps != 0;
}

- (GEORPPersonalizedMaps)personalizedMaps
{
  -[GEORPProblemContext _readPersonalizedMaps]((uint64_t)self);
  return self->_personalizedMaps;
}

- (void)setPersonalizedMaps:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x2040000u;
  objc_storeStrong((id *)&self->_personalizedMaps, a3);
}

- (void)_readNavigationSettings
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 216));
    if ((*(_BYTE *)(a1 + 230) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPProblemContextReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readNavigationSettings_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 216));
  }
}

- (BOOL)hasNavigationSettings
{
  -[GEORPProblemContext _readNavigationSettings]((uint64_t)self);
  return self->_navigationSettings != 0;
}

- (GEORPNavigationSettings)navigationSettings
{
  -[GEORPProblemContext _readNavigationSettings]((uint64_t)self);
  return self->_navigationSettings;
}

- (void)setNavigationSettings:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x2010000u;
  objc_storeStrong((id *)&self->_navigationSettings, a3);
}

- (void)_readMerchantLookupContext
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 216));
    if ((*(_BYTE *)(a1 + 229) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPProblemContextReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMerchantLookupContext_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 216));
  }
}

- (BOOL)hasMerchantLookupContext
{
  -[GEORPProblemContext _readMerchantLookupContext]((uint64_t)self);
  return self->_merchantLookupContext != 0;
}

- (GEORPMerchantLookupContext)merchantLookupContext
{
  -[GEORPProblemContext _readMerchantLookupContext]((uint64_t)self);
  return self->_merchantLookupContext;
}

- (void)setMerchantLookupContext:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x2008000u;
  objc_storeStrong((id *)&self->_merchantLookupContext, a3);
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
  v8.super_class = (Class)GEORPProblemContext;
  -[GEORPProblemContext description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORPProblemContext dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPProblemContext _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  int v5;
  void *v6;
  const __CFString *v7;
  id v8;
  unsigned int v9;
  __CFString *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  id v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  id v29;
  const __CFString *v30;
  void *v31;
  const __CFString *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t j;
  void *v42;
  id v43;
  const __CFString *v44;
  void *v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t k;
  void *v51;
  id v52;
  const __CFString *v53;
  void *v54;
  const __CFString *v55;
  void *v56;
  const __CFString *v57;
  void *v58;
  id v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t m;
  void *v64;
  id v65;
  const __CFString *v66;
  void *v67;
  const __CFString *v68;
  void *v69;
  void *v70;
  void *v71;
  const __CFString *v72;
  id v73;
  void *v74;
  void *v75;
  void *v76;
  const __CFString *v77;
  id v78;
  void *v79;
  const __CFString *v80;
  void *v81;
  const __CFString *v82;
  void *v83;
  void *v84;
  void *v85;
  const __CFString *v86;
  id v87;
  void *v88;
  id v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t n;
  void *v94;
  id v95;
  const __CFString *v96;
  void *v97;
  void *v98;
  void *v99;
  const __CFString *v100;
  id v101;
  void *v102;
  id v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t ii;
  void *v108;
  id v109;
  const __CFString *v110;
  void *v111;
  void *v112;
  void *v113;
  const __CFString *v114;
  id v115;
  void *v116;
  void *v117;
  void *v118;
  const __CFString *v119;
  id v120;
  void *v121;
  void *v122;
  void *v123;
  const __CFString *v124;
  id v125;
  void *v126;
  void *v127;
  void *v128;
  const __CFString *v129;
  id v130;
  id v131;
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
  __int128 v155;
  __int128 v156;
  _BYTE v157[128];
  _BYTE v158[128];
  _BYTE v159[128];
  _BYTE v160[128];
  _BYTE v161[128];
  _BYTE v162[128];
  uint64_t v163;

  v163 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_DWORD *)(a1 + 228);
  if ((v5 & 1) != 0)
  {
    _GEOSessionIDDictionaryRepresentation((_QWORD *)(a1 + 16));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v7 = CFSTR("sessionId");
    else
      v7 = CFSTR("session_id");
    v8 = v6;

    objc_msgSend(v4, "setObject:forKey:", v8, v7);
    v5 = *(_DWORD *)(a1 + 228);
  }
  if ((v5 & 0x10) != 0)
  {
    v9 = *(_DWORD *)(a1 + 224) + 1;
    if (v9 >= 0xB)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 224));
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = off_1E1C0EEB0[v9];
    }
    if (a2)
      v11 = CFSTR("pinType");
    else
      v11 = CFSTR("pin_type");
    objc_msgSend(v4, "setObject:forKey:", v10, v11);

  }
  objc_msgSend((id)a1, "originalPlace");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v12, "jsonRepresentation");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = CFSTR("originalPlace");
    }
    else
    {
      objc_msgSend(v12, "dictionaryRepresentation");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = CFSTR("original_place");
    }
    v16 = v14;

    objc_msgSend(v4, "setObject:forKey:", v16, v15);
  }

  objc_msgSend((id)a1, "mapLocation");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v17, "jsonRepresentation");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = CFSTR("mapLocation");
    }
    else
    {
      objc_msgSend(v17, "dictionaryRepresentation");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = CFSTR("map_location");
    }
    v21 = v19;

    objc_msgSend(v4, "setObject:forKey:", v21, v20);
  }

  if (objc_msgSend(*(id *)(a1 + 200), "count"))
  {
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 200), "count"));
    v153 = 0u;
    v154 = 0u;
    v155 = 0u;
    v156 = 0u;
    v23 = *(id *)(a1 + 200);
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v153, v162, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v154;
      do
      {
        for (i = 0; i != v25; ++i)
        {
          if (*(_QWORD *)v154 != v26)
            objc_enumerationMutation(v23);
          v28 = *(void **)(*((_QWORD *)&v153 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v28, "jsonRepresentation");
          else
            objc_msgSend(v28, "dictionaryRepresentation");
          v29 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v22, "addObject:", v29);
        }
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v153, v162, 16);
      }
      while (v25);
    }

    if (a2)
      v30 = CFSTR("visibleTileSet");
    else
      v30 = CFSTR("visible_tile_set");
    objc_msgSend(v4, "setObject:forKey:", v22, v30);

  }
  objc_msgSend((id)a1, "tileStateLog");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (v31)
  {
    if (a2)
      v32 = CFSTR("tileStateLog");
    else
      v32 = CFSTR("tile_state_log");
    objc_msgSend(v4, "setObject:forKey:", v31, v32);
  }

  objc_msgSend((id)a1, "place");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v33;
  if (v33)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v33, "jsonRepresentation");
    else
      objc_msgSend(v33, "dictionaryRepresentation");
    v35 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKey:", v35, CFSTR("place"));
  }

  if (objc_msgSend(*(id *)(a1 + 72), "count"))
  {
    v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 72), "count"));
    v149 = 0u;
    v150 = 0u;
    v151 = 0u;
    v152 = 0u;
    v37 = *(id *)(a1 + 72);
    v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v149, v161, 16);
    if (v38)
    {
      v39 = v38;
      v40 = *(_QWORD *)v150;
      do
      {
        for (j = 0; j != v39; ++j)
        {
          if (*(_QWORD *)v150 != v40)
            objc_enumerationMutation(v37);
          v42 = *(void **)(*((_QWORD *)&v149 + 1) + 8 * j);
          if ((a2 & 1) != 0)
            objc_msgSend(v42, "jsonRepresentation");
          else
            objc_msgSend(v42, "dictionaryRepresentation");
          v43 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v36, "addObject:", v43);
        }
        v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v149, v161, 16);
      }
      while (v39);
    }

    if (a2)
      v44 = CFSTR("directionsRequest");
    else
      v44 = CFSTR("directions_request");
    objc_msgSend(v4, "setObject:forKey:", v36, v44);

  }
  if (objc_msgSend(*(id *)(a1 + 80), "count"))
  {
    v45 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 80), "count"));
    v145 = 0u;
    v146 = 0u;
    v147 = 0u;
    v148 = 0u;
    v46 = *(id *)(a1 + 80);
    v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v145, v160, 16);
    if (v47)
    {
      v48 = v47;
      v49 = *(_QWORD *)v146;
      do
      {
        for (k = 0; k != v48; ++k)
        {
          if (*(_QWORD *)v146 != v49)
            objc_enumerationMutation(v46);
          v51 = *(void **)(*((_QWORD *)&v145 + 1) + 8 * k);
          if ((a2 & 1) != 0)
            objc_msgSend(v51, "jsonRepresentation");
          else
            objc_msgSend(v51, "dictionaryRepresentation");
          v52 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v45, "addObject:", v52);
        }
        v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v145, v160, 16);
      }
      while (v48);
    }

    if (a2)
      v53 = CFSTR("directionsResponse");
    else
      v53 = CFSTR("directions_response");
    objc_msgSend(v4, "setObject:forKey:", v45, v53);

  }
  objc_msgSend((id)a1, "lastSearchString");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  if (v54)
  {
    if (a2)
      v55 = CFSTR("lastSearchString");
    else
      v55 = CFSTR("last_search_string");
    objc_msgSend(v4, "setObject:forKey:", v54, v55);
  }

  if ((*(_BYTE *)(a1 + 228) & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 48));
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v57 = CFSTR("creationDate");
    else
      v57 = CFSTR("creation_date");
    objc_msgSend(v4, "setObject:forKey:", v56, v57);

  }
  if (objc_msgSend(*(id *)(a1 + 40), "count"))
  {
    v58 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
    v141 = 0u;
    v142 = 0u;
    v143 = 0u;
    v144 = 0u;
    v59 = *(id *)(a1 + 40);
    v60 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v141, v159, 16);
    if (v60)
    {
      v61 = v60;
      v62 = *(_QWORD *)v142;
      do
      {
        for (m = 0; m != v61; ++m)
        {
          if (*(_QWORD *)v142 != v62)
            objc_enumerationMutation(v59);
          v64 = *(void **)(*((_QWORD *)&v141 + 1) + 8 * m);
          if ((a2 & 1) != 0)
            objc_msgSend(v64, "jsonRepresentation");
          else
            objc_msgSend(v64, "dictionaryRepresentation");
          v65 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v58, "addObject:", v65);
        }
        v61 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v141, v159, 16);
      }
      while (v61);
    }

    if (a2)
      v66 = CFSTR("auxiliaryControl");
    else
      v66 = CFSTR("auxiliary_control");
    objc_msgSend(v4, "setObject:forKey:", v58, v66);

  }
  if ((*(_BYTE *)(a1 + 228) & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 144));
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v68 = CFSTR("originatingAuxiliaryControlIndex");
    else
      v68 = CFSTR("originating_auxiliary_control_index");
    objc_msgSend(v4, "setObject:forKey:", v67, v68);

  }
  objc_msgSend((id)a1, "transitLineTileInfo");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = v69;
  if (v69)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v69, "jsonRepresentation");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      v72 = CFSTR("transitLineTileInfo");
    }
    else
    {
      objc_msgSend(v69, "dictionaryRepresentation");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      v72 = CFSTR("transit_line_tile_info");
    }
    v73 = v71;

    objc_msgSend(v4, "setObject:forKey:", v73, v72);
  }

  objc_msgSend((id)a1, "placeInfo");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v75 = v74;
  if (v74)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v74, "jsonRepresentation");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      v77 = CFSTR("placeInfo");
    }
    else
    {
      objc_msgSend(v74, "dictionaryRepresentation");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      v77 = CFSTR("place_info");
    }
    v78 = v76;

    objc_msgSend(v4, "setObject:forKey:", v78, v77);
  }

  objc_msgSend((id)a1, "lastUserTypedSearchString");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  if (v79)
  {
    if (a2)
      v80 = CFSTR("lastUserTypedSearchString");
    else
      v80 = CFSTR("last_user_typed_search_string");
    objc_msgSend(v4, "setObject:forKey:", v79, v80);
  }

  if ((*(_BYTE *)(a1 + 228) & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 220));
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v82 = CFSTR("deviceGmtOffset");
    else
      v82 = CFSTR("device_gmt_offset");
    objc_msgSend(v4, "setObject:forKey:", v81, v82);

  }
  objc_msgSend((id)a1, "currentAbAssignmentResponse");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v84 = v83;
  if (v83)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v83, "jsonRepresentation");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      v86 = CFSTR("currentAbAssignmentResponse");
    }
    else
    {
      objc_msgSend(v83, "dictionaryRepresentation");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      v86 = CFSTR("current_ab_assignment_response");
    }
    v87 = v85;

    objc_msgSend(v4, "setObject:forKey:", v87, v86);
  }

  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v88 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
    v137 = 0u;
    v138 = 0u;
    v139 = 0u;
    v140 = 0u;
    v89 = *(id *)(a1 + 32);
    v90 = objc_msgSend(v89, "countByEnumeratingWithState:objects:count:", &v137, v158, 16);
    if (v90)
    {
      v91 = v90;
      v92 = *(_QWORD *)v138;
      do
      {
        for (n = 0; n != v91; ++n)
        {
          if (*(_QWORD *)v138 != v92)
            objc_enumerationMutation(v89);
          v94 = *(void **)(*((_QWORD *)&v137 + 1) + 8 * n);
          if ((a2 & 1) != 0)
            objc_msgSend(v94, "jsonRepresentation");
          else
            objc_msgSend(v94, "dictionaryRepresentation");
          v95 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v88, "addObject:", v95);
        }
        v91 = objc_msgSend(v89, "countByEnumeratingWithState:objects:count:", &v137, v158, 16);
      }
      while (v91);
    }

    if (a2)
      v96 = CFSTR("autocompleteSuggestionList");
    else
      v96 = CFSTR("autocomplete_suggestion_list");
    objc_msgSend(v4, "setObject:forKey:", v88, v96);

  }
  objc_msgSend((id)a1, "currentEnvironmentManifestUrls");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  v98 = v97;
  if (v97)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v97, "jsonRepresentation");
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      v100 = CFSTR("currentEnvironmentManifestUrls");
    }
    else
    {
      objc_msgSend(v97, "dictionaryRepresentation");
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      v100 = CFSTR("current_environment_manifest_urls");
    }
    v101 = v99;

    objc_msgSend(v4, "setObject:forKey:", v101, v100);
  }

  if (objc_msgSend(*(id *)(a1 + 88), "count"))
  {
    v102 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 88), "count"));
    v133 = 0u;
    v134 = 0u;
    v135 = 0u;
    v136 = 0u;
    v103 = *(id *)(a1 + 88);
    v104 = objc_msgSend(v103, "countByEnumeratingWithState:objects:count:", &v133, v157, 16);
    if (v104)
    {
      v105 = v104;
      v106 = *(_QWORD *)v134;
      do
      {
        for (ii = 0; ii != v105; ++ii)
        {
          if (*(_QWORD *)v134 != v106)
            objc_enumerationMutation(v103);
          v108 = *(void **)(*((_QWORD *)&v133 + 1) + 8 * ii);
          if ((a2 & 1) != 0)
            objc_msgSend(v108, "jsonRepresentation");
          else
            objc_msgSend(v108, "dictionaryRepresentation");
          v109 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v102, "addObject:", v109);
        }
        v105 = objc_msgSend(v103, "countByEnumeratingWithState:objects:count:", &v133, v157, 16);
      }
      while (v105);
    }

    if (a2)
      v110 = CFSTR("directionsWaypointPlaceInfo");
    else
      v110 = CFSTR("directions_waypoint_place_info");
    objc_msgSend(v4, "setObject:forKey:", v102, v110);

  }
  objc_msgSend((id)a1, "servicesState");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  v112 = v111;
  if (v111)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v111, "jsonRepresentation");
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      v114 = CFSTR("servicesState");
    }
    else
    {
      objc_msgSend(v111, "dictionaryRepresentation");
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      v114 = CFSTR("services_state");
    }
    v115 = v113;

    objc_msgSend(v4, "setObject:forKey:", v115, v114);
  }

  objc_msgSend((id)a1, "personalizedMaps");
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  v117 = v116;
  if (v116)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v116, "jsonRepresentation");
      v118 = (void *)objc_claimAutoreleasedReturnValue();
      v119 = CFSTR("personalizedMaps");
    }
    else
    {
      objc_msgSend(v116, "dictionaryRepresentation");
      v118 = (void *)objc_claimAutoreleasedReturnValue();
      v119 = CFSTR("personalized_maps");
    }
    v120 = v118;

    objc_msgSend(v4, "setObject:forKey:", v120, v119);
  }

  objc_msgSend((id)a1, "navigationSettings");
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  v122 = v121;
  if (v121)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v121, "jsonRepresentation");
      v123 = (void *)objc_claimAutoreleasedReturnValue();
      v124 = CFSTR("navigationSettings");
    }
    else
    {
      objc_msgSend(v121, "dictionaryRepresentation");
      v123 = (void *)objc_claimAutoreleasedReturnValue();
      v124 = CFSTR("navigation_settings");
    }
    v125 = v123;

    objc_msgSend(v4, "setObject:forKey:", v125, v124);
  }

  objc_msgSend((id)a1, "merchantLookupContext");
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  v127 = v126;
  if (v126)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v126, "jsonRepresentation");
      v128 = (void *)objc_claimAutoreleasedReturnValue();
      v129 = CFSTR("merchantLookupContext");
    }
    else
    {
      objc_msgSend(v126, "dictionaryRepresentation");
      v128 = (void *)objc_claimAutoreleasedReturnValue();
      v129 = CFSTR("merchant_lookup_context");
    }
    v130 = v128;

    objc_msgSend(v4, "setObject:forKey:", v130, v129);
  }

  v131 = v4;
  return v131;
}

- (id)jsonRepresentation
{
  return -[GEORPProblemContext _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEORPProblemContext)initWithDictionary:(id)a3
{
  return (GEORPProblemContext *)-[GEORPProblemContext _initWithDictionary:isJSON:](self, a3, 0);
}

- (id)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  id v10;
  uint64_t v11;
  const __CFString *v12;
  void *v13;
  GEOPlace *v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  GEORPMapLocation *v19;
  uint64_t v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  uint64_t v29;
  GEORPVisibleTileSet *v30;
  uint64_t v31;
  void *v32;
  const __CFString *v33;
  void *v34;
  void *v35;
  void *v36;
  GEOPDPlace *v37;
  uint64_t v38;
  void *v39;
  const __CFString *v40;
  void *v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t j;
  uint64_t v47;
  GEODirectionsRequest *v48;
  uint64_t v49;
  void *v50;
  const __CFString *v51;
  void *v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t k;
  uint64_t v58;
  GEODirectionsResponse *v59;
  uint64_t v60;
  void *v61;
  const __CFString *v62;
  void *v63;
  void *v64;
  const __CFString *v65;
  void *v66;
  const __CFString *v67;
  void *v68;
  id v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t m;
  uint64_t v74;
  GEORPAuxiliaryControl *v75;
  uint64_t v76;
  void *v77;
  const __CFString *v78;
  void *v79;
  const __CFString *v80;
  void *v81;
  GEORPTransitLineTileInfo *v82;
  uint64_t v83;
  void *v84;
  const __CFString *v85;
  void *v86;
  GEORPPlaceInfo *v87;
  uint64_t v88;
  void *v89;
  const __CFString *v90;
  void *v91;
  void *v92;
  const __CFString *v93;
  void *v94;
  const __CFString *v95;
  void *v96;
  GEOABAssignmentResponse *v97;
  uint64_t v98;
  void *v99;
  const __CFString *v100;
  void *v101;
  id v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t n;
  uint64_t v107;
  GEORPSuggestionList *v108;
  uint64_t v109;
  void *v110;
  const __CFString *v111;
  void *v112;
  GEORPCurrentEnvironmentManifestURLs *v113;
  uint64_t v114;
  void *v115;
  const __CFString *v116;
  void *v117;
  id v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t ii;
  uint64_t v123;
  GEORPPlaceInfo *v124;
  uint64_t v125;
  void *v126;
  const __CFString *v127;
  void *v128;
  GEOServicesState *v129;
  uint64_t v130;
  void *v131;
  const __CFString *v132;
  void *v133;
  GEORPPersonalizedMaps *v134;
  uint64_t v135;
  void *v136;
  const __CFString *v137;
  void *v138;
  GEORPNavigationSettings *v139;
  uint64_t v140;
  void *v141;
  const __CFString *v142;
  void *v143;
  GEORPMerchantLookupContext *v144;
  uint64_t v145;
  void *v146;
  id v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  uint64_t v173;
  uint64_t v174;
  _BYTE v175[128];
  _BYTE v176[128];
  _BYTE v177[128];
  _BYTE v178[128];
  _BYTE v179[128];
  _BYTE v180[128];
  uint64_t v181;

  v181 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (!a1)
    goto LABEL_257;
  a1 = (id)objc_msgSend(a1, "init");

  if (!a1)
    goto LABEL_257;
  if (a3)
    v6 = CFSTR("sessionId");
  else
    v6 = CFSTR("session_id");
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v173 = 0;
    v174 = 0;
    _GEOSessionIDFromDictionaryRepresentation(v7, &v173);
    objc_msgSend(a1, "setSessionId:", v173, v174);
  }

  if (a3)
    v8 = CFSTR("pinType");
  else
    v8 = CFSTR("pin_type");
  objc_msgSend(v5, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = v9;
    if ((objc_msgSend(v10, "isEqualToString:", CFSTR("PIN_TYPE_UNKNOWN")) & 1) != 0)
    {
      v11 = 0xFFFFFFFFLL;
    }
    else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("SEARCH_RESULT")) & 1) != 0)
    {
      v11 = 0;
    }
    else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("POI_ICON")) & 1) != 0)
    {
      v11 = 1;
    }
    else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("DROPPED_PIN")) & 1) != 0)
    {
      v11 = 2;
    }
    else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("CONTACT")) & 1) != 0)
    {
      v11 = 3;
    }
    else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("CURRENT_LOCATION")) & 1) != 0)
    {
      v11 = 4;
    }
    else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("BOOKMARK")) & 1) != 0)
    {
      v11 = 5;
    }
    else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("EXTERNAL")) & 1) != 0)
    {
      v11 = 6;
    }
    else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("PIN_TYPE_SEARCH_AUTOCOMPLETE")) & 1) != 0)
    {
      v11 = 7;
    }
    else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("BRAND_ICON")) & 1) != 0)
    {
      v11 = 8;
    }
    else if (objc_msgSend(v10, "isEqualToString:", CFSTR("SHARED_LOCATION")))
    {
      v11 = 9;
    }
    else
    {
      v11 = 0xFFFFFFFFLL;
    }

    goto LABEL_38;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = objc_msgSend(v9, "intValue");
LABEL_38:
    objc_msgSend(a1, "setPinType:", v11);
  }

  if (a3)
    v12 = CFSTR("originalPlace");
  else
    v12 = CFSTR("original_place");
  objc_msgSend(v5, "objectForKeyedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v14 = [GEOPlace alloc];
    if ((a3 & 1) != 0)
      v15 = -[GEOPlace initWithJSON:](v14, "initWithJSON:", v13);
    else
      v15 = -[GEOPlace initWithDictionary:](v14, "initWithDictionary:", v13);
    v16 = (void *)v15;
    objc_msgSend(a1, "setOriginalPlace:", v15);

  }
  if (a3)
    v17 = CFSTR("mapLocation");
  else
    v17 = CFSTR("map_location");
  objc_msgSend(v5, "objectForKeyedSubscript:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v19 = [GEORPMapLocation alloc];
    if ((a3 & 1) != 0)
      v20 = -[GEORPMapLocation initWithJSON:](v19, "initWithJSON:", v18);
    else
      v20 = -[GEORPMapLocation initWithDictionary:](v19, "initWithDictionary:", v18);
    v21 = (void *)v20;
    objc_msgSend(a1, "setMapLocation:", v20);

  }
  if (a3)
    v22 = CFSTR("visibleTileSet");
  else
    v22 = CFSTR("visible_tile_set");
  objc_msgSend(v5, "objectForKeyedSubscript:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v148 = v5;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v171 = 0u;
    v172 = 0u;
    v169 = 0u;
    v170 = 0u;
    v24 = v23;
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v169, v180, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v170;
      do
      {
        for (i = 0; i != v26; ++i)
        {
          if (*(_QWORD *)v170 != v27)
            objc_enumerationMutation(v24);
          v29 = *(_QWORD *)(*((_QWORD *)&v169 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v30 = [GEORPVisibleTileSet alloc];
            if ((a3 & 1) != 0)
              v31 = -[GEORPVisibleTileSet initWithJSON:](v30, "initWithJSON:", v29);
            else
              v31 = -[GEORPVisibleTileSet initWithDictionary:](v30, "initWithDictionary:", v29);
            v32 = (void *)v31;
            objc_msgSend(a1, "addVisibleTileSet:", v31);

          }
        }
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v169, v180, 16);
      }
      while (v26);
    }

    v5 = v148;
  }

  if (a3)
    v33 = CFSTR("tileStateLog");
  else
    v33 = CFSTR("tile_state_log");
  objc_msgSend(v5, "objectForKeyedSubscript:", v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v35 = (void *)objc_msgSend(v34, "copy");
    objc_msgSend(a1, "setTileStateLog:", v35);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("place"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v37 = [GEOPDPlace alloc];
    if ((a3 & 1) != 0)
      v38 = -[GEOPDPlace initWithJSON:](v37, "initWithJSON:", v36);
    else
      v38 = -[GEOPDPlace initWithDictionary:](v37, "initWithDictionary:", v36);
    v39 = (void *)v38;
    objc_msgSend(a1, "setPlace:", v38);

  }
  if (a3)
    v40 = CFSTR("directionsRequest");
  else
    v40 = CFSTR("directions_request");
  objc_msgSend(v5, "objectForKeyedSubscript:", v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v167 = 0u;
    v168 = 0u;
    v165 = 0u;
    v166 = 0u;
    v42 = v41;
    v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v165, v179, 16);
    if (v43)
    {
      v44 = v43;
      v45 = *(_QWORD *)v166;
      do
      {
        for (j = 0; j != v44; ++j)
        {
          if (*(_QWORD *)v166 != v45)
            objc_enumerationMutation(v42);
          v47 = *(_QWORD *)(*((_QWORD *)&v165 + 1) + 8 * j);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v48 = [GEODirectionsRequest alloc];
            if ((a3 & 1) != 0)
              v49 = -[GEODirectionsRequest initWithJSON:](v48, "initWithJSON:", v47);
            else
              v49 = -[GEODirectionsRequest initWithDictionary:](v48, "initWithDictionary:", v47);
            v50 = (void *)v49;
            objc_msgSend(a1, "addDirectionsRequest:", v49);

          }
        }
        v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v165, v179, 16);
      }
      while (v44);
    }

    v5 = v148;
  }

  if (a3)
    v51 = CFSTR("directionsResponse");
  else
    v51 = CFSTR("directions_response");
  objc_msgSend(v5, "objectForKeyedSubscript:", v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v163 = 0u;
    v164 = 0u;
    v161 = 0u;
    v162 = 0u;
    v53 = v52;
    v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v161, v178, 16);
    if (v54)
    {
      v55 = v54;
      v56 = *(_QWORD *)v162;
      do
      {
        for (k = 0; k != v55; ++k)
        {
          if (*(_QWORD *)v162 != v56)
            objc_enumerationMutation(v53);
          v58 = *(_QWORD *)(*((_QWORD *)&v161 + 1) + 8 * k);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v59 = [GEODirectionsResponse alloc];
            if ((a3 & 1) != 0)
              v60 = -[GEODirectionsResponse initWithJSON:](v59, "initWithJSON:", v58);
            else
              v60 = -[GEODirectionsResponse initWithDictionary:](v59, "initWithDictionary:", v58);
            v61 = (void *)v60;
            objc_msgSend(a1, "addDirectionsResponse:", v60);

          }
        }
        v55 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v161, v178, 16);
      }
      while (v55);
    }

    v5 = v148;
  }

  if (a3)
    v62 = CFSTR("lastSearchString");
  else
    v62 = CFSTR("last_search_string");
  objc_msgSend(v5, "objectForKeyedSubscript:", v62);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v64 = (void *)objc_msgSend(v63, "copy");
    objc_msgSend(a1, "setLastSearchString:", v64);

  }
  if (a3)
    v65 = CFSTR("creationDate");
  else
    v65 = CFSTR("creation_date");
  objc_msgSend(v5, "objectForKeyedSubscript:", v65);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v66, "doubleValue");
    objc_msgSend(a1, "setCreationDate:");
  }

  if (a3)
    v67 = CFSTR("auxiliaryControl");
  else
    v67 = CFSTR("auxiliary_control");
  objc_msgSend(v5, "objectForKeyedSubscript:", v67);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v159 = 0u;
    v160 = 0u;
    v157 = 0u;
    v158 = 0u;
    v69 = v68;
    v70 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v157, v177, 16);
    if (v70)
    {
      v71 = v70;
      v72 = *(_QWORD *)v158;
      do
      {
        for (m = 0; m != v71; ++m)
        {
          if (*(_QWORD *)v158 != v72)
            objc_enumerationMutation(v69);
          v74 = *(_QWORD *)(*((_QWORD *)&v157 + 1) + 8 * m);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v75 = [GEORPAuxiliaryControl alloc];
            if ((a3 & 1) != 0)
              v76 = -[GEORPAuxiliaryControl initWithJSON:](v75, "initWithJSON:", v74);
            else
              v76 = -[GEORPAuxiliaryControl initWithDictionary:](v75, "initWithDictionary:", v74);
            v77 = (void *)v76;
            objc_msgSend(a1, "addAuxiliaryControl:", v76);

          }
        }
        v71 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v157, v177, 16);
      }
      while (v71);
    }

    v5 = v148;
  }

  if (a3)
    v78 = CFSTR("originatingAuxiliaryControlIndex");
  else
    v78 = CFSTR("originating_auxiliary_control_index");
  objc_msgSend(v5, "objectForKeyedSubscript:", v78);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setOriginatingAuxiliaryControlIndex:", objc_msgSend(v79, "unsignedLongLongValue"));

  if (a3)
    v80 = CFSTR("transitLineTileInfo");
  else
    v80 = CFSTR("transit_line_tile_info");
  objc_msgSend(v5, "objectForKeyedSubscript:", v80);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v82 = [GEORPTransitLineTileInfo alloc];
    if ((a3 & 1) != 0)
      v83 = -[GEORPTransitLineTileInfo initWithJSON:](v82, "initWithJSON:", v81);
    else
      v83 = -[GEORPTransitLineTileInfo initWithDictionary:](v82, "initWithDictionary:", v81);
    v84 = (void *)v83;
    objc_msgSend(a1, "setTransitLineTileInfo:", v83);

  }
  if (a3)
    v85 = CFSTR("placeInfo");
  else
    v85 = CFSTR("place_info");
  objc_msgSend(v5, "objectForKeyedSubscript:", v85);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v87 = [GEORPPlaceInfo alloc];
    if ((a3 & 1) != 0)
      v88 = -[GEORPPlaceInfo initWithJSON:](v87, "initWithJSON:", v86);
    else
      v88 = -[GEORPPlaceInfo initWithDictionary:](v87, "initWithDictionary:", v86);
    v89 = (void *)v88;
    objc_msgSend(a1, "setPlaceInfo:", v88);

  }
  if (a3)
    v90 = CFSTR("lastUserTypedSearchString");
  else
    v90 = CFSTR("last_user_typed_search_string");
  objc_msgSend(v5, "objectForKeyedSubscript:", v90);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v92 = (void *)objc_msgSend(v91, "copy");
    objc_msgSend(a1, "setLastUserTypedSearchString:", v92);

  }
  if (a3)
    v93 = CFSTR("deviceGmtOffset");
  else
    v93 = CFSTR("device_gmt_offset");
  objc_msgSend(v5, "objectForKeyedSubscript:", v93);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setDeviceGmtOffset:", objc_msgSend(v94, "intValue"));

  if (a3)
    v95 = CFSTR("currentAbAssignmentResponse");
  else
    v95 = CFSTR("current_ab_assignment_response");
  objc_msgSend(v5, "objectForKeyedSubscript:", v95);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v97 = [GEOABAssignmentResponse alloc];
    if ((a3 & 1) != 0)
      v98 = -[GEOABAssignmentResponse initWithJSON:](v97, "initWithJSON:", v96);
    else
      v98 = -[GEOABAssignmentResponse initWithDictionary:](v97, "initWithDictionary:", v96);
    v99 = (void *)v98;
    objc_msgSend(a1, "setCurrentAbAssignmentResponse:", v98);

  }
  if (a3)
    v100 = CFSTR("autocompleteSuggestionList");
  else
    v100 = CFSTR("autocomplete_suggestion_list");
  objc_msgSend(v5, "objectForKeyedSubscript:", v100);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v155 = 0u;
    v156 = 0u;
    v153 = 0u;
    v154 = 0u;
    v102 = v101;
    v103 = objc_msgSend(v102, "countByEnumeratingWithState:objects:count:", &v153, v176, 16);
    if (v103)
    {
      v104 = v103;
      v105 = *(_QWORD *)v154;
      do
      {
        for (n = 0; n != v104; ++n)
        {
          if (*(_QWORD *)v154 != v105)
            objc_enumerationMutation(v102);
          v107 = *(_QWORD *)(*((_QWORD *)&v153 + 1) + 8 * n);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v108 = [GEORPSuggestionList alloc];
            if ((a3 & 1) != 0)
              v109 = -[GEORPSuggestionList initWithJSON:](v108, "initWithJSON:", v107);
            else
              v109 = -[GEORPSuggestionList initWithDictionary:](v108, "initWithDictionary:", v107);
            v110 = (void *)v109;
            objc_msgSend(a1, "addAutocompleteSuggestionList:", v109);

          }
        }
        v104 = objc_msgSend(v102, "countByEnumeratingWithState:objects:count:", &v153, v176, 16);
      }
      while (v104);
    }

    v5 = v148;
  }

  if (a3)
    v111 = CFSTR("currentEnvironmentManifestUrls");
  else
    v111 = CFSTR("current_environment_manifest_urls");
  objc_msgSend(v5, "objectForKeyedSubscript:", v111);
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v113 = [GEORPCurrentEnvironmentManifestURLs alloc];
    if ((a3 & 1) != 0)
      v114 = -[GEORPCurrentEnvironmentManifestURLs initWithJSON:](v113, "initWithJSON:", v112);
    else
      v114 = -[GEORPCurrentEnvironmentManifestURLs initWithDictionary:](v113, "initWithDictionary:", v112);
    v115 = (void *)v114;
    objc_msgSend(a1, "setCurrentEnvironmentManifestUrls:", v114);

  }
  if (a3)
    v116 = CFSTR("directionsWaypointPlaceInfo");
  else
    v116 = CFSTR("directions_waypoint_place_info");
  objc_msgSend(v5, "objectForKeyedSubscript:", v116);
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v151 = 0u;
    v152 = 0u;
    v149 = 0u;
    v150 = 0u;
    v118 = v117;
    v119 = objc_msgSend(v118, "countByEnumeratingWithState:objects:count:", &v149, v175, 16);
    if (v119)
    {
      v120 = v119;
      v121 = *(_QWORD *)v150;
      do
      {
        for (ii = 0; ii != v120; ++ii)
        {
          if (*(_QWORD *)v150 != v121)
            objc_enumerationMutation(v118);
          v123 = *(_QWORD *)(*((_QWORD *)&v149 + 1) + 8 * ii);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v124 = [GEORPPlaceInfo alloc];
            if ((a3 & 1) != 0)
              v125 = -[GEORPPlaceInfo initWithJSON:](v124, "initWithJSON:", v123);
            else
              v125 = -[GEORPPlaceInfo initWithDictionary:](v124, "initWithDictionary:", v123);
            v126 = (void *)v125;
            objc_msgSend(a1, "addDirectionsWaypointPlaceInfo:", v125);

          }
        }
        v120 = objc_msgSend(v118, "countByEnumeratingWithState:objects:count:", &v149, v175, 16);
      }
      while (v120);
    }

    v5 = v148;
  }

  if (a3)
    v127 = CFSTR("servicesState");
  else
    v127 = CFSTR("services_state");
  objc_msgSend(v5, "objectForKeyedSubscript:", v127);
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v129 = [GEOServicesState alloc];
    if ((a3 & 1) != 0)
      v130 = -[GEOServicesState initWithJSON:](v129, "initWithJSON:", v128);
    else
      v130 = -[GEOServicesState initWithDictionary:](v129, "initWithDictionary:", v128);
    v131 = (void *)v130;
    objc_msgSend(a1, "setServicesState:", v130);

  }
  if (a3)
    v132 = CFSTR("personalizedMaps");
  else
    v132 = CFSTR("personalized_maps");
  objc_msgSend(v5, "objectForKeyedSubscript:", v132);
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v134 = [GEORPPersonalizedMaps alloc];
    if ((a3 & 1) != 0)
      v135 = -[GEORPPersonalizedMaps initWithJSON:](v134, "initWithJSON:", v133);
    else
      v135 = -[GEORPPersonalizedMaps initWithDictionary:](v134, "initWithDictionary:", v133);
    v136 = (void *)v135;
    objc_msgSend(a1, "setPersonalizedMaps:", v135);

  }
  if (a3)
    v137 = CFSTR("navigationSettings");
  else
    v137 = CFSTR("navigation_settings");
  objc_msgSend(v5, "objectForKeyedSubscript:", v137);
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v139 = [GEORPNavigationSettings alloc];
    if ((a3 & 1) != 0)
      v140 = -[GEORPNavigationSettings initWithJSON:](v139, "initWithJSON:", v138);
    else
      v140 = -[GEORPNavigationSettings initWithDictionary:](v139, "initWithDictionary:", v138);
    v141 = (void *)v140;
    objc_msgSend(a1, "setNavigationSettings:", v140);

  }
  if (a3)
    v142 = CFSTR("merchantLookupContext");
  else
    v142 = CFSTR("merchant_lookup_context");
  objc_msgSend(v5, "objectForKeyedSubscript:", v142);
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v144 = [GEORPMerchantLookupContext alloc];
    if ((a3 & 1) != 0)
      v145 = -[GEORPMerchantLookupContext initWithJSON:](v144, "initWithJSON:", v143);
    else
      v145 = -[GEORPMerchantLookupContext initWithDictionary:](v144, "initWithDictionary:", v143);
    v146 = (void *)v145;
    objc_msgSend(a1, "setMerchantLookupContext:", v145);

  }
  a1 = a1;

LABEL_257:
  return a1;
}

- (GEORPProblemContext)initWithJSON:(id)a3
{
  return (GEORPProblemContext *)-[GEORPProblemContext _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_1994;
    else
      v8 = (int *)&readAll__nonRecursiveTag_1995;
    GEORPProblemContextReadSpecified((uint64_t)self, (uint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEORPProblemContextCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPProblemContextIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPProblemContextReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  $C1B93A348CBC2642A5F7A481C310B991 flags;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t k;
  NSMutableArray *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t m;
  NSMutableArray *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t n;
  NSMutableArray *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t ii;
  PBDataReader *v31;
  void *v32;
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
  uint64_t v57;
  _BYTE v58[128];
  _BYTE v59[128];
  _BYTE v60[128];
  _BYTE v61[128];
  _BYTE v62[128];
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEORPProblemContextIsDirty((uint64_t)self) & 1) == 0)
  {
    v31 = self->_reader;
    objc_sync_enter(v31);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v32);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v31);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEORPProblemContext readAll:](self, "readAll:", 0);
    flags = self->_flags;
    if ((*(_BYTE *)&flags & 1) != 0)
    {
      v57 = 0;
      PBDataWriterPlaceMark();
      PBDataWriterWriteUint64Field();
      PBDataWriterWriteUint64Field();
      PBDataWriterRecallMark();
      flags = self->_flags;
    }
    if ((*(_BYTE *)&flags & 0x10) != 0)
      PBDataWriterWriteInt32Field();
    if (self->_originalPlace)
      PBDataWriterWriteSubmessage();
    if (self->_mapLocation)
      PBDataWriterWriteSubmessage();
    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    v7 = self->_visibleTileSets;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v53, v63, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v54;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v54 != v9)
            objc_enumerationMutation(v7);
          PBDataWriterWriteSubmessage();
        }
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v53, v63, 16);
      }
      while (v8);
    }

    if (self->_tileStateLog)
      PBDataWriterWriteStringField();
    if (self->_place)
      PBDataWriterWriteSubmessage();
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    v11 = self->_directionsRequests;
    v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v49, v62, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v50;
      do
      {
        for (j = 0; j != v12; ++j)
        {
          if (*(_QWORD *)v50 != v13)
            objc_enumerationMutation(v11);
          PBDataWriterWriteSubmessage();
        }
        v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v49, v62, 16);
      }
      while (v12);
    }

    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    v15 = self->_directionsResponses;
    v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v45, v61, 16);
    if (v16)
    {
      v17 = *(_QWORD *)v46;
      do
      {
        for (k = 0; k != v16; ++k)
        {
          if (*(_QWORD *)v46 != v17)
            objc_enumerationMutation(v15);
          PBDataWriterWriteSubmessage();
        }
        v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v45, v61, 16);
      }
      while (v16);
    }

    if (self->_lastSearchString)
      PBDataWriterWriteStringField();
    if ((*(_BYTE *)&self->_flags & 2) != 0)
      PBDataWriterWriteDoubleField();
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v19 = self->_auxiliaryControls;
    v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v41, v60, 16);
    if (v20)
    {
      v21 = *(_QWORD *)v42;
      do
      {
        for (m = 0; m != v20; ++m)
        {
          if (*(_QWORD *)v42 != v21)
            objc_enumerationMutation(v19);
          PBDataWriterWriteSubmessage();
        }
        v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v41, v60, 16);
      }
      while (v20);
    }

    if ((*(_BYTE *)&self->_flags & 4) != 0)
      PBDataWriterWriteUint64Field();
    if (self->_transitLineTileInfo)
      PBDataWriterWriteSubmessage();
    if (self->_placeInfo)
      PBDataWriterWriteSubmessage();
    if (self->_lastUserTypedSearchString)
      PBDataWriterWriteStringField();
    if ((*(_BYTE *)&self->_flags & 8) != 0)
      PBDataWriterWriteSint32Field();
    if (self->_currentAbAssignmentResponse)
      PBDataWriterWriteSubmessage();
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v23 = self->_autocompleteSuggestionLists;
    v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v37, v59, 16);
    if (v24)
    {
      v25 = *(_QWORD *)v38;
      do
      {
        for (n = 0; n != v24; ++n)
        {
          if (*(_QWORD *)v38 != v25)
            objc_enumerationMutation(v23);
          PBDataWriterWriteSubmessage();
        }
        v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v37, v59, 16);
      }
      while (v24);
    }

    if (self->_currentEnvironmentManifestUrls)
      PBDataWriterWriteSubmessage();
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v27 = self->_directionsWaypointPlaceInfos;
    v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v33, v58, 16);
    if (v28)
    {
      v29 = *(_QWORD *)v34;
      do
      {
        for (ii = 0; ii != v28; ++ii)
        {
          if (*(_QWORD *)v34 != v29)
            objc_enumerationMutation(v27);
          PBDataWriterWriteSubmessage();
        }
        v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v33, v58, 16);
      }
      while (v28);
    }

    if (self->_servicesState)
      PBDataWriterWriteSubmessage();
    if (self->_personalizedMaps)
      PBDataWriterWriteSubmessage();
    if (self->_navigationSettings)
      PBDataWriterWriteSubmessage();
    if (self->_merchantLookupContext)
      PBDataWriterWriteSubmessage();
  }

}

- (void)clearSensitiveFields:(unint64_t)a3
{
  GEORPProblemContextClearSensitiveFields((id *)&self->super.super.isa, a3, 1);
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
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
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
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v3 = a3;
  v43 = *MEMORY[0x1E0C80C00];
  -[GEORPProblemContext _readAutocompleteSuggestionLists]((uint64_t)self);
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v5 = self->_autocompleteSuggestionLists;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v35, v42, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v36;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v36 != v8)
        objc_enumerationMutation(v5);
      if ((objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * v9), "hasGreenTeaWithValue:", v3) & 1) != 0)
        goto LABEL_38;
      if (v7 == ++v9)
      {
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v35, v42, 16);
        if (v7)
          goto LABEL_3;
        break;
      }
    }
  }

  -[GEORPProblemContext _readDirectionsRequests]((uint64_t)self);
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v5 = self->_directionsRequests;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v31, v41, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v32;
LABEL_11:
    v13 = 0;
    while (1)
    {
      if (*(_QWORD *)v32 != v12)
        objc_enumerationMutation(v5);
      if ((objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * v13), "hasGreenTeaWithValue:", v3) & 1) != 0)
        goto LABEL_38;
      if (v11 == ++v13)
      {
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v31, v41, 16);
        if (v11)
          goto LABEL_11;
        break;
      }
    }
  }

  -[GEORPProblemContext _readDirectionsResponses]((uint64_t)self);
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v5 = self->_directionsResponses;
  v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v27, v40, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v28;
LABEL_19:
    v17 = 0;
    while (1)
    {
      if (*(_QWORD *)v28 != v16)
        objc_enumerationMutation(v5);
      if ((objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * v17), "hasGreenTeaWithValue:", v3) & 1) != 0)
        goto LABEL_38;
      if (v15 == ++v17)
      {
        v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v27, v40, 16);
        if (v15)
          goto LABEL_19;
        break;
      }
    }
  }

  -[GEORPProblemContext _readDirectionsWaypointPlaceInfos]((uint64_t)self);
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v5 = self->_directionsWaypointPlaceInfos;
  v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v23, v39, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v24;
LABEL_27:
    v21 = 0;
    while (1)
    {
      if (*(_QWORD *)v24 != v20)
        objc_enumerationMutation(v5);
      if ((objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v21), "hasGreenTeaWithValue:", v3, (_QWORD)v23) & 1) != 0)
        break;
      if (v19 == ++v21)
      {
        v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v23, v39, 16);
        if (v19)
          goto LABEL_27;
        goto LABEL_33;
      }
    }
LABEL_38:

    return 1;
  }
LABEL_33:

  -[GEORPProblemContext _readMapLocation]((uint64_t)self);
  if (!-[GEORPMapLocation hasGreenTeaWithValue:](self->_mapLocation, "hasGreenTeaWithValue:", v3))
  {
    -[GEORPProblemContext _readMerchantLookupContext]((uint64_t)self);
    if (!-[GEORPMerchantLookupContext hasGreenTeaWithValue:](self->_merchantLookupContext, "hasGreenTeaWithValue:", v3))
    {
      -[GEORPProblemContext _readOriginalPlace]((uint64_t)self);
      if (!-[GEOPlace hasGreenTeaWithValue:](self->_originalPlace, "hasGreenTeaWithValue:", v3))
      {
        -[GEORPProblemContext _readPlace]((uint64_t)self);
        if (!-[GEOPDPlace hasGreenTeaWithValue:](self->_place, "hasGreenTeaWithValue:", v3))
        {
          -[GEORPProblemContext _readPlaceInfo]((uint64_t)self);
          return -[GEORPPlaceInfo hasGreenTeaWithValue:](self->_placeInfo, "hasGreenTeaWithValue:", v3);
        }
      }
    }
  }
  return 1;
}

- (void)copyTo:(id)a3
{
  $C1B93A348CBC2642A5F7A481C310B991 flags;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t j;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t k;
  void *v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t m;
  void *v20;
  id *v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t n;
  void *v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t ii;
  void *v29;
  id *v30;
  id *v31;

  v31 = (id *)a3;
  -[GEORPProblemContext readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v31 + 1, self->_reader);
  *((_DWORD *)v31 + 52) = self->_readerMarkPos;
  *((_DWORD *)v31 + 53) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 1) != 0)
  {
    *((_OWORD *)v31 + 1) = self->_sessionId;
    *((_DWORD *)v31 + 57) |= 1u;
    flags = self->_flags;
  }
  if ((*(_BYTE *)&flags & 0x10) != 0)
  {
    *((_DWORD *)v31 + 56) = self->_pinType;
    *((_DWORD *)v31 + 57) |= 0x10u;
  }
  if (self->_originalPlace)
    objc_msgSend(v31, "setOriginalPlace:");
  if (self->_mapLocation)
    objc_msgSend(v31, "setMapLocation:");
  if (-[GEORPProblemContext visibleTileSetsCount](self, "visibleTileSetsCount"))
  {
    objc_msgSend(v31, "clearVisibleTileSets");
    v5 = -[GEORPProblemContext visibleTileSetsCount](self, "visibleTileSetsCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        -[GEORPProblemContext visibleTileSetAtIndex:](self, "visibleTileSetAtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "addVisibleTileSet:", v8);

      }
    }
  }
  if (self->_tileStateLog)
    objc_msgSend(v31, "setTileStateLog:");
  if (self->_place)
    objc_msgSend(v31, "setPlace:");
  if (-[GEORPProblemContext directionsRequestsCount](self, "directionsRequestsCount"))
  {
    objc_msgSend(v31, "clearDirectionsRequests");
    v9 = -[GEORPProblemContext directionsRequestsCount](self, "directionsRequestsCount");
    if (v9)
    {
      v10 = v9;
      for (j = 0; j != v10; ++j)
      {
        -[GEORPProblemContext directionsRequestAtIndex:](self, "directionsRequestAtIndex:", j);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "addDirectionsRequest:", v12);

      }
    }
  }
  if (-[GEORPProblemContext directionsResponsesCount](self, "directionsResponsesCount"))
  {
    objc_msgSend(v31, "clearDirectionsResponses");
    v13 = -[GEORPProblemContext directionsResponsesCount](self, "directionsResponsesCount");
    if (v13)
    {
      v14 = v13;
      for (k = 0; k != v14; ++k)
      {
        -[GEORPProblemContext directionsResponseAtIndex:](self, "directionsResponseAtIndex:", k);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "addDirectionsResponse:", v16);

      }
    }
  }
  if (self->_lastSearchString)
    objc_msgSend(v31, "setLastSearchString:");
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    v31[6] = *(id *)&self->_creationDate;
    *((_DWORD *)v31 + 57) |= 2u;
  }
  if (-[GEORPProblemContext auxiliaryControlsCount](self, "auxiliaryControlsCount"))
  {
    objc_msgSend(v31, "clearAuxiliaryControls");
    v17 = -[GEORPProblemContext auxiliaryControlsCount](self, "auxiliaryControlsCount");
    if (v17)
    {
      v18 = v17;
      for (m = 0; m != v18; ++m)
      {
        -[GEORPProblemContext auxiliaryControlAtIndex:](self, "auxiliaryControlAtIndex:", m);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "addAuxiliaryControl:", v20);

      }
    }
  }
  v21 = v31;
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    v31[18] = (id)self->_originatingAuxiliaryControlIndex;
    *((_DWORD *)v31 + 57) |= 4u;
  }
  if (self->_transitLineTileInfo)
  {
    objc_msgSend(v31, "setTransitLineTileInfo:");
    v21 = v31;
  }
  if (self->_placeInfo)
  {
    objc_msgSend(v31, "setPlaceInfo:");
    v21 = v31;
  }
  if (self->_lastUserTypedSearchString)
  {
    objc_msgSend(v31, "setLastUserTypedSearchString:");
    v21 = v31;
  }
  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
    *((_DWORD *)v21 + 55) = self->_deviceGmtOffset;
    *((_DWORD *)v21 + 57) |= 8u;
  }
  if (self->_currentAbAssignmentResponse)
    objc_msgSend(v31, "setCurrentAbAssignmentResponse:");
  if (-[GEORPProblemContext autocompleteSuggestionListsCount](self, "autocompleteSuggestionListsCount"))
  {
    objc_msgSend(v31, "clearAutocompleteSuggestionLists");
    v22 = -[GEORPProblemContext autocompleteSuggestionListsCount](self, "autocompleteSuggestionListsCount");
    if (v22)
    {
      v23 = v22;
      for (n = 0; n != v23; ++n)
      {
        -[GEORPProblemContext autocompleteSuggestionListAtIndex:](self, "autocompleteSuggestionListAtIndex:", n);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "addAutocompleteSuggestionList:", v25);

      }
    }
  }
  if (self->_currentEnvironmentManifestUrls)
    objc_msgSend(v31, "setCurrentEnvironmentManifestUrls:");
  if (-[GEORPProblemContext directionsWaypointPlaceInfosCount](self, "directionsWaypointPlaceInfosCount"))
  {
    objc_msgSend(v31, "clearDirectionsWaypointPlaceInfos");
    v26 = -[GEORPProblemContext directionsWaypointPlaceInfosCount](self, "directionsWaypointPlaceInfosCount");
    if (v26)
    {
      v27 = v26;
      for (ii = 0; ii != v27; ++ii)
      {
        -[GEORPProblemContext directionsWaypointPlaceInfoAtIndex:](self, "directionsWaypointPlaceInfoAtIndex:", ii);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "addDirectionsWaypointPlaceInfo:", v29);

      }
    }
  }
  if (self->_servicesState)
    objc_msgSend(v31, "setServicesState:");
  v30 = v31;
  if (self->_personalizedMaps)
  {
    objc_msgSend(v31, "setPersonalizedMaps:");
    v30 = v31;
  }
  if (self->_navigationSettings)
  {
    objc_msgSend(v31, "setNavigationSettings:");
    v30 = v31;
  }
  if (self->_merchantLookupContext)
  {
    objc_msgSend(v31, "setMerchantLookupContext:");
    v30 = v31;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  $C1B93A348CBC2642A5F7A481C310B991 flags;
  id v10;
  void *v11;
  id v12;
  void *v13;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  NSMutableArray *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  NSMutableArray *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t k;
  void *v32;
  uint64_t v33;
  void *v34;
  NSMutableArray *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t m;
  void *v39;
  id v40;
  void *v41;
  id v42;
  void *v43;
  uint64_t v44;
  void *v45;
  id v46;
  void *v47;
  NSMutableArray *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t n;
  void *v52;
  id v53;
  void *v54;
  NSMutableArray *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t ii;
  void *v59;
  id v60;
  void *v61;
  id v62;
  void *v63;
  id v64;
  void *v65;
  id v66;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  _BYTE v92[128];
  _BYTE v93[128];
  _BYTE v94[128];
  _BYTE v95[128];
  _BYTE v96[128];
  _BYTE v97[128];
  uint64_t v98;

  v98 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*((_BYTE *)&self->_flags + 3) & 2) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEORPProblemContextReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_58;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEORPProblemContext readAll:](self, "readAll:", 0);
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 1) != 0)
  {
    *(GEOSessionID *)(v5 + 16) = self->_sessionId;
    *(_DWORD *)(v5 + 228) |= 1u;
    flags = self->_flags;
  }
  if ((*(_BYTE *)&flags & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 224) = self->_pinType;
    *(_DWORD *)(v5 + 228) |= 0x10u;
  }
  v10 = -[GEOPlace copyWithZone:](self->_originalPlace, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 136);
  *(_QWORD *)(v5 + 136) = v10;

  v12 = -[GEORPMapLocation copyWithZone:](self->_mapLocation, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 112);
  *(_QWORD *)(v5 + 112) = v12;

  v90 = 0u;
  v91 = 0u;
  v88 = 0u;
  v89 = 0u;
  v14 = self->_visibleTileSets;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v88, v97, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v89;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v89 != v16)
          objc_enumerationMutation(v14);
        v18 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v88 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addVisibleTileSet:", v18);

      }
      v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v88, v97, 16);
    }
    while (v15);
  }

  v19 = -[NSString copyWithZone:](self->_tileStateLog, "copyWithZone:", a3);
  v20 = *(void **)(v5 + 184);
  *(_QWORD *)(v5 + 184) = v19;

  v21 = -[GEOPDPlace copyWithZone:](self->_place, "copyWithZone:", a3);
  v22 = *(void **)(v5 + 168);
  *(_QWORD *)(v5 + 168) = v21;

  v86 = 0u;
  v87 = 0u;
  v84 = 0u;
  v85 = 0u;
  v23 = self->_directionsRequests;
  v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v84, v96, 16);
  if (v24)
  {
    v25 = *(_QWORD *)v85;
    do
    {
      for (j = 0; j != v24; ++j)
      {
        if (*(_QWORD *)v85 != v25)
          objc_enumerationMutation(v23);
        v27 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v84 + 1) + 8 * j), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addDirectionsRequest:", v27);

      }
      v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v84, v96, 16);
    }
    while (v24);
  }

  v82 = 0u;
  v83 = 0u;
  v80 = 0u;
  v81 = 0u;
  v28 = self->_directionsResponses;
  v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v80, v95, 16);
  if (v29)
  {
    v30 = *(_QWORD *)v81;
    do
    {
      for (k = 0; k != v29; ++k)
      {
        if (*(_QWORD *)v81 != v30)
          objc_enumerationMutation(v28);
        v32 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v80 + 1) + 8 * k), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addDirectionsResponse:", v32);

      }
      v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v80, v95, 16);
    }
    while (v29);
  }

  v33 = -[NSString copyWithZone:](self->_lastSearchString, "copyWithZone:", a3);
  v34 = *(void **)(v5 + 96);
  *(_QWORD *)(v5 + 96) = v33;

  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    *(double *)(v5 + 48) = self->_creationDate;
    *(_DWORD *)(v5 + 228) |= 2u;
  }
  v78 = 0u;
  v79 = 0u;
  v76 = 0u;
  v77 = 0u;
  v35 = self->_auxiliaryControls;
  v36 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v35, "countByEnumeratingWithState:objects:count:", &v76, v94, 16);
  if (v36)
  {
    v37 = *(_QWORD *)v77;
    do
    {
      for (m = 0; m != v36; ++m)
      {
        if (*(_QWORD *)v77 != v37)
          objc_enumerationMutation(v35);
        v39 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v76 + 1) + 8 * m), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addAuxiliaryControl:", v39);

      }
      v36 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v35, "countByEnumeratingWithState:objects:count:", &v76, v94, 16);
    }
    while (v36);
  }

  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    *(_QWORD *)(v5 + 144) = self->_originatingAuxiliaryControlIndex;
    *(_DWORD *)(v5 + 228) |= 4u;
  }
  v40 = -[GEORPTransitLineTileInfo copyWithZone:](self->_transitLineTileInfo, "copyWithZone:", a3);
  v41 = *(void **)(v5 + 192);
  *(_QWORD *)(v5 + 192) = v40;

  v42 = -[GEORPPlaceInfo copyWithZone:](self->_placeInfo, "copyWithZone:", a3);
  v43 = *(void **)(v5 + 160);
  *(_QWORD *)(v5 + 160) = v42;

  v44 = -[NSString copyWithZone:](self->_lastUserTypedSearchString, "copyWithZone:", a3);
  v45 = *(void **)(v5 + 104);
  *(_QWORD *)(v5 + 104) = v44;

  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
    *(_DWORD *)(v5 + 220) = self->_deviceGmtOffset;
    *(_DWORD *)(v5 + 228) |= 8u;
  }
  v46 = -[GEOABAssignmentResponse copyWithZone:](self->_currentAbAssignmentResponse, "copyWithZone:", a3);
  v47 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v46;

  v74 = 0u;
  v75 = 0u;
  v72 = 0u;
  v73 = 0u;
  v48 = self->_autocompleteSuggestionLists;
  v49 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v48, "countByEnumeratingWithState:objects:count:", &v72, v93, 16);
  if (v49)
  {
    v50 = *(_QWORD *)v73;
    do
    {
      for (n = 0; n != v49; ++n)
      {
        if (*(_QWORD *)v73 != v50)
          objc_enumerationMutation(v48);
        v52 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v72 + 1) + 8 * n), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addAutocompleteSuggestionList:", v52);

      }
      v49 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v48, "countByEnumeratingWithState:objects:count:", &v72, v93, 16);
    }
    while (v49);
  }

  v53 = -[GEORPCurrentEnvironmentManifestURLs copyWithZone:](self->_currentEnvironmentManifestUrls, "copyWithZone:", a3);
  v54 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v53;

  v70 = 0u;
  v71 = 0u;
  v68 = 0u;
  v69 = 0u;
  v55 = self->_directionsWaypointPlaceInfos;
  v56 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v55, "countByEnumeratingWithState:objects:count:", &v68, v92, 16);
  if (v56)
  {
    v57 = *(_QWORD *)v69;
    do
    {
      for (ii = 0; ii != v56; ++ii)
      {
        if (*(_QWORD *)v69 != v57)
          objc_enumerationMutation(v55);
        v59 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v68 + 1) + 8 * ii), "copyWithZone:", a3, (_QWORD)v68);
        objc_msgSend((id)v5, "addDirectionsWaypointPlaceInfo:", v59);

      }
      v56 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v55, "countByEnumeratingWithState:objects:count:", &v68, v92, 16);
    }
    while (v56);
  }

  v60 = -[GEOServicesState copyWithZone:](self->_servicesState, "copyWithZone:", a3);
  v61 = *(void **)(v5 + 176);
  *(_QWORD *)(v5 + 176) = v60;

  v62 = -[GEORPPersonalizedMaps copyWithZone:](self->_personalizedMaps, "copyWithZone:", a3);
  v63 = *(void **)(v5 + 152);
  *(_QWORD *)(v5 + 152) = v62;

  v64 = -[GEORPNavigationSettings copyWithZone:](self->_navigationSettings, "copyWithZone:", a3);
  v65 = *(void **)(v5 + 128);
  *(_QWORD *)(v5 + 128) = v64;

  v66 = -[GEORPMerchantLookupContext copyWithZone:](self->_merchantLookupContext, "copyWithZone:", a3);
  v8 = *(id *)(v5 + 120);
  *(_QWORD *)(v5 + 120) = v66;
LABEL_58:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  $C1B93A348CBC2642A5F7A481C310B991 flags;
  int v6;
  GEOPlace *originalPlace;
  GEORPMapLocation *mapLocation;
  NSMutableArray *visibleTileSets;
  NSString *tileStateLog;
  GEOPDPlace *place;
  NSMutableArray *directionsRequests;
  NSMutableArray *directionsResponses;
  NSString *lastSearchString;
  $C1B93A348CBC2642A5F7A481C310B991 v16;
  int v17;
  NSMutableArray *auxiliaryControls;
  GEORPTransitLineTileInfo *transitLineTileInfo;
  GEORPPlaceInfo *placeInfo;
  NSString *lastUserTypedSearchString;
  int v22;
  GEOABAssignmentResponse *currentAbAssignmentResponse;
  NSMutableArray *autocompleteSuggestionLists;
  GEORPCurrentEnvironmentManifestURLs *currentEnvironmentManifestUrls;
  NSMutableArray *directionsWaypointPlaceInfos;
  GEOServicesState *servicesState;
  GEORPPersonalizedMaps *personalizedMaps;
  GEORPNavigationSettings *navigationSettings;
  GEORPMerchantLookupContext *merchantLookupContext;
  char v31;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_72;
  -[GEORPProblemContext readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  flags = self->_flags;
  v6 = *((_DWORD *)v4 + 57);
  if ((*(_BYTE *)&flags & 1) != 0)
  {
    if ((v6 & 1) == 0)
      goto LABEL_72;
    if (self->_sessionId._high != *((_QWORD *)v4 + 2) || self->_sessionId._low != *((_QWORD *)v4 + 3))
      goto LABEL_72;
  }
  else if ((v6 & 1) != 0)
  {
    goto LABEL_72;
  }
  if ((*(_BYTE *)&flags & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_pinType != *((_DWORD *)v4 + 56))
      goto LABEL_72;
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_72;
  }
  originalPlace = self->_originalPlace;
  if ((unint64_t)originalPlace | *((_QWORD *)v4 + 17) && !-[GEOPlace isEqual:](originalPlace, "isEqual:"))
    goto LABEL_72;
  mapLocation = self->_mapLocation;
  if ((unint64_t)mapLocation | *((_QWORD *)v4 + 14))
  {
    if (!-[GEORPMapLocation isEqual:](mapLocation, "isEqual:"))
      goto LABEL_72;
  }
  visibleTileSets = self->_visibleTileSets;
  if ((unint64_t)visibleTileSets | *((_QWORD *)v4 + 25))
  {
    if (!-[NSMutableArray isEqual:](visibleTileSets, "isEqual:"))
      goto LABEL_72;
  }
  tileStateLog = self->_tileStateLog;
  if ((unint64_t)tileStateLog | *((_QWORD *)v4 + 23))
  {
    if (!-[NSString isEqual:](tileStateLog, "isEqual:"))
      goto LABEL_72;
  }
  place = self->_place;
  if ((unint64_t)place | *((_QWORD *)v4 + 21))
  {
    if (!-[GEOPDPlace isEqual:](place, "isEqual:"))
      goto LABEL_72;
  }
  directionsRequests = self->_directionsRequests;
  if ((unint64_t)directionsRequests | *((_QWORD *)v4 + 9))
  {
    if (!-[NSMutableArray isEqual:](directionsRequests, "isEqual:"))
      goto LABEL_72;
  }
  directionsResponses = self->_directionsResponses;
  if ((unint64_t)directionsResponses | *((_QWORD *)v4 + 10))
  {
    if (!-[NSMutableArray isEqual:](directionsResponses, "isEqual:"))
      goto LABEL_72;
  }
  lastSearchString = self->_lastSearchString;
  if ((unint64_t)lastSearchString | *((_QWORD *)v4 + 12))
  {
    if (!-[NSString isEqual:](lastSearchString, "isEqual:"))
      goto LABEL_72;
  }
  v16 = self->_flags;
  v17 = *((_DWORD *)v4 + 57);
  if ((*(_BYTE *)&v16 & 2) != 0)
  {
    if ((v17 & 2) == 0 || self->_creationDate != *((double *)v4 + 6))
      goto LABEL_72;
  }
  else if ((v17 & 2) != 0)
  {
    goto LABEL_72;
  }
  auxiliaryControls = self->_auxiliaryControls;
  if ((unint64_t)auxiliaryControls | *((_QWORD *)v4 + 5))
  {
    if (!-[NSMutableArray isEqual:](auxiliaryControls, "isEqual:"))
    {
LABEL_72:
      v31 = 0;
      goto LABEL_73;
    }
    v16 = self->_flags;
    v17 = *((_DWORD *)v4 + 57);
  }
  if ((*(_BYTE *)&v16 & 4) != 0)
  {
    if ((v17 & 4) == 0 || self->_originatingAuxiliaryControlIndex != *((_QWORD *)v4 + 18))
      goto LABEL_72;
  }
  else if ((v17 & 4) != 0)
  {
    goto LABEL_72;
  }
  transitLineTileInfo = self->_transitLineTileInfo;
  if ((unint64_t)transitLineTileInfo | *((_QWORD *)v4 + 24)
    && !-[GEORPTransitLineTileInfo isEqual:](transitLineTileInfo, "isEqual:"))
  {
    goto LABEL_72;
  }
  placeInfo = self->_placeInfo;
  if ((unint64_t)placeInfo | *((_QWORD *)v4 + 20))
  {
    if (!-[GEORPPlaceInfo isEqual:](placeInfo, "isEqual:"))
      goto LABEL_72;
  }
  lastUserTypedSearchString = self->_lastUserTypedSearchString;
  if ((unint64_t)lastUserTypedSearchString | *((_QWORD *)v4 + 13))
  {
    if (!-[NSString isEqual:](lastUserTypedSearchString, "isEqual:"))
      goto LABEL_72;
  }
  v22 = *((_DWORD *)v4 + 57);
  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
    if ((v22 & 8) == 0 || self->_deviceGmtOffset != *((_DWORD *)v4 + 55))
      goto LABEL_72;
  }
  else if ((v22 & 8) != 0)
  {
    goto LABEL_72;
  }
  currentAbAssignmentResponse = self->_currentAbAssignmentResponse;
  if ((unint64_t)currentAbAssignmentResponse | *((_QWORD *)v4 + 7)
    && !-[GEOABAssignmentResponse isEqual:](currentAbAssignmentResponse, "isEqual:"))
  {
    goto LABEL_72;
  }
  autocompleteSuggestionLists = self->_autocompleteSuggestionLists;
  if ((unint64_t)autocompleteSuggestionLists | *((_QWORD *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](autocompleteSuggestionLists, "isEqual:"))
      goto LABEL_72;
  }
  currentEnvironmentManifestUrls = self->_currentEnvironmentManifestUrls;
  if ((unint64_t)currentEnvironmentManifestUrls | *((_QWORD *)v4 + 8))
  {
    if (!-[GEORPCurrentEnvironmentManifestURLs isEqual:](currentEnvironmentManifestUrls, "isEqual:"))
      goto LABEL_72;
  }
  directionsWaypointPlaceInfos = self->_directionsWaypointPlaceInfos;
  if ((unint64_t)directionsWaypointPlaceInfos | *((_QWORD *)v4 + 11))
  {
    if (!-[NSMutableArray isEqual:](directionsWaypointPlaceInfos, "isEqual:"))
      goto LABEL_72;
  }
  servicesState = self->_servicesState;
  if ((unint64_t)servicesState | *((_QWORD *)v4 + 22))
  {
    if (!-[GEOServicesState isEqual:](servicesState, "isEqual:"))
      goto LABEL_72;
  }
  personalizedMaps = self->_personalizedMaps;
  if ((unint64_t)personalizedMaps | *((_QWORD *)v4 + 19))
  {
    if (!-[GEORPPersonalizedMaps isEqual:](personalizedMaps, "isEqual:"))
      goto LABEL_72;
  }
  navigationSettings = self->_navigationSettings;
  if ((unint64_t)navigationSettings | *((_QWORD *)v4 + 16))
  {
    if (!-[GEORPNavigationSettings isEqual:](navigationSettings, "isEqual:"))
      goto LABEL_72;
  }
  merchantLookupContext = self->_merchantLookupContext;
  if ((unint64_t)merchantLookupContext | *((_QWORD *)v4 + 15))
    v31 = -[GEORPMerchantLookupContext isEqual:](merchantLookupContext, "isEqual:");
  else
    v31 = 1;
LABEL_73:

  return v31;
}

- (unint64_t)hash
{
  $C1B93A348CBC2642A5F7A481C310B991 flags;
  NSUInteger v4;
  unint64_t v5;
  double creationDate;
  double v7;
  long double v8;
  double v9;
  double v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  NSUInteger v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  NSUInteger v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;

  -[GEORPProblemContext readAll:](self, "readAll:", 1);
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 1) != 0)
  {
    v37 = PBHashBytes();
    flags = self->_flags;
  }
  else
  {
    v37 = 0;
  }
  if ((*(_BYTE *)&flags & 0x10) != 0)
    v36 = 2654435761 * self->_pinType;
  else
    v36 = 0;
  v35 = -[GEOPlace hash](self->_originalPlace, "hash");
  v34 = -[GEORPMapLocation hash](self->_mapLocation, "hash");
  v33 = -[NSMutableArray hash](self->_visibleTileSets, "hash");
  v32 = -[NSString hash](self->_tileStateLog, "hash");
  v31 = -[GEOPDPlace hash](self->_place, "hash");
  v30 = -[NSMutableArray hash](self->_directionsRequests, "hash");
  v29 = -[NSMutableArray hash](self->_directionsResponses, "hash");
  v4 = -[NSString hash](self->_lastSearchString, "hash");
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    creationDate = self->_creationDate;
    v7 = -creationDate;
    if (creationDate >= 0.0)
      v7 = self->_creationDate;
    v8 = floor(v7 + 0.5);
    v9 = (v7 - v8) * 1.84467441e19;
    v10 = fmod(v8, 1.84467441e19);
    v11 = 2654435761u * (unint64_t)v10;
    v12 = v11 + (unint64_t)v9;
    if (v9 <= 0.0)
      v12 = 2654435761u * (unint64_t)v10;
    v13 = v11 - (unint64_t)fabs(v9);
    if (v9 < 0.0)
      v5 = v13;
    else
      v5 = v12;
  }
  else
  {
    v5 = 0;
  }
  v14 = -[NSMutableArray hash](self->_auxiliaryControls, "hash");
  if ((*(_BYTE *)&self->_flags & 4) != 0)
    v15 = 2654435761u * self->_originatingAuxiliaryControlIndex;
  else
    v15 = 0;
  v16 = -[GEORPTransitLineTileInfo hash](self->_transitLineTileInfo, "hash");
  v17 = -[GEORPPlaceInfo hash](self->_placeInfo, "hash");
  v18 = -[NSString hash](self->_lastUserTypedSearchString, "hash");
  if ((*(_BYTE *)&self->_flags & 8) != 0)
    v19 = 2654435761 * self->_deviceGmtOffset;
  else
    v19 = 0;
  v20 = v36 ^ v37 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v4 ^ v5 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19;
  v21 = -[GEOABAssignmentResponse hash](self->_currentAbAssignmentResponse, "hash");
  v22 = v21 ^ -[NSMutableArray hash](self->_autocompleteSuggestionLists, "hash");
  v23 = v22 ^ -[GEORPCurrentEnvironmentManifestURLs hash](self->_currentEnvironmentManifestUrls, "hash");
  v24 = v23 ^ -[NSMutableArray hash](self->_directionsWaypointPlaceInfos, "hash");
  v25 = v24 ^ -[GEOServicesState hash](self->_servicesState, "hash");
  v26 = v20 ^ v25 ^ -[GEORPPersonalizedMaps hash](self->_personalizedMaps, "hash");
  v27 = -[GEORPNavigationSettings hash](self->_navigationSettings, "hash");
  return v26 ^ v27 ^ -[GEORPMerchantLookupContext hash](self->_merchantLookupContext, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  int v5;
  GEOPlace *originalPlace;
  uint64_t v7;
  GEORPMapLocation *mapLocation;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  GEOPDPlace *place;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t k;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t m;
  GEORPTransitLineTileInfo *transitLineTileInfo;
  uint64_t v33;
  GEORPPlaceInfo *placeInfo;
  uint64_t v35;
  GEOABAssignmentResponse *currentAbAssignmentResponse;
  uint64_t v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t n;
  GEORPCurrentEnvironmentManifestURLs *currentEnvironmentManifestUrls;
  uint64_t v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t ii;
  GEOServicesState *servicesState;
  uint64_t v51;
  GEORPPersonalizedMaps *personalizedMaps;
  uint64_t v53;
  GEORPNavigationSettings *navigationSettings;
  uint64_t v55;
  GEORPMerchantLookupContext *merchantLookupContext;
  uint64_t v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  _BYTE v82[128];
  _BYTE v83[128];
  _BYTE v84[128];
  _BYTE v85[128];
  _BYTE v86[128];
  _BYTE v87[128];
  uint64_t v88;

  v88 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  v5 = *((_DWORD *)v4 + 57);
  if ((v5 & 1) != 0)
  {
    self->_sessionId = (GEOSessionID)*((_OWORD *)v4 + 1);
    *(_DWORD *)&self->_flags |= 1u;
    v5 = *((_DWORD *)v4 + 57);
  }
  if ((v5 & 0x10) != 0)
  {
    self->_pinType = *((_DWORD *)v4 + 56);
    *(_DWORD *)&self->_flags |= 0x10u;
  }
  originalPlace = self->_originalPlace;
  v7 = *((_QWORD *)v4 + 17);
  if (originalPlace)
  {
    if (v7)
      -[GEOPlace mergeFrom:](originalPlace, "mergeFrom:");
  }
  else if (v7)
  {
    -[GEORPProblemContext setOriginalPlace:](self, "setOriginalPlace:");
  }
  mapLocation = self->_mapLocation;
  v9 = *((_QWORD *)v4 + 14);
  if (mapLocation)
  {
    if (v9)
      -[GEORPMapLocation mergeFrom:](mapLocation, "mergeFrom:");
  }
  else if (v9)
  {
    -[GEORPProblemContext setMapLocation:](self, "setMapLocation:");
  }
  v80 = 0u;
  v81 = 0u;
  v78 = 0u;
  v79 = 0u;
  v10 = *((id *)v4 + 25);
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v78, v87, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v79;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v79 != v13)
          objc_enumerationMutation(v10);
        -[GEORPProblemContext addVisibleTileSet:](self, "addVisibleTileSet:", *(_QWORD *)(*((_QWORD *)&v78 + 1) + 8 * i));
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v78, v87, 16);
    }
    while (v12);
  }

  if (*((_QWORD *)v4 + 23))
    -[GEORPProblemContext setTileStateLog:](self, "setTileStateLog:");
  place = self->_place;
  v16 = *((_QWORD *)v4 + 21);
  if (place)
  {
    if (v16)
      -[GEOPDPlace mergeFrom:](place, "mergeFrom:");
  }
  else if (v16)
  {
    -[GEORPProblemContext setPlace:](self, "setPlace:");
  }
  v76 = 0u;
  v77 = 0u;
  v74 = 0u;
  v75 = 0u;
  v17 = *((id *)v4 + 9);
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v74, v86, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v75;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v75 != v20)
          objc_enumerationMutation(v17);
        -[GEORPProblemContext addDirectionsRequest:](self, "addDirectionsRequest:", *(_QWORD *)(*((_QWORD *)&v74 + 1) + 8 * j));
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v74, v86, 16);
    }
    while (v19);
  }

  v72 = 0u;
  v73 = 0u;
  v70 = 0u;
  v71 = 0u;
  v22 = *((id *)v4 + 10);
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v70, v85, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v71;
    do
    {
      for (k = 0; k != v24; ++k)
      {
        if (*(_QWORD *)v71 != v25)
          objc_enumerationMutation(v22);
        -[GEORPProblemContext addDirectionsResponse:](self, "addDirectionsResponse:", *(_QWORD *)(*((_QWORD *)&v70 + 1) + 8 * k));
      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v70, v85, 16);
    }
    while (v24);
  }

  if (*((_QWORD *)v4 + 12))
    -[GEORPProblemContext setLastSearchString:](self, "setLastSearchString:");
  if ((*((_BYTE *)v4 + 228) & 2) != 0)
  {
    self->_creationDate = *((double *)v4 + 6);
    *(_DWORD *)&self->_flags |= 2u;
  }
  v68 = 0u;
  v69 = 0u;
  v66 = 0u;
  v67 = 0u;
  v27 = *((id *)v4 + 5);
  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v66, v84, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v67;
    do
    {
      for (m = 0; m != v29; ++m)
      {
        if (*(_QWORD *)v67 != v30)
          objc_enumerationMutation(v27);
        -[GEORPProblemContext addAuxiliaryControl:](self, "addAuxiliaryControl:", *(_QWORD *)(*((_QWORD *)&v66 + 1) + 8 * m));
      }
      v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v66, v84, 16);
    }
    while (v29);
  }

  if ((*((_BYTE *)v4 + 228) & 4) != 0)
  {
    self->_originatingAuxiliaryControlIndex = *((_QWORD *)v4 + 18);
    *(_DWORD *)&self->_flags |= 4u;
  }
  transitLineTileInfo = self->_transitLineTileInfo;
  v33 = *((_QWORD *)v4 + 24);
  if (transitLineTileInfo)
  {
    if (v33)
      -[GEORPTransitLineTileInfo mergeFrom:](transitLineTileInfo, "mergeFrom:");
  }
  else if (v33)
  {
    -[GEORPProblemContext setTransitLineTileInfo:](self, "setTransitLineTileInfo:");
  }
  placeInfo = self->_placeInfo;
  v35 = *((_QWORD *)v4 + 20);
  if (placeInfo)
  {
    if (v35)
      -[GEORPPlaceInfo mergeFrom:](placeInfo, "mergeFrom:");
  }
  else if (v35)
  {
    -[GEORPProblemContext setPlaceInfo:](self, "setPlaceInfo:");
  }
  if (*((_QWORD *)v4 + 13))
    -[GEORPProblemContext setLastUserTypedSearchString:](self, "setLastUserTypedSearchString:");
  if ((*((_BYTE *)v4 + 228) & 8) != 0)
  {
    self->_deviceGmtOffset = *((_DWORD *)v4 + 55);
    *(_DWORD *)&self->_flags |= 8u;
  }
  currentAbAssignmentResponse = self->_currentAbAssignmentResponse;
  v37 = *((_QWORD *)v4 + 7);
  if (currentAbAssignmentResponse)
  {
    if (v37)
      -[GEOABAssignmentResponse mergeFrom:](currentAbAssignmentResponse, "mergeFrom:");
  }
  else if (v37)
  {
    -[GEORPProblemContext setCurrentAbAssignmentResponse:](self, "setCurrentAbAssignmentResponse:");
  }
  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  v38 = *((id *)v4 + 4);
  v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v62, v83, 16);
  if (v39)
  {
    v40 = v39;
    v41 = *(_QWORD *)v63;
    do
    {
      for (n = 0; n != v40; ++n)
      {
        if (*(_QWORD *)v63 != v41)
          objc_enumerationMutation(v38);
        -[GEORPProblemContext addAutocompleteSuggestionList:](self, "addAutocompleteSuggestionList:", *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * n));
      }
      v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v62, v83, 16);
    }
    while (v40);
  }

  currentEnvironmentManifestUrls = self->_currentEnvironmentManifestUrls;
  v44 = *((_QWORD *)v4 + 8);
  if (currentEnvironmentManifestUrls)
  {
    if (v44)
      -[GEORPCurrentEnvironmentManifestURLs mergeFrom:](currentEnvironmentManifestUrls, "mergeFrom:");
  }
  else if (v44)
  {
    -[GEORPProblemContext setCurrentEnvironmentManifestUrls:](self, "setCurrentEnvironmentManifestUrls:");
  }
  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  v45 = *((id *)v4 + 11);
  v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v58, v82, 16);
  if (v46)
  {
    v47 = v46;
    v48 = *(_QWORD *)v59;
    do
    {
      for (ii = 0; ii != v47; ++ii)
      {
        if (*(_QWORD *)v59 != v48)
          objc_enumerationMutation(v45);
        -[GEORPProblemContext addDirectionsWaypointPlaceInfo:](self, "addDirectionsWaypointPlaceInfo:", *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * ii), (_QWORD)v58);
      }
      v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v58, v82, 16);
    }
    while (v47);
  }

  servicesState = self->_servicesState;
  v51 = *((_QWORD *)v4 + 22);
  if (servicesState)
  {
    if (v51)
      -[GEOServicesState mergeFrom:](servicesState, "mergeFrom:");
  }
  else if (v51)
  {
    -[GEORPProblemContext setServicesState:](self, "setServicesState:");
  }
  personalizedMaps = self->_personalizedMaps;
  v53 = *((_QWORD *)v4 + 19);
  if (personalizedMaps)
  {
    if (v53)
      -[GEORPPersonalizedMaps mergeFrom:](personalizedMaps, "mergeFrom:");
  }
  else if (v53)
  {
    -[GEORPProblemContext setPersonalizedMaps:](self, "setPersonalizedMaps:");
  }
  navigationSettings = self->_navigationSettings;
  v55 = *((_QWORD *)v4 + 16);
  if (navigationSettings)
  {
    if (v55)
      -[GEORPNavigationSettings mergeFrom:](navigationSettings, "mergeFrom:");
  }
  else if (v55)
  {
    -[GEORPProblemContext setNavigationSettings:](self, "setNavigationSettings:");
  }
  merchantLookupContext = self->_merchantLookupContext;
  v57 = *((_QWORD *)v4 + 15);
  if (merchantLookupContext)
  {
    if (v57)
      -[GEORPMerchantLookupContext mergeFrom:](merchantLookupContext, "mergeFrom:");
  }
  else if (v57)
  {
    -[GEORPProblemContext setMerchantLookupContext:](self, "setMerchantLookupContext:");
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visibleTileSets, 0);
  objc_storeStrong((id *)&self->_transitLineTileInfo, 0);
  objc_storeStrong((id *)&self->_tileStateLog, 0);
  objc_storeStrong((id *)&self->_servicesState, 0);
  objc_storeStrong((id *)&self->_place, 0);
  objc_storeStrong((id *)&self->_placeInfo, 0);
  objc_storeStrong((id *)&self->_personalizedMaps, 0);
  objc_storeStrong((id *)&self->_originalPlace, 0);
  objc_storeStrong((id *)&self->_navigationSettings, 0);
  objc_storeStrong((id *)&self->_merchantLookupContext, 0);
  objc_storeStrong((id *)&self->_mapLocation, 0);
  objc_storeStrong((id *)&self->_lastUserTypedSearchString, 0);
  objc_storeStrong((id *)&self->_lastSearchString, 0);
  objc_storeStrong((id *)&self->_directionsWaypointPlaceInfos, 0);
  objc_storeStrong((id *)&self->_directionsResponses, 0);
  objc_storeStrong((id *)&self->_directionsRequests, 0);
  objc_storeStrong((id *)&self->_currentEnvironmentManifestUrls, 0);
  objc_storeStrong((id *)&self->_currentAbAssignmentResponse, 0);
  objc_storeStrong((id *)&self->_auxiliaryControls, 0);
  objc_storeStrong((id *)&self->_autocompleteSuggestionLists, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
