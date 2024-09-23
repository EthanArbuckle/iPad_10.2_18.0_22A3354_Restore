@implementation GEOLogMsgEventNetwork

- (GEOLogMsgEventNetwork)init
{
  GEOLogMsgEventNetwork *v2;
  GEOLogMsgEventNetwork *v3;
  GEOLogMsgEventNetwork *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOLogMsgEventNetwork;
  v2 = -[GEOLogMsgEventNetwork init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOLogMsgEventNetwork)initWithData:(id)a3
{
  GEOLogMsgEventNetwork *v3;
  GEOLogMsgEventNetwork *v4;
  GEOLogMsgEventNetwork *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOLogMsgEventNetwork;
  v3 = -[GEOLogMsgEventNetwork initWithData:](&v7, sel_initWithData_, a3);
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
  $DB617B79121746748C766C9C19229AA4 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_BYTE *)&flags & 0x40) != 0)
    return self->_networkService;
  else
    return 0;
}

- (void)setNetworkService:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x2000040u;
  self->_networkService = a3;
}

- (void)setHasNetworkService:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 33554496;
  else
    v3 = 0x2000000;
  self->_flags = ($DB617B79121746748C766C9C19229AA4)(*(_DWORD *)&self->_flags & 0xFFFFFFBF | v3);
}

- (BOOL)hasNetworkService
{
  return (*(_BYTE *)&self->_flags >> 6) & 1;
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

- (int)requestDataSize
{
  return self->_requestDataSize;
}

- (void)setRequestDataSize:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x2000200u;
  self->_requestDataSize = a3;
}

- (void)setHasRequestDataSize:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 33554944;
  else
    v3 = 0x2000000;
  self->_flags = ($DB617B79121746748C766C9C19229AA4)(*(_DWORD *)&self->_flags & 0xFDFFFDFF | v3);
}

- (BOOL)hasRequestDataSize
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 1) & 1;
}

- (int)responseDataSize
{
  return self->_responseDataSize;
}

- (void)setResponseDataSize:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x2000400u;
  self->_responseDataSize = a3;
}

- (void)setHasResponseDataSize:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 33555456;
  else
    v3 = 0x2000000;
  self->_flags = ($DB617B79121746748C766C9C19229AA4)(*(_DWORD *)&self->_flags & 0xFFFFFBFF | v3);
}

- (BOOL)hasResponseDataSize
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 2) & 1;
}

- (void)_readRequestErrorDomain
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(_BYTE *)(a1 + 166) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventNetworkReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRequestErrorDomain_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

- (BOOL)hasRequestErrorDomain
{
  -[GEOLogMsgEventNetwork _readRequestErrorDomain]((uint64_t)self);
  return self->_requestErrorDomain != 0;
}

- (NSString)requestErrorDomain
{
  -[GEOLogMsgEventNetwork _readRequestErrorDomain]((uint64_t)self);
  return self->_requestErrorDomain;
}

- (void)setRequestErrorDomain:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x2400000u;
  objc_storeStrong((id *)&self->_requestErrorDomain, a3);
}

- (int64_t)requestErrorCode
{
  return self->_requestErrorCode;
}

- (void)setRequestErrorCode:(int64_t)a3
{
  *(_DWORD *)&self->_flags |= 0x2000002u;
  self->_requestErrorCode = a3;
}

- (void)setHasRequestErrorCode:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 33554434;
  else
    v3 = 0x2000000;
  self->_flags = ($DB617B79121746748C766C9C19229AA4)(*(_DWORD *)&self->_flags & 0xFFFFFFFD | v3);
}

- (BOOL)hasRequestErrorCode
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (void)_readRequestErrorDescription
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(_BYTE *)(a1 + 166) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventNetworkReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRequestErrorDescription_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

- (BOOL)hasRequestErrorDescription
{
  -[GEOLogMsgEventNetwork _readRequestErrorDescription]((uint64_t)self);
  return self->_requestErrorDescription != 0;
}

- (NSString)requestErrorDescription
{
  -[GEOLogMsgEventNetwork _readRequestErrorDescription]((uint64_t)self);
  return self->_requestErrorDescription;
}

- (void)setRequestErrorDescription:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x2200000u;
  objc_storeStrong((id *)&self->_requestErrorDescription, a3);
}

- (void)_readRequestAppIdentifier
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(_BYTE *)(a1 + 166) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventNetworkReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRequestAppIdentifier_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

- (BOOL)hasRequestAppIdentifier
{
  -[GEOLogMsgEventNetwork _readRequestAppIdentifier]((uint64_t)self);
  return self->_requestAppIdentifier != 0;
}

- (NSString)requestAppIdentifier
{
  -[GEOLogMsgEventNetwork _readRequestAppIdentifier]((uint64_t)self);
  return self->_requestAppIdentifier;
}

- (void)setRequestAppIdentifier:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x2100000u;
  objc_storeStrong((id *)&self->_requestAppIdentifier, a3);
}

- (int)queuedTime
{
  return self->_queuedTime;
}

- (void)setQueuedTime:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x2000080u;
  self->_queuedTime = a3;
}

- (void)setHasQueuedTime:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 33554560;
  else
    v3 = 0x2000000;
  self->_flags = ($DB617B79121746748C766C9C19229AA4)(*(_DWORD *)&self->_flags & 0xFFFFFF7F | v3);
}

- (BOOL)hasQueuedTime
{
  return *(_BYTE *)&self->_flags >> 7;
}

- (int)totalTime
{
  return self->_totalTime;
}

- (void)setTotalTime:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x2002000u;
  self->_totalTime = a3;
}

- (void)setHasTotalTime:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 33562624;
  else
    v3 = 0x2000000;
  self->_flags = ($DB617B79121746748C766C9C19229AA4)(*(_DWORD *)&self->_flags & 0xFFFFDFFF | v3);
}

- (BOOL)hasTotalTime
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 5) & 1;
}

- (int)httpResponseCode
{
  return self->_httpResponseCode;
}

- (void)setHttpResponseCode:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x2000010u;
  self->_httpResponseCode = a3;
}

- (void)setHasHttpResponseCode:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 33554448;
  else
    v3 = 0x2000000;
  self->_flags = ($DB617B79121746748C766C9C19229AA4)(*(_DWORD *)&self->_flags & 0xFFFFFFEF | v3);
}

- (BOOL)hasHttpResponseCode
{
  return (*(_BYTE *)&self->_flags >> 4) & 1;
}

- (int)decodeTime
{
  return self->_decodeTime;
}

- (void)setDecodeTime:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x2000008u;
  self->_decodeTime = a3;
}

- (void)setHasDecodeTime:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 33554440;
  else
    v3 = 0x2000000;
  self->_flags = ($DB617B79121746748C766C9C19229AA4)(*(_DWORD *)&self->_flags & 0xFFFFFFF7 | v3);
}

- (BOOL)hasDecodeTime
{
  return (*(_BYTE *)&self->_flags >> 3) & 1;
}

- (double)requestStart
{
  return self->_requestStart;
}

- (void)setRequestStart:(double)a3
{
  *(_DWORD *)&self->_flags |= 0x2000004u;
  self->_requestStart = a3;
}

- (void)setHasRequestStart:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 33554436;
  else
    v3 = 0x2000000;
  self->_flags = ($DB617B79121746748C766C9C19229AA4)(*(_DWORD *)&self->_flags & 0xFFFFFFFB | v3);
}

- (BOOL)hasRequestStart
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (double)requestEnd
{
  return self->_requestEnd;
}

- (void)setRequestEnd:(double)a3
{
  *(_DWORD *)&self->_flags |= 0x2000001u;
  self->_requestEnd = a3;
}

- (void)setHasRequestEnd:(BOOL)a3
{
  self->_flags = ($DB617B79121746748C766C9C19229AA4)(*(_DWORD *)&self->_flags & 0xFFFFFFFE | a3 | 0x2000000);
}

- (BOOL)hasRequestEnd
{
  return *(_DWORD *)&self->_flags & 1;
}

- (int)redirectCount
{
  return self->_redirectCount;
}

- (void)setRedirectCount:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x2000100u;
  self->_redirectCount = a3;
}

- (void)setHasRedirectCount:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 33554688;
  else
    v3 = 0x2000000;
  self->_flags = ($DB617B79121746748C766C9C19229AA4)(*(_DWORD *)&self->_flags & 0xFFFFFEFF | v3);
}

- (BOOL)hasRedirectCount
{
  return *((_BYTE *)&self->_flags + 1) & 1;
}

- (void)_readManifestEnv
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(_BYTE *)(a1 + 166) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventNetworkReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readManifestEnv_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

- (BOOL)hasManifestEnv
{
  -[GEOLogMsgEventNetwork _readManifestEnv]((uint64_t)self);
  return self->_manifestEnv != 0;
}

- (NSString)manifestEnv
{
  -[GEOLogMsgEventNetwork _readManifestEnv]((uint64_t)self);
  return self->_manifestEnv;
}

- (void)setManifestEnv:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x2020000u;
  objc_storeStrong((id *)&self->_manifestEnv, a3);
}

- (unsigned)tilesetId
{
  return self->_tilesetId;
}

- (void)setTilesetId:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x2001000u;
  self->_tilesetId = a3;
}

- (void)setHasTilesetId:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 33558528;
  else
    v3 = 0x2000000;
  self->_flags = ($DB617B79121746748C766C9C19229AA4)(*(_DWORD *)&self->_flags & 0xFFFFEFFF | v3);
}

- (BOOL)hasTilesetId
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 4) & 1;
}

- (int)mptcpServiceType
{
  os_unfair_lock_s *p_readerLock;
  $DB617B79121746748C766C9C19229AA4 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_BYTE *)&flags & 0x20) != 0)
    return self->_mptcpServiceType;
  else
    return 0;
}

- (void)setMptcpServiceType:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x2000020u;
  self->_mptcpServiceType = a3;
}

- (void)setHasMptcpServiceType:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 33554464;
  else
    v3 = 0x2000000;
  self->_flags = ($DB617B79121746748C766C9C19229AA4)(*(_DWORD *)&self->_flags & 0xFFFFFFDF | v3);
}

- (BOOL)hasMptcpServiceType
{
  return (*(_BYTE *)&self->_flags >> 5) & 1;
}

- (id)mptcpServiceTypeAsString:(int)a3
{
  if (a3 < 4)
    return off_1E1C225E0[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsMptcpServiceType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NONE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HANDOVER")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("INTERACTIVE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("AGGREGATE")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)mptcpNegotiated
{
  return self->_mptcpNegotiated;
}

- (void)setMptcpNegotiated:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x2004000u;
  self->_mptcpNegotiated = a3;
}

- (void)setHasMptcpNegotiated:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 33570816;
  else
    v3 = 0x2000000;
  self->_flags = ($DB617B79121746748C766C9C19229AA4)(*(_DWORD *)&self->_flags & 0xFFFFBFFF | v3);
}

- (BOOL)hasMptcpNegotiated
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 6) & 1;
}

- (BOOL)wasBackground
{
  return self->_wasBackground;
}

- (void)setWasBackground:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x2010000u;
  self->_wasBackground = a3;
}

- (void)setHasWasBackground:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 33619968;
  else
    v3 = 0x2000000;
  self->_flags = ($DB617B79121746748C766C9C19229AA4)(*(_DWORD *)&self->_flags & 0xFFFEFFFF | v3);
}

- (BOOL)hasWasBackground
{
  return *((_BYTE *)&self->_flags + 2) & 1;
}

- (void)_readServiceIpAddress
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(_BYTE *)(a1 + 166) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventNetworkReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readServiceIpAddress_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

- (BOOL)hasServiceIpAddress
{
  -[GEOLogMsgEventNetwork _readServiceIpAddress]((uint64_t)self);
  return self->_serviceIpAddress != 0;
}

- (NSString)serviceIpAddress
{
  -[GEOLogMsgEventNetwork _readServiceIpAddress]((uint64_t)self);
  return self->_serviceIpAddress;
}

- (void)setServiceIpAddress:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x2800000u;
  objc_storeStrong((id *)&self->_serviceIpAddress, a3);
}

- (BOOL)rnfTriggered
{
  return self->_rnfTriggered;
}

- (void)setRnfTriggered:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x2008000u;
  self->_rnfTriggered = a3;
}

- (void)setHasRnfTriggered:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 33587200;
  else
    v3 = 0x2000000;
  self->_flags = ($DB617B79121746748C766C9C19229AA4)(*(_DWORD *)&self->_flags & 0xFFFF7FFF | v3);
}

- (BOOL)hasRnfTriggered
{
  return *((unsigned __int8 *)&self->_flags + 1) >> 7;
}

- (void)_readRequestAppIdMajorVer
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(_BYTE *)(a1 + 166) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventNetworkReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRequestAppIdMajorVer_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

- (BOOL)hasRequestAppIdMajorVer
{
  -[GEOLogMsgEventNetwork _readRequestAppIdMajorVer]((uint64_t)self);
  return self->_requestAppIdMajorVer != 0;
}

- (NSString)requestAppIdMajorVer
{
  -[GEOLogMsgEventNetwork _readRequestAppIdMajorVer]((uint64_t)self);
  return self->_requestAppIdMajorVer;
}

- (void)setRequestAppIdMajorVer:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x2040000u;
  objc_storeStrong((id *)&self->_requestAppIdMajorVer, a3);
}

- (void)_readRequestAppIdMinorVer
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(_BYTE *)(a1 + 166) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventNetworkReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRequestAppIdMinorVer_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

- (BOOL)hasRequestAppIdMinorVer
{
  -[GEOLogMsgEventNetwork _readRequestAppIdMinorVer]((uint64_t)self);
  return self->_requestAppIdMinorVer != 0;
}

- (NSString)requestAppIdMinorVer
{
  -[GEOLogMsgEventNetwork _readRequestAppIdMinorVer]((uint64_t)self);
  return self->_requestAppIdMinorVer;
}

- (void)setRequestAppIdMinorVer:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x2080000u;
  objc_storeStrong((id *)&self->_requestAppIdMinorVer, a3);
}

- (unsigned)samplingRate
{
  return self->_samplingRate;
}

- (void)setSamplingRate:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x2000800u;
  self->_samplingRate = a3;
}

- (void)setHasSamplingRate:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 33556480;
  else
    v3 = 0x2000000;
  self->_flags = ($DB617B79121746748C766C9C19229AA4)(*(_DWORD *)&self->_flags & 0xFFFFF7FF | v3);
}

- (BOOL)hasSamplingRate
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 3) & 1;
}

- (void)_readTaskMetrics
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(_BYTE *)(a1 + 167) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventNetworkReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTaskMetrics_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

- (BOOL)hasTaskMetrics
{
  -[GEOLogMsgEventNetwork _readTaskMetrics]((uint64_t)self);
  return self->_taskMetrics != 0;
}

- (GEONetworkSessionTaskTransactionMetrics)taskMetrics
{
  -[GEOLogMsgEventNetwork _readTaskMetrics]((uint64_t)self);
  return self->_taskMetrics;
}

- (void)setTaskMetrics:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x3000000u;
  objc_storeStrong((id *)&self->_taskMetrics, a3);
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
  v8.super_class = (Class)GEOLogMsgEventNetwork;
  -[GEOLogMsgEventNetwork description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOLogMsgEventNetwork dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgEventNetwork _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  int v5;
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
  const __CFString *v18;
  void *v19;
  const __CFString *v20;
  int v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  const __CFString *v25;
  int v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  const __CFString *v30;
  void *v31;
  const __CFString *v32;
  void *v33;
  const __CFString *v34;
  void *v35;
  const __CFString *v36;
  void *v37;
  const __CFString *v38;
  void *v39;
  void *v40;
  void *v41;
  const __CFString *v42;
  void *v43;
  const __CFString *v44;
  void *v45;
  const __CFString *v46;
  void *v47;
  const __CFString *v48;
  void *v49;
  const __CFString *v50;
  void *v51;
  const __CFString *v52;
  void *v53;
  const __CFString *v54;
  void *v55;
  const __CFString *v56;
  uint64_t v57;
  __CFString *v58;
  const __CFString *v60;
  void *v61;
  const __CFString *v62;

  if (!a1)
  {
    v4 = 0;
    return v4;
  }
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_DWORD *)(a1 + 164);
  if ((v5 & 0x40) != 0)
  {
    v6 = *(int *)(a1 + 128);
    if (v6 < 0x1D && ((0x1FFF7FFFu >> v6) & 1) != 0)
    {
      v7 = off_1E1C23298[v6];
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 128));
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    if (a2)
      v8 = CFSTR("networkService");
    else
      v8 = CFSTR("network_service");
    objc_msgSend(v4, "setObject:forKey:", v7, v8);

    v5 = *(_DWORD *)(a1 + 164);
  }
  if ((v5 & 0x200) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 140));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v10 = CFSTR("requestDataSize");
    else
      v10 = CFSTR("request_data_size");
    objc_msgSend(v4, "setObject:forKey:", v9, v10);

    v5 = *(_DWORD *)(a1 + 164);
  }
  if ((v5 & 0x400) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 144));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v12 = CFSTR("responseDataSize");
    else
      v12 = CFSTR("response_data_size");
    objc_msgSend(v4, "setObject:forKey:", v11, v12);

  }
  objc_msgSend((id)a1, "requestErrorDomain");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    if (a2)
      v14 = CFSTR("requestErrorDomain");
    else
      v14 = CFSTR("request_error_domain");
    objc_msgSend(v4, "setObject:forKey:", v13, v14);
  }

  if ((*(_BYTE *)(a1 + 164) & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(a1 + 56));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v16 = CFSTR("requestErrorCode");
    else
      v16 = CFSTR("request_error_code");
    objc_msgSend(v4, "setObject:forKey:", v15, v16);

  }
  objc_msgSend((id)a1, "requestErrorDescription");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    if (a2)
      v18 = CFSTR("requestErrorDescription");
    else
      v18 = CFSTR("request_error_description");
    objc_msgSend(v4, "setObject:forKey:", v17, v18);
  }

  objc_msgSend((id)a1, "requestAppIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    if (a2)
      v20 = CFSTR("requestAppIdentifier");
    else
      v20 = CFSTR("request_app_identifier");
    objc_msgSend(v4, "setObject:forKey:", v19, v20);
  }

  v21 = *(_DWORD *)(a1 + 164);
  if ((v21 & 0x80) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 132));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v44 = CFSTR("queuedTime");
    else
      v44 = CFSTR("queued_time");
    objc_msgSend(v4, "setObject:forKey:", v43, v44);

    v21 = *(_DWORD *)(a1 + 164);
    if ((v21 & 0x2000) == 0)
    {
LABEL_43:
      if ((v21 & 0x10) == 0)
        goto LABEL_44;
      goto LABEL_101;
    }
  }
  else if ((v21 & 0x2000) == 0)
  {
    goto LABEL_43;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 156));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v46 = CFSTR("totalTime");
  else
    v46 = CFSTR("total_time");
  objc_msgSend(v4, "setObject:forKey:", v45, v46);

  v21 = *(_DWORD *)(a1 + 164);
  if ((v21 & 0x10) == 0)
  {
LABEL_44:
    if ((v21 & 8) == 0)
      goto LABEL_45;
    goto LABEL_105;
  }
LABEL_101:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 120));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v48 = CFSTR("httpResponseCode");
  else
    v48 = CFSTR("http_response_code");
  objc_msgSend(v4, "setObject:forKey:", v47, v48);

  v21 = *(_DWORD *)(a1 + 164);
  if ((v21 & 8) == 0)
  {
LABEL_45:
    if ((v21 & 4) == 0)
      goto LABEL_46;
    goto LABEL_109;
  }
LABEL_105:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 116));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v50 = CFSTR("decodeTime");
  else
    v50 = CFSTR("decode_time");
  objc_msgSend(v4, "setObject:forKey:", v49, v50);

  v21 = *(_DWORD *)(a1 + 164);
  if ((v21 & 4) == 0)
  {
LABEL_46:
    if ((v21 & 1) == 0)
      goto LABEL_47;
    goto LABEL_113;
  }
LABEL_109:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 80));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v52 = CFSTR("requestStart");
  else
    v52 = CFSTR("request_start");
  objc_msgSend(v4, "setObject:forKey:", v51, v52);

  v21 = *(_DWORD *)(a1 + 164);
  if ((v21 & 1) == 0)
  {
LABEL_47:
    if ((v21 & 0x100) == 0)
      goto LABEL_52;
    goto LABEL_48;
  }
LABEL_113:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 48));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v54 = CFSTR("requestEnd");
  else
    v54 = CFSTR("request_end");
  objc_msgSend(v4, "setObject:forKey:", v53, v54);

  if ((*(_DWORD *)(a1 + 164) & 0x100) != 0)
  {
LABEL_48:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 136));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v23 = CFSTR("redirectCount");
    else
      v23 = CFSTR("redirect_count");
    objc_msgSend(v4, "setObject:forKey:", v22, v23);

  }
LABEL_52:
  objc_msgSend((id)a1, "manifestEnv");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    if (a2)
      v25 = CFSTR("manifestEnv");
    else
      v25 = CFSTR("manifest_env");
    objc_msgSend(v4, "setObject:forKey:", v24, v25);
  }

  v26 = *(_DWORD *)(a1 + 164);
  if ((v26 & 0x1000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 152));
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v56 = CFSTR("tilesetId");
    else
      v56 = CFSTR("tileset_id");
    objc_msgSend(v4, "setObject:forKey:", v55, v56);

    v26 = *(_DWORD *)(a1 + 164);
    if ((v26 & 0x20) == 0)
    {
LABEL_59:
      if ((v26 & 0x4000) == 0)
        goto LABEL_60;
LABEL_133:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 160));
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
        v62 = CFSTR("mptcpNegotiated");
      else
        v62 = CFSTR("mptcp_negotiated");
      objc_msgSend(v4, "setObject:forKey:", v61, v62);

      if ((*(_DWORD *)(a1 + 164) & 0x10000) == 0)
        goto LABEL_65;
      goto LABEL_61;
    }
  }
  else if ((v26 & 0x20) == 0)
  {
    goto LABEL_59;
  }
  v57 = *(int *)(a1 + 124);
  if (v57 >= 4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 124));
    v58 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v58 = off_1E1C225E0[v57];
  }
  if (a2)
    v60 = CFSTR("mptcpServiceType");
  else
    v60 = CFSTR("mptcp_service_type");
  objc_msgSend(v4, "setObject:forKey:", v58, v60);

  v26 = *(_DWORD *)(a1 + 164);
  if ((v26 & 0x4000) != 0)
    goto LABEL_133;
LABEL_60:
  if ((v26 & 0x10000) != 0)
  {
LABEL_61:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 162));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v28 = CFSTR("wasBackground");
    else
      v28 = CFSTR("was_background");
    objc_msgSend(v4, "setObject:forKey:", v27, v28);

  }
LABEL_65:
  objc_msgSend((id)a1, "serviceIpAddress");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (v29)
  {
    if (a2)
      v30 = CFSTR("serviceIpAddress");
    else
      v30 = CFSTR("service_ip_address");
    objc_msgSend(v4, "setObject:forKey:", v29, v30);
  }

  if ((*(_BYTE *)(a1 + 165) & 0x80) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 161));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v32 = CFSTR("rnfTriggered");
    else
      v32 = CFSTR("rnf_triggered");
    objc_msgSend(v4, "setObject:forKey:", v31, v32);

  }
  objc_msgSend((id)a1, "requestAppIdMajorVer");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (v33)
  {
    if (a2)
      v34 = CFSTR("requestAppIdMajorVer");
    else
      v34 = CFSTR("request_app_id_major_ver");
    objc_msgSend(v4, "setObject:forKey:", v33, v34);
  }

  objc_msgSend((id)a1, "requestAppIdMinorVer");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (v35)
  {
    if (a2)
      v36 = CFSTR("requestAppIdMinorVer");
    else
      v36 = CFSTR("request_app_id_minor_ver");
    objc_msgSend(v4, "setObject:forKey:", v35, v36);
  }

  if ((*(_BYTE *)(a1 + 165) & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 148));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v38 = CFSTR("samplingRate");
    else
      v38 = CFSTR("sampling_rate");
    objc_msgSend(v4, "setObject:forKey:", v37, v38);

  }
  objc_msgSend((id)a1, "taskMetrics");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v39;
  if (v39)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v39, "jsonRepresentation");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = CFSTR("taskMetrics");
    }
    else
    {
      objc_msgSend(v39, "dictionaryRepresentation");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = CFSTR("task_metrics");
    }
    objc_msgSend(v4, "setObject:forKey:", v41, v42);

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOLogMsgEventNetwork _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLogMsgEventNetwork)initWithDictionary:(id)a3
{
  return (GEOLogMsgEventNetwork *)-[GEOLogMsgEventNetwork _initWithDictionary:isJSON:](self, a3, 0);
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
  void *v21;
  const __CFString *v22;
  void *v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  const __CFString *v27;
  void *v28;
  const __CFString *v29;
  void *v30;
  const __CFString *v31;
  void *v32;
  const __CFString *v33;
  void *v34;
  const __CFString *v35;
  void *v36;
  const __CFString *v37;
  void *v38;
  const __CFString *v39;
  void *v40;
  void *v41;
  const __CFString *v42;
  void *v43;
  const __CFString *v44;
  void *v45;
  id v46;
  uint64_t v47;
  const __CFString *v48;
  void *v49;
  const __CFString *v50;
  void *v51;
  const __CFString *v52;
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
  const __CFString *v63;
  void *v64;
  const __CFString *v65;
  void *v66;
  GEONetworkSessionTaskTransactionMetrics *v67;
  uint64_t v68;
  void *v69;

  v5 = a2;
  if (!a1)
    goto LABEL_204;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_204;
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
    v10 = CFSTR("requestDataSize");
  else
    v10 = CFSTR("request_data_size");
  objc_msgSend(v5, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setRequestDataSize:", objc_msgSend(v11, "intValue"));

  if (a3)
    v12 = CFSTR("responseDataSize");
  else
    v12 = CFSTR("response_data_size");
  objc_msgSend(v5, "objectForKeyedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setResponseDataSize:", objc_msgSend(v13, "intValue"));

  if (a3)
    v14 = CFSTR("requestErrorDomain");
  else
    v14 = CFSTR("request_error_domain");
  objc_msgSend(v5, "objectForKeyedSubscript:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v16 = (void *)objc_msgSend(v15, "copy");
    objc_msgSend(a1, "setRequestErrorDomain:", v16);

  }
  if (a3)
    v17 = CFSTR("requestErrorCode");
  else
    v17 = CFSTR("request_error_code");
  objc_msgSend(v5, "objectForKeyedSubscript:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setRequestErrorCode:", objc_msgSend(v18, "longLongValue"));

  if (a3)
    v19 = CFSTR("requestErrorDescription");
  else
    v19 = CFSTR("request_error_description");
  objc_msgSend(v5, "objectForKeyedSubscript:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v21 = (void *)objc_msgSend(v20, "copy");
    objc_msgSend(a1, "setRequestErrorDescription:", v21);

  }
  if (a3)
    v22 = CFSTR("requestAppIdentifier");
  else
    v22 = CFSTR("request_app_identifier");
  objc_msgSend(v5, "objectForKeyedSubscript:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v24 = (void *)objc_msgSend(v23, "copy");
    objc_msgSend(a1, "setRequestAppIdentifier:", v24);

  }
  if (a3)
    v25 = CFSTR("queuedTime");
  else
    v25 = CFSTR("queued_time");
  objc_msgSend(v5, "objectForKeyedSubscript:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setQueuedTime:", objc_msgSend(v26, "intValue"));

  if (a3)
    v27 = CFSTR("totalTime");
  else
    v27 = CFSTR("total_time");
  objc_msgSend(v5, "objectForKeyedSubscript:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setTotalTime:", objc_msgSend(v28, "intValue"));

  if (a3)
    v29 = CFSTR("httpResponseCode");
  else
    v29 = CFSTR("http_response_code");
  objc_msgSend(v5, "objectForKeyedSubscript:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setHttpResponseCode:", objc_msgSend(v30, "intValue"));

  if (a3)
    v31 = CFSTR("decodeTime");
  else
    v31 = CFSTR("decode_time");
  objc_msgSend(v5, "objectForKeyedSubscript:", v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setDecodeTime:", objc_msgSend(v32, "intValue"));

  if (a3)
    v33 = CFSTR("requestStart");
  else
    v33 = CFSTR("request_start");
  objc_msgSend(v5, "objectForKeyedSubscript:", v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v34, "doubleValue");
    objc_msgSend(a1, "setRequestStart:");
  }

  if (a3)
    v35 = CFSTR("requestEnd");
  else
    v35 = CFSTR("request_end");
  objc_msgSend(v5, "objectForKeyedSubscript:", v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v36, "doubleValue");
    objc_msgSend(a1, "setRequestEnd:");
  }

  if (a3)
    v37 = CFSTR("redirectCount");
  else
    v37 = CFSTR("redirect_count");
  objc_msgSend(v5, "objectForKeyedSubscript:", v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setRedirectCount:", objc_msgSend(v38, "intValue"));

  if (a3)
    v39 = CFSTR("manifestEnv");
  else
    v39 = CFSTR("manifest_env");
  objc_msgSend(v5, "objectForKeyedSubscript:", v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v41 = (void *)objc_msgSend(v40, "copy");
    objc_msgSend(a1, "setManifestEnv:", v41);

  }
  if (a3)
    v42 = CFSTR("tilesetId");
  else
    v42 = CFSTR("tileset_id");
  objc_msgSend(v5, "objectForKeyedSubscript:", v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setTilesetId:", objc_msgSend(v43, "unsignedIntValue"));

  if (a3)
    v44 = CFSTR("mptcpServiceType");
  else
    v44 = CFSTR("mptcp_service_type");
  objc_msgSend(v5, "objectForKeyedSubscript:", v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v46 = v45;
    if ((objc_msgSend(v46, "isEqualToString:", CFSTR("NONE")) & 1) != 0)
    {
      v47 = 0;
    }
    else if ((objc_msgSend(v46, "isEqualToString:", CFSTR("HANDOVER")) & 1) != 0)
    {
      v47 = 1;
    }
    else if ((objc_msgSend(v46, "isEqualToString:", CFSTR("INTERACTIVE")) & 1) != 0)
    {
      v47 = 2;
    }
    else if (objc_msgSend(v46, "isEqualToString:", CFSTR("AGGREGATE")))
    {
      v47 = 3;
    }
    else
    {
      v47 = 0;
    }

    goto LABEL_159;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v47 = objc_msgSend(v45, "intValue");
LABEL_159:
    objc_msgSend(a1, "setMptcpServiceType:", v47);
  }

  if (a3)
    v48 = CFSTR("mptcpNegotiated");
  else
    v48 = CFSTR("mptcp_negotiated");
  objc_msgSend(v5, "objectForKeyedSubscript:", v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setMptcpNegotiated:", objc_msgSend(v49, "BOOLValue"));

  if (a3)
    v50 = CFSTR("wasBackground");
  else
    v50 = CFSTR("was_background");
  objc_msgSend(v5, "objectForKeyedSubscript:", v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setWasBackground:", objc_msgSend(v51, "BOOLValue"));

  if (a3)
    v52 = CFSTR("serviceIpAddress");
  else
    v52 = CFSTR("service_ip_address");
  objc_msgSend(v5, "objectForKeyedSubscript:", v52);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v54 = (void *)objc_msgSend(v53, "copy");
    objc_msgSend(a1, "setServiceIpAddress:", v54);

  }
  if (a3)
    v55 = CFSTR("rnfTriggered");
  else
    v55 = CFSTR("rnf_triggered");
  objc_msgSend(v5, "objectForKeyedSubscript:", v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setRnfTriggered:", objc_msgSend(v56, "BOOLValue"));

  if (a3)
    v57 = CFSTR("requestAppIdMajorVer");
  else
    v57 = CFSTR("request_app_id_major_ver");
  objc_msgSend(v5, "objectForKeyedSubscript:", v57);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v59 = (void *)objc_msgSend(v58, "copy");
    objc_msgSend(a1, "setRequestAppIdMajorVer:", v59);

  }
  if (a3)
    v60 = CFSTR("requestAppIdMinorVer");
  else
    v60 = CFSTR("request_app_id_minor_ver");
  objc_msgSend(v5, "objectForKeyedSubscript:", v60);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v62 = (void *)objc_msgSend(v61, "copy");
    objc_msgSend(a1, "setRequestAppIdMinorVer:", v62);

  }
  if (a3)
    v63 = CFSTR("samplingRate");
  else
    v63 = CFSTR("sampling_rate");
  objc_msgSend(v5, "objectForKeyedSubscript:", v63);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setSamplingRate:", objc_msgSend(v64, "unsignedIntValue"));

  if (a3)
    v65 = CFSTR("taskMetrics");
  else
    v65 = CFSTR("task_metrics");
  objc_msgSend(v5, "objectForKeyedSubscript:", v65);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v67 = [GEONetworkSessionTaskTransactionMetrics alloc];
    if ((a3 & 1) != 0)
      v68 = -[GEONetworkSessionTaskTransactionMetrics initWithJSON:](v67, "initWithJSON:", v66);
    else
      v68 = -[GEONetworkSessionTaskTransactionMetrics initWithDictionary:](v67, "initWithDictionary:", v66);
    v69 = (void *)v68;
    objc_msgSend(a1, "setTaskMetrics:", v68);

  }
LABEL_204:

  return a1;
}

- (GEOLogMsgEventNetwork)initWithJSON:(id)a3
{
  return (GEOLogMsgEventNetwork *)-[GEOLogMsgEventNetwork _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_3066;
    else
      v8 = (int *)&readAll__nonRecursiveTag_3067;
    GEOLogMsgEventNetworkReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    -[GEONetworkSessionTaskTransactionMetrics readAll:](self->_taskMetrics, "readAll:", 1);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgEventNetworkIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgEventNetworkReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  $DB617B79121746748C766C9C19229AA4 flags;
  $DB617B79121746748C766C9C19229AA4 v6;
  $DB617B79121746748C766C9C19229AA4 v7;
  PBDataReader *v8;
  void *v9;
  id v10;

  v10 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader)
  {
    os_unfair_lock_assert_owner(&self->_readerLock);
    if ((*((_WORD *)&self->_flags + 1) & 0x3FE) == 0)
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
      goto LABEL_57;
    }
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOLogMsgEventNetwork readAll:](self, "readAll:", 0);
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 0x40) != 0)
  {
    PBDataWriterWriteInt32Field();
    flags = self->_flags;
    if ((*(_WORD *)&flags & 0x200) == 0)
    {
LABEL_5:
      if ((*(_WORD *)&flags & 0x400) == 0)
        goto LABEL_7;
      goto LABEL_6;
    }
  }
  else if ((*(_WORD *)&flags & 0x200) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteInt32Field();
  if ((*(_DWORD *)&self->_flags & 0x400) != 0)
LABEL_6:
    PBDataWriterWriteInt32Field();
LABEL_7:
  if (self->_requestErrorDomain)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_flags & 2) != 0)
    PBDataWriterWriteInt64Field();
  if (self->_requestErrorDescription)
    PBDataWriterWriteStringField();
  if (self->_requestAppIdentifier)
    PBDataWriterWriteStringField();
  v6 = self->_flags;
  if ((*(_BYTE *)&v6 & 0x80) != 0)
  {
    PBDataWriterWriteInt32Field();
    v6 = self->_flags;
    if ((*(_WORD *)&v6 & 0x2000) == 0)
    {
LABEL_17:
      if ((*(_BYTE *)&v6 & 0x10) == 0)
        goto LABEL_18;
      goto LABEL_47;
    }
  }
  else if ((*(_WORD *)&v6 & 0x2000) == 0)
  {
    goto LABEL_17;
  }
  PBDataWriterWriteInt32Field();
  v6 = self->_flags;
  if ((*(_BYTE *)&v6 & 0x10) == 0)
  {
LABEL_18:
    if ((*(_BYTE *)&v6 & 8) == 0)
      goto LABEL_19;
    goto LABEL_48;
  }
LABEL_47:
  PBDataWriterWriteInt32Field();
  v6 = self->_flags;
  if ((*(_BYTE *)&v6 & 8) == 0)
  {
LABEL_19:
    if ((*(_BYTE *)&v6 & 4) == 0)
      goto LABEL_20;
    goto LABEL_49;
  }
LABEL_48:
  PBDataWriterWriteInt32Field();
  v6 = self->_flags;
  if ((*(_BYTE *)&v6 & 4) == 0)
  {
LABEL_20:
    if ((*(_BYTE *)&v6 & 1) == 0)
      goto LABEL_21;
    goto LABEL_50;
  }
LABEL_49:
  PBDataWriterWriteDoubleField();
  v6 = self->_flags;
  if ((*(_BYTE *)&v6 & 1) == 0)
  {
LABEL_21:
    if ((*(_WORD *)&v6 & 0x100) == 0)
      goto LABEL_23;
    goto LABEL_22;
  }
LABEL_50:
  PBDataWriterWriteDoubleField();
  if ((*(_DWORD *)&self->_flags & 0x100) != 0)
LABEL_22:
    PBDataWriterWriteInt32Field();
LABEL_23:
  if (self->_manifestEnv)
    PBDataWriterWriteStringField();
  v7 = self->_flags;
  if ((*(_WORD *)&v7 & 0x1000) != 0)
  {
    PBDataWriterWriteUint32Field();
    v7 = self->_flags;
    if ((*(_BYTE *)&v7 & 0x20) == 0)
    {
LABEL_27:
      if ((*(_WORD *)&v7 & 0x4000) == 0)
        goto LABEL_28;
LABEL_54:
      PBDataWriterWriteBOOLField();
      if ((*(_DWORD *)&self->_flags & 0x10000) == 0)
        goto LABEL_30;
      goto LABEL_29;
    }
  }
  else if ((*(_BYTE *)&v7 & 0x20) == 0)
  {
    goto LABEL_27;
  }
  PBDataWriterWriteInt32Field();
  v7 = self->_flags;
  if ((*(_WORD *)&v7 & 0x4000) != 0)
    goto LABEL_54;
LABEL_28:
  if ((*(_DWORD *)&v7 & 0x10000) != 0)
LABEL_29:
    PBDataWriterWriteBOOLField();
LABEL_30:
  if (self->_serviceIpAddress)
    PBDataWriterWriteStringField();
  if ((*((_BYTE *)&self->_flags + 1) & 0x80) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_requestAppIdMajorVer)
    PBDataWriterWriteStringField();
  if (self->_requestAppIdMinorVer)
    PBDataWriterWriteStringField();
  if ((*((_BYTE *)&self->_flags + 1) & 8) != 0)
    PBDataWriterWriteUint32Field();
  if (self->_taskMetrics)
    PBDataWriterWriteSubmessage();
LABEL_57:

}

- (void)copyTo:(id)a3
{
  id *v4;
  $DB617B79121746748C766C9C19229AA4 flags;
  $DB617B79121746748C766C9C19229AA4 v6;
  $DB617B79121746748C766C9C19229AA4 v7;
  id *v8;

  v8 = (id *)a3;
  -[GEOLogMsgEventNetwork readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v8 + 1, self->_reader);
  *((_DWORD *)v8 + 26) = self->_readerMarkPos;
  *((_DWORD *)v8 + 27) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  v4 = v8;
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 0x40) != 0)
  {
    *((_DWORD *)v8 + 32) = self->_networkService;
    *((_DWORD *)v8 + 41) |= 0x40u;
    flags = self->_flags;
    if ((*(_WORD *)&flags & 0x200) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&flags & 0x400) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_WORD *)&flags & 0x200) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v8 + 35) = self->_requestDataSize;
  *((_DWORD *)v8 + 41) |= 0x200u;
  if ((*(_DWORD *)&self->_flags & 0x400) != 0)
  {
LABEL_4:
    *((_DWORD *)v8 + 36) = self->_responseDataSize;
    *((_DWORD *)v8 + 41) |= 0x400u;
  }
LABEL_5:
  if (self->_requestErrorDomain)
  {
    objc_msgSend(v8, "setRequestErrorDomain:");
    v4 = v8;
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    v4[7] = (id)self->_requestErrorCode;
    *((_DWORD *)v4 + 41) |= 2u;
  }
  if (self->_requestErrorDescription)
  {
    objc_msgSend(v8, "setRequestErrorDescription:");
    v4 = v8;
  }
  if (self->_requestAppIdentifier)
  {
    objc_msgSend(v8, "setRequestAppIdentifier:");
    v4 = v8;
  }
  v6 = self->_flags;
  if ((*(_BYTE *)&v6 & 0x80) != 0)
  {
    *((_DWORD *)v4 + 33) = self->_queuedTime;
    *((_DWORD *)v4 + 41) |= 0x80u;
    v6 = self->_flags;
    if ((*(_WORD *)&v6 & 0x2000) == 0)
    {
LABEL_15:
      if ((*(_BYTE *)&v6 & 0x10) == 0)
        goto LABEL_16;
      goto LABEL_46;
    }
  }
  else if ((*(_WORD *)&v6 & 0x2000) == 0)
  {
    goto LABEL_15;
  }
  *((_DWORD *)v4 + 39) = self->_totalTime;
  *((_DWORD *)v4 + 41) |= 0x2000u;
  v6 = self->_flags;
  if ((*(_BYTE *)&v6 & 0x10) == 0)
  {
LABEL_16:
    if ((*(_BYTE *)&v6 & 8) == 0)
      goto LABEL_17;
    goto LABEL_47;
  }
LABEL_46:
  *((_DWORD *)v4 + 30) = self->_httpResponseCode;
  *((_DWORD *)v4 + 41) |= 0x10u;
  v6 = self->_flags;
  if ((*(_BYTE *)&v6 & 8) == 0)
  {
LABEL_17:
    if ((*(_BYTE *)&v6 & 4) == 0)
      goto LABEL_18;
    goto LABEL_48;
  }
LABEL_47:
  *((_DWORD *)v4 + 29) = self->_decodeTime;
  *((_DWORD *)v4 + 41) |= 8u;
  v6 = self->_flags;
  if ((*(_BYTE *)&v6 & 4) == 0)
  {
LABEL_18:
    if ((*(_BYTE *)&v6 & 1) == 0)
      goto LABEL_19;
    goto LABEL_49;
  }
LABEL_48:
  v4[10] = *(id *)&self->_requestStart;
  *((_DWORD *)v4 + 41) |= 4u;
  v6 = self->_flags;
  if ((*(_BYTE *)&v6 & 1) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&v6 & 0x100) == 0)
      goto LABEL_21;
    goto LABEL_20;
  }
LABEL_49:
  v4[6] = *(id *)&self->_requestEnd;
  *((_DWORD *)v4 + 41) |= 1u;
  if ((*(_DWORD *)&self->_flags & 0x100) != 0)
  {
LABEL_20:
    *((_DWORD *)v4 + 34) = self->_redirectCount;
    *((_DWORD *)v4 + 41) |= 0x100u;
  }
LABEL_21:
  if (self->_manifestEnv)
  {
    objc_msgSend(v8, "setManifestEnv:");
    v4 = v8;
  }
  v7 = self->_flags;
  if ((*(_WORD *)&v7 & 0x1000) != 0)
  {
    *((_DWORD *)v4 + 38) = self->_tilesetId;
    *((_DWORD *)v4 + 41) |= 0x1000u;
    v7 = self->_flags;
    if ((*(_BYTE *)&v7 & 0x20) == 0)
    {
LABEL_25:
      if ((*(_WORD *)&v7 & 0x4000) == 0)
        goto LABEL_26;
      goto LABEL_53;
    }
  }
  else if ((*(_BYTE *)&v7 & 0x20) == 0)
  {
    goto LABEL_25;
  }
  *((_DWORD *)v4 + 31) = self->_mptcpServiceType;
  *((_DWORD *)v4 + 41) |= 0x20u;
  v7 = self->_flags;
  if ((*(_WORD *)&v7 & 0x4000) == 0)
  {
LABEL_26:
    if ((*(_DWORD *)&v7 & 0x10000) == 0)
      goto LABEL_28;
    goto LABEL_27;
  }
LABEL_53:
  *((_BYTE *)v4 + 160) = self->_mptcpNegotiated;
  *((_DWORD *)v4 + 41) |= 0x4000u;
  if ((*(_DWORD *)&self->_flags & 0x10000) != 0)
  {
LABEL_27:
    *((_BYTE *)v4 + 162) = self->_wasBackground;
    *((_DWORD *)v4 + 41) |= 0x10000u;
  }
LABEL_28:
  if (self->_serviceIpAddress)
  {
    objc_msgSend(v8, "setServiceIpAddress:");
    v4 = v8;
  }
  if ((*((_BYTE *)&self->_flags + 1) & 0x80) != 0)
  {
    *((_BYTE *)v4 + 161) = self->_rnfTriggered;
    *((_DWORD *)v4 + 41) |= 0x8000u;
  }
  if (self->_requestAppIdMajorVer)
  {
    objc_msgSend(v8, "setRequestAppIdMajorVer:");
    v4 = v8;
  }
  if (self->_requestAppIdMinorVer)
  {
    objc_msgSend(v8, "setRequestAppIdMinorVer:");
    v4 = v8;
  }
  if ((*((_BYTE *)&self->_flags + 1) & 8) != 0)
  {
    *((_DWORD *)v4 + 37) = self->_samplingRate;
    *((_DWORD *)v4 + 41) |= 0x800u;
  }
  if (self->_taskMetrics)
  {
    objc_msgSend(v8, "setTaskMetrics:");
    v4 = v8;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  $DB617B79121746748C766C9C19229AA4 flags;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  $DB617B79121746748C766C9C19229AA4 v16;
  uint64_t v17;
  void *v18;
  $DB617B79121746748C766C9C19229AA4 v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  id v26;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*((_BYTE *)&self->_flags + 3) & 2) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOLogMsgEventNetworkReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_29;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOLogMsgEventNetwork readAll:](self, "readAll:", 0);
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 0x40) != 0)
  {
    *(_DWORD *)(v5 + 128) = self->_networkService;
    *(_DWORD *)(v5 + 164) |= 0x40u;
    flags = self->_flags;
    if ((*(_WORD *)&flags & 0x200) == 0)
    {
LABEL_7:
      if ((*(_WORD *)&flags & 0x400) == 0)
        goto LABEL_9;
      goto LABEL_8;
    }
  }
  else if ((*(_WORD *)&flags & 0x200) == 0)
  {
    goto LABEL_7;
  }
  *(_DWORD *)(v5 + 140) = self->_requestDataSize;
  *(_DWORD *)(v5 + 164) |= 0x200u;
  if ((*(_DWORD *)&self->_flags & 0x400) != 0)
  {
LABEL_8:
    *(_DWORD *)(v5 + 144) = self->_responseDataSize;
    *(_DWORD *)(v5 + 164) |= 0x400u;
  }
LABEL_9:
  v10 = -[NSString copyWithZone:](self->_requestErrorDomain, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v10;

  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    *(_QWORD *)(v5 + 56) = self->_requestErrorCode;
    *(_DWORD *)(v5 + 164) |= 2u;
  }
  v12 = -[NSString copyWithZone:](self->_requestErrorDescription, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v12;

  v14 = -[NSString copyWithZone:](self->_requestAppIdentifier, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v14;

  v16 = self->_flags;
  if ((*(_BYTE *)&v16 & 0x80) != 0)
  {
    *(_DWORD *)(v5 + 132) = self->_queuedTime;
    *(_DWORD *)(v5 + 164) |= 0x80u;
    v16 = self->_flags;
    if ((*(_WORD *)&v16 & 0x2000) == 0)
    {
LABEL_13:
      if ((*(_BYTE *)&v16 & 0x10) == 0)
        goto LABEL_14;
      goto LABEL_35;
    }
  }
  else if ((*(_WORD *)&v16 & 0x2000) == 0)
  {
    goto LABEL_13;
  }
  *(_DWORD *)(v5 + 156) = self->_totalTime;
  *(_DWORD *)(v5 + 164) |= 0x2000u;
  v16 = self->_flags;
  if ((*(_BYTE *)&v16 & 0x10) == 0)
  {
LABEL_14:
    if ((*(_BYTE *)&v16 & 8) == 0)
      goto LABEL_15;
    goto LABEL_36;
  }
LABEL_35:
  *(_DWORD *)(v5 + 120) = self->_httpResponseCode;
  *(_DWORD *)(v5 + 164) |= 0x10u;
  v16 = self->_flags;
  if ((*(_BYTE *)&v16 & 8) == 0)
  {
LABEL_15:
    if ((*(_BYTE *)&v16 & 4) == 0)
      goto LABEL_16;
    goto LABEL_37;
  }
LABEL_36:
  *(_DWORD *)(v5 + 116) = self->_decodeTime;
  *(_DWORD *)(v5 + 164) |= 8u;
  v16 = self->_flags;
  if ((*(_BYTE *)&v16 & 4) == 0)
  {
LABEL_16:
    if ((*(_BYTE *)&v16 & 1) == 0)
      goto LABEL_17;
    goto LABEL_38;
  }
LABEL_37:
  *(double *)(v5 + 80) = self->_requestStart;
  *(_DWORD *)(v5 + 164) |= 4u;
  v16 = self->_flags;
  if ((*(_BYTE *)&v16 & 1) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&v16 & 0x100) == 0)
      goto LABEL_19;
    goto LABEL_18;
  }
LABEL_38:
  *(double *)(v5 + 48) = self->_requestEnd;
  *(_DWORD *)(v5 + 164) |= 1u;
  if ((*(_DWORD *)&self->_flags & 0x100) != 0)
  {
LABEL_18:
    *(_DWORD *)(v5 + 136) = self->_redirectCount;
    *(_DWORD *)(v5 + 164) |= 0x100u;
  }
LABEL_19:
  v17 = -[NSString copyWithZone:](self->_manifestEnv, "copyWithZone:", a3);
  v18 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v17;

  v19 = self->_flags;
  if ((*(_WORD *)&v19 & 0x1000) != 0)
  {
    *(_DWORD *)(v5 + 152) = self->_tilesetId;
    *(_DWORD *)(v5 + 164) |= 0x1000u;
    v19 = self->_flags;
    if ((*(_BYTE *)&v19 & 0x20) == 0)
    {
LABEL_21:
      if ((*(_WORD *)&v19 & 0x4000) == 0)
        goto LABEL_22;
LABEL_42:
      *(_BYTE *)(v5 + 160) = self->_mptcpNegotiated;
      *(_DWORD *)(v5 + 164) |= 0x4000u;
      if ((*(_DWORD *)&self->_flags & 0x10000) == 0)
        goto LABEL_24;
      goto LABEL_23;
    }
  }
  else if ((*(_BYTE *)&v19 & 0x20) == 0)
  {
    goto LABEL_21;
  }
  *(_DWORD *)(v5 + 124) = self->_mptcpServiceType;
  *(_DWORD *)(v5 + 164) |= 0x20u;
  v19 = self->_flags;
  if ((*(_WORD *)&v19 & 0x4000) != 0)
    goto LABEL_42;
LABEL_22:
  if ((*(_DWORD *)&v19 & 0x10000) != 0)
  {
LABEL_23:
    *(_BYTE *)(v5 + 162) = self->_wasBackground;
    *(_DWORD *)(v5 + 164) |= 0x10000u;
  }
LABEL_24:
  v20 = -[NSString copyWithZone:](self->_serviceIpAddress, "copyWithZone:", a3);
  v21 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v20;

  if ((*((_BYTE *)&self->_flags + 1) & 0x80) != 0)
  {
    *(_BYTE *)(v5 + 161) = self->_rnfTriggered;
    *(_DWORD *)(v5 + 164) |= 0x8000u;
  }
  v22 = -[NSString copyWithZone:](self->_requestAppIdMajorVer, "copyWithZone:", a3);
  v23 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v22;

  v24 = -[NSString copyWithZone:](self->_requestAppIdMinorVer, "copyWithZone:", a3);
  v25 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v24;

  if ((*((_BYTE *)&self->_flags + 1) & 8) != 0)
  {
    *(_DWORD *)(v5 + 148) = self->_samplingRate;
    *(_DWORD *)(v5 + 164) |= 0x800u;
  }
  v26 = -[GEONetworkSessionTaskTransactionMetrics copyWithZone:](self->_taskMetrics, "copyWithZone:", a3);
  v8 = *(id *)(v5 + 96);
  *(_QWORD *)(v5 + 96) = v26;
LABEL_29:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  $DB617B79121746748C766C9C19229AA4 flags;
  int v6;
  NSString *requestErrorDomain;
  NSString *requestErrorDescription;
  NSString *requestAppIdentifier;
  $DB617B79121746748C766C9C19229AA4 v10;
  int v11;
  NSString *manifestEnv;
  NSString *serviceIpAddress;
  NSString *requestAppIdMajorVer;
  NSString *requestAppIdMinorVer;
  int v16;
  GEONetworkSessionTaskTransactionMetrics *taskMetrics;
  char v18;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_115;
  -[GEOLogMsgEventNetwork readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  flags = self->_flags;
  v6 = *((_DWORD *)v4 + 41);
  if ((*(_BYTE *)&flags & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_networkService != *((_DWORD *)v4 + 32))
      goto LABEL_115;
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_115;
  }
  if ((*(_WORD *)&flags & 0x200) != 0)
  {
    if ((v6 & 0x200) == 0 || self->_requestDataSize != *((_DWORD *)v4 + 35))
      goto LABEL_115;
  }
  else if ((v6 & 0x200) != 0)
  {
    goto LABEL_115;
  }
  if ((*(_WORD *)&flags & 0x400) != 0)
  {
    if ((v6 & 0x400) == 0 || self->_responseDataSize != *((_DWORD *)v4 + 36))
      goto LABEL_115;
  }
  else if ((v6 & 0x400) != 0)
  {
    goto LABEL_115;
  }
  requestErrorDomain = self->_requestErrorDomain;
  if ((unint64_t)requestErrorDomain | *((_QWORD *)v4 + 9))
  {
    if (!-[NSString isEqual:](requestErrorDomain, "isEqual:"))
      goto LABEL_115;
    flags = self->_flags;
    v6 = *((_DWORD *)v4 + 41);
  }
  if ((*(_BYTE *)&flags & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_requestErrorCode != *((_QWORD *)v4 + 7))
      goto LABEL_115;
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_115;
  }
  requestErrorDescription = self->_requestErrorDescription;
  if ((unint64_t)requestErrorDescription | *((_QWORD *)v4 + 8)
    && !-[NSString isEqual:](requestErrorDescription, "isEqual:"))
  {
    goto LABEL_115;
  }
  requestAppIdentifier = self->_requestAppIdentifier;
  if ((unint64_t)requestAppIdentifier | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](requestAppIdentifier, "isEqual:"))
      goto LABEL_115;
  }
  v10 = self->_flags;
  v11 = *((_DWORD *)v4 + 41);
  if ((*(_BYTE *)&v10 & 0x80) != 0)
  {
    if ((v11 & 0x80) == 0 || self->_queuedTime != *((_DWORD *)v4 + 33))
      goto LABEL_115;
  }
  else if ((v11 & 0x80) != 0)
  {
    goto LABEL_115;
  }
  if ((*(_WORD *)&v10 & 0x2000) != 0)
  {
    if ((v11 & 0x2000) == 0 || self->_totalTime != *((_DWORD *)v4 + 39))
      goto LABEL_115;
  }
  else if ((v11 & 0x2000) != 0)
  {
    goto LABEL_115;
  }
  if ((*(_BYTE *)&v10 & 0x10) != 0)
  {
    if ((v11 & 0x10) == 0 || self->_httpResponseCode != *((_DWORD *)v4 + 30))
      goto LABEL_115;
  }
  else if ((v11 & 0x10) != 0)
  {
    goto LABEL_115;
  }
  if ((*(_BYTE *)&v10 & 8) != 0)
  {
    if ((v11 & 8) == 0 || self->_decodeTime != *((_DWORD *)v4 + 29))
      goto LABEL_115;
  }
  else if ((v11 & 8) != 0)
  {
    goto LABEL_115;
  }
  if ((*(_BYTE *)&v10 & 4) != 0)
  {
    if ((v11 & 4) == 0 || self->_requestStart != *((double *)v4 + 10))
      goto LABEL_115;
  }
  else if ((v11 & 4) != 0)
  {
    goto LABEL_115;
  }
  if ((*(_BYTE *)&v10 & 1) != 0)
  {
    if ((v11 & 1) == 0 || self->_requestEnd != *((double *)v4 + 6))
      goto LABEL_115;
  }
  else if ((v11 & 1) != 0)
  {
    goto LABEL_115;
  }
  if ((*(_WORD *)&v10 & 0x100) != 0)
  {
    if ((v11 & 0x100) == 0 || self->_redirectCount != *((_DWORD *)v4 + 34))
      goto LABEL_115;
  }
  else if ((v11 & 0x100) != 0)
  {
    goto LABEL_115;
  }
  manifestEnv = self->_manifestEnv;
  if ((unint64_t)manifestEnv | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](manifestEnv, "isEqual:"))
      goto LABEL_115;
    v10 = self->_flags;
    v11 = *((_DWORD *)v4 + 41);
  }
  if ((*(_WORD *)&v10 & 0x1000) != 0)
  {
    if ((v11 & 0x1000) == 0 || self->_tilesetId != *((_DWORD *)v4 + 38))
      goto LABEL_115;
  }
  else if ((v11 & 0x1000) != 0)
  {
    goto LABEL_115;
  }
  if ((*(_BYTE *)&v10 & 0x20) != 0)
  {
    if ((v11 & 0x20) == 0 || self->_mptcpServiceType != *((_DWORD *)v4 + 31))
      goto LABEL_115;
  }
  else if ((v11 & 0x20) != 0)
  {
    goto LABEL_115;
  }
  if ((*(_WORD *)&v10 & 0x4000) != 0)
  {
    if ((v11 & 0x4000) == 0)
      goto LABEL_115;
    if (self->_mptcpNegotiated)
    {
      if (!*((_BYTE *)v4 + 160))
        goto LABEL_115;
    }
    else if (*((_BYTE *)v4 + 160))
    {
      goto LABEL_115;
    }
  }
  else if ((v11 & 0x4000) != 0)
  {
    goto LABEL_115;
  }
  if ((*(_DWORD *)&v10 & 0x10000) != 0)
  {
    if ((v11 & 0x10000) == 0)
      goto LABEL_115;
    if (self->_wasBackground)
    {
      if (!*((_BYTE *)v4 + 162))
        goto LABEL_115;
    }
    else if (*((_BYTE *)v4 + 162))
    {
      goto LABEL_115;
    }
  }
  else if ((v11 & 0x10000) != 0)
  {
    goto LABEL_115;
  }
  serviceIpAddress = self->_serviceIpAddress;
  if ((unint64_t)serviceIpAddress | *((_QWORD *)v4 + 11))
  {
    if (!-[NSString isEqual:](serviceIpAddress, "isEqual:"))
      goto LABEL_115;
    v10 = self->_flags;
    v11 = *((_DWORD *)v4 + 41);
  }
  if ((*(_WORD *)&v10 & 0x8000) != 0)
  {
    if ((v11 & 0x8000) != 0)
    {
      if (self->_rnfTriggered)
      {
        if (!*((_BYTE *)v4 + 161))
          goto LABEL_115;
        goto LABEL_104;
      }
      if (!*((_BYTE *)v4 + 161))
        goto LABEL_104;
    }
LABEL_115:
    v18 = 0;
    goto LABEL_116;
  }
  if ((v11 & 0x8000) != 0)
    goto LABEL_115;
LABEL_104:
  requestAppIdMajorVer = self->_requestAppIdMajorVer;
  if ((unint64_t)requestAppIdMajorVer | *((_QWORD *)v4 + 3)
    && !-[NSString isEqual:](requestAppIdMajorVer, "isEqual:"))
  {
    goto LABEL_115;
  }
  requestAppIdMinorVer = self->_requestAppIdMinorVer;
  if ((unint64_t)requestAppIdMinorVer | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](requestAppIdMinorVer, "isEqual:"))
      goto LABEL_115;
  }
  v16 = *((_DWORD *)v4 + 41);
  if ((*((_BYTE *)&self->_flags + 1) & 8) != 0)
  {
    if ((v16 & 0x800) == 0 || self->_samplingRate != *((_DWORD *)v4 + 37))
      goto LABEL_115;
  }
  else if ((v16 & 0x800) != 0)
  {
    goto LABEL_115;
  }
  taskMetrics = self->_taskMetrics;
  if ((unint64_t)taskMetrics | *((_QWORD *)v4 + 12))
    v18 = -[GEONetworkSessionTaskTransactionMetrics isEqual:](taskMetrics, "isEqual:");
  else
    v18 = 1;
LABEL_116:

  return v18;
}

- (unint64_t)hash
{
  $DB617B79121746748C766C9C19229AA4 flags;
  $DB617B79121746748C766C9C19229AA4 v4;
  double requestStart;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;
  unint64_t v10;
  double requestEnd;
  double v12;
  long double v13;
  double v14;
  $DB617B79121746748C766C9C19229AA4 v15;
  uint64_t v16;
  uint64_t v17;
  NSUInteger v18;
  uint64_t v19;
  NSUInteger v20;
  NSUInteger v21;
  uint64_t v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSUInteger v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  NSUInteger v34;
  NSUInteger v35;
  uint64_t v36;
  NSUInteger v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;

  -[GEOLogMsgEventNetwork readAll:](self, "readAll:", 1);
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 0x40) == 0)
  {
    v40 = 0;
    if ((*(_WORD *)&flags & 0x200) != 0)
      goto LABEL_3;
LABEL_6:
    v39 = 0;
    if ((*(_WORD *)&flags & 0x400) != 0)
      goto LABEL_4;
    goto LABEL_7;
  }
  v40 = 2654435761 * self->_networkService;
  if ((*(_WORD *)&flags & 0x200) == 0)
    goto LABEL_6;
LABEL_3:
  v39 = 2654435761 * self->_requestDataSize;
  if ((*(_WORD *)&flags & 0x400) != 0)
  {
LABEL_4:
    v38 = 2654435761 * self->_responseDataSize;
    goto LABEL_8;
  }
LABEL_7:
  v38 = 0;
LABEL_8:
  v37 = -[NSString hash](self->_requestErrorDomain, "hash");
  if ((*(_BYTE *)&self->_flags & 2) != 0)
    v36 = 2654435761 * self->_requestErrorCode;
  else
    v36 = 0;
  v35 = -[NSString hash](self->_requestErrorDescription, "hash");
  v34 = -[NSString hash](self->_requestAppIdentifier, "hash");
  v4 = self->_flags;
  if ((*(_BYTE *)&v4 & 0x80) != 0)
  {
    v33 = 2654435761 * self->_queuedTime;
    if ((*(_WORD *)&v4 & 0x2000) != 0)
    {
LABEL_13:
      v32 = 2654435761 * self->_totalTime;
      if ((*(_BYTE *)&v4 & 0x10) != 0)
        goto LABEL_14;
      goto LABEL_22;
    }
  }
  else
  {
    v33 = 0;
    if ((*(_WORD *)&v4 & 0x2000) != 0)
      goto LABEL_13;
  }
  v32 = 0;
  if ((*(_BYTE *)&v4 & 0x10) != 0)
  {
LABEL_14:
    v31 = 2654435761 * self->_httpResponseCode;
    if ((*(_BYTE *)&v4 & 8) != 0)
      goto LABEL_15;
LABEL_23:
    v30 = 0;
    if ((*(_BYTE *)&v4 & 4) != 0)
      goto LABEL_16;
LABEL_24:
    v9 = 0;
    goto LABEL_27;
  }
LABEL_22:
  v31 = 0;
  if ((*(_BYTE *)&v4 & 8) == 0)
    goto LABEL_23;
LABEL_15:
  v30 = 2654435761 * self->_decodeTime;
  if ((*(_BYTE *)&v4 & 4) == 0)
    goto LABEL_24;
LABEL_16:
  requestStart = self->_requestStart;
  v6 = -requestStart;
  if (requestStart >= 0.0)
    v6 = self->_requestStart;
  v7 = floor(v6 + 0.5);
  v8 = (v6 - v7) * 1.84467441e19;
  v9 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
  if (v8 >= 0.0)
  {
    if (v8 > 0.0)
      v9 += (unint64_t)v8;
  }
  else
  {
    v9 -= (unint64_t)fabs(v8);
  }
LABEL_27:
  if ((*(_BYTE *)&v4 & 1) != 0)
  {
    requestEnd = self->_requestEnd;
    v12 = -requestEnd;
    if (requestEnd >= 0.0)
      v12 = self->_requestEnd;
    v13 = floor(v12 + 0.5);
    v14 = (v12 - v13) * 1.84467441e19;
    v10 = 2654435761u * (unint64_t)fmod(v13, 1.84467441e19);
    if (v14 >= 0.0)
    {
      if (v14 > 0.0)
        v10 += (unint64_t)v14;
    }
    else
    {
      v10 -= (unint64_t)fabs(v14);
    }
  }
  else
  {
    v10 = 0;
  }
  v29 = v10;
  if ((*(_WORD *)&v4 & 0x100) != 0)
    v28 = 2654435761 * self->_redirectCount;
  else
    v28 = 0;
  v27 = -[NSString hash](self->_manifestEnv, "hash");
  v15 = self->_flags;
  if ((*(_WORD *)&v15 & 0x1000) != 0)
  {
    v26 = 2654435761 * self->_tilesetId;
    if ((*(_BYTE *)&v15 & 0x20) != 0)
    {
LABEL_40:
      v24 = 2654435761 * self->_mptcpServiceType;
      if ((*(_WORD *)&v15 & 0x4000) != 0)
        goto LABEL_41;
LABEL_45:
      v16 = 0;
      if ((*(_DWORD *)&v15 & 0x10000) != 0)
        goto LABEL_42;
      goto LABEL_46;
    }
  }
  else
  {
    v26 = 0;
    if ((*(_BYTE *)&v15 & 0x20) != 0)
      goto LABEL_40;
  }
  v24 = 0;
  if ((*(_WORD *)&v15 & 0x4000) == 0)
    goto LABEL_45;
LABEL_41:
  v16 = 2654435761 * self->_mptcpNegotiated;
  if ((*(_DWORD *)&v15 & 0x10000) != 0)
  {
LABEL_42:
    v17 = 2654435761 * self->_wasBackground;
    goto LABEL_47;
  }
LABEL_46:
  v17 = 0;
LABEL_47:
  v18 = -[NSString hash](self->_serviceIpAddress, "hash", v24);
  if ((*((_BYTE *)&self->_flags + 1) & 0x80) != 0)
    v19 = 2654435761 * self->_rnfTriggered;
  else
    v19 = 0;
  v20 = -[NSString hash](self->_requestAppIdMajorVer, "hash");
  v21 = -[NSString hash](self->_requestAppIdMinorVer, "hash");
  if ((*((_BYTE *)&self->_flags + 1) & 8) != 0)
    v22 = 2654435761 * self->_samplingRate;
  else
    v22 = 0;
  return v39 ^ v40 ^ v38 ^ v36 ^ v37 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v9 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ -[GEONetworkSessionTaskTransactionMetrics hash](self->_taskMetrics, "hash");
}

- (void)mergeFrom:(id)a3
{
  int *v4;
  int v5;
  int v6;
  int v7;
  GEONetworkSessionTaskTransactionMetrics *taskMetrics;
  uint64_t v9;
  int *v10;

  v10 = (int *)a3;
  objc_msgSend(v10, "readAll:", 0);
  v4 = v10;
  v5 = v10[41];
  if ((v5 & 0x40) != 0)
  {
    self->_networkService = v10[32];
    *(_DWORD *)&self->_flags |= 0x40u;
    v5 = v10[41];
    if ((v5 & 0x200) == 0)
    {
LABEL_3:
      if ((v5 & 0x400) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((v5 & 0x200) == 0)
  {
    goto LABEL_3;
  }
  self->_requestDataSize = v10[35];
  *(_DWORD *)&self->_flags |= 0x200u;
  if ((v10[41] & 0x400) != 0)
  {
LABEL_4:
    self->_responseDataSize = v10[36];
    *(_DWORD *)&self->_flags |= 0x400u;
  }
LABEL_5:
  if (*((_QWORD *)v10 + 9))
  {
    -[GEOLogMsgEventNetwork setRequestErrorDomain:](self, "setRequestErrorDomain:");
    v4 = v10;
  }
  if ((v4[41] & 2) != 0)
  {
    self->_requestErrorCode = *((_QWORD *)v4 + 7);
    *(_DWORD *)&self->_flags |= 2u;
  }
  if (*((_QWORD *)v4 + 8))
  {
    -[GEOLogMsgEventNetwork setRequestErrorDescription:](self, "setRequestErrorDescription:");
    v4 = v10;
  }
  if (*((_QWORD *)v4 + 5))
  {
    -[GEOLogMsgEventNetwork setRequestAppIdentifier:](self, "setRequestAppIdentifier:");
    v4 = v10;
  }
  v6 = v4[41];
  if ((v6 & 0x80) != 0)
  {
    self->_queuedTime = v4[33];
    *(_DWORD *)&self->_flags |= 0x80u;
    v6 = v4[41];
    if ((v6 & 0x2000) == 0)
    {
LABEL_15:
      if ((v6 & 0x10) == 0)
        goto LABEL_16;
      goto LABEL_46;
    }
  }
  else if ((v6 & 0x2000) == 0)
  {
    goto LABEL_15;
  }
  self->_totalTime = v4[39];
  *(_DWORD *)&self->_flags |= 0x2000u;
  v6 = v4[41];
  if ((v6 & 0x10) == 0)
  {
LABEL_16:
    if ((v6 & 8) == 0)
      goto LABEL_17;
    goto LABEL_47;
  }
LABEL_46:
  self->_httpResponseCode = v4[30];
  *(_DWORD *)&self->_flags |= 0x10u;
  v6 = v4[41];
  if ((v6 & 8) == 0)
  {
LABEL_17:
    if ((v6 & 4) == 0)
      goto LABEL_18;
    goto LABEL_48;
  }
LABEL_47:
  self->_decodeTime = v4[29];
  *(_DWORD *)&self->_flags |= 8u;
  v6 = v4[41];
  if ((v6 & 4) == 0)
  {
LABEL_18:
    if ((v6 & 1) == 0)
      goto LABEL_19;
    goto LABEL_49;
  }
LABEL_48:
  self->_requestStart = *((double *)v4 + 10);
  *(_DWORD *)&self->_flags |= 4u;
  v6 = v4[41];
  if ((v6 & 1) == 0)
  {
LABEL_19:
    if ((v6 & 0x100) == 0)
      goto LABEL_21;
    goto LABEL_20;
  }
LABEL_49:
  self->_requestEnd = *((double *)v4 + 6);
  *(_DWORD *)&self->_flags |= 1u;
  if ((v4[41] & 0x100) != 0)
  {
LABEL_20:
    self->_redirectCount = v4[34];
    *(_DWORD *)&self->_flags |= 0x100u;
  }
LABEL_21:
  if (*((_QWORD *)v4 + 2))
  {
    -[GEOLogMsgEventNetwork setManifestEnv:](self, "setManifestEnv:");
    v4 = v10;
  }
  v7 = v4[41];
  if ((v7 & 0x1000) != 0)
  {
    self->_tilesetId = v4[38];
    *(_DWORD *)&self->_flags |= 0x1000u;
    v7 = v4[41];
    if ((v7 & 0x20) == 0)
    {
LABEL_25:
      if ((v7 & 0x4000) == 0)
        goto LABEL_26;
      goto LABEL_53;
    }
  }
  else if ((v7 & 0x20) == 0)
  {
    goto LABEL_25;
  }
  self->_mptcpServiceType = v4[31];
  *(_DWORD *)&self->_flags |= 0x20u;
  v7 = v4[41];
  if ((v7 & 0x4000) == 0)
  {
LABEL_26:
    if ((v7 & 0x10000) == 0)
      goto LABEL_28;
    goto LABEL_27;
  }
LABEL_53:
  self->_mptcpNegotiated = *((_BYTE *)v4 + 160);
  *(_DWORD *)&self->_flags |= 0x4000u;
  if ((v4[41] & 0x10000) != 0)
  {
LABEL_27:
    self->_wasBackground = *((_BYTE *)v4 + 162);
    *(_DWORD *)&self->_flags |= 0x10000u;
  }
LABEL_28:
  if (*((_QWORD *)v4 + 11))
  {
    -[GEOLogMsgEventNetwork setServiceIpAddress:](self, "setServiceIpAddress:");
    v4 = v10;
  }
  if ((*((_BYTE *)v4 + 165) & 0x80) != 0)
  {
    self->_rnfTriggered = *((_BYTE *)v4 + 161);
    *(_DWORD *)&self->_flags |= 0x8000u;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[GEOLogMsgEventNetwork setRequestAppIdMajorVer:](self, "setRequestAppIdMajorVer:");
    v4 = v10;
  }
  if (*((_QWORD *)v4 + 4))
  {
    -[GEOLogMsgEventNetwork setRequestAppIdMinorVer:](self, "setRequestAppIdMinorVer:");
    v4 = v10;
  }
  if ((*((_BYTE *)v4 + 165) & 8) != 0)
  {
    self->_samplingRate = v4[37];
    *(_DWORD *)&self->_flags |= 0x800u;
  }
  taskMetrics = self->_taskMetrics;
  v9 = *((_QWORD *)v4 + 12);
  if (taskMetrics)
  {
    if (v9)
    {
      -[GEONetworkSessionTaskTransactionMetrics mergeFrom:](taskMetrics, "mergeFrom:");
LABEL_57:
      v4 = v10;
    }
  }
  else if (v9)
  {
    -[GEOLogMsgEventNetwork setTaskMetrics:](self, "setTaskMetrics:");
    goto LABEL_57;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskMetrics, 0);
  objc_storeStrong((id *)&self->_serviceIpAddress, 0);
  objc_storeStrong((id *)&self->_requestErrorDomain, 0);
  objc_storeStrong((id *)&self->_requestErrorDescription, 0);
  objc_storeStrong((id *)&self->_requestAppIdentifier, 0);
  objc_storeStrong((id *)&self->_requestAppIdMinorVer, 0);
  objc_storeStrong((id *)&self->_requestAppIdMajorVer, 0);
  objc_storeStrong((id *)&self->_manifestEnv, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
