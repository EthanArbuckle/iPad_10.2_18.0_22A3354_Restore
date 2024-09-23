@implementation GEOLogMsgEventThrottle

- (GEOLogMsgEventThrottle)init
{
  GEOLogMsgEventThrottle *v2;
  GEOLogMsgEventThrottle *v3;
  GEOLogMsgEventThrottle *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOLogMsgEventThrottle;
  v2 = -[GEOLogMsgEventThrottle init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOLogMsgEventThrottle)initWithData:(id)a3
{
  GEOLogMsgEventThrottle *v3;
  GEOLogMsgEventThrottle *v4;
  GEOLogMsgEventThrottle *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOLogMsgEventThrottle;
  v3 = -[GEOLogMsgEventThrottle initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (int)networkService
{
  os_unfair_lock_s *p_readerLock;
  __int16 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 2) != 0)
    return self->_networkService;
  else
    return 0;
}

- (void)setNetworkService:(int)a3
{
  *(_WORD *)&self->_flags |= 0x802u;
  self->_networkService = a3;
}

- (void)setHasNetworkService:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2050;
  else
    v3 = 2048;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasNetworkService
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
}

- (id)networkServiceAsString:(int)a3
{
  __CFString *v3;

  if (a3 < 0x1D && ((0x1FFF7FFFu >> a3) & 1) != 0)
  {
    v3 = off_1E1C23298[a3];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsNetworkService:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NETWORK_SERVICE_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REVERSE_GEOCODER")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FORWARD_GEOCODER")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SEARCH")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DIRECTIONS")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TILE")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRAFFIC_ETA")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SIMPLE_ETA")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SUGGESTIONS")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BATCH_REVGEO")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAP_MATCH")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ADDRESS_CORRECTION_INIT")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ADDRESS_CORRECTION_UPDATE")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PLACE_DATA")) & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RESOURCE_LOADER")) & 1) != 0)
  {
    v4 = 14;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LOG_MESSAGE_USAGE")) & 1) != 0)
  {
    v4 = 16;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LOCATION_SHIFT")) & 1) != 0)
  {
    v4 = 17;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AB_ASSIGN")) & 1) != 0)
  {
    v4 = 18;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MANIFEST")) & 1) != 0)
  {
    v4 = 19;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REALTIME_TRAFFIC_PROBE")) & 1) != 0)
  {
    v4 = 20;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BATCH_TRAFFIC_PROBE")) & 1) != 0)
  {
    v4 = 21;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYNC")) & 1) != 0)
  {
    v4 = 22;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WIFI_QUALITY")) & 1) != 0)
  {
    v4 = 23;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NETWORK_DEFAULTS")) & 1) != 0)
  {
    v4 = 24;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MUNIN_RESOURCE")) & 1) != 0)
  {
    v4 = 25;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("JUNCTION_VIEW")) & 1) != 0)
  {
    v4 = 26;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WIFI_TILE")) & 1) != 0)
  {
    v4 = 27;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("INCIDENT")))
  {
    v4 = 28;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_readRequestAppIdentifier
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_WORD *)(a1 + 88) & 0x200) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventThrottleReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRequestAppIdentifier_tags_4156);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasRequestAppIdentifier
{
  -[GEOLogMsgEventThrottle _readRequestAppIdentifier]((uint64_t)self);
  return self->_requestAppIdentifier != 0;
}

- (NSString)requestAppIdentifier
{
  -[GEOLogMsgEventThrottle _readRequestAppIdentifier]((uint64_t)self);
  return self->_requestAppIdentifier;
}

- (void)setRequestAppIdentifier:(id)a3
{
  *(_WORD *)&self->_flags |= 0xA00u;
  objc_storeStrong((id *)&self->_requestAppIdentifier, a3);
}

- (void)_readManifestEnv
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_WORD *)(a1 + 88) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventThrottleReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readManifestEnv_tags_4157);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasManifestEnv
{
  -[GEOLogMsgEventThrottle _readManifestEnv]((uint64_t)self);
  return self->_manifestEnv != 0;
}

- (NSString)manifestEnv
{
  -[GEOLogMsgEventThrottle _readManifestEnv]((uint64_t)self);
  return self->_manifestEnv;
}

- (void)setManifestEnv:(id)a3
{
  *(_WORD *)&self->_flags |= 0x900u;
  objc_storeStrong((id *)&self->_manifestEnv, a3);
}

- (unsigned)tilesetId
{
  return self->_tilesetId;
}

- (void)setTilesetId:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x880u;
  self->_tilesetId = a3;
}

- (void)setHasTilesetId:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2176;
  else
    v3 = 2048;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFF7F | v3;
}

- (BOOL)hasTilesetId
{
  return (*(_WORD *)&self->_flags >> 7) & 1;
}

- (int)throttleType
{
  os_unfair_lock_s *p_readerLock;
  __int16 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 0x40) != 0)
    return self->_throttleType;
  else
    return 0;
}

- (void)setThrottleType:(int)a3
{
  *(_WORD *)&self->_flags |= 0x840u;
  self->_throttleType = a3;
}

- (void)setHasThrottleType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2112;
  else
    v3 = 2048;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFBF | v3;
}

- (BOOL)hasThrottleType
{
  return (*(_WORD *)&self->_flags >> 6) & 1;
}

- (id)throttleTypeAsString:(int)a3
{
  if (a3 < 3)
    return off_1E1C22930[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsThrottleType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNDEFINED")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ALL")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("SPECIFIC")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)throttleMode
{
  os_unfair_lock_s *p_readerLock;
  __int16 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 8) != 0)
    return self->_throttleMode;
  else
    return 0;
}

- (void)setThrottleMode:(int)a3
{
  *(_WORD *)&self->_flags |= 0x808u;
  self->_throttleMode = a3;
}

- (void)setHasThrottleMode:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2056;
  else
    v3 = 2048;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFF7 | v3;
}

- (BOOL)hasThrottleMode
{
  return (*(_WORD *)&self->_flags >> 3) & 1;
}

- (id)throttleModeAsString:(int)a3
{
  if (a3 < 3)
    return off_1E1C22948[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsThrottleMode:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNDEFINED")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SHORT_INTERVAL")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("LONG_INTERVAL")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_readThrottleReqType
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_WORD *)(a1 + 88) & 0x400) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventThrottleReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readThrottleReqType_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasThrottleReqType
{
  -[GEOLogMsgEventThrottle _readThrottleReqType]((uint64_t)self);
  return self->_throttleReqType != 0;
}

- (NSString)throttleReqType
{
  -[GEOLogMsgEventThrottle _readThrottleReqType]((uint64_t)self);
  return self->_throttleReqType;
}

- (void)setThrottleReqType:(id)a3
{
  *(_WORD *)&self->_flags |= 0xC00u;
  objc_storeStrong((id *)&self->_throttleReqType, a3);
}

- (unsigned)throttleTriggerCount
{
  return self->_throttleTriggerCount;
}

- (void)setThrottleTriggerCount:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x810u;
  self->_throttleTriggerCount = a3;
}

- (void)setHasThrottleTriggerCount:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2064;
  else
    v3 = 2048;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFEF | v3;
}

- (BOOL)hasThrottleTriggerCount
{
  return (*(_WORD *)&self->_flags >> 4) & 1;
}

- (unsigned)throttleTriggerDuration
{
  return self->_throttleTriggerDuration;
}

- (void)setThrottleTriggerDuration:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x820u;
  self->_throttleTriggerDuration = a3;
}

- (void)setHasThrottleTriggerDuration:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2080;
  else
    v3 = 2048;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFDF | v3;
}

- (BOOL)hasThrottleTriggerDuration
{
  return (*(_WORD *)&self->_flags >> 5) & 1;
}

- (unsigned)throttleCount
{
  return self->_throttleCount;
}

- (void)setThrottleCount:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x804u;
  self->_throttleCount = a3;
}

- (void)setHasThrottleCount:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2052;
  else
    v3 = 2048;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFB | v3;
}

- (BOOL)hasThrottleCount
{
  return (*(_WORD *)&self->_flags >> 2) & 1;
}

- (double)throttleDuration
{
  return self->_throttleDuration;
}

- (void)setThrottleDuration:(double)a3
{
  *(_WORD *)&self->_flags |= 0x801u;
  self->_throttleDuration = a3;
}

- (void)setHasThrottleDuration:(BOOL)a3
{
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFE | a3 | 0x800;
}

- (BOOL)hasThrottleDuration
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
  v8.super_class = (Class)GEOLogMsgEventThrottle;
  -[GEOLogMsgEventThrottle description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOLogMsgEventThrottle dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgEventThrottle _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  uint64_t v5;
  __CFString *v6;
  const __CFString *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  const __CFString *v11;
  __int16 v12;
  void *v13;
  const __CFString *v14;
  uint64_t v15;
  __CFString *v16;
  const __CFString *v17;
  uint64_t v18;
  __CFString *v19;
  const __CFString *v20;
  void *v21;
  const __CFString *v22;
  __int16 v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  const __CFString *v27;
  void *v28;
  const __CFString *v29;
  void *v30;
  const __CFString *v31;

  if (!a1)
  {
    v4 = 0;
    return v4;
  }
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_WORD *)(a1 + 88) & 2) != 0)
  {
    v5 = *(int *)(a1 + 60);
    if (v5 < 0x1D && ((0x1FFF7FFFu >> v5) & 1) != 0)
    {
      v6 = off_1E1C23298[v5];
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 60));
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    if (a2)
      v7 = CFSTR("networkService");
    else
      v7 = CFSTR("network_service");
    objc_msgSend(v4, "setObject:forKey:", v6, v7);

  }
  objc_msgSend((id)a1, "requestAppIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    if (a2)
      v9 = CFSTR("requestAppIdentifier");
    else
      v9 = CFSTR("request_app_identifier");
    objc_msgSend(v4, "setObject:forKey:", v8, v9);
  }

  objc_msgSend((id)a1, "manifestEnv");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    if (a2)
      v11 = CFSTR("manifestEnv");
    else
      v11 = CFSTR("manifest_env");
    objc_msgSend(v4, "setObject:forKey:", v10, v11);
  }

  v12 = *(_WORD *)(a1 + 88);
  if ((v12 & 0x80) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 84));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v14 = CFSTR("tilesetId");
    else
      v14 = CFSTR("tileset_id");
    objc_msgSend(v4, "setObject:forKey:", v13, v14);

    v12 = *(_WORD *)(a1 + 88);
    if ((v12 & 0x40) == 0)
    {
LABEL_23:
      if ((v12 & 8) == 0)
        goto LABEL_43;
      goto LABEL_36;
    }
  }
  else if ((v12 & 0x40) == 0)
  {
    goto LABEL_23;
  }
  v15 = *(int *)(a1 + 80);
  if (v15 >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 80));
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = off_1E1C22930[v15];
  }
  if (a2)
    v17 = CFSTR("throttleType");
  else
    v17 = CFSTR("throttle_type");
  objc_msgSend(v4, "setObject:forKey:", v16, v17);

  if ((*(_WORD *)(a1 + 88) & 8) != 0)
  {
LABEL_36:
    v18 = *(int *)(a1 + 68);
    if (v18 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 68));
      v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v19 = off_1E1C22948[v18];
    }
    if (a2)
      v20 = CFSTR("throttleMode");
    else
      v20 = CFSTR("throttle_mode");
    objc_msgSend(v4, "setObject:forKey:", v19, v20);

  }
LABEL_43:
  objc_msgSend((id)a1, "throttleReqType");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    if (a2)
      v22 = CFSTR("throttleReqType");
    else
      v22 = CFSTR("throttle_req_type");
    objc_msgSend(v4, "setObject:forKey:", v21, v22);
  }

  v23 = *(_WORD *)(a1 + 88);
  if ((v23 & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 72));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v25 = CFSTR("throttleTriggerCount");
    else
      v25 = CFSTR("throttle_trigger_count");
    objc_msgSend(v4, "setObject:forKey:", v24, v25);

    v23 = *(_WORD *)(a1 + 88);
    if ((v23 & 0x20) == 0)
    {
LABEL_50:
      if ((v23 & 4) == 0)
        goto LABEL_51;
      goto LABEL_61;
    }
  }
  else if ((v23 & 0x20) == 0)
  {
    goto LABEL_50;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 76));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v27 = CFSTR("throttleTriggerDuration");
  else
    v27 = CFSTR("throttle_trigger_duration");
  objc_msgSend(v4, "setObject:forKey:", v26, v27);

  v23 = *(_WORD *)(a1 + 88);
  if ((v23 & 4) == 0)
  {
LABEL_51:
    if ((v23 & 1) == 0)
      return v4;
    goto LABEL_65;
  }
LABEL_61:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 64));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v29 = CFSTR("throttleCount");
  else
    v29 = CFSTR("throttle_count");
  objc_msgSend(v4, "setObject:forKey:", v28, v29);

  if ((*(_WORD *)(a1 + 88) & 1) != 0)
  {
LABEL_65:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 32));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v31 = CFSTR("throttleDuration");
    else
      v31 = CFSTR("throttle_duration");
    objc_msgSend(v4, "setObject:forKey:", v30, v31);

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOLogMsgEventThrottle _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLogMsgEventThrottle)initWithDictionary:(id)a3
{
  return (GEOLogMsgEventThrottle *)-[GEOLogMsgEventThrottle _initWithDictionary:isJSON:](self, a3, 0);
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
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  id v20;
  uint64_t v21;
  const __CFString *v22;
  void *v23;
  id v24;
  uint64_t v25;
  const __CFString *v26;
  void *v27;
  void *v28;
  const __CFString *v29;
  void *v30;
  const __CFString *v31;
  void *v32;
  const __CFString *v33;
  void *v34;
  const __CFString *v35;
  void *v36;

  v5 = a2;
  if (!a1)
    goto LABEL_139;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_139;
  if (a3)
    v6 = CFSTR("networkService");
  else
    v6 = CFSTR("network_service");
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
    if ((objc_msgSend(v8, "isEqualToString:", CFSTR("NETWORK_SERVICE_UNKNOWN")) & 1) != 0)
    {
      v9 = 0;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("REVERSE_GEOCODER")) & 1) != 0)
    {
      v9 = 1;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("FORWARD_GEOCODER")) & 1) != 0)
    {
      v9 = 2;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("SEARCH")) & 1) != 0)
    {
      v9 = 3;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("DIRECTIONS")) & 1) != 0)
    {
      v9 = 4;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("TILE")) & 1) != 0)
    {
      v9 = 5;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("TRAFFIC_ETA")) & 1) != 0)
    {
      v9 = 6;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("SIMPLE_ETA")) & 1) != 0)
    {
      v9 = 7;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("SUGGESTIONS")) & 1) != 0)
    {
      v9 = 8;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("BATCH_REVGEO")) & 1) != 0)
    {
      v9 = 9;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MAP_MATCH")) & 1) != 0)
    {
      v9 = 10;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("ADDRESS_CORRECTION_INIT")) & 1) != 0)
    {
      v9 = 11;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("ADDRESS_CORRECTION_UPDATE")) & 1) != 0)
    {
      v9 = 12;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("PLACE_DATA")) & 1) != 0)
    {
      v9 = 13;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("RESOURCE_LOADER")) & 1) != 0)
    {
      v9 = 14;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("LOG_MESSAGE_USAGE")) & 1) != 0)
    {
      v9 = 16;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("LOCATION_SHIFT")) & 1) != 0)
    {
      v9 = 17;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("AB_ASSIGN")) & 1) != 0)
    {
      v9 = 18;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MANIFEST")) & 1) != 0)
    {
      v9 = 19;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("REALTIME_TRAFFIC_PROBE")) & 1) != 0)
    {
      v9 = 20;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("BATCH_TRAFFIC_PROBE")) & 1) != 0)
    {
      v9 = 21;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("SYNC")) & 1) != 0)
    {
      v9 = 22;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("WIFI_QUALITY")) & 1) != 0)
    {
      v9 = 23;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("NETWORK_DEFAULTS")) & 1) != 0)
    {
      v9 = 24;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MUNIN_RESOURCE")) & 1) != 0)
    {
      v9 = 25;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("JUNCTION_VIEW")) & 1) != 0)
    {
      v9 = 26;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("WIFI_TILE")) & 1) != 0)
    {
      v9 = 27;
    }
    else if (objc_msgSend(v8, "isEqualToString:", CFSTR("INCIDENT")))
    {
      v9 = 28;
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
      goto LABEL_68;
    v9 = objc_msgSend(v7, "intValue");
  }
  objc_msgSend(a1, "setNetworkService:", v9);
LABEL_68:

  if (a3)
    v10 = CFSTR("requestAppIdentifier");
  else
    v10 = CFSTR("request_app_identifier");
  objc_msgSend(v5, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12 = (void *)objc_msgSend(v11, "copy");
    objc_msgSend(a1, "setRequestAppIdentifier:", v12);

  }
  if (a3)
    v13 = CFSTR("manifestEnv");
  else
    v13 = CFSTR("manifest_env");
  objc_msgSend(v5, "objectForKeyedSubscript:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v15 = (void *)objc_msgSend(v14, "copy");
    objc_msgSend(a1, "setManifestEnv:", v15);

  }
  if (a3)
    v16 = CFSTR("tilesetId");
  else
    v16 = CFSTR("tileset_id");
  objc_msgSend(v5, "objectForKeyedSubscript:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setTilesetId:", objc_msgSend(v17, "unsignedIntValue"));

  if (a3)
    v18 = CFSTR("throttleType");
  else
    v18 = CFSTR("throttle_type");
  objc_msgSend(v5, "objectForKeyedSubscript:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v20 = v19;
    if ((objc_msgSend(v20, "isEqualToString:", CFSTR("UNDEFINED")) & 1) != 0)
    {
      v21 = 0;
    }
    else if ((objc_msgSend(v20, "isEqualToString:", CFSTR("ALL")) & 1) != 0)
    {
      v21 = 1;
    }
    else if (objc_msgSend(v20, "isEqualToString:", CFSTR("SPECIFIC")))
    {
      v21 = 2;
    }
    else
    {
      v21 = 0;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_98;
    v21 = objc_msgSend(v19, "intValue");
  }
  objc_msgSend(a1, "setThrottleType:", v21);
LABEL_98:

  if (a3)
    v22 = CFSTR("throttleMode");
  else
    v22 = CFSTR("throttle_mode");
  objc_msgSend(v5, "objectForKeyedSubscript:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v24 = v23;
    if ((objc_msgSend(v24, "isEqualToString:", CFSTR("UNDEFINED")) & 1) != 0)
    {
      v25 = 0;
    }
    else if ((objc_msgSend(v24, "isEqualToString:", CFSTR("SHORT_INTERVAL")) & 1) != 0)
    {
      v25 = 1;
    }
    else if (objc_msgSend(v24, "isEqualToString:", CFSTR("LONG_INTERVAL")))
    {
      v25 = 2;
    }
    else
    {
      v25 = 0;
    }

    goto LABEL_112;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v25 = objc_msgSend(v23, "intValue");
LABEL_112:
    objc_msgSend(a1, "setThrottleMode:", v25);
  }

  if (a3)
    v26 = CFSTR("throttleReqType");
  else
    v26 = CFSTR("throttle_req_type");
  objc_msgSend(v5, "objectForKeyedSubscript:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v28 = (void *)objc_msgSend(v27, "copy");
    objc_msgSend(a1, "setThrottleReqType:", v28);

  }
  if (a3)
    v29 = CFSTR("throttleTriggerCount");
  else
    v29 = CFSTR("throttle_trigger_count");
  objc_msgSend(v5, "objectForKeyedSubscript:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setThrottleTriggerCount:", objc_msgSend(v30, "unsignedIntValue"));

  if (a3)
    v31 = CFSTR("throttleTriggerDuration");
  else
    v31 = CFSTR("throttle_trigger_duration");
  objc_msgSend(v5, "objectForKeyedSubscript:", v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setThrottleTriggerDuration:", objc_msgSend(v32, "unsignedIntValue"));

  if (a3)
    v33 = CFSTR("throttleCount");
  else
    v33 = CFSTR("throttle_count");
  objc_msgSend(v5, "objectForKeyedSubscript:", v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setThrottleCount:", objc_msgSend(v34, "unsignedIntValue"));

  if (a3)
    v35 = CFSTR("throttleDuration");
  else
    v35 = CFSTR("throttle_duration");
  objc_msgSend(v5, "objectForKeyedSubscript:", v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v36, "doubleValue");
    objc_msgSend(a1, "setThrottleDuration:");
  }

LABEL_139:
  return a1;
}

- (GEOLogMsgEventThrottle)initWithJSON:(id)a3
{
  return (GEOLogMsgEventThrottle *)-[GEOLogMsgEventThrottle _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_4186;
    else
      v8 = (int *)&readAll__nonRecursiveTag_4187;
    GEOLogMsgEventThrottleReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgEventThrottleIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgEventThrottleReadAllFrom((uint64_t)self, a3, 0);
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
  if (self->_reader)
  {
    os_unfair_lock_assert_owner(&self->_readerLock);
    if ((*(_WORD *)&self->_flags & 0xF00) == 0)
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
      goto LABEL_28;
    }
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOLogMsgEventThrottle readAll:](self, "readAll:", 0);
  if ((*(_WORD *)&self->_flags & 2) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_requestAppIdentifier)
    PBDataWriterWriteStringField();
  if (self->_manifestEnv)
    PBDataWriterWriteStringField();
  flags = (__int16)self->_flags;
  if ((flags & 0x80) != 0)
  {
    PBDataWriterWriteUint32Field();
    flags = (__int16)self->_flags;
    if ((flags & 0x40) == 0)
    {
LABEL_11:
      if ((flags & 8) == 0)
        goto LABEL_13;
      goto LABEL_12;
    }
  }
  else if ((flags & 0x40) == 0)
  {
    goto LABEL_11;
  }
  PBDataWriterWriteInt32Field();
  if ((*(_WORD *)&self->_flags & 8) != 0)
LABEL_12:
    PBDataWriterWriteInt32Field();
LABEL_13:
  if (self->_throttleReqType)
    PBDataWriterWriteStringField();
  v6 = (__int16)self->_flags;
  if ((v6 & 0x10) != 0)
  {
    PBDataWriterWriteUint32Field();
    v6 = (__int16)self->_flags;
    if ((v6 & 0x20) == 0)
    {
LABEL_17:
      if ((v6 & 4) == 0)
        goto LABEL_18;
      goto LABEL_25;
    }
  }
  else if ((v6 & 0x20) == 0)
  {
    goto LABEL_17;
  }
  PBDataWriterWriteUint32Field();
  v6 = (__int16)self->_flags;
  if ((v6 & 4) == 0)
  {
LABEL_18:
    if ((v6 & 1) == 0)
      goto LABEL_28;
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteUint32Field();
  if ((*(_WORD *)&self->_flags & 1) != 0)
LABEL_26:
    PBDataWriterWriteDoubleField();
LABEL_28:

}

- (void)copyTo:(id)a3
{
  id *v4;
  __int16 flags;
  __int16 v6;
  id *v7;

  v7 = (id *)a3;
  -[GEOLogMsgEventThrottle readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v7 + 1, self->_reader);
  *((_DWORD *)v7 + 12) = self->_readerMarkPos;
  *((_DWORD *)v7 + 13) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  v4 = v7;
  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    *((_DWORD *)v7 + 15) = self->_networkService;
    *((_WORD *)v7 + 44) |= 2u;
  }
  if (self->_requestAppIdentifier)
  {
    objc_msgSend(v7, "setRequestAppIdentifier:");
    v4 = v7;
  }
  if (self->_manifestEnv)
  {
    objc_msgSend(v7, "setManifestEnv:");
    v4 = v7;
  }
  flags = (__int16)self->_flags;
  if ((flags & 0x80) != 0)
  {
    *((_DWORD *)v4 + 21) = self->_tilesetId;
    *((_WORD *)v4 + 44) |= 0x80u;
    flags = (__int16)self->_flags;
    if ((flags & 0x40) == 0)
    {
LABEL_9:
      if ((flags & 8) == 0)
        goto LABEL_11;
      goto LABEL_10;
    }
  }
  else if ((flags & 0x40) == 0)
  {
    goto LABEL_9;
  }
  *((_DWORD *)v4 + 20) = self->_throttleType;
  *((_WORD *)v4 + 44) |= 0x40u;
  if ((*(_WORD *)&self->_flags & 8) != 0)
  {
LABEL_10:
    *((_DWORD *)v4 + 17) = self->_throttleMode;
    *((_WORD *)v4 + 44) |= 8u;
  }
LABEL_11:
  if (self->_throttleReqType)
  {
    objc_msgSend(v7, "setThrottleReqType:");
    v4 = v7;
  }
  v6 = (__int16)self->_flags;
  if ((v6 & 0x10) != 0)
  {
    *((_DWORD *)v4 + 18) = self->_throttleTriggerCount;
    *((_WORD *)v4 + 44) |= 0x10u;
    v6 = (__int16)self->_flags;
    if ((v6 & 0x20) == 0)
    {
LABEL_15:
      if ((v6 & 4) == 0)
        goto LABEL_16;
LABEL_24:
      *((_DWORD *)v4 + 16) = self->_throttleCount;
      *((_WORD *)v4 + 44) |= 4u;
      if ((*(_WORD *)&self->_flags & 1) == 0)
        goto LABEL_18;
      goto LABEL_17;
    }
  }
  else if ((v6 & 0x20) == 0)
  {
    goto LABEL_15;
  }
  *((_DWORD *)v4 + 19) = self->_throttleTriggerDuration;
  *((_WORD *)v4 + 44) |= 0x20u;
  v6 = (__int16)self->_flags;
  if ((v6 & 4) != 0)
    goto LABEL_24;
LABEL_16:
  if ((v6 & 1) != 0)
  {
LABEL_17:
    v4[4] = *(id *)&self->_throttleDuration;
    *((_WORD *)v4 + 44) |= 1u;
  }
LABEL_18:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  __int16 flags;
  uint64_t v14;
  void *v15;
  __int16 v16;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
  {
LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOLogMsgEventThrottle readAll:](self, "readAll:", 0);
    if ((*(_WORD *)&self->_flags & 2) != 0)
    {
      *(_DWORD *)(v5 + 60) = self->_networkService;
      *(_WORD *)(v5 + 88) |= 2u;
    }
    v9 = -[NSString copyWithZone:](self->_requestAppIdentifier, "copyWithZone:", a3);
    v10 = *(void **)(v5 + 24);
    *(_QWORD *)(v5 + 24) = v9;

    v11 = -[NSString copyWithZone:](self->_manifestEnv, "copyWithZone:", a3);
    v12 = *(void **)(v5 + 16);
    *(_QWORD *)(v5 + 16) = v11;

    flags = (__int16)self->_flags;
    if ((flags & 0x80) != 0)
    {
      *(_DWORD *)(v5 + 84) = self->_tilesetId;
      *(_WORD *)(v5 + 88) |= 0x80u;
      flags = (__int16)self->_flags;
      if ((flags & 0x40) == 0)
      {
LABEL_9:
        if ((flags & 8) == 0)
          goto LABEL_11;
        goto LABEL_10;
      }
    }
    else if ((flags & 0x40) == 0)
    {
      goto LABEL_9;
    }
    *(_DWORD *)(v5 + 80) = self->_throttleType;
    *(_WORD *)(v5 + 88) |= 0x40u;
    if ((*(_WORD *)&self->_flags & 8) == 0)
    {
LABEL_11:
      v14 = -[NSString copyWithZone:](self->_throttleReqType, "copyWithZone:", a3);
      v15 = *(void **)(v5 + 40);
      *(_QWORD *)(v5 + 40) = v14;

      v16 = (__int16)self->_flags;
      if ((v16 & 0x10) != 0)
      {
        *(_DWORD *)(v5 + 72) = self->_throttleTriggerCount;
        *(_WORD *)(v5 + 88) |= 0x10u;
        v16 = (__int16)self->_flags;
        if ((v16 & 0x20) == 0)
        {
LABEL_13:
          if ((v16 & 4) == 0)
            goto LABEL_14;
          goto LABEL_22;
        }
      }
      else if ((v16 & 0x20) == 0)
      {
        goto LABEL_13;
      }
      *(_DWORD *)(v5 + 76) = self->_throttleTriggerDuration;
      *(_WORD *)(v5 + 88) |= 0x20u;
      v16 = (__int16)self->_flags;
      if ((v16 & 4) == 0)
      {
LABEL_14:
        if ((v16 & 1) == 0)
          return (id)v5;
LABEL_15:
        *(double *)(v5 + 32) = self->_throttleDuration;
        *(_WORD *)(v5 + 88) |= 1u;
        return (id)v5;
      }
LABEL_22:
      *(_DWORD *)(v5 + 64) = self->_throttleCount;
      *(_WORD *)(v5 + 88) |= 4u;
      if ((*(_WORD *)&self->_flags & 1) == 0)
        return (id)v5;
      goto LABEL_15;
    }
LABEL_10:
    *(_DWORD *)(v5 + 68) = self->_throttleMode;
    *(_WORD *)(v5 + 88) |= 8u;
    goto LABEL_11;
  }
  v7 = reader;
  objc_sync_enter(v7);
  if ((*(_WORD *)&self->_flags & 0x800) != 0)
  {
    objc_sync_exit(v7);

    goto LABEL_5;
  }
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  GEOLogMsgEventThrottleReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  v8 = (id)v5;
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  __int16 v5;
  NSString *requestAppIdentifier;
  NSString *manifestEnv;
  __int16 flags;
  __int16 v9;
  NSString *throttleReqType;
  BOOL v11;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_48;
  -[GEOLogMsgEventThrottle readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  v5 = *((_WORD *)v4 + 44);
  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    if ((v5 & 2) == 0 || self->_networkService != *((_DWORD *)v4 + 15))
      goto LABEL_48;
  }
  else if ((v5 & 2) != 0)
  {
    goto LABEL_48;
  }
  requestAppIdentifier = self->_requestAppIdentifier;
  if ((unint64_t)requestAppIdentifier | *((_QWORD *)v4 + 3)
    && !-[NSString isEqual:](requestAppIdentifier, "isEqual:"))
  {
    goto LABEL_48;
  }
  manifestEnv = self->_manifestEnv;
  if ((unint64_t)manifestEnv | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](manifestEnv, "isEqual:"))
      goto LABEL_48;
  }
  flags = (__int16)self->_flags;
  v9 = *((_WORD *)v4 + 44);
  if ((flags & 0x80) != 0)
  {
    if ((v9 & 0x80) == 0 || self->_tilesetId != *((_DWORD *)v4 + 21))
      goto LABEL_48;
  }
  else if ((v9 & 0x80) != 0)
  {
    goto LABEL_48;
  }
  if ((flags & 0x40) != 0)
  {
    if ((v9 & 0x40) == 0 || self->_throttleType != *((_DWORD *)v4 + 20))
      goto LABEL_48;
  }
  else if ((v9 & 0x40) != 0)
  {
    goto LABEL_48;
  }
  if ((flags & 8) != 0)
  {
    if ((v9 & 8) == 0 || self->_throttleMode != *((_DWORD *)v4 + 17))
      goto LABEL_48;
  }
  else if ((v9 & 8) != 0)
  {
    goto LABEL_48;
  }
  throttleReqType = self->_throttleReqType;
  if ((unint64_t)throttleReqType | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](throttleReqType, "isEqual:"))
    {
LABEL_48:
      v11 = 0;
      goto LABEL_49;
    }
    flags = (__int16)self->_flags;
    v9 = *((_WORD *)v4 + 44);
  }
  if ((flags & 0x10) != 0)
  {
    if ((v9 & 0x10) == 0 || self->_throttleTriggerCount != *((_DWORD *)v4 + 18))
      goto LABEL_48;
  }
  else if ((v9 & 0x10) != 0)
  {
    goto LABEL_48;
  }
  if ((flags & 0x20) != 0)
  {
    if ((v9 & 0x20) == 0 || self->_throttleTriggerDuration != *((_DWORD *)v4 + 19))
      goto LABEL_48;
  }
  else if ((v9 & 0x20) != 0)
  {
    goto LABEL_48;
  }
  if ((flags & 4) != 0)
  {
    if ((v9 & 4) == 0 || self->_throttleCount != *((_DWORD *)v4 + 16))
      goto LABEL_48;
  }
  else if ((v9 & 4) != 0)
  {
    goto LABEL_48;
  }
  v11 = (v9 & 1) == 0;
  if ((flags & 1) != 0)
  {
    if ((v9 & 1) == 0 || self->_throttleDuration != *((double *)v4 + 4))
      goto LABEL_48;
    v11 = 1;
  }
LABEL_49:

  return v11;
}

- (unint64_t)hash
{
  NSUInteger v3;
  __int16 flags;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSUInteger v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double throttleDuration;
  double v14;
  long double v15;
  double v16;
  unint64_t v17;
  NSUInteger v19;
  uint64_t v20;

  -[GEOLogMsgEventThrottle readAll:](self, "readAll:", 1);
  if ((*(_WORD *)&self->_flags & 2) != 0)
    v20 = 2654435761 * self->_networkService;
  else
    v20 = 0;
  v19 = -[NSString hash](self->_requestAppIdentifier, "hash");
  v3 = -[NSString hash](self->_manifestEnv, "hash");
  flags = (__int16)self->_flags;
  if ((flags & 0x80) == 0)
  {
    v5 = 0;
    if ((flags & 0x40) != 0)
      goto LABEL_6;
LABEL_9:
    v6 = 0;
    if ((flags & 8) != 0)
      goto LABEL_7;
    goto LABEL_10;
  }
  v5 = 2654435761 * self->_tilesetId;
  if ((flags & 0x40) == 0)
    goto LABEL_9;
LABEL_6:
  v6 = 2654435761 * self->_throttleType;
  if ((flags & 8) != 0)
  {
LABEL_7:
    v7 = 2654435761 * self->_throttleMode;
    goto LABEL_11;
  }
LABEL_10:
  v7 = 0;
LABEL_11:
  v8 = -[NSString hash](self->_throttleReqType, "hash");
  v9 = (__int16)self->_flags;
  if ((v9 & 0x10) != 0)
  {
    v10 = 2654435761 * self->_throttleTriggerCount;
    if ((v9 & 0x20) != 0)
    {
LABEL_13:
      v11 = 2654435761 * self->_throttleTriggerDuration;
      if ((v9 & 4) != 0)
        goto LABEL_14;
LABEL_21:
      v12 = 0;
      if ((v9 & 1) != 0)
        goto LABEL_15;
LABEL_22:
      v17 = 0;
      return v19 ^ v20 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v10 ^ v11 ^ v12 ^ v17;
    }
  }
  else
  {
    v10 = 0;
    if ((v9 & 0x20) != 0)
      goto LABEL_13;
  }
  v11 = 0;
  if ((v9 & 4) == 0)
    goto LABEL_21;
LABEL_14:
  v12 = 2654435761 * self->_throttleCount;
  if ((v9 & 1) == 0)
    goto LABEL_22;
LABEL_15:
  throttleDuration = self->_throttleDuration;
  v14 = -throttleDuration;
  if (throttleDuration >= 0.0)
    v14 = self->_throttleDuration;
  v15 = floor(v14 + 0.5);
  v16 = (v14 - v15) * 1.84467441e19;
  v17 = 2654435761u * (unint64_t)fmod(v15, 1.84467441e19);
  if (v16 >= 0.0)
  {
    if (v16 > 0.0)
      v17 += (unint64_t)v16;
  }
  else
  {
    v17 -= (unint64_t)fabs(v16);
  }
  return v19 ^ v20 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v10 ^ v11 ^ v12 ^ v17;
}

- (void)mergeFrom:(id)a3
{
  int *v4;
  __int16 v5;
  __int16 v6;
  int *v7;

  v7 = (int *)a3;
  objc_msgSend(v7, "readAll:", 0);
  v4 = v7;
  if ((v7[22] & 2) != 0)
  {
    self->_networkService = v7[15];
    *(_WORD *)&self->_flags |= 2u;
  }
  if (*((_QWORD *)v7 + 3))
  {
    -[GEOLogMsgEventThrottle setRequestAppIdentifier:](self, "setRequestAppIdentifier:");
    v4 = v7;
  }
  if (*((_QWORD *)v4 + 2))
  {
    -[GEOLogMsgEventThrottle setManifestEnv:](self, "setManifestEnv:");
    v4 = v7;
  }
  v5 = *((_WORD *)v4 + 44);
  if ((v5 & 0x80) != 0)
  {
    self->_tilesetId = v4[21];
    *(_WORD *)&self->_flags |= 0x80u;
    v5 = *((_WORD *)v4 + 44);
    if ((v5 & 0x40) == 0)
    {
LABEL_9:
      if ((v5 & 8) == 0)
        goto LABEL_11;
      goto LABEL_10;
    }
  }
  else if ((v5 & 0x40) == 0)
  {
    goto LABEL_9;
  }
  self->_throttleType = v4[20];
  *(_WORD *)&self->_flags |= 0x40u;
  if ((v4[22] & 8) != 0)
  {
LABEL_10:
    self->_throttleMode = v4[17];
    *(_WORD *)&self->_flags |= 8u;
  }
LABEL_11:
  if (*((_QWORD *)v4 + 5))
  {
    -[GEOLogMsgEventThrottle setThrottleReqType:](self, "setThrottleReqType:");
    v4 = v7;
  }
  v6 = *((_WORD *)v4 + 44);
  if ((v6 & 0x10) != 0)
  {
    self->_throttleTriggerCount = v4[18];
    *(_WORD *)&self->_flags |= 0x10u;
    v6 = *((_WORD *)v4 + 44);
    if ((v6 & 0x20) == 0)
    {
LABEL_15:
      if ((v6 & 4) == 0)
        goto LABEL_16;
LABEL_24:
      self->_throttleCount = v4[16];
      *(_WORD *)&self->_flags |= 4u;
      if ((v4[22] & 1) == 0)
        goto LABEL_18;
      goto LABEL_17;
    }
  }
  else if ((v6 & 0x20) == 0)
  {
    goto LABEL_15;
  }
  self->_throttleTriggerDuration = v4[19];
  *(_WORD *)&self->_flags |= 0x20u;
  v6 = *((_WORD *)v4 + 44);
  if ((v6 & 4) != 0)
    goto LABEL_24;
LABEL_16:
  if ((v6 & 1) != 0)
  {
LABEL_17:
    self->_throttleDuration = *((double *)v4 + 4);
    *(_WORD *)&self->_flags |= 1u;
  }
LABEL_18:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_throttleReqType, 0);
  objc_storeStrong((id *)&self->_requestAppIdentifier, 0);
  objc_storeStrong((id *)&self->_manifestEnv, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
