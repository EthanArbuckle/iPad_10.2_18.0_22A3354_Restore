@implementation GEOLogMsgEventDirections

- (GEOLogMsgEventDirections)init
{
  GEOLogMsgEventDirections *v2;
  GEOLogMsgEventDirections *v3;
  GEOLogMsgEventDirections *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOLogMsgEventDirections;
  v2 = -[GEOLogMsgEventDirections init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOLogMsgEventDirections)initWithData:(id)a3
{
  GEOLogMsgEventDirections *v3;
  GEOLogMsgEventDirections *v4;
  GEOLogMsgEventDirections *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOLogMsgEventDirections;
  v3 = -[GEOLogMsgEventDirections initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readDirectionsFeedbacks
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 176));
    if ((*(_BYTE *)(a1 + 244) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventDirectionsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDirectionsFeedbacks_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 176));
  }
}

- (NSMutableArray)directionsFeedbacks
{
  -[GEOLogMsgEventDirections _readDirectionsFeedbacks]((uint64_t)self);
  return self->_directionsFeedbacks;
}

- (void)setDirectionsFeedbacks:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *directionsFeedbacks;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x2000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x200000000000uLL;
  directionsFeedbacks = self->_directionsFeedbacks;
  self->_directionsFeedbacks = v4;

}

- (void)clearDirectionsFeedbacks
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x2000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(_QWORD *)&self->_flags |= 0x200000000000uLL;
  -[NSMutableArray removeAllObjects](self->_directionsFeedbacks, "removeAllObjects");
}

- (void)addDirectionsFeedback:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOLogMsgEventDirections _readDirectionsFeedbacks]((uint64_t)self);
  -[GEOLogMsgEventDirections _addNoFlagsDirectionsFeedback:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x2000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x200000000000uLL;
}

- (void)_addNoFlagsDirectionsFeedback:(uint64_t)a1
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

- (unint64_t)directionsFeedbacksCount
{
  -[GEOLogMsgEventDirections _readDirectionsFeedbacks]((uint64_t)self);
  return -[NSMutableArray count](self->_directionsFeedbacks, "count");
}

- (id)directionsFeedbackAtIndex:(unint64_t)a3
{
  -[GEOLogMsgEventDirections _readDirectionsFeedbacks]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_directionsFeedbacks, "objectAtIndex:", a3);
}

+ (Class)directionsFeedbackType
{
  return (Class)objc_opt_class();
}

- (void)_readFinalLocation
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 176));
    if ((*(_BYTE *)(a1 + 245) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventDirectionsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readFinalLocation_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 176));
  }
}

- (BOOL)hasFinalLocation
{
  -[GEOLogMsgEventDirections _readFinalLocation]((uint64_t)self);
  return self->_finalLocation != 0;
}

- (GEOLocation)finalLocation
{
  -[GEOLogMsgEventDirections _readFinalLocation]((uint64_t)self);
  return self->_finalLocation;
}

- (void)setFinalLocation:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x220000000000uLL;
  objc_storeStrong((id *)&self->_finalLocation, a3);
}

- (BOOL)arrivedAtDestination
{
  return self->_arrivedAtDestination;
}

- (void)setArrivedAtDestination:(BOOL)a3
{
  *(_QWORD *)&self->_flags |= 0x200000020000uLL;
  self->_arrivedAtDestination = a3;
}

- (void)setHasArrivedAtDestination:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000000;
  if (a3)
    v3 = 0x200000020000;
  self->_flags = ($896FCD321D059B35A66825024FB599E5)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFDFFFFLL | v3);
}

- (BOOL)hasArrivedAtDestination
{
  return (*((unsigned __int8 *)&self->_flags + 2) >> 1) & 1;
}

- (GEONavigationAudioFeedback)navigationAudioFeedback
{
  __int128 v3;

  v3 = *(_OWORD *)&self->_spokenPromptsCount;
  *(_OWORD *)&retstr->_bTHFPAvailableAtEndOfNav = *(_OWORD *)&self->_manuallyChangedRouteCount;
  *(_OWORD *)&retstr->_manuallyChangedRouteCount = v3;
  *(_OWORD *)&retstr->_pauseSpokenAudioEnabled = *(_OWORD *)&self[1]._bTHFPAvailableAtEndOfNav;
  return self;
}

- (void)setNavigationAudioFeedback:(GEONavigationAudioFeedback *)a3
{
  __int128 v3;
  __int128 v4;

  *(_QWORD *)&self->_flags |= 0x200000000001uLL;
  v4 = *(_OWORD *)&a3->_bTHFPAvailableAtEndOfNav;
  v3 = *(_OWORD *)&a3->_manuallyChangedRouteCount;
  *(_OWORD *)&self->_navigationAudioFeedback._pauseSpokenAudioEnabled = *(_OWORD *)&a3->_pauseSpokenAudioEnabled;
  *(_OWORD *)&self->_navigationAudioFeedback._bTHFPAvailableAtEndOfNav = v4;
  *(_OWORD *)&self->_navigationAudioFeedback._manuallyChangedRouteCount = v3;
}

- (void)setHasNavigationAudioFeedback:(BOOL)a3
{
  self->_flags = ($896FCD321D059B35A66825024FB599E5)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFFFELL | a3 | 0x200000000000);
}

- (BOOL)hasNavigationAudioFeedback
{
  return *(_DWORD *)&self->_flags & 1;
}

- (double)durationOfTrip
{
  return self->_durationOfTrip;
}

- (void)setDurationOfTrip:(double)a3
{
  *(_QWORD *)&self->_flags |= 0x200000000004uLL;
  self->_durationOfTrip = a3;
}

- (void)setHasDurationOfTrip:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000000;
  if (a3)
    v3 = 0x200000000004;
  self->_flags = ($896FCD321D059B35A66825024FB599E5)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFFFBLL | v3);
}

- (BOOL)hasDurationOfTrip
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (GEOSessionID)navSessionId
{
  GEOSessionID *p_navSessionId;
  unint64_t high;
  unint64_t low;
  GEOSessionID result;

  p_navSessionId = &self->_navSessionId;
  high = self->_navSessionId._high;
  low = p_navSessionId->_low;
  result._low = low;
  result._high = high;
  return result;
}

- (void)setNavSessionId:(GEOSessionID)a3
{
  *(_QWORD *)&self->_flags |= 0x200000000002uLL;
  self->_navSessionId = a3;
}

- (void)setHasNavSessionId:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000000;
  if (a3)
    v3 = 0x200000000002;
  self->_flags = ($896FCD321D059B35A66825024FB599E5)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFFFDLL | v3);
}

- (BOOL)hasNavSessionId
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (void)_readDurationInNavigationModes
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 176));
    if ((*(_BYTE *)(a1 + 244) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventDirectionsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDurationInNavigationModes_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 176));
  }
}

- (NSMutableArray)durationInNavigationModes
{
  -[GEOLogMsgEventDirections _readDurationInNavigationModes]((uint64_t)self);
  return self->_durationInNavigationModes;
}

- (void)setDurationInNavigationModes:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *durationInNavigationModes;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x4000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x200000000000uLL;
  durationInNavigationModes = self->_durationInNavigationModes;
  self->_durationInNavigationModes = v4;

}

- (void)clearDurationInNavigationModes
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x4000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(_QWORD *)&self->_flags |= 0x200000000000uLL;
  -[NSMutableArray removeAllObjects](self->_durationInNavigationModes, "removeAllObjects");
}

- (void)addDurationInNavigationMode:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOLogMsgEventDirections _readDurationInNavigationModes]((uint64_t)self);
  -[GEOLogMsgEventDirections _addNoFlagsDurationInNavigationMode:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x4000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x200000000000uLL;
}

- (void)_addNoFlagsDurationInNavigationMode:(uint64_t)a1
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

- (unint64_t)durationInNavigationModesCount
{
  -[GEOLogMsgEventDirections _readDurationInNavigationModes]((uint64_t)self);
  return -[NSMutableArray count](self->_durationInNavigationModes, "count");
}

- (id)durationInNavigationModeAtIndex:(unint64_t)a3
{
  -[GEOLogMsgEventDirections _readDurationInNavigationModes]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_durationInNavigationModes, "objectAtIndex:", a3);
}

+ (Class)durationInNavigationModeType
{
  return (Class)objc_opt_class();
}

- (unsigned)originalEta
{
  return self->_originalEta;
}

- (void)setOriginalEta:(unsigned int)a3
{
  *(_QWORD *)&self->_flags |= 0x200000000080uLL;
  self->_originalEta = a3;
}

- (void)setHasOriginalEta:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000000;
  if (a3)
    v3 = 0x200000000080;
  self->_flags = ($896FCD321D059B35A66825024FB599E5)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFF7FLL | v3);
}

- (BOOL)hasOriginalEta
{
  return *(_BYTE *)&self->_flags >> 7;
}

- (BOOL)preArrival
{
  return self->_preArrival;
}

- (void)setPreArrival:(BOOL)a3
{
  *(_QWORD *)&self->_flags |= 0x200800000000uLL;
  self->_preArrival = a3;
}

- (void)setHasPreArrival:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000000;
  if (a3)
    v3 = 0x200800000000;
  self->_flags = ($896FCD321D059B35A66825024FB599E5)(*(_QWORD *)&self->_flags & 0xFFFFFFF7FFFFFFFFLL | v3);
}

- (BOOL)hasPreArrival
{
  return (*((unsigned __int8 *)&self->_flags + 4) >> 3) & 1;
}

- (BOOL)isCyclingNlgAvailable
{
  return self->_isCyclingNlgAvailable;
}

- (void)setIsCyclingNlgAvailable:(BOOL)a3
{
  *(_QWORD *)&self->_flags |= 0x200000400000uLL;
  self->_isCyclingNlgAvailable = a3;
}

- (void)setHasIsCyclingNlgAvailable:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000000;
  if (a3)
    v3 = 0x200000400000;
  self->_flags = ($896FCD321D059B35A66825024FB599E5)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFBFFFFFLL | v3);
}

- (BOOL)hasIsCyclingNlgAvailable
{
  return (*((unsigned __int8 *)&self->_flags + 2) >> 6) & 1;
}

- (BOOL)isCoarseLocationUsed
{
  return self->_isCoarseLocationUsed;
}

- (void)setIsCoarseLocationUsed:(BOOL)a3
{
  *(_QWORD *)&self->_flags |= 0x200000200000uLL;
  self->_isCoarseLocationUsed = a3;
}

- (void)setHasIsCoarseLocationUsed:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000000;
  if (a3)
    v3 = 0x200000200000;
  self->_flags = ($896FCD321D059B35A66825024FB599E5)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFDFFFFFLL | v3);
}

- (BOOL)hasIsCoarseLocationUsed
{
  return (*((unsigned __int8 *)&self->_flags + 2) >> 5) & 1;
}

- (BOOL)isVlfImprovementUsed
{
  return self->_isVlfImprovementUsed;
}

- (void)setIsVlfImprovementUsed:(BOOL)a3
{
  *(_QWORD *)&self->_flags |= 0x200400000000uLL;
  self->_isVlfImprovementUsed = a3;
}

- (void)setHasIsVlfImprovementUsed:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000000;
  if (a3)
    v3 = 0x200400000000;
  self->_flags = ($896FCD321D059B35A66825024FB599E5)(*(_QWORD *)&self->_flags & 0xFFFFFFFBFFFFFFFFLL | v3);
}

- (BOOL)hasIsVlfImprovementUsed
{
  return (*((unsigned __int8 *)&self->_flags + 4) >> 2) & 1;
}

- (BOOL)acceptedCyclingWorkout
{
  return self->_acceptedCyclingWorkout;
}

- (void)setAcceptedCyclingWorkout:(BOOL)a3
{
  *(_QWORD *)&self->_flags |= 0x200000004000uLL;
  self->_acceptedCyclingWorkout = a3;
}

- (void)setHasAcceptedCyclingWorkout:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000000;
  if (a3)
    v3 = 0x200000004000;
  self->_flags = ($896FCD321D059B35A66825024FB599E5)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFBFFFLL | v3);
}

- (BOOL)hasAcceptedCyclingWorkout
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 6) & 1;
}

- (BOOL)batteryDied
{
  return self->_batteryDied;
}

- (void)setBatteryDied:(BOOL)a3
{
  *(_QWORD *)&self->_flags |= 0x200000040000uLL;
  self->_batteryDied = a3;
}

- (void)setHasBatteryDied:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000000;
  if (a3)
    v3 = 0x200000040000;
  self->_flags = ($896FCD321D059B35A66825024FB599E5)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFBFFFFLL | v3);
}

- (BOOL)hasBatteryDied
{
  return (*((unsigned __int8 *)&self->_flags + 2) >> 2) & 1;
}

- (BOOL)chargingStopAdded
{
  return self->_chargingStopAdded;
}

- (void)setChargingStopAdded:(BOOL)a3
{
  *(_QWORD *)&self->_flags |= 0x200000080000uLL;
  self->_chargingStopAdded = a3;
}

- (void)setHasChargingStopAdded:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000000;
  if (a3)
    v3 = 0x200000080000;
  self->_flags = ($896FCD321D059B35A66825024FB599E5)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFF7FFFFLL | v3);
}

- (BOOL)hasChargingStopAdded
{
  return (*((unsigned __int8 *)&self->_flags + 2) >> 3) & 1;
}

- (BOOL)isSiriEngaged
{
  return self->_isSiriEngaged;
}

- (void)setIsSiriEngaged:(BOOL)a3
{
  *(_QWORD *)&self->_flags |= 0x200008000000uLL;
  self->_isSiriEngaged = a3;
}

- (void)setHasIsSiriEngaged:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000000;
  if (a3)
    v3 = 0x200008000000;
  self->_flags = ($896FCD321D059B35A66825024FB599E5)(*(_QWORD *)&self->_flags & 0xFFFFFFFFF7FFFFFFLL | v3);
}

- (BOOL)hasIsSiriEngaged
{
  return (*((unsigned __int8 *)&self->_flags + 3) >> 3) & 1;
}

- (void)_readTripOrigin
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 176));
    if ((*(_BYTE *)(a1 + 245) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventDirectionsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTripOrigin_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 176));
  }
}

- (BOOL)hasTripOrigin
{
  -[GEOLogMsgEventDirections _readTripOrigin]((uint64_t)self);
  return self->_tripOrigin != 0;
}

- (GEOLatLng)tripOrigin
{
  -[GEOLogMsgEventDirections _readTripOrigin]((uint64_t)self);
  return self->_tripOrigin;
}

- (void)setTripOrigin:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x280000000000uLL;
  objc_storeStrong((id *)&self->_tripOrigin, a3);
}

- (BOOL)isBadEvExperience
{
  return self->_isBadEvExperience;
}

- (void)setIsBadEvExperience:(BOOL)a3
{
  *(_QWORD *)&self->_flags |= 0x200000100000uLL;
  self->_isBadEvExperience = a3;
}

- (void)setHasIsBadEvExperience:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000000;
  if (a3)
    v3 = 0x200000100000;
  self->_flags = ($896FCD321D059B35A66825024FB599E5)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFEFFFFFLL | v3);
}

- (BOOL)hasIsBadEvExperience
{
  return (*((unsigned __int8 *)&self->_flags + 2) >> 4) & 1;
}

- (BOOL)isEvSampleTrip
{
  return self->_isEvSampleTrip;
}

- (void)setIsEvSampleTrip:(BOOL)a3
{
  *(_QWORD *)&self->_flags |= 0x200001000000uLL;
  self->_isEvSampleTrip = a3;
}

- (void)setHasIsEvSampleTrip:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000000;
  if (a3)
    v3 = 0x200001000000;
  self->_flags = ($896FCD321D059B35A66825024FB599E5)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFEFFFFFFLL | v3);
}

- (BOOL)hasIsEvSampleTrip
{
  return *((_BYTE *)&self->_flags + 3) & 1;
}

- (unsigned)stateOfChargeAtOrigin
{
  return self->_stateOfChargeAtOrigin;
}

- (void)setStateOfChargeAtOrigin:(unsigned int)a3
{
  *(_QWORD *)&self->_flags |= 0x200000000400uLL;
  self->_stateOfChargeAtOrigin = a3;
}

- (void)setHasStateOfChargeAtOrigin:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000000;
  if (a3)
    v3 = 0x200000000400;
  self->_flags = ($896FCD321D059B35A66825024FB599E5)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFBFFLL | v3);
}

- (BOOL)hasStateOfChargeAtOrigin
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 2) & 1;
}

- (unsigned)stateOfChargeAtDestPredicted
{
  return self->_stateOfChargeAtDestPredicted;
}

- (void)setStateOfChargeAtDestPredicted:(unsigned int)a3
{
  *(_QWORD *)&self->_flags |= 0x200000000200uLL;
  self->_stateOfChargeAtDestPredicted = a3;
}

- (void)setHasStateOfChargeAtDestPredicted:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000000;
  if (a3)
    v3 = 0x200000000200;
  self->_flags = ($896FCD321D059B35A66825024FB599E5)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFDFFLL | v3);
}

- (BOOL)hasStateOfChargeAtDestPredicted
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 1) & 1;
}

- (unsigned)stateOfChargeAtDestActual
{
  return self->_stateOfChargeAtDestActual;
}

- (void)setStateOfChargeAtDestActual:(unsigned int)a3
{
  *(_QWORD *)&self->_flags |= 0x200000000100uLL;
  self->_stateOfChargeAtDestActual = a3;
}

- (void)setHasStateOfChargeAtDestActual:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000000;
  if (a3)
    v3 = 0x200000000100;
  self->_flags = ($896FCD321D059B35A66825024FB599E5)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFEFFLL | v3);
}

- (BOOL)hasStateOfChargeAtDestActual
{
  return *((_BYTE *)&self->_flags + 1) & 1;
}

- (unsigned)stateOfChargeDiffAtDest
{
  return self->_stateOfChargeDiffAtDest;
}

- (void)setStateOfChargeDiffAtDest:(unsigned int)a3
{
  *(_QWORD *)&self->_flags |= 0x200000000800uLL;
  self->_stateOfChargeDiffAtDest = a3;
}

- (void)setHasStateOfChargeDiffAtDest:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000000;
  if (a3)
    v3 = 0x200000000800;
  self->_flags = ($896FCD321D059B35A66825024FB599E5)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFF7FFLL | v3);
}

- (BOOL)hasStateOfChargeDiffAtDest
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 3) & 1;
}

- (void)_readWaypoints
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 176));
    if ((*(_BYTE *)(a1 + 245) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventDirectionsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readWaypoints_tags_2);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 176));
  }
}

- (NSMutableArray)waypoints
{
  -[GEOLogMsgEventDirections _readWaypoints]((uint64_t)self);
  return self->_waypoints;
}

- (void)setWaypoints:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *waypoints;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x100000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x200000000000uLL;
  waypoints = self->_waypoints;
  self->_waypoints = v4;

}

- (void)clearWaypoints
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x100000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(_QWORD *)&self->_flags |= 0x200000000000uLL;
  -[NSMutableArray removeAllObjects](self->_waypoints, "removeAllObjects");
}

- (void)addWaypoints:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOLogMsgEventDirections _readWaypoints]((uint64_t)self);
  -[GEOLogMsgEventDirections _addNoFlagsWaypoints:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x100000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x200000000000uLL;
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

- (unint64_t)waypointsCount
{
  -[GEOLogMsgEventDirections _readWaypoints]((uint64_t)self);
  return -[NSMutableArray count](self->_waypoints, "count");
}

- (id)waypointsAtIndex:(unint64_t)a3
{
  -[GEOLogMsgEventDirections _readWaypoints]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_waypoints, "objectAtIndex:", a3);
}

+ (Class)waypointsType
{
  return (Class)objc_opt_class();
}

- (void)_readEvConsumptionModel
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 176));
    if ((*(_BYTE *)(a1 + 245) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventDirectionsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readEvConsumptionModel_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 176));
  }
}

- (BOOL)hasEvConsumptionModel
{
  -[GEOLogMsgEventDirections _readEvConsumptionModel]((uint64_t)self);
  return self->_evConsumptionModel != 0;
}

- (NSString)evConsumptionModel
{
  -[GEOLogMsgEventDirections _readEvConsumptionModel]((uint64_t)self);
  return self->_evConsumptionModel;
}

- (void)setEvConsumptionModel:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x210000000000uLL;
  objc_storeStrong((id *)&self->_evConsumptionModel, a3);
}

- (void)_readEvChargingMode
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 176));
    if ((*(_BYTE *)(a1 + 244) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventDirectionsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readEvChargingMode_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 176));
  }
}

- (BOOL)hasEvChargingMode
{
  -[GEOLogMsgEventDirections _readEvChargingMode]((uint64_t)self);
  return self->_evChargingMode != 0;
}

- (NSString)evChargingMode
{
  -[GEOLogMsgEventDirections _readEvChargingMode]((uint64_t)self);
  return self->_evChargingMode;
}

- (void)setEvChargingMode:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x208000000000uLL;
  objc_storeStrong((id *)&self->_evChargingMode, a3);
}

- (int)activeNavMode
{
  os_unfair_lock_s *p_readerLock;
  $896FCD321D059B35A66825024FB599E5 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_BYTE *)&flags & 0x10) != 0)
    return self->_activeNavMode;
  else
    return 0;
}

- (void)setActiveNavMode:(int)a3
{
  *(_QWORD *)&self->_flags |= 0x200000000010uLL;
  self->_activeNavMode = a3;
}

- (void)setHasActiveNavMode:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000000;
  if (a3)
    v3 = 0x200000000010;
  self->_flags = ($896FCD321D059B35A66825024FB599E5)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFFEFLL | v3);
}

- (BOOL)hasActiveNavMode
{
  return (*(_BYTE *)&self->_flags >> 4) & 1;
}

- (id)activeNavModeAsString:(int)a3
{
  if (a3 < 7)
    return off_1E1C22C88[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsActiveNavMode:(id)a3
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

- (BOOL)arWalkingUsedInRoutePlanning
{
  return self->_arWalkingUsedInRoutePlanning;
}

- (void)setArWalkingUsedInRoutePlanning:(BOOL)a3
{
  *(_QWORD *)&self->_flags |= 0x200000010000uLL;
  self->_arWalkingUsedInRoutePlanning = a3;
}

- (void)setHasArWalkingUsedInRoutePlanning:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000000;
  if (a3)
    v3 = 0x200000010000;
  self->_flags = ($896FCD321D059B35A66825024FB599E5)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFEFFFFLL | v3);
}

- (BOOL)hasArWalkingUsedInRoutePlanning
{
  return *((_BYTE *)&self->_flags + 2) & 1;
}

- (BOOL)arWalkingUsedInNavigation
{
  return self->_arWalkingUsedInNavigation;
}

- (void)setArWalkingUsedInNavigation:(BOOL)a3
{
  *(_QWORD *)&self->_flags |= 0x200000008000uLL;
  self->_arWalkingUsedInNavigation = a3;
}

- (void)setHasArWalkingUsedInNavigation:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000000;
  if (a3)
    v3 = 0x200000008000;
  self->_flags = ($896FCD321D059B35A66825024FB599E5)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFF7FFFLL | v3);
}

- (BOOL)hasArWalkingUsedInNavigation
{
  return *((unsigned __int8 *)&self->_flags + 1) >> 7;
}

- (int)voiceGuidanceLevel
{
  os_unfair_lock_s *p_readerLock;
  $896FCD321D059B35A66825024FB599E5 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_WORD *)&flags & 0x1000) != 0)
    return self->_voiceGuidanceLevel;
  else
    return 0;
}

- (void)setVoiceGuidanceLevel:(int)a3
{
  *(_QWORD *)&self->_flags |= 0x200000001000uLL;
  self->_voiceGuidanceLevel = a3;
}

- (void)setHasVoiceGuidanceLevel:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000000;
  if (a3)
    v3 = 0x200000001000;
  self->_flags = ($896FCD321D059B35A66825024FB599E5)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFEFFFLL | v3);
}

- (BOOL)hasVoiceGuidanceLevel
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 4) & 1;
}

- (id)voiceGuidanceLevelAsString:(int)a3
{
  if (a3 < 4)
    return off_1E1C23248[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsVoiceGuidanceLevel:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LEVEL_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LEVEL_NONE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LEVEL_INCIDENTS")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("LEVEL_FULL")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hFPEnabled
{
  return self->_hFPEnabled;
}

- (void)setHFPEnabled:(BOOL)a3
{
  *(_QWORD *)&self->_flags |= 0x200000002000uLL;
  self->_hFPEnabled = a3;
}

- (void)setHasHFPEnabled:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000000;
  if (a3)
    v3 = 0x200000002000;
  self->_flags = ($896FCD321D059B35A66825024FB599E5)(*(_QWORD *)&self->_flags & 0xFFFFDFFFFFFFDFFFLL | v3);
}

- (BOOL)hasHFPEnabled
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 5) & 1;
}

- (BOOL)isInParkingMode
{
  return self->_isInParkingMode;
}

- (void)setIsInParkingMode:(BOOL)a3
{
  *(_QWORD *)&self->_flags |= 0x200002000000uLL;
  self->_isInParkingMode = a3;
}

- (void)setHasIsInParkingMode:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000000;
  if (a3)
    v3 = 0x200002000000;
  self->_flags = ($896FCD321D059B35A66825024FB599E5)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFDFFFFFFLL | v3);
}

- (BOOL)hasIsInParkingMode
{
  return (*((unsigned __int8 *)&self->_flags + 3) >> 1) & 1;
}

- (BOOL)isSuggestToWalkingTriggered
{
  return self->_isSuggestToWalkingTriggered;
}

- (void)setIsSuggestToWalkingTriggered:(BOOL)a3
{
  *(_QWORD *)&self->_flags |= 0x200020000000uLL;
  self->_isSuggestToWalkingTriggered = a3;
}

- (void)setHasIsSuggestToWalkingTriggered:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000000;
  if (a3)
    v3 = 0x200020000000;
  self->_flags = ($896FCD321D059B35A66825024FB599E5)(*(_QWORD *)&self->_flags & 0xFFFFFFFFDFFFFFFFLL | v3);
}

- (BOOL)hasIsSuggestToWalkingTriggered
{
  return (*((unsigned __int8 *)&self->_flags + 3) >> 5) & 1;
}

- (BOOL)isTransitedToWalking
{
  return self->_isTransitedToWalking;
}

- (void)setIsTransitedToWalking:(BOOL)a3
{
  *(_QWORD *)&self->_flags |= 0x200080000000uLL;
  self->_isTransitedToWalking = a3;
}

- (void)setHasIsTransitedToWalking:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000000;
  if (a3)
    v3 = 0x200080000000;
  self->_flags = ($896FCD321D059B35A66825024FB599E5)(*(_QWORD *)&self->_flags & 0xFFFFFFFF7FFFFFFFLL | v3);
}

- (BOOL)hasIsTransitedToWalking
{
  return *((unsigned __int8 *)&self->_flags + 3) >> 7;
}

- (BOOL)isSuggestToFindmyTriggered
{
  return self->_isSuggestToFindmyTriggered;
}

- (void)setIsSuggestToFindmyTriggered:(BOOL)a3
{
  *(_QWORD *)&self->_flags |= 0x200010000000uLL;
  self->_isSuggestToFindmyTriggered = a3;
}

- (void)setHasIsSuggestToFindmyTriggered:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000000;
  if (a3)
    v3 = 0x200010000000;
  self->_flags = ($896FCD321D059B35A66825024FB599E5)(*(_QWORD *)&self->_flags & 0xFFFFFFFFEFFFFFFFLL | v3);
}

- (BOOL)hasIsSuggestToFindmyTriggered
{
  return (*((unsigned __int8 *)&self->_flags + 3) >> 4) & 1;
}

- (BOOL)isTransitedToFindmy
{
  return self->_isTransitedToFindmy;
}

- (void)setIsTransitedToFindmy:(BOOL)a3
{
  *(_QWORD *)&self->_flags |= 0x200040000000uLL;
  self->_isTransitedToFindmy = a3;
}

- (void)setHasIsTransitedToFindmy:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000000;
  if (a3)
    v3 = 0x200040000000;
  self->_flags = ($896FCD321D059B35A66825024FB599E5)(*(_QWORD *)&self->_flags & 0xFFFFFFFFBFFFFFFFLL | v3);
}

- (BOOL)hasIsTransitedToFindmy
{
  return (*((unsigned __int8 *)&self->_flags + 3) >> 6) & 1;
}

- (BOOL)isEndRouteTermination
{
  return self->_isEndRouteTermination;
}

- (void)setIsEndRouteTermination:(BOOL)a3
{
  *(_QWORD *)&self->_flags |= 0x200000800000uLL;
  self->_isEndRouteTermination = a3;
}

- (void)setHasIsEndRouteTermination:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000000;
  if (a3)
    v3 = 0x200000800000;
  self->_flags = ($896FCD321D059B35A66825024FB599E5)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFF7FFFFFLL | v3);
}

- (BOOL)hasIsEndRouteTermination
{
  return *((unsigned __int8 *)&self->_flags + 2) >> 7;
}

- (BOOL)isParkedCarTermination
{
  return self->_isParkedCarTermination;
}

- (void)setIsParkedCarTermination:(BOOL)a3
{
  *(_QWORD *)&self->_flags |= 0x200004000000uLL;
  self->_isParkedCarTermination = a3;
}

- (void)setHasIsParkedCarTermination:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000000;
  if (a3)
    v3 = 0x200004000000;
  self->_flags = ($896FCD321D059B35A66825024FB599E5)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFBFFFFFFLL | v3);
}

- (BOOL)hasIsParkedCarTermination
{
  return (*((unsigned __int8 *)&self->_flags + 3) >> 2) & 1;
}

- (BOOL)isTransitionToWalkingTermination
{
  return self->_isTransitionToWalkingTermination;
}

- (void)setIsTransitionToWalkingTermination:(BOOL)a3
{
  *(_QWORD *)&self->_flags |= 0x200200000000uLL;
  self->_isTransitionToWalkingTermination = a3;
}

- (void)setHasIsTransitionToWalkingTermination:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000000;
  if (a3)
    v3 = 0x200200000000;
  self->_flags = ($896FCD321D059B35A66825024FB599E5)(*(_QWORD *)&self->_flags & 0xFFFFFFFDFFFFFFFFLL | v3);
}

- (BOOL)hasIsTransitionToWalkingTermination
{
  return (*((unsigned __int8 *)&self->_flags + 4) >> 1) & 1;
}

- (BOOL)isTransitionToFindmyTermination
{
  return self->_isTransitionToFindmyTermination;
}

- (void)setIsTransitionToFindmyTermination:(BOOL)a3
{
  *(_QWORD *)&self->_flags |= 0x200100000000uLL;
  self->_isTransitionToFindmyTermination = a3;
}

- (void)setHasIsTransitionToFindmyTermination:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000000;
  if (a3)
    v3 = 0x200100000000;
  self->_flags = ($896FCD321D059B35A66825024FB599E5)(*(_QWORD *)&self->_flags & 0xFFFFFFFEFFFFFFFFLL | v3);
}

- (BOOL)hasIsTransitionToFindmyTermination
{
  return *((_BYTE *)&self->_flags + 4) & 1;
}

- (void)_readParkingDetectionLocation
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 176));
    if ((*(_BYTE *)(a1 + 245) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventDirectionsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readParkingDetectionLocation_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 176));
  }
}

- (BOOL)hasParkingDetectionLocation
{
  -[GEOLogMsgEventDirections _readParkingDetectionLocation]((uint64_t)self);
  return self->_parkingDetectionLocation != 0;
}

- (GEOLocation)parkingDetectionLocation
{
  -[GEOLogMsgEventDirections _readParkingDetectionLocation]((uint64_t)self);
  return self->_parkingDetectionLocation;
}

- (void)setParkingDetectionLocation:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x240000000000uLL;
  objc_storeStrong((id *)&self->_parkingDetectionLocation, a3);
}

- (double)timeBetweenParkedAndArrival
{
  return self->_timeBetweenParkedAndArrival;
}

- (void)setTimeBetweenParkedAndArrival:(double)a3
{
  *(_QWORD *)&self->_flags |= 0x200000000008uLL;
  self->_timeBetweenParkedAndArrival = a3;
}

- (void)setHasTimeBetweenParkedAndArrival:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000000;
  if (a3)
    v3 = 0x200000000008;
  self->_flags = ($896FCD321D059B35A66825024FB599E5)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFFF7 | v3);
}

- (BOOL)hasTimeBetweenParkedAndArrival
{
  return (*(_BYTE *)&self->_flags >> 3) & 1;
}

- (unsigned)arrivedAtDestinationCount
{
  return self->_arrivedAtDestinationCount;
}

- (void)setArrivedAtDestinationCount:(unsigned int)a3
{
  *(_QWORD *)&self->_flags |= 0x200000000020uLL;
  self->_arrivedAtDestinationCount = a3;
}

- (void)setHasArrivedAtDestinationCount:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000000;
  if (a3)
    v3 = 0x200000000020;
  self->_flags = ($896FCD321D059B35A66825024FB599E5)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFFDFLL | v3);
}

- (BOOL)hasArrivedAtDestinationCount
{
  return (*(_BYTE *)&self->_flags >> 5) & 1;
}

- (unsigned)inParkingModeCount
{
  return self->_inParkingModeCount;
}

- (void)setInParkingModeCount:(unsigned int)a3
{
  *(_QWORD *)&self->_flags |= 0x200000000040uLL;
  self->_inParkingModeCount = a3;
}

- (void)setHasInParkingModeCount:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000000;
  if (a3)
    v3 = 0x200000000040;
  self->_flags = ($896FCD321D059B35A66825024FB599E5)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFFBFLL | v3);
}

- (BOOL)hasInParkingModeCount
{
  return (*(_BYTE *)&self->_flags >> 6) & 1;
}

- (void)_readArrivalLocation
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 176));
    if ((*(_BYTE *)(a1 + 244) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventDirectionsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readArrivalLocation_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 176));
  }
}

- (BOOL)hasArrivalLocation
{
  -[GEOLogMsgEventDirections _readArrivalLocation]((uint64_t)self);
  return self->_arrivalLocation != 0;
}

- (GEOLocation)arrivalLocation
{
  -[GEOLogMsgEventDirections _readArrivalLocation]((uint64_t)self);
  return self->_arrivalLocation;
}

- (void)setArrivalLocation:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x201000000000uLL;
  objc_storeStrong((id *)&self->_arrivalLocation, a3);
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
  v8.super_class = (Class)GEOLogMsgEventDirections;
  -[GEOLogMsgEventDirections description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOLogMsgEventDirections dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgEventDirections _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  id v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  id v18;
  uint64_t v19;
  void *v20;
  const __CFString *v21;
  id v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  void *v29;
  id v30;
  const __CFString *v31;
  uint64_t v32;
  void *v33;
  const __CFString *v34;
  void *v35;
  void *v36;
  void *v37;
  const __CFString *v38;
  void *v39;
  const __CFString *v40;
  const __CFString *v41;
  id v42;
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
  void *v57;
  const __CFString *v58;
  void *v59;
  const __CFString *v60;
  id v61;
  uint64_t v62;
  void *v63;
  const __CFString *v64;
  void *v65;
  id v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t k;
  void *v71;
  id v72;
  void *v73;
  const __CFString *v74;
  void *v75;
  const __CFString *v76;
  uint64_t v77;
  void *v78;
  const __CFString *v79;
  void *v80;
  void *v81;
  void *v82;
  const __CFString *v83;
  void *v84;
  const __CFString *v85;
  void *v86;
  const __CFString *v87;
  void *v88;
  const __CFString *v89;
  void *v90;
  const __CFString *v91;
  void *v92;
  const __CFString *v93;
  uint64_t v94;
  __CFString *v95;
  id v96;
  uint64_t v97;
  void *v98;
  const __CFString *v99;
  void *v100;
  void *v101;
  void *v102;
  const __CFString *v103;
  void *v104;
  const __CFString *v105;
  void *v106;
  const __CFString *v107;
  id v108;
  id v109;
  const __CFString *v111;
  void *v112;
  const __CFString *v113;
  void *v114;
  const __CFString *v115;
  uint64_t v116;
  __CFString *v117;
  const __CFString *v118;
  void *v119;
  const __CFString *v120;
  void *v121;
  const __CFString *v122;
  void *v123;
  const __CFString *v124;
  void *v125;
  const __CFString *v126;
  void *v127;
  const __CFString *v128;
  void *v129;
  const __CFString *v130;
  void *v131;
  const __CFString *v132;
  void *v133;
  const __CFString *v134;
  void *v135;
  const __CFString *v136;
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
  _BYTE v149[128];
  _BYTE v150[128];
  _BYTE v151[128];
  uint64_t v152;

  v152 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 88), "count"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 88), "count"));
    v145 = 0u;
    v146 = 0u;
    v147 = 0u;
    v148 = 0u;
    v6 = *(id *)(a1 + 88);
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v145, v151, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v146;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v146 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v145 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v11, "jsonRepresentation");
          else
            objc_msgSend(v11, "dictionaryRepresentation");
          v12 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v5, "addObject:", v12);
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v145, v151, 16);
      }
      while (v8);
    }

    if (a2)
      v13 = CFSTR("directionsFeedback");
    else
      v13 = CFSTR("directions_feedback");
    objc_msgSend(v4, "setObject:forKey:", v5, v13);

  }
  objc_msgSend((id)a1, "finalLocation");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v14, "jsonRepresentation");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = CFSTR("finalLocation");
    }
    else
    {
      objc_msgSend(v14, "dictionaryRepresentation");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = CFSTR("final_location");
    }
    v18 = v16;

    objc_msgSend(v4, "setObject:forKey:", v18, v17);
  }

  v19 = *(_QWORD *)(a1 + 240);
  if ((v19 & 0x20000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 220));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v40 = CFSTR("arrivedAtDestination");
    else
      v40 = CFSTR("arrived_at_destination");
    objc_msgSend(v4, "setObject:forKey:", v39, v40);

    v19 = *(_QWORD *)(a1 + 240);
    if ((v19 & 1) == 0)
    {
LABEL_24:
      if ((v19 & 4) == 0)
        goto LABEL_25;
      goto LABEL_69;
    }
  }
  else if ((v19 & 1) == 0)
  {
    goto LABEL_24;
  }
  if (a2)
    v41 = CFSTR("navigationAudioFeedback");
  else
    v41 = CFSTR("navigation_audio_feedback");
  _GEONavigationAudioFeedbackDictionaryRepresentation((unsigned __int8 *)(a1 + 16), a2);
  v42 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setObject:forKey:", v42, v41);
  v19 = *(_QWORD *)(a1 + 240);
  if ((v19 & 4) == 0)
  {
LABEL_25:
    if ((v19 & 2) == 0)
      goto LABEL_30;
    goto LABEL_26;
  }
LABEL_69:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 104));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v44 = CFSTR("durationOfTrip");
  else
    v44 = CFSTR("duration_of_trip");
  objc_msgSend(v4, "setObject:forKey:", v43, v44);

  if ((*(_QWORD *)(a1 + 240) & 2) != 0)
  {
LABEL_26:
    _GEOSessionIDDictionaryRepresentation((_QWORD *)(a1 + 64));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v21 = CFSTR("navSessionId");
    else
      v21 = CFSTR("nav_session_id");
    v22 = v20;

    objc_msgSend(v4, "setObject:forKey:", v22, v21);
  }
LABEL_30:
  if (objc_msgSend(*(id *)(a1 + 96), "count"))
  {
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 96), "count"));
    v141 = 0u;
    v142 = 0u;
    v143 = 0u;
    v144 = 0u;
    v24 = *(id *)(a1 + 96);
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v141, v150, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v142;
      do
      {
        for (j = 0; j != v26; ++j)
        {
          if (*(_QWORD *)v142 != v27)
            objc_enumerationMutation(v24);
          v29 = *(void **)(*((_QWORD *)&v141 + 1) + 8 * j);
          if ((a2 & 1) != 0)
            objc_msgSend(v29, "jsonRepresentation");
          else
            objc_msgSend(v29, "dictionaryRepresentation");
          v30 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v23, "addObject:", v30);
        }
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v141, v150, 16);
      }
      while (v26);
    }

    if (a2)
      v31 = CFSTR("durationInNavigationMode");
    else
      v31 = CFSTR("duration_in_navigation_mode");
    objc_msgSend(v4, "setObject:forKey:", v23, v31);

  }
  v32 = *(_QWORD *)(a1 + 240);
  if ((v32 & 0x80) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 192));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v46 = CFSTR("originalEta");
    else
      v46 = CFSTR("original_eta");
    objc_msgSend(v4, "setObject:forKey:", v45, v46);

    v32 = *(_QWORD *)(a1 + 240);
    if ((v32 & 0x800000000) == 0)
    {
LABEL_47:
      if ((v32 & 0x400000) == 0)
        goto LABEL_48;
      goto LABEL_82;
    }
  }
  else if ((v32 & 0x800000000) == 0)
  {
    goto LABEL_47;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 238));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v48 = CFSTR("preArrival");
  else
    v48 = CFSTR("pre_arrival");
  objc_msgSend(v4, "setObject:forKey:", v47, v48);

  v32 = *(_QWORD *)(a1 + 240);
  if ((v32 & 0x400000) == 0)
  {
LABEL_48:
    if ((v32 & 0x200000) == 0)
      goto LABEL_49;
    goto LABEL_86;
  }
LABEL_82:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 225));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v50 = CFSTR("isCyclingNlgAvailable");
  else
    v50 = CFSTR("is_cycling_nlg_available");
  objc_msgSend(v4, "setObject:forKey:", v49, v50);

  v32 = *(_QWORD *)(a1 + 240);
  if ((v32 & 0x200000) == 0)
  {
LABEL_49:
    if ((v32 & 0x400000000) == 0)
      goto LABEL_50;
    goto LABEL_90;
  }
LABEL_86:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 224));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v52 = CFSTR("isCoarseLocationUsed");
  else
    v52 = CFSTR("is_coarse_location_used");
  objc_msgSend(v4, "setObject:forKey:", v51, v52);

  v32 = *(_QWORD *)(a1 + 240);
  if ((v32 & 0x400000000) == 0)
  {
LABEL_50:
    if ((v32 & 0x4000) == 0)
      goto LABEL_51;
    goto LABEL_94;
  }
LABEL_90:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 237));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v54 = CFSTR("isVlfImprovementUsed");
  else
    v54 = CFSTR("is_vlf_improvement_used");
  objc_msgSend(v4, "setObject:forKey:", v53, v54);

  v32 = *(_QWORD *)(a1 + 240);
  if ((v32 & 0x4000) == 0)
  {
LABEL_51:
    if ((v32 & 0x40000) == 0)
      goto LABEL_52;
    goto LABEL_98;
  }
LABEL_94:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 217));
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v56 = CFSTR("acceptedCyclingWorkout");
  else
    v56 = CFSTR("accepted_cycling_workout");
  objc_msgSend(v4, "setObject:forKey:", v55, v56);

  v32 = *(_QWORD *)(a1 + 240);
  if ((v32 & 0x40000) == 0)
  {
LABEL_52:
    if ((v32 & 0x80000) == 0)
      goto LABEL_53;
    goto LABEL_102;
  }
LABEL_98:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 221));
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v58 = CFSTR("batteryDied");
  else
    v58 = CFSTR("battery_died");
  objc_msgSend(v4, "setObject:forKey:", v57, v58);

  v32 = *(_QWORD *)(a1 + 240);
  if ((v32 & 0x80000) == 0)
  {
LABEL_53:
    if ((v32 & 0x8000000) == 0)
      goto LABEL_58;
    goto LABEL_54;
  }
LABEL_102:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 222));
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v60 = CFSTR("chargingStopAdded");
  else
    v60 = CFSTR("charging_stop_added");
  objc_msgSend(v4, "setObject:forKey:", v59, v60);

  if ((*(_QWORD *)(a1 + 240) & 0x8000000) != 0)
  {
LABEL_54:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 230));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v34 = CFSTR("isSiriEngaged");
    else
      v34 = CFSTR("is_siri_engaged");
    objc_msgSend(v4, "setObject:forKey:", v33, v34);

  }
LABEL_58:
  objc_msgSend((id)a1, "tripOrigin");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v35;
  if (v35)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v35, "jsonRepresentation");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = CFSTR("tripOrigin");
    }
    else
    {
      objc_msgSend(v35, "dictionaryRepresentation");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = CFSTR("trip_origin");
    }
    v61 = v37;

    objc_msgSend(v4, "setObject:forKey:", v61, v38);
  }

  v62 = *(_QWORD *)(a1 + 240);
  if ((v62 & 0x100000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 223));
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v85 = CFSTR("isBadEvExperience");
    else
      v85 = CFSTR("is_bad_ev_experience");
    objc_msgSend(v4, "setObject:forKey:", v84, v85);

    v62 = *(_QWORD *)(a1 + 240);
    if ((v62 & 0x1000000) == 0)
    {
LABEL_111:
      if ((v62 & 0x400) == 0)
        goto LABEL_112;
      goto LABEL_170;
    }
  }
  else if ((v62 & 0x1000000) == 0)
  {
    goto LABEL_111;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 227));
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v87 = CFSTR("isEvSampleTrip");
  else
    v87 = CFSTR("is_ev_sample_trip");
  objc_msgSend(v4, "setObject:forKey:", v86, v87);

  v62 = *(_QWORD *)(a1 + 240);
  if ((v62 & 0x400) == 0)
  {
LABEL_112:
    if ((v62 & 0x200) == 0)
      goto LABEL_113;
    goto LABEL_174;
  }
LABEL_170:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 204));
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v89 = CFSTR("stateOfChargeAtOrigin");
  else
    v89 = CFSTR("state_of_charge_at_origin");
  objc_msgSend(v4, "setObject:forKey:", v88, v89);

  v62 = *(_QWORD *)(a1 + 240);
  if ((v62 & 0x200) == 0)
  {
LABEL_113:
    if ((v62 & 0x100) == 0)
      goto LABEL_114;
    goto LABEL_178;
  }
LABEL_174:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 200));
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v91 = CFSTR("stateOfChargeAtDestPredicted");
  else
    v91 = CFSTR("state_of_charge_at_dest_predicted");
  objc_msgSend(v4, "setObject:forKey:", v90, v91);

  v62 = *(_QWORD *)(a1 + 240);
  if ((v62 & 0x100) == 0)
  {
LABEL_114:
    if ((v62 & 0x800) == 0)
      goto LABEL_119;
    goto LABEL_115;
  }
LABEL_178:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 196));
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v93 = CFSTR("stateOfChargeAtDestActual");
  else
    v93 = CFSTR("state_of_charge_at_dest_actual");
  objc_msgSend(v4, "setObject:forKey:", v92, v93);

  if ((*(_QWORD *)(a1 + 240) & 0x800) != 0)
  {
LABEL_115:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 208));
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v64 = CFSTR("stateOfChargeDiffAtDest");
    else
      v64 = CFSTR("state_of_charge_diff_at_dest");
    objc_msgSend(v4, "setObject:forKey:", v63, v64);

  }
LABEL_119:
  if (objc_msgSend(*(id *)(a1 + 160), "count"))
  {
    v65 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 160), "count"));
    v137 = 0u;
    v138 = 0u;
    v139 = 0u;
    v140 = 0u;
    v66 = *(id *)(a1 + 160);
    v67 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v137, v149, 16);
    if (v67)
    {
      v68 = v67;
      v69 = *(_QWORD *)v138;
      do
      {
        for (k = 0; k != v68; ++k)
        {
          if (*(_QWORD *)v138 != v69)
            objc_enumerationMutation(v66);
          v71 = *(void **)(*((_QWORD *)&v137 + 1) + 8 * k);
          if ((a2 & 1) != 0)
            objc_msgSend(v71, "jsonRepresentation");
          else
            objc_msgSend(v71, "dictionaryRepresentation");
          v72 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v65, "addObject:", v72);
        }
        v68 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v137, v149, 16);
      }
      while (v68);
    }

    objc_msgSend(v4, "setObject:forKey:", v65, CFSTR("waypoints"));
  }
  objc_msgSend((id)a1, "evConsumptionModel");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  if (v73)
  {
    if (a2)
      v74 = CFSTR("evConsumptionModel");
    else
      v74 = CFSTR("ev_consumption_model");
    objc_msgSend(v4, "setObject:forKey:", v73, v74);
  }

  objc_msgSend((id)a1, "evChargingMode");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  if (v75)
  {
    if (a2)
      v76 = CFSTR("evChargingMode");
    else
      v76 = CFSTR("ev_charging_mode");
    objc_msgSend(v4, "setObject:forKey:", v75, v76);
  }

  v77 = *(_QWORD *)(a1 + 240);
  if ((v77 & 0x10) != 0)
  {
    v94 = *(int *)(a1 + 180);
    if (v94 >= 7)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 180));
      v95 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v95 = off_1E1C22C88[v94];
    }
    if (a2)
      v111 = CFSTR("activeNavMode");
    else
      v111 = CFSTR("active_nav_mode");
    objc_msgSend(v4, "setObject:forKey:", v95, v111);

    v77 = *(_QWORD *)(a1 + 240);
    if ((v77 & 0x10000) == 0)
    {
LABEL_143:
      if ((v77 & 0x8000) == 0)
        goto LABEL_144;
      goto LABEL_218;
    }
  }
  else if ((v77 & 0x10000) == 0)
  {
    goto LABEL_143;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 219));
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v113 = CFSTR("arWalkingUsedInRoutePlanning");
  else
    v113 = CFSTR("ar_walking_used_in_route_planning");
  objc_msgSend(v4, "setObject:forKey:", v112, v113);

  v77 = *(_QWORD *)(a1 + 240);
  if ((v77 & 0x8000) == 0)
  {
LABEL_144:
    if ((v77 & 0x1000) == 0)
      goto LABEL_145;
    goto LABEL_222;
  }
LABEL_218:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 218));
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v115 = CFSTR("arWalkingUsedInNavigation");
  else
    v115 = CFSTR("ar_walking_used_in_navigation");
  objc_msgSend(v4, "setObject:forKey:", v114, v115);

  v77 = *(_QWORD *)(a1 + 240);
  if ((v77 & 0x1000) == 0)
  {
LABEL_145:
    if ((v77 & 0x2000) == 0)
      goto LABEL_146;
    goto LABEL_229;
  }
LABEL_222:
  v116 = *(int *)(a1 + 212);
  if (v116 >= 4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 212));
    v117 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v117 = off_1E1C23248[v116];
  }
  if (a2)
    v118 = CFSTR("voiceGuidanceLevel");
  else
    v118 = CFSTR("voice_guidance_level");
  objc_msgSend(v4, "setObject:forKey:", v117, v118);

  v77 = *(_QWORD *)(a1 + 240);
  if ((v77 & 0x2000) == 0)
  {
LABEL_146:
    if ((v77 & 0x2000000) == 0)
      goto LABEL_147;
    goto LABEL_233;
  }
LABEL_229:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 216));
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v120 = CFSTR("hFPEnabled");
  else
    v120 = CFSTR("HFP_enabled");
  objc_msgSend(v4, "setObject:forKey:", v119, v120);

  v77 = *(_QWORD *)(a1 + 240);
  if ((v77 & 0x2000000) == 0)
  {
LABEL_147:
    if ((v77 & 0x20000000) == 0)
      goto LABEL_148;
    goto LABEL_237;
  }
LABEL_233:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 228));
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v122 = CFSTR("isInParkingMode");
  else
    v122 = CFSTR("is_in_parking_mode");
  objc_msgSend(v4, "setObject:forKey:", v121, v122);

  v77 = *(_QWORD *)(a1 + 240);
  if ((v77 & 0x20000000) == 0)
  {
LABEL_148:
    if ((v77 & 0x80000000) == 0)
      goto LABEL_149;
    goto LABEL_241;
  }
LABEL_237:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 232));
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v124 = CFSTR("isSuggestToWalkingTriggered");
  else
    v124 = CFSTR("is_suggest_to_walking_triggered");
  objc_msgSend(v4, "setObject:forKey:", v123, v124);

  v77 = *(_QWORD *)(a1 + 240);
  if ((v77 & 0x80000000) == 0)
  {
LABEL_149:
    if ((v77 & 0x10000000) == 0)
      goto LABEL_150;
    goto LABEL_245;
  }
LABEL_241:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 234));
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v126 = CFSTR("isTransitedToWalking");
  else
    v126 = CFSTR("is_transited_to_walking");
  objc_msgSend(v4, "setObject:forKey:", v125, v126);

  v77 = *(_QWORD *)(a1 + 240);
  if ((v77 & 0x10000000) == 0)
  {
LABEL_150:
    if ((v77 & 0x40000000) == 0)
      goto LABEL_151;
    goto LABEL_249;
  }
LABEL_245:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 231));
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v128 = CFSTR("isSuggestToFindmyTriggered");
  else
    v128 = CFSTR("is_suggest_to_findmy_triggered");
  objc_msgSend(v4, "setObject:forKey:", v127, v128);

  v77 = *(_QWORD *)(a1 + 240);
  if ((v77 & 0x40000000) == 0)
  {
LABEL_151:
    if ((v77 & 0x800000) == 0)
      goto LABEL_152;
    goto LABEL_253;
  }
LABEL_249:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 233));
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v130 = CFSTR("isTransitedToFindmy");
  else
    v130 = CFSTR("is_transited_to_findmy");
  objc_msgSend(v4, "setObject:forKey:", v129, v130);

  v77 = *(_QWORD *)(a1 + 240);
  if ((v77 & 0x800000) == 0)
  {
LABEL_152:
    if ((v77 & 0x4000000) == 0)
      goto LABEL_153;
    goto LABEL_257;
  }
LABEL_253:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 226));
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v132 = CFSTR("isEndRouteTermination");
  else
    v132 = CFSTR("is_end_route_termination");
  objc_msgSend(v4, "setObject:forKey:", v131, v132);

  v77 = *(_QWORD *)(a1 + 240);
  if ((v77 & 0x4000000) == 0)
  {
LABEL_153:
    if ((v77 & 0x200000000) == 0)
      goto LABEL_154;
    goto LABEL_261;
  }
LABEL_257:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 229));
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v134 = CFSTR("isParkedCarTermination");
  else
    v134 = CFSTR("is_parked_car_termination");
  objc_msgSend(v4, "setObject:forKey:", v133, v134);

  v77 = *(_QWORD *)(a1 + 240);
  if ((v77 & 0x200000000) == 0)
  {
LABEL_154:
    if ((v77 & 0x100000000) == 0)
      goto LABEL_159;
    goto LABEL_155;
  }
LABEL_261:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 236));
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v136 = CFSTR("isTransitionToWalkingTermination");
  else
    v136 = CFSTR("is_transition_to_walking_termination");
  objc_msgSend(v4, "setObject:forKey:", v135, v136);

  if ((*(_QWORD *)(a1 + 240) & 0x100000000) != 0)
  {
LABEL_155:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 235));
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v79 = CFSTR("isTransitionToFindmyTermination");
    else
      v79 = CFSTR("is_transition_to_findmy_termination");
    objc_msgSend(v4, "setObject:forKey:", v78, v79);

  }
LABEL_159:
  objc_msgSend((id)a1, "parkingDetectionLocation");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v81 = v80;
  if (v80)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v80, "jsonRepresentation");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      v83 = CFSTR("parkingDetectionLocation");
    }
    else
    {
      objc_msgSend(v80, "dictionaryRepresentation");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      v83 = CFSTR("parking_detection_location");
    }
    v96 = v82;

    objc_msgSend(v4, "setObject:forKey:", v96, v83);
  }

  v97 = *(_QWORD *)(a1 + 240);
  if ((v97 & 8) == 0)
  {
    if ((v97 & 0x20) == 0)
      goto LABEL_189;
LABEL_201:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 184));
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v107 = CFSTR("arrivedAtDestinationCount");
    else
      v107 = CFSTR("arrived_at_destination_count");
    objc_msgSend(v4, "setObject:forKey:", v106, v107);

    if ((*(_QWORD *)(a1 + 240) & 0x40) == 0)
      goto LABEL_194;
    goto LABEL_190;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 144));
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v105 = CFSTR("timeBetweenParkedAndArrival");
  else
    v105 = CFSTR("time_between_parked_and_arrival");
  objc_msgSend(v4, "setObject:forKey:", v104, v105);

  v97 = *(_QWORD *)(a1 + 240);
  if ((v97 & 0x20) != 0)
    goto LABEL_201;
LABEL_189:
  if ((v97 & 0x40) != 0)
  {
LABEL_190:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 188));
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v99 = CFSTR("inParkingModeCount");
    else
      v99 = CFSTR("in_parking_mode_count");
    objc_msgSend(v4, "setObject:forKey:", v98, v99);

  }
LABEL_194:
  objc_msgSend((id)a1, "arrivalLocation");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  v101 = v100;
  if (v100)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v100, "jsonRepresentation");
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      v103 = CFSTR("arrivalLocation");
    }
    else
    {
      objc_msgSend(v100, "dictionaryRepresentation");
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      v103 = CFSTR("arrival_location");
    }
    v108 = v102;

    objc_msgSend(v4, "setObject:forKey:", v108, v103);
  }

  v109 = v4;
  return v109;
}

- (id)jsonRepresentation
{
  return -[GEOLogMsgEventDirections _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLogMsgEventDirections)initWithDictionary:(id)a3
{
  return (GEOLogMsgEventDirections *)-[GEOLogMsgEventDirections _initWithDictionary:isJSON:](self, a3, 0);
}

- (id)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  GEODirectionsFeedback *v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  GEOLocation *v19;
  uint64_t v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  const __CFString *v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
  uint64_t v37;
  GEODurationInNavigationMode *v38;
  uint64_t v39;
  void *v40;
  const __CFString *v41;
  void *v42;
  const __CFString *v43;
  void *v44;
  const __CFString *v45;
  void *v46;
  const __CFString *v47;
  void *v48;
  const __CFString *v49;
  void *v50;
  const __CFString *v51;
  void *v52;
  const __CFString *v53;
  void *v54;
  const __CFString *v55;
  void *v56;
  const __CFString *v57;
  void *v58;
  const __CFString *v59;
  void *v60;
  GEOLatLng *v61;
  uint64_t v62;
  void *v63;
  const __CFString *v64;
  void *v65;
  const __CFString *v66;
  void *v67;
  const __CFString *v68;
  void *v69;
  const __CFString *v70;
  void *v71;
  const __CFString *v72;
  void *v73;
  const __CFString *v74;
  void *v75;
  void *v76;
  id v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t k;
  uint64_t v82;
  GEOWaypointInfo *v83;
  uint64_t v84;
  void *v85;
  const __CFString *v86;
  void *v87;
  void *v88;
  const __CFString *v89;
  void *v90;
  void *v91;
  const __CFString *v92;
  void *v93;
  id v94;
  uint64_t v95;
  const __CFString *v96;
  void *v97;
  const __CFString *v98;
  void *v99;
  const __CFString *v100;
  void *v101;
  id v102;
  uint64_t v103;
  const __CFString *v104;
  void *v105;
  const __CFString *v106;
  void *v107;
  const __CFString *v108;
  void *v109;
  const __CFString *v110;
  void *v111;
  const __CFString *v112;
  void *v113;
  const __CFString *v114;
  void *v115;
  const __CFString *v116;
  void *v117;
  const __CFString *v118;
  void *v119;
  const __CFString *v120;
  void *v121;
  const __CFString *v122;
  void *v123;
  const __CFString *v124;
  void *v125;
  GEOLocation *v126;
  uint64_t v127;
  void *v128;
  const __CFString *v129;
  void *v130;
  const __CFString *v131;
  void *v132;
  const __CFString *v133;
  void *v134;
  const __CFString *v135;
  void *v136;
  GEOLocation *v137;
  uint64_t v138;
  void *v139;
  id v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  _OWORD v151[2];
  _OWORD v152[3];
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  _BYTE v157[128];
  _BYTE v158[128];
  _BYTE v159[128];
  uint64_t v160;

  v160 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (!a1)
    goto LABEL_304;
  a1 = (id)objc_msgSend(a1, "init");

  if (!a1)
    goto LABEL_304;
  if (a3)
    v6 = CFSTR("directionsFeedback");
  else
    v6 = CFSTR("directions_feedback");
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v141 = v5;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v155 = 0u;
    v156 = 0u;
    v153 = 0u;
    v154 = 0u;
    v8 = v7;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v153, v159, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v154;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v154 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v153 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v14 = [GEODirectionsFeedback alloc];
            if ((a3 & 1) != 0)
              v15 = -[GEODirectionsFeedback initWithJSON:](v14, "initWithJSON:", v13);
            else
              v15 = -[GEODirectionsFeedback initWithDictionary:](v14, "initWithDictionary:", v13);
            v16 = (void *)v15;
            objc_msgSend(a1, "addDirectionsFeedback:", v15);

          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v153, v159, 16);
      }
      while (v10);
    }

    v5 = v141;
  }

  if (a3)
    v17 = CFSTR("finalLocation");
  else
    v17 = CFSTR("final_location");
  objc_msgSend(v5, "objectForKeyedSubscript:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v19 = [GEOLocation alloc];
    if ((a3 & 1) != 0)
      v20 = -[GEOLocation initWithJSON:](v19, "initWithJSON:", v18);
    else
      v20 = -[GEOLocation initWithDictionary:](v19, "initWithDictionary:", v18);
    v21 = (void *)v20;
    objc_msgSend(a1, "setFinalLocation:", v20);

  }
  if (a3)
    v22 = CFSTR("arrivedAtDestination");
  else
    v22 = CFSTR("arrived_at_destination");
  objc_msgSend(v5, "objectForKeyedSubscript:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setArrivedAtDestination:", objc_msgSend(v23, "BOOLValue"));

  if (a3)
    v24 = CFSTR("navigationAudioFeedback");
  else
    v24 = CFSTR("navigation_audio_feedback");
  objc_msgSend(v5, "objectForKeyedSubscript:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    memset(v152, 0, 44);
    _GEONavigationAudioFeedbackFromDictionaryRepresentation(v25, (uint64_t)v152, a3);
    v150 = v152[0];
    v151[0] = v152[1];
    *(_OWORD *)((char *)v151 + 12) = *(_OWORD *)((char *)&v152[1] + 12);
    objc_msgSend(a1, "setNavigationAudioFeedback:", &v150);
  }

  if (a3)
    v26 = CFSTR("durationOfTrip");
  else
    v26 = CFSTR("duration_of_trip");
  objc_msgSend(v5, "objectForKeyedSubscript:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v27, "doubleValue");
    objc_msgSend(a1, "setDurationOfTrip:");
  }

  if (a3)
    v28 = CFSTR("navSessionId");
  else
    v28 = CFSTR("nav_session_id");
  objc_msgSend(v5, "objectForKeyedSubscript:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v152[0] = 0uLL;
    _GEOSessionIDFromDictionaryRepresentation(v29, v152);
    objc_msgSend(a1, "setNavSessionId:", v152[0]);
  }

  if (a3)
    v30 = CFSTR("durationInNavigationMode");
  else
    v30 = CFSTR("duration_in_navigation_mode");
  objc_msgSend(v5, "objectForKeyedSubscript:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v148 = 0u;
    v149 = 0u;
    v146 = 0u;
    v147 = 0u;
    v32 = v31;
    v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v146, v158, 16);
    if (v33)
    {
      v34 = v33;
      v35 = *(_QWORD *)v147;
      do
      {
        for (j = 0; j != v34; ++j)
        {
          if (*(_QWORD *)v147 != v35)
            objc_enumerationMutation(v32);
          v37 = *(_QWORD *)(*((_QWORD *)&v146 + 1) + 8 * j);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v38 = [GEODurationInNavigationMode alloc];
            if ((a3 & 1) != 0)
              v39 = -[GEODurationInNavigationMode initWithJSON:](v38, "initWithJSON:", v37);
            else
              v39 = -[GEODurationInNavigationMode initWithDictionary:](v38, "initWithDictionary:", v37);
            v40 = (void *)v39;
            objc_msgSend(a1, "addDurationInNavigationMode:", v39);

          }
        }
        v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v146, v158, 16);
      }
      while (v34);
    }

    v5 = v141;
  }

  if (a3)
    v41 = CFSTR("originalEta");
  else
    v41 = CFSTR("original_eta");
  objc_msgSend(v5, "objectForKeyedSubscript:", v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setOriginalEta:", objc_msgSend(v42, "unsignedIntValue"));

  if (a3)
    v43 = CFSTR("preArrival");
  else
    v43 = CFSTR("pre_arrival");
  objc_msgSend(v5, "objectForKeyedSubscript:", v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setPreArrival:", objc_msgSend(v44, "BOOLValue"));

  if (a3)
    v45 = CFSTR("isCyclingNlgAvailable");
  else
    v45 = CFSTR("is_cycling_nlg_available");
  objc_msgSend(v5, "objectForKeyedSubscript:", v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setIsCyclingNlgAvailable:", objc_msgSend(v46, "BOOLValue"));

  if (a3)
    v47 = CFSTR("isCoarseLocationUsed");
  else
    v47 = CFSTR("is_coarse_location_used");
  objc_msgSend(v5, "objectForKeyedSubscript:", v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setIsCoarseLocationUsed:", objc_msgSend(v48, "BOOLValue"));

  if (a3)
    v49 = CFSTR("isVlfImprovementUsed");
  else
    v49 = CFSTR("is_vlf_improvement_used");
  objc_msgSend(v5, "objectForKeyedSubscript:", v49);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setIsVlfImprovementUsed:", objc_msgSend(v50, "BOOLValue"));

  if (a3)
    v51 = CFSTR("acceptedCyclingWorkout");
  else
    v51 = CFSTR("accepted_cycling_workout");
  objc_msgSend(v5, "objectForKeyedSubscript:", v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setAcceptedCyclingWorkout:", objc_msgSend(v52, "BOOLValue"));

  if (a3)
    v53 = CFSTR("batteryDied");
  else
    v53 = CFSTR("battery_died");
  objc_msgSend(v5, "objectForKeyedSubscript:", v53);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setBatteryDied:", objc_msgSend(v54, "BOOLValue"));

  if (a3)
    v55 = CFSTR("chargingStopAdded");
  else
    v55 = CFSTR("charging_stop_added");
  objc_msgSend(v5, "objectForKeyedSubscript:", v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setChargingStopAdded:", objc_msgSend(v56, "BOOLValue"));

  if (a3)
    v57 = CFSTR("isSiriEngaged");
  else
    v57 = CFSTR("is_siri_engaged");
  objc_msgSend(v5, "objectForKeyedSubscript:", v57);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setIsSiriEngaged:", objc_msgSend(v58, "BOOLValue"));

  if (a3)
    v59 = CFSTR("tripOrigin");
  else
    v59 = CFSTR("trip_origin");
  objc_msgSend(v5, "objectForKeyedSubscript:", v59);
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
    objc_msgSend(a1, "setTripOrigin:", v62);

  }
  if (a3)
    v64 = CFSTR("isBadEvExperience");
  else
    v64 = CFSTR("is_bad_ev_experience");
  objc_msgSend(v5, "objectForKeyedSubscript:", v64);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setIsBadEvExperience:", objc_msgSend(v65, "BOOLValue"));

  if (a3)
    v66 = CFSTR("isEvSampleTrip");
  else
    v66 = CFSTR("is_ev_sample_trip");
  objc_msgSend(v5, "objectForKeyedSubscript:", v66);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setIsEvSampleTrip:", objc_msgSend(v67, "BOOLValue"));

  if (a3)
    v68 = CFSTR("stateOfChargeAtOrigin");
  else
    v68 = CFSTR("state_of_charge_at_origin");
  objc_msgSend(v5, "objectForKeyedSubscript:", v68);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setStateOfChargeAtOrigin:", objc_msgSend(v69, "unsignedIntValue"));

  if (a3)
    v70 = CFSTR("stateOfChargeAtDestPredicted");
  else
    v70 = CFSTR("state_of_charge_at_dest_predicted");
  objc_msgSend(v5, "objectForKeyedSubscript:", v70);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setStateOfChargeAtDestPredicted:", objc_msgSend(v71, "unsignedIntValue"));

  if (a3)
    v72 = CFSTR("stateOfChargeAtDestActual");
  else
    v72 = CFSTR("state_of_charge_at_dest_actual");
  objc_msgSend(v5, "objectForKeyedSubscript:", v72);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setStateOfChargeAtDestActual:", objc_msgSend(v73, "unsignedIntValue"));

  if (a3)
    v74 = CFSTR("stateOfChargeDiffAtDest");
  else
    v74 = CFSTR("state_of_charge_diff_at_dest");
  objc_msgSend(v5, "objectForKeyedSubscript:", v74);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setStateOfChargeDiffAtDest:", objc_msgSend(v75, "unsignedIntValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("waypoints"));
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v144 = 0u;
    v145 = 0u;
    v142 = 0u;
    v143 = 0u;
    v77 = v76;
    v78 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v142, v157, 16);
    if (v78)
    {
      v79 = v78;
      v80 = *(_QWORD *)v143;
      do
      {
        for (k = 0; k != v79; ++k)
        {
          if (*(_QWORD *)v143 != v80)
            objc_enumerationMutation(v77);
          v82 = *(_QWORD *)(*((_QWORD *)&v142 + 1) + 8 * k);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v83 = [GEOWaypointInfo alloc];
            if ((a3 & 1) != 0)
              v84 = -[GEOWaypointInfo initWithJSON:](v83, "initWithJSON:", v82);
            else
              v84 = -[GEOWaypointInfo initWithDictionary:](v83, "initWithDictionary:", v82);
            v85 = (void *)v84;
            objc_msgSend(a1, "addWaypoints:", v84);

          }
        }
        v79 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v142, v157, 16);
      }
      while (v79);
    }

    v5 = v141;
  }

  if (a3)
    v86 = CFSTR("evConsumptionModel");
  else
    v86 = CFSTR("ev_consumption_model");
  objc_msgSend(v5, "objectForKeyedSubscript:", v86);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v88 = (void *)objc_msgSend(v87, "copy");
    objc_msgSend(a1, "setEvConsumptionModel:", v88);

  }
  if (a3)
    v89 = CFSTR("evChargingMode");
  else
    v89 = CFSTR("ev_charging_mode");
  objc_msgSend(v5, "objectForKeyedSubscript:", v89);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v91 = (void *)objc_msgSend(v90, "copy");
    objc_msgSend(a1, "setEvChargingMode:", v91);

  }
  if (a3)
    v92 = CFSTR("activeNavMode");
  else
    v92 = CFSTR("active_nav_mode");
  objc_msgSend(v5, "objectForKeyedSubscript:", v92);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v94 = v93;
    if ((objc_msgSend(v94, "isEqualToString:", CFSTR("AUTOMOBILE")) & 1) != 0)
    {
      v95 = 0;
    }
    else if ((objc_msgSend(v94, "isEqualToString:", CFSTR("TRANSIT")) & 1) != 0)
    {
      v95 = 1;
    }
    else if ((objc_msgSend(v94, "isEqualToString:", CFSTR("WALKING")) & 1) != 0)
    {
      v95 = 2;
    }
    else if ((objc_msgSend(v94, "isEqualToString:", CFSTR("BICYCLE")) & 1) != 0)
    {
      v95 = 3;
    }
    else if ((objc_msgSend(v94, "isEqualToString:", CFSTR("UNKNOWN_TRANSPORT_TYPE")) & 1) != 0)
    {
      v95 = 4;
    }
    else if ((objc_msgSend(v94, "isEqualToString:", CFSTR("FERRY")) & 1) != 0)
    {
      v95 = 5;
    }
    else if (objc_msgSend(v94, "isEqualToString:", CFSTR("RIDESHARE")))
    {
      v95 = 6;
    }
    else
    {
      v95 = 0;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_195;
    v95 = objc_msgSend(v93, "intValue");
  }
  objc_msgSend(a1, "setActiveNavMode:", v95);
LABEL_195:

  if (a3)
    v96 = CFSTR("arWalkingUsedInRoutePlanning");
  else
    v96 = CFSTR("ar_walking_used_in_route_planning");
  objc_msgSend(v5, "objectForKeyedSubscript:", v96);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setArWalkingUsedInRoutePlanning:", objc_msgSend(v97, "BOOLValue"));

  if (a3)
    v98 = CFSTR("arWalkingUsedInNavigation");
  else
    v98 = CFSTR("ar_walking_used_in_navigation");
  objc_msgSend(v5, "objectForKeyedSubscript:", v98);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setArWalkingUsedInNavigation:", objc_msgSend(v99, "BOOLValue"));

  if (a3)
    v100 = CFSTR("voiceGuidanceLevel");
  else
    v100 = CFSTR("voice_guidance_level");
  objc_msgSend(v5, "objectForKeyedSubscript:", v100);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v102 = v101;
    if ((objc_msgSend(v102, "isEqualToString:", CFSTR("LEVEL_UNKNOWN")) & 1) != 0)
    {
      v103 = 0;
    }
    else if ((objc_msgSend(v102, "isEqualToString:", CFSTR("LEVEL_NONE")) & 1) != 0)
    {
      v103 = 1;
    }
    else if ((objc_msgSend(v102, "isEqualToString:", CFSTR("LEVEL_INCIDENTS")) & 1) != 0)
    {
      v103 = 2;
    }
    else if (objc_msgSend(v102, "isEqualToString:", CFSTR("LEVEL_FULL")))
    {
      v103 = 3;
    }
    else
    {
      v103 = 0;
    }

    goto LABEL_221;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v103 = objc_msgSend(v101, "intValue");
LABEL_221:
    objc_msgSend(a1, "setVoiceGuidanceLevel:", v103);
  }

  if (a3)
    v104 = CFSTR("hFPEnabled");
  else
    v104 = CFSTR("HFP_enabled");
  objc_msgSend(v5, "objectForKeyedSubscript:", v104);
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setHFPEnabled:", objc_msgSend(v105, "BOOLValue"));

  if (a3)
    v106 = CFSTR("isInParkingMode");
  else
    v106 = CFSTR("is_in_parking_mode");
  objc_msgSend(v5, "objectForKeyedSubscript:", v106);
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setIsInParkingMode:", objc_msgSend(v107, "BOOLValue"));

  if (a3)
    v108 = CFSTR("isSuggestToWalkingTriggered");
  else
    v108 = CFSTR("is_suggest_to_walking_triggered");
  objc_msgSend(v5, "objectForKeyedSubscript:", v108);
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setIsSuggestToWalkingTriggered:", objc_msgSend(v109, "BOOLValue"));

  if (a3)
    v110 = CFSTR("isTransitedToWalking");
  else
    v110 = CFSTR("is_transited_to_walking");
  objc_msgSend(v5, "objectForKeyedSubscript:", v110);
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setIsTransitedToWalking:", objc_msgSend(v111, "BOOLValue"));

  if (a3)
    v112 = CFSTR("isSuggestToFindmyTriggered");
  else
    v112 = CFSTR("is_suggest_to_findmy_triggered");
  objc_msgSend(v5, "objectForKeyedSubscript:", v112);
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setIsSuggestToFindmyTriggered:", objc_msgSend(v113, "BOOLValue"));

  if (a3)
    v114 = CFSTR("isTransitedToFindmy");
  else
    v114 = CFSTR("is_transited_to_findmy");
  objc_msgSend(v5, "objectForKeyedSubscript:", v114);
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setIsTransitedToFindmy:", objc_msgSend(v115, "BOOLValue"));

  if (a3)
    v116 = CFSTR("isEndRouteTermination");
  else
    v116 = CFSTR("is_end_route_termination");
  objc_msgSend(v5, "objectForKeyedSubscript:", v116);
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setIsEndRouteTermination:", objc_msgSend(v117, "BOOLValue"));

  if (a3)
    v118 = CFSTR("isParkedCarTermination");
  else
    v118 = CFSTR("is_parked_car_termination");
  objc_msgSend(v5, "objectForKeyedSubscript:", v118);
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setIsParkedCarTermination:", objc_msgSend(v119, "BOOLValue"));

  if (a3)
    v120 = CFSTR("isTransitionToWalkingTermination");
  else
    v120 = CFSTR("is_transition_to_walking_termination");
  objc_msgSend(v5, "objectForKeyedSubscript:", v120);
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setIsTransitionToWalkingTermination:", objc_msgSend(v121, "BOOLValue"));

  if (a3)
    v122 = CFSTR("isTransitionToFindmyTermination");
  else
    v122 = CFSTR("is_transition_to_findmy_termination");
  objc_msgSend(v5, "objectForKeyedSubscript:", v122);
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setIsTransitionToFindmyTermination:", objc_msgSend(v123, "BOOLValue"));

  if (a3)
    v124 = CFSTR("parkingDetectionLocation");
  else
    v124 = CFSTR("parking_detection_location");
  objc_msgSend(v5, "objectForKeyedSubscript:", v124);
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v126 = [GEOLocation alloc];
    if ((a3 & 1) != 0)
      v127 = -[GEOLocation initWithJSON:](v126, "initWithJSON:", v125);
    else
      v127 = -[GEOLocation initWithDictionary:](v126, "initWithDictionary:", v125);
    v128 = (void *)v127;
    objc_msgSend(a1, "setParkingDetectionLocation:", v127);

  }
  if (a3)
    v129 = CFSTR("timeBetweenParkedAndArrival");
  else
    v129 = CFSTR("time_between_parked_and_arrival");
  objc_msgSend(v5, "objectForKeyedSubscript:", v129);
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v130, "doubleValue");
    objc_msgSend(a1, "setTimeBetweenParkedAndArrival:");
  }

  if (a3)
    v131 = CFSTR("arrivedAtDestinationCount");
  else
    v131 = CFSTR("arrived_at_destination_count");
  objc_msgSend(v5, "objectForKeyedSubscript:", v131);
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setArrivedAtDestinationCount:", objc_msgSend(v132, "unsignedIntValue"));

  if (a3)
    v133 = CFSTR("inParkingModeCount");
  else
    v133 = CFSTR("in_parking_mode_count");
  objc_msgSend(v5, "objectForKeyedSubscript:", v133);
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setInParkingModeCount:", objc_msgSend(v134, "unsignedIntValue"));

  if (a3)
    v135 = CFSTR("arrivalLocation");
  else
    v135 = CFSTR("arrival_location");
  objc_msgSend(v5, "objectForKeyedSubscript:", v135);
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v137 = [GEOLocation alloc];
    if ((a3 & 1) != 0)
      v138 = -[GEOLocation initWithJSON:](v137, "initWithJSON:", v136);
    else
      v138 = -[GEOLocation initWithDictionary:](v137, "initWithDictionary:", v136);
    v139 = (void *)v138;
    objc_msgSend(a1, "setArrivalLocation:", v138);

  }
  a1 = a1;

LABEL_304:
  return a1;
}

- (GEOLogMsgEventDirections)initWithJSON:(id)a3
{
  return (GEOLogMsgEventDirections *)-[GEOLogMsgEventDirections _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_2011;
    else
      v8 = (int *)&readAll__nonRecursiveTag_2012;
    GEOLogMsgEventDirectionsReadSpecified((uint64_t)self, (uint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEOLogMsgEventDirectionsCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgEventDirectionsIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgEventDirectionsReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  $896FCD321D059B35A66825024FB599E5 flags;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  $896FCD321D059B35A66825024FB599E5 v15;
  $896FCD321D059B35A66825024FB599E5 v16;
  NSMutableArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t k;
  $896FCD321D059B35A66825024FB599E5 v21;
  $896FCD321D059B35A66825024FB599E5 v22;
  PBDataReader *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOLogMsgEventDirectionsIsDirty((uint64_t)self) & 1) == 0)
  {
    v23 = self->_reader;
    objc_sync_enter(v23);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v24);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v23);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOLogMsgEventDirections readAll:](self, "readAll:", 0);
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v6 = self->_directionsFeedbacks;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v35 != v8)
            objc_enumerationMutation(v6);
          PBDataWriterWriteSubmessage();
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
      }
      while (v7);
    }

    if (self->_finalLocation)
      PBDataWriterWriteSubmessage();
    flags = self->_flags;
    if ((*(_DWORD *)&flags & 0x20000) != 0)
    {
      PBDataWriterWriteBOOLField();
      flags = self->_flags;
    }
    if ((*(_BYTE *)&flags & 1) != 0)
    {
      v33 = 0;
      PBDataWriterPlaceMark();
      GEONavigationAudioFeedbackWriteTo((uint64_t)&self->_navigationAudioFeedback);
      PBDataWriterRecallMark();
      flags = self->_flags;
    }
    if ((*(_BYTE *)&flags & 4) != 0)
    {
      PBDataWriterWriteDoubleField();
      flags = self->_flags;
    }
    if ((*(_BYTE *)&flags & 2) != 0)
    {
      v33 = 0;
      PBDataWriterPlaceMark();
      PBDataWriterWriteUint64Field();
      PBDataWriterWriteUint64Field();
      PBDataWriterRecallMark();
    }
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v11 = self->_durationInNavigationModes;
    v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v29, v39, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v30;
      do
      {
        for (j = 0; j != v12; ++j)
        {
          if (*(_QWORD *)v30 != v13)
            objc_enumerationMutation(v11);
          PBDataWriterWriteSubmessage();
        }
        v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v29, v39, 16);
      }
      while (v12);
    }

    v15 = self->_flags;
    if ((*(_BYTE *)&v15 & 0x80) != 0)
    {
      PBDataWriterWriteUint32Field();
      v15 = self->_flags;
    }
    if ((*(_QWORD *)&v15 & 0x800000000) != 0)
    {
      PBDataWriterWriteBOOLField();
      v15 = self->_flags;
    }
    if ((*(_DWORD *)&v15 & 0x400000) != 0)
    {
      PBDataWriterWriteBOOLField();
      v15 = self->_flags;
    }
    if ((*(_DWORD *)&v15 & 0x200000) != 0)
    {
      PBDataWriterWriteBOOLField();
      v15 = self->_flags;
    }
    if ((*(_QWORD *)&v15 & 0x400000000) != 0)
    {
      PBDataWriterWriteBOOLField();
      v15 = self->_flags;
    }
    if ((*(_WORD *)&v15 & 0x4000) != 0)
    {
      PBDataWriterWriteBOOLField();
      v15 = self->_flags;
    }
    if ((*(_DWORD *)&v15 & 0x40000) != 0)
    {
      PBDataWriterWriteBOOLField();
      v15 = self->_flags;
    }
    if ((*(_DWORD *)&v15 & 0x80000) != 0)
    {
      PBDataWriterWriteBOOLField();
      v15 = self->_flags;
    }
    if ((*(_DWORD *)&v15 & 0x8000000) != 0)
      PBDataWriterWriteBOOLField();
    if (self->_tripOrigin)
      PBDataWriterWriteSubmessage();
    v16 = self->_flags;
    if ((*(_DWORD *)&v16 & 0x100000) != 0)
    {
      PBDataWriterWriteBOOLField();
      v16 = self->_flags;
    }
    if ((*(_DWORD *)&v16 & 0x1000000) != 0)
    {
      PBDataWriterWriteBOOLField();
      v16 = self->_flags;
    }
    if ((*(_WORD *)&v16 & 0x400) != 0)
    {
      PBDataWriterWriteUint32Field();
      v16 = self->_flags;
    }
    if ((*(_WORD *)&v16 & 0x200) != 0)
    {
      PBDataWriterWriteUint32Field();
      v16 = self->_flags;
    }
    if ((*(_WORD *)&v16 & 0x100) != 0)
    {
      PBDataWriterWriteUint32Field();
      v16 = self->_flags;
    }
    if ((*(_WORD *)&v16 & 0x800) != 0)
      PBDataWriterWriteUint32Field();
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v17 = self->_waypoints;
    v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v25, v38, 16);
    if (v18)
    {
      v19 = *(_QWORD *)v26;
      do
      {
        for (k = 0; k != v18; ++k)
        {
          if (*(_QWORD *)v26 != v19)
            objc_enumerationMutation(v17);
          PBDataWriterWriteSubmessage();
        }
        v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v25, v38, 16);
      }
      while (v18);
    }

    if (self->_evConsumptionModel)
      PBDataWriterWriteStringField();
    if (self->_evChargingMode)
      PBDataWriterWriteStringField();
    v21 = self->_flags;
    if ((*(_BYTE *)&v21 & 0x10) != 0)
    {
      PBDataWriterWriteInt32Field();
      v21 = self->_flags;
    }
    if ((*(_DWORD *)&v21 & 0x10000) != 0)
    {
      PBDataWriterWriteBOOLField();
      v21 = self->_flags;
    }
    if ((*(_WORD *)&v21 & 0x8000) != 0)
    {
      PBDataWriterWriteBOOLField();
      v21 = self->_flags;
    }
    if ((*(_WORD *)&v21 & 0x1000) != 0)
    {
      PBDataWriterWriteInt32Field();
      v21 = self->_flags;
    }
    if ((*(_WORD *)&v21 & 0x2000) != 0)
    {
      PBDataWriterWriteBOOLField();
      v21 = self->_flags;
    }
    if ((*(_DWORD *)&v21 & 0x2000000) != 0)
    {
      PBDataWriterWriteBOOLField();
      v21 = self->_flags;
    }
    if ((*(_DWORD *)&v21 & 0x20000000) != 0)
    {
      PBDataWriterWriteBOOLField();
      v21 = self->_flags;
    }
    if ((*(_DWORD *)&v21 & 0x80000000) != 0)
    {
      PBDataWriterWriteBOOLField();
      v21 = self->_flags;
    }
    if ((*(_DWORD *)&v21 & 0x10000000) != 0)
    {
      PBDataWriterWriteBOOLField();
      v21 = self->_flags;
    }
    if ((*(_DWORD *)&v21 & 0x40000000) != 0)
    {
      PBDataWriterWriteBOOLField();
      v21 = self->_flags;
    }
    if ((*(_DWORD *)&v21 & 0x800000) != 0)
    {
      PBDataWriterWriteBOOLField();
      v21 = self->_flags;
    }
    if ((*(_DWORD *)&v21 & 0x4000000) != 0)
    {
      PBDataWriterWriteBOOLField();
      v21 = self->_flags;
    }
    if ((*(_QWORD *)&v21 & 0x200000000) != 0)
    {
      PBDataWriterWriteBOOLField();
      v21 = self->_flags;
    }
    if ((*(_QWORD *)&v21 & 0x100000000) != 0)
      PBDataWriterWriteBOOLField();
    if (self->_parkingDetectionLocation)
      PBDataWriterWriteSubmessage();
    v22 = self->_flags;
    if ((*(_BYTE *)&v22 & 8) != 0)
    {
      PBDataWriterWriteDoubleField();
      v22 = self->_flags;
    }
    if ((*(_BYTE *)&v22 & 0x20) != 0)
    {
      PBDataWriterWriteUint32Field();
      v22 = self->_flags;
    }
    if ((*(_BYTE *)&v22 & 0x40) != 0)
      PBDataWriterWriteUint32Field();
    if (self->_arrivalLocation)
      PBDataWriterWriteSubmessage();
  }

}

- (void)clearSensitiveFields:(unint64_t)a3
{
  GEOLogMsgEventDirectionsClearSensitiveFields(self, a3, 1);
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
  -[GEOLogMsgEventDirections _readArrivalLocation]((uint64_t)self);
  if (-[GEOLocation hasGreenTeaWithValue:](self->_arrivalLocation, "hasGreenTeaWithValue:", v3))
    return 1;
  -[GEOLogMsgEventDirections _readDirectionsFeedbacks]((uint64_t)self);
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = self->_directionsFeedbacks;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v21;
LABEL_5:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v21 != v9)
        objc_enumerationMutation(v6);
      if ((objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v10), "hasGreenTeaWithValue:", v3) & 1) != 0)
        goto LABEL_23;
      if (v8 == ++v10)
      {
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
        if (v8)
          goto LABEL_5;
        break;
      }
    }
  }

  -[GEOLogMsgEventDirections _readFinalLocation]((uint64_t)self);
  if (!-[GEOLocation hasGreenTeaWithValue:](self->_finalLocation, "hasGreenTeaWithValue:", v3))
  {
    -[GEOLogMsgEventDirections _readParkingDetectionLocation]((uint64_t)self);
    if (!-[GEOLocation hasGreenTeaWithValue:](self->_parkingDetectionLocation, "hasGreenTeaWithValue:", v3))
    {
      -[GEOLogMsgEventDirections _readTripOrigin]((uint64_t)self);
      if (!-[GEOLatLng hasGreenTeaWithValue:](self->_tripOrigin, "hasGreenTeaWithValue:", v3))
      {
        -[GEOLogMsgEventDirections _readWaypoints]((uint64_t)self);
        v18 = 0u;
        v19 = 0u;
        v16 = 0u;
        v17 = 0u;
        v6 = self->_waypoints;
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
        if (!v11)
        {
LABEL_22:
          v5 = 0;
LABEL_24:

          return v5;
        }
        v12 = v11;
        v13 = *(_QWORD *)v17;
LABEL_16:
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
              goto LABEL_16;
            goto LABEL_22;
          }
        }
LABEL_23:
        v5 = 1;
        goto LABEL_24;
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
  $896FCD321D059B35A66825024FB599E5 flags;
  unint64_t v9;
  unint64_t v10;
  uint64_t j;
  void *v12;
  $896FCD321D059B35A66825024FB599E5 v13;
  char *v14;
  $896FCD321D059B35A66825024FB599E5 v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t k;
  void *v19;
  _DWORD *v20;
  $896FCD321D059B35A66825024FB599E5 v21;
  $896FCD321D059B35A66825024FB599E5 v22;
  __int128 v23;
  __int128 v24;
  char *v25;

  v25 = (char *)a3;
  -[GEOLogMsgEventDirections readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong((id *)v25 + 1, self->_reader);
  *((_DWORD *)v25 + 42) = self->_readerMarkPos;
  *((_DWORD *)v25 + 43) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (-[GEOLogMsgEventDirections directionsFeedbacksCount](self, "directionsFeedbacksCount"))
  {
    objc_msgSend(v25, "clearDirectionsFeedbacks");
    v4 = -[GEOLogMsgEventDirections directionsFeedbacksCount](self, "directionsFeedbacksCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[GEOLogMsgEventDirections directionsFeedbackAtIndex:](self, "directionsFeedbackAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "addDirectionsFeedback:", v7);

      }
    }
  }
  if (self->_finalLocation)
    objc_msgSend(v25, "setFinalLocation:");
  flags = self->_flags;
  if ((*(_DWORD *)&flags & 0x20000) != 0)
  {
    v25[220] = self->_arrivedAtDestination;
    *((_QWORD *)v25 + 30) |= 0x20000uLL;
    flags = self->_flags;
    if ((*(_BYTE *)&flags & 1) == 0)
    {
LABEL_9:
      if ((*(_BYTE *)&flags & 4) == 0)
        goto LABEL_10;
LABEL_69:
      *((_QWORD *)v25 + 13) = *(_QWORD *)&self->_durationOfTrip;
      *((_QWORD *)v25 + 30) |= 4uLL;
      if ((*(_QWORD *)&self->_flags & 2) == 0)
        goto LABEL_12;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&flags & 1) == 0)
  {
    goto LABEL_9;
  }
  v23 = *(_OWORD *)&self->_navigationAudioFeedback._pauseSpokenAudioEnabled;
  v24 = *(_OWORD *)&self->_navigationAudioFeedback._manuallyChangedRouteCount;
  *((_OWORD *)v25 + 1) = *(_OWORD *)&self->_navigationAudioFeedback._bTHFPAvailableAtEndOfNav;
  *((_OWORD *)v25 + 2) = v24;
  *(_OWORD *)(v25 + 44) = v23;
  *((_QWORD *)v25 + 30) |= 1uLL;
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 4) != 0)
    goto LABEL_69;
LABEL_10:
  if ((*(_BYTE *)&flags & 2) != 0)
  {
LABEL_11:
    *((_OWORD *)v25 + 4) = self->_navSessionId;
    *((_QWORD *)v25 + 30) |= 2uLL;
  }
LABEL_12:
  if (-[GEOLogMsgEventDirections durationInNavigationModesCount](self, "durationInNavigationModesCount"))
  {
    objc_msgSend(v25, "clearDurationInNavigationModes");
    v9 = -[GEOLogMsgEventDirections durationInNavigationModesCount](self, "durationInNavigationModesCount");
    if (v9)
    {
      v10 = v9;
      for (j = 0; j != v10; ++j)
      {
        -[GEOLogMsgEventDirections durationInNavigationModeAtIndex:](self, "durationInNavigationModeAtIndex:", j);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "addDurationInNavigationMode:", v12);

      }
    }
  }
  v13 = self->_flags;
  v14 = v25;
  if ((*(_BYTE *)&v13 & 0x80) != 0)
  {
    *((_DWORD *)v25 + 48) = self->_originalEta;
    *((_QWORD *)v25 + 30) |= 0x80uLL;
    v13 = self->_flags;
    if ((*(_QWORD *)&v13 & 0x800000000) == 0)
    {
LABEL_18:
      if ((*(_DWORD *)&v13 & 0x400000) == 0)
        goto LABEL_19;
      goto LABEL_73;
    }
  }
  else if ((*(_QWORD *)&v13 & 0x800000000) == 0)
  {
    goto LABEL_18;
  }
  v25[238] = self->_preArrival;
  *((_QWORD *)v25 + 30) |= 0x800000000uLL;
  v13 = self->_flags;
  if ((*(_DWORD *)&v13 & 0x400000) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&v13 & 0x200000) == 0)
      goto LABEL_20;
    goto LABEL_74;
  }
LABEL_73:
  v25[225] = self->_isCyclingNlgAvailable;
  *((_QWORD *)v25 + 30) |= 0x400000uLL;
  v13 = self->_flags;
  if ((*(_DWORD *)&v13 & 0x200000) == 0)
  {
LABEL_20:
    if ((*(_QWORD *)&v13 & 0x400000000) == 0)
      goto LABEL_21;
    goto LABEL_75;
  }
LABEL_74:
  v25[224] = self->_isCoarseLocationUsed;
  *((_QWORD *)v25 + 30) |= 0x200000uLL;
  v13 = self->_flags;
  if ((*(_QWORD *)&v13 & 0x400000000) == 0)
  {
LABEL_21:
    if ((*(_WORD *)&v13 & 0x4000) == 0)
      goto LABEL_22;
    goto LABEL_76;
  }
LABEL_75:
  v25[237] = self->_isVlfImprovementUsed;
  *((_QWORD *)v25 + 30) |= 0x400000000uLL;
  v13 = self->_flags;
  if ((*(_WORD *)&v13 & 0x4000) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&v13 & 0x40000) == 0)
      goto LABEL_23;
    goto LABEL_77;
  }
LABEL_76:
  v25[217] = self->_acceptedCyclingWorkout;
  *((_QWORD *)v25 + 30) |= 0x4000uLL;
  v13 = self->_flags;
  if ((*(_DWORD *)&v13 & 0x40000) == 0)
  {
LABEL_23:
    if ((*(_DWORD *)&v13 & 0x80000) == 0)
      goto LABEL_24;
    goto LABEL_78;
  }
LABEL_77:
  v25[221] = self->_batteryDied;
  *((_QWORD *)v25 + 30) |= 0x40000uLL;
  v13 = self->_flags;
  if ((*(_DWORD *)&v13 & 0x80000) == 0)
  {
LABEL_24:
    if ((*(_DWORD *)&v13 & 0x8000000) == 0)
      goto LABEL_26;
    goto LABEL_25;
  }
LABEL_78:
  v25[222] = self->_chargingStopAdded;
  *((_QWORD *)v25 + 30) |= 0x80000uLL;
  if ((*(_QWORD *)&self->_flags & 0x8000000) != 0)
  {
LABEL_25:
    v25[230] = self->_isSiriEngaged;
    *((_QWORD *)v25 + 30) |= 0x8000000uLL;
  }
LABEL_26:
  if (self->_tripOrigin)
  {
    objc_msgSend(v25, "setTripOrigin:");
    v14 = v25;
  }
  v15 = self->_flags;
  if ((*(_DWORD *)&v15 & 0x100000) != 0)
  {
    v14[223] = self->_isBadEvExperience;
    *((_QWORD *)v14 + 30) |= 0x100000uLL;
    v15 = self->_flags;
    if ((*(_DWORD *)&v15 & 0x1000000) == 0)
    {
LABEL_30:
      if ((*(_WORD *)&v15 & 0x400) == 0)
        goto LABEL_31;
      goto LABEL_82;
    }
  }
  else if ((*(_DWORD *)&v15 & 0x1000000) == 0)
  {
    goto LABEL_30;
  }
  v14[227] = self->_isEvSampleTrip;
  *((_QWORD *)v14 + 30) |= 0x1000000uLL;
  v15 = self->_flags;
  if ((*(_WORD *)&v15 & 0x400) == 0)
  {
LABEL_31:
    if ((*(_WORD *)&v15 & 0x200) == 0)
      goto LABEL_32;
    goto LABEL_83;
  }
LABEL_82:
  *((_DWORD *)v14 + 51) = self->_stateOfChargeAtOrigin;
  *((_QWORD *)v14 + 30) |= 0x400uLL;
  v15 = self->_flags;
  if ((*(_WORD *)&v15 & 0x200) == 0)
  {
LABEL_32:
    if ((*(_WORD *)&v15 & 0x100) == 0)
      goto LABEL_33;
LABEL_84:
    *((_DWORD *)v14 + 49) = self->_stateOfChargeAtDestActual;
    *((_QWORD *)v14 + 30) |= 0x100uLL;
    if ((*(_QWORD *)&self->_flags & 0x800) == 0)
      goto LABEL_35;
    goto LABEL_34;
  }
LABEL_83:
  *((_DWORD *)v14 + 50) = self->_stateOfChargeAtDestPredicted;
  *((_QWORD *)v14 + 30) |= 0x200uLL;
  v15 = self->_flags;
  if ((*(_WORD *)&v15 & 0x100) != 0)
    goto LABEL_84;
LABEL_33:
  if ((*(_WORD *)&v15 & 0x800) != 0)
  {
LABEL_34:
    *((_DWORD *)v14 + 52) = self->_stateOfChargeDiffAtDest;
    *((_QWORD *)v14 + 30) |= 0x800uLL;
  }
LABEL_35:
  if (-[GEOLogMsgEventDirections waypointsCount](self, "waypointsCount"))
  {
    objc_msgSend(v25, "clearWaypoints");
    v16 = -[GEOLogMsgEventDirections waypointsCount](self, "waypointsCount");
    if (v16)
    {
      v17 = v16;
      for (k = 0; k != v17; ++k)
      {
        -[GEOLogMsgEventDirections waypointsAtIndex:](self, "waypointsAtIndex:", k);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "addWaypoints:", v19);

      }
    }
  }
  if (self->_evConsumptionModel)
    objc_msgSend(v25, "setEvConsumptionModel:");
  v20 = v25;
  if (self->_evChargingMode)
  {
    objc_msgSend(v25, "setEvChargingMode:");
    v20 = v25;
  }
  v21 = self->_flags;
  if ((*(_BYTE *)&v21 & 0x10) != 0)
  {
    v20[45] = self->_activeNavMode;
    *((_QWORD *)v20 + 30) |= 0x10uLL;
    v21 = self->_flags;
    if ((*(_DWORD *)&v21 & 0x10000) == 0)
    {
LABEL_45:
      if ((*(_WORD *)&v21 & 0x8000) == 0)
        goto LABEL_46;
      goto LABEL_88;
    }
  }
  else if ((*(_DWORD *)&v21 & 0x10000) == 0)
  {
    goto LABEL_45;
  }
  *((_BYTE *)v20 + 219) = self->_arWalkingUsedInRoutePlanning;
  *((_QWORD *)v20 + 30) |= 0x10000uLL;
  v21 = self->_flags;
  if ((*(_WORD *)&v21 & 0x8000) == 0)
  {
LABEL_46:
    if ((*(_WORD *)&v21 & 0x1000) == 0)
      goto LABEL_47;
    goto LABEL_89;
  }
LABEL_88:
  *((_BYTE *)v20 + 218) = self->_arWalkingUsedInNavigation;
  *((_QWORD *)v20 + 30) |= 0x8000uLL;
  v21 = self->_flags;
  if ((*(_WORD *)&v21 & 0x1000) == 0)
  {
LABEL_47:
    if ((*(_WORD *)&v21 & 0x2000) == 0)
      goto LABEL_48;
    goto LABEL_90;
  }
LABEL_89:
  v20[53] = self->_voiceGuidanceLevel;
  *((_QWORD *)v20 + 30) |= 0x1000uLL;
  v21 = self->_flags;
  if ((*(_WORD *)&v21 & 0x2000) == 0)
  {
LABEL_48:
    if ((*(_DWORD *)&v21 & 0x2000000) == 0)
      goto LABEL_49;
    goto LABEL_91;
  }
LABEL_90:
  *((_BYTE *)v20 + 216) = self->_hFPEnabled;
  *((_QWORD *)v20 + 30) |= 0x2000uLL;
  v21 = self->_flags;
  if ((*(_DWORD *)&v21 & 0x2000000) == 0)
  {
LABEL_49:
    if ((*(_DWORD *)&v21 & 0x20000000) == 0)
      goto LABEL_50;
    goto LABEL_92;
  }
LABEL_91:
  *((_BYTE *)v20 + 228) = self->_isInParkingMode;
  *((_QWORD *)v20 + 30) |= 0x2000000uLL;
  v21 = self->_flags;
  if ((*(_DWORD *)&v21 & 0x20000000) == 0)
  {
LABEL_50:
    if ((*(_DWORD *)&v21 & 0x80000000) == 0)
      goto LABEL_51;
    goto LABEL_93;
  }
LABEL_92:
  *((_BYTE *)v20 + 232) = self->_isSuggestToWalkingTriggered;
  *((_QWORD *)v20 + 30) |= 0x20000000uLL;
  v21 = self->_flags;
  if ((*(_DWORD *)&v21 & 0x80000000) == 0)
  {
LABEL_51:
    if ((*(_DWORD *)&v21 & 0x10000000) == 0)
      goto LABEL_52;
    goto LABEL_94;
  }
LABEL_93:
  *((_BYTE *)v20 + 234) = self->_isTransitedToWalking;
  *((_QWORD *)v20 + 30) |= 0x80000000uLL;
  v21 = self->_flags;
  if ((*(_DWORD *)&v21 & 0x10000000) == 0)
  {
LABEL_52:
    if ((*(_DWORD *)&v21 & 0x40000000) == 0)
      goto LABEL_53;
    goto LABEL_95;
  }
LABEL_94:
  *((_BYTE *)v20 + 231) = self->_isSuggestToFindmyTriggered;
  *((_QWORD *)v20 + 30) |= 0x10000000uLL;
  v21 = self->_flags;
  if ((*(_DWORD *)&v21 & 0x40000000) == 0)
  {
LABEL_53:
    if ((*(_DWORD *)&v21 & 0x800000) == 0)
      goto LABEL_54;
    goto LABEL_96;
  }
LABEL_95:
  *((_BYTE *)v20 + 233) = self->_isTransitedToFindmy;
  *((_QWORD *)v20 + 30) |= 0x40000000uLL;
  v21 = self->_flags;
  if ((*(_DWORD *)&v21 & 0x800000) == 0)
  {
LABEL_54:
    if ((*(_DWORD *)&v21 & 0x4000000) == 0)
      goto LABEL_55;
    goto LABEL_97;
  }
LABEL_96:
  *((_BYTE *)v20 + 226) = self->_isEndRouteTermination;
  *((_QWORD *)v20 + 30) |= 0x800000uLL;
  v21 = self->_flags;
  if ((*(_DWORD *)&v21 & 0x4000000) == 0)
  {
LABEL_55:
    if ((*(_QWORD *)&v21 & 0x200000000) == 0)
      goto LABEL_56;
    goto LABEL_98;
  }
LABEL_97:
  *((_BYTE *)v20 + 229) = self->_isParkedCarTermination;
  *((_QWORD *)v20 + 30) |= 0x4000000uLL;
  v21 = self->_flags;
  if ((*(_QWORD *)&v21 & 0x200000000) == 0)
  {
LABEL_56:
    if ((*(_QWORD *)&v21 & 0x100000000) == 0)
      goto LABEL_58;
    goto LABEL_57;
  }
LABEL_98:
  *((_BYTE *)v20 + 236) = self->_isTransitionToWalkingTermination;
  *((_QWORD *)v20 + 30) |= 0x200000000uLL;
  if ((*(_QWORD *)&self->_flags & 0x100000000) != 0)
  {
LABEL_57:
    *((_BYTE *)v20 + 235) = self->_isTransitionToFindmyTermination;
    *((_QWORD *)v20 + 30) |= 0x100000000uLL;
  }
LABEL_58:
  if (self->_parkingDetectionLocation)
  {
    objc_msgSend(v25, "setParkingDetectionLocation:");
    v20 = v25;
  }
  v22 = self->_flags;
  if ((*(_BYTE *)&v22 & 8) != 0)
  {
    *((_QWORD *)v20 + 18) = *(_QWORD *)&self->_timeBetweenParkedAndArrival;
    *((_QWORD *)v20 + 30) |= 8uLL;
    v22 = self->_flags;
    if ((*(_BYTE *)&v22 & 0x20) == 0)
    {
LABEL_62:
      if ((*(_BYTE *)&v22 & 0x40) == 0)
        goto LABEL_64;
      goto LABEL_63;
    }
  }
  else if ((*(_BYTE *)&v22 & 0x20) == 0)
  {
    goto LABEL_62;
  }
  v20[46] = self->_arrivedAtDestinationCount;
  *((_QWORD *)v20 + 30) |= 0x20uLL;
  if ((*(_QWORD *)&self->_flags & 0x40) != 0)
  {
LABEL_63:
    v20[47] = self->_inParkingModeCount;
    *((_QWORD *)v20 + 30) |= 0x40uLL;
  }
LABEL_64:
  if (self->_arrivalLocation)
  {
    objc_msgSend(v25, "setArrivalLocation:");
    v20 = v25;
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
  id v14;
  void *v15;
  $896FCD321D059B35A66825024FB599E5 flags;
  NSMutableArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  $896FCD321D059B35A66825024FB599E5 v22;
  id v23;
  void *v24;
  $896FCD321D059B35A66825024FB599E5 v25;
  NSMutableArray *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t k;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  $896FCD321D059B35A66825024FB599E5 v35;
  id v36;
  void *v37;
  $896FCD321D059B35A66825024FB599E5 v38;
  id v39;
  void *v40;
  id v41;
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
  _BYTE v57[128];
  _BYTE v58[128];
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
  {
LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOLogMsgEventDirections readAll:](self, "readAll:", 0);
    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    v9 = self->_directionsFeedbacks;
    v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v53, v59, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v54;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v54 != v11)
            objc_enumerationMutation(v9);
          v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v53 + 1) + 8 * i), "copyWithZone:", a3);
          objc_msgSend((id)v5, "addDirectionsFeedback:", v13);

        }
        v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v53, v59, 16);
      }
      while (v10);
    }

    v14 = -[GEOLocation copyWithZone:](self->_finalLocation, "copyWithZone:", a3);
    v15 = *(void **)(v5 + 128);
    *(_QWORD *)(v5 + 128) = v14;

    flags = self->_flags;
    if ((*(_DWORD *)&flags & 0x20000) != 0)
    {
      *(_BYTE *)(v5 + 220) = self->_arrivedAtDestination;
      *(_QWORD *)(v5 + 240) |= 0x20000uLL;
      flags = self->_flags;
      if ((*(_BYTE *)&flags & 1) == 0)
      {
LABEL_14:
        if ((*(_BYTE *)&flags & 4) == 0)
          goto LABEL_15;
        goto LABEL_71;
      }
    }
    else if ((*(_BYTE *)&flags & 1) == 0)
    {
      goto LABEL_14;
    }
    v43 = *(_OWORD *)&self->_navigationAudioFeedback._pauseSpokenAudioEnabled;
    v44 = *(_OWORD *)&self->_navigationAudioFeedback._manuallyChangedRouteCount;
    *(_OWORD *)(v5 + 16) = *(_OWORD *)&self->_navigationAudioFeedback._bTHFPAvailableAtEndOfNav;
    *(_OWORD *)(v5 + 32) = v44;
    *(_OWORD *)(v5 + 44) = v43;
    *(_QWORD *)(v5 + 240) |= 1uLL;
    flags = self->_flags;
    if ((*(_BYTE *)&flags & 4) == 0)
    {
LABEL_15:
      if ((*(_BYTE *)&flags & 2) == 0)
        goto LABEL_17;
      goto LABEL_16;
    }
LABEL_71:
    *(double *)(v5 + 104) = self->_durationOfTrip;
    *(_QWORD *)(v5 + 240) |= 4uLL;
    if ((*(_QWORD *)&self->_flags & 2) == 0)
    {
LABEL_17:
      v51 = 0u;
      v52 = 0u;
      v49 = 0u;
      v50 = 0u;
      v17 = self->_durationInNavigationModes;
      v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
      if (v18)
      {
        v19 = *(_QWORD *)v50;
        do
        {
          for (j = 0; j != v18; ++j)
          {
            if (*(_QWORD *)v50 != v19)
              objc_enumerationMutation(v17);
            v21 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v49 + 1) + 8 * j), "copyWithZone:", a3);
            objc_msgSend((id)v5, "addDurationInNavigationMode:", v21);

          }
          v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
        }
        while (v18);
      }

      v22 = self->_flags;
      if ((*(_BYTE *)&v22 & 0x80) != 0)
      {
        *(_DWORD *)(v5 + 192) = self->_originalEta;
        *(_QWORD *)(v5 + 240) |= 0x80uLL;
        v22 = self->_flags;
        if ((*(_QWORD *)&v22 & 0x800000000) == 0)
        {
LABEL_26:
          if ((*(_DWORD *)&v22 & 0x400000) == 0)
            goto LABEL_27;
          goto LABEL_75;
        }
      }
      else if ((*(_QWORD *)&v22 & 0x800000000) == 0)
      {
        goto LABEL_26;
      }
      *(_BYTE *)(v5 + 238) = self->_preArrival;
      *(_QWORD *)(v5 + 240) |= 0x800000000uLL;
      v22 = self->_flags;
      if ((*(_DWORD *)&v22 & 0x400000) == 0)
      {
LABEL_27:
        if ((*(_DWORD *)&v22 & 0x200000) == 0)
          goto LABEL_28;
        goto LABEL_76;
      }
LABEL_75:
      *(_BYTE *)(v5 + 225) = self->_isCyclingNlgAvailable;
      *(_QWORD *)(v5 + 240) |= 0x400000uLL;
      v22 = self->_flags;
      if ((*(_DWORD *)&v22 & 0x200000) == 0)
      {
LABEL_28:
        if ((*(_QWORD *)&v22 & 0x400000000) == 0)
          goto LABEL_29;
        goto LABEL_77;
      }
LABEL_76:
      *(_BYTE *)(v5 + 224) = self->_isCoarseLocationUsed;
      *(_QWORD *)(v5 + 240) |= 0x200000uLL;
      v22 = self->_flags;
      if ((*(_QWORD *)&v22 & 0x400000000) == 0)
      {
LABEL_29:
        if ((*(_WORD *)&v22 & 0x4000) == 0)
          goto LABEL_30;
        goto LABEL_78;
      }
LABEL_77:
      *(_BYTE *)(v5 + 237) = self->_isVlfImprovementUsed;
      *(_QWORD *)(v5 + 240) |= 0x400000000uLL;
      v22 = self->_flags;
      if ((*(_WORD *)&v22 & 0x4000) == 0)
      {
LABEL_30:
        if ((*(_DWORD *)&v22 & 0x40000) == 0)
          goto LABEL_31;
        goto LABEL_79;
      }
LABEL_78:
      *(_BYTE *)(v5 + 217) = self->_acceptedCyclingWorkout;
      *(_QWORD *)(v5 + 240) |= 0x4000uLL;
      v22 = self->_flags;
      if ((*(_DWORD *)&v22 & 0x40000) == 0)
      {
LABEL_31:
        if ((*(_DWORD *)&v22 & 0x80000) == 0)
          goto LABEL_32;
        goto LABEL_80;
      }
LABEL_79:
      *(_BYTE *)(v5 + 221) = self->_batteryDied;
      *(_QWORD *)(v5 + 240) |= 0x40000uLL;
      v22 = self->_flags;
      if ((*(_DWORD *)&v22 & 0x80000) == 0)
      {
LABEL_32:
        if ((*(_DWORD *)&v22 & 0x8000000) == 0)
          goto LABEL_34;
        goto LABEL_33;
      }
LABEL_80:
      *(_BYTE *)(v5 + 222) = self->_chargingStopAdded;
      *(_QWORD *)(v5 + 240) |= 0x80000uLL;
      if ((*(_QWORD *)&self->_flags & 0x8000000) == 0)
      {
LABEL_34:
        v23 = -[GEOLatLng copyWithZone:](self->_tripOrigin, "copyWithZone:", a3);
        v24 = *(void **)(v5 + 152);
        *(_QWORD *)(v5 + 152) = v23;

        v25 = self->_flags;
        if ((*(_DWORD *)&v25 & 0x100000) != 0)
        {
          *(_BYTE *)(v5 + 223) = self->_isBadEvExperience;
          *(_QWORD *)(v5 + 240) |= 0x100000uLL;
          v25 = self->_flags;
          if ((*(_DWORD *)&v25 & 0x1000000) == 0)
          {
LABEL_36:
            if ((*(_WORD *)&v25 & 0x400) == 0)
              goto LABEL_37;
            goto LABEL_84;
          }
        }
        else if ((*(_DWORD *)&v25 & 0x1000000) == 0)
        {
          goto LABEL_36;
        }
        *(_BYTE *)(v5 + 227) = self->_isEvSampleTrip;
        *(_QWORD *)(v5 + 240) |= 0x1000000uLL;
        v25 = self->_flags;
        if ((*(_WORD *)&v25 & 0x400) == 0)
        {
LABEL_37:
          if ((*(_WORD *)&v25 & 0x200) == 0)
            goto LABEL_38;
          goto LABEL_85;
        }
LABEL_84:
        *(_DWORD *)(v5 + 204) = self->_stateOfChargeAtOrigin;
        *(_QWORD *)(v5 + 240) |= 0x400uLL;
        v25 = self->_flags;
        if ((*(_WORD *)&v25 & 0x200) == 0)
        {
LABEL_38:
          if ((*(_WORD *)&v25 & 0x100) == 0)
            goto LABEL_39;
          goto LABEL_86;
        }
LABEL_85:
        *(_DWORD *)(v5 + 200) = self->_stateOfChargeAtDestPredicted;
        *(_QWORD *)(v5 + 240) |= 0x200uLL;
        v25 = self->_flags;
        if ((*(_WORD *)&v25 & 0x100) == 0)
        {
LABEL_39:
          if ((*(_WORD *)&v25 & 0x800) == 0)
            goto LABEL_41;
          goto LABEL_40;
        }
LABEL_86:
        *(_DWORD *)(v5 + 196) = self->_stateOfChargeAtDestActual;
        *(_QWORD *)(v5 + 240) |= 0x100uLL;
        if ((*(_QWORD *)&self->_flags & 0x800) == 0)
        {
LABEL_41:
          v47 = 0u;
          v48 = 0u;
          v45 = 0u;
          v46 = 0u;
          v26 = self->_waypoints;
          v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v45, v57, 16);
          if (v27)
          {
            v28 = *(_QWORD *)v46;
            do
            {
              for (k = 0; k != v27; ++k)
              {
                if (*(_QWORD *)v46 != v28)
                  objc_enumerationMutation(v26);
                v30 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * k), "copyWithZone:", a3, (_QWORD)v45);
                objc_msgSend((id)v5, "addWaypoints:", v30);

              }
              v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v45, v57, 16);
            }
            while (v27);
          }

          v31 = -[NSString copyWithZone:](self->_evConsumptionModel, "copyWithZone:", a3);
          v32 = *(void **)(v5 + 120);
          *(_QWORD *)(v5 + 120) = v31;

          v33 = -[NSString copyWithZone:](self->_evChargingMode, "copyWithZone:", a3);
          v34 = *(void **)(v5 + 112);
          *(_QWORD *)(v5 + 112) = v33;

          v35 = self->_flags;
          if ((*(_BYTE *)&v35 & 0x10) != 0)
          {
            *(_DWORD *)(v5 + 180) = self->_activeNavMode;
            *(_QWORD *)(v5 + 240) |= 0x10uLL;
            v35 = self->_flags;
            if ((*(_DWORD *)&v35 & 0x10000) == 0)
            {
LABEL_50:
              if ((*(_WORD *)&v35 & 0x8000) == 0)
                goto LABEL_51;
              goto LABEL_90;
            }
          }
          else if ((*(_DWORD *)&v35 & 0x10000) == 0)
          {
            goto LABEL_50;
          }
          *(_BYTE *)(v5 + 219) = self->_arWalkingUsedInRoutePlanning;
          *(_QWORD *)(v5 + 240) |= 0x10000uLL;
          v35 = self->_flags;
          if ((*(_WORD *)&v35 & 0x8000) == 0)
          {
LABEL_51:
            if ((*(_WORD *)&v35 & 0x1000) == 0)
              goto LABEL_52;
            goto LABEL_91;
          }
LABEL_90:
          *(_BYTE *)(v5 + 218) = self->_arWalkingUsedInNavigation;
          *(_QWORD *)(v5 + 240) |= 0x8000uLL;
          v35 = self->_flags;
          if ((*(_WORD *)&v35 & 0x1000) == 0)
          {
LABEL_52:
            if ((*(_WORD *)&v35 & 0x2000) == 0)
              goto LABEL_53;
            goto LABEL_92;
          }
LABEL_91:
          *(_DWORD *)(v5 + 212) = self->_voiceGuidanceLevel;
          *(_QWORD *)(v5 + 240) |= 0x1000uLL;
          v35 = self->_flags;
          if ((*(_WORD *)&v35 & 0x2000) == 0)
          {
LABEL_53:
            if ((*(_DWORD *)&v35 & 0x2000000) == 0)
              goto LABEL_54;
            goto LABEL_93;
          }
LABEL_92:
          *(_BYTE *)(v5 + 216) = self->_hFPEnabled;
          *(_QWORD *)(v5 + 240) |= 0x2000uLL;
          v35 = self->_flags;
          if ((*(_DWORD *)&v35 & 0x2000000) == 0)
          {
LABEL_54:
            if ((*(_DWORD *)&v35 & 0x20000000) == 0)
              goto LABEL_55;
            goto LABEL_94;
          }
LABEL_93:
          *(_BYTE *)(v5 + 228) = self->_isInParkingMode;
          *(_QWORD *)(v5 + 240) |= 0x2000000uLL;
          v35 = self->_flags;
          if ((*(_DWORD *)&v35 & 0x20000000) == 0)
          {
LABEL_55:
            if ((*(_DWORD *)&v35 & 0x80000000) == 0)
              goto LABEL_56;
            goto LABEL_95;
          }
LABEL_94:
          *(_BYTE *)(v5 + 232) = self->_isSuggestToWalkingTriggered;
          *(_QWORD *)(v5 + 240) |= 0x20000000uLL;
          v35 = self->_flags;
          if ((*(_DWORD *)&v35 & 0x80000000) == 0)
          {
LABEL_56:
            if ((*(_DWORD *)&v35 & 0x10000000) == 0)
              goto LABEL_57;
            goto LABEL_96;
          }
LABEL_95:
          *(_BYTE *)(v5 + 234) = self->_isTransitedToWalking;
          *(_QWORD *)(v5 + 240) |= 0x80000000uLL;
          v35 = self->_flags;
          if ((*(_DWORD *)&v35 & 0x10000000) == 0)
          {
LABEL_57:
            if ((*(_DWORD *)&v35 & 0x40000000) == 0)
              goto LABEL_58;
            goto LABEL_97;
          }
LABEL_96:
          *(_BYTE *)(v5 + 231) = self->_isSuggestToFindmyTriggered;
          *(_QWORD *)(v5 + 240) |= 0x10000000uLL;
          v35 = self->_flags;
          if ((*(_DWORD *)&v35 & 0x40000000) == 0)
          {
LABEL_58:
            if ((*(_DWORD *)&v35 & 0x800000) == 0)
              goto LABEL_59;
            goto LABEL_98;
          }
LABEL_97:
          *(_BYTE *)(v5 + 233) = self->_isTransitedToFindmy;
          *(_QWORD *)(v5 + 240) |= 0x40000000uLL;
          v35 = self->_flags;
          if ((*(_DWORD *)&v35 & 0x800000) == 0)
          {
LABEL_59:
            if ((*(_DWORD *)&v35 & 0x4000000) == 0)
              goto LABEL_60;
            goto LABEL_99;
          }
LABEL_98:
          *(_BYTE *)(v5 + 226) = self->_isEndRouteTermination;
          *(_QWORD *)(v5 + 240) |= 0x800000uLL;
          v35 = self->_flags;
          if ((*(_DWORD *)&v35 & 0x4000000) == 0)
          {
LABEL_60:
            if ((*(_QWORD *)&v35 & 0x200000000) == 0)
              goto LABEL_61;
            goto LABEL_100;
          }
LABEL_99:
          *(_BYTE *)(v5 + 229) = self->_isParkedCarTermination;
          *(_QWORD *)(v5 + 240) |= 0x4000000uLL;
          v35 = self->_flags;
          if ((*(_QWORD *)&v35 & 0x200000000) == 0)
          {
LABEL_61:
            if ((*(_QWORD *)&v35 & 0x100000000) == 0)
              goto LABEL_63;
            goto LABEL_62;
          }
LABEL_100:
          *(_BYTE *)(v5 + 236) = self->_isTransitionToWalkingTermination;
          *(_QWORD *)(v5 + 240) |= 0x200000000uLL;
          if ((*(_QWORD *)&self->_flags & 0x100000000) == 0)
          {
LABEL_63:
            v36 = -[GEOLocation copyWithZone:](self->_parkingDetectionLocation, "copyWithZone:", a3, (_QWORD)v45);
            v37 = *(void **)(v5 + 136);
            *(_QWORD *)(v5 + 136) = v36;

            v38 = self->_flags;
            if ((*(_BYTE *)&v38 & 8) != 0)
            {
              *(double *)(v5 + 144) = self->_timeBetweenParkedAndArrival;
              *(_QWORD *)(v5 + 240) |= 8uLL;
              v38 = self->_flags;
              if ((*(_BYTE *)&v38 & 0x20) == 0)
              {
LABEL_65:
                if ((*(_BYTE *)&v38 & 0x40) == 0)
                {
LABEL_67:
                  v39 = -[GEOLocation copyWithZone:](self->_arrivalLocation, "copyWithZone:", a3);
                  v40 = *(void **)(v5 + 80);
                  *(_QWORD *)(v5 + 80) = v39;

                  v41 = (id)v5;
                  goto LABEL_68;
                }
LABEL_66:
                *(_DWORD *)(v5 + 188) = self->_inParkingModeCount;
                *(_QWORD *)(v5 + 240) |= 0x40uLL;
                goto LABEL_67;
              }
            }
            else if ((*(_BYTE *)&v38 & 0x20) == 0)
            {
              goto LABEL_65;
            }
            *(_DWORD *)(v5 + 184) = self->_arrivedAtDestinationCount;
            *(_QWORD *)(v5 + 240) |= 0x20uLL;
            if ((*(_QWORD *)&self->_flags & 0x40) == 0)
              goto LABEL_67;
            goto LABEL_66;
          }
LABEL_62:
          *(_BYTE *)(v5 + 235) = self->_isTransitionToFindmyTermination;
          *(_QWORD *)(v5 + 240) |= 0x100000000uLL;
          goto LABEL_63;
        }
LABEL_40:
        *(_DWORD *)(v5 + 208) = self->_stateOfChargeDiffAtDest;
        *(_QWORD *)(v5 + 240) |= 0x800uLL;
        goto LABEL_41;
      }
LABEL_33:
      *(_BYTE *)(v5 + 230) = self->_isSiriEngaged;
      *(_QWORD *)(v5 + 240) |= 0x8000000uLL;
      goto LABEL_34;
    }
LABEL_16:
    *(GEOSessionID *)(v5 + 64) = self->_navSessionId;
    *(_QWORD *)(v5 + 240) |= 2uLL;
    goto LABEL_17;
  }
  v7 = reader;
  objc_sync_enter(v7);
  if ((*((_BYTE *)&self->_flags + 5) & 0x20) != 0)
  {
    objc_sync_exit(v7);

    goto LABEL_5;
  }
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  GEOLogMsgEventDirectionsReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  v8 = (id)v5;
  objc_sync_exit(v7);

LABEL_68:
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  char *v4;
  NSMutableArray *directionsFeedbacks;
  GEOLocation *finalLocation;
  $896FCD321D059B35A66825024FB599E5 flags;
  uint64_t v8;
  NSMutableArray *durationInNavigationModes;
  GEOLatLng *tripOrigin;
  NSMutableArray *waypoints;
  NSString *evConsumptionModel;
  NSString *evChargingMode;
  $896FCD321D059B35A66825024FB599E5 v15;
  uint64_t v16;
  GEOLocation *parkingDetectionLocation;
  GEOLocation *arrivalLocation;
  char v19;

  v4 = (char *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_276;
  -[GEOLogMsgEventDirections readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  directionsFeedbacks = self->_directionsFeedbacks;
  if ((unint64_t)directionsFeedbacks | *((_QWORD *)v4 + 11))
  {
    if (!-[NSMutableArray isEqual:](directionsFeedbacks, "isEqual:"))
      goto LABEL_276;
  }
  finalLocation = self->_finalLocation;
  if ((unint64_t)finalLocation | *((_QWORD *)v4 + 16))
  {
    if (!-[GEOLocation isEqual:](finalLocation, "isEqual:"))
      goto LABEL_276;
  }
  flags = self->_flags;
  v8 = *((_QWORD *)v4 + 30);
  if ((*(_DWORD *)&flags & 0x20000) != 0)
  {
    if ((v8 & 0x20000) == 0)
      goto LABEL_276;
    if (self->_arrivedAtDestination)
    {
      if (!v4[220])
        goto LABEL_276;
    }
    else if (v4[220])
    {
      goto LABEL_276;
    }
  }
  else if ((v8 & 0x20000) != 0)
  {
    goto LABEL_276;
  }
  if ((*(_BYTE *)&flags & 1) != 0 && (v8 & 1) != 0)
  {
    if (memcmp(&self->_navigationAudioFeedback, v4 + 16, 0x2CuLL))
      goto LABEL_276;
  }
  else if (((*(_DWORD *)&flags | v8) & 1) != 0)
  {
    goto LABEL_276;
  }
  if ((*(_BYTE *)&flags & 4) != 0)
  {
    if ((v8 & 4) == 0 || self->_durationOfTrip != *((double *)v4 + 13))
      goto LABEL_276;
  }
  else if ((v8 & 4) != 0)
  {
    goto LABEL_276;
  }
  if ((*(_BYTE *)&flags & 2) != 0 && (v8 & 2) != 0)
  {
    if (self->_navSessionId._high != *((_QWORD *)v4 + 8) || self->_navSessionId._low != *((_QWORD *)v4 + 9))
      goto LABEL_276;
  }
  else if (((*(_DWORD *)&flags | v8) & 2) != 0)
  {
    goto LABEL_276;
  }
  durationInNavigationModes = self->_durationInNavigationModes;
  if ((unint64_t)durationInNavigationModes | *((_QWORD *)v4 + 12))
  {
    if (!-[NSMutableArray isEqual:](durationInNavigationModes, "isEqual:"))
      goto LABEL_276;
    flags = self->_flags;
    v8 = *((_QWORD *)v4 + 30);
  }
  if ((*(_BYTE *)&flags & 0x80) != 0)
  {
    if ((v8 & 0x80) == 0 || self->_originalEta != *((_DWORD *)v4 + 48))
      goto LABEL_276;
  }
  else if ((v8 & 0x80) != 0)
  {
    goto LABEL_276;
  }
  if ((*(_QWORD *)&flags & 0x800000000) != 0)
  {
    if ((v8 & 0x800000000) == 0)
      goto LABEL_276;
    if (self->_preArrival)
    {
      if (!v4[238])
        goto LABEL_276;
    }
    else if (v4[238])
    {
      goto LABEL_276;
    }
  }
  else if ((v8 & 0x800000000) != 0)
  {
    goto LABEL_276;
  }
  if ((*(_DWORD *)&flags & 0x400000) != 0)
  {
    if ((v8 & 0x400000) == 0)
      goto LABEL_276;
    if (self->_isCyclingNlgAvailable)
    {
      if (!v4[225])
        goto LABEL_276;
    }
    else if (v4[225])
    {
      goto LABEL_276;
    }
  }
  else if ((v8 & 0x400000) != 0)
  {
    goto LABEL_276;
  }
  if ((*(_DWORD *)&flags & 0x200000) != 0)
  {
    if ((v8 & 0x200000) == 0)
      goto LABEL_276;
    if (self->_isCoarseLocationUsed)
    {
      if (!v4[224])
        goto LABEL_276;
    }
    else if (v4[224])
    {
      goto LABEL_276;
    }
  }
  else if ((v8 & 0x200000) != 0)
  {
    goto LABEL_276;
  }
  if ((*(_QWORD *)&flags & 0x400000000) != 0)
  {
    if ((v8 & 0x400000000) == 0)
      goto LABEL_276;
    if (self->_isVlfImprovementUsed)
    {
      if (!v4[237])
        goto LABEL_276;
    }
    else if (v4[237])
    {
      goto LABEL_276;
    }
  }
  else if ((v8 & 0x400000000) != 0)
  {
    goto LABEL_276;
  }
  if ((*(_WORD *)&flags & 0x4000) != 0)
  {
    if ((v8 & 0x4000) == 0)
      goto LABEL_276;
    if (self->_acceptedCyclingWorkout)
    {
      if (!v4[217])
        goto LABEL_276;
    }
    else if (v4[217])
    {
      goto LABEL_276;
    }
  }
  else if ((v8 & 0x4000) != 0)
  {
    goto LABEL_276;
  }
  if ((*(_DWORD *)&flags & 0x40000) != 0)
  {
    if ((v8 & 0x40000) == 0)
      goto LABEL_276;
    if (self->_batteryDied)
    {
      if (!v4[221])
        goto LABEL_276;
    }
    else if (v4[221])
    {
      goto LABEL_276;
    }
  }
  else if ((v8 & 0x40000) != 0)
  {
    goto LABEL_276;
  }
  if ((*(_DWORD *)&flags & 0x80000) != 0)
  {
    if ((v8 & 0x80000) == 0)
      goto LABEL_276;
    if (self->_chargingStopAdded)
    {
      if (!v4[222])
        goto LABEL_276;
    }
    else if (v4[222])
    {
      goto LABEL_276;
    }
  }
  else if ((v8 & 0x80000) != 0)
  {
    goto LABEL_276;
  }
  if ((*(_DWORD *)&flags & 0x8000000) != 0)
  {
    if ((v8 & 0x8000000) == 0)
      goto LABEL_276;
    if (self->_isSiriEngaged)
    {
      if (!v4[230])
        goto LABEL_276;
    }
    else if (v4[230])
    {
      goto LABEL_276;
    }
  }
  else if ((v8 & 0x8000000) != 0)
  {
    goto LABEL_276;
  }
  tripOrigin = self->_tripOrigin;
  if ((unint64_t)tripOrigin | *((_QWORD *)v4 + 19))
  {
    if (!-[GEOLatLng isEqual:](tripOrigin, "isEqual:"))
      goto LABEL_276;
    flags = self->_flags;
    v8 = *((_QWORD *)v4 + 30);
  }
  if ((*(_DWORD *)&flags & 0x100000) != 0)
  {
    if ((v8 & 0x100000) == 0)
      goto LABEL_276;
    if (self->_isBadEvExperience)
    {
      if (!v4[223])
        goto LABEL_276;
    }
    else if (v4[223])
    {
      goto LABEL_276;
    }
  }
  else if ((v8 & 0x100000) != 0)
  {
    goto LABEL_276;
  }
  if ((*(_DWORD *)&flags & 0x1000000) != 0)
  {
    if ((v8 & 0x1000000) == 0)
      goto LABEL_276;
    if (self->_isEvSampleTrip)
    {
      if (!v4[227])
        goto LABEL_276;
    }
    else if (v4[227])
    {
      goto LABEL_276;
    }
  }
  else if ((v8 & 0x1000000) != 0)
  {
    goto LABEL_276;
  }
  if ((*(_WORD *)&flags & 0x400) != 0)
  {
    if ((v8 & 0x400) == 0 || self->_stateOfChargeAtOrigin != *((_DWORD *)v4 + 51))
      goto LABEL_276;
  }
  else if ((v8 & 0x400) != 0)
  {
    goto LABEL_276;
  }
  if ((*(_WORD *)&flags & 0x200) != 0)
  {
    if ((v8 & 0x200) == 0 || self->_stateOfChargeAtDestPredicted != *((_DWORD *)v4 + 50))
      goto LABEL_276;
  }
  else if ((v8 & 0x200) != 0)
  {
    goto LABEL_276;
  }
  if ((*(_WORD *)&flags & 0x100) != 0)
  {
    if ((v8 & 0x100) == 0 || self->_stateOfChargeAtDestActual != *((_DWORD *)v4 + 49))
      goto LABEL_276;
  }
  else if ((v8 & 0x100) != 0)
  {
    goto LABEL_276;
  }
  if ((*(_WORD *)&flags & 0x800) != 0)
  {
    if ((v8 & 0x800) == 0 || self->_stateOfChargeDiffAtDest != *((_DWORD *)v4 + 52))
      goto LABEL_276;
  }
  else if ((v8 & 0x800) != 0)
  {
    goto LABEL_276;
  }
  waypoints = self->_waypoints;
  if ((unint64_t)waypoints | *((_QWORD *)v4 + 20)
    && !-[NSMutableArray isEqual:](waypoints, "isEqual:"))
  {
    goto LABEL_276;
  }
  evConsumptionModel = self->_evConsumptionModel;
  if ((unint64_t)evConsumptionModel | *((_QWORD *)v4 + 15))
  {
    if (!-[NSString isEqual:](evConsumptionModel, "isEqual:"))
      goto LABEL_276;
  }
  evChargingMode = self->_evChargingMode;
  if ((unint64_t)evChargingMode | *((_QWORD *)v4 + 14))
  {
    if (!-[NSString isEqual:](evChargingMode, "isEqual:"))
      goto LABEL_276;
  }
  v15 = self->_flags;
  v16 = *((_QWORD *)v4 + 30);
  if ((*(_BYTE *)&v15 & 0x10) != 0)
  {
    if ((v16 & 0x10) == 0 || self->_activeNavMode != *((_DWORD *)v4 + 45))
      goto LABEL_276;
  }
  else if ((v16 & 0x10) != 0)
  {
    goto LABEL_276;
  }
  if ((*(_DWORD *)&v15 & 0x10000) != 0)
  {
    if ((v16 & 0x10000) == 0)
      goto LABEL_276;
    if (self->_arWalkingUsedInRoutePlanning)
    {
      if (!v4[219])
        goto LABEL_276;
    }
    else if (v4[219])
    {
      goto LABEL_276;
    }
  }
  else if ((v16 & 0x10000) != 0)
  {
    goto LABEL_276;
  }
  if ((*(_WORD *)&v15 & 0x8000) != 0)
  {
    if ((v16 & 0x8000) == 0)
      goto LABEL_276;
    if (self->_arWalkingUsedInNavigation)
    {
      if (!v4[218])
        goto LABEL_276;
    }
    else if (v4[218])
    {
      goto LABEL_276;
    }
  }
  else if ((v16 & 0x8000) != 0)
  {
    goto LABEL_276;
  }
  if ((*(_WORD *)&v15 & 0x1000) != 0)
  {
    if ((v16 & 0x1000) == 0 || self->_voiceGuidanceLevel != *((_DWORD *)v4 + 53))
      goto LABEL_276;
  }
  else if ((v16 & 0x1000) != 0)
  {
    goto LABEL_276;
  }
  if ((*(_WORD *)&v15 & 0x2000) != 0)
  {
    if ((v16 & 0x2000) == 0)
      goto LABEL_276;
    if (self->_hFPEnabled)
    {
      if (!v4[216])
        goto LABEL_276;
    }
    else if (v4[216])
    {
      goto LABEL_276;
    }
  }
  else if ((v16 & 0x2000) != 0)
  {
    goto LABEL_276;
  }
  if ((*(_DWORD *)&v15 & 0x2000000) != 0)
  {
    if ((v16 & 0x2000000) == 0)
      goto LABEL_276;
    if (self->_isInParkingMode)
    {
      if (!v4[228])
        goto LABEL_276;
    }
    else if (v4[228])
    {
      goto LABEL_276;
    }
  }
  else if ((v16 & 0x2000000) != 0)
  {
    goto LABEL_276;
  }
  if ((*(_DWORD *)&v15 & 0x20000000) != 0)
  {
    if ((v16 & 0x20000000) == 0)
      goto LABEL_276;
    if (self->_isSuggestToWalkingTriggered)
    {
      if (!v4[232])
        goto LABEL_276;
    }
    else if (v4[232])
    {
      goto LABEL_276;
    }
  }
  else if ((v16 & 0x20000000) != 0)
  {
    goto LABEL_276;
  }
  if ((*(_DWORD *)&v15 & 0x80000000) != 0)
  {
    if ((v16 & 0x80000000) == 0)
      goto LABEL_276;
    if (self->_isTransitedToWalking)
    {
      if (!v4[234])
        goto LABEL_276;
    }
    else if (v4[234])
    {
      goto LABEL_276;
    }
  }
  else if ((v16 & 0x80000000) != 0)
  {
    goto LABEL_276;
  }
  if ((*(_DWORD *)&v15 & 0x10000000) != 0)
  {
    if ((v16 & 0x10000000) == 0)
      goto LABEL_276;
    if (self->_isSuggestToFindmyTriggered)
    {
      if (!v4[231])
        goto LABEL_276;
    }
    else if (v4[231])
    {
      goto LABEL_276;
    }
  }
  else if ((v16 & 0x10000000) != 0)
  {
    goto LABEL_276;
  }
  if ((*(_DWORD *)&v15 & 0x40000000) != 0)
  {
    if ((v16 & 0x40000000) == 0)
      goto LABEL_276;
    if (self->_isTransitedToFindmy)
    {
      if (!v4[233])
        goto LABEL_276;
    }
    else if (v4[233])
    {
      goto LABEL_276;
    }
  }
  else if ((v16 & 0x40000000) != 0)
  {
    goto LABEL_276;
  }
  if ((*(_DWORD *)&v15 & 0x800000) != 0)
  {
    if ((v16 & 0x800000) == 0)
      goto LABEL_276;
    if (self->_isEndRouteTermination)
    {
      if (!v4[226])
        goto LABEL_276;
    }
    else if (v4[226])
    {
      goto LABEL_276;
    }
  }
  else if ((v16 & 0x800000) != 0)
  {
    goto LABEL_276;
  }
  if ((*(_DWORD *)&v15 & 0x4000000) != 0)
  {
    if ((v16 & 0x4000000) == 0)
      goto LABEL_276;
    if (self->_isParkedCarTermination)
    {
      if (!v4[229])
        goto LABEL_276;
    }
    else if (v4[229])
    {
      goto LABEL_276;
    }
  }
  else if ((v16 & 0x4000000) != 0)
  {
    goto LABEL_276;
  }
  if ((*(_QWORD *)&v15 & 0x200000000) != 0)
  {
    if ((v16 & 0x200000000) == 0)
      goto LABEL_276;
    if (self->_isTransitionToWalkingTermination)
    {
      if (!v4[236])
        goto LABEL_276;
    }
    else if (v4[236])
    {
      goto LABEL_276;
    }
  }
  else if ((v16 & 0x200000000) != 0)
  {
    goto LABEL_276;
  }
  if ((*(_QWORD *)&v15 & 0x100000000) != 0)
  {
    if ((v16 & 0x100000000) == 0)
      goto LABEL_276;
    if (self->_isTransitionToFindmyTermination)
    {
      if (!v4[235])
        goto LABEL_276;
    }
    else if (v4[235])
    {
      goto LABEL_276;
    }
  }
  else if ((v16 & 0x100000000) != 0)
  {
    goto LABEL_276;
  }
  parkingDetectionLocation = self->_parkingDetectionLocation;
  if (!((unint64_t)parkingDetectionLocation | *((_QWORD *)v4 + 17)))
    goto LABEL_259;
  if (!-[GEOLocation isEqual:](parkingDetectionLocation, "isEqual:"))
  {
LABEL_276:
    v19 = 0;
    goto LABEL_277;
  }
  v15 = self->_flags;
  v16 = *((_QWORD *)v4 + 30);
LABEL_259:
  if ((*(_BYTE *)&v15 & 8) != 0)
  {
    if ((v16 & 8) == 0 || self->_timeBetweenParkedAndArrival != *((double *)v4 + 18))
      goto LABEL_276;
  }
  else if ((v16 & 8) != 0)
  {
    goto LABEL_276;
  }
  if ((*(_BYTE *)&v15 & 0x20) != 0)
  {
    if ((v16 & 0x20) == 0 || self->_arrivedAtDestinationCount != *((_DWORD *)v4 + 46))
      goto LABEL_276;
  }
  else if ((v16 & 0x20) != 0)
  {
    goto LABEL_276;
  }
  if ((*(_BYTE *)&v15 & 0x40) != 0)
  {
    if ((v16 & 0x40) == 0 || self->_inParkingModeCount != *((_DWORD *)v4 + 47))
      goto LABEL_276;
  }
  else if ((v16 & 0x40) != 0)
  {
    goto LABEL_276;
  }
  arrivalLocation = self->_arrivalLocation;
  if ((unint64_t)arrivalLocation | *((_QWORD *)v4 + 10))
    v19 = -[GEOLocation isEqual:](arrivalLocation, "isEqual:");
  else
    v19 = 1;
LABEL_277:

  return v19;
}

- (unint64_t)hash
{
  $896FCD321D059B35A66825024FB599E5 flags;
  double durationOfTrip;
  double v5;
  long double v6;
  double v7;
  unint64_t v8;
  $896FCD321D059B35A66825024FB599E5 v9;
  $896FCD321D059B35A66825024FB599E5 v10;
  $896FCD321D059B35A66825024FB599E5 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  $896FCD321D059B35A66825024FB599E5 v19;
  unint64_t v20;
  double timeBetweenParkedAndArrival;
  double v22;
  long double v23;
  double v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  NSUInteger v36;
  NSUInteger v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
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
  unint64_t v57;
  uint64_t v58;
  uint64_t v59;
  unint64_t v60;
  uint64_t v61;

  -[GEOLogMsgEventDirections readAll:](self, "readAll:", 1);
  v61 = -[NSMutableArray hash](self->_directionsFeedbacks, "hash");
  v60 = -[GEOLocation hash](self->_finalLocation, "hash");
  flags = self->_flags;
  if ((*(_DWORD *)&flags & 0x20000) == 0)
  {
    v59 = 0;
    if ((*(_BYTE *)&flags & 1) != 0)
      goto LABEL_3;
LABEL_9:
    v58 = 0;
    if ((*(_BYTE *)&flags & 4) != 0)
      goto LABEL_4;
LABEL_10:
    v8 = 0;
    goto LABEL_13;
  }
  v59 = 2654435761 * self->_arrivedAtDestination;
  if ((*(_BYTE *)&flags & 1) == 0)
    goto LABEL_9;
LABEL_3:
  v58 = PBHashBytes();
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 4) == 0)
    goto LABEL_10;
LABEL_4:
  durationOfTrip = self->_durationOfTrip;
  v5 = -durationOfTrip;
  if (durationOfTrip >= 0.0)
    v5 = self->_durationOfTrip;
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
LABEL_13:
  v57 = v8;
  if ((*(_BYTE *)&flags & 2) != 0)
    v56 = PBHashBytes();
  else
    v56 = 0;
  v55 = -[NSMutableArray hash](self->_durationInNavigationModes, "hash");
  v9 = self->_flags;
  if ((*(_BYTE *)&v9 & 0x80) != 0)
  {
    v54 = 2654435761 * self->_originalEta;
    if ((*(_QWORD *)&v9 & 0x800000000) != 0)
    {
LABEL_18:
      v53 = 2654435761 * self->_preArrival;
      if ((*(_DWORD *)&v9 & 0x400000) != 0)
        goto LABEL_19;
      goto LABEL_28;
    }
  }
  else
  {
    v54 = 0;
    if ((*(_QWORD *)&v9 & 0x800000000) != 0)
      goto LABEL_18;
  }
  v53 = 0;
  if ((*(_DWORD *)&v9 & 0x400000) != 0)
  {
LABEL_19:
    v52 = 2654435761 * self->_isCyclingNlgAvailable;
    if ((*(_DWORD *)&v9 & 0x200000) != 0)
      goto LABEL_20;
    goto LABEL_29;
  }
LABEL_28:
  v52 = 0;
  if ((*(_DWORD *)&v9 & 0x200000) != 0)
  {
LABEL_20:
    v51 = 2654435761 * self->_isCoarseLocationUsed;
    if ((*(_QWORD *)&v9 & 0x400000000) != 0)
      goto LABEL_21;
    goto LABEL_30;
  }
LABEL_29:
  v51 = 0;
  if ((*(_QWORD *)&v9 & 0x400000000) != 0)
  {
LABEL_21:
    v50 = 2654435761 * self->_isVlfImprovementUsed;
    if ((*(_WORD *)&v9 & 0x4000) != 0)
      goto LABEL_22;
    goto LABEL_31;
  }
LABEL_30:
  v50 = 0;
  if ((*(_WORD *)&v9 & 0x4000) != 0)
  {
LABEL_22:
    v49 = 2654435761 * self->_acceptedCyclingWorkout;
    if ((*(_DWORD *)&v9 & 0x40000) != 0)
      goto LABEL_23;
    goto LABEL_32;
  }
LABEL_31:
  v49 = 0;
  if ((*(_DWORD *)&v9 & 0x40000) != 0)
  {
LABEL_23:
    v48 = 2654435761 * self->_batteryDied;
    if ((*(_DWORD *)&v9 & 0x80000) != 0)
      goto LABEL_24;
LABEL_33:
    v47 = 0;
    if ((*(_DWORD *)&v9 & 0x8000000) != 0)
      goto LABEL_25;
    goto LABEL_34;
  }
LABEL_32:
  v48 = 0;
  if ((*(_DWORD *)&v9 & 0x80000) == 0)
    goto LABEL_33;
LABEL_24:
  v47 = 2654435761 * self->_chargingStopAdded;
  if ((*(_DWORD *)&v9 & 0x8000000) != 0)
  {
LABEL_25:
    v46 = 2654435761 * self->_isSiriEngaged;
    goto LABEL_35;
  }
LABEL_34:
  v46 = 0;
LABEL_35:
  v45 = -[GEOLatLng hash](self->_tripOrigin, "hash");
  v10 = self->_flags;
  if ((*(_DWORD *)&v10 & 0x100000) != 0)
  {
    v44 = 2654435761 * self->_isBadEvExperience;
    if ((*(_DWORD *)&v10 & 0x1000000) != 0)
    {
LABEL_37:
      v43 = 2654435761 * self->_isEvSampleTrip;
      if ((*(_WORD *)&v10 & 0x400) != 0)
        goto LABEL_38;
      goto LABEL_44;
    }
  }
  else
  {
    v44 = 0;
    if ((*(_DWORD *)&v10 & 0x1000000) != 0)
      goto LABEL_37;
  }
  v43 = 0;
  if ((*(_WORD *)&v10 & 0x400) != 0)
  {
LABEL_38:
    v42 = 2654435761 * self->_stateOfChargeAtOrigin;
    if ((*(_WORD *)&v10 & 0x200) != 0)
      goto LABEL_39;
    goto LABEL_45;
  }
LABEL_44:
  v42 = 0;
  if ((*(_WORD *)&v10 & 0x200) != 0)
  {
LABEL_39:
    v41 = 2654435761 * self->_stateOfChargeAtDestPredicted;
    if ((*(_WORD *)&v10 & 0x100) != 0)
      goto LABEL_40;
LABEL_46:
    v40 = 0;
    if ((*(_WORD *)&v10 & 0x800) != 0)
      goto LABEL_41;
    goto LABEL_47;
  }
LABEL_45:
  v41 = 0;
  if ((*(_WORD *)&v10 & 0x100) == 0)
    goto LABEL_46;
LABEL_40:
  v40 = 2654435761 * self->_stateOfChargeAtDestActual;
  if ((*(_WORD *)&v10 & 0x800) != 0)
  {
LABEL_41:
    v39 = 2654435761 * self->_stateOfChargeDiffAtDest;
    goto LABEL_48;
  }
LABEL_47:
  v39 = 0;
LABEL_48:
  v38 = -[NSMutableArray hash](self->_waypoints, "hash");
  v37 = -[NSString hash](self->_evConsumptionModel, "hash");
  v36 = -[NSString hash](self->_evChargingMode, "hash");
  v11 = self->_flags;
  if ((*(_BYTE *)&v11 & 0x10) != 0)
  {
    v35 = 2654435761 * self->_activeNavMode;
    if ((*(_DWORD *)&v11 & 0x10000) != 0)
    {
LABEL_50:
      v34 = 2654435761 * self->_arWalkingUsedInRoutePlanning;
      if ((*(_WORD *)&v11 & 0x8000) != 0)
        goto LABEL_51;
      goto LABEL_65;
    }
  }
  else
  {
    v35 = 0;
    if ((*(_DWORD *)&v11 & 0x10000) != 0)
      goto LABEL_50;
  }
  v34 = 0;
  if ((*(_WORD *)&v11 & 0x8000) != 0)
  {
LABEL_51:
    v33 = 2654435761 * self->_arWalkingUsedInNavigation;
    if ((*(_WORD *)&v11 & 0x1000) != 0)
      goto LABEL_52;
    goto LABEL_66;
  }
LABEL_65:
  v33 = 0;
  if ((*(_WORD *)&v11 & 0x1000) != 0)
  {
LABEL_52:
    v32 = 2654435761 * self->_voiceGuidanceLevel;
    if ((*(_WORD *)&v11 & 0x2000) != 0)
      goto LABEL_53;
    goto LABEL_67;
  }
LABEL_66:
  v32 = 0;
  if ((*(_WORD *)&v11 & 0x2000) != 0)
  {
LABEL_53:
    v31 = 2654435761 * self->_hFPEnabled;
    if ((*(_DWORD *)&v11 & 0x2000000) != 0)
      goto LABEL_54;
    goto LABEL_68;
  }
LABEL_67:
  v31 = 0;
  if ((*(_DWORD *)&v11 & 0x2000000) != 0)
  {
LABEL_54:
    v30 = 2654435761 * self->_isInParkingMode;
    if ((*(_DWORD *)&v11 & 0x20000000) != 0)
      goto LABEL_55;
    goto LABEL_69;
  }
LABEL_68:
  v30 = 0;
  if ((*(_DWORD *)&v11 & 0x20000000) != 0)
  {
LABEL_55:
    v29 = 2654435761 * self->_isSuggestToWalkingTriggered;
    if ((*(_DWORD *)&v11 & 0x80000000) != 0)
      goto LABEL_56;
    goto LABEL_70;
  }
LABEL_69:
  v29 = 0;
  if ((*(_DWORD *)&v11 & 0x80000000) != 0)
  {
LABEL_56:
    v28 = 2654435761 * self->_isTransitedToWalking;
    if ((*(_DWORD *)&v11 & 0x10000000) != 0)
      goto LABEL_57;
    goto LABEL_71;
  }
LABEL_70:
  v28 = 0;
  if ((*(_DWORD *)&v11 & 0x10000000) != 0)
  {
LABEL_57:
    v12 = 2654435761 * self->_isSuggestToFindmyTriggered;
    if ((*(_DWORD *)&v11 & 0x40000000) != 0)
      goto LABEL_58;
    goto LABEL_72;
  }
LABEL_71:
  v12 = 0;
  if ((*(_DWORD *)&v11 & 0x40000000) != 0)
  {
LABEL_58:
    v13 = 2654435761 * self->_isTransitedToFindmy;
    if ((*(_DWORD *)&v11 & 0x800000) != 0)
      goto LABEL_59;
    goto LABEL_73;
  }
LABEL_72:
  v13 = 0;
  if ((*(_DWORD *)&v11 & 0x800000) != 0)
  {
LABEL_59:
    v14 = 2654435761 * self->_isEndRouteTermination;
    if ((*(_DWORD *)&v11 & 0x4000000) != 0)
      goto LABEL_60;
    goto LABEL_74;
  }
LABEL_73:
  v14 = 0;
  if ((*(_DWORD *)&v11 & 0x4000000) != 0)
  {
LABEL_60:
    v15 = 2654435761 * self->_isParkedCarTermination;
    if ((*(_QWORD *)&v11 & 0x200000000) != 0)
      goto LABEL_61;
LABEL_75:
    v16 = 0;
    if ((*(_QWORD *)&v11 & 0x100000000) != 0)
      goto LABEL_62;
    goto LABEL_76;
  }
LABEL_74:
  v15 = 0;
  if ((*(_QWORD *)&v11 & 0x200000000) == 0)
    goto LABEL_75;
LABEL_61:
  v16 = 2654435761 * self->_isTransitionToWalkingTermination;
  if ((*(_QWORD *)&v11 & 0x100000000) != 0)
  {
LABEL_62:
    v17 = 2654435761 * self->_isTransitionToFindmyTermination;
    goto LABEL_77;
  }
LABEL_76:
  v17 = 0;
LABEL_77:
  v18 = -[GEOLocation hash](self->_parkingDetectionLocation, "hash");
  v19 = self->_flags;
  if ((*(_BYTE *)&v19 & 8) != 0)
  {
    timeBetweenParkedAndArrival = self->_timeBetweenParkedAndArrival;
    v22 = -timeBetweenParkedAndArrival;
    if (timeBetweenParkedAndArrival >= 0.0)
      v22 = self->_timeBetweenParkedAndArrival;
    v23 = floor(v22 + 0.5);
    v24 = (v22 - v23) * 1.84467441e19;
    v20 = 2654435761u * (unint64_t)fmod(v23, 1.84467441e19);
    if (v24 >= 0.0)
    {
      if (v24 > 0.0)
        v20 += (unint64_t)v24;
    }
    else
    {
      v20 -= (unint64_t)fabs(v24);
    }
  }
  else
  {
    v20 = 0;
  }
  if ((*(_BYTE *)&v19 & 0x20) != 0)
  {
    v25 = 2654435761 * self->_arrivedAtDestinationCount;
    if ((*(_BYTE *)&v19 & 0x40) != 0)
      goto LABEL_87;
LABEL_89:
    v26 = 0;
    return v60 ^ v61 ^ v59 ^ v58 ^ v57 ^ v56 ^ v55 ^ v54 ^ v53 ^ v52 ^ v51 ^ v50 ^ v49 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v20 ^ v25 ^ v26 ^ -[GEOLocation hash](self->_arrivalLocation, "hash");
  }
  v25 = 0;
  if ((*(_BYTE *)&v19 & 0x40) == 0)
    goto LABEL_89;
LABEL_87:
  v26 = 2654435761 * self->_inParkingModeCount;
  return v60 ^ v61 ^ v59 ^ v58 ^ v57 ^ v56 ^ v55 ^ v54 ^ v53 ^ v52 ^ v51 ^ v50 ^ v49 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v20 ^ v25 ^ v26 ^ -[GEOLocation hash](self->_arrivalLocation, "hash");
}

- (void)mergeFrom:(id)a3
{
  char *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  GEOLocation *finalLocation;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  uint64_t v18;
  GEOLatLng *tripOrigin;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t k;
  uint64_t v29;
  GEOLocation *parkingDetectionLocation;
  uint64_t v31;
  uint64_t v32;
  GEOLocation *arrivalLocation;
  uint64_t v34;
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
  v4 = (char *)a3;
  objc_msgSend(v4, "readAll:", 0);
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v5 = *((id *)v4 + 11);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v44;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v44 != v8)
          objc_enumerationMutation(v5);
        -[GEOLogMsgEventDirections addDirectionsFeedback:](self, "addDirectionsFeedback:", *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
    }
    while (v7);
  }

  finalLocation = self->_finalLocation;
  v11 = *((_QWORD *)v4 + 16);
  if (finalLocation)
  {
    if (v11)
      -[GEOLocation mergeFrom:](finalLocation, "mergeFrom:");
  }
  else if (v11)
  {
    -[GEOLogMsgEventDirections setFinalLocation:](self, "setFinalLocation:");
  }
  v12 = *((_QWORD *)v4 + 30);
  if ((v12 & 0x20000) != 0)
  {
    self->_arrivedAtDestination = v4[220];
    *(_QWORD *)&self->_flags |= 0x20000uLL;
    v12 = *((_QWORD *)v4 + 30);
    if ((v12 & 1) == 0)
    {
LABEL_15:
      if ((v12 & 4) == 0)
        goto LABEL_16;
      goto LABEL_40;
    }
  }
  else if ((v12 & 1) == 0)
  {
    goto LABEL_15;
  }
  v21 = *(_OWORD *)(v4 + 44);
  v22 = *((_OWORD *)v4 + 2);
  *(_OWORD *)&self->_navigationAudioFeedback._bTHFPAvailableAtEndOfNav = *((_OWORD *)v4 + 1);
  *(_OWORD *)&self->_navigationAudioFeedback._manuallyChangedRouteCount = v22;
  *(_OWORD *)&self->_navigationAudioFeedback._pauseSpokenAudioEnabled = v21;
  *(_QWORD *)&self->_flags |= 1uLL;
  v12 = *((_QWORD *)v4 + 30);
  if ((v12 & 4) == 0)
  {
LABEL_16:
    if ((v12 & 2) == 0)
      goto LABEL_18;
    goto LABEL_17;
  }
LABEL_40:
  self->_durationOfTrip = *((double *)v4 + 13);
  *(_QWORD *)&self->_flags |= 4uLL;
  if ((*((_QWORD *)v4 + 30) & 2) != 0)
  {
LABEL_17:
    self->_navSessionId = (GEOSessionID)*((_OWORD *)v4 + 4);
    *(_QWORD *)&self->_flags |= 2uLL;
  }
LABEL_18:
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v13 = *((id *)v4 + 12);
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v40;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v40 != v16)
          objc_enumerationMutation(v13);
        -[GEOLogMsgEventDirections addDurationInNavigationMode:](self, "addDurationInNavigationMode:", *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * j));
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
    }
    while (v15);
  }

  v18 = *((_QWORD *)v4 + 30);
  if ((v18 & 0x80) != 0)
  {
    self->_originalEta = *((_DWORD *)v4 + 48);
    *(_QWORD *)&self->_flags |= 0x80uLL;
    v18 = *((_QWORD *)v4 + 30);
    if ((v18 & 0x800000000) == 0)
    {
LABEL_27:
      if ((v18 & 0x400000) == 0)
        goto LABEL_28;
      goto LABEL_44;
    }
  }
  else if ((v18 & 0x800000000) == 0)
  {
    goto LABEL_27;
  }
  self->_preArrival = v4[238];
  *(_QWORD *)&self->_flags |= 0x800000000uLL;
  v18 = *((_QWORD *)v4 + 30);
  if ((v18 & 0x400000) == 0)
  {
LABEL_28:
    if ((v18 & 0x200000) == 0)
      goto LABEL_29;
    goto LABEL_45;
  }
LABEL_44:
  self->_isCyclingNlgAvailable = v4[225];
  *(_QWORD *)&self->_flags |= 0x400000uLL;
  v18 = *((_QWORD *)v4 + 30);
  if ((v18 & 0x200000) == 0)
  {
LABEL_29:
    if ((v18 & 0x400000000) == 0)
      goto LABEL_30;
    goto LABEL_46;
  }
LABEL_45:
  self->_isCoarseLocationUsed = v4[224];
  *(_QWORD *)&self->_flags |= 0x200000uLL;
  v18 = *((_QWORD *)v4 + 30);
  if ((v18 & 0x400000000) == 0)
  {
LABEL_30:
    if ((v18 & 0x4000) == 0)
      goto LABEL_31;
    goto LABEL_47;
  }
LABEL_46:
  self->_isVlfImprovementUsed = v4[237];
  *(_QWORD *)&self->_flags |= 0x400000000uLL;
  v18 = *((_QWORD *)v4 + 30);
  if ((v18 & 0x4000) == 0)
  {
LABEL_31:
    if ((v18 & 0x40000) == 0)
      goto LABEL_32;
    goto LABEL_48;
  }
LABEL_47:
  self->_acceptedCyclingWorkout = v4[217];
  *(_QWORD *)&self->_flags |= 0x4000uLL;
  v18 = *((_QWORD *)v4 + 30);
  if ((v18 & 0x40000) == 0)
  {
LABEL_32:
    if ((v18 & 0x80000) == 0)
      goto LABEL_33;
    goto LABEL_49;
  }
LABEL_48:
  self->_batteryDied = v4[221];
  *(_QWORD *)&self->_flags |= 0x40000uLL;
  v18 = *((_QWORD *)v4 + 30);
  if ((v18 & 0x80000) == 0)
  {
LABEL_33:
    if ((v18 & 0x8000000) == 0)
      goto LABEL_35;
    goto LABEL_34;
  }
LABEL_49:
  self->_chargingStopAdded = v4[222];
  *(_QWORD *)&self->_flags |= 0x80000uLL;
  if ((*((_QWORD *)v4 + 30) & 0x8000000) != 0)
  {
LABEL_34:
    self->_isSiriEngaged = v4[230];
    *(_QWORD *)&self->_flags |= 0x8000000uLL;
  }
LABEL_35:
  tripOrigin = self->_tripOrigin;
  v20 = *((_QWORD *)v4 + 19);
  if (tripOrigin)
  {
    if (v20)
      -[GEOLatLng mergeFrom:](tripOrigin, "mergeFrom:");
  }
  else if (v20)
  {
    -[GEOLogMsgEventDirections setTripOrigin:](self, "setTripOrigin:");
  }
  v23 = *((_QWORD *)v4 + 30);
  if ((v23 & 0x100000) != 0)
  {
    self->_isBadEvExperience = v4[223];
    *(_QWORD *)&self->_flags |= 0x100000uLL;
    v23 = *((_QWORD *)v4 + 30);
    if ((v23 & 0x1000000) == 0)
    {
LABEL_55:
      if ((v23 & 0x400) == 0)
        goto LABEL_56;
      goto LABEL_91;
    }
  }
  else if ((v23 & 0x1000000) == 0)
  {
    goto LABEL_55;
  }
  self->_isEvSampleTrip = v4[227];
  *(_QWORD *)&self->_flags |= 0x1000000uLL;
  v23 = *((_QWORD *)v4 + 30);
  if ((v23 & 0x400) == 0)
  {
LABEL_56:
    if ((v23 & 0x200) == 0)
      goto LABEL_57;
    goto LABEL_92;
  }
LABEL_91:
  self->_stateOfChargeAtOrigin = *((_DWORD *)v4 + 51);
  *(_QWORD *)&self->_flags |= 0x400uLL;
  v23 = *((_QWORD *)v4 + 30);
  if ((v23 & 0x200) == 0)
  {
LABEL_57:
    if ((v23 & 0x100) == 0)
      goto LABEL_58;
    goto LABEL_93;
  }
LABEL_92:
  self->_stateOfChargeAtDestPredicted = *((_DWORD *)v4 + 50);
  *(_QWORD *)&self->_flags |= 0x200uLL;
  v23 = *((_QWORD *)v4 + 30);
  if ((v23 & 0x100) == 0)
  {
LABEL_58:
    if ((v23 & 0x800) == 0)
      goto LABEL_60;
    goto LABEL_59;
  }
LABEL_93:
  self->_stateOfChargeAtDestActual = *((_DWORD *)v4 + 49);
  *(_QWORD *)&self->_flags |= 0x100uLL;
  if ((*((_QWORD *)v4 + 30) & 0x800) != 0)
  {
LABEL_59:
    self->_stateOfChargeDiffAtDest = *((_DWORD *)v4 + 52);
    *(_QWORD *)&self->_flags |= 0x800uLL;
  }
LABEL_60:
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v24 = *((id *)v4 + 20);
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v36;
    do
    {
      for (k = 0; k != v26; ++k)
      {
        if (*(_QWORD *)v36 != v27)
          objc_enumerationMutation(v24);
        -[GEOLogMsgEventDirections addWaypoints:](self, "addWaypoints:", *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * k), (_QWORD)v35);
      }
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
    }
    while (v26);
  }

  if (*((_QWORD *)v4 + 15))
    -[GEOLogMsgEventDirections setEvConsumptionModel:](self, "setEvConsumptionModel:");
  if (*((_QWORD *)v4 + 14))
    -[GEOLogMsgEventDirections setEvChargingMode:](self, "setEvChargingMode:");
  v29 = *((_QWORD *)v4 + 30);
  if ((v29 & 0x10) != 0)
  {
    self->_activeNavMode = *((_DWORD *)v4 + 45);
    *(_QWORD *)&self->_flags |= 0x10uLL;
    v29 = *((_QWORD *)v4 + 30);
    if ((v29 & 0x10000) == 0)
    {
LABEL_73:
      if ((v29 & 0x8000) == 0)
        goto LABEL_74;
      goto LABEL_97;
    }
  }
  else if ((v29 & 0x10000) == 0)
  {
    goto LABEL_73;
  }
  self->_arWalkingUsedInRoutePlanning = v4[219];
  *(_QWORD *)&self->_flags |= 0x10000uLL;
  v29 = *((_QWORD *)v4 + 30);
  if ((v29 & 0x8000) == 0)
  {
LABEL_74:
    if ((v29 & 0x1000) == 0)
      goto LABEL_75;
    goto LABEL_98;
  }
LABEL_97:
  self->_arWalkingUsedInNavigation = v4[218];
  *(_QWORD *)&self->_flags |= 0x8000uLL;
  v29 = *((_QWORD *)v4 + 30);
  if ((v29 & 0x1000) == 0)
  {
LABEL_75:
    if ((v29 & 0x2000) == 0)
      goto LABEL_76;
    goto LABEL_99;
  }
LABEL_98:
  self->_voiceGuidanceLevel = *((_DWORD *)v4 + 53);
  *(_QWORD *)&self->_flags |= 0x1000uLL;
  v29 = *((_QWORD *)v4 + 30);
  if ((v29 & 0x2000) == 0)
  {
LABEL_76:
    if ((v29 & 0x2000000) == 0)
      goto LABEL_77;
    goto LABEL_100;
  }
LABEL_99:
  self->_hFPEnabled = v4[216];
  *(_QWORD *)&self->_flags |= 0x2000uLL;
  v29 = *((_QWORD *)v4 + 30);
  if ((v29 & 0x2000000) == 0)
  {
LABEL_77:
    if ((v29 & 0x20000000) == 0)
      goto LABEL_78;
    goto LABEL_101;
  }
LABEL_100:
  self->_isInParkingMode = v4[228];
  *(_QWORD *)&self->_flags |= 0x2000000uLL;
  v29 = *((_QWORD *)v4 + 30);
  if ((v29 & 0x20000000) == 0)
  {
LABEL_78:
    if ((v29 & 0x80000000) == 0)
      goto LABEL_79;
    goto LABEL_102;
  }
LABEL_101:
  self->_isSuggestToWalkingTriggered = v4[232];
  *(_QWORD *)&self->_flags |= 0x20000000uLL;
  v29 = *((_QWORD *)v4 + 30);
  if ((v29 & 0x80000000) == 0)
  {
LABEL_79:
    if ((v29 & 0x10000000) == 0)
      goto LABEL_80;
    goto LABEL_103;
  }
LABEL_102:
  self->_isTransitedToWalking = v4[234];
  *(_QWORD *)&self->_flags |= 0x80000000uLL;
  v29 = *((_QWORD *)v4 + 30);
  if ((v29 & 0x10000000) == 0)
  {
LABEL_80:
    if ((v29 & 0x40000000) == 0)
      goto LABEL_81;
    goto LABEL_104;
  }
LABEL_103:
  self->_isSuggestToFindmyTriggered = v4[231];
  *(_QWORD *)&self->_flags |= 0x10000000uLL;
  v29 = *((_QWORD *)v4 + 30);
  if ((v29 & 0x40000000) == 0)
  {
LABEL_81:
    if ((v29 & 0x800000) == 0)
      goto LABEL_82;
    goto LABEL_105;
  }
LABEL_104:
  self->_isTransitedToFindmy = v4[233];
  *(_QWORD *)&self->_flags |= 0x40000000uLL;
  v29 = *((_QWORD *)v4 + 30);
  if ((v29 & 0x800000) == 0)
  {
LABEL_82:
    if ((v29 & 0x4000000) == 0)
      goto LABEL_83;
    goto LABEL_106;
  }
LABEL_105:
  self->_isEndRouteTermination = v4[226];
  *(_QWORD *)&self->_flags |= 0x800000uLL;
  v29 = *((_QWORD *)v4 + 30);
  if ((v29 & 0x4000000) == 0)
  {
LABEL_83:
    if ((v29 & 0x200000000) == 0)
      goto LABEL_84;
    goto LABEL_107;
  }
LABEL_106:
  self->_isParkedCarTermination = v4[229];
  *(_QWORD *)&self->_flags |= 0x4000000uLL;
  v29 = *((_QWORD *)v4 + 30);
  if ((v29 & 0x200000000) == 0)
  {
LABEL_84:
    if ((v29 & 0x100000000) == 0)
      goto LABEL_86;
    goto LABEL_85;
  }
LABEL_107:
  self->_isTransitionToWalkingTermination = v4[236];
  *(_QWORD *)&self->_flags |= 0x200000000uLL;
  if ((*((_QWORD *)v4 + 30) & 0x100000000) != 0)
  {
LABEL_85:
    self->_isTransitionToFindmyTermination = v4[235];
    *(_QWORD *)&self->_flags |= 0x100000000uLL;
  }
LABEL_86:
  parkingDetectionLocation = self->_parkingDetectionLocation;
  v31 = *((_QWORD *)v4 + 17);
  if (parkingDetectionLocation)
  {
    if (v31)
      -[GEOLocation mergeFrom:](parkingDetectionLocation, "mergeFrom:");
  }
  else if (v31)
  {
    -[GEOLogMsgEventDirections setParkingDetectionLocation:](self, "setParkingDetectionLocation:");
  }
  v32 = *((_QWORD *)v4 + 30);
  if ((v32 & 8) != 0)
  {
    self->_timeBetweenParkedAndArrival = *((double *)v4 + 18);
    *(_QWORD *)&self->_flags |= 8uLL;
    v32 = *((_QWORD *)v4 + 30);
    if ((v32 & 0x20) == 0)
    {
LABEL_113:
      if ((v32 & 0x40) == 0)
        goto LABEL_115;
      goto LABEL_114;
    }
  }
  else if ((v32 & 0x20) == 0)
  {
    goto LABEL_113;
  }
  self->_arrivedAtDestinationCount = *((_DWORD *)v4 + 46);
  *(_QWORD *)&self->_flags |= 0x20uLL;
  if ((*((_QWORD *)v4 + 30) & 0x40) != 0)
  {
LABEL_114:
    self->_inParkingModeCount = *((_DWORD *)v4 + 47);
    *(_QWORD *)&self->_flags |= 0x40uLL;
  }
LABEL_115:
  arrivalLocation = self->_arrivalLocation;
  v34 = *((_QWORD *)v4 + 10);
  if (arrivalLocation)
  {
    if (v34)
      -[GEOLocation mergeFrom:](arrivalLocation, "mergeFrom:");
  }
  else if (v34)
  {
    -[GEOLogMsgEventDirections setArrivalLocation:](self, "setArrivalLocation:");
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_waypoints, 0);
  objc_storeStrong((id *)&self->_tripOrigin, 0);
  objc_storeStrong((id *)&self->_parkingDetectionLocation, 0);
  objc_storeStrong((id *)&self->_finalLocation, 0);
  objc_storeStrong((id *)&self->_evConsumptionModel, 0);
  objc_storeStrong((id *)&self->_evChargingMode, 0);
  objc_storeStrong((id *)&self->_durationInNavigationModes, 0);
  objc_storeStrong((id *)&self->_directionsFeedbacks, 0);
  objc_storeStrong((id *)&self->_arrivalLocation, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
