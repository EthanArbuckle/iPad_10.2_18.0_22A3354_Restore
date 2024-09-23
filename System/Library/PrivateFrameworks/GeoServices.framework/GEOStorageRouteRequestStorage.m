@implementation GEOStorageRouteRequestStorage

- (GEOStorageRouteRequestStorage)init
{
  GEOStorageRouteRequestStorage *v2;
  GEOStorageRouteRequestStorage *v3;
  GEOStorageRouteRequestStorage *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOStorageRouteRequestStorage;
  v2 = -[GEOStorageRouteRequestStorage init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOStorageRouteRequestStorage)initWithData:(id)a3
{
  GEOStorageRouteRequestStorage *v3;
  GEOStorageRouteRequestStorage *v4;
  GEOStorageRouteRequestStorage *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOStorageRouteRequestStorage;
  v3 = -[GEOStorageRouteRequestStorage initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readWaypoints
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 104) & 0x200) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOStorageRouteRequestStorageReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readWaypoints_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (NSMutableArray)waypoints
{
  -[GEOStorageRouteRequestStorage _readWaypoints]((uint64_t)self);
  return self->_waypoints;
}

- (void)setWaypoints:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *waypoints;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x200u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x400u;
  waypoints = self->_waypoints;
  self->_waypoints = v4;

}

- (void)clearWaypoints
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x200u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x400u;
  -[NSMutableArray removeAllObjects](self->_waypoints, "removeAllObjects");
}

- (void)addWaypoints:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOStorageRouteRequestStorage _readWaypoints]((uint64_t)self);
  -[GEOStorageRouteRequestStorage _addNoFlagsWaypoints:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x200u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x400u;
}

- (void)_addNoFlagsWaypoints:(uint64_t)a1
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

- (unint64_t)waypointsCount
{
  -[GEOStorageRouteRequestStorage _readWaypoints]((uint64_t)self);
  return -[NSMutableArray count](self->_waypoints, "count");
}

- (id)waypointsAtIndex:(unint64_t)a3
{
  -[GEOStorageRouteRequestStorage _readWaypoints]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_waypoints, "objectAtIndex:", a3);
}

+ (Class)waypointsType
{
  return (Class)objc_opt_class();
}

- (int)transportType
{
  os_unfair_lock_s *p_readerLock;
  __int16 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 1) != 0)
    return self->_transportType;
  else
    return 0;
}

- (void)setTransportType:(int)a3
{
  *(_WORD *)&self->_flags |= 0x401u;
  self->_transportType = a3;
}

- (void)setHasTransportType:(BOOL)a3
{
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFE | a3 | 0x400;
}

- (BOOL)hasTransportType
{
  return *(_WORD *)&self->_flags & 1;
}

- (id)transportTypeAsString:(int)a3
{
  if (a3 < 7)
    return off_1E1C08E38[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsTransportType:(id)a3
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

- (void)_readRouteHandle
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 104) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOStorageRouteRequestStorageReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRouteHandle_tags_2);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (BOOL)hasRouteHandle
{
  -[GEOStorageRouteRequestStorage _readRouteHandle]((uint64_t)self);
  return self->_routeHandle != 0;
}

- (GEOURLRouteHandle)routeHandle
{
  -[GEOStorageRouteRequestStorage _readRouteHandle]((uint64_t)self);
  return self->_routeHandle;
}

- (void)setRouteHandle:(id)a3
{
  *(_WORD *)&self->_flags |= 0x440u;
  objc_storeStrong((id *)&self->_routeHandle, a3);
}

- (void)_readAutomobileOptions
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 104) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOStorageRouteRequestStorageReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAutomobileOptions_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (BOOL)hasAutomobileOptions
{
  -[GEOStorageRouteRequestStorage _readAutomobileOptions]((uint64_t)self);
  return self->_automobileOptions != 0;
}

- (GEOAutomobileOptions)automobileOptions
{
  -[GEOStorageRouteRequestStorage _readAutomobileOptions]((uint64_t)self);
  return self->_automobileOptions;
}

- (void)setAutomobileOptions:(id)a3
{
  *(_WORD *)&self->_flags |= 0x404u;
  objc_storeStrong((id *)&self->_automobileOptions, a3);
}

- (void)_readTransitOptions
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 104) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOStorageRouteRequestStorageReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTransitOptions_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (BOOL)hasTransitOptions
{
  -[GEOStorageRouteRequestStorage _readTransitOptions]((uint64_t)self);
  return self->_transitOptions != 0;
}

- (GEOTransitOptions)transitOptions
{
  -[GEOStorageRouteRequestStorage _readTransitOptions]((uint64_t)self);
  return self->_transitOptions;
}

- (void)setTransitOptions:(id)a3
{
  *(_WORD *)&self->_flags |= 0x480u;
  objc_storeStrong((id *)&self->_transitOptions, a3);
}

- (void)_readWalkingOptions
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 104) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOStorageRouteRequestStorageReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readWalkingOptions_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (BOOL)hasWalkingOptions
{
  -[GEOStorageRouteRequestStorage _readWalkingOptions]((uint64_t)self);
  return self->_walkingOptions != 0;
}

- (GEOWalkingOptions)walkingOptions
{
  -[GEOStorageRouteRequestStorage _readWalkingOptions]((uint64_t)self);
  return self->_walkingOptions;
}

- (void)setWalkingOptions:(id)a3
{
  *(_WORD *)&self->_flags |= 0x500u;
  objc_storeStrong((id *)&self->_walkingOptions, a3);
}

- (void)_readCyclingOptions
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 104) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOStorageRouteRequestStorageReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCyclingOptions_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (BOOL)hasCyclingOptions
{
  -[GEOStorageRouteRequestStorage _readCyclingOptions]((uint64_t)self);
  return self->_cyclingOptions != 0;
}

- (GEOCyclingOptions)cyclingOptions
{
  -[GEOStorageRouteRequestStorage _readCyclingOptions]((uint64_t)self);
  return self->_cyclingOptions;
}

- (void)setCyclingOptions:(id)a3
{
  *(_WORD *)&self->_flags |= 0x408u;
  objc_storeStrong((id *)&self->_cyclingOptions, a3);
}

- (void)_readResumeRouteHandleStorage
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 104) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOStorageRouteRequestStorageReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readResumeRouteHandleStorage_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (BOOL)hasResumeRouteHandleStorage
{
  -[GEOStorageRouteRequestStorage _readResumeRouteHandleStorage]((uint64_t)self);
  return self->_resumeRouteHandleStorage != 0;
}

- (GEOStorageResumeRouteHandle)resumeRouteHandleStorage
{
  -[GEOStorageRouteRequestStorage _readResumeRouteHandleStorage]((uint64_t)self);
  return self->_resumeRouteHandleStorage;
}

- (void)setResumeRouteHandleStorage:(id)a3
{
  *(_WORD *)&self->_flags |= 0x420u;
  objc_storeStrong((id *)&self->_resumeRouteHandleStorage, a3);
}

- (void)_readDestinationPersistentData
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 104) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOStorageRouteRequestStorageReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDestinationPersistentData_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (BOOL)hasDestinationPersistentData
{
  -[GEOStorageRouteRequestStorage _readDestinationPersistentData]((uint64_t)self);
  return self->_destinationPersistentData != 0;
}

- (NSData)destinationPersistentData
{
  -[GEOStorageRouteRequestStorage _readDestinationPersistentData]((uint64_t)self);
  return self->_destinationPersistentData;
}

- (void)setDestinationPersistentData:(id)a3
{
  *(_WORD *)&self->_flags |= 0x410u;
  objc_storeStrong((id *)&self->_destinationPersistentData, a3);
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
  v8.super_class = (Class)GEOStorageRouteRequestStorage;
  -[GEOStorageRouteRequestStorage description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOStorageRouteRequestStorage dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOStorageRouteRequestStorage _dictionaryRepresentation:]((uint64_t)self, 0);
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
  uint64_t v13;
  __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
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
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  _QWORD v43[4];
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 80), "count"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 80), "count"));
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v6 = *(id *)(a1 + 80);
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v46;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v46 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v11, "jsonRepresentation");
          else
            objc_msgSend(v11, "dictionaryRepresentation");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v12);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
      }
      while (v8);
    }

    objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("waypoints"));
  }
  if ((*(_WORD *)(a1 + 104) & 1) != 0)
  {
    v13 = *(int *)(a1 + 100);
    if (v13 >= 7)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 100));
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = off_1E1C08E38[v13];
    }
    objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("transportType"));

  }
  objc_msgSend((id)a1, "routeHandle");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v15, "jsonRepresentation");
    else
      objc_msgSend(v15, "dictionaryRepresentation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v17, CFSTR("routeHandle"));

  }
  objc_msgSend((id)a1, "automobileOptions");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v18)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v18, "jsonRepresentation");
    else
      objc_msgSend(v18, "dictionaryRepresentation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v20, CFSTR("automobileOptions"));

  }
  objc_msgSend((id)a1, "transitOptions");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (v21)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v21, "jsonRepresentation");
    else
      objc_msgSend(v21, "dictionaryRepresentation");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v23, CFSTR("transitOptions"));

  }
  objc_msgSend((id)a1, "walkingOptions");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v24;
  if (v24)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v24, "jsonRepresentation");
    else
      objc_msgSend(v24, "dictionaryRepresentation");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v26, CFSTR("walkingOptions"));

  }
  objc_msgSend((id)a1, "cyclingOptions");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v27;
  if (v27)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v27, "jsonRepresentation");
    else
      objc_msgSend(v27, "dictionaryRepresentation");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v29, CFSTR("cyclingOptions"));

  }
  objc_msgSend((id)a1, "resumeRouteHandleStorage");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v30;
  if (v30)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v30, "jsonRepresentation");
    else
      objc_msgSend(v30, "dictionaryRepresentation");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v32, CFSTR("resumeRouteHandleStorage"));

  }
  objc_msgSend((id)a1, "destinationPersistentData");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v33;
  if (v33)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v33, "base64EncodedStringWithOptions:", 0);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v35, CFSTR("destinationPersistentData"));

    }
    else
    {
      objc_msgSend(v4, "setObject:forKey:", v33, CFSTR("destinationPersistentData"));
    }
  }

  v36 = *(void **)(a1 + 16);
  if (v36)
  {
    objc_msgSend(v36, "dictionaryRepresentation");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v37;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v37, "count"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v43[0] = MEMORY[0x1E0C809B0];
      v43[1] = 3221225472;
      v43[2] = __59__GEOStorageRouteRequestStorage__dictionaryRepresentation___block_invoke;
      v43[3] = &unk_1E1C00600;
      v40 = v39;
      v44 = v40;
      objc_msgSend(v38, "enumerateKeysAndObjectsUsingBlock:", v43);
      v41 = v40;

      v38 = v41;
    }
    objc_msgSend(v4, "setObject:forKey:", v38, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOStorageRouteRequestStorage _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __59__GEOStorageRouteRequestStorage__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOStorageRouteRequestStorage)initWithDictionary:(id)a3
{
  return (GEOStorageRouteRequestStorage *)-[GEOStorageRouteRequestStorage _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(char)a3 isJSON:
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  GEOComposedWaypoint *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  GEOURLRouteHandle *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  GEOAutomobileOptions *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  GEOTransitOptions *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  GEOWalkingOptions *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  GEOCyclingOptions *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  GEOStorageResumeRouteHandle *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  id v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (!a1)
    goto LABEL_70;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_70;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("waypoints"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v46 = v5;
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    v7 = v6;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v48;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v48 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v13 = [GEOComposedWaypoint alloc];
            if ((a3 & 1) != 0)
              v14 = -[GEOComposedWaypoint initWithJSON:](v13, "initWithJSON:", v12);
            else
              v14 = -[GEOComposedWaypoint initWithDictionary:](v13, "initWithDictionary:", v12);
            v15 = (void *)v14;
            objc_msgSend(a1, "addWaypoints:", v14);

          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
      }
      while (v9);
    }

    v5 = v46;
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("transportType"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v17 = v16;
    if ((objc_msgSend(v17, "isEqualToString:", CFSTR("AUTOMOBILE")) & 1) != 0)
    {
      v18 = 0;
    }
    else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("TRANSIT")) & 1) != 0)
    {
      v18 = 1;
    }
    else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("WALKING")) & 1) != 0)
    {
      v18 = 2;
    }
    else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("BICYCLE")) & 1) != 0)
    {
      v18 = 3;
    }
    else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("UNKNOWN_TRANSPORT_TYPE")) & 1) != 0)
    {
      v18 = 4;
    }
    else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("FERRY")) & 1) != 0)
    {
      v18 = 5;
    }
    else if (objc_msgSend(v17, "isEqualToString:", CFSTR("RIDESHARE")))
    {
      v18 = 6;
    }
    else
    {
      v18 = 0;
    }

    goto LABEL_36;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v18 = objc_msgSend(v16, "intValue");
LABEL_36:
    objc_msgSend(a1, "setTransportType:", v18);
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("routeHandle"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v20 = [GEOURLRouteHandle alloc];
    if ((a3 & 1) != 0)
      v21 = -[GEOURLRouteHandle initWithJSON:](v20, "initWithJSON:", v19);
    else
      v21 = -[GEOURLRouteHandle initWithDictionary:](v20, "initWithDictionary:", v19);
    v22 = (void *)v21;
    objc_msgSend(a1, "setRouteHandle:", v21);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("automobileOptions"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v24 = [GEOAutomobileOptions alloc];
    if ((a3 & 1) != 0)
      v25 = -[GEOAutomobileOptions initWithJSON:](v24, "initWithJSON:", v23);
    else
      v25 = -[GEOAutomobileOptions initWithDictionary:](v24, "initWithDictionary:", v23);
    v26 = (void *)v25;
    objc_msgSend(a1, "setAutomobileOptions:", v25);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("transitOptions"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v28 = [GEOTransitOptions alloc];
    if ((a3 & 1) != 0)
      v29 = -[GEOTransitOptions initWithJSON:](v28, "initWithJSON:", v27);
    else
      v29 = -[GEOTransitOptions initWithDictionary:](v28, "initWithDictionary:", v27);
    v30 = (void *)v29;
    objc_msgSend(a1, "setTransitOptions:", v29);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("walkingOptions"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v32 = [GEOWalkingOptions alloc];
    if ((a3 & 1) != 0)
      v33 = -[GEOWalkingOptions initWithJSON:](v32, "initWithJSON:", v31);
    else
      v33 = -[GEOWalkingOptions initWithDictionary:](v32, "initWithDictionary:", v31);
    v34 = (void *)v33;
    objc_msgSend(a1, "setWalkingOptions:", v33);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("cyclingOptions"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v36 = [GEOCyclingOptions alloc];
    if ((a3 & 1) != 0)
      v37 = -[GEOCyclingOptions initWithJSON:](v36, "initWithJSON:", v35);
    else
      v37 = -[GEOCyclingOptions initWithDictionary:](v36, "initWithDictionary:", v35);
    v38 = (void *)v37;
    objc_msgSend(a1, "setCyclingOptions:", v37);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("resumeRouteHandleStorage"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v40 = [GEOStorageResumeRouteHandle alloc];
    if ((a3 & 1) != 0)
      v41 = -[GEOStorageResumeRouteHandle initWithJSON:](v40, "initWithJSON:", v39);
    else
      v41 = -[GEOStorageResumeRouteHandle initWithDictionary:](v40, "initWithDictionary:", v39);
    v42 = (void *)v41;
    objc_msgSend(a1, "setResumeRouteHandleStorage:", v41);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("destinationPersistentData"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v44 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v43, 0);
    objc_msgSend(a1, "setDestinationPersistentData:", v44);

  }
LABEL_70:

  return a1;
}

- (GEOStorageRouteRequestStorage)initWithJSON:(id)a3
{
  return (GEOStorageRouteRequestStorage *)-[GEOStorageRouteRequestStorage _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_162;
    else
      v8 = (int *)&readAll__nonRecursiveTag_163;
    GEOStorageRouteRequestStorageReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEOStorageRouteRequestStorageCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOStorageRouteRequestStorageIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOStorageRouteRequestStorageReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  PBDataReader *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOStorageRouteRequestStorageIsDirty((uint64_t)self) & 1) == 0)
  {
    v10 = self->_reader;
    objc_sync_enter(v10);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v11);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v10);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOStorageRouteRequestStorage readAll:](self, "readAll:", 0);
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v6 = self->_waypoints;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v6);
          PBDataWriterWriteSubmessage();
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

    if ((*(_WORD *)&self->_flags & 1) != 0)
      PBDataWriterWriteInt32Field();
    if (self->_routeHandle)
      PBDataWriterWriteSubmessage();
    if (self->_automobileOptions)
      PBDataWriterWriteSubmessage();
    if (self->_transitOptions)
      PBDataWriterWriteSubmessage();
    if (self->_walkingOptions)
      PBDataWriterWriteSubmessage();
    if (self->_cyclingOptions)
      PBDataWriterWriteSubmessage();
    if (self->_resumeRouteHandleStorage)
      PBDataWriterWriteSubmessage();
    if (self->_destinationPersistentData)
      PBDataWriterWriteDataField();
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v12);
  }

}

- (void)clearSensitiveFields:(unint64_t)a3
{
  GEOStorageRouteRequestStorageClearSensitiveFields((uint64_t)self, a3, 1);
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
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  -[GEOStorageRouteRequestStorage _readResumeRouteHandleStorage]((uint64_t)self);
  if (-[GEOStorageResumeRouteHandle hasGreenTeaWithValue:](self->_resumeRouteHandleStorage, "hasGreenTeaWithValue:", v3))
  {
    return 1;
  }
  -[GEOStorageRouteRequestStorage _readWaypoints]((uint64_t)self);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = self->_waypoints;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "hasGreenTeaWithValue:", v3, (_QWORD)v12) & 1) != 0)
        {
          v5 = 1;
          goto LABEL_13;
        }
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v8)
        continue;
      break;
    }
  }
  v5 = 0;
LABEL_13:

  return v5;
}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  id *v8;
  id *v9;

  v9 = (id *)a3;
  -[GEOStorageRouteRequestStorage readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v9 + 1, self->_reader);
  *((_DWORD *)v9 + 22) = self->_readerMarkPos;
  *((_DWORD *)v9 + 23) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (-[GEOStorageRouteRequestStorage waypointsCount](self, "waypointsCount"))
  {
    objc_msgSend(v9, "clearWaypoints");
    v4 = -[GEOStorageRouteRequestStorage waypointsCount](self, "waypointsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[GEOStorageRouteRequestStorage waypointsAtIndex:](self, "waypointsAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addWaypoints:", v7);

      }
    }
  }
  v8 = v9;
  if ((*(_WORD *)&self->_flags & 1) != 0)
  {
    *((_DWORD *)v9 + 25) = self->_transportType;
    *((_WORD *)v9 + 52) |= 1u;
  }
  if (self->_routeHandle)
  {
    objc_msgSend(v9, "setRouteHandle:");
    v8 = v9;
  }
  if (self->_automobileOptions)
  {
    objc_msgSend(v9, "setAutomobileOptions:");
    v8 = v9;
  }
  if (self->_transitOptions)
  {
    objc_msgSend(v9, "setTransitOptions:");
    v8 = v9;
  }
  if (self->_walkingOptions)
  {
    objc_msgSend(v9, "setWalkingOptions:");
    v8 = v9;
  }
  if (self->_cyclingOptions)
  {
    objc_msgSend(v9, "setCyclingOptions:");
    v8 = v9;
  }
  if (self->_resumeRouteHandleStorage)
  {
    objc_msgSend(v9, "setResumeRouteHandleStorage:");
    v8 = v9;
  }
  if (self->_destinationPersistentData)
  {
    objc_msgSend(v9, "setDestinationPersistentData:");
    v8 = v9;
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
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  uint64_t v26;
  void *v27;
  PBUnknownFields *v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
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
      GEOStorageRouteRequestStorageReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_15;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOStorageRouteRequestStorage readAll:](self, "readAll:", 0);
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v9 = self->_waypoints;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v31 != v11)
          objc_enumerationMutation(v9);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v30);
        objc_msgSend((id)v5, "addWaypoints:", v13);

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v10);
  }

  if ((*(_WORD *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 100) = self->_transportType;
    *(_WORD *)(v5 + 104) |= 1u;
  }
  v14 = -[GEOURLRouteHandle copyWithZone:](self->_routeHandle, "copyWithZone:", a3, (_QWORD)v30);
  v15 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v14;

  v16 = -[GEOAutomobileOptions copyWithZone:](self->_automobileOptions, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v16;

  v18 = -[GEOTransitOptions copyWithZone:](self->_transitOptions, "copyWithZone:", a3);
  v19 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v18;

  v20 = -[GEOWalkingOptions copyWithZone:](self->_walkingOptions, "copyWithZone:", a3);
  v21 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v20;

  v22 = -[GEOCyclingOptions copyWithZone:](self->_cyclingOptions, "copyWithZone:", a3);
  v23 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v22;

  v24 = -[GEOStorageResumeRouteHandle copyWithZone:](self->_resumeRouteHandleStorage, "copyWithZone:", a3);
  v25 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v24;

  v26 = -[NSData copyWithZone:](self->_destinationPersistentData, "copyWithZone:", a3);
  v27 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v26;

  v28 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v28;
LABEL_15:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSMutableArray *waypoints;
  __int16 v6;
  GEOURLRouteHandle *routeHandle;
  GEOAutomobileOptions *automobileOptions;
  GEOTransitOptions *transitOptions;
  GEOWalkingOptions *walkingOptions;
  GEOCyclingOptions *cyclingOptions;
  GEOStorageResumeRouteHandle *resumeRouteHandleStorage;
  NSData *destinationPersistentData;
  char v14;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_23;
  -[GEOStorageRouteRequestStorage readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  waypoints = self->_waypoints;
  if ((unint64_t)waypoints | *((_QWORD *)v4 + 10))
  {
    if (!-[NSMutableArray isEqual:](waypoints, "isEqual:"))
      goto LABEL_23;
  }
  v6 = *((_WORD *)v4 + 52);
  if ((*(_WORD *)&self->_flags & 1) != 0)
  {
    if ((v6 & 1) == 0 || self->_transportType != *((_DWORD *)v4 + 25))
      goto LABEL_23;
  }
  else if ((v6 & 1) != 0)
  {
LABEL_23:
    v14 = 0;
    goto LABEL_24;
  }
  routeHandle = self->_routeHandle;
  if ((unint64_t)routeHandle | *((_QWORD *)v4 + 7) && !-[GEOURLRouteHandle isEqual:](routeHandle, "isEqual:"))
    goto LABEL_23;
  automobileOptions = self->_automobileOptions;
  if ((unint64_t)automobileOptions | *((_QWORD *)v4 + 3))
  {
    if (!-[GEOAutomobileOptions isEqual:](automobileOptions, "isEqual:"))
      goto LABEL_23;
  }
  transitOptions = self->_transitOptions;
  if ((unint64_t)transitOptions | *((_QWORD *)v4 + 8))
  {
    if (!-[GEOTransitOptions isEqual:](transitOptions, "isEqual:"))
      goto LABEL_23;
  }
  walkingOptions = self->_walkingOptions;
  if ((unint64_t)walkingOptions | *((_QWORD *)v4 + 9))
  {
    if (!-[GEOWalkingOptions isEqual:](walkingOptions, "isEqual:"))
      goto LABEL_23;
  }
  cyclingOptions = self->_cyclingOptions;
  if ((unint64_t)cyclingOptions | *((_QWORD *)v4 + 4))
  {
    if (!-[GEOCyclingOptions isEqual:](cyclingOptions, "isEqual:"))
      goto LABEL_23;
  }
  resumeRouteHandleStorage = self->_resumeRouteHandleStorage;
  if ((unint64_t)resumeRouteHandleStorage | *((_QWORD *)v4 + 6))
  {
    if (!-[GEOStorageResumeRouteHandle isEqual:](resumeRouteHandleStorage, "isEqual:"))
      goto LABEL_23;
  }
  destinationPersistentData = self->_destinationPersistentData;
  if ((unint64_t)destinationPersistentData | *((_QWORD *)v4 + 5))
    v14 = -[NSData isEqual:](destinationPersistentData, "isEqual:");
  else
    v14 = 1;
LABEL_24:

  return v14;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;

  -[GEOStorageRouteRequestStorage readAll:](self, "readAll:", 1);
  v3 = -[NSMutableArray hash](self->_waypoints, "hash");
  if ((*(_WORD *)&self->_flags & 1) != 0)
    v4 = 2654435761 * self->_transportType;
  else
    v4 = 0;
  v5 = v4 ^ v3;
  v6 = -[GEOURLRouteHandle hash](self->_routeHandle, "hash");
  v7 = v5 ^ v6 ^ -[GEOAutomobileOptions hash](self->_automobileOptions, "hash");
  v8 = -[GEOTransitOptions hash](self->_transitOptions, "hash");
  v9 = v8 ^ -[GEOWalkingOptions hash](self->_walkingOptions, "hash");
  v10 = v7 ^ v9 ^ -[GEOCyclingOptions hash](self->_cyclingOptions, "hash");
  v11 = -[GEOStorageResumeRouteHandle hash](self->_resumeRouteHandleStorage, "hash");
  return v10 ^ v11 ^ -[NSData hash](self->_destinationPersistentData, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  GEOURLRouteHandle *routeHandle;
  uint64_t v11;
  GEOAutomobileOptions *automobileOptions;
  uint64_t v13;
  GEOTransitOptions *transitOptions;
  uint64_t v15;
  GEOWalkingOptions *walkingOptions;
  uint64_t v17;
  GEOCyclingOptions *cyclingOptions;
  uint64_t v19;
  GEOStorageResumeRouteHandle *resumeRouteHandleStorage;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v5 = *((id *)v4 + 10);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v23 != v8)
          objc_enumerationMutation(v5);
        -[GEOStorageRouteRequestStorage addWaypoints:](self, "addWaypoints:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i), (_QWORD)v22);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v7);
  }

  if ((*((_WORD *)v4 + 52) & 1) != 0)
  {
    self->_transportType = *((_DWORD *)v4 + 25);
    *(_WORD *)&self->_flags |= 1u;
  }
  routeHandle = self->_routeHandle;
  v11 = *((_QWORD *)v4 + 7);
  if (routeHandle)
  {
    if (v11)
      -[GEOURLRouteHandle mergeFrom:](routeHandle, "mergeFrom:");
  }
  else if (v11)
  {
    -[GEOStorageRouteRequestStorage setRouteHandle:](self, "setRouteHandle:");
  }
  automobileOptions = self->_automobileOptions;
  v13 = *((_QWORD *)v4 + 3);
  if (automobileOptions)
  {
    if (v13)
      -[GEOAutomobileOptions mergeFrom:](automobileOptions, "mergeFrom:");
  }
  else if (v13)
  {
    -[GEOStorageRouteRequestStorage setAutomobileOptions:](self, "setAutomobileOptions:");
  }
  transitOptions = self->_transitOptions;
  v15 = *((_QWORD *)v4 + 8);
  if (transitOptions)
  {
    if (v15)
      -[GEOTransitOptions mergeFrom:](transitOptions, "mergeFrom:");
  }
  else if (v15)
  {
    -[GEOStorageRouteRequestStorage setTransitOptions:](self, "setTransitOptions:");
  }
  walkingOptions = self->_walkingOptions;
  v17 = *((_QWORD *)v4 + 9);
  if (walkingOptions)
  {
    if (v17)
      -[GEOWalkingOptions mergeFrom:](walkingOptions, "mergeFrom:");
  }
  else if (v17)
  {
    -[GEOStorageRouteRequestStorage setWalkingOptions:](self, "setWalkingOptions:");
  }
  cyclingOptions = self->_cyclingOptions;
  v19 = *((_QWORD *)v4 + 4);
  if (cyclingOptions)
  {
    if (v19)
      -[GEOCyclingOptions mergeFrom:](cyclingOptions, "mergeFrom:");
  }
  else if (v19)
  {
    -[GEOStorageRouteRequestStorage setCyclingOptions:](self, "setCyclingOptions:");
  }
  resumeRouteHandleStorage = self->_resumeRouteHandleStorage;
  v21 = *((_QWORD *)v4 + 6);
  if (resumeRouteHandleStorage)
  {
    if (v21)
      -[GEOStorageResumeRouteHandle mergeFrom:](resumeRouteHandleStorage, "mergeFrom:");
  }
  else if (v21)
  {
    -[GEOStorageRouteRequestStorage setResumeRouteHandleStorage:](self, "setResumeRouteHandleStorage:");
  }
  if (*((_QWORD *)v4 + 5))
    -[GEOStorageRouteRequestStorage setDestinationPersistentData:](self, "setDestinationPersistentData:");

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
      GEOStorageRouteRequestStorageReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_166);
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
  *(_WORD *)&self->_flags |= 0x402u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEOStorageRouteRequestStorage readAll:](self, "readAll:", 0);
    -[GEOAutomobileOptions clearUnknownFields:](self->_automobileOptions, "clearUnknownFields:", 1);
    -[GEOTransitOptions clearUnknownFields:](self->_transitOptions, "clearUnknownFields:", 1);
    -[GEOWalkingOptions clearUnknownFields:](self->_walkingOptions, "clearUnknownFields:", 1);
    -[GEOCyclingOptions clearUnknownFields:](self->_cyclingOptions, "clearUnknownFields:", 1);
    -[GEOStorageResumeRouteHandle clearUnknownFields:](self->_resumeRouteHandleStorage, "clearUnknownFields:", 1);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_waypoints, 0);
  objc_storeStrong((id *)&self->_walkingOptions, 0);
  objc_storeStrong((id *)&self->_transitOptions, 0);
  objc_storeStrong((id *)&self->_routeHandle, 0);
  objc_storeStrong((id *)&self->_resumeRouteHandleStorage, 0);
  objc_storeStrong((id *)&self->_destinationPersistentData, 0);
  objc_storeStrong((id *)&self->_cyclingOptions, 0);
  objc_storeStrong((id *)&self->_automobileOptions, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
