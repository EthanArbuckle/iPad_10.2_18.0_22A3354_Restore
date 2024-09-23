@implementation GEOCompanionCyclingStep

- (GEOCompanionCyclingStep)init
{
  GEOCompanionCyclingStep *v2;
  GEOCompanionCyclingStep *v3;
  GEOCompanionCyclingStep *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOCompanionCyclingStep;
  v2 = -[GEOCompanionCyclingStep init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOCompanionCyclingStep)initWithData:(id)a3
{
  GEOCompanionCyclingStep *v3;
  GEOCompanionCyclingStep *v4;
  GEOCompanionCyclingStep *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOCompanionCyclingStep;
  v3 = -[GEOCompanionCyclingStep initWithData:](&v7, sel_initWithData_, a3);
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

  -[GEOCompanionCyclingStep clearJunctionElements](self, "clearJunctionElements");
  v3.receiver = self;
  v3.super_class = (Class)GEOCompanionCyclingStep;
  -[GEOCompanionCyclingStep dealloc](&v3, sel_dealloc);
}

- (int)maneuverType
{
  os_unfair_lock_s *p_readerLock;
  __int16 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 4) != 0)
    return self->_maneuverType;
  else
    return 0;
}

- (void)setManeuverType:(int)a3
{
  *(_WORD *)&self->_flags |= 0x804u;
  self->_maneuverType = a3;
}

- (void)setHasManeuverType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2052;
  else
    v3 = 2048;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFB | v3;
}

- (BOOL)hasManeuverType
{
  return (*(_WORD *)&self->_flags >> 2) & 1;
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

- (void)_readShield
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 112) & 0x200) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOCompanionCyclingStepReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readShield_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (BOOL)hasShield
{
  -[GEOCompanionCyclingStep _readShield]((uint64_t)self);
  return self->_shield != 0;
}

- (NSString)shield
{
  -[GEOCompanionCyclingStep _readShield]((uint64_t)self);
  return self->_shield;
}

- (void)setShield:(id)a3
{
  *(_WORD *)&self->_flags |= 0xA00u;
  objc_storeStrong((id *)&self->_shield, a3);
}

- (int)shieldType
{
  return self->_shieldType;
}

- (void)setShieldType:(int)a3
{
  *(_WORD *)&self->_flags |= 0x808u;
  self->_shieldType = a3;
}

- (void)setHasShieldType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2056;
  else
    v3 = 2048;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFF7 | v3;
}

- (BOOL)hasShieldType
{
  return (*(_WORD *)&self->_flags >> 3) & 1;
}

- (int)junctionType
{
  os_unfair_lock_s *p_readerLock;
  __int16 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 2) != 0)
    return self->_junctionType;
  else
    return 0;
}

- (void)setJunctionType:(int)a3
{
  *(_WORD *)&self->_flags |= 0x802u;
  self->_junctionType = a3;
}

- (void)setHasJunctionType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2050;
  else
    v3 = 2048;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasJunctionType
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
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
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 112) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOCompanionCyclingStepReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readJunctionElements_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (unint64_t)junctionElementsCount
{
  -[GEOCompanionCyclingStep _readJunctionElements]((uint64_t)self);
  return self->_junctionElementsCount;
}

- (GEOJunctionElement)junctionElements
{
  -[GEOCompanionCyclingStep _readJunctionElements]((uint64_t)self);
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
    v4 = *(_QWORD *)(a1 + 24);
    v5 = v4 + a2;
    if (v4 + a2 <= v4)
      return 0;
    v6 = *(_QWORD *)(a1 + 32);
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
    result = (uint64_t)malloc_type_realloc(*(void **)(a1 + 16), 16 * v9, 0x4F87FA5FuLL);
    if (result)
    {
      *(_QWORD *)(a1 + 32) = v9;
      *(_QWORD *)(a1 + 16) = result;
      bzero((void *)(result + 16 * *(_QWORD *)(a1 + 24)), 16 * (v9 - *(_QWORD *)(a1 + 24)));
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
  *(_WORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x800u;
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
  -[GEOCompanionCyclingStep _readJunctionElements]((uint64_t)self);
  if (self && -[GEOCompanionCyclingStep _reserveJunctionElements:]((uint64_t)self, 1uLL))
  {
    v6 = &self->_junctionElements[self->_junctionElementsCount];
    *(_QWORD *)&v6->var0 = v4;
    *(_QWORD *)&v6->var2 = v3;
    ++self->_junctionElementsCount;
  }
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x800u;
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

  -[GEOCompanionCyclingStep _readJunctionElements]((uint64_t)self);
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
  *(_WORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x800u;
  -[GEOCompanionCyclingStep clearJunctionElements](self, "clearJunctionElements");
  if (-[GEOCompanionCyclingStep _reserveJunctionElements:]((uint64_t)self, a4))
  {
    memcpy(self->_junctionElements, a3, 16 * a4);
    self->_junctionElementsCount = a4;
  }
}

- (void)_readManeuverNames
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 112) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOCompanionCyclingStepReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readManeuverNames_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (NSMutableArray)maneuverNames
{
  -[GEOCompanionCyclingStep _readManeuverNames]((uint64_t)self);
  return self->_maneuverNames;
}

- (void)setManeuverNames:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *maneuverNames;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x100u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x800u;
  maneuverNames = self->_maneuverNames;
  self->_maneuverNames = v4;

}

- (void)clearManeuverNames
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x100u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x800u;
  -[NSMutableArray removeAllObjects](self->_maneuverNames, "removeAllObjects");
}

- (void)addManeuverName:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOCompanionCyclingStep _readManeuverNames]((uint64_t)self);
  -[GEOCompanionCyclingStep _addNoFlagsManeuverName:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x100u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x800u;
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

- (unint64_t)maneuverNamesCount
{
  -[GEOCompanionCyclingStep _readManeuverNames]((uint64_t)self);
  return -[NSMutableArray count](self->_maneuverNames, "count");
}

- (id)maneuverNameAtIndex:(unint64_t)a3
{
  -[GEOCompanionCyclingStep _readManeuverNames]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_maneuverNames, "objectAtIndex:", a3);
}

+ (Class)maneuverNameType
{
  return (Class)objc_opt_class();
}

- (void)_readSignposts
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 112) & 0x400) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOCompanionCyclingStepReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSignposts_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (NSMutableArray)signposts
{
  -[GEOCompanionCyclingStep _readSignposts]((uint64_t)self);
  return self->_signposts;
}

- (void)setSignposts:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *signposts;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x400u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x800u;
  signposts = self->_signposts;
  self->_signposts = v4;

}

- (void)clearSignposts
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x400u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x800u;
  -[NSMutableArray removeAllObjects](self->_signposts, "removeAllObjects");
}

- (void)addSignpost:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOCompanionCyclingStep _readSignposts]((uint64_t)self);
  -[GEOCompanionCyclingStep _addNoFlagsSignpost:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x400u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x800u;
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

- (unint64_t)signpostsCount
{
  -[GEOCompanionCyclingStep _readSignposts]((uint64_t)self);
  return -[NSMutableArray count](self->_signposts, "count");
}

- (id)signpostAtIndex:(unint64_t)a3
{
  -[GEOCompanionCyclingStep _readSignposts]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_signposts, "objectAtIndex:", a3);
}

+ (Class)signpostType
{
  return (Class)objc_opt_class();
}

- (BOOL)toFreeway
{
  return self->_toFreeway;
}

- (void)setToFreeway:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x810u;
  self->_toFreeway = a3;
}

- (void)setHasToFreeway:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2064;
  else
    v3 = 2048;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFEF | v3;
}

- (BOOL)hasToFreeway
{
  return (*(_WORD *)&self->_flags >> 4) & 1;
}

- (void)_readExitNumber
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 112) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOCompanionCyclingStepReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readExitNumber_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (BOOL)hasExitNumber
{
  -[GEOCompanionCyclingStep _readExitNumber]((uint64_t)self);
  return self->_exitNumber != 0;
}

- (GEONameInfo)exitNumber
{
  -[GEOCompanionCyclingStep _readExitNumber]((uint64_t)self);
  return self->_exitNumber;
}

- (void)setExitNumber:(id)a3
{
  *(_WORD *)&self->_flags |= 0x880u;
  objc_storeStrong((id *)&self->_exitNumber, a3);
}

- (int)drivingSide
{
  os_unfair_lock_s *p_readerLock;
  __int16 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 1) != 0)
    return self->_drivingSide;
  else
    return 0;
}

- (void)setDrivingSide:(int)a3
{
  *(_WORD *)&self->_flags |= 0x801u;
  self->_drivingSide = a3;
}

- (void)setHasDrivingSide:(BOOL)a3
{
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFE | a3 | 0x800;
}

- (BOOL)hasDrivingSide
{
  return *(_WORD *)&self->_flags & 1;
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

- (void)_readArtworkOverride
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 112) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOCompanionCyclingStepReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readArtworkOverride_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (BOOL)hasArtworkOverride
{
  -[GEOCompanionCyclingStep _readArtworkOverride]((uint64_t)self);
  return self->_artworkOverride != 0;
}

- (GEOPBTransitArtwork)artworkOverride
{
  -[GEOCompanionCyclingStep _readArtworkOverride]((uint64_t)self);
  return self->_artworkOverride;
}

- (void)setArtworkOverride:(id)a3
{
  *(_WORD *)&self->_flags |= 0x840u;
  objc_storeStrong((id *)&self->_artworkOverride, a3);
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
  v8.super_class = (Class)GEOCompanionCyclingStep;
  -[GEOCompanionCyclingStep description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOCompanionCyclingStep dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOCompanionCyclingStep _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  __CFString *v5;
  void *v6;
  __int16 v7;
  void *v8;
  int v9;
  __CFString *v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  __CFString *v36;
  void *v37;
  void *v38;
  void *v39;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_WORD *)(a1 + 112) & 4) != 0)
  {
    v5 = CFSTR("NO_TURN");
    switch(*(_DWORD *)(a1 + 100))
    {
      case 0:
        break;
      case 1:
        v5 = CFSTR("LEFT_TURN");
        break;
      case 2:
        v5 = CFSTR("RIGHT_TURN");
        break;
      case 3:
        v5 = CFSTR("STRAIGHT_AHEAD");
        break;
      case 4:
        v5 = CFSTR("U_TURN");
        break;
      case 5:
        v5 = CFSTR("FOLLOW_ROAD");
        break;
      case 6:
        v5 = CFSTR("ENTER_ROUNDABOUT");
        break;
      case 7:
        v5 = CFSTR("EXIT_ROUNDABOUT");
        break;
      case 0xB:
        v5 = CFSTR("OFF_RAMP");
        break;
      case 0xC:
        v5 = CFSTR("ON_RAMP");
        break;
      case 0x10:
        v5 = CFSTR("ARRIVE_END_OF_NAVIGATION");
        break;
      case 0x11:
        v5 = CFSTR("START_ROUTE");
        break;
      case 0x12:
        v5 = CFSTR("ARRIVE_AT_DESTINATION");
        break;
      case 0x14:
        v5 = CFSTR("KEEP_LEFT");
        break;
      case 0x15:
        v5 = CFSTR("KEEP_RIGHT");
        break;
      case 0x16:
        v5 = CFSTR("ENTER_FERRY");
        break;
      case 0x17:
        v5 = CFSTR("EXIT_FERRY");
        break;
      case 0x18:
        v5 = CFSTR("CHANGE_FERRY");
        break;
      case 0x19:
        v5 = CFSTR("START_ROUTE_WITH_U_TURN");
        break;
      case 0x1A:
        v5 = CFSTR("U_TURN_AT_ROUNDABOUT");
        break;
      case 0x1B:
        v5 = CFSTR("LEFT_TURN_AT_END");
        break;
      case 0x1C:
        v5 = CFSTR("RIGHT_TURN_AT_END");
        break;
      case 0x1D:
        v5 = CFSTR("HIGHWAY_OFF_RAMP_LEFT");
        break;
      case 0x1E:
        v5 = CFSTR("HIGHWAY_OFF_RAMP_RIGHT");
        break;
      case 0x21:
        v5 = CFSTR("ARRIVE_AT_DESTINATION_LEFT");
        break;
      case 0x22:
        v5 = CFSTR("ARRIVE_AT_DESTINATION_RIGHT");
        break;
      case 0x23:
        v5 = CFSTR("U_TURN_WHEN_POSSIBLE");
        break;
      case 0x27:
        v5 = CFSTR("ARRIVE_END_OF_DIRECTIONS");
        break;
      case 0x29:
        v5 = CFSTR("ROUNDABOUT_EXIT_1");
        break;
      case 0x2A:
        v5 = CFSTR("ROUNDABOUT_EXIT_2");
        break;
      case 0x2B:
        v5 = CFSTR("ROUNDABOUT_EXIT_3");
        break;
      case 0x2C:
        v5 = CFSTR("ROUNDABOUT_EXIT_4");
        break;
      case 0x2D:
        v5 = CFSTR("ROUNDABOUT_EXIT_5");
        break;
      case 0x2E:
        v5 = CFSTR("ROUNDABOUT_EXIT_6");
        break;
      case 0x2F:
        v5 = CFSTR("ROUNDABOUT_EXIT_7");
        break;
      case 0x30:
        v5 = CFSTR("ROUNDABOUT_EXIT_8");
        break;
      case 0x31:
        v5 = CFSTR("ROUNDABOUT_EXIT_9");
        break;
      case 0x32:
        v5 = CFSTR("ROUNDABOUT_EXIT_10");
        break;
      case 0x33:
        v5 = CFSTR("ROUNDABOUT_EXIT_11");
        break;
      case 0x34:
        v5 = CFSTR("ROUNDABOUT_EXIT_12");
        break;
      case 0x35:
        v5 = CFSTR("ROUNDABOUT_EXIT_13");
        break;
      case 0x36:
        v5 = CFSTR("ROUNDABOUT_EXIT_14");
        break;
      case 0x37:
        v5 = CFSTR("ROUNDABOUT_EXIT_15");
        break;
      case 0x38:
        v5 = CFSTR("ROUNDABOUT_EXIT_16");
        break;
      case 0x39:
        v5 = CFSTR("ROUNDABOUT_EXIT_17");
        break;
      case 0x3A:
        v5 = CFSTR("ROUNDABOUT_EXIT_18");
        break;
      case 0x3B:
        v5 = CFSTR("ROUNDABOUT_EXIT_19");
        break;
      case 0x3C:
        v5 = CFSTR("SHARP_LEFT_TURN");
        break;
      case 0x3D:
        v5 = CFSTR("SHARP_RIGHT_TURN");
        break;
      case 0x3E:
        v5 = CFSTR("SLIGHT_LEFT_TURN");
        break;
      case 0x3F:
        v5 = CFSTR("SLIGHT_RIGHT_TURN");
        break;
      case 0x40:
        v5 = CFSTR("CHANGE_HIGHWAY");
        break;
      case 0x41:
        v5 = CFSTR("CHANGE_HIGHWAY_LEFT");
        break;
      case 0x42:
        v5 = CFSTR("CHANGE_HIGHWAY_RIGHT");
        break;
      case 0x50:
        v5 = CFSTR("TOLL_STATION");
        break;
      case 0x51:
        v5 = CFSTR("ENTER_TUNNEL");
        break;
      case 0x52:
        v5 = CFSTR("WAYPOINT_STOP");
        break;
      case 0x53:
        v5 = CFSTR("WAYPOINT_STOP_LEFT");
        break;
      case 0x54:
        v5 = CFSTR("WAYPOINT_STOP_RIGHT");
        break;
      case 0x55:
        v5 = CFSTR("RESUME_ROUTE");
        break;
      case 0x56:
        v5 = CFSTR("RESUME_ROUTE_WITH_U_TURN");
        break;
      case 0x57:
        v5 = CFSTR("CUSTOM");
        break;
      case 0x58:
        v5 = CFSTR("TURN_AROUND");
        break;
      default:
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 100));
        v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
        break;
    }
    objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("maneuverType"));

  }
  objc_msgSend((id)a1, "shield");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("shield"));

  v7 = *(_WORD *)(a1 + 112);
  if ((v7 & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 104));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("shieldType"));

    v7 = *(_WORD *)(a1 + 112);
  }
  if ((v7 & 2) != 0)
  {
    v9 = *(_DWORD *)(a1 + 96);
    if (v9)
    {
      if (v9 == 1)
      {
        v10 = CFSTR("JCTTYPE_ROUNDABOUT");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 96));
        v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v10 = CFSTR("JCTTYPE_NORMAL");
    }
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("junctionType"));

  }
  if (*(_QWORD *)(a1 + 24))
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", *(_QWORD *)(a1 + 24));
    if (*(_QWORD *)(a1 + 24))
    {
      v12 = 0;
      v13 = 0;
      do
      {
        _GEOJunctionElementDictionaryRepresentation((unsigned int *)(*(_QWORD *)(a1 + 16) + v12));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addObject:", v14);

        ++v13;
        v12 += 16;
      }
      while (v13 < *(_QWORD *)(a1 + 24));
    }
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("junctionElement"));

  }
  if (objc_msgSend(*(id *)(a1 + 56), "count"))
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 56), "count"));
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v16 = *(id *)(a1 + 56);
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v46;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v46 != v19)
            objc_enumerationMutation(v16);
          v21 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v21, "jsonRepresentation");
          else
            objc_msgSend(v21, "dictionaryRepresentation");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "addObject:", v22);

        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
      }
      while (v18);
    }

    objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("maneuverName"));
  }
  if (objc_msgSend(*(id *)(a1 + 72), "count"))
  {
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 72), "count"));
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v24 = *(id *)(a1 + 72);
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v42;
      do
      {
        for (j = 0; j != v26; ++j)
        {
          if (*(_QWORD *)v42 != v27)
            objc_enumerationMutation(v24);
          v29 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * j);
          if ((a2 & 1) != 0)
            objc_msgSend(v29, "jsonRepresentation");
          else
            objc_msgSend(v29, "dictionaryRepresentation");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "addObject:", v30);

        }
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
      }
      while (v26);
    }

    objc_msgSend(v4, "setObject:forKey:", v23, CFSTR("signpost"));
  }
  if ((*(_WORD *)(a1 + 112) & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 108));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v31, CFSTR("toFreeway"));

  }
  objc_msgSend((id)a1, "exitNumber");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v32;
  if (v32)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v32, "jsonRepresentation");
    else
      objc_msgSend(v32, "dictionaryRepresentation");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v34, CFSTR("exitNumber"));

  }
  if ((*(_WORD *)(a1 + 112) & 1) != 0)
  {
    v35 = *(_DWORD *)(a1 + 92);
    if (v35)
    {
      if (v35 == 1)
      {
        v36 = CFSTR("LEFT_SIDE");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 92));
        v36 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v36 = CFSTR("RIGHT_SIDE");
    }
    objc_msgSend(v4, "setObject:forKey:", v36, CFSTR("drivingSide"));

  }
  objc_msgSend((id)a1, "artworkOverride");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v37;
  if (v37)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v37, "jsonRepresentation");
    else
      objc_msgSend(v37, "dictionaryRepresentation");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v39, CFSTR("artworkOverride"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOCompanionCyclingStep _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOCompanionCyclingStep)initWithDictionary:(id)a3
{
  return (GEOCompanionCyclingStep *)-[GEOCompanionCyclingStep _initWithDictionary:isJSON:](self, a3, 0);
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
  id v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  uint64_t v28;
  GEONameInfoList *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t k;
  uint64_t v38;
  GEONameInfo *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  GEONameInfo *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  id v48;
  uint64_t v49;
  void *v50;
  GEOPBTransitArtwork *v51;
  uint64_t v52;
  void *v53;
  id v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  uint64_t v64;
  uint64_t v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  _BYTE v70[128];
  _BYTE v71[128];
  _BYTE v72[128];
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (!a1)
    goto LABEL_207;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_207;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("maneuverType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v6;
    if ((objc_msgSend(v7, "isEqualToString:", CFSTR("NO_TURN")) & 1) != 0)
    {
      v8 = 0;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("LEFT_TURN")) & 1) != 0)
    {
      v8 = 1;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("RIGHT_TURN")) & 1) != 0)
    {
      v8 = 2;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("STRAIGHT_AHEAD")) & 1) != 0)
    {
      v8 = 3;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("U_TURN")) & 1) != 0)
    {
      v8 = 4;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FOLLOW_ROAD")) & 1) != 0)
    {
      v8 = 5;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("ENTER_ROUNDABOUT")) & 1) != 0)
    {
      v8 = 6;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("EXIT_ROUNDABOUT")) & 1) != 0)
    {
      v8 = 7;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("OFF_RAMP")) & 1) != 0)
    {
      v8 = 11;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("ON_RAMP")) & 1) != 0)
    {
      v8 = 12;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("ARRIVE_END_OF_NAVIGATION")) & 1) != 0)
    {
      v8 = 16;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("START_ROUTE")) & 1) != 0)
    {
      v8 = 17;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("ARRIVE_AT_DESTINATION")) & 1) != 0)
    {
      v8 = 18;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("KEEP_LEFT")) & 1) != 0)
    {
      v8 = 20;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("KEEP_RIGHT")) & 1) != 0)
    {
      v8 = 21;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("ENTER_FERRY")) & 1) != 0)
    {
      v8 = 22;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("EXIT_FERRY")) & 1) != 0)
    {
      v8 = 23;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("CHANGE_FERRY")) & 1) != 0)
    {
      v8 = 24;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("START_ROUTE_WITH_U_TURN")) & 1) != 0)
    {
      v8 = 25;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("U_TURN_AT_ROUNDABOUT")) & 1) != 0)
    {
      v8 = 26;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("LEFT_TURN_AT_END")) & 1) != 0)
    {
      v8 = 27;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("RIGHT_TURN_AT_END")) & 1) != 0)
    {
      v8 = 28;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("HIGHWAY_OFF_RAMP_LEFT")) & 1) != 0)
    {
      v8 = 29;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("HIGHWAY_OFF_RAMP_RIGHT")) & 1) != 0)
    {
      v8 = 30;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("ARRIVE_AT_DESTINATION_LEFT")) & 1) != 0)
    {
      v8 = 33;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("ARRIVE_AT_DESTINATION_RIGHT")) & 1) != 0)
    {
      v8 = 34;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("U_TURN_WHEN_POSSIBLE")) & 1) != 0)
    {
      v8 = 35;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("ARRIVE_END_OF_DIRECTIONS")) & 1) != 0)
    {
      v8 = 39;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_1")) & 1) != 0)
    {
      v8 = 41;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_2")) & 1) != 0)
    {
      v8 = 42;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_3")) & 1) != 0)
    {
      v8 = 43;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_4")) & 1) != 0)
    {
      v8 = 44;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_5")) & 1) != 0)
    {
      v8 = 45;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_6")) & 1) != 0)
    {
      v8 = 46;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_7")) & 1) != 0)
    {
      v8 = 47;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_8")) & 1) != 0)
    {
      v8 = 48;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_9")) & 1) != 0)
    {
      v8 = 49;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_10")) & 1) != 0)
    {
      v8 = 50;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_11")) & 1) != 0)
    {
      v8 = 51;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_12")) & 1) != 0)
    {
      v8 = 52;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_13")) & 1) != 0)
    {
      v8 = 53;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_14")) & 1) != 0)
    {
      v8 = 54;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_15")) & 1) != 0)
    {
      v8 = 55;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_16")) & 1) != 0)
    {
      v8 = 56;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_17")) & 1) != 0)
    {
      v8 = 57;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_18")) & 1) != 0)
    {
      v8 = 58;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_19")) & 1) != 0)
    {
      v8 = 59;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("SHARP_LEFT_TURN")) & 1) != 0)
    {
      v8 = 60;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("SHARP_RIGHT_TURN")) & 1) != 0)
    {
      v8 = 61;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("SLIGHT_LEFT_TURN")) & 1) != 0)
    {
      v8 = 62;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("SLIGHT_RIGHT_TURN")) & 1) != 0)
    {
      v8 = 63;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("CHANGE_HIGHWAY")) & 1) != 0)
    {
      v8 = 64;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("CHANGE_HIGHWAY_LEFT")) & 1) != 0)
    {
      v8 = 65;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("CHANGE_HIGHWAY_RIGHT")) & 1) != 0)
    {
      v8 = 66;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("TOLL_STATION")) & 1) != 0)
    {
      v8 = 80;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("ENTER_TUNNEL")) & 1) != 0)
    {
      v8 = 81;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("WAYPOINT_STOP")) & 1) != 0)
    {
      v8 = 82;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("WAYPOINT_STOP_LEFT")) & 1) != 0)
    {
      v8 = 83;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("WAYPOINT_STOP_RIGHT")) & 1) != 0)
    {
      v8 = 84;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("RESUME_ROUTE")) & 1) != 0)
    {
      v8 = 85;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("RESUME_ROUTE_WITH_U_TURN")) & 1) != 0)
    {
      v8 = 86;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("CUSTOM")) & 1) != 0)
    {
      v8 = 87;
    }
    else if (objc_msgSend(v7, "isEqualToString:", CFSTR("TURN_AROUND")))
    {
      v8 = 88;
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
      goto LABEL_135;
    v8 = objc_msgSend(v6, "intValue");
  }
  objc_msgSend(a1, "setManeuverType:", v8);
LABEL_135:

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("shield"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = (void *)objc_msgSend(v9, "copy");
    objc_msgSend(a1, "setShield:", v10);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("shieldType"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setShieldType:", objc_msgSend(v11, "intValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("junctionType"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v13 = v12;
    if ((objc_msgSend(v13, "isEqualToString:", CFSTR("JCTTYPE_NORMAL")) & 1) != 0)
      v14 = 0;
    else
      v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("JCTTYPE_ROUNDABOUT"));

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_147;
    v14 = objc_msgSend(v12, "intValue");
  }
  objc_msgSend(a1, "setJunctionType:", v14);
LABEL_147:

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("junctionElement"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v68 = 0u;
    v69 = 0u;
    v66 = 0u;
    v67 = 0u;
    v16 = v15;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v66, v72, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v67;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v67 != v19)
            objc_enumerationMutation(v16);
          v21 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v64 = 0;
            v65 = 0;
            _GEOJunctionElementFromDictionaryRepresentation(v21, (uint64_t)&v64);
            objc_msgSend(a1, "addJunctionElement:", v64, v65);
          }
        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v66, v72, 16);
      }
      while (v18);
    }

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("maneuverName"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v55 = v5;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v62 = 0u;
    v63 = 0u;
    v60 = 0u;
    v61 = 0u;
    v23 = v22;
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v60, v71, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v61;
      do
      {
        for (j = 0; j != v25; ++j)
        {
          if (*(_QWORD *)v61 != v26)
            objc_enumerationMutation(v23);
          v28 = *(_QWORD *)(*((_QWORD *)&v60 + 1) + 8 * j);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v29 = [GEONameInfoList alloc];
            if ((a3 & 1) != 0)
              v30 = -[GEONameInfoList initWithJSON:](v29, "initWithJSON:", v28);
            else
              v30 = -[GEONameInfoList initWithDictionary:](v29, "initWithDictionary:", v28);
            v31 = (void *)v30;
            objc_msgSend(a1, "addManeuverName:", v30);

          }
        }
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v60, v71, 16);
      }
      while (v25);
    }

    v5 = v55;
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("signpost"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    v33 = v32;
    v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v56, v70, 16);
    if (v34)
    {
      v35 = v34;
      v36 = *(_QWORD *)v57;
      do
      {
        for (k = 0; k != v35; ++k)
        {
          if (*(_QWORD *)v57 != v36)
            objc_enumerationMutation(v33);
          v38 = *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * k);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v39 = [GEONameInfo alloc];
            if ((a3 & 1) != 0)
              v40 = -[GEONameInfo initWithJSON:](v39, "initWithJSON:", v38);
            else
              v40 = -[GEONameInfo initWithDictionary:](v39, "initWithDictionary:", v38);
            v41 = (void *)v40;
            objc_msgSend(a1, "addSignpost:", v40);

          }
        }
        v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v56, v70, 16);
      }
      while (v35);
    }

    v5 = v55;
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("toFreeway"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setToFreeway:", objc_msgSend(v42, "BOOLValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("exitNumber"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v44 = [GEONameInfo alloc];
    if ((a3 & 1) != 0)
      v45 = -[GEONameInfo initWithJSON:](v44, "initWithJSON:", v43);
    else
      v45 = -[GEONameInfo initWithDictionary:](v44, "initWithDictionary:", v43);
    v46 = (void *)v45;
    objc_msgSend(a1, "setExitNumber:", v45);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("drivingSide"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v48 = v47;
    if ((objc_msgSend(v48, "isEqualToString:", CFSTR("RIGHT_SIDE")) & 1) != 0)
      v49 = 0;
    else
      v49 = objc_msgSend(v48, "isEqualToString:", CFSTR("LEFT_SIDE"));

    goto LABEL_200;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v49 = objc_msgSend(v47, "intValue");
LABEL_200:
    objc_msgSend(a1, "setDrivingSide:", v49);
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("artworkOverride"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v51 = [GEOPBTransitArtwork alloc];
    if ((a3 & 1) != 0)
      v52 = -[GEOPBTransitArtwork initWithJSON:](v51, "initWithJSON:", v50);
    else
      v52 = -[GEOPBTransitArtwork initWithDictionary:](v51, "initWithDictionary:", v50);
    v53 = (void *)v52;
    objc_msgSend(a1, "setArtworkOverride:", v52);

  }
LABEL_207:

  return a1;
}

- (GEOCompanionCyclingStep)initWithJSON:(id)a3
{
  return (GEOCompanionCyclingStep *)-[GEOCompanionCyclingStep _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_18;
    else
      v8 = (int *)&readAll__nonRecursiveTag_18;
    GEOCompanionCyclingStepReadSpecified((uint64_t)self, (uint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEOCompanionCyclingStepCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOCompanionCyclingStepIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOCompanionCyclingStepReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  __int16 flags;
  uint64_t v7;
  unint64_t v8;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  NSMutableArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  PBDataReader *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOCompanionCyclingStepIsDirty((uint64_t)self) & 1) == 0)
  {
    v17 = self->_reader;
    objc_sync_enter(v17);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v18);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v17);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOCompanionCyclingStep readAll:](self, "readAll:", 0);
    if ((*(_WORD *)&self->_flags & 4) != 0)
      PBDataWriterWriteInt32Field();
    if (self->_shield)
      PBDataWriterWriteStringField();
    flags = (__int16)self->_flags;
    if ((flags & 8) != 0)
    {
      PBDataWriterWriteSint32Field();
      flags = (__int16)self->_flags;
    }
    if ((flags & 2) != 0)
      PBDataWriterWriteInt32Field();
    if (self->_junctionElementsCount)
    {
      v7 = 0;
      v8 = 0;
      do
      {
        v27 = 0;
        PBDataWriterPlaceMark();
        GEOJunctionElementWriteTo((uint64_t)&self->_junctionElements[v7]);
        PBDataWriterRecallMark();
        ++v8;
        ++v7;
      }
      while (v8 < self->_junctionElementsCount);
    }
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v9 = self->_maneuverNames;
    v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v24 != v11)
            objc_enumerationMutation(v9);
          PBDataWriterWriteSubmessage();
        }
        v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
      }
      while (v10);
    }

    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v13 = self->_signposts;
    v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v19, v28, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v20;
      do
      {
        for (j = 0; j != v14; ++j)
        {
          if (*(_QWORD *)v20 != v15)
            objc_enumerationMutation(v13);
          PBDataWriterWriteSubmessage();
        }
        v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v19, v28, 16);
      }
      while (v14);
    }

    if ((*(_WORD *)&self->_flags & 0x10) != 0)
      PBDataWriterWriteBOOLField();
    if (self->_exitNumber)
      PBDataWriterWriteSubmessage();
    if ((*(_WORD *)&self->_flags & 1) != 0)
      PBDataWriterWriteInt32Field();
    if (self->_artworkOverride)
      PBDataWriterWriteSubmessage();
  }

}

- (void)copyTo:(id)a3
{
  id *v4;
  __int16 flags;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  uint64_t v9;
  uint64_t v10;
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
  -[GEOCompanionCyclingStep readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v20 + 1, self->_reader);
  *((_DWORD *)v20 + 20) = self->_readerMarkPos;
  *((_DWORD *)v20 + 21) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  v4 = v20;
  if ((*(_WORD *)&self->_flags & 4) != 0)
  {
    *((_DWORD *)v20 + 25) = self->_maneuverType;
    *((_WORD *)v20 + 56) |= 4u;
  }
  if (self->_shield)
  {
    objc_msgSend(v20, "setShield:");
    v4 = v20;
  }
  flags = (__int16)self->_flags;
  if ((flags & 8) != 0)
  {
    *((_DWORD *)v4 + 26) = self->_shieldType;
    *((_WORD *)v4 + 56) |= 8u;
    flags = (__int16)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *((_DWORD *)v4 + 24) = self->_junctionType;
    *((_WORD *)v4 + 56) |= 2u;
  }
  if (-[GEOCompanionCyclingStep junctionElementsCount](self, "junctionElementsCount"))
  {
    objc_msgSend(v20, "clearJunctionElements");
    v6 = -[GEOCompanionCyclingStep junctionElementsCount](self, "junctionElementsCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
      {
        v9 = -[GEOCompanionCyclingStep junctionElementAtIndex:](self, "junctionElementAtIndex:", i);
        objc_msgSend(v20, "addJunctionElement:", v9, v10);
      }
    }
  }
  if (-[GEOCompanionCyclingStep maneuverNamesCount](self, "maneuverNamesCount"))
  {
    objc_msgSend(v20, "clearManeuverNames");
    v11 = -[GEOCompanionCyclingStep maneuverNamesCount](self, "maneuverNamesCount");
    if (v11)
    {
      v12 = v11;
      for (j = 0; j != v12; ++j)
      {
        -[GEOCompanionCyclingStep maneuverNameAtIndex:](self, "maneuverNameAtIndex:", j);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "addManeuverName:", v14);

      }
    }
  }
  if (-[GEOCompanionCyclingStep signpostsCount](self, "signpostsCount"))
  {
    objc_msgSend(v20, "clearSignposts");
    v15 = -[GEOCompanionCyclingStep signpostsCount](self, "signpostsCount");
    if (v15)
    {
      v16 = v15;
      for (k = 0; k != v16; ++k)
      {
        -[GEOCompanionCyclingStep signpostAtIndex:](self, "signpostAtIndex:", k);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "addSignpost:", v18);

      }
    }
  }
  v19 = v20;
  if ((*(_WORD *)&self->_flags & 0x10) != 0)
  {
    *((_BYTE *)v20 + 108) = self->_toFreeway;
    *((_WORD *)v20 + 56) |= 0x10u;
  }
  if (self->_exitNumber)
  {
    objc_msgSend(v20, "setExitNumber:");
    v19 = v20;
  }
  if ((*(_WORD *)&self->_flags & 1) != 0)
  {
    *((_DWORD *)v19 + 23) = self->_drivingSide;
    *((_WORD *)v19 + 56) |= 1u;
  }
  if (self->_artworkOverride)
  {
    objc_msgSend(v20, "setArtworkOverride:");
    v19 = v20;
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
  __int16 flags;
  unint64_t junctionElementsCount;
  NSMutableArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  NSMutableArray *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  id v23;
  void *v24;
  id v25;
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
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
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
      GEOCompanionCyclingStepReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_32;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOCompanionCyclingStep readAll:](self, "readAll:", 0);
  if ((*(_WORD *)&self->_flags & 4) != 0)
  {
    *(_DWORD *)(v5 + 100) = self->_maneuverType;
    *(_WORD *)(v5 + 112) |= 4u;
  }
  v9 = -[NSString copyWithZone:](self->_shield, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v9;

  flags = (__int16)self->_flags;
  if ((flags & 8) != 0)
  {
    *(_DWORD *)(v5 + 104) = self->_shieldType;
    *(_WORD *)(v5 + 112) |= 8u;
    flags = (__int16)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 96) = self->_junctionType;
    *(_WORD *)(v5 + 112) |= 2u;
  }
  junctionElementsCount = self->_junctionElementsCount;
  if (junctionElementsCount)
  {
    -[GEOCompanionCyclingStep _reserveJunctionElements:](v5, junctionElementsCount);
    memcpy(*(void **)(v5 + 16), self->_junctionElements, 16 * self->_junctionElementsCount);
    *(_QWORD *)(v5 + 24) = self->_junctionElementsCount;
  }
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v13 = self->_maneuverNames;
  v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v32 != v15)
          objc_enumerationMutation(v13);
        v17 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addManeuverName:", v17);

      }
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    }
    while (v14);
  }

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v18 = self->_signposts;
  v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
  if (v19)
  {
    v20 = *(_QWORD *)v28;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v28 != v20)
          objc_enumerationMutation(v18);
        v22 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * j), "copyWithZone:", a3, (_QWORD)v27);
        objc_msgSend((id)v5, "addSignpost:", v22);

      }
      v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    }
    while (v19);
  }

  if ((*(_WORD *)&self->_flags & 0x10) != 0)
  {
    *(_BYTE *)(v5 + 108) = self->_toFreeway;
    *(_WORD *)(v5 + 112) |= 0x10u;
  }
  v23 = -[GEONameInfo copyWithZone:](self->_exitNumber, "copyWithZone:", a3, (_QWORD)v27);
  v24 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v23;

  if ((*(_WORD *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 92) = self->_drivingSide;
    *(_WORD *)(v5 + 112) |= 1u;
  }
  v25 = -[GEOPBTransitArtwork copyWithZone:](self->_artworkOverride, "copyWithZone:", a3);
  v8 = *(id *)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v25;
LABEL_32:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  const void **v4;
  __int16 flags;
  __int16 v6;
  NSString *shield;
  unint64_t junctionElementsCount;
  char v9;
  NSMutableArray *maneuverNames;
  NSMutableArray *signposts;
  __int16 v13;
  __int16 v14;
  GEONameInfo *exitNumber;
  GEOPBTransitArtwork *artworkOverride;

  v4 = (const void **)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_22;
  -[GEOCompanionCyclingStep readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  flags = (__int16)self->_flags;
  v6 = *((_WORD *)v4 + 56);
  if ((flags & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_maneuverType != *((_DWORD *)v4 + 25))
      goto LABEL_22;
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_22;
  }
  shield = self->_shield;
  if ((unint64_t)shield | (unint64_t)v4[8])
  {
    if (!-[NSString isEqual:](shield, "isEqual:"))
      goto LABEL_22;
    flags = (__int16)self->_flags;
    v6 = *((_WORD *)v4 + 56);
  }
  if ((flags & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_shieldType != *((_DWORD *)v4 + 26))
      goto LABEL_22;
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_22;
  }
  if ((flags & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_junctionType != *((_DWORD *)v4 + 24))
      goto LABEL_22;
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_22;
  }
  junctionElementsCount = self->_junctionElementsCount;
  if ((const void *)junctionElementsCount != v4[3])
    goto LABEL_22;
  if (memcmp(self->_junctionElements, v4[2], 16 * junctionElementsCount))
    goto LABEL_22;
  maneuverNames = self->_maneuverNames;
  if ((unint64_t)maneuverNames | (unint64_t)v4[7])
  {
    if (!-[NSMutableArray isEqual:](maneuverNames, "isEqual:"))
      goto LABEL_22;
  }
  signposts = self->_signposts;
  if ((unint64_t)signposts | (unint64_t)v4[9])
  {
    if (!-[NSMutableArray isEqual:](signposts, "isEqual:"))
      goto LABEL_22;
  }
  v13 = (__int16)self->_flags;
  v14 = *((_WORD *)v4 + 56);
  if ((v13 & 0x10) != 0)
  {
    if ((v14 & 0x10) == 0)
      goto LABEL_22;
    if (self->_toFreeway)
    {
      if (!*((_BYTE *)v4 + 108))
        goto LABEL_22;
    }
    else if (*((_BYTE *)v4 + 108))
    {
      goto LABEL_22;
    }
  }
  else if ((v14 & 0x10) != 0)
  {
    goto LABEL_22;
  }
  exitNumber = self->_exitNumber;
  if ((unint64_t)exitNumber | (unint64_t)v4[6])
  {
    if (!-[GEONameInfo isEqual:](exitNumber, "isEqual:"))
      goto LABEL_22;
    v13 = (__int16)self->_flags;
    v14 = *((_WORD *)v4 + 56);
  }
  if ((v13 & 1) == 0)
  {
    if ((v14 & 1) == 0)
      goto LABEL_44;
LABEL_22:
    v9 = 0;
    goto LABEL_23;
  }
  if ((v14 & 1) == 0 || self->_drivingSide != *((_DWORD *)v4 + 23))
    goto LABEL_22;
LABEL_44:
  artworkOverride = self->_artworkOverride;
  if ((unint64_t)artworkOverride | (unint64_t)v4[5])
    v9 = -[GEOPBTransitArtwork isEqual:](artworkOverride, "isEqual:");
  else
    v9 = 1;
LABEL_23:

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3;
  __int16 flags;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v14;

  -[GEOCompanionCyclingStep readAll:](self, "readAll:", 1);
  if ((*(_WORD *)&self->_flags & 4) != 0)
    v14 = 2654435761 * self->_maneuverType;
  else
    v14 = 0;
  v3 = -[NSString hash](self->_shield, "hash");
  flags = (__int16)self->_flags;
  if ((flags & 8) != 0)
  {
    v5 = 2654435761 * self->_shieldType;
    if ((flags & 2) != 0)
      goto LABEL_6;
  }
  else
  {
    v5 = 0;
    if ((flags & 2) != 0)
    {
LABEL_6:
      v6 = 2654435761 * self->_junctionType;
      goto LABEL_9;
    }
  }
  v6 = 0;
LABEL_9:
  v7 = PBHashBytes();
  v8 = -[NSMutableArray hash](self->_maneuverNames, "hash");
  v9 = -[NSMutableArray hash](self->_signposts, "hash");
  if ((*(_WORD *)&self->_flags & 0x10) != 0)
    v10 = 2654435761 * self->_toFreeway;
  else
    v10 = 0;
  v11 = -[GEONameInfo hash](self->_exitNumber, "hash");
  if ((*(_WORD *)&self->_flags & 1) != 0)
    v12 = 2654435761 * self->_drivingSide;
  else
    v12 = 0;
  return v3 ^ v14 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ -[GEOPBTransitArtwork hash](self->_artworkOverride, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
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
  GEONameInfo *exitNumber;
  uint64_t v22;
  GEOPBTransitArtwork *artworkOverride;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  if ((*((_WORD *)v4 + 56) & 4) != 0)
  {
    self->_maneuverType = *((_DWORD *)v4 + 25);
    *(_WORD *)&self->_flags |= 4u;
  }
  if (*((_QWORD *)v4 + 8))
    -[GEOCompanionCyclingStep setShield:](self, "setShield:");
  v5 = *((_WORD *)v4 + 56);
  if ((v5 & 8) != 0)
  {
    self->_shieldType = *((_DWORD *)v4 + 26);
    *(_WORD *)&self->_flags |= 8u;
    v5 = *((_WORD *)v4 + 56);
  }
  if ((v5 & 2) != 0)
  {
    self->_junctionType = *((_DWORD *)v4 + 24);
    *(_WORD *)&self->_flags |= 2u;
  }
  v6 = objc_msgSend(v4, "junctionElementsCount");
  if (v6)
  {
    v7 = v6;
    for (i = 0; i != v7; ++i)
    {
      v9 = objc_msgSend(v4, "junctionElementAtIndex:", i);
      -[GEOCompanionCyclingStep addJunctionElement:](self, "addJunctionElement:", v9, v10);
    }
  }
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v11 = *((id *)v4 + 7);
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v30;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v30 != v14)
          objc_enumerationMutation(v11);
        -[GEOCompanionCyclingStep addManeuverName:](self, "addManeuverName:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * j));
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v13);
  }

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v16 = *((id *)v4 + 9);
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v26;
    do
    {
      for (k = 0; k != v18; ++k)
      {
        if (*(_QWORD *)v26 != v19)
          objc_enumerationMutation(v16);
        -[GEOCompanionCyclingStep addSignpost:](self, "addSignpost:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * k), (_QWORD)v25);
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    }
    while (v18);
  }

  if ((*((_WORD *)v4 + 56) & 0x10) != 0)
  {
    self->_toFreeway = *((_BYTE *)v4 + 108);
    *(_WORD *)&self->_flags |= 0x10u;
  }
  exitNumber = self->_exitNumber;
  v22 = *((_QWORD *)v4 + 6);
  if (exitNumber)
  {
    if (v22)
      -[GEONameInfo mergeFrom:](exitNumber, "mergeFrom:");
  }
  else if (v22)
  {
    -[GEOCompanionCyclingStep setExitNumber:](self, "setExitNumber:");
  }
  if ((*((_WORD *)v4 + 56) & 1) != 0)
  {
    self->_drivingSide = *((_DWORD *)v4 + 23);
    *(_WORD *)&self->_flags |= 1u;
  }
  artworkOverride = self->_artworkOverride;
  v24 = *((_QWORD *)v4 + 5);
  if (artworkOverride)
  {
    if (v24)
      -[GEOPBTransitArtwork mergeFrom:](artworkOverride, "mergeFrom:");
  }
  else if (v24)
  {
    -[GEOCompanionCyclingStep setArtworkOverride:](self, "setArtworkOverride:");
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signposts, 0);
  objc_storeStrong((id *)&self->_shield, 0);
  objc_storeStrong((id *)&self->_maneuverNames, 0);
  objc_storeStrong((id *)&self->_exitNumber, 0);
  objc_storeStrong((id *)&self->_artworkOverride, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

- (int)transportType
{
  return 3;
}

@end
