@implementation GEOCompanionRouteDetails

- (GEOCompanionRouteDetails)init
{
  GEOCompanionRouteDetails *v2;
  GEOCompanionRouteDetails *v3;
  GEOCompanionRouteDetails *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOCompanionRouteDetails;
  v2 = -[GEOCompanionRouteDetails init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOCompanionRouteDetails)initWithData:(id)a3
{
  GEOCompanionRouteDetails *v3;
  GEOCompanionRouteDetails *v4;
  GEOCompanionRouteDetails *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOCompanionRouteDetails;
  v3 = -[GEOCompanionRouteDetails initWithData:](&v7, sel_initWithData_, a3);
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

  PBRepeatedDoubleClear();
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOCompanionRouteDetails;
  -[GEOCompanionRouteDetails dealloc](&v3, sel_dealloc);
}

- (void)_readDestinationName
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 272));
    if ((*(_BYTE *)(a1 + 306) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOCompanionRouteDetailsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDestinationName_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 272));
  }
}

- (BOOL)hasDestinationName
{
  -[GEOCompanionRouteDetails _readDestinationName]((uint64_t)self);
  return self->_destinationName != 0;
}

- (NSString)destinationName
{
  -[GEOCompanionRouteDetails _readDestinationName]((uint64_t)self);
  return self->_destinationName;
}

- (void)setDestinationName:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x200010000uLL;
  objc_storeStrong((id *)&self->_destinationName, a3);
}

- (unsigned)originalDuration
{
  return self->_originalDuration;
}

- (void)setOriginalDuration:(unsigned int)a3
{
  *(_QWORD *)&self->_flags |= 0x200000004uLL;
  self->_originalDuration = a3;
}

- (void)setHasOriginalDuration:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000;
  if (a3)
    v3 = 0x200000004;
  self->_flags = ($7FBD6F428C719CB9236B8F56DD82782C)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFFFBLL | v3);
}

- (BOOL)hasOriginalDuration
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (void)_readSteps
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 272));
    if ((*(_BYTE *)(a1 + 307) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOCompanionRouteDetailsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSteps_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 272));
  }
}

- (NSMutableArray)steps
{
  -[GEOCompanionRouteDetails _readSteps]((uint64_t)self);
  return self->_steps;
}

- (void)setSteps:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *steps;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x10000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x200000000uLL;
  steps = self->_steps;
  self->_steps = v4;

}

- (void)clearSteps
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x10000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(_QWORD *)&self->_flags |= 0x200000000uLL;
  -[NSMutableArray removeAllObjects](self->_steps, "removeAllObjects");
}

- (void)addStep:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOCompanionRouteDetails _readSteps]((uint64_t)self);
  -[GEOCompanionRouteDetails _addNoFlagsStep:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x10000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x200000000uLL;
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
    v4 = *(void **)(a1 + 224);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 224);
      *(_QWORD *)(a1 + 224) = v5;

      v4 = *(void **)(a1 + 224);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)stepsCount
{
  -[GEOCompanionRouteDetails _readSteps]((uint64_t)self);
  return -[NSMutableArray count](self->_steps, "count");
}

- (id)stepAtIndex:(unint64_t)a3
{
  -[GEOCompanionRouteDetails _readSteps]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_steps, "objectAtIndex:", a3);
}

+ (Class)stepType
{
  return (Class)objc_opt_class();
}

- (void)_readCoordinates
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 272));
    if ((*(_BYTE *)(a1 + 305) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOCompanionRouteDetailsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCoordinates_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 272));
  }
}

- (unint64_t)coordinatesCount
{
  -[GEOCompanionRouteDetails _readCoordinates]((uint64_t)self);
  return self->_coordinates.count;
}

- (double)coordinates
{
  -[GEOCompanionRouteDetails _readCoordinates]((uint64_t)self);
  return self->_coordinates.list;
}

- (void)clearCoordinates
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x400uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(_QWORD *)&self->_flags |= 0x200000000uLL;
  PBRepeatedDoubleClear();
}

- (void)addCoordinates:(double)a3
{
  -[GEOCompanionRouteDetails _readCoordinates]((uint64_t)self);
  if (self)
    PBRepeatedDoubleAdd();
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x400uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x200000000uLL;
}

- (double)coordinatesAtIndex:(unint64_t)a3
{
  $A57E80F8F7F5C5FFA4899556F12E1D96 *p_coordinates;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEOCompanionRouteDetails _readCoordinates]((uint64_t)self);
  p_coordinates = &self->_coordinates;
  count = self->_coordinates.count;
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
  return p_coordinates->list[a3];
}

- (void)setCoordinates:(double *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x400uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(_QWORD *)&self->_flags |= 0x200000000uLL;
  PBRepeatedDoubleSet();
}

- (void)_readRouteID
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 272));
    if ((*(_BYTE *)(a1 + 307) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOCompanionRouteDetailsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRouteID_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 272));
  }
}

- (BOOL)hasRouteID
{
  -[GEOCompanionRouteDetails _readRouteID]((uint64_t)self);
  return self->_routeID != 0;
}

- (NSData)routeID
{
  -[GEOCompanionRouteDetails _readRouteID]((uint64_t)self);
  return self->_routeID;
}

- (void)setRouteID:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x208000000uLL;
  objc_storeStrong((id *)&self->_routeID, a3);
}

- (void)_readDestination
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 272));
    if ((*(_BYTE *)(a1 + 306) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOCompanionRouteDetailsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDestination_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 272));
  }
}

- (BOOL)hasDestination
{
  -[GEOCompanionRouteDetails _readDestination]((uint64_t)self);
  return self->_destination != 0;
}

- (GEOMapItemStorage)destination
{
  -[GEOCompanionRouteDetails _readDestination]((uint64_t)self);
  return self->_destination;
}

- (void)setDestination:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x200020000uLL;
  objc_storeStrong((id *)&self->_destination, a3);
}

- (void)_readOrigin
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 272));
    if ((*(_BYTE *)(a1 + 306) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOCompanionRouteDetailsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readOrigin_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 272));
  }
}

- (BOOL)hasOrigin
{
  -[GEOCompanionRouteDetails _readOrigin]((uint64_t)self);
  return self->_origin != 0;
}

- (GEOMapItemStorage)origin
{
  -[GEOCompanionRouteDetails _readOrigin]((uint64_t)self);
  return self->_origin;
}

- (void)setOrigin:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x200400000uLL;
  objc_storeStrong((id *)&self->_origin, a3);
}

- (void)_readTrafficColors
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 272));
    if ((*(_BYTE *)(a1 + 305) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOCompanionRouteDetailsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTrafficColors_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 272));
  }
}

- (unint64_t)trafficColorsCount
{
  -[GEOCompanionRouteDetails _readTrafficColors]((uint64_t)self);
  return self->_trafficColors.count;
}

- (unsigned)trafficColors
{
  -[GEOCompanionRouteDetails _readTrafficColors]((uint64_t)self);
  return self->_trafficColors.list;
}

- (void)clearTrafficColors
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x2000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(_QWORD *)&self->_flags |= 0x200000000uLL;
  PBRepeatedUInt32Clear();
}

- (void)addTrafficColor:(unsigned int)a3
{
  -[GEOCompanionRouteDetails _readTrafficColors]((uint64_t)self);
  if (self)
    PBRepeatedUInt32Add();
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x2000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x200000000uLL;
}

- (unsigned)trafficColorAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_trafficColors;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEOCompanionRouteDetails _readTrafficColors]((uint64_t)self);
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
  *(_QWORD *)&self->_flags |= 0x2000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(_QWORD *)&self->_flags |= 0x200000000uLL;
  PBRepeatedUInt32Set();
}

- (void)_readTrafficColorOffsets
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 272));
    if ((*(_BYTE *)(a1 + 305) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOCompanionRouteDetailsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTrafficColorOffsets_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 272));
  }
}

- (unint64_t)trafficColorOffsetsCount
{
  -[GEOCompanionRouteDetails _readTrafficColorOffsets]((uint64_t)self);
  return self->_trafficColorOffsets.count;
}

- (unsigned)trafficColorOffsets
{
  -[GEOCompanionRouteDetails _readTrafficColorOffsets]((uint64_t)self);
  return self->_trafficColorOffsets.list;
}

- (void)clearTrafficColorOffsets
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x1000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(_QWORD *)&self->_flags |= 0x200000000uLL;
  PBRepeatedUInt32Clear();
}

- (void)addTrafficColorOffset:(unsigned int)a3
{
  -[GEOCompanionRouteDetails _readTrafficColorOffsets]((uint64_t)self);
  if (self)
    PBRepeatedUInt32Add();
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x1000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x200000000uLL;
}

- (unsigned)trafficColorOffsetAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_trafficColorOffsets;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEOCompanionRouteDetails _readTrafficColorOffsets]((uint64_t)self);
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
  *(_QWORD *)&self->_flags |= 0x1000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(_QWORD *)&self->_flags |= 0x200000000uLL;
  PBRepeatedUInt32Set();
}

- (unsigned)historicalDuration
{
  return self->_historicalDuration;
}

- (void)setHistoricalDuration:(unsigned int)a3
{
  *(_QWORD *)&self->_flags |= 0x200000002uLL;
  self->_historicalDuration = a3;
}

- (void)setHasHistoricalDuration:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000;
  if (a3)
    v3 = 0x200000002;
  self->_flags = ($7FBD6F428C719CB9236B8F56DD82782C)(*(_QWORD *)&self->_flags & 0xFFFFFFFDFFFFFFFDLL | v3);
}

- (BOOL)hasHistoricalDuration
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (BOOL)canNavigate
{
  return self->_canNavigate;
}

- (void)setCanNavigate:(BOOL)a3
{
  *(_QWORD *)&self->_flags |= 0x200000040uLL;
  self->_canNavigate = a3;
}

- (void)setHasCanNavigate:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000;
  if (a3)
    v3 = 0x200000040;
  self->_flags = ($7FBD6F428C719CB9236B8F56DD82782C)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFFBFLL | v3);
}

- (BOOL)hasCanNavigate
{
  return (*(_BYTE *)&self->_flags >> 6) & 1;
}

- (void)_readName
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 272));
    if ((*(_BYTE *)(a1 + 306) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOCompanionRouteDetailsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readName_tags_5);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 272));
  }
}

- (BOOL)hasName
{
  -[GEOCompanionRouteDetails _readName]((uint64_t)self);
  return self->_name != 0;
}

- (NSString)name
{
  -[GEOCompanionRouteDetails _readName]((uint64_t)self);
  return self->_name;
}

- (void)setName:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x200080000uLL;
  objc_storeStrong((id *)&self->_name, a3);
}

- (unsigned)distance
{
  return self->_distance;
}

- (void)setDistance:(unsigned int)a3
{
  *(_QWORD *)&self->_flags |= 0x200000001uLL;
  self->_distance = a3;
}

- (void)setHasDistance:(BOOL)a3
{
  self->_flags = ($7FBD6F428C719CB9236B8F56DD82782C)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFFFELL | a3 | 0x200000000);
}

- (BOOL)hasDistance
{
  return *(_DWORD *)&self->_flags & 1;
}

- (void)_readOriginalSuggestedRoute
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 272));
    if ((*(_BYTE *)(a1 + 306) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOCompanionRouteDetailsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readOriginalSuggestedRoute_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 272));
  }
}

- (BOOL)hasOriginalSuggestedRoute
{
  -[GEOCompanionRouteDetails _readOriginalSuggestedRoute]((uint64_t)self);
  return self->_originalSuggestedRoute != 0;
}

- (GEOTransitSuggestedRoute)originalSuggestedRoute
{
  -[GEOCompanionRouteDetails _readOriginalSuggestedRoute]((uint64_t)self);
  return self->_originalSuggestedRoute;
}

- (void)setOriginalSuggestedRoute:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x200200000uLL;
  objc_storeStrong((id *)&self->_originalSuggestedRoute, a3);
}

- (void)_readDecoderData
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 272));
    if ((*(_BYTE *)(a1 + 305) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOCompanionRouteDetailsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDecoderData_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 272));
  }
}

- (BOOL)hasDecoderData
{
  -[GEOCompanionRouteDetails _readDecoderData]((uint64_t)self);
  return self->_decoderData != 0;
}

- (GEOTransitDecoderData)decoderData
{
  -[GEOCompanionRouteDetails _readDecoderData]((uint64_t)self);
  return self->_decoderData;
}

- (void)setDecoderData:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x200008000uLL;
  objc_storeStrong((id *)&self->_decoderData, a3);
}

- (BOOL)showTransitSchedules
{
  os_unfair_lock_s *p_readerLock;
  $7FBD6F428C719CB9236B8F56DD82782C flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  return (*(_WORD *)&flags & 0x200) == 0 || self->_showTransitSchedules;
}

- (void)setShowTransitSchedules:(BOOL)a3
{
  *(_QWORD *)&self->_flags |= 0x200000200uLL;
  self->_showTransitSchedules = a3;
}

- (void)setHasShowTransitSchedules:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000;
  if (a3)
    v3 = 0x200000200;
  self->_flags = ($7FBD6F428C719CB9236B8F56DD82782C)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFDFFLL | v3);
}

- (BOOL)hasShowTransitSchedules
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 1) & 1;
}

- (int)transportType
{
  os_unfair_lock_s *p_readerLock;
  $7FBD6F428C719CB9236B8F56DD82782C flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_BYTE *)&flags & 0x20) != 0)
    return self->_transportType;
  else
    return 0;
}

- (void)setTransportType:(int)a3
{
  *(_QWORD *)&self->_flags |= 0x200000020uLL;
  self->_transportType = a3;
}

- (void)setHasTransportType:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000;
  if (a3)
    v3 = 0x200000020;
  self->_flags = ($7FBD6F428C719CB9236B8F56DD82782C)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFFDFLL | v3);
}

- (BOOL)hasTransportType
{
  return (*(_BYTE *)&self->_flags >> 5) & 1;
}

- (id)transportTypeAsString:(int)a3
{
  if (a3 < 7)
    return off_1E1C070D8[a3];
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

- (void)_readRequest
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 272));
    if ((*(_BYTE *)(a1 + 306) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOCompanionRouteDetailsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRequest_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 272));
  }
}

- (BOOL)hasRequest
{
  -[GEOCompanionRouteDetails _readRequest]((uint64_t)self);
  return self->_request != 0;
}

- (GEODirectionsRequest)request
{
  -[GEOCompanionRouteDetails _readRequest]((uint64_t)self);
  return self->_request;
}

- (void)setRequest:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x200800000uLL;
  objc_storeStrong((id *)&self->_request, a3);
}

- (void)_readResponse
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 272));
    if ((*(_BYTE *)(a1 + 307) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOCompanionRouteDetailsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readResponse_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 272));
  }
}

- (BOOL)hasResponse
{
  -[GEOCompanionRouteDetails _readResponse]((uint64_t)self);
  return self->_response != 0;
}

- (GEODirectionsResponse)response
{
  -[GEOCompanionRouteDetails _readResponse]((uint64_t)self);
  return self->_response;
}

- (void)setResponse:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x201000000uLL;
  objc_storeStrong((id *)&self->_response, a3);
}

- (void)_readTrafficDescription
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 272));
    if ((*(_BYTE *)(a1 + 307) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOCompanionRouteDetailsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTrafficDescription_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 272));
  }
}

- (BOOL)hasTrafficDescription
{
  -[GEOCompanionRouteDetails _readTrafficDescription]((uint64_t)self);
  return self->_trafficDescription != 0;
}

- (NSString)trafficDescription
{
  -[GEOCompanionRouteDetails _readTrafficDescription]((uint64_t)self);
  return self->_trafficDescription;
}

- (void)setTrafficDescription:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x280000000uLL;
  objc_storeStrong((id *)&self->_trafficDescription, a3);
}

- (void)_readOriginalRouteID
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 272));
    if ((*(_BYTE *)(a1 + 306) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOCompanionRouteDetailsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readOriginalRouteID_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 272));
  }
}

- (BOOL)hasOriginalRouteID
{
  -[GEOCompanionRouteDetails _readOriginalRouteID]((uint64_t)self);
  return self->_originalRouteID != 0;
}

- (NSData)originalRouteID
{
  -[GEOCompanionRouteDetails _readOriginalRouteID]((uint64_t)self);
  return self->_originalRouteID;
}

- (void)setOriginalRouteID:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x200100000uLL;
  objc_storeStrong((id *)&self->_originalRouteID, a3);
}

- (void)_readRouteDescriptions
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 272));
    if ((*(_BYTE *)(a1 + 307) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOCompanionRouteDetailsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRouteDescriptions_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 272));
  }
}

- (NSMutableArray)routeDescriptions
{
  -[GEOCompanionRouteDetails _readRouteDescriptions]((uint64_t)self);
  return self->_routeDescriptions;
}

- (void)setRouteDescriptions:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *routeDescriptions;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x4000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x200000000uLL;
  routeDescriptions = self->_routeDescriptions;
  self->_routeDescriptions = v4;

}

- (void)clearRouteDescriptions
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x4000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(_QWORD *)&self->_flags |= 0x200000000uLL;
  -[NSMutableArray removeAllObjects](self->_routeDescriptions, "removeAllObjects");
}

- (void)addRouteDescriptions:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOCompanionRouteDetails _readRouteDescriptions]((uint64_t)self);
  -[GEOCompanionRouteDetails _addNoFlagsRouteDescriptions:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x4000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x200000000uLL;
}

- (void)_addNoFlagsRouteDescriptions:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 208);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 208);
      *(_QWORD *)(a1 + 208) = v5;

      v4 = *(void **)(a1 + 208);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)routeDescriptionsCount
{
  -[GEOCompanionRouteDetails _readRouteDescriptions]((uint64_t)self);
  return -[NSMutableArray count](self->_routeDescriptions, "count");
}

- (id)routeDescriptionsAtIndex:(unint64_t)a3
{
  -[GEOCompanionRouteDetails _readRouteDescriptions]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_routeDescriptions, "objectAtIndex:", a3);
}

+ (Class)routeDescriptionsType
{
  return (Class)objc_opt_class();
}

- (BOOL)isTrace
{
  return self->_isTrace;
}

- (void)setIsTrace:(BOOL)a3
{
  *(_QWORD *)&self->_flags |= 0x200000100uLL;
  self->_isTrace = a3;
}

- (void)setHasIsTrace:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000;
  if (a3)
    v3 = 0x200000100;
  self->_flags = ($7FBD6F428C719CB9236B8F56DD82782C)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFEFFLL | v3);
}

- (BOOL)hasIsTrace
{
  return *((_BYTE *)&self->_flags + 1) & 1;
}

- (void)_readRevisionID
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 272));
    if ((*(_BYTE *)(a1 + 307) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOCompanionRouteDetailsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRevisionID_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 272));
  }
}

- (BOOL)hasRevisionID
{
  -[GEOCompanionRouteDetails _readRevisionID]((uint64_t)self);
  return self->_revisionID != 0;
}

- (NSData)revisionID
{
  -[GEOCompanionRouteDetails _readRevisionID]((uint64_t)self);
  return self->_revisionID;
}

- (void)setRevisionID:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x202000000uLL;
  objc_storeStrong((id *)&self->_revisionID, a3);
}

- (void)_readWaypoints
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 272));
    if ((*(_BYTE *)(a1 + 308) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOCompanionRouteDetailsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readWaypoints_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 272));
  }
}

- (NSMutableArray)waypoints
{
  -[GEOCompanionRouteDetails _readWaypoints]((uint64_t)self);
  return self->_waypoints;
}

- (void)setWaypoints:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *waypoints;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x100000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x200000000uLL;
  waypoints = self->_waypoints;
  self->_waypoints = v4;

}

- (void)clearWaypoints
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x100000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(_QWORD *)&self->_flags |= 0x200000000uLL;
  -[NSMutableArray removeAllObjects](self->_waypoints, "removeAllObjects");
}

- (void)addWaypoints:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOCompanionRouteDetails _readWaypoints]((uint64_t)self);
  -[GEOCompanionRouteDetails _addNoFlagsWaypoints:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x100000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x200000000uLL;
}

- (void)_addNoFlagsWaypoints:(uint64_t)a1
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

- (unint64_t)waypointsCount
{
  -[GEOCompanionRouteDetails _readWaypoints]((uint64_t)self);
  return -[NSMutableArray count](self->_waypoints, "count");
}

- (id)waypointsAtIndex:(unint64_t)a3
{
  -[GEOCompanionRouteDetails _readWaypoints]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_waypoints, "objectAtIndex:", a3);
}

+ (Class)waypointsType
{
  return (Class)objc_opt_class();
}

- (unsigned)routeIndex
{
  return self->_routeIndex;
}

- (void)setRouteIndex:(unsigned int)a3
{
  *(_QWORD *)&self->_flags |= 0x200000008uLL;
  self->_routeIndex = a3;
}

- (void)setHasRouteIndex:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000;
  if (a3)
    v3 = 0x200000008;
  self->_flags = ($7FBD6F428C719CB9236B8F56DD82782C)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFFF7 | v3);
}

- (BOOL)hasRouteIndex
{
  return (*(_BYTE *)&self->_flags >> 3) & 1;
}

- (void)_readEtaResponse
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 272));
    if ((*(_BYTE *)(a1 + 306) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOCompanionRouteDetailsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readEtaResponse_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 272));
  }
}

- (BOOL)hasEtaResponse
{
  -[GEOCompanionRouteDetails _readEtaResponse]((uint64_t)self);
  return self->_etaResponse != 0;
}

- (GEOETATrafficUpdateResponse)etaResponse
{
  -[GEOCompanionRouteDetails _readEtaResponse]((uint64_t)self);
  return self->_etaResponse;
}

- (void)setEtaResponse:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x200040000uLL;
  objc_storeStrong((id *)&self->_etaResponse, a3);
}

- (BOOL)disallowStandaloneFallback
{
  return self->_disallowStandaloneFallback;
}

- (void)setDisallowStandaloneFallback:(BOOL)a3
{
  *(_QWORD *)&self->_flags |= 0x200000080uLL;
  self->_disallowStandaloneFallback = a3;
}

- (void)setHasDisallowStandaloneFallback:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000;
  if (a3)
    v3 = 0x200000080;
  self->_flags = ($7FBD6F428C719CB9236B8F56DD82782C)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFF7FLL | v3);
}

- (BOOL)hasDisallowStandaloneFallback
{
  return *(_BYTE *)&self->_flags >> 7;
}

- (void)_readStyleAttributes
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 272));
    if ((*(_BYTE *)(a1 + 307) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOCompanionRouteDetailsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readStyleAttributes_tags_1);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 272));
  }
}

- (BOOL)hasStyleAttributes
{
  -[GEOCompanionRouteDetails _readStyleAttributes]((uint64_t)self);
  return self->_styleAttributes != 0;
}

- (GEOStyleAttributes)styleAttributes
{
  -[GEOCompanionRouteDetails _readStyleAttributes]((uint64_t)self);
  return self->_styleAttributes;
}

- (void)setStyleAttributes:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x240000000uLL;
  objc_storeStrong((id *)&self->_styleAttributes, a3);
}

- (void)_readSelectedRideIndexs
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 272));
    if ((*(_BYTE *)(a1 + 305) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOCompanionRouteDetailsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSelectedRideIndexs_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 272));
  }
}

- (unint64_t)selectedRideIndexsCount
{
  -[GEOCompanionRouteDetails _readSelectedRideIndexs]((uint64_t)self);
  return self->_selectedRideIndexs.count;
}

- (unsigned)selectedRideIndexs
{
  -[GEOCompanionRouteDetails _readSelectedRideIndexs]((uint64_t)self);
  return self->_selectedRideIndexs.list;
}

- (void)clearSelectedRideIndexs
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x800uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(_QWORD *)&self->_flags |= 0x200000000uLL;
  PBRepeatedUInt32Clear();
}

- (void)addSelectedRideIndex:(unsigned int)a3
{
  -[GEOCompanionRouteDetails _readSelectedRideIndexs]((uint64_t)self);
  if (self)
    PBRepeatedUInt32Add();
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x800uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x200000000uLL;
}

- (unsigned)selectedRideIndexAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_selectedRideIndexs;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEOCompanionRouteDetails _readSelectedRideIndexs]((uint64_t)self);
  p_selectedRideIndexs = &self->_selectedRideIndexs;
  count = self->_selectedRideIndexs.count;
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
  return p_selectedRideIndexs->list[a3];
}

- (void)setSelectedRideIndexs:(unsigned int *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x800uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(_QWORD *)&self->_flags |= 0x200000000uLL;
  PBRepeatedUInt32Set();
}

- (unsigned)source
{
  return self->_source;
}

- (void)setSource:(unsigned int)a3
{
  *(_QWORD *)&self->_flags |= 0x200000010uLL;
  self->_source = a3;
}

- (void)setHasSource:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000;
  if (a3)
    v3 = 0x200000010;
  self->_flags = ($7FBD6F428C719CB9236B8F56DD82782C)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFFEFLL | v3);
}

- (BOOL)hasSource
{
  return (*(_BYTE *)&self->_flags >> 4) & 1;
}

- (void)_readStorageID
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 272));
    if ((*(_BYTE *)(a1 + 307) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOCompanionRouteDetailsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readStorageID_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 272));
  }
}

- (BOOL)hasStorageID
{
  -[GEOCompanionRouteDetails _readStorageID]((uint64_t)self);
  return self->_storageID != 0;
}

- (NSData)storageID
{
  -[GEOCompanionRouteDetails _readStorageID]((uint64_t)self);
  return self->_storageID;
}

- (void)setStorageID:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x220000000uLL;
  objc_storeStrong((id *)&self->_storageID, a3);
}

- (void)_readAnchorPointsData
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 272));
    if ((*(_BYTE *)(a1 + 305) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOCompanionRouteDetailsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAnchorPointsData_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 272));
  }
}

- (BOOL)hasAnchorPointsData
{
  -[GEOCompanionRouteDetails _readAnchorPointsData]((uint64_t)self);
  return self->_anchorPointsData != 0;
}

- (NSData)anchorPointsData
{
  -[GEOCompanionRouteDetails _readAnchorPointsData]((uint64_t)self);
  return self->_anchorPointsData;
}

- (void)setAnchorPointsData:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x200004000uLL;
  objc_storeStrong((id *)&self->_anchorPointsData, a3);
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
  v8.super_class = (Class)GEOCompanionRouteDetails;
  -[GEOCompanionRouteDetails description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOCompanionRouteDetails dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOCompanionRouteDetails _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
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
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  id v37;
  uint64_t v38;
  void *v39;
  const __CFString *v40;
  uint64_t v41;
  __CFString *v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t j;
  void *v59;
  id v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  id v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t k;
  void *v71;
  id v72;
  void *v73;
  void *v74;
  void *v75;
  id v76;
  void *v77;
  void *v78;
  void *v79;
  id v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  id v89;
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
  _BYTE v103[128];
  _BYTE v104[128];
  _BYTE v105[128];
  uint64_t v106;

  v106 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)a1, "destinationName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("destinationName"));

  if ((*(_BYTE *)(a1 + 304) & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 284));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("originalDuration"));

  }
  if (objc_msgSend(*(id *)(a1 + 224), "count"))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 224), "count"));
    v99 = 0u;
    v100 = 0u;
    v101 = 0u;
    v102 = 0u;
    v8 = *(id *)(a1 + 224);
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v99, v105, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v100;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v100 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v99 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v13, "jsonRepresentation");
          else
            objc_msgSend(v13, "dictionaryRepresentation");
          v14 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v7, "addObject:", v14);
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v99, v105, 16);
      }
      while (v10);
    }

    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("step"));
  }
  if (*(_QWORD *)(a1 + 24))
  {
    PBRepeatedDoubleNSArray();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("coordinates"));

  }
  objc_msgSend((id)a1, "routeID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v16)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v16, "base64EncodedStringWithOptions:", 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v18, CFSTR("routeID"));

    }
    else
    {
      objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("routeID"));
    }
  }

  objc_msgSend((id)a1, "destination");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v19)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v19, "jsonRepresentation");
    else
      objc_msgSend(v19, "dictionaryRepresentation");
    v21 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKey:", v21, CFSTR("destination"));
  }

  objc_msgSend((id)a1, "origin");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22;
  if (v22)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v22, "jsonRepresentation");
    else
      objc_msgSend(v22, "dictionaryRepresentation");
    v24 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKey:", v24, CFSTR("origin"));
  }

  if (*(_QWORD *)(a1 + 96))
  {
    PBRepeatedUInt32NSArray();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v25, CFSTR("trafficColor"));

  }
  if (*(_QWORD *)(a1 + 72))
  {
    PBRepeatedUInt32NSArray();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v26, CFSTR("trafficColorOffset"));

  }
  v27 = *(_QWORD *)(a1 + 304);
  if ((v27 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 280));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v28, CFSTR("historicalDuration"));

    v27 = *(_QWORD *)(a1 + 304);
  }
  if ((v27 & 0x40) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 300));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v29, CFSTR("canNavigate"));

  }
  objc_msgSend((id)a1, "name");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (v30)
    objc_msgSend(v4, "setObject:forKey:", v30, CFSTR("name"));

  if ((*(_BYTE *)(a1 + 304) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 276));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v31, CFSTR("distance"));

  }
  objc_msgSend((id)a1, "originalSuggestedRoute");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v32;
  if (v32)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v32, "jsonRepresentation");
    else
      objc_msgSend(v32, "dictionaryRepresentation");
    v34 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKey:", v34, CFSTR("originalSuggestedRoute"));
  }

  objc_msgSend((id)a1, "decoderData");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v35;
  if (v35)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v35, "jsonRepresentation");
    else
      objc_msgSend(v35, "dictionaryRepresentation");
    v37 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKey:", v37, CFSTR("decoderData"));
  }

  v38 = *(_QWORD *)(a1 + 304);
  if ((v38 & 0x200) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 303));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v40 = CFSTR("showTransitSchedules");
    else
      v40 = CFSTR("show_transit_schedules");
    objc_msgSend(v4, "setObject:forKey:", v39, v40);

    v38 = *(_QWORD *)(a1 + 304);
  }
  if ((v38 & 0x20) != 0)
  {
    v41 = *(int *)(a1 + 296);
    if (v41 >= 7)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 296));
      v42 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v42 = off_1E1C070D8[v41];
    }
    objc_msgSend(v4, "setObject:forKey:", v42, CFSTR("transportType"));

  }
  objc_msgSend((id)a1, "request");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = v43;
  if (v43)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v43, "jsonRepresentation");
    else
      objc_msgSend(v43, "dictionaryRepresentation");
    v45 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKey:", v45, CFSTR("request"));
  }

  objc_msgSend((id)a1, "response");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = v46;
  if (v46)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v46, "jsonRepresentation");
    else
      objc_msgSend(v46, "dictionaryRepresentation");
    v48 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKey:", v48, CFSTR("response"));
  }

  objc_msgSend((id)a1, "trafficDescription");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  if (v49)
    objc_msgSend(v4, "setObject:forKey:", v49, CFSTR("trafficDescription"));

  objc_msgSend((id)a1, "originalRouteID");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = v50;
  if (v50)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v50, "base64EncodedStringWithOptions:", 0);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v52, CFSTR("originalRouteID"));

    }
    else
    {
      objc_msgSend(v4, "setObject:forKey:", v50, CFSTR("originalRouteID"));
    }
  }

  if (objc_msgSend(*(id *)(a1 + 208), "count"))
  {
    v53 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 208), "count"));
    v95 = 0u;
    v96 = 0u;
    v97 = 0u;
    v98 = 0u;
    v54 = *(id *)(a1 + 208);
    v55 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v95, v104, 16);
    if (v55)
    {
      v56 = v55;
      v57 = *(_QWORD *)v96;
      do
      {
        for (j = 0; j != v56; ++j)
        {
          if (*(_QWORD *)v96 != v57)
            objc_enumerationMutation(v54);
          v59 = *(void **)(*((_QWORD *)&v95 + 1) + 8 * j);
          if ((a2 & 1) != 0)
            objc_msgSend(v59, "jsonRepresentation");
          else
            objc_msgSend(v59, "dictionaryRepresentation");
          v60 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v53, "addObject:", v60);
        }
        v56 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v95, v104, 16);
      }
      while (v56);
    }

    objc_msgSend(v4, "setObject:forKey:", v53, CFSTR("routeDescriptions"));
  }
  if ((*(_BYTE *)(a1 + 305) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 302));
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v61, CFSTR("isTrace"));

  }
  objc_msgSend((id)a1, "revisionID");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = v62;
  if (v62)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v62, "base64EncodedStringWithOptions:", 0);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v64, CFSTR("revisionID"));

    }
    else
    {
      objc_msgSend(v4, "setObject:forKey:", v62, CFSTR("revisionID"));
    }
  }

  if (objc_msgSend(*(id *)(a1 + 256), "count"))
  {
    v65 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 256), "count"));
    v91 = 0u;
    v92 = 0u;
    v93 = 0u;
    v94 = 0u;
    v66 = *(id *)(a1 + 256);
    v67 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v91, v103, 16);
    if (v67)
    {
      v68 = v67;
      v69 = *(_QWORD *)v92;
      do
      {
        for (k = 0; k != v68; ++k)
        {
          if (*(_QWORD *)v92 != v69)
            objc_enumerationMutation(v66);
          v71 = *(void **)(*((_QWORD *)&v91 + 1) + 8 * k);
          if ((a2 & 1) != 0)
            objc_msgSend(v71, "jsonRepresentation");
          else
            objc_msgSend(v71, "dictionaryRepresentation");
          v72 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v65, "addObject:", v72);
        }
        v68 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v91, v103, 16);
      }
      while (v68);
    }

    objc_msgSend(v4, "setObject:forKey:", v65, CFSTR("waypoints"));
  }
  if ((*(_BYTE *)(a1 + 304) & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 288));
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v73, CFSTR("routeIndex"));

  }
  objc_msgSend((id)a1, "etaResponse");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v75 = v74;
  if (v74)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v74, "jsonRepresentation");
    else
      objc_msgSend(v74, "dictionaryRepresentation");
    v76 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKey:", v76, CFSTR("etaResponse"));
  }

  if ((*(_BYTE *)(a1 + 304) & 0x80) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 301));
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v77, CFSTR("disallowStandaloneFallback"));

  }
  objc_msgSend((id)a1, "styleAttributes");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v79 = v78;
  if (v78)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v78, "jsonRepresentation");
    else
      objc_msgSend(v78, "dictionaryRepresentation");
    v80 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKey:", v80, CFSTR("styleAttributes"));
  }

  if (*(_QWORD *)(a1 + 48))
  {
    PBRepeatedUInt32NSArray();
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v81, CFSTR("selectedRideIndex"));

  }
  if ((*(_BYTE *)(a1 + 304) & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 292));
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v82, CFSTR("source"));

  }
  objc_msgSend((id)a1, "storageID");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v84 = v83;
  if (v83)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v83, "base64EncodedStringWithOptions:", 0);
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v85, CFSTR("storageID"));

    }
    else
    {
      objc_msgSend(v4, "setObject:forKey:", v83, CFSTR("storageID"));
    }
  }

  objc_msgSend((id)a1, "anchorPointsData");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v87 = v86;
  if (v86)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v86, "base64EncodedStringWithOptions:", 0);
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v88, CFSTR("anchorPointsData"));

    }
    else
    {
      objc_msgSend(v4, "setObject:forKey:", v86, CFSTR("anchorPointsData"));
    }
  }

  v89 = v4;
  return v89;
}

- (id)jsonRepresentation
{
  return -[GEOCompanionRouteDetails _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOCompanionRouteDetails)initWithDictionary:(id)a3
{
  return (GEOCompanionRouteDetails *)-[GEOCompanionRouteDetails _initWithDictionary:isJSON:](self, a3, 0);
}

- (id)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  GEOCompanionStep *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  GEOMapItemStorage *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  GEOMapItemStorage *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t k;
  void *v42;
  void *v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t m;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  GEOTransitSuggestedRoute *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  GEOTransitDecoderData *v60;
  uint64_t v61;
  void *v62;
  const __CFString *v63;
  void *v64;
  void *v65;
  id v66;
  uint64_t v67;
  void *v68;
  GEODirectionsRequest *v69;
  uint64_t v70;
  void *v71;
  void *v72;
  GEODirectionsResponse *v73;
  uint64_t v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  id v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t n;
  uint64_t v86;
  GEOFormattedString *v87;
  uint64_t v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  id v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t ii;
  uint64_t v99;
  GEOCompanionWaypoint *v100;
  uint64_t v101;
  void *v102;
  void *v103;
  void *v104;
  GEOETATrafficUpdateResponse *v105;
  uint64_t v106;
  void *v107;
  void *v108;
  void *v109;
  GEOStyleAttributes *v110;
  uint64_t v111;
  void *v112;
  void *v113;
  id v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t jj;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v126;
  void *v127;
  id v128;
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
  _BYTE v157[128];
  _BYTE v158[128];
  _BYTE v159[128];
  _BYTE v160[128];
  _BYTE v161[128];
  _BYTE v162[128];
  _BYTE v163[128];
  uint64_t v164;

  v164 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (!a1)
    goto LABEL_187;
  a1 = (id)objc_msgSend(a1, "init");

  if (!a1)
    goto LABEL_187;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("destinationName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(a1, "setDestinationName:", v7);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("originalDuration"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setOriginalDuration:", objc_msgSend(v8, "unsignedIntValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("step"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v128 = v5;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v155 = 0u;
    v156 = 0u;
    v153 = 0u;
    v154 = 0u;
    v126 = v9;
    v10 = v9;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v153, v163, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v154;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v154 != v13)
            objc_enumerationMutation(v10);
          v15 = *(_QWORD *)(*((_QWORD *)&v153 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v16 = [GEOCompanionStep alloc];
            if ((a3 & 1) != 0)
              v17 = -[GEOCompanionStep initWithJSON:](v16, "initWithJSON:", v15);
            else
              v17 = -[GEOCompanionStep initWithDictionary:](v16, "initWithDictionary:", v15);
            v18 = (void *)v17;
            objc_msgSend(a1, "addStep:", v17, v126);

          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v153, v163, 16);
      }
      while (v12);
    }

    v9 = v126;
    v5 = v128;
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("coordinates"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v151 = 0u;
    v152 = 0u;
    v149 = 0u;
    v150 = 0u;
    v20 = v19;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v149, v162, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v150;
      do
      {
        for (j = 0; j != v22; ++j)
        {
          if (*(_QWORD *)v150 != v23)
            objc_enumerationMutation(v20);
          v25 = *(void **)(*((_QWORD *)&v149 + 1) + 8 * j);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v25, "doubleValue");
            objc_msgSend(a1, "addCoordinates:");
          }
        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v149, v162, 16);
      }
      while (v22);
    }

    v5 = v128;
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("routeID"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v26, 0);
    objc_msgSend(a1, "setRouteID:", v27);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("destination"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v29 = [GEOMapItemStorage alloc];
    if ((a3 & 1) != 0)
      v30 = -[GEOMapItemStorage initWithJSON:](v29, "initWithJSON:", v28);
    else
      v30 = -[GEOMapItemStorage initWithDictionary:](v29, "initWithDictionary:", v28);
    v31 = (void *)v30;
    objc_msgSend(a1, "setDestination:", v30, v126);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("origin"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v33 = [GEOMapItemStorage alloc];
    if ((a3 & 1) != 0)
      v34 = -[GEOMapItemStorage initWithJSON:](v33, "initWithJSON:", v32);
    else
      v34 = -[GEOMapItemStorage initWithDictionary:](v33, "initWithDictionary:", v32);
    v35 = (void *)v34;
    objc_msgSend(a1, "setOrigin:", v34, v126);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("trafficColor"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v147 = 0u;
    v148 = 0u;
    v145 = 0u;
    v146 = 0u;
    v37 = v36;
    v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v145, v161, 16);
    if (v38)
    {
      v39 = v38;
      v40 = *(_QWORD *)v146;
      do
      {
        for (k = 0; k != v39; ++k)
        {
          if (*(_QWORD *)v146 != v40)
            objc_enumerationMutation(v37);
          v42 = *(void **)(*((_QWORD *)&v145 + 1) + 8 * k);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(a1, "addTrafficColor:", objc_msgSend(v42, "unsignedIntValue"));
        }
        v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v145, v161, 16);
      }
      while (v39);
    }

    v5 = v128;
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("trafficColorOffset"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v143 = 0u;
    v144 = 0u;
    v141 = 0u;
    v142 = 0u;
    v44 = v43;
    v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v141, v160, 16);
    if (v45)
    {
      v46 = v45;
      v47 = *(_QWORD *)v142;
      do
      {
        for (m = 0; m != v46; ++m)
        {
          if (*(_QWORD *)v142 != v47)
            objc_enumerationMutation(v44);
          v49 = *(void **)(*((_QWORD *)&v141 + 1) + 8 * m);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(a1, "addTrafficColorOffset:", objc_msgSend(v49, "unsignedIntValue"));
        }
        v46 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v141, v160, 16);
      }
      while (v46);
    }

    v5 = v128;
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("historicalDuration"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setHistoricalDuration:", objc_msgSend(v50, "unsignedIntValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("canNavigate"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setCanNavigate:", objc_msgSend(v51, "BOOLValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("name"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v53 = (void *)objc_msgSend(v52, "copy");
    objc_msgSend(a1, "setName:", v53);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("distance"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setDistance:", objc_msgSend(v54, "unsignedIntValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("originalSuggestedRoute"));
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v56 = [GEOTransitSuggestedRoute alloc];
    if ((a3 & 1) != 0)
      v57 = -[GEOTransitSuggestedRoute initWithJSON:](v56, "initWithJSON:", v55);
    else
      v57 = -[GEOTransitSuggestedRoute initWithDictionary:](v56, "initWithDictionary:", v55);
    v58 = (void *)v57;
    objc_msgSend(a1, "setOriginalSuggestedRoute:", v57, v126);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("decoderData"));
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v60 = [GEOTransitDecoderData alloc];
    if ((a3 & 1) != 0)
      v61 = -[GEOTransitDecoderData initWithJSON:](v60, "initWithJSON:", v59);
    else
      v61 = -[GEOTransitDecoderData initWithDictionary:](v60, "initWithDictionary:", v59);
    v62 = (void *)v61;
    objc_msgSend(a1, "setDecoderData:", v61, v126);

  }
  if (a3)
    v63 = CFSTR("showTransitSchedules");
  else
    v63 = CFSTR("show_transit_schedules");
  objc_msgSend(v5, "objectForKeyedSubscript:", v63, v126);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setShowTransitSchedules:", objc_msgSend(v64, "BOOLValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("transportType"));
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v66 = v65;
    if ((objc_msgSend(v66, "isEqualToString:", CFSTR("AUTOMOBILE")) & 1) != 0)
    {
      v67 = 0;
    }
    else if ((objc_msgSend(v66, "isEqualToString:", CFSTR("TRANSIT")) & 1) != 0)
    {
      v67 = 1;
    }
    else if ((objc_msgSend(v66, "isEqualToString:", CFSTR("WALKING")) & 1) != 0)
    {
      v67 = 2;
    }
    else if ((objc_msgSend(v66, "isEqualToString:", CFSTR("BICYCLE")) & 1) != 0)
    {
      v67 = 3;
    }
    else if ((objc_msgSend(v66, "isEqualToString:", CFSTR("UNKNOWN_TRANSPORT_TYPE")) & 1) != 0)
    {
      v67 = 4;
    }
    else if ((objc_msgSend(v66, "isEqualToString:", CFSTR("FERRY")) & 1) != 0)
    {
      v67 = 5;
    }
    else if (objc_msgSend(v66, "isEqualToString:", CFSTR("RIDESHARE")))
    {
      v67 = 6;
    }
    else
    {
      v67 = 0;
    }

    goto LABEL_108;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v67 = objc_msgSend(v65, "intValue");
LABEL_108:
    objc_msgSend(a1, "setTransportType:", v67);
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("request"));
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v69 = [GEODirectionsRequest alloc];
    if ((a3 & 1) != 0)
      v70 = -[GEODirectionsRequest initWithJSON:](v69, "initWithJSON:", v68);
    else
      v70 = -[GEODirectionsRequest initWithDictionary:](v69, "initWithDictionary:", v68);
    v71 = (void *)v70;
    objc_msgSend(a1, "setRequest:", v70);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("response"));
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v73 = [GEODirectionsResponse alloc];
    if ((a3 & 1) != 0)
      v74 = -[GEODirectionsResponse initWithJSON:](v73, "initWithJSON:", v72);
    else
      v74 = -[GEODirectionsResponse initWithDictionary:](v73, "initWithDictionary:", v72);
    v75 = (void *)v74;
    objc_msgSend(a1, "setResponse:", v74);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("trafficDescription"));
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v77 = (void *)objc_msgSend(v76, "copy");
    objc_msgSend(a1, "setTrafficDescription:", v77);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("originalRouteID"));
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v79 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v78, 0);
    objc_msgSend(a1, "setOriginalRouteID:", v79);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("routeDescriptions"));
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v139 = 0u;
    v140 = 0u;
    v137 = 0u;
    v138 = 0u;
    v127 = v80;
    v81 = v80;
    v82 = objc_msgSend(v81, "countByEnumeratingWithState:objects:count:", &v137, v159, 16);
    if (v82)
    {
      v83 = v82;
      v84 = *(_QWORD *)v138;
      do
      {
        for (n = 0; n != v83; ++n)
        {
          if (*(_QWORD *)v138 != v84)
            objc_enumerationMutation(v81);
          v86 = *(_QWORD *)(*((_QWORD *)&v137 + 1) + 8 * n);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v87 = [GEOFormattedString alloc];
            if ((a3 & 1) != 0)
              v88 = -[GEOFormattedString initWithJSON:](v87, "initWithJSON:", v86);
            else
              v88 = -[GEOFormattedString initWithDictionary:](v87, "initWithDictionary:", v86);
            v89 = (void *)v88;
            objc_msgSend(a1, "addRouteDescriptions:", v88, v127);

          }
        }
        v83 = objc_msgSend(v81, "countByEnumeratingWithState:objects:count:", &v137, v159, 16);
      }
      while (v83);
    }

    v80 = v127;
    v5 = v128;
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("isTrace"));
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setIsTrace:", objc_msgSend(v90, "BOOLValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("revisionID"));
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v92 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v91, 0);
    objc_msgSend(a1, "setRevisionID:", v92);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("waypoints"));
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v135 = 0u;
    v136 = 0u;
    v133 = 0u;
    v134 = 0u;
    v127 = v93;
    v94 = v93;
    v95 = objc_msgSend(v94, "countByEnumeratingWithState:objects:count:", &v133, v158, 16);
    if (v95)
    {
      v96 = v95;
      v97 = *(_QWORD *)v134;
      do
      {
        for (ii = 0; ii != v96; ++ii)
        {
          if (*(_QWORD *)v134 != v97)
            objc_enumerationMutation(v94);
          v99 = *(_QWORD *)(*((_QWORD *)&v133 + 1) + 8 * ii);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v100 = [GEOCompanionWaypoint alloc];
            if ((a3 & 1) != 0)
              v101 = -[GEOCompanionWaypoint initWithJSON:](v100, "initWithJSON:", v99);
            else
              v101 = -[GEOCompanionWaypoint initWithDictionary:](v100, "initWithDictionary:", v99);
            v102 = (void *)v101;
            objc_msgSend(a1, "addWaypoints:", v101, v127);

          }
        }
        v96 = objc_msgSend(v94, "countByEnumeratingWithState:objects:count:", &v133, v158, 16);
      }
      while (v96);
    }

    v93 = v127;
    v5 = v128;
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("routeIndex"));
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setRouteIndex:", objc_msgSend(v103, "unsignedIntValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("etaResponse"));
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v105 = [GEOETATrafficUpdateResponse alloc];
    if ((a3 & 1) != 0)
      v106 = -[GEOETATrafficUpdateResponse initWithJSON:](v105, "initWithJSON:", v104);
    else
      v106 = -[GEOETATrafficUpdateResponse initWithDictionary:](v105, "initWithDictionary:", v104);
    v107 = (void *)v106;
    objc_msgSend(a1, "setEtaResponse:", v106, v127);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("disallowStandaloneFallback"));
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setDisallowStandaloneFallback:", objc_msgSend(v108, "BOOLValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("styleAttributes"));
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v110 = [GEOStyleAttributes alloc];
    if ((a3 & 1) != 0)
      v111 = -[GEOStyleAttributes initWithJSON:](v110, "initWithJSON:", v109);
    else
      v111 = -[GEOStyleAttributes initWithDictionary:](v110, "initWithDictionary:", v109);
    v112 = (void *)v111;
    objc_msgSend(a1, "setStyleAttributes:", v111, v127);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("selectedRideIndex"));
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v131 = 0u;
    v132 = 0u;
    v129 = 0u;
    v130 = 0u;
    v114 = v113;
    v115 = objc_msgSend(v114, "countByEnumeratingWithState:objects:count:", &v129, v157, 16);
    if (v115)
    {
      v116 = v115;
      v117 = *(_QWORD *)v130;
      do
      {
        for (jj = 0; jj != v116; ++jj)
        {
          if (*(_QWORD *)v130 != v117)
            objc_enumerationMutation(v114);
          v119 = *(void **)(*((_QWORD *)&v129 + 1) + 8 * jj);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(a1, "addSelectedRideIndex:", objc_msgSend(v119, "unsignedIntValue"));
        }
        v116 = objc_msgSend(v114, "countByEnumeratingWithState:objects:count:", &v129, v157, 16);
      }
      while (v116);
    }

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("source"));
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setSource:", objc_msgSend(v120, "unsignedIntValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("storageID"));
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v122 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v121, 0);
    objc_msgSend(a1, "setStorageID:", v122);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("anchorPointsData"));
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v124 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v123, 0);
    objc_msgSend(a1, "setAnchorPointsData:", v124);

  }
  a1 = a1;

LABEL_187:
  return a1;
}

- (GEOCompanionRouteDetails)initWithJSON:(id)a3
{
  return (GEOCompanionRouteDetails *)-[GEOCompanionRouteDetails _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_374;
    else
      v8 = (int *)&readAll__nonRecursiveTag_375;
    GEOCompanionRouteDetailsReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEOCompanionRouteDetailsCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOCompanionRouteDetailsIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOCompanionRouteDetailsReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  $7FBD6F428C719CB9236B8F56DD82782C flags;
  $7FBD6F428C719CB9236B8F56DD82782C v14;
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  NSMutableArray *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t k;
  unint64_t v23;
  PBDataReader *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOCompanionRouteDetailsIsDirty((uint64_t)self) & 1) == 0)
  {
    v24 = self->_reader;
    objc_sync_enter(v24);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v25);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v24);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOCompanionRouteDetails readAll:](self, "readAll:", 0);
    if (self->_destinationName)
      PBDataWriterWriteStringField();
    if ((*(_BYTE *)&self->_flags & 4) != 0)
      PBDataWriterWriteUint32Field();
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v6 = self->_steps;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v36;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v36 != v8)
            objc_enumerationMutation(v6);
          PBDataWriterWriteSubmessage();
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
      }
      while (v7);
    }

    if (self->_coordinates.count)
    {
      v34 = 0;
      PBDataWriterPlaceMark();
      if (self->_coordinates.count)
      {
        v10 = 0;
        do
        {
          PBDataWriterWriteDoubleField();
          ++v10;
        }
        while (v10 < self->_coordinates.count);
      }
      PBDataWriterRecallMark();
    }
    if (self->_routeID)
      PBDataWriterWriteDataField();
    if (self->_destination)
      PBDataWriterWriteSubmessage();
    if (self->_origin)
      PBDataWriterWriteSubmessage();
    if (self->_trafficColors.count)
    {
      v11 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        ++v11;
      }
      while (v11 < self->_trafficColors.count);
    }
    if (self->_trafficColorOffsets.count)
    {
      v12 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        ++v12;
      }
      while (v12 < self->_trafficColorOffsets.count);
    }
    flags = self->_flags;
    if ((*(_BYTE *)&flags & 2) != 0)
    {
      PBDataWriterWriteUint32Field();
      flags = self->_flags;
    }
    if ((*(_BYTE *)&flags & 0x40) != 0)
      PBDataWriterWriteBOOLField();
    if (self->_name)
      PBDataWriterWriteStringField();
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      PBDataWriterWriteUint32Field();
    if (self->_originalSuggestedRoute)
      PBDataWriterWriteSubmessage();
    if (self->_decoderData)
      PBDataWriterWriteSubmessage();
    v14 = self->_flags;
    if ((*(_WORD *)&v14 & 0x200) != 0)
    {
      PBDataWriterWriteBOOLField();
      v14 = self->_flags;
    }
    if ((*(_BYTE *)&v14 & 0x20) != 0)
      PBDataWriterWriteInt32Field();
    if (self->_request)
      PBDataWriterWriteSubmessage();
    if (self->_response)
      PBDataWriterWriteSubmessage();
    if (self->_trafficDescription)
      PBDataWriterWriteStringField();
    if (self->_originalRouteID)
      PBDataWriterWriteDataField();
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v15 = self->_routeDescriptions;
    v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
    if (v16)
    {
      v17 = *(_QWORD *)v31;
      do
      {
        for (j = 0; j != v16; ++j)
        {
          if (*(_QWORD *)v31 != v17)
            objc_enumerationMutation(v15);
          PBDataWriterWriteSubmessage();
        }
        v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
      }
      while (v16);
    }

    if ((*((_BYTE *)&self->_flags + 1) & 1) != 0)
      PBDataWriterWriteBOOLField();
    if (self->_revisionID)
      PBDataWriterWriteDataField();
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v19 = self->_waypoints;
    v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v26, v39, 16);
    if (v20)
    {
      v21 = *(_QWORD *)v27;
      do
      {
        for (k = 0; k != v20; ++k)
        {
          if (*(_QWORD *)v27 != v21)
            objc_enumerationMutation(v19);
          PBDataWriterWriteSubmessage();
        }
        v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v26, v39, 16);
      }
      while (v20);
    }

    if ((*(_BYTE *)&self->_flags & 8) != 0)
      PBDataWriterWriteUint32Field();
    if (self->_etaResponse)
      PBDataWriterWriteSubmessage();
    if ((*(_BYTE *)&self->_flags & 0x80) != 0)
      PBDataWriterWriteBOOLField();
    if (self->_styleAttributes)
      PBDataWriterWriteSubmessage();
    if (self->_selectedRideIndexs.count)
    {
      v23 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        ++v23;
      }
      while (v23 < self->_selectedRideIndexs.count);
    }
    if ((*(_BYTE *)&self->_flags & 0x10) != 0)
      PBDataWriterWriteUint32Field();
    if (self->_storageID)
      PBDataWriterWriteDataField();
    if (self->_anchorPointsData)
      PBDataWriterWriteDataField();
  }

}

- (void)clearSensitiveFields:(unint64_t)a3
{
  GEOCompanionRouteDetailsClearSensitiveFields((id *)&self->super.super.isa, a3, 1);
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;
  BOOL v5;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
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
  -[GEOCompanionRouteDetails _readDecoderData]((uint64_t)self);
  if (!-[GEOTransitDecoderData hasGreenTeaWithValue:](self->_decoderData, "hasGreenTeaWithValue:", v3))
  {
    -[GEOCompanionRouteDetails _readDestination]((uint64_t)self);
    if (!-[GEOMapItemStorage hasGreenTeaWithValue:](self->_destination, "hasGreenTeaWithValue:", v3))
    {
      -[GEOCompanionRouteDetails _readEtaResponse]((uint64_t)self);
      if (!-[GEOETATrafficUpdateResponse hasGreenTeaWithValue:](self->_etaResponse, "hasGreenTeaWithValue:", v3))
      {
        -[GEOCompanionRouteDetails _readOrigin]((uint64_t)self);
        if (!-[GEOMapItemStorage hasGreenTeaWithValue:](self->_origin, "hasGreenTeaWithValue:", v3))
        {
          -[GEOCompanionRouteDetails _readOriginalSuggestedRoute]((uint64_t)self);
          if (!-[GEOTransitSuggestedRoute hasGreenTeaWithValue:](self->_originalSuggestedRoute, "hasGreenTeaWithValue:", v3))
          {
            -[GEOCompanionRouteDetails _readRequest]((uint64_t)self);
            if (!-[GEODirectionsRequest hasGreenTeaWithValue:](self->_request, "hasGreenTeaWithValue:", v3))
            {
              -[GEOCompanionRouteDetails _readResponse]((uint64_t)self);
              if (!-[GEODirectionsResponse hasGreenTeaWithValue:](self->_response, "hasGreenTeaWithValue:", v3))
              {
                -[GEOCompanionRouteDetails _readSteps]((uint64_t)self);
                v22 = 0u;
                v23 = 0u;
                v20 = 0u;
                v21 = 0u;
                v7 = self->_steps;
                v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
                if (v8)
                {
                  v9 = v8;
                  v10 = *(_QWORD *)v21;
LABEL_12:
                  v11 = 0;
                  while (1)
                  {
                    if (*(_QWORD *)v21 != v10)
                      objc_enumerationMutation(v7);
                    if ((objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v11), "hasGreenTeaWithValue:", v3) & 1) != 0)
                      break;
                    if (v9 == ++v11)
                    {
                      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
                      if (v9)
                        goto LABEL_12;
                      goto LABEL_18;
                    }
                  }
                }
                else
                {
LABEL_18:

                  -[GEOCompanionRouteDetails _readWaypoints]((uint64_t)self);
                  v18 = 0u;
                  v19 = 0u;
                  v16 = 0u;
                  v17 = 0u;
                  v7 = self->_waypoints;
                  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
                  if (!v12)
                  {
LABEL_26:
                    v5 = 0;
LABEL_28:

                    return v5;
                  }
                  v13 = v12;
                  v14 = *(_QWORD *)v17;
LABEL_20:
                  v15 = 0;
                  while (1)
                  {
                    if (*(_QWORD *)v17 != v14)
                      objc_enumerationMutation(v7);
                    if ((objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v15), "hasGreenTeaWithValue:", v3, (_QWORD)v16) & 1) != 0)break;
                    if (v13 == ++v15)
                    {
                      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
                      if (v13)
                        goto LABEL_20;
                      goto LABEL_26;
                    }
                  }
                }
                v5 = 1;
                goto LABEL_28;
              }
            }
          }
        }
      }
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
  unint64_t v8;
  unint64_t v9;
  uint64_t j;
  unint64_t v11;
  unint64_t v12;
  uint64_t k;
  unint64_t v14;
  unint64_t v15;
  uint64_t m;
  $7FBD6F428C719CB9236B8F56DD82782C flags;
  id *v18;
  $7FBD6F428C719CB9236B8F56DD82782C v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t n;
  void *v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t ii;
  void *v27;
  id *v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t jj;
  id *v32;
  id *v33;

  v33 = (id *)a3;
  -[GEOCompanionRouteDetails readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v33 + 1, self->_reader);
  *((_DWORD *)v33 + 66) = self->_readerMarkPos;
  *((_DWORD *)v33 + 67) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_destinationName)
    objc_msgSend(v33, "setDestinationName:");
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    *((_DWORD *)v33 + 71) = self->_originalDuration;
    v33[38] = (id)((unint64_t)v33[38] | 4);
  }
  if (-[GEOCompanionRouteDetails stepsCount](self, "stepsCount"))
  {
    objc_msgSend(v33, "clearSteps");
    v4 = -[GEOCompanionRouteDetails stepsCount](self, "stepsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[GEOCompanionRouteDetails stepAtIndex:](self, "stepAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "addStep:", v7);

      }
    }
  }
  if (-[GEOCompanionRouteDetails coordinatesCount](self, "coordinatesCount"))
  {
    objc_msgSend(v33, "clearCoordinates");
    v8 = -[GEOCompanionRouteDetails coordinatesCount](self, "coordinatesCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
      {
        -[GEOCompanionRouteDetails coordinatesAtIndex:](self, "coordinatesAtIndex:", j);
        objc_msgSend(v33, "addCoordinates:");
      }
    }
  }
  if (self->_routeID)
    objc_msgSend(v33, "setRouteID:");
  if (self->_destination)
    objc_msgSend(v33, "setDestination:");
  if (self->_origin)
    objc_msgSend(v33, "setOrigin:");
  if (-[GEOCompanionRouteDetails trafficColorsCount](self, "trafficColorsCount"))
  {
    objc_msgSend(v33, "clearTrafficColors");
    v11 = -[GEOCompanionRouteDetails trafficColorsCount](self, "trafficColorsCount");
    if (v11)
    {
      v12 = v11;
      for (k = 0; k != v12; ++k)
        objc_msgSend(v33, "addTrafficColor:", -[GEOCompanionRouteDetails trafficColorAtIndex:](self, "trafficColorAtIndex:", k));
    }
  }
  if (-[GEOCompanionRouteDetails trafficColorOffsetsCount](self, "trafficColorOffsetsCount"))
  {
    objc_msgSend(v33, "clearTrafficColorOffsets");
    v14 = -[GEOCompanionRouteDetails trafficColorOffsetsCount](self, "trafficColorOffsetsCount");
    if (v14)
    {
      v15 = v14;
      for (m = 0; m != v15; ++m)
        objc_msgSend(v33, "addTrafficColorOffset:", -[GEOCompanionRouteDetails trafficColorOffsetAtIndex:](self, "trafficColorOffsetAtIndex:", m));
    }
  }
  flags = self->_flags;
  v18 = v33;
  if ((*(_BYTE *)&flags & 2) != 0)
  {
    *((_DWORD *)v33 + 70) = self->_historicalDuration;
    v33[38] = (id)((unint64_t)v33[38] | 2);
    flags = self->_flags;
  }
  if ((*(_BYTE *)&flags & 0x40) != 0)
  {
    *((_BYTE *)v33 + 300) = self->_canNavigate;
    v33[38] = (id)((unint64_t)v33[38] | 0x40);
  }
  if (self->_name)
  {
    objc_msgSend(v33, "setName:");
    v18 = v33;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *((_DWORD *)v18 + 69) = self->_distance;
    v18[38] = (id)((unint64_t)v18[38] | 1);
  }
  if (self->_originalSuggestedRoute)
  {
    objc_msgSend(v33, "setOriginalSuggestedRoute:");
    v18 = v33;
  }
  if (self->_decoderData)
  {
    objc_msgSend(v33, "setDecoderData:");
    v18 = v33;
  }
  v19 = self->_flags;
  if ((*(_WORD *)&v19 & 0x200) != 0)
  {
    *((_BYTE *)v18 + 303) = self->_showTransitSchedules;
    v18[38] = (id)((unint64_t)v18[38] | 0x200);
    v19 = self->_flags;
  }
  if ((*(_BYTE *)&v19 & 0x20) != 0)
  {
    *((_DWORD *)v18 + 74) = self->_transportType;
    v18[38] = (id)((unint64_t)v18[38] | 0x20);
  }
  if (self->_request)
    objc_msgSend(v33, "setRequest:");
  if (self->_response)
    objc_msgSend(v33, "setResponse:");
  if (self->_trafficDescription)
    objc_msgSend(v33, "setTrafficDescription:");
  if (self->_originalRouteID)
    objc_msgSend(v33, "setOriginalRouteID:");
  if (-[GEOCompanionRouteDetails routeDescriptionsCount](self, "routeDescriptionsCount"))
  {
    objc_msgSend(v33, "clearRouteDescriptions");
    v20 = -[GEOCompanionRouteDetails routeDescriptionsCount](self, "routeDescriptionsCount");
    if (v20)
    {
      v21 = v20;
      for (n = 0; n != v21; ++n)
      {
        -[GEOCompanionRouteDetails routeDescriptionsAtIndex:](self, "routeDescriptionsAtIndex:", n);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "addRouteDescriptions:", v23);

      }
    }
  }
  if ((*((_BYTE *)&self->_flags + 1) & 1) != 0)
  {
    *((_BYTE *)v33 + 302) = self->_isTrace;
    v33[38] = (id)((unint64_t)v33[38] | 0x100);
  }
  if (self->_revisionID)
    objc_msgSend(v33, "setRevisionID:");
  if (-[GEOCompanionRouteDetails waypointsCount](self, "waypointsCount"))
  {
    objc_msgSend(v33, "clearWaypoints");
    v24 = -[GEOCompanionRouteDetails waypointsCount](self, "waypointsCount");
    if (v24)
    {
      v25 = v24;
      for (ii = 0; ii != v25; ++ii)
      {
        -[GEOCompanionRouteDetails waypointsAtIndex:](self, "waypointsAtIndex:", ii);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "addWaypoints:", v27);

      }
    }
  }
  v28 = v33;
  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
    *((_DWORD *)v33 + 72) = self->_routeIndex;
    v33[38] = (id)((unint64_t)v33[38] | 8);
  }
  if (self->_etaResponse)
  {
    objc_msgSend(v33, "setEtaResponse:");
    v28 = v33;
  }
  if ((*(_BYTE *)&self->_flags & 0x80) != 0)
  {
    *((_BYTE *)v28 + 301) = self->_disallowStandaloneFallback;
    v28[38] = (id)((unint64_t)v28[38] | 0x80);
  }
  if (self->_styleAttributes)
    objc_msgSend(v33, "setStyleAttributes:");
  if (-[GEOCompanionRouteDetails selectedRideIndexsCount](self, "selectedRideIndexsCount"))
  {
    objc_msgSend(v33, "clearSelectedRideIndexs");
    v29 = -[GEOCompanionRouteDetails selectedRideIndexsCount](self, "selectedRideIndexsCount");
    if (v29)
    {
      v30 = v29;
      for (jj = 0; jj != v30; ++jj)
        objc_msgSend(v33, "addSelectedRideIndex:", -[GEOCompanionRouteDetails selectedRideIndexAtIndex:](self, "selectedRideIndexAtIndex:", jj));
    }
  }
  v32 = v33;
  if ((*(_BYTE *)&self->_flags & 0x10) != 0)
  {
    *((_DWORD *)v33 + 73) = self->_source;
    v33[38] = (id)((unint64_t)v33[38] | 0x10);
  }
  if (self->_storageID)
  {
    objc_msgSend(v33, "setStorageID:");
    v32 = v33;
  }
  if (self->_anchorPointsData)
  {
    objc_msgSend(v33, "setAnchorPointsData:");
    v32 = v33;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  uint64_t v9;
  void *v10;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  $7FBD6F428C719CB9236B8F56DD82782C flags;
  uint64_t v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  $7FBD6F428C719CB9236B8F56DD82782C v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  NSMutableArray *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t j;
  void *v42;
  uint64_t v43;
  void *v44;
  NSMutableArray *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t k;
  void *v49;
  id v50;
  void *v51;
  id v52;
  void *v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
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
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*((_BYTE *)&self->_flags + 4) & 2) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOCompanionRouteDetailsReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_47;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOCompanionRouteDetails readAll:](self, "readAll:", 0);
  v9 = -[NSString copyWithZone:](self->_destinationName, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 128);
  *(_QWORD *)(v5 + 128) = v9;

  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    *(_DWORD *)(v5 + 284) = self->_originalDuration;
    *(_QWORD *)(v5 + 304) |= 4uLL;
  }
  v68 = 0u;
  v69 = 0u;
  v66 = 0u;
  v67 = 0u;
  v11 = self->_steps;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v66, v72, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v67;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v67 != v13)
          objc_enumerationMutation(v11);
        v15 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v66 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addStep:", v15);

      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v66, v72, 16);
    }
    while (v12);
  }

  PBRepeatedDoubleCopy();
  v16 = -[NSData copyWithZone:](self->_routeID, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 216);
  *(_QWORD *)(v5 + 216) = v16;

  v18 = -[GEOMapItemStorage copyWithZone:](self->_destination, "copyWithZone:", a3);
  v19 = *(void **)(v5 + 136);
  *(_QWORD *)(v5 + 136) = v18;

  v20 = -[GEOMapItemStorage copyWithZone:](self->_origin, "copyWithZone:", a3);
  v21 = *(void **)(v5 + 176);
  *(_QWORD *)(v5 + 176) = v20;

  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 280) = self->_historicalDuration;
    *(_QWORD *)(v5 + 304) |= 2uLL;
    flags = self->_flags;
  }
  if ((*(_BYTE *)&flags & 0x40) != 0)
  {
    *(_BYTE *)(v5 + 300) = self->_canNavigate;
    *(_QWORD *)(v5 + 304) |= 0x40uLL;
  }
  v23 = -[NSString copyWithZone:](self->_name, "copyWithZone:", a3);
  v24 = *(void **)(v5 + 152);
  *(_QWORD *)(v5 + 152) = v23;

  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 276) = self->_distance;
    *(_QWORD *)(v5 + 304) |= 1uLL;
  }
  v25 = -[GEOTransitSuggestedRoute copyWithZone:](self->_originalSuggestedRoute, "copyWithZone:", a3);
  v26 = *(void **)(v5 + 168);
  *(_QWORD *)(v5 + 168) = v25;

  v27 = -[GEOTransitDecoderData copyWithZone:](self->_decoderData, "copyWithZone:", a3);
  v28 = *(void **)(v5 + 120);
  *(_QWORD *)(v5 + 120) = v27;

  v29 = self->_flags;
  if ((*(_WORD *)&v29 & 0x200) != 0)
  {
    *(_BYTE *)(v5 + 303) = self->_showTransitSchedules;
    *(_QWORD *)(v5 + 304) |= 0x200uLL;
    v29 = self->_flags;
  }
  if ((*(_BYTE *)&v29 & 0x20) != 0)
  {
    *(_DWORD *)(v5 + 296) = self->_transportType;
    *(_QWORD *)(v5 + 304) |= 0x20uLL;
  }
  v30 = -[GEODirectionsRequest copyWithZone:](self->_request, "copyWithZone:", a3);
  v31 = *(void **)(v5 + 184);
  *(_QWORD *)(v5 + 184) = v30;

  v32 = -[GEODirectionsResponse copyWithZone:](self->_response, "copyWithZone:", a3);
  v33 = *(void **)(v5 + 192);
  *(_QWORD *)(v5 + 192) = v32;

  v34 = -[NSString copyWithZone:](self->_trafficDescription, "copyWithZone:", a3);
  v35 = *(void **)(v5 + 248);
  *(_QWORD *)(v5 + 248) = v34;

  v36 = -[NSData copyWithZone:](self->_originalRouteID, "copyWithZone:", a3);
  v37 = *(void **)(v5 + 160);
  *(_QWORD *)(v5 + 160) = v36;

  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  v38 = self->_routeDescriptions;
  v39 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v38, "countByEnumeratingWithState:objects:count:", &v62, v71, 16);
  if (v39)
  {
    v40 = *(_QWORD *)v63;
    do
    {
      for (j = 0; j != v39; ++j)
      {
        if (*(_QWORD *)v63 != v40)
          objc_enumerationMutation(v38);
        v42 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v62 + 1) + 8 * j), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addRouteDescriptions:", v42);

      }
      v39 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v38, "countByEnumeratingWithState:objects:count:", &v62, v71, 16);
    }
    while (v39);
  }

  if ((*((_BYTE *)&self->_flags + 1) & 1) != 0)
  {
    *(_BYTE *)(v5 + 302) = self->_isTrace;
    *(_QWORD *)(v5 + 304) |= 0x100uLL;
  }
  v43 = -[NSData copyWithZone:](self->_revisionID, "copyWithZone:", a3);
  v44 = *(void **)(v5 + 200);
  *(_QWORD *)(v5 + 200) = v43;

  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  v45 = self->_waypoints;
  v46 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v45, "countByEnumeratingWithState:objects:count:", &v58, v70, 16);
  if (v46)
  {
    v47 = *(_QWORD *)v59;
    do
    {
      for (k = 0; k != v46; ++k)
      {
        if (*(_QWORD *)v59 != v47)
          objc_enumerationMutation(v45);
        v49 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v58 + 1) + 8 * k), "copyWithZone:", a3, (_QWORD)v58);
        objc_msgSend((id)v5, "addWaypoints:", v49);

      }
      v46 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v45, "countByEnumeratingWithState:objects:count:", &v58, v70, 16);
    }
    while (v46);
  }

  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
    *(_DWORD *)(v5 + 288) = self->_routeIndex;
    *(_QWORD *)(v5 + 304) |= 8uLL;
  }
  v50 = -[GEOETATrafficUpdateResponse copyWithZone:](self->_etaResponse, "copyWithZone:", a3, (_QWORD)v58);
  v51 = *(void **)(v5 + 144);
  *(_QWORD *)(v5 + 144) = v50;

  if ((*(_BYTE *)&self->_flags & 0x80) != 0)
  {
    *(_BYTE *)(v5 + 301) = self->_disallowStandaloneFallback;
    *(_QWORD *)(v5 + 304) |= 0x80uLL;
  }
  v52 = -[GEOStyleAttributes copyWithZone:](self->_styleAttributes, "copyWithZone:", a3);
  v53 = *(void **)(v5 + 240);
  *(_QWORD *)(v5 + 240) = v52;

  PBRepeatedUInt32Copy();
  if ((*(_BYTE *)&self->_flags & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 292) = self->_source;
    *(_QWORD *)(v5 + 304) |= 0x10uLL;
  }
  v54 = -[NSData copyWithZone:](self->_storageID, "copyWithZone:", a3);
  v55 = *(void **)(v5 + 232);
  *(_QWORD *)(v5 + 232) = v54;

  v56 = -[NSData copyWithZone:](self->_anchorPointsData, "copyWithZone:", a3);
  v8 = *(id *)(v5 + 112);
  *(_QWORD *)(v5 + 112) = v56;
LABEL_47:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *destinationName;
  uint64_t v6;
  NSMutableArray *steps;
  NSData *routeID;
  GEOMapItemStorage *destination;
  GEOMapItemStorage *origin;
  $7FBD6F428C719CB9236B8F56DD82782C flags;
  uint64_t v12;
  NSString *name;
  GEOTransitSuggestedRoute *originalSuggestedRoute;
  GEOTransitDecoderData *decoderData;
  $7FBD6F428C719CB9236B8F56DD82782C v16;
  uint64_t v17;
  GEODirectionsRequest *request;
  GEODirectionsResponse *response;
  NSString *trafficDescription;
  NSData *originalRouteID;
  NSMutableArray *routeDescriptions;
  uint64_t v23;
  NSData *revisionID;
  NSMutableArray *waypoints;
  $7FBD6F428C719CB9236B8F56DD82782C v26;
  uint64_t v27;
  GEOETATrafficUpdateResponse *etaResponse;
  GEOStyleAttributes *styleAttributes;
  uint64_t v30;
  NSData *storageID;
  NSData *anchorPointsData;
  char v33;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_108;
  -[GEOCompanionRouteDetails readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  destinationName = self->_destinationName;
  if ((unint64_t)destinationName | *((_QWORD *)v4 + 16))
  {
    if (!-[NSString isEqual:](destinationName, "isEqual:"))
      goto LABEL_108;
  }
  v6 = *((_QWORD *)v4 + 38);
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_originalDuration != *((_DWORD *)v4 + 71))
      goto LABEL_108;
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_108;
  }
  steps = self->_steps;
  if ((unint64_t)steps | *((_QWORD *)v4 + 28) && !-[NSMutableArray isEqual:](steps, "isEqual:"))
    goto LABEL_108;
  if (!PBRepeatedDoubleIsEqual())
    goto LABEL_108;
  routeID = self->_routeID;
  if ((unint64_t)routeID | *((_QWORD *)v4 + 27))
  {
    if (!-[NSData isEqual:](routeID, "isEqual:"))
      goto LABEL_108;
  }
  destination = self->_destination;
  if ((unint64_t)destination | *((_QWORD *)v4 + 17))
  {
    if (!-[GEOMapItemStorage isEqual:](destination, "isEqual:"))
      goto LABEL_108;
  }
  origin = self->_origin;
  if ((unint64_t)origin | *((_QWORD *)v4 + 22))
  {
    if (!-[GEOMapItemStorage isEqual:](origin, "isEqual:"))
      goto LABEL_108;
  }
  if (!PBRepeatedUInt32IsEqual() || !PBRepeatedUInt32IsEqual())
    goto LABEL_108;
  flags = self->_flags;
  v12 = *((_QWORD *)v4 + 38);
  if ((*(_BYTE *)&flags & 2) != 0)
  {
    if ((v12 & 2) == 0 || self->_historicalDuration != *((_DWORD *)v4 + 70))
      goto LABEL_108;
  }
  else if ((v12 & 2) != 0)
  {
    goto LABEL_108;
  }
  if ((*(_BYTE *)&flags & 0x40) != 0)
  {
    if ((v12 & 0x40) == 0)
      goto LABEL_108;
    if (self->_canNavigate)
    {
      if (!*((_BYTE *)v4 + 300))
        goto LABEL_108;
    }
    else if (*((_BYTE *)v4 + 300))
    {
      goto LABEL_108;
    }
  }
  else if ((v12 & 0x40) != 0)
  {
    goto LABEL_108;
  }
  name = self->_name;
  if ((unint64_t)name | *((_QWORD *)v4 + 19))
  {
    if (!-[NSString isEqual:](name, "isEqual:"))
      goto LABEL_108;
    flags = self->_flags;
    v12 = *((_QWORD *)v4 + 38);
  }
  if ((*(_BYTE *)&flags & 1) != 0)
  {
    if ((v12 & 1) == 0 || self->_distance != *((_DWORD *)v4 + 69))
      goto LABEL_108;
  }
  else if ((v12 & 1) != 0)
  {
    goto LABEL_108;
  }
  originalSuggestedRoute = self->_originalSuggestedRoute;
  if ((unint64_t)originalSuggestedRoute | *((_QWORD *)v4 + 21)
    && !-[GEOTransitSuggestedRoute isEqual:](originalSuggestedRoute, "isEqual:"))
  {
    goto LABEL_108;
  }
  decoderData = self->_decoderData;
  if ((unint64_t)decoderData | *((_QWORD *)v4 + 15))
  {
    if (!-[GEOTransitDecoderData isEqual:](decoderData, "isEqual:"))
      goto LABEL_108;
  }
  v16 = self->_flags;
  v17 = *((_QWORD *)v4 + 38);
  if ((*(_WORD *)&v16 & 0x200) != 0)
  {
    if ((v17 & 0x200) == 0)
      goto LABEL_108;
    if (self->_showTransitSchedules)
    {
      if (!*((_BYTE *)v4 + 303))
        goto LABEL_108;
    }
    else if (*((_BYTE *)v4 + 303))
    {
      goto LABEL_108;
    }
  }
  else if ((v17 & 0x200) != 0)
  {
    goto LABEL_108;
  }
  if ((*(_BYTE *)&v16 & 0x20) != 0)
  {
    if ((v17 & 0x20) == 0 || self->_transportType != *((_DWORD *)v4 + 74))
      goto LABEL_108;
  }
  else if ((v17 & 0x20) != 0)
  {
    goto LABEL_108;
  }
  request = self->_request;
  if ((unint64_t)request | *((_QWORD *)v4 + 23) && !-[GEODirectionsRequest isEqual:](request, "isEqual:"))
    goto LABEL_108;
  response = self->_response;
  if ((unint64_t)response | *((_QWORD *)v4 + 24))
  {
    if (!-[GEODirectionsResponse isEqual:](response, "isEqual:"))
      goto LABEL_108;
  }
  trafficDescription = self->_trafficDescription;
  if ((unint64_t)trafficDescription | *((_QWORD *)v4 + 31))
  {
    if (!-[NSString isEqual:](trafficDescription, "isEqual:"))
      goto LABEL_108;
  }
  originalRouteID = self->_originalRouteID;
  if ((unint64_t)originalRouteID | *((_QWORD *)v4 + 20))
  {
    if (!-[NSData isEqual:](originalRouteID, "isEqual:"))
      goto LABEL_108;
  }
  routeDescriptions = self->_routeDescriptions;
  if ((unint64_t)routeDescriptions | *((_QWORD *)v4 + 26))
  {
    if (!-[NSMutableArray isEqual:](routeDescriptions, "isEqual:"))
      goto LABEL_108;
  }
  v23 = *((_QWORD *)v4 + 38);
  if ((*((_BYTE *)&self->_flags + 1) & 1) != 0)
  {
    if ((v23 & 0x100) == 0)
      goto LABEL_108;
    if (self->_isTrace)
    {
      if (!*((_BYTE *)v4 + 302))
        goto LABEL_108;
    }
    else if (*((_BYTE *)v4 + 302))
    {
      goto LABEL_108;
    }
  }
  else if ((v23 & 0x100) != 0)
  {
    goto LABEL_108;
  }
  revisionID = self->_revisionID;
  if ((unint64_t)revisionID | *((_QWORD *)v4 + 25) && !-[NSData isEqual:](revisionID, "isEqual:"))
    goto LABEL_108;
  waypoints = self->_waypoints;
  if ((unint64_t)waypoints | *((_QWORD *)v4 + 32))
  {
    if (!-[NSMutableArray isEqual:](waypoints, "isEqual:"))
      goto LABEL_108;
  }
  v26 = self->_flags;
  v27 = *((_QWORD *)v4 + 38);
  if ((*(_BYTE *)&v26 & 8) != 0)
  {
    if ((v27 & 8) == 0 || self->_routeIndex != *((_DWORD *)v4 + 72))
      goto LABEL_108;
  }
  else if ((v27 & 8) != 0)
  {
    goto LABEL_108;
  }
  etaResponse = self->_etaResponse;
  if ((unint64_t)etaResponse | *((_QWORD *)v4 + 18))
  {
    if (!-[GEOETATrafficUpdateResponse isEqual:](etaResponse, "isEqual:"))
      goto LABEL_108;
    v26 = self->_flags;
    v27 = *((_QWORD *)v4 + 38);
  }
  if ((*(_BYTE *)&v26 & 0x80) != 0)
  {
    if ((v27 & 0x80) != 0)
    {
      if (self->_disallowStandaloneFallback)
      {
        if (!*((_BYTE *)v4 + 301))
          goto LABEL_108;
        goto LABEL_96;
      }
      if (!*((_BYTE *)v4 + 301))
        goto LABEL_96;
    }
LABEL_108:
    v33 = 0;
    goto LABEL_109;
  }
  if ((v27 & 0x80) != 0)
    goto LABEL_108;
LABEL_96:
  styleAttributes = self->_styleAttributes;
  if ((unint64_t)styleAttributes | *((_QWORD *)v4 + 30)
    && !-[GEOStyleAttributes isEqual:](styleAttributes, "isEqual:")
    || !PBRepeatedUInt32IsEqual())
  {
    goto LABEL_108;
  }
  v30 = *((_QWORD *)v4 + 38);
  if ((*(_BYTE *)&self->_flags & 0x10) != 0)
  {
    if ((v30 & 0x10) == 0 || self->_source != *((_DWORD *)v4 + 73))
      goto LABEL_108;
  }
  else if ((v30 & 0x10) != 0)
  {
    goto LABEL_108;
  }
  storageID = self->_storageID;
  if ((unint64_t)storageID | *((_QWORD *)v4 + 29) && !-[NSData isEqual:](storageID, "isEqual:"))
    goto LABEL_108;
  anchorPointsData = self->_anchorPointsData;
  if ((unint64_t)anchorPointsData | *((_QWORD *)v4 + 14))
    v33 = -[NSData isEqual:](anchorPointsData, "isEqual:");
  else
    v33 = 1;
LABEL_109:

  return v33;
}

- (unint64_t)hash
{
  $7FBD6F428C719CB9236B8F56DD82782C flags;
  $7FBD6F428C719CB9236B8F56DD82782C v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSUInteger v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  NSUInteger v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  NSUInteger v38;

  -[GEOCompanionRouteDetails readAll:](self, "readAll:", 1);
  v38 = -[NSString hash](self->_destinationName, "hash");
  if ((*(_BYTE *)&self->_flags & 4) != 0)
    v37 = 2654435761 * self->_originalDuration;
  else
    v37 = 0;
  v36 = -[NSMutableArray hash](self->_steps, "hash");
  v35 = PBRepeatedDoubleHash();
  v34 = -[NSData hash](self->_routeID, "hash");
  v33 = -[GEOMapItemStorage hash](self->_destination, "hash");
  v32 = -[GEOMapItemStorage hash](self->_origin, "hash");
  v31 = PBRepeatedUInt32Hash();
  v30 = PBRepeatedUInt32Hash();
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 2) != 0)
  {
    v29 = 2654435761 * self->_historicalDuration;
    if ((*(_BYTE *)&flags & 0x40) != 0)
      goto LABEL_6;
  }
  else
  {
    v29 = 0;
    if ((*(_BYTE *)&flags & 0x40) != 0)
    {
LABEL_6:
      v28 = 2654435761 * self->_canNavigate;
      goto LABEL_9;
    }
  }
  v28 = 0;
LABEL_9:
  v27 = -[NSString hash](self->_name, "hash");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v26 = 2654435761 * self->_distance;
  else
    v26 = 0;
  v25 = -[GEOTransitSuggestedRoute hash](self->_originalSuggestedRoute, "hash");
  v24 = -[GEOTransitDecoderData hash](self->_decoderData, "hash");
  v4 = self->_flags;
  if ((*(_WORD *)&v4 & 0x200) != 0)
  {
    v23 = 2654435761 * self->_showTransitSchedules;
    if ((*(_BYTE *)&v4 & 0x20) != 0)
      goto LABEL_14;
  }
  else
  {
    v23 = 0;
    if ((*(_BYTE *)&v4 & 0x20) != 0)
    {
LABEL_14:
      v22 = 2654435761 * self->_transportType;
      goto LABEL_17;
    }
  }
  v22 = 0;
LABEL_17:
  v21 = -[GEODirectionsRequest hash](self->_request, "hash");
  v20 = -[GEODirectionsResponse hash](self->_response, "hash");
  v19 = -[NSString hash](self->_trafficDescription, "hash");
  v18 = -[NSData hash](self->_originalRouteID, "hash");
  v17 = -[NSMutableArray hash](self->_routeDescriptions, "hash");
  if ((*((_BYTE *)&self->_flags + 1) & 1) != 0)
    v5 = -[NSData hash](self->_revisionID, "hash", 2654435761 * self->_isTrace);
  else
    v5 = -[NSData hash](self->_revisionID, "hash", 0);
  v6 = v5;
  v7 = -[NSMutableArray hash](self->_waypoints, "hash");
  if ((*(_BYTE *)&self->_flags & 8) != 0)
    v8 = 2654435761 * self->_routeIndex;
  else
    v8 = 0;
  v9 = -[GEOETATrafficUpdateResponse hash](self->_etaResponse, "hash");
  if ((*(_BYTE *)&self->_flags & 0x80) != 0)
    v10 = 2654435761 * self->_disallowStandaloneFallback;
  else
    v10 = 0;
  v11 = -[GEOStyleAttributes hash](self->_styleAttributes, "hash");
  v12 = PBRepeatedUInt32Hash();
  if ((*(_BYTE *)&self->_flags & 0x10) != 0)
    v13 = 2654435761 * self->_source;
  else
    v13 = 0;
  v14 = v10 ^ v11 ^ v12 ^ v13 ^ -[NSData hash](self->_storageID, "hash");
  return v37 ^ v38 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v18 ^ v17 ^ v16 ^ v6 ^ v7 ^ v8 ^ v9 ^ v14 ^ -[NSData hash](self->_anchorPointsData, "hash");
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
  uint64_t v11;
  uint64_t j;
  GEOMapItemStorage *destination;
  uint64_t v14;
  GEOMapItemStorage *origin;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t k;
  uint64_t v20;
  uint64_t v21;
  uint64_t m;
  uint64_t v23;
  GEOTransitSuggestedRoute *originalSuggestedRoute;
  uint64_t v25;
  GEOTransitDecoderData *decoderData;
  uint64_t v27;
  uint64_t v28;
  GEODirectionsRequest *request;
  uint64_t v30;
  GEODirectionsResponse *response;
  uint64_t v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t n;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t ii;
  GEOETATrafficUpdateResponse *etaResponse;
  uint64_t v44;
  GEOStyleAttributes *styleAttributes;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t jj;
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
  _BYTE v62[128];
  _BYTE v63[128];
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  if (*((_QWORD *)v4 + 16))
    -[GEOCompanionRouteDetails setDestinationName:](self, "setDestinationName:");
  if ((*((_BYTE *)v4 + 304) & 4) != 0)
  {
    self->_originalDuration = *((_DWORD *)v4 + 71);
    *(_QWORD *)&self->_flags |= 4uLL;
  }
  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  v5 = *((id *)v4 + 28);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v58, v64, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v59;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v59 != v8)
          objc_enumerationMutation(v5);
        -[GEOCompanionRouteDetails addStep:](self, "addStep:", *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v58, v64, 16);
    }
    while (v7);
  }

  v10 = objc_msgSend(v4, "coordinatesCount");
  if (v10)
  {
    v11 = v10;
    for (j = 0; j != v11; ++j)
    {
      objc_msgSend(v4, "coordinatesAtIndex:", j);
      -[GEOCompanionRouteDetails addCoordinates:](self, "addCoordinates:");
    }
  }
  if (*((_QWORD *)v4 + 27))
    -[GEOCompanionRouteDetails setRouteID:](self, "setRouteID:");
  destination = self->_destination;
  v14 = *((_QWORD *)v4 + 17);
  if (destination)
  {
    if (v14)
      -[GEOMapItemStorage mergeFrom:](destination, "mergeFrom:");
  }
  else if (v14)
  {
    -[GEOCompanionRouteDetails setDestination:](self, "setDestination:");
  }
  origin = self->_origin;
  v16 = *((_QWORD *)v4 + 22);
  if (origin)
  {
    if (v16)
      -[GEOMapItemStorage mergeFrom:](origin, "mergeFrom:");
  }
  else if (v16)
  {
    -[GEOCompanionRouteDetails setOrigin:](self, "setOrigin:");
  }
  v17 = objc_msgSend(v4, "trafficColorsCount");
  if (v17)
  {
    v18 = v17;
    for (k = 0; k != v18; ++k)
      -[GEOCompanionRouteDetails addTrafficColor:](self, "addTrafficColor:", objc_msgSend(v4, "trafficColorAtIndex:", k));
  }
  v20 = objc_msgSend(v4, "trafficColorOffsetsCount");
  if (v20)
  {
    v21 = v20;
    for (m = 0; m != v21; ++m)
      -[GEOCompanionRouteDetails addTrafficColorOffset:](self, "addTrafficColorOffset:", objc_msgSend(v4, "trafficColorOffsetAtIndex:", m));
  }
  v23 = *((_QWORD *)v4 + 38);
  if ((v23 & 2) != 0)
  {
    self->_historicalDuration = *((_DWORD *)v4 + 70);
    *(_QWORD *)&self->_flags |= 2uLL;
    v23 = *((_QWORD *)v4 + 38);
  }
  if ((v23 & 0x40) != 0)
  {
    self->_canNavigate = *((_BYTE *)v4 + 300);
    *(_QWORD *)&self->_flags |= 0x40uLL;
  }
  if (*((_QWORD *)v4 + 19))
    -[GEOCompanionRouteDetails setName:](self, "setName:");
  if ((*((_BYTE *)v4 + 304) & 1) != 0)
  {
    self->_distance = *((_DWORD *)v4 + 69);
    *(_QWORD *)&self->_flags |= 1uLL;
  }
  originalSuggestedRoute = self->_originalSuggestedRoute;
  v25 = *((_QWORD *)v4 + 21);
  if (originalSuggestedRoute)
  {
    if (v25)
      -[GEOTransitSuggestedRoute mergeFrom:](originalSuggestedRoute, "mergeFrom:");
  }
  else if (v25)
  {
    -[GEOCompanionRouteDetails setOriginalSuggestedRoute:](self, "setOriginalSuggestedRoute:");
  }
  decoderData = self->_decoderData;
  v27 = *((_QWORD *)v4 + 15);
  if (decoderData)
  {
    if (v27)
      -[GEOTransitDecoderData mergeFrom:](decoderData, "mergeFrom:");
  }
  else if (v27)
  {
    -[GEOCompanionRouteDetails setDecoderData:](self, "setDecoderData:");
  }
  v28 = *((_QWORD *)v4 + 38);
  if ((v28 & 0x200) != 0)
  {
    self->_showTransitSchedules = *((_BYTE *)v4 + 303);
    *(_QWORD *)&self->_flags |= 0x200uLL;
    v28 = *((_QWORD *)v4 + 38);
  }
  if ((v28 & 0x20) != 0)
  {
    self->_transportType = *((_DWORD *)v4 + 74);
    *(_QWORD *)&self->_flags |= 0x20uLL;
  }
  request = self->_request;
  v30 = *((_QWORD *)v4 + 23);
  if (request)
  {
    if (v30)
      -[GEODirectionsRequest mergeFrom:](request, "mergeFrom:");
  }
  else if (v30)
  {
    -[GEOCompanionRouteDetails setRequest:](self, "setRequest:");
  }
  response = self->_response;
  v32 = *((_QWORD *)v4 + 24);
  if (response)
  {
    if (v32)
      -[GEODirectionsResponse mergeFrom:](response, "mergeFrom:");
  }
  else if (v32)
  {
    -[GEOCompanionRouteDetails setResponse:](self, "setResponse:");
  }
  if (*((_QWORD *)v4 + 31))
    -[GEOCompanionRouteDetails setTrafficDescription:](self, "setTrafficDescription:");
  if (*((_QWORD *)v4 + 20))
    -[GEOCompanionRouteDetails setOriginalRouteID:](self, "setOriginalRouteID:");
  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v33 = *((id *)v4 + 26);
  v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v54, v63, 16);
  if (v34)
  {
    v35 = v34;
    v36 = *(_QWORD *)v55;
    do
    {
      for (n = 0; n != v35; ++n)
      {
        if (*(_QWORD *)v55 != v36)
          objc_enumerationMutation(v33);
        -[GEOCompanionRouteDetails addRouteDescriptions:](self, "addRouteDescriptions:", *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * n));
      }
      v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v54, v63, 16);
    }
    while (v35);
  }

  if ((*((_BYTE *)v4 + 305) & 1) != 0)
  {
    self->_isTrace = *((_BYTE *)v4 + 302);
    *(_QWORD *)&self->_flags |= 0x100uLL;
  }
  if (*((_QWORD *)v4 + 25))
    -[GEOCompanionRouteDetails setRevisionID:](self, "setRevisionID:");
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v38 = *((id *)v4 + 32);
  v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v50, v62, 16);
  if (v39)
  {
    v40 = v39;
    v41 = *(_QWORD *)v51;
    do
    {
      for (ii = 0; ii != v40; ++ii)
      {
        if (*(_QWORD *)v51 != v41)
          objc_enumerationMutation(v38);
        -[GEOCompanionRouteDetails addWaypoints:](self, "addWaypoints:", *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * ii), (_QWORD)v50);
      }
      v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v50, v62, 16);
    }
    while (v40);
  }

  if ((*((_BYTE *)v4 + 304) & 8) != 0)
  {
    self->_routeIndex = *((_DWORD *)v4 + 72);
    *(_QWORD *)&self->_flags |= 8uLL;
  }
  etaResponse = self->_etaResponse;
  v44 = *((_QWORD *)v4 + 18);
  if (etaResponse)
  {
    if (v44)
      -[GEOETATrafficUpdateResponse mergeFrom:](etaResponse, "mergeFrom:");
  }
  else if (v44)
  {
    -[GEOCompanionRouteDetails setEtaResponse:](self, "setEtaResponse:");
  }
  if ((*((_BYTE *)v4 + 304) & 0x80) != 0)
  {
    self->_disallowStandaloneFallback = *((_BYTE *)v4 + 301);
    *(_QWORD *)&self->_flags |= 0x80uLL;
  }
  styleAttributes = self->_styleAttributes;
  v46 = *((_QWORD *)v4 + 30);
  if (styleAttributes)
  {
    if (v46)
      -[GEOStyleAttributes mergeFrom:](styleAttributes, "mergeFrom:");
  }
  else if (v46)
  {
    -[GEOCompanionRouteDetails setStyleAttributes:](self, "setStyleAttributes:");
  }
  v47 = objc_msgSend(v4, "selectedRideIndexsCount", (_QWORD)v50);
  if (v47)
  {
    v48 = v47;
    for (jj = 0; jj != v48; ++jj)
      -[GEOCompanionRouteDetails addSelectedRideIndex:](self, "addSelectedRideIndex:", objc_msgSend(v4, "selectedRideIndexAtIndex:", jj));
  }
  if ((*((_BYTE *)v4 + 304) & 0x10) != 0)
  {
    self->_source = *((_DWORD *)v4 + 73);
    *(_QWORD *)&self->_flags |= 0x10uLL;
  }
  if (*((_QWORD *)v4 + 29))
    -[GEOCompanionRouteDetails setStorageID:](self, "setStorageID:");
  if (*((_QWORD *)v4 + 14))
    -[GEOCompanionRouteDetails setAnchorPointsData:](self, "setAnchorPointsData:");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_waypoints, 0);
  objc_storeStrong((id *)&self->_trafficDescription, 0);
  objc_storeStrong((id *)&self->_styleAttributes, 0);
  objc_storeStrong((id *)&self->_storageID, 0);
  objc_storeStrong((id *)&self->_steps, 0);
  objc_storeStrong((id *)&self->_routeID, 0);
  objc_storeStrong((id *)&self->_routeDescriptions, 0);
  objc_storeStrong((id *)&self->_revisionID, 0);
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_origin, 0);
  objc_storeStrong((id *)&self->_originalSuggestedRoute, 0);
  objc_storeStrong((id *)&self->_originalRouteID, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_etaResponse, 0);
  objc_storeStrong((id *)&self->_destination, 0);
  objc_storeStrong((id *)&self->_destinationName, 0);
  objc_storeStrong((id *)&self->_decoderData, 0);
  objc_storeStrong((id *)&self->_anchorPointsData, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

- (BOOL)_needsWaypointRemoval:(unint64_t)a3
{
  void *v4;
  BOOL v5;
  void *v6;

  if (a3 < 4)
  {
    -[GEOCompanionRouteDetails waypoints](self, "waypoints");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count") != 0;
  }
  else
  {
    -[GEOCompanionRouteDetails origin](self, "origin");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = 1;
    }
    else
    {
      -[GEOCompanionRouteDetails destination](self, "destination");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v6 != 0;

    }
  }

  return v5;
}

- (BOOL)_hasIncompatibleManeuverType:(unint64_t)a3
{
  void *v3;
  void *v4;
  BOOL v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  int v12;
  char v13;
  int v14;
  BOOL v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (a3 > 5)
    return 0;
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[GEOCompanionRouteDetails steps](self, "steps", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (!v7)
  {
    v5 = 0;
    goto LABEL_30;
  }
  v8 = v7;
  v9 = *(_QWORD *)v19;
  while (2)
  {
    for (i = 0; i != v8; ++i)
    {
      if (*(_QWORD *)v19 != v9)
        objc_enumerationMutation(v6);
      v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
      v12 = objc_msgSend(v11, "hasDriveStep");
      v13 = v12;
      if (v12)
      {
        objc_msgSend(v11, "driveStep");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v3, "maneuverType") == 88)
          goto LABEL_28;
      }
      v14 = objc_msgSend(v11, "hasWalkStep");
      if (v14)
      {
        objc_msgSend(v11, "walkStep");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v4, "maneuverType") == 88)
        {

          if ((v13 & 1) != 0)
LABEL_28:

LABEL_29:
          v5 = 1;
          goto LABEL_30;
        }
        if ((objc_msgSend(v11, "hasCyclingStep") & 1) != 0)
        {
LABEL_15:
          objc_msgSend(v11, "cyclingStep");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v16, "maneuverType") == 88;

          if (!v14)
          {
            if ((v13 & 1) == 0)
              goto LABEL_17;
            goto LABEL_22;
          }
        }
        else
        {
          v15 = 0;
        }

        if ((v13 & 1) == 0)
          goto LABEL_17;
        goto LABEL_22;
      }
      if (objc_msgSend(v11, "hasCyclingStep"))
        goto LABEL_15;
      v15 = 0;
      if ((v13 & 1) == 0)
      {
LABEL_17:
        if (v15)
          goto LABEL_29;
        continue;
      }
LABEL_22:

      if (v15)
        goto LABEL_29;
    }
    v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    v5 = 0;
    if (v8)
      continue;
    break;
  }
LABEL_30:

  return v5;
}

- (id)instanceCompatibleWithProtocolVersion:(unint64_t)a3
{
  BOOL v5;
  int v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  objc_class *v13;
  void *v14;
  const char *v15;
  NSObject *v16;
  objc_class *v17;
  void *v18;
  objc_class *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  objc_class *v37;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t v43[128];
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  GEOCompanionRouteDetails *v47;
  __int16 v48;
  unint64_t v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    GEOFindOrCreateLog("com.apple.GeoServices", "CompanionCompatibility");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      v17 = (objc_class *)objc_opt_class();
      NSStringFromClass(v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v45 = v18;
      v46 = 2048;
      v47 = self;
      v48 = 2048;
      v49 = 0;
      _os_log_impl(&dword_1885A9000, v16, OS_LOG_TYPE_DEBUG, "%@<%p> is compatible with protocol version %lu", buf, 0x20u);

    }
    return self;
  }
  v5 = -[GEOCompanionRouteDetails hasOriginalSuggestedRoute](self, "hasOriginalSuggestedRoute");
  if (a3 > 2 || !v5)
  {
    v6 = -[GEOCompanionRouteDetails transportType](self, "transportType");
    if ((a3 > 3 || v6 != 3)
      && !-[GEOCompanionRouteDetails _needsWaypointRemoval:](self, "_needsWaypointRemoval:", a3)
      && !-[GEOCompanionRouteDetails _hasIncompatibleManeuverType:](self, "_hasIncompatibleManeuverType:", a3))
    {
      GEOFindOrCreateLog("com.apple.GeoServices", "CompanionCompatibility");
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
      {
        v37 = (objc_class *)objc_opt_class();
        NSStringFromClass(v37);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v45 = v38;
        v46 = 2048;
        v47 = self;
        v48 = 2048;
        v49 = a3;
        _os_log_impl(&dword_1885A9000, v36, OS_LOG_TYPE_DEBUG, "%@<%p> is compatible with protocol version %lu", buf, 0x20u);

      }
      return self;
    }
  }
  GEOFindOrCreateLog("com.apple.GeoServices", "CompanionCompatibility");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v45 = v9;
    v46 = 2048;
    v47 = self;
    v48 = 2048;
    v49 = a3;
    _os_log_impl(&dword_1885A9000, v7, OS_LOG_TYPE_DEBUG, "%@<%p> is not compatible with protocol version %lu", buf, 0x20u);

  }
  v10 = (void *)-[GEOCompanionRouteDetails copy](self, "copy");
  v11 = v10;
  if (a3 < 4)
  {
    objc_msgSend(v10, "clearWaypoints");
    GEOFindOrCreateLog("com.apple.GeoServices", "CompanionCompatibility");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v20 = (objc_class *)objc_opt_class();
      NSStringFromClass(v20);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v45 = v14;
      v46 = 2048;
      v47 = self;
      v15 = "%@<%p> | Removed waypoints from route";
      goto LABEL_19;
    }
  }
  else
  {
    objc_msgSend(v10, "setOrigin:", 0);
    objc_msgSend(v11, "setDestination:", 0);
    GEOFindOrCreateLog("com.apple.GeoServices", "CompanionCompatibility");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v45 = v14;
      v46 = 2048;
      v47 = self;
      v15 = "%@<%p> | Removed origin/destination from route";
LABEL_19:
      _os_log_impl(&dword_1885A9000, v12, OS_LOG_TYPE_INFO, v15, buf, 0x16u);

    }
  }

  v21 = objc_alloc(MEMORY[0x1E0C99DE8]);
  -[GEOCompanionRouteDetails steps](self, "steps");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v21, "initWithCapacity:", objc_msgSend(v22, "count"));

  v24 = (void *)MEMORY[0x18D764E2C]();
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  -[GEOCompanionRouteDetails steps](self, "steps", 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v27; ++i)
      {
        if (*(_QWORD *)v40 != v28)
          objc_enumerationMutation(v25);
        objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * i), "instanceCompatibleWithProtocolVersion:", a3);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        if (v30)
          objc_msgSend(v23, "addObject:", v30);

      }
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    }
    while (v27);
  }

  objc_msgSend(v11, "setSteps:", v23);
  objc_autoreleasePoolPop(v24);
  -[GEOCompanionRouteDetails response](self, "response");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "instanceCompatibleWithProtocolVersion:", a3);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setResponse:", v32);
  objc_msgSend(v32, "decoderData");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setDecoderData:", v33);

  -[GEOCompanionRouteDetails originalSuggestedRoute](self, "originalSuggestedRoute");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "instanceCompatibleWithProtocolVersion:", a3);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setOriginalSuggestedRoute:", v35);

  return v11;
}

- (GEOCompanionRouteDetails)initWithRoute:(id)a3 destinationName:(id)a4 stringFormatter:(id)a5 traffic:(id)a6
{
  id v9;
  id v10;
  id v11;
  GEOCompanionRouteDetails *v12;
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
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  void *v33;
  GEOCompanionWaypoint *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t j;
  void *v52;
  void *v53;
  GEOCompanionRouteDetails *v54;
  void *v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  objc_super v65;
  uint8_t v66[128];
  uint8_t buf[4];
  id v68;
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v65.receiver = self;
  v65.super_class = (Class)GEOCompanionRouteDetails;
  v12 = -[GEOCompanionRouteDetails init](&v65, sel_init);
  if (v12)
  {
    objc_msgSend(v9, "routeInitializerData");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "directionsRequest");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOCompanionRouteDetails setRequest:](v12, "setRequest:", v14);

    objc_msgSend(v9, "routeInitializerData");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "directionsResponse");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    -[GEOCompanionRouteDetails setResponse:](v12, "setResponse:", v16);
    -[GEOCompanionRouteDetails setRouteIndex:](v12, "setRouteIndex:", objc_msgSend(v9, "indexInResponse"));
    objc_msgSend(v9, "routeInitializerData");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "etaTrafficUpdateResponse");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOCompanionRouteDetails setEtaResponse:](v12, "setEtaResponse:", v18);

    objc_msgSend(v9, "styleAttributes");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOCompanionRouteDetails setStyleAttributes:](v12, "setStyleAttributes:", v19);

    -[GEOCompanionRouteDetails setSource:](v12, "setSource:", objc_msgSend(v9, "source"));
    objc_msgSend(v9, "storageID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "_maps_data");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOCompanionRouteDetails setStorageID:](v12, "setStorageID:", v21);

    objc_msgSend(v9, "anchorPoints");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      v23 = (void *)MEMORY[0x1E0CB36F8];
      objc_msgSend(v9, "anchorPoints");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "archivedDataWithRootObject:requiringSecureCoding:error:", v24, 1, 0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEOCompanionRouteDetails setAnchorPointsData:](v12, "setAnchorPointsData:", v25);

    }
    else
    {
      -[GEOCompanionRouteDetails setAnchorPointsData:](v12, "setAnchorPointsData:", 0);
    }

    if (objc_msgSend(v9, "transportType") == 1
      || objc_msgSend(v9, "isWalkingOnlyTransitRoute"))
    {
      objc_msgSend(v9, "originalSuggestedRoute");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEOCompanionRouteDetails setOriginalSuggestedRoute:](v12, "setOriginalSuggestedRoute:", v26);

      objc_msgSend(v16, "decoderData");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEOCompanionRouteDetails setDecoderData:](v12, "setDecoderData:", v27);

      -[GEOCompanionRouteDetails setShowTransitSchedules:](v12, "setShowTransitSchedules:", objc_msgSend(v9, "shouldShowSchedule"));
    }
    v56 = v16;
    v63 = 0u;
    v64 = 0u;
    v61 = 0u;
    v62 = 0u;
    objc_msgSend(v9, "waypoints");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v61, v69, 16);
    if (v29)
    {
      v30 = v29;
      v31 = *(_QWORD *)v62;
      do
      {
        for (i = 0; i != v30; ++i)
        {
          if (*(_QWORD *)v62 != v31)
            objc_enumerationMutation(v28);
          v33 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * i);
          if ((objc_msgSend(v33, "isServerProvidedWaypoint") & 1) == 0)
          {
            v34 = -[GEOCompanionWaypoint initWithComposedWaypoint:]([GEOCompanionWaypoint alloc], "initWithComposedWaypoint:", v33);
            -[GEOCompanionRouteDetails addWaypoints:](v12, "addWaypoints:", v34);

          }
        }
        v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v61, v69, 16);
      }
      while (v30);
    }

    if (-[GEOCompanionRouteDetails waypointsCount](v12, "waypointsCount") <= 1)
    {
      GEOGetCompanionExtrasLog();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        v68 = v9;
        _os_log_impl(&dword_1885A9000, v35, OS_LOG_TYPE_FAULT, "Composed route did not have 2 or more waypoints when expected: %@", buf, 0xCu);
      }

    }
    if (v10)
      goto LABEL_26;
    objc_msgSend(v9, "destination");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "mapItemStorage");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "name");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v10, "length") ? v10 : 0;
    v39 = v38;

    if (v39)
LABEL_26:
      -[GEOCompanionRouteDetails setDestinationName:](v12, "setDestinationName:", v10);
    else
      v10 = 0;
    objc_msgSend(v9, "uniqueRouteID");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = v40;
    if (!v40)
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v41, "_maps_data");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOCompanionRouteDetails setRouteID:](v12, "setRouteID:", v42);

    if (!v40)
    objc_msgSend(v9, "revisionIdentifier");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    if (v43)
    {
      objc_msgSend(v9, "revisionIdentifier");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "_maps_data");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEOCompanionRouteDetails setRevisionID:](v12, "setRevisionID:", v45);

    }
    else
    {
      -[GEOCompanionRouteDetails routeID](v12, "routeID");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEOCompanionRouteDetails setRevisionID:](v12, "setRevisionID:", v44);
    }

    objc_msgSend(v9, "serverRouteID");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOCompanionRouteDetails setOriginalRouteID:](v12, "setOriginalRouteID:", v46);

    v59 = 0u;
    v60 = 0u;
    v57 = 0u;
    v58 = 0u;
    objc_msgSend(v9, "rideSelections");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v57, v66, 16);
    if (v48)
    {
      v49 = v48;
      v50 = *(_QWORD *)v58;
      do
      {
        for (j = 0; j != v49; ++j)
        {
          if (*(_QWORD *)v58 != v50)
            objc_enumerationMutation(v47);
          -[GEOCompanionRouteDetails addSelectedRideIndex:](v12, "addSelectedRideIndex:", objc_msgSend(*(id *)(*((_QWORD *)&v57 + 1) + 8 * j), "unsignedIntValue"));
        }
        v49 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v57, v66, 16);
      }
      while (v49);
    }

    -[GEOCompanionRouteDetails _initForPreHunterWithRoute:stringFormatter:](v12, "_initForPreHunterWithRoute:stringFormatter:", v9, v11);
    -[GEOCompanionRouteDetails response](v12, "response");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "preJupiterCompatibleDirectionsResponseWithRoute:", v9);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOCompanionRouteDetails setResponse:](v12, "setResponse:", v53);

    v54 = v12;
  }

  return v12;
}

- (void)_initForPreHunterWithRoute:(id)a3 stringFormatter:(id)a4
{
  id v6;
  id v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  GEOCompanionStep *v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOCompanionRouteDetails setName:](self, "setName:", v8);

  objc_msgSend(v6, "distance");
  -[GEOCompanionRouteDetails setDistance:](self, "setDistance:", v9);
  -[GEOCompanionRouteDetails setTransportType:](self, "setTransportType:", objc_msgSend(v6, "transportType"));
  objc_msgSend(v6, "trafficDescription");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOCompanionRouteDetails setTrafficDescription:](self, "setTrafficDescription:", v10);

  objc_msgSend(v6, "routeDescriptions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "mutableCopy");
  -[GEOCompanionRouteDetails setRouteDescriptions:](self, "setRouteDescriptions:", v12);

  if (objc_msgSend(v6, "hasExpectedTime"))
    -[GEOCompanionRouteDetails setOriginalDuration:](self, "setOriginalDuration:", objc_msgSend(v6, "expectedTime"));
  if (objc_msgSend(v6, "hasHistoricTravelTime"))
    -[GEOCompanionRouteDetails setHistoricalDuration:](self, "setHistoricalDuration:", objc_msgSend(v6, "historicTravelTime"));
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  objc_msgSend(v6, "steps", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v30;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v30 != v16)
          objc_enumerationMutation(v13);
        v18 = -[GEOCompanionStep initWithStep:route:stringFormatter:]([GEOCompanionStep alloc], "initWithStep:route:stringFormatter:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v17), v6, v7);
        -[GEOCompanionRouteDetails addStep:](self, "addStep:", v18);

        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v15);
  }

  v19 = objc_msgSend(v6, "pointCount");
  if (v19)
  {
    v20 = 0;
    v21 = v19;
    do
    {
      objc_msgSend(v6, "pointAt:", v20);
      v23 = v22;
      -[GEOCompanionRouteDetails addCoordinates:](self, "addCoordinates:");
      -[GEOCompanionRouteDetails addCoordinates:](self, "addCoordinates:", v23);
      ++v20;
    }
    while (v21 != v20);
  }
  objc_msgSend(v6, "origin");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "mapItemStorage");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOCompanionRouteDetails setOrigin:](self, "setOrigin:", v25);

  objc_msgSend(v6, "destination");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "mapItemStorage");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOCompanionRouteDetails setDestination:](self, "setDestination:", v27);

  objc_msgSend(v6, "traffic");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v28, "trafficColorsCount"))
    -[GEOCompanionRouteDetails setTrafficColors:count:](self, "setTrafficColors:count:", objc_msgSend(v28, "trafficColors"), objc_msgSend(v28, "trafficColorsCount"));
  if (objc_msgSend(v28, "trafficColorOffsetsCount"))
    -[GEOCompanionRouteDetails setTrafficColorOffsets:count:](self, "setTrafficColorOffsets:count:", objc_msgSend(v28, "trafficColorOffsets"), objc_msgSend(v28, "trafficColorOffsetsCount"));

}

- (NSString)shortDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  __CFString *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[GEOCompanionRouteDetails destinationName](self, "destinationName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOCompanionRouteDetails name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[GEOCompanionRouteDetails transportType](self, "transportType");
  if (v7 >= 7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v7);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = off_1E1C0DA80[(int)v7];
  }
  -[GEOCompanionRouteDetails routeID](self, "routeID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p %@ - %@ - %@ - %@>"), v4, self, v5, v6, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

- (BOOL)isSyntheticRoute
{
  return !-[GEOCompanionRouteDetails hasRouteID](self, "hasRouteID");
}

- (GEOComposedWaypoint)composedOrigin
{
  void *v2;
  GEOComposedWaypoint *v3;

  -[GEOCompanionRouteDetails companionOrigin](self, "companionOrigin");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = -[GEOComposedWaypoint initWithCompanionWaypoint:]([GEOComposedWaypoint alloc], "initWithCompanionWaypoint:", v2);
  else
    v3 = 0;

  return v3;
}

- (GEOComposedWaypoint)composedDestination
{
  void *v2;
  GEOComposedWaypoint *v3;

  -[GEOCompanionRouteDetails companionDestination](self, "companionDestination");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = -[GEOComposedWaypoint initWithCompanionWaypoint:]([GEOComposedWaypoint alloc], "initWithCompanionWaypoint:", v2);
  else
    v3 = 0;

  return v3;
}

- (id)composedWaypointAtIndex:(unint64_t)a3
{
  GEOComposedWaypoint *v5;
  void *v6;
  void *v7;
  GEOComposedWaypoint *v8;
  uint64_t v9;

  if (-[GEOCompanionRouteDetails waypointsCount](self, "waypointsCount") < 2
    || -[GEOCompanionRouteDetails waypointsCount](self, "waypointsCount") <= a3)
  {
    if (a3 == 1)
    {
      -[GEOCompanionRouteDetails composedDestination](self, "composedDestination");
      v9 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (a3)
      {
        v8 = 0;
        return v8;
      }
      -[GEOCompanionRouteDetails composedOrigin](self, "composedOrigin");
      v9 = objc_claimAutoreleasedReturnValue();
    }
    v8 = (GEOComposedWaypoint *)v9;
  }
  else
  {
    v5 = [GEOComposedWaypoint alloc];
    -[GEOCompanionRouteDetails waypoints](self, "waypoints");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndexedSubscript:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[GEOComposedWaypoint initWithCompanionWaypoint:](v5, "initWithCompanionWaypoint:", v7);

  }
  return v8;
}

- (GEOCompanionWaypoint)companionOrigin
{
  void *v3;
  unint64_t v4;
  void *v5;
  GEOCompanionWaypoint *v6;
  void *v7;

  -[GEOCompanionRouteDetails waypoints](self, "waypoints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4 < 2)
  {
    -[GEOCompanionRouteDetails origin](self, "origin");
    v6 = (GEOCompanionWaypoint *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v6 = objc_alloc_init(GEOCompanionWaypoint);
      -[GEOCompanionRouteDetails origin](self, "origin");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEOCompanionWaypoint setMapItem:](v6, "setMapItem:", v7);

      -[GEOCompanionWaypoint setIsCurrentLocation:](v6, "setIsCurrentLocation:", -[GEOCompanionRouteDetails canNavigate](self, "canNavigate"));
    }
  }
  else
  {
    -[GEOCompanionRouteDetails waypoints](self, "waypoints");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = (GEOCompanionWaypoint *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (GEOCompanionWaypoint)companionDestination
{
  void *v3;
  uint64_t v4;
  void *v5;
  GEOCompanionWaypoint *v6;

  -[GEOCompanionRouteDetails waypoints](self, "waypoints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    -[GEOCompanionRouteDetails waypoints](self, "waypoints");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lastObject");
    v6 = (GEOCompanionWaypoint *)objc_claimAutoreleasedReturnValue();
LABEL_5:

    return v6;
  }
  -[GEOCompanionRouteDetails destination](self, "destination");
  v6 = (GEOCompanionWaypoint *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v6 = objc_alloc_init(GEOCompanionWaypoint);
    -[GEOCompanionRouteDetails destination](self, "destination");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOCompanionWaypoint setMapItem:](v6, "setMapItem:", v5);
    goto LABEL_5;
  }
  return v6;
}

- (id)companionWaypointAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  uint64_t v7;

  if (-[GEOCompanionRouteDetails waypointsCount](self, "waypointsCount") < 2
    || -[GEOCompanionRouteDetails waypointsCount](self, "waypointsCount") <= a3)
  {
    if (a3 == 1)
    {
      -[GEOCompanionRouteDetails companionDestination](self, "companionDestination");
      v7 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (a3)
      {
        v6 = 0;
        return v6;
      }
      -[GEOCompanionRouteDetails companionOrigin](self, "companionOrigin");
      v7 = objc_claimAutoreleasedReturnValue();
    }
    v6 = (void *)v7;
  }
  else
  {
    -[GEOCompanionRouteDetails waypoints](self, "waypoints");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

+ (id)syntheticRouteDetailsWithWaypoints:(id)a3 transportType:(int)a4 destinationName:(id)a5
{
  uint64_t v6;
  id v7;
  id v8;
  GEOCompanionRouteDetails *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v6 = *(_QWORD *)&a4;
  v7 = a3;
  v8 = a5;
  v9 = objc_alloc_init(GEOCompanionRouteDetails);
  v10 = (void *)objc_msgSend(v7, "mutableCopy");
  -[GEOCompanionRouteDetails setWaypoints:](v9, "setWaypoints:", v10);

  objc_msgSend(v7, "lastObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "mapItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[GEOMapItemStorage mapItemStorageForGEOMapItem:](GEOMapItemStorage, "mapItemStorageForGEOMapItem:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOCompanionRouteDetails setDestination:](v9, "setDestination:", v13);

  if ((unint64_t)objc_msgSend(v7, "count") >= 2)
  {
    objc_msgSend(v7, "firstObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "mapItem");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[GEOMapItemStorage mapItemStorageForGEOMapItem:](GEOMapItemStorage, "mapItemStorageForGEOMapItem:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOCompanionRouteDetails setOrigin:](v9, "setOrigin:", v16);

  }
  -[GEOCompanionRouteDetails setTransportType:](v9, "setTransportType:", v6);
  -[GEOCompanionRouteDetails setDestinationName:](v9, "setDestinationName:", v8);

  return v9;
}

- (unint64_t)stepIndexWithID:(unint64_t)a3
{
  unint64_t v3;
  void *v6;
  uint64_t v7;
  void *v8;
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
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = 0x7FFFFFFFFFFFFFFFLL;
  if (a3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[GEOCompanionRouteDetails steps](self, "steps");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    if (v7)
    {
      v18 = 0u;
      v19 = 0u;
      v16 = 0u;
      v17 = 0u;
      -[GEOCompanionRouteDetails steps](self, "steps", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v9)
      {
        v10 = v9;
        v11 = 0;
        v12 = *(_QWORD *)v17;
        while (2)
        {
          v13 = 0;
          v14 = v10 + v11;
          do
          {
            if (*(_QWORD *)v17 != v12)
              objc_enumerationMutation(v8);
            if (objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v13), "stepID") >= a3)
            {
              v3 = v11 + v13;
              goto LABEL_13;
            }
            ++v13;
          }
          while (v10 != v13);
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
          v11 = v14;
          if (v10)
            continue;
          break;
        }
      }

      -[GEOCompanionRouteDetails steps](self, "steps");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = objc_msgSend(v8, "count") - 1;
LABEL_13:

    }
    else
    {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  return v3;
}

- (id)stepWithID:(unint64_t)a3
{
  unint64_t v4;
  void *v5;
  unint64_t v6;
  void *v7;

  v4 = -[GEOCompanionRouteDetails stepIndexWithID:](self, "stepIndexWithID:", a3);
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = 0;
  }
  else
  {
    v6 = v4;
    -[GEOCompanionRouteDetails steps](self, "steps");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (NSArray)selectedRideIndices
{
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[GEOCompanionRouteDetails selectedRideIndexsCount](self, "selectedRideIndexsCount"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[GEOCompanionRouteDetails selectedRideIndexsCount](self, "selectedRideIndexsCount"))
  {
    v4 = 0;
    do
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[GEOCompanionRouteDetails selectedRideIndexAtIndex:](self, "selectedRideIndexAtIndex:", v4));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v5);

      ++v4;
    }
    while (v4 < -[GEOCompanionRouteDetails selectedRideIndexsCount](self, "selectedRideIndexsCount"));
  }
  v6 = (void *)objc_msgSend(v3, "copy");

  return (NSArray *)v6;
}

@end
