@implementation GEOSharedNavState

- (GEOSharedNavState)init
{
  GEOSharedNavState *v2;
  GEOSharedNavState *v3;
  GEOSharedNavState *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOSharedNavState;
  v2 = -[GEOSharedNavState init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOSharedNavState)initWithData:(id)a3
{
  GEOSharedNavState *v3;
  GEOSharedNavState *v4;
  GEOSharedNavState *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOSharedNavState;
  v3 = -[GEOSharedNavState initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readDestinationInfo
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_BYTE *)(a1 + 149) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOSharedNavStateReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDestinationInfo_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (BOOL)hasDestinationInfo
{
  -[GEOSharedNavState _readDestinationInfo]((uint64_t)self);
  return self->_destinationInfo != 0;
}

- (GEOMapItemStorage)destinationInfo
{
  -[GEOSharedNavState _readDestinationInfo]((uint64_t)self);
  return self->_destinationInfo;
}

- (void)setDestinationInfo:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x204000u;
  objc_storeStrong((id *)&self->_destinationInfo, a3);
}

- (void)_readEtaInfos
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_BYTE *)(a1 + 149) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOSharedNavStateReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readEtaInfos_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (NSMutableArray)etaInfos
{
  -[GEOSharedNavState _readEtaInfos]((uint64_t)self);
  return self->_etaInfos;
}

- (void)setEtaInfos:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *etaInfos;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x8000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x200000u;
  etaInfos = self->_etaInfos;
  self->_etaInfos = v4;

}

- (void)clearEtaInfos
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x8000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x200000u;
  -[NSMutableArray removeAllObjects](self->_etaInfos, "removeAllObjects");
}

- (void)addEtaInfo:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOSharedNavState _readEtaInfos]((uint64_t)self);
  -[GEOSharedNavState _addNoFlagsEtaInfo:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x8000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x200000u;
}

- (void)_addNoFlagsEtaInfo:(uint64_t)a1
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

- (unint64_t)etaInfosCount
{
  -[GEOSharedNavState _readEtaInfos]((uint64_t)self);
  return -[NSMutableArray count](self->_etaInfos, "count");
}

- (id)etaInfoAtIndex:(unint64_t)a3
{
  -[GEOSharedNavState _readEtaInfos]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_etaInfos, "objectAtIndex:", a3);
}

+ (Class)etaInfoType
{
  return (Class)objc_opt_class();
}

- (void)_readRouteInfo
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_BYTE *)(a1 + 150) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOSharedNavStateReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRouteInfo_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (BOOL)hasRouteInfo
{
  -[GEOSharedNavState _readRouteInfo]((uint64_t)self);
  return self->_routeInfo != 0;
}

- (GEOSharedNavRouteInfo)routeInfo
{
  -[GEOSharedNavState _readRouteInfo]((uint64_t)self);
  return self->_routeInfo;
}

- (void)setRouteInfo:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x240000u;
  objc_storeStrong((id *)&self->_routeInfo, a3);
}

- (void)_readSenderInfo
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_BYTE *)(a1 + 150) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOSharedNavStateReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSenderInfo_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (BOOL)hasSenderInfo
{
  -[GEOSharedNavState _readSenderInfo]((uint64_t)self);
  return self->_senderInfo != 0;
}

- (GEOSharedNavSenderInfo)senderInfo
{
  -[GEOSharedNavState _readSenderInfo]((uint64_t)self);
  return self->_senderInfo;
}

- (void)setSenderInfo:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x280000u;
  objc_storeStrong((id *)&self->_senderInfo, a3);
}

- (void)_readGroupIdentifier
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_BYTE *)(a1 + 150) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOSharedNavStateReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readGroupIdentifier_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (BOOL)hasGroupIdentifier
{
  -[GEOSharedNavState _readGroupIdentifier]((uint64_t)self);
  return self->_groupIdentifier != 0;
}

- (NSString)groupIdentifier
{
  -[GEOSharedNavState _readGroupIdentifier]((uint64_t)self);
  return self->_groupIdentifier;
}

- (void)setGroupIdentifier:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x210000u;
  objc_storeStrong((id *)&self->_groupIdentifier, a3);
}

- (BOOL)arrived
{
  return self->_arrived;
}

- (void)setArrived:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x200200u;
  self->_arrived = a3;
}

- (void)setHasArrived:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2097664;
  else
    v3 = 0x200000;
  self->_flags = ($BF82DFFA3B86AEA2BCCD9D24DE4FAEBE)(*(_DWORD *)&self->_flags & 0xFFFFFDFF | v3);
}

- (BOOL)hasArrived
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 1) & 1;
}

- (BOOL)closed
{
  return self->_closed;
}

- (void)setClosed:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x200400u;
  self->_closed = a3;
}

- (void)setHasClosed:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2098176;
  else
    v3 = 0x200000;
  self->_flags = ($BF82DFFA3B86AEA2BCCD9D24DE4FAEBE)(*(_DWORD *)&self->_flags & 0xFFFFFBFF | v3);
}

- (BOOL)hasClosed
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 2) & 1;
}

- (int)referenceFrame
{
  os_unfair_lock_s *p_readerLock;
  $BF82DFFA3B86AEA2BCCD9D24DE4FAEBE flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_BYTE *)&flags & 0x80) != 0)
    return self->_referenceFrame;
  else
    return 0;
}

- (void)setReferenceFrame:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x200080u;
  self->_referenceFrame = a3;
}

- (void)setHasReferenceFrame:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2097280;
  else
    v3 = 0x200000;
  self->_flags = ($BF82DFFA3B86AEA2BCCD9D24DE4FAEBE)(*(_DWORD *)&self->_flags & 0xFFFFFF7F | v3);
}

- (BOOL)hasReferenceFrame
{
  return *(_BYTE *)&self->_flags >> 7;
}

- (id)referenceFrameAsString:(int)a3
{
  if (a3 < 3)
    return off_1E1C0FEE0[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsReferenceFrame:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WGS84")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("CHINA_SHIFTED")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)muted
{
  return self->_muted;
}

- (void)setMuted:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x200800u;
  self->_muted = a3;
}

- (void)setHasMuted:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2099200;
  else
    v3 = 0x200000;
  self->_flags = ($BF82DFFA3B86AEA2BCCD9D24DE4FAEBE)(*(_DWORD *)&self->_flags & 0xFFFFF7FF | v3);
}

- (BOOL)hasMuted
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 3) & 1;
}

- (double)updatedTimestamp
{
  return self->_updatedTimestamp;
}

- (void)setUpdatedTimestamp:(double)a3
{
  *(_DWORD *)&self->_flags |= 0x200008u;
  self->_updatedTimestamp = a3;
}

- (void)setHasUpdatedTimestamp:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2097160;
  else
    v3 = 0x200000;
  self->_flags = ($BF82DFFA3B86AEA2BCCD9D24DE4FAEBE)(*(_DWORD *)&self->_flags & 0xFFFFFFF7 | v3);
}

- (BOOL)hasUpdatedTimestamp
{
  return (*(_BYTE *)&self->_flags >> 3) & 1;
}

- (unsigned)transportType
{
  return self->_transportType;
}

- (void)setTransportType:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x200100u;
  self->_transportType = a3;
}

- (void)setHasTransportType:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2097408;
  else
    v3 = 0x200000;
  self->_flags = ($BF82DFFA3B86AEA2BCCD9D24DE4FAEBE)(*(_DWORD *)&self->_flags & 0xFFFFFEFF | v3);
}

- (BOOL)hasTransportType
{
  return *((_BYTE *)&self->_flags + 1) & 1;
}

- (unsigned)protocolVersion
{
  return self->_protocolVersion;
}

- (void)setProtocolVersion:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x200040u;
  self->_protocolVersion = a3;
}

- (void)setHasProtocolVersion:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2097216;
  else
    v3 = 0x200000;
  self->_flags = ($BF82DFFA3B86AEA2BCCD9D24DE4FAEBE)(*(_DWORD *)&self->_flags & 0xFFFFFFBF | v3);
}

- (BOOL)hasProtocolVersion
{
  return (*(_BYTE *)&self->_flags >> 6) & 1;
}

- (double)localUpdatedTimestamp
{
  return self->_localUpdatedTimestamp;
}

- (void)setLocalUpdatedTimestamp:(double)a3
{
  *(_DWORD *)&self->_flags |= 0x200004u;
  self->_localUpdatedTimestamp = a3;
}

- (void)setHasLocalUpdatedTimestamp:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2097156;
  else
    v3 = 0x200000;
  self->_flags = ($BF82DFFA3B86AEA2BCCD9D24DE4FAEBE)(*(_DWORD *)&self->_flags & 0xFFFFFFFB | v3);
}

- (BOOL)hasLocalUpdatedTimestamp
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (void)_readWaypointInfos
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_BYTE *)(a1 + 150) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOSharedNavStateReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readWaypointInfos_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (NSMutableArray)waypointInfos
{
  -[GEOSharedNavState _readWaypointInfos]((uint64_t)self);
  return self->_waypointInfos;
}

- (void)setWaypointInfos:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *waypointInfos;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x100000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x200000u;
  waypointInfos = self->_waypointInfos;
  self->_waypointInfos = v4;

}

- (void)clearWaypointInfos
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x100000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x200000u;
  -[NSMutableArray removeAllObjects](self->_waypointInfos, "removeAllObjects");
}

- (void)addWaypointInfo:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOSharedNavState _readWaypointInfos]((uint64_t)self);
  -[GEOSharedNavState _addNoFlagsWaypointInfo:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x100000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x200000u;
}

- (void)_addNoFlagsWaypointInfo:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 104);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 104);
      *(_QWORD *)(a1 + 104) = v5;

      v4 = *(void **)(a1 + 104);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)waypointInfosCount
{
  -[GEOSharedNavState _readWaypointInfos]((uint64_t)self);
  return -[NSMutableArray count](self->_waypointInfos, "count");
}

- (id)waypointInfoAtIndex:(unint64_t)a3
{
  -[GEOSharedNavState _readWaypointInfos]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_waypointInfos, "objectAtIndex:", a3);
}

+ (Class)waypointInfoType
{
  return (Class)objc_opt_class();
}

- (unsigned)currentWaypointIndex
{
  return self->_currentWaypointIndex;
}

- (void)setCurrentWaypointIndex:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x200020u;
  self->_currentWaypointIndex = a3;
}

- (void)setHasCurrentWaypointIndex:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2097184;
  else
    v3 = 0x200000;
  self->_flags = ($BF82DFFA3B86AEA2BCCD9D24DE4FAEBE)(*(_DWORD *)&self->_flags & 0xFFDFFFDF | v3);
}

- (BOOL)hasCurrentWaypointIndex
{
  return (*(_BYTE *)&self->_flags >> 5) & 1;
}

- (void)_readLastLocation
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_BYTE *)(a1 + 150) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOSharedNavStateReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLastLocation_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (BOOL)hasLastLocation
{
  -[GEOSharedNavState _readLastLocation]((uint64_t)self);
  return self->_lastLocation != 0;
}

- (GEOSharedNavLocationInfo)lastLocation
{
  -[GEOSharedNavState _readLastLocation]((uint64_t)self);
  return self->_lastLocation;
}

- (void)setLastLocation:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x220000u;
  objc_storeStrong((id *)&self->_lastLocation, a3);
}

- (BOOL)resumed
{
  return self->_resumed;
}

- (void)setResumed:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x201000u;
  self->_resumed = a3;
}

- (void)setHasResumed:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2101248;
  else
    v3 = 0x200000;
  self->_flags = ($BF82DFFA3B86AEA2BCCD9D24DE4FAEBE)(*(_DWORD *)&self->_flags & 0xFFFFEFFF | v3);
}

- (BOOL)hasResumed
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 4) & 1;
}

- (unsigned)closureReason
{
  return self->_closureReason;
}

- (void)setClosureReason:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x200010u;
  self->_closureReason = a3;
}

- (void)setHasClosureReason:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2097168;
  else
    v3 = 0x200000;
  self->_flags = ($BF82DFFA3B86AEA2BCCD9D24DE4FAEBE)(*(_DWORD *)&self->_flags & 0xFFFFFFEF | v3);
}

- (BOOL)hasClosureReason
{
  return (*(_BYTE *)&self->_flags >> 4) & 1;
}

- (double)arrivedTimestamp
{
  return self->_arrivedTimestamp;
}

- (void)setArrivedTimestamp:(double)a3
{
  *(_DWORD *)&self->_flags |= 0x200001u;
  self->_arrivedTimestamp = a3;
}

- (void)setHasArrivedTimestamp:(BOOL)a3
{
  self->_flags = ($BF82DFFA3B86AEA2BCCD9D24DE4FAEBE)(*(_DWORD *)&self->_flags & 0xFFFFFFFE | a3 | 0x200000);
}

- (BOOL)hasArrivedTimestamp
{
  return *(_DWORD *)&self->_flags & 1;
}

- (double)closedTimestamp
{
  return self->_closedTimestamp;
}

- (void)setClosedTimestamp:(double)a3
{
  *(_DWORD *)&self->_flags |= 0x200002u;
  self->_closedTimestamp = a3;
}

- (void)setHasClosedTimestamp:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2097154;
  else
    v3 = 0x200000;
  self->_flags = ($BF82DFFA3B86AEA2BCCD9D24DE4FAEBE)(*(_DWORD *)&self->_flags & 0xFFFFFFFD | v3);
}

- (BOOL)hasClosedTimestamp
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
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
  v8.super_class = (Class)GEOSharedNavState;
  -[GEOSharedNavState description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOSharedNavState dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOSharedNavState _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  const __CFString *v27;
  int v28;
  void *v29;
  const __CFString *v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
  void *v37;
  void *v38;
  const __CFString *v39;
  void *v40;
  const __CFString *v41;
  void *v42;
  void *v43;
  void *v44;
  const __CFString *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  __CFString *v49;
  int v50;
  void *v51;
  const __CFString *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  id v58;
  void *v60;
  void *v61;
  const __CFString *v62;
  void *v63;
  const __CFString *v64;
  const __CFString *v65;
  void *v66;
  void *v67;
  const __CFString *v68;
  void *v69;
  const __CFString *v70;
  void *v71;
  const __CFString *v72;
  _QWORD v73[4];
  id v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  _BYTE v83[128];
  _BYTE v84[128];
  uint64_t v85;

  v85 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)a1, "destinationInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v5, "jsonRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = CFSTR("destinationInfo");
    }
    else
    {
      objc_msgSend(v5, "dictionaryRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = CFSTR("destination_info");
    }
    objc_msgSend(v4, "setObject:forKey:", v7, v8);

  }
  if (objc_msgSend(*(id *)(a1 + 48), "count"))
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
    v79 = 0u;
    v80 = 0u;
    v81 = 0u;
    v82 = 0u;
    v10 = *(id *)(a1 + 48);
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v79, v84, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v80;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v80 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v15, "jsonRepresentation");
          else
            objc_msgSend(v15, "dictionaryRepresentation");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v16);

        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v79, v84, 16);
      }
      while (v12);
    }

    if (a2)
      v17 = CFSTR("etaInfo");
    else
      v17 = CFSTR("eta_info");
    objc_msgSend(v4, "setObject:forKey:", v9, v17);

  }
  objc_msgSend((id)a1, "routeInfo");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v18)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v18, "jsonRepresentation");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = CFSTR("routeInfo");
    }
    else
    {
      objc_msgSend(v18, "dictionaryRepresentation");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = CFSTR("route_info");
    }
    objc_msgSend(v4, "setObject:forKey:", v20, v21);

  }
  objc_msgSend((id)a1, "senderInfo");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22;
  if (v22)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v22, "jsonRepresentation");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = CFSTR("senderInfo");
    }
    else
    {
      objc_msgSend(v22, "dictionaryRepresentation");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = CFSTR("sender_info");
    }
    objc_msgSend(v4, "setObject:forKey:", v24, v25);

  }
  objc_msgSend((id)a1, "groupIdentifier");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v26)
  {
    if (a2)
      v27 = CFSTR("groupIdentifier");
    else
      v27 = CFSTR("group_identifier");
    objc_msgSend(v4, "setObject:forKey:", v26, v27);
  }

  v28 = *(_DWORD *)(a1 + 148);
  if ((v28 & 0x200) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 144));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v46, CFSTR("arrived"));

    v28 = *(_DWORD *)(a1 + 148);
    if ((v28 & 0x400) == 0)
    {
LABEL_39:
      if ((v28 & 0x80) == 0)
        goto LABEL_40;
      goto LABEL_74;
    }
  }
  else if ((v28 & 0x400) == 0)
  {
    goto LABEL_39;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 145));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v47, CFSTR("closed"));

  v28 = *(_DWORD *)(a1 + 148);
  if ((v28 & 0x80) == 0)
  {
LABEL_40:
    if ((v28 & 0x800) == 0)
      goto LABEL_41;
    goto LABEL_106;
  }
LABEL_74:
  v48 = *(int *)(a1 + 136);
  if (v48 >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 136));
    v49 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v49 = off_1E1C0FEE0[v48];
  }
  if (a2)
    v65 = CFSTR("referenceFrame");
  else
    v65 = CFSTR("reference_frame");
  objc_msgSend(v4, "setObject:forKey:", v49, v65);

  v28 = *(_DWORD *)(a1 + 148);
  if ((v28 & 0x800) == 0)
  {
LABEL_41:
    if ((v28 & 8) == 0)
      goto LABEL_42;
    goto LABEL_107;
  }
LABEL_106:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 146));
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v66, CFSTR("muted"));

  v28 = *(_DWORD *)(a1 + 148);
  if ((v28 & 8) == 0)
  {
LABEL_42:
    if ((v28 & 0x100) == 0)
      goto LABEL_43;
    goto LABEL_111;
  }
LABEL_107:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 96));
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v68 = CFSTR("updatedTimestamp");
  else
    v68 = CFSTR("updated_timestamp");
  objc_msgSend(v4, "setObject:forKey:", v67, v68);

  v28 = *(_DWORD *)(a1 + 148);
  if ((v28 & 0x100) == 0)
  {
LABEL_43:
    if ((v28 & 0x40) == 0)
      goto LABEL_44;
    goto LABEL_115;
  }
LABEL_111:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 140));
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v70 = CFSTR("transportType");
  else
    v70 = CFSTR("transport_type");
  objc_msgSend(v4, "setObject:forKey:", v69, v70);

  v28 = *(_DWORD *)(a1 + 148);
  if ((v28 & 0x40) == 0)
  {
LABEL_44:
    if ((v28 & 4) == 0)
      goto LABEL_49;
    goto LABEL_45;
  }
LABEL_115:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 132));
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v72 = CFSTR("protocolVersion");
  else
    v72 = CFSTR("protocol_version");
  objc_msgSend(v4, "setObject:forKey:", v71, v72);

  if ((*(_DWORD *)(a1 + 148) & 4) != 0)
  {
LABEL_45:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 72));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v30 = CFSTR("localUpdatedTimestamp");
    else
      v30 = CFSTR("local_updated_timestamp");
    objc_msgSend(v4, "setObject:forKey:", v29, v30);

  }
LABEL_49:
  if (objc_msgSend(*(id *)(a1 + 104), "count"))
  {
    v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 104), "count"));
    v75 = 0u;
    v76 = 0u;
    v77 = 0u;
    v78 = 0u;
    v32 = *(id *)(a1 + 104);
    v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v75, v83, 16);
    if (v33)
    {
      v34 = v33;
      v35 = *(_QWORD *)v76;
      do
      {
        for (j = 0; j != v34; ++j)
        {
          if (*(_QWORD *)v76 != v35)
            objc_enumerationMutation(v32);
          v37 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * j);
          if ((a2 & 1) != 0)
            objc_msgSend(v37, "jsonRepresentation");
          else
            objc_msgSend(v37, "dictionaryRepresentation");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "addObject:", v38);

        }
        v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v75, v83, 16);
      }
      while (v34);
    }

    if (a2)
      v39 = CFSTR("waypointInfo");
    else
      v39 = CFSTR("waypoint_info");
    objc_msgSend(v4, "setObject:forKey:", v31, v39);

  }
  if ((*(_BYTE *)(a1 + 148) & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 128));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v41 = CFSTR("currentWaypointIndex");
    else
      v41 = CFSTR("current_waypoint_index");
    objc_msgSend(v4, "setObject:forKey:", v40, v41);

  }
  objc_msgSend((id)a1, "lastLocation");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = v42;
  if (v42)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v42, "jsonRepresentation");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = CFSTR("lastLocation");
    }
    else
    {
      objc_msgSend(v42, "dictionaryRepresentation");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = CFSTR("last_location");
    }
    objc_msgSend(v4, "setObject:forKey:", v44, v45);

  }
  v50 = *(_DWORD *)(a1 + 148);
  if ((v50 & 0x1000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 147));
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v60, CFSTR("resumed"));

    v50 = *(_DWORD *)(a1 + 148);
    if ((v50 & 0x10) == 0)
    {
LABEL_80:
      if ((v50 & 1) == 0)
        goto LABEL_81;
LABEL_96:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 24));
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
        v64 = CFSTR("arrivedTimestamp");
      else
        v64 = CFSTR("arrived_timestamp");
      objc_msgSend(v4, "setObject:forKey:", v63, v64);

      if ((*(_DWORD *)(a1 + 148) & 2) == 0)
        goto LABEL_86;
      goto LABEL_82;
    }
  }
  else if ((v50 & 0x10) == 0)
  {
    goto LABEL_80;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 124));
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v62 = CFSTR("closureReason");
  else
    v62 = CFSTR("closure_reason");
  objc_msgSend(v4, "setObject:forKey:", v61, v62);

  v50 = *(_DWORD *)(a1 + 148);
  if ((v50 & 1) != 0)
    goto LABEL_96;
LABEL_81:
  if ((v50 & 2) != 0)
  {
LABEL_82:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 32));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v52 = CFSTR("closedTimestamp");
    else
      v52 = CFSTR("closed_timestamp");
    objc_msgSend(v4, "setObject:forKey:", v51, v52);

  }
LABEL_86:
  v53 = *(void **)(a1 + 16);
  if (v53)
  {
    objc_msgSend(v53, "dictionaryRepresentation");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = v54;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v54, "count"));
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v73[0] = MEMORY[0x1E0C809B0];
      v73[1] = 3221225472;
      v73[2] = __47__GEOSharedNavState__dictionaryRepresentation___block_invoke;
      v73[3] = &unk_1E1C00600;
      v57 = v56;
      v74 = v57;
      objc_msgSend(v55, "enumerateKeysAndObjectsUsingBlock:", v73);
      v58 = v57;

      v55 = v58;
    }
    objc_msgSend(v4, "setObject:forKey:", v55, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOSharedNavState _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __47__GEOSharedNavState__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOSharedNavState)initWithDictionary:(id)a3
{
  return (GEOSharedNavState *)-[GEOSharedNavState _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  GEOMapItemStorage *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  GEOSharedNavETAInfo *v19;
  uint64_t v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  GEOSharedNavRouteInfo *v24;
  uint64_t v25;
  void *v26;
  const __CFString *v27;
  void *v28;
  GEOSharedNavSenderInfo *v29;
  uint64_t v30;
  void *v31;
  const __CFString *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  const __CFString *v37;
  void *v38;
  id v39;
  uint64_t v40;
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
  id v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t j;
  uint64_t v57;
  GEOSharedNavWaypointInfo *v58;
  uint64_t v59;
  void *v60;
  const __CFString *v61;
  void *v62;
  const __CFString *v63;
  void *v64;
  GEOSharedNavLocationInfo *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  const __CFString *v69;
  void *v70;
  const __CFString *v71;
  void *v72;
  const __CFString *v73;
  void *v74;
  id v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  _BYTE v85[128];
  _BYTE v86[128];
  uint64_t v87;

  v87 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (!a1)
    goto LABEL_138;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_138;
  if (a3)
    v6 = CFSTR("destinationInfo");
  else
    v6 = CFSTR("destination_info");
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = [GEOMapItemStorage alloc];
    if ((a3 & 1) != 0)
      v9 = -[GEOMapItemStorage initWithJSON:](v8, "initWithJSON:", v7);
    else
      v9 = -[GEOMapItemStorage initWithDictionary:](v8, "initWithDictionary:", v7);
    v10 = (void *)v9;
    objc_msgSend(a1, "setDestinationInfo:", v9);

  }
  if (a3)
    v11 = CFSTR("etaInfo");
  else
    v11 = CFSTR("eta_info");
  objc_msgSend(v5, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v76 = v5;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v83 = 0u;
    v84 = 0u;
    v81 = 0u;
    v82 = 0u;
    v13 = v12;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v81, v86, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v82;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v82 != v16)
            objc_enumerationMutation(v13);
          v18 = *(_QWORD *)(*((_QWORD *)&v81 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v19 = [GEOSharedNavETAInfo alloc];
            if ((a3 & 1) != 0)
              v20 = -[GEOSharedNavETAInfo initWithJSON:](v19, "initWithJSON:", v18);
            else
              v20 = -[GEOSharedNavETAInfo initWithDictionary:](v19, "initWithDictionary:", v18);
            v21 = (void *)v20;
            objc_msgSend(a1, "addEtaInfo:", v20);

          }
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v81, v86, 16);
      }
      while (v15);
    }

    v5 = v76;
  }

  if (a3)
    v22 = CFSTR("routeInfo");
  else
    v22 = CFSTR("route_info");
  objc_msgSend(v5, "objectForKeyedSubscript:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v24 = [GEOSharedNavRouteInfo alloc];
    if ((a3 & 1) != 0)
      v25 = -[GEOSharedNavRouteInfo initWithJSON:](v24, "initWithJSON:", v23);
    else
      v25 = -[GEOSharedNavRouteInfo initWithDictionary:](v24, "initWithDictionary:", v23);
    v26 = (void *)v25;
    objc_msgSend(a1, "setRouteInfo:", v25);

  }
  if (a3)
    v27 = CFSTR("senderInfo");
  else
    v27 = CFSTR("sender_info");
  objc_msgSend(v5, "objectForKeyedSubscript:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v29 = [GEOSharedNavSenderInfo alloc];
    if ((a3 & 1) != 0)
      v30 = -[GEOSharedNavSenderInfo initWithJSON:](v29, "initWithJSON:", v28);
    else
      v30 = -[GEOSharedNavSenderInfo initWithDictionary:](v29, "initWithDictionary:", v28);
    v31 = (void *)v30;
    objc_msgSend(a1, "setSenderInfo:", v30);

  }
  if (a3)
    v32 = CFSTR("groupIdentifier");
  else
    v32 = CFSTR("group_identifier");
  objc_msgSend(v5, "objectForKeyedSubscript:", v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v34 = (void *)objc_msgSend(v33, "copy");
    objc_msgSend(a1, "setGroupIdentifier:", v34);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("arrived"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setArrived:", objc_msgSend(v35, "BOOLValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("closed"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setClosed:", objc_msgSend(v36, "BOOLValue"));

  if (a3)
    v37 = CFSTR("referenceFrame");
  else
    v37 = CFSTR("reference_frame");
  objc_msgSend(v5, "objectForKeyedSubscript:", v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v39 = v38;
    if ((objc_msgSend(v39, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
    {
      v40 = 0;
    }
    else if ((objc_msgSend(v39, "isEqualToString:", CFSTR("WGS84")) & 1) != 0)
    {
      v40 = 1;
    }
    else if (objc_msgSend(v39, "isEqualToString:", CFSTR("CHINA_SHIFTED")))
    {
      v40 = 2;
    }
    else
    {
      v40 = 0;
    }

    goto LABEL_67;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v40 = objc_msgSend(v38, "intValue");
LABEL_67:
    objc_msgSend(a1, "setReferenceFrame:", v40);
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("muted"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setMuted:", objc_msgSend(v41, "BOOLValue"));

  if (a3)
    v42 = CFSTR("updatedTimestamp");
  else
    v42 = CFSTR("updated_timestamp");
  objc_msgSend(v5, "objectForKeyedSubscript:", v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v43, "doubleValue");
    objc_msgSend(a1, "setUpdatedTimestamp:");
  }

  if (a3)
    v44 = CFSTR("transportType");
  else
    v44 = CFSTR("transport_type");
  objc_msgSend(v5, "objectForKeyedSubscript:", v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setTransportType:", objc_msgSend(v45, "unsignedIntValue"));

  if (a3)
    v46 = CFSTR("protocolVersion");
  else
    v46 = CFSTR("protocol_version");
  objc_msgSend(v5, "objectForKeyedSubscript:", v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setProtocolVersion:", objc_msgSend(v47, "unsignedIntValue"));

  if (a3)
    v48 = CFSTR("localUpdatedTimestamp");
  else
    v48 = CFSTR("local_updated_timestamp");
  objc_msgSend(v5, "objectForKeyedSubscript:", v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v49, "doubleValue");
    objc_msgSend(a1, "setLocalUpdatedTimestamp:");
  }

  if (a3)
    v50 = CFSTR("waypointInfo");
  else
    v50 = CFSTR("waypoint_info");
  objc_msgSend(v5, "objectForKeyedSubscript:", v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v79 = 0u;
    v80 = 0u;
    v77 = 0u;
    v78 = 0u;
    v52 = v51;
    v53 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v77, v85, 16);
    if (v53)
    {
      v54 = v53;
      v55 = *(_QWORD *)v78;
      do
      {
        for (j = 0; j != v54; ++j)
        {
          if (*(_QWORD *)v78 != v55)
            objc_enumerationMutation(v52);
          v57 = *(_QWORD *)(*((_QWORD *)&v77 + 1) + 8 * j);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v58 = [GEOSharedNavWaypointInfo alloc];
            if ((a3 & 1) != 0)
              v59 = -[GEOSharedNavWaypointInfo initWithJSON:](v58, "initWithJSON:", v57);
            else
              v59 = -[GEOSharedNavWaypointInfo initWithDictionary:](v58, "initWithDictionary:", v57);
            v60 = (void *)v59;
            objc_msgSend(a1, "addWaypointInfo:", v59);

          }
        }
        v54 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v77, v85, 16);
      }
      while (v54);
    }

    v5 = v76;
  }

  if (a3)
    v61 = CFSTR("currentWaypointIndex");
  else
    v61 = CFSTR("current_waypoint_index");
  objc_msgSend(v5, "objectForKeyedSubscript:", v61);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setCurrentWaypointIndex:", objc_msgSend(v62, "unsignedIntValue"));

  if (a3)
    v63 = CFSTR("lastLocation");
  else
    v63 = CFSTR("last_location");
  objc_msgSend(v5, "objectForKeyedSubscript:", v63);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v65 = [GEOSharedNavLocationInfo alloc];
    if ((a3 & 1) != 0)
      v66 = -[GEOSharedNavLocationInfo initWithJSON:](v65, "initWithJSON:", v64);
    else
      v66 = -[GEOSharedNavLocationInfo initWithDictionary:](v65, "initWithDictionary:", v64);
    v67 = (void *)v66;
    objc_msgSend(a1, "setLastLocation:", v66);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("resumed"));
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setResumed:", objc_msgSend(v68, "BOOLValue"));

  if (a3)
    v69 = CFSTR("closureReason");
  else
    v69 = CFSTR("closure_reason");
  objc_msgSend(v5, "objectForKeyedSubscript:", v69);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setClosureReason:", objc_msgSend(v70, "unsignedIntValue"));

  if (a3)
    v71 = CFSTR("arrivedTimestamp");
  else
    v71 = CFSTR("arrived_timestamp");
  objc_msgSend(v5, "objectForKeyedSubscript:", v71);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v72, "doubleValue");
    objc_msgSend(a1, "setArrivedTimestamp:");
  }

  if (a3)
    v73 = CFSTR("closedTimestamp");
  else
    v73 = CFSTR("closed_timestamp");
  objc_msgSend(v5, "objectForKeyedSubscript:", v73);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v74, "doubleValue");
    objc_msgSend(a1, "setClosedTimestamp:");
  }

LABEL_138:
  return a1;
}

- (GEOSharedNavState)initWithJSON:(id)a3
{
  return (GEOSharedNavState *)-[GEOSharedNavState _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_3036;
    else
      v8 = (int *)&readAll__nonRecursiveTag_3037;
    GEOSharedNavStateReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEOSharedNavStateCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOSharedNavStateIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOSharedNavStateReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  $BF82DFFA3B86AEA2BCCD9D24DE4FAEBE flags;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  $BF82DFFA3B86AEA2BCCD9D24DE4FAEBE v15;
  PBDataReader *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOSharedNavStateIsDirty((uint64_t)self) & 1) == 0)
  {
    v16 = self->_reader;
    objc_sync_enter(v16);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v17);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v16);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOSharedNavState readAll:](self, "readAll:", 0);
    if (self->_destinationInfo)
      PBDataWriterWriteSubmessage();
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v6 = self->_etaInfos;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v23 != v8)
            objc_enumerationMutation(v6);
          PBDataWriterWriteSubmessage();
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      }
      while (v7);
    }

    if (self->_routeInfo)
      PBDataWriterWriteSubmessage();
    if (self->_senderInfo)
      PBDataWriterWriteSubmessage();
    if (self->_groupIdentifier)
      PBDataWriterWriteStringField();
    flags = self->_flags;
    if ((*(_WORD *)&flags & 0x200) != 0)
    {
      PBDataWriterWriteBOOLField();
      flags = self->_flags;
    }
    if ((*(_WORD *)&flags & 0x400) != 0)
    {
      PBDataWriterWriteBOOLField();
      flags = self->_flags;
    }
    if ((*(_BYTE *)&flags & 0x80) != 0)
    {
      PBDataWriterWriteInt32Field();
      flags = self->_flags;
    }
    if ((*(_WORD *)&flags & 0x800) != 0)
    {
      PBDataWriterWriteBOOLField();
      flags = self->_flags;
    }
    if ((*(_BYTE *)&flags & 8) != 0)
    {
      PBDataWriterWriteDoubleField();
      flags = self->_flags;
    }
    if ((*(_WORD *)&flags & 0x100) != 0)
    {
      PBDataWriterWriteUint32Field();
      flags = self->_flags;
    }
    if ((*(_BYTE *)&flags & 0x40) != 0)
    {
      PBDataWriterWriteUint32Field();
      flags = self->_flags;
    }
    if ((*(_BYTE *)&flags & 4) != 0)
      PBDataWriterWriteDoubleField();
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v11 = self->_waypointInfos;
    v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v19;
      do
      {
        for (j = 0; j != v12; ++j)
        {
          if (*(_QWORD *)v19 != v13)
            objc_enumerationMutation(v11);
          PBDataWriterWriteSubmessage();
        }
        v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
      }
      while (v12);
    }

    if ((*(_BYTE *)&self->_flags & 0x20) != 0)
      PBDataWriterWriteUint32Field();
    if (self->_lastLocation)
      PBDataWriterWriteSubmessage();
    v15 = self->_flags;
    if ((*(_WORD *)&v15 & 0x1000) != 0)
    {
      PBDataWriterWriteBOOLField();
      v15 = self->_flags;
    }
    if ((*(_BYTE *)&v15 & 0x10) != 0)
    {
      PBDataWriterWriteUint32Field();
      v15 = self->_flags;
    }
    if ((*(_BYTE *)&v15 & 1) != 0)
    {
      PBDataWriterWriteDoubleField();
      v15 = self->_flags;
    }
    if ((*(_BYTE *)&v15 & 2) != 0)
      PBDataWriterWriteDoubleField();
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v18);
  }

}

- (void)clearSensitiveFields:(unint64_t)a3
{
  GEOSharedNavStateClearSensitiveFields((id *)&self->super.super.isa, a3, 1);
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
  -[GEOSharedNavState _readDestinationInfo]((uint64_t)self);
  if (-[GEOMapItemStorage hasGreenTeaWithValue:](self->_destinationInfo, "hasGreenTeaWithValue:", v3))
    return 1;
  -[GEOSharedNavState _readLastLocation]((uint64_t)self);
  if (-[GEOSharedNavLocationInfo hasGreenTeaWithValue:](self->_lastLocation, "hasGreenTeaWithValue:", v3))
    return 1;
  -[GEOSharedNavState _readWaypointInfos]((uint64_t)self);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = self->_waypointInfos;
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
  $BF82DFFA3B86AEA2BCCD9D24DE4FAEBE flags;
  unint64_t v10;
  unint64_t v11;
  uint64_t j;
  void *v13;
  id *v14;
  $BF82DFFA3B86AEA2BCCD9D24DE4FAEBE v15;
  id *v16;

  v16 = (id *)a3;
  -[GEOSharedNavState readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v16 + 1, self->_reader);
  *((_DWORD *)v16 + 28) = self->_readerMarkPos;
  *((_DWORD *)v16 + 29) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_destinationInfo)
    objc_msgSend(v16, "setDestinationInfo:");
  if (-[GEOSharedNavState etaInfosCount](self, "etaInfosCount"))
  {
    objc_msgSend(v16, "clearEtaInfos");
    v4 = -[GEOSharedNavState etaInfosCount](self, "etaInfosCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[GEOSharedNavState etaInfoAtIndex:](self, "etaInfoAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addEtaInfo:", v7);

      }
    }
  }
  if (self->_routeInfo)
    objc_msgSend(v16, "setRouteInfo:");
  v8 = v16;
  if (self->_senderInfo)
  {
    objc_msgSend(v16, "setSenderInfo:");
    v8 = v16;
  }
  if (self->_groupIdentifier)
  {
    objc_msgSend(v16, "setGroupIdentifier:");
    v8 = v16;
  }
  flags = self->_flags;
  if ((*(_WORD *)&flags & 0x200) != 0)
  {
    *((_BYTE *)v8 + 144) = self->_arrived;
    *((_DWORD *)v8 + 37) |= 0x200u;
    flags = self->_flags;
    if ((*(_WORD *)&flags & 0x400) == 0)
    {
LABEL_15:
      if ((*(_BYTE *)&flags & 0x80) == 0)
        goto LABEL_16;
      goto LABEL_38;
    }
  }
  else if ((*(_WORD *)&flags & 0x400) == 0)
  {
    goto LABEL_15;
  }
  *((_BYTE *)v8 + 145) = self->_closed;
  *((_DWORD *)v8 + 37) |= 0x400u;
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 0x80) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&flags & 0x800) == 0)
      goto LABEL_17;
    goto LABEL_39;
  }
LABEL_38:
  *((_DWORD *)v8 + 34) = self->_referenceFrame;
  *((_DWORD *)v8 + 37) |= 0x80u;
  flags = self->_flags;
  if ((*(_WORD *)&flags & 0x800) == 0)
  {
LABEL_17:
    if ((*(_BYTE *)&flags & 8) == 0)
      goto LABEL_18;
    goto LABEL_40;
  }
LABEL_39:
  *((_BYTE *)v8 + 146) = self->_muted;
  *((_DWORD *)v8 + 37) |= 0x800u;
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 8) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&flags & 0x100) == 0)
      goto LABEL_19;
    goto LABEL_41;
  }
LABEL_40:
  v8[12] = *(id *)&self->_updatedTimestamp;
  *((_DWORD *)v8 + 37) |= 8u;
  flags = self->_flags;
  if ((*(_WORD *)&flags & 0x100) == 0)
  {
LABEL_19:
    if ((*(_BYTE *)&flags & 0x40) == 0)
      goto LABEL_20;
LABEL_42:
    *((_DWORD *)v8 + 33) = self->_protocolVersion;
    *((_DWORD *)v8 + 37) |= 0x40u;
    if ((*(_DWORD *)&self->_flags & 4) == 0)
      goto LABEL_22;
    goto LABEL_21;
  }
LABEL_41:
  *((_DWORD *)v8 + 35) = self->_transportType;
  *((_DWORD *)v8 + 37) |= 0x100u;
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 0x40) != 0)
    goto LABEL_42;
LABEL_20:
  if ((*(_BYTE *)&flags & 4) != 0)
  {
LABEL_21:
    v8[9] = *(id *)&self->_localUpdatedTimestamp;
    *((_DWORD *)v8 + 37) |= 4u;
  }
LABEL_22:
  if (-[GEOSharedNavState waypointInfosCount](self, "waypointInfosCount"))
  {
    objc_msgSend(v16, "clearWaypointInfos");
    v10 = -[GEOSharedNavState waypointInfosCount](self, "waypointInfosCount");
    if (v10)
    {
      v11 = v10;
      for (j = 0; j != v11; ++j)
      {
        -[GEOSharedNavState waypointInfoAtIndex:](self, "waypointInfoAtIndex:", j);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addWaypointInfo:", v13);

      }
    }
  }
  v14 = v16;
  if ((*(_BYTE *)&self->_flags & 0x20) != 0)
  {
    *((_DWORD *)v16 + 32) = self->_currentWaypointIndex;
    *((_DWORD *)v16 + 37) |= 0x20u;
  }
  if (self->_lastLocation)
  {
    objc_msgSend(v16, "setLastLocation:");
    v14 = v16;
  }
  v15 = self->_flags;
  if ((*(_WORD *)&v15 & 0x1000) != 0)
  {
    *((_BYTE *)v14 + 147) = self->_resumed;
    *((_DWORD *)v14 + 37) |= 0x1000u;
    v15 = self->_flags;
    if ((*(_BYTE *)&v15 & 0x10) == 0)
    {
LABEL_32:
      if ((*(_BYTE *)&v15 & 1) == 0)
        goto LABEL_33;
LABEL_46:
      v14[3] = *(id *)&self->_arrivedTimestamp;
      *((_DWORD *)v14 + 37) |= 1u;
      if ((*(_DWORD *)&self->_flags & 2) == 0)
        goto LABEL_35;
      goto LABEL_34;
    }
  }
  else if ((*(_BYTE *)&v15 & 0x10) == 0)
  {
    goto LABEL_32;
  }
  *((_DWORD *)v14 + 31) = self->_closureReason;
  *((_DWORD *)v14 + 37) |= 0x10u;
  v15 = self->_flags;
  if ((*(_BYTE *)&v15 & 1) != 0)
    goto LABEL_46;
LABEL_33:
  if ((*(_BYTE *)&v15 & 2) != 0)
  {
LABEL_34:
    v14[4] = *(id *)&self->_closedTimestamp;
    *((_DWORD *)v14 + 37) |= 2u;
  }
LABEL_35:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  id v9;
  void *v10;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  $BF82DFFA3B86AEA2BCCD9D24DE4FAEBE flags;
  NSMutableArray *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  id v28;
  void *v29;
  $BF82DFFA3B86AEA2BCCD9D24DE4FAEBE v30;
  PBUnknownFields *v31;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
  {
LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOSharedNavState readAll:](self, "readAll:", 0);
    v9 = -[GEOMapItemStorage copyWithZone:](self->_destinationInfo, "copyWithZone:", a3);
    v10 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v9;

    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v11 = self->_etaInfos;
    v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v38;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v38 != v13)
            objc_enumerationMutation(v11);
          v15 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * i), "copyWithZone:", a3);
          objc_msgSend((id)v5, "addEtaInfo:", v15);

        }
        v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
      }
      while (v12);
    }

    v16 = -[GEOSharedNavRouteInfo copyWithZone:](self->_routeInfo, "copyWithZone:", a3);
    v17 = *(void **)(v5 + 80);
    *(_QWORD *)(v5 + 80) = v16;

    v18 = -[GEOSharedNavSenderInfo copyWithZone:](self->_senderInfo, "copyWithZone:", a3);
    v19 = *(void **)(v5 + 88);
    *(_QWORD *)(v5 + 88) = v18;

    v20 = -[NSString copyWithZone:](self->_groupIdentifier, "copyWithZone:", a3);
    v21 = *(void **)(v5 + 56);
    *(_QWORD *)(v5 + 56) = v20;

    flags = self->_flags;
    if ((*(_WORD *)&flags & 0x200) != 0)
    {
      *(_BYTE *)(v5 + 144) = self->_arrived;
      *(_DWORD *)(v5 + 148) |= 0x200u;
      flags = self->_flags;
      if ((*(_WORD *)&flags & 0x400) == 0)
      {
LABEL_14:
        if ((*(_BYTE *)&flags & 0x80) == 0)
          goto LABEL_15;
        goto LABEL_39;
      }
    }
    else if ((*(_WORD *)&flags & 0x400) == 0)
    {
      goto LABEL_14;
    }
    *(_BYTE *)(v5 + 145) = self->_closed;
    *(_DWORD *)(v5 + 148) |= 0x400u;
    flags = self->_flags;
    if ((*(_BYTE *)&flags & 0x80) == 0)
    {
LABEL_15:
      if ((*(_WORD *)&flags & 0x800) == 0)
        goto LABEL_16;
      goto LABEL_40;
    }
LABEL_39:
    *(_DWORD *)(v5 + 136) = self->_referenceFrame;
    *(_DWORD *)(v5 + 148) |= 0x80u;
    flags = self->_flags;
    if ((*(_WORD *)&flags & 0x800) == 0)
    {
LABEL_16:
      if ((*(_BYTE *)&flags & 8) == 0)
        goto LABEL_17;
      goto LABEL_41;
    }
LABEL_40:
    *(_BYTE *)(v5 + 146) = self->_muted;
    *(_DWORD *)(v5 + 148) |= 0x800u;
    flags = self->_flags;
    if ((*(_BYTE *)&flags & 8) == 0)
    {
LABEL_17:
      if ((*(_WORD *)&flags & 0x100) == 0)
        goto LABEL_18;
      goto LABEL_42;
    }
LABEL_41:
    *(double *)(v5 + 96) = self->_updatedTimestamp;
    *(_DWORD *)(v5 + 148) |= 8u;
    flags = self->_flags;
    if ((*(_WORD *)&flags & 0x100) == 0)
    {
LABEL_18:
      if ((*(_BYTE *)&flags & 0x40) == 0)
        goto LABEL_19;
      goto LABEL_43;
    }
LABEL_42:
    *(_DWORD *)(v5 + 140) = self->_transportType;
    *(_DWORD *)(v5 + 148) |= 0x100u;
    flags = self->_flags;
    if ((*(_BYTE *)&flags & 0x40) == 0)
    {
LABEL_19:
      if ((*(_BYTE *)&flags & 4) == 0)
        goto LABEL_21;
      goto LABEL_20;
    }
LABEL_43:
    *(_DWORD *)(v5 + 132) = self->_protocolVersion;
    *(_DWORD *)(v5 + 148) |= 0x40u;
    if ((*(_DWORD *)&self->_flags & 4) == 0)
    {
LABEL_21:
      v35 = 0u;
      v36 = 0u;
      v33 = 0u;
      v34 = 0u;
      v23 = self->_waypointInfos;
      v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
      if (v24)
      {
        v25 = *(_QWORD *)v34;
        do
        {
          for (j = 0; j != v24; ++j)
          {
            if (*(_QWORD *)v34 != v25)
              objc_enumerationMutation(v23);
            v27 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * j), "copyWithZone:", a3, (_QWORD)v33);
            objc_msgSend((id)v5, "addWaypointInfo:", v27);

          }
          v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
        }
        while (v24);
      }

      if ((*(_BYTE *)&self->_flags & 0x20) != 0)
      {
        *(_DWORD *)(v5 + 128) = self->_currentWaypointIndex;
        *(_DWORD *)(v5 + 148) |= 0x20u;
      }
      v28 = -[GEOSharedNavLocationInfo copyWithZone:](self->_lastLocation, "copyWithZone:", a3, (_QWORD)v33);
      v29 = *(void **)(v5 + 64);
      *(_QWORD *)(v5 + 64) = v28;

      v30 = self->_flags;
      if ((*(_WORD *)&v30 & 0x1000) != 0)
      {
        *(_BYTE *)(v5 + 147) = self->_resumed;
        *(_DWORD *)(v5 + 148) |= 0x1000u;
        v30 = self->_flags;
        if ((*(_BYTE *)&v30 & 0x10) == 0)
        {
LABEL_32:
          if ((*(_BYTE *)&v30 & 1) == 0)
            goto LABEL_33;
          goto LABEL_47;
        }
      }
      else if ((*(_BYTE *)&v30 & 0x10) == 0)
      {
        goto LABEL_32;
      }
      *(_DWORD *)(v5 + 124) = self->_closureReason;
      *(_DWORD *)(v5 + 148) |= 0x10u;
      v30 = self->_flags;
      if ((*(_BYTE *)&v30 & 1) == 0)
      {
LABEL_33:
        if ((*(_BYTE *)&v30 & 2) == 0)
        {
LABEL_35:
          v31 = self->_unknownFields;
          v8 = *(id *)(v5 + 16);
          *(_QWORD *)(v5 + 16) = v31;
          goto LABEL_36;
        }
LABEL_34:
        *(double *)(v5 + 32) = self->_closedTimestamp;
        *(_DWORD *)(v5 + 148) |= 2u;
        goto LABEL_35;
      }
LABEL_47:
      *(double *)(v5 + 24) = self->_arrivedTimestamp;
      *(_DWORD *)(v5 + 148) |= 1u;
      if ((*(_DWORD *)&self->_flags & 2) == 0)
        goto LABEL_35;
      goto LABEL_34;
    }
LABEL_20:
    *(double *)(v5 + 72) = self->_localUpdatedTimestamp;
    *(_DWORD *)(v5 + 148) |= 4u;
    goto LABEL_21;
  }
  v7 = reader;
  objc_sync_enter(v7);
  if ((*((_BYTE *)&self->_flags + 2) & 0x20) != 0)
  {
    objc_sync_exit(v7);

    goto LABEL_5;
  }
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  GEOSharedNavStateReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  v8 = (id)v5;
  objc_sync_exit(v7);

LABEL_36:
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  GEOMapItemStorage *destinationInfo;
  NSMutableArray *etaInfos;
  GEOSharedNavRouteInfo *routeInfo;
  GEOSharedNavSenderInfo *senderInfo;
  NSString *groupIdentifier;
  $BF82DFFA3B86AEA2BCCD9D24DE4FAEBE flags;
  int v11;
  NSMutableArray *waypointInfos;
  GEOSharedNavLocationInfo *lastLocation;
  BOOL v14;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_95;
  -[GEOSharedNavState readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  destinationInfo = self->_destinationInfo;
  if ((unint64_t)destinationInfo | *((_QWORD *)v4 + 5))
  {
    if (!-[GEOMapItemStorage isEqual:](destinationInfo, "isEqual:"))
      goto LABEL_95;
  }
  etaInfos = self->_etaInfos;
  if ((unint64_t)etaInfos | *((_QWORD *)v4 + 6))
  {
    if (!-[NSMutableArray isEqual:](etaInfos, "isEqual:"))
      goto LABEL_95;
  }
  routeInfo = self->_routeInfo;
  if ((unint64_t)routeInfo | *((_QWORD *)v4 + 10))
  {
    if (!-[GEOSharedNavRouteInfo isEqual:](routeInfo, "isEqual:"))
      goto LABEL_95;
  }
  senderInfo = self->_senderInfo;
  if ((unint64_t)senderInfo | *((_QWORD *)v4 + 11))
  {
    if (!-[GEOSharedNavSenderInfo isEqual:](senderInfo, "isEqual:"))
      goto LABEL_95;
  }
  groupIdentifier = self->_groupIdentifier;
  if ((unint64_t)groupIdentifier | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](groupIdentifier, "isEqual:"))
      goto LABEL_95;
  }
  flags = self->_flags;
  v11 = *((_DWORD *)v4 + 37);
  if ((*(_WORD *)&flags & 0x200) != 0)
  {
    if ((v11 & 0x200) == 0)
      goto LABEL_95;
    if (self->_arrived)
    {
      if (!*((_BYTE *)v4 + 144))
        goto LABEL_95;
    }
    else if (*((_BYTE *)v4 + 144))
    {
      goto LABEL_95;
    }
  }
  else if ((v11 & 0x200) != 0)
  {
    goto LABEL_95;
  }
  if ((*(_WORD *)&flags & 0x400) != 0)
  {
    if ((v11 & 0x400) == 0)
      goto LABEL_95;
    if (self->_closed)
    {
      if (!*((_BYTE *)v4 + 145))
        goto LABEL_95;
    }
    else if (*((_BYTE *)v4 + 145))
    {
      goto LABEL_95;
    }
  }
  else if ((v11 & 0x400) != 0)
  {
    goto LABEL_95;
  }
  if ((*(_BYTE *)&flags & 0x80) != 0)
  {
    if ((v11 & 0x80) == 0 || self->_referenceFrame != *((_DWORD *)v4 + 34))
      goto LABEL_95;
  }
  else if ((v11 & 0x80) != 0)
  {
    goto LABEL_95;
  }
  if ((*(_WORD *)&flags & 0x800) != 0)
  {
    if ((v11 & 0x800) == 0)
      goto LABEL_95;
    if (self->_muted)
    {
      if (!*((_BYTE *)v4 + 146))
        goto LABEL_95;
    }
    else if (*((_BYTE *)v4 + 146))
    {
      goto LABEL_95;
    }
  }
  else if ((v11 & 0x800) != 0)
  {
    goto LABEL_95;
  }
  if ((*(_BYTE *)&flags & 8) != 0)
  {
    if ((v11 & 8) == 0 || self->_updatedTimestamp != *((double *)v4 + 12))
      goto LABEL_95;
  }
  else if ((v11 & 8) != 0)
  {
    goto LABEL_95;
  }
  if ((*(_WORD *)&flags & 0x100) != 0)
  {
    if ((v11 & 0x100) == 0 || self->_transportType != *((_DWORD *)v4 + 35))
      goto LABEL_95;
  }
  else if ((v11 & 0x100) != 0)
  {
    goto LABEL_95;
  }
  if ((*(_BYTE *)&flags & 0x40) != 0)
  {
    if ((v11 & 0x40) == 0 || self->_protocolVersion != *((_DWORD *)v4 + 33))
      goto LABEL_95;
  }
  else if ((v11 & 0x40) != 0)
  {
    goto LABEL_95;
  }
  if ((*(_BYTE *)&flags & 4) != 0)
  {
    if ((v11 & 4) == 0 || self->_localUpdatedTimestamp != *((double *)v4 + 9))
      goto LABEL_95;
  }
  else if ((v11 & 4) != 0)
  {
    goto LABEL_95;
  }
  waypointInfos = self->_waypointInfos;
  if ((unint64_t)waypointInfos | *((_QWORD *)v4 + 13))
  {
    if (!-[NSMutableArray isEqual:](waypointInfos, "isEqual:"))
      goto LABEL_95;
    flags = self->_flags;
    v11 = *((_DWORD *)v4 + 37);
  }
  if ((*(_BYTE *)&flags & 0x20) != 0)
  {
    if ((v11 & 0x20) == 0 || self->_currentWaypointIndex != *((_DWORD *)v4 + 32))
      goto LABEL_95;
  }
  else if ((v11 & 0x20) != 0)
  {
    goto LABEL_95;
  }
  lastLocation = self->_lastLocation;
  if ((unint64_t)lastLocation | *((_QWORD *)v4 + 8))
  {
    if (!-[GEOSharedNavLocationInfo isEqual:](lastLocation, "isEqual:"))
      goto LABEL_95;
    flags = self->_flags;
    v11 = *((_DWORD *)v4 + 37);
  }
  if ((*(_WORD *)&flags & 0x1000) != 0)
  {
    if ((v11 & 0x1000) != 0)
    {
      if (self->_resumed)
      {
        if (!*((_BYTE *)v4 + 147))
          goto LABEL_95;
        goto LABEL_80;
      }
      if (!*((_BYTE *)v4 + 147))
        goto LABEL_80;
    }
LABEL_95:
    v14 = 0;
    goto LABEL_96;
  }
  if ((v11 & 0x1000) != 0)
    goto LABEL_95;
LABEL_80:
  if ((*(_BYTE *)&flags & 0x10) != 0)
  {
    if ((v11 & 0x10) == 0 || self->_closureReason != *((_DWORD *)v4 + 31))
      goto LABEL_95;
  }
  else if ((v11 & 0x10) != 0)
  {
    goto LABEL_95;
  }
  if ((*(_BYTE *)&flags & 1) != 0)
  {
    if ((v11 & 1) == 0 || self->_arrivedTimestamp != *((double *)v4 + 3))
      goto LABEL_95;
  }
  else if ((v11 & 1) != 0)
  {
    goto LABEL_95;
  }
  if ((*(_BYTE *)&flags & 2) != 0)
  {
    if ((v11 & 2) == 0 || self->_closedTimestamp != *((double *)v4 + 4))
      goto LABEL_95;
    v14 = 1;
  }
  else
  {
    v14 = (v11 & 2) == 0;
  }
LABEL_96:

  return v14;
}

- (unint64_t)hash
{
  $BF82DFFA3B86AEA2BCCD9D24DE4FAEBE flags;
  double updatedTimestamp;
  double v5;
  long double v6;
  double v7;
  unint64_t v8;
  unint64_t v9;
  double localUpdatedTimestamp;
  double v11;
  long double v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  $BF82DFFA3B86AEA2BCCD9D24DE4FAEBE v17;
  uint64_t v18;
  uint64_t v19;
  double arrivedTimestamp;
  double v21;
  long double v22;
  double v23;
  unint64_t v24;
  unint64_t v25;
  double closedTimestamp;
  double v27;
  long double v28;
  double v29;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  NSUInteger v39;
  unint64_t v40;
  unint64_t v41;
  uint64_t v42;
  unint64_t v43;

  -[GEOSharedNavState readAll:](self, "readAll:", 1);
  v43 = -[GEOMapItemStorage hash](self->_destinationInfo, "hash");
  v42 = -[NSMutableArray hash](self->_etaInfos, "hash");
  v41 = -[GEOSharedNavRouteInfo hash](self->_routeInfo, "hash");
  v40 = -[GEOSharedNavSenderInfo hash](self->_senderInfo, "hash");
  v39 = -[NSString hash](self->_groupIdentifier, "hash");
  flags = self->_flags;
  if ((*(_WORD *)&flags & 0x200) != 0)
  {
    v38 = 2654435761 * self->_arrived;
    if ((*(_WORD *)&flags & 0x400) != 0)
    {
LABEL_3:
      v37 = 2654435761 * self->_closed;
      if ((*(_BYTE *)&flags & 0x80) != 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else
  {
    v38 = 0;
    if ((*(_WORD *)&flags & 0x400) != 0)
      goto LABEL_3;
  }
  v37 = 0;
  if ((*(_BYTE *)&flags & 0x80) != 0)
  {
LABEL_4:
    v36 = 2654435761 * self->_referenceFrame;
    if ((*(_WORD *)&flags & 0x800) != 0)
      goto LABEL_5;
LABEL_13:
    v35 = 0;
    if ((*(_BYTE *)&flags & 8) != 0)
      goto LABEL_6;
LABEL_14:
    v8 = 0;
    goto LABEL_17;
  }
LABEL_12:
  v36 = 0;
  if ((*(_WORD *)&flags & 0x800) == 0)
    goto LABEL_13;
LABEL_5:
  v35 = 2654435761 * self->_muted;
  if ((*(_BYTE *)&flags & 8) == 0)
    goto LABEL_14;
LABEL_6:
  updatedTimestamp = self->_updatedTimestamp;
  v5 = -updatedTimestamp;
  if (updatedTimestamp >= 0.0)
    v5 = self->_updatedTimestamp;
  v6 = floor(v5 + 0.5);
  v7 = (v5 - v6) * 1.84467441e19;
  v8 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
  if (v7 >= 0.0)
  {
    if (v7 > 0.0)
      v8 += (unint64_t)v7;
  }
  else
  {
    v8 -= (unint64_t)fabs(v7);
  }
LABEL_17:
  if ((*(_WORD *)&flags & 0x100) != 0)
  {
    v33 = 2654435761 * self->_transportType;
    if ((*(_BYTE *)&flags & 0x40) != 0)
      goto LABEL_19;
  }
  else
  {
    v33 = 0;
    if ((*(_BYTE *)&flags & 0x40) != 0)
    {
LABEL_19:
      v31 = 2654435761 * self->_protocolVersion;
      goto LABEL_22;
    }
  }
  v31 = 0;
LABEL_22:
  v34 = v8;
  if ((*(_BYTE *)&flags & 4) != 0)
  {
    localUpdatedTimestamp = self->_localUpdatedTimestamp;
    v11 = -localUpdatedTimestamp;
    if (localUpdatedTimestamp >= 0.0)
      v11 = self->_localUpdatedTimestamp;
    v12 = floor(v11 + 0.5);
    v13 = (v11 - v12) * 1.84467441e19;
    v9 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0)
        v9 += (unint64_t)v13;
    }
    else
    {
      v9 -= (unint64_t)fabs(v13);
    }
  }
  else
  {
    v9 = 0;
  }
  v14 = -[NSMutableArray hash](self->_waypointInfos, "hash", v31);
  if ((*(_BYTE *)&self->_flags & 0x20) != 0)
    v15 = 2654435761 * self->_currentWaypointIndex;
  else
    v15 = 0;
  v16 = -[GEOSharedNavLocationInfo hash](self->_lastLocation, "hash");
  v17 = self->_flags;
  if ((*(_WORD *)&v17 & 0x1000) == 0)
  {
    v18 = 0;
    if ((*(_BYTE *)&v17 & 0x10) != 0)
      goto LABEL_35;
LABEL_41:
    v19 = 0;
    if ((*(_BYTE *)&v17 & 1) != 0)
      goto LABEL_36;
LABEL_42:
    v24 = 0;
    goto LABEL_45;
  }
  v18 = 2654435761 * self->_resumed;
  if ((*(_BYTE *)&v17 & 0x10) == 0)
    goto LABEL_41;
LABEL_35:
  v19 = 2654435761 * self->_closureReason;
  if ((*(_BYTE *)&v17 & 1) == 0)
    goto LABEL_42;
LABEL_36:
  arrivedTimestamp = self->_arrivedTimestamp;
  v21 = -arrivedTimestamp;
  if (arrivedTimestamp >= 0.0)
    v21 = self->_arrivedTimestamp;
  v22 = floor(v21 + 0.5);
  v23 = (v21 - v22) * 1.84467441e19;
  v24 = 2654435761u * (unint64_t)fmod(v22, 1.84467441e19);
  if (v23 >= 0.0)
  {
    if (v23 > 0.0)
      v24 += (unint64_t)v23;
  }
  else
  {
    v24 -= (unint64_t)fabs(v23);
  }
LABEL_45:
  if ((*(_BYTE *)&v17 & 2) != 0)
  {
    closedTimestamp = self->_closedTimestamp;
    v27 = -closedTimestamp;
    if (closedTimestamp >= 0.0)
      v27 = self->_closedTimestamp;
    v28 = floor(v27 + 0.5);
    v29 = (v27 - v28) * 1.84467441e19;
    v25 = 2654435761u * (unint64_t)fmod(v28, 1.84467441e19);
    if (v29 >= 0.0)
    {
      if (v29 > 0.0)
        v25 += (unint64_t)v29;
    }
    else
    {
      v25 -= (unint64_t)fabs(v29);
    }
  }
  else
  {
    v25 = 0;
  }
  return v42 ^ v43 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v9 ^ v14 ^ v15 ^ v16 ^ v18 ^ v19 ^ v24 ^ v25;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  GEOMapItemStorage *destinationInfo;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  GEOSharedNavRouteInfo *routeInfo;
  uint64_t v13;
  GEOSharedNavSenderInfo *senderInfo;
  uint64_t v15;
  int v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  GEOSharedNavLocationInfo *lastLocation;
  uint64_t v23;
  int v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  destinationInfo = self->_destinationInfo;
  v6 = *((_QWORD *)v4 + 5);
  if (destinationInfo)
  {
    if (v6)
      -[GEOMapItemStorage mergeFrom:](destinationInfo, "mergeFrom:");
  }
  else if (v6)
  {
    -[GEOSharedNavState setDestinationInfo:](self, "setDestinationInfo:");
  }
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v7 = *((id *)v4 + 6);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v30 != v10)
          objc_enumerationMutation(v7);
        -[GEOSharedNavState addEtaInfo:](self, "addEtaInfo:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i));
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v9);
  }

  routeInfo = self->_routeInfo;
  v13 = *((_QWORD *)v4 + 10);
  if (routeInfo)
  {
    if (v13)
      -[GEOSharedNavRouteInfo mergeFrom:](routeInfo, "mergeFrom:");
  }
  else if (v13)
  {
    -[GEOSharedNavState setRouteInfo:](self, "setRouteInfo:");
  }
  senderInfo = self->_senderInfo;
  v15 = *((_QWORD *)v4 + 11);
  if (senderInfo)
  {
    if (v15)
      -[GEOSharedNavSenderInfo mergeFrom:](senderInfo, "mergeFrom:");
  }
  else if (v15)
  {
    -[GEOSharedNavState setSenderInfo:](self, "setSenderInfo:");
  }
  if (*((_QWORD *)v4 + 7))
    -[GEOSharedNavState setGroupIdentifier:](self, "setGroupIdentifier:");
  v16 = *((_DWORD *)v4 + 37);
  if ((v16 & 0x200) != 0)
  {
    self->_arrived = *((_BYTE *)v4 + 144);
    *(_DWORD *)&self->_flags |= 0x200u;
    v16 = *((_DWORD *)v4 + 37);
    if ((v16 & 0x400) == 0)
    {
LABEL_27:
      if ((v16 & 0x80) == 0)
        goto LABEL_28;
      goto LABEL_48;
    }
  }
  else if ((v16 & 0x400) == 0)
  {
    goto LABEL_27;
  }
  self->_closed = *((_BYTE *)v4 + 145);
  *(_DWORD *)&self->_flags |= 0x400u;
  v16 = *((_DWORD *)v4 + 37);
  if ((v16 & 0x80) == 0)
  {
LABEL_28:
    if ((v16 & 0x800) == 0)
      goto LABEL_29;
    goto LABEL_49;
  }
LABEL_48:
  self->_referenceFrame = *((_DWORD *)v4 + 34);
  *(_DWORD *)&self->_flags |= 0x80u;
  v16 = *((_DWORD *)v4 + 37);
  if ((v16 & 0x800) == 0)
  {
LABEL_29:
    if ((v16 & 8) == 0)
      goto LABEL_30;
    goto LABEL_50;
  }
LABEL_49:
  self->_muted = *((_BYTE *)v4 + 146);
  *(_DWORD *)&self->_flags |= 0x800u;
  v16 = *((_DWORD *)v4 + 37);
  if ((v16 & 8) == 0)
  {
LABEL_30:
    if ((v16 & 0x100) == 0)
      goto LABEL_31;
    goto LABEL_51;
  }
LABEL_50:
  self->_updatedTimestamp = *((double *)v4 + 12);
  *(_DWORD *)&self->_flags |= 8u;
  v16 = *((_DWORD *)v4 + 37);
  if ((v16 & 0x100) == 0)
  {
LABEL_31:
    if ((v16 & 0x40) == 0)
      goto LABEL_32;
    goto LABEL_52;
  }
LABEL_51:
  self->_transportType = *((_DWORD *)v4 + 35);
  *(_DWORD *)&self->_flags |= 0x100u;
  v16 = *((_DWORD *)v4 + 37);
  if ((v16 & 0x40) == 0)
  {
LABEL_32:
    if ((v16 & 4) == 0)
      goto LABEL_34;
    goto LABEL_33;
  }
LABEL_52:
  self->_protocolVersion = *((_DWORD *)v4 + 33);
  *(_DWORD *)&self->_flags |= 0x40u;
  if ((*((_DWORD *)v4 + 37) & 4) != 0)
  {
LABEL_33:
    self->_localUpdatedTimestamp = *((double *)v4 + 9);
    *(_DWORD *)&self->_flags |= 4u;
  }
LABEL_34:
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v17 = *((id *)v4 + 13);
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v26;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v26 != v20)
          objc_enumerationMutation(v17);
        -[GEOSharedNavState addWaypointInfo:](self, "addWaypointInfo:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * j), (_QWORD)v25);
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    }
    while (v19);
  }

  if ((*((_BYTE *)v4 + 148) & 0x20) != 0)
  {
    self->_currentWaypointIndex = *((_DWORD *)v4 + 32);
    *(_DWORD *)&self->_flags |= 0x20u;
  }
  lastLocation = self->_lastLocation;
  v23 = *((_QWORD *)v4 + 8);
  if (lastLocation)
  {
    if (v23)
      -[GEOSharedNavLocationInfo mergeFrom:](lastLocation, "mergeFrom:");
  }
  else if (v23)
  {
    -[GEOSharedNavState setLastLocation:](self, "setLastLocation:");
  }
  v24 = *((_DWORD *)v4 + 37);
  if ((v24 & 0x1000) != 0)
  {
    self->_resumed = *((_BYTE *)v4 + 147);
    *(_DWORD *)&self->_flags |= 0x1000u;
    v24 = *((_DWORD *)v4 + 37);
    if ((v24 & 0x10) == 0)
    {
LABEL_58:
      if ((v24 & 1) == 0)
        goto LABEL_59;
LABEL_64:
      self->_arrivedTimestamp = *((double *)v4 + 3);
      *(_DWORD *)&self->_flags |= 1u;
      if ((*((_DWORD *)v4 + 37) & 2) == 0)
        goto LABEL_61;
      goto LABEL_60;
    }
  }
  else if ((v24 & 0x10) == 0)
  {
    goto LABEL_58;
  }
  self->_closureReason = *((_DWORD *)v4 + 31);
  *(_DWORD *)&self->_flags |= 0x10u;
  v24 = *((_DWORD *)v4 + 37);
  if ((v24 & 1) != 0)
    goto LABEL_64;
LABEL_59:
  if ((v24 & 2) != 0)
  {
LABEL_60:
    self->_closedTimestamp = *((double *)v4 + 4);
    *(_DWORD *)&self->_flags |= 2u;
  }
LABEL_61:

}

- (PBUnknownFields)unknownFields
{
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v5;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*((_BYTE *)&self->_flags + 1) & 0x20) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      v5 = reader;
      objc_sync_enter(v5);
      GEOSharedNavStateReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_3040);
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
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v3 = a3;
  v27 = *MEMORY[0x1E0C80C00];
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x202000u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEOSharedNavState readAll:](self, "readAll:", 0);
    -[GEOMapItemStorage clearUnknownFields:](self->_destinationInfo, "clearUnknownFields:", 1);
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v7 = self->_etaInfos;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v22;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v22 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v11++), "clearUnknownFields:", 1);
        }
        while (v9 != v11);
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v9);
    }

    -[GEOSharedNavRouteInfo clearUnknownFields:](self->_routeInfo, "clearUnknownFields:", 1);
    -[GEOSharedNavSenderInfo clearUnknownFields:](self->_senderInfo, "clearUnknownFields:", 1);
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v12 = self->_waypointInfos;
    v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v18;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v18 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v16++), "clearUnknownFields:", 1, (_QWORD)v17);
        }
        while (v14 != v16);
        v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
      }
      while (v14);
    }

    -[GEOSharedNavLocationInfo clearUnknownFields:](self->_lastLocation, "clearUnknownFields:", 1);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_waypointInfos, 0);
  objc_storeStrong((id *)&self->_senderInfo, 0);
  objc_storeStrong((id *)&self->_routeInfo, 0);
  objc_storeStrong((id *)&self->_lastLocation, 0);
  objc_storeStrong((id *)&self->_groupIdentifier, 0);
  objc_storeStrong((id *)&self->_etaInfos, 0);
  objc_storeStrong((id *)&self->_destinationInfo, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
