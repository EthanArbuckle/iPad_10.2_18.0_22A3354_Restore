@implementation GEOLogMsgEventVLFUsage

- (GEOLogMsgEventVLFUsage)init
{
  GEOLogMsgEventVLFUsage *v2;
  GEOLogMsgEventVLFUsage *v3;
  GEOLogMsgEventVLFUsage *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOLogMsgEventVLFUsage;
  v2 = -[GEOLogMsgEventVLFUsage init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOLogMsgEventVLFUsage)initWithData:(id)a3
{
  GEOLogMsgEventVLFUsage *v3;
  GEOLogMsgEventVLFUsage *v4;
  GEOLogMsgEventVLFUsage *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOLogMsgEventVLFUsage;
  v3 = -[GEOLogMsgEventVLFUsage initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readEntryPoint
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_WORD *)(a1 + 136) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventVLFUsageReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readEntryPoint_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (BOOL)hasEntryPoint
{
  -[GEOLogMsgEventVLFUsage _readEntryPoint]((uint64_t)self);
  return self->_entryPoint != 0;
}

- (GEOVLFEntryPoint)entryPoint
{
  -[GEOLogMsgEventVLFUsage _readEntryPoint]((uint64_t)self);
  return self->_entryPoint;
}

- (void)setEntryPoint:(id)a3
{
  *(_WORD *)&self->_flags |= 0x2100u;
  objc_storeStrong((id *)&self->_entryPoint, a3);
}

- (unsigned)sessionTimeMs
{
  return self->_sessionTimeMs;
}

- (void)setSessionTimeMs:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x2004u;
  self->_sessionTimeMs = a3;
}

- (void)setHasSessionTimeMs:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8196;
  else
    v3 = 0x2000;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFB | v3;
}

- (BOOL)hasSessionTimeMs
{
  return (*(_WORD *)&self->_flags >> 2) & 1;
}

- (void)_readLocalizationDetails
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_WORD *)(a1 + 136) & 0x800) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventVLFUsageReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLocalizationDetails_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (NSMutableArray)localizationDetails
{
  -[GEOLogMsgEventVLFUsage _readLocalizationDetails]((uint64_t)self);
  return self->_localizationDetails;
}

- (void)setLocalizationDetails:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *localizationDetails;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x800u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
  localizationDetails = self->_localizationDetails;
  self->_localizationDetails = v4;

}

- (void)clearLocalizationDetails
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x800u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
  -[NSMutableArray removeAllObjects](self->_localizationDetails, "removeAllObjects");
}

- (void)addLocalizationDetails:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOLogMsgEventVLFUsage _readLocalizationDetails]((uint64_t)self);
  -[GEOLogMsgEventVLFUsage _addNoFlagsLocalizationDetails:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x800u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
}

- (void)_addNoFlagsLocalizationDetails:(uint64_t)a1
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

- (unint64_t)localizationDetailsCount
{
  -[GEOLogMsgEventVLFUsage _readLocalizationDetails]((uint64_t)self);
  return -[NSMutableArray count](self->_localizationDetails, "count");
}

- (id)localizationDetailsAtIndex:(unint64_t)a3
{
  -[GEOLogMsgEventVLFUsage _readLocalizationDetails]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_localizationDetails, "objectAtIndex:", a3);
}

+ (Class)localizationDetailsType
{
  return (Class)objc_opt_class();
}

- (int)finalState
{
  os_unfair_lock_s *p_readerLock;
  __int16 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 2) != 0)
    return self->_finalState;
  else
    return 0;
}

- (void)setFinalState:(int)a3
{
  *(_WORD *)&self->_flags |= 0x2002u;
  self->_finalState = a3;
}

- (void)setHasFinalState:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8194;
  else
    v3 = 0x2000;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasFinalState
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
}

- (id)finalStateAsString:(int)a3
{
  if (a3 < 5)
    return off_1E1C23A70[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsFinalState:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VLFFinalState_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VLFFinalState_FAILED_TO_INITIALIZE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VLFFinalState_USER_ABANDONED")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VLFFinalState_FAILED")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("VLFFinalState_SUCCEEDED")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_readPostFusionCorrection
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_WORD *)(a1 + 136) & 0x1000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventVLFUsageReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPostFusionCorrection_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (BOOL)hasPostFusionCorrection
{
  -[GEOLogMsgEventVLFUsage _readPostFusionCorrection]((uint64_t)self);
  return self->_postFusionCorrection != 0;
}

- (GEOVLFCorrection)postFusionCorrection
{
  -[GEOLogMsgEventVLFUsage _readPostFusionCorrection]((uint64_t)self);
  return self->_postFusionCorrection;
}

- (void)setPostFusionCorrection:(id)a3
{
  *(_WORD *)&self->_flags |= 0x3000u;
  objc_storeStrong((id *)&self->_postFusionCorrection, a3);
}

- (unsigned)timeRoundedToHour
{
  return self->_timeRoundedToHour;
}

- (void)setTimeRoundedToHour:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x2008u;
  self->_timeRoundedToHour = a3;
}

- (void)setHasTimeRoundedToHour:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8200;
  else
    v3 = 0x2000;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFF7 | v3;
}

- (BOOL)hasTimeRoundedToHour
{
  return (*(_WORD *)&self->_flags >> 3) & 1;
}

- (GEOVLFPositionContextClassification)initialPositionContextClassification
{
  *retstr = *(GEOVLFPositionContextClassification *)&self->_type;
  return self;
}

- (void)setInitialPositionContextClassification:(GEOVLFPositionContextClassification *)a3
{
  uint64_t v3;

  *(_WORD *)&self->_flags |= 0x2001u;
  v3 = *(_QWORD *)&a3->_type;
  *(_OWORD *)&self->_initialPositionContextClassification._indoorProbability = *(_OWORD *)&a3->_indoorProbability;
  *(_QWORD *)&self->_initialPositionContextClassification._type = v3;
}

- (void)setHasInitialPositionContextClassification:(BOOL)a3
{
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFE | a3 | 0x2000;
}

- (BOOL)hasInitialPositionContextClassification
{
  return *(_WORD *)&self->_flags & 1;
}

- (void)_readInitializationFailureDetails
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_WORD *)(a1 + 136) & 0x400) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventVLFUsageReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readInitializationFailureDetails_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (BOOL)hasInitializationFailureDetails
{
  -[GEOLogMsgEventVLFUsage _readInitializationFailureDetails]((uint64_t)self);
  return self->_initializationFailureDetails != 0;
}

- (GEOVLFInitializationFailureDetails)initializationFailureDetails
{
  -[GEOLogMsgEventVLFUsage _readInitializationFailureDetails]((uint64_t)self);
  return self->_initializationFailureDetails;
}

- (void)setInitializationFailureDetails:(id)a3
{
  *(_WORD *)&self->_flags |= 0x2400u;
  objc_storeStrong((id *)&self->_initializationFailureDetails, a3);
}

- (void)_readArStates
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_WORD *)(a1 + 136) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventVLFUsageReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readArStates_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (NSMutableArray)arStates
{
  -[GEOLogMsgEventVLFUsage _readArStates]((uint64_t)self);
  return self->_arStates;
}

- (void)setArStates:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *arStates;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
  arStates = self->_arStates;
  self->_arStates = v4;

}

- (void)clearArStates
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
  -[NSMutableArray removeAllObjects](self->_arStates, "removeAllObjects");
}

- (void)addArState:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOLogMsgEventVLFUsage _readArStates]((uint64_t)self);
  -[GEOLogMsgEventVLFUsage _addNoFlagsArState:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
}

- (void)_addNoFlagsArState:(uint64_t)a1
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

- (unint64_t)arStatesCount
{
  -[GEOLogMsgEventVLFUsage _readArStates]((uint64_t)self);
  return -[NSMutableArray count](self->_arStates, "count");
}

- (id)arStateAtIndex:(unint64_t)a3
{
  -[GEOLogMsgEventVLFUsage _readArStates]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_arStates, "objectAtIndex:", a3);
}

+ (Class)arStateType
{
  return (Class)objc_opt_class();
}

- (void)_readDeviceOrientations
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_WORD *)(a1 + 136) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventVLFUsageReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDeviceOrientations_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (NSMutableArray)deviceOrientations
{
  -[GEOLogMsgEventVLFUsage _readDeviceOrientations]((uint64_t)self);
  return self->_deviceOrientations;
}

- (void)setDeviceOrientations:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *deviceOrientations;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
  deviceOrientations = self->_deviceOrientations;
  self->_deviceOrientations = v4;

}

- (void)clearDeviceOrientations
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
  -[NSMutableArray removeAllObjects](self->_deviceOrientations, "removeAllObjects");
}

- (void)addDeviceOrientation:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOLogMsgEventVLFUsage _readDeviceOrientations]((uint64_t)self);
  -[GEOLogMsgEventVLFUsage _addNoFlagsDeviceOrientation:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
}

- (void)_addNoFlagsDeviceOrientation:(uint64_t)a1
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

- (unint64_t)deviceOrientationsCount
{
  -[GEOLogMsgEventVLFUsage _readDeviceOrientations]((uint64_t)self);
  return -[NSMutableArray count](self->_deviceOrientations, "count");
}

- (id)deviceOrientationAtIndex:(unint64_t)a3
{
  -[GEOLogMsgEventVLFUsage _readDeviceOrientations]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_deviceOrientations, "objectAtIndex:", a3);
}

+ (Class)deviceOrientationType
{
  return (Class)objc_opt_class();
}

- (void)_readCrowdsourcingDetails
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_WORD *)(a1 + 136) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventVLFUsageReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCrowdsourcingDetails_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (BOOL)hasCrowdsourcingDetails
{
  -[GEOLogMsgEventVLFUsage _readCrowdsourcingDetails]((uint64_t)self);
  return self->_crowdsourcingDetails != 0;
}

- (GEOVLFCrowdsourcingDetails)crowdsourcingDetails
{
  -[GEOLogMsgEventVLFUsage _readCrowdsourcingDetails]((uint64_t)self);
  return self->_crowdsourcingDetails;
}

- (void)setCrowdsourcingDetails:(id)a3
{
  *(_WORD *)&self->_flags |= 0x2040u;
  objc_storeStrong((id *)&self->_crowdsourcingDetails, a3);
}

- (void)_readInitialLocation
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_WORD *)(a1 + 136) & 0x200) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventVLFUsageReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readInitialLocation_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (BOOL)hasInitialLocation
{
  -[GEOLogMsgEventVLFUsage _readInitialLocation]((uint64_t)self);
  return self->_initialLocation != 0;
}

- (GEOVLFLocation)initialLocation
{
  -[GEOLogMsgEventVLFUsage _readInitialLocation]((uint64_t)self);
  return self->_initialLocation;
}

- (void)setInitialLocation:(id)a3
{
  *(_WORD *)&self->_flags |= 0x2200u;
  objc_storeStrong((id *)&self->_initialLocation, a3);
}

- (void)_readArFailureTypes
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_WORD *)(a1 + 136) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventVLFUsageReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readArFailureTypes_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (BOOL)hasArFailureTypes
{
  -[GEOLogMsgEventVLFUsage _readArFailureTypes]((uint64_t)self);
  return self->_arFailureTypes != 0;
}

- (GEOVLFARFailureTypes)arFailureTypes
{
  -[GEOLogMsgEventVLFUsage _readArFailureTypes]((uint64_t)self);
  return self->_arFailureTypes;
}

- (void)setArFailureTypes:(id)a3
{
  *(_WORD *)&self->_flags |= 0x2010u;
  objc_storeStrong((id *)&self->_arFailureTypes, a3);
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
  v8.super_class = (Class)GEOLogMsgEventVLFUsage;
  -[GEOLogMsgEventVLFUsage description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOLogMsgEventVLFUsage dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgEventVLFUsage _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  const __CFString *v19;
  uint64_t v20;
  __CFString *v21;
  const __CFString *v22;
  void *v23;
  void *v24;
  void *v25;
  const __CFString *v26;
  __int16 v27;
  void *v28;
  const __CFString *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  const __CFString *v34;
  void *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t j;
  void *v41;
  void *v42;
  const __CFString *v43;
  void *v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t k;
  void *v50;
  void *v51;
  const __CFString *v52;
  void *v53;
  void *v54;
  void *v55;
  const __CFString *v56;
  void *v57;
  void *v58;
  void *v59;
  const __CFString *v60;
  void *v61;
  void *v62;
  void *v63;
  const __CFString *v64;
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
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)a1, "entryPoint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v5, "jsonRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = CFSTR("entryPoint");
    }
    else
    {
      objc_msgSend(v5, "dictionaryRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = CFSTR("entry_point");
    }
    objc_msgSend(v4, "setObject:forKey:", v7, v8);

  }
  if ((*(_WORD *)(a1 + 136) & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 128));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v10 = CFSTR("sessionTimeMs");
    else
      v10 = CFSTR("session_time_ms");
    objc_msgSend(v4, "setObject:forKey:", v9, v10);

  }
  if (objc_msgSend(*(id *)(a1 + 96), "count"))
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 96), "count"));
    v74 = 0u;
    v75 = 0u;
    v76 = 0u;
    v77 = 0u;
    v12 = *(id *)(a1 + 96);
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v74, v80, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v75;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v75 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v17, "jsonRepresentation");
          else
            objc_msgSend(v17, "dictionaryRepresentation");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObject:", v18);

        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v74, v80, 16);
      }
      while (v14);
    }

    if (a2)
      v19 = CFSTR("localizationDetails");
    else
      v19 = CFSTR("localization_details");
    objc_msgSend(v4, "setObject:forKey:", v11, v19);

  }
  if ((*(_WORD *)(a1 + 136) & 2) != 0)
  {
    v20 = *(int *)(a1 + 124);
    if (v20 >= 5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 124));
      v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v21 = off_1E1C23A70[v20];
    }
    if (a2)
      v22 = CFSTR("finalState");
    else
      v22 = CFSTR("final_state");
    objc_msgSend(v4, "setObject:forKey:", v21, v22);

  }
  objc_msgSend((id)a1, "postFusionCorrection");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (v23)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v23, "jsonRepresentation");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = CFSTR("postFusionCorrection");
    }
    else
    {
      objc_msgSend(v23, "dictionaryRepresentation");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = CFSTR("post_fusion_correction");
    }
    objc_msgSend(v4, "setObject:forKey:", v25, v26);

  }
  v27 = *(_WORD *)(a1 + 136);
  if ((v27 & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 132));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v29 = CFSTR("timeRoundedToHour");
    else
      v29 = CFSTR("time_rounded_to_hour");
    objc_msgSend(v4, "setObject:forKey:", v28, v29);

    v27 = *(_WORD *)(a1 + 136);
  }
  if ((v27 & 1) != 0)
  {
    _GEOVLFPositionContextClassificationDictionaryRepresentation(a1 + 16);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v30, CFSTR("initialPositionContextClassification"));

  }
  objc_msgSend((id)a1, "initializationFailureDetails");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v31;
  if (v31)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v31, "jsonRepresentation");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = CFSTR("initializationFailureDetails");
    }
    else
    {
      objc_msgSend(v31, "dictionaryRepresentation");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = CFSTR("initialization_failure_details");
    }
    objc_msgSend(v4, "setObject:forKey:", v33, v34);

  }
  if (objc_msgSend(*(id *)(a1 + 48), "count"))
  {
    v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
    v70 = 0u;
    v71 = 0u;
    v72 = 0u;
    v73 = 0u;
    v36 = *(id *)(a1 + 48);
    v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v70, v79, 16);
    if (v37)
    {
      v38 = v37;
      v39 = *(_QWORD *)v71;
      do
      {
        for (j = 0; j != v38; ++j)
        {
          if (*(_QWORD *)v71 != v39)
            objc_enumerationMutation(v36);
          v41 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * j);
          if ((a2 & 1) != 0)
            objc_msgSend(v41, "jsonRepresentation");
          else
            objc_msgSend(v41, "dictionaryRepresentation");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "addObject:", v42);

        }
        v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v70, v79, 16);
      }
      while (v38);
    }

    if (a2)
      v43 = CFSTR("arState");
    else
      v43 = CFSTR("ar_state");
    objc_msgSend(v4, "setObject:forKey:", v35, v43);

  }
  if (objc_msgSend(*(id *)(a1 + 64), "count"))
  {
    v44 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 64), "count"));
    v66 = 0u;
    v67 = 0u;
    v68 = 0u;
    v69 = 0u;
    v45 = *(id *)(a1 + 64);
    v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v66, v78, 16);
    if (v46)
    {
      v47 = v46;
      v48 = *(_QWORD *)v67;
      do
      {
        for (k = 0; k != v47; ++k)
        {
          if (*(_QWORD *)v67 != v48)
            objc_enumerationMutation(v45);
          v50 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * k);
          if ((a2 & 1) != 0)
            objc_msgSend(v50, "jsonRepresentation");
          else
            objc_msgSend(v50, "dictionaryRepresentation");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "addObject:", v51);

        }
        v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v66, v78, 16);
      }
      while (v47);
    }

    if (a2)
      v52 = CFSTR("deviceOrientation");
    else
      v52 = CFSTR("device_orientation");
    objc_msgSend(v4, "setObject:forKey:", v44, v52);

  }
  objc_msgSend((id)a1, "crowdsourcingDetails");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = v53;
  if (v53)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v53, "jsonRepresentation");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = CFSTR("crowdsourcingDetails");
    }
    else
    {
      objc_msgSend(v53, "dictionaryRepresentation");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = CFSTR("crowdsourcing_details");
    }
    objc_msgSend(v4, "setObject:forKey:", v55, v56);

  }
  objc_msgSend((id)a1, "initialLocation");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = v57;
  if (v57)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v57, "jsonRepresentation");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = CFSTR("initialLocation");
    }
    else
    {
      objc_msgSend(v57, "dictionaryRepresentation");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = CFSTR("initial_location");
    }
    objc_msgSend(v4, "setObject:forKey:", v59, v60);

  }
  objc_msgSend((id)a1, "arFailureTypes");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = v61;
  if (v61)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v61, "jsonRepresentation");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = CFSTR("arFailureTypes");
    }
    else
    {
      objc_msgSend(v61, "dictionaryRepresentation");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = CFSTR("ar_failure_types");
    }
    objc_msgSend(v4, "setObject:forKey:", v63, v64);

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOLogMsgEventVLFUsage _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLogMsgEventVLFUsage)initWithDictionary:(id)a3
{
  return (GEOLogMsgEventVLFUsage *)-[GEOLogMsgEventVLFUsage _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  GEOVLFEntryPoint *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  GEOVLFLocalizationDetails *v21;
  uint64_t v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  id v26;
  uint64_t v27;
  const __CFString *v28;
  void *v29;
  GEOVLFCorrection *v30;
  uint64_t v31;
  void *v32;
  const __CFString *v33;
  void *v34;
  void *v35;
  const __CFString *v36;
  void *v37;
  GEOVLFInitializationFailureDetails *v38;
  uint64_t v39;
  void *v40;
  const __CFString *v41;
  void *v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t j;
  uint64_t v48;
  GEOVLFARState *v49;
  uint64_t v50;
  void *v51;
  const __CFString *v52;
  void *v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t k;
  uint64_t v59;
  GEOVLFDeviceOrientation *v60;
  uint64_t v61;
  void *v62;
  const __CFString *v63;
  void *v64;
  GEOVLFCrowdsourcingDetails *v65;
  uint64_t v66;
  void *v67;
  const __CFString *v68;
  void *v69;
  GEOVLFLocation *v70;
  uint64_t v71;
  void *v72;
  const __CFString *v73;
  void *v74;
  GEOVLFARFailureTypes *v75;
  uint64_t v76;
  void *v77;
  id v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  uint64_t v89;
  __int128 v90;
  uint64_t v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  _BYTE v96[128];
  _BYTE v97[128];
  _BYTE v98[128];
  uint64_t v99;

  v99 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (!a1)
    goto LABEL_134;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_134;
  if (a3)
    v6 = CFSTR("entryPoint");
  else
    v6 = CFSTR("entry_point");
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = [GEOVLFEntryPoint alloc];
    if ((a3 & 1) != 0)
      v9 = -[GEOVLFEntryPoint initWithJSON:](v8, "initWithJSON:", v7);
    else
      v9 = -[GEOVLFEntryPoint initWithDictionary:](v8, "initWithDictionary:", v7);
    v10 = (void *)v9;
    objc_msgSend(a1, "setEntryPoint:", v9);

  }
  if (a3)
    v11 = CFSTR("sessionTimeMs");
  else
    v11 = CFSTR("session_time_ms");
  objc_msgSend(v5, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setSessionTimeMs:", objc_msgSend(v12, "unsignedIntValue"));

  if (a3)
    v13 = CFSTR("localizationDetails");
  else
    v13 = CFSTR("localization_details");
  objc_msgSend(v5, "objectForKeyedSubscript:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v79 = v5;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v94 = 0u;
    v95 = 0u;
    v92 = 0u;
    v93 = 0u;
    v15 = v14;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v92, v98, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v93;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v93 != v18)
            objc_enumerationMutation(v15);
          v20 = *(_QWORD *)(*((_QWORD *)&v92 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v21 = [GEOVLFLocalizationDetails alloc];
            if ((a3 & 1) != 0)
              v22 = -[GEOVLFLocalizationDetails initWithJSON:](v21, "initWithJSON:", v20);
            else
              v22 = -[GEOVLFLocalizationDetails initWithDictionary:](v21, "initWithDictionary:", v20);
            v23 = (void *)v22;
            objc_msgSend(a1, "addLocalizationDetails:", v22);

          }
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v92, v98, 16);
      }
      while (v17);
    }

    v5 = v79;
  }

  if (a3)
    v24 = CFSTR("finalState");
  else
    v24 = CFSTR("final_state");
  objc_msgSend(v5, "objectForKeyedSubscript:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v26 = v25;
    if ((objc_msgSend(v26, "isEqualToString:", CFSTR("VLFFinalState_UNKNOWN")) & 1) != 0)
    {
      v27 = 0;
    }
    else if ((objc_msgSend(v26, "isEqualToString:", CFSTR("VLFFinalState_FAILED_TO_INITIALIZE")) & 1) != 0)
    {
      v27 = 1;
    }
    else if ((objc_msgSend(v26, "isEqualToString:", CFSTR("VLFFinalState_USER_ABANDONED")) & 1) != 0)
    {
      v27 = 2;
    }
    else if ((objc_msgSend(v26, "isEqualToString:", CFSTR("VLFFinalState_FAILED")) & 1) != 0)
    {
      v27 = 3;
    }
    else if (objc_msgSend(v26, "isEqualToString:", CFSTR("VLFFinalState_SUCCEEDED")))
    {
      v27 = 4;
    }
    else
    {
      v27 = 0;
    }

    goto LABEL_51;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v27 = objc_msgSend(v25, "intValue");
LABEL_51:
    objc_msgSend(a1, "setFinalState:", v27);
  }

  if (a3)
    v28 = CFSTR("postFusionCorrection");
  else
    v28 = CFSTR("post_fusion_correction");
  objc_msgSend(v5, "objectForKeyedSubscript:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v30 = [GEOVLFCorrection alloc];
    if ((a3 & 1) != 0)
      v31 = -[GEOVLFCorrection initWithJSON:](v30, "initWithJSON:", v29);
    else
      v31 = -[GEOVLFCorrection initWithDictionary:](v30, "initWithDictionary:", v29);
    v32 = (void *)v31;
    objc_msgSend(a1, "setPostFusionCorrection:", v31);

  }
  if (a3)
    v33 = CFSTR("timeRoundedToHour");
  else
    v33 = CFSTR("time_rounded_to_hour");
  objc_msgSend(v5, "objectForKeyedSubscript:", v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setTimeRoundedToHour:", objc_msgSend(v34, "unsignedIntValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("initialPositionContextClassification"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v90 = 0uLL;
    v91 = 0;
    _GEOVLFPositionContextClassificationFromDictionaryRepresentation(v35, (uint64_t)&v90);
    v88 = v90;
    v89 = v91;
    objc_msgSend(a1, "setInitialPositionContextClassification:", &v88);
  }

  if (a3)
    v36 = CFSTR("initializationFailureDetails");
  else
    v36 = CFSTR("initialization_failure_details");
  objc_msgSend(v5, "objectForKeyedSubscript:", v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v38 = [GEOVLFInitializationFailureDetails alloc];
    if ((a3 & 1) != 0)
      v39 = -[GEOVLFInitializationFailureDetails initWithJSON:](v38, "initWithJSON:", v37);
    else
      v39 = -[GEOVLFInitializationFailureDetails initWithDictionary:](v38, "initWithDictionary:", v37);
    v40 = (void *)v39;
    objc_msgSend(a1, "setInitializationFailureDetails:", v39);

  }
  if (a3)
    v41 = CFSTR("arState");
  else
    v41 = CFSTR("ar_state");
  objc_msgSend(v5, "objectForKeyedSubscript:", v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v86 = 0u;
    v87 = 0u;
    v84 = 0u;
    v85 = 0u;
    v43 = v42;
    v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v84, v97, 16);
    if (v44)
    {
      v45 = v44;
      v46 = *(_QWORD *)v85;
      do
      {
        for (j = 0; j != v45; ++j)
        {
          if (*(_QWORD *)v85 != v46)
            objc_enumerationMutation(v43);
          v48 = *(_QWORD *)(*((_QWORD *)&v84 + 1) + 8 * j);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v49 = [GEOVLFARState alloc];
            if ((a3 & 1) != 0)
              v50 = -[GEOVLFARState initWithJSON:](v49, "initWithJSON:", v48);
            else
              v50 = -[GEOVLFARState initWithDictionary:](v49, "initWithDictionary:", v48);
            v51 = (void *)v50;
            objc_msgSend(a1, "addArState:", v50);

          }
        }
        v45 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v84, v97, 16);
      }
      while (v45);
    }

    v5 = v79;
  }

  if (a3)
    v52 = CFSTR("deviceOrientation");
  else
    v52 = CFSTR("device_orientation");
  objc_msgSend(v5, "objectForKeyedSubscript:", v52);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v82 = 0u;
    v83 = 0u;
    v80 = 0u;
    v81 = 0u;
    v54 = v53;
    v55 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v80, v96, 16);
    if (v55)
    {
      v56 = v55;
      v57 = *(_QWORD *)v81;
      do
      {
        for (k = 0; k != v56; ++k)
        {
          if (*(_QWORD *)v81 != v57)
            objc_enumerationMutation(v54);
          v59 = *(_QWORD *)(*((_QWORD *)&v80 + 1) + 8 * k);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v60 = [GEOVLFDeviceOrientation alloc];
            if ((a3 & 1) != 0)
              v61 = -[GEOVLFDeviceOrientation initWithJSON:](v60, "initWithJSON:", v59);
            else
              v61 = -[GEOVLFDeviceOrientation initWithDictionary:](v60, "initWithDictionary:", v59);
            v62 = (void *)v61;
            objc_msgSend(a1, "addDeviceOrientation:", v61);

          }
        }
        v56 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v80, v96, 16);
      }
      while (v56);
    }

    v5 = v79;
  }

  if (a3)
    v63 = CFSTR("crowdsourcingDetails");
  else
    v63 = CFSTR("crowdsourcing_details");
  objc_msgSend(v5, "objectForKeyedSubscript:", v63);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v65 = [GEOVLFCrowdsourcingDetails alloc];
    if ((a3 & 1) != 0)
      v66 = -[GEOVLFCrowdsourcingDetails initWithJSON:](v65, "initWithJSON:", v64);
    else
      v66 = -[GEOVLFCrowdsourcingDetails initWithDictionary:](v65, "initWithDictionary:", v64);
    v67 = (void *)v66;
    objc_msgSend(a1, "setCrowdsourcingDetails:", v66);

  }
  if (a3)
    v68 = CFSTR("initialLocation");
  else
    v68 = CFSTR("initial_location");
  objc_msgSend(v5, "objectForKeyedSubscript:", v68);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v70 = [GEOVLFLocation alloc];
    if ((a3 & 1) != 0)
      v71 = -[GEOVLFLocation initWithJSON:](v70, "initWithJSON:", v69);
    else
      v71 = -[GEOVLFLocation initWithDictionary:](v70, "initWithDictionary:", v69);
    v72 = (void *)v71;
    objc_msgSend(a1, "setInitialLocation:", v71);

  }
  if (a3)
    v73 = CFSTR("arFailureTypes");
  else
    v73 = CFSTR("ar_failure_types");
  objc_msgSend(v5, "objectForKeyedSubscript:", v73);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v75 = [GEOVLFARFailureTypes alloc];
    if ((a3 & 1) != 0)
      v76 = -[GEOVLFARFailureTypes initWithJSON:](v75, "initWithJSON:", v74);
    else
      v76 = -[GEOVLFARFailureTypes initWithDictionary:](v75, "initWithDictionary:", v74);
    v77 = (void *)v76;
    objc_msgSend(a1, "setArFailureTypes:", v76);

  }
LABEL_134:

  return a1;
}

- (GEOLogMsgEventVLFUsage)initWithJSON:(id)a3
{
  return (GEOLogMsgEventVLFUsage *)-[GEOLogMsgEventVLFUsage _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_4646;
    else
      v8 = (int *)&readAll__nonRecursiveTag_4647;
    GEOLogMsgEventVLFUsageReadSpecified((uint64_t)self, (uint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEOLogMsgEventVLFUsageCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgEventVLFUsageIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgEventVLFUsageReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int16 flags;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t k;
  PBDataReader *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOLogMsgEventVLFUsageIsDirty((uint64_t)self) & 1) == 0)
  {
    v19 = self->_reader;
    objc_sync_enter(v19);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v20);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v19);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOLogMsgEventVLFUsage readAll:](self, "readAll:", 0);
    if (self->_entryPoint)
      PBDataWriterWriteSubmessage();
    if ((*(_WORD *)&self->_flags & 4) != 0)
      PBDataWriterWriteUint32Field();
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v6 = self->_localizationDetails;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v31 != v8)
            objc_enumerationMutation(v6);
          PBDataWriterWriteSubmessage();
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
      }
      while (v7);
    }

    if ((*(_WORD *)&self->_flags & 2) != 0)
      PBDataWriterWriteInt32Field();
    if (self->_postFusionCorrection)
      PBDataWriterWriteSubmessage();
    flags = (__int16)self->_flags;
    if ((flags & 8) != 0)
    {
      PBDataWriterWriteUint32Field();
      flags = (__int16)self->_flags;
    }
    if ((flags & 1) != 0)
    {
      v29 = 0;
      PBDataWriterPlaceMark();
      GEOVLFPositionContextClassificationWriteTo((uint64_t)&self->_initialPositionContextClassification);
      PBDataWriterRecallMark();
    }
    if (self->_initializationFailureDetails)
      PBDataWriterWriteSubmessage();
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v11 = self->_arStates;
    v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v25, v35, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v26;
      do
      {
        for (j = 0; j != v12; ++j)
        {
          if (*(_QWORD *)v26 != v13)
            objc_enumerationMutation(v11);
          PBDataWriterWriteSubmessage();
        }
        v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v25, v35, 16);
      }
      while (v12);
    }

    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v15 = self->_deviceOrientations;
    v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v21, v34, 16);
    if (v16)
    {
      v17 = *(_QWORD *)v22;
      do
      {
        for (k = 0; k != v16; ++k)
        {
          if (*(_QWORD *)v22 != v17)
            objc_enumerationMutation(v15);
          PBDataWriterWriteSubmessage();
        }
        v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v21, v34, 16);
      }
      while (v16);
    }

    if (self->_crowdsourcingDetails)
      PBDataWriterWriteSubmessage();
    if (self->_initialLocation)
      PBDataWriterWriteSubmessage();
    if (self->_arFailureTypes)
      PBDataWriterWriteSubmessage();
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
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  -[GEOLogMsgEventVLFUsage _readInitialLocation]((uint64_t)self);
  if (-[GEOVLFLocation hasGreenTeaWithValue:](self->_initialLocation, "hasGreenTeaWithValue:", v3))
    return 1;
  -[GEOLogMsgEventVLFUsage _readLocalizationDetails]((uint64_t)self);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = self->_localizationDetails;
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
          goto LABEL_13;
        }
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v8)
        continue;
      break;
    }
  }
  v5 = 0;
LABEL_13:

  return v5;
}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  id *v8;
  __int16 flags;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t j;
  void *v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t k;
  void *v18;
  id *v19;
  id *v20;

  v20 = (id *)a3;
  -[GEOLogMsgEventVLFUsage readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v20 + 1, self->_reader);
  *((_DWORD *)v20 + 28) = self->_readerMarkPos;
  *((_DWORD *)v20 + 29) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_entryPoint)
    objc_msgSend(v20, "setEntryPoint:");
  if ((*(_WORD *)&self->_flags & 4) != 0)
  {
    *((_DWORD *)v20 + 32) = self->_sessionTimeMs;
    *((_WORD *)v20 + 68) |= 4u;
  }
  if (-[GEOLogMsgEventVLFUsage localizationDetailsCount](self, "localizationDetailsCount"))
  {
    objc_msgSend(v20, "clearLocalizationDetails");
    v4 = -[GEOLogMsgEventVLFUsage localizationDetailsCount](self, "localizationDetailsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[GEOLogMsgEventVLFUsage localizationDetailsAtIndex:](self, "localizationDetailsAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "addLocalizationDetails:", v7);

      }
    }
  }
  v8 = v20;
  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    *((_DWORD *)v20 + 31) = self->_finalState;
    *((_WORD *)v20 + 68) |= 2u;
  }
  if (self->_postFusionCorrection)
  {
    objc_msgSend(v20, "setPostFusionCorrection:");
    v8 = v20;
  }
  flags = (__int16)self->_flags;
  if ((flags & 8) != 0)
  {
    *((_DWORD *)v8 + 33) = self->_timeRoundedToHour;
    *((_WORD *)v8 + 68) |= 8u;
    flags = (__int16)self->_flags;
  }
  if ((flags & 1) != 0)
  {
    v10 = *(void **)&self->_initialPositionContextClassification._type;
    *((_OWORD *)v8 + 1) = *(_OWORD *)&self->_initialPositionContextClassification._indoorProbability;
    v8[4] = v10;
    *((_WORD *)v8 + 68) |= 1u;
  }
  if (self->_initializationFailureDetails)
    objc_msgSend(v20, "setInitializationFailureDetails:");
  if (-[GEOLogMsgEventVLFUsage arStatesCount](self, "arStatesCount"))
  {
    objc_msgSend(v20, "clearArStates");
    v11 = -[GEOLogMsgEventVLFUsage arStatesCount](self, "arStatesCount");
    if (v11)
    {
      v12 = v11;
      for (j = 0; j != v12; ++j)
      {
        -[GEOLogMsgEventVLFUsage arStateAtIndex:](self, "arStateAtIndex:", j);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "addArState:", v14);

      }
    }
  }
  if (-[GEOLogMsgEventVLFUsage deviceOrientationsCount](self, "deviceOrientationsCount"))
  {
    objc_msgSend(v20, "clearDeviceOrientations");
    v15 = -[GEOLogMsgEventVLFUsage deviceOrientationsCount](self, "deviceOrientationsCount");
    if (v15)
    {
      v16 = v15;
      for (k = 0; k != v16; ++k)
      {
        -[GEOLogMsgEventVLFUsage deviceOrientationAtIndex:](self, "deviceOrientationAtIndex:", k);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "addDeviceOrientation:", v18);

      }
    }
  }
  if (self->_crowdsourcingDetails)
    objc_msgSend(v20, "setCrowdsourcingDetails:");
  v19 = v20;
  if (self->_initialLocation)
  {
    objc_msgSend(v20, "setInitialLocation:");
    v19 = v20;
  }
  if (self->_arFailureTypes)
  {
    objc_msgSend(v20, "setArFailureTypes:");
    v19 = v20;
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
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  id v16;
  void *v17;
  __int16 flags;
  uint64_t v19;
  id v20;
  void *v21;
  NSMutableArray *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  NSMutableArray *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t k;
  void *v31;
  id v32;
  void *v33;
  id v34;
  void *v35;
  id v36;
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
  _BYTE v50[128];
  _BYTE v51[128];
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x2000) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOLogMsgEventVLFUsageReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_35;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOLogMsgEventVLFUsage readAll:](self, "readAll:", 0);
  v9 = -[GEOVLFEntryPoint copyWithZone:](self->_entryPoint, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v9;

  if ((*(_WORD *)&self->_flags & 4) != 0)
  {
    *(_DWORD *)(v5 + 128) = self->_sessionTimeMs;
    *(_WORD *)(v5 + 136) |= 4u;
  }
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v11 = self->_localizationDetails;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v47;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v47 != v13)
          objc_enumerationMutation(v11);
        v15 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v46 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addLocalizationDetails:", v15);

      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
    }
    while (v12);
  }

  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 124) = self->_finalState;
    *(_WORD *)(v5 + 136) |= 2u;
  }
  v16 = -[GEOVLFCorrection copyWithZone:](self->_postFusionCorrection, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 104);
  *(_QWORD *)(v5 + 104) = v16;

  flags = (__int16)self->_flags;
  if ((flags & 8) != 0)
  {
    *(_DWORD *)(v5 + 132) = self->_timeRoundedToHour;
    *(_WORD *)(v5 + 136) |= 8u;
    flags = (__int16)self->_flags;
  }
  if ((flags & 1) != 0)
  {
    v19 = *(_QWORD *)&self->_initialPositionContextClassification._type;
    *(_OWORD *)(v5 + 16) = *(_OWORD *)&self->_initialPositionContextClassification._indoorProbability;
    *(_QWORD *)(v5 + 32) = v19;
    *(_WORD *)(v5 + 136) |= 1u;
  }
  v20 = -[GEOVLFInitializationFailureDetails copyWithZone:](self->_initializationFailureDetails, "copyWithZone:", a3);
  v21 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v20;

  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v22 = self->_arStates;
  v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
  if (v23)
  {
    v24 = *(_QWORD *)v43;
    do
    {
      for (j = 0; j != v23; ++j)
      {
        if (*(_QWORD *)v43 != v24)
          objc_enumerationMutation(v22);
        v26 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * j), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addArState:", v26);

      }
      v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
    }
    while (v23);
  }

  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v27 = self->_deviceOrientations;
  v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v38, v50, 16);
  if (v28)
  {
    v29 = *(_QWORD *)v39;
    do
    {
      for (k = 0; k != v28; ++k)
      {
        if (*(_QWORD *)v39 != v29)
          objc_enumerationMutation(v27);
        v31 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * k), "copyWithZone:", a3, (_QWORD)v38);
        objc_msgSend((id)v5, "addDeviceOrientation:", v31);

      }
      v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v38, v50, 16);
    }
    while (v28);
  }

  v32 = -[GEOVLFCrowdsourcingDetails copyWithZone:](self->_crowdsourcingDetails, "copyWithZone:", a3);
  v33 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v32;

  v34 = -[GEOVLFLocation copyWithZone:](self->_initialLocation, "copyWithZone:", a3);
  v35 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v34;

  v36 = -[GEOVLFARFailureTypes copyWithZone:](self->_arFailureTypes, "copyWithZone:", a3);
  v8 = *(id *)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v36;
LABEL_35:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  GEOVLFEntryPoint *entryPoint;
  __int16 flags;
  __int16 v7;
  NSMutableArray *localizationDetails;
  GEOVLFCorrection *postFusionCorrection;
  BOOL v10;
  GEOVLFInitializationFailureDetails *initializationFailureDetails;
  NSMutableArray *arStates;
  NSMutableArray *deviceOrientations;
  GEOVLFCrowdsourcingDetails *crowdsourcingDetails;
  GEOVLFLocation *initialLocation;
  GEOVLFARFailureTypes *arFailureTypes;
  char v18;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_49;
  -[GEOLogMsgEventVLFUsage readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  entryPoint = self->_entryPoint;
  if ((unint64_t)entryPoint | *((_QWORD *)v4 + 9))
  {
    if (!-[GEOVLFEntryPoint isEqual:](entryPoint, "isEqual:"))
      goto LABEL_49;
  }
  flags = (__int16)self->_flags;
  v7 = *((_WORD *)v4 + 68);
  if ((flags & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_sessionTimeMs != *((_DWORD *)v4 + 32))
      goto LABEL_49;
  }
  else if ((v7 & 4) != 0)
  {
    goto LABEL_49;
  }
  localizationDetails = self->_localizationDetails;
  if ((unint64_t)localizationDetails | *((_QWORD *)v4 + 12))
  {
    if (!-[NSMutableArray isEqual:](localizationDetails, "isEqual:"))
      goto LABEL_49;
    flags = (__int16)self->_flags;
    v7 = *((_WORD *)v4 + 68);
  }
  if ((flags & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_finalState != *((_DWORD *)v4 + 31))
      goto LABEL_49;
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_49;
  }
  postFusionCorrection = self->_postFusionCorrection;
  if ((unint64_t)postFusionCorrection | *((_QWORD *)v4 + 13))
  {
    if (-[GEOVLFCorrection isEqual:](postFusionCorrection, "isEqual:"))
    {
      flags = (__int16)self->_flags;
      v7 = *((_WORD *)v4 + 68);
      goto LABEL_20;
    }
LABEL_49:
    v18 = 0;
    goto LABEL_50;
  }
LABEL_20:
  if ((flags & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_timeRoundedToHour != *((_DWORD *)v4 + 33))
      goto LABEL_49;
  }
  else if ((v7 & 8) != 0)
  {
    goto LABEL_49;
  }
  if ((flags & 1) != 0)
  {
    if ((v7 & 1) == 0)
      goto LABEL_49;
    v10 = *(_QWORD *)&self->_initialPositionContextClassification._indoorProbability == *((_QWORD *)v4 + 2)
       && *(_QWORD *)&self->_initialPositionContextClassification._outdoorProbability == *((_QWORD *)v4 + 3);
    if (!v10 || *(_QWORD *)&self->_initialPositionContextClassification._type != *((_QWORD *)v4 + 4))
      goto LABEL_49;
  }
  else if ((v7 & 1) != 0)
  {
    goto LABEL_49;
  }
  initializationFailureDetails = self->_initializationFailureDetails;
  if ((unint64_t)initializationFailureDetails | *((_QWORD *)v4 + 11)
    && !-[GEOVLFInitializationFailureDetails isEqual:](initializationFailureDetails, "isEqual:"))
  {
    goto LABEL_49;
  }
  arStates = self->_arStates;
  if ((unint64_t)arStates | *((_QWORD *)v4 + 6))
  {
    if (!-[NSMutableArray isEqual:](arStates, "isEqual:"))
      goto LABEL_49;
  }
  deviceOrientations = self->_deviceOrientations;
  if ((unint64_t)deviceOrientations | *((_QWORD *)v4 + 8))
  {
    if (!-[NSMutableArray isEqual:](deviceOrientations, "isEqual:"))
      goto LABEL_49;
  }
  crowdsourcingDetails = self->_crowdsourcingDetails;
  if ((unint64_t)crowdsourcingDetails | *((_QWORD *)v4 + 7))
  {
    if (!-[GEOVLFCrowdsourcingDetails isEqual:](crowdsourcingDetails, "isEqual:"))
      goto LABEL_49;
  }
  initialLocation = self->_initialLocation;
  if ((unint64_t)initialLocation | *((_QWORD *)v4 + 10))
  {
    if (!-[GEOVLFLocation isEqual:](initialLocation, "isEqual:"))
      goto LABEL_49;
  }
  arFailureTypes = self->_arFailureTypes;
  if ((unint64_t)arFailureTypes | *((_QWORD *)v4 + 5))
    v18 = -[GEOVLFARFailureTypes isEqual:](arFailureTypes, "isEqual:");
  else
    v18 = 1;
LABEL_50:

  return v18;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  __int16 flags;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;

  -[GEOLogMsgEventVLFUsage readAll:](self, "readAll:", 1);
  v3 = -[GEOVLFEntryPoint hash](self->_entryPoint, "hash");
  if ((*(_WORD *)&self->_flags & 4) != 0)
    v4 = 2654435761 * self->_sessionTimeMs;
  else
    v4 = 0;
  v5 = -[NSMutableArray hash](self->_localizationDetails, "hash");
  if ((*(_WORD *)&self->_flags & 2) != 0)
    v6 = 2654435761 * self->_finalState;
  else
    v6 = 0;
  v7 = -[GEOVLFCorrection hash](self->_postFusionCorrection, "hash");
  flags = (__int16)self->_flags;
  if ((flags & 8) != 0)
  {
    v9 = 2654435761 * self->_timeRoundedToHour;
    if ((flags & 1) != 0)
      goto LABEL_9;
LABEL_11:
    v10 = 0;
    goto LABEL_12;
  }
  v9 = 0;
  if ((flags & 1) == 0)
    goto LABEL_11;
LABEL_9:
  v10 = PBHashBytes();
LABEL_12:
  v11 = v4 ^ v3 ^ v5 ^ v6 ^ v7;
  v12 = v9 ^ v10 ^ -[GEOVLFInitializationFailureDetails hash](self->_initializationFailureDetails, "hash");
  v13 = v11 ^ v12 ^ -[NSMutableArray hash](self->_arStates, "hash");
  v14 = -[NSMutableArray hash](self->_deviceOrientations, "hash");
  v15 = v14 ^ -[GEOVLFCrowdsourcingDetails hash](self->_crowdsourcingDetails, "hash");
  v16 = v15 ^ -[GEOVLFLocation hash](self->_initialLocation, "hash");
  return v13 ^ v16 ^ -[GEOVLFARFailureTypes hash](self->_arFailureTypes, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  GEOVLFEntryPoint *entryPoint;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  GEOVLFCorrection *postFusionCorrection;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  GEOVLFInitializationFailureDetails *initializationFailureDetails;
  uint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t k;
  GEOVLFCrowdsourcingDetails *crowdsourcingDetails;
  uint64_t v29;
  GEOVLFLocation *initialLocation;
  uint64_t v31;
  GEOVLFARFailureTypes *arFailureTypes;
  uint64_t v33;
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
  _BYTE v46[128];
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  entryPoint = self->_entryPoint;
  v6 = *((_QWORD *)v4 + 9);
  if (entryPoint)
  {
    if (v6)
      -[GEOVLFEntryPoint mergeFrom:](entryPoint, "mergeFrom:");
  }
  else if (v6)
  {
    -[GEOLogMsgEventVLFUsage setEntryPoint:](self, "setEntryPoint:");
  }
  if ((*((_WORD *)v4 + 68) & 4) != 0)
  {
    self->_sessionTimeMs = *((_DWORD *)v4 + 32);
    *(_WORD *)&self->_flags |= 4u;
  }
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v7 = *((id *)v4 + 12);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v43;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v43 != v10)
          objc_enumerationMutation(v7);
        -[GEOLogMsgEventVLFUsage addLocalizationDetails:](self, "addLocalizationDetails:", *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * i));
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
    }
    while (v9);
  }

  if ((*((_WORD *)v4 + 68) & 2) != 0)
  {
    self->_finalState = *((_DWORD *)v4 + 31);
    *(_WORD *)&self->_flags |= 2u;
  }
  postFusionCorrection = self->_postFusionCorrection;
  v13 = *((_QWORD *)v4 + 13);
  if (postFusionCorrection)
  {
    if (v13)
      -[GEOVLFCorrection mergeFrom:](postFusionCorrection, "mergeFrom:");
  }
  else if (v13)
  {
    -[GEOLogMsgEventVLFUsage setPostFusionCorrection:](self, "setPostFusionCorrection:");
  }
  v14 = *((_WORD *)v4 + 68);
  if ((v14 & 8) != 0)
  {
    self->_timeRoundedToHour = *((_DWORD *)v4 + 33);
    *(_WORD *)&self->_flags |= 8u;
    v14 = *((_WORD *)v4 + 68);
  }
  if ((v14 & 1) != 0)
  {
    v15 = *((_QWORD *)v4 + 4);
    *(_OWORD *)&self->_initialPositionContextClassification._indoorProbability = *((_OWORD *)v4 + 1);
    *(_QWORD *)&self->_initialPositionContextClassification._type = v15;
    *(_WORD *)&self->_flags |= 1u;
  }
  initializationFailureDetails = self->_initializationFailureDetails;
  v17 = *((_QWORD *)v4 + 11);
  if (initializationFailureDetails)
  {
    if (v17)
      -[GEOVLFInitializationFailureDetails mergeFrom:](initializationFailureDetails, "mergeFrom:");
  }
  else if (v17)
  {
    -[GEOLogMsgEventVLFUsage setInitializationFailureDetails:](self, "setInitializationFailureDetails:");
  }
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v18 = *((id *)v4 + 6);
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v39;
    do
    {
      for (j = 0; j != v20; ++j)
      {
        if (*(_QWORD *)v39 != v21)
          objc_enumerationMutation(v18);
        -[GEOLogMsgEventVLFUsage addArState:](self, "addArState:", *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * j));
      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
    }
    while (v20);
  }

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v23 = *((id *)v4 + 8);
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v34, v46, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v35;
    do
    {
      for (k = 0; k != v25; ++k)
      {
        if (*(_QWORD *)v35 != v26)
          objc_enumerationMutation(v23);
        -[GEOLogMsgEventVLFUsage addDeviceOrientation:](self, "addDeviceOrientation:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * k), (_QWORD)v34);
      }
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v34, v46, 16);
    }
    while (v25);
  }

  crowdsourcingDetails = self->_crowdsourcingDetails;
  v29 = *((_QWORD *)v4 + 7);
  if (crowdsourcingDetails)
  {
    if (v29)
      -[GEOVLFCrowdsourcingDetails mergeFrom:](crowdsourcingDetails, "mergeFrom:");
  }
  else if (v29)
  {
    -[GEOLogMsgEventVLFUsage setCrowdsourcingDetails:](self, "setCrowdsourcingDetails:");
  }
  initialLocation = self->_initialLocation;
  v31 = *((_QWORD *)v4 + 10);
  if (initialLocation)
  {
    if (v31)
      -[GEOVLFLocation mergeFrom:](initialLocation, "mergeFrom:");
  }
  else if (v31)
  {
    -[GEOLogMsgEventVLFUsage setInitialLocation:](self, "setInitialLocation:");
  }
  arFailureTypes = self->_arFailureTypes;
  v33 = *((_QWORD *)v4 + 5);
  if (arFailureTypes)
  {
    if (v33)
      -[GEOVLFARFailureTypes mergeFrom:](arFailureTypes, "mergeFrom:");
  }
  else if (v33)
  {
    -[GEOLogMsgEventVLFUsage setArFailureTypes:](self, "setArFailureTypes:");
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_postFusionCorrection, 0);
  objc_storeStrong((id *)&self->_localizationDetails, 0);
  objc_storeStrong((id *)&self->_initializationFailureDetails, 0);
  objc_storeStrong((id *)&self->_initialLocation, 0);
  objc_storeStrong((id *)&self->_entryPoint, 0);
  objc_storeStrong((id *)&self->_deviceOrientations, 0);
  objc_storeStrong((id *)&self->_crowdsourcingDetails, 0);
  objc_storeStrong((id *)&self->_arStates, 0);
  objc_storeStrong((id *)&self->_arFailureTypes, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
