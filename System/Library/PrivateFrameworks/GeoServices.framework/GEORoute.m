@implementation GEORoute

- (GEORoute)init
{
  GEORoute *v2;
  GEORoute *v3;
  GEORoute *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEORoute;
  v2 = -[GEORoute init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORoute)initWithData:(id)a3
{
  GEORoute *v3;
  GEORoute *v4;
  GEORoute *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEORoute;
  v3 = -[GEORoute initWithData:](&v7, sel_initWithData_, a3);
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

  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  PBRepeatedInt32Clear();
  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEORoute;
  -[GEORoute dealloc](&v3, sel_dealloc);
}

- (int)transportType
{
  os_unfair_lock_s *p_readerLock;
  uint64_t flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (uint64_t)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 0x1000) != 0)
    return self->_transportType;
  else
    return 0;
}

- (void)setTransportType:(int)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 2;
  *(_QWORD *)&self->_flags |= 0x1000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  self->_transportType = a3;
}

- (void)setHasTransportType:(BOOL)a3
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)&self->_flags + 8);
  v4 = 4096;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFEFFFLL | v4;
  *((_BYTE *)&self->_flags + 8) = v3 | 2;
}

- (BOOL)hasTransportType
{
  return (*(_QWORD *)&self->_flags >> 12) & 1;
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

- (void)_readSteps
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 496));
    if ((*(_QWORD *)(a1 + 564) & 0x400000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORouteReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readSteps_tags_1);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 496));
  }
}

- (NSMutableArray)steps
{
  -[GEORoute _readSteps]((uint64_t)self);
  return self->_steps;
}

- (void)setSteps:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *steps;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x400000000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *((_BYTE *)&self->_flags + 8) |= 2u;
  steps = self->_steps;
  self->_steps = v4;

}

- (void)clearSteps
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x400000000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((_BYTE *)&self->_flags + 8) |= 2u;
  -[NSMutableArray removeAllObjects](self->_steps, "removeAllObjects");
}

- (void)addStep:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;

  v4 = a3;
  -[GEORoute _readSteps]((uint64_t)self);
  -[GEORoute _addNoFlagsStep:]((uint64_t)self, v4);

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  self = (GEORoute *)((char *)self + 564);
  self->super.super.isa = (Class)((unint64_t)self->super.super.isa | 0x400000000000000);
  os_unfair_lock_unlock(p_readerLock);
  LOBYTE(self->_reader) |= 2u;
}

- (void)_addNoFlagsStep:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 432);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 432);
      *(_QWORD *)(a1 + 432) = v5;

      v4 = *(void **)(a1 + 432);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)stepsCount
{
  -[GEORoute _readSteps]((uint64_t)self);
  return -[NSMutableArray count](self->_steps, "count");
}

- (id)stepAtIndex:(unint64_t)a3
{
  -[GEORoute _readSteps]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_steps, "objectAtIndex:", a3);
}

+ (Class)stepType
{
  return (Class)objc_opt_class();
}

- (void)_readName
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 496));
    if ((*(_QWORD *)(a1 + 564) & 0x20000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORouteReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readName_tags_6);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 496));
  }
}

- (BOOL)hasName
{
  -[GEORoute _readName]((uint64_t)self);
  return self->_name != 0;
}

- (NSString)name
{
  -[GEORoute _readName]((uint64_t)self);
  return self->_name;
}

- (void)setName:(id)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 2;
  *(_QWORD *)&self->_flags |= 0x20000000000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_name, a3);
}

- (void)_readPhoneticName
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 496));
    if ((*(_QWORD *)(a1 + 564) & 0x400000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORouteReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readPhoneticName_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 496));
  }
}

- (BOOL)hasPhoneticName
{
  -[GEORoute _readPhoneticName]((uint64_t)self);
  return self->_phoneticName != 0;
}

- (NSString)phoneticName
{
  -[GEORoute _readPhoneticName]((uint64_t)self);
  return self->_phoneticName;
}

- (void)setPhoneticName:(id)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 2;
  *(_QWORD *)&self->_flags |= 0x400000000000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_phoneticName, a3);
}

- (unsigned)distance
{
  return self->_distance;
}

- (void)setDistance:(unsigned int)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 2;
  *(_QWORD *)&self->_flags |= 8uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  self->_distance = a3;
}

- (void)setHasDistance:(BOOL)a3
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)&self->_flags + 8);
  v4 = 8;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFFF7 | v4;
  *((_BYTE *)&self->_flags + 8) = v3 | 2;
}

- (BOOL)hasDistance
{
  return (*(_QWORD *)&self->_flags >> 3) & 1;
}

- (unsigned)expectedTime
{
  return self->_expectedTime;
}

- (void)setExpectedTime:(unsigned int)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 2;
  *(_QWORD *)&self->_flags |= 0x40uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  self->_expectedTime = a3;
}

- (void)setHasExpectedTime:(BOOL)a3
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)&self->_flags + 8);
  v4 = 64;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFFBFLL | v4;
  *((_BYTE *)&self->_flags + 8) = v3 | 2;
}

- (BOOL)hasExpectedTime
{
  return (*(_QWORD *)&self->_flags >> 6) & 1;
}

- (void)_readRouteID
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 496));
    if ((*(_QWORD *)(a1 + 564) & 0x2000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORouteReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readRouteID_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 496));
  }
}

- (BOOL)hasRouteID
{
  -[GEORoute _readRouteID]((uint64_t)self);
  return self->_routeID != 0;
}

- (NSData)routeID
{
  -[GEORoute _readRouteID]((uint64_t)self);
  return self->_routeID;
}

- (void)setRouteID:(id)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 2;
  *(_QWORD *)&self->_flags |= 0x2000000000000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_routeID, a3);
}

- (int)routeType
{
  os_unfair_lock_s *p_readerLock;
  uint64_t flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (uint64_t)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 0x200) != 0)
    return self->_routeType;
  else
    return 0;
}

- (void)setRouteType:(int)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 2;
  *(_QWORD *)&self->_flags |= 0x200uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  self->_routeType = a3;
}

- (void)setHasRouteType:(BOOL)a3
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)&self->_flags + 8);
  v4 = 512;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFDFFLL | v4;
  *((_BYTE *)&self->_flags + 8) = v3 | 2;
}

- (BOOL)hasRouteType
{
  return (*(_QWORD *)&self->_flags >> 9) & 1;
}

- (id)routeTypeAsString:(int)a3
{
  if (a3 < 6)
    return off_1E1C088A8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsRouteType:(id)a3
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

- (void)_readZilchPoints
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 496));
    if ((*(_BYTE *)(a1 + 572) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORouteReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readZilchPoints_tags_4184);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 496));
  }
}

- (NSMutableArray)zilchPoints
{
  -[GEORoute _readZilchPoints]((uint64_t)self);
  return self->_zilchPoints;
}

- (void)setZilchPoints:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *zilchPoints;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *((_BYTE *)&self->_flags + 8) |= 1u;
  os_unfair_lock_unlock(&self->_readerLock);
  *((_BYTE *)&self->_flags + 8) |= 2u;
  zilchPoints = self->_zilchPoints;
  self->_zilchPoints = v4;

}

- (void)clearZilchPoints
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *((_BYTE *)&self->_flags + 8) |= 1u;
  os_unfair_lock_unlock(p_readerLock);
  *((_BYTE *)&self->_flags + 8) |= 2u;
  -[NSMutableArray removeAllObjects](self->_zilchPoints, "removeAllObjects");
}

- (void)addZilchPoints:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;

  v4 = a3;
  -[GEORoute _readZilchPoints]((uint64_t)self);
  -[GEORoute _addNoFlagsZilchPoints:]((uint64_t)self, v4);

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  self = (GEORoute *)((char *)self + 564);
  LOBYTE(self->_reader) |= 1u;
  os_unfair_lock_unlock(p_readerLock);
  LOBYTE(self->_reader) |= 2u;
}

- (void)_addNoFlagsZilchPoints:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 480);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 480);
      *(_QWORD *)(a1 + 480) = v5;

      v4 = *(void **)(a1 + 480);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)zilchPointsCount
{
  -[GEORoute _readZilchPoints]((uint64_t)self);
  return -[NSMutableArray count](self->_zilchPoints, "count");
}

- (id)zilchPointsAtIndex:(unint64_t)a3
{
  -[GEORoute _readZilchPoints]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_zilchPoints, "objectAtIndex:", a3);
}

+ (Class)zilchPointsType
{
  return (Class)objc_opt_class();
}

- (void)_readBasicPoints
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 496));
    if ((*(_QWORD *)(a1 + 564) & 0x10000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORouteReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readBasicPoints_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 496));
  }
}

- (NSMutableArray)basicPoints
{
  -[GEORoute _readBasicPoints]((uint64_t)self);
  return self->_basicPoints;
}

- (void)setBasicPoints:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *basicPoints;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x10000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *((_BYTE *)&self->_flags + 8) |= 2u;
  basicPoints = self->_basicPoints;
  self->_basicPoints = v4;

}

- (void)clearBasicPoints
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x10000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((_BYTE *)&self->_flags + 8) |= 2u;
  -[NSMutableArray removeAllObjects](self->_basicPoints, "removeAllObjects");
}

- (void)addBasicPoints:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;

  v4 = a3;
  -[GEORoute _readBasicPoints]((uint64_t)self);
  -[GEORoute _addNoFlagsBasicPoints:]((uint64_t)self, v4);

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  self = (GEORoute *)((char *)self + 564);
  self->super.super.isa = (Class)((unint64_t)self->super.super.isa | 0x10000000);
  os_unfair_lock_unlock(p_readerLock);
  LOBYTE(self->_reader) |= 2u;
}

- (void)_addNoFlagsBasicPoints:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 192);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 192);
      *(_QWORD *)(a1 + 192) = v5;

      v4 = *(void **)(a1 + 192);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)basicPointsCount
{
  -[GEORoute _readBasicPoints]((uint64_t)self);
  return -[NSMutableArray count](self->_basicPoints, "count");
}

- (id)basicPointsAtIndex:(unint64_t)a3
{
  -[GEORoute _readBasicPoints]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_basicPoints, "objectAtIndex:", a3);
}

+ (Class)basicPointsType
{
  return (Class)objc_opt_class();
}

- (void)_readPathLeg
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 496));
    if ((*(_QWORD *)(a1 + 564) & 0x100000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORouteReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readPathLeg_tags_4185);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 496));
  }
}

- (BOOL)hasPathLeg
{
  -[GEORoute _readPathLeg]((uint64_t)self);
  return self->_pathLeg != 0;
}

- (NSData)pathLeg
{
  -[GEORoute _readPathLeg]((uint64_t)self);
  return self->_pathLeg;
}

- (void)setPathLeg:(id)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 2;
  *(_QWORD *)&self->_flags |= 0x100000000000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_pathLeg, a3);
}

- (void)_readPathMapMatcherInstructions
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 496));
    if ((*(_QWORD *)(a1 + 564) & 0x200000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORouteReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readPathMapMatcherInstructions_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 496));
  }
}

- (BOOL)hasPathMapMatcherInstructions
{
  -[GEORoute _readPathMapMatcherInstructions]((uint64_t)self);
  return self->_pathMapMatcherInstructions != 0;
}

- (GEOPathMapMatcherInstructions)pathMapMatcherInstructions
{
  -[GEORoute _readPathMapMatcherInstructions]((uint64_t)self);
  return self->_pathMapMatcherInstructions;
}

- (void)setPathMapMatcherInstructions:(id)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 2;
  *(_QWORD *)&self->_flags |= 0x200000000000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_pathMapMatcherInstructions, a3);
}

- (int)drivingSide
{
  os_unfair_lock_s *p_readerLock;
  uint64_t flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (uint64_t)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 0x10) != 0)
    return self->_drivingSide;
  else
    return 0;
}

- (void)setDrivingSide:(int)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 2;
  *(_QWORD *)&self->_flags |= 0x10uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  self->_drivingSide = a3;
}

- (void)setHasDrivingSide:(BOOL)a3
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)&self->_flags + 8);
  v4 = 16;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFFEFLL | v4;
  *((_BYTE *)&self->_flags + 8) = v3 | 2;
}

- (BOOL)hasDrivingSide
{
  return (*(_QWORD *)&self->_flags >> 4) & 1;
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

- (void)_readDepartureRouteID
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 496));
    if ((*(_QWORD *)(a1 + 564) & 0x40000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORouteReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readDepartureRouteID_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 496));
  }
}

- (BOOL)hasDepartureRouteID
{
  -[GEORoute _readDepartureRouteID]((uint64_t)self);
  return self->_departureRouteID != 0;
}

- (NSData)departureRouteID
{
  -[GEORoute _readDepartureRouteID]((uint64_t)self);
  return self->_departureRouteID;
}

- (void)setDepartureRouteID:(id)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 2;
  *(_QWORD *)&self->_flags |= 0x40000000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_departureRouteID, a3);
}

- (unsigned)departureStepID
{
  return self->_departureStepID;
}

- (void)setDepartureStepID:(unsigned int)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 2;
  *(_QWORD *)&self->_flags |= 4uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  self->_departureStepID = a3;
}

- (void)setHasDepartureStepID:(BOOL)a3
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)&self->_flags + 8);
  v4 = 4;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFFFBLL | v4;
  *((_BYTE *)&self->_flags + 8) = v3 | 2;
}

- (BOOL)hasDepartureStepID
{
  return (*(_QWORD *)&self->_flags >> 2) & 1;
}

- (void)_readArrivalRouteID
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 496));
    if ((*(_QWORD *)(a1 + 564) & 0x8000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORouteReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readArrivalRouteID_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 496));
  }
}

- (BOOL)hasArrivalRouteID
{
  -[GEORoute _readArrivalRouteID]((uint64_t)self);
  return self->_arrivalRouteID != 0;
}

- (NSData)arrivalRouteID
{
  -[GEORoute _readArrivalRouteID]((uint64_t)self);
  return self->_arrivalRouteID;
}

- (void)setArrivalRouteID:(id)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 2;
  *(_QWORD *)&self->_flags |= 0x8000000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_arrivalRouteID, a3);
}

- (unsigned)arrivalStepID
{
  return self->_arrivalStepID;
}

- (void)setArrivalStepID:(unsigned int)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 2;
  *(_QWORD *)&self->_flags |= 1uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  self->_arrivalStepID = a3;
}

- (void)setHasArrivalStepID:(BOOL)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 2;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFFFELL | a3;
  *((_BYTE *)&self->_flags + 8) = v3;
}

- (BOOL)hasArrivalStepID
{
  return *(_DWORD *)&self->_flags & 1;
}

- (void)_readTrafficColors
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 496));
    if ((*(_QWORD *)(a1 + 564) & 0x1000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORouteReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readTrafficColors_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 496));
  }
}

- (unint64_t)trafficColorsCount
{
  -[GEORoute _readTrafficColors]((uint64_t)self);
  return self->_trafficColors.count;
}

- (unsigned)trafficColors
{
  -[GEORoute _readTrafficColors]((uint64_t)self);
  return self->_trafficColors.list;
}

- (void)clearTrafficColors
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x1000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((_BYTE *)&self->_flags + 8) |= 2u;
  PBRepeatedUInt32Clear();
}

- (void)addTrafficColor:(unsigned int)a3
{
  os_unfair_lock_s *p_readerLock;
  $581651A3999351CF43A2CF8B014366CB *p_flags;

  -[GEORoute _readTrafficColors]((uint64_t)self);
  if (self)
    PBRepeatedUInt32Add();
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  p_flags = &self->_flags;
  *(_QWORD *)p_flags |= 0x1000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((_BYTE *)p_flags + 8) |= 2u;
}

- (unsigned)trafficColorAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_trafficColors;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEORoute _readTrafficColors]((uint64_t)self);
  p_trafficColors = &self->_trafficColors;
  count = self->_trafficColors.count;
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
  return p_trafficColors->list[a3];
}

- (void)setTrafficColors:(unsigned int *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x1000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((_BYTE *)&self->_flags + 8) |= 2u;
  PBRepeatedUInt32Set();
}

- (void)_readTrafficColorOffsets
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 496));
    if ((*(_QWORD *)(a1 + 564) & 0x800000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORouteReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readTrafficColorOffsets_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 496));
  }
}

- (unint64_t)trafficColorOffsetsCount
{
  -[GEORoute _readTrafficColorOffsets]((uint64_t)self);
  return self->_trafficColorOffsets.count;
}

- (unsigned)trafficColorOffsets
{
  -[GEORoute _readTrafficColorOffsets]((uint64_t)self);
  return self->_trafficColorOffsets.list;
}

- (void)clearTrafficColorOffsets
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x800000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((_BYTE *)&self->_flags + 8) |= 2u;
  PBRepeatedUInt32Clear();
}

- (void)addTrafficColorOffset:(unsigned int)a3
{
  os_unfair_lock_s *p_readerLock;
  $581651A3999351CF43A2CF8B014366CB *p_flags;

  -[GEORoute _readTrafficColorOffsets]((uint64_t)self);
  if (self)
    PBRepeatedUInt32Add();
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  p_flags = &self->_flags;
  *(_QWORD *)p_flags |= 0x800000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((_BYTE *)p_flags + 8) |= 2u;
}

- (unsigned)trafficColorOffsetAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_trafficColorOffsets;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEORoute _readTrafficColorOffsets]((uint64_t)self);
  p_trafficColorOffsets = &self->_trafficColorOffsets;
  count = self->_trafficColorOffsets.count;
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
  return p_trafficColorOffsets->list[a3];
}

- (void)setTrafficColorOffsets:(unsigned int *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x800000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((_BYTE *)&self->_flags + 8) |= 2u;
  PBRepeatedUInt32Set();
}

- (void)_readRouteLineStyleInfos
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 496));
    if ((*(_QWORD *)(a1 + 564) & 0x40000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORouteReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readRouteLineStyleInfos_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 496));
  }
}

- (NSMutableArray)routeLineStyleInfos
{
  -[GEORoute _readRouteLineStyleInfos]((uint64_t)self);
  return self->_routeLineStyleInfos;
}

- (void)setRouteLineStyleInfos:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *routeLineStyleInfos;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x40000000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *((_BYTE *)&self->_flags + 8) |= 2u;
  routeLineStyleInfos = self->_routeLineStyleInfos;
  self->_routeLineStyleInfos = v4;

}

- (void)clearRouteLineStyleInfos
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x40000000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((_BYTE *)&self->_flags + 8) |= 2u;
  -[NSMutableArray removeAllObjects](self->_routeLineStyleInfos, "removeAllObjects");
}

- (void)addRouteLineStyleInfo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;

  v4 = a3;
  -[GEORoute _readRouteLineStyleInfos]((uint64_t)self);
  -[GEORoute _addNoFlagsRouteLineStyleInfo:]((uint64_t)self, v4);

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  self = (GEORoute *)((char *)self + 564);
  self->super.super.isa = (Class)((unint64_t)self->super.super.isa | 0x40000000000000);
  os_unfair_lock_unlock(p_readerLock);
  LOBYTE(self->_reader) |= 2u;
}

- (void)_addNoFlagsRouteLineStyleInfo:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 400);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 400);
      *(_QWORD *)(a1 + 400) = v5;

      v4 = *(void **)(a1 + 400);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)routeLineStyleInfosCount
{
  -[GEORoute _readRouteLineStyleInfos]((uint64_t)self);
  return -[NSMutableArray count](self->_routeLineStyleInfos, "count");
}

- (id)routeLineStyleInfoAtIndex:(unint64_t)a3
{
  -[GEORoute _readRouteLineStyleInfos]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_routeLineStyleInfos, "objectAtIndex:", a3);
}

+ (Class)routeLineStyleInfoType
{
  return (Class)objc_opt_class();
}

- (void)_readRouteCameraInputInfos
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 496));
    if ((*(_QWORD *)(a1 + 564) & 0x8000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORouteReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readRouteCameraInputInfos_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 496));
  }
}

- (NSMutableArray)routeCameraInputInfos
{
  -[GEORoute _readRouteCameraInputInfos]((uint64_t)self);
  return self->_routeCameraInputInfos;
}

- (void)setRouteCameraInputInfos:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *routeCameraInputInfos;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x8000000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *((_BYTE *)&self->_flags + 8) |= 2u;
  routeCameraInputInfos = self->_routeCameraInputInfos;
  self->_routeCameraInputInfos = v4;

}

- (void)clearRouteCameraInputInfos
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x8000000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((_BYTE *)&self->_flags + 8) |= 2u;
  -[NSMutableArray removeAllObjects](self->_routeCameraInputInfos, "removeAllObjects");
}

- (void)addRouteCameraInputInfo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;

  v4 = a3;
  -[GEORoute _readRouteCameraInputInfos]((uint64_t)self);
  -[GEORoute _addNoFlagsRouteCameraInputInfo:]((uint64_t)self, v4);

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  self = (GEORoute *)((char *)self + 564);
  self->super.super.isa = (Class)((unint64_t)self->super.super.isa | 0x8000000000000);
  os_unfair_lock_unlock(p_readerLock);
  LOBYTE(self->_reader) |= 2u;
}

- (void)_addNoFlagsRouteCameraInputInfo:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 376);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 376);
      *(_QWORD *)(a1 + 376) = v5;

      v4 = *(void **)(a1 + 376);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)routeCameraInputInfosCount
{
  -[GEORoute _readRouteCameraInputInfos]((uint64_t)self);
  return -[NSMutableArray count](self->_routeCameraInputInfos, "count");
}

- (id)routeCameraInputInfoAtIndex:(unint64_t)a3
{
  -[GEORoute _readRouteCameraInputInfos]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_routeCameraInputInfos, "objectAtIndex:", a3);
}

+ (Class)routeCameraInputInfoType
{
  return (Class)objc_opt_class();
}

- (void)_readTrafficColorInfos
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 496));
    if ((*(_QWORD *)(a1 + 564) & 0x800000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORouteReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readTrafficColorInfos_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 496));
  }
}

- (NSMutableArray)trafficColorInfos
{
  -[GEORoute _readTrafficColorInfos]((uint64_t)self);
  return self->_trafficColorInfos;
}

- (void)setTrafficColorInfos:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *trafficColorInfos;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x800000000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *((_BYTE *)&self->_flags + 8) |= 2u;
  trafficColorInfos = self->_trafficColorInfos;
  self->_trafficColorInfos = v4;

}

- (void)clearTrafficColorInfos
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x800000000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((_BYTE *)&self->_flags + 8) |= 2u;
  -[NSMutableArray removeAllObjects](self->_trafficColorInfos, "removeAllObjects");
}

- (void)addTrafficColorInfo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;

  v4 = a3;
  -[GEORoute _readTrafficColorInfos]((uint64_t)self);
  -[GEORoute _addNoFlagsTrafficColorInfo:]((uint64_t)self, v4);

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  self = (GEORoute *)((char *)self + 564);
  self->super.super.isa = (Class)((unint64_t)self->super.super.isa | 0x800000000000000);
  os_unfair_lock_unlock(p_readerLock);
  LOBYTE(self->_reader) |= 2u;
}

- (void)_addNoFlagsTrafficColorInfo:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 440);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 440);
      *(_QWORD *)(a1 + 440) = v5;

      v4 = *(void **)(a1 + 440);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)trafficColorInfosCount
{
  -[GEORoute _readTrafficColorInfos]((uint64_t)self);
  return -[NSMutableArray count](self->_trafficColorInfos, "count");
}

- (id)trafficColorInfoAtIndex:(unint64_t)a3
{
  -[GEORoute _readTrafficColorInfos]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_trafficColorInfos, "objectAtIndex:", a3);
}

+ (Class)trafficColorInfoType
{
  return (Class)objc_opt_class();
}

- (void)_readRouteNames
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 496));
    if ((*(_QWORD *)(a1 + 564) & 0x4000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORouteReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readRouteNames_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 496));
  }
}

- (NSMutableArray)routeNames
{
  -[GEORoute _readRouteNames]((uint64_t)self);
  return self->_routeNames;
}

- (void)setRouteNames:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *routeNames;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x4000000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *((_BYTE *)&self->_flags + 8) |= 2u;
  routeNames = self->_routeNames;
  self->_routeNames = v4;

}

- (void)clearRouteNames
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x4000000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((_BYTE *)&self->_flags + 8) |= 2u;
  -[NSMutableArray removeAllObjects](self->_routeNames, "removeAllObjects");
}

- (void)addRouteName:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;

  v4 = a3;
  -[GEORoute _readRouteNames]((uint64_t)self);
  -[GEORoute _addNoFlagsRouteName:]((uint64_t)self, v4);

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  self = (GEORoute *)((char *)self + 564);
  self->super.super.isa = (Class)((unint64_t)self->super.super.isa | 0x4000000000000);
  os_unfair_lock_unlock(p_readerLock);
  LOBYTE(self->_reader) |= 2u;
}

- (void)_addNoFlagsRouteName:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 368);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 368);
      *(_QWORD *)(a1 + 368) = v5;

      v4 = *(void **)(a1 + 368);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)routeNamesCount
{
  -[GEORoute _readRouteNames]((uint64_t)self);
  return -[NSMutableArray count](self->_routeNames, "count");
}

- (id)routeNameAtIndex:(unint64_t)a3
{
  -[GEORoute _readRouteNames]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_routeNames, "objectAtIndex:", a3);
}

+ (Class)routeNameType
{
  return (Class)objc_opt_class();
}

- (unsigned)historicTravelTime
{
  return self->_historicTravelTime;
}

- (void)setHistoricTravelTime:(unsigned int)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 2;
  *(_QWORD *)&self->_flags |= 0x80uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  self->_historicTravelTime = a3;
}

- (void)setHasHistoricTravelTime:(BOOL)a3
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)&self->_flags + 8);
  v4 = 128;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFF7FLL | v4;
  *((_BYTE *)&self->_flags + 8) = v3 | 2;
}

- (BOOL)hasHistoricTravelTime
{
  return (*(_QWORD *)&self->_flags >> 7) & 1;
}

- (void)_readAdvisoryNotices
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 496));
    if ((*(_QWORD *)(a1 + 564) & 0x2000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORouteReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readAdvisoryNotices_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 496));
  }
}

- (NSMutableArray)advisoryNotices
{
  -[GEORoute _readAdvisoryNotices]((uint64_t)self);
  return self->_advisoryNotices;
}

- (void)setAdvisoryNotices:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *advisoryNotices;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x2000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *((_BYTE *)&self->_flags + 8) |= 2u;
  advisoryNotices = self->_advisoryNotices;
  self->_advisoryNotices = v4;

}

- (void)clearAdvisoryNotices
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x2000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((_BYTE *)&self->_flags + 8) |= 2u;
  -[NSMutableArray removeAllObjects](self->_advisoryNotices, "removeAllObjects");
}

- (void)addAdvisoryNotice:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;

  v4 = a3;
  -[GEORoute _readAdvisoryNotices]((uint64_t)self);
  -[GEORoute _addNoFlagsAdvisoryNotice:]((uint64_t)self, v4);

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  self = (GEORoute *)((char *)self + 564);
  self->super.super.isa = (Class)((unint64_t)self->super.super.isa | 0x2000000);
  os_unfair_lock_unlock(p_readerLock);
  LOBYTE(self->_reader) |= 2u;
}

- (void)_addNoFlagsAdvisoryNotice:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 168);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 168);
      *(_QWORD *)(a1 + 168) = v5;

      v4 = *(void **)(a1 + 168);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)advisoryNoticesCount
{
  -[GEORoute _readAdvisoryNotices]((uint64_t)self);
  return -[NSMutableArray count](self->_advisoryNotices, "count");
}

- (id)advisoryNoticeAtIndex:(unint64_t)a3
{
  -[GEORoute _readAdvisoryNotices]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_advisoryNotices, "objectAtIndex:", a3);
}

+ (Class)advisoryNoticeType
{
  return (Class)objc_opt_class();
}

- (void)_readRouteLabelDetailText
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 496));
    if ((*(_QWORD *)(a1 + 564) & 0x20000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORouteReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readRouteLabelDetailText_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 496));
  }
}

- (BOOL)hasRouteLabelDetailText
{
  -[GEORoute _readRouteLabelDetailText]((uint64_t)self);
  return self->_routeLabelDetailText != 0;
}

- (GEOFormattedString)routeLabelDetailText
{
  -[GEORoute _readRouteLabelDetailText]((uint64_t)self);
  return self->_routeLabelDetailText;
}

- (void)setRouteLabelDetailText:(id)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 2;
  *(_QWORD *)&self->_flags |= 0x20000000000000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_routeLabelDetailText, a3);
}

- (void)_readInfrastructureDescription
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 496));
    if ((*(_QWORD *)(a1 + 564) & 0x4000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORouteReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readInfrastructureDescription_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 496));
  }
}

- (BOOL)hasInfrastructureDescription
{
  -[GEORoute _readInfrastructureDescription]((uint64_t)self);
  return self->_infrastructureDescription != 0;
}

- (GEOFormattedString)infrastructureDescription
{
  -[GEORoute _readInfrastructureDescription]((uint64_t)self);
  return self->_infrastructureDescription;
}

- (void)setInfrastructureDescription:(id)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 2;
  *(_QWORD *)&self->_flags |= 0x4000000000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_infrastructureDescription, a3);
}

- (void)_readClickableAdvisory
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 496));
    if ((*(_QWORD *)(a1 + 564) & 0x20000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORouteReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readClickableAdvisory_tags_4189);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 496));
  }
}

- (BOOL)hasClickableAdvisory
{
  -[GEORoute _readClickableAdvisory]((uint64_t)self);
  return self->_clickableAdvisory != 0;
}

- (GEOClickableAdvisory)clickableAdvisory
{
  -[GEORoute _readClickableAdvisory]((uint64_t)self);
  return self->_clickableAdvisory;
}

- (void)setClickableAdvisory:(id)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 2;
  *(_QWORD *)&self->_flags |= 0x20000000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_clickableAdvisory, a3);
}

- (unsigned)travelTimeAggressiveEstimate
{
  return self->_travelTimeAggressiveEstimate;
}

- (void)setTravelTimeAggressiveEstimate:(unsigned int)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 2;
  *(_QWORD *)&self->_flags |= 0x2000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  self->_travelTimeAggressiveEstimate = a3;
}

- (void)setHasTravelTimeAggressiveEstimate:(BOOL)a3
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)&self->_flags + 8);
  v4 = 0x2000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFDFFFLL | v4;
  *((_BYTE *)&self->_flags + 8) = v3 | 2;
}

- (BOOL)hasTravelTimeAggressiveEstimate
{
  return (*(_QWORD *)&self->_flags >> 13) & 1;
}

- (unsigned)travelTimeConservativeEstimate
{
  return self->_travelTimeConservativeEstimate;
}

- (void)setTravelTimeConservativeEstimate:(unsigned int)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 2;
  *(_QWORD *)&self->_flags |= 0x4000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  self->_travelTimeConservativeEstimate = a3;
}

- (void)setHasTravelTimeConservativeEstimate:(BOOL)a3
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)&self->_flags + 8);
  v4 = 0x4000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFBFFFLL | v4;
  *((_BYTE *)&self->_flags + 8) = v3 | 2;
}

- (BOOL)hasTravelTimeConservativeEstimate
{
  return (*(_QWORD *)&self->_flags >> 14) & 1;
}

- (unsigned)staticTravelTime
{
  return self->_staticTravelTime;
}

- (void)setStaticTravelTime:(unsigned int)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 2;
  *(_QWORD *)&self->_flags |= 0x400uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  self->_staticTravelTime = a3;
}

- (void)setHasStaticTravelTime:(BOOL)a3
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)&self->_flags + 8);
  v4 = 1024;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFBFFLL | v4;
  *((_BYTE *)&self->_flags + 8) = v3 | 2;
}

- (BOOL)hasStaticTravelTime
{
  return (*(_QWORD *)&self->_flags >> 10) & 1;
}

- (BOOL)avoidsTolls
{
  return self->_avoidsTolls;
}

- (void)setAvoidsTolls:(BOOL)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 2;
  *(_QWORD *)&self->_flags |= 0x10000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  self->_avoidsTolls = a3;
}

- (void)setHasAvoidsTolls:(BOOL)a3
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)&self->_flags + 8);
  v4 = 0x10000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFFEFFFFLL | v4;
  *((_BYTE *)&self->_flags + 8) = v3 | 2;
}

- (BOOL)hasAvoidsTolls
{
  return (*(_QWORD *)&self->_flags >> 16) & 1;
}

- (BOOL)avoidsHighways
{
  return self->_avoidsHighways;
}

- (void)setAvoidsHighways:(BOOL)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 2;
  *(_QWORD *)&self->_flags |= 0x8000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  self->_avoidsHighways = a3;
}

- (void)setHasAvoidsHighways:(BOOL)a3
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)&self->_flags + 8);
  v4 = 0x8000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFFF7FFFLL | v4;
  *((_BYTE *)&self->_flags + 8) = v3 | 2;
}

- (BOOL)hasAvoidsHighways
{
  return (*(_QWORD *)&self->_flags >> 15) & 1;
}

- (BOOL)avoidsTraffic
{
  return self->_avoidsTraffic;
}

- (void)setAvoidsTraffic:(BOOL)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 2;
  *(_QWORD *)&self->_flags |= 0x20000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  self->_avoidsTraffic = a3;
}

- (void)setHasAvoidsTraffic:(BOOL)a3
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)&self->_flags + 8);
  v4 = 0x20000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFFDFFFFLL | v4;
  *((_BYTE *)&self->_flags + 8) = v3 | 2;
}

- (BOOL)hasAvoidsTraffic
{
  return (*(_QWORD *)&self->_flags >> 17) & 1;
}

- (void)_readEnrouteNotices
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 496));
    if ((*(_QWORD *)(a1 + 564) & 0x800000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORouteReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readEnrouteNotices_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 496));
  }
}

- (NSMutableArray)enrouteNotices
{
  -[GEORoute _readEnrouteNotices]((uint64_t)self);
  return self->_enrouteNotices;
}

- (void)setEnrouteNotices:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *enrouteNotices;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x800000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *((_BYTE *)&self->_flags + 8) |= 2u;
  enrouteNotices = self->_enrouteNotices;
  self->_enrouteNotices = v4;

}

- (void)clearEnrouteNotices
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x800000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((_BYTE *)&self->_flags + 8) |= 2u;
  -[NSMutableArray removeAllObjects](self->_enrouteNotices, "removeAllObjects");
}

- (void)addEnrouteNotice:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;

  v4 = a3;
  -[GEORoute _readEnrouteNotices]((uint64_t)self);
  -[GEORoute _addNoFlagsEnrouteNotice:]((uint64_t)self, v4);

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  self = (GEORoute *)((char *)self + 564);
  self->super.super.isa = (Class)((unint64_t)self->super.super.isa | 0x800000000);
  os_unfair_lock_unlock(p_readerLock);
  LOBYTE(self->_reader) |= 2u;
}

- (void)_addNoFlagsEnrouteNotice:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 248);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 248);
      *(_QWORD *)(a1 + 248) = v5;

      v4 = *(void **)(a1 + 248);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)enrouteNoticesCount
{
  -[GEORoute _readEnrouteNotices]((uint64_t)self);
  return -[NSMutableArray count](self->_enrouteNotices, "count");
}

- (id)enrouteNoticeAtIndex:(unint64_t)a3
{
  -[GEORoute _readEnrouteNotices]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_enrouteNotices, "objectAtIndex:", a3);
}

+ (Class)enrouteNoticeType
{
  return (Class)objc_opt_class();
}

- (void)_readUnpackedLatLngVertices
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 496));
    if ((*(_QWORD *)(a1 + 564) & 0x4000000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORouteReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readUnpackedLatLngVertices_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 496));
  }
}

- (BOOL)hasUnpackedLatLngVertices
{
  -[GEORoute _readUnpackedLatLngVertices]((uint64_t)self);
  return self->_unpackedLatLngVertices != 0;
}

- (NSData)unpackedLatLngVertices
{
  -[GEORoute _readUnpackedLatLngVertices]((uint64_t)self);
  return self->_unpackedLatLngVertices;
}

- (void)setUnpackedLatLngVertices:(id)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 2;
  *(_QWORD *)&self->_flags |= 0x4000000000000000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_unpackedLatLngVertices, a3);
}

- (void)_readIncidentIndices
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 496));
    if ((*(_QWORD *)(a1 + 564) & 0x400000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORouteReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readIncidentIndices_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 496));
  }
}

- (unint64_t)incidentIndicesCount
{
  -[GEORoute _readIncidentIndices]((uint64_t)self);
  return self->_incidentIndices.count;
}

- (unsigned)incidentIndices
{
  -[GEORoute _readIncidentIndices]((uint64_t)self);
  return self->_incidentIndices.list;
}

- (void)clearIncidentIndices
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x400000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((_BYTE *)&self->_flags + 8) |= 2u;
  PBRepeatedUInt32Clear();
}

- (void)addIncidentIndices:(unsigned int)a3
{
  os_unfair_lock_s *p_readerLock;
  $581651A3999351CF43A2CF8B014366CB *p_flags;

  -[GEORoute _readIncidentIndices]((uint64_t)self);
  if (self)
    PBRepeatedUInt32Add();
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  p_flags = &self->_flags;
  *(_QWORD *)p_flags |= 0x400000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((_BYTE *)p_flags + 8) |= 2u;
}

- (unsigned)incidentIndicesAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_incidentIndices;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEORoute _readIncidentIndices]((uint64_t)self);
  p_incidentIndices = &self->_incidentIndices;
  count = self->_incidentIndices.count;
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
  return p_incidentIndices->list[a3];
}

- (void)setIncidentIndices:(unsigned int *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x400000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((_BYTE *)&self->_flags + 8) |= 2u;
  PBRepeatedUInt32Set();
}

- (void)_readIncidentEndOffsetsInRoutes
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 496));
    if ((*(_QWORD *)(a1 + 564) & 0x200000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORouteReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readIncidentEndOffsetsInRoutes_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 496));
  }
}

- (unint64_t)incidentEndOffsetsInRoutesCount
{
  -[GEORoute _readIncidentEndOffsetsInRoutes]((uint64_t)self);
  return self->_incidentEndOffsetsInRoutes.count;
}

- (unsigned)incidentEndOffsetsInRoutes
{
  -[GEORoute _readIncidentEndOffsetsInRoutes]((uint64_t)self);
  return self->_incidentEndOffsetsInRoutes.list;
}

- (void)clearIncidentEndOffsetsInRoutes
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x200000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((_BYTE *)&self->_flags + 8) |= 2u;
  PBRepeatedUInt32Clear();
}

- (void)addIncidentEndOffsetsInRoute:(unsigned int)a3
{
  os_unfair_lock_s *p_readerLock;
  $581651A3999351CF43A2CF8B014366CB *p_flags;

  -[GEORoute _readIncidentEndOffsetsInRoutes]((uint64_t)self);
  if (self)
    PBRepeatedUInt32Add();
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  p_flags = &self->_flags;
  *(_QWORD *)p_flags |= 0x200000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((_BYTE *)p_flags + 8) |= 2u;
}

- (unsigned)incidentEndOffsetsInRouteAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_incidentEndOffsetsInRoutes;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEORoute _readIncidentEndOffsetsInRoutes]((uint64_t)self);
  p_incidentEndOffsetsInRoutes = &self->_incidentEndOffsetsInRoutes;
  count = self->_incidentEndOffsetsInRoutes.count;
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
  return p_incidentEndOffsetsInRoutes->list[a3];
}

- (void)setIncidentEndOffsetsInRoutes:(unsigned int *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x200000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((_BYTE *)&self->_flags + 8) |= 2u;
  PBRepeatedUInt32Set();
}

- (void)_readIncidentOnRouteInfos
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 496));
    if ((*(_QWORD *)(a1 + 564) & 0x2000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORouteReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readIncidentOnRouteInfos_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 496));
  }
}

- (NSMutableArray)incidentOnRouteInfos
{
  -[GEORoute _readIncidentOnRouteInfos]((uint64_t)self);
  return self->_incidentOnRouteInfos;
}

- (void)setIncidentOnRouteInfos:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *incidentOnRouteInfos;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x2000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *((_BYTE *)&self->_flags + 8) |= 2u;
  incidentOnRouteInfos = self->_incidentOnRouteInfos;
  self->_incidentOnRouteInfos = v4;

}

- (void)clearIncidentOnRouteInfos
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x2000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((_BYTE *)&self->_flags + 8) |= 2u;
  -[NSMutableArray removeAllObjects](self->_incidentOnRouteInfos, "removeAllObjects");
}

- (void)addIncidentOnRouteInfo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;

  v4 = a3;
  -[GEORoute _readIncidentOnRouteInfos]((uint64_t)self);
  -[GEORoute _addNoFlagsIncidentOnRouteInfo:]((uint64_t)self, v4);

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  self = (GEORoute *)((char *)self + 564);
  self->super.super.isa = (Class)((unint64_t)self->super.super.isa | 0x2000000000);
  os_unfair_lock_unlock(p_readerLock);
  LOBYTE(self->_reader) |= 2u;
}

- (void)_addNoFlagsIncidentOnRouteInfo:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 264);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 264);
      *(_QWORD *)(a1 + 264) = v5;

      v4 = *(void **)(a1 + 264);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)incidentOnRouteInfosCount
{
  -[GEORoute _readIncidentOnRouteInfos]((uint64_t)self);
  return -[NSMutableArray count](self->_incidentOnRouteInfos, "count");
}

- (id)incidentOnRouteInfoAtIndex:(unint64_t)a3
{
  -[GEORoute _readIncidentOnRouteInfos]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_incidentOnRouteInfos, "objectAtIndex:", a3);
}

+ (Class)incidentOnRouteInfoType
{
  return (Class)objc_opt_class();
}

- (void)_readRoutePlanningDescription
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 496));
    if ((*(_QWORD *)(a1 + 564) & 0x80000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORouteReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readRoutePlanningDescription_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 496));
  }
}

- (BOOL)hasRoutePlanningDescription
{
  -[GEORoute _readRoutePlanningDescription]((uint64_t)self);
  return self->_routePlanningDescription != 0;
}

- (GEORouteInformation)routePlanningDescription
{
  -[GEORoute _readRoutePlanningDescription]((uint64_t)self);
  return self->_routePlanningDescription;
}

- (void)setRoutePlanningDescription:(id)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 2;
  *(_QWORD *)&self->_flags |= 0x80000000000000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_routePlanningDescription, a3);
}

- (void)_readRouteDescriptions
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 496));
    if ((*(_QWORD *)(a1 + 564) & 0x10000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORouteReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readRouteDescriptions_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 496));
  }
}

- (NSMutableArray)routeDescriptions
{
  -[GEORoute _readRouteDescriptions]((uint64_t)self);
  return self->_routeDescriptions;
}

- (void)setRouteDescriptions:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *routeDescriptions;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x10000000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *((_BYTE *)&self->_flags + 8) |= 2u;
  routeDescriptions = self->_routeDescriptions;
  self->_routeDescriptions = v4;

}

- (void)clearRouteDescriptions
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x10000000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((_BYTE *)&self->_flags + 8) |= 2u;
  -[NSMutableArray removeAllObjects](self->_routeDescriptions, "removeAllObjects");
}

- (void)addRouteDescription:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;

  v4 = a3;
  -[GEORoute _readRouteDescriptions]((uint64_t)self);
  -[GEORoute _addNoFlagsRouteDescription:]((uint64_t)self, v4);

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  self = (GEORoute *)((char *)self + 564);
  self->super.super.isa = (Class)((unint64_t)self->super.super.isa | 0x10000000000000);
  os_unfair_lock_unlock(p_readerLock);
  LOBYTE(self->_reader) |= 2u;
}

- (void)_addNoFlagsRouteDescription:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 384);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 384);
      *(_QWORD *)(a1 + 384) = v5;

      v4 = *(void **)(a1 + 384);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)routeDescriptionsCount
{
  -[GEORoute _readRouteDescriptions]((uint64_t)self);
  return -[NSMutableArray count](self->_routeDescriptions, "count");
}

- (id)routeDescriptionAtIndex:(unint64_t)a3
{
  -[GEORoute _readRouteDescriptions]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_routeDescriptions, "objectAtIndex:", a3);
}

+ (Class)routeDescriptionType
{
  return (Class)objc_opt_class();
}

- (void)_readStartingRouteInstructions
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 496));
    if ((*(_QWORD *)(a1 + 564) & 0x100000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORouteReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readStartingRouteInstructions_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 496));
  }
}

- (NSMutableArray)startingRouteInstructions
{
  -[GEORoute _readStartingRouteInstructions]((uint64_t)self);
  return self->_startingRouteInstructions;
}

- (void)setStartingRouteInstructions:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *startingRouteInstructions;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x100000000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *((_BYTE *)&self->_flags + 8) |= 2u;
  startingRouteInstructions = self->_startingRouteInstructions;
  self->_startingRouteInstructions = v4;

}

- (void)clearStartingRouteInstructions
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x100000000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((_BYTE *)&self->_flags + 8) |= 2u;
  -[NSMutableArray removeAllObjects](self->_startingRouteInstructions, "removeAllObjects");
}

- (void)addStartingRouteInstruction:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;

  v4 = a3;
  -[GEORoute _readStartingRouteInstructions]((uint64_t)self);
  -[GEORoute _addNoFlagsStartingRouteInstruction:]((uint64_t)self, v4);

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  self = (GEORoute *)((char *)self + 564);
  self->super.super.isa = (Class)((unint64_t)self->super.super.isa | 0x100000000000000);
  os_unfair_lock_unlock(p_readerLock);
  LOBYTE(self->_reader) |= 2u;
}

- (void)_addNoFlagsStartingRouteInstruction:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 416);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 416);
      *(_QWORD *)(a1 + 416) = v5;

      v4 = *(void **)(a1 + 416);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)startingRouteInstructionsCount
{
  -[GEORoute _readStartingRouteInstructions]((uint64_t)self);
  return -[NSMutableArray count](self->_startingRouteInstructions, "count");
}

- (id)startingRouteInstructionAtIndex:(unint64_t)a3
{
  -[GEORoute _readStartingRouteInstructions]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_startingRouteInstructions, "objectAtIndex:", a3);
}

+ (Class)startingRouteInstructionType
{
  return (Class)objc_opt_class();
}

- (void)_readEndingRouteInstructions
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 496));
    if ((*(_QWORD *)(a1 + 564) & 0x400000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORouteReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readEndingRouteInstructions_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 496));
  }
}

- (NSMutableArray)endingRouteInstructions
{
  -[GEORoute _readEndingRouteInstructions]((uint64_t)self);
  return self->_endingRouteInstructions;
}

- (void)setEndingRouteInstructions:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *endingRouteInstructions;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x400000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *((_BYTE *)&self->_flags + 8) |= 2u;
  endingRouteInstructions = self->_endingRouteInstructions;
  self->_endingRouteInstructions = v4;

}

- (void)clearEndingRouteInstructions
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x400000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((_BYTE *)&self->_flags + 8) |= 2u;
  -[NSMutableArray removeAllObjects](self->_endingRouteInstructions, "removeAllObjects");
}

- (void)addEndingRouteInstruction:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;

  v4 = a3;
  -[GEORoute _readEndingRouteInstructions]((uint64_t)self);
  -[GEORoute _addNoFlagsEndingRouteInstruction:]((uint64_t)self, v4);

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  self = (GEORoute *)((char *)self + 564);
  self->super.super.isa = (Class)((unint64_t)self->super.super.isa | 0x400000000);
  os_unfair_lock_unlock(p_readerLock);
  LOBYTE(self->_reader) |= 2u;
}

- (void)_addNoFlagsEndingRouteInstruction:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 240);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 240);
      *(_QWORD *)(a1 + 240) = v5;

      v4 = *(void **)(a1 + 240);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)endingRouteInstructionsCount
{
  -[GEORoute _readEndingRouteInstructions]((uint64_t)self);
  return -[NSMutableArray count](self->_endingRouteInstructions, "count");
}

- (id)endingRouteInstructionAtIndex:(unint64_t)a3
{
  -[GEORoute _readEndingRouteInstructions]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_endingRouteInstructions, "objectAtIndex:", a3);
}

+ (Class)endingRouteInstructionType
{
  return (Class)objc_opt_class();
}

- (void)_readTrafficDescription
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 496));
    if ((*(_QWORD *)(a1 + 564) & 0x2000000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORouteReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readTrafficDescription_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 496));
  }
}

- (BOOL)hasTrafficDescription
{
  -[GEORoute _readTrafficDescription]((uint64_t)self);
  return self->_trafficDescription != 0;
}

- (NSString)trafficDescription
{
  -[GEORoute _readTrafficDescription]((uint64_t)self);
  return self->_trafficDescription;
}

- (void)setTrafficDescription:(id)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 2;
  *(_QWORD *)&self->_flags |= 0x2000000000000000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_trafficDescription, a3);
}

- (void)_readTrafficDescriptionLong
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 496));
    if ((*(_QWORD *)(a1 + 564) & 0x1000000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORouteReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readTrafficDescriptionLong_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 496));
  }
}

- (BOOL)hasTrafficDescriptionLong
{
  -[GEORoute _readTrafficDescriptionLong]((uint64_t)self);
  return self->_trafficDescriptionLong != 0;
}

- (NSString)trafficDescriptionLong
{
  -[GEORoute _readTrafficDescriptionLong]((uint64_t)self);
  return self->_trafficDescriptionLong;
}

- (void)setTrafficDescriptionLong:(id)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 2;
  *(_QWORD *)&self->_flags |= 0x1000000000000000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_trafficDescriptionLong, a3);
}

- (void)_readAlertNonRecommendedRouteText
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 496));
    if ((*(_QWORD *)(a1 + 564) & 0x4000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORouteReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readAlertNonRecommendedRouteText_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 496));
  }
}

- (BOOL)hasAlertNonRecommendedRouteText
{
  -[GEORoute _readAlertNonRecommendedRouteText]((uint64_t)self);
  return self->_alertNonRecommendedRouteText != 0;
}

- (GEOAlertNonRecommendedRouteText)alertNonRecommendedRouteText
{
  -[GEORoute _readAlertNonRecommendedRouteText]((uint64_t)self);
  return self->_alertNonRecommendedRouteText;
}

- (void)setAlertNonRecommendedRouteText:(id)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 2;
  *(_QWORD *)&self->_flags |= 0x4000000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_alertNonRecommendedRouteText, a3);
}

- (void)_readGuidanceEvents
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 496));
    if ((*(_QWORD *)(a1 + 564) & 0x1000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORouteReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readGuidanceEvents_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 496));
  }
}

- (NSMutableArray)guidanceEvents
{
  -[GEORoute _readGuidanceEvents]((uint64_t)self);
  return self->_guidanceEvents;
}

- (void)setGuidanceEvents:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *guidanceEvents;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x1000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *((_BYTE *)&self->_flags + 8) |= 2u;
  guidanceEvents = self->_guidanceEvents;
  self->_guidanceEvents = v4;

}

- (void)clearGuidanceEvents
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x1000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((_BYTE *)&self->_flags + 8) |= 2u;
  -[NSMutableArray removeAllObjects](self->_guidanceEvents, "removeAllObjects");
}

- (void)addGuidanceEvent:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;

  v4 = a3;
  -[GEORoute _readGuidanceEvents]((uint64_t)self);
  -[GEORoute _addNoFlagsGuidanceEvent:]((uint64_t)self, v4);

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  self = (GEORoute *)((char *)self + 564);
  self->super.super.isa = (Class)((unint64_t)self->super.super.isa | 0x1000000000);
  os_unfair_lock_unlock(p_readerLock);
  LOBYTE(self->_reader) |= 2u;
}

- (void)_addNoFlagsGuidanceEvent:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 256);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 256);
      *(_QWORD *)(a1 + 256) = v5;

      v4 = *(void **)(a1 + 256);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)guidanceEventsCount
{
  -[GEORoute _readGuidanceEvents]((uint64_t)self);
  return -[NSMutableArray count](self->_guidanceEvents, "count");
}

- (id)guidanceEventAtIndex:(unint64_t)a3
{
  -[GEORoute _readGuidanceEvents]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_guidanceEvents, "objectAtIndex:", a3);
}

+ (Class)guidanceEventType
{
  return (Class)objc_opt_class();
}

- (void)_readLaunchAndGoCardText
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 496));
    if ((*(_QWORD *)(a1 + 564) & 0x10000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORouteReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readLaunchAndGoCardText_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 496));
  }
}

- (BOOL)hasLaunchAndGoCardText
{
  -[GEORoute _readLaunchAndGoCardText]((uint64_t)self);
  return self->_launchAndGoCardText != 0;
}

- (GEOLaunchAndGoCardText)launchAndGoCardText
{
  -[GEORoute _readLaunchAndGoCardText]((uint64_t)self);
  return self->_launchAndGoCardText;
}

- (void)setLaunchAndGoCardText:(id)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 2;
  *(_QWORD *)&self->_flags |= 0x10000000000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_launchAndGoCardText, a3);
}

- (void)_readRoadComplexitys
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 496));
    if ((*(_QWORD *)(a1 + 564) & 0x1000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORouteReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readRoadComplexitys_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 496));
  }
}

- (NSMutableArray)roadComplexitys
{
  -[GEORoute _readRoadComplexitys]((uint64_t)self);
  return self->_roadComplexitys;
}

- (void)setRoadComplexitys:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *roadComplexitys;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x1000000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *((_BYTE *)&self->_flags + 8) |= 2u;
  roadComplexitys = self->_roadComplexitys;
  self->_roadComplexitys = v4;

}

- (void)clearRoadComplexitys
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x1000000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((_BYTE *)&self->_flags + 8) |= 2u;
  -[NSMutableArray removeAllObjects](self->_roadComplexitys, "removeAllObjects");
}

- (void)addRoadComplexity:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;

  v4 = a3;
  -[GEORoute _readRoadComplexitys]((uint64_t)self);
  -[GEORoute _addNoFlagsRoadComplexity:]((uint64_t)self, v4);

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  self = (GEORoute *)((char *)self + 564);
  self->super.super.isa = (Class)((unint64_t)self->super.super.isa | 0x1000000000000);
  os_unfair_lock_unlock(p_readerLock);
  LOBYTE(self->_reader) |= 2u;
}

- (void)_addNoFlagsRoadComplexity:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 352);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 352);
      *(_QWORD *)(a1 + 352) = v5;

      v4 = *(void **)(a1 + 352);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)roadComplexitysCount
{
  -[GEORoute _readRoadComplexitys]((uint64_t)self);
  return -[NSMutableArray count](self->_roadComplexitys, "count");
}

- (id)roadComplexityAtIndex:(unint64_t)a3
{
  -[GEORoute _readRoadComplexitys]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_roadComplexitys, "objectAtIndex:", a3);
}

+ (Class)roadComplexityType
{
  return (Class)objc_opt_class();
}

- (void)_readLaneWidths
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 496));
    if ((*(_QWORD *)(a1 + 564) & 0x8000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORouteReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readLaneWidths_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 496));
  }
}

- (NSMutableArray)laneWidths
{
  -[GEORoute _readLaneWidths]((uint64_t)self);
  return self->_laneWidths;
}

- (void)setLaneWidths:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *laneWidths;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x8000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *((_BYTE *)&self->_flags + 8) |= 2u;
  laneWidths = self->_laneWidths;
  self->_laneWidths = v4;

}

- (void)clearLaneWidths
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x8000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((_BYTE *)&self->_flags + 8) |= 2u;
  -[NSMutableArray removeAllObjects](self->_laneWidths, "removeAllObjects");
}

- (void)addLaneWidth:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;

  v4 = a3;
  -[GEORoute _readLaneWidths]((uint64_t)self);
  -[GEORoute _addNoFlagsLaneWidth:]((uint64_t)self, v4);

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  self = (GEORoute *)((char *)self + 564);
  self->super.super.isa = (Class)((unint64_t)self->super.super.isa | 0x8000000000);
  os_unfair_lock_unlock(p_readerLock);
  LOBYTE(self->_reader) |= 2u;
}

- (void)_addNoFlagsLaneWidth:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 280);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 280);
      *(_QWORD *)(a1 + 280) = v5;

      v4 = *(void **)(a1 + 280);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)laneWidthsCount
{
  -[GEORoute _readLaneWidths]((uint64_t)self);
  return -[NSMutableArray count](self->_laneWidths, "count");
}

- (id)laneWidthAtIndex:(unint64_t)a3
{
  -[GEORoute _readLaneWidths]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_laneWidths, "objectAtIndex:", a3);
}

+ (Class)laneWidthType
{
  return (Class)objc_opt_class();
}

- (void)_readElevationProfile
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 496));
    if ((*(_QWORD *)(a1 + 564) & 0x200000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORouteReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readElevationProfile_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 496));
  }
}

- (BOOL)hasElevationProfile
{
  -[GEORoute _readElevationProfile]((uint64_t)self);
  return self->_elevationProfile != 0;
}

- (GEOElevationProfile)elevationProfile
{
  -[GEORoute _readElevationProfile]((uint64_t)self);
  return self->_elevationProfile;
}

- (void)setElevationProfile:(id)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 2;
  *(_QWORD *)&self->_flags |= 0x200000000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_elevationProfile, a3);
}

- (unsigned)arrivalParameterIndex
{
  return self->_arrivalParameterIndex;
}

- (void)setArrivalParameterIndex:(unsigned int)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 2;
  *(_QWORD *)&self->_flags |= 2uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  self->_arrivalParameterIndex = a3;
}

- (void)setHasArrivalParameterIndex:(BOOL)a3
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)&self->_flags + 8);
  v4 = 2;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFFFDLL | v4;
  *((_BYTE *)&self->_flags + 8) = v3 | 2;
}

- (BOOL)hasArrivalParameterIndex
{
  return (*(_QWORD *)&self->_flags >> 1) & 1;
}

- (void)_readRestrictedZoneIds
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 496));
    if ((*(_QWORD *)(a1 + 564) & 0x800000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORouteReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readRestrictedZoneIds_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 496));
  }
}

- (NSMutableArray)restrictedZoneIds
{
  -[GEORoute _readRestrictedZoneIds]((uint64_t)self);
  return self->_restrictedZoneIds;
}

- (void)setRestrictedZoneIds:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *restrictedZoneIds;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x800000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *((_BYTE *)&self->_flags + 8) |= 2u;
  restrictedZoneIds = self->_restrictedZoneIds;
  self->_restrictedZoneIds = v4;

}

- (void)clearRestrictedZoneIds
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x800000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((_BYTE *)&self->_flags + 8) |= 2u;
  -[NSMutableArray removeAllObjects](self->_restrictedZoneIds, "removeAllObjects");
}

- (void)addRestrictedZoneIds:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;

  v4 = a3;
  -[GEORoute _readRestrictedZoneIds]((uint64_t)self);
  -[GEORoute _addNoFlagsRestrictedZoneIds:]((uint64_t)self, v4);

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  self = (GEORoute *)((char *)self + 564);
  self->super.super.isa = (Class)((unint64_t)self->super.super.isa | 0x800000000000);
  os_unfair_lock_unlock(p_readerLock);
  LOBYTE(self->_reader) |= 2u;
}

- (void)_addNoFlagsRestrictedZoneIds:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 344);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 344);
      *(_QWORD *)(a1 + 344) = v5;

      v4 = *(void **)(a1 + 344);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)restrictedZoneIdsCount
{
  -[GEORoute _readRestrictedZoneIds]((uint64_t)self);
  return -[NSMutableArray count](self->_restrictedZoneIds, "count");
}

- (id)restrictedZoneIdsAtIndex:(unint64_t)a3
{
  -[GEORoute _readRestrictedZoneIds]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_restrictedZoneIds, "objectAtIndex:", a3);
}

+ (Class)restrictedZoneIdsType
{
  return (Class)objc_opt_class();
}

- (int)licensePlateRestrictionImpact
{
  os_unfair_lock_s *p_readerLock;
  uint64_t flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (uint64_t)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 0x100) != 0)
    return self->_licensePlateRestrictionImpact;
  else
    return 0;
}

- (void)setLicensePlateRestrictionImpact:(int)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 2;
  *(_QWORD *)&self->_flags |= 0x100uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  self->_licensePlateRestrictionImpact = a3;
}

- (void)setHasLicensePlateRestrictionImpact:(BOOL)a3
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)&self->_flags + 8);
  v4 = 256;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFEFFLL | v4;
  *((_BYTE *)&self->_flags + 8) = v3 | 2;
}

- (BOOL)hasLicensePlateRestrictionImpact
{
  return (*(_QWORD *)&self->_flags >> 8) & 1;
}

- (id)licensePlateRestrictionImpactAsString:(int)a3
{
  if (a3 < 8)
    return off_1E1C08510[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsLicensePlateRestrictionImpact:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RESTRICTION_ZONE_IMPACT_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RESTRICTION_ZONE_IMPACT_NOT_AFFECTED")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RESTRICTION_ZONE_IMPACT_AVOIDS_RESTRICTION")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RESTRICTION_ZONE_IMPACT_POTENTIALLY_AFFECTED")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RESTRICTION_ZONE_IMPACT_ORIGIN_IN")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RESTRICTION_ZONE_IMPACT_DESTINATION_IN")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RESTRICTION_ZONE_IMPACT_ORIGIN_DESTINATION_IN")) & 1) != 0)
  {
    v4 = 6;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("RESTRICTION_ZONE_IMPACT_CUT_THROUGH")))
  {
    v4 = 7;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)environmentalCongestionZoneImpact
{
  os_unfair_lock_s *p_readerLock;
  uint64_t flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (uint64_t)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 0x20) != 0)
    return self->_environmentalCongestionZoneImpact;
  else
    return 0;
}

- (void)setEnvironmentalCongestionZoneImpact:(int)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 2;
  *(_QWORD *)&self->_flags |= 0x20uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  self->_environmentalCongestionZoneImpact = a3;
}

- (void)setHasEnvironmentalCongestionZoneImpact:(BOOL)a3
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)&self->_flags + 8);
  v4 = 32;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFFDFLL | v4;
  *((_BYTE *)&self->_flags + 8) = v3 | 2;
}

- (BOOL)hasEnvironmentalCongestionZoneImpact
{
  return (*(_QWORD *)&self->_flags >> 5) & 1;
}

- (id)environmentalCongestionZoneImpactAsString:(int)a3
{
  if (a3 < 8)
    return off_1E1C08510[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsEnvironmentalCongestionZoneImpact:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RESTRICTION_ZONE_IMPACT_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RESTRICTION_ZONE_IMPACT_NOT_AFFECTED")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RESTRICTION_ZONE_IMPACT_AVOIDS_RESTRICTION")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RESTRICTION_ZONE_IMPACT_POTENTIALLY_AFFECTED")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RESTRICTION_ZONE_IMPACT_ORIGIN_IN")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RESTRICTION_ZONE_IMPACT_DESTINATION_IN")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RESTRICTION_ZONE_IMPACT_ORIGIN_DESTINATION_IN")) & 1) != 0)
  {
    v4 = 6;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("RESTRICTION_ZONE_IMPACT_CUT_THROUGH")))
  {
    v4 = 7;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)tollCongestionZoneImpact
{
  os_unfair_lock_s *p_readerLock;
  uint64_t flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (uint64_t)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 0x800) != 0)
    return self->_tollCongestionZoneImpact;
  else
    return 0;
}

- (void)setTollCongestionZoneImpact:(int)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 2;
  *(_QWORD *)&self->_flags |= 0x800uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  self->_tollCongestionZoneImpact = a3;
}

- (void)setHasTollCongestionZoneImpact:(BOOL)a3
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)&self->_flags + 8);
  v4 = 2048;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFF7FFLL | v4;
  *((_BYTE *)&self->_flags + 8) = v3 | 2;
}

- (BOOL)hasTollCongestionZoneImpact
{
  return (*(_QWORD *)&self->_flags >> 11) & 1;
}

- (id)tollCongestionZoneImpactAsString:(int)a3
{
  if (a3 < 8)
    return off_1E1C08510[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsTollCongestionZoneImpact:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RESTRICTION_ZONE_IMPACT_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RESTRICTION_ZONE_IMPACT_NOT_AFFECTED")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RESTRICTION_ZONE_IMPACT_AVOIDS_RESTRICTION")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RESTRICTION_ZONE_IMPACT_POTENTIALLY_AFFECTED")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RESTRICTION_ZONE_IMPACT_ORIGIN_IN")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RESTRICTION_ZONE_IMPACT_DESTINATION_IN")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RESTRICTION_ZONE_IMPACT_ORIGIN_DESTINATION_IN")) & 1) != 0)
  {
    v4 = 6;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("RESTRICTION_ZONE_IMPACT_CUT_THROUGH")))
  {
    v4 = 7;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_readStepGroups
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 496));
    if ((*(_QWORD *)(a1 + 564) & 0x200000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORouteReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readStepGroups_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 496));
  }
}

- (NSMutableArray)stepGroups
{
  -[GEORoute _readStepGroups]((uint64_t)self);
  return self->_stepGroups;
}

- (void)setStepGroups:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *stepGroups;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x200000000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *((_BYTE *)&self->_flags + 8) |= 2u;
  stepGroups = self->_stepGroups;
  self->_stepGroups = v4;

}

- (void)clearStepGroups
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x200000000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((_BYTE *)&self->_flags + 8) |= 2u;
  -[NSMutableArray removeAllObjects](self->_stepGroups, "removeAllObjects");
}

- (void)addStepGroup:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;

  v4 = a3;
  -[GEORoute _readStepGroups]((uint64_t)self);
  -[GEORoute _addNoFlagsStepGroup:]((uint64_t)self, v4);

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  self = (GEORoute *)((char *)self + 564);
  self->super.super.isa = (Class)((unint64_t)self->super.super.isa | 0x200000000000000);
  os_unfair_lock_unlock(p_readerLock);
  LOBYTE(self->_reader) |= 2u;
}

- (void)_addNoFlagsStepGroup:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 424);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 424);
      *(_QWORD *)(a1 + 424) = v5;

      v4 = *(void **)(a1 + 424);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)stepGroupsCount
{
  -[GEORoute _readStepGroups]((uint64_t)self);
  return -[NSMutableArray count](self->_stepGroups, "count");
}

- (id)stepGroupAtIndex:(unint64_t)a3
{
  -[GEORoute _readStepGroups]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_stepGroups, "objectAtIndex:", a3);
}

+ (Class)stepGroupType
{
  return (Class)objc_opt_class();
}

- (void)_readUpdateLocations
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 496));
    if ((*(_QWORD *)(a1 + 564) & 0x8000000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORouteReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readUpdateLocations_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 496));
  }
}

- (NSMutableArray)updateLocations
{
  -[GEORoute _readUpdateLocations]((uint64_t)self);
  return self->_updateLocations;
}

- (void)setUpdateLocations:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *updateLocations;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x8000000000000000;
  os_unfair_lock_unlock(&self->_readerLock);
  *((_BYTE *)&self->_flags + 8) |= 2u;
  updateLocations = self->_updateLocations;
  self->_updateLocations = v4;

}

- (void)clearUpdateLocations
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x8000000000000000;
  os_unfair_lock_unlock(p_readerLock);
  *((_BYTE *)&self->_flags + 8) |= 2u;
  -[NSMutableArray removeAllObjects](self->_updateLocations, "removeAllObjects");
}

- (void)addUpdateLocation:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;

  v4 = a3;
  -[GEORoute _readUpdateLocations]((uint64_t)self);
  -[GEORoute _addNoFlagsUpdateLocation:]((uint64_t)self, v4);

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  self = (GEORoute *)((char *)self + 564);
  self->super.super.isa = (Class)((unint64_t)self->super.super.isa | 0x8000000000000000);
  os_unfair_lock_unlock(p_readerLock);
  LOBYTE(self->_reader) |= 2u;
}

- (void)_addNoFlagsUpdateLocation:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 472);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 472);
      *(_QWORD *)(a1 + 472) = v5;

      v4 = *(void **)(a1 + 472);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)updateLocationsCount
{
  -[GEORoute _readUpdateLocations]((uint64_t)self);
  return -[NSMutableArray count](self->_updateLocations, "count");
}

- (id)updateLocationAtIndex:(unint64_t)a3
{
  -[GEORoute _readUpdateLocations]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_updateLocations, "objectAtIndex:", a3);
}

+ (Class)updateLocationType
{
  return (Class)objc_opt_class();
}

- (void)_readOriginWaypointInfo
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 496));
    if ((*(_QWORD *)(a1 + 564) & 0x80000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORouteReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readOriginWaypointInfo_tags_4196);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 496));
  }
}

- (BOOL)hasOriginWaypointInfo
{
  -[GEORoute _readOriginWaypointInfo]((uint64_t)self);
  return self->_originWaypointInfo != 0;
}

- (GEOWaypointInfo)originWaypointInfo
{
  -[GEORoute _readOriginWaypointInfo]((uint64_t)self);
  return self->_originWaypointInfo;
}

- (void)setOriginWaypointInfo:(id)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 2;
  *(_QWORD *)&self->_flags |= 0x80000000000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_originWaypointInfo, a3);
}

- (void)_readDestinationWaypointInfo
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 496));
    if ((*(_QWORD *)(a1 + 564) & 0x100000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORouteReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readDestinationWaypointInfo_tags_4197);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 496));
  }
}

- (BOOL)hasDestinationWaypointInfo
{
  -[GEORoute _readDestinationWaypointInfo]((uint64_t)self);
  return self->_destinationWaypointInfo != 0;
}

- (GEOWaypointInfo)destinationWaypointInfo
{
  -[GEORoute _readDestinationWaypointInfo]((uint64_t)self);
  return self->_destinationWaypointInfo;
}

- (void)setDestinationWaypointInfo:(id)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 2;
  *(_QWORD *)&self->_flags |= 0x100000000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_destinationWaypointInfo, a3);
}

- (void)_readCellularCoverages
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 496));
    if ((*(_QWORD *)(a1 + 564) & 0x100000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORouteReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readCellularCoverages_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 496));
  }
}

- (unint64_t)cellularCoveragesCount
{
  -[GEORoute _readCellularCoverages]((uint64_t)self);
  return self->_cellularCoverages.count;
}

- (int)cellularCoverages
{
  -[GEORoute _readCellularCoverages]((uint64_t)self);
  return self->_cellularCoverages.list;
}

- (void)clearCellularCoverages
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x100000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((_BYTE *)&self->_flags + 8) |= 2u;
  PBRepeatedInt32Clear();
}

- (void)addCellularCoverage:(int)a3
{
  os_unfair_lock_s *p_readerLock;
  $581651A3999351CF43A2CF8B014366CB *p_flags;

  -[GEORoute _readCellularCoverages]((uint64_t)self);
  if (self)
    PBRepeatedInt32Add();
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  p_flags = &self->_flags;
  *(_QWORD *)p_flags |= 0x100000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((_BYTE *)p_flags + 8) |= 2u;
}

- (int)cellularCoverageAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_cellularCoverages;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEORoute _readCellularCoverages]((uint64_t)self);
  p_cellularCoverages = &self->_cellularCoverages;
  count = self->_cellularCoverages.count;
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
  return p_cellularCoverages->list[a3];
}

- (void)setCellularCoverages:(int *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x100000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((_BYTE *)&self->_flags + 8) |= 2u;
  PBRepeatedInt32Set();
}

- (id)cellularCoveragesAsString:(int)a3
{
  if (a3 < 3)
    return off_1E1C08550[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsCellularCoverages:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CELLULAR_COVERAGE_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CELLULAR_COVERAGE_AVAILABLE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("CELLULAR_COVERAGE_UNAVAILABLE")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_readCellularCoverageOffsets
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 496));
    if ((*(_QWORD *)(a1 + 564) & 0x80000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORouteReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readCellularCoverageOffsets_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 496));
  }
}

- (unint64_t)cellularCoverageOffsetsCount
{
  -[GEORoute _readCellularCoverageOffsets]((uint64_t)self);
  return self->_cellularCoverageOffsets.count;
}

- (unsigned)cellularCoverageOffsets
{
  -[GEORoute _readCellularCoverageOffsets]((uint64_t)self);
  return self->_cellularCoverageOffsets.list;
}

- (void)clearCellularCoverageOffsets
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x80000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((_BYTE *)&self->_flags + 8) |= 2u;
  PBRepeatedUInt32Clear();
}

- (void)addCellularCoverageOffset:(unsigned int)a3
{
  os_unfair_lock_s *p_readerLock;
  $581651A3999351CF43A2CF8B014366CB *p_flags;

  -[GEORoute _readCellularCoverageOffsets]((uint64_t)self);
  if (self)
    PBRepeatedUInt32Add();
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  p_flags = &self->_flags;
  *(_QWORD *)p_flags |= 0x80000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((_BYTE *)p_flags + 8) |= 2u;
}

- (unsigned)cellularCoverageOffsetAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_cellularCoverageOffsets;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEORoute _readCellularCoverageOffsets]((uint64_t)self);
  p_cellularCoverageOffsets = &self->_cellularCoverageOffsets;
  count = self->_cellularCoverageOffsets.count;
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
  return p_cellularCoverageOffsets->list[a3];
}

- (void)setCellularCoverageOffsets:(unsigned int *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x80000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((_BYTE *)&self->_flags + 8) |= 2u;
  PBRepeatedUInt32Set();
}

- (void)_readOriginListInstruction
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 496));
    if ((*(_QWORD *)(a1 + 564) & 0x40000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORouteReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readOriginListInstruction_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 496));
  }
}

- (BOOL)hasOriginListInstruction
{
  -[GEORoute _readOriginListInstruction]((uint64_t)self);
  return self->_originListInstruction != 0;
}

- (GEODrivingWalkingInstruction)originListInstruction
{
  -[GEORoute _readOriginListInstruction]((uint64_t)self);
  return self->_originListInstruction;
}

- (void)setOriginListInstruction:(id)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 2;
  *(_QWORD *)&self->_flags |= 0x40000000000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_originListInstruction, a3);
}

- (void)_readDestinationListInstruction
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 496));
    if ((*(_QWORD *)(a1 + 564) & 0x80000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORouteReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readDestinationListInstruction_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 496));
  }
}

- (BOOL)hasDestinationListInstruction
{
  -[GEORoute _readDestinationListInstruction]((uint64_t)self);
  return self->_destinationListInstruction != 0;
}

- (GEODrivingWalkingInstruction)destinationListInstruction
{
  -[GEORoute _readDestinationListInstruction]((uint64_t)self);
  return self->_destinationListInstruction;
}

- (void)setDestinationListInstruction:(id)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 2;
  *(_QWORD *)&self->_flags |= 0x80000000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_destinationListInstruction, a3);
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
  v8.super_class = (Class)GEORoute;
  -[GEORoute description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORoute dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORoute _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  uint64_t v5;
  __CFString *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  __CFString *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t k;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  const __CFString *v50;
  id v51;
  int v52;
  __CFString *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  id v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t m;
  void *v70;
  id v71;
  const __CFString *v72;
  void *v73;
  id v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t n;
  void *v79;
  id v80;
  const __CFString *v81;
  void *v82;
  id v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t ii;
  void *v88;
  id v89;
  const __CFString *v90;
  void *v91;
  id v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t jj;
  void *v97;
  id v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  const __CFString *v104;
  id v105;
  void *v106;
  void *v107;
  void *v108;
  const __CFString *v109;
  id v110;
  void *v111;
  void *v112;
  void *v113;
  const __CFString *v114;
  id v115;
  uint64_t v116;
  void *v117;
  const __CFString *v118;
  void *v119;
  id v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t kk;
  void *v125;
  id v126;
  const __CFString *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  const __CFString *v132;
  void *v133;
  const __CFString *v134;
  void *v135;
  const __CFString *v136;
  void *v137;
  const __CFString *v138;
  void *v139;
  const __CFString *v140;
  void *v141;
  void *v142;
  void *v143;
  id v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t mm;
  void *v149;
  id v150;
  const __CFString *v151;
  void *v152;
  void *v153;
  void *v154;
  const __CFString *v155;
  id v156;
  void *v157;
  id v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t nn;
  void *v163;
  id v164;
  const __CFString *v165;
  void *v166;
  id v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t i1;
  void *v172;
  id v173;
  const __CFString *v174;
  void *v175;
  id v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t i2;
  void *v181;
  id v182;
  const __CFString *v183;
  void *v184;
  const __CFString *v185;
  void *v186;
  const __CFString *v187;
  void *v188;
  void *v189;
  void *v190;
  const __CFString *v191;
  id v192;
  void *v193;
  id v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t i3;
  void *v199;
  id v200;
  const __CFString *v201;
  void *v202;
  void *v203;
  void *v204;
  const __CFString *v205;
  id v206;
  void *v207;
  id v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t i4;
  void *v213;
  id v214;
  const __CFString *v215;
  void *v216;
  id v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  uint64_t i5;
  void *v222;
  id v223;
  const __CFString *v224;
  void *v225;
  void *v226;
  void *v227;
  const __CFString *v228;
  id v229;
  void *v230;
  const __CFString *v231;
  void *v232;
  id v233;
  uint64_t v234;
  uint64_t v235;
  uint64_t v236;
  uint64_t i6;
  void *v238;
  id v239;
  const __CFString *v240;
  uint64_t v241;
  uint64_t v242;
  __CFString *v243;
  const __CFString *v244;
  uint64_t v245;
  __CFString *v246;
  const __CFString *v247;
  uint64_t v248;
  __CFString *v249;
  const __CFString *v250;
  void *v251;
  id v252;
  uint64_t v253;
  uint64_t v254;
  uint64_t v255;
  uint64_t i7;
  void *v257;
  id v258;
  const __CFString *v259;
  void *v260;
  id v261;
  uint64_t v262;
  uint64_t v263;
  uint64_t v264;
  uint64_t i8;
  void *v266;
  id v267;
  const __CFString *v268;
  void *v269;
  void *v270;
  void *v271;
  const __CFString *v272;
  id v273;
  void *v274;
  void *v275;
  void *v276;
  const __CFString *v277;
  id v278;
  void *v279;
  _QWORD *v280;
  unint64_t v281;
  uint64_t v282;
  __CFString *v283;
  const __CFString *v284;
  void *v285;
  const __CFString *v286;
  void *v287;
  void *v288;
  void *v289;
  const __CFString *v290;
  id v291;
  void *v292;
  void *v293;
  void *v294;
  const __CFString *v295;
  id v296;
  void *v297;
  void *v298;
  void *v299;
  void *v300;
  id v301;
  id v302;
  id v303;
  _QWORD v305[4];
  id v306;
  __int128 v307;
  __int128 v308;
  __int128 v309;
  __int128 v310;
  __int128 v311;
  __int128 v312;
  __int128 v313;
  __int128 v314;
  __int128 v315;
  __int128 v316;
  __int128 v317;
  __int128 v318;
  __int128 v319;
  __int128 v320;
  __int128 v321;
  __int128 v322;
  __int128 v323;
  __int128 v324;
  __int128 v325;
  __int128 v326;
  __int128 v327;
  __int128 v328;
  __int128 v329;
  __int128 v330;
  __int128 v331;
  __int128 v332;
  __int128 v333;
  __int128 v334;
  __int128 v335;
  __int128 v336;
  __int128 v337;
  __int128 v338;
  __int128 v339;
  __int128 v340;
  __int128 v341;
  __int128 v342;
  __int128 v343;
  __int128 v344;
  __int128 v345;
  __int128 v346;
  __int128 v347;
  __int128 v348;
  __int128 v349;
  __int128 v350;
  __int128 v351;
  __int128 v352;
  __int128 v353;
  __int128 v354;
  __int128 v355;
  __int128 v356;
  __int128 v357;
  __int128 v358;
  __int128 v359;
  __int128 v360;
  __int128 v361;
  __int128 v362;
  __int128 v363;
  __int128 v364;
  __int128 v365;
  __int128 v366;
  __int128 v367;
  __int128 v368;
  __int128 v369;
  __int128 v370;
  __int128 v371;
  __int128 v372;
  __int128 v373;
  __int128 v374;
  __int128 v375;
  __int128 v376;
  __int128 v377;
  __int128 v378;
  _BYTE v379[128];
  _BYTE v380[128];
  _BYTE v381[128];
  _BYTE v382[128];
  _BYTE v383[128];
  _BYTE v384[128];
  _BYTE v385[128];
  _BYTE v386[128];
  _BYTE v387[128];
  _BYTE v388[128];
  _BYTE v389[128];
  _BYTE v390[128];
  _BYTE v391[128];
  _BYTE v392[128];
  _BYTE v393[128];
  _BYTE v394[128];
  _BYTE v395[128];
  _BYTE v396[128];
  uint64_t v397;

  v397 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_QWORD *)(a1 + 564) & 0x1000) != 0)
  {
    v5 = *(int *)(a1 + 548);
    if (v5 >= 7)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 548));
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = off_1E1C08870[v5];
    }
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("transportType"));

  }
  if (objc_msgSend(*(id *)(a1 + 432), "count"))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 432), "count"));
    v375 = 0u;
    v376 = 0u;
    v377 = 0u;
    v378 = 0u;
    v8 = *(id *)(a1 + 432);
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v375, v396, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v376;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v376 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v375 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v13, "jsonRepresentation");
          else
            objc_msgSend(v13, "dictionaryRepresentation");
          v14 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v7, "addObject:", v14);
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v375, v396, 16);
      }
      while (v10);
    }

    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("step"));
  }
  objc_msgSend((id)a1, "name");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
    objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("name"));

  objc_msgSend((id)a1, "phoneticName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
    objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("phoneticName"));

  v17 = *(_QWORD *)(a1 + 564);
  if ((v17 & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 512));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v18, CFSTR("distance"));

    v17 = *(_QWORD *)(a1 + 564);
  }
  if ((v17 & 0x40) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 524));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v19, CFSTR("expectedTime"));

  }
  objc_msgSend((id)a1, "routeID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v20)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v20, "base64EncodedStringWithOptions:", 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v22, CFSTR("routeID"));

    }
    else
    {
      objc_msgSend(v4, "setObject:forKey:", v20, CFSTR("routeID"));
    }
  }

  if ((*(_QWORD *)(a1 + 564) & 0x200) != 0)
  {
    v23 = *(int *)(a1 + 536);
    if (v23 >= 6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 536));
      v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v24 = off_1E1C088A8[v23];
    }
    objc_msgSend(v4, "setObject:forKey:", v24, CFSTR("routeType"));

  }
  if (*(_QWORD *)(a1 + 480))
  {
    if (!a2)
    {
      objc_msgSend((id)a1, "zilchPoints");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v43, CFSTR("zilchPoints"));

      if (!*(_QWORD *)(a1 + 192))
        goto LABEL_59;
      goto LABEL_57;
    }
    v25 = (void *)MEMORY[0x1E0C99DE8];
    objc_msgSend((id)a1, "zilchPoints");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "arrayWithCapacity:", objc_msgSend(v26, "count"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    v373 = 0u;
    v374 = 0u;
    v371 = 0u;
    v372 = 0u;
    objc_msgSend((id)a1, "zilchPoints");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v371, v395, 16);
    if (v29)
    {
      v30 = v29;
      v31 = *(_QWORD *)v372;
      do
      {
        for (j = 0; j != v30; ++j)
        {
          if (*(_QWORD *)v372 != v31)
            objc_enumerationMutation(v28);
          objc_msgSend(*(id *)(*((_QWORD *)&v371 + 1) + 8 * j), "base64EncodedStringWithOptions:", 0);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "addObject:", v33);

        }
        v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v371, v395, 16);
      }
      while (v30);
    }

    objc_msgSend(v4, "setObject:forKey:", v27, CFSTR("zilchPoints"));
  }
  if (!*(_QWORD *)(a1 + 192))
    goto LABEL_59;
  if (a2)
  {
    v34 = (void *)MEMORY[0x1E0C99DE8];
    objc_msgSend((id)a1, "basicPoints");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "arrayWithCapacity:", objc_msgSend(v35, "count"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    v369 = 0u;
    v370 = 0u;
    v367 = 0u;
    v368 = 0u;
    objc_msgSend((id)a1, "basicPoints");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v367, v394, 16);
    if (v38)
    {
      v39 = v38;
      v40 = *(_QWORD *)v368;
      do
      {
        for (k = 0; k != v39; ++k)
        {
          if (*(_QWORD *)v368 != v40)
            objc_enumerationMutation(v37);
          objc_msgSend(*(id *)(*((_QWORD *)&v367 + 1) + 8 * k), "base64EncodedStringWithOptions:", 0);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "addObject:", v42);

        }
        v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v367, v394, 16);
      }
      while (v39);
    }

    goto LABEL_58;
  }
LABEL_57:
  objc_msgSend((id)a1, "basicPoints");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_58:
  objc_msgSend(v4, "setObject:forKey:", v36, CFSTR("basicPoints"));

LABEL_59:
  objc_msgSend((id)a1, "pathLeg");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = v44;
  if (v44)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v44, "base64EncodedStringWithOptions:", 0);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v46, CFSTR("pathLeg"));

    }
    else
    {
      objc_msgSend(v4, "setObject:forKey:", v44, CFSTR("path_leg"));
    }
  }

  objc_msgSend((id)a1, "pathMapMatcherInstructions");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = v47;
  if (v47)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v47, "jsonRepresentation");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = CFSTR("pathMapMatcherInstructions");
    }
    else
    {
      objc_msgSend(v47, "dictionaryRepresentation");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = CFSTR("path_map_matcher_instructions");
    }
    v51 = v49;

    objc_msgSend(v4, "setObject:forKey:", v51, v50);
  }

  if ((*(_QWORD *)(a1 + 564) & 0x10) != 0)
  {
    v52 = *(_DWORD *)(a1 + 516);
    if (v52)
    {
      if (v52 == 1)
      {
        v53 = CFSTR("LEFT_SIDE");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 516));
        v53 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v53 = CFSTR("RIGHT_SIDE");
    }
    objc_msgSend(v4, "setObject:forKey:", v53, CFSTR("drivingSide"));

  }
  objc_msgSend((id)a1, "departureRouteID");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = v54;
  if (v54)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v54, "base64EncodedStringWithOptions:", 0);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v56, CFSTR("departureRouteID"));

    }
    else
    {
      objc_msgSend(v4, "setObject:forKey:", v54, CFSTR("departureRouteID"));
    }
  }

  if ((*(_QWORD *)(a1 + 564) & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 508));
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v57, CFSTR("departureStepID"));

  }
  objc_msgSend((id)a1, "arrivalRouteID");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = v58;
  if (v58)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v58, "base64EncodedStringWithOptions:", 0);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v60, CFSTR("arrivalRouteID"));

    }
    else
    {
      objc_msgSend(v4, "setObject:forKey:", v58, CFSTR("arrivalRouteID"));
    }
  }

  if ((*(_QWORD *)(a1 + 564) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 500));
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v61, CFSTR("arrivalStepID"));

  }
  if (*(_QWORD *)(a1 + 152))
  {
    PBRepeatedUInt32NSArray();
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v62, CFSTR("trafficColor"));

  }
  if (*(_QWORD *)(a1 + 128))
  {
    PBRepeatedUInt32NSArray();
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v63, CFSTR("trafficColorOffset"));

  }
  if (objc_msgSend(*(id *)(a1 + 400), "count"))
  {
    v64 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 400), "count"));
    v363 = 0u;
    v364 = 0u;
    v365 = 0u;
    v366 = 0u;
    v65 = *(id *)(a1 + 400);
    v66 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v363, v393, 16);
    if (v66)
    {
      v67 = v66;
      v68 = *(_QWORD *)v364;
      do
      {
        for (m = 0; m != v67; ++m)
        {
          if (*(_QWORD *)v364 != v68)
            objc_enumerationMutation(v65);
          v70 = *(void **)(*((_QWORD *)&v363 + 1) + 8 * m);
          if ((a2 & 1) != 0)
            objc_msgSend(v70, "jsonRepresentation");
          else
            objc_msgSend(v70, "dictionaryRepresentation");
          v71 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v64, "addObject:", v71);
        }
        v67 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v363, v393, 16);
      }
      while (v67);
    }

    if (a2)
      v72 = CFSTR("routeLineStyleInfo");
    else
      v72 = CFSTR("route_line_style_info");
    objc_msgSend(v4, "setObject:forKey:", v64, v72);

  }
  if (objc_msgSend(*(id *)(a1 + 376), "count"))
  {
    v73 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 376), "count"));
    v359 = 0u;
    v360 = 0u;
    v361 = 0u;
    v362 = 0u;
    v74 = *(id *)(a1 + 376);
    v75 = objc_msgSend(v74, "countByEnumeratingWithState:objects:count:", &v359, v392, 16);
    if (v75)
    {
      v76 = v75;
      v77 = *(_QWORD *)v360;
      do
      {
        for (n = 0; n != v76; ++n)
        {
          if (*(_QWORD *)v360 != v77)
            objc_enumerationMutation(v74);
          v79 = *(void **)(*((_QWORD *)&v359 + 1) + 8 * n);
          if ((a2 & 1) != 0)
            objc_msgSend(v79, "jsonRepresentation");
          else
            objc_msgSend(v79, "dictionaryRepresentation");
          v80 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v73, "addObject:", v80);
        }
        v76 = objc_msgSend(v74, "countByEnumeratingWithState:objects:count:", &v359, v392, 16);
      }
      while (v76);
    }

    if (a2)
      v81 = CFSTR("routeCameraInputInfo");
    else
      v81 = CFSTR("route_camera_input_info");
    objc_msgSend(v4, "setObject:forKey:", v73, v81);

  }
  if (objc_msgSend(*(id *)(a1 + 440), "count"))
  {
    v82 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 440), "count"));
    v355 = 0u;
    v356 = 0u;
    v357 = 0u;
    v358 = 0u;
    v83 = *(id *)(a1 + 440);
    v84 = objc_msgSend(v83, "countByEnumeratingWithState:objects:count:", &v355, v391, 16);
    if (v84)
    {
      v85 = v84;
      v86 = *(_QWORD *)v356;
      do
      {
        for (ii = 0; ii != v85; ++ii)
        {
          if (*(_QWORD *)v356 != v86)
            objc_enumerationMutation(v83);
          v88 = *(void **)(*((_QWORD *)&v355 + 1) + 8 * ii);
          if ((a2 & 1) != 0)
            objc_msgSend(v88, "jsonRepresentation");
          else
            objc_msgSend(v88, "dictionaryRepresentation");
          v89 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v82, "addObject:", v89);
        }
        v85 = objc_msgSend(v83, "countByEnumeratingWithState:objects:count:", &v355, v391, 16);
      }
      while (v85);
    }

    if (a2)
      v90 = CFSTR("trafficColorInfo");
    else
      v90 = CFSTR("traffic_color_info");
    objc_msgSend(v4, "setObject:forKey:", v82, v90);

  }
  if (objc_msgSend(*(id *)(a1 + 368), "count"))
  {
    v91 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 368), "count"));
    v351 = 0u;
    v352 = 0u;
    v353 = 0u;
    v354 = 0u;
    v92 = *(id *)(a1 + 368);
    v93 = objc_msgSend(v92, "countByEnumeratingWithState:objects:count:", &v351, v390, 16);
    if (v93)
    {
      v94 = v93;
      v95 = *(_QWORD *)v352;
      do
      {
        for (jj = 0; jj != v94; ++jj)
        {
          if (*(_QWORD *)v352 != v95)
            objc_enumerationMutation(v92);
          v97 = *(void **)(*((_QWORD *)&v351 + 1) + 8 * jj);
          if ((a2 & 1) != 0)
            objc_msgSend(v97, "jsonRepresentation");
          else
            objc_msgSend(v97, "dictionaryRepresentation");
          v98 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v91, "addObject:", v98);
        }
        v94 = objc_msgSend(v92, "countByEnumeratingWithState:objects:count:", &v351, v390, 16);
      }
      while (v94);
    }

    objc_msgSend(v4, "setObject:forKey:", v91, CFSTR("routeName"));
  }
  if ((*(_QWORD *)(a1 + 564) & 0x80) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 528));
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v99, CFSTR("historicTravelTime"));

  }
  if (*(_QWORD *)(a1 + 168))
  {
    objc_msgSend((id)a1, "advisoryNotices");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v100, CFSTR("advisoryNotice"));

  }
  objc_msgSend((id)a1, "routeLabelDetailText");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  v102 = v101;
  if (v101)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v101, "jsonRepresentation");
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      v104 = CFSTR("routeLabelDetailText");
    }
    else
    {
      objc_msgSend(v101, "dictionaryRepresentation");
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      v104 = CFSTR("route_label_detail_text");
    }
    v105 = v103;

    objc_msgSend(v4, "setObject:forKey:", v105, v104);
  }

  objc_msgSend((id)a1, "infrastructureDescription");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  v107 = v106;
  if (v106)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v106, "jsonRepresentation");
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      v109 = CFSTR("infrastructureDescription");
    }
    else
    {
      objc_msgSend(v106, "dictionaryRepresentation");
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      v109 = CFSTR("infrastructure_description");
    }
    v110 = v108;

    objc_msgSend(v4, "setObject:forKey:", v110, v109);
  }

  objc_msgSend((id)a1, "clickableAdvisory");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  v112 = v111;
  if (v111)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v111, "jsonRepresentation");
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      v114 = CFSTR("clickableAdvisory");
    }
    else
    {
      objc_msgSend(v111, "dictionaryRepresentation");
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      v114 = CFSTR("clickable_advisory");
    }
    v115 = v113;

    objc_msgSend(v4, "setObject:forKey:", v115, v114);
  }

  v116 = *(_QWORD *)(a1 + 564);
  if ((v116 & 0x2000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 552));
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v132 = CFSTR("travelTimeAggressiveEstimate");
    else
      v132 = CFSTR("travel_time_aggressive_estimate");
    objc_msgSend(v4, "setObject:forKey:", v131, v132);

    v116 = *(_QWORD *)(a1 + 564);
    if ((v116 & 0x4000) == 0)
    {
LABEL_169:
      if ((v116 & 0x400) == 0)
        goto LABEL_170;
      goto LABEL_203;
    }
  }
  else if ((v116 & 0x4000) == 0)
  {
    goto LABEL_169;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 556));
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v134 = CFSTR("travelTimeConservativeEstimate");
  else
    v134 = CFSTR("travel_time_conservative_estimate");
  objc_msgSend(v4, "setObject:forKey:", v133, v134);

  v116 = *(_QWORD *)(a1 + 564);
  if ((v116 & 0x400) == 0)
  {
LABEL_170:
    if ((v116 & 0x10000) == 0)
      goto LABEL_171;
    goto LABEL_207;
  }
LABEL_203:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 540));
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v136 = CFSTR("staticTravelTime");
  else
    v136 = CFSTR("static_travel_time");
  objc_msgSend(v4, "setObject:forKey:", v135, v136);

  v116 = *(_QWORD *)(a1 + 564);
  if ((v116 & 0x10000) == 0)
  {
LABEL_171:
    if ((v116 & 0x8000) == 0)
      goto LABEL_172;
    goto LABEL_211;
  }
LABEL_207:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 561));
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v138 = CFSTR("avoidsTolls");
  else
    v138 = CFSTR("avoids_tolls");
  objc_msgSend(v4, "setObject:forKey:", v137, v138);

  v116 = *(_QWORD *)(a1 + 564);
  if ((v116 & 0x8000) == 0)
  {
LABEL_172:
    if ((v116 & 0x20000) == 0)
      goto LABEL_177;
    goto LABEL_173;
  }
LABEL_211:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 560));
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v140 = CFSTR("avoidsHighways");
  else
    v140 = CFSTR("avoids_highways");
  objc_msgSend(v4, "setObject:forKey:", v139, v140);

  if ((*(_QWORD *)(a1 + 564) & 0x20000) != 0)
  {
LABEL_173:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 562));
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v118 = CFSTR("avoidsTraffic");
    else
      v118 = CFSTR("avoids_traffic");
    objc_msgSend(v4, "setObject:forKey:", v117, v118);

  }
LABEL_177:
  if (objc_msgSend(*(id *)(a1 + 248), "count"))
  {
    v119 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 248), "count"));
    v347 = 0u;
    v348 = 0u;
    v349 = 0u;
    v350 = 0u;
    v120 = *(id *)(a1 + 248);
    v121 = objc_msgSend(v120, "countByEnumeratingWithState:objects:count:", &v347, v389, 16);
    if (v121)
    {
      v122 = v121;
      v123 = *(_QWORD *)v348;
      do
      {
        for (kk = 0; kk != v122; ++kk)
        {
          if (*(_QWORD *)v348 != v123)
            objc_enumerationMutation(v120);
          v125 = *(void **)(*((_QWORD *)&v347 + 1) + 8 * kk);
          if ((a2 & 1) != 0)
            objc_msgSend(v125, "jsonRepresentation");
          else
            objc_msgSend(v125, "dictionaryRepresentation");
          v126 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v119, "addObject:", v126);
        }
        v122 = objc_msgSend(v120, "countByEnumeratingWithState:objects:count:", &v347, v389, 16);
      }
      while (v122);
    }

    if (a2)
      v127 = CFSTR("enrouteNotice");
    else
      v127 = CFSTR("enroute_notice");
    objc_msgSend(v4, "setObject:forKey:", v119, v127);

  }
  objc_msgSend((id)a1, "unpackedLatLngVertices");
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  v129 = v128;
  if (v128)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v128, "base64EncodedStringWithOptions:", 0);
      v130 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v130, CFSTR("unpackedLatLngVertices"));

    }
    else
    {
      objc_msgSend(v4, "setObject:forKey:", v128, CFSTR("unpackedLatLngVertices"));
    }
  }

  if (*(_QWORD *)(a1 + 104))
  {
    PBRepeatedUInt32NSArray();
    v141 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v141, CFSTR("incidentIndices"));

  }
  if (*(_QWORD *)(a1 + 80))
  {
    PBRepeatedUInt32NSArray();
    v142 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v142, CFSTR("incidentEndOffsetsInRoute"));

  }
  if (objc_msgSend(*(id *)(a1 + 264), "count"))
  {
    v143 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 264), "count"));
    v343 = 0u;
    v344 = 0u;
    v345 = 0u;
    v346 = 0u;
    v144 = *(id *)(a1 + 264);
    v145 = objc_msgSend(v144, "countByEnumeratingWithState:objects:count:", &v343, v388, 16);
    if (v145)
    {
      v146 = v145;
      v147 = *(_QWORD *)v344;
      do
      {
        for (mm = 0; mm != v146; ++mm)
        {
          if (*(_QWORD *)v344 != v147)
            objc_enumerationMutation(v144);
          v149 = *(void **)(*((_QWORD *)&v343 + 1) + 8 * mm);
          if ((a2 & 1) != 0)
            objc_msgSend(v149, "jsonRepresentation");
          else
            objc_msgSend(v149, "dictionaryRepresentation");
          v150 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v143, "addObject:", v150);
        }
        v146 = objc_msgSend(v144, "countByEnumeratingWithState:objects:count:", &v343, v388, 16);
      }
      while (v146);
    }

    if (a2)
      v151 = CFSTR("incidentOnRouteInfo");
    else
      v151 = CFSTR("incident_on_route_info");
    objc_msgSend(v4, "setObject:forKey:", v143, v151);

  }
  objc_msgSend((id)a1, "routePlanningDescription");
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  v153 = v152;
  if (v152)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v152, "jsonRepresentation");
      v154 = (void *)objc_claimAutoreleasedReturnValue();
      v155 = CFSTR("routePlanningDescription");
    }
    else
    {
      objc_msgSend(v152, "dictionaryRepresentation");
      v154 = (void *)objc_claimAutoreleasedReturnValue();
      v155 = CFSTR("route_planning_description");
    }
    v156 = v154;

    objc_msgSend(v4, "setObject:forKey:", v156, v155);
  }

  if (objc_msgSend(*(id *)(a1 + 384), "count"))
  {
    v157 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 384), "count"));
    v339 = 0u;
    v340 = 0u;
    v341 = 0u;
    v342 = 0u;
    v158 = *(id *)(a1 + 384);
    v159 = objc_msgSend(v158, "countByEnumeratingWithState:objects:count:", &v339, v387, 16);
    if (v159)
    {
      v160 = v159;
      v161 = *(_QWORD *)v340;
      do
      {
        for (nn = 0; nn != v160; ++nn)
        {
          if (*(_QWORD *)v340 != v161)
            objc_enumerationMutation(v158);
          v163 = *(void **)(*((_QWORD *)&v339 + 1) + 8 * nn);
          if ((a2 & 1) != 0)
            objc_msgSend(v163, "jsonRepresentation");
          else
            objc_msgSend(v163, "dictionaryRepresentation");
          v164 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v157, "addObject:", v164);
        }
        v160 = objc_msgSend(v158, "countByEnumeratingWithState:objects:count:", &v339, v387, 16);
      }
      while (v160);
    }

    if (a2)
      v165 = CFSTR("routeDescription");
    else
      v165 = CFSTR("route_description");
    objc_msgSend(v4, "setObject:forKey:", v157, v165);

  }
  if (objc_msgSend(*(id *)(a1 + 416), "count"))
  {
    v166 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 416), "count"));
    v335 = 0u;
    v336 = 0u;
    v337 = 0u;
    v338 = 0u;
    v167 = *(id *)(a1 + 416);
    v168 = objc_msgSend(v167, "countByEnumeratingWithState:objects:count:", &v335, v386, 16);
    if (v168)
    {
      v169 = v168;
      v170 = *(_QWORD *)v336;
      do
      {
        for (i1 = 0; i1 != v169; ++i1)
        {
          if (*(_QWORD *)v336 != v170)
            objc_enumerationMutation(v167);
          v172 = *(void **)(*((_QWORD *)&v335 + 1) + 8 * i1);
          if ((a2 & 1) != 0)
            objc_msgSend(v172, "jsonRepresentation");
          else
            objc_msgSend(v172, "dictionaryRepresentation");
          v173 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v166, "addObject:", v173);
        }
        v169 = objc_msgSend(v167, "countByEnumeratingWithState:objects:count:", &v335, v386, 16);
      }
      while (v169);
    }

    if (a2)
      v174 = CFSTR("startingRouteInstruction");
    else
      v174 = CFSTR("starting_route_instruction");
    objc_msgSend(v4, "setObject:forKey:", v166, v174);

  }
  if (objc_msgSend(*(id *)(a1 + 240), "count"))
  {
    v175 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 240), "count"));
    v331 = 0u;
    v332 = 0u;
    v333 = 0u;
    v334 = 0u;
    v176 = *(id *)(a1 + 240);
    v177 = objc_msgSend(v176, "countByEnumeratingWithState:objects:count:", &v331, v385, 16);
    if (v177)
    {
      v178 = v177;
      v179 = *(_QWORD *)v332;
      do
      {
        for (i2 = 0; i2 != v178; ++i2)
        {
          if (*(_QWORD *)v332 != v179)
            objc_enumerationMutation(v176);
          v181 = *(void **)(*((_QWORD *)&v331 + 1) + 8 * i2);
          if ((a2 & 1) != 0)
            objc_msgSend(v181, "jsonRepresentation");
          else
            objc_msgSend(v181, "dictionaryRepresentation");
          v182 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v175, "addObject:", v182);
        }
        v178 = objc_msgSend(v176, "countByEnumeratingWithState:objects:count:", &v331, v385, 16);
      }
      while (v178);
    }

    if (a2)
      v183 = CFSTR("endingRouteInstruction");
    else
      v183 = CFSTR("ending_route_instruction");
    objc_msgSend(v4, "setObject:forKey:", v175, v183);

  }
  objc_msgSend((id)a1, "trafficDescription");
  v184 = (void *)objc_claimAutoreleasedReturnValue();
  if (v184)
  {
    if (a2)
      v185 = CFSTR("trafficDescription");
    else
      v185 = CFSTR("traffic_description");
    objc_msgSend(v4, "setObject:forKey:", v184, v185);
  }

  objc_msgSend((id)a1, "trafficDescriptionLong");
  v186 = (void *)objc_claimAutoreleasedReturnValue();
  if (v186)
  {
    if (a2)
      v187 = CFSTR("trafficDescriptionLong");
    else
      v187 = CFSTR("traffic_description_long");
    objc_msgSend(v4, "setObject:forKey:", v186, v187);
  }

  objc_msgSend((id)a1, "alertNonRecommendedRouteText");
  v188 = (void *)objc_claimAutoreleasedReturnValue();
  v189 = v188;
  if (v188)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v188, "jsonRepresentation");
      v190 = (void *)objc_claimAutoreleasedReturnValue();
      v191 = CFSTR("alertNonRecommendedRouteText");
    }
    else
    {
      objc_msgSend(v188, "dictionaryRepresentation");
      v190 = (void *)objc_claimAutoreleasedReturnValue();
      v191 = CFSTR("alert_non_recommended_route_text");
    }
    v192 = v190;

    objc_msgSend(v4, "setObject:forKey:", v192, v191);
  }

  if (objc_msgSend(*(id *)(a1 + 256), "count"))
  {
    v193 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 256), "count"));
    v327 = 0u;
    v328 = 0u;
    v329 = 0u;
    v330 = 0u;
    v194 = *(id *)(a1 + 256);
    v195 = objc_msgSend(v194, "countByEnumeratingWithState:objects:count:", &v327, v384, 16);
    if (v195)
    {
      v196 = v195;
      v197 = *(_QWORD *)v328;
      do
      {
        for (i3 = 0; i3 != v196; ++i3)
        {
          if (*(_QWORD *)v328 != v197)
            objc_enumerationMutation(v194);
          v199 = *(void **)(*((_QWORD *)&v327 + 1) + 8 * i3);
          if ((a2 & 1) != 0)
            objc_msgSend(v199, "jsonRepresentation");
          else
            objc_msgSend(v199, "dictionaryRepresentation");
          v200 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v193, "addObject:", v200);
        }
        v196 = objc_msgSend(v194, "countByEnumeratingWithState:objects:count:", &v327, v384, 16);
      }
      while (v196);
    }

    if (a2)
      v201 = CFSTR("guidanceEvent");
    else
      v201 = CFSTR("guidance_event");
    objc_msgSend(v4, "setObject:forKey:", v193, v201);

  }
  objc_msgSend((id)a1, "launchAndGoCardText");
  v202 = (void *)objc_claimAutoreleasedReturnValue();
  v203 = v202;
  if (v202)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v202, "jsonRepresentation");
      v204 = (void *)objc_claimAutoreleasedReturnValue();
      v205 = CFSTR("launchAndGoCardText");
    }
    else
    {
      objc_msgSend(v202, "dictionaryRepresentation");
      v204 = (void *)objc_claimAutoreleasedReturnValue();
      v205 = CFSTR("launch_and_go_card_text");
    }
    v206 = v204;

    objc_msgSend(v4, "setObject:forKey:", v206, v205);
  }

  if (objc_msgSend(*(id *)(a1 + 352), "count"))
  {
    v207 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 352), "count"));
    v323 = 0u;
    v324 = 0u;
    v325 = 0u;
    v326 = 0u;
    v208 = *(id *)(a1 + 352);
    v209 = objc_msgSend(v208, "countByEnumeratingWithState:objects:count:", &v323, v383, 16);
    if (v209)
    {
      v210 = v209;
      v211 = *(_QWORD *)v324;
      do
      {
        for (i4 = 0; i4 != v210; ++i4)
        {
          if (*(_QWORD *)v324 != v211)
            objc_enumerationMutation(v208);
          v213 = *(void **)(*((_QWORD *)&v323 + 1) + 8 * i4);
          if ((a2 & 1) != 0)
            objc_msgSend(v213, "jsonRepresentation");
          else
            objc_msgSend(v213, "dictionaryRepresentation");
          v214 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v207, "addObject:", v214);
        }
        v210 = objc_msgSend(v208, "countByEnumeratingWithState:objects:count:", &v323, v383, 16);
      }
      while (v210);
    }

    if (a2)
      v215 = CFSTR("roadComplexity");
    else
      v215 = CFSTR("road_complexity");
    objc_msgSend(v4, "setObject:forKey:", v207, v215);

  }
  if (objc_msgSend(*(id *)(a1 + 280), "count"))
  {
    v216 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 280), "count"));
    v319 = 0u;
    v320 = 0u;
    v321 = 0u;
    v322 = 0u;
    v217 = *(id *)(a1 + 280);
    v218 = objc_msgSend(v217, "countByEnumeratingWithState:objects:count:", &v319, v382, 16);
    if (v218)
    {
      v219 = v218;
      v220 = *(_QWORD *)v320;
      do
      {
        for (i5 = 0; i5 != v219; ++i5)
        {
          if (*(_QWORD *)v320 != v220)
            objc_enumerationMutation(v217);
          v222 = *(void **)(*((_QWORD *)&v319 + 1) + 8 * i5);
          if ((a2 & 1) != 0)
            objc_msgSend(v222, "jsonRepresentation");
          else
            objc_msgSend(v222, "dictionaryRepresentation");
          v223 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v216, "addObject:", v223);
        }
        v219 = objc_msgSend(v217, "countByEnumeratingWithState:objects:count:", &v319, v382, 16);
      }
      while (v219);
    }

    if (a2)
      v224 = CFSTR("laneWidth");
    else
      v224 = CFSTR("lane_width");
    objc_msgSend(v4, "setObject:forKey:", v216, v224);

  }
  objc_msgSend((id)a1, "elevationProfile");
  v225 = (void *)objc_claimAutoreleasedReturnValue();
  v226 = v225;
  if (v225)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v225, "jsonRepresentation");
      v227 = (void *)objc_claimAutoreleasedReturnValue();
      v228 = CFSTR("elevationProfile");
    }
    else
    {
      objc_msgSend(v225, "dictionaryRepresentation");
      v227 = (void *)objc_claimAutoreleasedReturnValue();
      v228 = CFSTR("elevation_profile");
    }
    v229 = v227;

    objc_msgSend(v4, "setObject:forKey:", v229, v228);
  }

  if ((*(_QWORD *)(a1 + 564) & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 504));
    v230 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v231 = CFSTR("arrivalParameterIndex");
    else
      v231 = CFSTR("arrival_parameter_index");
    objc_msgSend(v4, "setObject:forKey:", v230, v231);

  }
  if (objc_msgSend(*(id *)(a1 + 344), "count"))
  {
    v232 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 344), "count"));
    v315 = 0u;
    v316 = 0u;
    v317 = 0u;
    v318 = 0u;
    v233 = *(id *)(a1 + 344);
    v234 = objc_msgSend(v233, "countByEnumeratingWithState:objects:count:", &v315, v381, 16);
    if (v234)
    {
      v235 = v234;
      v236 = *(_QWORD *)v316;
      do
      {
        for (i6 = 0; i6 != v235; ++i6)
        {
          if (*(_QWORD *)v316 != v236)
            objc_enumerationMutation(v233);
          v238 = *(void **)(*((_QWORD *)&v315 + 1) + 8 * i6);
          if ((a2 & 1) != 0)
            objc_msgSend(v238, "jsonRepresentation");
          else
            objc_msgSend(v238, "dictionaryRepresentation");
          v239 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v232, "addObject:", v239);
        }
        v235 = objc_msgSend(v233, "countByEnumeratingWithState:objects:count:", &v315, v381, 16);
      }
      while (v235);
    }

    if (a2)
      v240 = CFSTR("restrictedZoneIds");
    else
      v240 = CFSTR("restricted_zone_ids");
    objc_msgSend(v4, "setObject:forKey:", v232, v240);

  }
  v241 = *(_QWORD *)(a1 + 564);
  if ((v241 & 0x100) == 0)
  {
    if ((v241 & 0x20) == 0)
      goto LABEL_378;
LABEL_387:
    v245 = *(int *)(a1 + 520);
    if (v245 >= 8)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 520));
      v246 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v246 = off_1E1C08510[v245];
    }
    if (a2)
      v247 = CFSTR("environmentalCongestionZoneImpact");
    else
      v247 = CFSTR("environmental_congestion_zone_impact");
    objc_msgSend(v4, "setObject:forKey:", v246, v247);

    if ((*(_QWORD *)(a1 + 564) & 0x800) == 0)
      goto LABEL_401;
    goto LABEL_394;
  }
  v242 = *(int *)(a1 + 532);
  if (v242 >= 8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 532));
    v243 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v243 = off_1E1C08510[v242];
  }
  if (a2)
    v244 = CFSTR("licensePlateRestrictionImpact");
  else
    v244 = CFSTR("license_plate_restriction_impact");
  objc_msgSend(v4, "setObject:forKey:", v243, v244);

  v241 = *(_QWORD *)(a1 + 564);
  if ((v241 & 0x20) != 0)
    goto LABEL_387;
LABEL_378:
  if ((v241 & 0x800) != 0)
  {
LABEL_394:
    v248 = *(int *)(a1 + 544);
    if (v248 >= 8)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 544));
      v249 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v249 = off_1E1C08510[v248];
    }
    if (a2)
      v250 = CFSTR("tollCongestionZoneImpact");
    else
      v250 = CFSTR("toll_congestion_zone_impact");
    objc_msgSend(v4, "setObject:forKey:", v249, v250);

  }
LABEL_401:
  if (objc_msgSend(*(id *)(a1 + 424), "count"))
  {
    v251 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 424), "count"));
    v311 = 0u;
    v312 = 0u;
    v313 = 0u;
    v314 = 0u;
    v252 = *(id *)(a1 + 424);
    v253 = objc_msgSend(v252, "countByEnumeratingWithState:objects:count:", &v311, v380, 16);
    if (v253)
    {
      v254 = v253;
      v255 = *(_QWORD *)v312;
      do
      {
        for (i7 = 0; i7 != v254; ++i7)
        {
          if (*(_QWORD *)v312 != v255)
            objc_enumerationMutation(v252);
          v257 = *(void **)(*((_QWORD *)&v311 + 1) + 8 * i7);
          if ((a2 & 1) != 0)
            objc_msgSend(v257, "jsonRepresentation");
          else
            objc_msgSend(v257, "dictionaryRepresentation");
          v258 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v251, "addObject:", v258);
        }
        v254 = objc_msgSend(v252, "countByEnumeratingWithState:objects:count:", &v311, v380, 16);
      }
      while (v254);
    }

    if (a2)
      v259 = CFSTR("stepGroup");
    else
      v259 = CFSTR("step_group");
    objc_msgSend(v4, "setObject:forKey:", v251, v259);

  }
  if (objc_msgSend(*(id *)(a1 + 472), "count"))
  {
    v260 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 472), "count"));
    v307 = 0u;
    v308 = 0u;
    v309 = 0u;
    v310 = 0u;
    v261 = *(id *)(a1 + 472);
    v262 = objc_msgSend(v261, "countByEnumeratingWithState:objects:count:", &v307, v379, 16);
    if (v262)
    {
      v263 = v262;
      v264 = *(_QWORD *)v308;
      do
      {
        for (i8 = 0; i8 != v263; ++i8)
        {
          if (*(_QWORD *)v308 != v264)
            objc_enumerationMutation(v261);
          v266 = *(void **)(*((_QWORD *)&v307 + 1) + 8 * i8);
          if ((a2 & 1) != 0)
            objc_msgSend(v266, "jsonRepresentation");
          else
            objc_msgSend(v266, "dictionaryRepresentation");
          v267 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v260, "addObject:", v267);
        }
        v263 = objc_msgSend(v261, "countByEnumeratingWithState:objects:count:", &v307, v379, 16);
      }
      while (v263);
    }

    if (a2)
      v268 = CFSTR("updateLocation");
    else
      v268 = CFSTR("update_location");
    objc_msgSend(v4, "setObject:forKey:", v260, v268);

  }
  objc_msgSend((id)a1, "originWaypointInfo");
  v269 = (void *)objc_claimAutoreleasedReturnValue();
  v270 = v269;
  if (v269)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v269, "jsonRepresentation");
      v271 = (void *)objc_claimAutoreleasedReturnValue();
      v272 = CFSTR("originWaypointInfo");
    }
    else
    {
      objc_msgSend(v269, "dictionaryRepresentation");
      v271 = (void *)objc_claimAutoreleasedReturnValue();
      v272 = CFSTR("origin_waypoint_info");
    }
    v273 = v271;

    objc_msgSend(v4, "setObject:forKey:", v273, v272);
  }

  objc_msgSend((id)a1, "destinationWaypointInfo");
  v274 = (void *)objc_claimAutoreleasedReturnValue();
  v275 = v274;
  if (v274)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v274, "jsonRepresentation");
      v276 = (void *)objc_claimAutoreleasedReturnValue();
      v277 = CFSTR("destinationWaypointInfo");
    }
    else
    {
      objc_msgSend(v274, "dictionaryRepresentation");
      v276 = (void *)objc_claimAutoreleasedReturnValue();
      v277 = CFSTR("destination_waypoint_info");
    }
    v278 = v276;

    objc_msgSend(v4, "setObject:forKey:", v278, v277);
  }

  if (*(_QWORD *)(a1 + 56))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
    v279 = (void *)objc_claimAutoreleasedReturnValue();
    v280 = (_QWORD *)(a1 + 48);
    if (*(_QWORD *)(a1 + 56))
    {
      v281 = 0;
      do
      {
        v282 = *(int *)(*v280 + 4 * v281);
        if (v282 >= 3)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v282);
          v283 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v283 = off_1E1C08550[v282];
        }
        objc_msgSend(v279, "addObject:", v283);

        ++v281;
        v280 = (_QWORD *)(a1 + 48);
      }
      while (v281 < *(_QWORD *)(a1 + 56));
    }
    if (a2)
      v284 = CFSTR("cellularCoverage");
    else
      v284 = CFSTR("cellular_coverage");
    objc_msgSend(v4, "setObject:forKey:", v279, v284);

  }
  if (*(_QWORD *)(a1 + 32))
  {
    PBRepeatedUInt32NSArray();
    v285 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v286 = CFSTR("cellularCoverageOffset");
    else
      v286 = CFSTR("cellular_coverage_offset");
    objc_msgSend(v4, "setObject:forKey:", v285, v286);

  }
  objc_msgSend((id)a1, "originListInstruction");
  v287 = (void *)objc_claimAutoreleasedReturnValue();
  v288 = v287;
  if (v287)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v287, "jsonRepresentation");
      v289 = (void *)objc_claimAutoreleasedReturnValue();
      v290 = CFSTR("originListInstruction");
    }
    else
    {
      objc_msgSend(v287, "dictionaryRepresentation");
      v289 = (void *)objc_claimAutoreleasedReturnValue();
      v290 = CFSTR("origin_list_instruction");
    }
    v291 = v289;

    objc_msgSend(v4, "setObject:forKey:", v291, v290);
  }

  objc_msgSend((id)a1, "destinationListInstruction");
  v292 = (void *)objc_claimAutoreleasedReturnValue();
  v293 = v292;
  if (v292)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v292, "jsonRepresentation");
      v294 = (void *)objc_claimAutoreleasedReturnValue();
      v295 = CFSTR("destinationListInstruction");
    }
    else
    {
      objc_msgSend(v292, "dictionaryRepresentation");
      v294 = (void *)objc_claimAutoreleasedReturnValue();
      v295 = CFSTR("destination_list_instruction");
    }
    v296 = v294;

    objc_msgSend(v4, "setObject:forKey:", v296, v295);
  }

  v297 = *(void **)(a1 + 16);
  if (v297)
  {
    objc_msgSend(v297, "dictionaryRepresentation");
    v298 = (void *)objc_claimAutoreleasedReturnValue();
    v299 = v298;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v298, "count"));
      v300 = (void *)objc_claimAutoreleasedReturnValue();
      v305[0] = MEMORY[0x1E0C809B0];
      v305[1] = 3221225472;
      v305[2] = __38__GEORoute__dictionaryRepresentation___block_invoke;
      v305[3] = &unk_1E1C00600;
      v301 = v300;
      v306 = v301;
      objc_msgSend(v299, "enumerateKeysAndObjectsUsingBlock:", v305);
      v302 = v301;

      v299 = v302;
    }
    objc_msgSend(v4, "setObject:forKey:", v299, CFSTR("Unknown Fields"));

  }
  v303 = v4;

  return v303;
}

- (id)jsonRepresentation
{
  return -[GEORoute _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __38__GEORoute__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEORoute)initWithDictionary:(id)a3
{
  return (GEORoute *)-[GEORoute _initWithDictionary:isJSON:]();
}

- (id)_initWithDictionary:isJSON:
{
  uint64_t v0;
  int v1;
  int v2;
  id v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  GEOStep *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
  uint64_t v37;
  void *v38;
  void *v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t k;
  uint64_t v45;
  void *v46;
  const __CFString *v47;
  void *v48;
  void *v49;
  const __CFString *v50;
  void *v51;
  GEOPathMapMatcherInstructions *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  id v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  id v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t m;
  void *v70;
  void *v71;
  id v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t n;
  void *v77;
  const __CFString *v78;
  void *v79;
  id v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t ii;
  uint64_t v85;
  GEORouteLineStyleInfo *v86;
  uint64_t v87;
  void *v88;
  const __CFString *v89;
  void *v90;
  id v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t jj;
  uint64_t v96;
  GEORouteLineStyleInfo *v97;
  uint64_t v98;
  void *v99;
  const __CFString *v100;
  void *v101;
  id v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t kk;
  uint64_t v107;
  GEOTrafficColorInfo *v108;
  uint64_t v109;
  void *v110;
  void *v111;
  id v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t mm;
  uint64_t v117;
  GEORouteName *v118;
  uint64_t v119;
  void *v120;
  void *v121;
  void *v122;
  id v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t nn;
  void *v128;
  void *v129;
  const __CFString *v130;
  void *v131;
  GEOFormattedString *v132;
  uint64_t v133;
  void *v134;
  const __CFString *v135;
  void *v136;
  GEOFormattedString *v137;
  uint64_t v138;
  void *v139;
  const __CFString *v140;
  void *v141;
  GEOClickableAdvisory *v142;
  uint64_t v143;
  void *v144;
  const __CFString *v145;
  void *v146;
  const __CFString *v147;
  void *v148;
  const __CFString *v149;
  void *v150;
  const __CFString *v151;
  void *v152;
  const __CFString *v153;
  void *v154;
  const __CFString *v155;
  void *v156;
  const __CFString *v157;
  void *v158;
  id v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t i1;
  uint64_t v164;
  GEOEnrouteNotice *v165;
  uint64_t v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  id v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t i2;
  void *v176;
  void *v177;
  id v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t i3;
  void *v183;
  const __CFString *v184;
  void *v185;
  id v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t i4;
  uint64_t v191;
  GEOIncidentOnRouteInfo *v192;
  uint64_t v193;
  void *v194;
  const __CFString *v195;
  void *v196;
  GEORouteInformation *v197;
  void *v198;
  const __CFString *v199;
  void *v200;
  id v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t i5;
  uint64_t v206;
  GEOFormattedString *v207;
  uint64_t v208;
  void *v209;
  const __CFString *v210;
  void *v211;
  id v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t i6;
  uint64_t v217;
  GEOFormattedString *v218;
  uint64_t v219;
  void *v220;
  const __CFString *v221;
  void *v222;
  id v223;
  uint64_t v224;
  uint64_t v225;
  uint64_t v226;
  uint64_t i7;
  uint64_t v228;
  GEOFormattedString *v229;
  uint64_t v230;
  void *v231;
  const __CFString *v232;
  void *v233;
  void *v234;
  const __CFString *v235;
  void *v236;
  void *v237;
  const __CFString *v238;
  void *v239;
  GEOAlertNonRecommendedRouteText *v240;
  uint64_t v241;
  void *v242;
  const __CFString *v243;
  void *v244;
  id v245;
  uint64_t v246;
  uint64_t v247;
  uint64_t v248;
  uint64_t i8;
  uint64_t v250;
  GEOGuidanceEvent *v251;
  uint64_t v252;
  void *v253;
  const __CFString *v254;
  void *v255;
  GEOLaunchAndGoCardText *v256;
  uint64_t v257;
  void *v258;
  const __CFString *v259;
  void *v260;
  id v261;
  uint64_t v262;
  uint64_t v263;
  uint64_t v264;
  uint64_t i9;
  uint64_t v266;
  GEORoadComplexity *v267;
  uint64_t v268;
  void *v269;
  const __CFString *v270;
  void *v271;
  id v272;
  uint64_t v273;
  uint64_t v274;
  uint64_t v275;
  uint64_t i10;
  uint64_t v277;
  GEOLaneWidth *v278;
  uint64_t v279;
  void *v280;
  const __CFString *v281;
  void *v282;
  GEOElevationProfile *v283;
  uint64_t v284;
  void *v285;
  const __CFString *v286;
  void *v287;
  const __CFString *v288;
  void *v289;
  id v290;
  uint64_t v291;
  uint64_t v292;
  uint64_t v293;
  uint64_t i11;
  uint64_t v295;
  GEORestrictedZoneId *v296;
  uint64_t v297;
  void *v298;
  const __CFString *v299;
  void *v300;
  id v301;
  uint64_t v302;
  const __CFString *v303;
  void *v304;
  id v305;
  uint64_t v306;
  const __CFString *v307;
  void *v308;
  id v309;
  uint64_t v310;
  const __CFString *v311;
  void *v312;
  id v313;
  uint64_t v314;
  uint64_t v315;
  uint64_t v316;
  uint64_t i12;
  uint64_t v318;
  GEOStepGroup *v319;
  uint64_t v320;
  void *v321;
  const __CFString *v322;
  void *v323;
  id v324;
  uint64_t v325;
  uint64_t v326;
  uint64_t v327;
  uint64_t i13;
  uint64_t v329;
  GEOUpdateLocation *v330;
  uint64_t v331;
  void *v332;
  const __CFString *v333;
  void *v334;
  GEOWaypointInfo *v335;
  uint64_t v336;
  void *v337;
  const __CFString *v338;
  void *v339;
  GEOWaypointInfo *v340;
  uint64_t v341;
  void *v342;
  const __CFString *v343;
  void *v344;
  id v345;
  uint64_t v346;
  uint64_t v347;
  uint64_t v348;
  uint64_t i14;
  void *v350;
  id v351;
  uint64_t v352;
  const __CFString *v353;
  void *v354;
  id v355;
  uint64_t v356;
  uint64_t v357;
  uint64_t v358;
  uint64_t i15;
  void *v360;
  const __CFString *v361;
  void *v362;
  GEODrivingWalkingInstruction *v363;
  void *v364;
  const __CFString *v365;
  void *v366;
  GEODrivingWalkingInstruction *v367;
  void *v368;
  void *v370;
  void *v371;
  void *v372;
  void *v373;
  void *v374;
  void *v375;
  void *v376;
  void *v377;
  void *v378;
  void *v379;
  void *v380;
  void *v381;
  void *v382;
  void *v383;
  void *v384;
  void *v385;
  id v386;
  __int128 v387;
  __int128 v388;
  __int128 v389;
  __int128 v390;
  __int128 v391;
  __int128 v392;
  __int128 v393;
  __int128 v394;
  __int128 v395;
  __int128 v396;
  __int128 v397;
  __int128 v398;
  __int128 v399;
  __int128 v400;
  __int128 v401;
  __int128 v402;
  __int128 v403;
  __int128 v404;
  __int128 v405;
  __int128 v406;
  __int128 v407;
  __int128 v408;
  __int128 v409;
  __int128 v410;
  __int128 v411;
  __int128 v412;
  __int128 v413;
  __int128 v414;
  __int128 v415;
  __int128 v416;
  __int128 v417;
  __int128 v418;
  __int128 v419;
  __int128 v420;
  __int128 v421;
  __int128 v422;
  __int128 v423;
  __int128 v424;
  __int128 v425;
  __int128 v426;
  __int128 v427;
  __int128 v428;
  __int128 v429;
  __int128 v430;
  __int128 v431;
  __int128 v432;
  __int128 v433;
  __int128 v434;
  __int128 v435;
  __int128 v436;
  __int128 v437;
  __int128 v438;
  __int128 v439;
  __int128 v440;
  __int128 v441;
  __int128 v442;
  __int128 v443;
  __int128 v444;
  __int128 v445;
  __int128 v446;
  __int128 v447;
  __int128 v448;
  __int128 v449;
  __int128 v450;
  __int128 v451;
  __int128 v452;
  __int128 v453;
  __int128 v454;
  __int128 v455;
  __int128 v456;
  __int128 v457;
  __int128 v458;
  __int128 v459;
  __int128 v460;
  __int128 v461;
  __int128 v462;
  __int128 v463;
  __int128 v464;
  __int128 v465;
  __int128 v466;
  __int128 v467;
  __int128 v468;
  __int128 v469;
  __int128 v470;
  __int128 v471;
  __int128 v472;
  __int128 v473;
  __int128 v474;
  __int128 v475;
  __int128 v476;
  __int128 v477;
  __int128 v478;
  __int128 v479;
  __int128 v480;
  __int128 v481;
  __int128 v482;
  __int128 v483;
  __int128 v484;
  __int128 v485;
  __int128 v486;
  _BYTE v487[128];
  _BYTE v488[128];
  _BYTE v489[128];
  _BYTE v490[128];
  _BYTE v491[128];
  _BYTE v492[128];
  _BYTE v493[128];
  _BYTE v494[128];
  _BYTE v495[128];
  _BYTE v496[128];
  _BYTE v497[128];
  _BYTE v498[128];
  _BYTE v499[128];
  _BYTE v500[128];
  _BYTE v501[128];
  _BYTE v502[128];
  _BYTE v503[128];
  _BYTE v504[128];
  _BYTE v505[128];
  _BYTE v506[128];
  _BYTE v507[128];
  _BYTE v508[128];
  _BYTE v509[128];
  _BYTE v510[128];
  _BYTE v511[128];
  uint64_t v512;

  v0 = MEMORY[0x1E0C80A78]();
  v2 = v1;
  v3 = (id)v0;
  v512 = *MEMORY[0x1E0C80C00];
  v5 = v4;
  if (!v3)
    goto LABEL_672;
  v6 = (id)objc_msgSend(v3, "init");

  if (!v6)
  {
    v3 = 0;
    goto LABEL_672;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("transportType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
    if ((objc_msgSend(v8, "isEqualToString:", CFSTR("AUTOMOBILE")) & 1) != 0)
    {
      v9 = 0;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("TRANSIT")) & 1) != 0)
    {
      v9 = 1;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("WALKING")) & 1) != 0)
    {
      v9 = 2;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("BICYCLE")) & 1) != 0)
    {
      v9 = 3;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("UNKNOWN_TRANSPORT_TYPE")) & 1) != 0)
    {
      v9 = 4;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("FERRY")) & 1) != 0)
    {
      v9 = 5;
    }
    else if (objc_msgSend(v8, "isEqualToString:", CFSTR("RIDESHARE")))
    {
      v9 = 6;
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
      goto LABEL_24;
    v9 = objc_msgSend(v7, "intValue");
  }
  objc_msgSend(v6, "setTransportType:", v9);
LABEL_24:

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("step"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v386 = v5;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v486 = 0u;
    v485 = 0u;
    v484 = 0u;
    v483 = 0u;
    v370 = v10;
    v11 = v10;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v483, v511, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v484;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v484 != v14)
            objc_enumerationMutation(v11);
          v16 = *(_QWORD *)(*((_QWORD *)&v483 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v17 = [GEOStep alloc];
            if ((v2 & 1) != 0)
              v18 = -[GEOStep initWithJSON:](v17, "initWithJSON:", v16);
            else
              v18 = -[GEOStep initWithDictionary:](v17, "initWithDictionary:", v16);
            v19 = (void *)v18;
            objc_msgSend(v6, "addStep:", v18, v370);

          }
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v483, v511, 16);
      }
      while (v13);
    }

    v10 = v370;
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("name"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v21 = (void *)objc_msgSend(v20, "copy");
    objc_msgSend(v6, "setName:", v21);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("phoneticName"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v23 = (void *)objc_msgSend(v22, "copy");
    objc_msgSend(v6, "setPhoneticName:", v23);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("distance"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setDistance:", objc_msgSend(v24, "unsignedIntValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("expectedTime"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setExpectedTime:", objc_msgSend(v25, "unsignedIntValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("routeID"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v26, 0);
    objc_msgSend(v6, "setRouteID:", v27);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("routeType"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v29 = v28;
    if ((objc_msgSend(v29, "isEqualToString:", CFSTR("MAIN_ROUTE")) & 1) != 0)
    {
      v30 = 0;
    }
    else if ((objc_msgSend(v29, "isEqualToString:", CFSTR("ALTERNATE_ROUTE")) & 1) != 0)
    {
      v30 = 1;
    }
    else if ((objc_msgSend(v29, "isEqualToString:", CFSTR("CONTINGENCY_ROUTE_ALTERNATE_ORIGIN")) & 1) != 0)
    {
      v30 = 2;
    }
    else if ((objc_msgSend(v29, "isEqualToString:", CFSTR("CONTINGENCY_ROUTE_MIDDLE_OF_ROUTE")) & 1) != 0)
    {
      v30 = 3;
    }
    else if ((objc_msgSend(v29, "isEqualToString:", CFSTR("MAIN_NON_RECOMMENDED_ROUTE")) & 1) != 0)
    {
      v30 = 4;
    }
    else if (objc_msgSend(v29, "isEqualToString:", CFSTR("ALTERNATE_NON_RECOMMENDED_ROUTE")))
    {
      v30 = 5;
    }
    else
    {
      v30 = 0;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_66;
    v30 = objc_msgSend(v28, "intValue");
  }
  objc_msgSend(v6, "setRouteType:", v30, v370);
LABEL_66:

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("zilchPoints"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v482 = 0u;
    v481 = 0u;
    v480 = 0u;
    v479 = 0u;
    v370 = v31;
    v32 = v31;
    v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v479, v510, 16);
    if (v33)
    {
      v34 = v33;
      v35 = *(_QWORD *)v480;
      do
      {
        for (j = 0; j != v34; ++j)
        {
          if (*(_QWORD *)v480 != v35)
            objc_enumerationMutation(v32);
          v37 = *(_QWORD *)(*((_QWORD *)&v479 + 1) + 8 * j);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v37, 0);
            objc_msgSend(v6, "addZilchPoints:", v38);

          }
        }
        v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v479, v510, 16);
      }
      while (v34);
    }

    v31 = v370;
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("basicPoints"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v478 = 0u;
    v477 = 0u;
    v476 = 0u;
    v475 = 0u;
    v370 = v39;
    v40 = v39;
    v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v475, v509, 16);
    if (v41)
    {
      v42 = v41;
      v43 = *(_QWORD *)v476;
      do
      {
        for (k = 0; k != v42; ++k)
        {
          if (*(_QWORD *)v476 != v43)
            objc_enumerationMutation(v40);
          v45 = *(_QWORD *)(*((_QWORD *)&v475 + 1) + 8 * k);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v46 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v45, 0);
            objc_msgSend(v6, "addBasicPoints:", v46);

          }
        }
        v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v475, v509, 16);
      }
      while (v42);
    }

    v39 = v370;
  }

  if (v2)
    v47 = CFSTR("pathLeg");
  else
    v47 = CFSTR("path_leg");
  objc_msgSend(v5, "objectForKeyedSubscript:", v47, v370);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v49 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v48, 0);
    objc_msgSend(v6, "setPathLeg:", v49);

  }
  if (v2)
    v50 = CFSTR("pathMapMatcherInstructions");
  else
    v50 = CFSTR("path_map_matcher_instructions");
  objc_msgSend(v5, "objectForKeyedSubscript:", v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v52 = [GEOPathMapMatcherInstructions alloc];
    if ((v2 & 1) != 0)
      v53 = -[GEOPathMapMatcherInstructions initWithJSON:](v52, "initWithJSON:", v51);
    else
      v53 = -[GEOPathMapMatcherInstructions initWithDictionary:](v52, "initWithDictionary:", v51);
    v54 = (void *)v53;
    objc_msgSend(v6, "setPathMapMatcherInstructions:", v53);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("drivingSide"));
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v56 = v55;
    if ((objc_msgSend(v56, "isEqualToString:", CFSTR("RIGHT_SIDE")) & 1) != 0)
      v57 = 0;
    else
      v57 = objc_msgSend(v56, "isEqualToString:", CFSTR("LEFT_SIDE"));

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_109;
    v57 = objc_msgSend(v55, "intValue");
  }
  objc_msgSend(v6, "setDrivingSide:", v57);
LABEL_109:

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("departureRouteID"));
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v59 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v58, 0);
    objc_msgSend(v6, "setDepartureRouteID:", v59);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("departureStepID"));
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setDepartureStepID:", objc_msgSend(v60, "unsignedIntValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("arrivalRouteID"));
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v62 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v61, 0);
    objc_msgSend(v6, "setArrivalRouteID:", v62);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("arrivalStepID"));
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setArrivalStepID:", objc_msgSend(v63, "unsignedIntValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("trafficColor"));
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v474 = 0u;
    v473 = 0u;
    v472 = 0u;
    v471 = 0u;
    v65 = v64;
    v66 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v471, v508, 16);
    if (v66)
    {
      v67 = v66;
      v68 = *(_QWORD *)v472;
      do
      {
        for (m = 0; m != v67; ++m)
        {
          if (*(_QWORD *)v472 != v68)
            objc_enumerationMutation(v65);
          v70 = *(void **)(*((_QWORD *)&v471 + 1) + 8 * m);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(v6, "addTrafficColor:", objc_msgSend(v70, "unsignedIntValue"));
        }
        v67 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v471, v508, 16);
      }
      while (v67);
    }

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("trafficColorOffset"));
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v470 = 0u;
    v469 = 0u;
    v468 = 0u;
    v467 = 0u;
    v72 = v71;
    v73 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v467, v507, 16);
    if (v73)
    {
      v74 = v73;
      v75 = *(_QWORD *)v468;
      do
      {
        for (n = 0; n != v74; ++n)
        {
          if (*(_QWORD *)v468 != v75)
            objc_enumerationMutation(v72);
          v77 = *(void **)(*((_QWORD *)&v467 + 1) + 8 * n);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(v6, "addTrafficColorOffset:", objc_msgSend(v77, "unsignedIntValue"));
        }
        v74 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v467, v507, 16);
      }
      while (v74);
    }

  }
  if (v2)
    v78 = CFSTR("routeLineStyleInfo");
  else
    v78 = CFSTR("route_line_style_info");
  objc_msgSend(v5, "objectForKeyedSubscript:", v78);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v466 = 0u;
    v465 = 0u;
    v464 = 0u;
    v463 = 0u;
    v371 = v79;
    v80 = v79;
    v81 = objc_msgSend(v80, "countByEnumeratingWithState:objects:count:", &v463, v506, 16);
    if (v81)
    {
      v82 = v81;
      v83 = *(_QWORD *)v464;
      do
      {
        for (ii = 0; ii != v82; ++ii)
        {
          if (*(_QWORD *)v464 != v83)
            objc_enumerationMutation(v80);
          v85 = *(_QWORD *)(*((_QWORD *)&v463 + 1) + 8 * ii);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v86 = [GEORouteLineStyleInfo alloc];
            if ((v2 & 1) != 0)
              v87 = -[GEORouteLineStyleInfo initWithJSON:](v86, "initWithJSON:", v85);
            else
              v87 = -[GEORouteLineStyleInfo initWithDictionary:](v86, "initWithDictionary:", v85);
            v88 = (void *)v87;
            objc_msgSend(v6, "addRouteLineStyleInfo:", v87, v371);

          }
        }
        v82 = objc_msgSend(v80, "countByEnumeratingWithState:objects:count:", &v463, v506, 16);
      }
      while (v82);
    }

    v79 = v371;
  }

  if (v2)
    v89 = CFSTR("routeCameraInputInfo");
  else
    v89 = CFSTR("route_camera_input_info");
  objc_msgSend(v5, "objectForKeyedSubscript:", v89, v371);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v462 = 0u;
    v461 = 0u;
    v460 = 0u;
    v459 = 0u;
    v372 = v90;
    v91 = v90;
    v92 = objc_msgSend(v91, "countByEnumeratingWithState:objects:count:", &v459, v505, 16);
    if (v92)
    {
      v93 = v92;
      v94 = *(_QWORD *)v460;
      do
      {
        for (jj = 0; jj != v93; ++jj)
        {
          if (*(_QWORD *)v460 != v94)
            objc_enumerationMutation(v91);
          v96 = *(_QWORD *)(*((_QWORD *)&v459 + 1) + 8 * jj);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v97 = [GEORouteLineStyleInfo alloc];
            if ((v2 & 1) != 0)
              v98 = -[GEORouteLineStyleInfo initWithJSON:](v97, "initWithJSON:", v96);
            else
              v98 = -[GEORouteLineStyleInfo initWithDictionary:](v97, "initWithDictionary:", v96);
            v99 = (void *)v98;
            objc_msgSend(v6, "addRouteCameraInputInfo:", v98, v372);

          }
        }
        v93 = objc_msgSend(v91, "countByEnumeratingWithState:objects:count:", &v459, v505, 16);
      }
      while (v93);
    }

    v90 = v372;
  }

  if (v2)
    v100 = CFSTR("trafficColorInfo");
  else
    v100 = CFSTR("traffic_color_info");
  objc_msgSend(v5, "objectForKeyedSubscript:", v100, v372);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v458 = 0u;
    v457 = 0u;
    v456 = 0u;
    v455 = 0u;
    v373 = v101;
    v102 = v101;
    v103 = objc_msgSend(v102, "countByEnumeratingWithState:objects:count:", &v455, v504, 16);
    if (v103)
    {
      v104 = v103;
      v105 = *(_QWORD *)v456;
      do
      {
        for (kk = 0; kk != v104; ++kk)
        {
          if (*(_QWORD *)v456 != v105)
            objc_enumerationMutation(v102);
          v107 = *(_QWORD *)(*((_QWORD *)&v455 + 1) + 8 * kk);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v108 = [GEOTrafficColorInfo alloc];
            if ((v2 & 1) != 0)
              v109 = -[GEOTrafficColorInfo initWithJSON:](v108, "initWithJSON:", v107);
            else
              v109 = -[GEOTrafficColorInfo initWithDictionary:](v108, "initWithDictionary:", v107);
            v110 = (void *)v109;
            objc_msgSend(v6, "addTrafficColorInfo:", v109, v373);

          }
        }
        v104 = objc_msgSend(v102, "countByEnumeratingWithState:objects:count:", &v455, v504, 16);
      }
      while (v104);
    }

    v101 = v373;
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("routeName"));
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v454 = 0u;
    v453 = 0u;
    v452 = 0u;
    v451 = 0u;
    v373 = v111;
    v112 = v111;
    v113 = objc_msgSend(v112, "countByEnumeratingWithState:objects:count:", &v451, v503, 16);
    if (v113)
    {
      v114 = v113;
      v115 = *(_QWORD *)v452;
      do
      {
        for (mm = 0; mm != v114; ++mm)
        {
          if (*(_QWORD *)v452 != v115)
            objc_enumerationMutation(v112);
          v117 = *(_QWORD *)(*((_QWORD *)&v451 + 1) + 8 * mm);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v118 = [GEORouteName alloc];
            if ((v2 & 1) != 0)
              v119 = -[GEORouteName initWithJSON:](v118, "initWithJSON:", v117);
            else
              v119 = -[GEORouteName initWithDictionary:](v118, "initWithDictionary:", v117);
            v120 = (void *)v119;
            objc_msgSend(v6, "addRouteName:", v119, v373);

          }
        }
        v114 = objc_msgSend(v112, "countByEnumeratingWithState:objects:count:", &v451, v503, 16);
      }
      while (v114);
    }

    v111 = v373;
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("historicTravelTime"));
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setHistoricTravelTime:", objc_msgSend(v121, "unsignedIntValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("advisoryNotice"));
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v449 = 0u;
    v450 = 0u;
    v447 = 0u;
    v448 = 0u;
    v123 = v122;
    v124 = objc_msgSend(v123, "countByEnumeratingWithState:objects:count:", &v447, v502, 16);
    if (v124)
    {
      v125 = v124;
      v126 = *(_QWORD *)v448;
      do
      {
        for (nn = 0; nn != v125; ++nn)
        {
          if (*(_QWORD *)v448 != v126)
            objc_enumerationMutation(v123);
          v128 = *(void **)(*((_QWORD *)&v447 + 1) + 8 * nn);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v129 = (void *)objc_msgSend(v128, "copy");
            objc_msgSend(v6, "addAdvisoryNotice:", v129);

          }
        }
        v125 = objc_msgSend(v123, "countByEnumeratingWithState:objects:count:", &v447, v502, 16);
      }
      while (v125);
    }

  }
  if (v2)
    v130 = CFSTR("routeLabelDetailText");
  else
    v130 = CFSTR("route_label_detail_text");
  objc_msgSend(v5, "objectForKeyedSubscript:", v130, v373);
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v132 = [GEOFormattedString alloc];
    if ((v2 & 1) != 0)
      v133 = -[GEOFormattedString initWithJSON:](v132, "initWithJSON:", v131);
    else
      v133 = -[GEOFormattedString initWithDictionary:](v132, "initWithDictionary:", v131);
    v134 = (void *)v133;
    objc_msgSend(v6, "setRouteLabelDetailText:", v133);

  }
  if (v2)
    v135 = CFSTR("infrastructureDescription");
  else
    v135 = CFSTR("infrastructure_description");
  objc_msgSend(v5, "objectForKeyedSubscript:", v135);
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v137 = [GEOFormattedString alloc];
    if ((v2 & 1) != 0)
      v138 = -[GEOFormattedString initWithJSON:](v137, "initWithJSON:", v136);
    else
      v138 = -[GEOFormattedString initWithDictionary:](v137, "initWithDictionary:", v136);
    v139 = (void *)v138;
    objc_msgSend(v6, "setInfrastructureDescription:", v138);

  }
  if (v2)
    v140 = CFSTR("clickableAdvisory");
  else
    v140 = CFSTR("clickable_advisory");
  objc_msgSend(v5, "objectForKeyedSubscript:", v140);
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v142 = [GEOClickableAdvisory alloc];
    if ((v2 & 1) != 0)
      v143 = -[GEOClickableAdvisory initWithJSON:](v142, "initWithJSON:", v141);
    else
      v143 = -[GEOClickableAdvisory initWithDictionary:](v142, "initWithDictionary:", v141);
    v144 = (void *)v143;
    objc_msgSend(v6, "setClickableAdvisory:", v143);

  }
  if (v2)
    v145 = CFSTR("travelTimeAggressiveEstimate");
  else
    v145 = CFSTR("travel_time_aggressive_estimate");
  objc_msgSend(v5, "objectForKeyedSubscript:", v145);
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setTravelTimeAggressiveEstimate:", objc_msgSend(v146, "unsignedIntValue"));

  if (v2)
    v147 = CFSTR("travelTimeConservativeEstimate");
  else
    v147 = CFSTR("travel_time_conservative_estimate");
  objc_msgSend(v5, "objectForKeyedSubscript:", v147);
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setTravelTimeConservativeEstimate:", objc_msgSend(v148, "unsignedIntValue"));

  if (v2)
    v149 = CFSTR("staticTravelTime");
  else
    v149 = CFSTR("static_travel_time");
  objc_msgSend(v5, "objectForKeyedSubscript:", v149);
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setStaticTravelTime:", objc_msgSend(v150, "unsignedIntValue"));

  if (v2)
    v151 = CFSTR("avoidsTolls");
  else
    v151 = CFSTR("avoids_tolls");
  objc_msgSend(v5, "objectForKeyedSubscript:", v151);
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setAvoidsTolls:", objc_msgSend(v152, "BOOLValue"));

  if (v2)
    v153 = CFSTR("avoidsHighways");
  else
    v153 = CFSTR("avoids_highways");
  objc_msgSend(v5, "objectForKeyedSubscript:", v153);
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setAvoidsHighways:", objc_msgSend(v154, "BOOLValue"));

  if (v2)
    v155 = CFSTR("avoidsTraffic");
  else
    v155 = CFSTR("avoids_traffic");
  objc_msgSend(v5, "objectForKeyedSubscript:", v155);
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setAvoidsTraffic:", objc_msgSend(v156, "BOOLValue"));

  if (v2)
    v157 = CFSTR("enrouteNotice");
  else
    v157 = CFSTR("enroute_notice");
  objc_msgSend(v5, "objectForKeyedSubscript:", v157);
  v158 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v445 = 0u;
    v446 = 0u;
    v443 = 0u;
    v444 = 0u;
    v374 = v158;
    v159 = v158;
    v160 = objc_msgSend(v159, "countByEnumeratingWithState:objects:count:", &v443, v501, 16);
    if (v160)
    {
      v161 = v160;
      v162 = *(_QWORD *)v444;
      do
      {
        for (i1 = 0; i1 != v161; ++i1)
        {
          if (*(_QWORD *)v444 != v162)
            objc_enumerationMutation(v159);
          v164 = *(_QWORD *)(*((_QWORD *)&v443 + 1) + 8 * i1);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v165 = [GEOEnrouteNotice alloc];
            if ((v2 & 1) != 0)
              v166 = -[GEOEnrouteNotice initWithJSON:](v165, "initWithJSON:", v164);
            else
              v166 = -[GEOEnrouteNotice initWithDictionary:](v165, "initWithDictionary:", v164);
            v167 = (void *)v166;
            objc_msgSend(v6, "addEnrouteNotice:", v166, v374);

          }
        }
        v161 = objc_msgSend(v159, "countByEnumeratingWithState:objects:count:", &v443, v501, 16);
      }
      while (v161);
    }

    v158 = v374;
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("unpackedLatLngVertices"));
  v168 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v169 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v168, 0);
    objc_msgSend(v6, "setUnpackedLatLngVertices:", v169);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("incidentIndices"));
  v170 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v441 = 0u;
    v442 = 0u;
    v439 = 0u;
    v440 = 0u;
    v171 = v170;
    v172 = objc_msgSend(v171, "countByEnumeratingWithState:objects:count:", &v439, v500, 16);
    if (v172)
    {
      v173 = v172;
      v174 = *(_QWORD *)v440;
      do
      {
        for (i2 = 0; i2 != v173; ++i2)
        {
          if (*(_QWORD *)v440 != v174)
            objc_enumerationMutation(v171);
          v176 = *(void **)(*((_QWORD *)&v439 + 1) + 8 * i2);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(v6, "addIncidentIndices:", objc_msgSend(v176, "unsignedIntValue"));
        }
        v173 = objc_msgSend(v171, "countByEnumeratingWithState:objects:count:", &v439, v500, 16);
      }
      while (v173);
    }

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("incidentEndOffsetsInRoute"));
  v177 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v437 = 0u;
    v438 = 0u;
    v435 = 0u;
    v436 = 0u;
    v178 = v177;
    v179 = objc_msgSend(v178, "countByEnumeratingWithState:objects:count:", &v435, v499, 16);
    if (v179)
    {
      v180 = v179;
      v181 = *(_QWORD *)v436;
      do
      {
        for (i3 = 0; i3 != v180; ++i3)
        {
          if (*(_QWORD *)v436 != v181)
            objc_enumerationMutation(v178);
          v183 = *(void **)(*((_QWORD *)&v435 + 1) + 8 * i3);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(v6, "addIncidentEndOffsetsInRoute:", objc_msgSend(v183, "unsignedIntValue"));
        }
        v180 = objc_msgSend(v178, "countByEnumeratingWithState:objects:count:", &v435, v499, 16);
      }
      while (v180);
    }

  }
  if (v2)
    v184 = CFSTR("incidentOnRouteInfo");
  else
    v184 = CFSTR("incident_on_route_info");
  objc_msgSend(v5, "objectForKeyedSubscript:", v184, v374);
  v185 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v433 = 0u;
    v434 = 0u;
    v431 = 0u;
    v432 = 0u;
    v375 = v185;
    v186 = v185;
    v187 = objc_msgSend(v186, "countByEnumeratingWithState:objects:count:", &v431, v498, 16);
    if (v187)
    {
      v188 = v187;
      v189 = *(_QWORD *)v432;
      do
      {
        for (i4 = 0; i4 != v188; ++i4)
        {
          if (*(_QWORD *)v432 != v189)
            objc_enumerationMutation(v186);
          v191 = *(_QWORD *)(*((_QWORD *)&v431 + 1) + 8 * i4);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v192 = [GEOIncidentOnRouteInfo alloc];
            if ((v2 & 1) != 0)
              v193 = -[GEOIncidentOnRouteInfo initWithJSON:](v192, "initWithJSON:", v191);
            else
              v193 = -[GEOIncidentOnRouteInfo initWithDictionary:](v192, "initWithDictionary:", v191);
            v194 = (void *)v193;
            objc_msgSend(v6, "addIncidentOnRouteInfo:", v193, v375);

          }
        }
        v188 = objc_msgSend(v186, "countByEnumeratingWithState:objects:count:", &v431, v498, 16);
      }
      while (v188);
    }

    v185 = v375;
  }

  if (v2)
    v195 = CFSTR("routePlanningDescription");
  else
    v195 = CFSTR("route_planning_description");
  objc_msgSend(v5, "objectForKeyedSubscript:", v195, v375);
  v196 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v197 = [GEORouteInformation alloc];
    if (v197)
      v198 = (void *)-[GEORouteInformation _initWithDictionary:isJSON:](v197, v196, v2);
    else
      v198 = 0;
    objc_msgSend(v6, "setRoutePlanningDescription:", v198);

  }
  if (v2)
    v199 = CFSTR("routeDescription");
  else
    v199 = CFSTR("route_description");
  objc_msgSend(v5, "objectForKeyedSubscript:", v199);
  v200 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v429 = 0u;
    v430 = 0u;
    v427 = 0u;
    v428 = 0u;
    v376 = v200;
    v201 = v200;
    v202 = objc_msgSend(v201, "countByEnumeratingWithState:objects:count:", &v427, v497, 16);
    if (v202)
    {
      v203 = v202;
      v204 = *(_QWORD *)v428;
      do
      {
        for (i5 = 0; i5 != v203; ++i5)
        {
          if (*(_QWORD *)v428 != v204)
            objc_enumerationMutation(v201);
          v206 = *(_QWORD *)(*((_QWORD *)&v427 + 1) + 8 * i5);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v207 = [GEOFormattedString alloc];
            if ((v2 & 1) != 0)
              v208 = -[GEOFormattedString initWithJSON:](v207, "initWithJSON:", v206);
            else
              v208 = -[GEOFormattedString initWithDictionary:](v207, "initWithDictionary:", v206);
            v209 = (void *)v208;
            objc_msgSend(v6, "addRouteDescription:", v208, v376);

          }
        }
        v203 = objc_msgSend(v201, "countByEnumeratingWithState:objects:count:", &v427, v497, 16);
      }
      while (v203);
    }

    v200 = v376;
  }

  if (v2)
    v210 = CFSTR("startingRouteInstruction");
  else
    v210 = CFSTR("starting_route_instruction");
  objc_msgSend(v5, "objectForKeyedSubscript:", v210, v376);
  v211 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v425 = 0u;
    v426 = 0u;
    v423 = 0u;
    v424 = 0u;
    v377 = v211;
    v212 = v211;
    v213 = objc_msgSend(v212, "countByEnumeratingWithState:objects:count:", &v423, v496, 16);
    if (v213)
    {
      v214 = v213;
      v215 = *(_QWORD *)v424;
      do
      {
        for (i6 = 0; i6 != v214; ++i6)
        {
          if (*(_QWORD *)v424 != v215)
            objc_enumerationMutation(v212);
          v217 = *(_QWORD *)(*((_QWORD *)&v423 + 1) + 8 * i6);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v218 = [GEOFormattedString alloc];
            if ((v2 & 1) != 0)
              v219 = -[GEOFormattedString initWithJSON:](v218, "initWithJSON:", v217);
            else
              v219 = -[GEOFormattedString initWithDictionary:](v218, "initWithDictionary:", v217);
            v220 = (void *)v219;
            objc_msgSend(v6, "addStartingRouteInstruction:", v219, v377);

          }
        }
        v214 = objc_msgSend(v212, "countByEnumeratingWithState:objects:count:", &v423, v496, 16);
      }
      while (v214);
    }

    v211 = v377;
  }

  if (v2)
    v221 = CFSTR("endingRouteInstruction");
  else
    v221 = CFSTR("ending_route_instruction");
  objc_msgSend(v5, "objectForKeyedSubscript:", v221, v377);
  v222 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v421 = 0u;
    v422 = 0u;
    v419 = 0u;
    v420 = 0u;
    v378 = v222;
    v223 = v222;
    v224 = objc_msgSend(v223, "countByEnumeratingWithState:objects:count:", &v419, v495, 16);
    if (v224)
    {
      v225 = v224;
      v226 = *(_QWORD *)v420;
      do
      {
        for (i7 = 0; i7 != v225; ++i7)
        {
          if (*(_QWORD *)v420 != v226)
            objc_enumerationMutation(v223);
          v228 = *(_QWORD *)(*((_QWORD *)&v419 + 1) + 8 * i7);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v229 = [GEOFormattedString alloc];
            if ((v2 & 1) != 0)
              v230 = -[GEOFormattedString initWithJSON:](v229, "initWithJSON:", v228);
            else
              v230 = -[GEOFormattedString initWithDictionary:](v229, "initWithDictionary:", v228);
            v231 = (void *)v230;
            objc_msgSend(v6, "addEndingRouteInstruction:", v230, v378);

          }
        }
        v225 = objc_msgSend(v223, "countByEnumeratingWithState:objects:count:", &v419, v495, 16);
      }
      while (v225);
    }

    v222 = v378;
  }

  if (v2)
    v232 = CFSTR("trafficDescription");
  else
    v232 = CFSTR("traffic_description");
  objc_msgSend(v5, "objectForKeyedSubscript:", v232, v378);
  v233 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v234 = (void *)objc_msgSend(v233, "copy");
    objc_msgSend(v6, "setTrafficDescription:", v234);

  }
  if (v2)
    v235 = CFSTR("trafficDescriptionLong");
  else
    v235 = CFSTR("traffic_description_long");
  objc_msgSend(v5, "objectForKeyedSubscript:", v235);
  v236 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v237 = (void *)objc_msgSend(v236, "copy");
    objc_msgSend(v6, "setTrafficDescriptionLong:", v237);

  }
  if (v2)
    v238 = CFSTR("alertNonRecommendedRouteText");
  else
    v238 = CFSTR("alert_non_recommended_route_text");
  objc_msgSend(v5, "objectForKeyedSubscript:", v238);
  v239 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v240 = [GEOAlertNonRecommendedRouteText alloc];
    if ((v2 & 1) != 0)
      v241 = -[GEOAlertNonRecommendedRouteText initWithJSON:](v240, "initWithJSON:", v239);
    else
      v241 = -[GEOAlertNonRecommendedRouteText initWithDictionary:](v240, "initWithDictionary:", v239);
    v242 = (void *)v241;
    objc_msgSend(v6, "setAlertNonRecommendedRouteText:", v241);

  }
  if (v2)
    v243 = CFSTR("guidanceEvent");
  else
    v243 = CFSTR("guidance_event");
  objc_msgSend(v5, "objectForKeyedSubscript:", v243);
  v244 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v417 = 0u;
    v418 = 0u;
    v415 = 0u;
    v416 = 0u;
    v379 = v244;
    v245 = v244;
    v246 = objc_msgSend(v245, "countByEnumeratingWithState:objects:count:", &v415, v494, 16);
    if (v246)
    {
      v247 = v246;
      v248 = *(_QWORD *)v416;
      do
      {
        for (i8 = 0; i8 != v247; ++i8)
        {
          if (*(_QWORD *)v416 != v248)
            objc_enumerationMutation(v245);
          v250 = *(_QWORD *)(*((_QWORD *)&v415 + 1) + 8 * i8);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v251 = [GEOGuidanceEvent alloc];
            if ((v2 & 1) != 0)
              v252 = -[GEOGuidanceEvent initWithJSON:](v251, "initWithJSON:", v250);
            else
              v252 = -[GEOGuidanceEvent initWithDictionary:](v251, "initWithDictionary:", v250);
            v253 = (void *)v252;
            objc_msgSend(v6, "addGuidanceEvent:", v252, v379);

          }
        }
        v247 = objc_msgSend(v245, "countByEnumeratingWithState:objects:count:", &v415, v494, 16);
      }
      while (v247);
    }

    v244 = v379;
  }

  if (v2)
    v254 = CFSTR("launchAndGoCardText");
  else
    v254 = CFSTR("launch_and_go_card_text");
  objc_msgSend(v5, "objectForKeyedSubscript:", v254, v379);
  v255 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v256 = [GEOLaunchAndGoCardText alloc];
    if ((v2 & 1) != 0)
      v257 = -[GEOLaunchAndGoCardText initWithJSON:](v256, "initWithJSON:", v255);
    else
      v257 = -[GEOLaunchAndGoCardText initWithDictionary:](v256, "initWithDictionary:", v255);
    v258 = (void *)v257;
    objc_msgSend(v6, "setLaunchAndGoCardText:", v257);

  }
  if (v2)
    v259 = CFSTR("roadComplexity");
  else
    v259 = CFSTR("road_complexity");
  objc_msgSend(v5, "objectForKeyedSubscript:", v259);
  v260 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v413 = 0u;
    v414 = 0u;
    v411 = 0u;
    v412 = 0u;
    v380 = v260;
    v261 = v260;
    v262 = objc_msgSend(v261, "countByEnumeratingWithState:objects:count:", &v411, v493, 16);
    if (v262)
    {
      v263 = v262;
      v264 = *(_QWORD *)v412;
      do
      {
        for (i9 = 0; i9 != v263; ++i9)
        {
          if (*(_QWORD *)v412 != v264)
            objc_enumerationMutation(v261);
          v266 = *(_QWORD *)(*((_QWORD *)&v411 + 1) + 8 * i9);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v267 = [GEORoadComplexity alloc];
            if ((v2 & 1) != 0)
              v268 = -[GEORoadComplexity initWithJSON:](v267, "initWithJSON:", v266);
            else
              v268 = -[GEORoadComplexity initWithDictionary:](v267, "initWithDictionary:", v266);
            v269 = (void *)v268;
            objc_msgSend(v6, "addRoadComplexity:", v268, v380);

          }
        }
        v263 = objc_msgSend(v261, "countByEnumeratingWithState:objects:count:", &v411, v493, 16);
      }
      while (v263);
    }

    v260 = v380;
  }

  if (v2)
    v270 = CFSTR("laneWidth");
  else
    v270 = CFSTR("lane_width");
  objc_msgSend(v5, "objectForKeyedSubscript:", v270, v380);
  v271 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v409 = 0u;
    v410 = 0u;
    v407 = 0u;
    v408 = 0u;
    v381 = v271;
    v272 = v271;
    v273 = objc_msgSend(v272, "countByEnumeratingWithState:objects:count:", &v407, v492, 16);
    if (v273)
    {
      v274 = v273;
      v275 = *(_QWORD *)v408;
      do
      {
        for (i10 = 0; i10 != v274; ++i10)
        {
          if (*(_QWORD *)v408 != v275)
            objc_enumerationMutation(v272);
          v277 = *(_QWORD *)(*((_QWORD *)&v407 + 1) + 8 * i10);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v278 = [GEOLaneWidth alloc];
            if ((v2 & 1) != 0)
              v279 = -[GEOLaneWidth initWithJSON:](v278, "initWithJSON:", v277);
            else
              v279 = -[GEOLaneWidth initWithDictionary:](v278, "initWithDictionary:", v277);
            v280 = (void *)v279;
            objc_msgSend(v6, "addLaneWidth:", v279, v381);

          }
        }
        v274 = objc_msgSend(v272, "countByEnumeratingWithState:objects:count:", &v407, v492, 16);
      }
      while (v274);
    }

    v271 = v381;
  }

  if (v2)
    v281 = CFSTR("elevationProfile");
  else
    v281 = CFSTR("elevation_profile");
  objc_msgSend(v5, "objectForKeyedSubscript:", v281, v381);
  v282 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v283 = [GEOElevationProfile alloc];
    if ((v2 & 1) != 0)
      v284 = -[GEOElevationProfile initWithJSON:](v283, "initWithJSON:", v282);
    else
      v284 = -[GEOElevationProfile initWithDictionary:](v283, "initWithDictionary:", v282);
    v285 = (void *)v284;
    objc_msgSend(v6, "setElevationProfile:", v284);

  }
  if (v2)
    v286 = CFSTR("arrivalParameterIndex");
  else
    v286 = CFSTR("arrival_parameter_index");
  objc_msgSend(v5, "objectForKeyedSubscript:", v286);
  v287 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setArrivalParameterIndex:", objc_msgSend(v287, "unsignedIntValue"));

  if (v2)
    v288 = CFSTR("restrictedZoneIds");
  else
    v288 = CFSTR("restricted_zone_ids");
  objc_msgSend(v5, "objectForKeyedSubscript:", v288);
  v289 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v405 = 0u;
    v406 = 0u;
    v403 = 0u;
    v404 = 0u;
    v382 = v289;
    v290 = v289;
    v291 = objc_msgSend(v290, "countByEnumeratingWithState:objects:count:", &v403, v491, 16);
    if (v291)
    {
      v292 = v291;
      v293 = *(_QWORD *)v404;
      do
      {
        for (i11 = 0; i11 != v292; ++i11)
        {
          if (*(_QWORD *)v404 != v293)
            objc_enumerationMutation(v290);
          v295 = *(_QWORD *)(*((_QWORD *)&v403 + 1) + 8 * i11);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v296 = [GEORestrictedZoneId alloc];
            if ((v2 & 1) != 0)
              v297 = -[GEORestrictedZoneId initWithJSON:](v296, "initWithJSON:", v295);
            else
              v297 = -[GEORestrictedZoneId initWithDictionary:](v296, "initWithDictionary:", v295);
            v298 = (void *)v297;
            objc_msgSend(v6, "addRestrictedZoneIds:", v297, v382);

          }
        }
        v292 = objc_msgSend(v290, "countByEnumeratingWithState:objects:count:", &v403, v491, 16);
      }
      while (v292);
    }

    v289 = v382;
  }

  if (v2)
    v299 = CFSTR("licensePlateRestrictionImpact");
  else
    v299 = CFSTR("license_plate_restriction_impact");
  objc_msgSend(v5, "objectForKeyedSubscript:", v299, v382);
  v300 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v301 = v300;
    if ((objc_msgSend(v301, "isEqualToString:", CFSTR("RESTRICTION_ZONE_IMPACT_UNKNOWN")) & 1) != 0)
    {
      v302 = 0;
    }
    else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("RESTRICTION_ZONE_IMPACT_NOT_AFFECTED")) & 1) != 0)
    {
      v302 = 1;
    }
    else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("RESTRICTION_ZONE_IMPACT_AVOIDS_RESTRICTION")) & 1) != 0)
    {
      v302 = 2;
    }
    else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("RESTRICTION_ZONE_IMPACT_POTENTIALLY_AFFECTED")) & 1) != 0)
    {
      v302 = 3;
    }
    else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("RESTRICTION_ZONE_IMPACT_ORIGIN_IN")) & 1) != 0)
    {
      v302 = 4;
    }
    else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("RESTRICTION_ZONE_IMPACT_DESTINATION_IN")) & 1) != 0)
    {
      v302 = 5;
    }
    else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("RESTRICTION_ZONE_IMPACT_ORIGIN_DESTINATION_IN")) & 1) != 0)
    {
      v302 = 6;
    }
    else if (objc_msgSend(v301, "isEqualToString:", CFSTR("RESTRICTION_ZONE_IMPACT_CUT_THROUGH")))
    {
      v302 = 7;
    }
    else
    {
      v302 = 0;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_519;
    v302 = objc_msgSend(v300, "intValue");
  }
  objc_msgSend(v6, "setLicensePlateRestrictionImpact:", v302);
LABEL_519:

  if (v2)
    v303 = CFSTR("environmentalCongestionZoneImpact");
  else
    v303 = CFSTR("environmental_congestion_zone_impact");
  objc_msgSend(v5, "objectForKeyedSubscript:", v303);
  v304 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v305 = v304;
    if ((objc_msgSend(v305, "isEqualToString:", CFSTR("RESTRICTION_ZONE_IMPACT_UNKNOWN")) & 1) != 0)
    {
      v306 = 0;
    }
    else if ((objc_msgSend(v305, "isEqualToString:", CFSTR("RESTRICTION_ZONE_IMPACT_NOT_AFFECTED")) & 1) != 0)
    {
      v306 = 1;
    }
    else if ((objc_msgSend(v305, "isEqualToString:", CFSTR("RESTRICTION_ZONE_IMPACT_AVOIDS_RESTRICTION")) & 1) != 0)
    {
      v306 = 2;
    }
    else if ((objc_msgSend(v305, "isEqualToString:", CFSTR("RESTRICTION_ZONE_IMPACT_POTENTIALLY_AFFECTED")) & 1) != 0)
    {
      v306 = 3;
    }
    else if ((objc_msgSend(v305, "isEqualToString:", CFSTR("RESTRICTION_ZONE_IMPACT_ORIGIN_IN")) & 1) != 0)
    {
      v306 = 4;
    }
    else if ((objc_msgSend(v305, "isEqualToString:", CFSTR("RESTRICTION_ZONE_IMPACT_DESTINATION_IN")) & 1) != 0)
    {
      v306 = 5;
    }
    else if ((objc_msgSend(v305, "isEqualToString:", CFSTR("RESTRICTION_ZONE_IMPACT_ORIGIN_DESTINATION_IN")) & 1) != 0)
    {
      v306 = 6;
    }
    else if (objc_msgSend(v305, "isEqualToString:", CFSTR("RESTRICTION_ZONE_IMPACT_CUT_THROUGH")))
    {
      v306 = 7;
    }
    else
    {
      v306 = 0;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_544;
    v306 = objc_msgSend(v304, "intValue");
  }
  objc_msgSend(v6, "setEnvironmentalCongestionZoneImpact:", v306);
LABEL_544:

  if (v2)
    v307 = CFSTR("tollCongestionZoneImpact");
  else
    v307 = CFSTR("toll_congestion_zone_impact");
  objc_msgSend(v5, "objectForKeyedSubscript:", v307);
  v308 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v309 = v308;
    if ((objc_msgSend(v309, "isEqualToString:", CFSTR("RESTRICTION_ZONE_IMPACT_UNKNOWN")) & 1) != 0)
    {
      v310 = 0;
    }
    else if ((objc_msgSend(v309, "isEqualToString:", CFSTR("RESTRICTION_ZONE_IMPACT_NOT_AFFECTED")) & 1) != 0)
    {
      v310 = 1;
    }
    else if ((objc_msgSend(v309, "isEqualToString:", CFSTR("RESTRICTION_ZONE_IMPACT_AVOIDS_RESTRICTION")) & 1) != 0)
    {
      v310 = 2;
    }
    else if ((objc_msgSend(v309, "isEqualToString:", CFSTR("RESTRICTION_ZONE_IMPACT_POTENTIALLY_AFFECTED")) & 1) != 0)
    {
      v310 = 3;
    }
    else if ((objc_msgSend(v309, "isEqualToString:", CFSTR("RESTRICTION_ZONE_IMPACT_ORIGIN_IN")) & 1) != 0)
    {
      v310 = 4;
    }
    else if ((objc_msgSend(v309, "isEqualToString:", CFSTR("RESTRICTION_ZONE_IMPACT_DESTINATION_IN")) & 1) != 0)
    {
      v310 = 5;
    }
    else if ((objc_msgSend(v309, "isEqualToString:", CFSTR("RESTRICTION_ZONE_IMPACT_ORIGIN_DESTINATION_IN")) & 1) != 0)
    {
      v310 = 6;
    }
    else if (objc_msgSend(v309, "isEqualToString:", CFSTR("RESTRICTION_ZONE_IMPACT_CUT_THROUGH")))
    {
      v310 = 7;
    }
    else
    {
      v310 = 0;
    }

    goto LABEL_568;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v310 = objc_msgSend(v308, "intValue");
LABEL_568:
    objc_msgSend(v6, "setTollCongestionZoneImpact:", v310);
  }

  if (v2)
    v311 = CFSTR("stepGroup");
  else
    v311 = CFSTR("step_group");
  objc_msgSend(v5, "objectForKeyedSubscript:", v311);
  v312 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v401 = 0u;
    v402 = 0u;
    v399 = 0u;
    v400 = 0u;
    v383 = v312;
    v313 = v312;
    v314 = objc_msgSend(v313, "countByEnumeratingWithState:objects:count:", &v399, v490, 16);
    if (v314)
    {
      v315 = v314;
      v316 = *(_QWORD *)v400;
      do
      {
        for (i12 = 0; i12 != v315; ++i12)
        {
          if (*(_QWORD *)v400 != v316)
            objc_enumerationMutation(v313);
          v318 = *(_QWORD *)(*((_QWORD *)&v399 + 1) + 8 * i12);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v319 = [GEOStepGroup alloc];
            if ((v2 & 1) != 0)
              v320 = -[GEOStepGroup initWithJSON:](v319, "initWithJSON:", v318);
            else
              v320 = -[GEOStepGroup initWithDictionary:](v319, "initWithDictionary:", v318);
            v321 = (void *)v320;
            objc_msgSend(v6, "addStepGroup:", v320, v383);

          }
        }
        v315 = objc_msgSend(v313, "countByEnumeratingWithState:objects:count:", &v399, v490, 16);
      }
      while (v315);
    }

    v312 = v383;
  }

  if (v2)
    v322 = CFSTR("updateLocation");
  else
    v322 = CFSTR("update_location");
  objc_msgSend(v5, "objectForKeyedSubscript:", v322, v383);
  v323 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v397 = 0u;
    v398 = 0u;
    v395 = 0u;
    v396 = 0u;
    v384 = v323;
    v324 = v323;
    v325 = objc_msgSend(v324, "countByEnumeratingWithState:objects:count:", &v395, v489, 16);
    if (v325)
    {
      v326 = v325;
      v327 = *(_QWORD *)v396;
      do
      {
        for (i13 = 0; i13 != v326; ++i13)
        {
          if (*(_QWORD *)v396 != v327)
            objc_enumerationMutation(v324);
          v329 = *(_QWORD *)(*((_QWORD *)&v395 + 1) + 8 * i13);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v330 = [GEOUpdateLocation alloc];
            if ((v2 & 1) != 0)
              v331 = -[GEOUpdateLocation initWithJSON:](v330, "initWithJSON:", v329);
            else
              v331 = -[GEOUpdateLocation initWithDictionary:](v330, "initWithDictionary:", v329);
            v332 = (void *)v331;
            objc_msgSend(v6, "addUpdateLocation:", v331, v384);

          }
        }
        v326 = objc_msgSend(v324, "countByEnumeratingWithState:objects:count:", &v395, v489, 16);
      }
      while (v326);
    }

    v323 = v384;
  }

  if (v2)
    v333 = CFSTR("originWaypointInfo");
  else
    v333 = CFSTR("origin_waypoint_info");
  objc_msgSend(v5, "objectForKeyedSubscript:", v333, v384);
  v334 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v335 = [GEOWaypointInfo alloc];
    if ((v2 & 1) != 0)
      v336 = -[GEOWaypointInfo initWithJSON:](v335, "initWithJSON:", v334);
    else
      v336 = -[GEOWaypointInfo initWithDictionary:](v335, "initWithDictionary:", v334);
    v337 = (void *)v336;
    objc_msgSend(v6, "setOriginWaypointInfo:", v336);

  }
  if (v2)
    v338 = CFSTR("destinationWaypointInfo");
  else
    v338 = CFSTR("destination_waypoint_info");
  objc_msgSend(v5, "objectForKeyedSubscript:", v338);
  v339 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v340 = [GEOWaypointInfo alloc];
    if ((v2 & 1) != 0)
      v341 = -[GEOWaypointInfo initWithJSON:](v340, "initWithJSON:", v339);
    else
      v341 = -[GEOWaypointInfo initWithDictionary:](v340, "initWithDictionary:", v339);
    v342 = (void *)v341;
    objc_msgSend(v6, "setDestinationWaypointInfo:", v341);

  }
  if (v2)
    v343 = CFSTR("cellularCoverage");
  else
    v343 = CFSTR("cellular_coverage");
  objc_msgSend(v5, "objectForKeyedSubscript:", v343);
  v344 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v393 = 0u;
    v394 = 0u;
    v391 = 0u;
    v392 = 0u;
    v385 = v344;
    v345 = v344;
    v346 = objc_msgSend(v345, "countByEnumeratingWithState:objects:count:", &v391, v488, 16);
    if (!v346)
      goto LABEL_642;
    v347 = v346;
    v348 = *(_QWORD *)v392;
    while (1)
    {
      for (i14 = 0; i14 != v347; ++i14)
      {
        if (*(_QWORD *)v392 != v348)
          objc_enumerationMutation(v345);
        v350 = *(void **)(*((_QWORD *)&v391 + 1) + 8 * i14);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v351 = v350;
          if ((objc_msgSend(v351, "isEqualToString:", CFSTR("CELLULAR_COVERAGE_UNKNOWN")) & 1) != 0)
          {
            v352 = 0;
          }
          else if ((objc_msgSend(v351, "isEqualToString:", CFSTR("CELLULAR_COVERAGE_AVAILABLE")) & 1) != 0)
          {
            v352 = 1;
          }
          else if (objc_msgSend(v351, "isEqualToString:", CFSTR("CELLULAR_COVERAGE_UNAVAILABLE")))
          {
            v352 = 2;
          }
          else
          {
            v352 = 0;
          }

        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            continue;
          v352 = objc_msgSend(v350, "intValue");
        }
        objc_msgSend(v6, "addCellularCoverage:", v352, v385);
      }
      v347 = objc_msgSend(v345, "countByEnumeratingWithState:objects:count:", &v391, v488, 16);
      if (!v347)
      {
LABEL_642:

        v344 = v385;
        v5 = v386;
        break;
      }
    }
  }

  if (v2)
    v353 = CFSTR("cellularCoverageOffset");
  else
    v353 = CFSTR("cellular_coverage_offset");
  objc_msgSend(v5, "objectForKeyedSubscript:", v353, v385);
  v354 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v389 = 0u;
    v390 = 0u;
    v387 = 0u;
    v388 = 0u;
    v355 = v354;
    v356 = objc_msgSend(v355, "countByEnumeratingWithState:objects:count:", &v387, v487, 16);
    if (v356)
    {
      v357 = v356;
      v358 = *(_QWORD *)v388;
      do
      {
        for (i15 = 0; i15 != v357; ++i15)
        {
          if (*(_QWORD *)v388 != v358)
            objc_enumerationMutation(v355);
          v360 = *(void **)(*((_QWORD *)&v387 + 1) + 8 * i15);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(v6, "addCellularCoverageOffset:", objc_msgSend(v360, "unsignedIntValue"));
        }
        v357 = objc_msgSend(v355, "countByEnumeratingWithState:objects:count:", &v387, v487, 16);
      }
      while (v357);
    }

  }
  if (v2)
    v361 = CFSTR("originListInstruction");
  else
    v361 = CFSTR("origin_list_instruction");
  objc_msgSend(v5, "objectForKeyedSubscript:", v361);
  v362 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v363 = [GEODrivingWalkingInstruction alloc];
    if (v363)
      v364 = (void *)-[GEODrivingWalkingInstruction _initWithDictionary:isJSON:](v363, v362, v2);
    else
      v364 = 0;
    objc_msgSend(v6, "setOriginListInstruction:", v364);

  }
  if (v2)
    v365 = CFSTR("destinationListInstruction");
  else
    v365 = CFSTR("destination_list_instruction");
  objc_msgSend(v5, "objectForKeyedSubscript:", v365);
  v366 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v367 = [GEODrivingWalkingInstruction alloc];
    if (v367)
      v368 = (void *)-[GEODrivingWalkingInstruction _initWithDictionary:isJSON:](v367, v366, v2);
    else
      v368 = 0;
    objc_msgSend(v6, "setDestinationListInstruction:", v368);

  }
  v3 = v6;

LABEL_672:
  return v3;
}

- (GEORoute)initWithJSON:(id)a3
{
  return (GEORoute *)-[GEORoute _initWithDictionary:isJSON:]();
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
      v8 = (int *)&readAll__recursiveTag_4366;
    else
      v8 = (int *)&readAll__nonRecursiveTag_4367;
    GEORouteReadSpecified((uint64_t)self, (char *)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEORouteCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORouteIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORouteReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t flags;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  NSMutableArray *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSMutableArray *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSMutableArray *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  NSMutableArray *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  NSMutableArray *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  NSMutableArray *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  unint64_t v47;
  NSMutableArray *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  NSMutableArray *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  NSMutableArray *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  NSMutableArray *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  NSMutableArray *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  NSMutableArray *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  NSMutableArray *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  NSMutableArray *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  NSMutableArray *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  NSMutableArray *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  unint64_t v89;
  unint64_t v90;
  PBDataReader *v91;
  void *v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
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
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  uint64_t v157;
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
  _BYTE v170[128];
  _BYTE v171[128];
  _BYTE v172[128];
  _BYTE v173[128];
  _BYTE v174[128];
  _BYTE v175[128];
  _BYTE v176[128];
  _BYTE v177[128];
  _BYTE v178[128];
  _BYTE v179[128];
  _BYTE v180[128];
  _BYTE v181[128];
  _BYTE v182[128];
  _BYTE v183[128];
  _BYTE v184[128];
  _BYTE v185[128];
  _BYTE v186[128];
  _BYTE v187[128];
  _BYTE v188[128];
  uint64_t v189;

  v189 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEORouteIsDirty((uint64_t)self) & 1) == 0)
  {
    v91 = self->_reader;
    objc_sync_enter(v91);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v92);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v91);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEORoute readAll:](self, "readAll:", 0);
    if ((*(_QWORD *)&self->_flags & 0x1000) != 0)
      PBDataWriterWriteInt32Field();
    v169 = 0u;
    v168 = 0u;
    v167 = 0u;
    v166 = 0u;
    v6 = self->_steps;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v166, v188, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v167;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v167 != v8)
            objc_enumerationMutation(v6);
          PBDataWriterWriteSubmessage();
          ++v9;
        }
        while (v7 != v9);
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v166, v188, 16);
      }
      while (v7);
    }

    if (self->_name)
      PBDataWriterWriteStringField();
    if (self->_phoneticName)
      PBDataWriterWriteStringField();
    flags = (uint64_t)self->_flags;
    if ((flags & 8) != 0)
    {
      PBDataWriterWriteUint32Field();
      flags = (uint64_t)self->_flags;
    }
    if ((flags & 0x40) != 0)
      PBDataWriterWriteUint32Field();
    if (self->_routeID)
      PBDataWriterWriteDataField();
    if ((*(_QWORD *)&self->_flags & 0x200) != 0)
      PBDataWriterWriteInt32Field();
    v165 = 0u;
    v164 = 0u;
    v163 = 0u;
    v162 = 0u;
    v11 = self->_zilchPoints;
    v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v162, v187, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v163;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v163 != v13)
            objc_enumerationMutation(v11);
          PBDataWriterWriteDataField();
          ++v14;
        }
        while (v12 != v14);
        v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v162, v187, 16);
      }
      while (v12);
    }

    v161 = 0u;
    v160 = 0u;
    v159 = 0u;
    v158 = 0u;
    v15 = self->_basicPoints;
    v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v158, v186, 16);
    if (v16)
    {
      v17 = *(_QWORD *)v159;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v159 != v17)
            objc_enumerationMutation(v15);
          PBDataWriterWriteDataField();
          ++v18;
        }
        while (v16 != v18);
        v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v158, v186, 16);
      }
      while (v16);
    }

    if (self->_pathLeg)
      PBDataWriterWriteDataField();
    if (self->_pathMapMatcherInstructions)
      PBDataWriterWriteSubmessage();
    if ((*(_QWORD *)&self->_flags & 0x10) != 0)
      PBDataWriterWriteInt32Field();
    if (self->_departureRouteID)
      PBDataWriterWriteDataField();
    if ((*(_QWORD *)&self->_flags & 4) != 0)
      PBDataWriterWriteUint32Field();
    if (self->_arrivalRouteID)
      PBDataWriterWriteDataField();
    if ((*(_QWORD *)&self->_flags & 1) != 0)
      PBDataWriterWriteUint32Field();
    if (self->_trafficColors.count)
    {
      v157 = 0;
      PBDataWriterPlaceMark();
      if (self->_trafficColors.count)
      {
        v19 = 0;
        do
        {
          PBDataWriterWriteUint32Field();
          ++v19;
        }
        while (v19 < self->_trafficColors.count);
      }
      PBDataWriterRecallMark();
    }
    if (self->_trafficColorOffsets.count)
    {
      v157 = 0;
      PBDataWriterPlaceMark();
      if (self->_trafficColorOffsets.count)
      {
        v20 = 0;
        do
        {
          PBDataWriterWriteUint32Field();
          ++v20;
        }
        while (v20 < self->_trafficColorOffsets.count);
      }
      PBDataWriterRecallMark();
    }
    v155 = 0u;
    v156 = 0u;
    v153 = 0u;
    v154 = 0u;
    v21 = self->_routeLineStyleInfos;
    v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v153, v185, 16);
    if (v22)
    {
      v23 = *(_QWORD *)v154;
      do
      {
        v24 = 0;
        do
        {
          if (*(_QWORD *)v154 != v23)
            objc_enumerationMutation(v21);
          PBDataWriterWriteSubmessage();
          ++v24;
        }
        while (v22 != v24);
        v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v153, v185, 16);
      }
      while (v22);
    }

    v151 = 0u;
    v152 = 0u;
    v149 = 0u;
    v150 = 0u;
    v25 = self->_routeCameraInputInfos;
    v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v149, v184, 16);
    if (v26)
    {
      v27 = *(_QWORD *)v150;
      do
      {
        v28 = 0;
        do
        {
          if (*(_QWORD *)v150 != v27)
            objc_enumerationMutation(v25);
          PBDataWriterWriteSubmessage();
          ++v28;
        }
        while (v26 != v28);
        v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v149, v184, 16);
      }
      while (v26);
    }

    v147 = 0u;
    v148 = 0u;
    v145 = 0u;
    v146 = 0u;
    v29 = self->_trafficColorInfos;
    v30 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v145, v183, 16);
    if (v30)
    {
      v31 = *(_QWORD *)v146;
      do
      {
        v32 = 0;
        do
        {
          if (*(_QWORD *)v146 != v31)
            objc_enumerationMutation(v29);
          PBDataWriterWriteSubmessage();
          ++v32;
        }
        while (v30 != v32);
        v30 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v145, v183, 16);
      }
      while (v30);
    }

    v143 = 0u;
    v144 = 0u;
    v141 = 0u;
    v142 = 0u;
    v33 = self->_routeNames;
    v34 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v141, v182, 16);
    if (v34)
    {
      v35 = *(_QWORD *)v142;
      do
      {
        v36 = 0;
        do
        {
          if (*(_QWORD *)v142 != v35)
            objc_enumerationMutation(v33);
          PBDataWriterWriteSubmessage();
          ++v36;
        }
        while (v34 != v36);
        v34 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v141, v182, 16);
      }
      while (v34);
    }

    if ((*(_QWORD *)&self->_flags & 0x80) != 0)
      PBDataWriterWriteUint32Field();
    v139 = 0u;
    v140 = 0u;
    v137 = 0u;
    v138 = 0u;
    v37 = self->_advisoryNotices;
    v38 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v37, "countByEnumeratingWithState:objects:count:", &v137, v181, 16);
    if (v38)
    {
      v39 = *(_QWORD *)v138;
      do
      {
        v40 = 0;
        do
        {
          if (*(_QWORD *)v138 != v39)
            objc_enumerationMutation(v37);
          PBDataWriterWriteStringField();
          ++v40;
        }
        while (v38 != v40);
        v38 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v37, "countByEnumeratingWithState:objects:count:", &v137, v181, 16);
      }
      while (v38);
    }

    if (self->_routeLabelDetailText)
      PBDataWriterWriteSubmessage();
    if (self->_infrastructureDescription)
      PBDataWriterWriteSubmessage();
    if (self->_clickableAdvisory)
      PBDataWriterWriteSubmessage();
    v41 = (uint64_t)self->_flags;
    if ((v41 & 0x2000) != 0)
    {
      PBDataWriterWriteUint32Field();
      v41 = (uint64_t)self->_flags;
    }
    if ((v41 & 0x4000) != 0)
    {
      PBDataWriterWriteUint32Field();
      v41 = (uint64_t)self->_flags;
    }
    if ((v41 & 0x400) != 0)
    {
      PBDataWriterWriteUint32Field();
      v41 = (uint64_t)self->_flags;
    }
    if ((v41 & 0x10000) != 0)
    {
      PBDataWriterWriteBOOLField();
      v41 = (uint64_t)self->_flags;
    }
    if ((v41 & 0x8000) != 0)
    {
      PBDataWriterWriteBOOLField();
      v41 = (uint64_t)self->_flags;
    }
    if ((v41 & 0x20000) != 0)
      PBDataWriterWriteBOOLField();
    v135 = 0u;
    v136 = 0u;
    v133 = 0u;
    v134 = 0u;
    v42 = self->_enrouteNotices;
    v43 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v42, "countByEnumeratingWithState:objects:count:", &v133, v180, 16);
    if (v43)
    {
      v44 = *(_QWORD *)v134;
      do
      {
        v45 = 0;
        do
        {
          if (*(_QWORD *)v134 != v44)
            objc_enumerationMutation(v42);
          PBDataWriterWriteSubmessage();
          ++v45;
        }
        while (v43 != v45);
        v43 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v42, "countByEnumeratingWithState:objects:count:", &v133, v180, 16);
      }
      while (v43);
    }

    if (self->_unpackedLatLngVertices)
      PBDataWriterWriteDataField();
    if (self->_incidentIndices.count)
    {
      v157 = 0;
      PBDataWriterPlaceMark();
      if (self->_incidentIndices.count)
      {
        v46 = 0;
        do
        {
          PBDataWriterWriteUint32Field();
          ++v46;
        }
        while (v46 < self->_incidentIndices.count);
      }
      PBDataWriterRecallMark();
    }
    if (self->_incidentEndOffsetsInRoutes.count)
    {
      v157 = 0;
      PBDataWriterPlaceMark();
      if (self->_incidentEndOffsetsInRoutes.count)
      {
        v47 = 0;
        do
        {
          PBDataWriterWriteUint32Field();
          ++v47;
        }
        while (v47 < self->_incidentEndOffsetsInRoutes.count);
      }
      PBDataWriterRecallMark();
    }
    v131 = 0u;
    v132 = 0u;
    v129 = 0u;
    v130 = 0u;
    v48 = self->_incidentOnRouteInfos;
    v49 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v48, "countByEnumeratingWithState:objects:count:", &v129, v179, 16);
    if (v49)
    {
      v50 = *(_QWORD *)v130;
      do
      {
        v51 = 0;
        do
        {
          if (*(_QWORD *)v130 != v50)
            objc_enumerationMutation(v48);
          PBDataWriterWriteSubmessage();
          ++v51;
        }
        while (v49 != v51);
        v49 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v48, "countByEnumeratingWithState:objects:count:", &v129, v179, 16);
      }
      while (v49);
    }

    if (self->_routePlanningDescription)
      PBDataWriterWriteSubmessage();
    v127 = 0u;
    v128 = 0u;
    v125 = 0u;
    v126 = 0u;
    v52 = self->_routeDescriptions;
    v53 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v52, "countByEnumeratingWithState:objects:count:", &v125, v178, 16);
    if (v53)
    {
      v54 = *(_QWORD *)v126;
      do
      {
        v55 = 0;
        do
        {
          if (*(_QWORD *)v126 != v54)
            objc_enumerationMutation(v52);
          PBDataWriterWriteSubmessage();
          ++v55;
        }
        while (v53 != v55);
        v53 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v52, "countByEnumeratingWithState:objects:count:", &v125, v178, 16);
      }
      while (v53);
    }

    v123 = 0u;
    v124 = 0u;
    v121 = 0u;
    v122 = 0u;
    v56 = self->_startingRouteInstructions;
    v57 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v56, "countByEnumeratingWithState:objects:count:", &v121, v177, 16);
    if (v57)
    {
      v58 = *(_QWORD *)v122;
      do
      {
        v59 = 0;
        do
        {
          if (*(_QWORD *)v122 != v58)
            objc_enumerationMutation(v56);
          PBDataWriterWriteSubmessage();
          ++v59;
        }
        while (v57 != v59);
        v57 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v56, "countByEnumeratingWithState:objects:count:", &v121, v177, 16);
      }
      while (v57);
    }

    v119 = 0u;
    v120 = 0u;
    v117 = 0u;
    v118 = 0u;
    v60 = self->_endingRouteInstructions;
    v61 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v60, "countByEnumeratingWithState:objects:count:", &v117, v176, 16);
    if (v61)
    {
      v62 = *(_QWORD *)v118;
      do
      {
        v63 = 0;
        do
        {
          if (*(_QWORD *)v118 != v62)
            objc_enumerationMutation(v60);
          PBDataWriterWriteSubmessage();
          ++v63;
        }
        while (v61 != v63);
        v61 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v60, "countByEnumeratingWithState:objects:count:", &v117, v176, 16);
      }
      while (v61);
    }

    if (self->_trafficDescription)
      PBDataWriterWriteStringField();
    if (self->_trafficDescriptionLong)
      PBDataWriterWriteStringField();
    if (self->_alertNonRecommendedRouteText)
      PBDataWriterWriteSubmessage();
    v115 = 0u;
    v116 = 0u;
    v113 = 0u;
    v114 = 0u;
    v64 = self->_guidanceEvents;
    v65 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v64, "countByEnumeratingWithState:objects:count:", &v113, v175, 16);
    if (v65)
    {
      v66 = *(_QWORD *)v114;
      do
      {
        v67 = 0;
        do
        {
          if (*(_QWORD *)v114 != v66)
            objc_enumerationMutation(v64);
          PBDataWriterWriteSubmessage();
          ++v67;
        }
        while (v65 != v67);
        v65 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v64, "countByEnumeratingWithState:objects:count:", &v113, v175, 16);
      }
      while (v65);
    }

    if (self->_launchAndGoCardText)
      PBDataWriterWriteSubmessage();
    v111 = 0u;
    v112 = 0u;
    v109 = 0u;
    v110 = 0u;
    v68 = self->_roadComplexitys;
    v69 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v68, "countByEnumeratingWithState:objects:count:", &v109, v174, 16);
    if (v69)
    {
      v70 = *(_QWORD *)v110;
      do
      {
        v71 = 0;
        do
        {
          if (*(_QWORD *)v110 != v70)
            objc_enumerationMutation(v68);
          PBDataWriterWriteSubmessage();
          ++v71;
        }
        while (v69 != v71);
        v69 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v68, "countByEnumeratingWithState:objects:count:", &v109, v174, 16);
      }
      while (v69);
    }

    v107 = 0u;
    v108 = 0u;
    v105 = 0u;
    v106 = 0u;
    v72 = self->_laneWidths;
    v73 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v72, "countByEnumeratingWithState:objects:count:", &v105, v173, 16);
    if (v73)
    {
      v74 = *(_QWORD *)v106;
      do
      {
        v75 = 0;
        do
        {
          if (*(_QWORD *)v106 != v74)
            objc_enumerationMutation(v72);
          PBDataWriterWriteSubmessage();
          ++v75;
        }
        while (v73 != v75);
        v73 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v72, "countByEnumeratingWithState:objects:count:", &v105, v173, 16);
      }
      while (v73);
    }

    if (self->_elevationProfile)
      PBDataWriterWriteSubmessage();
    if ((*(_QWORD *)&self->_flags & 2) != 0)
      PBDataWriterWriteUint32Field();
    v103 = 0u;
    v104 = 0u;
    v101 = 0u;
    v102 = 0u;
    v76 = self->_restrictedZoneIds;
    v77 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v76, "countByEnumeratingWithState:objects:count:", &v101, v172, 16);
    if (v77)
    {
      v78 = *(_QWORD *)v102;
      do
      {
        v79 = 0;
        do
        {
          if (*(_QWORD *)v102 != v78)
            objc_enumerationMutation(v76);
          PBDataWriterWriteSubmessage();
          ++v79;
        }
        while (v77 != v79);
        v77 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v76, "countByEnumeratingWithState:objects:count:", &v101, v172, 16);
      }
      while (v77);
    }

    v80 = (uint64_t)self->_flags;
    if ((v80 & 0x100) != 0)
    {
      PBDataWriterWriteInt32Field();
      v80 = (uint64_t)self->_flags;
    }
    if ((v80 & 0x20) != 0)
    {
      PBDataWriterWriteInt32Field();
      v80 = (uint64_t)self->_flags;
    }
    if ((v80 & 0x800) != 0)
      PBDataWriterWriteInt32Field();
    v99 = 0u;
    v100 = 0u;
    v97 = 0u;
    v98 = 0u;
    v81 = self->_stepGroups;
    v82 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v81, "countByEnumeratingWithState:objects:count:", &v97, v171, 16);
    if (v82)
    {
      v83 = *(_QWORD *)v98;
      do
      {
        v84 = 0;
        do
        {
          if (*(_QWORD *)v98 != v83)
            objc_enumerationMutation(v81);
          PBDataWriterWriteSubmessage();
          ++v84;
        }
        while (v82 != v84);
        v82 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v81, "countByEnumeratingWithState:objects:count:", &v97, v171, 16);
      }
      while (v82);
    }

    v95 = 0u;
    v96 = 0u;
    v93 = 0u;
    v94 = 0u;
    v85 = self->_updateLocations;
    v86 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v85, "countByEnumeratingWithState:objects:count:", &v93, v170, 16);
    if (v86)
    {
      v87 = *(_QWORD *)v94;
      do
      {
        v88 = 0;
        do
        {
          if (*(_QWORD *)v94 != v87)
            objc_enumerationMutation(v85);
          PBDataWriterWriteSubmessage();
          ++v88;
        }
        while (v86 != v88);
        v86 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v85, "countByEnumeratingWithState:objects:count:", &v93, v170, 16);
      }
      while (v86);
    }

    if (self->_originWaypointInfo)
      PBDataWriterWriteSubmessage();
    if (self->_destinationWaypointInfo)
      PBDataWriterWriteSubmessage();
    if (self->_cellularCoverages.count)
    {
      v157 = 0;
      PBDataWriterPlaceMark();
      if (self->_cellularCoverages.count)
      {
        v89 = 0;
        do
        {
          PBDataWriterWriteInt32Field();
          ++v89;
        }
        while (v89 < self->_cellularCoverages.count);
      }
      PBDataWriterRecallMark();
    }
    if (self->_cellularCoverageOffsets.count)
    {
      v157 = 0;
      PBDataWriterPlaceMark();
      if (self->_cellularCoverageOffsets.count)
      {
        v90 = 0;
        do
        {
          PBDataWriterWriteUint32Field();
          ++v90;
        }
        while (v90 < self->_cellularCoverageOffsets.count);
      }
      PBDataWriterRecallMark();
    }
    if (self->_originListInstruction)
      PBDataWriterWriteSubmessage();
    if (self->_destinationListInstruction)
      PBDataWriterWriteSubmessage();
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v93);
  }

}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;
  BOOL v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v3 = a3;
  v26 = *MEMORY[0x1E0C80C00];
  -[GEORoute _readDestinationWaypointInfo]((uint64_t)self);
  if (!-[GEOWaypointInfo hasGreenTeaWithValue:](self->_destinationWaypointInfo, "hasGreenTeaWithValue:", v3))
  {
    -[GEORoute _readOriginWaypointInfo]((uint64_t)self);
    if (!-[GEOWaypointInfo hasGreenTeaWithValue:](self->_originWaypointInfo, "hasGreenTeaWithValue:", v3))
    {
      -[GEORoute _readRestrictedZoneIds]((uint64_t)self);
      v22 = 0u;
      v23 = 0u;
      v20 = 0u;
      v21 = 0u;
      v6 = self->_restrictedZoneIds;
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v21;
LABEL_6:
        v10 = 0;
        while (1)
        {
          if (*(_QWORD *)v21 != v9)
            objc_enumerationMutation(v6);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v10), "hasGreenTeaWithValue:", v3) & 1) != 0)
            break;
          if (v8 == ++v10)
          {
            v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
            if (v8)
              goto LABEL_6;
            goto LABEL_12;
          }
        }
      }
      else
      {
LABEL_12:

        -[GEORoute _readSteps]((uint64_t)self);
        v18 = 0u;
        v19 = 0u;
        v16 = 0u;
        v17 = 0u;
        v6 = self->_steps;
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
        if (!v11)
        {
LABEL_20:
          v5 = 0;
LABEL_22:

          return v5;
        }
        v12 = v11;
        v13 = *(_QWORD *)v17;
LABEL_14:
        v14 = 0;
        while (1)
        {
          if (*(_QWORD *)v17 != v13)
            objc_enumerationMutation(v6);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v14), "hasGreenTeaWithValue:", v3, (_QWORD)v16) & 1) != 0)
            break;
          if (v12 == ++v14)
          {
            v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
            if (v12)
              goto LABEL_14;
            goto LABEL_20;
          }
        }
      }
      v5 = 1;
      goto LABEL_22;
    }
  }
  return 1;
}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  char *v8;
  uint64_t flags;
  unint64_t v10;
  unint64_t v11;
  uint64_t j;
  void *v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t k;
  void *v17;
  char *v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t m;
  unint64_t v22;
  unint64_t v23;
  uint64_t n;
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
  void *v36;
  unint64_t v37;
  unint64_t v38;
  uint64_t mm;
  void *v40;
  unint64_t v41;
  unint64_t v42;
  uint64_t nn;
  void *v44;
  char *v45;
  $581651A3999351CF43A2CF8B014366CB *p_flags;
  uint64_t v47;
  unint64_t v48;
  unint64_t v49;
  uint64_t i1;
  void *v51;
  unint64_t v52;
  unint64_t v53;
  uint64_t i2;
  unint64_t v55;
  unint64_t v56;
  uint64_t i3;
  unint64_t v58;
  unint64_t v59;
  uint64_t i4;
  void *v61;
  unint64_t v62;
  unint64_t v63;
  uint64_t i5;
  void *v65;
  unint64_t v66;
  unint64_t v67;
  uint64_t i6;
  void *v69;
  unint64_t v70;
  unint64_t v71;
  uint64_t i7;
  void *v73;
  unint64_t v74;
  unint64_t v75;
  uint64_t i8;
  void *v77;
  unint64_t v78;
  unint64_t v79;
  uint64_t i9;
  void *v81;
  unint64_t v82;
  unint64_t v83;
  uint64_t i10;
  void *v85;
  unint64_t v86;
  unint64_t v87;
  uint64_t i11;
  void *v89;
  $581651A3999351CF43A2CF8B014366CB *v90;
  uint64_t v91;
  unint64_t v92;
  unint64_t v93;
  uint64_t i12;
  void *v95;
  unint64_t v96;
  unint64_t v97;
  uint64_t i13;
  void *v99;
  unint64_t v100;
  unint64_t v101;
  uint64_t i14;
  unint64_t v103;
  unint64_t v104;
  uint64_t i15;
  void *v106;
  char *v107;

  v107 = (char *)a3;
  -[GEORoute readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong((id *)v107 + 1, self->_reader);
  *((_DWORD *)v107 + 122) = self->_readerMarkPos;
  *((_DWORD *)v107 + 123) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if ((*(_QWORD *)&self->_flags & 0x1000) != 0)
  {
    *((_DWORD *)v107 + 137) = self->_transportType;
    *(_QWORD *)(v107 + 564) |= 0x1000uLL;
  }
  if (-[GEORoute stepsCount](self, "stepsCount"))
  {
    objc_msgSend(v107, "clearSteps");
    v4 = -[GEORoute stepsCount](self, "stepsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[GEORoute stepAtIndex:](self, "stepAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v107, "addStep:", v7);

      }
    }
  }
  if (self->_name)
    objc_msgSend(v107, "setName:");
  v8 = v107;
  if (self->_phoneticName)
  {
    objc_msgSend(v107, "setPhoneticName:");
    v8 = v107;
  }
  flags = (uint64_t)self->_flags;
  if ((flags & 8) != 0)
  {
    *((_DWORD *)v8 + 128) = self->_distance;
    *(_QWORD *)(v8 + 564) |= 8uLL;
    flags = (uint64_t)self->_flags;
  }
  if ((flags & 0x40) != 0)
  {
    *((_DWORD *)v8 + 131) = self->_expectedTime;
    *(_QWORD *)(v8 + 564) |= 0x40uLL;
  }
  if (self->_routeID)
  {
    objc_msgSend(v107, "setRouteID:");
    v8 = v107;
  }
  if ((*(_QWORD *)&self->_flags & 0x200) != 0)
  {
    *((_DWORD *)v8 + 134) = self->_routeType;
    *(_QWORD *)(v8 + 564) |= 0x200uLL;
  }
  if (-[GEORoute zilchPointsCount](self, "zilchPointsCount"))
  {
    objc_msgSend(v107, "clearZilchPoints");
    v10 = -[GEORoute zilchPointsCount](self, "zilchPointsCount");
    if (v10)
    {
      v11 = v10;
      for (j = 0; j != v11; ++j)
      {
        -[GEORoute zilchPointsAtIndex:](self, "zilchPointsAtIndex:", j);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v107, "addZilchPoints:", v13);

      }
    }
  }
  if (-[GEORoute basicPointsCount](self, "basicPointsCount"))
  {
    objc_msgSend(v107, "clearBasicPoints");
    v14 = -[GEORoute basicPointsCount](self, "basicPointsCount");
    if (v14)
    {
      v15 = v14;
      for (k = 0; k != v15; ++k)
      {
        -[GEORoute basicPointsAtIndex:](self, "basicPointsAtIndex:", k);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v107, "addBasicPoints:", v17);

      }
    }
  }
  if (self->_pathLeg)
    objc_msgSend(v107, "setPathLeg:");
  v18 = v107;
  if (self->_pathMapMatcherInstructions)
  {
    objc_msgSend(v107, "setPathMapMatcherInstructions:");
    v18 = v107;
  }
  if ((*(_QWORD *)&self->_flags & 0x10) != 0)
  {
    *((_DWORD *)v18 + 129) = self->_drivingSide;
    *(_QWORD *)(v18 + 564) |= 0x10uLL;
  }
  if (self->_departureRouteID)
  {
    objc_msgSend(v107, "setDepartureRouteID:");
    v18 = v107;
  }
  if ((*(_QWORD *)&self->_flags & 4) != 0)
  {
    *((_DWORD *)v18 + 127) = self->_departureStepID;
    *(_QWORD *)(v18 + 564) |= 4uLL;
  }
  if (self->_arrivalRouteID)
  {
    objc_msgSend(v107, "setArrivalRouteID:");
    v18 = v107;
  }
  if ((*(_QWORD *)&self->_flags & 1) != 0)
  {
    *((_DWORD *)v18 + 125) = self->_arrivalStepID;
    *(_QWORD *)(v18 + 564) |= 1uLL;
  }
  if (-[GEORoute trafficColorsCount](self, "trafficColorsCount"))
  {
    objc_msgSend(v107, "clearTrafficColors");
    v19 = -[GEORoute trafficColorsCount](self, "trafficColorsCount");
    if (v19)
    {
      v20 = v19;
      for (m = 0; m != v20; ++m)
        objc_msgSend(v107, "addTrafficColor:", -[GEORoute trafficColorAtIndex:](self, "trafficColorAtIndex:", m));
    }
  }
  if (-[GEORoute trafficColorOffsetsCount](self, "trafficColorOffsetsCount"))
  {
    objc_msgSend(v107, "clearTrafficColorOffsets");
    v22 = -[GEORoute trafficColorOffsetsCount](self, "trafficColorOffsetsCount");
    if (v22)
    {
      v23 = v22;
      for (n = 0; n != v23; ++n)
        objc_msgSend(v107, "addTrafficColorOffset:", -[GEORoute trafficColorOffsetAtIndex:](self, "trafficColorOffsetAtIndex:", n));
    }
  }
  if (-[GEORoute routeLineStyleInfosCount](self, "routeLineStyleInfosCount"))
  {
    objc_msgSend(v107, "clearRouteLineStyleInfos");
    v25 = -[GEORoute routeLineStyleInfosCount](self, "routeLineStyleInfosCount");
    if (v25)
    {
      v26 = v25;
      for (ii = 0; ii != v26; ++ii)
      {
        -[GEORoute routeLineStyleInfoAtIndex:](self, "routeLineStyleInfoAtIndex:", ii);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v107, "addRouteLineStyleInfo:", v28);

      }
    }
  }
  if (-[GEORoute routeCameraInputInfosCount](self, "routeCameraInputInfosCount"))
  {
    objc_msgSend(v107, "clearRouteCameraInputInfos");
    v29 = -[GEORoute routeCameraInputInfosCount](self, "routeCameraInputInfosCount");
    if (v29)
    {
      v30 = v29;
      for (jj = 0; jj != v30; ++jj)
      {
        -[GEORoute routeCameraInputInfoAtIndex:](self, "routeCameraInputInfoAtIndex:", jj);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v107, "addRouteCameraInputInfo:", v32);

      }
    }
  }
  if (-[GEORoute trafficColorInfosCount](self, "trafficColorInfosCount"))
  {
    objc_msgSend(v107, "clearTrafficColorInfos");
    v33 = -[GEORoute trafficColorInfosCount](self, "trafficColorInfosCount");
    if (v33)
    {
      v34 = v33;
      for (kk = 0; kk != v34; ++kk)
      {
        -[GEORoute trafficColorInfoAtIndex:](self, "trafficColorInfoAtIndex:", kk);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v107, "addTrafficColorInfo:", v36);

      }
    }
  }
  if (-[GEORoute routeNamesCount](self, "routeNamesCount"))
  {
    objc_msgSend(v107, "clearRouteNames");
    v37 = -[GEORoute routeNamesCount](self, "routeNamesCount");
    if (v37)
    {
      v38 = v37;
      for (mm = 0; mm != v38; ++mm)
      {
        -[GEORoute routeNameAtIndex:](self, "routeNameAtIndex:", mm);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v107, "addRouteName:", v40);

      }
    }
  }
  if ((*(_QWORD *)&self->_flags & 0x80) != 0)
  {
    *((_DWORD *)v107 + 132) = self->_historicTravelTime;
    *(_QWORD *)(v107 + 564) |= 0x80uLL;
  }
  if (-[GEORoute advisoryNoticesCount](self, "advisoryNoticesCount"))
  {
    objc_msgSend(v107, "clearAdvisoryNotices");
    v41 = -[GEORoute advisoryNoticesCount](self, "advisoryNoticesCount");
    if (v41)
    {
      v42 = v41;
      for (nn = 0; nn != v42; ++nn)
      {
        -[GEORoute advisoryNoticeAtIndex:](self, "advisoryNoticeAtIndex:", nn);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v107, "addAdvisoryNotice:", v44);

      }
    }
  }
  if (self->_routeLabelDetailText)
    objc_msgSend(v107, "setRouteLabelDetailText:");
  v45 = v107;
  if (self->_infrastructureDescription)
  {
    objc_msgSend(v107, "setInfrastructureDescription:");
    v45 = v107;
  }
  if (self->_clickableAdvisory)
  {
    objc_msgSend(v107, "setClickableAdvisory:");
    v45 = v107;
  }
  p_flags = &self->_flags;
  v47 = (uint64_t)self->_flags;
  if ((v47 & 0x2000) != 0)
  {
    *((_DWORD *)v45 + 138) = self->_travelTimeAggressiveEstimate;
    *(_QWORD *)(v45 + 564) |= 0x2000uLL;
    v47 = *(_QWORD *)p_flags;
    if ((*(_QWORD *)p_flags & 0x4000) == 0)
    {
LABEL_79:
      if ((v47 & 0x400) == 0)
        goto LABEL_80;
      goto LABEL_175;
    }
  }
  else if ((v47 & 0x4000) == 0)
  {
    goto LABEL_79;
  }
  *((_DWORD *)v45 + 139) = self->_travelTimeConservativeEstimate;
  *(_QWORD *)(v45 + 564) |= 0x4000uLL;
  v47 = (uint64_t)self->_flags;
  if ((v47 & 0x400) == 0)
  {
LABEL_80:
    if ((v47 & 0x10000) == 0)
      goto LABEL_81;
    goto LABEL_176;
  }
LABEL_175:
  *((_DWORD *)v45 + 135) = self->_staticTravelTime;
  *(_QWORD *)(v45 + 564) |= 0x400uLL;
  v47 = (uint64_t)self->_flags;
  if ((v47 & 0x10000) == 0)
  {
LABEL_81:
    if ((v47 & 0x8000) == 0)
      goto LABEL_82;
LABEL_177:
    v45[560] = self->_avoidsHighways;
    *(_QWORD *)(v45 + 564) |= 0x8000uLL;
    if ((*(_QWORD *)&self->_flags & 0x20000) == 0)
      goto LABEL_84;
    goto LABEL_83;
  }
LABEL_176:
  v45[561] = self->_avoidsTolls;
  *(_QWORD *)(v45 + 564) |= 0x10000uLL;
  v47 = (uint64_t)self->_flags;
  if ((v47 & 0x8000) != 0)
    goto LABEL_177;
LABEL_82:
  if ((v47 & 0x20000) != 0)
  {
LABEL_83:
    v45[562] = self->_avoidsTraffic;
    *(_QWORD *)(v45 + 564) |= 0x20000uLL;
  }
LABEL_84:
  if (-[GEORoute enrouteNoticesCount](self, "enrouteNoticesCount"))
  {
    objc_msgSend(v107, "clearEnrouteNotices");
    v48 = -[GEORoute enrouteNoticesCount](self, "enrouteNoticesCount");
    if (v48)
    {
      v49 = v48;
      for (i1 = 0; i1 != v49; ++i1)
      {
        -[GEORoute enrouteNoticeAtIndex:](self, "enrouteNoticeAtIndex:", i1);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v107, "addEnrouteNotice:", v51);

      }
    }
  }
  if (self->_unpackedLatLngVertices)
    objc_msgSend(v107, "setUnpackedLatLngVertices:");
  if (-[GEORoute incidentIndicesCount](self, "incidentIndicesCount"))
  {
    objc_msgSend(v107, "clearIncidentIndices");
    v52 = -[GEORoute incidentIndicesCount](self, "incidentIndicesCount");
    if (v52)
    {
      v53 = v52;
      for (i2 = 0; i2 != v53; ++i2)
        objc_msgSend(v107, "addIncidentIndices:", -[GEORoute incidentIndicesAtIndex:](self, "incidentIndicesAtIndex:", i2));
    }
  }
  if (-[GEORoute incidentEndOffsetsInRoutesCount](self, "incidentEndOffsetsInRoutesCount"))
  {
    objc_msgSend(v107, "clearIncidentEndOffsetsInRoutes");
    v55 = -[GEORoute incidentEndOffsetsInRoutesCount](self, "incidentEndOffsetsInRoutesCount");
    if (v55)
    {
      v56 = v55;
      for (i3 = 0; i3 != v56; ++i3)
        objc_msgSend(v107, "addIncidentEndOffsetsInRoute:", -[GEORoute incidentEndOffsetsInRouteAtIndex:](self, "incidentEndOffsetsInRouteAtIndex:", i3));
    }
  }
  if (-[GEORoute incidentOnRouteInfosCount](self, "incidentOnRouteInfosCount"))
  {
    objc_msgSend(v107, "clearIncidentOnRouteInfos");
    v58 = -[GEORoute incidentOnRouteInfosCount](self, "incidentOnRouteInfosCount");
    if (v58)
    {
      v59 = v58;
      for (i4 = 0; i4 != v59; ++i4)
      {
        -[GEORoute incidentOnRouteInfoAtIndex:](self, "incidentOnRouteInfoAtIndex:", i4);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v107, "addIncidentOnRouteInfo:", v61);

      }
    }
  }
  if (self->_routePlanningDescription)
    objc_msgSend(v107, "setRoutePlanningDescription:");
  if (-[GEORoute routeDescriptionsCount](self, "routeDescriptionsCount"))
  {
    objc_msgSend(v107, "clearRouteDescriptions");
    v62 = -[GEORoute routeDescriptionsCount](self, "routeDescriptionsCount");
    if (v62)
    {
      v63 = v62;
      for (i5 = 0; i5 != v63; ++i5)
      {
        -[GEORoute routeDescriptionAtIndex:](self, "routeDescriptionAtIndex:", i5);
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v107, "addRouteDescription:", v65);

      }
    }
  }
  if (-[GEORoute startingRouteInstructionsCount](self, "startingRouteInstructionsCount"))
  {
    objc_msgSend(v107, "clearStartingRouteInstructions");
    v66 = -[GEORoute startingRouteInstructionsCount](self, "startingRouteInstructionsCount");
    if (v66)
    {
      v67 = v66;
      for (i6 = 0; i6 != v67; ++i6)
      {
        -[GEORoute startingRouteInstructionAtIndex:](self, "startingRouteInstructionAtIndex:", i6);
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v107, "addStartingRouteInstruction:", v69);

      }
    }
  }
  if (-[GEORoute endingRouteInstructionsCount](self, "endingRouteInstructionsCount"))
  {
    objc_msgSend(v107, "clearEndingRouteInstructions");
    v70 = -[GEORoute endingRouteInstructionsCount](self, "endingRouteInstructionsCount");
    if (v70)
    {
      v71 = v70;
      for (i7 = 0; i7 != v71; ++i7)
      {
        -[GEORoute endingRouteInstructionAtIndex:](self, "endingRouteInstructionAtIndex:", i7);
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v107, "addEndingRouteInstruction:", v73);

      }
    }
  }
  if (self->_trafficDescription)
    objc_msgSend(v107, "setTrafficDescription:");
  if (self->_trafficDescriptionLong)
    objc_msgSend(v107, "setTrafficDescriptionLong:");
  if (self->_alertNonRecommendedRouteText)
    objc_msgSend(v107, "setAlertNonRecommendedRouteText:");
  if (-[GEORoute guidanceEventsCount](self, "guidanceEventsCount"))
  {
    objc_msgSend(v107, "clearGuidanceEvents");
    v74 = -[GEORoute guidanceEventsCount](self, "guidanceEventsCount");
    if (v74)
    {
      v75 = v74;
      for (i8 = 0; i8 != v75; ++i8)
      {
        -[GEORoute guidanceEventAtIndex:](self, "guidanceEventAtIndex:", i8);
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v107, "addGuidanceEvent:", v77);

      }
    }
  }
  if (self->_launchAndGoCardText)
    objc_msgSend(v107, "setLaunchAndGoCardText:");
  if (-[GEORoute roadComplexitysCount](self, "roadComplexitysCount"))
  {
    objc_msgSend(v107, "clearRoadComplexitys");
    v78 = -[GEORoute roadComplexitysCount](self, "roadComplexitysCount");
    if (v78)
    {
      v79 = v78;
      for (i9 = 0; i9 != v79; ++i9)
      {
        -[GEORoute roadComplexityAtIndex:](self, "roadComplexityAtIndex:", i9);
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v107, "addRoadComplexity:", v81);

      }
    }
  }
  if (-[GEORoute laneWidthsCount](self, "laneWidthsCount"))
  {
    objc_msgSend(v107, "clearLaneWidths");
    v82 = -[GEORoute laneWidthsCount](self, "laneWidthsCount");
    if (v82)
    {
      v83 = v82;
      for (i10 = 0; i10 != v83; ++i10)
      {
        -[GEORoute laneWidthAtIndex:](self, "laneWidthAtIndex:", i10);
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v107, "addLaneWidth:", v85);

      }
    }
  }
  if (self->_elevationProfile)
    objc_msgSend(v107, "setElevationProfile:");
  if ((*(_QWORD *)&self->_flags & 2) != 0)
  {
    *((_DWORD *)v107 + 126) = self->_arrivalParameterIndex;
    *(_QWORD *)(v107 + 564) |= 2uLL;
  }
  if (-[GEORoute restrictedZoneIdsCount](self, "restrictedZoneIdsCount"))
  {
    objc_msgSend(v107, "clearRestrictedZoneIds");
    v86 = -[GEORoute restrictedZoneIdsCount](self, "restrictedZoneIdsCount");
    if (v86)
    {
      v87 = v86;
      for (i11 = 0; i11 != v87; ++i11)
      {
        -[GEORoute restrictedZoneIdsAtIndex:](self, "restrictedZoneIdsAtIndex:", i11);
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v107, "addRestrictedZoneIds:", v89);

      }
    }
  }
  v90 = &self->_flags;
  v91 = (uint64_t)self->_flags;
  if ((v91 & 0x100) == 0)
  {
    if ((v91 & 0x20) == 0)
      goto LABEL_146;
LABEL_180:
    *((_DWORD *)v107 + 130) = self->_environmentalCongestionZoneImpact;
    *(_QWORD *)(v107 + 564) |= 0x20uLL;
    if ((*(_QWORD *)&self->_flags & 0x800) == 0)
      goto LABEL_148;
    goto LABEL_147;
  }
  *((_DWORD *)v107 + 133) = self->_licensePlateRestrictionImpact;
  *(_QWORD *)(v107 + 564) |= 0x100uLL;
  v91 = *(_QWORD *)v90;
  if ((*(_QWORD *)v90 & 0x20) != 0)
    goto LABEL_180;
LABEL_146:
  if ((v91 & 0x800) != 0)
  {
LABEL_147:
    *((_DWORD *)v107 + 136) = self->_tollCongestionZoneImpact;
    *(_QWORD *)(v107 + 564) |= 0x800uLL;
  }
LABEL_148:
  if (-[GEORoute stepGroupsCount](self, "stepGroupsCount"))
  {
    objc_msgSend(v107, "clearStepGroups");
    v92 = -[GEORoute stepGroupsCount](self, "stepGroupsCount");
    if (v92)
    {
      v93 = v92;
      for (i12 = 0; i12 != v93; ++i12)
      {
        -[GEORoute stepGroupAtIndex:](self, "stepGroupAtIndex:", i12);
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v107, "addStepGroup:", v95);

      }
    }
  }
  if (-[GEORoute updateLocationsCount](self, "updateLocationsCount"))
  {
    objc_msgSend(v107, "clearUpdateLocations");
    v96 = -[GEORoute updateLocationsCount](self, "updateLocationsCount");
    if (v96)
    {
      v97 = v96;
      for (i13 = 0; i13 != v97; ++i13)
      {
        -[GEORoute updateLocationAtIndex:](self, "updateLocationAtIndex:", i13);
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v107, "addUpdateLocation:", v99);

      }
    }
  }
  if (self->_originWaypointInfo)
    objc_msgSend(v107, "setOriginWaypointInfo:");
  if (self->_destinationWaypointInfo)
    objc_msgSend(v107, "setDestinationWaypointInfo:");
  if (-[GEORoute cellularCoveragesCount](self, "cellularCoveragesCount"))
  {
    objc_msgSend(v107, "clearCellularCoverages");
    v100 = -[GEORoute cellularCoveragesCount](self, "cellularCoveragesCount");
    if (v100)
    {
      v101 = v100;
      for (i14 = 0; i14 != v101; ++i14)
        objc_msgSend(v107, "addCellularCoverage:", -[GEORoute cellularCoverageAtIndex:](self, "cellularCoverageAtIndex:", i14));
    }
  }
  if (-[GEORoute cellularCoverageOffsetsCount](self, "cellularCoverageOffsetsCount"))
  {
    objc_msgSend(v107, "clearCellularCoverageOffsets");
    v103 = -[GEORoute cellularCoverageOffsetsCount](self, "cellularCoverageOffsetsCount");
    if (v103)
    {
      v104 = v103;
      for (i15 = 0; i15 != v104; ++i15)
        objc_msgSend(v107, "addCellularCoverageOffset:", -[GEORoute cellularCoverageOffsetAtIndex:](self, "cellularCoverageOffsetAtIndex:", i15));
    }
  }
  if (self->_originListInstruction)
    objc_msgSend(v107, "setOriginListInstruction:");
  v106 = v107;
  if (self->_destinationListInstruction)
  {
    objc_msgSend(v107, "setDestinationListInstruction:");
    v106 = v107;
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
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t flags;
  uint64_t v19;
  void *v20;
  NSMutableArray *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  NSMutableArray *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  id v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  NSMutableArray *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  NSMutableArray *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  NSMutableArray *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  NSMutableArray *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  NSMutableArray *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  id v64;
  void *v65;
  id v66;
  void *v67;
  id v68;
  void *v69;
  $581651A3999351CF43A2CF8B014366CB *p_flags;
  uint64_t v71;
  NSMutableArray *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  uint64_t v77;
  void *v78;
  NSMutableArray *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  id v84;
  void *v85;
  NSMutableArray *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  NSMutableArray *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  void *v95;
  NSMutableArray *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  void *v100;
  uint64_t v101;
  void *v102;
  uint64_t v103;
  void *v104;
  id v105;
  void *v106;
  NSMutableArray *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  void *v111;
  id v112;
  void *v113;
  NSMutableArray *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  void *v118;
  NSMutableArray *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  void *v123;
  id v124;
  void *v125;
  NSMutableArray *v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  void *v130;
  $581651A3999351CF43A2CF8B014366CB *v131;
  uint64_t v132;
  NSMutableArray *v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  void *v137;
  NSMutableArray *v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  void *v142;
  id v143;
  void *v144;
  id v145;
  void *v146;
  id v147;
  void *v148;
  id v149;
  void *v150;
  id v151;
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
  __int128 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  __int128 v188;
  __int128 v189;
  __int128 v190;
  __int128 v191;
  __int128 v192;
  __int128 v193;
  __int128 v194;
  __int128 v195;
  __int128 v196;
  __int128 v197;
  __int128 v198;
  __int128 v199;
  __int128 v200;
  __int128 v201;
  __int128 v202;
  __int128 v203;
  __int128 v204;
  __int128 v205;
  __int128 v206;
  __int128 v207;
  __int128 v208;
  __int128 v209;
  __int128 v210;
  __int128 v211;
  __int128 v212;
  __int128 v213;
  __int128 v214;
  __int128 v215;
  __int128 v216;
  __int128 v217;
  __int128 v218;
  __int128 v219;
  __int128 v220;
  __int128 v221;
  __int128 v222;
  __int128 v223;
  __int128 v224;
  __int128 v225;
  __int128 v226;
  __int128 v227;
  __int128 v228;
  _BYTE v229[128];
  _BYTE v230[128];
  _BYTE v231[128];
  _BYTE v232[128];
  _BYTE v233[128];
  _BYTE v234[128];
  _BYTE v235[128];
  _BYTE v236[128];
  _BYTE v237[128];
  _BYTE v238[128];
  _BYTE v239[128];
  _BYTE v240[128];
  _BYTE v241[128];
  _BYTE v242[128];
  _BYTE v243[128];
  _BYTE v244[128];
  _BYTE v245[128];
  _BYTE v246[128];
  _BYTE v247[128];
  uint64_t v248;

  v248 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*((_BYTE *)&self->_flags + 8) & 2) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEORouteReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_168;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEORoute readAll:](self, "readAll:", 0);
  if ((*(_QWORD *)&self->_flags & 0x1000) != 0)
  {
    *(_DWORD *)(v5 + 548) = self->_transportType;
    *(_QWORD *)(v5 + 564) |= 0x1000uLL;
  }
  v228 = 0u;
  v227 = 0u;
  v226 = 0u;
  v225 = 0u;
  v9 = self->_steps;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v225, v247, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v226;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v226 != v11)
          objc_enumerationMutation(v9);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v225 + 1) + 8 * v12), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addStep:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v225, v247, 16);
    }
    while (v10);
  }

  v14 = -[NSString copyWithZone:](self->_name, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 296);
  *(_QWORD *)(v5 + 296) = v14;

  v16 = -[NSString copyWithZone:](self->_phoneticName, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 336);
  *(_QWORD *)(v5 + 336) = v16;

  flags = (uint64_t)self->_flags;
  if ((flags & 8) != 0)
  {
    *(_DWORD *)(v5 + 512) = self->_distance;
    *(_QWORD *)(v5 + 564) |= 8uLL;
    flags = (uint64_t)self->_flags;
  }
  if ((flags & 0x40) != 0)
  {
    *(_DWORD *)(v5 + 524) = self->_expectedTime;
    *(_QWORD *)(v5 + 564) |= 0x40uLL;
  }
  v19 = -[NSData copyWithZone:](self->_routeID, "copyWithZone:", a3);
  v20 = *(void **)(v5 + 360);
  *(_QWORD *)(v5 + 360) = v19;

  if ((*(_QWORD *)&self->_flags & 0x200) != 0)
  {
    *(_DWORD *)(v5 + 536) = self->_routeType;
    *(_QWORD *)(v5 + 564) |= 0x200uLL;
  }
  v224 = 0u;
  v223 = 0u;
  v222 = 0u;
  v221 = 0u;
  v21 = self->_zilchPoints;
  v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v221, v246, 16);
  if (v22)
  {
    v23 = *(_QWORD *)v222;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v222 != v23)
          objc_enumerationMutation(v21);
        v25 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v221 + 1) + 8 * v24), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addZilchPoints:", v25);

        ++v24;
      }
      while (v22 != v24);
      v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v221, v246, 16);
    }
    while (v22);
  }

  v220 = 0u;
  v219 = 0u;
  v218 = 0u;
  v217 = 0u;
  v26 = self->_basicPoints;
  v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v217, v245, 16);
  if (v27)
  {
    v28 = *(_QWORD *)v218;
    do
    {
      v29 = 0;
      do
      {
        if (*(_QWORD *)v218 != v28)
          objc_enumerationMutation(v26);
        v30 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v217 + 1) + 8 * v29), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addBasicPoints:", v30);

        ++v29;
      }
      while (v27 != v29);
      v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v217, v245, 16);
    }
    while (v27);
  }

  v31 = -[NSData copyWithZone:](self->_pathLeg, "copyWithZone:", a3);
  v32 = *(void **)(v5 + 320);
  *(_QWORD *)(v5 + 320) = v31;

  v33 = -[GEOPathMapMatcherInstructions copyWithZone:](self->_pathMapMatcherInstructions, "copyWithZone:", a3);
  v34 = *(void **)(v5 + 328);
  *(_QWORD *)(v5 + 328) = v33;

  if ((*(_QWORD *)&self->_flags & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 516) = self->_drivingSide;
    *(_QWORD *)(v5 + 564) |= 0x10uLL;
  }
  v35 = -[NSData copyWithZone:](self->_departureRouteID, "copyWithZone:", a3);
  v36 = *(void **)(v5 + 208);
  *(_QWORD *)(v5 + 208) = v35;

  if ((*(_QWORD *)&self->_flags & 4) != 0)
  {
    *(_DWORD *)(v5 + 508) = self->_departureStepID;
    *(_QWORD *)(v5 + 564) |= 4uLL;
  }
  v37 = -[NSData copyWithZone:](self->_arrivalRouteID, "copyWithZone:", a3);
  v38 = *(void **)(v5 + 184);
  *(_QWORD *)(v5 + 184) = v37;

  if ((*(_QWORD *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 500) = self->_arrivalStepID;
    *(_QWORD *)(v5 + 564) |= 1uLL;
  }
  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  v215 = 0u;
  v216 = 0u;
  v213 = 0u;
  v214 = 0u;
  v39 = self->_routeLineStyleInfos;
  v40 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v39, "countByEnumeratingWithState:objects:count:", &v213, v244, 16);
  if (v40)
  {
    v41 = *(_QWORD *)v214;
    do
    {
      v42 = 0;
      do
      {
        if (*(_QWORD *)v214 != v41)
          objc_enumerationMutation(v39);
        v43 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v213 + 1) + 8 * v42), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addRouteLineStyleInfo:", v43);

        ++v42;
      }
      while (v40 != v42);
      v40 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v39, "countByEnumeratingWithState:objects:count:", &v213, v244, 16);
    }
    while (v40);
  }

  v211 = 0u;
  v212 = 0u;
  v209 = 0u;
  v210 = 0u;
  v44 = self->_routeCameraInputInfos;
  v45 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v44, "countByEnumeratingWithState:objects:count:", &v209, v243, 16);
  if (v45)
  {
    v46 = *(_QWORD *)v210;
    do
    {
      v47 = 0;
      do
      {
        if (*(_QWORD *)v210 != v46)
          objc_enumerationMutation(v44);
        v48 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v209 + 1) + 8 * v47), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addRouteCameraInputInfo:", v48);

        ++v47;
      }
      while (v45 != v47);
      v45 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v44, "countByEnumeratingWithState:objects:count:", &v209, v243, 16);
    }
    while (v45);
  }

  v207 = 0u;
  v208 = 0u;
  v205 = 0u;
  v206 = 0u;
  v49 = self->_trafficColorInfos;
  v50 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v49, "countByEnumeratingWithState:objects:count:", &v205, v242, 16);
  if (v50)
  {
    v51 = *(_QWORD *)v206;
    do
    {
      v52 = 0;
      do
      {
        if (*(_QWORD *)v206 != v51)
          objc_enumerationMutation(v49);
        v53 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v205 + 1) + 8 * v52), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addTrafficColorInfo:", v53);

        ++v52;
      }
      while (v50 != v52);
      v50 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v49, "countByEnumeratingWithState:objects:count:", &v205, v242, 16);
    }
    while (v50);
  }

  v203 = 0u;
  v204 = 0u;
  v201 = 0u;
  v202 = 0u;
  v54 = self->_routeNames;
  v55 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v54, "countByEnumeratingWithState:objects:count:", &v201, v241, 16);
  if (v55)
  {
    v56 = *(_QWORD *)v202;
    do
    {
      v57 = 0;
      do
      {
        if (*(_QWORD *)v202 != v56)
          objc_enumerationMutation(v54);
        v58 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v201 + 1) + 8 * v57), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addRouteName:", v58);

        ++v57;
      }
      while (v55 != v57);
      v55 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v54, "countByEnumeratingWithState:objects:count:", &v201, v241, 16);
    }
    while (v55);
  }

  if ((*(_QWORD *)&self->_flags & 0x80) != 0)
  {
    *(_DWORD *)(v5 + 528) = self->_historicTravelTime;
    *(_QWORD *)(v5 + 564) |= 0x80uLL;
  }
  v199 = 0u;
  v200 = 0u;
  v197 = 0u;
  v198 = 0u;
  v59 = self->_advisoryNotices;
  v60 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v59, "countByEnumeratingWithState:objects:count:", &v197, v240, 16);
  if (v60)
  {
    v61 = *(_QWORD *)v198;
    do
    {
      v62 = 0;
      do
      {
        if (*(_QWORD *)v198 != v61)
          objc_enumerationMutation(v59);
        v63 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v197 + 1) + 8 * v62), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addAdvisoryNotice:", v63);

        ++v62;
      }
      while (v60 != v62);
      v60 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v59, "countByEnumeratingWithState:objects:count:", &v197, v240, 16);
    }
    while (v60);
  }

  v64 = -[GEOFormattedString copyWithZone:](self->_routeLabelDetailText, "copyWithZone:", a3);
  v65 = *(void **)(v5 + 392);
  *(_QWORD *)(v5 + 392) = v64;

  v66 = -[GEOFormattedString copyWithZone:](self->_infrastructureDescription, "copyWithZone:", a3);
  v67 = *(void **)(v5 + 272);
  *(_QWORD *)(v5 + 272) = v66;

  v68 = -[GEOClickableAdvisory copyWithZone:](self->_clickableAdvisory, "copyWithZone:", a3);
  v69 = *(void **)(v5 + 200);
  *(_QWORD *)(v5 + 200) = v68;

  p_flags = &self->_flags;
  v71 = (uint64_t)self->_flags;
  if ((v71 & 0x2000) != 0)
  {
    *(_DWORD *)(v5 + 552) = self->_travelTimeAggressiveEstimate;
    *(_QWORD *)(v5 + 564) |= 0x2000uLL;
    v71 = *(_QWORD *)p_flags;
    if ((*(_QWORD *)p_flags & 0x4000) == 0)
    {
LABEL_79:
      if ((v71 & 0x400) == 0)
        goto LABEL_80;
      goto LABEL_171;
    }
  }
  else if ((v71 & 0x4000) == 0)
  {
    goto LABEL_79;
  }
  *(_DWORD *)(v5 + 556) = self->_travelTimeConservativeEstimate;
  *(_QWORD *)(v5 + 564) |= 0x4000uLL;
  v71 = (uint64_t)self->_flags;
  if ((v71 & 0x400) == 0)
  {
LABEL_80:
    if ((v71 & 0x10000) == 0)
      goto LABEL_81;
    goto LABEL_172;
  }
LABEL_171:
  *(_DWORD *)(v5 + 540) = self->_staticTravelTime;
  *(_QWORD *)(v5 + 564) |= 0x400uLL;
  v71 = (uint64_t)self->_flags;
  if ((v71 & 0x10000) == 0)
  {
LABEL_81:
    if ((v71 & 0x8000) == 0)
      goto LABEL_82;
    goto LABEL_173;
  }
LABEL_172:
  *(_BYTE *)(v5 + 561) = self->_avoidsTolls;
  *(_QWORD *)(v5 + 564) |= 0x10000uLL;
  v71 = (uint64_t)self->_flags;
  if ((v71 & 0x8000) == 0)
  {
LABEL_82:
    if ((v71 & 0x20000) == 0)
      goto LABEL_84;
    goto LABEL_83;
  }
LABEL_173:
  *(_BYTE *)(v5 + 560) = self->_avoidsHighways;
  *(_QWORD *)(v5 + 564) |= 0x8000uLL;
  if ((*(_QWORD *)&self->_flags & 0x20000) != 0)
  {
LABEL_83:
    *(_BYTE *)(v5 + 562) = self->_avoidsTraffic;
    *(_QWORD *)(v5 + 564) |= 0x20000uLL;
  }
LABEL_84:
  v195 = 0u;
  v196 = 0u;
  v193 = 0u;
  v194 = 0u;
  v72 = self->_enrouteNotices;
  v73 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v72, "countByEnumeratingWithState:objects:count:", &v193, v239, 16);
  if (v73)
  {
    v74 = *(_QWORD *)v194;
    do
    {
      v75 = 0;
      do
      {
        if (*(_QWORD *)v194 != v74)
          objc_enumerationMutation(v72);
        v76 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v193 + 1) + 8 * v75), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addEnrouteNotice:", v76);

        ++v75;
      }
      while (v73 != v75);
      v73 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v72, "countByEnumeratingWithState:objects:count:", &v193, v239, 16);
    }
    while (v73);
  }

  v77 = -[NSData copyWithZone:](self->_unpackedLatLngVertices, "copyWithZone:", a3);
  v78 = *(void **)(v5 + 464);
  *(_QWORD *)(v5 + 464) = v77;

  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  v191 = 0u;
  v192 = 0u;
  v189 = 0u;
  v190 = 0u;
  v79 = self->_incidentOnRouteInfos;
  v80 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v79, "countByEnumeratingWithState:objects:count:", &v189, v238, 16);
  if (v80)
  {
    v81 = *(_QWORD *)v190;
    do
    {
      v82 = 0;
      do
      {
        if (*(_QWORD *)v190 != v81)
          objc_enumerationMutation(v79);
        v83 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v189 + 1) + 8 * v82), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addIncidentOnRouteInfo:", v83);

        ++v82;
      }
      while (v80 != v82);
      v80 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v79, "countByEnumeratingWithState:objects:count:", &v189, v238, 16);
    }
    while (v80);
  }

  v84 = -[GEORouteInformation copyWithZone:](self->_routePlanningDescription, "copyWithZone:", a3);
  v85 = *(void **)(v5 + 408);
  *(_QWORD *)(v5 + 408) = v84;

  v187 = 0u;
  v188 = 0u;
  v185 = 0u;
  v186 = 0u;
  v86 = self->_routeDescriptions;
  v87 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v86, "countByEnumeratingWithState:objects:count:", &v185, v237, 16);
  if (v87)
  {
    v88 = *(_QWORD *)v186;
    do
    {
      v89 = 0;
      do
      {
        if (*(_QWORD *)v186 != v88)
          objc_enumerationMutation(v86);
        v90 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v185 + 1) + 8 * v89), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addRouteDescription:", v90);

        ++v89;
      }
      while (v87 != v89);
      v87 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v86, "countByEnumeratingWithState:objects:count:", &v185, v237, 16);
    }
    while (v87);
  }

  v183 = 0u;
  v184 = 0u;
  v181 = 0u;
  v182 = 0u;
  v91 = self->_startingRouteInstructions;
  v92 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v91, "countByEnumeratingWithState:objects:count:", &v181, v236, 16);
  if (v92)
  {
    v93 = *(_QWORD *)v182;
    do
    {
      v94 = 0;
      do
      {
        if (*(_QWORD *)v182 != v93)
          objc_enumerationMutation(v91);
        v95 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v181 + 1) + 8 * v94), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addStartingRouteInstruction:", v95);

        ++v94;
      }
      while (v92 != v94);
      v92 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v91, "countByEnumeratingWithState:objects:count:", &v181, v236, 16);
    }
    while (v92);
  }

  v179 = 0u;
  v180 = 0u;
  v177 = 0u;
  v178 = 0u;
  v96 = self->_endingRouteInstructions;
  v97 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v96, "countByEnumeratingWithState:objects:count:", &v177, v235, 16);
  if (v97)
  {
    v98 = *(_QWORD *)v178;
    do
    {
      v99 = 0;
      do
      {
        if (*(_QWORD *)v178 != v98)
          objc_enumerationMutation(v96);
        v100 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v177 + 1) + 8 * v99), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addEndingRouteInstruction:", v100);

        ++v99;
      }
      while (v97 != v99);
      v97 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v96, "countByEnumeratingWithState:objects:count:", &v177, v235, 16);
    }
    while (v97);
  }

  v101 = -[NSString copyWithZone:](self->_trafficDescription, "copyWithZone:", a3);
  v102 = *(void **)(v5 + 456);
  *(_QWORD *)(v5 + 456) = v101;

  v103 = -[NSString copyWithZone:](self->_trafficDescriptionLong, "copyWithZone:", a3);
  v104 = *(void **)(v5 + 448);
  *(_QWORD *)(v5 + 448) = v103;

  v105 = -[GEOAlertNonRecommendedRouteText copyWithZone:](self->_alertNonRecommendedRouteText, "copyWithZone:", a3);
  v106 = *(void **)(v5 + 176);
  *(_QWORD *)(v5 + 176) = v105;

  v175 = 0u;
  v176 = 0u;
  v173 = 0u;
  v174 = 0u;
  v107 = self->_guidanceEvents;
  v108 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v107, "countByEnumeratingWithState:objects:count:", &v173, v234, 16);
  if (v108)
  {
    v109 = *(_QWORD *)v174;
    do
    {
      v110 = 0;
      do
      {
        if (*(_QWORD *)v174 != v109)
          objc_enumerationMutation(v107);
        v111 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v173 + 1) + 8 * v110), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addGuidanceEvent:", v111);

        ++v110;
      }
      while (v108 != v110);
      v108 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v107, "countByEnumeratingWithState:objects:count:", &v173, v234, 16);
    }
    while (v108);
  }

  v112 = -[GEOLaunchAndGoCardText copyWithZone:](self->_launchAndGoCardText, "copyWithZone:", a3);
  v113 = *(void **)(v5 + 288);
  *(_QWORD *)(v5 + 288) = v112;

  v171 = 0u;
  v172 = 0u;
  v169 = 0u;
  v170 = 0u;
  v114 = self->_roadComplexitys;
  v115 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v114, "countByEnumeratingWithState:objects:count:", &v169, v233, 16);
  if (v115)
  {
    v116 = *(_QWORD *)v170;
    do
    {
      v117 = 0;
      do
      {
        if (*(_QWORD *)v170 != v116)
          objc_enumerationMutation(v114);
        v118 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v169 + 1) + 8 * v117), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addRoadComplexity:", v118);

        ++v117;
      }
      while (v115 != v117);
      v115 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v114, "countByEnumeratingWithState:objects:count:", &v169, v233, 16);
    }
    while (v115);
  }

  v167 = 0u;
  v168 = 0u;
  v165 = 0u;
  v166 = 0u;
  v119 = self->_laneWidths;
  v120 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v119, "countByEnumeratingWithState:objects:count:", &v165, v232, 16);
  if (v120)
  {
    v121 = *(_QWORD *)v166;
    do
    {
      v122 = 0;
      do
      {
        if (*(_QWORD *)v166 != v121)
          objc_enumerationMutation(v119);
        v123 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v165 + 1) + 8 * v122), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addLaneWidth:", v123);

        ++v122;
      }
      while (v120 != v122);
      v120 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v119, "countByEnumeratingWithState:objects:count:", &v165, v232, 16);
    }
    while (v120);
  }

  v124 = -[GEOElevationProfile copyWithZone:](self->_elevationProfile, "copyWithZone:", a3);
  v125 = *(void **)(v5 + 232);
  *(_QWORD *)(v5 + 232) = v124;

  if ((*(_QWORD *)&self->_flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 504) = self->_arrivalParameterIndex;
    *(_QWORD *)(v5 + 564) |= 2uLL;
  }
  v163 = 0u;
  v164 = 0u;
  v161 = 0u;
  v162 = 0u;
  v126 = self->_restrictedZoneIds;
  v127 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v126, "countByEnumeratingWithState:objects:count:", &v161, v231, 16);
  if (v127)
  {
    v128 = *(_QWORD *)v162;
    do
    {
      v129 = 0;
      do
      {
        if (*(_QWORD *)v162 != v128)
          objc_enumerationMutation(v126);
        v130 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v161 + 1) + 8 * v129), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addRestrictedZoneIds:", v130);

        ++v129;
      }
      while (v127 != v129);
      v127 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v126, "countByEnumeratingWithState:objects:count:", &v161, v231, 16);
    }
    while (v127);
  }

  v131 = &self->_flags;
  v132 = (uint64_t)self->_flags;
  if ((v132 & 0x100) == 0)
  {
    if ((v132 & 0x20) == 0)
      goto LABEL_151;
LABEL_176:
    *(_DWORD *)(v5 + 520) = self->_environmentalCongestionZoneImpact;
    *(_QWORD *)(v5 + 564) |= 0x20uLL;
    if ((*(_QWORD *)&self->_flags & 0x800) == 0)
      goto LABEL_153;
    goto LABEL_152;
  }
  *(_DWORD *)(v5 + 532) = self->_licensePlateRestrictionImpact;
  *(_QWORD *)(v5 + 564) |= 0x100uLL;
  v132 = *(_QWORD *)v131;
  if ((*(_QWORD *)v131 & 0x20) != 0)
    goto LABEL_176;
LABEL_151:
  if ((v132 & 0x800) != 0)
  {
LABEL_152:
    *(_DWORD *)(v5 + 544) = self->_tollCongestionZoneImpact;
    *(_QWORD *)(v5 + 564) |= 0x800uLL;
  }
LABEL_153:
  v159 = 0u;
  v160 = 0u;
  v157 = 0u;
  v158 = 0u;
  v133 = self->_stepGroups;
  v134 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v133, "countByEnumeratingWithState:objects:count:", &v157, v230, 16);
  if (v134)
  {
    v135 = *(_QWORD *)v158;
    do
    {
      v136 = 0;
      do
      {
        if (*(_QWORD *)v158 != v135)
          objc_enumerationMutation(v133);
        v137 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v157 + 1) + 8 * v136), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addStepGroup:", v137);

        ++v136;
      }
      while (v134 != v136);
      v134 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v133, "countByEnumeratingWithState:objects:count:", &v157, v230, 16);
    }
    while (v134);
  }

  v155 = 0u;
  v156 = 0u;
  v153 = 0u;
  v154 = 0u;
  v138 = self->_updateLocations;
  v139 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v138, "countByEnumeratingWithState:objects:count:", &v153, v229, 16);
  if (v139)
  {
    v140 = *(_QWORD *)v154;
    do
    {
      v141 = 0;
      do
      {
        if (*(_QWORD *)v154 != v140)
          objc_enumerationMutation(v138);
        v142 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v153 + 1) + 8 * v141), "copyWithZone:", a3, (_QWORD)v153);
        objc_msgSend((id)v5, "addUpdateLocation:", v142);

        ++v141;
      }
      while (v139 != v141);
      v139 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v138, "countByEnumeratingWithState:objects:count:", &v153, v229, 16);
    }
    while (v139);
  }

  v143 = -[GEOWaypointInfo copyWithZone:](self->_originWaypointInfo, "copyWithZone:", a3);
  v144 = *(void **)(v5 + 312);
  *(_QWORD *)(v5 + 312) = v143;

  v145 = -[GEOWaypointInfo copyWithZone:](self->_destinationWaypointInfo, "copyWithZone:", a3);
  v146 = *(void **)(v5 + 224);
  *(_QWORD *)(v5 + 224) = v145;

  PBRepeatedInt32Copy();
  PBRepeatedUInt32Copy();
  v147 = -[GEODrivingWalkingInstruction copyWithZone:](self->_originListInstruction, "copyWithZone:", a3);
  v148 = *(void **)(v5 + 304);
  *(_QWORD *)(v5 + 304) = v147;

  v149 = -[GEODrivingWalkingInstruction copyWithZone:](self->_destinationListInstruction, "copyWithZone:", a3);
  v150 = *(void **)(v5 + 216);
  *(_QWORD *)(v5 + 216) = v149;

  objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
  v151 = (id)v5;
LABEL_168:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  char *v4;
  uint64_t v5;
  NSMutableArray *steps;
  NSString *name;
  NSString *phoneticName;
  uint64_t flags;
  uint64_t v10;
  NSData *routeID;
  NSMutableArray *zilchPoints;
  NSMutableArray *basicPoints;
  NSData *pathLeg;
  GEOPathMapMatcherInstructions *pathMapMatcherInstructions;
  uint64_t v16;
  uint64_t v17;
  NSData *departureRouteID;
  NSData *arrivalRouteID;
  NSMutableArray *routeLineStyleInfos;
  NSMutableArray *routeCameraInputInfos;
  NSMutableArray *trafficColorInfos;
  NSMutableArray *routeNames;
  uint64_t v24;
  NSMutableArray *advisoryNotices;
  GEOFormattedString *routeLabelDetailText;
  GEOFormattedString *infrastructureDescription;
  GEOClickableAdvisory *clickableAdvisory;
  uint64_t v29;
  uint64_t v30;
  NSMutableArray *enrouteNotices;
  NSData *unpackedLatLngVertices;
  NSMutableArray *incidentOnRouteInfos;
  GEORouteInformation *routePlanningDescription;
  NSMutableArray *routeDescriptions;
  NSMutableArray *startingRouteInstructions;
  NSMutableArray *endingRouteInstructions;
  NSString *trafficDescription;
  NSString *trafficDescriptionLong;
  GEOAlertNonRecommendedRouteText *alertNonRecommendedRouteText;
  NSMutableArray *guidanceEvents;
  GEOLaunchAndGoCardText *launchAndGoCardText;
  NSMutableArray *roadComplexitys;
  NSMutableArray *laneWidths;
  GEOElevationProfile *elevationProfile;
  uint64_t v46;
  uint64_t v47;
  NSMutableArray *restrictedZoneIds;
  NSMutableArray *stepGroups;
  NSMutableArray *updateLocations;
  GEOWaypointInfo *originWaypointInfo;
  GEOWaypointInfo *destinationWaypointInfo;
  GEODrivingWalkingInstruction *originListInstruction;
  GEODrivingWalkingInstruction *destinationListInstruction;
  char v55;

  v4 = (char *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_191;
  -[GEORoute readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  v5 = *(_QWORD *)(v4 + 564);
  if ((*(_QWORD *)&self->_flags & 0x1000) != 0)
  {
    if ((v5 & 0x1000) == 0 || self->_transportType != *((_DWORD *)v4 + 137))
      goto LABEL_191;
  }
  else if ((v5 & 0x1000) != 0)
  {
    goto LABEL_191;
  }
  steps = self->_steps;
  if ((unint64_t)steps | *((_QWORD *)v4 + 54) && !-[NSMutableArray isEqual:](steps, "isEqual:"))
    goto LABEL_191;
  name = self->_name;
  if ((unint64_t)name | *((_QWORD *)v4 + 37))
  {
    if (!-[NSString isEqual:](name, "isEqual:"))
      goto LABEL_191;
  }
  phoneticName = self->_phoneticName;
  if ((unint64_t)phoneticName | *((_QWORD *)v4 + 42))
  {
    if (!-[NSString isEqual:](phoneticName, "isEqual:"))
      goto LABEL_191;
  }
  flags = (uint64_t)self->_flags;
  v10 = *(_QWORD *)(v4 + 564);
  if ((flags & 8) != 0)
  {
    if ((v10 & 8) == 0 || self->_distance != *((_DWORD *)v4 + 128))
      goto LABEL_191;
  }
  else if ((v10 & 8) != 0)
  {
    goto LABEL_191;
  }
  if ((flags & 0x40) != 0)
  {
    if ((v10 & 0x40) == 0 || self->_expectedTime != *((_DWORD *)v4 + 131))
      goto LABEL_191;
  }
  else if ((v10 & 0x40) != 0)
  {
    goto LABEL_191;
  }
  routeID = self->_routeID;
  if ((unint64_t)routeID | *((_QWORD *)v4 + 45))
  {
    if (!-[NSData isEqual:](routeID, "isEqual:"))
      goto LABEL_191;
    flags = (uint64_t)self->_flags;
    v10 = *(_QWORD *)(v4 + 564);
  }
  if ((flags & 0x200) != 0)
  {
    if ((v10 & 0x200) == 0 || self->_routeType != *((_DWORD *)v4 + 134))
      goto LABEL_191;
  }
  else if ((v10 & 0x200) != 0)
  {
    goto LABEL_191;
  }
  zilchPoints = self->_zilchPoints;
  if ((unint64_t)zilchPoints | *((_QWORD *)v4 + 60)
    && !-[NSMutableArray isEqual:](zilchPoints, "isEqual:"))
  {
    goto LABEL_191;
  }
  basicPoints = self->_basicPoints;
  if ((unint64_t)basicPoints | *((_QWORD *)v4 + 24))
  {
    if (!-[NSMutableArray isEqual:](basicPoints, "isEqual:"))
      goto LABEL_191;
  }
  pathLeg = self->_pathLeg;
  if ((unint64_t)pathLeg | *((_QWORD *)v4 + 40))
  {
    if (!-[NSData isEqual:](pathLeg, "isEqual:"))
      goto LABEL_191;
  }
  pathMapMatcherInstructions = self->_pathMapMatcherInstructions;
  if ((unint64_t)pathMapMatcherInstructions | *((_QWORD *)v4 + 41))
  {
    if (!-[GEOPathMapMatcherInstructions isEqual:](pathMapMatcherInstructions, "isEqual:"))
      goto LABEL_191;
  }
  v16 = (uint64_t)self->_flags;
  v17 = *(_QWORD *)(v4 + 564);
  if ((v16 & 0x10) != 0)
  {
    if ((v17 & 0x10) == 0 || self->_drivingSide != *((_DWORD *)v4 + 129))
      goto LABEL_191;
  }
  else if ((v17 & 0x10) != 0)
  {
    goto LABEL_191;
  }
  departureRouteID = self->_departureRouteID;
  if ((unint64_t)departureRouteID | *((_QWORD *)v4 + 26))
  {
    if (!-[NSData isEqual:](departureRouteID, "isEqual:"))
      goto LABEL_191;
    v16 = (uint64_t)self->_flags;
    v17 = *(_QWORD *)(v4 + 564);
  }
  if ((v16 & 4) != 0)
  {
    if ((v17 & 4) == 0 || self->_departureStepID != *((_DWORD *)v4 + 127))
      goto LABEL_191;
  }
  else if ((v17 & 4) != 0)
  {
    goto LABEL_191;
  }
  arrivalRouteID = self->_arrivalRouteID;
  if ((unint64_t)arrivalRouteID | *((_QWORD *)v4 + 23))
  {
    if (!-[NSData isEqual:](arrivalRouteID, "isEqual:"))
      goto LABEL_191;
    v16 = (uint64_t)self->_flags;
    v17 = *(_QWORD *)(v4 + 564);
  }
  if ((v16 & 1) != 0)
  {
    if ((v17 & 1) == 0 || self->_arrivalStepID != *((_DWORD *)v4 + 125))
      goto LABEL_191;
  }
  else if ((v17 & 1) != 0)
  {
    goto LABEL_191;
  }
  if (!PBRepeatedUInt32IsEqual())
    goto LABEL_191;
  if (!PBRepeatedUInt32IsEqual())
    goto LABEL_191;
  routeLineStyleInfos = self->_routeLineStyleInfos;
  if ((unint64_t)routeLineStyleInfos | *((_QWORD *)v4 + 50))
  {
    if (!-[NSMutableArray isEqual:](routeLineStyleInfos, "isEqual:"))
      goto LABEL_191;
  }
  routeCameraInputInfos = self->_routeCameraInputInfos;
  if ((unint64_t)routeCameraInputInfos | *((_QWORD *)v4 + 47))
  {
    if (!-[NSMutableArray isEqual:](routeCameraInputInfos, "isEqual:"))
      goto LABEL_191;
  }
  trafficColorInfos = self->_trafficColorInfos;
  if ((unint64_t)trafficColorInfos | *((_QWORD *)v4 + 55))
  {
    if (!-[NSMutableArray isEqual:](trafficColorInfos, "isEqual:"))
      goto LABEL_191;
  }
  routeNames = self->_routeNames;
  if ((unint64_t)routeNames | *((_QWORD *)v4 + 46))
  {
    if (!-[NSMutableArray isEqual:](routeNames, "isEqual:"))
      goto LABEL_191;
  }
  v24 = *(_QWORD *)(v4 + 564);
  if ((*(_QWORD *)&self->_flags & 0x80) != 0)
  {
    if ((v24 & 0x80) == 0 || self->_historicTravelTime != *((_DWORD *)v4 + 132))
      goto LABEL_191;
  }
  else if ((v24 & 0x80) != 0)
  {
    goto LABEL_191;
  }
  advisoryNotices = self->_advisoryNotices;
  if ((unint64_t)advisoryNotices | *((_QWORD *)v4 + 21)
    && !-[NSMutableArray isEqual:](advisoryNotices, "isEqual:"))
  {
    goto LABEL_191;
  }
  routeLabelDetailText = self->_routeLabelDetailText;
  if ((unint64_t)routeLabelDetailText | *((_QWORD *)v4 + 49))
  {
    if (!-[GEOFormattedString isEqual:](routeLabelDetailText, "isEqual:"))
      goto LABEL_191;
  }
  infrastructureDescription = self->_infrastructureDescription;
  if ((unint64_t)infrastructureDescription | *((_QWORD *)v4 + 34))
  {
    if (!-[GEOFormattedString isEqual:](infrastructureDescription, "isEqual:"))
      goto LABEL_191;
  }
  clickableAdvisory = self->_clickableAdvisory;
  if ((unint64_t)clickableAdvisory | *((_QWORD *)v4 + 25))
  {
    if (!-[GEOClickableAdvisory isEqual:](clickableAdvisory, "isEqual:"))
      goto LABEL_191;
  }
  v29 = (uint64_t)self->_flags;
  v30 = *(_QWORD *)(v4 + 564);
  if ((v29 & 0x2000) != 0)
  {
    if ((v30 & 0x2000) == 0 || self->_travelTimeAggressiveEstimate != *((_DWORD *)v4 + 138))
      goto LABEL_191;
  }
  else if ((v30 & 0x2000) != 0)
  {
    goto LABEL_191;
  }
  if ((v29 & 0x4000) != 0)
  {
    if ((v30 & 0x4000) == 0 || self->_travelTimeConservativeEstimate != *((_DWORD *)v4 + 139))
      goto LABEL_191;
  }
  else if ((v30 & 0x4000) != 0)
  {
    goto LABEL_191;
  }
  if ((v29 & 0x400) != 0)
  {
    if ((v30 & 0x400) == 0 || self->_staticTravelTime != *((_DWORD *)v4 + 135))
      goto LABEL_191;
  }
  else if ((v30 & 0x400) != 0)
  {
    goto LABEL_191;
  }
  if ((v29 & 0x10000) != 0)
  {
    if ((v30 & 0x10000) == 0)
      goto LABEL_191;
    if (self->_avoidsTolls)
    {
      if (!v4[561])
        goto LABEL_191;
    }
    else if (v4[561])
    {
      goto LABEL_191;
    }
  }
  else if ((v30 & 0x10000) != 0)
  {
    goto LABEL_191;
  }
  if ((v29 & 0x8000) != 0)
  {
    if ((v30 & 0x8000) == 0)
      goto LABEL_191;
    if (self->_avoidsHighways)
    {
      if (!v4[560])
        goto LABEL_191;
    }
    else if (v4[560])
    {
      goto LABEL_191;
    }
  }
  else if ((v30 & 0x8000) != 0)
  {
    goto LABEL_191;
  }
  if ((v29 & 0x20000) != 0)
  {
    if ((v30 & 0x20000) == 0)
      goto LABEL_191;
    if (self->_avoidsTraffic)
    {
      if (!v4[562])
        goto LABEL_191;
    }
    else if (v4[562])
    {
      goto LABEL_191;
    }
  }
  else if ((v30 & 0x20000) != 0)
  {
    goto LABEL_191;
  }
  enrouteNotices = self->_enrouteNotices;
  if ((unint64_t)enrouteNotices | *((_QWORD *)v4 + 31)
    && !-[NSMutableArray isEqual:](enrouteNotices, "isEqual:"))
  {
    goto LABEL_191;
  }
  unpackedLatLngVertices = self->_unpackedLatLngVertices;
  if ((unint64_t)unpackedLatLngVertices | *((_QWORD *)v4 + 58))
  {
    if (!-[NSData isEqual:](unpackedLatLngVertices, "isEqual:"))
      goto LABEL_191;
  }
  if (!PBRepeatedUInt32IsEqual())
    goto LABEL_191;
  if (!PBRepeatedUInt32IsEqual())
    goto LABEL_191;
  incidentOnRouteInfos = self->_incidentOnRouteInfos;
  if ((unint64_t)incidentOnRouteInfos | *((_QWORD *)v4 + 33))
  {
    if (!-[NSMutableArray isEqual:](incidentOnRouteInfos, "isEqual:"))
      goto LABEL_191;
  }
  routePlanningDescription = self->_routePlanningDescription;
  if ((unint64_t)routePlanningDescription | *((_QWORD *)v4 + 51))
  {
    if (!-[GEORouteInformation isEqual:](routePlanningDescription, "isEqual:"))
      goto LABEL_191;
  }
  routeDescriptions = self->_routeDescriptions;
  if ((unint64_t)routeDescriptions | *((_QWORD *)v4 + 48))
  {
    if (!-[NSMutableArray isEqual:](routeDescriptions, "isEqual:"))
      goto LABEL_191;
  }
  startingRouteInstructions = self->_startingRouteInstructions;
  if ((unint64_t)startingRouteInstructions | *((_QWORD *)v4 + 52))
  {
    if (!-[NSMutableArray isEqual:](startingRouteInstructions, "isEqual:"))
      goto LABEL_191;
  }
  endingRouteInstructions = self->_endingRouteInstructions;
  if ((unint64_t)endingRouteInstructions | *((_QWORD *)v4 + 30))
  {
    if (!-[NSMutableArray isEqual:](endingRouteInstructions, "isEqual:"))
      goto LABEL_191;
  }
  trafficDescription = self->_trafficDescription;
  if ((unint64_t)trafficDescription | *((_QWORD *)v4 + 57))
  {
    if (!-[NSString isEqual:](trafficDescription, "isEqual:"))
      goto LABEL_191;
  }
  trafficDescriptionLong = self->_trafficDescriptionLong;
  if ((unint64_t)trafficDescriptionLong | *((_QWORD *)v4 + 56))
  {
    if (!-[NSString isEqual:](trafficDescriptionLong, "isEqual:"))
      goto LABEL_191;
  }
  alertNonRecommendedRouteText = self->_alertNonRecommendedRouteText;
  if ((unint64_t)alertNonRecommendedRouteText | *((_QWORD *)v4 + 22))
  {
    if (!-[GEOAlertNonRecommendedRouteText isEqual:](alertNonRecommendedRouteText, "isEqual:"))
      goto LABEL_191;
  }
  guidanceEvents = self->_guidanceEvents;
  if ((unint64_t)guidanceEvents | *((_QWORD *)v4 + 32))
  {
    if (!-[NSMutableArray isEqual:](guidanceEvents, "isEqual:"))
      goto LABEL_191;
  }
  launchAndGoCardText = self->_launchAndGoCardText;
  if ((unint64_t)launchAndGoCardText | *((_QWORD *)v4 + 36))
  {
    if (!-[GEOLaunchAndGoCardText isEqual:](launchAndGoCardText, "isEqual:"))
      goto LABEL_191;
  }
  roadComplexitys = self->_roadComplexitys;
  if ((unint64_t)roadComplexitys | *((_QWORD *)v4 + 44))
  {
    if (!-[NSMutableArray isEqual:](roadComplexitys, "isEqual:"))
      goto LABEL_191;
  }
  laneWidths = self->_laneWidths;
  if ((unint64_t)laneWidths | *((_QWORD *)v4 + 35))
  {
    if (!-[NSMutableArray isEqual:](laneWidths, "isEqual:"))
      goto LABEL_191;
  }
  elevationProfile = self->_elevationProfile;
  if ((unint64_t)elevationProfile | *((_QWORD *)v4 + 29))
  {
    if (!-[GEOElevationProfile isEqual:](elevationProfile, "isEqual:"))
      goto LABEL_191;
  }
  v46 = (uint64_t)self->_flags;
  v47 = *(_QWORD *)(v4 + 564);
  if ((v46 & 2) != 0)
  {
    if ((v47 & 2) == 0 || self->_arrivalParameterIndex != *((_DWORD *)v4 + 126))
      goto LABEL_191;
  }
  else if ((v47 & 2) != 0)
  {
    goto LABEL_191;
  }
  restrictedZoneIds = self->_restrictedZoneIds;
  if ((unint64_t)restrictedZoneIds | *((_QWORD *)v4 + 43))
  {
    if (-[NSMutableArray isEqual:](restrictedZoneIds, "isEqual:"))
    {
      v46 = (uint64_t)self->_flags;
      v47 = *(_QWORD *)(v4 + 564);
      goto LABEL_162;
    }
LABEL_191:
    v55 = 0;
    goto LABEL_192;
  }
LABEL_162:
  if ((v46 & 0x100) != 0)
  {
    if ((v47 & 0x100) == 0 || self->_licensePlateRestrictionImpact != *((_DWORD *)v4 + 133))
      goto LABEL_191;
  }
  else if ((v47 & 0x100) != 0)
  {
    goto LABEL_191;
  }
  if ((v46 & 0x20) != 0)
  {
    if ((v47 & 0x20) == 0 || self->_environmentalCongestionZoneImpact != *((_DWORD *)v4 + 130))
      goto LABEL_191;
  }
  else if ((v47 & 0x20) != 0)
  {
    goto LABEL_191;
  }
  if ((v46 & 0x800) != 0)
  {
    if ((v47 & 0x800) == 0 || self->_tollCongestionZoneImpact != *((_DWORD *)v4 + 136))
      goto LABEL_191;
  }
  else if ((v47 & 0x800) != 0)
  {
    goto LABEL_191;
  }
  stepGroups = self->_stepGroups;
  if ((unint64_t)stepGroups | *((_QWORD *)v4 + 53)
    && !-[NSMutableArray isEqual:](stepGroups, "isEqual:"))
  {
    goto LABEL_191;
  }
  updateLocations = self->_updateLocations;
  if ((unint64_t)updateLocations | *((_QWORD *)v4 + 59))
  {
    if (!-[NSMutableArray isEqual:](updateLocations, "isEqual:"))
      goto LABEL_191;
  }
  originWaypointInfo = self->_originWaypointInfo;
  if ((unint64_t)originWaypointInfo | *((_QWORD *)v4 + 39))
  {
    if (!-[GEOWaypointInfo isEqual:](originWaypointInfo, "isEqual:"))
      goto LABEL_191;
  }
  destinationWaypointInfo = self->_destinationWaypointInfo;
  if ((unint64_t)destinationWaypointInfo | *((_QWORD *)v4 + 28))
  {
    if (!-[GEOWaypointInfo isEqual:](destinationWaypointInfo, "isEqual:"))
      goto LABEL_191;
  }
  if (!PBRepeatedInt32IsEqual())
    goto LABEL_191;
  if (!PBRepeatedUInt32IsEqual())
    goto LABEL_191;
  originListInstruction = self->_originListInstruction;
  if ((unint64_t)originListInstruction | *((_QWORD *)v4 + 38))
  {
    if (!-[GEODrivingWalkingInstruction isEqual:](originListInstruction, "isEqual:"))
      goto LABEL_191;
  }
  destinationListInstruction = self->_destinationListInstruction;
  if ((unint64_t)destinationListInstruction | *((_QWORD *)v4 + 27))
    v55 = -[GEODrivingWalkingInstruction isEqual:](destinationListInstruction, "isEqual:");
  else
    v55 = 1;
LABEL_192:

  return v55;
}

- (unint64_t)hash
{
  uint64_t flags;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  NSUInteger v25;
  NSUInteger v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  NSUInteger v66;
  NSUInteger v67;
  uint64_t v68;
  uint64_t v69;

  -[GEORoute readAll:](self, "readAll:", 1);
  if ((*(_QWORD *)&self->_flags & 0x1000) != 0)
    v69 = 2654435761 * self->_transportType;
  else
    v69 = 0;
  v68 = -[NSMutableArray hash](self->_steps, "hash");
  v67 = -[NSString hash](self->_name, "hash");
  v66 = -[NSString hash](self->_phoneticName, "hash");
  flags = (uint64_t)self->_flags;
  if ((flags & 8) != 0)
  {
    v65 = 2654435761 * self->_distance;
    if ((flags & 0x40) != 0)
      goto LABEL_6;
  }
  else
  {
    v65 = 0;
    if ((flags & 0x40) != 0)
    {
LABEL_6:
      v64 = 2654435761 * self->_expectedTime;
      goto LABEL_9;
    }
  }
  v64 = 0;
LABEL_9:
  v63 = -[NSData hash](self->_routeID, "hash");
  if ((*(_QWORD *)&self->_flags & 0x200) != 0)
    v62 = 2654435761 * self->_routeType;
  else
    v62 = 0;
  v61 = -[NSMutableArray hash](self->_zilchPoints, "hash");
  v60 = -[NSMutableArray hash](self->_basicPoints, "hash");
  v59 = -[NSData hash](self->_pathLeg, "hash");
  v58 = -[GEOPathMapMatcherInstructions hash](self->_pathMapMatcherInstructions, "hash");
  if ((*(_QWORD *)&self->_flags & 0x10) != 0)
    v57 = 2654435761 * self->_drivingSide;
  else
    v57 = 0;
  v56 = -[NSData hash](self->_departureRouteID, "hash");
  if ((*(_QWORD *)&self->_flags & 4) != 0)
    v55 = 2654435761 * self->_departureStepID;
  else
    v55 = 0;
  v54 = -[NSData hash](self->_arrivalRouteID, "hash");
  if ((*(_QWORD *)&self->_flags & 1) != 0)
    v53 = 2654435761 * self->_arrivalStepID;
  else
    v53 = 0;
  v52 = PBRepeatedUInt32Hash();
  v51 = PBRepeatedUInt32Hash();
  v50 = -[NSMutableArray hash](self->_routeLineStyleInfos, "hash");
  v49 = -[NSMutableArray hash](self->_routeCameraInputInfos, "hash");
  v48 = -[NSMutableArray hash](self->_trafficColorInfos, "hash");
  v47 = -[NSMutableArray hash](self->_routeNames, "hash");
  if ((*(_QWORD *)&self->_flags & 0x80) != 0)
    v46 = 2654435761 * self->_historicTravelTime;
  else
    v46 = 0;
  v45 = -[NSMutableArray hash](self->_advisoryNotices, "hash");
  v44 = -[GEOFormattedString hash](self->_routeLabelDetailText, "hash");
  v43 = -[GEOFormattedString hash](self->_infrastructureDescription, "hash");
  v42 = -[GEOClickableAdvisory hash](self->_clickableAdvisory, "hash");
  v4 = (uint64_t)self->_flags;
  if ((v4 & 0x2000) != 0)
  {
    v41 = 2654435761 * self->_travelTimeAggressiveEstimate;
    if ((v4 & 0x4000) != 0)
    {
LABEL_26:
      v40 = 2654435761 * self->_travelTimeConservativeEstimate;
      if ((v4 & 0x400) != 0)
        goto LABEL_27;
      goto LABEL_33;
    }
  }
  else
  {
    v41 = 0;
    if ((v4 & 0x4000) != 0)
      goto LABEL_26;
  }
  v40 = 0;
  if ((v4 & 0x400) != 0)
  {
LABEL_27:
    v39 = 2654435761 * self->_staticTravelTime;
    if ((v4 & 0x10000) != 0)
      goto LABEL_28;
    goto LABEL_34;
  }
LABEL_33:
  v39 = 0;
  if ((v4 & 0x10000) != 0)
  {
LABEL_28:
    v38 = 2654435761 * self->_avoidsTolls;
    if ((v4 & 0x8000) != 0)
      goto LABEL_29;
LABEL_35:
    v37 = 0;
    if ((v4 & 0x20000) != 0)
      goto LABEL_30;
    goto LABEL_36;
  }
LABEL_34:
  v38 = 0;
  if ((v4 & 0x8000) == 0)
    goto LABEL_35;
LABEL_29:
  v37 = 2654435761 * self->_avoidsHighways;
  if ((v4 & 0x20000) != 0)
  {
LABEL_30:
    v36 = 2654435761 * self->_avoidsTraffic;
    goto LABEL_37;
  }
LABEL_36:
  v36 = 0;
LABEL_37:
  v35 = -[NSMutableArray hash](self->_enrouteNotices, "hash");
  v34 = -[NSData hash](self->_unpackedLatLngVertices, "hash");
  v33 = PBRepeatedUInt32Hash();
  v32 = PBRepeatedUInt32Hash();
  v31 = -[NSMutableArray hash](self->_incidentOnRouteInfos, "hash");
  v30 = -[GEORouteInformation hash](self->_routePlanningDescription, "hash");
  v29 = -[NSMutableArray hash](self->_routeDescriptions, "hash");
  v28 = -[NSMutableArray hash](self->_startingRouteInstructions, "hash");
  v27 = -[NSMutableArray hash](self->_endingRouteInstructions, "hash");
  v26 = -[NSString hash](self->_trafficDescription, "hash");
  v25 = -[NSString hash](self->_trafficDescriptionLong, "hash");
  v5 = -[GEOAlertNonRecommendedRouteText hash](self->_alertNonRecommendedRouteText, "hash");
  v6 = -[NSMutableArray hash](self->_guidanceEvents, "hash");
  v7 = -[GEOLaunchAndGoCardText hash](self->_launchAndGoCardText, "hash");
  v8 = -[NSMutableArray hash](self->_roadComplexitys, "hash");
  v9 = -[NSMutableArray hash](self->_laneWidths, "hash");
  v10 = -[GEOElevationProfile hash](self->_elevationProfile, "hash");
  if ((*(_QWORD *)&self->_flags & 2) != 0)
    v11 = 2654435761 * self->_arrivalParameterIndex;
  else
    v11 = 0;
  v12 = -[NSMutableArray hash](self->_restrictedZoneIds, "hash");
  v13 = (uint64_t)self->_flags;
  if ((v13 & 0x100) == 0)
  {
    v14 = 0;
    if ((v13 & 0x20) != 0)
      goto LABEL_42;
LABEL_45:
    v15 = 0;
    if ((v13 & 0x800) != 0)
      goto LABEL_43;
LABEL_46:
    v16 = 0;
    goto LABEL_47;
  }
  v14 = 2654435761 * self->_licensePlateRestrictionImpact;
  if ((v13 & 0x20) == 0)
    goto LABEL_45;
LABEL_42:
  v15 = 2654435761 * self->_environmentalCongestionZoneImpact;
  if ((v13 & 0x800) == 0)
    goto LABEL_46;
LABEL_43:
  v16 = 2654435761 * self->_tollCongestionZoneImpact;
LABEL_47:
  v17 = v10 ^ v11 ^ v12 ^ v14 ^ v15 ^ v16 ^ -[NSMutableArray hash](self->_stepGroups, "hash");
  v18 = v17 ^ -[NSMutableArray hash](self->_updateLocations, "hash");
  v19 = v18 ^ -[GEOWaypointInfo hash](self->_originWaypointInfo, "hash");
  v20 = v68 ^ v69 ^ v67 ^ v66 ^ v65 ^ v64 ^ v63 ^ v62 ^ v61 ^ v60 ^ v59 ^ v58 ^ v57 ^ v56 ^ v55 ^ v54 ^ v53 ^ v52 ^ v51 ^ v50 ^ v49 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v19 ^ -[GEOWaypointInfo hash](self->_destinationWaypointInfo, "hash");
  v21 = PBRepeatedInt32Hash();
  v22 = v21 ^ PBRepeatedUInt32Hash();
  v23 = v22 ^ -[GEODrivingWalkingInstruction hash](self->_originListInstruction, "hash");
  return v20 ^ v23 ^ -[GEODrivingWalkingInstruction hash](self->_destinationListInstruction, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t k;
  GEOPathMapMatcherInstructions *pathMapMatcherInstructions;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t m;
  uint64_t v26;
  uint64_t v27;
  uint64_t n;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t ii;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t jj;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t kk;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t mm;
  id v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t nn;
  GEOFormattedString *routeLabelDetailText;
  uint64_t v55;
  GEOFormattedString *infrastructureDescription;
  uint64_t v57;
  GEOClickableAdvisory *clickableAdvisory;
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  id v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t i1;
  uint64_t v67;
  uint64_t v68;
  uint64_t i2;
  uint64_t v70;
  uint64_t v71;
  uint64_t i3;
  id v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t i4;
  GEORouteInformation *routePlanningDescription;
  void *v79;
  id v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t i5;
  id v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t i6;
  id v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t i7;
  GEOAlertNonRecommendedRouteText *alertNonRecommendedRouteText;
  uint64_t v96;
  id v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t i8;
  GEOLaunchAndGoCardText *launchAndGoCardText;
  uint64_t v103;
  id v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t i9;
  id v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t i10;
  GEOElevationProfile *elevationProfile;
  uint64_t v115;
  id v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t i11;
  uint64_t *v121;
  uint64_t v122;
  id v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t i12;
  id v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t i13;
  GEOWaypointInfo *originWaypointInfo;
  uint64_t v134;
  GEOWaypointInfo *destinationWaypointInfo;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t i14;
  uint64_t v140;
  uint64_t v141;
  uint64_t i15;
  GEODrivingWalkingInstruction *originListInstruction;
  void *v144;
  GEODrivingWalkingInstruction *destinationListInstruction;
  void *v146;
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
  __int128 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  __int128 v188;
  __int128 v189;
  __int128 v190;
  __int128 v191;
  __int128 v192;
  __int128 v193;
  __int128 v194;
  __int128 v195;
  __int128 v196;
  __int128 v197;
  __int128 v198;
  __int128 v199;
  __int128 v200;
  __int128 v201;
  __int128 v202;
  __int128 v203;
  __int128 v204;
  __int128 v205;
  __int128 v206;
  __int128 v207;
  __int128 v208;
  __int128 v209;
  __int128 v210;
  __int128 v211;
  __int128 v212;
  __int128 v213;
  __int128 v214;
  __int128 v215;
  __int128 v216;
  __int128 v217;
  __int128 v218;
  __int128 v219;
  __int128 v220;
  __int128 v221;
  __int128 v222;
  _BYTE v223[128];
  _BYTE v224[128];
  _BYTE v225[128];
  _BYTE v226[128];
  _BYTE v227[128];
  _BYTE v228[128];
  _BYTE v229[128];
  _BYTE v230[128];
  _BYTE v231[128];
  _BYTE v232[128];
  _BYTE v233[128];
  _BYTE v234[128];
  _BYTE v235[128];
  _BYTE v236[128];
  _BYTE v237[128];
  _BYTE v238[128];
  _BYTE v239[128];
  _BYTE v240[128];
  _BYTE v241[128];
  uint64_t v242;

  v242 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  if ((*(_QWORD *)((_BYTE *)v4 + 564) & 0x1000) != 0)
  {
    self->_transportType = *((_DWORD *)v4 + 137);
    *(_QWORD *)&self->_flags |= 0x1000uLL;
  }
  v222 = 0u;
  v221 = 0u;
  v220 = 0u;
  v219 = 0u;
  v5 = *((id *)v4 + 54);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v219, v241, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v220;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v220 != v8)
          objc_enumerationMutation(v5);
        -[GEORoute addStep:](self, "addStep:", *(_QWORD *)(*((_QWORD *)&v219 + 1) + 8 * i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v219, v241, 16);
    }
    while (v7);
  }

  if (*((_QWORD *)v4 + 37))
    -[GEORoute setName:](self, "setName:");
  if (*((_QWORD *)v4 + 42))
    -[GEORoute setPhoneticName:](self, "setPhoneticName:");
  v10 = *(_QWORD *)((char *)v4 + 564);
  if ((v10 & 8) != 0)
  {
    self->_distance = *((_DWORD *)v4 + 128);
    *(_QWORD *)&self->_flags |= 8uLL;
    v10 = *(_QWORD *)((char *)v4 + 564);
  }
  if ((v10 & 0x40) != 0)
  {
    self->_expectedTime = *((_DWORD *)v4 + 131);
    *(_QWORD *)&self->_flags |= 0x40uLL;
  }
  if (*((_QWORD *)v4 + 45))
    -[GEORoute setRouteID:](self, "setRouteID:");
  if ((*(_QWORD *)((_BYTE *)v4 + 564) & 0x200) != 0)
  {
    self->_routeType = *((_DWORD *)v4 + 134);
    *(_QWORD *)&self->_flags |= 0x200uLL;
  }
  v218 = 0u;
  v217 = 0u;
  v216 = 0u;
  v215 = 0u;
  v11 = *((id *)v4 + 60);
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v215, v240, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v216;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v216 != v14)
          objc_enumerationMutation(v11);
        -[GEORoute addZilchPoints:](self, "addZilchPoints:", *(_QWORD *)(*((_QWORD *)&v215 + 1) + 8 * j));
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v215, v240, 16);
    }
    while (v13);
  }

  v214 = 0u;
  v213 = 0u;
  v212 = 0u;
  v211 = 0u;
  v16 = *((id *)v4 + 24);
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v211, v239, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v212;
    do
    {
      for (k = 0; k != v18; ++k)
      {
        if (*(_QWORD *)v212 != v19)
          objc_enumerationMutation(v16);
        -[GEORoute addBasicPoints:](self, "addBasicPoints:", *(_QWORD *)(*((_QWORD *)&v211 + 1) + 8 * k));
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v211, v239, 16);
    }
    while (v18);
  }

  if (*((_QWORD *)v4 + 40))
    -[GEORoute setPathLeg:](self, "setPathLeg:");
  pathMapMatcherInstructions = self->_pathMapMatcherInstructions;
  v22 = *((_QWORD *)v4 + 41);
  if (pathMapMatcherInstructions)
  {
    if (v22)
      -[GEOPathMapMatcherInstructions mergeFrom:](pathMapMatcherInstructions, "mergeFrom:");
  }
  else if (v22)
  {
    -[GEORoute setPathMapMatcherInstructions:](self, "setPathMapMatcherInstructions:");
  }
  if ((*(_QWORD *)((_BYTE *)v4 + 564) & 0x10) != 0)
  {
    self->_drivingSide = *((_DWORD *)v4 + 129);
    *(_QWORD *)&self->_flags |= 0x10uLL;
  }
  if (*((_QWORD *)v4 + 26))
    -[GEORoute setDepartureRouteID:](self, "setDepartureRouteID:");
  if ((*(_QWORD *)((_BYTE *)v4 + 564) & 4) != 0)
  {
    self->_departureStepID = *((_DWORD *)v4 + 127);
    *(_QWORD *)&self->_flags |= 4uLL;
  }
  if (*((_QWORD *)v4 + 23))
    -[GEORoute setArrivalRouteID:](self, "setArrivalRouteID:");
  if ((*(_QWORD *)((_BYTE *)v4 + 564) & 1) != 0)
  {
    self->_arrivalStepID = *((_DWORD *)v4 + 125);
    *(_QWORD *)&self->_flags |= 1uLL;
  }
  v23 = objc_msgSend(v4, "trafficColorsCount");
  if (v23)
  {
    v24 = v23;
    for (m = 0; m != v24; ++m)
      -[GEORoute addTrafficColor:](self, "addTrafficColor:", objc_msgSend(v4, "trafficColorAtIndex:", m));
  }
  v26 = objc_msgSend(v4, "trafficColorOffsetsCount");
  if (v26)
  {
    v27 = v26;
    for (n = 0; n != v27; ++n)
      -[GEORoute addTrafficColorOffset:](self, "addTrafficColorOffset:", objc_msgSend(v4, "trafficColorOffsetAtIndex:", n));
  }
  v209 = 0u;
  v210 = 0u;
  v207 = 0u;
  v208 = 0u;
  v29 = *((id *)v4 + 50);
  v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v207, v238, 16);
  if (v30)
  {
    v31 = v30;
    v32 = *(_QWORD *)v208;
    do
    {
      for (ii = 0; ii != v31; ++ii)
      {
        if (*(_QWORD *)v208 != v32)
          objc_enumerationMutation(v29);
        -[GEORoute addRouteLineStyleInfo:](self, "addRouteLineStyleInfo:", *(_QWORD *)(*((_QWORD *)&v207 + 1) + 8 * ii));
      }
      v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v207, v238, 16);
    }
    while (v31);
  }

  v205 = 0u;
  v206 = 0u;
  v203 = 0u;
  v204 = 0u;
  v34 = *((id *)v4 + 47);
  v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v203, v237, 16);
  if (v35)
  {
    v36 = v35;
    v37 = *(_QWORD *)v204;
    do
    {
      for (jj = 0; jj != v36; ++jj)
      {
        if (*(_QWORD *)v204 != v37)
          objc_enumerationMutation(v34);
        -[GEORoute addRouteCameraInputInfo:](self, "addRouteCameraInputInfo:", *(_QWORD *)(*((_QWORD *)&v203 + 1) + 8 * jj));
      }
      v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v203, v237, 16);
    }
    while (v36);
  }

  v201 = 0u;
  v202 = 0u;
  v199 = 0u;
  v200 = 0u;
  v39 = *((id *)v4 + 55);
  v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v199, v236, 16);
  if (v40)
  {
    v41 = v40;
    v42 = *(_QWORD *)v200;
    do
    {
      for (kk = 0; kk != v41; ++kk)
      {
        if (*(_QWORD *)v200 != v42)
          objc_enumerationMutation(v39);
        -[GEORoute addTrafficColorInfo:](self, "addTrafficColorInfo:", *(_QWORD *)(*((_QWORD *)&v199 + 1) + 8 * kk));
      }
      v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v199, v236, 16);
    }
    while (v41);
  }

  v197 = 0u;
  v198 = 0u;
  v195 = 0u;
  v196 = 0u;
  v44 = *((id *)v4 + 46);
  v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v195, v235, 16);
  if (v45)
  {
    v46 = v45;
    v47 = *(_QWORD *)v196;
    do
    {
      for (mm = 0; mm != v46; ++mm)
      {
        if (*(_QWORD *)v196 != v47)
          objc_enumerationMutation(v44);
        -[GEORoute addRouteName:](self, "addRouteName:", *(_QWORD *)(*((_QWORD *)&v195 + 1) + 8 * mm));
      }
      v46 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v195, v235, 16);
    }
    while (v46);
  }

  if ((*(_QWORD *)((_BYTE *)v4 + 564) & 0x80) != 0)
  {
    self->_historicTravelTime = *((_DWORD *)v4 + 132);
    *(_QWORD *)&self->_flags |= 0x80uLL;
  }
  v193 = 0u;
  v194 = 0u;
  v191 = 0u;
  v192 = 0u;
  v49 = *((id *)v4 + 21);
  v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v191, v234, 16);
  if (v50)
  {
    v51 = v50;
    v52 = *(_QWORD *)v192;
    do
    {
      for (nn = 0; nn != v51; ++nn)
      {
        if (*(_QWORD *)v192 != v52)
          objc_enumerationMutation(v49);
        -[GEORoute addAdvisoryNotice:](self, "addAdvisoryNotice:", *(_QWORD *)(*((_QWORD *)&v191 + 1) + 8 * nn));
      }
      v51 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v191, v234, 16);
    }
    while (v51);
  }

  routeLabelDetailText = self->_routeLabelDetailText;
  v55 = *((_QWORD *)v4 + 49);
  if (routeLabelDetailText)
  {
    if (v55)
      -[GEOFormattedString mergeFrom:](routeLabelDetailText, "mergeFrom:");
  }
  else if (v55)
  {
    -[GEORoute setRouteLabelDetailText:](self, "setRouteLabelDetailText:");
  }
  infrastructureDescription = self->_infrastructureDescription;
  v57 = *((_QWORD *)v4 + 34);
  if (infrastructureDescription)
  {
    if (v57)
      -[GEOFormattedString mergeFrom:](infrastructureDescription, "mergeFrom:");
  }
  else if (v57)
  {
    -[GEORoute setInfrastructureDescription:](self, "setInfrastructureDescription:");
  }
  clickableAdvisory = self->_clickableAdvisory;
  v59 = *((_QWORD *)v4 + 25);
  if (clickableAdvisory)
  {
    if (v59)
      -[GEOClickableAdvisory mergeFrom:](clickableAdvisory, "mergeFrom:");
  }
  else if (v59)
  {
    -[GEORoute setClickableAdvisory:](self, "setClickableAdvisory:");
  }
  v60 = (uint64_t *)((char *)v4 + 564);
  v61 = *(_QWORD *)((char *)v4 + 564);
  if ((v61 & 0x2000) != 0)
  {
    self->_travelTimeAggressiveEstimate = *((_DWORD *)v4 + 138);
    *(_QWORD *)&self->_flags |= 0x2000uLL;
    v61 = *v60;
    if ((*v60 & 0x4000) == 0)
    {
LABEL_113:
      if ((v61 & 0x400) == 0)
        goto LABEL_114;
      goto LABEL_145;
    }
  }
  else if ((v61 & 0x4000) == 0)
  {
    goto LABEL_113;
  }
  self->_travelTimeConservativeEstimate = *((_DWORD *)v4 + 139);
  *(_QWORD *)&self->_flags |= 0x4000uLL;
  v61 = *(_QWORD *)((char *)v4 + 564);
  if ((v61 & 0x400) == 0)
  {
LABEL_114:
    if ((v61 & 0x10000) == 0)
      goto LABEL_115;
    goto LABEL_146;
  }
LABEL_145:
  self->_staticTravelTime = *((_DWORD *)v4 + 135);
  *(_QWORD *)&self->_flags |= 0x400uLL;
  v61 = *(_QWORD *)((char *)v4 + 564);
  if ((v61 & 0x10000) == 0)
  {
LABEL_115:
    if ((v61 & 0x8000) == 0)
      goto LABEL_116;
    goto LABEL_147;
  }
LABEL_146:
  self->_avoidsTolls = *((_BYTE *)v4 + 561);
  *(_QWORD *)&self->_flags |= 0x10000uLL;
  v61 = *(_QWORD *)((char *)v4 + 564);
  if ((v61 & 0x8000) == 0)
  {
LABEL_116:
    if ((v61 & 0x20000) == 0)
      goto LABEL_118;
    goto LABEL_117;
  }
LABEL_147:
  self->_avoidsHighways = *((_BYTE *)v4 + 560);
  *(_QWORD *)&self->_flags |= 0x8000uLL;
  if ((*(_QWORD *)((_BYTE *)v4 + 564) & 0x20000) != 0)
  {
LABEL_117:
    self->_avoidsTraffic = *((_BYTE *)v4 + 562);
    *(_QWORD *)&self->_flags |= 0x20000uLL;
  }
LABEL_118:
  v189 = 0u;
  v190 = 0u;
  v187 = 0u;
  v188 = 0u;
  v62 = *((id *)v4 + 31);
  v63 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v187, v233, 16);
  if (v63)
  {
    v64 = v63;
    v65 = *(_QWORD *)v188;
    do
    {
      for (i1 = 0; i1 != v64; ++i1)
      {
        if (*(_QWORD *)v188 != v65)
          objc_enumerationMutation(v62);
        -[GEORoute addEnrouteNotice:](self, "addEnrouteNotice:", *(_QWORD *)(*((_QWORD *)&v187 + 1) + 8 * i1));
      }
      v64 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v187, v233, 16);
    }
    while (v64);
  }

  if (*((_QWORD *)v4 + 58))
    -[GEORoute setUnpackedLatLngVertices:](self, "setUnpackedLatLngVertices:");
  v67 = objc_msgSend(v4, "incidentIndicesCount");
  if (v67)
  {
    v68 = v67;
    for (i2 = 0; i2 != v68; ++i2)
      -[GEORoute addIncidentIndices:](self, "addIncidentIndices:", objc_msgSend(v4, "incidentIndicesAtIndex:", i2));
  }
  v70 = objc_msgSend(v4, "incidentEndOffsetsInRoutesCount");
  if (v70)
  {
    v71 = v70;
    for (i3 = 0; i3 != v71; ++i3)
      -[GEORoute addIncidentEndOffsetsInRoute:](self, "addIncidentEndOffsetsInRoute:", objc_msgSend(v4, "incidentEndOffsetsInRouteAtIndex:", i3));
  }
  v185 = 0u;
  v186 = 0u;
  v183 = 0u;
  v184 = 0u;
  v73 = *((id *)v4 + 33);
  v74 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v183, v232, 16);
  if (v74)
  {
    v75 = v74;
    v76 = *(_QWORD *)v184;
    do
    {
      for (i4 = 0; i4 != v75; ++i4)
      {
        if (*(_QWORD *)v184 != v76)
          objc_enumerationMutation(v73);
        -[GEORoute addIncidentOnRouteInfo:](self, "addIncidentOnRouteInfo:", *(_QWORD *)(*((_QWORD *)&v183 + 1) + 8 * i4));
      }
      v75 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v183, v232, 16);
    }
    while (v75);
  }

  routePlanningDescription = self->_routePlanningDescription;
  v79 = (void *)*((_QWORD *)v4 + 51);
  if (routePlanningDescription)
  {
    if (v79)
      -[GEORouteInformation mergeFrom:](routePlanningDescription, v79);
  }
  else if (v79)
  {
    -[GEORoute setRoutePlanningDescription:](self, "setRoutePlanningDescription:", *((_QWORD *)v4 + 51));
  }
  v181 = 0u;
  v182 = 0u;
  v179 = 0u;
  v180 = 0u;
  v80 = *((id *)v4 + 48);
  v81 = objc_msgSend(v80, "countByEnumeratingWithState:objects:count:", &v179, v231, 16);
  if (v81)
  {
    v82 = v81;
    v83 = *(_QWORD *)v180;
    do
    {
      for (i5 = 0; i5 != v82; ++i5)
      {
        if (*(_QWORD *)v180 != v83)
          objc_enumerationMutation(v80);
        -[GEORoute addRouteDescription:](self, "addRouteDescription:", *(_QWORD *)(*((_QWORD *)&v179 + 1) + 8 * i5));
      }
      v82 = objc_msgSend(v80, "countByEnumeratingWithState:objects:count:", &v179, v231, 16);
    }
    while (v82);
  }

  v177 = 0u;
  v178 = 0u;
  v175 = 0u;
  v176 = 0u;
  v85 = *((id *)v4 + 52);
  v86 = objc_msgSend(v85, "countByEnumeratingWithState:objects:count:", &v175, v230, 16);
  if (v86)
  {
    v87 = v86;
    v88 = *(_QWORD *)v176;
    do
    {
      for (i6 = 0; i6 != v87; ++i6)
      {
        if (*(_QWORD *)v176 != v88)
          objc_enumerationMutation(v85);
        -[GEORoute addStartingRouteInstruction:](self, "addStartingRouteInstruction:", *(_QWORD *)(*((_QWORD *)&v175 + 1) + 8 * i6));
      }
      v87 = objc_msgSend(v85, "countByEnumeratingWithState:objects:count:", &v175, v230, 16);
    }
    while (v87);
  }

  v173 = 0u;
  v174 = 0u;
  v171 = 0u;
  v172 = 0u;
  v90 = *((id *)v4 + 30);
  v91 = objc_msgSend(v90, "countByEnumeratingWithState:objects:count:", &v171, v229, 16);
  if (v91)
  {
    v92 = v91;
    v93 = *(_QWORD *)v172;
    do
    {
      for (i7 = 0; i7 != v92; ++i7)
      {
        if (*(_QWORD *)v172 != v93)
          objc_enumerationMutation(v90);
        -[GEORoute addEndingRouteInstruction:](self, "addEndingRouteInstruction:", *(_QWORD *)(*((_QWORD *)&v171 + 1) + 8 * i7));
      }
      v92 = objc_msgSend(v90, "countByEnumeratingWithState:objects:count:", &v171, v229, 16);
    }
    while (v92);
  }

  if (*((_QWORD *)v4 + 57))
    -[GEORoute setTrafficDescription:](self, "setTrafficDescription:");
  if (*((_QWORD *)v4 + 56))
    -[GEORoute setTrafficDescriptionLong:](self, "setTrafficDescriptionLong:");
  alertNonRecommendedRouteText = self->_alertNonRecommendedRouteText;
  v96 = *((_QWORD *)v4 + 22);
  if (alertNonRecommendedRouteText)
  {
    if (v96)
      -[GEOAlertNonRecommendedRouteText mergeFrom:](alertNonRecommendedRouteText, "mergeFrom:");
  }
  else if (v96)
  {
    -[GEORoute setAlertNonRecommendedRouteText:](self, "setAlertNonRecommendedRouteText:");
  }
  v169 = 0u;
  v170 = 0u;
  v167 = 0u;
  v168 = 0u;
  v97 = *((id *)v4 + 32);
  v98 = objc_msgSend(v97, "countByEnumeratingWithState:objects:count:", &v167, v228, 16);
  if (v98)
  {
    v99 = v98;
    v100 = *(_QWORD *)v168;
    do
    {
      for (i8 = 0; i8 != v99; ++i8)
      {
        if (*(_QWORD *)v168 != v100)
          objc_enumerationMutation(v97);
        -[GEORoute addGuidanceEvent:](self, "addGuidanceEvent:", *(_QWORD *)(*((_QWORD *)&v167 + 1) + 8 * i8));
      }
      v99 = objc_msgSend(v97, "countByEnumeratingWithState:objects:count:", &v167, v228, 16);
    }
    while (v99);
  }

  launchAndGoCardText = self->_launchAndGoCardText;
  v103 = *((_QWORD *)v4 + 36);
  if (launchAndGoCardText)
  {
    if (v103)
      -[GEOLaunchAndGoCardText mergeFrom:](launchAndGoCardText, "mergeFrom:");
  }
  else if (v103)
  {
    -[GEORoute setLaunchAndGoCardText:](self, "setLaunchAndGoCardText:");
  }
  v165 = 0u;
  v166 = 0u;
  v163 = 0u;
  v164 = 0u;
  v104 = *((id *)v4 + 44);
  v105 = objc_msgSend(v104, "countByEnumeratingWithState:objects:count:", &v163, v227, 16);
  if (v105)
  {
    v106 = v105;
    v107 = *(_QWORD *)v164;
    do
    {
      for (i9 = 0; i9 != v106; ++i9)
      {
        if (*(_QWORD *)v164 != v107)
          objc_enumerationMutation(v104);
        -[GEORoute addRoadComplexity:](self, "addRoadComplexity:", *(_QWORD *)(*((_QWORD *)&v163 + 1) + 8 * i9));
      }
      v106 = objc_msgSend(v104, "countByEnumeratingWithState:objects:count:", &v163, v227, 16);
    }
    while (v106);
  }

  v161 = 0u;
  v162 = 0u;
  v159 = 0u;
  v160 = 0u;
  v109 = *((id *)v4 + 35);
  v110 = objc_msgSend(v109, "countByEnumeratingWithState:objects:count:", &v159, v226, 16);
  if (v110)
  {
    v111 = v110;
    v112 = *(_QWORD *)v160;
    do
    {
      for (i10 = 0; i10 != v111; ++i10)
      {
        if (*(_QWORD *)v160 != v112)
          objc_enumerationMutation(v109);
        -[GEORoute addLaneWidth:](self, "addLaneWidth:", *(_QWORD *)(*((_QWORD *)&v159 + 1) + 8 * i10));
      }
      v111 = objc_msgSend(v109, "countByEnumeratingWithState:objects:count:", &v159, v226, 16);
    }
    while (v111);
  }

  elevationProfile = self->_elevationProfile;
  v115 = *((_QWORD *)v4 + 29);
  if (elevationProfile)
  {
    if (v115)
      -[GEOElevationProfile mergeFrom:](elevationProfile, "mergeFrom:");
  }
  else if (v115)
  {
    -[GEORoute setElevationProfile:](self, "setElevationProfile:");
  }
  if ((*(_QWORD *)((_BYTE *)v4 + 564) & 2) != 0)
  {
    self->_arrivalParameterIndex = *((_DWORD *)v4 + 126);
    *(_QWORD *)&self->_flags |= 2uLL;
  }
  v157 = 0u;
  v158 = 0u;
  v155 = 0u;
  v156 = 0u;
  v116 = *((id *)v4 + 43);
  v117 = objc_msgSend(v116, "countByEnumeratingWithState:objects:count:", &v155, v225, 16);
  if (v117)
  {
    v118 = v117;
    v119 = *(_QWORD *)v156;
    do
    {
      for (i11 = 0; i11 != v118; ++i11)
      {
        if (*(_QWORD *)v156 != v119)
          objc_enumerationMutation(v116);
        -[GEORoute addRestrictedZoneIds:](self, "addRestrictedZoneIds:", *(_QWORD *)(*((_QWORD *)&v155 + 1) + 8 * i11));
      }
      v118 = objc_msgSend(v116, "countByEnumeratingWithState:objects:count:", &v155, v225, 16);
    }
    while (v118);
  }

  v121 = (uint64_t *)((char *)v4 + 564);
  v122 = *(_QWORD *)((char *)v4 + 564);
  if ((v122 & 0x100) != 0)
  {
    self->_licensePlateRestrictionImpact = *((_DWORD *)v4 + 133);
    *(_QWORD *)&self->_flags |= 0x100uLL;
    v122 = *v121;
    if ((*v121 & 0x20) == 0)
    {
LABEL_223:
      if ((v122 & 0x800) == 0)
        goto LABEL_225;
      goto LABEL_224;
    }
  }
  else if ((v122 & 0x20) == 0)
  {
    goto LABEL_223;
  }
  self->_environmentalCongestionZoneImpact = *((_DWORD *)v4 + 130);
  *(_QWORD *)&self->_flags |= 0x20uLL;
  if ((*(_QWORD *)((_BYTE *)v4 + 564) & 0x800) != 0)
  {
LABEL_224:
    self->_tollCongestionZoneImpact = *((_DWORD *)v4 + 136);
    *(_QWORD *)&self->_flags |= 0x800uLL;
  }
LABEL_225:
  v153 = 0u;
  v154 = 0u;
  v151 = 0u;
  v152 = 0u;
  v123 = *((id *)v4 + 53);
  v124 = objc_msgSend(v123, "countByEnumeratingWithState:objects:count:", &v151, v224, 16);
  if (v124)
  {
    v125 = v124;
    v126 = *(_QWORD *)v152;
    do
    {
      for (i12 = 0; i12 != v125; ++i12)
      {
        if (*(_QWORD *)v152 != v126)
          objc_enumerationMutation(v123);
        -[GEORoute addStepGroup:](self, "addStepGroup:", *(_QWORD *)(*((_QWORD *)&v151 + 1) + 8 * i12));
      }
      v125 = objc_msgSend(v123, "countByEnumeratingWithState:objects:count:", &v151, v224, 16);
    }
    while (v125);
  }

  v149 = 0u;
  v150 = 0u;
  v147 = 0u;
  v148 = 0u;
  v128 = *((id *)v4 + 59);
  v129 = objc_msgSend(v128, "countByEnumeratingWithState:objects:count:", &v147, v223, 16);
  if (v129)
  {
    v130 = v129;
    v131 = *(_QWORD *)v148;
    do
    {
      for (i13 = 0; i13 != v130; ++i13)
      {
        if (*(_QWORD *)v148 != v131)
          objc_enumerationMutation(v128);
        -[GEORoute addUpdateLocation:](self, "addUpdateLocation:", *(_QWORD *)(*((_QWORD *)&v147 + 1) + 8 * i13), (_QWORD)v147);
      }
      v130 = objc_msgSend(v128, "countByEnumeratingWithState:objects:count:", &v147, v223, 16);
    }
    while (v130);
  }

  originWaypointInfo = self->_originWaypointInfo;
  v134 = *((_QWORD *)v4 + 39);
  if (originWaypointInfo)
  {
    if (v134)
      -[GEOWaypointInfo mergeFrom:](originWaypointInfo, "mergeFrom:");
  }
  else if (v134)
  {
    -[GEORoute setOriginWaypointInfo:](self, "setOriginWaypointInfo:");
  }
  destinationWaypointInfo = self->_destinationWaypointInfo;
  v136 = *((_QWORD *)v4 + 28);
  if (destinationWaypointInfo)
  {
    if (v136)
      -[GEOWaypointInfo mergeFrom:](destinationWaypointInfo, "mergeFrom:");
  }
  else if (v136)
  {
    -[GEORoute setDestinationWaypointInfo:](self, "setDestinationWaypointInfo:");
  }
  v137 = objc_msgSend(v4, "cellularCoveragesCount", (_QWORD)v147);
  if (v137)
  {
    v138 = v137;
    for (i14 = 0; i14 != v138; ++i14)
      -[GEORoute addCellularCoverage:](self, "addCellularCoverage:", objc_msgSend(v4, "cellularCoverageAtIndex:", i14));
  }
  v140 = objc_msgSend(v4, "cellularCoverageOffsetsCount");
  if (v140)
  {
    v141 = v140;
    for (i15 = 0; i15 != v141; ++i15)
      -[GEORoute addCellularCoverageOffset:](self, "addCellularCoverageOffset:", objc_msgSend(v4, "cellularCoverageOffsetAtIndex:", i15));
  }
  originListInstruction = self->_originListInstruction;
  v144 = (void *)*((_QWORD *)v4 + 38);
  if (originListInstruction)
  {
    if (v144)
      -[GEODrivingWalkingInstruction mergeFrom:](originListInstruction, v144);
  }
  else if (v144)
  {
    -[GEORoute setOriginListInstruction:](self, "setOriginListInstruction:", *((_QWORD *)v4 + 38));
  }
  destinationListInstruction = self->_destinationListInstruction;
  v146 = (void *)*((_QWORD *)v4 + 27);
  if (destinationListInstruction)
  {
    if (v146)
      -[GEODrivingWalkingInstruction mergeFrom:](destinationListInstruction, v146);
  }
  else if (v146)
  {
    -[GEORoute setDestinationListInstruction:](self, "setDestinationListInstruction:", *((_QWORD *)v4 + 27));
  }

}

- (PBUnknownFields)unknownFields
{
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v5;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_QWORD *)&self->_flags & 0x40000) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      v5 = reader;
      objc_sync_enter(v5);
      GEORouteReadSpecified((uint64_t)self, (char *)self->_reader, (int *)&unknownFields_tags_4370);
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
  char v6;
  PBUnknownFields *unknownFields;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSMutableArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSMutableArray *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSMutableArray *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSMutableArray *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  NSMutableArray *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  NSMutableArray *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  NSMutableArray *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  NSMutableArray *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  NSMutableArray *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  NSMutableArray *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  NSMutableArray *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  NSMutableArray *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  NSMutableArray *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  NSMutableArray *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  NSMutableArray *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
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
  _BYTE v159[128];
  _BYTE v160[128];
  _BYTE v161[128];
  _BYTE v162[128];
  _BYTE v163[128];
  _BYTE v164[128];
  _BYTE v165[128];
  _BYTE v166[128];
  _BYTE v167[128];
  uint64_t v168;

  v3 = a3;
  v168 = *MEMORY[0x1E0C80C00];
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  v6 = *((_BYTE *)&self->_flags + 8) | 2;
  *(_QWORD *)&self->_flags |= 0x40000uLL;
  *((_BYTE *)&self->_flags + 8) = v6;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEORoute readAll:](self, "readAll:", 0);
    v150 = 0u;
    v151 = 0u;
    v148 = 0u;
    v149 = 0u;
    v8 = self->_steps;
    v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v148, v167, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v149;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v149 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v148 + 1) + 8 * v12++), "clearUnknownFields:", 1);
        }
        while (v10 != v12);
        v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v148, v167, 16);
      }
      while (v10);
    }

    -[GEOPathMapMatcherInstructions clearUnknownFields:](self->_pathMapMatcherInstructions, "clearUnknownFields:", 1);
    v146 = 0u;
    v147 = 0u;
    v144 = 0u;
    v145 = 0u;
    v13 = self->_routeLineStyleInfos;
    v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v144, v166, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v145;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v145 != v16)
            objc_enumerationMutation(v13);
          objc_msgSend(*(id *)(*((_QWORD *)&v144 + 1) + 8 * v17++), "clearUnknownFields:", 1);
        }
        while (v15 != v17);
        v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v144, v166, 16);
      }
      while (v15);
    }

    v142 = 0u;
    v143 = 0u;
    v140 = 0u;
    v141 = 0u;
    v18 = self->_routeCameraInputInfos;
    v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v140, v165, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v141;
      do
      {
        v22 = 0;
        do
        {
          if (*(_QWORD *)v141 != v21)
            objc_enumerationMutation(v18);
          objc_msgSend(*(id *)(*((_QWORD *)&v140 + 1) + 8 * v22++), "clearUnknownFields:", 1);
        }
        while (v20 != v22);
        v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v140, v165, 16);
      }
      while (v20);
    }

    v138 = 0u;
    v139 = 0u;
    v136 = 0u;
    v137 = 0u;
    v23 = self->_trafficColorInfos;
    v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v136, v164, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v137;
      do
      {
        v27 = 0;
        do
        {
          if (*(_QWORD *)v137 != v26)
            objc_enumerationMutation(v23);
          objc_msgSend(*(id *)(*((_QWORD *)&v136 + 1) + 8 * v27++), "clearUnknownFields:", 1);
        }
        while (v25 != v27);
        v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v136, v164, 16);
      }
      while (v25);
    }

    v134 = 0u;
    v135 = 0u;
    v132 = 0u;
    v133 = 0u;
    v28 = self->_routeNames;
    v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v132, v163, 16);
    if (v29)
    {
      v30 = v29;
      v31 = *(_QWORD *)v133;
      do
      {
        v32 = 0;
        do
        {
          if (*(_QWORD *)v133 != v31)
            objc_enumerationMutation(v28);
          objc_msgSend(*(id *)(*((_QWORD *)&v132 + 1) + 8 * v32++), "clearUnknownFields:", 1);
        }
        while (v30 != v32);
        v30 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v132, v163, 16);
      }
      while (v30);
    }

    -[GEOFormattedString clearUnknownFields:](self->_routeLabelDetailText, "clearUnknownFields:", 1);
    -[GEOFormattedString clearUnknownFields:](self->_infrastructureDescription, "clearUnknownFields:", 1);
    -[GEOClickableAdvisory clearUnknownFields:](self->_clickableAdvisory, "clearUnknownFields:", 1);
    v130 = 0u;
    v131 = 0u;
    v128 = 0u;
    v129 = 0u;
    v33 = self->_enrouteNotices;
    v34 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v128, v162, 16);
    if (v34)
    {
      v35 = v34;
      v36 = *(_QWORD *)v129;
      do
      {
        v37 = 0;
        do
        {
          if (*(_QWORD *)v129 != v36)
            objc_enumerationMutation(v33);
          objc_msgSend(*(id *)(*((_QWORD *)&v128 + 1) + 8 * v37++), "clearUnknownFields:", 1);
        }
        while (v35 != v37);
        v35 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v128, v162, 16);
      }
      while (v35);
    }

    v126 = 0u;
    v127 = 0u;
    v124 = 0u;
    v125 = 0u;
    v38 = self->_incidentOnRouteInfos;
    v39 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v38, "countByEnumeratingWithState:objects:count:", &v124, v161, 16);
    if (v39)
    {
      v40 = v39;
      v41 = *(_QWORD *)v125;
      do
      {
        v42 = 0;
        do
        {
          if (*(_QWORD *)v125 != v41)
            objc_enumerationMutation(v38);
          objc_msgSend(*(id *)(*((_QWORD *)&v124 + 1) + 8 * v42++), "clearUnknownFields:", 1);
        }
        while (v40 != v42);
        v40 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v38, "countByEnumeratingWithState:objects:count:", &v124, v161, 16);
      }
      while (v40);
    }

    -[GEORouteInformation clearUnknownFields:]((uint64_t)self->_routePlanningDescription);
    v122 = 0u;
    v123 = 0u;
    v120 = 0u;
    v121 = 0u;
    v43 = self->_routeDescriptions;
    v44 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v43, "countByEnumeratingWithState:objects:count:", &v120, v160, 16);
    if (v44)
    {
      v45 = v44;
      v46 = *(_QWORD *)v121;
      do
      {
        v47 = 0;
        do
        {
          if (*(_QWORD *)v121 != v46)
            objc_enumerationMutation(v43);
          objc_msgSend(*(id *)(*((_QWORD *)&v120 + 1) + 8 * v47++), "clearUnknownFields:", 1);
        }
        while (v45 != v47);
        v45 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v43, "countByEnumeratingWithState:objects:count:", &v120, v160, 16);
      }
      while (v45);
    }

    v118 = 0u;
    v119 = 0u;
    v116 = 0u;
    v117 = 0u;
    v48 = self->_startingRouteInstructions;
    v49 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v48, "countByEnumeratingWithState:objects:count:", &v116, v159, 16);
    if (v49)
    {
      v50 = v49;
      v51 = *(_QWORD *)v117;
      do
      {
        v52 = 0;
        do
        {
          if (*(_QWORD *)v117 != v51)
            objc_enumerationMutation(v48);
          objc_msgSend(*(id *)(*((_QWORD *)&v116 + 1) + 8 * v52++), "clearUnknownFields:", 1);
        }
        while (v50 != v52);
        v50 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v48, "countByEnumeratingWithState:objects:count:", &v116, v159, 16);
      }
      while (v50);
    }

    v114 = 0u;
    v115 = 0u;
    v112 = 0u;
    v113 = 0u;
    v53 = self->_endingRouteInstructions;
    v54 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v53, "countByEnumeratingWithState:objects:count:", &v112, v158, 16);
    if (v54)
    {
      v55 = v54;
      v56 = *(_QWORD *)v113;
      do
      {
        v57 = 0;
        do
        {
          if (*(_QWORD *)v113 != v56)
            objc_enumerationMutation(v53);
          objc_msgSend(*(id *)(*((_QWORD *)&v112 + 1) + 8 * v57++), "clearUnknownFields:", 1);
        }
        while (v55 != v57);
        v55 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v53, "countByEnumeratingWithState:objects:count:", &v112, v158, 16);
      }
      while (v55);
    }

    -[GEOAlertNonRecommendedRouteText clearUnknownFields:](self->_alertNonRecommendedRouteText, "clearUnknownFields:", 1);
    v110 = 0u;
    v111 = 0u;
    v108 = 0u;
    v109 = 0u;
    v58 = self->_guidanceEvents;
    v59 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v58, "countByEnumeratingWithState:objects:count:", &v108, v157, 16);
    if (v59)
    {
      v60 = v59;
      v61 = *(_QWORD *)v109;
      do
      {
        v62 = 0;
        do
        {
          if (*(_QWORD *)v109 != v61)
            objc_enumerationMutation(v58);
          objc_msgSend(*(id *)(*((_QWORD *)&v108 + 1) + 8 * v62++), "clearUnknownFields:", 1);
        }
        while (v60 != v62);
        v60 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v58, "countByEnumeratingWithState:objects:count:", &v108, v157, 16);
      }
      while (v60);
    }

    -[GEOLaunchAndGoCardText clearUnknownFields:](self->_launchAndGoCardText, "clearUnknownFields:", 1);
    v106 = 0u;
    v107 = 0u;
    v104 = 0u;
    v105 = 0u;
    v63 = self->_roadComplexitys;
    v64 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v63, "countByEnumeratingWithState:objects:count:", &v104, v156, 16);
    if (v64)
    {
      v65 = v64;
      v66 = *(_QWORD *)v105;
      do
      {
        v67 = 0;
        do
        {
          if (*(_QWORD *)v105 != v66)
            objc_enumerationMutation(v63);
          objc_msgSend(*(id *)(*((_QWORD *)&v104 + 1) + 8 * v67++), "clearUnknownFields:", 1);
        }
        while (v65 != v67);
        v65 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v63, "countByEnumeratingWithState:objects:count:", &v104, v156, 16);
      }
      while (v65);
    }

    v102 = 0u;
    v103 = 0u;
    v100 = 0u;
    v101 = 0u;
    v68 = self->_laneWidths;
    v69 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v68, "countByEnumeratingWithState:objects:count:", &v100, v155, 16);
    if (v69)
    {
      v70 = v69;
      v71 = *(_QWORD *)v101;
      do
      {
        v72 = 0;
        do
        {
          if (*(_QWORD *)v101 != v71)
            objc_enumerationMutation(v68);
          objc_msgSend(*(id *)(*((_QWORD *)&v100 + 1) + 8 * v72++), "clearUnknownFields:", 1);
        }
        while (v70 != v72);
        v70 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v68, "countByEnumeratingWithState:objects:count:", &v100, v155, 16);
      }
      while (v70);
    }

    -[GEOElevationProfile clearUnknownFields:](self->_elevationProfile, "clearUnknownFields:", 1);
    v98 = 0u;
    v99 = 0u;
    v96 = 0u;
    v97 = 0u;
    v73 = self->_restrictedZoneIds;
    v74 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v73, "countByEnumeratingWithState:objects:count:", &v96, v154, 16);
    if (v74)
    {
      v75 = v74;
      v76 = *(_QWORD *)v97;
      do
      {
        v77 = 0;
        do
        {
          if (*(_QWORD *)v97 != v76)
            objc_enumerationMutation(v73);
          objc_msgSend(*(id *)(*((_QWORD *)&v96 + 1) + 8 * v77++), "clearUnknownFields:", 1);
        }
        while (v75 != v77);
        v75 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v73, "countByEnumeratingWithState:objects:count:", &v96, v154, 16);
      }
      while (v75);
    }

    v94 = 0u;
    v95 = 0u;
    v92 = 0u;
    v93 = 0u;
    v78 = self->_stepGroups;
    v79 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v78, "countByEnumeratingWithState:objects:count:", &v92, v153, 16);
    if (v79)
    {
      v80 = v79;
      v81 = *(_QWORD *)v93;
      do
      {
        v82 = 0;
        do
        {
          if (*(_QWORD *)v93 != v81)
            objc_enumerationMutation(v78);
          objc_msgSend(*(id *)(*((_QWORD *)&v92 + 1) + 8 * v82++), "clearUnknownFields:", 1);
        }
        while (v80 != v82);
        v80 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v78, "countByEnumeratingWithState:objects:count:", &v92, v153, 16);
      }
      while (v80);
    }

    v90 = 0u;
    v91 = 0u;
    v88 = 0u;
    v89 = 0u;
    v83 = self->_updateLocations;
    v84 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v83, "countByEnumeratingWithState:objects:count:", &v88, v152, 16);
    if (v84)
    {
      v85 = v84;
      v86 = *(_QWORD *)v89;
      do
      {
        v87 = 0;
        do
        {
          if (*(_QWORD *)v89 != v86)
            objc_enumerationMutation(v83);
          objc_msgSend(*(id *)(*((_QWORD *)&v88 + 1) + 8 * v87++), "clearUnknownFields:", 1, (_QWORD)v88);
        }
        while (v85 != v87);
        v85 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v83, "countByEnumeratingWithState:objects:count:", &v88, v152, 16);
      }
      while (v85);
    }

    -[GEOWaypointInfo clearUnknownFields:](self->_originWaypointInfo, "clearUnknownFields:", 1);
    -[GEOWaypointInfo clearUnknownFields:](self->_destinationWaypointInfo, "clearUnknownFields:", 1);
    -[GEODrivingWalkingInstruction clearUnknownFields:]((uint64_t)self->_originListInstruction);
    -[GEODrivingWalkingInstruction clearUnknownFields:]((uint64_t)self->_destinationListInstruction);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zilchPoints, 0);
  objc_storeStrong((id *)&self->_updateLocations, 0);
  objc_storeStrong((id *)&self->_unpackedLatLngVertices, 0);
  objc_storeStrong((id *)&self->_trafficDescription, 0);
  objc_storeStrong((id *)&self->_trafficDescriptionLong, 0);
  objc_storeStrong((id *)&self->_trafficColorInfos, 0);
  objc_storeStrong((id *)&self->_steps, 0);
  objc_storeStrong((id *)&self->_stepGroups, 0);
  objc_storeStrong((id *)&self->_startingRouteInstructions, 0);
  objc_storeStrong((id *)&self->_routePlanningDescription, 0);
  objc_storeStrong((id *)&self->_routeLineStyleInfos, 0);
  objc_storeStrong((id *)&self->_routeLabelDetailText, 0);
  objc_storeStrong((id *)&self->_routeDescriptions, 0);
  objc_storeStrong((id *)&self->_routeCameraInputInfos, 0);
  objc_storeStrong((id *)&self->_routeNames, 0);
  objc_storeStrong((id *)&self->_routeID, 0);
  objc_storeStrong((id *)&self->_roadComplexitys, 0);
  objc_storeStrong((id *)&self->_restrictedZoneIds, 0);
  objc_storeStrong((id *)&self->_phoneticName, 0);
  objc_storeStrong((id *)&self->_pathMapMatcherInstructions, 0);
  objc_storeStrong((id *)&self->_pathLeg, 0);
  objc_storeStrong((id *)&self->_originWaypointInfo, 0);
  objc_storeStrong((id *)&self->_originListInstruction, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_launchAndGoCardText, 0);
  objc_storeStrong((id *)&self->_laneWidths, 0);
  objc_storeStrong((id *)&self->_infrastructureDescription, 0);
  objc_storeStrong((id *)&self->_incidentOnRouteInfos, 0);
  objc_storeStrong((id *)&self->_guidanceEvents, 0);
  objc_storeStrong((id *)&self->_enrouteNotices, 0);
  objc_storeStrong((id *)&self->_endingRouteInstructions, 0);
  objc_storeStrong((id *)&self->_elevationProfile, 0);
  objc_storeStrong((id *)&self->_destinationWaypointInfo, 0);
  objc_storeStrong((id *)&self->_destinationListInstruction, 0);
  objc_storeStrong((id *)&self->_departureRouteID, 0);
  objc_storeStrong((id *)&self->_clickableAdvisory, 0);
  objc_storeStrong((id *)&self->_basicPoints, 0);
  objc_storeStrong((id *)&self->_arrivalRouteID, 0);
  objc_storeStrong((id *)&self->_alertNonRecommendedRouteText, 0);
  objc_storeStrong((id *)&self->_advisoryNotices, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

- (void)controlPoints
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;

  if (!-[GEORoute zilchPointsCount](self, "zilchPointsCount"))
    return 0;
  -[GEORoute unpackedLatLngVertices](self, "unpackedLatLngVertices");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v4 = objc_msgSend(v3, "bytes");

  if (!v4)
    return 0;
  -[GEORoute unpackedLatLngVertices](self, "unpackedLatLngVertices");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v6 = (void *)objc_msgSend(v5, "bytes");

  return v6;
}

- ($1AB5FA073B851C12C2339EC22442E995)coordinateAt:(unsigned int)a3
{
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  $1AB5FA073B851C12C2339EC22442E995 result;

  -[GEORoute unpackedLatLngVertices](self, "unpackedLatLngVertices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[GEOPointUtility pointAt:pointData:usesZilch:](GEOPointUtility, "pointAt:pointData:usesZilch:", a3, v5, -[GEORoute zilchPointsCount](self, "zilchPointsCount") != 0);
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v7;
  v13 = v9;
  v14 = v11;
  result.var2 = v14;
  result.var1 = v13;
  result.var0 = v12;
  return result;
}

- (unsigned)pointCount
{
  void *v3;
  unsigned int v4;

  -[GEORoute unpackedLatLngVertices](self, "unpackedLatLngVertices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = +[GEOPointUtility pointCount:usesZilch:](GEOPointUtility, "pointCount:usesZilch:", v3, -[GEORoute zilchPointsCount](self, "zilchPointsCount") != 0);

  return v4;
}

- (BOOL)unpackLatLngVertices
{
  void *v3;
  void *v4;

  -[GEORoute unpackedLatLngVertices](self, "unpackedLatLngVertices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    return 1;
  -[GEORoute unpackZilchPoints](self, "unpackZilchPoints");
  -[GEORoute unpackedLatLngVertices](self, "unpackedLatLngVertices");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4 || -[GEORoute unpackBasicPoints](self, "unpackBasicPoints");
}

- (BOOL)unpackZilchPoints
{
  void *v3;
  void *v4;
  void *v5;

  -[GEORoute zilchPoints](self, "zilchPoints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[GEOPointUtility unpackPoints:usesZilch:](GEOPointUtility, "unpackPoints:usesZilch:", v4, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORoute setUnpackedLatLngVertices:](self, "setUnpackedLatLngVertices:", v5);

  return 1;
}

- (BOOL)unpackBasicPoints
{
  void *v3;
  void *v4;
  void *v5;

  -[GEORoute basicPoints](self, "basicPoints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[GEOPointUtility unpackPoints:usesZilch:](GEOPointUtility, "unpackPoints:usesZilch:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORoute setUnpackedLatLngVertices:](self, "setUnpackedLatLngVertices:", v5);

  return 1;
}

- (double)distanceFromStepIndex:(unint64_t)a3 toStepIndex:(unint64_t)a4
{
  double v4;
  unint64_t v6;
  void *v8;
  float v9;

  v4 = 0.0;
  if (a3 < a4)
  {
    v6 = a3;
    do
    {
      -[GEORoute stepAtIndex:](self, "stepAtIndex:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "distanceMeters");
      v4 = v4 + v9;

      ++v6;
    }
    while (a4 != v6);
  }
  return v4;
}

- (unint64_t)stepIndexForPointIndex:(unsigned int)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[GEORoute steps](self, "steps");
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = 0;
    v8 = *(_QWORD *)v15;
    while (2)
    {
      v9 = 0;
      v10 = v6 + v7;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v9), "maneuverEndIndex", (_QWORD)v14) > a3)
        {
          v12 = v7 + v9;
          v11 = v5;
          goto LABEL_11;
        }
        ++v9;
      }
      while (v6 != v9);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      v7 = v10;
      if (v6)
        continue;
      break;
    }
  }

  -[GEORoute steps](self, "steps");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count") - 1;
LABEL_11:

  return v12;
}

- (id)debugDescription
{
  unsigned int v3;
  void *v4;
  void *v5;

  v3 = -[GEORoute pointCount](self, "pointCount");
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCapacity:", 40 * v3 + 40);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORoute description](self, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("%@\n"), v5);

  return v4;
}

- (id)simplifiedDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  -[GEORoute dictionaryRepresentation](self, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObjectForKey:", CFSTR("latLngVertices"));
  objc_msgSend(v3, "removeObjectForKey:", CFSTR("unpackedLatLngVertices"));
  objc_msgSend(v3, "removeObjectForKey:", CFSTR("zilchPoints"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[GEORoute pointCount](self, "pointCount"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("unpackedLatLngVerticesCount"));

  v5 = (void *)MEMORY[0x1E0CB3940];
  v9.receiver = self;
  v9.super_class = (Class)GEORoute;
  -[GEORoute description](&v9, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ %@"), v6, v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (unint64_t)indexForStepID:(unint64_t)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[GEORoute steps](self, "steps", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = 0;
    v7 = *(_QWORD *)v13;
    while (2)
    {
      v8 = 0;
      v9 = v5 + v6;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "stepID") == a3)
        {
          v10 = v6 + v8;
          goto LABEL_11;
        }
        ++v8;
      }
      while (v5 != v8);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      v6 = v9;
      if (v5)
        continue;
      break;
    }
  }
  v10 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_11:

  return v10;
}

- (id)convertToFullRoute:(id)a3 includeDepartureRoutes:(BOOL)a4 uniquePointRange:(_NSRange *)a5
{
  _QWORD *v6;
  unint64_t v7;
  GEORoute *v8;
  _QWORD *v9;
  void *v10;
  _QWORD *v11;
  GEORoute *v12;
  unsigned int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unsigned int v17;
  void *v18;
  unsigned int v19;
  GEORoute *v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  void *v24;
  uint64_t v25;
  unsigned int v26;
  id v27;
  zilch::ControlPoint *v28;
  _DWORD *v29;
  unsigned int *v30;
  int32x2_t v31;
  void *v32;
  uint64_t v33;
  int v34;
  uint64_t i;
  void *v36;
  GEOEnrouteNotice *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t j;
  void *v42;
  GEOGuidanceEvent *v43;
  id *v44;
  unint64_t v45;
  void *v46;
  GEOStep *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t k;
  void *v52;
  GEOGuidanceEvent *v53;
  const zilch::ControlPoint *v54;
  float64x2_t *v55;
  _QWORD *v56;
  id v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  unsigned int v66;
  unsigned int v67;
  unsigned int v68;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  void *v79;
  BOOL v80;
  void *v81;
  void *v82;
  void *v83;
  uint64_t v84;
  unsigned int v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  float64x2_t v96;
  unsigned int v97;
  GEORouteTrafficBuilder *v98;
  unsigned int v99;
  float64x2_t *v101;
  _BOOL4 v102;
  GEORoute *v103;
  id v104;
  zilch::ControlPoint *v105;
  GEORoute *v106;
  id *v107;
  id v108;
  id obj;
  id v110;
  GEORoute *v111;
  GEORoute *v112;
  GEORoute *v113;
  uint64_t v114;
  id v115;
  uint64_t v116;
  unint64_t v117;
  int v118;
  unint64_t v119;
  char v120[8];
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
  _QWORD *v133;
  _BYTE v134[128];
  _BYTE v135[128];
  _BYTE v136[128];
  uint64_t v137;

  v102 = a4;
  v137 = *MEMORY[0x1E0C80C00];
  v108 = a3;
  -[GEORoute unpackLatLngVertices](self, "unpackLatLngVertices");
  v106 = self;
  if (-[GEORoute hasDepartureRouteID](self, "hasDepartureRouteID") && v102
    || -[GEORoute hasArrivalRouteID](self, "hasArrivalRouteID"))
  {
    v98 = objc_alloc_init(GEORouteTrafficBuilder);
    v6 = malloc_type_malloc(0x28uLL, 0x10A00400AA0B987uLL);
    *v6 = self;
    v6[1] = 0;
    v7 = -[GEORoute stepsCount](self, "stepsCount");
    v8 = 0;
    v6[3] = 0;
    v6[4] = 0;
    v9 = v6;
    v6[2] = v7;
    if (v102)
    {
      v111 = self;
      -[GEORoute departureRouteID](v111, "departureRouteID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        v9 = v6;
        v11 = v6;
        v12 = v111;
        do
        {
          v112 = v12;
          v13 = -[GEORoute departureStepID](v12, "departureStepID");
          objc_msgSend(v108, "objectForKey:", v10);
          v8 = (GEORoute *)objc_claimAutoreleasedReturnValue();

          v14 = -[GEORoute indexForStepID:](v8, "indexForStepID:", v13);
          if (v8)
          {
            v15 = v14;
            v9 = malloc_type_malloc(0x28uLL, 0x10A00400AA0B987uLL);
            *v9 = v8;
            v9[1] = 0;
            v9[3] = 0;
            v9[4] = v11;
            v11 = v9;
            v9[2] = v15;
          }
          -[GEORoute departureRouteID](v8, "departureRouteID");
          v16 = objc_claimAutoreleasedReturnValue();

          v12 = v8;
          v10 = (void *)v16;
        }
        while (v16);
      }
      else
      {
        v8 = v111;
        v9 = v6;
      }
    }
    -[GEORoute arrivalRouteID](v106, "arrivalRouteID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      do
      {
        v19 = objc_msgSend((id)*v6, "arrivalStepID");
        objc_msgSend(v108, "objectForKey:", v18);
        v20 = (GEORoute *)objc_claimAutoreleasedReturnValue();

        v21 = -[GEORoute indexForStepID:](v20, "indexForStepID:", v19);
        if (v20)
        {
          v22 = v21;
          v23 = malloc_type_malloc(0x28uLL, 0x10A00400AA0B987uLL);
          *v23 = v20;
          v23[1] = v22 + 1;
          v23[2] = -[GEORoute stepsCount](v20, "stepsCount");
          -[GEORoute stepAtIndex:](v20, "stepAtIndex:", v22);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v23[3] = objc_msgSend(v24, "maneuverEndIndex") + 1;

          v23[4] = 0;
          v6[4] = v23;
          v6 = v23;
        }
        -[GEORoute arrivalRouteID](v20, "arrivalRouteID");
        v25 = objc_claimAutoreleasedReturnValue();

        v8 = v20;
        v18 = (void *)v25;
      }
      while (v25);
    }
    else
    {
      v20 = v8;
    }
    v113 = v20;
    v103 = objc_alloc_init(GEORoute);
    -[GEORoute copyTo:](v106, "copyTo:");
    if (-[GEORoute incidentIndicesCount](v106, "incidentIndicesCount"))
      -[GEORoute setIncidentIndices:count:](v103, "setIncidentIndices:count:", -[GEORoute incidentIndices](v106, "incidentIndices"), -[GEORoute incidentIndicesCount](v106, "incidentIndicesCount"));
    if (-[GEORoute incidentEndOffsetsInRoutesCount](v106, "incidentEndOffsetsInRoutesCount"))
      -[GEORoute setIncidentEndOffsetsInRoutes:count:](v103, "setIncidentEndOffsetsInRoutes:count:", -[GEORoute incidentEndOffsetsInRoutes](v106, "incidentEndOffsetsInRoutes"), -[GEORoute incidentEndOffsetsInRoutesCount](v106, "incidentEndOffsetsInRoutesCount"));
    -[GEORoute setAvoidsTolls:](v103, "setAvoidsTolls:", -[GEORoute avoidsTolls](v106, "avoidsTolls"));
    -[GEORoute setAvoidsHighways:](v103, "setAvoidsHighways:", -[GEORoute avoidsHighways](v106, "avoidsHighways"));
    v104 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v115 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v110 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
    zilch::Message::Message((zilch::Message *)&v133);
    if (!v9)
    {
      v99 = 0;
      v97 = 0;
      goto LABEL_91;
    }
    v97 = 0;
    v99 = 0;
    v118 = 0;
    v96 = (float64x2_t)vdupq_n_s64(0x3E45798EE0000000uLL);
    while (1)
    {
      if (a5 && (GEORoute *)*v9 == v106)
      {
        if (v118)
        {
          v97 = v118 - 1;
          v26 = -[GEORoute pointCount](v106, "pointCount") + v118 - 1;
        }
        else
        {
          v97 = 0;
          v26 = -[GEORoute pointCount](v106, "pointCount") - 1;
        }
        v99 = v26;
      }
      -[GEORouteTrafficBuilder addTrafficFromRoute:withStepRange:](v98, "addTrafficFromRoute:withStepRange:", *v9, v9[1], v9[2] - v9[1], *(_OWORD *)&v96);
      v105 = (zilch::ControlPoint *)objc_msgSend((id)*v9, "controlPoints");
      v107 = (id *)v9;
      if (objc_msgSend((id)*v9, "zilchPointsCount"))
      {
        v101 = 0;
      }
      else
      {
        objc_msgSend((id)*v9, "unpackedLatLngVertices");
        v27 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v101 = (float64x2_t *)objc_msgSend(v27, "bytes");

      }
      v119 = v9[3];
      if (v118 && objc_msgSend((id)*v9, "pointCount"))
      {
        if (objc_msgSend((id)*v9, "zilchPointsCount")
          && (v28 = (zilch::ControlPoint *)zilch::Message::operator[](&v133, v118 - 1),
              v29 = (_DWORD *)zilch::ControlPoint::position(v28),
              v30 = (unsigned int *)zilch::ControlPoint::position(v105),
              zilch::GeoCoordinates::operator==(v29, v30))
          || !objc_msgSend((id)*v9, "zilchPointsCount")
          && (v31 = vmovn_s64(vcgtq_f64(v96, vabdq_f64(*(float64x2_t *)(objc_msgSend(objc_retainAutorelease(v110), "bytes")+ 16 * (v118 - 1)), *v101))), (v31.i32[0] & v31.i32[1] & 1) != 0))
        {
          ++v119;
        }
      }
      v131 = 0u;
      v132 = 0u;
      v129 = 0u;
      v130 = 0u;
      objc_msgSend((id)*v9, "enrouteNotices");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      obj = v32;
      v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v129, v136, 16);
      v34 = v118 - v119;
      if (v33)
      {
        v114 = *(_QWORD *)v130;
        do
        {
          v116 = v33;
          for (i = 0; i != v116; ++i)
          {
            if (*(_QWORD *)v130 != v114)
              objc_enumerationMutation(obj);
            v36 = *(void **)(*((_QWORD *)&v129 + 1) + 8 * i);
            v37 = objc_alloc_init(GEOEnrouteNotice);
            objc_msgSend(v36, "copyTo:", v37);
            -[GEOEnrouteNotice clearGuidances](v37, "clearGuidances");
            v127 = 0u;
            v128 = 0u;
            v125 = 0u;
            v126 = 0u;
            objc_msgSend(v36, "guidances");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v125, v135, 16);
            if (v39)
            {
              v40 = *(_QWORD *)v126;
              do
              {
                for (j = 0; j != v39; ++j)
                {
                  if (*(_QWORD *)v126 != v40)
                    objc_enumerationMutation(v38);
                  v42 = *(void **)(*((_QWORD *)&v125 + 1) + 8 * j);
                  v43 = objc_alloc_init(GEOGuidanceEvent);
                  objc_msgSend(v42, "copyTo:", v43);
                  if (-[GEOGuidanceEvent hasDistanceZilchIndex](v43, "hasDistanceZilchIndex"))
                    -[GEOGuidanceEvent setDistanceZilchIndex:](v43, "setDistanceZilchIndex:", -[GEOGuidanceEvent distanceZilchIndex](v43, "distanceZilchIndex") + v34);
                  -[GEOEnrouteNotice addGuidance:](v37, "addGuidance:", v43);

                }
                v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v125, v135, 16);
              }
              while (v39);
            }

            objc_msgSend(v115, "addObject:", v37);
          }
          v32 = obj;
          v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v129, v136, 16);
        }
        while (v33);
      }

      v44 = v107;
      v45 = (unint64_t)v107[1];
      while (v45 < (unint64_t)v44[2])
      {
        v117 = v45;
        objc_msgSend(*v44, "stepAtIndex:");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = objc_alloc_init(GEOStep);
        objc_msgSend(v46, "copyTo:", v47);
        if (objc_msgSend(v46, "hasManeuverEndBasicIndex"))
          -[GEOStep setManeuverEndBasicIndex:](v47, "setManeuverEndBasicIndex:", objc_msgSend(v46, "maneuverEndBasicIndex") + v34);
        if (objc_msgSend(v46, "hasManeuverStartZilchIndex"))
          -[GEOStep setManeuverStartZilchIndex:](v47, "setManeuverStartZilchIndex:", objc_msgSend(v46, "maneuverStartZilchIndex") + v34);
        if (objc_msgSend(v46, "hasManeuverEndZilchIndex"))
          -[GEOStep setManeuverEndZilchIndex:](v47, "setManeuverEndZilchIndex:", objc_msgSend(v46, "maneuverEndZilchIndex") + v34);
        if (objc_msgSend(v46, "hasHintFirstAnnouncementZilchIndex"))
          -[GEOStep setHintFirstAnnouncementZilchIndex:](v47, "setHintFirstAnnouncementZilchIndex:", objc_msgSend(v46, "hintFirstAnnouncementZilchIndex") + v34);
        -[GEOStep clearGuidanceEvents](v47, "clearGuidanceEvents");
        v123 = 0u;
        v124 = 0u;
        v121 = 0u;
        v122 = 0u;
        objc_msgSend(v46, "guidanceEvents");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v121, v134, 16);
        if (v49)
        {
          v50 = *(_QWORD *)v122;
          do
          {
            for (k = 0; k != v49; ++k)
            {
              if (*(_QWORD *)v122 != v50)
                objc_enumerationMutation(v48);
              v52 = *(void **)(*((_QWORD *)&v121 + 1) + 8 * k);
              v53 = objc_alloc_init(GEOGuidanceEvent);
              objc_msgSend(v52, "copyTo:", v53);
              if (-[GEOGuidanceEvent hasDistanceZilchIndex](v53, "hasDistanceZilchIndex"))
                -[GEOGuidanceEvent setDistanceZilchIndex:](v53, "setDistanceZilchIndex:", -[GEOGuidanceEvent distanceZilchIndex](v53, "distanceZilchIndex") + v34);
              -[GEOStep addGuidanceEvent:](v47, "addGuidanceEvent:", v53);

            }
            v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v121, v134, 16);
          }
          while (v49);
        }

        if (objc_msgSend(*v107, "zilchPointsCount") && v105)
        {
          v54 = (zilch::ControlPoint *)((char *)v105 + 32 * v119);
          while (v119 <= objc_msgSend(v46, "maneuverEndIndex"))
          {
            zilch::Message::addPoint((void ***)&v133, v54);
            ++v118;
            ++v119;
            v54 = (const zilch::ControlPoint *)((char *)v54 + 32);
          }
        }
        else
        {
          if (!objc_msgSend(*v107, "pointCount"))
            goto LABEL_87;
          v55 = &v101[v119];
          while (v119 <= objc_msgSend(v46, "maneuverEndIndex"))
          {
            objc_msgSend(v110, "appendBytes:length:", v55, 16);
            ++v118;
            ++v119;
            ++v55;
          }
        }
        v119 = objc_msgSend(v46, "maneuverEndIndex") + 1;
LABEL_87:
        objc_msgSend(v104, "addObject:", v47);

        v45 = v117 + 1;
        v44 = v107;
      }
      v56 = v44[4];
      free(v44);
      v9 = v56;
      if (!v56)
      {
LABEL_91:
        -[GEORoute setSteps:](v103, "setSteps:", v104);
        -[GEORoute setEnrouteNotices:](v103, "setEnrouteNotices:", v115);
        if (zilch::Message::size((zilch::Message *)&v133))
        {
          zilch::WriteBitstream::WriteBitstream((zilch::WriteBitstream *)v120);
          zilch::Message::encode((zilch::ControlPoint ***)&v133, (zilch::WriteBitstream *)v120, 3);
          zilch::WriteBitstream::finalize((zilch::WriteBitstream *)v120);
          v57 = objc_alloc(MEMORY[0x1E0C99D50]);
          v58 = zilch::WriteBitstream::bytes((zilch::WriteBitstream *)v120);
          v59 = (void *)objc_msgSend(v57, "initWithBytes:length:", v58, zilch::WriteBitstream::byteSize((zilch::WriteBitstream *)v120));
          objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v59);
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          -[GEORoute setZilchPoints:](v103, "setZilchPoints:", v60);

          -[GEORoute unpackZilchPoints](v103, "unpackZilchPoints");
          zilch::WriteBitstream::~WriteBitstream((zilch::WriteBitstream *)v120);
        }
        else
        {
          -[GEORoute setUnpackedLatLngVertices:](v103, "setUnpackedLatLngVertices:", v110);
        }
        -[GEORouteTrafficBuilder copyTrafficToRoute:](v98, "copyTrafficToRoute:", v103);
        if (a5)
        {
          if (v102
            && -[GEORoute hasDepartureRouteID](v106, "hasDepartureRouteID")
            && -[GEORoute hasDepartureStepID](v106, "hasDepartureStepID"))
          {
            -[GEORoute departureRouteID](v106, "departureRouteID");
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v108, "objectForKey:", v61);
            v62 = (void *)objc_claimAutoreleasedReturnValue();

            if (v62)
            {
              v63 = objc_msgSend(v62, "indexForStepID:", -[GEORoute departureStepID](v106, "departureStepID"));
              if (v63)
                v64 = v63 - 1;
              else
                v64 = 0;
              objc_msgSend(v62, "stepAtIndex:", v64);
              v65 = (void *)objc_claimAutoreleasedReturnValue();
              v66 = objc_msgSend(v65, "maneuverEndIndex");

              v67 = v97;
              do
              {
                v68 = v67;
                if (v66 >= objc_msgSend(v62, "pointCount") - 1 || v68 >= v99)
                  break;
                objc_msgSend(v62, "coordinateAt:", v66 + 1);
                v71 = v70;
                v73 = v72;
                v75 = v74;
                -[GEORoute coordinateAt:](v103, "coordinateAt:", v68 + 1);
                if (vabdd_f64(v71, v78) >= 0.00000000999999994)
                  break;
                if (vabdd_f64(v73, v76) >= 0.00000000999999994)
                  break;
                ++v66;
                v67 = v68 + 1;
              }
              while (vabdd_f64(v75, v77) < 0.00000000999999994);
            }
            else
            {
              v68 = v97;
            }

          }
          else
          {
            v68 = v97;
          }
          -[GEORoute arrivalRouteID](v106, "arrivalRouteID");
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          v80 = v79 == 0;

          if (v80)
          {
            v85 = v99;
          }
          else
          {
            -[GEORoute arrivalRouteID](v106, "arrivalRouteID");
            v81 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v108, "objectForKey:", v81);
            v82 = (void *)objc_claimAutoreleasedReturnValue();

            if (v82)
            {
              objc_msgSend(v82, "stepAtIndex:", objc_msgSend(v82, "indexForStepID:", -[GEORoute arrivalStepID](v106, "arrivalStepID")));
              v83 = (void *)objc_claimAutoreleasedReturnValue();
              LODWORD(v84) = objc_msgSend(v83, "maneuverEndIndex");

              do
              {
                v85 = v99;
                if (v84 < 2)
                  break;
                if (v99 <= v68)
                  break;
                v84 = (v84 - 1);
                objc_msgSend(v82, "coordinateAt:", v84);
                v87 = v86;
                v89 = v88;
                v91 = v90;
                --v99;
                -[GEORoute coordinateAt:](v103, "coordinateAt:");
                if (vabdd_f64(v87, v94) >= 0.00000000999999994)
                  break;
              }
              while (vabdd_f64(v89, v92) < 0.00000000999999994 && vabdd_f64(v91, v93) < 0.00000000999999994);
            }
            else
            {
              v85 = v99;
            }

          }
          a5->location = v68;
          a5->length = v85 - v68 + 1;
        }
        zilch::Message::~Message((zilch::Message *)&v133);

        goto LABEL_126;
      }
    }
  }
  if (a5)
  {
    v17 = -[GEORoute pointCount](self, "pointCount");
    a5->location = 0;
    a5->length = v17;
  }
  v103 = self;
LABEL_126:

  return v103;
}

- (id)newETARoute
{
  return -[GEORoute newETARouteFromStepIndex:stepPercentRemaining:](self, "newETARouteFromStepIndex:stepPercentRemaining:", 0, 1.0);
}

- (id)newETARouteFromStepIndex:(unint64_t)a3 stepPercentRemaining:(double)a4
{
  unint64_t v7;
  GEOETARoute *v8;
  char *v9;
  char *v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  uint64_t v16;
  unint64_t v17;
  void *v18;
  GEOETAStep *v19;
  float v20;
  uint64_t v21;
  float v22;
  const zilch::ControlPoint *v23;
  id v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v29;
  void **v30;

  v7 = -[GEORoute stepsCount](self, "stepsCount");
  v8 = 0;
  if (-[GEORoute zilchPointsCount](self, "zilchPointsCount") && v7)
  {
    v9 = -[GEORoute controlPoints](self, "controlPoints");
    if (v9)
    {
      v10 = v9;
      v8 = objc_alloc_init(GEOETARoute);
      -[GEORoute routeID](self, "routeID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEOETARoute setRouteID:](v8, "setRouteID:", v11);

      zilch::Message::Message((zilch::Message *)&v30);
      -[GEORoute steps](self, "steps");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (a3)
      {
        if (a3 - 1 >= v7 - 1)
          v14 = v7 - 1;
        else
          v14 = a3 - 1;
        objc_msgSend(v12, "objectAtIndex:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v16) = objc_msgSend(v15, "maneuverEndZilchIndex");

      }
      else
      {
        LODWORD(v16) = 0;
      }
      if (v7 > a3)
      {
        v17 = a3;
        do
        {
          objc_msgSend(v13, "objectAtIndex:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_alloc_init(GEOETAStep);
          -[GEOETAStep setStepID:](v19, "setStepID:", objc_msgSend(v18, "stepID"));
          if (v17 == a3)
          {
            -[GEOETAStep setExpectedTime:](v19, "setExpectedTime:", ((double)objc_msgSend(v18, "expectedTime") * a4));
            objc_msgSend(v18, "distanceMeters");
            LODWORD(v21) = vcvtad_u64_f64(v20 * a4 * 100.0);
          }
          else
          {
            -[GEOETAStep setExpectedTime:](v19, "setExpectedTime:", objc_msgSend(v18, "expectedTime"));
            objc_msgSend(v18, "distanceMeters");
            LODWORD(v21) = vcvtas_u32_f32(v22 * 100.0);
          }
          -[GEOETAStep setDistanceCm:](v19, "setDistanceCm:", v21);
          -[GEOETARoute addStep:](v8, "addStep:", v19);
          v16 = (int)v16;
          v23 = (const zilch::ControlPoint *)&v10[32 * (int)v16];
          while (v16 <= (int)objc_msgSend(v18, "maneuverEndZilchIndex"))
          {
            if (!zilch::ControlPoint::dummy(v23))
              zilch::Message::addPoint(&v30, v23);
            ++v16;
            v23 = (const zilch::ControlPoint *)((char *)v23 + 32);
          }
          -[GEOETAStep setZilchPointIndex:](v19, "setZilchPointIndex:", zilch::Message::size((zilch::Message *)&v30) - 1);

          ++v17;
        }
        while (v17 != v7);
      }
      if (zilch::Message::size((zilch::Message *)&v30))
      {
        zilch::WriteBitstream::WriteBitstream((zilch::WriteBitstream *)&v29);
        zilch::Message::encode((zilch::ControlPoint ***)&v30, (zilch::WriteBitstream *)&v29, 3);
        zilch::WriteBitstream::finalize((zilch::WriteBitstream *)&v29);
        v24 = objc_alloc(MEMORY[0x1E0C99D50]);
        v25 = zilch::WriteBitstream::bytes((zilch::WriteBitstream *)&v29);
        v26 = (void *)objc_msgSend(v24, "initWithBytes:length:", v25, zilch::WriteBitstream::byteSize((zilch::WriteBitstream *)&v29));
        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[GEOETARoute setZilchPoints:](v8, "setZilchPoints:", v27);

        zilch::WriteBitstream::~WriteBitstream((zilch::WriteBitstream *)&v29);
      }

      zilch::Message::~Message((zilch::Message *)&v30);
    }
    else
    {
      return 0;
    }
  }
  return v8;
}

- (BOOL)isContingentRouteFor:(id)a3 afterPoint:(unsigned int)a4 mainRoutes:(id)a5
{
  uint64_t v6;
  GEORoute *v8;
  id v9;
  unint64_t v10;
  unint64_t v11;
  BOOL v12;
  void *v13;
  unsigned int v14;
  id v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t i;
  GEORoute *v20;
  unint64_t v21;
  unint64_t v22;
  void *v23;
  BOOL v24;
  unint64_t v26;
  GEORoute *v27;
  id v28;
  GEORoute *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v6 = *(_QWORD *)&a4;
  v35 = *MEMORY[0x1E0C80C00];
  v8 = (GEORoute *)a3;
  v9 = a5;
  v29 = v8;
  if (-[GEORoute routeType](self, "routeType") == 2)
  {
    v28 = v9;
    v10 = -[GEORoute stepIndexForPointIndex:](self, "stepIndexForPointIndex:", v6);
    v27 = self;
    while (1)
    {
      v11 = -[GEORoute stepsCount](self, "stepsCount");
      v12 = v10 >= v11;
      if (v10 >= v11)
        break;
      -[GEORoute stepAtIndex:](self, "stepAtIndex:", v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "stepID");

      v32 = 0u;
      v33 = 0u;
      v30 = 0u;
      v31 = 0u;
      v15 = v9;
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      if (v16)
      {
        v26 = v10;
        v17 = 0;
        v18 = *(_QWORD *)v31;
        while (2)
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v31 != v18)
              objc_enumerationMutation(v15);
            v20 = *(GEORoute **)(*((_QWORD *)&v30 + 1) + 8 * i);
            v21 = -[GEORoute indexForStepID:](v20, "indexForStepID:", v14, v26);
            if (v21 != 0x7FFFFFFFFFFFFFFFLL)
            {
              if (v20 == v29)
              {
                v8 = v29;
                v9 = v28;
                do
                {
                  v22 = -[GEORoute stepsCount](v29, "stepsCount");
                  v12 = v21 >= v22;
                  if (v21 >= v22)
                    break;
                  -[GEORoute stepAtIndex:](v29, "stepAtIndex:", v21);
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  v24 = -[GEORoute indexForStepID:](v27, "indexForStepID:", objc_msgSend(v23, "stepID")) == 0x7FFFFFFFFFFFFFFFLL;

                  ++v21;
                }
                while (!v24);

                goto LABEL_23;
              }
              v17 = 1;
            }
          }
          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
          if (v16)
            continue;
          break;
        }

        v9 = v28;
        v8 = v29;
        v10 = v26;
        self = v27;
        if ((v17 & 1) != 0)
          break;
      }
      else
      {

        v9 = v28;
      }
      ++v10;
    }
  }
  else
  {
    v12 = self == v8;
  }
LABEL_23:

  return v12;
}

- (BOOL)isMainOrAlternateRoute
{
  return !-[GEORoute routeType](self, "routeType") || -[GEORoute routeType](self, "routeType") == 1;
}

- (BOOL)isContingentRoute
{
  return -[GEORoute routeType](self, "routeType") == 3 || -[GEORoute routeType](self, "routeType") == 2;
}

- (int)transportTypeForStep:(id)a3
{
  id v4;
  int v5;
  int v6;

  v4 = a3;
  if (objc_msgSend(v4, "hasOverrideTransportType"))
    v5 = objc_msgSend(v4, "overrideTransportType");
  else
    v5 = -[GEORoute transportType](self, "transportType");
  v6 = v5;

  return v6;
}

@end
