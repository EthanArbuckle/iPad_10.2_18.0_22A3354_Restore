@implementation GEOETATrafficUpdateResponse

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
  -[GEOETATrafficUpdateResponse cameras](self, "cameras");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[GEOETATrafficUpdateResponse cameras](self, "cameras", 0);
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
  -[GEOETATrafficUpdateResponse trafficSignals](self, "trafficSignals");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[GEOETATrafficUpdateResponse trafficSignals](self, "trafficSignals", 0);
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

- (GEOETATrafficUpdateResponse)init
{
  GEOETATrafficUpdateResponse *v2;
  GEOETATrafficUpdateResponse *v3;
  GEOETATrafficUpdateResponse *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOETATrafficUpdateResponse;
  v2 = -[GEOETATrafficUpdateResponse init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOETATrafficUpdateResponse)initWithData:(id)a3
{
  GEOETATrafficUpdateResponse *v3;
  GEOETATrafficUpdateResponse *v4;
  GEOETATrafficUpdateResponse *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOETATrafficUpdateResponse;
  v3 = -[GEOETATrafficUpdateResponse initWithData:](&v7, sel_initWithData_, a3);
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

  -[GEOETATrafficUpdateResponse clearProblemDetails](self, "clearProblemDetails");
  v3.receiver = self;
  v3.super_class = (Class)GEOETATrafficUpdateResponse;
  -[GEOETATrafficUpdateResponse dealloc](&v3, sel_dealloc);
}

- (int)status
{
  os_unfair_lock_s *p_readerLock;
  $C15DF3E37EA3BCFA7E57A3C077E4117A flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_BYTE *)&flags & 2) != 0)
    return self->_status;
  else
    return 0;
}

- (void)setStatus:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x20002u;
  self->_status = a3;
}

- (void)setHasStatus:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 131074;
  else
    v3 = 0x20000;
  self->_flags = ($C15DF3E37EA3BCFA7E57A3C077E4117A)(*(_DWORD *)&self->_flags & 0xFFFDFFFD | v3);
}

- (BOOL)hasStatus
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
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
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(_BYTE *)(a1 + 173) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOETATrafficUpdateResponseReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRoutes_tags_1446);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (NSMutableArray)routes
{
  -[GEOETATrafficUpdateResponse _readRoutes]((uint64_t)self);
  return self->_routes;
}

- (void)setRoutes:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *routes;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x1000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x20000u;
  routes = self->_routes;
  self->_routes = v4;

}

- (void)clearRoutes
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x1000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x20000u;
  -[NSMutableArray removeAllObjects](self->_routes, "removeAllObjects");
}

- (void)addRoute:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOETATrafficUpdateResponse _readRoutes]((uint64_t)self);
  -[GEOETATrafficUpdateResponse _addNoFlagsRoute:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x1000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x20000u;
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

- (unint64_t)routesCount
{
  -[GEOETATrafficUpdateResponse _readRoutes]((uint64_t)self);
  return -[NSMutableArray count](self->_routes, "count");
}

- (id)routeAtIndex:(unint64_t)a3
{
  -[GEOETATrafficUpdateResponse _readRoutes]((uint64_t)self);
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
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(_BYTE *)(a1 + 174) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOETATrafficUpdateResponseReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readWaypointRoute_tags_1447);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (BOOL)hasWaypointRoute
{
  -[GEOETATrafficUpdateResponse _readWaypointRoute]((uint64_t)self);
  return self->_waypointRoute != 0;
}

- (GEOETATrafficUpdateWaypointRoute)waypointRoute
{
  -[GEOETATrafficUpdateResponse _readWaypointRoute]((uint64_t)self);
  return self->_waypointRoute;
}

- (void)setWaypointRoute:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x30000u;
  objc_storeStrong((id *)&self->_waypointRoute, a3);
}

- (void)_readSessionState
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(_BYTE *)(a1 + 173) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOETATrafficUpdateResponseReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSessionState_tags_1448);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (BOOL)hasSessionState
{
  -[GEOETATrafficUpdateResponse _readSessionState]((uint64_t)self);
  return self->_sessionState != 0;
}

- (NSData)sessionState
{
  -[GEOETATrafficUpdateResponse _readSessionState]((uint64_t)self);
  return self->_sessionState;
}

- (void)setSessionState:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x22000u;
  objc_storeStrong((id *)&self->_sessionState, a3);
}

- (void)_readDatasetAbStatus
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(_BYTE *)(a1 + 172) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOETATrafficUpdateResponseReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDatasetAbStatus_tags_1449);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (BOOL)hasDatasetAbStatus
{
  -[GEOETATrafficUpdateResponse _readDatasetAbStatus]((uint64_t)self);
  return self->_datasetAbStatus != 0;
}

- (GEOPDDatasetABStatus)datasetAbStatus
{
  -[GEOETATrafficUpdateResponse _readDatasetAbStatus]((uint64_t)self);
  return self->_datasetAbStatus;
}

- (void)setDatasetAbStatus:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x20080u;
  objc_storeStrong((id *)&self->_datasetAbStatus, a3);
}

- (void)_readCameras
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(_BYTE *)(a1 + 172) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOETATrafficUpdateResponseReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCameras_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (NSMutableArray)cameras
{
  -[GEOETATrafficUpdateResponse _readCameras]((uint64_t)self);
  return self->_cameras;
}

- (void)setCameras:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *cameras;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x20000u;
  cameras = self->_cameras;
  self->_cameras = v4;

}

- (void)clearCameras
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x20000u;
  -[NSMutableArray removeAllObjects](self->_cameras, "removeAllObjects");
}

- (void)addCamera:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOETATrafficUpdateResponse _readCameras]((uint64_t)self);
  -[GEOETATrafficUpdateResponse _addNoFlagsCamera:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x20000u;
}

- (void)_addNoFlagsCamera:(uint64_t)a1
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

- (unint64_t)camerasCount
{
  -[GEOETATrafficUpdateResponse _readCameras]((uint64_t)self);
  return -[NSMutableArray count](self->_cameras, "count");
}

- (id)cameraAtIndex:(unint64_t)a3
{
  -[GEOETATrafficUpdateResponse _readCameras]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_cameras, "objectAtIndex:", a3);
}

+ (Class)cameraType
{
  return (Class)objc_opt_class();
}

- (void)_readResponseId
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(_BYTE *)(a1 + 173) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOETATrafficUpdateResponseReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readResponseId_tags_3);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (BOOL)hasResponseId
{
  -[GEOETATrafficUpdateResponse _readResponseId]((uint64_t)self);
  return self->_responseId != 0;
}

- (NSData)responseId
{
  -[GEOETATrafficUpdateResponse _readResponseId]((uint64_t)self);
  return self->_responseId;
}

- (void)setResponseId:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x20800u;
  objc_storeStrong((id *)&self->_responseId, a3);
}

- (void)_readTripId
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(_BYTE *)(a1 + 173) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOETATrafficUpdateResponseReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTripId_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (BOOL)hasTripId
{
  -[GEOETATrafficUpdateResponse _readTripId]((uint64_t)self);
  return self->_tripId != 0;
}

- (GEOUUID)tripId
{
  -[GEOETATrafficUpdateResponse _readTripId]((uint64_t)self);
  return self->_tripId;
}

- (void)setTripId:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x28000u;
  objc_storeStrong((id *)&self->_tripId, a3);
}

- (void)_readDebugData
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(_BYTE *)(a1 + 173) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOETATrafficUpdateResponseReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDebugData_tags_1451);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (BOOL)hasDebugData
{
  -[GEOETATrafficUpdateResponse _readDebugData]((uint64_t)self);
  return self->_debugData != 0;
}

- (NSString)debugData
{
  -[GEOETATrafficUpdateResponse _readDebugData]((uint64_t)self);
  return self->_debugData;
}

- (void)setDebugData:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x20100u;
  objc_storeStrong((id *)&self->_debugData, a3);
}

- (void)_readTrafficSignals
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(_BYTE *)(a1 + 173) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOETATrafficUpdateResponseReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTrafficSignals_tags_1);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (NSMutableArray)trafficSignals
{
  -[GEOETATrafficUpdateResponse _readTrafficSignals]((uint64_t)self);
  return self->_trafficSignals;
}

- (void)setTrafficSignals:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *trafficSignals;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x4000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x20000u;
  trafficSignals = self->_trafficSignals;
  self->_trafficSignals = v4;

}

- (void)clearTrafficSignals
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x4000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x20000u;
  -[NSMutableArray removeAllObjects](self->_trafficSignals, "removeAllObjects");
}

- (void)addTrafficSignal:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOETATrafficUpdateResponse _readTrafficSignals]((uint64_t)self);
  -[GEOETATrafficUpdateResponse _addNoFlagsTrafficSignal:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x4000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x20000u;
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
    v4 = *(void **)(a1 + 128);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 128);
      *(_QWORD *)(a1 + 128) = v5;

      v4 = *(void **)(a1 + 128);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)trafficSignalsCount
{
  -[GEOETATrafficUpdateResponse _readTrafficSignals]((uint64_t)self);
  return -[NSMutableArray count](self->_trafficSignals, "count");
}

- (id)trafficSignalAtIndex:(unint64_t)a3
{
  -[GEOETATrafficUpdateResponse _readTrafficSignals]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_trafficSignals, "objectAtIndex:", a3);
}

+ (Class)trafficSignalType
{
  return (Class)objc_opt_class();
}

- (void)_readArrivalParameters
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(_BYTE *)(a1 + 172) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOETATrafficUpdateResponseReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readArrivalParameters_tags_1);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (NSMutableArray)arrivalParameters
{
  -[GEOETATrafficUpdateResponse _readArrivalParameters]((uint64_t)self);
  return self->_arrivalParameters;
}

- (void)setArrivalParameters:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *arrivalParameters;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x20000u;
  arrivalParameters = self->_arrivalParameters;
  self->_arrivalParameters = v4;

}

- (void)clearArrivalParameters
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x20000u;
  -[NSMutableArray removeAllObjects](self->_arrivalParameters, "removeAllObjects");
}

- (void)addArrivalParameters:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOETATrafficUpdateResponse _readArrivalParameters]((uint64_t)self);
  -[GEOETATrafficUpdateResponse _addNoFlagsArrivalParameters:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x20000u;
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

- (unint64_t)arrivalParametersCount
{
  -[GEOETATrafficUpdateResponse _readArrivalParameters]((uint64_t)self);
  return -[NSMutableArray count](self->_arrivalParameters, "count");
}

- (id)arrivalParametersAtIndex:(unint64_t)a3
{
  -[GEOETATrafficUpdateResponse _readArrivalParameters]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_arrivalParameters, "objectAtIndex:", a3);
}

+ (Class)arrivalParametersType
{
  return (Class)objc_opt_class();
}

- (void)_readProblemDetails
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(_BYTE *)(a1 + 172) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOETATrafficUpdateResponseReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readProblemDetails_tags_1454);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (unint64_t)problemDetailsCount
{
  -[GEOETATrafficUpdateResponse _readProblemDetails]((uint64_t)self);
  return self->_problemDetailsCount;
}

- (GEOProblemDetail)problemDetails
{
  -[GEOETATrafficUpdateResponse _readProblemDetails]((uint64_t)self);
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
    result = (uint64_t)malloc_type_realloc(*(void **)(a1 + 24), 12 * v9, 0x31336121uLL);
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
  *(_DWORD *)&self->_flags |= 8u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x20000u;
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
  -[GEOETATrafficUpdateResponse _readProblemDetails]((uint64_t)self);
  if (self && -[GEOETATrafficUpdateResponse _reserveProblemDetails:]((uint64_t)self, 1uLL))
  {
    v6 = &self->_problemDetails[self->_problemDetailsCount];
    *(_QWORD *)&v6->var0 = v4;
    v6->var2 = var2;
    ++self->_problemDetailsCount;
  }
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x20000u;
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

  -[GEOETATrafficUpdateResponse _readProblemDetails]((uint64_t)self);
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
  *(_DWORD *)&self->_flags |= 8u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x20000u;
  -[GEOETATrafficUpdateResponse clearProblemDetails](self, "clearProblemDetails");
  if (-[GEOETATrafficUpdateResponse _reserveProblemDetails:]((uint64_t)self, a4))
  {
    memcpy(self->_problemDetails, a3, 12 * a4);
    self->_problemDetailsCount = a4;
  }
}

- (unsigned)displayedEta
{
  return self->_displayedEta;
}

- (void)setDisplayedEta:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x20001u;
  self->_displayedEta = a3;
}

- (void)setHasDisplayedEta:(BOOL)a3
{
  self->_flags = ($C15DF3E37EA3BCFA7E57A3C077E4117A)(*(_DWORD *)&self->_flags & 0xFFFFFFFE | a3 | 0x20000);
}

- (BOOL)hasDisplayedEta
{
  return *(_DWORD *)&self->_flags & 1;
}

- (void)_readInternalErrors
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(_BYTE *)(a1 + 173) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOETATrafficUpdateResponseReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readInternalErrors_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (NSMutableArray)internalErrors
{
  -[GEOETATrafficUpdateResponse _readInternalErrors]((uint64_t)self);
  return self->_internalErrors;
}

- (void)setInternalErrors:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *internalErrors;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x200u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x20000u;
  internalErrors = self->_internalErrors;
  self->_internalErrors = v4;

}

- (void)clearInternalErrors
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x200u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x20000u;
  -[NSMutableArray removeAllObjects](self->_internalErrors, "removeAllObjects");
}

- (void)addInternalError:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOETATrafficUpdateResponse _readInternalErrors]((uint64_t)self);
  -[GEOETATrafficUpdateResponse _addNoFlagsInternalError:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x200u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x20000u;
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

- (unint64_t)internalErrorsCount
{
  -[GEOETATrafficUpdateResponse _readInternalErrors]((uint64_t)self);
  return -[NSMutableArray count](self->_internalErrors, "count");
}

- (id)internalErrorAtIndex:(unint64_t)a3
{
  -[GEOETATrafficUpdateResponse _readInternalErrors]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_internalErrors, "objectAtIndex:", a3);
}

+ (Class)internalErrorType
{
  return (Class)objc_opt_class();
}

- (void)_readResponseAttributes
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(_BYTE *)(a1 + 173) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOETATrafficUpdateResponseReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readResponseAttributes_tags_1455);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (BOOL)hasResponseAttributes
{
  -[GEOETATrafficUpdateResponse _readResponseAttributes]((uint64_t)self);
  return self->_responseAttributes != 0;
}

- (GEOCommonResponseAttributes)responseAttributes
{
  -[GEOETATrafficUpdateResponse _readResponseAttributes]((uint64_t)self);
  return self->_responseAttributes;
}

- (void)setResponseAttributes:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x20400u;
  objc_storeStrong((id *)&self->_responseAttributes, a3);
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
  v8.super_class = (Class)GEOETATrafficUpdateResponse;
  -[GEOETATrafficUpdateResponse description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOETATrafficUpdateResponse dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOETATrafficUpdateResponse _dictionaryRepresentation:]((uint64_t)self, 0);
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
  const __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  const __CFString *v40;
  void *v41;
  const __CFString *v42;
  void *v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t k;
  void *v49;
  void *v50;
  const __CFString *v51;
  void *v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t m;
  void *v58;
  void *v59;
  const __CFString *v60;
  void *v61;
  uint64_t v62;
  unint64_t v63;
  void *v64;
  void *v65;
  const __CFString *v66;
  void *v67;
  const __CFString *v68;
  void *v69;
  void *v70;
  void *v71;
  const __CFString *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  id v80;
  id v81;
  _QWORD v83[4];
  id v84;
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
  _BYTE v101[128];
  _BYTE v102[128];
  _BYTE v103[128];
  _BYTE v104[128];
  uint64_t v105;

  v105 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)(a1 + 172) & 2) != 0)
  {
    v5 = *(_DWORD *)(a1 + 168);
    if (v5 <= 29)
    {
      v6 = CFSTR("STATUS_SUCCESS");
      switch(v5)
      {
        case 0:
          goto LABEL_20;
        case 1:
          v6 = CFSTR("STATUS_FAILED");
          break;
        case 2:
          v6 = CFSTR("STATUS_INCOMPLETE");
          break;
        case 3:
        case 4:
          goto LABEL_15;
        case 5:
          v6 = CFSTR("INVALID_REQUEST");
          break;
        default:
          if (v5 != 20)
            goto LABEL_15;
          v6 = CFSTR("FAILED_NO_RESULT");
          break;
      }
      goto LABEL_20;
    }
    if (v5 > 49)
    {
      if (v5 == 50)
      {
        v6 = CFSTR("STATUS_DEDUPED");
        goto LABEL_20;
      }
      if (v5 == 60)
      {
        v6 = CFSTR("VERSION_MISMATCH");
        goto LABEL_20;
      }
    }
    else
    {
      if (v5 == 30)
      {
        v6 = CFSTR("NEEDS_REFINEMENT");
        goto LABEL_20;
      }
      if (v5 == 40)
      {
        v6 = CFSTR("FAILED_NOT_AUTHORIZED");
LABEL_20:
        objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("status"));

        goto LABEL_21;
      }
    }
LABEL_15:
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 168));
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_20;
  }
LABEL_21:
  if (objc_msgSend(*(id *)(a1 + 112), "count"))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 112), "count"));
    v97 = 0u;
    v98 = 0u;
    v99 = 0u;
    v100 = 0u;
    v8 = *(id *)(a1 + 112);
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v97, v104, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v98;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v98 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v97 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v13, "jsonRepresentation");
          else
            objc_msgSend(v13, "dictionaryRepresentation");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v14);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v97, v104, 16);
      }
      while (v10);
    }

    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("route"));
  }
  objc_msgSend((id)a1, "waypointRoute");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v15, "jsonRepresentation");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = CFSTR("waypointRoute");
    }
    else
    {
      objc_msgSend(v15, "dictionaryRepresentation");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = CFSTR("waypoint_route");
    }
    objc_msgSend(v4, "setObject:forKey:", v17, v18);

  }
  objc_msgSend((id)a1, "sessionState");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v19)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v19, "base64EncodedStringWithOptions:", 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v21, CFSTR("sessionState"));

    }
    else
    {
      objc_msgSend(v4, "setObject:forKey:", v19, CFSTR("session_state"));
    }
  }

  objc_msgSend((id)a1, "datasetAbStatus");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22;
  if (v22)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v22, "jsonRepresentation");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = CFSTR("datasetAbStatus");
    }
    else
    {
      objc_msgSend(v22, "dictionaryRepresentation");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = CFSTR("dataset_ab_status");
    }
    objc_msgSend(v4, "setObject:forKey:", v24, v25);

  }
  if (objc_msgSend(*(id *)(a1 + 56), "count"))
  {
    v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 56), "count"));
    v93 = 0u;
    v94 = 0u;
    v95 = 0u;
    v96 = 0u;
    v27 = *(id *)(a1 + 56);
    v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v93, v103, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v94;
      do
      {
        for (j = 0; j != v29; ++j)
        {
          if (*(_QWORD *)v94 != v30)
            objc_enumerationMutation(v27);
          v32 = *(void **)(*((_QWORD *)&v93 + 1) + 8 * j);
          if ((a2 & 1) != 0)
            objc_msgSend(v32, "jsonRepresentation");
          else
            objc_msgSend(v32, "dictionaryRepresentation");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "addObject:", v33);

        }
        v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v93, v103, 16);
      }
      while (v29);
    }

    objc_msgSend(v4, "setObject:forKey:", v26, CFSTR("camera"));
  }
  objc_msgSend((id)a1, "responseId");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v34;
  if (v34)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v34, "base64EncodedStringWithOptions:", 0);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v36, CFSTR("responseId"));

    }
    else
    {
      objc_msgSend(v4, "setObject:forKey:", v34, CFSTR("response_id"));
    }
  }

  objc_msgSend((id)a1, "tripId");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v37;
  if (v37)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v37, "jsonRepresentation");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = CFSTR("tripId");
    }
    else
    {
      objc_msgSend(v37, "dictionaryRepresentation");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = CFSTR("trip_id");
    }
    objc_msgSend(v4, "setObject:forKey:", v39, v40);

  }
  objc_msgSend((id)a1, "debugData");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  if (v41)
  {
    if (a2)
      v42 = CFSTR("debugData");
    else
      v42 = CFSTR("debug_data");
    objc_msgSend(v4, "setObject:forKey:", v41, v42);
  }

  if (objc_msgSend(*(id *)(a1 + 128), "count"))
  {
    v43 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 128), "count"));
    v89 = 0u;
    v90 = 0u;
    v91 = 0u;
    v92 = 0u;
    v44 = *(id *)(a1 + 128);
    v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v89, v102, 16);
    if (v45)
    {
      v46 = v45;
      v47 = *(_QWORD *)v90;
      do
      {
        for (k = 0; k != v46; ++k)
        {
          if (*(_QWORD *)v90 != v47)
            objc_enumerationMutation(v44);
          v49 = *(void **)(*((_QWORD *)&v89 + 1) + 8 * k);
          if ((a2 & 1) != 0)
            objc_msgSend(v49, "jsonRepresentation");
          else
            objc_msgSend(v49, "dictionaryRepresentation");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "addObject:", v50);

        }
        v46 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v89, v102, 16);
      }
      while (v46);
    }

    if (a2)
      v51 = CFSTR("trafficSignal");
    else
      v51 = CFSTR("traffic_signal");
    objc_msgSend(v4, "setObject:forKey:", v43, v51);

  }
  if (objc_msgSend(*(id *)(a1 + 48), "count"))
  {
    v52 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
    v85 = 0u;
    v86 = 0u;
    v87 = 0u;
    v88 = 0u;
    v53 = *(id *)(a1 + 48);
    v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v85, v101, 16);
    if (v54)
    {
      v55 = v54;
      v56 = *(_QWORD *)v86;
      do
      {
        for (m = 0; m != v55; ++m)
        {
          if (*(_QWORD *)v86 != v56)
            objc_enumerationMutation(v53);
          v58 = *(void **)(*((_QWORD *)&v85 + 1) + 8 * m);
          if ((a2 & 1) != 0)
            objc_msgSend(v58, "jsonRepresentation");
          else
            objc_msgSend(v58, "dictionaryRepresentation");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "addObject:", v59);

        }
        v55 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v85, v101, 16);
      }
      while (v55);
    }

    if (a2)
      v60 = CFSTR("arrivalParameters");
    else
      v60 = CFSTR("arrival_parameters");
    objc_msgSend(v4, "setObject:forKey:", v52, v60);

  }
  if (*(_QWORD *)(a1 + 32))
  {
    v61 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", *(_QWORD *)(a1 + 32));
    if (*(_QWORD *)(a1 + 32))
    {
      v62 = 0;
      v63 = 0;
      do
      {
        _GEOProblemDetailDictionaryRepresentation((unsigned int *)(*(_QWORD *)(a1 + 24) + v62));
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "addObject:", v64);

        ++v63;
        v62 += 12;
      }
      while (v63 < *(_QWORD *)(a1 + 32));
    }
    objc_msgSend(v4, "setObject:forKey:", v61, CFSTR("problemDetail"));

  }
  if ((*(_BYTE *)(a1 + 172) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 164));
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v66 = CFSTR("displayedEta");
    else
      v66 = CFSTR("displayed_eta");
    objc_msgSend(v4, "setObject:forKey:", v65, v66);

  }
  if (*(_QWORD *)(a1 + 88))
  {
    objc_msgSend((id)a1, "internalErrors");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v68 = CFSTR("internalError");
    else
      v68 = CFSTR("internal_error");
    objc_msgSend(v4, "setObject:forKey:", v67, v68);

  }
  objc_msgSend((id)a1, "responseAttributes");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = v69;
  if (v69)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v69, "jsonRepresentation");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      v72 = CFSTR("responseAttributes");
    }
    else
    {
      objc_msgSend(v69, "dictionaryRepresentation");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      v72 = CFSTR("response_attributes");
    }
    objc_msgSend(v4, "setObject:forKey:", v71, v72);

  }
  objc_msgSend((id)a1, "clientMetrics");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = v73;
  if (v73)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v73, "jsonRepresentation");
    else
      objc_msgSend(v73, "dictionaryRepresentation");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v75, CFSTR("clientMetrics"));

  }
  v76 = *(void **)(a1 + 16);
  if (v76)
  {
    objc_msgSend(v76, "dictionaryRepresentation");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v78 = v77;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v77, "count"));
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      v83[0] = MEMORY[0x1E0C809B0];
      v83[1] = 3221225472;
      v83[2] = __57__GEOETATrafficUpdateResponse__dictionaryRepresentation___block_invoke;
      v83[3] = &unk_1E1C00600;
      v80 = v79;
      v84 = v80;
      objc_msgSend(v78, "enumerateKeysAndObjectsUsingBlock:", v83);
      v81 = v80;

      v78 = v81;
    }
    objc_msgSend(v4, "setObject:forKey:", v78, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOETATrafficUpdateResponse _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __57__GEOETATrafficUpdateResponse__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOETATrafficUpdateResponse)initWithDictionary:(id)a3
{
  return (GEOETATrafficUpdateResponse *)-[GEOETATrafficUpdateResponse _initWithDictionary:isJSON:](self, a3, 0);
}

- (id)_initWithDictionary:(int)a3 isJSON:
{
  unint64_t v3;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  GEOETARoute *v16;
  uint64_t v17;
  const __CFString *v18;
  void *v19;
  GEOETATrafficUpdateWaypointRoute *v20;
  uint64_t v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  GEOPDDatasetABStatus *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
  GEOTrafficCamera *v37;
  uint64_t v38;
  const __CFString *v39;
  void *v40;
  void *v41;
  const __CFString *v42;
  void *v43;
  GEOUUID *v44;
  void *v45;
  const __CFString *v46;
  void *v47;
  void *v48;
  const __CFString *v49;
  void *v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t k;
  GEOTrafficSignal *v56;
  uint64_t v57;
  const __CFString *v58;
  void *v59;
  id v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t m;
  GEOArrivalParameters *v65;
  uint64_t v66;
  void *v67;
  id v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t n;
  void *v73;
  const __CFString *v74;
  void *v75;
  const __CFString *v76;
  void *v77;
  id v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t ii;
  void *v83;
  void *v84;
  const __CFString *v85;
  void *v86;
  GEOCommonResponseAttributes *v87;
  uint64_t v88;
  void *v89;
  void *v90;
  GEOClientMetrics *v91;
  uint64_t v92;
  void *v93;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  id v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  uint64_t v104;
  unsigned int v105;
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
  _BYTE v126[128];
  _BYTE v127[128];
  _BYTE v128[128];
  _BYTE v129[128];
  _BYTE v130[128];
  _BYTE v131[128];
  uint64_t v132;

  v132 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  if (!a1)
    goto LABEL_171;
  a1 = (id)objc_msgSend(a1, "init");

  if (!a1)
    goto LABEL_171;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("status"));
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

    goto LABEL_26;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = objc_msgSend(v7, "intValue");
LABEL_26:
    objc_msgSend(a1, "setStatus:", v9);
  }

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("route"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v99 = v6;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v124 = 0u;
    v125 = 0u;
    v122 = 0u;
    v123 = 0u;
    v95 = v10;
    v11 = v10;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v122, v131, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v123;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v123 != v14)
            objc_enumerationMutation(v11);
          v3 = *(_QWORD *)(*((_QWORD *)&v122 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v16 = [GEOETARoute alloc];
            if ((a3 & 1) != 0)
              v17 = -[GEOETARoute initWithJSON:](v16, "initWithJSON:", v3);
            else
              v17 = -[GEOETARoute initWithDictionary:](v16, "initWithDictionary:", v3);
            v3 = v17;
            objc_msgSend(a1, "addRoute:", v17, v95);

          }
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v122, v131, 16);
      }
      while (v13);
    }

    v10 = v95;
  }

  if (a3)
    v18 = CFSTR("waypointRoute");
  else
    v18 = CFSTR("waypoint_route");
  objc_msgSend(v6, "objectForKeyedSubscript:", v18, v95);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v20 = [GEOETATrafficUpdateWaypointRoute alloc];
    if ((a3 & 1) != 0)
      v21 = -[GEOETATrafficUpdateWaypointRoute initWithJSON:](v20, "initWithJSON:", v19);
    else
      v21 = -[GEOETATrafficUpdateWaypointRoute initWithDictionary:](v20, "initWithDictionary:", v19);
    v22 = (void *)v21;
    objc_msgSend(a1, "setWaypointRoute:", v21);

  }
  if (a3)
    v23 = CFSTR("sessionState");
  else
    v23 = CFSTR("session_state");
  objc_msgSend(v6, "objectForKeyedSubscript:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v24, 0);
    objc_msgSend(a1, "setSessionState:", v25);

  }
  if (a3)
    v26 = CFSTR("datasetAbStatus");
  else
    v26 = CFSTR("dataset_ab_status");
  objc_msgSend(v6, "objectForKeyedSubscript:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v28 = [GEOPDDatasetABStatus alloc];
    if ((a3 & 1) != 0)
      v29 = -[GEOPDDatasetABStatus initWithJSON:](v28, "initWithJSON:", v27);
    else
      v29 = -[GEOPDDatasetABStatus initWithDictionary:](v28, "initWithDictionary:", v27);
    v30 = (void *)v29;
    objc_msgSend(a1, "setDatasetAbStatus:", v29);

  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("camera"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v120 = 0u;
    v121 = 0u;
    v118 = 0u;
    v119 = 0u;
    v96 = v31;
    v32 = v31;
    v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v118, v130, 16);
    if (v33)
    {
      v34 = v33;
      v35 = *(_QWORD *)v119;
      do
      {
        for (j = 0; j != v34; ++j)
        {
          if (*(_QWORD *)v119 != v35)
            objc_enumerationMutation(v32);
          v3 = *(_QWORD *)(*((_QWORD *)&v118 + 1) + 8 * j);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v37 = [GEOTrafficCamera alloc];
            if ((a3 & 1) != 0)
              v38 = -[GEOTrafficCamera initWithJSON:](v37, "initWithJSON:", v3);
            else
              v38 = -[GEOTrafficCamera initWithDictionary:](v37, "initWithDictionary:", v3);
            v3 = v38;
            objc_msgSend(a1, "addCamera:", v38, v96);

          }
        }
        v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v118, v130, 16);
      }
      while (v34);
    }

    v31 = v96;
  }

  if (a3)
    v39 = CFSTR("responseId");
  else
    v39 = CFSTR("response_id");
  objc_msgSend(v6, "objectForKeyedSubscript:", v39, v96);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v40, 0);
    objc_msgSend(a1, "setResponseId:", v41);

  }
  if (a3)
    v42 = CFSTR("tripId");
  else
    v42 = CFSTR("trip_id");
  objc_msgSend(v6, "objectForKeyedSubscript:", v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v44 = [GEOUUID alloc];
    if (v44)
      v45 = (void *)-[GEOUUID _initWithDictionary:isJSON:]((uint64_t)v44, v43);
    else
      v45 = 0;
    objc_msgSend(a1, "setTripId:", v45);

  }
  if (a3)
    v46 = CFSTR("debugData");
  else
    v46 = CFSTR("debug_data");
  objc_msgSend(v6, "objectForKeyedSubscript:", v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v48 = (void *)objc_msgSend(v47, "copy");
    objc_msgSend(a1, "setDebugData:", v48);

  }
  if (a3)
    v49 = CFSTR("trafficSignal");
  else
    v49 = CFSTR("traffic_signal");
  objc_msgSend(v6, "objectForKeyedSubscript:", v49);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v116 = 0u;
    v117 = 0u;
    v114 = 0u;
    v115 = 0u;
    v97 = v50;
    v51 = v50;
    v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v114, v129, 16);
    if (v52)
    {
      v53 = v52;
      v54 = *(_QWORD *)v115;
      do
      {
        for (k = 0; k != v53; ++k)
        {
          if (*(_QWORD *)v115 != v54)
            objc_enumerationMutation(v51);
          v3 = *(_QWORD *)(*((_QWORD *)&v114 + 1) + 8 * k);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v56 = [GEOTrafficSignal alloc];
            if ((a3 & 1) != 0)
              v57 = -[GEOTrafficSignal initWithJSON:](v56, "initWithJSON:", v3);
            else
              v57 = -[GEOTrafficSignal initWithDictionary:](v56, "initWithDictionary:", v3);
            v3 = v57;
            objc_msgSend(a1, "addTrafficSignal:", v57, v97);

          }
        }
        v53 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v114, v129, 16);
      }
      while (v53);
    }

    v50 = v97;
  }

  if (a3)
    v58 = CFSTR("arrivalParameters");
  else
    v58 = CFSTR("arrival_parameters");
  objc_msgSend(v6, "objectForKeyedSubscript:", v58, v97);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v112 = 0u;
    v113 = 0u;
    v110 = 0u;
    v111 = 0u;
    v98 = v59;
    v60 = v59;
    v61 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v110, v128, 16);
    if (v61)
    {
      v62 = v61;
      v63 = *(_QWORD *)v111;
      do
      {
        for (m = 0; m != v62; ++m)
        {
          if (*(_QWORD *)v111 != v63)
            objc_enumerationMutation(v60);
          v3 = *(_QWORD *)(*((_QWORD *)&v110 + 1) + 8 * m);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v65 = [GEOArrivalParameters alloc];
            if ((a3 & 1) != 0)
              v66 = -[GEOArrivalParameters initWithJSON:](v65, "initWithJSON:", v3);
            else
              v66 = -[GEOArrivalParameters initWithDictionary:](v65, "initWithDictionary:", v3);
            v3 = v66;
            objc_msgSend(a1, "addArrivalParameters:", v66, v98);

          }
        }
        v62 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v110, v128, 16);
      }
      while (v62);
    }

    v59 = v98;
  }

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("problemDetail"));
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v108 = 0u;
    v109 = 0u;
    v106 = 0u;
    v107 = 0u;
    v98 = v67;
    v68 = v67;
    v69 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v106, v127, 16);
    if (v69)
    {
      v70 = v69;
      v71 = *(_QWORD *)v107;
      do
      {
        for (n = 0; n != v70; ++n)
        {
          if (*(_QWORD *)v107 != v71)
            objc_enumerationMutation(v68);
          v73 = *(void **)(*((_QWORD *)&v106 + 1) + 8 * n);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v105 = 0;
            v104 = 0;
            _GEOProblemDetailFromDictionaryRepresentation(v73, (uint64_t)&v104);
            v3 = v3 & 0xFFFFFFFF00000000 | v105;
            objc_msgSend(a1, "addProblemDetail:", v104, v3);
          }
        }
        v70 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v106, v127, 16);
      }
      while (v70);
    }

    v67 = v98;
    v6 = v99;
  }

  if (a3)
    v74 = CFSTR("displayedEta");
  else
    v74 = CFSTR("displayed_eta");
  objc_msgSend(v6, "objectForKeyedSubscript:", v74, v98);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setDisplayedEta:", objc_msgSend(v75, "unsignedIntValue"));

  if (a3)
    v76 = CFSTR("internalError");
  else
    v76 = CFSTR("internal_error");
  objc_msgSend(v6, "objectForKeyedSubscript:", v76);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v102 = 0u;
    v103 = 0u;
    v100 = 0u;
    v101 = 0u;
    v78 = v77;
    v79 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v100, v126, 16);
    if (v79)
    {
      v80 = v79;
      v81 = *(_QWORD *)v101;
      do
      {
        for (ii = 0; ii != v80; ++ii)
        {
          if (*(_QWORD *)v101 != v81)
            objc_enumerationMutation(v78);
          v83 = *(void **)(*((_QWORD *)&v100 + 1) + 8 * ii);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v84 = (void *)objc_msgSend(v83, "copy");
            objc_msgSend(a1, "addInternalError:", v84);

          }
        }
        v80 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v100, v126, 16);
      }
      while (v80);
    }

    v6 = v99;
  }

  if (a3)
    v85 = CFSTR("responseAttributes");
  else
    v85 = CFSTR("response_attributes");
  objc_msgSend(v6, "objectForKeyedSubscript:", v85);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v87 = [GEOCommonResponseAttributes alloc];
    if ((a3 & 1) != 0)
      v88 = -[GEOCommonResponseAttributes initWithJSON:](v87, "initWithJSON:", v86);
    else
      v88 = -[GEOCommonResponseAttributes initWithDictionary:](v87, "initWithDictionary:", v86);
    v89 = (void *)v88;
    objc_msgSend(a1, "setResponseAttributes:", v88);

  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("clientMetrics"));
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v91 = [GEOClientMetrics alloc];
    if ((a3 & 1) != 0)
      v92 = -[GEOClientMetrics initWithJSON:](v91, "initWithJSON:", v90);
    else
      v92 = -[GEOClientMetrics initWithDictionary:](v91, "initWithDictionary:", v90);
    v93 = (void *)v92;
    objc_msgSend(a1, "setClientMetrics:", v92);

  }
  a1 = a1;

LABEL_171:
  return a1;
}

- (GEOETATrafficUpdateResponse)initWithJSON:(id)a3
{
  return (GEOETATrafficUpdateResponse *)-[GEOETATrafficUpdateResponse _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_1479;
    else
      v8 = (int *)&readAll__nonRecursiveTag_1480;
    GEOETATrafficUpdateResponseReadSpecified((uint64_t)self, (uint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEOETATrafficUpdateResponseCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOETATrafficUpdateResponseIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOETATrafficUpdateResponseReadAllFrom((uint64_t)self, a3, 0);
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
  NSMutableArray *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  NSMutableArray *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  PBDataReader *v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;
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
  _BYTE v51[128];
  _BYTE v52[128];
  _BYTE v53[128];
  _BYTE v54[128];
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOETATrafficUpdateResponseIsDirty((uint64_t)self) & 1) == 0)
  {
    v28 = self->_reader;
    objc_sync_enter(v28);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v29);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v28);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOETATrafficUpdateResponse readAll:](self, "readAll:", 0);
    if ((*(_BYTE *)&self->_flags & 2) != 0)
      PBDataWriterWriteInt32Field();
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    v6 = self->_routes;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v48;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v48 != v8)
            objc_enumerationMutation(v6);
          PBDataWriterWriteSubmessage();
          ++v9;
        }
        while (v7 != v9);
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
      }
      while (v7);
    }

    if (self->_waypointRoute)
      PBDataWriterWriteSubmessage();
    if (self->_sessionState)
      PBDataWriterWriteDataField();
    if (self->_datasetAbStatus)
      PBDataWriterWriteSubmessage();
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v10 = self->_cameras;
    v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v43, v54, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v44;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v44 != v12)
            objc_enumerationMutation(v10);
          PBDataWriterWriteSubmessage();
          ++v13;
        }
        while (v11 != v13);
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v43, v54, 16);
      }
      while (v11);
    }

    if (self->_responseId)
      PBDataWriterWriteDataField();
    if (self->_tripId)
      PBDataWriterWriteSubmessage();
    if (self->_debugData)
      PBDataWriterWriteStringField();
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v14 = self->_trafficSignals;
    v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v39, v53, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v40;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v40 != v16)
            objc_enumerationMutation(v14);
          PBDataWriterWriteSubmessage();
          ++v17;
        }
        while (v15 != v17);
        v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v39, v53, 16);
      }
      while (v15);
    }

    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v18 = self->_arrivalParameters;
    v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v35, v52, 16);
    if (v19)
    {
      v20 = *(_QWORD *)v36;
      do
      {
        v21 = 0;
        do
        {
          if (*(_QWORD *)v36 != v20)
            objc_enumerationMutation(v18);
          PBDataWriterWriteSubmessage();
          ++v21;
        }
        while (v19 != v21);
        v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v35, v52, 16);
      }
      while (v19);
    }

    if (self->_problemDetailsCount)
    {
      v22 = 0;
      v23 = 0;
      do
      {
        v34 = 0;
        PBDataWriterPlaceMark();
        GEOProblemDetailWriteTo((uint64_t)&self->_problemDetails[v22]);
        PBDataWriterRecallMark();
        ++v23;
        ++v22;
      }
      while (v23 < self->_problemDetailsCount);
    }
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      PBDataWriterWriteUint32Field();
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v24 = self->_internalErrors;
    v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v30, v51, 16);
    if (v25)
    {
      v26 = *(_QWORD *)v31;
      do
      {
        v27 = 0;
        do
        {
          if (*(_QWORD *)v31 != v26)
            objc_enumerationMutation(v24);
          PBDataWriterWriteStringField();
          ++v27;
        }
        while (v25 != v27);
        v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v30, v51, 16);
      }
      while (v25);
    }

    if (self->_responseAttributes)
      PBDataWriterWriteSubmessage();
    if (self->_clientMetrics)
      PBDataWriterWriteSubmessage();
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v30);
  }

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
  -[GEOETATrafficUpdateResponse _readArrivalParameters]((uint64_t)self);
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v5 = self->_arrivalParameters;
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
        break;
      if (v7 == ++v9)
      {
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v35, v42, 16);
        if (v7)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:

    -[GEOETATrafficUpdateResponse _readCameras]((uint64_t)self);
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v5 = self->_cameras;
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
          break;
        if (v11 == ++v13)
        {
          v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v31, v41, 16);
          if (v11)
            goto LABEL_11;
          goto LABEL_17;
        }
      }
    }
    else
    {
LABEL_17:

      -[GEOETATrafficUpdateResponse _readRoutes]((uint64_t)self);
      v29 = 0u;
      v30 = 0u;
      v27 = 0u;
      v28 = 0u;
      v5 = self->_routes;
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
            break;
          if (v15 == ++v17)
          {
            v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v27, v40, 16);
            if (v15)
              goto LABEL_19;
            goto LABEL_25;
          }
        }
      }
      else
      {
LABEL_25:

        -[GEOETATrafficUpdateResponse _readTrafficSignals]((uint64_t)self);
        v25 = 0u;
        v26 = 0u;
        v23 = 0u;
        v24 = 0u;
        v5 = self->_trafficSignals;
        v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v23, v39, 16);
        if (!v18)
        {
LABEL_33:

          -[GEOETATrafficUpdateResponse _readWaypointRoute]((uint64_t)self);
          return -[GEOETATrafficUpdateWaypointRoute hasGreenTeaWithValue:](self->_waypointRoute, "hasGreenTeaWithValue:", v3);
        }
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
      }
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
  unint64_t v16;
  unint64_t v17;
  uint64_t m;
  void *v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t n;
  uint64_t v23;
  unsigned int v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t ii;
  void *v28;
  id *v29;
  id *v30;

  v30 = (id *)a3;
  -[GEOETATrafficUpdateResponse readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v30 + 1, self->_reader);
  *((_DWORD *)v30 + 38) = self->_readerMarkPos;
  *((_DWORD *)v30 + 39) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    *((_DWORD *)v30 + 42) = self->_status;
    *((_DWORD *)v30 + 43) |= 2u;
  }
  if (-[GEOETATrafficUpdateResponse routesCount](self, "routesCount"))
  {
    objc_msgSend(v30, "clearRoutes");
    v4 = -[GEOETATrafficUpdateResponse routesCount](self, "routesCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[GEOETATrafficUpdateResponse routeAtIndex:](self, "routeAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "addRoute:", v7);

      }
    }
  }
  if (self->_waypointRoute)
    objc_msgSend(v30, "setWaypointRoute:");
  if (self->_sessionState)
    objc_msgSend(v30, "setSessionState:");
  if (self->_datasetAbStatus)
    objc_msgSend(v30, "setDatasetAbStatus:");
  if (-[GEOETATrafficUpdateResponse camerasCount](self, "camerasCount"))
  {
    objc_msgSend(v30, "clearCameras");
    v8 = -[GEOETATrafficUpdateResponse camerasCount](self, "camerasCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
      {
        -[GEOETATrafficUpdateResponse cameraAtIndex:](self, "cameraAtIndex:", j);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "addCamera:", v11);

      }
    }
  }
  if (self->_responseId)
    objc_msgSend(v30, "setResponseId:");
  if (self->_tripId)
    objc_msgSend(v30, "setTripId:");
  if (self->_debugData)
    objc_msgSend(v30, "setDebugData:");
  if (-[GEOETATrafficUpdateResponse trafficSignalsCount](self, "trafficSignalsCount"))
  {
    objc_msgSend(v30, "clearTrafficSignals");
    v12 = -[GEOETATrafficUpdateResponse trafficSignalsCount](self, "trafficSignalsCount");
    if (v12)
    {
      v13 = v12;
      for (k = 0; k != v13; ++k)
      {
        -[GEOETATrafficUpdateResponse trafficSignalAtIndex:](self, "trafficSignalAtIndex:", k);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "addTrafficSignal:", v15);

      }
    }
  }
  if (-[GEOETATrafficUpdateResponse arrivalParametersCount](self, "arrivalParametersCount"))
  {
    objc_msgSend(v30, "clearArrivalParameters");
    v16 = -[GEOETATrafficUpdateResponse arrivalParametersCount](self, "arrivalParametersCount");
    if (v16)
    {
      v17 = v16;
      for (m = 0; m != v17; ++m)
      {
        -[GEOETATrafficUpdateResponse arrivalParametersAtIndex:](self, "arrivalParametersAtIndex:", m);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "addArrivalParameters:", v19);

      }
    }
  }
  if (-[GEOETATrafficUpdateResponse problemDetailsCount](self, "problemDetailsCount"))
  {
    objc_msgSend(v30, "clearProblemDetails");
    v20 = -[GEOETATrafficUpdateResponse problemDetailsCount](self, "problemDetailsCount");
    if (v20)
    {
      v21 = v20;
      for (n = 0; n != v21; ++n)
      {
        v23 = -[GEOETATrafficUpdateResponse problemDetailAtIndex:](self, "problemDetailAtIndex:", n);
        objc_msgSend(v30, "addProblemDetail:", v23, v24);
      }
    }
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *((_DWORD *)v30 + 41) = self->_displayedEta;
    *((_DWORD *)v30 + 43) |= 1u;
  }
  if (-[GEOETATrafficUpdateResponse internalErrorsCount](self, "internalErrorsCount"))
  {
    objc_msgSend(v30, "clearInternalErrors");
    v25 = -[GEOETATrafficUpdateResponse internalErrorsCount](self, "internalErrorsCount");
    if (v25)
    {
      v26 = v25;
      for (ii = 0; ii != v26; ++ii)
      {
        -[GEOETATrafficUpdateResponse internalErrorAtIndex:](self, "internalErrorAtIndex:", ii);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "addInternalError:", v28);

      }
    }
  }
  if (self->_responseAttributes)
    objc_msgSend(v30, "setResponseAttributes:");
  v29 = v30;
  if (self->_clientMetrics)
  {
    objc_msgSend(v30, "setClientMetrics:");
    v29 = v30;
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
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  NSMutableArray *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  uint64_t v25;
  void *v26;
  id v27;
  void *v28;
  uint64_t v29;
  void *v30;
  NSMutableArray *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t k;
  void *v35;
  NSMutableArray *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t m;
  void *v40;
  unint64_t problemDetailsCount;
  NSMutableArray *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t n;
  void *v46;
  id v47;
  void *v48;
  id v49;
  void *v50;
  PBUnknownFields *v51;
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
  _BYTE v73[128];
  _BYTE v74[128];
  _BYTE v75[128];
  _BYTE v76[128];
  _BYTE v77[128];
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*((_BYTE *)&self->_flags + 2) & 2) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOETATrafficUpdateResponseReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_47;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOETATrafficUpdateResponse readAll:](self, "readAll:", 0);
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 168) = self->_status;
    *(_DWORD *)(v5 + 172) |= 2u;
  }
  v71 = 0u;
  v72 = 0u;
  v69 = 0u;
  v70 = 0u;
  v9 = self->_routes;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v69, v77, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v70;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v70 != v11)
          objc_enumerationMutation(v9);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v69 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addRoute:", v13);

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v69, v77, 16);
    }
    while (v10);
  }

  v14 = -[GEOETATrafficUpdateWaypointRoute copyWithZone:](self->_waypointRoute, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 144);
  *(_QWORD *)(v5 + 144) = v14;

  v16 = -[NSData copyWithZone:](self->_sessionState, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 120);
  *(_QWORD *)(v5 + 120) = v16;

  v18 = -[GEOPDDatasetABStatus copyWithZone:](self->_datasetAbStatus, "copyWithZone:", a3);
  v19 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v18;

  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  v20 = self->_cameras;
  v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v65, v76, 16);
  if (v21)
  {
    v22 = *(_QWORD *)v66;
    do
    {
      for (j = 0; j != v21; ++j)
      {
        if (*(_QWORD *)v66 != v22)
          objc_enumerationMutation(v20);
        v24 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v65 + 1) + 8 * j), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addCamera:", v24);

      }
      v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v65, v76, 16);
    }
    while (v21);
  }

  v25 = -[NSData copyWithZone:](self->_responseId, "copyWithZone:", a3);
  v26 = *(void **)(v5 + 104);
  *(_QWORD *)(v5 + 104) = v25;

  v27 = -[GEOUUID copyWithZone:](self->_tripId, "copyWithZone:", a3);
  v28 = *(void **)(v5 + 136);
  *(_QWORD *)(v5 + 136) = v27;

  v29 = -[NSString copyWithZone:](self->_debugData, "copyWithZone:", a3);
  v30 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v29;

  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  v31 = self->_trafficSignals;
  v32 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v61, v75, 16);
  if (v32)
  {
    v33 = *(_QWORD *)v62;
    do
    {
      for (k = 0; k != v32; ++k)
      {
        if (*(_QWORD *)v62 != v33)
          objc_enumerationMutation(v31);
        v35 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v61 + 1) + 8 * k), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addTrafficSignal:", v35);

      }
      v32 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v61, v75, 16);
    }
    while (v32);
  }

  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  v36 = self->_arrivalParameters;
  v37 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v36, "countByEnumeratingWithState:objects:count:", &v57, v74, 16);
  if (v37)
  {
    v38 = *(_QWORD *)v58;
    do
    {
      for (m = 0; m != v37; ++m)
      {
        if (*(_QWORD *)v58 != v38)
          objc_enumerationMutation(v36);
        v40 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v57 + 1) + 8 * m), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addArrivalParameters:", v40);

      }
      v37 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v36, "countByEnumeratingWithState:objects:count:", &v57, v74, 16);
    }
    while (v37);
  }

  problemDetailsCount = self->_problemDetailsCount;
  if (problemDetailsCount)
  {
    -[GEOETATrafficUpdateResponse _reserveProblemDetails:](v5, problemDetailsCount);
    memcpy(*(void **)(v5 + 24), self->_problemDetails, 12 * self->_problemDetailsCount);
    *(_QWORD *)(v5 + 32) = self->_problemDetailsCount;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 164) = self->_displayedEta;
    *(_DWORD *)(v5 + 172) |= 1u;
  }
  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  v42 = self->_internalErrors;
  v43 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v42, "countByEnumeratingWithState:objects:count:", &v53, v73, 16);
  if (v43)
  {
    v44 = *(_QWORD *)v54;
    do
    {
      for (n = 0; n != v43; ++n)
      {
        if (*(_QWORD *)v54 != v44)
          objc_enumerationMutation(v42);
        v46 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v53 + 1) + 8 * n), "copyWithZone:", a3, (_QWORD)v53);
        objc_msgSend((id)v5, "addInternalError:", v46);

      }
      v43 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v42, "countByEnumeratingWithState:objects:count:", &v53, v73, 16);
    }
    while (v43);
  }

  v47 = -[GEOCommonResponseAttributes copyWithZone:](self->_responseAttributes, "copyWithZone:", a3);
  v48 = *(void **)(v5 + 96);
  *(_QWORD *)(v5 + 96) = v47;

  v49 = -[GEOClientMetrics copyWithZone:](self->_clientMetrics, "copyWithZone:", a3);
  v50 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v49;

  v51 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v51;
LABEL_47:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  const void **v4;
  int v5;
  NSMutableArray *routes;
  GEOETATrafficUpdateWaypointRoute *waypointRoute;
  NSData *sessionState;
  GEOPDDatasetABStatus *datasetAbStatus;
  NSMutableArray *cameras;
  NSData *responseId;
  GEOUUID *tripId;
  NSString *debugData;
  NSMutableArray *trafficSignals;
  NSMutableArray *arrivalParameters;
  unint64_t problemDetailsCount;
  char v17;
  int v19;
  NSMutableArray *internalErrors;
  GEOCommonResponseAttributes *responseAttributes;
  GEOClientMetrics *clientMetrics;

  v4 = (const void **)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_29;
  -[GEOETATrafficUpdateResponse readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  v5 = *((_DWORD *)v4 + 43);
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((v5 & 2) == 0 || self->_status != *((_DWORD *)v4 + 42))
      goto LABEL_29;
  }
  else if ((v5 & 2) != 0)
  {
    goto LABEL_29;
  }
  routes = self->_routes;
  if ((unint64_t)routes | (unint64_t)v4[14]
    && !-[NSMutableArray isEqual:](routes, "isEqual:"))
  {
    goto LABEL_29;
  }
  waypointRoute = self->_waypointRoute;
  if ((unint64_t)waypointRoute | (unint64_t)v4[18])
  {
    if (!-[GEOETATrafficUpdateWaypointRoute isEqual:](waypointRoute, "isEqual:"))
      goto LABEL_29;
  }
  sessionState = self->_sessionState;
  if ((unint64_t)sessionState | (unint64_t)v4[15])
  {
    if (!-[NSData isEqual:](sessionState, "isEqual:"))
      goto LABEL_29;
  }
  datasetAbStatus = self->_datasetAbStatus;
  if ((unint64_t)datasetAbStatus | (unint64_t)v4[9])
  {
    if (!-[GEOPDDatasetABStatus isEqual:](datasetAbStatus, "isEqual:"))
      goto LABEL_29;
  }
  cameras = self->_cameras;
  if ((unint64_t)cameras | (unint64_t)v4[7])
  {
    if (!-[NSMutableArray isEqual:](cameras, "isEqual:"))
      goto LABEL_29;
  }
  responseId = self->_responseId;
  if ((unint64_t)responseId | (unint64_t)v4[13])
  {
    if (!-[NSData isEqual:](responseId, "isEqual:"))
      goto LABEL_29;
  }
  tripId = self->_tripId;
  if ((unint64_t)tripId | (unint64_t)v4[17])
  {
    if (!-[GEOUUID isEqual:](tripId, "isEqual:"))
      goto LABEL_29;
  }
  debugData = self->_debugData;
  if ((unint64_t)debugData | (unint64_t)v4[10])
  {
    if (!-[NSString isEqual:](debugData, "isEqual:"))
      goto LABEL_29;
  }
  trafficSignals = self->_trafficSignals;
  if ((unint64_t)trafficSignals | (unint64_t)v4[16])
  {
    if (!-[NSMutableArray isEqual:](trafficSignals, "isEqual:"))
      goto LABEL_29;
  }
  arrivalParameters = self->_arrivalParameters;
  if ((unint64_t)arrivalParameters | (unint64_t)v4[6])
  {
    if (!-[NSMutableArray isEqual:](arrivalParameters, "isEqual:"))
      goto LABEL_29;
  }
  problemDetailsCount = self->_problemDetailsCount;
  if ((const void *)problemDetailsCount != v4[4] || memcmp(self->_problemDetails, v4[3], 12 * problemDetailsCount))
    goto LABEL_29;
  v19 = *((_DWORD *)v4 + 43);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((v19 & 1) == 0 || self->_displayedEta != *((_DWORD *)v4 + 41))
      goto LABEL_29;
  }
  else if ((v19 & 1) != 0)
  {
LABEL_29:
    v17 = 0;
    goto LABEL_30;
  }
  internalErrors = self->_internalErrors;
  if ((unint64_t)internalErrors | (unint64_t)v4[11]
    && !-[NSMutableArray isEqual:](internalErrors, "isEqual:"))
  {
    goto LABEL_29;
  }
  responseAttributes = self->_responseAttributes;
  if ((unint64_t)responseAttributes | (unint64_t)v4[12])
  {
    if (!-[GEOCommonResponseAttributes isEqual:](responseAttributes, "isEqual:"))
      goto LABEL_29;
  }
  clientMetrics = self->_clientMetrics;
  if ((unint64_t)clientMetrics | (unint64_t)v4[8])
    v17 = -[GEOClientMetrics isEqual:](clientMetrics, "isEqual:");
  else
    v17 = 1;
LABEL_30:

  return v17;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  NSUInteger v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;

  -[GEOETATrafficUpdateResponse readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 2) != 0)
    v19 = 2654435761 * self->_status;
  else
    v19 = 0;
  v18 = -[NSMutableArray hash](self->_routes, "hash");
  v17 = -[GEOETATrafficUpdateWaypointRoute hash](self->_waypointRoute, "hash");
  v16 = -[NSData hash](self->_sessionState, "hash");
  v3 = -[GEOPDDatasetABStatus hash](self->_datasetAbStatus, "hash");
  v4 = -[NSMutableArray hash](self->_cameras, "hash");
  v5 = -[NSData hash](self->_responseId, "hash");
  v6 = -[GEOUUID hash](self->_tripId, "hash");
  v7 = -[NSString hash](self->_debugData, "hash");
  v8 = -[NSMutableArray hash](self->_trafficSignals, "hash");
  v9 = -[NSMutableArray hash](self->_arrivalParameters, "hash");
  v10 = PBHashBytes();
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v11 = 2654435761 * self->_displayedEta;
  else
    v11 = 0;
  v12 = v18 ^ v19 ^ v17 ^ v16 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
  v13 = -[NSMutableArray hash](self->_internalErrors, "hash");
  v14 = v13 ^ -[GEOCommonResponseAttributes hash](self->_responseAttributes, "hash");
  return v12 ^ v14 ^ -[GEOClientMetrics hash](self->_clientMetrics, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  GEOETATrafficUpdateWaypointRoute *waypointRoute;
  uint64_t v11;
  GEOPDDatasetABStatus *datasetAbStatus;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  GEOUUID *tripId;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t k;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t m;
  uint64_t v31;
  uint64_t v32;
  uint64_t n;
  uint64_t v34;
  unsigned int v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t ii;
  GEOCommonResponseAttributes *responseAttributes;
  uint64_t v42;
  GEOClientMetrics *clientMetrics;
  uint64_t v44;
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
  _BYTE v65[128];
  _BYTE v66[128];
  _BYTE v67[128];
  _BYTE v68[128];
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  if ((*((_BYTE *)v4 + 172) & 2) != 0)
  {
    self->_status = *((_DWORD *)v4 + 42);
    *(_DWORD *)&self->_flags |= 2u;
  }
  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  v5 = *((id *)v4 + 14);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v61, v69, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v62;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v62 != v8)
          objc_enumerationMutation(v5);
        -[GEOETATrafficUpdateResponse addRoute:](self, "addRoute:", *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v61, v69, 16);
    }
    while (v7);
  }

  waypointRoute = self->_waypointRoute;
  v11 = *((_QWORD *)v4 + 18);
  if (waypointRoute)
  {
    if (v11)
      -[GEOETATrafficUpdateWaypointRoute mergeFrom:](waypointRoute, "mergeFrom:");
  }
  else if (v11)
  {
    -[GEOETATrafficUpdateResponse setWaypointRoute:](self, "setWaypointRoute:");
  }
  if (*((_QWORD *)v4 + 15))
    -[GEOETATrafficUpdateResponse setSessionState:](self, "setSessionState:");
  datasetAbStatus = self->_datasetAbStatus;
  v13 = *((_QWORD *)v4 + 9);
  if (datasetAbStatus)
  {
    if (v13)
      -[GEOPDDatasetABStatus mergeFrom:](datasetAbStatus, "mergeFrom:");
  }
  else if (v13)
  {
    -[GEOETATrafficUpdateResponse setDatasetAbStatus:](self, "setDatasetAbStatus:");
  }
  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  v14 = *((id *)v4 + 7);
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v57, v68, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v58;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v58 != v17)
          objc_enumerationMutation(v14);
        -[GEOETATrafficUpdateResponse addCamera:](self, "addCamera:", *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * j));
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v57, v68, 16);
    }
    while (v16);
  }

  if (*((_QWORD *)v4 + 13))
    -[GEOETATrafficUpdateResponse setResponseId:](self, "setResponseId:");
  tripId = self->_tripId;
  v20 = (void *)*((_QWORD *)v4 + 17);
  if (tripId)
  {
    if (v20)
      -[GEOUUID mergeFrom:]((uint64_t)tripId, v20);
  }
  else if (v20)
  {
    -[GEOETATrafficUpdateResponse setTripId:](self, "setTripId:", *((_QWORD *)v4 + 17));
  }
  if (*((_QWORD *)v4 + 10))
    -[GEOETATrafficUpdateResponse setDebugData:](self, "setDebugData:");
  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  v21 = *((id *)v4 + 16);
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v53, v67, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v54;
    do
    {
      for (k = 0; k != v23; ++k)
      {
        if (*(_QWORD *)v54 != v24)
          objc_enumerationMutation(v21);
        -[GEOETATrafficUpdateResponse addTrafficSignal:](self, "addTrafficSignal:", *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * k));
      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v53, v67, 16);
    }
    while (v23);
  }

  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v26 = *((id *)v4 + 6);
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v49, v66, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v50;
    do
    {
      for (m = 0; m != v28; ++m)
      {
        if (*(_QWORD *)v50 != v29)
          objc_enumerationMutation(v26);
        -[GEOETATrafficUpdateResponse addArrivalParameters:](self, "addArrivalParameters:", *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * m));
      }
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v49, v66, 16);
    }
    while (v28);
  }

  v31 = objc_msgSend(v4, "problemDetailsCount");
  if (v31)
  {
    v32 = v31;
    for (n = 0; n != v32; ++n)
    {
      v34 = objc_msgSend(v4, "problemDetailAtIndex:", n);
      -[GEOETATrafficUpdateResponse addProblemDetail:](self, "addProblemDetail:", v34, v35);
    }
  }
  if ((*((_BYTE *)v4 + 172) & 1) != 0)
  {
    self->_displayedEta = *((_DWORD *)v4 + 41);
    *(_DWORD *)&self->_flags |= 1u;
  }
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v36 = *((id *)v4 + 11);
  v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v45, v65, 16);
  if (v37)
  {
    v38 = v37;
    v39 = *(_QWORD *)v46;
    do
    {
      for (ii = 0; ii != v38; ++ii)
      {
        if (*(_QWORD *)v46 != v39)
          objc_enumerationMutation(v36);
        -[GEOETATrafficUpdateResponse addInternalError:](self, "addInternalError:", *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * ii), (_QWORD)v45);
      }
      v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v45, v65, 16);
    }
    while (v38);
  }

  responseAttributes = self->_responseAttributes;
  v42 = *((_QWORD *)v4 + 12);
  if (responseAttributes)
  {
    if (v42)
      -[GEOCommonResponseAttributes mergeFrom:](responseAttributes, "mergeFrom:");
  }
  else if (v42)
  {
    -[GEOETATrafficUpdateResponse setResponseAttributes:](self, "setResponseAttributes:");
  }
  clientMetrics = self->_clientMetrics;
  v44 = *((_QWORD *)v4 + 8);
  if (clientMetrics)
  {
    if (v44)
      -[GEOClientMetrics mergeFrom:](clientMetrics, "mergeFrom:");
  }
  else if (v44)
  {
    -[GEOETATrafficUpdateResponse setClientMetrics:](self, "setClientMetrics:");
  }

}

- (PBUnknownFields)unknownFields
{
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v5;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_BYTE *)&self->_flags & 4) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      v5 = reader;
      objc_sync_enter(v5);
      GEOETATrafficUpdateResponseReadSpecified((uint64_t)self, (uint64_t)self->_reader, (int *)&unknownFields_tags_1483);
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
  GEOUUID *tripId;
  PBUnknownFields *v18;
  NSMutableArray *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSMutableArray *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
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
  _BYTE v45[128];
  _BYTE v46[128];
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v3 = a3;
  v49 = *MEMORY[0x1E0C80C00];
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x20004u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEOETATrafficUpdateResponse readAll:](self, "readAll:", 0);
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v7 = self->_routes;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v41, v48, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v42;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v42 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * v11++), "clearUnknownFields:", 1);
        }
        while (v9 != v11);
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v41, v48, 16);
      }
      while (v9);
    }

    -[GEOETATrafficUpdateWaypointRoute clearUnknownFields:](self->_waypointRoute, "clearUnknownFields:", 1);
    -[GEOPDDatasetABStatus clearUnknownFields:](self->_datasetAbStatus, "clearUnknownFields:", 1);
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v12 = self->_cameras;
    v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v38;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v38 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * v16++), "clearUnknownFields:", 1);
        }
        while (v14 != v16);
        v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
      }
      while (v14);
    }

    tripId = self->_tripId;
    if (tripId)
    {
      v18 = tripId->_unknownFields;
      tripId->_unknownFields = 0;

    }
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v19 = self->_trafficSignals;
    v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v33, v46, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v34;
      do
      {
        v23 = 0;
        do
        {
          if (*(_QWORD *)v34 != v22)
            objc_enumerationMutation(v19);
          objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * v23++), "clearUnknownFields:", 1);
        }
        while (v21 != v23);
        v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v33, v46, 16);
      }
      while (v21);
    }

    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v24 = self->_arrivalParameters;
    v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v29, v45, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v30;
      do
      {
        v28 = 0;
        do
        {
          if (*(_QWORD *)v30 != v27)
            objc_enumerationMutation(v24);
          objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * v28++), "clearUnknownFields:", 1, (_QWORD)v29);
        }
        while (v26 != v28);
        v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v29, v45, 16);
      }
      while (v26);
    }

    -[GEOCommonResponseAttributes clearUnknownFields:](self->_responseAttributes, "clearUnknownFields:", 1);
    -[GEOClientMetrics clearUnknownFields:](self->_clientMetrics, "clearUnknownFields:", 1);
  }
}

- (void)_readClientMetrics
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(_BYTE *)(a1 + 172) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOETATrafficUpdateResponseReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readClientMetrics_tags_1484);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (BOOL)hasClientMetrics
{
  -[GEOETATrafficUpdateResponse _readClientMetrics]((uint64_t)self);
  return self->_clientMetrics != 0;
}

- (GEOClientMetrics)clientMetrics
{
  -[GEOETATrafficUpdateResponse _readClientMetrics]((uint64_t)self);
  return self->_clientMetrics;
}

- (void)setClientMetrics:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x20040u;
  objc_storeStrong((id *)&self->_clientMetrics, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_waypointRoute, 0);
  objc_storeStrong((id *)&self->_tripId, 0);
  objc_storeStrong((id *)&self->_trafficSignals, 0);
  objc_storeStrong((id *)&self->_sessionState, 0);
  objc_storeStrong((id *)&self->_routes, 0);
  objc_storeStrong((id *)&self->_responseId, 0);
  objc_storeStrong((id *)&self->_responseAttributes, 0);
  objc_storeStrong((id *)&self->_internalErrors, 0);
  objc_storeStrong((id *)&self->_debugData, 0);
  objc_storeStrong((id *)&self->_datasetAbStatus, 0);
  objc_storeStrong((id *)&self->_clientMetrics, 0);
  objc_storeStrong((id *)&self->_cameras, 0);
  objc_storeStrong((id *)&self->_arrivalParameters, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
