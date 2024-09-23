@implementation GEOSignGuidance

- (GEOSignGuidance)init
{
  GEOSignGuidance *v2;
  GEOSignGuidance *v3;
  GEOSignGuidance *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOSignGuidance;
  v2 = -[GEOSignGuidance init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOSignGuidance)initWithData:(id)a3
{
  GEOSignGuidance *v3;
  GEOSignGuidance *v4;
  GEOSignGuidance *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOSignGuidance;
  v3 = -[GEOSignGuidance initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readSignTitles
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 92) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOSignGuidanceReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSignTitles_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (NSMutableArray)signTitles
{
  -[GEOSignGuidance _readSignTitles]((uint64_t)self);
  return self->_signTitles;
}

- (void)setSignTitles:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *signTitles;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x100u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x200u;
  signTitles = self->_signTitles;
  self->_signTitles = v4;

}

- (void)clearSignTitles
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x100u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x200u;
  -[NSMutableArray removeAllObjects](self->_signTitles, "removeAllObjects");
}

- (void)addSignTitle:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOSignGuidance _readSignTitles]((uint64_t)self);
  -[GEOSignGuidance _addNoFlagsSignTitle:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x100u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x200u;
}

- (void)_addNoFlagsSignTitle:(uint64_t)a1
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

- (unint64_t)signTitlesCount
{
  -[GEOSignGuidance _readSignTitles]((uint64_t)self);
  return -[NSMutableArray count](self->_signTitles, "count");
}

- (id)signTitleAtIndex:(unint64_t)a3
{
  -[GEOSignGuidance _readSignTitles]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_signTitles, "objectAtIndex:", a3);
}

+ (Class)signTitleType
{
  return (Class)objc_opt_class();
}

- (void)_readSignDetails
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 92) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOSignGuidanceReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSignDetails_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (NSMutableArray)signDetails
{
  -[GEOSignGuidance _readSignDetails]((uint64_t)self);
  return self->_signDetails;
}

- (void)setSignDetails:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *signDetails;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x200u;
  signDetails = self->_signDetails;
  self->_signDetails = v4;

}

- (void)clearSignDetails
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x200u;
  -[NSMutableArray removeAllObjects](self->_signDetails, "removeAllObjects");
}

- (void)addSignDetail:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOSignGuidance _readSignDetails]((uint64_t)self);
  -[GEOSignGuidance _addNoFlagsSignDetail:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x200u;
}

- (void)_addNoFlagsSignDetail:(uint64_t)a1
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

- (unint64_t)signDetailsCount
{
  -[GEOSignGuidance _readSignDetails]((uint64_t)self);
  return -[NSMutableArray count](self->_signDetails, "count");
}

- (id)signDetailAtIndex:(unint64_t)a3
{
  -[GEOSignGuidance _readSignDetails]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_signDetails, "objectAtIndex:", a3);
}

+ (Class)signDetailType
{
  return (Class)objc_opt_class();
}

- (void)_readSecondarySigns
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 92) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOSignGuidanceReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSecondarySigns_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (NSMutableArray)secondarySigns
{
  -[GEOSignGuidance _readSecondarySigns]((uint64_t)self);
  return self->_secondarySigns;
}

- (void)setSecondarySigns:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *secondarySigns;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x200u;
  secondarySigns = self->_secondarySigns;
  self->_secondarySigns = v4;

}

- (void)clearSecondarySigns
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x200u;
  -[NSMutableArray removeAllObjects](self->_secondarySigns, "removeAllObjects");
}

- (void)addSecondarySign:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOSignGuidance _readSecondarySigns]((uint64_t)self);
  -[GEOSignGuidance _addNoFlagsSecondarySign:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x200u;
}

- (void)_addNoFlagsSecondarySign:(uint64_t)a1
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

- (unint64_t)secondarySignsCount
{
  -[GEOSignGuidance _readSecondarySigns]((uint64_t)self);
  return -[NSMutableArray count](self->_secondarySigns, "count");
}

- (id)secondarySignAtIndex:(unint64_t)a3
{
  -[GEOSignGuidance _readSecondarySigns]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_secondarySigns, "objectAtIndex:", a3);
}

+ (Class)secondarySignType
{
  return (Class)objc_opt_class();
}

- (int)maneuverArrowOverride
{
  os_unfair_lock_s *p_readerLock;
  __int16 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 1) != 0)
    return self->_maneuverArrowOverride;
  else
    return 0;
}

- (void)setManeuverArrowOverride:(int)a3
{
  *(_WORD *)&self->_flags |= 0x201u;
  self->_maneuverArrowOverride = a3;
}

- (void)setHasManeuverArrowOverride:(BOOL)a3
{
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFE | a3 | 0x200;
}

- (BOOL)hasManeuverArrowOverride
{
  return *(_WORD *)&self->_flags & 1;
}

- (id)maneuverArrowOverrideAsString:(int)a3
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

- (int)StringAsManeuverArrowOverride:(id)a3
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

- (void)_readShieldName
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 92) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOSignGuidanceReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readShieldName_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasShieldName
{
  -[GEOSignGuidance _readShieldName]((uint64_t)self);
  return self->_shieldName != 0;
}

- (GEONameInfo)shieldName
{
  -[GEOSignGuidance _readShieldName]((uint64_t)self);
  return self->_shieldName;
}

- (void)setShieldName:(id)a3
{
  *(_WORD *)&self->_flags |= 0x240u;
  objc_storeStrong((id *)&self->_shieldName, a3);
}

- (unsigned)stackRanking
{
  return self->_stackRanking;
}

- (void)setStackRanking:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x202u;
  self->_stackRanking = a3;
}

- (void)setHasStackRanking:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 514;
  else
    v3 = 512;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasStackRanking
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
}

- (void)_readJunctionInfo
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 92) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOSignGuidanceReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readJunctionInfo_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasJunctionInfo
{
  -[GEOSignGuidance _readJunctionInfo]((uint64_t)self);
  return self->_junctionInfo != 0;
}

- (GEOJunctionInfo)junctionInfo
{
  -[GEOSignGuidance _readJunctionInfo]((uint64_t)self);
  return self->_junctionInfo;
}

- (void)setJunctionInfo:(id)a3
{
  *(_WORD *)&self->_flags |= 0x210u;
  objc_storeStrong((id *)&self->_junctionInfo, a3);
}

- (void)_readArtworkOverride
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 92) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOSignGuidanceReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readArtworkOverride_tags_5572);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasArtworkOverride
{
  -[GEOSignGuidance _readArtworkOverride]((uint64_t)self);
  return self->_artworkOverride != 0;
}

- (GEOPBTransitArtwork)artworkOverride
{
  -[GEOSignGuidance _readArtworkOverride]((uint64_t)self);
  return self->_artworkOverride;
}

- (void)setArtworkOverride:(id)a3
{
  *(_WORD *)&self->_flags |= 0x208u;
  objc_storeStrong((id *)&self->_artworkOverride, a3);
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
  v8.super_class = (Class)GEOSignGuidance;
  -[GEOSignGuidance description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOSignGuidance dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOSignGuidance _dictionaryRepresentation:]((uint64_t)self, 0);
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
  void *v12;
  const __CFString *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t k;
  void *v29;
  void *v30;
  const __CFString *v31;
  __CFString *v32;
  const __CFString *v33;
  void *v34;
  void *v35;
  void *v36;
  const __CFString *v37;
  void *v38;
  const __CFString *v39;
  void *v40;
  void *v41;
  void *v42;
  const __CFString *v43;
  void *v44;
  void *v45;
  void *v46;
  const __CFString *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  id v53;
  _QWORD v55[4];
  id v56;
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
  _BYTE v69[128];
  _BYTE v70[128];
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 64), "count"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 64), "count"));
    v65 = 0u;
    v66 = 0u;
    v67 = 0u;
    v68 = 0u;
    v6 = *(id *)(a1 + 64);
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v65, v71, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v66;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v66 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v11, "jsonRepresentation");
          else
            objc_msgSend(v11, "dictionaryRepresentation");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v12);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v65, v71, 16);
      }
      while (v8);
    }

    if (a2)
      v13 = CFSTR("signTitle");
    else
      v13 = CFSTR("sign_title");
    objc_msgSend(v4, "setObject:forKey:", v5, v13);

  }
  if (objc_msgSend(*(id *)(a1 + 56), "count"))
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 56), "count"));
    v61 = 0u;
    v62 = 0u;
    v63 = 0u;
    v64 = 0u;
    v15 = *(id *)(a1 + 56);
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v61, v70, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v62;
      do
      {
        for (j = 0; j != v17; ++j)
        {
          if (*(_QWORD *)v62 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * j);
          if ((a2 & 1) != 0)
            objc_msgSend(v20, "jsonRepresentation");
          else
            objc_msgSend(v20, "dictionaryRepresentation");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "addObject:", v21);

        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v61, v70, 16);
      }
      while (v17);
    }

    if (a2)
      v22 = CFSTR("signDetail");
    else
      v22 = CFSTR("sign_detail");
    objc_msgSend(v4, "setObject:forKey:", v14, v22);

  }
  if (objc_msgSend(*(id *)(a1 + 40), "count"))
  {
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
    v57 = 0u;
    v58 = 0u;
    v59 = 0u;
    v60 = 0u;
    v24 = *(id *)(a1 + 40);
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v57, v69, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v58;
      do
      {
        for (k = 0; k != v26; ++k)
        {
          if (*(_QWORD *)v58 != v27)
            objc_enumerationMutation(v24);
          v29 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * k);
          if ((a2 & 1) != 0)
            objc_msgSend(v29, "jsonRepresentation");
          else
            objc_msgSend(v29, "dictionaryRepresentation");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "addObject:", v30);

        }
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v57, v69, 16);
      }
      while (v26);
    }

    if (a2)
      v31 = CFSTR("secondarySign");
    else
      v31 = CFSTR("secondary_sign");
    objc_msgSend(v4, "setObject:forKey:", v23, v31);

  }
  if ((*(_WORD *)(a1 + 92) & 1) != 0)
  {
    v32 = CFSTR("NO_TURN");
    switch(*(_DWORD *)(a1 + 84))
    {
      case 0:
        break;
      case 1:
        v32 = CFSTR("LEFT_TURN");
        break;
      case 2:
        v32 = CFSTR("RIGHT_TURN");
        break;
      case 3:
        v32 = CFSTR("STRAIGHT_AHEAD");
        break;
      case 4:
        v32 = CFSTR("U_TURN");
        break;
      case 5:
        v32 = CFSTR("FOLLOW_ROAD");
        break;
      case 6:
        v32 = CFSTR("ENTER_ROUNDABOUT");
        break;
      case 7:
        v32 = CFSTR("EXIT_ROUNDABOUT");
        break;
      case 0xB:
        v32 = CFSTR("OFF_RAMP");
        break;
      case 0xC:
        v32 = CFSTR("ON_RAMP");
        break;
      case 0x10:
        v32 = CFSTR("ARRIVE_END_OF_NAVIGATION");
        break;
      case 0x11:
        v32 = CFSTR("START_ROUTE");
        break;
      case 0x12:
        v32 = CFSTR("ARRIVE_AT_DESTINATION");
        break;
      case 0x14:
        v32 = CFSTR("KEEP_LEFT");
        break;
      case 0x15:
        v32 = CFSTR("KEEP_RIGHT");
        break;
      case 0x16:
        v32 = CFSTR("ENTER_FERRY");
        break;
      case 0x17:
        v32 = CFSTR("EXIT_FERRY");
        break;
      case 0x18:
        v32 = CFSTR("CHANGE_FERRY");
        break;
      case 0x19:
        v32 = CFSTR("START_ROUTE_WITH_U_TURN");
        break;
      case 0x1A:
        v32 = CFSTR("U_TURN_AT_ROUNDABOUT");
        break;
      case 0x1B:
        v32 = CFSTR("LEFT_TURN_AT_END");
        break;
      case 0x1C:
        v32 = CFSTR("RIGHT_TURN_AT_END");
        break;
      case 0x1D:
        v32 = CFSTR("HIGHWAY_OFF_RAMP_LEFT");
        break;
      case 0x1E:
        v32 = CFSTR("HIGHWAY_OFF_RAMP_RIGHT");
        break;
      case 0x21:
        v32 = CFSTR("ARRIVE_AT_DESTINATION_LEFT");
        break;
      case 0x22:
        v32 = CFSTR("ARRIVE_AT_DESTINATION_RIGHT");
        break;
      case 0x23:
        v32 = CFSTR("U_TURN_WHEN_POSSIBLE");
        break;
      case 0x27:
        v32 = CFSTR("ARRIVE_END_OF_DIRECTIONS");
        break;
      case 0x29:
        v32 = CFSTR("ROUNDABOUT_EXIT_1");
        break;
      case 0x2A:
        v32 = CFSTR("ROUNDABOUT_EXIT_2");
        break;
      case 0x2B:
        v32 = CFSTR("ROUNDABOUT_EXIT_3");
        break;
      case 0x2C:
        v32 = CFSTR("ROUNDABOUT_EXIT_4");
        break;
      case 0x2D:
        v32 = CFSTR("ROUNDABOUT_EXIT_5");
        break;
      case 0x2E:
        v32 = CFSTR("ROUNDABOUT_EXIT_6");
        break;
      case 0x2F:
        v32 = CFSTR("ROUNDABOUT_EXIT_7");
        break;
      case 0x30:
        v32 = CFSTR("ROUNDABOUT_EXIT_8");
        break;
      case 0x31:
        v32 = CFSTR("ROUNDABOUT_EXIT_9");
        break;
      case 0x32:
        v32 = CFSTR("ROUNDABOUT_EXIT_10");
        break;
      case 0x33:
        v32 = CFSTR("ROUNDABOUT_EXIT_11");
        break;
      case 0x34:
        v32 = CFSTR("ROUNDABOUT_EXIT_12");
        break;
      case 0x35:
        v32 = CFSTR("ROUNDABOUT_EXIT_13");
        break;
      case 0x36:
        v32 = CFSTR("ROUNDABOUT_EXIT_14");
        break;
      case 0x37:
        v32 = CFSTR("ROUNDABOUT_EXIT_15");
        break;
      case 0x38:
        v32 = CFSTR("ROUNDABOUT_EXIT_16");
        break;
      case 0x39:
        v32 = CFSTR("ROUNDABOUT_EXIT_17");
        break;
      case 0x3A:
        v32 = CFSTR("ROUNDABOUT_EXIT_18");
        break;
      case 0x3B:
        v32 = CFSTR("ROUNDABOUT_EXIT_19");
        break;
      case 0x3C:
        v32 = CFSTR("SHARP_LEFT_TURN");
        break;
      case 0x3D:
        v32 = CFSTR("SHARP_RIGHT_TURN");
        break;
      case 0x3E:
        v32 = CFSTR("SLIGHT_LEFT_TURN");
        break;
      case 0x3F:
        v32 = CFSTR("SLIGHT_RIGHT_TURN");
        break;
      case 0x40:
        v32 = CFSTR("CHANGE_HIGHWAY");
        break;
      case 0x41:
        v32 = CFSTR("CHANGE_HIGHWAY_LEFT");
        break;
      case 0x42:
        v32 = CFSTR("CHANGE_HIGHWAY_RIGHT");
        break;
      case 0x50:
        v32 = CFSTR("TOLL_STATION");
        break;
      case 0x51:
        v32 = CFSTR("ENTER_TUNNEL");
        break;
      case 0x52:
        v32 = CFSTR("WAYPOINT_STOP");
        break;
      case 0x53:
        v32 = CFSTR("WAYPOINT_STOP_LEFT");
        break;
      case 0x54:
        v32 = CFSTR("WAYPOINT_STOP_RIGHT");
        break;
      case 0x55:
        v32 = CFSTR("RESUME_ROUTE");
        break;
      case 0x56:
        v32 = CFSTR("RESUME_ROUTE_WITH_U_TURN");
        break;
      case 0x57:
        v32 = CFSTR("CUSTOM");
        break;
      case 0x58:
        v32 = CFSTR("TURN_AROUND");
        break;
      default:
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 84));
        v32 = (__CFString *)objc_claimAutoreleasedReturnValue();
        break;
    }
    if (a2)
      v33 = CFSTR("maneuverArrowOverride");
    else
      v33 = CFSTR("maneuver_arrow_override");
    objc_msgSend(v4, "setObject:forKey:", v32, v33);

  }
  objc_msgSend((id)a1, "shieldName");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v34;
  if (v34)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v34, "jsonRepresentation");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = CFSTR("shieldName");
    }
    else
    {
      objc_msgSend(v34, "dictionaryRepresentation");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = CFSTR("shield_name");
    }
    objc_msgSend(v4, "setObject:forKey:", v36, v37);

  }
  if ((*(_WORD *)(a1 + 92) & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 88));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v39 = CFSTR("stackRanking");
    else
      v39 = CFSTR("stack_ranking");
    objc_msgSend(v4, "setObject:forKey:", v38, v39);

  }
  objc_msgSend((id)a1, "junctionInfo");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v40;
  if (v40)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v40, "jsonRepresentation");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = CFSTR("junctionInfo");
    }
    else
    {
      objc_msgSend(v40, "dictionaryRepresentation");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = CFSTR("junction_info");
    }
    objc_msgSend(v4, "setObject:forKey:", v42, v43);

  }
  objc_msgSend((id)a1, "artworkOverride");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = v44;
  if (v44)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v44, "jsonRepresentation");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = CFSTR("artworkOverride");
    }
    else
    {
      objc_msgSend(v44, "dictionaryRepresentation");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = CFSTR("artwork_override");
    }
    objc_msgSend(v4, "setObject:forKey:", v46, v47);

  }
  v48 = *(void **)(a1 + 16);
  if (v48)
  {
    objc_msgSend(v48, "dictionaryRepresentation");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = v49;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v49, "count"));
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v55[0] = MEMORY[0x1E0C809B0];
      v55[1] = 3221225472;
      v55[2] = __45__GEOSignGuidance__dictionaryRepresentation___block_invoke;
      v55[3] = &unk_1E1C00600;
      v52 = v51;
      v56 = v52;
      objc_msgSend(v50, "enumerateKeysAndObjectsUsingBlock:", v55);
      v53 = v52;

      v50 = v53;
    }
    objc_msgSend(v4, "setObject:forKey:", v50, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOSignGuidance _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __45__GEOSignGuidance__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOSignGuidance)initWithDictionary:(id)a3
{
  return (GEOSignGuidance *)-[GEOSignGuidance _initWithDictionary:isJSON:](self, a3, 0);
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
  uint64_t i;
  uint64_t v13;
  GEOFormattedString *v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  uint64_t v24;
  GEOFormattedString *v25;
  uint64_t v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t k;
  uint64_t v35;
  GEOFormattedString *v36;
  uint64_t v37;
  void *v38;
  const __CFString *v39;
  void *v40;
  id v41;
  uint64_t v42;
  const __CFString *v43;
  void *v44;
  GEONameInfo *v45;
  uint64_t v46;
  void *v47;
  const __CFString *v48;
  void *v49;
  const __CFString *v50;
  void *v51;
  GEOJunctionInfo *v52;
  uint64_t v53;
  void *v54;
  const __CFString *v55;
  void *v56;
  GEOPBTransitArtwork *v57;
  uint64_t v58;
  void *v59;
  id v61;
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
  __int128 v73;
  _BYTE v74[128];
  _BYTE v75[128];
  _BYTE v76[128];
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (!a1)
    goto LABEL_220;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_220;
  if (a3)
    v6 = CFSTR("signTitle");
  else
    v6 = CFSTR("sign_title");
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v61 = v5;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v72 = 0u;
    v73 = 0u;
    v70 = 0u;
    v71 = 0u;
    v8 = v7;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v70, v76, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v71;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v71 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v70 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v14 = [GEOFormattedString alloc];
            if ((a3 & 1) != 0)
              v15 = -[GEOFormattedString initWithJSON:](v14, "initWithJSON:", v13);
            else
              v15 = -[GEOFormattedString initWithDictionary:](v14, "initWithDictionary:", v13);
            v16 = (void *)v15;
            objc_msgSend(a1, "addSignTitle:", v15);

          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v70, v76, 16);
      }
      while (v10);
    }

    v5 = v61;
  }

  if (a3)
    v17 = CFSTR("signDetail");
  else
    v17 = CFSTR("sign_detail");
  objc_msgSend(v5, "objectForKeyedSubscript:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v68 = 0u;
    v69 = 0u;
    v66 = 0u;
    v67 = 0u;
    v19 = v18;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v66, v75, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v67;
      do
      {
        for (j = 0; j != v21; ++j)
        {
          if (*(_QWORD *)v67 != v22)
            objc_enumerationMutation(v19);
          v24 = *(_QWORD *)(*((_QWORD *)&v66 + 1) + 8 * j);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v25 = [GEOFormattedString alloc];
            if ((a3 & 1) != 0)
              v26 = -[GEOFormattedString initWithJSON:](v25, "initWithJSON:", v24);
            else
              v26 = -[GEOFormattedString initWithDictionary:](v25, "initWithDictionary:", v24);
            v27 = (void *)v26;
            objc_msgSend(a1, "addSignDetail:", v26);

          }
        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v66, v75, 16);
      }
      while (v21);
    }

    v5 = v61;
  }

  if (a3)
    v28 = CFSTR("secondarySign");
  else
    v28 = CFSTR("secondary_sign");
  objc_msgSend(v5, "objectForKeyedSubscript:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v64 = 0u;
    v65 = 0u;
    v62 = 0u;
    v63 = 0u;
    v30 = v29;
    v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v62, v74, 16);
    if (v31)
    {
      v32 = v31;
      v33 = *(_QWORD *)v63;
      do
      {
        for (k = 0; k != v32; ++k)
        {
          if (*(_QWORD *)v63 != v33)
            objc_enumerationMutation(v30);
          v35 = *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * k);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v36 = [GEOFormattedString alloc];
            if ((a3 & 1) != 0)
              v37 = -[GEOFormattedString initWithJSON:](v36, "initWithJSON:", v35);
            else
              v37 = -[GEOFormattedString initWithDictionary:](v36, "initWithDictionary:", v35);
            v38 = (void *)v37;
            objc_msgSend(a1, "addSecondarySign:", v37);

          }
        }
        v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v62, v74, 16);
      }
      while (v32);
    }

    v5 = v61;
  }

  if (a3)
    v39 = CFSTR("maneuverArrowOverride");
  else
    v39 = CFSTR("maneuver_arrow_override");
  objc_msgSend(v5, "objectForKeyedSubscript:", v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v41 = v40;
    if ((objc_msgSend(v41, "isEqualToString:", CFSTR("NO_TURN")) & 1) != 0)
    {
      v42 = 0;
    }
    else if ((objc_msgSend(v41, "isEqualToString:", CFSTR("LEFT_TURN")) & 1) != 0)
    {
      v42 = 1;
    }
    else if ((objc_msgSend(v41, "isEqualToString:", CFSTR("RIGHT_TURN")) & 1) != 0)
    {
      v42 = 2;
    }
    else if ((objc_msgSend(v41, "isEqualToString:", CFSTR("STRAIGHT_AHEAD")) & 1) != 0)
    {
      v42 = 3;
    }
    else if ((objc_msgSend(v41, "isEqualToString:", CFSTR("U_TURN")) & 1) != 0)
    {
      v42 = 4;
    }
    else if ((objc_msgSend(v41, "isEqualToString:", CFSTR("FOLLOW_ROAD")) & 1) != 0)
    {
      v42 = 5;
    }
    else if ((objc_msgSend(v41, "isEqualToString:", CFSTR("ENTER_ROUNDABOUT")) & 1) != 0)
    {
      v42 = 6;
    }
    else if ((objc_msgSend(v41, "isEqualToString:", CFSTR("EXIT_ROUNDABOUT")) & 1) != 0)
    {
      v42 = 7;
    }
    else if ((objc_msgSend(v41, "isEqualToString:", CFSTR("OFF_RAMP")) & 1) != 0)
    {
      v42 = 11;
    }
    else if ((objc_msgSend(v41, "isEqualToString:", CFSTR("ON_RAMP")) & 1) != 0)
    {
      v42 = 12;
    }
    else if ((objc_msgSend(v41, "isEqualToString:", CFSTR("ARRIVE_END_OF_NAVIGATION")) & 1) != 0)
    {
      v42 = 16;
    }
    else if ((objc_msgSend(v41, "isEqualToString:", CFSTR("START_ROUTE")) & 1) != 0)
    {
      v42 = 17;
    }
    else
    {
      if ((objc_msgSend(v41, "isEqualToString:", CFSTR("ARRIVE_AT_DESTINATION")) & 1) != 0)
      {
        v42 = 18;
      }
      else if ((objc_msgSend(v41, "isEqualToString:", CFSTR("KEEP_LEFT")) & 1) != 0)
      {
        v42 = 20;
      }
      else if ((objc_msgSend(v41, "isEqualToString:", CFSTR("KEEP_RIGHT")) & 1) != 0)
      {
        v42 = 21;
      }
      else if ((objc_msgSend(v41, "isEqualToString:", CFSTR("ENTER_FERRY")) & 1) != 0)
      {
        v42 = 22;
      }
      else if ((objc_msgSend(v41, "isEqualToString:", CFSTR("EXIT_FERRY")) & 1) != 0)
      {
        v42 = 23;
      }
      else if ((objc_msgSend(v41, "isEqualToString:", CFSTR("CHANGE_FERRY")) & 1) != 0)
      {
        v42 = 24;
      }
      else if ((objc_msgSend(v41, "isEqualToString:", CFSTR("START_ROUTE_WITH_U_TURN")) & 1) != 0)
      {
        v42 = 25;
      }
      else if ((objc_msgSend(v41, "isEqualToString:", CFSTR("U_TURN_AT_ROUNDABOUT")) & 1) != 0)
      {
        v42 = 26;
      }
      else if ((objc_msgSend(v41, "isEqualToString:", CFSTR("LEFT_TURN_AT_END")) & 1) != 0)
      {
        v42 = 27;
      }
      else if ((objc_msgSend(v41, "isEqualToString:", CFSTR("RIGHT_TURN_AT_END")) & 1) != 0)
      {
        v42 = 28;
      }
      else if ((objc_msgSend(v41, "isEqualToString:", CFSTR("HIGHWAY_OFF_RAMP_LEFT")) & 1) != 0)
      {
        v42 = 29;
      }
      else if ((objc_msgSend(v41, "isEqualToString:", CFSTR("HIGHWAY_OFF_RAMP_RIGHT")) & 1) != 0)
      {
        v42 = 30;
      }
      else if ((objc_msgSend(v41, "isEqualToString:", CFSTR("ARRIVE_AT_DESTINATION_LEFT")) & 1) != 0)
      {
        v42 = 33;
      }
      else if ((objc_msgSend(v41, "isEqualToString:", CFSTR("ARRIVE_AT_DESTINATION_RIGHT")) & 1) != 0)
      {
        v42 = 34;
      }
      else if ((objc_msgSend(v41, "isEqualToString:", CFSTR("U_TURN_WHEN_POSSIBLE")) & 1) != 0)
      {
        v42 = 35;
      }
      else if ((objc_msgSend(v41, "isEqualToString:", CFSTR("ARRIVE_END_OF_DIRECTIONS")) & 1) != 0)
      {
        v42 = 39;
      }
      else if ((objc_msgSend(v41, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_1")) & 1) != 0)
      {
        v42 = 41;
      }
      else if ((objc_msgSend(v41, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_2")) & 1) != 0)
      {
        v42 = 42;
      }
      else if ((objc_msgSend(v41, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_3")) & 1) != 0)
      {
        v42 = 43;
      }
      else if ((objc_msgSend(v41, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_4")) & 1) != 0)
      {
        v42 = 44;
      }
      else if ((objc_msgSend(v41, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_5")) & 1) != 0)
      {
        v42 = 45;
      }
      else if ((objc_msgSend(v41, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_6")) & 1) != 0)
      {
        v42 = 46;
      }
      else if ((objc_msgSend(v41, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_7")) & 1) != 0)
      {
        v42 = 47;
      }
      else if ((objc_msgSend(v41, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_8")) & 1) != 0)
      {
        v42 = 48;
      }
      else if ((objc_msgSend(v41, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_9")) & 1) != 0)
      {
        v42 = 49;
      }
      else if ((objc_msgSend(v41, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_10")) & 1) != 0)
      {
        v42 = 50;
      }
      else if ((objc_msgSend(v41, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_11")) & 1) != 0)
      {
        v42 = 51;
      }
      else if ((objc_msgSend(v41, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_12")) & 1) != 0)
      {
        v42 = 52;
      }
      else if ((objc_msgSend(v41, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_13")) & 1) != 0)
      {
        v42 = 53;
      }
      else if ((objc_msgSend(v41, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_14")) & 1) != 0)
      {
        v42 = 54;
      }
      else if ((objc_msgSend(v41, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_15")) & 1) != 0)
      {
        v42 = 55;
      }
      else if ((objc_msgSend(v41, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_16")) & 1) != 0)
      {
        v42 = 56;
      }
      else if ((objc_msgSend(v41, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_17")) & 1) != 0)
      {
        v42 = 57;
      }
      else if ((objc_msgSend(v41, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_18")) & 1) != 0)
      {
        v42 = 58;
      }
      else if ((objc_msgSend(v41, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_19")) & 1) != 0)
      {
        v42 = 59;
      }
      else if ((objc_msgSend(v41, "isEqualToString:", CFSTR("SHARP_LEFT_TURN")) & 1) != 0)
      {
        v42 = 60;
      }
      else if ((objc_msgSend(v41, "isEqualToString:", CFSTR("SHARP_RIGHT_TURN")) & 1) != 0)
      {
        v42 = 61;
      }
      else if ((objc_msgSend(v41, "isEqualToString:", CFSTR("SLIGHT_LEFT_TURN")) & 1) != 0)
      {
        v42 = 62;
      }
      else if ((objc_msgSend(v41, "isEqualToString:", CFSTR("SLIGHT_RIGHT_TURN")) & 1) != 0)
      {
        v42 = 63;
      }
      else if ((objc_msgSend(v41, "isEqualToString:", CFSTR("CHANGE_HIGHWAY")) & 1) != 0)
      {
        v42 = 64;
      }
      else if ((objc_msgSend(v41, "isEqualToString:", CFSTR("CHANGE_HIGHWAY_LEFT")) & 1) != 0)
      {
        v42 = 65;
      }
      else if ((objc_msgSend(v41, "isEqualToString:", CFSTR("CHANGE_HIGHWAY_RIGHT")) & 1) != 0)
      {
        v42 = 66;
      }
      else if ((objc_msgSend(v41, "isEqualToString:", CFSTR("TOLL_STATION")) & 1) != 0)
      {
        v42 = 80;
      }
      else if ((objc_msgSend(v41, "isEqualToString:", CFSTR("ENTER_TUNNEL")) & 1) != 0)
      {
        v42 = 81;
      }
      else if ((objc_msgSend(v41, "isEqualToString:", CFSTR("WAYPOINT_STOP")) & 1) != 0)
      {
        v42 = 82;
      }
      else if ((objc_msgSend(v41, "isEqualToString:", CFSTR("WAYPOINT_STOP_LEFT")) & 1) != 0)
      {
        v42 = 83;
      }
      else if ((objc_msgSend(v41, "isEqualToString:", CFSTR("WAYPOINT_STOP_RIGHT")) & 1) != 0)
      {
        v42 = 84;
      }
      else if ((objc_msgSend(v41, "isEqualToString:", CFSTR("RESUME_ROUTE")) & 1) != 0)
      {
        v42 = 85;
      }
      else if ((objc_msgSend(v41, "isEqualToString:", CFSTR("RESUME_ROUTE_WITH_U_TURN")) & 1) != 0)
      {
        v42 = 86;
      }
      else if ((objc_msgSend(v41, "isEqualToString:", CFSTR("CUSTOM")) & 1) != 0)
      {
        v42 = 87;
      }
      else if (objc_msgSend(v41, "isEqualToString:", CFSTR("TURN_AROUND")))
      {
        v42 = 88;
      }
      else
      {
        v42 = 0;
      }
      v5 = v61;
    }

    goto LABEL_189;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v42 = objc_msgSend(v40, "intValue");
LABEL_189:
    objc_msgSend(a1, "setManeuverArrowOverride:", v42);
  }

  if (a3)
    v43 = CFSTR("shieldName");
  else
    v43 = CFSTR("shield_name");
  objc_msgSend(v5, "objectForKeyedSubscript:", v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v45 = [GEONameInfo alloc];
    if ((a3 & 1) != 0)
      v46 = -[GEONameInfo initWithJSON:](v45, "initWithJSON:", v44);
    else
      v46 = -[GEONameInfo initWithDictionary:](v45, "initWithDictionary:", v44);
    v47 = (void *)v46;
    objc_msgSend(a1, "setShieldName:", v46);

  }
  if (a3)
    v48 = CFSTR("stackRanking");
  else
    v48 = CFSTR("stack_ranking");
  objc_msgSend(v5, "objectForKeyedSubscript:", v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setStackRanking:", objc_msgSend(v49, "unsignedIntValue"));

  if (a3)
    v50 = CFSTR("junctionInfo");
  else
    v50 = CFSTR("junction_info");
  objc_msgSend(v5, "objectForKeyedSubscript:", v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v52 = [GEOJunctionInfo alloc];
    if ((a3 & 1) != 0)
      v53 = -[GEOJunctionInfo initWithJSON:](v52, "initWithJSON:", v51);
    else
      v53 = -[GEOJunctionInfo initWithDictionary:](v52, "initWithDictionary:", v51);
    v54 = (void *)v53;
    objc_msgSend(a1, "setJunctionInfo:", v53);

  }
  if (a3)
    v55 = CFSTR("artworkOverride");
  else
    v55 = CFSTR("artwork_override");
  objc_msgSend(v5, "objectForKeyedSubscript:", v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v57 = [GEOPBTransitArtwork alloc];
    if ((a3 & 1) != 0)
      v58 = -[GEOPBTransitArtwork initWithJSON:](v57, "initWithJSON:", v56);
    else
      v58 = -[GEOPBTransitArtwork initWithDictionary:](v57, "initWithDictionary:", v56);
    v59 = (void *)v58;
    objc_msgSend(a1, "setArtworkOverride:", v58);

  }
LABEL_220:

  return a1;
}

- (GEOSignGuidance)initWithJSON:(id)a3
{
  return (GEOSignGuidance *)-[GEOSignGuidance _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_5597;
    else
      v8 = (int *)&readAll__nonRecursiveTag_5598;
    GEOSignGuidanceReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEOSignGuidanceCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOSignGuidanceIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOSignGuidanceReadAllFrom((uint64_t)self, a3, 0);
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
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t k;
  PBDataReader *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOSignGuidanceIsDirty((uint64_t)self) & 1) == 0)
  {
    v18 = self->_reader;
    objc_sync_enter(v18);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v19);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v18);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOSignGuidance readAll:](self, "readAll:", 0);
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v6 = self->_signTitles;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v29 != v8)
            objc_enumerationMutation(v6);
          PBDataWriterWriteSubmessage();
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
      }
      while (v7);
    }

    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v10 = self->_signDetails;
    v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v25;
      do
      {
        for (j = 0; j != v11; ++j)
        {
          if (*(_QWORD *)v25 != v12)
            objc_enumerationMutation(v10);
          PBDataWriterWriteSubmessage();
        }
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
      }
      while (v11);
    }

    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v14 = self->_secondarySigns;
    v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v21;
      do
      {
        for (k = 0; k != v15; ++k)
        {
          if (*(_QWORD *)v21 != v16)
            objc_enumerationMutation(v14);
          PBDataWriterWriteSubmessage();
        }
        v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
      }
      while (v15);
    }

    if ((*(_WORD *)&self->_flags & 1) != 0)
      PBDataWriterWriteInt32Field();
    if (self->_shieldName)
      PBDataWriterWriteSubmessage();
    if ((*(_WORD *)&self->_flags & 2) != 0)
      PBDataWriterWriteUint32Field();
    if (self->_junctionInfo)
      PBDataWriterWriteSubmessage();
    if (self->_artworkOverride)
      PBDataWriterWriteSubmessage();
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v20);
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
  void *v15;
  id *v16;
  id *v17;

  v17 = (id *)a3;
  -[GEOSignGuidance readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v17 + 1, self->_reader);
  *((_DWORD *)v17 + 18) = self->_readerMarkPos;
  *((_DWORD *)v17 + 19) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (-[GEOSignGuidance signTitlesCount](self, "signTitlesCount"))
  {
    objc_msgSend(v17, "clearSignTitles");
    v4 = -[GEOSignGuidance signTitlesCount](self, "signTitlesCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[GEOSignGuidance signTitleAtIndex:](self, "signTitleAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "addSignTitle:", v7);

      }
    }
  }
  if (-[GEOSignGuidance signDetailsCount](self, "signDetailsCount"))
  {
    objc_msgSend(v17, "clearSignDetails");
    v8 = -[GEOSignGuidance signDetailsCount](self, "signDetailsCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
      {
        -[GEOSignGuidance signDetailAtIndex:](self, "signDetailAtIndex:", j);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "addSignDetail:", v11);

      }
    }
  }
  if (-[GEOSignGuidance secondarySignsCount](self, "secondarySignsCount"))
  {
    objc_msgSend(v17, "clearSecondarySigns");
    v12 = -[GEOSignGuidance secondarySignsCount](self, "secondarySignsCount");
    if (v12)
    {
      v13 = v12;
      for (k = 0; k != v13; ++k)
      {
        -[GEOSignGuidance secondarySignAtIndex:](self, "secondarySignAtIndex:", k);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "addSecondarySign:", v15);

      }
    }
  }
  v16 = v17;
  if ((*(_WORD *)&self->_flags & 1) != 0)
  {
    *((_DWORD *)v17 + 21) = self->_maneuverArrowOverride;
    *((_WORD *)v17 + 46) |= 1u;
  }
  if (self->_shieldName)
  {
    objc_msgSend(v17, "setShieldName:");
    v16 = v17;
  }
  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    *((_DWORD *)v16 + 22) = self->_stackRanking;
    *((_WORD *)v16 + 46) |= 2u;
  }
  if (self->_junctionInfo)
  {
    objc_msgSend(v17, "setJunctionInfo:");
    v16 = v17;
  }
  if (self->_artworkOverride)
  {
    objc_msgSend(v17, "setArtworkOverride:");
    v16 = v17;
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
  NSMutableArray *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t k;
  void *v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  PBUnknownFields *v30;
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
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x200) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOSignGuidanceReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_31;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOSignGuidance readAll:](self, "readAll:", 0);
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v9 = self->_signTitles;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v41 != v11)
          objc_enumerationMutation(v9);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addSignTitle:", v13);

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
    }
    while (v10);
  }

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v14 = self->_signDetails;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v37;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v37 != v16)
          objc_enumerationMutation(v14);
        v18 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * j), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addSignDetail:", v18);

      }
      v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
    }
    while (v15);
  }

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v19 = self->_secondarySigns;
  v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v32, v44, 16);
  if (v20)
  {
    v21 = *(_QWORD *)v33;
    do
    {
      for (k = 0; k != v20; ++k)
      {
        if (*(_QWORD *)v33 != v21)
          objc_enumerationMutation(v19);
        v23 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * k), "copyWithZone:", a3, (_QWORD)v32);
        objc_msgSend((id)v5, "addSecondarySign:", v23);

      }
      v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v32, v44, 16);
    }
    while (v20);
  }

  if ((*(_WORD *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 84) = self->_maneuverArrowOverride;
    *(_WORD *)(v5 + 92) |= 1u;
  }
  v24 = -[GEONameInfo copyWithZone:](self->_shieldName, "copyWithZone:", a3, (_QWORD)v32);
  v25 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v24;

  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 88) = self->_stackRanking;
    *(_WORD *)(v5 + 92) |= 2u;
  }
  v26 = -[GEOJunctionInfo copyWithZone:](self->_junctionInfo, "copyWithZone:", a3);
  v27 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v26;

  v28 = -[GEOPBTransitArtwork copyWithZone:](self->_artworkOverride, "copyWithZone:", a3);
  v29 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v28;

  v30 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v30;
LABEL_31:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSMutableArray *signTitles;
  NSMutableArray *signDetails;
  NSMutableArray *secondarySigns;
  __int16 flags;
  __int16 v9;
  GEONameInfo *shieldName;
  GEOJunctionInfo *junctionInfo;
  GEOPBTransitArtwork *artworkOverride;
  char v13;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_25;
  -[GEOSignGuidance readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  signTitles = self->_signTitles;
  if ((unint64_t)signTitles | *((_QWORD *)v4 + 8))
  {
    if (!-[NSMutableArray isEqual:](signTitles, "isEqual:"))
      goto LABEL_25;
  }
  signDetails = self->_signDetails;
  if ((unint64_t)signDetails | *((_QWORD *)v4 + 7))
  {
    if (!-[NSMutableArray isEqual:](signDetails, "isEqual:"))
      goto LABEL_25;
  }
  secondarySigns = self->_secondarySigns;
  if ((unint64_t)secondarySigns | *((_QWORD *)v4 + 5))
  {
    if (!-[NSMutableArray isEqual:](secondarySigns, "isEqual:"))
      goto LABEL_25;
  }
  flags = (__int16)self->_flags;
  v9 = *((_WORD *)v4 + 46);
  if ((flags & 1) != 0)
  {
    if ((v9 & 1) == 0 || self->_maneuverArrowOverride != *((_DWORD *)v4 + 21))
      goto LABEL_25;
  }
  else if ((v9 & 1) != 0)
  {
    goto LABEL_25;
  }
  shieldName = self->_shieldName;
  if ((unint64_t)shieldName | *((_QWORD *)v4 + 6))
  {
    if (!-[GEONameInfo isEqual:](shieldName, "isEqual:"))
    {
LABEL_25:
      v13 = 0;
      goto LABEL_26;
    }
    flags = (__int16)self->_flags;
    v9 = *((_WORD *)v4 + 46);
  }
  if ((flags & 2) != 0)
  {
    if ((v9 & 2) == 0 || self->_stackRanking != *((_DWORD *)v4 + 22))
      goto LABEL_25;
  }
  else if ((v9 & 2) != 0)
  {
    goto LABEL_25;
  }
  junctionInfo = self->_junctionInfo;
  if ((unint64_t)junctionInfo | *((_QWORD *)v4 + 4) && !-[GEOJunctionInfo isEqual:](junctionInfo, "isEqual:"))
    goto LABEL_25;
  artworkOverride = self->_artworkOverride;
  if ((unint64_t)artworkOverride | *((_QWORD *)v4 + 3))
    v13 = -[GEOPBTransitArtwork isEqual:](artworkOverride, "isEqual:");
  else
    v13 = 1;
LABEL_26:

  return v13;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;

  -[GEOSignGuidance readAll:](self, "readAll:", 1);
  v3 = -[NSMutableArray hash](self->_signTitles, "hash");
  v4 = -[NSMutableArray hash](self->_signDetails, "hash");
  v5 = -[NSMutableArray hash](self->_secondarySigns, "hash");
  if ((*(_WORD *)&self->_flags & 1) != 0)
    v6 = 2654435761 * self->_maneuverArrowOverride;
  else
    v6 = 0;
  v7 = -[GEONameInfo hash](self->_shieldName, "hash");
  if ((*(_WORD *)&self->_flags & 2) != 0)
    v8 = 2654435761 * self->_stackRanking;
  else
    v8 = 0;
  v9 = v4 ^ v3 ^ v5 ^ v6;
  v10 = v7 ^ v8 ^ -[GEOJunctionInfo hash](self->_junctionInfo, "hash");
  return v9 ^ v10 ^ -[GEOPBTransitArtwork hash](self->_artworkOverride, "hash");
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
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t k;
  GEONameInfo *shieldName;
  uint64_t v21;
  GEOJunctionInfo *junctionInfo;
  uint64_t v23;
  GEOPBTransitArtwork *artworkOverride;
  uint64_t v25;
  __int128 v26;
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
  _BYTE v38[128];
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v5 = *((id *)v4 + 8);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v35 != v8)
          objc_enumerationMutation(v5);
        -[GEOSignGuidance addSignTitle:](self, "addSignTitle:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
    }
    while (v7);
  }

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v10 = *((id *)v4 + 7);
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v31;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v31 != v13)
          objc_enumerationMutation(v10);
        -[GEOSignGuidance addSignDetail:](self, "addSignDetail:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * j));
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
    }
    while (v12);
  }

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v15 = *((id *)v4 + 5);
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v27;
    do
    {
      for (k = 0; k != v17; ++k)
      {
        if (*(_QWORD *)v27 != v18)
          objc_enumerationMutation(v15);
        -[GEOSignGuidance addSecondarySign:](self, "addSecondarySign:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * k), (_QWORD)v26);
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
    }
    while (v17);
  }

  if ((*((_WORD *)v4 + 46) & 1) != 0)
  {
    self->_maneuverArrowOverride = *((_DWORD *)v4 + 21);
    *(_WORD *)&self->_flags |= 1u;
  }
  shieldName = self->_shieldName;
  v21 = *((_QWORD *)v4 + 6);
  if (shieldName)
  {
    if (v21)
      -[GEONameInfo mergeFrom:](shieldName, "mergeFrom:");
  }
  else if (v21)
  {
    -[GEOSignGuidance setShieldName:](self, "setShieldName:");
  }
  if ((*((_WORD *)v4 + 46) & 2) != 0)
  {
    self->_stackRanking = *((_DWORD *)v4 + 22);
    *(_WORD *)&self->_flags |= 2u;
  }
  junctionInfo = self->_junctionInfo;
  v23 = *((_QWORD *)v4 + 4);
  if (junctionInfo)
  {
    if (v23)
      -[GEOJunctionInfo mergeFrom:](junctionInfo, "mergeFrom:");
  }
  else if (v23)
  {
    -[GEOSignGuidance setJunctionInfo:](self, "setJunctionInfo:");
  }
  artworkOverride = self->_artworkOverride;
  v25 = *((_QWORD *)v4 + 3);
  if (artworkOverride)
  {
    if (v25)
      -[GEOPBTransitArtwork mergeFrom:](artworkOverride, "mergeFrom:");
  }
  else if (v25)
  {
    -[GEOSignGuidance setArtworkOverride:](self, "setArtworkOverride:");
  }

}

- (PBUnknownFields)unknownFields
{
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v5;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_WORD *)&self->_flags & 4) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      v5 = reader;
      objc_sync_enter(v5);
      GEOSignGuidanceReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_5601);
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
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v3 = a3;
  v37 = *MEMORY[0x1E0C80C00];
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x204u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEOSignGuidance readAll:](self, "readAll:", 0);
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v7 = self->_signTitles;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v31;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v31 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * v11++), "clearUnknownFields:", 1);
        }
        while (v9 != v11);
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
      }
      while (v9);
    }

    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v12 = self->_signDetails;
    v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v27;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v27 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * v16++), "clearUnknownFields:", 1);
        }
        while (v14 != v16);
        v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
      }
      while (v14);
    }

    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v17 = self->_secondarySigns;
    v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v22, v34, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v23;
      do
      {
        v21 = 0;
        do
        {
          if (*(_QWORD *)v23 != v20)
            objc_enumerationMutation(v17);
          objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v21++), "clearUnknownFields:", 1, (_QWORD)v22);
        }
        while (v19 != v21);
        v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v22, v34, 16);
      }
      while (v19);
    }

    -[GEONameInfo clearUnknownFields:](self->_shieldName, "clearUnknownFields:", 1);
    -[GEOJunctionInfo clearUnknownFields:](self->_junctionInfo, "clearUnknownFields:", 1);
    -[GEOPBTransitArtwork clearUnknownFields:](self->_artworkOverride, "clearUnknownFields:", 1);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signTitles, 0);
  objc_storeStrong((id *)&self->_signDetails, 0);
  objc_storeStrong((id *)&self->_shieldName, 0);
  objc_storeStrong((id *)&self->_secondarySigns, 0);
  objc_storeStrong((id *)&self->_junctionInfo, 0);
  objc_storeStrong((id *)&self->_artworkOverride, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
