@implementation GEORPDirectionsEvent

- (GEORPDirectionsEvent)init
{
  GEORPDirectionsEvent *v2;
  GEORPDirectionsEvent *v3;
  GEORPDirectionsEvent *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEORPDirectionsEvent;
  v2 = -[GEORPDirectionsEvent init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPDirectionsEvent)initWithData:(id)a3
{
  GEORPDirectionsEvent *v3;
  GEORPDirectionsEvent *v4;
  GEORPDirectionsEvent *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEORPDirectionsEvent;
  v3 = -[GEORPDirectionsEvent initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (int)type
{
  os_unfair_lock_s *p_readerLock;
  __int16 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 0x20) != 0)
    return self->_type;
  else
    return 1;
}

- (void)setType:(int)a3
{
  *(_WORD *)&self->_flags |= 0x820u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2080;
  else
    v3 = 2048;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFDF | v3;
}

- (BOOL)hasType
{
  return (*(_WORD *)&self->_flags >> 5) & 1;
}

- (id)typeAsString:(int)a3
{
  if ((a3 - 1) < 3)
    return off_1E1C0EB98[a3 - 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SWITCHED_TO_ROUTE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ERROR")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("SYNTHESIZED_STEP")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (unsigned)occurrenceResponseIndex
{
  return self->_occurrenceResponseIndex;
}

- (void)setOccurrenceResponseIndex:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x802u;
  self->_occurrenceResponseIndex = a3;
}

- (void)setHasOccurrenceResponseIndex:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2050;
  else
    v3 = 2048;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasOccurrenceResponseIndex
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
}

- (void)_readOccurrenceRouteId
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_WORD *)(a1 + 96) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPDirectionsEventReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readOccurrenceRouteId_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasOccurrenceRouteId
{
  -[GEORPDirectionsEvent _readOccurrenceRouteId]((uint64_t)self);
  return self->_occurrenceRouteId != 0;
}

- (NSData)occurrenceRouteId
{
  -[GEORPDirectionsEvent _readOccurrenceRouteId]((uint64_t)self);
  return self->_occurrenceRouteId;
}

- (void)setOccurrenceRouteId:(id)a3
{
  *(_WORD *)&self->_flags |= 0x900u;
  objc_storeStrong((id *)&self->_occurrenceRouteId, a3);
}

- (unsigned)occurrenceStepIndex
{
  return self->_occurrenceStepIndex;
}

- (void)setOccurrenceStepIndex:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x804u;
  self->_occurrenceStepIndex = a3;
}

- (void)setHasOccurrenceStepIndex:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2052;
  else
    v3 = 2048;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFB | v3;
}

- (BOOL)hasOccurrenceStepIndex
{
  return (*(_WORD *)&self->_flags >> 2) & 1;
}

- (void)_readOccurrenceLatLng
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_WORD *)(a1 + 96) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPDirectionsEventReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readOccurrenceLatLng_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasOccurrenceLatLng
{
  -[GEORPDirectionsEvent _readOccurrenceLatLng]((uint64_t)self);
  return self->_occurrenceLatLng != 0;
}

- (GEOLatLng)occurrenceLatLng
{
  -[GEORPDirectionsEvent _readOccurrenceLatLng]((uint64_t)self);
  return self->_occurrenceLatLng;
}

- (void)setOccurrenceLatLng:(id)a3
{
  *(_WORD *)&self->_flags |= 0x880u;
  objc_storeStrong((id *)&self->_occurrenceLatLng, a3);
}

- (unsigned)switchedToResponseIndex
{
  return self->_switchedToResponseIndex;
}

- (void)setSwitchedToResponseIndex:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x808u;
  self->_switchedToResponseIndex = a3;
}

- (void)setHasSwitchedToResponseIndex:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2056;
  else
    v3 = 2048;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFF7 | v3;
}

- (BOOL)hasSwitchedToResponseIndex
{
  return (*(_WORD *)&self->_flags >> 3) & 1;
}

- (void)_readSwitchedToRouteId
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_WORD *)(a1 + 96) & 0x200) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPDirectionsEventReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSwitchedToRouteId_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasSwitchedToRouteId
{
  -[GEORPDirectionsEvent _readSwitchedToRouteId]((uint64_t)self);
  return self->_switchedToRouteId != 0;
}

- (NSData)switchedToRouteId
{
  -[GEORPDirectionsEvent _readSwitchedToRouteId]((uint64_t)self);
  return self->_switchedToRouteId;
}

- (void)setSwitchedToRouteId:(id)a3
{
  *(_WORD *)&self->_flags |= 0xA00u;
  objc_storeStrong((id *)&self->_switchedToRouteId, a3);
}

- (int)synthesizedStepManeuverType
{
  os_unfair_lock_s *p_readerLock;
  __int16 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 0x10) != 0)
    return self->_synthesizedStepManeuverType;
  else
    return 0;
}

- (void)setSynthesizedStepManeuverType:(int)a3
{
  *(_WORD *)&self->_flags |= 0x810u;
  self->_synthesizedStepManeuverType = a3;
}

- (void)setHasSynthesizedStepManeuverType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2064;
  else
    v3 = 2048;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFEF | v3;
}

- (BOOL)hasSynthesizedStepManeuverType
{
  return (*(_WORD *)&self->_flags >> 4) & 1;
}

- (id)synthesizedStepManeuverTypeAsString:(int)a3
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

- (int)StringAsSynthesizedStepManeuverType:(id)a3
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

- (void)_readSynthesizedStepInstructions
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_WORD *)(a1 + 96) & 0x400) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPDirectionsEventReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSynthesizedStepInstructions_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasSynthesizedStepInstructions
{
  -[GEORPDirectionsEvent _readSynthesizedStepInstructions]((uint64_t)self);
  return self->_synthesizedStepInstructions != 0;
}

- (NSString)synthesizedStepInstructions
{
  -[GEORPDirectionsEvent _readSynthesizedStepInstructions]((uint64_t)self);
  return self->_synthesizedStepInstructions;
}

- (void)setSynthesizedStepInstructions:(id)a3
{
  *(_WORD *)&self->_flags |= 0xC00u;
  objc_storeStrong((id *)&self->_synthesizedStepInstructions, a3);
}

- (void)_readErrorDomain
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_WORD *)(a1 + 96) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPDirectionsEventReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readErrorDomain_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasErrorDomain
{
  -[GEORPDirectionsEvent _readErrorDomain]((uint64_t)self);
  return self->_errorDomain != 0;
}

- (NSString)errorDomain
{
  -[GEORPDirectionsEvent _readErrorDomain]((uint64_t)self);
  return self->_errorDomain;
}

- (void)setErrorDomain:(id)a3
{
  *(_WORD *)&self->_flags |= 0x840u;
  objc_storeStrong((id *)&self->_errorDomain, a3);
}

- (int64_t)errorCode
{
  return self->_errorCode;
}

- (void)setErrorCode:(int64_t)a3
{
  *(_WORD *)&self->_flags |= 0x801u;
  self->_errorCode = a3;
}

- (void)setHasErrorCode:(BOOL)a3
{
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFE | a3 | 0x800;
}

- (BOOL)hasErrorCode
{
  return *(_WORD *)&self->_flags & 1;
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
  v8.super_class = (Class)GEORPDirectionsEvent;
  -[GEORPDirectionsEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORPDirectionsEvent dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPDirectionsEvent _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  __int16 v5;
  unsigned int v6;
  __CFString *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  __CFString *v24;
  const __CFString *v25;
  void *v26;
  const __CFString *v27;
  void *v28;
  const __CFString *v29;
  void *v30;
  const __CFString *v31;

  if (a1)
  {
    objc_msgSend((id)a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_WORD *)(a1 + 96);
    if ((v5 & 0x20) != 0)
    {
      v6 = *(_DWORD *)(a1 + 92) - 1;
      if (v6 >= 3)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 92));
        v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v7 = off_1E1C0EB98[v6];
      }
      objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("type"));

      v5 = *(_WORD *)(a1 + 96);
    }
    if ((v5 & 2) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 76));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
        v9 = CFSTR("occurrenceResponseIndex");
      else
        v9 = CFSTR("occurrence_response_index");
      objc_msgSend(v4, "setObject:forKey:", v8, v9);

    }
    objc_msgSend((id)a1, "occurrenceRouteId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v10, "base64EncodedStringWithOptions:", 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("occurrenceRouteId"));

      }
      else
      {
        objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("occurrence_route_id"));
      }
    }

    if ((*(_WORD *)(a1 + 96) & 4) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 80));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
        v14 = CFSTR("occurrenceStepIndex");
      else
        v14 = CFSTR("occurrence_step_index");
      objc_msgSend(v4, "setObject:forKey:", v13, v14);

    }
    objc_msgSend((id)a1, "occurrenceLatLng");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v15, "jsonRepresentation");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = CFSTR("occurrenceLatLng");
      }
      else
      {
        objc_msgSend(v15, "dictionaryRepresentation");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = CFSTR("occurrence_lat_lng");
      }
      objc_msgSend(v4, "setObject:forKey:", v17, v18);

    }
    if ((*(_WORD *)(a1 + 96) & 8) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 84));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
        v20 = CFSTR("switchedToResponseIndex");
      else
        v20 = CFSTR("switched_to_response_index");
      objc_msgSend(v4, "setObject:forKey:", v19, v20);

    }
    objc_msgSend((id)a1, "switchedToRouteId");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (v21)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v21, "base64EncodedStringWithOptions:", 0);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKey:", v23, CFSTR("switchedToRouteId"));

      }
      else
      {
        objc_msgSend(v4, "setObject:forKey:", v21, CFSTR("switched_to_route_id"));
      }
    }

    if ((*(_WORD *)(a1 + 96) & 0x10) != 0)
    {
      v24 = CFSTR("NO_TURN");
      switch(*(_DWORD *)(a1 + 88))
      {
        case 0:
          break;
        case 1:
          v24 = CFSTR("LEFT_TURN");
          break;
        case 2:
          v24 = CFSTR("RIGHT_TURN");
          break;
        case 3:
          v24 = CFSTR("STRAIGHT_AHEAD");
          break;
        case 4:
          v24 = CFSTR("U_TURN");
          break;
        case 5:
          v24 = CFSTR("FOLLOW_ROAD");
          break;
        case 6:
          v24 = CFSTR("ENTER_ROUNDABOUT");
          break;
        case 7:
          v24 = CFSTR("EXIT_ROUNDABOUT");
          break;
        case 0xB:
          v24 = CFSTR("OFF_RAMP");
          break;
        case 0xC:
          v24 = CFSTR("ON_RAMP");
          break;
        case 0x10:
          v24 = CFSTR("ARRIVE_END_OF_NAVIGATION");
          break;
        case 0x11:
          v24 = CFSTR("START_ROUTE");
          break;
        case 0x12:
          v24 = CFSTR("ARRIVE_AT_DESTINATION");
          break;
        case 0x14:
          v24 = CFSTR("KEEP_LEFT");
          break;
        case 0x15:
          v24 = CFSTR("KEEP_RIGHT");
          break;
        case 0x16:
          v24 = CFSTR("ENTER_FERRY");
          break;
        case 0x17:
          v24 = CFSTR("EXIT_FERRY");
          break;
        case 0x18:
          v24 = CFSTR("CHANGE_FERRY");
          break;
        case 0x19:
          v24 = CFSTR("START_ROUTE_WITH_U_TURN");
          break;
        case 0x1A:
          v24 = CFSTR("U_TURN_AT_ROUNDABOUT");
          break;
        case 0x1B:
          v24 = CFSTR("LEFT_TURN_AT_END");
          break;
        case 0x1C:
          v24 = CFSTR("RIGHT_TURN_AT_END");
          break;
        case 0x1D:
          v24 = CFSTR("HIGHWAY_OFF_RAMP_LEFT");
          break;
        case 0x1E:
          v24 = CFSTR("HIGHWAY_OFF_RAMP_RIGHT");
          break;
        case 0x21:
          v24 = CFSTR("ARRIVE_AT_DESTINATION_LEFT");
          break;
        case 0x22:
          v24 = CFSTR("ARRIVE_AT_DESTINATION_RIGHT");
          break;
        case 0x23:
          v24 = CFSTR("U_TURN_WHEN_POSSIBLE");
          break;
        case 0x27:
          v24 = CFSTR("ARRIVE_END_OF_DIRECTIONS");
          break;
        case 0x29:
          v24 = CFSTR("ROUNDABOUT_EXIT_1");
          break;
        case 0x2A:
          v24 = CFSTR("ROUNDABOUT_EXIT_2");
          break;
        case 0x2B:
          v24 = CFSTR("ROUNDABOUT_EXIT_3");
          break;
        case 0x2C:
          v24 = CFSTR("ROUNDABOUT_EXIT_4");
          break;
        case 0x2D:
          v24 = CFSTR("ROUNDABOUT_EXIT_5");
          break;
        case 0x2E:
          v24 = CFSTR("ROUNDABOUT_EXIT_6");
          break;
        case 0x2F:
          v24 = CFSTR("ROUNDABOUT_EXIT_7");
          break;
        case 0x30:
          v24 = CFSTR("ROUNDABOUT_EXIT_8");
          break;
        case 0x31:
          v24 = CFSTR("ROUNDABOUT_EXIT_9");
          break;
        case 0x32:
          v24 = CFSTR("ROUNDABOUT_EXIT_10");
          break;
        case 0x33:
          v24 = CFSTR("ROUNDABOUT_EXIT_11");
          break;
        case 0x34:
          v24 = CFSTR("ROUNDABOUT_EXIT_12");
          break;
        case 0x35:
          v24 = CFSTR("ROUNDABOUT_EXIT_13");
          break;
        case 0x36:
          v24 = CFSTR("ROUNDABOUT_EXIT_14");
          break;
        case 0x37:
          v24 = CFSTR("ROUNDABOUT_EXIT_15");
          break;
        case 0x38:
          v24 = CFSTR("ROUNDABOUT_EXIT_16");
          break;
        case 0x39:
          v24 = CFSTR("ROUNDABOUT_EXIT_17");
          break;
        case 0x3A:
          v24 = CFSTR("ROUNDABOUT_EXIT_18");
          break;
        case 0x3B:
          v24 = CFSTR("ROUNDABOUT_EXIT_19");
          break;
        case 0x3C:
          v24 = CFSTR("SHARP_LEFT_TURN");
          break;
        case 0x3D:
          v24 = CFSTR("SHARP_RIGHT_TURN");
          break;
        case 0x3E:
          v24 = CFSTR("SLIGHT_LEFT_TURN");
          break;
        case 0x3F:
          v24 = CFSTR("SLIGHT_RIGHT_TURN");
          break;
        case 0x40:
          v24 = CFSTR("CHANGE_HIGHWAY");
          break;
        case 0x41:
          v24 = CFSTR("CHANGE_HIGHWAY_LEFT");
          break;
        case 0x42:
          v24 = CFSTR("CHANGE_HIGHWAY_RIGHT");
          break;
        case 0x50:
          v24 = CFSTR("TOLL_STATION");
          break;
        case 0x51:
          v24 = CFSTR("ENTER_TUNNEL");
          break;
        case 0x52:
          v24 = CFSTR("WAYPOINT_STOP");
          break;
        case 0x53:
          v24 = CFSTR("WAYPOINT_STOP_LEFT");
          break;
        case 0x54:
          v24 = CFSTR("WAYPOINT_STOP_RIGHT");
          break;
        case 0x55:
          v24 = CFSTR("RESUME_ROUTE");
          break;
        case 0x56:
          v24 = CFSTR("RESUME_ROUTE_WITH_U_TURN");
          break;
        case 0x57:
          v24 = CFSTR("CUSTOM");
          break;
        case 0x58:
          v24 = CFSTR("TURN_AROUND");
          break;
        default:
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 88));
          v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
          break;
      }
      if (a2)
        v25 = CFSTR("synthesizedStepManeuverType");
      else
        v25 = CFSTR("synthesized_step_maneuver_type");
      objc_msgSend(v4, "setObject:forKey:", v24, v25);

    }
    objc_msgSend((id)a1, "synthesizedStepInstructions");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      if (a2)
        v27 = CFSTR("synthesizedStepInstructions");
      else
        v27 = CFSTR("synthesized_step_instructions");
      objc_msgSend(v4, "setObject:forKey:", v26, v27);
    }

    objc_msgSend((id)a1, "errorDomain");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (v28)
    {
      if (a2)
        v29 = CFSTR("errorDomain");
      else
        v29 = CFSTR("error_domain");
      objc_msgSend(v4, "setObject:forKey:", v28, v29);
    }

    if ((*(_WORD *)(a1 + 96) & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(a1 + 16));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
        v31 = CFSTR("errorCode");
      else
        v31 = CFSTR("error_code");
      objc_msgSend(v4, "setObject:forKey:", v30, v31);

    }
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEORPDirectionsEvent _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEORPDirectionsEvent)initWithDictionary:(id)a3
{
  return (GEORPDirectionsEvent *)-[GEORPDirectionsEvent _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  const __CFString *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  GEOLatLng *v18;
  uint64_t v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  id v28;
  uint64_t v29;
  const __CFString *v30;
  void *v31;
  void *v32;
  const __CFString *v33;
  void *v34;
  void *v35;
  const __CFString *v36;
  void *v37;

  v5 = a2;
  if (!a1)
    goto LABEL_199;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_199;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("type"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v6;
    if ((objc_msgSend(v7, "isEqualToString:", CFSTR("SWITCHED_TO_ROUTE")) & 1) != 0)
    {
      v8 = 1;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("ERROR")) & 1) != 0)
    {
      v8 = 2;
    }
    else if (objc_msgSend(v7, "isEqualToString:", CFSTR("SYNTHESIZED_STEP")))
    {
      v8 = 3;
    }
    else
    {
      v8 = 1;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_15;
    v8 = objc_msgSend(v6, "intValue");
  }
  objc_msgSend(a1, "setType:", v8);
LABEL_15:

  if (a3)
    v9 = CFSTR("occurrenceResponseIndex");
  else
    v9 = CFSTR("occurrence_response_index");
  objc_msgSend(v5, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setOccurrenceResponseIndex:", objc_msgSend(v10, "unsignedIntValue"));

  if (a3)
    v11 = CFSTR("occurrenceRouteId");
  else
    v11 = CFSTR("occurrence_route_id");
  objc_msgSend(v5, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v12, 0);
    objc_msgSend(a1, "setOccurrenceRouteId:", v13);

  }
  if (a3)
    v14 = CFSTR("occurrenceStepIndex");
  else
    v14 = CFSTR("occurrence_step_index");
  objc_msgSend(v5, "objectForKeyedSubscript:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setOccurrenceStepIndex:", objc_msgSend(v15, "unsignedIntValue"));

  if (a3)
    v16 = CFSTR("occurrenceLatLng");
  else
    v16 = CFSTR("occurrence_lat_lng");
  objc_msgSend(v5, "objectForKeyedSubscript:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v18 = [GEOLatLng alloc];
    if ((a3 & 1) != 0)
      v19 = -[GEOLatLng initWithJSON:](v18, "initWithJSON:", v17);
    else
      v19 = -[GEOLatLng initWithDictionary:](v18, "initWithDictionary:", v17);
    v20 = (void *)v19;
    objc_msgSend(a1, "setOccurrenceLatLng:", v19);

  }
  if (a3)
    v21 = CFSTR("switchedToResponseIndex");
  else
    v21 = CFSTR("switched_to_response_index");
  objc_msgSend(v5, "objectForKeyedSubscript:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setSwitchedToResponseIndex:", objc_msgSend(v22, "unsignedIntValue"));

  if (a3)
    v23 = CFSTR("switchedToRouteId");
  else
    v23 = CFSTR("switched_to_route_id");
  objc_msgSend(v5, "objectForKeyedSubscript:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v24, 0);
    objc_msgSend(a1, "setSwitchedToRouteId:", v25);

  }
  if (a3)
    v26 = CFSTR("synthesizedStepManeuverType");
  else
    v26 = CFSTR("synthesized_step_maneuver_type");
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

    goto LABEL_182;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v29 = objc_msgSend(v27, "intValue");
LABEL_182:
    objc_msgSend(a1, "setSynthesizedStepManeuverType:", v29);
  }

  if (a3)
    v30 = CFSTR("synthesizedStepInstructions");
  else
    v30 = CFSTR("synthesized_step_instructions");
  objc_msgSend(v5, "objectForKeyedSubscript:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v32 = (void *)objc_msgSend(v31, "copy");
    objc_msgSend(a1, "setSynthesizedStepInstructions:", v32);

  }
  if (a3)
    v33 = CFSTR("errorDomain");
  else
    v33 = CFSTR("error_domain");
  objc_msgSend(v5, "objectForKeyedSubscript:", v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v35 = (void *)objc_msgSend(v34, "copy");
    objc_msgSend(a1, "setErrorDomain:", v35);

  }
  if (a3)
    v36 = CFSTR("errorCode");
  else
    v36 = CFSTR("error_code");
  objc_msgSend(v5, "objectForKeyedSubscript:", v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setErrorCode:", objc_msgSend(v37, "longLongValue"));

LABEL_199:
  return a1;
}

- (GEORPDirectionsEvent)initWithJSON:(id)a3
{
  return (GEORPDirectionsEvent *)-[GEORPDirectionsEvent _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_697;
    else
      v8 = (int *)&readAll__nonRecursiveTag_698;
    GEORPDirectionsEventReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    -[GEOLatLng readAll:](self->_occurrenceLatLng, "readAll:", 1);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPDirectionsEventIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPDirectionsEventReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  __int16 flags;
  PBDataReader *v6;
  void *v7;
  id v8;

  v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_WORD *)&self->_flags & 0xFC0) == 0))
  {
    v6 = self->_reader;
    objc_sync_enter(v6);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "writeData:", v7);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v6);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEORPDirectionsEvent readAll:](self, "readAll:", 0);
    flags = (__int16)self->_flags;
    if ((flags & 0x20) != 0)
    {
      PBDataWriterWriteInt32Field();
      flags = (__int16)self->_flags;
    }
    if ((flags & 2) != 0)
      PBDataWriterWriteUint32Field();
    if (self->_occurrenceRouteId)
      PBDataWriterWriteDataField();
    if ((*(_WORD *)&self->_flags & 4) != 0)
      PBDataWriterWriteUint32Field();
    if (self->_occurrenceLatLng)
      PBDataWriterWriteSubmessage();
    if ((*(_WORD *)&self->_flags & 8) != 0)
      PBDataWriterWriteUint32Field();
    if (self->_switchedToRouteId)
      PBDataWriterWriteDataField();
    if ((*(_WORD *)&self->_flags & 0x10) != 0)
      PBDataWriterWriteInt32Field();
    if (self->_synthesizedStepInstructions)
      PBDataWriterWriteStringField();
    if (self->_errorDomain)
      PBDataWriterWriteStringField();
    if ((*(_WORD *)&self->_flags & 1) != 0)
      PBDataWriterWriteInt64Field();
  }

}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[GEORPDirectionsEvent _readOccurrenceLatLng]((uint64_t)self);
  return -[GEOLatLng hasGreenTeaWithValue:](self->_occurrenceLatLng, "hasGreenTeaWithValue:", v3);
}

- (void)copyTo:(id)a3
{
  __int16 flags;
  id *v5;

  v5 = (id *)a3;
  -[GEORPDirectionsEvent readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 16) = self->_readerMarkPos;
  *((_DWORD *)v5 + 17) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  flags = (__int16)self->_flags;
  if ((flags & 0x20) != 0)
  {
    *((_DWORD *)v5 + 23) = self->_type;
    *((_WORD *)v5 + 48) |= 0x20u;
    flags = (__int16)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *((_DWORD *)v5 + 19) = self->_occurrenceResponseIndex;
    *((_WORD *)v5 + 48) |= 2u;
  }
  if (self->_occurrenceRouteId)
    objc_msgSend(v5, "setOccurrenceRouteId:");
  if ((*(_WORD *)&self->_flags & 4) != 0)
  {
    *((_DWORD *)v5 + 20) = self->_occurrenceStepIndex;
    *((_WORD *)v5 + 48) |= 4u;
  }
  if (self->_occurrenceLatLng)
    objc_msgSend(v5, "setOccurrenceLatLng:");
  if ((*(_WORD *)&self->_flags & 8) != 0)
  {
    *((_DWORD *)v5 + 21) = self->_switchedToResponseIndex;
    *((_WORD *)v5 + 48) |= 8u;
  }
  if (self->_switchedToRouteId)
    objc_msgSend(v5, "setSwitchedToRouteId:");
  if ((*(_WORD *)&self->_flags & 0x10) != 0)
  {
    *((_DWORD *)v5 + 22) = self->_synthesizedStepManeuverType;
    *((_WORD *)v5 + 48) |= 0x10u;
  }
  if (self->_synthesizedStepInstructions)
    objc_msgSend(v5, "setSynthesizedStepInstructions:");
  if (self->_errorDomain)
    objc_msgSend(v5, "setErrorDomain:");
  if ((*(_WORD *)&self->_flags & 1) != 0)
  {
    v5[2] = (id)self->_errorCode;
    *((_WORD *)v5 + 48) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  __int16 flags;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x800) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEORPDirectionsEventReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEORPDirectionsEvent readAll:](self, "readAll:", 0);
  flags = (__int16)self->_flags;
  if ((flags & 0x20) != 0)
  {
    *(_DWORD *)(v5 + 92) = self->_type;
    *(_WORD *)(v5 + 96) |= 0x20u;
    flags = (__int16)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 76) = self->_occurrenceResponseIndex;
    *(_WORD *)(v5 + 96) |= 2u;
  }
  v10 = -[NSData copyWithZone:](self->_occurrenceRouteId, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v10;

  if ((*(_WORD *)&self->_flags & 4) != 0)
  {
    *(_DWORD *)(v5 + 80) = self->_occurrenceStepIndex;
    *(_WORD *)(v5 + 96) |= 4u;
  }
  v12 = -[GEOLatLng copyWithZone:](self->_occurrenceLatLng, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v12;

  if ((*(_WORD *)&self->_flags & 8) != 0)
  {
    *(_DWORD *)(v5 + 84) = self->_switchedToResponseIndex;
    *(_WORD *)(v5 + 96) |= 8u;
  }
  v14 = -[NSData copyWithZone:](self->_switchedToRouteId, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v14;

  if ((*(_WORD *)&self->_flags & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 88) = self->_synthesizedStepManeuverType;
    *(_WORD *)(v5 + 96) |= 0x10u;
  }
  v16 = -[NSString copyWithZone:](self->_synthesizedStepInstructions, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v16;

  v18 = -[NSString copyWithZone:](self->_errorDomain, "copyWithZone:", a3);
  v19 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v18;

  if ((*(_WORD *)&self->_flags & 1) != 0)
  {
    *(_QWORD *)(v5 + 16) = self->_errorCode;
    *(_WORD *)(v5 + 96) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  __int16 flags;
  __int16 v6;
  NSData *occurrenceRouteId;
  GEOLatLng *occurrenceLatLng;
  NSData *switchedToRouteId;
  NSString *synthesizedStepInstructions;
  NSString *errorDomain;
  __int16 v12;
  BOOL v13;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_44;
  -[GEORPDirectionsEvent readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  flags = (__int16)self->_flags;
  v6 = *((_WORD *)v4 + 48);
  if ((flags & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_type != *((_DWORD *)v4 + 23))
      goto LABEL_44;
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_44;
  }
  if ((flags & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_occurrenceResponseIndex != *((_DWORD *)v4 + 19))
      goto LABEL_44;
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_44;
  }
  occurrenceRouteId = self->_occurrenceRouteId;
  if ((unint64_t)occurrenceRouteId | *((_QWORD *)v4 + 5))
  {
    if (!-[NSData isEqual:](occurrenceRouteId, "isEqual:"))
      goto LABEL_44;
    flags = (__int16)self->_flags;
    v6 = *((_WORD *)v4 + 48);
  }
  if ((flags & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_occurrenceStepIndex != *((_DWORD *)v4 + 20))
      goto LABEL_44;
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_44;
  }
  occurrenceLatLng = self->_occurrenceLatLng;
  if ((unint64_t)occurrenceLatLng | *((_QWORD *)v4 + 4))
  {
    if (!-[GEOLatLng isEqual:](occurrenceLatLng, "isEqual:"))
      goto LABEL_44;
    flags = (__int16)self->_flags;
    v6 = *((_WORD *)v4 + 48);
  }
  if ((flags & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_switchedToResponseIndex != *((_DWORD *)v4 + 21))
      goto LABEL_44;
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_44;
  }
  switchedToRouteId = self->_switchedToRouteId;
  if ((unint64_t)switchedToRouteId | *((_QWORD *)v4 + 6))
  {
    if (-[NSData isEqual:](switchedToRouteId, "isEqual:"))
    {
      flags = (__int16)self->_flags;
      v6 = *((_WORD *)v4 + 48);
      goto LABEL_31;
    }
LABEL_44:
    v13 = 0;
    goto LABEL_45;
  }
LABEL_31:
  if ((flags & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_synthesizedStepManeuverType != *((_DWORD *)v4 + 22))
      goto LABEL_44;
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_44;
  }
  synthesizedStepInstructions = self->_synthesizedStepInstructions;
  if ((unint64_t)synthesizedStepInstructions | *((_QWORD *)v4 + 7)
    && !-[NSString isEqual:](synthesizedStepInstructions, "isEqual:"))
  {
    goto LABEL_44;
  }
  errorDomain = self->_errorDomain;
  if ((unint64_t)errorDomain | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](errorDomain, "isEqual:"))
      goto LABEL_44;
  }
  v12 = *((_WORD *)v4 + 48);
  v13 = (v12 & 1) == 0;
  if ((*(_WORD *)&self->_flags & 1) != 0)
  {
    if ((v12 & 1) == 0 || self->_errorCode != *((_QWORD *)v4 + 2))
      goto LABEL_44;
    v13 = 1;
  }
LABEL_45:

  return v13;
}

- (unint64_t)hash
{
  __int16 flags;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSUInteger v9;
  NSUInteger v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  -[GEORPDirectionsEvent readAll:](self, "readAll:", 1);
  flags = (__int16)self->_flags;
  if ((flags & 0x20) != 0)
  {
    v15 = 2654435761 * self->_type;
    if ((flags & 2) != 0)
      goto LABEL_3;
  }
  else
  {
    v15 = 0;
    if ((flags & 2) != 0)
    {
LABEL_3:
      v14 = 2654435761 * self->_occurrenceResponseIndex;
      goto LABEL_6;
    }
  }
  v14 = 0;
LABEL_6:
  v13 = -[NSData hash](self->_occurrenceRouteId, "hash");
  if ((*(_WORD *)&self->_flags & 4) != 0)
    v4 = 2654435761 * self->_occurrenceStepIndex;
  else
    v4 = 0;
  v5 = -[GEOLatLng hash](self->_occurrenceLatLng, "hash");
  if ((*(_WORD *)&self->_flags & 8) != 0)
    v6 = 2654435761 * self->_switchedToResponseIndex;
  else
    v6 = 0;
  v7 = -[NSData hash](self->_switchedToRouteId, "hash");
  if ((*(_WORD *)&self->_flags & 0x10) != 0)
    v8 = 2654435761 * self->_synthesizedStepManeuverType;
  else
    v8 = 0;
  v9 = -[NSString hash](self->_synthesizedStepInstructions, "hash");
  v10 = -[NSString hash](self->_errorDomain, "hash");
  if ((*(_WORD *)&self->_flags & 1) != 0)
    v11 = 2654435761 * self->_errorCode;
  else
    v11 = 0;
  return v14 ^ v15 ^ v4 ^ v13 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  __int16 v5;
  GEOLatLng *occurrenceLatLng;
  uint64_t v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "readAll:", 0);
  v4 = v8;
  v5 = *((_WORD *)v8 + 48);
  if ((v5 & 0x20) != 0)
  {
    self->_type = *((_DWORD *)v8 + 23);
    *(_WORD *)&self->_flags |= 0x20u;
    v5 = *((_WORD *)v8 + 48);
  }
  if ((v5 & 2) != 0)
  {
    self->_occurrenceResponseIndex = *((_DWORD *)v8 + 19);
    *(_WORD *)&self->_flags |= 2u;
  }
  if (*((_QWORD *)v8 + 5))
  {
    -[GEORPDirectionsEvent setOccurrenceRouteId:](self, "setOccurrenceRouteId:");
    v4 = v8;
  }
  if ((*((_WORD *)v4 + 48) & 4) != 0)
  {
    self->_occurrenceStepIndex = *((_DWORD *)v4 + 20);
    *(_WORD *)&self->_flags |= 4u;
  }
  occurrenceLatLng = self->_occurrenceLatLng;
  v7 = *((_QWORD *)v4 + 4);
  if (occurrenceLatLng)
  {
    if (!v7)
      goto LABEL_15;
    -[GEOLatLng mergeFrom:](occurrenceLatLng, "mergeFrom:");
  }
  else
  {
    if (!v7)
      goto LABEL_15;
    -[GEORPDirectionsEvent setOccurrenceLatLng:](self, "setOccurrenceLatLng:");
  }
  v4 = v8;
LABEL_15:
  if ((*((_WORD *)v4 + 48) & 8) != 0)
  {
    self->_switchedToResponseIndex = *((_DWORD *)v4 + 21);
    *(_WORD *)&self->_flags |= 8u;
  }
  if (*((_QWORD *)v4 + 6))
  {
    -[GEORPDirectionsEvent setSwitchedToRouteId:](self, "setSwitchedToRouteId:");
    v4 = v8;
  }
  if ((*((_WORD *)v4 + 48) & 0x10) != 0)
  {
    self->_synthesizedStepManeuverType = *((_DWORD *)v4 + 22);
    *(_WORD *)&self->_flags |= 0x10u;
  }
  if (*((_QWORD *)v4 + 7))
  {
    -[GEORPDirectionsEvent setSynthesizedStepInstructions:](self, "setSynthesizedStepInstructions:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[GEORPDirectionsEvent setErrorDomain:](self, "setErrorDomain:");
    v4 = v8;
  }
  if ((*((_WORD *)v4 + 48) & 1) != 0)
  {
    self->_errorCode = *((_QWORD *)v4 + 2);
    *(_WORD *)&self->_flags |= 1u;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_synthesizedStepInstructions, 0);
  objc_storeStrong((id *)&self->_switchedToRouteId, 0);
  objc_storeStrong((id *)&self->_occurrenceRouteId, 0);
  objc_storeStrong((id *)&self->_occurrenceLatLng, 0);
  objc_storeStrong((id *)&self->_errorDomain, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
