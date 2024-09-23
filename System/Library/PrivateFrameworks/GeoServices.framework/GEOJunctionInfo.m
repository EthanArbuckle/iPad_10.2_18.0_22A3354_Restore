@implementation GEOJunctionInfo

- (void)dealloc
{
  objc_super v3;

  -[GEOJunctionInfo clearJunctionElements](self, "clearJunctionElements");
  v3.receiver = self;
  v3.super_class = (Class)GEOJunctionInfo;
  -[GEOJunctionInfo dealloc](&v3, sel_dealloc);
}

- (unint64_t)junctionElementsCount
{
  return self->_junctionElementsCount;
}

- (GEOJunctionElement)junctionElements
{
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
    result = (uint64_t)malloc_type_realloc(*(void **)(a1 + 16), 16 * v9, 0x7BD3AE9AuLL);
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
  if (-[GEOJunctionInfo _reserveJunctionElements:]((uint64_t)self, 1uLL))
  {
    v6 = &self->_junctionElements[self->_junctionElementsCount];
    *(_QWORD *)&v6->var0 = v4;
    *(_QWORD *)&v6->var2 = v3;
    ++self->_junctionElementsCount;
  }
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
  -[GEOJunctionInfo clearJunctionElements](self, "clearJunctionElements");
  if (-[GEOJunctionInfo _reserveJunctionElements:]((uint64_t)self, a4))
  {
    memcpy(self->_junctionElements, a3, 16 * a4);
    self->_junctionElementsCount = a4;
  }
}

- (int)junctionType
{
  if ((*(_BYTE *)&self->_flags & 2) != 0)
    return self->_junctionType;
  else
    return 0;
}

- (void)setJunctionType:(int)a3
{
  *(_BYTE *)&self->_flags |= 2u;
  self->_junctionType = a3;
}

- (void)setHasJunctionType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasJunctionType
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
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

- (int)maneuverType
{
  if ((*(_BYTE *)&self->_flags & 4) != 0)
    return self->_maneuverType;
  else
    return 0;
}

- (void)setManeuverType:(int)a3
{
  *(_BYTE *)&self->_flags |= 4u;
  self->_maneuverType = a3;
}

- (void)setHasManeuverType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasManeuverType
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
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

- (int)drivingSide
{
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    return self->_drivingSide;
  else
    return 0;
}

- (void)setDrivingSide:(int)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_drivingSide = a3;
}

- (void)setHasDrivingSide:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasDrivingSide
{
  return *(_BYTE *)&self->_flags & 1;
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

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)GEOJunctionInfo;
  -[GEOJunctionInfo description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOJunctionInfo dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOJunctionInfo _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  const __CFString *v9;
  char v10;
  int v11;
  __CFString *v12;
  const __CFString *v13;
  __CFString *v14;
  const __CFString *v15;
  int v16;
  __CFString *v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  _QWORD v26[4];
  id v27;

  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_QWORD *)(a1 + 24))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", *(_QWORD *)(a1 + 24));
    if (*(_QWORD *)(a1 + 24))
    {
      v6 = 0;
      v7 = 0;
      do
      {
        _GEOJunctionElementDictionaryRepresentation((unsigned int *)(*(_QWORD *)(a1 + 16) + v6));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v8);

        ++v7;
        v6 += 16;
      }
      while (v7 < *(_QWORD *)(a1 + 24));
    }
    if (a2)
      v9 = CFSTR("junctionElement");
    else
      v9 = CFSTR("junction_element");
    objc_msgSend(v4, "setObject:forKey:", v5, v9);

  }
  v10 = *(_BYTE *)(a1 + 52);
  if ((v10 & 2) == 0)
  {
    if ((*(_BYTE *)(a1 + 52) & 4) == 0)
      goto LABEL_12;
LABEL_23:
    v14 = CFSTR("NO_TURN");
    switch(*(_DWORD *)(a1 + 48))
    {
      case 0:
        break;
      case 1:
        v14 = CFSTR("LEFT_TURN");
        break;
      case 2:
        v14 = CFSTR("RIGHT_TURN");
        break;
      case 3:
        v14 = CFSTR("STRAIGHT_AHEAD");
        break;
      case 4:
        v14 = CFSTR("U_TURN");
        break;
      case 5:
        v14 = CFSTR("FOLLOW_ROAD");
        break;
      case 6:
        v14 = CFSTR("ENTER_ROUNDABOUT");
        break;
      case 7:
        v14 = CFSTR("EXIT_ROUNDABOUT");
        break;
      case 0xB:
        v14 = CFSTR("OFF_RAMP");
        break;
      case 0xC:
        v14 = CFSTR("ON_RAMP");
        break;
      case 0x10:
        v14 = CFSTR("ARRIVE_END_OF_NAVIGATION");
        break;
      case 0x11:
        v14 = CFSTR("START_ROUTE");
        break;
      case 0x12:
        v14 = CFSTR("ARRIVE_AT_DESTINATION");
        break;
      case 0x14:
        v14 = CFSTR("KEEP_LEFT");
        break;
      case 0x15:
        v14 = CFSTR("KEEP_RIGHT");
        break;
      case 0x16:
        v14 = CFSTR("ENTER_FERRY");
        break;
      case 0x17:
        v14 = CFSTR("EXIT_FERRY");
        break;
      case 0x18:
        v14 = CFSTR("CHANGE_FERRY");
        break;
      case 0x19:
        v14 = CFSTR("START_ROUTE_WITH_U_TURN");
        break;
      case 0x1A:
        v14 = CFSTR("U_TURN_AT_ROUNDABOUT");
        break;
      case 0x1B:
        v14 = CFSTR("LEFT_TURN_AT_END");
        break;
      case 0x1C:
        v14 = CFSTR("RIGHT_TURN_AT_END");
        break;
      case 0x1D:
        v14 = CFSTR("HIGHWAY_OFF_RAMP_LEFT");
        break;
      case 0x1E:
        v14 = CFSTR("HIGHWAY_OFF_RAMP_RIGHT");
        break;
      case 0x21:
        v14 = CFSTR("ARRIVE_AT_DESTINATION_LEFT");
        break;
      case 0x22:
        v14 = CFSTR("ARRIVE_AT_DESTINATION_RIGHT");
        break;
      case 0x23:
        v14 = CFSTR("U_TURN_WHEN_POSSIBLE");
        break;
      case 0x27:
        v14 = CFSTR("ARRIVE_END_OF_DIRECTIONS");
        break;
      case 0x29:
        v14 = CFSTR("ROUNDABOUT_EXIT_1");
        break;
      case 0x2A:
        v14 = CFSTR("ROUNDABOUT_EXIT_2");
        break;
      case 0x2B:
        v14 = CFSTR("ROUNDABOUT_EXIT_3");
        break;
      case 0x2C:
        v14 = CFSTR("ROUNDABOUT_EXIT_4");
        break;
      case 0x2D:
        v14 = CFSTR("ROUNDABOUT_EXIT_5");
        break;
      case 0x2E:
        v14 = CFSTR("ROUNDABOUT_EXIT_6");
        break;
      case 0x2F:
        v14 = CFSTR("ROUNDABOUT_EXIT_7");
        break;
      case 0x30:
        v14 = CFSTR("ROUNDABOUT_EXIT_8");
        break;
      case 0x31:
        v14 = CFSTR("ROUNDABOUT_EXIT_9");
        break;
      case 0x32:
        v14 = CFSTR("ROUNDABOUT_EXIT_10");
        break;
      case 0x33:
        v14 = CFSTR("ROUNDABOUT_EXIT_11");
        break;
      case 0x34:
        v14 = CFSTR("ROUNDABOUT_EXIT_12");
        break;
      case 0x35:
        v14 = CFSTR("ROUNDABOUT_EXIT_13");
        break;
      case 0x36:
        v14 = CFSTR("ROUNDABOUT_EXIT_14");
        break;
      case 0x37:
        v14 = CFSTR("ROUNDABOUT_EXIT_15");
        break;
      case 0x38:
        v14 = CFSTR("ROUNDABOUT_EXIT_16");
        break;
      case 0x39:
        v14 = CFSTR("ROUNDABOUT_EXIT_17");
        break;
      case 0x3A:
        v14 = CFSTR("ROUNDABOUT_EXIT_18");
        break;
      case 0x3B:
        v14 = CFSTR("ROUNDABOUT_EXIT_19");
        break;
      case 0x3C:
        v14 = CFSTR("SHARP_LEFT_TURN");
        break;
      case 0x3D:
        v14 = CFSTR("SHARP_RIGHT_TURN");
        break;
      case 0x3E:
        v14 = CFSTR("SLIGHT_LEFT_TURN");
        break;
      case 0x3F:
        v14 = CFSTR("SLIGHT_RIGHT_TURN");
        break;
      case 0x40:
        v14 = CFSTR("CHANGE_HIGHWAY");
        break;
      case 0x41:
        v14 = CFSTR("CHANGE_HIGHWAY_LEFT");
        break;
      case 0x42:
        v14 = CFSTR("CHANGE_HIGHWAY_RIGHT");
        break;
      case 0x50:
        v14 = CFSTR("TOLL_STATION");
        break;
      case 0x51:
        v14 = CFSTR("ENTER_TUNNEL");
        break;
      case 0x52:
        v14 = CFSTR("WAYPOINT_STOP");
        break;
      case 0x53:
        v14 = CFSTR("WAYPOINT_STOP_LEFT");
        break;
      case 0x54:
        v14 = CFSTR("WAYPOINT_STOP_RIGHT");
        break;
      case 0x55:
        v14 = CFSTR("RESUME_ROUTE");
        break;
      case 0x56:
        v14 = CFSTR("RESUME_ROUTE_WITH_U_TURN");
        break;
      case 0x57:
        v14 = CFSTR("CUSTOM");
        break;
      case 0x58:
        v14 = CFSTR("TURN_AROUND");
        break;
      default:
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 48));
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
        break;
    }
    if (a2)
      v15 = CFSTR("maneuverType");
    else
      v15 = CFSTR("maneuver_type");
    objc_msgSend(v4, "setObject:forKey:", v14, v15);

    if ((*(_BYTE *)(a1 + 52) & 1) == 0)
      goto LABEL_100;
    goto LABEL_91;
  }
  v11 = *(_DWORD *)(a1 + 44);
  if (v11)
  {
    if (v11 == 1)
    {
      v12 = CFSTR("JCTTYPE_ROUNDABOUT");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 44));
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v12 = CFSTR("JCTTYPE_NORMAL");
  }
  if (a2)
    v13 = CFSTR("junctionType");
  else
    v13 = CFSTR("junction_type");
  objc_msgSend(v4, "setObject:forKey:", v12, v13);

  v10 = *(_BYTE *)(a1 + 52);
  if ((v10 & 4) != 0)
    goto LABEL_23;
LABEL_12:
  if ((v10 & 1) != 0)
  {
LABEL_91:
    v16 = *(_DWORD *)(a1 + 40);
    if (v16)
    {
      if (v16 == 1)
      {
        v17 = CFSTR("LEFT_SIDE");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 40));
        v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v17 = CFSTR("RIGHT_SIDE");
    }
    if (a2)
      v18 = CFSTR("drivingSide");
    else
      v18 = CFSTR("driving_side");
    objc_msgSend(v4, "setObject:forKey:", v17, v18);

  }
LABEL_100:
  v19 = *(void **)(a1 + 8);
  if (v19)
  {
    objc_msgSend(v19, "dictionaryRepresentation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v20, "count"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __45__GEOJunctionInfo__dictionaryRepresentation___block_invoke;
      v26[3] = &unk_1E1C00600;
      v23 = v22;
      v27 = v23;
      objc_msgSend(v21, "enumerateKeysAndObjectsUsingBlock:", v26);
      v24 = v23;

      v21 = v24;
    }
    objc_msgSend(v4, "setObject:forKey:", v21, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOJunctionInfo _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __45__GEOJunctionInfo__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOJunctionInfo)initWithDictionary:(id)a3
{
  return (GEOJunctionInfo *)-[GEOJunctionInfo _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  id v16;
  uint64_t v17;
  const __CFString *v18;
  void *v19;
  id v20;
  uint64_t v21;
  const __CFString *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("junctionElement");
      else
        v6 = CFSTR("junction_element");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v31 = 0u;
        v32 = 0u;
        v29 = 0u;
        v30 = 0u;
        v8 = v7;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v30;
          do
          {
            v12 = 0;
            do
            {
              if (*(_QWORD *)v30 != v11)
                objc_enumerationMutation(v8);
              v13 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v12);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v27 = 0;
                v28 = 0;
                _GEOJunctionElementFromDictionaryRepresentation(v13, (uint64_t)&v27);
                objc_msgSend(a1, "addJunctionElement:", v27, v28);
              }
              ++v12;
            }
            while (v10 != v12);
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
          }
          while (v10);
        }

      }
      if (a3)
        v14 = CFSTR("junctionType");
      else
        v14 = CFSTR("junction_type");
      objc_msgSend(v5, "objectForKeyedSubscript:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v16 = v15;
        if ((objc_msgSend(v16, "isEqualToString:", CFSTR("JCTTYPE_NORMAL")) & 1) != 0)
          v17 = 0;
        else
          v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("JCTTYPE_ROUNDABOUT"));

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_28;
        v17 = objc_msgSend(v15, "intValue");
      }
      objc_msgSend(a1, "setJunctionType:", v17);
LABEL_28:

      if (a3)
        v18 = CFSTR("maneuverType");
      else
        v18 = CFSTR("maneuver_type");
      objc_msgSend(v5, "objectForKeyedSubscript:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v20 = v19;
        if ((objc_msgSend(v20, "isEqualToString:", CFSTR("NO_TURN")) & 1) != 0)
        {
          v21 = 0;
        }
        else if ((objc_msgSend(v20, "isEqualToString:", CFSTR("LEFT_TURN")) & 1) != 0)
        {
          v21 = 1;
        }
        else if ((objc_msgSend(v20, "isEqualToString:", CFSTR("RIGHT_TURN")) & 1) != 0)
        {
          v21 = 2;
        }
        else if ((objc_msgSend(v20, "isEqualToString:", CFSTR("STRAIGHT_AHEAD")) & 1) != 0)
        {
          v21 = 3;
        }
        else if ((objc_msgSend(v20, "isEqualToString:", CFSTR("U_TURN")) & 1) != 0)
        {
          v21 = 4;
        }
        else if ((objc_msgSend(v20, "isEqualToString:", CFSTR("FOLLOW_ROAD")) & 1) != 0)
        {
          v21 = 5;
        }
        else if ((objc_msgSend(v20, "isEqualToString:", CFSTR("ENTER_ROUNDABOUT")) & 1) != 0)
        {
          v21 = 6;
        }
        else if ((objc_msgSend(v20, "isEqualToString:", CFSTR("EXIT_ROUNDABOUT")) & 1) != 0)
        {
          v21 = 7;
        }
        else if ((objc_msgSend(v20, "isEqualToString:", CFSTR("OFF_RAMP")) & 1) != 0)
        {
          v21 = 11;
        }
        else if ((objc_msgSend(v20, "isEqualToString:", CFSTR("ON_RAMP")) & 1) != 0)
        {
          v21 = 12;
        }
        else if ((objc_msgSend(v20, "isEqualToString:", CFSTR("ARRIVE_END_OF_NAVIGATION")) & 1) != 0)
        {
          v21 = 16;
        }
        else if ((objc_msgSend(v20, "isEqualToString:", CFSTR("START_ROUTE")) & 1) != 0)
        {
          v21 = 17;
        }
        else if ((objc_msgSend(v20, "isEqualToString:", CFSTR("ARRIVE_AT_DESTINATION")) & 1) != 0)
        {
          v21 = 18;
        }
        else if ((objc_msgSend(v20, "isEqualToString:", CFSTR("KEEP_LEFT")) & 1) != 0)
        {
          v21 = 20;
        }
        else if ((objc_msgSend(v20, "isEqualToString:", CFSTR("KEEP_RIGHT")) & 1) != 0)
        {
          v21 = 21;
        }
        else if ((objc_msgSend(v20, "isEqualToString:", CFSTR("ENTER_FERRY")) & 1) != 0)
        {
          v21 = 22;
        }
        else if ((objc_msgSend(v20, "isEqualToString:", CFSTR("EXIT_FERRY")) & 1) != 0)
        {
          v21 = 23;
        }
        else if ((objc_msgSend(v20, "isEqualToString:", CFSTR("CHANGE_FERRY")) & 1) != 0)
        {
          v21 = 24;
        }
        else if ((objc_msgSend(v20, "isEqualToString:", CFSTR("START_ROUTE_WITH_U_TURN")) & 1) != 0)
        {
          v21 = 25;
        }
        else if ((objc_msgSend(v20, "isEqualToString:", CFSTR("U_TURN_AT_ROUNDABOUT")) & 1) != 0)
        {
          v21 = 26;
        }
        else if ((objc_msgSend(v20, "isEqualToString:", CFSTR("LEFT_TURN_AT_END")) & 1) != 0)
        {
          v21 = 27;
        }
        else if ((objc_msgSend(v20, "isEqualToString:", CFSTR("RIGHT_TURN_AT_END")) & 1) != 0)
        {
          v21 = 28;
        }
        else if ((objc_msgSend(v20, "isEqualToString:", CFSTR("HIGHWAY_OFF_RAMP_LEFT")) & 1) != 0)
        {
          v21 = 29;
        }
        else if ((objc_msgSend(v20, "isEqualToString:", CFSTR("HIGHWAY_OFF_RAMP_RIGHT")) & 1) != 0)
        {
          v21 = 30;
        }
        else if ((objc_msgSend(v20, "isEqualToString:", CFSTR("ARRIVE_AT_DESTINATION_LEFT")) & 1) != 0)
        {
          v21 = 33;
        }
        else if ((objc_msgSend(v20, "isEqualToString:", CFSTR("ARRIVE_AT_DESTINATION_RIGHT")) & 1) != 0)
        {
          v21 = 34;
        }
        else if ((objc_msgSend(v20, "isEqualToString:", CFSTR("U_TURN_WHEN_POSSIBLE")) & 1) != 0)
        {
          v21 = 35;
        }
        else if ((objc_msgSend(v20, "isEqualToString:", CFSTR("ARRIVE_END_OF_DIRECTIONS")) & 1) != 0)
        {
          v21 = 39;
        }
        else if ((objc_msgSend(v20, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_1")) & 1) != 0)
        {
          v21 = 41;
        }
        else if ((objc_msgSend(v20, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_2")) & 1) != 0)
        {
          v21 = 42;
        }
        else if ((objc_msgSend(v20, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_3")) & 1) != 0)
        {
          v21 = 43;
        }
        else if ((objc_msgSend(v20, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_4")) & 1) != 0)
        {
          v21 = 44;
        }
        else if ((objc_msgSend(v20, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_5")) & 1) != 0)
        {
          v21 = 45;
        }
        else if ((objc_msgSend(v20, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_6")) & 1) != 0)
        {
          v21 = 46;
        }
        else if ((objc_msgSend(v20, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_7")) & 1) != 0)
        {
          v21 = 47;
        }
        else if ((objc_msgSend(v20, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_8")) & 1) != 0)
        {
          v21 = 48;
        }
        else if ((objc_msgSend(v20, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_9")) & 1) != 0)
        {
          v21 = 49;
        }
        else if ((objc_msgSend(v20, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_10")) & 1) != 0)
        {
          v21 = 50;
        }
        else if ((objc_msgSend(v20, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_11")) & 1) != 0)
        {
          v21 = 51;
        }
        else if ((objc_msgSend(v20, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_12")) & 1) != 0)
        {
          v21 = 52;
        }
        else if ((objc_msgSend(v20, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_13")) & 1) != 0)
        {
          v21 = 53;
        }
        else if ((objc_msgSend(v20, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_14")) & 1) != 0)
        {
          v21 = 54;
        }
        else if ((objc_msgSend(v20, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_15")) & 1) != 0)
        {
          v21 = 55;
        }
        else if ((objc_msgSend(v20, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_16")) & 1) != 0)
        {
          v21 = 56;
        }
        else if ((objc_msgSend(v20, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_17")) & 1) != 0)
        {
          v21 = 57;
        }
        else if ((objc_msgSend(v20, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_18")) & 1) != 0)
        {
          v21 = 58;
        }
        else if ((objc_msgSend(v20, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_19")) & 1) != 0)
        {
          v21 = 59;
        }
        else if ((objc_msgSend(v20, "isEqualToString:", CFSTR("SHARP_LEFT_TURN")) & 1) != 0)
        {
          v21 = 60;
        }
        else if ((objc_msgSend(v20, "isEqualToString:", CFSTR("SHARP_RIGHT_TURN")) & 1) != 0)
        {
          v21 = 61;
        }
        else if ((objc_msgSend(v20, "isEqualToString:", CFSTR("SLIGHT_LEFT_TURN")) & 1) != 0)
        {
          v21 = 62;
        }
        else if ((objc_msgSend(v20, "isEqualToString:", CFSTR("SLIGHT_RIGHT_TURN")) & 1) != 0)
        {
          v21 = 63;
        }
        else if ((objc_msgSend(v20, "isEqualToString:", CFSTR("CHANGE_HIGHWAY")) & 1) != 0)
        {
          v21 = 64;
        }
        else if ((objc_msgSend(v20, "isEqualToString:", CFSTR("CHANGE_HIGHWAY_LEFT")) & 1) != 0)
        {
          v21 = 65;
        }
        else if ((objc_msgSend(v20, "isEqualToString:", CFSTR("CHANGE_HIGHWAY_RIGHT")) & 1) != 0)
        {
          v21 = 66;
        }
        else if ((objc_msgSend(v20, "isEqualToString:", CFSTR("TOLL_STATION")) & 1) != 0)
        {
          v21 = 80;
        }
        else if ((objc_msgSend(v20, "isEqualToString:", CFSTR("ENTER_TUNNEL")) & 1) != 0)
        {
          v21 = 81;
        }
        else if ((objc_msgSend(v20, "isEqualToString:", CFSTR("WAYPOINT_STOP")) & 1) != 0)
        {
          v21 = 82;
        }
        else if ((objc_msgSend(v20, "isEqualToString:", CFSTR("WAYPOINT_STOP_LEFT")) & 1) != 0)
        {
          v21 = 83;
        }
        else if ((objc_msgSend(v20, "isEqualToString:", CFSTR("WAYPOINT_STOP_RIGHT")) & 1) != 0)
        {
          v21 = 84;
        }
        else if ((objc_msgSend(v20, "isEqualToString:", CFSTR("RESUME_ROUTE")) & 1) != 0)
        {
          v21 = 85;
        }
        else if ((objc_msgSend(v20, "isEqualToString:", CFSTR("RESUME_ROUTE_WITH_U_TURN")) & 1) != 0)
        {
          v21 = 86;
        }
        else if ((objc_msgSend(v20, "isEqualToString:", CFSTR("CUSTOM")) & 1) != 0)
        {
          v21 = 87;
        }
        else if (objc_msgSend(v20, "isEqualToString:", CFSTR("TURN_AROUND")))
        {
          v21 = 88;
        }
        else
        {
          v21 = 0;
        }

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_163;
        v21 = objc_msgSend(v19, "intValue");
      }
      objc_msgSend(a1, "setManeuverType:", v21);
LABEL_163:

      if (a3)
        v22 = CFSTR("drivingSide");
      else
        v22 = CFSTR("driving_side");
      objc_msgSend(v5, "objectForKeyedSubscript:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v24 = v23;
        if ((objc_msgSend(v24, "isEqualToString:", CFSTR("RIGHT_SIDE")) & 1) != 0)
          v25 = 0;
        else
          v25 = objc_msgSend(v24, "isEqualToString:", CFSTR("LEFT_SIDE"));

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_174:

          goto LABEL_175;
        }
        v25 = objc_msgSend(v23, "intValue");
      }
      objc_msgSend(a1, "setDrivingSide:", v25);
      goto LABEL_174;
    }
  }
LABEL_175:

  return a1;
}

- (GEOJunctionInfo)initWithJSON:(id)a3
{
  return (GEOJunctionInfo *)-[GEOJunctionInfo _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOJunctionInfoIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOJunctionInfoReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  uint64_t v5;
  unint64_t v6;
  char flags;

  v4 = a3;
  if (self->_junctionElementsCount)
  {
    v5 = 0;
    v6 = 0;
    do
    {
      PBDataWriterPlaceMark();
      GEOJunctionElementWriteTo((uint64_t)&self->_junctionElements[v5]);
      PBDataWriterRecallMark();
      ++v6;
      ++v5;
    }
    while (v6 < self->_junctionElementsCount);
  }
  flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
    if ((*(_BYTE *)&self->_flags & 4) == 0)
      goto LABEL_6;
LABEL_10:
    PBDataWriterWriteInt32Field();
    if ((*(_BYTE *)&self->_flags & 1) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
  PBDataWriterWriteInt32Field();
  flags = (char)self->_flags;
  if ((flags & 4) != 0)
    goto LABEL_10;
LABEL_6:
  if ((flags & 1) != 0)
LABEL_7:
    PBDataWriterWriteInt32Field();
LABEL_8:
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4);

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  uint64_t v7;
  uint64_t v8;
  char flags;
  id v10;

  v10 = a3;
  -[GEOJunctionInfo readAll:](self, "readAll:", 0);
  if (-[GEOJunctionInfo junctionElementsCount](self, "junctionElementsCount"))
  {
    objc_msgSend(v10, "clearJunctionElements");
    v4 = -[GEOJunctionInfo junctionElementsCount](self, "junctionElementsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        v7 = -[GEOJunctionInfo junctionElementAtIndex:](self, "junctionElementAtIndex:", i);
        objc_msgSend(v10, "addJunctionElement:", v7, v8);
      }
    }
  }
  flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
    if ((*(_BYTE *)&self->_flags & 4) == 0)
      goto LABEL_7;
LABEL_11:
    *((_DWORD *)v10 + 12) = self->_maneuverType;
    *((_BYTE *)v10 + 52) |= 4u;
    if ((*(_BYTE *)&self->_flags & 1) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
  *((_DWORD *)v10 + 11) = self->_junctionType;
  *((_BYTE *)v10 + 52) |= 2u;
  flags = (char)self->_flags;
  if ((flags & 4) != 0)
    goto LABEL_11;
LABEL_7:
  if ((flags & 1) != 0)
  {
LABEL_8:
    *((_DWORD *)v10 + 10) = self->_drivingSide;
    *((_BYTE *)v10 + 52) |= 1u;
  }
LABEL_9:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  uint64_t v5;
  unint64_t junctionElementsCount;
  char flags;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = v4;
  junctionElementsCount = self->_junctionElementsCount;
  if (junctionElementsCount)
  {
    -[GEOJunctionInfo _reserveJunctionElements:](v4, junctionElementsCount);
    memcpy(*(void **)(v5 + 16), self->_junctionElements, 16 * self->_junctionElementsCount);
    *(_QWORD *)(v5 + 24) = self->_junctionElementsCount;
  }
  flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
    if ((*(_BYTE *)&self->_flags & 4) == 0)
      goto LABEL_5;
LABEL_9:
    *(_DWORD *)(v5 + 48) = self->_maneuverType;
    *(_BYTE *)(v5 + 52) |= 4u;
    if ((*(_BYTE *)&self->_flags & 1) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
  *(_DWORD *)(v5 + 44) = self->_junctionType;
  *(_BYTE *)(v5 + 52) |= 2u;
  flags = (char)self->_flags;
  if ((flags & 4) != 0)
    goto LABEL_9;
LABEL_5:
  if ((flags & 1) != 0)
  {
LABEL_6:
    *(_DWORD *)(v5 + 40) = self->_drivingSide;
    *(_BYTE *)(v5 + 52) |= 1u;
  }
LABEL_7:
  objc_storeStrong((id *)(v5 + 8), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  const void **v4;
  unint64_t junctionElementsCount;
  BOOL v6;

  v4 = (const void **)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_4;
  -[GEOJunctionInfo readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  junctionElementsCount = self->_junctionElementsCount;
  if ((const void *)junctionElementsCount != v4[3]
    || memcmp(self->_junctionElements, v4[2], 16 * junctionElementsCount))
  {
    goto LABEL_4;
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 2) == 0 || self->_junctionType != *((_DWORD *)v4 + 11))
      goto LABEL_4;
  }
  else if ((*((_BYTE *)v4 + 52) & 2) != 0)
  {
    goto LABEL_4;
  }
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 4) == 0 || self->_maneuverType != *((_DWORD *)v4 + 12))
      goto LABEL_4;
  }
  else if ((*((_BYTE *)v4 + 52) & 4) != 0)
  {
    goto LABEL_4;
  }
  v6 = (*((_BYTE *)v4 + 52) & 1) == 0;
  if ((*(_BYTE *)&self->_flags & 1) == 0)
    goto LABEL_5;
  if ((*((_BYTE *)v4 + 52) & 1) != 0 && self->_drivingSide == *((_DWORD *)v4 + 10))
  {
    v6 = 1;
    goto LABEL_5;
  }
LABEL_4:
  v6 = 0;
LABEL_5:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  -[GEOJunctionInfo readAll:](self, "readAll:", 1);
  v3 = PBHashBytes();
  if ((*(_BYTE *)&self->_flags & 2) == 0)
  {
    v4 = 0;
    if ((*(_BYTE *)&self->_flags & 4) != 0)
      goto LABEL_3;
LABEL_6:
    v5 = 0;
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      goto LABEL_4;
LABEL_7:
    v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6;
  }
  v4 = 2654435761 * self->_junctionType;
  if ((*(_BYTE *)&self->_flags & 4) == 0)
    goto LABEL_6;
LABEL_3:
  v5 = 2654435761 * self->_maneuverType;
  if ((*(_BYTE *)&self->_flags & 1) == 0)
    goto LABEL_7;
LABEL_4:
  v6 = 2654435761 * self->_drivingSide;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  uint64_t v8;
  char v9;
  int *v10;

  v10 = (int *)a3;
  objc_msgSend(v10, "readAll:", 0);
  v4 = objc_msgSend(v10, "junctionElementsCount");
  if (v4)
  {
    v5 = v4;
    for (i = 0; i != v5; ++i)
    {
      v7 = objc_msgSend(v10, "junctionElementAtIndex:", i);
      -[GEOJunctionInfo addJunctionElement:](self, "addJunctionElement:", v7, v8);
    }
  }
  v9 = *((_BYTE *)v10 + 52);
  if ((v9 & 2) == 0)
  {
    if ((v10[13] & 4) == 0)
      goto LABEL_6;
LABEL_10:
    self->_maneuverType = v10[12];
    *(_BYTE *)&self->_flags |= 4u;
    if ((v10[13] & 1) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
  self->_junctionType = v10[11];
  *(_BYTE *)&self->_flags |= 2u;
  v9 = *((_BYTE *)v10 + 52);
  if ((v9 & 4) != 0)
    goto LABEL_10;
LABEL_6:
  if ((v9 & 1) != 0)
  {
LABEL_7:
    self->_drivingSide = v10[10];
    *(_BYTE *)&self->_flags |= 1u;
  }
LABEL_8:

}

- (PBUnknownFields)unknownFields
{
  return self->_unknownFields;
}

- (void)clearUnknownFields:(BOOL)a3
{
  _BOOL4 v3;
  PBUnknownFields *unknownFields;

  v3 = a3;
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
    -[GEOJunctionInfo readAll:](self, "readAll:", 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end
