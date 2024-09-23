@implementation GEOCompanionGenericStep

- (GEOCompanionGenericStep)init
{
  GEOCompanionGenericStep *v2;
  GEOCompanionGenericStep *v3;
  GEOCompanionGenericStep *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOCompanionGenericStep;
  v2 = -[GEOCompanionGenericStep init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOCompanionGenericStep)initWithData:(id)a3
{
  GEOCompanionGenericStep *v3;
  GEOCompanionGenericStep *v4;
  GEOCompanionGenericStep *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOCompanionGenericStep;
  v3 = -[GEOCompanionGenericStep initWithData:](&v7, sel_initWithData_, a3);
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

  -[GEOCompanionGenericStep clearJunctionElements](self, "clearJunctionElements");
  v3.receiver = self;
  v3.super_class = (Class)GEOCompanionGenericStep;
  -[GEOCompanionGenericStep dealloc](&v3, sel_dealloc);
}

- (int)maneuverType
{
  os_unfair_lock_s *p_readerLock;
  char flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 2) != 0)
    return self->_maneuverType;
  else
    return 0;
}

- (void)setManeuverType:(int)a3
{
  *(_BYTE *)&self->_flags |= 0x42u;
  self->_maneuverType = a3;
}

- (void)setHasManeuverType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 66;
  else
    v3 = 64;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasManeuverType
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
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
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 80) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOCompanionGenericStepReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readManeuverNames_tags_238);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (NSMutableArray)maneuverNames
{
  -[GEOCompanionGenericStep _readManeuverNames]((uint64_t)self);
  return self->_maneuverNames;
}

- (void)setManeuverNames:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *maneuverNames;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x40u;
  maneuverNames = self->_maneuverNames;
  self->_maneuverNames = v4;

}

- (void)clearManeuverNames
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x40u;
  -[NSMutableArray removeAllObjects](self->_maneuverNames, "removeAllObjects");
}

- (void)addManeuverName:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOCompanionGenericStep _readManeuverNames]((uint64_t)self);
  -[GEOCompanionGenericStep _addNoFlagsManeuverName:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x40u;
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
    v4 = *(void **)(a1 + 40);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 40);
      *(_QWORD *)(a1 + 40) = v5;

      v4 = *(void **)(a1 + 40);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)maneuverNamesCount
{
  -[GEOCompanionGenericStep _readManeuverNames]((uint64_t)self);
  return -[NSMutableArray count](self->_maneuverNames, "count");
}

- (id)maneuverNameAtIndex:(unint64_t)a3
{
  -[GEOCompanionGenericStep _readManeuverNames]((uint64_t)self);
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
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 80) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOCompanionGenericStepReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSignposts_tags_239);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (NSMutableArray)signposts
{
  -[GEOCompanionGenericStep _readSignposts]((uint64_t)self);
  return self->_signposts;
}

- (void)setSignposts:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *signposts;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x40u;
  signposts = self->_signposts;
  self->_signposts = v4;

}

- (void)clearSignposts
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x40u;
  -[NSMutableArray removeAllObjects](self->_signposts, "removeAllObjects");
}

- (void)addSignpost:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOCompanionGenericStep _readSignposts]((uint64_t)self);
  -[GEOCompanionGenericStep _addNoFlagsSignpost:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x40u;
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

- (unint64_t)signpostsCount
{
  -[GEOCompanionGenericStep _readSignposts]((uint64_t)self);
  return -[NSMutableArray count](self->_signposts, "count");
}

- (id)signpostAtIndex:(unint64_t)a3
{
  -[GEOCompanionGenericStep _readSignposts]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_signposts, "objectAtIndex:", a3);
}

+ (Class)signpostType
{
  return (Class)objc_opt_class();
}

- (int)junctionType
{
  os_unfair_lock_s *p_readerLock;
  char flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 1) != 0)
    return self->_junctionType;
  else
    return 0;
}

- (void)setJunctionType:(int)a3
{
  *(_BYTE *)&self->_flags |= 0x41u;
  self->_junctionType = a3;
}

- (void)setHasJunctionType:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3 | 0x40;
}

- (BOOL)hasJunctionType
{
  return *(_BYTE *)&self->_flags & 1;
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
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 80) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOCompanionGenericStepReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readJunctionElements_tags_240);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (unint64_t)junctionElementsCount
{
  -[GEOCompanionGenericStep _readJunctionElements]((uint64_t)self);
  return self->_junctionElementsCount;
}

- (GEOJunctionElement)junctionElements
{
  -[GEOCompanionGenericStep _readJunctionElements]((uint64_t)self);
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
    result = (uint64_t)malloc_type_realloc(*(void **)(a1 + 16), 16 * v9, 0xC568D048uLL);
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
  *(_BYTE *)&self->_flags |= 8u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x40u;
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
  -[GEOCompanionGenericStep _readJunctionElements]((uint64_t)self);
  if (self && -[GEOCompanionGenericStep _reserveJunctionElements:]((uint64_t)self, 1uLL))
  {
    v6 = &self->_junctionElements[self->_junctionElementsCount];
    *(_QWORD *)&v6->var0 = v4;
    *(_QWORD *)&v6->var2 = v3;
    ++self->_junctionElementsCount;
  }
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x40u;
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

  -[GEOCompanionGenericStep _readJunctionElements]((uint64_t)self);
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
  *(_BYTE *)&self->_flags |= 8u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x40u;
  -[GEOCompanionGenericStep clearJunctionElements](self, "clearJunctionElements");
  if (-[GEOCompanionGenericStep _reserveJunctionElements:]((uint64_t)self, a4))
  {
    memcpy(self->_junctionElements, a3, 16 * a4);
    self->_junctionElementsCount = a4;
  }
}

- (int)transportType
{
  os_unfair_lock_s *p_readerLock;
  char flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 4) != 0)
    return self->_transportType;
  else
    return 0;
}

- (void)setTransportType:(int)a3
{
  *(_BYTE *)&self->_flags |= 0x44u;
  self->_transportType = a3;
}

- (void)setHasTransportType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 68;
  else
    v3 = 64;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasTransportType
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (id)transportTypeAsString:(int)a3
{
  if (a3 < 7)
    return off_1E1C070D8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsTransportType:(id)a3
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

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)GEOCompanionGenericStep;
  -[GEOCompanionGenericStep description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOCompanionGenericStep dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOCompanionGenericStep _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  __CFString *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  void *v21;
  int v22;
  __CFString *v23;
  void *v24;
  uint64_t v25;
  unint64_t v26;
  void *v27;
  uint64_t v28;
  __CFString *v29;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)(a1 + 80) & 2) != 0)
  {
    v5 = CFSTR("NO_TURN");
    switch(*(_DWORD *)(a1 + 72))
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
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 72));
        v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
        break;
    }
    objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("maneuverType"));

  }
  if (objc_msgSend(*(id *)(a1 + 40), "count"))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v7 = *(id *)(a1 + 40);
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v36;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v36 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v12, "jsonRepresentation");
          else
            objc_msgSend(v12, "dictionaryRepresentation");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v13);

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
      }
      while (v9);
    }

    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("maneuverName"));
  }
  if (objc_msgSend(*(id *)(a1 + 48), "count"))
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v15 = *(id *)(a1 + 48);
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v32;
      do
      {
        for (j = 0; j != v17; ++j)
        {
          if (*(_QWORD *)v32 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * j);
          if ((a2 & 1) != 0)
            objc_msgSend(v20, "jsonRepresentation");
          else
            objc_msgSend(v20, "dictionaryRepresentation");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "addObject:", v21);

        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
      }
      while (v17);
    }

    objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("signpost"));
  }
  if ((*(_BYTE *)(a1 + 80) & 1) != 0)
  {
    v22 = *(_DWORD *)(a1 + 68);
    if (v22)
    {
      if (v22 == 1)
      {
        v23 = CFSTR("JCTTYPE_ROUNDABOUT");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 68));
        v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v23 = CFSTR("JCTTYPE_NORMAL");
    }
    objc_msgSend(v4, "setObject:forKey:", v23, CFSTR("junctionType"));

  }
  if (*(_QWORD *)(a1 + 24))
  {
    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", *(_QWORD *)(a1 + 24));
    if (*(_QWORD *)(a1 + 24))
    {
      v25 = 0;
      v26 = 0;
      do
      {
        _GEOJunctionElementDictionaryRepresentation((unsigned int *)(*(_QWORD *)(a1 + 16) + v25));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "addObject:", v27);

        ++v26;
        v25 += 16;
      }
      while (v26 < *(_QWORD *)(a1 + 24));
    }
    objc_msgSend(v4, "setObject:forKey:", v24, CFSTR("junctionElement"));

  }
  if ((*(_BYTE *)(a1 + 80) & 4) != 0)
  {
    v28 = *(int *)(a1 + 76);
    if (v28 >= 7)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 76));
      v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v29 = off_1E1C070D8[v28];
    }
    objc_msgSend(v4, "setObject:forKey:", v29, CFSTR("transportType"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOCompanionGenericStep _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOCompanionGenericStep)initWithDictionary:(id)a3
{
  return (GEOCompanionGenericStep *)-[GEOCompanionGenericStep _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(char)a3 isJSON:
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  GEONameInfoList *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  uint64_t v25;
  GEONameInfo *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t k;
  void *v38;
  void *v39;
  id v40;
  uint64_t v41;
  uint64_t v43;
  uint64_t v44;
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
  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
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

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("maneuverName"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v55 = 0u;
        v56 = 0u;
        v53 = 0u;
        v54 = 0u;
        v10 = v9;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v53, v59, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v54;
          do
          {
            for (i = 0; i != v12; ++i)
            {
              if (*(_QWORD *)v54 != v13)
                objc_enumerationMutation(v10);
              v15 = *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v16 = [GEONameInfoList alloc];
                if ((a3 & 1) != 0)
                  v17 = -[GEONameInfoList initWithJSON:](v16, "initWithJSON:", v15);
                else
                  v17 = -[GEONameInfoList initWithDictionary:](v16, "initWithDictionary:", v15);
                v18 = (void *)v17;
                objc_msgSend(a1, "addManeuverName:", v17);

              }
            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v53, v59, 16);
          }
          while (v12);
        }

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("signpost"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v51 = 0u;
        v52 = 0u;
        v49 = 0u;
        v50 = 0u;
        v20 = v19;
        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
        if (v21)
        {
          v22 = v21;
          v23 = *(_QWORD *)v50;
          do
          {
            for (j = 0; j != v22; ++j)
            {
              if (*(_QWORD *)v50 != v23)
                objc_enumerationMutation(v20);
              v25 = *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * j);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v26 = [GEONameInfo alloc];
                if ((a3 & 1) != 0)
                  v27 = -[GEONameInfo initWithJSON:](v26, "initWithJSON:", v25);
                else
                  v27 = -[GEONameInfo initWithDictionary:](v26, "initWithDictionary:", v25);
                v28 = (void *)v27;
                objc_msgSend(a1, "addSignpost:", v27);

              }
            }
            v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
          }
          while (v22);
        }

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("junctionType"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v30 = v29;
        if ((objc_msgSend(v30, "isEqualToString:", CFSTR("JCTTYPE_NORMAL")) & 1) != 0)
          v31 = 0;
        else
          v31 = objc_msgSend(v30, "isEqualToString:", CFSTR("JCTTYPE_ROUNDABOUT"));

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_171;
        v31 = objc_msgSend(v29, "intValue");
      }
      objc_msgSend(a1, "setJunctionType:", v31);
LABEL_171:

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("junctionElement"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v47 = 0u;
        v48 = 0u;
        v45 = 0u;
        v46 = 0u;
        v33 = v32;
        v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v45, v57, 16);
        if (v34)
        {
          v35 = v34;
          v36 = *(_QWORD *)v46;
          do
          {
            for (k = 0; k != v35; ++k)
            {
              if (*(_QWORD *)v46 != v36)
                objc_enumerationMutation(v33);
              v38 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * k);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v43 = 0;
                v44 = 0;
                _GEOJunctionElementFromDictionaryRepresentation(v38, (uint64_t)&v43);
                objc_msgSend(a1, "addJunctionElement:", v43, v44);
              }
            }
            v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v45, v57, 16);
          }
          while (v35);
        }

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("transportType"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v40 = v39;
        if ((objc_msgSend(v40, "isEqualToString:", CFSTR("AUTOMOBILE")) & 1) != 0)
        {
          v41 = 0;
        }
        else if ((objc_msgSend(v40, "isEqualToString:", CFSTR("TRANSIT")) & 1) != 0)
        {
          v41 = 1;
        }
        else if ((objc_msgSend(v40, "isEqualToString:", CFSTR("WALKING")) & 1) != 0)
        {
          v41 = 2;
        }
        else if ((objc_msgSend(v40, "isEqualToString:", CFSTR("BICYCLE")) & 1) != 0)
        {
          v41 = 3;
        }
        else if ((objc_msgSend(v40, "isEqualToString:", CFSTR("UNKNOWN_TRANSPORT_TYPE")) & 1) != 0)
        {
          v41 = 4;
        }
        else if ((objc_msgSend(v40, "isEqualToString:", CFSTR("FERRY")) & 1) != 0)
        {
          v41 = 5;
        }
        else if (objc_msgSend(v40, "isEqualToString:", CFSTR("RIDESHARE")))
        {
          v41 = 6;
        }
        else
        {
          v41 = 0;
        }

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_202:

          goto LABEL_203;
        }
        v41 = objc_msgSend(v39, "intValue");
      }
      objc_msgSend(a1, "setTransportType:", v41);
      goto LABEL_202;
    }
  }
LABEL_203:

  return a1;
}

- (GEOCompanionGenericStep)initWithJSON:(id)a3
{
  return (GEOCompanionGenericStep *)-[GEOCompanionGenericStep _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_243;
    else
      v8 = (int *)&readAll__nonRecursiveTag_244;
    GEOCompanionGenericStepReadSpecified((uint64_t)self, (uint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEOCompanionGenericStepCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOCompanionGenericStepIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOCompanionGenericStepReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  uint64_t v14;
  unint64_t v15;
  PBDataReader *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_BYTE *)&self->_flags & 0x78) == 0))
  {
    v16 = self->_reader;
    objc_sync_enter(v16);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v17);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v16);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOCompanionGenericStep readAll:](self, "readAll:", 0);
    if ((*(_BYTE *)&self->_flags & 2) != 0)
      PBDataWriterWriteInt32Field();
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v6 = self->_maneuverNames;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v23 != v8)
            objc_enumerationMutation(v6);
          PBDataWriterWriteSubmessage();
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      }
      while (v7);
    }

    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v10 = self->_signposts;
    v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v19;
      do
      {
        for (j = 0; j != v11; ++j)
        {
          if (*(_QWORD *)v19 != v12)
            objc_enumerationMutation(v10);
          PBDataWriterWriteSubmessage();
        }
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
      }
      while (v11);
    }

    if ((*(_BYTE *)&self->_flags & 1) != 0)
      PBDataWriterWriteInt32Field();
    if (self->_junctionElementsCount)
    {
      v14 = 0;
      v15 = 0;
      do
      {
        PBDataWriterPlaceMark();
        GEOJunctionElementWriteTo((uint64_t)&self->_junctionElements[v14]);
        PBDataWriterRecallMark();
        ++v15;
        ++v14;
      }
      while (v15 < self->_junctionElementsCount);
    }
    if ((*(_BYTE *)&self->_flags & 4) != 0)
      PBDataWriterWriteInt32Field();
  }

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t j;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t k;
  uint64_t v15;
  uint64_t v16;
  id *v17;

  v17 = (id *)a3;
  -[GEOCompanionGenericStep readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v17 + 1, self->_reader);
  *((_DWORD *)v17 + 14) = self->_readerMarkPos;
  *((_DWORD *)v17 + 15) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    *((_DWORD *)v17 + 18) = self->_maneuverType;
    *((_BYTE *)v17 + 80) |= 2u;
  }
  if (-[GEOCompanionGenericStep maneuverNamesCount](self, "maneuverNamesCount"))
  {
    objc_msgSend(v17, "clearManeuverNames");
    v4 = -[GEOCompanionGenericStep maneuverNamesCount](self, "maneuverNamesCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[GEOCompanionGenericStep maneuverNameAtIndex:](self, "maneuverNameAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "addManeuverName:", v7);

      }
    }
  }
  if (-[GEOCompanionGenericStep signpostsCount](self, "signpostsCount"))
  {
    objc_msgSend(v17, "clearSignposts");
    v8 = -[GEOCompanionGenericStep signpostsCount](self, "signpostsCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
      {
        -[GEOCompanionGenericStep signpostAtIndex:](self, "signpostAtIndex:", j);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "addSignpost:", v11);

      }
    }
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *((_DWORD *)v17 + 17) = self->_junctionType;
    *((_BYTE *)v17 + 80) |= 1u;
  }
  if (-[GEOCompanionGenericStep junctionElementsCount](self, "junctionElementsCount"))
  {
    objc_msgSend(v17, "clearJunctionElements");
    v12 = -[GEOCompanionGenericStep junctionElementsCount](self, "junctionElementsCount");
    if (v12)
    {
      v13 = v12;
      for (k = 0; k != v13; ++k)
      {
        v15 = -[GEOCompanionGenericStep junctionElementAtIndex:](self, "junctionElementAtIndex:", k);
        objc_msgSend(v17, "addJunctionElement:", v15, v16);
      }
    }
  }
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    *((_DWORD *)v17 + 19) = self->_transportType;
    *((_BYTE *)v17 + 80) |= 4u;
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
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  unint64_t junctionElementsCount;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_BYTE *)&self->_flags & 0x40) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOCompanionGenericStepReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOCompanionGenericStep readAll:](self, "readAll:", 0);
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 72) = self->_maneuverType;
    *(_BYTE *)(v5 + 80) |= 2u;
  }
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v9 = self->_maneuverNames;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v26 != v11)
          objc_enumerationMutation(v9);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addManeuverName:", v13);

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v10);
  }

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v14 = self->_signposts;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v22;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v22 != v16)
          objc_enumerationMutation(v14);
        v18 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * j), "copyWithZone:", a3, (_QWORD)v21);
        objc_msgSend((id)v5, "addSignpost:", v18);

      }
      v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v15);
  }

  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 68) = self->_junctionType;
    *(_BYTE *)(v5 + 80) |= 1u;
  }
  junctionElementsCount = self->_junctionElementsCount;
  if (junctionElementsCount)
  {
    -[GEOCompanionGenericStep _reserveJunctionElements:](v5, junctionElementsCount);
    memcpy(*(void **)(v5 + 16), self->_junctionElements, 16 * self->_junctionElementsCount);
    *(_QWORD *)(v5 + 24) = self->_junctionElementsCount;
  }
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    *(_DWORD *)(v5 + 76) = self->_transportType;
    *(_BYTE *)(v5 + 80) |= 4u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  const void **v4;
  NSMutableArray *maneuverNames;
  NSMutableArray *signposts;
  char flags;
  char v8;
  unint64_t junctionElementsCount;
  BOOL v10;

  v4 = (const void **)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_18;
  -[GEOCompanionGenericStep readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if (((_BYTE)v4[10] & 2) == 0 || self->_maneuverType != *((_DWORD *)v4 + 18))
      goto LABEL_18;
  }
  else if (((_BYTE)v4[10] & 2) != 0)
  {
    goto LABEL_18;
  }
  maneuverNames = self->_maneuverNames;
  if ((unint64_t)maneuverNames | (unint64_t)v4[5]
    && !-[NSMutableArray isEqual:](maneuverNames, "isEqual:"))
  {
    goto LABEL_18;
  }
  signposts = self->_signposts;
  if ((unint64_t)signposts | (unint64_t)v4[6])
  {
    if (!-[NSMutableArray isEqual:](signposts, "isEqual:"))
      goto LABEL_18;
  }
  flags = (char)self->_flags;
  v8 = *((_BYTE *)v4 + 80);
  if ((flags & 1) != 0)
  {
    if (((_BYTE)v4[10] & 1) == 0 || self->_junctionType != *((_DWORD *)v4 + 17))
      goto LABEL_18;
  }
  else if (((_BYTE)v4[10] & 1) != 0)
  {
    goto LABEL_18;
  }
  junctionElementsCount = self->_junctionElementsCount;
  if ((const void *)junctionElementsCount == v4[3]
    && !memcmp(self->_junctionElements, v4[2], 16 * junctionElementsCount))
  {
    v10 = (v8 & 4) == 0;
    if ((flags & 4) == 0)
      goto LABEL_19;
    if ((v8 & 4) != 0 && self->_transportType == *((_DWORD *)v4 + 19))
    {
      v10 = 1;
      goto LABEL_19;
    }
  }
LABEL_18:
  v10 = 0;
LABEL_19:

  return v10;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  -[GEOCompanionGenericStep readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 2) != 0)
    v3 = 2654435761 * self->_maneuverType;
  else
    v3 = 0;
  v4 = -[NSMutableArray hash](self->_maneuverNames, "hash");
  v5 = -[NSMutableArray hash](self->_signposts, "hash");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v6 = 2654435761 * self->_junctionType;
  else
    v6 = 0;
  v7 = PBHashBytes();
  if ((*(_BYTE *)&self->_flags & 4) != 0)
    v8 = 2654435761 * self->_transportType;
  else
    v8 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  uint64_t v15;
  uint64_t v16;
  uint64_t k;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  if ((*((_BYTE *)v4 + 80) & 2) != 0)
  {
    self->_maneuverType = *((_DWORD *)v4 + 18);
    *(_BYTE *)&self->_flags |= 2u;
  }
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v5 = *((id *)v4 + 5);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v25 != v8)
          objc_enumerationMutation(v5);
        -[GEOCompanionGenericStep addManeuverName:](self, "addManeuverName:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v7);
  }

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v10 = *((id *)v4 + 6);
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v21;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v21 != v13)
          objc_enumerationMutation(v10);
        -[GEOCompanionGenericStep addSignpost:](self, "addSignpost:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * j), (_QWORD)v20);
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    }
    while (v12);
  }

  if ((*((_BYTE *)v4 + 80) & 1) != 0)
  {
    self->_junctionType = *((_DWORD *)v4 + 17);
    *(_BYTE *)&self->_flags |= 1u;
  }
  v15 = objc_msgSend(v4, "junctionElementsCount", (_QWORD)v20);
  if (v15)
  {
    v16 = v15;
    for (k = 0; k != v16; ++k)
    {
      v18 = objc_msgSend(v4, "junctionElementAtIndex:", k);
      -[GEOCompanionGenericStep addJunctionElement:](self, "addJunctionElement:", v18, v19);
    }
  }
  if ((*((_BYTE *)v4 + 80) & 4) != 0)
  {
    self->_transportType = *((_DWORD *)v4 + 19);
    *(_BYTE *)&self->_flags |= 4u;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signposts, 0);
  objc_storeStrong((id *)&self->_maneuverNames, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

+ (id)genericStepForCyclingStep:(id)a3 protocolVersion:(unint64_t)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;

  v5 = a3;
  v6 = objc_alloc_init((Class)a1);
  objc_msgSend(v6, "setTransportType:", 3);
  if (objc_msgSend(v5, "hasManeuverType"))
    objc_msgSend(v6, "setManeuverType:", objc_msgSend(v5, "maneuverType"));
  objc_msgSend(v5, "maneuverNames");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setManeuverNames:", v7);

  objc_msgSend(v5, "signposts");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSignposts:", v8);

  if (objc_msgSend(v5, "hasJunctionType"))
    objc_msgSend(v6, "setJunctionType:", objc_msgSend(v5, "junctionType"));
  objc_msgSend(v6, "setJunctionElements:count:", objc_msgSend(v5, "junctionElements"), objc_msgSend(v5, "junctionElementsCount"));

  return v6;
}

- (GEOTransitArtworkDataSource)maneuverArtworkOverride
{
  return 0;
}

@end
