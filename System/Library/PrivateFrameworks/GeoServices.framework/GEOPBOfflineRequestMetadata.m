@implementation GEOPBOfflineRequestMetadata

- (GEOPBOfflineRequestMetadata)init
{
  GEOPBOfflineRequestMetadata *v2;
  GEOPBOfflineRequestMetadata *v3;
  GEOPBOfflineRequestMetadata *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPBOfflineRequestMetadata;
  v2 = -[GEOPBOfflineRequestMetadata init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPBOfflineRequestMetadata)initWithData:(id)a3
{
  GEOPBOfflineRequestMetadata *v3;
  GEOPBOfflineRequestMetadata *v4;
  GEOPBOfflineRequestMetadata *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPBOfflineRequestMetadata;
  v3 = -[GEOPBOfflineRequestMetadata initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (int)messageType
{
  os_unfair_lock_s *p_readerLock;
  char flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 2) != 0)
    return self->_messageType;
  else
    return 0;
}

- (void)setMessageType:(int)a3
{
  *(_BYTE *)&self->_flags |= 0x42u;
  self->_messageType = a3;
}

- (void)setHasMessageType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 66;
  else
    v3 = 64;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasMessageType
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (id)messageTypeAsString:(int)a3
{
  if (a3 < 6)
    return off_1E1C20668[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsMessageType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PLACE_REQUEST")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DIRECTIONS_REQUEST")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ETA_REQUEST")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ETA_TRAFFIC_UPDATE_REQUEST")) & 1) != 0)
  {
    v4 = 4;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("TRANSIT_ROUTE_UPDATE_REQUEST")))
  {
    v4 = 5;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (unint64_t)requestStartTimeMs
{
  return self->_requestStartTimeMs;
}

- (void)setRequestStartTimeMs:(unint64_t)a3
{
  *(_BYTE *)&self->_flags |= 0x41u;
  self->_requestStartTimeMs = a3;
}

- (void)setHasRequestStartTimeMs:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3 | 0x40;
}

- (BOOL)hasRequestStartTimeMs
{
  return *(_BYTE *)&self->_flags & 1;
}

- (BOOL)debugLog
{
  os_unfair_lock_s *p_readerLock;
  char flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  return (flags & 4) != 0 && self->_debugLog;
}

- (void)setDebugLog:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 0x44u;
  self->_debugLog = a3;
}

- (void)setHasDebugLog:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 68;
  else
    v3 = 64;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasDebugLog
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (void)_readRequestIdentifier
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(_BYTE *)(a1 + 60) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPBOfflineRequestMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRequestIdentifier_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasRequestIdentifier
{
  -[GEOPBOfflineRequestMetadata _readRequestIdentifier]((uint64_t)self);
  return self->_requestIdentifier != 0;
}

- (NSString)requestIdentifier
{
  -[GEOPBOfflineRequestMetadata _readRequestIdentifier]((uint64_t)self);
  return self->_requestIdentifier;
}

- (void)setRequestIdentifier:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x60u;
  objc_storeStrong((id *)&self->_requestIdentifier, a3);
}

- (BOOL)performanceMetrics
{
  os_unfair_lock_s *p_readerLock;
  char flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  return (flags & 8) != 0 && self->_performanceMetrics;
}

- (void)setPerformanceMetrics:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 0x48u;
  self->_performanceMetrics = a3;
}

- (void)setHasPerformanceMetrics:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 72;
  else
    v3 = 64;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xF7 | v3;
}

- (BOOL)hasPerformanceMetrics
{
  return (*(_BYTE *)&self->_flags >> 3) & 1;
}

- (void)_readDownloadedRegions
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(_BYTE *)(a1 + 60) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPBOfflineRequestMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDownloadedRegions_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (NSMutableArray)downloadedRegions
{
  -[GEOPBOfflineRequestMetadata _readDownloadedRegions]((uint64_t)self);
  return self->_downloadedRegions;
}

- (void)setDownloadedRegions:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *downloadedRegions;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x40u;
  downloadedRegions = self->_downloadedRegions;
  self->_downloadedRegions = v4;

}

- (void)clearDownloadedRegions
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x40u;
  -[NSMutableArray removeAllObjects](self->_downloadedRegions, "removeAllObjects");
}

- (void)addDownloadedRegions:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOPBOfflineRequestMetadata _readDownloadedRegions]((uint64_t)self);
  -[GEOPBOfflineRequestMetadata _addNoFlagsDownloadedRegions:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x40u;
}

- (void)_addNoFlagsDownloadedRegions:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 16);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 16);
      *(_QWORD *)(a1 + 16) = v5;

      v4 = *(void **)(a1 + 16);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)downloadedRegionsCount
{
  -[GEOPBOfflineRequestMetadata _readDownloadedRegions]((uint64_t)self);
  return -[NSMutableArray count](self->_downloadedRegions, "count");
}

- (id)downloadedRegionsAtIndex:(unint64_t)a3
{
  -[GEOPBOfflineRequestMetadata _readDownloadedRegions]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_downloadedRegions, "objectAtIndex:", a3);
}

+ (Class)downloadedRegionsType
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
  v8.super_class = (Class)GEOPBOfflineRequestMetadata;
  -[GEOPBOfflineRequestMetadata description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPBOfflineRequestMetadata dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPBOfflineRequestMetadata _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  char v5;
  uint64_t v6;
  __CFString *v7;
  const __CFString *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  const __CFString *v14;
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
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_BYTE *)(a1 + 60);
  if ((v5 & 2) != 0)
  {
    v6 = *(int *)(a1 + 52);
    if (v6 >= 6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 52));
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_1E1C20668[v6];
    }
    if (a2)
      v8 = CFSTR("messageType");
    else
      v8 = CFSTR("message_type");
    objc_msgSend(v4, "setObject:forKey:", v7, v8);

    v5 = *(_BYTE *)(a1 + 60);
  }
  if ((v5 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 32));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v10 = CFSTR("requestStartTimeMs");
    else
      v10 = CFSTR("request_start_time_ms");
    objc_msgSend(v4, "setObject:forKey:", v9, v10);

    v5 = *(_BYTE *)(a1 + 60);
  }
  if ((v5 & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 56));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v12 = CFSTR("debugLog");
    else
      v12 = CFSTR("debug_log");
    objc_msgSend(v4, "setObject:forKey:", v11, v12);

  }
  objc_msgSend((id)a1, "requestIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    if (a2)
      v14 = CFSTR("requestIdentifier");
    else
      v14 = CFSTR("request_identifier");
    objc_msgSend(v4, "setObject:forKey:", v13, v14);
  }

  if ((*(_BYTE *)(a1 + 60) & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 57));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v16 = CFSTR("performanceMetrics");
    else
      v16 = CFSTR("performance_metrics");
    objc_msgSend(v4, "setObject:forKey:", v15, v16);

  }
  if (objc_msgSend(*(id *)(a1 + 16), "count"))
  {
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 16), "count"));
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v18 = *(id *)(a1 + 16);
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
            objc_msgSend(v23, "dictionaryRepresentation");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "addObject:", v24);

        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      }
      while (v20);
    }

    if (a2)
      v25 = CFSTR("downloadedRegions");
    else
      v25 = CFSTR("downloaded_regions");
    objc_msgSend(v4, "setObject:forKey:", v17, v25);

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPBOfflineRequestMetadata _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOPBOfflineRequestMetadata)initWithDictionary:(id)a3
{
  return (GEOPBOfflineRequestMetadata *)-[GEOPBOfflineRequestMetadata _initWithDictionary:isJSON:](self, a3, 0);
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
  const __CFString *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  uint64_t v26;
  GEOMapRegion *v27;
  uint64_t v28;
  void *v29;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (!a1)
    goto LABEL_62;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_62;
  if (a3)
    v6 = CFSTR("messageType");
  else
    v6 = CFSTR("message_type");
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
    if ((objc_msgSend(v8, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
    {
      v9 = 0;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("PLACE_REQUEST")) & 1) != 0)
    {
      v9 = 1;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("DIRECTIONS_REQUEST")) & 1) != 0)
    {
      v9 = 2;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("ETA_REQUEST")) & 1) != 0)
    {
      v9 = 3;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("ETA_TRAFFIC_UPDATE_REQUEST")) & 1) != 0)
    {
      v9 = 4;
    }
    else if (objc_msgSend(v8, "isEqualToString:", CFSTR("TRANSIT_ROUTE_UPDATE_REQUEST")))
    {
      v9 = 5;
    }
    else
    {
      v9 = 0;
    }

    goto LABEL_23;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = objc_msgSend(v7, "intValue");
LABEL_23:
    objc_msgSend(a1, "setMessageType:", v9);
  }

  if (a3)
    v10 = CFSTR("requestStartTimeMs");
  else
    v10 = CFSTR("request_start_time_ms");
  objc_msgSend(v5, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setRequestStartTimeMs:", objc_msgSend(v11, "unsignedLongLongValue"));

  if (a3)
    v12 = CFSTR("debugLog");
  else
    v12 = CFSTR("debug_log");
  objc_msgSend(v5, "objectForKeyedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setDebugLog:", objc_msgSend(v13, "BOOLValue"));

  if (a3)
    v14 = CFSTR("requestIdentifier");
  else
    v14 = CFSTR("request_identifier");
  objc_msgSend(v5, "objectForKeyedSubscript:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v16 = (void *)objc_msgSend(v15, "copy");
    objc_msgSend(a1, "setRequestIdentifier:", v16);

  }
  if (a3)
    v17 = CFSTR("performanceMetrics");
  else
    v17 = CFSTR("performance_metrics");
  objc_msgSend(v5, "objectForKeyedSubscript:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setPerformanceMetrics:", objc_msgSend(v18, "BOOLValue"));

  if (a3)
    v19 = CFSTR("downloadedRegions");
  else
    v19 = CFSTR("downloaded_regions");
  objc_msgSend(v5, "objectForKeyedSubscript:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v31 = v5;
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v21 = v20;
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v33 != v24)
            objc_enumerationMutation(v21);
          v26 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v27 = [GEOMapRegion alloc];
            if ((a3 & 1) != 0)
              v28 = -[GEOMapRegion initWithJSON:](v27, "initWithJSON:", v26);
            else
              v28 = -[GEOMapRegion initWithDictionary:](v27, "initWithDictionary:", v26);
            v29 = (void *)v28;
            objc_msgSend(a1, "addDownloadedRegions:", v28);

          }
        }
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      }
      while (v23);
    }

    v5 = v31;
  }

LABEL_62:
  return a1;
}

- (GEOPBOfflineRequestMetadata)initWithJSON:(id)a3
{
  return (GEOPBOfflineRequestMetadata *)-[GEOPBOfflineRequestMetadata _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_92_0;
    else
      v8 = (int *)&readAll__nonRecursiveTag_93_0;
    GEOPBOfflineRequestMetadataReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEOPBOfflineRequestMetadataCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPBOfflineRequestMetadataIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPBOfflineRequestMetadataReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  char flags;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  PBDataReader *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader)
  {
    os_unfair_lock_assert_owner(&self->_readerLock);
    if ((*(_BYTE *)&self->_flags & 0x70) == 0)
    {
      v11 = self->_reader;
      objc_sync_enter(v11);
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "writeData:", v12);
      os_unfair_lock_unlock(p_readerLock);

      objc_sync_exit(v11);
      goto LABEL_23;
    }
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPBOfflineRequestMetadata readAll:](self, "readAll:", 0);
  flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
    if ((*(_BYTE *)&self->_flags & 1) == 0)
      goto LABEL_5;
LABEL_20:
    PBDataWriterWriteUint64Field();
    if ((*(_BYTE *)&self->_flags & 4) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
  PBDataWriterWriteInt32Field();
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
    goto LABEL_20;
LABEL_5:
  if ((flags & 4) != 0)
LABEL_6:
    PBDataWriterWriteBOOLField();
LABEL_7:
  if (self->_requestIdentifier)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_flags & 8) != 0)
    PBDataWriterWriteBOOLField();
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = self->_downloadedRegions;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v7);
        PBDataWriterWriteSubmessage();
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

LABEL_23:
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  BOOL v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  -[GEOPBOfflineRequestMetadata _readDownloadedRegions]((uint64_t)self);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_downloadedRegions;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "hasGreenTeaWithValue:", v3, (_QWORD)v12) & 1) != 0)
        {
          v10 = 1;
          goto LABEL_11;
        }
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v7)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (void)copyTo:(id)a3
{
  id *v4;
  char flags;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  void *v9;
  id *v10;

  v10 = (id *)a3;
  -[GEOPBOfflineRequestMetadata readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v10 + 1, self->_reader);
  *((_DWORD *)v10 + 10) = self->_readerMarkPos;
  *((_DWORD *)v10 + 11) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  v4 = v10;
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *((_DWORD *)v10 + 13) = self->_messageType;
    *((_BYTE *)v10 + 60) |= 2u;
    flags = (char)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_3:
      if ((flags & 4) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 1) == 0)
  {
    goto LABEL_3;
  }
  v10[4] = (id)self->_requestStartTimeMs;
  *((_BYTE *)v10 + 60) |= 1u;
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
LABEL_4:
    *((_BYTE *)v10 + 56) = self->_debugLog;
    *((_BYTE *)v10 + 60) |= 4u;
  }
LABEL_5:
  if (self->_requestIdentifier)
  {
    objc_msgSend(v10, "setRequestIdentifier:");
    v4 = v10;
  }
  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
    *((_BYTE *)v4 + 57) = self->_performanceMetrics;
    *((_BYTE *)v4 + 60) |= 8u;
  }
  if (-[GEOPBOfflineRequestMetadata downloadedRegionsCount](self, "downloadedRegionsCount"))
  {
    objc_msgSend(v10, "clearDownloadedRegions");
    v6 = -[GEOPBOfflineRequestMetadata downloadedRegionsCount](self, "downloadedRegionsCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
      {
        -[GEOPBOfflineRequestMetadata downloadedRegionsAtIndex:](self, "downloadedRegionsAtIndex:", i);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addDownloadedRegions:", v9);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  NSMutableArray *v8;
  char flags;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_BYTE *)&self->_flags & 0x40) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOPBOfflineRequestMetadataReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (NSMutableArray *)(id)v5;
      objc_sync_exit(v7);

      goto LABEL_18;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPBOfflineRequestMetadata readAll:](self, "readAll:", 0);
  flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
    if ((*(_BYTE *)&self->_flags & 1) == 0)
      goto LABEL_7;
LABEL_20:
    *(_QWORD *)(v5 + 32) = self->_requestStartTimeMs;
    *(_BYTE *)(v5 + 60) |= 1u;
    if ((*(_BYTE *)&self->_flags & 4) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
  *(_DWORD *)(v5 + 52) = self->_messageType;
  *(_BYTE *)(v5 + 60) |= 2u;
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
    goto LABEL_20;
LABEL_7:
  if ((flags & 4) != 0)
  {
LABEL_8:
    *(_BYTE *)(v5 + 56) = self->_debugLog;
    *(_BYTE *)(v5 + 60) |= 4u;
  }
LABEL_9:
  v10 = -[NSString copyWithZone:](self->_requestIdentifier, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v10;

  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
    *(_BYTE *)(v5 + 57) = self->_performanceMetrics;
    *(_BYTE *)(v5 + 60) |= 8u;
  }
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = self->_downloadedRegions;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v8);
        v15 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v17);
        objc_msgSend((id)v5, "addDownloadedRegions:", v15);

      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v12);
  }
LABEL_18:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char flags;
  char v6;
  NSString *requestIdentifier;
  char v8;
  NSMutableArray *downloadedRegions;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_27;
  -[GEOPBOfflineRequestMetadata readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  flags = (char)self->_flags;
  v6 = *((_BYTE *)v4 + 60);
  if ((flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 2) == 0 || self->_messageType != *((_DWORD *)v4 + 13))
      goto LABEL_27;
  }
  else if ((*((_BYTE *)v4 + 60) & 2) != 0)
  {
    goto LABEL_27;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 1) == 0 || self->_requestStartTimeMs != *((_QWORD *)v4 + 4))
      goto LABEL_27;
  }
  else if ((*((_BYTE *)v4 + 60) & 1) != 0)
  {
    goto LABEL_27;
  }
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 4) == 0)
      goto LABEL_27;
    if (self->_debugLog)
    {
      if (!*((_BYTE *)v4 + 56))
        goto LABEL_27;
    }
    else if (*((_BYTE *)v4 + 56))
    {
      goto LABEL_27;
    }
  }
  else if ((*((_BYTE *)v4 + 60) & 4) != 0)
  {
    goto LABEL_27;
  }
  requestIdentifier = self->_requestIdentifier;
  if ((unint64_t)requestIdentifier | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](requestIdentifier, "isEqual:"))
      goto LABEL_27;
    flags = (char)self->_flags;
    v6 = *((_BYTE *)v4 + 60);
  }
  if ((flags & 8) == 0)
  {
    if ((v6 & 8) == 0)
      goto LABEL_33;
LABEL_27:
    v8 = 0;
    goto LABEL_28;
  }
  if ((v6 & 8) == 0)
    goto LABEL_27;
  if (!self->_performanceMetrics)
  {
    if (!*((_BYTE *)v4 + 57))
      goto LABEL_33;
    goto LABEL_27;
  }
  if (!*((_BYTE *)v4 + 57))
    goto LABEL_27;
LABEL_33:
  downloadedRegions = self->_downloadedRegions;
  if ((unint64_t)downloadedRegions | *((_QWORD *)v4 + 2))
    v8 = -[NSMutableArray isEqual:](downloadedRegions, "isEqual:");
  else
    v8 = 1;
LABEL_28:

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  NSUInteger v6;
  uint64_t v7;

  -[GEOPBOfflineRequestMetadata readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 2) == 0)
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      goto LABEL_3;
LABEL_6:
    v4 = 0;
    if ((*(_BYTE *)&self->_flags & 4) != 0)
      goto LABEL_4;
    goto LABEL_7;
  }
  v3 = 2654435761 * self->_messageType;
  if ((*(_BYTE *)&self->_flags & 1) == 0)
    goto LABEL_6;
LABEL_3:
  v4 = 2654435761u * self->_requestStartTimeMs;
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
LABEL_4:
    v5 = 2654435761 * self->_debugLog;
    goto LABEL_8;
  }
LABEL_7:
  v5 = 0;
LABEL_8:
  v6 = -[NSString hash](self->_requestIdentifier, "hash");
  if ((*(_BYTE *)&self->_flags & 8) != 0)
    v7 = 2654435761 * self->_performanceMetrics;
  else
    v7 = 0;
  return v4 ^ v3 ^ v5 ^ v7 ^ v6 ^ -[NSMutableArray hash](self->_downloadedRegions, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  v5 = *((_BYTE *)v4 + 60);
  if ((v5 & 2) != 0)
  {
    self->_messageType = *((_DWORD *)v4 + 13);
    *(_BYTE *)&self->_flags |= 2u;
    v5 = *((_BYTE *)v4 + 60);
    if ((v5 & 1) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*((_BYTE *)v4 + 60) & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_requestStartTimeMs = *((_QWORD *)v4 + 4);
  *(_BYTE *)&self->_flags |= 1u;
  if ((*((_BYTE *)v4 + 60) & 4) != 0)
  {
LABEL_4:
    self->_debugLog = *((_BYTE *)v4 + 56);
    *(_BYTE *)&self->_flags |= 4u;
  }
LABEL_5:
  if (*((_QWORD *)v4 + 3))
    -[GEOPBOfflineRequestMetadata setRequestIdentifier:](self, "setRequestIdentifier:");
  if ((*((_BYTE *)v4 + 60) & 8) != 0)
  {
    self->_performanceMetrics = *((_BYTE *)v4 + 57);
    *(_BYTE *)&self->_flags |= 8u;
  }
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = *((id *)v4 + 2);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        -[GEOPBOfflineRequestMetadata addDownloadedRegions:](self, "addDownloadedRegions:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i), (_QWORD)v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestIdentifier, 0);
  objc_storeStrong((id *)&self->_downloadedRegions, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
