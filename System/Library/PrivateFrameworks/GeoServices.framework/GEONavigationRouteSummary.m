@implementation GEONavigationRouteSummary

- (GEONavigationRouteSummary)init
{
  GEONavigationRouteSummary *v2;
  GEONavigationRouteSummary *v3;
  GEONavigationRouteSummary *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEONavigationRouteSummary;
  v2 = -[GEONavigationRouteSummary init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEONavigationRouteSummary)initWithData:(id)a3
{
  GEONavigationRouteSummary *v3;
  GEONavigationRouteSummary *v4;
  GEONavigationRouteSummary *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEONavigationRouteSummary;
  v3 = -[GEONavigationRouteSummary initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (int)transportType
{
  os_unfair_lock_s *p_readerLock;
  char flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 2) != 0)
    return self->_transportType;
  else
    return 0;
}

- (void)setTransportType:(int)a3
{
  *(_BYTE *)&self->_flags |= 0x82u;
  self->_transportType = a3;
}

- (void)setHasTransportType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = -126;
  else
    v3 = 0x80;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasTransportType
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (id)transportTypeAsString:(int)a3
{
  if (a3 < 7)
    return off_1E1C09228[a3];
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

- (void)_readDestinationName
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_BYTE *)(a1 + 80) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEONavigationRouteSummaryReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDestinationName_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasDestinationName
{
  -[GEONavigationRouteSummary _readDestinationName]((uint64_t)self);
  return self->_destinationName != 0;
}

- (NSString)destinationName
{
  -[GEONavigationRouteSummary _readDestinationName]((uint64_t)self);
  return self->_destinationName;
}

- (void)setDestinationName:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x84u;
  objc_storeStrong((id *)&self->_destinationName, a3);
}

- (double)travelTime
{
  return self->_travelTime;
}

- (void)setTravelTime:(double)a3
{
  *(_BYTE *)&self->_flags |= 0x81u;
  self->_travelTime = a3;
}

- (void)setHasTravelTime:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0x7E | a3 | 0x80;
}

- (BOOL)hasTravelTime
{
  return *(_BYTE *)&self->_flags & 1;
}

- (void)_readWaypoints
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_BYTE *)(a1 + 80) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEONavigationRouteSummaryReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readWaypoints_tags_1);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (NSMutableArray)waypoints
{
  -[GEONavigationRouteSummary _readWaypoints]((uint64_t)self);
  return self->_waypoints;
}

- (void)setWaypoints:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *waypoints;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x80u;
  waypoints = self->_waypoints;
  self->_waypoints = v4;

}

- (void)clearWaypoints
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x80u;
  -[NSMutableArray removeAllObjects](self->_waypoints, "removeAllObjects");
}

- (void)addWaypoints:(id)a3
{
  id v4;

  v4 = a3;
  -[GEONavigationRouteSummary _readWaypoints]((uint64_t)self);
  -[GEONavigationRouteSummary _addNoFlagsWaypoints:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x80u;
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

- (unint64_t)waypointsCount
{
  -[GEONavigationRouteSummary _readWaypoints]((uint64_t)self);
  return -[NSMutableArray count](self->_waypoints, "count");
}

- (id)waypointsAtIndex:(unint64_t)a3
{
  -[GEONavigationRouteSummary _readWaypoints]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_waypoints, "objectAtIndex:", a3);
}

+ (Class)waypointsType
{
  return (Class)objc_opt_class();
}

- (void)_readNextDestinationName
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_BYTE *)(a1 + 80) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEONavigationRouteSummaryReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readNextDestinationName_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasNextDestinationName
{
  -[GEONavigationRouteSummary _readNextDestinationName]((uint64_t)self);
  return self->_nextDestinationName != 0;
}

- (NSString)nextDestinationName
{
  -[GEONavigationRouteSummary _readNextDestinationName]((uint64_t)self);
  return self->_nextDestinationName;
}

- (void)setNextDestinationName:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x90u;
  objc_storeStrong((id *)&self->_nextDestinationName, a3);
}

- (void)_readOrigin
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_BYTE *)(a1 + 80) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEONavigationRouteSummaryReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readOrigin_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasOrigin
{
  -[GEONavigationRouteSummary _readOrigin]((uint64_t)self);
  return self->_origin != 0;
}

- (GEOComposedWaypoint)origin
{
  -[GEONavigationRouteSummary _readOrigin]((uint64_t)self);
  return self->_origin;
}

- (void)setOrigin:(id)a3
{
  *(_BYTE *)&self->_flags |= 0xA0u;
  objc_storeStrong((id *)&self->_origin, a3);
}

- (void)_readDestination
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_BYTE *)(a1 + 80) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEONavigationRouteSummaryReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDestination_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasDestination
{
  -[GEONavigationRouteSummary _readDestination]((uint64_t)self);
  return self->_destination != 0;
}

- (GEOComposedWaypoint)destination
{
  -[GEONavigationRouteSummary _readDestination]((uint64_t)self);
  return self->_destination;
}

- (void)setDestination:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x88u;
  objc_storeStrong((id *)&self->_destination, a3);
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
  v8.super_class = (Class)GEONavigationRouteSummary;
  -[GEONavigationRouteSummary description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEONavigationRouteSummary dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEONavigationRouteSummary _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  uint64_t v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)(a1 + 80) & 2) != 0)
  {
    v5 = *(int *)(a1 + 76);
    if (v5 >= 7)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 76));
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = off_1E1C09228[v5];
    }
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("transportType"));

  }
  objc_msgSend((id)a1, "destinationName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("destinationName"));

  if ((*(_BYTE *)(a1 + 80) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 48));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("travelTime"));

  }
  if (objc_msgSend(*(id *)(a1 + 56), "count"))
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 56), "count"));
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v10 = *(id *)(a1 + 56);
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v26 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v15, "jsonRepresentation");
          else
            objc_msgSend(v15, "dictionaryRepresentation");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v16);

        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v12);
    }

    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("waypoints"));
  }
  objc_msgSend((id)a1, "nextDestinationName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
    objc_msgSend(v4, "setObject:forKey:", v17, CFSTR("nextDestinationName"));

  objc_msgSend((id)a1, "origin");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v18)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v18, "jsonRepresentation");
    else
      objc_msgSend(v18, "dictionaryRepresentation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v20, CFSTR("origin"));

  }
  objc_msgSend((id)a1, "destination");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (v21)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v21, "jsonRepresentation");
    else
      objc_msgSend(v21, "dictionaryRepresentation");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v23, CFSTR("destination"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEONavigationRouteSummary _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEONavigationRouteSummary)initWithDictionary:(id)a3
{
  return (GEONavigationRouteSummary *)-[GEONavigationRouteSummary _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(char)a3 isJSON:
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  GEOComposedWaypoint *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  GEOComposedWaypoint *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  GEOComposedWaypoint *v29;
  uint64_t v30;
  void *v31;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (!a1)
    goto LABEL_54;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_54;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("transportType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v6;
    if ((objc_msgSend(v7, "isEqualToString:", CFSTR("AUTOMOBILE")) & 1) != 0)
    {
      v8 = 0;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("TRANSIT")) & 1) != 0)
    {
      v8 = 1;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("WALKING")) & 1) != 0)
    {
      v8 = 2;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("BICYCLE")) & 1) != 0)
    {
      v8 = 3;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("UNKNOWN_TRANSPORT_TYPE")) & 1) != 0)
    {
      v8 = 4;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FERRY")) & 1) != 0)
    {
      v8 = 5;
    }
    else if (objc_msgSend(v7, "isEqualToString:", CFSTR("RIDESHARE")))
    {
      v8 = 6;
    }
    else
    {
      v8 = 0;
    }

    goto LABEL_22;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = objc_msgSend(v6, "intValue");
LABEL_22:
    objc_msgSend(a1, "setTransportType:", v8);
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("destinationName"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = (void *)objc_msgSend(v9, "copy");
    objc_msgSend(a1, "setDestinationName:", v10);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("travelTime"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v11, "doubleValue");
    objc_msgSend(a1, "setTravelTime:");
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("waypoints"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v33 = v5;
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v13 = v12;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v35 != v16)
            objc_enumerationMutation(v13);
          v18 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v19 = [GEOComposedWaypoint alloc];
            if ((a3 & 1) != 0)
              v20 = -[GEOComposedWaypoint initWithJSON:](v19, "initWithJSON:", v18);
            else
              v20 = -[GEOComposedWaypoint initWithDictionary:](v19, "initWithDictionary:", v18);
            v21 = (void *)v20;
            objc_msgSend(a1, "addWaypoints:", v20);

          }
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
      }
      while (v15);
    }

    v5 = v33;
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("nextDestinationName"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v23 = (void *)objc_msgSend(v22, "copy");
    objc_msgSend(a1, "setNextDestinationName:", v23);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("origin"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v25 = [GEOComposedWaypoint alloc];
    if ((a3 & 1) != 0)
      v26 = -[GEOComposedWaypoint initWithJSON:](v25, "initWithJSON:", v24);
    else
      v26 = -[GEOComposedWaypoint initWithDictionary:](v25, "initWithDictionary:", v24);
    v27 = (void *)v26;
    objc_msgSend(a1, "setOrigin:", v26);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("destination"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v29 = [GEOComposedWaypoint alloc];
    if ((a3 & 1) != 0)
      v30 = -[GEOComposedWaypoint initWithJSON:](v29, "initWithJSON:", v28);
    else
      v30 = -[GEOComposedWaypoint initWithDictionary:](v29, "initWithDictionary:", v28);
    v31 = (void *)v30;
    objc_msgSend(a1, "setDestination:", v30);

  }
LABEL_54:

  return a1;
}

- (GEONavigationRouteSummary)initWithJSON:(id)a3
{
  return (GEONavigationRouteSummary *)-[GEONavigationRouteSummary _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_263;
    else
      v8 = (int *)&readAll__nonRecursiveTag_264;
    GEONavigationRouteSummaryReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEONavigationRouteSummaryCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEONavigationRouteSummaryIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEONavigationRouteSummaryReadAllFrom((uint64_t)self, a3, 0);
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
  if (self->_reader && (_GEONavigationRouteSummaryIsDirty((uint64_t)self) & 1) == 0)
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
    -[GEONavigationRouteSummary readAll:](self, "readAll:", 0);
    if ((*(_BYTE *)&self->_flags & 2) != 0)
      PBDataWriterWriteInt32Field();
    if (self->_destinationName)
      PBDataWriterWriteStringField();
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      PBDataWriterWriteDoubleField();
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

    if (self->_nextDestinationName)
      PBDataWriterWriteStringField();
    if (self->_origin)
      PBDataWriterWriteSubmessage();
    if (self->_destination)
      PBDataWriterWriteSubmessage();
  }

}

- (void)clearSensitiveFields:(unint64_t)a3
{
  GEONavigationRouteSummaryClearSensitiveFields((id *)&self->super.super.isa, a3, 1);
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
  -[GEONavigationRouteSummary _readDestination]((uint64_t)self);
  if (-[GEOComposedWaypoint hasGreenTeaWithValue:](self->_destination, "hasGreenTeaWithValue:", v3))
    return 1;
  -[GEONavigationRouteSummary _readOrigin]((uint64_t)self);
  if (-[GEOComposedWaypoint hasGreenTeaWithValue:](self->_origin, "hasGreenTeaWithValue:", v3))
    return 1;
  -[GEONavigationRouteSummary _readWaypoints]((uint64_t)self);
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
          goto LABEL_14;
        }
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v8)
        continue;
      break;
    }
  }
  v5 = 0;
LABEL_14:

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
  -[GEONavigationRouteSummary readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v9 + 1, self->_reader);
  *((_DWORD *)v9 + 16) = self->_readerMarkPos;
  *((_DWORD *)v9 + 17) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    *((_DWORD *)v9 + 19) = self->_transportType;
    *((_BYTE *)v9 + 80) |= 2u;
  }
  if (self->_destinationName)
    objc_msgSend(v9, "setDestinationName:");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    v9[6] = *(id *)&self->_travelTime;
    *((_BYTE *)v9 + 80) |= 1u;
  }
  if (-[GEONavigationRouteSummary waypointsCount](self, "waypointsCount"))
  {
    objc_msgSend(v9, "clearWaypoints");
    v4 = -[GEONavigationRouteSummary waypointsCount](self, "waypointsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[GEONavigationRouteSummary waypointsAtIndex:](self, "waypointsAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addWaypoints:", v7);

      }
    }
  }
  if (self->_nextDestinationName)
    objc_msgSend(v9, "setNextDestinationName:");
  v8 = v9;
  if (self->_origin)
  {
    objc_msgSend(v9, "setOrigin:");
    v8 = v9;
  }
  if (self->_destination)
  {
    objc_msgSend(v9, "setDestination:");
    v8 = v9;
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
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_BYTE *)&self->_flags & 0x80000000) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEONavigationRouteSummaryReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_17;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEONavigationRouteSummary readAll:](self, "readAll:", 0);
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 76) = self->_transportType;
    *(_BYTE *)(v5 + 80) |= 2u;
  }
  v9 = -[NSString copyWithZone:](self->_destinationName, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v9;

  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(double *)(v5 + 48) = self->_travelTime;
    *(_BYTE *)(v5 + 80) |= 1u;
  }
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v11 = self->_waypoints;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v23 != v13)
          objc_enumerationMutation(v11);
        v15 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v22);
        objc_msgSend((id)v5, "addWaypoints:", v15);

      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v12);
  }

  v16 = -[NSString copyWithZone:](self->_nextDestinationName, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v16;

  v18 = -[GEOComposedWaypoint copyWithZone:](self->_origin, "copyWithZone:", a3);
  v19 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v18;

  v20 = -[GEOComposedWaypoint copyWithZone:](self->_destination, "copyWithZone:", a3);
  v8 = *(id *)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v20;
LABEL_17:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char flags;
  char v6;
  NSString *destinationName;
  NSMutableArray *waypoints;
  NSString *nextDestinationName;
  GEOComposedWaypoint *origin;
  GEOComposedWaypoint *destination;
  char v12;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_23;
  -[GEONavigationRouteSummary readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  flags = (char)self->_flags;
  v6 = *((_BYTE *)v4 + 80);
  if ((flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 80) & 2) == 0 || self->_transportType != *((_DWORD *)v4 + 19))
      goto LABEL_23;
  }
  else if ((*((_BYTE *)v4 + 80) & 2) != 0)
  {
    goto LABEL_23;
  }
  destinationName = self->_destinationName;
  if ((unint64_t)destinationName | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](destinationName, "isEqual:"))
    {
LABEL_23:
      v12 = 0;
      goto LABEL_24;
    }
    flags = (char)self->_flags;
    v6 = *((_BYTE *)v4 + 80);
  }
  if ((flags & 1) != 0)
  {
    if ((v6 & 1) == 0 || self->_travelTime != *((double *)v4 + 6))
      goto LABEL_23;
  }
  else if ((v6 & 1) != 0)
  {
    goto LABEL_23;
  }
  waypoints = self->_waypoints;
  if ((unint64_t)waypoints | *((_QWORD *)v4 + 7)
    && !-[NSMutableArray isEqual:](waypoints, "isEqual:"))
  {
    goto LABEL_23;
  }
  nextDestinationName = self->_nextDestinationName;
  if ((unint64_t)nextDestinationName | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](nextDestinationName, "isEqual:"))
      goto LABEL_23;
  }
  origin = self->_origin;
  if ((unint64_t)origin | *((_QWORD *)v4 + 5))
  {
    if (!-[GEOComposedWaypoint isEqual:](origin, "isEqual:"))
      goto LABEL_23;
  }
  destination = self->_destination;
  if ((unint64_t)destination | *((_QWORD *)v4 + 3))
    v12 = -[GEOComposedWaypoint isEqual:](destination, "isEqual:");
  else
    v12 = 1;
LABEL_24:

  return v12;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  unint64_t v5;
  double travelTime;
  double v7;
  long double v8;
  double v9;
  NSUInteger v10;
  uint64_t v11;
  NSUInteger v12;
  unint64_t v13;

  -[GEONavigationRouteSummary readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 2) != 0)
    v3 = 2654435761 * self->_transportType;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_destinationName, "hash");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    travelTime = self->_travelTime;
    v7 = -travelTime;
    if (travelTime >= 0.0)
      v7 = self->_travelTime;
    v8 = floor(v7 + 0.5);
    v9 = (v7 - v8) * 1.84467441e19;
    v5 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0)
        v5 += (unint64_t)v9;
    }
    else
    {
      v5 -= (unint64_t)fabs(v9);
    }
  }
  else
  {
    v5 = 0;
  }
  v10 = v4 ^ v3 ^ v5;
  v11 = -[NSMutableArray hash](self->_waypoints, "hash");
  v12 = v10 ^ v11 ^ -[NSString hash](self->_nextDestinationName, "hash");
  v13 = -[GEOComposedWaypoint hash](self->_origin, "hash");
  return v12 ^ v13 ^ -[GEOComposedWaypoint hash](self->_destination, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  GEOComposedWaypoint *origin;
  uint64_t v11;
  GEOComposedWaypoint *destination;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  if ((*((_BYTE *)v4 + 80) & 2) != 0)
  {
    self->_transportType = *((_DWORD *)v4 + 19);
    *(_BYTE *)&self->_flags |= 2u;
  }
  if (*((_QWORD *)v4 + 2))
    -[GEONavigationRouteSummary setDestinationName:](self, "setDestinationName:");
  if ((*((_BYTE *)v4 + 80) & 1) != 0)
  {
    self->_travelTime = *((double *)v4 + 6);
    *(_BYTE *)&self->_flags |= 1u;
  }
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = *((id *)v4 + 7);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        -[GEONavigationRouteSummary addWaypoints:](self, "addWaypoints:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i), (_QWORD)v14);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  if (*((_QWORD *)v4 + 4))
    -[GEONavigationRouteSummary setNextDestinationName:](self, "setNextDestinationName:");
  origin = self->_origin;
  v11 = *((_QWORD *)v4 + 5);
  if (origin)
  {
    if (v11)
      -[GEOComposedWaypoint mergeFrom:](origin, "mergeFrom:");
  }
  else if (v11)
  {
    -[GEONavigationRouteSummary setOrigin:](self, "setOrigin:");
  }
  destination = self->_destination;
  v13 = *((_QWORD *)v4 + 3);
  if (destination)
  {
    if (v13)
      -[GEOComposedWaypoint mergeFrom:](destination, "mergeFrom:");
  }
  else if (v13)
  {
    -[GEONavigationRouteSummary setDestination:](self, "setDestination:");
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_waypoints, 0);
  objc_storeStrong((id *)&self->_origin, 0);
  objc_storeStrong((id *)&self->_nextDestinationName, 0);
  objc_storeStrong((id *)&self->_destination, 0);
  objc_storeStrong((id *)&self->_destinationName, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

- (void)updateRoute:(id)a3 destinationName:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v6 = a4;
  v7 = a3;
  -[GEONavigationRouteSummary setTransportType:](self, "setTransportType:", objc_msgSend(v7, "transportType"));
  v8 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend(v7, "waypoints");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "arrayWithArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEONavigationRouteSummary setWaypoints:](self, "setWaypoints:", v10);

  -[GEONavigationRouteSummary waypoints](self, "waypoints");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEONavigationRouteSummary setOrigin:](self, "setOrigin:", v12);

  -[GEONavigationRouteSummary waypoints](self, "waypoints");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "lastObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEONavigationRouteSummary setDestination:](self, "setDestination:", v14);

  -[GEONavigationRouteSummary setDestinationName:](self, "setDestinationName:", v6);
  LODWORD(v6) = objc_msgSend(v7, "expectedTime");

  -[GEONavigationRouteSummary setTravelTime:](self, "setTravelTime:", (double)v6);
}

@end
