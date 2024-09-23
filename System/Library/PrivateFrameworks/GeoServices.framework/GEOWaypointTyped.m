@implementation GEOWaypointTyped

- (GEOWaypointTyped)init
{
  GEOWaypointTyped *v2;
  GEOWaypointTyped *v3;
  GEOWaypointTyped *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOWaypointTyped;
  v2 = -[GEOWaypointTyped init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOWaypointTyped)initWithData:(id)a3
{
  GEOWaypointTyped *v3;
  GEOWaypointTyped *v4;
  GEOWaypointTyped *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOWaypointTyped;
  v3 = -[GEOWaypointTyped initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (int)waypointType
{
  os_unfair_lock_s *p_readerLock;
  __int16 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 8) != 0)
    return self->_waypointType;
  else
    return 2;
}

- (void)setWaypointType:(int)a3
{
  *(_WORD *)&self->_flags |= 0x1008u;
  self->_waypointType = a3;
}

- (void)setHasWaypointType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4104;
  else
    v3 = 4096;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFF7 | v3;
}

- (BOOL)hasWaypointType
{
  return (*(_WORD *)&self->_flags >> 3) & 1;
}

- (id)waypointTypeAsString:(int)a3
{
  if ((a3 - 2) < 3)
    return off_1E1C0F3A8[a3 - 2];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsWaypointType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WAYPOINT_ID")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WAYPOINT_PLACE")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("WAYPOINT_LOCATION")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 2;
  }

  return v4;
}

- (void)_readWaypointId
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_WORD *)(a1 + 96) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOWaypointTypedReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readWaypointId_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasWaypointId
{
  -[GEOWaypointTyped _readWaypointId]((uint64_t)self);
  return self->_waypointId != 0;
}

- (GEOWaypointID)waypointId
{
  -[GEOWaypointTyped _readWaypointId]((uint64_t)self);
  return self->_waypointId;
}

- (void)setWaypointId:(id)a3
{
  *(_WORD *)&self->_flags |= 0x1100u;
  objc_storeStrong((id *)&self->_waypointId, a3);
}

- (void)_readWaypointPlace
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_WORD *)(a1 + 96) & 0x800) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOWaypointTypedReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readWaypointPlace_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasWaypointPlace
{
  -[GEOWaypointTyped _readWaypointPlace]((uint64_t)self);
  return self->_waypointPlace != 0;
}

- (GEOWaypointPlace)waypointPlace
{
  -[GEOWaypointTyped _readWaypointPlace]((uint64_t)self);
  return self->_waypointPlace;
}

- (void)setWaypointPlace:(id)a3
{
  *(_WORD *)&self->_flags |= 0x1800u;
  objc_storeStrong((id *)&self->_waypointPlace, a3);
}

- (void)_readWaypointLocation
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_WORD *)(a1 + 96) & 0x200) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOWaypointTypedReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readWaypointLocation_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasWaypointLocation
{
  -[GEOWaypointTyped _readWaypointLocation]((uint64_t)self);
  return self->_waypointLocation != 0;
}

- (GEOWaypointLocation)waypointLocation
{
  -[GEOWaypointTyped _readWaypointLocation]((uint64_t)self);
  return self->_waypointLocation;
}

- (void)setWaypointLocation:(id)a3
{
  *(_WORD *)&self->_flags |= 0x1200u;
  objc_storeStrong((id *)&self->_waypointLocation, a3);
}

- (BOOL)isCurrentLocation
{
  return self->_isCurrentLocation;
}

- (void)setIsCurrentLocation:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x1010u;
  self->_isCurrentLocation = a3;
}

- (void)setHasIsCurrentLocation:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4112;
  else
    v3 = 4096;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFEF | v3;
}

- (BOOL)hasIsCurrentLocation
{
  return (*(_WORD *)&self->_flags >> 4) & 1;
}

- (BOOL)isLocationOfInterest
{
  return self->_isLocationOfInterest;
}

- (void)setIsLocationOfInterest:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x1020u;
  self->_isLocationOfInterest = a3;
}

- (void)setHasIsLocationOfInterest:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4128;
  else
    v3 = 4096;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFDF | v3;
}

- (BOOL)hasIsLocationOfInterest
{
  return (*(_WORD *)&self->_flags >> 5) & 1;
}

- (int)waypointStatus
{
  os_unfair_lock_s *p_readerLock;
  __int16 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 4) != 0)
    return self->_waypointStatus;
  else
    return 0;
}

- (void)setWaypointStatus:(int)a3
{
  *(_WORD *)&self->_flags |= 0x1004u;
  self->_waypointStatus = a3;
}

- (void)setHasWaypointStatus:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4100;
  else
    v3 = 4096;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFB | v3;
}

- (BOOL)hasWaypointStatus
{
  return (*(_WORD *)&self->_flags >> 2) & 1;
}

- (id)waypointStatusAsString:(int)a3
{
  if (a3 < 4)
    return off_1E1C0F3C0[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsWaypointStatus:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_STATUS")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ACTIVE_WAYPOINT")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("INSERT_WAYPOINT")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("DELETE_WAYPOINT")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_readWaypointNameProperties
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_WORD *)(a1 + 96) & 0x400) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOWaypointTypedReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readWaypointNameProperties_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasWaypointNameProperties
{
  -[GEOWaypointTyped _readWaypointNameProperties]((uint64_t)self);
  return self->_waypointNameProperties != 0;
}

- (GEOWaypointNameProperties)waypointNameProperties
{
  -[GEOWaypointTyped _readWaypointNameProperties]((uint64_t)self);
  return self->_waypointNameProperties;
}

- (void)setWaypointNameProperties:(id)a3
{
  *(_WORD *)&self->_flags |= 0x1400u;
  objc_storeStrong((id *)&self->_waypointNameProperties, a3);
}

- (void)_readUniqueWaypointId
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_WORD *)(a1 + 96) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOWaypointTypedReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readUniqueWaypointId_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasUniqueWaypointId
{
  -[GEOWaypointTyped _readUniqueWaypointId]((uint64_t)self);
  return self->_uniqueWaypointId != 0;
}

- (GEOWaypointUUID)uniqueWaypointId
{
  -[GEOWaypointTyped _readUniqueWaypointId]((uint64_t)self);
  return self->_uniqueWaypointId;
}

- (void)setUniqueWaypointId:(id)a3
{
  *(_WORD *)&self->_flags |= 0x1080u;
  objc_storeStrong((id *)&self->_uniqueWaypointId, a3);
}

- (int)downloadedOfflineRegionState
{
  os_unfair_lock_s *p_readerLock;
  __int16 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 1) != 0)
    return self->_downloadedOfflineRegionState;
  else
    return 0;
}

- (void)setDownloadedOfflineRegionState:(int)a3
{
  *(_WORD *)&self->_flags |= 0x1001u;
  self->_downloadedOfflineRegionState = a3;
}

- (void)setHasDownloadedOfflineRegionState:(BOOL)a3
{
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFE | a3 | 0x1000;
}

- (BOOL)hasDownloadedOfflineRegionState
{
  return *(_WORD *)&self->_flags & 1;
}

- (id)downloadedOfflineRegionStateAsString:(int)a3
{
  __CFString *v3;

  if (!a3)
    return CFSTR("DOWNLOADED_OFFLINE_REGION_STATE_UNKNOWN");
  if (a3 == 1)
  {
    v3 = CFSTR("DOWNLOADED_OFFLINE_REGION_STATE_OUTSIDE");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsDownloadedOfflineRegionState:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DOWNLOADED_OFFLINE_REGION_STATE_UNKNOWN")) & 1) != 0)
    v4 = 0;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("DOWNLOADED_OFFLINE_REGION_STATE_OUTSIDE"));

  return v4;
}

- (int)waypointLocationSource
{
  os_unfair_lock_s *p_readerLock;
  __int16 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 2) != 0)
    return self->_waypointLocationSource;
  else
    return 0;
}

- (void)setWaypointLocationSource:(int)a3
{
  *(_WORD *)&self->_flags |= 0x1002u;
  self->_waypointLocationSource = a3;
}

- (void)setHasWaypointLocationSource:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4098;
  else
    v3 = 4096;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasWaypointLocationSource
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
}

- (id)waypointLocationSourceAsString:(int)a3
{
  if (a3 < 5)
    return off_1E1C0F3E0[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsWaypointLocationSource:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WAYPOINT_LOCATION_SOURCE_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WAYPOINT_LOCATION_SOURCE_USER_CURRENT_LOCATION")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WAYPOINT_LOCATION_SOURCE_PERSON")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WAYPOINT_LOCATION_SOURCE_APPLE_CURATED_ROUTE")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("WAYPOINT_LOCATION_SOURCE_USER_CREATED_ROUTE")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
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
  v8.super_class = (Class)GEOWaypointTyped;
  -[GEOWaypointTyped description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOWaypointTyped dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOWaypointTyped _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  unsigned int v5;
  __CFString *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  __int16 v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  const __CFString *v24;
  uint64_t v25;
  __CFString *v26;
  const __CFString *v27;
  void *v28;
  void *v29;
  void *v30;
  const __CFString *v31;
  void *v32;
  void *v33;
  void *v34;
  const __CFString *v35;
  __int16 v36;
  int v37;
  __CFString *v38;
  const __CFString *v39;
  uint64_t v40;
  __CFString *v41;
  const __CFString *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  id v48;
  _QWORD v50[4];
  id v51;

  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_WORD *)(a1 + 96) & 8) != 0)
  {
    v5 = *(_DWORD *)(a1 + 88) - 2;
    if (v5 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 88));
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = off_1E1C0F3A8[v5];
    }
    if (a2)
      v7 = CFSTR("waypointType");
    else
      v7 = CFSTR("waypoint_type");
    objc_msgSend(v4, "setObject:forKey:", v6, v7);

  }
  objc_msgSend((id)a1, "waypointId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v8, "jsonRepresentation");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = CFSTR("waypointId");
    }
    else
    {
      objc_msgSend(v8, "dictionaryRepresentation");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = CFSTR("waypoint_id");
    }
    objc_msgSend(v4, "setObject:forKey:", v10, v11);

  }
  objc_msgSend((id)a1, "waypointPlace");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v12, "jsonRepresentation");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = CFSTR("waypointPlace");
    }
    else
    {
      objc_msgSend(v12, "dictionaryRepresentation");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = CFSTR("waypoint_place");
    }
    objc_msgSend(v4, "setObject:forKey:", v14, v15);

  }
  objc_msgSend((id)a1, "waypointLocation");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v16)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v16, "jsonRepresentation");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = CFSTR("waypointLocation");
    }
    else
    {
      objc_msgSend(v16, "dictionaryRepresentation");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = CFSTR("waypoint_location");
    }
    objc_msgSend(v4, "setObject:forKey:", v18, v19);

  }
  v20 = *(_WORD *)(a1 + 96);
  if ((v20 & 0x10) == 0)
  {
    if ((v20 & 0x20) == 0)
      goto LABEL_27;
LABEL_33:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 93));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v24 = CFSTR("isLocationOfInterest");
    else
      v24 = CFSTR("is_location_of_interest");
    objc_msgSend(v4, "setObject:forKey:", v23, v24);

    if ((*(_WORD *)(a1 + 96) & 4) == 0)
      goto LABEL_44;
    goto LABEL_37;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 92));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v22 = CFSTR("isCurrentLocation");
  else
    v22 = CFSTR("is_current_location");
  objc_msgSend(v4, "setObject:forKey:", v21, v22);

  v20 = *(_WORD *)(a1 + 96);
  if ((v20 & 0x20) != 0)
    goto LABEL_33;
LABEL_27:
  if ((v20 & 4) != 0)
  {
LABEL_37:
    v25 = *(int *)(a1 + 84);
    if (v25 >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 84));
      v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v26 = off_1E1C0F3C0[v25];
    }
    if (a2)
      v27 = CFSTR("waypointStatus");
    else
      v27 = CFSTR("waypoint_status");
    objc_msgSend(v4, "setObject:forKey:", v26, v27);

  }
LABEL_44:
  objc_msgSend((id)a1, "waypointNameProperties");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v28;
  if (v28)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v28, "jsonRepresentation");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = CFSTR("waypointNameProperties");
    }
    else
    {
      objc_msgSend(v28, "dictionaryRepresentation");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = CFSTR("waypoint_name_properties");
    }
    objc_msgSend(v4, "setObject:forKey:", v30, v31);

  }
  objc_msgSend((id)a1, "uniqueWaypointId");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v32;
  if (v32)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v32, "jsonRepresentation");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = CFSTR("uniqueWaypointId");
    }
    else
    {
      objc_msgSend(v32, "dictionaryRepresentation");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = CFSTR("unique_waypoint_id");
    }
    objc_msgSend(v4, "setObject:forKey:", v34, v35);

  }
  v36 = *(_WORD *)(a1 + 96);
  if ((v36 & 1) != 0)
  {
    v37 = *(_DWORD *)(a1 + 76);
    if (v37)
    {
      if (v37 == 1)
      {
        v38 = CFSTR("DOWNLOADED_OFFLINE_REGION_STATE_OUTSIDE");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 76));
        v38 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v38 = CFSTR("DOWNLOADED_OFFLINE_REGION_STATE_UNKNOWN");
    }
    if (a2)
      v39 = CFSTR("downloadedOfflineRegionState");
    else
      v39 = CFSTR("downloaded_offline_region_state");
    objc_msgSend(v4, "setObject:forKey:", v38, v39);

    v36 = *(_WORD *)(a1 + 96);
  }
  if ((v36 & 2) != 0)
  {
    v40 = *(int *)(a1 + 80);
    if (v40 >= 5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 80));
      v41 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v41 = off_1E1C0F3E0[v40];
    }
    if (a2)
      v42 = CFSTR("waypointLocationSource");
    else
      v42 = CFSTR("waypoint_location_source");
    objc_msgSend(v4, "setObject:forKey:", v41, v42);

  }
  v43 = *(void **)(a1 + 16);
  if (v43)
  {
    objc_msgSend(v43, "dictionaryRepresentation");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = v44;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v44, "count"));
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v50[0] = MEMORY[0x1E0C809B0];
      v50[1] = 3221225472;
      v50[2] = __46__GEOWaypointTyped__dictionaryRepresentation___block_invoke;
      v50[3] = &unk_1E1C00600;
      v47 = v46;
      v51 = v47;
      objc_msgSend(v45, "enumerateKeysAndObjectsUsingBlock:", v50);
      v48 = v47;

      v45 = v48;
    }
    objc_msgSend(v4, "setObject:forKey:", v45, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOWaypointTyped _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __46__GEOWaypointTyped__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOWaypointTyped)initWithDictionary:(id)a3
{
  return (GEOWaypointTyped *)-[GEOWaypointTyped _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  id v8;
  uint64_t v9;
  const __CFString *v10;
  void *v11;
  GEOWaypointID *v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  GEOWaypointPlace *v17;
  uint64_t v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  GEOWaypointLocation *v22;
  uint64_t v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  const __CFString *v27;
  void *v28;
  const __CFString *v29;
  void *v30;
  id v31;
  uint64_t v32;
  const __CFString *v33;
  void *v34;
  GEOWaypointNameProperties *v35;
  uint64_t v36;
  void *v37;
  const __CFString *v38;
  void *v39;
  GEOWaypointUUID *v40;
  void *v41;
  const __CFString *v42;
  void *v43;
  id v44;
  uint64_t v45;
  const __CFString *v46;
  void *v47;
  id v48;
  uint64_t v49;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("waypointType");
      else
        v6 = CFSTR("waypoint_type");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = v7;
        if ((objc_msgSend(v8, "isEqualToString:", CFSTR("WAYPOINT_ID")) & 1) != 0)
        {
          v9 = 2;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("WAYPOINT_PLACE")) & 1) != 0)
        {
          v9 = 3;
        }
        else if (objc_msgSend(v8, "isEqualToString:", CFSTR("WAYPOINT_LOCATION")))
        {
          v9 = 4;
        }
        else
        {
          v9 = 2;
        }

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_18;
        v9 = objc_msgSend(v7, "intValue");
      }
      objc_msgSend(a1, "setWaypointType:", v9);
LABEL_18:

      if (a3)
        v10 = CFSTR("waypointId");
      else
        v10 = CFSTR("waypoint_id");
      objc_msgSend(v5, "objectForKeyedSubscript:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v12 = [GEOWaypointID alloc];
        if ((a3 & 1) != 0)
          v13 = -[GEOWaypointID initWithJSON:](v12, "initWithJSON:", v11);
        else
          v13 = -[GEOWaypointID initWithDictionary:](v12, "initWithDictionary:", v11);
        v14 = (void *)v13;
        objc_msgSend(a1, "setWaypointId:", v13);

      }
      if (a3)
        v15 = CFSTR("waypointPlace");
      else
        v15 = CFSTR("waypoint_place");
      objc_msgSend(v5, "objectForKeyedSubscript:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v17 = [GEOWaypointPlace alloc];
        if ((a3 & 1) != 0)
          v18 = -[GEOWaypointPlace initWithJSON:](v17, "initWithJSON:", v16);
        else
          v18 = -[GEOWaypointPlace initWithDictionary:](v17, "initWithDictionary:", v16);
        v19 = (void *)v18;
        objc_msgSend(a1, "setWaypointPlace:", v18);

      }
      if (a3)
        v20 = CFSTR("waypointLocation");
      else
        v20 = CFSTR("waypoint_location");
      objc_msgSend(v5, "objectForKeyedSubscript:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v22 = [GEOWaypointLocation alloc];
        if ((a3 & 1) != 0)
          v23 = -[GEOWaypointLocation initWithJSON:](v22, "initWithJSON:", v21);
        else
          v23 = -[GEOWaypointLocation initWithDictionary:](v22, "initWithDictionary:", v21);
        v24 = (void *)v23;
        objc_msgSend(a1, "setWaypointLocation:", v23);

      }
      if (a3)
        v25 = CFSTR("isCurrentLocation");
      else
        v25 = CFSTR("is_current_location");
      objc_msgSend(v5, "objectForKeyedSubscript:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setIsCurrentLocation:", objc_msgSend(v26, "BOOLValue"));

      if (a3)
        v27 = CFSTR("isLocationOfInterest");
      else
        v27 = CFSTR("is_location_of_interest");
      objc_msgSend(v5, "objectForKeyedSubscript:", v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setIsLocationOfInterest:", objc_msgSend(v28, "BOOLValue"));

      if (a3)
        v29 = CFSTR("waypointStatus");
      else
        v29 = CFSTR("waypoint_status");
      objc_msgSend(v5, "objectForKeyedSubscript:", v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v31 = v30;
        if ((objc_msgSend(v31, "isEqualToString:", CFSTR("UNKNOWN_STATUS")) & 1) != 0)
        {
          v32 = 0;
        }
        else if ((objc_msgSend(v31, "isEqualToString:", CFSTR("ACTIVE_WAYPOINT")) & 1) != 0)
        {
          v32 = 1;
        }
        else if ((objc_msgSend(v31, "isEqualToString:", CFSTR("INSERT_WAYPOINT")) & 1) != 0)
        {
          v32 = 2;
        }
        else if (objc_msgSend(v31, "isEqualToString:", CFSTR("DELETE_WAYPOINT")))
        {
          v32 = 3;
        }
        else
        {
          v32 = 0;
        }

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_69;
        v32 = objc_msgSend(v30, "intValue");
      }
      objc_msgSend(a1, "setWaypointStatus:", v32);
LABEL_69:

      if (a3)
        v33 = CFSTR("waypointNameProperties");
      else
        v33 = CFSTR("waypoint_name_properties");
      objc_msgSend(v5, "objectForKeyedSubscript:", v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v35 = [GEOWaypointNameProperties alloc];
        if ((a3 & 1) != 0)
          v36 = -[GEOWaypointNameProperties initWithJSON:](v35, "initWithJSON:", v34);
        else
          v36 = -[GEOWaypointNameProperties initWithDictionary:](v35, "initWithDictionary:", v34);
        v37 = (void *)v36;
        objc_msgSend(a1, "setWaypointNameProperties:", v36);

      }
      if (a3)
        v38 = CFSTR("uniqueWaypointId");
      else
        v38 = CFSTR("unique_waypoint_id");
      objc_msgSend(v5, "objectForKeyedSubscript:", v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v40 = [GEOWaypointUUID alloc];
        if (v40)
          v41 = (void *)-[GEOWaypointUUID _initWithDictionary:isJSON:]((uint64_t)v40, v39);
        else
          v41 = 0;
        objc_msgSend(a1, "setUniqueWaypointId:", v41);

      }
      if (a3)
        v42 = CFSTR("downloadedOfflineRegionState");
      else
        v42 = CFSTR("downloaded_offline_region_state");
      objc_msgSend(v5, "objectForKeyedSubscript:", v42);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v44 = v43;
        if ((objc_msgSend(v44, "isEqualToString:", CFSTR("DOWNLOADED_OFFLINE_REGION_STATE_UNKNOWN")) & 1) != 0)
          v45 = 0;
        else
          v45 = objc_msgSend(v44, "isEqualToString:", CFSTR("DOWNLOADED_OFFLINE_REGION_STATE_OUTSIDE"));

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_95;
        v45 = objc_msgSend(v43, "intValue");
      }
      objc_msgSend(a1, "setDownloadedOfflineRegionState:", v45);
LABEL_95:

      if (a3)
        v46 = CFSTR("waypointLocationSource");
      else
        v46 = CFSTR("waypoint_location_source");
      objc_msgSend(v5, "objectForKeyedSubscript:", v46);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v48 = v47;
        if ((objc_msgSend(v48, "isEqualToString:", CFSTR("WAYPOINT_LOCATION_SOURCE_UNKNOWN")) & 1) != 0)
        {
          v49 = 0;
        }
        else if ((objc_msgSend(v48, "isEqualToString:", CFSTR("WAYPOINT_LOCATION_SOURCE_USER_CURRENT_LOCATION")) & 1) != 0)
        {
          v49 = 1;
        }
        else if ((objc_msgSend(v48, "isEqualToString:", CFSTR("WAYPOINT_LOCATION_SOURCE_PERSON")) & 1) != 0)
        {
          v49 = 2;
        }
        else if ((objc_msgSend(v48, "isEqualToString:", CFSTR("WAYPOINT_LOCATION_SOURCE_APPLE_CURATED_ROUTE")) & 1) != 0)
        {
          v49 = 3;
        }
        else if (objc_msgSend(v48, "isEqualToString:", CFSTR("WAYPOINT_LOCATION_SOURCE_USER_CREATED_ROUTE")))
        {
          v49 = 4;
        }
        else
        {
          v49 = 0;
        }

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_114:

          goto LABEL_115;
        }
        v49 = objc_msgSend(v47, "intValue");
      }
      objc_msgSend(a1, "setWaypointLocationSource:", v49);
      goto LABEL_114;
    }
  }
LABEL_115:

  return a1;
}

- (GEOWaypointTyped)initWithJSON:(id)a3
{
  return (GEOWaypointTyped *)-[GEOWaypointTyped _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_3177;
    else
      v8 = (int *)&readAll__nonRecursiveTag_3178;
    GEOWaypointTypedReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEOWaypointTypedCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOWaypointTypedIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOWaypointTypedReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  id v5;
  __int16 flags;
  __int16 v7;
  PBDataReader *v8;
  void *v9;
  id v10;

  v10 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOWaypointTypedIsDirty((uint64_t)self) & 1) == 0)
  {
    v8 = self->_reader;
    objc_sync_enter(v8);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "writeData:", v9);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v8);
    goto LABEL_28;
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOWaypointTyped readAll:](self, "readAll:", 0);
  if ((*(_WORD *)&self->_flags & 8) != 0)
    PBDataWriterWriteInt32Field();
  v5 = v10;
  if (self->_waypointId)
  {
    PBDataWriterWriteSubmessage();
    v5 = v10;
  }
  if (self->_waypointPlace)
  {
    PBDataWriterWriteSubmessage();
    v5 = v10;
  }
  if (self->_waypointLocation)
  {
    PBDataWriterWriteSubmessage();
    v5 = v10;
  }
  flags = (__int16)self->_flags;
  if ((flags & 0x10) == 0)
  {
    if ((flags & 0x20) == 0)
      goto LABEL_13;
LABEL_25:
    PBDataWriterWriteBOOLField();
    v5 = v10;
    if ((*(_WORD *)&self->_flags & 4) == 0)
      goto LABEL_15;
    goto LABEL_14;
  }
  PBDataWriterWriteBOOLField();
  v5 = v10;
  flags = (__int16)self->_flags;
  if ((flags & 0x20) != 0)
    goto LABEL_25;
LABEL_13:
  if ((flags & 4) != 0)
  {
LABEL_14:
    PBDataWriterWriteInt32Field();
    v5 = v10;
  }
LABEL_15:
  if (self->_waypointNameProperties)
  {
    PBDataWriterWriteSubmessage();
    v5 = v10;
  }
  if (self->_uniqueWaypointId)
  {
    PBDataWriterWriteSubmessage();
    v5 = v10;
  }
  v7 = (__int16)self->_flags;
  if ((v7 & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v5 = v10;
    v7 = (__int16)self->_flags;
  }
  if ((v7 & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    v5 = v10;
  }
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v5);
LABEL_28:

}

- (void)clearSensitiveFields:(unint64_t)a3
{
  GEOWaypointTypedClearSensitiveFields(self, a3, 1);
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[GEOWaypointTyped _readWaypointId]((uint64_t)self);
  if (-[GEOWaypointID hasGreenTeaWithValue:](self->_waypointId, "hasGreenTeaWithValue:", v3))
    return 1;
  -[GEOWaypointTyped _readWaypointLocation]((uint64_t)self);
  if (-[GEOWaypointLocation hasGreenTeaWithValue:](self->_waypointLocation, "hasGreenTeaWithValue:", v3))
    return 1;
  -[GEOWaypointTyped _readWaypointPlace]((uint64_t)self);
  return -[GEOWaypointPlace hasGreenTeaWithValue:](self->_waypointPlace, "hasGreenTeaWithValue:", v3);
}

- (void)copyTo:(id)a3
{
  __int16 flags;
  __int16 v5;
  id *v6;

  v6 = (id *)a3;
  -[GEOWaypointTyped readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v6 + 1, self->_reader);
  *((_DWORD *)v6 + 16) = self->_readerMarkPos;
  *((_DWORD *)v6 + 17) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if ((*(_WORD *)&self->_flags & 8) != 0)
  {
    *((_DWORD *)v6 + 22) = self->_waypointType;
    *((_WORD *)v6 + 48) |= 8u;
  }
  if (self->_waypointId)
    objc_msgSend(v6, "setWaypointId:");
  if (self->_waypointPlace)
    objc_msgSend(v6, "setWaypointPlace:");
  if (self->_waypointLocation)
    objc_msgSend(v6, "setWaypointLocation:");
  flags = (__int16)self->_flags;
  if ((flags & 0x10) != 0)
  {
    *((_BYTE *)v6 + 92) = self->_isCurrentLocation;
    *((_WORD *)v6 + 48) |= 0x10u;
    flags = (__int16)self->_flags;
    if ((flags & 0x20) == 0)
    {
LABEL_11:
      if ((flags & 4) == 0)
        goto LABEL_13;
      goto LABEL_12;
    }
  }
  else if ((flags & 0x20) == 0)
  {
    goto LABEL_11;
  }
  *((_BYTE *)v6 + 93) = self->_isLocationOfInterest;
  *((_WORD *)v6 + 48) |= 0x20u;
  if ((*(_WORD *)&self->_flags & 4) != 0)
  {
LABEL_12:
    *((_DWORD *)v6 + 21) = self->_waypointStatus;
    *((_WORD *)v6 + 48) |= 4u;
  }
LABEL_13:
  if (self->_waypointNameProperties)
    objc_msgSend(v6, "setWaypointNameProperties:");
  if (self->_uniqueWaypointId)
    objc_msgSend(v6, "setUniqueWaypointId:");
  v5 = (__int16)self->_flags;
  if ((v5 & 1) != 0)
  {
    *((_DWORD *)v6 + 19) = self->_downloadedOfflineRegionState;
    *((_WORD *)v6 + 48) |= 1u;
    v5 = (__int16)self->_flags;
  }
  if ((v5 & 2) != 0)
  {
    *((_DWORD *)v6 + 20) = self->_waypointLocationSource;
    *((_WORD *)v6 + 48) |= 2u;
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
  __int16 flags;
  id v16;
  void *v17;
  id v18;
  void *v19;
  __int16 v20;
  PBUnknownFields *v21;

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
      GEOWaypointTypedReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_16;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOWaypointTyped readAll:](self, "readAll:", 0);
  if ((*(_WORD *)&self->_flags & 8) != 0)
  {
    *(_DWORD *)(v5 + 88) = self->_waypointType;
    *(_WORD *)(v5 + 96) |= 8u;
  }
  v9 = -[GEOWaypointID copyWithZone:](self->_waypointId, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v9;

  v11 = -[GEOWaypointPlace copyWithZone:](self->_waypointPlace, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v11;

  v13 = -[GEOWaypointLocation copyWithZone:](self->_waypointLocation, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v13;

  flags = (__int16)self->_flags;
  if ((flags & 0x10) == 0)
  {
    if ((flags & 0x20) == 0)
      goto LABEL_9;
LABEL_18:
    *(_BYTE *)(v5 + 93) = self->_isLocationOfInterest;
    *(_WORD *)(v5 + 96) |= 0x20u;
    if ((*(_WORD *)&self->_flags & 4) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
  *(_BYTE *)(v5 + 92) = self->_isCurrentLocation;
  *(_WORD *)(v5 + 96) |= 0x10u;
  flags = (__int16)self->_flags;
  if ((flags & 0x20) != 0)
    goto LABEL_18;
LABEL_9:
  if ((flags & 4) != 0)
  {
LABEL_10:
    *(_DWORD *)(v5 + 84) = self->_waypointStatus;
    *(_WORD *)(v5 + 96) |= 4u;
  }
LABEL_11:
  v16 = -[GEOWaypointNameProperties copyWithZone:](self->_waypointNameProperties, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v16;

  v18 = -[GEOWaypointUUID copyWithZone:](self->_uniqueWaypointId, "copyWithZone:", a3);
  v19 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v18;

  v20 = (__int16)self->_flags;
  if ((v20 & 1) != 0)
  {
    *(_DWORD *)(v5 + 76) = self->_downloadedOfflineRegionState;
    *(_WORD *)(v5 + 96) |= 1u;
    v20 = (__int16)self->_flags;
  }
  if ((v20 & 2) != 0)
  {
    *(_DWORD *)(v5 + 80) = self->_waypointLocationSource;
    *(_WORD *)(v5 + 96) |= 2u;
  }
  v21 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v21;
LABEL_16:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  __int16 v5;
  GEOWaypointID *waypointId;
  GEOWaypointPlace *waypointPlace;
  GEOWaypointLocation *waypointLocation;
  __int16 flags;
  __int16 v10;
  GEOWaypointNameProperties *waypointNameProperties;
  GEOWaypointUUID *uniqueWaypointId;
  __int16 v13;
  __int16 v14;
  BOOL v15;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_47;
  -[GEOWaypointTyped readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  v5 = *((_WORD *)v4 + 48);
  if ((*(_WORD *)&self->_flags & 8) != 0)
  {
    if ((v5 & 8) == 0 || self->_waypointType != *((_DWORD *)v4 + 22))
      goto LABEL_47;
  }
  else if ((v5 & 8) != 0)
  {
    goto LABEL_47;
  }
  waypointId = self->_waypointId;
  if ((unint64_t)waypointId | *((_QWORD *)v4 + 4) && !-[GEOWaypointID isEqual:](waypointId, "isEqual:"))
    goto LABEL_47;
  waypointPlace = self->_waypointPlace;
  if ((unint64_t)waypointPlace | *((_QWORD *)v4 + 7))
  {
    if (!-[GEOWaypointPlace isEqual:](waypointPlace, "isEqual:"))
      goto LABEL_47;
  }
  waypointLocation = self->_waypointLocation;
  if ((unint64_t)waypointLocation | *((_QWORD *)v4 + 5))
  {
    if (!-[GEOWaypointLocation isEqual:](waypointLocation, "isEqual:"))
      goto LABEL_47;
  }
  flags = (__int16)self->_flags;
  v10 = *((_WORD *)v4 + 48);
  if ((flags & 0x10) != 0)
  {
    if ((v10 & 0x10) == 0)
      goto LABEL_47;
    if (self->_isCurrentLocation)
    {
      if (!*((_BYTE *)v4 + 92))
        goto LABEL_47;
    }
    else if (*((_BYTE *)v4 + 92))
    {
      goto LABEL_47;
    }
  }
  else if ((v10 & 0x10) != 0)
  {
    goto LABEL_47;
  }
  if ((flags & 0x20) != 0)
  {
    if ((v10 & 0x20) != 0)
    {
      if (self->_isLocationOfInterest)
      {
        if (!*((_BYTE *)v4 + 93))
          goto LABEL_47;
        goto LABEL_29;
      }
      if (!*((_BYTE *)v4 + 93))
        goto LABEL_29;
    }
LABEL_47:
    v15 = 0;
    goto LABEL_48;
  }
  if ((v10 & 0x20) != 0)
    goto LABEL_47;
LABEL_29:
  if ((flags & 4) != 0)
  {
    if ((v10 & 4) == 0 || self->_waypointStatus != *((_DWORD *)v4 + 21))
      goto LABEL_47;
  }
  else if ((v10 & 4) != 0)
  {
    goto LABEL_47;
  }
  waypointNameProperties = self->_waypointNameProperties;
  if ((unint64_t)waypointNameProperties | *((_QWORD *)v4 + 6)
    && !-[GEOWaypointNameProperties isEqual:](waypointNameProperties, "isEqual:"))
  {
    goto LABEL_47;
  }
  uniqueWaypointId = self->_uniqueWaypointId;
  if ((unint64_t)uniqueWaypointId | *((_QWORD *)v4 + 3))
  {
    if (!-[GEOWaypointUUID isEqual:](uniqueWaypointId, "isEqual:"))
      goto LABEL_47;
  }
  v13 = (__int16)self->_flags;
  v14 = *((_WORD *)v4 + 48);
  if ((v13 & 1) != 0)
  {
    if ((v14 & 1) == 0 || self->_downloadedOfflineRegionState != *((_DWORD *)v4 + 19))
      goto LABEL_47;
  }
  else if ((v14 & 1) != 0)
  {
    goto LABEL_47;
  }
  v15 = (v14 & 2) == 0;
  if ((v13 & 2) != 0)
  {
    if ((v14 & 2) == 0 || self->_waypointLocationSource != *((_DWORD *)v4 + 20))
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
  unint64_t v5;
  __int16 flags;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;

  -[GEOWaypointTyped readAll:](self, "readAll:", 1);
  if ((*(_WORD *)&self->_flags & 8) != 0)
    v16 = 2654435761 * self->_waypointType;
  else
    v16 = 0;
  v3 = -[GEOWaypointID hash](self->_waypointId, "hash");
  v4 = -[GEOWaypointPlace hash](self->_waypointPlace, "hash");
  v5 = -[GEOWaypointLocation hash](self->_waypointLocation, "hash");
  flags = (__int16)self->_flags;
  if ((flags & 0x10) == 0)
  {
    v7 = 0;
    if ((flags & 0x20) != 0)
      goto LABEL_6;
LABEL_9:
    v8 = 0;
    if ((flags & 4) != 0)
      goto LABEL_7;
    goto LABEL_10;
  }
  v7 = 2654435761 * self->_isCurrentLocation;
  if ((flags & 0x20) == 0)
    goto LABEL_9;
LABEL_6:
  v8 = 2654435761 * self->_isLocationOfInterest;
  if ((flags & 4) != 0)
  {
LABEL_7:
    v9 = 2654435761 * self->_waypointStatus;
    goto LABEL_11;
  }
LABEL_10:
  v9 = 0;
LABEL_11:
  v10 = -[GEOWaypointNameProperties hash](self->_waypointNameProperties, "hash");
  v11 = -[GEOWaypointUUID hash](self->_uniqueWaypointId, "hash");
  v12 = (__int16)self->_flags;
  if ((v12 & 1) != 0)
  {
    v13 = 2654435761 * self->_downloadedOfflineRegionState;
    if ((v12 & 2) != 0)
      goto LABEL_13;
LABEL_15:
    v14 = 0;
    return v3 ^ v16 ^ v4 ^ v5 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v13 ^ v14;
  }
  v13 = 0;
  if ((v12 & 2) == 0)
    goto LABEL_15;
LABEL_13:
  v14 = 2654435761 * self->_waypointLocationSource;
  return v3 ^ v16 ^ v4 ^ v5 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v13 ^ v14;
}

- (void)mergeFrom:(id)a3
{
  int *v4;
  GEOWaypointID *waypointId;
  uint64_t v6;
  GEOWaypointPlace *waypointPlace;
  uint64_t v8;
  GEOWaypointLocation *waypointLocation;
  uint64_t v10;
  __int16 v11;
  GEOWaypointNameProperties *waypointNameProperties;
  uint64_t v13;
  GEOWaypointUUID *uniqueWaypointId;
  void *v15;
  __int16 v16;
  int *v17;

  v17 = (int *)a3;
  objc_msgSend(v17, "readAll:", 0);
  v4 = v17;
  if ((v17[24] & 8) != 0)
  {
    self->_waypointType = v17[22];
    *(_WORD *)&self->_flags |= 8u;
  }
  waypointId = self->_waypointId;
  v6 = *((_QWORD *)v17 + 4);
  if (waypointId)
  {
    if (!v6)
      goto LABEL_9;
    -[GEOWaypointID mergeFrom:](waypointId, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_9;
    -[GEOWaypointTyped setWaypointId:](self, "setWaypointId:");
  }
  v4 = v17;
LABEL_9:
  waypointPlace = self->_waypointPlace;
  v8 = *((_QWORD *)v4 + 7);
  if (waypointPlace)
  {
    if (!v8)
      goto LABEL_15;
    -[GEOWaypointPlace mergeFrom:](waypointPlace, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_15;
    -[GEOWaypointTyped setWaypointPlace:](self, "setWaypointPlace:");
  }
  v4 = v17;
LABEL_15:
  waypointLocation = self->_waypointLocation;
  v10 = *((_QWORD *)v4 + 5);
  if (waypointLocation)
  {
    if (!v10)
      goto LABEL_21;
    -[GEOWaypointLocation mergeFrom:](waypointLocation, "mergeFrom:");
  }
  else
  {
    if (!v10)
      goto LABEL_21;
    -[GEOWaypointTyped setWaypointLocation:](self, "setWaypointLocation:");
  }
  v4 = v17;
LABEL_21:
  v11 = *((_WORD *)v4 + 48);
  if ((v11 & 0x10) != 0)
  {
    self->_isCurrentLocation = *((_BYTE *)v4 + 92);
    *(_WORD *)&self->_flags |= 0x10u;
    v11 = *((_WORD *)v4 + 48);
    if ((v11 & 0x20) == 0)
    {
LABEL_23:
      if ((v11 & 4) == 0)
        goto LABEL_25;
      goto LABEL_24;
    }
  }
  else if ((v11 & 0x20) == 0)
  {
    goto LABEL_23;
  }
  self->_isLocationOfInterest = *((_BYTE *)v4 + 93);
  *(_WORD *)&self->_flags |= 0x20u;
  if ((v4[24] & 4) != 0)
  {
LABEL_24:
    self->_waypointStatus = v4[21];
    *(_WORD *)&self->_flags |= 4u;
  }
LABEL_25:
  waypointNameProperties = self->_waypointNameProperties;
  v13 = *((_QWORD *)v4 + 6);
  if (waypointNameProperties)
  {
    if (!v13)
      goto LABEL_34;
    -[GEOWaypointNameProperties mergeFrom:](waypointNameProperties, "mergeFrom:");
  }
  else
  {
    if (!v13)
      goto LABEL_34;
    -[GEOWaypointTyped setWaypointNameProperties:](self, "setWaypointNameProperties:");
  }
  v4 = v17;
LABEL_34:
  uniqueWaypointId = self->_uniqueWaypointId;
  v15 = (void *)*((_QWORD *)v4 + 3);
  if (uniqueWaypointId)
  {
    if (!v15)
      goto LABEL_40;
    -[GEOWaypointUUID mergeFrom:]((uint64_t)uniqueWaypointId, v15);
  }
  else
  {
    if (!v15)
      goto LABEL_40;
    -[GEOWaypointTyped setUniqueWaypointId:](self, "setUniqueWaypointId:", *((_QWORD *)v4 + 3));
  }
  v4 = v17;
LABEL_40:
  v16 = *((_WORD *)v4 + 48);
  if ((v16 & 1) != 0)
  {
    self->_downloadedOfflineRegionState = v4[19];
    *(_WORD *)&self->_flags |= 1u;
    v16 = *((_WORD *)v4 + 48);
  }
  if ((v16 & 2) != 0)
  {
    self->_waypointLocationSource = v4[20];
    *(_WORD *)&self->_flags |= 2u;
  }

}

- (PBUnknownFields)unknownFields
{
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v5;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_WORD *)&self->_flags & 0x40) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      v5 = reader;
      objc_sync_enter(v5);
      GEOWaypointTypedReadSpecified((uint64_t)self, (unint64_t)self->_reader, unknownFields_tags_3181);
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
  GEOWaypointUUID *uniqueWaypointId;
  PBUnknownFields *v8;

  v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x1040u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEOWaypointTyped readAll:](self, "readAll:", 0);
    -[GEOWaypointID clearUnknownFields:](self->_waypointId, "clearUnknownFields:", 1);
    -[GEOWaypointPlace clearUnknownFields:](self->_waypointPlace, "clearUnknownFields:", 1);
    -[GEOWaypointLocation clearUnknownFields:](self->_waypointLocation, "clearUnknownFields:", 1);
    -[GEOWaypointNameProperties clearUnknownFields:](self->_waypointNameProperties, "clearUnknownFields:", 1);
    uniqueWaypointId = self->_uniqueWaypointId;
    if (uniqueWaypointId)
    {
      v8 = uniqueWaypointId->_unknownFields;
      uniqueWaypointId->_unknownFields = 0;

    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_waypointPlace, 0);
  objc_storeStrong((id *)&self->_waypointNameProperties, 0);
  objc_storeStrong((id *)&self->_waypointLocation, 0);
  objc_storeStrong((id *)&self->_waypointId, 0);
  objc_storeStrong((id *)&self->_uniqueWaypointId, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

- (id)locationForWaypoint
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  if (-[GEOWaypointTyped waypointType](self, "waypointType") == 3)
  {
    -[GEOWaypointTyped waypointPlace](self, "waypointPlace");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "center");
    v4 = objc_claimAutoreleasedReturnValue();
LABEL_7:
    v6 = (void *)v4;
    goto LABEL_8;
  }
  if (-[GEOWaypointTyped waypointType](self, "waypointType") != 4)
  {
    if (-[GEOWaypointTyped waypointType](self, "waypointType") != 2)
    {
      v6 = 0;
      return v6;
    }
    -[GEOWaypointTyped waypointId](self, "waypointId");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "locationHint");
    v4 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  -[GEOWaypointTyped waypointLocation](self, "waypointLocation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "location");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "latLng");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_8:
  return v6;
}

- (id)loggingDescription
{
  void *v2;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v4 = -[GEOWaypointTyped waypointType](self, "waypointType");
  switch(v4)
  {
    case 2:
      -[GEOWaypointTyped waypointId](self, "waypointId");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "locationHint");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v7, "lat");
      v15 = v14;
      objc_msgSend(v7, "lng");
      v17 = v16;
      -[GEOWaypointTyped waypointId](self, "waypointId");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "muid");
      -[GEOWaypointTyped waypointId](self, "waypointId");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "placeNameHint");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringWithFormat:", CFSTR("%f, %f | WAYPOINT_ID | muid: %llu | %@"), v15, v17, v19, v21);
      v2 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_8:
      return v2;
    case 3:
      -[GEOWaypointTyped waypointPlace](self, "waypointPlace");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "center");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v23 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v7, "lat");
      v25 = v24;
      objc_msgSend(v7, "lng");
      objc_msgSend(v23, "stringWithFormat:", CFSTR("%f, %f | WAYPOINT_PLACE"), v25, v26);
      goto LABEL_7;
    case 4:
      -[GEOWaypointTyped waypointLocation](self, "waypointLocation");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "location");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "latLng");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v7, "lat");
      v10 = v9;
      objc_msgSend(v7, "lng");
      objc_msgSend(v8, "stringWithFormat:", CFSTR("%f, %f | WAYPOINT_LOCATION"), v10, v11);
LABEL_7:
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
  }
  return v2;
}

- (void)clearLocations
{
  -[GEOWaypointTyped setWaypointLocationSource:](self, "setWaypointLocationSource:", 0);
}

@end
