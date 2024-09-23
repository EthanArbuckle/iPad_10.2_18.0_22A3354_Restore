@implementation GEODirectionsResponse

- (id)instanceCompatibleWithProtocolVersion:(unint64_t)a3
{
  unint64_t v5;
  NSObject *v6;
  _BOOL4 v7;
  objc_class *v8;
  void *v9;
  objc_class *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t v35[128];
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  GEODirectionsResponse *v39;
  __int16 v40;
  unint64_t v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v5 = a3 - 3;
  GEOFindOrCreateLog("com.apple.GeoServices", "CompanionCompatibility");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
  if (v5 > 0xFFFFFFFFFFFFFFFDLL)
  {
    if (v7)
    {
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v37 = v12;
      v38 = 2048;
      v39 = self;
      v40 = 2048;
      v41 = a3;
      _os_log_impl(&dword_1885A9000, v6, OS_LOG_TYPE_DEBUG, "%@<%p> is not compatible with protocol version %lu", buf, 0x20u);

    }
    v13 = (void *)-[GEODirectionsResponse copy](self, "copy");
    objc_msgSend(v13, "decoderData");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "steps");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    migrateTransitSteps(v15, a3);

    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    objc_msgSend(v13, "suggestedRoutes", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v32 != v19)
            objc_enumerationMutation(v16);
          v21 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
          objc_msgSend(v21, "displayStrings");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "planningDescription");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          migrateFormattedString(v23, a3);

          objc_msgSend(v21, "displayStrings");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "duration");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          migrateFormattedString(v25, a3);

          objc_msgSend(v21, "displayStrings");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "travelDescription");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          migrateFormattedString(v27, a3);

          objc_msgSend(v21, "displayStrings");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "badge");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          migrateFormattedString(v29, a3);

          objc_msgSend(v21, "steps");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          migrateTransitSteps(v30, a3);

        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      }
      while (v18);
    }

    return v13;
  }
  else
  {
    if (v7)
    {
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v37 = v9;
      v38 = 2048;
      v39 = self;
      v40 = 2048;
      v41 = a3;
      _os_log_impl(&dword_1885A9000, v6, OS_LOG_TYPE_DEBUG, "%@<%p> is compatible with protocol version %lu", buf, 0x20u);

    }
    return self;
  }
}

- (id)_geoTrafficCameras
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99E08];
  -[GEODirectionsResponse trafficCameras](self, "trafficCameras");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[GEODirectionsResponse trafficCameras](self, "trafficCameras", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v11, "identifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          objc_msgSend(v11, "identifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, v13);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)_geoTrafficSignals
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99E08];
  -[GEODirectionsResponse trafficSignals](self, "trafficSignals");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[GEODirectionsResponse trafficSignals](self, "trafficSignals", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v11, "identifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          objc_msgSend(v11, "identifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, v13);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  return v5;
}

- (GEODirectionsResponse)init
{
  GEODirectionsResponse *v2;
  GEODirectionsResponse *v3;
  GEODirectionsResponse *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEODirectionsResponse;
  v2 = -[GEODirectionsResponse init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEODirectionsResponse)initWithData:(id)a3
{
  GEODirectionsResponse *v3;
  GEODirectionsResponse *v4;
  GEODirectionsResponse *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEODirectionsResponse;
  v3 = -[GEODirectionsResponse initWithData:](&v7, sel_initWithData_, a3);
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

  -[GEODirectionsResponse clearProblemDetails](self, "clearProblemDetails");
  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEODirectionsResponse;
  -[GEODirectionsResponse dealloc](&v3, sel_dealloc);
}

- (int)status
{
  return self->_status;
}

- (void)setStatus:(int)a3
{
  *(_QWORD *)&self->_flags |= 0x100000000000uLL;
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

- (void)_readRoutes
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 360));
    if ((*(_BYTE *)(a1 + 391) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEODirectionsResponseReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRoutes_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 360));
  }
}

- (NSMutableArray)routes
{
  -[GEODirectionsResponse _readRoutes]((uint64_t)self);
  return self->_routes;
}

- (void)setRoutes:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *routes;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x20000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x100000000000uLL;
  routes = self->_routes;
  self->_routes = v4;

}

- (void)clearRoutes
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x20000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(_QWORD *)&self->_flags |= 0x100000000000uLL;
  -[NSMutableArray removeAllObjects](self->_routes, "removeAllObjects");
}

- (void)addRoute:(id)a3
{
  id v4;

  v4 = a3;
  -[GEODirectionsResponse _readRoutes]((uint64_t)self);
  -[GEODirectionsResponse _addNoFlagsRoute:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x20000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x100000000000uLL;
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

- (unint64_t)routesCount
{
  -[GEODirectionsResponse _readRoutes]((uint64_t)self);
  return -[NSMutableArray count](self->_routes, "count");
}

- (id)routeAtIndex:(unint64_t)a3
{
  -[GEODirectionsResponse _readRoutes]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_routes, "objectAtIndex:", a3);
}

+ (Class)routeType
{
  return (Class)objc_opt_class();
}

- (void)_readWaypointRoutes
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 360));
    if ((*(_BYTE *)(a1 + 393) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEODirectionsResponseReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readWaypointRoutes_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 360));
  }
}

- (NSMutableArray)waypointRoutes
{
  -[GEODirectionsResponse _readWaypointRoutes]((uint64_t)self);
  return self->_waypointRoutes;
}

- (void)setWaypointRoutes:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *waypointRoutes;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x80000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x100000000000uLL;
  waypointRoutes = self->_waypointRoutes;
  self->_waypointRoutes = v4;

}

- (void)clearWaypointRoutes
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x80000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(_QWORD *)&self->_flags |= 0x100000000000uLL;
  -[NSMutableArray removeAllObjects](self->_waypointRoutes, "removeAllObjects");
}

- (void)addWaypointRoute:(id)a3
{
  id v4;

  v4 = a3;
  -[GEODirectionsResponse _readWaypointRoutes]((uint64_t)self);
  -[GEODirectionsResponse _addNoFlagsWaypointRoute:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x80000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x100000000000uLL;
}

- (void)_addNoFlagsWaypointRoute:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 344);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 344);
      *(_QWORD *)(a1 + 344) = v5;

      v4 = *(void **)(a1 + 344);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)waypointRoutesCount
{
  -[GEODirectionsResponse _readWaypointRoutes]((uint64_t)self);
  return -[NSMutableArray count](self->_waypointRoutes, "count");
}

- (id)waypointRouteAtIndex:(unint64_t)a3
{
  -[GEODirectionsResponse _readWaypointRoutes]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_waypointRoutes, "objectAtIndex:", a3);
}

+ (Class)waypointRouteType
{
  return (Class)objc_opt_class();
}

- (void)_readPlaceSearchResponses
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 360));
    if ((*(_BYTE *)(a1 + 391) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEODirectionsResponseReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPlaceSearchResponses_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 360));
  }
}

- (NSMutableArray)placeSearchResponses
{
  -[GEODirectionsResponse _readPlaceSearchResponses]((uint64_t)self);
  return self->_placeSearchResponses;
}

- (void)setPlaceSearchResponses:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *placeSearchResponses;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x8000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x100000000000uLL;
  placeSearchResponses = self->_placeSearchResponses;
  self->_placeSearchResponses = v4;

}

- (void)clearPlaceSearchResponses
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x8000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(_QWORD *)&self->_flags |= 0x100000000000uLL;
  -[NSMutableArray removeAllObjects](self->_placeSearchResponses, "removeAllObjects");
}

- (void)addPlaceSearchResponse:(id)a3
{
  id v4;

  v4 = a3;
  -[GEODirectionsResponse _readPlaceSearchResponses]((uint64_t)self);
  -[GEODirectionsResponse _addNoFlagsPlaceSearchResponse:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x8000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x100000000000uLL;
}

- (void)_addNoFlagsPlaceSearchResponse:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 216);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 216);
      *(_QWORD *)(a1 + 216) = v5;

      v4 = *(void **)(a1 + 216);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)placeSearchResponsesCount
{
  -[GEODirectionsResponse _readPlaceSearchResponses]((uint64_t)self);
  return -[NSMutableArray count](self->_placeSearchResponses, "count");
}

- (id)placeSearchResponseAtIndex:(unint64_t)a3
{
  -[GEODirectionsResponse _readPlaceSearchResponses]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_placeSearchResponses, "objectAtIndex:", a3);
}

+ (Class)placeSearchResponseType
{
  return (Class)objc_opt_class();
}

- (int)localDistanceUnits
{
  os_unfair_lock_s *p_readerLock;
  $BB24C2ED400A1348441C88FA4FCB4848 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_BYTE *)&flags & 8) != 0)
    return self->_localDistanceUnits;
  else
    return 0;
}

- (void)setLocalDistanceUnits:(int)a3
{
  *(_QWORD *)&self->_flags |= 0x100000000008uLL;
  self->_localDistanceUnits = a3;
}

- (void)setHasLocalDistanceUnits:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000000000;
  if (a3)
    v3 = 0x100000000008;
  self->_flags = ($BB24C2ED400A1348441C88FA4FCB4848)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFFF7 | v3);
}

- (BOOL)hasLocalDistanceUnits
{
  return (*(_BYTE *)&self->_flags >> 3) & 1;
}

- (id)localDistanceUnitsAsString:(int)a3
{
  if (a3 < 3)
    return off_1E1C20388[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsLocalDistanceUnits:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("METRIC")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("IMPERIAL")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)routeDeviatesFromOriginal
{
  os_unfair_lock_s *p_readerLock;
  $BB24C2ED400A1348441C88FA4FCB4848 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  return (*(_WORD *)&flags & 0x100) != 0 && self->_routeDeviatesFromOriginal;
}

- (void)setRouteDeviatesFromOriginal:(BOOL)a3
{
  *(_QWORD *)&self->_flags |= 0x100000000100uLL;
  self->_routeDeviatesFromOriginal = a3;
}

- (void)setHasRouteDeviatesFromOriginal:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000000000;
  if (a3)
    v3 = 0x100000000100;
  self->_flags = ($BB24C2ED400A1348441C88FA4FCB4848)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFEFFLL | v3);
}

- (BOOL)hasRouteDeviatesFromOriginal
{
  return *((_BYTE *)&self->_flags + 1) & 1;
}

- (void)_readDirectionsResponseID
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 360));
    if ((*(_BYTE *)(a1 + 390) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEODirectionsResponseReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDirectionsResponseID_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 360));
  }
}

- (BOOL)hasDirectionsResponseID
{
  -[GEODirectionsResponse _readDirectionsResponseID]((uint64_t)self);
  return self->_directionsResponseID != 0;
}

- (NSData)directionsResponseID
{
  -[GEODirectionsResponse _readDirectionsResponseID]((uint64_t)self);
  return self->_directionsResponseID;
}

- (void)setDirectionsResponseID:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x100000100000uLL;
  objc_storeStrong((id *)&self->_directionsResponseID, a3);
}

- (void)_readTripId
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 360));
    if ((*(_BYTE *)(a1 + 393) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEODirectionsResponseReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTripId_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 360));
  }
}

- (BOOL)hasTripId
{
  -[GEODirectionsResponse _readTripId]((uint64_t)self);
  return self->_tripId != 0;
}

- (GEOUUID)tripId
{
  -[GEODirectionsResponse _readTripId]((uint64_t)self);
  return self->_tripId;
}

- (void)setTripId:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x140000000000uLL;
  objc_storeStrong((id *)&self->_tripId, a3);
}

- (BOOL)isNavigable
{
  os_unfair_lock_s *p_readerLock;
  $BB24C2ED400A1348441C88FA4FCB4848 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  return (*(_BYTE *)&flags & 0x40) != 0 && self->_isNavigable;
}

- (void)setIsNavigable:(BOOL)a3
{
  *(_QWORD *)&self->_flags |= 0x100000000040uLL;
  self->_isNavigable = a3;
}

- (void)setHasIsNavigable:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000000000;
  if (a3)
    v3 = 0x100000000040;
  self->_flags = ($BB24C2ED400A1348441C88FA4FCB4848)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFFBFLL | v3);
}

- (BOOL)hasIsNavigable
{
  return (*(_BYTE *)&self->_flags >> 6) & 1;
}

- (int)instructionSignFillColor
{
  os_unfair_lock_s *p_readerLock;
  $BB24C2ED400A1348441C88FA4FCB4848 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_BYTE *)&flags & 2) != 0)
    return self->_instructionSignFillColor;
  else
    return 2;
}

- (void)setInstructionSignFillColor:(int)a3
{
  *(_QWORD *)&self->_flags |= 0x100000000002uLL;
  self->_instructionSignFillColor = a3;
}

- (void)setHasInstructionSignFillColor:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000000000;
  if (a3)
    v3 = 0x100000000002;
  self->_flags = ($BB24C2ED400A1348441C88FA4FCB4848)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFFFDLL | v3);
}

- (BOOL)hasInstructionSignFillColor
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (id)instructionSignFillColorAsString:(int)a3
{
  if (a3 < 8)
    return off_1E1C203A0[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsInstructionSignFillColor:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BLACK")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RED")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GREEN")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("YELLOW")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BLUE")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PURPLE")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CYAN")) & 1) != 0)
  {
    v4 = 6;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("WHITE")))
  {
    v4 = 7;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_readIncidentsOnRoutes
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 360));
    if ((*(_BYTE *)(a1 + 391) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEODirectionsResponseReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readIncidentsOnRoutes_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 360));
  }
}

- (NSMutableArray)incidentsOnRoutes
{
  -[GEODirectionsResponse _readIncidentsOnRoutes]((uint64_t)self);
  return self->_incidentsOnRoutes;
}

- (void)setIncidentsOnRoutes:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *incidentsOnRoutes;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x1000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x100000000000uLL;
  incidentsOnRoutes = self->_incidentsOnRoutes;
  self->_incidentsOnRoutes = v4;

}

- (void)clearIncidentsOnRoutes
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x1000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(_QWORD *)&self->_flags |= 0x100000000000uLL;
  -[NSMutableArray removeAllObjects](self->_incidentsOnRoutes, "removeAllObjects");
}

- (void)addIncidentsOnRoutes:(id)a3
{
  id v4;

  v4 = a3;
  -[GEODirectionsResponse _readIncidentsOnRoutes]((uint64_t)self);
  -[GEODirectionsResponse _addNoFlagsIncidentsOnRoutes:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x1000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x100000000000uLL;
}

- (void)_addNoFlagsIncidentsOnRoutes:(uint64_t)a1
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

- (unint64_t)incidentsOnRoutesCount
{
  -[GEODirectionsResponse _readIncidentsOnRoutes]((uint64_t)self);
  return -[NSMutableArray count](self->_incidentsOnRoutes, "count");
}

- (id)incidentsOnRoutesAtIndex:(unint64_t)a3
{
  -[GEODirectionsResponse _readIncidentsOnRoutes]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_incidentsOnRoutes, "objectAtIndex:", a3);
}

+ (Class)incidentsOnRoutesType
{
  return (Class)objc_opt_class();
}

- (void)_readIncidentsOffRoutes
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 360));
    if ((*(_BYTE *)(a1 + 390) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEODirectionsResponseReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readIncidentsOffRoutes_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 360));
  }
}

- (NSMutableArray)incidentsOffRoutes
{
  -[GEODirectionsResponse _readIncidentsOffRoutes]((uint64_t)self);
  return self->_incidentsOffRoutes;
}

- (void)setIncidentsOffRoutes:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *incidentsOffRoutes;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x800000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x100000000000uLL;
  incidentsOffRoutes = self->_incidentsOffRoutes;
  self->_incidentsOffRoutes = v4;

}

- (void)clearIncidentsOffRoutes
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x800000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(_QWORD *)&self->_flags |= 0x100000000000uLL;
  -[NSMutableArray removeAllObjects](self->_incidentsOffRoutes, "removeAllObjects");
}

- (void)addIncidentsOffRoutes:(id)a3
{
  id v4;

  v4 = a3;
  -[GEODirectionsResponse _readIncidentsOffRoutes]((uint64_t)self);
  -[GEODirectionsResponse _addNoFlagsIncidentsOffRoutes:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x800000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x100000000000uLL;
}

- (void)_addNoFlagsIncidentsOffRoutes:(uint64_t)a1
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

- (unint64_t)incidentsOffRoutesCount
{
  -[GEODirectionsResponse _readIncidentsOffRoutes]((uint64_t)self);
  return -[NSMutableArray count](self->_incidentsOffRoutes, "count");
}

- (id)incidentsOffRoutesAtIndex:(unint64_t)a3
{
  -[GEODirectionsResponse _readIncidentsOffRoutes]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_incidentsOffRoutes, "objectAtIndex:", a3);
}

+ (Class)incidentsOffRoutesType
{
  return (Class)objc_opt_class();
}

- (void)_readProblemDetails
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 360));
    if ((*(_BYTE *)(a1 + 389) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEODirectionsResponseReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readProblemDetails_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 360));
  }
}

- (unint64_t)problemDetailsCount
{
  -[GEODirectionsResponse _readProblemDetails]((uint64_t)self);
  return self->_problemDetailsCount;
}

- (GEOProblemDetail)problemDetails
{
  -[GEODirectionsResponse _readProblemDetails]((uint64_t)self);
  return self->_problemDetails;
}

- (uint64_t)_reserveProblemDetails:(uint64_t)a1
{
  uint64_t result;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;

  result = 0;
  if (a1 && a2)
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = v4 + a2;
    if (v4 + a2 <= v4)
      return 0;
    v6 = *(_QWORD *)(a1 + 40);
    if (v6 >= v5)
      return 1;
    v7 = v6 + a2;
    if (v6 + a2)
    {
      v8 = 1;
      while (1)
      {
        v9 = v8;
        if (v8 >= v7)
          break;
        v8 *= 2;
        if ((v9 & 0x8000000000000000) != 0)
        {
          v9 = -1;
          goto LABEL_12;
        }
      }
    }
    else
    {
      v9 = 0;
    }
    if (v9 < a2)
      return 0;
LABEL_12:
    if (12 * v9 < v9)
      return 0;
    result = (uint64_t)malloc_type_realloc(*(void **)(a1 + 24), 12 * v9, 0xDDB0EE88uLL);
    if (result)
    {
      *(_QWORD *)(a1 + 40) = v9;
      *(_QWORD *)(a1 + 24) = result;
      bzero((void *)(result + 12 * *(_QWORD *)(a1 + 32)), 12 * (v9 - *(_QWORD *)(a1 + 32)));
      return 1;
    }
  }
  return result;
}

- (void)clearProblemDetails
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x400uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(_QWORD *)&self->_flags |= 0x100000000000uLL;
  self->_problemDetailsSpace = 0;
  self->_problemDetailsCount = 0;
  free(self->_problemDetails);
  self->_problemDetails = 0;
}

- (void)addProblemDetail:(GEOProblemDetail)a3
{
  $7D24B5AD5894795FD85A0EE1D817D743 var2;
  uint64_t v4;
  GEOProblemDetail *v6;

  var2 = a3.var2;
  v4 = *(_QWORD *)&a3.var0;
  -[GEODirectionsResponse _readProblemDetails]((uint64_t)self);
  if (self && -[GEODirectionsResponse _reserveProblemDetails:]((uint64_t)self, 1uLL))
  {
    v6 = &self->_problemDetails[self->_problemDetailsCount];
    *(_QWORD *)&v6->var0 = v4;
    v6->var2 = var2;
    ++self->_problemDetailsCount;
  }
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x400uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x100000000000uLL;
}

- (GEOProblemDetail)problemDetailAtIndex:(unint64_t)a3
{
  unint64_t problemDetailsCount;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  GEOProblemDetail *v10;
  uint64_t v11;
  $7D24B5AD5894795FD85A0EE1D817D743 var2;
  GEOProblemDetail result;

  -[GEODirectionsResponse _readProblemDetails]((uint64_t)self);
  problemDetailsCount = self->_problemDetailsCount;
  if (problemDetailsCount <= a3)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, problemDetailsCount);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise");

  }
  v10 = &self->_problemDetails[a3];
  v11 = *(_QWORD *)&v10->var0;
  var2 = v10->var2;
  result.var0 = v11;
  result.var1 = HIDWORD(v11);
  result.var2 = var2;
  return result;
}

- (void)setProblemDetails:(GEOProblemDetail *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x400uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(_QWORD *)&self->_flags |= 0x100000000000uLL;
  -[GEODirectionsResponse clearProblemDetails](self, "clearProblemDetails");
  if (-[GEODirectionsResponse _reserveProblemDetails:]((uint64_t)self, a4))
  {
    memcpy(self->_problemDetails, a3, 12 * a4);
    self->_problemDetailsCount = a4;
  }
}

- (void)_readSupportedTransportTypes
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 360));
    if ((*(_BYTE *)(a1 + 389) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEODirectionsResponseReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSupportedTransportTypes_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 360));
  }
}

- (unint64_t)supportedTransportTypesCount
{
  -[GEODirectionsResponse _readSupportedTransportTypes]((uint64_t)self);
  return self->_supportedTransportTypes.count;
}

- (int)supportedTransportTypes
{
  -[GEODirectionsResponse _readSupportedTransportTypes]((uint64_t)self);
  return self->_supportedTransportTypes.list;
}

- (void)clearSupportedTransportTypes
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x800uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(_QWORD *)&self->_flags |= 0x100000000000uLL;
  PBRepeatedInt32Clear();
}

- (void)addSupportedTransportType:(int)a3
{
  -[GEODirectionsResponse _readSupportedTransportTypes]((uint64_t)self);
  if (self)
    PBRepeatedInt32Add();
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x800uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x100000000000uLL;
}

- (int)supportedTransportTypeAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_supportedTransportTypes;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEODirectionsResponse _readSupportedTransportTypes]((uint64_t)self);
  p_supportedTransportTypes = &self->_supportedTransportTypes;
  count = self->_supportedTransportTypes.count;
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
  return p_supportedTransportTypes->list[a3];
}

- (void)setSupportedTransportTypes:(int *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x800uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(_QWORD *)&self->_flags |= 0x100000000000uLL;
  PBRepeatedInt32Set();
}

- (id)supportedTransportTypesAsString:(int)a3
{
  if (a3 < 7)
    return off_1E1C203E0[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsSupportedTransportTypes:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AUTOMOBILE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRANSIT")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WALKING")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BICYCLE")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_TRANSPORT_TYPE")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FERRY")) & 1) != 0)
  {
    v4 = 5;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("RIDESHARE")))
  {
    v4 = 6;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_readServiceGaps
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 360));
    if ((*(_BYTE *)(a1 + 391) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEODirectionsResponseReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readServiceGaps_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 360));
  }
}

- (NSMutableArray)serviceGaps
{
  -[GEODirectionsResponse _readServiceGaps]((uint64_t)self);
  return self->_serviceGaps;
}

- (void)setServiceGaps:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *serviceGaps;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x40000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x100000000000uLL;
  serviceGaps = self->_serviceGaps;
  self->_serviceGaps = v4;

}

- (void)clearServiceGaps
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x40000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(_QWORD *)&self->_flags |= 0x100000000000uLL;
  -[NSMutableArray removeAllObjects](self->_serviceGaps, "removeAllObjects");
}

- (void)addServiceGap:(id)a3
{
  id v4;

  v4 = a3;
  -[GEODirectionsResponse _readServiceGaps]((uint64_t)self);
  -[GEODirectionsResponse _addNoFlagsServiceGap:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x40000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x100000000000uLL;
}

- (void)_addNoFlagsServiceGap:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 240);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 240);
      *(_QWORD *)(a1 + 240) = v5;

      v4 = *(void **)(a1 + 240);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)serviceGapsCount
{
  -[GEODirectionsResponse _readServiceGaps]((uint64_t)self);
  return -[NSMutableArray count](self->_serviceGaps, "count");
}

- (id)serviceGapAtIndex:(unint64_t)a3
{
  -[GEODirectionsResponse _readServiceGaps]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_serviceGaps, "objectAtIndex:", a3);
}

+ (Class)serviceGapType
{
  return (Class)objc_opt_class();
}

- (unsigned)selectedRouteIndex
{
  return self->_selectedRouteIndex;
}

- (void)setSelectedRouteIndex:(unsigned int)a3
{
  *(_QWORD *)&self->_flags |= 0x100000000010uLL;
  self->_selectedRouteIndex = a3;
}

- (void)setHasSelectedRouteIndex:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000000000;
  if (a3)
    v3 = 0x100000000010;
  self->_flags = ($BB24C2ED400A1348441C88FA4FCB4848)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFFEFLL | v3);
}

- (BOOL)hasSelectedRouteIndex
{
  return (*(_BYTE *)&self->_flags >> 4) & 1;
}

- (void)_readTransitIncidentMessage
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 360));
    if ((*(_BYTE *)(a1 + 392) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEODirectionsResponseReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTransitIncidentMessage_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 360));
  }
}

- (BOOL)hasTransitIncidentMessage
{
  -[GEODirectionsResponse _readTransitIncidentMessage]((uint64_t)self);
  return self->_transitIncidentMessage != 0;
}

- (GEOPBTransitRoutingIncidentMessage)transitIncidentMessage
{
  -[GEODirectionsResponse _readTransitIncidentMessage]((uint64_t)self);
  return self->_transitIncidentMessage;
}

- (void)setTransitIncidentMessage:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x108000000000uLL;
  objc_storeStrong((id *)&self->_transitIncidentMessage, a3);
}

- (void)_readDisplayHints
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 360));
    if ((*(_BYTE *)(a1 + 390) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEODirectionsResponseReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDisplayHints_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 360));
  }
}

- (BOOL)hasDisplayHints
{
  -[GEODirectionsResponse _readDisplayHints]((uint64_t)self);
  return self->_displayHints != 0;
}

- (GEORouteDisplayHints)displayHints
{
  -[GEODirectionsResponse _readDisplayHints]((uint64_t)self);
  return self->_displayHints;
}

- (void)setDisplayHints:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x100000200000uLL;
  objc_storeStrong((id *)&self->_displayHints, a3);
}

- (void)_readStyleAttributes
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 360));
    if ((*(_BYTE *)(a1 + 392) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEODirectionsResponseReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readStyleAttributes_tags_8);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 360));
  }
}

- (BOOL)hasStyleAttributes
{
  -[GEODirectionsResponse _readStyleAttributes]((uint64_t)self);
  return self->_styleAttributes != 0;
}

- (GEOStyleAttributes)styleAttributes
{
  -[GEODirectionsResponse _readStyleAttributes]((uint64_t)self);
  return self->_styleAttributes;
}

- (void)setStyleAttributes:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x100400000000uLL;
  objc_storeStrong((id *)&self->_styleAttributes, a3);
}

- (void)_readSessionState
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 360));
    if ((*(_BYTE *)(a1 + 392) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEODirectionsResponseReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSessionState_tags_553);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 360));
  }
}

- (BOOL)hasSessionState
{
  -[GEODirectionsResponse _readSessionState]((uint64_t)self);
  return self->_sessionState != 0;
}

- (NSData)sessionState
{
  -[GEODirectionsResponse _readSessionState]((uint64_t)self);
  return self->_sessionState;
}

- (void)setSessionState:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x100100000000uLL;
  objc_storeStrong((id *)&self->_sessionState, a3);
}

- (void)_readFailureAlert
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 360));
    if ((*(_BYTE *)(a1 + 390) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEODirectionsResponseReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readFailureAlert_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 360));
  }
}

- (BOOL)hasFailureAlert
{
  -[GEODirectionsResponse _readFailureAlert]((uint64_t)self);
  return self->_failureAlert != 0;
}

- (GEOAlert)failureAlert
{
  -[GEODirectionsResponse _readFailureAlert]((uint64_t)self);
  return self->_failureAlert;
}

- (void)setFailureAlert:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x100000400000uLL;
  objc_storeStrong((id *)&self->_failureAlert, a3);
}

- (int)liveRouteSavingsSeconds
{
  return self->_liveRouteSavingsSeconds;
}

- (void)setLiveRouteSavingsSeconds:(int)a3
{
  *(_QWORD *)&self->_flags |= 0x100000000004uLL;
  self->_liveRouteSavingsSeconds = a3;
}

- (void)setHasLiveRouteSavingsSeconds:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000000000;
  if (a3)
    v3 = 0x100000000004;
  self->_flags = ($BB24C2ED400A1348441C88FA4FCB4848)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFFFBLL | v3);
}

- (BOOL)hasLiveRouteSavingsSeconds
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (void)_readDatasetAbStatus
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 360));
    if ((*(_BYTE *)(a1 + 390) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEODirectionsResponseReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDatasetAbStatus_tags_1);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 360));
  }
}

- (BOOL)hasDatasetAbStatus
{
  -[GEODirectionsResponse _readDatasetAbStatus]((uint64_t)self);
  return self->_datasetAbStatus != 0;
}

- (GEOPDDatasetABStatus)datasetAbStatus
{
  -[GEODirectionsResponse _readDatasetAbStatus]((uint64_t)self);
  return self->_datasetAbStatus;
}

- (void)setDatasetAbStatus:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x100000020000uLL;
  objc_storeStrong((id *)&self->_datasetAbStatus, a3);
}

- (void)_readTrafficCameras
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 360));
    if ((*(_BYTE *)(a1 + 392) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEODirectionsResponseReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTrafficCameras_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 360));
  }
}

- (NSMutableArray)trafficCameras
{
  -[GEODirectionsResponse _readTrafficCameras]((uint64_t)self);
  return self->_trafficCameras;
}

- (void)setTrafficCameras:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *trafficCameras;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x1000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x100000000000uLL;
  trafficCameras = self->_trafficCameras;
  self->_trafficCameras = v4;

}

- (void)clearTrafficCameras
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x1000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(_QWORD *)&self->_flags |= 0x100000000000uLL;
  -[NSMutableArray removeAllObjects](self->_trafficCameras, "removeAllObjects");
}

- (void)addTrafficCamera:(id)a3
{
  id v4;

  v4 = a3;
  -[GEODirectionsResponse _readTrafficCameras]((uint64_t)self);
  -[GEODirectionsResponse _addNoFlagsTrafficCamera:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x1000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x100000000000uLL;
}

- (void)_addNoFlagsTrafficCamera:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 288);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 288);
      *(_QWORD *)(a1 + 288) = v5;

      v4 = *(void **)(a1 + 288);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)trafficCamerasCount
{
  -[GEODirectionsResponse _readTrafficCameras]((uint64_t)self);
  return -[NSMutableArray count](self->_trafficCameras, "count");
}

- (id)trafficCameraAtIndex:(unint64_t)a3
{
  -[GEODirectionsResponse _readTrafficCameras]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_trafficCameras, "objectAtIndex:", a3);
}

+ (Class)trafficCameraType
{
  return (Class)objc_opt_class();
}

- (void)_readNonRecommendedRoutesCache
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 360));
    if ((*(_BYTE *)(a1 + 391) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEODirectionsResponseReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readNonRecommendedRoutesCache_tags_555);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 360));
  }
}

- (BOOL)hasNonRecommendedRoutesCache
{
  -[GEODirectionsResponse _readNonRecommendedRoutesCache]((uint64_t)self);
  return self->_nonRecommendedRoutesCache != 0;
}

- (NSData)nonRecommendedRoutesCache
{
  -[GEODirectionsResponse _readNonRecommendedRoutesCache]((uint64_t)self);
  return self->_nonRecommendedRoutesCache;
}

- (void)setNonRecommendedRoutesCache:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x100004000000uLL;
  objc_storeStrong((id *)&self->_nonRecommendedRoutesCache, a3);
}

- (BOOL)isOfflineResponse
{
  return self->_isOfflineResponse;
}

- (void)setIsOfflineResponse:(BOOL)a3
{
  *(_QWORD *)&self->_flags |= 0x100000000080uLL;
  self->_isOfflineResponse = a3;
}

- (void)setHasIsOfflineResponse:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000000000;
  if (a3)
    v3 = 0x100000000080;
  self->_flags = ($BB24C2ED400A1348441C88FA4FCB4848)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFF7FLL | v3);
}

- (BOOL)hasIsOfflineResponse
{
  return *(_BYTE *)&self->_flags >> 7;
}

- (void)_readSnapScoreMetadataDebug
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 360));
    if ((*(_BYTE *)(a1 + 392) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEODirectionsResponseReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSnapScoreMetadataDebug_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 360));
  }
}

- (BOOL)hasSnapScoreMetadataDebug
{
  -[GEODirectionsResponse _readSnapScoreMetadataDebug]((uint64_t)self);
  return self->_snapScoreMetadataDebug != 0;
}

- (GEOSnapScoreMetadata)snapScoreMetadataDebug
{
  -[GEODirectionsResponse _readSnapScoreMetadataDebug]((uint64_t)self);
  return self->_snapScoreMetadataDebug;
}

- (void)setSnapScoreMetadataDebug:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x100200000000uLL;
  objc_storeStrong((id *)&self->_snapScoreMetadataDebug, a3);
}

- (BOOL)hasKhSegments
{
  os_unfair_lock_s *p_readerLock;
  $BB24C2ED400A1348441C88FA4FCB4848 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  return (*(_BYTE *)&flags & 0x20) != 0 && self->_hasKhSegments;
}

- (void)setHasKhSegments:(BOOL)a3
{
  *(_QWORD *)&self->_flags |= 0x100000000020uLL;
  self->_hasKhSegments = a3;
}

- (void)setHasHasKhSegments:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000000000;
  if (a3)
    v3 = 0x100000000020;
  self->_flags = ($BB24C2ED400A1348441C88FA4FCB4848)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFFDFLL | v3);
}

- (BOOL)hasHasKhSegments
{
  return (*(_BYTE *)&self->_flags >> 5) & 1;
}

- (void)_readDebugData
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 360));
    if ((*(_BYTE *)(a1 + 390) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEODirectionsResponseReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDebugData_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 360));
  }
}

- (BOOL)hasDebugData
{
  -[GEODirectionsResponse _readDebugData]((uint64_t)self);
  return self->_debugData != 0;
}

- (NSString)debugData
{
  -[GEODirectionsResponse _readDebugData]((uint64_t)self);
  return self->_debugData;
}

- (void)setDebugData:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x100000040000uLL;
  objc_storeStrong((id *)&self->_debugData, a3);
}

- (void)_readArrivalParameters
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 360));
    if ((*(_BYTE *)(a1 + 389) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEODirectionsResponseReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readArrivalParameters_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 360));
  }
}

- (NSMutableArray)arrivalParameters
{
  -[GEODirectionsResponse _readArrivalParameters]((uint64_t)self);
  return self->_arrivalParameters;
}

- (void)setArrivalParameters:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *arrivalParameters;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x4000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x100000000000uLL;
  arrivalParameters = self->_arrivalParameters;
  self->_arrivalParameters = v4;

}

- (void)clearArrivalParameters
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x4000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(_QWORD *)&self->_flags |= 0x100000000000uLL;
  -[NSMutableArray removeAllObjects](self->_arrivalParameters, "removeAllObjects");
}

- (void)addArrivalParameters:(id)a3
{
  id v4;

  v4 = a3;
  -[GEODirectionsResponse _readArrivalParameters]((uint64_t)self);
  -[GEODirectionsResponse _addNoFlagsArrivalParameters:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x4000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x100000000000uLL;
}

- (void)_addNoFlagsArrivalParameters:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 112);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 112);
      *(_QWORD *)(a1 + 112) = v5;

      v4 = *(void **)(a1 + 112);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)arrivalParametersCount
{
  -[GEODirectionsResponse _readArrivalParameters]((uint64_t)self);
  return -[NSMutableArray count](self->_arrivalParameters, "count");
}

- (id)arrivalParametersAtIndex:(unint64_t)a3
{
  -[GEODirectionsResponse _readArrivalParameters]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_arrivalParameters, "objectAtIndex:", a3);
}

+ (Class)arrivalParametersType
{
  return (Class)objc_opt_class();
}

- (void)_readTrafficSignals
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 360));
    if ((*(_BYTE *)(a1 + 392) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEODirectionsResponseReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTrafficSignals_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 360));
  }
}

- (NSMutableArray)trafficSignals
{
  -[GEODirectionsResponse _readTrafficSignals]((uint64_t)self);
  return self->_trafficSignals;
}

- (void)setTrafficSignals:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *trafficSignals;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x2000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x100000000000uLL;
  trafficSignals = self->_trafficSignals;
  self->_trafficSignals = v4;

}

- (void)clearTrafficSignals
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x2000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(_QWORD *)&self->_flags |= 0x100000000000uLL;
  -[NSMutableArray removeAllObjects](self->_trafficSignals, "removeAllObjects");
}

- (void)addTrafficSignal:(id)a3
{
  id v4;

  v4 = a3;
  -[GEODirectionsResponse _readTrafficSignals]((uint64_t)self);
  -[GEODirectionsResponse _addNoFlagsTrafficSignal:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x2000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x100000000000uLL;
}

- (void)_addNoFlagsTrafficSignal:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 296);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 296);
      *(_QWORD *)(a1 + 296) = v5;

      v4 = *(void **)(a1 + 296);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)trafficSignalsCount
{
  -[GEODirectionsResponse _readTrafficSignals]((uint64_t)self);
  return -[NSMutableArray count](self->_trafficSignals, "count");
}

- (id)trafficSignalAtIndex:(unint64_t)a3
{
  -[GEODirectionsResponse _readTrafficSignals]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_trafficSignals, "objectAtIndex:", a3);
}

+ (Class)trafficSignalType
{
  return (Class)objc_opt_class();
}

- (void)_readTransitRouteUpdateConfiguration
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 360));
    if ((*(_BYTE *)(a1 + 393) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEODirectionsResponseReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTransitRouteUpdateConfiguration_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 360));
  }
}

- (BOOL)hasTransitRouteUpdateConfiguration
{
  -[GEODirectionsResponse _readTransitRouteUpdateConfiguration]((uint64_t)self);
  return self->_transitRouteUpdateConfiguration != 0;
}

- (GEOTransitRouteUpdateConfiguration)transitRouteUpdateConfiguration
{
  -[GEODirectionsResponse _readTransitRouteUpdateConfiguration]((uint64_t)self);
  return self->_transitRouteUpdateConfiguration;
}

- (void)setTransitRouteUpdateConfiguration:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x120000000000uLL;
  objc_storeStrong((id *)&self->_transitRouteUpdateConfiguration, a3);
}

- (void)_readTransitPaymentMethodSuggestions
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 360));
    if ((*(_BYTE *)(a1 + 393) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEODirectionsResponseReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTransitPaymentMethodSuggestions_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 360));
  }
}

- (NSMutableArray)transitPaymentMethodSuggestions
{
  -[GEODirectionsResponse _readTransitPaymentMethodSuggestions]((uint64_t)self);
  return self->_transitPaymentMethodSuggestions;
}

- (void)setTransitPaymentMethodSuggestions:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *transitPaymentMethodSuggestions;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x10000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x100000000000uLL;
  transitPaymentMethodSuggestions = self->_transitPaymentMethodSuggestions;
  self->_transitPaymentMethodSuggestions = v4;

}

- (void)clearTransitPaymentMethodSuggestions
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x10000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(_QWORD *)&self->_flags |= 0x100000000000uLL;
  -[NSMutableArray removeAllObjects](self->_transitPaymentMethodSuggestions, "removeAllObjects");
}

- (void)addTransitPaymentMethodSuggestion:(id)a3
{
  id v4;

  v4 = a3;
  -[GEODirectionsResponse _readTransitPaymentMethodSuggestions]((uint64_t)self);
  -[GEODirectionsResponse _addNoFlagsTransitPaymentMethodSuggestion:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x10000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x100000000000uLL;
}

- (void)_addNoFlagsTransitPaymentMethodSuggestion:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 320);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 320);
      *(_QWORD *)(a1 + 320) = v5;

      v4 = *(void **)(a1 + 320);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)transitPaymentMethodSuggestionsCount
{
  -[GEODirectionsResponse _readTransitPaymentMethodSuggestions]((uint64_t)self);
  return -[NSMutableArray count](self->_transitPaymentMethodSuggestions, "count");
}

- (id)transitPaymentMethodSuggestionAtIndex:(unint64_t)a3
{
  -[GEODirectionsResponse _readTransitPaymentMethodSuggestions]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_transitPaymentMethodSuggestions, "objectAtIndex:", a3);
}

+ (Class)transitPaymentMethodSuggestionType
{
  return (Class)objc_opt_class();
}

- (void)_readAnalyticData
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 360));
    if ((*(_BYTE *)(a1 + 389) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEODirectionsResponseReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAnalyticData_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 360));
  }
}

- (BOOL)hasAnalyticData
{
  -[GEODirectionsResponse _readAnalyticData]((uint64_t)self);
  return self->_analyticData != 0;
}

- (GEODirectionsRequestResponseAnalyticsData)analyticData
{
  -[GEODirectionsResponse _readAnalyticData]((uint64_t)self);
  return self->_analyticData;
}

- (void)setAnalyticData:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x100000002000uLL;
  objc_storeStrong((id *)&self->_analyticData, a3);
}

- (void)_readAdvisoriesInfo
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 360));
    if ((*(_BYTE *)(a1 + 389) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEODirectionsResponseReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAdvisoriesInfo_tags_1);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 360));
  }
}

- (BOOL)hasAdvisoriesInfo
{
  -[GEODirectionsResponse _readAdvisoriesInfo]((uint64_t)self);
  return self->_advisoriesInfo != 0;
}

- (GEOAdvisoriesInfo)advisoriesInfo
{
  -[GEODirectionsResponse _readAdvisoriesInfo]((uint64_t)self);
  return self->_advisoriesInfo;
}

- (void)setAdvisoriesInfo:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x100000001000uLL;
  objc_storeStrong((id *)&self->_advisoriesInfo, a3);
}

- (void)_readResponseAttributes
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 360));
    if ((*(_BYTE *)(a1 + 391) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEODirectionsResponseReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readResponseAttributes_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 360));
  }
}

- (BOOL)hasResponseAttributes
{
  -[GEODirectionsResponse _readResponseAttributes]((uint64_t)self);
  return self->_responseAttributes != 0;
}

- (GEOCommonResponseAttributes)responseAttributes
{
  -[GEODirectionsResponse _readResponseAttributes]((uint64_t)self);
  return self->_responseAttributes;
}

- (void)setResponseAttributes:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x100010000000uLL;
  objc_storeStrong((id *)&self->_responseAttributes, a3);
}

- (void)_readInternalErrors
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 360));
    if ((*(_BYTE *)(a1 + 391) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEODirectionsResponseReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readInternalErrors_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 360));
  }
}

- (NSMutableArray)internalErrors
{
  -[GEODirectionsResponse _readInternalErrors]((uint64_t)self);
  return self->_internalErrors;
}

- (void)setInternalErrors:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *internalErrors;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x2000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x100000000000uLL;
  internalErrors = self->_internalErrors;
  self->_internalErrors = v4;

}

- (void)clearInternalErrors
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x2000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(_QWORD *)&self->_flags |= 0x100000000000uLL;
  -[NSMutableArray removeAllObjects](self->_internalErrors, "removeAllObjects");
}

- (void)addInternalError:(id)a3
{
  id v4;

  v4 = a3;
  -[GEODirectionsResponse _readInternalErrors]((uint64_t)self);
  -[GEODirectionsResponse _addNoFlagsInternalError:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x2000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x100000000000uLL;
}

- (void)_addNoFlagsInternalError:(uint64_t)a1
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

- (unint64_t)internalErrorsCount
{
  -[GEODirectionsResponse _readInternalErrors]((uint64_t)self);
  return -[NSMutableArray count](self->_internalErrors, "count");
}

- (id)internalErrorAtIndex:(unint64_t)a3
{
  -[GEODirectionsResponse _readInternalErrors]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_internalErrors, "objectAtIndex:", a3);
}

+ (Class)internalErrorType
{
  return (Class)objc_opt_class();
}

- (void)_readServiceVersion
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 360));
    if ((*(_BYTE *)(a1 + 391) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEODirectionsResponseReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readServiceVersion_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 360));
  }
}

- (BOOL)hasServiceVersion
{
  -[GEODirectionsResponse _readServiceVersion]((uint64_t)self);
  return self->_serviceVersion != 0;
}

- (NSString)serviceVersion
{
  -[GEODirectionsResponse _readServiceVersion]((uint64_t)self);
  return self->_serviceVersion;
}

- (void)setServiceVersion:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x100080000000uLL;
  objc_storeStrong((id *)&self->_serviceVersion, a3);
}

- (void)_readDataVersion
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 360));
    if ((*(_BYTE *)(a1 + 390) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEODirectionsResponseReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDataVersion_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 360));
  }
}

- (BOOL)hasDataVersion
{
  -[GEODirectionsResponse _readDataVersion]((uint64_t)self);
  return self->_dataVersion != 0;
}

- (NSString)dataVersion
{
  -[GEODirectionsResponse _readDataVersion]((uint64_t)self);
  return self->_dataVersion;
}

- (void)setDataVersion:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x100000010000uLL;
  objc_storeStrong((id *)&self->_dataVersion, a3);
}

- (void)_readSuggestedRoutes
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 360));
    if ((*(_BYTE *)(a1 + 392) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEODirectionsResponseReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSuggestedRoutes_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 360));
  }
}

- (NSMutableArray)suggestedRoutes
{
  -[GEODirectionsResponse _readSuggestedRoutes]((uint64_t)self);
  return self->_suggestedRoutes;
}

- (void)setSuggestedRoutes:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *suggestedRoutes;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x800000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x100000000000uLL;
  suggestedRoutes = self->_suggestedRoutes;
  self->_suggestedRoutes = v4;

}

- (void)clearSuggestedRoutes
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x800000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(_QWORD *)&self->_flags |= 0x100000000000uLL;
  -[NSMutableArray removeAllObjects](self->_suggestedRoutes, "removeAllObjects");
}

- (void)addSuggestedRoute:(id)a3
{
  id v4;

  v4 = a3;
  -[GEODirectionsResponse _readSuggestedRoutes]((uint64_t)self);
  -[GEODirectionsResponse _addNoFlagsSuggestedRoute:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x800000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x100000000000uLL;
}

- (void)_addNoFlagsSuggestedRoute:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 280);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 280);
      *(_QWORD *)(a1 + 280) = v5;

      v4 = *(void **)(a1 + 280);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)suggestedRoutesCount
{
  -[GEODirectionsResponse _readSuggestedRoutes]((uint64_t)self);
  return -[NSMutableArray count](self->_suggestedRoutes, "count");
}

- (id)suggestedRouteAtIndex:(unint64_t)a3
{
  -[GEODirectionsResponse _readSuggestedRoutes]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_suggestedRoutes, "objectAtIndex:", a3);
}

+ (Class)suggestedRouteType
{
  return (Class)objc_opt_class();
}

- (GEOTimepoint)timepointUsed
{
  *retstr = self[3];
  return self;
}

- (void)setTimepointUsed:(GEOTimepoint *)a3
{
  uint64_t v3;

  *(_QWORD *)&self->_flags |= 0x100000000001uLL;
  v3 = *(_QWORD *)&a3->_type;
  *(_OWORD *)&self->_timepointUsed._currentUserTime = *(_OWORD *)&a3->_currentUserTime;
  *(_QWORD *)&self->_timepointUsed._type = v3;
}

- (void)setHasTimepointUsed:(BOOL)a3
{
  self->_flags = ($BB24C2ED400A1348441C88FA4FCB4848)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFFFELL | a3 | 0x100000000000);
}

- (BOOL)hasTimepointUsed
{
  return *(_DWORD *)&self->_flags & 1;
}

- (void)_readDecoderData
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 360));
    if ((*(_BYTE *)(a1 + 390) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEODirectionsResponseReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDecoderData_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 360));
  }
}

- (BOOL)hasDecoderData
{
  -[GEODirectionsResponse _readDecoderData]((uint64_t)self);
  return self->_decoderData != 0;
}

- (GEOTransitDecoderData)decoderData
{
  -[GEODirectionsResponse _readDecoderData]((uint64_t)self);
  return self->_decoderData;
}

- (void)setDecoderData:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x100000080000uLL;
  objc_storeStrong((id *)&self->_decoderData, a3);
}

- (void)_readTransitDataVersion
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 360));
    if ((*(_BYTE *)(a1 + 392) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEODirectionsResponseReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTransitDataVersion_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 360));
  }
}

- (BOOL)hasTransitDataVersion
{
  -[GEODirectionsResponse _readTransitDataVersion]((uint64_t)self);
  return self->_transitDataVersion != 0;
}

- (NSString)transitDataVersion
{
  -[GEODirectionsResponse _readTransitDataVersion]((uint64_t)self);
  return self->_transitDataVersion;
}

- (void)setTransitDataVersion:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x104000000000uLL;
  objc_storeStrong((id *)&self->_transitDataVersion, a3);
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)GEODirectionsResponse;
  -[GEODirectionsResponse description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEODirectionsResponse dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  return -[GEODirectionsResponse _dictionaryRepresentation:]((uint64_t)self, 0);
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
  id v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  id v22;
  const __CFString *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t k;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  __CFString *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  const __CFString *v42;
  id v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  __CFString *v47;
  void *v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t m;
  void *v54;
  id v55;
  void *v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t n;
  void *v62;
  id v63;
  void *v64;
  uint64_t v65;
  unint64_t v66;
  id v67;
  void *v68;
  _QWORD *v69;
  unint64_t v70;
  uint64_t v71;
  __CFString *v72;
  void *v73;
  id v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t ii;
  void *v79;
  id v80;
  const __CFString *v81;
  void *v82;
  const __CFString *v83;
  void *v84;
  void *v85;
  void *v86;
  const __CFString *v87;
  id v88;
  void *v89;
  void *v90;
  void *v91;
  const __CFString *v92;
  id v93;
  void *v94;
  void *v95;
  void *v96;
  const __CFString *v97;
  id v98;
  void *v99;
  void *v100;
  void *v101;
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
  void *v114;
  id v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t jj;
  void *v120;
  id v121;
  const __CFString *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  const __CFString *v127;
  void *v128;
  void *v129;
  void *v130;
  const __CFString *v131;
  id v132;
  void *v133;
  const __CFString *v134;
  void *v135;
  const __CFString *v136;
  void *v137;
  id v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t kk;
  void *v143;
  id v144;
  const __CFString *v145;
  void *v146;
  id v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t mm;
  void *v152;
  id v153;
  const __CFString *v154;
  void *v155;
  void *v156;
  void *v157;
  const __CFString *v158;
  id v159;
  void *v160;
  id v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t nn;
  void *v166;
  id v167;
  const __CFString *v168;
  void *v169;
  void *v170;
  void *v171;
  const __CFString *v172;
  id v173;
  void *v174;
  void *v175;
  void *v176;
  const __CFString *v177;
  id v178;
  void *v179;
  void *v180;
  void *v181;
  const __CFString *v182;
  id v183;
  void *v184;
  const __CFString *v185;
  void *v186;
  const __CFString *v187;
  void *v188;
  const __CFString *v189;
  void *v190;
  id v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t i1;
  void *v196;
  id v197;
  const __CFString *v198;
  const __CFString *v199;
  id v200;
  void *v201;
  void *v202;
  void *v203;
  const __CFString *v204;
  id v205;
  void *v206;
  const __CFString *v207;
  void *v208;
  void *v209;
  id v210;
  void *v211;
  void *v212;
  void *v213;
  void *v214;
  id v215;
  id v216;
  id v217;
  _QWORD v219[4];
  id v220;
  __int128 v221;
  __int128 v222;
  __int128 v223;
  __int128 v224;
  __int128 v225;
  __int128 v226;
  __int128 v227;
  __int128 v228;
  __int128 v229;
  __int128 v230;
  __int128 v231;
  __int128 v232;
  __int128 v233;
  __int128 v234;
  __int128 v235;
  __int128 v236;
  __int128 v237;
  __int128 v238;
  __int128 v239;
  __int128 v240;
  __int128 v241;
  __int128 v242;
  __int128 v243;
  __int128 v244;
  __int128 v245;
  __int128 v246;
  __int128 v247;
  __int128 v248;
  __int128 v249;
  __int128 v250;
  __int128 v251;
  __int128 v252;
  __int128 v253;
  __int128 v254;
  __int128 v255;
  __int128 v256;
  __int128 v257;
  __int128 v258;
  __int128 v259;
  __int128 v260;
  __int128 v261;
  __int128 v262;
  __int128 v263;
  __int128 v264;
  _BYTE v265[128];
  _BYTE v266[128];
  _BYTE v267[128];
  _BYTE v268[128];
  _BYTE v269[128];
  _BYTE v270[128];
  _BYTE v271[128];
  _BYTE v272[128];
  _BYTE v273[128];
  _BYTE v274[128];
  _BYTE v275[128];
  uint64_t v276;

  v276 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_DWORD *)(a1 + 380);
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
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 380));
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

  if (objc_msgSend(*(id *)(a1 + 232), "count"))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 232), "count"));
    v261 = 0u;
    v262 = 0u;
    v263 = 0u;
    v264 = 0u;
    v8 = *(id *)(a1 + 232);
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v261, v275, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v262;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v262 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v261 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v13, "jsonRepresentation");
          else
            objc_msgSend(v13, "dictionaryRepresentation");
          v14 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v7, "addObject:", v14);
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v261, v275, 16);
      }
      while (v10);
    }

    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("route"));
  }
  if (objc_msgSend(*(id *)(a1 + 344), "count"))
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 344), "count"));
    v257 = 0u;
    v258 = 0u;
    v259 = 0u;
    v260 = 0u;
    v16 = *(id *)(a1 + 344);
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v257, v274, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v258;
      do
      {
        for (j = 0; j != v18; ++j)
        {
          if (*(_QWORD *)v258 != v19)
            objc_enumerationMutation(v16);
          v21 = *(void **)(*((_QWORD *)&v257 + 1) + 8 * j);
          if ((a2 & 1) != 0)
            objc_msgSend(v21, "jsonRepresentation");
          else
            objc_msgSend(v21, "dictionaryRepresentation");
          v22 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v15, "addObject:", v22);
        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v257, v274, 16);
      }
      while (v18);
    }

    if (a2)
      v23 = CFSTR("waypointRoute");
    else
      v23 = CFSTR("waypoint_route");
    objc_msgSend(v4, "setObject:forKey:", v15, v23);

  }
  if (objc_msgSend(*(id *)(a1 + 216), "count"))
  {
    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 216), "count"));
    v253 = 0u;
    v254 = 0u;
    v255 = 0u;
    v256 = 0u;
    v25 = *(id *)(a1 + 216);
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v253, v273, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v254;
      do
      {
        for (k = 0; k != v27; ++k)
        {
          if (*(_QWORD *)v254 != v28)
            objc_enumerationMutation(v25);
          v30 = *(void **)(*((_QWORD *)&v253 + 1) + 8 * k);
          if ((a2 & 1) != 0)
            objc_msgSend(v30, "jsonRepresentation");
          else
            objc_msgSend(v30, "dictionaryRepresentation");
          v31 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v24, "addObject:", v31);
        }
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v253, v273, 16);
      }
      while (v27);
    }

    objc_msgSend(v4, "setObject:forKey:", v24, CFSTR("placeSearchResponse"));
  }
  v32 = *(_QWORD *)(a1 + 388);
  if ((v32 & 8) != 0)
  {
    v33 = *(int *)(a1 + 372);
    if (v33 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 372));
      v34 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v34 = off_1E1C20388[v33];
    }
    objc_msgSend(v4, "setObject:forKey:", v34, CFSTR("localDistanceUnits"));

    v32 = *(_QWORD *)(a1 + 388);
  }
  if ((v32 & 0x100) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 387));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v35, CFSTR("routeDeviatesFromOriginal"));

  }
  objc_msgSend((id)a1, "directionsResponseID");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v36;
  if (v36)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v36, "base64EncodedStringWithOptions:", 0);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v38, CFSTR("directionsResponseID"));

    }
    else
    {
      objc_msgSend(v4, "setObject:forKey:", v36, CFSTR("directionsResponseID"));
    }
  }

  objc_msgSend((id)a1, "tripId");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v39;
  if (v39)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v39, "jsonRepresentation");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = CFSTR("tripId");
    }
    else
    {
      objc_msgSend(v39, "dictionaryRepresentation");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = CFSTR("trip_id");
    }
    v43 = v41;

    objc_msgSend(v4, "setObject:forKey:", v43, v42);
  }

  v44 = *(_QWORD *)(a1 + 388);
  if ((v44 & 0x40) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 385));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v45, CFSTR("isNavigable"));

    v44 = *(_QWORD *)(a1 + 388);
  }
  if ((v44 & 2) != 0)
  {
    v46 = *(int *)(a1 + 364);
    if (v46 >= 8)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 364));
      v47 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v47 = off_1E1C203A0[v46];
    }
    objc_msgSend(v4, "setObject:forKey:", v47, CFSTR("instructionSignFillColor"));

  }
  if (objc_msgSend(*(id *)(a1 + 192), "count"))
  {
    v48 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 192), "count"));
    v249 = 0u;
    v250 = 0u;
    v251 = 0u;
    v252 = 0u;
    v49 = *(id *)(a1 + 192);
    v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v249, v272, 16);
    if (v50)
    {
      v51 = v50;
      v52 = *(_QWORD *)v250;
      do
      {
        for (m = 0; m != v51; ++m)
        {
          if (*(_QWORD *)v250 != v52)
            objc_enumerationMutation(v49);
          v54 = *(void **)(*((_QWORD *)&v249 + 1) + 8 * m);
          if ((a2 & 1) != 0)
            objc_msgSend(v54, "jsonRepresentation");
          else
            objc_msgSend(v54, "dictionaryRepresentation");
          v55 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v48, "addObject:", v55);
        }
        v51 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v249, v272, 16);
      }
      while (v51);
    }

    objc_msgSend(v4, "setObject:forKey:", v48, CFSTR("incidentsOnRoutes"));
  }
  if (objc_msgSend(*(id *)(a1 + 184), "count"))
  {
    v56 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 184), "count"));
    v245 = 0u;
    v246 = 0u;
    v247 = 0u;
    v248 = 0u;
    v57 = *(id *)(a1 + 184);
    v58 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v245, v271, 16);
    if (v58)
    {
      v59 = v58;
      v60 = *(_QWORD *)v246;
      do
      {
        for (n = 0; n != v59; ++n)
        {
          if (*(_QWORD *)v246 != v60)
            objc_enumerationMutation(v57);
          v62 = *(void **)(*((_QWORD *)&v245 + 1) + 8 * n);
          if ((a2 & 1) != 0)
            objc_msgSend(v62, "jsonRepresentation");
          else
            objc_msgSend(v62, "dictionaryRepresentation");
          v63 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v56, "addObject:", v63);
        }
        v59 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v245, v271, 16);
      }
      while (v59);
    }

    objc_msgSend(v4, "setObject:forKey:", v56, CFSTR("incidentsOffRoutes"));
  }
  if (*(_QWORD *)(a1 + 32))
  {
    v64 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", *(_QWORD *)(a1 + 32));
    if (*(_QWORD *)(a1 + 32))
    {
      v65 = 0;
      v66 = 0;
      do
      {
        _GEOProblemDetailDictionaryRepresentation((unsigned int *)(*(_QWORD *)(a1 + 24) + v65));
        v67 = (id)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v64, "addObject:", v67);
        ++v66;
        v65 += 12;
      }
      while (v66 < *(_QWORD *)(a1 + 32));
    }
    objc_msgSend(v4, "setObject:forKey:", v64, CFSTR("problemDetail"));

  }
  if (*(_QWORD *)(a1 + 56))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = (_QWORD *)(a1 + 48);
    if (*(_QWORD *)(a1 + 56))
    {
      v70 = 0;
      do
      {
        v71 = *(int *)(*v69 + 4 * v70);
        if (v71 >= 7)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v71);
          v72 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v72 = off_1E1C203E0[v71];
        }
        objc_msgSend(v68, "addObject:", v72);

        ++v70;
        v69 = (_QWORD *)(a1 + 48);
      }
      while (v70 < *(_QWORD *)(a1 + 56));
    }
    objc_msgSend(v4, "setObject:forKey:", v68, CFSTR("supportedTransportType"));

  }
  if (objc_msgSend(*(id *)(a1 + 240), "count"))
  {
    v73 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 240), "count"));
    v241 = 0u;
    v242 = 0u;
    v243 = 0u;
    v244 = 0u;
    v74 = *(id *)(a1 + 240);
    v75 = objc_msgSend(v74, "countByEnumeratingWithState:objects:count:", &v241, v270, 16);
    if (v75)
    {
      v76 = v75;
      v77 = *(_QWORD *)v242;
      do
      {
        for (ii = 0; ii != v76; ++ii)
        {
          if (*(_QWORD *)v242 != v77)
            objc_enumerationMutation(v74);
          v79 = *(void **)(*((_QWORD *)&v241 + 1) + 8 * ii);
          if ((a2 & 1) != 0)
            objc_msgSend(v79, "jsonRepresentation");
          else
            objc_msgSend(v79, "dictionaryRepresentation");
          v80 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v73, "addObject:", v80);
        }
        v76 = objc_msgSend(v74, "countByEnumeratingWithState:objects:count:", &v241, v270, 16);
      }
      while (v76);
    }

    if (a2)
      v81 = CFSTR("serviceGap");
    else
      v81 = CFSTR("service_gap");
    objc_msgSend(v4, "setObject:forKey:", v73, v81);

  }
  if ((*(_BYTE *)(a1 + 388) & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 376));
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v83 = CFSTR("selectedRouteIndex");
    else
      v83 = CFSTR("selected_route_index");
    objc_msgSend(v4, "setObject:forKey:", v82, v83);

  }
  objc_msgSend((id)a1, "transitIncidentMessage");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v85 = v84;
  if (v84)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v84, "jsonRepresentation");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      v87 = CFSTR("transitIncidentMessage");
    }
    else
    {
      objc_msgSend(v84, "dictionaryRepresentation");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      v87 = CFSTR("transit_incident_message");
    }
    v88 = v86;

    objc_msgSend(v4, "setObject:forKey:", v88, v87);
  }

  objc_msgSend((id)a1, "displayHints");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v90 = v89;
  if (v89)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v89, "jsonRepresentation");
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      v92 = CFSTR("displayHints");
    }
    else
    {
      objc_msgSend(v89, "dictionaryRepresentation");
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      v92 = CFSTR("display_hints");
    }
    v93 = v91;

    objc_msgSend(v4, "setObject:forKey:", v93, v92);
  }

  objc_msgSend((id)a1, "styleAttributes");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  v95 = v94;
  if (v94)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v94, "jsonRepresentation");
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      v97 = CFSTR("styleAttributes");
    }
    else
    {
      objc_msgSend(v94, "dictionaryRepresentation");
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      v97 = CFSTR("style_attributes");
    }
    v98 = v96;

    objc_msgSend(v4, "setObject:forKey:", v98, v97);
  }

  objc_msgSend((id)a1, "sessionState");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  v100 = v99;
  if (v99)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v99, "base64EncodedStringWithOptions:", 0);
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v101, CFSTR("sessionState"));

    }
    else
    {
      objc_msgSend(v4, "setObject:forKey:", v99, CFSTR("session_state"));
    }
  }

  objc_msgSend((id)a1, "failureAlert");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  v103 = v102;
  if (v102)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v102, "jsonRepresentation");
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      v105 = CFSTR("failureAlert");
    }
    else
    {
      objc_msgSend(v102, "dictionaryRepresentation");
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      v105 = CFSTR("failure_alert");
    }
    v106 = v104;

    objc_msgSend(v4, "setObject:forKey:", v106, v105);
  }

  if ((*(_BYTE *)(a1 + 388) & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 368));
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v108 = CFSTR("liveRouteSavingsSeconds");
    else
      v108 = CFSTR("live_route_savings_seconds");
    objc_msgSend(v4, "setObject:forKey:", v107, v108);

  }
  objc_msgSend((id)a1, "datasetAbStatus");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  v110 = v109;
  if (v109)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v109, "jsonRepresentation");
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      v112 = CFSTR("datasetAbStatus");
    }
    else
    {
      objc_msgSend(v109, "dictionaryRepresentation");
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      v112 = CFSTR("dataset_ab_status");
    }
    v113 = v111;

    objc_msgSend(v4, "setObject:forKey:", v113, v112);
  }

  if (objc_msgSend(*(id *)(a1 + 288), "count"))
  {
    v114 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 288), "count"));
    v237 = 0u;
    v238 = 0u;
    v239 = 0u;
    v240 = 0u;
    v115 = *(id *)(a1 + 288);
    v116 = objc_msgSend(v115, "countByEnumeratingWithState:objects:count:", &v237, v269, 16);
    if (v116)
    {
      v117 = v116;
      v118 = *(_QWORD *)v238;
      do
      {
        for (jj = 0; jj != v117; ++jj)
        {
          if (*(_QWORD *)v238 != v118)
            objc_enumerationMutation(v115);
          v120 = *(void **)(*((_QWORD *)&v237 + 1) + 8 * jj);
          if ((a2 & 1) != 0)
            objc_msgSend(v120, "jsonRepresentation");
          else
            objc_msgSend(v120, "dictionaryRepresentation");
          v121 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v114, "addObject:", v121);
        }
        v117 = objc_msgSend(v115, "countByEnumeratingWithState:objects:count:", &v237, v269, 16);
      }
      while (v117);
    }

    if (a2)
      v122 = CFSTR("trafficCamera");
    else
      v122 = CFSTR("traffic_camera");
    objc_msgSend(v4, "setObject:forKey:", v114, v122);

  }
  objc_msgSend((id)a1, "nonRecommendedRoutesCache");
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  v124 = v123;
  if (v123)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v123, "base64EncodedStringWithOptions:", 0);
      v125 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v125, CFSTR("nonRecommendedRoutesCache"));

    }
    else
    {
      objc_msgSend(v4, "setObject:forKey:", v123, CFSTR("non_recommended_routes_cache"));
    }
  }

  if ((*(_BYTE *)(a1 + 388) & 0x80) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 386));
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v127 = CFSTR("isOfflineResponse");
    else
      v127 = CFSTR("is_offline_response");
    objc_msgSend(v4, "setObject:forKey:", v126, v127);

  }
  objc_msgSend((id)a1, "snapScoreMetadataDebug");
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  v129 = v128;
  if (v128)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v128, "jsonRepresentation");
      v130 = (void *)objc_claimAutoreleasedReturnValue();
      v131 = CFSTR("snapScoreMetadataDebug");
    }
    else
    {
      objc_msgSend(v128, "dictionaryRepresentation");
      v130 = (void *)objc_claimAutoreleasedReturnValue();
      v131 = CFSTR("snap_score_metadata_debug");
    }
    v132 = v130;

    objc_msgSend(v4, "setObject:forKey:", v132, v131);
  }

  if ((*(_BYTE *)(a1 + 388) & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 384));
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v134 = CFSTR("hasKhSegments");
    else
      v134 = CFSTR("has_kh_segments");
    objc_msgSend(v4, "setObject:forKey:", v133, v134);

  }
  objc_msgSend((id)a1, "debugData");
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  if (v135)
  {
    if (a2)
      v136 = CFSTR("debugData");
    else
      v136 = CFSTR("debug_data");
    objc_msgSend(v4, "setObject:forKey:", v135, v136);
  }

  if (objc_msgSend(*(id *)(a1 + 112), "count"))
  {
    v137 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 112), "count"));
    v233 = 0u;
    v234 = 0u;
    v235 = 0u;
    v236 = 0u;
    v138 = *(id *)(a1 + 112);
    v139 = objc_msgSend(v138, "countByEnumeratingWithState:objects:count:", &v233, v268, 16);
    if (v139)
    {
      v140 = v139;
      v141 = *(_QWORD *)v234;
      do
      {
        for (kk = 0; kk != v140; ++kk)
        {
          if (*(_QWORD *)v234 != v141)
            objc_enumerationMutation(v138);
          v143 = *(void **)(*((_QWORD *)&v233 + 1) + 8 * kk);
          if ((a2 & 1) != 0)
            objc_msgSend(v143, "jsonRepresentation");
          else
            objc_msgSend(v143, "dictionaryRepresentation");
          v144 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v137, "addObject:", v144);
        }
        v140 = objc_msgSend(v138, "countByEnumeratingWithState:objects:count:", &v233, v268, 16);
      }
      while (v140);
    }

    if (a2)
      v145 = CFSTR("arrivalParameters");
    else
      v145 = CFSTR("arrival_parameters");
    objc_msgSend(v4, "setObject:forKey:", v137, v145);

  }
  if (objc_msgSend(*(id *)(a1 + 296), "count"))
  {
    v146 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 296), "count"));
    v229 = 0u;
    v230 = 0u;
    v231 = 0u;
    v232 = 0u;
    v147 = *(id *)(a1 + 296);
    v148 = objc_msgSend(v147, "countByEnumeratingWithState:objects:count:", &v229, v267, 16);
    if (v148)
    {
      v149 = v148;
      v150 = *(_QWORD *)v230;
      do
      {
        for (mm = 0; mm != v149; ++mm)
        {
          if (*(_QWORD *)v230 != v150)
            objc_enumerationMutation(v147);
          v152 = *(void **)(*((_QWORD *)&v229 + 1) + 8 * mm);
          if ((a2 & 1) != 0)
            objc_msgSend(v152, "jsonRepresentation");
          else
            objc_msgSend(v152, "dictionaryRepresentation");
          v153 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v146, "addObject:", v153);
        }
        v149 = objc_msgSend(v147, "countByEnumeratingWithState:objects:count:", &v229, v267, 16);
      }
      while (v149);
    }

    if (a2)
      v154 = CFSTR("trafficSignal");
    else
      v154 = CFSTR("traffic_signal");
    objc_msgSend(v4, "setObject:forKey:", v146, v154);

  }
  objc_msgSend((id)a1, "transitRouteUpdateConfiguration");
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  v156 = v155;
  if (v155)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v155, "jsonRepresentation");
      v157 = (void *)objc_claimAutoreleasedReturnValue();
      v158 = CFSTR("transitRouteUpdateConfiguration");
    }
    else
    {
      objc_msgSend(v155, "dictionaryRepresentation");
      v157 = (void *)objc_claimAutoreleasedReturnValue();
      v158 = CFSTR("transit_route_update_configuration");
    }
    v159 = v157;

    objc_msgSend(v4, "setObject:forKey:", v159, v158);
  }

  if (objc_msgSend(*(id *)(a1 + 320), "count"))
  {
    v160 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 320), "count"));
    v225 = 0u;
    v226 = 0u;
    v227 = 0u;
    v228 = 0u;
    v161 = *(id *)(a1 + 320);
    v162 = objc_msgSend(v161, "countByEnumeratingWithState:objects:count:", &v225, v266, 16);
    if (v162)
    {
      v163 = v162;
      v164 = *(_QWORD *)v226;
      do
      {
        for (nn = 0; nn != v163; ++nn)
        {
          if (*(_QWORD *)v226 != v164)
            objc_enumerationMutation(v161);
          v166 = *(void **)(*((_QWORD *)&v225 + 1) + 8 * nn);
          if ((a2 & 1) != 0)
            objc_msgSend(v166, "jsonRepresentation");
          else
            objc_msgSend(v166, "dictionaryRepresentation");
          v167 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v160, "addObject:", v167);
        }
        v163 = objc_msgSend(v161, "countByEnumeratingWithState:objects:count:", &v225, v266, 16);
      }
      while (v163);
    }

    if (a2)
      v168 = CFSTR("transitPaymentMethodSuggestion");
    else
      v168 = CFSTR("transit_payment_method_suggestion");
    objc_msgSend(v4, "setObject:forKey:", v160, v168);

  }
  objc_msgSend((id)a1, "analyticData");
  v169 = (void *)objc_claimAutoreleasedReturnValue();
  v170 = v169;
  if (v169)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v169, "jsonRepresentation");
      v171 = (void *)objc_claimAutoreleasedReturnValue();
      v172 = CFSTR("analyticData");
    }
    else
    {
      objc_msgSend(v169, "dictionaryRepresentation");
      v171 = (void *)objc_claimAutoreleasedReturnValue();
      v172 = CFSTR("analytic_data");
    }
    v173 = v171;

    objc_msgSend(v4, "setObject:forKey:", v173, v172);
  }

  objc_msgSend((id)a1, "advisoriesInfo");
  v174 = (void *)objc_claimAutoreleasedReturnValue();
  v175 = v174;
  if (v174)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v174, "jsonRepresentation");
      v176 = (void *)objc_claimAutoreleasedReturnValue();
      v177 = CFSTR("advisoriesInfo");
    }
    else
    {
      objc_msgSend(v174, "dictionaryRepresentation");
      v176 = (void *)objc_claimAutoreleasedReturnValue();
      v177 = CFSTR("advisories_info");
    }
    v178 = v176;

    objc_msgSend(v4, "setObject:forKey:", v178, v177);
  }

  objc_msgSend((id)a1, "responseAttributes");
  v179 = (void *)objc_claimAutoreleasedReturnValue();
  v180 = v179;
  if (v179)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v179, "jsonRepresentation");
      v181 = (void *)objc_claimAutoreleasedReturnValue();
      v182 = CFSTR("responseAttributes");
    }
    else
    {
      objc_msgSend(v179, "dictionaryRepresentation");
      v181 = (void *)objc_claimAutoreleasedReturnValue();
      v182 = CFSTR("response_attributes");
    }
    v183 = v181;

    objc_msgSend(v4, "setObject:forKey:", v183, v182);
  }

  if (*(_QWORD *)(a1 + 200))
  {
    objc_msgSend((id)a1, "internalErrors");
    v184 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v185 = CFSTR("internalError");
    else
      v185 = CFSTR("internal_error");
    objc_msgSend(v4, "setObject:forKey:", v184, v185);

  }
  objc_msgSend((id)a1, "serviceVersion");
  v186 = (void *)objc_claimAutoreleasedReturnValue();
  if (v186)
  {
    if (a2)
      v187 = CFSTR("serviceVersion");
    else
      v187 = CFSTR("service_version");
    objc_msgSend(v4, "setObject:forKey:", v186, v187);
  }

  objc_msgSend((id)a1, "dataVersion");
  v188 = (void *)objc_claimAutoreleasedReturnValue();
  if (v188)
  {
    if (a2)
      v189 = CFSTR("dataVersion");
    else
      v189 = CFSTR("data_version");
    objc_msgSend(v4, "setObject:forKey:", v188, v189);
  }

  if (objc_msgSend(*(id *)(a1 + 280), "count"))
  {
    v190 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 280), "count"));
    v221 = 0u;
    v222 = 0u;
    v223 = 0u;
    v224 = 0u;
    v191 = *(id *)(a1 + 280);
    v192 = objc_msgSend(v191, "countByEnumeratingWithState:objects:count:", &v221, v265, 16);
    if (v192)
    {
      v193 = v192;
      v194 = *(_QWORD *)v222;
      do
      {
        for (i1 = 0; i1 != v193; ++i1)
        {
          if (*(_QWORD *)v222 != v194)
            objc_enumerationMutation(v191);
          v196 = *(void **)(*((_QWORD *)&v221 + 1) + 8 * i1);
          if ((a2 & 1) != 0)
            objc_msgSend(v196, "jsonRepresentation");
          else
            objc_msgSend(v196, "dictionaryRepresentation");
          v197 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v190, "addObject:", v197);
        }
        v193 = objc_msgSend(v191, "countByEnumeratingWithState:objects:count:", &v221, v265, 16);
      }
      while (v193);
    }

    if (a2)
      v198 = CFSTR("suggestedRoute");
    else
      v198 = CFSTR("suggested_route");
    objc_msgSend(v4, "setObject:forKey:", v190, v198);

  }
  if ((*(_BYTE *)(a1 + 388) & 1) != 0)
  {
    if (a2)
      v199 = CFSTR("timepointUsed");
    else
      v199 = CFSTR("timepoint_used");
    _GEOTimepointDictionaryRepresentation(a1 + 72, a2);
    v200 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKey:", v200, v199);
  }
  objc_msgSend((id)a1, "decoderData");
  v201 = (void *)objc_claimAutoreleasedReturnValue();
  v202 = v201;
  if (v201)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v201, "jsonRepresentation");
      v203 = (void *)objc_claimAutoreleasedReturnValue();
      v204 = CFSTR("decoderData");
    }
    else
    {
      objc_msgSend(v201, "dictionaryRepresentation");
      v203 = (void *)objc_claimAutoreleasedReturnValue();
      v204 = CFSTR("decoder_data");
    }
    v205 = v203;

    objc_msgSend(v4, "setObject:forKey:", v205, v204);
  }

  objc_msgSend((id)a1, "transitDataVersion");
  v206 = (void *)objc_claimAutoreleasedReturnValue();
  if (v206)
  {
    if (a2)
      v207 = CFSTR("transitDataVersion");
    else
      v207 = CFSTR("transit_data_version");
    objc_msgSend(v4, "setObject:forKey:", v206, v207);
  }

  objc_msgSend((id)a1, "clientMetrics");
  v208 = (void *)objc_claimAutoreleasedReturnValue();
  v209 = v208;
  if (v208)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v208, "jsonRepresentation");
    else
      objc_msgSend(v208, "dictionaryRepresentation");
    v210 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKey:", v210, CFSTR("clientMetrics"));
  }

  v211 = *(void **)(a1 + 16);
  if (v211)
  {
    objc_msgSend(v211, "dictionaryRepresentation");
    v212 = (void *)objc_claimAutoreleasedReturnValue();
    v213 = v212;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v212, "count"));
      v214 = (void *)objc_claimAutoreleasedReturnValue();
      v219[0] = MEMORY[0x1E0C809B0];
      v219[1] = 3221225472;
      v219[2] = __51__GEODirectionsResponse__dictionaryRepresentation___block_invoke;
      v219[3] = &unk_1E1C00600;
      v215 = v214;
      v220 = v215;
      objc_msgSend(v213, "enumerateKeysAndObjectsUsingBlock:", v219);
      v216 = v215;

      v213 = v216;
    }
    objc_msgSend(v4, "setObject:forKey:", v213, CFSTR("Unknown Fields"));

  }
  v217 = v4;

  return v217;
}

- (id)jsonRepresentation
{
  return -[GEODirectionsResponse _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __51__GEODirectionsResponse__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEODirectionsResponse)initWithDictionary:(id)a3
{
  return (GEODirectionsResponse *)-[GEODirectionsResponse _initWithDictionary:isJSON:](self, a3, 0);
}

- (id)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  unint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  GEORoute *v18;
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
  GEOWaypointRoute *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t k;
  uint64_t v38;
  GEOPlaceSearchResponse *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  id v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  const __CFString *v48;
  void *v49;
  GEOUUID *v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  uint64_t v55;
  void *v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t m;
  uint64_t v62;
  GEORouteIncident *v63;
  uint64_t v64;
  void *v65;
  void *v66;
  id v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t n;
  uint64_t v72;
  GEORouteIncident *v73;
  uint64_t v74;
  void *v75;
  void *v76;
  id v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t ii;
  void *v82;
  void *v83;
  id v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t jj;
  void *v89;
  id v90;
  uint64_t v91;
  const __CFString *v92;
  void *v93;
  id v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t kk;
  uint64_t v99;
  GEOTransitServiceGap *v100;
  uint64_t v101;
  void *v102;
  const __CFString *v103;
  void *v104;
  const __CFString *v105;
  void *v106;
  GEOPBTransitRoutingIncidentMessage *v107;
  void *v108;
  const __CFString *v109;
  void *v110;
  GEORouteDisplayHints *v111;
  uint64_t v112;
  void *v113;
  const __CFString *v114;
  void *v115;
  GEOStyleAttributes *v116;
  uint64_t v117;
  void *v118;
  const __CFString *v119;
  void *v120;
  void *v121;
  const __CFString *v122;
  void *v123;
  GEOAlert *v124;
  void *v125;
  const __CFString *v126;
  void *v127;
  const __CFString *v128;
  void *v129;
  GEOPDDatasetABStatus *v130;
  uint64_t v131;
  void *v132;
  const __CFString *v133;
  void *v134;
  id v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t mm;
  uint64_t v140;
  GEOTrafficCamera *v141;
  uint64_t v142;
  void *v143;
  const __CFString *v144;
  void *v145;
  void *v146;
  const __CFString *v147;
  void *v148;
  const __CFString *v149;
  void *v150;
  GEOSnapScoreMetadata *v151;
  void *v152;
  const __CFString *v153;
  void *v154;
  const __CFString *v155;
  void *v156;
  void *v157;
  const __CFString *v158;
  void *v159;
  id v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t nn;
  uint64_t v165;
  GEOArrivalParameters *v166;
  uint64_t v167;
  void *v168;
  const __CFString *v169;
  void *v170;
  id v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t i1;
  uint64_t v176;
  GEOTrafficSignal *v177;
  uint64_t v178;
  void *v179;
  const __CFString *v180;
  void *v181;
  GEOTransitRouteUpdateConfiguration *v182;
  uint64_t v183;
  void *v184;
  const __CFString *v185;
  void *v186;
  id v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t i2;
  uint64_t v192;
  GEOPBTransitPaymentMethodSuggestion *v193;
  uint64_t v194;
  void *v195;
  const __CFString *v196;
  void *v197;
  GEODirectionsRequestResponseAnalyticsData *v198;
  uint64_t v199;
  void *v200;
  const __CFString *v201;
  void *v202;
  GEOAdvisoriesInfo *v203;
  uint64_t v204;
  void *v205;
  const __CFString *v206;
  void *v207;
  GEOCommonResponseAttributes *v208;
  uint64_t v209;
  void *v210;
  const __CFString *v211;
  void *v212;
  id v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t i3;
  void *v218;
  void *v219;
  const __CFString *v220;
  void *v221;
  void *v222;
  const __CFString *v223;
  void *v224;
  void *v225;
  const __CFString *v226;
  void *v227;
  id v228;
  uint64_t v229;
  uint64_t v230;
  uint64_t v231;
  uint64_t i4;
  uint64_t v233;
  GEOTransitSuggestedRoute *v234;
  uint64_t v235;
  void *v236;
  const __CFString *v237;
  void *v238;
  const __CFString *v239;
  void *v240;
  GEOTransitDecoderData *v241;
  uint64_t v242;
  void *v243;
  const __CFString *v244;
  void *v245;
  void *v246;
  void *v247;
  GEOClientMetrics *v248;
  uint64_t v249;
  void *v250;
  void *v252;
  id v253;
  __int128 v254;
  uint64_t v255;
  __int128 v256;
  uint64_t v257;
  __int128 v258;
  __int128 v259;
  __int128 v260;
  __int128 v261;
  __int128 v262;
  __int128 v263;
  __int128 v264;
  __int128 v265;
  __int128 v266;
  __int128 v267;
  __int128 v268;
  __int128 v269;
  __int128 v270;
  __int128 v271;
  __int128 v272;
  __int128 v273;
  __int128 v274;
  __int128 v275;
  __int128 v276;
  __int128 v277;
  __int128 v278;
  __int128 v279;
  __int128 v280;
  __int128 v281;
  __int128 v282;
  __int128 v283;
  __int128 v284;
  __int128 v285;
  __int128 v286;
  __int128 v287;
  __int128 v288;
  __int128 v289;
  __int128 v290;
  __int128 v291;
  __int128 v292;
  __int128 v293;
  __int128 v294;
  __int128 v295;
  __int128 v296;
  __int128 v297;
  __int128 v298;
  __int128 v299;
  __int128 v300;
  __int128 v301;
  __int128 v302;
  __int128 v303;
  __int128 v304;
  __int128 v305;
  __int128 v306;
  __int128 v307;
  __int128 v308;
  __int128 v309;
  __int128 v310;
  __int128 v311;
  __int128 v312;
  __int128 v313;
  _BYTE v314[128];
  _BYTE v315[128];
  _BYTE v316[128];
  _BYTE v317[128];
  _BYTE v318[128];
  _BYTE v319[128];
  _BYTE v320[128];
  _BYTE v321[128];
  _BYTE v322[128];
  _BYTE v323[128];
  _BYTE v324[128];
  _BYTE v325[128];
  _BYTE v326[128];
  _BYTE v327[128];
  uint64_t v328;

  v328 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (!a1)
    goto LABEL_450;
  v6 = (id)objc_msgSend(a1, "init");

  if (!v6)
  {
    a1 = 0;
    goto LABEL_450;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("status"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
    if ((objc_msgSend(v8, "isEqualToString:", CFSTR("STATUS_SUCCESS")) & 1) != 0)
    {
      v9 = 0;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("STATUS_FAILED")) & 1) != 0)
    {
      v9 = 1;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("STATUS_INCOMPLETE")) & 1) != 0)
    {
      v9 = 2;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("INVALID_REQUEST")) & 1) != 0)
    {
      v9 = 5;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("FAILED_NO_RESULT")) & 1) != 0)
    {
      v9 = 20;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("NEEDS_REFINEMENT")) & 1) != 0)
    {
      v9 = 30;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("FAILED_NOT_AUTHORIZED")) & 1) != 0)
    {
      v9 = 40;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("STATUS_DEDUPED")) & 1) != 0)
    {
      v9 = 50;
    }
    else if (objc_msgSend(v8, "isEqualToString:", CFSTR("VERSION_MISMATCH")))
    {
      v9 = 60;
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_28;
    v9 = objc_msgSend(v7, "intValue");
  }
  objc_msgSend(v6, "setStatus:", v9);
LABEL_28:

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("route"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0x1E0C99000uLL;
  objc_opt_class();
  v253 = v5;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v312 = 0u;
    v313 = 0u;
    v310 = 0u;
    v311 = 0u;
    v12 = v10;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v310, v327, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v311;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v311 != v15)
            objc_enumerationMutation(v12);
          v17 = *(_QWORD *)(*((_QWORD *)&v310 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v18 = [GEORoute alloc];
            if ((a3 & 1) != 0)
              v19 = -[GEORoute initWithJSON:](v18, "initWithJSON:", v17);
            else
              v19 = -[GEORoute initWithDictionary:](v18, "initWithDictionary:", v17);
            v20 = (void *)v19;
            objc_msgSend(v6, "addRoute:", v19);

          }
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v310, v327, 16);
      }
      while (v14);
    }

    v5 = v253;
    v11 = 0x1E0C99000uLL;
  }

  if (a3)
    v21 = CFSTR("waypointRoute");
  else
    v21 = CFSTR("waypoint_route");
  objc_msgSend(v5, "objectForKeyedSubscript:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v308 = 0u;
    v309 = 0u;
    v306 = 0u;
    v307 = 0u;
    v23 = v22;
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v306, v326, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v307;
      do
      {
        for (j = 0; j != v25; ++j)
        {
          if (*(_QWORD *)v307 != v26)
            objc_enumerationMutation(v23);
          v28 = *(_QWORD *)(*((_QWORD *)&v306 + 1) + 8 * j);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v29 = [GEOWaypointRoute alloc];
            if ((a3 & 1) != 0)
              v30 = -[GEOWaypointRoute initWithJSON:](v29, "initWithJSON:", v28);
            else
              v30 = -[GEOWaypointRoute initWithDictionary:](v29, "initWithDictionary:", v28);
            v31 = (void *)v30;
            objc_msgSend(v6, "addWaypointRoute:", v30);

          }
        }
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v306, v326, 16);
      }
      while (v25);
    }

    v5 = v253;
    v11 = 0x1E0C99000uLL;
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("placeSearchResponse"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v304 = 0u;
    v305 = 0u;
    v302 = 0u;
    v303 = 0u;
    v33 = v32;
    v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v302, v325, 16);
    if (v34)
    {
      v35 = v34;
      v36 = *(_QWORD *)v303;
      do
      {
        for (k = 0; k != v35; ++k)
        {
          if (*(_QWORD *)v303 != v36)
            objc_enumerationMutation(v33);
          v38 = *(_QWORD *)(*((_QWORD *)&v302 + 1) + 8 * k);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v39 = [GEOPlaceSearchResponse alloc];
            if ((a3 & 1) != 0)
              v40 = -[GEOPlaceSearchResponse initWithJSON:](v39, "initWithJSON:", v38);
            else
              v40 = -[GEOPlaceSearchResponse initWithDictionary:](v39, "initWithDictionary:", v38);
            v41 = (void *)v40;
            objc_msgSend(v6, "addPlaceSearchResponse:", v40);

          }
        }
        v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v302, v325, 16);
      }
      while (v35);
    }

    v5 = v253;
    v11 = 0x1E0C99000uLL;
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("localDistanceUnits"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v43 = v42;
    if ((objc_msgSend(v43, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
    {
      v44 = 0;
    }
    else if ((objc_msgSend(v43, "isEqualToString:", CFSTR("METRIC")) & 1) != 0)
    {
      v44 = 1;
    }
    else if (objc_msgSend(v43, "isEqualToString:", CFSTR("IMPERIAL")))
    {
      v44 = 2;
    }
    else
    {
      v44 = 0;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_85;
    v44 = objc_msgSend(v42, "intValue");
  }
  objc_msgSend(v6, "setLocalDistanceUnits:", v44);
LABEL_85:

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("routeDeviatesFromOriginal"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setRouteDeviatesFromOriginal:", objc_msgSend(v45, "BOOLValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("directionsResponseID"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v47 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v46, 0);
    objc_msgSend(v6, "setDirectionsResponseID:", v47);

  }
  if (a3)
    v48 = CFSTR("tripId");
  else
    v48 = CFSTR("trip_id");
  objc_msgSend(v5, "objectForKeyedSubscript:", v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v50 = [GEOUUID alloc];
    if (v50)
      v51 = (void *)-[GEOUUID _initWithDictionary:isJSON:]((uint64_t)v50, v49);
    else
      v51 = 0;
    objc_msgSend(v6, "setTripId:", v51);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("isNavigable"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setIsNavigable:", objc_msgSend(v52, "BOOLValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("instructionSignFillColor"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v54 = v53;
    if ((objc_msgSend(v54, "isEqualToString:", CFSTR("BLACK")) & 1) != 0)
    {
      v55 = 0;
    }
    else if ((objc_msgSend(v54, "isEqualToString:", CFSTR("RED")) & 1) != 0)
    {
      v55 = 1;
    }
    else if ((objc_msgSend(v54, "isEqualToString:", CFSTR("GREEN")) & 1) != 0)
    {
      v55 = 2;
    }
    else if ((objc_msgSend(v54, "isEqualToString:", CFSTR("YELLOW")) & 1) != 0)
    {
      v55 = 3;
    }
    else if ((objc_msgSend(v54, "isEqualToString:", CFSTR("BLUE")) & 1) != 0)
    {
      v55 = 4;
    }
    else if ((objc_msgSend(v54, "isEqualToString:", CFSTR("PURPLE")) & 1) != 0)
    {
      v55 = 5;
    }
    else if ((objc_msgSend(v54, "isEqualToString:", CFSTR("CYAN")) & 1) != 0)
    {
      v55 = 6;
    }
    else if (objc_msgSend(v54, "isEqualToString:", CFSTR("WHITE")))
    {
      v55 = 7;
    }
    else
    {
      v55 = 0;
    }

    goto LABEL_119;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v55 = objc_msgSend(v53, "intValue");
LABEL_119:
    objc_msgSend(v6, "setInstructionSignFillColor:", v55);
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("incidentsOnRoutes"));
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v300 = 0u;
    v301 = 0u;
    v298 = 0u;
    v299 = 0u;
    v57 = v56;
    v58 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v298, v324, 16);
    if (v58)
    {
      v59 = v58;
      v60 = *(_QWORD *)v299;
      do
      {
        for (m = 0; m != v59; ++m)
        {
          if (*(_QWORD *)v299 != v60)
            objc_enumerationMutation(v57);
          v62 = *(_QWORD *)(*((_QWORD *)&v298 + 1) + 8 * m);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v63 = [GEORouteIncident alloc];
            if ((a3 & 1) != 0)
              v64 = -[GEORouteIncident initWithJSON:](v63, "initWithJSON:", v62);
            else
              v64 = -[GEORouteIncident initWithDictionary:](v63, "initWithDictionary:", v62);
            v65 = (void *)v64;
            objc_msgSend(v6, "addIncidentsOnRoutes:", v64);

          }
        }
        v59 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v298, v324, 16);
      }
      while (v59);
    }

    v5 = v253;
    v11 = 0x1E0C99000uLL;
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("incidentsOffRoutes"));
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v296 = 0u;
    v297 = 0u;
    v294 = 0u;
    v295 = 0u;
    v67 = v66;
    v68 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v294, v323, 16);
    if (v68)
    {
      v69 = v68;
      v70 = *(_QWORD *)v295;
      do
      {
        for (n = 0; n != v69; ++n)
        {
          if (*(_QWORD *)v295 != v70)
            objc_enumerationMutation(v67);
          v72 = *(_QWORD *)(*((_QWORD *)&v294 + 1) + 8 * n);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v73 = [GEORouteIncident alloc];
            if ((a3 & 1) != 0)
              v74 = -[GEORouteIncident initWithJSON:](v73, "initWithJSON:", v72);
            else
              v74 = -[GEORouteIncident initWithDictionary:](v73, "initWithDictionary:", v72);
            v75 = (void *)v74;
            objc_msgSend(v6, "addIncidentsOffRoutes:", v74);

          }
        }
        v69 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v294, v323, 16);
      }
      while (v69);
    }

    v5 = v253;
    v11 = 0x1E0C99000uLL;
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("problemDetail"));
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v292 = 0u;
    v293 = 0u;
    v290 = 0u;
    v291 = 0u;
    v77 = v76;
    v78 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v290, v322, 16);
    if (v78)
    {
      v79 = v78;
      v80 = *(_QWORD *)v291;
      do
      {
        for (ii = 0; ii != v79; ++ii)
        {
          if (*(_QWORD *)v291 != v80)
            objc_enumerationMutation(v77);
          v82 = *(void **)(*((_QWORD *)&v290 + 1) + 8 * ii);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            DWORD2(v256) = 0;
            *(_QWORD *)&v256 = 0;
            _GEOProblemDetailFromDictionaryRepresentation(v82, (uint64_t)&v256);
            v11 = v11 & 0xFFFFFFFF00000000 | DWORD2(v256);
            objc_msgSend(v6, "addProblemDetail:", (_QWORD)v256, v11);
          }
        }
        v79 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v290, v322, 16);
      }
      while (v79);
    }

    v5 = v253;
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("supportedTransportType"));
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v288 = 0u;
    v289 = 0u;
    v286 = 0u;
    v287 = 0u;
    v252 = v83;
    v84 = v83;
    v85 = objc_msgSend(v84, "countByEnumeratingWithState:objects:count:", &v286, v321, 16);
    if (!v85)
      goto LABEL_187;
    v86 = v85;
    v87 = *(_QWORD *)v287;
    while (1)
    {
      for (jj = 0; jj != v86; ++jj)
      {
        if (*(_QWORD *)v287 != v87)
          objc_enumerationMutation(v84);
        v89 = *(void **)(*((_QWORD *)&v286 + 1) + 8 * jj);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v90 = v89;
          if ((objc_msgSend(v90, "isEqualToString:", CFSTR("AUTOMOBILE")) & 1) != 0)
          {
            v91 = 0;
          }
          else if ((objc_msgSend(v90, "isEqualToString:", CFSTR("TRANSIT")) & 1) != 0)
          {
            v91 = 1;
          }
          else if ((objc_msgSend(v90, "isEqualToString:", CFSTR("WALKING")) & 1) != 0)
          {
            v91 = 2;
          }
          else if ((objc_msgSend(v90, "isEqualToString:", CFSTR("BICYCLE")) & 1) != 0)
          {
            v91 = 3;
          }
          else if ((objc_msgSend(v90, "isEqualToString:", CFSTR("UNKNOWN_TRANSPORT_TYPE")) & 1) != 0)
          {
            v91 = 4;
          }
          else if ((objc_msgSend(v90, "isEqualToString:", CFSTR("FERRY")) & 1) != 0)
          {
            v91 = 5;
          }
          else if (objc_msgSend(v90, "isEqualToString:", CFSTR("RIDESHARE")))
          {
            v91 = 6;
          }
          else
          {
            v91 = 0;
          }

        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            continue;
          v91 = objc_msgSend(v89, "intValue");
        }
        objc_msgSend(v6, "addSupportedTransportType:", v91, v252);
      }
      v86 = objc_msgSend(v84, "countByEnumeratingWithState:objects:count:", &v286, v321, 16);
      if (!v86)
      {
LABEL_187:

        v83 = v252;
        v5 = v253;
        break;
      }
    }
  }

  if (a3)
    v92 = CFSTR("serviceGap");
  else
    v92 = CFSTR("service_gap");
  objc_msgSend(v5, "objectForKeyedSubscript:", v92, v252);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v284 = 0u;
    v285 = 0u;
    v282 = 0u;
    v283 = 0u;
    v94 = v93;
    v95 = objc_msgSend(v94, "countByEnumeratingWithState:objects:count:", &v282, v320, 16);
    if (v95)
    {
      v96 = v95;
      v97 = *(_QWORD *)v283;
      do
      {
        for (kk = 0; kk != v96; ++kk)
        {
          if (*(_QWORD *)v283 != v97)
            objc_enumerationMutation(v94);
          v99 = *(_QWORD *)(*((_QWORD *)&v282 + 1) + 8 * kk);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v100 = [GEOTransitServiceGap alloc];
            if ((a3 & 1) != 0)
              v101 = -[GEOTransitServiceGap initWithJSON:](v100, "initWithJSON:", v99);
            else
              v101 = -[GEOTransitServiceGap initWithDictionary:](v100, "initWithDictionary:", v99);
            v102 = (void *)v101;
            objc_msgSend(v6, "addServiceGap:", v101);

          }
        }
        v96 = objc_msgSend(v94, "countByEnumeratingWithState:objects:count:", &v282, v320, 16);
      }
      while (v96);
    }

    v5 = v253;
  }

  if (a3)
    v103 = CFSTR("selectedRouteIndex");
  else
    v103 = CFSTR("selected_route_index");
  objc_msgSend(v5, "objectForKeyedSubscript:", v103);
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setSelectedRouteIndex:", objc_msgSend(v104, "unsignedIntValue"));

  if (a3)
    v105 = CFSTR("transitIncidentMessage");
  else
    v105 = CFSTR("transit_incident_message");
  objc_msgSend(v5, "objectForKeyedSubscript:", v105);
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v107 = [GEOPBTransitRoutingIncidentMessage alloc];
    if (v107)
      v108 = (void *)-[GEOPBTransitRoutingIncidentMessage _initWithDictionary:isJSON:]((uint64_t)v107, v106, a3);
    else
      v108 = 0;
    objc_msgSend(v6, "setTransitIncidentMessage:", v108);

  }
  if (a3)
    v109 = CFSTR("displayHints");
  else
    v109 = CFSTR("display_hints");
  objc_msgSend(v5, "objectForKeyedSubscript:", v109);
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v111 = [GEORouteDisplayHints alloc];
    if ((a3 & 1) != 0)
      v112 = -[GEORouteDisplayHints initWithJSON:](v111, "initWithJSON:", v110);
    else
      v112 = -[GEORouteDisplayHints initWithDictionary:](v111, "initWithDictionary:", v110);
    v113 = (void *)v112;
    objc_msgSend(v6, "setDisplayHints:", v112);

  }
  if (a3)
    v114 = CFSTR("styleAttributes");
  else
    v114 = CFSTR("style_attributes");
  objc_msgSend(v5, "objectForKeyedSubscript:", v114);
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v116 = [GEOStyleAttributes alloc];
    if ((a3 & 1) != 0)
      v117 = -[GEOStyleAttributes initWithJSON:](v116, "initWithJSON:", v115);
    else
      v117 = -[GEOStyleAttributes initWithDictionary:](v116, "initWithDictionary:", v115);
    v118 = (void *)v117;
    objc_msgSend(v6, "setStyleAttributes:", v117);

  }
  if (a3)
    v119 = CFSTR("sessionState");
  else
    v119 = CFSTR("session_state");
  objc_msgSend(v5, "objectForKeyedSubscript:", v119);
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v121 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v120, 0);
    objc_msgSend(v6, "setSessionState:", v121);

  }
  if (a3)
    v122 = CFSTR("failureAlert");
  else
    v122 = CFSTR("failure_alert");
  objc_msgSend(v5, "objectForKeyedSubscript:", v122);
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v124 = [GEOAlert alloc];
    if (v124)
      v125 = -[GEOAlert _initWithDictionary:isJSON:](v124, v123, a3);
    else
      v125 = 0;
    objc_msgSend(v6, "setFailureAlert:", v125);

  }
  if (a3)
    v126 = CFSTR("liveRouteSavingsSeconds");
  else
    v126 = CFSTR("live_route_savings_seconds");
  objc_msgSend(v5, "objectForKeyedSubscript:", v126);
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setLiveRouteSavingsSeconds:", objc_msgSend(v127, "intValue"));

  if (a3)
    v128 = CFSTR("datasetAbStatus");
  else
    v128 = CFSTR("dataset_ab_status");
  objc_msgSend(v5, "objectForKeyedSubscript:", v128);
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v130 = [GEOPDDatasetABStatus alloc];
    if ((a3 & 1) != 0)
      v131 = -[GEOPDDatasetABStatus initWithJSON:](v130, "initWithJSON:", v129);
    else
      v131 = -[GEOPDDatasetABStatus initWithDictionary:](v130, "initWithDictionary:", v129);
    v132 = (void *)v131;
    objc_msgSend(v6, "setDatasetAbStatus:", v131);

  }
  if (a3)
    v133 = CFSTR("trafficCamera");
  else
    v133 = CFSTR("traffic_camera");
  objc_msgSend(v5, "objectForKeyedSubscript:", v133);
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v280 = 0u;
    v281 = 0u;
    v278 = 0u;
    v279 = 0u;
    v135 = v134;
    v136 = objc_msgSend(v135, "countByEnumeratingWithState:objects:count:", &v278, v319, 16);
    if (v136)
    {
      v137 = v136;
      v138 = *(_QWORD *)v279;
      do
      {
        for (mm = 0; mm != v137; ++mm)
        {
          if (*(_QWORD *)v279 != v138)
            objc_enumerationMutation(v135);
          v140 = *(_QWORD *)(*((_QWORD *)&v278 + 1) + 8 * mm);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v141 = [GEOTrafficCamera alloc];
            if ((a3 & 1) != 0)
              v142 = -[GEOTrafficCamera initWithJSON:](v141, "initWithJSON:", v140);
            else
              v142 = -[GEOTrafficCamera initWithDictionary:](v141, "initWithDictionary:", v140);
            v143 = (void *)v142;
            objc_msgSend(v6, "addTrafficCamera:", v142);

          }
        }
        v137 = objc_msgSend(v135, "countByEnumeratingWithState:objects:count:", &v278, v319, 16);
      }
      while (v137);
    }

    v5 = v253;
  }

  if (a3)
    v144 = CFSTR("nonRecommendedRoutesCache");
  else
    v144 = CFSTR("non_recommended_routes_cache");
  objc_msgSend(v5, "objectForKeyedSubscript:", v144);
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v146 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v145, 0);
    objc_msgSend(v6, "setNonRecommendedRoutesCache:", v146);

  }
  if (a3)
    v147 = CFSTR("isOfflineResponse");
  else
    v147 = CFSTR("is_offline_response");
  objc_msgSend(v5, "objectForKeyedSubscript:", v147);
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setIsOfflineResponse:", objc_msgSend(v148, "BOOLValue"));

  if (a3)
    v149 = CFSTR("snapScoreMetadataDebug");
  else
    v149 = CFSTR("snap_score_metadata_debug");
  objc_msgSend(v5, "objectForKeyedSubscript:", v149);
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v151 = [GEOSnapScoreMetadata alloc];
    if (v151)
      v152 = -[GEOSnapScoreMetadata _initWithDictionary:isJSON:](v151, v150, a3);
    else
      v152 = 0;
    objc_msgSend(v6, "setSnapScoreMetadataDebug:", v152);

  }
  if (a3)
    v153 = CFSTR("hasKhSegments");
  else
    v153 = CFSTR("has_kh_segments");
  objc_msgSend(v5, "objectForKeyedSubscript:", v153);
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setHasKhSegments:", objc_msgSend(v154, "BOOLValue"));

  if (a3)
    v155 = CFSTR("debugData");
  else
    v155 = CFSTR("debug_data");
  objc_msgSend(v5, "objectForKeyedSubscript:", v155);
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v157 = (void *)objc_msgSend(v156, "copy");
    objc_msgSend(v6, "setDebugData:", v157);

  }
  if (a3)
    v158 = CFSTR("arrivalParameters");
  else
    v158 = CFSTR("arrival_parameters");
  objc_msgSend(v5, "objectForKeyedSubscript:", v158);
  v159 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v276 = 0u;
    v277 = 0u;
    v274 = 0u;
    v275 = 0u;
    v160 = v159;
    v161 = objc_msgSend(v160, "countByEnumeratingWithState:objects:count:", &v274, v318, 16);
    if (v161)
    {
      v162 = v161;
      v163 = *(_QWORD *)v275;
      do
      {
        for (nn = 0; nn != v162; ++nn)
        {
          if (*(_QWORD *)v275 != v163)
            objc_enumerationMutation(v160);
          v165 = *(_QWORD *)(*((_QWORD *)&v274 + 1) + 8 * nn);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v166 = [GEOArrivalParameters alloc];
            if ((a3 & 1) != 0)
              v167 = -[GEOArrivalParameters initWithJSON:](v166, "initWithJSON:", v165);
            else
              v167 = -[GEOArrivalParameters initWithDictionary:](v166, "initWithDictionary:", v165);
            v168 = (void *)v167;
            objc_msgSend(v6, "addArrivalParameters:", v167);

          }
        }
        v162 = objc_msgSend(v160, "countByEnumeratingWithState:objects:count:", &v274, v318, 16);
      }
      while (v162);
    }

    v5 = v253;
  }

  if (a3)
    v169 = CFSTR("trafficSignal");
  else
    v169 = CFSTR("traffic_signal");
  objc_msgSend(v5, "objectForKeyedSubscript:", v169);
  v170 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v272 = 0u;
    v273 = 0u;
    v270 = 0u;
    v271 = 0u;
    v171 = v170;
    v172 = objc_msgSend(v171, "countByEnumeratingWithState:objects:count:", &v270, v317, 16);
    if (v172)
    {
      v173 = v172;
      v174 = *(_QWORD *)v271;
      do
      {
        for (i1 = 0; i1 != v173; ++i1)
        {
          if (*(_QWORD *)v271 != v174)
            objc_enumerationMutation(v171);
          v176 = *(_QWORD *)(*((_QWORD *)&v270 + 1) + 8 * i1);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v177 = [GEOTrafficSignal alloc];
            if ((a3 & 1) != 0)
              v178 = -[GEOTrafficSignal initWithJSON:](v177, "initWithJSON:", v176);
            else
              v178 = -[GEOTrafficSignal initWithDictionary:](v177, "initWithDictionary:", v176);
            v179 = (void *)v178;
            objc_msgSend(v6, "addTrafficSignal:", v178);

          }
        }
        v173 = objc_msgSend(v171, "countByEnumeratingWithState:objects:count:", &v270, v317, 16);
      }
      while (v173);
    }

    v5 = v253;
  }

  if (a3)
    v180 = CFSTR("transitRouteUpdateConfiguration");
  else
    v180 = CFSTR("transit_route_update_configuration");
  objc_msgSend(v5, "objectForKeyedSubscript:", v180);
  v181 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v182 = [GEOTransitRouteUpdateConfiguration alloc];
    if ((a3 & 1) != 0)
      v183 = -[GEOTransitRouteUpdateConfiguration initWithJSON:](v182, "initWithJSON:", v181);
    else
      v183 = -[GEOTransitRouteUpdateConfiguration initWithDictionary:](v182, "initWithDictionary:", v181);
    v184 = (void *)v183;
    objc_msgSend(v6, "setTransitRouteUpdateConfiguration:", v183);

  }
  if (a3)
    v185 = CFSTR("transitPaymentMethodSuggestion");
  else
    v185 = CFSTR("transit_payment_method_suggestion");
  objc_msgSend(v5, "objectForKeyedSubscript:", v185);
  v186 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v268 = 0u;
    v269 = 0u;
    v266 = 0u;
    v267 = 0u;
    v187 = v186;
    v188 = objc_msgSend(v187, "countByEnumeratingWithState:objects:count:", &v266, v316, 16);
    if (v188)
    {
      v189 = v188;
      v190 = *(_QWORD *)v267;
      do
      {
        for (i2 = 0; i2 != v189; ++i2)
        {
          if (*(_QWORD *)v267 != v190)
            objc_enumerationMutation(v187);
          v192 = *(_QWORD *)(*((_QWORD *)&v266 + 1) + 8 * i2);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v193 = [GEOPBTransitPaymentMethodSuggestion alloc];
            if ((a3 & 1) != 0)
              v194 = -[GEOPBTransitPaymentMethodSuggestion initWithJSON:](v193, "initWithJSON:", v192);
            else
              v194 = -[GEOPBTransitPaymentMethodSuggestion initWithDictionary:](v193, "initWithDictionary:", v192);
            v195 = (void *)v194;
            objc_msgSend(v6, "addTransitPaymentMethodSuggestion:", v194);

          }
        }
        v189 = objc_msgSend(v187, "countByEnumeratingWithState:objects:count:", &v266, v316, 16);
      }
      while (v189);
    }

    v5 = v253;
  }

  if (a3)
    v196 = CFSTR("analyticData");
  else
    v196 = CFSTR("analytic_data");
  objc_msgSend(v5, "objectForKeyedSubscript:", v196);
  v197 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v198 = [GEODirectionsRequestResponseAnalyticsData alloc];
    if ((a3 & 1) != 0)
      v199 = -[GEODirectionsRequestResponseAnalyticsData initWithJSON:](v198, "initWithJSON:", v197);
    else
      v199 = -[GEODirectionsRequestResponseAnalyticsData initWithDictionary:](v198, "initWithDictionary:", v197);
    v200 = (void *)v199;
    objc_msgSend(v6, "setAnalyticData:", v199);

  }
  if (a3)
    v201 = CFSTR("advisoriesInfo");
  else
    v201 = CFSTR("advisories_info");
  objc_msgSend(v5, "objectForKeyedSubscript:", v201);
  v202 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v203 = [GEOAdvisoriesInfo alloc];
    if ((a3 & 1) != 0)
      v204 = -[GEOAdvisoriesInfo initWithJSON:](v203, "initWithJSON:", v202);
    else
      v204 = -[GEOAdvisoriesInfo initWithDictionary:](v203, "initWithDictionary:", v202);
    v205 = (void *)v204;
    objc_msgSend(v6, "setAdvisoriesInfo:", v204);

  }
  if (a3)
    v206 = CFSTR("responseAttributes");
  else
    v206 = CFSTR("response_attributes");
  objc_msgSend(v5, "objectForKeyedSubscript:", v206);
  v207 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v208 = [GEOCommonResponseAttributes alloc];
    if ((a3 & 1) != 0)
      v209 = -[GEOCommonResponseAttributes initWithJSON:](v208, "initWithJSON:", v207);
    else
      v209 = -[GEOCommonResponseAttributes initWithDictionary:](v208, "initWithDictionary:", v207);
    v210 = (void *)v209;
    objc_msgSend(v6, "setResponseAttributes:", v209);

  }
  if (a3)
    v211 = CFSTR("internalError");
  else
    v211 = CFSTR("internal_error");
  objc_msgSend(v5, "objectForKeyedSubscript:", v211);
  v212 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v264 = 0u;
    v265 = 0u;
    v262 = 0u;
    v263 = 0u;
    v213 = v212;
    v214 = objc_msgSend(v213, "countByEnumeratingWithState:objects:count:", &v262, v315, 16);
    if (v214)
    {
      v215 = v214;
      v216 = *(_QWORD *)v263;
      do
      {
        for (i3 = 0; i3 != v215; ++i3)
        {
          if (*(_QWORD *)v263 != v216)
            objc_enumerationMutation(v213);
          v218 = *(void **)(*((_QWORD *)&v262 + 1) + 8 * i3);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v219 = (void *)objc_msgSend(v218, "copy");
            objc_msgSend(v6, "addInternalError:", v219);

          }
        }
        v215 = objc_msgSend(v213, "countByEnumeratingWithState:objects:count:", &v262, v315, 16);
      }
      while (v215);
    }

  }
  if (a3)
    v220 = CFSTR("serviceVersion");
  else
    v220 = CFSTR("service_version");
  objc_msgSend(v5, "objectForKeyedSubscript:", v220);
  v221 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v222 = (void *)objc_msgSend(v221, "copy");
    objc_msgSend(v6, "setServiceVersion:", v222);

  }
  if (a3)
    v223 = CFSTR("dataVersion");
  else
    v223 = CFSTR("data_version");
  objc_msgSend(v5, "objectForKeyedSubscript:", v223);
  v224 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v225 = (void *)objc_msgSend(v224, "copy");
    objc_msgSend(v6, "setDataVersion:", v225);

  }
  if (a3)
    v226 = CFSTR("suggestedRoute");
  else
    v226 = CFSTR("suggested_route");
  objc_msgSend(v5, "objectForKeyedSubscript:", v226);
  v227 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v260 = 0u;
    v261 = 0u;
    v258 = 0u;
    v259 = 0u;
    v228 = v227;
    v229 = objc_msgSend(v228, "countByEnumeratingWithState:objects:count:", &v258, v314, 16);
    if (v229)
    {
      v230 = v229;
      v231 = *(_QWORD *)v259;
      do
      {
        for (i4 = 0; i4 != v230; ++i4)
        {
          if (*(_QWORD *)v259 != v231)
            objc_enumerationMutation(v228);
          v233 = *(_QWORD *)(*((_QWORD *)&v258 + 1) + 8 * i4);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v234 = [GEOTransitSuggestedRoute alloc];
            if ((a3 & 1) != 0)
              v235 = -[GEOTransitSuggestedRoute initWithJSON:](v234, "initWithJSON:", v233);
            else
              v235 = -[GEOTransitSuggestedRoute initWithDictionary:](v234, "initWithDictionary:", v233);
            v236 = (void *)v235;
            objc_msgSend(v6, "addSuggestedRoute:", v235);

          }
        }
        v230 = objc_msgSend(v228, "countByEnumeratingWithState:objects:count:", &v258, v314, 16);
      }
      while (v230);
    }

    v5 = v253;
  }

  if (a3)
    v237 = CFSTR("timepointUsed");
  else
    v237 = CFSTR("timepoint_used");
  objc_msgSend(v5, "objectForKeyedSubscript:", v237);
  v238 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v256 = 0uLL;
    v257 = 0;
    _GEOTimepointFromDictionaryRepresentation(v238, (uint64_t)&v256, a3);
    v254 = v256;
    v255 = v257;
    objc_msgSend(v6, "setTimepointUsed:", &v254);
  }

  if (a3)
    v239 = CFSTR("decoderData");
  else
    v239 = CFSTR("decoder_data");
  objc_msgSend(v5, "objectForKeyedSubscript:", v239);
  v240 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v241 = [GEOTransitDecoderData alloc];
    if ((a3 & 1) != 0)
      v242 = -[GEOTransitDecoderData initWithJSON:](v241, "initWithJSON:", v240);
    else
      v242 = -[GEOTransitDecoderData initWithDictionary:](v241, "initWithDictionary:", v240);
    v243 = (void *)v242;
    objc_msgSend(v6, "setDecoderData:", v242);

  }
  if (a3)
    v244 = CFSTR("transitDataVersion");
  else
    v244 = CFSTR("transit_data_version");
  objc_msgSend(v5, "objectForKeyedSubscript:", v244);
  v245 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v246 = (void *)objc_msgSend(v245, "copy");
    objc_msgSend(v6, "setTransitDataVersion:", v246);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("clientMetrics"));
  v247 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v248 = [GEOClientMetrics alloc];
    if ((a3 & 1) != 0)
      v249 = -[GEOClientMetrics initWithJSON:](v248, "initWithJSON:", v247);
    else
      v249 = -[GEOClientMetrics initWithDictionary:](v248, "initWithDictionary:", v247);
    v250 = (void *)v249;
    objc_msgSend(v6, "setClientMetrics:", v249);

  }
  a1 = v6;

LABEL_450:
  return a1;
}

- (GEODirectionsResponse)initWithJSON:(id)a3
{
  return (GEODirectionsResponse *)-[GEODirectionsResponse _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_715;
    else
      v8 = (int *)&readAll__nonRecursiveTag_716;
    GEODirectionsResponseReadSpecified((uint64_t)self, (uint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEODirectionsResponseCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEODirectionsResponseIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEODirectionsResponseReadAllFrom((uint64_t)self, a3, 0);
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
  $BB24C2ED400A1348441C88FA4FCB4848 flags;
  $BB24C2ED400A1348441C88FA4FCB4848 v19;
  NSMutableArray *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSMutableArray *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  NSMutableArray *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  NSMutableArray *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  NSMutableArray *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  NSMutableArray *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  NSMutableArray *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  NSMutableArray *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  NSMutableArray *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  PBDataReader *v59;
  void *v60;
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
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  uint64_t v89;
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
  _BYTE v110[128];
  _BYTE v111[128];
  _BYTE v112[128];
  _BYTE v113[128];
  _BYTE v114[128];
  _BYTE v115[128];
  _BYTE v116[128];
  _BYTE v117[128];
  _BYTE v118[128];
  _BYTE v119[128];
  _BYTE v120[128];
  _BYTE v121[128];
  uint64_t v122;

  v122 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEODirectionsResponseIsDirty((uint64_t)self) & 1) == 0)
  {
    v59 = self->_reader;
    objc_sync_enter(v59);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v60);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v59);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEODirectionsResponse readAll:](self, "readAll:", 0);
    PBDataWriterWriteInt32Field();
    v108 = 0u;
    v109 = 0u;
    v106 = 0u;
    v107 = 0u;
    v6 = self->_routes;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v106, v121, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v107;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v107 != v8)
            objc_enumerationMutation(v6);
          PBDataWriterWriteSubmessage();
          ++v9;
        }
        while (v7 != v9);
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v106, v121, 16);
      }
      while (v7);
    }

    v104 = 0u;
    v105 = 0u;
    v102 = 0u;
    v103 = 0u;
    v10 = self->_waypointRoutes;
    v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v102, v120, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v103;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v103 != v12)
            objc_enumerationMutation(v10);
          PBDataWriterWriteSubmessage();
          ++v13;
        }
        while (v11 != v13);
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v102, v120, 16);
      }
      while (v11);
    }

    v100 = 0u;
    v101 = 0u;
    v98 = 0u;
    v99 = 0u;
    v14 = self->_placeSearchResponses;
    v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v98, v119, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v99;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v99 != v16)
            objc_enumerationMutation(v14);
          PBDataWriterWriteSubmessage();
          ++v17;
        }
        while (v15 != v17);
        v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v98, v119, 16);
      }
      while (v15);
    }

    flags = self->_flags;
    if ((*(_BYTE *)&flags & 8) != 0)
    {
      PBDataWriterWriteInt32Field();
      flags = self->_flags;
    }
    if ((*(_WORD *)&flags & 0x100) != 0)
      PBDataWriterWriteBOOLField();
    if (self->_directionsResponseID)
      PBDataWriterWriteDataField();
    if (self->_tripId)
      PBDataWriterWriteSubmessage();
    v19 = self->_flags;
    if ((*(_BYTE *)&v19 & 0x40) != 0)
    {
      PBDataWriterWriteBOOLField();
      v19 = self->_flags;
    }
    if ((*(_BYTE *)&v19 & 2) != 0)
      PBDataWriterWriteInt32Field();
    v96 = 0u;
    v97 = 0u;
    v94 = 0u;
    v95 = 0u;
    v20 = self->_incidentsOnRoutes;
    v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v94, v118, 16);
    if (v21)
    {
      v22 = *(_QWORD *)v95;
      do
      {
        v23 = 0;
        do
        {
          if (*(_QWORD *)v95 != v22)
            objc_enumerationMutation(v20);
          PBDataWriterWriteSubmessage();
          ++v23;
        }
        while (v21 != v23);
        v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v94, v118, 16);
      }
      while (v21);
    }

    v92 = 0u;
    v93 = 0u;
    v90 = 0u;
    v91 = 0u;
    v24 = self->_incidentsOffRoutes;
    v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v90, v117, 16);
    if (v25)
    {
      v26 = *(_QWORD *)v91;
      do
      {
        v27 = 0;
        do
        {
          if (*(_QWORD *)v91 != v26)
            objc_enumerationMutation(v24);
          PBDataWriterWriteSubmessage();
          ++v27;
        }
        while (v25 != v27);
        v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v90, v117, 16);
      }
      while (v25);
    }

    if (self->_problemDetailsCount)
    {
      v28 = 0;
      v29 = 0;
      do
      {
        v89 = 0;
        PBDataWriterPlaceMark();
        GEOProblemDetailWriteTo((uint64_t)&self->_problemDetails[v28]);
        PBDataWriterRecallMark();
        ++v29;
        ++v28;
      }
      while (v29 < self->_problemDetailsCount);
    }
    if (self->_supportedTransportTypes.count)
    {
      v30 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        ++v30;
      }
      while (v30 < self->_supportedTransportTypes.count);
    }
    v87 = 0u;
    v88 = 0u;
    v85 = 0u;
    v86 = 0u;
    v31 = self->_serviceGaps;
    v32 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v85, v116, 16);
    if (v32)
    {
      v33 = *(_QWORD *)v86;
      do
      {
        v34 = 0;
        do
        {
          if (*(_QWORD *)v86 != v33)
            objc_enumerationMutation(v31);
          PBDataWriterWriteSubmessage();
          ++v34;
        }
        while (v32 != v34);
        v32 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v85, v116, 16);
      }
      while (v32);
    }

    if ((*(_BYTE *)&self->_flags & 0x10) != 0)
      PBDataWriterWriteUint32Field();
    if (self->_transitIncidentMessage)
      PBDataWriterWriteSubmessage();
    if (self->_displayHints)
      PBDataWriterWriteSubmessage();
    if (self->_styleAttributes)
      PBDataWriterWriteSubmessage();
    if (self->_sessionState)
      PBDataWriterWriteDataField();
    if (self->_failureAlert)
      PBDataWriterWriteSubmessage();
    if ((*(_BYTE *)&self->_flags & 4) != 0)
      PBDataWriterWriteInt32Field();
    if (self->_datasetAbStatus)
      PBDataWriterWriteSubmessage();
    v83 = 0u;
    v84 = 0u;
    v81 = 0u;
    v82 = 0u;
    v35 = self->_trafficCameras;
    v36 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v35, "countByEnumeratingWithState:objects:count:", &v81, v115, 16);
    if (v36)
    {
      v37 = *(_QWORD *)v82;
      do
      {
        v38 = 0;
        do
        {
          if (*(_QWORD *)v82 != v37)
            objc_enumerationMutation(v35);
          PBDataWriterWriteSubmessage();
          ++v38;
        }
        while (v36 != v38);
        v36 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v35, "countByEnumeratingWithState:objects:count:", &v81, v115, 16);
      }
      while (v36);
    }

    if (self->_nonRecommendedRoutesCache)
      PBDataWriterWriteDataField();
    if ((*(_BYTE *)&self->_flags & 0x80) != 0)
      PBDataWriterWriteBOOLField();
    if (self->_snapScoreMetadataDebug)
      PBDataWriterWriteSubmessage();
    if ((*(_BYTE *)&self->_flags & 0x20) != 0)
      PBDataWriterWriteBOOLField();
    if (self->_debugData)
      PBDataWriterWriteStringField();
    v79 = 0u;
    v80 = 0u;
    v77 = 0u;
    v78 = 0u;
    v39 = self->_arrivalParameters;
    v40 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v39, "countByEnumeratingWithState:objects:count:", &v77, v114, 16);
    if (v40)
    {
      v41 = *(_QWORD *)v78;
      do
      {
        v42 = 0;
        do
        {
          if (*(_QWORD *)v78 != v41)
            objc_enumerationMutation(v39);
          PBDataWriterWriteSubmessage();
          ++v42;
        }
        while (v40 != v42);
        v40 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v39, "countByEnumeratingWithState:objects:count:", &v77, v114, 16);
      }
      while (v40);
    }

    v75 = 0u;
    v76 = 0u;
    v73 = 0u;
    v74 = 0u;
    v43 = self->_trafficSignals;
    v44 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v43, "countByEnumeratingWithState:objects:count:", &v73, v113, 16);
    if (v44)
    {
      v45 = *(_QWORD *)v74;
      do
      {
        v46 = 0;
        do
        {
          if (*(_QWORD *)v74 != v45)
            objc_enumerationMutation(v43);
          PBDataWriterWriteSubmessage();
          ++v46;
        }
        while (v44 != v46);
        v44 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v43, "countByEnumeratingWithState:objects:count:", &v73, v113, 16);
      }
      while (v44);
    }

    if (self->_transitRouteUpdateConfiguration)
      PBDataWriterWriteSubmessage();
    v71 = 0u;
    v72 = 0u;
    v69 = 0u;
    v70 = 0u;
    v47 = self->_transitPaymentMethodSuggestions;
    v48 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v47, "countByEnumeratingWithState:objects:count:", &v69, v112, 16);
    if (v48)
    {
      v49 = *(_QWORD *)v70;
      do
      {
        v50 = 0;
        do
        {
          if (*(_QWORD *)v70 != v49)
            objc_enumerationMutation(v47);
          PBDataWriterWriteSubmessage();
          ++v50;
        }
        while (v48 != v50);
        v48 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v47, "countByEnumeratingWithState:objects:count:", &v69, v112, 16);
      }
      while (v48);
    }

    if (self->_analyticData)
      PBDataWriterWriteSubmessage();
    if (self->_advisoriesInfo)
      PBDataWriterWriteSubmessage();
    if (self->_responseAttributes)
      PBDataWriterWriteSubmessage();
    v67 = 0u;
    v68 = 0u;
    v65 = 0u;
    v66 = 0u;
    v51 = self->_internalErrors;
    v52 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v51, "countByEnumeratingWithState:objects:count:", &v65, v111, 16);
    if (v52)
    {
      v53 = *(_QWORD *)v66;
      do
      {
        v54 = 0;
        do
        {
          if (*(_QWORD *)v66 != v53)
            objc_enumerationMutation(v51);
          PBDataWriterWriteStringField();
          ++v54;
        }
        while (v52 != v54);
        v52 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v51, "countByEnumeratingWithState:objects:count:", &v65, v111, 16);
      }
      while (v52);
    }

    if (self->_serviceVersion)
      PBDataWriterWriteStringField();
    if (self->_dataVersion)
      PBDataWriterWriteStringField();
    v63 = 0u;
    v64 = 0u;
    v61 = 0u;
    v62 = 0u;
    v55 = self->_suggestedRoutes;
    v56 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v55, "countByEnumeratingWithState:objects:count:", &v61, v110, 16);
    if (v56)
    {
      v57 = *(_QWORD *)v62;
      do
      {
        v58 = 0;
        do
        {
          if (*(_QWORD *)v62 != v57)
            objc_enumerationMutation(v55);
          PBDataWriterWriteSubmessage();
          ++v58;
        }
        while (v56 != v58);
        v56 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v55, "countByEnumeratingWithState:objects:count:", &v61, v110, 16);
      }
      while (v56);
    }

    if ((*(_BYTE *)&self->_flags & 1) != 0)
    {
      v89 = 0;
      PBDataWriterPlaceMark();
      GEOTimepointWriteTo((uint64_t)&self->_timepointUsed);
      PBDataWriterRecallMark();
    }
    if (self->_decoderData)
      PBDataWriterWriteSubmessage();
    if (self->_transitDataVersion)
      PBDataWriterWriteStringField();
    if (self->_clientMetrics)
      PBDataWriterWriteSubmessage();
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v61);
  }

}

- (void)clearSensitiveFields:(unint64_t)a3
{
  GEODirectionsResponseClearSensitiveFields((uint64_t)self, a3, 1);
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
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
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
  _BYTE v80[128];
  _BYTE v81[128];
  _BYTE v82[128];
  _BYTE v83[128];
  _BYTE v84[128];
  _BYTE v85[128];
  _BYTE v86[128];
  _BYTE v87[128];
  _BYTE v88[128];
  uint64_t v89;

  v3 = a3;
  v89 = *MEMORY[0x1E0C80C00];
  -[GEODirectionsResponse _readAdvisoriesInfo]((uint64_t)self);
  if (-[GEOAdvisoriesInfo hasGreenTeaWithValue:](self->_advisoriesInfo, "hasGreenTeaWithValue:", v3))
    return 1;
  -[GEODirectionsResponse _readArrivalParameters]((uint64_t)self);
  v78 = 0u;
  v79 = 0u;
  v76 = 0u;
  v77 = 0u;
  v6 = self->_arrivalParameters;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v76, v88, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v77;
LABEL_5:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v77 != v9)
        objc_enumerationMutation(v6);
      if ((objc_msgSend(*(id *)(*((_QWORD *)&v76 + 1) + 8 * v10), "hasGreenTeaWithValue:", v3) & 1) != 0)
        goto LABEL_78;
      if (v8 == ++v10)
      {
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v76, v88, 16);
        if (v8)
          goto LABEL_5;
        break;
      }
    }
  }

  -[GEODirectionsResponse _readDecoderData]((uint64_t)self);
  if (!-[GEOTransitDecoderData hasGreenTeaWithValue:](self->_decoderData, "hasGreenTeaWithValue:", v3))
  {
    -[GEODirectionsResponse _readIncidentsOffRoutes]((uint64_t)self);
    v74 = 0u;
    v75 = 0u;
    v72 = 0u;
    v73 = 0u;
    v6 = self->_incidentsOffRoutes;
    v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v72, v87, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v73;
LABEL_14:
      v14 = 0;
      while (1)
      {
        if (*(_QWORD *)v73 != v13)
          objc_enumerationMutation(v6);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v72 + 1) + 8 * v14), "hasGreenTeaWithValue:", v3) & 1) != 0)
          goto LABEL_78;
        if (v12 == ++v14)
        {
          v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v72, v87, 16);
          if (v12)
            goto LABEL_14;
          break;
        }
      }
    }

    -[GEODirectionsResponse _readIncidentsOnRoutes]((uint64_t)self);
    v70 = 0u;
    v71 = 0u;
    v68 = 0u;
    v69 = 0u;
    v6 = self->_incidentsOnRoutes;
    v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v68, v86, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v69;
LABEL_22:
      v18 = 0;
      while (1)
      {
        if (*(_QWORD *)v69 != v17)
          objc_enumerationMutation(v6);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v68 + 1) + 8 * v18), "hasGreenTeaWithValue:", v3) & 1) != 0)
          goto LABEL_78;
        if (v16 == ++v18)
        {
          v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v68, v86, 16);
          if (v16)
            goto LABEL_22;
          break;
        }
      }
    }

    -[GEODirectionsResponse _readPlaceSearchResponses]((uint64_t)self);
    v66 = 0u;
    v67 = 0u;
    v64 = 0u;
    v65 = 0u;
    v6 = self->_placeSearchResponses;
    v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v64, v85, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v65;
LABEL_30:
      v22 = 0;
      while (1)
      {
        if (*(_QWORD *)v65 != v21)
          objc_enumerationMutation(v6);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v64 + 1) + 8 * v22), "hasGreenTeaWithValue:", v3) & 1) != 0)
          goto LABEL_78;
        if (v20 == ++v22)
        {
          v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v64, v85, 16);
          if (v20)
            goto LABEL_30;
          break;
        }
      }
    }

    -[GEODirectionsResponse _readRoutes]((uint64_t)self);
    v62 = 0u;
    v63 = 0u;
    v60 = 0u;
    v61 = 0u;
    v6 = self->_routes;
    v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v60, v84, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v61;
LABEL_38:
      v26 = 0;
      while (1)
      {
        if (*(_QWORD *)v61 != v25)
          objc_enumerationMutation(v6);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v60 + 1) + 8 * v26), "hasGreenTeaWithValue:", v3) & 1) != 0)
          goto LABEL_78;
        if (v24 == ++v26)
        {
          v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v60, v84, 16);
          if (v24)
            goto LABEL_38;
          break;
        }
      }
    }

    -[GEODirectionsResponse _readSnapScoreMetadataDebug]((uint64_t)self);
    if ((-[GEOSnapScoreMetadata hasGreenTeaWithValue:]((uint64_t)self->_snapScoreMetadataDebug, v3) & 1) == 0)
    {
      -[GEODirectionsResponse _readSuggestedRoutes]((uint64_t)self);
      v58 = 0u;
      v59 = 0u;
      v56 = 0u;
      v57 = 0u;
      v6 = self->_suggestedRoutes;
      v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v56, v83, 16);
      if (v27)
      {
        v28 = v27;
        v29 = *(_QWORD *)v57;
LABEL_47:
        v30 = 0;
        while (1)
        {
          if (*(_QWORD *)v57 != v29)
            objc_enumerationMutation(v6);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v56 + 1) + 8 * v30), "hasGreenTeaWithValue:", v3) & 1) != 0)
            break;
          if (v28 == ++v30)
          {
            v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v56, v83, 16);
            if (v28)
              goto LABEL_47;
            goto LABEL_53;
          }
        }
      }
      else
      {
LABEL_53:

        -[GEODirectionsResponse _readTrafficCameras]((uint64_t)self);
        v54 = 0u;
        v55 = 0u;
        v52 = 0u;
        v53 = 0u;
        v6 = self->_trafficCameras;
        v31 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v52, v82, 16);
        if (v31)
        {
          v32 = v31;
          v33 = *(_QWORD *)v53;
LABEL_55:
          v34 = 0;
          while (1)
          {
            if (*(_QWORD *)v53 != v33)
              objc_enumerationMutation(v6);
            if ((objc_msgSend(*(id *)(*((_QWORD *)&v52 + 1) + 8 * v34), "hasGreenTeaWithValue:", v3) & 1) != 0)
              break;
            if (v32 == ++v34)
            {
              v32 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v52, v82, 16);
              if (v32)
                goto LABEL_55;
              goto LABEL_61;
            }
          }
        }
        else
        {
LABEL_61:

          -[GEODirectionsResponse _readTrafficSignals]((uint64_t)self);
          v50 = 0u;
          v51 = 0u;
          v48 = 0u;
          v49 = 0u;
          v6 = self->_trafficSignals;
          v35 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v48, v81, 16);
          if (v35)
          {
            v36 = v35;
            v37 = *(_QWORD *)v49;
LABEL_63:
            v38 = 0;
            while (1)
            {
              if (*(_QWORD *)v49 != v37)
                objc_enumerationMutation(v6);
              if ((objc_msgSend(*(id *)(*((_QWORD *)&v48 + 1) + 8 * v38), "hasGreenTeaWithValue:", v3) & 1) != 0)
                break;
              if (v36 == ++v38)
              {
                v36 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v48, v81, 16);
                if (v36)
                  goto LABEL_63;
                goto LABEL_69;
              }
            }
          }
          else
          {
LABEL_69:

            -[GEODirectionsResponse _readWaypointRoutes]((uint64_t)self);
            v46 = 0u;
            v47 = 0u;
            v44 = 0u;
            v45 = 0u;
            v6 = self->_waypointRoutes;
            v39 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v44, v80, 16);
            if (!v39)
            {
LABEL_77:
              v5 = 0;
LABEL_79:

              return v5;
            }
            v40 = v39;
            v41 = *(_QWORD *)v45;
LABEL_71:
            v42 = 0;
            while (1)
            {
              if (*(_QWORD *)v45 != v41)
                objc_enumerationMutation(v6);
              if ((objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * v42), "hasGreenTeaWithValue:", v3, (_QWORD)v44) & 1) != 0)
                break;
              if (v40 == ++v42)
              {
                v40 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v44, v80, 16);
                if (v40)
                  goto LABEL_71;
                goto LABEL_77;
              }
            }
          }
        }
      }
LABEL_78:
      v5 = 1;
      goto LABEL_79;
    }
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
  $BB24C2ED400A1348441C88FA4FCB4848 flags;
  char *v17;
  $BB24C2ED400A1348441C88FA4FCB4848 v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t m;
  void *v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t n;
  void *v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t ii;
  uint64_t v30;
  unsigned int v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t jj;
  unint64_t v35;
  unint64_t v36;
  uint64_t kk;
  void *v38;
  char *v39;
  unint64_t v40;
  unint64_t v41;
  uint64_t mm;
  void *v43;
  char *v44;
  unint64_t v45;
  unint64_t v46;
  uint64_t nn;
  void *v48;
  unint64_t v49;
  unint64_t v50;
  uint64_t i1;
  void *v52;
  unint64_t v53;
  unint64_t v54;
  uint64_t i2;
  void *v56;
  unint64_t v57;
  unint64_t v58;
  uint64_t i3;
  void *v60;
  unint64_t v61;
  unint64_t v62;
  uint64_t i4;
  void *v64;
  void *v65;
  uint64_t v66;
  char *v67;

  v67 = (char *)a3;
  -[GEODirectionsResponse readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong((id *)v67 + 1, self->_reader);
  *((_DWORD *)v67 + 88) = self->_readerMarkPos;
  *((_DWORD *)v67 + 89) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  *((_DWORD *)v67 + 95) = self->_status;
  if (-[GEODirectionsResponse routesCount](self, "routesCount"))
  {
    objc_msgSend(v67, "clearRoutes");
    v4 = -[GEODirectionsResponse routesCount](self, "routesCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[GEODirectionsResponse routeAtIndex:](self, "routeAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "addRoute:", v7);

      }
    }
  }
  if (-[GEODirectionsResponse waypointRoutesCount](self, "waypointRoutesCount"))
  {
    objc_msgSend(v67, "clearWaypointRoutes");
    v8 = -[GEODirectionsResponse waypointRoutesCount](self, "waypointRoutesCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
      {
        -[GEODirectionsResponse waypointRouteAtIndex:](self, "waypointRouteAtIndex:", j);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "addWaypointRoute:", v11);

      }
    }
  }
  if (-[GEODirectionsResponse placeSearchResponsesCount](self, "placeSearchResponsesCount"))
  {
    objc_msgSend(v67, "clearPlaceSearchResponses");
    v12 = -[GEODirectionsResponse placeSearchResponsesCount](self, "placeSearchResponsesCount");
    if (v12)
    {
      v13 = v12;
      for (k = 0; k != v13; ++k)
      {
        -[GEODirectionsResponse placeSearchResponseAtIndex:](self, "placeSearchResponseAtIndex:", k);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "addPlaceSearchResponse:", v15);

      }
    }
  }
  flags = self->_flags;
  v17 = v67;
  if ((*(_BYTE *)&flags & 8) != 0)
  {
    *((_DWORD *)v67 + 93) = self->_localDistanceUnits;
    *(_QWORD *)(v67 + 388) |= 8uLL;
    flags = self->_flags;
  }
  if ((*(_WORD *)&flags & 0x100) != 0)
  {
    v67[387] = self->_routeDeviatesFromOriginal;
    *(_QWORD *)(v67 + 388) |= 0x100uLL;
  }
  if (self->_directionsResponseID)
  {
    objc_msgSend(v67, "setDirectionsResponseID:");
    v17 = v67;
  }
  if (self->_tripId)
  {
    objc_msgSend(v67, "setTripId:");
    v17 = v67;
  }
  v18 = self->_flags;
  if ((*(_BYTE *)&v18 & 0x40) != 0)
  {
    v17[385] = self->_isNavigable;
    *(_QWORD *)(v17 + 388) |= 0x40uLL;
    v18 = self->_flags;
  }
  if ((*(_BYTE *)&v18 & 2) != 0)
  {
    *((_DWORD *)v17 + 91) = self->_instructionSignFillColor;
    *(_QWORD *)(v17 + 388) |= 2uLL;
  }
  if (-[GEODirectionsResponse incidentsOnRoutesCount](self, "incidentsOnRoutesCount"))
  {
    objc_msgSend(v67, "clearIncidentsOnRoutes");
    v19 = -[GEODirectionsResponse incidentsOnRoutesCount](self, "incidentsOnRoutesCount");
    if (v19)
    {
      v20 = v19;
      for (m = 0; m != v20; ++m)
      {
        -[GEODirectionsResponse incidentsOnRoutesAtIndex:](self, "incidentsOnRoutesAtIndex:", m);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "addIncidentsOnRoutes:", v22);

      }
    }
  }
  if (-[GEODirectionsResponse incidentsOffRoutesCount](self, "incidentsOffRoutesCount"))
  {
    objc_msgSend(v67, "clearIncidentsOffRoutes");
    v23 = -[GEODirectionsResponse incidentsOffRoutesCount](self, "incidentsOffRoutesCount");
    if (v23)
    {
      v24 = v23;
      for (n = 0; n != v24; ++n)
      {
        -[GEODirectionsResponse incidentsOffRoutesAtIndex:](self, "incidentsOffRoutesAtIndex:", n);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "addIncidentsOffRoutes:", v26);

      }
    }
  }
  if (-[GEODirectionsResponse problemDetailsCount](self, "problemDetailsCount"))
  {
    objc_msgSend(v67, "clearProblemDetails");
    v27 = -[GEODirectionsResponse problemDetailsCount](self, "problemDetailsCount");
    if (v27)
    {
      v28 = v27;
      for (ii = 0; ii != v28; ++ii)
      {
        v30 = -[GEODirectionsResponse problemDetailAtIndex:](self, "problemDetailAtIndex:", ii);
        objc_msgSend(v67, "addProblemDetail:", v30, v31);
      }
    }
  }
  if (-[GEODirectionsResponse supportedTransportTypesCount](self, "supportedTransportTypesCount"))
  {
    objc_msgSend(v67, "clearSupportedTransportTypes");
    v32 = -[GEODirectionsResponse supportedTransportTypesCount](self, "supportedTransportTypesCount");
    if (v32)
    {
      v33 = v32;
      for (jj = 0; jj != v33; ++jj)
        objc_msgSend(v67, "addSupportedTransportType:", -[GEODirectionsResponse supportedTransportTypeAtIndex:](self, "supportedTransportTypeAtIndex:", jj));
    }
  }
  if (-[GEODirectionsResponse serviceGapsCount](self, "serviceGapsCount"))
  {
    objc_msgSend(v67, "clearServiceGaps");
    v35 = -[GEODirectionsResponse serviceGapsCount](self, "serviceGapsCount");
    if (v35)
    {
      v36 = v35;
      for (kk = 0; kk != v36; ++kk)
      {
        -[GEODirectionsResponse serviceGapAtIndex:](self, "serviceGapAtIndex:", kk);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "addServiceGap:", v38);

      }
    }
  }
  v39 = v67;
  if ((*(_BYTE *)&self->_flags & 0x10) != 0)
  {
    *((_DWORD *)v67 + 94) = self->_selectedRouteIndex;
    *(_QWORD *)(v67 + 388) |= 0x10uLL;
  }
  if (self->_transitIncidentMessage)
  {
    objc_msgSend(v67, "setTransitIncidentMessage:");
    v39 = v67;
  }
  if (self->_displayHints)
  {
    objc_msgSend(v67, "setDisplayHints:");
    v39 = v67;
  }
  if (self->_styleAttributes)
  {
    objc_msgSend(v67, "setStyleAttributes:");
    v39 = v67;
  }
  if (self->_sessionState)
  {
    objc_msgSend(v67, "setSessionState:");
    v39 = v67;
  }
  if (self->_failureAlert)
  {
    objc_msgSend(v67, "setFailureAlert:");
    v39 = v67;
  }
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    *((_DWORD *)v39 + 92) = self->_liveRouteSavingsSeconds;
    *(_QWORD *)(v39 + 388) |= 4uLL;
  }
  if (self->_datasetAbStatus)
    objc_msgSend(v67, "setDatasetAbStatus:");
  if (-[GEODirectionsResponse trafficCamerasCount](self, "trafficCamerasCount"))
  {
    objc_msgSend(v67, "clearTrafficCameras");
    v40 = -[GEODirectionsResponse trafficCamerasCount](self, "trafficCamerasCount");
    if (v40)
    {
      v41 = v40;
      for (mm = 0; mm != v41; ++mm)
      {
        -[GEODirectionsResponse trafficCameraAtIndex:](self, "trafficCameraAtIndex:", mm);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "addTrafficCamera:", v43);

      }
    }
  }
  if (self->_nonRecommendedRoutesCache)
    objc_msgSend(v67, "setNonRecommendedRoutesCache:");
  v44 = v67;
  if ((*(_BYTE *)&self->_flags & 0x80) != 0)
  {
    v67[386] = self->_isOfflineResponse;
    *(_QWORD *)(v67 + 388) |= 0x80uLL;
  }
  if (self->_snapScoreMetadataDebug)
  {
    objc_msgSend(v67, "setSnapScoreMetadataDebug:");
    v44 = v67;
  }
  if ((*(_BYTE *)&self->_flags & 0x20) != 0)
  {
    v44[384] = self->_hasKhSegments;
    *(_QWORD *)(v44 + 388) |= 0x20uLL;
  }
  if (self->_debugData)
    objc_msgSend(v67, "setDebugData:");
  if (-[GEODirectionsResponse arrivalParametersCount](self, "arrivalParametersCount"))
  {
    objc_msgSend(v67, "clearArrivalParameters");
    v45 = -[GEODirectionsResponse arrivalParametersCount](self, "arrivalParametersCount");
    if (v45)
    {
      v46 = v45;
      for (nn = 0; nn != v46; ++nn)
      {
        -[GEODirectionsResponse arrivalParametersAtIndex:](self, "arrivalParametersAtIndex:", nn);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "addArrivalParameters:", v48);

      }
    }
  }
  if (-[GEODirectionsResponse trafficSignalsCount](self, "trafficSignalsCount"))
  {
    objc_msgSend(v67, "clearTrafficSignals");
    v49 = -[GEODirectionsResponse trafficSignalsCount](self, "trafficSignalsCount");
    if (v49)
    {
      v50 = v49;
      for (i1 = 0; i1 != v50; ++i1)
      {
        -[GEODirectionsResponse trafficSignalAtIndex:](self, "trafficSignalAtIndex:", i1);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "addTrafficSignal:", v52);

      }
    }
  }
  if (self->_transitRouteUpdateConfiguration)
    objc_msgSend(v67, "setTransitRouteUpdateConfiguration:");
  if (-[GEODirectionsResponse transitPaymentMethodSuggestionsCount](self, "transitPaymentMethodSuggestionsCount"))
  {
    objc_msgSend(v67, "clearTransitPaymentMethodSuggestions");
    v53 = -[GEODirectionsResponse transitPaymentMethodSuggestionsCount](self, "transitPaymentMethodSuggestionsCount");
    if (v53)
    {
      v54 = v53;
      for (i2 = 0; i2 != v54; ++i2)
      {
        -[GEODirectionsResponse transitPaymentMethodSuggestionAtIndex:](self, "transitPaymentMethodSuggestionAtIndex:", i2);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "addTransitPaymentMethodSuggestion:", v56);

      }
    }
  }
  if (self->_analyticData)
    objc_msgSend(v67, "setAnalyticData:");
  if (self->_advisoriesInfo)
    objc_msgSend(v67, "setAdvisoriesInfo:");
  if (self->_responseAttributes)
    objc_msgSend(v67, "setResponseAttributes:");
  if (-[GEODirectionsResponse internalErrorsCount](self, "internalErrorsCount"))
  {
    objc_msgSend(v67, "clearInternalErrors");
    v57 = -[GEODirectionsResponse internalErrorsCount](self, "internalErrorsCount");
    if (v57)
    {
      v58 = v57;
      for (i3 = 0; i3 != v58; ++i3)
      {
        -[GEODirectionsResponse internalErrorAtIndex:](self, "internalErrorAtIndex:", i3);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "addInternalError:", v60);

      }
    }
  }
  if (self->_serviceVersion)
    objc_msgSend(v67, "setServiceVersion:");
  if (self->_dataVersion)
    objc_msgSend(v67, "setDataVersion:");
  if (-[GEODirectionsResponse suggestedRoutesCount](self, "suggestedRoutesCount"))
  {
    objc_msgSend(v67, "clearSuggestedRoutes");
    v61 = -[GEODirectionsResponse suggestedRoutesCount](self, "suggestedRoutesCount");
    if (v61)
    {
      v62 = v61;
      for (i4 = 0; i4 != v62; ++i4)
      {
        -[GEODirectionsResponse suggestedRouteAtIndex:](self, "suggestedRouteAtIndex:", i4);
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "addSuggestedRoute:", v64);

      }
    }
  }
  v65 = v67;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    v66 = *(_QWORD *)&self->_timepointUsed._type;
    *(_OWORD *)(v67 + 72) = *(_OWORD *)&self->_timepointUsed._currentUserTime;
    *((_QWORD *)v67 + 11) = v66;
    *(_QWORD *)(v67 + 388) |= 1uLL;
  }
  if (self->_decoderData)
  {
    objc_msgSend(v67, "setDecoderData:");
    v65 = v67;
  }
  if (self->_transitDataVersion)
  {
    objc_msgSend(v67, "setTransitDataVersion:");
    v65 = v67;
  }
  if (self->_clientMetrics)
  {
    objc_msgSend(v67, "setClientMetrics:");
    v65 = v67;
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
  $BB24C2ED400A1348441C88FA4FCB4848 flags;
  uint64_t v25;
  void *v26;
  id v27;
  void *v28;
  $BB24C2ED400A1348441C88FA4FCB4848 v29;
  NSMutableArray *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t m;
  void *v34;
  NSMutableArray *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t n;
  void *v39;
  unint64_t problemDetailsCount;
  NSMutableArray *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t ii;
  void *v45;
  id v46;
  void *v47;
  id v48;
  void *v49;
  id v50;
  void *v51;
  uint64_t v52;
  void *v53;
  id v54;
  void *v55;
  id v56;
  void *v57;
  NSMutableArray *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t jj;
  void *v62;
  uint64_t v63;
  void *v64;
  id v65;
  void *v66;
  uint64_t v67;
  void *v68;
  NSMutableArray *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t kk;
  void *v73;
  NSMutableArray *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t mm;
  void *v78;
  id v79;
  void *v80;
  NSMutableArray *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t nn;
  void *v85;
  id v86;
  void *v87;
  id v88;
  void *v89;
  id v90;
  void *v91;
  NSMutableArray *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t i1;
  void *v96;
  uint64_t v97;
  void *v98;
  uint64_t v99;
  void *v100;
  NSMutableArray *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t i2;
  void *v105;
  uint64_t v106;
  id v107;
  void *v108;
  uint64_t v109;
  void *v110;
  id v111;
  void *v112;
  PBUnknownFields *v113;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
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
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  _BYTE v163[128];
  _BYTE v164[128];
  _BYTE v165[128];
  _BYTE v166[128];
  _BYTE v167[128];
  _BYTE v168[128];
  _BYTE v169[128];
  _BYTE v170[128];
  _BYTE v171[128];
  _BYTE v172[128];
  _BYTE v173[128];
  _BYTE v174[128];
  uint64_t v175;

  v175 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*((_BYTE *)&self->_flags + 5) & 0x10) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEODirectionsResponseReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_110;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEODirectionsResponse readAll:](self, "readAll:", 0);
  *(_DWORD *)(v5 + 380) = self->_status;
  v161 = 0u;
  v162 = 0u;
  v159 = 0u;
  v160 = 0u;
  v9 = self->_routes;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v159, v174, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v160;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v160 != v11)
          objc_enumerationMutation(v9);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v159 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addRoute:", v13);

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v159, v174, 16);
    }
    while (v10);
  }

  v157 = 0u;
  v158 = 0u;
  v155 = 0u;
  v156 = 0u;
  v14 = self->_waypointRoutes;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v155, v173, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v156;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v156 != v16)
          objc_enumerationMutation(v14);
        v18 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v155 + 1) + 8 * j), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addWaypointRoute:", v18);

      }
      v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v155, v173, 16);
    }
    while (v15);
  }

  v153 = 0u;
  v154 = 0u;
  v151 = 0u;
  v152 = 0u;
  v19 = self->_placeSearchResponses;
  v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v151, v172, 16);
  if (v20)
  {
    v21 = *(_QWORD *)v152;
    do
    {
      for (k = 0; k != v20; ++k)
      {
        if (*(_QWORD *)v152 != v21)
          objc_enumerationMutation(v19);
        v23 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v151 + 1) + 8 * k), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addPlaceSearchResponse:", v23);

      }
      v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v151, v172, 16);
    }
    while (v20);
  }

  flags = self->_flags;
  if ((*(_BYTE *)&flags & 8) != 0)
  {
    *(_DWORD *)(v5 + 372) = self->_localDistanceUnits;
    *(_QWORD *)(v5 + 388) |= 8uLL;
    flags = self->_flags;
  }
  if ((*(_WORD *)&flags & 0x100) != 0)
  {
    *(_BYTE *)(v5 + 387) = self->_routeDeviatesFromOriginal;
    *(_QWORD *)(v5 + 388) |= 0x100uLL;
  }
  v25 = -[NSData copyWithZone:](self->_directionsResponseID, "copyWithZone:", a3);
  v26 = *(void **)(v5 + 160);
  *(_QWORD *)(v5 + 160) = v25;

  v27 = -[GEOUUID copyWithZone:](self->_tripId, "copyWithZone:", a3);
  v28 = *(void **)(v5 + 336);
  *(_QWORD *)(v5 + 336) = v27;

  v29 = self->_flags;
  if ((*(_BYTE *)&v29 & 0x40) != 0)
  {
    *(_BYTE *)(v5 + 385) = self->_isNavigable;
    *(_QWORD *)(v5 + 388) |= 0x40uLL;
    v29 = self->_flags;
  }
  if ((*(_BYTE *)&v29 & 2) != 0)
  {
    *(_DWORD *)(v5 + 364) = self->_instructionSignFillColor;
    *(_QWORD *)(v5 + 388) |= 2uLL;
  }
  v149 = 0u;
  v150 = 0u;
  v147 = 0u;
  v148 = 0u;
  v30 = self->_incidentsOnRoutes;
  v31 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v147, v171, 16);
  if (v31)
  {
    v32 = *(_QWORD *)v148;
    do
    {
      for (m = 0; m != v31; ++m)
      {
        if (*(_QWORD *)v148 != v32)
          objc_enumerationMutation(v30);
        v34 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v147 + 1) + 8 * m), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addIncidentsOnRoutes:", v34);

      }
      v31 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v147, v171, 16);
    }
    while (v31);
  }

  v145 = 0u;
  v146 = 0u;
  v143 = 0u;
  v144 = 0u;
  v35 = self->_incidentsOffRoutes;
  v36 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v35, "countByEnumeratingWithState:objects:count:", &v143, v170, 16);
  if (v36)
  {
    v37 = *(_QWORD *)v144;
    do
    {
      for (n = 0; n != v36; ++n)
      {
        if (*(_QWORD *)v144 != v37)
          objc_enumerationMutation(v35);
        v39 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v143 + 1) + 8 * n), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addIncidentsOffRoutes:", v39);

      }
      v36 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v35, "countByEnumeratingWithState:objects:count:", &v143, v170, 16);
    }
    while (v36);
  }

  problemDetailsCount = self->_problemDetailsCount;
  if (problemDetailsCount)
  {
    -[GEODirectionsResponse _reserveProblemDetails:](v5, problemDetailsCount);
    memcpy(*(void **)(v5 + 24), self->_problemDetails, 12 * self->_problemDetailsCount);
    *(_QWORD *)(v5 + 32) = self->_problemDetailsCount;
  }
  PBRepeatedInt32Copy();
  v141 = 0u;
  v142 = 0u;
  v139 = 0u;
  v140 = 0u;
  v41 = self->_serviceGaps;
  v42 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v41, "countByEnumeratingWithState:objects:count:", &v139, v169, 16);
  if (v42)
  {
    v43 = *(_QWORD *)v140;
    do
    {
      for (ii = 0; ii != v42; ++ii)
      {
        if (*(_QWORD *)v140 != v43)
          objc_enumerationMutation(v41);
        v45 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v139 + 1) + 8 * ii), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addServiceGap:", v45);

      }
      v42 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v41, "countByEnumeratingWithState:objects:count:", &v139, v169, 16);
    }
    while (v42);
  }

  if ((*(_BYTE *)&self->_flags & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 376) = self->_selectedRouteIndex;
    *(_QWORD *)(v5 + 388) |= 0x10uLL;
  }
  v46 = -[GEOPBTransitRoutingIncidentMessage copyWithZone:](self->_transitIncidentMessage, "copyWithZone:", a3);
  v47 = *(void **)(v5 + 312);
  *(_QWORD *)(v5 + 312) = v46;

  v48 = -[GEORouteDisplayHints copyWithZone:](self->_displayHints, "copyWithZone:", a3);
  v49 = *(void **)(v5 + 168);
  *(_QWORD *)(v5 + 168) = v48;

  v50 = -[GEOStyleAttributes copyWithZone:](self->_styleAttributes, "copyWithZone:", a3);
  v51 = *(void **)(v5 + 272);
  *(_QWORD *)(v5 + 272) = v50;

  v52 = -[NSData copyWithZone:](self->_sessionState, "copyWithZone:", a3);
  v53 = *(void **)(v5 + 256);
  *(_QWORD *)(v5 + 256) = v52;

  v54 = -[GEOAlert copyWithZone:](self->_failureAlert, "copyWithZone:", a3);
  v55 = *(void **)(v5 + 176);
  *(_QWORD *)(v5 + 176) = v54;

  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    *(_DWORD *)(v5 + 368) = self->_liveRouteSavingsSeconds;
    *(_QWORD *)(v5 + 388) |= 4uLL;
  }
  v56 = -[GEOPDDatasetABStatus copyWithZone:](self->_datasetAbStatus, "copyWithZone:", a3);
  v57 = *(void **)(v5 + 136);
  *(_QWORD *)(v5 + 136) = v56;

  v137 = 0u;
  v138 = 0u;
  v135 = 0u;
  v136 = 0u;
  v58 = self->_trafficCameras;
  v59 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v58, "countByEnumeratingWithState:objects:count:", &v135, v168, 16);
  if (v59)
  {
    v60 = *(_QWORD *)v136;
    do
    {
      for (jj = 0; jj != v59; ++jj)
      {
        if (*(_QWORD *)v136 != v60)
          objc_enumerationMutation(v58);
        v62 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v135 + 1) + 8 * jj), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addTrafficCamera:", v62);

      }
      v59 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v58, "countByEnumeratingWithState:objects:count:", &v135, v168, 16);
    }
    while (v59);
  }

  v63 = -[NSData copyWithZone:](self->_nonRecommendedRoutesCache, "copyWithZone:", a3);
  v64 = *(void **)(v5 + 208);
  *(_QWORD *)(v5 + 208) = v63;

  if ((*(_BYTE *)&self->_flags & 0x80) != 0)
  {
    *(_BYTE *)(v5 + 386) = self->_isOfflineResponse;
    *(_QWORD *)(v5 + 388) |= 0x80uLL;
  }
  v65 = -[GEOSnapScoreMetadata copyWithZone:](self->_snapScoreMetadataDebug, "copyWithZone:", a3);
  v66 = *(void **)(v5 + 264);
  *(_QWORD *)(v5 + 264) = v65;

  if ((*(_BYTE *)&self->_flags & 0x20) != 0)
  {
    *(_BYTE *)(v5 + 384) = self->_hasKhSegments;
    *(_QWORD *)(v5 + 388) |= 0x20uLL;
  }
  v67 = -[NSString copyWithZone:](self->_debugData, "copyWithZone:", a3);
  v68 = *(void **)(v5 + 144);
  *(_QWORD *)(v5 + 144) = v67;

  v133 = 0u;
  v134 = 0u;
  v131 = 0u;
  v132 = 0u;
  v69 = self->_arrivalParameters;
  v70 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v69, "countByEnumeratingWithState:objects:count:", &v131, v167, 16);
  if (v70)
  {
    v71 = *(_QWORD *)v132;
    do
    {
      for (kk = 0; kk != v70; ++kk)
      {
        if (*(_QWORD *)v132 != v71)
          objc_enumerationMutation(v69);
        v73 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v131 + 1) + 8 * kk), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addArrivalParameters:", v73);

      }
      v70 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v69, "countByEnumeratingWithState:objects:count:", &v131, v167, 16);
    }
    while (v70);
  }

  v129 = 0u;
  v130 = 0u;
  v127 = 0u;
  v128 = 0u;
  v74 = self->_trafficSignals;
  v75 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v74, "countByEnumeratingWithState:objects:count:", &v127, v166, 16);
  if (v75)
  {
    v76 = *(_QWORD *)v128;
    do
    {
      for (mm = 0; mm != v75; ++mm)
      {
        if (*(_QWORD *)v128 != v76)
          objc_enumerationMutation(v74);
        v78 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v127 + 1) + 8 * mm), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addTrafficSignal:", v78);

      }
      v75 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v74, "countByEnumeratingWithState:objects:count:", &v127, v166, 16);
    }
    while (v75);
  }

  v79 = -[GEOTransitRouteUpdateConfiguration copyWithZone:](self->_transitRouteUpdateConfiguration, "copyWithZone:", a3);
  v80 = *(void **)(v5 + 328);
  *(_QWORD *)(v5 + 328) = v79;

  v125 = 0u;
  v126 = 0u;
  v123 = 0u;
  v124 = 0u;
  v81 = self->_transitPaymentMethodSuggestions;
  v82 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v81, "countByEnumeratingWithState:objects:count:", &v123, v165, 16);
  if (v82)
  {
    v83 = *(_QWORD *)v124;
    do
    {
      for (nn = 0; nn != v82; ++nn)
      {
        if (*(_QWORD *)v124 != v83)
          objc_enumerationMutation(v81);
        v85 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v123 + 1) + 8 * nn), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addTransitPaymentMethodSuggestion:", v85);

      }
      v82 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v81, "countByEnumeratingWithState:objects:count:", &v123, v165, 16);
    }
    while (v82);
  }

  v86 = -[GEODirectionsRequestResponseAnalyticsData copyWithZone:](self->_analyticData, "copyWithZone:", a3);
  v87 = *(void **)(v5 + 104);
  *(_QWORD *)(v5 + 104) = v86;

  v88 = -[GEOAdvisoriesInfo copyWithZone:](self->_advisoriesInfo, "copyWithZone:", a3);
  v89 = *(void **)(v5 + 96);
  *(_QWORD *)(v5 + 96) = v88;

  v90 = -[GEOCommonResponseAttributes copyWithZone:](self->_responseAttributes, "copyWithZone:", a3);
  v91 = *(void **)(v5 + 224);
  *(_QWORD *)(v5 + 224) = v90;

  v121 = 0u;
  v122 = 0u;
  v119 = 0u;
  v120 = 0u;
  v92 = self->_internalErrors;
  v93 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v92, "countByEnumeratingWithState:objects:count:", &v119, v164, 16);
  if (v93)
  {
    v94 = *(_QWORD *)v120;
    do
    {
      for (i1 = 0; i1 != v93; ++i1)
      {
        if (*(_QWORD *)v120 != v94)
          objc_enumerationMutation(v92);
        v96 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v119 + 1) + 8 * i1), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addInternalError:", v96);

      }
      v93 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v92, "countByEnumeratingWithState:objects:count:", &v119, v164, 16);
    }
    while (v93);
  }

  v97 = -[NSString copyWithZone:](self->_serviceVersion, "copyWithZone:", a3);
  v98 = *(void **)(v5 + 248);
  *(_QWORD *)(v5 + 248) = v97;

  v99 = -[NSString copyWithZone:](self->_dataVersion, "copyWithZone:", a3);
  v100 = *(void **)(v5 + 128);
  *(_QWORD *)(v5 + 128) = v99;

  v117 = 0u;
  v118 = 0u;
  v115 = 0u;
  v116 = 0u;
  v101 = self->_suggestedRoutes;
  v102 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v101, "countByEnumeratingWithState:objects:count:", &v115, v163, 16);
  if (v102)
  {
    v103 = *(_QWORD *)v116;
    do
    {
      for (i2 = 0; i2 != v102; ++i2)
      {
        if (*(_QWORD *)v116 != v103)
          objc_enumerationMutation(v101);
        v105 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v115 + 1) + 8 * i2), "copyWithZone:", a3, (_QWORD)v115);
        objc_msgSend((id)v5, "addSuggestedRoute:", v105);

      }
      v102 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v101, "countByEnumeratingWithState:objects:count:", &v115, v163, 16);
    }
    while (v102);
  }

  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    v106 = *(_QWORD *)&self->_timepointUsed._type;
    *(_OWORD *)(v5 + 72) = *(_OWORD *)&self->_timepointUsed._currentUserTime;
    *(_QWORD *)(v5 + 88) = v106;
    *(_QWORD *)(v5 + 388) |= 1uLL;
  }
  v107 = -[GEOTransitDecoderData copyWithZone:](self->_decoderData, "copyWithZone:", a3, (_QWORD)v115);
  v108 = *(void **)(v5 + 152);
  *(_QWORD *)(v5 + 152) = v107;

  v109 = -[NSString copyWithZone:](self->_transitDataVersion, "copyWithZone:", a3);
  v110 = *(void **)(v5 + 304);
  *(_QWORD *)(v5 + 304) = v109;

  v111 = -[GEOClientMetrics copyWithZone:](self->_clientMetrics, "copyWithZone:", a3);
  v112 = *(void **)(v5 + 120);
  *(_QWORD *)(v5 + 120) = v111;

  v113 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v113;
LABEL_110:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  char *v4;
  NSMutableArray *routes;
  NSMutableArray *waypointRoutes;
  NSMutableArray *placeSearchResponses;
  $BB24C2ED400A1348441C88FA4FCB4848 flags;
  uint64_t v9;
  NSData *directionsResponseID;
  GEOUUID *tripId;
  $BB24C2ED400A1348441C88FA4FCB4848 v12;
  uint64_t v13;
  NSMutableArray *incidentsOnRoutes;
  NSMutableArray *incidentsOffRoutes;
  unint64_t problemDetailsCount;
  NSMutableArray *serviceGaps;
  uint64_t v18;
  GEOPBTransitRoutingIncidentMessage *transitIncidentMessage;
  GEORouteDisplayHints *displayHints;
  GEOStyleAttributes *styleAttributes;
  NSData *sessionState;
  GEOAlert *failureAlert;
  uint64_t v24;
  GEOPDDatasetABStatus *datasetAbStatus;
  NSMutableArray *trafficCameras;
  NSData *nonRecommendedRoutesCache;
  $BB24C2ED400A1348441C88FA4FCB4848 v28;
  uint64_t v29;
  GEOSnapScoreMetadata *snapScoreMetadataDebug;
  NSString *debugData;
  NSMutableArray *arrivalParameters;
  NSMutableArray *trafficSignals;
  GEOTransitRouteUpdateConfiguration *transitRouteUpdateConfiguration;
  NSMutableArray *transitPaymentMethodSuggestions;
  GEODirectionsRequestResponseAnalyticsData *analyticData;
  GEOAdvisoriesInfo *advisoriesInfo;
  GEOCommonResponseAttributes *responseAttributes;
  NSMutableArray *internalErrors;
  NSString *serviceVersion;
  NSString *dataVersion;
  NSMutableArray *suggestedRoutes;
  uint64_t v43;
  BOOL v44;
  GEOTransitDecoderData *decoderData;
  NSString *transitDataVersion;
  GEOClientMetrics *clientMetrics;
  char v49;

  v4 = (char *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_135;
  -[GEODirectionsResponse readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if (self->_status != *((_DWORD *)v4 + 95))
    goto LABEL_135;
  routes = self->_routes;
  if ((unint64_t)routes | *((_QWORD *)v4 + 29))
  {
    if (!-[NSMutableArray isEqual:](routes, "isEqual:"))
      goto LABEL_135;
  }
  waypointRoutes = self->_waypointRoutes;
  if ((unint64_t)waypointRoutes | *((_QWORD *)v4 + 43))
  {
    if (!-[NSMutableArray isEqual:](waypointRoutes, "isEqual:"))
      goto LABEL_135;
  }
  placeSearchResponses = self->_placeSearchResponses;
  if ((unint64_t)placeSearchResponses | *((_QWORD *)v4 + 27))
  {
    if (!-[NSMutableArray isEqual:](placeSearchResponses, "isEqual:"))
      goto LABEL_135;
  }
  flags = self->_flags;
  v9 = *(_QWORD *)(v4 + 388);
  if ((*(_BYTE *)&flags & 8) != 0)
  {
    if ((v9 & 8) == 0 || self->_localDistanceUnits != *((_DWORD *)v4 + 93))
      goto LABEL_135;
  }
  else if ((v9 & 8) != 0)
  {
    goto LABEL_135;
  }
  if ((*(_WORD *)&flags & 0x100) != 0)
  {
    if ((v9 & 0x100) == 0)
      goto LABEL_135;
    if (self->_routeDeviatesFromOriginal)
    {
      if (!v4[387])
        goto LABEL_135;
    }
    else if (v4[387])
    {
      goto LABEL_135;
    }
  }
  else if ((v9 & 0x100) != 0)
  {
    goto LABEL_135;
  }
  directionsResponseID = self->_directionsResponseID;
  if ((unint64_t)directionsResponseID | *((_QWORD *)v4 + 20)
    && !-[NSData isEqual:](directionsResponseID, "isEqual:"))
  {
    goto LABEL_135;
  }
  tripId = self->_tripId;
  if ((unint64_t)tripId | *((_QWORD *)v4 + 42))
  {
    if (!-[GEOUUID isEqual:](tripId, "isEqual:"))
      goto LABEL_135;
  }
  v12 = self->_flags;
  v13 = *(_QWORD *)(v4 + 388);
  if ((*(_BYTE *)&v12 & 0x40) != 0)
  {
    if ((v13 & 0x40) == 0)
      goto LABEL_135;
    if (self->_isNavigable)
    {
      if (!v4[385])
        goto LABEL_135;
    }
    else if (v4[385])
    {
      goto LABEL_135;
    }
  }
  else if ((v13 & 0x40) != 0)
  {
    goto LABEL_135;
  }
  if ((*(_BYTE *)&v12 & 2) != 0)
  {
    if ((v13 & 2) == 0 || self->_instructionSignFillColor != *((_DWORD *)v4 + 91))
      goto LABEL_135;
  }
  else if ((v13 & 2) != 0)
  {
    goto LABEL_135;
  }
  incidentsOnRoutes = self->_incidentsOnRoutes;
  if ((unint64_t)incidentsOnRoutes | *((_QWORD *)v4 + 24)
    && !-[NSMutableArray isEqual:](incidentsOnRoutes, "isEqual:"))
  {
    goto LABEL_135;
  }
  incidentsOffRoutes = self->_incidentsOffRoutes;
  if ((unint64_t)incidentsOffRoutes | *((_QWORD *)v4 + 23))
  {
    if (!-[NSMutableArray isEqual:](incidentsOffRoutes, "isEqual:"))
      goto LABEL_135;
  }
  problemDetailsCount = self->_problemDetailsCount;
  if (problemDetailsCount != *((_QWORD *)v4 + 4))
    goto LABEL_135;
  if (memcmp(self->_problemDetails, *((const void **)v4 + 3), 12 * problemDetailsCount))
    goto LABEL_135;
  if (!PBRepeatedInt32IsEqual())
    goto LABEL_135;
  serviceGaps = self->_serviceGaps;
  if ((unint64_t)serviceGaps | *((_QWORD *)v4 + 30))
  {
    if (!-[NSMutableArray isEqual:](serviceGaps, "isEqual:"))
      goto LABEL_135;
  }
  v18 = *(_QWORD *)(v4 + 388);
  if ((*(_BYTE *)&self->_flags & 0x10) != 0)
  {
    if ((v18 & 0x10) == 0 || self->_selectedRouteIndex != *((_DWORD *)v4 + 94))
      goto LABEL_135;
  }
  else if ((v18 & 0x10) != 0)
  {
    goto LABEL_135;
  }
  transitIncidentMessage = self->_transitIncidentMessage;
  if ((unint64_t)transitIncidentMessage | *((_QWORD *)v4 + 39)
    && !-[GEOPBTransitRoutingIncidentMessage isEqual:](transitIncidentMessage, "isEqual:"))
  {
    goto LABEL_135;
  }
  displayHints = self->_displayHints;
  if ((unint64_t)displayHints | *((_QWORD *)v4 + 21))
  {
    if (!-[GEORouteDisplayHints isEqual:](displayHints, "isEqual:"))
      goto LABEL_135;
  }
  styleAttributes = self->_styleAttributes;
  if ((unint64_t)styleAttributes | *((_QWORD *)v4 + 34))
  {
    if (!-[GEOStyleAttributes isEqual:](styleAttributes, "isEqual:"))
      goto LABEL_135;
  }
  sessionState = self->_sessionState;
  if ((unint64_t)sessionState | *((_QWORD *)v4 + 32))
  {
    if (!-[NSData isEqual:](sessionState, "isEqual:"))
      goto LABEL_135;
  }
  failureAlert = self->_failureAlert;
  if ((unint64_t)failureAlert | *((_QWORD *)v4 + 22))
  {
    if (!-[GEOAlert isEqual:](failureAlert, "isEqual:"))
      goto LABEL_135;
  }
  v24 = *(_QWORD *)(v4 + 388);
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    if ((v24 & 4) == 0 || self->_liveRouteSavingsSeconds != *((_DWORD *)v4 + 92))
      goto LABEL_135;
  }
  else if ((v24 & 4) != 0)
  {
    goto LABEL_135;
  }
  datasetAbStatus = self->_datasetAbStatus;
  if ((unint64_t)datasetAbStatus | *((_QWORD *)v4 + 17)
    && !-[GEOPDDatasetABStatus isEqual:](datasetAbStatus, "isEqual:"))
  {
    goto LABEL_135;
  }
  trafficCameras = self->_trafficCameras;
  if ((unint64_t)trafficCameras | *((_QWORD *)v4 + 36))
  {
    if (!-[NSMutableArray isEqual:](trafficCameras, "isEqual:"))
      goto LABEL_135;
  }
  nonRecommendedRoutesCache = self->_nonRecommendedRoutesCache;
  if ((unint64_t)nonRecommendedRoutesCache | *((_QWORD *)v4 + 26))
  {
    if (!-[NSData isEqual:](nonRecommendedRoutesCache, "isEqual:"))
      goto LABEL_135;
  }
  v28 = self->_flags;
  v29 = *(_QWORD *)(v4 + 388);
  if ((*(_BYTE *)&v28 & 0x80) != 0)
  {
    if ((v29 & 0x80) == 0)
      goto LABEL_135;
    if (self->_isOfflineResponse)
    {
      if (!v4[386])
        goto LABEL_135;
    }
    else if (v4[386])
    {
      goto LABEL_135;
    }
  }
  else if ((v29 & 0x80) != 0)
  {
    goto LABEL_135;
  }
  snapScoreMetadataDebug = self->_snapScoreMetadataDebug;
  if ((unint64_t)snapScoreMetadataDebug | *((_QWORD *)v4 + 33))
  {
    if (!-[GEOSnapScoreMetadata isEqual:](snapScoreMetadataDebug, "isEqual:"))
      goto LABEL_135;
    v28 = self->_flags;
    v29 = *(_QWORD *)(v4 + 388);
  }
  if ((*(_BYTE *)&v28 & 0x20) != 0)
  {
    if ((v29 & 0x20) != 0)
    {
      if (self->_hasKhSegments)
      {
        if (!v4[384])
          goto LABEL_135;
        goto LABEL_93;
      }
      if (!v4[384])
        goto LABEL_93;
    }
LABEL_135:
    v49 = 0;
    goto LABEL_136;
  }
  if ((v29 & 0x20) != 0)
    goto LABEL_135;
LABEL_93:
  debugData = self->_debugData;
  if ((unint64_t)debugData | *((_QWORD *)v4 + 18) && !-[NSString isEqual:](debugData, "isEqual:"))
    goto LABEL_135;
  arrivalParameters = self->_arrivalParameters;
  if ((unint64_t)arrivalParameters | *((_QWORD *)v4 + 14))
  {
    if (!-[NSMutableArray isEqual:](arrivalParameters, "isEqual:"))
      goto LABEL_135;
  }
  trafficSignals = self->_trafficSignals;
  if ((unint64_t)trafficSignals | *((_QWORD *)v4 + 37))
  {
    if (!-[NSMutableArray isEqual:](trafficSignals, "isEqual:"))
      goto LABEL_135;
  }
  transitRouteUpdateConfiguration = self->_transitRouteUpdateConfiguration;
  if ((unint64_t)transitRouteUpdateConfiguration | *((_QWORD *)v4 + 41))
  {
    if (!-[GEOTransitRouteUpdateConfiguration isEqual:](transitRouteUpdateConfiguration, "isEqual:"))
      goto LABEL_135;
  }
  transitPaymentMethodSuggestions = self->_transitPaymentMethodSuggestions;
  if ((unint64_t)transitPaymentMethodSuggestions | *((_QWORD *)v4 + 40))
  {
    if (!-[NSMutableArray isEqual:](transitPaymentMethodSuggestions, "isEqual:"))
      goto LABEL_135;
  }
  analyticData = self->_analyticData;
  if ((unint64_t)analyticData | *((_QWORD *)v4 + 13))
  {
    if (!-[GEODirectionsRequestResponseAnalyticsData isEqual:](analyticData, "isEqual:"))
      goto LABEL_135;
  }
  advisoriesInfo = self->_advisoriesInfo;
  if ((unint64_t)advisoriesInfo | *((_QWORD *)v4 + 12))
  {
    if (!-[GEOAdvisoriesInfo isEqual:](advisoriesInfo, "isEqual:"))
      goto LABEL_135;
  }
  responseAttributes = self->_responseAttributes;
  if ((unint64_t)responseAttributes | *((_QWORD *)v4 + 28))
  {
    if (!-[GEOCommonResponseAttributes isEqual:](responseAttributes, "isEqual:"))
      goto LABEL_135;
  }
  internalErrors = self->_internalErrors;
  if ((unint64_t)internalErrors | *((_QWORD *)v4 + 25))
  {
    if (!-[NSMutableArray isEqual:](internalErrors, "isEqual:"))
      goto LABEL_135;
  }
  serviceVersion = self->_serviceVersion;
  if ((unint64_t)serviceVersion | *((_QWORD *)v4 + 31))
  {
    if (!-[NSString isEqual:](serviceVersion, "isEqual:"))
      goto LABEL_135;
  }
  dataVersion = self->_dataVersion;
  if ((unint64_t)dataVersion | *((_QWORD *)v4 + 16))
  {
    if (!-[NSString isEqual:](dataVersion, "isEqual:"))
      goto LABEL_135;
  }
  suggestedRoutes = self->_suggestedRoutes;
  if ((unint64_t)suggestedRoutes | *((_QWORD *)v4 + 35))
  {
    if (!-[NSMutableArray isEqual:](suggestedRoutes, "isEqual:"))
      goto LABEL_135;
  }
  v43 = *(_QWORD *)(v4 + 388);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((v43 & 1) == 0)
      goto LABEL_135;
    v44 = *(_QWORD *)&self->_timepointUsed._currentUserTime == *((_QWORD *)v4 + 9)
       && *(_QWORD *)&self->_timepointUsed._time == *((_QWORD *)v4 + 10);
    if (!v44 || *(_QWORD *)&self->_timepointUsed._type != *((_QWORD *)v4 + 11))
      goto LABEL_135;
  }
  else if ((v43 & 1) != 0)
  {
    goto LABEL_135;
  }
  decoderData = self->_decoderData;
  if ((unint64_t)decoderData | *((_QWORD *)v4 + 19)
    && !-[GEOTransitDecoderData isEqual:](decoderData, "isEqual:"))
  {
    goto LABEL_135;
  }
  transitDataVersion = self->_transitDataVersion;
  if ((unint64_t)transitDataVersion | *((_QWORD *)v4 + 38))
  {
    if (!-[NSString isEqual:](transitDataVersion, "isEqual:"))
      goto LABEL_135;
  }
  clientMetrics = self->_clientMetrics;
  if ((unint64_t)clientMetrics | *((_QWORD *)v4 + 15))
    v49 = -[GEOClientMetrics isEqual:](clientMetrics, "isEqual:");
  else
    v49 = 1;
LABEL_136:

  return v49;
}

- (unint64_t)hash
{
  $BB24C2ED400A1348441C88FA4FCB4848 flags;
  $BB24C2ED400A1348441C88FA4FCB4848 v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  NSUInteger v10;
  NSUInteger v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  NSUInteger v15;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSUInteger v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t status;

  -[GEODirectionsResponse readAll:](self, "readAll:", 1);
  status = self->_status;
  v47 = -[NSMutableArray hash](self->_routes, "hash");
  v46 = -[NSMutableArray hash](self->_waypointRoutes, "hash");
  v45 = -[NSMutableArray hash](self->_placeSearchResponses, "hash");
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 8) != 0)
  {
    v44 = 2654435761 * self->_localDistanceUnits;
    if ((*(_WORD *)&flags & 0x100) != 0)
      goto LABEL_3;
  }
  else
  {
    v44 = 0;
    if ((*(_WORD *)&flags & 0x100) != 0)
    {
LABEL_3:
      v43 = 2654435761 * self->_routeDeviatesFromOriginal;
      goto LABEL_6;
    }
  }
  v43 = 0;
LABEL_6:
  v42 = -[NSData hash](self->_directionsResponseID, "hash");
  v41 = -[GEOUUID hash](self->_tripId, "hash");
  v4 = self->_flags;
  if ((*(_BYTE *)&v4 & 0x40) != 0)
  {
    v40 = 2654435761 * self->_isNavigable;
    if ((*(_BYTE *)&v4 & 2) != 0)
      goto LABEL_8;
  }
  else
  {
    v40 = 0;
    if ((*(_BYTE *)&v4 & 2) != 0)
    {
LABEL_8:
      v39 = 2654435761 * self->_instructionSignFillColor;
      goto LABEL_11;
    }
  }
  v39 = 0;
LABEL_11:
  v38 = -[NSMutableArray hash](self->_incidentsOnRoutes, "hash");
  v37 = -[NSMutableArray hash](self->_incidentsOffRoutes, "hash");
  v36 = PBHashBytes();
  v35 = PBRepeatedInt32Hash();
  v34 = -[NSMutableArray hash](self->_serviceGaps, "hash");
  if ((*(_BYTE *)&self->_flags & 0x10) != 0)
    v33 = 2654435761 * self->_selectedRouteIndex;
  else
    v33 = 0;
  v32 = -[GEOPBTransitRoutingIncidentMessage hash](self->_transitIncidentMessage, "hash");
  v31 = -[GEORouteDisplayHints hash](self->_displayHints, "hash");
  v30 = -[GEOStyleAttributes hash](self->_styleAttributes, "hash");
  v29 = -[NSData hash](self->_sessionState, "hash");
  v28 = -[GEOAlert hash](self->_failureAlert, "hash");
  if ((*(_BYTE *)&self->_flags & 4) != 0)
    v27 = 2654435761 * self->_liveRouteSavingsSeconds;
  else
    v27 = 0;
  v26 = -[GEOPDDatasetABStatus hash](self->_datasetAbStatus, "hash");
  v25 = -[NSMutableArray hash](self->_trafficCameras, "hash");
  v24 = -[NSData hash](self->_nonRecommendedRoutesCache, "hash");
  if ((*(_BYTE *)&self->_flags & 0x80) != 0)
    v23 = 2654435761 * self->_isOfflineResponse;
  else
    v23 = 0;
  v22 = -[GEOSnapScoreMetadata hash](self->_snapScoreMetadataDebug, "hash");
  if ((*(_BYTE *)&self->_flags & 0x20) != 0)
    v21 = 2654435761 * self->_hasKhSegments;
  else
    v21 = 0;
  v20 = -[NSString hash](self->_debugData, "hash");
  v19 = -[NSMutableArray hash](self->_arrivalParameters, "hash");
  v18 = -[NSMutableArray hash](self->_trafficSignals, "hash");
  v17 = -[GEOTransitRouteUpdateConfiguration hash](self->_transitRouteUpdateConfiguration, "hash");
  v5 = -[NSMutableArray hash](self->_transitPaymentMethodSuggestions, "hash");
  v6 = -[GEODirectionsRequestResponseAnalyticsData hash](self->_analyticData, "hash");
  v7 = -[GEOAdvisoriesInfo hash](self->_advisoriesInfo, "hash");
  v8 = -[GEOCommonResponseAttributes hash](self->_responseAttributes, "hash");
  v9 = -[NSMutableArray hash](self->_internalErrors, "hash");
  v10 = -[NSString hash](self->_serviceVersion, "hash");
  v11 = -[NSString hash](self->_dataVersion, "hash");
  v12 = -[NSMutableArray hash](self->_suggestedRoutes, "hash");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v13 = PBHashBytes();
  else
    v13 = 0;
  v14 = v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ -[GEOTransitDecoderData hash](self->_decoderData, "hash");
  v15 = v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ (2654435761 * status) ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v18 ^ v17 ^ v5 ^ v14 ^ -[NSString hash](self->_transitDataVersion, "hash");
  return v15 ^ -[GEOClientMetrics hash](self->_clientMetrics, "hash");
}

- (void)mergeFrom:(id)a3
{
  char *v4;
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
  uint64_t v20;
  GEOUUID *tripId;
  void *v22;
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
  uint64_t v34;
  uint64_t v35;
  uint64_t ii;
  uint64_t v37;
  unsigned int v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t jj;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t kk;
  GEOPBTransitRoutingIncidentMessage *transitIncidentMessage;
  void *v48;
  GEORouteDisplayHints *displayHints;
  uint64_t v50;
  GEOStyleAttributes *styleAttributes;
  uint64_t v52;
  GEOAlert *failureAlert;
  void *v54;
  GEOPDDatasetABStatus *datasetAbStatus;
  uint64_t v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t mm;
  GEOSnapScoreMetadata *snapScoreMetadataDebug;
  void *v63;
  id v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t nn;
  id v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t i1;
  GEOTransitRouteUpdateConfiguration *transitRouteUpdateConfiguration;
  uint64_t v75;
  id v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t i2;
  GEODirectionsRequestResponseAnalyticsData *analyticData;
  uint64_t v82;
  GEOAdvisoriesInfo *advisoriesInfo;
  uint64_t v84;
  GEOCommonResponseAttributes *responseAttributes;
  uint64_t v86;
  id v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t i3;
  id v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t i4;
  uint64_t v97;
  GEOTransitDecoderData *decoderData;
  uint64_t v99;
  GEOClientMetrics *clientMetrics;
  uint64_t v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
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
  _BYTE v150[128];
  _BYTE v151[128];
  _BYTE v152[128];
  _BYTE v153[128];
  _BYTE v154[128];
  _BYTE v155[128];
  _BYTE v156[128];
  _BYTE v157[128];
  _BYTE v158[128];
  _BYTE v159[128];
  _BYTE v160[128];
  _BYTE v161[128];
  uint64_t v162;

  v162 = *MEMORY[0x1E0C80C00];
  v4 = (char *)a3;
  objc_msgSend(v4, "readAll:", 0);
  self->_status = *((_DWORD *)v4 + 95);
  v146 = 0u;
  v147 = 0u;
  v148 = 0u;
  v149 = 0u;
  v5 = *((id *)v4 + 29);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v146, v161, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v147;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v147 != v8)
          objc_enumerationMutation(v5);
        -[GEODirectionsResponse addRoute:](self, "addRoute:", *(_QWORD *)(*((_QWORD *)&v146 + 1) + 8 * i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v146, v161, 16);
    }
    while (v7);
  }

  v144 = 0u;
  v145 = 0u;
  v142 = 0u;
  v143 = 0u;
  v10 = *((id *)v4 + 43);
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v142, v160, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v143;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v143 != v13)
          objc_enumerationMutation(v10);
        -[GEODirectionsResponse addWaypointRoute:](self, "addWaypointRoute:", *(_QWORD *)(*((_QWORD *)&v142 + 1) + 8 * j));
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v142, v160, 16);
    }
    while (v12);
  }

  v140 = 0u;
  v141 = 0u;
  v138 = 0u;
  v139 = 0u;
  v15 = *((id *)v4 + 27);
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v138, v159, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v139;
    do
    {
      for (k = 0; k != v17; ++k)
      {
        if (*(_QWORD *)v139 != v18)
          objc_enumerationMutation(v15);
        -[GEODirectionsResponse addPlaceSearchResponse:](self, "addPlaceSearchResponse:", *(_QWORD *)(*((_QWORD *)&v138 + 1) + 8 * k));
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v138, v159, 16);
    }
    while (v17);
  }

  v20 = *(_QWORD *)(v4 + 388);
  if ((v20 & 8) != 0)
  {
    self->_localDistanceUnits = *((_DWORD *)v4 + 93);
    *(_QWORD *)&self->_flags |= 8uLL;
    v20 = *(_QWORD *)(v4 + 388);
  }
  if ((v20 & 0x100) != 0)
  {
    self->_routeDeviatesFromOriginal = v4[387];
    *(_QWORD *)&self->_flags |= 0x100uLL;
  }
  if (*((_QWORD *)v4 + 20))
    -[GEODirectionsResponse setDirectionsResponseID:](self, "setDirectionsResponseID:");
  tripId = self->_tripId;
  v22 = (void *)*((_QWORD *)v4 + 42);
  if (tripId)
  {
    if (v22)
      -[GEOUUID mergeFrom:]((uint64_t)tripId, v22);
  }
  else if (v22)
  {
    -[GEODirectionsResponse setTripId:](self, "setTripId:", *((_QWORD *)v4 + 42));
  }
  v23 = *(_QWORD *)(v4 + 388);
  if ((v23 & 0x40) != 0)
  {
    self->_isNavigable = v4[385];
    *(_QWORD *)&self->_flags |= 0x40uLL;
    v23 = *(_QWORD *)(v4 + 388);
  }
  if ((v23 & 2) != 0)
  {
    self->_instructionSignFillColor = *((_DWORD *)v4 + 91);
    *(_QWORD *)&self->_flags |= 2uLL;
  }
  v136 = 0u;
  v137 = 0u;
  v134 = 0u;
  v135 = 0u;
  v24 = *((id *)v4 + 24);
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v134, v158, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v135;
    do
    {
      for (m = 0; m != v26; ++m)
      {
        if (*(_QWORD *)v135 != v27)
          objc_enumerationMutation(v24);
        -[GEODirectionsResponse addIncidentsOnRoutes:](self, "addIncidentsOnRoutes:", *(_QWORD *)(*((_QWORD *)&v134 + 1) + 8 * m));
      }
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v134, v158, 16);
    }
    while (v26);
  }

  v132 = 0u;
  v133 = 0u;
  v130 = 0u;
  v131 = 0u;
  v29 = *((id *)v4 + 23);
  v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v130, v157, 16);
  if (v30)
  {
    v31 = v30;
    v32 = *(_QWORD *)v131;
    do
    {
      for (n = 0; n != v31; ++n)
      {
        if (*(_QWORD *)v131 != v32)
          objc_enumerationMutation(v29);
        -[GEODirectionsResponse addIncidentsOffRoutes:](self, "addIncidentsOffRoutes:", *(_QWORD *)(*((_QWORD *)&v130 + 1) + 8 * n));
      }
      v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v130, v157, 16);
    }
    while (v31);
  }

  v34 = objc_msgSend(v4, "problemDetailsCount");
  if (v34)
  {
    v35 = v34;
    for (ii = 0; ii != v35; ++ii)
    {
      v37 = objc_msgSend(v4, "problemDetailAtIndex:", ii);
      -[GEODirectionsResponse addProblemDetail:](self, "addProblemDetail:", v37, v38);
    }
  }
  v39 = objc_msgSend(v4, "supportedTransportTypesCount");
  if (v39)
  {
    v40 = v39;
    for (jj = 0; jj != v40; ++jj)
      -[GEODirectionsResponse addSupportedTransportType:](self, "addSupportedTransportType:", objc_msgSend(v4, "supportedTransportTypeAtIndex:", jj));
  }
  v128 = 0u;
  v129 = 0u;
  v126 = 0u;
  v127 = 0u;
  v42 = *((id *)v4 + 30);
  v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v126, v156, 16);
  if (v43)
  {
    v44 = v43;
    v45 = *(_QWORD *)v127;
    do
    {
      for (kk = 0; kk != v44; ++kk)
      {
        if (*(_QWORD *)v127 != v45)
          objc_enumerationMutation(v42);
        -[GEODirectionsResponse addServiceGap:](self, "addServiceGap:", *(_QWORD *)(*((_QWORD *)&v126 + 1) + 8 * kk));
      }
      v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v126, v156, 16);
    }
    while (v44);
  }

  if ((v4[388] & 0x10) != 0)
  {
    self->_selectedRouteIndex = *((_DWORD *)v4 + 94);
    *(_QWORD *)&self->_flags |= 0x10uLL;
  }
  transitIncidentMessage = self->_transitIncidentMessage;
  v48 = (void *)*((_QWORD *)v4 + 39);
  if (transitIncidentMessage)
  {
    if (v48)
      -[GEOPBTransitRoutingIncidentMessage mergeFrom:]((uint64_t)transitIncidentMessage, v48);
  }
  else if (v48)
  {
    -[GEODirectionsResponse setTransitIncidentMessage:](self, "setTransitIncidentMessage:", *((_QWORD *)v4 + 39));
  }
  displayHints = self->_displayHints;
  v50 = *((_QWORD *)v4 + 21);
  if (displayHints)
  {
    if (v50)
      -[GEORouteDisplayHints mergeFrom:](displayHints, "mergeFrom:");
  }
  else if (v50)
  {
    -[GEODirectionsResponse setDisplayHints:](self, "setDisplayHints:");
  }
  styleAttributes = self->_styleAttributes;
  v52 = *((_QWORD *)v4 + 34);
  if (styleAttributes)
  {
    if (v52)
      -[GEOStyleAttributes mergeFrom:](styleAttributes, "mergeFrom:");
  }
  else if (v52)
  {
    -[GEODirectionsResponse setStyleAttributes:](self, "setStyleAttributes:");
  }
  if (*((_QWORD *)v4 + 32))
    -[GEODirectionsResponse setSessionState:](self, "setSessionState:");
  failureAlert = self->_failureAlert;
  v54 = (void *)*((_QWORD *)v4 + 22);
  if (failureAlert)
  {
    if (v54)
      -[GEOAlert mergeFrom:]((uint64_t)failureAlert, v54);
  }
  else if (v54)
  {
    -[GEODirectionsResponse setFailureAlert:](self, "setFailureAlert:", *((_QWORD *)v4 + 22));
  }
  if ((v4[388] & 4) != 0)
  {
    self->_liveRouteSavingsSeconds = *((_DWORD *)v4 + 92);
    *(_QWORD *)&self->_flags |= 4uLL;
  }
  datasetAbStatus = self->_datasetAbStatus;
  v56 = *((_QWORD *)v4 + 17);
  if (datasetAbStatus)
  {
    if (v56)
      -[GEOPDDatasetABStatus mergeFrom:](datasetAbStatus, "mergeFrom:");
  }
  else if (v56)
  {
    -[GEODirectionsResponse setDatasetAbStatus:](self, "setDatasetAbStatus:");
  }
  v124 = 0u;
  v125 = 0u;
  v122 = 0u;
  v123 = 0u;
  v57 = *((id *)v4 + 36);
  v58 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v122, v155, 16);
  if (v58)
  {
    v59 = v58;
    v60 = *(_QWORD *)v123;
    do
    {
      for (mm = 0; mm != v59; ++mm)
      {
        if (*(_QWORD *)v123 != v60)
          objc_enumerationMutation(v57);
        -[GEODirectionsResponse addTrafficCamera:](self, "addTrafficCamera:", *(_QWORD *)(*((_QWORD *)&v122 + 1) + 8 * mm));
      }
      v59 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v122, v155, 16);
    }
    while (v59);
  }

  if (*((_QWORD *)v4 + 26))
    -[GEODirectionsResponse setNonRecommendedRoutesCache:](self, "setNonRecommendedRoutesCache:");
  if (v4[388] < 0)
  {
    self->_isOfflineResponse = v4[386];
    *(_QWORD *)&self->_flags |= 0x80uLL;
  }
  snapScoreMetadataDebug = self->_snapScoreMetadataDebug;
  v63 = (void *)*((_QWORD *)v4 + 33);
  if (snapScoreMetadataDebug)
  {
    if (v63)
      -[GEOSnapScoreMetadata mergeFrom:]((uint64_t)snapScoreMetadataDebug, v63);
  }
  else if (v63)
  {
    -[GEODirectionsResponse setSnapScoreMetadataDebug:](self, "setSnapScoreMetadataDebug:", *((_QWORD *)v4 + 33));
  }
  if ((v4[388] & 0x20) != 0)
  {
    self->_hasKhSegments = v4[384];
    *(_QWORD *)&self->_flags |= 0x20uLL;
  }
  if (*((_QWORD *)v4 + 18))
    -[GEODirectionsResponse setDebugData:](self, "setDebugData:");
  v120 = 0u;
  v121 = 0u;
  v118 = 0u;
  v119 = 0u;
  v64 = *((id *)v4 + 14);
  v65 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v118, v154, 16);
  if (v65)
  {
    v66 = v65;
    v67 = *(_QWORD *)v119;
    do
    {
      for (nn = 0; nn != v66; ++nn)
      {
        if (*(_QWORD *)v119 != v67)
          objc_enumerationMutation(v64);
        -[GEODirectionsResponse addArrivalParameters:](self, "addArrivalParameters:", *(_QWORD *)(*((_QWORD *)&v118 + 1) + 8 * nn));
      }
      v66 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v118, v154, 16);
    }
    while (v66);
  }

  v116 = 0u;
  v117 = 0u;
  v114 = 0u;
  v115 = 0u;
  v69 = *((id *)v4 + 37);
  v70 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v114, v153, 16);
  if (v70)
  {
    v71 = v70;
    v72 = *(_QWORD *)v115;
    do
    {
      for (i1 = 0; i1 != v71; ++i1)
      {
        if (*(_QWORD *)v115 != v72)
          objc_enumerationMutation(v69);
        -[GEODirectionsResponse addTrafficSignal:](self, "addTrafficSignal:", *(_QWORD *)(*((_QWORD *)&v114 + 1) + 8 * i1));
      }
      v71 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v114, v153, 16);
    }
    while (v71);
  }

  transitRouteUpdateConfiguration = self->_transitRouteUpdateConfiguration;
  v75 = *((_QWORD *)v4 + 41);
  if (transitRouteUpdateConfiguration)
  {
    if (v75)
      -[GEOTransitRouteUpdateConfiguration mergeFrom:](transitRouteUpdateConfiguration, "mergeFrom:");
  }
  else if (v75)
  {
    -[GEODirectionsResponse setTransitRouteUpdateConfiguration:](self, "setTransitRouteUpdateConfiguration:");
  }
  v112 = 0u;
  v113 = 0u;
  v110 = 0u;
  v111 = 0u;
  v76 = *((id *)v4 + 40);
  v77 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v110, v152, 16);
  if (v77)
  {
    v78 = v77;
    v79 = *(_QWORD *)v111;
    do
    {
      for (i2 = 0; i2 != v78; ++i2)
      {
        if (*(_QWORD *)v111 != v79)
          objc_enumerationMutation(v76);
        -[GEODirectionsResponse addTransitPaymentMethodSuggestion:](self, "addTransitPaymentMethodSuggestion:", *(_QWORD *)(*((_QWORD *)&v110 + 1) + 8 * i2));
      }
      v78 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v110, v152, 16);
    }
    while (v78);
  }

  analyticData = self->_analyticData;
  v82 = *((_QWORD *)v4 + 13);
  if (analyticData)
  {
    if (v82)
      -[GEODirectionsRequestResponseAnalyticsData mergeFrom:](analyticData, "mergeFrom:");
  }
  else if (v82)
  {
    -[GEODirectionsResponse setAnalyticData:](self, "setAnalyticData:");
  }
  advisoriesInfo = self->_advisoriesInfo;
  v84 = *((_QWORD *)v4 + 12);
  if (advisoriesInfo)
  {
    if (v84)
      -[GEOAdvisoriesInfo mergeFrom:](advisoriesInfo, "mergeFrom:");
  }
  else if (v84)
  {
    -[GEODirectionsResponse setAdvisoriesInfo:](self, "setAdvisoriesInfo:");
  }
  responseAttributes = self->_responseAttributes;
  v86 = *((_QWORD *)v4 + 28);
  if (responseAttributes)
  {
    if (v86)
      -[GEOCommonResponseAttributes mergeFrom:](responseAttributes, "mergeFrom:");
  }
  else if (v86)
  {
    -[GEODirectionsResponse setResponseAttributes:](self, "setResponseAttributes:");
  }
  v108 = 0u;
  v109 = 0u;
  v106 = 0u;
  v107 = 0u;
  v87 = *((id *)v4 + 25);
  v88 = objc_msgSend(v87, "countByEnumeratingWithState:objects:count:", &v106, v151, 16);
  if (v88)
  {
    v89 = v88;
    v90 = *(_QWORD *)v107;
    do
    {
      for (i3 = 0; i3 != v89; ++i3)
      {
        if (*(_QWORD *)v107 != v90)
          objc_enumerationMutation(v87);
        -[GEODirectionsResponse addInternalError:](self, "addInternalError:", *(_QWORD *)(*((_QWORD *)&v106 + 1) + 8 * i3));
      }
      v89 = objc_msgSend(v87, "countByEnumeratingWithState:objects:count:", &v106, v151, 16);
    }
    while (v89);
  }

  if (*((_QWORD *)v4 + 31))
    -[GEODirectionsResponse setServiceVersion:](self, "setServiceVersion:");
  if (*((_QWORD *)v4 + 16))
    -[GEODirectionsResponse setDataVersion:](self, "setDataVersion:");
  v104 = 0u;
  v105 = 0u;
  v102 = 0u;
  v103 = 0u;
  v92 = *((id *)v4 + 35);
  v93 = objc_msgSend(v92, "countByEnumeratingWithState:objects:count:", &v102, v150, 16);
  if (v93)
  {
    v94 = v93;
    v95 = *(_QWORD *)v103;
    do
    {
      for (i4 = 0; i4 != v94; ++i4)
      {
        if (*(_QWORD *)v103 != v95)
          objc_enumerationMutation(v92);
        -[GEODirectionsResponse addSuggestedRoute:](self, "addSuggestedRoute:", *(_QWORD *)(*((_QWORD *)&v102 + 1) + 8 * i4), (_QWORD)v102);
      }
      v94 = objc_msgSend(v92, "countByEnumeratingWithState:objects:count:", &v102, v150, 16);
    }
    while (v94);
  }

  if ((v4[388] & 1) != 0)
  {
    v97 = *((_QWORD *)v4 + 11);
    *(_OWORD *)&self->_timepointUsed._currentUserTime = *(_OWORD *)(v4 + 72);
    *(_QWORD *)&self->_timepointUsed._type = v97;
    *(_QWORD *)&self->_flags |= 1uLL;
  }
  decoderData = self->_decoderData;
  v99 = *((_QWORD *)v4 + 19);
  if (decoderData)
  {
    if (v99)
      -[GEOTransitDecoderData mergeFrom:](decoderData, "mergeFrom:");
  }
  else if (v99)
  {
    -[GEODirectionsResponse setDecoderData:](self, "setDecoderData:");
  }
  if (*((_QWORD *)v4 + 38))
    -[GEODirectionsResponse setTransitDataVersion:](self, "setTransitDataVersion:");
  clientMetrics = self->_clientMetrics;
  v101 = *((_QWORD *)v4 + 15);
  if (clientMetrics)
  {
    if (v101)
      -[GEOClientMetrics mergeFrom:](clientMetrics, "mergeFrom:");
  }
  else if (v101)
  {
    -[GEODirectionsResponse setClientMetrics:](self, "setClientMetrics:");
  }

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
      GEODirectionsResponseReadSpecified((uint64_t)self, (uint64_t)self->_reader, (int *)&unknownFields_tags_719);
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
  GEOUUID *tripId;
  PBUnknownFields *v23;
  NSMutableArray *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSMutableArray *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  NSMutableArray *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  NSMutableArray *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  NSMutableArray *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  NSMutableArray *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  NSMutableArray *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  NSMutableArray *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
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
  _BYTE v108[128];
  _BYTE v109[128];
  _BYTE v110[128];
  _BYTE v111[128];
  _BYTE v112[128];
  _BYTE v113[128];
  _BYTE v114[128];
  _BYTE v115[128];
  _BYTE v116[128];
  _BYTE v117[128];
  _BYTE v118[128];
  uint64_t v119;

  v3 = a3;
  v119 = *MEMORY[0x1E0C80C00];
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x100000000200uLL;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEODirectionsResponse readAll:](self, "readAll:", 0);
    v106 = 0u;
    v107 = 0u;
    v104 = 0u;
    v105 = 0u;
    v7 = self->_routes;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v104, v118, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v105;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v105 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v104 + 1) + 8 * v11++), "clearUnknownFields:", 1);
        }
        while (v9 != v11);
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v104, v118, 16);
      }
      while (v9);
    }

    v102 = 0u;
    v103 = 0u;
    v100 = 0u;
    v101 = 0u;
    v12 = self->_waypointRoutes;
    v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v100, v117, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v101;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v101 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v100 + 1) + 8 * v16++), "clearUnknownFields:", 1);
        }
        while (v14 != v16);
        v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v100, v117, 16);
      }
      while (v14);
    }

    v98 = 0u;
    v99 = 0u;
    v96 = 0u;
    v97 = 0u;
    v17 = self->_placeSearchResponses;
    v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v96, v116, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v97;
      do
      {
        v21 = 0;
        do
        {
          if (*(_QWORD *)v97 != v20)
            objc_enumerationMutation(v17);
          objc_msgSend(*(id *)(*((_QWORD *)&v96 + 1) + 8 * v21++), "clearUnknownFields:", 1);
        }
        while (v19 != v21);
        v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v96, v116, 16);
      }
      while (v19);
    }

    tripId = self->_tripId;
    if (tripId)
    {
      v23 = tripId->_unknownFields;
      tripId->_unknownFields = 0;

    }
    v94 = 0u;
    v95 = 0u;
    v92 = 0u;
    v93 = 0u;
    v24 = self->_incidentsOnRoutes;
    v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v92, v115, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v93;
      do
      {
        v28 = 0;
        do
        {
          if (*(_QWORD *)v93 != v27)
            objc_enumerationMutation(v24);
          objc_msgSend(*(id *)(*((_QWORD *)&v92 + 1) + 8 * v28++), "clearUnknownFields:", 1);
        }
        while (v26 != v28);
        v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v92, v115, 16);
      }
      while (v26);
    }

    v90 = 0u;
    v91 = 0u;
    v88 = 0u;
    v89 = 0u;
    v29 = self->_incidentsOffRoutes;
    v30 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v88, v114, 16);
    if (v30)
    {
      v31 = v30;
      v32 = *(_QWORD *)v89;
      do
      {
        v33 = 0;
        do
        {
          if (*(_QWORD *)v89 != v32)
            objc_enumerationMutation(v29);
          objc_msgSend(*(id *)(*((_QWORD *)&v88 + 1) + 8 * v33++), "clearUnknownFields:", 1);
        }
        while (v31 != v33);
        v31 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v88, v114, 16);
      }
      while (v31);
    }

    v86 = 0u;
    v87 = 0u;
    v84 = 0u;
    v85 = 0u;
    v34 = self->_serviceGaps;
    v35 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v34, "countByEnumeratingWithState:objects:count:", &v84, v113, 16);
    if (v35)
    {
      v36 = v35;
      v37 = *(_QWORD *)v85;
      do
      {
        v38 = 0;
        do
        {
          if (*(_QWORD *)v85 != v37)
            objc_enumerationMutation(v34);
          objc_msgSend(*(id *)(*((_QWORD *)&v84 + 1) + 8 * v38++), "clearUnknownFields:", 1);
        }
        while (v36 != v38);
        v36 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v34, "countByEnumeratingWithState:objects:count:", &v84, v113, 16);
      }
      while (v36);
    }

    -[GEOPBTransitRoutingIncidentMessage clearUnknownFields:]((uint64_t)self->_transitIncidentMessage, 1);
    -[GEORouteDisplayHints clearUnknownFields:](self->_displayHints, "clearUnknownFields:", 1);
    -[GEOStyleAttributes clearUnknownFields:](self->_styleAttributes, "clearUnknownFields:", 1);
    -[GEOAlert clearUnknownFields:]((uint64_t)self->_failureAlert, 1);
    -[GEOPDDatasetABStatus clearUnknownFields:](self->_datasetAbStatus, "clearUnknownFields:", 1);
    v82 = 0u;
    v83 = 0u;
    v80 = 0u;
    v81 = 0u;
    v39 = self->_trafficCameras;
    v40 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v39, "countByEnumeratingWithState:objects:count:", &v80, v112, 16);
    if (v40)
    {
      v41 = v40;
      v42 = *(_QWORD *)v81;
      do
      {
        v43 = 0;
        do
        {
          if (*(_QWORD *)v81 != v42)
            objc_enumerationMutation(v39);
          objc_msgSend(*(id *)(*((_QWORD *)&v80 + 1) + 8 * v43++), "clearUnknownFields:", 1);
        }
        while (v41 != v43);
        v41 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v39, "countByEnumeratingWithState:objects:count:", &v80, v112, 16);
      }
      while (v41);
    }

    -[GEOSnapScoreMetadata clearUnknownFields:]((uint64_t)self->_snapScoreMetadataDebug, 1);
    v78 = 0u;
    v79 = 0u;
    v76 = 0u;
    v77 = 0u;
    v44 = self->_arrivalParameters;
    v45 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v44, "countByEnumeratingWithState:objects:count:", &v76, v111, 16);
    if (v45)
    {
      v46 = v45;
      v47 = *(_QWORD *)v77;
      do
      {
        v48 = 0;
        do
        {
          if (*(_QWORD *)v77 != v47)
            objc_enumerationMutation(v44);
          objc_msgSend(*(id *)(*((_QWORD *)&v76 + 1) + 8 * v48++), "clearUnknownFields:", 1);
        }
        while (v46 != v48);
        v46 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v44, "countByEnumeratingWithState:objects:count:", &v76, v111, 16);
      }
      while (v46);
    }

    v74 = 0u;
    v75 = 0u;
    v72 = 0u;
    v73 = 0u;
    v49 = self->_trafficSignals;
    v50 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v49, "countByEnumeratingWithState:objects:count:", &v72, v110, 16);
    if (v50)
    {
      v51 = v50;
      v52 = *(_QWORD *)v73;
      do
      {
        v53 = 0;
        do
        {
          if (*(_QWORD *)v73 != v52)
            objc_enumerationMutation(v49);
          objc_msgSend(*(id *)(*((_QWORD *)&v72 + 1) + 8 * v53++), "clearUnknownFields:", 1);
        }
        while (v51 != v53);
        v51 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v49, "countByEnumeratingWithState:objects:count:", &v72, v110, 16);
      }
      while (v51);
    }

    -[GEOTransitRouteUpdateConfiguration clearUnknownFields:](self->_transitRouteUpdateConfiguration, "clearUnknownFields:", 1);
    v70 = 0u;
    v71 = 0u;
    v68 = 0u;
    v69 = 0u;
    v54 = self->_transitPaymentMethodSuggestions;
    v55 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v54, "countByEnumeratingWithState:objects:count:", &v68, v109, 16);
    if (v55)
    {
      v56 = v55;
      v57 = *(_QWORD *)v69;
      do
      {
        v58 = 0;
        do
        {
          if (*(_QWORD *)v69 != v57)
            objc_enumerationMutation(v54);
          objc_msgSend(*(id *)(*((_QWORD *)&v68 + 1) + 8 * v58++), "clearUnknownFields:", 1);
        }
        while (v56 != v58);
        v56 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v54, "countByEnumeratingWithState:objects:count:", &v68, v109, 16);
      }
      while (v56);
    }

    -[GEODirectionsRequestResponseAnalyticsData clearUnknownFields:](self->_analyticData, "clearUnknownFields:", 1);
    -[GEOAdvisoriesInfo clearUnknownFields:](self->_advisoriesInfo, "clearUnknownFields:", 1);
    -[GEOCommonResponseAttributes clearUnknownFields:](self->_responseAttributes, "clearUnknownFields:", 1);
    v66 = 0u;
    v67 = 0u;
    v64 = 0u;
    v65 = 0u;
    v59 = self->_suggestedRoutes;
    v60 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v59, "countByEnumeratingWithState:objects:count:", &v64, v108, 16);
    if (v60)
    {
      v61 = v60;
      v62 = *(_QWORD *)v65;
      do
      {
        v63 = 0;
        do
        {
          if (*(_QWORD *)v65 != v62)
            objc_enumerationMutation(v59);
          objc_msgSend(*(id *)(*((_QWORD *)&v64 + 1) + 8 * v63++), "clearUnknownFields:", 1, (_QWORD)v64);
        }
        while (v61 != v63);
        v61 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v59, "countByEnumeratingWithState:objects:count:", &v64, v108, 16);
      }
      while (v61);
    }

    -[GEOTransitDecoderData clearUnknownFields:](self->_decoderData, "clearUnknownFields:", 1);
    -[GEOClientMetrics clearUnknownFields:](self->_clientMetrics, "clearUnknownFields:", 1);
  }
}

- (void)_readClientMetrics
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 360));
    if ((*(_BYTE *)(a1 + 389) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEODirectionsResponseReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readClientMetrics_tags_1);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 360));
  }
}

- (BOOL)hasClientMetrics
{
  -[GEODirectionsResponse _readClientMetrics]((uint64_t)self);
  return self->_clientMetrics != 0;
}

- (GEOClientMetrics)clientMetrics
{
  -[GEODirectionsResponse _readClientMetrics]((uint64_t)self);
  return self->_clientMetrics;
}

- (void)setClientMetrics:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x100000008000uLL;
  objc_storeStrong((id *)&self->_clientMetrics, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_waypointRoutes, 0);
  objc_storeStrong((id *)&self->_tripId, 0);
  objc_storeStrong((id *)&self->_transitRouteUpdateConfiguration, 0);
  objc_storeStrong((id *)&self->_transitPaymentMethodSuggestions, 0);
  objc_storeStrong((id *)&self->_transitIncidentMessage, 0);
  objc_storeStrong((id *)&self->_transitDataVersion, 0);
  objc_storeStrong((id *)&self->_trafficSignals, 0);
  objc_storeStrong((id *)&self->_trafficCameras, 0);
  objc_storeStrong((id *)&self->_suggestedRoutes, 0);
  objc_storeStrong((id *)&self->_styleAttributes, 0);
  objc_storeStrong((id *)&self->_snapScoreMetadataDebug, 0);
  objc_storeStrong((id *)&self->_sessionState, 0);
  objc_storeStrong((id *)&self->_serviceVersion, 0);
  objc_storeStrong((id *)&self->_serviceGaps, 0);
  objc_storeStrong((id *)&self->_routes, 0);
  objc_storeStrong((id *)&self->_responseAttributes, 0);
  objc_storeStrong((id *)&self->_placeSearchResponses, 0);
  objc_storeStrong((id *)&self->_nonRecommendedRoutesCache, 0);
  objc_storeStrong((id *)&self->_internalErrors, 0);
  objc_storeStrong((id *)&self->_incidentsOnRoutes, 0);
  objc_storeStrong((id *)&self->_incidentsOffRoutes, 0);
  objc_storeStrong((id *)&self->_failureAlert, 0);
  objc_storeStrong((id *)&self->_displayHints, 0);
  objc_storeStrong((id *)&self->_directionsResponseID, 0);
  objc_storeStrong((id *)&self->_decoderData, 0);
  objc_storeStrong((id *)&self->_debugData, 0);
  objc_storeStrong((id *)&self->_datasetAbStatus, 0);
  objc_storeStrong((id *)&self->_dataVersion, 0);
  objc_storeStrong((id *)&self->_clientMetrics, 0);
  objc_storeStrong((id *)&self->_arrivalParameters, 0);
  objc_storeStrong((id *)&self->_analyticData, 0);
  objc_storeStrong((id *)&self->_advisoriesInfo, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

- (void)clearLocations
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[GEODirectionsResponse routes](self, "routes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v18;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v18 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v6);
        v13 = 0u;
        v14 = 0u;
        v15 = 0u;
        v16 = 0u;
        objc_msgSend(v7, "guidanceEvents", 0);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v14;
          do
          {
            v12 = 0;
            do
            {
              if (*(_QWORD *)v14 != v11)
                objc_enumerationMutation(v8);
              objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v12++), "setSpokenGuidance:", 0);
            }
            while (v10 != v12);
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
          }
          while (v10);
        }

        ++v6;
      }
      while (v6 != v4);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    }
    while (v4);
  }

}

- (id)preJupiterCompatibleDirectionsResponseWithRoute:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  GEODirectionsResponse *v13;
  NSObject *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  void *v33;
  void *v34;
  uint64_t v35;
  NSObject *v36;
  void *v37;
  int v38;
  void *v39;
  uint64_t v40;
  unint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  unint64_t v45;
  void *v46;
  void *v47;
  uint64_t v48;
  char *v49;
  char *v50;
  _QWORD *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  unint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  unint64_t v62;
  void *v63;
  void *v64;
  double v65;
  double v66;
  uint64_t v67;
  uint64_t v68;
  double v69;
  int v70;
  uint64_t v71;
  double v72;
  int v73;
  void *v74;
  uint64_t v75;
  double v76;
  double v77;
  void *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t j;
  void *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  unint64_t v88;
  void *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t k;
  void *v94;
  void *v95;
  void *v96;
  unint64_t v97;
  GEODirectionsResponse *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  unint64_t v104;
  uint64_t v105;
  unsigned int v106;
  uint64_t v107;
  uint64_t v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  _BYTE v121[128];
  _BYTE v122[128];
  uint8_t v123[128];
  uint8_t buf[4];
  int v125;
  __int16 v126;
  int v127;
  uint64_t v128;

  v128 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "usesZilch"))
  {
LABEL_8:
    v13 = self;
    goto LABEL_63;
  }
  v5 = objc_msgSend(v4, "indexInResponse");
  -[GEODirectionsResponse waypointRoutes](self, "waypointRoutes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v5 >= v7)
  {
    GEOGetCompanionExtrasLog_0();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = objc_msgSend(v4, "indexInResponse");
      -[GEODirectionsResponse waypointRoutes](self, "waypointRoutes");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67109376;
      v125 = v15;
      v126 = 1024;
      v127 = objc_msgSend(v16, "count");
      _os_log_impl(&dword_1885A9000, v14, OS_LOG_TYPE_ERROR, "Error creating backwards compatible directions response. Route's indexInResponse (%d) is greater than the number of routes in response (%d). Returning original response.", buf, 0xEu);

    }
    goto LABEL_8;
  }
  -[GEODirectionsResponse waypointRoutes](self, "waypointRoutes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v4, "indexInResponse"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v100 = v9;
  objc_msgSend(v9, "routeLegs");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "zilchPoints");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v13 = self;
  }
  else
  {
    v99 = (GEODirectionsResponse *)-[GEODirectionsResponse copy](self, "copy");
    -[GEODirectionsResponse waypointRoutes](v99, "waypointRoutes");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectAtIndexedSubscript:", objc_msgSend(v4, "indexInResponse"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "routeLegs");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "count");
    objc_msgSend(v4, "legs");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "count");

    if (v20 != v22)
    {
      GEOGetCompanionExtrasLog_0();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v18, "routeLegs");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "count");
        objc_msgSend(v4, "legs");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 67109376;
        v125 = v25;
        v126 = 1024;
        v127 = objc_msgSend(v26, "count");
        _os_log_impl(&dword_1885A9000, v23, OS_LOG_TYPE_ERROR, "Error creating backwards compatible directions response. Legs count mismatch in directions response (%d legs) and route (%d legs). Attempting to continue anyway like.", buf, 0xEu);

      }
    }
    v119 = 0u;
    v120 = 0u;
    v117 = 0u;
    v118 = 0u;
    objc_msgSend(v18, "routeLegs");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v117, v123, 16);
    if (v28)
    {
      v29 = v28;
      v30 = 0;
      v31 = *(_QWORD *)v118;
      do
      {
        for (i = 0; i != v29; ++i)
        {
          if (*(_QWORD *)v118 != v31)
            objc_enumerationMutation(v27);
          objc_msgSend(*(id *)(*((_QWORD *)&v117 + 1) + 8 * i), "steps");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v30 += objc_msgSend(v33, "count");

        }
        v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v117, v123, 16);
      }
      while (v29);
    }
    else
    {
      v30 = 0;
    }

    objc_msgSend(v4, "steps");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "count");

    if (v30 != v35)
    {
      GEOGetCompanionExtrasLog_0();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v4, "steps");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = objc_msgSend(v37, "count");
        *(_DWORD *)buf = 67109376;
        v125 = v30;
        v126 = 1024;
        v127 = v38;
        _os_log_impl(&dword_1885A9000, v36, OS_LOG_TYPE_ERROR, "Error creating backwards compatible directions response. Steps count mismatch in directions response (%d steps) and route (%d steps). Attempting to continue anyway.", buf, 0xEu);

      }
    }
    objc_msgSend(v18, "routeLegs");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v39, "count");

    if (v40)
    {
      v107 = 0;
      v108 = 0;
      v41 = 0;
      v101 = v18;
      do
      {
        objc_msgSend(v18, "routeLegs");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "objectAtIndexedSubscript:", v41);
        v43 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v4, "legs");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = objc_msgSend(v44, "count");

        if (v41 < v45)
        {
          objc_msgSend(v4, "legs");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v104 = v41;
          objc_msgSend(v46, "objectAtIndexedSubscript:", v41);
          v47 = (void *)objc_claimAutoreleasedReturnValue();

          v103 = v47;
          v48 = objc_msgSend(v47, "pointCount");
          v49 = (char *)malloc_type_malloc(16 * v48, 0x852E71A1uLL);
          v50 = v49;
          if (v48)
          {
            v51 = v49 + 8;
            v52 = v107;
            v53 = v48;
            do
            {
              objc_msgSend(v4, "pointAt:", v52);
              *(v51 - 1) = v54;
              *v51 = v55;
              v51 += 2;
              ++v52;
              --v53;
            }
            while (v53);
          }
          v105 = v48;
          objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", v50, 16 * v48, 1);
          v102 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "setUnpackedLatLngVertices:");
          objc_msgSend(v43, "setBasicPoints:", 0);
          objc_msgSend(v43, "steps");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          v57 = objc_msgSend(v56, "count");

          if (v57)
          {
            v58 = 0;
            v106 = v48 - 1;
            do
            {
              objc_msgSend(v43, "steps");
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v59, "objectAtIndexedSubscript:", v58);
              v60 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v4, "steps");
              v61 = (void *)objc_claimAutoreleasedReturnValue();
              v62 = objc_msgSend(v61, "count");

              if (v58 + v108 < v62)
              {
                objc_msgSend(v4, "steps");
                v63 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v63, "objectAtIndexedSubscript:", v58 + v108);
                v64 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v64, "distance");
                *(float *)&v65 = v65;
                objc_msgSend(v60, "setDistanceMeters:", v65);
                objc_msgSend(v64, "distance");
                LODWORD(v67) = vcvtad_u64_f64(v66);
                objc_msgSend(v60, "setDistance:", v67);
                v68 = objc_msgSend(v64, "maneuverStartRouteCoordinate");
                LODWORD(v69) = HIDWORD(v68);
                v70 = vcvtas_u32_f32((float)v68 + *((float *)&v68 + 1));
                if (*((float *)&v68 + 1) < 0.0)
                  v70 = -1;
                objc_msgSend(v60, "setManeuverStartZilchIndex:", (v70 - v107), v69);
                v71 = objc_msgSend(v64, "endRouteCoordinate");
                LODWORD(v72) = HIDWORD(v71);
                v73 = vcvtas_u32_f32((float)v71 + *((float *)&v71 + 1));
                if (*((float *)&v71 + 1) < 0.0)
                  v73 = -1;
                objc_msgSend(v60, "setManeuverEndZilchIndex:", (v73 - v107), v72);
                objc_msgSend(v43, "steps");
                v74 = (void *)objc_claimAutoreleasedReturnValue();
                v75 = objc_msgSend(v74, "count") - 1;

                if (v58 == v75)
                  objc_msgSend(v60, "setManeuverEndZilchIndex:", v106);
                objc_msgSend(v4, "distanceFromStartToRouteCoordinate:", objc_msgSend(v64, "endRouteCoordinate"));
                v77 = v76;
                v113 = 0u;
                v114 = 0u;
                v115 = 0u;
                v116 = 0u;
                objc_msgSend(v60, "guidanceEvents");
                v78 = (void *)objc_claimAutoreleasedReturnValue();
                v79 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v113, v122, 16);
                if (v79)
                {
                  v80 = v79;
                  v81 = *(_QWORD *)v114;
                  do
                  {
                    for (j = 0; j != v80; ++j)
                    {
                      if (*(_QWORD *)v114 != v81)
                        objc_enumerationMutation(v78);
                      v83 = *(void **)(*((_QWORD *)&v113 + 1) + 8 * j);
                      LODWORD(v84) = vcvtpd_s64_f64(v77 - (float)objc_msgSend(v83, "startValidDistanceOffsetCm")* 0.01);
                      objc_msgSend(v83, "setStartValidDistance:", v84);
                      LODWORD(v85) = vcvtmd_s64_f64(v77 - (float)objc_msgSend(v83, "endValidDistanceOffsetCm")* 0.01);
                      objc_msgSend(v83, "setEndValidDistance:", v85);
                      if (objc_msgSend(v83, "hasDistanceReferenceEndpointOffsetCm"))
                      {
                        LODWORD(v86) = llround(v77+ (float)objc_msgSend(v83, "distanceReferenceEndpointOffsetCm")* -0.01);
                        objc_msgSend(v83, "setOffsetForDistanceString:", v86);
                      }
                      objc_msgSend(v83, "setDistanceZilchIndex:", objc_msgSend(v60, "maneuverEndZilchIndex"));
                    }
                    v80 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v113, v122, 16);
                  }
                  while (v80);
                }

              }
              ++v58;
              objc_msgSend(v43, "steps");
              v87 = (void *)objc_claimAutoreleasedReturnValue();
              v88 = objc_msgSend(v87, "count");

            }
            while (v58 < v88);
          }
          v111 = 0u;
          v112 = 0u;
          v109 = 0u;
          v110 = 0u;
          objc_msgSend(v43, "guidanceEvents");
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          v90 = objc_msgSend(v89, "countByEnumeratingWithState:objects:count:", &v109, v121, 16);
          v18 = v101;
          if (v90)
          {
            v91 = v90;
            v92 = *(_QWORD *)v110;
            do
            {
              for (k = 0; k != v91; ++k)
              {
                if (*(_QWORD *)v110 != v92)
                  objc_enumerationMutation(v89);
                v94 = *(void **)(*((_QWORD *)&v109 + 1) + 8 * k);
                objc_msgSend(v94, "setStartValidDistance:", (int)((float)objc_msgSend(v94, "endValidDistanceOffsetCm") * 0.01));
                objc_msgSend(v94, "setEndValidDistance:", (int)((float)objc_msgSend(v94, "startValidDistanceOffsetCm") * 0.01));
                objc_msgSend(v94, "setDistanceZilchIndex:", (v105 - 1));
              }
              v91 = objc_msgSend(v89, "countByEnumeratingWithState:objects:count:", &v109, v121, 16);
            }
            while (v91);
          }

          v107 += v105;
          objc_msgSend(v43, "steps");
          v95 = (void *)objc_claimAutoreleasedReturnValue();
          v108 += objc_msgSend(v95, "count");

          v41 = v104;
        }

        ++v41;
        objc_msgSend(v18, "routeLegs");
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        v97 = objc_msgSend(v96, "count");

      }
      while (v41 < v97);
    }

    v13 = v99;
  }

LABEL_63:
  return v13;
}

- (void)_clearJupiterFieldsForTesting
{
  uint64_t v2;
  void *v3;
  uint64_t i;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t j;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t k;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t m;
  void *v23;
  id obj;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
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

  v57 = *MEMORY[0x1E0C80C00];
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  -[GEODirectionsResponse waypointRoutes](self, "waypointRoutes");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
  if (v26)
  {
    v25 = *(_QWORD *)v49;
    do
    {
      v2 = 0;
      do
      {
        if (*(_QWORD *)v49 != v25)
          objc_enumerationMutation(obj);
        v27 = v2;
        v3 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * v2);
        v44 = 0u;
        v45 = 0u;
        v46 = 0u;
        v47 = 0u;
        objc_msgSend(v3, "routeLegs");
        v28 = (id)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v44, v55, 16);
        if (v30)
        {
          v29 = *(_QWORD *)v45;
          do
          {
            for (i = 0; i != v30; ++i)
            {
              if (*(_QWORD *)v45 != v29)
                objc_enumerationMutation(v28);
              v5 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
              objc_msgSend(v5, "setPathLeg:", 0);
              v42 = 0u;
              v43 = 0u;
              v40 = 0u;
              v41 = 0u;
              v31 = v5;
              objc_msgSend(v5, "steps");
              v6 = (void *)objc_claimAutoreleasedReturnValue();
              v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v40, v54, 16);
              if (v7)
              {
                v8 = v7;
                v9 = *(_QWORD *)v41;
                do
                {
                  for (j = 0; j != v8; ++j)
                  {
                    if (*(_QWORD *)v41 != v9)
                      objc_enumerationMutation(v6);
                    v11 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * j);
                    objc_msgSend(v11, "setDistanceCm:", 0);
                    objc_msgSend(v11, "setHasDistanceCm:", 0);
                    objc_msgSend(v11, "setManeuverStartPointOffsetCm:", 0);
                    objc_msgSend(v11, "setHasManeuverStartPointOffsetCm:", 0);
                    v38 = 0u;
                    v39 = 0u;
                    v36 = 0u;
                    v37 = 0u;
                    objc_msgSend(v11, "guidanceEvents");
                    v12 = (void *)objc_claimAutoreleasedReturnValue();
                    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v36, v53, 16);
                    if (v13)
                    {
                      v14 = v13;
                      v15 = *(_QWORD *)v37;
                      do
                      {
                        for (k = 0; k != v14; ++k)
                        {
                          if (*(_QWORD *)v37 != v15)
                            objc_enumerationMutation(v12);
                          v17 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * k);
                          objc_msgSend(v17, "setStartValidDistanceOffsetCm:", 0);
                          objc_msgSend(v17, "setHasStartValidDistanceOffsetCm:", 0);
                          objc_msgSend(v17, "setEndValidDistanceOffsetCm:", 0);
                          objc_msgSend(v17, "setHasEndValidDistanceOffsetCm:", 0);
                          objc_msgSend(v17, "setDistanceReferenceEndpointOffsetCm:", 0);
                          objc_msgSend(v17, "setHasDistanceReferenceEndpointOffsetCm:", 0);
                        }
                        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v36, v53, 16);
                      }
                      while (v14);
                    }

                  }
                  v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v40, v54, 16);
                }
                while (v8);
              }

              v34 = 0u;
              v35 = 0u;
              v32 = 0u;
              v33 = 0u;
              objc_msgSend(v31, "guidanceEvents");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v32, v52, 16);
              if (v19)
              {
                v20 = v19;
                v21 = *(_QWORD *)v33;
                do
                {
                  for (m = 0; m != v20; ++m)
                  {
                    if (*(_QWORD *)v33 != v21)
                      objc_enumerationMutation(v18);
                    v23 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * m);
                    objc_msgSend(v23, "setStartValidDistanceOffsetCm:", 0);
                    objc_msgSend(v23, "setHasStartValidDistanceOffsetCm:", 0);
                    objc_msgSend(v23, "setEndValidDistanceOffsetCm:", 0);
                    objc_msgSend(v23, "setHasEndValidDistanceOffsetCm:", 0);
                    objc_msgSend(v23, "setDistanceReferenceEndpointOffsetCm:", 0);
                    objc_msgSend(v23, "setHasDistanceReferenceEndpointOffsetCm:", 0);
                  }
                  v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v32, v52, 16);
                }
                while (v20);
              }

            }
            v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v44, v55, 16);
          }
          while (v30);
        }

        v2 = v27 + 1;
      }
      while (v27 + 1 != v26);
      v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
    }
    while (v26);
  }

}

@end
