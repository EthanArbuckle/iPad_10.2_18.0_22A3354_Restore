@implementation GEOStepFeedback

- (GEOStepFeedback)init
{
  GEOStepFeedback *v2;
  GEOStepFeedback *v3;
  GEOStepFeedback *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOStepFeedback;
  v2 = -[GEOStepFeedback init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOStepFeedback)initWithData:(id)a3
{
  GEOStepFeedback *v3;
  GEOStepFeedback *v4;
  GEOStepFeedback *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOStepFeedback;
  v3 = -[GEOStepFeedback initWithData:](&v7, sel_initWithData_, a3);
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
  *(_DWORD *)&self->_flags |= 0x20020u;
  self->_stepID = a3;
}

- (void)setHasStepID:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 131104;
  else
    v3 = 0x20000;
  self->_flags = ($B5D046ADD8212AB5E9D0A6721CC205DC)(*(_DWORD *)&self->_flags & 0xFFFFFFDF | v3);
}

- (BOOL)hasStepID
{
  return (*(_BYTE *)&self->_flags >> 5) & 1;
}

- (double)completionTimeStamp
{
  return self->_completionTimeStamp;
}

- (void)setCompletionTimeStamp:(double)a3
{
  *(_DWORD *)&self->_flags |= 0x20001u;
  self->_completionTimeStamp = a3;
}

- (void)setHasCompletionTimeStamp:(BOOL)a3
{
  self->_flags = ($B5D046ADD8212AB5E9D0A6721CC205DC)(*(_DWORD *)&self->_flags & 0xFFFFFFFE | a3 | 0x20000);
}

- (BOOL)hasCompletionTimeStamp
{
  return *(_DWORD *)&self->_flags & 1;
}

- (BOOL)completedStep
{
  return self->_completedStep;
}

- (void)setCompletedStep:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x20100u;
  self->_completedStep = a3;
}

- (void)setHasCompletedStep:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 131328;
  else
    v3 = 0x20000;
  self->_flags = ($B5D046ADD8212AB5E9D0A6721CC205DC)(*(_DWORD *)&self->_flags & 0xFFFFFEFF | v3);
}

- (BOOL)hasCompletedStep
{
  return *((_BYTE *)&self->_flags + 1) & 1;
}

- (void)_readRouteID
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_BYTE *)(a1 + 113) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOStepFeedbackReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRouteID_tags_946);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasRouteID
{
  -[GEOStepFeedback _readRouteID]((uint64_t)self);
  return self->_routeID != 0;
}

- (NSData)routeID
{
  -[GEOStepFeedback _readRouteID]((uint64_t)self);
  return self->_routeID;
}

- (void)setRouteID:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x24000u;
  objc_storeStrong((id *)&self->_routeID, a3);
}

- (unsigned)routeIndex
{
  return self->_routeIndex;
}

- (void)setRouteIndex:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x20010u;
  self->_routeIndex = a3;
}

- (void)setHasRouteIndex:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 131088;
  else
    v3 = 0x20000;
  self->_flags = ($B5D046ADD8212AB5E9D0A6721CC205DC)(*(_DWORD *)&self->_flags & 0xFFFFFFEF | v3);
}

- (BOOL)hasRouteIndex
{
  return (*(_BYTE *)&self->_flags >> 4) & 1;
}

- (BOOL)lightGuidance
{
  return self->_lightGuidance;
}

- (void)setLightGuidance:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x20200u;
  self->_lightGuidance = a3;
}

- (void)setHasLightGuidance:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 131584;
  else
    v3 = 0x20000;
  self->_flags = ($B5D046ADD8212AB5E9D0A6721CC205DC)(*(_DWORD *)&self->_flags & 0xFFFFFDFF | v3);
}

- (BOOL)hasLightGuidance
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 1) & 1;
}

- (void)_readTripID
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_BYTE *)(a1 + 114) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOStepFeedbackReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTripID_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasTripID
{
  -[GEOStepFeedback _readTripID]((uint64_t)self);
  return self->_tripID != 0;
}

- (NSData)tripID
{
  -[GEOStepFeedback _readTripID]((uint64_t)self);
  return self->_tripID;
}

- (void)setTripID:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x30000u;
  objc_storeStrong((id *)&self->_tripID, a3);
}

- (BOOL)routePaused
{
  return self->_routePaused;
}

- (void)setRoutePaused:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x20400u;
  self->_routePaused = a3;
}

- (void)setHasRoutePaused:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 132096;
  else
    v3 = 0x20000;
  self->_flags = ($B5D046ADD8212AB5E9D0A6721CC205DC)(*(_DWORD *)&self->_flags & 0xFFFFFBFF | v3);
}

- (BOOL)hasRoutePaused
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 2) & 1;
}

- (BOOL)routeResumed
{
  return self->_routeResumed;
}

- (void)setRouteResumed:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x20800u;
  self->_routeResumed = a3;
}

- (void)setHasRouteResumed:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 133120;
  else
    v3 = 0x20000;
  self->_flags = ($B5D046ADD8212AB5E9D0A6721CC205DC)(*(_DWORD *)&self->_flags & 0xFFFFF7FF | v3);
}

- (BOOL)hasRouteResumed
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 3) & 1;
}

- (void)_readEvStepInfo
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_BYTE *)(a1 + 113) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOStepFeedbackReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readEvStepInfo_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasEvStepInfo
{
  -[GEOStepFeedback _readEvStepInfo]((uint64_t)self);
  return self->_evStepInfo != 0;
}

- (GEOEVStepFeedbackInfo)evStepInfo
{
  -[GEOStepFeedback _readEvStepInfo]((uint64_t)self);
  return self->_evStepInfo;
}

- (void)setEvStepInfo:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x22000u;
  objc_storeStrong((id *)&self->_evStepInfo, a3);
}

- (unsigned)waypointRouteID
{
  return self->_waypointRouteID;
}

- (void)setWaypointRouteID:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x20080u;
  self->_waypointRouteID = a3;
}

- (void)setHasWaypointRouteID:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 131200;
  else
    v3 = 0x20000;
  self->_flags = ($B5D046ADD8212AB5E9D0A6721CC205DC)(*(_DWORD *)&self->_flags & 0xFFFFFF7F | v3);
}

- (BOOL)hasWaypointRouteID
{
  return *(_BYTE *)&self->_flags >> 7;
}

- (int)maneuverType
{
  os_unfair_lock_s *p_readerLock;
  $B5D046ADD8212AB5E9D0A6721CC205DC flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_BYTE *)&flags & 8) != 0)
    return self->_maneuverType;
  else
    return 0;
}

- (void)setManeuverType:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x20008u;
  self->_maneuverType = a3;
}

- (void)setHasManeuverType:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 131080;
  else
    v3 = 0x20000;
  self->_flags = ($B5D046ADD8212AB5E9D0A6721CC205DC)(*(_DWORD *)&self->_flags & 0xFFFFFFF7 | v3);
}

- (BOOL)hasManeuverType
{
  return (*(_BYTE *)&self->_flags >> 3) & 1;
}

- (id)maneuverTypeAsString:(int)a3
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

- (int)StringAsManeuverType:(id)a3
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

- (unsigned)expectedTime
{
  return self->_expectedTime;
}

- (void)setExpectedTime:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x20004u;
  self->_expectedTime = a3;
}

- (void)setHasExpectedTime:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 131076;
  else
    v3 = 0x20000;
  self->_flags = ($B5D046ADD8212AB5E9D0A6721CC205DC)(*(_DWORD *)&self->_flags & 0xFFFFFFFB | v3);
}

- (BOOL)hasExpectedTime
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (void)_readStepZilch
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_BYTE *)(a1 + 113) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOStepFeedbackReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readStepZilch_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasStepZilch
{
  -[GEOStepFeedback _readStepZilch]((uint64_t)self);
  return self->_stepZilch != 0;
}

- (NSData)stepZilch
{
  -[GEOStepFeedback _readStepZilch]((uint64_t)self);
  return self->_stepZilch;
}

- (void)setStepZilch:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x28000u;
  objc_storeStrong((id *)&self->_stepZilch, a3);
}

- (int)stepEndPathPointIndex
{
  return self->_stepEndPathPointIndex;
}

- (void)setStepEndPathPointIndex:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x20040u;
  self->_stepEndPathPointIndex = a3;
}

- (void)setHasStepEndPathPointIndex:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 131136;
  else
    v3 = 0x20000;
  self->_flags = ($B5D046ADD8212AB5E9D0A6721CC205DC)(*(_DWORD *)&self->_flags & 0xFFFFFFBF | v3);
}

- (BOOL)hasStepEndPathPointIndex
{
  return (*(_BYTE *)&self->_flags >> 6) & 1;
}

- (double)stepEndPathPointOffset
{
  return self->_stepEndPathPointOffset;
}

- (void)setStepEndPathPointOffset:(double)a3
{
  *(_DWORD *)&self->_flags |= 0x20002u;
  self->_stepEndPathPointOffset = a3;
}

- (void)setHasStepEndPathPointOffset:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 131074;
  else
    v3 = 0x20000;
  self->_flags = ($B5D046ADD8212AB5E9D0A6721CC205DC)(*(_DWORD *)&self->_flags & 0xFFFDFFFD | v3);
}

- (BOOL)hasStepEndPathPointOffset
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (void)_readEtaTrafficUpdateResponseId
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_BYTE *)(a1 + 113) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOStepFeedbackReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readEtaTrafficUpdateResponseId_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasEtaTrafficUpdateResponseId
{
  -[GEOStepFeedback _readEtaTrafficUpdateResponseId]((uint64_t)self);
  return self->_etaTrafficUpdateResponseId != 0;
}

- (NSData)etaTrafficUpdateResponseId
{
  -[GEOStepFeedback _readEtaTrafficUpdateResponseId]((uint64_t)self);
  return self->_etaTrafficUpdateResponseId;
}

- (void)setEtaTrafficUpdateResponseId:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x21000u;
  objc_storeStrong((id *)&self->_etaTrafficUpdateResponseId, a3);
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
  v8.super_class = (Class)GEOStepFeedback;
  -[GEOStepFeedback description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOStepFeedback dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOStepFeedback _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  const __CFString *v27;
  int v28;
  void *v29;
  const __CFString *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  __CFString *v35;
  int v36;
  void *v37;
  const __CFString *v38;
  void *v39;
  const __CFString *v40;
  void *v41;
  void *v42;
  void *v43;
  const __CFString *v45;

  if (!a1)
  {
    v4 = 0;
    return v4;
  }
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_DWORD *)(a1 + 112);
  if ((v5 & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 96));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("stepID"));

    v5 = *(_DWORD *)(a1 + 112);
  }
  if ((v5 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 16));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("completionTimeStamp"));

    v5 = *(_DWORD *)(a1 + 112);
  }
  if ((v5 & 0x100) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 108));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("completedStep"));

  }
  objc_msgSend((id)a1, "routeID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v9, "base64EncodedStringWithOptions:", 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("routeID"));

    }
    else
    {
      objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("routeID"));
    }
  }

  v12 = *(_DWORD *)(a1 + 112);
  if ((v12 & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 92));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("routeIndex"));

    v12 = *(_DWORD *)(a1 + 112);
  }
  if ((v12 & 0x200) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 109));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v15 = CFSTR("lightGuidance");
    else
      v15 = CFSTR("light_guidance");
    objc_msgSend(v4, "setObject:forKey:", v14, v15);

  }
  objc_msgSend((id)a1, "tripID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v16)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v16, "base64EncodedStringWithOptions:", 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v18, CFSTR("tripID"));

    }
    else
    {
      objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("tripID"));
    }
  }

  v19 = *(_DWORD *)(a1 + 112);
  if ((v19 & 0x400) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 110));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v21 = CFSTR("routePaused");
    else
      v21 = CFSTR("route_paused");
    objc_msgSend(v4, "setObject:forKey:", v20, v21);

    v19 = *(_DWORD *)(a1 + 112);
  }
  if ((v19 & 0x800) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 111));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v23 = CFSTR("routeResumed");
    else
      v23 = CFSTR("route_resumed");
    objc_msgSend(v4, "setObject:forKey:", v22, v23);

  }
  objc_msgSend((id)a1, "evStepInfo");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v24;
  if (v24)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v24, "jsonRepresentation");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = CFSTR("evStepInfo");
    }
    else
    {
      objc_msgSend(v24, "dictionaryRepresentation");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = CFSTR("ev_step_info");
    }
    objc_msgSend(v4, "setObject:forKey:", v26, v27);

  }
  v28 = *(_DWORD *)(a1 + 112);
  if ((v28 & 0x80) == 0)
  {
    if ((v28 & 8) == 0)
      goto LABEL_40;
LABEL_49:
    v35 = CFSTR("NO_TURN");
    switch(*(_DWORD *)(a1 + 88))
    {
      case 0:
        break;
      case 1:
        v35 = CFSTR("LEFT_TURN");
        break;
      case 2:
        v35 = CFSTR("RIGHT_TURN");
        break;
      case 3:
        v35 = CFSTR("STRAIGHT_AHEAD");
        break;
      case 4:
        v35 = CFSTR("U_TURN");
        break;
      case 5:
        v35 = CFSTR("FOLLOW_ROAD");
        break;
      case 6:
        v35 = CFSTR("ENTER_ROUNDABOUT");
        break;
      case 7:
        v35 = CFSTR("EXIT_ROUNDABOUT");
        break;
      case 0xB:
        v35 = CFSTR("OFF_RAMP");
        break;
      case 0xC:
        v35 = CFSTR("ON_RAMP");
        break;
      case 0x10:
        v35 = CFSTR("ARRIVE_END_OF_NAVIGATION");
        break;
      case 0x11:
        v35 = CFSTR("START_ROUTE");
        break;
      case 0x12:
        v35 = CFSTR("ARRIVE_AT_DESTINATION");
        break;
      case 0x14:
        v35 = CFSTR("KEEP_LEFT");
        break;
      case 0x15:
        v35 = CFSTR("KEEP_RIGHT");
        break;
      case 0x16:
        v35 = CFSTR("ENTER_FERRY");
        break;
      case 0x17:
        v35 = CFSTR("EXIT_FERRY");
        break;
      case 0x18:
        v35 = CFSTR("CHANGE_FERRY");
        break;
      case 0x19:
        v35 = CFSTR("START_ROUTE_WITH_U_TURN");
        break;
      case 0x1A:
        v35 = CFSTR("U_TURN_AT_ROUNDABOUT");
        break;
      case 0x1B:
        v35 = CFSTR("LEFT_TURN_AT_END");
        break;
      case 0x1C:
        v35 = CFSTR("RIGHT_TURN_AT_END");
        break;
      case 0x1D:
        v35 = CFSTR("HIGHWAY_OFF_RAMP_LEFT");
        break;
      case 0x1E:
        v35 = CFSTR("HIGHWAY_OFF_RAMP_RIGHT");
        break;
      case 0x21:
        v35 = CFSTR("ARRIVE_AT_DESTINATION_LEFT");
        break;
      case 0x22:
        v35 = CFSTR("ARRIVE_AT_DESTINATION_RIGHT");
        break;
      case 0x23:
        v35 = CFSTR("U_TURN_WHEN_POSSIBLE");
        break;
      case 0x27:
        v35 = CFSTR("ARRIVE_END_OF_DIRECTIONS");
        break;
      case 0x29:
        v35 = CFSTR("ROUNDABOUT_EXIT_1");
        break;
      case 0x2A:
        v35 = CFSTR("ROUNDABOUT_EXIT_2");
        break;
      case 0x2B:
        v35 = CFSTR("ROUNDABOUT_EXIT_3");
        break;
      case 0x2C:
        v35 = CFSTR("ROUNDABOUT_EXIT_4");
        break;
      case 0x2D:
        v35 = CFSTR("ROUNDABOUT_EXIT_5");
        break;
      case 0x2E:
        v35 = CFSTR("ROUNDABOUT_EXIT_6");
        break;
      case 0x2F:
        v35 = CFSTR("ROUNDABOUT_EXIT_7");
        break;
      case 0x30:
        v35 = CFSTR("ROUNDABOUT_EXIT_8");
        break;
      case 0x31:
        v35 = CFSTR("ROUNDABOUT_EXIT_9");
        break;
      case 0x32:
        v35 = CFSTR("ROUNDABOUT_EXIT_10");
        break;
      case 0x33:
        v35 = CFSTR("ROUNDABOUT_EXIT_11");
        break;
      case 0x34:
        v35 = CFSTR("ROUNDABOUT_EXIT_12");
        break;
      case 0x35:
        v35 = CFSTR("ROUNDABOUT_EXIT_13");
        break;
      case 0x36:
        v35 = CFSTR("ROUNDABOUT_EXIT_14");
        break;
      case 0x37:
        v35 = CFSTR("ROUNDABOUT_EXIT_15");
        break;
      case 0x38:
        v35 = CFSTR("ROUNDABOUT_EXIT_16");
        break;
      case 0x39:
        v35 = CFSTR("ROUNDABOUT_EXIT_17");
        break;
      case 0x3A:
        v35 = CFSTR("ROUNDABOUT_EXIT_18");
        break;
      case 0x3B:
        v35 = CFSTR("ROUNDABOUT_EXIT_19");
        break;
      case 0x3C:
        v35 = CFSTR("SHARP_LEFT_TURN");
        break;
      case 0x3D:
        v35 = CFSTR("SHARP_RIGHT_TURN");
        break;
      case 0x3E:
        v35 = CFSTR("SLIGHT_LEFT_TURN");
        break;
      case 0x3F:
        v35 = CFSTR("SLIGHT_RIGHT_TURN");
        break;
      case 0x40:
        v35 = CFSTR("CHANGE_HIGHWAY");
        break;
      case 0x41:
        v35 = CFSTR("CHANGE_HIGHWAY_LEFT");
        break;
      case 0x42:
        v35 = CFSTR("CHANGE_HIGHWAY_RIGHT");
        break;
      case 0x50:
        v35 = CFSTR("TOLL_STATION");
        break;
      case 0x51:
        v35 = CFSTR("ENTER_TUNNEL");
        break;
      case 0x52:
        v35 = CFSTR("WAYPOINT_STOP");
        break;
      case 0x53:
        v35 = CFSTR("WAYPOINT_STOP_LEFT");
        break;
      case 0x54:
        v35 = CFSTR("WAYPOINT_STOP_RIGHT");
        break;
      case 0x55:
        v35 = CFSTR("RESUME_ROUTE");
        break;
      case 0x56:
        v35 = CFSTR("RESUME_ROUTE_WITH_U_TURN");
        break;
      case 0x57:
        v35 = CFSTR("CUSTOM");
        break;
      case 0x58:
        v35 = CFSTR("TURN_AROUND");
        break;
      default:
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 88));
        v35 = (__CFString *)objc_claimAutoreleasedReturnValue();
        break;
    }
    if (a2)
      v45 = CFSTR("maneuverType");
    else
      v45 = CFSTR("maneuver_type");
    objc_msgSend(v4, "setObject:forKey:", v35, v45);

    if ((*(_DWORD *)(a1 + 112) & 4) == 0)
      goto LABEL_45;
    goto LABEL_41;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 104));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v34, CFSTR("waypointRouteID"));

  v28 = *(_DWORD *)(a1 + 112);
  if ((v28 & 8) != 0)
    goto LABEL_49;
LABEL_40:
  if ((v28 & 4) != 0)
  {
LABEL_41:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 84));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v30 = CFSTR("expectedTime");
    else
      v30 = CFSTR("expected_time");
    objc_msgSend(v4, "setObject:forKey:", v29, v30);

  }
LABEL_45:
  objc_msgSend((id)a1, "stepZilch");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v31;
  if (v31)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v31, "base64EncodedStringWithOptions:", 0);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v33, CFSTR("stepZilch"));

    }
    else
    {
      objc_msgSend(v4, "setObject:forKey:", v31, CFSTR("step_zilch"));
    }
  }

  v36 = *(_DWORD *)(a1 + 112);
  if ((v36 & 0x40) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 100));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v38 = CFSTR("stepEndPathPointIndex");
    else
      v38 = CFSTR("step_end_path_point_index");
    objc_msgSend(v4, "setObject:forKey:", v37, v38);

    v36 = *(_DWORD *)(a1 + 112);
  }
  if ((v36 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 48));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v40 = CFSTR("stepEndPathPointOffset");
    else
      v40 = CFSTR("step_end_path_point_offset");
    objc_msgSend(v4, "setObject:forKey:", v39, v40);

  }
  objc_msgSend((id)a1, "etaTrafficUpdateResponseId");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = v41;
  if (v41)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v41, "base64EncodedStringWithOptions:", 0);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v43, CFSTR("etaTrafficUpdateResponseId"));

    }
    else
    {
      objc_msgSend(v4, "setObject:forKey:", v41, CFSTR("eta_traffic_update_response_id"));
    }
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOStepFeedback _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOStepFeedback)initWithDictionary:(id)a3
{
  return (GEOStepFeedback *)-[GEOStepFeedback _initWithDictionary:isJSON:](self, a3, 0);
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
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  GEOEVStepFeedbackInfo *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  id v28;
  uint64_t v29;
  const __CFString *v30;
  void *v31;
  const __CFString *v32;
  void *v33;
  void *v34;
  const __CFString *v35;
  void *v36;
  const __CFString *v37;
  void *v38;
  const __CFString *v39;
  void *v40;
  void *v41;

  v5 = a2;
  if (!a1)
    goto LABEL_201;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_201;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("stepID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setStepID:", objc_msgSend(v6, "unsignedIntValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("completionTimeStamp"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v7, "doubleValue");
    objc_msgSend(a1, "setCompletionTimeStamp:");
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("completedStep"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setCompletedStep:", objc_msgSend(v8, "BOOLValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("routeID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v9, 0);
    objc_msgSend(a1, "setRouteID:", v10);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("routeIndex"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setRouteIndex:", objc_msgSend(v11, "unsignedIntValue"));

  if (a3)
    v12 = CFSTR("lightGuidance");
  else
    v12 = CFSTR("light_guidance");
  objc_msgSend(v5, "objectForKeyedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setLightGuidance:", objc_msgSend(v13, "BOOLValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("tripID"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v14, 0);
    objc_msgSend(a1, "setTripID:", v15);

  }
  if (a3)
    v16 = CFSTR("routePaused");
  else
    v16 = CFSTR("route_paused");
  objc_msgSend(v5, "objectForKeyedSubscript:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setRoutePaused:", objc_msgSend(v17, "BOOLValue"));

  if (a3)
    v18 = CFSTR("routeResumed");
  else
    v18 = CFSTR("route_resumed");
  objc_msgSend(v5, "objectForKeyedSubscript:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setRouteResumed:", objc_msgSend(v19, "BOOLValue"));

  if (a3)
    v20 = CFSTR("evStepInfo");
  else
    v20 = CFSTR("ev_step_info");
  objc_msgSend(v5, "objectForKeyedSubscript:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v22 = [GEOEVStepFeedbackInfo alloc];
    if ((a3 & 1) != 0)
      v23 = -[GEOEVStepFeedbackInfo initWithJSON:](v22, "initWithJSON:", v21);
    else
      v23 = -[GEOEVStepFeedbackInfo initWithDictionary:](v22, "initWithDictionary:", v21);
    v24 = (void *)v23;
    objc_msgSend(a1, "setEvStepInfo:", v23);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("waypointRouteID"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setWaypointRouteID:", objc_msgSend(v25, "unsignedIntValue"));

  if (a3)
    v26 = CFSTR("maneuverType");
  else
    v26 = CFSTR("maneuver_type");
  objc_msgSend(v5, "objectForKeyedSubscript:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v28 = v27;
    if ((objc_msgSend(v28, "isEqualToString:", CFSTR("NO_TURN")) & 1) != 0)
    {
      v29 = 0;
    }
    else if ((objc_msgSend(v28, "isEqualToString:", CFSTR("LEFT_TURN")) & 1) != 0)
    {
      v29 = 1;
    }
    else if ((objc_msgSend(v28, "isEqualToString:", CFSTR("RIGHT_TURN")) & 1) != 0)
    {
      v29 = 2;
    }
    else if ((objc_msgSend(v28, "isEqualToString:", CFSTR("STRAIGHT_AHEAD")) & 1) != 0)
    {
      v29 = 3;
    }
    else if ((objc_msgSend(v28, "isEqualToString:", CFSTR("U_TURN")) & 1) != 0)
    {
      v29 = 4;
    }
    else if ((objc_msgSend(v28, "isEqualToString:", CFSTR("FOLLOW_ROAD")) & 1) != 0)
    {
      v29 = 5;
    }
    else if ((objc_msgSend(v28, "isEqualToString:", CFSTR("ENTER_ROUNDABOUT")) & 1) != 0)
    {
      v29 = 6;
    }
    else if ((objc_msgSend(v28, "isEqualToString:", CFSTR("EXIT_ROUNDABOUT")) & 1) != 0)
    {
      v29 = 7;
    }
    else if ((objc_msgSend(v28, "isEqualToString:", CFSTR("OFF_RAMP")) & 1) != 0)
    {
      v29 = 11;
    }
    else if ((objc_msgSend(v28, "isEqualToString:", CFSTR("ON_RAMP")) & 1) != 0)
    {
      v29 = 12;
    }
    else if ((objc_msgSend(v28, "isEqualToString:", CFSTR("ARRIVE_END_OF_NAVIGATION")) & 1) != 0)
    {
      v29 = 16;
    }
    else if ((objc_msgSend(v28, "isEqualToString:", CFSTR("START_ROUTE")) & 1) != 0)
    {
      v29 = 17;
    }
    else if ((objc_msgSend(v28, "isEqualToString:", CFSTR("ARRIVE_AT_DESTINATION")) & 1) != 0)
    {
      v29 = 18;
    }
    else if ((objc_msgSend(v28, "isEqualToString:", CFSTR("KEEP_LEFT")) & 1) != 0)
    {
      v29 = 20;
    }
    else if ((objc_msgSend(v28, "isEqualToString:", CFSTR("KEEP_RIGHT")) & 1) != 0)
    {
      v29 = 21;
    }
    else if ((objc_msgSend(v28, "isEqualToString:", CFSTR("ENTER_FERRY")) & 1) != 0)
    {
      v29 = 22;
    }
    else if ((objc_msgSend(v28, "isEqualToString:", CFSTR("EXIT_FERRY")) & 1) != 0)
    {
      v29 = 23;
    }
    else if ((objc_msgSend(v28, "isEqualToString:", CFSTR("CHANGE_FERRY")) & 1) != 0)
    {
      v29 = 24;
    }
    else if ((objc_msgSend(v28, "isEqualToString:", CFSTR("START_ROUTE_WITH_U_TURN")) & 1) != 0)
    {
      v29 = 25;
    }
    else if ((objc_msgSend(v28, "isEqualToString:", CFSTR("U_TURN_AT_ROUNDABOUT")) & 1) != 0)
    {
      v29 = 26;
    }
    else if ((objc_msgSend(v28, "isEqualToString:", CFSTR("LEFT_TURN_AT_END")) & 1) != 0)
    {
      v29 = 27;
    }
    else if ((objc_msgSend(v28, "isEqualToString:", CFSTR("RIGHT_TURN_AT_END")) & 1) != 0)
    {
      v29 = 28;
    }
    else if ((objc_msgSend(v28, "isEqualToString:", CFSTR("HIGHWAY_OFF_RAMP_LEFT")) & 1) != 0)
    {
      v29 = 29;
    }
    else if ((objc_msgSend(v28, "isEqualToString:", CFSTR("HIGHWAY_OFF_RAMP_RIGHT")) & 1) != 0)
    {
      v29 = 30;
    }
    else if ((objc_msgSend(v28, "isEqualToString:", CFSTR("ARRIVE_AT_DESTINATION_LEFT")) & 1) != 0)
    {
      v29 = 33;
    }
    else if ((objc_msgSend(v28, "isEqualToString:", CFSTR("ARRIVE_AT_DESTINATION_RIGHT")) & 1) != 0)
    {
      v29 = 34;
    }
    else if ((objc_msgSend(v28, "isEqualToString:", CFSTR("U_TURN_WHEN_POSSIBLE")) & 1) != 0)
    {
      v29 = 35;
    }
    else if ((objc_msgSend(v28, "isEqualToString:", CFSTR("ARRIVE_END_OF_DIRECTIONS")) & 1) != 0)
    {
      v29 = 39;
    }
    else if ((objc_msgSend(v28, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_1")) & 1) != 0)
    {
      v29 = 41;
    }
    else if ((objc_msgSend(v28, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_2")) & 1) != 0)
    {
      v29 = 42;
    }
    else if ((objc_msgSend(v28, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_3")) & 1) != 0)
    {
      v29 = 43;
    }
    else if ((objc_msgSend(v28, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_4")) & 1) != 0)
    {
      v29 = 44;
    }
    else if ((objc_msgSend(v28, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_5")) & 1) != 0)
    {
      v29 = 45;
    }
    else if ((objc_msgSend(v28, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_6")) & 1) != 0)
    {
      v29 = 46;
    }
    else if ((objc_msgSend(v28, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_7")) & 1) != 0)
    {
      v29 = 47;
    }
    else if ((objc_msgSend(v28, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_8")) & 1) != 0)
    {
      v29 = 48;
    }
    else if ((objc_msgSend(v28, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_9")) & 1) != 0)
    {
      v29 = 49;
    }
    else if ((objc_msgSend(v28, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_10")) & 1) != 0)
    {
      v29 = 50;
    }
    else if ((objc_msgSend(v28, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_11")) & 1) != 0)
    {
      v29 = 51;
    }
    else if ((objc_msgSend(v28, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_12")) & 1) != 0)
    {
      v29 = 52;
    }
    else if ((objc_msgSend(v28, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_13")) & 1) != 0)
    {
      v29 = 53;
    }
    else if ((objc_msgSend(v28, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_14")) & 1) != 0)
    {
      v29 = 54;
    }
    else if ((objc_msgSend(v28, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_15")) & 1) != 0)
    {
      v29 = 55;
    }
    else if ((objc_msgSend(v28, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_16")) & 1) != 0)
    {
      v29 = 56;
    }
    else if ((objc_msgSend(v28, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_17")) & 1) != 0)
    {
      v29 = 57;
    }
    else if ((objc_msgSend(v28, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_18")) & 1) != 0)
    {
      v29 = 58;
    }
    else if ((objc_msgSend(v28, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_19")) & 1) != 0)
    {
      v29 = 59;
    }
    else if ((objc_msgSend(v28, "isEqualToString:", CFSTR("SHARP_LEFT_TURN")) & 1) != 0)
    {
      v29 = 60;
    }
    else if ((objc_msgSend(v28, "isEqualToString:", CFSTR("SHARP_RIGHT_TURN")) & 1) != 0)
    {
      v29 = 61;
    }
    else if ((objc_msgSend(v28, "isEqualToString:", CFSTR("SLIGHT_LEFT_TURN")) & 1) != 0)
    {
      v29 = 62;
    }
    else if ((objc_msgSend(v28, "isEqualToString:", CFSTR("SLIGHT_RIGHT_TURN")) & 1) != 0)
    {
      v29 = 63;
    }
    else if ((objc_msgSend(v28, "isEqualToString:", CFSTR("CHANGE_HIGHWAY")) & 1) != 0)
    {
      v29 = 64;
    }
    else if ((objc_msgSend(v28, "isEqualToString:", CFSTR("CHANGE_HIGHWAY_LEFT")) & 1) != 0)
    {
      v29 = 65;
    }
    else if ((objc_msgSend(v28, "isEqualToString:", CFSTR("CHANGE_HIGHWAY_RIGHT")) & 1) != 0)
    {
      v29 = 66;
    }
    else if ((objc_msgSend(v28, "isEqualToString:", CFSTR("TOLL_STATION")) & 1) != 0)
    {
      v29 = 80;
    }
    else if ((objc_msgSend(v28, "isEqualToString:", CFSTR("ENTER_TUNNEL")) & 1) != 0)
    {
      v29 = 81;
    }
    else if ((objc_msgSend(v28, "isEqualToString:", CFSTR("WAYPOINT_STOP")) & 1) != 0)
    {
      v29 = 82;
    }
    else if ((objc_msgSend(v28, "isEqualToString:", CFSTR("WAYPOINT_STOP_LEFT")) & 1) != 0)
    {
      v29 = 83;
    }
    else if ((objc_msgSend(v28, "isEqualToString:", CFSTR("WAYPOINT_STOP_RIGHT")) & 1) != 0)
    {
      v29 = 84;
    }
    else if ((objc_msgSend(v28, "isEqualToString:", CFSTR("RESUME_ROUTE")) & 1) != 0)
    {
      v29 = 85;
    }
    else if ((objc_msgSend(v28, "isEqualToString:", CFSTR("RESUME_ROUTE_WITH_U_TURN")) & 1) != 0)
    {
      v29 = 86;
    }
    else if ((objc_msgSend(v28, "isEqualToString:", CFSTR("CUSTOM")) & 1) != 0)
    {
      v29 = 87;
    }
    else if (objc_msgSend(v28, "isEqualToString:", CFSTR("TURN_AROUND")))
    {
      v29 = 88;
    }
    else
    {
      v29 = 0;
    }

    goto LABEL_174;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v29 = objc_msgSend(v27, "intValue");
LABEL_174:
    objc_msgSend(a1, "setManeuverType:", v29);
  }

  if (a3)
    v30 = CFSTR("expectedTime");
  else
    v30 = CFSTR("expected_time");
  objc_msgSend(v5, "objectForKeyedSubscript:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setExpectedTime:", objc_msgSend(v31, "unsignedIntValue"));

  if (a3)
    v32 = CFSTR("stepZilch");
  else
    v32 = CFSTR("step_zilch");
  objc_msgSend(v5, "objectForKeyedSubscript:", v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v33, 0);
    objc_msgSend(a1, "setStepZilch:", v34);

  }
  if (a3)
    v35 = CFSTR("stepEndPathPointIndex");
  else
    v35 = CFSTR("step_end_path_point_index");
  objc_msgSend(v5, "objectForKeyedSubscript:", v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setStepEndPathPointIndex:", objc_msgSend(v36, "intValue"));

  if (a3)
    v37 = CFSTR("stepEndPathPointOffset");
  else
    v37 = CFSTR("step_end_path_point_offset");
  objc_msgSend(v5, "objectForKeyedSubscript:", v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v38, "doubleValue");
    objc_msgSend(a1, "setStepEndPathPointOffset:");
  }

  if (a3)
    v39 = CFSTR("etaTrafficUpdateResponseId");
  else
    v39 = CFSTR("eta_traffic_update_response_id");
  objc_msgSend(v5, "objectForKeyedSubscript:", v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v40, 0);
    objc_msgSend(a1, "setEtaTrafficUpdateResponseId:", v41);

  }
LABEL_201:

  return a1;
}

- (GEOStepFeedback)initWithJSON:(id)a3
{
  return (GEOStepFeedback *)-[GEOStepFeedback _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_998;
    else
      v8 = (int *)&readAll__nonRecursiveTag_999;
    GEOStepFeedbackReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    -[GEOEVStepFeedbackInfo readAll:](self->_evStepInfo, "readAll:", 1);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOStepFeedbackIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOStepFeedbackReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  $B5D046ADD8212AB5E9D0A6721CC205DC flags;
  $B5D046ADD8212AB5E9D0A6721CC205DC v6;
  $B5D046ADD8212AB5E9D0A6721CC205DC v7;
  $B5D046ADD8212AB5E9D0A6721CC205DC v8;
  $B5D046ADD8212AB5E9D0A6721CC205DC v9;
  PBDataReader *v10;
  void *v11;
  id v12;

  v12 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader)
  {
    os_unfair_lock_assert_owner(&self->_readerLock);
    if ((*(_DWORD *)&self->_flags & 0x3F000) == 0)
    {
      v10 = self->_reader;
      objc_sync_enter(v10);
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "writeData:", v11);
      os_unfair_lock_unlock(p_readerLock);

      objc_sync_exit(v10);
      goto LABEL_40;
    }
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOStepFeedback readAll:](self, "readAll:", 0);
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 0x20) != 0)
  {
    PBDataWriterWriteUint32Field();
    flags = self->_flags;
    if ((*(_BYTE *)&flags & 1) == 0)
    {
LABEL_5:
      if ((*(_WORD *)&flags & 0x100) == 0)
        goto LABEL_7;
      goto LABEL_6;
    }
  }
  else if ((*(_BYTE *)&flags & 1) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteDoubleField();
  if ((*(_DWORD *)&self->_flags & 0x100) != 0)
LABEL_6:
    PBDataWriterWriteBOOLField();
LABEL_7:
  if (self->_routeID)
    PBDataWriterWriteDataField();
  v6 = self->_flags;
  if ((*(_BYTE *)&v6 & 0x10) != 0)
  {
    PBDataWriterWriteUint32Field();
    v6 = self->_flags;
  }
  if ((*(_WORD *)&v6 & 0x200) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_tripID)
    PBDataWriterWriteDataField();
  v7 = self->_flags;
  if ((*(_WORD *)&v7 & 0x400) != 0)
  {
    PBDataWriterWriteBOOLField();
    v7 = self->_flags;
  }
  if ((*(_WORD *)&v7 & 0x800) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_evStepInfo)
    PBDataWriterWriteSubmessage();
  v8 = self->_flags;
  if ((*(_BYTE *)&v8 & 0x80) == 0)
  {
    if ((*(_BYTE *)&v8 & 8) == 0)
      goto LABEL_23;
LABEL_37:
    PBDataWriterWriteInt32Field();
    if ((*(_DWORD *)&self->_flags & 4) == 0)
      goto LABEL_25;
    goto LABEL_24;
  }
  PBDataWriterWriteUint32Field();
  v8 = self->_flags;
  if ((*(_BYTE *)&v8 & 8) != 0)
    goto LABEL_37;
LABEL_23:
  if ((*(_BYTE *)&v8 & 4) != 0)
LABEL_24:
    PBDataWriterWriteUint32Field();
LABEL_25:
  if (self->_stepZilch)
    PBDataWriterWriteDataField();
  v9 = self->_flags;
  if ((*(_BYTE *)&v9 & 0x40) != 0)
  {
    PBDataWriterWriteInt32Field();
    v9 = self->_flags;
  }
  if ((*(_BYTE *)&v9 & 2) != 0)
    PBDataWriterWriteDoubleField();
  if (self->_etaTrafficUpdateResponseId)
    PBDataWriterWriteDataField();
LABEL_40:

}

- (void)copyTo:(id)a3
{
  id *v4;
  $B5D046ADD8212AB5E9D0A6721CC205DC flags;
  $B5D046ADD8212AB5E9D0A6721CC205DC v6;
  $B5D046ADD8212AB5E9D0A6721CC205DC v7;
  $B5D046ADD8212AB5E9D0A6721CC205DC v8;
  $B5D046ADD8212AB5E9D0A6721CC205DC v9;
  id *v10;

  v10 = (id *)a3;
  -[GEOStepFeedback readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v10 + 1, self->_reader);
  *((_DWORD *)v10 + 18) = self->_readerMarkPos;
  *((_DWORD *)v10 + 19) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  v4 = v10;
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 0x20) != 0)
  {
    *((_DWORD *)v10 + 24) = self->_stepID;
    *((_DWORD *)v10 + 28) |= 0x20u;
    flags = self->_flags;
    if ((*(_BYTE *)&flags & 1) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&flags & 0x100) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&flags & 1) == 0)
  {
    goto LABEL_3;
  }
  v10[2] = *(id *)&self->_completionTimeStamp;
  *((_DWORD *)v10 + 28) |= 1u;
  if ((*(_DWORD *)&self->_flags & 0x100) != 0)
  {
LABEL_4:
    *((_BYTE *)v10 + 108) = self->_completedStep;
    *((_DWORD *)v10 + 28) |= 0x100u;
  }
LABEL_5:
  if (self->_routeID)
  {
    objc_msgSend(v10, "setRouteID:");
    v4 = v10;
  }
  v6 = self->_flags;
  if ((*(_BYTE *)&v6 & 0x10) != 0)
  {
    *((_DWORD *)v4 + 23) = self->_routeIndex;
    *((_DWORD *)v4 + 28) |= 0x10u;
    v6 = self->_flags;
  }
  if ((*(_WORD *)&v6 & 0x200) != 0)
  {
    *((_BYTE *)v4 + 109) = self->_lightGuidance;
    *((_DWORD *)v4 + 28) |= 0x200u;
  }
  if (self->_tripID)
  {
    objc_msgSend(v10, "setTripID:");
    v4 = v10;
  }
  v7 = self->_flags;
  if ((*(_WORD *)&v7 & 0x400) != 0)
  {
    *((_BYTE *)v4 + 110) = self->_routePaused;
    *((_DWORD *)v4 + 28) |= 0x400u;
    v7 = self->_flags;
  }
  if ((*(_WORD *)&v7 & 0x800) != 0)
  {
    *((_BYTE *)v4 + 111) = self->_routeResumed;
    *((_DWORD *)v4 + 28) |= 0x800u;
  }
  if (self->_evStepInfo)
  {
    objc_msgSend(v10, "setEvStepInfo:");
    v4 = v10;
  }
  v8 = self->_flags;
  if ((*(_BYTE *)&v8 & 0x80) != 0)
  {
    *((_DWORD *)v4 + 26) = self->_waypointRouteID;
    *((_DWORD *)v4 + 28) |= 0x80u;
    v8 = self->_flags;
    if ((*(_BYTE *)&v8 & 8) == 0)
    {
LABEL_21:
      if ((*(_BYTE *)&v8 & 4) == 0)
        goto LABEL_23;
      goto LABEL_22;
    }
  }
  else if ((*(_BYTE *)&v8 & 8) == 0)
  {
    goto LABEL_21;
  }
  *((_DWORD *)v4 + 22) = self->_maneuverType;
  *((_DWORD *)v4 + 28) |= 8u;
  if ((*(_DWORD *)&self->_flags & 4) != 0)
  {
LABEL_22:
    *((_DWORD *)v4 + 21) = self->_expectedTime;
    *((_DWORD *)v4 + 28) |= 4u;
  }
LABEL_23:
  if (self->_stepZilch)
  {
    objc_msgSend(v10, "setStepZilch:");
    v4 = v10;
  }
  v9 = self->_flags;
  if ((*(_BYTE *)&v9 & 0x40) != 0)
  {
    *((_DWORD *)v4 + 25) = self->_stepEndPathPointIndex;
    *((_DWORD *)v4 + 28) |= 0x40u;
    v9 = self->_flags;
  }
  if ((*(_BYTE *)&v9 & 2) != 0)
  {
    v4[6] = *(id *)&self->_stepEndPathPointOffset;
    *((_DWORD *)v4 + 28) |= 2u;
  }
  if (self->_etaTrafficUpdateResponseId)
  {
    objc_msgSend(v10, "setEtaTrafficUpdateResponseId:");
    v4 = v10;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  $B5D046ADD8212AB5E9D0A6721CC205DC flags;
  uint64_t v10;
  void *v11;
  $B5D046ADD8212AB5E9D0A6721CC205DC v12;
  uint64_t v13;
  void *v14;
  $B5D046ADD8212AB5E9D0A6721CC205DC v15;
  id v16;
  void *v17;
  $B5D046ADD8212AB5E9D0A6721CC205DC v18;
  uint64_t v19;
  void *v20;
  $B5D046ADD8212AB5E9D0A6721CC205DC v21;
  uint64_t v22;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*((_BYTE *)&self->_flags + 2) & 2) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOStepFeedbackReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_26;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOStepFeedback readAll:](self, "readAll:", 0);
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 0x20) != 0)
  {
    *(_DWORD *)(v5 + 96) = self->_stepID;
    *(_DWORD *)(v5 + 112) |= 0x20u;
    flags = self->_flags;
    if ((*(_BYTE *)&flags & 1) == 0)
    {
LABEL_7:
      if ((*(_WORD *)&flags & 0x100) == 0)
        goto LABEL_9;
      goto LABEL_8;
    }
  }
  else if ((*(_BYTE *)&flags & 1) == 0)
  {
    goto LABEL_7;
  }
  *(double *)(v5 + 16) = self->_completionTimeStamp;
  *(_DWORD *)(v5 + 112) |= 1u;
  if ((*(_DWORD *)&self->_flags & 0x100) != 0)
  {
LABEL_8:
    *(_BYTE *)(v5 + 108) = self->_completedStep;
    *(_DWORD *)(v5 + 112) |= 0x100u;
  }
LABEL_9:
  v10 = -[NSData copyWithZone:](self->_routeID, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v10;

  v12 = self->_flags;
  if ((*(_BYTE *)&v12 & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 92) = self->_routeIndex;
    *(_DWORD *)(v5 + 112) |= 0x10u;
    v12 = self->_flags;
  }
  if ((*(_WORD *)&v12 & 0x200) != 0)
  {
    *(_BYTE *)(v5 + 109) = self->_lightGuidance;
    *(_DWORD *)(v5 + 112) |= 0x200u;
  }
  v13 = -[NSData copyWithZone:](self->_tripID, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v13;

  v15 = self->_flags;
  if ((*(_WORD *)&v15 & 0x400) != 0)
  {
    *(_BYTE *)(v5 + 110) = self->_routePaused;
    *(_DWORD *)(v5 + 112) |= 0x400u;
    v15 = self->_flags;
  }
  if ((*(_WORD *)&v15 & 0x800) != 0)
  {
    *(_BYTE *)(v5 + 111) = self->_routeResumed;
    *(_DWORD *)(v5 + 112) |= 0x800u;
  }
  v16 = -[GEOEVStepFeedbackInfo copyWithZone:](self->_evStepInfo, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v16;

  v18 = self->_flags;
  if ((*(_BYTE *)&v18 & 0x80) == 0)
  {
    if ((*(_BYTE *)&v18 & 8) == 0)
      goto LABEL_19;
LABEL_31:
    *(_DWORD *)(v5 + 88) = self->_maneuverType;
    *(_DWORD *)(v5 + 112) |= 8u;
    if ((*(_DWORD *)&self->_flags & 4) == 0)
      goto LABEL_21;
    goto LABEL_20;
  }
  *(_DWORD *)(v5 + 104) = self->_waypointRouteID;
  *(_DWORD *)(v5 + 112) |= 0x80u;
  v18 = self->_flags;
  if ((*(_BYTE *)&v18 & 8) != 0)
    goto LABEL_31;
LABEL_19:
  if ((*(_BYTE *)&v18 & 4) != 0)
  {
LABEL_20:
    *(_DWORD *)(v5 + 84) = self->_expectedTime;
    *(_DWORD *)(v5 + 112) |= 4u;
  }
LABEL_21:
  v19 = -[NSData copyWithZone:](self->_stepZilch, "copyWithZone:", a3);
  v20 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v19;

  v21 = self->_flags;
  if ((*(_BYTE *)&v21 & 0x40) != 0)
  {
    *(_DWORD *)(v5 + 100) = self->_stepEndPathPointIndex;
    *(_DWORD *)(v5 + 112) |= 0x40u;
    v21 = self->_flags;
  }
  if ((*(_BYTE *)&v21 & 2) != 0)
  {
    *(double *)(v5 + 48) = self->_stepEndPathPointOffset;
    *(_DWORD *)(v5 + 112) |= 2u;
  }
  v22 = -[NSData copyWithZone:](self->_etaTrafficUpdateResponseId, "copyWithZone:", a3);
  v8 = *(id *)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v22;
LABEL_26:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  $B5D046ADD8212AB5E9D0A6721CC205DC flags;
  int v6;
  NSData *routeID;
  NSData *tripID;
  GEOEVStepFeedbackInfo *evStepInfo;
  NSData *stepZilch;
  NSData *etaTrafficUpdateResponseId;
  char v12;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_88;
  -[GEOStepFeedback readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  flags = self->_flags;
  v6 = *((_DWORD *)v4 + 28);
  if ((*(_BYTE *)&flags & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_stepID != *((_DWORD *)v4 + 24))
      goto LABEL_88;
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_88;
  }
  if ((*(_BYTE *)&flags & 1) != 0)
  {
    if ((v6 & 1) == 0 || self->_completionTimeStamp != *((double *)v4 + 2))
      goto LABEL_88;
  }
  else if ((v6 & 1) != 0)
  {
    goto LABEL_88;
  }
  if ((*(_WORD *)&flags & 0x100) != 0)
  {
    if ((v6 & 0x100) == 0)
      goto LABEL_88;
    if (self->_completedStep)
    {
      if (!*((_BYTE *)v4 + 108))
        goto LABEL_88;
    }
    else if (*((_BYTE *)v4 + 108))
    {
      goto LABEL_88;
    }
  }
  else if ((v6 & 0x100) != 0)
  {
    goto LABEL_88;
  }
  routeID = self->_routeID;
  if ((unint64_t)routeID | *((_QWORD *)v4 + 5))
  {
    if (!-[NSData isEqual:](routeID, "isEqual:"))
      goto LABEL_88;
    flags = self->_flags;
    v6 = *((_DWORD *)v4 + 28);
  }
  if ((*(_BYTE *)&flags & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_routeIndex != *((_DWORD *)v4 + 23))
      goto LABEL_88;
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_88;
  }
  if ((*(_WORD *)&flags & 0x200) != 0)
  {
    if ((v6 & 0x200) == 0)
      goto LABEL_88;
    if (self->_lightGuidance)
    {
      if (!*((_BYTE *)v4 + 109))
        goto LABEL_88;
    }
    else if (*((_BYTE *)v4 + 109))
    {
      goto LABEL_88;
    }
  }
  else if ((v6 & 0x200) != 0)
  {
    goto LABEL_88;
  }
  tripID = self->_tripID;
  if ((unint64_t)tripID | *((_QWORD *)v4 + 8))
  {
    if (!-[NSData isEqual:](tripID, "isEqual:"))
      goto LABEL_88;
    flags = self->_flags;
    v6 = *((_DWORD *)v4 + 28);
  }
  if ((*(_WORD *)&flags & 0x400) != 0)
  {
    if ((v6 & 0x400) == 0)
      goto LABEL_88;
    if (self->_routePaused)
    {
      if (!*((_BYTE *)v4 + 110))
        goto LABEL_88;
    }
    else if (*((_BYTE *)v4 + 110))
    {
      goto LABEL_88;
    }
  }
  else if ((v6 & 0x400) != 0)
  {
    goto LABEL_88;
  }
  if ((*(_WORD *)&flags & 0x800) != 0)
  {
    if ((v6 & 0x800) == 0)
      goto LABEL_88;
    if (self->_routeResumed)
    {
      if (!*((_BYTE *)v4 + 111))
        goto LABEL_88;
    }
    else if (*((_BYTE *)v4 + 111))
    {
      goto LABEL_88;
    }
  }
  else if ((v6 & 0x800) != 0)
  {
    goto LABEL_88;
  }
  evStepInfo = self->_evStepInfo;
  if ((unint64_t)evStepInfo | *((_QWORD *)v4 + 4))
  {
    if (!-[GEOEVStepFeedbackInfo isEqual:](evStepInfo, "isEqual:"))
      goto LABEL_88;
    flags = self->_flags;
    v6 = *((_DWORD *)v4 + 28);
  }
  if ((*(_BYTE *)&flags & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_waypointRouteID != *((_DWORD *)v4 + 26))
      goto LABEL_88;
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_88;
  }
  if ((*(_BYTE *)&flags & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_maneuverType != *((_DWORD *)v4 + 22))
      goto LABEL_88;
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_88;
  }
  if ((*(_BYTE *)&flags & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_expectedTime != *((_DWORD *)v4 + 21))
      goto LABEL_88;
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_88;
  }
  stepZilch = self->_stepZilch;
  if ((unint64_t)stepZilch | *((_QWORD *)v4 + 7))
  {
    if (-[NSData isEqual:](stepZilch, "isEqual:"))
    {
      flags = self->_flags;
      v6 = *((_DWORD *)v4 + 28);
      goto LABEL_76;
    }
LABEL_88:
    v12 = 0;
    goto LABEL_89;
  }
LABEL_76:
  if ((*(_BYTE *)&flags & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_stepEndPathPointIndex != *((_DWORD *)v4 + 25))
      goto LABEL_88;
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_88;
  }
  if ((*(_BYTE *)&flags & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_stepEndPathPointOffset != *((double *)v4 + 6))
      goto LABEL_88;
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_88;
  }
  etaTrafficUpdateResponseId = self->_etaTrafficUpdateResponseId;
  if ((unint64_t)etaTrafficUpdateResponseId | *((_QWORD *)v4 + 3))
    v12 = -[NSData isEqual:](etaTrafficUpdateResponseId, "isEqual:");
  else
    v12 = 1;
LABEL_89:

  return v12;
}

- (unint64_t)hash
{
  $B5D046ADD8212AB5E9D0A6721CC205DC flags;
  double completionTimeStamp;
  double v5;
  long double v6;
  double v7;
  unint64_t v8;
  $B5D046ADD8212AB5E9D0A6721CC205DC v9;
  $B5D046ADD8212AB5E9D0A6721CC205DC v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  $B5D046ADD8212AB5E9D0A6721CC205DC v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  $B5D046ADD8212AB5E9D0A6721CC205DC v19;
  uint64_t v20;
  double stepEndPathPointOffset;
  double v22;
  long double v23;
  double v24;
  unint64_t v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;

  -[GEOStepFeedback readAll:](self, "readAll:", 1);
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 0x20) != 0)
  {
    v33 = 2654435761 * self->_stepID;
    if ((*(_BYTE *)&flags & 1) != 0)
      goto LABEL_3;
LABEL_8:
    v8 = 0;
    goto LABEL_11;
  }
  v33 = 0;
  if ((*(_BYTE *)&flags & 1) == 0)
    goto LABEL_8;
LABEL_3:
  completionTimeStamp = self->_completionTimeStamp;
  v5 = -completionTimeStamp;
  if (completionTimeStamp >= 0.0)
    v5 = self->_completionTimeStamp;
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
LABEL_11:
  v32 = v8;
  if ((*(_WORD *)&flags & 0x100) != 0)
    v31 = 2654435761 * self->_completedStep;
  else
    v31 = 0;
  v30 = -[NSData hash](self->_routeID, "hash");
  v9 = self->_flags;
  if ((*(_BYTE *)&v9 & 0x10) != 0)
  {
    v29 = 2654435761 * self->_routeIndex;
    if ((*(_WORD *)&v9 & 0x200) != 0)
      goto LABEL_16;
  }
  else
  {
    v29 = 0;
    if ((*(_WORD *)&v9 & 0x200) != 0)
    {
LABEL_16:
      v28 = 2654435761 * self->_lightGuidance;
      goto LABEL_19;
    }
  }
  v28 = 0;
LABEL_19:
  v27 = -[NSData hash](self->_tripID, "hash");
  v10 = self->_flags;
  if ((*(_WORD *)&v10 & 0x400) != 0)
  {
    v11 = 2654435761 * self->_routePaused;
    if ((*(_WORD *)&v10 & 0x800) != 0)
      goto LABEL_21;
  }
  else
  {
    v11 = 0;
    if ((*(_WORD *)&v10 & 0x800) != 0)
    {
LABEL_21:
      v12 = 2654435761 * self->_routeResumed;
      goto LABEL_24;
    }
  }
  v12 = 0;
LABEL_24:
  v13 = -[GEOEVStepFeedbackInfo hash](self->_evStepInfo, "hash");
  v14 = self->_flags;
  if ((*(_BYTE *)&v14 & 0x80) == 0)
  {
    v15 = 0;
    if ((*(_BYTE *)&v14 & 8) != 0)
      goto LABEL_26;
LABEL_29:
    v16 = 0;
    if ((*(_BYTE *)&v14 & 4) != 0)
      goto LABEL_27;
    goto LABEL_30;
  }
  v15 = 2654435761 * self->_waypointRouteID;
  if ((*(_BYTE *)&v14 & 8) == 0)
    goto LABEL_29;
LABEL_26:
  v16 = 2654435761 * self->_maneuverType;
  if ((*(_BYTE *)&v14 & 4) != 0)
  {
LABEL_27:
    v17 = 2654435761 * self->_expectedTime;
    goto LABEL_31;
  }
LABEL_30:
  v17 = 0;
LABEL_31:
  v18 = -[NSData hash](self->_stepZilch, "hash");
  v19 = self->_flags;
  if ((*(_BYTE *)&v19 & 0x40) != 0)
  {
    v20 = 2654435761 * self->_stepEndPathPointIndex;
    if ((*(_BYTE *)&v19 & 2) != 0)
      goto LABEL_33;
LABEL_38:
    v25 = 0;
    return v32 ^ v33 ^ v31 ^ v29 ^ v28 ^ v30 ^ v27 ^ v11 ^ v12 ^ v13 ^ v15 ^ v16 ^ v17 ^ v18 ^ v20 ^ v25 ^ -[NSData hash](self->_etaTrafficUpdateResponseId, "hash");
  }
  v20 = 0;
  if ((*(_BYTE *)&v19 & 2) == 0)
    goto LABEL_38;
LABEL_33:
  stepEndPathPointOffset = self->_stepEndPathPointOffset;
  v22 = -stepEndPathPointOffset;
  if (stepEndPathPointOffset >= 0.0)
    v22 = self->_stepEndPathPointOffset;
  v23 = floor(v22 + 0.5);
  v24 = (v22 - v23) * 1.84467441e19;
  v25 = 2654435761u * (unint64_t)fmod(v23, 1.84467441e19);
  if (v24 >= 0.0)
  {
    if (v24 > 0.0)
      v25 += (unint64_t)v24;
  }
  else
  {
    v25 -= (unint64_t)fabs(v24);
  }
  return v32 ^ v33 ^ v31 ^ v29 ^ v28 ^ v30 ^ v27 ^ v11 ^ v12 ^ v13 ^ v15 ^ v16 ^ v17 ^ v18 ^ v20 ^ v25 ^ -[NSData hash](self->_etaTrafficUpdateResponseId, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  int v5;
  int v6;
  int v7;
  GEOEVStepFeedbackInfo *evStepInfo;
  uint64_t v9;
  int v10;
  int v11;
  id v12;

  v12 = a3;
  objc_msgSend(v12, "readAll:", 0);
  v4 = v12;
  v5 = *((_DWORD *)v12 + 28);
  if ((v5 & 0x20) != 0)
  {
    self->_stepID = *((_DWORD *)v12 + 24);
    *(_DWORD *)&self->_flags |= 0x20u;
    v5 = *((_DWORD *)v12 + 28);
    if ((v5 & 1) == 0)
    {
LABEL_3:
      if ((v5 & 0x100) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((v5 & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_completionTimeStamp = *((double *)v12 + 2);
  *(_DWORD *)&self->_flags |= 1u;
  if ((*((_DWORD *)v12 + 28) & 0x100) != 0)
  {
LABEL_4:
    self->_completedStep = *((_BYTE *)v12 + 108);
    *(_DWORD *)&self->_flags |= 0x100u;
  }
LABEL_5:
  if (*((_QWORD *)v12 + 5))
  {
    -[GEOStepFeedback setRouteID:](self, "setRouteID:");
    v4 = v12;
  }
  v6 = *((_DWORD *)v4 + 28);
  if ((v6 & 0x10) != 0)
  {
    self->_routeIndex = *((_DWORD *)v4 + 23);
    *(_DWORD *)&self->_flags |= 0x10u;
    v6 = *((_DWORD *)v4 + 28);
  }
  if ((v6 & 0x200) != 0)
  {
    self->_lightGuidance = *((_BYTE *)v4 + 109);
    *(_DWORD *)&self->_flags |= 0x200u;
  }
  if (*((_QWORD *)v4 + 8))
  {
    -[GEOStepFeedback setTripID:](self, "setTripID:");
    v4 = v12;
  }
  v7 = *((_DWORD *)v4 + 28);
  if ((v7 & 0x400) != 0)
  {
    self->_routePaused = *((_BYTE *)v4 + 110);
    *(_DWORD *)&self->_flags |= 0x400u;
    v7 = *((_DWORD *)v4 + 28);
  }
  if ((v7 & 0x800) != 0)
  {
    self->_routeResumed = *((_BYTE *)v4 + 111);
    *(_DWORD *)&self->_flags |= 0x800u;
  }
  evStepInfo = self->_evStepInfo;
  v9 = *((_QWORD *)v4 + 4);
  if (evStepInfo)
  {
    if (!v9)
      goto LABEL_26;
    -[GEOEVStepFeedbackInfo mergeFrom:](evStepInfo, "mergeFrom:");
  }
  else
  {
    if (!v9)
      goto LABEL_26;
    -[GEOStepFeedback setEvStepInfo:](self, "setEvStepInfo:");
  }
  v4 = v12;
LABEL_26:
  v10 = *((_DWORD *)v4 + 28);
  if ((v10 & 0x80) != 0)
  {
    self->_waypointRouteID = *((_DWORD *)v4 + 26);
    *(_DWORD *)&self->_flags |= 0x80u;
    v10 = *((_DWORD *)v4 + 28);
    if ((v10 & 8) == 0)
    {
LABEL_28:
      if ((v10 & 4) == 0)
        goto LABEL_30;
      goto LABEL_29;
    }
  }
  else if ((v10 & 8) == 0)
  {
    goto LABEL_28;
  }
  self->_maneuverType = *((_DWORD *)v4 + 22);
  *(_DWORD *)&self->_flags |= 8u;
  if ((*((_DWORD *)v4 + 28) & 4) != 0)
  {
LABEL_29:
    self->_expectedTime = *((_DWORD *)v4 + 21);
    *(_DWORD *)&self->_flags |= 4u;
  }
LABEL_30:
  if (*((_QWORD *)v4 + 7))
  {
    -[GEOStepFeedback setStepZilch:](self, "setStepZilch:");
    v4 = v12;
  }
  v11 = *((_DWORD *)v4 + 28);
  if ((v11 & 0x40) != 0)
  {
    self->_stepEndPathPointIndex = *((_DWORD *)v4 + 25);
    *(_DWORD *)&self->_flags |= 0x40u;
    v11 = *((_DWORD *)v4 + 28);
  }
  if ((v11 & 2) != 0)
  {
    self->_stepEndPathPointOffset = *((double *)v4 + 6);
    *(_DWORD *)&self->_flags |= 2u;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[GEOStepFeedback setEtaTrafficUpdateResponseId:](self, "setEtaTrafficUpdateResponseId:");
    v4 = v12;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tripID, 0);
  objc_storeStrong((id *)&self->_stepZilch, 0);
  objc_storeStrong((id *)&self->_routeID, 0);
  objc_storeStrong((id *)&self->_evStepInfo, 0);
  objc_storeStrong((id *)&self->_etaTrafficUpdateResponseId, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
