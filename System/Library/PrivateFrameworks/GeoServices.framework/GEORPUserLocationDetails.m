@implementation GEORPUserLocationDetails

- (GEORPUserLocationDetails)init
{
  GEORPUserLocationDetails *v2;
  GEORPUserLocationDetails *v3;
  GEORPUserLocationDetails *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEORPUserLocationDetails;
  v2 = -[GEORPUserLocationDetails init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPUserLocationDetails)initWithData:(id)a3
{
  GEORPUserLocationDetails *v3;
  GEORPUserLocationDetails *v4;
  GEORPUserLocationDetails *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEORPUserLocationDetails;
  v3 = -[GEORPUserLocationDetails initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readCurrentTime
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_BYTE *)(a1 + 60) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPUserLocationDetailsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCurrentTime_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasCurrentTime
{
  -[GEORPUserLocationDetails _readCurrentTime]((uint64_t)self);
  return self->_currentTime != 0;
}

- (GEORPTimestamp)currentTime
{
  -[GEORPUserLocationDetails _readCurrentTime]((uint64_t)self);
  return self->_currentTime;
}

- (void)setCurrentTime:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x11u;
  objc_storeStrong((id *)&self->_currentTime, a3);
}

- (void)_readCurrentUserLocation
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_BYTE *)(a1 + 60) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPUserLocationDetailsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCurrentUserLocation_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasCurrentUserLocation
{
  -[GEORPUserLocationDetails _readCurrentUserLocation]((uint64_t)self);
  return self->_currentUserLocation != 0;
}

- (GEOLocation)currentUserLocation
{
  -[GEORPUserLocationDetails _readCurrentUserLocation]((uint64_t)self);
  return self->_currentUserLocation;
}

- (void)setCurrentUserLocation:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x12u;
  objc_storeStrong((id *)&self->_currentUserLocation, a3);
}

- (void)_readLastKnownRoadLocation
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_BYTE *)(a1 + 60) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPUserLocationDetailsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLastKnownRoadLocation_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasLastKnownRoadLocation
{
  -[GEORPUserLocationDetails _readLastKnownRoadLocation]((uint64_t)self);
  return self->_lastKnownRoadLocation != 0;
}

- (GEOLocation)lastKnownRoadLocation
{
  -[GEORPUserLocationDetails _readLastKnownRoadLocation]((uint64_t)self);
  return self->_lastKnownRoadLocation;
}

- (void)setLastKnownRoadLocation:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x18u;
  objc_storeStrong((id *)&self->_lastKnownRoadLocation, a3);
}

- (void)_readDeviceHistoricalLocations
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_BYTE *)(a1 + 60) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPUserLocationDetailsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDeviceHistoricalLocations_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (NSMutableArray)deviceHistoricalLocations
{
  -[GEORPUserLocationDetails _readDeviceHistoricalLocations]((uint64_t)self);
  return self->_deviceHistoricalLocations;
}

- (void)setDeviceHistoricalLocations:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *deviceHistoricalLocations;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x10u;
  deviceHistoricalLocations = self->_deviceHistoricalLocations;
  self->_deviceHistoricalLocations = v4;

}

- (void)clearDeviceHistoricalLocations
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x10u;
  -[NSMutableArray removeAllObjects](self->_deviceHistoricalLocations, "removeAllObjects");
}

- (void)addDeviceHistoricalLocation:(id)a3
{
  id v4;

  v4 = a3;
  -[GEORPUserLocationDetails _readDeviceHistoricalLocations]((uint64_t)self);
  -[GEORPUserLocationDetails _addNoFlagsDeviceHistoricalLocation:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x10u;
}

- (void)_addNoFlagsDeviceHistoricalLocation:(uint64_t)a1
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

- (unint64_t)deviceHistoricalLocationsCount
{
  -[GEORPUserLocationDetails _readDeviceHistoricalLocations]((uint64_t)self);
  return -[NSMutableArray count](self->_deviceHistoricalLocations, "count");
}

- (id)deviceHistoricalLocationAtIndex:(unint64_t)a3
{
  -[GEORPUserLocationDetails _readDeviceHistoricalLocations]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_deviceHistoricalLocations, "objectAtIndex:", a3);
}

+ (Class)deviceHistoricalLocationType
{
  return (Class)objc_opt_class();
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
  v8.super_class = (Class)GEORPUserLocationDetails;
  -[GEORPUserLocationDetails description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORPUserLocationDetails dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPUserLocationDetails _dictionaryRepresentation:]((id *)&self->super.super.isa, 0);
}

- (id)_dictionaryRepresentation:(id *)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  const __CFString *v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend(a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "currentTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v5, "jsonRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = CFSTR("currentTime");
    }
    else
    {
      objc_msgSend(v5, "dictionaryRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = CFSTR("current_time");
    }
    objc_msgSend(v4, "setObject:forKey:", v7, v8);

  }
  objc_msgSend(a1, "currentUserLocation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v9, "jsonRepresentation");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = CFSTR("currentUserLocation");
    }
    else
    {
      objc_msgSend(v9, "dictionaryRepresentation");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = CFSTR("current_user_location");
    }
    objc_msgSend(v4, "setObject:forKey:", v11, v12);

  }
  objc_msgSend(a1, "lastKnownRoadLocation");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v13, "jsonRepresentation");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = CFSTR("lastKnownRoadLocation");
    }
    else
    {
      objc_msgSend(v13, "dictionaryRepresentation");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = CFSTR("last_known_road_location");
    }
    objc_msgSend(v4, "setObject:forKey:", v15, v16);

  }
  if (objc_msgSend(a1[4], "count"))
  {
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(a1[4], "count"));
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v18 = a1[4];
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v28 != v21)
            objc_enumerationMutation(v18);
          v23 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v23, "jsonRepresentation");
          else
            objc_msgSend(v23, "dictionaryRepresentation", (_QWORD)v27);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "addObject:", v24, (_QWORD)v27);

        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      }
      while (v20);
    }

    if (a2)
      v25 = CFSTR("deviceHistoricalLocation");
    else
      v25 = CFSTR("device_historical_location");
    objc_msgSend(v4, "setObject:forKey:", v17, v25, (_QWORD)v27);

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEORPUserLocationDetails _dictionaryRepresentation:]((id *)&self->super.super.isa, 1);
}

- (GEORPUserLocationDetails)initWithDictionary:(id)a3
{
  return (GEORPUserLocationDetails *)-[GEORPUserLocationDetails _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  GEORPTimestamp *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  GEOLocation *v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  GEOLocation *v18;
  uint64_t v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  uint64_t v28;
  GEOLocation *v29;
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
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("currentTime");
      else
        v6 = CFSTR("current_time");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = [GEORPTimestamp alloc];
        if ((a3 & 1) != 0)
          v9 = -[GEORPTimestamp initWithJSON:](v8, "initWithJSON:", v7);
        else
          v9 = -[GEORPTimestamp initWithDictionary:](v8, "initWithDictionary:", v7);
        v10 = (void *)v9;
        objc_msgSend(a1, "setCurrentTime:", v9);

      }
      if (a3)
        v11 = CFSTR("currentUserLocation");
      else
        v11 = CFSTR("current_user_location");
      objc_msgSend(v5, "objectForKeyedSubscript:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v13 = [GEOLocation alloc];
        if ((a3 & 1) != 0)
          v14 = -[GEOLocation initWithJSON:](v13, "initWithJSON:", v12);
        else
          v14 = -[GEOLocation initWithDictionary:](v13, "initWithDictionary:", v12);
        v15 = (void *)v14;
        objc_msgSend(a1, "setCurrentUserLocation:", v14);

      }
      if (a3)
        v16 = CFSTR("lastKnownRoadLocation");
      else
        v16 = CFSTR("last_known_road_location");
      objc_msgSend(v5, "objectForKeyedSubscript:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v18 = [GEOLocation alloc];
        if ((a3 & 1) != 0)
          v19 = -[GEOLocation initWithJSON:](v18, "initWithJSON:", v17);
        else
          v19 = -[GEOLocation initWithDictionary:](v18, "initWithDictionary:", v17);
        v20 = (void *)v19;
        objc_msgSend(a1, "setLastKnownRoadLocation:", v19);

      }
      if (a3)
        v21 = CFSTR("deviceHistoricalLocation");
      else
        v21 = CFSTR("device_historical_location");
      objc_msgSend(v5, "objectForKeyedSubscript:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v33 = v5;
        v36 = 0u;
        v37 = 0u;
        v34 = 0u;
        v35 = 0u;
        v23 = v22;
        v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
        if (v24)
        {
          v25 = v24;
          v26 = *(_QWORD *)v35;
          do
          {
            for (i = 0; i != v25; ++i)
            {
              if (*(_QWORD *)v35 != v26)
                objc_enumerationMutation(v23);
              v28 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v29 = [GEOLocation alloc];
                if ((a3 & 1) != 0)
                  v30 = -[GEOLocation initWithJSON:](v29, "initWithJSON:", v28);
                else
                  v30 = -[GEOLocation initWithDictionary:](v29, "initWithDictionary:", v28);
                v31 = (void *)v30;
                objc_msgSend(a1, "addDeviceHistoricalLocation:", v30);

              }
            }
            v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
          }
          while (v25);
        }

        v5 = v33;
      }

    }
  }

  return a1;
}

- (GEORPUserLocationDetails)initWithJSON:(id)a3
{
  return (GEORPUserLocationDetails *)-[GEORPUserLocationDetails _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_340;
    else
      v8 = (int *)&readAll__nonRecursiveTag_341;
    GEORPUserLocationDetailsReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEORPUserLocationDetailsCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPUserLocationDetailsIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPUserLocationDetailsReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
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
  if (self->_reader && (_GEORPUserLocationDetailsIsDirty((uint64_t)self) & 1) == 0)
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
    -[GEORPUserLocationDetails readAll:](self, "readAll:", 0);
    if (self->_currentTime)
      PBDataWriterWriteSubmessage();
    if (self->_currentUserLocation)
      PBDataWriterWriteSubmessage();
    if (self->_lastKnownRoadLocation)
      PBDataWriterWriteSubmessage();
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v6 = self->_deviceHistoricalLocations;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v13;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v6);
          PBDataWriterWriteSubmessage();
          ++v9;
        }
        while (v7 != v9);
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

  }
}

- (void)clearSensitiveFields:(unint64_t)a3
{
  GEORPUserLocationDetailsClearSensitiveFields((id *)&self->super.super.isa, a3, 1);
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v3 = a3;
  v16 = *MEMORY[0x1E0C80C00];
  -[GEORPUserLocationDetails _readCurrentUserLocation]((uint64_t)self);
  if (-[GEOLocation hasGreenTeaWithValue:](self->_currentUserLocation, "hasGreenTeaWithValue:", v3))
    return 1;
  -[GEORPUserLocationDetails _readDeviceHistoricalLocations]((uint64_t)self);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = self->_deviceHistoricalLocations;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v9), "hasGreenTeaWithValue:", v3, (_QWORD)v11) & 1) != 0)
        {

          return 1;
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v7)
        continue;
      break;
    }
  }

  -[GEORPUserLocationDetails _readLastKnownRoadLocation]((uint64_t)self);
  return -[GEOLocation hasGreenTeaWithValue:](self->_lastKnownRoadLocation, "hasGreenTeaWithValue:", v3);
}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  id *v8;

  v8 = (id *)a3;
  -[GEORPUserLocationDetails readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v8 + 1, self->_reader);
  *((_DWORD *)v8 + 12) = self->_readerMarkPos;
  *((_DWORD *)v8 + 13) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_currentTime)
    objc_msgSend(v8, "setCurrentTime:");
  if (self->_currentUserLocation)
    objc_msgSend(v8, "setCurrentUserLocation:");
  if (self->_lastKnownRoadLocation)
    objc_msgSend(v8, "setLastKnownRoadLocation:");
  if (-[GEORPUserLocationDetails deviceHistoricalLocationsCount](self, "deviceHistoricalLocationsCount"))
  {
    objc_msgSend(v8, "clearDeviceHistoricalLocations");
    v4 = -[GEORPUserLocationDetails deviceHistoricalLocationsCount](self, "deviceHistoricalLocationsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[GEORPUserLocationDetails deviceHistoricalLocationAtIndex:](self, "deviceHistoricalLocationAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addDeviceHistoricalLocation:", v7);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_BYTE *)&self->_flags & 0x10) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEORPUserLocationDetailsReadAllFrom((uint64_t)v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return v5;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEORPUserLocationDetails readAll:](self, "readAll:", 0);
  v8 = -[GEORPTimestamp copyWithZone:](self->_currentTime, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  v10 = -[GEOLocation copyWithZone:](self->_currentUserLocation, "copyWithZone:", a3);
  v11 = (void *)v5[3];
  v5[3] = v10;

  v12 = -[GEOLocation copyWithZone:](self->_lastKnownRoadLocation, "copyWithZone:", a3);
  v13 = (void *)v5[5];
  v5[5] = v12;

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v14 = self->_deviceHistoricalLocations;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v21;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v21 != v16)
          objc_enumerationMutation(v14);
        v18 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v17), "copyWithZone:", a3, (_QWORD)v20);
        objc_msgSend(v5, "addDeviceHistoricalLocation:", v18);

        ++v17;
      }
      while (v15 != v17);
      v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v15);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  GEORPTimestamp *currentTime;
  GEOLocation *currentUserLocation;
  GEOLocation *lastKnownRoadLocation;
  NSMutableArray *deviceHistoricalLocations;
  char v9;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((-[GEORPUserLocationDetails readAll:](self, "readAll:", 1),
         objc_msgSend(v4, "readAll:", 1),
         currentTime = self->_currentTime,
         !((unint64_t)currentTime | v4[2]))
     || -[GEORPTimestamp isEqual:](currentTime, "isEqual:"))
    && ((currentUserLocation = self->_currentUserLocation, !((unint64_t)currentUserLocation | v4[3]))
     || -[GEOLocation isEqual:](currentUserLocation, "isEqual:"))
    && ((lastKnownRoadLocation = self->_lastKnownRoadLocation, !((unint64_t)lastKnownRoadLocation | v4[5]))
     || -[GEOLocation isEqual:](lastKnownRoadLocation, "isEqual:")))
  {
    deviceHistoricalLocations = self->_deviceHistoricalLocations;
    if ((unint64_t)deviceHistoricalLocations | v4[4])
      v9 = -[NSMutableArray isEqual:](deviceHistoricalLocations, "isEqual:");
    else
      v9 = 1;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;

  -[GEORPUserLocationDetails readAll:](self, "readAll:", 1);
  v3 = -[GEORPTimestamp hash](self->_currentTime, "hash");
  v4 = -[GEOLocation hash](self->_currentUserLocation, "hash") ^ v3;
  v5 = -[GEOLocation hash](self->_lastKnownRoadLocation, "hash");
  return v4 ^ v5 ^ -[NSMutableArray hash](self->_deviceHistoricalLocations, "hash");
}

- (void)mergeFrom:(id)a3
{
  id *v4;
  GEORPTimestamp *currentTime;
  id v6;
  GEOLocation *currentUserLocation;
  id v8;
  GEOLocation *lastKnownRoadLocation;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = (id *)a3;
  objc_msgSend(v4, "readAll:", 0);
  currentTime = self->_currentTime;
  v6 = v4[2];
  if (currentTime)
  {
    if (v6)
      -[GEORPTimestamp mergeFrom:](currentTime, "mergeFrom:");
  }
  else if (v6)
  {
    -[GEORPUserLocationDetails setCurrentTime:](self, "setCurrentTime:");
  }
  currentUserLocation = self->_currentUserLocation;
  v8 = v4[3];
  if (currentUserLocation)
  {
    if (v8)
      -[GEOLocation mergeFrom:](currentUserLocation, "mergeFrom:");
  }
  else if (v8)
  {
    -[GEORPUserLocationDetails setCurrentUserLocation:](self, "setCurrentUserLocation:");
  }
  lastKnownRoadLocation = self->_lastKnownRoadLocation;
  v10 = v4[5];
  if (lastKnownRoadLocation)
  {
    if (v10)
      -[GEOLocation mergeFrom:](lastKnownRoadLocation, "mergeFrom:");
  }
  else if (v10)
  {
    -[GEORPUserLocationDetails setLastKnownRoadLocation:](self, "setLastKnownRoadLocation:");
  }
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v11 = v4[4];
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v17 != v14)
          objc_enumerationMutation(v11);
        -[GEORPUserLocationDetails addDeviceHistoricalLocation:](self, "addDeviceHistoricalLocation:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i), (_QWORD)v16);
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v13);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastKnownRoadLocation, 0);
  objc_storeStrong((id *)&self->_deviceHistoricalLocations, 0);
  objc_storeStrong((id *)&self->_currentUserLocation, 0);
  objc_storeStrong((id *)&self->_currentTime, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
