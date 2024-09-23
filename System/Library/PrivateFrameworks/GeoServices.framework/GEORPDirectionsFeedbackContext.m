@implementation GEORPDirectionsFeedbackContext

- (GEORPDirectionsFeedbackContext)init
{
  GEORPDirectionsFeedbackContext *v2;
  GEORPDirectionsFeedbackContext *v3;
  GEORPDirectionsFeedbackContext *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEORPDirectionsFeedbackContext;
  v2 = -[GEORPDirectionsFeedbackContext init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPDirectionsFeedbackContext)initWithData:(id)a3
{
  GEORPDirectionsFeedbackContext *v3;
  GEORPDirectionsFeedbackContext *v4;
  GEORPDirectionsFeedbackContext *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEORPDirectionsFeedbackContext;
  v3 = -[GEORPDirectionsFeedbackContext initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readDirectionsRequests
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 96) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPDirectionsFeedbackContextReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDirectionsRequests_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (NSMutableArray)directionsRequests
{
  -[GEORPDirectionsFeedbackContext _readDirectionsRequests]((uint64_t)self);
  return self->_directionsRequests;
}

- (void)setDirectionsRequests:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *directionsRequests;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x200u;
  directionsRequests = self->_directionsRequests;
  self->_directionsRequests = v4;

}

- (void)clearDirectionsRequests
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x200u;
  -[NSMutableArray removeAllObjects](self->_directionsRequests, "removeAllObjects");
}

- (void)addDirectionsRequest:(id)a3
{
  id v4;

  v4 = a3;
  -[GEORPDirectionsFeedbackContext _readDirectionsRequests]((uint64_t)self);
  -[GEORPDirectionsFeedbackContext _addNoFlagsDirectionsRequest:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x200u;
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

- (unint64_t)directionsRequestsCount
{
  -[GEORPDirectionsFeedbackContext _readDirectionsRequests]((uint64_t)self);
  return -[NSMutableArray count](self->_directionsRequests, "count");
}

- (id)directionsRequestAtIndex:(unint64_t)a3
{
  -[GEORPDirectionsFeedbackContext _readDirectionsRequests]((uint64_t)self);
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
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 96) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPDirectionsFeedbackContextReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDirectionsResponses_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (NSMutableArray)directionsResponses
{
  -[GEORPDirectionsFeedbackContext _readDirectionsResponses]((uint64_t)self);
  return self->_directionsResponses;
}

- (void)setDirectionsResponses:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *directionsResponses;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x200u;
  directionsResponses = self->_directionsResponses;
  self->_directionsResponses = v4;

}

- (void)clearDirectionsResponses
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 8u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x200u;
  -[NSMutableArray removeAllObjects](self->_directionsResponses, "removeAllObjects");
}

- (void)addDirectionsResponse:(id)a3
{
  id v4;

  v4 = a3;
  -[GEORPDirectionsFeedbackContext _readDirectionsResponses]((uint64_t)self);
  -[GEORPDirectionsFeedbackContext _addNoFlagsDirectionsResponse:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x200u;
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

- (unint64_t)directionsResponsesCount
{
  -[GEORPDirectionsFeedbackContext _readDirectionsResponses]((uint64_t)self);
  return -[NSMutableArray count](self->_directionsResponses, "count");
}

- (id)directionsResponseAtIndex:(unint64_t)a3
{
  -[GEORPDirectionsFeedbackContext _readDirectionsResponses]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_directionsResponses, "objectAtIndex:", a3);
}

+ (Class)directionsResponseType
{
  return (Class)objc_opt_class();
}

- (void)_readDirectionsWaypointPlaceInfos
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 96) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPDirectionsFeedbackContextReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDirectionsWaypointPlaceInfos_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (NSMutableArray)directionsWaypointPlaceInfos
{
  -[GEORPDirectionsFeedbackContext _readDirectionsWaypointPlaceInfos]((uint64_t)self);
  return self->_directionsWaypointPlaceInfos;
}

- (void)setDirectionsWaypointPlaceInfos:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *directionsWaypointPlaceInfos;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x200u;
  directionsWaypointPlaceInfos = self->_directionsWaypointPlaceInfos;
  self->_directionsWaypointPlaceInfos = v4;

}

- (void)clearDirectionsWaypointPlaceInfos
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x200u;
  -[NSMutableArray removeAllObjects](self->_directionsWaypointPlaceInfos, "removeAllObjects");
}

- (void)addDirectionsWaypointPlaceInfo:(id)a3
{
  id v4;

  v4 = a3;
  -[GEORPDirectionsFeedbackContext _readDirectionsWaypointPlaceInfos]((uint64_t)self);
  -[GEORPDirectionsFeedbackContext _addNoFlagsDirectionsWaypointPlaceInfo:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x200u;
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

- (unint64_t)directionsWaypointPlaceInfosCount
{
  -[GEORPDirectionsFeedbackContext _readDirectionsWaypointPlaceInfos]((uint64_t)self);
  return -[NSMutableArray count](self->_directionsWaypointPlaceInfos, "count");
}

- (id)directionsWaypointPlaceInfoAtIndex:(unint64_t)a3
{
  -[GEORPDirectionsFeedbackContext _readDirectionsWaypointPlaceInfos]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_directionsWaypointPlaceInfos, "objectAtIndex:", a3);
}

+ (Class)directionsWaypointPlaceInfoType
{
  return (Class)objc_opt_class();
}

- (void)_readStartWaypoint
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 96) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPDirectionsFeedbackContextReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readStartWaypoint_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (BOOL)hasStartWaypoint
{
  -[GEORPDirectionsFeedbackContext _readStartWaypoint]((uint64_t)self);
  return self->_startWaypoint != 0;
}

- (GEORPUserSearchInput)startWaypoint
{
  -[GEORPDirectionsFeedbackContext _readStartWaypoint]((uint64_t)self);
  return self->_startWaypoint;
}

- (void)setStartWaypoint:(id)a3
{
  *(_WORD *)&self->_flags |= 0x300u;
  objc_storeStrong((id *)&self->_startWaypoint, a3);
}

- (void)_readEndWaypoint
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 96) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPDirectionsFeedbackContextReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readEndWaypoint_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (BOOL)hasEndWaypoint
{
  -[GEORPDirectionsFeedbackContext _readEndWaypoint]((uint64_t)self);
  return self->_endWaypoint != 0;
}

- (GEORPUserSearchInput)endWaypoint
{
  -[GEORPDirectionsFeedbackContext _readEndWaypoint]((uint64_t)self);
  return self->_endWaypoint;
}

- (void)setEndWaypoint:(id)a3
{
  *(_WORD *)&self->_flags |= 0x220u;
  objc_storeStrong((id *)&self->_endWaypoint, a3);
}

- (void)_readRoutes
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 96) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPDirectionsFeedbackContextReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRoutes_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (NSMutableArray)routes
{
  -[GEORPDirectionsFeedbackContext _readRoutes]((uint64_t)self);
  return self->_routes;
}

- (void)setRoutes:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *routes;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x200u;
  routes = self->_routes;
  self->_routes = v4;

}

- (void)clearRoutes
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x200u;
  -[NSMutableArray removeAllObjects](self->_routes, "removeAllObjects");
}

- (void)addRoute:(id)a3
{
  id v4;

  v4 = a3;
  -[GEORPDirectionsFeedbackContext _readRoutes]((uint64_t)self);
  -[GEORPDirectionsFeedbackContext _addNoFlagsRoute:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x200u;
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
    v4 = *(void **)(a1 + 64);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 64);
      *(_QWORD *)(a1 + 64) = v5;

      v4 = *(void **)(a1 + 64);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)routesCount
{
  -[GEORPDirectionsFeedbackContext _readRoutes]((uint64_t)self);
  return -[NSMutableArray count](self->_routes, "count");
}

- (id)routeAtIndex:(unint64_t)a3
{
  -[GEORPDirectionsFeedbackContext _readRoutes]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_routes, "objectAtIndex:", a3);
}

+ (Class)routeType
{
  return (Class)objc_opt_class();
}

- (void)_readRerouteLocations
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 96) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPDirectionsFeedbackContextReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRerouteLocations_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (NSMutableArray)rerouteLocations
{
  -[GEORPDirectionsFeedbackContext _readRerouteLocations]((uint64_t)self);
  return self->_rerouteLocations;
}

- (void)setRerouteLocations:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *rerouteLocations;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x200u;
  rerouteLocations = self->_rerouteLocations;
  self->_rerouteLocations = v4;

}

- (void)clearRerouteLocations
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x200u;
  -[NSMutableArray removeAllObjects](self->_rerouteLocations, "removeAllObjects");
}

- (void)addRerouteLocation:(id)a3
{
  id v4;

  v4 = a3;
  -[GEORPDirectionsFeedbackContext _readRerouteLocations]((uint64_t)self);
  -[GEORPDirectionsFeedbackContext _addNoFlagsRerouteLocation:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x200u;
}

- (void)_addNoFlagsRerouteLocation:(uint64_t)a1
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

- (unint64_t)rerouteLocationsCount
{
  -[GEORPDirectionsFeedbackContext _readRerouteLocations]((uint64_t)self);
  return -[NSMutableArray count](self->_rerouteLocations, "count");
}

- (id)rerouteLocationAtIndex:(unint64_t)a3
{
  -[GEORPDirectionsFeedbackContext _readRerouteLocations]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_rerouteLocations, "objectAtIndex:", a3);
}

+ (Class)rerouteLocationType
{
  return (Class)objc_opt_class();
}

- (BOOL)isRouteToPerson
{
  return self->_isRouteToPerson;
}

- (void)setIsRouteToPerson:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x201u;
  self->_isRouteToPerson = a3;
}

- (void)setHasIsRouteToPerson:(BOOL)a3
{
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFE | a3 | 0x200;
}

- (BOOL)hasIsRouteToPerson
{
  return *(_WORD *)&self->_flags & 1;
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
  v8.super_class = (Class)GEORPDirectionsFeedbackContext;
  -[GEORPDirectionsFeedbackContext description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORPDirectionsFeedbackContext dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPDirectionsFeedbackContext _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t k;
  void *v29;
  void *v30;
  const __CFString *v31;
  void *v32;
  void *v33;
  void *v34;
  const __CFString *v35;
  void *v36;
  void *v37;
  void *v38;
  const __CFString *v39;
  void *v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t m;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t n;
  void *v54;
  void *v55;
  void *v56;
  const __CFString *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  id v63;
  _QWORD v65[4];
  id v66;
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
  _BYTE v87[128];
  _BYTE v88[128];
  _BYTE v89[128];
  _BYTE v90[128];
  _BYTE v91[128];
  uint64_t v92;

  v92 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 24), "count"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
    v83 = 0u;
    v84 = 0u;
    v85 = 0u;
    v86 = 0u;
    v6 = *(id *)(a1 + 24);
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v83, v91, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v84;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v84 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v11, "jsonRepresentation");
          else
            objc_msgSend(v11, "dictionaryRepresentation");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v12);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v83, v91, 16);
      }
      while (v8);
    }

    if (a2)
      v13 = CFSTR("directionsRequest");
    else
      v13 = CFSTR("directions_request");
    objc_msgSend(v4, "setObject:forKey:", v5, v13);

  }
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
    v79 = 0u;
    v80 = 0u;
    v81 = 0u;
    v82 = 0u;
    v15 = *(id *)(a1 + 32);
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v79, v90, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v80;
      do
      {
        for (j = 0; j != v17; ++j)
        {
          if (*(_QWORD *)v80 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * j);
          if ((a2 & 1) != 0)
            objc_msgSend(v20, "jsonRepresentation");
          else
            objc_msgSend(v20, "dictionaryRepresentation");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "addObject:", v21);

        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v79, v90, 16);
      }
      while (v17);
    }

    if (a2)
      v22 = CFSTR("directionsResponse");
    else
      v22 = CFSTR("directions_response");
    objc_msgSend(v4, "setObject:forKey:", v14, v22);

  }
  if (objc_msgSend(*(id *)(a1 + 40), "count"))
  {
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
    v75 = 0u;
    v76 = 0u;
    v77 = 0u;
    v78 = 0u;
    v24 = *(id *)(a1 + 40);
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v75, v89, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v76;
      do
      {
        for (k = 0; k != v26; ++k)
        {
          if (*(_QWORD *)v76 != v27)
            objc_enumerationMutation(v24);
          v29 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * k);
          if ((a2 & 1) != 0)
            objc_msgSend(v29, "jsonRepresentation");
          else
            objc_msgSend(v29, "dictionaryRepresentation");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "addObject:", v30);

        }
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v75, v89, 16);
      }
      while (v26);
    }

    if (a2)
      v31 = CFSTR("directionsWaypointPlaceInfo");
    else
      v31 = CFSTR("directions_waypoint_place_info");
    objc_msgSend(v4, "setObject:forKey:", v23, v31);

  }
  objc_msgSend((id)a1, "startWaypoint");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v32;
  if (v32)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v32, "jsonRepresentation");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = CFSTR("startWaypoint");
    }
    else
    {
      objc_msgSend(v32, "dictionaryRepresentation");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = CFSTR("start_waypoint");
    }
    objc_msgSend(v4, "setObject:forKey:", v34, v35);

  }
  objc_msgSend((id)a1, "endWaypoint");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v36;
  if (v36)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v36, "jsonRepresentation");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = CFSTR("endWaypoint");
    }
    else
    {
      objc_msgSend(v36, "dictionaryRepresentation");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = CFSTR("end_waypoint");
    }
    objc_msgSend(v4, "setObject:forKey:", v38, v39);

  }
  if (objc_msgSend(*(id *)(a1 + 64), "count"))
  {
    v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 64), "count"));
    v71 = 0u;
    v72 = 0u;
    v73 = 0u;
    v74 = 0u;
    v41 = *(id *)(a1 + 64);
    v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v71, v88, 16);
    if (v42)
    {
      v43 = v42;
      v44 = *(_QWORD *)v72;
      do
      {
        for (m = 0; m != v43; ++m)
        {
          if (*(_QWORD *)v72 != v44)
            objc_enumerationMutation(v41);
          v46 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * m);
          if ((a2 & 1) != 0)
            objc_msgSend(v46, "jsonRepresentation");
          else
            objc_msgSend(v46, "dictionaryRepresentation");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "addObject:", v47);

        }
        v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v71, v88, 16);
      }
      while (v43);
    }

    objc_msgSend(v4, "setObject:forKey:", v40, CFSTR("route"));
  }
  if (objc_msgSend(*(id *)(a1 + 56), "count"))
  {
    v48 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 56), "count"));
    v67 = 0u;
    v68 = 0u;
    v69 = 0u;
    v70 = 0u;
    v49 = *(id *)(a1 + 56);
    v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v67, v87, 16);
    if (v50)
    {
      v51 = v50;
      v52 = *(_QWORD *)v68;
      do
      {
        for (n = 0; n != v51; ++n)
        {
          if (*(_QWORD *)v68 != v52)
            objc_enumerationMutation(v49);
          v54 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * n);
          if ((a2 & 1) != 0)
            objc_msgSend(v54, "jsonRepresentation");
          else
            objc_msgSend(v54, "dictionaryRepresentation");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "addObject:", v55);

        }
        v51 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v67, v87, 16);
      }
      while (v51);
    }

    objc_msgSend(v4, "setObject:forKey:", v48, CFSTR("rerouteLocation"));
  }
  if ((*(_WORD *)(a1 + 96) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 92));
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v57 = CFSTR("isRouteToPerson");
    else
      v57 = CFSTR("is_route_to_person");
    objc_msgSend(v4, "setObject:forKey:", v56, v57);

  }
  v58 = *(void **)(a1 + 16);
  if (v58)
  {
    objc_msgSend(v58, "dictionaryRepresentation");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = v59;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v59, "count"));
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v65[0] = MEMORY[0x1E0C809B0];
      v65[1] = 3221225472;
      v65[2] = __60__GEORPDirectionsFeedbackContext__dictionaryRepresentation___block_invoke;
      v65[3] = &unk_1E1C00600;
      v62 = v61;
      v66 = v62;
      objc_msgSend(v60, "enumerateKeysAndObjectsUsingBlock:", v65);
      v63 = v62;

      v60 = v63;
    }
    objc_msgSend(v4, "setObject:forKey:", v60, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEORPDirectionsFeedbackContext _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __60__GEORPDirectionsFeedbackContext__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEORPDirectionsFeedbackContext)initWithDictionary:(id)a3
{
  return (GEORPDirectionsFeedbackContext *)-[GEORPDirectionsFeedbackContext _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  GEODirectionsRequest *v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  uint64_t v24;
  GEODirectionsResponse *v25;
  uint64_t v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t k;
  uint64_t v35;
  GEORPPlaceRequestResponse *v36;
  uint64_t v37;
  void *v38;
  const __CFString *v39;
  void *v40;
  GEORPUserSearchInput *v41;
  uint64_t v42;
  void *v43;
  const __CFString *v44;
  void *v45;
  GEORPUserSearchInput *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t m;
  uint64_t v55;
  GEOWaypointRoute *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  id v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t n;
  uint64_t v65;
  GEOLatLng *v66;
  uint64_t v67;
  void *v68;
  const __CFString *v69;
  void *v70;
  id v72;
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
  uint64_t v98;

  v98 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("directionsRequest");
      else
        v6 = CFSTR("directions_request");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v72 = v5;
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v91 = 0u;
        v92 = 0u;
        v89 = 0u;
        v90 = 0u;
        v8 = v7;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v89, v97, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v90;
          do
          {
            for (i = 0; i != v10; ++i)
            {
              if (*(_QWORD *)v90 != v11)
                objc_enumerationMutation(v8);
              v13 = *(_QWORD *)(*((_QWORD *)&v89 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v14 = [GEODirectionsRequest alloc];
                if ((a3 & 1) != 0)
                  v15 = -[GEODirectionsRequest initWithJSON:](v14, "initWithJSON:", v13);
                else
                  v15 = -[GEODirectionsRequest initWithDictionary:](v14, "initWithDictionary:", v13);
                v16 = (void *)v15;
                objc_msgSend(a1, "addDirectionsRequest:", v15);

              }
            }
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v89, v97, 16);
          }
          while (v10);
        }

        v5 = v72;
      }

      if (a3)
        v17 = CFSTR("directionsResponse");
      else
        v17 = CFSTR("directions_response");
      objc_msgSend(v5, "objectForKeyedSubscript:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v87 = 0u;
        v88 = 0u;
        v85 = 0u;
        v86 = 0u;
        v19 = v18;
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v85, v96, 16);
        if (v20)
        {
          v21 = v20;
          v22 = *(_QWORD *)v86;
          do
          {
            for (j = 0; j != v21; ++j)
            {
              if (*(_QWORD *)v86 != v22)
                objc_enumerationMutation(v19);
              v24 = *(_QWORD *)(*((_QWORD *)&v85 + 1) + 8 * j);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v25 = [GEODirectionsResponse alloc];
                if ((a3 & 1) != 0)
                  v26 = -[GEODirectionsResponse initWithJSON:](v25, "initWithJSON:", v24);
                else
                  v26 = -[GEODirectionsResponse initWithDictionary:](v25, "initWithDictionary:", v24);
                v27 = (void *)v26;
                objc_msgSend(a1, "addDirectionsResponse:", v26);

              }
            }
            v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v85, v96, 16);
          }
          while (v21);
        }

        v5 = v72;
      }

      if (a3)
        v28 = CFSTR("directionsWaypointPlaceInfo");
      else
        v28 = CFSTR("directions_waypoint_place_info");
      objc_msgSend(v5, "objectForKeyedSubscript:", v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v83 = 0u;
        v84 = 0u;
        v81 = 0u;
        v82 = 0u;
        v30 = v29;
        v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v81, v95, 16);
        if (v31)
        {
          v32 = v31;
          v33 = *(_QWORD *)v82;
          do
          {
            for (k = 0; k != v32; ++k)
            {
              if (*(_QWORD *)v82 != v33)
                objc_enumerationMutation(v30);
              v35 = *(_QWORD *)(*((_QWORD *)&v81 + 1) + 8 * k);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v36 = [GEORPPlaceRequestResponse alloc];
                if ((a3 & 1) != 0)
                  v37 = -[GEORPPlaceRequestResponse initWithJSON:](v36, "initWithJSON:", v35);
                else
                  v37 = -[GEORPPlaceRequestResponse initWithDictionary:](v36, "initWithDictionary:", v35);
                v38 = (void *)v37;
                objc_msgSend(a1, "addDirectionsWaypointPlaceInfo:", v37);

              }
            }
            v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v81, v95, 16);
          }
          while (v32);
        }

        v5 = v72;
      }

      if (a3)
        v39 = CFSTR("startWaypoint");
      else
        v39 = CFSTR("start_waypoint");
      objc_msgSend(v5, "objectForKeyedSubscript:", v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v41 = [GEORPUserSearchInput alloc];
        if ((a3 & 1) != 0)
          v42 = -[GEORPUserSearchInput initWithJSON:](v41, "initWithJSON:", v40);
        else
          v42 = -[GEORPUserSearchInput initWithDictionary:](v41, "initWithDictionary:", v40);
        v43 = (void *)v42;
        objc_msgSend(a1, "setStartWaypoint:", v42);

      }
      if (a3)
        v44 = CFSTR("endWaypoint");
      else
        v44 = CFSTR("end_waypoint");
      objc_msgSend(v5, "objectForKeyedSubscript:", v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v46 = [GEORPUserSearchInput alloc];
        if ((a3 & 1) != 0)
          v47 = -[GEORPUserSearchInput initWithJSON:](v46, "initWithJSON:", v45);
        else
          v47 = -[GEORPUserSearchInput initWithDictionary:](v46, "initWithDictionary:", v45);
        v48 = (void *)v47;
        objc_msgSend(a1, "setEndWaypoint:", v47);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("route"));
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v79 = 0u;
        v80 = 0u;
        v77 = 0u;
        v78 = 0u;
        v50 = v49;
        v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v77, v94, 16);
        if (v51)
        {
          v52 = v51;
          v53 = *(_QWORD *)v78;
          do
          {
            for (m = 0; m != v52; ++m)
            {
              if (*(_QWORD *)v78 != v53)
                objc_enumerationMutation(v50);
              v55 = *(_QWORD *)(*((_QWORD *)&v77 + 1) + 8 * m);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v56 = [GEOWaypointRoute alloc];
                if ((a3 & 1) != 0)
                  v57 = -[GEOWaypointRoute initWithJSON:](v56, "initWithJSON:", v55);
                else
                  v57 = -[GEOWaypointRoute initWithDictionary:](v56, "initWithDictionary:", v55);
                v58 = (void *)v57;
                objc_msgSend(a1, "addRoute:", v57);

              }
            }
            v52 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v77, v94, 16);
          }
          while (v52);
        }

        v5 = v72;
      }

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("rerouteLocation"));
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v75 = 0u;
        v76 = 0u;
        v73 = 0u;
        v74 = 0u;
        v60 = v59;
        v61 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v73, v93, 16);
        if (v61)
        {
          v62 = v61;
          v63 = *(_QWORD *)v74;
          do
          {
            for (n = 0; n != v62; ++n)
            {
              if (*(_QWORD *)v74 != v63)
                objc_enumerationMutation(v60);
              v65 = *(_QWORD *)(*((_QWORD *)&v73 + 1) + 8 * n);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v66 = [GEOLatLng alloc];
                if ((a3 & 1) != 0)
                  v67 = -[GEOLatLng initWithJSON:](v66, "initWithJSON:", v65);
                else
                  v67 = -[GEOLatLng initWithDictionary:](v66, "initWithDictionary:", v65);
                v68 = (void *)v67;
                objc_msgSend(a1, "addRerouteLocation:", v67);

              }
            }
            v62 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v73, v93, 16);
          }
          while (v62);
        }

        v5 = v72;
      }

      if (a3)
        v69 = CFSTR("isRouteToPerson");
      else
        v69 = CFSTR("is_route_to_person");
      objc_msgSend(v5, "objectForKeyedSubscript:", v69);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setIsRouteToPerson:", objc_msgSend(v70, "BOOLValue"));

    }
  }

  return a1;
}

- (GEORPDirectionsFeedbackContext)initWithJSON:(id)a3
{
  return (GEORPDirectionsFeedbackContext *)-[GEORPDirectionsFeedbackContext _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_685;
    else
      v8 = (int *)&readAll__nonRecursiveTag_686;
    GEORPDirectionsFeedbackContextReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEORPDirectionsFeedbackContextCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPDirectionsFeedbackContextIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPDirectionsFeedbackContextReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t k;
  NSMutableArray *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t m;
  NSMutableArray *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t n;
  PBDataReader *v26;
  void *v27;
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
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  _BYTE v49[128];
  _BYTE v50[128];
  _BYTE v51[128];
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEORPDirectionsFeedbackContextIsDirty((uint64_t)self) & 1) == 0)
  {
    v26 = self->_reader;
    objc_sync_enter(v26);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v27);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v26);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEORPDirectionsFeedbackContext readAll:](self, "readAll:", 0);
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v6 = self->_directionsRequests;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v45;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v45 != v8)
            objc_enumerationMutation(v6);
          PBDataWriterWriteSubmessage();
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
      }
      while (v7);
    }

    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v10 = self->_directionsResponses;
    v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v40, v51, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v41;
      do
      {
        for (j = 0; j != v11; ++j)
        {
          if (*(_QWORD *)v41 != v12)
            objc_enumerationMutation(v10);
          PBDataWriterWriteSubmessage();
        }
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v40, v51, 16);
      }
      while (v11);
    }

    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v14 = self->_directionsWaypointPlaceInfos;
    v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v36, v50, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v37;
      do
      {
        for (k = 0; k != v15; ++k)
        {
          if (*(_QWORD *)v37 != v16)
            objc_enumerationMutation(v14);
          PBDataWriterWriteSubmessage();
        }
        v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v36, v50, 16);
      }
      while (v15);
    }

    if (self->_startWaypoint)
      PBDataWriterWriteSubmessage();
    if (self->_endWaypoint)
      PBDataWriterWriteSubmessage();
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v18 = self->_routes;
    v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v32, v49, 16);
    if (v19)
    {
      v20 = *(_QWORD *)v33;
      do
      {
        for (m = 0; m != v19; ++m)
        {
          if (*(_QWORD *)v33 != v20)
            objc_enumerationMutation(v18);
          PBDataWriterWriteSubmessage();
        }
        v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v32, v49, 16);
      }
      while (v19);
    }

    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v22 = self->_rerouteLocations;
    v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v28, v48, 16);
    if (v23)
    {
      v24 = *(_QWORD *)v29;
      do
      {
        for (n = 0; n != v23; ++n)
        {
          if (*(_QWORD *)v29 != v24)
            objc_enumerationMutation(v22);
          PBDataWriterWriteSubmessage();
        }
        v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v28, v48, 16);
      }
      while (v23);
    }

    if ((*(_WORD *)&self->_flags & 1) != 0)
      PBDataWriterWriteBOOLField();
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v28);
  }

}

- (void)clearSensitiveFields:(unint64_t)a3
{
  GEORPDirectionsFeedbackContextClearSensitiveFields((id *)&self->super.super.isa, a3, 1);
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
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
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
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _BYTE v48[128];
  _BYTE v49[128];
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v3 = a3;
  v52 = *MEMORY[0x1E0C80C00];
  -[GEORPDirectionsFeedbackContext _readDirectionsRequests]((uint64_t)self);
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v5 = self->_directionsRequests;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v44;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v44 != v8)
        objc_enumerationMutation(v5);
      if ((objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * v9), "hasGreenTeaWithValue:", v3) & 1) != 0)
        goto LABEL_43;
      if (v7 == ++v9)
      {
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
        if (v7)
          goto LABEL_3;
        break;
      }
    }
  }

  -[GEORPDirectionsFeedbackContext _readDirectionsResponses]((uint64_t)self);
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v5 = self->_directionsResponses;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v39, v50, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v40;
LABEL_11:
    v13 = 0;
    while (1)
    {
      if (*(_QWORD *)v40 != v12)
        objc_enumerationMutation(v5);
      if ((objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * v13), "hasGreenTeaWithValue:", v3) & 1) != 0)
        goto LABEL_43;
      if (v11 == ++v13)
      {
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v39, v50, 16);
        if (v11)
          goto LABEL_11;
        break;
      }
    }
  }

  -[GEORPDirectionsFeedbackContext _readDirectionsWaypointPlaceInfos]((uint64_t)self);
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v5 = self->_directionsWaypointPlaceInfos;
  v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v35, v49, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v36;
LABEL_19:
    v17 = 0;
    while (1)
    {
      if (*(_QWORD *)v36 != v16)
        objc_enumerationMutation(v5);
      if ((objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * v17), "hasGreenTeaWithValue:", v3) & 1) != 0)
        break;
      if (v15 == ++v17)
      {
        v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v35, v49, 16);
        if (v15)
          goto LABEL_19;
        goto LABEL_25;
      }
    }
LABEL_43:

    return 1;
  }
LABEL_25:

  -[GEORPDirectionsFeedbackContext _readEndWaypoint]((uint64_t)self);
  if (!-[GEORPUserSearchInput hasGreenTeaWithValue:](self->_endWaypoint, "hasGreenTeaWithValue:", v3))
  {
    -[GEORPDirectionsFeedbackContext _readRerouteLocations]((uint64_t)self);
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v5 = self->_rerouteLocations;
    v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v31, v48, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v32;
LABEL_28:
      v21 = 0;
      while (1)
      {
        if (*(_QWORD *)v32 != v20)
          objc_enumerationMutation(v5);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * v21), "hasGreenTeaWithValue:", v3) & 1) != 0)
          break;
        if (v19 == ++v21)
        {
          v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v31, v48, 16);
          if (v19)
            goto LABEL_28;
          goto LABEL_34;
        }
      }
    }
    else
    {
LABEL_34:

      -[GEORPDirectionsFeedbackContext _readRoutes]((uint64_t)self);
      v29 = 0u;
      v30 = 0u;
      v27 = 0u;
      v28 = 0u;
      v5 = self->_routes;
      v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v27, v47, 16);
      if (!v22)
      {
LABEL_42:

        -[GEORPDirectionsFeedbackContext _readStartWaypoint]((uint64_t)self);
        return -[GEORPUserSearchInput hasGreenTeaWithValue:](self->_startWaypoint, "hasGreenTeaWithValue:", v3);
      }
      v23 = v22;
      v24 = *(_QWORD *)v28;
LABEL_36:
      v25 = 0;
      while (1)
      {
        if (*(_QWORD *)v28 != v24)
          objc_enumerationMutation(v5);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * v25), "hasGreenTeaWithValue:", v3, (_QWORD)v27) & 1) != 0)
          break;
        if (v23 == ++v25)
        {
          v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v27, v47, 16);
          if (v23)
            goto LABEL_36;
          goto LABEL_42;
        }
      }
    }
    goto LABEL_43;
  }
  return 1;
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
  unint64_t v16;
  unint64_t v17;
  uint64_t m;
  void *v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t n;
  void *v23;
  id *v24;

  v24 = (id *)a3;
  -[GEORPDirectionsFeedbackContext readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v24 + 1, self->_reader);
  *((_DWORD *)v24 + 20) = self->_readerMarkPos;
  *((_DWORD *)v24 + 21) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (-[GEORPDirectionsFeedbackContext directionsRequestsCount](self, "directionsRequestsCount"))
  {
    objc_msgSend(v24, "clearDirectionsRequests");
    v4 = -[GEORPDirectionsFeedbackContext directionsRequestsCount](self, "directionsRequestsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[GEORPDirectionsFeedbackContext directionsRequestAtIndex:](self, "directionsRequestAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "addDirectionsRequest:", v7);

      }
    }
  }
  if (-[GEORPDirectionsFeedbackContext directionsResponsesCount](self, "directionsResponsesCount"))
  {
    objc_msgSend(v24, "clearDirectionsResponses");
    v8 = -[GEORPDirectionsFeedbackContext directionsResponsesCount](self, "directionsResponsesCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
      {
        -[GEORPDirectionsFeedbackContext directionsResponseAtIndex:](self, "directionsResponseAtIndex:", j);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "addDirectionsResponse:", v11);

      }
    }
  }
  if (-[GEORPDirectionsFeedbackContext directionsWaypointPlaceInfosCount](self, "directionsWaypointPlaceInfosCount"))
  {
    objc_msgSend(v24, "clearDirectionsWaypointPlaceInfos");
    v12 = -[GEORPDirectionsFeedbackContext directionsWaypointPlaceInfosCount](self, "directionsWaypointPlaceInfosCount");
    if (v12)
    {
      v13 = v12;
      for (k = 0; k != v13; ++k)
      {
        -[GEORPDirectionsFeedbackContext directionsWaypointPlaceInfoAtIndex:](self, "directionsWaypointPlaceInfoAtIndex:", k);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "addDirectionsWaypointPlaceInfo:", v15);

      }
    }
  }
  if (self->_startWaypoint)
    objc_msgSend(v24, "setStartWaypoint:");
  if (self->_endWaypoint)
    objc_msgSend(v24, "setEndWaypoint:");
  if (-[GEORPDirectionsFeedbackContext routesCount](self, "routesCount"))
  {
    objc_msgSend(v24, "clearRoutes");
    v16 = -[GEORPDirectionsFeedbackContext routesCount](self, "routesCount");
    if (v16)
    {
      v17 = v16;
      for (m = 0; m != v17; ++m)
      {
        -[GEORPDirectionsFeedbackContext routeAtIndex:](self, "routeAtIndex:", m);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "addRoute:", v19);

      }
    }
  }
  if (-[GEORPDirectionsFeedbackContext rerouteLocationsCount](self, "rerouteLocationsCount"))
  {
    objc_msgSend(v24, "clearRerouteLocations");
    v20 = -[GEORPDirectionsFeedbackContext rerouteLocationsCount](self, "rerouteLocationsCount");
    if (v20)
    {
      v21 = v20;
      for (n = 0; n != v21; ++n)
      {
        -[GEORPDirectionsFeedbackContext rerouteLocationAtIndex:](self, "rerouteLocationAtIndex:", n);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "addRerouteLocation:", v23);

      }
    }
  }
  if ((*(_WORD *)&self->_flags & 1) != 0)
  {
    *((_BYTE *)v24 + 92) = self->_isRouteToPerson;
    *((_WORD *)v24 + 48) |= 1u;
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
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  NSMutableArray *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t k;
  void *v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  NSMutableArray *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t m;
  void *v32;
  NSMutableArray *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t n;
  void *v37;
  PBUnknownFields *v38;
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
  _BYTE v60[128];
  _BYTE v61[128];
  _BYTE v62[128];
  _BYTE v63[128];
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x200) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEORPDirectionsFeedbackContextReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_43;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEORPDirectionsFeedbackContext readAll:](self, "readAll:", 0);
  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  v9 = self->_directionsRequests;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v56, v64, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v57;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v57 != v11)
          objc_enumerationMutation(v9);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v56 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addDirectionsRequest:", v13);

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v56, v64, 16);
    }
    while (v10);
  }

  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  v14 = self->_directionsResponses;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v52, v63, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v53;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v53 != v16)
          objc_enumerationMutation(v14);
        v18 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v52 + 1) + 8 * j), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addDirectionsResponse:", v18);

      }
      v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v52, v63, 16);
    }
    while (v15);
  }

  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v19 = self->_directionsWaypointPlaceInfos;
  v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v48, v62, 16);
  if (v20)
  {
    v21 = *(_QWORD *)v49;
    do
    {
      for (k = 0; k != v20; ++k)
      {
        if (*(_QWORD *)v49 != v21)
          objc_enumerationMutation(v19);
        v23 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v48 + 1) + 8 * k), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addDirectionsWaypointPlaceInfo:", v23);

      }
      v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v48, v62, 16);
    }
    while (v20);
  }

  v24 = -[GEORPUserSearchInput copyWithZone:](self->_startWaypoint, "copyWithZone:", a3);
  v25 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v24;

  v26 = -[GEORPUserSearchInput copyWithZone:](self->_endWaypoint, "copyWithZone:", a3);
  v27 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v26;

  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v28 = self->_routes;
  v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v44, v61, 16);
  if (v29)
  {
    v30 = *(_QWORD *)v45;
    do
    {
      for (m = 0; m != v29; ++m)
      {
        if (*(_QWORD *)v45 != v30)
          objc_enumerationMutation(v28);
        v32 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * m), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addRoute:", v32);

      }
      v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v44, v61, 16);
    }
    while (v29);
  }

  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v33 = self->_rerouteLocations;
  v34 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v40, v60, 16);
  if (v34)
  {
    v35 = *(_QWORD *)v41;
    do
    {
      for (n = 0; n != v34; ++n)
      {
        if (*(_QWORD *)v41 != v35)
          objc_enumerationMutation(v33);
        v37 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * n), "copyWithZone:", a3, (_QWORD)v40);
        objc_msgSend((id)v5, "addRerouteLocation:", v37);

      }
      v34 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v40, v60, 16);
    }
    while (v34);
  }

  if ((*(_WORD *)&self->_flags & 1) != 0)
  {
    *(_BYTE *)(v5 + 92) = self->_isRouteToPerson;
    *(_WORD *)(v5 + 96) |= 1u;
  }
  v38 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v38;
LABEL_43:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSMutableArray *directionsRequests;
  NSMutableArray *directionsResponses;
  NSMutableArray *directionsWaypointPlaceInfos;
  GEORPUserSearchInput *startWaypoint;
  GEORPUserSearchInput *endWaypoint;
  NSMutableArray *routes;
  NSMutableArray *rerouteLocations;
  __int16 v12;
  BOOL v13;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_18;
  -[GEORPDirectionsFeedbackContext readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  directionsRequests = self->_directionsRequests;
  if ((unint64_t)directionsRequests | *((_QWORD *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](directionsRequests, "isEqual:"))
      goto LABEL_18;
  }
  directionsResponses = self->_directionsResponses;
  if ((unint64_t)directionsResponses | *((_QWORD *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](directionsResponses, "isEqual:"))
      goto LABEL_18;
  }
  directionsWaypointPlaceInfos = self->_directionsWaypointPlaceInfos;
  if ((unint64_t)directionsWaypointPlaceInfos | *((_QWORD *)v4 + 5))
  {
    if (!-[NSMutableArray isEqual:](directionsWaypointPlaceInfos, "isEqual:"))
      goto LABEL_18;
  }
  startWaypoint = self->_startWaypoint;
  if ((unint64_t)startWaypoint | *((_QWORD *)v4 + 9))
  {
    if (!-[GEORPUserSearchInput isEqual:](startWaypoint, "isEqual:"))
      goto LABEL_18;
  }
  endWaypoint = self->_endWaypoint;
  if ((unint64_t)endWaypoint | *((_QWORD *)v4 + 6))
  {
    if (!-[GEORPUserSearchInput isEqual:](endWaypoint, "isEqual:"))
      goto LABEL_18;
  }
  routes = self->_routes;
  if ((unint64_t)routes | *((_QWORD *)v4 + 8))
  {
    if (!-[NSMutableArray isEqual:](routes, "isEqual:"))
      goto LABEL_18;
  }
  rerouteLocations = self->_rerouteLocations;
  if ((unint64_t)rerouteLocations | *((_QWORD *)v4 + 7))
  {
    if (!-[NSMutableArray isEqual:](rerouteLocations, "isEqual:"))
      goto LABEL_18;
  }
  v12 = *((_WORD *)v4 + 48);
  v13 = (v12 & 1) == 0;
  if ((*(_WORD *)&self->_flags & 1) != 0)
  {
    if ((v12 & 1) == 0)
    {
LABEL_18:
      v13 = 0;
      goto LABEL_19;
    }
    if (self->_isRouteToPerson)
    {
      if (!*((_BYTE *)v4 + 92))
        goto LABEL_18;
    }
    else if (*((_BYTE *)v4 + 92))
    {
      goto LABEL_18;
    }
    v13 = 1;
  }
LABEL_19:

  return v13;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  -[GEORPDirectionsFeedbackContext readAll:](self, "readAll:", 1);
  v3 = -[NSMutableArray hash](self->_directionsRequests, "hash");
  v4 = -[NSMutableArray hash](self->_directionsResponses, "hash");
  v5 = -[NSMutableArray hash](self->_directionsWaypointPlaceInfos, "hash");
  v6 = -[GEORPUserSearchInput hash](self->_startWaypoint, "hash");
  v7 = -[GEORPUserSearchInput hash](self->_endWaypoint, "hash");
  v8 = -[NSMutableArray hash](self->_routes, "hash");
  v9 = -[NSMutableArray hash](self->_rerouteLocations, "hash");
  if ((*(_WORD *)&self->_flags & 1) != 0)
    v10 = 2654435761 * self->_isRouteToPerson;
  else
    v10 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
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
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t k;
  GEORPUserSearchInput *startWaypoint;
  uint64_t v21;
  GEORPUserSearchInput *endWaypoint;
  uint64_t v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t m;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t n;
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
  _BYTE v54[128];
  _BYTE v55[128];
  _BYTE v56[128];
  _BYTE v57[128];
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v5 = *((id *)v4 + 3);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v51;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v51 != v8)
          objc_enumerationMutation(v5);
        -[GEORPDirectionsFeedbackContext addDirectionsRequest:](self, "addDirectionsRequest:", *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
    }
    while (v7);
  }

  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v10 = *((id *)v4 + 4);
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v46, v57, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v47;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v47 != v13)
          objc_enumerationMutation(v10);
        -[GEORPDirectionsFeedbackContext addDirectionsResponse:](self, "addDirectionsResponse:", *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * j));
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v46, v57, 16);
    }
    while (v12);
  }

  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v15 = *((id *)v4 + 5);
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v42, v56, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v43;
    do
    {
      for (k = 0; k != v17; ++k)
      {
        if (*(_QWORD *)v43 != v18)
          objc_enumerationMutation(v15);
        -[GEORPDirectionsFeedbackContext addDirectionsWaypointPlaceInfo:](self, "addDirectionsWaypointPlaceInfo:", *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * k));
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v42, v56, 16);
    }
    while (v17);
  }

  startWaypoint = self->_startWaypoint;
  v21 = *((_QWORD *)v4 + 9);
  if (startWaypoint)
  {
    if (v21)
      -[GEORPUserSearchInput mergeFrom:](startWaypoint, "mergeFrom:");
  }
  else if (v21)
  {
    -[GEORPDirectionsFeedbackContext setStartWaypoint:](self, "setStartWaypoint:");
  }
  endWaypoint = self->_endWaypoint;
  v23 = *((_QWORD *)v4 + 6);
  if (endWaypoint)
  {
    if (v23)
      -[GEORPUserSearchInput mergeFrom:](endWaypoint, "mergeFrom:");
  }
  else if (v23)
  {
    -[GEORPDirectionsFeedbackContext setEndWaypoint:](self, "setEndWaypoint:");
  }
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v24 = *((id *)v4 + 8);
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v38, v55, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v39;
    do
    {
      for (m = 0; m != v26; ++m)
      {
        if (*(_QWORD *)v39 != v27)
          objc_enumerationMutation(v24);
        -[GEORPDirectionsFeedbackContext addRoute:](self, "addRoute:", *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * m));
      }
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v38, v55, 16);
    }
    while (v26);
  }

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v29 = *((id *)v4 + 7);
  v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v34, v54, 16);
  if (v30)
  {
    v31 = v30;
    v32 = *(_QWORD *)v35;
    do
    {
      for (n = 0; n != v31; ++n)
      {
        if (*(_QWORD *)v35 != v32)
          objc_enumerationMutation(v29);
        -[GEORPDirectionsFeedbackContext addRerouteLocation:](self, "addRerouteLocation:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * n), (_QWORD)v34);
      }
      v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v34, v54, 16);
    }
    while (v31);
  }

  if ((*((_WORD *)v4 + 48) & 1) != 0)
  {
    self->_isRouteToPerson = *((_BYTE *)v4 + 92);
    *(_WORD *)&self->_flags |= 1u;
  }

}

- (PBUnknownFields)unknownFields
{
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v5;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_WORD *)&self->_flags & 2) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      v5 = reader;
      objc_sync_enter(v5);
      GEORPDirectionsFeedbackContextReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_689);
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
  NSMutableArray *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
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
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  _BYTE v53[128];
  _BYTE v54[128];
  _BYTE v55[128];
  _BYTE v56[128];
  uint64_t v57;

  v3 = a3;
  v57 = *MEMORY[0x1E0C80C00];
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x202u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEORPDirectionsFeedbackContext readAll:](self, "readAll:", 0);
    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    v7 = self->_directionsRequests;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v49;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v49 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v48 + 1) + 8 * v11++), "clearUnknownFields:", 1);
        }
        while (v9 != v11);
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
      }
      while (v9);
    }

    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v12 = self->_directionsResponses;
    v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v44, v55, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v45;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v45 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * v16++), "clearUnknownFields:", 1);
        }
        while (v14 != v16);
        v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v44, v55, 16);
      }
      while (v14);
    }

    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v17 = self->_directionsWaypointPlaceInfos;
    v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v40, v54, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v41;
      do
      {
        v21 = 0;
        do
        {
          if (*(_QWORD *)v41 != v20)
            objc_enumerationMutation(v17);
          objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * v21++), "clearUnknownFields:", 1);
        }
        while (v19 != v21);
        v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v40, v54, 16);
      }
      while (v19);
    }

    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v22 = self->_routes;
    v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v36, v53, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v37;
      do
      {
        v26 = 0;
        do
        {
          if (*(_QWORD *)v37 != v25)
            objc_enumerationMutation(v22);
          objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * v26++), "clearUnknownFields:", 1);
        }
        while (v24 != v26);
        v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v36, v53, 16);
      }
      while (v24);
    }

    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v27 = self->_rerouteLocations;
    v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v32, v52, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v33;
      do
      {
        v31 = 0;
        do
        {
          if (*(_QWORD *)v33 != v30)
            objc_enumerationMutation(v27);
          objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * v31++), "clearUnknownFields:", 1, (_QWORD)v32);
        }
        while (v29 != v31);
        v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v32, v52, 16);
      }
      while (v29);
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startWaypoint, 0);
  objc_storeStrong((id *)&self->_routes, 0);
  objc_storeStrong((id *)&self->_rerouteLocations, 0);
  objc_storeStrong((id *)&self->_endWaypoint, 0);
  objc_storeStrong((id *)&self->_directionsWaypointPlaceInfos, 0);
  objc_storeStrong((id *)&self->_directionsResponses, 0);
  objc_storeStrong((id *)&self->_directionsRequests, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
