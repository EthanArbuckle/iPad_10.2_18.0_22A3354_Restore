@implementation GEOComposedWaypoint

- (GEOComposedWaypoint)init
{
  GEOComposedWaypoint *v2;
  GEOComposedWaypoint *v3;
  GEOComposedWaypoint *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOComposedWaypoint;
  v2 = -[GEOComposedWaypoint init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOComposedWaypoint)initWithData:(id)a3
{
  GEOComposedWaypoint *v3;
  GEOComposedWaypoint *v4;
  GEOComposedWaypoint *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOComposedWaypoint;
  v3 = -[GEOComposedWaypoint initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readWaypoint
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 108) & 0x800) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOComposedWaypointReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readWaypoint_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (BOOL)hasWaypoint
{
  -[GEOComposedWaypoint _readWaypoint]((uint64_t)self);
  return self->_waypoint != 0;
}

- (GEOWaypointTyped)waypoint
{
  -[GEOComposedWaypoint _readWaypoint]((uint64_t)self);
  return self->_waypoint;
}

- (void)setWaypoint:(id)a3
{
  *(_WORD *)&self->_flags |= 0x1800u;
  objc_storeStrong((id *)&self->_waypoint, a3);
}

- (void)_readLatLng
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 108) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOComposedWaypointReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLatLng_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (BOOL)hasLatLng
{
  -[GEOComposedWaypoint _readLatLng]((uint64_t)self);
  return self->_latLng != 0;
}

- (GEOLatLng)latLng
{
  -[GEOComposedWaypoint _readLatLng]((uint64_t)self);
  return self->_latLng;
}

- (void)setLatLng:(id)a3
{
  *(_WORD *)&self->_flags |= 0x1040u;
  objc_storeStrong((id *)&self->_latLng, a3);
}

- (void)_readMapItemStorage
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 108) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOComposedWaypointReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMapItemStorage_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (BOOL)hasMapItemStorage
{
  -[GEOComposedWaypoint _readMapItemStorage]((uint64_t)self);
  return self->_mapItemStorage != 0;
}

- (GEOMapItemStorage)mapItemStorage
{
  -[GEOComposedWaypoint _readMapItemStorage]((uint64_t)self);
  return self->_mapItemStorage;
}

- (void)setMapItemStorage:(id)a3
{
  *(_WORD *)&self->_flags |= 0x1100u;
  objc_storeStrong((id *)&self->_mapItemStorage, a3);
}

- (unint64_t)muid
{
  return self->_muid;
}

- (void)setMuid:(unint64_t)a3
{
  *(_WORD *)&self->_flags |= 0x1002u;
  self->_muid = a3;
}

- (void)setHasMuid:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4098;
  else
    v3 = 4096;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasMuid
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
}

- (void)_readStyleAttributesData
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 108) & 0x200) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOComposedWaypointReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readStyleAttributesData_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (BOOL)hasStyleAttributesData
{
  -[GEOComposedWaypoint _readStyleAttributesData]((uint64_t)self);
  return self->_styleAttributesData != 0;
}

- (NSData)styleAttributesData
{
  -[GEOComposedWaypoint _readStyleAttributesData]((uint64_t)self);
  return self->_styleAttributesData;
}

- (void)setStyleAttributesData:(id)a3
{
  *(_WORD *)&self->_flags |= 0x1200u;
  objc_storeStrong((id *)&self->_styleAttributesData, a3);
}

- (void)_readUniqueWaypointID
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 108) & 0x400) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOComposedWaypointReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readUniqueWaypointID_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (BOOL)hasUniqueWaypointID
{
  -[GEOComposedWaypoint _readUniqueWaypointID]((uint64_t)self);
  return self->_uniqueWaypointID != 0;
}

- (NSData)uniqueWaypointID
{
  -[GEOComposedWaypoint _readUniqueWaypointID]((uint64_t)self);
  return self->_uniqueWaypointID;
}

- (void)setUniqueWaypointID:(id)a3
{
  *(_WORD *)&self->_flags |= 0x1400u;
  objc_storeStrong((id *)&self->_uniqueWaypointID, a3);
}

- (void)_readFindMyHandleID
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 108) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOComposedWaypointReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readFindMyHandleID_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (BOOL)hasFindMyHandleID
{
  -[GEOComposedWaypoint _readFindMyHandleID]((uint64_t)self);
  return self->_findMyHandleID != 0;
}

- (NSString)findMyHandleID
{
  -[GEOComposedWaypoint _readFindMyHandleID]((uint64_t)self);
  return self->_findMyHandleID;
}

- (void)setFindMyHandleID:(id)a3
{
  *(_WORD *)&self->_flags |= 0x1020u;
  objc_storeStrong((id *)&self->_findMyHandleID, a3);
}

- (BOOL)isOutsideOfflineDownloadedRegion
{
  os_unfair_lock_s *p_readerLock;
  __int16 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  return (flags & 0x10) != 0 && self->_isOutsideOfflineDownloadedRegion;
}

- (void)setIsOutsideOfflineDownloadedRegion:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x1010u;
  self->_isOutsideOfflineDownloadedRegion = a3;
}

- (void)setHasIsOutsideOfflineDownloadedRegion:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4112;
  else
    v3 = 4096;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFEF | v3;
}

- (BOOL)hasIsOutsideOfflineDownloadedRegion
{
  return (*(_WORD *)&self->_flags >> 4) & 1;
}

- (int)type
{
  os_unfair_lock_s *p_readerLock;
  __int16 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 4) != 0)
    return self->_type;
  else
    return 0;
}

- (void)setType:(int)a3
{
  *(_WORD *)&self->_flags |= 0x1004u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4100;
  else
    v3 = 4096;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFB | v3;
}

- (BOOL)hasType
{
  return (*(_WORD *)&self->_flags >> 2) & 1;
}

- (id)typeAsString:(int)a3
{
  if (a3 < 4)
    return off_1E1C09188[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LOCATION")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MUID")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("PLACE")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_readLocation
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 108) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOComposedWaypointReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLocation_tags_4);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (BOOL)hasLocation
{
  -[GEOComposedWaypoint _readLocation]((uint64_t)self);
  return self->_location != 0;
}

- (GEOLocation)location
{
  -[GEOComposedWaypoint _readLocation]((uint64_t)self);
  return self->_location;
}

- (void)setLocation:(id)a3
{
  *(_WORD *)&self->_flags |= 0x1080u;
  objc_storeStrong((id *)&self->_location, a3);
}

- (BOOL)isCurrentLocation
{
  return self->_isCurrentLocation;
}

- (void)setIsCurrentLocation:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x1008u;
  self->_isCurrentLocation = a3;
}

- (void)setHasIsCurrentLocation:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4104;
  else
    v3 = 4096;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFF7 | v3;
}

- (BOOL)hasIsCurrentLocation
{
  return (*(_WORD *)&self->_flags >> 3) & 1;
}

- (unint64_t)clientFeatureID
{
  return self->_clientFeatureID;
}

- (void)setClientFeatureID:(unint64_t)a3
{
  *(_WORD *)&self->_flags |= 0x1001u;
  self->_clientFeatureID = a3;
}

- (void)setHasClientFeatureID:(BOOL)a3
{
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFE | a3 | 0x1000;
}

- (BOOL)hasClientFeatureID
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
  v8.super_class = (Class)GEOComposedWaypoint;
  -[GEOComposedWaypoint description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOComposedWaypoint dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOComposedWaypoint _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;
  __CFString *v25;
  void *v26;
  void *v27;
  void *v28;
  __int16 v29;
  void *v30;
  void *v31;

  if (a1)
  {
    objc_msgSend((id)a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)a1, "waypoint");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      if ((a2 & 1) != 0)
        objc_msgSend(v5, "jsonRepresentation");
      else
        objc_msgSend(v5, "dictionaryRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("waypoint"));

    }
    objc_msgSend((id)a1, "latLng");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      if ((a2 & 1) != 0)
        objc_msgSend(v8, "jsonRepresentation");
      else
        objc_msgSend(v8, "dictionaryRepresentation");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("latLng"));

    }
    objc_msgSend((id)a1, "mapItemStorage");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      if ((a2 & 1) != 0)
        objc_msgSend(v11, "jsonRepresentation");
      else
        objc_msgSend(v11, "dictionaryRepresentation");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("mapItemStorage"));

    }
    if ((*(_WORD *)(a1 + 108) & 2) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 56));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("muid"));

    }
    objc_msgSend((id)a1, "styleAttributesData");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v15, "base64EncodedStringWithOptions:", 0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKey:", v17, CFSTR("styleAttributesData"));

      }
      else
      {
        objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("styleAttributesData"));
      }
    }

    objc_msgSend((id)a1, "uniqueWaypointID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v18)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v18, "base64EncodedStringWithOptions:", 0);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKey:", v20, CFSTR("uniqueWaypointID"));

      }
      else
      {
        objc_msgSend(v4, "setObject:forKey:", v18, CFSTR("uniqueWaypointID"));
      }
    }

    objc_msgSend((id)a1, "findMyHandleID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
      objc_msgSend(v4, "setObject:forKey:", v21, CFSTR("findMyHandleID"));

    v22 = *(_WORD *)(a1 + 108);
    if ((v22 & 0x10) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 105));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v23, CFSTR("isOutsideOfflineDownloadedRegion"));

      v22 = *(_WORD *)(a1 + 108);
    }
    if ((v22 & 4) != 0)
    {
      v24 = *(int *)(a1 + 100);
      if (v24 >= 4)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 100));
        v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v25 = off_1E1C09188[v24];
      }
      objc_msgSend(v4, "setObject:forKey:", v25, CFSTR("type"));

    }
    objc_msgSend((id)a1, "location");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v26;
    if (v26)
    {
      if ((a2 & 1) != 0)
        objc_msgSend(v26, "jsonRepresentation");
      else
        objc_msgSend(v26, "dictionaryRepresentation");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v28, CFSTR("location"));

    }
    v29 = *(_WORD *)(a1 + 108);
    if ((v29 & 8) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 104));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v30, CFSTR("isCurrentLocation"));

      v29 = *(_WORD *)(a1 + 108);
    }
    if ((v29 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 16));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v31, CFSTR("clientFeatureID"));

    }
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOComposedWaypoint _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOComposedWaypoint)initWithDictionary:(id)a3
{
  return (GEOComposedWaypoint *)-[GEOComposedWaypoint _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(char)a3 isJSON:
{
  id v5;
  void *v6;
  GEOWaypointTyped *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  GEOLatLng *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  GEOMapItemStorage *v15;
  uint64_t v16;
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
  id v27;
  uint64_t v28;
  void *v29;
  GEOLocation *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;

  v5 = a2;
  if (!a1)
    goto LABEL_52;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_52;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("waypoint"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = [GEOWaypointTyped alloc];
    if ((a3 & 1) != 0)
      v8 = -[GEOWaypointTyped initWithJSON:](v7, "initWithJSON:", v6);
    else
      v8 = -[GEOWaypointTyped initWithDictionary:](v7, "initWithDictionary:", v6);
    v9 = (void *)v8;
    objc_msgSend(a1, "setWaypoint:", v8);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("latLng"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = [GEOLatLng alloc];
    if ((a3 & 1) != 0)
      v12 = -[GEOLatLng initWithJSON:](v11, "initWithJSON:", v10);
    else
      v12 = -[GEOLatLng initWithDictionary:](v11, "initWithDictionary:", v10);
    v13 = (void *)v12;
    objc_msgSend(a1, "setLatLng:", v12);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("mapItemStorage"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v15 = [GEOMapItemStorage alloc];
    if ((a3 & 1) != 0)
      v16 = -[GEOMapItemStorage initWithJSON:](v15, "initWithJSON:", v14);
    else
      v16 = -[GEOMapItemStorage initWithDictionary:](v15, "initWithDictionary:", v14);
    v17 = (void *)v16;
    objc_msgSend(a1, "setMapItemStorage:", v16);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("muid"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setMuid:", objc_msgSend(v18, "unsignedLongLongValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("styleAttributesData"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v19, 0);
    objc_msgSend(a1, "setStyleAttributesData:", v20);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("uniqueWaypointID"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v21, 0);
    objc_msgSend(a1, "setUniqueWaypointID:", v22);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("findMyHandleID"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v24 = (void *)objc_msgSend(v23, "copy");
    objc_msgSend(a1, "setFindMyHandleID:", v24);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("isOutsideOfflineDownloadedRegion"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setIsOutsideOfflineDownloadedRegion:", objc_msgSend(v25, "BOOLValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("type"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v27 = v26;
    if ((objc_msgSend(v27, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
    {
      v28 = 0;
    }
    else if ((objc_msgSend(v27, "isEqualToString:", CFSTR("LOCATION")) & 1) != 0)
    {
      v28 = 1;
    }
    else if ((objc_msgSend(v27, "isEqualToString:", CFSTR("MUID")) & 1) != 0)
    {
      v28 = 2;
    }
    else if (objc_msgSend(v27, "isEqualToString:", CFSTR("PLACE")))
    {
      v28 = 3;
    }
    else
    {
      v28 = 0;
    }

    goto LABEL_41;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v28 = objc_msgSend(v26, "intValue");
LABEL_41:
    objc_msgSend(a1, "setType:", v28);
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("location"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v30 = [GEOLocation alloc];
    if ((a3 & 1) != 0)
      v31 = -[GEOLocation initWithJSON:](v30, "initWithJSON:", v29);
    else
      v31 = -[GEOLocation initWithDictionary:](v30, "initWithDictionary:", v29);
    v32 = (void *)v31;
    objc_msgSend(a1, "setLocation:", v31);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("isCurrentLocation"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setIsCurrentLocation:", objc_msgSend(v33, "BOOLValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("clientFeatureID"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setClientFeatureID:", objc_msgSend(v34, "unsignedLongLongValue"));

LABEL_52:
  return a1;
}

- (GEOComposedWaypoint)initWithJSON:(id)a3
{
  return (GEOComposedWaypoint *)-[GEOComposedWaypoint _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_32;
    else
      v8 = (int *)&readAll__nonRecursiveTag_32;
    GEOComposedWaypointReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEOComposedWaypointCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOComposedWaypointIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOComposedWaypointReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  __int16 flags;
  __int16 v6;
  PBDataReader *v7;
  void *v8;
  id v9;

  v9 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && !_GEOComposedWaypointIsDirty((uint64_t)self))
  {
    v7 = self->_reader;
    objc_sync_enter(v7);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "writeData:", v8);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v7);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOComposedWaypoint readAll:](self, "readAll:", 0);
    if (self->_waypoint)
      PBDataWriterWriteSubmessage();
    if (self->_latLng)
      PBDataWriterWriteSubmessage();
    if (self->_mapItemStorage)
      PBDataWriterWriteSubmessage();
    if ((*(_WORD *)&self->_flags & 2) != 0)
      PBDataWriterWriteUint64Field();
    if (self->_styleAttributesData)
      PBDataWriterWriteDataField();
    if (self->_uniqueWaypointID)
      PBDataWriterWriteDataField();
    if (self->_findMyHandleID)
      PBDataWriterWriteStringField();
    flags = (__int16)self->_flags;
    if ((flags & 0x10) != 0)
    {
      PBDataWriterWriteBOOLField();
      flags = (__int16)self->_flags;
    }
    if ((flags & 4) != 0)
      PBDataWriterWriteInt32Field();
    if (self->_location)
      PBDataWriterWriteSubmessage();
    v6 = (__int16)self->_flags;
    if ((v6 & 8) != 0)
    {
      PBDataWriterWriteBOOLField();
      v6 = (__int16)self->_flags;
    }
    if ((v6 & 1) != 0)
      PBDataWriterWriteUint64Field();
  }

}

- (void)clearSensitiveFields:(unint64_t)a3
{
  GEOComposedWaypointClearSensitiveFields(self, a3, 1);
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[GEOComposedWaypoint _readLatLng]((uint64_t)self);
  if (-[GEOLatLng hasGreenTeaWithValue:](self->_latLng, "hasGreenTeaWithValue:", v3))
    return 1;
  -[GEOComposedWaypoint _readLocation]((uint64_t)self);
  if (-[GEOLocation hasGreenTeaWithValue:](self->_location, "hasGreenTeaWithValue:", v3))
    return 1;
  -[GEOComposedWaypoint _readMapItemStorage]((uint64_t)self);
  if (-[GEOMapItemStorage hasGreenTeaWithValue:](self->_mapItemStorage, "hasGreenTeaWithValue:", v3))
    return 1;
  -[GEOComposedWaypoint _readWaypoint]((uint64_t)self);
  return -[GEOWaypointTyped hasGreenTeaWithValue:](self->_waypoint, "hasGreenTeaWithValue:", v3);
}

- (void)copyTo:(id)a3
{
  id *v4;
  __int16 flags;
  __int16 v6;
  id *v7;

  v7 = (id *)a3;
  -[GEOComposedWaypoint readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v7 + 1, self->_reader);
  *((_DWORD *)v7 + 22) = self->_readerMarkPos;
  *((_DWORD *)v7 + 23) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_waypoint)
    objc_msgSend(v7, "setWaypoint:");
  if (self->_latLng)
    objc_msgSend(v7, "setLatLng:");
  v4 = v7;
  if (self->_mapItemStorage)
  {
    objc_msgSend(v7, "setMapItemStorage:");
    v4 = v7;
  }
  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    v4[7] = (id)self->_muid;
    *((_WORD *)v4 + 54) |= 2u;
  }
  if (self->_styleAttributesData)
  {
    objc_msgSend(v7, "setStyleAttributesData:");
    v4 = v7;
  }
  if (self->_uniqueWaypointID)
  {
    objc_msgSend(v7, "setUniqueWaypointID:");
    v4 = v7;
  }
  if (self->_findMyHandleID)
  {
    objc_msgSend(v7, "setFindMyHandleID:");
    v4 = v7;
  }
  flags = (__int16)self->_flags;
  if ((flags & 0x10) != 0)
  {
    *((_BYTE *)v4 + 105) = self->_isOutsideOfflineDownloadedRegion;
    *((_WORD *)v4 + 54) |= 0x10u;
    flags = (__int16)self->_flags;
  }
  if ((flags & 4) != 0)
  {
    *((_DWORD *)v4 + 25) = self->_type;
    *((_WORD *)v4 + 54) |= 4u;
  }
  if (self->_location)
  {
    objc_msgSend(v7, "setLocation:");
    v4 = v7;
  }
  v6 = (__int16)self->_flags;
  if ((v6 & 8) != 0)
  {
    *((_BYTE *)v4 + 104) = self->_isCurrentLocation;
    *((_WORD *)v4 + 54) |= 8u;
    v6 = (__int16)self->_flags;
  }
  if ((v6 & 1) != 0)
  {
    v4[2] = (id)self->_clientFeatureID;
    *((_WORD *)v4 + 54) |= 1u;
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
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  __int16 flags;
  id v22;
  void *v23;
  __int16 v24;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x1000) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOComposedWaypointReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOComposedWaypoint readAll:](self, "readAll:", 0);
  v9 = -[GEOWaypointTyped copyWithZone:](self->_waypoint, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v9;

  v11 = -[GEOLatLng copyWithZone:](self->_latLng, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v11;

  v13 = -[GEOMapItemStorage copyWithZone:](self->_mapItemStorage, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v13;

  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    *(_QWORD *)(v5 + 56) = self->_muid;
    *(_WORD *)(v5 + 108) |= 2u;
  }
  v15 = -[NSData copyWithZone:](self->_styleAttributesData, "copyWithZone:", a3);
  v16 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v15;

  v17 = -[NSData copyWithZone:](self->_uniqueWaypointID, "copyWithZone:", a3);
  v18 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v17;

  v19 = -[NSString copyWithZone:](self->_findMyHandleID, "copyWithZone:", a3);
  v20 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v19;

  flags = (__int16)self->_flags;
  if ((flags & 0x10) != 0)
  {
    *(_BYTE *)(v5 + 105) = self->_isOutsideOfflineDownloadedRegion;
    *(_WORD *)(v5 + 108) |= 0x10u;
    flags = (__int16)self->_flags;
  }
  if ((flags & 4) != 0)
  {
    *(_DWORD *)(v5 + 100) = self->_type;
    *(_WORD *)(v5 + 108) |= 4u;
  }
  v22 = -[GEOLocation copyWithZone:](self->_location, "copyWithZone:", a3);
  v23 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v22;

  v24 = (__int16)self->_flags;
  if ((v24 & 8) != 0)
  {
    *(_BYTE *)(v5 + 104) = self->_isCurrentLocation;
    *(_WORD *)(v5 + 108) |= 8u;
    v24 = (__int16)self->_flags;
  }
  if ((v24 & 1) != 0)
  {
    *(_QWORD *)(v5 + 16) = self->_clientFeatureID;
    *(_WORD *)(v5 + 108) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  GEOWaypointTyped *waypoint;
  GEOLatLng *latLng;
  GEOMapItemStorage *mapItemStorage;
  __int16 v8;
  NSData *styleAttributesData;
  NSData *uniqueWaypointID;
  NSString *findMyHandleID;
  __int16 flags;
  __int16 v13;
  GEOLocation *location;
  BOOL v15;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_47;
  -[GEOComposedWaypoint readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  waypoint = self->_waypoint;
  if ((unint64_t)waypoint | *((_QWORD *)v4 + 10))
  {
    if (!-[GEOWaypointTyped isEqual:](waypoint, "isEqual:"))
      goto LABEL_47;
  }
  latLng = self->_latLng;
  if ((unint64_t)latLng | *((_QWORD *)v4 + 4))
  {
    if (!-[GEOLatLng isEqual:](latLng, "isEqual:"))
      goto LABEL_47;
  }
  mapItemStorage = self->_mapItemStorage;
  if ((unint64_t)mapItemStorage | *((_QWORD *)v4 + 6))
  {
    if (!-[GEOMapItemStorage isEqual:](mapItemStorage, "isEqual:"))
      goto LABEL_47;
  }
  v8 = *((_WORD *)v4 + 54);
  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    if ((v8 & 2) == 0 || self->_muid != *((_QWORD *)v4 + 7))
      goto LABEL_47;
  }
  else if ((v8 & 2) != 0)
  {
    goto LABEL_47;
  }
  styleAttributesData = self->_styleAttributesData;
  if ((unint64_t)styleAttributesData | *((_QWORD *)v4 + 8)
    && !-[NSData isEqual:](styleAttributesData, "isEqual:"))
  {
    goto LABEL_47;
  }
  uniqueWaypointID = self->_uniqueWaypointID;
  if ((unint64_t)uniqueWaypointID | *((_QWORD *)v4 + 9))
  {
    if (!-[NSData isEqual:](uniqueWaypointID, "isEqual:"))
      goto LABEL_47;
  }
  findMyHandleID = self->_findMyHandleID;
  if ((unint64_t)findMyHandleID | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](findMyHandleID, "isEqual:"))
      goto LABEL_47;
  }
  flags = (__int16)self->_flags;
  v13 = *((_WORD *)v4 + 54);
  if ((flags & 0x10) != 0)
  {
    if ((v13 & 0x10) == 0)
      goto LABEL_47;
    if (self->_isOutsideOfflineDownloadedRegion)
    {
      if (!*((_BYTE *)v4 + 105))
        goto LABEL_47;
    }
    else if (*((_BYTE *)v4 + 105))
    {
      goto LABEL_47;
    }
  }
  else if ((v13 & 0x10) != 0)
  {
    goto LABEL_47;
  }
  if ((flags & 4) != 0)
  {
    if ((v13 & 4) == 0 || self->_type != *((_DWORD *)v4 + 25))
      goto LABEL_47;
  }
  else if ((v13 & 4) != 0)
  {
    goto LABEL_47;
  }
  location = self->_location;
  if ((unint64_t)location | *((_QWORD *)v4 + 5))
  {
    if (!-[GEOLocation isEqual:](location, "isEqual:"))
      goto LABEL_47;
    flags = (__int16)self->_flags;
    v13 = *((_WORD *)v4 + 54);
  }
  if ((flags & 8) != 0)
  {
    if ((v13 & 8) != 0)
    {
      if (self->_isCurrentLocation)
      {
        if (!*((_BYTE *)v4 + 104))
          goto LABEL_47;
        goto LABEL_43;
      }
      if (!*((_BYTE *)v4 + 104))
        goto LABEL_43;
    }
LABEL_47:
    v15 = 0;
    goto LABEL_48;
  }
  if ((v13 & 8) != 0)
    goto LABEL_47;
LABEL_43:
  v15 = (v13 & 1) == 0;
  if ((flags & 1) != 0)
  {
    if ((v13 & 1) == 0 || self->_clientFeatureID != *((_QWORD *)v4 + 2))
      goto LABEL_47;
    v15 = 1;
  }
LABEL_48:

  return v15;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSUInteger v7;
  __int16 flags;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  __int16 v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v16;
  unint64_t v17;

  -[GEOComposedWaypoint readAll:](self, "readAll:", 1);
  v17 = -[GEOWaypointTyped hash](self->_waypoint, "hash");
  v16 = -[GEOLatLng hash](self->_latLng, "hash");
  v3 = -[GEOMapItemStorage hash](self->_mapItemStorage, "hash");
  if ((*(_WORD *)&self->_flags & 2) != 0)
    v4 = 2654435761u * self->_muid;
  else
    v4 = 0;
  v5 = -[NSData hash](self->_styleAttributesData, "hash");
  v6 = -[NSData hash](self->_uniqueWaypointID, "hash");
  v7 = -[NSString hash](self->_findMyHandleID, "hash");
  flags = (__int16)self->_flags;
  if ((flags & 0x10) != 0)
  {
    v9 = 2654435761 * self->_isOutsideOfflineDownloadedRegion;
    if ((flags & 4) != 0)
      goto LABEL_6;
  }
  else
  {
    v9 = 0;
    if ((flags & 4) != 0)
    {
LABEL_6:
      v10 = 2654435761 * self->_type;
      goto LABEL_9;
    }
  }
  v10 = 0;
LABEL_9:
  v11 = -[GEOLocation hash](self->_location, "hash");
  v12 = (__int16)self->_flags;
  if ((v12 & 8) != 0)
  {
    v13 = 2654435761 * self->_isCurrentLocation;
    if ((v12 & 1) != 0)
      goto LABEL_11;
LABEL_13:
    v14 = 0;
    return v16 ^ v17 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v9 ^ v10 ^ v11 ^ v13 ^ v14;
  }
  v13 = 0;
  if ((v12 & 1) == 0)
    goto LABEL_13;
LABEL_11:
  v14 = 2654435761u * self->_clientFeatureID;
  return v16 ^ v17 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v9 ^ v10 ^ v11 ^ v13 ^ v14;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  GEOWaypointTyped *waypoint;
  uint64_t v6;
  GEOLatLng *latLng;
  uint64_t v8;
  GEOMapItemStorage *mapItemStorage;
  uint64_t v10;
  __int16 v11;
  GEOLocation *location;
  uint64_t v13;
  __int16 v14;
  _QWORD *v15;

  v15 = a3;
  objc_msgSend(v15, "readAll:", 0);
  v4 = v15;
  waypoint = self->_waypoint;
  v6 = v15[10];
  if (waypoint)
  {
    if (!v6)
      goto LABEL_7;
    -[GEOWaypointTyped mergeFrom:](waypoint, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[GEOComposedWaypoint setWaypoint:](self, "setWaypoint:");
  }
  v4 = v15;
LABEL_7:
  latLng = self->_latLng;
  v8 = v4[4];
  if (latLng)
  {
    if (!v8)
      goto LABEL_13;
    -[GEOLatLng mergeFrom:](latLng, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_13;
    -[GEOComposedWaypoint setLatLng:](self, "setLatLng:");
  }
  v4 = v15;
LABEL_13:
  mapItemStorage = self->_mapItemStorage;
  v10 = v4[6];
  if (mapItemStorage)
  {
    if (!v10)
      goto LABEL_19;
    -[GEOMapItemStorage mergeFrom:](mapItemStorage, "mergeFrom:");
  }
  else
  {
    if (!v10)
      goto LABEL_19;
    -[GEOComposedWaypoint setMapItemStorage:](self, "setMapItemStorage:");
  }
  v4 = v15;
LABEL_19:
  if ((*((_WORD *)v4 + 54) & 2) != 0)
  {
    self->_muid = v4[7];
    *(_WORD *)&self->_flags |= 2u;
  }
  if (v4[8])
  {
    -[GEOComposedWaypoint setStyleAttributesData:](self, "setStyleAttributesData:");
    v4 = v15;
  }
  if (v4[9])
  {
    -[GEOComposedWaypoint setUniqueWaypointID:](self, "setUniqueWaypointID:");
    v4 = v15;
  }
  if (v4[3])
  {
    -[GEOComposedWaypoint setFindMyHandleID:](self, "setFindMyHandleID:");
    v4 = v15;
  }
  v11 = *((_WORD *)v4 + 54);
  if ((v11 & 0x10) != 0)
  {
    self->_isOutsideOfflineDownloadedRegion = *((_BYTE *)v4 + 105);
    *(_WORD *)&self->_flags |= 0x10u;
    v11 = *((_WORD *)v4 + 54);
  }
  if ((v11 & 4) != 0)
  {
    self->_type = *((_DWORD *)v4 + 25);
    *(_WORD *)&self->_flags |= 4u;
  }
  location = self->_location;
  v13 = v4[5];
  if (location)
  {
    if (!v13)
      goto LABEL_37;
    -[GEOLocation mergeFrom:](location, "mergeFrom:");
  }
  else
  {
    if (!v13)
      goto LABEL_37;
    -[GEOComposedWaypoint setLocation:](self, "setLocation:");
  }
  v4 = v15;
LABEL_37:
  v14 = *((_WORD *)v4 + 54);
  if ((v14 & 8) != 0)
  {
    self->_isCurrentLocation = *((_BYTE *)v4 + 104);
    *(_WORD *)&self->_flags |= 8u;
    v14 = *((_WORD *)v4 + 54);
  }
  if ((v14 & 1) != 0)
  {
    self->_clientFeatureID = v4[2];
    *(_WORD *)&self->_flags |= 1u;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_waypoint, 0);
  objc_storeStrong((id *)&self->_uniqueWaypointID, 0);
  objc_storeStrong((id *)&self->_styleAttributesData, 0);
  objc_storeStrong((id *)&self->_mapItemStorage, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_latLng, 0);
  objc_storeStrong((id *)&self->_findMyHandleID, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

- (GEOComposedWaypoint)initWithCompanionWaypoint:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  GEORouteBuilder_PersistentData *v10;
  void *v11;
  GEOComposedWaypointToRoute *v12;
  GEOComposedWaypoint *p_super;
  void *v14;
  GEOComposedWaypoint *v15;
  void *v16;
  GEOComposedWaypoint *v18;
  GEOComposedWaypoint *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  GEOComposedWaypoint *v23;
  uint64_t v24;

  v4 = a3;
  objc_msgSend(v4, "routeData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(v4, "mapItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v15 = [GEOComposedWaypoint alloc];
      objc_msgSend(v4, "mapItem");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      p_super = -[GEOComposedWaypoint initWithMapItem:](v15, "initWithMapItem:", v16);

      -[GEOComposedWaypoint setIsCurrentLocation:](p_super, "setIsCurrentLocation:", objc_msgSend(v4, "isCurrentLocation"));
      -[GEOComposedWaypoint recomputeGeoWaypointTyped](p_super, "recomputeGeoWaypointTyped");
      goto LABEL_7;
    }
    if (objc_msgSend(v4, "isCurrentLocation"))
    {
      v18 = [GEOComposedWaypoint alloc];
      objc_msgSend(v4, "location");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v18;
      v20 = v9;
      v21 = 1;
    }
    else
    {
      objc_msgSend(v4, "findMyHandleID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      v23 = [GEOComposedWaypoint alloc];
      objc_msgSend(v4, "location");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v22)
      {
        objc_msgSend(v4, "findMyHandleID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = -[GEOComposedWaypoint initWithLocation:findMyHandleID:](v23, "initWithLocation:findMyHandleID:", v9, v11);
        goto LABEL_3;
      }
      v19 = v23;
      v20 = v9;
      v21 = 0;
    }
    p_super = -[GEOComposedWaypoint initWithLocation:isCurrentLocation:](v19, "initWithLocation:isCurrentLocation:", v20, v21);

    goto LABEL_4;
  }
  v6 = (void *)MEMORY[0x1E0CB3710];
  v7 = objc_opt_class();
  objc_msgSend(v4, "routeData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  objc_msgSend(v6, "unarchivedObjectOfClass:fromData:error:", v7, v8, &v24);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[GEORouteBuilder_PersistentData initWithPersistentData:]([GEORouteBuilder_PersistentData alloc], "initWithPersistentData:", v9);
  -[GEORouteBuilderBase buildRoute](v10, "buildRoute");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[GEOComposedWaypointToRoute initWithRoute:]([GEOComposedWaypointToRoute alloc], "initWithRoute:", v11);
LABEL_3:
  p_super = &v12->super;

LABEL_4:
LABEL_7:

  return p_super;
}

- (BOOL)isSameAs:(id)a3
{
  return -[GEOComposedWaypoint isSameAs:comparisonCriteria:](self, "isSameAs:comparisonCriteria:", a3, 7);
}

- (BOOL)isSameAs:(id)a3 comparisonCriteria:(unint64_t)a4
{
  GEOComposedWaypoint *v6;
  void *v7;
  void *v8;
  char v9;
  BOOL v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  id v23;
  id v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  id v41;
  id v42;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  id v51;
  void *v53;
  uint64_t v54;
  uint64_t k;
  GEOComposedWaypoint *v56;
  void *v57;
  id v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t m;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t n;
  void *v71;
  double v72;
  double v73;
  double v74;
  unint64_t v75;
  GEOComposedWaypoint *v76;
  GEOComposedWaypoint *v77;
  GEOComposedWaypoint *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  char v83;
  void *v84;
  void *v85;
  id obj;
  void *v87;
  void *v88;
  uint64_t v89;
  void *v90;
  uint64_t v91;
  uint64_t v92;
  void *v93;
  void *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  void *v98;
  uint64_t v99;
  uint64_t v100;
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
  _BYTE v133[128];
  _BYTE v134[128];
  _BYTE v135[128];
  _BYTE v136[128];
  _BYTE v137[128];
  _BYTE v138[128];
  _BYTE v139[128];
  _BYTE v140[128];
  uint64_t v141;

  v141 = *MEMORY[0x1E0C80C00];
  v6 = (GEOComposedWaypoint *)a3;
  if (self != v6)
  {
    if ((a4 & 2) == 0
      || (-[GEOComposedWaypoint _muidCandidatesForComparison](self, "_muidCandidatesForComparison"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          -[GEOComposedWaypoint _muidCandidatesForComparison](v6, "_muidCandidatesForComparison"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v9 = objc_msgSend(v7, "intersectsSet:", v8),
          v8,
          v7,
          (v9 & 1) == 0))
    {
      if ((a4 & 1) != 0)
      {
        -[GEOComposedWaypoint _locationCandidatesForComparison](self, "_locationCandidatesForComparison");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[GEOComposedWaypoint _locationCandidatesForComparison](v6, "_locationCandidatesForComparison");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v129 = 0u;
        v130 = 0u;
        v131 = 0u;
        v132 = 0u;
        obj = v11;
        v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v129, v140, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v130;
          v76 = self;
          v77 = v6;
          v75 = a4;
          v97 = *(_QWORD *)v130;
          do
          {
            for (i = 0; i != v14; ++i)
            {
              if (*(_QWORD *)v130 != v15)
                objc_enumerationMutation(obj);
              v17 = *(void **)(*((_QWORD *)&v129 + 1) + 8 * i);
              v125 = 0u;
              v126 = 0u;
              v127 = 0u;
              v128 = 0u;
              v18 = v12;
              v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v125, v139, 16);
              if (v19)
              {
                v20 = v19;
                v21 = *(_QWORD *)v126;
                do
                {
                  for (j = 0; j != v20; ++j)
                  {
                    if (*(_QWORD *)v126 != v21)
                      objc_enumerationMutation(v18);
                    v23 = *(id *)(*((_QWORD *)&v125 + 1) + 8 * j);
                    v24 = v17;
                    objc_msgSend(v24, "coordinate");
                    v26 = v25;
                    v28 = v27;
                    objc_msgSend(v23, "coordinate");
                    v30 = v29;
                    v32 = v31;

                    if (vabdd_f64(v26, v30) < 0.00000000999999994 && vabdd_f64(v28, v32) < 0.00000000999999994)
                    {
LABEL_67:
                      v10 = 1;
                      v50 = v18;
                      v51 = obj;
                      v6 = v77;
                      goto LABEL_68;
                    }
                  }
                  v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v125, v139, 16);
                }
                while (v20);
              }

              v15 = v97;
            }
            v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v129, v140, 16);
            self = v76;
            v6 = v77;
            a4 = v75;
          }
          while (v14);
        }

      }
      if ((a4 & 4) == 0)
        goto LABEL_65;
      v75 = a4;
      v76 = self;
      -[GEOComposedWaypoint _addressCandidatesForComparison](self, "_addressCandidatesForComparison");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v77 = v6;
      -[GEOComposedWaypoint _addressCandidatesForComparison](v6, "_addressCandidatesForComparison");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      v121 = 0u;
      v122 = 0u;
      v123 = 0u;
      v124 = 0u;
      obj = v33;
      v91 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v121, v138, 16);
      if (!v91)
        goto LABEL_64;
      v89 = *(_QWORD *)v122;
      while (1)
      {
        v34 = 0;
        do
        {
          if (*(_QWORD *)v122 != v89)
            objc_enumerationMutation(obj);
          v92 = v34;
          v35 = *(void **)(*((_QWORD *)&v121 + 1) + 8 * v34);
          v117 = 0u;
          v118 = 0u;
          v119 = 0u;
          v120 = 0u;
          v18 = v90;
          v36 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v117, v137, 16);
          if (v36)
          {
            v37 = v36;
            v38 = *(_QWORD *)v118;
            do
            {
              v39 = 0;
              do
              {
                if (*(_QWORD *)v118 != v38)
                  objc_enumerationMutation(v18);
                v40 = *(void **)(*((_QWORD *)&v117 + 1) + 8 * v39);
                v41 = v35;
                v42 = v40;
                if (!objc_msgSend(v41, "hasCountryCode")
                  || !objc_msgSend(v42, "hasCountryCode"))
                {
                  goto LABEL_53;
                }
                objc_msgSend(v41, "countryCode");
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v42, "countryCode");
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                if (!objc_msgSend(v43, "isEqualToString:", v44)
                  || !objc_msgSend(v41, "hasAdministrativeArea")
                  || !objc_msgSend(v42, "hasAdministrativeArea"))
                {
                  goto LABEL_52;
                }
                objc_msgSend(v41, "administrativeArea");
                v45 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(v42, "administrativeArea");
                v46 = objc_claimAutoreleasedReturnValue();
                v98 = (void *)v45;
                v47 = (void *)v45;
                v48 = (void *)v46;
                if (!objc_msgSend(v47, "isEqualToString:", v46)
                  || !objc_msgSend(v41, "hasLocality")
                  || !objc_msgSend(v42, "hasLocality"))
                {
                  goto LABEL_51;
                }
                objc_msgSend(v41, "locality");
                v94 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v42, "locality");
                v93 = (void *)objc_claimAutoreleasedReturnValue();
                if (!objc_msgSend(v94, "isEqualToString:")
                  || !objc_msgSend(v41, "hasFullThoroughfare")
                  || !objc_msgSend(v42, "hasFullThoroughfare"))
                {
                  goto LABEL_50;
                }
                objc_msgSend(v41, "fullThoroughfare");
                v88 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v42, "fullThoroughfare");
                v87 = (void *)objc_claimAutoreleasedReturnValue();
                if (!objc_msgSend(v88, "isEqualToString:"))
                {

LABEL_50:
LABEL_51:

LABEL_52:
LABEL_53:

                  goto LABEL_54;
                }
                objc_msgSend(v41, "postCode");
                v85 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v42, "postCode");
                v84 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v85, "isEqualToString:"))
                {
                  objc_msgSend(v41, "subLocality");
                  v82 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v42, "subLocality");
                  v81 = (void *)objc_claimAutoreleasedReturnValue();
                  if (objc_msgSend(v82, "isEqualToString:"))
                  {
                    objc_msgSend(v41, "subAdministrativeArea");
                    v80 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v42, "subAdministrativeArea");
                    v79 = (void *)objc_claimAutoreleasedReturnValue();
                    v83 = objc_msgSend(v80, "isEqualToString:", v79);

                  }
                  else
                  {
                    v83 = 0;
                  }

                }
                else
                {
                  v83 = 0;
                }

                if ((v83 & 1) != 0)
                  goto LABEL_67;
LABEL_54:
                ++v39;
              }
              while (v37 != v39);
              v49 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v117, v137, 16);
              v37 = v49;
            }
            while (v49);
          }

          v34 = v92 + 1;
        }
        while (v92 + 1 != v91);
        v91 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v121, v138, 16);
        if (!v91)
        {
LABEL_64:

          self = v76;
          v6 = v77;
          LOBYTE(a4) = v75;
LABEL_65:
          if ((a4 & 8) == 0)
          {
            v10 = 0;
            goto LABEL_71;
          }
          -[GEOComposedWaypoint _regionCandidatesForContainment](self, "_regionCandidatesForContainment");
          v18 = (id)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v18, "count"))
          {
            -[GEOComposedWaypoint _regionCandidatesForContainment](v6, "_regionCandidatesForContainment");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            -[GEOComposedWaypoint _locationCandidatesForComparison](v6, "_locationCandidatesForComparison");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            obj = v53;
            if (objc_msgSend(v50, "count"))
            {
              v115 = 0u;
              v116 = 0u;
              v113 = 0u;
              v114 = 0u;
              v51 = v18;
              v99 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v113, v136, 16);
              if (v99)
              {
                v54 = *(_QWORD *)v114;
                v95 = *(_QWORD *)v114;
                do
                {
                  for (k = 0; k != v99; ++k)
                  {
                    v56 = v6;
                    if (*(_QWORD *)v114 != v54)
                      objc_enumerationMutation(v51);
                    v57 = *(void **)(*((_QWORD *)&v113 + 1) + 8 * k);
                    v109 = 0u;
                    v110 = 0u;
                    v111 = 0u;
                    v112 = 0u;
                    v58 = v50;
                    v59 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v109, v135, 16);
                    if (v59)
                    {
                      v60 = v59;
                      v61 = *(_QWORD *)v110;
                      while (2)
                      {
                        for (m = 0; m != v60; ++m)
                        {
                          if (*(_QWORD *)v110 != v61)
                            objc_enumerationMutation(v58);
                          if (!objc_msgSend(v57, "containsRegion:", *(_QWORD *)(*((_QWORD *)&v109 + 1) + 8 * m), v75, v76))
                          {
                            v6 = v56;
                            goto LABEL_111;
                          }
                        }
                        v60 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v109, v135, 16);
                        if (v60)
                          continue;
                        break;
                      }
                    }

                    v54 = v95;
                    v6 = v56;
                  }
                  v10 = 1;
                  v99 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v113, v136, 16);
                }
                while (v99);
                v18 = v51;
                v50 = v58;
                goto LABEL_68;
              }
LABEL_109:
              v10 = 1;
              v18 = v51;
              goto LABEL_68;
            }
            if (objc_msgSend(v53, "count"))
            {
              v107 = 0u;
              v108 = 0u;
              v105 = 0u;
              v106 = 0u;
              v51 = v18;
              v100 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v105, v134, 16);
              if (!v100)
                goto LABEL_109;
              v63 = *(_QWORD *)v106;
              v78 = v6;
              v96 = *(_QWORD *)v106;
              do
              {
                v64 = 0;
                v65 = obj;
                do
                {
                  if (*(_QWORD *)v106 != v63)
                  {
                    objc_enumerationMutation(v51);
                    v65 = obj;
                  }
                  v66 = *(void **)(*((_QWORD *)&v105 + 1) + 8 * v64);
                  v101 = 0u;
                  v102 = 0u;
                  v103 = 0u;
                  v104 = 0u;
                  v58 = v65;
                  v67 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v101, v133, 16);
                  if (v67)
                  {
                    v68 = v67;
                    v69 = *(_QWORD *)v102;
                    while (2)
                    {
                      for (n = 0; n != v68; ++n)
                      {
                        if (*(_QWORD *)v102 != v69)
                          objc_enumerationMutation(v58);
                        v71 = *(void **)(*((_QWORD *)&v101 + 1) + 8 * n);
                        objc_msgSend(v71, "lat", v75, v76);
                        v73 = v72;
                        objc_msgSend(v71, "lng");
                        if (!objc_msgSend(v66, "containsCoordinate:", v73, v74))
                        {
                          v6 = v78;
LABEL_111:

                          v10 = 0;
                          v51 = v18;
                          goto LABEL_68;
                        }
                      }
                      v68 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v101, v133, 16);
                      if (v68)
                        continue;
                      break;
                    }
                  }

                  ++v64;
                  v63 = v96;
                  v6 = v78;
                  v65 = obj;
                }
                while (v64 != v100);
                v10 = 1;
                v100 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v105, v134, 16);
              }
              while (v100);
              v18 = v51;
              obj = v58;
LABEL_68:

              v18 = v51;
            }
            else
            {
              v10 = 0;
            }

          }
          else
          {
            v10 = 0;
          }

          goto LABEL_71;
        }
      }
    }
  }
  v10 = 1;
LABEL_71:

  return v10;
}

- (id)_muidCandidatesForComparison
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  -[GEOComposedWaypoint waypoint](self, "waypoint");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "waypointId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasMuid");

  if (v6)
  {
    v7 = (void *)MEMORY[0x1E0CB37E8];
    -[GEOComposedWaypoint waypoint](self, "waypoint");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "waypointId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "numberWithUnsignedLongLong:", objc_msgSend(v9, "muid"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v10);

  }
  -[GEOComposedWaypoint mapItemStorage](self, "mapItemStorage");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "placeData");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "hasPreferredMuid");

  if (v13)
  {
    v14 = (void *)MEMORY[0x1E0CB37E8];
    -[GEOComposedWaypoint mapItemStorage](self, "mapItemStorage");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "placeData");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "numberWithUnsignedLongLong:", objc_msgSend(v16, "preferredMuid"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v17);

  }
  -[GEOComposedWaypoint mapItemStorage](self, "mapItemStorage");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "placeData");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "hasMuid");

  if (v20)
  {
    v21 = (void *)MEMORY[0x1E0CB37E8];
    -[GEOComposedWaypoint mapItemStorage](self, "mapItemStorage");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "placeData");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "numberWithUnsignedLongLong:", objc_msgSend(v23, "muid"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v24);

  }
  -[GEOComposedWaypoint mapItemStorage](self, "mapItemStorage");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "placeData");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "mapsId");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "shardedId");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "hasMuid");

  if (v29)
  {
    v30 = (void *)MEMORY[0x1E0CB37E8];
    -[GEOComposedWaypoint mapItemStorage](self, "mapItemStorage");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "placeData");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "mapsId");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "shardedId");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "numberWithUnsignedLongLong:", objc_msgSend(v34, "muid"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v35);

  }
  return v3;
}

- (id)_locationCandidatesForComparison
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
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
  int v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  -[GEOComposedWaypoint waypoint](self, "waypoint");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "waypointId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasLocationHint");

  if (v6)
  {
    -[GEOComposedWaypoint waypoint](self, "waypoint");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "waypointId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "locationHint");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v9);

  }
  -[GEOComposedWaypoint waypoint](self, "waypoint");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "waypointPlace");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hasCenter");

  if (v12)
  {
    -[GEOComposedWaypoint waypoint](self, "waypoint");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "waypointPlace");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "center");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v15);

  }
  -[GEOComposedWaypoint waypoint](self, "waypoint");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "waypointLocation");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "location");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "latLng");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    -[GEOComposedWaypoint waypoint](self, "waypoint");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "waypointLocation");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "location");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "latLng");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v23);

  }
  -[GEOComposedWaypoint mapItemStorage](self, "mapItemStorage");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "place");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "hasCenter");

  if (v26)
  {
    -[GEOComposedWaypoint mapItemStorage](self, "mapItemStorage");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "place");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "center");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v29);

  }
  if (-[GEOComposedWaypoint hasLatLng](self, "hasLatLng"))
  {
    -[GEOComposedWaypoint latLng](self, "latLng");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v30);

  }
  return v3;
}

- (id)_addressCandidatesForComparison
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  -[GEOComposedWaypoint waypoint](self, "waypoint");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "waypointId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasAddressHint");

  if (v6)
  {
    -[GEOComposedWaypoint waypoint](self, "waypoint");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "waypointId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addressHint");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v9);

  }
  -[GEOComposedWaypoint mapItemStorage](self, "mapItemStorage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "place");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "address");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "hasStructuredAddress");

  if (v13)
  {
    -[GEOComposedWaypoint mapItemStorage](self, "mapItemStorage");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "place");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "address");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "structuredAddress");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v17);

  }
  -[GEOComposedWaypoint mapItemStorage](self, "mapItemStorage");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "geoAddress");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "hasStructuredAddress");

  if (v20)
  {
    -[GEOComposedWaypoint mapItemStorage](self, "mapItemStorage");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "geoAddress");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "structuredAddress");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v23);

  }
  return v3;
}

- (id)_regionCandidatesForContainment
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  -[GEOComposedWaypoint mapItemStorage](self, "mapItemStorage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "geoFenceMapRegion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[GEOComposedWaypoint mapItemStorage](self, "mapItemStorage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "geoFenceMapRegion");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v7);

  }
  return v3;
}

- (GEOComposedWaypoint)initWithMapItem:(id)a3
{
  id v4;
  GEOComposedWaypoint *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  GEOLatLng *v9;
  GEOLatLng *v10;
  GEOLocation *v11;
  void *v12;
  void *v13;
  void *v14;
  GEOComposedWaypoint *v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)GEOComposedWaypoint;
  v5 = -[GEOComposedWaypoint init](&v17, sel_init);
  if (v5)
  {
    if (objc_msgSend(v4, "_hasMUID"))
      v6 = 2;
    else
      v6 = 3;
    -[GEOComposedWaypoint setType:](v5, "setType:", v6);
    objc_msgSend(MEMORY[0x1E0CB3A28], "_geo_dataForUUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOComposedWaypoint setUniqueWaypointID:](v5, "setUniqueWaypointID:", v7);

    +[GEOMapItemStorage mapItemStorageForGEOMapItem:](GEOMapItemStorage, "mapItemStorageForGEOMapItem:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOComposedWaypoint setMapItemStorage:](v5, "setMapItemStorage:", v8);

    -[GEOComposedWaypoint setMuid:](v5, "setMuid:", objc_msgSend(v4, "_muid"));
    v9 = [GEOLatLng alloc];
    objc_msgSend(v4, "centerCoordinate");
    v10 = -[GEOLatLng initWithCoordinate:](v9, "initWithCoordinate:");
    v11 = -[GEOLocation initWithLocation:]([GEOLocation alloc], "initWithLocation:", v10);
    -[GEOComposedWaypoint setLocation:](v5, "setLocation:", v11);

    -[GEOComposedWaypoint location](v5, "location");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "latLng");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOComposedWaypoint setLatLng:](v5, "setLatLng:", v13);

    -[GEOComposedWaypoint geoWaypointTyped](v5, "geoWaypointTyped");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOComposedWaypoint setWaypoint:](v5, "setWaypoint:", v14);

    v15 = v5;
  }

  return v5;
}

- (GEOComposedWaypoint)initWithLocation:(id)a3 isCurrentLocation:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  GEOComposedWaypoint *v7;
  GEOComposedWaypoint *v8;
  void *v9;
  void *v10;
  void *v11;
  GEOComposedWaypoint *v12;
  objc_super v14;

  v4 = a4;
  v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)GEOComposedWaypoint;
  v7 = -[GEOComposedWaypoint init](&v14, sel_init);
  v8 = v7;
  if (v7)
  {
    -[GEOComposedWaypoint setType:](v7, "setType:", 1);
    objc_msgSend(MEMORY[0x1E0CB3A28], "_geo_dataForUUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOComposedWaypoint setUniqueWaypointID:](v8, "setUniqueWaypointID:", v9);

    -[GEOComposedWaypoint setLocation:](v8, "setLocation:", v6);
    objc_msgSend(v6, "latLng");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOComposedWaypoint setLatLng:](v8, "setLatLng:", v10);

    -[GEOComposedWaypoint setIsCurrentLocation:](v8, "setIsCurrentLocation:", v4);
    -[GEOComposedWaypoint geoWaypointTyped](v8, "geoWaypointTyped");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOComposedWaypoint setWaypoint:](v8, "setWaypoint:", v11);

    v12 = v8;
  }

  return v8;
}

- (GEOComposedWaypoint)initWithLocation:(id)a3 findMyHandleID:(id)a4
{
  id v6;
  GEOComposedWaypoint *v7;
  void *v8;

  v6 = a4;
  v7 = -[GEOComposedWaypoint initWithLocation:isCurrentLocation:](self, "initWithLocation:isCurrentLocation:", a3, 0);
  v8 = (void *)objc_msgSend(v6, "copy");

  -[GEOComposedWaypoint setFindMyHandleID:](v7, "setFindMyHandleID:", v8);
  -[GEOComposedWaypoint recomputeGeoWaypointTyped](v7, "recomputeGeoWaypointTyped");
  return v7;
}

- (void)recomputeGeoWaypointTyped
{
  id v3;

  -[GEOComposedWaypoint geoWaypointTyped](self, "geoWaypointTyped");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[GEOComposedWaypoint setWaypoint:](self, "setWaypoint:", v3);

}

- (id)uniqueID
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[GEOComposedWaypoint uniqueWaypointID](self, "uniqueWaypointID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "_geo_dataForUUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOComposedWaypoint setUniqueWaypointID:](self, "setUniqueWaypointID:", v4);

  }
  v5 = (void *)MEMORY[0x1E0CB3A28];
  -[GEOComposedWaypoint uniqueWaypointID](self, "uniqueWaypointID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_geo_uuidForData:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)name
{
  void *v2;
  void *v3;

  -[GEOComposedWaypoint geoMapItem](self, "geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setStyleAttributes:(id)a3
{
  id v4;
  unint64_t v5;
  char v6;
  void *v7;
  unint64_t value;

  v4 = a3;
  objc_getAssociatedObject(self, &_geowaypoint_styleAttributesKey);
  v5 = (unint64_t)(id)objc_claimAutoreleasedReturnValue();
  value = (unint64_t)v4;
  if (value | v5)
  {
    v6 = objc_msgSend((id)v5, "isEqual:", value);

    if ((v6 & 1) == 0)
    {
      objc_setAssociatedObject(self, &_geowaypoint_styleAttributesKey, (id)value, (void *)1);
      objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", value, 1, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEOComposedWaypoint setStyleAttributesData:](self, "setStyleAttributesData:", v7);

    }
  }

}

- (id)styleAttributes
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  objc_getAssociatedObject(self, &_geowaypoint_styleAttributesKey);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[GEOComposedWaypoint styleAttributesData](self, "styleAttributesData");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      v5 = (void *)MEMORY[0x1E0CB3710];
      v6 = objc_opt_class();
      -[GEOComposedWaypoint styleAttributesData](self, "styleAttributesData");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "unarchivedObjectOfClass:fromData:error:", v6, v7, 0);
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      if (v3)
        goto LABEL_5;
    }
    -[GEOComposedWaypoint mapItemStorage](self, "mapItemStorage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_styleAttributes");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
LABEL_5:
      objc_setAssociatedObject(self, &_geowaypoint_styleAttributesKey, v3, (void *)1);
  }
  return v3;
}

+ (id)keyPathsForValuesAffectingValueForKey:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  NSStringFromSelector(sel_styleAttributes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  if (v6)
  {
    v7 = (void *)MEMORY[0x1E0C99E60];
    NSStringFromSelector(sel_styleAttributesData);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setWithObject:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11.receiver = a1;
    v11.super_class = (Class)&OBJC_METACLASS___GEOComposedWaypoint;
    objc_msgSendSuper2(&v11, sel_keyPathsForValuesAffectingValueForKey_, v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- ($1AB5FA073B851C12C2339EC22442E995)coordinate
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  $1AB5FA073B851C12C2339EC22442E995 result;

  -[GEOComposedWaypoint latLng](self, "latLng");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "coordinate");
  v4 = v3;
  v6 = v5;

  v7 = 1.79769313e308;
  v8 = v4;
  v9 = v6;
  result.var2 = v7;
  result.var1 = v9;
  result.var0 = v8;
  return result;
}

- (id)timezone
{
  void *v2;
  void *v3;

  -[GEOComposedWaypoint geoMapItem](self, "geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timezone");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (int)waypointCategory
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;

  -[GEOComposedWaypoint findMyHandleID](self, "findMyHandleID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[GEOComposedWaypoint geoMapItem](self, "geoMapItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (!v5)
    {
      v4 = 8;
      goto LABEL_27;
    }
    objc_msgSend(v5, "contactName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "contactAddressType");
    switch(v8)
    {
      case 3:
        if ((objc_msgSend(v6, "contactIsMe") & 1) != 0)
        {
          v4 = 10;
          goto LABEL_26;
        }
        if (objc_msgSend(v7, "length"))
        {
          v4 = 11;
          goto LABEL_26;
        }
        break;
      case 2:
        if ((objc_msgSend(v6, "contactIsMe") & 1) != 0)
        {
          v4 = 1;
          goto LABEL_26;
        }
        if (objc_msgSend(v7, "length"))
        {
          v4 = 3;
          goto LABEL_26;
        }
        break;
      case 1:
        if ((objc_msgSend(v6, "contactIsMe") & 1) != 0)
        {
          v4 = 2;
LABEL_26:

LABEL_27:
          return v4;
        }
        if (objc_msgSend(v7, "length"))
        {
          v4 = 4;
          goto LABEL_26;
        }
        break;
    }
    if (objc_msgSend(v7, "length"))
    {
      v4 = 5;
    }
    else if (objc_msgSend(v6, "_muid"))
    {
      v4 = 6;
    }
    else
    {
      objc_msgSend(v6, "addressObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
        v4 = 7;
      else
        v4 = 0;
    }
    goto LABEL_26;
  }
  return 12;
}

- (id)artwork
{
  return 0;
}

- (int)mapDisplayType
{
  void *v2;
  int v3;

  -[GEOComposedWaypoint geoMapItem](self, "geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "mapDisplayType");

  return v3;
}

- (BOOL)isLocationWaypointType
{
  return -[GEOComposedWaypoint type](self, "type") == 1;
}

- (BOOL)isAddressWaypointType
{
  void *v2;
  BOOL v3;

  -[GEOComposedWaypoint geoMapItem](self, "geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_placeDisplayType") == 3;

  return v3;
}

- (BOOL)isServerProvidedWaypoint
{
  return 0;
}

- (id)chargingInfo
{
  return 0;
}

- (id)displayInfo
{
  return 0;
}

- (id)route
{
  return 0;
}

+ (id)composedWaypointForIdentifier:(id)a3 traits:(id)a4 clientAttributes:(id)a5 completionHandler:(id)a6 networkActivityHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v12 = a5;
  v13 = a6;
  if (v13)
  {
    v14 = a7;
    v15 = a4;
    v16 = a3;
    +[GEOMapService sharedService](GEOMapService, "sharedService");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "ticketForIdentifiers:traits:", v18, v15);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __137__GEOComposedWaypoint_GEOWaypointExtras__composedWaypointForIdentifier_traits_clientAttributes_completionHandler_networkActivityHandler___block_invoke;
    v21[3] = &unk_1E1C044B8;
    v24 = a1;
    v22 = v12;
    v23 = v13;
    objc_msgSend(v19, "submitWithHandler:networkActivity:", v21, v14);

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

uint64_t __137__GEOComposedWaypoint_GEOWaypointExtras__composedWaypointForIdentifier_traits_clientAttributes_completionHandler_networkActivityHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 48), "composedWaypointForMapServiceResponse:clientAttributes:error:handler:", a2, *(_QWORD *)(a1 + 32), a3, *(_QWORD *)(a1 + 40));
}

+ (id)composedWaypointForID:(unint64_t)a3 resultsProviderID:(int)a4 contentProvider:(id)a5 traits:(id)a6 clientAttributes:(id)a7 completionHandler:(id)a8 networkActivityHandler:(id)a9
{
  uint64_t v12;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  _QWORD v29[2];

  v12 = *(_QWORD *)&a4;
  v29[1] = *MEMORY[0x1E0C80C00];
  v15 = a7;
  v16 = a8;
  if (v16)
  {
    v17 = a9;
    v18 = a6;
    v19 = a5;
    +[GEOMapService sharedService](GEOMapService, "sharedService");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v21;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "ticketForMUIDs:resultProviderID:contentProvider:traits:", v22, v12, v19, v18);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __163__GEOComposedWaypoint_GEOWaypointExtras__composedWaypointForID_resultsProviderID_contentProvider_traits_clientAttributes_completionHandler_networkActivityHandler___block_invoke;
    v25[3] = &unk_1E1C044B8;
    v28 = a1;
    v26 = v15;
    v27 = v16;
    objc_msgSend(v23, "submitWithHandler:networkActivity:", v25, v17);

  }
  else
  {
    v23 = 0;
  }

  return v23;
}

uint64_t __163__GEOComposedWaypoint_GEOWaypointExtras__composedWaypointForID_resultsProviderID_contentProvider_traits_clientAttributes_completionHandler_networkActivityHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 48), "composedWaypointForMapServiceResponse:clientAttributes:error:handler:", a2, *(_QWORD *)(a1 + 32), a3, *(_QWORD *)(a1 + 40));
}

+ (id)composedWaypointForLocation:(id)a3 mapItem:(id)a4 traits:(id)a5 completionHandler:(id)a6 networkActivityHandler:(id)a7
{
  return (id)objc_msgSend(a1, "composedWaypointForLocation:mapItem:traits:auditToken:completionHandler:networkActivityHandler:", a3, a4, a5, 0, a6, a7);
}

+ (id)composedWaypointForLocation:(id)a3 mapItem:(id)a4 traits:(id)a5 auditToken:(id)a6 completionHandler:(id)a7 networkActivityHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void (**v23)(_QWORD, _QWORD);
  void *v24;
  void *v25;
  double v26;
  double v27;
  id v29;
  id v30;
  _QWORD v31[4];
  void (**v32)(_QWORD, _QWORD);
  _QWORD v33[4];
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  if (v18)
  {
    v30 = v16;
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __137__GEOComposedWaypoint_GEOWaypointExtras__composedWaypointForLocation_mapItem_traits_auditToken_completionHandler_networkActivityHandler___block_invoke;
    v33[3] = &unk_1E1C14608;
    v20 = v14;
    v34 = v20;
    v21 = v17;
    v35 = v21;
    v22 = v19;
    v36 = v22;
    v38 = a1;
    v37 = v18;
    v23 = (void (**)(_QWORD, _QWORD))MEMORY[0x18D765024](v33);
    if (objc_msgSend(v15, "isValid"))
    {
      ((void (**)(_QWORD, id))v23)[2](v23, v15);
      v24 = 0;
    }
    else
    {
      +[GEOMapService sharedService](GEOMapService, "sharedService");
      v29 = v14;
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "coordinate");
      objc_msgSend(v25, "ticketForReverseGeocodeCoordinate:shiftLocationsIfNeeded:traits:", objc_msgSend(v15, "referenceFrame") == 1, v30, v26, v27);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = v29;
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __137__GEOComposedWaypoint_GEOWaypointExtras__composedWaypointForLocation_mapItem_traits_auditToken_completionHandler_networkActivityHandler___block_invoke_5;
      v31[3] = &unk_1E1C021B8;
      v32 = v23;
      objc_msgSend(v24, "submitWithHandler:auditToken:timeout:networkActivity:", v31, v21, 0, v22);

    }
    v16 = v30;
  }
  else
  {
    v24 = 0;
  }

  return v24;
}

void __137__GEOComposedWaypoint_GEOWaypointExtras__composedWaypointForLocation_mapItem_traits_auditToken_completionHandler_networkActivityHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  GEOLocationShifter *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *global_queue;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "referenceFrame") == 1
    && (objc_msgSend(*(id *)(a1 + 32), "coordinate"),
        +[GEOLocationShifter isLocationShiftRequiredForCoordinate:](GEOLocationShifter, "isLocationShiftRequiredForCoordinate:")))
  {
    v4 = objc_alloc_init(GEOLocationShifter);
    v5 = (void *)objc_msgSend(*(id *)(a1 + 32), "copy");
    objc_msgSend(*(id *)(a1 + 32), "latLng");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "horizontalAccuracy");
    v8 = v7;
    v9 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __137__GEOComposedWaypoint_GEOWaypointExtras__composedWaypointForLocation_mapItem_traits_auditToken_completionHandler_networkActivityHandler___block_invoke_2;
    v19[3] = &unk_1E1C145B8;
    v10 = *(_QWORD *)(a1 + 40);
    v22 = *(id *)(a1 + 48);
    v20 = v5;
    v24 = *(_QWORD *)(a1 + 64);
    v21 = v3;
    v23 = *(id *)(a1 + 56);
    v17[0] = v9;
    v17[1] = 3221225472;
    v17[2] = __137__GEOComposedWaypoint_GEOWaypointExtras__composedWaypointForLocation_mapItem_traits_auditToken_completionHandler_networkActivityHandler___block_invoke_3;
    v17[3] = &unk_1E1C01F48;
    v18 = *(id *)(a1 + 48);
    v14[0] = v9;
    v14[1] = 3221225472;
    v14[2] = __137__GEOComposedWaypoint_GEOWaypointExtras__composedWaypointForLocation_mapItem_traits_auditToken_completionHandler_networkActivityHandler___block_invoke_4;
    v14[3] = &unk_1E1C145E0;
    v15 = *(id *)(a1 + 48);
    v16 = *(id *)(a1 + 56);
    v11 = v5;
    global_queue = (void *)geo_get_global_queue();
    -[GEOLocationShifter shiftLatLng:accuracy:auditToken:withCompletionHandler:mustGoToNetworkCallback:errorHandler:callbackQueue:](v4, "shiftLatLng:accuracy:auditToken:withCompletionHandler:mustGoToNetworkCallback:errorHandler:callbackQueue:", v6, v10, v19, v17, v14, global_queue, v8);

  }
  else
  {
    v4 = (GEOLocationShifter *)objc_msgSend(objc_alloc(*(Class *)(a1 + 64)), "initWithLocation:isCurrentLocation:", *(_QWORD *)(a1 + 32), 0);
    if (v3)
    {
      +[GEOMapItemStorage mapItemStorageForGEOMapItem:](GEOMapItemStorage, "mapItemStorageForGEOMapItem:", v3);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEOLocationShifter setMapItemStorage:](v4, "setMapItemStorage:", v13);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

void __137__GEOComposedWaypoint_GEOWaypointExtras__composedWaypointForLocation_mapItem_traits_auditToken_completionHandler_networkActivityHandler___block_invoke_2(uint64_t a1, double a2, double a3, double a4)
{
  void *v8;
  uint64_t v9;
  GEOLatLng *v10;
  void *v11;
  void *v12;

  v8 = (void *)MEMORY[0x18D764E2C]();
  v9 = *(_QWORD *)(a1 + 48);
  if (v9)
    (*(void (**)(uint64_t, _QWORD))(v9 + 16))(v9, 0);
  v10 = -[GEOLatLng initWithCoordinate:]([GEOLatLng alloc], "initWithCoordinate:", a2, a3);
  objc_msgSend(*(id *)(a1 + 32), "setLatLng:", v10);
  objc_msgSend(*(id *)(a1 + 32), "setHorizontalAccuracy:", a4);
  objc_msgSend(*(id *)(a1 + 32), "setReferenceFrame:", 2);
  v11 = (void *)objc_msgSend(objc_alloc(*(Class *)(a1 + 64)), "initWithLocation:isCurrentLocation:", *(_QWORD *)(a1 + 32), 0);
  if (*(_QWORD *)(a1 + 40))
  {
    +[GEOMapItemStorage mapItemStorageForGEOMapItem:](GEOMapItemStorage, "mapItemStorageForGEOMapItem:");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setMapItemStorage:", v12);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

  objc_autoreleasePoolPop(v8);
}

void __137__GEOComposedWaypoint_GEOWaypointExtras__composedWaypointForLocation_mapItem_traits_auditToken_completionHandler_networkActivityHandler___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  v2 = (void *)MEMORY[0x18D764E2C]();
  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
    (*(void (**)(uint64_t, uint64_t))(v3 + 16))(v3, 1);
  objc_autoreleasePoolPop(v2);
}

void __137__GEOComposedWaypoint_GEOWaypointExtras__composedWaypointForLocation_mapItem_traits_auditToken_completionHandler_networkActivityHandler___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;

  v5 = a2;
  v3 = (void *)MEMORY[0x18D764E2C]();
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    (*(void (**)(uint64_t, _QWORD))(v4 + 16))(v4, 0);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_autoreleasePoolPop(v3);

}

void __137__GEOComposedWaypoint_GEOWaypointExtras__composedWaypointForLocation_mapItem_traits_auditToken_completionHandler_networkActivityHandler___block_invoke_5(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4;
  id v5;

  if (a3)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(a2, "firstObject");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (id)v4;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

+ (id)composedWaypointForCurrentLocation:(id)a3 traits:(id)a4 completionHandler:(id)a5 networkActivityHandler:(id)a6
{
  return (id)objc_msgSend(a1, "composedWaypointForCurrentLocation:traits:auditToken:completionHandler:networkActivityHandler:", a3, a4, 0, a5, a6);
}

+ (id)composedWaypointForCurrentLocation:(id)a3 traits:(id)a4 auditToken:(id)a5 completionHandler:(id)a6 networkActivityHandler:(id)a7
{
  id v12;
  id v13;
  void *v14;
  _QWORD v16[4];
  id v17;

  v12 = a6;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __136__GEOComposedWaypoint_GEOWaypointExtras__composedWaypointForCurrentLocation_traits_auditToken_completionHandler_networkActivityHandler___block_invoke;
  v16[3] = &unk_1E1C14630;
  v17 = v12;
  v13 = v12;
  objc_msgSend(a1, "composedWaypointForLocation:mapItem:traits:auditToken:completionHandler:networkActivityHandler:", a3, 0, a4, a5, v16, a7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

void __136__GEOComposedWaypoint_GEOWaypointExtras__composedWaypointForCurrentLocation_traits_auditToken_completionHandler_networkActivityHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v5 = a3;
  v6 = a2;
  objc_msgSend(v6, "setIsCurrentLocation:", 1);
  objc_msgSend(v6, "recomputeGeoWaypointTyped");
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

+ (id)composedWaypointForAddressString:(id)a3 traits:(id)a4 clientAttributes:(id)a5 completionHandler:(id)a6 networkActivityHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;

  v12 = a5;
  v13 = a6;
  if (v13)
  {
    v14 = a7;
    v15 = a4;
    v16 = a3;
    +[GEOMapService sharedService](GEOMapService, "sharedService");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "ticketForForwardGeocodeString:maxResults:traits:", v16, 1, v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __140__GEOComposedWaypoint_GEOWaypointExtras__composedWaypointForAddressString_traits_clientAttributes_completionHandler_networkActivityHandler___block_invoke;
    v20[3] = &unk_1E1C044B8;
    v23 = a1;
    v21 = v12;
    v22 = v13;
    objc_msgSend(v18, "submitWithHandler:networkActivity:", v20, v14);

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

uint64_t __140__GEOComposedWaypoint_GEOWaypointExtras__composedWaypointForAddressString_traits_clientAttributes_completionHandler_networkActivityHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 48), "composedWaypointForMapServiceResponse:clientAttributes:error:handler:", a2, *(_QWORD *)(a1 + 32), a3, *(_QWORD *)(a1 + 40));
}

+ (id)composedWaypointForSearchString:(id)a3 completionItem:(id)a4 traits:(id)a5 clientAttributes:(id)a6 completionHandler:(id)a7 networkActivityHandler:(id)a8
{
  return (id)objc_msgSend(a1, "composedWaypointForSearchString:completionItem:traits:clientAttributes:clientResolvedCompletionHandler:completionHandler:networkActivityHandler:", a3, a4, a5, a6, 0, a7, a8);
}

+ (id)composedWaypointForSearchString:(id)a3 completionItem:(id)a4 traits:(id)a5 clientAttributes:(id)a6 clientResolvedCompletionHandler:(id)a7 completionHandler:(id)a8 networkActivityHandler:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  _QWORD v32[4];
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  if (v20)
  {
    if (!v19 && objc_msgSend(v17, "knownClientResolvedTypesCount"))
    {
      v22 = (void *)objc_msgSend(v17, "copy");

      objc_msgSend(v22, "clearKnownClientResolvedTypes");
      v17 = v22;
    }
    objc_msgSend(v16, "clientResolved");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "itemType");

    if (!v19 || !v24)
    {
      +[GEOMapService sharedService](GEOMapService, "sharedService");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "ticketForSearchQuery:completionItem:maxResults:traits:searchSessionData:", v15, v16, 1, v17, 0);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      v32[0] = MEMORY[0x1E0C809B0];
      v32[1] = 3221225472;
      v32[2] = __186__GEOComposedWaypoint_GEOWaypointExtras__composedWaypointForSearchString_completionItem_traits_clientAttributes_clientResolvedCompletionHandler_completionHandler_networkActivityHandler___block_invoke;
      v32[3] = &unk_1E1C14658;
      v29 = v28;
      v33 = v29;
      v37 = a1;
      v34 = v18;
      v35 = v20;
      v36 = v19;
      objc_msgSend(v29, "submitWithHandler:networkActivity:", v32, v21);
      v30 = v36;
      v26 = v29;

      goto LABEL_10;
    }
    objc_msgSend(v16, "clientResolved");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v19 + 2))(v19, v25);

  }
  v26 = 0;
LABEL_10:

  return v26;
}

void __186__GEOComposedWaypoint_GEOWaypointExtras__composedWaypointForSearchString_completionItem_traits_clientAttributes_clientResolvedCompletionHandler_completionHandler_networkActivityHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "clientResolvedResult");
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v7)
    goto LABEL_9;
  v8 = (void *)v7;
  objc_msgSend(*(id *)(a1 + 32), "clientResolvedResult");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "itemType");

  if (!v10)
    goto LABEL_9;
  objc_msgSend(*(id *)(a1 + 32), "clientResolvedResult");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "itemType") != 5)
  {

LABEL_7:
    v19 = *(_QWORD *)(a1 + 56);
    if (v19)
    {
      objc_msgSend(*(id *)(a1 + 32), "clientResolvedResult");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v19 + 16))(v19, v20);

      goto LABEL_10;
    }
LABEL_9:
    objc_msgSend(*(id *)(a1 + 64), "composedWaypointForMapServiceResponse:clientAttributes:error:handler:", v5, *(_QWORD *)(a1 + 40), v6, *(_QWORD *)(a1 + 48));
    goto LABEL_10;
  }
  objc_msgSend(*(id *)(a1 + 32), "clientResolvedResult");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "resultIndex");
  v14 = objc_msgSend(v5, "count");

  if (v13 >= v14)
    goto LABEL_7;
  v15 = *(void **)(a1 + 64);
  objc_msgSend(*(id *)(a1 + 32), "clientResolvedResult");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", objc_msgSend(v16, "resultIndex"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "composedWaypointForMapServiceResponse:clientAttributes:error:handler:", v18, *(_QWORD *)(a1 + 40), v6, *(_QWORD *)(a1 + 48));

LABEL_10:
}

+ (id)composedWaypointForMapItemToRefine:(id)a3 traits:(id)a4 clientAttributes:(id)a5 completionHandler:(id)a6 networkActivityHandler:(id)a7
{
  return (id)objc_msgSend(a1, "composedWaypointForMapItemToRefine:traits:auditToken:clientAttributes:completionHandler:networkActivityHandler:", a3, a4, 0, a5, a6, a7);
}

+ (id)composedWaypointForMapItemToRefine:(id)a3 traits:(id)a4 auditToken:(id)a5 clientAttributes:(id)a6 completionHandler:(id)a7 networkActivityHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;

  v14 = a6;
  v15 = a7;
  if (v15)
  {
    v16 = a8;
    v17 = a5;
    v18 = a4;
    v19 = a3;
    +[GEOMapService sharedService](GEOMapService, "sharedService");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "ticketForMapItemToRefine:traits:", v19, v18);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __153__GEOComposedWaypoint_GEOWaypointExtras__composedWaypointForMapItemToRefine_traits_auditToken_clientAttributes_completionHandler_networkActivityHandler___block_invoke;
    v23[3] = &unk_1E1C044B8;
    v26 = a1;
    v24 = v14;
    v25 = v15;
    objc_msgSend(v21, "submitWithHandler:auditToken:timeout:networkActivity:", v23, v17, 0, v16);

  }
  else
  {
    v21 = 0;
  }

  return v21;
}

uint64_t __153__GEOComposedWaypoint_GEOWaypointExtras__composedWaypointForMapItemToRefine_traits_auditToken_clientAttributes_completionHandler_networkActivityHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 48), "composedWaypointForMapServiceResponse:clientAttributes:error:handler:", a2, *(_QWORD *)(a1 + 32), a3, *(_QWORD *)(a1 + 40));
}

+ (id)composedWaypointForMapItem:(id)a3 traits:(id)a4 clientAttributes:(id)a5 completionHandler:(id)a6 networkActivityHandler:(id)a7
{
  return (id)objc_msgSend(a1, "composedWaypointForMapItem:traits:auditToken:clientAttributes:completionHandler:networkActivityHandler:", a3, a4, 0, a5, a6, a7);
}

+ (id)composedWaypointForMapItem:(id)a3 traits:(id)a4 auditToken:(id)a5 clientAttributes:(id)a6 completionHandler:(id)a7 networkActivityHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  void (**v18)(id, void *, _QWORD);
  id v19;
  void *v20;
  _BOOL4 v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = (void (**)(id, void *, _QWORD))a7;
  v19 = a8;
  if (!v18)
  {
LABEL_16:
    v25 = 0;
    goto LABEL_17;
  }
  objc_msgSend(v14, "_enhancedPlacement");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
    v21 = 0;
  else
    v21 = objc_msgSend(v14, "_muid") != 0;

  if (objc_msgSend(v14, "isValid"))
  {
    objc_msgSend(v14, "centerCoordinate");
    if (v23 >= -180.0 && v23 <= 180.0 && v22 >= -90.0 && v22 <= 90.0 && !v21)
    {
      if (v17)
      {
        +[GEOMapItemStorage mapItemStorageForGEOMapItem:clientAttributes:](GEOMapItemStorage, "mapItemStorageForGEOMapItem:clientAttributes:", v14, v17);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v14, "_clientAttributes");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        +[GEOMapItemStorage mapItemStorageForGEOMapItem:clientAttributes:](GEOMapItemStorage, "mapItemStorageForGEOMapItem:clientAttributes:", v14, v26);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

      }
      v27 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithMapItem:", v24);
      v18[2](v18, v27, 0);

      goto LABEL_16;
    }
  }
  objc_msgSend(a1, "composedWaypointForMapItemToRefine:traits:auditToken:clientAttributes:completionHandler:networkActivityHandler:", v14, v15, v16, v17, v18, v19);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_17:

  return v25;
}

+ (id)composedWaypointForIncompleteMapItem:(id)a3 traits:(id)a4 clientAttributes:(id)a5 completionHandler:(id)a6 networkActivityHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, void *, void *);
  void *v25;
  id v26;
  id v27;
  id v28;
  id v29;

  v12 = a3;
  v13 = a5;
  v14 = a6;
  if (v14)
  {
    v22 = MEMORY[0x1E0C809B0];
    v23 = 3221225472;
    v24 = __144__GEOComposedWaypoint_GEOWaypointExtras__composedWaypointForIncompleteMapItem_traits_clientAttributes_completionHandler_networkActivityHandler___block_invoke;
    v25 = &unk_1E1C14680;
    v15 = v12;
    v26 = v15;
    v16 = v13;
    v27 = v16;
    v29 = a1;
    v28 = v14;
    v17 = a7;
    v18 = a4;
    v19 = (void *)MEMORY[0x18D765024](&v22);
    objc_msgSend(a1, "composedWaypointForMapItemToRefine:traits:clientAttributes:completionHandler:networkActivityHandler:", v15, v18, v16, v19, v17, v22, v23, v24, v25);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

void __144__GEOComposedWaypoint_GEOWaypointExtras__composedWaypointForIncompleteMapItem_traits_clientAttributes_completionHandler_networkActivityHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  double v6;
  double v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;

  v12 = a2;
  v5 = a3;
  if (v5)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "isValid"))
    {
      objc_msgSend(*(id *)(a1 + 32), "centerCoordinate");
      if (v7 >= -180.0 && v7 <= 180.0 && v6 >= -90.0 && v6 <= 90.0)
      {
        v8 = *(_QWORD *)(a1 + 32);
        if (*(_QWORD *)(a1 + 40))
        {
          +[GEOMapItemStorage mapItemStorageForGEOMapItem:clientAttributes:](GEOMapItemStorage, "mapItemStorageForGEOMapItem:clientAttributes:", *(_QWORD *)(a1 + 32));
          v9 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(*(id *)(a1 + 32), "_clientAttributes");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          +[GEOMapItemStorage mapItemStorageForGEOMapItem:clientAttributes:](GEOMapItemStorage, "mapItemStorageForGEOMapItem:clientAttributes:", v8, v10);
          v9 = (void *)objc_claimAutoreleasedReturnValue();

        }
        v11 = objc_msgSend(objc_alloc(*(Class *)(a1 + 56)), "initWithMapItem:", v9);

        v5 = 0;
        v12 = (id)v11;
      }
    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

+ (id)composedWaypointForTransitID:(unint64_t)a3 coordinate:(id)a4 isCurrentLocation:(BOOL)a5 traits:(id)a6 clientAttributes:(id)a7 completionHandler:(id)a8 networkActivityHandler:(id)a9
{
  double var1;
  double var0;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  double v30;
  double v31;
  BOOL v32;
  _QWORD v33[2];

  var1 = a4.var1;
  var0 = a4.var0;
  v33[1] = *MEMORY[0x1E0C80C00];
  v17 = a7;
  v18 = a8;
  if (v18)
  {
    v19 = a9;
    v20 = a6;
    +[GEOMapService sharedService](GEOMapService, "sharedService");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = v22;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "ticketForMUIDs:traits:", v23, v20);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __165__GEOComposedWaypoint_GEOWaypointExtras__composedWaypointForTransitID_coordinate_isCurrentLocation_traits_clientAttributes_completionHandler_networkActivityHandler___block_invoke;
    v26[3] = &unk_1E1C146D0;
    v29 = a1;
    v27 = v17;
    v32 = a5;
    v28 = v18;
    v30 = var0;
    v31 = var1;
    objc_msgSend(v24, "submitWithHandler:networkActivity:", v26, v19);

  }
  else
  {
    v24 = 0;
  }

  return v24;
}

void __165__GEOComposedWaypoint_GEOWaypointExtras__composedWaypointForTransitID_coordinate_isCurrentLocation_traits_clientAttributes_completionHandler_networkActivityHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  double v7;
  double v8;
  GEOLocation *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  char v15;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = *(double *)(a1 + 64);
    if (v7 >= -180.0 && v7 <= 180.0)
    {
      v8 = *(double *)(a1 + 56);
      if (v8 >= -90.0 && v8 <= 90.0)
      {
        v9 = -[GEOLocation initWithGEOCoordinate:]([GEOLocation alloc], "initWithGEOCoordinate:", *(double *)(a1 + 56), *(double *)(a1 + 64));
        v10 = (void *)objc_msgSend(objc_alloc(*(Class *)(a1 + 48)), "initWithLocation:isCurrentLocation:", v9, *(unsigned __int8 *)(a1 + 72));
        (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

      }
    }
  }
  else
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __165__GEOComposedWaypoint_GEOWaypointExtras__composedWaypointForTransitID_coordinate_isCurrentLocation_traits_clientAttributes_completionHandler_networkActivityHandler___block_invoke_2;
    v13[3] = &unk_1E1C146A8;
    v15 = *(_BYTE *)(a1 + 72);
    v11 = *(_QWORD *)(a1 + 32);
    v12 = *(void **)(a1 + 48);
    v14 = *(id *)(a1 + 40);
    objc_msgSend(v12, "composedWaypointForMapServiceResponse:clientAttributes:error:handler:", v5, v11, 0, v13);

  }
}

void __165__GEOComposedWaypoint_GEOWaypointExtras__composedWaypointForTransitID_coordinate_isCurrentLocation_traits_clientAttributes_completionHandler_networkActivityHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  id v6;
  id v7;

  v5 = *(unsigned __int8 *)(a1 + 40);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v7, "setIsCurrentLocation:", v5);
  objc_msgSend(v7, "recomputeGeoWaypointTyped");
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

+ (id)composedWaypointForWaypointTyped:(id)a3 completionHandler:(id)a4 networkActivityHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  int v10;
  void *v11;
  GEOMapItemIdentifier *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  GEOLocation *v16;
  uint64_t v17;
  void *v18;
  GEOLocation *v19;
  void *v20;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (!v8)
    goto LABEL_6;
  v10 = objc_msgSend(v7, "waypointType");
  switch(v10)
  {
    case 4:
      objc_msgSend(v7, "waypointLocation");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "location");
      v16 = (GEOLocation *)objc_claimAutoreleasedReturnValue();
LABEL_9:
      +[GEOComposedWaypoint composedWaypointForLocation:mapItem:traits:completionHandler:networkActivityHandler:](GEOComposedWaypoint, "composedWaypointForLocation:mapItem:traits:completionHandler:networkActivityHandler:", v16, 0, 0, v8, v9);
      v17 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 3:
      objc_msgSend(v7, "waypointPlace");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = [GEOLocation alloc];
      objc_msgSend(v11, "center");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = -[GEOLocation initWithLocation:](v19, "initWithLocation:", v20);

      goto LABEL_9;
    case 2:
      objc_msgSend(v7, "waypointId");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = [GEOMapItemIdentifier alloc];
      v13 = objc_msgSend(v11, "muid");
      v14 = objc_msgSend(v11, "resultProviderId");
      objc_msgSend(v11, "locationHint");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "coordinate");
      v16 = -[GEOMapItemIdentifier initWithMUID:resultProviderID:coordinate:](v12, "initWithMUID:resultProviderID:coordinate:", v13, v14);

      +[GEOComposedWaypoint composedWaypointForIdentifier:traits:clientAttributes:completionHandler:networkActivityHandler:](GEOComposedWaypoint, "composedWaypointForIdentifier:traits:clientAttributes:completionHandler:networkActivityHandler:", v16, 0, 0, v8, v9);
      v17 = objc_claimAutoreleasedReturnValue();
LABEL_10:
      v18 = (void *)v17;

      goto LABEL_11;
  }
LABEL_6:
  v18 = 0;
LABEL_11:

  return v18;
}

+ (void)composedWaypointForMapServiceResponse:(id)a3 clientAttributes:(id)a4 error:(id)a5 handler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(_QWORD, _QWORD, _QWORD);
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = (void (**)(_QWORD, _QWORD, _QWORD))v12;
  if (v12)
  {
    if (v11)
    {
      (*((void (**)(id, _QWORD, id))v12 + 2))(v12, 0, v11);
    }
    else
    {
      objc_msgSend(v19, "firstObject");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (v14
        && objc_msgSend(v14, "isValid")
        && (objc_msgSend(v15, "conformsToProtocol:", &unk_1EDF9CF08) & 1) != 0)
      {
        if (v10)
        {
          +[GEOMapItemStorage mapItemStorageForGEOMapItem:clientAttributes:](GEOMapItemStorage, "mapItemStorageForGEOMapItem:clientAttributes:", v15, v10);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(v15, "_clientAttributes");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          +[GEOMapItemStorage mapItemStorageForGEOMapItem:clientAttributes:](GEOMapItemStorage, "mapItemStorageForGEOMapItem:clientAttributes:", v15, v17);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

        }
        v18 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithMapItem:", v16);
        ((void (**)(_QWORD, void *, _QWORD))v13)[2](v13, v18, 0);

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:", -8);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, _QWORD, void *))v13)[2](v13, 0, v16);
      }

    }
  }

}

- (id)bestLatLng
{
  void *v2;
  void *v3;

  -[GEOComposedWaypoint location](self, "location");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "latLng");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)convertToStaticLocation
{
  GEOComposedWaypoint *v3;

  if (-[GEOComposedWaypoint isCurrentLocation](self, "isCurrentLocation"))
  {
    v3 = (GEOComposedWaypoint *)-[GEOComposedWaypoint copy](self, "copy");
    -[GEOComposedWaypoint setIsCurrentLocation:](v3, "setIsCurrentLocation:", 0);
    -[GEOComposedWaypoint recomputeGeoWaypointTyped](v3, "recomputeGeoWaypointTyped");
  }
  else
  {
    v3 = self;
  }
  return v3;
}

- (GEOWaypointTyped)geoWaypointTyped
{
  GEOWaypointTyped *v3;
  uint64_t v4;
  void *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  GEOLatLng *v13;
  GEOLatLng *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  GEOWaypointID *v18;
  GEOWaypointLocation *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  unsigned int v25;
  int v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint8_t buf[4];
  GEOWaypointID *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(GEOWaypointTyped);
  -[GEOWaypointTyped setIsCurrentLocation:](v3, "setIsCurrentLocation:", -[GEOComposedWaypoint isCurrentLocation](self, "isCurrentLocation"));
  if (-[GEOComposedWaypoint isCurrentLocation](self, "isCurrentLocation"))
  {
    v4 = 1;
  }
  else
  {
    -[GEOComposedWaypoint findMyHandleID](self, "findMyHandleID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5 != 0;

    v4 = (2 * v6);
  }
  -[GEOWaypointTyped setWaypointLocationSource:](v3, "setWaypointLocationSource:", v4);
  -[GEOComposedWaypoint uniqueWaypointID](self, "uniqueWaypointID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "_geo_dataForUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOComposedWaypoint setUniqueWaypointID:](self, "setUniqueWaypointID:", v8);

  }
  v9 = (void *)MEMORY[0x1E0CB3A28];
  -[GEOComposedWaypoint uniqueWaypointID](self, "uniqueWaypointID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_geo_waypointUUIDForData:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOWaypointTyped setUniqueWaypointId:](v3, "setUniqueWaypointId:", v11);

  if (-[GEOComposedWaypoint isOutsideOfflineDownloadedRegion](self, "isOutsideOfflineDownloadedRegion"))
    -[GEOWaypointTyped setDownloadedOfflineRegionState:](v3, "setDownloadedOfflineRegionState:", 1);
  -[GEOComposedWaypoint geoMapItem](self, "geoMapItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = [GEOLatLng alloc];
  objc_msgSend(v12, "centerCoordinate");
  v14 = -[GEOLatLng initWithCoordinate:](v13, "initWithCoordinate:");
  if (!-[GEOComposedWaypoint hasType](self, "hasType"))
  {
    if (-[GEOComposedWaypoint isCurrentLocation](self, "isCurrentLocation")
      || (-[GEOComposedWaypoint geoMapItem](self, "geoMapItem"),
          v15 = (void *)objc_claimAutoreleasedReturnValue(),
          v15,
          !v15))
    {
      v16 = 1;
    }
    else if (-[GEOComposedWaypoint muid](self, "muid"))
    {
      v16 = 2;
    }
    else
    {
      v16 = 3;
    }
    -[GEOComposedWaypoint setType:](self, "setType:", v16);
  }
  switch(-[GEOComposedWaypoint type](self, "type"))
  {
    case 0:
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      {
        v17 = -[GEOComposedWaypoint type](self, "type");
        if (v17 >= 4)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v17);
          v18 = (GEOWaypointID *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v18 = (GEOWaypointID *)*((_QWORD *)&off_1E1C146F0 + (int)v17);
        }
        *(_DWORD *)buf = 138412290;
        v33 = v18;
        _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Unreachable reached: Unhandled type in GEOComposedWaypointType_Type: %@", buf, 0xCu);
        goto LABEL_33;
      }
      break;
    case 1:
      -[GEOWaypointTyped setWaypointType:](v3, "setWaypointType:", 4);
      v19 = objc_alloc_init(GEOWaypointLocation);
      -[GEOComposedWaypoint location](self, "location");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEOWaypointLocation setLocation:](v19, "setLocation:", v20);

      -[GEOWaypointTyped setWaypointLocation:](v3, "setWaypointLocation:", v19);
      break;
    case 2:
      -[GEOWaypointTyped setWaypointType:](v3, "setWaypointType:", 2);
      v18 = objc_alloc_init(GEOWaypointID);
      -[GEOWaypointID setMuid:](v18, "setMuid:", objc_msgSend(v12, "_muid"));
      if (objc_msgSend(v12, "_hasResultProviderID"))
        -[GEOWaypointID setResultProviderId:](v18, "setResultProviderId:", (int)objc_msgSend(v12, "_resultProviderID"));
      objc_msgSend(v12, "name");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEOWaypointID setPlaceNameHint:](v18, "setPlaceNameHint:", v21);

      -[GEOWaypointID setLocationHint:](v18, "setLocationHint:", v14);
      objc_msgSend(v12, "geoAddress");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v22, "hasStructuredAddress"))
      {
        objc_msgSend(v22, "structuredAddress");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[GEOWaypointID setAddressHint:](v18, "setAddressHint:", v23);

      }
      if (objc_msgSend(v22, "formattedAddressLinesCount"))
      {
        objc_msgSend(v22, "formattedAddressLines");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[GEOWaypointID setFormattedAddressLineHints:](v18, "setFormattedAddressLineHints:", v24);

      }
      v25 = objc_msgSend(v12, "_addressGeocodeAccuracy");
      if (v25 < 6 || v25 != -1)
        -[GEOWaypointID setAddressGeocodeAccuracyHint:](v18, "setAddressGeocodeAccuracyHint:");
      v26 = objc_msgSend(v12, "_placeType");
      if (v26)
        -[GEOWaypointID setPlaceTypeHint:](v18, "setPlaceTypeHint:", _PDPlaceTypeForMapItemPlaceType(v26));
      -[GEOWaypointTyped setWaypointId:](v3, "setWaypointId:", v18);

      goto LABEL_33;
    case 3:
      -[GEOWaypointTyped setWaypointType:](v3, "setWaypointType:", 3);
      v18 = objc_alloc_init(GEOWaypointPlace);
      -[GEOWaypointID setCenter:](v18, "setCenter:", v14);
      v27 = (void *)MEMORY[0x1E0C99DE8];
      objc_msgSend(v12, "_roadAccessPoints");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "arrayWithArray:", v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEOWaypointID setRoadAccessPoints:](v18, "setRoadAccessPoints:", v29);

      objc_msgSend(v12, "_arrivalMapRegionForTransportType:", 0);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEOWaypointID setMapRegion:](v18, "setMapRegion:", v30);

      -[GEOWaypointTyped setWaypointPlace:](v3, "setWaypointPlace:", v18);
LABEL_33:

      break;
    default:
      break;
  }

  return v3;
}

- (GEOWaypointInfo)geoWaypointInfo
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_opt_new();
  if (-[GEOComposedWaypoint isServerProvidedWaypoint](self, "isServerProvidedWaypoint"))
    v4 = 2;
  else
    v4 = 1;
  objc_msgSend(v3, "setSource:", v4);
  -[GEOComposedWaypoint uniqueID](self, "uniqueID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_geo_waypointUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUniqueWaypointId:", v6);

  return (GEOWaypointInfo *)v3;
}

@end
