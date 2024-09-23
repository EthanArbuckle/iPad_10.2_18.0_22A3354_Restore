@implementation GEOCompanionStep

- (GEOCompanionStep)init
{
  GEOCompanionStep *v2;
  GEOCompanionStep *v3;
  GEOCompanionStep *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOCompanionStep;
  v2 = -[GEOCompanionStep init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOCompanionStep)initWithData:(id)a3
{
  GEOCompanionStep *v3;
  GEOCompanionStep *v4;
  GEOCompanionStep *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOCompanionStep;
  v3 = -[GEOCompanionStep initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (unsigned)stepID
{
  return self->_stepID;
}

- (void)setStepID:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x100040u;
  self->_stepID = a3;
}

- (void)setHasStepID:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1048640;
  else
    v3 = 0x100000;
  self->_flags = ($F2F3A8C3CD2C9F51802C978D5302AD1B)(*(_DWORD *)&self->_flags & 0xFFFFFFBF | v3);
}

- (BOOL)hasStepID
{
  return (*(_BYTE *)&self->_flags >> 6) & 1;
}

- (unsigned)distance
{
  return self->_distance;
}

- (void)setDistance:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x100002u;
  self->_distance = a3;
}

- (void)setHasDistance:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1048578;
  else
    v3 = 0x100000;
  self->_flags = ($F2F3A8C3CD2C9F51802C978D5302AD1B)(*(_DWORD *)&self->_flags & 0xFFFFFFFD | v3);
}

- (BOOL)hasDistance
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (unsigned)time
{
  return self->_time;
}

- (void)setTime:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x100080u;
  self->_time = a3;
}

- (void)setHasTime:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1048704;
  else
    v3 = 0x100000;
  self->_flags = ($F2F3A8C3CD2C9F51802C978D5302AD1B)(*(_DWORD *)&self->_flags & 0xFFFFFF7F | v3);
}

- (BOOL)hasTime
{
  return *(_BYTE *)&self->_flags >> 7;
}

- (void)_readRoadName
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_BYTE *)(a1 + 158) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOCompanionStepReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRoadName_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (BOOL)hasRoadName
{
  -[GEOCompanionStep _readRoadName]((uint64_t)self);
  return self->_roadName != 0;
}

- (NSString)roadName
{
  -[GEOCompanionStep _readRoadName]((uint64_t)self);
  return self->_roadName;
}

- (void)setRoadName:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x110000u;
  objc_storeStrong((id *)&self->_roadName, a3);
}

- (void)_readDriveStep
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_BYTE *)(a1 + 157) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOCompanionStepReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDriveStep_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (BOOL)hasDriveStep
{
  -[GEOCompanionStep _readDriveStep]((uint64_t)self);
  return self->_driveStep != 0;
}

- (GEOCompanionDriveStep)driveStep
{
  -[GEOCompanionStep _readDriveStep]((uint64_t)self);
  return self->_driveStep;
}

- (void)setDriveStep:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x100200u;
  objc_storeStrong((id *)&self->_driveStep, a3);
}

- (void)_readWalkStep
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_BYTE *)(a1 + 158) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOCompanionStepReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readWalkStep_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (BOOL)hasWalkStep
{
  -[GEOCompanionStep _readWalkStep]((uint64_t)self);
  return self->_walkStep != 0;
}

- (GEOCompanionWalkStep)walkStep
{
  -[GEOCompanionStep _readWalkStep]((uint64_t)self);
  return self->_walkStep;
}

- (void)setWalkStep:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x180000u;
  objc_storeStrong((id *)&self->_walkStep, a3);
}

- (void)_readFerryStep
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_BYTE *)(a1 + 157) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOCompanionStepReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readFerryStep_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (BOOL)hasFerryStep
{
  -[GEOCompanionStep _readFerryStep]((uint64_t)self);
  return self->_ferryStep != 0;
}

- (GEOCompanionFerryStep)ferryStep
{
  -[GEOCompanionStep _readFerryStep]((uint64_t)self);
  return self->_ferryStep;
}

- (void)setFerryStep:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x100400u;
  objc_storeStrong((id *)&self->_ferryStep, a3);
}

- (unsigned)startCoordinateIndex
{
  return self->_startCoordinateIndex;
}

- (void)setStartCoordinateIndex:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x100020u;
  self->_startCoordinateIndex = a3;
}

- (void)setHasStartCoordinateIndex:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1048608;
  else
    v3 = 0x100000;
  self->_flags = ($F2F3A8C3CD2C9F51802C978D5302AD1B)(*(_DWORD *)&self->_flags & 0xFFFFFFDF | v3);
}

- (BOOL)hasStartCoordinateIndex
{
  return (*(_BYTE *)&self->_flags >> 5) & 1;
}

- (unsigned)maneuverStartCoordinateIndex
{
  return self->_maneuverStartCoordinateIndex;
}

- (void)setManeuverStartCoordinateIndex:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x100010u;
  self->_maneuverStartCoordinateIndex = a3;
}

- (void)setHasManeuverStartCoordinateIndex:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1048592;
  else
    v3 = 0x100000;
  self->_flags = ($F2F3A8C3CD2C9F51802C978D5302AD1B)(*(_DWORD *)&self->_flags & 0xFFEFFFEF | v3);
}

- (BOOL)hasManeuverStartCoordinateIndex
{
  return (*(_BYTE *)&self->_flags >> 4) & 1;
}

- (unsigned)endCoordinateIndex
{
  return self->_endCoordinateIndex;
}

- (void)setEndCoordinateIndex:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x100004u;
  self->_endCoordinateIndex = a3;
}

- (void)setHasEndCoordinateIndex:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1048580;
  else
    v3 = 0x100000;
  self->_flags = ($F2F3A8C3CD2C9F51802C978D5302AD1B)(*(_DWORD *)&self->_flags & 0xFFFFFFFB | v3);
}

- (BOOL)hasEndCoordinateIndex
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (void)_readInstructionWithAlternatives
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_BYTE *)(a1 + 157) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOCompanionStepReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readInstructionWithAlternatives_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (NSMutableArray)instructionWithAlternatives
{
  -[GEOCompanionStep _readInstructionWithAlternatives]((uint64_t)self);
  return self->_instructionWithAlternatives;
}

- (void)setInstructionWithAlternatives:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *instructionWithAlternatives;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x2000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x100000u;
  instructionWithAlternatives = self->_instructionWithAlternatives;
  self->_instructionWithAlternatives = v4;

}

- (void)clearInstructionWithAlternatives
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x2000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x100000u;
  -[NSMutableArray removeAllObjects](self->_instructionWithAlternatives, "removeAllObjects");
}

- (void)addInstructionWithAlternatives:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOCompanionStep _readInstructionWithAlternatives]((uint64_t)self);
  -[GEOCompanionStep _addNoFlagsInstructionWithAlternatives:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x2000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x100000u;
}

- (void)_addNoFlagsInstructionWithAlternatives:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 56);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 56);
      *(_QWORD *)(a1 + 56) = v5;

      v4 = *(void **)(a1 + 56);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)instructionWithAlternativesCount
{
  -[GEOCompanionStep _readInstructionWithAlternatives]((uint64_t)self);
  return -[NSMutableArray count](self->_instructionWithAlternatives, "count");
}

- (id)instructionWithAlternativesAtIndex:(unint64_t)a3
{
  -[GEOCompanionStep _readInstructionWithAlternatives]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_instructionWithAlternatives, "objectAtIndex:", a3);
}

+ (Class)instructionWithAlternativesType
{
  return (Class)objc_opt_class();
}

- (void)_readListInstruction
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_BYTE *)(a1 + 157) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOCompanionStepReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readListInstruction_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (BOOL)hasListInstruction
{
  -[GEOCompanionStep _readListInstruction]((uint64_t)self);
  return self->_listInstruction != 0;
}

- (NSString)listInstruction
{
  -[GEOCompanionStep _readListInstruction]((uint64_t)self);
  return self->_listInstruction;
}

- (void)setListInstruction:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x104000u;
  objc_storeStrong((id *)&self->_listInstruction, a3);
}

- (void)_readGuidanceEvents
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_BYTE *)(a1 + 157) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOCompanionStepReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readGuidanceEvents_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (NSMutableArray)guidanceEvents
{
  -[GEOCompanionStep _readGuidanceEvents]((uint64_t)self);
  return self->_guidanceEvents;
}

- (void)setGuidanceEvents:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *guidanceEvents;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x1000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x100000u;
  guidanceEvents = self->_guidanceEvents;
  self->_guidanceEvents = v4;

}

- (void)clearGuidanceEvents
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x1000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x100000u;
  -[NSMutableArray removeAllObjects](self->_guidanceEvents, "removeAllObjects");
}

- (void)addGuidanceEvent:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOCompanionStep _readGuidanceEvents]((uint64_t)self);
  -[GEOCompanionStep _addNoFlagsGuidanceEvent:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x1000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x100000u;
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

- (unint64_t)guidanceEventsCount
{
  -[GEOCompanionStep _readGuidanceEvents]((uint64_t)self);
  return -[NSMutableArray count](self->_guidanceEvents, "count");
}

- (id)guidanceEventAtIndex:(unint64_t)a3
{
  -[GEOCompanionStep _readGuidanceEvents]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_guidanceEvents, "objectAtIndex:", a3);
}

+ (Class)guidanceEventType
{
  return (Class)objc_opt_class();
}

- (void)_readUpdateID
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_BYTE *)(a1 + 158) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOCompanionStepReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readUpdateID_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (BOOL)hasUpdateID
{
  -[GEOCompanionStep _readUpdateID]((uint64_t)self);
  return self->_updateID != 0;
}

- (NSData)updateID
{
  -[GEOCompanionStep _readUpdateID]((uint64_t)self);
  return self->_updateID;
}

- (void)setUpdateID:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x140000u;
  objc_storeStrong((id *)&self->_updateID, a3);
}

- (void)_readGenericStep
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_BYTE *)(a1 + 157) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOCompanionStepReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readGenericStep_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (BOOL)hasGenericStep
{
  -[GEOCompanionStep _readGenericStep]((uint64_t)self);
  return self->_genericStep != 0;
}

- (GEOCompanionGenericStep)genericStep
{
  -[GEOCompanionStep _readGenericStep]((uint64_t)self);
  return self->_genericStep;
}

- (void)setGenericStep:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x100800u;
  objc_storeStrong((id *)&self->_genericStep, a3);
}

- (void)_readCyclingStep
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_BYTE *)(a1 + 157) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOCompanionStepReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCyclingStep_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (BOOL)hasCyclingStep
{
  -[GEOCompanionStep _readCyclingStep]((uint64_t)self);
  return self->_cyclingStep != 0;
}

- (GEOCompanionCyclingStep)cyclingStep
{
  -[GEOCompanionStep _readCyclingStep]((uint64_t)self);
  return self->_cyclingStep;
}

- (void)setCyclingStep:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x100100u;
  objc_storeStrong((id *)&self->_cyclingStep, a3);
}

- (void)_readRoadDescriptions
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_BYTE *)(a1 + 157) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOCompanionStepReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRoadDescriptions_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (NSMutableArray)roadDescriptions
{
  -[GEOCompanionStep _readRoadDescriptions]((uint64_t)self);
  return self->_roadDescriptions;
}

- (void)setRoadDescriptions:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *roadDescriptions;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x8000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x100000u;
  roadDescriptions = self->_roadDescriptions;
  self->_roadDescriptions = v4;

}

- (void)clearRoadDescriptions
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x8000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x100000u;
  -[NSMutableArray removeAllObjects](self->_roadDescriptions, "removeAllObjects");
}

- (void)addRoadDescriptions:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOCompanionStep _readRoadDescriptions]((uint64_t)self);
  -[GEOCompanionStep _addNoFlagsRoadDescriptions:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x8000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x100000u;
}

- (void)_addNoFlagsRoadDescriptions:(uint64_t)a1
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

- (unint64_t)roadDescriptionsCount
{
  -[GEOCompanionStep _readRoadDescriptions]((uint64_t)self);
  return -[NSMutableArray count](self->_roadDescriptions, "count");
}

- (id)roadDescriptionsAtIndex:(unint64_t)a3
{
  -[GEOCompanionStep _readRoadDescriptions]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_roadDescriptions, "objectAtIndex:", a3);
}

+ (Class)roadDescriptionsType
{
  return (Class)objc_opt_class();
}

- (void)_readStopWaypoint
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_BYTE *)(a1 + 158) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOCompanionStepReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readStopWaypoint_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (BOOL)hasStopWaypoint
{
  -[GEOCompanionStep _readStopWaypoint]((uint64_t)self);
  return self->_stopWaypoint != 0;
}

- (GEOStopWaypoint)stopWaypoint
{
  -[GEOCompanionStep _readStopWaypoint]((uint64_t)self);
  return self->_stopWaypoint;
}

- (void)setStopWaypoint:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x120000u;
  objc_storeStrong((id *)&self->_stopWaypoint, a3);
}

- (float)distanceMeters
{
  return self->_distanceMeters;
}

- (void)setDistanceMeters:(float)a3
{
  *(_DWORD *)&self->_flags |= 0x100001u;
  self->_distanceMeters = a3;
}

- (void)setHasDistanceMeters:(BOOL)a3
{
  self->_flags = ($F2F3A8C3CD2C9F51802C978D5302AD1B)(*(_DWORD *)&self->_flags & 0xFFFFFFFE | a3 | 0x100000);
}

- (BOOL)hasDistanceMeters
{
  return *(_DWORD *)&self->_flags & 1;
}

- (unsigned)legID
{
  return self->_legID;
}

- (void)setLegID:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x100008u;
  self->_legID = a3;
}

- (void)setHasLegID:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1048584;
  else
    v3 = 0x100000;
  self->_flags = ($F2F3A8C3CD2C9F51802C978D5302AD1B)(*(_DWORD *)&self->_flags & 0xFFFFFFF7 | v3);
}

- (BOOL)hasLegID
{
  return (*(_BYTE *)&self->_flags >> 3) & 1;
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
  v8.super_class = (Class)GEOCompanionStep;
  -[GEOCompanionStep description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOCompanionStep dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOCompanionStep _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  int *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
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
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t j;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  double v54;
  int v55;
  void *v56;
  const __CFString *v57;
  void *v58;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _BYTE v68[128];
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = &OBJC_IVAR___GEOLPRRestrictionRegion__name;
  v6 = *(_DWORD *)(a1 + 156);
  if ((v6 & 0x40) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 148));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("stepID"));

    v6 = *(_DWORD *)(a1 + 156);
  }
  if ((v6 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 128));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("distance"));

    v6 = *(_DWORD *)(a1 + 156);
  }
  if ((v6 & 0x80) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 152));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("time"));

  }
  objc_msgSend((id)a1, "roadName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("roadName"));

  objc_msgSend((id)a1, "driveStep");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v11, "jsonRepresentation");
    else
      objc_msgSend(v11, "dictionaryRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("driveStep"));

  }
  objc_msgSend((id)a1, "walkStep");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v14, "jsonRepresentation");
    else
      objc_msgSend(v14, "dictionaryRepresentation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("walkStep"));

  }
  objc_msgSend((id)a1, "ferryStep");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v17, "jsonRepresentation");
    else
      objc_msgSend(v17, "dictionaryRepresentation");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v19, CFSTR("ferryStep"));

  }
  v20 = *(_DWORD *)(a1 + 156);
  if ((v20 & 0x20) == 0)
  {
    if ((v20 & 0x10) == 0)
      goto LABEL_27;
LABEL_49:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 140));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v36, CFSTR("maneuverStartCoordinateIndex"));

    if ((*(_DWORD *)(a1 + 156) & 4) == 0)
      goto LABEL_29;
    goto LABEL_28;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 144));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v35, CFSTR("startCoordinateIndex"));

  v20 = *(_DWORD *)(a1 + 156);
  if ((v20 & 0x10) != 0)
    goto LABEL_49;
LABEL_27:
  if ((v20 & 4) != 0)
  {
LABEL_28:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 132));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v21, CFSTR("endCoordinateIndex"));

  }
LABEL_29:
  if (*(_QWORD *)(a1 + 56))
  {
    objc_msgSend((id)a1, "instructionWithAlternatives");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v22, CFSTR("instructionWithAlternatives"));

  }
  objc_msgSend((id)a1, "listInstruction");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
    objc_msgSend(v4, "setObject:forKey:", v23, CFSTR("listInstruction"));

  if (objc_msgSend(*(id *)(a1 + 48), "count"))
  {
    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
    v64 = 0u;
    v65 = 0u;
    v66 = 0u;
    v67 = 0u;
    v25 = *(id *)(a1 + 48);
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v64, v69, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v65;
      do
      {
        for (i = 0; i != v27; ++i)
        {
          if (*(_QWORD *)v65 != v28)
            objc_enumerationMutation(v25);
          v30 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v30, "jsonRepresentation");
          else
            objc_msgSend(v30, "dictionaryRepresentation");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "addObject:", v31);

        }
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v64, v69, 16);
      }
      while (v27);
    }

    objc_msgSend(v4, "setObject:forKey:", v24, CFSTR("guidanceEvent"));
    v5 = &OBJC_IVAR___GEOLPRRestrictionRegion__name;
  }
  objc_msgSend((id)a1, "updateID");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v32;
  if (v32)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v32, "base64EncodedStringWithOptions:", 0);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v34, CFSTR("updateID"));

    }
    else
    {
      objc_msgSend(v4, "setObject:forKey:", v32, CFSTR("updateID"));
    }
  }

  objc_msgSend((id)a1, "genericStep");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v37;
  if (v37)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v37, "jsonRepresentation");
    else
      objc_msgSend(v37, "dictionaryRepresentation");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v39, CFSTR("genericStep"));

  }
  objc_msgSend((id)a1, "cyclingStep");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v40;
  if (v40)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v40, "jsonRepresentation");
    else
      objc_msgSend(v40, "dictionaryRepresentation");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v42, CFSTR("cyclingStep"));

  }
  if (objc_msgSend(*(id *)(a1 + 72), "count"))
  {
    v43 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 72), "count"));
    v60 = 0u;
    v61 = 0u;
    v62 = 0u;
    v63 = 0u;
    v44 = *(id *)(a1 + 72);
    v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v60, v68, 16);
    if (v45)
    {
      v46 = v45;
      v47 = *(_QWORD *)v61;
      do
      {
        for (j = 0; j != v46; ++j)
        {
          if (*(_QWORD *)v61 != v47)
            objc_enumerationMutation(v44);
          v49 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * j);
          if ((a2 & 1) != 0)
            objc_msgSend(v49, "jsonRepresentation");
          else
            objc_msgSend(v49, "dictionaryRepresentation", (_QWORD)v60);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "addObject:", v50, (_QWORD)v60);

        }
        v46 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v60, v68, 16);
      }
      while (v46);
    }

    objc_msgSend(v4, "setObject:forKey:", v43, CFSTR("roadDescriptions"));
    v5 = &OBJC_IVAR___GEOLPRRestrictionRegion__name;
  }
  objc_msgSend((id)a1, "stopWaypoint", (_QWORD)v60);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = v51;
  if (v51)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v51, "jsonRepresentation");
    else
      objc_msgSend(v51, "dictionaryRepresentation");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v53, CFSTR("stopWaypoint"));

  }
  v55 = *(_DWORD *)(a1 + v5[600]);
  if ((v55 & 1) != 0)
  {
    LODWORD(v54) = *(_DWORD *)(a1 + 124);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v54);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v57 = CFSTR("distanceMeters");
    else
      v57 = CFSTR("distance_meters");
    objc_msgSend(v4, "setObject:forKey:", v56, v57);

    v55 = *(_DWORD *)(a1 + 156);
  }
  if ((v55 & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 136));
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v58, CFSTR("legID"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOCompanionStep _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOCompanionStep)initWithDictionary:(id)a3
{
  return (GEOCompanionStep *)-[GEOCompanionStep _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  GEOCompanionDriveStep *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  GEOCompanionWalkStep *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  GEOCompanionFerryStep *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t j;
  uint64_t v42;
  GEOGuidanceEvent *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  GEOCompanionGenericStep *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  GEOCompanionCyclingStep *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t k;
  uint64_t v62;
  GEORoadDescription *v63;
  uint64_t v64;
  void *v65;
  void *v66;
  GEOStopWaypoint *v67;
  uint64_t v68;
  void *v69;
  const __CFString *v70;
  void *v71;
  void *v72;
  void *v74;
  id v75;
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
  __int128 v87;
  _BYTE v88[128];
  _BYTE v89[128];
  _BYTE v90[128];
  uint64_t v91;

  v91 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("stepID"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setStepID:", objc_msgSend(v6, "unsignedIntValue"));

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("distance"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setDistance:", objc_msgSend(v7, "unsignedIntValue"));

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("time"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setTime:", objc_msgSend(v8, "unsignedIntValue"));

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("roadName"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v10 = (void *)objc_msgSend(v9, "copy");
        objc_msgSend(a1, "setRoadName:", v10);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("driveStep"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v12 = [GEOCompanionDriveStep alloc];
        if ((a3 & 1) != 0)
          v13 = -[GEOCompanionDriveStep initWithJSON:](v12, "initWithJSON:", v11);
        else
          v13 = -[GEOCompanionDriveStep initWithDictionary:](v12, "initWithDictionary:", v11);
        v14 = (void *)v13;
        objc_msgSend(a1, "setDriveStep:", v13);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("walkStep"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v16 = [GEOCompanionWalkStep alloc];
        if ((a3 & 1) != 0)
          v17 = -[GEOCompanionWalkStep initWithJSON:](v16, "initWithJSON:", v15);
        else
          v17 = -[GEOCompanionWalkStep initWithDictionary:](v16, "initWithDictionary:", v15);
        v18 = (void *)v17;
        objc_msgSend(a1, "setWalkStep:", v17);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ferryStep"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v20 = [GEOCompanionFerryStep alloc];
        if ((a3 & 1) != 0)
          v21 = -[GEOCompanionFerryStep initWithJSON:](v20, "initWithJSON:", v19);
        else
          v21 = -[GEOCompanionFerryStep initWithDictionary:](v20, "initWithDictionary:", v19);
        v22 = (void *)v21;
        objc_msgSend(a1, "setFerryStep:", v21);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("startCoordinateIndex"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setStartCoordinateIndex:", objc_msgSend(v23, "unsignedIntValue"));

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("maneuverStartCoordinateIndex"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setManeuverStartCoordinateIndex:", objc_msgSend(v24, "unsignedIntValue"));

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("endCoordinateIndex"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setEndCoordinateIndex:", objc_msgSend(v25, "unsignedIntValue"));

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("instructionWithAlternatives"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v75 = v5;
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v86 = 0u;
        v87 = 0u;
        v84 = 0u;
        v85 = 0u;
        v27 = v26;
        v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v84, v90, 16);
        if (v28)
        {
          v29 = v28;
          v30 = *(_QWORD *)v85;
          do
          {
            for (i = 0; i != v29; ++i)
            {
              if (*(_QWORD *)v85 != v30)
                objc_enumerationMutation(v27);
              v32 = *(void **)(*((_QWORD *)&v84 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v33 = (void *)objc_msgSend(v32, "copy");
                objc_msgSend(a1, "addInstructionWithAlternatives:", v33);

              }
            }
            v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v84, v90, 16);
          }
          while (v29);
        }

        v5 = v75;
      }

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("listInstruction"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v35 = (void *)objc_msgSend(v34, "copy");
        objc_msgSend(a1, "setListInstruction:", v35);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("guidanceEvent"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v82 = 0u;
        v83 = 0u;
        v80 = 0u;
        v81 = 0u;
        v74 = v36;
        v37 = v36;
        v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v80, v89, 16);
        if (v38)
        {
          v39 = v38;
          v40 = *(_QWORD *)v81;
          do
          {
            for (j = 0; j != v39; ++j)
            {
              if (*(_QWORD *)v81 != v40)
                objc_enumerationMutation(v37);
              v42 = *(_QWORD *)(*((_QWORD *)&v80 + 1) + 8 * j);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v43 = [GEOGuidanceEvent alloc];
                if ((a3 & 1) != 0)
                  v44 = -[GEOGuidanceEvent initWithJSON:](v43, "initWithJSON:", v42);
                else
                  v44 = -[GEOGuidanceEvent initWithDictionary:](v43, "initWithDictionary:", v42);
                v45 = (void *)v44;
                objc_msgSend(a1, "addGuidanceEvent:", v44, v74);

              }
            }
            v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v80, v89, 16);
          }
          while (v39);
        }

        v36 = v74;
        v5 = v75;
      }

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("updateID"));
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v47 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v46, 0);
        objc_msgSend(a1, "setUpdateID:", v47);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("genericStep"));
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v49 = [GEOCompanionGenericStep alloc];
        if ((a3 & 1) != 0)
          v50 = -[GEOCompanionGenericStep initWithJSON:](v49, "initWithJSON:", v48);
        else
          v50 = -[GEOCompanionGenericStep initWithDictionary:](v49, "initWithDictionary:", v48);
        v51 = (void *)v50;
        objc_msgSend(a1, "setGenericStep:", v50, v74);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("cyclingStep"));
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v53 = [GEOCompanionCyclingStep alloc];
        if ((a3 & 1) != 0)
          v54 = -[GEOCompanionCyclingStep initWithJSON:](v53, "initWithJSON:", v52);
        else
          v54 = -[GEOCompanionCyclingStep initWithDictionary:](v53, "initWithDictionary:", v52);
        v55 = (void *)v54;
        objc_msgSend(a1, "setCyclingStep:", v54, v74);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("roadDescriptions"));
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v78 = 0u;
        v79 = 0u;
        v76 = 0u;
        v77 = 0u;
        v57 = v56;
        v58 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v76, v88, 16);
        if (v58)
        {
          v59 = v58;
          v60 = *(_QWORD *)v77;
          do
          {
            for (k = 0; k != v59; ++k)
            {
              if (*(_QWORD *)v77 != v60)
                objc_enumerationMutation(v57);
              v62 = *(_QWORD *)(*((_QWORD *)&v76 + 1) + 8 * k);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v63 = [GEORoadDescription alloc];
                if ((a3 & 1) != 0)
                  v64 = -[GEORoadDescription initWithJSON:](v63, "initWithJSON:", v62);
                else
                  v64 = -[GEORoadDescription initWithDictionary:](v63, "initWithDictionary:", v62);
                v65 = (void *)v64;
                objc_msgSend(a1, "addRoadDescriptions:", v64, v74);

              }
            }
            v59 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v76, v88, 16);
          }
          while (v59);
        }

        v5 = v75;
      }

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("stopWaypoint"));
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v67 = [GEOStopWaypoint alloc];
        if ((a3 & 1) != 0)
          v68 = -[GEOStopWaypoint initWithJSON:](v67, "initWithJSON:", v66);
        else
          v68 = -[GEOStopWaypoint initWithDictionary:](v67, "initWithDictionary:", v66);
        v69 = (void *)v68;
        objc_msgSend(a1, "setStopWaypoint:", v68, v74);

      }
      if (a3)
        v70 = CFSTR("distanceMeters");
      else
        v70 = CFSTR("distance_meters");
      objc_msgSend(v5, "objectForKeyedSubscript:", v70, v74);
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v71, "floatValue");
        objc_msgSend(a1, "setDistanceMeters:");
      }

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("legID"));
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setLegID:", objc_msgSend(v72, "unsignedIntValue"));

    }
  }

  return a1;
}

- (GEOCompanionStep)initWithJSON:(id)a3
{
  return (GEOCompanionStep *)-[GEOCompanionStep _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_891;
    else
      v8 = (int *)&readAll__nonRecursiveTag_892;
    GEOCompanionStepReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEOCompanionStepCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOCompanionStepIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOCompanionStepReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  $F2F3A8C3CD2C9F51802C978D5302AD1B flags;
  $F2F3A8C3CD2C9F51802C978D5302AD1B v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t k;
  $F2F3A8C3CD2C9F51802C978D5302AD1B v20;
  PBDataReader *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOCompanionStepIsDirty((uint64_t)self) & 1) == 0)
  {
    v21 = self->_reader;
    objc_sync_enter(v21);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v22);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v21);
    goto LABEL_61;
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOCompanionStep readAll:](self, "readAll:", 0);
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 0x40) != 0)
  {
    PBDataWriterWriteUint32Field();
    flags = self->_flags;
    if ((*(_BYTE *)&flags & 2) == 0)
    {
LABEL_5:
      if ((*(_BYTE *)&flags & 0x80) == 0)
        goto LABEL_7;
      goto LABEL_6;
    }
  }
  else if ((*(_BYTE *)&flags & 2) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteUint32Field();
  if ((*(_DWORD *)&self->_flags & 0x80) != 0)
LABEL_6:
    PBDataWriterWriteUint32Field();
LABEL_7:
  if (self->_roadName)
    PBDataWriterWriteStringField();
  if (self->_driveStep)
    PBDataWriterWriteSubmessage();
  if (self->_walkStep)
    PBDataWriterWriteSubmessage();
  if (self->_ferryStep)
    PBDataWriterWriteSubmessage();
  v7 = self->_flags;
  if ((*(_BYTE *)&v7 & 0x20) == 0)
  {
    if ((*(_BYTE *)&v7 & 0x10) == 0)
      goto LABEL_17;
LABEL_58:
    PBDataWriterWriteUint32Field();
    if ((*(_DWORD *)&self->_flags & 4) == 0)
      goto LABEL_19;
    goto LABEL_18;
  }
  PBDataWriterWriteUint32Field();
  v7 = self->_flags;
  if ((*(_BYTE *)&v7 & 0x10) != 0)
    goto LABEL_58;
LABEL_17:
  if ((*(_BYTE *)&v7 & 4) != 0)
LABEL_18:
    PBDataWriterWriteUint32Field();
LABEL_19:
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v8 = self->_instructionWithAlternatives;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v32 != v10)
          objc_enumerationMutation(v8);
        PBDataWriterWriteStringField();
      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
    }
    while (v9);
  }

  if (self->_listInstruction)
    PBDataWriterWriteStringField();
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v12 = self->_guidanceEvents;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v28;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v28 != v14)
          objc_enumerationMutation(v12);
        PBDataWriterWriteSubmessage();
      }
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
    }
    while (v13);
  }

  if (self->_updateID)
    PBDataWriterWriteDataField();
  if (self->_genericStep)
    PBDataWriterWriteSubmessage();
  if (self->_cyclingStep)
    PBDataWriterWriteSubmessage();
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v16 = self->_roadDescriptions;
  v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v23, v35, 16);
  if (v17)
  {
    v18 = *(_QWORD *)v24;
    do
    {
      for (k = 0; k != v17; ++k)
      {
        if (*(_QWORD *)v24 != v18)
          objc_enumerationMutation(v16);
        PBDataWriterWriteSubmessage();
      }
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v23, v35, 16);
    }
    while (v17);
  }

  if (self->_stopWaypoint)
    PBDataWriterWriteSubmessage();
  v20 = self->_flags;
  if ((*(_BYTE *)&v20 & 1) != 0)
  {
    PBDataWriterWriteFloatField();
    v20 = self->_flags;
  }
  if ((*(_BYTE *)&v20 & 8) != 0)
    PBDataWriterWriteUint32Field();
LABEL_61:

}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[GEOCompanionStep _readStopWaypoint]((uint64_t)self);
  return -[GEOStopWaypoint hasGreenTeaWithValue:](self->_stopWaypoint, "hasGreenTeaWithValue:", v3);
}

- (void)copyTo:(id)a3
{
  id *v4;
  $F2F3A8C3CD2C9F51802C978D5302AD1B flags;
  $F2F3A8C3CD2C9F51802C978D5302AD1B v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t i;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t j;
  void *v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t k;
  void *v18;
  $F2F3A8C3CD2C9F51802C978D5302AD1B v19;
  id *v20;

  v20 = (id *)a3;
  -[GEOCompanionStep readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v20 + 1, self->_reader);
  *((_DWORD *)v20 + 28) = self->_readerMarkPos;
  *((_DWORD *)v20 + 29) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  v4 = v20;
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 0x40) != 0)
  {
    *((_DWORD *)v20 + 37) = self->_stepID;
    *((_DWORD *)v20 + 39) |= 0x40u;
    flags = self->_flags;
    if ((*(_BYTE *)&flags & 2) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&flags & 0x80) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&flags & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v20 + 32) = self->_distance;
  *((_DWORD *)v20 + 39) |= 2u;
  if ((*(_DWORD *)&self->_flags & 0x80) != 0)
  {
LABEL_4:
    *((_DWORD *)v20 + 38) = self->_time;
    *((_DWORD *)v20 + 39) |= 0x80u;
  }
LABEL_5:
  if (self->_roadName)
  {
    objc_msgSend(v20, "setRoadName:");
    v4 = v20;
  }
  if (self->_driveStep)
  {
    objc_msgSend(v20, "setDriveStep:");
    v4 = v20;
  }
  if (self->_walkStep)
  {
    objc_msgSend(v20, "setWalkStep:");
    v4 = v20;
  }
  if (self->_ferryStep)
  {
    objc_msgSend(v20, "setFerryStep:");
    v4 = v20;
  }
  v6 = self->_flags;
  if ((*(_BYTE *)&v6 & 0x20) == 0)
  {
    if ((*(_BYTE *)&v6 & 0x10) == 0)
      goto LABEL_15;
LABEL_48:
    *((_DWORD *)v4 + 35) = self->_maneuverStartCoordinateIndex;
    *((_DWORD *)v4 + 39) |= 0x10u;
    if ((*(_DWORD *)&self->_flags & 4) == 0)
      goto LABEL_17;
    goto LABEL_16;
  }
  *((_DWORD *)v4 + 36) = self->_startCoordinateIndex;
  *((_DWORD *)v4 + 39) |= 0x20u;
  v6 = self->_flags;
  if ((*(_BYTE *)&v6 & 0x10) != 0)
    goto LABEL_48;
LABEL_15:
  if ((*(_BYTE *)&v6 & 4) != 0)
  {
LABEL_16:
    *((_DWORD *)v4 + 33) = self->_endCoordinateIndex;
    *((_DWORD *)v4 + 39) |= 4u;
  }
LABEL_17:
  if (-[GEOCompanionStep instructionWithAlternativesCount](self, "instructionWithAlternativesCount"))
  {
    objc_msgSend(v20, "clearInstructionWithAlternatives");
    v7 = -[GEOCompanionStep instructionWithAlternativesCount](self, "instructionWithAlternativesCount");
    if (v7)
    {
      v8 = v7;
      for (i = 0; i != v8; ++i)
      {
        -[GEOCompanionStep instructionWithAlternativesAtIndex:](self, "instructionWithAlternativesAtIndex:", i);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "addInstructionWithAlternatives:", v10);

      }
    }
  }
  if (self->_listInstruction)
    objc_msgSend(v20, "setListInstruction:");
  if (-[GEOCompanionStep guidanceEventsCount](self, "guidanceEventsCount"))
  {
    objc_msgSend(v20, "clearGuidanceEvents");
    v11 = -[GEOCompanionStep guidanceEventsCount](self, "guidanceEventsCount");
    if (v11)
    {
      v12 = v11;
      for (j = 0; j != v12; ++j)
      {
        -[GEOCompanionStep guidanceEventAtIndex:](self, "guidanceEventAtIndex:", j);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "addGuidanceEvent:", v14);

      }
    }
  }
  if (self->_updateID)
    objc_msgSend(v20, "setUpdateID:");
  if (self->_genericStep)
    objc_msgSend(v20, "setGenericStep:");
  if (self->_cyclingStep)
    objc_msgSend(v20, "setCyclingStep:");
  if (-[GEOCompanionStep roadDescriptionsCount](self, "roadDescriptionsCount"))
  {
    objc_msgSend(v20, "clearRoadDescriptions");
    v15 = -[GEOCompanionStep roadDescriptionsCount](self, "roadDescriptionsCount");
    if (v15)
    {
      v16 = v15;
      for (k = 0; k != v16; ++k)
      {
        -[GEOCompanionStep roadDescriptionsAtIndex:](self, "roadDescriptionsAtIndex:", k);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "addRoadDescriptions:", v18);

      }
    }
  }
  if (self->_stopWaypoint)
    objc_msgSend(v20, "setStopWaypoint:");
  v19 = self->_flags;
  if ((*(_BYTE *)&v19 & 1) != 0)
  {
    *((_DWORD *)v20 + 31) = LODWORD(self->_distanceMeters);
    *((_DWORD *)v20 + 39) |= 1u;
    v19 = self->_flags;
  }
  if ((*(_BYTE *)&v19 & 8) != 0)
  {
    *((_DWORD *)v20 + 34) = self->_legID;
    *((_DWORD *)v20 + 39) |= 8u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  $F2F3A8C3CD2C9F51802C978D5302AD1B flags;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  $F2F3A8C3CD2C9F51802C978D5302AD1B v18;
  NSMutableArray *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  uint64_t v24;
  void *v25;
  NSMutableArray *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  void *v30;
  uint64_t v31;
  void *v32;
  id v33;
  void *v34;
  id v35;
  void *v36;
  NSMutableArray *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t k;
  void *v41;
  id v42;
  void *v43;
  $F2F3A8C3CD2C9F51802C978D5302AD1B v44;
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
  _BYTE v58[128];
  _BYTE v59[128];
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
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
      GEOCompanionStepReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOCompanionStep readAll:](self, "readAll:", 0);
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 0x40) != 0)
  {
    *(_DWORD *)(v5 + 148) = self->_stepID;
    *(_DWORD *)(v5 + 156) |= 0x40u;
    flags = self->_flags;
    if ((*(_BYTE *)&flags & 2) == 0)
    {
LABEL_7:
      if ((*(_BYTE *)&flags & 0x80) == 0)
        goto LABEL_9;
      goto LABEL_8;
    }
  }
  else if ((*(_BYTE *)&flags & 2) == 0)
  {
    goto LABEL_7;
  }
  *(_DWORD *)(v5 + 128) = self->_distance;
  *(_DWORD *)(v5 + 156) |= 2u;
  if ((*(_DWORD *)&self->_flags & 0x80) != 0)
  {
LABEL_8:
    *(_DWORD *)(v5 + 152) = self->_time;
    *(_DWORD *)(v5 + 156) |= 0x80u;
  }
LABEL_9:
  v10 = -[NSString copyWithZone:](self->_roadName, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v10;

  v12 = -[GEOCompanionDriveStep copyWithZone:](self->_driveStep, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v12;

  v14 = -[GEOCompanionWalkStep copyWithZone:](self->_walkStep, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 104);
  *(_QWORD *)(v5 + 104) = v14;

  v16 = -[GEOCompanionFerryStep copyWithZone:](self->_ferryStep, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v16;

  v18 = self->_flags;
  if ((*(_BYTE *)&v18 & 0x20) == 0)
  {
    if ((*(_BYTE *)&v18 & 0x10) == 0)
      goto LABEL_11;
LABEL_43:
    *(_DWORD *)(v5 + 140) = self->_maneuverStartCoordinateIndex;
    *(_DWORD *)(v5 + 156) |= 0x10u;
    if ((*(_DWORD *)&self->_flags & 4) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
  *(_DWORD *)(v5 + 144) = self->_startCoordinateIndex;
  *(_DWORD *)(v5 + 156) |= 0x20u;
  v18 = self->_flags;
  if ((*(_BYTE *)&v18 & 0x10) != 0)
    goto LABEL_43;
LABEL_11:
  if ((*(_BYTE *)&v18 & 4) != 0)
  {
LABEL_12:
    *(_DWORD *)(v5 + 132) = self->_endCoordinateIndex;
    *(_DWORD *)(v5 + 156) |= 4u;
  }
LABEL_13:
  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v19 = self->_instructionWithAlternatives;
  v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v54, v60, 16);
  if (v20)
  {
    v21 = *(_QWORD *)v55;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v55 != v21)
          objc_enumerationMutation(v19);
        v23 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v54 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addInstructionWithAlternatives:", v23);

      }
      v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v54, v60, 16);
    }
    while (v20);
  }

  v24 = -[NSString copyWithZone:](self->_listInstruction, "copyWithZone:", a3);
  v25 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v24;

  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v26 = self->_guidanceEvents;
  v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
  if (v27)
  {
    v28 = *(_QWORD *)v51;
    do
    {
      for (j = 0; j != v27; ++j)
      {
        if (*(_QWORD *)v51 != v28)
          objc_enumerationMutation(v26);
        v30 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v50 + 1) + 8 * j), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addGuidanceEvent:", v30);

      }
      v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
    }
    while (v27);
  }

  v31 = -[NSData copyWithZone:](self->_updateID, "copyWithZone:", a3);
  v32 = *(void **)(v5 + 96);
  *(_QWORD *)(v5 + 96) = v31;

  v33 = -[GEOCompanionGenericStep copyWithZone:](self->_genericStep, "copyWithZone:", a3);
  v34 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v33;

  v35 = -[GEOCompanionCyclingStep copyWithZone:](self->_cyclingStep, "copyWithZone:", a3);
  v36 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v35;

  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v37 = self->_roadDescriptions;
  v38 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v37, "countByEnumeratingWithState:objects:count:", &v46, v58, 16);
  if (v38)
  {
    v39 = *(_QWORD *)v47;
    do
    {
      for (k = 0; k != v38; ++k)
      {
        if (*(_QWORD *)v47 != v39)
          objc_enumerationMutation(v37);
        v41 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v46 + 1) + 8 * k), "copyWithZone:", a3, (_QWORD)v46);
        objc_msgSend((id)v5, "addRoadDescriptions:", v41);

      }
      v38 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v37, "countByEnumeratingWithState:objects:count:", &v46, v58, 16);
    }
    while (v38);
  }

  v42 = -[GEOStopWaypoint copyWithZone:](self->_stopWaypoint, "copyWithZone:", a3);
  v43 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v42;

  v44 = self->_flags;
  if ((*(_BYTE *)&v44 & 1) != 0)
  {
    *(float *)(v5 + 124) = self->_distanceMeters;
    *(_DWORD *)(v5 + 156) |= 1u;
    v44 = self->_flags;
  }
  if ((*(_BYTE *)&v44 & 8) != 0)
  {
    *(_DWORD *)(v5 + 136) = self->_legID;
    *(_DWORD *)(v5 + 156) |= 8u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  $F2F3A8C3CD2C9F51802C978D5302AD1B flags;
  int v6;
  NSString *roadName;
  GEOCompanionDriveStep *driveStep;
  GEOCompanionWalkStep *walkStep;
  GEOCompanionFerryStep *ferryStep;
  $F2F3A8C3CD2C9F51802C978D5302AD1B v11;
  int v12;
  NSMutableArray *instructionWithAlternatives;
  NSString *listInstruction;
  NSMutableArray *guidanceEvents;
  NSData *updateID;
  GEOCompanionGenericStep *genericStep;
  GEOCompanionCyclingStep *cyclingStep;
  NSMutableArray *roadDescriptions;
  GEOStopWaypoint *stopWaypoint;
  $F2F3A8C3CD2C9F51802C978D5302AD1B v21;
  int v22;
  BOOL v23;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_66;
  -[GEOCompanionStep readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  flags = self->_flags;
  v6 = *((_DWORD *)v4 + 39);
  if ((*(_BYTE *)&flags & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_stepID != *((_DWORD *)v4 + 37))
      goto LABEL_66;
  }
  else if ((v6 & 0x40) != 0)
  {
LABEL_66:
    v23 = 0;
    goto LABEL_67;
  }
  if ((*(_BYTE *)&flags & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_distance != *((_DWORD *)v4 + 32))
      goto LABEL_66;
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_66;
  }
  if ((*(_BYTE *)&flags & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_time != *((_DWORD *)v4 + 38))
      goto LABEL_66;
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_66;
  }
  roadName = self->_roadName;
  if ((unint64_t)roadName | *((_QWORD *)v4 + 10) && !-[NSString isEqual:](roadName, "isEqual:"))
    goto LABEL_66;
  driveStep = self->_driveStep;
  if ((unint64_t)driveStep | *((_QWORD *)v4 + 3))
  {
    if (!-[GEOCompanionDriveStep isEqual:](driveStep, "isEqual:"))
      goto LABEL_66;
  }
  walkStep = self->_walkStep;
  if ((unint64_t)walkStep | *((_QWORD *)v4 + 13))
  {
    if (!-[GEOCompanionWalkStep isEqual:](walkStep, "isEqual:"))
      goto LABEL_66;
  }
  ferryStep = self->_ferryStep;
  if ((unint64_t)ferryStep | *((_QWORD *)v4 + 4))
  {
    if (!-[GEOCompanionFerryStep isEqual:](ferryStep, "isEqual:"))
      goto LABEL_66;
  }
  v11 = self->_flags;
  v12 = *((_DWORD *)v4 + 39);
  if ((*(_BYTE *)&v11 & 0x20) != 0)
  {
    if ((v12 & 0x20) == 0 || self->_startCoordinateIndex != *((_DWORD *)v4 + 36))
      goto LABEL_66;
  }
  else if ((v12 & 0x20) != 0)
  {
    goto LABEL_66;
  }
  if ((*(_BYTE *)&v11 & 0x10) != 0)
  {
    if ((v12 & 0x10) == 0 || self->_maneuverStartCoordinateIndex != *((_DWORD *)v4 + 35))
      goto LABEL_66;
  }
  else if ((v12 & 0x10) != 0)
  {
    goto LABEL_66;
  }
  if ((*(_BYTE *)&v11 & 4) != 0)
  {
    if ((v12 & 4) == 0 || self->_endCoordinateIndex != *((_DWORD *)v4 + 33))
      goto LABEL_66;
  }
  else if ((v12 & 4) != 0)
  {
    goto LABEL_66;
  }
  instructionWithAlternatives = self->_instructionWithAlternatives;
  if ((unint64_t)instructionWithAlternatives | *((_QWORD *)v4 + 7)
    && !-[NSMutableArray isEqual:](instructionWithAlternatives, "isEqual:"))
  {
    goto LABEL_66;
  }
  listInstruction = self->_listInstruction;
  if ((unint64_t)listInstruction | *((_QWORD *)v4 + 8))
  {
    if (!-[NSString isEqual:](listInstruction, "isEqual:"))
      goto LABEL_66;
  }
  guidanceEvents = self->_guidanceEvents;
  if ((unint64_t)guidanceEvents | *((_QWORD *)v4 + 6))
  {
    if (!-[NSMutableArray isEqual:](guidanceEvents, "isEqual:"))
      goto LABEL_66;
  }
  updateID = self->_updateID;
  if ((unint64_t)updateID | *((_QWORD *)v4 + 12))
  {
    if (!-[NSData isEqual:](updateID, "isEqual:"))
      goto LABEL_66;
  }
  genericStep = self->_genericStep;
  if ((unint64_t)genericStep | *((_QWORD *)v4 + 5))
  {
    if (!-[GEOCompanionGenericStep isEqual:](genericStep, "isEqual:"))
      goto LABEL_66;
  }
  cyclingStep = self->_cyclingStep;
  if ((unint64_t)cyclingStep | *((_QWORD *)v4 + 2))
  {
    if (!-[GEOCompanionCyclingStep isEqual:](cyclingStep, "isEqual:"))
      goto LABEL_66;
  }
  roadDescriptions = self->_roadDescriptions;
  if ((unint64_t)roadDescriptions | *((_QWORD *)v4 + 9))
  {
    if (!-[NSMutableArray isEqual:](roadDescriptions, "isEqual:"))
      goto LABEL_66;
  }
  stopWaypoint = self->_stopWaypoint;
  if ((unint64_t)stopWaypoint | *((_QWORD *)v4 + 11))
  {
    if (!-[GEOStopWaypoint isEqual:](stopWaypoint, "isEqual:"))
      goto LABEL_66;
  }
  v21 = self->_flags;
  v22 = *((_DWORD *)v4 + 39);
  if ((*(_BYTE *)&v21 & 1) != 0)
  {
    if ((v22 & 1) == 0 || self->_distanceMeters != *((float *)v4 + 31))
      goto LABEL_66;
  }
  else if ((v22 & 1) != 0)
  {
    goto LABEL_66;
  }
  if ((*(_BYTE *)&v21 & 8) != 0)
  {
    if ((v22 & 8) == 0 || self->_legID != *((_DWORD *)v4 + 34))
      goto LABEL_66;
    v23 = 1;
  }
  else
  {
    v23 = (*((_DWORD *)v4 + 39) & 8) == 0;
  }
LABEL_67:

  return v23;
}

- (unint64_t)hash
{
  $F2F3A8C3CD2C9F51802C978D5302AD1B flags;
  $F2F3A8C3CD2C9F51802C978D5302AD1B v4;
  uint64_t v5;
  uint64_t v6;
  NSUInteger v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  $F2F3A8C3CD2C9F51802C978D5302AD1B v14;
  unint64_t v15;
  float distanceMeters;
  double v17;
  long double v18;
  double v19;
  uint64_t v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  NSUInteger v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  -[GEOCompanionStep readAll:](self, "readAll:", 1);
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 0x40) == 0)
  {
    v31 = 0;
    if ((*(_BYTE *)&flags & 2) != 0)
      goto LABEL_3;
LABEL_6:
    v30 = 0;
    if ((*(_BYTE *)&flags & 0x80) != 0)
      goto LABEL_4;
    goto LABEL_7;
  }
  v31 = 2654435761 * self->_stepID;
  if ((*(_BYTE *)&flags & 2) == 0)
    goto LABEL_6;
LABEL_3:
  v30 = 2654435761 * self->_distance;
  if ((*(_BYTE *)&flags & 0x80) != 0)
  {
LABEL_4:
    v29 = 2654435761 * self->_time;
    goto LABEL_8;
  }
LABEL_7:
  v29 = 0;
LABEL_8:
  v28 = -[NSString hash](self->_roadName, "hash");
  v27 = -[GEOCompanionDriveStep hash](self->_driveStep, "hash");
  v26 = -[GEOCompanionWalkStep hash](self->_walkStep, "hash");
  v25 = -[GEOCompanionFerryStep hash](self->_ferryStep, "hash");
  v4 = self->_flags;
  if ((*(_BYTE *)&v4 & 0x20) == 0)
  {
    v24 = 0;
    if ((*(_BYTE *)&v4 & 0x10) != 0)
      goto LABEL_10;
LABEL_13:
    v23 = 0;
    if ((*(_BYTE *)&v4 & 4) != 0)
      goto LABEL_11;
    goto LABEL_14;
  }
  v24 = 2654435761 * self->_startCoordinateIndex;
  if ((*(_BYTE *)&v4 & 0x10) == 0)
    goto LABEL_13;
LABEL_10:
  v23 = 2654435761 * self->_maneuverStartCoordinateIndex;
  if ((*(_BYTE *)&v4 & 4) != 0)
  {
LABEL_11:
    v5 = -[NSMutableArray hash](self->_instructionWithAlternatives, "hash", 2654435761 * self->_endCoordinateIndex);
    goto LABEL_15;
  }
LABEL_14:
  v5 = -[NSMutableArray hash](self->_instructionWithAlternatives, "hash", 0);
LABEL_15:
  v6 = v5;
  v7 = -[NSString hash](self->_listInstruction, "hash");
  v8 = -[NSMutableArray hash](self->_guidanceEvents, "hash");
  v9 = -[NSData hash](self->_updateID, "hash");
  v10 = -[GEOCompanionGenericStep hash](self->_genericStep, "hash");
  v11 = -[GEOCompanionCyclingStep hash](self->_cyclingStep, "hash");
  v12 = -[NSMutableArray hash](self->_roadDescriptions, "hash");
  v13 = -[GEOStopWaypoint hash](self->_stopWaypoint, "hash");
  v14 = self->_flags;
  if ((*(_BYTE *)&v14 & 1) != 0)
  {
    distanceMeters = self->_distanceMeters;
    v17 = distanceMeters;
    if (distanceMeters < 0.0)
      v17 = -distanceMeters;
    v18 = floor(v17 + 0.5);
    v19 = (v17 - v18) * 1.84467441e19;
    v15 = 2654435761u * (unint64_t)fmod(v18, 1.84467441e19);
    if (v19 >= 0.0)
    {
      if (v19 > 0.0)
        v15 += (unint64_t)v19;
    }
    else
    {
      v15 -= (unint64_t)fabs(v19);
    }
  }
  else
  {
    v15 = 0;
  }
  if ((*(_BYTE *)&v14 & 8) != 0)
    v20 = 2654435761 * self->_legID;
  else
    v20 = 0;
  return v30 ^ v31 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v15 ^ v20;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  int v5;
  GEOCompanionDriveStep *driveStep;
  uint64_t v7;
  GEOCompanionWalkStep *walkStep;
  uint64_t v9;
  GEOCompanionFerryStep *ferryStep;
  uint64_t v11;
  int v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  GEOCompanionGenericStep *genericStep;
  uint64_t v24;
  GEOCompanionCyclingStep *cyclingStep;
  uint64_t v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t k;
  GEOStopWaypoint *stopWaypoint;
  uint64_t v33;
  int v34;
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
  _BYTE v47[128];
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  v5 = *((_DWORD *)v4 + 39);
  if ((v5 & 0x40) != 0)
  {
    self->_stepID = *((_DWORD *)v4 + 37);
    *(_DWORD *)&self->_flags |= 0x40u;
    v5 = *((_DWORD *)v4 + 39);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 0x80) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((v5 & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_distance = *((_DWORD *)v4 + 32);
  *(_DWORD *)&self->_flags |= 2u;
  if ((*((_DWORD *)v4 + 39) & 0x80) != 0)
  {
LABEL_4:
    self->_time = *((_DWORD *)v4 + 38);
    *(_DWORD *)&self->_flags |= 0x80u;
  }
LABEL_5:
  if (*((_QWORD *)v4 + 10))
    -[GEOCompanionStep setRoadName:](self, "setRoadName:");
  driveStep = self->_driveStep;
  v7 = *((_QWORD *)v4 + 3);
  if (driveStep)
  {
    if (v7)
      -[GEOCompanionDriveStep mergeFrom:](driveStep, "mergeFrom:");
  }
  else if (v7)
  {
    -[GEOCompanionStep setDriveStep:](self, "setDriveStep:");
  }
  walkStep = self->_walkStep;
  v9 = *((_QWORD *)v4 + 13);
  if (walkStep)
  {
    if (v9)
      -[GEOCompanionWalkStep mergeFrom:](walkStep, "mergeFrom:");
  }
  else if (v9)
  {
    -[GEOCompanionStep setWalkStep:](self, "setWalkStep:");
  }
  ferryStep = self->_ferryStep;
  v11 = *((_QWORD *)v4 + 4);
  if (ferryStep)
  {
    if (v11)
      -[GEOCompanionFerryStep mergeFrom:](ferryStep, "mergeFrom:");
  }
  else if (v11)
  {
    -[GEOCompanionStep setFerryStep:](self, "setFerryStep:");
  }
  v12 = *((_DWORD *)v4 + 39);
  if ((v12 & 0x20) != 0)
  {
    self->_startCoordinateIndex = *((_DWORD *)v4 + 36);
    *(_DWORD *)&self->_flags |= 0x20u;
    v12 = *((_DWORD *)v4 + 39);
    if ((v12 & 0x10) == 0)
    {
LABEL_27:
      if ((v12 & 4) == 0)
        goto LABEL_29;
      goto LABEL_28;
    }
  }
  else if ((v12 & 0x10) == 0)
  {
    goto LABEL_27;
  }
  self->_maneuverStartCoordinateIndex = *((_DWORD *)v4 + 35);
  *(_DWORD *)&self->_flags |= 0x10u;
  if ((*((_DWORD *)v4 + 39) & 4) != 0)
  {
LABEL_28:
    self->_endCoordinateIndex = *((_DWORD *)v4 + 33);
    *(_DWORD *)&self->_flags |= 4u;
  }
LABEL_29:
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v13 = *((id *)v4 + 7);
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v44;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v44 != v16)
          objc_enumerationMutation(v13);
        -[GEOCompanionStep addInstructionWithAlternatives:](self, "addInstructionWithAlternatives:", *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * i));
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
    }
    while (v15);
  }

  if (*((_QWORD *)v4 + 8))
    -[GEOCompanionStep setListInstruction:](self, "setListInstruction:");
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v18 = *((id *)v4 + 6);
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v40;
    do
    {
      for (j = 0; j != v20; ++j)
      {
        if (*(_QWORD *)v40 != v21)
          objc_enumerationMutation(v18);
        -[GEOCompanionStep addGuidanceEvent:](self, "addGuidanceEvent:", *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * j));
      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
    }
    while (v20);
  }

  if (*((_QWORD *)v4 + 12))
    -[GEOCompanionStep setUpdateID:](self, "setUpdateID:");
  genericStep = self->_genericStep;
  v24 = *((_QWORD *)v4 + 5);
  if (genericStep)
  {
    if (v24)
      -[GEOCompanionGenericStep mergeFrom:](genericStep, "mergeFrom:");
  }
  else if (v24)
  {
    -[GEOCompanionStep setGenericStep:](self, "setGenericStep:");
  }
  cyclingStep = self->_cyclingStep;
  v26 = *((_QWORD *)v4 + 2);
  if (cyclingStep)
  {
    if (v26)
      -[GEOCompanionCyclingStep mergeFrom:](cyclingStep, "mergeFrom:");
  }
  else if (v26)
  {
    -[GEOCompanionStep setCyclingStep:](self, "setCyclingStep:");
  }
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v27 = *((id *)v4 + 9);
  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v36;
    do
    {
      for (k = 0; k != v29; ++k)
      {
        if (*(_QWORD *)v36 != v30)
          objc_enumerationMutation(v27);
        -[GEOCompanionStep addRoadDescriptions:](self, "addRoadDescriptions:", *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * k), (_QWORD)v35);
      }
      v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
    }
    while (v29);
  }

  stopWaypoint = self->_stopWaypoint;
  v33 = *((_QWORD *)v4 + 11);
  if (stopWaypoint)
  {
    if (v33)
      -[GEOStopWaypoint mergeFrom:](stopWaypoint, "mergeFrom:");
  }
  else if (v33)
  {
    -[GEOCompanionStep setStopWaypoint:](self, "setStopWaypoint:");
  }
  v34 = *((_DWORD *)v4 + 39);
  if ((v34 & 1) != 0)
  {
    self->_distanceMeters = *((float *)v4 + 31);
    *(_DWORD *)&self->_flags |= 1u;
    v34 = *((_DWORD *)v4 + 39);
  }
  if ((v34 & 8) != 0)
  {
    self->_legID = *((_DWORD *)v4 + 34);
    *(_DWORD *)&self->_flags |= 8u;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_walkStep, 0);
  objc_storeStrong((id *)&self->_updateID, 0);
  objc_storeStrong((id *)&self->_stopWaypoint, 0);
  objc_storeStrong((id *)&self->_roadName, 0);
  objc_storeStrong((id *)&self->_roadDescriptions, 0);
  objc_storeStrong((id *)&self->_listInstruction, 0);
  objc_storeStrong((id *)&self->_instructionWithAlternatives, 0);
  objc_storeStrong((id *)&self->_guidanceEvents, 0);
  objc_storeStrong((id *)&self->_genericStep, 0);
  objc_storeStrong((id *)&self->_ferryStep, 0);
  objc_storeStrong((id *)&self->_driveStep, 0);
  objc_storeStrong((id *)&self->_cyclingStep, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

- (id)instanceCompatibleWithProtocolVersion:(unint64_t)a3
{
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  _BOOL4 v15;
  NSObject *v16;
  objc_class *v17;
  void *v18;
  NSObject *v19;
  objc_class *v20;
  void *v21;
  void *v22;
  void *v23;
  GEOCompanionStep *v24;
  NSObject *v25;
  objc_class *v26;
  void *v27;
  GEOCompanionStep *v28;
  int v30;
  void *v31;
  __int16 v32;
  GEOCompanionStep *v33;
  __int16 v34;
  unint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  if (a3 >= 6)
  {
    -[GEOCompanionStep hasCyclingStep](self, "hasCyclingStep");
    goto LABEL_20;
  }
  if (-[GEOCompanionStep hasDriveStep](self, "hasDriveStep"))
  {
    -[GEOCompanionStep driveStep](self, "driveStep");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "maneuverType");

    if (v6 == 88)
    {
      -[GEOCompanionStep driveStep](self, "driveStep");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)objc_msgSend(v7, "copy");

      objc_msgSend(v8, "setManeuverType:", 4);
      -[GEOCompanionStep setDriveStep:](self, "setDriveStep:", v8);
LABEL_12:

      goto LABEL_13;
    }
  }
  if (-[GEOCompanionStep hasWalkStep](self, "hasWalkStep"))
  {
    -[GEOCompanionStep walkStep](self, "walkStep");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "maneuverType");

    if (v10 == 88)
    {
      -[GEOCompanionStep walkStep](self, "walkStep");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)objc_msgSend(v11, "copy");

      objc_msgSend(v8, "setManeuverType:", 4);
      -[GEOCompanionStep setWalkStep:](self, "setWalkStep:", v8);
      goto LABEL_12;
    }
  }
  if (-[GEOCompanionStep hasCyclingStep](self, "hasCyclingStep"))
  {
    -[GEOCompanionStep cyclingStep](self, "cyclingStep");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "maneuverType");

    if (v13 == 88)
    {
      -[GEOCompanionStep cyclingStep](self, "cyclingStep");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)objc_msgSend(v14, "copy");

      objc_msgSend(v8, "setManeuverType:", 4);
      -[GEOCompanionStep setCyclingStep:](self, "setCyclingStep:", v8);
      goto LABEL_12;
    }
  }
LABEL_13:
  v15 = -[GEOCompanionStep hasCyclingStep](self, "hasCyclingStep");
  if (a3 <= 3 && v15)
  {
    GEOFindOrCreateLog("com.apple.GeoServices", "CompanionCompatibility");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      v17 = (objc_class *)objc_opt_class();
      NSStringFromClass(v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = 138412802;
      v31 = v18;
      v32 = 2048;
      v33 = self;
      v34 = 2048;
      v35 = a3;
      _os_log_impl(&dword_1885A9000, v16, OS_LOG_TYPE_DEBUG, "%@<%p> is not compatible with protocol version %lu", (uint8_t *)&v30, 0x20u);

    }
    GEOFindOrCreateLog("com.apple.GeoServices", "CompanionCompatibility");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      v20 = (objc_class *)objc_opt_class();
      NSStringFromClass(v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = 138412546;
      v31 = v21;
      v32 = 2048;
      v33 = self;
      _os_log_impl(&dword_1885A9000, v19, OS_LOG_TYPE_INFO, "%@<%p> | Converting to generic step", (uint8_t *)&v30, 0x16u);

    }
    -[GEOCompanionStep cyclingStep](self, "cyclingStep");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    +[GEOCompanionGenericStep genericStepForCyclingStep:protocolVersion:](GEOCompanionGenericStep, "genericStepForCyclingStep:protocolVersion:", v22, a3);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    -[GEOCompanionStep setCyclingStep:](self, "setCyclingStep:", 0);
    -[GEOCompanionStep setGenericStep:](self, "setGenericStep:", v23);
    v24 = self;

    return self;
  }
LABEL_20:
  GEOFindOrCreateLog("com.apple.GeoServices", "CompanionCompatibility");
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
  {
    v26 = (objc_class *)objc_opt_class();
    NSStringFromClass(v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 138412802;
    v31 = v27;
    v32 = 2048;
    v33 = self;
    v34 = 2048;
    v35 = a3;
    _os_log_impl(&dword_1885A9000, v25, OS_LOG_TYPE_DEBUG, "%@<%p> is compatible with protocol version %lu", (uint8_t *)&v30, 0x20u);

  }
  v28 = self;
  return self;
}

- (GEOCompanionStep)initWithStep:(id)a3 route:(id)a4 stringFormatter:(id)a5
{
  id v8;
  id v9;
  id v10;
  GEOCompanionStep *v11;
  void *v12;
  void *v13;
  double v14;
  uint64_t v15;
  double v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  void *i;
  void *v24;
  unsigned int v25;
  unsigned int v26;
  void *v27;
  void *v28;
  void *v29;
  GEOCompanionDriveStep *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  GEOCompanionWalkStep *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  double v42;
  GEOCompanionWalkStep *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  GEOCompanionCyclingStep *v54;
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
  void *v65;
  GEOCompanionStep *v66;
  void *v68;
  _QWORD v69[4];
  GEOCompanionWalkStep *v70;
  _QWORD v71[4];
  GEOCompanionWalkStep *v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  objc_super v77;
  _BYTE v78[128];
  uint64_t v79;

  v79 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v77.receiver = self;
  v77.super_class = (Class)GEOCompanionStep;
  v11 = -[GEOCompanionStep init](&v77, sel_init);
  if (v11)
  {
    -[GEOCompanionStep setStepID:](v11, "setStepID:", objc_msgSend(v8, "stepIndex"));
    -[GEOCompanionStep setLegID:](v11, "setLegID:", objc_msgSend(v9, "legIndexForStepIndex:", objc_msgSend(v8, "stepIndex")));
    objc_msgSend(v8, "transitStep");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "updateIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOCompanionStep setUpdateID:](v11, "setUpdateID:", v13);

    objc_msgSend(v8, "distance");
    LODWORD(v15) = vcvtad_u64_f64(v14);
    -[GEOCompanionStep setDistance:](v11, "setDistance:", v15);
    objc_msgSend(v8, "distance");
    *(float *)&v16 = v16;
    -[GEOCompanionStep setDistanceMeters:](v11, "setDistanceMeters:", v16);
    -[GEOCompanionStep setTime:](v11, "setTime:", objc_msgSend(v8, "duration"));
    -[GEOCompanionStep setStartCoordinateIndex:](v11, "setStartCoordinateIndex:", objc_msgSend(v8, "startPointIndex"));
    -[GEOCompanionStep setManeuverStartCoordinateIndex:](v11, "setManeuverStartCoordinateIndex:", objc_msgSend(v8, "maneuverStartPointIndex"));
    -[GEOCompanionStep setEndCoordinateIndex:](v11, "setEndCoordinateIndex:", objc_msgSend(v8, "endPointIndex"));
    objc_msgSend(v8, "geoStep");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = 0u;
    v74 = 0u;
    v75 = 0u;
    v76 = 0u;
    objc_msgSend(v9, "legs");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (id)objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v73, v78, 16);
    if (v19)
    {
      v68 = v17;
      v20 = v10;
      v21 = v9;
      v22 = *(_QWORD *)v74;
      while (2)
      {
        for (i = 0; i != v19; i = (char *)i + 1)
        {
          if (*(_QWORD *)v74 != v22)
            objc_enumerationMutation(v18);
          v24 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * (_QWORD)i);
          v25 = -[GEOCompanionStep stepID](v11, "stepID");
          if (objc_msgSend(v24, "startStepIndex") <= (unint64_t)v25)
          {
            v26 = -[GEOCompanionStep stepID](v11, "stepID");
            if (objc_msgSend(v24, "endStepIndex") >= (unint64_t)v26)
            {
              v19 = v24;
              goto LABEL_13;
            }
          }
        }
        v19 = (id)objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v73, v78, 16);
        if (v19)
          continue;
        break;
      }
LABEL_13:
      v9 = v21;
      v10 = v20;
      v17 = v68;
    }

    objc_msgSend(v17, "guidanceEvents");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOCompanionStep setGuidanceEvents:](v11, "setGuidanceEvents:", v27);

    objc_msgSend(v17, "roadDescriptions");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOCompanionStep setRoadDescriptions:](v11, "setRoadDescriptions:", v28);

    objc_msgSend(v17, "stopWaypoint");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOCompanionStep setStopWaypoint:](v11, "setStopWaypoint:", v29);

    switch(objc_msgSend(v8, "routeSegmentType"))
    {
      case 1:
        v30 = objc_alloc_init(GEOCompanionDriveStep);
        if (objc_msgSend(v17, "hasManeuverType"))
          -[GEOCompanionDriveStep setManeuverType:](v30, "setManeuverType:", objc_msgSend(v17, "maneuverType"));
        objc_msgSend(v17, "maneuverNames");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = (void *)objc_msgSend(v31, "mutableCopy");
        -[GEOCompanionDriveStep setManeuverNames:](v30, "setManeuverNames:", v32);

        objc_msgSend(v17, "signposts");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = (void *)objc_msgSend(v33, "mutableCopy");
        -[GEOCompanionDriveStep setSignposts:](v30, "setSignposts:", v34);

        if (objc_msgSend(v17, "hasToFreeway"))
          -[GEOCompanionDriveStep setToFreeway:](v30, "setToFreeway:", objc_msgSend(v17, "toFreeway"));
        if (objc_msgSend(v17, "hasExitNumber"))
        {
          objc_msgSend(v17, "exitNumber");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          -[GEOCompanionDriveStep setExitNumber:](v30, "setExitNumber:", v35);

        }
        if (objc_msgSend(v17, "hasJunctionType"))
          -[GEOCompanionDriveStep setJunctionType:](v30, "setJunctionType:", objc_msgSend(v17, "junctionType"));
        if (objc_msgSend(v17, "junctionElementsCount"))
          -[GEOCompanionDriveStep setJunctionElements:count:](v30, "setJunctionElements:count:", objc_msgSend(v17, "junctionElements"), objc_msgSend(v17, "junctionElementsCount"));
        -[GEOCompanionDriveStep setDrivingSide:](v30, "setDrivingSide:", objc_msgSend(v8, "drivingSide"));
        v71[0] = MEMORY[0x1E0C809B0];
        v71[1] = 3221225472;
        v71[2] = __72__GEOCompanionStep_CompanionExtras__initWithStep_route_stringFormatter___block_invoke;
        v71[3] = &unk_1E1C0DA60;
        v36 = v30;
        v72 = v36;
        objc_msgSend(v17, "shieldInfo:", v71);
        if (objc_msgSend(v17, "hasArtworkOverride"))
        {
          objc_msgSend(v17, "artworkOverride");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          -[GEOCompanionWalkStep setArtworkOverride:](v36, "setArtworkOverride:", v37);

        }
        if (objc_msgSend(v17, "hasEvInfo"))
        {
          objc_msgSend(v17, "evInfo");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          -[GEOCompanionWalkStep setEvInfo:](v36, "setEvInfo:", v38);

        }
        if (objc_msgSend(v17, "maneuverType") == 82
          || objc_msgSend(v17, "maneuverType") == 83
          || objc_msgSend(v17, "maneuverType") == 84)
        {
          objc_msgSend(v19, "destination");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "chargingInfo");
          v40 = (void *)objc_claimAutoreleasedReturnValue();

          if (v40)
          {
            v41 = (void *)objc_opt_new();
            objc_msgSend(v40, "chargingTime");
            objc_msgSend(v41, "setChargingTime:", v42);
            objc_msgSend(v41, "setGainedBatteryPercentage:", 0.0);
            objc_msgSend(v41, "setGainedBatteryCharge:", 0);
            objc_msgSend(v41, "setGainedTravelRange:", 0);
            -[GEOCompanionWalkStep setChargingInfo:](v36, "setChargingInfo:", v41);

          }
        }
        -[GEOCompanionStep setDriveStep:](v11, "setDriveStep:", v36);
        v43 = v72;
        goto LABEL_68;
      case 2:
        v36 = objc_alloc_init(GEOCompanionWalkStep);
        if (objc_msgSend(v17, "hasManeuverType"))
          -[GEOCompanionWalkStep setManeuverType:](v36, "setManeuverType:", objc_msgSend(v17, "maneuverType"));
        objc_msgSend(v17, "maneuverNames");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = (void *)objc_msgSend(v48, "mutableCopy");
        -[GEOCompanionWalkStep setManeuverNames:](v36, "setManeuverNames:", v49);

        objc_msgSend(v17, "signposts");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = (void *)objc_msgSend(v50, "mutableCopy");
        -[GEOCompanionWalkStep setSignposts:](v36, "setSignposts:", v51);

        if (objc_msgSend(v17, "hasJunctionType"))
          -[GEOCompanionWalkStep setJunctionType:](v36, "setJunctionType:", objc_msgSend(v17, "junctionType"));
        if (objc_msgSend(v17, "junctionElementsCount"))
          -[GEOCompanionWalkStep setJunctionElements:count:](v36, "setJunctionElements:count:", objc_msgSend(v17, "junctionElements"), objc_msgSend(v17, "junctionElementsCount"));
        if (objc_msgSend(v17, "hasArtworkOverride"))
        {
          objc_msgSend(v17, "artworkOverride");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          -[GEOCompanionWalkStep setArtworkOverride:](v36, "setArtworkOverride:", v52);

        }
        -[GEOCompanionStep setWalkStep:](v11, "setWalkStep:", v36);
        goto LABEL_69;
      case 3:
        v36 = objc_alloc_init(GEOCompanionFerryStep);
        if (objc_msgSend(v17, "hasManeuverType"))
          -[GEOCompanionWalkStep setManeuverType:](v36, "setManeuverType:", objc_msgSend(v17, "maneuverType"));
        objc_msgSend(v17, "artworkOverride");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        -[GEOCompanionWalkStep setArtworkOverride:](v36, "setArtworkOverride:", v53);

        -[GEOCompanionStep setFerryStep:](v11, "setFerryStep:", v36);
        goto LABEL_69;
      case 4:
        v54 = objc_alloc_init(GEOCompanionCyclingStep);
        if (objc_msgSend(v17, "hasManeuverType"))
          -[GEOCompanionCyclingStep setManeuverType:](v54, "setManeuverType:", objc_msgSend(v17, "maneuverType"));
        objc_msgSend(v17, "maneuverNames");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = (void *)objc_msgSend(v55, "mutableCopy");
        -[GEOCompanionCyclingStep setManeuverNames:](v54, "setManeuverNames:", v56);

        objc_msgSend(v17, "signposts");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        v58 = (void *)objc_msgSend(v57, "mutableCopy");
        -[GEOCompanionCyclingStep setSignposts:](v54, "setSignposts:", v58);

        if (objc_msgSend(v17, "hasToFreeway"))
          -[GEOCompanionCyclingStep setToFreeway:](v54, "setToFreeway:", objc_msgSend(v17, "toFreeway"));
        if (objc_msgSend(v17, "hasExitNumber"))
        {
          objc_msgSend(v17, "exitNumber");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          -[GEOCompanionCyclingStep setExitNumber:](v54, "setExitNumber:", v59);

        }
        if (objc_msgSend(v17, "hasJunctionType"))
          -[GEOCompanionCyclingStep setJunctionType:](v54, "setJunctionType:", objc_msgSend(v17, "junctionType"));
        if (objc_msgSend(v17, "junctionElementsCount"))
          -[GEOCompanionCyclingStep setJunctionElements:count:](v54, "setJunctionElements:count:", objc_msgSend(v17, "junctionElements"), objc_msgSend(v17, "junctionElementsCount"));
        -[GEOCompanionCyclingStep setDrivingSide:](v54, "setDrivingSide:", objc_msgSend(v8, "drivingSide"));
        v69[0] = MEMORY[0x1E0C809B0];
        v69[1] = 3221225472;
        v69[2] = __72__GEOCompanionStep_CompanionExtras__initWithStep_route_stringFormatter___block_invoke_2;
        v69[3] = &unk_1E1C0DA60;
        v36 = v54;
        v70 = v36;
        objc_msgSend(v17, "shieldInfo:", v69);
        if (objc_msgSend(v17, "hasArtworkOverride"))
        {
          objc_msgSend(v17, "artworkOverride");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          -[GEOCompanionWalkStep setArtworkOverride:](v36, "setArtworkOverride:", v60);

        }
        -[GEOCompanionStep setCyclingStep:](v11, "setCyclingStep:", v36);
        v43 = v70;
LABEL_68:

        goto LABEL_69;
      case 5:
      case 6:
        goto LABEL_70;
      default:
        v36 = objc_alloc_init(GEOCompanionGenericStep);
        -[GEOCompanionWalkStep setTransportType:](v36, "setTransportType:", objc_msgSend(v8, "transportType"));
        if (objc_msgSend(v17, "hasManeuverType"))
          -[GEOCompanionWalkStep setManeuverType:](v36, "setManeuverType:", objc_msgSend(v17, "maneuverType"));
        objc_msgSend(v17, "maneuverNames");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = (void *)objc_msgSend(v44, "mutableCopy");
        -[GEOCompanionWalkStep setManeuverNames:](v36, "setManeuverNames:", v45);

        objc_msgSend(v17, "signposts");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = (void *)objc_msgSend(v46, "mutableCopy");
        -[GEOCompanionWalkStep setSignposts:](v36, "setSignposts:", v47);

        if (objc_msgSend(v17, "hasJunctionType"))
          -[GEOCompanionWalkStep setJunctionType:](v36, "setJunctionType:", objc_msgSend(v17, "junctionType"));
        if (objc_msgSend(v17, "junctionElementsCount"))
          -[GEOCompanionWalkStep setJunctionElements:count:](v36, "setJunctionElements:count:", objc_msgSend(v17, "junctionElements"), objc_msgSend(v17, "junctionElementsCount"));
        -[GEOCompanionStep setGenericStep:](v11, "setGenericStep:", v36);
LABEL_69:

LABEL_70:
        objc_msgSend(v17, "roadName");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        if (v61)
          -[GEOCompanionStep setRoadName:](v11, "setRoadName:", v61);
        objc_msgSend(v10, "listInstructionForStep:", v8);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        v63 = (void *)objc_msgSend(v62, "mutableCopy");
        -[GEOCompanionStep setListInstruction:](v11, "setListInstruction:", v63);

        objc_msgSend(v10, "signInstructionsForStep:", v8);
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        v65 = (void *)objc_msgSend(v64, "mutableCopy");
        -[GEOCompanionStep setInstructionWithAlternatives:](v11, "setInstructionWithAlternatives:", v65);

        v66 = v11;
        break;
    }
  }

  return v11;
}

void __72__GEOCompanionStep_CompanionExtras__initWithStep_route_stringFormatter___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  id v7;

  if (a3)
  {
    v5 = *(void **)(a1 + 32);
    v6 = a3;
    objc_msgSend(v5, "setShieldType:", a2);
    v7 = (id)objc_msgSend(v6, "copy");

    objc_msgSend(*(id *)(a1 + 32), "setShield:", v7);
  }
}

void __72__GEOCompanionStep_CompanionExtras__initWithStep_route_stringFormatter___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  id v7;

  if (a3)
  {
    v5 = *(void **)(a1 + 32);
    v6 = a3;
    objc_msgSend(v5, "setShieldType:", a2);
    v7 = (id)objc_msgSend(v6, "copy");

    objc_msgSend(*(id *)(a1 + 32), "setShield:", v7);
  }
}

- (id)maneuverStep
{
  void *v3;

  if (-[GEOCompanionStep hasDriveStep](self, "hasDriveStep"))
  {
    -[GEOCompanionStep driveStep](self, "driveStep");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (-[GEOCompanionStep hasWalkStep](self, "hasWalkStep"))
  {
    -[GEOCompanionStep walkStep](self, "walkStep");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (-[GEOCompanionStep hasCyclingStep](self, "hasCyclingStep"))
  {
    -[GEOCompanionStep cyclingStep](self, "cyclingStep");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (-[GEOCompanionStep hasFerryStep](self, "hasFerryStep"))
  {
    -[GEOCompanionStep ferryStep](self, "ferryStep");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (-[GEOCompanionStep hasGenericStep](self, "hasGenericStep"))
  {
    -[GEOCompanionStep genericStep](self, "genericStep");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)geoStep
{
  GEOStep *v3;
  uint64_t v4;
  float v5;
  float v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
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
  void *v29;
  void *v30;
  void *v31;
  void *v32;

  v3 = objc_alloc_init(GEOStep);
  -[GEOStep setStepID:](v3, "setStepID:", -[GEOCompanionStep stepID](self, "stepID"));
  if (-[GEOStep hasDistanceMeters](v3, "hasDistanceMeters"))
  {
    -[GEOStep distanceMeters](v3, "distanceMeters");
    v6 = v5;
  }
  else
  {
    v6 = (float)-[GEOStep distance](v3, "distance");
  }
  LODWORD(v4) = vcvtas_u32_f32(v6);
  -[GEOStep setDistance:](v3, "setDistance:", v4);
  *(float *)&v7 = v6;
  -[GEOStep setDistanceMeters:](v3, "setDistanceMeters:", v7);
  -[GEOStep setExpectedTime:](v3, "setExpectedTime:", -[GEOCompanionStep time](self, "time"));
  -[GEOStep setManeuverEndBasicIndex:](v3, "setManeuverEndBasicIndex:", -[GEOCompanionStep endCoordinateIndex](self, "endCoordinateIndex"));
  -[GEOCompanionStep roadDescriptions](self, "roadDescriptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");
  -[GEOStep setRoadDescriptions:](v3, "setRoadDescriptions:", v9);

  -[GEOCompanionStep stopWaypoint](self, "stopWaypoint");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOStep setStopWaypoint:](v3, "setStopWaypoint:", v10);

  -[GEOCompanionStep maneuverStep](self, "maneuverStep");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    if (objc_msgSend(v11, "hasManeuverType"))
      -[GEOStep setManeuverType:](v3, "setManeuverType:", objc_msgSend(v12, "maneuverType"));
    objc_msgSend(v12, "maneuverNames");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v13, "mutableCopy");
    -[GEOStep setManeuverNames:](v3, "setManeuverNames:", v14);

    objc_msgSend(v12, "signposts");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v15, "mutableCopy");
    -[GEOStep setSignposts:](v3, "setSignposts:", v16);

    if (objc_msgSend(v12, "hasJunctionType"))
      -[GEOStep setJunctionType:](v3, "setJunctionType:", objc_msgSend(v12, "junctionType"));
    -[GEOStep setJunctionElements:count:](v3, "setJunctionElements:count:", objc_msgSend(v12, "junctionElements"), objc_msgSend(v12, "junctionElementsCount"));
    -[GEOCompanionStep driveStep](self, "driveStep");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v17)
    {
      if (objc_msgSend(v17, "hasExitNumber"))
      {
        objc_msgSend(v18, "exitNumber");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = (void *)objc_msgSend(v19, "copy");
        -[GEOStep setExitNumber:](v3, "setExitNumber:", v20);

      }
      if (objc_msgSend(v18, "hasToFreeway"))
        -[GEOStep setToFreeway:](v3, "setToFreeway:", objc_msgSend(v18, "toFreeway"));
      if (objc_msgSend(v18, "drivingSide"))
        -[GEOStep setOverrideDrivingSide:](v3, "setOverrideDrivingSide:", objc_msgSend(v18, "drivingSide"));
      if (objc_msgSend(v18, "hasChargingInfo"))
      {
        objc_msgSend(v18, "chargingInfo");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[GEOStep setChargingInfo:](v3, "setChargingInfo:", v21);

      }
      if (objc_msgSend(v18, "hasEvInfo"))
      {
        objc_msgSend(v18, "evInfo");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[GEOStep setEvInfo:](v3, "setEvInfo:", v22);

      }
    }
    -[GEOCompanionStep driveStep](self, "driveStep");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "artworkOverride");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      -[GEOStep setArtworkOverride:](v3, "setArtworkOverride:", v24);
    }
    else
    {
      -[GEOCompanionStep walkStep](self, "walkStep");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "artworkOverride");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (v26)
      {
        -[GEOStep setArtworkOverride:](v3, "setArtworkOverride:", v26);
      }
      else
      {
        -[GEOCompanionStep ferryStep](self, "ferryStep");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "artworkOverride");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[GEOStep setArtworkOverride:](v3, "setArtworkOverride:", v28);

      }
    }

  }
  -[GEOCompanionStep guidanceEvents](self, "guidanceEvents");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (void *)objc_msgSend(v29, "mutableCopy");
  -[GEOStep setGuidanceEvents:](v3, "setGuidanceEvents:", v30);

  -[GEOCompanionStep listInstruction](self, "listInstruction");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (void *)objc_msgSend(v31, "copy");
  -[GEOStep setInstructions:](v3, "setInstructions:", v32);

  return v3;
}

@end
