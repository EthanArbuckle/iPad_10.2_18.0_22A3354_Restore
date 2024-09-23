@implementation GEONetworkEventData

- (void)setTilesetId:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x80040u;
  self->_tilesetId = a3;
}

- (void)setRequestingAppMinorVer:(id)a3
{
  *(_DWORD *)&self->_flags |= 0xC0000u;
  objc_storeStrong((id *)&self->_requestingAppMinorVer, a3);
}

- (void)setRequestingAppMajorVer:(id)a3
{
  *(_DWORD *)&self->_flags |= 0xA0000u;
  objc_storeStrong((id *)&self->_requestingAppMajorVer, a3);
}

- (void)setRequestingAppIdentifier:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x90000u;
  objc_storeStrong((id *)&self->_requestingAppIdentifier, a3);
}

- (void)setNetworkService:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x80020u;
  self->_networkService = a3;
}

- (void)setManifestEnvironment:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x88000u;
  objc_storeStrong((id *)&self->_manifestEnvironment, a3);
}

- (void)setLocale:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x84000u;
  objc_storeStrong((id *)&self->_locale, a3);
}

- (void)setEventTimestamp:(double)a3
{
  *(_DWORD *)&self->_flags |= 0x80002u;
  self->_eventTimestamp = a3;
}

- (void)setDatasetId:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x80010u;
  self->_datasetId = a3;
}

- (void)setDataRequestKindType:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x80008u;
  self->_dataRequestKindType = a3;
}

- (void)setDataRequestKindSubtype:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x80004u;
  self->_dataRequestKindSubtype = a3;
}

- (void)setCountryCode:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x81000u;
  objc_storeStrong((id *)&self->_countryCode, a3);
}

- (void)setClientMetrics:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x80800u;
  objc_storeStrong((id *)&self->_clientMetrics, a3);
}

- (void)setAppIdentifier:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x80400u;
  objc_storeStrong((id *)&self->_appIdentifier, a3);
}

- (GEONetworkEventData)init
{
  GEONetworkEventData *v2;
  GEONetworkEventData *v3;
  GEONetworkEventData *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEONetworkEventData;
  v2 = -[GEONetworkEventData init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (void)addAdditionalStates:(id)a3
{
  id v4;

  v4 = a3;
  -[GEONetworkEventData _readAdditionalStates]((uint64_t)self);
  -[GEONetworkEventData _addNoFlagsAdditionalStates:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x200u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x80000u;
}

- (void)_readAdditionalStates
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_BYTE *)(a1 + 157) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEONetworkEventDataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAdditionalStates_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (void)_addNoFlagsAdditionalStates:(uint64_t)a1
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestingAppMinorVer, 0);
  objc_storeStrong((id *)&self->_requestingAppMajorVer, 0);
  objc_storeStrong((id *)&self->_requestingAppIdentifier, 0);
  objc_storeStrong((id *)&self->_manifestEnvironment, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_errorDomain, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_clientMetrics, 0);
  objc_storeStrong((id *)&self->_appIdentifier, 0);
  objc_storeStrong((id *)&self->_additionalStates, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  $3296299F16D566F38FA83A9082AA5EFC flags;
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
    if ((*(_DWORD *)&self->_flags & 0xFFE00) == 0)
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
      goto LABEL_47;
    }
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEONetworkEventData readAll:](self, "readAll:", 0);
  if (self->_clientMetrics)
    PBDataWriterWriteSubmessage();
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 8) != 0)
  {
    PBDataWriterWriteInt32Field();
    flags = self->_flags;
    if ((*(_BYTE *)&flags & 4) == 0)
    {
LABEL_7:
      if ((*(_BYTE *)&flags & 0x20) == 0)
        goto LABEL_8;
LABEL_44:
      PBDataWriterWriteInt32Field();
      if ((*(_DWORD *)&self->_flags & 0x80) == 0)
        goto LABEL_10;
      goto LABEL_9;
    }
  }
  else if ((*(_BYTE *)&flags & 4) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteInt32Field();
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 0x20) != 0)
    goto LABEL_44;
LABEL_8:
  if ((*(_BYTE *)&flags & 0x80) != 0)
LABEL_9:
    PBDataWriterWriteBOOLField();
LABEL_10:
  if (self->_requestingAppIdentifier)
    PBDataWriterWriteStringField();
  if (self->_requestingAppMajorVer)
    PBDataWriterWriteStringField();
  if (self->_requestingAppMinorVer)
    PBDataWriterWriteStringField();
  if (self->_errorDomain)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    PBDataWriterWriteInt64Field();
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = self->_additionalStates;
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

  if ((*(_BYTE *)&self->_flags & 2) != 0)
    PBDataWriterWriteDoubleField();
  if (self->_countryCode)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_flags & 0x40) != 0)
    PBDataWriterWriteUint32Field();
  if (self->_locale)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_flags & 0x10) != 0)
    PBDataWriterWriteUint32Field();
  if (self->_manifestEnvironment)
    PBDataWriterWriteStringField();
  if (self->_appIdentifier)
    PBDataWriterWriteStringField();
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v13);
LABEL_47:

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
      v8 = (int *)&readAll__recursiveTag_2465;
    else
      v8 = (int *)&readAll__nonRecursiveTag_2466;
    GEONetworkEventDataReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEONetworkEventDataCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  os_unfair_lock_unlock(p_readerLock);
}

- (GEONetworkEventData)initWithData:(id)a3
{
  GEONetworkEventData *v3;
  GEONetworkEventData *v4;
  GEONetworkEventData *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEONetworkEventData;
  v3 = -[GEONetworkEventData initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readClientMetrics
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_BYTE *)(a1 + 157) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEONetworkEventDataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readClientMetrics_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (BOOL)hasClientMetrics
{
  -[GEONetworkEventData _readClientMetrics]((uint64_t)self);
  return self->_clientMetrics != 0;
}

- (GEOClientMetrics)clientMetrics
{
  -[GEONetworkEventData _readClientMetrics]((uint64_t)self);
  return self->_clientMetrics;
}

- (int)dataRequestKindType
{
  return self->_dataRequestKindType;
}

- (void)setHasDataRequestKindType:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 524296;
  else
    v3 = 0x80000;
  self->_flags = ($3296299F16D566F38FA83A9082AA5EFC)(*(_DWORD *)&self->_flags & 0xFFF7FFF7 | v3);
}

- (BOOL)hasDataRequestKindType
{
  return (*(_BYTE *)&self->_flags >> 3) & 1;
}

- (int)dataRequestKindSubtype
{
  return self->_dataRequestKindSubtype;
}

- (void)setHasDataRequestKindSubtype:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 524292;
  else
    v3 = 0x80000;
  self->_flags = ($3296299F16D566F38FA83A9082AA5EFC)(*(_DWORD *)&self->_flags & 0xFFFFFFFB | v3);
}

- (BOOL)hasDataRequestKindSubtype
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (int)networkService
{
  os_unfair_lock_s *p_readerLock;
  $3296299F16D566F38FA83A9082AA5EFC flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_BYTE *)&flags & 0x20) != 0)
    return self->_networkService;
  else
    return 0;
}

- (void)setHasNetworkService:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 524320;
  else
    v3 = 0x80000;
  self->_flags = ($3296299F16D566F38FA83A9082AA5EFC)(*(_DWORD *)&self->_flags & 0xFFFFFFDF | v3);
}

- (BOOL)hasNetworkService
{
  return (*(_BYTE *)&self->_flags >> 5) & 1;
}

- (id)networkServiceAsString:(int)a3
{
  __CFString *v3;

  if (a3 < 0x1D && ((0x1FFF7FFFu >> a3) & 1) != 0)
  {
    v3 = off_1E1C0FDD0[a3];
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

- (BOOL)usedBackgroundUrl
{
  return self->_usedBackgroundUrl;
}

- (void)setUsedBackgroundUrl:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x80080u;
  self->_usedBackgroundUrl = a3;
}

- (void)setHasUsedBackgroundUrl:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 524416;
  else
    v3 = 0x80000;
  self->_flags = ($3296299F16D566F38FA83A9082AA5EFC)(*(_DWORD *)&self->_flags & 0xFFFFFF7F | v3);
}

- (BOOL)hasUsedBackgroundUrl
{
  return *(_BYTE *)&self->_flags >> 7;
}

- (void)_readRequestingAppIdentifier
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_BYTE *)(a1 + 158) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEONetworkEventDataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRequestingAppIdentifier_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (BOOL)hasRequestingAppIdentifier
{
  -[GEONetworkEventData _readRequestingAppIdentifier]((uint64_t)self);
  return self->_requestingAppIdentifier != 0;
}

- (NSString)requestingAppIdentifier
{
  -[GEONetworkEventData _readRequestingAppIdentifier]((uint64_t)self);
  return self->_requestingAppIdentifier;
}

- (void)_readRequestingAppMajorVer
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_BYTE *)(a1 + 158) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEONetworkEventDataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRequestingAppMajorVer_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (BOOL)hasRequestingAppMajorVer
{
  -[GEONetworkEventData _readRequestingAppMajorVer]((uint64_t)self);
  return self->_requestingAppMajorVer != 0;
}

- (NSString)requestingAppMajorVer
{
  -[GEONetworkEventData _readRequestingAppMajorVer]((uint64_t)self);
  return self->_requestingAppMajorVer;
}

- (void)_readRequestingAppMinorVer
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_BYTE *)(a1 + 158) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEONetworkEventDataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRequestingAppMinorVer_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (BOOL)hasRequestingAppMinorVer
{
  -[GEONetworkEventData _readRequestingAppMinorVer]((uint64_t)self);
  return self->_requestingAppMinorVer != 0;
}

- (NSString)requestingAppMinorVer
{
  -[GEONetworkEventData _readRequestingAppMinorVer]((uint64_t)self);
  return self->_requestingAppMinorVer;
}

- (void)_readErrorDomain
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_BYTE *)(a1 + 157) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEONetworkEventDataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readErrorDomain_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (BOOL)hasErrorDomain
{
  -[GEONetworkEventData _readErrorDomain]((uint64_t)self);
  return self->_errorDomain != 0;
}

- (NSString)errorDomain
{
  -[GEONetworkEventData _readErrorDomain]((uint64_t)self);
  return self->_errorDomain;
}

- (void)setErrorDomain:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x82000u;
  objc_storeStrong((id *)&self->_errorDomain, a3);
}

- (int64_t)errorCode
{
  return self->_errorCode;
}

- (void)setErrorCode:(int64_t)a3
{
  *(_DWORD *)&self->_flags |= 0x80001u;
  self->_errorCode = a3;
}

- (void)setHasErrorCode:(BOOL)a3
{
  self->_flags = ($3296299F16D566F38FA83A9082AA5EFC)(*(_DWORD *)&self->_flags & 0xFFFFFFFE | a3 | 0x80000);
}

- (BOOL)hasErrorCode
{
  return *(_DWORD *)&self->_flags & 1;
}

- (NSMutableArray)additionalStates
{
  -[GEONetworkEventData _readAdditionalStates]((uint64_t)self);
  return self->_additionalStates;
}

- (void)setAdditionalStates:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *additionalStates;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x200u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x80000u;
  additionalStates = self->_additionalStates;
  self->_additionalStates = v4;

}

- (void)clearAdditionalStates
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x200u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x80000u;
  -[NSMutableArray removeAllObjects](self->_additionalStates, "removeAllObjects");
}

- (unint64_t)additionalStatesCount
{
  -[GEONetworkEventData _readAdditionalStates]((uint64_t)self);
  return -[NSMutableArray count](self->_additionalStates, "count");
}

- (id)additionalStatesAtIndex:(unint64_t)a3
{
  -[GEONetworkEventData _readAdditionalStates]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_additionalStates, "objectAtIndex:", a3);
}

+ (Class)additionalStatesType
{
  return (Class)objc_opt_class();
}

- (double)eventTimestamp
{
  return self->_eventTimestamp;
}

- (void)setHasEventTimestamp:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 524290;
  else
    v3 = 0x80000;
  self->_flags = ($3296299F16D566F38FA83A9082AA5EFC)(*(_DWORD *)&self->_flags & 0xFFFFFFFD | v3);
}

- (BOOL)hasEventTimestamp
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (void)_readCountryCode
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_BYTE *)(a1 + 157) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEONetworkEventDataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCountryCode_tags_2398);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (BOOL)hasCountryCode
{
  -[GEONetworkEventData _readCountryCode]((uint64_t)self);
  return self->_countryCode != 0;
}

- (NSString)countryCode
{
  -[GEONetworkEventData _readCountryCode]((uint64_t)self);
  return self->_countryCode;
}

- (unsigned)tilesetId
{
  return self->_tilesetId;
}

- (void)setHasTilesetId:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 524352;
  else
    v3 = 0x80000;
  self->_flags = ($3296299F16D566F38FA83A9082AA5EFC)(*(_DWORD *)&self->_flags & 0xFFFFFFBF | v3);
}

- (BOOL)hasTilesetId
{
  return (*(_BYTE *)&self->_flags >> 6) & 1;
}

- (void)_readLocale
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_BYTE *)(a1 + 157) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEONetworkEventDataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLocale_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (BOOL)hasLocale
{
  -[GEONetworkEventData _readLocale]((uint64_t)self);
  return self->_locale != 0;
}

- (NSString)locale
{
  -[GEONetworkEventData _readLocale]((uint64_t)self);
  return self->_locale;
}

- (unsigned)datasetId
{
  return self->_datasetId;
}

- (void)setHasDatasetId:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 524304;
  else
    v3 = 0x80000;
  self->_flags = ($3296299F16D566F38FA83A9082AA5EFC)(*(_DWORD *)&self->_flags & 0xFFFFFFEF | v3);
}

- (BOOL)hasDatasetId
{
  return (*(_BYTE *)&self->_flags >> 4) & 1;
}

- (void)_readManifestEnvironment
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_BYTE *)(a1 + 157) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEONetworkEventDataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readManifestEnvironment_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (BOOL)hasManifestEnvironment
{
  -[GEONetworkEventData _readManifestEnvironment]((uint64_t)self);
  return self->_manifestEnvironment != 0;
}

- (NSString)manifestEnvironment
{
  -[GEONetworkEventData _readManifestEnvironment]((uint64_t)self);
  return self->_manifestEnvironment;
}

- (void)_readAppIdentifier
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_BYTE *)(a1 + 157) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEONetworkEventDataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAppIdentifier_tags_2399);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (BOOL)hasAppIdentifier
{
  -[GEONetworkEventData _readAppIdentifier]((uint64_t)self);
  return self->_appIdentifier != 0;
}

- (NSString)appIdentifier
{
  -[GEONetworkEventData _readAppIdentifier]((uint64_t)self);
  return self->_appIdentifier;
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
  v8.super_class = (Class)GEONetworkEventData;
  -[GEONetworkEventData description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEONetworkEventData dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEONetworkEventData _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  int v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  void *v29;
  const __CFString *v30;
  void *v31;
  const __CFString *v32;
  void *v33;
  const __CFString *v34;
  void *v35;
  const __CFString *v36;
  void *v37;
  void *v38;
  const __CFString *v39;
  void *v40;
  const __CFString *v41;
  void *v42;
  const __CFString *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  id v49;
  void *v51;
  const __CFString *v52;
  void *v53;
  const __CFString *v54;
  uint64_t v55;
  __CFString *v56;
  const __CFString *v57;
  _QWORD v58[4];
  id v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)a1, "clientMetrics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v5, "jsonRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = CFSTR("clientMetrics");
    }
    else
    {
      objc_msgSend(v5, "dictionaryRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = CFSTR("client_metrics");
    }
    objc_msgSend(v4, "setObject:forKey:", v7, v8);

  }
  v9 = *(_DWORD *)(a1 + 156);
  if ((v9 & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 136));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v52 = CFSTR("dataRequestKindType");
    else
      v52 = CFSTR("data_request_kind_type");
    objc_msgSend(v4, "setObject:forKey:", v51, v52);

    v9 = *(_DWORD *)(a1 + 156);
    if ((v9 & 4) == 0)
    {
LABEL_9:
      if ((v9 & 0x20) == 0)
        goto LABEL_10;
LABEL_100:
      v55 = *(int *)(a1 + 144);
      if (v55 < 0x1D && ((0x1FFF7FFFu >> v55) & 1) != 0)
      {
        v56 = off_1E1C0FDD0[v55];
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 144));
        v56 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      if (a2)
        v57 = CFSTR("networkService");
      else
        v57 = CFSTR("network_service");
      objc_msgSend(v4, "setObject:forKey:", v56, v57);

      if ((*(_DWORD *)(a1 + 156) & 0x80) == 0)
        goto LABEL_15;
      goto LABEL_11;
    }
  }
  else if ((v9 & 4) == 0)
  {
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 132));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v54 = CFSTR("dataRequestKindSubtype");
  else
    v54 = CFSTR("data_request_kind_subtype");
  objc_msgSend(v4, "setObject:forKey:", v53, v54);

  v9 = *(_DWORD *)(a1 + 156);
  if ((v9 & 0x20) != 0)
    goto LABEL_100;
LABEL_10:
  if ((v9 & 0x80) != 0)
  {
LABEL_11:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 152));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v11 = CFSTR("usedBackgroundUrl");
    else
      v11 = CFSTR("used_background_url");
    objc_msgSend(v4, "setObject:forKey:", v10, v11);

  }
LABEL_15:
  objc_msgSend((id)a1, "requestingAppIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    if (a2)
      v13 = CFSTR("requestingAppIdentifier");
    else
      v13 = CFSTR("requesting_app_identifier");
    objc_msgSend(v4, "setObject:forKey:", v12, v13);
  }

  objc_msgSend((id)a1, "requestingAppMajorVer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    if (a2)
      v15 = CFSTR("requestingAppMajorVer");
    else
      v15 = CFSTR("requesting_app_major_ver");
    objc_msgSend(v4, "setObject:forKey:", v14, v15);
  }

  objc_msgSend((id)a1, "requestingAppMinorVer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    if (a2)
      v17 = CFSTR("requestingAppMinorVer");
    else
      v17 = CFSTR("requesting_app_minor_ver");
    objc_msgSend(v4, "setObject:forKey:", v16, v17);
  }

  objc_msgSend((id)a1, "errorDomain");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    if (a2)
      v19 = CFSTR("errorDomain");
    else
      v19 = CFSTR("error_domain");
    objc_msgSend(v4, "setObject:forKey:", v18, v19);
  }

  if ((*(_BYTE *)(a1 + 156) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(a1 + 56));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v21 = CFSTR("errorCode");
    else
      v21 = CFSTR("error_code");
    objc_msgSend(v4, "setObject:forKey:", v20, v21);

  }
  if (objc_msgSend(*(id *)(a1 + 24), "count"))
  {
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
    v60 = 0u;
    v61 = 0u;
    v62 = 0u;
    v63 = 0u;
    v23 = *(id *)(a1 + 24);
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v60, v64, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v61;
      do
      {
        for (i = 0; i != v25; ++i)
        {
          if (*(_QWORD *)v61 != v26)
            objc_enumerationMutation(v23);
          v28 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v28, "jsonRepresentation");
          else
            objc_msgSend(v28, "dictionaryRepresentation");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "addObject:", v29);

        }
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v60, v64, 16);
      }
      while (v25);
    }

    if (a2)
      v30 = CFSTR("additionalStates");
    else
      v30 = CFSTR("additional_states");
    objc_msgSend(v4, "setObject:forKey:", v22, v30);

  }
  if ((*(_BYTE *)(a1 + 156) & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 72));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v32 = CFSTR("eventTimestamp");
    else
      v32 = CFSTR("event_timestamp");
    objc_msgSend(v4, "setObject:forKey:", v31, v32);

  }
  objc_msgSend((id)a1, "countryCode");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (v33)
  {
    if (a2)
      v34 = CFSTR("countryCode");
    else
      v34 = CFSTR("country_code");
    objc_msgSend(v4, "setObject:forKey:", v33, v34);
  }

  if ((*(_BYTE *)(a1 + 156) & 0x40) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 148));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v36 = CFSTR("tilesetId");
    else
      v36 = CFSTR("tileset_id");
    objc_msgSend(v4, "setObject:forKey:", v35, v36);

  }
  objc_msgSend((id)a1, "locale");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  if (v37)
    objc_msgSend(v4, "setObject:forKey:", v37, CFSTR("locale"));

  if ((*(_BYTE *)(a1 + 156) & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 140));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v39 = CFSTR("datasetId");
    else
      v39 = CFSTR("dataset_id");
    objc_msgSend(v4, "setObject:forKey:", v38, v39);

  }
  objc_msgSend((id)a1, "manifestEnvironment");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  if (v40)
  {
    if (a2)
      v41 = CFSTR("manifestEnvironment");
    else
      v41 = CFSTR("manifest_environment");
    objc_msgSend(v4, "setObject:forKey:", v40, v41);
  }

  objc_msgSend((id)a1, "appIdentifier");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  if (v42)
  {
    if (a2)
      v43 = CFSTR("appIdentifier");
    else
      v43 = CFSTR("app_identifier");
    objc_msgSend(v4, "setObject:forKey:", v42, v43);
  }

  v44 = *(void **)(a1 + 16);
  if (v44)
  {
    objc_msgSend(v44, "dictionaryRepresentation");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = v45;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v45, "count"));
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v58[0] = MEMORY[0x1E0C809B0];
      v58[1] = 3221225472;
      v58[2] = __49__GEONetworkEventData__dictionaryRepresentation___block_invoke;
      v58[3] = &unk_1E1C00600;
      v48 = v47;
      v59 = v48;
      objc_msgSend(v46, "enumerateKeysAndObjectsUsingBlock:", v58);
      v49 = v48;

      v46 = v49;
    }
    objc_msgSend(v4, "setObject:forKey:", v46, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEONetworkEventData _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __49__GEONetworkEventData__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEONetworkEventData)initWithDictionary:(id)a3
{
  return (GEONetworkEventData *)-[GEONetworkEventData _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  GEOClientMetrics *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  id v17;
  uint64_t v18;
  const __CFString *v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  void *v26;
  const __CFString *v27;
  void *v28;
  void *v29;
  const __CFString *v30;
  void *v31;
  void *v32;
  const __CFString *v33;
  void *v34;
  const __CFString *v35;
  void *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t i;
  uint64_t v42;
  GEOLogMsgState *v43;
  uint64_t v44;
  void *v45;
  const __CFString *v46;
  void *v47;
  const __CFString *v48;
  void *v49;
  void *v50;
  const __CFString *v51;
  void *v52;
  void *v53;
  void *v54;
  const __CFString *v55;
  void *v56;
  const __CFString *v57;
  void *v58;
  void *v59;
  const __CFString *v60;
  void *v61;
  void *v62;
  id v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (!a1)
    goto LABEL_166;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_166;
  if (a3)
    v6 = CFSTR("clientMetrics");
  else
    v6 = CFSTR("client_metrics");
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = [GEOClientMetrics alloc];
    if ((a3 & 1) != 0)
      v9 = -[GEOClientMetrics initWithJSON:](v8, "initWithJSON:", v7);
    else
      v9 = -[GEOClientMetrics initWithDictionary:](v8, "initWithDictionary:", v7);
    v10 = (void *)v9;
    objc_msgSend(a1, "setClientMetrics:", v9);

  }
  if (a3)
    v11 = CFSTR("dataRequestKindType");
  else
    v11 = CFSTR("data_request_kind_type");
  objc_msgSend(v5, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setDataRequestKindType:", objc_msgSend(v12, "intValue"));

  if (a3)
    v13 = CFSTR("dataRequestKindSubtype");
  else
    v13 = CFSTR("data_request_kind_subtype");
  objc_msgSend(v5, "objectForKeyedSubscript:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setDataRequestKindSubtype:", objc_msgSend(v14, "intValue"));

  if (a3)
    v15 = CFSTR("networkService");
  else
    v15 = CFSTR("network_service");
  objc_msgSend(v5, "objectForKeyedSubscript:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v17 = v16;
    if ((objc_msgSend(v17, "isEqualToString:", CFSTR("NETWORK_SERVICE_UNKNOWN")) & 1) != 0)
    {
      v18 = 0;
    }
    else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("REVERSE_GEOCODER")) & 1) != 0)
    {
      v18 = 1;
    }
    else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("FORWARD_GEOCODER")) & 1) != 0)
    {
      v18 = 2;
    }
    else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("SEARCH")) & 1) != 0)
    {
      v18 = 3;
    }
    else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("DIRECTIONS")) & 1) != 0)
    {
      v18 = 4;
    }
    else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("TILE")) & 1) != 0)
    {
      v18 = 5;
    }
    else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("TRAFFIC_ETA")) & 1) != 0)
    {
      v18 = 6;
    }
    else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("SIMPLE_ETA")) & 1) != 0)
    {
      v18 = 7;
    }
    else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("SUGGESTIONS")) & 1) != 0)
    {
      v18 = 8;
    }
    else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("BATCH_REVGEO")) & 1) != 0)
    {
      v18 = 9;
    }
    else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("MAP_MATCH")) & 1) != 0)
    {
      v18 = 10;
    }
    else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("ADDRESS_CORRECTION_INIT")) & 1) != 0)
    {
      v18 = 11;
    }
    else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("ADDRESS_CORRECTION_UPDATE")) & 1) != 0)
    {
      v18 = 12;
    }
    else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("PLACE_DATA")) & 1) != 0)
    {
      v18 = 13;
    }
    else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("RESOURCE_LOADER")) & 1) != 0)
    {
      v18 = 14;
    }
    else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("LOG_MESSAGE_USAGE")) & 1) != 0)
    {
      v18 = 16;
    }
    else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("LOCATION_SHIFT")) & 1) != 0)
    {
      v18 = 17;
    }
    else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("AB_ASSIGN")) & 1) != 0)
    {
      v18 = 18;
    }
    else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("MANIFEST")) & 1) != 0)
    {
      v18 = 19;
    }
    else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("REALTIME_TRAFFIC_PROBE")) & 1) != 0)
    {
      v18 = 20;
    }
    else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("BATCH_TRAFFIC_PROBE")) & 1) != 0)
    {
      v18 = 21;
    }
    else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("SYNC")) & 1) != 0)
    {
      v18 = 22;
    }
    else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("WIFI_QUALITY")) & 1) != 0)
    {
      v18 = 23;
    }
    else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("NETWORK_DEFAULTS")) & 1) != 0)
    {
      v18 = 24;
    }
    else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("MUNIN_RESOURCE")) & 1) != 0)
    {
      v18 = 25;
    }
    else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("JUNCTION_VIEW")) & 1) != 0)
    {
      v18 = 26;
    }
    else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("WIFI_TILE")) & 1) != 0)
    {
      v18 = 27;
    }
    else if (objc_msgSend(v17, "isEqualToString:", CFSTR("INCIDENT")))
    {
      v18 = 28;
    }
    else
    {
      v18 = 0;
    }

    goto LABEL_85;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v18 = objc_msgSend(v16, "intValue");
LABEL_85:
    objc_msgSend(a1, "setNetworkService:", v18);
  }

  if (a3)
    v19 = CFSTR("usedBackgroundUrl");
  else
    v19 = CFSTR("used_background_url");
  objc_msgSend(v5, "objectForKeyedSubscript:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setUsedBackgroundUrl:", objc_msgSend(v20, "BOOLValue"));

  if (a3)
    v21 = CFSTR("requestingAppIdentifier");
  else
    v21 = CFSTR("requesting_app_identifier");
  objc_msgSend(v5, "objectForKeyedSubscript:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v23 = (void *)objc_msgSend(v22, "copy");
    objc_msgSend(a1, "setRequestingAppIdentifier:", v23);

  }
  if (a3)
    v24 = CFSTR("requestingAppMajorVer");
  else
    v24 = CFSTR("requesting_app_major_ver");
  objc_msgSend(v5, "objectForKeyedSubscript:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v26 = (void *)objc_msgSend(v25, "copy");
    objc_msgSend(a1, "setRequestingAppMajorVer:", v26);

  }
  if (a3)
    v27 = CFSTR("requestingAppMinorVer");
  else
    v27 = CFSTR("requesting_app_minor_ver");
  objc_msgSend(v5, "objectForKeyedSubscript:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v29 = (void *)objc_msgSend(v28, "copy");
    objc_msgSend(a1, "setRequestingAppMinorVer:", v29);

  }
  if (a3)
    v30 = CFSTR("errorDomain");
  else
    v30 = CFSTR("error_domain");
  objc_msgSend(v5, "objectForKeyedSubscript:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v32 = (void *)objc_msgSend(v31, "copy");
    objc_msgSend(a1, "setErrorDomain:", v32);

  }
  if (a3)
    v33 = CFSTR("errorCode");
  else
    v33 = CFSTR("error_code");
  objc_msgSend(v5, "objectForKeyedSubscript:", v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setErrorCode:", objc_msgSend(v34, "longLongValue"));

  if (a3)
    v35 = CFSTR("additionalStates");
  else
    v35 = CFSTR("additional_states");
  objc_msgSend(v5, "objectForKeyedSubscript:", v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v64 = v5;
    v67 = 0u;
    v68 = 0u;
    v65 = 0u;
    v66 = 0u;
    v37 = v36;
    v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v65, v69, 16);
    if (v38)
    {
      v39 = v38;
      v40 = *(_QWORD *)v66;
      do
      {
        for (i = 0; i != v39; ++i)
        {
          if (*(_QWORD *)v66 != v40)
            objc_enumerationMutation(v37);
          v42 = *(_QWORD *)(*((_QWORD *)&v65 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v43 = [GEOLogMsgState alloc];
            if ((a3 & 1) != 0)
              v44 = -[GEOLogMsgState initWithJSON:](v43, "initWithJSON:", v42);
            else
              v44 = -[GEOLogMsgState initWithDictionary:](v43, "initWithDictionary:", v42);
            v45 = (void *)v44;
            objc_msgSend(a1, "addAdditionalStates:", v44);

          }
        }
        v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v65, v69, 16);
      }
      while (v39);
    }

    v5 = v64;
  }

  if (a3)
    v46 = CFSTR("eventTimestamp");
  else
    v46 = CFSTR("event_timestamp");
  objc_msgSend(v5, "objectForKeyedSubscript:", v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v47, "doubleValue");
    objc_msgSend(a1, "setEventTimestamp:");
  }

  if (a3)
    v48 = CFSTR("countryCode");
  else
    v48 = CFSTR("country_code");
  objc_msgSend(v5, "objectForKeyedSubscript:", v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v50 = (void *)objc_msgSend(v49, "copy");
    objc_msgSend(a1, "setCountryCode:", v50);

  }
  if (a3)
    v51 = CFSTR("tilesetId");
  else
    v51 = CFSTR("tileset_id");
  objc_msgSend(v5, "objectForKeyedSubscript:", v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setTilesetId:", objc_msgSend(v52, "unsignedIntValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("locale"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v54 = (void *)objc_msgSend(v53, "copy");
    objc_msgSend(a1, "setLocale:", v54);

  }
  if (a3)
    v55 = CFSTR("datasetId");
  else
    v55 = CFSTR("dataset_id");
  objc_msgSend(v5, "objectForKeyedSubscript:", v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setDatasetId:", objc_msgSend(v56, "unsignedIntValue"));

  if (a3)
    v57 = CFSTR("manifestEnvironment");
  else
    v57 = CFSTR("manifest_environment");
  objc_msgSend(v5, "objectForKeyedSubscript:", v57);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v59 = (void *)objc_msgSend(v58, "copy");
    objc_msgSend(a1, "setManifestEnvironment:", v59);

  }
  if (a3)
    v60 = CFSTR("appIdentifier");
  else
    v60 = CFSTR("app_identifier");
  objc_msgSend(v5, "objectForKeyedSubscript:", v60);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v62 = (void *)objc_msgSend(v61, "copy");
    objc_msgSend(a1, "setAppIdentifier:", v62);

  }
LABEL_166:

  return a1;
}

- (GEONetworkEventData)initWithJSON:(id)a3
{
  return (GEONetworkEventData *)-[GEONetworkEventData _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEONetworkEventDataIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEONetworkEventDataReadAllFrom((uint64_t)self, a3, 0);
}

- (void)clearSensitiveFields:(unint64_t)a3
{
  GEONetworkEventDataClearSensitiveFields((uint64_t)self, a3, 1);
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
  -[GEONetworkEventData _readAdditionalStates]((uint64_t)self);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_additionalStates;
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
  $3296299F16D566F38FA83A9082AA5EFC flags;
  id *v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  void *v9;
  id *v10;
  id *v11;

  v11 = (id *)a3;
  -[GEONetworkEventData readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v11 + 1, self->_reader);
  *((_DWORD *)v11 + 30) = self->_readerMarkPos;
  *((_DWORD *)v11 + 31) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_clientMetrics)
    objc_msgSend(v11, "setClientMetrics:");
  flags = self->_flags;
  v5 = v11;
  if ((*(_BYTE *)&flags & 8) != 0)
  {
    *((_DWORD *)v11 + 34) = self->_dataRequestKindType;
    *((_DWORD *)v11 + 39) |= 8u;
    flags = self->_flags;
    if ((*(_BYTE *)&flags & 4) == 0)
    {
LABEL_5:
      if ((*(_BYTE *)&flags & 0x20) == 0)
        goto LABEL_6;
      goto LABEL_39;
    }
  }
  else if ((*(_BYTE *)&flags & 4) == 0)
  {
    goto LABEL_5;
  }
  *((_DWORD *)v11 + 33) = self->_dataRequestKindSubtype;
  *((_DWORD *)v11 + 39) |= 4u;
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 0x20) == 0)
  {
LABEL_6:
    if ((*(_BYTE *)&flags & 0x80) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_39:
  *((_DWORD *)v11 + 36) = self->_networkService;
  *((_DWORD *)v11 + 39) |= 0x20u;
  if ((*(_DWORD *)&self->_flags & 0x80) != 0)
  {
LABEL_7:
    *((_BYTE *)v11 + 152) = self->_usedBackgroundUrl;
    *((_DWORD *)v11 + 39) |= 0x80u;
  }
LABEL_8:
  if (self->_requestingAppIdentifier)
  {
    objc_msgSend(v11, "setRequestingAppIdentifier:");
    v5 = v11;
  }
  if (self->_requestingAppMajorVer)
  {
    objc_msgSend(v11, "setRequestingAppMajorVer:");
    v5 = v11;
  }
  if (self->_requestingAppMinorVer)
  {
    objc_msgSend(v11, "setRequestingAppMinorVer:");
    v5 = v11;
  }
  if (self->_errorDomain)
  {
    objc_msgSend(v11, "setErrorDomain:");
    v5 = v11;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    v5[7] = (id)self->_errorCode;
    *((_DWORD *)v5 + 39) |= 1u;
  }
  if (-[GEONetworkEventData additionalStatesCount](self, "additionalStatesCount"))
  {
    objc_msgSend(v11, "clearAdditionalStates");
    v6 = -[GEONetworkEventData additionalStatesCount](self, "additionalStatesCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
      {
        -[GEONetworkEventData additionalStatesAtIndex:](self, "additionalStatesAtIndex:", i);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addAdditionalStates:", v9);

      }
    }
  }
  v10 = v11;
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    v11[9] = *(id *)&self->_eventTimestamp;
    *((_DWORD *)v11 + 39) |= 2u;
  }
  if (self->_countryCode)
  {
    objc_msgSend(v11, "setCountryCode:");
    v10 = v11;
  }
  if ((*(_BYTE *)&self->_flags & 0x40) != 0)
  {
    *((_DWORD *)v10 + 37) = self->_tilesetId;
    *((_DWORD *)v10 + 39) |= 0x40u;
  }
  if (self->_locale)
  {
    objc_msgSend(v11, "setLocale:");
    v10 = v11;
  }
  if ((*(_BYTE *)&self->_flags & 0x10) != 0)
  {
    *((_DWORD *)v10 + 35) = self->_datasetId;
    *((_DWORD *)v10 + 39) |= 0x10u;
  }
  if (self->_manifestEnvironment)
  {
    objc_msgSend(v11, "setManifestEnvironment:");
    v10 = v11;
  }
  if (self->_appIdentifier)
  {
    objc_msgSend(v11, "setAppIdentifier:");
    v10 = v11;
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
  $3296299F16D566F38FA83A9082AA5EFC flags;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  NSMutableArray *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  PBUnknownFields *v33;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*((_BYTE *)&self->_flags + 2) & 8) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEONetworkEventDataReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_26;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEONetworkEventData readAll:](self, "readAll:", 0);
  v9 = -[GEOClientMetrics copyWithZone:](self->_clientMetrics, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v9;

  flags = self->_flags;
  if ((*(_BYTE *)&flags & 8) != 0)
  {
    *(_DWORD *)(v5 + 136) = self->_dataRequestKindType;
    *(_DWORD *)(v5 + 156) |= 8u;
    flags = self->_flags;
    if ((*(_BYTE *)&flags & 4) == 0)
    {
LABEL_7:
      if ((*(_BYTE *)&flags & 0x20) == 0)
        goto LABEL_8;
LABEL_29:
      *(_DWORD *)(v5 + 144) = self->_networkService;
      *(_DWORD *)(v5 + 156) |= 0x20u;
      if ((*(_DWORD *)&self->_flags & 0x80) == 0)
        goto LABEL_10;
      goto LABEL_9;
    }
  }
  else if ((*(_BYTE *)&flags & 4) == 0)
  {
    goto LABEL_7;
  }
  *(_DWORD *)(v5 + 132) = self->_dataRequestKindSubtype;
  *(_DWORD *)(v5 + 156) |= 4u;
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 0x20) != 0)
    goto LABEL_29;
LABEL_8:
  if ((*(_BYTE *)&flags & 0x80) != 0)
  {
LABEL_9:
    *(_BYTE *)(v5 + 152) = self->_usedBackgroundUrl;
    *(_DWORD *)(v5 + 156) |= 0x80u;
  }
LABEL_10:
  v12 = -[NSString copyWithZone:](self->_requestingAppIdentifier, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 96);
  *(_QWORD *)(v5 + 96) = v12;

  v14 = -[NSString copyWithZone:](self->_requestingAppMajorVer, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 104);
  *(_QWORD *)(v5 + 104) = v14;

  v16 = -[NSString copyWithZone:](self->_requestingAppMinorVer, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 112);
  *(_QWORD *)(v5 + 112) = v16;

  v18 = -[NSString copyWithZone:](self->_errorDomain, "copyWithZone:", a3);
  v19 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v18;

  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_QWORD *)(v5 + 56) = self->_errorCode;
    *(_DWORD *)(v5 + 156) |= 1u;
  }
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v20 = self->_additionalStates;
  v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  if (v21)
  {
    v22 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v36 != v22)
          objc_enumerationMutation(v20);
        v24 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v35);
        objc_msgSend((id)v5, "addAdditionalStates:", v24);

      }
      v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    }
    while (v21);
  }

  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    *(double *)(v5 + 72) = self->_eventTimestamp;
    *(_DWORD *)(v5 + 156) |= 2u;
  }
  v25 = -[NSString copyWithZone:](self->_countryCode, "copyWithZone:", a3, (_QWORD)v35);
  v26 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v25;

  if ((*(_BYTE *)&self->_flags & 0x40) != 0)
  {
    *(_DWORD *)(v5 + 148) = self->_tilesetId;
    *(_DWORD *)(v5 + 156) |= 0x40u;
  }
  v27 = -[NSString copyWithZone:](self->_locale, "copyWithZone:", a3);
  v28 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v27;

  if ((*(_BYTE *)&self->_flags & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 140) = self->_datasetId;
    *(_DWORD *)(v5 + 156) |= 0x10u;
  }
  v29 = -[NSString copyWithZone:](self->_manifestEnvironment, "copyWithZone:", a3);
  v30 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v29;

  v31 = -[NSString copyWithZone:](self->_appIdentifier, "copyWithZone:", a3);
  v32 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v31;

  v33 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v33;
LABEL_26:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  GEOClientMetrics *clientMetrics;
  $3296299F16D566F38FA83A9082AA5EFC flags;
  int v7;
  NSString *requestingAppIdentifier;
  NSString *requestingAppMajorVer;
  NSString *requestingAppMinorVer;
  NSString *errorDomain;
  $3296299F16D566F38FA83A9082AA5EFC v12;
  int v13;
  NSMutableArray *additionalStates;
  NSString *countryCode;
  NSString *locale;
  NSString *manifestEnvironment;
  NSString *appIdentifier;
  char v19;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_68;
  -[GEONetworkEventData readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  clientMetrics = self->_clientMetrics;
  if ((unint64_t)clientMetrics | *((_QWORD *)v4 + 5))
  {
    if (!-[GEOClientMetrics isEqual:](clientMetrics, "isEqual:"))
      goto LABEL_68;
  }
  flags = self->_flags;
  v7 = *((_DWORD *)v4 + 39);
  if ((*(_BYTE *)&flags & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_dataRequestKindType != *((_DWORD *)v4 + 34))
      goto LABEL_68;
  }
  else if ((v7 & 8) != 0)
  {
    goto LABEL_68;
  }
  if ((*(_BYTE *)&flags & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_dataRequestKindSubtype != *((_DWORD *)v4 + 33))
      goto LABEL_68;
  }
  else if ((v7 & 4) != 0)
  {
    goto LABEL_68;
  }
  if ((*(_BYTE *)&flags & 0x20) != 0)
  {
    if ((v7 & 0x20) == 0 || self->_networkService != *((_DWORD *)v4 + 36))
      goto LABEL_68;
  }
  else if ((v7 & 0x20) != 0)
  {
    goto LABEL_68;
  }
  if ((*(_BYTE *)&flags & 0x80) != 0)
  {
    if ((v7 & 0x80) == 0)
      goto LABEL_68;
    if (self->_usedBackgroundUrl)
    {
      if (!*((_BYTE *)v4 + 152))
        goto LABEL_68;
    }
    else if (*((_BYTE *)v4 + 152))
    {
      goto LABEL_68;
    }
  }
  else if ((v7 & 0x80) != 0)
  {
    goto LABEL_68;
  }
  requestingAppIdentifier = self->_requestingAppIdentifier;
  if ((unint64_t)requestingAppIdentifier | *((_QWORD *)v4 + 12)
    && !-[NSString isEqual:](requestingAppIdentifier, "isEqual:"))
  {
    goto LABEL_68;
  }
  requestingAppMajorVer = self->_requestingAppMajorVer;
  if ((unint64_t)requestingAppMajorVer | *((_QWORD *)v4 + 13))
  {
    if (!-[NSString isEqual:](requestingAppMajorVer, "isEqual:"))
      goto LABEL_68;
  }
  requestingAppMinorVer = self->_requestingAppMinorVer;
  if ((unint64_t)requestingAppMinorVer | *((_QWORD *)v4 + 14))
  {
    if (!-[NSString isEqual:](requestingAppMinorVer, "isEqual:"))
      goto LABEL_68;
  }
  errorDomain = self->_errorDomain;
  if ((unint64_t)errorDomain | *((_QWORD *)v4 + 8))
  {
    if (!-[NSString isEqual:](errorDomain, "isEqual:"))
      goto LABEL_68;
  }
  v12 = self->_flags;
  v13 = *((_DWORD *)v4 + 39);
  if ((*(_BYTE *)&v12 & 1) != 0)
  {
    if ((v13 & 1) == 0 || self->_errorCode != *((_QWORD *)v4 + 7))
      goto LABEL_68;
  }
  else if ((v13 & 1) != 0)
  {
    goto LABEL_68;
  }
  additionalStates = self->_additionalStates;
  if ((unint64_t)additionalStates | *((_QWORD *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](additionalStates, "isEqual:"))
      goto LABEL_68;
    v12 = self->_flags;
    v13 = *((_DWORD *)v4 + 39);
  }
  if ((*(_BYTE *)&v12 & 2) != 0)
  {
    if ((v13 & 2) == 0 || self->_eventTimestamp != *((double *)v4 + 9))
      goto LABEL_68;
  }
  else if ((v13 & 2) != 0)
  {
    goto LABEL_68;
  }
  countryCode = self->_countryCode;
  if ((unint64_t)countryCode | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](countryCode, "isEqual:"))
      goto LABEL_68;
    v12 = self->_flags;
    v13 = *((_DWORD *)v4 + 39);
  }
  if ((*(_BYTE *)&v12 & 0x40) != 0)
  {
    if ((v13 & 0x40) == 0 || self->_tilesetId != *((_DWORD *)v4 + 37))
      goto LABEL_68;
  }
  else if ((v13 & 0x40) != 0)
  {
    goto LABEL_68;
  }
  locale = self->_locale;
  if ((unint64_t)locale | *((_QWORD *)v4 + 10))
  {
    if (-[NSString isEqual:](locale, "isEqual:"))
    {
      v12 = self->_flags;
      v13 = *((_DWORD *)v4 + 39);
      goto LABEL_59;
    }
LABEL_68:
    v19 = 0;
    goto LABEL_69;
  }
LABEL_59:
  if ((*(_BYTE *)&v12 & 0x10) != 0)
  {
    if ((v13 & 0x10) == 0 || self->_datasetId != *((_DWORD *)v4 + 35))
      goto LABEL_68;
  }
  else if ((v13 & 0x10) != 0)
  {
    goto LABEL_68;
  }
  manifestEnvironment = self->_manifestEnvironment;
  if ((unint64_t)manifestEnvironment | *((_QWORD *)v4 + 11)
    && !-[NSString isEqual:](manifestEnvironment, "isEqual:"))
  {
    goto LABEL_68;
  }
  appIdentifier = self->_appIdentifier;
  if ((unint64_t)appIdentifier | *((_QWORD *)v4 + 4))
    v19 = -[NSString isEqual:](appIdentifier, "isEqual:");
  else
    v19 = 1;
LABEL_69:

  return v19;
}

- (unint64_t)hash
{
  $3296299F16D566F38FA83A9082AA5EFC flags;
  NSUInteger v4;
  NSUInteger v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  double eventTimestamp;
  double v10;
  long double v11;
  double v12;
  NSUInteger v13;
  uint64_t v14;
  NSUInteger v15;
  uint64_t v16;
  unint64_t v17;
  NSUInteger v18;
  NSUInteger v20;
  NSUInteger v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;

  -[GEONetworkEventData readAll:](self, "readAll:", 1);
  v26 = -[GEOClientMetrics hash](self->_clientMetrics, "hash");
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 8) != 0)
  {
    v25 = 2654435761 * self->_dataRequestKindType;
    if ((*(_BYTE *)&flags & 4) != 0)
    {
LABEL_3:
      v24 = 2654435761 * self->_dataRequestKindSubtype;
      if ((*(_BYTE *)&flags & 0x20) != 0)
        goto LABEL_4;
LABEL_8:
      v23 = 0;
      if ((*(_BYTE *)&flags & 0x80) != 0)
        goto LABEL_5;
      goto LABEL_9;
    }
  }
  else
  {
    v25 = 0;
    if ((*(_BYTE *)&flags & 4) != 0)
      goto LABEL_3;
  }
  v24 = 0;
  if ((*(_BYTE *)&flags & 0x20) == 0)
    goto LABEL_8;
LABEL_4:
  v23 = 2654435761 * self->_networkService;
  if ((*(_BYTE *)&flags & 0x80) != 0)
  {
LABEL_5:
    v22 = 2654435761 * self->_usedBackgroundUrl;
    goto LABEL_10;
  }
LABEL_9:
  v22 = 0;
LABEL_10:
  v21 = -[NSString hash](self->_requestingAppIdentifier, "hash");
  v20 = -[NSString hash](self->_requestingAppMajorVer, "hash");
  v4 = -[NSString hash](self->_requestingAppMinorVer, "hash");
  v5 = -[NSString hash](self->_errorDomain, "hash");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v6 = 2654435761 * self->_errorCode;
  else
    v6 = 0;
  v7 = -[NSMutableArray hash](self->_additionalStates, "hash");
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    eventTimestamp = self->_eventTimestamp;
    v10 = -eventTimestamp;
    if (eventTimestamp >= 0.0)
      v10 = self->_eventTimestamp;
    v11 = floor(v10 + 0.5);
    v12 = (v10 - v11) * 1.84467441e19;
    v8 = 2654435761u * (unint64_t)fmod(v11, 1.84467441e19);
    if (v12 >= 0.0)
    {
      if (v12 > 0.0)
        v8 += (unint64_t)v12;
    }
    else
    {
      v8 -= (unint64_t)fabs(v12);
    }
  }
  else
  {
    v8 = 0;
  }
  v13 = -[NSString hash](self->_countryCode, "hash");
  if ((*(_BYTE *)&self->_flags & 0x40) != 0)
    v14 = 2654435761 * self->_tilesetId;
  else
    v14 = 0;
  v15 = -[NSString hash](self->_locale, "hash");
  if ((*(_BYTE *)&self->_flags & 0x10) != 0)
    v16 = 2654435761 * self->_datasetId;
  else
    v16 = 0;
  v17 = v25 ^ v26 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v13 ^ v14;
  v18 = v15 ^ v16 ^ -[NSString hash](self->_manifestEnvironment, "hash");
  return v17 ^ v18 ^ -[NSString hash](self->_appIdentifier, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  GEOClientMetrics *clientMetrics;
  uint64_t v6;
  int v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  clientMetrics = self->_clientMetrics;
  v6 = *((_QWORD *)v4 + 5);
  if (clientMetrics)
  {
    if (v6)
      -[GEOClientMetrics mergeFrom:](clientMetrics, "mergeFrom:");
  }
  else if (v6)
  {
    -[GEONetworkEventData setClientMetrics:](self, "setClientMetrics:");
  }
  v7 = *((_DWORD *)v4 + 39);
  if ((v7 & 8) != 0)
  {
    self->_dataRequestKindType = *((_DWORD *)v4 + 34);
    *(_DWORD *)&self->_flags |= 8u;
    v7 = *((_DWORD *)v4 + 39);
    if ((v7 & 4) == 0)
    {
LABEL_8:
      if ((v7 & 0x20) == 0)
        goto LABEL_9;
      goto LABEL_45;
    }
  }
  else if ((v7 & 4) == 0)
  {
    goto LABEL_8;
  }
  self->_dataRequestKindSubtype = *((_DWORD *)v4 + 33);
  *(_DWORD *)&self->_flags |= 4u;
  v7 = *((_DWORD *)v4 + 39);
  if ((v7 & 0x20) == 0)
  {
LABEL_9:
    if ((v7 & 0x80) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
LABEL_45:
  self->_networkService = *((_DWORD *)v4 + 36);
  *(_DWORD *)&self->_flags |= 0x20u;
  if ((*((_DWORD *)v4 + 39) & 0x80) != 0)
  {
LABEL_10:
    self->_usedBackgroundUrl = *((_BYTE *)v4 + 152);
    *(_DWORD *)&self->_flags |= 0x80u;
  }
LABEL_11:
  if (*((_QWORD *)v4 + 12))
    -[GEONetworkEventData setRequestingAppIdentifier:](self, "setRequestingAppIdentifier:");
  if (*((_QWORD *)v4 + 13))
    -[GEONetworkEventData setRequestingAppMajorVer:](self, "setRequestingAppMajorVer:");
  if (*((_QWORD *)v4 + 14))
    -[GEONetworkEventData setRequestingAppMinorVer:](self, "setRequestingAppMinorVer:");
  if (*((_QWORD *)v4 + 8))
    -[GEONetworkEventData setErrorDomain:](self, "setErrorDomain:");
  if ((*((_BYTE *)v4 + 156) & 1) != 0)
  {
    self->_errorCode = *((_QWORD *)v4 + 7);
    *(_DWORD *)&self->_flags |= 1u;
  }
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v8 = *((id *)v4 + 3);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        -[GEONetworkEventData addAdditionalStates:](self, "addAdditionalStates:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i), (_QWORD)v13);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

  if ((*((_BYTE *)v4 + 156) & 2) != 0)
  {
    self->_eventTimestamp = *((double *)v4 + 9);
    *(_DWORD *)&self->_flags |= 2u;
  }
  if (*((_QWORD *)v4 + 6))
    -[GEONetworkEventData setCountryCode:](self, "setCountryCode:");
  if ((*((_BYTE *)v4 + 156) & 0x40) != 0)
  {
    self->_tilesetId = *((_DWORD *)v4 + 37);
    *(_DWORD *)&self->_flags |= 0x40u;
  }
  if (*((_QWORD *)v4 + 10))
    -[GEONetworkEventData setLocale:](self, "setLocale:");
  if ((*((_BYTE *)v4 + 156) & 0x10) != 0)
  {
    self->_datasetId = *((_DWORD *)v4 + 35);
    *(_DWORD *)&self->_flags |= 0x10u;
  }
  if (*((_QWORD *)v4 + 11))
    -[GEONetworkEventData setManifestEnvironment:](self, "setManifestEnvironment:");
  if (*((_QWORD *)v4 + 4))
    -[GEONetworkEventData setAppIdentifier:](self, "setAppIdentifier:");

}

- (PBUnknownFields)unknownFields
{
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v5;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*((_BYTE *)&self->_flags + 1) & 1) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      v5 = reader;
      objc_sync_enter(v5);
      GEONetworkEventDataReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_2469);
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
  *(_DWORD *)&self->_flags |= 0x80100u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEONetworkEventData readAll:](self, "readAll:", 0);
    -[GEOClientMetrics clearUnknownFields:](self->_clientMetrics, "clearUnknownFields:", 1);
  }
}

@end
