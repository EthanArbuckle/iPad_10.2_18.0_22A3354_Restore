@implementation GEOWaypointRoute

- (GEORawRouteGeometry)rawRouteGeometry
{
  return -[GEORawRouteGeometry initWithGeoWaypointRoute:]([GEORawRouteGeometry alloc], "initWithGeoWaypointRoute:", self);
}

- (GEOWaypointRoute)init
{
  GEOWaypointRoute *v2;
  GEOWaypointRoute *v3;
  GEOWaypointRoute *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOWaypointRoute;
  v2 = -[GEOWaypointRoute init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOWaypointRoute)initWithData:(id)a3
{
  GEOWaypointRoute *v3;
  GEOWaypointRoute *v4;
  GEOWaypointRoute *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOWaypointRoute;
  v3 = -[GEOWaypointRoute initWithData:](&v7, sel_initWithData_, a3);
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
  v3.receiver = self;
  v3.super_class = (Class)GEOWaypointRoute;
  -[GEOWaypointRoute dealloc](&v3, sel_dealloc);
}

- (unsigned)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x100004u;
  self->_identifier = a3;
}

- (void)setHasIdentifier:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1048580;
  else
    v3 = 0x100000;
  self->_flags = ($EFA9D2CD557EBB9C5A9F4F80D3257E6E)(*(_DWORD *)&self->_flags & 0xFFFFFFFB | v3);
}

- (BOOL)hasIdentifier
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (void)_readRouteLegs
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(_BYTE *)(a1 + 185) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOWaypointRouteReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRouteLegs_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (NSMutableArray)routeLegs
{
  -[GEOWaypointRoute _readRouteLegs]((uint64_t)self);
  return self->_routeLegs;
}

- (void)setRouteLegs:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *routeLegs;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x2000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x100000u;
  routeLegs = self->_routeLegs;
  self->_routeLegs = v4;

}

- (void)clearRouteLegs
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x2000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x100000u;
  -[NSMutableArray removeAllObjects](self->_routeLegs, "removeAllObjects");
}

- (void)addRouteLeg:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOWaypointRoute _readRouteLegs]((uint64_t)self);
  -[GEOWaypointRoute _addNoFlagsRouteLeg:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x2000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x100000u;
}

- (void)_addNoFlagsRouteLeg:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 96);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 96);
      *(_QWORD *)(a1 + 96) = v5;

      v4 = *(void **)(a1 + 96);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)routeLegsCount
{
  -[GEOWaypointRoute _readRouteLegs]((uint64_t)self);
  return -[NSMutableArray count](self->_routeLegs, "count");
}

- (id)routeLegAtIndex:(unint64_t)a3
{
  -[GEOWaypointRoute _readRouteLegs]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_routeLegs, "objectAtIndex:", a3);
}

+ (Class)routeLegType
{
  return (Class)objc_opt_class();
}

- (int)transportType
{
  os_unfair_lock_s *p_readerLock;
  $EFA9D2CD557EBB9C5A9F4F80D3257E6E flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_BYTE *)&flags & 8) != 0)
    return self->_transportType;
  else
    return 0;
}

- (void)setTransportType:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x100008u;
  self->_transportType = a3;
}

- (void)setHasTransportType:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1048584;
  else
    v3 = 0x100000;
  self->_flags = ($EFA9D2CD557EBB9C5A9F4F80D3257E6E)(*(_DWORD *)&self->_flags & 0xFFFFFFF7 | v3);
}

- (BOOL)hasTransportType
{
  return (*(_BYTE *)&self->_flags >> 3) & 1;
}

- (id)transportTypeAsString:(int)a3
{
  if (a3 < 7)
    return off_1E1C08870[a3];
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

- (int)drivingSide
{
  os_unfair_lock_s *p_readerLock;
  $EFA9D2CD557EBB9C5A9F4F80D3257E6E flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_BYTE *)&flags & 2) != 0)
    return self->_drivingSide;
  else
    return 0;
}

- (void)setDrivingSide:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x100002u;
  self->_drivingSide = a3;
}

- (void)setHasDrivingSide:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1048578;
  else
    v3 = 0x100000;
  self->_flags = ($EFA9D2CD557EBB9C5A9F4F80D3257E6E)(*(_DWORD *)&self->_flags & 0xFFFFFFFD | v3);
}

- (BOOL)hasDrivingSide
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (id)drivingSideAsString:(int)a3
{
  __CFString *v3;

  if (!a3)
    return CFSTR("RIGHT_SIDE");
  if (a3 == 1)
  {
    v3 = CFSTR("LEFT_SIDE");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsDrivingSide:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RIGHT_SIDE")) & 1) != 0)
    v4 = 0;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("LEFT_SIDE"));

  return v4;
}

- (int)type
{
  os_unfair_lock_s *p_readerLock;
  $EFA9D2CD557EBB9C5A9F4F80D3257E6E flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_BYTE *)&flags & 0x10) != 0)
    return self->_type;
  else
    return 0;
}

- (void)setType:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x100010u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1048592;
  else
    v3 = 0x100000;
  self->_flags = ($EFA9D2CD557EBB9C5A9F4F80D3257E6E)(*(_DWORD *)&self->_flags & 0xFFEFFFEF | v3);
}

- (BOOL)hasType
{
  return (*(_BYTE *)&self->_flags >> 4) & 1;
}

- (id)typeAsString:(int)a3
{
  if (a3 < 6)
    return off_1E1C088A8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAIN_ROUTE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ALTERNATE_ROUTE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CONTINGENCY_ROUTE_ALTERNATE_ORIGIN")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CONTINGENCY_ROUTE_MIDDLE_OF_ROUTE")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAIN_NON_RECOMMENDED_ROUTE")) & 1) != 0)
  {
    v4 = 4;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("ALTERNATE_NON_RECOMMENDED_ROUTE")))
  {
    v4 = 5;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_readNames
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(_BYTE *)(a1 + 185) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOWaypointRouteReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readNames_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (NSMutableArray)names
{
  -[GEOWaypointRoute _readNames]((uint64_t)self);
  return self->_names;
}

- (void)setNames:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *names;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x400u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x100000u;
  names = self->_names;
  self->_names = v4;

}

- (void)clearNames
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x400u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x100000u;
  -[NSMutableArray removeAllObjects](self->_names, "removeAllObjects");
}

- (void)addName:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOWaypointRoute _readNames]((uint64_t)self);
  -[GEOWaypointRoute _addNoFlagsName:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x400u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x100000u;
}

- (void)_addNoFlagsName:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 72);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 72);
      *(_QWORD *)(a1 + 72) = v5;

      v4 = *(void **)(a1 + 72);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)namesCount
{
  -[GEOWaypointRoute _readNames]((uint64_t)self);
  return -[NSMutableArray count](self->_names, "count");
}

- (id)nameAtIndex:(unint64_t)a3
{
  -[GEOWaypointRoute _readNames]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_names, "objectAtIndex:", a3);
}

+ (Class)nameType
{
  return (Class)objc_opt_class();
}

- (unsigned)distanceMeters
{
  return self->_distanceMeters;
}

- (void)setDistanceMeters:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x100001u;
  self->_distanceMeters = a3;
}

- (void)setHasDistanceMeters:(BOOL)a3
{
  self->_flags = ($EFA9D2CD557EBB9C5A9F4F80D3257E6E)(*(_DWORD *)&self->_flags & 0xFFFFFFFE | a3 | 0x100000);
}

- (BOOL)hasDistanceMeters
{
  return *(_DWORD *)&self->_flags & 1;
}

- (void)_readTraversalTimes
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(_BYTE *)(a1 + 186) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOWaypointRouteReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTraversalTimes_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (BOOL)hasTraversalTimes
{
  -[GEOWaypointRoute _readTraversalTimes]((uint64_t)self);
  return self->_traversalTimes != 0;
}

- (GEOTraversalTimes)traversalTimes
{
  -[GEOWaypointRoute _readTraversalTimes]((uint64_t)self);
  return self->_traversalTimes;
}

- (void)setTraversalTimes:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x140000u;
  objc_storeStrong((id *)&self->_traversalTimes, a3);
}

- (void)_readTripTimes
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(_BYTE *)(a1 + 186) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOWaypointRouteReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTripTimes_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (BOOL)hasTripTimes
{
  -[GEOWaypointRoute _readTripTimes]((uint64_t)self);
  return self->_tripTimes != 0;
}

- (GEOTraversalTimes)tripTimes
{
  -[GEOWaypointRoute _readTripTimes]((uint64_t)self);
  return self->_tripTimes;
}

- (void)setTripTimes:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x180000u;
  objc_storeStrong((id *)&self->_tripTimes, a3);
}

- (void)_readFeature
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(_BYTE *)(a1 + 185) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOWaypointRouteReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readFeature_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (BOOL)hasFeature
{
  -[GEOWaypointRoute _readFeature]((uint64_t)self);
  return self->_feature != 0;
}

- (GEOWaypointRouteFeatures)feature
{
  -[GEOWaypointRoute _readFeature]((uint64_t)self);
  return self->_feature;
}

- (void)setFeature:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x100100u;
  objc_storeStrong((id *)&self->_feature, a3);
}

- (void)_readRoutePlanningInfo
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(_BYTE *)(a1 + 185) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOWaypointRouteReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRoutePlanningInfo_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (BOOL)hasRoutePlanningInfo
{
  -[GEOWaypointRoute _readRoutePlanningInfo]((uint64_t)self);
  return self->_routePlanningInfo != 0;
}

- (GEORoutePlanningInfo)routePlanningInfo
{
  -[GEOWaypointRoute _readRoutePlanningInfo]((uint64_t)self);
  return self->_routePlanningInfo;
}

- (void)setRoutePlanningInfo:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x104000u;
  objc_storeStrong((id *)&self->_routePlanningInfo, a3);
}

- (void)_readArrivalParameters
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(_BYTE *)(a1 + 184) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOWaypointRouteReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readArrivalParameters_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (NSMutableArray)arrivalParameters
{
  -[GEOWaypointRoute _readArrivalParameters]((uint64_t)self);
  return self->_arrivalParameters;
}

- (void)setArrivalParameters:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *arrivalParameters;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x100000u;
  arrivalParameters = self->_arrivalParameters;
  self->_arrivalParameters = v4;

}

- (void)clearArrivalParameters
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x100000u;
  -[NSMutableArray removeAllObjects](self->_arrivalParameters, "removeAllObjects");
}

- (void)addArrivalParameters:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOWaypointRoute _readArrivalParameters]((uint64_t)self);
  -[GEOWaypointRoute _addNoFlagsArrivalParameters:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x100000u;
}

- (void)_addNoFlagsArrivalParameters:(uint64_t)a1
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

- (unint64_t)arrivalParametersCount
{
  -[GEOWaypointRoute _readArrivalParameters]((uint64_t)self);
  return -[NSMutableArray count](self->_arrivalParameters, "count");
}

- (id)arrivalParametersAtIndex:(unint64_t)a3
{
  -[GEOWaypointRoute _readArrivalParameters]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_arrivalParameters, "objectAtIndex:", a3);
}

+ (Class)arrivalParametersType
{
  return (Class)objc_opt_class();
}

- (void)_readTrafficSignals
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(_BYTE *)(a1 + 186) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOWaypointRouteReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTrafficSignals_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (NSMutableArray)trafficSignals
{
  -[GEOWaypointRoute _readTrafficSignals]((uint64_t)self);
  return self->_trafficSignals;
}

- (void)setTrafficSignals:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *trafficSignals;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x20000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x100000u;
  trafficSignals = self->_trafficSignals;
  self->_trafficSignals = v4;

}

- (void)clearTrafficSignals
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x20000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x100000u;
  -[NSMutableArray removeAllObjects](self->_trafficSignals, "removeAllObjects");
}

- (void)addTrafficSignal:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOWaypointRoute _readTrafficSignals]((uint64_t)self);
  -[GEOWaypointRoute _addNoFlagsTrafficSignal:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x20000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x100000u;
}

- (void)_addNoFlagsTrafficSignal:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 128);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 128);
      *(_QWORD *)(a1 + 128) = v5;

      v4 = *(void **)(a1 + 128);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)trafficSignalsCount
{
  -[GEOWaypointRoute _readTrafficSignals]((uint64_t)self);
  return -[NSMutableArray count](self->_trafficSignals, "count");
}

- (id)trafficSignalAtIndex:(unint64_t)a3
{
  -[GEOWaypointRoute _readTrafficSignals]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_trafficSignals, "objectAtIndex:", a3);
}

+ (Class)trafficSignalType
{
  return (Class)objc_opt_class();
}

- (void)_readTrafficCameras
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(_BYTE *)(a1 + 186) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOWaypointRouteReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTrafficCameras_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (NSMutableArray)trafficCameras
{
  -[GEOWaypointRoute _readTrafficCameras]((uint64_t)self);
  return self->_trafficCameras;
}

- (void)setTrafficCameras:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *trafficCameras;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x10000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x100000u;
  trafficCameras = self->_trafficCameras;
  self->_trafficCameras = v4;

}

- (void)clearTrafficCameras
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x10000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x100000u;
  -[NSMutableArray removeAllObjects](self->_trafficCameras, "removeAllObjects");
}

- (void)addTrafficCamera:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOWaypointRoute _readTrafficCameras]((uint64_t)self);
  -[GEOWaypointRoute _addNoFlagsTrafficCamera:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x10000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x100000u;
}

- (void)_addNoFlagsTrafficCamera:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 120);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 120);
      *(_QWORD *)(a1 + 120) = v5;

      v4 = *(void **)(a1 + 120);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)trafficCamerasCount
{
  -[GEOWaypointRoute _readTrafficCameras]((uint64_t)self);
  return -[NSMutableArray count](self->_trafficCameras, "count");
}

- (id)trafficCameraAtIndex:(unint64_t)a3
{
  -[GEOWaypointRoute _readTrafficCameras]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_trafficCameras, "objectAtIndex:", a3);
}

+ (Class)trafficCameraType
{
  return (Class)objc_opt_class();
}

- (void)_readIncidentsOnRouteLegs
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(_BYTE *)(a1 + 185) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOWaypointRouteReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readIncidentsOnRouteLegs_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (NSMutableArray)incidentsOnRouteLegs
{
  -[GEOWaypointRoute _readIncidentsOnRouteLegs]((uint64_t)self);
  return self->_incidentsOnRouteLegs;
}

- (void)setIncidentsOnRouteLegs:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *incidentsOnRouteLegs;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x200u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x100000u;
  incidentsOnRouteLegs = self->_incidentsOnRouteLegs;
  self->_incidentsOnRouteLegs = v4;

}

- (void)clearIncidentsOnRouteLegs
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x200u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x100000u;
  -[NSMutableArray removeAllObjects](self->_incidentsOnRouteLegs, "removeAllObjects");
}

- (void)addIncidentsOnRouteLegs:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOWaypointRoute _readIncidentsOnRouteLegs]((uint64_t)self);
  -[GEOWaypointRoute _addNoFlagsIncidentsOnRouteLegs:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x200u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x100000u;
}

- (void)_addNoFlagsIncidentsOnRouteLegs:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 64);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 64);
      *(_QWORD *)(a1 + 64) = v5;

      v4 = *(void **)(a1 + 64);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)incidentsOnRouteLegsCount
{
  -[GEOWaypointRoute _readIncidentsOnRouteLegs]((uint64_t)self);
  return -[NSMutableArray count](self->_incidentsOnRouteLegs, "count");
}

- (id)incidentsOnRouteLegsAtIndex:(unint64_t)a3
{
  -[GEOWaypointRoute _readIncidentsOnRouteLegs]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_incidentsOnRouteLegs, "objectAtIndex:", a3);
}

+ (Class)incidentsOnRouteLegsType
{
  return (Class)objc_opt_class();
}

- (void)_readRestrictionZoneInfo
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(_BYTE *)(a1 + 185) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOWaypointRouteReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRestrictionZoneInfo_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (BOOL)hasRestrictionZoneInfo
{
  -[GEOWaypointRoute _readRestrictionZoneInfo]((uint64_t)self);
  return self->_restrictionZoneInfo != 0;
}

- (GEORestrictionZoneInfo)restrictionZoneInfo
{
  -[GEOWaypointRoute _readRestrictionZoneInfo]((uint64_t)self);
  return self->_restrictionZoneInfo;
}

- (void)setRestrictionZoneInfo:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x101000u;
  objc_storeStrong((id *)&self->_restrictionZoneInfo, a3);
}

- (void)_readOutOfMapsAlertsInfo
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(_BYTE *)(a1 + 185) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOWaypointRouteReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readOutOfMapsAlertsInfo_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (BOOL)hasOutOfMapsAlertsInfo
{
  -[GEOWaypointRoute _readOutOfMapsAlertsInfo]((uint64_t)self);
  return self->_outOfMapsAlertsInfo != 0;
}

- (GEOOutOfMapsAlertsInfo)outOfMapsAlertsInfo
{
  -[GEOWaypointRoute _readOutOfMapsAlertsInfo]((uint64_t)self);
  return self->_outOfMapsAlertsInfo;
}

- (void)setOutOfMapsAlertsInfo:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x100800u;
  objc_storeStrong((id *)&self->_outOfMapsAlertsInfo, a3);
}

- (void)_readTrafficBannerTexts
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(_BYTE *)(a1 + 185) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOWaypointRouteReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTrafficBannerTexts_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (NSMutableArray)trafficBannerTexts
{
  -[GEOWaypointRoute _readTrafficBannerTexts]((uint64_t)self);
  return self->_trafficBannerTexts;
}

- (void)setTrafficBannerTexts:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *trafficBannerTexts;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x8000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x100000u;
  trafficBannerTexts = self->_trafficBannerTexts;
  self->_trafficBannerTexts = v4;

}

- (void)clearTrafficBannerTexts
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x8000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x100000u;
  -[NSMutableArray removeAllObjects](self->_trafficBannerTexts, "removeAllObjects");
}

- (void)addTrafficBannerText:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOWaypointRoute _readTrafficBannerTexts]((uint64_t)self);
  -[GEOWaypointRoute _addNoFlagsTrafficBannerText:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x8000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x100000u;
}

- (void)_addNoFlagsTrafficBannerText:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 112);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 112);
      *(_QWORD *)(a1 + 112) = v5;

      v4 = *(void **)(a1 + 112);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)trafficBannerTextsCount
{
  -[GEOWaypointRoute _readTrafficBannerTexts]((uint64_t)self);
  return -[NSMutableArray count](self->_trafficBannerTexts, "count");
}

- (id)trafficBannerTextAtIndex:(unint64_t)a3
{
  -[GEOWaypointRoute _readTrafficBannerTexts]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_trafficBannerTexts, "objectAtIndex:", a3);
}

+ (Class)trafficBannerTextType
{
  return (Class)objc_opt_class();
}

- (void)_readInitialPromptTypes
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(_BYTE *)(a1 + 184) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOWaypointRouteReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readInitialPromptTypes_tags_7499);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (unint64_t)initialPromptTypesCount
{
  -[GEOWaypointRoute _readInitialPromptTypes]((uint64_t)self);
  return self->_initialPromptTypes.count;
}

- (int)initialPromptTypes
{
  -[GEOWaypointRoute _readInitialPromptTypes]((uint64_t)self);
  return self->_initialPromptTypes.list;
}

- (void)clearInitialPromptTypes
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x100000u;
  PBRepeatedInt32Clear();
}

- (void)addInitialPromptType:(int)a3
{
  -[GEOWaypointRoute _readInitialPromptTypes]((uint64_t)self);
  if (self)
    PBRepeatedInt32Add();
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x100000u;
}

- (int)initialPromptTypeAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_initialPromptTypes;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEOWaypointRoute _readInitialPromptTypes]((uint64_t)self);
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
  *(_DWORD *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x100000u;
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

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)GEOWaypointRoute;
  -[GEOWaypointRoute description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOWaypointRoute dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOWaypointRoute _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  id v13;
  const __CFString *v14;
  int v15;
  uint64_t v16;
  __CFString *v17;
  const __CFString *v18;
  int v19;
  __CFString *v20;
  const __CFString *v21;
  uint64_t v22;
  __CFString *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  void *v30;
  id v31;
  void *v32;
  const __CFString *v33;
  void *v34;
  void *v35;
  void *v36;
  const __CFString *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  const __CFString *v42;
  id v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  const __CFString *v50;
  id v51;
  void *v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t k;
  void *v58;
  id v59;
  const __CFString *v60;
  void *v61;
  id v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t m;
  void *v67;
  id v68;
  const __CFString *v69;
  void *v70;
  id v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t n;
  void *v76;
  id v77;
  const __CFString *v78;
  void *v79;
  id v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t ii;
  void *v85;
  id v86;
  const __CFString *v87;
  void *v88;
  void *v89;
  void *v90;
  const __CFString *v91;
  id v92;
  void *v93;
  void *v94;
  void *v95;
  const __CFString *v96;
  id v97;
  void *v98;
  id v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t jj;
  void *v104;
  id v105;
  const __CFString *v106;
  void *v107;
  _QWORD *v108;
  unint64_t v109;
  uint64_t v110;
  __CFString *v111;
  const __CFString *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  id v117;
  id v118;
  id v119;
  void *v121;
  _QWORD v122[4];
  id v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  _BYTE v152[128];
  _BYTE v153[128];
  _BYTE v154[128];
  _BYTE v155[128];
  _BYTE v156[128];
  _BYTE v157[128];
  _BYTE v158[128];
  uint64_t v159;

  v159 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)(a1 + 184) & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 172));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("identifier"));

  }
  v121 = v4;
  if (objc_msgSend(*(id *)(a1 + 96), "count"))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 96), "count"));
    v148 = 0u;
    v149 = 0u;
    v150 = 0u;
    v151 = 0u;
    v7 = *(id *)(a1 + 96);
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v148, v158, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v149;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v149 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v148 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v12, "jsonRepresentation");
          else
            objc_msgSend(v12, "dictionaryRepresentation");
          v13 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v6, "addObject:", v13);
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v148, v158, 16);
      }
      while (v9);
    }

    if (a2)
      v14 = CFSTR("routeLeg");
    else
      v14 = CFSTR("route_leg");
    v4 = v121;
    objc_msgSend(v121, "setObject:forKey:", v6, v14);

  }
  v15 = *(_DWORD *)(a1 + 184);
  if ((v15 & 8) == 0)
  {
    if ((v15 & 2) == 0)
      goto LABEL_21;
LABEL_30:
    v19 = *(_DWORD *)(a1 + 168);
    if (v19)
    {
      if (v19 == 1)
      {
        v20 = CFSTR("LEFT_SIDE");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 168));
        v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v20 = CFSTR("RIGHT_SIDE");
    }
    if (a2)
      v21 = CFSTR("drivingSide");
    else
      v21 = CFSTR("driving_side");
    objc_msgSend(v4, "setObject:forKey:", v20, v21);

    if ((*(_DWORD *)(a1 + 184) & 0x10) == 0)
      goto LABEL_43;
    goto LABEL_39;
  }
  v16 = *(int *)(a1 + 176);
  if (v16 >= 7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 176));
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = off_1E1C08870[v16];
  }
  if (a2)
    v18 = CFSTR("transportType");
  else
    v18 = CFSTR("transport_type");
  objc_msgSend(v4, "setObject:forKey:", v17, v18);

  v15 = *(_DWORD *)(a1 + 184);
  if ((v15 & 2) != 0)
    goto LABEL_30;
LABEL_21:
  if ((v15 & 0x10) != 0)
  {
LABEL_39:
    v22 = *(int *)(a1 + 180);
    if (v22 >= 6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 180));
      v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v23 = off_1E1C088A8[v22];
    }
    objc_msgSend(v4, "setObject:forKey:", v23, CFSTR("type"));

  }
LABEL_43:
  if (objc_msgSend(*(id *)(a1 + 72), "count"))
  {
    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 72), "count"));
    v144 = 0u;
    v145 = 0u;
    v146 = 0u;
    v147 = 0u;
    v25 = *(id *)(a1 + 72);
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v144, v157, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v145;
      do
      {
        for (j = 0; j != v27; ++j)
        {
          if (*(_QWORD *)v145 != v28)
            objc_enumerationMutation(v25);
          v30 = *(void **)(*((_QWORD *)&v144 + 1) + 8 * j);
          if ((a2 & 1) != 0)
            objc_msgSend(v30, "jsonRepresentation");
          else
            objc_msgSend(v30, "dictionaryRepresentation");
          v31 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v24, "addObject:", v31);
        }
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v144, v157, 16);
      }
      while (v27);
    }

    v4 = v121;
    objc_msgSend(v121, "setObject:forKey:", v24, CFSTR("name"));

  }
  if ((*(_BYTE *)(a1 + 184) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 164));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v33 = CFSTR("distanceMeters");
    else
      v33 = CFSTR("distance_meters");
    objc_msgSend(v4, "setObject:forKey:", v32, v33);

  }
  objc_msgSend((id)a1, "traversalTimes");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v34;
  if (v34)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v34, "jsonRepresentation");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = CFSTR("traversalTimes");
    }
    else
    {
      objc_msgSend(v34, "dictionaryRepresentation");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = CFSTR("traversal_times");
    }
    v38 = v36;

    objc_msgSend(v4, "setObject:forKey:", v38, v37);
  }

  objc_msgSend((id)a1, "tripTimes");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v39;
  if (v39)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v39, "jsonRepresentation");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = CFSTR("tripTimes");
    }
    else
    {
      objc_msgSend(v39, "dictionaryRepresentation");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = CFSTR("trip_times");
    }
    v43 = v41;

    objc_msgSend(v4, "setObject:forKey:", v43, v42);
  }

  objc_msgSend((id)a1, "feature");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = v44;
  if (v44)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v44, "jsonRepresentation");
    else
      objc_msgSend(v44, "dictionaryRepresentation");
    v46 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKey:", v46, CFSTR("feature"));
  }

  objc_msgSend((id)a1, "routePlanningInfo");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = v47;
  if (v47)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v47, "jsonRepresentation");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = CFSTR("routePlanningInfo");
    }
    else
    {
      objc_msgSend(v47, "dictionaryRepresentation");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = CFSTR("route_planning_info");
    }
    v51 = v49;

    objc_msgSend(v4, "setObject:forKey:", v51, v50);
  }

  if (objc_msgSend(*(id *)(a1 + 48), "count"))
  {
    v52 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
    v140 = 0u;
    v141 = 0u;
    v142 = 0u;
    v143 = 0u;
    v53 = *(id *)(a1 + 48);
    v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v140, v156, 16);
    if (v54)
    {
      v55 = v54;
      v56 = *(_QWORD *)v141;
      do
      {
        for (k = 0; k != v55; ++k)
        {
          if (*(_QWORD *)v141 != v56)
            objc_enumerationMutation(v53);
          v58 = *(void **)(*((_QWORD *)&v140 + 1) + 8 * k);
          if ((a2 & 1) != 0)
            objc_msgSend(v58, "jsonRepresentation");
          else
            objc_msgSend(v58, "dictionaryRepresentation");
          v59 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v52, "addObject:", v59);
        }
        v55 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v140, v156, 16);
      }
      while (v55);
    }

    if (a2)
      v60 = CFSTR("arrivalParameters");
    else
      v60 = CFSTR("arrival_parameters");
    v4 = v121;
    objc_msgSend(v121, "setObject:forKey:", v52, v60);

  }
  if (objc_msgSend(*(id *)(a1 + 128), "count"))
  {
    v61 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 128), "count"));
    v136 = 0u;
    v137 = 0u;
    v138 = 0u;
    v139 = 0u;
    v62 = *(id *)(a1 + 128);
    v63 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v136, v155, 16);
    if (v63)
    {
      v64 = v63;
      v65 = *(_QWORD *)v137;
      do
      {
        for (m = 0; m != v64; ++m)
        {
          if (*(_QWORD *)v137 != v65)
            objc_enumerationMutation(v62);
          v67 = *(void **)(*((_QWORD *)&v136 + 1) + 8 * m);
          if ((a2 & 1) != 0)
            objc_msgSend(v67, "jsonRepresentation");
          else
            objc_msgSend(v67, "dictionaryRepresentation");
          v68 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v61, "addObject:", v68);
        }
        v64 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v136, v155, 16);
      }
      while (v64);
    }

    if (a2)
      v69 = CFSTR("trafficSignal");
    else
      v69 = CFSTR("traffic_signal");
    v4 = v121;
    objc_msgSend(v121, "setObject:forKey:", v61, v69);

  }
  if (objc_msgSend(*(id *)(a1 + 120), "count"))
  {
    v70 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 120), "count"));
    v132 = 0u;
    v133 = 0u;
    v134 = 0u;
    v135 = 0u;
    v71 = *(id *)(a1 + 120);
    v72 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v132, v154, 16);
    if (v72)
    {
      v73 = v72;
      v74 = *(_QWORD *)v133;
      do
      {
        for (n = 0; n != v73; ++n)
        {
          if (*(_QWORD *)v133 != v74)
            objc_enumerationMutation(v71);
          v76 = *(void **)(*((_QWORD *)&v132 + 1) + 8 * n);
          if ((a2 & 1) != 0)
            objc_msgSend(v76, "jsonRepresentation");
          else
            objc_msgSend(v76, "dictionaryRepresentation");
          v77 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v70, "addObject:", v77);
        }
        v73 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v132, v154, 16);
      }
      while (v73);
    }

    if (a2)
      v78 = CFSTR("trafficCamera");
    else
      v78 = CFSTR("traffic_camera");
    v4 = v121;
    objc_msgSend(v121, "setObject:forKey:", v70, v78);

  }
  if (objc_msgSend(*(id *)(a1 + 64), "count"))
  {
    v79 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 64), "count"));
    v128 = 0u;
    v129 = 0u;
    v130 = 0u;
    v131 = 0u;
    v80 = *(id *)(a1 + 64);
    v81 = objc_msgSend(v80, "countByEnumeratingWithState:objects:count:", &v128, v153, 16);
    if (v81)
    {
      v82 = v81;
      v83 = *(_QWORD *)v129;
      do
      {
        for (ii = 0; ii != v82; ++ii)
        {
          if (*(_QWORD *)v129 != v83)
            objc_enumerationMutation(v80);
          v85 = *(void **)(*((_QWORD *)&v128 + 1) + 8 * ii);
          if ((a2 & 1) != 0)
            objc_msgSend(v85, "jsonRepresentation");
          else
            objc_msgSend(v85, "dictionaryRepresentation");
          v86 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v79, "addObject:", v86);
        }
        v82 = objc_msgSend(v80, "countByEnumeratingWithState:objects:count:", &v128, v153, 16);
      }
      while (v82);
    }

    if (a2)
      v87 = CFSTR("incidentsOnRouteLegs");
    else
      v87 = CFSTR("incidents_on_route_legs");
    v4 = v121;
    objc_msgSend(v121, "setObject:forKey:", v79, v87);

  }
  objc_msgSend((id)a1, "restrictionZoneInfo");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v89 = v88;
  if (v88)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v88, "jsonRepresentation");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      v91 = CFSTR("restrictionZoneInfo");
    }
    else
    {
      objc_msgSend(v88, "dictionaryRepresentation");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      v91 = CFSTR("restriction_zone_info");
    }
    v92 = v90;

    objc_msgSend(v4, "setObject:forKey:", v92, v91);
  }

  objc_msgSend((id)a1, "outOfMapsAlertsInfo");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  v94 = v93;
  if (v93)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v93, "jsonRepresentation");
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      v96 = CFSTR("outOfMapsAlertsInfo");
    }
    else
    {
      objc_msgSend(v93, "dictionaryRepresentation");
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      v96 = CFSTR("out_of_maps_alerts_info");
    }
    v97 = v95;

    objc_msgSend(v4, "setObject:forKey:", v97, v96);
  }

  if (objc_msgSend(*(id *)(a1 + 112), "count"))
  {
    v98 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 112), "count"));
    v124 = 0u;
    v125 = 0u;
    v126 = 0u;
    v127 = 0u;
    v99 = *(id *)(a1 + 112);
    v100 = objc_msgSend(v99, "countByEnumeratingWithState:objects:count:", &v124, v152, 16);
    if (v100)
    {
      v101 = v100;
      v102 = *(_QWORD *)v125;
      do
      {
        for (jj = 0; jj != v101; ++jj)
        {
          if (*(_QWORD *)v125 != v102)
            objc_enumerationMutation(v99);
          v104 = *(void **)(*((_QWORD *)&v124 + 1) + 8 * jj);
          if ((a2 & 1) != 0)
            objc_msgSend(v104, "jsonRepresentation");
          else
            objc_msgSend(v104, "dictionaryRepresentation");
          v105 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v98, "addObject:", v105);
        }
        v101 = objc_msgSend(v99, "countByEnumeratingWithState:objects:count:", &v124, v152, 16);
      }
      while (v101);
    }

    if (a2)
      v106 = CFSTR("trafficBannerText");
    else
      v106 = CFSTR("traffic_banner_text");
    v4 = v121;
    objc_msgSend(v121, "setObject:forKey:", v98, v106);

  }
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    v108 = (_QWORD *)(a1 + 24);
    if (*(_QWORD *)(a1 + 32))
    {
      v109 = 0;
      do
      {
        v110 = *(unsigned int *)(*v108 + 4 * v109);
        if ((_DWORD)v110)
        {
          if ((_DWORD)v110 == 1)
          {
            v111 = CFSTR("PROMPT_DISCOVER_INCIDENTS");
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v110);
            v111 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
        }
        else
        {
          v111 = CFSTR("PROMPT_UNKNOWN");
        }
        objc_msgSend(v107, "addObject:", v111);

        ++v109;
        v108 = (_QWORD *)(a1 + 24);
      }
      while (v109 < *(_QWORD *)(a1 + 32));
    }
    if (a2)
      v112 = CFSTR("initialPromptType");
    else
      v112 = CFSTR("initial_prompt_type");
    v4 = v121;
    objc_msgSend(v121, "setObject:forKey:", v107, v112);

  }
  v113 = *(void **)(a1 + 16);
  if (v113)
  {
    objc_msgSend(v113, "dictionaryRepresentation");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    v115 = v114;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v114, "count"));
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      v122[0] = MEMORY[0x1E0C809B0];
      v122[1] = 3221225472;
      v122[2] = __46__GEOWaypointRoute__dictionaryRepresentation___block_invoke;
      v122[3] = &unk_1E1C00600;
      v117 = v116;
      v123 = v117;
      objc_msgSend(v115, "enumerateKeysAndObjectsUsingBlock:", v122);
      v118 = v117;

      v115 = v118;
    }
    objc_msgSend(v4, "setObject:forKey:", v115, CFSTR("Unknown Fields"));

  }
  v119 = v4;

  return v119;
}

- (id)jsonRepresentation
{
  return -[GEOWaypointRoute _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __46__GEOWaypointRoute__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOWaypointRoute)initWithDictionary:(id)a3
{
  return (GEOWaypointRoute *)-[GEOWaypointRoute _initWithDictionary:isJSON:](self, a3, 0);
}

- (id)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  GEORoute *v15;
  uint64_t v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  id v20;
  uint64_t v21;
  const __CFString *v22;
  void *v23;
  id v24;
  uint64_t v25;
  void *v26;
  id v27;
  uint64_t v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t j;
  uint64_t v35;
  GEONameInfo *v36;
  uint64_t v37;
  void *v38;
  const __CFString *v39;
  void *v40;
  const __CFString *v41;
  void *v42;
  GEOTraversalTimes *v43;
  uint64_t v44;
  void *v45;
  const __CFString *v46;
  void *v47;
  GEOTraversalTimes *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  GEOWaypointRouteFeatures *v52;
  uint64_t v53;
  void *v54;
  const __CFString *v55;
  void *v56;
  GEORoutePlanningInfo *v57;
  uint64_t v58;
  void *v59;
  const __CFString *v60;
  void *v61;
  id v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t k;
  uint64_t v67;
  GEOArrivalParameters *v68;
  uint64_t v69;
  void *v70;
  const __CFString *v71;
  void *v72;
  id v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t m;
  uint64_t v78;
  GEOTrafficSignal *v79;
  uint64_t v80;
  void *v81;
  const __CFString *v82;
  void *v83;
  id v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t n;
  uint64_t v89;
  GEOTrafficCamera *v90;
  uint64_t v91;
  void *v92;
  const __CFString *v93;
  void *v94;
  id v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t ii;
  uint64_t v100;
  GEORouteIncident *v101;
  uint64_t v102;
  void *v103;
  const __CFString *v104;
  void *v105;
  GEORestrictionZoneInfo *v106;
  uint64_t v107;
  void *v108;
  const __CFString *v109;
  void *v110;
  GEOOutOfMapsAlertsInfo *v111;
  uint64_t v112;
  void *v113;
  const __CFString *v114;
  void *v115;
  id v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t jj;
  uint64_t v121;
  GEOTrafficBannerText *v122;
  uint64_t v123;
  void *v124;
  const __CFString *v125;
  void *v126;
  id v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t kk;
  void *v132;
  id v133;
  uint64_t v134;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  id v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  _BYTE v176[128];
  _BYTE v177[128];
  _BYTE v178[128];
  _BYTE v179[128];
  _BYTE v180[128];
  _BYTE v181[128];
  _BYTE v182[128];
  _BYTE v183[128];
  uint64_t v184;

  v184 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (!a1)
    goto LABEL_244;
  a1 = (id)objc_msgSend(a1, "init");

  if (!a1)
    goto LABEL_244;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("identifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setIdentifier:", objc_msgSend(v6, "unsignedIntValue"));

  if (a3)
    v7 = CFSTR("routeLeg");
  else
    v7 = CFSTR("route_leg");
  objc_msgSend(v5, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v143 = v5;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v174 = 0u;
    v175 = 0u;
    v172 = 0u;
    v173 = 0u;
    v9 = v8;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v172, v183, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v173;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v173 != v12)
            objc_enumerationMutation(v9);
          v14 = *(_QWORD *)(*((_QWORD *)&v172 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v15 = [GEORoute alloc];
            if ((a3 & 1) != 0)
              v16 = -[GEORoute initWithJSON:](v15, "initWithJSON:", v14);
            else
              v16 = -[GEORoute initWithDictionary:](v15, "initWithDictionary:", v14);
            v17 = (void *)v16;
            objc_msgSend(a1, "addRouteLeg:", v16);

          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v172, v183, 16);
      }
      while (v11);
    }

    v5 = v143;
  }

  if (a3)
    v18 = CFSTR("transportType");
  else
    v18 = CFSTR("transport_type");
  objc_msgSend(v5, "objectForKeyedSubscript:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v20 = v19;
    if ((objc_msgSend(v20, "isEqualToString:", CFSTR("AUTOMOBILE")) & 1) != 0)
    {
      v21 = 0;
    }
    else if ((objc_msgSend(v20, "isEqualToString:", CFSTR("TRANSIT")) & 1) != 0)
    {
      v21 = 1;
    }
    else if ((objc_msgSend(v20, "isEqualToString:", CFSTR("WALKING")) & 1) != 0)
    {
      v21 = 2;
    }
    else if ((objc_msgSend(v20, "isEqualToString:", CFSTR("BICYCLE")) & 1) != 0)
    {
      v21 = 3;
    }
    else if ((objc_msgSend(v20, "isEqualToString:", CFSTR("UNKNOWN_TRANSPORT_TYPE")) & 1) != 0)
    {
      v21 = 4;
    }
    else if ((objc_msgSend(v20, "isEqualToString:", CFSTR("FERRY")) & 1) != 0)
    {
      v21 = 5;
    }
    else if (objc_msgSend(v20, "isEqualToString:", CFSTR("RIDESHARE")))
    {
      v21 = 6;
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
      goto LABEL_45;
    v21 = objc_msgSend(v19, "intValue");
  }
  objc_msgSend(a1, "setTransportType:", v21);
LABEL_45:

  if (a3)
    v22 = CFSTR("drivingSide");
  else
    v22 = CFSTR("driving_side");
  objc_msgSend(v5, "objectForKeyedSubscript:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v24 = v23;
    if ((objc_msgSend(v24, "isEqualToString:", CFSTR("RIGHT_SIDE")) & 1) != 0)
      v25 = 0;
    else
      v25 = objc_msgSend(v24, "isEqualToString:", CFSTR("LEFT_SIDE"));

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_56;
    v25 = objc_msgSend(v23, "intValue");
  }
  objc_msgSend(a1, "setDrivingSide:", v25);
LABEL_56:

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("type"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v27 = v26;
    if ((objc_msgSend(v27, "isEqualToString:", CFSTR("MAIN_ROUTE")) & 1) != 0)
    {
      v28 = 0;
    }
    else if ((objc_msgSend(v27, "isEqualToString:", CFSTR("ALTERNATE_ROUTE")) & 1) != 0)
    {
      v28 = 1;
    }
    else if ((objc_msgSend(v27, "isEqualToString:", CFSTR("CONTINGENCY_ROUTE_ALTERNATE_ORIGIN")) & 1) != 0)
    {
      v28 = 2;
    }
    else if ((objc_msgSend(v27, "isEqualToString:", CFSTR("CONTINGENCY_ROUTE_MIDDLE_OF_ROUTE")) & 1) != 0)
    {
      v28 = 3;
    }
    else if ((objc_msgSend(v27, "isEqualToString:", CFSTR("MAIN_NON_RECOMMENDED_ROUTE")) & 1) != 0)
    {
      v28 = 4;
    }
    else if (objc_msgSend(v27, "isEqualToString:", CFSTR("ALTERNATE_NON_RECOMMENDED_ROUTE")))
    {
      v28 = 5;
    }
    else
    {
      v28 = 0;
    }

    goto LABEL_73;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v28 = objc_msgSend(v26, "intValue");
LABEL_73:
    objc_msgSend(a1, "setType:", v28);
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("name"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v170 = 0u;
    v171 = 0u;
    v168 = 0u;
    v169 = 0u;
    v136 = v29;
    v30 = v29;
    v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v168, v182, 16);
    if (v31)
    {
      v32 = v31;
      v33 = *(_QWORD *)v169;
      do
      {
        for (j = 0; j != v32; ++j)
        {
          if (*(_QWORD *)v169 != v33)
            objc_enumerationMutation(v30);
          v35 = *(_QWORD *)(*((_QWORD *)&v168 + 1) + 8 * j);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v36 = [GEONameInfo alloc];
            if ((a3 & 1) != 0)
              v37 = -[GEONameInfo initWithJSON:](v36, "initWithJSON:", v35);
            else
              v37 = -[GEONameInfo initWithDictionary:](v36, "initWithDictionary:", v35);
            v38 = (void *)v37;
            objc_msgSend(a1, "addName:", v37, v136);

          }
        }
        v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v168, v182, 16);
      }
      while (v32);
    }

    v29 = v136;
    v5 = v143;
  }

  if (a3)
    v39 = CFSTR("distanceMeters");
  else
    v39 = CFSTR("distance_meters");
  objc_msgSend(v5, "objectForKeyedSubscript:", v39, v136);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setDistanceMeters:", objc_msgSend(v40, "unsignedIntValue"));

  if (a3)
    v41 = CFSTR("traversalTimes");
  else
    v41 = CFSTR("traversal_times");
  objc_msgSend(v5, "objectForKeyedSubscript:", v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v43 = [GEOTraversalTimes alloc];
    if ((a3 & 1) != 0)
      v44 = -[GEOTraversalTimes initWithJSON:](v43, "initWithJSON:", v42);
    else
      v44 = -[GEOTraversalTimes initWithDictionary:](v43, "initWithDictionary:", v42);
    v45 = (void *)v44;
    objc_msgSend(a1, "setTraversalTimes:", v44);

  }
  if (a3)
    v46 = CFSTR("tripTimes");
  else
    v46 = CFSTR("trip_times");
  objc_msgSend(v5, "objectForKeyedSubscript:", v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v48 = [GEOTraversalTimes alloc];
    if ((a3 & 1) != 0)
      v49 = -[GEOTraversalTimes initWithJSON:](v48, "initWithJSON:", v47);
    else
      v49 = -[GEOTraversalTimes initWithDictionary:](v48, "initWithDictionary:", v47);
    v50 = (void *)v49;
    objc_msgSend(a1, "setTripTimes:", v49);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("feature"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v52 = [GEOWaypointRouteFeatures alloc];
    if ((a3 & 1) != 0)
      v53 = -[GEOWaypointRouteFeatures initWithJSON:](v52, "initWithJSON:", v51);
    else
      v53 = -[GEOWaypointRouteFeatures initWithDictionary:](v52, "initWithDictionary:", v51);
    v54 = (void *)v53;
    objc_msgSend(a1, "setFeature:", v53);

  }
  if (a3)
    v55 = CFSTR("routePlanningInfo");
  else
    v55 = CFSTR("route_planning_info");
  objc_msgSend(v5, "objectForKeyedSubscript:", v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v57 = [GEORoutePlanningInfo alloc];
    if ((a3 & 1) != 0)
      v58 = -[GEORoutePlanningInfo initWithJSON:](v57, "initWithJSON:", v56);
    else
      v58 = -[GEORoutePlanningInfo initWithDictionary:](v57, "initWithDictionary:", v56);
    v59 = (void *)v58;
    objc_msgSend(a1, "setRoutePlanningInfo:", v58);

  }
  if (a3)
    v60 = CFSTR("arrivalParameters");
  else
    v60 = CFSTR("arrival_parameters");
  objc_msgSend(v5, "objectForKeyedSubscript:", v60);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v166 = 0u;
    v167 = 0u;
    v164 = 0u;
    v165 = 0u;
    v137 = v61;
    v62 = v61;
    v63 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v164, v181, 16);
    if (v63)
    {
      v64 = v63;
      v65 = *(_QWORD *)v165;
      do
      {
        for (k = 0; k != v64; ++k)
        {
          if (*(_QWORD *)v165 != v65)
            objc_enumerationMutation(v62);
          v67 = *(_QWORD *)(*((_QWORD *)&v164 + 1) + 8 * k);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v68 = [GEOArrivalParameters alloc];
            if ((a3 & 1) != 0)
              v69 = -[GEOArrivalParameters initWithJSON:](v68, "initWithJSON:", v67);
            else
              v69 = -[GEOArrivalParameters initWithDictionary:](v68, "initWithDictionary:", v67);
            v70 = (void *)v69;
            objc_msgSend(a1, "addArrivalParameters:", v69, v137);

          }
        }
        v64 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v164, v181, 16);
      }
      while (v64);
    }

    v61 = v137;
    v5 = v143;
  }

  if (a3)
    v71 = CFSTR("trafficSignal");
  else
    v71 = CFSTR("traffic_signal");
  objc_msgSend(v5, "objectForKeyedSubscript:", v71, v137);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v162 = 0u;
    v163 = 0u;
    v160 = 0u;
    v161 = 0u;
    v138 = v72;
    v73 = v72;
    v74 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v160, v180, 16);
    if (v74)
    {
      v75 = v74;
      v76 = *(_QWORD *)v161;
      do
      {
        for (m = 0; m != v75; ++m)
        {
          if (*(_QWORD *)v161 != v76)
            objc_enumerationMutation(v73);
          v78 = *(_QWORD *)(*((_QWORD *)&v160 + 1) + 8 * m);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v79 = [GEOTrafficSignal alloc];
            if ((a3 & 1) != 0)
              v80 = -[GEOTrafficSignal initWithJSON:](v79, "initWithJSON:", v78);
            else
              v80 = -[GEOTrafficSignal initWithDictionary:](v79, "initWithDictionary:", v78);
            v81 = (void *)v80;
            objc_msgSend(a1, "addTrafficSignal:", v80, v138);

          }
        }
        v75 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v160, v180, 16);
      }
      while (v75);
    }

    v72 = v138;
    v5 = v143;
  }

  if (a3)
    v82 = CFSTR("trafficCamera");
  else
    v82 = CFSTR("traffic_camera");
  objc_msgSend(v5, "objectForKeyedSubscript:", v82, v138);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v158 = 0u;
    v159 = 0u;
    v156 = 0u;
    v157 = 0u;
    v139 = v83;
    v84 = v83;
    v85 = objc_msgSend(v84, "countByEnumeratingWithState:objects:count:", &v156, v179, 16);
    if (v85)
    {
      v86 = v85;
      v87 = *(_QWORD *)v157;
      do
      {
        for (n = 0; n != v86; ++n)
        {
          if (*(_QWORD *)v157 != v87)
            objc_enumerationMutation(v84);
          v89 = *(_QWORD *)(*((_QWORD *)&v156 + 1) + 8 * n);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v90 = [GEOTrafficCamera alloc];
            if ((a3 & 1) != 0)
              v91 = -[GEOTrafficCamera initWithJSON:](v90, "initWithJSON:", v89);
            else
              v91 = -[GEOTrafficCamera initWithDictionary:](v90, "initWithDictionary:", v89);
            v92 = (void *)v91;
            objc_msgSend(a1, "addTrafficCamera:", v91, v139);

          }
        }
        v86 = objc_msgSend(v84, "countByEnumeratingWithState:objects:count:", &v156, v179, 16);
      }
      while (v86);
    }

    v83 = v139;
    v5 = v143;
  }

  if (a3)
    v93 = CFSTR("incidentsOnRouteLegs");
  else
    v93 = CFSTR("incidents_on_route_legs");
  objc_msgSend(v5, "objectForKeyedSubscript:", v93, v139);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v154 = 0u;
    v155 = 0u;
    v152 = 0u;
    v153 = 0u;
    v140 = v94;
    v95 = v94;
    v96 = objc_msgSend(v95, "countByEnumeratingWithState:objects:count:", &v152, v178, 16);
    if (v96)
    {
      v97 = v96;
      v98 = *(_QWORD *)v153;
      do
      {
        for (ii = 0; ii != v97; ++ii)
        {
          if (*(_QWORD *)v153 != v98)
            objc_enumerationMutation(v95);
          v100 = *(_QWORD *)(*((_QWORD *)&v152 + 1) + 8 * ii);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v101 = [GEORouteIncident alloc];
            if ((a3 & 1) != 0)
              v102 = -[GEORouteIncident initWithJSON:](v101, "initWithJSON:", v100);
            else
              v102 = -[GEORouteIncident initWithDictionary:](v101, "initWithDictionary:", v100);
            v103 = (void *)v102;
            objc_msgSend(a1, "addIncidentsOnRouteLegs:", v102, v140);

          }
        }
        v97 = objc_msgSend(v95, "countByEnumeratingWithState:objects:count:", &v152, v178, 16);
      }
      while (v97);
    }

    v94 = v140;
    v5 = v143;
  }

  if (a3)
    v104 = CFSTR("restrictionZoneInfo");
  else
    v104 = CFSTR("restriction_zone_info");
  objc_msgSend(v5, "objectForKeyedSubscript:", v104, v140);
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v106 = [GEORestrictionZoneInfo alloc];
    if ((a3 & 1) != 0)
      v107 = -[GEORestrictionZoneInfo initWithJSON:](v106, "initWithJSON:", v105);
    else
      v107 = -[GEORestrictionZoneInfo initWithDictionary:](v106, "initWithDictionary:", v105);
    v108 = (void *)v107;
    objc_msgSend(a1, "setRestrictionZoneInfo:", v107);

  }
  if (a3)
    v109 = CFSTR("outOfMapsAlertsInfo");
  else
    v109 = CFSTR("out_of_maps_alerts_info");
  objc_msgSend(v5, "objectForKeyedSubscript:", v109);
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v111 = [GEOOutOfMapsAlertsInfo alloc];
    if ((a3 & 1) != 0)
      v112 = -[GEOOutOfMapsAlertsInfo initWithJSON:](v111, "initWithJSON:", v110);
    else
      v112 = -[GEOOutOfMapsAlertsInfo initWithDictionary:](v111, "initWithDictionary:", v110);
    v113 = (void *)v112;
    objc_msgSend(a1, "setOutOfMapsAlertsInfo:", v112);

  }
  if (a3)
    v114 = CFSTR("trafficBannerText");
  else
    v114 = CFSTR("traffic_banner_text");
  objc_msgSend(v5, "objectForKeyedSubscript:", v114);
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v150 = 0u;
    v151 = 0u;
    v148 = 0u;
    v149 = 0u;
    v141 = v115;
    v116 = v115;
    v117 = objc_msgSend(v116, "countByEnumeratingWithState:objects:count:", &v148, v177, 16);
    if (v117)
    {
      v118 = v117;
      v119 = *(_QWORD *)v149;
      do
      {
        for (jj = 0; jj != v118; ++jj)
        {
          if (*(_QWORD *)v149 != v119)
            objc_enumerationMutation(v116);
          v121 = *(_QWORD *)(*((_QWORD *)&v148 + 1) + 8 * jj);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v122 = [GEOTrafficBannerText alloc];
            if ((a3 & 1) != 0)
              v123 = -[GEOTrafficBannerText initWithJSON:](v122, "initWithJSON:", v121);
            else
              v123 = -[GEOTrafficBannerText initWithDictionary:](v122, "initWithDictionary:", v121);
            v124 = (void *)v123;
            objc_msgSend(a1, "addTrafficBannerText:", v123, v141);

          }
        }
        v118 = objc_msgSend(v116, "countByEnumeratingWithState:objects:count:", &v148, v177, 16);
      }
      while (v118);
    }

    v115 = v141;
    v5 = v143;
  }

  if (a3)
    v125 = CFSTR("initialPromptType");
  else
    v125 = CFSTR("initial_prompt_type");
  objc_msgSend(v5, "objectForKeyedSubscript:", v125, v141);
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v146 = 0u;
    v147 = 0u;
    v144 = 0u;
    v145 = 0u;
    v142 = v126;
    v127 = v126;
    v128 = objc_msgSend(v127, "countByEnumeratingWithState:objects:count:", &v144, v176, 16);
    if (!v128)
      goto LABEL_242;
    v129 = v128;
    v130 = *(_QWORD *)v145;
    while (1)
    {
      for (kk = 0; kk != v129; ++kk)
      {
        if (*(_QWORD *)v145 != v130)
          objc_enumerationMutation(v127);
        v132 = *(void **)(*((_QWORD *)&v144 + 1) + 8 * kk);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v133 = v132;
          if ((objc_msgSend(v133, "isEqualToString:", CFSTR("PROMPT_UNKNOWN")) & 1) != 0)
            v134 = 0;
          else
            v134 = objc_msgSend(v133, "isEqualToString:", CFSTR("PROMPT_DISCOVER_INCIDENTS"));

        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            continue;
          v134 = objc_msgSend(v132, "intValue");
        }
        objc_msgSend(a1, "addInitialPromptType:", v134, v142);
      }
      v129 = objc_msgSend(v127, "countByEnumeratingWithState:objects:count:", &v144, v176, 16);
      if (!v129)
      {
LABEL_242:

        v126 = v142;
        v5 = v143;
        break;
      }
    }
  }

  a1 = a1;
LABEL_244:

  return a1;
}

- (GEOWaypointRoute)initWithJSON:(id)a3
{
  return (GEOWaypointRoute *)-[GEOWaypointRoute _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_7549;
    else
      v8 = (int *)&readAll__nonRecursiveTag_7550;
    GEOWaypointRouteReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEOWaypointRouteCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOWaypointRouteIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOWaypointRouteReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  $EFA9D2CD557EBB9C5A9F4F80D3257E6E flags;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSMutableArray *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSMutableArray *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSMutableArray *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSMutableArray *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  PBDataReader *v36;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _BYTE v66[128];
  _BYTE v67[128];
  _BYTE v68[128];
  _BYTE v69[128];
  _BYTE v70[128];
  _BYTE v71[128];
  _BYTE v72[128];
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOWaypointRouteIsDirty((uint64_t)self) & 1) == 0)
  {
    v36 = self->_reader;
    objc_sync_enter(v36);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v37);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v36);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOWaypointRoute readAll:](self, "readAll:", 0);
    if ((*(_BYTE *)&self->_flags & 4) != 0)
      PBDataWriterWriteUint32Field();
    v64 = 0u;
    v65 = 0u;
    v62 = 0u;
    v63 = 0u;
    v6 = self->_routeLegs;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v62, v72, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v63;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v63 != v8)
            objc_enumerationMutation(v6);
          PBDataWriterWriteSubmessage();
          ++v9;
        }
        while (v7 != v9);
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v62, v72, 16);
      }
      while (v7);
    }

    flags = self->_flags;
    if ((*(_BYTE *)&flags & 8) != 0)
    {
      PBDataWriterWriteInt32Field();
      flags = self->_flags;
    }
    if ((*(_BYTE *)&flags & 2) != 0)
    {
      PBDataWriterWriteInt32Field();
      flags = self->_flags;
    }
    if ((*(_BYTE *)&flags & 0x10) != 0)
      PBDataWriterWriteInt32Field();
    v60 = 0u;
    v61 = 0u;
    v58 = 0u;
    v59 = 0u;
    v11 = self->_names;
    v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v58, v71, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v59;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v59 != v13)
            objc_enumerationMutation(v11);
          PBDataWriterWriteSubmessage();
          ++v14;
        }
        while (v12 != v14);
        v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v58, v71, 16);
      }
      while (v12);
    }

    if ((*(_BYTE *)&self->_flags & 1) != 0)
      PBDataWriterWriteUint32Field();
    if (self->_traversalTimes)
      PBDataWriterWriteSubmessage();
    if (self->_tripTimes)
      PBDataWriterWriteSubmessage();
    if (self->_feature)
      PBDataWriterWriteSubmessage();
    if (self->_routePlanningInfo)
      PBDataWriterWriteSubmessage();
    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    v15 = self->_arrivalParameters;
    v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v54, v70, 16);
    if (v16)
    {
      v17 = *(_QWORD *)v55;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v55 != v17)
            objc_enumerationMutation(v15);
          PBDataWriterWriteSubmessage();
          ++v18;
        }
        while (v16 != v18);
        v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v54, v70, 16);
      }
      while (v16);
    }

    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    v19 = self->_trafficSignals;
    v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v50, v69, 16);
    if (v20)
    {
      v21 = *(_QWORD *)v51;
      do
      {
        v22 = 0;
        do
        {
          if (*(_QWORD *)v51 != v21)
            objc_enumerationMutation(v19);
          PBDataWriterWriteSubmessage();
          ++v22;
        }
        while (v20 != v22);
        v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v50, v69, 16);
      }
      while (v20);
    }

    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    v23 = self->_trafficCameras;
    v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v46, v68, 16);
    if (v24)
    {
      v25 = *(_QWORD *)v47;
      do
      {
        v26 = 0;
        do
        {
          if (*(_QWORD *)v47 != v25)
            objc_enumerationMutation(v23);
          PBDataWriterWriteSubmessage();
          ++v26;
        }
        while (v24 != v26);
        v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v46, v68, 16);
      }
      while (v24);
    }

    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v27 = self->_incidentsOnRouteLegs;
    v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v42, v67, 16);
    if (v28)
    {
      v29 = *(_QWORD *)v43;
      do
      {
        v30 = 0;
        do
        {
          if (*(_QWORD *)v43 != v29)
            objc_enumerationMutation(v27);
          PBDataWriterWriteSubmessage();
          ++v30;
        }
        while (v28 != v30);
        v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v42, v67, 16);
      }
      while (v28);
    }

    if (self->_restrictionZoneInfo)
      PBDataWriterWriteSubmessage();
    if (self->_outOfMapsAlertsInfo)
      PBDataWriterWriteSubmessage();
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v31 = self->_trafficBannerTexts;
    v32 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v38, v66, 16);
    if (v32)
    {
      v33 = *(_QWORD *)v39;
      do
      {
        v34 = 0;
        do
        {
          if (*(_QWORD *)v39 != v33)
            objc_enumerationMutation(v31);
          PBDataWriterWriteSubmessage();
          ++v34;
        }
        while (v32 != v34);
        v32 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v38, v66, 16);
      }
      while (v32);
    }

    if (self->_initialPromptTypes.count)
    {
      v35 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        ++v35;
      }
      while (v35 < self->_initialPromptTypes.count);
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v38);
  }

}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  _BYTE v57[128];
  _BYTE v58[128];
  _BYTE v59[128];
  _BYTE v60[128];
  _BYTE v61[128];
  uint64_t v62;

  v3 = a3;
  v62 = *MEMORY[0x1E0C80C00];
  -[GEOWaypointRoute _readArrivalParameters]((uint64_t)self);
  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  v5 = self->_arrivalParameters;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v52, v61, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v53;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v53 != v8)
        objc_enumerationMutation(v5);
      if ((objc_msgSend(*(id *)(*((_QWORD *)&v52 + 1) + 8 * v9), "hasGreenTeaWithValue:", v3) & 1) != 0)
        goto LABEL_53;
      if (v7 == ++v9)
      {
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v52, v61, 16);
        if (v7)
          goto LABEL_3;
        break;
      }
    }
  }

  -[GEOWaypointRoute _readIncidentsOnRouteLegs]((uint64_t)self);
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v5 = self->_incidentsOnRouteLegs;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v48, v60, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v49;
LABEL_11:
    v13 = 0;
    while (1)
    {
      if (*(_QWORD *)v49 != v12)
        objc_enumerationMutation(v5);
      if ((objc_msgSend(*(id *)(*((_QWORD *)&v48 + 1) + 8 * v13), "hasGreenTeaWithValue:", v3) & 1) != 0)
        goto LABEL_53;
      if (v11 == ++v13)
      {
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v48, v60, 16);
        if (v11)
          goto LABEL_11;
        break;
      }
    }
  }

  -[GEOWaypointRoute _readRestrictionZoneInfo]((uint64_t)self);
  if (!-[GEORestrictionZoneInfo hasGreenTeaWithValue:](self->_restrictionZoneInfo, "hasGreenTeaWithValue:", v3))
  {
    -[GEOWaypointRoute _readRouteLegs]((uint64_t)self);
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v5 = self->_routeLegs;
    v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v44, v59, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v45;
LABEL_21:
      v18 = 0;
      while (1)
      {
        if (*(_QWORD *)v45 != v17)
          objc_enumerationMutation(v5);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * v18), "hasGreenTeaWithValue:", v3) & 1) != 0)
          break;
        if (v16 == ++v18)
        {
          v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v44, v59, 16);
          if (v16)
            goto LABEL_21;
          goto LABEL_27;
        }
      }
    }
    else
    {
LABEL_27:

      -[GEOWaypointRoute _readRoutePlanningInfo]((uint64_t)self);
      if (-[GEORoutePlanningInfo hasGreenTeaWithValue:](self->_routePlanningInfo, "hasGreenTeaWithValue:", v3))
        return 1;
      -[GEOWaypointRoute _readTrafficBannerTexts]((uint64_t)self);
      v42 = 0u;
      v43 = 0u;
      v40 = 0u;
      v41 = 0u;
      v5 = self->_trafficBannerTexts;
      v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v40, v58, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v41;
LABEL_30:
        v22 = 0;
        while (1)
        {
          if (*(_QWORD *)v41 != v21)
            objc_enumerationMutation(v5);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * v22), "hasGreenTeaWithValue:", v3) & 1) != 0)
            break;
          if (v20 == ++v22)
          {
            v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v40, v58, 16);
            if (v20)
              goto LABEL_30;
            goto LABEL_36;
          }
        }
      }
      else
      {
LABEL_36:

        -[GEOWaypointRoute _readTrafficCameras]((uint64_t)self);
        v38 = 0u;
        v39 = 0u;
        v36 = 0u;
        v37 = 0u;
        v5 = self->_trafficCameras;
        v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v36, v57, 16);
        if (v23)
        {
          v24 = v23;
          v25 = *(_QWORD *)v37;
LABEL_38:
          v26 = 0;
          while (1)
          {
            if (*(_QWORD *)v37 != v25)
              objc_enumerationMutation(v5);
            if ((objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * v26), "hasGreenTeaWithValue:", v3) & 1) != 0)
              break;
            if (v24 == ++v26)
            {
              v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v36, v57, 16);
              if (v24)
                goto LABEL_38;
              goto LABEL_44;
            }
          }
        }
        else
        {
LABEL_44:

          -[GEOWaypointRoute _readTrafficSignals]((uint64_t)self);
          v34 = 0u;
          v35 = 0u;
          v32 = 0u;
          v33 = 0u;
          v5 = self->_trafficSignals;
          v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v32, v56, 16);
          if (!v27)
          {
LABEL_52:
            v14 = 0;
LABEL_54:

            return v14;
          }
          v28 = v27;
          v29 = *(_QWORD *)v33;
LABEL_46:
          v30 = 0;
          while (1)
          {
            if (*(_QWORD *)v33 != v29)
              objc_enumerationMutation(v5);
            if ((objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * v30), "hasGreenTeaWithValue:", v3, (_QWORD)v32) & 1) != 0)
              break;
            if (v28 == ++v30)
            {
              v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v32, v56, 16);
              if (v28)
                goto LABEL_46;
              goto LABEL_52;
            }
          }
        }
      }
    }
LABEL_53:
    v14 = 1;
    goto LABEL_54;
  }
  return 1;
}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  $EFA9D2CD557EBB9C5A9F4F80D3257E6E flags;
  unint64_t v9;
  unint64_t v10;
  uint64_t j;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t k;
  void *v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t m;
  void *v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t n;
  void *v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t ii;
  void *v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t jj;
  void *v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t kk;
  id *v36;

  v36 = (id *)a3;
  -[GEOWaypointRoute readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v36 + 1, self->_reader);
  *((_DWORD *)v36 + 38) = self->_readerMarkPos;
  *((_DWORD *)v36 + 39) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    *((_DWORD *)v36 + 43) = self->_identifier;
    *((_DWORD *)v36 + 46) |= 4u;
  }
  if (-[GEOWaypointRoute routeLegsCount](self, "routeLegsCount"))
  {
    objc_msgSend(v36, "clearRouteLegs");
    v4 = -[GEOWaypointRoute routeLegsCount](self, "routeLegsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[GEOWaypointRoute routeLegAtIndex:](self, "routeLegAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "addRouteLeg:", v7);

      }
    }
  }
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 8) == 0)
  {
    if ((*(_BYTE *)&flags & 2) == 0)
      goto LABEL_9;
LABEL_55:
    *((_DWORD *)v36 + 42) = self->_drivingSide;
    *((_DWORD *)v36 + 46) |= 2u;
    if ((*(_DWORD *)&self->_flags & 0x10) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
  *((_DWORD *)v36 + 44) = self->_transportType;
  *((_DWORD *)v36 + 46) |= 8u;
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 2) != 0)
    goto LABEL_55;
LABEL_9:
  if ((*(_BYTE *)&flags & 0x10) != 0)
  {
LABEL_10:
    *((_DWORD *)v36 + 45) = self->_type;
    *((_DWORD *)v36 + 46) |= 0x10u;
  }
LABEL_11:
  if (-[GEOWaypointRoute namesCount](self, "namesCount"))
  {
    objc_msgSend(v36, "clearNames");
    v9 = -[GEOWaypointRoute namesCount](self, "namesCount");
    if (v9)
    {
      v10 = v9;
      for (j = 0; j != v10; ++j)
      {
        -[GEOWaypointRoute nameAtIndex:](self, "nameAtIndex:", j);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "addName:", v12);

      }
    }
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *((_DWORD *)v36 + 41) = self->_distanceMeters;
    *((_DWORD *)v36 + 46) |= 1u;
  }
  if (self->_traversalTimes)
    objc_msgSend(v36, "setTraversalTimes:");
  if (self->_tripTimes)
    objc_msgSend(v36, "setTripTimes:");
  if (self->_feature)
    objc_msgSend(v36, "setFeature:");
  if (self->_routePlanningInfo)
    objc_msgSend(v36, "setRoutePlanningInfo:");
  if (-[GEOWaypointRoute arrivalParametersCount](self, "arrivalParametersCount"))
  {
    objc_msgSend(v36, "clearArrivalParameters");
    v13 = -[GEOWaypointRoute arrivalParametersCount](self, "arrivalParametersCount");
    if (v13)
    {
      v14 = v13;
      for (k = 0; k != v14; ++k)
      {
        -[GEOWaypointRoute arrivalParametersAtIndex:](self, "arrivalParametersAtIndex:", k);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "addArrivalParameters:", v16);

      }
    }
  }
  if (-[GEOWaypointRoute trafficSignalsCount](self, "trafficSignalsCount"))
  {
    objc_msgSend(v36, "clearTrafficSignals");
    v17 = -[GEOWaypointRoute trafficSignalsCount](self, "trafficSignalsCount");
    if (v17)
    {
      v18 = v17;
      for (m = 0; m != v18; ++m)
      {
        -[GEOWaypointRoute trafficSignalAtIndex:](self, "trafficSignalAtIndex:", m);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "addTrafficSignal:", v20);

      }
    }
  }
  if (-[GEOWaypointRoute trafficCamerasCount](self, "trafficCamerasCount"))
  {
    objc_msgSend(v36, "clearTrafficCameras");
    v21 = -[GEOWaypointRoute trafficCamerasCount](self, "trafficCamerasCount");
    if (v21)
    {
      v22 = v21;
      for (n = 0; n != v22; ++n)
      {
        -[GEOWaypointRoute trafficCameraAtIndex:](self, "trafficCameraAtIndex:", n);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "addTrafficCamera:", v24);

      }
    }
  }
  if (-[GEOWaypointRoute incidentsOnRouteLegsCount](self, "incidentsOnRouteLegsCount"))
  {
    objc_msgSend(v36, "clearIncidentsOnRouteLegs");
    v25 = -[GEOWaypointRoute incidentsOnRouteLegsCount](self, "incidentsOnRouteLegsCount");
    if (v25)
    {
      v26 = v25;
      for (ii = 0; ii != v26; ++ii)
      {
        -[GEOWaypointRoute incidentsOnRouteLegsAtIndex:](self, "incidentsOnRouteLegsAtIndex:", ii);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "addIncidentsOnRouteLegs:", v28);

      }
    }
  }
  if (self->_restrictionZoneInfo)
    objc_msgSend(v36, "setRestrictionZoneInfo:");
  if (self->_outOfMapsAlertsInfo)
    objc_msgSend(v36, "setOutOfMapsAlertsInfo:");
  if (-[GEOWaypointRoute trafficBannerTextsCount](self, "trafficBannerTextsCount"))
  {
    objc_msgSend(v36, "clearTrafficBannerTexts");
    v29 = -[GEOWaypointRoute trafficBannerTextsCount](self, "trafficBannerTextsCount");
    if (v29)
    {
      v30 = v29;
      for (jj = 0; jj != v30; ++jj)
      {
        -[GEOWaypointRoute trafficBannerTextAtIndex:](self, "trafficBannerTextAtIndex:", jj);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "addTrafficBannerText:", v32);

      }
    }
  }
  if (-[GEOWaypointRoute initialPromptTypesCount](self, "initialPromptTypesCount"))
  {
    objc_msgSend(v36, "clearInitialPromptTypes");
    v33 = -[GEOWaypointRoute initialPromptTypesCount](self, "initialPromptTypesCount");
    if (v33)
    {
      v34 = v33;
      for (kk = 0; kk != v34; ++kk)
        objc_msgSend(v36, "addInitialPromptType:", -[GEOWaypointRoute initialPromptTypeAtIndex:](self, "initialPromptTypeAtIndex:", kk));
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  $EFA9D2CD557EBB9C5A9F4F80D3257E6E flags;
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  NSMutableArray *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t k;
  void *v32;
  NSMutableArray *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t m;
  void *v37;
  NSMutableArray *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t n;
  void *v42;
  NSMutableArray *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t ii;
  void *v47;
  id v48;
  void *v49;
  id v50;
  void *v51;
  NSMutableArray *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t jj;
  void *v56;
  PBUnknownFields *v57;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  _BYTE v87[128];
  _BYTE v88[128];
  _BYTE v89[128];
  _BYTE v90[128];
  _BYTE v91[128];
  _BYTE v92[128];
  _BYTE v93[128];
  uint64_t v94;

  v94 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*((_BYTE *)&self->_flags + 2) & 0x10) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOWaypointRouteReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_63;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOWaypointRoute readAll:](self, "readAll:", 0);
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    *(_DWORD *)(v5 + 172) = self->_identifier;
    *(_DWORD *)(v5 + 184) |= 4u;
  }
  v85 = 0u;
  v86 = 0u;
  v83 = 0u;
  v84 = 0u;
  v9 = self->_routeLegs;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v83, v93, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v84;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v84 != v11)
          objc_enumerationMutation(v9);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v83 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addRouteLeg:", v13);

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v83, v93, 16);
    }
    while (v10);
  }

  flags = self->_flags;
  if ((*(_BYTE *)&flags & 8) == 0)
  {
    if ((*(_BYTE *)&flags & 2) == 0)
      goto LABEL_16;
LABEL_65:
    *(_DWORD *)(v5 + 168) = self->_drivingSide;
    *(_DWORD *)(v5 + 184) |= 2u;
    if ((*(_DWORD *)&self->_flags & 0x10) == 0)
      goto LABEL_18;
    goto LABEL_17;
  }
  *(_DWORD *)(v5 + 176) = self->_transportType;
  *(_DWORD *)(v5 + 184) |= 8u;
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 2) != 0)
    goto LABEL_65;
LABEL_16:
  if ((*(_BYTE *)&flags & 0x10) != 0)
  {
LABEL_17:
    *(_DWORD *)(v5 + 180) = self->_type;
    *(_DWORD *)(v5 + 184) |= 0x10u;
  }
LABEL_18:
  v81 = 0u;
  v82 = 0u;
  v79 = 0u;
  v80 = 0u;
  v15 = self->_names;
  v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v79, v92, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v80;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v80 != v17)
          objc_enumerationMutation(v15);
        v19 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v79 + 1) + 8 * j), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addName:", v19);

      }
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v79, v92, 16);
    }
    while (v16);
  }

  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 164) = self->_distanceMeters;
    *(_DWORD *)(v5 + 184) |= 1u;
  }
  v20 = -[GEOTraversalTimes copyWithZone:](self->_traversalTimes, "copyWithZone:", a3);
  v21 = *(void **)(v5 + 136);
  *(_QWORD *)(v5 + 136) = v20;

  v22 = -[GEOTraversalTimes copyWithZone:](self->_tripTimes, "copyWithZone:", a3);
  v23 = *(void **)(v5 + 144);
  *(_QWORD *)(v5 + 144) = v22;

  v24 = -[GEOWaypointRouteFeatures copyWithZone:](self->_feature, "copyWithZone:", a3);
  v25 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v24;

  v26 = -[GEORoutePlanningInfo copyWithZone:](self->_routePlanningInfo, "copyWithZone:", a3);
  v27 = *(void **)(v5 + 104);
  *(_QWORD *)(v5 + 104) = v26;

  v77 = 0u;
  v78 = 0u;
  v75 = 0u;
  v76 = 0u;
  v28 = self->_arrivalParameters;
  v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v75, v91, 16);
  if (v29)
  {
    v30 = *(_QWORD *)v76;
    do
    {
      for (k = 0; k != v29; ++k)
      {
        if (*(_QWORD *)v76 != v30)
          objc_enumerationMutation(v28);
        v32 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v75 + 1) + 8 * k), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addArrivalParameters:", v32);

      }
      v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v75, v91, 16);
    }
    while (v29);
  }

  v73 = 0u;
  v74 = 0u;
  v71 = 0u;
  v72 = 0u;
  v33 = self->_trafficSignals;
  v34 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v71, v90, 16);
  if (v34)
  {
    v35 = *(_QWORD *)v72;
    do
    {
      for (m = 0; m != v34; ++m)
      {
        if (*(_QWORD *)v72 != v35)
          objc_enumerationMutation(v33);
        v37 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v71 + 1) + 8 * m), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addTrafficSignal:", v37);

      }
      v34 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v71, v90, 16);
    }
    while (v34);
  }

  v69 = 0u;
  v70 = 0u;
  v67 = 0u;
  v68 = 0u;
  v38 = self->_trafficCameras;
  v39 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v38, "countByEnumeratingWithState:objects:count:", &v67, v89, 16);
  if (v39)
  {
    v40 = *(_QWORD *)v68;
    do
    {
      for (n = 0; n != v39; ++n)
      {
        if (*(_QWORD *)v68 != v40)
          objc_enumerationMutation(v38);
        v42 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v67 + 1) + 8 * n), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addTrafficCamera:", v42);

      }
      v39 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v38, "countByEnumeratingWithState:objects:count:", &v67, v89, 16);
    }
    while (v39);
  }

  v65 = 0u;
  v66 = 0u;
  v63 = 0u;
  v64 = 0u;
  v43 = self->_incidentsOnRouteLegs;
  v44 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v43, "countByEnumeratingWithState:objects:count:", &v63, v88, 16);
  if (v44)
  {
    v45 = *(_QWORD *)v64;
    do
    {
      for (ii = 0; ii != v44; ++ii)
      {
        if (*(_QWORD *)v64 != v45)
          objc_enumerationMutation(v43);
        v47 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v63 + 1) + 8 * ii), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addIncidentsOnRouteLegs:", v47);

      }
      v44 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v43, "countByEnumeratingWithState:objects:count:", &v63, v88, 16);
    }
    while (v44);
  }

  v48 = -[GEORestrictionZoneInfo copyWithZone:](self->_restrictionZoneInfo, "copyWithZone:", a3);
  v49 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v48;

  v50 = -[GEOOutOfMapsAlertsInfo copyWithZone:](self->_outOfMapsAlertsInfo, "copyWithZone:", a3);
  v51 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v50;

  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  v52 = self->_trafficBannerTexts;
  v53 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v52, "countByEnumeratingWithState:objects:count:", &v59, v87, 16);
  if (v53)
  {
    v54 = *(_QWORD *)v60;
    do
    {
      for (jj = 0; jj != v53; ++jj)
      {
        if (*(_QWORD *)v60 != v54)
          objc_enumerationMutation(v52);
        v56 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v59 + 1) + 8 * jj), "copyWithZone:", a3, (_QWORD)v59);
        objc_msgSend((id)v5, "addTrafficBannerText:", v56);

      }
      v53 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v52, "countByEnumeratingWithState:objects:count:", &v59, v87, 16);
    }
    while (v53);
  }

  PBRepeatedInt32Copy();
  v57 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v57;
LABEL_63:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  $EFA9D2CD557EBB9C5A9F4F80D3257E6E flags;
  int v6;
  NSMutableArray *routeLegs;
  NSMutableArray *names;
  GEOTraversalTimes *traversalTimes;
  GEOTraversalTimes *tripTimes;
  GEOWaypointRouteFeatures *feature;
  GEORoutePlanningInfo *routePlanningInfo;
  NSMutableArray *arrivalParameters;
  NSMutableArray *trafficSignals;
  NSMutableArray *trafficCameras;
  NSMutableArray *incidentsOnRouteLegs;
  GEORestrictionZoneInfo *restrictionZoneInfo;
  GEOOutOfMapsAlertsInfo *outOfMapsAlertsInfo;
  NSMutableArray *trafficBannerTexts;
  char IsEqual;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_56;
  -[GEOWaypointRoute readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  flags = self->_flags;
  v6 = *((_DWORD *)v4 + 46);
  if ((*(_BYTE *)&flags & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_identifier != *((_DWORD *)v4 + 43))
      goto LABEL_56;
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_56;
  }
  routeLegs = self->_routeLegs;
  if ((unint64_t)routeLegs | *((_QWORD *)v4 + 12))
  {
    if (!-[NSMutableArray isEqual:](routeLegs, "isEqual:"))
      goto LABEL_56;
    flags = self->_flags;
    v6 = *((_DWORD *)v4 + 46);
  }
  if ((*(_BYTE *)&flags & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_transportType != *((_DWORD *)v4 + 44))
      goto LABEL_56;
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_56;
  }
  if ((*(_BYTE *)&flags & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_drivingSide != *((_DWORD *)v4 + 42))
      goto LABEL_56;
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_56;
  }
  if ((*(_BYTE *)&flags & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_type != *((_DWORD *)v4 + 45))
      goto LABEL_56;
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_56;
  }
  names = self->_names;
  if ((unint64_t)names | *((_QWORD *)v4 + 9))
  {
    if (-[NSMutableArray isEqual:](names, "isEqual:"))
    {
      flags = self->_flags;
      v6 = *((_DWORD *)v4 + 46);
      goto LABEL_28;
    }
LABEL_56:
    IsEqual = 0;
    goto LABEL_57;
  }
LABEL_28:
  if ((*(_BYTE *)&flags & 1) != 0)
  {
    if ((v6 & 1) == 0 || self->_distanceMeters != *((_DWORD *)v4 + 41))
      goto LABEL_56;
  }
  else if ((v6 & 1) != 0)
  {
    goto LABEL_56;
  }
  traversalTimes = self->_traversalTimes;
  if ((unint64_t)traversalTimes | *((_QWORD *)v4 + 17)
    && !-[GEOTraversalTimes isEqual:](traversalTimes, "isEqual:"))
  {
    goto LABEL_56;
  }
  tripTimes = self->_tripTimes;
  if ((unint64_t)tripTimes | *((_QWORD *)v4 + 18))
  {
    if (!-[GEOTraversalTimes isEqual:](tripTimes, "isEqual:"))
      goto LABEL_56;
  }
  feature = self->_feature;
  if ((unint64_t)feature | *((_QWORD *)v4 + 7))
  {
    if (!-[GEOWaypointRouteFeatures isEqual:](feature, "isEqual:"))
      goto LABEL_56;
  }
  routePlanningInfo = self->_routePlanningInfo;
  if ((unint64_t)routePlanningInfo | *((_QWORD *)v4 + 13))
  {
    if (!-[GEORoutePlanningInfo isEqual:](routePlanningInfo, "isEqual:"))
      goto LABEL_56;
  }
  arrivalParameters = self->_arrivalParameters;
  if ((unint64_t)arrivalParameters | *((_QWORD *)v4 + 6))
  {
    if (!-[NSMutableArray isEqual:](arrivalParameters, "isEqual:"))
      goto LABEL_56;
  }
  trafficSignals = self->_trafficSignals;
  if ((unint64_t)trafficSignals | *((_QWORD *)v4 + 16))
  {
    if (!-[NSMutableArray isEqual:](trafficSignals, "isEqual:"))
      goto LABEL_56;
  }
  trafficCameras = self->_trafficCameras;
  if ((unint64_t)trafficCameras | *((_QWORD *)v4 + 15))
  {
    if (!-[NSMutableArray isEqual:](trafficCameras, "isEqual:"))
      goto LABEL_56;
  }
  incidentsOnRouteLegs = self->_incidentsOnRouteLegs;
  if ((unint64_t)incidentsOnRouteLegs | *((_QWORD *)v4 + 8))
  {
    if (!-[NSMutableArray isEqual:](incidentsOnRouteLegs, "isEqual:"))
      goto LABEL_56;
  }
  restrictionZoneInfo = self->_restrictionZoneInfo;
  if ((unint64_t)restrictionZoneInfo | *((_QWORD *)v4 + 11))
  {
    if (!-[GEORestrictionZoneInfo isEqual:](restrictionZoneInfo, "isEqual:"))
      goto LABEL_56;
  }
  outOfMapsAlertsInfo = self->_outOfMapsAlertsInfo;
  if ((unint64_t)outOfMapsAlertsInfo | *((_QWORD *)v4 + 10))
  {
    if (!-[GEOOutOfMapsAlertsInfo isEqual:](outOfMapsAlertsInfo, "isEqual:"))
      goto LABEL_56;
  }
  trafficBannerTexts = self->_trafficBannerTexts;
  if ((unint64_t)trafficBannerTexts | *((_QWORD *)v4 + 14))
  {
    if (!-[NSMutableArray isEqual:](trafficBannerTexts, "isEqual:"))
      goto LABEL_56;
  }
  IsEqual = PBRepeatedInt32IsEqual();
LABEL_57:

  return IsEqual;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  $EFA9D2CD557EBB9C5A9F4F80D3257E6E flags;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;

  -[GEOWaypointRoute readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 4) != 0)
    v3 = 2654435761 * self->_identifier;
  else
    v3 = 0;
  v4 = -[NSMutableArray hash](self->_routeLegs, "hash");
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 8) == 0)
  {
    v6 = 0;
    if ((*(_BYTE *)&flags & 2) != 0)
      goto LABEL_6;
LABEL_9:
    v7 = 0;
    if ((*(_BYTE *)&flags & 0x10) != 0)
      goto LABEL_7;
    goto LABEL_10;
  }
  v6 = 2654435761 * self->_transportType;
  if ((*(_BYTE *)&flags & 2) == 0)
    goto LABEL_9;
LABEL_6:
  v7 = 2654435761 * self->_drivingSide;
  if ((*(_BYTE *)&flags & 0x10) != 0)
  {
LABEL_7:
    v8 = 2654435761 * self->_type;
    goto LABEL_11;
  }
LABEL_10:
  v8 = 0;
LABEL_11:
  v9 = -[NSMutableArray hash](self->_names, "hash");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v10 = 2654435761 * self->_distanceMeters;
  else
    v10 = 0;
  v11 = v4 ^ v3 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ -[GEOTraversalTimes hash](self->_traversalTimes, "hash");
  v12 = -[GEOTraversalTimes hash](self->_tripTimes, "hash");
  v13 = v12 ^ -[GEOWaypointRouteFeatures hash](self->_feature, "hash");
  v14 = v11 ^ v13 ^ -[GEORoutePlanningInfo hash](self->_routePlanningInfo, "hash");
  v15 = -[NSMutableArray hash](self->_arrivalParameters, "hash");
  v16 = v15 ^ -[NSMutableArray hash](self->_trafficSignals, "hash");
  v17 = v16 ^ -[NSMutableArray hash](self->_trafficCameras, "hash");
  v18 = v14 ^ v17 ^ -[NSMutableArray hash](self->_incidentsOnRouteLegs, "hash");
  v19 = -[GEORestrictionZoneInfo hash](self->_restrictionZoneInfo, "hash");
  v20 = v19 ^ -[GEOOutOfMapsAlertsInfo hash](self->_outOfMapsAlertsInfo, "hash");
  v21 = v20 ^ -[NSMutableArray hash](self->_trafficBannerTexts, "hash");
  return v18 ^ v21 ^ PBRepeatedInt32Hash();
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  int v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  GEOTraversalTimes *traversalTimes;
  uint64_t v17;
  GEOTraversalTimes *tripTimes;
  uint64_t v19;
  GEOWaypointRouteFeatures *feature;
  uint64_t v21;
  GEORoutePlanningInfo *routePlanningInfo;
  uint64_t v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t k;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t m;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t n;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t ii;
  GEORestrictionZoneInfo *restrictionZoneInfo;
  uint64_t v45;
  GEOOutOfMapsAlertsInfo *outOfMapsAlertsInfo;
  uint64_t v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t jj;
  uint64_t v53;
  uint64_t v54;
  uint64_t kk;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  _BYTE v84[128];
  _BYTE v85[128];
  _BYTE v86[128];
  _BYTE v87[128];
  _BYTE v88[128];
  _BYTE v89[128];
  _BYTE v90[128];
  uint64_t v91;

  v91 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  if ((*((_BYTE *)v4 + 184) & 4) != 0)
  {
    self->_identifier = *((_DWORD *)v4 + 43);
    *(_DWORD *)&self->_flags |= 4u;
  }
  v82 = 0u;
  v83 = 0u;
  v80 = 0u;
  v81 = 0u;
  v5 = *((id *)v4 + 12);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v80, v90, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v81;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v81 != v8)
          objc_enumerationMutation(v5);
        -[GEOWaypointRoute addRouteLeg:](self, "addRouteLeg:", *(_QWORD *)(*((_QWORD *)&v80 + 1) + 8 * i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v80, v90, 16);
    }
    while (v7);
  }

  v10 = *((_DWORD *)v4 + 46);
  if ((v10 & 8) != 0)
  {
    self->_transportType = *((_DWORD *)v4 + 44);
    *(_DWORD *)&self->_flags |= 8u;
    v10 = *((_DWORD *)v4 + 46);
    if ((v10 & 2) == 0)
    {
LABEL_12:
      if ((v10 & 0x10) == 0)
        goto LABEL_14;
      goto LABEL_13;
    }
  }
  else if ((v10 & 2) == 0)
  {
    goto LABEL_12;
  }
  self->_drivingSide = *((_DWORD *)v4 + 42);
  *(_DWORD *)&self->_flags |= 2u;
  if ((*((_DWORD *)v4 + 46) & 0x10) != 0)
  {
LABEL_13:
    self->_type = *((_DWORD *)v4 + 45);
    *(_DWORD *)&self->_flags |= 0x10u;
  }
LABEL_14:
  v78 = 0u;
  v79 = 0u;
  v76 = 0u;
  v77 = 0u;
  v11 = *((id *)v4 + 9);
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v76, v89, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v77;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v77 != v14)
          objc_enumerationMutation(v11);
        -[GEOWaypointRoute addName:](self, "addName:", *(_QWORD *)(*((_QWORD *)&v76 + 1) + 8 * j));
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v76, v89, 16);
    }
    while (v13);
  }

  if ((*((_BYTE *)v4 + 184) & 1) != 0)
  {
    self->_distanceMeters = *((_DWORD *)v4 + 41);
    *(_DWORD *)&self->_flags |= 1u;
  }
  traversalTimes = self->_traversalTimes;
  v17 = *((_QWORD *)v4 + 17);
  if (traversalTimes)
  {
    if (v17)
      -[GEOTraversalTimes mergeFrom:](traversalTimes, "mergeFrom:");
  }
  else if (v17)
  {
    -[GEOWaypointRoute setTraversalTimes:](self, "setTraversalTimes:");
  }
  tripTimes = self->_tripTimes;
  v19 = *((_QWORD *)v4 + 18);
  if (tripTimes)
  {
    if (v19)
      -[GEOTraversalTimes mergeFrom:](tripTimes, "mergeFrom:");
  }
  else if (v19)
  {
    -[GEOWaypointRoute setTripTimes:](self, "setTripTimes:");
  }
  feature = self->_feature;
  v21 = *((_QWORD *)v4 + 7);
  if (feature)
  {
    if (v21)
      -[GEOWaypointRouteFeatures mergeFrom:](feature, "mergeFrom:");
  }
  else if (v21)
  {
    -[GEOWaypointRoute setFeature:](self, "setFeature:");
  }
  routePlanningInfo = self->_routePlanningInfo;
  v23 = *((_QWORD *)v4 + 13);
  if (routePlanningInfo)
  {
    if (v23)
      -[GEORoutePlanningInfo mergeFrom:](routePlanningInfo, "mergeFrom:");
  }
  else if (v23)
  {
    -[GEOWaypointRoute setRoutePlanningInfo:](self, "setRoutePlanningInfo:");
  }
  v74 = 0u;
  v75 = 0u;
  v72 = 0u;
  v73 = 0u;
  v24 = *((id *)v4 + 6);
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v72, v88, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v73;
    do
    {
      for (k = 0; k != v26; ++k)
      {
        if (*(_QWORD *)v73 != v27)
          objc_enumerationMutation(v24);
        -[GEOWaypointRoute addArrivalParameters:](self, "addArrivalParameters:", *(_QWORD *)(*((_QWORD *)&v72 + 1) + 8 * k));
      }
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v72, v88, 16);
    }
    while (v26);
  }

  v70 = 0u;
  v71 = 0u;
  v68 = 0u;
  v69 = 0u;
  v29 = *((id *)v4 + 16);
  v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v68, v87, 16);
  if (v30)
  {
    v31 = v30;
    v32 = *(_QWORD *)v69;
    do
    {
      for (m = 0; m != v31; ++m)
      {
        if (*(_QWORD *)v69 != v32)
          objc_enumerationMutation(v29);
        -[GEOWaypointRoute addTrafficSignal:](self, "addTrafficSignal:", *(_QWORD *)(*((_QWORD *)&v68 + 1) + 8 * m));
      }
      v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v68, v87, 16);
    }
    while (v31);
  }

  v66 = 0u;
  v67 = 0u;
  v64 = 0u;
  v65 = 0u;
  v34 = *((id *)v4 + 15);
  v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v64, v86, 16);
  if (v35)
  {
    v36 = v35;
    v37 = *(_QWORD *)v65;
    do
    {
      for (n = 0; n != v36; ++n)
      {
        if (*(_QWORD *)v65 != v37)
          objc_enumerationMutation(v34);
        -[GEOWaypointRoute addTrafficCamera:](self, "addTrafficCamera:", *(_QWORD *)(*((_QWORD *)&v64 + 1) + 8 * n));
      }
      v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v64, v86, 16);
    }
    while (v36);
  }

  v62 = 0u;
  v63 = 0u;
  v60 = 0u;
  v61 = 0u;
  v39 = *((id *)v4 + 8);
  v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v60, v85, 16);
  if (v40)
  {
    v41 = v40;
    v42 = *(_QWORD *)v61;
    do
    {
      for (ii = 0; ii != v41; ++ii)
      {
        if (*(_QWORD *)v61 != v42)
          objc_enumerationMutation(v39);
        -[GEOWaypointRoute addIncidentsOnRouteLegs:](self, "addIncidentsOnRouteLegs:", *(_QWORD *)(*((_QWORD *)&v60 + 1) + 8 * ii));
      }
      v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v60, v85, 16);
    }
    while (v41);
  }

  restrictionZoneInfo = self->_restrictionZoneInfo;
  v45 = *((_QWORD *)v4 + 11);
  if (restrictionZoneInfo)
  {
    if (v45)
      -[GEORestrictionZoneInfo mergeFrom:](restrictionZoneInfo, "mergeFrom:");
  }
  else if (v45)
  {
    -[GEOWaypointRoute setRestrictionZoneInfo:](self, "setRestrictionZoneInfo:");
  }
  outOfMapsAlertsInfo = self->_outOfMapsAlertsInfo;
  v47 = *((_QWORD *)v4 + 10);
  if (outOfMapsAlertsInfo)
  {
    if (v47)
      -[GEOOutOfMapsAlertsInfo mergeFrom:](outOfMapsAlertsInfo, "mergeFrom:");
  }
  else if (v47)
  {
    -[GEOWaypointRoute setOutOfMapsAlertsInfo:](self, "setOutOfMapsAlertsInfo:");
  }
  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  v48 = *((id *)v4 + 14);
  v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v56, v84, 16);
  if (v49)
  {
    v50 = v49;
    v51 = *(_QWORD *)v57;
    do
    {
      for (jj = 0; jj != v50; ++jj)
      {
        if (*(_QWORD *)v57 != v51)
          objc_enumerationMutation(v48);
        -[GEOWaypointRoute addTrafficBannerText:](self, "addTrafficBannerText:", *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * jj), (_QWORD)v56);
      }
      v50 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v56, v84, 16);
    }
    while (v50);
  }

  v53 = objc_msgSend(v4, "initialPromptTypesCount");
  if (v53)
  {
    v54 = v53;
    for (kk = 0; kk != v54; ++kk)
      -[GEOWaypointRoute addInitialPromptType:](self, "addInitialPromptType:", objc_msgSend(v4, "initialPromptTypeAtIndex:", kk, (_QWORD)v56));
  }

}

- (PBUnknownFields)unknownFields
{
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v5;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_BYTE *)&self->_flags & 0x20) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      v5 = reader;
      objc_sync_enter(v5);
      GEOWaypointRouteReadSpecified((uint64_t)self, (unint64_t)self->_reader, unknownFields_tags_7553);
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
  NSMutableArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSMutableArray *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSMutableArray *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSMutableArray *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  NSMutableArray *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  _BYTE v70[128];
  _BYTE v71[128];
  _BYTE v72[128];
  _BYTE v73[128];
  _BYTE v74[128];
  _BYTE v75[128];
  _BYTE v76[128];
  uint64_t v77;

  v3 = a3;
  v77 = *MEMORY[0x1E0C80C00];
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x100020u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEOWaypointRoute readAll:](self, "readAll:", 0);
    v68 = 0u;
    v69 = 0u;
    v66 = 0u;
    v67 = 0u;
    v7 = self->_routeLegs;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v66, v76, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v67;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v67 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v66 + 1) + 8 * v11++), "clearUnknownFields:", 1);
        }
        while (v9 != v11);
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v66, v76, 16);
      }
      while (v9);
    }

    v64 = 0u;
    v65 = 0u;
    v62 = 0u;
    v63 = 0u;
    v12 = self->_names;
    v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v62, v75, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v63;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v63 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v62 + 1) + 8 * v16++), "clearUnknownFields:", 1);
        }
        while (v14 != v16);
        v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v62, v75, 16);
      }
      while (v14);
    }

    -[GEOTraversalTimes clearUnknownFields:](self->_traversalTimes, "clearUnknownFields:", 1);
    -[GEOTraversalTimes clearUnknownFields:](self->_tripTimes, "clearUnknownFields:", 1);
    -[GEOWaypointRouteFeatures clearUnknownFields:](self->_feature, "clearUnknownFields:", 1);
    -[GEORoutePlanningInfo clearUnknownFields:](self->_routePlanningInfo, "clearUnknownFields:", 1);
    v60 = 0u;
    v61 = 0u;
    v58 = 0u;
    v59 = 0u;
    v17 = self->_arrivalParameters;
    v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v58, v74, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v59;
      do
      {
        v21 = 0;
        do
        {
          if (*(_QWORD *)v59 != v20)
            objc_enumerationMutation(v17);
          objc_msgSend(*(id *)(*((_QWORD *)&v58 + 1) + 8 * v21++), "clearUnknownFields:", 1);
        }
        while (v19 != v21);
        v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v58, v74, 16);
      }
      while (v19);
    }

    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    v22 = self->_trafficSignals;
    v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v54, v73, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v55;
      do
      {
        v26 = 0;
        do
        {
          if (*(_QWORD *)v55 != v25)
            objc_enumerationMutation(v22);
          objc_msgSend(*(id *)(*((_QWORD *)&v54 + 1) + 8 * v26++), "clearUnknownFields:", 1);
        }
        while (v24 != v26);
        v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v54, v73, 16);
      }
      while (v24);
    }

    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    v27 = self->_trafficCameras;
    v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v50, v72, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v51;
      do
      {
        v31 = 0;
        do
        {
          if (*(_QWORD *)v51 != v30)
            objc_enumerationMutation(v27);
          objc_msgSend(*(id *)(*((_QWORD *)&v50 + 1) + 8 * v31++), "clearUnknownFields:", 1);
        }
        while (v29 != v31);
        v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v50, v72, 16);
      }
      while (v29);
    }

    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    v32 = self->_incidentsOnRouteLegs;
    v33 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v32, "countByEnumeratingWithState:objects:count:", &v46, v71, 16);
    if (v33)
    {
      v34 = v33;
      v35 = *(_QWORD *)v47;
      do
      {
        v36 = 0;
        do
        {
          if (*(_QWORD *)v47 != v35)
            objc_enumerationMutation(v32);
          objc_msgSend(*(id *)(*((_QWORD *)&v46 + 1) + 8 * v36++), "clearUnknownFields:", 1);
        }
        while (v34 != v36);
        v34 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v32, "countByEnumeratingWithState:objects:count:", &v46, v71, 16);
      }
      while (v34);
    }

    -[GEORestrictionZoneInfo clearUnknownFields:](self->_restrictionZoneInfo, "clearUnknownFields:", 1);
    -[GEOOutOfMapsAlertsInfo clearUnknownFields:](self->_outOfMapsAlertsInfo, "clearUnknownFields:", 1);
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v37 = self->_trafficBannerTexts;
    v38 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v37, "countByEnumeratingWithState:objects:count:", &v42, v70, 16);
    if (v38)
    {
      v39 = v38;
      v40 = *(_QWORD *)v43;
      do
      {
        v41 = 0;
        do
        {
          if (*(_QWORD *)v43 != v40)
            objc_enumerationMutation(v37);
          objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * v41++), "clearUnknownFields:", 1, (_QWORD)v42);
        }
        while (v39 != v41);
        v39 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v37, "countByEnumeratingWithState:objects:count:", &v42, v70, 16);
      }
      while (v39);
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tripTimes, 0);
  objc_storeStrong((id *)&self->_traversalTimes, 0);
  objc_storeStrong((id *)&self->_trafficSignals, 0);
  objc_storeStrong((id *)&self->_trafficCameras, 0);
  objc_storeStrong((id *)&self->_trafficBannerTexts, 0);
  objc_storeStrong((id *)&self->_routePlanningInfo, 0);
  objc_storeStrong((id *)&self->_routeLegs, 0);
  objc_storeStrong((id *)&self->_restrictionZoneInfo, 0);
  objc_storeStrong((id *)&self->_outOfMapsAlertsInfo, 0);
  objc_storeStrong((id *)&self->_names, 0);
  objc_storeStrong((id *)&self->_incidentsOnRouteLegs, 0);
  objc_storeStrong((id *)&self->_feature, 0);
  objc_storeStrong((id *)&self->_arrivalParameters, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

- (id)_geoTrafficCameras
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99E08];
  -[GEOWaypointRoute trafficCameras](self, "trafficCameras");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[GEOWaypointRoute trafficCameras](self, "trafficCameras", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v11, "identifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          objc_msgSend(v11, "identifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, v13);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)_geoTrafficSignals
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99E08];
  -[GEOWaypointRoute trafficSignals](self, "trafficSignals");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[GEOWaypointRoute trafficSignals](self, "trafficSignals", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v11, "identifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          objc_msgSend(v11, "identifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, v13);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  return v5;
}

@end
