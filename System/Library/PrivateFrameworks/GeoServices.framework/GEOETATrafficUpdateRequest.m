@implementation GEOETATrafficUpdateRequest

- (GEOETATrafficUpdateRequest)init
{
  GEOETATrafficUpdateRequest *v2;
  GEOETATrafficUpdateRequest *v3;
  GEOETATrafficUpdateRequest *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOETATrafficUpdateRequest;
  v2 = -[GEOETATrafficUpdateRequest init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOETATrafficUpdateRequest)initWithData:(id)a3
{
  GEOETATrafficUpdateRequest *v3;
  GEOETATrafficUpdateRequest *v4;
  GEOETATrafficUpdateRequest *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOETATrafficUpdateRequest;
  v3 = -[GEOETATrafficUpdateRequest initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readCurrentUserLocation
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 256));
    if ((*(_BYTE *)(a1 + 289) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOETATrafficUpdateRequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCurrentUserLocation_tags_1);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 256));
  }
}

- (BOOL)hasCurrentUserLocation
{
  -[GEOETATrafficUpdateRequest _readCurrentUserLocation]((uint64_t)self);
  return self->_currentUserLocation != 0;
}

- (GEOLocation)currentUserLocation
{
  -[GEOETATrafficUpdateRequest _readCurrentUserLocation]((uint64_t)self);
  return self->_currentUserLocation;
}

- (void)setCurrentUserLocation:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x800008000uLL;
  objc_storeStrong((id *)&self->_currentUserLocation, a3);
}

- (void)_readRouteAttributes
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 256));
    if ((*(_BYTE *)(a1 + 290) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOETATrafficUpdateRequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRouteAttributes_tags_1);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 256));
  }
}

- (BOOL)hasRouteAttributes
{
  -[GEOETATrafficUpdateRequest _readRouteAttributes]((uint64_t)self);
  return self->_routeAttributes != 0;
}

- (GEORouteAttributes)routeAttributes
{
  -[GEOETATrafficUpdateRequest _readRouteAttributes]((uint64_t)self);
  return self->_routeAttributes;
}

- (void)setRouteAttributes:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x800800000uLL;
  objc_storeStrong((id *)&self->_routeAttributes, a3);
}

- (BOOL)includeBetterRouteSuggestion
{
  os_unfair_lock_s *p_readerLock;
  $A9051F91FD5D6DAB60BDAAD82EC423D1 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  return (*(_WORD *)&flags & 0x100) == 0 || self->_includeBetterRouteSuggestion;
}

- (void)setIncludeBetterRouteSuggestion:(BOOL)a3
{
  *(_QWORD *)&self->_flags |= 0x800000100uLL;
  self->_includeBetterRouteSuggestion = a3;
}

- (void)setHasIncludeBetterRouteSuggestion:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x800000000;
  if (a3)
    v3 = 0x800000100;
  self->_flags = ($A9051F91FD5D6DAB60BDAAD82EC423D1)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFEFFLL | v3);
}

- (BOOL)hasIncludeBetterRouteSuggestion
{
  return *((_BYTE *)&self->_flags + 1) & 1;
}

- (void)_readRoutes
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 256));
    if ((*(_BYTE *)(a1 + 291) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOETATrafficUpdateRequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRoutes_tags_1);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 256));
  }
}

- (NSMutableArray)routes
{
  -[GEOETATrafficUpdateRequest _readRoutes]((uint64_t)self);
  return self->_routes;
}

- (void)setRoutes:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *routes;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x1000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x800000000uLL;
  routes = self->_routes;
  self->_routes = v4;

}

- (void)clearRoutes
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x1000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(_QWORD *)&self->_flags |= 0x800000000uLL;
  -[NSMutableArray removeAllObjects](self->_routes, "removeAllObjects");
}

- (void)addRoute:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOETATrafficUpdateRequest _readRoutes]((uint64_t)self);
  -[GEOETATrafficUpdateRequest _addNoFlagsRoute:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x1000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x800000000uLL;
}

- (void)_addNoFlagsRoute:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 152);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 152);
      *(_QWORD *)(a1 + 152) = v5;

      v4 = *(void **)(a1 + 152);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)routesCount
{
  -[GEOETATrafficUpdateRequest _readRoutes]((uint64_t)self);
  return -[NSMutableArray count](self->_routes, "count");
}

- (id)routeAtIndex:(unint64_t)a3
{
  -[GEOETATrafficUpdateRequest _readRoutes]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_routes, "objectAtIndex:", a3);
}

+ (Class)routeType
{
  return (Class)objc_opt_class();
}

- (void)_readWaypointRoute
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 256));
    if ((*(_BYTE *)(a1 + 292) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOETATrafficUpdateRequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readWaypointRoute_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 256));
  }
}

- (BOOL)hasWaypointRoute
{
  -[GEOETATrafficUpdateRequest _readWaypointRoute]((uint64_t)self);
  return self->_waypointRoute != 0;
}

- (GEOETATrafficUpdateWaypointRoute)waypointRoute
{
  -[GEOETATrafficUpdateRequest _readWaypointRoute]((uint64_t)self);
  return self->_waypointRoute;
}

- (void)setWaypointRoute:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x900000000uLL;
  objc_storeStrong((id *)&self->_waypointRoute, a3);
}

- (void)_readClientCapabilities
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 256));
    if ((*(_BYTE *)(a1 + 289) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOETATrafficUpdateRequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readClientCapabilities_tags_1219);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 256));
  }
}

- (BOOL)hasClientCapabilities
{
  -[GEOETATrafficUpdateRequest _readClientCapabilities]((uint64_t)self);
  return self->_clientCapabilities != 0;
}

- (GEOClientCapabilities)clientCapabilities
{
  -[GEOETATrafficUpdateRequest _readClientCapabilities]((uint64_t)self);
  return self->_clientCapabilities;
}

- (void)setClientCapabilities:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x800001000uLL;
  objc_storeStrong((id *)&self->_clientCapabilities, a3);
}

- (void)_readDirectionsResponseID
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 256));
    if ((*(_BYTE *)(a1 + 290) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOETATrafficUpdateRequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDirectionsResponseID_tags_1);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 256));
  }
}

- (BOOL)hasDirectionsResponseID
{
  -[GEOETATrafficUpdateRequest _readDirectionsResponseID]((uint64_t)self);
  return self->_directionsResponseID != 0;
}

- (NSData)directionsResponseID
{
  -[GEOETATrafficUpdateRequest _readDirectionsResponseID]((uint64_t)self);
  return self->_directionsResponseID;
}

- (void)setDirectionsResponseID:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x800020000uLL;
  objc_storeStrong((id *)&self->_directionsResponseID, a3);
}

- (void)_readEtauResponseID
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 256));
    if ((*(_BYTE *)(a1 + 290) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOETATrafficUpdateRequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readEtauResponseID_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 256));
  }
}

- (BOOL)hasEtauResponseID
{
  -[GEOETATrafficUpdateRequest _readEtauResponseID]((uint64_t)self);
  return self->_etauResponseID != 0;
}

- (NSData)etauResponseID
{
  -[GEOETATrafficUpdateRequest _readEtauResponseID]((uint64_t)self);
  return self->_etauResponseID;
}

- (void)setEtauResponseID:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x800080000uLL;
  objc_storeStrong((id *)&self->_etauResponseID, a3);
}

- (GEOSessionID)sessionID
{
  GEOSessionID *p_sessionID;
  unint64_t high;
  unint64_t low;
  GEOSessionID result;

  p_sessionID = &self->_sessionID;
  high = self->_sessionID._high;
  low = p_sessionID->_low;
  result._low = low;
  result._high = high;
  return result;
}

- (void)setSessionID:(GEOSessionID)a3
{
  *(_QWORD *)&self->_flags |= 0x800000001uLL;
  self->_sessionID = a3;
}

- (void)setHasSessionID:(BOOL)a3
{
  self->_flags = ($A9051F91FD5D6DAB60BDAAD82EC423D1)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFFFELL | a3 | 0x800000000);
}

- (BOOL)hasSessionID
{
  return *(_DWORD *)&self->_flags & 1;
}

- (double)sessionRelativeTimestamp
{
  return self->_sessionRelativeTimestamp;
}

- (void)setSessionRelativeTimestamp:(double)a3
{
  *(_QWORD *)&self->_flags |= 0x800000002uLL;
  self->_sessionRelativeTimestamp = a3;
}

- (void)setHasSessionRelativeTimestamp:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x800000000;
  if (a3)
    v3 = 0x800000002;
  self->_flags = ($A9051F91FD5D6DAB60BDAAD82EC423D1)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFFFDLL | v3);
}

- (BOOL)hasSessionRelativeTimestamp
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (void)_readAdditionalEnabledMarkets
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 256));
    if ((*(_BYTE *)(a1 + 289) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOETATrafficUpdateRequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAdditionalEnabledMarkets_tags_1220);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 256));
  }
}

- (BOOL)hasAdditionalEnabledMarkets
{
  -[GEOETATrafficUpdateRequest _readAdditionalEnabledMarkets]((uint64_t)self);
  return self->_additionalEnabledMarkets != 0;
}

- (GEOAdditionalEnabledMarkets)additionalEnabledMarkets
{
  -[GEOETATrafficUpdateRequest _readAdditionalEnabledMarkets]((uint64_t)self);
  return self->_additionalEnabledMarkets;
}

- (void)setAdditionalEnabledMarkets:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x800000800uLL;
  objc_storeStrong((id *)&self->_additionalEnabledMarkets, a3);
}

- (void)_readDestinationWaypointTypeds
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 256));
    if ((*(_BYTE *)(a1 + 290) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOETATrafficUpdateRequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDestinationWaypointTypeds_tags_1221);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 256));
  }
}

- (NSMutableArray)destinationWaypointTypeds
{
  -[GEOETATrafficUpdateRequest _readDestinationWaypointTypeds]((uint64_t)self);
  return self->_destinationWaypointTypeds;
}

- (void)setDestinationWaypointTypeds:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *destinationWaypointTypeds;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x10000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x800000000uLL;
  destinationWaypointTypeds = self->_destinationWaypointTypeds;
  self->_destinationWaypointTypeds = v4;

}

- (void)clearDestinationWaypointTypeds
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x10000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(_QWORD *)&self->_flags |= 0x800000000uLL;
  -[NSMutableArray removeAllObjects](self->_destinationWaypointTypeds, "removeAllObjects");
}

- (void)addDestinationWaypointTyped:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOETATrafficUpdateRequest _readDestinationWaypointTypeds]((uint64_t)self);
  -[GEOETATrafficUpdateRequest _addNoFlagsDestinationWaypointTyped:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x10000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x800000000uLL;
}

- (void)_addNoFlagsDestinationWaypointTyped:(uint64_t)a1
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

- (unint64_t)destinationWaypointTypedsCount
{
  -[GEOETATrafficUpdateRequest _readDestinationWaypointTypeds]((uint64_t)self);
  return -[NSMutableArray count](self->_destinationWaypointTypeds, "count");
}

- (id)destinationWaypointTypedAtIndex:(unint64_t)a3
{
  -[GEOETATrafficUpdateRequest _readDestinationWaypointTypeds]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_destinationWaypointTypeds, "objectAtIndex:", a3);
}

+ (Class)destinationWaypointTypedType
{
  return (Class)objc_opt_class();
}

- (void)_readWaypointTypeds
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 256));
    if ((*(_BYTE *)(a1 + 292) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOETATrafficUpdateRequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readWaypointTypeds_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 256));
  }
}

- (NSMutableArray)waypointTypeds
{
  -[GEOETATrafficUpdateRequest _readWaypointTypeds]((uint64_t)self);
  return self->_waypointTypeds;
}

- (void)setWaypointTypeds:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *waypointTypeds;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x200000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x800000000uLL;
  waypointTypeds = self->_waypointTypeds;
  self->_waypointTypeds = v4;

}

- (void)clearWaypointTypeds
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x200000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(_QWORD *)&self->_flags |= 0x800000000uLL;
  -[NSMutableArray removeAllObjects](self->_waypointTypeds, "removeAllObjects");
}

- (void)addWaypointTyped:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOETATrafficUpdateRequest _readWaypointTypeds]((uint64_t)self);
  -[GEOETATrafficUpdateRequest _addNoFlagsWaypointTyped:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x200000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x800000000uLL;
}

- (void)_addNoFlagsWaypointTyped:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 232);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 232);
      *(_QWORD *)(a1 + 232) = v5;

      v4 = *(void **)(a1 + 232);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)waypointTypedsCount
{
  -[GEOETATrafficUpdateRequest _readWaypointTypeds]((uint64_t)self);
  return -[NSMutableArray count](self->_waypointTypeds, "count");
}

- (id)waypointTypedAtIndex:(unint64_t)a3
{
  -[GEOETATrafficUpdateRequest _readWaypointTypeds]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_waypointTypeds, "objectAtIndex:", a3);
}

+ (Class)waypointTypedType
{
  return (Class)objc_opt_class();
}

- (unsigned)previouslyRejectedRerouteSavings
{
  return self->_previouslyRejectedRerouteSavings;
}

- (void)setPreviouslyRejectedRerouteSavings:(unsigned int)a3
{
  *(_QWORD *)&self->_flags |= 0x800000010uLL;
  self->_previouslyRejectedRerouteSavings = a3;
}

- (void)setHasPreviouslyRejectedRerouteSavings:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x800000000;
  if (a3)
    v3 = 0x800000010;
  self->_flags = ($A9051F91FD5D6DAB60BDAAD82EC423D1)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFFEFLL | v3);
}

- (BOOL)hasPreviouslyRejectedRerouteSavings
{
  return (*(_BYTE *)&self->_flags >> 4) & 1;
}

- (void)_readSessionState
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 256));
    if ((*(_BYTE *)(a1 + 291) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOETATrafficUpdateRequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSessionState_tags_1222);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 256));
  }
}

- (BOOL)hasSessionState
{
  -[GEOETATrafficUpdateRequest _readSessionState]((uint64_t)self);
  return self->_sessionState != 0;
}

- (NSData)sessionState
{
  -[GEOETATrafficUpdateRequest _readSessionState]((uint64_t)self);
  return self->_sessionState;
}

- (void)setSessionState:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x804000000uLL;
  objc_storeStrong((id *)&self->_sessionState, a3);
}

- (int)rerouteStatus
{
  os_unfair_lock_s *p_readerLock;
  $A9051F91FD5D6DAB60BDAAD82EC423D1 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_BYTE *)&flags & 0x40) != 0)
    return self->_rerouteStatus;
  else
    return 0;
}

- (void)setRerouteStatus:(int)a3
{
  *(_QWORD *)&self->_flags |= 0x800000040uLL;
  self->_rerouteStatus = a3;
}

- (void)setHasRerouteStatus:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x800000000;
  if (a3)
    v3 = 0x800000040;
  self->_flags = ($A9051F91FD5D6DAB60BDAAD82EC423D1)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFFBFLL | v3);
}

- (BOOL)hasRerouteStatus
{
  return (*(_BYTE *)&self->_flags >> 6) & 1;
}

- (id)rerouteStatusAsString:(int)a3
{
  if (a3 < 5)
    return off_1E1C21FD0[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsRerouteStatus:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REROUTE_INACTIVE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REROUTE_PROPOSED")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REROUTE_DECLINED")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REROUTE_REJECTED")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("REROUTE_ACCEPTED")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_readCommonOptions
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 256));
    if ((*(_BYTE *)(a1 + 289) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOETATrafficUpdateRequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCommonOptions_tags_1223);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 256));
  }
}

- (BOOL)hasCommonOptions
{
  -[GEOETATrafficUpdateRequest _readCommonOptions]((uint64_t)self);
  return self->_commonOptions != 0;
}

- (GEOCommonOptions)commonOptions
{
  -[GEOETATrafficUpdateRequest _readCommonOptions]((uint64_t)self);
  return self->_commonOptions;
}

- (void)setCommonOptions:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x800004000uLL;
  objc_storeStrong((id *)&self->_commonOptions, a3);
}

- (void)_readAbClientMetadata
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 256));
    if ((*(_BYTE *)(a1 + 289) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOETATrafficUpdateRequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAbClientMetadata_tags_1224);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 256));
  }
}

- (BOOL)hasAbClientMetadata
{
  -[GEOETATrafficUpdateRequest _readAbClientMetadata]((uint64_t)self);
  return self->_abClientMetadata != 0;
}

- (GEOPDABClientDatasetMetadata)abClientMetadata
{
  -[GEOETATrafficUpdateRequest _readAbClientMetadata]((uint64_t)self);
  return self->_abClientMetadata;
}

- (void)setAbClientMetadata:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x800000400uLL;
  objc_storeStrong((id *)&self->_abClientMetadata, a3);
}

- (unsigned)maxAlternateRouteCount
{
  return self->_maxAlternateRouteCount;
}

- (void)setMaxAlternateRouteCount:(unsigned int)a3
{
  *(_QWORD *)&self->_flags |= 0x800000008uLL;
  self->_maxAlternateRouteCount = a3;
}

- (void)setHasMaxAlternateRouteCount:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x800000000;
  if (a3)
    v3 = 0x800000008;
  self->_flags = ($A9051F91FD5D6DAB60BDAAD82EC423D1)(*(_QWORD *)&self->_flags & 0xFFFFFFF7FFFFFFF7 | v3);
}

- (BOOL)hasMaxAlternateRouteCount
{
  return (*(_BYTE *)&self->_flags >> 3) & 1;
}

- (void)_readTripID
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 256));
    if ((*(_BYTE *)(a1 + 291) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOETATrafficUpdateRequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTripID_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 256));
  }
}

- (BOOL)hasTripID
{
  -[GEOETATrafficUpdateRequest _readTripID]((uint64_t)self);
  return self->_tripID != 0;
}

- (NSData)tripID
{
  -[GEOETATrafficUpdateRequest _readTripID]((uint64_t)self);
  return self->_tripID;
}

- (void)setTripID:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x820000000uLL;
  objc_storeStrong((id *)&self->_tripID, a3);
}

- (void)_readRequestingAppId
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 256));
    if ((*(_BYTE *)(a1 + 290) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOETATrafficUpdateRequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRequestingAppId_tags_1225);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 256));
  }
}

- (BOOL)hasRequestingAppId
{
  -[GEOETATrafficUpdateRequest _readRequestingAppId]((uint64_t)self);
  return self->_requestingAppId != 0;
}

- (NSString)requestingAppId
{
  -[GEOETATrafficUpdateRequest _readRequestingAppId]((uint64_t)self);
  return self->_requestingAppId;
}

- (void)setRequestingAppId:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x800400000uLL;
  objc_storeStrong((id *)&self->_requestingAppId, a3);
}

- (void)_readTripOrigin
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 256));
    if ((*(_BYTE *)(a1 + 291) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOETATrafficUpdateRequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTripOrigin_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 256));
  }
}

- (BOOL)hasTripOrigin
{
  -[GEOETATrafficUpdateRequest _readTripOrigin]((uint64_t)self);
  return self->_tripOrigin != 0;
}

- (GEOLocation)tripOrigin
{
  -[GEOETATrafficUpdateRequest _readTripOrigin]((uint64_t)self);
  return self->_tripOrigin;
}

- (void)setTripOrigin:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x880000000uLL;
  objc_storeStrong((id *)&self->_tripOrigin, a3);
}

- (void)_readDisplayedBannerIds
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 256));
    if ((*(_BYTE *)(a1 + 290) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOETATrafficUpdateRequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDisplayedBannerIds_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 256));
  }
}

- (NSMutableArray)displayedBannerIds
{
  -[GEOETATrafficUpdateRequest _readDisplayedBannerIds]((uint64_t)self);
  return self->_displayedBannerIds;
}

- (void)setDisplayedBannerIds:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *displayedBannerIds;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x40000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x800000000uLL;
  displayedBannerIds = self->_displayedBannerIds;
  self->_displayedBannerIds = v4;

}

- (void)clearDisplayedBannerIds
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x40000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(_QWORD *)&self->_flags |= 0x800000000uLL;
  -[NSMutableArray removeAllObjects](self->_displayedBannerIds, "removeAllObjects");
}

- (void)addDisplayedBannerId:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOETATrafficUpdateRequest _readDisplayedBannerIds]((uint64_t)self);
  -[GEOETATrafficUpdateRequest _addNoFlagsDisplayedBannerId:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x40000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x800000000uLL;
}

- (void)_addNoFlagsDisplayedBannerId:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 104);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 104);
      *(_QWORD *)(a1 + 104) = v5;

      v4 = *(void **)(a1 + 104);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)displayedBannerIdsCount
{
  -[GEOETATrafficUpdateRequest _readDisplayedBannerIds]((uint64_t)self);
  return -[NSMutableArray count](self->_displayedBannerIds, "count");
}

- (id)displayedBannerIdAtIndex:(unint64_t)a3
{
  -[GEOETATrafficUpdateRequest _readDisplayedBannerIds]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_displayedBannerIds, "objectAtIndex:", a3);
}

+ (Class)displayedBannerIdType
{
  return (Class)objc_opt_class();
}

- (void)_readClientFeedbackInfo
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 256));
    if ((*(_BYTE *)(a1 + 289) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOETATrafficUpdateRequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readClientFeedbackInfo_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 256));
  }
}

- (BOOL)hasClientFeedbackInfo
{
  -[GEOETATrafficUpdateRequest _readClientFeedbackInfo]((uint64_t)self);
  return self->_clientFeedbackInfo != 0;
}

- (GEOClientFeedbackInfo)clientFeedbackInfo
{
  -[GEOETATrafficUpdateRequest _readClientFeedbackInfo]((uint64_t)self);
  return self->_clientFeedbackInfo;
}

- (void)setClientFeedbackInfo:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x800002000uLL;
  objc_storeStrong((id *)&self->_clientFeedbackInfo, a3);
}

- (void)_readRecentLocationHistory
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 256));
    if ((*(_BYTE *)(a1 + 290) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOETATrafficUpdateRequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRecentLocationHistory_tags_1226);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 256));
  }
}

- (BOOL)hasRecentLocationHistory
{
  -[GEOETATrafficUpdateRequest _readRecentLocationHistory]((uint64_t)self);
  return self->_recentLocationHistory != 0;
}

- (GEORecentLocationHistory)recentLocationHistory
{
  -[GEOETATrafficUpdateRequest _readRecentLocationHistory]((uint64_t)self);
  return self->_recentLocationHistory;
}

- (void)setRecentLocationHistory:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x800200000uLL;
  objc_storeStrong((id *)&self->_recentLocationHistory, a3);
}

- (void)_readPrivacyMetadata
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 256));
    if ((*(_BYTE *)(a1 + 290) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOETATrafficUpdateRequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPrivacyMetadata_tags_1227);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 256));
  }
}

- (BOOL)hasPrivacyMetadata
{
  -[GEOETATrafficUpdateRequest _readPrivacyMetadata]((uint64_t)self);
  return self->_privacyMetadata != 0;
}

- (GEOPrivacyMetadata)privacyMetadata
{
  -[GEOETATrafficUpdateRequest _readPrivacyMetadata]((uint64_t)self);
  return self->_privacyMetadata;
}

- (void)setPrivacyMetadata:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x800100000uLL;
  objc_storeStrong((id *)&self->_privacyMetadata, a3);
}

- (unsigned)displayedEta
{
  return self->_displayedEta;
}

- (void)setDisplayedEta:(unsigned int)a3
{
  *(_QWORD *)&self->_flags |= 0x800000004uLL;
  self->_displayedEta = a3;
}

- (void)setHasDisplayedEta:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x800000000;
  if (a3)
    v3 = 0x800000004;
  self->_flags = ($A9051F91FD5D6DAB60BDAAD82EC423D1)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFFFBLL | v3);
}

- (BOOL)hasDisplayedEta
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (void)_readTripInfo
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 256));
    if ((*(_BYTE *)(a1 + 291) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOETATrafficUpdateRequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTripInfo_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 256));
  }
}

- (BOOL)hasTripInfo
{
  -[GEOETATrafficUpdateRequest _readTripInfo]((uint64_t)self);
  return self->_tripInfo != 0;
}

- (GEOTripInfo)tripInfo
{
  -[GEOETATrafficUpdateRequest _readTripInfo]((uint64_t)self);
  return self->_tripInfo;
}

- (void)setTripInfo:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x840000000uLL;
  objc_storeStrong((id *)&self->_tripInfo, a3);
}

- (int)purpose
{
  os_unfair_lock_s *p_readerLock;
  $A9051F91FD5D6DAB60BDAAD82EC423D1 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_BYTE *)&flags & 0x20) != 0)
    return self->_purpose;
  else
    return 0;
}

- (void)setPurpose:(int)a3
{
  *(_QWORD *)&self->_flags |= 0x800000020uLL;
  self->_purpose = a3;
}

- (void)setHasPurpose:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x800000000;
  if (a3)
    v3 = 0x800000020;
  self->_flags = ($A9051F91FD5D6DAB60BDAAD82EC423D1)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFFDFLL | v3);
}

- (BOOL)hasPurpose
{
  return (*(_BYTE *)&self->_flags >> 5) & 1;
}

- (id)purposeAsString:(int)a3
{
  if (a3 < 7)
    return off_1E1C21FF8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsPurpose:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PURPOSE_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REGULAR_ETA_UPDATE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SERVER_INITIATED_ETA_UPDATE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("USER_ABORTED_TRIP")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("USER_PAUSED_TRIP_AT_WAYPOINT")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("USER_COMPLETED_TRIP")) & 1) != 0)
  {
    v4 = 5;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("USER_ADVANCED_TO_NEXT_LEG")))
  {
    v4 = 6;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_readServiceTags
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 256));
    if ((*(_BYTE *)(a1 + 291) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOETATrafficUpdateRequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readServiceTags_tags_1228);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 256));
  }
}

- (NSMutableArray)serviceTags
{
  -[GEOETATrafficUpdateRequest _readServiceTags]((uint64_t)self);
  return self->_serviceTags;
}

- (void)setServiceTags:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *serviceTags;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x2000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x800000000uLL;
  serviceTags = self->_serviceTags;
  self->_serviceTags = v4;

}

- (void)clearServiceTags
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x2000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(_QWORD *)&self->_flags |= 0x800000000uLL;
  -[NSMutableArray removeAllObjects](self->_serviceTags, "removeAllObjects");
}

- (void)addServiceTag:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOETATrafficUpdateRequest _readServiceTags]((uint64_t)self);
  -[GEOETATrafficUpdateRequest _addNoFlagsServiceTag:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x2000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x800000000uLL;
}

- (void)_addNoFlagsServiceTag:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 160);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 160);
      *(_QWORD *)(a1 + 160) = v5;

      v4 = *(void **)(a1 + 160);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)serviceTagsCount
{
  -[GEOETATrafficUpdateRequest _readServiceTags]((uint64_t)self);
  return -[NSMutableArray count](self->_serviceTags, "count");
}

- (id)serviceTagAtIndex:(unint64_t)a3
{
  -[GEOETATrafficUpdateRequest _readServiceTags]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_serviceTags, "objectAtIndex:", a3);
}

+ (Class)serviceTagType
{
  return (Class)objc_opt_class();
}

- (void)_readTrafficApiResponses
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 256));
    if ((*(_BYTE *)(a1 + 291) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOETATrafficUpdateRequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTrafficApiResponses_tags_1229);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 256));
  }
}

- (NSMutableArray)trafficApiResponses
{
  -[GEOETATrafficUpdateRequest _readTrafficApiResponses]((uint64_t)self);
  return self->_trafficApiResponses;
}

- (void)setTrafficApiResponses:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *trafficApiResponses;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x8000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x800000000uLL;
  trafficApiResponses = self->_trafficApiResponses;
  self->_trafficApiResponses = v4;

}

- (void)clearTrafficApiResponses
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x8000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(_QWORD *)&self->_flags |= 0x800000000uLL;
  -[NSMutableArray removeAllObjects](self->_trafficApiResponses, "removeAllObjects");
}

- (void)addTrafficApiResponses:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOETATrafficUpdateRequest _readTrafficApiResponses]((uint64_t)self);
  -[GEOETATrafficUpdateRequest _addNoFlagsTrafficApiResponses:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x8000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x800000000uLL;
}

- (void)_addNoFlagsTrafficApiResponses:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 184);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 184);
      *(_QWORD *)(a1 + 184) = v5;

      v4 = *(void **)(a1 + 184);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)trafficApiResponsesCount
{
  -[GEOETATrafficUpdateRequest _readTrafficApiResponses]((uint64_t)self);
  return -[NSMutableArray count](self->_trafficApiResponses, "count");
}

- (id)trafficApiResponsesAtIndex:(unint64_t)a3
{
  -[GEOETATrafficUpdateRequest _readTrafficApiResponses]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_trafficApiResponses, "objectAtIndex:", a3);
}

+ (Class)trafficApiResponsesType
{
  return (Class)objc_opt_class();
}

- (void)_readTrafficSnapshotIds
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 256));
    if ((*(_BYTE *)(a1 + 291) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOETATrafficUpdateRequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTrafficSnapshotIds_tags_1230);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 256));
  }
}

- (NSMutableArray)trafficSnapshotIds
{
  -[GEOETATrafficUpdateRequest _readTrafficSnapshotIds]((uint64_t)self);
  return self->_trafficSnapshotIds;
}

- (void)setTrafficSnapshotIds:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *trafficSnapshotIds;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x10000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x800000000uLL;
  trafficSnapshotIds = self->_trafficSnapshotIds;
  self->_trafficSnapshotIds = v4;

}

- (void)clearTrafficSnapshotIds
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x10000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(_QWORD *)&self->_flags |= 0x800000000uLL;
  -[NSMutableArray removeAllObjects](self->_trafficSnapshotIds, "removeAllObjects");
}

- (void)addTrafficSnapshotIds:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOETATrafficUpdateRequest _readTrafficSnapshotIds]((uint64_t)self);
  -[GEOETATrafficUpdateRequest _addNoFlagsTrafficSnapshotIds:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x10000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x800000000uLL;
}

- (void)_addNoFlagsTrafficSnapshotIds:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 192);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 192);
      *(_QWORD *)(a1 + 192) = v5;

      v4 = *(void **)(a1 + 192);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)trafficSnapshotIdsCount
{
  -[GEOETATrafficUpdateRequest _readTrafficSnapshotIds]((uint64_t)self);
  return -[NSMutableArray count](self->_trafficSnapshotIds, "count");
}

- (id)trafficSnapshotIdsAtIndex:(unint64_t)a3
{
  -[GEOETATrafficUpdateRequest _readTrafficSnapshotIds]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_trafficSnapshotIds, "objectAtIndex:", a3);
}

+ (Class)trafficSnapshotIdsType
{
  return (Class)objc_opt_class();
}

- (unsigned)trafficSnapshotUnixTime
{
  return self->_trafficSnapshotUnixTime;
}

- (void)setTrafficSnapshotUnixTime:(unsigned int)a3
{
  *(_QWORD *)&self->_flags |= 0x800000080uLL;
  self->_trafficSnapshotUnixTime = a3;
}

- (void)setHasTrafficSnapshotUnixTime:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x800000000;
  if (a3)
    v3 = 0x800000080;
  self->_flags = ($A9051F91FD5D6DAB60BDAAD82EC423D1)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFF7FLL | v3);
}

- (BOOL)hasTrafficSnapshotUnixTime
{
  return *(_BYTE *)&self->_flags >> 7;
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
  v8.super_class = (Class)GEOETATrafficUpdateRequest;
  -[GEOETATrafficUpdateRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOETATrafficUpdateRequest dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOETATrafficUpdateRequest _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  int *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  const __CFString *v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  id v37;
  void *v38;
  const __CFString *v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t j;
  void *v49;
  id v50;
  void *v51;
  id v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t k;
  void *v57;
  id v58;
  const __CFString *v59;
  void *v60;
  const __CFString *v61;
  void *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  __CFString *v66;
  const __CFString *v67;
  void *v68;
  void *v69;
  void *v70;
  const __CFString *v71;
  id v72;
  void *v73;
  void *v74;
  void *v75;
  const __CFString *v76;
  id v77;
  void *v78;
  const __CFString *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  const __CFString *v84;
  void *v85;
  void *v86;
  void *v87;
  const __CFString *v88;
  id v89;
  void *v90;
  const __CFString *v91;
  void *v92;
  void *v93;
  void *v94;
  const __CFString *v95;
  id v96;
  void *v97;
  void *v98;
  void *v99;
  const __CFString *v100;
  id v101;
  void *v102;
  void *v103;
  void *v104;
  const __CFString *v105;
  id v106;
  void *v107;
  const __CFString *v108;
  void *v109;
  void *v110;
  void *v111;
  const __CFString *v112;
  id v113;
  uint64_t v114;
  __CFString *v115;
  void *v116;
  id v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t m;
  void *v122;
  id v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t n;
  void *v132;
  void *v133;
  void *v134;
  const __CFString *v135;
  void *v136;
  const __CFString *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  id v142;
  id v143;
  id v144;
  _QWORD v146[4];
  id v147;
  __int128 v148;
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
  _BYTE v168[128];
  _BYTE v169[128];
  _BYTE v170[128];
  _BYTE v171[128];
  _BYTE v172[128];
  uint64_t v173;

  v173 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)a1, "currentUserLocation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v5, "jsonRepresentation");
    else
      objc_msgSend(v5, "dictionaryRepresentation");
    v7 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("currentUserLocation"));
  }

  objc_msgSend((id)a1, "routeAttributes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v8, "jsonRepresentation");
    else
      objc_msgSend(v8, "dictionaryRepresentation");
    v10 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("routeAttributes"));
  }

  v11 = &OBJC_IVAR___GEORPRapResponse__displayDetails;
  v12 = 0x1E0CB3000uLL;
  if ((*(_BYTE *)(a1 + 289) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 284));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("includeBetterRouteSuggestion"));

  }
  if (objc_msgSend(*(id *)(a1 + 152), "count"))
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 152), "count"));
    v164 = 0u;
    v165 = 0u;
    v166 = 0u;
    v167 = 0u;
    v15 = *(id *)(a1 + 152);
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v164, v172, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v165;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v165 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v164 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v20, "jsonRepresentation");
          else
            objc_msgSend(v20, "dictionaryRepresentation");
          v21 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v14, "addObject:", v21);
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v164, v172, 16);
      }
      while (v17);
    }

    objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("route"));
    v12 = 0x1E0CB3000uLL;
    v11 = &OBJC_IVAR___GEORPRapResponse__displayDetails;
  }
  objc_msgSend((id)a1, "waypointRoute");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22;
  if (v22)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v22, "jsonRepresentation");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = CFSTR("waypointRoute");
    }
    else
    {
      objc_msgSend(v22, "dictionaryRepresentation");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = CFSTR("waypoint_route");
    }
    v26 = v24;

    objc_msgSend(v4, "setObject:forKey:", v26, v25);
  }

  objc_msgSend((id)a1, "clientCapabilities");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v27;
  if (v27)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v27, "jsonRepresentation");
    else
      objc_msgSend(v27, "dictionaryRepresentation");
    v29 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKey:", v29, CFSTR("clientCapabilities"));
  }

  objc_msgSend((id)a1, "directionsResponseID");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v30;
  if (v30)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v30, "base64EncodedStringWithOptions:", 0);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v32, CFSTR("directionsResponseID"));

    }
    else
    {
      objc_msgSend(v4, "setObject:forKey:", v30, CFSTR("directionsResponseID"));
    }
  }

  objc_msgSend((id)a1, "etauResponseID");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (v33)
  {
    v34 = v33;
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v33, "base64EncodedStringWithOptions:", 0);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v35, CFSTR("etauResponseID"));

    }
    else
    {
      objc_msgSend(v4, "setObject:forKey:", v33, CFSTR("etauResponseID"));
    }

  }
  v36 = *(_QWORD *)(a1 + 288);
  if ((v36 & 1) != 0)
  {
    _GEOSessionIDDictionaryRepresentation((_QWORD *)(a1 + 24));
    v37 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKey:", v37, CFSTR("sessionID"));
    v36 = *(_QWORD *)(a1 + 288);
  }
  if ((v36 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 168));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v39 = CFSTR("sessionRelativeTimestamp");
    else
      v39 = CFSTR("session_relative_timestamp");
    objc_msgSend(v4, "setObject:forKey:", v38, v39);

  }
  objc_msgSend((id)a1, "additionalEnabledMarkets");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v40;
  if (v40)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v40, "jsonRepresentation");
    else
      objc_msgSend(v40, "dictionaryRepresentation");
    v42 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKey:", v42, CFSTR("additionalEnabledMarkets"));
  }

  if (objc_msgSend(*(id *)(a1 + 88), "count"))
  {
    v43 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 88), "count"));
    v160 = 0u;
    v161 = 0u;
    v162 = 0u;
    v163 = 0u;
    v44 = *(id *)(a1 + 88);
    v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v160, v171, 16);
    if (v45)
    {
      v46 = v45;
      v47 = *(_QWORD *)v161;
      do
      {
        for (j = 0; j != v46; ++j)
        {
          if (*(_QWORD *)v161 != v47)
            objc_enumerationMutation(v44);
          v49 = *(void **)(*((_QWORD *)&v160 + 1) + 8 * j);
          if ((a2 & 1) != 0)
            objc_msgSend(v49, "jsonRepresentation");
          else
            objc_msgSend(v49, "dictionaryRepresentation");
          v50 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v43, "addObject:", v50);
        }
        v46 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v160, v171, 16);
      }
      while (v46);
    }

    objc_msgSend(v4, "setObject:forKey:", v43, CFSTR("destinationWaypointTyped"));
    v12 = 0x1E0CB3000;
    v11 = &OBJC_IVAR___GEORPRapResponse__displayDetails;
  }
  if (objc_msgSend(*(id *)(a1 + 232), "count"))
  {
    v51 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 232), "count"));
    v156 = 0u;
    v157 = 0u;
    v158 = 0u;
    v159 = 0u;
    v52 = *(id *)(a1 + 232);
    v53 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v156, v170, 16);
    if (v53)
    {
      v54 = v53;
      v55 = *(_QWORD *)v157;
      do
      {
        for (k = 0; k != v54; ++k)
        {
          if (*(_QWORD *)v157 != v55)
            objc_enumerationMutation(v52);
          v57 = *(void **)(*((_QWORD *)&v156 + 1) + 8 * k);
          if ((a2 & 1) != 0)
            objc_msgSend(v57, "jsonRepresentation");
          else
            objc_msgSend(v57, "dictionaryRepresentation");
          v58 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v51, "addObject:", v58);
        }
        v54 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v156, v170, 16);
      }
      while (v54);
    }

    if (a2)
      v59 = CFSTR("waypointTyped");
    else
      v59 = CFSTR("waypoint_typed");
    objc_msgSend(v4, "setObject:forKey:", v51, v59);

    v12 = 0x1E0CB3000uLL;
    v11 = &OBJC_IVAR___GEORPRapResponse__displayDetails;
  }
  if ((*(_BYTE *)(a1 + v11[275]) & 0x10) != 0)
  {
    objc_msgSend(*(id *)(v12 + 2024), "numberWithUnsignedInt:", *(unsigned int *)(a1 + 268));
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v61 = CFSTR("previouslyRejectedRerouteSavings");
    else
      v61 = CFSTR("previously_rejected_reroute_savings");
    objc_msgSend(v4, "setObject:forKey:", v60, v61);

  }
  objc_msgSend((id)a1, "sessionState");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = v62;
  if (v62)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v62, "base64EncodedStringWithOptions:", 0);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v64, CFSTR("sessionState"));

    }
    else
    {
      objc_msgSend(v4, "setObject:forKey:", v62, CFSTR("session_state"));
    }
  }

  if ((*(_BYTE *)(a1 + v11[275]) & 0x40) != 0)
  {
    v65 = *(int *)(a1 + 276);
    if (v65 >= 5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 276));
      v66 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v66 = off_1E1C21FD0[v65];
    }
    if (a2)
      v67 = CFSTR("rerouteStatus");
    else
      v67 = CFSTR("reroute_status");
    objc_msgSend(v4, "setObject:forKey:", v66, v67);

  }
  objc_msgSend((id)a1, "commonOptions");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = v68;
  if (v68)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v68, "jsonRepresentation");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      v71 = CFSTR("commonOptions");
    }
    else
    {
      objc_msgSend(v68, "dictionaryRepresentation");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      v71 = CFSTR("common_options");
    }
    v72 = v70;

    objc_msgSend(v4, "setObject:forKey:", v72, v71);
  }

  objc_msgSend((id)a1, "abClientMetadata");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = v73;
  if (v73)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v73, "jsonRepresentation");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      v76 = CFSTR("abClientMetadata");
    }
    else
    {
      objc_msgSend(v73, "dictionaryRepresentation");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      v76 = CFSTR("ab_client_metadata");
    }
    v77 = v75;

    objc_msgSend(v4, "setObject:forKey:", v77, v76);
  }

  if ((*(_BYTE *)(a1 + v11[275]) & 8) != 0)
  {
    objc_msgSend(*(id *)(v12 + 2024), "numberWithUnsignedInt:", *(unsigned int *)(a1 + 264));
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v79 = CFSTR("maxAlternateRouteCount");
    else
      v79 = CFSTR("max_alternate_route_count");
    objc_msgSend(v4, "setObject:forKey:", v78, v79);

  }
  objc_msgSend((id)a1, "tripID");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v81 = v80;
  if (v80)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v80, "base64EncodedStringWithOptions:", 0);
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v82, CFSTR("tripID"));

    }
    else
    {
      objc_msgSend(v4, "setObject:forKey:", v80, CFSTR("tripID"));
    }
  }

  objc_msgSend((id)a1, "requestingAppId");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  if (v83)
  {
    if (a2)
      v84 = CFSTR("requestingAppId");
    else
      v84 = CFSTR("requesting_app_id");
    objc_msgSend(v4, "setObject:forKey:", v83, v84);
  }

  objc_msgSend((id)a1, "tripOrigin");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v86 = v85;
  if (v85)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v85, "jsonRepresentation");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      v88 = CFSTR("tripOrigin");
    }
    else
    {
      objc_msgSend(v85, "dictionaryRepresentation");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      v88 = CFSTR("trip_origin");
    }
    v89 = v87;

    objc_msgSend(v4, "setObject:forKey:", v89, v88);
  }

  if (*(_QWORD *)(a1 + 104))
  {
    objc_msgSend((id)a1, "displayedBannerIds");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v91 = CFSTR("displayedBannerId");
    else
      v91 = CFSTR("displayed_banner_id");
    objc_msgSend(v4, "setObject:forKey:", v90, v91);

  }
  objc_msgSend((id)a1, "clientFeedbackInfo");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  v93 = v92;
  if (v92)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v92, "jsonRepresentation");
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      v95 = CFSTR("clientFeedbackInfo");
    }
    else
    {
      objc_msgSend(v92, "dictionaryRepresentation");
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      v95 = CFSTR("client_feedback_info");
    }
    v96 = v94;

    objc_msgSend(v4, "setObject:forKey:", v96, v95);
  }

  objc_msgSend((id)a1, "recentLocationHistory");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  v98 = v97;
  if (v97)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v97, "jsonRepresentation");
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      v100 = CFSTR("recentLocationHistory");
    }
    else
    {
      objc_msgSend(v97, "dictionaryRepresentation");
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      v100 = CFSTR("recent_location_history");
    }
    v101 = v99;

    objc_msgSend(v4, "setObject:forKey:", v101, v100);
  }

  objc_msgSend((id)a1, "privacyMetadata");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  v103 = v102;
  if (v102)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v102, "jsonRepresentation");
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      v105 = CFSTR("privacyMetadata");
    }
    else
    {
      objc_msgSend(v102, "dictionaryRepresentation");
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      v105 = CFSTR("privacy_metadata");
    }
    v106 = v104;

    objc_msgSend(v4, "setObject:forKey:", v106, v105);
  }

  if ((*(_BYTE *)(a1 + v11[275]) & 4) != 0)
  {
    objc_msgSend(*(id *)(v12 + 2024), "numberWithUnsignedInt:", *(unsigned int *)(a1 + 260));
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v108 = CFSTR("displayedEta");
    else
      v108 = CFSTR("displayed_eta");
    objc_msgSend(v4, "setObject:forKey:", v107, v108);

  }
  objc_msgSend((id)a1, "tripInfo");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  v110 = v109;
  if (v109)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v109, "jsonRepresentation");
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      v112 = CFSTR("tripInfo");
    }
    else
    {
      objc_msgSend(v109, "dictionaryRepresentation");
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      v112 = CFSTR("trip_info");
    }
    v113 = v111;

    objc_msgSend(v4, "setObject:forKey:", v113, v112);
  }

  if ((*(_BYTE *)(a1 + v11[275]) & 0x20) != 0)
  {
    v114 = *(int *)(a1 + 272);
    if (v114 >= 7)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 272));
      v115 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v115 = off_1E1C21FF8[v114];
    }
    objc_msgSend(v4, "setObject:forKey:", v115, CFSTR("purpose"));

  }
  if (objc_msgSend(*(id *)(a1 + 160), "count"))
  {
    v116 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 160), "count"));
    v152 = 0u;
    v153 = 0u;
    v154 = 0u;
    v155 = 0u;
    v117 = *(id *)(a1 + 160);
    v118 = objc_msgSend(v117, "countByEnumeratingWithState:objects:count:", &v152, v169, 16);
    if (v118)
    {
      v119 = v118;
      v120 = *(_QWORD *)v153;
      do
      {
        for (m = 0; m != v119; ++m)
        {
          if (*(_QWORD *)v153 != v120)
            objc_enumerationMutation(v117);
          v122 = *(void **)(*((_QWORD *)&v152 + 1) + 8 * m);
          if ((a2 & 1) != 0)
            objc_msgSend(v122, "jsonRepresentation");
          else
            objc_msgSend(v122, "dictionaryRepresentation");
          v123 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v116, "addObject:", v123);
        }
        v119 = objc_msgSend(v117, "countByEnumeratingWithState:objects:count:", &v152, v169, 16);
      }
      while (v119);
    }

    objc_msgSend(v4, "setObject:forKey:", v116, CFSTR("serviceTag"));
    v11 = &OBJC_IVAR___GEORPRapResponse__displayDetails;
  }
  if (*(_QWORD *)(a1 + 184))
  {
    if (a2)
    {
      v124 = (void *)MEMORY[0x1E0C99DE8];
      objc_msgSend((id)a1, "trafficApiResponses");
      v125 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v124, "arrayWithCapacity:", objc_msgSend(v125, "count"));
      v126 = (void *)objc_claimAutoreleasedReturnValue();

      v150 = 0u;
      v151 = 0u;
      v148 = 0u;
      v149 = 0u;
      objc_msgSend((id)a1, "trafficApiResponses");
      v127 = (void *)objc_claimAutoreleasedReturnValue();
      v128 = objc_msgSend(v127, "countByEnumeratingWithState:objects:count:", &v148, v168, 16);
      if (v128)
      {
        v129 = v128;
        v130 = *(_QWORD *)v149;
        do
        {
          for (n = 0; n != v129; ++n)
          {
            if (*(_QWORD *)v149 != v130)
              objc_enumerationMutation(v127);
            objc_msgSend(*(id *)(*((_QWORD *)&v148 + 1) + 8 * n), "base64EncodedStringWithOptions:", 0);
            v132 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v126, "addObject:", v132);

          }
          v129 = objc_msgSend(v127, "countByEnumeratingWithState:objects:count:", &v148, v168, 16);
        }
        while (v129);
      }

      v11 = &OBJC_IVAR___GEORPRapResponse__displayDetails;
    }
    else
    {
      objc_msgSend((id)a1, "trafficApiResponses");
      v126 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v4, "setObject:forKey:", v126, CFSTR("trafficApiResponses"));

  }
  if (*(_QWORD *)(a1 + 192))
  {
    objc_msgSend((id)a1, "trafficSnapshotIds");
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v133, CFSTR("trafficSnapshotIds"));

  }
  if ((*(_BYTE *)(a1 + v11[275]) & 0x80) != 0)
  {
    objc_msgSend(*(id *)(v12 + 2024), "numberWithUnsignedInt:", *(unsigned int *)(a1 + 280));
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v135 = CFSTR("trafficSnapshotUnixTime");
    else
      v135 = CFSTR("traffic_snapshot_unix_time");
    objc_msgSend(v4, "setObject:forKey:", v134, v135);

  }
  objc_msgSend((id)a1, "xpcUuid");
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  if (v136)
  {
    if (a2)
      v137 = CFSTR("xpcUuid");
    else
      v137 = CFSTR("xpc_uuid");
    objc_msgSend(v4, "setObject:forKey:", v136, v137);
  }

  v138 = *(void **)(a1 + 16);
  if (v138)
  {
    objc_msgSend(v138, "dictionaryRepresentation");
    v139 = (void *)objc_claimAutoreleasedReturnValue();
    v140 = v139;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v139, "count"));
      v141 = (void *)objc_claimAutoreleasedReturnValue();
      v146[0] = MEMORY[0x1E0C809B0];
      v146[1] = 3221225472;
      v146[2] = __56__GEOETATrafficUpdateRequest__dictionaryRepresentation___block_invoke;
      v146[3] = &unk_1E1C00600;
      v142 = v141;
      v147 = v142;
      objc_msgSend(v140, "enumerateKeysAndObjectsUsingBlock:", v146);
      v143 = v142;

      v140 = v143;
    }
    objc_msgSend(v4, "setObject:forKey:", v140, CFSTR("Unknown Fields"));

  }
  v144 = v4;

  return v144;
}

- (id)jsonRepresentation
{
  return -[GEOETATrafficUpdateRequest _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __56__GEOETATrafficUpdateRequest__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOETATrafficUpdateRequest)initWithDictionary:(id)a3
{
  return (GEOETATrafficUpdateRequest *)-[GEOETATrafficUpdateRequest _initWithDictionary:isJSON:](self, a3, 0);
}

- (id)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  void *v6;
  GEOLocation *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  GEORouteAttributes *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  GEOETARoute *v22;
  uint64_t v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  GEOETATrafficUpdateWaypointRoute *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  GEOClientCapabilities *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  const __CFString *v39;
  void *v40;
  void *v41;
  GEOAdditionalEnabledMarkets *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t j;
  uint64_t v51;
  GEOWaypointTyped *v52;
  uint64_t v53;
  void *v54;
  const __CFString *v55;
  void *v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t k;
  uint64_t v62;
  GEOWaypointTyped *v63;
  uint64_t v64;
  void *v65;
  const __CFString *v66;
  void *v67;
  const __CFString *v68;
  void *v69;
  void *v70;
  const __CFString *v71;
  void *v72;
  id v73;
  uint64_t v74;
  const __CFString *v75;
  void *v76;
  GEOCommonOptions *v77;
  uint64_t v78;
  void *v79;
  const __CFString *v80;
  void *v81;
  GEOPDABClientDatasetMetadata *v82;
  uint64_t v83;
  void *v84;
  const __CFString *v85;
  void *v86;
  void *v87;
  void *v88;
  const __CFString *v89;
  void *v90;
  void *v91;
  const __CFString *v92;
  void *v93;
  GEOLocation *v94;
  uint64_t v95;
  void *v96;
  const __CFString *v97;
  void *v98;
  id v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t m;
  void *v104;
  void *v105;
  const __CFString *v106;
  void *v107;
  GEOClientFeedbackInfo *v108;
  uint64_t v109;
  void *v110;
  const __CFString *v111;
  void *v112;
  GEORecentLocationHistory *v113;
  uint64_t v114;
  void *v115;
  const __CFString *v116;
  void *v117;
  GEOPrivacyMetadata *v118;
  uint64_t v119;
  void *v120;
  const __CFString *v121;
  void *v122;
  const __CFString *v123;
  void *v124;
  GEOTripInfo *v125;
  uint64_t v126;
  void *v127;
  void *v128;
  id v129;
  uint64_t v130;
  void *v131;
  id v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t n;
  uint64_t v137;
  GEOGeoServiceTag *v138;
  uint64_t v139;
  void *v140;
  void *v141;
  id v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t ii;
  uint64_t v147;
  void *v148;
  void *v149;
  id v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t jj;
  void *v155;
  void *v156;
  const __CFString *v157;
  void *v158;
  const __CFString *v159;
  void *v160;
  void *v161;
  void *v163;
  void *v164;
  void *v165;
  id v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  __int128 v188;
  __int128 v189;
  __int128 v190;
  uint64_t v191;
  uint64_t v192;
  __int128 v193;
  __int128 v194;
  __int128 v195;
  __int128 v196;
  _BYTE v197[128];
  _BYTE v198[128];
  _BYTE v199[128];
  _BYTE v200[128];
  _BYTE v201[128];
  _BYTE v202[128];
  _BYTE v203[128];
  uint64_t v204;

  v204 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (!a1)
    goto LABEL_272;
  a1 = (id)objc_msgSend(a1, "init");

  if (!a1)
    goto LABEL_272;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("currentUserLocation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = [GEOLocation alloc];
    if ((a3 & 1) != 0)
      v8 = -[GEOLocation initWithJSON:](v7, "initWithJSON:", v6);
    else
      v8 = -[GEOLocation initWithDictionary:](v7, "initWithDictionary:", v6);
    v9 = (void *)v8;
    objc_msgSend(a1, "setCurrentUserLocation:", v8);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("routeAttributes"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = [GEORouteAttributes alloc];
    if ((a3 & 1) != 0)
      v12 = -[GEORouteAttributes initWithJSON:](v11, "initWithJSON:", v10);
    else
      v12 = -[GEORouteAttributes initWithDictionary:](v11, "initWithDictionary:", v10);
    v13 = (void *)v12;
    objc_msgSend(a1, "setRouteAttributes:", v12);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("includeBetterRouteSuggestion"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setIncludeBetterRouteSuggestion:", objc_msgSend(v14, "BOOLValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("route"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v166 = v5;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v195 = 0u;
    v196 = 0u;
    v193 = 0u;
    v194 = 0u;
    v16 = v15;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v193, v203, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v194;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v194 != v19)
            objc_enumerationMutation(v16);
          v21 = *(_QWORD *)(*((_QWORD *)&v193 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v22 = [GEOETARoute alloc];
            if ((a3 & 1) != 0)
              v23 = -[GEOETARoute initWithJSON:](v22, "initWithJSON:", v21);
            else
              v23 = -[GEOETARoute initWithDictionary:](v22, "initWithDictionary:", v21);
            v24 = (void *)v23;
            objc_msgSend(a1, "addRoute:", v23);

          }
        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v193, v203, 16);
      }
      while (v18);
    }

  }
  if (a3)
    v25 = CFSTR("waypointRoute");
  else
    v25 = CFSTR("waypoint_route");
  objc_msgSend(v5, "objectForKeyedSubscript:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v27 = [GEOETATrafficUpdateWaypointRoute alloc];
    if ((a3 & 1) != 0)
      v28 = -[GEOETATrafficUpdateWaypointRoute initWithJSON:](v27, "initWithJSON:", v26);
    else
      v28 = -[GEOETATrafficUpdateWaypointRoute initWithDictionary:](v27, "initWithDictionary:", v26);
    v29 = (void *)v28;
    objc_msgSend(a1, "setWaypointRoute:", v28);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("clientCapabilities"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v31 = [GEOClientCapabilities alloc];
    if ((a3 & 1) != 0)
      v32 = -[GEOClientCapabilities initWithJSON:](v31, "initWithJSON:", v30);
    else
      v32 = -[GEOClientCapabilities initWithDictionary:](v31, "initWithDictionary:", v30);
    v33 = (void *)v32;
    objc_msgSend(a1, "setClientCapabilities:", v32);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("directionsResponseID"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v34, 0);
    objc_msgSend(a1, "setDirectionsResponseID:", v35);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("etauResponseID"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v36, 0);
    objc_msgSend(a1, "setEtauResponseID:", v37);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("sessionID"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v191 = 0;
    v192 = 0;
    _GEOSessionIDFromDictionaryRepresentation(v38, &v191);
    objc_msgSend(a1, "setSessionID:", v191, v192);
  }

  if (a3)
    v39 = CFSTR("sessionRelativeTimestamp");
  else
    v39 = CFSTR("session_relative_timestamp");
  objc_msgSend(v5, "objectForKeyedSubscript:", v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v40, "doubleValue");
    objc_msgSend(a1, "setSessionRelativeTimestamp:");
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("additionalEnabledMarkets"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v42 = [GEOAdditionalEnabledMarkets alloc];
    if ((a3 & 1) != 0)
      v43 = -[GEOAdditionalEnabledMarkets initWithJSON:](v42, "initWithJSON:", v41);
    else
      v43 = -[GEOAdditionalEnabledMarkets initWithDictionary:](v42, "initWithDictionary:", v41);
    v44 = (void *)v43;
    objc_msgSend(a1, "setAdditionalEnabledMarkets:", v43);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("destinationWaypointTyped"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v189 = 0u;
    v190 = 0u;
    v187 = 0u;
    v188 = 0u;
    v163 = v45;
    v46 = v45;
    v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v187, v202, 16);
    if (v47)
    {
      v48 = v47;
      v49 = *(_QWORD *)v188;
      do
      {
        for (j = 0; j != v48; ++j)
        {
          if (*(_QWORD *)v188 != v49)
            objc_enumerationMutation(v46);
          v51 = *(_QWORD *)(*((_QWORD *)&v187 + 1) + 8 * j);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v52 = [GEOWaypointTyped alloc];
            if ((a3 & 1) != 0)
              v53 = -[GEOWaypointTyped initWithJSON:](v52, "initWithJSON:", v51);
            else
              v53 = -[GEOWaypointTyped initWithDictionary:](v52, "initWithDictionary:", v51);
            v54 = (void *)v53;
            objc_msgSend(a1, "addDestinationWaypointTyped:", v53, v163);

          }
        }
        v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v187, v202, 16);
      }
      while (v48);
    }

    v45 = v163;
    v5 = v166;
  }

  if (a3)
    v55 = CFSTR("waypointTyped");
  else
    v55 = CFSTR("waypoint_typed");
  objc_msgSend(v5, "objectForKeyedSubscript:", v55, v163);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v185 = 0u;
    v186 = 0u;
    v183 = 0u;
    v184 = 0u;
    v164 = v56;
    v57 = v56;
    v58 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v183, v201, 16);
    if (v58)
    {
      v59 = v58;
      v60 = *(_QWORD *)v184;
      do
      {
        for (k = 0; k != v59; ++k)
        {
          if (*(_QWORD *)v184 != v60)
            objc_enumerationMutation(v57);
          v62 = *(_QWORD *)(*((_QWORD *)&v183 + 1) + 8 * k);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v63 = [GEOWaypointTyped alloc];
            if ((a3 & 1) != 0)
              v64 = -[GEOWaypointTyped initWithJSON:](v63, "initWithJSON:", v62);
            else
              v64 = -[GEOWaypointTyped initWithDictionary:](v63, "initWithDictionary:", v62);
            v65 = (void *)v64;
            objc_msgSend(a1, "addWaypointTyped:", v64, v164);

          }
        }
        v59 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v183, v201, 16);
      }
      while (v59);
    }

    v56 = v164;
    v5 = v166;
  }

  if (a3)
    v66 = CFSTR("previouslyRejectedRerouteSavings");
  else
    v66 = CFSTR("previously_rejected_reroute_savings");
  objc_msgSend(v5, "objectForKeyedSubscript:", v66, v164);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setPreviouslyRejectedRerouteSavings:", objc_msgSend(v67, "unsignedIntValue"));

  if (a3)
    v68 = CFSTR("sessionState");
  else
    v68 = CFSTR("session_state");
  objc_msgSend(v5, "objectForKeyedSubscript:", v68);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v70 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v69, 0);
    objc_msgSend(a1, "setSessionState:", v70);

  }
  if (a3)
    v71 = CFSTR("rerouteStatus");
  else
    v71 = CFSTR("reroute_status");
  objc_msgSend(v5, "objectForKeyedSubscript:", v71);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v73 = v72;
    if ((objc_msgSend(v73, "isEqualToString:", CFSTR("REROUTE_INACTIVE")) & 1) != 0)
    {
      v74 = 0;
    }
    else if ((objc_msgSend(v73, "isEqualToString:", CFSTR("REROUTE_PROPOSED")) & 1) != 0)
    {
      v74 = 1;
    }
    else if ((objc_msgSend(v73, "isEqualToString:", CFSTR("REROUTE_DECLINED")) & 1) != 0)
    {
      v74 = 2;
    }
    else if ((objc_msgSend(v73, "isEqualToString:", CFSTR("REROUTE_REJECTED")) & 1) != 0)
    {
      v74 = 3;
    }
    else if (objc_msgSend(v73, "isEqualToString:", CFSTR("REROUTE_ACCEPTED")))
    {
      v74 = 4;
    }
    else
    {
      v74 = 0;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_118;
    v74 = objc_msgSend(v72, "intValue");
  }
  objc_msgSend(a1, "setRerouteStatus:", v74);
LABEL_118:

  if (a3)
    v75 = CFSTR("commonOptions");
  else
    v75 = CFSTR("common_options");
  objc_msgSend(v5, "objectForKeyedSubscript:", v75);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v77 = [GEOCommonOptions alloc];
    if ((a3 & 1) != 0)
      v78 = -[GEOCommonOptions initWithJSON:](v77, "initWithJSON:", v76);
    else
      v78 = -[GEOCommonOptions initWithDictionary:](v77, "initWithDictionary:", v76);
    v79 = (void *)v78;
    objc_msgSend(a1, "setCommonOptions:", v78);

  }
  if (a3)
    v80 = CFSTR("abClientMetadata");
  else
    v80 = CFSTR("ab_client_metadata");
  objc_msgSend(v5, "objectForKeyedSubscript:", v80);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v82 = [GEOPDABClientDatasetMetadata alloc];
    if ((a3 & 1) != 0)
      v83 = -[GEOPDABClientDatasetMetadata initWithJSON:](v82, "initWithJSON:", v81);
    else
      v83 = -[GEOPDABClientDatasetMetadata initWithDictionary:](v82, "initWithDictionary:", v81);
    v84 = (void *)v83;
    objc_msgSend(a1, "setAbClientMetadata:", v83);

  }
  if (a3)
    v85 = CFSTR("maxAlternateRouteCount");
  else
    v85 = CFSTR("max_alternate_route_count");
  objc_msgSend(v5, "objectForKeyedSubscript:", v85);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setMaxAlternateRouteCount:", objc_msgSend(v86, "unsignedIntValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("tripID"));
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v88 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v87, 0);
    objc_msgSend(a1, "setTripID:", v88);

  }
  if (a3)
    v89 = CFSTR("requestingAppId");
  else
    v89 = CFSTR("requesting_app_id");
  objc_msgSend(v5, "objectForKeyedSubscript:", v89);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v91 = (void *)objc_msgSend(v90, "copy");
    objc_msgSend(a1, "setRequestingAppId:", v91);

  }
  if (a3)
    v92 = CFSTR("tripOrigin");
  else
    v92 = CFSTR("trip_origin");
  objc_msgSend(v5, "objectForKeyedSubscript:", v92);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v94 = [GEOLocation alloc];
    if ((a3 & 1) != 0)
      v95 = -[GEOLocation initWithJSON:](v94, "initWithJSON:", v93);
    else
      v95 = -[GEOLocation initWithDictionary:](v94, "initWithDictionary:", v93);
    v96 = (void *)v95;
    objc_msgSend(a1, "setTripOrigin:", v95);

  }
  if (a3)
    v97 = CFSTR("displayedBannerId");
  else
    v97 = CFSTR("displayed_banner_id");
  objc_msgSend(v5, "objectForKeyedSubscript:", v97);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v181 = 0u;
    v182 = 0u;
    v179 = 0u;
    v180 = 0u;
    v99 = v98;
    v100 = objc_msgSend(v99, "countByEnumeratingWithState:objects:count:", &v179, v200, 16);
    if (v100)
    {
      v101 = v100;
      v102 = *(_QWORD *)v180;
      do
      {
        for (m = 0; m != v101; ++m)
        {
          if (*(_QWORD *)v180 != v102)
            objc_enumerationMutation(v99);
          v104 = *(void **)(*((_QWORD *)&v179 + 1) + 8 * m);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v105 = (void *)objc_msgSend(v104, "copy");
            objc_msgSend(a1, "addDisplayedBannerId:", v105);

          }
        }
        v101 = objc_msgSend(v99, "countByEnumeratingWithState:objects:count:", &v179, v200, 16);
      }
      while (v101);
    }

    v5 = v166;
  }

  if (a3)
    v106 = CFSTR("clientFeedbackInfo");
  else
    v106 = CFSTR("client_feedback_info");
  objc_msgSend(v5, "objectForKeyedSubscript:", v106);
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v108 = [GEOClientFeedbackInfo alloc];
    if ((a3 & 1) != 0)
      v109 = -[GEOClientFeedbackInfo initWithJSON:](v108, "initWithJSON:", v107);
    else
      v109 = -[GEOClientFeedbackInfo initWithDictionary:](v108, "initWithDictionary:", v107);
    v110 = (void *)v109;
    objc_msgSend(a1, "setClientFeedbackInfo:", v109);

  }
  if (a3)
    v111 = CFSTR("recentLocationHistory");
  else
    v111 = CFSTR("recent_location_history");
  objc_msgSend(v5, "objectForKeyedSubscript:", v111);
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v113 = [GEORecentLocationHistory alloc];
    if ((a3 & 1) != 0)
      v114 = -[GEORecentLocationHistory initWithJSON:](v113, "initWithJSON:", v112);
    else
      v114 = -[GEORecentLocationHistory initWithDictionary:](v113, "initWithDictionary:", v112);
    v115 = (void *)v114;
    objc_msgSend(a1, "setRecentLocationHistory:", v114);

  }
  if (a3)
    v116 = CFSTR("privacyMetadata");
  else
    v116 = CFSTR("privacy_metadata");
  objc_msgSend(v5, "objectForKeyedSubscript:", v116);
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v118 = [GEOPrivacyMetadata alloc];
    if ((a3 & 1) != 0)
      v119 = -[GEOPrivacyMetadata initWithJSON:](v118, "initWithJSON:", v117);
    else
      v119 = -[GEOPrivacyMetadata initWithDictionary:](v118, "initWithDictionary:", v117);
    v120 = (void *)v119;
    objc_msgSend(a1, "setPrivacyMetadata:", v119);

  }
  if (a3)
    v121 = CFSTR("displayedEta");
  else
    v121 = CFSTR("displayed_eta");
  objc_msgSend(v5, "objectForKeyedSubscript:", v121);
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setDisplayedEta:", objc_msgSend(v122, "unsignedIntValue"));

  if (a3)
    v123 = CFSTR("tripInfo");
  else
    v123 = CFSTR("trip_info");
  objc_msgSend(v5, "objectForKeyedSubscript:", v123);
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v125 = [GEOTripInfo alloc];
    if ((a3 & 1) != 0)
      v126 = -[GEOTripInfo initWithJSON:](v125, "initWithJSON:", v124);
    else
      v126 = -[GEOTripInfo initWithDictionary:](v125, "initWithDictionary:", v124);
    v127 = (void *)v126;
    objc_msgSend(a1, "setTripInfo:", v126);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("purpose"));
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v129 = v128;
    if ((objc_msgSend(v129, "isEqualToString:", CFSTR("PURPOSE_UNKNOWN")) & 1) != 0)
    {
      v130 = 0;
    }
    else if ((objc_msgSend(v129, "isEqualToString:", CFSTR("REGULAR_ETA_UPDATE")) & 1) != 0)
    {
      v130 = 1;
    }
    else if ((objc_msgSend(v129, "isEqualToString:", CFSTR("SERVER_INITIATED_ETA_UPDATE")) & 1) != 0)
    {
      v130 = 2;
    }
    else if ((objc_msgSend(v129, "isEqualToString:", CFSTR("USER_ABORTED_TRIP")) & 1) != 0)
    {
      v130 = 3;
    }
    else if ((objc_msgSend(v129, "isEqualToString:", CFSTR("USER_PAUSED_TRIP_AT_WAYPOINT")) & 1) != 0)
    {
      v130 = 4;
    }
    else if ((objc_msgSend(v129, "isEqualToString:", CFSTR("USER_COMPLETED_TRIP")) & 1) != 0)
    {
      v130 = 5;
    }
    else if (objc_msgSend(v129, "isEqualToString:", CFSTR("USER_ADVANCED_TO_NEXT_LEG")))
    {
      v130 = 6;
    }
    else
    {
      v130 = 0;
    }

    goto LABEL_224;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v130 = objc_msgSend(v128, "intValue");
LABEL_224:
    objc_msgSend(a1, "setPurpose:", v130);
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("serviceTag"));
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v177 = 0u;
    v178 = 0u;
    v175 = 0u;
    v176 = 0u;
    v165 = v131;
    v132 = v131;
    v133 = objc_msgSend(v132, "countByEnumeratingWithState:objects:count:", &v175, v199, 16);
    if (v133)
    {
      v134 = v133;
      v135 = *(_QWORD *)v176;
      do
      {
        for (n = 0; n != v134; ++n)
        {
          if (*(_QWORD *)v176 != v135)
            objc_enumerationMutation(v132);
          v137 = *(_QWORD *)(*((_QWORD *)&v175 + 1) + 8 * n);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v138 = [GEOGeoServiceTag alloc];
            if ((a3 & 1) != 0)
              v139 = -[GEOGeoServiceTag initWithJSON:](v138, "initWithJSON:", v137);
            else
              v139 = -[GEOGeoServiceTag initWithDictionary:](v138, "initWithDictionary:", v137);
            v140 = (void *)v139;
            objc_msgSend(a1, "addServiceTag:", v139, v165);

          }
        }
        v134 = objc_msgSend(v132, "countByEnumeratingWithState:objects:count:", &v175, v199, 16);
      }
      while (v134);
    }

    v131 = v165;
    v5 = v166;
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("trafficApiResponses"));
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v173 = 0u;
    v174 = 0u;
    v171 = 0u;
    v172 = 0u;
    v142 = v141;
    v143 = objc_msgSend(v142, "countByEnumeratingWithState:objects:count:", &v171, v198, 16);
    if (v143)
    {
      v144 = v143;
      v145 = *(_QWORD *)v172;
      do
      {
        for (ii = 0; ii != v144; ++ii)
        {
          if (*(_QWORD *)v172 != v145)
            objc_enumerationMutation(v142);
          v147 = *(_QWORD *)(*((_QWORD *)&v171 + 1) + 8 * ii);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v148 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v147, 0);
            objc_msgSend(a1, "addTrafficApiResponses:", v148);

          }
        }
        v144 = objc_msgSend(v142, "countByEnumeratingWithState:objects:count:", &v171, v198, 16);
      }
      while (v144);
    }

    v5 = v166;
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("trafficSnapshotIds"));
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v169 = 0u;
    v170 = 0u;
    v167 = 0u;
    v168 = 0u;
    v150 = v149;
    v151 = objc_msgSend(v150, "countByEnumeratingWithState:objects:count:", &v167, v197, 16);
    if (v151)
    {
      v152 = v151;
      v153 = *(_QWORD *)v168;
      do
      {
        for (jj = 0; jj != v152; ++jj)
        {
          if (*(_QWORD *)v168 != v153)
            objc_enumerationMutation(v150);
          v155 = *(void **)(*((_QWORD *)&v167 + 1) + 8 * jj);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v156 = (void *)objc_msgSend(v155, "copy");
            objc_msgSend(a1, "addTrafficSnapshotIds:", v156);

          }
        }
        v152 = objc_msgSend(v150, "countByEnumeratingWithState:objects:count:", &v167, v197, 16);
      }
      while (v152);
    }

  }
  if (a3)
    v157 = CFSTR("trafficSnapshotUnixTime");
  else
    v157 = CFSTR("traffic_snapshot_unix_time");
  objc_msgSend(v5, "objectForKeyedSubscript:", v157, v165);
  v158 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setTrafficSnapshotUnixTime:", objc_msgSend(v158, "unsignedIntValue"));

  if (a3)
    v159 = CFSTR("xpcUuid");
  else
    v159 = CFSTR("xpc_uuid");
  objc_msgSend(v5, "objectForKeyedSubscript:", v159);
  v160 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v161 = (void *)objc_msgSend(v160, "copy");
    objc_msgSend(a1, "setXpcUuid:", v161);

  }
  a1 = a1;

LABEL_272:
  return a1;
}

- (GEOETATrafficUpdateRequest)initWithJSON:(id)a3
{
  return (GEOETATrafficUpdateRequest *)-[GEOETATrafficUpdateRequest _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_1295;
    else
      v8 = (int *)&readAll__nonRecursiveTag_1296;
    GEOETATrafficUpdateRequestReadSpecified((uint64_t)self, (uint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEOETATrafficUpdateRequestCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.super.isa);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOETATrafficUpdateRequestIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOETATrafficUpdateRequestReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  $A9051F91FD5D6DAB60BDAAD82EC423D1 flags;
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
  NSMutableArray *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t jj;
  PBDataReader *v35;
  void *v36;
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
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  uint64_t v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _BYTE v66[128];
  _BYTE v67[128];
  _BYTE v68[128];
  _BYTE v69[128];
  _BYTE v70[128];
  _BYTE v71[128];
  _BYTE v72[128];
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOETATrafficUpdateRequestIsDirty((uint64_t)self) & 1) == 0)
  {
    v35 = self->_reader;
    objc_sync_enter(v35);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v36);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v35);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOETATrafficUpdateRequest readAll:](self, "readAll:", 0);
    if (self->_currentUserLocation)
      PBDataWriterWriteSubmessage();
    if (self->_routeAttributes)
      PBDataWriterWriteSubmessage();
    if ((*((_BYTE *)&self->_flags + 1) & 1) != 0)
      PBDataWriterWriteBOOLField();
    v64 = 0u;
    v65 = 0u;
    v62 = 0u;
    v63 = 0u;
    v6 = self->_routes;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v62, v72, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v63;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v63 != v8)
            objc_enumerationMutation(v6);
          PBDataWriterWriteSubmessage();
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v62, v72, 16);
      }
      while (v7);
    }

    if (self->_waypointRoute)
      PBDataWriterWriteSubmessage();
    if (self->_clientCapabilities)
      PBDataWriterWriteSubmessage();
    if (self->_directionsResponseID)
      PBDataWriterWriteDataField();
    if (self->_etauResponseID)
      PBDataWriterWriteDataField();
    flags = self->_flags;
    if ((*(_BYTE *)&flags & 1) != 0)
    {
      v61 = 0;
      PBDataWriterPlaceMark();
      PBDataWriterWriteUint64Field();
      PBDataWriterWriteUint64Field();
      PBDataWriterRecallMark();
      flags = self->_flags;
    }
    if ((*(_BYTE *)&flags & 2) != 0)
      PBDataWriterWriteDoubleField();
    if (self->_additionalEnabledMarkets)
      PBDataWriterWriteSubmessage();
    v59 = 0u;
    v60 = 0u;
    v57 = 0u;
    v58 = 0u;
    v11 = self->_destinationWaypointTypeds;
    v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v57, v71, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v58;
      do
      {
        for (j = 0; j != v12; ++j)
        {
          if (*(_QWORD *)v58 != v13)
            objc_enumerationMutation(v11);
          PBDataWriterWriteSubmessage();
        }
        v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v57, v71, 16);
      }
      while (v12);
    }

    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    v15 = self->_waypointTypeds;
    v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v53, v70, 16);
    if (v16)
    {
      v17 = *(_QWORD *)v54;
      do
      {
        for (k = 0; k != v16; ++k)
        {
          if (*(_QWORD *)v54 != v17)
            objc_enumerationMutation(v15);
          PBDataWriterWriteSubmessage();
        }
        v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v53, v70, 16);
      }
      while (v16);
    }

    if ((*(_BYTE *)&self->_flags & 0x10) != 0)
      PBDataWriterWriteUint32Field();
    if (self->_sessionState)
      PBDataWriterWriteDataField();
    if ((*(_BYTE *)&self->_flags & 0x40) != 0)
      PBDataWriterWriteInt32Field();
    if (self->_commonOptions)
      PBDataWriterWriteSubmessage();
    if (self->_abClientMetadata)
      PBDataWriterWriteSubmessage();
    if ((*(_BYTE *)&self->_flags & 8) != 0)
      PBDataWriterWriteUint32Field();
    if (self->_tripID)
      PBDataWriterWriteDataField();
    if (self->_requestingAppId)
      PBDataWriterWriteStringField();
    if (self->_tripOrigin)
      PBDataWriterWriteSubmessage();
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    v19 = self->_displayedBannerIds;
    v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v49, v69, 16);
    if (v20)
    {
      v21 = *(_QWORD *)v50;
      do
      {
        for (m = 0; m != v20; ++m)
        {
          if (*(_QWORD *)v50 != v21)
            objc_enumerationMutation(v19);
          PBDataWriterWriteStringField();
        }
        v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v49, v69, 16);
      }
      while (v20);
    }

    if (self->_clientFeedbackInfo)
      PBDataWriterWriteSubmessage();
    if (self->_recentLocationHistory)
      PBDataWriterWriteSubmessage();
    if (self->_privacyMetadata)
      PBDataWriterWriteSubmessage();
    if ((*(_BYTE *)&self->_flags & 4) != 0)
      PBDataWriterWriteUint32Field();
    if (self->_tripInfo)
      PBDataWriterWriteSubmessage();
    if ((*(_BYTE *)&self->_flags & 0x20) != 0)
      PBDataWriterWriteInt32Field();
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    v23 = self->_serviceTags;
    v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v45, v68, 16);
    if (v24)
    {
      v25 = *(_QWORD *)v46;
      do
      {
        for (n = 0; n != v24; ++n)
        {
          if (*(_QWORD *)v46 != v25)
            objc_enumerationMutation(v23);
          PBDataWriterWriteSubmessage();
        }
        v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v45, v68, 16);
      }
      while (v24);
    }

    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v27 = self->_trafficApiResponses;
    v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v41, v67, 16);
    if (v28)
    {
      v29 = *(_QWORD *)v42;
      do
      {
        for (ii = 0; ii != v28; ++ii)
        {
          if (*(_QWORD *)v42 != v29)
            objc_enumerationMutation(v27);
          PBDataWriterWriteDataField();
        }
        v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v41, v67, 16);
      }
      while (v28);
    }

    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v31 = self->_trafficSnapshotIds;
    v32 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v37, v66, 16);
    if (v32)
    {
      v33 = *(_QWORD *)v38;
      do
      {
        for (jj = 0; jj != v32; ++jj)
        {
          if (*(_QWORD *)v38 != v33)
            objc_enumerationMutation(v31);
          PBDataWriterWriteStringField();
        }
        v32 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v37, v66, 16);
      }
      while (v32);
    }

    if ((*(_BYTE *)&self->_flags & 0x80) != 0)
      PBDataWriterWriteUint32Field();
    if (self->_xpcUuid)
      PBDataWriterWriteStringField();
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v37);
  }

}

- (void)clearSensitiveFields:(unint64_t)a3
{
  GEOETATrafficUpdateRequestClearSensitiveFields((id *)&self->super.super.super.isa, a3, 1);
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;
  BOOL v5;
  NSMutableArray *v6;
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
  __int128 v20;
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
  _BYTE v32[128];
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v3 = a3;
  v35 = *MEMORY[0x1E0C80C00];
  -[GEOETATrafficUpdateRequest _readCurrentUserLocation]((uint64_t)self);
  if (-[GEOLocation hasGreenTeaWithValue:](self->_currentUserLocation, "hasGreenTeaWithValue:", v3))
    return 1;
  -[GEOETATrafficUpdateRequest _readDestinationWaypointTypeds]((uint64_t)self);
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v6 = self->_destinationWaypointTypeds;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v29;
LABEL_5:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v29 != v9)
        objc_enumerationMutation(v6);
      if ((objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * v10), "hasGreenTeaWithValue:", v3) & 1) != 0)
        goto LABEL_30;
      if (v8 == ++v10)
      {
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
        if (v8)
          goto LABEL_5;
        break;
      }
    }
  }

  -[GEOETATrafficUpdateRequest _readRoutes]((uint64_t)self);
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v6 = self->_routes;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v25;
LABEL_13:
    v14 = 0;
    while (1)
    {
      if (*(_QWORD *)v25 != v13)
        objc_enumerationMutation(v6);
      if ((objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v14), "hasGreenTeaWithValue:", v3) & 1) != 0)
        goto LABEL_30;
      if (v12 == ++v14)
      {
        v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
        if (v12)
          goto LABEL_13;
        break;
      }
    }
  }

  -[GEOETATrafficUpdateRequest _readTripOrigin]((uint64_t)self);
  if (!-[GEOLocation hasGreenTeaWithValue:](self->_tripOrigin, "hasGreenTeaWithValue:", v3))
  {
    -[GEOETATrafficUpdateRequest _readWaypointRoute]((uint64_t)self);
    if (!-[GEOETATrafficUpdateWaypointRoute hasGreenTeaWithValue:](self->_waypointRoute, "hasGreenTeaWithValue:", v3))
    {
      -[GEOETATrafficUpdateRequest _readWaypointTypeds]((uint64_t)self);
      v22 = 0u;
      v23 = 0u;
      v20 = 0u;
      v21 = 0u;
      v6 = self->_waypointTypeds;
      v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
      if (!v15)
      {
LABEL_29:
        v5 = 0;
LABEL_31:

        return v5;
      }
      v16 = v15;
      v17 = *(_QWORD *)v21;
LABEL_23:
      v18 = 0;
      while (1)
      {
        if (*(_QWORD *)v21 != v17)
          objc_enumerationMutation(v6);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v18), "hasGreenTeaWithValue:", v3, (_QWORD)v20) & 1) != 0)
          break;
        if (v16 == ++v18)
        {
          v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
          if (v16)
            goto LABEL_23;
          goto LABEL_29;
        }
      }
LABEL_30:
      v5 = 1;
      goto LABEL_31;
    }
  }
  return 1;
}

- (unsigned)requestTypeCode
{
  return 48;
}

- (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  id *v8;
  $A9051F91FD5D6DAB60BDAAD82EC423D1 flags;
  unint64_t v10;
  unint64_t v11;
  uint64_t j;
  void *v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t k;
  void *v17;
  id *v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t m;
  void *v22;
  id *v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t n;
  void *v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t ii;
  void *v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t jj;
  void *v35;
  id *v36;
  id *v37;

  v37 = (id *)a3;
  -[GEOETATrafficUpdateRequest readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v37 + 1, self->_reader);
  *((_DWORD *)v37 + 62) = self->_readerMarkPos;
  *((_DWORD *)v37 + 63) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_currentUserLocation)
    objc_msgSend(v37, "setCurrentUserLocation:");
  if (self->_routeAttributes)
    objc_msgSend(v37, "setRouteAttributes:");
  if ((*((_BYTE *)&self->_flags + 1) & 1) != 0)
  {
    *((_BYTE *)v37 + 284) = self->_includeBetterRouteSuggestion;
    v37[36] = (id)((unint64_t)v37[36] | 0x100);
  }
  if (-[GEOETATrafficUpdateRequest routesCount](self, "routesCount"))
  {
    objc_msgSend(v37, "clearRoutes");
    v4 = -[GEOETATrafficUpdateRequest routesCount](self, "routesCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[GEOETATrafficUpdateRequest routeAtIndex:](self, "routeAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "addRoute:", v7);

      }
    }
  }
  if (self->_waypointRoute)
    objc_msgSend(v37, "setWaypointRoute:");
  v8 = v37;
  if (self->_clientCapabilities)
  {
    objc_msgSend(v37, "setClientCapabilities:");
    v8 = v37;
  }
  if (self->_directionsResponseID)
  {
    objc_msgSend(v37, "setDirectionsResponseID:");
    v8 = v37;
  }
  if (self->_etauResponseID)
  {
    objc_msgSend(v37, "setEtauResponseID:");
    v8 = v37;
  }
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 1) != 0)
  {
    *(GEOSessionID *)(v8 + 3) = self->_sessionID;
    v8[36] = (id)((unint64_t)v8[36] | 1);
    flags = self->_flags;
  }
  if ((*(_BYTE *)&flags & 2) != 0)
  {
    v8[21] = *(id *)&self->_sessionRelativeTimestamp;
    v8[36] = (id)((unint64_t)v8[36] | 2);
  }
  if (self->_additionalEnabledMarkets)
    objc_msgSend(v37, "setAdditionalEnabledMarkets:");
  if (-[GEOETATrafficUpdateRequest destinationWaypointTypedsCount](self, "destinationWaypointTypedsCount"))
  {
    objc_msgSend(v37, "clearDestinationWaypointTypeds");
    v10 = -[GEOETATrafficUpdateRequest destinationWaypointTypedsCount](self, "destinationWaypointTypedsCount");
    if (v10)
    {
      v11 = v10;
      for (j = 0; j != v11; ++j)
      {
        -[GEOETATrafficUpdateRequest destinationWaypointTypedAtIndex:](self, "destinationWaypointTypedAtIndex:", j);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "addDestinationWaypointTyped:", v13);

      }
    }
  }
  if (-[GEOETATrafficUpdateRequest waypointTypedsCount](self, "waypointTypedsCount"))
  {
    objc_msgSend(v37, "clearWaypointTypeds");
    v14 = -[GEOETATrafficUpdateRequest waypointTypedsCount](self, "waypointTypedsCount");
    if (v14)
    {
      v15 = v14;
      for (k = 0; k != v15; ++k)
      {
        -[GEOETATrafficUpdateRequest waypointTypedAtIndex:](self, "waypointTypedAtIndex:", k);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "addWaypointTyped:", v17);

      }
    }
  }
  v18 = v37;
  if ((*(_BYTE *)&self->_flags & 0x10) != 0)
  {
    *((_DWORD *)v37 + 67) = self->_previouslyRejectedRerouteSavings;
    v37[36] = (id)((unint64_t)v37[36] | 0x10);
  }
  if (self->_sessionState)
  {
    objc_msgSend(v37, "setSessionState:");
    v18 = v37;
  }
  if ((*(_BYTE *)&self->_flags & 0x40) != 0)
  {
    *((_DWORD *)v18 + 69) = self->_rerouteStatus;
    v18[36] = (id)((unint64_t)v18[36] | 0x40);
  }
  if (self->_commonOptions)
  {
    objc_msgSend(v37, "setCommonOptions:");
    v18 = v37;
  }
  if (self->_abClientMetadata)
  {
    objc_msgSend(v37, "setAbClientMetadata:");
    v18 = v37;
  }
  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
    *((_DWORD *)v18 + 66) = self->_maxAlternateRouteCount;
    v18[36] = (id)((unint64_t)v18[36] | 8);
  }
  if (self->_tripID)
    objc_msgSend(v37, "setTripID:");
  if (self->_requestingAppId)
    objc_msgSend(v37, "setRequestingAppId:");
  if (self->_tripOrigin)
    objc_msgSend(v37, "setTripOrigin:");
  if (-[GEOETATrafficUpdateRequest displayedBannerIdsCount](self, "displayedBannerIdsCount"))
  {
    objc_msgSend(v37, "clearDisplayedBannerIds");
    v19 = -[GEOETATrafficUpdateRequest displayedBannerIdsCount](self, "displayedBannerIdsCount");
    if (v19)
    {
      v20 = v19;
      for (m = 0; m != v20; ++m)
      {
        -[GEOETATrafficUpdateRequest displayedBannerIdAtIndex:](self, "displayedBannerIdAtIndex:", m);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "addDisplayedBannerId:", v22);

      }
    }
  }
  if (self->_clientFeedbackInfo)
    objc_msgSend(v37, "setClientFeedbackInfo:");
  v23 = v37;
  if (self->_recentLocationHistory)
  {
    objc_msgSend(v37, "setRecentLocationHistory:");
    v23 = v37;
  }
  if (self->_privacyMetadata)
  {
    objc_msgSend(v37, "setPrivacyMetadata:");
    v23 = v37;
  }
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    *((_DWORD *)v23 + 65) = self->_displayedEta;
    v23[36] = (id)((unint64_t)v23[36] | 4);
  }
  if (self->_tripInfo)
  {
    objc_msgSend(v37, "setTripInfo:");
    v23 = v37;
  }
  if ((*(_BYTE *)&self->_flags & 0x20) != 0)
  {
    *((_DWORD *)v23 + 68) = self->_purpose;
    v23[36] = (id)((unint64_t)v23[36] | 0x20);
  }
  if (-[GEOETATrafficUpdateRequest serviceTagsCount](self, "serviceTagsCount"))
  {
    objc_msgSend(v37, "clearServiceTags");
    v24 = -[GEOETATrafficUpdateRequest serviceTagsCount](self, "serviceTagsCount");
    if (v24)
    {
      v25 = v24;
      for (n = 0; n != v25; ++n)
      {
        -[GEOETATrafficUpdateRequest serviceTagAtIndex:](self, "serviceTagAtIndex:", n);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "addServiceTag:", v27);

      }
    }
  }
  if (-[GEOETATrafficUpdateRequest trafficApiResponsesCount](self, "trafficApiResponsesCount"))
  {
    objc_msgSend(v37, "clearTrafficApiResponses");
    v28 = -[GEOETATrafficUpdateRequest trafficApiResponsesCount](self, "trafficApiResponsesCount");
    if (v28)
    {
      v29 = v28;
      for (ii = 0; ii != v29; ++ii)
      {
        -[GEOETATrafficUpdateRequest trafficApiResponsesAtIndex:](self, "trafficApiResponsesAtIndex:", ii);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "addTrafficApiResponses:", v31);

      }
    }
  }
  if (-[GEOETATrafficUpdateRequest trafficSnapshotIdsCount](self, "trafficSnapshotIdsCount"))
  {
    objc_msgSend(v37, "clearTrafficSnapshotIds");
    v32 = -[GEOETATrafficUpdateRequest trafficSnapshotIdsCount](self, "trafficSnapshotIdsCount");
    if (v32)
    {
      v33 = v32;
      for (jj = 0; jj != v33; ++jj)
      {
        -[GEOETATrafficUpdateRequest trafficSnapshotIdsAtIndex:](self, "trafficSnapshotIdsAtIndex:", jj);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "addTrafficSnapshotIds:", v35);

      }
    }
  }
  v36 = v37;
  if ((*(_BYTE *)&self->_flags & 0x80) != 0)
  {
    *((_DWORD *)v37 + 70) = self->_trafficSnapshotUnixTime;
    v37[36] = (id)((unint64_t)v37[36] | 0x80);
  }
  if (self->_xpcUuid)
  {
    objc_msgSend(v37, "setXpcUuid:");
    v36 = v37;
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
  NSMutableArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  $A9051F91FD5D6DAB60BDAAD82EC423D1 flags;
  id v27;
  void *v28;
  NSMutableArray *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  void *v33;
  NSMutableArray *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t k;
  void *v38;
  uint64_t v39;
  void *v40;
  id v41;
  void *v42;
  id v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  id v49;
  void *v50;
  NSMutableArray *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t m;
  void *v55;
  id v56;
  void *v57;
  id v58;
  void *v59;
  id v60;
  void *v61;
  id v62;
  void *v63;
  NSMutableArray *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t n;
  void *v68;
  NSMutableArray *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t ii;
  void *v73;
  NSMutableArray *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t jj;
  void *v78;
  uint64_t v79;
  void *v80;
  PBUnknownFields *v81;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  _BYTE v111[128];
  _BYTE v112[128];
  _BYTE v113[128];
  _BYTE v114[128];
  _BYTE v115[128];
  _BYTE v116[128];
  _BYTE v117[128];
  uint64_t v118;

  v118 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*((_BYTE *)&self->_flags + 4) & 8) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOETATrafficUpdateRequestReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_73;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOETATrafficUpdateRequest readAll:](self, "readAll:", 0);
  v9 = -[GEOLocation copyWithZone:](self->_currentUserLocation, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v9;

  v11 = -[GEORouteAttributes copyWithZone:](self->_routeAttributes, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 144);
  *(_QWORD *)(v5 + 144) = v11;

  if ((*((_BYTE *)&self->_flags + 1) & 1) != 0)
  {
    *(_BYTE *)(v5 + 284) = self->_includeBetterRouteSuggestion;
    *(_QWORD *)(v5 + 288) |= 0x100uLL;
  }
  v109 = 0u;
  v110 = 0u;
  v107 = 0u;
  v108 = 0u;
  v13 = self->_routes;
  v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v107, v117, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v108;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v108 != v15)
          objc_enumerationMutation(v13);
        v17 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v107 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addRoute:", v17);

      }
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v107, v117, 16);
    }
    while (v14);
  }

  v18 = -[GEOETATrafficUpdateWaypointRoute copyWithZone:](self->_waypointRoute, "copyWithZone:", a3);
  v19 = *(void **)(v5 + 224);
  *(_QWORD *)(v5 + 224) = v18;

  v20 = -[GEOClientCapabilities copyWithZone:](self->_clientCapabilities, "copyWithZone:", a3);
  v21 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v20;

  v22 = -[NSData copyWithZone:](self->_directionsResponseID, "copyWithZone:", a3);
  v23 = *(void **)(v5 + 96);
  *(_QWORD *)(v5 + 96) = v22;

  v24 = -[NSData copyWithZone:](self->_etauResponseID, "copyWithZone:", a3);
  v25 = *(void **)(v5 + 112);
  *(_QWORD *)(v5 + 112) = v24;

  flags = self->_flags;
  if ((*(_BYTE *)&flags & 1) != 0)
  {
    *(GEOSessionID *)(v5 + 24) = self->_sessionID;
    *(_QWORD *)(v5 + 288) |= 1uLL;
    flags = self->_flags;
  }
  if ((*(_BYTE *)&flags & 2) != 0)
  {
    *(double *)(v5 + 168) = self->_sessionRelativeTimestamp;
    *(_QWORD *)(v5 + 288) |= 2uLL;
  }
  v27 = -[GEOAdditionalEnabledMarkets copyWithZone:](self->_additionalEnabledMarkets, "copyWithZone:", a3);
  v28 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v27;

  v105 = 0u;
  v106 = 0u;
  v103 = 0u;
  v104 = 0u;
  v29 = self->_destinationWaypointTypeds;
  v30 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v103, v116, 16);
  if (v30)
  {
    v31 = *(_QWORD *)v104;
    do
    {
      for (j = 0; j != v30; ++j)
      {
        if (*(_QWORD *)v104 != v31)
          objc_enumerationMutation(v29);
        v33 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v103 + 1) + 8 * j), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addDestinationWaypointTyped:", v33);

      }
      v30 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v103, v116, 16);
    }
    while (v30);
  }

  v101 = 0u;
  v102 = 0u;
  v99 = 0u;
  v100 = 0u;
  v34 = self->_waypointTypeds;
  v35 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v34, "countByEnumeratingWithState:objects:count:", &v99, v115, 16);
  if (v35)
  {
    v36 = *(_QWORD *)v100;
    do
    {
      for (k = 0; k != v35; ++k)
      {
        if (*(_QWORD *)v100 != v36)
          objc_enumerationMutation(v34);
        v38 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v99 + 1) + 8 * k), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addWaypointTyped:", v38);

      }
      v35 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v34, "countByEnumeratingWithState:objects:count:", &v99, v115, 16);
    }
    while (v35);
  }

  if ((*(_BYTE *)&self->_flags & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 268) = self->_previouslyRejectedRerouteSavings;
    *(_QWORD *)(v5 + 288) |= 0x10uLL;
  }
  v39 = -[NSData copyWithZone:](self->_sessionState, "copyWithZone:", a3);
  v40 = *(void **)(v5 + 176);
  *(_QWORD *)(v5 + 176) = v39;

  if ((*(_BYTE *)&self->_flags & 0x40) != 0)
  {
    *(_DWORD *)(v5 + 276) = self->_rerouteStatus;
    *(_QWORD *)(v5 + 288) |= 0x40uLL;
  }
  v41 = -[GEOCommonOptions copyWithZone:](self->_commonOptions, "copyWithZone:", a3);
  v42 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v41;

  v43 = -[GEOPDABClientDatasetMetadata copyWithZone:](self->_abClientMetadata, "copyWithZone:", a3);
  v44 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v43;

  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
    *(_DWORD *)(v5 + 264) = self->_maxAlternateRouteCount;
    *(_QWORD *)(v5 + 288) |= 8uLL;
  }
  v45 = -[NSData copyWithZone:](self->_tripID, "copyWithZone:", a3);
  v46 = *(void **)(v5 + 200);
  *(_QWORD *)(v5 + 200) = v45;

  v47 = -[NSString copyWithZone:](self->_requestingAppId, "copyWithZone:", a3);
  v48 = *(void **)(v5 + 136);
  *(_QWORD *)(v5 + 136) = v47;

  v49 = -[GEOLocation copyWithZone:](self->_tripOrigin, "copyWithZone:", a3);
  v50 = *(void **)(v5 + 216);
  *(_QWORD *)(v5 + 216) = v49;

  v97 = 0u;
  v98 = 0u;
  v95 = 0u;
  v96 = 0u;
  v51 = self->_displayedBannerIds;
  v52 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v51, "countByEnumeratingWithState:objects:count:", &v95, v114, 16);
  if (v52)
  {
    v53 = *(_QWORD *)v96;
    do
    {
      for (m = 0; m != v52; ++m)
      {
        if (*(_QWORD *)v96 != v53)
          objc_enumerationMutation(v51);
        v55 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v95 + 1) + 8 * m), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addDisplayedBannerId:", v55);

      }
      v52 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v51, "countByEnumeratingWithState:objects:count:", &v95, v114, 16);
    }
    while (v52);
  }

  v56 = -[GEOClientFeedbackInfo copyWithZone:](self->_clientFeedbackInfo, "copyWithZone:", a3);
  v57 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v56;

  v58 = -[GEORecentLocationHistory copyWithZone:](self->_recentLocationHistory, "copyWithZone:", a3);
  v59 = *(void **)(v5 + 128);
  *(_QWORD *)(v5 + 128) = v58;

  v60 = -[GEOPrivacyMetadata copyWithZone:](self->_privacyMetadata, "copyWithZone:", a3);
  v61 = *(void **)(v5 + 120);
  *(_QWORD *)(v5 + 120) = v60;

  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    *(_DWORD *)(v5 + 260) = self->_displayedEta;
    *(_QWORD *)(v5 + 288) |= 4uLL;
  }
  v62 = -[GEOTripInfo copyWithZone:](self->_tripInfo, "copyWithZone:", a3);
  v63 = *(void **)(v5 + 208);
  *(_QWORD *)(v5 + 208) = v62;

  if ((*(_BYTE *)&self->_flags & 0x20) != 0)
  {
    *(_DWORD *)(v5 + 272) = self->_purpose;
    *(_QWORD *)(v5 + 288) |= 0x20uLL;
  }
  v93 = 0u;
  v94 = 0u;
  v91 = 0u;
  v92 = 0u;
  v64 = self->_serviceTags;
  v65 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v64, "countByEnumeratingWithState:objects:count:", &v91, v113, 16);
  if (v65)
  {
    v66 = *(_QWORD *)v92;
    do
    {
      for (n = 0; n != v65; ++n)
      {
        if (*(_QWORD *)v92 != v66)
          objc_enumerationMutation(v64);
        v68 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v91 + 1) + 8 * n), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addServiceTag:", v68);

      }
      v65 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v64, "countByEnumeratingWithState:objects:count:", &v91, v113, 16);
    }
    while (v65);
  }

  v89 = 0u;
  v90 = 0u;
  v87 = 0u;
  v88 = 0u;
  v69 = self->_trafficApiResponses;
  v70 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v69, "countByEnumeratingWithState:objects:count:", &v87, v112, 16);
  if (v70)
  {
    v71 = *(_QWORD *)v88;
    do
    {
      for (ii = 0; ii != v70; ++ii)
      {
        if (*(_QWORD *)v88 != v71)
          objc_enumerationMutation(v69);
        v73 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v87 + 1) + 8 * ii), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addTrafficApiResponses:", v73);

      }
      v70 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v69, "countByEnumeratingWithState:objects:count:", &v87, v112, 16);
    }
    while (v70);
  }

  v85 = 0u;
  v86 = 0u;
  v83 = 0u;
  v84 = 0u;
  v74 = self->_trafficSnapshotIds;
  v75 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v74, "countByEnumeratingWithState:objects:count:", &v83, v111, 16);
  if (v75)
  {
    v76 = *(_QWORD *)v84;
    do
    {
      for (jj = 0; jj != v75; ++jj)
      {
        if (*(_QWORD *)v84 != v76)
          objc_enumerationMutation(v74);
        v78 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v83 + 1) + 8 * jj), "copyWithZone:", a3, (_QWORD)v83);
        objc_msgSend((id)v5, "addTrafficSnapshotIds:", v78);

      }
      v75 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v74, "countByEnumeratingWithState:objects:count:", &v83, v111, 16);
    }
    while (v75);
  }

  if ((*(_BYTE *)&self->_flags & 0x80) != 0)
  {
    *(_DWORD *)(v5 + 280) = self->_trafficSnapshotUnixTime;
    *(_QWORD *)(v5 + 288) |= 0x80uLL;
  }
  v79 = -[NSString copyWithZone:](self->_xpcUuid, "copyWithZone:", a3, (_QWORD)v83);
  v80 = *(void **)(v5 + 240);
  *(_QWORD *)(v5 + 240) = v79;

  v81 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v81;
LABEL_73:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  GEOLocation *currentUserLocation;
  GEORouteAttributes *routeAttributes;
  uint64_t v7;
  NSMutableArray *routes;
  GEOETATrafficUpdateWaypointRoute *waypointRoute;
  GEOClientCapabilities *clientCapabilities;
  NSData *directionsResponseID;
  NSData *etauResponseID;
  $A9051F91FD5D6DAB60BDAAD82EC423D1 flags;
  uint64_t v14;
  GEOAdditionalEnabledMarkets *additionalEnabledMarkets;
  NSMutableArray *destinationWaypointTypeds;
  NSMutableArray *waypointTypeds;
  $A9051F91FD5D6DAB60BDAAD82EC423D1 v19;
  uint64_t v20;
  NSData *sessionState;
  GEOCommonOptions *commonOptions;
  GEOPDABClientDatasetMetadata *abClientMetadata;
  uint64_t v24;
  NSData *tripID;
  NSString *requestingAppId;
  GEOLocation *tripOrigin;
  NSMutableArray *displayedBannerIds;
  GEOClientFeedbackInfo *clientFeedbackInfo;
  GEORecentLocationHistory *recentLocationHistory;
  GEOPrivacyMetadata *privacyMetadata;
  $A9051F91FD5D6DAB60BDAAD82EC423D1 v32;
  uint64_t v33;
  GEOTripInfo *tripInfo;
  NSMutableArray *serviceTags;
  NSMutableArray *trafficApiResponses;
  NSMutableArray *trafficSnapshotIds;
  uint64_t v38;
  NSString *xpcUuid;
  char v40;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_106;
  -[GEOETATrafficUpdateRequest readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  currentUserLocation = self->_currentUserLocation;
  if ((unint64_t)currentUserLocation | *((_QWORD *)v4 + 10))
  {
    if (!-[GEOLocation isEqual:](currentUserLocation, "isEqual:"))
      goto LABEL_106;
  }
  routeAttributes = self->_routeAttributes;
  if ((unint64_t)routeAttributes | *((_QWORD *)v4 + 18))
  {
    if (!-[GEORouteAttributes isEqual:](routeAttributes, "isEqual:"))
      goto LABEL_106;
  }
  v7 = *((_QWORD *)v4 + 36);
  if ((*((_BYTE *)&self->_flags + 1) & 1) != 0)
  {
    if ((v7 & 0x100) == 0)
      goto LABEL_106;
    if (self->_includeBetterRouteSuggestion)
    {
      if (!*((_BYTE *)v4 + 284))
        goto LABEL_106;
    }
    else if (*((_BYTE *)v4 + 284))
    {
      goto LABEL_106;
    }
  }
  else if ((v7 & 0x100) != 0)
  {
    goto LABEL_106;
  }
  routes = self->_routes;
  if ((unint64_t)routes | *((_QWORD *)v4 + 19) && !-[NSMutableArray isEqual:](routes, "isEqual:"))
    goto LABEL_106;
  waypointRoute = self->_waypointRoute;
  if ((unint64_t)waypointRoute | *((_QWORD *)v4 + 28))
  {
    if (!-[GEOETATrafficUpdateWaypointRoute isEqual:](waypointRoute, "isEqual:"))
      goto LABEL_106;
  }
  clientCapabilities = self->_clientCapabilities;
  if ((unint64_t)clientCapabilities | *((_QWORD *)v4 + 7))
  {
    if (!-[GEOClientCapabilities isEqual:](clientCapabilities, "isEqual:"))
      goto LABEL_106;
  }
  directionsResponseID = self->_directionsResponseID;
  if ((unint64_t)directionsResponseID | *((_QWORD *)v4 + 12))
  {
    if (!-[NSData isEqual:](directionsResponseID, "isEqual:"))
      goto LABEL_106;
  }
  etauResponseID = self->_etauResponseID;
  if ((unint64_t)etauResponseID | *((_QWORD *)v4 + 14))
  {
    if (!-[NSData isEqual:](etauResponseID, "isEqual:"))
      goto LABEL_106;
  }
  flags = self->_flags;
  v14 = *((_QWORD *)v4 + 36);
  if ((*(_BYTE *)&flags & 1) != 0)
  {
    if ((v14 & 1) == 0)
      goto LABEL_106;
    if (self->_sessionID._high != *((_QWORD *)v4 + 3) || self->_sessionID._low != *((_QWORD *)v4 + 4))
      goto LABEL_106;
  }
  else if ((v14 & 1) != 0)
  {
    goto LABEL_106;
  }
  if ((*(_BYTE *)&flags & 2) != 0)
  {
    if ((v14 & 2) == 0 || self->_sessionRelativeTimestamp != *((double *)v4 + 21))
      goto LABEL_106;
  }
  else if ((v14 & 2) != 0)
  {
    goto LABEL_106;
  }
  additionalEnabledMarkets = self->_additionalEnabledMarkets;
  if ((unint64_t)additionalEnabledMarkets | *((_QWORD *)v4 + 6)
    && !-[GEOAdditionalEnabledMarkets isEqual:](additionalEnabledMarkets, "isEqual:"))
  {
    goto LABEL_106;
  }
  destinationWaypointTypeds = self->_destinationWaypointTypeds;
  if ((unint64_t)destinationWaypointTypeds | *((_QWORD *)v4 + 11))
  {
    if (!-[NSMutableArray isEqual:](destinationWaypointTypeds, "isEqual:"))
      goto LABEL_106;
  }
  waypointTypeds = self->_waypointTypeds;
  if ((unint64_t)waypointTypeds | *((_QWORD *)v4 + 29))
  {
    if (!-[NSMutableArray isEqual:](waypointTypeds, "isEqual:"))
      goto LABEL_106;
  }
  v19 = self->_flags;
  v20 = *((_QWORD *)v4 + 36);
  if ((*(_BYTE *)&v19 & 0x10) != 0)
  {
    if ((v20 & 0x10) == 0 || self->_previouslyRejectedRerouteSavings != *((_DWORD *)v4 + 67))
      goto LABEL_106;
  }
  else if ((v20 & 0x10) != 0)
  {
    goto LABEL_106;
  }
  sessionState = self->_sessionState;
  if ((unint64_t)sessionState | *((_QWORD *)v4 + 22))
  {
    if (!-[NSData isEqual:](sessionState, "isEqual:"))
      goto LABEL_106;
    v19 = self->_flags;
    v20 = *((_QWORD *)v4 + 36);
  }
  if ((*(_BYTE *)&v19 & 0x40) != 0)
  {
    if ((v20 & 0x40) == 0 || self->_rerouteStatus != *((_DWORD *)v4 + 69))
      goto LABEL_106;
  }
  else if ((v20 & 0x40) != 0)
  {
    goto LABEL_106;
  }
  commonOptions = self->_commonOptions;
  if ((unint64_t)commonOptions | *((_QWORD *)v4 + 9) && !-[GEOCommonOptions isEqual:](commonOptions, "isEqual:"))
    goto LABEL_106;
  abClientMetadata = self->_abClientMetadata;
  if ((unint64_t)abClientMetadata | *((_QWORD *)v4 + 5))
  {
    if (!-[GEOPDABClientDatasetMetadata isEqual:](abClientMetadata, "isEqual:"))
      goto LABEL_106;
  }
  v24 = *((_QWORD *)v4 + 36);
  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
    if ((v24 & 8) == 0 || self->_maxAlternateRouteCount != *((_DWORD *)v4 + 66))
      goto LABEL_106;
  }
  else if ((v24 & 8) != 0)
  {
    goto LABEL_106;
  }
  tripID = self->_tripID;
  if ((unint64_t)tripID | *((_QWORD *)v4 + 25) && !-[NSData isEqual:](tripID, "isEqual:"))
    goto LABEL_106;
  requestingAppId = self->_requestingAppId;
  if ((unint64_t)requestingAppId | *((_QWORD *)v4 + 17))
  {
    if (!-[NSString isEqual:](requestingAppId, "isEqual:"))
      goto LABEL_106;
  }
  tripOrigin = self->_tripOrigin;
  if ((unint64_t)tripOrigin | *((_QWORD *)v4 + 27))
  {
    if (!-[GEOLocation isEqual:](tripOrigin, "isEqual:"))
      goto LABEL_106;
  }
  displayedBannerIds = self->_displayedBannerIds;
  if ((unint64_t)displayedBannerIds | *((_QWORD *)v4 + 13))
  {
    if (!-[NSMutableArray isEqual:](displayedBannerIds, "isEqual:"))
      goto LABEL_106;
  }
  clientFeedbackInfo = self->_clientFeedbackInfo;
  if ((unint64_t)clientFeedbackInfo | *((_QWORD *)v4 + 8))
  {
    if (!-[GEOClientFeedbackInfo isEqual:](clientFeedbackInfo, "isEqual:"))
      goto LABEL_106;
  }
  recentLocationHistory = self->_recentLocationHistory;
  if ((unint64_t)recentLocationHistory | *((_QWORD *)v4 + 16))
  {
    if (!-[GEORecentLocationHistory isEqual:](recentLocationHistory, "isEqual:"))
      goto LABEL_106;
  }
  privacyMetadata = self->_privacyMetadata;
  if ((unint64_t)privacyMetadata | *((_QWORD *)v4 + 15))
  {
    if (!-[GEOPrivacyMetadata isEqual:](privacyMetadata, "isEqual:"))
      goto LABEL_106;
  }
  v32 = self->_flags;
  v33 = *((_QWORD *)v4 + 36);
  if ((*(_BYTE *)&v32 & 4) != 0)
  {
    if ((v33 & 4) == 0 || self->_displayedEta != *((_DWORD *)v4 + 65))
      goto LABEL_106;
  }
  else if ((v33 & 4) != 0)
  {
    goto LABEL_106;
  }
  tripInfo = self->_tripInfo;
  if ((unint64_t)tripInfo | *((_QWORD *)v4 + 26))
  {
    if (-[GEOTripInfo isEqual:](tripInfo, "isEqual:"))
    {
      v32 = self->_flags;
      v33 = *((_QWORD *)v4 + 36);
      goto LABEL_88;
    }
LABEL_106:
    v40 = 0;
    goto LABEL_107;
  }
LABEL_88:
  if ((*(_BYTE *)&v32 & 0x20) != 0)
  {
    if ((v33 & 0x20) == 0 || self->_purpose != *((_DWORD *)v4 + 68))
      goto LABEL_106;
  }
  else if ((v33 & 0x20) != 0)
  {
    goto LABEL_106;
  }
  serviceTags = self->_serviceTags;
  if ((unint64_t)serviceTags | *((_QWORD *)v4 + 20)
    && !-[NSMutableArray isEqual:](serviceTags, "isEqual:"))
  {
    goto LABEL_106;
  }
  trafficApiResponses = self->_trafficApiResponses;
  if ((unint64_t)trafficApiResponses | *((_QWORD *)v4 + 23))
  {
    if (!-[NSMutableArray isEqual:](trafficApiResponses, "isEqual:"))
      goto LABEL_106;
  }
  trafficSnapshotIds = self->_trafficSnapshotIds;
  if ((unint64_t)trafficSnapshotIds | *((_QWORD *)v4 + 24))
  {
    if (!-[NSMutableArray isEqual:](trafficSnapshotIds, "isEqual:"))
      goto LABEL_106;
  }
  v38 = *((_QWORD *)v4 + 36);
  if ((*(_BYTE *)&self->_flags & 0x80) != 0)
  {
    if ((v38 & 0x80) == 0 || self->_trafficSnapshotUnixTime != *((_DWORD *)v4 + 70))
      goto LABEL_106;
  }
  else if ((v38 & 0x80) != 0)
  {
    goto LABEL_106;
  }
  xpcUuid = self->_xpcUuid;
  if ((unint64_t)xpcUuid | *((_QWORD *)v4 + 30))
    v40 = -[NSString isEqual:](xpcUuid, "isEqual:");
  else
    v40 = 1;
LABEL_107:

  return v40;
}

- (unint64_t)hash
{
  $A9051F91FD5D6DAB60BDAAD82EC423D1 flags;
  double sessionRelativeTimestamp;
  double v5;
  long double v6;
  double v7;
  double v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  NSUInteger v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  unint64_t v45;

  -[GEOETATrafficUpdateRequest readAll:](self, "readAll:", 1);
  v45 = -[GEOLocation hash](self->_currentUserLocation, "hash");
  v44 = -[GEORouteAttributes hash](self->_routeAttributes, "hash");
  if ((*((_BYTE *)&self->_flags + 1) & 1) != 0)
    v43 = 2654435761 * self->_includeBetterRouteSuggestion;
  else
    v43 = 0;
  v42 = -[NSMutableArray hash](self->_routes, "hash");
  v41 = -[GEOETATrafficUpdateWaypointRoute hash](self->_waypointRoute, "hash");
  v40 = -[GEOClientCapabilities hash](self->_clientCapabilities, "hash");
  v39 = -[NSData hash](self->_directionsResponseID, "hash");
  v38 = -[NSData hash](self->_etauResponseID, "hash");
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 1) != 0)
  {
    v37 = PBHashBytes();
    if ((*(_QWORD *)&self->_flags & 2) != 0)
      goto LABEL_6;
LABEL_14:
    v36 = 0;
    goto LABEL_15;
  }
  v37 = 0;
  if ((*(_BYTE *)&flags & 2) == 0)
    goto LABEL_14;
LABEL_6:
  sessionRelativeTimestamp = self->_sessionRelativeTimestamp;
  v5 = -sessionRelativeTimestamp;
  if (sessionRelativeTimestamp >= 0.0)
    v5 = self->_sessionRelativeTimestamp;
  v6 = floor(v5 + 0.5);
  v7 = (v5 - v6) * 1.84467441e19;
  v8 = fmod(v6, 1.84467441e19);
  v9 = 2654435761u * (unint64_t)v8;
  v10 = v9 + (unint64_t)v7;
  if (v7 <= 0.0)
    v10 = 2654435761u * (unint64_t)v8;
  v11 = v9 - (unint64_t)fabs(v7);
  if (v7 >= 0.0)
    v11 = v10;
  v36 = v11;
LABEL_15:
  v35 = -[GEOAdditionalEnabledMarkets hash](self->_additionalEnabledMarkets, "hash");
  v34 = -[NSMutableArray hash](self->_destinationWaypointTypeds, "hash");
  v33 = -[NSMutableArray hash](self->_waypointTypeds, "hash");
  if ((*(_BYTE *)&self->_flags & 0x10) != 0)
    v32 = 2654435761 * self->_previouslyRejectedRerouteSavings;
  else
    v32 = 0;
  v31 = -[NSData hash](self->_sessionState, "hash");
  if ((*(_BYTE *)&self->_flags & 0x40) != 0)
    v30 = 2654435761 * self->_rerouteStatus;
  else
    v30 = 0;
  v29 = -[GEOCommonOptions hash](self->_commonOptions, "hash");
  v28 = -[GEOPDABClientDatasetMetadata hash](self->_abClientMetadata, "hash");
  if ((*(_BYTE *)&self->_flags & 8) != 0)
    v27 = 2654435761 * self->_maxAlternateRouteCount;
  else
    v27 = 0;
  v26 = -[NSData hash](self->_tripID, "hash");
  v25 = -[NSString hash](self->_requestingAppId, "hash");
  v24 = -[GEOLocation hash](self->_tripOrigin, "hash");
  v23 = -[NSMutableArray hash](self->_displayedBannerIds, "hash");
  v22 = -[GEOClientFeedbackInfo hash](self->_clientFeedbackInfo, "hash");
  v21 = -[GEORecentLocationHistory hash](self->_recentLocationHistory, "hash");
  v12 = -[GEOPrivacyMetadata hash](self->_privacyMetadata, "hash");
  if ((*(_BYTE *)&self->_flags & 4) != 0)
    v13 = 2654435761 * self->_displayedEta;
  else
    v13 = 0;
  v14 = -[GEOTripInfo hash](self->_tripInfo, "hash");
  if ((*(_BYTE *)&self->_flags & 0x20) != 0)
    v15 = 2654435761 * self->_purpose;
  else
    v15 = 0;
  v16 = -[NSMutableArray hash](self->_serviceTags, "hash");
  v17 = -[NSMutableArray hash](self->_trafficApiResponses, "hash");
  v18 = -[NSMutableArray hash](self->_trafficSnapshotIds, "hash");
  if ((*(_BYTE *)&self->_flags & 0x80) != 0)
    v19 = 2654435761 * self->_trafficSnapshotUnixTime;
  else
    v19 = 0;
  return v44 ^ v45 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ -[NSString hash](self->_xpcUuid, "hash");
}

- (void)mergeFrom:(id)a3
{
  char *v4;
  GEOLocation *currentUserLocation;
  uint64_t v6;
  GEORouteAttributes *routeAttributes;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  GEOETATrafficUpdateWaypointRoute *waypointRoute;
  uint64_t v15;
  GEOClientCapabilities *clientCapabilities;
  uint64_t v17;
  uint64_t v18;
  GEOAdditionalEnabledMarkets *additionalEnabledMarkets;
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t k;
  GEOCommonOptions *commonOptions;
  uint64_t v32;
  GEOPDABClientDatasetMetadata *abClientMetadata;
  uint64_t v34;
  GEOLocation *tripOrigin;
  uint64_t v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t m;
  GEOClientFeedbackInfo *clientFeedbackInfo;
  uint64_t v43;
  GEORecentLocationHistory *recentLocationHistory;
  uint64_t v45;
  GEOPrivacyMetadata *privacyMetadata;
  uint64_t v47;
  GEOTripInfo *tripInfo;
  uint64_t v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t n;
  id v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t ii;
  id v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t jj;
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
  __int128 v92;
  _BYTE v93[128];
  _BYTE v94[128];
  _BYTE v95[128];
  _BYTE v96[128];
  _BYTE v97[128];
  _BYTE v98[128];
  _BYTE v99[128];
  uint64_t v100;

  v100 = *MEMORY[0x1E0C80C00];
  v4 = (char *)a3;
  objc_msgSend(v4, "readAll:", 0);
  currentUserLocation = self->_currentUserLocation;
  v6 = *((_QWORD *)v4 + 10);
  if (currentUserLocation)
  {
    if (v6)
      -[GEOLocation mergeFrom:](currentUserLocation, "mergeFrom:");
  }
  else if (v6)
  {
    -[GEOETATrafficUpdateRequest setCurrentUserLocation:](self, "setCurrentUserLocation:");
  }
  routeAttributes = self->_routeAttributes;
  v8 = *((_QWORD *)v4 + 18);
  if (routeAttributes)
  {
    if (v8)
      -[GEORouteAttributes mergeFrom:](routeAttributes, "mergeFrom:");
  }
  else if (v8)
  {
    -[GEOETATrafficUpdateRequest setRouteAttributes:](self, "setRouteAttributes:");
  }
  if ((v4[289] & 1) != 0)
  {
    self->_includeBetterRouteSuggestion = v4[284];
    *(_QWORD *)&self->_flags |= 0x100uLL;
  }
  v91 = 0u;
  v92 = 0u;
  v89 = 0u;
  v90 = 0u;
  v9 = *((id *)v4 + 19);
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v89, v99, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v90;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v90 != v12)
          objc_enumerationMutation(v9);
        -[GEOETATrafficUpdateRequest addRoute:](self, "addRoute:", *(_QWORD *)(*((_QWORD *)&v89 + 1) + 8 * i));
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v89, v99, 16);
    }
    while (v11);
  }

  waypointRoute = self->_waypointRoute;
  v15 = *((_QWORD *)v4 + 28);
  if (waypointRoute)
  {
    if (v15)
      -[GEOETATrafficUpdateWaypointRoute mergeFrom:](waypointRoute, "mergeFrom:");
  }
  else if (v15)
  {
    -[GEOETATrafficUpdateRequest setWaypointRoute:](self, "setWaypointRoute:");
  }
  clientCapabilities = self->_clientCapabilities;
  v17 = *((_QWORD *)v4 + 7);
  if (clientCapabilities)
  {
    if (v17)
      -[GEOClientCapabilities mergeFrom:](clientCapabilities, "mergeFrom:");
  }
  else if (v17)
  {
    -[GEOETATrafficUpdateRequest setClientCapabilities:](self, "setClientCapabilities:");
  }
  if (*((_QWORD *)v4 + 12))
    -[GEOETATrafficUpdateRequest setDirectionsResponseID:](self, "setDirectionsResponseID:");
  if (*((_QWORD *)v4 + 14))
    -[GEOETATrafficUpdateRequest setEtauResponseID:](self, "setEtauResponseID:");
  v18 = *((_QWORD *)v4 + 36);
  if ((v18 & 1) != 0)
  {
    self->_sessionID = *(GEOSessionID *)(v4 + 24);
    *(_QWORD *)&self->_flags |= 1uLL;
    v18 = *((_QWORD *)v4 + 36);
  }
  if ((v18 & 2) != 0)
  {
    self->_sessionRelativeTimestamp = *((double *)v4 + 21);
    *(_QWORD *)&self->_flags |= 2uLL;
  }
  additionalEnabledMarkets = self->_additionalEnabledMarkets;
  v20 = *((_QWORD *)v4 + 6);
  if (additionalEnabledMarkets)
  {
    if (v20)
      -[GEOAdditionalEnabledMarkets mergeFrom:](additionalEnabledMarkets, "mergeFrom:");
  }
  else if (v20)
  {
    -[GEOETATrafficUpdateRequest setAdditionalEnabledMarkets:](self, "setAdditionalEnabledMarkets:");
  }
  v87 = 0u;
  v88 = 0u;
  v85 = 0u;
  v86 = 0u;
  v21 = *((id *)v4 + 11);
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v85, v98, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v86;
    do
    {
      for (j = 0; j != v23; ++j)
      {
        if (*(_QWORD *)v86 != v24)
          objc_enumerationMutation(v21);
        -[GEOETATrafficUpdateRequest addDestinationWaypointTyped:](self, "addDestinationWaypointTyped:", *(_QWORD *)(*((_QWORD *)&v85 + 1) + 8 * j));
      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v85, v98, 16);
    }
    while (v23);
  }

  v83 = 0u;
  v84 = 0u;
  v81 = 0u;
  v82 = 0u;
  v26 = *((id *)v4 + 29);
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v81, v97, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v82;
    do
    {
      for (k = 0; k != v28; ++k)
      {
        if (*(_QWORD *)v82 != v29)
          objc_enumerationMutation(v26);
        -[GEOETATrafficUpdateRequest addWaypointTyped:](self, "addWaypointTyped:", *(_QWORD *)(*((_QWORD *)&v81 + 1) + 8 * k));
      }
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v81, v97, 16);
    }
    while (v28);
  }

  if ((v4[288] & 0x10) != 0)
  {
    self->_previouslyRejectedRerouteSavings = *((_DWORD *)v4 + 67);
    *(_QWORD *)&self->_flags |= 0x10uLL;
  }
  if (*((_QWORD *)v4 + 22))
    -[GEOETATrafficUpdateRequest setSessionState:](self, "setSessionState:");
  if ((v4[288] & 0x40) != 0)
  {
    self->_rerouteStatus = *((_DWORD *)v4 + 69);
    *(_QWORD *)&self->_flags |= 0x40uLL;
  }
  commonOptions = self->_commonOptions;
  v32 = *((_QWORD *)v4 + 9);
  if (commonOptions)
  {
    if (v32)
      -[GEOCommonOptions mergeFrom:](commonOptions, "mergeFrom:");
  }
  else if (v32)
  {
    -[GEOETATrafficUpdateRequest setCommonOptions:](self, "setCommonOptions:");
  }
  abClientMetadata = self->_abClientMetadata;
  v34 = *((_QWORD *)v4 + 5);
  if (abClientMetadata)
  {
    if (v34)
      -[GEOPDABClientDatasetMetadata mergeFrom:](abClientMetadata, "mergeFrom:");
  }
  else if (v34)
  {
    -[GEOETATrafficUpdateRequest setAbClientMetadata:](self, "setAbClientMetadata:");
  }
  if ((v4[288] & 8) != 0)
  {
    self->_maxAlternateRouteCount = *((_DWORD *)v4 + 66);
    *(_QWORD *)&self->_flags |= 8uLL;
  }
  if (*((_QWORD *)v4 + 25))
    -[GEOETATrafficUpdateRequest setTripID:](self, "setTripID:");
  if (*((_QWORD *)v4 + 17))
    -[GEOETATrafficUpdateRequest setRequestingAppId:](self, "setRequestingAppId:");
  tripOrigin = self->_tripOrigin;
  v36 = *((_QWORD *)v4 + 27);
  if (tripOrigin)
  {
    if (v36)
      -[GEOLocation mergeFrom:](tripOrigin, "mergeFrom:");
  }
  else if (v36)
  {
    -[GEOETATrafficUpdateRequest setTripOrigin:](self, "setTripOrigin:");
  }
  v79 = 0u;
  v80 = 0u;
  v77 = 0u;
  v78 = 0u;
  v37 = *((id *)v4 + 13);
  v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v77, v96, 16);
  if (v38)
  {
    v39 = v38;
    v40 = *(_QWORD *)v78;
    do
    {
      for (m = 0; m != v39; ++m)
      {
        if (*(_QWORD *)v78 != v40)
          objc_enumerationMutation(v37);
        -[GEOETATrafficUpdateRequest addDisplayedBannerId:](self, "addDisplayedBannerId:", *(_QWORD *)(*((_QWORD *)&v77 + 1) + 8 * m));
      }
      v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v77, v96, 16);
    }
    while (v39);
  }

  clientFeedbackInfo = self->_clientFeedbackInfo;
  v43 = *((_QWORD *)v4 + 8);
  if (clientFeedbackInfo)
  {
    if (v43)
      -[GEOClientFeedbackInfo mergeFrom:](clientFeedbackInfo, "mergeFrom:");
  }
  else if (v43)
  {
    -[GEOETATrafficUpdateRequest setClientFeedbackInfo:](self, "setClientFeedbackInfo:");
  }
  recentLocationHistory = self->_recentLocationHistory;
  v45 = *((_QWORD *)v4 + 16);
  if (recentLocationHistory)
  {
    if (v45)
      -[GEORecentLocationHistory mergeFrom:](recentLocationHistory, "mergeFrom:");
  }
  else if (v45)
  {
    -[GEOETATrafficUpdateRequest setRecentLocationHistory:](self, "setRecentLocationHistory:");
  }
  privacyMetadata = self->_privacyMetadata;
  v47 = *((_QWORD *)v4 + 15);
  if (privacyMetadata)
  {
    if (v47)
      -[GEOPrivacyMetadata mergeFrom:](privacyMetadata, "mergeFrom:");
  }
  else if (v47)
  {
    -[GEOETATrafficUpdateRequest setPrivacyMetadata:](self, "setPrivacyMetadata:");
  }
  if ((v4[288] & 4) != 0)
  {
    self->_displayedEta = *((_DWORD *)v4 + 65);
    *(_QWORD *)&self->_flags |= 4uLL;
  }
  tripInfo = self->_tripInfo;
  v49 = *((_QWORD *)v4 + 26);
  if (tripInfo)
  {
    if (v49)
      -[GEOTripInfo mergeFrom:](tripInfo, "mergeFrom:");
  }
  else if (v49)
  {
    -[GEOETATrafficUpdateRequest setTripInfo:](self, "setTripInfo:");
  }
  if ((v4[288] & 0x20) != 0)
  {
    self->_purpose = *((_DWORD *)v4 + 68);
    *(_QWORD *)&self->_flags |= 0x20uLL;
  }
  v75 = 0u;
  v76 = 0u;
  v73 = 0u;
  v74 = 0u;
  v50 = *((id *)v4 + 20);
  v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v73, v95, 16);
  if (v51)
  {
    v52 = v51;
    v53 = *(_QWORD *)v74;
    do
    {
      for (n = 0; n != v52; ++n)
      {
        if (*(_QWORD *)v74 != v53)
          objc_enumerationMutation(v50);
        -[GEOETATrafficUpdateRequest addServiceTag:](self, "addServiceTag:", *(_QWORD *)(*((_QWORD *)&v73 + 1) + 8 * n));
      }
      v52 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v73, v95, 16);
    }
    while (v52);
  }

  v71 = 0u;
  v72 = 0u;
  v69 = 0u;
  v70 = 0u;
  v55 = *((id *)v4 + 23);
  v56 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v69, v94, 16);
  if (v56)
  {
    v57 = v56;
    v58 = *(_QWORD *)v70;
    do
    {
      for (ii = 0; ii != v57; ++ii)
      {
        if (*(_QWORD *)v70 != v58)
          objc_enumerationMutation(v55);
        -[GEOETATrafficUpdateRequest addTrafficApiResponses:](self, "addTrafficApiResponses:", *(_QWORD *)(*((_QWORD *)&v69 + 1) + 8 * ii));
      }
      v57 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v69, v94, 16);
    }
    while (v57);
  }

  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  v60 = *((id *)v4 + 24);
  v61 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v65, v93, 16);
  if (v61)
  {
    v62 = v61;
    v63 = *(_QWORD *)v66;
    do
    {
      for (jj = 0; jj != v62; ++jj)
      {
        if (*(_QWORD *)v66 != v63)
          objc_enumerationMutation(v60);
        -[GEOETATrafficUpdateRequest addTrafficSnapshotIds:](self, "addTrafficSnapshotIds:", *(_QWORD *)(*((_QWORD *)&v65 + 1) + 8 * jj), (_QWORD)v65);
      }
      v62 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v65, v93, 16);
    }
    while (v62);
  }

  if (v4[288] < 0)
  {
    self->_trafficSnapshotUnixTime = *((_DWORD *)v4 + 70);
    *(_QWORD *)&self->_flags |= 0x80uLL;
  }
  if (*((_QWORD *)v4 + 30))
    -[GEOETATrafficUpdateRequest setXpcUuid:](self, "setXpcUuid:");

}

- (PBUnknownFields)unknownFields
{
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v5;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*((_BYTE *)&self->_flags + 1) & 2) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      v5 = reader;
      objc_sync_enter(v5);
      GEOETATrafficUpdateRequestReadSpecified((uint64_t)self, (uint64_t)self->_reader, (int *)&unknownFields_tags_1300);
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
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSMutableArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSMutableArray *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
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
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v3 = a3;
  v47 = *MEMORY[0x1E0C80C00];
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x800000200uLL;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEOETATrafficUpdateRequest readAll:](self, "readAll:", 0);
    -[GEOLocation clearUnknownFields:](self->_currentUserLocation, "clearUnknownFields:", 1);
    -[GEORouteAttributes clearUnknownFields:](self->_routeAttributes, "clearUnknownFields:", 1);
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v7 = self->_routes;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v39, v46, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v40;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v40 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * v11++), "clearUnknownFields:", 1);
        }
        while (v9 != v11);
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v39, v46, 16);
      }
      while (v9);
    }

    -[GEOETATrafficUpdateWaypointRoute clearUnknownFields:](self->_waypointRoute, "clearUnknownFields:", 1);
    -[GEOClientCapabilities clearUnknownFields:](self->_clientCapabilities, "clearUnknownFields:", 1);
    -[GEOAdditionalEnabledMarkets clearUnknownFields:](self->_additionalEnabledMarkets, "clearUnknownFields:", 1);
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v12 = self->_destinationWaypointTypeds;
    v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v36;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v36 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * v16++), "clearUnknownFields:", 1);
        }
        while (v14 != v16);
        v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
      }
      while (v14);
    }

    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v17 = self->_waypointTypeds;
    v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v31, v44, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v32;
      do
      {
        v21 = 0;
        do
        {
          if (*(_QWORD *)v32 != v20)
            objc_enumerationMutation(v17);
          objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * v21++), "clearUnknownFields:", 1);
        }
        while (v19 != v21);
        v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v31, v44, 16);
      }
      while (v19);
    }

    -[GEOCommonOptions clearUnknownFields:](self->_commonOptions, "clearUnknownFields:", 1);
    -[GEOPDABClientDatasetMetadata clearUnknownFields:](self->_abClientMetadata, "clearUnknownFields:", 1);
    -[GEOLocation clearUnknownFields:](self->_tripOrigin, "clearUnknownFields:", 1);
    -[GEOClientFeedbackInfo clearUnknownFields:](self->_clientFeedbackInfo, "clearUnknownFields:", 1);
    -[GEORecentLocationHistory clearUnknownFields:](self->_recentLocationHistory, "clearUnknownFields:", 1);
    -[GEOPrivacyMetadata clearUnknownFields:](self->_privacyMetadata, "clearUnknownFields:", 1);
    -[GEOTripInfo clearUnknownFields:](self->_tripInfo, "clearUnknownFields:", 1);
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v22 = self->_serviceTags;
    v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v27, v43, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v28;
      do
      {
        v26 = 0;
        do
        {
          if (*(_QWORD *)v28 != v25)
            objc_enumerationMutation(v22);
          objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * v26++), "clearUnknownFields:", 1, (_QWORD)v27);
        }
        while (v24 != v26);
        v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v27, v43, 16);
      }
      while (v24);
    }

  }
}

- (void)_readXpcUuid
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 256));
    if ((*(_BYTE *)(a1 + 292) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOETATrafficUpdateRequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readXpcUuid_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 256));
  }
}

- (BOOL)hasXpcUuid
{
  -[GEOETATrafficUpdateRequest _readXpcUuid]((uint64_t)self);
  return self->_xpcUuid != 0;
}

- (NSString)xpcUuid
{
  -[GEOETATrafficUpdateRequest _readXpcUuid]((uint64_t)self);
  return self->_xpcUuid;
}

- (void)setXpcUuid:(id)a3
{
  *(_QWORD *)&self->_flags |= 0xC00000000uLL;
  objc_storeStrong((id *)&self->_xpcUuid, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcUuid, 0);
  objc_storeStrong((id *)&self->_waypointTypeds, 0);
  objc_storeStrong((id *)&self->_waypointRoute, 0);
  objc_storeStrong((id *)&self->_tripOrigin, 0);
  objc_storeStrong((id *)&self->_tripInfo, 0);
  objc_storeStrong((id *)&self->_tripID, 0);
  objc_storeStrong((id *)&self->_trafficSnapshotIds, 0);
  objc_storeStrong((id *)&self->_trafficApiResponses, 0);
  objc_storeStrong((id *)&self->_sessionState, 0);
  objc_storeStrong((id *)&self->_serviceTags, 0);
  objc_storeStrong((id *)&self->_routes, 0);
  objc_storeStrong((id *)&self->_routeAttributes, 0);
  objc_storeStrong((id *)&self->_requestingAppId, 0);
  objc_storeStrong((id *)&self->_recentLocationHistory, 0);
  objc_storeStrong((id *)&self->_privacyMetadata, 0);
  objc_storeStrong((id *)&self->_etauResponseID, 0);
  objc_storeStrong((id *)&self->_displayedBannerIds, 0);
  objc_storeStrong((id *)&self->_directionsResponseID, 0);
  objc_storeStrong((id *)&self->_destinationWaypointTypeds, 0);
  objc_storeStrong((id *)&self->_currentUserLocation, 0);
  objc_storeStrong((id *)&self->_commonOptions, 0);
  objc_storeStrong((id *)&self->_clientFeedbackInfo, 0);
  objc_storeStrong((id *)&self->_clientCapabilities, 0);
  objc_storeStrong((id *)&self->_additionalEnabledMarkets, 0);
  objc_storeStrong((id *)&self->_abClientMetadata, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
