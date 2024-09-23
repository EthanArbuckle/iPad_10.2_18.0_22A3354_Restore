@implementation GEOCompanionRouteStatus

- (GEOCompanionRouteStatus)init
{
  GEOCompanionRouteStatus *v2;
  GEOCompanionRouteStatus *v3;
  GEOCompanionRouteStatus *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOCompanionRouteStatus;
  v2 = -[GEOCompanionRouteStatus init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOCompanionRouteStatus)initWithData:(id)a3
{
  GEOCompanionRouteStatus *v3;
  GEOCompanionRouteStatus *v4;
  GEOCompanionRouteStatus *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOCompanionRouteStatus;
  v3 = -[GEOCompanionRouteStatus initWithData:](&v7, sel_initWithData_, a3);
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
  v3.receiver = self;
  v3.super_class = (Class)GEOCompanionRouteStatus;
  -[GEOCompanionRouteStatus dealloc](&v3, sel_dealloc);
}

- (int)feedbackType
{
  os_unfair_lock_s *p_readerLock;
  $AD490B0E691E6F105FFA9F0D440E4C82 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_BYTE *)&flags & 0x20) != 0)
    return self->_feedbackType;
  else
    return 0;
}

- (void)setFeedbackType:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x100020u;
  self->_feedbackType = a3;
}

- (void)setHasFeedbackType:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1048608;
  else
    v3 = 0x100000;
  self->_flags = ($AD490B0E691E6F105FFA9F0D440E4C82)(*(_DWORD *)&self->_flags & 0xFFFFFFDF | v3);
}

- (BOOL)hasFeedbackType
{
  return (*(_BYTE *)&self->_flags >> 5) & 1;
}

- (id)feedbackTypeAsString:(int)a3
{
  if (a3 < 0xB)
    return off_1E1C07110[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsFeedbackType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NOT_NAVIGATING")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PREVIEW")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PROCEED_TO_ROUTE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ANNOUNCE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CONTINUE")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PREPARE")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PRE_EXECUTE")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EXECUTE")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RECALCULATING")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LOST_LOCATION")) & 1) != 0)
  {
    v4 = 6;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("ARRIVED")))
  {
    v4 = 7;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (unsigned)stepID
{
  return self->_stepID;
}

- (void)setStepID:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x100400u;
  self->_stepID = a3;
}

- (void)setHasStepID:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1049600;
  else
    v3 = 0x100000;
  self->_flags = ($AD490B0E691E6F105FFA9F0D440E4C82)(*(_DWORD *)&self->_flags & 0xFFFFFBFF | v3);
}

- (BOOL)hasStepID
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 2) & 1;
}

- (unsigned)distanceToManeuver
{
  return self->_distanceToManeuver;
}

- (void)setDistanceToManeuver:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x100008u;
  self->_distanceToManeuver = a3;
}

- (void)setHasDistanceToManeuver:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1048584;
  else
    v3 = 0x100000;
  self->_flags = ($AD490B0E691E6F105FFA9F0D440E4C82)(*(_DWORD *)&self->_flags & 0xFFFFFFF7 | v3);
}

- (BOOL)hasDistanceToManeuver
{
  return (*(_BYTE *)&self->_flags >> 3) & 1;
}

- (unsigned)distanceToRoute
{
  return self->_distanceToRoute;
}

- (void)setDistanceToRoute:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x100010u;
  self->_distanceToRoute = a3;
}

- (void)setHasDistanceToRoute:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1048592;
  else
    v3 = 0x100000;
  self->_flags = ($AD490B0E691E6F105FFA9F0D440E4C82)(*(_DWORD *)&self->_flags & 0xFFEFFFEF | v3);
}

- (BOOL)hasDistanceToRoute
{
  return (*(_BYTE *)&self->_flags >> 4) & 1;
}

- (unsigned)distanceRemainingOnRoute
{
  return self->_distanceRemainingOnRoute;
}

- (void)setDistanceRemainingOnRoute:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x100004u;
  self->_distanceRemainingOnRoute = a3;
}

- (void)setHasDistanceRemainingOnRoute:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1048580;
  else
    v3 = 0x100000;
  self->_flags = ($AD490B0E691E6F105FFA9F0D440E4C82)(*(_DWORD *)&self->_flags & 0xFFFFFFFB | v3);
}

- (BOOL)hasDistanceRemainingOnRoute
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (unsigned)remainingTime
{
  return self->_remainingTime;
}

- (void)setRemainingTime:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x100080u;
  self->_remainingTime = a3;
}

- (void)setHasRemainingTime:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1048704;
  else
    v3 = 0x100000;
  self->_flags = ($AD490B0E691E6F105FFA9F0D440E4C82)(*(_DWORD *)&self->_flags & 0xFFFFFF7F | v3);
}

- (BOOL)hasRemainingTime
{
  return *(_BYTE *)&self->_flags >> 7;
}

- (void)_readLocation
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_BYTE *)(a1 + 138) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOCompanionRouteStatusReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLocation_tags_2);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (BOOL)hasLocation
{
  -[GEOCompanionRouteStatus _readLocation]((uint64_t)self);
  return self->_location != 0;
}

- (GEOLocation)location
{
  -[GEOCompanionRouteStatus _readLocation]((uint64_t)self);
  return self->_location;
}

- (void)setLocation:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x120000u;
  objc_storeStrong((id *)&self->_location, a3);
}

- (unsigned)routeLocationIndex
{
  return self->_routeLocationIndex;
}

- (void)setRouteLocationIndex:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x100100u;
  self->_routeLocationIndex = a3;
}

- (void)setHasRouteLocationIndex:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1048832;
  else
    v3 = 0x100000;
  self->_flags = ($AD490B0E691E6F105FFA9F0D440E4C82)(*(_DWORD *)&self->_flags & 0xFFFFFEFF | v3);
}

- (BOOL)hasRouteLocationIndex
{
  return *((_BYTE *)&self->_flags + 1) & 1;
}

- (float)routeLocationOffset
{
  return self->_routeLocationOffset;
}

- (void)setRouteLocationOffset:(float)a3
{
  *(_DWORD *)&self->_flags |= 0x100200u;
  self->_routeLocationOffset = a3;
}

- (void)setHasRouteLocationOffset:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1049088;
  else
    v3 = 0x100000;
  self->_flags = ($AD490B0E691E6F105FFA9F0D440E4C82)(*(_DWORD *)&self->_flags & 0xFFFFFDFF | v3);
}

- (BOOL)hasRouteLocationOffset
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 1) & 1;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  *(_DWORD *)&self->_flags |= 0x100001u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  self->_flags = ($AD490B0E691E6F105FFA9F0D440E4C82)(*(_DWORD *)&self->_flags & 0xFFFFFFFE | a3 | 0x100000);
}

- (BOOL)hasTimestamp
{
  return *(_DWORD *)&self->_flags & 1;
}

- (void)_readRouteMatchCoordinate
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_BYTE *)(a1 + 138) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOCompanionRouteStatusReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRouteMatchCoordinate_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (BOOL)hasRouteMatchCoordinate
{
  -[GEOCompanionRouteStatus _readRouteMatchCoordinate]((uint64_t)self);
  return self->_routeMatchCoordinate != 0;
}

- (GEOLatLng)routeMatchCoordinate
{
  -[GEOCompanionRouteStatus _readRouteMatchCoordinate]((uint64_t)self);
  return self->_routeMatchCoordinate;
}

- (void)setRouteMatchCoordinate:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x180000u;
  objc_storeStrong((id *)&self->_routeMatchCoordinate, a3);
}

- (void)_readRouteID
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_BYTE *)(a1 + 138) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOCompanionRouteStatusReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRouteID_tags_628);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (BOOL)hasRouteID
{
  -[GEOCompanionRouteStatus _readRouteID]((uint64_t)self);
  return self->_routeID != 0;
}

- (NSData)routeID
{
  -[GEOCompanionRouteStatus _readRouteID]((uint64_t)self);
  return self->_routeID;
}

- (void)setRouteID:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x140000u;
  objc_storeStrong((id *)&self->_routeID, a3);
}

- (BOOL)guidancePromptsEnabled
{
  return self->_guidancePromptsEnabled;
}

- (void)setGuidancePromptsEnabled:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x100800u;
  self->_guidancePromptsEnabled = a3;
}

- (void)setHasGuidancePromptsEnabled:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1050624;
  else
    v3 = 0x100000;
  self->_flags = ($AD490B0E691E6F105FFA9F0D440E4C82)(*(_DWORD *)&self->_flags & 0xFFFFF7FF | v3);
}

- (BOOL)hasGuidancePromptsEnabled
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 3) & 1;
}

- (void)_readSelectedRideIndexs
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_BYTE *)(a1 + 137) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOCompanionRouteStatusReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSelectedRideIndexs_tags_629);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (unint64_t)selectedRideIndexsCount
{
  -[GEOCompanionRouteStatus _readSelectedRideIndexs]((uint64_t)self);
  return self->_selectedRideIndexs.count;
}

- (unsigned)selectedRideIndexs
{
  -[GEOCompanionRouteStatus _readSelectedRideIndexs]((uint64_t)self);
  return self->_selectedRideIndexs.list;
}

- (void)clearSelectedRideIndexs
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x8000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x100000u;
  PBRepeatedUInt32Clear();
}

- (void)addSelectedRideIndex:(unsigned int)a3
{
  -[GEOCompanionRouteStatus _readSelectedRideIndexs]((uint64_t)self);
  if (self)
    PBRepeatedUInt32Add();
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x8000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x100000u;
}

- (unsigned)selectedRideIndexAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_selectedRideIndexs;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEOCompanionRouteStatus _readSelectedRideIndexs]((uint64_t)self);
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
  *(_DWORD *)&self->_flags |= 0x8000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x100000u;
  PBRepeatedUInt32Set();
}

- (BOOL)lowGuidanceNavigation
{
  return self->_lowGuidanceNavigation;
}

- (void)setLowGuidanceNavigation:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x104000u;
  self->_lowGuidanceNavigation = a3;
}

- (void)setHasLowGuidanceNavigation:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1064960;
  else
    v3 = 0x100000;
  self->_flags = ($AD490B0E691E6F105FFA9F0D440E4C82)(*(_DWORD *)&self->_flags & 0xFFFFBFFF | v3);
}

- (BOOL)hasLowGuidanceNavigation
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 6) & 1;
}

- (int)hapticsType
{
  os_unfair_lock_s *p_readerLock;
  $AD490B0E691E6F105FFA9F0D440E4C82 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_BYTE *)&flags & 0x40) != 0)
    return self->_hapticsType;
  else
    return 0;
}

- (void)setHapticsType:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x100040u;
  self->_hapticsType = a3;
}

- (void)setHasHapticsType:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1048640;
  else
    v3 = 0x100000;
  self->_flags = ($AD490B0E691E6F105FFA9F0D440E4C82)(*(_DWORD *)&self->_flags & 0xFFFFFFBF | v3);
}

- (BOOL)hasHapticsType
{
  return (*(_BYTE *)&self->_flags >> 6) & 1;
}

- (id)hapticsTypeAsString:(int)a3
{
  __CFString *v3;

  v3 = CFSTR("NO_TURN");
  switch(a3)
  {
    case 0:
      return v3;
    case 1:
      v3 = CFSTR("LEFT_TURN");
      return v3;
    case 2:
      return CFSTR("RIGHT_TURN");
    case 3:
      return CFSTR("STRAIGHT_AHEAD");
    case 4:
      return CFSTR("U_TURN");
    case 5:
      return CFSTR("FOLLOW_ROAD");
    case 6:
      return CFSTR("ENTER_ROUNDABOUT");
    case 7:
      return CFSTR("EXIT_ROUNDABOUT");
    case 11:
      return CFSTR("OFF_RAMP");
    case 12:
      return CFSTR("ON_RAMP");
    case 16:
      return CFSTR("ARRIVE_END_OF_NAVIGATION");
    case 17:
      return CFSTR("START_ROUTE");
    case 18:
      return CFSTR("ARRIVE_AT_DESTINATION");
    case 20:
      return CFSTR("KEEP_LEFT");
    case 21:
      return CFSTR("KEEP_RIGHT");
    case 22:
      return CFSTR("ENTER_FERRY");
    case 23:
      return CFSTR("EXIT_FERRY");
    case 24:
      return CFSTR("CHANGE_FERRY");
    case 25:
      return CFSTR("START_ROUTE_WITH_U_TURN");
    case 26:
      return CFSTR("U_TURN_AT_ROUNDABOUT");
    case 27:
      return CFSTR("LEFT_TURN_AT_END");
    case 28:
      return CFSTR("RIGHT_TURN_AT_END");
    case 29:
      return CFSTR("HIGHWAY_OFF_RAMP_LEFT");
    case 30:
      return CFSTR("HIGHWAY_OFF_RAMP_RIGHT");
    case 33:
      return CFSTR("ARRIVE_AT_DESTINATION_LEFT");
    case 34:
      return CFSTR("ARRIVE_AT_DESTINATION_RIGHT");
    case 35:
      return CFSTR("U_TURN_WHEN_POSSIBLE");
    case 39:
      return CFSTR("ARRIVE_END_OF_DIRECTIONS");
    case 41:
      return CFSTR("ROUNDABOUT_EXIT_1");
    case 42:
      return CFSTR("ROUNDABOUT_EXIT_2");
    case 43:
      return CFSTR("ROUNDABOUT_EXIT_3");
    case 44:
      return CFSTR("ROUNDABOUT_EXIT_4");
    case 45:
      return CFSTR("ROUNDABOUT_EXIT_5");
    case 46:
      return CFSTR("ROUNDABOUT_EXIT_6");
    case 47:
      return CFSTR("ROUNDABOUT_EXIT_7");
    case 48:
      return CFSTR("ROUNDABOUT_EXIT_8");
    case 49:
      return CFSTR("ROUNDABOUT_EXIT_9");
    case 50:
      return CFSTR("ROUNDABOUT_EXIT_10");
    case 51:
      return CFSTR("ROUNDABOUT_EXIT_11");
    case 52:
      return CFSTR("ROUNDABOUT_EXIT_12");
    case 53:
      return CFSTR("ROUNDABOUT_EXIT_13");
    case 54:
      return CFSTR("ROUNDABOUT_EXIT_14");
    case 55:
      return CFSTR("ROUNDABOUT_EXIT_15");
    case 56:
      return CFSTR("ROUNDABOUT_EXIT_16");
    case 57:
      return CFSTR("ROUNDABOUT_EXIT_17");
    case 58:
      return CFSTR("ROUNDABOUT_EXIT_18");
    case 59:
      return CFSTR("ROUNDABOUT_EXIT_19");
    case 60:
      return CFSTR("SHARP_LEFT_TURN");
    case 61:
      return CFSTR("SHARP_RIGHT_TURN");
    case 62:
      return CFSTR("SLIGHT_LEFT_TURN");
    case 63:
      return CFSTR("SLIGHT_RIGHT_TURN");
    case 64:
      return CFSTR("CHANGE_HIGHWAY");
    case 65:
      return CFSTR("CHANGE_HIGHWAY_LEFT");
    case 66:
      return CFSTR("CHANGE_HIGHWAY_RIGHT");
    case 80:
      return CFSTR("TOLL_STATION");
    case 81:
      return CFSTR("ENTER_TUNNEL");
    case 82:
      return CFSTR("WAYPOINT_STOP");
    case 83:
      return CFSTR("WAYPOINT_STOP_LEFT");
    case 84:
      return CFSTR("WAYPOINT_STOP_RIGHT");
    case 85:
      return CFSTR("RESUME_ROUTE");
    case 86:
      return CFSTR("RESUME_ROUTE_WITH_U_TURN");
    case 87:
      return CFSTR("CUSTOM");
    case 88:
      return CFSTR("TURN_AROUND");
    default:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
      return v3;
  }
}

- (int)StringAsHapticsType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NO_TURN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LEFT_TURN")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RIGHT_TURN")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("STRAIGHT_AHEAD")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("U_TURN")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FOLLOW_ROAD")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ENTER_ROUNDABOUT")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EXIT_ROUNDABOUT")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("OFF_RAMP")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ON_RAMP")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ARRIVE_END_OF_NAVIGATION")) & 1) != 0)
  {
    v4 = 16;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("START_ROUTE")) & 1) != 0)
  {
    v4 = 17;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ARRIVE_AT_DESTINATION")) & 1) != 0)
  {
    v4 = 18;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KEEP_LEFT")) & 1) != 0)
  {
    v4 = 20;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KEEP_RIGHT")) & 1) != 0)
  {
    v4 = 21;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ENTER_FERRY")) & 1) != 0)
  {
    v4 = 22;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EXIT_FERRY")) & 1) != 0)
  {
    v4 = 23;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CHANGE_FERRY")) & 1) != 0)
  {
    v4 = 24;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("START_ROUTE_WITH_U_TURN")) & 1) != 0)
  {
    v4 = 25;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("U_TURN_AT_ROUNDABOUT")) & 1) != 0)
  {
    v4 = 26;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LEFT_TURN_AT_END")) & 1) != 0)
  {
    v4 = 27;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RIGHT_TURN_AT_END")) & 1) != 0)
  {
    v4 = 28;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HIGHWAY_OFF_RAMP_LEFT")) & 1) != 0)
  {
    v4 = 29;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HIGHWAY_OFF_RAMP_RIGHT")) & 1) != 0)
  {
    v4 = 30;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ARRIVE_AT_DESTINATION_LEFT")) & 1) != 0)
  {
    v4 = 33;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ARRIVE_AT_DESTINATION_RIGHT")) & 1) != 0)
  {
    v4 = 34;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("U_TURN_WHEN_POSSIBLE")) & 1) != 0)
  {
    v4 = 35;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ARRIVE_END_OF_DIRECTIONS")) & 1) != 0)
  {
    v4 = 39;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_1")) & 1) != 0)
  {
    v4 = 41;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_2")) & 1) != 0)
  {
    v4 = 42;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_3")) & 1) != 0)
  {
    v4 = 43;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_4")) & 1) != 0)
  {
    v4 = 44;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_5")) & 1) != 0)
  {
    v4 = 45;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_6")) & 1) != 0)
  {
    v4 = 46;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_7")) & 1) != 0)
  {
    v4 = 47;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_8")) & 1) != 0)
  {
    v4 = 48;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_9")) & 1) != 0)
  {
    v4 = 49;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_10")) & 1) != 0)
  {
    v4 = 50;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_11")) & 1) != 0)
  {
    v4 = 51;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_12")) & 1) != 0)
  {
    v4 = 52;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_13")) & 1) != 0)
  {
    v4 = 53;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_14")) & 1) != 0)
  {
    v4 = 54;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_15")) & 1) != 0)
  {
    v4 = 55;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_16")) & 1) != 0)
  {
    v4 = 56;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_17")) & 1) != 0)
  {
    v4 = 57;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_18")) & 1) != 0)
  {
    v4 = 58;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_19")) & 1) != 0)
  {
    v4 = 59;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SHARP_LEFT_TURN")) & 1) != 0)
  {
    v4 = 60;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SHARP_RIGHT_TURN")) & 1) != 0)
  {
    v4 = 61;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SLIGHT_LEFT_TURN")) & 1) != 0)
  {
    v4 = 62;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SLIGHT_RIGHT_TURN")) & 1) != 0)
  {
    v4 = 63;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CHANGE_HIGHWAY")) & 1) != 0)
  {
    v4 = 64;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CHANGE_HIGHWAY_LEFT")) & 1) != 0)
  {
    v4 = 65;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CHANGE_HIGHWAY_RIGHT")) & 1) != 0)
  {
    v4 = 66;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TOLL_STATION")) & 1) != 0)
  {
    v4 = 80;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ENTER_TUNNEL")) & 1) != 0)
  {
    v4 = 81;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WAYPOINT_STOP")) & 1) != 0)
  {
    v4 = 82;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WAYPOINT_STOP_LEFT")) & 1) != 0)
  {
    v4 = 83;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WAYPOINT_STOP_RIGHT")) & 1) != 0)
  {
    v4 = 84;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RESUME_ROUTE")) & 1) != 0)
  {
    v4 = 85;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RESUME_ROUTE_WITH_U_TURN")) & 1) != 0)
  {
    v4 = 86;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CUSTOM")) & 1) != 0)
  {
    v4 = 87;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("TURN_AROUND")))
  {
    v4 = 88;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)isConnectedToCarplay
{
  return self->_isConnectedToCarplay;
}

- (void)setIsConnectedToCarplay:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x101000u;
  self->_isConnectedToCarplay = a3;
}

- (void)setHasIsConnectedToCarplay:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1052672;
  else
    v3 = 0x100000;
  self->_flags = ($AD490B0E691E6F105FFA9F0D440E4C82)(*(_DWORD *)&self->_flags & 0xFFFFEFFF | v3);
}

- (BOOL)hasIsConnectedToCarplay
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 4) & 1;
}

- (void)_readAlightMessage
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_BYTE *)(a1 + 138) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOCompanionRouteStatusReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAlightMessage_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (BOOL)hasAlightMessage
{
  -[GEOCompanionRouteStatus _readAlightMessage]((uint64_t)self);
  return self->_alightMessage != 0;
}

- (GEOCompanionTransitAlightMessage)alightMessage
{
  -[GEOCompanionRouteStatus _readAlightMessage]((uint64_t)self);
  return self->_alightMessage;
}

- (void)setAlightMessage:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x110000u;
  objc_storeStrong((id *)&self->_alightMessage, a3);
}

- (BOOL)isOffline
{
  return self->_isOffline;
}

- (void)setIsOffline:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x102000u;
  self->_isOffline = a3;
}

- (void)setHasIsOffline:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1056768;
  else
    v3 = 0x100000;
  self->_flags = ($AD490B0E691E6F105FFA9F0D440E4C82)(*(_DWORD *)&self->_flags & 0xFFFFDFFF | v3);
}

- (BOOL)hasIsOffline
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 5) & 1;
}

- (unsigned)displayedStepID
{
  return self->_displayedStepID;
}

- (void)setDisplayedStepID:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x100002u;
  self->_displayedStepID = a3;
}

- (void)setHasDisplayedStepID:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1048578;
  else
    v3 = 0x100000;
  self->_flags = ($AD490B0E691E6F105FFA9F0D440E4C82)(*(_DWORD *)&self->_flags & 0xFFFFFFFD | v3);
}

- (BOOL)hasDisplayedStepID
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
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
  v8.super_class = (Class)GEOCompanionRouteStatus;
  -[GEOCompanionRouteStatus description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOCompanionRouteStatus dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOCompanionRouteStatus _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  int v5;
  uint64_t v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  int v17;
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
  int v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  __CFString *v34;
  void *v35;
  int v36;
  void *v37;
  void *v38;

  if (!a1)
  {
    v4 = 0;
    return v4;
  }
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_DWORD *)(a1 + 136);
  if ((v5 & 0x20) != 0)
  {
    v6 = *(int *)(a1 + 108);
    if (v6 >= 0xB)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 108));
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_1E1C07110[v6];
    }
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("feedbackType"));

    v5 = *(_DWORD *)(a1 + 136);
  }
  if ((v5 & 0x400) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 128));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("stepID"));

    v5 = *(_DWORD *)(a1 + 136);
    if ((v5 & 8) == 0)
    {
LABEL_9:
      if ((v5 & 0x10) == 0)
        goto LABEL_10;
      goto LABEL_18;
    }
  }
  else if ((v5 & 8) == 0)
  {
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 100));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("distanceToManeuver"));

  v5 = *(_DWORD *)(a1 + 136);
  if ((v5 & 0x10) == 0)
  {
LABEL_10:
    if ((v5 & 4) == 0)
      goto LABEL_11;
    goto LABEL_19;
  }
LABEL_18:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 104));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("distanceToRoute"));

  v5 = *(_DWORD *)(a1 + 136);
  if ((v5 & 4) == 0)
  {
LABEL_11:
    if ((v5 & 0x80) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
LABEL_19:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 96));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("distanceRemainingOnRoute"));

  if ((*(_DWORD *)(a1 + 136) & 0x80) != 0)
  {
LABEL_12:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 116));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("remainingTime"));

  }
LABEL_13:
  objc_msgSend((id)a1, "location");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v9, "jsonRepresentation");
    else
      objc_msgSend(v9, "dictionaryRepresentation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("location"));

  }
  v17 = *(_DWORD *)(a1 + 136);
  if ((v17 & 0x100) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 120));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v21, CFSTR("routeLocationIndex"));

    v17 = *(_DWORD *)(a1 + 136);
    if ((v17 & 0x200) == 0)
    {
LABEL_25:
      if ((v17 & 1) == 0)
        goto LABEL_27;
      goto LABEL_26;
    }
  }
  else if ((v17 & 0x200) == 0)
  {
    goto LABEL_25;
  }
  LODWORD(v16) = *(_DWORD *)(a1 + 124);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v16);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v22, CFSTR("routeLocationOffset"));

  if ((*(_DWORD *)(a1 + 136) & 1) != 0)
  {
LABEL_26:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 72));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v18, CFSTR("timestamp"));

  }
LABEL_27:
  objc_msgSend((id)a1, "routeMatchCoordinate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v19)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v19, "jsonRepresentation");
    else
      objc_msgSend(v19, "dictionaryRepresentation");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v23, CFSTR("routeMatchCoordinate"));

  }
  objc_msgSend((id)a1, "routeID");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v24;
  if (v24)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v24, "base64EncodedStringWithOptions:", 0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v26, CFSTR("routeID"));

    }
    else
    {
      objc_msgSend(v4, "setObject:forKey:", v24, CFSTR("routeID"));
    }
  }

  if ((*(_BYTE *)(a1 + 137) & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 132));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v27, CFSTR("guidancePromptsEnabled"));

  }
  if (*(_QWORD *)(a1 + 24))
  {
    PBRepeatedUInt32NSArray();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v28, CFSTR("selectedRideIndex"));

  }
  v29 = *(_DWORD *)(a1 + 136);
  if ((v29 & 0x4000) == 0)
  {
    if ((v29 & 0x40) == 0)
      goto LABEL_45;
LABEL_51:
    v34 = CFSTR("NO_TURN");
    switch(*(_DWORD *)(a1 + 112))
    {
      case 0:
        break;
      case 1:
        v34 = CFSTR("LEFT_TURN");
        break;
      case 2:
        v34 = CFSTR("RIGHT_TURN");
        break;
      case 3:
        v34 = CFSTR("STRAIGHT_AHEAD");
        break;
      case 4:
        v34 = CFSTR("U_TURN");
        break;
      case 5:
        v34 = CFSTR("FOLLOW_ROAD");
        break;
      case 6:
        v34 = CFSTR("ENTER_ROUNDABOUT");
        break;
      case 7:
        v34 = CFSTR("EXIT_ROUNDABOUT");
        break;
      case 0xB:
        v34 = CFSTR("OFF_RAMP");
        break;
      case 0xC:
        v34 = CFSTR("ON_RAMP");
        break;
      case 0x10:
        v34 = CFSTR("ARRIVE_END_OF_NAVIGATION");
        break;
      case 0x11:
        v34 = CFSTR("START_ROUTE");
        break;
      case 0x12:
        v34 = CFSTR("ARRIVE_AT_DESTINATION");
        break;
      case 0x14:
        v34 = CFSTR("KEEP_LEFT");
        break;
      case 0x15:
        v34 = CFSTR("KEEP_RIGHT");
        break;
      case 0x16:
        v34 = CFSTR("ENTER_FERRY");
        break;
      case 0x17:
        v34 = CFSTR("EXIT_FERRY");
        break;
      case 0x18:
        v34 = CFSTR("CHANGE_FERRY");
        break;
      case 0x19:
        v34 = CFSTR("START_ROUTE_WITH_U_TURN");
        break;
      case 0x1A:
        v34 = CFSTR("U_TURN_AT_ROUNDABOUT");
        break;
      case 0x1B:
        v34 = CFSTR("LEFT_TURN_AT_END");
        break;
      case 0x1C:
        v34 = CFSTR("RIGHT_TURN_AT_END");
        break;
      case 0x1D:
        v34 = CFSTR("HIGHWAY_OFF_RAMP_LEFT");
        break;
      case 0x1E:
        v34 = CFSTR("HIGHWAY_OFF_RAMP_RIGHT");
        break;
      case 0x21:
        v34 = CFSTR("ARRIVE_AT_DESTINATION_LEFT");
        break;
      case 0x22:
        v34 = CFSTR("ARRIVE_AT_DESTINATION_RIGHT");
        break;
      case 0x23:
        v34 = CFSTR("U_TURN_WHEN_POSSIBLE");
        break;
      case 0x27:
        v34 = CFSTR("ARRIVE_END_OF_DIRECTIONS");
        break;
      case 0x29:
        v34 = CFSTR("ROUNDABOUT_EXIT_1");
        break;
      case 0x2A:
        v34 = CFSTR("ROUNDABOUT_EXIT_2");
        break;
      case 0x2B:
        v34 = CFSTR("ROUNDABOUT_EXIT_3");
        break;
      case 0x2C:
        v34 = CFSTR("ROUNDABOUT_EXIT_4");
        break;
      case 0x2D:
        v34 = CFSTR("ROUNDABOUT_EXIT_5");
        break;
      case 0x2E:
        v34 = CFSTR("ROUNDABOUT_EXIT_6");
        break;
      case 0x2F:
        v34 = CFSTR("ROUNDABOUT_EXIT_7");
        break;
      case 0x30:
        v34 = CFSTR("ROUNDABOUT_EXIT_8");
        break;
      case 0x31:
        v34 = CFSTR("ROUNDABOUT_EXIT_9");
        break;
      case 0x32:
        v34 = CFSTR("ROUNDABOUT_EXIT_10");
        break;
      case 0x33:
        v34 = CFSTR("ROUNDABOUT_EXIT_11");
        break;
      case 0x34:
        v34 = CFSTR("ROUNDABOUT_EXIT_12");
        break;
      case 0x35:
        v34 = CFSTR("ROUNDABOUT_EXIT_13");
        break;
      case 0x36:
        v34 = CFSTR("ROUNDABOUT_EXIT_14");
        break;
      case 0x37:
        v34 = CFSTR("ROUNDABOUT_EXIT_15");
        break;
      case 0x38:
        v34 = CFSTR("ROUNDABOUT_EXIT_16");
        break;
      case 0x39:
        v34 = CFSTR("ROUNDABOUT_EXIT_17");
        break;
      case 0x3A:
        v34 = CFSTR("ROUNDABOUT_EXIT_18");
        break;
      case 0x3B:
        v34 = CFSTR("ROUNDABOUT_EXIT_19");
        break;
      case 0x3C:
        v34 = CFSTR("SHARP_LEFT_TURN");
        break;
      case 0x3D:
        v34 = CFSTR("SHARP_RIGHT_TURN");
        break;
      case 0x3E:
        v34 = CFSTR("SLIGHT_LEFT_TURN");
        break;
      case 0x3F:
        v34 = CFSTR("SLIGHT_RIGHT_TURN");
        break;
      case 0x40:
        v34 = CFSTR("CHANGE_HIGHWAY");
        break;
      case 0x41:
        v34 = CFSTR("CHANGE_HIGHWAY_LEFT");
        break;
      case 0x42:
        v34 = CFSTR("CHANGE_HIGHWAY_RIGHT");
        break;
      case 0x50:
        v34 = CFSTR("TOLL_STATION");
        break;
      case 0x51:
        v34 = CFSTR("ENTER_TUNNEL");
        break;
      case 0x52:
        v34 = CFSTR("WAYPOINT_STOP");
        break;
      case 0x53:
        v34 = CFSTR("WAYPOINT_STOP_LEFT");
        break;
      case 0x54:
        v34 = CFSTR("WAYPOINT_STOP_RIGHT");
        break;
      case 0x55:
        v34 = CFSTR("RESUME_ROUTE");
        break;
      case 0x56:
        v34 = CFSTR("RESUME_ROUTE_WITH_U_TURN");
        break;
      case 0x57:
        v34 = CFSTR("CUSTOM");
        break;
      case 0x58:
        v34 = CFSTR("TURN_AROUND");
        break;
      default:
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 112));
        v34 = (__CFString *)objc_claimAutoreleasedReturnValue();
        break;
    }
    objc_msgSend(v4, "setObject:forKey:", v34, CFSTR("hapticsType"));

    if ((*(_DWORD *)(a1 + 136) & 0x1000) == 0)
      goto LABEL_47;
    goto LABEL_46;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 135));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v33, CFSTR("lowGuidanceNavigation"));

  v29 = *(_DWORD *)(a1 + 136);
  if ((v29 & 0x40) != 0)
    goto LABEL_51;
LABEL_45:
  if ((v29 & 0x1000) != 0)
  {
LABEL_46:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 133));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v30, CFSTR("isConnectedToCarplay"));

  }
LABEL_47:
  objc_msgSend((id)a1, "alightMessage");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v31;
  if (v31)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v31, "jsonRepresentation");
    else
      objc_msgSend(v31, "dictionaryRepresentation");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v35, CFSTR("alightMessage"));

  }
  v36 = *(_DWORD *)(a1 + 136);
  if ((v36 & 0x2000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 134));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v37, CFSTR("isOffline"));

    v36 = *(_DWORD *)(a1 + 136);
  }
  if ((v36 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 92));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v38, CFSTR("displayedStepID"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOCompanionRouteStatus _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOCompanionRouteStatus)initWithDictionary:(id)a3
{
  return (GEOCompanionRouteStatus *)-[GEOCompanionRouteStatus _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(char)a3 isJSON:
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  GEOLocation *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  GEOLatLng *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  uint64_t v38;
  void *v39;
  void *v40;
  GEOCompanionTransitAlightMessage *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (!a1)
    goto LABEL_218;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_218;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("feedbackType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v6;
    if ((objc_msgSend(v7, "isEqualToString:", CFSTR("NOT_NAVIGATING")) & 1) != 0)
    {
      v8 = 0;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("PREVIEW")) & 1) != 0)
    {
      v8 = 8;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("PROCEED_TO_ROUTE")) & 1) != 0)
    {
      v8 = 1;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("ANNOUNCE")) & 1) != 0)
    {
      v8 = 2;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("CONTINUE")) & 1) != 0)
    {
      v8 = 10;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("PREPARE")) & 1) != 0)
    {
      v8 = 3;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("PRE_EXECUTE")) & 1) != 0)
    {
      v8 = 9;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("EXECUTE")) & 1) != 0)
    {
      v8 = 4;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("RECALCULATING")) & 1) != 0)
    {
      v8 = 5;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("LOST_LOCATION")) & 1) != 0)
    {
      v8 = 6;
    }
    else if (objc_msgSend(v7, "isEqualToString:", CFSTR("ARRIVED")))
    {
      v8 = 7;
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_31;
    v8 = objc_msgSend(v6, "intValue");
  }
  objc_msgSend(a1, "setFeedbackType:", v8);
LABEL_31:

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("stepID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setStepID:", objc_msgSend(v9, "unsignedIntValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("distanceToManeuver"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setDistanceToManeuver:", objc_msgSend(v10, "unsignedIntValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("distanceToRoute"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setDistanceToRoute:", objc_msgSend(v11, "unsignedIntValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("distanceRemainingOnRoute"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setDistanceRemainingOnRoute:", objc_msgSend(v12, "unsignedIntValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("remainingTime"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setRemainingTime:", objc_msgSend(v13, "unsignedIntValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("location"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v15 = [GEOLocation alloc];
    if ((a3 & 1) != 0)
      v16 = -[GEOLocation initWithJSON:](v15, "initWithJSON:", v14);
    else
      v16 = -[GEOLocation initWithDictionary:](v15, "initWithDictionary:", v14);
    v17 = (void *)v16;
    objc_msgSend(a1, "setLocation:", v16);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("routeLocationIndex"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setRouteLocationIndex:", objc_msgSend(v18, "unsignedIntValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("routeLocationOffset"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v19, "floatValue");
    objc_msgSend(a1, "setRouteLocationOffset:");
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("timestamp"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v20, "doubleValue");
    objc_msgSend(a1, "setTimestamp:");
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("routeMatchCoordinate"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v22 = [GEOLatLng alloc];
    if ((a3 & 1) != 0)
      v23 = -[GEOLatLng initWithJSON:](v22, "initWithJSON:", v21);
    else
      v23 = -[GEOLatLng initWithDictionary:](v22, "initWithDictionary:", v21);
    v24 = (void *)v23;
    objc_msgSend(a1, "setRouteMatchCoordinate:", v23);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("routeID"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v25, 0);
    objc_msgSend(a1, "setRouteID:", v26);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("guidancePromptsEnabled"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setGuidancePromptsEnabled:", objc_msgSend(v27, "BOOLValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("selectedRideIndex"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    v29 = v28;
    v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
    if (v30)
    {
      v31 = v30;
      v32 = *(_QWORD *)v48;
      do
      {
        for (i = 0; i != v31; ++i)
        {
          if (*(_QWORD *)v48 != v32)
            objc_enumerationMutation(v29);
          v34 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(a1, "addSelectedRideIndex:", objc_msgSend(v34, "unsignedIntValue", (_QWORD)v47));
        }
        v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
      }
      while (v31);
    }

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("lowGuidanceNavigation"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setLowGuidanceNavigation:", objc_msgSend(v35, "BOOLValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("hapticsType"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v37 = v36;
    if ((objc_msgSend(v37, "isEqualToString:", CFSTR("NO_TURN")) & 1) != 0)
    {
      v38 = 0;
    }
    else if ((objc_msgSend(v37, "isEqualToString:", CFSTR("LEFT_TURN")) & 1) != 0)
    {
      v38 = 1;
    }
    else if ((objc_msgSend(v37, "isEqualToString:", CFSTR("RIGHT_TURN")) & 1) != 0)
    {
      v38 = 2;
    }
    else if ((objc_msgSend(v37, "isEqualToString:", CFSTR("STRAIGHT_AHEAD")) & 1) != 0)
    {
      v38 = 3;
    }
    else if ((objc_msgSend(v37, "isEqualToString:", CFSTR("U_TURN")) & 1) != 0)
    {
      v38 = 4;
    }
    else if ((objc_msgSend(v37, "isEqualToString:", CFSTR("FOLLOW_ROAD")) & 1) != 0)
    {
      v38 = 5;
    }
    else if ((objc_msgSend(v37, "isEqualToString:", CFSTR("ENTER_ROUNDABOUT")) & 1) != 0)
    {
      v38 = 6;
    }
    else if ((objc_msgSend(v37, "isEqualToString:", CFSTR("EXIT_ROUNDABOUT")) & 1) != 0)
    {
      v38 = 7;
    }
    else if ((objc_msgSend(v37, "isEqualToString:", CFSTR("OFF_RAMP")) & 1) != 0)
    {
      v38 = 11;
    }
    else if ((objc_msgSend(v37, "isEqualToString:", CFSTR("ON_RAMP")) & 1) != 0)
    {
      v38 = 12;
    }
    else if ((objc_msgSend(v37, "isEqualToString:", CFSTR("ARRIVE_END_OF_NAVIGATION")) & 1) != 0)
    {
      v38 = 16;
    }
    else if ((objc_msgSend(v37, "isEqualToString:", CFSTR("START_ROUTE")) & 1) != 0)
    {
      v38 = 17;
    }
    else if ((objc_msgSend(v37, "isEqualToString:", CFSTR("ARRIVE_AT_DESTINATION")) & 1) != 0)
    {
      v38 = 18;
    }
    else if ((objc_msgSend(v37, "isEqualToString:", CFSTR("KEEP_LEFT")) & 1) != 0)
    {
      v38 = 20;
    }
    else if ((objc_msgSend(v37, "isEqualToString:", CFSTR("KEEP_RIGHT")) & 1) != 0)
    {
      v38 = 21;
    }
    else if ((objc_msgSend(v37, "isEqualToString:", CFSTR("ENTER_FERRY")) & 1) != 0)
    {
      v38 = 22;
    }
    else if ((objc_msgSend(v37, "isEqualToString:", CFSTR("EXIT_FERRY")) & 1) != 0)
    {
      v38 = 23;
    }
    else if ((objc_msgSend(v37, "isEqualToString:", CFSTR("CHANGE_FERRY")) & 1) != 0)
    {
      v38 = 24;
    }
    else if ((objc_msgSend(v37, "isEqualToString:", CFSTR("START_ROUTE_WITH_U_TURN")) & 1) != 0)
    {
      v38 = 25;
    }
    else if ((objc_msgSend(v37, "isEqualToString:", CFSTR("U_TURN_AT_ROUNDABOUT")) & 1) != 0)
    {
      v38 = 26;
    }
    else if ((objc_msgSend(v37, "isEqualToString:", CFSTR("LEFT_TURN_AT_END")) & 1) != 0)
    {
      v38 = 27;
    }
    else if ((objc_msgSend(v37, "isEqualToString:", CFSTR("RIGHT_TURN_AT_END")) & 1) != 0)
    {
      v38 = 28;
    }
    else if ((objc_msgSend(v37, "isEqualToString:", CFSTR("HIGHWAY_OFF_RAMP_LEFT")) & 1) != 0)
    {
      v38 = 29;
    }
    else if ((objc_msgSend(v37, "isEqualToString:", CFSTR("HIGHWAY_OFF_RAMP_RIGHT")) & 1) != 0)
    {
      v38 = 30;
    }
    else if ((objc_msgSend(v37, "isEqualToString:", CFSTR("ARRIVE_AT_DESTINATION_LEFT")) & 1) != 0)
    {
      v38 = 33;
    }
    else if ((objc_msgSend(v37, "isEqualToString:", CFSTR("ARRIVE_AT_DESTINATION_RIGHT")) & 1) != 0)
    {
      v38 = 34;
    }
    else if ((objc_msgSend(v37, "isEqualToString:", CFSTR("U_TURN_WHEN_POSSIBLE")) & 1) != 0)
    {
      v38 = 35;
    }
    else if ((objc_msgSend(v37, "isEqualToString:", CFSTR("ARRIVE_END_OF_DIRECTIONS")) & 1) != 0)
    {
      v38 = 39;
    }
    else if ((objc_msgSend(v37, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_1")) & 1) != 0)
    {
      v38 = 41;
    }
    else if ((objc_msgSend(v37, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_2")) & 1) != 0)
    {
      v38 = 42;
    }
    else if ((objc_msgSend(v37, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_3")) & 1) != 0)
    {
      v38 = 43;
    }
    else if ((objc_msgSend(v37, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_4")) & 1) != 0)
    {
      v38 = 44;
    }
    else if ((objc_msgSend(v37, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_5")) & 1) != 0)
    {
      v38 = 45;
    }
    else if ((objc_msgSend(v37, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_6")) & 1) != 0)
    {
      v38 = 46;
    }
    else if ((objc_msgSend(v37, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_7")) & 1) != 0)
    {
      v38 = 47;
    }
    else if ((objc_msgSend(v37, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_8")) & 1) != 0)
    {
      v38 = 48;
    }
    else if ((objc_msgSend(v37, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_9")) & 1) != 0)
    {
      v38 = 49;
    }
    else if ((objc_msgSend(v37, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_10")) & 1) != 0)
    {
      v38 = 50;
    }
    else if ((objc_msgSend(v37, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_11")) & 1) != 0)
    {
      v38 = 51;
    }
    else if ((objc_msgSend(v37, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_12")) & 1) != 0)
    {
      v38 = 52;
    }
    else if ((objc_msgSend(v37, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_13")) & 1) != 0)
    {
      v38 = 53;
    }
    else if ((objc_msgSend(v37, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_14")) & 1) != 0)
    {
      v38 = 54;
    }
    else if ((objc_msgSend(v37, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_15")) & 1) != 0)
    {
      v38 = 55;
    }
    else if ((objc_msgSend(v37, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_16")) & 1) != 0)
    {
      v38 = 56;
    }
    else if ((objc_msgSend(v37, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_17")) & 1) != 0)
    {
      v38 = 57;
    }
    else if ((objc_msgSend(v37, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_18")) & 1) != 0)
    {
      v38 = 58;
    }
    else if ((objc_msgSend(v37, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_19")) & 1) != 0)
    {
      v38 = 59;
    }
    else if ((objc_msgSend(v37, "isEqualToString:", CFSTR("SHARP_LEFT_TURN")) & 1) != 0)
    {
      v38 = 60;
    }
    else if ((objc_msgSend(v37, "isEqualToString:", CFSTR("SHARP_RIGHT_TURN")) & 1) != 0)
    {
      v38 = 61;
    }
    else if ((objc_msgSend(v37, "isEqualToString:", CFSTR("SLIGHT_LEFT_TURN")) & 1) != 0)
    {
      v38 = 62;
    }
    else if ((objc_msgSend(v37, "isEqualToString:", CFSTR("SLIGHT_RIGHT_TURN")) & 1) != 0)
    {
      v38 = 63;
    }
    else if ((objc_msgSend(v37, "isEqualToString:", CFSTR("CHANGE_HIGHWAY")) & 1) != 0)
    {
      v38 = 64;
    }
    else if ((objc_msgSend(v37, "isEqualToString:", CFSTR("CHANGE_HIGHWAY_LEFT")) & 1) != 0)
    {
      v38 = 65;
    }
    else if ((objc_msgSend(v37, "isEqualToString:", CFSTR("CHANGE_HIGHWAY_RIGHT")) & 1) != 0)
    {
      v38 = 66;
    }
    else if ((objc_msgSend(v37, "isEqualToString:", CFSTR("TOLL_STATION")) & 1) != 0)
    {
      v38 = 80;
    }
    else if ((objc_msgSend(v37, "isEqualToString:", CFSTR("ENTER_TUNNEL")) & 1) != 0)
    {
      v38 = 81;
    }
    else if ((objc_msgSend(v37, "isEqualToString:", CFSTR("WAYPOINT_STOP")) & 1) != 0)
    {
      v38 = 82;
    }
    else if ((objc_msgSend(v37, "isEqualToString:", CFSTR("WAYPOINT_STOP_LEFT")) & 1) != 0)
    {
      v38 = 83;
    }
    else if ((objc_msgSend(v37, "isEqualToString:", CFSTR("WAYPOINT_STOP_RIGHT")) & 1) != 0)
    {
      v38 = 84;
    }
    else if ((objc_msgSend(v37, "isEqualToString:", CFSTR("RESUME_ROUTE")) & 1) != 0)
    {
      v38 = 85;
    }
    else if ((objc_msgSend(v37, "isEqualToString:", CFSTR("RESUME_ROUTE_WITH_U_TURN")) & 1) != 0)
    {
      v38 = 86;
    }
    else if ((objc_msgSend(v37, "isEqualToString:", CFSTR("CUSTOM")) & 1) != 0)
    {
      v38 = 87;
    }
    else if (objc_msgSend(v37, "isEqualToString:", CFSTR("TURN_AROUND")))
    {
      v38 = 88;
    }
    else
    {
      v38 = 0;
    }

    goto LABEL_205;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v38 = objc_msgSend(v36, "intValue");
LABEL_205:
    objc_msgSend(a1, "setHapticsType:", v38, (_QWORD)v47);
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("isConnectedToCarplay"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setIsConnectedToCarplay:", objc_msgSend(v39, "BOOLValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("alightMessage"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v41 = [GEOCompanionTransitAlightMessage alloc];
    if ((a3 & 1) != 0)
      v42 = -[GEOCompanionTransitAlightMessage initWithJSON:](v41, "initWithJSON:", v40);
    else
      v42 = -[GEOCompanionTransitAlightMessage initWithDictionary:](v41, "initWithDictionary:", v40);
    v43 = (void *)v42;
    objc_msgSend(a1, "setAlightMessage:", v42, (_QWORD)v47);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("isOffline"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setIsOffline:", objc_msgSend(v44, "BOOLValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("displayedStepID"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setDisplayedStepID:", objc_msgSend(v45, "unsignedIntValue"));

LABEL_218:
  return a1;
}

- (GEOCompanionRouteStatus)initWithJSON:(id)a3
{
  return (GEOCompanionRouteStatus *)-[GEOCompanionRouteStatus _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_667;
    else
      v8 = (int *)&readAll__nonRecursiveTag_668;
    GEOCompanionRouteStatusReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
  {
    -[GEOLocation readAll:](self->_location, "readAll:", 1);
    -[GEOLatLng readAll:](self->_routeMatchCoordinate, "readAll:", 1);
    -[GEOCompanionTransitAlightMessage readAll:](self->_alightMessage, "readAll:", 1);
  }
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOCompanionRouteStatusIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOCompanionRouteStatusReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  $AD490B0E691E6F105FFA9F0D440E4C82 flags;
  void *v6;
  $AD490B0E691E6F105FFA9F0D440E4C82 v7;
  unint64_t v8;
  $AD490B0E691E6F105FFA9F0D440E4C82 v9;
  $AD490B0E691E6F105FFA9F0D440E4C82 v10;
  PBDataReader *v11;
  void *v12;
  id v13;

  v13 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOCompanionRouteStatusIsDirty((uint64_t)self) & 1) == 0)
  {
    v11 = self->_reader;
    objc_sync_enter(v11);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "writeData:", v12);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v11);
    goto LABEL_48;
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOCompanionRouteStatus readAll:](self, "readAll:", 0);
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 0x20) != 0)
  {
    PBDataWriterWriteInt32Field();
    flags = self->_flags;
  }
  v6 = v13;
  if ((*(_WORD *)&flags & 0x400) != 0)
  {
    PBDataWriterWriteUint32Field();
    v6 = v13;
    flags = self->_flags;
    if ((*(_BYTE *)&flags & 8) == 0)
    {
LABEL_7:
      if ((*(_BYTE *)&flags & 0x10) == 0)
        goto LABEL_8;
      goto LABEL_38;
    }
  }
  else if ((*(_BYTE *)&flags & 8) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteUint32Field();
  v6 = v13;
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 0x10) == 0)
  {
LABEL_8:
    if ((*(_BYTE *)&flags & 4) == 0)
      goto LABEL_9;
    goto LABEL_39;
  }
LABEL_38:
  PBDataWriterWriteUint32Field();
  v6 = v13;
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 4) == 0)
  {
LABEL_9:
    if ((*(_BYTE *)&flags & 0x80) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
LABEL_39:
  PBDataWriterWriteUint32Field();
  v6 = v13;
  if ((*(_DWORD *)&self->_flags & 0x80) != 0)
  {
LABEL_10:
    PBDataWriterWriteUint32Field();
    v6 = v13;
  }
LABEL_11:
  if (self->_location)
  {
    PBDataWriterWriteSubmessage();
    v6 = v13;
  }
  v7 = self->_flags;
  if ((*(_WORD *)&v7 & 0x100) != 0)
  {
    PBDataWriterWriteUint32Field();
    v6 = v13;
    v7 = self->_flags;
    if ((*(_WORD *)&v7 & 0x200) == 0)
    {
LABEL_15:
      if ((*(_BYTE *)&v7 & 1) == 0)
        goto LABEL_17;
      goto LABEL_16;
    }
  }
  else if ((*(_WORD *)&v7 & 0x200) == 0)
  {
    goto LABEL_15;
  }
  PBDataWriterWriteFloatField();
  v6 = v13;
  if ((*(_DWORD *)&self->_flags & 1) != 0)
  {
LABEL_16:
    PBDataWriterWriteDoubleField();
    v6 = v13;
  }
LABEL_17:
  if (self->_routeMatchCoordinate)
  {
    PBDataWriterWriteSubmessage();
    v6 = v13;
  }
  if (self->_routeID)
  {
    PBDataWriterWriteDataField();
    v6 = v13;
  }
  if ((*((_BYTE *)&self->_flags + 1) & 8) != 0)
  {
    PBDataWriterWriteBOOLField();
    v6 = v13;
  }
  if (self->_selectedRideIndexs.count)
  {
    v8 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      v6 = v13;
      ++v8;
    }
    while (v8 < self->_selectedRideIndexs.count);
  }
  v9 = self->_flags;
  if ((*(_WORD *)&v9 & 0x4000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v6 = v13;
    v9 = self->_flags;
    if ((*(_BYTE *)&v9 & 0x40) == 0)
    {
LABEL_28:
      if ((*(_WORD *)&v9 & 0x1000) == 0)
        goto LABEL_30;
      goto LABEL_29;
    }
  }
  else if ((*(_BYTE *)&v9 & 0x40) == 0)
  {
    goto LABEL_28;
  }
  PBDataWriterWriteInt32Field();
  v6 = v13;
  if ((*(_DWORD *)&self->_flags & 0x1000) != 0)
  {
LABEL_29:
    PBDataWriterWriteBOOLField();
    v6 = v13;
  }
LABEL_30:
  if (self->_alightMessage)
  {
    PBDataWriterWriteSubmessage();
    v6 = v13;
  }
  v10 = self->_flags;
  if ((*(_WORD *)&v10 & 0x2000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v6 = v13;
    v10 = self->_flags;
  }
  if ((*(_BYTE *)&v10 & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
LABEL_48:
    v6 = v13;
  }

}

- (void)clearSensitiveFields:(unint64_t)a3
{
  GEOCompanionRouteStatusClearSensitiveFields(self, a3, 1);
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[GEOCompanionRouteStatus _readLocation]((uint64_t)self);
  if (-[GEOLocation hasGreenTeaWithValue:](self->_location, "hasGreenTeaWithValue:", v3))
    return 1;
  -[GEOCompanionRouteStatus _readRouteMatchCoordinate]((uint64_t)self);
  return -[GEOLatLng hasGreenTeaWithValue:](self->_routeMatchCoordinate, "hasGreenTeaWithValue:", v3);
}

- (void)copyTo:(id)a3
{
  id *v4;
  $AD490B0E691E6F105FFA9F0D440E4C82 flags;
  $AD490B0E691E6F105FFA9F0D440E4C82 v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t i;
  $AD490B0E691E6F105FFA9F0D440E4C82 v10;
  id *v11;
  $AD490B0E691E6F105FFA9F0D440E4C82 v12;
  id *v13;

  v13 = (id *)a3;
  -[GEOCompanionRouteStatus readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v13 + 1, self->_reader);
  *((_DWORD *)v13 + 20) = self->_readerMarkPos;
  *((_DWORD *)v13 + 21) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  v4 = v13;
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 0x20) != 0)
  {
    *((_DWORD *)v13 + 27) = self->_feedbackType;
    *((_DWORD *)v13 + 34) |= 0x20u;
    flags = self->_flags;
    if ((*(_WORD *)&flags & 0x400) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&flags & 8) == 0)
        goto LABEL_4;
      goto LABEL_37;
    }
  }
  else if ((*(_WORD *)&flags & 0x400) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v13 + 32) = self->_stepID;
  *((_DWORD *)v13 + 34) |= 0x400u;
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 8) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&flags & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_38;
  }
LABEL_37:
  *((_DWORD *)v13 + 25) = self->_distanceToManeuver;
  *((_DWORD *)v13 + 34) |= 8u;
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 0x10) == 0)
  {
LABEL_5:
    if ((*(_BYTE *)&flags & 4) == 0)
      goto LABEL_6;
    goto LABEL_39;
  }
LABEL_38:
  *((_DWORD *)v13 + 26) = self->_distanceToRoute;
  *((_DWORD *)v13 + 34) |= 0x10u;
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 4) == 0)
  {
LABEL_6:
    if ((*(_BYTE *)&flags & 0x80) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_39:
  *((_DWORD *)v13 + 24) = self->_distanceRemainingOnRoute;
  *((_DWORD *)v13 + 34) |= 4u;
  if ((*(_DWORD *)&self->_flags & 0x80) != 0)
  {
LABEL_7:
    *((_DWORD *)v13 + 29) = self->_remainingTime;
    *((_DWORD *)v13 + 34) |= 0x80u;
  }
LABEL_8:
  if (self->_location)
  {
    objc_msgSend(v13, "setLocation:");
    v4 = v13;
  }
  v6 = self->_flags;
  if ((*(_WORD *)&v6 & 0x100) != 0)
  {
    *((_DWORD *)v4 + 30) = self->_routeLocationIndex;
    *((_DWORD *)v4 + 34) |= 0x100u;
    v6 = self->_flags;
    if ((*(_WORD *)&v6 & 0x200) == 0)
    {
LABEL_12:
      if ((*(_BYTE *)&v6 & 1) == 0)
        goto LABEL_14;
      goto LABEL_13;
    }
  }
  else if ((*(_WORD *)&v6 & 0x200) == 0)
  {
    goto LABEL_12;
  }
  *((_DWORD *)v4 + 31) = LODWORD(self->_routeLocationOffset);
  *((_DWORD *)v4 + 34) |= 0x200u;
  if ((*(_DWORD *)&self->_flags & 1) != 0)
  {
LABEL_13:
    v4[9] = *(id *)&self->_timestamp;
    *((_DWORD *)v4 + 34) |= 1u;
  }
LABEL_14:
  if (self->_routeMatchCoordinate)
  {
    objc_msgSend(v13, "setRouteMatchCoordinate:");
    v4 = v13;
  }
  if (self->_routeID)
  {
    objc_msgSend(v13, "setRouteID:");
    v4 = v13;
  }
  if ((*((_BYTE *)&self->_flags + 1) & 8) != 0)
  {
    *((_BYTE *)v4 + 132) = self->_guidancePromptsEnabled;
    *((_DWORD *)v4 + 34) |= 0x800u;
  }
  if (-[GEOCompanionRouteStatus selectedRideIndexsCount](self, "selectedRideIndexsCount"))
  {
    objc_msgSend(v13, "clearSelectedRideIndexs");
    v7 = -[GEOCompanionRouteStatus selectedRideIndexsCount](self, "selectedRideIndexsCount");
    if (v7)
    {
      v8 = v7;
      for (i = 0; i != v8; ++i)
        objc_msgSend(v13, "addSelectedRideIndex:", -[GEOCompanionRouteStatus selectedRideIndexAtIndex:](self, "selectedRideIndexAtIndex:", i));
    }
  }
  v10 = self->_flags;
  v11 = v13;
  if ((*(_WORD *)&v10 & 0x4000) != 0)
  {
    *((_BYTE *)v13 + 135) = self->_lowGuidanceNavigation;
    *((_DWORD *)v13 + 34) |= 0x4000u;
    v10 = self->_flags;
    if ((*(_BYTE *)&v10 & 0x40) == 0)
    {
LABEL_26:
      if ((*(_WORD *)&v10 & 0x1000) == 0)
        goto LABEL_28;
      goto LABEL_27;
    }
  }
  else if ((*(_BYTE *)&v10 & 0x40) == 0)
  {
    goto LABEL_26;
  }
  *((_DWORD *)v13 + 28) = self->_hapticsType;
  *((_DWORD *)v13 + 34) |= 0x40u;
  if ((*(_DWORD *)&self->_flags & 0x1000) != 0)
  {
LABEL_27:
    *((_BYTE *)v13 + 133) = self->_isConnectedToCarplay;
    *((_DWORD *)v13 + 34) |= 0x1000u;
  }
LABEL_28:
  if (self->_alightMessage)
  {
    objc_msgSend(v13, "setAlightMessage:");
    v11 = v13;
  }
  v12 = self->_flags;
  if ((*(_WORD *)&v12 & 0x2000) != 0)
  {
    *((_BYTE *)v11 + 134) = self->_isOffline;
    *((_DWORD *)v11 + 34) |= 0x2000u;
    v12 = self->_flags;
  }
  if ((*(_BYTE *)&v12 & 2) != 0)
  {
    *((_DWORD *)v11 + 23) = self->_displayedStepID;
    *((_DWORD *)v11 + 34) |= 2u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  $AD490B0E691E6F105FFA9F0D440E4C82 flags;
  id v10;
  void *v11;
  $AD490B0E691E6F105FFA9F0D440E4C82 v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  $AD490B0E691E6F105FFA9F0D440E4C82 v17;
  id v18;
  void *v19;
  $AD490B0E691E6F105FFA9F0D440E4C82 v20;

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
      GEOCompanionRouteStatusReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOCompanionRouteStatus readAll:](self, "readAll:", 0);
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 0x20) != 0)
  {
    *(_DWORD *)(v5 + 108) = self->_feedbackType;
    *(_DWORD *)(v5 + 136) |= 0x20u;
    flags = self->_flags;
    if ((*(_WORD *)&flags & 0x400) == 0)
    {
LABEL_7:
      if ((*(_BYTE *)&flags & 8) == 0)
        goto LABEL_8;
      goto LABEL_29;
    }
  }
  else if ((*(_WORD *)&flags & 0x400) == 0)
  {
    goto LABEL_7;
  }
  *(_DWORD *)(v5 + 128) = self->_stepID;
  *(_DWORD *)(v5 + 136) |= 0x400u;
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 8) == 0)
  {
LABEL_8:
    if ((*(_BYTE *)&flags & 0x10) == 0)
      goto LABEL_9;
    goto LABEL_30;
  }
LABEL_29:
  *(_DWORD *)(v5 + 100) = self->_distanceToManeuver;
  *(_DWORD *)(v5 + 136) |= 8u;
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 0x10) == 0)
  {
LABEL_9:
    if ((*(_BYTE *)&flags & 4) == 0)
      goto LABEL_10;
    goto LABEL_31;
  }
LABEL_30:
  *(_DWORD *)(v5 + 104) = self->_distanceToRoute;
  *(_DWORD *)(v5 + 136) |= 0x10u;
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 4) == 0)
  {
LABEL_10:
    if ((*(_BYTE *)&flags & 0x80) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_31:
  *(_DWORD *)(v5 + 96) = self->_distanceRemainingOnRoute;
  *(_DWORD *)(v5 + 136) |= 4u;
  if ((*(_DWORD *)&self->_flags & 0x80) != 0)
  {
LABEL_11:
    *(_DWORD *)(v5 + 116) = self->_remainingTime;
    *(_DWORD *)(v5 + 136) |= 0x80u;
  }
LABEL_12:
  v10 = -[GEOLocation copyWithZone:](self->_location, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v10;

  v12 = self->_flags;
  if ((*(_WORD *)&v12 & 0x100) != 0)
  {
    *(_DWORD *)(v5 + 120) = self->_routeLocationIndex;
    *(_DWORD *)(v5 + 136) |= 0x100u;
    v12 = self->_flags;
    if ((*(_WORD *)&v12 & 0x200) == 0)
    {
LABEL_14:
      if ((*(_BYTE *)&v12 & 1) == 0)
        goto LABEL_16;
      goto LABEL_15;
    }
  }
  else if ((*(_WORD *)&v12 & 0x200) == 0)
  {
    goto LABEL_14;
  }
  *(float *)(v5 + 124) = self->_routeLocationOffset;
  *(_DWORD *)(v5 + 136) |= 0x200u;
  if ((*(_DWORD *)&self->_flags & 1) != 0)
  {
LABEL_15:
    *(double *)(v5 + 72) = self->_timestamp;
    *(_DWORD *)(v5 + 136) |= 1u;
  }
LABEL_16:
  v13 = -[GEOLatLng copyWithZone:](self->_routeMatchCoordinate, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v13;

  v15 = -[NSData copyWithZone:](self->_routeID, "copyWithZone:", a3);
  v16 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v15;

  if ((*((_BYTE *)&self->_flags + 1) & 8) != 0)
  {
    *(_BYTE *)(v5 + 132) = self->_guidancePromptsEnabled;
    *(_DWORD *)(v5 + 136) |= 0x800u;
  }
  PBRepeatedUInt32Copy();
  v17 = self->_flags;
  if ((*(_WORD *)&v17 & 0x4000) == 0)
  {
    if ((*(_BYTE *)&v17 & 0x40) == 0)
      goto LABEL_20;
LABEL_37:
    *(_DWORD *)(v5 + 112) = self->_hapticsType;
    *(_DWORD *)(v5 + 136) |= 0x40u;
    if ((*(_DWORD *)&self->_flags & 0x1000) == 0)
      goto LABEL_22;
    goto LABEL_21;
  }
  *(_BYTE *)(v5 + 135) = self->_lowGuidanceNavigation;
  *(_DWORD *)(v5 + 136) |= 0x4000u;
  v17 = self->_flags;
  if ((*(_BYTE *)&v17 & 0x40) != 0)
    goto LABEL_37;
LABEL_20:
  if ((*(_WORD *)&v17 & 0x1000) != 0)
  {
LABEL_21:
    *(_BYTE *)(v5 + 133) = self->_isConnectedToCarplay;
    *(_DWORD *)(v5 + 136) |= 0x1000u;
  }
LABEL_22:
  v18 = -[GEOCompanionTransitAlightMessage copyWithZone:](self->_alightMessage, "copyWithZone:", a3);
  v19 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v18;

  v20 = self->_flags;
  if ((*(_WORD *)&v20 & 0x2000) != 0)
  {
    *(_BYTE *)(v5 + 134) = self->_isOffline;
    *(_DWORD *)(v5 + 136) |= 0x2000u;
    v20 = self->_flags;
  }
  if ((*(_BYTE *)&v20 & 2) != 0)
  {
    *(_DWORD *)(v5 + 92) = self->_displayedStepID;
    *(_DWORD *)(v5 + 136) |= 2u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  $AD490B0E691E6F105FFA9F0D440E4C82 flags;
  int v6;
  GEOLocation *location;
  GEOLatLng *routeMatchCoordinate;
  NSData *routeID;
  int v10;
  $AD490B0E691E6F105FFA9F0D440E4C82 v11;
  int v12;
  GEOCompanionTransitAlightMessage *alightMessage;
  BOOL v14;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_100;
  -[GEOCompanionRouteStatus readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  flags = self->_flags;
  v6 = *((_DWORD *)v4 + 34);
  if ((*(_BYTE *)&flags & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_feedbackType != *((_DWORD *)v4 + 27))
      goto LABEL_100;
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_100;
  }
  if ((*(_WORD *)&flags & 0x400) != 0)
  {
    if ((v6 & 0x400) == 0 || self->_stepID != *((_DWORD *)v4 + 32))
      goto LABEL_100;
  }
  else if ((v6 & 0x400) != 0)
  {
    goto LABEL_100;
  }
  if ((*(_BYTE *)&flags & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_distanceToManeuver != *((_DWORD *)v4 + 25))
      goto LABEL_100;
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_100;
  }
  if ((*(_BYTE *)&flags & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_distanceToRoute != *((_DWORD *)v4 + 26))
      goto LABEL_100;
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_100;
  }
  if ((*(_BYTE *)&flags & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_distanceRemainingOnRoute != *((_DWORD *)v4 + 24))
      goto LABEL_100;
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_100;
  }
  if ((*(_BYTE *)&flags & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_remainingTime != *((_DWORD *)v4 + 29))
      goto LABEL_100;
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_100;
  }
  location = self->_location;
  if ((unint64_t)location | *((_QWORD *)v4 + 6))
  {
    if (!-[GEOLocation isEqual:](location, "isEqual:"))
      goto LABEL_100;
    flags = self->_flags;
    v6 = *((_DWORD *)v4 + 34);
  }
  if ((*(_WORD *)&flags & 0x100) != 0)
  {
    if ((v6 & 0x100) == 0 || self->_routeLocationIndex != *((_DWORD *)v4 + 30))
      goto LABEL_100;
  }
  else if ((v6 & 0x100) != 0)
  {
    goto LABEL_100;
  }
  if ((*(_WORD *)&flags & 0x200) != 0)
  {
    if ((v6 & 0x200) == 0 || self->_routeLocationOffset != *((float *)v4 + 31))
      goto LABEL_100;
  }
  else if ((v6 & 0x200) != 0)
  {
    goto LABEL_100;
  }
  if ((*(_BYTE *)&flags & 1) != 0)
  {
    if ((v6 & 1) == 0 || self->_timestamp != *((double *)v4 + 9))
      goto LABEL_100;
  }
  else if ((v6 & 1) != 0)
  {
    goto LABEL_100;
  }
  routeMatchCoordinate = self->_routeMatchCoordinate;
  if ((unint64_t)routeMatchCoordinate | *((_QWORD *)v4 + 8)
    && !-[GEOLatLng isEqual:](routeMatchCoordinate, "isEqual:"))
  {
    goto LABEL_100;
  }
  routeID = self->_routeID;
  if ((unint64_t)routeID | *((_QWORD *)v4 + 7))
  {
    if (!-[NSData isEqual:](routeID, "isEqual:"))
      goto LABEL_100;
  }
  v10 = *((_DWORD *)v4 + 34);
  if ((*((_BYTE *)&self->_flags + 1) & 8) != 0)
  {
    if ((v10 & 0x800) == 0)
      goto LABEL_100;
    if (self->_guidancePromptsEnabled)
    {
      if (!*((_BYTE *)v4 + 132))
        goto LABEL_100;
    }
    else if (*((_BYTE *)v4 + 132))
    {
      goto LABEL_100;
    }
  }
  else if ((v10 & 0x800) != 0)
  {
    goto LABEL_100;
  }
  if (!PBRepeatedUInt32IsEqual())
    goto LABEL_100;
  v11 = self->_flags;
  v12 = *((_DWORD *)v4 + 34);
  if ((*(_WORD *)&v11 & 0x4000) != 0)
  {
    if ((v12 & 0x4000) == 0)
      goto LABEL_100;
    if (self->_lowGuidanceNavigation)
    {
      if (!*((_BYTE *)v4 + 135))
        goto LABEL_100;
    }
    else if (*((_BYTE *)v4 + 135))
    {
      goto LABEL_100;
    }
  }
  else if ((v12 & 0x4000) != 0)
  {
    goto LABEL_100;
  }
  if ((*(_BYTE *)&v11 & 0x40) != 0)
  {
    if ((v12 & 0x40) == 0 || self->_hapticsType != *((_DWORD *)v4 + 28))
      goto LABEL_100;
  }
  else if ((v12 & 0x40) != 0)
  {
    goto LABEL_100;
  }
  if ((*(_WORD *)&v11 & 0x1000) != 0)
  {
    if ((v12 & 0x1000) == 0)
      goto LABEL_100;
    if (self->_isConnectedToCarplay)
    {
      if (!*((_BYTE *)v4 + 133))
        goto LABEL_100;
    }
    else if (*((_BYTE *)v4 + 133))
    {
      goto LABEL_100;
    }
  }
  else if ((v12 & 0x1000) != 0)
  {
    goto LABEL_100;
  }
  alightMessage = self->_alightMessage;
  if ((unint64_t)alightMessage | *((_QWORD *)v4 + 5))
  {
    if (!-[GEOCompanionTransitAlightMessage isEqual:](alightMessage, "isEqual:"))
      goto LABEL_100;
    v11 = self->_flags;
    v12 = *((_DWORD *)v4 + 34);
  }
  if ((*(_WORD *)&v11 & 0x2000) != 0)
  {
    if ((v12 & 0x2000) != 0)
    {
      if (self->_isOffline)
      {
        if (!*((_BYTE *)v4 + 134))
          goto LABEL_100;
        goto LABEL_95;
      }
      if (!*((_BYTE *)v4 + 134))
        goto LABEL_95;
    }
LABEL_100:
    v14 = 0;
    goto LABEL_101;
  }
  if ((v12 & 0x2000) != 0)
    goto LABEL_100;
LABEL_95:
  if ((*(_BYTE *)&v11 & 2) != 0)
  {
    if ((v12 & 2) == 0 || self->_displayedStepID != *((_DWORD *)v4 + 23))
      goto LABEL_100;
    v14 = 1;
  }
  else
  {
    v14 = (v12 & 2) == 0;
  }
LABEL_101:

  return v14;
}

- (unint64_t)hash
{
  $AD490B0E691E6F105FFA9F0D440E4C82 flags;
  $AD490B0E691E6F105FFA9F0D440E4C82 v4;
  float routeLocationOffset;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;
  unint64_t v10;
  double timestamp;
  double v12;
  long double v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  $AD490B0E691E6F105FFA9F0D440E4C82 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  $AD490B0E691E6F105FFA9F0D440E4C82 v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;

  -[GEOCompanionRouteStatus readAll:](self, "readAll:", 1);
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 0x20) != 0)
  {
    v36 = 2654435761 * self->_feedbackType;
    if ((*(_WORD *)&flags & 0x400) != 0)
    {
LABEL_3:
      v35 = 2654435761 * self->_stepID;
      if ((*(_BYTE *)&flags & 8) != 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else
  {
    v36 = 0;
    if ((*(_WORD *)&flags & 0x400) != 0)
      goto LABEL_3;
  }
  v35 = 0;
  if ((*(_BYTE *)&flags & 8) != 0)
  {
LABEL_4:
    v34 = 2654435761 * self->_distanceToManeuver;
    if ((*(_BYTE *)&flags & 0x10) != 0)
      goto LABEL_5;
    goto LABEL_11;
  }
LABEL_10:
  v34 = 0;
  if ((*(_BYTE *)&flags & 0x10) != 0)
  {
LABEL_5:
    v33 = 2654435761 * self->_distanceToRoute;
    if ((*(_BYTE *)&flags & 4) != 0)
      goto LABEL_6;
LABEL_12:
    v32 = 0;
    if ((*(_BYTE *)&flags & 0x80) != 0)
      goto LABEL_7;
    goto LABEL_13;
  }
LABEL_11:
  v33 = 0;
  if ((*(_BYTE *)&flags & 4) == 0)
    goto LABEL_12;
LABEL_6:
  v32 = 2654435761 * self->_distanceRemainingOnRoute;
  if ((*(_BYTE *)&flags & 0x80) != 0)
  {
LABEL_7:
    v31 = 2654435761 * self->_remainingTime;
    goto LABEL_14;
  }
LABEL_13:
  v31 = 0;
LABEL_14:
  v30 = -[GEOLocation hash](self->_location, "hash");
  v4 = self->_flags;
  if ((*(_WORD *)&v4 & 0x100) != 0)
  {
    v29 = 2654435761 * self->_routeLocationIndex;
    if ((*(_WORD *)&v4 & 0x200) != 0)
      goto LABEL_16;
LABEL_21:
    v9 = 0;
    goto LABEL_24;
  }
  v29 = 0;
  if ((*(_WORD *)&v4 & 0x200) == 0)
    goto LABEL_21;
LABEL_16:
  routeLocationOffset = self->_routeLocationOffset;
  v6 = routeLocationOffset;
  if (routeLocationOffset < 0.0)
    v6 = -routeLocationOffset;
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
LABEL_24:
  v28 = v9;
  if ((*(_BYTE *)&v4 & 1) != 0)
  {
    timestamp = self->_timestamp;
    v12 = -timestamp;
    if (timestamp >= 0.0)
      v12 = self->_timestamp;
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
  v27 = -[GEOLatLng hash](self->_routeMatchCoordinate, "hash");
  v15 = -[NSData hash](self->_routeID, "hash");
  if ((*((_BYTE *)&self->_flags + 1) & 8) != 0)
    v16 = 2654435761 * self->_guidancePromptsEnabled;
  else
    v16 = 0;
  v17 = PBRepeatedUInt32Hash();
  v18 = self->_flags;
  if ((*(_WORD *)&v18 & 0x4000) == 0)
  {
    v19 = 0;
    if ((*(_BYTE *)&v18 & 0x40) != 0)
      goto LABEL_37;
LABEL_40:
    v20 = 0;
    if ((*(_WORD *)&v18 & 0x1000) != 0)
      goto LABEL_38;
    goto LABEL_41;
  }
  v19 = 2654435761 * self->_lowGuidanceNavigation;
  if ((*(_BYTE *)&v18 & 0x40) == 0)
    goto LABEL_40;
LABEL_37:
  v20 = 2654435761 * self->_hapticsType;
  if ((*(_WORD *)&v18 & 0x1000) != 0)
  {
LABEL_38:
    v21 = 2654435761 * self->_isConnectedToCarplay;
    goto LABEL_42;
  }
LABEL_41:
  v21 = 0;
LABEL_42:
  v22 = -[GEOCompanionTransitAlightMessage hash](self->_alightMessage, "hash");
  v23 = self->_flags;
  if ((*(_WORD *)&v23 & 0x2000) != 0)
  {
    v24 = 2654435761 * self->_isOffline;
    if ((*(_BYTE *)&v23 & 2) != 0)
      goto LABEL_44;
LABEL_46:
    v25 = 0;
    return v35 ^ v36 ^ v34 ^ v33 ^ v32 ^ v31 ^ v29 ^ v28 ^ v10 ^ v30 ^ v27 ^ v15 ^ v16 ^ v17 ^ v19 ^ v20 ^ v21 ^ v22 ^ v24 ^ v25;
  }
  v24 = 0;
  if ((*(_BYTE *)&v23 & 2) == 0)
    goto LABEL_46;
LABEL_44:
  v25 = 2654435761 * self->_displayedStepID;
  return v35 ^ v36 ^ v34 ^ v33 ^ v32 ^ v31 ^ v29 ^ v28 ^ v10 ^ v30 ^ v27 ^ v15 ^ v16 ^ v17 ^ v19 ^ v20 ^ v21 ^ v22 ^ v24 ^ v25;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  int v5;
  GEOLocation *location;
  uint64_t v7;
  int v8;
  GEOLatLng *routeMatchCoordinate;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  id v14;
  int v15;
  GEOCompanionTransitAlightMessage *alightMessage;
  uint64_t v17;
  int v18;
  id v19;

  v19 = a3;
  objc_msgSend(v19, "readAll:", 0);
  v4 = v19;
  v5 = *((_DWORD *)v19 + 34);
  if ((v5 & 0x20) != 0)
  {
    self->_feedbackType = *((_DWORD *)v19 + 27);
    *(_DWORD *)&self->_flags |= 0x20u;
    v5 = *((_DWORD *)v19 + 34);
    if ((v5 & 0x400) == 0)
    {
LABEL_3:
      if ((v5 & 8) == 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else if ((v5 & 0x400) == 0)
  {
    goto LABEL_3;
  }
  self->_stepID = *((_DWORD *)v19 + 32);
  *(_DWORD *)&self->_flags |= 0x400u;
  v5 = *((_DWORD *)v19 + 34);
  if ((v5 & 8) == 0)
  {
LABEL_4:
    if ((v5 & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_14;
  }
LABEL_13:
  self->_distanceToManeuver = *((_DWORD *)v19 + 25);
  *(_DWORD *)&self->_flags |= 8u;
  v5 = *((_DWORD *)v19 + 34);
  if ((v5 & 0x10) == 0)
  {
LABEL_5:
    if ((v5 & 4) == 0)
      goto LABEL_6;
    goto LABEL_15;
  }
LABEL_14:
  self->_distanceToRoute = *((_DWORD *)v19 + 26);
  *(_DWORD *)&self->_flags |= 0x10u;
  v5 = *((_DWORD *)v19 + 34);
  if ((v5 & 4) == 0)
  {
LABEL_6:
    if ((v5 & 0x80) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_15:
  self->_distanceRemainingOnRoute = *((_DWORD *)v19 + 24);
  *(_DWORD *)&self->_flags |= 4u;
  if ((*((_DWORD *)v19 + 34) & 0x80) != 0)
  {
LABEL_7:
    self->_remainingTime = *((_DWORD *)v19 + 29);
    *(_DWORD *)&self->_flags |= 0x80u;
  }
LABEL_8:
  location = self->_location;
  v7 = *((_QWORD *)v19 + 6);
  if (location)
  {
    if (!v7)
      goto LABEL_20;
    -[GEOLocation mergeFrom:](location, "mergeFrom:");
  }
  else
  {
    if (!v7)
      goto LABEL_20;
    -[GEOCompanionRouteStatus setLocation:](self, "setLocation:");
  }
  v4 = v19;
LABEL_20:
  v8 = *((_DWORD *)v4 + 34);
  if ((v8 & 0x100) != 0)
  {
    self->_routeLocationIndex = *((_DWORD *)v4 + 30);
    *(_DWORD *)&self->_flags |= 0x100u;
    v8 = *((_DWORD *)v4 + 34);
    if ((v8 & 0x200) == 0)
    {
LABEL_22:
      if ((v8 & 1) == 0)
        goto LABEL_24;
      goto LABEL_23;
    }
  }
  else if ((v8 & 0x200) == 0)
  {
    goto LABEL_22;
  }
  self->_routeLocationOffset = *((float *)v4 + 31);
  *(_DWORD *)&self->_flags |= 0x200u;
  if ((*((_DWORD *)v4 + 34) & 1) != 0)
  {
LABEL_23:
    self->_timestamp = *((double *)v4 + 9);
    *(_DWORD *)&self->_flags |= 1u;
  }
LABEL_24:
  routeMatchCoordinate = self->_routeMatchCoordinate;
  v10 = *((_QWORD *)v4 + 8);
  if (routeMatchCoordinate)
  {
    if (!v10)
      goto LABEL_33;
    -[GEOLatLng mergeFrom:](routeMatchCoordinate, "mergeFrom:");
  }
  else
  {
    if (!v10)
      goto LABEL_33;
    -[GEOCompanionRouteStatus setRouteMatchCoordinate:](self, "setRouteMatchCoordinate:");
  }
  v4 = v19;
LABEL_33:
  if (*((_QWORD *)v4 + 7))
  {
    -[GEOCompanionRouteStatus setRouteID:](self, "setRouteID:");
    v4 = v19;
  }
  if ((*((_BYTE *)v4 + 137) & 8) != 0)
  {
    self->_guidancePromptsEnabled = *((_BYTE *)v4 + 132);
    *(_DWORD *)&self->_flags |= 0x800u;
  }
  v11 = objc_msgSend(v4, "selectedRideIndexsCount");
  if (v11)
  {
    v12 = v11;
    for (i = 0; i != v12; ++i)
      -[GEOCompanionRouteStatus addSelectedRideIndex:](self, "addSelectedRideIndex:", objc_msgSend(v19, "selectedRideIndexAtIndex:", i));
  }
  v14 = v19;
  v15 = *((_DWORD *)v19 + 34);
  if ((v15 & 0x4000) != 0)
  {
    self->_lowGuidanceNavigation = *((_BYTE *)v19 + 135);
    *(_DWORD *)&self->_flags |= 0x4000u;
    v15 = *((_DWORD *)v19 + 34);
    if ((v15 & 0x40) == 0)
    {
LABEL_42:
      if ((v15 & 0x1000) == 0)
        goto LABEL_44;
      goto LABEL_43;
    }
  }
  else if ((v15 & 0x40) == 0)
  {
    goto LABEL_42;
  }
  self->_hapticsType = *((_DWORD *)v19 + 28);
  *(_DWORD *)&self->_flags |= 0x40u;
  if ((*((_DWORD *)v19 + 34) & 0x1000) != 0)
  {
LABEL_43:
    self->_isConnectedToCarplay = *((_BYTE *)v19 + 133);
    *(_DWORD *)&self->_flags |= 0x1000u;
  }
LABEL_44:
  alightMessage = self->_alightMessage;
  v17 = *((_QWORD *)v19 + 5);
  if (alightMessage)
  {
    if (!v17)
      goto LABEL_53;
    -[GEOCompanionTransitAlightMessage mergeFrom:](alightMessage, "mergeFrom:");
  }
  else
  {
    if (!v17)
      goto LABEL_53;
    -[GEOCompanionRouteStatus setAlightMessage:](self, "setAlightMessage:");
  }
  v14 = v19;
LABEL_53:
  v18 = *((_DWORD *)v14 + 34);
  if ((v18 & 0x2000) != 0)
  {
    self->_isOffline = *((_BYTE *)v14 + 134);
    *(_DWORD *)&self->_flags |= 0x2000u;
    v18 = *((_DWORD *)v14 + 34);
  }
  if ((v18 & 2) != 0)
  {
    self->_displayedStepID = *((_DWORD *)v14 + 23);
    *(_DWORD *)&self->_flags |= 2u;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routeMatchCoordinate, 0);
  objc_storeStrong((id *)&self->_routeID, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_alightMessage, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

- (id)instanceCompatibleWithProtocolVersion:(unint64_t)a3
{
  BOOL v5;
  NSObject *v6;
  _BOOL4 v7;
  objc_class *v8;
  void *v9;
  GEOCompanionRouteStatus *v10;
  NSObject *v11;
  objc_class *v12;
  void *v13;
  unint64_t v14;
  unsigned int v15;
  objc_class *v16;
  void *v17;
  objc_class *v18;
  void *v19;
  int v21;
  void *v22;
  __int16 v23;
  GEOCompanionRouteStatus *v24;
  __int16 v25;
  unint64_t v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    GEOFindOrCreateLog("com.apple.GeoServices", "CompanionCompatibility");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v16 = (objc_class *)objc_opt_class();
      NSStringFromClass(v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138412802;
      v22 = v17;
      v23 = 2048;
      v24 = self;
      v25 = 2048;
      v26 = 0;
      _os_log_impl(&dword_1885A9000, v6, OS_LOG_TYPE_DEBUG, "%@<%p> is compatible with protocol version %lu", (uint8_t *)&v21, 0x20u);

    }
    goto LABEL_13;
  }
  v5 = -[GEOCompanionRouteStatus hasDisplayedStepID](self, "hasDisplayedStepID");
  GEOFindOrCreateLog("com.apple.GeoServices", "CompanionCompatibility");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
  if (a3 > 4 || !v5)
  {
    if (v7)
    {
      v18 = (objc_class *)objc_opt_class();
      NSStringFromClass(v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138412802;
      v22 = v19;
      v23 = 2048;
      v24 = self;
      v25 = 2048;
      v26 = a3;
      _os_log_impl(&dword_1885A9000, v6, OS_LOG_TYPE_DEBUG, "%@<%p> is compatible with protocol version %lu", (uint8_t *)&v21, 0x20u);

    }
LABEL_13:

    v10 = self;
    return v10;
  }
  if (v7)
  {
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 138412802;
    v22 = v9;
    v23 = 2048;
    v24 = self;
    v25 = 2048;
    v26 = a3;
    _os_log_impl(&dword_1885A9000, v6, OS_LOG_TYPE_DEBUG, "%@<%p> is not compatible with protocol version %lu", (uint8_t *)&v21, 0x20u);

  }
  v10 = (GEOCompanionRouteStatus *)-[GEOCompanionRouteStatus copy](self, "copy");
  GEOFindOrCreateLog("com.apple.GeoServices", "CompanionCompatibility");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[GEOCompanionRouteStatus displayedStepID](self, "displayedStepID");
    v15 = -[GEOCompanionRouteStatus stepID](self, "stepID");
    v21 = 138413058;
    v22 = v13;
    v23 = 2048;
    v24 = self;
    v25 = 2048;
    v26 = v14;
    v27 = 2048;
    v28 = v15;
    _os_log_impl(&dword_1885A9000, v11, OS_LOG_TYPE_INFO, "%@<%p> | Copying displayedStepID %lu into stepID (was %lu)", (uint8_t *)&v21, 0x2Au);

  }
  -[GEOCompanionRouteStatus setStepID:](v10, "setStepID:", -[GEOCompanionRouteStatus displayedStepID](v10, "displayedStepID"));
  return v10;
}

- (GEOCompanionRouteStatus)initWithRouteID:(id)a3
{
  id v4;
  GEOCompanionRouteStatus *v5;
  GEOCompanionRouteStatus *v6;
  GEOCompanionRouteStatus *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEOCompanionRouteStatus;
  v5 = -[GEOCompanionRouteStatus init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    -[GEOCompanionRouteStatus setRouteID:](v5, "setRouteID:", v4);
    v7 = v6;
  }

  return v6;
}

- (GEOCompanionRouteStatus)initWithRoute:(id)a3 routeID:(id)a4
{
  id v6;
  id v7;
  GEOCompanionRouteStatus *v8;
  double v9;
  void *v10;
  GEOCompanionRouteStatus *v11;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)GEOCompanionRouteStatus;
  v8 = -[GEOCompanionRouteStatus init](&v13, sel_init);
  if (v8)
  {
    -[GEOCompanionRouteStatus setRemainingTime:](v8, "setRemainingTime:", objc_msgSend(v6, "expectedTime"));
    objc_msgSend(v6, "distance");
    -[GEOCompanionRouteStatus setDistanceRemainingOnRoute:](v8, "setDistanceRemainingOnRoute:", v9);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "timeIntervalSinceReferenceDate");
    -[GEOCompanionRouteStatus setTimestamp:](v8, "setTimestamp:");

    -[GEOCompanionRouteStatus setRouteID:](v8, "setRouteID:", v7);
    -[GEOCompanionRouteStatus _updateClusteredSectionSelectedRideIndicesFromRoute:](v8, "_updateClusteredSectionSelectedRideIndicesFromRoute:", v6);
    v11 = v8;
  }

  return v8;
}

- (void)updateWithRoute:(id)a3 routeID:(id)a4
{
  id v6;
  double v7;
  void *v8;
  id v9;

  v6 = a4;
  v9 = a3;
  -[GEOCompanionRouteStatus setRemainingTime:](self, "setRemainingTime:", objc_msgSend(v9, "expectedTime"));
  objc_msgSend(v9, "distance");
  -[GEOCompanionRouteStatus setDistanceRemainingOnRoute:](self, "setDistanceRemainingOnRoute:", v7);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeIntervalSinceReferenceDate");
  -[GEOCompanionRouteStatus setTimestamp:](self, "setTimestamp:");

  -[GEOCompanionRouteStatus setRouteID:](self, "setRouteID:", v6);
  -[GEOCompanionRouteStatus setStepID:](self, "setStepID:", 0);
  -[GEOCompanionRouteStatus setHasStepID:](self, "setHasStepID:", 0);
  -[GEOCompanionRouteStatus setDistanceToManeuver:](self, "setDistanceToManeuver:", 0);
  -[GEOCompanionRouteStatus setHasDistanceToManeuver:](self, "setHasDistanceToManeuver:", 0);
  -[GEOCompanionRouteStatus setDistanceToRoute:](self, "setDistanceToRoute:", 0);
  -[GEOCompanionRouteStatus setHasDistanceToRoute:](self, "setHasDistanceToRoute:", 0);
  -[GEOCompanionRouteStatus _updateClusteredSectionSelectedRideIndicesFromRoute:](self, "_updateClusteredSectionSelectedRideIndicesFromRoute:", v9);

}

- (void)updateClusteredSectionSelectedRideIndicesFromRoute:(id)a3 routeID:(id)a4
{
  id v6;
  void *v7;
  int v8;
  id v9;

  v9 = a3;
  v6 = a4;
  -[GEOCompanionRouteStatus routeID](self, "routeID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqualToData:", v7);

  if (v8)
    -[GEOCompanionRouteStatus _updateClusteredSectionSelectedRideIndicesFromRoute:](self, "_updateClusteredSectionSelectedRideIndicesFromRoute:", v9);

}

- (void)_updateClusteredSectionSelectedRideIndicesFromRoute:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[GEOCompanionRouteStatus clearSelectedRideIndexs](self, "clearSelectedRideIndexs");
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(v4, "rideSelections", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        -[GEOCompanionRouteStatus addSelectedRideIndex:](self, "addSelectedRideIndex:", objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "unsignedIntValue"));
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)updateFeedbackWithNavigationState:(int)a3 locationUnreliable:(BOOL)a4 announcementStage:(unint64_t)a5 nextAnnouncementStage:(unint64_t)a6 nextAnnouncementTime:(double)a7
{
  __int16 v8;
  __int16 v9;
  uint64_t v11;
  void *v13;
  uint64_t v14;

  v8 = a6;
  v9 = a5;
  v11 = *(_QWORD *)&a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "timeIntervalSinceReferenceDate");
  -[GEOCompanionRouteStatus setTimestamp:](self, "setTimestamp:");

  if (a4)
  {
    v11 = 6;
  }
  else
  {
    switch((int)v11)
    {
      case 0:
        break;
      case 1:
      case 3:
      case 8:
        v11 = 1;
        break;
      case 2:
        if ((unsigned __int16)(v9 - 2) > 3u)
          v14 = 2;
        else
          v14 = dword_189CD8B20[(__int16)(v9 - 2)];
        -[GEOCompanionRouteStatus setFeedbackType:](self, "setFeedbackType:", v14);
        if (a7 > 2.0 || v8 != 5)
          return;
        v11 = 9;
        break;
      case 4:
      case 5:
        v11 = 5;
        break;
      case 6:
      case 7:
        v11 = 7;
        break;
      default:
        return;
    }
  }
  -[GEOCompanionRouteStatus setFeedbackType:](self, "setFeedbackType:", v11);
}

- (BOOL)hasArrivedAtIntermediateWaypointInRoute:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  BOOL v7;
  void *v8;
  unint64_t v9;

  v4 = a3;
  if (-[GEOCompanionRouteStatus feedbackType](self, "feedbackType") == 7)
  {
    objc_msgSend(v4, "stepWithID:", -[GEOCompanionRouteStatus effectiveStepID](self, "effectiveStepID"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "hasLegID"))
      v6 = objc_msgSend(v5, "legID") + 1;
    else
      v6 = 0;
    objc_msgSend(v4, "waypoints");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count") - 1;

    v7 = v6 < v9;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)isNavigating
{
  int v3;

  v3 = -[GEOCompanionRouteStatus hasFeedbackType](self, "hasFeedbackType");
  if (v3)
  {
    v3 = -[GEOCompanionRouteStatus feedbackType](self, "feedbackType");
    if (v3)
      LOBYTE(v3) = -[GEOCompanionRouteStatus feedbackType](self, "feedbackType") != 8;
  }
  return v3;
}

- (BOOL)isRecalculating
{
  _BOOL4 v3;

  v3 = -[GEOCompanionRouteStatus hasFeedbackType](self, "hasFeedbackType");
  if (v3)
    LOBYTE(v3) = -[GEOCompanionRouteStatus feedbackType](self, "feedbackType") == 5;
  return v3;
}

- (BOOL)hasEffectiveStepID
{
  int v3;

  v3 = -[GEOCompanionRouteStatus feedbackType](self, "feedbackType");
  return v3 == 1 || v3 == 8 || -[GEOCompanionRouteStatus hasStepID](self, "hasStepID");
}

- (unsigned)effectiveStepID
{
  int v3;

  v3 = -[GEOCompanionRouteStatus feedbackType](self, "feedbackType");
  if (v3 == 1 || v3 == 8)
    return 0;
  else
    return -[GEOCompanionRouteStatus stepID](self, "stepID");
}

- (unsigned)effectiveStepIDInRoute:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;

  v4 = a3;
  objc_msgSend(v4, "stepWithID:", -[GEOCompanionRouteStatus effectiveStepID](self, "effectiveStepID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v6 = objc_msgSend(v5, "stepID");
  else
    v6 = -1;

  return v6;
}

- (BOOL)hasEffectiveDistanceToManeuver
{
  if (-[GEOCompanionRouteStatus feedbackType](self, "feedbackType") == 1)
    return -[GEOCompanionRouteStatus hasDistanceToRoute](self, "hasDistanceToRoute");
  else
    return -[GEOCompanionRouteStatus hasDistanceToManeuver](self, "hasDistanceToManeuver");
}

- (unsigned)effectiveDistanceToManeuver
{
  if (-[GEOCompanionRouteStatus feedbackType](self, "feedbackType") == 1)
    return -[GEOCompanionRouteStatus distanceToRoute](self, "distanceToRoute");
  else
    return -[GEOCompanionRouteStatus distanceToManeuver](self, "distanceToManeuver");
}

- (NSArray)selectedRideIndices
{
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[GEOCompanionRouteStatus selectedRideIndexsCount](self, "selectedRideIndexsCount"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[GEOCompanionRouteStatus selectedRideIndexsCount](self, "selectedRideIndexsCount"))
  {
    v4 = 0;
    do
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[GEOCompanionRouteStatus selectedRideIndexAtIndex:](self, "selectedRideIndexAtIndex:", v4));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v5);

      ++v4;
    }
    while (v4 < -[GEOCompanionRouteStatus selectedRideIndexsCount](self, "selectedRideIndexsCount"));
  }
  v6 = (void *)objc_msgSend(v3, "copy");

  return (NSArray *)v6;
}

@end
