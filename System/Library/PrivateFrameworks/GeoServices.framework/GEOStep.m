@implementation GEOStep

- (GEOStep)init
{
  GEOStep *v2;
  GEOStep *v3;
  GEOStep *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOStep;
  v2 = -[GEOStep init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOStep)initWithData:(id)a3
{
  GEOStep *v3;
  GEOStep *v4;
  GEOStep *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOStep;
  v3 = -[GEOStep initWithData:](&v7, sel_initWithData_, a3);
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

  -[GEOStep clearJunctionElements](self, "clearJunctionElements");
  v3.receiver = self;
  v3.super_class = (Class)GEOStep;
  -[GEOStep dealloc](&v3, sel_dealloc);
}

- (unsigned)stepID
{
  return self->_stepID;
}

- (void)setStepID:(unsigned int)a3
{
  *(_QWORD *)&self->_flags |= 0x8000004000uLL;
  self->_stepID = a3;
}

- (void)setHasStepID:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000000000;
  if (a3)
    v3 = 0x8000004000;
  self->_flags = ($EDB2BE274159A3E7688E4593D5E8813B)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFBFFFLL | v3);
}

- (BOOL)hasStepID
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 6) & 1;
}

- (int)maneuverEndBasicIndex
{
  os_unfair_lock_s *p_readerLock;
  $EDB2BE274159A3E7688E4593D5E8813B flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_BYTE *)&flags & 0x80) != 0)
    return self->_maneuverEndBasicIndex;
  else
    return -1;
}

- (void)setManeuverEndBasicIndex:(int)a3
{
  *(_QWORD *)&self->_flags |= 0x8000000080uLL;
  self->_maneuverEndBasicIndex = a3;
}

- (void)setHasManeuverEndBasicIndex:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000000000;
  if (a3)
    v3 = 0x8000000080;
  self->_flags = ($EDB2BE274159A3E7688E4593D5E8813B)(*(_QWORD *)&self->_flags & 0xFFFFFF7FFFFFFF7FLL | v3);
}

- (BOOL)hasManeuverEndBasicIndex
{
  return *(_BYTE *)&self->_flags >> 7;
}

- (int)maneuverStartZilchIndex
{
  os_unfair_lock_s *p_readerLock;
  $EDB2BE274159A3E7688E4593D5E8813B flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_WORD *)&flags & 0x200) != 0)
    return self->_maneuverStartZilchIndex;
  else
    return -1;
}

- (void)setManeuverStartZilchIndex:(int)a3
{
  *(_QWORD *)&self->_flags |= 0x8000000200uLL;
  self->_maneuverStartZilchIndex = a3;
}

- (void)setHasManeuverStartZilchIndex:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000000000;
  if (a3)
    v3 = 0x8000000200;
  self->_flags = ($EDB2BE274159A3E7688E4593D5E8813B)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFDFFLL | v3);
}

- (BOOL)hasManeuverStartZilchIndex
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 1) & 1;
}

- (int)maneuverEndZilchIndex
{
  os_unfair_lock_s *p_readerLock;
  $EDB2BE274159A3E7688E4593D5E8813B flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_WORD *)&flags & 0x100) != 0)
    return self->_maneuverEndZilchIndex;
  else
    return -1;
}

- (void)setManeuverEndZilchIndex:(int)a3
{
  *(_QWORD *)&self->_flags |= 0x8000000100uLL;
  self->_maneuverEndZilchIndex = a3;
}

- (void)setHasManeuverEndZilchIndex:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000000000;
  if (a3)
    v3 = 0x8000000100;
  self->_flags = ($EDB2BE274159A3E7688E4593D5E8813B)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFEFFLL | v3);
}

- (BOOL)hasManeuverEndZilchIndex
{
  return *((_BYTE *)&self->_flags + 1) & 1;
}

- (int)hintFirstAnnouncementZilchIndex
{
  os_unfair_lock_s *p_readerLock;
  $EDB2BE274159A3E7688E4593D5E8813B flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_BYTE *)&flags & 0x20) != 0)
    return self->_hintFirstAnnouncementZilchIndex;
  else
    return -1;
}

- (void)setHintFirstAnnouncementZilchIndex:(int)a3
{
  *(_QWORD *)&self->_flags |= 0x8000000020uLL;
  self->_hintFirstAnnouncementZilchIndex = a3;
}

- (void)setHasHintFirstAnnouncementZilchIndex:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000000000;
  if (a3)
    v3 = 0x8000000020;
  self->_flags = ($EDB2BE274159A3E7688E4593D5E8813B)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFFDFLL | v3);
}

- (BOOL)hasHintFirstAnnouncementZilchIndex
{
  return (*(_BYTE *)&self->_flags >> 5) & 1;
}

- (unsigned)expectedTime
{
  return self->_expectedTime;
}

- (void)setExpectedTime:(unsigned int)a3
{
  *(_QWORD *)&self->_flags |= 0x8000000010uLL;
  self->_expectedTime = a3;
}

- (void)setHasExpectedTime:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000000000;
  if (a3)
    v3 = 0x8000000010;
  self->_flags = ($EDB2BE274159A3E7688E4593D5E8813B)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFFEFLL | v3);
}

- (BOOL)hasExpectedTime
{
  return (*(_BYTE *)&self->_flags >> 4) & 1;
}

- (int)maneuverType
{
  os_unfair_lock_s *p_readerLock;
  $EDB2BE274159A3E7688E4593D5E8813B flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_WORD *)&flags & 0x400) != 0)
    return self->_maneuverType;
  else
    return 0;
}

- (void)setManeuverType:(int)a3
{
  *(_QWORD *)&self->_flags |= 0x8000000400uLL;
  self->_maneuverType = a3;
}

- (void)setHasManeuverType:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000000000;
  if (a3)
    v3 = 0x8000000400;
  self->_flags = ($EDB2BE274159A3E7688E4593D5E8813B)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFBFFLL | v3);
}

- (BOOL)hasManeuverType
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 2) & 1;
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

- (void)_readManeuverNames
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 168));
    if ((*(_BYTE *)(a1 + 248) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOStepReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readManeuverNames_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 168));
  }
}

- (NSMutableArray)maneuverNames
{
  -[GEOStep _readManeuverNames]((uint64_t)self);
  return self->_maneuverNames;
}

- (void)setManeuverNames:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *maneuverNames;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x200000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x8000000000uLL;
  maneuverNames = self->_maneuverNames;
  self->_maneuverNames = v4;

}

- (void)clearManeuverNames
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x200000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(_QWORD *)&self->_flags |= 0x8000000000uLL;
  -[NSMutableArray removeAllObjects](self->_maneuverNames, "removeAllObjects");
}

- (void)addManeuverName:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOStep _readManeuverNames]((uint64_t)self);
  -[GEOStep _addNoFlagsManeuverName:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x200000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x8000000000uLL;
}

- (void)_addNoFlagsManeuverName:(uint64_t)a1
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

- (unint64_t)maneuverNamesCount
{
  -[GEOStep _readManeuverNames]((uint64_t)self);
  return -[NSMutableArray count](self->_maneuverNames, "count");
}

- (id)maneuverNameAtIndex:(unint64_t)a3
{
  -[GEOStep _readManeuverNames]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_maneuverNames, "objectAtIndex:", a3);
}

+ (Class)maneuverNameType
{
  return (Class)objc_opt_class();
}

- (int)junctionType
{
  os_unfair_lock_s *p_readerLock;
  $EDB2BE274159A3E7688E4593D5E8813B flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_BYTE *)&flags & 0x40) != 0)
    return self->_junctionType;
  else
    return 0;
}

- (void)setJunctionType:(int)a3
{
  *(_QWORD *)&self->_flags |= 0x8000000040uLL;
  self->_junctionType = a3;
}

- (void)setHasJunctionType:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000000000;
  if (a3)
    v3 = 0x8000000040;
  self->_flags = ($EDB2BE274159A3E7688E4593D5E8813B)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFFBFLL | v3);
}

- (BOOL)hasJunctionType
{
  return (*(_BYTE *)&self->_flags >> 6) & 1;
}

- (id)junctionTypeAsString:(int)a3
{
  __CFString *v3;

  if (!a3)
    return CFSTR("JCTTYPE_NORMAL");
  if (a3 == 1)
  {
    v3 = CFSTR("JCTTYPE_ROUNDABOUT");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsJunctionType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("JCTTYPE_NORMAL")) & 1) != 0)
    v4 = 0;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("JCTTYPE_ROUNDABOUT"));

  return v4;
}

- (void)_readJunctionElements
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 168));
    if ((*(_BYTE *)(a1 + 247) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOStepReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readJunctionElements_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 168));
  }
}

- (unint64_t)junctionElementsCount
{
  -[GEOStep _readJunctionElements]((uint64_t)self);
  return self->_junctionElementsCount;
}

- (GEOJunctionElement)junctionElements
{
  -[GEOStep _readJunctionElements]((uint64_t)self);
  return self->_junctionElements;
}

- (uint64_t)_reserveJunctionElements:(uint64_t)a1
{
  uint64_t result;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;

  result = 0;
  if (a1 && a2)
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = v4 + a2;
    if (v4 + a2 <= v4)
      return 0;
    v6 = *(_QWORD *)(a1 + 40);
    if (v6 >= v5)
      return 1;
    v7 = v6 + a2;
    if (v6 + a2)
    {
      v8 = 1;
      while (1)
      {
        v9 = v8;
        if (v8 >= v7)
          break;
        v8 *= 2;
        if ((v9 & 0x8000000000000000) != 0)
        {
          v9 = -1;
          goto LABEL_12;
        }
      }
    }
    else
    {
      v9 = 0;
    }
    if (v9 < a2)
      return 0;
LABEL_12:
    if (16 * v9 < v9)
      return 0;
    result = (uint64_t)malloc_type_realloc(*(void **)(a1 + 24), 16 * v9, 0x8260BA8AuLL);
    if (result)
    {
      *(_QWORD *)(a1 + 40) = v9;
      *(_QWORD *)(a1 + 24) = result;
      bzero((void *)(result + 16 * *(_QWORD *)(a1 + 32)), 16 * (v9 - *(_QWORD *)(a1 + 32)));
      return 1;
    }
  }
  return result;
}

- (void)clearJunctionElements
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x1000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(_QWORD *)&self->_flags |= 0x8000000000uLL;
  self->_junctionElementsSpace = 0;
  self->_junctionElementsCount = 0;
  free(self->_junctionElements);
  self->_junctionElements = 0;
}

- (void)addJunctionElement:(GEOJunctionElement)a3
{
  uint64_t v3;
  uint64_t v4;
  GEOJunctionElement *v6;

  v3 = *(_QWORD *)&a3.var2;
  v4 = *(_QWORD *)&a3.var0;
  -[GEOStep _readJunctionElements]((uint64_t)self);
  if (self && -[GEOStep _reserveJunctionElements:]((uint64_t)self, 1uLL))
  {
    v6 = &self->_junctionElements[self->_junctionElementsCount];
    *(_QWORD *)&v6->var0 = v4;
    *(_QWORD *)&v6->var2 = v3;
    ++self->_junctionElementsCount;
  }
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x1000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x8000000000uLL;
}

- (GEOJunctionElement)junctionElementAtIndex:(unint64_t)a3
{
  unint64_t junctionElementsCount;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  GEOJunctionElement *v10;
  uint64_t v11;
  uint64_t v12;
  GEOJunctionElement result;

  -[GEOStep _readJunctionElements]((uint64_t)self);
  junctionElementsCount = self->_junctionElementsCount;
  if (junctionElementsCount <= a3)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, junctionElementsCount);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise");

  }
  v10 = &self->_junctionElements[a3];
  v11 = *(_QWORD *)&v10->var0;
  v12 = *(_QWORD *)&v10->var2;
  result.var2 = v12;
  result.var3 = *($162FAC071EAEBA15A6F8D573D0754DF6 *)((char *)&v12 + 4);
  result.var0 = v11;
  result.var1 = HIDWORD(v11);
  return result;
}

- (void)setJunctionElements:(GEOJunctionElement *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x1000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(_QWORD *)&self->_flags |= 0x8000000000uLL;
  -[GEOStep clearJunctionElements](self, "clearJunctionElements");
  if (-[GEOStep _reserveJunctionElements:]((uint64_t)self, a4))
  {
    memcpy(self->_junctionElements, a3, 16 * a4);
    self->_junctionElementsCount = a4;
  }
}

- (void)_readSignposts
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 168));
    if ((*(_BYTE *)(a1 + 248) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOStepReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSignposts_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 168));
  }
}

- (NSMutableArray)signposts
{
  -[GEOStep _readSignposts]((uint64_t)self);
  return self->_signposts;
}

- (void)setSignposts:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *signposts;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x1000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x8000000000uLL;
  signposts = self->_signposts;
  self->_signposts = v4;

}

- (void)clearSignposts
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x1000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(_QWORD *)&self->_flags |= 0x8000000000uLL;
  -[NSMutableArray removeAllObjects](self->_signposts, "removeAllObjects");
}

- (void)addSignpost:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOStep _readSignposts]((uint64_t)self);
  -[GEOStep _addNoFlagsSignpost:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x1000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x8000000000uLL;
}

- (void)_addNoFlagsSignpost:(uint64_t)a1
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

- (unint64_t)signpostsCount
{
  -[GEOStep _readSignposts]((uint64_t)self);
  return -[NSMutableArray count](self->_signposts, "count");
}

- (id)signpostAtIndex:(unint64_t)a3
{
  -[GEOStep _readSignposts]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_signposts, "objectAtIndex:", a3);
}

+ (Class)signpostType
{
  return (Class)objc_opt_class();
}

- (int)overrideTransportType
{
  os_unfair_lock_s *p_readerLock;
  $EDB2BE274159A3E7688E4593D5E8813B flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_WORD *)&flags & 0x2000) != 0)
    return self->_overrideTransportType;
  else
    return 0;
}

- (void)setOverrideTransportType:(int)a3
{
  *(_QWORD *)&self->_flags |= 0x8000002000uLL;
  self->_overrideTransportType = a3;
}

- (void)setHasOverrideTransportType:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000000000;
  if (a3)
    v3 = 0x8000002000;
  self->_flags = ($EDB2BE274159A3E7688E4593D5E8813B)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFDFFFLL | v3);
}

- (BOOL)hasOverrideTransportType
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 5) & 1;
}

- (id)overrideTransportTypeAsString:(int)a3
{
  if (a3 < 7)
    return off_1E1C08870[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsOverrideTransportType:(id)a3
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

- (int)overrideDrivingSide
{
  os_unfair_lock_s *p_readerLock;
  $EDB2BE274159A3E7688E4593D5E8813B flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_WORD *)&flags & 0x1000) != 0)
    return self->_overrideDrivingSide;
  else
    return 0;
}

- (void)setOverrideDrivingSide:(int)a3
{
  *(_QWORD *)&self->_flags |= 0x8000001000uLL;
  self->_overrideDrivingSide = a3;
}

- (void)setHasOverrideDrivingSide:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000000000;
  if (a3)
    v3 = 0x8000001000;
  self->_flags = ($EDB2BE274159A3E7688E4593D5E8813B)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFEFFFLL | v3);
}

- (BOOL)hasOverrideDrivingSide
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 4) & 1;
}

- (id)overrideDrivingSideAsString:(int)a3
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

- (int)StringAsOverrideDrivingSide:(id)a3
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

- (void)_readExitNumber
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 168));
    if ((*(_BYTE *)(a1 + 247) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOStepReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readExitNumber_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 168));
  }
}

- (BOOL)hasExitNumber
{
  -[GEOStep _readExitNumber]((uint64_t)self);
  return self->_exitNumber != 0;
}

- (GEONameInfo)exitNumber
{
  -[GEOStep _readExitNumber]((uint64_t)self);
  return self->_exitNumber;
}

- (void)setExitNumber:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x8020000000uLL;
  objc_storeStrong((id *)&self->_exitNumber, a3);
}

- (BOOL)tollPrior
{
  os_unfair_lock_s *p_readerLock;
  $EDB2BE274159A3E7688E4593D5E8813B flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  return (*(_DWORD *)&flags & 0x400000) != 0 && self->_tollPrior;
}

- (void)setTollPrior:(BOOL)a3
{
  *(_QWORD *)&self->_flags |= 0x8000400000uLL;
  self->_tollPrior = a3;
}

- (void)setHasTollPrior:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000000000;
  if (a3)
    v3 = 0x8000400000;
  self->_flags = ($EDB2BE274159A3E7688E4593D5E8813B)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFBFFFFFLL | v3);
}

- (BOOL)hasTollPrior
{
  return (*((unsigned __int8 *)&self->_flags + 2) >> 6) & 1;
}

- (BOOL)tollAhead
{
  os_unfair_lock_s *p_readerLock;
  $EDB2BE274159A3E7688E4593D5E8813B flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  return (*(_DWORD *)&flags & 0x200000) != 0 && self->_tollAhead;
}

- (void)setTollAhead:(BOOL)a3
{
  *(_QWORD *)&self->_flags |= 0x8000200000uLL;
  self->_tollAhead = a3;
}

- (void)setHasTollAhead:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000000000;
  if (a3)
    v3 = 0x8000200000;
  self->_flags = ($EDB2BE274159A3E7688E4593D5E8813B)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFDFFFFFLL | v3);
}

- (BOOL)hasTollAhead
{
  return (*((unsigned __int8 *)&self->_flags + 2) >> 5) & 1;
}

- (BOOL)endsOnFwy
{
  os_unfair_lock_s *p_readerLock;
  $EDB2BE274159A3E7688E4593D5E8813B flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  return (*(_DWORD *)&flags & 0x10000) != 0 && self->_endsOnFwy;
}

- (void)setEndsOnFwy:(BOOL)a3
{
  *(_QWORD *)&self->_flags |= 0x8000010000uLL;
  self->_endsOnFwy = a3;
}

- (void)setHasEndsOnFwy:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000000000;
  if (a3)
    v3 = 0x8000010000;
  self->_flags = ($EDB2BE274159A3E7688E4593D5E8813B)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFEFFFFLL | v3);
}

- (BOOL)hasEndsOnFwy
{
  return *((_BYTE *)&self->_flags + 2) & 1;
}

- (BOOL)toFreeway
{
  os_unfair_lock_s *p_readerLock;
  $EDB2BE274159A3E7688E4593D5E8813B flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  return (*(_DWORD *)&flags & 0x100000) != 0 && self->_toFreeway;
}

- (void)setToFreeway:(BOOL)a3
{
  *(_QWORD *)&self->_flags |= 0x8000100000uLL;
  self->_toFreeway = a3;
}

- (void)setHasToFreeway:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000000000;
  if (a3)
    v3 = 0x8000100000;
  self->_flags = ($EDB2BE274159A3E7688E4593D5E8813B)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFEFFFFFLL | v3);
}

- (BOOL)hasToFreeway
{
  return (*((unsigned __int8 *)&self->_flags + 2) >> 4) & 1;
}

- (void)_readInstructions
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 168));
    if ((*(_BYTE *)(a1 + 248) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOStepReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readInstructions_tags_1);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 168));
  }
}

- (BOOL)hasInstructions
{
  -[GEOStep _readInstructions]((uint64_t)self);
  return self->_instructions != 0;
}

- (NSString)instructions
{
  -[GEOStep _readInstructions]((uint64_t)self);
  return self->_instructions;
}

- (void)setInstructions:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x8100000000uLL;
  objc_storeStrong((id *)&self->_instructions, a3);
}

- (void)_readNotice
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 168));
    if ((*(_BYTE *)(a1 + 248) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOStepReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readNotice_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 168));
  }
}

- (BOOL)hasNotice
{
  -[GEOStep _readNotice]((uint64_t)self);
  return self->_notice != 0;
}

- (NSString)notice
{
  -[GEOStep _readNotice]((uint64_t)self);
  return self->_notice;
}

- (void)setNotice:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x8400000000uLL;
  objc_storeStrong((id *)&self->_notice, a3);
}

- (void)_readTimeCheckpoints
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 168));
    if ((*(_BYTE *)(a1 + 248) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOStepReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTimeCheckpoints_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 168));
  }
}

- (BOOL)hasTimeCheckpoints
{
  -[GEOStep _readTimeCheckpoints]((uint64_t)self);
  return self->_timeCheckpoints != 0;
}

- (GEOTimeCheckpoints)timeCheckpoints
{
  -[GEOStep _readTimeCheckpoints]((uint64_t)self);
  return self->_timeCheckpoints;
}

- (void)setTimeCheckpoints:(id)a3
{
  *(_QWORD *)&self->_flags |= 0xC000000000uLL;
  objc_storeStrong((id *)&self->_timeCheckpoints, a3);
}

- (void)_readInstructionSet
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 168));
    if ((*(_BYTE *)(a1 + 247) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOStepReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readInstructionSet_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 168));
  }
}

- (BOOL)hasInstructionSet
{
  -[GEOStep _readInstructionSet]((uint64_t)self);
  return self->_instructionSet != 0;
}

- (GEOInstructionSet)instructionSet
{
  -[GEOStep _readInstructionSet]((uint64_t)self);
  return self->_instructionSet;
}

- (void)setInstructionSet:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x8080000000uLL;
  objc_storeStrong((id *)&self->_instructionSet, a3);
}

- (BOOL)shouldChainManeuver
{
  return self->_shouldChainManeuver;
}

- (void)setShouldChainManeuver:(BOOL)a3
{
  *(_QWORD *)&self->_flags |= 0x8000040000uLL;
  self->_shouldChainManeuver = a3;
}

- (void)setHasShouldChainManeuver:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000000000;
  if (a3)
    v3 = 0x8000040000;
  self->_flags = ($EDB2BE274159A3E7688E4593D5E8813B)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFBFFFFLL | v3);
}

- (BOOL)hasShouldChainManeuver
{
  return (*((unsigned __int8 *)&self->_flags + 2) >> 2) & 1;
}

- (void)_readGuidanceEvents
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 168));
    if ((*(_BYTE *)(a1 + 247) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOStepReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readGuidanceEvents_tags_5874);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 168));
  }
}

- (NSMutableArray)guidanceEvents
{
  -[GEOStep _readGuidanceEvents]((uint64_t)self);
  return self->_guidanceEvents;
}

- (void)setGuidanceEvents:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *guidanceEvents;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x40000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x8000000000uLL;
  guidanceEvents = self->_guidanceEvents;
  self->_guidanceEvents = v4;

}

- (void)clearGuidanceEvents
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x40000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(_QWORD *)&self->_flags |= 0x8000000000uLL;
  -[NSMutableArray removeAllObjects](self->_guidanceEvents, "removeAllObjects");
}

- (void)addGuidanceEvent:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOStep _readGuidanceEvents]((uint64_t)self);
  -[GEOStep _addNoFlagsGuidanceEvent:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x40000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x8000000000uLL;
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

- (unint64_t)guidanceEventsCount
{
  -[GEOStep _readGuidanceEvents]((uint64_t)self);
  return -[NSMutableArray count](self->_guidanceEvents, "count");
}

- (id)guidanceEventAtIndex:(unint64_t)a3
{
  -[GEOStep _readGuidanceEvents]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_guidanceEvents, "objectAtIndex:", a3);
}

+ (Class)guidanceEventType
{
  return (Class)objc_opt_class();
}

- (BOOL)stayOn
{
  os_unfair_lock_s *p_readerLock;
  $EDB2BE274159A3E7688E4593D5E8813B flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  return (*(_DWORD *)&flags & 0x80000) != 0 && self->_stayOn;
}

- (void)setStayOn:(BOOL)a3
{
  *(_QWORD *)&self->_flags |= 0x8000080000uLL;
  self->_stayOn = a3;
}

- (void)setHasStayOn:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000000000;
  if (a3)
    v3 = 0x8000080000;
  self->_flags = ($EDB2BE274159A3E7688E4593D5E8813B)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFF7FFFFLL | v3);
}

- (BOOL)hasStayOn
{
  return (*((unsigned __int8 *)&self->_flags + 2) >> 3) & 1;
}

- (BOOL)maneuverLaneGuidanceSuppressed
{
  os_unfair_lock_s *p_readerLock;
  $EDB2BE274159A3E7688E4593D5E8813B flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  return (*(_DWORD *)&flags & 0x20000) != 0 && self->_maneuverLaneGuidanceSuppressed;
}

- (void)setManeuverLaneGuidanceSuppressed:(BOOL)a3
{
  *(_QWORD *)&self->_flags |= 0x8000020000uLL;
  self->_maneuverLaneGuidanceSuppressed = a3;
}

- (void)setHasManeuverLaneGuidanceSuppressed:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000000000;
  if (a3)
    v3 = 0x8000020000;
  self->_flags = ($EDB2BE274159A3E7688E4593D5E8813B)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFDFFFFLL | v3);
}

- (BOOL)hasManeuverLaneGuidanceSuppressed
{
  return (*((unsigned __int8 *)&self->_flags + 2) >> 1) & 1;
}

- (void)_readEvStateInfo
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 168));
    if ((*(_BYTE *)(a1 + 247) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOStepReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readEvStateInfo_tags_5875);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 168));
  }
}

- (BOOL)hasEvStateInfo
{
  -[GEOStep _readEvStateInfo]((uint64_t)self);
  return self->_evStateInfo != 0;
}

- (GEOEVStateInfo)evStateInfo
{
  -[GEOStep _readEvStateInfo]((uint64_t)self);
  return self->_evStateInfo;
}

- (void)setEvStateInfo:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x8010000000uLL;
  objc_storeStrong((id *)&self->_evStateInfo, a3);
}

- (void)_readEvInfo
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 168));
    if ((*(_BYTE *)(a1 + 247) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOStepReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readEvInfo_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 168));
  }
}

- (BOOL)hasEvInfo
{
  -[GEOStep _readEvInfo]((uint64_t)self);
  return self->_evInfo != 0;
}

- (GEOEVStepInfo)evInfo
{
  -[GEOStep _readEvInfo]((uint64_t)self);
  return self->_evInfo;
}

- (void)setEvInfo:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x8008000000uLL;
  objc_storeStrong((id *)&self->_evInfo, a3);
}

- (void)_readChargingInfo
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 168));
    if ((*(_BYTE *)(a1 + 247) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOStepReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readChargingInfo_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 168));
  }
}

- (BOOL)hasChargingInfo
{
  -[GEOStep _readChargingInfo]((uint64_t)self);
  return self->_chargingInfo != 0;
}

- (GEOEVChargeInfo)chargingInfo
{
  -[GEOStep _readChargingInfo]((uint64_t)self);
  return self->_chargingInfo;
}

- (void)setChargingInfo:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x8004000000uLL;
  objc_storeStrong((id *)&self->_chargingInfo, a3);
}

- (unsigned)arrivalParameterIndex
{
  return self->_arrivalParameterIndex;
}

- (void)setArrivalParameterIndex:(unsigned int)a3
{
  *(_QWORD *)&self->_flags |= 0x8000000001uLL;
  self->_arrivalParameterIndex = a3;
}

- (void)setHasArrivalParameterIndex:(BOOL)a3
{
  self->_flags = ($EDB2BE274159A3E7688E4593D5E8813B)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFFFELL | a3 | 0x8000000000);
}

- (BOOL)hasArrivalParameterIndex
{
  return *(_DWORD *)&self->_flags & 1;
}

- (void)_readArtworkOverride
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 168));
    if ((*(_BYTE *)(a1 + 247) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOStepReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readArtworkOverride_tags_5876);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 168));
  }
}

- (BOOL)hasArtworkOverride
{
  -[GEOStep _readArtworkOverride]((uint64_t)self);
  return self->_artworkOverride != 0;
}

- (GEOPBTransitArtwork)artworkOverride
{
  -[GEOStep _readArtworkOverride]((uint64_t)self);
  return self->_artworkOverride;
}

- (void)setArtworkOverride:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x8002000000uLL;
  objc_storeStrong((id *)&self->_artworkOverride, a3);
}

- (void)_readStopWaypoint
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 168));
    if ((*(_BYTE *)(a1 + 248) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOStepReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readStopWaypoint_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 168));
  }
}

- (BOOL)hasStopWaypoint
{
  -[GEOStep _readStopWaypoint]((uint64_t)self);
  return self->_stopWaypoint != 0;
}

- (GEOStopWaypoint)stopWaypoint
{
  -[GEOStep _readStopWaypoint]((uint64_t)self);
  return self->_stopWaypoint;
}

- (void)setStopWaypoint:(id)a3
{
  *(_QWORD *)&self->_flags |= 0xA000000000uLL;
  objc_storeStrong((id *)&self->_stopWaypoint, a3);
}

- (unsigned)zilchPathIndex
{
  return self->_zilchPathIndex;
}

- (void)setZilchPathIndex:(unsigned int)a3
{
  *(_QWORD *)&self->_flags |= 0x8000008000uLL;
  self->_zilchPathIndex = a3;
}

- (void)setHasZilchPathIndex:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000000000;
  if (a3)
    v3 = 0x8000008000;
  self->_flags = ($EDB2BE274159A3E7688E4593D5E8813B)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFF7FFFLL | v3);
}

- (BOOL)hasZilchPathIndex
{
  return *((unsigned __int8 *)&self->_flags + 1) >> 7;
}

- (void)_readRoadDescriptions
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 168));
    if ((*(_BYTE *)(a1 + 248) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOStepReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRoadDescriptions_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 168));
  }
}

- (NSMutableArray)roadDescriptions
{
  -[GEOStep _readRoadDescriptions]((uint64_t)self);
  return self->_roadDescriptions;
}

- (void)setRoadDescriptions:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *roadDescriptions;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x800000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x8000000000uLL;
  roadDescriptions = self->_roadDescriptions;
  self->_roadDescriptions = v4;

}

- (void)clearRoadDescriptions
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x800000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(_QWORD *)&self->_flags |= 0x8000000000uLL;
  -[NSMutableArray removeAllObjects](self->_roadDescriptions, "removeAllObjects");
}

- (void)addRoadDescription:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOStep _readRoadDescriptions]((uint64_t)self);
  -[GEOStep _addNoFlagsRoadDescription:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x800000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x8000000000uLL;
}

- (void)_addNoFlagsRoadDescription:(uint64_t)a1
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

- (unint64_t)roadDescriptionsCount
{
  -[GEOStep _readRoadDescriptions]((uint64_t)self);
  return -[NSMutableArray count](self->_roadDescriptions, "count");
}

- (id)roadDescriptionAtIndex:(unint64_t)a3
{
  -[GEOStep _readRoadDescriptions]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_roadDescriptions, "objectAtIndex:", a3);
}

+ (Class)roadDescriptionType
{
  return (Class)objc_opt_class();
}

- (unsigned)distance
{
  return self->_distance;
}

- (void)setDistance:(unsigned int)a3
{
  *(_QWORD *)&self->_flags |= 0x8000000008uLL;
  self->_distance = a3;
}

- (void)setHasDistance:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000000000;
  if (a3)
    v3 = 0x8000000008;
  self->_flags = ($EDB2BE274159A3E7688E4593D5E8813B)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFFF7 | v3);
}

- (BOOL)hasDistance
{
  return (*(_BYTE *)&self->_flags >> 3) & 1;
}

- (float)distanceMeters
{
  return self->_distanceMeters;
}

- (void)setDistanceMeters:(float)a3
{
  *(_QWORD *)&self->_flags |= 0x8000000004uLL;
  self->_distanceMeters = a3;
}

- (void)setHasDistanceMeters:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000000000;
  if (a3)
    v3 = 0x8000000004;
  self->_flags = ($EDB2BE274159A3E7688E4593D5E8813B)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFFFBLL | v3);
}

- (BOOL)hasDistanceMeters
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (unsigned)distanceCm
{
  return self->_distanceCm;
}

- (void)setDistanceCm:(unsigned int)a3
{
  *(_QWORD *)&self->_flags |= 0x8000000002uLL;
  self->_distanceCm = a3;
}

- (void)setHasDistanceCm:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000000000;
  if (a3)
    v3 = 0x8000000002;
  self->_flags = ($EDB2BE274159A3E7688E4593D5E8813B)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFFFDLL | v3);
}

- (BOOL)hasDistanceCm
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (unsigned)maneuverStartPointOffsetCm
{
  return self->_maneuverStartPointOffsetCm;
}

- (void)setManeuverStartPointOffsetCm:(unsigned int)a3
{
  *(_QWORD *)&self->_flags |= 0x8000000800uLL;
  self->_maneuverStartPointOffsetCm = a3;
}

- (void)setHasManeuverStartPointOffsetCm:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000000000;
  if (a3)
    v3 = 0x8000000800;
  self->_flags = ($EDB2BE274159A3E7688E4593D5E8813B)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFF7FFLL | v3);
}

- (BOOL)hasManeuverStartPointOffsetCm
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 3) & 1;
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
  v8.super_class = (Class)GEOStep;
  -[GEOStep description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOStep dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOStep _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  int *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __CFString *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  id v21;
  int v22;
  __CFString *v23;
  void *v24;
  uint64_t v25;
  unint64_t v26;
  id v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
  void *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  __CFString *v38;
  int v39;
  __CFString *v40;
  void *v41;
  void *v42;
  id v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  id v56;
  void *v57;
  const __CFString *v58;
  void *v59;
  id v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t k;
  void *v65;
  id v66;
  const __CFString *v67;
  uint64_t v68;
  void *v69;
  const __CFString *v70;
  void *v71;
  const __CFString *v72;
  void *v73;
  void *v74;
  void *v75;
  const __CFString *v76;
  id v77;
  void *v78;
  void *v79;
  void *v80;
  const __CFString *v81;
  id v82;
  void *v83;
  void *v84;
  void *v85;
  const __CFString *v86;
  id v87;
  void *v88;
  const __CFString *v89;
  void *v90;
  void *v91;
  void *v92;
  const __CFString *v93;
  id v94;
  void *v95;
  void *v96;
  void *v97;
  const __CFString *v98;
  id v99;
  void *v100;
  const __CFString *v101;
  double v102;
  void *v103;
  id v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t m;
  void *v109;
  id v110;
  const __CFString *v111;
  uint64_t v112;
  void *v113;
  const __CFString *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  id v119;
  id v120;
  id v121;
  void *v123;
  void *v124;
  const __CFString *v125;
  void *v126;
  const __CFString *v127;
  _QWORD v128[4];
  id v129;
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
  _BYTE v146[128];
  _BYTE v147[128];
  _BYTE v148[128];
  _BYTE v149[128];
  uint64_t v150;

  v150 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = &OBJC_IVAR___GEORegionalResourceTileData__flags;
  v6 = *(_QWORD *)(a1 + 244);
  if ((v6 & 0x4000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 228));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("stepID"));

    v6 = *(_QWORD *)(a1 + 244);
  }
  if ((v6 & 0x80) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 200));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("maneuverEndBasicIndex"));

    v6 = *(_QWORD *)(a1 + 244);
    if ((v6 & 0x200) == 0)
    {
LABEL_6:
      if ((v6 & 0x100) == 0)
        goto LABEL_7;
      goto LABEL_13;
    }
  }
  else if ((v6 & 0x200) == 0)
  {
    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 208));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("maneuverStartZilchIndex"));

  v6 = *(_QWORD *)(a1 + 244);
  if ((v6 & 0x100) == 0)
  {
LABEL_7:
    if ((v6 & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_14;
  }
LABEL_13:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 204));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("maneuverEndZilchIndex"));

  v6 = *(_QWORD *)(a1 + 244);
  if ((v6 & 0x20) == 0)
  {
LABEL_8:
    if ((v6 & 0x10) == 0)
      goto LABEL_9;
    goto LABEL_15;
  }
LABEL_14:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 192));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("hintFirstAnnouncementZilchIndex"));

  v6 = *(_QWORD *)(a1 + 244);
  if ((v6 & 0x10) == 0)
  {
LABEL_9:
    if ((v6 & 0x400) == 0)
      goto LABEL_81;
    goto LABEL_16;
  }
LABEL_15:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 188));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("expectedTime"));

  if ((*(_QWORD *)(a1 + 244) & 0x400) == 0)
    goto LABEL_81;
LABEL_16:
  v13 = CFSTR("NO_TURN");
  switch(*(_DWORD *)(a1 + 212))
  {
    case 0:
      break;
    case 1:
      v13 = CFSTR("LEFT_TURN");
      break;
    case 2:
      v13 = CFSTR("RIGHT_TURN");
      break;
    case 3:
      v13 = CFSTR("STRAIGHT_AHEAD");
      break;
    case 4:
      v13 = CFSTR("U_TURN");
      break;
    case 5:
      v13 = CFSTR("FOLLOW_ROAD");
      break;
    case 6:
      v13 = CFSTR("ENTER_ROUNDABOUT");
      break;
    case 7:
      v13 = CFSTR("EXIT_ROUNDABOUT");
      break;
    case 0xB:
      v13 = CFSTR("OFF_RAMP");
      break;
    case 0xC:
      v13 = CFSTR("ON_RAMP");
      break;
    case 0x10:
      v13 = CFSTR("ARRIVE_END_OF_NAVIGATION");
      break;
    case 0x11:
      v13 = CFSTR("START_ROUTE");
      break;
    case 0x12:
      v13 = CFSTR("ARRIVE_AT_DESTINATION");
      break;
    case 0x14:
      v13 = CFSTR("KEEP_LEFT");
      break;
    case 0x15:
      v13 = CFSTR("KEEP_RIGHT");
      break;
    case 0x16:
      v13 = CFSTR("ENTER_FERRY");
      break;
    case 0x17:
      v13 = CFSTR("EXIT_FERRY");
      break;
    case 0x18:
      v13 = CFSTR("CHANGE_FERRY");
      break;
    case 0x19:
      v13 = CFSTR("START_ROUTE_WITH_U_TURN");
      break;
    case 0x1A:
      v13 = CFSTR("U_TURN_AT_ROUNDABOUT");
      break;
    case 0x1B:
      v13 = CFSTR("LEFT_TURN_AT_END");
      break;
    case 0x1C:
      v13 = CFSTR("RIGHT_TURN_AT_END");
      break;
    case 0x1D:
      v13 = CFSTR("HIGHWAY_OFF_RAMP_LEFT");
      break;
    case 0x1E:
      v13 = CFSTR("HIGHWAY_OFF_RAMP_RIGHT");
      break;
    case 0x21:
      v13 = CFSTR("ARRIVE_AT_DESTINATION_LEFT");
      break;
    case 0x22:
      v13 = CFSTR("ARRIVE_AT_DESTINATION_RIGHT");
      break;
    case 0x23:
      v13 = CFSTR("U_TURN_WHEN_POSSIBLE");
      break;
    case 0x27:
      v13 = CFSTR("ARRIVE_END_OF_DIRECTIONS");
      break;
    case 0x29:
      v13 = CFSTR("ROUNDABOUT_EXIT_1");
      break;
    case 0x2A:
      v13 = CFSTR("ROUNDABOUT_EXIT_2");
      break;
    case 0x2B:
      v13 = CFSTR("ROUNDABOUT_EXIT_3");
      break;
    case 0x2C:
      v13 = CFSTR("ROUNDABOUT_EXIT_4");
      break;
    case 0x2D:
      v13 = CFSTR("ROUNDABOUT_EXIT_5");
      break;
    case 0x2E:
      v13 = CFSTR("ROUNDABOUT_EXIT_6");
      break;
    case 0x2F:
      v13 = CFSTR("ROUNDABOUT_EXIT_7");
      break;
    case 0x30:
      v13 = CFSTR("ROUNDABOUT_EXIT_8");
      break;
    case 0x31:
      v13 = CFSTR("ROUNDABOUT_EXIT_9");
      break;
    case 0x32:
      v13 = CFSTR("ROUNDABOUT_EXIT_10");
      break;
    case 0x33:
      v13 = CFSTR("ROUNDABOUT_EXIT_11");
      break;
    case 0x34:
      v13 = CFSTR("ROUNDABOUT_EXIT_12");
      break;
    case 0x35:
      v13 = CFSTR("ROUNDABOUT_EXIT_13");
      break;
    case 0x36:
      v13 = CFSTR("ROUNDABOUT_EXIT_14");
      break;
    case 0x37:
      v13 = CFSTR("ROUNDABOUT_EXIT_15");
      break;
    case 0x38:
      v13 = CFSTR("ROUNDABOUT_EXIT_16");
      break;
    case 0x39:
      v13 = CFSTR("ROUNDABOUT_EXIT_17");
      break;
    case 0x3A:
      v13 = CFSTR("ROUNDABOUT_EXIT_18");
      break;
    case 0x3B:
      v13 = CFSTR("ROUNDABOUT_EXIT_19");
      break;
    case 0x3C:
      v13 = CFSTR("SHARP_LEFT_TURN");
      break;
    case 0x3D:
      v13 = CFSTR("SHARP_RIGHT_TURN");
      break;
    case 0x3E:
      v13 = CFSTR("SLIGHT_LEFT_TURN");
      break;
    case 0x3F:
      v13 = CFSTR("SLIGHT_RIGHT_TURN");
      break;
    case 0x40:
      v13 = CFSTR("CHANGE_HIGHWAY");
      break;
    case 0x41:
      v13 = CFSTR("CHANGE_HIGHWAY_LEFT");
      break;
    case 0x42:
      v13 = CFSTR("CHANGE_HIGHWAY_RIGHT");
      break;
    case 0x50:
      v13 = CFSTR("TOLL_STATION");
      break;
    case 0x51:
      v13 = CFSTR("ENTER_TUNNEL");
      break;
    case 0x52:
      v13 = CFSTR("WAYPOINT_STOP");
      break;
    case 0x53:
      v13 = CFSTR("WAYPOINT_STOP_LEFT");
      break;
    case 0x54:
      v13 = CFSTR("WAYPOINT_STOP_RIGHT");
      break;
    case 0x55:
      v13 = CFSTR("RESUME_ROUTE");
      break;
    case 0x56:
      v13 = CFSTR("RESUME_ROUTE_WITH_U_TURN");
      break;
    case 0x57:
      v13 = CFSTR("CUSTOM");
      break;
    case 0x58:
      v13 = CFSTR("TURN_AROUND");
      break;
    default:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 212));
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
  }
  objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("maneuverType"));

LABEL_81:
  if (objc_msgSend(*(id *)(a1 + 112), "count"))
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 112), "count"));
    v142 = 0u;
    v143 = 0u;
    v144 = 0u;
    v145 = 0u;
    v15 = *(id *)(a1 + 112);
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v142, v149, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v143;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v143 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v142 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v20, "jsonRepresentation");
          else
            objc_msgSend(v20, "dictionaryRepresentation");
          v21 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v14, "addObject:", v21);
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v142, v149, 16);
      }
      while (v17);
    }

    objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("maneuverName"));
    v5 = &OBJC_IVAR___GEORegionalResourceTileData__flags;
  }
  if ((*(_BYTE *)(a1 + 244) & 0x40) != 0)
  {
    v22 = *(_DWORD *)(a1 + 196);
    if (v22)
    {
      if (v22 == 1)
      {
        v23 = CFSTR("JCTTYPE_ROUNDABOUT");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 196));
        v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v23 = CFSTR("JCTTYPE_NORMAL");
    }
    objc_msgSend(v4, "setObject:forKey:", v23, CFSTR("junctionType"));

  }
  if (*(_QWORD *)(a1 + 32))
  {
    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", *(_QWORD *)(a1 + 32));
    if (*(_QWORD *)(a1 + 32))
    {
      v25 = 0;
      v26 = 0;
      do
      {
        _GEOJunctionElementDictionaryRepresentation((unsigned int *)(*(_QWORD *)(a1 + 24) + v25));
        v27 = (id)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v24, "addObject:", v27);
        ++v26;
        v25 += 16;
      }
      while (v26 < *(_QWORD *)(a1 + 32));
    }
    objc_msgSend(v4, "setObject:forKey:", v24, CFSTR("junctionElement"));

    v5 = &OBJC_IVAR___GEORegionalResourceTileData__flags;
  }
  if (objc_msgSend(*(id *)(a1 + 136), "count"))
  {
    v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 136), "count"));
    v138 = 0u;
    v139 = 0u;
    v140 = 0u;
    v141 = 0u;
    v29 = *(id *)(a1 + 136);
    v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v138, v148, 16);
    if (v30)
    {
      v31 = v30;
      v32 = *(_QWORD *)v139;
      do
      {
        for (j = 0; j != v31; ++j)
        {
          if (*(_QWORD *)v139 != v32)
            objc_enumerationMutation(v29);
          v34 = *(void **)(*((_QWORD *)&v138 + 1) + 8 * j);
          if ((a2 & 1) != 0)
            objc_msgSend(v34, "jsonRepresentation");
          else
            objc_msgSend(v34, "dictionaryRepresentation");
          v35 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v28, "addObject:", v35);
        }
        v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v138, v148, 16);
      }
      while (v31);
    }

    objc_msgSend(v4, "setObject:forKey:", v28, CFSTR("signpost"));
    v5 = &OBJC_IVAR___GEORegionalResourceTileData__flags;
  }
  v36 = *(_QWORD *)(a1 + v5[915]);
  if ((v36 & 0x2000) != 0)
  {
    v37 = *(int *)(a1 + 224);
    if (v37 >= 7)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 224));
      v38 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v38 = off_1E1C08870[v37];
    }
    objc_msgSend(v4, "setObject:forKey:", v38, CFSTR("overrideTransportType"));

    v36 = *(_QWORD *)(a1 + v5[915]);
  }
  if ((v36 & 0x1000) != 0)
  {
    v39 = *(_DWORD *)(a1 + 220);
    if (v39)
    {
      if (v39 == 1)
      {
        v40 = CFSTR("LEFT_SIDE");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 220));
        v40 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v40 = CFSTR("RIGHT_SIDE");
    }
    objc_msgSend(v4, "setObject:forKey:", v40, CFSTR("overrideDrivingSide"));

  }
  objc_msgSend((id)a1, "exitNumber");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = v41;
  if (v41)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v41, "jsonRepresentation");
    else
      objc_msgSend(v41, "dictionaryRepresentation");
    v43 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKey:", v43, CFSTR("exitNumber"));
  }

  v44 = *(_QWORD *)(a1 + v5[915]);
  if ((v44 & 0x400000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 242));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v50, CFSTR("tollPrior"));

    v44 = *(_QWORD *)(a1 + 244);
    if ((v44 & 0x200000) == 0)
    {
LABEL_136:
      if ((v44 & 0x10000) == 0)
        goto LABEL_137;
      goto LABEL_148;
    }
  }
  else if ((v44 & 0x200000) == 0)
  {
    goto LABEL_136;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 241));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v51, CFSTR("tollAhead"));

  v44 = *(_QWORD *)(a1 + 244);
  if ((v44 & 0x10000) == 0)
  {
LABEL_137:
    if ((v44 & 0x100000) == 0)
      goto LABEL_139;
    goto LABEL_138;
  }
LABEL_148:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 236));
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v52, CFSTR("endsOnFwy"));

  if ((*(_QWORD *)(a1 + 244) & 0x100000) != 0)
  {
LABEL_138:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 240));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v45, CFSTR("toFreeway"));

  }
LABEL_139:
  objc_msgSend((id)a1, "instructions");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  if (v46)
    objc_msgSend(v4, "setObject:forKey:", v46, CFSTR("instructions"));

  objc_msgSend((id)a1, "notice");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  if (v47)
    objc_msgSend(v4, "setObject:forKey:", v47, CFSTR("notice"));

  objc_msgSend((id)a1, "timeCheckpoints");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = v48;
  if (v48)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v48, "jsonRepresentation");
    else
      objc_msgSend(v48, "dictionaryRepresentation");
    v53 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKey:", v53, CFSTR("timeCheckpoints"));
  }

  objc_msgSend((id)a1, "instructionSet");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = v54;
  if (v54)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v54, "jsonRepresentation");
    else
      objc_msgSend(v54, "dictionaryRepresentation");
    v56 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKey:", v56, CFSTR("instructionSet"));
  }

  if ((*(_BYTE *)(a1 + v5[915] + 2) & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 238));
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v58 = CFSTR("shouldChainManeuver");
    else
      v58 = CFSTR("should_chain_maneuver");
    objc_msgSend(v4, "setObject:forKey:", v57, v58);

  }
  if (objc_msgSend(*(id *)(a1 + 88), "count"))
  {
    v59 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 88), "count"));
    v134 = 0u;
    v135 = 0u;
    v136 = 0u;
    v137 = 0u;
    v60 = *(id *)(a1 + 88);
    v61 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v134, v147, 16);
    if (v61)
    {
      v62 = v61;
      v63 = *(_QWORD *)v135;
      do
      {
        for (k = 0; k != v62; ++k)
        {
          if (*(_QWORD *)v135 != v63)
            objc_enumerationMutation(v60);
          v65 = *(void **)(*((_QWORD *)&v134 + 1) + 8 * k);
          if ((a2 & 1) != 0)
            objc_msgSend(v65, "jsonRepresentation");
          else
            objc_msgSend(v65, "dictionaryRepresentation");
          v66 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v59, "addObject:", v66);
        }
        v62 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v134, v147, 16);
      }
      while (v62);
    }

    if (a2)
      v67 = CFSTR("guidanceEvent");
    else
      v67 = CFSTR("guidance_event");
    objc_msgSend(v4, "setObject:forKey:", v59, v67);

    v5 = &OBJC_IVAR___GEORegionalResourceTileData__flags;
  }
  v68 = *(_QWORD *)(a1 + v5[915]);
  if ((v68 & 0x80000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 239));
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v70 = CFSTR("stayOn");
    else
      v70 = CFSTR("stay_on");
    objc_msgSend(v4, "setObject:forKey:", v69, v70);

    v68 = *(_QWORD *)(a1 + 244);
  }
  if ((v68 & 0x20000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 237));
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v72 = CFSTR("maneuverLaneGuidanceSuppressed");
    else
      v72 = CFSTR("maneuver_lane_guidance_suppressed");
    objc_msgSend(v4, "setObject:forKey:", v71, v72);

  }
  objc_msgSend((id)a1, "evStateInfo");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = v73;
  if (v73)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v73, "jsonRepresentation");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      v76 = CFSTR("evStateInfo");
    }
    else
    {
      objc_msgSend(v73, "dictionaryRepresentation");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      v76 = CFSTR("ev_state_info");
    }
    v77 = v75;

    objc_msgSend(v4, "setObject:forKey:", v77, v76);
  }

  objc_msgSend((id)a1, "evInfo");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v79 = v78;
  if (v78)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v78, "jsonRepresentation");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      v81 = CFSTR("evInfo");
    }
    else
    {
      objc_msgSend(v78, "dictionaryRepresentation");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      v81 = CFSTR("ev_info");
    }
    v82 = v80;

    objc_msgSend(v4, "setObject:forKey:", v82, v81);
  }

  objc_msgSend((id)a1, "chargingInfo");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v84 = v83;
  if (v83)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v83, "jsonRepresentation");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      v86 = CFSTR("chargingInfo");
    }
    else
    {
      objc_msgSend(v83, "dictionaryRepresentation");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      v86 = CFSTR("charging_info");
    }
    v87 = v85;

    objc_msgSend(v4, "setObject:forKey:", v87, v86);
  }

  if ((*(_BYTE *)(a1 + v5[915]) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 172));
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v89 = CFSTR("arrivalParameterIndex");
    else
      v89 = CFSTR("arrival_parameter_index");
    objc_msgSend(v4, "setObject:forKey:", v88, v89);

  }
  objc_msgSend((id)a1, "artworkOverride");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  v91 = v90;
  if (v90)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v90, "jsonRepresentation");
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      v93 = CFSTR("artworkOverride");
    }
    else
    {
      objc_msgSend(v90, "dictionaryRepresentation");
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      v93 = CFSTR("artwork_override");
    }
    v94 = v92;

    objc_msgSend(v4, "setObject:forKey:", v94, v93);
  }

  objc_msgSend((id)a1, "stopWaypoint");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  v96 = v95;
  if (v95)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v95, "jsonRepresentation");
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      v98 = CFSTR("stopWaypoint");
    }
    else
    {
      objc_msgSend(v95, "dictionaryRepresentation");
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      v98 = CFSTR("stop_waypoint");
    }
    v99 = v97;

    objc_msgSend(v4, "setObject:forKey:", v99, v98);
  }

  if ((*(_BYTE *)(a1 + v5[915] + 1) & 0x80) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 232));
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v101 = CFSTR("zilchPathIndex");
    else
      v101 = CFSTR("zilch_path_index");
    objc_msgSend(v4, "setObject:forKey:", v100, v101);

  }
  if (objc_msgSend(*(id *)(a1 + 128), "count"))
  {
    v103 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 128), "count"));
    v130 = 0u;
    v131 = 0u;
    v132 = 0u;
    v133 = 0u;
    v104 = *(id *)(a1 + 128);
    v105 = objc_msgSend(v104, "countByEnumeratingWithState:objects:count:", &v130, v146, 16);
    if (v105)
    {
      v106 = v105;
      v107 = *(_QWORD *)v131;
      do
      {
        for (m = 0; m != v106; ++m)
        {
          if (*(_QWORD *)v131 != v107)
            objc_enumerationMutation(v104);
          v109 = *(void **)(*((_QWORD *)&v130 + 1) + 8 * m);
          if ((a2 & 1) != 0)
            objc_msgSend(v109, "jsonRepresentation");
          else
            objc_msgSend(v109, "dictionaryRepresentation");
          v110 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v103, "addObject:", v110);
        }
        v106 = objc_msgSend(v104, "countByEnumeratingWithState:objects:count:", &v130, v146, 16);
      }
      while (v106);
    }

    if (a2)
      v111 = CFSTR("roadDescription");
    else
      v111 = CFSTR("road_description");
    objc_msgSend(v4, "setObject:forKey:", v103, v111);

    v5 = &OBJC_IVAR___GEORegionalResourceTileData__flags;
  }
  v112 = *(_QWORD *)(a1 + v5[915]);
  if ((v112 & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 184));
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v123, CFSTR("distance"));

    v112 = *(_QWORD *)(a1 + 244);
    if ((v112 & 4) == 0)
    {
LABEL_239:
      if ((v112 & 2) == 0)
        goto LABEL_240;
LABEL_255:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 176));
      v126 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
        v127 = CFSTR("distanceCm");
      else
        v127 = CFSTR("distance_cm");
      objc_msgSend(v4, "setObject:forKey:", v126, v127);

      if ((*(_QWORD *)(a1 + 244) & 0x800) == 0)
        goto LABEL_245;
      goto LABEL_241;
    }
  }
  else if ((v112 & 4) == 0)
  {
    goto LABEL_239;
  }
  LODWORD(v102) = *(_DWORD *)(a1 + 180);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v102);
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v125 = CFSTR("distanceMeters");
  else
    v125 = CFSTR("distance_meters");
  objc_msgSend(v4, "setObject:forKey:", v124, v125);

  v112 = *(_QWORD *)(a1 + 244);
  if ((v112 & 2) != 0)
    goto LABEL_255;
LABEL_240:
  if ((v112 & 0x800) != 0)
  {
LABEL_241:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 216));
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v114 = CFSTR("maneuverStartPointOffsetCm");
    else
      v114 = CFSTR("maneuver_start_point_offset_cm");
    objc_msgSend(v4, "setObject:forKey:", v113, v114);

  }
LABEL_245:
  v115 = *(void **)(a1 + 16);
  if (v115)
  {
    objc_msgSend(v115, "dictionaryRepresentation");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    v117 = v116;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v116, "count"));
      v118 = (void *)objc_claimAutoreleasedReturnValue();
      v128[0] = MEMORY[0x1E0C809B0];
      v128[1] = 3221225472;
      v128[2] = __37__GEOStep__dictionaryRepresentation___block_invoke;
      v128[3] = &unk_1E1C00600;
      v119 = v118;
      v129 = v119;
      objc_msgSend(v117, "enumerateKeysAndObjectsUsingBlock:", v128);
      v120 = v119;

      v117 = v120;
    }
    objc_msgSend(v4, "setObject:forKey:", v117, CFSTR("Unknown Fields"));

  }
  v121 = v4;

  return v121;
}

- (id)jsonRepresentation
{
  return -[GEOStep _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __37__GEOStep__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOStep)initWithDictionary:(id)a3
{
  return (GEOStep *)-[GEOStep _initWithDictionary:isJSON:](self, a3, 0);
}

- (id)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  GEONameInfoList *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
  void *v34;
  void *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t k;
  uint64_t v41;
  GEONameInfo *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  id v46;
  uint64_t v47;
  void *v48;
  id v49;
  uint64_t v50;
  void *v51;
  GEONameInfo *v52;
  uint64_t v53;
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
  GEOTimeCheckpoints *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  GEOInstructionSet *v68;
  uint64_t v69;
  void *v70;
  const __CFString *v71;
  void *v72;
  const __CFString *v73;
  void *v74;
  id v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t m;
  uint64_t v80;
  GEOGuidanceEvent *v81;
  uint64_t v82;
  void *v83;
  const __CFString *v84;
  void *v85;
  const __CFString *v86;
  void *v87;
  const __CFString *v88;
  void *v89;
  GEOEVStateInfo *v90;
  uint64_t v91;
  void *v92;
  const __CFString *v93;
  void *v94;
  GEOEVStepInfo *v95;
  uint64_t v96;
  void *v97;
  const __CFString *v98;
  void *v99;
  GEOEVChargeInfo *v100;
  uint64_t v101;
  void *v102;
  const __CFString *v103;
  void *v104;
  const __CFString *v105;
  void *v106;
  GEOPBTransitArtwork *v107;
  uint64_t v108;
  void *v109;
  const __CFString *v110;
  void *v111;
  GEOStopWaypoint *v112;
  uint64_t v113;
  void *v114;
  const __CFString *v115;
  void *v116;
  const __CFString *v117;
  void *v118;
  id v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t n;
  uint64_t v124;
  GEORoadDescription *v125;
  uint64_t v126;
  void *v127;
  void *v128;
  const __CFString *v129;
  void *v130;
  const __CFString *v131;
  void *v132;
  const __CFString *v133;
  void *v134;
  id v136;
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
  uint64_t v149;
  uint64_t v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  _BYTE v159[128];
  _BYTE v160[128];
  _BYTE v161[128];
  _BYTE v162[128];
  _BYTE v163[128];
  uint64_t v164;

  v164 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (!a1)
    goto LABEL_366;
  a1 = (id)objc_msgSend(a1, "init");

  if (!a1)
    goto LABEL_366;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("stepID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setStepID:", objc_msgSend(v6, "unsignedIntValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("maneuverEndBasicIndex"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setManeuverEndBasicIndex:", objc_msgSend(v7, "intValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("maneuverStartZilchIndex"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setManeuverStartZilchIndex:", objc_msgSend(v8, "intValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("maneuverEndZilchIndex"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setManeuverEndZilchIndex:", objc_msgSend(v9, "intValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("hintFirstAnnouncementZilchIndex"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setHintFirstAnnouncementZilchIndex:", objc_msgSend(v10, "intValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("expectedTime"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setExpectedTime:", objc_msgSend(v11, "unsignedIntValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("maneuverType"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v136 = v5;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v13 = v12;
    if ((objc_msgSend(v13, "isEqualToString:", CFSTR("NO_TURN")) & 1) != 0)
    {
      v14 = 0;
    }
    else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("LEFT_TURN")) & 1) != 0)
    {
      v14 = 1;
    }
    else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("RIGHT_TURN")) & 1) != 0)
    {
      v14 = 2;
    }
    else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("STRAIGHT_AHEAD")) & 1) != 0)
    {
      v14 = 3;
    }
    else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("U_TURN")) & 1) != 0)
    {
      v14 = 4;
    }
    else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("FOLLOW_ROAD")) & 1) != 0)
    {
      v14 = 5;
    }
    else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("ENTER_ROUNDABOUT")) & 1) != 0)
    {
      v14 = 6;
    }
    else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("EXIT_ROUNDABOUT")) & 1) != 0)
    {
      v14 = 7;
    }
    else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("OFF_RAMP")) & 1) != 0)
    {
      v14 = 11;
    }
    else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("ON_RAMP")) & 1) != 0)
    {
      v14 = 12;
    }
    else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("ARRIVE_END_OF_NAVIGATION")) & 1) != 0)
    {
      v14 = 16;
    }
    else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("START_ROUTE")) & 1) != 0)
    {
      v14 = 17;
    }
    else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("ARRIVE_AT_DESTINATION")) & 1) != 0)
    {
      v14 = 18;
    }
    else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("KEEP_LEFT")) & 1) != 0)
    {
      v14 = 20;
    }
    else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("KEEP_RIGHT")) & 1) != 0)
    {
      v14 = 21;
    }
    else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("ENTER_FERRY")) & 1) != 0)
    {
      v14 = 22;
    }
    else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("EXIT_FERRY")) & 1) != 0)
    {
      v14 = 23;
    }
    else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("CHANGE_FERRY")) & 1) != 0)
    {
      v14 = 24;
    }
    else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("START_ROUTE_WITH_U_TURN")) & 1) != 0)
    {
      v14 = 25;
    }
    else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("U_TURN_AT_ROUNDABOUT")) & 1) != 0)
    {
      v14 = 26;
    }
    else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("LEFT_TURN_AT_END")) & 1) != 0)
    {
      v14 = 27;
    }
    else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("RIGHT_TURN_AT_END")) & 1) != 0)
    {
      v14 = 28;
    }
    else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("HIGHWAY_OFF_RAMP_LEFT")) & 1) != 0)
    {
      v14 = 29;
    }
    else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("HIGHWAY_OFF_RAMP_RIGHT")) & 1) != 0)
    {
      v14 = 30;
    }
    else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("ARRIVE_AT_DESTINATION_LEFT")) & 1) != 0)
    {
      v14 = 33;
    }
    else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("ARRIVE_AT_DESTINATION_RIGHT")) & 1) != 0)
    {
      v14 = 34;
    }
    else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("U_TURN_WHEN_POSSIBLE")) & 1) != 0)
    {
      v14 = 35;
    }
    else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("ARRIVE_END_OF_DIRECTIONS")) & 1) != 0)
    {
      v14 = 39;
    }
    else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_1")) & 1) != 0)
    {
      v14 = 41;
    }
    else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_2")) & 1) != 0)
    {
      v14 = 42;
    }
    else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_3")) & 1) != 0)
    {
      v14 = 43;
    }
    else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_4")) & 1) != 0)
    {
      v14 = 44;
    }
    else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_5")) & 1) != 0)
    {
      v14 = 45;
    }
    else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_6")) & 1) != 0)
    {
      v14 = 46;
    }
    else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_7")) & 1) != 0)
    {
      v14 = 47;
    }
    else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_8")) & 1) != 0)
    {
      v14 = 48;
    }
    else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_9")) & 1) != 0)
    {
      v14 = 49;
    }
    else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_10")) & 1) != 0)
    {
      v14 = 50;
    }
    else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_11")) & 1) != 0)
    {
      v14 = 51;
    }
    else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_12")) & 1) != 0)
    {
      v14 = 52;
    }
    else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_13")) & 1) != 0)
    {
      v14 = 53;
    }
    else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_14")) & 1) != 0)
    {
      v14 = 54;
    }
    else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_15")) & 1) != 0)
    {
      v14 = 55;
    }
    else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_16")) & 1) != 0)
    {
      v14 = 56;
    }
    else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_17")) & 1) != 0)
    {
      v14 = 57;
    }
    else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_18")) & 1) != 0)
    {
      v14 = 58;
    }
    else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_19")) & 1) != 0)
    {
      v14 = 59;
    }
    else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("SHARP_LEFT_TURN")) & 1) != 0)
    {
      v14 = 60;
    }
    else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("SHARP_RIGHT_TURN")) & 1) != 0)
    {
      v14 = 61;
    }
    else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("SLIGHT_LEFT_TURN")) & 1) != 0)
    {
      v14 = 62;
    }
    else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("SLIGHT_RIGHT_TURN")) & 1) != 0)
    {
      v14 = 63;
    }
    else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("CHANGE_HIGHWAY")) & 1) != 0)
    {
      v14 = 64;
    }
    else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("CHANGE_HIGHWAY_LEFT")) & 1) != 0)
    {
      v14 = 65;
    }
    else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("CHANGE_HIGHWAY_RIGHT")) & 1) != 0)
    {
      v14 = 66;
    }
    else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("TOLL_STATION")) & 1) != 0)
    {
      v14 = 80;
    }
    else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("ENTER_TUNNEL")) & 1) != 0)
    {
      v14 = 81;
    }
    else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("WAYPOINT_STOP")) & 1) != 0)
    {
      v14 = 82;
    }
    else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("WAYPOINT_STOP_LEFT")) & 1) != 0)
    {
      v14 = 83;
    }
    else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("WAYPOINT_STOP_RIGHT")) & 1) != 0)
    {
      v14 = 84;
    }
    else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("RESUME_ROUTE")) & 1) != 0)
    {
      v14 = 85;
    }
    else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("RESUME_ROUTE_WITH_U_TURN")) & 1) != 0)
    {
      v14 = 86;
    }
    else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("CUSTOM")) & 1) != 0)
    {
      v14 = 87;
    }
    else if (objc_msgSend(v13, "isEqualToString:", CFSTR("TURN_AROUND")))
    {
      v14 = 88;
    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_147;
    v14 = objc_msgSend(v12, "intValue");
  }
  objc_msgSend(a1, "setManeuverType:", v14);
LABEL_147:

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("maneuverName"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v157 = 0u;
    v158 = 0u;
    v155 = 0u;
    v156 = 0u;
    v16 = v15;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v155, v163, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v156;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v156 != v19)
            objc_enumerationMutation(v16);
          v21 = *(_QWORD *)(*((_QWORD *)&v155 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v22 = [GEONameInfoList alloc];
            if ((a3 & 1) != 0)
              v23 = -[GEONameInfoList initWithJSON:](v22, "initWithJSON:", v21);
            else
              v23 = -[GEONameInfoList initWithDictionary:](v22, "initWithDictionary:", v21);
            v24 = (void *)v23;
            objc_msgSend(a1, "addManeuverName:", v23);

          }
        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v155, v163, 16);
      }
      while (v18);
    }

    v5 = v136;
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("junctionType"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v26 = v25;
    if ((objc_msgSend(v26, "isEqualToString:", CFSTR("JCTTYPE_NORMAL")) & 1) != 0)
      v27 = 0;
    else
      v27 = objc_msgSend(v26, "isEqualToString:", CFSTR("JCTTYPE_ROUNDABOUT"));

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_169;
    v27 = objc_msgSend(v25, "intValue");
  }
  objc_msgSend(a1, "setJunctionType:", v27);
LABEL_169:

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("junctionElement"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v153 = 0u;
    v154 = 0u;
    v151 = 0u;
    v152 = 0u;
    v29 = v28;
    v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v151, v162, 16);
    if (v30)
    {
      v31 = v30;
      v32 = *(_QWORD *)v152;
      do
      {
        for (j = 0; j != v31; ++j)
        {
          if (*(_QWORD *)v152 != v32)
            objc_enumerationMutation(v29);
          v34 = *(void **)(*((_QWORD *)&v151 + 1) + 8 * j);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v149 = 0;
            v150 = 0;
            _GEOJunctionElementFromDictionaryRepresentation(v34, (uint64_t)&v149);
            objc_msgSend(a1, "addJunctionElement:", v149, v150);
          }
        }
        v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v151, v162, 16);
      }
      while (v31);
    }

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("signpost"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v147 = 0u;
    v148 = 0u;
    v145 = 0u;
    v146 = 0u;
    v36 = v35;
    v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v145, v161, 16);
    if (v37)
    {
      v38 = v37;
      v39 = *(_QWORD *)v146;
      do
      {
        for (k = 0; k != v38; ++k)
        {
          if (*(_QWORD *)v146 != v39)
            objc_enumerationMutation(v36);
          v41 = *(_QWORD *)(*((_QWORD *)&v145 + 1) + 8 * k);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v42 = [GEONameInfo alloc];
            if ((a3 & 1) != 0)
              v43 = -[GEONameInfo initWithJSON:](v42, "initWithJSON:", v41);
            else
              v43 = -[GEONameInfo initWithDictionary:](v42, "initWithDictionary:", v41);
            v44 = (void *)v43;
            objc_msgSend(a1, "addSignpost:", v43);

          }
        }
        v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v145, v161, 16);
      }
      while (v38);
    }

    v5 = v136;
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("overrideTransportType"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v46 = v45;
    if ((objc_msgSend(v46, "isEqualToString:", CFSTR("AUTOMOBILE")) & 1) != 0)
    {
      v47 = 0;
    }
    else if ((objc_msgSend(v46, "isEqualToString:", CFSTR("TRANSIT")) & 1) != 0)
    {
      v47 = 1;
    }
    else if ((objc_msgSend(v46, "isEqualToString:", CFSTR("WALKING")) & 1) != 0)
    {
      v47 = 2;
    }
    else if ((objc_msgSend(v46, "isEqualToString:", CFSTR("BICYCLE")) & 1) != 0)
    {
      v47 = 3;
    }
    else if ((objc_msgSend(v46, "isEqualToString:", CFSTR("UNKNOWN_TRANSPORT_TYPE")) & 1) != 0)
    {
      v47 = 4;
    }
    else if ((objc_msgSend(v46, "isEqualToString:", CFSTR("FERRY")) & 1) != 0)
    {
      v47 = 5;
    }
    else if (objc_msgSend(v46, "isEqualToString:", CFSTR("RIDESHARE")))
    {
      v47 = 6;
    }
    else
    {
      v47 = 0;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_214;
    v47 = objc_msgSend(v45, "intValue");
  }
  objc_msgSend(a1, "setOverrideTransportType:", v47);
LABEL_214:

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("overrideDrivingSide"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v49 = v48;
    if ((objc_msgSend(v49, "isEqualToString:", CFSTR("RIGHT_SIDE")) & 1) != 0)
      v50 = 0;
    else
      v50 = objc_msgSend(v49, "isEqualToString:", CFSTR("LEFT_SIDE"));

    goto LABEL_221;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v50 = objc_msgSend(v48, "intValue");
LABEL_221:
    objc_msgSend(a1, "setOverrideDrivingSide:", v50);
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("exitNumber"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v52 = [GEONameInfo alloc];
    if ((a3 & 1) != 0)
      v53 = -[GEONameInfo initWithJSON:](v52, "initWithJSON:", v51);
    else
      v53 = -[GEONameInfo initWithDictionary:](v52, "initWithDictionary:", v51);
    v54 = (void *)v53;
    objc_msgSend(a1, "setExitNumber:", v53);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("tollPrior"));
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setTollPrior:", objc_msgSend(v55, "BOOLValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("tollAhead"));
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setTollAhead:", objc_msgSend(v56, "BOOLValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("endsOnFwy"));
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setEndsOnFwy:", objc_msgSend(v57, "BOOLValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("toFreeway"));
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setToFreeway:", objc_msgSend(v58, "BOOLValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("instructions"));
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v60 = (void *)objc_msgSend(v59, "copy");
    objc_msgSend(a1, "setInstructions:", v60);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("notice"));
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v62 = (void *)objc_msgSend(v61, "copy");
    objc_msgSend(a1, "setNotice:", v62);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("timeCheckpoints"));
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v64 = [GEOTimeCheckpoints alloc];
    if ((a3 & 1) != 0)
      v65 = -[GEOTimeCheckpoints initWithJSON:](v64, "initWithJSON:", v63);
    else
      v65 = -[GEOTimeCheckpoints initWithDictionary:](v64, "initWithDictionary:", v63);
    v66 = (void *)v65;
    objc_msgSend(a1, "setTimeCheckpoints:", v65);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("instructionSet"));
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v68 = [GEOInstructionSet alloc];
    if ((a3 & 1) != 0)
      v69 = -[GEOInstructionSet initWithJSON:](v68, "initWithJSON:", v67);
    else
      v69 = -[GEOInstructionSet initWithDictionary:](v68, "initWithDictionary:", v67);
    v70 = (void *)v69;
    objc_msgSend(a1, "setInstructionSet:", v69);

  }
  if (a3)
    v71 = CFSTR("shouldChainManeuver");
  else
    v71 = CFSTR("should_chain_maneuver");
  objc_msgSend(v5, "objectForKeyedSubscript:", v71);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setShouldChainManeuver:", objc_msgSend(v72, "BOOLValue"));

  if (a3)
    v73 = CFSTR("guidanceEvent");
  else
    v73 = CFSTR("guidance_event");
  objc_msgSend(v5, "objectForKeyedSubscript:", v73);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v143 = 0u;
    v144 = 0u;
    v141 = 0u;
    v142 = 0u;
    v75 = v74;
    v76 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v141, v160, 16);
    if (v76)
    {
      v77 = v76;
      v78 = *(_QWORD *)v142;
      do
      {
        for (m = 0; m != v77; ++m)
        {
          if (*(_QWORD *)v142 != v78)
            objc_enumerationMutation(v75);
          v80 = *(_QWORD *)(*((_QWORD *)&v141 + 1) + 8 * m);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v81 = [GEOGuidanceEvent alloc];
            if ((a3 & 1) != 0)
              v82 = -[GEOGuidanceEvent initWithJSON:](v81, "initWithJSON:", v80);
            else
              v82 = -[GEOGuidanceEvent initWithDictionary:](v81, "initWithDictionary:", v80);
            v83 = (void *)v82;
            objc_msgSend(a1, "addGuidanceEvent:", v82);

          }
        }
        v77 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v141, v160, 16);
      }
      while (v77);
    }

    v5 = v136;
  }

  if (a3)
    v84 = CFSTR("stayOn");
  else
    v84 = CFSTR("stay_on");
  objc_msgSend(v5, "objectForKeyedSubscript:", v84);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setStayOn:", objc_msgSend(v85, "BOOLValue"));

  if (a3)
    v86 = CFSTR("maneuverLaneGuidanceSuppressed");
  else
    v86 = CFSTR("maneuver_lane_guidance_suppressed");
  objc_msgSend(v5, "objectForKeyedSubscript:", v86);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setManeuverLaneGuidanceSuppressed:", objc_msgSend(v87, "BOOLValue"));

  if (a3)
    v88 = CFSTR("evStateInfo");
  else
    v88 = CFSTR("ev_state_info");
  objc_msgSend(v5, "objectForKeyedSubscript:", v88);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v90 = [GEOEVStateInfo alloc];
    if ((a3 & 1) != 0)
      v91 = -[GEOEVStateInfo initWithJSON:](v90, "initWithJSON:", v89);
    else
      v91 = -[GEOEVStateInfo initWithDictionary:](v90, "initWithDictionary:", v89);
    v92 = (void *)v91;
    objc_msgSend(a1, "setEvStateInfo:", v91);

  }
  if (a3)
    v93 = CFSTR("evInfo");
  else
    v93 = CFSTR("ev_info");
  objc_msgSend(v5, "objectForKeyedSubscript:", v93);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v95 = [GEOEVStepInfo alloc];
    if ((a3 & 1) != 0)
      v96 = -[GEOEVStepInfo initWithJSON:](v95, "initWithJSON:", v94);
    else
      v96 = -[GEOEVStepInfo initWithDictionary:](v95, "initWithDictionary:", v94);
    v97 = (void *)v96;
    objc_msgSend(a1, "setEvInfo:", v96);

  }
  if (a3)
    v98 = CFSTR("chargingInfo");
  else
    v98 = CFSTR("charging_info");
  objc_msgSend(v5, "objectForKeyedSubscript:", v98);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v100 = [GEOEVChargeInfo alloc];
    if ((a3 & 1) != 0)
      v101 = -[GEOEVChargeInfo initWithJSON:](v100, "initWithJSON:", v99);
    else
      v101 = -[GEOEVChargeInfo initWithDictionary:](v100, "initWithDictionary:", v99);
    v102 = (void *)v101;
    objc_msgSend(a1, "setChargingInfo:", v101);

  }
  if (a3)
    v103 = CFSTR("arrivalParameterIndex");
  else
    v103 = CFSTR("arrival_parameter_index");
  objc_msgSend(v5, "objectForKeyedSubscript:", v103);
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setArrivalParameterIndex:", objc_msgSend(v104, "unsignedIntValue"));

  if (a3)
    v105 = CFSTR("artworkOverride");
  else
    v105 = CFSTR("artwork_override");
  objc_msgSend(v5, "objectForKeyedSubscript:", v105);
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v107 = [GEOPBTransitArtwork alloc];
    if ((a3 & 1) != 0)
      v108 = -[GEOPBTransitArtwork initWithJSON:](v107, "initWithJSON:", v106);
    else
      v108 = -[GEOPBTransitArtwork initWithDictionary:](v107, "initWithDictionary:", v106);
    v109 = (void *)v108;
    objc_msgSend(a1, "setArtworkOverride:", v108);

  }
  if (a3)
    v110 = CFSTR("stopWaypoint");
  else
    v110 = CFSTR("stop_waypoint");
  objc_msgSend(v5, "objectForKeyedSubscript:", v110);
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v112 = [GEOStopWaypoint alloc];
    if ((a3 & 1) != 0)
      v113 = -[GEOStopWaypoint initWithJSON:](v112, "initWithJSON:", v111);
    else
      v113 = -[GEOStopWaypoint initWithDictionary:](v112, "initWithDictionary:", v111);
    v114 = (void *)v113;
    objc_msgSend(a1, "setStopWaypoint:", v113);

  }
  if (a3)
    v115 = CFSTR("zilchPathIndex");
  else
    v115 = CFSTR("zilch_path_index");
  objc_msgSend(v5, "objectForKeyedSubscript:", v115);
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setZilchPathIndex:", objc_msgSend(v116, "unsignedIntValue"));

  if (a3)
    v117 = CFSTR("roadDescription");
  else
    v117 = CFSTR("road_description");
  objc_msgSend(v5, "objectForKeyedSubscript:", v117);
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v139 = 0u;
    v140 = 0u;
    v137 = 0u;
    v138 = 0u;
    v119 = v118;
    v120 = objc_msgSend(v119, "countByEnumeratingWithState:objects:count:", &v137, v159, 16);
    if (v120)
    {
      v121 = v120;
      v122 = *(_QWORD *)v138;
      do
      {
        for (n = 0; n != v121; ++n)
        {
          if (*(_QWORD *)v138 != v122)
            objc_enumerationMutation(v119);
          v124 = *(_QWORD *)(*((_QWORD *)&v137 + 1) + 8 * n);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v125 = [GEORoadDescription alloc];
            if ((a3 & 1) != 0)
              v126 = -[GEORoadDescription initWithJSON:](v125, "initWithJSON:", v124);
            else
              v126 = -[GEORoadDescription initWithDictionary:](v125, "initWithDictionary:", v124);
            v127 = (void *)v126;
            objc_msgSend(a1, "addRoadDescription:", v126);

          }
        }
        v121 = objc_msgSend(v119, "countByEnumeratingWithState:objects:count:", &v137, v159, 16);
      }
      while (v121);
    }

    v5 = v136;
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("distance"));
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setDistance:", objc_msgSend(v128, "unsignedIntValue"));

  if (a3)
    v129 = CFSTR("distanceMeters");
  else
    v129 = CFSTR("distance_meters");
  objc_msgSend(v5, "objectForKeyedSubscript:", v129);
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v130, "floatValue");
    objc_msgSend(a1, "setDistanceMeters:");
  }

  if (a3)
    v131 = CFSTR("distanceCm");
  else
    v131 = CFSTR("distance_cm");
  objc_msgSend(v5, "objectForKeyedSubscript:", v131);
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setDistanceCm:", objc_msgSend(v132, "unsignedIntValue"));

  if (a3)
    v133 = CFSTR("maneuverStartPointOffsetCm");
  else
    v133 = CFSTR("maneuver_start_point_offset_cm");
  objc_msgSend(v5, "objectForKeyedSubscript:", v133);
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setManeuverStartPointOffsetCm:", objc_msgSend(v134, "unsignedIntValue"));

  a1 = a1;
LABEL_366:

  return a1;
}

- (GEOStep)initWithJSON:(id)a3
{
  return (GEOStep *)-[GEOStep _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_5959;
    else
      v8 = (int *)&readAll__nonRecursiveTag_5960;
    GEOStepReadSpecified((uint64_t)self, (uint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEOStepCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOStepIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOStepReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  $EDB2BE274159A3E7688E4593D5E8813B flags;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  unint64_t v12;
  NSMutableArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  $EDB2BE274159A3E7688E4593D5E8813B v17;
  $EDB2BE274159A3E7688E4593D5E8813B v18;
  NSMutableArray *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t k;
  $EDB2BE274159A3E7688E4593D5E8813B v23;
  NSMutableArray *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t m;
  $EDB2BE274159A3E7688E4593D5E8813B v28;
  PBDataReader *v29;
  void *v30;
  __int128 v31;
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
  uint64_t v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  _BYTE v49[128];
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOStepIsDirty((uint64_t)self) & 1) == 0)
  {
    v29 = self->_reader;
    objc_sync_enter(v29);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v30);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v29);
    goto LABEL_103;
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOStep readAll:](self, "readAll:", 0);
  flags = self->_flags;
  if ((*(_WORD *)&flags & 0x4000) != 0)
  {
    PBDataWriterWriteUint32Field();
    flags = self->_flags;
    if ((*(_BYTE *)&flags & 0x80) == 0)
    {
LABEL_5:
      if ((*(_WORD *)&flags & 0x200) == 0)
        goto LABEL_6;
      goto LABEL_97;
    }
  }
  else if ((*(_BYTE *)&flags & 0x80) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteInt32Field();
  flags = self->_flags;
  if ((*(_WORD *)&flags & 0x200) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&flags & 0x100) == 0)
      goto LABEL_7;
    goto LABEL_98;
  }
LABEL_97:
  PBDataWriterWriteInt32Field();
  flags = self->_flags;
  if ((*(_WORD *)&flags & 0x100) == 0)
  {
LABEL_7:
    if ((*(_BYTE *)&flags & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_99;
  }
LABEL_98:
  PBDataWriterWriteInt32Field();
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 0x20) == 0)
  {
LABEL_8:
    if ((*(_BYTE *)&flags & 0x10) == 0)
      goto LABEL_9;
LABEL_100:
    PBDataWriterWriteUint32Field();
    if ((*(_QWORD *)&self->_flags & 0x400) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
LABEL_99:
  PBDataWriterWriteInt32Field();
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 0x10) != 0)
    goto LABEL_100;
LABEL_9:
  if ((*(_WORD *)&flags & 0x400) != 0)
LABEL_10:
    PBDataWriterWriteInt32Field();
LABEL_11:
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v7 = self->_maneuverNames;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v44, v51, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v45;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v45 != v9)
          objc_enumerationMutation(v7);
        PBDataWriterWriteSubmessage();
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v44, v51, 16);
    }
    while (v8);
  }

  if ((*(_BYTE *)&self->_flags & 0x40) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_junctionElementsCount)
  {
    v11 = 0;
    v12 = 0;
    do
    {
      v43 = 0;
      PBDataWriterPlaceMark();
      GEOJunctionElementWriteTo((uint64_t)&self->_junctionElements[v11]);
      PBDataWriterRecallMark();
      ++v12;
      ++v11;
    }
    while (v12 < self->_junctionElementsCount);
  }
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v13 = self->_signposts;
  v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v39, v50, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v40;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v40 != v15)
          objc_enumerationMutation(v13);
        PBDataWriterWriteSubmessage();
      }
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v39, v50, 16);
    }
    while (v14);
  }

  v17 = self->_flags;
  if ((*(_WORD *)&v17 & 0x2000) != 0)
  {
    PBDataWriterWriteInt32Field();
    v17 = self->_flags;
  }
  if ((*(_WORD *)&v17 & 0x1000) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_exitNumber)
    PBDataWriterWriteSubmessage();
  v18 = self->_flags;
  if ((*(_DWORD *)&v18 & 0x400000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v18 = self->_flags;
  }
  if ((*(_DWORD *)&v18 & 0x200000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v18 = self->_flags;
  }
  if ((*(_DWORD *)&v18 & 0x10000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v18 = self->_flags;
  }
  if ((*(_DWORD *)&v18 & 0x100000) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_instructions)
    PBDataWriterWriteStringField();
  if (self->_notice)
    PBDataWriterWriteStringField();
  if (self->_timeCheckpoints)
    PBDataWriterWriteSubmessage();
  if (self->_instructionSet)
    PBDataWriterWriteSubmessage();
  if ((*((_BYTE *)&self->_flags + 2) & 4) != 0)
    PBDataWriterWriteBOOLField();
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v19 = self->_guidanceEvents;
  v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v35, v49, 16);
  if (v20)
  {
    v21 = *(_QWORD *)v36;
    do
    {
      for (k = 0; k != v20; ++k)
      {
        if (*(_QWORD *)v36 != v21)
          objc_enumerationMutation(v19);
        PBDataWriterWriteSubmessage();
      }
      v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v35, v49, 16);
    }
    while (v20);
  }

  v23 = self->_flags;
  if ((*(_DWORD *)&v23 & 0x80000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v23 = self->_flags;
  }
  if ((*(_DWORD *)&v23 & 0x20000) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_evStateInfo)
    PBDataWriterWriteSubmessage();
  if (self->_evInfo)
    PBDataWriterWriteSubmessage();
  if (self->_chargingInfo)
    PBDataWriterWriteSubmessage();
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    PBDataWriterWriteUint32Field();
  if (self->_artworkOverride)
    PBDataWriterWriteSubmessage();
  if (self->_stopWaypoint)
    PBDataWriterWriteSubmessage();
  if ((*((_BYTE *)&self->_flags + 1) & 0x80) != 0)
    PBDataWriterWriteUint32Field();
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v24 = self->_roadDescriptions;
  v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v31, v48, 16);
  if (v25)
  {
    v26 = *(_QWORD *)v32;
    do
    {
      for (m = 0; m != v25; ++m)
      {
        if (*(_QWORD *)v32 != v26)
          objc_enumerationMutation(v24);
        PBDataWriterWriteSubmessage();
      }
      v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v31, v48, 16);
    }
    while (v25);
  }

  v28 = self->_flags;
  if ((*(_BYTE *)&v28 & 8) != 0)
  {
    PBDataWriterWriteUint32Field();
    v28 = self->_flags;
  }
  if ((*(_BYTE *)&v28 & 4) != 0)
  {
    PBDataWriterWriteFloatField();
    v28 = self->_flags;
  }
  if ((*(_BYTE *)&v28 & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    v28 = self->_flags;
  }
  if ((*(_WORD *)&v28 & 0x800) != 0)
    PBDataWriterWriteUint32Field();
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v31);
LABEL_103:

}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[GEOStep _readStopWaypoint]((uint64_t)self);
  return -[GEOStopWaypoint hasGreenTeaWithValue:](self->_stopWaypoint, "hasGreenTeaWithValue:", v3);
}

- (void)copyTo:(id)a3
{
  $EDB2BE274159A3E7688E4593D5E8813B flags;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t j;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t k;
  void *v17;
  $EDB2BE274159A3E7688E4593D5E8813B v18;
  char *v19;
  $EDB2BE274159A3E7688E4593D5E8813B v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t m;
  void *v24;
  $EDB2BE274159A3E7688E4593D5E8813B v25;
  char *v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t n;
  void *v30;
  $EDB2BE274159A3E7688E4593D5E8813B v31;
  char *v32;

  v32 = (char *)a3;
  -[GEOStep readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong((id *)v32 + 1, self->_reader);
  *((_DWORD *)v32 + 40) = self->_readerMarkPos;
  *((_DWORD *)v32 + 41) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  flags = self->_flags;
  if ((*(_WORD *)&flags & 0x4000) != 0)
  {
    *((_DWORD *)v32 + 57) = self->_stepID;
    *(_QWORD *)(v32 + 244) |= 0x4000uLL;
    flags = self->_flags;
    if ((*(_BYTE *)&flags & 0x80) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&flags & 0x200) == 0)
        goto LABEL_4;
      goto LABEL_78;
    }
  }
  else if ((*(_BYTE *)&flags & 0x80) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v32 + 50) = self->_maneuverEndBasicIndex;
  *(_QWORD *)(v32 + 244) |= 0x80uLL;
  flags = self->_flags;
  if ((*(_WORD *)&flags & 0x200) == 0)
  {
LABEL_4:
    if ((*(_WORD *)&flags & 0x100) == 0)
      goto LABEL_5;
    goto LABEL_79;
  }
LABEL_78:
  *((_DWORD *)v32 + 52) = self->_maneuverStartZilchIndex;
  *(_QWORD *)(v32 + 244) |= 0x200uLL;
  flags = self->_flags;
  if ((*(_WORD *)&flags & 0x100) == 0)
  {
LABEL_5:
    if ((*(_BYTE *)&flags & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_80;
  }
LABEL_79:
  *((_DWORD *)v32 + 51) = self->_maneuverEndZilchIndex;
  *(_QWORD *)(v32 + 244) |= 0x100uLL;
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 0x20) == 0)
  {
LABEL_6:
    if ((*(_BYTE *)&flags & 0x10) == 0)
      goto LABEL_7;
LABEL_81:
    *((_DWORD *)v32 + 47) = self->_expectedTime;
    *(_QWORD *)(v32 + 244) |= 0x10uLL;
    if ((*(_QWORD *)&self->_flags & 0x400) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_80:
  *((_DWORD *)v32 + 48) = self->_hintFirstAnnouncementZilchIndex;
  *(_QWORD *)(v32 + 244) |= 0x20uLL;
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 0x10) != 0)
    goto LABEL_81;
LABEL_7:
  if ((*(_WORD *)&flags & 0x400) != 0)
  {
LABEL_8:
    *((_DWORD *)v32 + 53) = self->_maneuverType;
    *(_QWORD *)(v32 + 244) |= 0x400uLL;
  }
LABEL_9:
  if (-[GEOStep maneuverNamesCount](self, "maneuverNamesCount"))
  {
    objc_msgSend(v32, "clearManeuverNames");
    v5 = -[GEOStep maneuverNamesCount](self, "maneuverNamesCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        -[GEOStep maneuverNameAtIndex:](self, "maneuverNameAtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "addManeuverName:", v8);

      }
    }
  }
  if ((*(_BYTE *)&self->_flags & 0x40) != 0)
  {
    *((_DWORD *)v32 + 49) = self->_junctionType;
    *(_QWORD *)(v32 + 244) |= 0x40uLL;
  }
  if (-[GEOStep junctionElementsCount](self, "junctionElementsCount"))
  {
    objc_msgSend(v32, "clearJunctionElements");
    v9 = -[GEOStep junctionElementsCount](self, "junctionElementsCount");
    if (v9)
    {
      v10 = v9;
      for (j = 0; j != v10; ++j)
      {
        v12 = -[GEOStep junctionElementAtIndex:](self, "junctionElementAtIndex:", j);
        objc_msgSend(v32, "addJunctionElement:", v12, v13);
      }
    }
  }
  if (-[GEOStep signpostsCount](self, "signpostsCount"))
  {
    objc_msgSend(v32, "clearSignposts");
    v14 = -[GEOStep signpostsCount](self, "signpostsCount");
    if (v14)
    {
      v15 = v14;
      for (k = 0; k != v15; ++k)
      {
        -[GEOStep signpostAtIndex:](self, "signpostAtIndex:", k);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "addSignpost:", v17);

      }
    }
  }
  v18 = self->_flags;
  v19 = v32;
  if ((*(_WORD *)&v18 & 0x2000) != 0)
  {
    *((_DWORD *)v32 + 56) = self->_overrideTransportType;
    *(_QWORD *)(v32 + 244) |= 0x2000uLL;
    v18 = self->_flags;
  }
  if ((*(_WORD *)&v18 & 0x1000) != 0)
  {
    *((_DWORD *)v32 + 55) = self->_overrideDrivingSide;
    *(_QWORD *)(v32 + 244) |= 0x1000uLL;
  }
  if (self->_exitNumber)
  {
    objc_msgSend(v32, "setExitNumber:");
    v19 = v32;
  }
  v20 = self->_flags;
  if ((*(_DWORD *)&v20 & 0x400000) != 0)
  {
    v19[242] = self->_tollPrior;
    *(_QWORD *)(v19 + 244) |= 0x400000uLL;
    v20 = self->_flags;
    if ((*(_DWORD *)&v20 & 0x200000) == 0)
    {
LABEL_31:
      if ((*(_DWORD *)&v20 & 0x10000) == 0)
        goto LABEL_32;
      goto LABEL_85;
    }
  }
  else if ((*(_DWORD *)&v20 & 0x200000) == 0)
  {
    goto LABEL_31;
  }
  v19[241] = self->_tollAhead;
  *(_QWORD *)(v19 + 244) |= 0x200000uLL;
  v20 = self->_flags;
  if ((*(_DWORD *)&v20 & 0x10000) == 0)
  {
LABEL_32:
    if ((*(_DWORD *)&v20 & 0x100000) == 0)
      goto LABEL_34;
    goto LABEL_33;
  }
LABEL_85:
  v19[236] = self->_endsOnFwy;
  *(_QWORD *)(v19 + 244) |= 0x10000uLL;
  if ((*(_QWORD *)&self->_flags & 0x100000) != 0)
  {
LABEL_33:
    v19[240] = self->_toFreeway;
    *(_QWORD *)(v19 + 244) |= 0x100000uLL;
  }
LABEL_34:
  if (self->_instructions)
  {
    objc_msgSend(v32, "setInstructions:");
    v19 = v32;
  }
  if (self->_notice)
  {
    objc_msgSend(v32, "setNotice:");
    v19 = v32;
  }
  if (self->_timeCheckpoints)
  {
    objc_msgSend(v32, "setTimeCheckpoints:");
    v19 = v32;
  }
  if (self->_instructionSet)
  {
    objc_msgSend(v32, "setInstructionSet:");
    v19 = v32;
  }
  if ((*((_BYTE *)&self->_flags + 2) & 4) != 0)
  {
    v19[238] = self->_shouldChainManeuver;
    *(_QWORD *)(v19 + 244) |= 0x40000uLL;
  }
  if (-[GEOStep guidanceEventsCount](self, "guidanceEventsCount"))
  {
    objc_msgSend(v32, "clearGuidanceEvents");
    v21 = -[GEOStep guidanceEventsCount](self, "guidanceEventsCount");
    if (v21)
    {
      v22 = v21;
      for (m = 0; m != v22; ++m)
      {
        -[GEOStep guidanceEventAtIndex:](self, "guidanceEventAtIndex:", m);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "addGuidanceEvent:", v24);

      }
    }
  }
  v25 = self->_flags;
  v26 = v32;
  if ((*(_DWORD *)&v25 & 0x80000) != 0)
  {
    v32[239] = self->_stayOn;
    *(_QWORD *)(v32 + 244) |= 0x80000uLL;
    v25 = self->_flags;
  }
  if ((*(_DWORD *)&v25 & 0x20000) != 0)
  {
    v32[237] = self->_maneuverLaneGuidanceSuppressed;
    *(_QWORD *)(v32 + 244) |= 0x20000uLL;
  }
  if (self->_evStateInfo)
  {
    objc_msgSend(v32, "setEvStateInfo:");
    v26 = v32;
  }
  if (self->_evInfo)
  {
    objc_msgSend(v32, "setEvInfo:");
    v26 = v32;
  }
  if (self->_chargingInfo)
  {
    objc_msgSend(v32, "setChargingInfo:");
    v26 = v32;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *((_DWORD *)v26 + 43) = self->_arrivalParameterIndex;
    *(_QWORD *)(v26 + 244) |= 1uLL;
  }
  if (self->_artworkOverride)
  {
    objc_msgSend(v32, "setArtworkOverride:");
    v26 = v32;
  }
  if (self->_stopWaypoint)
  {
    objc_msgSend(v32, "setStopWaypoint:");
    v26 = v32;
  }
  if ((*((_BYTE *)&self->_flags + 1) & 0x80) != 0)
  {
    *((_DWORD *)v26 + 58) = self->_zilchPathIndex;
    *(_QWORD *)(v26 + 244) |= 0x8000uLL;
  }
  if (-[GEOStep roadDescriptionsCount](self, "roadDescriptionsCount"))
  {
    objc_msgSend(v32, "clearRoadDescriptions");
    v27 = -[GEOStep roadDescriptionsCount](self, "roadDescriptionsCount");
    if (v27)
    {
      v28 = v27;
      for (n = 0; n != v28; ++n)
      {
        -[GEOStep roadDescriptionAtIndex:](self, "roadDescriptionAtIndex:", n);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "addRoadDescription:", v30);

      }
    }
  }
  v31 = self->_flags;
  if ((*(_BYTE *)&v31 & 8) != 0)
  {
    *((_DWORD *)v32 + 46) = self->_distance;
    *(_QWORD *)(v32 + 244) |= 8uLL;
    v31 = self->_flags;
    if ((*(_BYTE *)&v31 & 4) == 0)
    {
LABEL_72:
      if ((*(_BYTE *)&v31 & 2) == 0)
        goto LABEL_73;
LABEL_89:
      *((_DWORD *)v32 + 44) = self->_distanceCm;
      *(_QWORD *)(v32 + 244) |= 2uLL;
      if ((*(_QWORD *)&self->_flags & 0x800) == 0)
        goto LABEL_75;
      goto LABEL_74;
    }
  }
  else if ((*(_BYTE *)&v31 & 4) == 0)
  {
    goto LABEL_72;
  }
  *((_DWORD *)v32 + 45) = LODWORD(self->_distanceMeters);
  *(_QWORD *)(v32 + 244) |= 4uLL;
  v31 = self->_flags;
  if ((*(_BYTE *)&v31 & 2) != 0)
    goto LABEL_89;
LABEL_73:
  if ((*(_WORD *)&v31 & 0x800) != 0)
  {
LABEL_74:
    *((_DWORD *)v32 + 54) = self->_maneuverStartPointOffsetCm;
    *(_QWORD *)(v32 + 244) |= 0x800uLL;
  }
LABEL_75:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  $EDB2BE274159A3E7688E4593D5E8813B flags;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  unint64_t junctionElementsCount;
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  $EDB2BE274159A3E7688E4593D5E8813B v21;
  id v22;
  void *v23;
  $EDB2BE274159A3E7688E4593D5E8813B v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  NSMutableArray *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t k;
  void *v37;
  $EDB2BE274159A3E7688E4593D5E8813B v38;
  id v39;
  void *v40;
  id v41;
  void *v42;
  id v43;
  void *v44;
  id v45;
  void *v46;
  id v47;
  void *v48;
  NSMutableArray *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t m;
  void *v53;
  $EDB2BE274159A3E7688E4593D5E8813B v54;
  PBUnknownFields *v55;
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
  _BYTE v73[128];
  _BYTE v74[128];
  _BYTE v75[128];
  _BYTE v76[128];
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
  {
LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOStep readAll:](self, "readAll:", 0);
    flags = self->_flags;
    if ((*(_WORD *)&flags & 0x4000) != 0)
    {
      *(_DWORD *)(v5 + 228) = self->_stepID;
      *(_QWORD *)(v5 + 244) |= 0x4000uLL;
      flags = self->_flags;
      if ((*(_BYTE *)&flags & 0x80) == 0)
      {
LABEL_7:
        if ((*(_WORD *)&flags & 0x200) == 0)
          goto LABEL_8;
        goto LABEL_73;
      }
    }
    else if ((*(_BYTE *)&flags & 0x80) == 0)
    {
      goto LABEL_7;
    }
    *(_DWORD *)(v5 + 200) = self->_maneuverEndBasicIndex;
    *(_QWORD *)(v5 + 244) |= 0x80uLL;
    flags = self->_flags;
    if ((*(_WORD *)&flags & 0x200) == 0)
    {
LABEL_8:
      if ((*(_WORD *)&flags & 0x100) == 0)
        goto LABEL_9;
      goto LABEL_74;
    }
LABEL_73:
    *(_DWORD *)(v5 + 208) = self->_maneuverStartZilchIndex;
    *(_QWORD *)(v5 + 244) |= 0x200uLL;
    flags = self->_flags;
    if ((*(_WORD *)&flags & 0x100) == 0)
    {
LABEL_9:
      if ((*(_BYTE *)&flags & 0x20) == 0)
        goto LABEL_10;
      goto LABEL_75;
    }
LABEL_74:
    *(_DWORD *)(v5 + 204) = self->_maneuverEndZilchIndex;
    *(_QWORD *)(v5 + 244) |= 0x100uLL;
    flags = self->_flags;
    if ((*(_BYTE *)&flags & 0x20) == 0)
    {
LABEL_10:
      if ((*(_BYTE *)&flags & 0x10) == 0)
        goto LABEL_11;
      goto LABEL_76;
    }
LABEL_75:
    *(_DWORD *)(v5 + 192) = self->_hintFirstAnnouncementZilchIndex;
    *(_QWORD *)(v5 + 244) |= 0x20uLL;
    flags = self->_flags;
    if ((*(_BYTE *)&flags & 0x10) == 0)
    {
LABEL_11:
      if ((*(_WORD *)&flags & 0x400) == 0)
        goto LABEL_13;
      goto LABEL_12;
    }
LABEL_76:
    *(_DWORD *)(v5 + 188) = self->_expectedTime;
    *(_QWORD *)(v5 + 244) |= 0x10uLL;
    if ((*(_QWORD *)&self->_flags & 0x400) == 0)
    {
LABEL_13:
      v71 = 0u;
      v72 = 0u;
      v69 = 0u;
      v70 = 0u;
      v10 = self->_maneuverNames;
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v69, v76, 16);
      if (v11)
      {
        v12 = *(_QWORD *)v70;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v70 != v12)
              objc_enumerationMutation(v10);
            v14 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v69 + 1) + 8 * i), "copyWithZone:", a3);
            objc_msgSend((id)v5, "addManeuverName:", v14);

          }
          v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v69, v76, 16);
        }
        while (v11);
      }

      if ((*(_BYTE *)&self->_flags & 0x40) != 0)
      {
        *(_DWORD *)(v5 + 196) = self->_junctionType;
        *(_QWORD *)(v5 + 244) |= 0x40uLL;
      }
      junctionElementsCount = self->_junctionElementsCount;
      if (junctionElementsCount)
      {
        -[GEOStep _reserveJunctionElements:](v5, junctionElementsCount);
        memcpy(*(void **)(v5 + 24), self->_junctionElements, 16 * self->_junctionElementsCount);
        *(_QWORD *)(v5 + 32) = self->_junctionElementsCount;
      }
      v67 = 0u;
      v68 = 0u;
      v65 = 0u;
      v66 = 0u;
      v16 = self->_signposts;
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v65, v75, 16);
      if (v17)
      {
        v18 = *(_QWORD *)v66;
        do
        {
          for (j = 0; j != v17; ++j)
          {
            if (*(_QWORD *)v66 != v18)
              objc_enumerationMutation(v16);
            v20 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v65 + 1) + 8 * j), "copyWithZone:", a3);
            objc_msgSend((id)v5, "addSignpost:", v20);

          }
          v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v65, v75, 16);
        }
        while (v17);
      }

      v21 = self->_flags;
      if ((*(_WORD *)&v21 & 0x2000) != 0)
      {
        *(_DWORD *)(v5 + 224) = self->_overrideTransportType;
        *(_QWORD *)(v5 + 244) |= 0x2000uLL;
        v21 = self->_flags;
      }
      if ((*(_WORD *)&v21 & 0x1000) != 0)
      {
        *(_DWORD *)(v5 + 220) = self->_overrideDrivingSide;
        *(_QWORD *)(v5 + 244) |= 0x1000uLL;
      }
      v22 = -[GEONameInfo copyWithZone:](self->_exitNumber, "copyWithZone:", a3);
      v23 = *(void **)(v5 + 80);
      *(_QWORD *)(v5 + 80) = v22;

      v24 = self->_flags;
      if ((*(_DWORD *)&v24 & 0x400000) != 0)
      {
        *(_BYTE *)(v5 + 242) = self->_tollPrior;
        *(_QWORD *)(v5 + 244) |= 0x400000uLL;
        v24 = self->_flags;
        if ((*(_DWORD *)&v24 & 0x200000) == 0)
        {
LABEL_37:
          if ((*(_DWORD *)&v24 & 0x10000) == 0)
            goto LABEL_38;
          goto LABEL_80;
        }
      }
      else if ((*(_DWORD *)&v24 & 0x200000) == 0)
      {
        goto LABEL_37;
      }
      *(_BYTE *)(v5 + 241) = self->_tollAhead;
      *(_QWORD *)(v5 + 244) |= 0x200000uLL;
      v24 = self->_flags;
      if ((*(_DWORD *)&v24 & 0x10000) == 0)
      {
LABEL_38:
        if ((*(_DWORD *)&v24 & 0x100000) == 0)
          goto LABEL_40;
        goto LABEL_39;
      }
LABEL_80:
      *(_BYTE *)(v5 + 236) = self->_endsOnFwy;
      *(_QWORD *)(v5 + 244) |= 0x10000uLL;
      if ((*(_QWORD *)&self->_flags & 0x100000) == 0)
      {
LABEL_40:
        v25 = -[NSString copyWithZone:](self->_instructions, "copyWithZone:", a3);
        v26 = *(void **)(v5 + 104);
        *(_QWORD *)(v5 + 104) = v25;

        v27 = -[NSString copyWithZone:](self->_notice, "copyWithZone:", a3);
        v28 = *(void **)(v5 + 120);
        *(_QWORD *)(v5 + 120) = v27;

        v29 = -[GEOTimeCheckpoints copyWithZone:](self->_timeCheckpoints, "copyWithZone:", a3);
        v30 = *(void **)(v5 + 152);
        *(_QWORD *)(v5 + 152) = v29;

        v31 = -[GEOInstructionSet copyWithZone:](self->_instructionSet, "copyWithZone:", a3);
        v32 = *(void **)(v5 + 96);
        *(_QWORD *)(v5 + 96) = v31;

        if ((*((_BYTE *)&self->_flags + 2) & 4) != 0)
        {
          *(_BYTE *)(v5 + 238) = self->_shouldChainManeuver;
          *(_QWORD *)(v5 + 244) |= 0x40000uLL;
        }
        v63 = 0u;
        v64 = 0u;
        v61 = 0u;
        v62 = 0u;
        v33 = self->_guidanceEvents;
        v34 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v61, v74, 16);
        if (v34)
        {
          v35 = *(_QWORD *)v62;
          do
          {
            for (k = 0; k != v34; ++k)
            {
              if (*(_QWORD *)v62 != v35)
                objc_enumerationMutation(v33);
              v37 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v61 + 1) + 8 * k), "copyWithZone:", a3);
              objc_msgSend((id)v5, "addGuidanceEvent:", v37);

            }
            v34 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v61, v74, 16);
          }
          while (v34);
        }

        v38 = self->_flags;
        if ((*(_DWORD *)&v38 & 0x80000) != 0)
        {
          *(_BYTE *)(v5 + 239) = self->_stayOn;
          *(_QWORD *)(v5 + 244) |= 0x80000uLL;
          v38 = self->_flags;
        }
        if ((*(_DWORD *)&v38 & 0x20000) != 0)
        {
          *(_BYTE *)(v5 + 237) = self->_maneuverLaneGuidanceSuppressed;
          *(_QWORD *)(v5 + 244) |= 0x20000uLL;
        }
        v39 = -[GEOEVStateInfo copyWithZone:](self->_evStateInfo, "copyWithZone:", a3);
        v40 = *(void **)(v5 + 72);
        *(_QWORD *)(v5 + 72) = v39;

        v41 = -[GEOEVStepInfo copyWithZone:](self->_evInfo, "copyWithZone:", a3);
        v42 = *(void **)(v5 + 64);
        *(_QWORD *)(v5 + 64) = v41;

        v43 = -[GEOEVChargeInfo copyWithZone:](self->_chargingInfo, "copyWithZone:", a3);
        v44 = *(void **)(v5 + 56);
        *(_QWORD *)(v5 + 56) = v43;

        if ((*(_BYTE *)&self->_flags & 1) != 0)
        {
          *(_DWORD *)(v5 + 172) = self->_arrivalParameterIndex;
          *(_QWORD *)(v5 + 244) |= 1uLL;
        }
        v45 = -[GEOPBTransitArtwork copyWithZone:](self->_artworkOverride, "copyWithZone:", a3);
        v46 = *(void **)(v5 + 48);
        *(_QWORD *)(v5 + 48) = v45;

        v47 = -[GEOStopWaypoint copyWithZone:](self->_stopWaypoint, "copyWithZone:", a3);
        v48 = *(void **)(v5 + 144);
        *(_QWORD *)(v5 + 144) = v47;

        if ((*((_BYTE *)&self->_flags + 1) & 0x80) != 0)
        {
          *(_DWORD *)(v5 + 232) = self->_zilchPathIndex;
          *(_QWORD *)(v5 + 244) |= 0x8000uLL;
        }
        v59 = 0u;
        v60 = 0u;
        v57 = 0u;
        v58 = 0u;
        v49 = self->_roadDescriptions;
        v50 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v49, "countByEnumeratingWithState:objects:count:", &v57, v73, 16);
        if (v50)
        {
          v51 = *(_QWORD *)v58;
          do
          {
            for (m = 0; m != v50; ++m)
            {
              if (*(_QWORD *)v58 != v51)
                objc_enumerationMutation(v49);
              v53 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v57 + 1) + 8 * m), "copyWithZone:", a3, (_QWORD)v57);
              objc_msgSend((id)v5, "addRoadDescription:", v53);

            }
            v50 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v49, "countByEnumeratingWithState:objects:count:", &v57, v73, 16);
          }
          while (v50);
        }

        v54 = self->_flags;
        if ((*(_BYTE *)&v54 & 8) != 0)
        {
          *(_DWORD *)(v5 + 184) = self->_distance;
          *(_QWORD *)(v5 + 244) |= 8uLL;
          v54 = self->_flags;
          if ((*(_BYTE *)&v54 & 4) == 0)
          {
LABEL_66:
            if ((*(_BYTE *)&v54 & 2) == 0)
              goto LABEL_67;
            goto LABEL_84;
          }
        }
        else if ((*(_BYTE *)&v54 & 4) == 0)
        {
          goto LABEL_66;
        }
        *(float *)(v5 + 180) = self->_distanceMeters;
        *(_QWORD *)(v5 + 244) |= 4uLL;
        v54 = self->_flags;
        if ((*(_BYTE *)&v54 & 2) == 0)
        {
LABEL_67:
          if ((*(_WORD *)&v54 & 0x800) == 0)
          {
LABEL_69:
            v55 = self->_unknownFields;
            v8 = *(id *)(v5 + 16);
            *(_QWORD *)(v5 + 16) = v55;
            goto LABEL_70;
          }
LABEL_68:
          *(_DWORD *)(v5 + 216) = self->_maneuverStartPointOffsetCm;
          *(_QWORD *)(v5 + 244) |= 0x800uLL;
          goto LABEL_69;
        }
LABEL_84:
        *(_DWORD *)(v5 + 176) = self->_distanceCm;
        *(_QWORD *)(v5 + 244) |= 2uLL;
        if ((*(_QWORD *)&self->_flags & 0x800) == 0)
          goto LABEL_69;
        goto LABEL_68;
      }
LABEL_39:
      *(_BYTE *)(v5 + 240) = self->_toFreeway;
      *(_QWORD *)(v5 + 244) |= 0x100000uLL;
      goto LABEL_40;
    }
LABEL_12:
    *(_DWORD *)(v5 + 212) = self->_maneuverType;
    *(_QWORD *)(v5 + 244) |= 0x400uLL;
    goto LABEL_13;
  }
  v7 = reader;
  objc_sync_enter(v7);
  if ((*((_BYTE *)&self->_flags + 4) & 0x80) != 0)
  {
    objc_sync_exit(v7);

    goto LABEL_5;
  }
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  GEOStepReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  v8 = (id)v5;
  objc_sync_exit(v7);

LABEL_70:
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  char *v4;
  $EDB2BE274159A3E7688E4593D5E8813B flags;
  uint64_t v6;
  NSMutableArray *maneuverNames;
  unint64_t junctionElementsCount;
  BOOL v9;
  NSMutableArray *signposts;
  GEONameInfo *exitNumber;
  NSString *instructions;
  NSString *notice;
  GEOTimeCheckpoints *timeCheckpoints;
  GEOInstructionSet *instructionSet;
  $EDB2BE274159A3E7688E4593D5E8813B v17;
  uint64_t v18;
  NSMutableArray *guidanceEvents;
  GEOEVStateInfo *evStateInfo;
  GEOEVStepInfo *evInfo;
  GEOEVChargeInfo *chargingInfo;
  uint64_t v23;
  GEOPBTransitArtwork *artworkOverride;
  GEOStopWaypoint *stopWaypoint;
  $EDB2BE274159A3E7688E4593D5E8813B v26;
  uint64_t v27;
  NSMutableArray *roadDescriptions;
  $EDB2BE274159A3E7688E4593D5E8813B v29;
  uint64_t v30;

  v4 = (char *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_47;
  -[GEOStep readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  flags = self->_flags;
  v6 = *(_QWORD *)(v4 + 244);
  if ((*(_WORD *)&flags & 0x4000) != 0)
  {
    if ((v6 & 0x4000) == 0 || self->_stepID != *((_DWORD *)v4 + 57))
      goto LABEL_47;
  }
  else if ((v6 & 0x4000) != 0)
  {
    goto LABEL_47;
  }
  if ((*(_BYTE *)&flags & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_maneuverEndBasicIndex != *((_DWORD *)v4 + 50))
      goto LABEL_47;
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_47;
  }
  if ((*(_WORD *)&flags & 0x200) != 0)
  {
    if ((v6 & 0x200) == 0 || self->_maneuverStartZilchIndex != *((_DWORD *)v4 + 52))
      goto LABEL_47;
  }
  else if ((v6 & 0x200) != 0)
  {
    goto LABEL_47;
  }
  if ((*(_WORD *)&flags & 0x100) != 0)
  {
    if ((v6 & 0x100) == 0 || self->_maneuverEndZilchIndex != *((_DWORD *)v4 + 51))
      goto LABEL_47;
  }
  else if ((v6 & 0x100) != 0)
  {
    goto LABEL_47;
  }
  if ((*(_BYTE *)&flags & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_hintFirstAnnouncementZilchIndex != *((_DWORD *)v4 + 48))
      goto LABEL_47;
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_47;
  }
  if ((*(_BYTE *)&flags & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_expectedTime != *((_DWORD *)v4 + 47))
      goto LABEL_47;
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_47;
  }
  if ((*(_WORD *)&flags & 0x400) != 0)
  {
    if ((v6 & 0x400) == 0 || self->_maneuverType != *((_DWORD *)v4 + 53))
      goto LABEL_47;
  }
  else if ((v6 & 0x400) != 0)
  {
    goto LABEL_47;
  }
  maneuverNames = self->_maneuverNames;
  if ((unint64_t)maneuverNames | *((_QWORD *)v4 + 14))
  {
    if (!-[NSMutableArray isEqual:](maneuverNames, "isEqual:"))
      goto LABEL_47;
    flags = self->_flags;
    v6 = *(_QWORD *)(v4 + 244);
  }
  if ((*(_BYTE *)&flags & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_junctionType != *((_DWORD *)v4 + 49))
      goto LABEL_47;
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_47;
  }
  *(_DWORD *)&v29 = flags;
  LODWORD(v30) = v6;
  junctionElementsCount = self->_junctionElementsCount;
  if (junctionElementsCount != *((_QWORD *)v4 + 4)
    || memcmp(self->_junctionElements, *((const void **)v4 + 3), 16 * junctionElementsCount))
  {
    goto LABEL_47;
  }
  signposts = self->_signposts;
  if ((unint64_t)signposts | *((_QWORD *)v4 + 17))
  {
    if (!-[NSMutableArray isEqual:](signposts, "isEqual:"))
      goto LABEL_47;
    v29 = self->_flags;
    v30 = *(_QWORD *)(v4 + 244);
  }
  if ((*(_WORD *)&v29 & 0x2000) != 0)
  {
    if ((v30 & 0x2000) == 0 || self->_overrideTransportType != *((_DWORD *)v4 + 56))
      goto LABEL_47;
  }
  else if ((v30 & 0x2000) != 0)
  {
    goto LABEL_47;
  }
  if ((*(_WORD *)&v29 & 0x1000) != 0)
  {
    if ((v30 & 0x1000) == 0 || self->_overrideDrivingSide != *((_DWORD *)v4 + 55))
      goto LABEL_47;
  }
  else if ((v30 & 0x1000) != 0)
  {
    goto LABEL_47;
  }
  exitNumber = self->_exitNumber;
  if ((unint64_t)exitNumber | *((_QWORD *)v4 + 10))
  {
    if (!-[GEONameInfo isEqual:](exitNumber, "isEqual:"))
      goto LABEL_47;
    v29 = self->_flags;
    v30 = *(_QWORD *)(v4 + 244);
  }
  if ((*(_DWORD *)&v29 & 0x400000) != 0)
  {
    if ((v30 & 0x400000) == 0)
      goto LABEL_47;
    if (self->_tollPrior)
    {
      if (!v4[242])
        goto LABEL_47;
    }
    else if (v4[242])
    {
      goto LABEL_47;
    }
  }
  else if ((v30 & 0x400000) != 0)
  {
    goto LABEL_47;
  }
  if ((*(_DWORD *)&v29 & 0x200000) != 0)
  {
    if ((v30 & 0x200000) == 0)
      goto LABEL_47;
    if (self->_tollAhead)
    {
      if (!v4[241])
        goto LABEL_47;
    }
    else if (v4[241])
    {
      goto LABEL_47;
    }
  }
  else if ((v30 & 0x200000) != 0)
  {
    goto LABEL_47;
  }
  if ((*(_DWORD *)&v29 & 0x10000) != 0)
  {
    if ((v30 & 0x10000) == 0)
      goto LABEL_47;
    if (self->_endsOnFwy)
    {
      if (!v4[236])
        goto LABEL_47;
    }
    else if (v4[236])
    {
      goto LABEL_47;
    }
  }
  else if ((v30 & 0x10000) != 0)
  {
    goto LABEL_47;
  }
  if ((*(_DWORD *)&v29 & 0x100000) != 0)
  {
    if ((v30 & 0x100000) == 0)
      goto LABEL_47;
    if (self->_toFreeway)
    {
      if (!v4[240])
        goto LABEL_47;
    }
    else if (v4[240])
    {
      goto LABEL_47;
    }
  }
  else if ((v30 & 0x100000) != 0)
  {
    goto LABEL_47;
  }
  instructions = self->_instructions;
  if ((unint64_t)instructions | *((_QWORD *)v4 + 13)
    && !-[NSString isEqual:](instructions, "isEqual:"))
  {
    goto LABEL_47;
  }
  notice = self->_notice;
  if ((unint64_t)notice | *((_QWORD *)v4 + 15))
  {
    if (!-[NSString isEqual:](notice, "isEqual:"))
      goto LABEL_47;
  }
  timeCheckpoints = self->_timeCheckpoints;
  if ((unint64_t)timeCheckpoints | *((_QWORD *)v4 + 19))
  {
    if (!-[GEOTimeCheckpoints isEqual:](timeCheckpoints, "isEqual:"))
      goto LABEL_47;
  }
  instructionSet = self->_instructionSet;
  if ((unint64_t)instructionSet | *((_QWORD *)v4 + 12))
  {
    if (!-[GEOInstructionSet isEqual:](instructionSet, "isEqual:"))
      goto LABEL_47;
  }
  v17 = self->_flags;
  v18 = *(_QWORD *)(v4 + 244);
  if ((*(_DWORD *)&v17 & 0x40000) != 0)
  {
    if ((v18 & 0x40000) == 0)
      goto LABEL_47;
    if (self->_shouldChainManeuver)
    {
      if (!v4[238])
        goto LABEL_47;
    }
    else if (v4[238])
    {
      goto LABEL_47;
    }
  }
  else if ((v18 & 0x40000) != 0)
  {
    goto LABEL_47;
  }
  guidanceEvents = self->_guidanceEvents;
  if ((unint64_t)guidanceEvents | *((_QWORD *)v4 + 11))
  {
    if (!-[NSMutableArray isEqual:](guidanceEvents, "isEqual:"))
      goto LABEL_47;
    v17 = self->_flags;
    v18 = *(_QWORD *)(v4 + 244);
  }
  if ((*(_DWORD *)&v17 & 0x80000) != 0)
  {
    if ((v18 & 0x80000) == 0)
      goto LABEL_47;
    if (self->_stayOn)
    {
      if (!v4[239])
        goto LABEL_47;
    }
    else if (v4[239])
    {
      goto LABEL_47;
    }
  }
  else if ((v18 & 0x80000) != 0)
  {
    goto LABEL_47;
  }
  if ((*(_DWORD *)&v17 & 0x20000) != 0)
  {
    if ((v18 & 0x20000) == 0)
      goto LABEL_47;
    if (self->_maneuverLaneGuidanceSuppressed)
    {
      if (!v4[237])
        goto LABEL_47;
    }
    else if (v4[237])
    {
      goto LABEL_47;
    }
  }
  else if ((v18 & 0x20000) != 0)
  {
    goto LABEL_47;
  }
  evStateInfo = self->_evStateInfo;
  if ((unint64_t)evStateInfo | *((_QWORD *)v4 + 9) && !-[GEOEVStateInfo isEqual:](evStateInfo, "isEqual:"))
    goto LABEL_47;
  evInfo = self->_evInfo;
  if ((unint64_t)evInfo | *((_QWORD *)v4 + 8))
  {
    if (!-[GEOEVStepInfo isEqual:](evInfo, "isEqual:"))
      goto LABEL_47;
  }
  chargingInfo = self->_chargingInfo;
  if ((unint64_t)chargingInfo | *((_QWORD *)v4 + 7))
  {
    if (!-[GEOEVChargeInfo isEqual:](chargingInfo, "isEqual:"))
      goto LABEL_47;
  }
  v23 = *(_QWORD *)(v4 + 244);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((v23 & 1) == 0 || self->_arrivalParameterIndex != *((_DWORD *)v4 + 43))
      goto LABEL_47;
  }
  else if ((v23 & 1) != 0)
  {
    goto LABEL_47;
  }
  artworkOverride = self->_artworkOverride;
  if ((unint64_t)artworkOverride | *((_QWORD *)v4 + 6)
    && !-[GEOPBTransitArtwork isEqual:](artworkOverride, "isEqual:"))
  {
    goto LABEL_47;
  }
  stopWaypoint = self->_stopWaypoint;
  if ((unint64_t)stopWaypoint | *((_QWORD *)v4 + 18))
  {
    if (!-[GEOStopWaypoint isEqual:](stopWaypoint, "isEqual:"))
      goto LABEL_47;
  }
  v26 = self->_flags;
  v27 = *(_QWORD *)(v4 + 244);
  if ((*(_WORD *)&v26 & 0x8000) != 0)
  {
    if ((v27 & 0x8000) == 0 || self->_zilchPathIndex != *((_DWORD *)v4 + 58))
      goto LABEL_47;
  }
  else if ((v27 & 0x8000) != 0)
  {
    goto LABEL_47;
  }
  roadDescriptions = self->_roadDescriptions;
  if ((unint64_t)roadDescriptions | *((_QWORD *)v4 + 16))
  {
    if (!-[NSMutableArray isEqual:](roadDescriptions, "isEqual:"))
      goto LABEL_47;
    v26 = self->_flags;
    v27 = *(_QWORD *)(v4 + 244);
  }
  if ((*(_BYTE *)&v26 & 8) != 0)
  {
    if ((v27 & 8) == 0 || self->_distance != *((_DWORD *)v4 + 46))
      goto LABEL_47;
  }
  else if ((v27 & 8) != 0)
  {
    goto LABEL_47;
  }
  if ((*(_BYTE *)&v26 & 4) != 0)
  {
    if ((v27 & 4) == 0 || self->_distanceMeters != *((float *)v4 + 45))
      goto LABEL_47;
  }
  else if ((v27 & 4) != 0)
  {
    goto LABEL_47;
  }
  if ((*(_BYTE *)&v26 & 2) != 0)
  {
    if ((v27 & 2) == 0 || self->_distanceCm != *((_DWORD *)v4 + 44))
      goto LABEL_47;
  }
  else if ((v27 & 2) != 0)
  {
    goto LABEL_47;
  }
  if ((*(_WORD *)&v26 & 0x800) == 0)
  {
    v9 = (v27 & 0x800) == 0;
    goto LABEL_48;
  }
  if ((v27 & 0x800) != 0 && self->_maneuverStartPointOffsetCm == *((_DWORD *)v4 + 54))
  {
    v9 = 1;
    goto LABEL_48;
  }
LABEL_47:
  v9 = 0;
LABEL_48:

  return v9;
}

- (unint64_t)hash
{
  $EDB2BE274159A3E7688E4593D5E8813B flags;
  $EDB2BE274159A3E7688E4593D5E8813B v4;
  $EDB2BE274159A3E7688E4593D5E8813B v5;
  $EDB2BE274159A3E7688E4593D5E8813B v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  $EDB2BE274159A3E7688E4593D5E8813B v13;
  uint64_t v14;
  float distanceMeters;
  double v16;
  long double v17;
  double v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  NSUInteger v31;
  NSUInteger v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;

  -[GEOStep readAll:](self, "readAll:", 1);
  flags = self->_flags;
  if ((*(_WORD *)&flags & 0x4000) != 0)
  {
    v50 = 2654435761 * self->_stepID;
    if ((*(_BYTE *)&flags & 0x80) != 0)
    {
LABEL_3:
      v49 = 2654435761 * self->_maneuverEndBasicIndex;
      if ((*(_WORD *)&flags & 0x200) != 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else
  {
    v50 = 0;
    if ((*(_BYTE *)&flags & 0x80) != 0)
      goto LABEL_3;
  }
  v49 = 0;
  if ((*(_WORD *)&flags & 0x200) != 0)
  {
LABEL_4:
    v48 = 2654435761 * self->_maneuverStartZilchIndex;
    if ((*(_WORD *)&flags & 0x100) != 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  v48 = 0;
  if ((*(_WORD *)&flags & 0x100) != 0)
  {
LABEL_5:
    v47 = 2654435761 * self->_maneuverEndZilchIndex;
    if ((*(_BYTE *)&flags & 0x20) != 0)
      goto LABEL_6;
    goto LABEL_13;
  }
LABEL_12:
  v47 = 0;
  if ((*(_BYTE *)&flags & 0x20) != 0)
  {
LABEL_6:
    v46 = 2654435761 * self->_hintFirstAnnouncementZilchIndex;
    if ((*(_BYTE *)&flags & 0x10) != 0)
      goto LABEL_7;
LABEL_14:
    v45 = 0;
    if ((*(_WORD *)&flags & 0x400) != 0)
      goto LABEL_8;
    goto LABEL_15;
  }
LABEL_13:
  v46 = 0;
  if ((*(_BYTE *)&flags & 0x10) == 0)
    goto LABEL_14;
LABEL_7:
  v45 = 2654435761 * self->_expectedTime;
  if ((*(_WORD *)&flags & 0x400) != 0)
  {
LABEL_8:
    v44 = 2654435761 * self->_maneuverType;
    goto LABEL_16;
  }
LABEL_15:
  v44 = 0;
LABEL_16:
  v43 = -[NSMutableArray hash](self->_maneuverNames, "hash");
  if ((*(_BYTE *)&self->_flags & 0x40) != 0)
    v42 = 2654435761 * self->_junctionType;
  else
    v42 = 0;
  v41 = PBHashBytes();
  v40 = -[NSMutableArray hash](self->_signposts, "hash");
  v4 = self->_flags;
  if ((*(_WORD *)&v4 & 0x2000) != 0)
  {
    v39 = 2654435761 * self->_overrideTransportType;
    if ((*(_WORD *)&v4 & 0x1000) != 0)
      goto LABEL_21;
  }
  else
  {
    v39 = 0;
    if ((*(_WORD *)&v4 & 0x1000) != 0)
    {
LABEL_21:
      v38 = 2654435761 * self->_overrideDrivingSide;
      goto LABEL_24;
    }
  }
  v38 = 0;
LABEL_24:
  v37 = -[GEONameInfo hash](self->_exitNumber, "hash");
  v5 = self->_flags;
  if ((*(_DWORD *)&v5 & 0x400000) != 0)
  {
    v36 = 2654435761 * self->_tollPrior;
    if ((*(_DWORD *)&v5 & 0x200000) != 0)
    {
LABEL_26:
      v35 = 2654435761 * self->_tollAhead;
      if ((*(_DWORD *)&v5 & 0x10000) != 0)
        goto LABEL_27;
LABEL_31:
      v34 = 0;
      if ((*(_DWORD *)&v5 & 0x100000) != 0)
        goto LABEL_28;
      goto LABEL_32;
    }
  }
  else
  {
    v36 = 0;
    if ((*(_DWORD *)&v5 & 0x200000) != 0)
      goto LABEL_26;
  }
  v35 = 0;
  if ((*(_DWORD *)&v5 & 0x10000) == 0)
    goto LABEL_31;
LABEL_27:
  v34 = 2654435761 * self->_endsOnFwy;
  if ((*(_DWORD *)&v5 & 0x100000) != 0)
  {
LABEL_28:
    v33 = 2654435761 * self->_toFreeway;
    goto LABEL_33;
  }
LABEL_32:
  v33 = 0;
LABEL_33:
  v32 = -[NSString hash](self->_instructions, "hash");
  v31 = -[NSString hash](self->_notice, "hash");
  v30 = -[GEOTimeCheckpoints hash](self->_timeCheckpoints, "hash");
  v29 = -[GEOInstructionSet hash](self->_instructionSet, "hash");
  if ((*((_BYTE *)&self->_flags + 2) & 4) != 0)
    v28 = 2654435761 * self->_shouldChainManeuver;
  else
    v28 = 0;
  v27 = -[NSMutableArray hash](self->_guidanceEvents, "hash");
  v6 = self->_flags;
  if ((*(_DWORD *)&v6 & 0x80000) != 0)
  {
    v26 = 2654435761 * self->_stayOn;
    if ((*(_DWORD *)&v6 & 0x20000) != 0)
      goto LABEL_38;
  }
  else
  {
    v26 = 0;
    if ((*(_DWORD *)&v6 & 0x20000) != 0)
    {
LABEL_38:
      v25 = 2654435761 * self->_maneuverLaneGuidanceSuppressed;
      goto LABEL_41;
    }
  }
  v25 = 0;
LABEL_41:
  v24 = -[GEOEVStateInfo hash](self->_evStateInfo, "hash");
  v23 = -[GEOEVStepInfo hash](self->_evInfo, "hash");
  v7 = -[GEOEVChargeInfo hash](self->_chargingInfo, "hash");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v8 = 2654435761 * self->_arrivalParameterIndex;
  else
    v8 = 0;
  v9 = -[GEOPBTransitArtwork hash](self->_artworkOverride, "hash");
  v10 = -[GEOStopWaypoint hash](self->_stopWaypoint, "hash");
  if ((*((_BYTE *)&self->_flags + 1) & 0x80) != 0)
    v11 = 2654435761 * self->_zilchPathIndex;
  else
    v11 = 0;
  v12 = -[NSMutableArray hash](self->_roadDescriptions, "hash");
  v13 = self->_flags;
  if ((*(_BYTE *)&v13 & 8) != 0)
  {
    v14 = 2654435761 * self->_distance;
    if ((*(_BYTE *)&v13 & 4) != 0)
      goto LABEL_49;
LABEL_54:
    v19 = 0;
    goto LABEL_57;
  }
  v14 = 0;
  if ((*(_BYTE *)&v13 & 4) == 0)
    goto LABEL_54;
LABEL_49:
  distanceMeters = self->_distanceMeters;
  v16 = distanceMeters;
  if (distanceMeters < 0.0)
    v16 = -distanceMeters;
  v17 = floor(v16 + 0.5);
  v18 = (v16 - v17) * 1.84467441e19;
  v19 = 2654435761u * (unint64_t)fmod(v17, 1.84467441e19);
  if (v18 >= 0.0)
  {
    if (v18 > 0.0)
      v19 += (unint64_t)v18;
  }
  else
  {
    v19 -= (unint64_t)fabs(v18);
  }
LABEL_57:
  if ((*(_BYTE *)&v13 & 2) != 0)
  {
    v20 = 2654435761 * self->_distanceCm;
    if ((*(_WORD *)&v13 & 0x800) != 0)
      goto LABEL_59;
LABEL_61:
    v21 = 0;
    return v49 ^ v50 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v42 ^ v43 ^ v40 ^ v41 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v14 ^ v19 ^ v20 ^ v21;
  }
  v20 = 0;
  if ((*(_WORD *)&v13 & 0x800) == 0)
    goto LABEL_61;
LABEL_59:
  v21 = 2654435761 * self->_maneuverStartPointOffsetCm;
  return v49 ^ v50 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v42 ^ v43 ^ v40 ^ v41 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v14 ^ v19 ^ v20 ^ v21;
}

- (void)mergeFrom:(id)a3
{
  char *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t k;
  uint64_t v21;
  GEONameInfo *exitNumber;
  uint64_t v23;
  uint64_t v24;
  GEOTimeCheckpoints *timeCheckpoints;
  uint64_t v26;
  GEOInstructionSet *instructionSet;
  uint64_t v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t m;
  uint64_t v34;
  GEOEVStateInfo *evStateInfo;
  uint64_t v36;
  GEOEVStepInfo *evInfo;
  uint64_t v38;
  GEOEVChargeInfo *chargingInfo;
  uint64_t v40;
  GEOPBTransitArtwork *artworkOverride;
  uint64_t v42;
  GEOStopWaypoint *stopWaypoint;
  uint64_t v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t n;
  uint64_t v50;
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
  _BYTE v67[128];
  _BYTE v68[128];
  _BYTE v69[128];
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v4 = (char *)a3;
  objc_msgSend(v4, "readAll:", 0);
  v5 = *(_QWORD *)(v4 + 244);
  if ((v5 & 0x4000) != 0)
  {
    self->_stepID = *((_DWORD *)v4 + 57);
    *(_QWORD *)&self->_flags |= 0x4000uLL;
    v5 = *(_QWORD *)(v4 + 244);
    if ((v5 & 0x80) == 0)
    {
LABEL_3:
      if ((v5 & 0x200) == 0)
        goto LABEL_4;
      goto LABEL_37;
    }
  }
  else if ((v5 & 0x80) == 0)
  {
    goto LABEL_3;
  }
  self->_maneuverEndBasicIndex = *((_DWORD *)v4 + 50);
  *(_QWORD *)&self->_flags |= 0x80uLL;
  v5 = *(_QWORD *)(v4 + 244);
  if ((v5 & 0x200) == 0)
  {
LABEL_4:
    if ((v5 & 0x100) == 0)
      goto LABEL_5;
    goto LABEL_38;
  }
LABEL_37:
  self->_maneuverStartZilchIndex = *((_DWORD *)v4 + 52);
  *(_QWORD *)&self->_flags |= 0x200uLL;
  v5 = *(_QWORD *)(v4 + 244);
  if ((v5 & 0x100) == 0)
  {
LABEL_5:
    if ((v5 & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_39;
  }
LABEL_38:
  self->_maneuverEndZilchIndex = *((_DWORD *)v4 + 51);
  *(_QWORD *)&self->_flags |= 0x100uLL;
  v5 = *(_QWORD *)(v4 + 244);
  if ((v5 & 0x20) == 0)
  {
LABEL_6:
    if ((v5 & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_40;
  }
LABEL_39:
  self->_hintFirstAnnouncementZilchIndex = *((_DWORD *)v4 + 48);
  *(_QWORD *)&self->_flags |= 0x20uLL;
  v5 = *(_QWORD *)(v4 + 244);
  if ((v5 & 0x10) == 0)
  {
LABEL_7:
    if ((v5 & 0x400) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_40:
  self->_expectedTime = *((_DWORD *)v4 + 47);
  *(_QWORD *)&self->_flags |= 0x10uLL;
  if ((*(_QWORD *)(v4 + 244) & 0x400) != 0)
  {
LABEL_8:
    self->_maneuverType = *((_DWORD *)v4 + 53);
    *(_QWORD *)&self->_flags |= 0x400uLL;
  }
LABEL_9:
  v65 = 0u;
  v66 = 0u;
  v63 = 0u;
  v64 = 0u;
  v6 = *((id *)v4 + 14);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v63, v70, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v64;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v64 != v9)
          objc_enumerationMutation(v6);
        -[GEOStep addManeuverName:](self, "addManeuverName:", *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * i));
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v63, v70, 16);
    }
    while (v8);
  }

  if ((v4[244] & 0x40) != 0)
  {
    self->_junctionType = *((_DWORD *)v4 + 49);
    *(_QWORD *)&self->_flags |= 0x40uLL;
  }
  v11 = objc_msgSend(v4, "junctionElementsCount");
  if (v11)
  {
    v12 = v11;
    for (j = 0; j != v12; ++j)
    {
      v14 = objc_msgSend(v4, "junctionElementAtIndex:", j);
      -[GEOStep addJunctionElement:](self, "addJunctionElement:", v14, v15);
    }
  }
  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  v16 = *((id *)v4 + 17);
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v59, v69, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v60;
    do
    {
      for (k = 0; k != v18; ++k)
      {
        if (*(_QWORD *)v60 != v19)
          objc_enumerationMutation(v16);
        -[GEOStep addSignpost:](self, "addSignpost:", *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * k));
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v59, v69, 16);
    }
    while (v18);
  }

  v21 = *(_QWORD *)(v4 + 244);
  if ((v21 & 0x2000) != 0)
  {
    self->_overrideTransportType = *((_DWORD *)v4 + 56);
    *(_QWORD *)&self->_flags |= 0x2000uLL;
    v21 = *(_QWORD *)(v4 + 244);
  }
  if ((v21 & 0x1000) != 0)
  {
    self->_overrideDrivingSide = *((_DWORD *)v4 + 55);
    *(_QWORD *)&self->_flags |= 0x1000uLL;
  }
  exitNumber = self->_exitNumber;
  v23 = *((_QWORD *)v4 + 10);
  if (exitNumber)
  {
    if (v23)
      -[GEONameInfo mergeFrom:](exitNumber, "mergeFrom:");
  }
  else if (v23)
  {
    -[GEOStep setExitNumber:](self, "setExitNumber:");
  }
  v24 = *(_QWORD *)(v4 + 244);
  if ((v24 & 0x400000) != 0)
  {
    self->_tollPrior = v4[242];
    *(_QWORD *)&self->_flags |= 0x400000uLL;
    v24 = *(_QWORD *)(v4 + 244);
    if ((v24 & 0x200000) == 0)
    {
LABEL_46:
      if ((v24 & 0x10000) == 0)
        goto LABEL_47;
      goto LABEL_58;
    }
  }
  else if ((v24 & 0x200000) == 0)
  {
    goto LABEL_46;
  }
  self->_tollAhead = v4[241];
  *(_QWORD *)&self->_flags |= 0x200000uLL;
  v24 = *(_QWORD *)(v4 + 244);
  if ((v24 & 0x10000) == 0)
  {
LABEL_47:
    if ((v24 & 0x100000) == 0)
      goto LABEL_49;
    goto LABEL_48;
  }
LABEL_58:
  self->_endsOnFwy = v4[236];
  *(_QWORD *)&self->_flags |= 0x10000uLL;
  if ((*(_QWORD *)(v4 + 244) & 0x100000) != 0)
  {
LABEL_48:
    self->_toFreeway = v4[240];
    *(_QWORD *)&self->_flags |= 0x100000uLL;
  }
LABEL_49:
  if (*((_QWORD *)v4 + 13))
    -[GEOStep setInstructions:](self, "setInstructions:");
  if (*((_QWORD *)v4 + 15))
    -[GEOStep setNotice:](self, "setNotice:");
  timeCheckpoints = self->_timeCheckpoints;
  v26 = *((_QWORD *)v4 + 19);
  if (timeCheckpoints)
  {
    if (v26)
      -[GEOTimeCheckpoints mergeFrom:](timeCheckpoints, "mergeFrom:");
  }
  else if (v26)
  {
    -[GEOStep setTimeCheckpoints:](self, "setTimeCheckpoints:");
  }
  instructionSet = self->_instructionSet;
  v28 = *((_QWORD *)v4 + 12);
  if (instructionSet)
  {
    if (v28)
      -[GEOInstructionSet mergeFrom:](instructionSet, "mergeFrom:");
  }
  else if (v28)
  {
    -[GEOStep setInstructionSet:](self, "setInstructionSet:");
  }
  if ((v4[246] & 4) != 0)
  {
    self->_shouldChainManeuver = v4[238];
    *(_QWORD *)&self->_flags |= 0x40000uLL;
  }
  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  v29 = *((id *)v4 + 11);
  v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v55, v68, 16);
  if (v30)
  {
    v31 = v30;
    v32 = *(_QWORD *)v56;
    do
    {
      for (m = 0; m != v31; ++m)
      {
        if (*(_QWORD *)v56 != v32)
          objc_enumerationMutation(v29);
        -[GEOStep addGuidanceEvent:](self, "addGuidanceEvent:", *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * m));
      }
      v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v55, v68, 16);
    }
    while (v31);
  }

  v34 = *(_QWORD *)(v4 + 244);
  if ((v34 & 0x80000) != 0)
  {
    self->_stayOn = v4[239];
    *(_QWORD *)&self->_flags |= 0x80000uLL;
    v34 = *(_QWORD *)(v4 + 244);
  }
  if ((v34 & 0x20000) != 0)
  {
    self->_maneuverLaneGuidanceSuppressed = v4[237];
    *(_QWORD *)&self->_flags |= 0x20000uLL;
  }
  evStateInfo = self->_evStateInfo;
  v36 = *((_QWORD *)v4 + 9);
  if (evStateInfo)
  {
    if (v36)
      -[GEOEVStateInfo mergeFrom:](evStateInfo, "mergeFrom:");
  }
  else if (v36)
  {
    -[GEOStep setEvStateInfo:](self, "setEvStateInfo:");
  }
  evInfo = self->_evInfo;
  v38 = *((_QWORD *)v4 + 8);
  if (evInfo)
  {
    if (v38)
      -[GEOEVStepInfo mergeFrom:](evInfo, "mergeFrom:");
  }
  else if (v38)
  {
    -[GEOStep setEvInfo:](self, "setEvInfo:");
  }
  chargingInfo = self->_chargingInfo;
  v40 = *((_QWORD *)v4 + 7);
  if (chargingInfo)
  {
    if (v40)
      -[GEOEVChargeInfo mergeFrom:](chargingInfo, "mergeFrom:");
  }
  else if (v40)
  {
    -[GEOStep setChargingInfo:](self, "setChargingInfo:");
  }
  if ((v4[244] & 1) != 0)
  {
    self->_arrivalParameterIndex = *((_DWORD *)v4 + 43);
    *(_QWORD *)&self->_flags |= 1uLL;
  }
  artworkOverride = self->_artworkOverride;
  v42 = *((_QWORD *)v4 + 6);
  if (artworkOverride)
  {
    if (v42)
      -[GEOPBTransitArtwork mergeFrom:](artworkOverride, "mergeFrom:");
  }
  else if (v42)
  {
    -[GEOStep setArtworkOverride:](self, "setArtworkOverride:");
  }
  stopWaypoint = self->_stopWaypoint;
  v44 = *((_QWORD *)v4 + 18);
  if (stopWaypoint)
  {
    if (v44)
      -[GEOStopWaypoint mergeFrom:](stopWaypoint, "mergeFrom:");
  }
  else if (v44)
  {
    -[GEOStep setStopWaypoint:](self, "setStopWaypoint:");
  }
  if (v4[245] < 0)
  {
    self->_zilchPathIndex = *((_DWORD *)v4 + 58);
    *(_QWORD *)&self->_flags |= 0x8000uLL;
  }
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v45 = *((id *)v4 + 16);
  v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v51, v67, 16);
  if (v46)
  {
    v47 = v46;
    v48 = *(_QWORD *)v52;
    do
    {
      for (n = 0; n != v47; ++n)
      {
        if (*(_QWORD *)v52 != v48)
          objc_enumerationMutation(v45);
        -[GEOStep addRoadDescription:](self, "addRoadDescription:", *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * n), (_QWORD)v51);
      }
      v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v51, v67, 16);
    }
    while (v47);
  }

  v50 = *(_QWORD *)(v4 + 244);
  if ((v50 & 8) != 0)
  {
    self->_distance = *((_DWORD *)v4 + 46);
    *(_QWORD *)&self->_flags |= 8uLL;
    v50 = *(_QWORD *)(v4 + 244);
    if ((v50 & 4) == 0)
    {
LABEL_118:
      if ((v50 & 2) == 0)
        goto LABEL_119;
LABEL_124:
      self->_distanceCm = *((_DWORD *)v4 + 44);
      *(_QWORD *)&self->_flags |= 2uLL;
      if ((*(_QWORD *)(v4 + 244) & 0x800) == 0)
        goto LABEL_121;
      goto LABEL_120;
    }
  }
  else if ((v50 & 4) == 0)
  {
    goto LABEL_118;
  }
  self->_distanceMeters = *((float *)v4 + 45);
  *(_QWORD *)&self->_flags |= 4uLL;
  v50 = *(_QWORD *)(v4 + 244);
  if ((v50 & 2) != 0)
    goto LABEL_124;
LABEL_119:
  if ((v50 & 0x800) != 0)
  {
LABEL_120:
    self->_maneuverStartPointOffsetCm = *((_DWORD *)v4 + 54);
    *(_QWORD *)&self->_flags |= 0x800uLL;
  }
LABEL_121:

}

- (PBUnknownFields)unknownFields
{
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v5;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*((_BYTE *)&self->_flags + 2) & 0x80) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      v5 = reader;
      objc_sync_enter(v5);
      GEOStepReadSpecified((uint64_t)self, (uint64_t)self->_reader, (int *)&unknownFields_tags_5963);
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
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
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
  _BYTE v43[128];
  _BYTE v44[128];
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v3 = a3;
  v47 = *MEMORY[0x1E0C80C00];
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x8000800000uLL;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEOStep readAll:](self, "readAll:", 0);
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v7 = self->_maneuverNames;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v39, v46, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v40;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v40 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * v11++), "clearUnknownFields:", 1);
        }
        while (v9 != v11);
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v39, v46, 16);
      }
      while (v9);
    }

    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v12 = self->_signposts;
    v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v36;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v36 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * v16++), "clearUnknownFields:", 1);
        }
        while (v14 != v16);
        v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
      }
      while (v14);
    }

    -[GEONameInfo clearUnknownFields:](self->_exitNumber, "clearUnknownFields:", 1);
    -[GEOTimeCheckpoints clearUnknownFields:](self->_timeCheckpoints, "clearUnknownFields:", 1);
    -[GEOInstructionSet clearUnknownFields:](self->_instructionSet, "clearUnknownFields:", 1);
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v17 = self->_guidanceEvents;
    v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v31, v44, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v32;
      do
      {
        v21 = 0;
        do
        {
          if (*(_QWORD *)v32 != v20)
            objc_enumerationMutation(v17);
          objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * v21++), "clearUnknownFields:", 1);
        }
        while (v19 != v21);
        v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v31, v44, 16);
      }
      while (v19);
    }

    -[GEOEVStateInfo clearUnknownFields:](self->_evStateInfo, "clearUnknownFields:", 1);
    -[GEOEVStepInfo clearUnknownFields:](self->_evInfo, "clearUnknownFields:", 1);
    -[GEOEVChargeInfo clearUnknownFields:](self->_chargingInfo, "clearUnknownFields:", 1);
    -[GEOPBTransitArtwork clearUnknownFields:](self->_artworkOverride, "clearUnknownFields:", 1);
    -[GEOStopWaypoint clearUnknownFields:](self->_stopWaypoint, "clearUnknownFields:", 1);
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v22 = self->_roadDescriptions;
    v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v27, v43, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v28;
      do
      {
        v26 = 0;
        do
        {
          if (*(_QWORD *)v28 != v25)
            objc_enumerationMutation(v22);
          objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * v26++), "clearUnknownFields:", 1, (_QWORD)v27);
        }
        while (v24 != v26);
        v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v27, v43, 16);
      }
      while (v24);
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeCheckpoints, 0);
  objc_storeStrong((id *)&self->_stopWaypoint, 0);
  objc_storeStrong((id *)&self->_signposts, 0);
  objc_storeStrong((id *)&self->_roadDescriptions, 0);
  objc_storeStrong((id *)&self->_notice, 0);
  objc_storeStrong((id *)&self->_maneuverNames, 0);
  objc_storeStrong((id *)&self->_instructions, 0);
  objc_storeStrong((id *)&self->_instructionSet, 0);
  objc_storeStrong((id *)&self->_guidanceEvents, 0);
  objc_storeStrong((id *)&self->_exitNumber, 0);
  objc_storeStrong((id *)&self->_evStateInfo, 0);
  objc_storeStrong((id *)&self->_evInfo, 0);
  objc_storeStrong((id *)&self->_chargingInfo, 0);
  objc_storeStrong((id *)&self->_artworkOverride, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

- (unsigned)maneuverEndIndex
{
  unsigned int result;

  if (-[GEOStep hasManeuverEndZilchIndex](self, "hasManeuverEndZilchIndex"))
    return -[GEOStep maneuverEndZilchIndex](self, "maneuverEndZilchIndex");
  result = -[GEOStep hasManeuverEndBasicIndex](self, "hasManeuverEndBasicIndex");
  if (result)
    return -[GEOStep maneuverEndBasicIndex](self, "maneuverEndBasicIndex");
  return result;
}

- (unsigned)maneuverStartIndex
{
  if (-[GEOStep hasManeuverStartZilchIndex](self, "hasManeuverStartZilchIndex"))
    return -[GEOStep maneuverStartZilchIndex](self, "maneuverStartZilchIndex");
  else
    return -[GEOStep maneuverEndIndex](self, "maneuverEndIndex");
}

- (id)firstNameInfo
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[GEOStep maneuverNames](self, "maneuverNames");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2 && objc_msgSend(v2, "count"))
  {
    objc_msgSend(v3, "objectAtIndex:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "nameInfos");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v5, "count"))
    {
      objc_msgSend(v5, "objectAtIndex:", 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)intersectionNameInfo
{
  void *v2;
  id v3;
  uint64_t v4;
  void *i;
  void *v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[GEOStep signposts](self, "signposts", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v6, "signType") == 3)
        {
          v3 = v6;
          goto LABEL_11;
        }
      }
      v3 = (id)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (void)shieldInfo:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *i;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    -[GEOStep firstNameInfo](self, "firstNameInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "hasShieldType"))
    {
      v6 = objc_msgSend(v5, "shieldType");
      objc_msgSend(v5, "shield");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = 0u;
      v15 = 0u;
      v12 = 0u;
      v13 = 0u;
      -[GEOStep signposts](self, "signposts", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v7)
      {
        v9 = *(_QWORD *)v13;
        while (2)
        {
          for (i = 0; i != v7; i = (char *)i + 1)
          {
            if (*(_QWORD *)v13 != v9)
              objc_enumerationMutation(v8);
            v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
            if (objc_msgSend(v11, "hasShieldType"))
            {
              v6 = objc_msgSend(v11, "shieldType");
              objc_msgSend(v11, "shield");
              v7 = (void *)objc_claimAutoreleasedReturnValue();
              goto LABEL_14;
            }
          }
          v7 = (void *)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
          if (v7)
            continue;
          break;
        }
      }
      v6 = 0x7FFFFFFFLL;
LABEL_14:

    }
    if ((_DWORD)v6 == 0x7FFFFFFF || !objc_msgSend(v7, "length"))
      (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, 0, 0);
    else
      (*((void (**)(id, uint64_t, void *))v4 + 2))(v4, v6, v7);

  }
}

- (BOOL)maneuverIsHighwayExit
{
  int v4;

  if (-[GEOStep hasEndsOnFwy](self, "hasEndsOnFwy"))
    return -[GEOStep endsOnFwy](self, "endsOnFwy");
  v4 = -[GEOStep maneuverType](self, "maneuverType");
  if ((v4 - 11) <= 0x37)
    return (0xE00000000C0001uLL >> (v4 - 11)) & 1;
  else
    return 0;
}

- (id)maneuverDescription
{
  uint64_t v2;
  __CFString *v3;

  v2 = -[GEOStep maneuverType](self, "maneuverType");
  v3 = CFSTR("NO_TURN");
  switch((int)v2)
  {
    case 0:
      return v3;
    case 1:
      return CFSTR("LEFT_TURN");
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
      v3 = CFSTR("RESUME_ROUTE");
      return v3;
    case 86:
      return CFSTR("RESUME_ROUTE_WITH_U_TURN");
    case 87:
      return CFSTR("CUSTOM");
    case 88:
      return CFSTR("TURN_AROUND");
    default:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v2);
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
      return v3;
  }
}

- (id)distanceForListView
{
  void *v2;
  id *v3;
  void *v4;

  -[GEOStep instructionSet](self, "instructionSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "drivingWalkingListInstruction");
  v3 = (id *)objc_claimAutoreleasedReturnValue();
  -[GEODrivingWalkingInstruction title](v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)instructionsForListView
{
  void *v2;
  id *v3;
  void *v4;

  -[GEOStep instructionSet](self, "instructionSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "drivingWalkingListInstruction");
  v3 = (id *)objc_claimAutoreleasedReturnValue();
  -[GEODrivingWalkingInstruction normalCommands](v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)distanceForSignView
{
  void *v2;
  id *v3;
  void *v4;

  -[GEOStep instructionSet](self, "instructionSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "drivingWalkingSignInstruction");
  v3 = (id *)objc_claimAutoreleasedReturnValue();
  -[GEODrivingWalkingInstruction title](v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)mergeInstructionsForSignView
{
  void *v2;
  id *v3;
  void *v4;

  -[GEOStep instructionSet](self, "instructionSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "drivingWalkingSignInstruction");
  v3 = (id *)objc_claimAutoreleasedReturnValue();
  -[GEODrivingWalkingInstruction mergeCommands](v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)continueInstructionsForSignView
{
  void *v2;
  id *v3;
  void *v4;

  -[GEOStep instructionSet](self, "instructionSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "drivingWalkingSignInstruction");
  v3 = (id *)objc_claimAutoreleasedReturnValue();
  -[GEODrivingWalkingInstruction continueCommands](v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)normalInstructionsForSignView
{
  void *v2;
  id *v3;
  void *v4;

  -[GEOStep instructionSet](self, "instructionSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "drivingWalkingSignInstruction");
  v3 = (id *)objc_claimAutoreleasedReturnValue();
  -[GEODrivingWalkingInstruction normalCommands](v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)proceedInstructionForSpoken
{
  void *v2;
  void *v3;
  void *v4;

  -[GEOStep instructionSet](self, "instructionSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "drivingWalkingSpokenInstruction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "proceedStage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)continueInstructionForSpoken
{
  void *v2;
  void *v3;
  void *v4;

  -[GEOStep instructionSet](self, "instructionSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "drivingWalkingSpokenInstruction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "continueStage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)initialInstructionForSpoken
{
  void *v2;
  void *v3;
  void *v4;

  -[GEOStep instructionSet](self, "instructionSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "drivingWalkingSpokenInstruction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "initialStage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)prepareInstructionForSpoken
{
  void *v2;
  void *v3;
  void *v4;

  -[GEOStep instructionSet](self, "instructionSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "drivingWalkingSpokenInstruction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preparationStage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)executionInstructionsForSpoken
{
  void *v2;
  void *v3;
  void *v4;

  -[GEOStep instructionSet](self, "instructionSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "drivingWalkingSpokenInstruction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "executionStages");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)roadName
{
  int v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = -[GEOStep maneuverType](self, "maneuverType");
  if (v3 != 4)
  {
    -[GEOStep firstNameInfo](self, "firstNameInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "name");
    v5 = (id)objc_claimAutoreleasedReturnValue();

    if (v5 && objc_msgSend(v5, "length"))
      return v5;

  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[GEOStep signposts](self, "signposts", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v7 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v6);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "name");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10;
        if (v10 && objc_msgSend(v10, "length"))
        {
          v12 = objc_msgSend(v9, "signType");
          if (v12 == 3)
          {
            if (v3 == 4)
              goto LABEL_22;
          }
          else if (v12 == 1 && v3 != 4)
          {
LABEL_22:
            v5 = v11;

            goto LABEL_23;
          }
        }

      }
      v5 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_23:

  return v5;
}

@end
