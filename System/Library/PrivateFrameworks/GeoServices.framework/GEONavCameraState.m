@implementation GEONavCameraState

- (int)upcomingManeuverType
{
  if ((*(_BYTE *)&self->_flags & 4) != 0)
    return self->_upcomingManeuverType;
  else
    return 0;
}

- (void)setUpcomingManeuverType:(int)a3
{
  *(_BYTE *)&self->_flags |= 4u;
  self->_upcomingManeuverType = a3;
}

- (void)setHasUpcomingManeuverType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasUpcomingManeuverType
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (id)upcomingManeuverTypeAsString:(int)a3
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

- (int)StringAsUpcomingManeuverType:(id)a3
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

- (int)distanceToManeuver
{
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    return self->_distanceToManeuver;
  else
    return 0;
}

- (void)setDistanceToManeuver:(int)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_distanceToManeuver = a3;
}

- (void)setHasDistanceToManeuver:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasDistanceToManeuver
{
  return *(_BYTE *)&self->_flags & 1;
}

- (id)distanceToManeuverAsString:(int)a3
{
  if (a3 < 9)
    return off_1E1C231E0[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsDistanceToManeuver:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_DISTANCE_TO_MANEUVER")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("IMMEDIATE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EXTREMELY_NEAR")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VERY_NEAR")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NEAR")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MEDIUM")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FAR")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VERY_FAR")) & 1) != 0)
  {
    v4 = 7;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("EXTREMELY_FAR")))
  {
    v4 = 8;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)isGroupedManeuver
{
  return self->_isGroupedManeuver;
}

- (void)setIsGroupedManeuver:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 8u;
  self->_isGroupedManeuver = a3;
}

- (void)setHasIsGroupedManeuver:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xF7 | v3;
}

- (BOOL)hasIsGroupedManeuver
{
  return (*(_BYTE *)&self->_flags >> 3) & 1;
}

- (int)speedBucket
{
  if ((*(_BYTE *)&self->_flags & 2) != 0)
    return self->_speedBucket;
  else
    return 0;
}

- (void)setSpeedBucket:(int)a3
{
  *(_BYTE *)&self->_flags |= 2u;
  self->_speedBucket = a3;
}

- (void)setHasSpeedBucket:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasSpeedBucket
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (id)speedBucketAsString:(int)a3
{
  if (a3 < 4)
    return off_1E1C23228[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsSpeedBucket:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_SPEED_BUCKET")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("STILL")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SLOW")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("FAST")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

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
  v8.super_class = (Class)GEONavCameraState;
  -[GEONavCameraState description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEONavCameraState dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEONavCameraState _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  char v5;
  __CFString *v6;
  const __CFString *v7;
  uint64_t v8;
  __CFString *v9;
  const __CFString *v10;
  void *v11;
  const __CFString *v12;
  uint64_t v13;
  __CFString *v14;
  const __CFString *v15;

  if (!a1)
  {
    v4 = 0;
    return v4;
  }
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_BYTE *)(a1 + 24);
  if ((v5 & 4) != 0)
  {
    v6 = CFSTR("NO_TURN");
    switch(*(_DWORD *)(a1 + 16))
    {
      case 0:
        break;
      case 1:
        v6 = CFSTR("LEFT_TURN");
        break;
      case 2:
        v6 = CFSTR("RIGHT_TURN");
        break;
      case 3:
        v6 = CFSTR("STRAIGHT_AHEAD");
        break;
      case 4:
        v6 = CFSTR("U_TURN");
        break;
      case 5:
        v6 = CFSTR("FOLLOW_ROAD");
        break;
      case 6:
        v6 = CFSTR("ENTER_ROUNDABOUT");
        break;
      case 7:
        v6 = CFSTR("EXIT_ROUNDABOUT");
        break;
      case 0xB:
        v6 = CFSTR("OFF_RAMP");
        break;
      case 0xC:
        v6 = CFSTR("ON_RAMP");
        break;
      case 0x10:
        v6 = CFSTR("ARRIVE_END_OF_NAVIGATION");
        break;
      case 0x11:
        v6 = CFSTR("START_ROUTE");
        break;
      case 0x12:
        v6 = CFSTR("ARRIVE_AT_DESTINATION");
        break;
      case 0x14:
        v6 = CFSTR("KEEP_LEFT");
        break;
      case 0x15:
        v6 = CFSTR("KEEP_RIGHT");
        break;
      case 0x16:
        v6 = CFSTR("ENTER_FERRY");
        break;
      case 0x17:
        v6 = CFSTR("EXIT_FERRY");
        break;
      case 0x18:
        v6 = CFSTR("CHANGE_FERRY");
        break;
      case 0x19:
        v6 = CFSTR("START_ROUTE_WITH_U_TURN");
        break;
      case 0x1A:
        v6 = CFSTR("U_TURN_AT_ROUNDABOUT");
        break;
      case 0x1B:
        v6 = CFSTR("LEFT_TURN_AT_END");
        break;
      case 0x1C:
        v6 = CFSTR("RIGHT_TURN_AT_END");
        break;
      case 0x1D:
        v6 = CFSTR("HIGHWAY_OFF_RAMP_LEFT");
        break;
      case 0x1E:
        v6 = CFSTR("HIGHWAY_OFF_RAMP_RIGHT");
        break;
      case 0x21:
        v6 = CFSTR("ARRIVE_AT_DESTINATION_LEFT");
        break;
      case 0x22:
        v6 = CFSTR("ARRIVE_AT_DESTINATION_RIGHT");
        break;
      case 0x23:
        v6 = CFSTR("U_TURN_WHEN_POSSIBLE");
        break;
      case 0x27:
        v6 = CFSTR("ARRIVE_END_OF_DIRECTIONS");
        break;
      case 0x29:
        v6 = CFSTR("ROUNDABOUT_EXIT_1");
        break;
      case 0x2A:
        v6 = CFSTR("ROUNDABOUT_EXIT_2");
        break;
      case 0x2B:
        v6 = CFSTR("ROUNDABOUT_EXIT_3");
        break;
      case 0x2C:
        v6 = CFSTR("ROUNDABOUT_EXIT_4");
        break;
      case 0x2D:
        v6 = CFSTR("ROUNDABOUT_EXIT_5");
        break;
      case 0x2E:
        v6 = CFSTR("ROUNDABOUT_EXIT_6");
        break;
      case 0x2F:
        v6 = CFSTR("ROUNDABOUT_EXIT_7");
        break;
      case 0x30:
        v6 = CFSTR("ROUNDABOUT_EXIT_8");
        break;
      case 0x31:
        v6 = CFSTR("ROUNDABOUT_EXIT_9");
        break;
      case 0x32:
        v6 = CFSTR("ROUNDABOUT_EXIT_10");
        break;
      case 0x33:
        v6 = CFSTR("ROUNDABOUT_EXIT_11");
        break;
      case 0x34:
        v6 = CFSTR("ROUNDABOUT_EXIT_12");
        break;
      case 0x35:
        v6 = CFSTR("ROUNDABOUT_EXIT_13");
        break;
      case 0x36:
        v6 = CFSTR("ROUNDABOUT_EXIT_14");
        break;
      case 0x37:
        v6 = CFSTR("ROUNDABOUT_EXIT_15");
        break;
      case 0x38:
        v6 = CFSTR("ROUNDABOUT_EXIT_16");
        break;
      case 0x39:
        v6 = CFSTR("ROUNDABOUT_EXIT_17");
        break;
      case 0x3A:
        v6 = CFSTR("ROUNDABOUT_EXIT_18");
        break;
      case 0x3B:
        v6 = CFSTR("ROUNDABOUT_EXIT_19");
        break;
      case 0x3C:
        v6 = CFSTR("SHARP_LEFT_TURN");
        break;
      case 0x3D:
        v6 = CFSTR("SHARP_RIGHT_TURN");
        break;
      case 0x3E:
        v6 = CFSTR("SLIGHT_LEFT_TURN");
        break;
      case 0x3F:
        v6 = CFSTR("SLIGHT_RIGHT_TURN");
        break;
      case 0x40:
        v6 = CFSTR("CHANGE_HIGHWAY");
        break;
      case 0x41:
        v6 = CFSTR("CHANGE_HIGHWAY_LEFT");
        break;
      case 0x42:
        v6 = CFSTR("CHANGE_HIGHWAY_RIGHT");
        break;
      case 0x50:
        v6 = CFSTR("TOLL_STATION");
        break;
      case 0x51:
        v6 = CFSTR("ENTER_TUNNEL");
        break;
      case 0x52:
        v6 = CFSTR("WAYPOINT_STOP");
        break;
      case 0x53:
        v6 = CFSTR("WAYPOINT_STOP_LEFT");
        break;
      case 0x54:
        v6 = CFSTR("WAYPOINT_STOP_RIGHT");
        break;
      case 0x55:
        v6 = CFSTR("RESUME_ROUTE");
        break;
      case 0x56:
        v6 = CFSTR("RESUME_ROUTE_WITH_U_TURN");
        break;
      case 0x57:
        v6 = CFSTR("CUSTOM");
        break;
      case 0x58:
        v6 = CFSTR("TURN_AROUND");
        break;
      default:
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 16));
        v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
        break;
    }
    if (a2)
      v7 = CFSTR("upcomingManeuverType");
    else
      v7 = CFSTR("upcoming_maneuver_type");
    objc_msgSend(v4, "setObject:forKey:", v6, v7);

    v5 = *(_BYTE *)(a1 + 24);
    if ((v5 & 1) == 0)
    {
LABEL_4:
      if ((v5 & 8) == 0)
        goto LABEL_5;
      goto LABEL_82;
    }
  }
  else if ((*(_BYTE *)(a1 + 24) & 1) == 0)
  {
    goto LABEL_4;
  }
  v8 = *(int *)(a1 + 8);
  if (v8 >= 9)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 8));
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = off_1E1C231E0[v8];
  }
  if (a2)
    v10 = CFSTR("distanceToManeuver");
  else
    v10 = CFSTR("distance_to_maneuver");
  objc_msgSend(v4, "setObject:forKey:", v9, v10);

  v5 = *(_BYTE *)(a1 + 24);
  if ((v5 & 8) == 0)
  {
LABEL_5:
    if ((v5 & 2) == 0)
      return v4;
    goto LABEL_86;
  }
LABEL_82:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 20));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v12 = CFSTR("isGroupedManeuver");
  else
    v12 = CFSTR("is_grouped_maneuver");
  objc_msgSend(v4, "setObject:forKey:", v11, v12);

  if ((*(_BYTE *)(a1 + 24) & 2) != 0)
  {
LABEL_86:
    v13 = *(int *)(a1 + 12);
    if (v13 >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 12));
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = off_1E1C23228[v13];
    }
    if (a2)
      v15 = CFSTR("speedBucket");
    else
      v15 = CFSTR("speed_bucket");
    objc_msgSend(v4, "setObject:forKey:", v14, v15);

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEONavCameraState _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEONavCameraState)initWithDictionary:(id)a3
{
  return (GEONavCameraState *)-[GEONavCameraState _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  id v8;
  uint64_t v9;
  const __CFString *v10;
  void *v11;
  id v12;
  uint64_t v13;
  const __CFString *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  id v18;
  uint64_t v19;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("upcomingManeuverType");
      else
        v6 = CFSTR("upcoming_maneuver_type");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = v7;
        if ((objc_msgSend(v8, "isEqualToString:", CFSTR("NO_TURN")) & 1) != 0)
        {
          v9 = 0;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("LEFT_TURN")) & 1) != 0)
        {
          v9 = 1;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("RIGHT_TURN")) & 1) != 0)
        {
          v9 = 2;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("STRAIGHT_AHEAD")) & 1) != 0)
        {
          v9 = 3;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("U_TURN")) & 1) != 0)
        {
          v9 = 4;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("FOLLOW_ROAD")) & 1) != 0)
        {
          v9 = 5;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("ENTER_ROUNDABOUT")) & 1) != 0)
        {
          v9 = 6;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("EXIT_ROUNDABOUT")) & 1) != 0)
        {
          v9 = 7;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("OFF_RAMP")) & 1) != 0)
        {
          v9 = 11;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("ON_RAMP")) & 1) != 0)
        {
          v9 = 12;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("ARRIVE_END_OF_NAVIGATION")) & 1) != 0)
        {
          v9 = 16;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("START_ROUTE")) & 1) != 0)
        {
          v9 = 17;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("ARRIVE_AT_DESTINATION")) & 1) != 0)
        {
          v9 = 18;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("KEEP_LEFT")) & 1) != 0)
        {
          v9 = 20;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("KEEP_RIGHT")) & 1) != 0)
        {
          v9 = 21;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("ENTER_FERRY")) & 1) != 0)
        {
          v9 = 22;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("EXIT_FERRY")) & 1) != 0)
        {
          v9 = 23;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("CHANGE_FERRY")) & 1) != 0)
        {
          v9 = 24;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("START_ROUTE_WITH_U_TURN")) & 1) != 0)
        {
          v9 = 25;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("U_TURN_AT_ROUNDABOUT")) & 1) != 0)
        {
          v9 = 26;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("LEFT_TURN_AT_END")) & 1) != 0)
        {
          v9 = 27;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("RIGHT_TURN_AT_END")) & 1) != 0)
        {
          v9 = 28;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("HIGHWAY_OFF_RAMP_LEFT")) & 1) != 0)
        {
          v9 = 29;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("HIGHWAY_OFF_RAMP_RIGHT")) & 1) != 0)
        {
          v9 = 30;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("ARRIVE_AT_DESTINATION_LEFT")) & 1) != 0)
        {
          v9 = 33;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("ARRIVE_AT_DESTINATION_RIGHT")) & 1) != 0)
        {
          v9 = 34;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("U_TURN_WHEN_POSSIBLE")) & 1) != 0)
        {
          v9 = 35;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("ARRIVE_END_OF_DIRECTIONS")) & 1) != 0)
        {
          v9 = 39;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_1")) & 1) != 0)
        {
          v9 = 41;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_2")) & 1) != 0)
        {
          v9 = 42;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_3")) & 1) != 0)
        {
          v9 = 43;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_4")) & 1) != 0)
        {
          v9 = 44;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_5")) & 1) != 0)
        {
          v9 = 45;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_6")) & 1) != 0)
        {
          v9 = 46;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_7")) & 1) != 0)
        {
          v9 = 47;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_8")) & 1) != 0)
        {
          v9 = 48;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_9")) & 1) != 0)
        {
          v9 = 49;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_10")) & 1) != 0)
        {
          v9 = 50;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_11")) & 1) != 0)
        {
          v9 = 51;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_12")) & 1) != 0)
        {
          v9 = 52;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_13")) & 1) != 0)
        {
          v9 = 53;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_14")) & 1) != 0)
        {
          v9 = 54;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_15")) & 1) != 0)
        {
          v9 = 55;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_16")) & 1) != 0)
        {
          v9 = 56;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_17")) & 1) != 0)
        {
          v9 = 57;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_18")) & 1) != 0)
        {
          v9 = 58;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_19")) & 1) != 0)
        {
          v9 = 59;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("SHARP_LEFT_TURN")) & 1) != 0)
        {
          v9 = 60;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("SHARP_RIGHT_TURN")) & 1) != 0)
        {
          v9 = 61;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("SLIGHT_LEFT_TURN")) & 1) != 0)
        {
          v9 = 62;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("SLIGHT_RIGHT_TURN")) & 1) != 0)
        {
          v9 = 63;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("CHANGE_HIGHWAY")) & 1) != 0)
        {
          v9 = 64;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("CHANGE_HIGHWAY_LEFT")) & 1) != 0)
        {
          v9 = 65;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("CHANGE_HIGHWAY_RIGHT")) & 1) != 0)
        {
          v9 = 66;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("TOLL_STATION")) & 1) != 0)
        {
          v9 = 80;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("ENTER_TUNNEL")) & 1) != 0)
        {
          v9 = 81;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("WAYPOINT_STOP")) & 1) != 0)
        {
          v9 = 82;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("WAYPOINT_STOP_LEFT")) & 1) != 0)
        {
          v9 = 83;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("WAYPOINT_STOP_RIGHT")) & 1) != 0)
        {
          v9 = 84;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("RESUME_ROUTE")) & 1) != 0)
        {
          v9 = 85;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("RESUME_ROUTE_WITH_U_TURN")) & 1) != 0)
        {
          v9 = 86;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("CUSTOM")) & 1) != 0)
        {
          v9 = 87;
        }
        else if (objc_msgSend(v8, "isEqualToString:", CFSTR("TURN_AROUND")))
        {
          v9 = 88;
        }
        else
        {
          v9 = 0;
        }

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_138;
        v9 = objc_msgSend(v7, "intValue");
      }
      objc_msgSend(a1, "setUpcomingManeuverType:", v9);
LABEL_138:

      if (a3)
        v10 = CFSTR("distanceToManeuver");
      else
        v10 = CFSTR("distance_to_maneuver");
      objc_msgSend(v5, "objectForKeyedSubscript:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v12 = v11;
        if ((objc_msgSend(v12, "isEqualToString:", CFSTR("UNKNOWN_DISTANCE_TO_MANEUVER")) & 1) != 0)
        {
          v13 = 0;
        }
        else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("IMMEDIATE")) & 1) != 0)
        {
          v13 = 1;
        }
        else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("EXTREMELY_NEAR")) & 1) != 0)
        {
          v13 = 2;
        }
        else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("VERY_NEAR")) & 1) != 0)
        {
          v13 = 3;
        }
        else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("NEAR")) & 1) != 0)
        {
          v13 = 4;
        }
        else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("MEDIUM")) & 1) != 0)
        {
          v13 = 5;
        }
        else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("FAR")) & 1) != 0)
        {
          v13 = 6;
        }
        else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("VERY_FAR")) & 1) != 0)
        {
          v13 = 7;
        }
        else if (objc_msgSend(v12, "isEqualToString:", CFSTR("EXTREMELY_FAR")))
        {
          v13 = 8;
        }
        else
        {
          v13 = 0;
        }

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_165;
        v13 = objc_msgSend(v11, "intValue");
      }
      objc_msgSend(a1, "setDistanceToManeuver:", v13);
LABEL_165:

      if (a3)
        v14 = CFSTR("isGroupedManeuver");
      else
        v14 = CFSTR("is_grouped_maneuver");
      objc_msgSend(v5, "objectForKeyedSubscript:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setIsGroupedManeuver:", objc_msgSend(v15, "BOOLValue"));

      if (a3)
        v16 = CFSTR("speedBucket");
      else
        v16 = CFSTR("speed_bucket");
      objc_msgSend(v5, "objectForKeyedSubscript:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v18 = v17;
        if ((objc_msgSend(v18, "isEqualToString:", CFSTR("UNKNOWN_SPEED_BUCKET")) & 1) != 0)
        {
          v19 = 0;
        }
        else if ((objc_msgSend(v18, "isEqualToString:", CFSTR("STILL")) & 1) != 0)
        {
          v19 = 1;
        }
        else if ((objc_msgSend(v18, "isEqualToString:", CFSTR("SLOW")) & 1) != 0)
        {
          v19 = 2;
        }
        else if (objc_msgSend(v18, "isEqualToString:", CFSTR("FAST")))
        {
          v19 = 3;
        }
        else
        {
          v19 = 0;
        }

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_187:

          goto LABEL_188;
        }
        v19 = objc_msgSend(v17, "intValue");
      }
      objc_msgSend(a1, "setSpeedBucket:", v19);
      goto LABEL_187;
    }
  }
LABEL_188:

  return a1;
}

- (GEONavCameraState)initWithJSON:(id)a3
{
  return (GEONavCameraState *)-[GEONavCameraState _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEONavCameraStateIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEONavCameraStateReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  char flags;
  id v5;

  v5 = a3;
  flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    flags = (char)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_3:
      if ((flags & 8) == 0)
        goto LABEL_4;
LABEL_9:
      PBDataWriterWriteBOOLField();
      if ((*(_BYTE *)&self->_flags & 2) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 1) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  flags = (char)self->_flags;
  if ((flags & 8) != 0)
    goto LABEL_9;
LABEL_4:
  if ((flags & 2) != 0)
LABEL_5:
    PBDataWriterWriteInt32Field();
LABEL_6:

}

- (void)copyTo:(id)a3
{
  char flags;
  _DWORD *v5;

  v5 = a3;
  -[GEONavCameraState readAll:](self, "readAll:", 0);
  flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    v5[4] = self->_upcomingManeuverType;
    *((_BYTE *)v5 + 24) |= 4u;
    flags = (char)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_3:
      if ((flags & 8) == 0)
        goto LABEL_4;
LABEL_9:
      *((_BYTE *)v5 + 20) = self->_isGroupedManeuver;
      *((_BYTE *)v5 + 24) |= 8u;
      if ((*(_BYTE *)&self->_flags & 2) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 1) == 0)
  {
    goto LABEL_3;
  }
  v5[2] = self->_distanceToManeuver;
  *((_BYTE *)v5 + 24) |= 1u;
  flags = (char)self->_flags;
  if ((flags & 8) != 0)
    goto LABEL_9;
LABEL_4:
  if ((flags & 2) != 0)
  {
LABEL_5:
    v5[3] = self->_speedBucket;
    *((_BYTE *)v5 + 24) |= 2u;
  }
LABEL_6:

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char flags;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    *((_DWORD *)result + 4) = self->_upcomingManeuverType;
    *((_BYTE *)result + 24) |= 4u;
    flags = (char)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_3:
      if ((flags & 8) == 0)
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 1) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 2) = self->_distanceToManeuver;
  *((_BYTE *)result + 24) |= 1u;
  flags = (char)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_4:
    if ((flags & 2) == 0)
      return result;
    goto LABEL_5;
  }
LABEL_9:
  *((_BYTE *)result + 20) = self->_isGroupedManeuver;
  *((_BYTE *)result + 24) |= 8u;
  if ((*(_BYTE *)&self->_flags & 2) == 0)
    return result;
LABEL_5:
  *((_DWORD *)result + 3) = self->_speedBucket;
  *((_BYTE *)result + 24) |= 2u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_24;
  -[GEONavCameraState readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 4) == 0 || self->_upcomingManeuverType != *((_DWORD *)v4 + 4))
      goto LABEL_24;
  }
  else if ((*((_BYTE *)v4 + 24) & 4) != 0)
  {
    goto LABEL_24;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 1) == 0 || self->_distanceToManeuver != *((_DWORD *)v4 + 2))
      goto LABEL_24;
  }
  else if ((*((_BYTE *)v4 + 24) & 1) != 0)
  {
    goto LABEL_24;
  }
  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 8) != 0)
    {
      if (self->_isGroupedManeuver)
      {
        if (!*((_BYTE *)v4 + 20))
          goto LABEL_24;
        goto LABEL_20;
      }
      if (!*((_BYTE *)v4 + 20))
        goto LABEL_20;
    }
LABEL_24:
    v5 = 0;
    goto LABEL_25;
  }
  if ((*((_BYTE *)v4 + 24) & 8) != 0)
    goto LABEL_24;
LABEL_20:
  v5 = (*((_BYTE *)v4 + 24) & 2) == 0;
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 2) == 0 || self->_speedBucket != *((_DWORD *)v4 + 3))
      goto LABEL_24;
    v5 = 1;
  }
LABEL_25:

  return v5;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  -[GEONavCameraState readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    v3 = 2654435761 * self->_upcomingManeuverType;
    if ((*(_BYTE *)&self->_flags & 1) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_distanceToManeuver;
      if ((*(_BYTE *)&self->_flags & 8) != 0)
        goto LABEL_4;
LABEL_8:
      v5 = 0;
      if ((*(_BYTE *)&self->_flags & 2) != 0)
        goto LABEL_5;
LABEL_9:
      v6 = 0;
      return v4 ^ v3 ^ v5 ^ v6;
    }
  }
  else
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      goto LABEL_3;
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_flags & 8) == 0)
    goto LABEL_8;
LABEL_4:
  v5 = 2654435761 * self->_isGroupedManeuver;
  if ((*(_BYTE *)&self->_flags & 2) == 0)
    goto LABEL_9;
LABEL_5:
  v6 = 2654435761 * self->_speedBucket;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  char v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "readAll:", 0);
  v4 = *((_BYTE *)v5 + 24);
  if ((v4 & 4) != 0)
  {
    self->_upcomingManeuverType = *((_DWORD *)v5 + 4);
    *(_BYTE *)&self->_flags |= 4u;
    v4 = *((_BYTE *)v5 + 24);
    if ((v4 & 1) == 0)
    {
LABEL_3:
      if ((v4 & 8) == 0)
        goto LABEL_4;
LABEL_9:
      self->_isGroupedManeuver = *((_BYTE *)v5 + 20);
      *(_BYTE *)&self->_flags |= 8u;
      if ((*((_BYTE *)v5 + 24) & 2) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*((_BYTE *)v5 + 24) & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_distanceToManeuver = *((_DWORD *)v5 + 2);
  *(_BYTE *)&self->_flags |= 1u;
  v4 = *((_BYTE *)v5 + 24);
  if ((v4 & 8) != 0)
    goto LABEL_9;
LABEL_4:
  if ((v4 & 2) != 0)
  {
LABEL_5:
    self->_speedBucket = *((_DWORD *)v5 + 3);
    *(_BYTE *)&self->_flags |= 2u;
  }
LABEL_6:

}

@end
