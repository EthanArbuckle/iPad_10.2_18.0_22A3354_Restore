@implementation GEORouteAttributes

- (GEORouteAttributes)init
{
  GEORouteAttributes *v2;
  GEORouteAttributes *v3;
  GEORouteAttributes *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEORouteAttributes;
  v2 = -[GEORouteAttributes init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORouteAttributes)initWithData:(id)a3
{
  GEORouteAttributes *v3;
  GEORouteAttributes *v4;
  GEORouteAttributes *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEORouteAttributes;
  v3 = -[GEORouteAttributes initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)dealloc
{
  objc_super v3;

  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEORouteAttributes;
  -[GEORouteAttributes dealloc](&v3, sel_dealloc);
}

- (int)mainTransportType
{
  os_unfair_lock_s *p_readerLock;
  $F4D580EDFB4761538EFAA3AFFA5BEEEF flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_BYTE *)&flags & 8) != 0)
    return self->_mainTransportType;
  else
    return 0;
}

- (void)setMainTransportType:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x80000008;
  self->_mainTransportType = a3;
}

- (void)setHasMainTransportType:(BOOL)a3
{
  unsigned int v3;

  if (a3)
    v3 = -2147483640;
  else
    v3 = 0x80000000;
  self->_flags = ($F4D580EDFB4761538EFAA3AFFA5BEEEF)(*(_DWORD *)&self->_flags & 0xFFFFFFF7 | v3);
}

- (BOOL)hasMainTransportType
{
  return (*(_BYTE *)&self->_flags >> 3) & 1;
}

- (id)mainTransportTypeAsString:(int)a3
{
  if (a3 < 7)
    return off_1E1C08870[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsMainTransportType:(id)a3
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

- (BOOL)includePhonetics
{
  os_unfair_lock_s *p_readerLock;
  $F4D580EDFB4761538EFAA3AFFA5BEEEF flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  return (*(_WORD *)&flags & 0x1000) != 0 && self->_includePhonetics;
}

- (void)setIncludePhonetics:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x80001000;
  self->_includePhonetics = a3;
}

- (void)setHasIncludePhonetics:(BOOL)a3
{
  unsigned int v3;

  if (a3)
    v3 = -2147479552;
  else
    v3 = 0x80000000;
  self->_flags = ($F4D580EDFB4761538EFAA3AFFA5BEEEF)(*(_DWORD *)&self->_flags & 0xFFFFEFFF | v3);
}

- (BOOL)hasIncludePhonetics
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 4) & 1;
}

- (BOOL)includeManeuverIcons
{
  os_unfair_lock_s *p_readerLock;
  $F4D580EDFB4761538EFAA3AFFA5BEEEF flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  return (*(_WORD *)&flags & 0x800) == 0 || self->_includeManeuverIcons;
}

- (void)setIncludeManeuverIcons:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x80000800;
  self->_includeManeuverIcons = a3;
}

- (void)setHasIncludeManeuverIcons:(BOOL)a3
{
  unsigned int v3;

  if (a3)
    v3 = -2147481600;
  else
    v3 = 0x80000000;
  self->_flags = ($F4D580EDFB4761538EFAA3AFFA5BEEEF)(*(_DWORD *)&self->_flags & 0xFFFFF7FF | v3);
}

- (BOOL)hasIncludeManeuverIcons
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 3) & 1;
}

- (BOOL)includeZilchPoints
{
  os_unfair_lock_s *p_readerLock;
  $F4D580EDFB4761538EFAA3AFFA5BEEEF flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  return (*(_WORD *)&flags & 0x8000) != 0 && self->_includeZilchPoints;
}

- (void)setIncludeZilchPoints:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x80008000;
  self->_includeZilchPoints = a3;
}

- (void)setHasIncludeZilchPoints:(BOOL)a3
{
  unsigned int v3;

  if (a3)
    v3 = -2147450880;
  else
    v3 = 0x80000000;
  self->_flags = ($F4D580EDFB4761538EFAA3AFFA5BEEEF)(*(_DWORD *)&self->_flags & 0x7FFF7FFF | v3);
}

- (BOOL)hasIncludeZilchPoints
{
  return *((unsigned __int8 *)&self->_flags + 1) >> 7;
}

- (BOOL)includeRoutingPathLeg
{
  os_unfair_lock_s *p_readerLock;
  $F4D580EDFB4761538EFAA3AFFA5BEEEF flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  return (*(_DWORD *)&flags & 0x80000) != 0 && self->_includeRoutingPathLeg;
}

- (void)setIncludeRoutingPathLeg:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x80080000;
  self->_includeRoutingPathLeg = a3;
}

- (void)setHasIncludeRoutingPathLeg:(BOOL)a3
{
  unsigned int v3;

  if (a3)
    v3 = -2146959360;
  else
    v3 = 0x80000000;
  self->_flags = ($F4D580EDFB4761538EFAA3AFFA5BEEEF)(*(_DWORD *)&self->_flags & 0xFFF7FFFF | v3);
}

- (BOOL)hasIncludeRoutingPathLeg
{
  return (*((unsigned __int8 *)&self->_flags + 2) >> 3) & 1;
}

- (BOOL)includeContingencyRoutes
{
  os_unfair_lock_s *p_readerLock;
  $F4D580EDFB4761538EFAA3AFFA5BEEEF flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  return (*(_WORD *)&flags & 0x100) != 0 && self->_includeContingencyRoutes;
}

- (void)setIncludeContingencyRoutes:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x80000100;
  self->_includeContingencyRoutes = a3;
}

- (void)setHasIncludeContingencyRoutes:(BOOL)a3
{
  unsigned int v3;

  if (a3)
    v3 = -2147483392;
  else
    v3 = 0x80000000;
  self->_flags = ($F4D580EDFB4761538EFAA3AFFA5BEEEF)(*(_DWORD *)&self->_flags & 0xFFFFFEFF | v3);
}

- (BOOL)hasIncludeContingencyRoutes
{
  return *((_BYTE *)&self->_flags + 1) & 1;
}

- (BOOL)includeLaneGuidance
{
  os_unfair_lock_s *p_readerLock;
  $F4D580EDFB4761538EFAA3AFFA5BEEEF flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  return (*(_WORD *)&flags & 0x400) != 0 && self->_includeLaneGuidance;
}

- (void)setIncludeLaneGuidance:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x80000400;
  self->_includeLaneGuidance = a3;
}

- (void)setHasIncludeLaneGuidance:(BOOL)a3
{
  unsigned int v3;

  if (a3)
    v3 = -2147482624;
  else
    v3 = 0x80000000;
  self->_flags = ($F4D580EDFB4761538EFAA3AFFA5BEEEF)(*(_DWORD *)&self->_flags & 0xFFFFFBFF | v3);
}

- (BOOL)hasIncludeLaneGuidance
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 2) & 1;
}

- (int)basicPointsToBeIncluded
{
  os_unfair_lock_s *p_readerLock;
  $F4D580EDFB4761538EFAA3AFFA5BEEEF flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_BYTE *)&flags & 2) != 0)
    return self->_basicPointsToBeIncluded;
  else
    return 0;
}

- (void)setBasicPointsToBeIncluded:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x80000002;
  self->_basicPointsToBeIncluded = a3;
}

- (void)setHasBasicPointsToBeIncluded:(BOOL)a3
{
  unsigned int v3;

  if (a3)
    v3 = -2147483646;
  else
    v3 = 0x80000000;
  self->_flags = ($F4D580EDFB4761538EFAA3AFFA5BEEEF)(*(_DWORD *)&self->_flags & 0xFFFFFFFD | v3);
}

- (BOOL)hasBasicPointsToBeIncluded
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (id)basicPointsToBeIncludedAsString:(int)a3
{
  if (a3 < 3)
    return off_1E1C08568[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsBasicPointsToBeIncluded:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NONE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ALL")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("FILTERED")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)trafficType
{
  os_unfair_lock_s *p_readerLock;
  $F4D580EDFB4761538EFAA3AFFA5BEEEF flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_BYTE *)&flags & 0x10) != 0)
    return self->_trafficType;
  else
    return 1;
}

- (void)setTrafficType:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x80000010;
  self->_trafficType = a3;
}

- (void)setHasTrafficType:(BOOL)a3
{
  unsigned int v3;

  if (a3)
    v3 = -2147483632;
  else
    v3 = 0x80000000;
  self->_flags = ($F4D580EDFB4761538EFAA3AFFA5BEEEF)(*(_DWORD *)&self->_flags & 0xFFFFFFEF | v3);
}

- (BOOL)hasTrafficType
{
  return (*(_BYTE *)&self->_flags >> 4) & 1;
}

- (id)trafficTypeAsString:(int)a3
{
  if ((a3 - 1) < 3)
    return off_1E1C08580[a3 - 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsTrafficType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("STATIC_SPEEDS")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HISTORICAL_SPEEDS")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("LIVE_SPEEDS")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (void)_readPhoneticLocaleIdentifier
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 176));
    if ((*(_BYTE *)(a1 + 219) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORouteAttributesReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPhoneticLocaleIdentifier_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 176));
  }
}

- (BOOL)hasPhoneticLocaleIdentifier
{
  -[GEORouteAttributes _readPhoneticLocaleIdentifier]((uint64_t)self);
  return self->_phoneticLocaleIdentifier != 0;
}

- (NSString)phoneticLocaleIdentifier
{
  -[GEORouteAttributes _readPhoneticLocaleIdentifier]((uint64_t)self);
  return self->_phoneticLocaleIdentifier;
}

- (void)setPhoneticLocaleIdentifier:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x90000000;
  objc_storeStrong((id *)&self->_phoneticLocaleIdentifier, a3);
}

- (BOOL)includeTrafficAlongRoute
{
  os_unfair_lock_s *p_readerLock;
  $F4D580EDFB4761538EFAA3AFFA5BEEEF flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  return (*(_WORD *)&flags & 0x2000) != 0 && self->_includeTrafficAlongRoute;
}

- (void)setIncludeTrafficAlongRoute:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x80002000;
  self->_includeTrafficAlongRoute = a3;
}

- (void)setHasIncludeTrafficAlongRoute:(BOOL)a3
{
  unsigned int v3;

  if (a3)
    v3 = -2147475456;
  else
    v3 = 0x80000000;
  self->_flags = ($F4D580EDFB4761538EFAA3AFFA5BEEEF)(*(_DWORD *)&self->_flags & 0xFFFFDFFF | v3);
}

- (BOOL)hasIncludeTrafficAlongRoute
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 5) & 1;
}

- (GEOTimepoint)timepoint
{
  *retstr = self[4];
  return self;
}

- (void)setTimepoint:(GEOTimepoint *)a3
{
  uint64_t v3;

  *(_DWORD *)&self->_flags |= 0x80000001;
  v3 = *(_QWORD *)&a3->_type;
  *(_OWORD *)&self->_timepoint._currentUserTime = *(_OWORD *)&a3->_currentUserTime;
  *(_QWORD *)&self->_timepoint._type = v3;
}

- (void)setHasTimepoint:(BOOL)a3
{
  self->_flags = ($F4D580EDFB4761538EFAA3AFFA5BEEEF)(*(_DWORD *)&self->_flags & 0x7FFFFFFE | a3 | 0x80000000);
}

- (BOOL)hasTimepoint
{
  return *(_DWORD *)&self->_flags & 1;
}

- (BOOL)includeHistoricTravelTime
{
  os_unfair_lock_s *p_readerLock;
  $F4D580EDFB4761538EFAA3AFFA5BEEEF flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  return (*(_WORD *)&flags & 0x200) == 0 || self->_includeHistoricTravelTime;
}

- (void)setIncludeHistoricTravelTime:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x80000200;
  self->_includeHistoricTravelTime = a3;
}

- (void)setHasIncludeHistoricTravelTime:(BOOL)a3
{
  unsigned int v3;

  if (a3)
    v3 = -2147483136;
  else
    v3 = 0x80000000;
  self->_flags = ($F4D580EDFB4761538EFAA3AFFA5BEEEF)(*(_DWORD *)&self->_flags & 0xFFFFFDFF | v3);
}

- (BOOL)hasIncludeHistoricTravelTime
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 1) & 1;
}

- (BOOL)includeTrafficIncidents
{
  os_unfair_lock_s *p_readerLock;
  $F4D580EDFB4761538EFAA3AFFA5BEEEF flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  return (*(_WORD *)&flags & 0x4000) != 0 && self->_includeTrafficIncidents;
}

- (void)setIncludeTrafficIncidents:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x80004000;
  self->_includeTrafficIncidents = a3;
}

- (void)setHasIncludeTrafficIncidents:(BOOL)a3
{
  unsigned int v3;

  if (a3)
    v3 = -2147467264;
  else
    v3 = 0x80000000;
  self->_flags = ($F4D580EDFB4761538EFAA3AFFA5BEEEF)(*(_DWORD *)&self->_flags & 0xFFFFBFFF | v3);
}

- (BOOL)hasIncludeTrafficIncidents
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 6) & 1;
}

- (unsigned)walkingLimitMeters
{
  os_unfair_lock_s *p_readerLock;
  $F4D580EDFB4761538EFAA3AFFA5BEEEF flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_BYTE *)&flags & 0x20) != 0)
    return self->_walkingLimitMeters;
  else
    return 800000;
}

- (void)setWalkingLimitMeters:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x80000020;
  self->_walkingLimitMeters = a3;
}

- (void)setHasWalkingLimitMeters:(BOOL)a3
{
  unsigned int v3;

  if (a3)
    v3 = -2147483616;
  else
    v3 = 0x80000000;
  self->_flags = ($F4D580EDFB4761538EFAA3AFFA5BEEEF)(*(_DWORD *)&self->_flags & 0xFFFFFFDF | v3);
}

- (BOOL)hasWalkingLimitMeters
{
  return (*(_BYTE *)&self->_flags >> 5) & 1;
}

- (void)_readAdditionalTransportTypes
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 176));
    if ((*(_BYTE *)(a1 + 218) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORouteAttributesReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAdditionalTransportTypes_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 176));
  }
}

- (unint64_t)additionalTransportTypesCount
{
  -[GEORouteAttributes _readAdditionalTransportTypes]((uint64_t)self);
  return self->_additionalTransportTypes.count;
}

- (int)additionalTransportTypes
{
  -[GEORouteAttributes _readAdditionalTransportTypes]((uint64_t)self);
  return self->_additionalTransportTypes.list;
}

- (void)clearAdditionalTransportTypes
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x400000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x80000000;
  PBRepeatedInt32Clear();
}

- (void)addAdditionalTransportType:(int)a3
{
  -[GEORouteAttributes _readAdditionalTransportTypes]((uint64_t)self);
  if (self)
    PBRepeatedInt32Add();
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x400000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x80000000;
}

- (int)additionalTransportTypeAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_additionalTransportTypes;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEORouteAttributes _readAdditionalTransportTypes]((uint64_t)self);
  p_additionalTransportTypes = &self->_additionalTransportTypes;
  count = self->_additionalTransportTypes.count;
  if (count <= a3)
  {
    v7 = (void *)MEMORY[0x1E0C99DA0];
    v8 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "exceptionWithName:reason:userInfo:", v8, v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "raise");

  }
  return p_additionalTransportTypes->list[a3];
}

- (void)setAdditionalTransportTypes:(int *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x400000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x80000000;
  PBRepeatedInt32Set();
}

- (id)additionalTransportTypesAsString:(int)a3
{
  if (a3 < 7)
    return off_1E1C08870[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsAdditionalTransportTypes:(id)a3
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

- (void)_readAutomobileOptions
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 176));
    if ((*(_BYTE *)(a1 + 219) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORouteAttributesReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAutomobileOptions_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 176));
  }
}

- (BOOL)hasAutomobileOptions
{
  -[GEORouteAttributes _readAutomobileOptions]((uint64_t)self);
  return self->_automobileOptions != 0;
}

- (GEOAutomobileOptions)automobileOptions
{
  -[GEORouteAttributes _readAutomobileOptions]((uint64_t)self);
  return self->_automobileOptions;
}

- (void)setAutomobileOptions:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x82000000;
  objc_storeStrong((id *)&self->_automobileOptions, a3);
}

- (void)_readCyclingOptions
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 176));
    if ((*(_BYTE *)(a1 + 219) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORouteAttributesReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCyclingOptions_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 176));
  }
}

- (BOOL)hasCyclingOptions
{
  -[GEORouteAttributes _readCyclingOptions]((uint64_t)self);
  return self->_cyclingOptions != 0;
}

- (GEOCyclingOptions)cyclingOptions
{
  -[GEORouteAttributes _readCyclingOptions]((uint64_t)self);
  return self->_cyclingOptions;
}

- (void)setCyclingOptions:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x84000000;
  objc_storeStrong((id *)&self->_cyclingOptions, a3);
}

- (void)_readTransitOptions
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 176));
    if ((*(_BYTE *)(a1 + 219) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORouteAttributesReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTransitOptions_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 176));
  }
}

- (BOOL)hasTransitOptions
{
  -[GEORouteAttributes _readTransitOptions]((uint64_t)self);
  return self->_transitOptions != 0;
}

- (GEOTransitOptions)transitOptions
{
  -[GEORouteAttributes _readTransitOptions]((uint64_t)self);
  return self->_transitOptions;
}

- (void)setTransitOptions:(id)a3
{
  *(_DWORD *)&self->_flags |= 0xA0000000;
  objc_storeStrong((id *)&self->_transitOptions, a3);
}

- (void)_readWalkingOptions
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 176));
    if ((*(_BYTE *)(a1 + 219) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORouteAttributesReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readWalkingOptions_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 176));
  }
}

- (BOOL)hasWalkingOptions
{
  -[GEORouteAttributes _readWalkingOptions]((uint64_t)self);
  return self->_walkingOptions != 0;
}

- (GEOWalkingOptions)walkingOptions
{
  -[GEORouteAttributes _readWalkingOptions]((uint64_t)self);
  return self->_walkingOptions;
}

- (void)setWalkingOptions:(id)a3
{
  *(_DWORD *)&self->_flags |= 0xC0000000;
  objc_storeStrong((id *)&self->_walkingOptions, a3);
}

- (void)_readUiContexts
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 176));
    if ((*(_BYTE *)(a1 + 219) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORouteAttributesReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readUiContexts_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 176));
  }
}

- (unint64_t)uiContextsCount
{
  -[GEORouteAttributes _readUiContexts]((uint64_t)self);
  return self->_uiContexts.count;
}

- (int)uiContexts
{
  -[GEORouteAttributes _readUiContexts]((uint64_t)self);
  return self->_uiContexts.list;
}

- (void)clearUiContexts
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x1000000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x80000000;
  PBRepeatedInt32Clear();
}

- (void)addUiContext:(int)a3
{
  -[GEORouteAttributes _readUiContexts]((uint64_t)self);
  if (self)
    PBRepeatedInt32Add();
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x1000000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x80000000;
}

- (int)uiContextAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_uiContexts;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEORouteAttributes _readUiContexts]((uint64_t)self);
  p_uiContexts = &self->_uiContexts;
  count = self->_uiContexts.count;
  if (count <= a3)
  {
    v7 = (void *)MEMORY[0x1E0C99DA0];
    v8 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "exceptionWithName:reason:userInfo:", v8, v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "raise");

  }
  return p_uiContexts->list[a3];
}

- (void)setUiContexts:(int *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x1000000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x80000000;
  PBRepeatedInt32Set();
}

- (id)uiContextsAsString:(int)a3
{
  if ((a3 - 1) < 4)
    return off_1E1C08598[a3 - 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsUiContexts:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SIGN")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LIST")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GENERIC")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("SPOKEN")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (BOOL)useMetricThreshold
{
  return self->_useMetricThreshold;
}

- (void)setUseMetricThreshold:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x80100000;
  self->_useMetricThreshold = a3;
}

- (void)setHasUseMetricThreshold:(BOOL)a3
{
  unsigned int v3;

  if (a3)
    v3 = -2146435072;
  else
    v3 = 0x80000000;
  self->_flags = ($F4D580EDFB4761538EFAA3AFFA5BEEEF)(*(_DWORD *)&self->_flags & 0xFFEFFFFF | v3);
}

- (BOOL)hasUseMetricThreshold
{
  return (*((unsigned __int8 *)&self->_flags + 2) >> 4) & 1;
}

- (BOOL)enableExperimentalMode
{
  os_unfair_lock_s *p_readerLock;
  $F4D580EDFB4761538EFAA3AFFA5BEEEF flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  return (*(_BYTE *)&flags & 0x80) != 0 && self->_enableExperimentalMode;
}

- (void)setEnableExperimentalMode:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x80000080;
  self->_enableExperimentalMode = a3;
}

- (void)setHasEnableExperimentalMode:(BOOL)a3
{
  unsigned int v3;

  if (a3)
    v3 = -2147483520;
  else
    v3 = 0x80000000;
  self->_flags = ($F4D580EDFB4761538EFAA3AFFA5BEEEF)(*(_DWORD *)&self->_flags & 0xFFFFFF7F | v3);
}

- (BOOL)hasEnableExperimentalMode
{
  return *(_BYTE *)&self->_flags >> 7;
}

- (void)_readDestinationInfo
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 176));
    if ((*(_BYTE *)(a1 + 219) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORouteAttributesReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDestinationInfo_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 176));
  }
}

- (BOOL)hasDestinationInfo
{
  -[GEORouteAttributes _readDestinationInfo]((uint64_t)self);
  return self->_destinationInfo != 0;
}

- (GEOWaypointNameProperties)destinationInfo
{
  -[GEORouteAttributes _readDestinationInfo]((uint64_t)self);
  return self->_destinationInfo;
}

- (void)setDestinationInfo:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x88000000;
  objc_storeStrong((id *)&self->_destinationInfo, a3);
}

- (int)destinationType
{
  os_unfair_lock_s *p_readerLock;
  $F4D580EDFB4761538EFAA3AFFA5BEEEF flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_BYTE *)&flags & 4) != 0)
    return self->_destinationType;
  else
    return 0;
}

- (void)setDestinationType:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x80000004;
  self->_destinationType = a3;
}

- (void)setHasDestinationType:(BOOL)a3
{
  unsigned int v3;

  if (a3)
    v3 = -2147483644;
  else
    v3 = 0x80000000;
  self->_flags = ($F4D580EDFB4761538EFAA3AFFA5BEEEF)(*(_DWORD *)&self->_flags & 0xFFFFFFFB | v3);
}

- (BOOL)hasDestinationType
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (id)destinationTypeAsString:(int)a3
{
  if (a3 < 0xE)
    return off_1E1C085B8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsDestinationType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WAYPOINT_UNSPECIFIED")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WAYPOINT_WORK")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WAYPOINT_HOME")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WAYPOINT_CONTACT_WORK")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WAYPOINT_CONTACT_HOME")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WAYPOINT_CONTACT_OTHER")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WAYPOINT_POI")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WAYPOINT_ADDRESS")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WAYPOINT_UNKNOWN")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WAYPOINT_CUSTOM")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WAYPOINT_SCHOOL")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WAYPOINT_CONTACT_SCHOOL")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WAYPOINT_PERSON_LOCATION")) & 1) != 0)
  {
    v4 = 12;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("WAYPOINT_CONTACT_CUSTOM_LABEL_ADDRESS")))
  {
    v4 = 13;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)includeCrossLanguagePhonetics
{
  return self->_includeCrossLanguagePhonetics;
}

- (void)setIncludeCrossLanguagePhonetics:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x80020000;
  self->_includeCrossLanguagePhonetics = a3;
}

- (void)setHasIncludeCrossLanguagePhonetics:(BOOL)a3
{
  unsigned int v3;

  if (a3)
    v3 = -2147352576;
  else
    v3 = 0x80000000;
  self->_flags = ($F4D580EDFB4761538EFAA3AFFA5BEEEF)(*(_DWORD *)&self->_flags & 0xFFFDFFFF | v3);
}

- (BOOL)hasIncludeCrossLanguagePhonetics
{
  return (*((unsigned __int8 *)&self->_flags + 2) >> 1) & 1;
}

- (BOOL)directZilchByLaneFlowlines
{
  return self->_directZilchByLaneFlowlines;
}

- (void)setDirectZilchByLaneFlowlines:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x80000040;
  self->_directZilchByLaneFlowlines = a3;
}

- (void)setHasDirectZilchByLaneFlowlines:(BOOL)a3
{
  unsigned int v3;

  if (a3)
    v3 = -2147483584;
  else
    v3 = 0x80000000;
  self->_flags = ($F4D580EDFB4761538EFAA3AFFA5BEEEF)(*(_DWORD *)&self->_flags & 0xFFFFFFBF | v3);
}

- (BOOL)hasDirectZilchByLaneFlowlines
{
  return (*(_BYTE *)&self->_flags >> 6) & 1;
}

- (BOOL)includeLaneWidths
{
  return self->_includeLaneWidths;
}

- (void)setIncludeLaneWidths:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x80040000;
  self->_includeLaneWidths = a3;
}

- (void)setHasIncludeLaneWidths:(BOOL)a3
{
  unsigned int v3;

  if (a3)
    v3 = -2147221504;
  else
    v3 = 0x80000000;
  self->_flags = ($F4D580EDFB4761538EFAA3AFFA5BEEEF)(*(_DWORD *)&self->_flags & 0xFFFBFFFF | v3);
}

- (BOOL)hasIncludeLaneWidths
{
  return (*((unsigned __int8 *)&self->_flags + 2) >> 2) & 1;
}

- (void)_readInitialPromptTypes
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 176));
    if ((*(_BYTE *)(a1 + 218) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORouteAttributesReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readInitialPromptTypes_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 176));
  }
}

- (unint64_t)initialPromptTypesCount
{
  -[GEORouteAttributes _readInitialPromptTypes]((uint64_t)self);
  return self->_initialPromptTypes.count;
}

- (int)initialPromptTypes
{
  -[GEORouteAttributes _readInitialPromptTypes]((uint64_t)self);
  return self->_initialPromptTypes.list;
}

- (void)clearInitialPromptTypes
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x800000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x80000000;
  PBRepeatedInt32Clear();
}

- (void)addInitialPromptType:(int)a3
{
  -[GEORouteAttributes _readInitialPromptTypes]((uint64_t)self);
  if (self)
    PBRepeatedInt32Add();
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x800000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x80000000;
}

- (int)initialPromptTypeAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_initialPromptTypes;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEORouteAttributes _readInitialPromptTypes]((uint64_t)self);
  p_initialPromptTypes = &self->_initialPromptTypes;
  count = self->_initialPromptTypes.count;
  if (count <= a3)
  {
    v7 = (void *)MEMORY[0x1E0C99DA0];
    v8 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "exceptionWithName:reason:userInfo:", v8, v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "raise");

  }
  return p_initialPromptTypes->list[a3];
}

- (void)setInitialPromptTypes:(int *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x800000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x80000000;
  PBRepeatedInt32Set();
}

- (id)initialPromptTypesAsString:(int)a3
{
  __CFString *v3;

  if (!a3)
    return CFSTR("PROMPT_UNKNOWN");
  if (a3 == 1)
  {
    v3 = CFSTR("PROMPT_DISCOVER_INCIDENTS");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsInitialPromptTypes:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PROMPT_UNKNOWN")) & 1) != 0)
    v4 = 0;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("PROMPT_DISCOVER_INCIDENTS"));

  return v4;
}

- (BOOL)includeCellularCoverage
{
  return self->_includeCellularCoverage;
}

- (void)setIncludeCellularCoverage:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x80010000;
  self->_includeCellularCoverage = a3;
}

- (void)setHasIncludeCellularCoverage:(BOOL)a3
{
  unsigned int v3;

  if (a3)
    v3 = -2147418112;
  else
    v3 = 0x80000000;
  self->_flags = ($F4D580EDFB4761538EFAA3AFFA5BEEEF)(*(_DWORD *)&self->_flags & 0xFFFEFFFF | v3);
}

- (BOOL)hasIncludeCellularCoverage
{
  return *((_BYTE *)&self->_flags + 2) & 1;
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
  v8.super_class = (Class)GEORouteAttributes;
  -[GEORouteAttributes description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORouteAttributes dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORouteAttributes _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  int v5;
  uint64_t v6;
  __CFString *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  __CFString *v17;
  unsigned int v18;
  __CFString *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  _QWORD *v24;
  unint64_t v25;
  uint64_t v26;
  __CFString *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  _QWORD *v45;
  unint64_t v46;
  uint64_t v47;
  __CFString *v48;
  const __CFString *v49;
  int v50;
  void *v51;
  const __CFString *v52;
  void *v53;
  const __CFString *v54;
  void *v55;
  void *v56;
  void *v57;
  const __CFString *v58;
  id v59;
  int v60;
  void *v61;
  const __CFString *v62;
  void *v63;
  _QWORD *v64;
  unint64_t v65;
  uint64_t v66;
  __CFString *v67;
  const __CFString *v68;
  void *v69;
  const __CFString *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  id v75;
  id v76;
  id v77;
  uint64_t v79;
  __CFString *v80;
  const __CFString *v81;
  void *v82;
  const __CFString *v83;
  void *v84;
  const __CFString *v85;
  _QWORD v86[4];
  id v87;

  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_DWORD *)(a1 + 216);
  if ((v5 & 8) != 0)
  {
    v6 = *(int *)(a1 + 188);
    if (v6 >= 7)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 188));
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_1E1C08870[v6];
    }
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("mainTransportType"));

    v5 = *(_DWORD *)(a1 + 216);
  }
  v8 = 0x1E0CB3000uLL;
  if ((v5 & 0x1000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 206));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("includePhonetics"));

    v5 = *(_DWORD *)(a1 + 216);
    if ((v5 & 0x800) == 0)
    {
LABEL_9:
      if ((v5 & 0x8000) == 0)
        goto LABEL_10;
      goto LABEL_18;
    }
  }
  else if ((v5 & 0x800) == 0)
  {
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 205));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("includeManeuverIcons"));

  v5 = *(_DWORD *)(a1 + 216);
  if ((v5 & 0x8000) == 0)
  {
LABEL_10:
    if ((v5 & 0x80000) == 0)
      goto LABEL_11;
    goto LABEL_19;
  }
LABEL_18:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 209));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("includeZilchPoints"));

  v5 = *(_DWORD *)(a1 + 216);
  if ((v5 & 0x80000) == 0)
  {
LABEL_11:
    if ((v5 & 0x100) == 0)
      goto LABEL_12;
    goto LABEL_23;
  }
LABEL_19:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 213));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v13 = CFSTR("includeRoutingPathLeg");
  else
    v13 = CFSTR("include_routing_path_leg");
  objc_msgSend(v4, "setObject:forKey:", v12, v13);

  v5 = *(_DWORD *)(a1 + 216);
  if ((v5 & 0x100) == 0)
  {
LABEL_12:
    if ((v5 & 0x400) == 0)
      goto LABEL_13;
    goto LABEL_24;
  }
LABEL_23:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 202));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("includeContingencyRoutes"));

  v5 = *(_DWORD *)(a1 + 216);
  if ((v5 & 0x400) == 0)
  {
LABEL_13:
    if ((v5 & 2) == 0)
      goto LABEL_14;
    goto LABEL_25;
  }
LABEL_24:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 204));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("includeLaneGuidance"));

  v5 = *(_DWORD *)(a1 + 216);
  if ((v5 & 2) == 0)
  {
LABEL_14:
    if ((v5 & 0x10) == 0)
      goto LABEL_33;
    goto LABEL_29;
  }
LABEL_25:
  v16 = *(int *)(a1 + 180);
  if (v16 >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 180));
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = off_1E1C08568[v16];
  }
  objc_msgSend(v4, "setObject:forKey:", v17, CFSTR("basicPointsToBeIncluded"));

  if ((*(_DWORD *)(a1 + 216) & 0x10) != 0)
  {
LABEL_29:
    v18 = *(_DWORD *)(a1 + 192) - 1;
    if (v18 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 192));
      v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v19 = off_1E1C08580[v18];
    }
    objc_msgSend(v4, "setObject:forKey:", v19, CFSTR("trafficType"));

  }
LABEL_33:
  objc_msgSend((id)a1, "phoneticLocaleIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
    objc_msgSend(v4, "setObject:forKey:", v20, CFSTR("phoneticLocaleIdentifier"));

  v21 = *(_DWORD *)(a1 + 216);
  if ((v21 & 0x2000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 207));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v30, CFSTR("includeTrafficAlongRoute"));

    v21 = *(_DWORD *)(a1 + 216);
    if ((v21 & 1) == 0)
    {
LABEL_37:
      if ((v21 & 0x200) == 0)
        goto LABEL_38;
      goto LABEL_54;
    }
  }
  else if ((v21 & 1) == 0)
  {
    goto LABEL_37;
  }
  _GEOTimepointDictionaryRepresentation(a1 + 96, a2);
  v31 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setObject:forKey:", v31, CFSTR("timepoint"));
  v21 = *(_DWORD *)(a1 + 216);
  if ((v21 & 0x200) == 0)
  {
LABEL_38:
    if ((v21 & 0x4000) == 0)
      goto LABEL_39;
    goto LABEL_55;
  }
LABEL_54:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 203));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v32, CFSTR("includeHistoricTravelTime"));

  v21 = *(_DWORD *)(a1 + 216);
  if ((v21 & 0x4000) == 0)
  {
LABEL_39:
    if ((v21 & 0x20) == 0)
      goto LABEL_41;
    goto LABEL_40;
  }
LABEL_55:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 208));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v33, CFSTR("includeTrafficIncidents"));

  if ((*(_DWORD *)(a1 + 216) & 0x20) != 0)
  {
LABEL_40:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 196));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v22, CFSTR("walkingLimitMeters"));

  }
LABEL_41:
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (_QWORD *)(a1 + 24);
    if (*(_QWORD *)(a1 + 32))
    {
      v25 = 0;
      do
      {
        v26 = *(int *)(*v24 + 4 * v25);
        if (v26 >= 7)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v26);
          v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v27 = off_1E1C08870[v26];
        }
        objc_msgSend(v23, "addObject:", v27);

        ++v25;
        v24 = (_QWORD *)(a1 + 24);
      }
      while (v25 < *(_QWORD *)(a1 + 32));
    }
    objc_msgSend(v4, "setObject:forKey:", v23, CFSTR("additionalTransportType"));

    v8 = 0x1E0CB3000;
  }
  objc_msgSend((id)a1, "automobileOptions");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v28;
  if (v28)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v28, "jsonRepresentation");
    else
      objc_msgSend(v28, "dictionaryRepresentation");
    v34 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKey:", v34, CFSTR("automobileOptions"));
  }

  objc_msgSend((id)a1, "cyclingOptions");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v35;
  if (v35)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v35, "jsonRepresentation");
    else
      objc_msgSend(v35, "dictionaryRepresentation");
    v37 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKey:", v37, CFSTR("cyclingOptions"));
  }

  objc_msgSend((id)a1, "transitOptions");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v38;
  if (v38)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v38, "jsonRepresentation");
    else
      objc_msgSend(v38, "dictionaryRepresentation");
    v40 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKey:", v40, CFSTR("transitOptions"));
  }

  objc_msgSend((id)a1, "walkingOptions");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = v41;
  if (v41)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v41, "jsonRepresentation");
    else
      objc_msgSend(v41, "dictionaryRepresentation");
    v43 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKey:", v43, CFSTR("walkingOptions"));
  }

  if (*(_QWORD *)(a1 + 80))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = (_QWORD *)(a1 + 72);
    if (*(_QWORD *)(a1 + 80))
    {
      v46 = 0;
      do
      {
        v47 = *(unsigned int *)(*v45 + 4 * v46);
        if ((v47 - 1) >= 4)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v47);
          v48 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v48 = off_1E1C08598[(int)v47 - 1];
        }
        objc_msgSend(v44, "addObject:", v48);

        ++v46;
        v45 = (_QWORD *)(a1 + 72);
      }
      while (v46 < *(_QWORD *)(a1 + 80));
    }
    if (a2)
      v49 = CFSTR("uiContext");
    else
      v49 = CFSTR("ui_context");
    objc_msgSend(v4, "setObject:forKey:", v44, v49);

    v8 = 0x1E0CB3000uLL;
  }
  v50 = *(_DWORD *)(a1 + 216);
  if ((v50 & 0x100000) != 0)
  {
    objc_msgSend(*(id *)(v8 + 2024), "numberWithBool:", *(unsigned __int8 *)(a1 + 214));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v52 = CFSTR("useMetricThreshold");
    else
      v52 = CFSTR("use_metric_threshold");
    objc_msgSend(v4, "setObject:forKey:", v51, v52);

    v50 = *(_DWORD *)(a1 + 216);
  }
  if ((v50 & 0x80) != 0)
  {
    objc_msgSend(*(id *)(v8 + 2024), "numberWithBool:", *(unsigned __int8 *)(a1 + 201));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v54 = CFSTR("enableExperimentalMode");
    else
      v54 = CFSTR("enable_experimental_mode");
    objc_msgSend(v4, "setObject:forKey:", v53, v54);

  }
  objc_msgSend((id)a1, "destinationInfo");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = v55;
  if (v55)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v55, "jsonRepresentation");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = CFSTR("destinationInfo");
    }
    else
    {
      objc_msgSend(v55, "dictionaryRepresentation");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = CFSTR("destination_info");
    }
    v59 = v57;

    objc_msgSend(v4, "setObject:forKey:", v59, v58);
  }

  v60 = *(_DWORD *)(a1 + 216);
  if ((v60 & 4) != 0)
  {
    v79 = *(int *)(a1 + 184);
    if (v79 >= 0xE)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 184));
      v80 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v80 = off_1E1C085B8[v79];
    }
    if (a2)
      v81 = CFSTR("destinationType");
    else
      v81 = CFSTR("destination_type");
    objc_msgSend(v4, "setObject:forKey:", v80, v81);

    v60 = *(_DWORD *)(a1 + 216);
    if ((v60 & 0x20000) == 0)
    {
LABEL_102:
      if ((v60 & 0x40) == 0)
        goto LABEL_103;
LABEL_142:
      objc_msgSend(*(id *)(v8 + 2024), "numberWithBool:", *(unsigned __int8 *)(a1 + 200));
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
        v85 = CFSTR("directZilchByLaneFlowlines");
      else
        v85 = CFSTR("direct_zilch_by_lane_flowlines");
      objc_msgSend(v4, "setObject:forKey:", v84, v85);

      if ((*(_DWORD *)(a1 + 216) & 0x40000) == 0)
        goto LABEL_108;
      goto LABEL_104;
    }
  }
  else if ((v60 & 0x20000) == 0)
  {
    goto LABEL_102;
  }
  objc_msgSend(*(id *)(v8 + 2024), "numberWithBool:", *(unsigned __int8 *)(a1 + 211));
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v83 = CFSTR("includeCrossLanguagePhonetics");
  else
    v83 = CFSTR("include_cross_language_phonetics");
  objc_msgSend(v4, "setObject:forKey:", v82, v83);

  v60 = *(_DWORD *)(a1 + 216);
  if ((v60 & 0x40) != 0)
    goto LABEL_142;
LABEL_103:
  if ((v60 & 0x40000) != 0)
  {
LABEL_104:
    objc_msgSend(*(id *)(v8 + 2024), "numberWithBool:", *(unsigned __int8 *)(a1 + 212));
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v62 = CFSTR("includeLaneWidths");
    else
      v62 = CFSTR("include_lane_widths");
    objc_msgSend(v4, "setObject:forKey:", v61, v62);

  }
LABEL_108:
  if (*(_QWORD *)(a1 + 56))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = (_QWORD *)(a1 + 48);
    if (*(_QWORD *)(a1 + 56))
    {
      v65 = 0;
      do
      {
        v66 = *(unsigned int *)(*v64 + 4 * v65);
        if ((_DWORD)v66)
        {
          if ((_DWORD)v66 == 1)
          {
            v67 = CFSTR("PROMPT_DISCOVER_INCIDENTS");
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v66);
            v67 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
        }
        else
        {
          v67 = CFSTR("PROMPT_UNKNOWN");
        }
        objc_msgSend(v63, "addObject:", v67);

        ++v65;
        v64 = (_QWORD *)(a1 + 48);
      }
      while (v65 < *(_QWORD *)(a1 + 56));
    }
    if (a2)
      v68 = CFSTR("initialPromptType");
    else
      v68 = CFSTR("initial_prompt_type");
    objc_msgSend(v4, "setObject:forKey:", v63, v68);

    v8 = 0x1E0CB3000uLL;
  }
  if ((*(_BYTE *)(a1 + 218) & 1) != 0)
  {
    objc_msgSend(*(id *)(v8 + 2024), "numberWithBool:", *(unsigned __int8 *)(a1 + 210));
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v70 = CFSTR("includeCellularCoverage");
    else
      v70 = CFSTR("include_cellular_coverage");
    objc_msgSend(v4, "setObject:forKey:", v69, v70);

  }
  v71 = *(void **)(a1 + 16);
  if (v71)
  {
    objc_msgSend(v71, "dictionaryRepresentation");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = v72;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v72, "count"));
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      v86[0] = MEMORY[0x1E0C809B0];
      v86[1] = 3221225472;
      v86[2] = __48__GEORouteAttributes__dictionaryRepresentation___block_invoke;
      v86[3] = &unk_1E1C00600;
      v75 = v74;
      v87 = v75;
      objc_msgSend(v73, "enumerateKeysAndObjectsUsingBlock:", v86);
      v76 = v75;

      v73 = v76;
    }
    objc_msgSend(v4, "setObject:forKey:", v73, CFSTR("Unknown Fields"));

  }
  v77 = v4;

  return v77;
}

- (id)jsonRepresentation
{
  return -[GEORouteAttributes _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __48__GEORouteAttributes__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEORouteAttributes)initWithDictionary:(id)a3
{
  return (GEORouteAttributes *)-[GEORouteAttributes _initWithDictionary:isJSON:](self, a3, 0);
}

- (id)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  id v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t i;
  void *v38;
  id v39;
  uint64_t v40;
  void *v41;
  GEOAutomobileOptions *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  GEOCyclingOptions *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  GEOTransitOptions *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  GEOWalkingOptions *v54;
  uint64_t v55;
  void *v56;
  const __CFString *v57;
  void *v58;
  id v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t j;
  void *v64;
  unint64_t v65;
  unint64_t v66;
  id v67;
  uint64_t v68;
  const __CFString *v69;
  void *v70;
  const __CFString *v71;
  void *v72;
  const __CFString *v73;
  void *v74;
  GEOWaypointNameProperties *v75;
  uint64_t v76;
  void *v77;
  const __CFString *v78;
  void *v79;
  id v80;
  uint64_t v81;
  const __CFString *v82;
  void *v83;
  const __CFString *v84;
  void *v85;
  const __CFString *v86;
  void *v87;
  const __CFString *v88;
  void *v89;
  id v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t k;
  void *v95;
  id v96;
  uint64_t v97;
  const __CFString *v98;
  void *v99;
  void *v101;
  void *v102;
  void *v103;
  int v104;
  id v105;
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
  uint64_t v119;
  __int128 v120;
  uint64_t v121;
  _BYTE v122[128];
  _BYTE v123[128];
  _BYTE v124[128];
  uint64_t v125;

  v125 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (!a1)
    goto LABEL_246;
  v6 = (id)objc_msgSend(a1, "init");

  if (!v6)
  {
    a1 = 0;
    goto LABEL_246;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("mainTransportType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0x1E0CB3000uLL;
  objc_opt_class();
  v9 = 0x1E0CB3000uLL;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = v7;
    if ((objc_msgSend(v10, "isEqualToString:", CFSTR("AUTOMOBILE")) & 1) != 0)
    {
      v11 = 0;
    }
    else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("TRANSIT")) & 1) != 0)
    {
      v11 = 1;
    }
    else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("WALKING")) & 1) != 0)
    {
      v11 = 2;
    }
    else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("BICYCLE")) & 1) != 0)
    {
      v11 = 3;
    }
    else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("UNKNOWN_TRANSPORT_TYPE")) & 1) != 0)
    {
      v11 = 4;
    }
    else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("FERRY")) & 1) != 0)
    {
      v11 = 5;
    }
    else if (objc_msgSend(v10, "isEqualToString:", CFSTR("RIDESHARE")))
    {
      v11 = 6;
    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_24;
    v11 = objc_msgSend(v7, "intValue");
  }
  objc_msgSend(v6, "setMainTransportType:", v11);
LABEL_24:

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("includePhonetics"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setIncludePhonetics:", objc_msgSend(v12, "BOOLValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("includeManeuverIcons"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setIncludeManeuverIcons:", objc_msgSend(v13, "BOOLValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("includeZilchPoints"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setIncludeZilchPoints:", objc_msgSend(v14, "BOOLValue"));

  if (a3)
    v15 = CFSTR("includeRoutingPathLeg");
  else
    v15 = CFSTR("include_routing_path_leg");
  objc_msgSend(v5, "objectForKeyedSubscript:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setIncludeRoutingPathLeg:", objc_msgSend(v16, "BOOLValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("includeContingencyRoutes"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setIncludeContingencyRoutes:", objc_msgSend(v17, "BOOLValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("includeLaneGuidance"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setIncludeLaneGuidance:", objc_msgSend(v18, "BOOLValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("basicPointsToBeIncluded"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v20 = v19;
    if ((objc_msgSend(v20, "isEqualToString:", CFSTR("NONE")) & 1) != 0)
    {
      v21 = 0;
    }
    else if ((objc_msgSend(v20, "isEqualToString:", CFSTR("ALL")) & 1) != 0)
    {
      v21 = 1;
    }
    else if (objc_msgSend(v20, "isEqualToString:", CFSTR("FILTERED")))
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
      goto LABEL_51;
    v21 = objc_msgSend(v19, "intValue");
  }
  objc_msgSend(v6, "setBasicPointsToBeIncluded:", v21);
LABEL_51:

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("trafficType"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v23 = v22;
    if ((objc_msgSend(v23, "isEqualToString:", CFSTR("STATIC_SPEEDS")) & 1) != 0)
    {
      v24 = 1;
    }
    else if ((objc_msgSend(v23, "isEqualToString:", CFSTR("HISTORICAL_SPEEDS")) & 1) != 0)
    {
      v24 = 2;
    }
    else if (objc_msgSend(v23, "isEqualToString:", CFSTR("LIVE_SPEEDS")))
    {
      v24 = 3;
    }
    else
    {
      v24 = 1;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_63;
    v24 = objc_msgSend(v22, "intValue");
  }
  objc_msgSend(v6, "setTrafficType:", v24);
LABEL_63:

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("phoneticLocaleIdentifier"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v26 = (void *)objc_msgSend(v25, "copy");
    objc_msgSend(v6, "setPhoneticLocaleIdentifier:", v26);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("includeTrafficAlongRoute"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setIncludeTrafficAlongRoute:", objc_msgSend(v27, "BOOLValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("timepoint"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v120 = 0uLL;
    v121 = 0;
    _GEOTimepointFromDictionaryRepresentation(v28, (uint64_t)&v120, a3);
    v118 = v120;
    v119 = v121;
    objc_msgSend(v6, "setTimepoint:", &v118);
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("includeHistoricTravelTime"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setIncludeHistoricTravelTime:", objc_msgSend(v29, "BOOLValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("includeTrafficIncidents"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setIncludeTrafficIncidents:", objc_msgSend(v30, "BOOLValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("walkingLimitMeters"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setWalkingLimitMeters:", objc_msgSend(v31, "unsignedIntValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("additionalTransportType"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v105 = v5;
  v104 = a3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v116 = 0u;
    v117 = 0u;
    v114 = 0u;
    v115 = 0u;
    v101 = v32;
    v33 = v32;
    v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v114, v124, 16);
    if (!v34)
      goto LABEL_103;
    v35 = v34;
    v36 = *(_QWORD *)v115;
    while (1)
    {
      for (i = 0; i != v35; ++i)
      {
        if (*(_QWORD *)v115 != v36)
          objc_enumerationMutation(v33);
        v38 = *(void **)(*((_QWORD *)&v114 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v39 = v38;
          if ((objc_msgSend(v39, "isEqualToString:", CFSTR("AUTOMOBILE")) & 1) != 0)
          {
            v40 = 0;
          }
          else if ((objc_msgSend(v39, "isEqualToString:", CFSTR("TRANSIT")) & 1) != 0)
          {
            v40 = 1;
          }
          else if ((objc_msgSend(v39, "isEqualToString:", CFSTR("WALKING")) & 1) != 0)
          {
            v40 = 2;
          }
          else if ((objc_msgSend(v39, "isEqualToString:", CFSTR("BICYCLE")) & 1) != 0)
          {
            v40 = 3;
          }
          else if ((objc_msgSend(v39, "isEqualToString:", CFSTR("UNKNOWN_TRANSPORT_TYPE")) & 1) != 0)
          {
            v40 = 4;
          }
          else if ((objc_msgSend(v39, "isEqualToString:", CFSTR("FERRY")) & 1) != 0)
          {
            v40 = 5;
          }
          else if (objc_msgSend(v39, "isEqualToString:", CFSTR("RIDESHARE")))
          {
            v40 = 6;
          }
          else
          {
            v40 = 0;
          }

        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            continue;
          v40 = objc_msgSend(v38, "intValue");
        }
        objc_msgSend(v6, "addAdditionalTransportType:", v40);
      }
      v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v114, v124, 16);
      if (!v35)
      {
LABEL_103:

        v5 = v105;
        v9 = 0x1E0CB3000uLL;
        v32 = v101;
        break;
      }
    }
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("automobileOptions"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v42 = [GEOAutomobileOptions alloc];
    if ((a3 & 1) != 0)
      v43 = -[GEOAutomobileOptions initWithJSON:](v42, "initWithJSON:", v41);
    else
      v43 = -[GEOAutomobileOptions initWithDictionary:](v42, "initWithDictionary:", v41);
    v44 = (void *)v43;
    objc_msgSend(v6, "setAutomobileOptions:", v43);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("cyclingOptions"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v46 = [GEOCyclingOptions alloc];
    if ((a3 & 1) != 0)
      v47 = -[GEOCyclingOptions initWithJSON:](v46, "initWithJSON:", v45);
    else
      v47 = -[GEOCyclingOptions initWithDictionary:](v46, "initWithDictionary:", v45);
    v48 = (void *)v47;
    objc_msgSend(v6, "setCyclingOptions:", v47);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("transitOptions"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v50 = [GEOTransitOptions alloc];
    if ((a3 & 1) != 0)
      v51 = -[GEOTransitOptions initWithJSON:](v50, "initWithJSON:", v49);
    else
      v51 = -[GEOTransitOptions initWithDictionary:](v50, "initWithDictionary:", v49);
    v52 = (void *)v51;
    objc_msgSend(v6, "setTransitOptions:", v51);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("walkingOptions"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v54 = [GEOWalkingOptions alloc];
    if ((a3 & 1) != 0)
      v55 = -[GEOWalkingOptions initWithJSON:](v54, "initWithJSON:", v53);
    else
      v55 = -[GEOWalkingOptions initWithDictionary:](v54, "initWithDictionary:", v53);
    v56 = (void *)v55;
    objc_msgSend(v6, "setWalkingOptions:", v55);

  }
  if (a3)
    v57 = CFSTR("uiContext");
  else
    v57 = CFSTR("ui_context");
  objc_msgSend(v5, "objectForKeyedSubscript:", v57);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v112 = 0u;
    v113 = 0u;
    v110 = 0u;
    v111 = 0u;
    v102 = v58;
    v59 = v58;
    v60 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v110, v123, 16);
    if (!v60)
      goto LABEL_149;
    v61 = v60;
    v62 = *(_QWORD *)v111;
    while (1)
    {
      for (j = 0; j != v61; ++j)
      {
        if (*(_QWORD *)v111 != v62)
          objc_enumerationMutation(v59);
        v64 = *(void **)(*((_QWORD *)&v110 + 1) + 8 * j);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v65 = v8;
          v66 = v9;
          v67 = v64;
          if ((objc_msgSend(v67, "isEqualToString:", CFSTR("SIGN")) & 1) != 0)
          {
            v68 = 1;
          }
          else if ((objc_msgSend(v67, "isEqualToString:", CFSTR("LIST")) & 1) != 0)
          {
            v68 = 2;
          }
          else if ((objc_msgSend(v67, "isEqualToString:", CFSTR("GENERIC")) & 1) != 0)
          {
            v68 = 3;
          }
          else if (objc_msgSend(v67, "isEqualToString:", CFSTR("SPOKEN")))
          {
            v68 = 4;
          }
          else
          {
            v68 = 1;
          }

          v9 = v66;
          v8 = v65;
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            continue;
          v68 = objc_msgSend(v64, "intValue");
        }
        objc_msgSend(v6, "addUiContext:", v68);
      }
      v61 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v110, v123, 16);
      if (!v61)
      {
LABEL_149:

        v5 = v105;
        a3 = v104;
        v58 = v102;
        break;
      }
    }
  }

  if (a3)
    v69 = CFSTR("useMetricThreshold");
  else
    v69 = CFSTR("use_metric_threshold");
  objc_msgSend(v5, "objectForKeyedSubscript:", v69);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setUseMetricThreshold:", objc_msgSend(v70, "BOOLValue"));

  if (a3)
    v71 = CFSTR("enableExperimentalMode");
  else
    v71 = CFSTR("enable_experimental_mode");
  objc_msgSend(v5, "objectForKeyedSubscript:", v71);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setEnableExperimentalMode:", objc_msgSend(v72, "BOOLValue"));

  if (a3)
    v73 = CFSTR("destinationInfo");
  else
    v73 = CFSTR("destination_info");
  objc_msgSend(v5, "objectForKeyedSubscript:", v73);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v75 = [GEOWaypointNameProperties alloc];
    if ((a3 & 1) != 0)
      v76 = -[GEOWaypointNameProperties initWithJSON:](v75, "initWithJSON:", v74);
    else
      v76 = -[GEOWaypointNameProperties initWithDictionary:](v75, "initWithDictionary:", v74);
    v77 = (void *)v76;
    objc_msgSend(v6, "setDestinationInfo:", v76);

  }
  if (a3)
    v78 = CFSTR("destinationType");
  else
    v78 = CFSTR("destination_type");
  objc_msgSend(v5, "objectForKeyedSubscript:", v78);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v80 = v79;
    if ((objc_msgSend(v80, "isEqualToString:", CFSTR("WAYPOINT_UNSPECIFIED")) & 1) != 0)
    {
      v81 = 0;
    }
    else if ((objc_msgSend(v80, "isEqualToString:", CFSTR("WAYPOINT_WORK")) & 1) != 0)
    {
      v81 = 1;
    }
    else if ((objc_msgSend(v80, "isEqualToString:", CFSTR("WAYPOINT_HOME")) & 1) != 0)
    {
      v81 = 2;
    }
    else if ((objc_msgSend(v80, "isEqualToString:", CFSTR("WAYPOINT_CONTACT_WORK")) & 1) != 0)
    {
      v81 = 3;
    }
    else if ((objc_msgSend(v80, "isEqualToString:", CFSTR("WAYPOINT_CONTACT_HOME")) & 1) != 0)
    {
      v81 = 4;
    }
    else if ((objc_msgSend(v80, "isEqualToString:", CFSTR("WAYPOINT_CONTACT_OTHER")) & 1) != 0)
    {
      v81 = 5;
    }
    else if ((objc_msgSend(v80, "isEqualToString:", CFSTR("WAYPOINT_POI")) & 1) != 0)
    {
      v81 = 6;
    }
    else if ((objc_msgSend(v80, "isEqualToString:", CFSTR("WAYPOINT_ADDRESS")) & 1) != 0)
    {
      v81 = 7;
    }
    else if ((objc_msgSend(v80, "isEqualToString:", CFSTR("WAYPOINT_UNKNOWN")) & 1) != 0)
    {
      v81 = 8;
    }
    else if ((objc_msgSend(v80, "isEqualToString:", CFSTR("WAYPOINT_CUSTOM")) & 1) != 0)
    {
      v81 = 9;
    }
    else if ((objc_msgSend(v80, "isEqualToString:", CFSTR("WAYPOINT_SCHOOL")) & 1) != 0)
    {
      v81 = 10;
    }
    else if ((objc_msgSend(v80, "isEqualToString:", CFSTR("WAYPOINT_CONTACT_SCHOOL")) & 1) != 0)
    {
      v81 = 11;
    }
    else if ((objc_msgSend(v80, "isEqualToString:", CFSTR("WAYPOINT_PERSON_LOCATION")) & 1) != 0)
    {
      v81 = 12;
    }
    else if (objc_msgSend(v80, "isEqualToString:", CFSTR("WAYPOINT_CONTACT_CUSTOM_LABEL_ADDRESS")))
    {
      v81 = 13;
    }
    else
    {
      v81 = 0;
    }

    goto LABEL_204;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v81 = objc_msgSend(v79, "intValue");
LABEL_204:
    objc_msgSend(v6, "setDestinationType:", v81);
  }

  if (a3)
    v82 = CFSTR("includeCrossLanguagePhonetics");
  else
    v82 = CFSTR("include_cross_language_phonetics");
  objc_msgSend(v5, "objectForKeyedSubscript:", v82);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setIncludeCrossLanguagePhonetics:", objc_msgSend(v83, "BOOLValue"));

  if (a3)
    v84 = CFSTR("directZilchByLaneFlowlines");
  else
    v84 = CFSTR("direct_zilch_by_lane_flowlines");
  objc_msgSend(v5, "objectForKeyedSubscript:", v84);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setDirectZilchByLaneFlowlines:", objc_msgSend(v85, "BOOLValue"));

  if (a3)
    v86 = CFSTR("includeLaneWidths");
  else
    v86 = CFSTR("include_lane_widths");
  objc_msgSend(v5, "objectForKeyedSubscript:", v86);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setIncludeLaneWidths:", objc_msgSend(v87, "BOOLValue"));

  if (a3)
    v88 = CFSTR("initialPromptType");
  else
    v88 = CFSTR("initial_prompt_type");
  objc_msgSend(v5, "objectForKeyedSubscript:", v88);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v108 = 0u;
    v109 = 0u;
    v106 = 0u;
    v107 = 0u;
    v103 = v89;
    v90 = v89;
    v91 = objc_msgSend(v90, "countByEnumeratingWithState:objects:count:", &v106, v122, 16);
    if (!v91)
      goto LABEL_239;
    v92 = v91;
    v93 = *(_QWORD *)v107;
    while (1)
    {
      for (k = 0; k != v92; ++k)
      {
        if (*(_QWORD *)v107 != v93)
          objc_enumerationMutation(v90);
        v95 = *(void **)(*((_QWORD *)&v106 + 1) + 8 * k);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v96 = v95;
          if ((objc_msgSend(v96, "isEqualToString:", CFSTR("PROMPT_UNKNOWN")) & 1) != 0)
            v97 = 0;
          else
            v97 = objc_msgSend(v96, "isEqualToString:", CFSTR("PROMPT_DISCOVER_INCIDENTS"));

        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            continue;
          v97 = objc_msgSend(v95, "intValue");
        }
        objc_msgSend(v6, "addInitialPromptType:", v97);
      }
      v92 = objc_msgSend(v90, "countByEnumeratingWithState:objects:count:", &v106, v122, 16);
      if (!v92)
      {
LABEL_239:

        v5 = v105;
        a3 = v104;
        v89 = v103;
        break;
      }
    }
  }

  if (a3)
    v98 = CFSTR("includeCellularCoverage");
  else
    v98 = CFSTR("include_cellular_coverage");
  objc_msgSend(v5, "objectForKeyedSubscript:", v98);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setIncludeCellularCoverage:", objc_msgSend(v99, "BOOLValue"));

  a1 = v6;
LABEL_246:

  return a1;
}

- (GEORouteAttributes)initWithJSON:(id)a3
{
  return (GEORouteAttributes *)-[GEORouteAttributes _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_4917;
    else
      v8 = (int *)&readAll__nonRecursiveTag_4918;
    GEORouteAttributesReadSpecified((uint64_t)self, (uint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEORouteAttributesCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORouteAttributesIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORouteAttributesReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  $F4D580EDFB4761538EFAA3AFFA5BEEEF flags;
  $F4D580EDFB4761538EFAA3AFFA5BEEEF v7;
  unint64_t v8;
  unint64_t v9;
  $F4D580EDFB4761538EFAA3AFFA5BEEEF v10;
  $F4D580EDFB4761538EFAA3AFFA5BEEEF v11;
  unint64_t v12;
  PBDataReader *v13;
  void *v14;

  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEORouteAttributesIsDirty((uint64_t)self) & 1) == 0)
  {
    v13 = self->_reader;
    objc_sync_enter(v13);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v14);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v13);
    goto LABEL_71;
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEORouteAttributes readAll:](self, "readAll:", 0);
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 8) != 0)
  {
    PBDataWriterWriteInt32Field();
    flags = self->_flags;
    if ((*(_WORD *)&flags & 0x1000) == 0)
    {
LABEL_5:
      if ((*(_WORD *)&flags & 0x800) == 0)
        goto LABEL_6;
      goto LABEL_54;
    }
  }
  else if ((*(_WORD *)&flags & 0x1000) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteBOOLField();
  flags = self->_flags;
  if ((*(_WORD *)&flags & 0x800) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&flags & 0x8000) == 0)
      goto LABEL_7;
    goto LABEL_55;
  }
LABEL_54:
  PBDataWriterWriteBOOLField();
  flags = self->_flags;
  if ((*(_WORD *)&flags & 0x8000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&flags & 0x80000) == 0)
      goto LABEL_8;
    goto LABEL_56;
  }
LABEL_55:
  PBDataWriterWriteBOOLField();
  flags = self->_flags;
  if ((*(_DWORD *)&flags & 0x80000) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&flags & 0x100) == 0)
      goto LABEL_9;
    goto LABEL_57;
  }
LABEL_56:
  PBDataWriterWriteBOOLField();
  flags = self->_flags;
  if ((*(_WORD *)&flags & 0x100) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&flags & 0x400) == 0)
      goto LABEL_10;
    goto LABEL_58;
  }
LABEL_57:
  PBDataWriterWriteBOOLField();
  flags = self->_flags;
  if ((*(_WORD *)&flags & 0x400) == 0)
  {
LABEL_10:
    if ((*(_BYTE *)&flags & 2) == 0)
      goto LABEL_11;
    goto LABEL_59;
  }
LABEL_58:
  PBDataWriterWriteBOOLField();
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 2) == 0)
  {
LABEL_11:
    if ((*(_BYTE *)&flags & 0x10) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
LABEL_59:
  PBDataWriterWriteInt32Field();
  if ((*(_DWORD *)&self->_flags & 0x10) != 0)
LABEL_12:
    PBDataWriterWriteInt32Field();
LABEL_13:
  if (self->_phoneticLocaleIdentifier)
    PBDataWriterWriteStringField();
  v7 = self->_flags;
  if ((*(_WORD *)&v7 & 0x2000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v7 = self->_flags;
    if ((*(_BYTE *)&v7 & 1) == 0)
    {
LABEL_17:
      if ((*(_WORD *)&v7 & 0x200) == 0)
        goto LABEL_18;
      goto LABEL_63;
    }
  }
  else if ((*(_BYTE *)&v7 & 1) == 0)
  {
    goto LABEL_17;
  }
  PBDataWriterPlaceMark();
  GEOTimepointWriteTo((uint64_t)&self->_timepoint);
  PBDataWriterRecallMark();
  v7 = self->_flags;
  if ((*(_WORD *)&v7 & 0x200) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&v7 & 0x4000) == 0)
      goto LABEL_19;
    goto LABEL_64;
  }
LABEL_63:
  PBDataWriterWriteBOOLField();
  v7 = self->_flags;
  if ((*(_WORD *)&v7 & 0x4000) == 0)
  {
LABEL_19:
    if ((*(_BYTE *)&v7 & 0x20) == 0)
      goto LABEL_21;
    goto LABEL_20;
  }
LABEL_64:
  PBDataWriterWriteBOOLField();
  if ((*(_DWORD *)&self->_flags & 0x20) != 0)
LABEL_20:
    PBDataWriterWriteUint32Field();
LABEL_21:
  if (self->_additionalTransportTypes.count)
  {
    v8 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v8;
    }
    while (v8 < self->_additionalTransportTypes.count);
  }
  if (self->_automobileOptions)
    PBDataWriterWriteSubmessage();
  if (self->_cyclingOptions)
    PBDataWriterWriteSubmessage();
  if (self->_transitOptions)
    PBDataWriterWriteSubmessage();
  if (self->_walkingOptions)
    PBDataWriterWriteSubmessage();
  if (self->_uiContexts.count)
  {
    v9 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v9;
    }
    while (v9 < self->_uiContexts.count);
  }
  v10 = self->_flags;
  if ((*(_DWORD *)&v10 & 0x100000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v10 = self->_flags;
  }
  if ((*(_BYTE *)&v10 & 0x80) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_destinationInfo)
    PBDataWriterWriteSubmessage();
  v11 = self->_flags;
  if ((*(_BYTE *)&v11 & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    v11 = self->_flags;
    if ((*(_DWORD *)&v11 & 0x20000) == 0)
    {
LABEL_43:
      if ((*(_BYTE *)&v11 & 0x40) == 0)
        goto LABEL_44;
LABEL_68:
      PBDataWriterWriteBOOLField();
      if ((*(_DWORD *)&self->_flags & 0x40000) == 0)
        goto LABEL_46;
      goto LABEL_45;
    }
  }
  else if ((*(_DWORD *)&v11 & 0x20000) == 0)
  {
    goto LABEL_43;
  }
  PBDataWriterWriteBOOLField();
  v11 = self->_flags;
  if ((*(_BYTE *)&v11 & 0x40) != 0)
    goto LABEL_68;
LABEL_44:
  if ((*(_DWORD *)&v11 & 0x40000) != 0)
LABEL_45:
    PBDataWriterWriteBOOLField();
LABEL_46:
  if (self->_initialPromptTypes.count)
  {
    v12 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v12;
    }
    while (v12 < self->_initialPromptTypes.count);
  }
  if ((*((_BYTE *)&self->_flags + 2) & 1) != 0)
    PBDataWriterWriteBOOLField();
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4);
LABEL_71:

}

- (void)copyTo:(id)a3
{
  id *v4;
  $F4D580EDFB4761538EFAA3AFFA5BEEEF flags;
  $F4D580EDFB4761538EFAA3AFFA5BEEEF v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t i;
  unint64_t v10;
  unint64_t v11;
  uint64_t j;
  $F4D580EDFB4761538EFAA3AFFA5BEEEF v13;
  id *v14;
  $F4D580EDFB4761538EFAA3AFFA5BEEEF v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t k;
  void *v19;
  id *v20;

  v20 = (id *)a3;
  -[GEORouteAttributes readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v20 + 1, self->_reader);
  *((_DWORD *)v20 + 42) = self->_readerMarkPos;
  *((_DWORD *)v20 + 43) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  v4 = v20;
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 8) != 0)
  {
    *((_DWORD *)v20 + 47) = self->_mainTransportType;
    *((_DWORD *)v20 + 54) |= 8u;
    flags = self->_flags;
    if ((*(_WORD *)&flags & 0x1000) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&flags & 0x800) == 0)
        goto LABEL_4;
      goto LABEL_55;
    }
  }
  else if ((*(_WORD *)&flags & 0x1000) == 0)
  {
    goto LABEL_3;
  }
  *((_BYTE *)v20 + 206) = self->_includePhonetics;
  *((_DWORD *)v20 + 54) |= 0x1000u;
  flags = self->_flags;
  if ((*(_WORD *)&flags & 0x800) == 0)
  {
LABEL_4:
    if ((*(_WORD *)&flags & 0x8000) == 0)
      goto LABEL_5;
    goto LABEL_56;
  }
LABEL_55:
  *((_BYTE *)v20 + 205) = self->_includeManeuverIcons;
  *((_DWORD *)v20 + 54) |= 0x800u;
  flags = self->_flags;
  if ((*(_WORD *)&flags & 0x8000) == 0)
  {
LABEL_5:
    if ((*(_DWORD *)&flags & 0x80000) == 0)
      goto LABEL_6;
    goto LABEL_57;
  }
LABEL_56:
  *((_BYTE *)v20 + 209) = self->_includeZilchPoints;
  *((_DWORD *)v20 + 54) |= 0x8000u;
  flags = self->_flags;
  if ((*(_DWORD *)&flags & 0x80000) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&flags & 0x100) == 0)
      goto LABEL_7;
    goto LABEL_58;
  }
LABEL_57:
  *((_BYTE *)v20 + 213) = self->_includeRoutingPathLeg;
  *((_DWORD *)v20 + 54) |= 0x80000u;
  flags = self->_flags;
  if ((*(_WORD *)&flags & 0x100) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&flags & 0x400) == 0)
      goto LABEL_8;
    goto LABEL_59;
  }
LABEL_58:
  *((_BYTE *)v20 + 202) = self->_includeContingencyRoutes;
  *((_DWORD *)v20 + 54) |= 0x100u;
  flags = self->_flags;
  if ((*(_WORD *)&flags & 0x400) == 0)
  {
LABEL_8:
    if ((*(_BYTE *)&flags & 2) == 0)
      goto LABEL_9;
    goto LABEL_60;
  }
LABEL_59:
  *((_BYTE *)v20 + 204) = self->_includeLaneGuidance;
  *((_DWORD *)v20 + 54) |= 0x400u;
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 2) == 0)
  {
LABEL_9:
    if ((*(_BYTE *)&flags & 0x10) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
LABEL_60:
  *((_DWORD *)v20 + 45) = self->_basicPointsToBeIncluded;
  *((_DWORD *)v20 + 54) |= 2u;
  if ((*(_DWORD *)&self->_flags & 0x10) != 0)
  {
LABEL_10:
    *((_DWORD *)v20 + 48) = self->_trafficType;
    *((_DWORD *)v20 + 54) |= 0x10u;
  }
LABEL_11:
  if (self->_phoneticLocaleIdentifier)
  {
    objc_msgSend(v20, "setPhoneticLocaleIdentifier:");
    v4 = v20;
  }
  v6 = self->_flags;
  if ((*(_WORD *)&v6 & 0x2000) != 0)
  {
    *((_BYTE *)v4 + 207) = self->_includeTrafficAlongRoute;
    *((_DWORD *)v4 + 54) |= 0x2000u;
    v6 = self->_flags;
    if ((*(_BYTE *)&v6 & 1) == 0)
    {
LABEL_15:
      if ((*(_WORD *)&v6 & 0x200) == 0)
        goto LABEL_16;
      goto LABEL_64;
    }
  }
  else if ((*(_BYTE *)&v6 & 1) == 0)
  {
    goto LABEL_15;
  }
  v19 = *(void **)&self->_timepoint._type;
  *((_OWORD *)v4 + 6) = *(_OWORD *)&self->_timepoint._currentUserTime;
  v4[14] = v19;
  *((_DWORD *)v4 + 54) |= 1u;
  v6 = self->_flags;
  if ((*(_WORD *)&v6 & 0x200) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&v6 & 0x4000) == 0)
      goto LABEL_17;
LABEL_65:
    *((_BYTE *)v4 + 208) = self->_includeTrafficIncidents;
    *((_DWORD *)v4 + 54) |= 0x4000u;
    if ((*(_DWORD *)&self->_flags & 0x20) == 0)
      goto LABEL_19;
    goto LABEL_18;
  }
LABEL_64:
  *((_BYTE *)v4 + 203) = self->_includeHistoricTravelTime;
  *((_DWORD *)v4 + 54) |= 0x200u;
  v6 = self->_flags;
  if ((*(_WORD *)&v6 & 0x4000) != 0)
    goto LABEL_65;
LABEL_17:
  if ((*(_BYTE *)&v6 & 0x20) != 0)
  {
LABEL_18:
    *((_DWORD *)v4 + 49) = self->_walkingLimitMeters;
    *((_DWORD *)v4 + 54) |= 0x20u;
  }
LABEL_19:
  if (-[GEORouteAttributes additionalTransportTypesCount](self, "additionalTransportTypesCount"))
  {
    objc_msgSend(v20, "clearAdditionalTransportTypes");
    v7 = -[GEORouteAttributes additionalTransportTypesCount](self, "additionalTransportTypesCount");
    if (v7)
    {
      v8 = v7;
      for (i = 0; i != v8; ++i)
        objc_msgSend(v20, "addAdditionalTransportType:", -[GEORouteAttributes additionalTransportTypeAtIndex:](self, "additionalTransportTypeAtIndex:", i));
    }
  }
  if (self->_automobileOptions)
    objc_msgSend(v20, "setAutomobileOptions:");
  if (self->_cyclingOptions)
    objc_msgSend(v20, "setCyclingOptions:");
  if (self->_transitOptions)
    objc_msgSend(v20, "setTransitOptions:");
  if (self->_walkingOptions)
    objc_msgSend(v20, "setWalkingOptions:");
  if (-[GEORouteAttributes uiContextsCount](self, "uiContextsCount"))
  {
    objc_msgSend(v20, "clearUiContexts");
    v10 = -[GEORouteAttributes uiContextsCount](self, "uiContextsCount");
    if (v10)
    {
      v11 = v10;
      for (j = 0; j != v11; ++j)
        objc_msgSend(v20, "addUiContext:", -[GEORouteAttributes uiContextAtIndex:](self, "uiContextAtIndex:", j));
    }
  }
  v13 = self->_flags;
  v14 = v20;
  if ((*(_DWORD *)&v13 & 0x100000) != 0)
  {
    *((_BYTE *)v20 + 214) = self->_useMetricThreshold;
    *((_DWORD *)v20 + 54) |= 0x100000u;
    v13 = self->_flags;
  }
  if ((*(_BYTE *)&v13 & 0x80) != 0)
  {
    *((_BYTE *)v20 + 201) = self->_enableExperimentalMode;
    *((_DWORD *)v20 + 54) |= 0x80u;
  }
  if (self->_destinationInfo)
  {
    objc_msgSend(v20, "setDestinationInfo:");
    v14 = v20;
  }
  v15 = self->_flags;
  if ((*(_BYTE *)&v15 & 4) != 0)
  {
    *((_DWORD *)v14 + 46) = self->_destinationType;
    *((_DWORD *)v14 + 54) |= 4u;
    v15 = self->_flags;
    if ((*(_DWORD *)&v15 & 0x20000) == 0)
    {
LABEL_43:
      if ((*(_BYTE *)&v15 & 0x40) == 0)
        goto LABEL_44;
LABEL_69:
      *((_BYTE *)v14 + 200) = self->_directZilchByLaneFlowlines;
      *((_DWORD *)v14 + 54) |= 0x40u;
      if ((*(_DWORD *)&self->_flags & 0x40000) == 0)
        goto LABEL_46;
      goto LABEL_45;
    }
  }
  else if ((*(_DWORD *)&v15 & 0x20000) == 0)
  {
    goto LABEL_43;
  }
  *((_BYTE *)v14 + 211) = self->_includeCrossLanguagePhonetics;
  *((_DWORD *)v14 + 54) |= 0x20000u;
  v15 = self->_flags;
  if ((*(_BYTE *)&v15 & 0x40) != 0)
    goto LABEL_69;
LABEL_44:
  if ((*(_DWORD *)&v15 & 0x40000) != 0)
  {
LABEL_45:
    *((_BYTE *)v14 + 212) = self->_includeLaneWidths;
    *((_DWORD *)v14 + 54) |= 0x40000u;
  }
LABEL_46:
  if (-[GEORouteAttributes initialPromptTypesCount](self, "initialPromptTypesCount"))
  {
    objc_msgSend(v20, "clearInitialPromptTypes");
    v16 = -[GEORouteAttributes initialPromptTypesCount](self, "initialPromptTypesCount");
    if (v16)
    {
      v17 = v16;
      for (k = 0; k != v17; ++k)
        objc_msgSend(v20, "addInitialPromptType:", -[GEORouteAttributes initialPromptTypeAtIndex:](self, "initialPromptTypeAtIndex:", k));
    }
  }
  if ((*((_BYTE *)&self->_flags + 2) & 1) != 0)
  {
    *((_BYTE *)v20 + 210) = self->_includeCellularCoverage;
    *((_DWORD *)v20 + 54) |= 0x10000u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  $F4D580EDFB4761538EFAA3AFFA5BEEEF flags;
  uint64_t v10;
  void *v11;
  $F4D580EDFB4761538EFAA3AFFA5BEEEF v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  $F4D580EDFB4761538EFAA3AFFA5BEEEF v21;
  id v22;
  void *v23;
  $F4D580EDFB4761538EFAA3AFFA5BEEEF v24;
  PBUnknownFields *v25;
  uint64_t v27;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_DWORD *)&self->_flags & 0x80000000) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEORouteAttributesReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_33;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEORouteAttributes readAll:](self, "readAll:", 0);
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 8) != 0)
  {
    *(_DWORD *)(v5 + 188) = self->_mainTransportType;
    *(_DWORD *)(v5 + 216) |= 8u;
    flags = self->_flags;
    if ((*(_WORD *)&flags & 0x1000) == 0)
    {
LABEL_7:
      if ((*(_WORD *)&flags & 0x800) == 0)
        goto LABEL_8;
      goto LABEL_36;
    }
  }
  else if ((*(_WORD *)&flags & 0x1000) == 0)
  {
    goto LABEL_7;
  }
  *(_BYTE *)(v5 + 206) = self->_includePhonetics;
  *(_DWORD *)(v5 + 216) |= 0x1000u;
  flags = self->_flags;
  if ((*(_WORD *)&flags & 0x800) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&flags & 0x8000) == 0)
      goto LABEL_9;
    goto LABEL_37;
  }
LABEL_36:
  *(_BYTE *)(v5 + 205) = self->_includeManeuverIcons;
  *(_DWORD *)(v5 + 216) |= 0x800u;
  flags = self->_flags;
  if ((*(_WORD *)&flags & 0x8000) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&flags & 0x80000) == 0)
      goto LABEL_10;
    goto LABEL_38;
  }
LABEL_37:
  *(_BYTE *)(v5 + 209) = self->_includeZilchPoints;
  *(_DWORD *)(v5 + 216) |= 0x8000u;
  flags = self->_flags;
  if ((*(_DWORD *)&flags & 0x80000) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&flags & 0x100) == 0)
      goto LABEL_11;
    goto LABEL_39;
  }
LABEL_38:
  *(_BYTE *)(v5 + 213) = self->_includeRoutingPathLeg;
  *(_DWORD *)(v5 + 216) |= 0x80000u;
  flags = self->_flags;
  if ((*(_WORD *)&flags & 0x100) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&flags & 0x400) == 0)
      goto LABEL_12;
    goto LABEL_40;
  }
LABEL_39:
  *(_BYTE *)(v5 + 202) = self->_includeContingencyRoutes;
  *(_DWORD *)(v5 + 216) |= 0x100u;
  flags = self->_flags;
  if ((*(_WORD *)&flags & 0x400) == 0)
  {
LABEL_12:
    if ((*(_BYTE *)&flags & 2) == 0)
      goto LABEL_13;
    goto LABEL_41;
  }
LABEL_40:
  *(_BYTE *)(v5 + 204) = self->_includeLaneGuidance;
  *(_DWORD *)(v5 + 216) |= 0x400u;
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 2) == 0)
  {
LABEL_13:
    if ((*(_BYTE *)&flags & 0x10) == 0)
      goto LABEL_15;
    goto LABEL_14;
  }
LABEL_41:
  *(_DWORD *)(v5 + 180) = self->_basicPointsToBeIncluded;
  *(_DWORD *)(v5 + 216) |= 2u;
  if ((*(_DWORD *)&self->_flags & 0x10) != 0)
  {
LABEL_14:
    *(_DWORD *)(v5 + 192) = self->_trafficType;
    *(_DWORD *)(v5 + 216) |= 0x10u;
  }
LABEL_15:
  v10 = -[NSString copyWithZone:](self->_phoneticLocaleIdentifier, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 144);
  *(_QWORD *)(v5 + 144) = v10;

  v12 = self->_flags;
  if ((*(_WORD *)&v12 & 0x2000) != 0)
  {
    *(_BYTE *)(v5 + 207) = self->_includeTrafficAlongRoute;
    *(_DWORD *)(v5 + 216) |= 0x2000u;
    v12 = self->_flags;
    if ((*(_BYTE *)&v12 & 1) == 0)
    {
LABEL_17:
      if ((*(_WORD *)&v12 & 0x200) == 0)
        goto LABEL_18;
      goto LABEL_45;
    }
  }
  else if ((*(_BYTE *)&v12 & 1) == 0)
  {
    goto LABEL_17;
  }
  v27 = *(_QWORD *)&self->_timepoint._type;
  *(_OWORD *)(v5 + 96) = *(_OWORD *)&self->_timepoint._currentUserTime;
  *(_QWORD *)(v5 + 112) = v27;
  *(_DWORD *)(v5 + 216) |= 1u;
  v12 = self->_flags;
  if ((*(_WORD *)&v12 & 0x200) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&v12 & 0x4000) == 0)
      goto LABEL_19;
    goto LABEL_46;
  }
LABEL_45:
  *(_BYTE *)(v5 + 203) = self->_includeHistoricTravelTime;
  *(_DWORD *)(v5 + 216) |= 0x200u;
  v12 = self->_flags;
  if ((*(_WORD *)&v12 & 0x4000) == 0)
  {
LABEL_19:
    if ((*(_BYTE *)&v12 & 0x20) == 0)
      goto LABEL_21;
    goto LABEL_20;
  }
LABEL_46:
  *(_BYTE *)(v5 + 208) = self->_includeTrafficIncidents;
  *(_DWORD *)(v5 + 216) |= 0x4000u;
  if ((*(_DWORD *)&self->_flags & 0x20) != 0)
  {
LABEL_20:
    *(_DWORD *)(v5 + 196) = self->_walkingLimitMeters;
    *(_DWORD *)(v5 + 216) |= 0x20u;
  }
LABEL_21:
  PBRepeatedInt32Copy();
  v13 = -[GEOAutomobileOptions copyWithZone:](self->_automobileOptions, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 120);
  *(_QWORD *)(v5 + 120) = v13;

  v15 = -[GEOCyclingOptions copyWithZone:](self->_cyclingOptions, "copyWithZone:", a3);
  v16 = *(void **)(v5 + 128);
  *(_QWORD *)(v5 + 128) = v15;

  v17 = -[GEOTransitOptions copyWithZone:](self->_transitOptions, "copyWithZone:", a3);
  v18 = *(void **)(v5 + 152);
  *(_QWORD *)(v5 + 152) = v17;

  v19 = -[GEOWalkingOptions copyWithZone:](self->_walkingOptions, "copyWithZone:", a3);
  v20 = *(void **)(v5 + 160);
  *(_QWORD *)(v5 + 160) = v19;

  PBRepeatedInt32Copy();
  v21 = self->_flags;
  if ((*(_DWORD *)&v21 & 0x100000) != 0)
  {
    *(_BYTE *)(v5 + 214) = self->_useMetricThreshold;
    *(_DWORD *)(v5 + 216) |= 0x100000u;
    v21 = self->_flags;
  }
  if ((*(_BYTE *)&v21 & 0x80) != 0)
  {
    *(_BYTE *)(v5 + 201) = self->_enableExperimentalMode;
    *(_DWORD *)(v5 + 216) |= 0x80u;
  }
  v22 = -[GEOWaypointNameProperties copyWithZone:](self->_destinationInfo, "copyWithZone:", a3);
  v23 = *(void **)(v5 + 136);
  *(_QWORD *)(v5 + 136) = v22;

  v24 = self->_flags;
  if ((*(_BYTE *)&v24 & 4) != 0)
  {
    *(_DWORD *)(v5 + 184) = self->_destinationType;
    *(_DWORD *)(v5 + 216) |= 4u;
    v24 = self->_flags;
    if ((*(_DWORD *)&v24 & 0x20000) == 0)
    {
LABEL_27:
      if ((*(_BYTE *)&v24 & 0x40) == 0)
        goto LABEL_28;
LABEL_50:
      *(_BYTE *)(v5 + 200) = self->_directZilchByLaneFlowlines;
      *(_DWORD *)(v5 + 216) |= 0x40u;
      if ((*(_DWORD *)&self->_flags & 0x40000) == 0)
        goto LABEL_30;
      goto LABEL_29;
    }
  }
  else if ((*(_DWORD *)&v24 & 0x20000) == 0)
  {
    goto LABEL_27;
  }
  *(_BYTE *)(v5 + 211) = self->_includeCrossLanguagePhonetics;
  *(_DWORD *)(v5 + 216) |= 0x20000u;
  v24 = self->_flags;
  if ((*(_BYTE *)&v24 & 0x40) != 0)
    goto LABEL_50;
LABEL_28:
  if ((*(_DWORD *)&v24 & 0x40000) != 0)
  {
LABEL_29:
    *(_BYTE *)(v5 + 212) = self->_includeLaneWidths;
    *(_DWORD *)(v5 + 216) |= 0x40000u;
  }
LABEL_30:
  PBRepeatedInt32Copy();
  if ((*((_BYTE *)&self->_flags + 2) & 1) != 0)
  {
    *(_BYTE *)(v5 + 210) = self->_includeCellularCoverage;
    *(_DWORD *)(v5 + 216) |= 0x10000u;
  }
  v25 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v25;
LABEL_33:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  $F4D580EDFB4761538EFAA3AFFA5BEEEF flags;
  int v6;
  NSString *phoneticLocaleIdentifier;
  BOOL v8;
  GEOAutomobileOptions *automobileOptions;
  GEOCyclingOptions *cyclingOptions;
  GEOTransitOptions *transitOptions;
  GEOWalkingOptions *walkingOptions;
  $F4D580EDFB4761538EFAA3AFFA5BEEEF v14;
  int v15;
  GEOWaypointNameProperties *destinationInfo;
  int v17;
  BOOL v18;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_171;
  -[GEORouteAttributes readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  flags = self->_flags;
  v6 = *((_DWORD *)v4 + 54);
  if ((*(_BYTE *)&flags & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_mainTransportType != *((_DWORD *)v4 + 47))
      goto LABEL_171;
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_171;
  }
  if ((*(_WORD *)&flags & 0x1000) != 0)
  {
    if ((v6 & 0x1000) == 0)
      goto LABEL_171;
    if (self->_includePhonetics)
    {
      if (!*((_BYTE *)v4 + 206))
        goto LABEL_171;
    }
    else if (*((_BYTE *)v4 + 206))
    {
      goto LABEL_171;
    }
  }
  else if ((v6 & 0x1000) != 0)
  {
    goto LABEL_171;
  }
  if ((*(_WORD *)&flags & 0x800) != 0)
  {
    if ((v6 & 0x800) == 0)
      goto LABEL_171;
    if (self->_includeManeuverIcons)
    {
      if (!*((_BYTE *)v4 + 205))
        goto LABEL_171;
    }
    else if (*((_BYTE *)v4 + 205))
    {
      goto LABEL_171;
    }
  }
  else if ((v6 & 0x800) != 0)
  {
    goto LABEL_171;
  }
  if ((*(_WORD *)&flags & 0x8000) != 0)
  {
    if ((v6 & 0x8000) == 0)
      goto LABEL_171;
    if (self->_includeZilchPoints)
    {
      if (!*((_BYTE *)v4 + 209))
        goto LABEL_171;
    }
    else if (*((_BYTE *)v4 + 209))
    {
      goto LABEL_171;
    }
  }
  else if ((v6 & 0x8000) != 0)
  {
    goto LABEL_171;
  }
  if ((*(_DWORD *)&flags & 0x80000) != 0)
  {
    if ((v6 & 0x80000) == 0)
      goto LABEL_171;
    if (self->_includeRoutingPathLeg)
    {
      if (!*((_BYTE *)v4 + 213))
        goto LABEL_171;
    }
    else if (*((_BYTE *)v4 + 213))
    {
      goto LABEL_171;
    }
  }
  else if ((v6 & 0x80000) != 0)
  {
    goto LABEL_171;
  }
  if ((*(_WORD *)&flags & 0x100) != 0)
  {
    if ((v6 & 0x100) == 0)
      goto LABEL_171;
    if (self->_includeContingencyRoutes)
    {
      if (!*((_BYTE *)v4 + 202))
        goto LABEL_171;
    }
    else if (*((_BYTE *)v4 + 202))
    {
      goto LABEL_171;
    }
  }
  else if ((v6 & 0x100) != 0)
  {
    goto LABEL_171;
  }
  if ((*(_WORD *)&flags & 0x400) != 0)
  {
    if ((v6 & 0x400) == 0)
      goto LABEL_171;
    if (self->_includeLaneGuidance)
    {
      if (!*((_BYTE *)v4 + 204))
        goto LABEL_171;
    }
    else if (*((_BYTE *)v4 + 204))
    {
      goto LABEL_171;
    }
  }
  else if ((v6 & 0x400) != 0)
  {
    goto LABEL_171;
  }
  if ((*(_BYTE *)&flags & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_basicPointsToBeIncluded != *((_DWORD *)v4 + 45))
      goto LABEL_171;
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_171;
  }
  if ((*(_BYTE *)&flags & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_trafficType != *((_DWORD *)v4 + 48))
      goto LABEL_171;
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_171;
  }
  phoneticLocaleIdentifier = self->_phoneticLocaleIdentifier;
  if ((unint64_t)phoneticLocaleIdentifier | *((_QWORD *)v4 + 18))
  {
    if (!-[NSString isEqual:](phoneticLocaleIdentifier, "isEqual:"))
      goto LABEL_171;
    flags = self->_flags;
    v6 = *((_DWORD *)v4 + 54);
  }
  if ((*(_WORD *)&flags & 0x2000) != 0)
  {
    if ((v6 & 0x2000) == 0)
      goto LABEL_171;
    if (self->_includeTrafficAlongRoute)
    {
      if (!*((_BYTE *)v4 + 207))
        goto LABEL_171;
    }
    else if (*((_BYTE *)v4 + 207))
    {
      goto LABEL_171;
    }
  }
  else if ((v6 & 0x2000) != 0)
  {
    goto LABEL_171;
  }
  if ((*(_BYTE *)&flags & 1) != 0)
  {
    if ((v6 & 1) == 0)
      goto LABEL_171;
    v8 = *(_QWORD *)&self->_timepoint._currentUserTime == *((_QWORD *)v4 + 12)
      && *(_QWORD *)&self->_timepoint._time == *((_QWORD *)v4 + 13);
    if (!v8 || *(_QWORD *)&self->_timepoint._type != *((_QWORD *)v4 + 14))
      goto LABEL_171;
  }
  else if ((v6 & 1) != 0)
  {
    goto LABEL_171;
  }
  if ((*(_WORD *)&flags & 0x200) != 0)
  {
    if ((v6 & 0x200) == 0)
      goto LABEL_171;
    if (self->_includeHistoricTravelTime)
    {
      if (!*((_BYTE *)v4 + 203))
        goto LABEL_171;
    }
    else if (*((_BYTE *)v4 + 203))
    {
      goto LABEL_171;
    }
  }
  else if ((v6 & 0x200) != 0)
  {
    goto LABEL_171;
  }
  if ((*(_WORD *)&flags & 0x4000) != 0)
  {
    if ((v6 & 0x4000) == 0)
      goto LABEL_171;
    if (self->_includeTrafficIncidents)
    {
      if (!*((_BYTE *)v4 + 208))
        goto LABEL_171;
    }
    else if (*((_BYTE *)v4 + 208))
    {
      goto LABEL_171;
    }
  }
  else if ((v6 & 0x4000) != 0)
  {
    goto LABEL_171;
  }
  if ((*(_BYTE *)&flags & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_walkingLimitMeters != *((_DWORD *)v4 + 49))
      goto LABEL_171;
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_171;
  }
  if (!PBRepeatedInt32IsEqual())
    goto LABEL_171;
  automobileOptions = self->_automobileOptions;
  if ((unint64_t)automobileOptions | *((_QWORD *)v4 + 15))
  {
    if (!-[GEOAutomobileOptions isEqual:](automobileOptions, "isEqual:"))
      goto LABEL_171;
  }
  cyclingOptions = self->_cyclingOptions;
  if ((unint64_t)cyclingOptions | *((_QWORD *)v4 + 16))
  {
    if (!-[GEOCyclingOptions isEqual:](cyclingOptions, "isEqual:"))
      goto LABEL_171;
  }
  transitOptions = self->_transitOptions;
  if ((unint64_t)transitOptions | *((_QWORD *)v4 + 19))
  {
    if (!-[GEOTransitOptions isEqual:](transitOptions, "isEqual:"))
      goto LABEL_171;
  }
  walkingOptions = self->_walkingOptions;
  if ((unint64_t)walkingOptions | *((_QWORD *)v4 + 20))
  {
    if (!-[GEOWalkingOptions isEqual:](walkingOptions, "isEqual:"))
      goto LABEL_171;
  }
  if (!PBRepeatedInt32IsEqual())
    goto LABEL_171;
  v14 = self->_flags;
  v15 = *((_DWORD *)v4 + 54);
  if ((*(_DWORD *)&v14 & 0x100000) != 0)
  {
    if ((v15 & 0x100000) == 0)
      goto LABEL_171;
    if (self->_useMetricThreshold)
    {
      if (!*((_BYTE *)v4 + 214))
        goto LABEL_171;
    }
    else if (*((_BYTE *)v4 + 214))
    {
      goto LABEL_171;
    }
  }
  else if ((v15 & 0x100000) != 0)
  {
    goto LABEL_171;
  }
  if ((*(_BYTE *)&v14 & 0x80) != 0)
  {
    if ((v15 & 0x80) == 0)
      goto LABEL_171;
    if (self->_enableExperimentalMode)
    {
      if (!*((_BYTE *)v4 + 201))
        goto LABEL_171;
    }
    else if (*((_BYTE *)v4 + 201))
    {
      goto LABEL_171;
    }
  }
  else if ((v15 & 0x80) != 0)
  {
    goto LABEL_171;
  }
  destinationInfo = self->_destinationInfo;
  if ((unint64_t)destinationInfo | *((_QWORD *)v4 + 17))
  {
    if (!-[GEOWaypointNameProperties isEqual:](destinationInfo, "isEqual:"))
      goto LABEL_171;
    v14 = self->_flags;
    v15 = *((_DWORD *)v4 + 54);
  }
  if ((*(_BYTE *)&v14 & 4) != 0)
  {
    if ((v15 & 4) == 0 || self->_destinationType != *((_DWORD *)v4 + 46))
      goto LABEL_171;
  }
  else if ((v15 & 4) != 0)
  {
    goto LABEL_171;
  }
  if ((*(_DWORD *)&v14 & 0x20000) != 0)
  {
    if ((v15 & 0x20000) == 0)
      goto LABEL_171;
    if (self->_includeCrossLanguagePhonetics)
    {
      if (!*((_BYTE *)v4 + 211))
        goto LABEL_171;
    }
    else if (*((_BYTE *)v4 + 211))
    {
      goto LABEL_171;
    }
  }
  else if ((v15 & 0x20000) != 0)
  {
    goto LABEL_171;
  }
  if ((*(_BYTE *)&v14 & 0x40) != 0)
  {
    if ((v15 & 0x40) == 0)
      goto LABEL_171;
    if (self->_directZilchByLaneFlowlines)
    {
      if (!*((_BYTE *)v4 + 200))
        goto LABEL_171;
    }
    else if (*((_BYTE *)v4 + 200))
    {
      goto LABEL_171;
    }
  }
  else if ((v15 & 0x40) != 0)
  {
    goto LABEL_171;
  }
  if ((*(_DWORD *)&v14 & 0x40000) != 0)
  {
    if ((v15 & 0x40000) == 0)
      goto LABEL_171;
    if (self->_includeLaneWidths)
    {
      if (!*((_BYTE *)v4 + 212))
        goto LABEL_171;
    }
    else if (*((_BYTE *)v4 + 212))
    {
      goto LABEL_171;
    }
  }
  else if ((v15 & 0x40000) != 0)
  {
    goto LABEL_171;
  }
  if (!PBRepeatedInt32IsEqual())
    goto LABEL_171;
  v17 = *((_DWORD *)v4 + 54);
  if ((*((_BYTE *)&self->_flags + 2) & 1) != 0)
  {
    if ((v17 & 0x10000) != 0)
    {
      if (self->_includeCellularCoverage)
      {
        if (!*((_BYTE *)v4 + 210))
          goto LABEL_171;
      }
      else if (*((_BYTE *)v4 + 210))
      {
        goto LABEL_171;
      }
      v18 = 1;
      goto LABEL_172;
    }
LABEL_171:
    v18 = 0;
    goto LABEL_172;
  }
  v18 = (v17 & 0x10000) == 0;
LABEL_172:

  return v18;
}

- (unint64_t)hash
{
  $F4D580EDFB4761538EFAA3AFFA5BEEEF flags;
  $F4D580EDFB4761538EFAA3AFFA5BEEEF v4;
  $F4D580EDFB4761538EFAA3AFFA5BEEEF v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  $F4D580EDFB4761538EFAA3AFFA5BEEEF v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSUInteger v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;

  -[GEORouteAttributes readAll:](self, "readAll:", 1);
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 8) != 0)
  {
    v38 = 2654435761 * self->_mainTransportType;
    if ((*(_WORD *)&flags & 0x1000) != 0)
    {
LABEL_3:
      v37 = 2654435761 * self->_includePhonetics;
      if ((*(_WORD *)&flags & 0x800) != 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else
  {
    v38 = 0;
    if ((*(_WORD *)&flags & 0x1000) != 0)
      goto LABEL_3;
  }
  v37 = 0;
  if ((*(_WORD *)&flags & 0x800) != 0)
  {
LABEL_4:
    v36 = 2654435761 * self->_includeManeuverIcons;
    if ((*(_WORD *)&flags & 0x8000) != 0)
      goto LABEL_5;
    goto LABEL_14;
  }
LABEL_13:
  v36 = 0;
  if ((*(_WORD *)&flags & 0x8000) != 0)
  {
LABEL_5:
    v35 = 2654435761 * self->_includeZilchPoints;
    if ((*(_DWORD *)&flags & 0x80000) != 0)
      goto LABEL_6;
    goto LABEL_15;
  }
LABEL_14:
  v35 = 0;
  if ((*(_DWORD *)&flags & 0x80000) != 0)
  {
LABEL_6:
    v34 = 2654435761 * self->_includeRoutingPathLeg;
    if ((*(_WORD *)&flags & 0x100) != 0)
      goto LABEL_7;
    goto LABEL_16;
  }
LABEL_15:
  v34 = 0;
  if ((*(_WORD *)&flags & 0x100) != 0)
  {
LABEL_7:
    v33 = 2654435761 * self->_includeContingencyRoutes;
    if ((*(_WORD *)&flags & 0x400) != 0)
      goto LABEL_8;
    goto LABEL_17;
  }
LABEL_16:
  v33 = 0;
  if ((*(_WORD *)&flags & 0x400) != 0)
  {
LABEL_8:
    v32 = 2654435761 * self->_includeLaneGuidance;
    if ((*(_BYTE *)&flags & 2) != 0)
      goto LABEL_9;
LABEL_18:
    v31 = 0;
    if ((*(_BYTE *)&flags & 0x10) != 0)
      goto LABEL_10;
    goto LABEL_19;
  }
LABEL_17:
  v32 = 0;
  if ((*(_BYTE *)&flags & 2) == 0)
    goto LABEL_18;
LABEL_9:
  v31 = 2654435761 * self->_basicPointsToBeIncluded;
  if ((*(_BYTE *)&flags & 0x10) != 0)
  {
LABEL_10:
    v30 = 2654435761 * self->_trafficType;
    goto LABEL_20;
  }
LABEL_19:
  v30 = 0;
LABEL_20:
  v29 = -[NSString hash](self->_phoneticLocaleIdentifier, "hash");
  v4 = self->_flags;
  if ((*(_WORD *)&v4 & 0x2000) != 0)
  {
    v28 = 2654435761 * self->_includeTrafficAlongRoute;
    if ((*(_BYTE *)&v4 & 1) != 0)
    {
LABEL_22:
      v27 = PBHashBytes();
      v4 = self->_flags;
      if ((*(_WORD *)&v4 & 0x200) != 0)
        goto LABEL_23;
      goto LABEL_28;
    }
  }
  else
  {
    v28 = 0;
    if ((*(_BYTE *)&v4 & 1) != 0)
      goto LABEL_22;
  }
  v27 = 0;
  if ((*(_WORD *)&v4 & 0x200) != 0)
  {
LABEL_23:
    v26 = 2654435761 * self->_includeHistoricTravelTime;
    if ((*(_WORD *)&v4 & 0x4000) != 0)
      goto LABEL_24;
LABEL_29:
    v25 = 0;
    if ((*(_BYTE *)&v4 & 0x20) != 0)
      goto LABEL_25;
    goto LABEL_30;
  }
LABEL_28:
  v26 = 0;
  if ((*(_WORD *)&v4 & 0x4000) == 0)
    goto LABEL_29;
LABEL_24:
  v25 = 2654435761 * self->_includeTrafficIncidents;
  if ((*(_BYTE *)&v4 & 0x20) != 0)
  {
LABEL_25:
    v24 = 2654435761 * self->_walkingLimitMeters;
    goto LABEL_31;
  }
LABEL_30:
  v24 = 0;
LABEL_31:
  v23 = PBRepeatedInt32Hash();
  v22 = -[GEOAutomobileOptions hash](self->_automobileOptions, "hash");
  v21 = -[GEOCyclingOptions hash](self->_cyclingOptions, "hash");
  v20 = -[GEOTransitOptions hash](self->_transitOptions, "hash");
  v19 = -[GEOWalkingOptions hash](self->_walkingOptions, "hash");
  v17 = PBRepeatedInt32Hash();
  v5 = self->_flags;
  if ((*(_DWORD *)&v5 & 0x100000) != 0)
  {
    v6 = 2654435761 * self->_useMetricThreshold;
    if ((*(_BYTE *)&v5 & 0x80) != 0)
      goto LABEL_33;
  }
  else
  {
    v6 = 0;
    if ((*(_BYTE *)&v5 & 0x80) != 0)
    {
LABEL_33:
      v7 = 2654435761 * self->_enableExperimentalMode;
      goto LABEL_36;
    }
  }
  v7 = 0;
LABEL_36:
  v8 = -[GEOWaypointNameProperties hash](self->_destinationInfo, "hash", v17);
  v9 = self->_flags;
  if ((*(_BYTE *)&v9 & 4) != 0)
  {
    v10 = 2654435761 * self->_destinationType;
    if ((*(_DWORD *)&v9 & 0x20000) != 0)
    {
LABEL_38:
      v11 = 2654435761 * self->_includeCrossLanguagePhonetics;
      if ((*(_BYTE *)&v9 & 0x40) != 0)
        goto LABEL_39;
LABEL_43:
      v12 = 0;
      if ((*(_DWORD *)&v9 & 0x40000) != 0)
        goto LABEL_40;
      goto LABEL_44;
    }
  }
  else
  {
    v10 = 0;
    if ((*(_DWORD *)&v9 & 0x20000) != 0)
      goto LABEL_38;
  }
  v11 = 0;
  if ((*(_BYTE *)&v9 & 0x40) == 0)
    goto LABEL_43;
LABEL_39:
  v12 = 2654435761 * self->_directZilchByLaneFlowlines;
  if ((*(_DWORD *)&v9 & 0x40000) != 0)
  {
LABEL_40:
    v13 = 2654435761 * self->_includeLaneWidths;
    goto LABEL_45;
  }
LABEL_44:
  v13 = 0;
LABEL_45:
  v14 = PBRepeatedInt32Hash();
  if ((*((_BYTE *)&self->_flags + 2) & 1) != 0)
    v15 = 2654435761 * self->_includeCellularCoverage;
  else
    v15 = 0;
  return v37 ^ v38 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v29 ^ v22 ^ v21 ^ v20 ^ v19 ^ v18 ^ v6 ^ v7 ^ v8 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  int v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  GEOAutomobileOptions *automobileOptions;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  GEOCyclingOptions *cyclingOptions;
  uint64_t v15;
  GEOTransitOptions *transitOptions;
  uint64_t v17;
  GEOWalkingOptions *walkingOptions;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  id v23;
  int v24;
  GEOWaypointNameProperties *destinationInfo;
  uint64_t v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t k;
  id v31;

  v31 = a3;
  objc_msgSend(v31, "readAll:", 0);
  v4 = v31;
  v5 = *((_DWORD *)v31 + 54);
  if ((v5 & 8) != 0)
  {
    self->_mainTransportType = *((_DWORD *)v31 + 47);
    *(_DWORD *)&self->_flags |= 8u;
    v5 = *((_DWORD *)v31 + 54);
    if ((v5 & 0x1000) == 0)
    {
LABEL_3:
      if ((v5 & 0x800) == 0)
        goto LABEL_4;
      goto LABEL_27;
    }
  }
  else if ((v5 & 0x1000) == 0)
  {
    goto LABEL_3;
  }
  self->_includePhonetics = *((_BYTE *)v31 + 206);
  *(_DWORD *)&self->_flags |= 0x1000u;
  v5 = *((_DWORD *)v31 + 54);
  if ((v5 & 0x800) == 0)
  {
LABEL_4:
    if ((v5 & 0x8000) == 0)
      goto LABEL_5;
    goto LABEL_28;
  }
LABEL_27:
  self->_includeManeuverIcons = *((_BYTE *)v31 + 205);
  *(_DWORD *)&self->_flags |= 0x800u;
  v5 = *((_DWORD *)v31 + 54);
  if ((v5 & 0x8000) == 0)
  {
LABEL_5:
    if ((v5 & 0x80000) == 0)
      goto LABEL_6;
    goto LABEL_29;
  }
LABEL_28:
  self->_includeZilchPoints = *((_BYTE *)v31 + 209);
  *(_DWORD *)&self->_flags |= 0x8000u;
  v5 = *((_DWORD *)v31 + 54);
  if ((v5 & 0x80000) == 0)
  {
LABEL_6:
    if ((v5 & 0x100) == 0)
      goto LABEL_7;
    goto LABEL_30;
  }
LABEL_29:
  self->_includeRoutingPathLeg = *((_BYTE *)v31 + 213);
  *(_DWORD *)&self->_flags |= 0x80000u;
  v5 = *((_DWORD *)v31 + 54);
  if ((v5 & 0x100) == 0)
  {
LABEL_7:
    if ((v5 & 0x400) == 0)
      goto LABEL_8;
    goto LABEL_31;
  }
LABEL_30:
  self->_includeContingencyRoutes = *((_BYTE *)v31 + 202);
  *(_DWORD *)&self->_flags |= 0x100u;
  v5 = *((_DWORD *)v31 + 54);
  if ((v5 & 0x400) == 0)
  {
LABEL_8:
    if ((v5 & 2) == 0)
      goto LABEL_9;
    goto LABEL_32;
  }
LABEL_31:
  self->_includeLaneGuidance = *((_BYTE *)v31 + 204);
  *(_DWORD *)&self->_flags |= 0x400u;
  v5 = *((_DWORD *)v31 + 54);
  if ((v5 & 2) == 0)
  {
LABEL_9:
    if ((v5 & 0x10) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
LABEL_32:
  self->_basicPointsToBeIncluded = *((_DWORD *)v31 + 45);
  *(_DWORD *)&self->_flags |= 2u;
  if ((*((_DWORD *)v31 + 54) & 0x10) != 0)
  {
LABEL_10:
    self->_trafficType = *((_DWORD *)v31 + 48);
    *(_DWORD *)&self->_flags |= 0x10u;
  }
LABEL_11:
  if (*((_QWORD *)v31 + 18))
  {
    -[GEORouteAttributes setPhoneticLocaleIdentifier:](self, "setPhoneticLocaleIdentifier:");
    v4 = v31;
  }
  v6 = *((_DWORD *)v4 + 54);
  if ((v6 & 0x2000) != 0)
  {
    self->_includeTrafficAlongRoute = *((_BYTE *)v4 + 207);
    *(_DWORD *)&self->_flags |= 0x2000u;
    v6 = *((_DWORD *)v4 + 54);
    if ((v6 & 1) == 0)
    {
LABEL_15:
      if ((v6 & 0x200) == 0)
        goto LABEL_16;
      goto LABEL_36;
    }
  }
  else if ((v6 & 1) == 0)
  {
    goto LABEL_15;
  }
  v13 = *((_QWORD *)v4 + 14);
  *(_OWORD *)&self->_timepoint._currentUserTime = *((_OWORD *)v4 + 6);
  *(_QWORD *)&self->_timepoint._type = v13;
  *(_DWORD *)&self->_flags |= 1u;
  v6 = *((_DWORD *)v4 + 54);
  if ((v6 & 0x200) == 0)
  {
LABEL_16:
    if ((v6 & 0x4000) == 0)
      goto LABEL_17;
    goto LABEL_37;
  }
LABEL_36:
  self->_includeHistoricTravelTime = *((_BYTE *)v4 + 203);
  *(_DWORD *)&self->_flags |= 0x200u;
  v6 = *((_DWORD *)v4 + 54);
  if ((v6 & 0x4000) == 0)
  {
LABEL_17:
    if ((v6 & 0x20) == 0)
      goto LABEL_19;
    goto LABEL_18;
  }
LABEL_37:
  self->_includeTrafficIncidents = *((_BYTE *)v4 + 208);
  *(_DWORD *)&self->_flags |= 0x4000u;
  if ((*((_DWORD *)v4 + 54) & 0x20) != 0)
  {
LABEL_18:
    self->_walkingLimitMeters = *((_DWORD *)v4 + 49);
    *(_DWORD *)&self->_flags |= 0x20u;
  }
LABEL_19:
  v7 = objc_msgSend(v4, "additionalTransportTypesCount");
  if (v7)
  {
    v8 = v7;
    for (i = 0; i != v8; ++i)
      -[GEORouteAttributes addAdditionalTransportType:](self, "addAdditionalTransportType:", objc_msgSend(v31, "additionalTransportTypeAtIndex:", i));
  }
  automobileOptions = self->_automobileOptions;
  v11 = v31;
  v12 = *((_QWORD *)v31 + 15);
  if (automobileOptions)
  {
    if (!v12)
      goto LABEL_42;
    -[GEOAutomobileOptions mergeFrom:](automobileOptions, "mergeFrom:");
  }
  else
  {
    if (!v12)
      goto LABEL_42;
    -[GEORouteAttributes setAutomobileOptions:](self, "setAutomobileOptions:");
  }
  v11 = v31;
LABEL_42:
  cyclingOptions = self->_cyclingOptions;
  v15 = v11[16];
  if (cyclingOptions)
  {
    if (!v15)
      goto LABEL_48;
    -[GEOCyclingOptions mergeFrom:](cyclingOptions, "mergeFrom:");
  }
  else
  {
    if (!v15)
      goto LABEL_48;
    -[GEORouteAttributes setCyclingOptions:](self, "setCyclingOptions:");
  }
  v11 = v31;
LABEL_48:
  transitOptions = self->_transitOptions;
  v17 = v11[19];
  if (transitOptions)
  {
    if (!v17)
      goto LABEL_54;
    -[GEOTransitOptions mergeFrom:](transitOptions, "mergeFrom:");
  }
  else
  {
    if (!v17)
      goto LABEL_54;
    -[GEORouteAttributes setTransitOptions:](self, "setTransitOptions:");
  }
  v11 = v31;
LABEL_54:
  walkingOptions = self->_walkingOptions;
  v19 = v11[20];
  if (walkingOptions)
  {
    if (!v19)
      goto LABEL_60;
    -[GEOWalkingOptions mergeFrom:](walkingOptions, "mergeFrom:");
  }
  else
  {
    if (!v19)
      goto LABEL_60;
    -[GEORouteAttributes setWalkingOptions:](self, "setWalkingOptions:");
  }
  v11 = v31;
LABEL_60:
  v20 = objc_msgSend(v11, "uiContextsCount");
  if (v20)
  {
    v21 = v20;
    for (j = 0; j != v21; ++j)
      -[GEORouteAttributes addUiContext:](self, "addUiContext:", objc_msgSend(v31, "uiContextAtIndex:", j));
  }
  v23 = v31;
  v24 = *((_DWORD *)v31 + 54);
  if ((v24 & 0x100000) != 0)
  {
    self->_useMetricThreshold = *((_BYTE *)v31 + 214);
    *(_DWORD *)&self->_flags |= 0x100000u;
    v24 = *((_DWORD *)v31 + 54);
  }
  if ((v24 & 0x80) != 0)
  {
    self->_enableExperimentalMode = *((_BYTE *)v31 + 201);
    *(_DWORD *)&self->_flags |= 0x80u;
  }
  destinationInfo = self->_destinationInfo;
  v26 = *((_QWORD *)v31 + 17);
  if (destinationInfo)
  {
    if (!v26)
      goto LABEL_73;
    -[GEOWaypointNameProperties mergeFrom:](destinationInfo, "mergeFrom:");
  }
  else
  {
    if (!v26)
      goto LABEL_73;
    -[GEORouteAttributes setDestinationInfo:](self, "setDestinationInfo:");
  }
  v23 = v31;
LABEL_73:
  v27 = *((_DWORD *)v23 + 54);
  if ((v27 & 4) != 0)
  {
    self->_destinationType = *((_DWORD *)v23 + 46);
    *(_DWORD *)&self->_flags |= 4u;
    v27 = *((_DWORD *)v23 + 54);
    if ((v27 & 0x20000) == 0)
    {
LABEL_75:
      if ((v27 & 0x40) == 0)
        goto LABEL_76;
      goto LABEL_86;
    }
  }
  else if ((v27 & 0x20000) == 0)
  {
    goto LABEL_75;
  }
  self->_includeCrossLanguagePhonetics = *((_BYTE *)v23 + 211);
  *(_DWORD *)&self->_flags |= 0x20000u;
  v27 = *((_DWORD *)v23 + 54);
  if ((v27 & 0x40) == 0)
  {
LABEL_76:
    if ((v27 & 0x40000) == 0)
      goto LABEL_78;
    goto LABEL_77;
  }
LABEL_86:
  self->_directZilchByLaneFlowlines = *((_BYTE *)v23 + 200);
  *(_DWORD *)&self->_flags |= 0x40u;
  if ((*((_DWORD *)v23 + 54) & 0x40000) != 0)
  {
LABEL_77:
    self->_includeLaneWidths = *((_BYTE *)v23 + 212);
    *(_DWORD *)&self->_flags |= 0x40000u;
  }
LABEL_78:
  v28 = objc_msgSend(v23, "initialPromptTypesCount");
  if (v28)
  {
    v29 = v28;
    for (k = 0; k != v29; ++k)
      -[GEORouteAttributes addInitialPromptType:](self, "addInitialPromptType:", objc_msgSend(v31, "initialPromptTypeAtIndex:", k));
  }
  if ((*((_BYTE *)v31 + 218) & 1) != 0)
  {
    self->_includeCellularCoverage = *((_BYTE *)v31 + 210);
    *(_DWORD *)&self->_flags |= 0x10000u;
  }

}

- (PBUnknownFields)unknownFields
{
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v5;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*((_BYTE *)&self->_flags + 2) & 0x20) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      v5 = reader;
      objc_sync_enter(v5);
      GEORouteAttributesReadSpecified((uint64_t)self, (uint64_t)self->_reader, (int *)&unknownFields_tags_4921);
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
  *(_DWORD *)&self->_flags |= 0x80200000;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEORouteAttributes readAll:](self, "readAll:", 0);
    -[GEOAutomobileOptions clearUnknownFields:](self->_automobileOptions, "clearUnknownFields:", 1);
    -[GEOCyclingOptions clearUnknownFields:](self->_cyclingOptions, "clearUnknownFields:", 1);
    -[GEOTransitOptions clearUnknownFields:](self->_transitOptions, "clearUnknownFields:", 1);
    -[GEOWalkingOptions clearUnknownFields:](self->_walkingOptions, "clearUnknownFields:", 1);
    -[GEOWaypointNameProperties clearUnknownFields:](self->_destinationInfo, "clearUnknownFields:", 1);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_walkingOptions, 0);
  objc_storeStrong((id *)&self->_transitOptions, 0);
  objc_storeStrong((id *)&self->_phoneticLocaleIdentifier, 0);
  objc_storeStrong((id *)&self->_destinationInfo, 0);
  objc_storeStrong((id *)&self->_cyclingOptions, 0);
  objc_storeStrong((id *)&self->_automobileOptions, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

+ (id)defaultRouteAttributes
{
  GEORouteAttributes *v2;
  void *v3;
  uint64_t IsEnabled;

  v2 = objc_alloc_init(GEORouteAttributes);
  -[GEORouteAttributes setRoutePointTypeForTransportType:](v2, "setRoutePointTypeForTransportType:", 4);
  -[GEORouteAttributes setIncludeManeuverIcons:](v2, "setIncludeManeuverIcons:", 1);
  -[GEORouteAttributes setTrafficType:](v2, "setTrafficType:", 3);
  -[GEORouteAttributes setIncludeTrafficAlongRoute:](v2, "setIncludeTrafficAlongRoute:", 1);
  -[GEORouteAttributes setIncludeTrafficIncidents:](v2, "setIncludeTrafficIncidents:", 1);
  -[GEORouteAttributes setIncludeLaneGuidance:](v2, "setIncludeLaneGuidance:", 1);
  +[GEOPlatform sharedPlatform](GEOPlatform, "sharedPlatform");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "supportsAdvancedMap"))
    IsEnabled = MapsFeature_IsEnabled(MapsFeaturesConfig_ShelbyvilleTerrain, off_1EDF4AFF8);
  else
    IsEnabled = 0;

  -[GEORouteAttributes setIncludeLaneWidths:](v2, "setIncludeLaneWidths:", IsEnabled);
  -[GEORouteAttributes setDirectZilchByLaneFlowlines:](v2, "setDirectZilchByLaneFlowlines:", IsEnabled);
  -[GEORouteAttributes addUiContext:](v2, "addUiContext:", 2);
  -[GEORouteAttributes addUiContext:](v2, "addUiContext:", 1);
  return v2;
}

- (void)setRoutePointTypeForTransportType:(int)a3
{
  uint64_t v3;
  id v5;

  v3 = *(_QWORD *)&a3;
  +[GEOCountryConfiguration sharedConfiguration](GEOCountryConfiguration, "sharedConfiguration");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[GEORouteAttributes setRoutePointTypeForTransportType:countryConfiguration:](self, "setRoutePointTypeForTransportType:countryConfiguration:", v3, v5);

}

- (void)setRoutePointTypeForTransportType:(int)a3 countryConfiguration:(id)a4
{
  id v6;

  v6 = a4;
  -[GEORouteAttributes setHasIncludeRoutingPathLeg:](self, "setHasIncludeRoutingPathLeg:", 0);
  -[GEORouteAttributes setHasIncludeZilchPoints:](self, "setHasIncludeZilchPoints:", 0);
  -[GEORouteAttributes setHasBasicPointsToBeIncluded:](self, "setHasBasicPointsToBeIncluded:", 0);
  if (a3 == 1 || !GEOConfigGetBOOL(GeoServicesConfig_RequestRoutingPathPoints, (uint64_t)off_1EDF4D638))
  {
    if (objc_msgSend(v6, "zilchPointsSupported"))
      -[GEORouteAttributes setIncludeZilchPoints:](self, "setIncludeZilchPoints:", 1);
    else
      -[GEORouteAttributes setBasicPointsToBeIncluded:](self, "setBasicPointsToBeIncluded:", 1);
  }
  else
  {
    -[GEORouteAttributes setIncludeRoutingPathLeg:](self, "setIncludeRoutingPathLeg:", 1);
  }

}

- (void)buildRouteAttributes:(id)a3 queue:(id)a4 result:(id)a5
{
  -[GEORouteAttributes buildRouteAttributes:result:](self, "buildRouteAttributes:result:", a4, a5);
}

- (void)buildRouteAttributes:(id)a3 result:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __76__GEORouteAttributes_GEORouteAttributesExtras__buildRouteAttributes_result___block_invoke;
  v8[3] = &unk_1E1BFF970;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  dispatch_async((dispatch_queue_t)a3, v8);

}

void __76__GEORouteAttributes_GEORouteAttributesExtras__buildRouteAttributes_result___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "copy");
  (*(void (**)(uint64_t, id, _QWORD))(v1 + 16))(v1, v2, 0);

}

- (void)buildRouteAttributesForETAUpdateRequest:(id)a3 queue:(id)a4 result:(id)a5
{
  -[GEORouteAttributes buildRouteAttributes:result:](self, "buildRouteAttributes:result:", a4, a5);
}

- (BOOL)shouldRetryForError:(id)a3
{
  return 0;
}

@end
