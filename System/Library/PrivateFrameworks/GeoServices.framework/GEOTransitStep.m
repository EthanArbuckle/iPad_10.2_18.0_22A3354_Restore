@implementation GEOTransitStep

- (GEOTransitStep)init
{
  GEOTransitStep *v2;
  GEOTransitStep *v3;
  GEOTransitStep *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOTransitStep;
  v2 = -[GEOTransitStep init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOTransitStep)initWithData:(id)a3
{
  GEOTransitStep *v3;
  GEOTransitStep *v4;
  GEOTransitStep *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOTransitStep;
  v3 = -[GEOTransitStep initWithData:](&v7, sel_initWithData_, a3);
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
  v3.receiver = self;
  v3.super_class = (Class)GEOTransitStep;
  -[GEOTransitStep dealloc](&v3, sel_dealloc);
}

- (int)maneuverType
{
  os_unfair_lock_s *p_readerLock;
  $5D35F1586042F4506E133FD2A7885CCE flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_BYTE *)&flags & 0x40) != 0)
    return self->_maneuverType;
  else
    return 0;
}

- (void)setManeuverType:(int)a3
{
  *(_QWORD *)&self->_flags |= 0x200000040uLL;
  self->_maneuverType = a3;
}

- (void)setHasManeuverType:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000;
  if (a3)
    v3 = 0x200000040;
  self->_flags = ($5D35F1586042F4506E133FD2A7885CCE)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFFBFLL | v3);
}

- (BOOL)hasManeuverType
{
  return (*(_BYTE *)&self->_flags >> 6) & 1;
}

- (id)maneuverTypeAsString:(int)a3
{
  if (a3 < 0xB)
    return off_1E1C03460[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsManeuverType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_MANEUVER")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LEAVE_ORIGIN")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WALK")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BOARD_VEHICLE")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PASS_STOP")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ALIGHT")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRANSFER_STOP_TO_STOP")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GOTO_STOP")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LEAVE_STOP")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BLOCK_TRANSFER")) & 1) != 0)
  {
    v4 = 9;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("ARRIVE_AT_DESTINATION")))
  {
    v4 = 10;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (unsigned)startingStopIndex
{
  return self->_startingStopIndex;
}

- (void)setStartingStopIndex:(unsigned int)a3
{
  *(_QWORD *)&self->_flags |= 0x200000200uLL;
  self->_startingStopIndex = a3;
}

- (void)setHasStartingStopIndex:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000;
  if (a3)
    v3 = 0x200000200;
  self->_flags = ($5D35F1586042F4506E133FD2A7885CCE)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFDFFLL | v3);
}

- (BOOL)hasStartingStopIndex
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 1) & 1;
}

- (unsigned)endingStopIndex
{
  return self->_endingStopIndex;
}

- (void)setEndingStopIndex:(unsigned int)a3
{
  *(_QWORD *)&self->_flags |= 0x200000010uLL;
  self->_endingStopIndex = a3;
}

- (void)setHasEndingStopIndex:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000;
  if (a3)
    v3 = 0x200000010;
  self->_flags = ($5D35F1586042F4506E133FD2A7885CCE)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFFEFLL | v3);
}

- (BOOL)hasEndingStopIndex
{
  return (*(_BYTE *)&self->_flags >> 4) & 1;
}

- (void)_readVehicleInfos
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 200));
    if ((*(_BYTE *)(a1 + 267) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTransitStepReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readVehicleInfos_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 200));
  }
}

- (NSMutableArray)vehicleInfos
{
  -[GEOTransitStep _readVehicleInfos]((uint64_t)self);
  return self->_vehicleInfos;
}

- (void)setVehicleInfos:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *vehicleInfos;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x80000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x200000000uLL;
  vehicleInfos = self->_vehicleInfos;
  self->_vehicleInfos = v4;

}

- (void)clearVehicleInfos
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x80000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(_QWORD *)&self->_flags |= 0x200000000uLL;
  -[NSMutableArray removeAllObjects](self->_vehicleInfos, "removeAllObjects");
}

- (void)addVehicleInfo:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOTransitStep _readVehicleInfos]((uint64_t)self);
  -[GEOTransitStep _addNoFlagsVehicleInfo:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x80000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x200000000uLL;
}

- (void)_addNoFlagsVehicleInfo:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 176);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 176);
      *(_QWORD *)(a1 + 176) = v5;

      v4 = *(void **)(a1 + 176);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)vehicleInfosCount
{
  -[GEOTransitStep _readVehicleInfos]((uint64_t)self);
  return -[NSMutableArray count](self->_vehicleInfos, "count");
}

- (id)vehicleInfoAtIndex:(unint64_t)a3
{
  -[GEOTransitStep _readVehicleInfos]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_vehicleInfos, "objectAtIndex:", a3);
}

+ (Class)vehicleInfoType
{
  return (Class)objc_opt_class();
}

- (void)_readEnterExitInfos
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 200));
    if ((*(_BYTE *)(a1 + 266) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTransitStepReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readEnterExitInfos_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 200));
  }
}

- (NSMutableArray)enterExitInfos
{
  -[GEOTransitStep _readEnterExitInfos]((uint64_t)self);
  return self->_enterExitInfos;
}

- (void)setEnterExitInfos:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *enterExitInfos;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x800000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x200000000uLL;
  enterExitInfos = self->_enterExitInfos;
  self->_enterExitInfos = v4;

}

- (void)clearEnterExitInfos
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x800000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(_QWORD *)&self->_flags |= 0x200000000uLL;
  -[NSMutableArray removeAllObjects](self->_enterExitInfos, "removeAllObjects");
}

- (void)addEnterExitInfo:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOTransitStep _readEnterExitInfos]((uint64_t)self);
  -[GEOTransitStep _addNoFlagsEnterExitInfo:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x800000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x200000000uLL;
}

- (void)_addNoFlagsEnterExitInfo:(uint64_t)a1
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

- (unint64_t)enterExitInfosCount
{
  -[GEOTransitStep _readEnterExitInfos]((uint64_t)self);
  return -[NSMutableArray count](self->_enterExitInfos, "count");
}

- (id)enterExitInfoAtIndex:(unint64_t)a3
{
  -[GEOTransitStep _readEnterExitInfos]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_enterExitInfos, "objectAtIndex:", a3);
}

+ (Class)enterExitInfoType
{
  return (Class)objc_opt_class();
}

- (BOOL)prioritizeTilesPreloading
{
  return self->_prioritizeTilesPreloading;
}

- (void)setPrioritizeTilesPreloading:(BOOL)a3
{
  *(_QWORD *)&self->_flags |= 0x200004000uLL;
  self->_prioritizeTilesPreloading = a3;
}

- (void)setHasPrioritizeTilesPreloading:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000;
  if (a3)
    v3 = 0x200004000;
  self->_flags = ($5D35F1586042F4506E133FD2A7885CCE)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFBFFFLL | v3);
}

- (BOOL)hasPrioritizeTilesPreloading
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 6) & 1;
}

- (unsigned)walkingIndex
{
  return self->_walkingIndex;
}

- (void)setWalkingIndex:(unsigned int)a3
{
  *(_QWORD *)&self->_flags |= 0x200001000uLL;
  self->_walkingIndex = a3;
}

- (void)setHasWalkingIndex:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000;
  if (a3)
    v3 = 0x200001000;
  self->_flags = ($5D35F1586042F4506E133FD2A7885CCE)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFEFFFLL | v3);
}

- (BOOL)hasWalkingIndex
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 4) & 1;
}

- (void)_readTransferInfos
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 200));
    if ((*(_BYTE *)(a1 + 267) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTransitStepReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTransferInfos_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 200));
  }
}

- (NSMutableArray)transferInfos
{
  -[GEOTransitStep _readTransferInfos]((uint64_t)self);
  return self->_transferInfos;
}

- (void)setTransferInfos:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *transferInfos;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x20000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x200000000uLL;
  transferInfos = self->_transferInfos;
  self->_transferInfos = v4;

}

- (void)clearTransferInfos
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x20000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(_QWORD *)&self->_flags |= 0x200000000uLL;
  -[NSMutableArray removeAllObjects](self->_transferInfos, "removeAllObjects");
}

- (void)addTransferInfo:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOTransitStep _readTransferInfos]((uint64_t)self);
  -[GEOTransitStep _addNoFlagsTransferInfo:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x20000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x200000000uLL;
}

- (void)_addNoFlagsTransferInfo:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 160);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 160);
      *(_QWORD *)(a1 + 160) = v5;

      v4 = *(void **)(a1 + 160);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)transferInfosCount
{
  -[GEOTransitStep _readTransferInfos]((uint64_t)self);
  return -[NSMutableArray count](self->_transferInfos, "count");
}

- (id)transferInfoAtIndex:(unint64_t)a3
{
  -[GEOTransitStep _readTransferInfos]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_transferInfos, "objectAtIndex:", a3);
}

+ (Class)transferInfoType
{
  return (Class)objc_opt_class();
}

- (unsigned)startingTime
{
  return self->_startingTime;
}

- (void)setStartingTime:(unsigned int)a3
{
  *(_QWORD *)&self->_flags |= 0x200000400uLL;
  self->_startingTime = a3;
}

- (void)setHasStartingTime:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000;
  if (a3)
    v3 = 0x200000400;
  self->_flags = ($5D35F1586042F4506E133FD2A7885CCE)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFBFFLL | v3);
}

- (BOOL)hasStartingTime
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 2) & 1;
}

- (void)_readArrivalInfo
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 200));
    if ((*(_BYTE *)(a1 + 266) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTransitStepReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readArrivalInfo_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 200));
  }
}

- (BOOL)hasArrivalInfo
{
  -[GEOTransitStep _readArrivalInfo]((uint64_t)self);
  return self->_arrivalInfo != 0;
}

- (GEOTransitArrivalInfo)arrivalInfo
{
  -[GEOTransitStep _readArrivalInfo]((uint64_t)self);
  return self->_arrivalInfo;
}

- (void)setArrivalInfo:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x200080000uLL;
  objc_storeStrong((id *)&self->_arrivalInfo, a3);
}

- (void)_readLocation
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 200));
    if ((*(_BYTE *)(a1 + 267) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTransitStepReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLocation_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 200));
  }
}

- (BOOL)hasLocation
{
  -[GEOTransitStep _readLocation]((uint64_t)self);
  return self->_location != 0;
}

- (GEOLatLng)location
{
  -[GEOTransitStep _readLocation]((uint64_t)self);
  return self->_location;
}

- (void)setLocation:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x202000000uLL;
  objc_storeStrong((id *)&self->_location, a3);
}

- (int)significanceForEndNode
{
  os_unfair_lock_s *p_readerLock;
  $5D35F1586042F4506E133FD2A7885CCE flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_WORD *)&flags & 0x100) != 0)
    return self->_significanceForEndNode;
  else
    return 0;
}

- (void)setSignificanceForEndNode:(int)a3
{
  *(_QWORD *)&self->_flags |= 0x200000100uLL;
  self->_significanceForEndNode = a3;
}

- (void)setHasSignificanceForEndNode:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000;
  if (a3)
    v3 = 0x200000100;
  self->_flags = ($5D35F1586042F4506E133FD2A7885CCE)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFEFFLL | v3);
}

- (BOOL)hasSignificanceForEndNode
{
  return *((_BYTE *)&self->_flags + 1) & 1;
}

- (id)significanceForEndNodeAsString:(int)a3
{
  if (a3 < 6)
    return off_1E1C034B8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsSignificanceForEndNode:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NO_SIGNIFICANCE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EXTRA_SMALL_SIGNIFICANCE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SMALL_SIGNIFICANCE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MEDIUM_SIGNIFICANCE")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LARGE_SIGNIFICANCE")) & 1) != 0)
  {
    v4 = 4;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("EXTRA_LARGE_SIGNIFICANCE")))
  {
    v4 = 5;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_readInstructions
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 200));
    if ((*(_BYTE *)(a1 + 267) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTransitStepReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readInstructions_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 200));
  }
}

- (BOOL)hasInstructions
{
  -[GEOTransitStep _readInstructions]((uint64_t)self);
  return self->_instructions != 0;
}

- (GEOInstructionSet)instructions
{
  -[GEOTransitStep _readInstructions]((uint64_t)self);
  return self->_instructions;
}

- (void)setInstructions:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x201000000uLL;
  objc_storeStrong((id *)&self->_instructions, a3);
}

- (unsigned)zilchIndex
{
  return self->_zilchIndex;
}

- (void)setZilchIndex:(unsigned int)a3
{
  *(_QWORD *)&self->_flags |= 0x200002000uLL;
  self->_zilchIndex = a3;
}

- (void)setHasZilchIndex:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000;
  if (a3)
    v3 = 0x200002000;
  self->_flags = ($5D35F1586042F4506E133FD2A7885CCE)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFDFFFLL | v3);
}

- (BOOL)hasZilchIndex
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 5) & 1;
}

- (unsigned)distanceInMeters
{
  return self->_distanceInMeters;
}

- (void)setDistanceInMeters:(unsigned int)a3
{
  *(_QWORD *)&self->_flags |= 0x200000008uLL;
  self->_distanceInMeters = a3;
}

- (void)setHasDistanceInMeters:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000;
  if (a3)
    v3 = 0x200000008;
  self->_flags = ($5D35F1586042F4506E133FD2A7885CCE)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFFF7 | v3);
}

- (BOOL)hasDistanceInMeters
{
  return (*(_BYTE *)&self->_flags >> 3) & 1;
}

- (void)_readRouteDetailsPrimaryArtworkIndexs
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 200));
    if ((*(_BYTE *)(a1 + 266) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTransitStepReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRouteDetailsPrimaryArtworkIndexs_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 200));
  }
}

- (unint64_t)routeDetailsPrimaryArtworkIndexsCount
{
  -[GEOTransitStep _readRouteDetailsPrimaryArtworkIndexs]((uint64_t)self);
  return self->_routeDetailsPrimaryArtworkIndexs.count;
}

- (unsigned)routeDetailsPrimaryArtworkIndexs
{
  -[GEOTransitStep _readRouteDetailsPrimaryArtworkIndexs]((uint64_t)self);
  return self->_routeDetailsPrimaryArtworkIndexs.list;
}

- (void)clearRouteDetailsPrimaryArtworkIndexs
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x10000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(_QWORD *)&self->_flags |= 0x200000000uLL;
  PBRepeatedUInt32Clear();
}

- (void)addRouteDetailsPrimaryArtworkIndex:(unsigned int)a3
{
  -[GEOTransitStep _readRouteDetailsPrimaryArtworkIndexs]((uint64_t)self);
  if (self)
    PBRepeatedUInt32Add();
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x10000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x200000000uLL;
}

- (unsigned)routeDetailsPrimaryArtworkIndexAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_routeDetailsPrimaryArtworkIndexs;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEOTransitStep _readRouteDetailsPrimaryArtworkIndexs]((uint64_t)self);
  p_routeDetailsPrimaryArtworkIndexs = &self->_routeDetailsPrimaryArtworkIndexs;
  count = self->_routeDetailsPrimaryArtworkIndexs.count;
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
  return p_routeDetailsPrimaryArtworkIndexs->list[a3];
}

- (void)setRouteDetailsPrimaryArtworkIndexs:(unsigned int *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x10000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(_QWORD *)&self->_flags |= 0x200000000uLL;
  PBRepeatedUInt32Set();
}

- (void)_readSteppingArtworkIndexs
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 200));
    if ((*(_BYTE *)(a1 + 266) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTransitStepReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSteppingArtworkIndexs_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 200));
  }
}

- (unint64_t)steppingArtworkIndexsCount
{
  -[GEOTransitStep _readSteppingArtworkIndexs]((uint64_t)self);
  return self->_steppingArtworkIndexs.count;
}

- (unsigned)steppingArtworkIndexs
{
  -[GEOTransitStep _readSteppingArtworkIndexs]((uint64_t)self);
  return self->_steppingArtworkIndexs.list;
}

- (void)clearSteppingArtworkIndexs
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x20000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(_QWORD *)&self->_flags |= 0x200000000uLL;
  PBRepeatedUInt32Clear();
}

- (void)addSteppingArtworkIndex:(unsigned int)a3
{
  -[GEOTransitStep _readSteppingArtworkIndexs]((uint64_t)self);
  if (self)
    PBRepeatedUInt32Add();
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x20000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x200000000uLL;
}

- (unsigned)steppingArtworkIndexAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_steppingArtworkIndexs;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEOTransitStep _readSteppingArtworkIndexs]((uint64_t)self);
  p_steppingArtworkIndexs = &self->_steppingArtworkIndexs;
  count = self->_steppingArtworkIndexs.count;
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
  return p_steppingArtworkIndexs->list[a3];
}

- (void)setSteppingArtworkIndexs:(unsigned int *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x20000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(_QWORD *)&self->_flags |= 0x200000000uLL;
  PBRepeatedUInt32Set();
}

- (unsigned)routeDetailsSecondaryArtworkIndex
{
  return self->_routeDetailsSecondaryArtworkIndex;
}

- (void)setRouteDetailsSecondaryArtworkIndex:(unsigned int)a3
{
  *(_QWORD *)&self->_flags |= 0x200000080uLL;
  self->_routeDetailsSecondaryArtworkIndex = a3;
}

- (void)setHasRouteDetailsSecondaryArtworkIndex:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000;
  if (a3)
    v3 = 0x200000080;
  self->_flags = ($5D35F1586042F4506E133FD2A7885CCE)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFF7FLL | v3);
}

- (BOOL)hasRouteDetailsSecondaryArtworkIndex
{
  return *(_BYTE *)&self->_flags >> 7;
}

- (unsigned)accessPointZilchIndex
{
  return self->_accessPointZilchIndex;
}

- (void)setAccessPointZilchIndex:(unsigned int)a3
{
  *(_QWORD *)&self->_flags |= 0x200000001uLL;
  self->_accessPointZilchIndex = a3;
}

- (void)setHasAccessPointZilchIndex:(BOOL)a3
{
  self->_flags = ($5D35F1586042F4506E133FD2A7885CCE)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFFFELL | a3 | 0x200000000);
}

- (BOOL)hasAccessPointZilchIndex
{
  return *(_DWORD *)&self->_flags & 1;
}

- (unsigned)defaultVehicleInfoIndex
{
  return self->_defaultVehicleInfoIndex;
}

- (void)setDefaultVehicleInfoIndex:(unsigned int)a3
{
  *(_QWORD *)&self->_flags |= 0x200000002uLL;
  self->_defaultVehicleInfoIndex = a3;
}

- (void)setHasDefaultVehicleInfoIndex:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000;
  if (a3)
    v3 = 0x200000002;
  self->_flags = ($5D35F1586042F4506E133FD2A7885CCE)(*(_QWORD *)&self->_flags & 0xFFFFFFFDFFFFFFFDLL | v3);
}

- (BOOL)hasDefaultVehicleInfoIndex
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (unsigned)departureFrequency
{
  return self->_departureFrequency;
}

- (void)setDepartureFrequency:(unsigned int)a3
{
  *(_QWORD *)&self->_flags |= 0x200000004uLL;
  self->_departureFrequency = a3;
}

- (void)setHasDepartureFrequency:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000;
  if (a3)
    v3 = 0x200000004;
  self->_flags = ($5D35F1586042F4506E133FD2A7885CCE)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFFFBLL | v3);
}

- (BOOL)hasDepartureFrequency
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (unsigned)steppingTransitIncidentMessageIndex
{
  return self->_steppingTransitIncidentMessageIndex;
}

- (void)setSteppingTransitIncidentMessageIndex:(unsigned int)a3
{
  *(_QWORD *)&self->_flags |= 0x200000800uLL;
  self->_steppingTransitIncidentMessageIndex = a3;
}

- (void)setHasSteppingTransitIncidentMessageIndex:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000;
  if (a3)
    v3 = 0x200000800;
  self->_flags = ($5D35F1586042F4506E133FD2A7885CCE)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFF7FFLL | v3);
}

- (BOOL)hasSteppingTransitIncidentMessageIndex
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 3) & 1;
}

- (unsigned)listTransitIncidentMessageIndex
{
  return self->_listTransitIncidentMessageIndex;
}

- (void)setListTransitIncidentMessageIndex:(unsigned int)a3
{
  *(_QWORD *)&self->_flags |= 0x200000020uLL;
  self->_listTransitIncidentMessageIndex = a3;
}

- (void)setHasListTransitIncidentMessageIndex:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000;
  if (a3)
    v3 = 0x200000020;
  self->_flags = ($5D35F1586042F4506E133FD2A7885CCE)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFFDFLL | v3);
}

- (BOOL)hasListTransitIncidentMessageIndex
{
  return (*(_BYTE *)&self->_flags >> 5) & 1;
}

- (void)_readAdvisoriesInfo
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 200));
    if ((*(_BYTE *)(a1 + 266) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTransitStepReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAdvisoriesInfo_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 200));
  }
}

- (BOOL)hasAdvisoriesInfo
{
  -[GEOTransitStep _readAdvisoriesInfo]((uint64_t)self);
  return self->_advisoriesInfo != 0;
}

- (GEOAdvisoriesInfo)advisoriesInfo
{
  -[GEOTransitStep _readAdvisoriesInfo]((uint64_t)self);
  return self->_advisoriesInfo;
}

- (void)setAdvisoriesInfo:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x200040000uLL;
  objc_storeStrong((id *)&self->_advisoriesInfo, a3);
}

- (void)_readBaseFare
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 200));
    if ((*(_BYTE *)(a1 + 266) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTransitStepReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readBaseFare_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 200));
  }
}

- (BOOL)hasBaseFare
{
  -[GEOTransitStep _readBaseFare]((uint64_t)self);
  return self->_baseFare != 0;
}

- (GEOTransitBaseFare)baseFare
{
  -[GEOTransitStep _readBaseFare]((uint64_t)self);
  return self->_baseFare;
}

- (void)setBaseFare:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x200200000uLL;
  objc_storeStrong((id *)&self->_baseFare, a3);
}

- (void)_readSurcharge
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 200));
    if ((*(_BYTE *)(a1 + 267) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTransitStepReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSurcharge_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 200));
  }
}

- (BOOL)hasSurcharge
{
  -[GEOTransitStep _readSurcharge]((uint64_t)self);
  return self->_surcharge != 0;
}

- (GEOTransitSurcharge)surcharge
{
  -[GEOTransitStep _readSurcharge]((uint64_t)self);
  return self->_surcharge;
}

- (void)setSurcharge:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x210000000uLL;
  objc_storeStrong((id *)&self->_surcharge, a3);
}

- (void)_readUpdateIdentifier
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 200));
    if ((*(_BYTE *)(a1 + 267) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTransitStepReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readUpdateIdentifier_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 200));
  }
}

- (BOOL)hasUpdateIdentifier
{
  -[GEOTransitStep _readUpdateIdentifier]((uint64_t)self);
  return self->_updateIdentifier != 0;
}

- (NSData)updateIdentifier
{
  -[GEOTransitStep _readUpdateIdentifier]((uint64_t)self);
  return self->_updateIdentifier;
}

- (void)setUpdateIdentifier:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x240000000uLL;
  objc_storeStrong((id *)&self->_updateIdentifier, a3);
}

- (void)_readVehiclePositionInfo
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 200));
    if ((*(_BYTE *)(a1 + 268) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTransitStepReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readVehiclePositionInfo_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 200));
  }
}

- (BOOL)hasVehiclePositionInfo
{
  -[GEOTransitStep _readVehiclePositionInfo]((uint64_t)self);
  return self->_vehiclePositionInfo != 0;
}

- (GEOTransitVehiclePositionInfo)vehiclePositionInfo
{
  -[GEOTransitStep _readVehiclePositionInfo]((uint64_t)self);
  return self->_vehiclePositionInfo;
}

- (void)setVehiclePositionInfo:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x300000000uLL;
  objc_storeStrong((id *)&self->_vehiclePositionInfo, a3);
}

- (void)_readScheduleInfo
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 200));
    if ((*(_BYTE *)(a1 + 267) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTransitStepReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readScheduleInfo_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 200));
  }
}

- (BOOL)hasScheduleInfo
{
  -[GEOTransitStep _readScheduleInfo]((uint64_t)self);
  return self->_scheduleInfo != 0;
}

- (GEOTransitScheduleInfo)scheduleInfo
{
  -[GEOTransitStep _readScheduleInfo]((uint64_t)self);
  return self->_scheduleInfo;
}

- (void)setScheduleInfo:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x208000000uLL;
  objc_storeStrong((id *)&self->_scheduleInfo, a3);
}

- (void)_readBoardingInfo
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 200));
    if ((*(_BYTE *)(a1 + 266) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTransitStepReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readBoardingInfo_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 200));
  }
}

- (BOOL)hasBoardingInfo
{
  -[GEOTransitStep _readBoardingInfo]((uint64_t)self);
  return self->_boardingInfo != 0;
}

- (GEOTransitBoardingInfo)boardingInfo
{
  -[GEOTransitStep _readBoardingInfo]((uint64_t)self);
  return self->_boardingInfo;
}

- (void)setBoardingInfo:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x200400000uLL;
  objc_storeStrong((id *)&self->_boardingInfo, a3);
}

- (void)_readBadges
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 200));
    if ((*(_BYTE *)(a1 + 266) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTransitStepReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readBadges_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 200));
  }
}

- (NSMutableArray)badges
{
  -[GEOTransitStep _readBadges]((uint64_t)self);
  return self->_badges;
}

- (void)setBadges:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *badges;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x100000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x200000000uLL;
  badges = self->_badges;
  self->_badges = v4;

}

- (void)clearBadges
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x100000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(_QWORD *)&self->_flags |= 0x200000000uLL;
  -[NSMutableArray removeAllObjects](self->_badges, "removeAllObjects");
}

- (void)addBadge:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOTransitStep _readBadges]((uint64_t)self);
  -[GEOTransitStep _addNoFlagsBadge:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x100000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x200000000uLL;
}

- (void)_addNoFlagsBadge:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 88);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 88);
      *(_QWORD *)(a1 + 88) = v5;

      v4 = *(void **)(a1 + 88);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)badgesCount
{
  -[GEOTransitStep _readBadges]((uint64_t)self);
  return -[NSMutableArray count](self->_badges, "count");
}

- (id)badgeAtIndex:(unint64_t)a3
{
  -[GEOTransitStep _readBadges]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_badges, "objectAtIndex:", a3);
}

+ (Class)badgeType
{
  return (Class)objc_opt_class();
}

- (void)_readRegionAlerts
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 200));
    if ((*(_BYTE *)(a1 + 267) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTransitStepReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRegionAlerts_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 200));
  }
}

- (NSMutableArray)regionAlerts
{
  -[GEOTransitStep _readRegionAlerts]((uint64_t)self);
  return self->_regionAlerts;
}

- (void)setRegionAlerts:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *regionAlerts;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x4000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x200000000uLL;
  regionAlerts = self->_regionAlerts;
  self->_regionAlerts = v4;

}

- (void)clearRegionAlerts
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x4000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(_QWORD *)&self->_flags |= 0x200000000uLL;
  -[NSMutableArray removeAllObjects](self->_regionAlerts, "removeAllObjects");
}

- (void)addRegionAlert:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOTransitStep _readRegionAlerts]((uint64_t)self);
  -[GEOTransitStep _addNoFlagsRegionAlert:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x4000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x200000000uLL;
}

- (void)_addNoFlagsRegionAlert:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 136);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 136);
      *(_QWORD *)(a1 + 136) = v5;

      v4 = *(void **)(a1 + 136);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)regionAlertsCount
{
  -[GEOTransitStep _readRegionAlerts]((uint64_t)self);
  return -[NSMutableArray count](self->_regionAlerts, "count");
}

- (id)regionAlertAtIndex:(unint64_t)a3
{
  -[GEOTransitStep _readRegionAlerts]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_regionAlerts, "objectAtIndex:", a3);
}

+ (Class)regionAlertType
{
  return (Class)objc_opt_class();
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
  v8.super_class = (Class)GEOTransitStep;
  -[GEOTransitStep description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOTransitStep dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOTransitStep _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __CFString *v8;
  const __CFString *v9;
  unint64_t v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  id v22;
  const __CFString *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  void *v30;
  id v31;
  const __CFString *v32;
  uint64_t v33;
  void *v34;
  const __CFString *v35;
  void *v36;
  const __CFString *v37;
  void *v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t k;
  void *v44;
  id v45;
  const __CFString *v46;
  void *v47;
  const __CFString *v48;
  void *v49;
  void *v50;
  void *v51;
  const __CFString *v52;
  id v53;
  void *v54;
  void *v55;
  id v56;
  uint64_t v57;
  __CFString *v58;
  const __CFString *v59;
  void *v60;
  void *v61;
  id v62;
  uint64_t v63;
  void *v64;
  const __CFString *v65;
  void *v66;
  const __CFString *v67;
  void *v68;
  const __CFString *v69;
  void *v70;
  const __CFString *v71;
  uint64_t v72;
  void *v73;
  const __CFString *v74;
  void *v75;
  void *v76;
  void *v77;
  const __CFString *v78;
  void *v79;
  const __CFString *v80;
  void *v81;
  const __CFString *v82;
  void *v83;
  const __CFString *v84;
  void *v85;
  const __CFString *v86;
  void *v87;
  const __CFString *v88;
  id v89;
  void *v90;
  void *v91;
  void *v92;
  const __CFString *v93;
  id v94;
  void *v95;
  void *v96;
  id v97;
  void *v98;
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
  void *v116;
  id v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t m;
  void *v122;
  id v123;
  void *v124;
  id v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t n;
  void *v130;
  id v131;
  const __CFString *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  id v137;
  id v138;
  id v139;
  _QWORD v141[4];
  id v142;
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
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  _BYTE v163[128];
  _BYTE v164[128];
  _BYTE v165[128];
  _BYTE v166[128];
  _BYTE v167[128];
  uint64_t v168;

  v168 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 0x1ECDA9000uLL;
  v6 = *(_QWORD *)(a1 + 264);
  if ((v6 & 0x40) != 0)
  {
    v7 = *(int *)(a1 + 228);
    if (v7 >= 0xB)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 228));
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = off_1E1C03460[v7];
    }
    if (a2)
      v9 = CFSTR("maneuverType");
    else
      v9 = CFSTR("maneuver_type");
    objc_msgSend(v4, "setObject:forKey:", v8, v9);

    v6 = *(_QWORD *)(a1 + 264);
  }
  v10 = 0x1E0CB3000uLL;
  if ((v6 & 0x200) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 240));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v12 = CFSTR("startingStopIndex");
    else
      v12 = CFSTR("starting_stop_index");
    objc_msgSend(v4, "setObject:forKey:", v11, v12);

    v6 = *(_QWORD *)(a1 + 264);
  }
  if ((v6 & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 220));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v14 = CFSTR("endingStopIndex");
    else
      v14 = CFSTR("ending_stop_index");
    objc_msgSend(v4, "setObject:forKey:", v13, v14);

  }
  if (objc_msgSend(*(id *)(a1 + 176), "count"))
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 176), "count"));
    v159 = 0u;
    v160 = 0u;
    v161 = 0u;
    v162 = 0u;
    v16 = *(id *)(a1 + 176);
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v159, v167, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v160;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v160 != v19)
            objc_enumerationMutation(v16);
          v21 = *(void **)(*((_QWORD *)&v159 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v21, "jsonRepresentation");
          else
            objc_msgSend(v21, "dictionaryRepresentation");
          v22 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v15, "addObject:", v22);
        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v159, v167, 16);
      }
      while (v18);
    }

    if (a2)
      v23 = CFSTR("vehicleInfo");
    else
      v23 = CFSTR("vehicle_info");
    objc_msgSend(v4, "setObject:forKey:", v15, v23);

    v10 = 0x1E0CB3000;
    v5 = 0x1ECDA9000;
  }
  if (objc_msgSend(*(id *)(a1 + 112), "count"))
  {
    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 112), "count"));
    v155 = 0u;
    v156 = 0u;
    v157 = 0u;
    v158 = 0u;
    v25 = *(id *)(a1 + 112);
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v155, v166, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v156;
      do
      {
        for (j = 0; j != v27; ++j)
        {
          if (*(_QWORD *)v156 != v28)
            objc_enumerationMutation(v25);
          v30 = *(void **)(*((_QWORD *)&v155 + 1) + 8 * j);
          if ((a2 & 1) != 0)
            objc_msgSend(v30, "jsonRepresentation");
          else
            objc_msgSend(v30, "dictionaryRepresentation");
          v31 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v24, "addObject:", v31);
        }
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v155, v166, 16);
      }
      while (v27);
    }

    if (a2)
      v32 = CFSTR("enterExitInfo");
    else
      v32 = CFSTR("enter_exit_info");
    objc_msgSend(v4, "setObject:forKey:", v24, v32);

    v10 = 0x1E0CB3000uLL;
    v5 = 0x1ECDA9000uLL;
  }
  v33 = *(_QWORD *)(a1 + *(int *)(v5 + 3728));
  if ((v33 & 0x4000) != 0)
  {
    objc_msgSend(*(id *)(v10 + 2024), "numberWithBool:", *(unsigned __int8 *)(a1 + 260));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v35 = CFSTR("prioritizeTilesPreloading");
    else
      v35 = CFSTR("prioritize_tiles_preloading");
    objc_msgSend(v4, "setObject:forKey:", v34, v35);

    v33 = *(_QWORD *)(a1 + 264);
  }
  if ((v33 & 0x1000) != 0)
  {
    objc_msgSend(*(id *)(v10 + 2024), "numberWithUnsignedInt:", *(unsigned int *)(a1 + 252));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v37 = CFSTR("walkingIndex");
    else
      v37 = CFSTR("walking_index");
    objc_msgSend(v4, "setObject:forKey:", v36, v37);

  }
  if (objc_msgSend(*(id *)(a1 + 160), "count"))
  {
    v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 160), "count"));
    v151 = 0u;
    v152 = 0u;
    v153 = 0u;
    v154 = 0u;
    v39 = *(id *)(a1 + 160);
    v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v151, v165, 16);
    if (v40)
    {
      v41 = v40;
      v42 = *(_QWORD *)v152;
      do
      {
        for (k = 0; k != v41; ++k)
        {
          if (*(_QWORD *)v152 != v42)
            objc_enumerationMutation(v39);
          v44 = *(void **)(*((_QWORD *)&v151 + 1) + 8 * k);
          if ((a2 & 1) != 0)
            objc_msgSend(v44, "jsonRepresentation");
          else
            objc_msgSend(v44, "dictionaryRepresentation");
          v45 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v38, "addObject:", v45);
        }
        v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v151, v165, 16);
      }
      while (v41);
    }

    if (a2)
      v46 = CFSTR("transferInfo");
    else
      v46 = CFSTR("transfer_info");
    objc_msgSend(v4, "setObject:forKey:", v38, v46);

    v10 = 0x1E0CB3000uLL;
    v5 = 0x1ECDA9000uLL;
  }
  if ((*(_BYTE *)(a1 + *(int *)(v5 + 3728) + 1) & 4) != 0)
  {
    objc_msgSend(*(id *)(v10 + 2024), "numberWithUnsignedInt:", *(unsigned int *)(a1 + 244));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v48 = CFSTR("startingTime");
    else
      v48 = CFSTR("starting_time");
    objc_msgSend(v4, "setObject:forKey:", v47, v48);

  }
  objc_msgSend((id)a1, "arrivalInfo");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = v49;
  if (v49)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v49, "jsonRepresentation");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = CFSTR("arrivalInfo");
    }
    else
    {
      objc_msgSend(v49, "dictionaryRepresentation");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = CFSTR("arrival_info");
    }
    v53 = v51;

    objc_msgSend(v4, "setObject:forKey:", v53, v52);
  }

  objc_msgSend((id)a1, "location");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = v54;
  if (v54)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v54, "jsonRepresentation");
    else
      objc_msgSend(v54, "dictionaryRepresentation");
    v56 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKey:", v56, CFSTR("location"));
  }

  if ((*(_BYTE *)(a1 + *(int *)(v5 + 3728) + 1) & 1) != 0)
  {
    v57 = *(int *)(a1 + 236);
    if (v57 >= 6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 236));
      v58 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v58 = off_1E1C034B8[v57];
    }
    if (a2)
      v59 = CFSTR("significanceForEndNode");
    else
      v59 = CFSTR("significance_for_end_node");
    objc_msgSend(v4, "setObject:forKey:", v58, v59);

  }
  objc_msgSend((id)a1, "instructions");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = v60;
  if (v60)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v60, "jsonRepresentation");
    else
      objc_msgSend(v60, "dictionaryRepresentation");
    v62 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKey:", v62, CFSTR("instructions"));
  }

  v63 = *(_QWORD *)(a1 + *(int *)(v5 + 3728));
  if ((v63 & 0x2000) != 0)
  {
    objc_msgSend(*(id *)(v10 + 2024), "numberWithUnsignedInt:", *(unsigned int *)(a1 + 256));
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v65 = CFSTR("zilchIndex");
    else
      v65 = CFSTR("zilch_index");
    objc_msgSend(v4, "setObject:forKey:", v64, v65);

    v63 = *(_QWORD *)(a1 + 264);
  }
  if ((v63 & 8) != 0)
  {
    objc_msgSend(*(id *)(v10 + 2024), "numberWithUnsignedInt:", *(unsigned int *)(a1 + 216));
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v67 = CFSTR("distanceInMeters");
    else
      v67 = CFSTR("distance_in_meters");
    objc_msgSend(v4, "setObject:forKey:", v66, v67);

  }
  if (*(_QWORD *)(a1 + 32))
  {
    PBRepeatedUInt32NSArray();
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v69 = CFSTR("routeDetailsPrimaryArtworkIndex");
    else
      v69 = CFSTR("route_details_primary_artwork_index");
    objc_msgSend(v4, "setObject:forKey:", v68, v69);

  }
  if (*(_QWORD *)(a1 + 56))
  {
    PBRepeatedUInt32NSArray();
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v71 = CFSTR("steppingArtworkIndex");
    else
      v71 = CFSTR("stepping_artwork_index");
    objc_msgSend(v4, "setObject:forKey:", v70, v71);

  }
  v72 = *(_QWORD *)(a1 + *(int *)(v5 + 3728));
  if ((v72 & 0x80) != 0)
  {
    objc_msgSend(*(id *)(v10 + 2024), "numberWithUnsignedInt:", *(unsigned int *)(a1 + 232));
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v80 = CFSTR("routeDetailsSecondaryArtworkIndex");
    else
      v80 = CFSTR("route_details_secondary_artwork_index");
    objc_msgSend(v4, "setObject:forKey:", v79, v80);

    v72 = *(_QWORD *)(a1 + 264);
    if ((v72 & 1) == 0)
    {
LABEL_125:
      if ((v72 & 2) == 0)
        goto LABEL_126;
      goto LABEL_144;
    }
  }
  else if ((v72 & 1) == 0)
  {
    goto LABEL_125;
  }
  objc_msgSend(*(id *)(v10 + 2024), "numberWithUnsignedInt:", *(unsigned int *)(a1 + 204));
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v82 = CFSTR("accessPointZilchIndex");
  else
    v82 = CFSTR("access_point_zilch_index");
  objc_msgSend(v4, "setObject:forKey:", v81, v82);

  v72 = *(_QWORD *)(a1 + 264);
  if ((v72 & 2) == 0)
  {
LABEL_126:
    if ((v72 & 4) == 0)
      goto LABEL_127;
    goto LABEL_148;
  }
LABEL_144:
  objc_msgSend(*(id *)(v10 + 2024), "numberWithUnsignedInt:", *(unsigned int *)(a1 + 208));
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v84 = CFSTR("defaultVehicleInfoIndex");
  else
    v84 = CFSTR("default_vehicle_info_index");
  objc_msgSend(v4, "setObject:forKey:", v83, v84);

  v72 = *(_QWORD *)(a1 + 264);
  if ((v72 & 4) == 0)
  {
LABEL_127:
    if ((v72 & 0x800) == 0)
      goto LABEL_128;
LABEL_152:
    objc_msgSend(*(id *)(v10 + 2024), "numberWithUnsignedInt:", *(unsigned int *)(a1 + 248));
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v88 = CFSTR("steppingTransitIncidentMessageIndex");
    else
      v88 = CFSTR("stepping_transit_incident_message_index");
    objc_msgSend(v4, "setObject:forKey:", v87, v88);

    if ((*(_QWORD *)(a1 + 264) & 0x20) == 0)
      goto LABEL_133;
    goto LABEL_129;
  }
LABEL_148:
  objc_msgSend(*(id *)(v10 + 2024), "numberWithUnsignedInt:", *(unsigned int *)(a1 + 212));
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v86 = CFSTR("departureFrequency");
  else
    v86 = CFSTR("departure_frequency");
  objc_msgSend(v4, "setObject:forKey:", v85, v86);

  v72 = *(_QWORD *)(a1 + 264);
  if ((v72 & 0x800) != 0)
    goto LABEL_152;
LABEL_128:
  if ((v72 & 0x20) != 0)
  {
LABEL_129:
    objc_msgSend(*(id *)(v10 + 2024), "numberWithUnsignedInt:", *(unsigned int *)(a1 + 224));
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v74 = CFSTR("listTransitIncidentMessageIndex");
    else
      v74 = CFSTR("list_transit_incident_message_index");
    objc_msgSend(v4, "setObject:forKey:", v73, v74);

  }
LABEL_133:
  objc_msgSend((id)a1, "advisoriesInfo");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = v75;
  if (v75)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v75, "jsonRepresentation");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      v78 = CFSTR("advisoriesInfo");
    }
    else
    {
      objc_msgSend(v75, "dictionaryRepresentation");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      v78 = CFSTR("advisories_info");
    }
    v89 = v77;

    objc_msgSend(v4, "setObject:forKey:", v89, v78);
  }

  objc_msgSend((id)a1, "baseFare");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  v91 = v90;
  if (v90)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v90, "jsonRepresentation");
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      v93 = CFSTR("baseFare");
    }
    else
    {
      objc_msgSend(v90, "dictionaryRepresentation");
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      v93 = CFSTR("base_fare");
    }
    v94 = v92;

    objc_msgSend(v4, "setObject:forKey:", v94, v93);
  }

  objc_msgSend((id)a1, "surcharge");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  v96 = v95;
  if (v95)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v95, "jsonRepresentation");
    else
      objc_msgSend(v95, "dictionaryRepresentation");
    v97 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKey:", v97, CFSTR("surcharge"));
  }

  objc_msgSend((id)a1, "updateIdentifier");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  v99 = v98;
  if (v98)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v98, "base64EncodedStringWithOptions:", 0);
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v100, CFSTR("updateIdentifier"));

    }
    else
    {
      objc_msgSend(v4, "setObject:forKey:", v98, CFSTR("update_identifier"));
    }
  }

  objc_msgSend((id)a1, "vehiclePositionInfo");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  v102 = v101;
  if (v101)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v101, "jsonRepresentation");
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      v104 = CFSTR("vehiclePositionInfo");
    }
    else
    {
      objc_msgSend(v101, "dictionaryRepresentation");
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      v104 = CFSTR("vehicle_position_info");
    }
    v105 = v103;

    objc_msgSend(v4, "setObject:forKey:", v105, v104);
  }

  objc_msgSend((id)a1, "scheduleInfo");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  v107 = v106;
  if (v106)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v106, "jsonRepresentation");
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      v109 = CFSTR("scheduleInfo");
    }
    else
    {
      objc_msgSend(v106, "dictionaryRepresentation");
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      v109 = CFSTR("schedule_info");
    }
    v110 = v108;

    objc_msgSend(v4, "setObject:forKey:", v110, v109);
  }

  objc_msgSend((id)a1, "boardingInfo");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  v112 = v111;
  if (v111)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v111, "jsonRepresentation");
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      v114 = CFSTR("boardingInfo");
    }
    else
    {
      objc_msgSend(v111, "dictionaryRepresentation");
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      v114 = CFSTR("boarding_info");
    }
    v115 = v113;

    objc_msgSend(v4, "setObject:forKey:", v115, v114);
  }

  if (objc_msgSend(*(id *)(a1 + 88), "count"))
  {
    v116 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 88), "count"));
    v147 = 0u;
    v148 = 0u;
    v149 = 0u;
    v150 = 0u;
    v117 = *(id *)(a1 + 88);
    v118 = objc_msgSend(v117, "countByEnumeratingWithState:objects:count:", &v147, v164, 16);
    if (v118)
    {
      v119 = v118;
      v120 = *(_QWORD *)v148;
      do
      {
        for (m = 0; m != v119; ++m)
        {
          if (*(_QWORD *)v148 != v120)
            objc_enumerationMutation(v117);
          v122 = *(void **)(*((_QWORD *)&v147 + 1) + 8 * m);
          if ((a2 & 1) != 0)
            objc_msgSend(v122, "jsonRepresentation");
          else
            objc_msgSend(v122, "dictionaryRepresentation");
          v123 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v116, "addObject:", v123);
        }
        v119 = objc_msgSend(v117, "countByEnumeratingWithState:objects:count:", &v147, v164, 16);
      }
      while (v119);
    }

    objc_msgSend(v4, "setObject:forKey:", v116, CFSTR("badge"));
  }
  if (objc_msgSend(*(id *)(a1 + 136), "count"))
  {
    v124 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 136), "count"));
    v143 = 0u;
    v144 = 0u;
    v145 = 0u;
    v146 = 0u;
    v125 = *(id *)(a1 + 136);
    v126 = objc_msgSend(v125, "countByEnumeratingWithState:objects:count:", &v143, v163, 16);
    if (v126)
    {
      v127 = v126;
      v128 = *(_QWORD *)v144;
      do
      {
        for (n = 0; n != v127; ++n)
        {
          if (*(_QWORD *)v144 != v128)
            objc_enumerationMutation(v125);
          v130 = *(void **)(*((_QWORD *)&v143 + 1) + 8 * n);
          if ((a2 & 1) != 0)
            objc_msgSend(v130, "jsonRepresentation");
          else
            objc_msgSend(v130, "dictionaryRepresentation");
          v131 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v124, "addObject:", v131);
        }
        v127 = objc_msgSend(v125, "countByEnumeratingWithState:objects:count:", &v143, v163, 16);
      }
      while (v127);
    }

    if (a2)
      v132 = CFSTR("regionAlert");
    else
      v132 = CFSTR("region_alert");
    objc_msgSend(v4, "setObject:forKey:", v124, v132);

  }
  v133 = *(void **)(a1 + 16);
  if (v133)
  {
    objc_msgSend(v133, "dictionaryRepresentation");
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    v135 = v134;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v134, "count"));
      v136 = (void *)objc_claimAutoreleasedReturnValue();
      v141[0] = MEMORY[0x1E0C809B0];
      v141[1] = 3221225472;
      v141[2] = __44__GEOTransitStep__dictionaryRepresentation___block_invoke;
      v141[3] = &unk_1E1C00600;
      v137 = v136;
      v142 = v137;
      objc_msgSend(v135, "enumerateKeysAndObjectsUsingBlock:", v141);
      v138 = v137;

      v135 = v138;
    }
    objc_msgSend(v4, "setObject:forKey:", v135, CFSTR("Unknown Fields"));

  }
  v139 = v4;

  return v139;
}

- (id)jsonRepresentation
{
  return -[GEOTransitStep _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __44__GEOTransitStep__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOTransitStep)initWithDictionary:(id)a3
{
  return (GEOTransitStep *)-[GEOTransitStep _initWithDictionary:isJSON:](self, a3, 0);
}

- (id)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  id v6;
  const __CFString *v7;
  void *v8;
  id v9;
  uint64_t v10;
  id v11;
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
  uint64_t v23;
  GEOTransitVehicleInfo *v24;
  uint64_t v25;
  void *v26;
  const __CFString *v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
  uint64_t v34;
  GEOTransitEnterExitInfo *v35;
  uint64_t v36;
  void *v37;
  const __CFString *v38;
  void *v39;
  const __CFString *v40;
  void *v41;
  const __CFString *v42;
  void *v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t k;
  uint64_t v49;
  GEOTransitTransferInfo *v50;
  uint64_t v51;
  void *v52;
  const __CFString *v53;
  void *v54;
  const __CFString *v55;
  void *v56;
  GEOTransitArrivalInfo *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  GEOLatLng *v61;
  uint64_t v62;
  void *v63;
  const __CFString *v64;
  void *v65;
  id v66;
  uint64_t v67;
  void *v68;
  GEOInstructionSet *v69;
  uint64_t v70;
  void *v71;
  const __CFString *v72;
  void *v73;
  const __CFString *v74;
  void *v75;
  const __CFString *v76;
  void *v77;
  id v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t m;
  void *v83;
  const __CFString *v84;
  void *v85;
  id v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t n;
  void *v91;
  const __CFString *v92;
  void *v93;
  const __CFString *v94;
  void *v95;
  const __CFString *v96;
  void *v97;
  const __CFString *v98;
  void *v99;
  const __CFString *v100;
  void *v101;
  const __CFString *v102;
  void *v103;
  const __CFString *v104;
  void *v105;
  GEOAdvisoriesInfo *v106;
  uint64_t v107;
  void *v108;
  const __CFString *v109;
  void *v110;
  GEOTransitBaseFare *v111;
  uint64_t v112;
  void *v113;
  void *v114;
  GEOTransitSurcharge *v115;
  uint64_t v116;
  void *v117;
  const __CFString *v118;
  void *v119;
  void *v120;
  const __CFString *v121;
  void *v122;
  GEOTransitVehiclePositionInfo *v123;
  uint64_t v124;
  void *v125;
  const __CFString *v126;
  void *v127;
  GEOTransitScheduleInfo *v128;
  uint64_t v129;
  void *v130;
  const __CFString *v131;
  void *v132;
  GEOTransitBoardingInfo *v133;
  uint64_t v134;
  void *v135;
  void *v136;
  id v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t ii;
  uint64_t v142;
  GEOTransitStepBadge *v143;
  uint64_t v144;
  void *v145;
  const __CFString *v146;
  void *v147;
  id v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t jj;
  uint64_t v153;
  GEOTransitRegionAlert *v154;
  uint64_t v155;
  void *v156;
  void *v158;
  void *v159;
  void *v160;
  id v161;
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
  _BYTE v190[128];
  _BYTE v191[128];
  _BYTE v192[128];
  _BYTE v193[128];
  _BYTE v194[128];
  _BYTE v195[128];
  _BYTE v196[128];
  uint64_t v197;

  v197 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (!a1 || (v6 = (id)objc_msgSend(a1, "init"), v6, !v6))
  {
    v11 = 0;
    goto LABEL_300;
  }
  if (a3)
    v7 = CFSTR("maneuverType");
  else
    v7 = CFSTR("maneuver_type");
  objc_msgSend(v5, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = v8;
    if ((objc_msgSend(v9, "isEqualToString:", CFSTR("UNKNOWN_MANEUVER")) & 1) != 0)
    {
      v10 = 0;
    }
    else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("LEAVE_ORIGIN")) & 1) != 0)
    {
      v10 = 1;
    }
    else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("WALK")) & 1) != 0)
    {
      v10 = 2;
    }
    else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("BOARD_VEHICLE")) & 1) != 0)
    {
      v10 = 3;
    }
    else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("PASS_STOP")) & 1) != 0)
    {
      v10 = 4;
    }
    else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("ALIGHT")) & 1) != 0)
    {
      v10 = 5;
    }
    else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("TRANSFER_STOP_TO_STOP")) & 1) != 0)
    {
      v10 = 6;
    }
    else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("GOTO_STOP")) & 1) != 0)
    {
      v10 = 7;
    }
    else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("LEAVE_STOP")) & 1) != 0)
    {
      v10 = 8;
    }
    else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("BLOCK_TRANSFER")) & 1) != 0)
    {
      v10 = 9;
    }
    else if (objc_msgSend(v9, "isEqualToString:", CFSTR("ARRIVE_AT_DESTINATION")))
    {
      v10 = 10;
    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_35;
    v10 = objc_msgSend(v8, "intValue");
  }
  objc_msgSend(v6, "setManeuverType:", v10);
LABEL_35:

  if (a3)
    v12 = CFSTR("startingStopIndex");
  else
    v12 = CFSTR("starting_stop_index");
  objc_msgSend(v5, "objectForKeyedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setStartingStopIndex:", objc_msgSend(v13, "unsignedIntValue"));

  if (a3)
    v14 = CFSTR("endingStopIndex");
  else
    v14 = CFSTR("ending_stop_index");
  objc_msgSend(v5, "objectForKeyedSubscript:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setEndingStopIndex:", objc_msgSend(v15, "unsignedIntValue"));

  if (a3)
    v16 = CFSTR("vehicleInfo");
  else
    v16 = CFSTR("vehicle_info");
  objc_msgSend(v5, "objectForKeyedSubscript:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v161 = v5;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v188 = 0u;
    v189 = 0u;
    v186 = 0u;
    v187 = 0u;
    v158 = v17;
    v18 = v17;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v186, v196, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v187;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v187 != v21)
            objc_enumerationMutation(v18);
          v23 = *(_QWORD *)(*((_QWORD *)&v186 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v24 = [GEOTransitVehicleInfo alloc];
            if ((a3 & 1) != 0)
              v25 = -[GEOTransitVehicleInfo initWithJSON:](v24, "initWithJSON:", v23);
            else
              v25 = -[GEOTransitVehicleInfo initWithDictionary:](v24, "initWithDictionary:", v23);
            v26 = (void *)v25;
            objc_msgSend(v6, "addVehicleInfo:", v25, v158);

          }
        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v186, v196, 16);
      }
      while (v20);
    }

    v17 = v158;
  }

  if (a3)
    v27 = CFSTR("enterExitInfo");
  else
    v27 = CFSTR("enter_exit_info");
  objc_msgSend(v5, "objectForKeyedSubscript:", v27, v158);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v184 = 0u;
    v185 = 0u;
    v182 = 0u;
    v183 = 0u;
    v159 = v28;
    v29 = v28;
    v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v182, v195, 16);
    if (v30)
    {
      v31 = v30;
      v32 = *(_QWORD *)v183;
      do
      {
        for (j = 0; j != v31; ++j)
        {
          if (*(_QWORD *)v183 != v32)
            objc_enumerationMutation(v29);
          v34 = *(_QWORD *)(*((_QWORD *)&v182 + 1) + 8 * j);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v35 = [GEOTransitEnterExitInfo alloc];
            if ((a3 & 1) != 0)
              v36 = -[GEOTransitEnterExitInfo initWithJSON:](v35, "initWithJSON:", v34);
            else
              v36 = -[GEOTransitEnterExitInfo initWithDictionary:](v35, "initWithDictionary:", v34);
            v37 = (void *)v36;
            objc_msgSend(v6, "addEnterExitInfo:", v36, v159);

          }
        }
        v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v182, v195, 16);
      }
      while (v31);
    }

    v28 = v159;
  }

  if (a3)
    v38 = CFSTR("prioritizeTilesPreloading");
  else
    v38 = CFSTR("prioritize_tiles_preloading");
  objc_msgSend(v5, "objectForKeyedSubscript:", v38, v159);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setPrioritizeTilesPreloading:", objc_msgSend(v39, "BOOLValue"));

  if (a3)
    v40 = CFSTR("walkingIndex");
  else
    v40 = CFSTR("walking_index");
  objc_msgSend(v5, "objectForKeyedSubscript:", v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setWalkingIndex:", objc_msgSend(v41, "unsignedIntValue"));

  if (a3)
    v42 = CFSTR("transferInfo");
  else
    v42 = CFSTR("transfer_info");
  objc_msgSend(v5, "objectForKeyedSubscript:", v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v180 = 0u;
    v181 = 0u;
    v178 = 0u;
    v179 = 0u;
    v160 = v43;
    v44 = v43;
    v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v178, v194, 16);
    if (v45)
    {
      v46 = v45;
      v47 = *(_QWORD *)v179;
      do
      {
        for (k = 0; k != v46; ++k)
        {
          if (*(_QWORD *)v179 != v47)
            objc_enumerationMutation(v44);
          v49 = *(_QWORD *)(*((_QWORD *)&v178 + 1) + 8 * k);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v50 = [GEOTransitTransferInfo alloc];
            if ((a3 & 1) != 0)
              v51 = -[GEOTransitTransferInfo initWithJSON:](v50, "initWithJSON:", v49);
            else
              v51 = -[GEOTransitTransferInfo initWithDictionary:](v50, "initWithDictionary:", v49);
            v52 = (void *)v51;
            objc_msgSend(v6, "addTransferInfo:", v51, v160);

          }
        }
        v46 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v178, v194, 16);
      }
      while (v46);
    }

    v43 = v160;
  }

  if (a3)
    v53 = CFSTR("startingTime");
  else
    v53 = CFSTR("starting_time");
  objc_msgSend(v5, "objectForKeyedSubscript:", v53, v160);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setStartingTime:", objc_msgSend(v54, "unsignedIntValue"));

  if (a3)
    v55 = CFSTR("arrivalInfo");
  else
    v55 = CFSTR("arrival_info");
  objc_msgSend(v5, "objectForKeyedSubscript:", v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v57 = [GEOTransitArrivalInfo alloc];
    if ((a3 & 1) != 0)
      v58 = -[GEOTransitArrivalInfo initWithJSON:](v57, "initWithJSON:", v56);
    else
      v58 = -[GEOTransitArrivalInfo initWithDictionary:](v57, "initWithDictionary:", v56);
    v59 = (void *)v58;
    objc_msgSend(v6, "setArrivalInfo:", v58);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("location"));
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v61 = [GEOLatLng alloc];
    if ((a3 & 1) != 0)
      v62 = -[GEOLatLng initWithJSON:](v61, "initWithJSON:", v60);
    else
      v62 = -[GEOLatLng initWithDictionary:](v61, "initWithDictionary:", v60);
    v63 = (void *)v62;
    objc_msgSend(v6, "setLocation:", v62);

  }
  if (a3)
    v64 = CFSTR("significanceForEndNode");
  else
    v64 = CFSTR("significance_for_end_node");
  objc_msgSend(v5, "objectForKeyedSubscript:", v64);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v66 = v65;
    if ((objc_msgSend(v66, "isEqualToString:", CFSTR("NO_SIGNIFICANCE")) & 1) != 0)
    {
      v67 = 0;
    }
    else if ((objc_msgSend(v66, "isEqualToString:", CFSTR("EXTRA_SMALL_SIGNIFICANCE")) & 1) != 0)
    {
      v67 = 1;
    }
    else if ((objc_msgSend(v66, "isEqualToString:", CFSTR("SMALL_SIGNIFICANCE")) & 1) != 0)
    {
      v67 = 2;
    }
    else if ((objc_msgSend(v66, "isEqualToString:", CFSTR("MEDIUM_SIGNIFICANCE")) & 1) != 0)
    {
      v67 = 3;
    }
    else if ((objc_msgSend(v66, "isEqualToString:", CFSTR("LARGE_SIGNIFICANCE")) & 1) != 0)
    {
      v67 = 4;
    }
    else if (objc_msgSend(v66, "isEqualToString:", CFSTR("EXTRA_LARGE_SIGNIFICANCE")))
    {
      v67 = 5;
    }
    else
    {
      v67 = 0;
    }

    goto LABEL_144;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v67 = objc_msgSend(v65, "intValue");
LABEL_144:
    objc_msgSend(v6, "setSignificanceForEndNode:", v67);
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("instructions"));
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v69 = [GEOInstructionSet alloc];
    if ((a3 & 1) != 0)
      v70 = -[GEOInstructionSet initWithJSON:](v69, "initWithJSON:", v68);
    else
      v70 = -[GEOInstructionSet initWithDictionary:](v69, "initWithDictionary:", v68);
    v71 = (void *)v70;
    objc_msgSend(v6, "setInstructions:", v70);

  }
  if (a3)
    v72 = CFSTR("zilchIndex");
  else
    v72 = CFSTR("zilch_index");
  objc_msgSend(v5, "objectForKeyedSubscript:", v72);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setZilchIndex:", objc_msgSend(v73, "unsignedIntValue"));

  if (a3)
    v74 = CFSTR("distanceInMeters");
  else
    v74 = CFSTR("distance_in_meters");
  objc_msgSend(v5, "objectForKeyedSubscript:", v74);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setDistanceInMeters:", objc_msgSend(v75, "unsignedIntValue"));

  if (a3)
    v76 = CFSTR("routeDetailsPrimaryArtworkIndex");
  else
    v76 = CFSTR("route_details_primary_artwork_index");
  objc_msgSend(v5, "objectForKeyedSubscript:", v76);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v176 = 0u;
    v177 = 0u;
    v174 = 0u;
    v175 = 0u;
    v78 = v77;
    v79 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v174, v193, 16);
    if (v79)
    {
      v80 = v79;
      v81 = *(_QWORD *)v175;
      do
      {
        for (m = 0; m != v80; ++m)
        {
          if (*(_QWORD *)v175 != v81)
            objc_enumerationMutation(v78);
          v83 = *(void **)(*((_QWORD *)&v174 + 1) + 8 * m);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(v6, "addRouteDetailsPrimaryArtworkIndex:", objc_msgSend(v83, "unsignedIntValue"));
        }
        v80 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v174, v193, 16);
      }
      while (v80);
    }

    v5 = v161;
  }

  if (a3)
    v84 = CFSTR("steppingArtworkIndex");
  else
    v84 = CFSTR("stepping_artwork_index");
  objc_msgSend(v5, "objectForKeyedSubscript:", v84);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v172 = 0u;
    v173 = 0u;
    v170 = 0u;
    v171 = 0u;
    v86 = v85;
    v87 = objc_msgSend(v86, "countByEnumeratingWithState:objects:count:", &v170, v192, 16);
    if (v87)
    {
      v88 = v87;
      v89 = *(_QWORD *)v171;
      do
      {
        for (n = 0; n != v88; ++n)
        {
          if (*(_QWORD *)v171 != v89)
            objc_enumerationMutation(v86);
          v91 = *(void **)(*((_QWORD *)&v170 + 1) + 8 * n);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(v6, "addSteppingArtworkIndex:", objc_msgSend(v91, "unsignedIntValue"));
        }
        v88 = objc_msgSend(v86, "countByEnumeratingWithState:objects:count:", &v170, v192, 16);
      }
      while (v88);
    }

    v5 = v161;
  }

  if (a3)
    v92 = CFSTR("routeDetailsSecondaryArtworkIndex");
  else
    v92 = CFSTR("route_details_secondary_artwork_index");
  objc_msgSend(v5, "objectForKeyedSubscript:", v92);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setRouteDetailsSecondaryArtworkIndex:", objc_msgSend(v93, "unsignedIntValue"));

  if (a3)
    v94 = CFSTR("accessPointZilchIndex");
  else
    v94 = CFSTR("access_point_zilch_index");
  objc_msgSend(v5, "objectForKeyedSubscript:", v94);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setAccessPointZilchIndex:", objc_msgSend(v95, "unsignedIntValue"));

  if (a3)
    v96 = CFSTR("defaultVehicleInfoIndex");
  else
    v96 = CFSTR("default_vehicle_info_index");
  objc_msgSend(v5, "objectForKeyedSubscript:", v96);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setDefaultVehicleInfoIndex:", objc_msgSend(v97, "unsignedIntValue"));

  if (a3)
    v98 = CFSTR("departureFrequency");
  else
    v98 = CFSTR("departure_frequency");
  objc_msgSend(v5, "objectForKeyedSubscript:", v98);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setDepartureFrequency:", objc_msgSend(v99, "unsignedIntValue"));

  if (a3)
    v100 = CFSTR("steppingTransitIncidentMessageIndex");
  else
    v100 = CFSTR("stepping_transit_incident_message_index");
  objc_msgSend(v5, "objectForKeyedSubscript:", v100);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setSteppingTransitIncidentMessageIndex:", objc_msgSend(v101, "unsignedIntValue"));

  if (a3)
    v102 = CFSTR("listTransitIncidentMessageIndex");
  else
    v102 = CFSTR("list_transit_incident_message_index");
  objc_msgSend(v5, "objectForKeyedSubscript:", v102);
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setListTransitIncidentMessageIndex:", objc_msgSend(v103, "unsignedIntValue"));

  if (a3)
    v104 = CFSTR("advisoriesInfo");
  else
    v104 = CFSTR("advisories_info");
  objc_msgSend(v5, "objectForKeyedSubscript:", v104);
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v106 = [GEOAdvisoriesInfo alloc];
    if ((a3 & 1) != 0)
      v107 = -[GEOAdvisoriesInfo initWithJSON:](v106, "initWithJSON:", v105);
    else
      v107 = -[GEOAdvisoriesInfo initWithDictionary:](v106, "initWithDictionary:", v105);
    v108 = (void *)v107;
    objc_msgSend(v6, "setAdvisoriesInfo:", v107);

  }
  if (a3)
    v109 = CFSTR("baseFare");
  else
    v109 = CFSTR("base_fare");
  objc_msgSend(v5, "objectForKeyedSubscript:", v109);
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v111 = [GEOTransitBaseFare alloc];
    if ((a3 & 1) != 0)
      v112 = -[GEOTransitBaseFare initWithJSON:](v111, "initWithJSON:", v110);
    else
      v112 = -[GEOTransitBaseFare initWithDictionary:](v111, "initWithDictionary:", v110);
    v113 = (void *)v112;
    objc_msgSend(v6, "setBaseFare:", v112);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("surcharge"));
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v115 = [GEOTransitSurcharge alloc];
    if ((a3 & 1) != 0)
      v116 = -[GEOTransitSurcharge initWithJSON:](v115, "initWithJSON:", v114);
    else
      v116 = -[GEOTransitSurcharge initWithDictionary:](v115, "initWithDictionary:", v114);
    v117 = (void *)v116;
    objc_msgSend(v6, "setSurcharge:", v116);

  }
  if (a3)
    v118 = CFSTR("updateIdentifier");
  else
    v118 = CFSTR("update_identifier");
  objc_msgSend(v5, "objectForKeyedSubscript:", v118);
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v120 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v119, 0);
    objc_msgSend(v6, "setUpdateIdentifier:", v120);

  }
  if (a3)
    v121 = CFSTR("vehiclePositionInfo");
  else
    v121 = CFSTR("vehicle_position_info");
  objc_msgSend(v5, "objectForKeyedSubscript:", v121);
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v123 = [GEOTransitVehiclePositionInfo alloc];
    if ((a3 & 1) != 0)
      v124 = -[GEOTransitVehiclePositionInfo initWithJSON:](v123, "initWithJSON:", v122);
    else
      v124 = -[GEOTransitVehiclePositionInfo initWithDictionary:](v123, "initWithDictionary:", v122);
    v125 = (void *)v124;
    objc_msgSend(v6, "setVehiclePositionInfo:", v124);

  }
  if (a3)
    v126 = CFSTR("scheduleInfo");
  else
    v126 = CFSTR("schedule_info");
  objc_msgSend(v5, "objectForKeyedSubscript:", v126);
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v128 = [GEOTransitScheduleInfo alloc];
    if ((a3 & 1) != 0)
      v129 = -[GEOTransitScheduleInfo initWithJSON:](v128, "initWithJSON:", v127);
    else
      v129 = -[GEOTransitScheduleInfo initWithDictionary:](v128, "initWithDictionary:", v127);
    v130 = (void *)v129;
    objc_msgSend(v6, "setScheduleInfo:", v129);

  }
  if (a3)
    v131 = CFSTR("boardingInfo");
  else
    v131 = CFSTR("boarding_info");
  objc_msgSend(v5, "objectForKeyedSubscript:", v131);
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v133 = [GEOTransitBoardingInfo alloc];
    if ((a3 & 1) != 0)
      v134 = -[GEOTransitBoardingInfo initWithJSON:](v133, "initWithJSON:", v132);
    else
      v134 = -[GEOTransitBoardingInfo initWithDictionary:](v133, "initWithDictionary:", v132);
    v135 = (void *)v134;
    objc_msgSend(v6, "setBoardingInfo:", v134);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("badge"));
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v168 = 0u;
    v169 = 0u;
    v166 = 0u;
    v167 = 0u;
    v137 = v136;
    v138 = objc_msgSend(v137, "countByEnumeratingWithState:objects:count:", &v166, v191, 16);
    if (v138)
    {
      v139 = v138;
      v140 = *(_QWORD *)v167;
      do
      {
        for (ii = 0; ii != v139; ++ii)
        {
          if (*(_QWORD *)v167 != v140)
            objc_enumerationMutation(v137);
          v142 = *(_QWORD *)(*((_QWORD *)&v166 + 1) + 8 * ii);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v143 = [GEOTransitStepBadge alloc];
            if ((a3 & 1) != 0)
              v144 = -[GEOTransitStepBadge initWithJSON:](v143, "initWithJSON:", v142);
            else
              v144 = -[GEOTransitStepBadge initWithDictionary:](v143, "initWithDictionary:", v142);
            v145 = (void *)v144;
            objc_msgSend(v6, "addBadge:", v144);

          }
        }
        v139 = objc_msgSend(v137, "countByEnumeratingWithState:objects:count:", &v166, v191, 16);
      }
      while (v139);
    }

    v5 = v161;
  }

  if (a3)
    v146 = CFSTR("regionAlert");
  else
    v146 = CFSTR("region_alert");
  objc_msgSend(v5, "objectForKeyedSubscript:", v146);
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v164 = 0u;
    v165 = 0u;
    v162 = 0u;
    v163 = 0u;
    v148 = v147;
    v149 = objc_msgSend(v148, "countByEnumeratingWithState:objects:count:", &v162, v190, 16);
    if (v149)
    {
      v150 = v149;
      v151 = *(_QWORD *)v163;
      do
      {
        for (jj = 0; jj != v150; ++jj)
        {
          if (*(_QWORD *)v163 != v151)
            objc_enumerationMutation(v148);
          v153 = *(_QWORD *)(*((_QWORD *)&v162 + 1) + 8 * jj);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v154 = [GEOTransitRegionAlert alloc];
            if ((a3 & 1) != 0)
              v155 = -[GEOTransitRegionAlert initWithJSON:](v154, "initWithJSON:", v153);
            else
              v155 = -[GEOTransitRegionAlert initWithDictionary:](v154, "initWithDictionary:", v153);
            v156 = (void *)v155;
            objc_msgSend(v6, "addRegionAlert:", v155);

          }
        }
        v150 = objc_msgSend(v148, "countByEnumeratingWithState:objects:count:", &v162, v190, 16);
      }
      while (v150);
    }

    v5 = v161;
  }

  v11 = v6;
LABEL_300:

  return v11;
}

- (GEOTransitStep)initWithJSON:(id)a3
{
  return (GEOTransitStep *)-[GEOTransitStep _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_1351;
    else
      v8 = (int *)&readAll__nonRecursiveTag_1352;
    GEOTransitStepReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEOTransitStepCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOTransitStepIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOTransitStepReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  $5D35F1586042F4506E133FD2A7885CCE flags;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  $5D35F1586042F4506E133FD2A7885CCE v15;
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t k;
  $5D35F1586042F4506E133FD2A7885CCE v20;
  unint64_t v21;
  unint64_t v22;
  $5D35F1586042F4506E133FD2A7885CCE v23;
  NSMutableArray *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t m;
  NSMutableArray *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t n;
  PBDataReader *v32;
  void *v33;
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
  _BYTE v54[128];
  _BYTE v55[128];
  _BYTE v56[128];
  _BYTE v57[128];
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOTransitStepIsDirty((uint64_t)self) & 1) == 0)
  {
    v32 = self->_reader;
    objc_sync_enter(v32);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v33);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v32);
    goto LABEL_97;
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOTransitStep readAll:](self, "readAll:", 0);
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 0x40) == 0)
  {
    if ((*(_WORD *)&flags & 0x200) == 0)
      goto LABEL_5;
LABEL_94:
    PBDataWriterWriteUint32Field();
    if ((*(_QWORD *)&self->_flags & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
  PBDataWriterWriteInt32Field();
  flags = self->_flags;
  if ((*(_WORD *)&flags & 0x200) != 0)
    goto LABEL_94;
LABEL_5:
  if ((*(_BYTE *)&flags & 0x10) != 0)
LABEL_6:
    PBDataWriterWriteUint32Field();
LABEL_7:
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v7 = self->_vehicleInfos;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v51;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v51 != v9)
          objc_enumerationMutation(v7);
        PBDataWriterWriteSubmessage();
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
    }
    while (v8);
  }

  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v11 = self->_enterExitInfos;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v46, v57, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v47;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v47 != v13)
          objc_enumerationMutation(v11);
        PBDataWriterWriteSubmessage();
      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v46, v57, 16);
    }
    while (v12);
  }

  v15 = self->_flags;
  if ((*(_WORD *)&v15 & 0x4000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v15 = self->_flags;
  }
  if ((*(_WORD *)&v15 & 0x1000) != 0)
    PBDataWriterWriteUint32Field();
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v16 = self->_transferInfos;
  v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v42, v56, 16);
  if (v17)
  {
    v18 = *(_QWORD *)v43;
    do
    {
      for (k = 0; k != v17; ++k)
      {
        if (*(_QWORD *)v43 != v18)
          objc_enumerationMutation(v16);
        PBDataWriterWriteSubmessage();
      }
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v42, v56, 16);
    }
    while (v17);
  }

  if ((*((_BYTE *)&self->_flags + 1) & 4) != 0)
    PBDataWriterWriteUint32Field();
  if (self->_arrivalInfo)
    PBDataWriterWriteSubmessage();
  if (self->_location)
    PBDataWriterWriteSubmessage();
  if ((*((_BYTE *)&self->_flags + 1) & 1) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_instructions)
    PBDataWriterWriteSubmessage();
  v20 = self->_flags;
  if ((*(_WORD *)&v20 & 0x2000) != 0)
  {
    PBDataWriterWriteUint32Field();
    v20 = self->_flags;
  }
  if ((*(_BYTE *)&v20 & 8) != 0)
    PBDataWriterWriteUint32Field();
  if (self->_routeDetailsPrimaryArtworkIndexs.count)
  {
    v21 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      ++v21;
    }
    while (v21 < self->_routeDetailsPrimaryArtworkIndexs.count);
  }
  if (self->_steppingArtworkIndexs.count)
  {
    v22 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      ++v22;
    }
    while (v22 < self->_steppingArtworkIndexs.count);
  }
  v23 = self->_flags;
  if ((*(_BYTE *)&v23 & 0x80) != 0)
  {
    PBDataWriterWriteUint32Field();
    v23 = self->_flags;
  }
  if ((*(_BYTE *)&v23 & 1) != 0)
  {
    PBDataWriterWriteUint32Field();
    v23 = self->_flags;
  }
  if ((*(_BYTE *)&v23 & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    v23 = self->_flags;
  }
  if ((*(_BYTE *)&v23 & 4) != 0)
  {
    PBDataWriterWriteUint32Field();
    v23 = self->_flags;
  }
  if ((*(_WORD *)&v23 & 0x800) != 0)
  {
    PBDataWriterWriteUint32Field();
    v23 = self->_flags;
  }
  if ((*(_BYTE *)&v23 & 0x20) != 0)
    PBDataWriterWriteUint32Field();
  if (self->_advisoriesInfo)
    PBDataWriterWriteSubmessage();
  if (self->_baseFare)
    PBDataWriterWriteSubmessage();
  if (self->_surcharge)
    PBDataWriterWriteSubmessage();
  if (self->_updateIdentifier)
    PBDataWriterWriteDataField();
  if (self->_vehiclePositionInfo)
    PBDataWriterWriteSubmessage();
  if (self->_scheduleInfo)
    PBDataWriterWriteSubmessage();
  if (self->_boardingInfo)
    PBDataWriterWriteSubmessage();
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v24 = self->_badges;
  v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v38, v55, 16);
  if (v25)
  {
    v26 = *(_QWORD *)v39;
    do
    {
      for (m = 0; m != v25; ++m)
      {
        if (*(_QWORD *)v39 != v26)
          objc_enumerationMutation(v24);
        PBDataWriterWriteSubmessage();
      }
      v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v38, v55, 16);
    }
    while (v25);
  }

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v28 = self->_regionAlerts;
  v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v34, v54, 16);
  if (v29)
  {
    v30 = *(_QWORD *)v35;
    do
    {
      for (n = 0; n != v29; ++n)
      {
        if (*(_QWORD *)v35 != v30)
          objc_enumerationMutation(v28);
        PBDataWriterWriteSubmessage();
      }
      v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v34, v54, 16);
    }
    while (v29);
  }

  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v34);
LABEL_97:

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
  -[GEOTransitStep _readAdvisoriesInfo]((uint64_t)self);
  if (-[GEOAdvisoriesInfo hasGreenTeaWithValue:](self->_advisoriesInfo, "hasGreenTeaWithValue:", v3))
    return 1;
  -[GEOTransitStep _readLocation]((uint64_t)self);
  if (-[GEOLatLng hasGreenTeaWithValue:](self->_location, "hasGreenTeaWithValue:", v3))
    return 1;
  -[GEOTransitStep _readRegionAlerts]((uint64_t)self);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = self->_regionAlerts;
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
  $5D35F1586042F4506E133FD2A7885CCE flags;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t j;
  void *v12;
  $5D35F1586042F4506E133FD2A7885CCE v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t k;
  void *v17;
  id *v18;
  $5D35F1586042F4506E133FD2A7885CCE v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t m;
  unint64_t v23;
  unint64_t v24;
  uint64_t n;
  $5D35F1586042F4506E133FD2A7885CCE v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t ii;
  void *v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t jj;
  void *v34;
  id *v35;

  v35 = (id *)a3;
  -[GEOTransitStep readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v35 + 1, self->_reader);
  *((_DWORD *)v35 + 48) = self->_readerMarkPos;
  *((_DWORD *)v35 + 49) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 0x40) == 0)
  {
    if ((*(_WORD *)&flags & 0x200) == 0)
      goto LABEL_3;
LABEL_74:
    *((_DWORD *)v35 + 60) = self->_startingStopIndex;
    v35[33] = (id)((unint64_t)v35[33] | 0x200);
    if ((*(_QWORD *)&self->_flags & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  *((_DWORD *)v35 + 57) = self->_maneuverType;
  v35[33] = (id)((unint64_t)v35[33] | 0x40);
  flags = self->_flags;
  if ((*(_WORD *)&flags & 0x200) != 0)
    goto LABEL_74;
LABEL_3:
  if ((*(_BYTE *)&flags & 0x10) != 0)
  {
LABEL_4:
    *((_DWORD *)v35 + 55) = self->_endingStopIndex;
    v35[33] = (id)((unint64_t)v35[33] | 0x10);
  }
LABEL_5:
  if (-[GEOTransitStep vehicleInfosCount](self, "vehicleInfosCount"))
  {
    objc_msgSend(v35, "clearVehicleInfos");
    v5 = -[GEOTransitStep vehicleInfosCount](self, "vehicleInfosCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        -[GEOTransitStep vehicleInfoAtIndex:](self, "vehicleInfoAtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "addVehicleInfo:", v8);

      }
    }
  }
  if (-[GEOTransitStep enterExitInfosCount](self, "enterExitInfosCount"))
  {
    objc_msgSend(v35, "clearEnterExitInfos");
    v9 = -[GEOTransitStep enterExitInfosCount](self, "enterExitInfosCount");
    if (v9)
    {
      v10 = v9;
      for (j = 0; j != v10; ++j)
      {
        -[GEOTransitStep enterExitInfoAtIndex:](self, "enterExitInfoAtIndex:", j);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "addEnterExitInfo:", v12);

      }
    }
  }
  v13 = self->_flags;
  if ((*(_WORD *)&v13 & 0x4000) != 0)
  {
    *((_BYTE *)v35 + 260) = self->_prioritizeTilesPreloading;
    v35[33] = (id)((unint64_t)v35[33] | 0x4000);
    v13 = self->_flags;
  }
  if ((*(_WORD *)&v13 & 0x1000) != 0)
  {
    *((_DWORD *)v35 + 63) = self->_walkingIndex;
    v35[33] = (id)((unint64_t)v35[33] | 0x1000);
  }
  if (-[GEOTransitStep transferInfosCount](self, "transferInfosCount"))
  {
    objc_msgSend(v35, "clearTransferInfos");
    v14 = -[GEOTransitStep transferInfosCount](self, "transferInfosCount");
    if (v14)
    {
      v15 = v14;
      for (k = 0; k != v15; ++k)
      {
        -[GEOTransitStep transferInfoAtIndex:](self, "transferInfoAtIndex:", k);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "addTransferInfo:", v17);

      }
    }
  }
  v18 = v35;
  if ((*((_BYTE *)&self->_flags + 1) & 4) != 0)
  {
    *((_DWORD *)v35 + 61) = self->_startingTime;
    v35[33] = (id)((unint64_t)v35[33] | 0x400);
  }
  if (self->_arrivalInfo)
  {
    objc_msgSend(v35, "setArrivalInfo:");
    v18 = v35;
  }
  if (self->_location)
  {
    objc_msgSend(v35, "setLocation:");
    v18 = v35;
  }
  if ((*((_BYTE *)&self->_flags + 1) & 1) != 0)
  {
    *((_DWORD *)v18 + 59) = self->_significanceForEndNode;
    v18[33] = (id)((unint64_t)v18[33] | 0x100);
  }
  if (self->_instructions)
  {
    objc_msgSend(v35, "setInstructions:");
    v18 = v35;
  }
  v19 = self->_flags;
  if ((*(_WORD *)&v19 & 0x2000) != 0)
  {
    *((_DWORD *)v18 + 64) = self->_zilchIndex;
    v18[33] = (id)((unint64_t)v18[33] | 0x2000);
    v19 = self->_flags;
  }
  if ((*(_BYTE *)&v19 & 8) != 0)
  {
    *((_DWORD *)v18 + 54) = self->_distanceInMeters;
    v18[33] = (id)((unint64_t)v18[33] | 8);
  }
  if (-[GEOTransitStep routeDetailsPrimaryArtworkIndexsCount](self, "routeDetailsPrimaryArtworkIndexsCount"))
  {
    objc_msgSend(v35, "clearRouteDetailsPrimaryArtworkIndexs");
    v20 = -[GEOTransitStep routeDetailsPrimaryArtworkIndexsCount](self, "routeDetailsPrimaryArtworkIndexsCount");
    if (v20)
    {
      v21 = v20;
      for (m = 0; m != v21; ++m)
        objc_msgSend(v35, "addRouteDetailsPrimaryArtworkIndex:", -[GEOTransitStep routeDetailsPrimaryArtworkIndexAtIndex:](self, "routeDetailsPrimaryArtworkIndexAtIndex:", m));
    }
  }
  if (-[GEOTransitStep steppingArtworkIndexsCount](self, "steppingArtworkIndexsCount"))
  {
    objc_msgSend(v35, "clearSteppingArtworkIndexs");
    v23 = -[GEOTransitStep steppingArtworkIndexsCount](self, "steppingArtworkIndexsCount");
    if (v23)
    {
      v24 = v23;
      for (n = 0; n != v24; ++n)
        objc_msgSend(v35, "addSteppingArtworkIndex:", -[GEOTransitStep steppingArtworkIndexAtIndex:](self, "steppingArtworkIndexAtIndex:", n));
    }
  }
  v26 = self->_flags;
  if ((*(_BYTE *)&v26 & 0x80) != 0)
  {
    *((_DWORD *)v35 + 58) = self->_routeDetailsSecondaryArtworkIndex;
    v35[33] = (id)((unint64_t)v35[33] | 0x80);
    v26 = self->_flags;
    if ((*(_BYTE *)&v26 & 1) == 0)
    {
LABEL_45:
      if ((*(_BYTE *)&v26 & 2) == 0)
        goto LABEL_46;
      goto LABEL_78;
    }
  }
  else if ((*(_BYTE *)&v26 & 1) == 0)
  {
    goto LABEL_45;
  }
  *((_DWORD *)v35 + 51) = self->_accessPointZilchIndex;
  v35[33] = (id)((unint64_t)v35[33] | 1);
  v26 = self->_flags;
  if ((*(_BYTE *)&v26 & 2) == 0)
  {
LABEL_46:
    if ((*(_BYTE *)&v26 & 4) == 0)
      goto LABEL_47;
    goto LABEL_79;
  }
LABEL_78:
  *((_DWORD *)v35 + 52) = self->_defaultVehicleInfoIndex;
  v35[33] = (id)((unint64_t)v35[33] | 2);
  v26 = self->_flags;
  if ((*(_BYTE *)&v26 & 4) == 0)
  {
LABEL_47:
    if ((*(_WORD *)&v26 & 0x800) == 0)
      goto LABEL_48;
    goto LABEL_80;
  }
LABEL_79:
  *((_DWORD *)v35 + 53) = self->_departureFrequency;
  v35[33] = (id)((unint64_t)v35[33] | 4);
  v26 = self->_flags;
  if ((*(_WORD *)&v26 & 0x800) == 0)
  {
LABEL_48:
    if ((*(_BYTE *)&v26 & 0x20) == 0)
      goto LABEL_50;
    goto LABEL_49;
  }
LABEL_80:
  *((_DWORD *)v35 + 62) = self->_steppingTransitIncidentMessageIndex;
  v35[33] = (id)((unint64_t)v35[33] | 0x800);
  if ((*(_QWORD *)&self->_flags & 0x20) != 0)
  {
LABEL_49:
    *((_DWORD *)v35 + 56) = self->_listTransitIncidentMessageIndex;
    v35[33] = (id)((unint64_t)v35[33] | 0x20);
  }
LABEL_50:
  if (self->_advisoriesInfo)
    objc_msgSend(v35, "setAdvisoriesInfo:");
  if (self->_baseFare)
    objc_msgSend(v35, "setBaseFare:");
  if (self->_surcharge)
    objc_msgSend(v35, "setSurcharge:");
  if (self->_updateIdentifier)
    objc_msgSend(v35, "setUpdateIdentifier:");
  if (self->_vehiclePositionInfo)
    objc_msgSend(v35, "setVehiclePositionInfo:");
  if (self->_scheduleInfo)
    objc_msgSend(v35, "setScheduleInfo:");
  if (self->_boardingInfo)
    objc_msgSend(v35, "setBoardingInfo:");
  if (-[GEOTransitStep badgesCount](self, "badgesCount"))
  {
    objc_msgSend(v35, "clearBadges");
    v27 = -[GEOTransitStep badgesCount](self, "badgesCount");
    if (v27)
    {
      v28 = v27;
      for (ii = 0; ii != v28; ++ii)
      {
        -[GEOTransitStep badgeAtIndex:](self, "badgeAtIndex:", ii);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "addBadge:", v30);

      }
    }
  }
  if (-[GEOTransitStep regionAlertsCount](self, "regionAlertsCount"))
  {
    objc_msgSend(v35, "clearRegionAlerts");
    v31 = -[GEOTransitStep regionAlertsCount](self, "regionAlertsCount");
    if (v31)
    {
      v32 = v31;
      for (jj = 0; jj != v32; ++jj)
      {
        -[GEOTransitStep regionAlertAtIndex:](self, "regionAlertAtIndex:", jj);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "addRegionAlert:", v34);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  $5D35F1586042F4506E133FD2A7885CCE flags;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  $5D35F1586042F4506E133FD2A7885CCE v20;
  NSMutableArray *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t k;
  void *v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  $5D35F1586042F4506E133FD2A7885CCE v32;
  $5D35F1586042F4506E133FD2A7885CCE v33;
  id v34;
  void *v35;
  id v36;
  void *v37;
  id v38;
  void *v39;
  uint64_t v40;
  void *v41;
  id v42;
  void *v43;
  id v44;
  void *v45;
  id v46;
  void *v47;
  NSMutableArray *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t m;
  void *v52;
  NSMutableArray *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t n;
  void *v57;
  PBUnknownFields *v58;
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
  _BYTE v80[128];
  _BYTE v81[128];
  _BYTE v82[128];
  _BYTE v83[128];
  _BYTE v84[128];
  uint64_t v85;

  v85 = *MEMORY[0x1E0C80C00];
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
      GEOTransitStepReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_64;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOTransitStep readAll:](self, "readAll:", 0);
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 0x40) != 0)
  {
    *(_DWORD *)(v5 + 228) = self->_maneuverType;
    *(_QWORD *)(v5 + 264) |= 0x40uLL;
    flags = self->_flags;
    if ((*(_WORD *)&flags & 0x200) == 0)
    {
LABEL_7:
      if ((*(_BYTE *)&flags & 0x10) == 0)
        goto LABEL_9;
      goto LABEL_8;
    }
  }
  else if ((*(_WORD *)&flags & 0x200) == 0)
  {
    goto LABEL_7;
  }
  *(_DWORD *)(v5 + 240) = self->_startingStopIndex;
  *(_QWORD *)(v5 + 264) |= 0x200uLL;
  if ((*(_QWORD *)&self->_flags & 0x10) != 0)
  {
LABEL_8:
    *(_DWORD *)(v5 + 220) = self->_endingStopIndex;
    *(_QWORD *)(v5 + 264) |= 0x10uLL;
  }
LABEL_9:
  v78 = 0u;
  v79 = 0u;
  v76 = 0u;
  v77 = 0u;
  v10 = self->_vehicleInfos;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v76, v84, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v77;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v77 != v12)
          objc_enumerationMutation(v10);
        v14 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v76 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addVehicleInfo:", v14);

      }
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v76, v84, 16);
    }
    while (v11);
  }

  v74 = 0u;
  v75 = 0u;
  v72 = 0u;
  v73 = 0u;
  v15 = self->_enterExitInfos;
  v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v72, v83, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v73;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v73 != v17)
          objc_enumerationMutation(v15);
        v19 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v72 + 1) + 8 * j), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addEnterExitInfo:", v19);

      }
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v72, v83, 16);
    }
    while (v16);
  }

  v20 = self->_flags;
  if ((*(_WORD *)&v20 & 0x4000) != 0)
  {
    *(_BYTE *)(v5 + 260) = self->_prioritizeTilesPreloading;
    *(_QWORD *)(v5 + 264) |= 0x4000uLL;
    v20 = self->_flags;
  }
  if ((*(_WORD *)&v20 & 0x1000) != 0)
  {
    *(_DWORD *)(v5 + 252) = self->_walkingIndex;
    *(_QWORD *)(v5 + 264) |= 0x1000uLL;
  }
  v70 = 0u;
  v71 = 0u;
  v68 = 0u;
  v69 = 0u;
  v21 = self->_transferInfos;
  v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v68, v82, 16);
  if (v22)
  {
    v23 = *(_QWORD *)v69;
    do
    {
      for (k = 0; k != v22; ++k)
      {
        if (*(_QWORD *)v69 != v23)
          objc_enumerationMutation(v21);
        v25 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v68 + 1) + 8 * k), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addTransferInfo:", v25);

      }
      v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v68, v82, 16);
    }
    while (v22);
  }

  if ((*((_BYTE *)&self->_flags + 1) & 4) != 0)
  {
    *(_DWORD *)(v5 + 244) = self->_startingTime;
    *(_QWORD *)(v5 + 264) |= 0x400uLL;
  }
  v26 = -[GEOTransitArrivalInfo copyWithZone:](self->_arrivalInfo, "copyWithZone:", a3);
  v27 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v26;

  v28 = -[GEOLatLng copyWithZone:](self->_location, "copyWithZone:", a3);
  v29 = *(void **)(v5 + 128);
  *(_QWORD *)(v5 + 128) = v28;

  if ((*((_BYTE *)&self->_flags + 1) & 1) != 0)
  {
    *(_DWORD *)(v5 + 236) = self->_significanceForEndNode;
    *(_QWORD *)(v5 + 264) |= 0x100uLL;
  }
  v30 = -[GEOInstructionSet copyWithZone:](self->_instructions, "copyWithZone:", a3);
  v31 = *(void **)(v5 + 120);
  *(_QWORD *)(v5 + 120) = v30;

  v32 = self->_flags;
  if ((*(_WORD *)&v32 & 0x2000) != 0)
  {
    *(_DWORD *)(v5 + 256) = self->_zilchIndex;
    *(_QWORD *)(v5 + 264) |= 0x2000uLL;
    v32 = self->_flags;
  }
  if ((*(_BYTE *)&v32 & 8) != 0)
  {
    *(_DWORD *)(v5 + 216) = self->_distanceInMeters;
    *(_QWORD *)(v5 + 264) |= 8uLL;
  }
  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  v33 = self->_flags;
  if ((*(_BYTE *)&v33 & 0x80) != 0)
  {
    *(_DWORD *)(v5 + 232) = self->_routeDetailsSecondaryArtworkIndex;
    *(_QWORD *)(v5 + 264) |= 0x80uLL;
    v33 = self->_flags;
    if ((*(_BYTE *)&v33 & 1) == 0)
    {
LABEL_44:
      if ((*(_BYTE *)&v33 & 2) == 0)
        goto LABEL_45;
      goto LABEL_70;
    }
  }
  else if ((*(_BYTE *)&v33 & 1) == 0)
  {
    goto LABEL_44;
  }
  *(_DWORD *)(v5 + 204) = self->_accessPointZilchIndex;
  *(_QWORD *)(v5 + 264) |= 1uLL;
  v33 = self->_flags;
  if ((*(_BYTE *)&v33 & 2) == 0)
  {
LABEL_45:
    if ((*(_BYTE *)&v33 & 4) == 0)
      goto LABEL_46;
    goto LABEL_71;
  }
LABEL_70:
  *(_DWORD *)(v5 + 208) = self->_defaultVehicleInfoIndex;
  *(_QWORD *)(v5 + 264) |= 2uLL;
  v33 = self->_flags;
  if ((*(_BYTE *)&v33 & 4) == 0)
  {
LABEL_46:
    if ((*(_WORD *)&v33 & 0x800) == 0)
      goto LABEL_47;
LABEL_72:
    *(_DWORD *)(v5 + 248) = self->_steppingTransitIncidentMessageIndex;
    *(_QWORD *)(v5 + 264) |= 0x800uLL;
    if ((*(_QWORD *)&self->_flags & 0x20) == 0)
      goto LABEL_49;
    goto LABEL_48;
  }
LABEL_71:
  *(_DWORD *)(v5 + 212) = self->_departureFrequency;
  *(_QWORD *)(v5 + 264) |= 4uLL;
  v33 = self->_flags;
  if ((*(_WORD *)&v33 & 0x800) != 0)
    goto LABEL_72;
LABEL_47:
  if ((*(_BYTE *)&v33 & 0x20) != 0)
  {
LABEL_48:
    *(_DWORD *)(v5 + 224) = self->_listTransitIncidentMessageIndex;
    *(_QWORD *)(v5 + 264) |= 0x20uLL;
  }
LABEL_49:
  v34 = -[GEOAdvisoriesInfo copyWithZone:](self->_advisoriesInfo, "copyWithZone:", a3);
  v35 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v34;

  v36 = -[GEOTransitBaseFare copyWithZone:](self->_baseFare, "copyWithZone:", a3);
  v37 = *(void **)(v5 + 96);
  *(_QWORD *)(v5 + 96) = v36;

  v38 = -[GEOTransitSurcharge copyWithZone:](self->_surcharge, "copyWithZone:", a3);
  v39 = *(void **)(v5 + 152);
  *(_QWORD *)(v5 + 152) = v38;

  v40 = -[NSData copyWithZone:](self->_updateIdentifier, "copyWithZone:", a3);
  v41 = *(void **)(v5 + 168);
  *(_QWORD *)(v5 + 168) = v40;

  v42 = -[GEOTransitVehiclePositionInfo copyWithZone:](self->_vehiclePositionInfo, "copyWithZone:", a3);
  v43 = *(void **)(v5 + 184);
  *(_QWORD *)(v5 + 184) = v42;

  v44 = -[GEOTransitScheduleInfo copyWithZone:](self->_scheduleInfo, "copyWithZone:", a3);
  v45 = *(void **)(v5 + 144);
  *(_QWORD *)(v5 + 144) = v44;

  v46 = -[GEOTransitBoardingInfo copyWithZone:](self->_boardingInfo, "copyWithZone:", a3);
  v47 = *(void **)(v5 + 104);
  *(_QWORD *)(v5 + 104) = v46;

  v66 = 0u;
  v67 = 0u;
  v64 = 0u;
  v65 = 0u;
  v48 = self->_badges;
  v49 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v48, "countByEnumeratingWithState:objects:count:", &v64, v81, 16);
  if (v49)
  {
    v50 = *(_QWORD *)v65;
    do
    {
      for (m = 0; m != v49; ++m)
      {
        if (*(_QWORD *)v65 != v50)
          objc_enumerationMutation(v48);
        v52 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v64 + 1) + 8 * m), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addBadge:", v52);

      }
      v49 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v48, "countByEnumeratingWithState:objects:count:", &v64, v81, 16);
    }
    while (v49);
  }

  v62 = 0u;
  v63 = 0u;
  v60 = 0u;
  v61 = 0u;
  v53 = self->_regionAlerts;
  v54 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v53, "countByEnumeratingWithState:objects:count:", &v60, v80, 16);
  if (v54)
  {
    v55 = *(_QWORD *)v61;
    do
    {
      for (n = 0; n != v54; ++n)
      {
        if (*(_QWORD *)v61 != v55)
          objc_enumerationMutation(v53);
        v57 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v60 + 1) + 8 * n), "copyWithZone:", a3, (_QWORD)v60);
        objc_msgSend((id)v5, "addRegionAlert:", v57);

      }
      v54 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v53, "countByEnumeratingWithState:objects:count:", &v60, v80, 16);
    }
    while (v54);
  }

  v58 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v58;
LABEL_64:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  $5D35F1586042F4506E133FD2A7885CCE flags;
  uint64_t v6;
  NSMutableArray *vehicleInfos;
  NSMutableArray *enterExitInfos;
  $5D35F1586042F4506E133FD2A7885CCE v9;
  uint64_t v10;
  NSMutableArray *transferInfos;
  GEOTransitArrivalInfo *arrivalInfo;
  GEOLatLng *location;
  $5D35F1586042F4506E133FD2A7885CCE v14;
  uint64_t v15;
  GEOInstructionSet *instructions;
  $5D35F1586042F4506E133FD2A7885CCE v17;
  uint64_t v18;
  GEOAdvisoriesInfo *advisoriesInfo;
  GEOTransitBaseFare *baseFare;
  GEOTransitSurcharge *surcharge;
  NSData *updateIdentifier;
  GEOTransitVehiclePositionInfo *vehiclePositionInfo;
  GEOTransitScheduleInfo *scheduleInfo;
  GEOTransitBoardingInfo *boardingInfo;
  NSMutableArray *badges;
  NSMutableArray *regionAlerts;
  char v28;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_114;
  -[GEOTransitStep readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  flags = self->_flags;
  v6 = *((_QWORD *)v4 + 33);
  if ((*(_BYTE *)&flags & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_maneuverType != *((_DWORD *)v4 + 57))
      goto LABEL_114;
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_114;
  }
  if ((*(_WORD *)&flags & 0x200) != 0)
  {
    if ((v6 & 0x200) == 0 || self->_startingStopIndex != *((_DWORD *)v4 + 60))
      goto LABEL_114;
  }
  else if ((v6 & 0x200) != 0)
  {
    goto LABEL_114;
  }
  if ((*(_BYTE *)&flags & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_endingStopIndex != *((_DWORD *)v4 + 55))
      goto LABEL_114;
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_114;
  }
  vehicleInfos = self->_vehicleInfos;
  if ((unint64_t)vehicleInfos | *((_QWORD *)v4 + 22)
    && !-[NSMutableArray isEqual:](vehicleInfos, "isEqual:"))
  {
    goto LABEL_114;
  }
  enterExitInfos = self->_enterExitInfos;
  if ((unint64_t)enterExitInfos | *((_QWORD *)v4 + 14))
  {
    if (!-[NSMutableArray isEqual:](enterExitInfos, "isEqual:"))
      goto LABEL_114;
  }
  v9 = self->_flags;
  v10 = *((_QWORD *)v4 + 33);
  if ((*(_WORD *)&v9 & 0x4000) != 0)
  {
    if ((v10 & 0x4000) == 0)
      goto LABEL_114;
    if (self->_prioritizeTilesPreloading)
    {
      if (!*((_BYTE *)v4 + 260))
        goto LABEL_114;
    }
    else if (*((_BYTE *)v4 + 260))
    {
      goto LABEL_114;
    }
  }
  else if ((v10 & 0x4000) != 0)
  {
    goto LABEL_114;
  }
  if ((*(_WORD *)&v9 & 0x1000) != 0)
  {
    if ((v10 & 0x1000) == 0 || self->_walkingIndex != *((_DWORD *)v4 + 63))
      goto LABEL_114;
  }
  else if ((v10 & 0x1000) != 0)
  {
    goto LABEL_114;
  }
  transferInfos = self->_transferInfos;
  if ((unint64_t)transferInfos | *((_QWORD *)v4 + 20))
  {
    if (!-[NSMutableArray isEqual:](transferInfos, "isEqual:"))
      goto LABEL_114;
    v9 = self->_flags;
    v10 = *((_QWORD *)v4 + 33);
  }
  if ((*(_WORD *)&v9 & 0x400) != 0)
  {
    if ((v10 & 0x400) == 0 || self->_startingTime != *((_DWORD *)v4 + 61))
      goto LABEL_114;
  }
  else if ((v10 & 0x400) != 0)
  {
    goto LABEL_114;
  }
  arrivalInfo = self->_arrivalInfo;
  if ((unint64_t)arrivalInfo | *((_QWORD *)v4 + 10)
    && !-[GEOTransitArrivalInfo isEqual:](arrivalInfo, "isEqual:"))
  {
    goto LABEL_114;
  }
  location = self->_location;
  if ((unint64_t)location | *((_QWORD *)v4 + 16))
  {
    if (!-[GEOLatLng isEqual:](location, "isEqual:"))
      goto LABEL_114;
  }
  v14 = self->_flags;
  v15 = *((_QWORD *)v4 + 33);
  if ((*(_WORD *)&v14 & 0x100) != 0)
  {
    if ((v15 & 0x100) == 0 || self->_significanceForEndNode != *((_DWORD *)v4 + 59))
      goto LABEL_114;
  }
  else if ((v15 & 0x100) != 0)
  {
    goto LABEL_114;
  }
  instructions = self->_instructions;
  if ((unint64_t)instructions | *((_QWORD *)v4 + 15))
  {
    if (-[GEOInstructionSet isEqual:](instructions, "isEqual:"))
    {
      v14 = self->_flags;
      v15 = *((_QWORD *)v4 + 33);
      goto LABEL_54;
    }
LABEL_114:
    v28 = 0;
    goto LABEL_115;
  }
LABEL_54:
  if ((*(_WORD *)&v14 & 0x2000) != 0)
  {
    if ((v15 & 0x2000) == 0 || self->_zilchIndex != *((_DWORD *)v4 + 64))
      goto LABEL_114;
  }
  else if ((v15 & 0x2000) != 0)
  {
    goto LABEL_114;
  }
  if ((*(_BYTE *)&v14 & 8) != 0)
  {
    if ((v15 & 8) == 0 || self->_distanceInMeters != *((_DWORD *)v4 + 54))
      goto LABEL_114;
  }
  else if ((v15 & 8) != 0)
  {
    goto LABEL_114;
  }
  if (!PBRepeatedUInt32IsEqual() || !PBRepeatedUInt32IsEqual())
    goto LABEL_114;
  v17 = self->_flags;
  v18 = *((_QWORD *)v4 + 33);
  if ((*(_BYTE *)&v17 & 0x80) != 0)
  {
    if ((v18 & 0x80) == 0 || self->_routeDetailsSecondaryArtworkIndex != *((_DWORD *)v4 + 58))
      goto LABEL_114;
  }
  else if ((v18 & 0x80) != 0)
  {
    goto LABEL_114;
  }
  if ((*(_BYTE *)&v17 & 1) != 0)
  {
    if ((v18 & 1) == 0 || self->_accessPointZilchIndex != *((_DWORD *)v4 + 51))
      goto LABEL_114;
  }
  else if ((v18 & 1) != 0)
  {
    goto LABEL_114;
  }
  if ((*(_BYTE *)&v17 & 2) != 0)
  {
    if ((v18 & 2) == 0 || self->_defaultVehicleInfoIndex != *((_DWORD *)v4 + 52))
      goto LABEL_114;
  }
  else if ((v18 & 2) != 0)
  {
    goto LABEL_114;
  }
  if ((*(_BYTE *)&v17 & 4) != 0)
  {
    if ((v18 & 4) == 0 || self->_departureFrequency != *((_DWORD *)v4 + 53))
      goto LABEL_114;
  }
  else if ((v18 & 4) != 0)
  {
    goto LABEL_114;
  }
  if ((*(_WORD *)&v17 & 0x800) != 0)
  {
    if ((v18 & 0x800) == 0 || self->_steppingTransitIncidentMessageIndex != *((_DWORD *)v4 + 62))
      goto LABEL_114;
  }
  else if ((v18 & 0x800) != 0)
  {
    goto LABEL_114;
  }
  if ((*(_BYTE *)&v17 & 0x20) != 0)
  {
    if ((v18 & 0x20) == 0 || self->_listTransitIncidentMessageIndex != *((_DWORD *)v4 + 56))
      goto LABEL_114;
  }
  else if ((v18 & 0x20) != 0)
  {
    goto LABEL_114;
  }
  advisoriesInfo = self->_advisoriesInfo;
  if ((unint64_t)advisoriesInfo | *((_QWORD *)v4 + 9)
    && !-[GEOAdvisoriesInfo isEqual:](advisoriesInfo, "isEqual:"))
  {
    goto LABEL_114;
  }
  baseFare = self->_baseFare;
  if ((unint64_t)baseFare | *((_QWORD *)v4 + 12))
  {
    if (!-[GEOTransitBaseFare isEqual:](baseFare, "isEqual:"))
      goto LABEL_114;
  }
  surcharge = self->_surcharge;
  if ((unint64_t)surcharge | *((_QWORD *)v4 + 19))
  {
    if (!-[GEOTransitSurcharge isEqual:](surcharge, "isEqual:"))
      goto LABEL_114;
  }
  updateIdentifier = self->_updateIdentifier;
  if ((unint64_t)updateIdentifier | *((_QWORD *)v4 + 21))
  {
    if (!-[NSData isEqual:](updateIdentifier, "isEqual:"))
      goto LABEL_114;
  }
  vehiclePositionInfo = self->_vehiclePositionInfo;
  if ((unint64_t)vehiclePositionInfo | *((_QWORD *)v4 + 23))
  {
    if (!-[GEOTransitVehiclePositionInfo isEqual:](vehiclePositionInfo, "isEqual:"))
      goto LABEL_114;
  }
  scheduleInfo = self->_scheduleInfo;
  if ((unint64_t)scheduleInfo | *((_QWORD *)v4 + 18))
  {
    if (!-[GEOTransitScheduleInfo isEqual:](scheduleInfo, "isEqual:"))
      goto LABEL_114;
  }
  boardingInfo = self->_boardingInfo;
  if ((unint64_t)boardingInfo | *((_QWORD *)v4 + 13))
  {
    if (!-[GEOTransitBoardingInfo isEqual:](boardingInfo, "isEqual:"))
      goto LABEL_114;
  }
  badges = self->_badges;
  if ((unint64_t)badges | *((_QWORD *)v4 + 11))
  {
    if (!-[NSMutableArray isEqual:](badges, "isEqual:"))
      goto LABEL_114;
  }
  regionAlerts = self->_regionAlerts;
  if ((unint64_t)regionAlerts | *((_QWORD *)v4 + 17))
    v28 = -[NSMutableArray isEqual:](regionAlerts, "isEqual:");
  else
    v28 = 1;
LABEL_115:

  return v28;
}

- (unint64_t)hash
{
  $5D35F1586042F4506E133FD2A7885CCE flags;
  $5D35F1586042F4506E133FD2A7885CCE v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  $5D35F1586042F4506E133FD2A7885CCE v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  $5D35F1586042F4506E133FD2A7885CCE v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
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

  -[GEOTransitStep readAll:](self, "readAll:", 1);
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 0x40) == 0)
  {
    v39 = 0;
    if ((*(_WORD *)&flags & 0x200) != 0)
      goto LABEL_3;
LABEL_6:
    v38 = 0;
    if ((*(_BYTE *)&flags & 0x10) != 0)
      goto LABEL_4;
    goto LABEL_7;
  }
  v39 = 2654435761 * self->_maneuverType;
  if ((*(_WORD *)&flags & 0x200) == 0)
    goto LABEL_6;
LABEL_3:
  v38 = 2654435761 * self->_startingStopIndex;
  if ((*(_BYTE *)&flags & 0x10) != 0)
  {
LABEL_4:
    v37 = 2654435761 * self->_endingStopIndex;
    goto LABEL_8;
  }
LABEL_7:
  v37 = 0;
LABEL_8:
  v36 = -[NSMutableArray hash](self->_vehicleInfos, "hash");
  v35 = -[NSMutableArray hash](self->_enterExitInfos, "hash");
  v4 = self->_flags;
  if ((*(_WORD *)&v4 & 0x4000) != 0)
  {
    v34 = 2654435761 * self->_prioritizeTilesPreloading;
    if ((*(_WORD *)&v4 & 0x1000) != 0)
      goto LABEL_10;
  }
  else
  {
    v34 = 0;
    if ((*(_WORD *)&v4 & 0x1000) != 0)
    {
LABEL_10:
      v33 = 2654435761 * self->_walkingIndex;
      goto LABEL_13;
    }
  }
  v33 = 0;
LABEL_13:
  v32 = -[NSMutableArray hash](self->_transferInfos, "hash");
  if ((*((_BYTE *)&self->_flags + 1) & 4) != 0)
    v31 = 2654435761 * self->_startingTime;
  else
    v31 = 0;
  v30 = -[GEOTransitArrivalInfo hash](self->_arrivalInfo, "hash");
  v5 = -[GEOLatLng hash](self->_location, "hash");
  if ((*((_BYTE *)&self->_flags + 1) & 1) != 0)
    v6 = 2654435761 * self->_significanceForEndNode;
  else
    v6 = 0;
  v7 = -[GEOInstructionSet hash](self->_instructions, "hash");
  v8 = self->_flags;
  if ((*(_WORD *)&v8 & 0x2000) != 0)
  {
    v9 = 2654435761 * self->_zilchIndex;
    if ((*(_BYTE *)&v8 & 8) != 0)
      goto LABEL_21;
  }
  else
  {
    v9 = 0;
    if ((*(_BYTE *)&v8 & 8) != 0)
    {
LABEL_21:
      v10 = 2654435761 * self->_distanceInMeters;
      goto LABEL_24;
    }
  }
  v10 = 0;
LABEL_24:
  v11 = PBRepeatedUInt32Hash();
  v12 = PBRepeatedUInt32Hash();
  v13 = self->_flags;
  if ((*(_BYTE *)&v13 & 0x80) != 0)
  {
    v14 = 2654435761 * self->_routeDetailsSecondaryArtworkIndex;
    if ((*(_BYTE *)&v13 & 1) != 0)
    {
LABEL_26:
      v15 = 2654435761 * self->_accessPointZilchIndex;
      if ((*(_BYTE *)&v13 & 2) != 0)
        goto LABEL_27;
      goto LABEL_33;
    }
  }
  else
  {
    v14 = 0;
    if ((*(_BYTE *)&v13 & 1) != 0)
      goto LABEL_26;
  }
  v15 = 0;
  if ((*(_BYTE *)&v13 & 2) != 0)
  {
LABEL_27:
    v16 = 2654435761 * self->_defaultVehicleInfoIndex;
    if ((*(_BYTE *)&v13 & 4) != 0)
      goto LABEL_28;
    goto LABEL_34;
  }
LABEL_33:
  v16 = 0;
  if ((*(_BYTE *)&v13 & 4) != 0)
  {
LABEL_28:
    v17 = 2654435761 * self->_departureFrequency;
    if ((*(_WORD *)&v13 & 0x800) != 0)
      goto LABEL_29;
LABEL_35:
    v18 = 0;
    if ((*(_BYTE *)&v13 & 0x20) != 0)
      goto LABEL_30;
LABEL_36:
    v19 = 0;
    goto LABEL_37;
  }
LABEL_34:
  v17 = 0;
  if ((*(_WORD *)&v13 & 0x800) == 0)
    goto LABEL_35;
LABEL_29:
  v18 = 2654435761 * self->_steppingTransitIncidentMessageIndex;
  if ((*(_BYTE *)&v13 & 0x20) == 0)
    goto LABEL_36;
LABEL_30:
  v19 = 2654435761 * self->_listTransitIncidentMessageIndex;
LABEL_37:
  v20 = v38 ^ v39 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v5 ^ v6 ^ v7 ^ v9 ^ v10 ^ v11 ^ v12 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19;
  v21 = -[GEOAdvisoriesInfo hash](self->_advisoriesInfo, "hash");
  v22 = v21 ^ -[GEOTransitBaseFare hash](self->_baseFare, "hash");
  v23 = v22 ^ -[GEOTransitSurcharge hash](self->_surcharge, "hash");
  v24 = v23 ^ -[NSData hash](self->_updateIdentifier, "hash");
  v25 = v24 ^ -[GEOTransitVehiclePositionInfo hash](self->_vehiclePositionInfo, "hash");
  v26 = v20 ^ v25 ^ -[GEOTransitScheduleInfo hash](self->_scheduleInfo, "hash");
  v27 = -[GEOTransitBoardingInfo hash](self->_boardingInfo, "hash");
  v28 = v27 ^ -[NSMutableArray hash](self->_badges, "hash");
  return v26 ^ v28 ^ -[NSMutableArray hash](self->_regionAlerts, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t k;
  GEOTransitArrivalInfo *arrivalInfo;
  uint64_t v23;
  GEOLatLng *location;
  uint64_t v25;
  GEOInstructionSet *instructions;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t m;
  uint64_t v32;
  uint64_t v33;
  uint64_t n;
  uint64_t v35;
  GEOAdvisoriesInfo *advisoriesInfo;
  uint64_t v37;
  GEOTransitBaseFare *baseFare;
  uint64_t v39;
  GEOTransitSurcharge *surcharge;
  uint64_t v41;
  GEOTransitVehiclePositionInfo *vehiclePositionInfo;
  uint64_t v43;
  GEOTransitScheduleInfo *scheduleInfo;
  uint64_t v45;
  GEOTransitBoardingInfo *boardingInfo;
  uint64_t v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t ii;
  id v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t jj;
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
  _BYTE v78[128];
  _BYTE v79[128];
  _BYTE v80[128];
  _BYTE v81[128];
  _BYTE v82[128];
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  v5 = *((_QWORD *)v4 + 33);
  if ((v5 & 0x40) != 0)
  {
    self->_maneuverType = *((_DWORD *)v4 + 57);
    *(_QWORD *)&self->_flags |= 0x40uLL;
    v5 = *((_QWORD *)v4 + 33);
    if ((v5 & 0x200) == 0)
    {
LABEL_3:
      if ((v5 & 0x10) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((v5 & 0x200) == 0)
  {
    goto LABEL_3;
  }
  self->_startingStopIndex = *((_DWORD *)v4 + 60);
  *(_QWORD *)&self->_flags |= 0x200uLL;
  if ((*((_QWORD *)v4 + 33) & 0x10) != 0)
  {
LABEL_4:
    self->_endingStopIndex = *((_DWORD *)v4 + 55);
    *(_QWORD *)&self->_flags |= 0x10uLL;
  }
LABEL_5:
  v76 = 0u;
  v77 = 0u;
  v74 = 0u;
  v75 = 0u;
  v6 = *((id *)v4 + 22);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v74, v82, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v75;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v75 != v9)
          objc_enumerationMutation(v6);
        -[GEOTransitStep addVehicleInfo:](self, "addVehicleInfo:", *(_QWORD *)(*((_QWORD *)&v74 + 1) + 8 * i));
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v74, v82, 16);
    }
    while (v8);
  }

  v72 = 0u;
  v73 = 0u;
  v70 = 0u;
  v71 = 0u;
  v11 = *((id *)v4 + 14);
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v70, v81, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v71;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v71 != v14)
          objc_enumerationMutation(v11);
        -[GEOTransitStep addEnterExitInfo:](self, "addEnterExitInfo:", *(_QWORD *)(*((_QWORD *)&v70 + 1) + 8 * j));
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v70, v81, 16);
    }
    while (v13);
  }

  v16 = *((_QWORD *)v4 + 33);
  if ((v16 & 0x4000) != 0)
  {
    self->_prioritizeTilesPreloading = *((_BYTE *)v4 + 260);
    *(_QWORD *)&self->_flags |= 0x4000uLL;
    v16 = *((_QWORD *)v4 + 33);
  }
  if ((v16 & 0x1000) != 0)
  {
    self->_walkingIndex = *((_DWORD *)v4 + 63);
    *(_QWORD *)&self->_flags |= 0x1000uLL;
  }
  v68 = 0u;
  v69 = 0u;
  v66 = 0u;
  v67 = 0u;
  v17 = *((id *)v4 + 20);
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v66, v80, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v67;
    do
    {
      for (k = 0; k != v19; ++k)
      {
        if (*(_QWORD *)v67 != v20)
          objc_enumerationMutation(v17);
        -[GEOTransitStep addTransferInfo:](self, "addTransferInfo:", *(_QWORD *)(*((_QWORD *)&v66 + 1) + 8 * k));
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v66, v80, 16);
    }
    while (v19);
  }

  if ((*((_BYTE *)v4 + 265) & 4) != 0)
  {
    self->_startingTime = *((_DWORD *)v4 + 61);
    *(_QWORD *)&self->_flags |= 0x400uLL;
  }
  arrivalInfo = self->_arrivalInfo;
  v23 = *((_QWORD *)v4 + 10);
  if (arrivalInfo)
  {
    if (v23)
      -[GEOTransitArrivalInfo mergeFrom:](arrivalInfo, "mergeFrom:");
  }
  else if (v23)
  {
    -[GEOTransitStep setArrivalInfo:](self, "setArrivalInfo:");
  }
  location = self->_location;
  v25 = *((_QWORD *)v4 + 16);
  if (location)
  {
    if (v25)
      -[GEOLatLng mergeFrom:](location, "mergeFrom:");
  }
  else if (v25)
  {
    -[GEOTransitStep setLocation:](self, "setLocation:");
  }
  if ((*((_BYTE *)v4 + 265) & 1) != 0)
  {
    self->_significanceForEndNode = *((_DWORD *)v4 + 59);
    *(_QWORD *)&self->_flags |= 0x100uLL;
  }
  instructions = self->_instructions;
  v27 = *((_QWORD *)v4 + 15);
  if (instructions)
  {
    if (v27)
      -[GEOInstructionSet mergeFrom:](instructions, "mergeFrom:");
  }
  else if (v27)
  {
    -[GEOTransitStep setInstructions:](self, "setInstructions:");
  }
  v28 = *((_QWORD *)v4 + 33);
  if ((v28 & 0x2000) != 0)
  {
    self->_zilchIndex = *((_DWORD *)v4 + 64);
    *(_QWORD *)&self->_flags |= 0x2000uLL;
    v28 = *((_QWORD *)v4 + 33);
  }
  if ((v28 & 8) != 0)
  {
    self->_distanceInMeters = *((_DWORD *)v4 + 54);
    *(_QWORD *)&self->_flags |= 8uLL;
  }
  v29 = objc_msgSend(v4, "routeDetailsPrimaryArtworkIndexsCount");
  if (v29)
  {
    v30 = v29;
    for (m = 0; m != v30; ++m)
      -[GEOTransitStep addRouteDetailsPrimaryArtworkIndex:](self, "addRouteDetailsPrimaryArtworkIndex:", objc_msgSend(v4, "routeDetailsPrimaryArtworkIndexAtIndex:", m));
  }
  v32 = objc_msgSend(v4, "steppingArtworkIndexsCount");
  if (v32)
  {
    v33 = v32;
    for (n = 0; n != v33; ++n)
      -[GEOTransitStep addSteppingArtworkIndex:](self, "addSteppingArtworkIndex:", objc_msgSend(v4, "steppingArtworkIndexAtIndex:", n));
  }
  v35 = *((_QWORD *)v4 + 33);
  if ((v35 & 0x80) != 0)
  {
    self->_routeDetailsSecondaryArtworkIndex = *((_DWORD *)v4 + 58);
    *(_QWORD *)&self->_flags |= 0x80uLL;
    v35 = *((_QWORD *)v4 + 33);
    if ((v35 & 1) == 0)
    {
LABEL_64:
      if ((v35 & 2) == 0)
        goto LABEL_65;
      goto LABEL_74;
    }
  }
  else if ((v35 & 1) == 0)
  {
    goto LABEL_64;
  }
  self->_accessPointZilchIndex = *((_DWORD *)v4 + 51);
  *(_QWORD *)&self->_flags |= 1uLL;
  v35 = *((_QWORD *)v4 + 33);
  if ((v35 & 2) == 0)
  {
LABEL_65:
    if ((v35 & 4) == 0)
      goto LABEL_66;
    goto LABEL_75;
  }
LABEL_74:
  self->_defaultVehicleInfoIndex = *((_DWORD *)v4 + 52);
  *(_QWORD *)&self->_flags |= 2uLL;
  v35 = *((_QWORD *)v4 + 33);
  if ((v35 & 4) == 0)
  {
LABEL_66:
    if ((v35 & 0x800) == 0)
      goto LABEL_67;
    goto LABEL_76;
  }
LABEL_75:
  self->_departureFrequency = *((_DWORD *)v4 + 53);
  *(_QWORD *)&self->_flags |= 4uLL;
  v35 = *((_QWORD *)v4 + 33);
  if ((v35 & 0x800) == 0)
  {
LABEL_67:
    if ((v35 & 0x20) == 0)
      goto LABEL_69;
    goto LABEL_68;
  }
LABEL_76:
  self->_steppingTransitIncidentMessageIndex = *((_DWORD *)v4 + 62);
  *(_QWORD *)&self->_flags |= 0x800uLL;
  if ((*((_QWORD *)v4 + 33) & 0x20) != 0)
  {
LABEL_68:
    self->_listTransitIncidentMessageIndex = *((_DWORD *)v4 + 56);
    *(_QWORD *)&self->_flags |= 0x20uLL;
  }
LABEL_69:
  advisoriesInfo = self->_advisoriesInfo;
  v37 = *((_QWORD *)v4 + 9);
  if (advisoriesInfo)
  {
    if (v37)
      -[GEOAdvisoriesInfo mergeFrom:](advisoriesInfo, "mergeFrom:");
  }
  else if (v37)
  {
    -[GEOTransitStep setAdvisoriesInfo:](self, "setAdvisoriesInfo:");
  }
  baseFare = self->_baseFare;
  v39 = *((_QWORD *)v4 + 12);
  if (baseFare)
  {
    if (v39)
      -[GEOTransitBaseFare mergeFrom:](baseFare, "mergeFrom:");
  }
  else if (v39)
  {
    -[GEOTransitStep setBaseFare:](self, "setBaseFare:");
  }
  surcharge = self->_surcharge;
  v41 = *((_QWORD *)v4 + 19);
  if (surcharge)
  {
    if (v41)
      -[GEOTransitSurcharge mergeFrom:](surcharge, "mergeFrom:");
  }
  else if (v41)
  {
    -[GEOTransitStep setSurcharge:](self, "setSurcharge:");
  }
  if (*((_QWORD *)v4 + 21))
    -[GEOTransitStep setUpdateIdentifier:](self, "setUpdateIdentifier:");
  vehiclePositionInfo = self->_vehiclePositionInfo;
  v43 = *((_QWORD *)v4 + 23);
  if (vehiclePositionInfo)
  {
    if (v43)
      -[GEOTransitVehiclePositionInfo mergeFrom:](vehiclePositionInfo, "mergeFrom:");
  }
  else if (v43)
  {
    -[GEOTransitStep setVehiclePositionInfo:](self, "setVehiclePositionInfo:");
  }
  scheduleInfo = self->_scheduleInfo;
  v45 = *((_QWORD *)v4 + 18);
  if (scheduleInfo)
  {
    if (v45)
      -[GEOTransitScheduleInfo mergeFrom:](scheduleInfo, "mergeFrom:");
  }
  else if (v45)
  {
    -[GEOTransitStep setScheduleInfo:](self, "setScheduleInfo:");
  }
  boardingInfo = self->_boardingInfo;
  v47 = *((_QWORD *)v4 + 13);
  if (boardingInfo)
  {
    if (v47)
      -[GEOTransitBoardingInfo mergeFrom:](boardingInfo, "mergeFrom:");
  }
  else if (v47)
  {
    -[GEOTransitStep setBoardingInfo:](self, "setBoardingInfo:");
  }
  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  v48 = *((id *)v4 + 11);
  v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v62, v79, 16);
  if (v49)
  {
    v50 = v49;
    v51 = *(_QWORD *)v63;
    do
    {
      for (ii = 0; ii != v50; ++ii)
      {
        if (*(_QWORD *)v63 != v51)
          objc_enumerationMutation(v48);
        -[GEOTransitStep addBadge:](self, "addBadge:", *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * ii));
      }
      v50 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v62, v79, 16);
    }
    while (v50);
  }

  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  v53 = *((id *)v4 + 17);
  v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v58, v78, 16);
  if (v54)
  {
    v55 = v54;
    v56 = *(_QWORD *)v59;
    do
    {
      for (jj = 0; jj != v55; ++jj)
      {
        if (*(_QWORD *)v59 != v56)
          objc_enumerationMutation(v53);
        -[GEOTransitStep addRegionAlert:](self, "addRegionAlert:", *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * jj), (_QWORD)v58);
      }
      v55 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v58, v78, 16);
    }
    while (v55);
  }

}

- (PBUnknownFields)unknownFields
{
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v5;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*((_BYTE *)&self->_flags + 1) & 0x80) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      v5 = reader;
      objc_sync_enter(v5);
      GEOTransitStepReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_1355);
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
  _BYTE v52[128];
  _BYTE v53[128];
  _BYTE v54[128];
  _BYTE v55[128];
  _BYTE v56[128];
  uint64_t v57;

  v3 = a3;
  v57 = *MEMORY[0x1E0C80C00];
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x200008000uLL;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEOTransitStep readAll:](self, "readAll:", 0);
    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    v7 = self->_vehicleInfos;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v49;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v49 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v48 + 1) + 8 * v11++), "clearUnknownFields:", 1);
        }
        while (v9 != v11);
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
      }
      while (v9);
    }

    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v12 = self->_enterExitInfos;
    v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v44, v55, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v45;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v45 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * v16++), "clearUnknownFields:", 1);
        }
        while (v14 != v16);
        v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v44, v55, 16);
      }
      while (v14);
    }

    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v17 = self->_transferInfos;
    v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v40, v54, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v41;
      do
      {
        v21 = 0;
        do
        {
          if (*(_QWORD *)v41 != v20)
            objc_enumerationMutation(v17);
          objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * v21++), "clearUnknownFields:", 1);
        }
        while (v19 != v21);
        v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v40, v54, 16);
      }
      while (v19);
    }

    -[GEOTransitArrivalInfo clearUnknownFields:](self->_arrivalInfo, "clearUnknownFields:", 1);
    -[GEOLatLng clearUnknownFields:](self->_location, "clearUnknownFields:", 1);
    -[GEOInstructionSet clearUnknownFields:](self->_instructions, "clearUnknownFields:", 1);
    -[GEOAdvisoriesInfo clearUnknownFields:](self->_advisoriesInfo, "clearUnknownFields:", 1);
    -[GEOTransitBaseFare clearUnknownFields:](self->_baseFare, "clearUnknownFields:", 1);
    -[GEOTransitSurcharge clearUnknownFields:](self->_surcharge, "clearUnknownFields:", 1);
    -[GEOTransitVehiclePositionInfo clearUnknownFields:](self->_vehiclePositionInfo, "clearUnknownFields:", 1);
    -[GEOTransitScheduleInfo clearUnknownFields:](self->_scheduleInfo, "clearUnknownFields:", 1);
    -[GEOTransitBoardingInfo clearUnknownFields:](self->_boardingInfo, "clearUnknownFields:", 1);
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v22 = self->_badges;
    v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v36, v53, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v37;
      do
      {
        v26 = 0;
        do
        {
          if (*(_QWORD *)v37 != v25)
            objc_enumerationMutation(v22);
          objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * v26++), "clearUnknownFields:", 1);
        }
        while (v24 != v26);
        v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v36, v53, 16);
      }
      while (v24);
    }

    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v27 = self->_regionAlerts;
    v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v32, v52, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v33;
      do
      {
        v31 = 0;
        do
        {
          if (*(_QWORD *)v33 != v30)
            objc_enumerationMutation(v27);
          objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * v31++), "clearUnknownFields:", 1, (_QWORD)v32);
        }
        while (v29 != v31);
        v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v32, v52, 16);
      }
      while (v29);
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vehiclePositionInfo, 0);
  objc_storeStrong((id *)&self->_vehicleInfos, 0);
  objc_storeStrong((id *)&self->_updateIdentifier, 0);
  objc_storeStrong((id *)&self->_transferInfos, 0);
  objc_storeStrong((id *)&self->_surcharge, 0);
  objc_storeStrong((id *)&self->_scheduleInfo, 0);
  objc_storeStrong((id *)&self->_regionAlerts, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_instructions, 0);
  objc_storeStrong((id *)&self->_enterExitInfos, 0);
  objc_storeStrong((id *)&self->_boardingInfo, 0);
  objc_storeStrong((id *)&self->_baseFare, 0);
  objc_storeStrong((id *)&self->_badges, 0);
  objc_storeStrong((id *)&self->_arrivalInfo, 0);
  objc_storeStrong((id *)&self->_advisoriesInfo, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

- (void)updateTransitStep:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  char v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  char v20;
  id v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  id v29;
  char v30;
  id v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  id v38;
  id v39;
  char v40;
  id v41;
  void *v42;
  uint64_t v43;
  id v44;

  v44 = a3;
  -[GEOTransitStep instructions](self, "instructions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "instructions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  v7 = v5;
  if (!v7)
  {
    v11 = v6;
    goto LABEL_19;
  }
  if (qword_1ECDBBD40 != -1)
    dispatch_once(&qword_1ECDBBD40, &__block_literal_global_63);
  v8 = (id)_MergedGlobals_219;
  v9 = v7;
  if (qword_1ECDBBD40 != -1)
    dispatch_once(&qword_1ECDBBD40, &__block_literal_global_63);
  if (objc_msgSend(v9, "conformsToProtocol:", _MergedGlobals_219))
  {
    v10 = objc_msgSend(v9, "_transit_hasAnyFieldSet");

    if ((v10 & 1) != 0)
    {
LABEL_14:
      if (objc_msgSend(v9, "conformsToProtocol:", v8)
        && objc_msgSend(v6, "conformsToProtocol:", v8))
      {
        objc_msgSend(v6, "_transit_mergeFrom:", v9);
        v9 = v6;
      }
      v11 = v9;
      goto LABEL_18;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      goto LABEL_14;
    }
    objc_msgSend(v9, "dictionaryRepresentation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");

    if (v13)
      goto LABEL_14;
  }
  v11 = 0;
LABEL_18:

LABEL_19:
  -[GEOTransitStep setInstructions:](self, "setInstructions:", v11);

  -[GEOTransitStep vehiclePositionInfo](self, "vehiclePositionInfo");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "vehiclePositionInfo");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v14;
  v17 = v15;
  if (!v17)
  {
    v21 = v16;
    goto LABEL_37;
  }
  if (qword_1ECDBBD40 != -1)
    dispatch_once(&qword_1ECDBBD40, &__block_literal_global_63);
  v18 = (id)_MergedGlobals_219;
  v19 = v17;
  if (qword_1ECDBBD40 != -1)
    dispatch_once(&qword_1ECDBBD40, &__block_literal_global_63);
  if (objc_msgSend(v19, "conformsToProtocol:", _MergedGlobals_219))
  {
    v20 = objc_msgSend(v19, "_transit_hasAnyFieldSet");

    if ((v20 & 1) != 0)
    {
LABEL_32:
      if (objc_msgSend(v19, "conformsToProtocol:", v18)
        && objc_msgSend(v16, "conformsToProtocol:", v18))
      {
        objc_msgSend(v16, "_transit_mergeFrom:", v19);
        v19 = v16;
      }
      v21 = v19;
      goto LABEL_36;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      goto LABEL_32;
    }
    objc_msgSend(v19, "dictionaryRepresentation");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "count");

    if (v23)
      goto LABEL_32;
  }
  v21 = 0;
LABEL_36:

LABEL_37:
  -[GEOTransitStep setVehiclePositionInfo:](self, "setVehiclePositionInfo:", v21);

  -[GEOTransitStep scheduleInfo](self, "scheduleInfo");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "scheduleInfo");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v24;
  v27 = v25;
  if (!v27)
  {
    v31 = v26;
    goto LABEL_55;
  }
  if (qword_1ECDBBD40 != -1)
    dispatch_once(&qword_1ECDBBD40, &__block_literal_global_63);
  v28 = (id)_MergedGlobals_219;
  v29 = v27;
  if (qword_1ECDBBD40 != -1)
    dispatch_once(&qword_1ECDBBD40, &__block_literal_global_63);
  if (objc_msgSend(v29, "conformsToProtocol:", _MergedGlobals_219))
  {
    v30 = objc_msgSend(v29, "_transit_hasAnyFieldSet");

    if ((v30 & 1) != 0)
    {
LABEL_50:
      if (objc_msgSend(v29, "conformsToProtocol:", v28)
        && objc_msgSend(v26, "conformsToProtocol:", v28))
      {
        objc_msgSend(v26, "_transit_mergeFrom:", v29);
        v29 = v26;
      }
      v31 = v29;
      goto LABEL_54;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      goto LABEL_50;
    }
    objc_msgSend(v29, "dictionaryRepresentation");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "count");

    if (v33)
      goto LABEL_50;
  }
  v31 = 0;
LABEL_54:

LABEL_55:
  -[GEOTransitStep setScheduleInfo:](self, "setScheduleInfo:", v31);

  -[GEOTransitStep boardingInfo](self, "boardingInfo");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "boardingInfo");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v34;
  v37 = v35;
  if (v37)
  {
    if (qword_1ECDBBD40 != -1)
      dispatch_once(&qword_1ECDBBD40, &__block_literal_global_63);
    v38 = (id)_MergedGlobals_219;
    v39 = v37;
    if (qword_1ECDBBD40 != -1)
      dispatch_once(&qword_1ECDBBD40, &__block_literal_global_63);
    if (objc_msgSend(v39, "conformsToProtocol:", _MergedGlobals_219))
    {
      v40 = objc_msgSend(v39, "_transit_hasAnyFieldSet");

      if ((v40 & 1) != 0)
      {
LABEL_68:
        if (objc_msgSend(v39, "conformsToProtocol:", v38)
          && objc_msgSend(v36, "conformsToProtocol:", v38))
        {
          objc_msgSend(v36, "_transit_mergeFrom:", v39);
          v39 = v36;
        }
        v41 = v39;
        goto LABEL_72;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {

        goto LABEL_68;
      }
      objc_msgSend(v39, "dictionaryRepresentation");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = objc_msgSend(v42, "count");

      if (v43)
        goto LABEL_68;
    }
    v41 = 0;
LABEL_72:

    goto LABEL_73;
  }
  v41 = v36;
LABEL_73:

  -[GEOTransitStep setBoardingInfo:](self, "setBoardingInfo:", v41);
}

- (id)instanceCompatibleWithProtocolVersion:(unint64_t)a3
{
  unint64_t v5;
  NSObject *v6;
  _BOOL4 v7;
  objc_class *v8;
  void *v9;
  objc_class *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  GEOTransitStep *v19;
  __int16 v20;
  unint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3 - 3;
  GEOFindOrCreateLog("com.apple.GeoServices", "CompanionCompatibility");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
  if (v5 > 0xFFFFFFFFFFFFFFFDLL)
  {
    if (v7)
    {
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v17 = v12;
      v18 = 2048;
      v19 = self;
      v20 = 2048;
      v21 = a3;
      _os_log_impl(&dword_1885A9000, v6, OS_LOG_TYPE_DEBUG, "%@<%p> is not compatible with protocol version %lu", buf, 0x20u);

    }
    v13 = (void *)-[GEOTransitStep copy](self, "copy");
    v15 = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v15, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    migrateTransitSteps(v14, a3);

    return v13;
  }
  else
  {
    if (v7)
    {
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v17 = v9;
      v18 = 2048;
      v19 = self;
      v20 = 2048;
      v21 = a3;
      _os_log_impl(&dword_1885A9000, v6, OS_LOG_TYPE_DEBUG, "%@<%p> is compatible with protocol version %lu", buf, 0x20u);

    }
    return self;
  }
}

- (int64_t)segmentTypeForManeuver
{
  int v2;

  v2 = -[GEOTransitStep maneuverType](self, "maneuverType") - 2;
  if (v2 > 8)
    return 0;
  else
    return qword_189CDF560[v2];
}

@end
