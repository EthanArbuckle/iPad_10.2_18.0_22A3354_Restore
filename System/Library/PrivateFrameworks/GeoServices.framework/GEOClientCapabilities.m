@implementation GEOClientCapabilities

- (void)_updateWithAutomobileOptions:(id)a3
{
  int v4;
  void *v5;
  id v6;
  int BOOL;
  id v8;

  v4 = GeoUserSessionConfig_EVDirectionsFeedbackToggle;
  v5 = off_1EDF49BB0;
  v6 = a3;
  BOOL = GEOConfigGetBOOL(v4, (uint64_t)v5);
  objc_msgSend(v6, "vehicleSpecifications");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[GEOClientCapabilities setWillSendEvDirectionsFeedback:](self, "setWillSendEvDirectionsFeedback:", objc_msgSend(v8, "hasEvInfo") & BOOL);
}

- (void)updateWithETARequest:(id)a3
{
  id v4;

  objc_msgSend(a3, "automobileOptions");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[GEOClientCapabilities _updateWithAutomobileOptions:](self, "_updateWithAutomobileOptions:", v4);

}

- (void)updateWithETATrafficUpdateRequest:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "routeAttributes");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "automobileOptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOClientCapabilities _updateWithAutomobileOptions:](self, "_updateWithAutomobileOptions:", v4);

}

- (void)updateWithDirectionsRequest:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "routeAttributes");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "automobileOptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOClientCapabilities _updateWithAutomobileOptions:](self, "_updateWithAutomobileOptions:", v4);

}

- (GEOClientCapabilities)init
{
  GEOClientCapabilities *v2;
  GEOClientCapabilities *v3;
  GEOClientCapabilities *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOClientCapabilities;
  v2 = -[GEOClientCapabilities init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOClientCapabilities)initWithData:(id)a3
{
  GEOClientCapabilities *v3;
  GEOClientCapabilities *v4;
  GEOClientCapabilities *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOClientCapabilities;
  v3 = -[GEOClientCapabilities initWithData:](&v7, sel_initWithData_, a3);
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

  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOClientCapabilities;
  -[GEOClientCapabilities dealloc](&v3, sel_dealloc);
}

- (void)_readAppMajorVersion
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 232));
    if ((*(_QWORD *)(a1 + 304) & 0x10000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOClientCapabilitiesReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAppMajorVersion_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 232));
  }
}

- (BOOL)hasAppMajorVersion
{
  -[GEOClientCapabilities _readAppMajorVersion]((uint64_t)self);
  return self->_appMajorVersion != 0;
}

- (NSString)appMajorVersion
{
  -[GEOClientCapabilities _readAppMajorVersion]((uint64_t)self);
  return self->_appMajorVersion;
}

- (void)setAppMajorVersion:(id)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 4;
  *(_QWORD *)&self->_flags |= 0x10000000000000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_appMajorVersion, a3);
}

- (void)_readAppMinorVersion
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 232));
    if ((*(_QWORD *)(a1 + 304) & 0x20000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOClientCapabilitiesReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAppMinorVersion_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 232));
  }
}

- (BOOL)hasAppMinorVersion
{
  -[GEOClientCapabilities _readAppMinorVersion]((uint64_t)self);
  return self->_appMinorVersion != 0;
}

- (NSString)appMinorVersion
{
  -[GEOClientCapabilities _readAppMinorVersion]((uint64_t)self);
  return self->_appMinorVersion;
}

- (void)setAppMinorVersion:(id)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 4;
  *(_QWORD *)&self->_flags |= 0x20000000000000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_appMinorVersion, a3);
}

- (void)_readHardwareModel
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 232));
    if ((*(_QWORD *)(a1 + 304) & 0x800000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOClientCapabilitiesReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readHardwareModel_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 232));
  }
}

- (BOOL)hasHardwareModel
{
  -[GEOClientCapabilities _readHardwareModel]((uint64_t)self);
  return self->_hardwareModel != 0;
}

- (NSString)hardwareModel
{
  -[GEOClientCapabilities _readHardwareModel]((uint64_t)self);
  return self->_hardwareModel;
}

- (void)setHardwareModel:(id)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 4;
  *(_QWORD *)&self->_flags |= 0x800000000000000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_hardwareModel, a3);
}

- (void)_readHardwareClass
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 232));
    if ((*(_QWORD *)(a1 + 304) & 0x1000000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOClientCapabilitiesReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readHardwareClass_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 232));
  }
}

- (BOOL)hasHardwareClass
{
  -[GEOClientCapabilities _readHardwareClass]((uint64_t)self);
  return self->_hardwareClass != 0;
}

- (NSString)hardwareClass
{
  -[GEOClientCapabilities _readHardwareClass]((uint64_t)self);
  return self->_hardwareClass;
}

- (void)setHardwareClass:(id)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 4;
  *(_QWORD *)&self->_flags |= 0x1000000000000000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_hardwareClass, a3);
}

- (int)maxManeuverTypeSupported
{
  os_unfair_lock_s *p_readerLock;
  uint64_t flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (uint64_t)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 2) != 0)
    return self->_maxManeuverTypeSupported;
  else
    return 63;
}

- (void)setMaxManeuverTypeSupported:(int)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 4;
  *(_QWORD *)&self->_flags |= 2uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  self->_maxManeuverTypeSupported = a3;
}

- (void)setHasMaxManeuverTypeSupported:(BOOL)a3
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)&self->_flags + 8);
  v4 = 2;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFFFDLL | v4;
  *((_BYTE *)&self->_flags + 8) = v3 | 4;
}

- (BOOL)hasMaxManeuverTypeSupported
{
  return (*(_QWORD *)&self->_flags >> 1) & 1;
}

- (id)maxManeuverTypeSupportedAsString:(int)a3
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

- (int)StringAsMaxManeuverTypeSupported:(id)a3
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

- (BOOL)internalInstall
{
  return self->_internalInstall;
}

- (void)setInternalInstall:(BOOL)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 4;
  *(_QWORD *)&self->_flags |= 0x200uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  self->_internalInstall = a3;
}

- (void)setHasInternalInstall:(BOOL)a3
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)&self->_flags + 8);
  v4 = 512;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFDFFLL | v4;
  *((_BYTE *)&self->_flags + 8) = v3 | 4;
}

- (BOOL)hasInternalInstall
{
  return (*(_QWORD *)&self->_flags >> 9) & 1;
}

- (BOOL)internalTool
{
  return self->_internalTool;
}

- (void)setInternalTool:(BOOL)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 4;
  *(_QWORD *)&self->_flags |= 0x400uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  self->_internalTool = a3;
}

- (void)setHasInternalTool:(BOOL)a3
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)&self->_flags + 8);
  v4 = 1024;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFBFFLL | v4;
  *((_BYTE *)&self->_flags + 8) = v3 | 4;
}

- (BOOL)hasInternalTool
{
  return (*(_QWORD *)&self->_flags >> 10) & 1;
}

- (void)_readDisplayLanguages
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 232));
    if ((*(_QWORD *)(a1 + 304) & 0x100000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOClientCapabilitiesReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDisplayLanguages_tags_1);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 232));
  }
}

- (NSMutableArray)displayLanguages
{
  -[GEOClientCapabilities _readDisplayLanguages]((uint64_t)self);
  return self->_displayLanguages;
}

- (void)setDisplayLanguages:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *displayLanguages;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x100000000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *((_BYTE *)&self->_flags + 8) |= 4u;
  displayLanguages = self->_displayLanguages;
  self->_displayLanguages = v4;

}

- (void)clearDisplayLanguages
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x100000000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((_BYTE *)&self->_flags + 8) |= 4u;
  -[NSMutableArray removeAllObjects](self->_displayLanguages, "removeAllObjects");
}

- (void)addDisplayLanguages:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;

  v4 = a3;
  -[GEOClientCapabilities _readDisplayLanguages]((uint64_t)self);
  -[GEOClientCapabilities _addNoFlagsDisplayLanguages:]((uint64_t)self, v4);

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  self = (GEOClientCapabilities *)((char *)self + 304);
  self->super.super.isa = (Class)((unint64_t)self->super.super.isa | 0x100000000000000);
  os_unfair_lock_unlock(p_readerLock);
  LOBYTE(self->_reader) |= 4u;
}

- (void)_addNoFlagsDisplayLanguages:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 144);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 144);
      *(_QWORD *)(a1 + 144) = v5;

      v4 = *(void **)(a1 + 144);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)displayLanguagesCount
{
  -[GEOClientCapabilities _readDisplayLanguages]((uint64_t)self);
  return -[NSMutableArray count](self->_displayLanguages, "count");
}

- (id)displayLanguagesAtIndex:(unint64_t)a3
{
  -[GEOClientCapabilities _readDisplayLanguages]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_displayLanguages, "objectAtIndex:", a3);
}

+ (Class)displayLanguagesType
{
  return (Class)objc_opt_class();
}

- (void)_readDisplayRegion
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 232));
    if ((*(_QWORD *)(a1 + 304) & 0x200000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOClientCapabilitiesReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDisplayRegion_tags_2);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 232));
  }
}

- (BOOL)hasDisplayRegion
{
  -[GEOClientCapabilities _readDisplayRegion]((uint64_t)self);
  return self->_displayRegion != 0;
}

- (NSString)displayRegion
{
  -[GEOClientCapabilities _readDisplayRegion]((uint64_t)self);
  return self->_displayRegion;
}

- (void)setDisplayRegion:(id)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 4;
  *(_QWORD *)&self->_flags |= 0x200000000000000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_displayRegion, a3);
}

- (unsigned)maxTrafficSpeedSupported
{
  os_unfair_lock_s *p_readerLock;
  uint64_t flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (uint64_t)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 8) != 0)
    return self->_maxTrafficSpeedSupported;
  else
    return 3;
}

- (void)setMaxTrafficSpeedSupported:(unsigned int)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 4;
  *(_QWORD *)&self->_flags |= 8uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  self->_maxTrafficSpeedSupported = a3;
}

- (void)setHasMaxTrafficSpeedSupported:(BOOL)a3
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)&self->_flags + 8);
  v4 = 8;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFFF7 | v4;
  *((_BYTE *)&self->_flags + 8) = v3 | 4;
}

- (BOOL)hasMaxTrafficSpeedSupported
{
  return (*(_QWORD *)&self->_flags >> 3) & 1;
}

- (int)maxRouteIncidentSupported
{
  os_unfair_lock_s *p_readerLock;
  uint64_t flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (uint64_t)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 4) != 0)
    return self->_maxRouteIncidentSupported;
  else
    return 6;
}

- (void)setMaxRouteIncidentSupported:(int)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 4;
  *(_QWORD *)&self->_flags |= 4uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  self->_maxRouteIncidentSupported = a3;
}

- (void)setHasMaxRouteIncidentSupported:(BOOL)a3
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)&self->_flags + 8);
  v4 = 4;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFFFBLL | v4;
  *((_BYTE *)&self->_flags + 8) = v3 | 4;
}

- (BOOL)hasMaxRouteIncidentSupported
{
  return (*(_QWORD *)&self->_flags >> 2) & 1;
}

- (int)maxFormatterSupported
{
  os_unfair_lock_s *p_readerLock;
  uint64_t flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (uint64_t)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 1) != 0)
    return self->_maxFormatterSupported;
  else
    return 7;
}

- (void)setMaxFormatterSupported:(int)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 4;
  *(_QWORD *)&self->_flags |= 1uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  self->_maxFormatterSupported = a3;
}

- (void)setHasMaxFormatterSupported:(BOOL)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 4;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFFFELL | a3;
  *((_BYTE *)&self->_flags + 8) = v3;
}

- (BOOL)hasMaxFormatterSupported
{
  return *(_DWORD *)&self->_flags & 1;
}

- (void)_readDeviceCountryCode
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 232));
    if ((*(_QWORD *)(a1 + 304) & 0x40000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOClientCapabilitiesReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDeviceCountryCode_tags_1);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 232));
  }
}

- (BOOL)hasDeviceCountryCode
{
  -[GEOClientCapabilities _readDeviceCountryCode]((uint64_t)self);
  return self->_deviceCountryCode != 0;
}

- (NSString)deviceCountryCode
{
  -[GEOClientCapabilities _readDeviceCountryCode]((uint64_t)self);
  return self->_deviceCountryCode;
}

- (void)setDeviceCountryCode:(id)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 4;
  *(_QWORD *)&self->_flags |= 0x40000000000000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_deviceCountryCode, a3);
}

- (BOOL)clusteredTransitRoutesSupported
{
  return self->_clusteredTransitRoutesSupported;
}

- (void)setClusteredTransitRoutesSupported:(BOOL)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 4;
  *(_QWORD *)&self->_flags |= 0x80uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  self->_clusteredTransitRoutesSupported = a3;
}

- (void)setHasClusteredTransitRoutesSupported:(BOOL)a3
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)&self->_flags + 8);
  v4 = 128;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFF7FLL | v4;
  *((_BYTE *)&self->_flags + 8) = v3 | 4;
}

- (BOOL)hasClusteredTransitRoutesSupported
{
  return (*(_QWORD *)&self->_flags >> 7) & 1;
}

- (BOOL)routeOptionsSupported
{
  return self->_routeOptionsSupported;
}

- (void)setRouteOptionsSupported:(BOOL)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 4;
  *(_QWORD *)&self->_flags |= 0x4000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  self->_routeOptionsSupported = a3;
}

- (void)setHasRouteOptionsSupported:(BOOL)a3
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)&self->_flags + 8);
  v4 = 0x4000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFBFFFLL | v4;
  *((_BYTE *)&self->_flags + 8) = v3 | 4;
}

- (BOOL)hasRouteOptionsSupported
{
  return (*(_QWORD *)&self->_flags >> 14) & 1;
}

- (int)transitMarketSupport
{
  os_unfair_lock_s *p_readerLock;
  uint64_t flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (uint64_t)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 0x40) != 0)
    return self->_transitMarketSupport;
  else
    return 1;
}

- (void)setTransitMarketSupport:(int)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 4;
  *(_QWORD *)&self->_flags |= 0x40uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  self->_transitMarketSupport = a3;
}

- (void)setHasTransitMarketSupport:(BOOL)a3
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)&self->_flags + 8);
  v4 = 64;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFFBFLL | v4;
  *((_BYTE *)&self->_flags + 8) = v3 | 4;
}

- (BOOL)hasTransitMarketSupport
{
  return (*(_QWORD *)&self->_flags >> 6) & 1;
}

- (id)transitMarketSupportAsString:(int)a3
{
  if ((a3 - 1) < 3)
    return off_1E1C0EFE8[a3 - 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsTransitMarketSupport:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VERSION_1")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VERSION_2")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("VERSION_3")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (void)_readFormattedStringClientCapabilities
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 232));
    if ((*(_QWORD *)(a1 + 304) & 0x400000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOClientCapabilitiesReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readFormattedStringClientCapabilities_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 232));
  }
}

- (BOOL)hasFormattedStringClientCapabilities
{
  -[GEOClientCapabilities _readFormattedStringClientCapabilities]((uint64_t)self);
  return self->_formattedStringClientCapabilities != 0;
}

- (GEOFormattedStringClientCapabilities)formattedStringClientCapabilities
{
  -[GEOClientCapabilities _readFormattedStringClientCapabilities]((uint64_t)self);
  return self->_formattedStringClientCapabilities;
}

- (void)setFormattedStringClientCapabilities:(id)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 4;
  *(_QWORD *)&self->_flags |= 0x400000000000000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_formattedStringClientCapabilities, a3);
}

- (void)_readAdvisoryClientCapabilities
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 232));
    if ((*(_QWORD *)(a1 + 304) & 0x8000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOClientCapabilitiesReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAdvisoryClientCapabilities_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 232));
  }
}

- (BOOL)hasAdvisoryClientCapabilities
{
  -[GEOClientCapabilities _readAdvisoryClientCapabilities]((uint64_t)self);
  return self->_advisoryClientCapabilities != 0;
}

- (GEOAdvisoryClientCapabilities)advisoryClientCapabilities
{
  -[GEOClientCapabilities _readAdvisoryClientCapabilities]((uint64_t)self);
  return self->_advisoryClientCapabilities;
}

- (void)setAdvisoryClientCapabilities:(id)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 4;
  *(_QWORD *)&self->_flags |= 0x8000000000000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_advisoryClientCapabilities, a3);
}

- (BOOL)snapToClosestStopSupported
{
  return self->_snapToClosestStopSupported;
}

- (void)setSnapToClosestStopSupported:(BOOL)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 4;
  *(_QWORD *)&self->_flags |= 0x8000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  self->_snapToClosestStopSupported = a3;
}

- (void)setHasSnapToClosestStopSupported:(BOOL)a3
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)&self->_flags + 8);
  v4 = 0x8000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFFF7FFFLL | v4;
  *((_BYTE *)&self->_flags + 8) = v3 | 4;
}

- (BOOL)hasSnapToClosestStopSupported
{
  return (*(_QWORD *)&self->_flags >> 15) & 1;
}

- (BOOL)includeCrossLanguagePhonetics
{
  return self->_includeCrossLanguagePhonetics;
}

- (void)setIncludeCrossLanguagePhonetics:(BOOL)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 4;
  *(_QWORD *)&self->_flags |= 0x100uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  self->_includeCrossLanguagePhonetics = a3;
}

- (void)setHasIncludeCrossLanguagePhonetics:(BOOL)a3
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)&self->_flags + 8);
  v4 = 256;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFEFFLL | v4;
  *((_BYTE *)&self->_flags + 8) = v3 | 4;
}

- (BOOL)hasIncludeCrossLanguagePhonetics
{
  return (*(_QWORD *)&self->_flags >> 8) & 1;
}

- (void)_readUserCurrentTimezone
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 232));
    if ((*(_BYTE *)(a1 + 312) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOClientCapabilitiesReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readUserCurrentTimezone_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 232));
  }
}

- (BOOL)hasUserCurrentTimezone
{
  -[GEOClientCapabilities _readUserCurrentTimezone]((uint64_t)self);
  return self->_userCurrentTimezone != 0;
}

- (NSString)userCurrentTimezone
{
  -[GEOClientCapabilities _readUserCurrentTimezone]((uint64_t)self);
  return self->_userCurrentTimezone;
}

- (void)setUserCurrentTimezone:(id)a3
{
  *((_BYTE *)&self->_flags + 8) |= 5u;
  objc_storeStrong((id *)&self->_userCurrentTimezone, a3);
}

- (BOOL)supportsLongShieldStrings
{
  return self->_supportsLongShieldStrings;
}

- (void)setSupportsLongShieldStrings:(BOOL)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 4;
  *(_QWORD *)&self->_flags |= 0x400000000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  self->_supportsLongShieldStrings = a3;
}

- (void)setHasSupportsLongShieldStrings:(BOOL)a3
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)&self->_flags + 8);
  v4 = 0x400000000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFBFFFFFFFFLL | v4;
  *((_BYTE *)&self->_flags + 8) = v3 | 4;
}

- (BOOL)hasSupportsLongShieldStrings
{
  return (*(_QWORD *)&self->_flags >> 34) & 1;
}

- (BOOL)supportsGuidanceEvents
{
  return self->_supportsGuidanceEvents;
}

- (void)setSupportsGuidanceEvents:(BOOL)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 4;
  *(_QWORD *)&self->_flags |= 0x80000000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  self->_supportsGuidanceEvents = a3;
}

- (void)setHasSupportsGuidanceEvents:(BOOL)a3
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)&self->_flags + 8);
  v4 = 0x80000000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFF7FFFFFFFLL | v4;
  *((_BYTE *)&self->_flags + 8) = v3 | 4;
}

- (BOOL)hasSupportsGuidanceEvents
{
  return (*(_QWORD *)&self->_flags >> 31) & 1;
}

- (BOOL)supportsGuidanceEventsInlineShields
{
  return self->_supportsGuidanceEventsInlineShields;
}

- (void)setSupportsGuidanceEventsInlineShields:(BOOL)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 4;
  *(_QWORD *)&self->_flags |= 0x40000000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  self->_supportsGuidanceEventsInlineShields = a3;
}

- (void)setHasSupportsGuidanceEventsInlineShields:(BOOL)a3
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)&self->_flags + 8);
  v4 = 0x40000000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFBFFFFFFFLL | v4;
  *((_BYTE *)&self->_flags + 8) = v3 | 4;
}

- (BOOL)hasSupportsGuidanceEventsInlineShields
{
  return (*(_QWORD *)&self->_flags >> 30) & 1;
}

- (void)_readAbAssignInfo
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 232));
    if ((*(_QWORD *)(a1 + 304) & 0x4000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOClientCapabilitiesReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAbAssignInfo_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 232));
  }
}

- (BOOL)hasAbAssignInfo
{
  -[GEOClientCapabilities _readAbAssignInfo]((uint64_t)self);
  return self->_abAssignInfo != 0;
}

- (GEOAbAssignInfo)abAssignInfo
{
  -[GEOClientCapabilities _readAbAssignInfo]((uint64_t)self);
  return self->_abAssignInfo;
}

- (void)setAbAssignInfo:(id)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 4;
  *(_QWORD *)&self->_flags |= 0x4000000000000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_abAssignInfo, a3);
}

- (void)_readRequestTime
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 232));
    if ((*(_QWORD *)(a1 + 304) & 0x8000000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOClientCapabilitiesReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRequestTime_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 232));
  }
}

- (BOOL)hasRequestTime
{
  -[GEOClientCapabilities _readRequestTime]((uint64_t)self);
  return self->_requestTime != 0;
}

- (GEOLocalTime)requestTime
{
  -[GEOClientCapabilities _readRequestTime]((uint64_t)self);
  return self->_requestTime;
}

- (void)setRequestTime:(id)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 4;
  *(_QWORD *)&self->_flags |= 0x8000000000000000;
  *((_BYTE *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_requestTime, a3);
}

- (unsigned)maxZilchMessageVersionSupported
{
  os_unfair_lock_s *p_readerLock;
  uint64_t flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (uint64_t)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 0x20) != 0)
    return self->_maxZilchMessageVersionSupported;
  else
    return 3;
}

- (void)setMaxZilchMessageVersionSupported:(unsigned int)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 4;
  *(_QWORD *)&self->_flags |= 0x20uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  self->_maxZilchMessageVersionSupported = a3;
}

- (void)setHasMaxZilchMessageVersionSupported:(BOOL)a3
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)&self->_flags + 8);
  v4 = 32;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFFDFLL | v4;
  *((_BYTE *)&self->_flags + 8) = v3 | 4;
}

- (BOOL)hasMaxZilchMessageVersionSupported
{
  return (*(_QWORD *)&self->_flags >> 5) & 1;
}

- (void)_readSupportedTransitFeatures
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 232));
    if ((*(_QWORD *)(a1 + 304) & 0x1000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOClientCapabilitiesReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSupportedTransitFeatures_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 232));
  }
}

- (unint64_t)supportedTransitFeaturesCount
{
  -[GEOClientCapabilities _readSupportedTransitFeatures]((uint64_t)self);
  return self->_supportedTransitFeatures.count;
}

- (int)supportedTransitFeatures
{
  -[GEOClientCapabilities _readSupportedTransitFeatures]((uint64_t)self);
  return self->_supportedTransitFeatures.list;
}

- (void)clearSupportedTransitFeatures
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x1000000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((_BYTE *)&self->_flags + 8) |= 4u;
  PBRepeatedInt32Clear();
}

- (void)addSupportedTransitFeature:(int)a3
{
  os_unfair_lock_s *p_readerLock;
  $C6CCB02B41CDF0B568D1AACBF6097E71 *p_flags;

  -[GEOClientCapabilities _readSupportedTransitFeatures]((uint64_t)self);
  if (self)
    PBRepeatedInt32Add();
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  p_flags = &self->_flags;
  *(_QWORD *)p_flags |= 0x1000000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((_BYTE *)p_flags + 8) |= 4u;
}

- (int)supportedTransitFeatureAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_supportedTransitFeatures;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEOClientCapabilities _readSupportedTransitFeatures]((uint64_t)self);
  p_supportedTransitFeatures = &self->_supportedTransitFeatures;
  count = self->_supportedTransitFeatures.count;
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
  return p_supportedTransitFeatures->list[a3];
}

- (void)setSupportedTransitFeatures:(int *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x1000000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((_BYTE *)&self->_flags + 8) |= 4u;
  PBRepeatedInt32Set();
}

- (id)supportedTransitFeaturesAsString:(int)a3
{
  if (a3 < 7)
    return off_1E1C0F000[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsSupportedTransitFeatures:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TEXT_IN_PLANNING_ARTWORK")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GOTO_STOP_IN_TRANSFERS")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LIST_INSTRUCTION_TIME_TEXT")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ENHANCED_GUIDANCE_2021")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PAYMENT_METHOD_SUGGESTIONS")) & 1) != 0)
  {
    v4 = 5;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("TICKETING_URLS")))
  {
    v4 = 6;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)supportsArrivalMapRegion
{
  return self->_supportsArrivalMapRegion;
}

- (void)setSupportsArrivalMapRegion:(BOOL)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 4;
  *(_QWORD *)&self->_flags |= 0x40000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  self->_supportsArrivalMapRegion = a3;
}

- (void)setHasSupportsArrivalMapRegion:(BOOL)a3
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)&self->_flags + 8);
  v4 = 0x40000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFFBFFFFLL | v4;
  *((_BYTE *)&self->_flags + 8) = v3 | 4;
}

- (BOOL)hasSupportsArrivalMapRegion
{
  return (*(_QWORD *)&self->_flags >> 18) & 1;
}

- (BOOL)supportsNaturalGuidance
{
  return self->_supportsNaturalGuidance;
}

- (void)setSupportsNaturalGuidance:(BOOL)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 4;
  *(_QWORD *)&self->_flags |= 0x800000000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  self->_supportsNaturalGuidance = a3;
}

- (void)setHasSupportsNaturalGuidance:(BOOL)a3
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)&self->_flags + 8);
  v4 = 0x800000000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFF7FFFFFFFFLL | v4;
  *((_BYTE *)&self->_flags + 8) = v3 | 4;
}

- (BOOL)hasSupportsNaturalGuidance
{
  return (*(_QWORD *)&self->_flags >> 35) & 1;
}

- (BOOL)supportsJunctionView
{
  return self->_supportsJunctionView;
}

- (void)setSupportsJunctionView:(BOOL)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 4;
  *(_QWORD *)&self->_flags |= 0x100000000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  self->_supportsJunctionView = a3;
}

- (void)setHasSupportsJunctionView:(BOOL)a3
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)&self->_flags + 8);
  v4 = 0x100000000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFEFFFFFFFFLL | v4;
  *((_BYTE *)&self->_flags + 8) = v3 | 4;
}

- (BOOL)hasSupportsJunctionView
{
  return HIDWORD(*(_QWORD *)&self->_flags) & 1;
}

- (BOOL)supportsCongestionZones
{
  return self->_supportsCongestionZones;
}

- (void)setSupportsCongestionZones:(BOOL)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 4;
  *(_QWORD *)&self->_flags |= 0x200000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  self->_supportsCongestionZones = a3;
}

- (void)setHasSupportsCongestionZones:(BOOL)a3
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)&self->_flags + 8);
  v4 = 0x200000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFDFFFFFLL | v4;
  *((_BYTE *)&self->_flags + 8) = v3 | 4;
}

- (BOOL)hasSupportsCongestionZones
{
  return (*(_QWORD *)&self->_flags >> 21) & 1;
}

- (BOOL)supportsLicensePlateRestrictions
{
  return self->_supportsLicensePlateRestrictions;
}

- (void)setSupportsLicensePlateRestrictions:(BOOL)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 4;
  *(_QWORD *)&self->_flags |= 0x200000000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  self->_supportsLicensePlateRestrictions = a3;
}

- (void)setHasSupportsLicensePlateRestrictions:(BOOL)a3
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)&self->_flags + 8);
  v4 = 0x200000000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFDFFFFFFFFLL | v4;
  *((_BYTE *)&self->_flags + 8) = v3 | 4;
}

- (BOOL)hasSupportsLicensePlateRestrictions
{
  return (*(_QWORD *)&self->_flags >> 33) & 1;
}

- (BOOL)supportsElectricVehicleRoutes
{
  return self->_supportsElectricVehicleRoutes;
}

- (void)setSupportsElectricVehicleRoutes:(BOOL)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 4;
  *(_QWORD *)&self->_flags |= 0x2000000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  self->_supportsElectricVehicleRoutes = a3;
}

- (void)setHasSupportsElectricVehicleRoutes:(BOOL)a3
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)&self->_flags + 8);
  v4 = 0x2000000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFDFFFFFFLL | v4;
  *((_BYTE *)&self->_flags + 8) = v3 | 4;
}

- (BOOL)hasSupportsElectricVehicleRoutes
{
  return (*(_QWORD *)&self->_flags >> 25) & 1;
}

- (BOOL)supportsTrafficCameras
{
  return self->_supportsTrafficCameras;
}

- (void)setSupportsTrafficCameras:(BOOL)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 4;
  *(_QWORD *)&self->_flags |= 0x20000000000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  self->_supportsTrafficCameras = a3;
}

- (void)setHasSupportsTrafficCameras:(BOOL)a3
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)&self->_flags + 8);
  v4 = 0x20000000000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFDFFFFFFFFFFLL | v4;
  *((_BYTE *)&self->_flags + 8) = v3 | 4;
}

- (BOOL)hasSupportsTrafficCameras
{
  return (*(_QWORD *)&self->_flags >> 41) & 1;
}

- (BOOL)supportsWaypointRoutes
{
  return self->_supportsWaypointRoutes;
}

- (void)setSupportsWaypointRoutes:(BOOL)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 4;
  *(_QWORD *)&self->_flags |= 0x100000000000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  self->_supportsWaypointRoutes = a3;
}

- (void)setHasSupportsWaypointRoutes:(BOOL)a3
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)&self->_flags + 8);
  v4 = 0x100000000000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFEFFFFFFFFFFFLL | v4;
  *((_BYTE *)&self->_flags + 8) = v3 | 4;
}

- (BOOL)hasSupportsWaypointRoutes
{
  return (*(_QWORD *)&self->_flags >> 44) & 1;
}

- (void)_readLocalizationCapabilities
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 232));
    if ((*(_QWORD *)(a1 + 304) & 0x2000000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOClientCapabilitiesReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLocalizationCapabilities_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 232));
  }
}

- (BOOL)hasLocalizationCapabilities
{
  -[GEOClientCapabilities _readLocalizationCapabilities]((uint64_t)self);
  return self->_localizationCapabilities != 0;
}

- (GEOLocalizationCapabilities)localizationCapabilities
{
  -[GEOClientCapabilities _readLocalizationCapabilities]((uint64_t)self);
  return self->_localizationCapabilities;
}

- (void)setLocalizationCapabilities:(id)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 4;
  *(_QWORD *)&self->_flags |= 0x2000000000000000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_localizationCapabilities, a3);
}

- (void)_readDeviceSku
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 232));
    if ((*(_QWORD *)(a1 + 304) & 0x80000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOClientCapabilitiesReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDeviceSku_tags_1);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 232));
  }
}

- (BOOL)hasDeviceSku
{
  -[GEOClientCapabilities _readDeviceSku]((uint64_t)self);
  return self->_deviceSku != 0;
}

- (NSString)deviceSku
{
  -[GEOClientCapabilities _readDeviceSku]((uint64_t)self);
  return self->_deviceSku;
}

- (void)setDeviceSku:(id)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 4;
  *(_QWORD *)&self->_flags |= 0x80000000000000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_deviceSku, a3);
}

- (void)_readOsVersion
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 232));
    if ((*(_QWORD *)(a1 + 304) & 0x4000000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOClientCapabilitiesReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readOsVersion_tags_1);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 232));
  }
}

- (BOOL)hasOsVersion
{
  -[GEOClientCapabilities _readOsVersion]((uint64_t)self);
  return self->_osVersion != 0;
}

- (NSString)osVersion
{
  -[GEOClientCapabilities _readOsVersion]((uint64_t)self);
  return self->_osVersion;
}

- (void)setOsVersion:(id)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 4;
  *(_QWORD *)&self->_flags |= 0x4000000000000000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_osVersion, a3);
}

- (BOOL)willSendEvDirectionsFeedback
{
  return self->_willSendEvDirectionsFeedback;
}

- (void)setWillSendEvDirectionsFeedback:(BOOL)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 4;
  *(_QWORD *)&self->_flags |= 0x200000000000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  self->_willSendEvDirectionsFeedback = a3;
}

- (void)setHasWillSendEvDirectionsFeedback:(BOOL)a3
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)&self->_flags + 8);
  v4 = 0x200000000000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFDFFFFFFFFFFFLL | v4;
  *((_BYTE *)&self->_flags + 8) = v3 | 4;
}

- (BOOL)hasWillSendEvDirectionsFeedback
{
  return (*(_QWORD *)&self->_flags >> 45) & 1;
}

- (BOOL)supportsRoadComplexities
{
  return self->_supportsRoadComplexities;
}

- (void)setSupportsRoadComplexities:(BOOL)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 4;
  *(_QWORD *)&self->_flags |= 0x1000000000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  self->_supportsRoadComplexities = a3;
}

- (void)setHasSupportsRoadComplexities:(BOOL)a3
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)&self->_flags + 8);
  v4 = 0x1000000000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFEFFFFFFFFFLL | v4;
  *((_BYTE *)&self->_flags + 8) = v3 | 4;
}

- (BOOL)hasSupportsRoadComplexities
{
  return (*(_QWORD *)&self->_flags >> 36) & 1;
}

- (BOOL)supportsSpeedTrapAnnouncements
{
  return self->_supportsSpeedTrapAnnouncements;
}

- (void)setSupportsSpeedTrapAnnouncements:(BOOL)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 4;
  *(_QWORD *)&self->_flags |= 0x10000000000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  self->_supportsSpeedTrapAnnouncements = a3;
}

- (void)setHasSupportsSpeedTrapAnnouncements:(BOOL)a3
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)&self->_flags + 8);
  v4 = 0x10000000000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFEFFFFFFFFFFLL | v4;
  *((_BYTE *)&self->_flags + 8) = v3 | 4;
}

- (BOOL)hasSupportsSpeedTrapAnnouncements
{
  return (*(_QWORD *)&self->_flags >> 40) & 1;
}

- (BOOL)supportsUserIncidentReports
{
  return self->_supportsUserIncidentReports;
}

- (void)setSupportsUserIncidentReports:(BOOL)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 4;
  *(_QWORD *)&self->_flags |= 0x40000000000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  self->_supportsUserIncidentReports = a3;
}

- (void)setHasSupportsUserIncidentReports:(BOOL)a3
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)&self->_flags + 8);
  v4 = 0x40000000000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFBFFFFFFFFFFLL | v4;
  *((_BYTE *)&self->_flags + 8) = v3 | 4;
}

- (BOOL)hasSupportsUserIncidentReports
{
  return (*(_QWORD *)&self->_flags >> 42) & 1;
}

- (BOOL)supportsAreaEventsEnhancements
{
  return self->_supportsAreaEventsEnhancements;
}

- (void)setSupportsAreaEventsEnhancements:(BOOL)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 4;
  *(_QWORD *)&self->_flags |= 0x20000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  self->_supportsAreaEventsEnhancements = a3;
}

- (void)setHasSupportsAreaEventsEnhancements:(BOOL)a3
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)&self->_flags + 8);
  v4 = 0x20000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFFDFFFFLL | v4;
  *((_BYTE *)&self->_flags + 8) = v3 | 4;
}

- (BOOL)hasSupportsAreaEventsEnhancements
{
  return (*(_QWORD *)&self->_flags >> 17) & 1;
}

- (BOOL)supportsAdvancedMap
{
  return self->_supportsAdvancedMap;
}

- (void)setSupportsAdvancedMap:(BOOL)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 4;
  *(_QWORD *)&self->_flags |= 0x10000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  self->_supportsAdvancedMap = a3;
}

- (void)setHasSupportsAdvancedMap:(BOOL)a3
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)&self->_flags + 8);
  v4 = 0x10000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFFEFFFFLL | v4;
  *((_BYTE *)&self->_flags + 8) = v3 | 4;
}

- (BOOL)hasSupportsAdvancedMap
{
  return (*(_QWORD *)&self->_flags >> 16) & 1;
}

- (BOOL)supportsSilentRouteUpdates
{
  return self->_supportsSilentRouteUpdates;
}

- (void)setSupportsSilentRouteUpdates:(BOOL)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 4;
  *(_QWORD *)&self->_flags |= 0x8000000000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  self->_supportsSilentRouteUpdates = a3;
}

- (void)setHasSupportsSilentRouteUpdates:(BOOL)a3
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)&self->_flags + 8);
  v4 = 0x8000000000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFF7FFFFFFFFFLL | v4;
  *((_BYTE *)&self->_flags + 8) = v3 | 4;
}

- (BOOL)hasSupportsSilentRouteUpdates
{
  return (*(_QWORD *)&self->_flags >> 39) & 1;
}

- (BOOL)replaceAccidentStringWithCrash
{
  return self->_replaceAccidentStringWithCrash;
}

- (void)setReplaceAccidentStringWithCrash:(BOOL)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 4;
  *(_QWORD *)&self->_flags |= 0x2000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  self->_replaceAccidentStringWithCrash = a3;
}

- (void)setHasReplaceAccidentStringWithCrash:(BOOL)a3
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)&self->_flags + 8);
  v4 = 0x2000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFDFFFLL | v4;
  *((_BYTE *)&self->_flags + 8) = v3 | 4;
}

- (BOOL)hasReplaceAccidentStringWithCrash
{
  return (*(_QWORD *)&self->_flags >> 13) & 1;
}

- (BOOL)supportsGuidanceEventPrivacyFilters
{
  return self->_supportsGuidanceEventPrivacyFilters;
}

- (void)setSupportsGuidanceEventPrivacyFilters:(BOOL)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 4;
  *(_QWORD *)&self->_flags |= 0x20000000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  self->_supportsGuidanceEventPrivacyFilters = a3;
}

- (void)setHasSupportsGuidanceEventPrivacyFilters:(BOOL)a3
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)&self->_flags + 8);
  v4 = 0x20000000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFDFFFFFFFLL | v4;
  *((_BYTE *)&self->_flags + 8) = v3 | 4;
}

- (BOOL)hasSupportsGuidanceEventPrivacyFilters
{
  return (*(_QWORD *)&self->_flags >> 29) & 1;
}

- (BOOL)supportsGuidanceEventImportanceInfo
{
  return self->_supportsGuidanceEventImportanceInfo;
}

- (void)setSupportsGuidanceEventImportanceInfo:(BOOL)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 4;
  *(_QWORD *)&self->_flags |= 0x10000000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  self->_supportsGuidanceEventImportanceInfo = a3;
}

- (void)setHasSupportsGuidanceEventImportanceInfo:(BOOL)a3
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)&self->_flags + 8);
  v4 = 0x10000000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFEFFFFFFFLL | v4;
  *((_BYTE *)&self->_flags + 8) = v3 | 4;
}

- (BOOL)hasSupportsGuidanceEventImportanceInfo
{
  return (*(_QWORD *)&self->_flags >> 28) & 1;
}

- (BOOL)isAdvancedMap
{
  return self->_isAdvancedMap;
}

- (void)setIsAdvancedMap:(BOOL)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 4;
  *(_QWORD *)&self->_flags |= 0x800uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  self->_isAdvancedMap = a3;
}

- (void)setHasIsAdvancedMap:(BOOL)a3
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)&self->_flags + 8);
  v4 = 2048;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFF7FFLL | v4;
  *((_BYTE *)&self->_flags + 8) = v3 | 4;
}

- (BOOL)hasIsAdvancedMap
{
  return (*(_QWORD *)&self->_flags >> 11) & 1;
}

- (BOOL)isGlobeProjection
{
  return self->_isGlobeProjection;
}

- (void)setIsGlobeProjection:(BOOL)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 4;
  *(_QWORD *)&self->_flags |= 0x1000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  self->_isGlobeProjection = a3;
}

- (void)setHasIsGlobeProjection:(BOOL)a3
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)&self->_flags + 8);
  v4 = 4096;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFEFFFLL | v4;
  *((_BYTE *)&self->_flags + 8) = v3 | 4;
}

- (BOOL)hasIsGlobeProjection
{
  return (*(_QWORD *)&self->_flags >> 12) & 1;
}

- (void)_readSupportsMultipointRoutings
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 232));
    if ((*(_QWORD *)(a1 + 304) & 0x2000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOClientCapabilitiesReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSupportsMultipointRoutings_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 232));
  }
}

- (unint64_t)supportsMultipointRoutingsCount
{
  -[GEOClientCapabilities _readSupportsMultipointRoutings]((uint64_t)self);
  return self->_supportsMultipointRoutings.count;
}

- (int)supportsMultipointRoutings
{
  -[GEOClientCapabilities _readSupportsMultipointRoutings]((uint64_t)self);
  return self->_supportsMultipointRoutings.list;
}

- (void)clearSupportsMultipointRoutings
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x2000000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((_BYTE *)&self->_flags + 8) |= 4u;
  PBRepeatedInt32Clear();
}

- (void)addSupportsMultipointRouting:(int)a3
{
  os_unfair_lock_s *p_readerLock;
  $C6CCB02B41CDF0B568D1AACBF6097E71 *p_flags;

  -[GEOClientCapabilities _readSupportsMultipointRoutings]((uint64_t)self);
  if (self)
    PBRepeatedInt32Add();
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  p_flags = &self->_flags;
  *(_QWORD *)p_flags |= 0x2000000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((_BYTE *)p_flags + 8) |= 4u;
}

- (int)supportsMultipointRoutingAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_supportsMultipointRoutings;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEOClientCapabilities _readSupportsMultipointRoutings]((uint64_t)self);
  p_supportsMultipointRoutings = &self->_supportsMultipointRoutings;
  count = self->_supportsMultipointRoutings.count;
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
  return p_supportsMultipointRoutings->list[a3];
}

- (void)setSupportsMultipointRoutings:(int *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x2000000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((_BYTE *)&self->_flags + 8) |= 4u;
  PBRepeatedInt32Set();
}

- (id)supportsMultipointRoutingsAsString:(int)a3
{
  if (a3 < 7)
    return off_1E1C0F170[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsSupportsMultipointRoutings:(id)a3
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

- (BOOL)supportsDefaultToNewRouteFlag
{
  return self->_supportsDefaultToNewRouteFlag;
}

- (void)setSupportsDefaultToNewRouteFlag:(BOOL)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 4;
  *(_QWORD *)&self->_flags |= 0x400000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  self->_supportsDefaultToNewRouteFlag = a3;
}

- (void)setHasSupportsDefaultToNewRouteFlag:(BOOL)a3
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)&self->_flags + 8);
  v4 = 0x400000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFBFFFFFLL | v4;
  *((_BYTE *)&self->_flags + 8) = v3 | 4;
}

- (BOOL)hasSupportsDefaultToNewRouteFlag
{
  return (*(_QWORD *)&self->_flags >> 22) & 1;
}

- (void)_readWalkingSupportedFeatures
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 232));
    if ((*(_BYTE *)(a1 + 312) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOClientCapabilitiesReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readWalkingSupportedFeatures_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 232));
  }
}

- (BOOL)hasWalkingSupportedFeatures
{
  -[GEOClientCapabilities _readWalkingSupportedFeatures]((uint64_t)self);
  return self->_walkingSupportedFeatures != 0;
}

- (GEOWalkingSupportedFeatures)walkingSupportedFeatures
{
  -[GEOClientCapabilities _readWalkingSupportedFeatures]((uint64_t)self);
  return self->_walkingSupportedFeatures;
}

- (void)setWalkingSupportedFeatures:(id)a3
{
  *((_BYTE *)&self->_flags + 8) |= 6u;
  objc_storeStrong((id *)&self->_walkingSupportedFeatures, a3);
}

- (int)maxSupportedTransitFareVersion
{
  os_unfair_lock_s *p_readerLock;
  uint64_t flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (uint64_t)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 0x10) != 0)
    return self->_maxSupportedTransitFareVersion;
  else
    return 1;
}

- (void)setMaxSupportedTransitFareVersion:(int)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 4;
  *(_QWORD *)&self->_flags |= 0x10uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  self->_maxSupportedTransitFareVersion = a3;
}

- (void)setHasMaxSupportedTransitFareVersion:(BOOL)a3
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)&self->_flags + 8);
  v4 = 16;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFFEFLL | v4;
  *((_BYTE *)&self->_flags + 8) = v3 | 4;
}

- (BOOL)hasMaxSupportedTransitFareVersion
{
  return (*(_QWORD *)&self->_flags >> 4) & 1;
}

- (id)maxSupportedTransitFareVersionAsString:(int)a3
{
  if (a3 < 3)
    return off_1E1C0F038[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsMaxSupportedTransitFareVersion:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRANSIT_FARE_SUPPORT_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRANSIT_FARE_SUPPORT_VERSION_1")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("TRANSIT_FARE_SUPPORT_VERSION_2")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)supportsDisablingProgressBarFromBannerButtons
{
  return self->_supportsDisablingProgressBarFromBannerButtons;
}

- (void)setSupportsDisablingProgressBarFromBannerButtons:(BOOL)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 4;
  *(_QWORD *)&self->_flags |= 0x800000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  self->_supportsDisablingProgressBarFromBannerButtons = a3;
}

- (void)setHasSupportsDisablingProgressBarFromBannerButtons:(BOOL)a3
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)&self->_flags + 8);
  v4 = 0x800000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFF7FFFFFLL | v4;
  *((_BYTE *)&self->_flags + 8) = v3 | 4;
}

- (BOOL)hasSupportsDisablingProgressBarFromBannerButtons
{
  return (*(_QWORD *)&self->_flags >> 23) & 1;
}

- (BOOL)supportsBannerQueuing
{
  return self->_supportsBannerQueuing;
}

- (void)setSupportsBannerQueuing:(BOOL)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 4;
  *(_QWORD *)&self->_flags |= 0x100000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  self->_supportsBannerQueuing = a3;
}

- (void)setHasSupportsBannerQueuing:(BOOL)a3
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)&self->_flags + 8);
  v4 = 0x100000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFEFFFFFLL | v4;
  *((_BYTE *)&self->_flags + 8) = v3 | 4;
}

- (BOOL)hasSupportsBannerQueuing
{
  return (*(_QWORD *)&self->_flags >> 20) & 1;
}

- (BOOL)supportsEv2
{
  return self->_supportsEv2;
}

- (void)setSupportsEv2:(BOOL)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 4;
  *(_QWORD *)&self->_flags |= 0x4000000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  self->_supportsEv2 = a3;
}

- (void)setHasSupportsEv2:(BOOL)a3
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)&self->_flags + 8);
  v4 = 0x4000000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFBFFFFFFLL | v4;
  *((_BYTE *)&self->_flags + 8) = v3 | 4;
}

- (BOOL)hasSupportsEv2
{
  return (*(_QWORD *)&self->_flags >> 26) & 1;
}

- (BOOL)supportsRouteNameRanges
{
  return self->_supportsRouteNameRanges;
}

- (void)setSupportsRouteNameRanges:(BOOL)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 4;
  *(_QWORD *)&self->_flags |= 0x4000000000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  self->_supportsRouteNameRanges = a3;
}

- (void)setHasSupportsRouteNameRanges:(BOOL)a3
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)&self->_flags + 8);
  v4 = 0x4000000000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFBFFFFFFFFFLL | v4;
  *((_BYTE *)&self->_flags + 8) = v3 | 4;
}

- (BOOL)hasSupportsRouteNameRanges
{
  return (*(_QWORD *)&self->_flags >> 38) & 1;
}

- (BOOL)supportsWalkingSuggestionsAfterParking
{
  return self->_supportsWalkingSuggestionsAfterParking;
}

- (void)setSupportsWalkingSuggestionsAfterParking:(BOOL)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 4;
  *(_QWORD *)&self->_flags |= 0x80000000000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  self->_supportsWalkingSuggestionsAfterParking = a3;
}

- (void)setHasSupportsWalkingSuggestionsAfterParking:(BOOL)a3
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)&self->_flags + 8);
  v4 = 0x80000000000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFF7FFFFFFFFFFLL | v4;
  *((_BYTE *)&self->_flags + 8) = v3 | 4;
}

- (BOOL)hasSupportsWalkingSuggestionsAfterParking
{
  return (*(_QWORD *)&self->_flags >> 43) & 1;
}

- (BOOL)supportsGenericCombinationsInstructionsForAllModes
{
  return self->_supportsGenericCombinationsInstructionsForAllModes;
}

- (void)setSupportsGenericCombinationsInstructionsForAllModes:(BOOL)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 4;
  *(_QWORD *)&self->_flags |= 0x8000000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  self->_supportsGenericCombinationsInstructionsForAllModes = a3;
}

- (void)setHasSupportsGenericCombinationsInstructionsForAllModes:(BOOL)a3
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)&self->_flags + 8);
  v4 = 0x8000000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFF7FFFFFFLL | v4;
  *((_BYTE *)&self->_flags + 8) = v3 | 4;
}

- (BOOL)hasSupportsGenericCombinationsInstructionsForAllModes
{
  return (*(_QWORD *)&self->_flags >> 27) & 1;
}

- (BOOL)supportsRouteCameraInputUpdates
{
  return self->_supportsRouteCameraInputUpdates;
}

- (void)setSupportsRouteCameraInputUpdates:(BOOL)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 4;
  *(_QWORD *)&self->_flags |= 0x2000000000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  self->_supportsRouteCameraInputUpdates = a3;
}

- (void)setHasSupportsRouteCameraInputUpdates:(BOOL)a3
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)&self->_flags + 8);
  v4 = 0x2000000000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFDFFFFFFFFFLL | v4;
  *((_BYTE *)&self->_flags + 8) = v3 | 4;
}

- (BOOL)hasSupportsRouteCameraInputUpdates
{
  return (*(_QWORD *)&self->_flags >> 37) & 1;
}

- (BOOL)supportsDodgeballCameraInput
{
  return self->_supportsDodgeballCameraInput;
}

- (void)setSupportsDodgeballCameraInput:(BOOL)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 4;
  *(_QWORD *)&self->_flags |= 0x1000000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  self->_supportsDodgeballCameraInput = a3;
}

- (void)setHasSupportsDodgeballCameraInput:(BOOL)a3
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)&self->_flags + 8);
  v4 = 0x1000000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFEFFFFFFLL | v4;
  *((_BYTE *)&self->_flags + 8) = v3 | 4;
}

- (BOOL)hasSupportsDodgeballCameraInput
{
  return (*(_QWORD *)&self->_flags >> 24) & 1;
}

- (void)_readSupportedElevationModels
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 232));
    if ((*(_QWORD *)(a1 + 304) & 0x800000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOClientCapabilitiesReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSupportedElevationModels_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 232));
  }
}

- (unint64_t)supportedElevationModelsCount
{
  -[GEOClientCapabilities _readSupportedElevationModels]((uint64_t)self);
  return self->_supportedElevationModels.count;
}

- (int)supportedElevationModels
{
  -[GEOClientCapabilities _readSupportedElevationModels]((uint64_t)self);
  return self->_supportedElevationModels.list;
}

- (void)clearSupportedElevationModels
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x800000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((_BYTE *)&self->_flags + 8) |= 4u;
  PBRepeatedInt32Clear();
}

- (void)addSupportedElevationModel:(int)a3
{
  os_unfair_lock_s *p_readerLock;
  $C6CCB02B41CDF0B568D1AACBF6097E71 *p_flags;

  -[GEOClientCapabilities _readSupportedElevationModels]((uint64_t)self);
  if (self)
    PBRepeatedInt32Add();
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  p_flags = &self->_flags;
  *(_QWORD *)p_flags |= 0x800000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((_BYTE *)p_flags + 8) |= 4u;
}

- (int)supportedElevationModelAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_supportedElevationModels;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEOClientCapabilities _readSupportedElevationModels]((uint64_t)self);
  p_supportedElevationModels = &self->_supportedElevationModels;
  count = self->_supportedElevationModels.count;
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
  return p_supportedElevationModels->list[a3];
}

- (void)setSupportedElevationModels:(int *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x800000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((_BYTE *)&self->_flags + 8) |= 4u;
  PBRepeatedInt32Set();
}

- (id)supportedElevationModelsAsString:(int)a3
{
  __CFString *v3;

  if (!a3)
    return CFSTR("ELEVATION_MODEL_EGM96");
  if (a3 == 1)
  {
    v3 = CFSTR("ELEVATION_MODEL_WGS84");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsSupportedElevationModels:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ELEVATION_MODEL_EGM96")) & 1) != 0)
    v4 = 0;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("ELEVATION_MODEL_WGS84"));

  return v4;
}

- (BOOL)supportsBannerQueuingDirections
{
  return self->_supportsBannerQueuingDirections;
}

- (void)setSupportsBannerQueuingDirections:(BOOL)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 4;
  *(_QWORD *)&self->_flags |= 0x80000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  self->_supportsBannerQueuingDirections = a3;
}

- (void)setHasSupportsBannerQueuingDirections:(BOOL)a3
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)&self->_flags + 8);
  v4 = 0x80000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFF7FFFFLL | v4;
  *((_BYTE *)&self->_flags + 8) = v3 | 4;
}

- (BOOL)hasSupportsBannerQueuingDirections
{
  return (*(_QWORD *)&self->_flags >> 19) & 1;
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
  v8.super_class = (Class)GEOClientCapabilities;
  -[GEOClientCapabilities description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOClientCapabilities dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOClientCapabilities _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  uint64_t v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  unsigned int v24;
  __CFString *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  const __CFString *v32;
  id v33;
  uint64_t v34;
  void *v35;
  void *v36;
  const __CFString *v37;
  void *v38;
  const __CFString *v39;
  uint64_t v40;
  void *v41;
  const __CFString *v42;
  void *v43;
  void *v44;
  void *v45;
  const __CFString *v46;
  void *v47;
  const __CFString *v48;
  void *v49;
  const __CFString *v50;
  id v51;
  void *v52;
  void *v53;
  void *v54;
  const __CFString *v55;
  id v56;
  void *v57;
  const __CFString *v58;
  void *v59;
  _QWORD *v60;
  unint64_t v61;
  uint64_t v62;
  __CFString *v63;
  const __CFString *v64;
  uint64_t v65;
  void *v66;
  const __CFString *v67;
  void *v68;
  void *v69;
  void *v70;
  const __CFString *v71;
  void *v72;
  const __CFString *v73;
  void *v74;
  const __CFString *v75;
  void *v76;
  const __CFString *v77;
  void *v78;
  const __CFString *v79;
  void *v80;
  const __CFString *v81;
  void *v82;
  const __CFString *v83;
  void *v84;
  const __CFString *v85;
  id v86;
  void *v87;
  const __CFString *v88;
  void *v89;
  const __CFString *v90;
  uint64_t v91;
  void *v92;
  const __CFString *v93;
  void *v94;
  _QWORD *v95;
  unint64_t v96;
  uint64_t v97;
  __CFString *v98;
  const __CFString *v99;
  void *v100;
  const __CFString *v101;
  void *v102;
  void *v103;
  void *v104;
  const __CFString *v105;
  void *v106;
  const __CFString *v107;
  void *v108;
  const __CFString *v109;
  void *v110;
  const __CFString *v111;
  void *v112;
  const __CFString *v113;
  void *v114;
  const __CFString *v115;
  void *v116;
  const __CFString *v117;
  void *v118;
  const __CFString *v119;
  void *v120;
  const __CFString *v121;
  void *v122;
  const __CFString *v123;
  void *v124;
  const __CFString *v125;
  void *v126;
  const __CFString *v127;
  id v128;
  uint64_t v129;
  void *v130;
  const __CFString *v131;
  void *v132;
  _QWORD *v133;
  unint64_t v134;
  uint64_t v135;
  __CFString *v136;
  const __CFString *v137;
  void *v138;
  const __CFString *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  id v144;
  id v145;
  id v146;
  uint64_t v148;
  __CFString *v149;
  const __CFString *v150;
  void *v151;
  const __CFString *v152;
  void *v153;
  const __CFString *v154;
  void *v155;
  const __CFString *v156;
  void *v157;
  const __CFString *v158;
  void *v159;
  const __CFString *v160;
  void *v161;
  const __CFString *v162;
  void *v163;
  const __CFString *v164;
  _QWORD v165[4];
  id v166;

  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)a1, "appMajorVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("appMajorVersion"));

  objc_msgSend((id)a1, "appMinorVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("appMinorVersion"));

  objc_msgSend((id)a1, "hardwareModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("hardwareModel"));

  objc_msgSend((id)a1, "hardwareClass");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    if (a2)
      v9 = CFSTR("hardwareClass");
    else
      v9 = CFSTR("hardware_class");
    objc_msgSend(v4, "setObject:forKey:", v8, v9);
  }

  v10 = *(_QWORD *)(a1 + 304);
  if ((v10 & 2) != 0)
  {
    v11 = CFSTR("NO_TURN");
    switch(*(_DWORD *)(a1 + 240))
    {
      case 0:
        break;
      case 1:
        v11 = CFSTR("LEFT_TURN");
        break;
      case 2:
        v11 = CFSTR("RIGHT_TURN");
        break;
      case 3:
        v11 = CFSTR("STRAIGHT_AHEAD");
        break;
      case 4:
        v11 = CFSTR("U_TURN");
        break;
      case 5:
        v11 = CFSTR("FOLLOW_ROAD");
        break;
      case 6:
        v11 = CFSTR("ENTER_ROUNDABOUT");
        break;
      case 7:
        v11 = CFSTR("EXIT_ROUNDABOUT");
        break;
      case 0xB:
        v11 = CFSTR("OFF_RAMP");
        break;
      case 0xC:
        v11 = CFSTR("ON_RAMP");
        break;
      case 0x10:
        v11 = CFSTR("ARRIVE_END_OF_NAVIGATION");
        break;
      case 0x11:
        v11 = CFSTR("START_ROUTE");
        break;
      case 0x12:
        v11 = CFSTR("ARRIVE_AT_DESTINATION");
        break;
      case 0x14:
        v11 = CFSTR("KEEP_LEFT");
        break;
      case 0x15:
        v11 = CFSTR("KEEP_RIGHT");
        break;
      case 0x16:
        v11 = CFSTR("ENTER_FERRY");
        break;
      case 0x17:
        v11 = CFSTR("EXIT_FERRY");
        break;
      case 0x18:
        v11 = CFSTR("CHANGE_FERRY");
        break;
      case 0x19:
        v11 = CFSTR("START_ROUTE_WITH_U_TURN");
        break;
      case 0x1A:
        v11 = CFSTR("U_TURN_AT_ROUNDABOUT");
        break;
      case 0x1B:
        v11 = CFSTR("LEFT_TURN_AT_END");
        break;
      case 0x1C:
        v11 = CFSTR("RIGHT_TURN_AT_END");
        break;
      case 0x1D:
        v11 = CFSTR("HIGHWAY_OFF_RAMP_LEFT");
        break;
      case 0x1E:
        v11 = CFSTR("HIGHWAY_OFF_RAMP_RIGHT");
        break;
      case 0x21:
        v11 = CFSTR("ARRIVE_AT_DESTINATION_LEFT");
        break;
      case 0x22:
        v11 = CFSTR("ARRIVE_AT_DESTINATION_RIGHT");
        break;
      case 0x23:
        v11 = CFSTR("U_TURN_WHEN_POSSIBLE");
        break;
      case 0x27:
        v11 = CFSTR("ARRIVE_END_OF_DIRECTIONS");
        break;
      case 0x29:
        v11 = CFSTR("ROUNDABOUT_EXIT_1");
        break;
      case 0x2A:
        v11 = CFSTR("ROUNDABOUT_EXIT_2");
        break;
      case 0x2B:
        v11 = CFSTR("ROUNDABOUT_EXIT_3");
        break;
      case 0x2C:
        v11 = CFSTR("ROUNDABOUT_EXIT_4");
        break;
      case 0x2D:
        v11 = CFSTR("ROUNDABOUT_EXIT_5");
        break;
      case 0x2E:
        v11 = CFSTR("ROUNDABOUT_EXIT_6");
        break;
      case 0x2F:
        v11 = CFSTR("ROUNDABOUT_EXIT_7");
        break;
      case 0x30:
        v11 = CFSTR("ROUNDABOUT_EXIT_8");
        break;
      case 0x31:
        v11 = CFSTR("ROUNDABOUT_EXIT_9");
        break;
      case 0x32:
        v11 = CFSTR("ROUNDABOUT_EXIT_10");
        break;
      case 0x33:
        v11 = CFSTR("ROUNDABOUT_EXIT_11");
        break;
      case 0x34:
        v11 = CFSTR("ROUNDABOUT_EXIT_12");
        break;
      case 0x35:
        v11 = CFSTR("ROUNDABOUT_EXIT_13");
        break;
      case 0x36:
        v11 = CFSTR("ROUNDABOUT_EXIT_14");
        break;
      case 0x37:
        v11 = CFSTR("ROUNDABOUT_EXIT_15");
        break;
      case 0x38:
        v11 = CFSTR("ROUNDABOUT_EXIT_16");
        break;
      case 0x39:
        v11 = CFSTR("ROUNDABOUT_EXIT_17");
        break;
      case 0x3A:
        v11 = CFSTR("ROUNDABOUT_EXIT_18");
        break;
      case 0x3B:
        v11 = CFSTR("ROUNDABOUT_EXIT_19");
        break;
      case 0x3C:
        v11 = CFSTR("SHARP_LEFT_TURN");
        break;
      case 0x3D:
        v11 = CFSTR("SHARP_RIGHT_TURN");
        break;
      case 0x3E:
        v11 = CFSTR("SLIGHT_LEFT_TURN");
        break;
      case 0x3F:
        v11 = CFSTR("SLIGHT_RIGHT_TURN");
        break;
      case 0x40:
        v11 = CFSTR("CHANGE_HIGHWAY");
        break;
      case 0x41:
        v11 = CFSTR("CHANGE_HIGHWAY_LEFT");
        break;
      case 0x42:
        v11 = CFSTR("CHANGE_HIGHWAY_RIGHT");
        break;
      case 0x50:
        v11 = CFSTR("TOLL_STATION");
        break;
      case 0x51:
        v11 = CFSTR("ENTER_TUNNEL");
        break;
      case 0x52:
        v11 = CFSTR("WAYPOINT_STOP");
        break;
      case 0x53:
        v11 = CFSTR("WAYPOINT_STOP_LEFT");
        break;
      case 0x54:
        v11 = CFSTR("WAYPOINT_STOP_RIGHT");
        break;
      case 0x55:
        v11 = CFSTR("RESUME_ROUTE");
        break;
      case 0x56:
        v11 = CFSTR("RESUME_ROUTE_WITH_U_TURN");
        break;
      case 0x57:
        v11 = CFSTR("CUSTOM");
        break;
      case 0x58:
        v11 = CFSTR("TURN_AROUND");
        break;
      default:
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 240));
        v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
        break;
    }
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("maxManeuverTypeSupported"));

    v10 = *(_QWORD *)(a1 + 304);
  }
  if ((v10 & 0x200) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 266));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("internalInstall"));

    v10 = *(_QWORD *)(a1 + 304);
  }
  if ((v10 & 0x400) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 267));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("internalTool"));

  }
  if (*(_QWORD *)(a1 + 144))
  {
    objc_msgSend((id)a1, "displayLanguages");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("displayLanguages"));

  }
  objc_msgSend((id)a1, "displayRegion");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
    objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("displayRegion"));

  v16 = *(_QWORD *)(a1 + 304);
  if ((v16 & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 248));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v20, CFSTR("maxTrafficSpeedSupported"));

    v16 = *(_QWORD *)(a1 + 304);
    if ((v16 & 4) == 0)
    {
LABEL_89:
      if ((v16 & 1) == 0)
        goto LABEL_91;
      goto LABEL_90;
    }
  }
  else if ((v16 & 4) == 0)
  {
    goto LABEL_89;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 244));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v21, CFSTR("maxRouteIncidentSupported"));

  if ((*(_QWORD *)(a1 + 304) & 1) != 0)
  {
LABEL_90:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 236));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v17, CFSTR("maxFormatterSupported"));

  }
LABEL_91:
  objc_msgSend((id)a1, "deviceCountryCode");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
    objc_msgSend(v4, "setObject:forKey:", v18, CFSTR("deviceCountryCode"));

  v19 = *(_QWORD *)(a1 + 304);
  if ((v19 & 0x80) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 264));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v22, CFSTR("clusteredTransitRoutesSupported"));

    v19 = *(_QWORD *)(a1 + 304);
    if ((v19 & 0x4000) == 0)
    {
LABEL_95:
      if ((v19 & 0x40) == 0)
        goto LABEL_106;
      goto LABEL_102;
    }
  }
  else if ((v19 & 0x4000) == 0)
  {
    goto LABEL_95;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 271));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v23, CFSTR("routeOptionsSupported"));

  if ((*(_QWORD *)(a1 + 304) & 0x40) == 0)
    goto LABEL_106;
LABEL_102:
  v24 = *(_DWORD *)(a1 + 260) - 1;
  if (v24 >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 260));
    v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v25 = off_1E1C0EFE8[v24];
  }
  objc_msgSend(v4, "setObject:forKey:", v25, CFSTR("transitMarketSupport"));

LABEL_106:
  objc_msgSend((id)a1, "formattedStringClientCapabilities");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v26;
  if (v26)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v26, "jsonRepresentation");
    else
      objc_msgSend(v26, "dictionaryRepresentation");
    v28 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKey:", v28, CFSTR("formattedStringClientCapabilities"));
  }

  objc_msgSend((id)a1, "advisoryClientCapabilities");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v29;
  if (v29)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v29, "jsonRepresentation");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = CFSTR("advisoryClientCapabilities");
    }
    else
    {
      objc_msgSend(v29, "dictionaryRepresentation");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = CFSTR("advisory_client_capabilities");
    }
    v33 = v31;

    objc_msgSend(v4, "setObject:forKey:", v33, v32);
  }

  v34 = *(_QWORD *)(a1 + 304);
  if ((v34 & 0x8000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 272));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v35, CFSTR("snapToClosestStopSupported"));

    v34 = *(_QWORD *)(a1 + 304);
  }
  if ((v34 & 0x100) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 265));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v37 = CFSTR("includeCrossLanguagePhonetics");
    else
      v37 = CFSTR("include_cross_language_phonetics");
    objc_msgSend(v4, "setObject:forKey:", v36, v37);

  }
  objc_msgSend((id)a1, "userCurrentTimezone");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  if (v38)
  {
    if (a2)
      v39 = CFSTR("userCurrentTimezone");
    else
      v39 = CFSTR("user_current_timezone");
    objc_msgSend(v4, "setObject:forKey:", v38, v39);
  }

  v40 = *(_QWORD *)(a1 + 304);
  if ((v40 & 0x400000000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 291));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v48 = CFSTR("supportsLongShieldStrings");
    else
      v48 = CFSTR("supports_long_shield_strings");
    objc_msgSend(v4, "setObject:forKey:", v47, v48);

    v40 = *(_QWORD *)(a1 + 304);
    if ((v40 & 0x80000000) == 0)
    {
LABEL_130:
      if ((v40 & 0x40000000) == 0)
        goto LABEL_135;
      goto LABEL_131;
    }
  }
  else if ((v40 & 0x80000000) == 0)
  {
    goto LABEL_130;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 288));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v50 = CFSTR("supportsGuidanceEvents");
  else
    v50 = CFSTR("supports_guidance_events");
  objc_msgSend(v4, "setObject:forKey:", v49, v50);

  if ((*(_QWORD *)(a1 + 304) & 0x40000000) != 0)
  {
LABEL_131:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 287));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v42 = CFSTR("supportsGuidanceEventsInlineShields");
    else
      v42 = CFSTR("supports_guidance_events_inline_shields");
    objc_msgSend(v4, "setObject:forKey:", v41, v42);

  }
LABEL_135:
  objc_msgSend((id)a1, "abAssignInfo");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = v43;
  if (v43)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v43, "jsonRepresentation");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = CFSTR("abAssignInfo");
    }
    else
    {
      objc_msgSend(v43, "dictionaryRepresentation");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = CFSTR("ab_assign_info");
    }
    v51 = v45;

    objc_msgSend(v4, "setObject:forKey:", v51, v46);
  }

  objc_msgSend((id)a1, "requestTime");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = v52;
  if (v52)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v52, "jsonRepresentation");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = CFSTR("requestTime");
    }
    else
    {
      objc_msgSend(v52, "dictionaryRepresentation");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = CFSTR("request_time");
    }
    v56 = v54;

    objc_msgSend(v4, "setObject:forKey:", v56, v55);
  }

  if ((*(_QWORD *)(a1 + 304) & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 256));
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v58 = CFSTR("maxZilchMessageVersionSupported");
    else
      v58 = CFSTR("max_zilch_message_version_supported");
    objc_msgSend(v4, "setObject:forKey:", v57, v58);

  }
  if (*(_QWORD *)(a1 + 56))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = (_QWORD *)(a1 + 48);
    if (*(_QWORD *)(a1 + 56))
    {
      v61 = 0;
      do
      {
        v62 = *(int *)(*v60 + 4 * v61);
        if (v62 >= 7)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v62);
          v63 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v63 = off_1E1C0F000[v62];
        }
        objc_msgSend(v59, "addObject:", v63);

        ++v61;
        v60 = (_QWORD *)(a1 + 48);
      }
      while (v61 < *(_QWORD *)(a1 + 56));
    }
    if (a2)
      v64 = CFSTR("supportedTransitFeature");
    else
      v64 = CFSTR("supported_transit_feature");
    objc_msgSend(v4, "setObject:forKey:", v59, v64);

  }
  v65 = *(_QWORD *)(a1 + 304);
  if ((v65 & 0x40000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 275));
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v73 = CFSTR("supportsArrivalMapRegion");
    else
      v73 = CFSTR("supports_arrival_map_region");
    objc_msgSend(v4, "setObject:forKey:", v72, v73);

    v65 = *(_QWORD *)(a1 + 304);
    if ((v65 & 0x800000000) == 0)
    {
LABEL_172:
      if ((v65 & 0x100000000) == 0)
        goto LABEL_173;
      goto LABEL_193;
    }
  }
  else if ((v65 & 0x800000000) == 0)
  {
    goto LABEL_172;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 292));
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v75 = CFSTR("supportsNaturalGuidance");
  else
    v75 = CFSTR("supports_natural_guidance");
  objc_msgSend(v4, "setObject:forKey:", v74, v75);

  v65 = *(_QWORD *)(a1 + 304);
  if ((v65 & 0x100000000) == 0)
  {
LABEL_173:
    if ((v65 & 0x200000) == 0)
      goto LABEL_174;
    goto LABEL_197;
  }
LABEL_193:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 289));
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v77 = CFSTR("supportsJunctionView");
  else
    v77 = CFSTR("supports_junction_view");
  objc_msgSend(v4, "setObject:forKey:", v76, v77);

  v65 = *(_QWORD *)(a1 + 304);
  if ((v65 & 0x200000) == 0)
  {
LABEL_174:
    if ((v65 & 0x200000000) == 0)
      goto LABEL_175;
    goto LABEL_201;
  }
LABEL_197:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 278));
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v79 = CFSTR("supportsCongestionZones");
  else
    v79 = CFSTR("supports_congestion_zones");
  objc_msgSend(v4, "setObject:forKey:", v78, v79);

  v65 = *(_QWORD *)(a1 + 304);
  if ((v65 & 0x200000000) == 0)
  {
LABEL_175:
    if ((v65 & 0x2000000) == 0)
      goto LABEL_176;
    goto LABEL_205;
  }
LABEL_201:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 290));
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v81 = CFSTR("supportsLicensePlateRestrictions");
  else
    v81 = CFSTR("supports_license_plate_restrictions");
  objc_msgSend(v4, "setObject:forKey:", v80, v81);

  v65 = *(_QWORD *)(a1 + 304);
  if ((v65 & 0x2000000) == 0)
  {
LABEL_176:
    if ((v65 & 0x20000000000) == 0)
      goto LABEL_177;
    goto LABEL_209;
  }
LABEL_205:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 282));
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v83 = CFSTR("supportsElectricVehicleRoutes");
  else
    v83 = CFSTR("supports_electric_vehicle_routes");
  objc_msgSend(v4, "setObject:forKey:", v82, v83);

  v65 = *(_QWORD *)(a1 + 304);
  if ((v65 & 0x20000000000) == 0)
  {
LABEL_177:
    if ((v65 & 0x100000000000) == 0)
      goto LABEL_182;
    goto LABEL_178;
  }
LABEL_209:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 298));
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v85 = CFSTR("supportsTrafficCameras");
  else
    v85 = CFSTR("supports_traffic_cameras");
  objc_msgSend(v4, "setObject:forKey:", v84, v85);

  if ((*(_QWORD *)(a1 + 304) & 0x100000000000) != 0)
  {
LABEL_178:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 301));
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v67 = CFSTR("supportsWaypointRoutes");
    else
      v67 = CFSTR("supports_waypoint_routes");
    objc_msgSend(v4, "setObject:forKey:", v66, v67);

  }
LABEL_182:
  objc_msgSend((id)a1, "localizationCapabilities");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = v68;
  if (v68)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v68, "jsonRepresentation");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      v71 = CFSTR("localizationCapabilities");
    }
    else
    {
      objc_msgSend(v68, "dictionaryRepresentation");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      v71 = CFSTR("localization_capabilities");
    }
    v86 = v70;

    objc_msgSend(v4, "setObject:forKey:", v86, v71);
  }

  objc_msgSend((id)a1, "deviceSku");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  if (v87)
  {
    if (a2)
      v88 = CFSTR("deviceSku");
    else
      v88 = CFSTR("device_sku");
    objc_msgSend(v4, "setObject:forKey:", v87, v88);
  }

  objc_msgSend((id)a1, "osVersion");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  if (v89)
  {
    if (a2)
      v90 = CFSTR("osVersion");
    else
      v90 = CFSTR("os_version");
    objc_msgSend(v4, "setObject:forKey:", v89, v90);
  }

  v91 = *(_QWORD *)(a1 + 304);
  if ((v91 & 0x200000000000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 302));
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v107 = CFSTR("willSendEvDirectionsFeedback");
    else
      v107 = CFSTR("will_send_ev_directions_feedback");
    objc_msgSend(v4, "setObject:forKey:", v106, v107);

    v91 = *(_QWORD *)(a1 + 304);
    if ((v91 & 0x1000000000) == 0)
    {
LABEL_228:
      if ((v91 & 0x10000000000) == 0)
        goto LABEL_229;
      goto LABEL_269;
    }
  }
  else if ((v91 & 0x1000000000) == 0)
  {
    goto LABEL_228;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 293));
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v109 = CFSTR("supportsRoadComplexities");
  else
    v109 = CFSTR("supports_road_complexities");
  objc_msgSend(v4, "setObject:forKey:", v108, v109);

  v91 = *(_QWORD *)(a1 + 304);
  if ((v91 & 0x10000000000) == 0)
  {
LABEL_229:
    if ((v91 & 0x40000000000) == 0)
      goto LABEL_230;
    goto LABEL_273;
  }
LABEL_269:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 297));
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v111 = CFSTR("supportsSpeedTrapAnnouncements");
  else
    v111 = CFSTR("supports_speed_trap_announcements");
  objc_msgSend(v4, "setObject:forKey:", v110, v111);

  v91 = *(_QWORD *)(a1 + 304);
  if ((v91 & 0x40000000000) == 0)
  {
LABEL_230:
    if ((v91 & 0x20000) == 0)
      goto LABEL_231;
    goto LABEL_277;
  }
LABEL_273:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 299));
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v113 = CFSTR("supportsUserIncidentReports");
  else
    v113 = CFSTR("supports_user_incident_reports");
  objc_msgSend(v4, "setObject:forKey:", v112, v113);

  v91 = *(_QWORD *)(a1 + 304);
  if ((v91 & 0x20000) == 0)
  {
LABEL_231:
    if ((v91 & 0x10000) == 0)
      goto LABEL_232;
    goto LABEL_281;
  }
LABEL_277:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 274));
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v115 = CFSTR("supportsAreaEventsEnhancements");
  else
    v115 = CFSTR("supports_area_events_enhancements");
  objc_msgSend(v4, "setObject:forKey:", v114, v115);

  v91 = *(_QWORD *)(a1 + 304);
  if ((v91 & 0x10000) == 0)
  {
LABEL_232:
    if ((v91 & 0x8000000000) == 0)
      goto LABEL_233;
    goto LABEL_285;
  }
LABEL_281:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 273));
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v117 = CFSTR("supportsAdvancedMap");
  else
    v117 = CFSTR("supports_advanced_map");
  objc_msgSend(v4, "setObject:forKey:", v116, v117);

  v91 = *(_QWORD *)(a1 + 304);
  if ((v91 & 0x8000000000) == 0)
  {
LABEL_233:
    if ((v91 & 0x2000) == 0)
      goto LABEL_234;
    goto LABEL_289;
  }
LABEL_285:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 296));
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v119 = CFSTR("supportsSilentRouteUpdates");
  else
    v119 = CFSTR("supports_silent_route_updates");
  objc_msgSend(v4, "setObject:forKey:", v118, v119);

  v91 = *(_QWORD *)(a1 + 304);
  if ((v91 & 0x2000) == 0)
  {
LABEL_234:
    if ((v91 & 0x20000000) == 0)
      goto LABEL_235;
    goto LABEL_293;
  }
LABEL_289:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 270));
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v121 = CFSTR("replaceAccidentStringWithCrash");
  else
    v121 = CFSTR("replace_accident_string_with_crash");
  objc_msgSend(v4, "setObject:forKey:", v120, v121);

  v91 = *(_QWORD *)(a1 + 304);
  if ((v91 & 0x20000000) == 0)
  {
LABEL_235:
    if ((v91 & 0x10000000) == 0)
      goto LABEL_236;
    goto LABEL_297;
  }
LABEL_293:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 286));
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v123 = CFSTR("supportsGuidanceEventPrivacyFilters");
  else
    v123 = CFSTR("supports_guidance_event_privacy_filters");
  objc_msgSend(v4, "setObject:forKey:", v122, v123);

  v91 = *(_QWORD *)(a1 + 304);
  if ((v91 & 0x10000000) == 0)
  {
LABEL_236:
    if ((v91 & 0x800) == 0)
      goto LABEL_237;
    goto LABEL_301;
  }
LABEL_297:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 285));
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v125 = CFSTR("supportsGuidanceEventImportanceInfo");
  else
    v125 = CFSTR("supports_guidance_event_importance_info");
  objc_msgSend(v4, "setObject:forKey:", v124, v125);

  v91 = *(_QWORD *)(a1 + 304);
  if ((v91 & 0x800) == 0)
  {
LABEL_237:
    if ((v91 & 0x1000) == 0)
      goto LABEL_242;
    goto LABEL_238;
  }
LABEL_301:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 268));
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v127 = CFSTR("isAdvancedMap");
  else
    v127 = CFSTR("is_advanced_map");
  objc_msgSend(v4, "setObject:forKey:", v126, v127);

  if ((*(_QWORD *)(a1 + 304) & 0x1000) != 0)
  {
LABEL_238:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 269));
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v93 = CFSTR("isGlobeProjection");
    else
      v93 = CFSTR("is_globe_projection");
    objc_msgSend(v4, "setObject:forKey:", v92, v93);

  }
LABEL_242:
  if (*(_QWORD *)(a1 + 80))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    v95 = (_QWORD *)(a1 + 72);
    if (*(_QWORD *)(a1 + 80))
    {
      v96 = 0;
      do
      {
        v97 = *(int *)(*v95 + 4 * v96);
        if (v97 >= 7)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v97);
          v98 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v98 = off_1E1C0F170[v97];
        }
        objc_msgSend(v94, "addObject:", v98);

        ++v96;
        v95 = (_QWORD *)(a1 + 72);
      }
      while (v96 < *(_QWORD *)(a1 + 80));
    }
    if (a2)
      v99 = CFSTR("supportsMultipointRouting");
    else
      v99 = CFSTR("supports_multipoint_routing");
    objc_msgSend(v4, "setObject:forKey:", v94, v99);

  }
  if ((*(_QWORD *)(a1 + 304) & 0x400000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 279));
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v101 = CFSTR("supportsDefaultToNewRouteFlag");
    else
      v101 = CFSTR("supports_default_to_new_route_flag");
    objc_msgSend(v4, "setObject:forKey:", v100, v101);

  }
  objc_msgSend((id)a1, "walkingSupportedFeatures");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  v103 = v102;
  if (v102)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v102, "jsonRepresentation");
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      v105 = CFSTR("walkingSupportedFeatures");
    }
    else
    {
      objc_msgSend(v102, "dictionaryRepresentation");
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      v105 = CFSTR("walking_supported_features");
    }
    v128 = v104;

    objc_msgSend(v4, "setObject:forKey:", v128, v105);
  }

  v129 = *(_QWORD *)(a1 + 304);
  if ((v129 & 0x10) != 0)
  {
    v148 = *(int *)(a1 + 252);
    if (v148 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 252));
      v149 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v149 = off_1E1C0F038[v148];
    }
    if (a2)
      v150 = CFSTR("maxSupportedTransitFareVersion");
    else
      v150 = CFSTR("max_supported_transit_fare_version");
    objc_msgSend(v4, "setObject:forKey:", v149, v150);

    v129 = *(_QWORD *)(a1 + 304);
    if ((v129 & 0x800000) == 0)
    {
LABEL_310:
      if ((v129 & 0x100000) == 0)
        goto LABEL_311;
      goto LABEL_355;
    }
  }
  else if ((v129 & 0x800000) == 0)
  {
    goto LABEL_310;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 280));
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v152 = CFSTR("supportsDisablingProgressBarFromBannerButtons");
  else
    v152 = CFSTR("supports_disabling_progress_bar_from_banner_buttons");
  objc_msgSend(v4, "setObject:forKey:", v151, v152);

  v129 = *(_QWORD *)(a1 + 304);
  if ((v129 & 0x100000) == 0)
  {
LABEL_311:
    if ((v129 & 0x4000000) == 0)
      goto LABEL_312;
    goto LABEL_359;
  }
LABEL_355:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 277));
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v154 = CFSTR("supportsBannerQueuing");
  else
    v154 = CFSTR("supports_banner_queuing");
  objc_msgSend(v4, "setObject:forKey:", v153, v154);

  v129 = *(_QWORD *)(a1 + 304);
  if ((v129 & 0x4000000) == 0)
  {
LABEL_312:
    if ((v129 & 0x4000000000) == 0)
      goto LABEL_313;
    goto LABEL_363;
  }
LABEL_359:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 283));
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v156 = CFSTR("supportsEv2");
  else
    v156 = CFSTR("supports_ev_2");
  objc_msgSend(v4, "setObject:forKey:", v155, v156);

  v129 = *(_QWORD *)(a1 + 304);
  if ((v129 & 0x4000000000) == 0)
  {
LABEL_313:
    if ((v129 & 0x80000000000) == 0)
      goto LABEL_314;
    goto LABEL_367;
  }
LABEL_363:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 295));
  v157 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v158 = CFSTR("supportsRouteNameRanges");
  else
    v158 = CFSTR("supports_route_name_ranges");
  objc_msgSend(v4, "setObject:forKey:", v157, v158);

  v129 = *(_QWORD *)(a1 + 304);
  if ((v129 & 0x80000000000) == 0)
  {
LABEL_314:
    if ((v129 & 0x8000000) == 0)
      goto LABEL_315;
    goto LABEL_371;
  }
LABEL_367:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 300));
  v159 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v160 = CFSTR("supportsWalkingSuggestionsAfterParking");
  else
    v160 = CFSTR("supports_walking_suggestions_after_parking");
  objc_msgSend(v4, "setObject:forKey:", v159, v160);

  v129 = *(_QWORD *)(a1 + 304);
  if ((v129 & 0x8000000) == 0)
  {
LABEL_315:
    if ((v129 & 0x2000000000) == 0)
      goto LABEL_316;
LABEL_375:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 294));
    v163 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v164 = CFSTR("supportsRouteCameraInputUpdates");
    else
      v164 = CFSTR("supports_route_camera_input_updates");
    objc_msgSend(v4, "setObject:forKey:", v163, v164);

    if ((*(_QWORD *)(a1 + 304) & 0x1000000) == 0)
      goto LABEL_321;
    goto LABEL_317;
  }
LABEL_371:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 284));
  v161 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v162 = CFSTR("supportsGenericCombinationsInstructionsForAllModes");
  else
    v162 = CFSTR("supports_generic_combinations_instructions_for_all_modes");
  objc_msgSend(v4, "setObject:forKey:", v161, v162);

  v129 = *(_QWORD *)(a1 + 304);
  if ((v129 & 0x2000000000) != 0)
    goto LABEL_375;
LABEL_316:
  if ((v129 & 0x1000000) != 0)
  {
LABEL_317:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 281));
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v131 = CFSTR("supportsDodgeballCameraInput");
    else
      v131 = CFSTR("supports_dodgeball_camera_input");
    objc_msgSend(v4, "setObject:forKey:", v130, v131);

  }
LABEL_321:
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    v133 = (_QWORD *)(a1 + 24);
    if (*(_QWORD *)(a1 + 32))
    {
      v134 = 0;
      do
      {
        v135 = *(unsigned int *)(*v133 + 4 * v134);
        if ((_DWORD)v135)
        {
          if ((_DWORD)v135 == 1)
          {
            v136 = CFSTR("ELEVATION_MODEL_WGS84");
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v135);
            v136 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
        }
        else
        {
          v136 = CFSTR("ELEVATION_MODEL_EGM96");
        }
        objc_msgSend(v132, "addObject:", v136);

        ++v134;
        v133 = (_QWORD *)(a1 + 24);
      }
      while (v134 < *(_QWORD *)(a1 + 32));
    }
    if (a2)
      v137 = CFSTR("supportedElevationModel");
    else
      v137 = CFSTR("supported_elevation_model");
    objc_msgSend(v4, "setObject:forKey:", v132, v137);

  }
  if ((*(_QWORD *)(a1 + 304) & 0x80000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 276));
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v139 = CFSTR("supportsBannerQueuingDirections");
    else
      v139 = CFSTR("supports_banner_queuing_directions");
    objc_msgSend(v4, "setObject:forKey:", v138, v139);

  }
  v140 = *(void **)(a1 + 16);
  if (v140)
  {
    objc_msgSend(v140, "dictionaryRepresentation");
    v141 = (void *)objc_claimAutoreleasedReturnValue();
    v142 = v141;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v141, "count"));
      v143 = (void *)objc_claimAutoreleasedReturnValue();
      v165[0] = MEMORY[0x1E0C809B0];
      v165[1] = 3221225472;
      v165[2] = __51__GEOClientCapabilities__dictionaryRepresentation___block_invoke;
      v165[3] = &unk_1E1C00600;
      v144 = v143;
      v166 = v144;
      objc_msgSend(v142, "enumerateKeysAndObjectsUsingBlock:", v165);
      v145 = v144;

      v142 = v145;
    }
    objc_msgSend(v4, "setObject:forKey:", v142, CFSTR("Unknown Fields"));

  }
  v146 = v4;

  return v146;
}

- (id)jsonRepresentation
{
  return -[GEOClientCapabilities _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __51__GEOClientCapabilities__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOClientCapabilities)initWithDictionary:(id)a3
{
  return (GEOClientCapabilities *)-[GEOClientCapabilities _initWithDictionary:isJSON:](self, a3, 0);
}

- (id)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  uint64_t v40;
  void *v41;
  GEOFormattedStringClientCapabilities *v42;
  uint64_t v43;
  void *v44;
  const __CFString *v45;
  void *v46;
  GEOAdvisoryClientCapabilities *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  const __CFString *v51;
  void *v52;
  const __CFString *v53;
  void *v54;
  void *v55;
  const __CFString *v56;
  void *v57;
  const __CFString *v58;
  void *v59;
  const __CFString *v60;
  void *v61;
  const __CFString *v62;
  void *v63;
  GEOAbAssignInfo *v64;
  uint64_t v65;
  void *v66;
  const __CFString *v67;
  void *v68;
  GEOLocalTime *v69;
  uint64_t v70;
  void *v71;
  const __CFString *v72;
  void *v73;
  const __CFString *v74;
  void *v75;
  id v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t j;
  void *v81;
  id v82;
  uint64_t v83;
  const __CFString *v84;
  void *v85;
  const __CFString *v86;
  void *v87;
  const __CFString *v88;
  void *v89;
  const __CFString *v90;
  void *v91;
  const __CFString *v92;
  void *v93;
  const __CFString *v94;
  void *v95;
  const __CFString *v96;
  void *v97;
  const __CFString *v98;
  void *v99;
  const __CFString *v100;
  void *v101;
  GEOLocalizationCapabilities *v102;
  uint64_t v103;
  void *v104;
  const __CFString *v105;
  void *v106;
  void *v107;
  const __CFString *v108;
  void *v109;
  void *v110;
  const __CFString *v111;
  void *v112;
  const __CFString *v113;
  void *v114;
  const __CFString *v115;
  void *v116;
  const __CFString *v117;
  void *v118;
  const __CFString *v119;
  void *v120;
  const __CFString *v121;
  void *v122;
  const __CFString *v123;
  void *v124;
  const __CFString *v125;
  void *v126;
  const __CFString *v127;
  void *v128;
  const __CFString *v129;
  void *v130;
  const __CFString *v131;
  void *v132;
  const __CFString *v133;
  void *v134;
  const __CFString *v135;
  void *v136;
  id v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t k;
  void *v142;
  id v143;
  uint64_t v144;
  const __CFString *v145;
  void *v146;
  const __CFString *v147;
  void *v148;
  GEOWalkingSupportedFeatures *v149;
  uint64_t v150;
  void *v151;
  const __CFString *v152;
  void *v153;
  id v154;
  uint64_t v155;
  const __CFString *v156;
  void *v157;
  const __CFString *v158;
  void *v159;
  const __CFString *v160;
  void *v161;
  const __CFString *v162;
  void *v163;
  const __CFString *v164;
  void *v165;
  const __CFString *v166;
  void *v167;
  const __CFString *v168;
  void *v169;
  const __CFString *v170;
  void *v171;
  const __CFString *v172;
  void *v173;
  id v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t m;
  void *v179;
  id v180;
  uint64_t v181;
  const __CFString *v182;
  void *v183;
  void *v185;
  void *v186;
  void *v187;
  int v188;
  id v189;
  __int128 v190;
  __int128 v191;
  __int128 v192;
  __int128 v193;
  __int128 v194;
  __int128 v195;
  __int128 v196;
  __int128 v197;
  __int128 v198;
  __int128 v199;
  __int128 v200;
  __int128 v201;
  __int128 v202;
  __int128 v203;
  __int128 v204;
  __int128 v205;
  _BYTE v206[128];
  _BYTE v207[128];
  _BYTE v208[128];
  _BYTE v209[128];
  uint64_t v210;

  v210 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (!a1)
    goto LABEL_525;
  v6 = (id)objc_msgSend(a1, "init");

  if (!v6)
  {
    a1 = 0;
    goto LABEL_525;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("appMajorVersion"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(v6, "setAppMajorVersion:", v8);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("appMinorVersion"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = (void *)objc_msgSend(v9, "copy");
    objc_msgSend(v6, "setAppMinorVersion:", v10);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("hardwareModel"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12 = (void *)objc_msgSend(v11, "copy");
    objc_msgSend(v6, "setHardwareModel:", v12);

  }
  if (a3)
    v13 = CFSTR("hardwareClass");
  else
    v13 = CFSTR("hardware_class");
  objc_msgSend(v5, "objectForKeyedSubscript:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v15 = (void *)objc_msgSend(v14, "copy");
    objc_msgSend(v6, "setHardwareClass:", v15);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("maxManeuverTypeSupported"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v189 = v5;
  v188 = a3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v17 = v16;
    if ((objc_msgSend(v17, "isEqualToString:", CFSTR("NO_TURN")) & 1) != 0)
    {
      v18 = 0;
    }
    else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("LEFT_TURN")) & 1) != 0)
    {
      v18 = 1;
    }
    else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("RIGHT_TURN")) & 1) != 0)
    {
      v18 = 2;
    }
    else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("STRAIGHT_AHEAD")) & 1) != 0)
    {
      v18 = 3;
    }
    else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("U_TURN")) & 1) != 0)
    {
      v18 = 4;
    }
    else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("FOLLOW_ROAD")) & 1) != 0)
    {
      v18 = 5;
    }
    else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("ENTER_ROUNDABOUT")) & 1) != 0)
    {
      v18 = 6;
    }
    else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("EXIT_ROUNDABOUT")) & 1) != 0)
    {
      v18 = 7;
    }
    else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("OFF_RAMP")) & 1) != 0)
    {
      v18 = 11;
    }
    else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("ON_RAMP")) & 1) != 0)
    {
      v18 = 12;
    }
    else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("ARRIVE_END_OF_NAVIGATION")) & 1) != 0)
    {
      v18 = 16;
    }
    else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("START_ROUTE")) & 1) != 0)
    {
      v18 = 17;
    }
    else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("ARRIVE_AT_DESTINATION")) & 1) != 0)
    {
      v18 = 18;
    }
    else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("KEEP_LEFT")) & 1) != 0)
    {
      v18 = 20;
    }
    else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("KEEP_RIGHT")) & 1) != 0)
    {
      v18 = 21;
    }
    else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("ENTER_FERRY")) & 1) != 0)
    {
      v18 = 22;
    }
    else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("EXIT_FERRY")) & 1) != 0)
    {
      v18 = 23;
    }
    else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("CHANGE_FERRY")) & 1) != 0)
    {
      v18 = 24;
    }
    else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("START_ROUTE_WITH_U_TURN")) & 1) != 0)
    {
      v18 = 25;
    }
    else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("U_TURN_AT_ROUNDABOUT")) & 1) != 0)
    {
      v18 = 26;
    }
    else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("LEFT_TURN_AT_END")) & 1) != 0)
    {
      v18 = 27;
    }
    else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("RIGHT_TURN_AT_END")) & 1) != 0)
    {
      v18 = 28;
    }
    else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("HIGHWAY_OFF_RAMP_LEFT")) & 1) != 0)
    {
      v18 = 29;
    }
    else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("HIGHWAY_OFF_RAMP_RIGHT")) & 1) != 0)
    {
      v18 = 30;
    }
    else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("ARRIVE_AT_DESTINATION_LEFT")) & 1) != 0)
    {
      v18 = 33;
    }
    else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("ARRIVE_AT_DESTINATION_RIGHT")) & 1) != 0)
    {
      v18 = 34;
    }
    else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("U_TURN_WHEN_POSSIBLE")) & 1) != 0)
    {
      v18 = 35;
    }
    else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("ARRIVE_END_OF_DIRECTIONS")) & 1) != 0)
    {
      v18 = 39;
    }
    else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_1")) & 1) != 0)
    {
      v18 = 41;
    }
    else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_2")) & 1) != 0)
    {
      v18 = 42;
    }
    else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_3")) & 1) != 0)
    {
      v18 = 43;
    }
    else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_4")) & 1) != 0)
    {
      v18 = 44;
    }
    else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_5")) & 1) != 0)
    {
      v18 = 45;
    }
    else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_6")) & 1) != 0)
    {
      v18 = 46;
    }
    else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_7")) & 1) != 0)
    {
      v18 = 47;
    }
    else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_8")) & 1) != 0)
    {
      v18 = 48;
    }
    else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_9")) & 1) != 0)
    {
      v18 = 49;
    }
    else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_10")) & 1) != 0)
    {
      v18 = 50;
    }
    else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_11")) & 1) != 0)
    {
      v18 = 51;
    }
    else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_12")) & 1) != 0)
    {
      v18 = 52;
    }
    else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_13")) & 1) != 0)
    {
      v18 = 53;
    }
    else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_14")) & 1) != 0)
    {
      v18 = 54;
    }
    else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_15")) & 1) != 0)
    {
      v18 = 55;
    }
    else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_16")) & 1) != 0)
    {
      v18 = 56;
    }
    else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_17")) & 1) != 0)
    {
      v18 = 57;
    }
    else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_18")) & 1) != 0)
    {
      v18 = 58;
    }
    else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("ROUNDABOUT_EXIT_19")) & 1) != 0)
    {
      v18 = 59;
    }
    else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("SHARP_LEFT_TURN")) & 1) != 0)
    {
      v18 = 60;
    }
    else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("SHARP_RIGHT_TURN")) & 1) != 0)
    {
      v18 = 61;
    }
    else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("SLIGHT_LEFT_TURN")) & 1) != 0)
    {
      v18 = 62;
    }
    else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("SLIGHT_RIGHT_TURN")) & 1) != 0)
    {
      v18 = 63;
    }
    else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("CHANGE_HIGHWAY")) & 1) != 0)
    {
      v18 = 64;
    }
    else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("CHANGE_HIGHWAY_LEFT")) & 1) != 0)
    {
      v18 = 65;
    }
    else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("CHANGE_HIGHWAY_RIGHT")) & 1) != 0)
    {
      v18 = 66;
    }
    else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("TOLL_STATION")) & 1) != 0)
    {
      v18 = 80;
    }
    else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("ENTER_TUNNEL")) & 1) != 0)
    {
      v18 = 81;
    }
    else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("WAYPOINT_STOP")) & 1) != 0)
    {
      v18 = 82;
    }
    else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("WAYPOINT_STOP_LEFT")) & 1) != 0)
    {
      v18 = 83;
    }
    else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("WAYPOINT_STOP_RIGHT")) & 1) != 0)
    {
      v18 = 84;
    }
    else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("RESUME_ROUTE")) & 1) != 0)
    {
      v18 = 85;
    }
    else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("RESUME_ROUTE_WITH_U_TURN")) & 1) != 0)
    {
      v18 = 86;
    }
    else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("CUSTOM")) & 1) != 0)
    {
      v18 = 87;
    }
    else if (objc_msgSend(v17, "isEqualToString:", CFSTR("TURN_AROUND")))
    {
      v18 = 88;
    }
    else
    {
      v18 = 0;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_147;
    v18 = objc_msgSend(v16, "intValue");
  }
  objc_msgSend(v6, "setMaxManeuverTypeSupported:", v18);
LABEL_147:

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("internalInstall"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setInternalInstall:", objc_msgSend(v19, "BOOLValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("internalTool"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setInternalTool:", objc_msgSend(v20, "BOOLValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("displayLanguages"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v204 = 0u;
    v205 = 0u;
    v202 = 0u;
    v203 = 0u;
    v22 = v21;
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v202, v209, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v203;
      do
      {
        for (i = 0; i != v24; ++i)
        {
          if (*(_QWORD *)v203 != v25)
            objc_enumerationMutation(v22);
          v27 = *(void **)(*((_QWORD *)&v202 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v28 = (void *)objc_msgSend(v27, "copy");
            objc_msgSend(v6, "addDisplayLanguages:", v28);

          }
        }
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v202, v209, 16);
      }
      while (v24);
    }

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("displayRegion"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v30 = (void *)objc_msgSend(v29, "copy");
    objc_msgSend(v6, "setDisplayRegion:", v30);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("maxTrafficSpeedSupported"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setMaxTrafficSpeedSupported:", objc_msgSend(v31, "unsignedIntValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("maxRouteIncidentSupported"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setMaxRouteIncidentSupported:", objc_msgSend(v32, "intValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("maxFormatterSupported"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setMaxFormatterSupported:", objc_msgSend(v33, "intValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("deviceCountryCode"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v35 = (void *)objc_msgSend(v34, "copy");
    objc_msgSend(v6, "setDeviceCountryCode:", v35);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("clusteredTransitRoutesSupported"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setClusteredTransitRoutesSupported:", objc_msgSend(v36, "BOOLValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("routeOptionsSupported"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setRouteOptionsSupported:", objc_msgSend(v37, "BOOLValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("transitMarketSupport"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v39 = v38;
    if ((objc_msgSend(v39, "isEqualToString:", CFSTR("VERSION_1")) & 1) != 0)
    {
      v40 = 1;
    }
    else if ((objc_msgSend(v39, "isEqualToString:", CFSTR("VERSION_2")) & 1) != 0)
    {
      v40 = 2;
    }
    else if (objc_msgSend(v39, "isEqualToString:", CFSTR("VERSION_3")))
    {
      v40 = 3;
    }
    else
    {
      v40 = 1;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_188;
    v40 = objc_msgSend(v38, "intValue");
  }
  objc_msgSend(v6, "setTransitMarketSupport:", v40);
LABEL_188:

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("formattedStringClientCapabilities"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v42 = [GEOFormattedStringClientCapabilities alloc];
    if ((a3 & 1) != 0)
      v43 = -[GEOFormattedStringClientCapabilities initWithJSON:](v42, "initWithJSON:", v41);
    else
      v43 = -[GEOFormattedStringClientCapabilities initWithDictionary:](v42, "initWithDictionary:", v41);
    v44 = (void *)v43;
    objc_msgSend(v6, "setFormattedStringClientCapabilities:", v43);

  }
  if (a3)
    v45 = CFSTR("advisoryClientCapabilities");
  else
    v45 = CFSTR("advisory_client_capabilities");
  objc_msgSend(v5, "objectForKeyedSubscript:", v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v47 = [GEOAdvisoryClientCapabilities alloc];
    if ((a3 & 1) != 0)
      v48 = -[GEOAdvisoryClientCapabilities initWithJSON:](v47, "initWithJSON:", v46);
    else
      v48 = -[GEOAdvisoryClientCapabilities initWithDictionary:](v47, "initWithDictionary:", v46);
    v49 = (void *)v48;
    objc_msgSend(v6, "setAdvisoryClientCapabilities:", v48);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("snapToClosestStopSupported"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setSnapToClosestStopSupported:", objc_msgSend(v50, "BOOLValue"));

  if (a3)
    v51 = CFSTR("includeCrossLanguagePhonetics");
  else
    v51 = CFSTR("include_cross_language_phonetics");
  objc_msgSend(v5, "objectForKeyedSubscript:", v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setIncludeCrossLanguagePhonetics:", objc_msgSend(v52, "BOOLValue"));

  if (a3)
    v53 = CFSTR("userCurrentTimezone");
  else
    v53 = CFSTR("user_current_timezone");
  objc_msgSend(v5, "objectForKeyedSubscript:", v53);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v55 = (void *)objc_msgSend(v54, "copy");
    objc_msgSend(v6, "setUserCurrentTimezone:", v55);

  }
  if (a3)
    v56 = CFSTR("supportsLongShieldStrings");
  else
    v56 = CFSTR("supports_long_shield_strings");
  objc_msgSend(v5, "objectForKeyedSubscript:", v56);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setSupportsLongShieldStrings:", objc_msgSend(v57, "BOOLValue"));

  if (a3)
    v58 = CFSTR("supportsGuidanceEvents");
  else
    v58 = CFSTR("supports_guidance_events");
  objc_msgSend(v5, "objectForKeyedSubscript:", v58);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setSupportsGuidanceEvents:", objc_msgSend(v59, "BOOLValue"));

  if (a3)
    v60 = CFSTR("supportsGuidanceEventsInlineShields");
  else
    v60 = CFSTR("supports_guidance_events_inline_shields");
  objc_msgSend(v5, "objectForKeyedSubscript:", v60);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setSupportsGuidanceEventsInlineShields:", objc_msgSend(v61, "BOOLValue"));

  if (a3)
    v62 = CFSTR("abAssignInfo");
  else
    v62 = CFSTR("ab_assign_info");
  objc_msgSend(v5, "objectForKeyedSubscript:", v62);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v64 = [GEOAbAssignInfo alloc];
    if ((a3 & 1) != 0)
      v65 = -[GEOAbAssignInfo initWithJSON:](v64, "initWithJSON:", v63);
    else
      v65 = -[GEOAbAssignInfo initWithDictionary:](v64, "initWithDictionary:", v63);
    v66 = (void *)v65;
    objc_msgSend(v6, "setAbAssignInfo:", v65);

  }
  if (a3)
    v67 = CFSTR("requestTime");
  else
    v67 = CFSTR("request_time");
  objc_msgSend(v5, "objectForKeyedSubscript:", v67);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v69 = [GEOLocalTime alloc];
    if ((a3 & 1) != 0)
      v70 = -[GEOLocalTime initWithJSON:](v69, "initWithJSON:", v68);
    else
      v70 = -[GEOLocalTime initWithDictionary:](v69, "initWithDictionary:", v68);
    v71 = (void *)v70;
    objc_msgSend(v6, "setRequestTime:", v70);

  }
  if (a3)
    v72 = CFSTR("maxZilchMessageVersionSupported");
  else
    v72 = CFSTR("max_zilch_message_version_supported");
  objc_msgSend(v5, "objectForKeyedSubscript:", v72);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setMaxZilchMessageVersionSupported:", objc_msgSend(v73, "unsignedIntValue"));

  if (a3)
    v74 = CFSTR("supportedTransitFeature");
  else
    v74 = CFSTR("supported_transit_feature");
  objc_msgSend(v5, "objectForKeyedSubscript:", v74);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v200 = 0u;
    v201 = 0u;
    v198 = 0u;
    v199 = 0u;
    v185 = v75;
    v76 = v75;
    v77 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v198, v208, 16);
    if (!v77)
      goto LABEL_280;
    v78 = v77;
    v79 = *(_QWORD *)v199;
    while (1)
    {
      for (j = 0; j != v78; ++j)
      {
        if (*(_QWORD *)v199 != v79)
          objc_enumerationMutation(v76);
        v81 = *(void **)(*((_QWORD *)&v198 + 1) + 8 * j);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v82 = v81;
          if ((objc_msgSend(v82, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
          {
            v83 = 0;
          }
          else if ((objc_msgSend(v82, "isEqualToString:", CFSTR("TEXT_IN_PLANNING_ARTWORK")) & 1) != 0)
          {
            v83 = 1;
          }
          else if ((objc_msgSend(v82, "isEqualToString:", CFSTR("GOTO_STOP_IN_TRANSFERS")) & 1) != 0)
          {
            v83 = 2;
          }
          else if ((objc_msgSend(v82, "isEqualToString:", CFSTR("LIST_INSTRUCTION_TIME_TEXT")) & 1) != 0)
          {
            v83 = 3;
          }
          else if ((objc_msgSend(v82, "isEqualToString:", CFSTR("ENHANCED_GUIDANCE_2021")) & 1) != 0)
          {
            v83 = 4;
          }
          else if ((objc_msgSend(v82, "isEqualToString:", CFSTR("PAYMENT_METHOD_SUGGESTIONS")) & 1) != 0)
          {
            v83 = 5;
          }
          else if (objc_msgSend(v82, "isEqualToString:", CFSTR("TICKETING_URLS")))
          {
            v83 = 6;
          }
          else
          {
            v83 = 0;
          }

        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            continue;
          v83 = objc_msgSend(v81, "intValue");
        }
        objc_msgSend(v6, "addSupportedTransitFeature:", v83);
      }
      v78 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v198, v208, 16);
      if (!v78)
      {
LABEL_280:

        v5 = v189;
        a3 = v188;
        v75 = v185;
        break;
      }
    }
  }

  if (a3)
    v84 = CFSTR("supportsArrivalMapRegion");
  else
    v84 = CFSTR("supports_arrival_map_region");
  objc_msgSend(v5, "objectForKeyedSubscript:", v84);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setSupportsArrivalMapRegion:", objc_msgSend(v85, "BOOLValue"));

  if (a3)
    v86 = CFSTR("supportsNaturalGuidance");
  else
    v86 = CFSTR("supports_natural_guidance");
  objc_msgSend(v5, "objectForKeyedSubscript:", v86);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setSupportsNaturalGuidance:", objc_msgSend(v87, "BOOLValue"));

  if (a3)
    v88 = CFSTR("supportsJunctionView");
  else
    v88 = CFSTR("supports_junction_view");
  objc_msgSend(v5, "objectForKeyedSubscript:", v88);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setSupportsJunctionView:", objc_msgSend(v89, "BOOLValue"));

  if (a3)
    v90 = CFSTR("supportsCongestionZones");
  else
    v90 = CFSTR("supports_congestion_zones");
  objc_msgSend(v5, "objectForKeyedSubscript:", v90);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setSupportsCongestionZones:", objc_msgSend(v91, "BOOLValue"));

  if (a3)
    v92 = CFSTR("supportsLicensePlateRestrictions");
  else
    v92 = CFSTR("supports_license_plate_restrictions");
  objc_msgSend(v5, "objectForKeyedSubscript:", v92);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setSupportsLicensePlateRestrictions:", objc_msgSend(v93, "BOOLValue"));

  if (a3)
    v94 = CFSTR("supportsElectricVehicleRoutes");
  else
    v94 = CFSTR("supports_electric_vehicle_routes");
  objc_msgSend(v5, "objectForKeyedSubscript:", v94);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setSupportsElectricVehicleRoutes:", objc_msgSend(v95, "BOOLValue"));

  if (a3)
    v96 = CFSTR("supportsTrafficCameras");
  else
    v96 = CFSTR("supports_traffic_cameras");
  objc_msgSend(v5, "objectForKeyedSubscript:", v96);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setSupportsTrafficCameras:", objc_msgSend(v97, "BOOLValue"));

  if (a3)
    v98 = CFSTR("supportsWaypointRoutes");
  else
    v98 = CFSTR("supports_waypoint_routes");
  objc_msgSend(v5, "objectForKeyedSubscript:", v98);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setSupportsWaypointRoutes:", objc_msgSend(v99, "BOOLValue"));

  if (a3)
    v100 = CFSTR("localizationCapabilities");
  else
    v100 = CFSTR("localization_capabilities");
  objc_msgSend(v5, "objectForKeyedSubscript:", v100);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v102 = [GEOLocalizationCapabilities alloc];
    if ((a3 & 1) != 0)
      v103 = -[GEOLocalizationCapabilities initWithJSON:](v102, "initWithJSON:", v101);
    else
      v103 = -[GEOLocalizationCapabilities initWithDictionary:](v102, "initWithDictionary:", v101);
    v104 = (void *)v103;
    objc_msgSend(v6, "setLocalizationCapabilities:", v103);

  }
  if (a3)
    v105 = CFSTR("deviceSku");
  else
    v105 = CFSTR("device_sku");
  objc_msgSend(v5, "objectForKeyedSubscript:", v105);
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v107 = (void *)objc_msgSend(v106, "copy");
    objc_msgSend(v6, "setDeviceSku:", v107);

  }
  if (a3)
    v108 = CFSTR("osVersion");
  else
    v108 = CFSTR("os_version");
  objc_msgSend(v5, "objectForKeyedSubscript:", v108);
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v110 = (void *)objc_msgSend(v109, "copy");
    objc_msgSend(v6, "setOsVersion:", v110);

  }
  if (a3)
    v111 = CFSTR("willSendEvDirectionsFeedback");
  else
    v111 = CFSTR("will_send_ev_directions_feedback");
  objc_msgSend(v5, "objectForKeyedSubscript:", v111);
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setWillSendEvDirectionsFeedback:", objc_msgSend(v112, "BOOLValue"));

  if (a3)
    v113 = CFSTR("supportsRoadComplexities");
  else
    v113 = CFSTR("supports_road_complexities");
  objc_msgSend(v5, "objectForKeyedSubscript:", v113);
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setSupportsRoadComplexities:", objc_msgSend(v114, "BOOLValue"));

  if (a3)
    v115 = CFSTR("supportsSpeedTrapAnnouncements");
  else
    v115 = CFSTR("supports_speed_trap_announcements");
  objc_msgSend(v5, "objectForKeyedSubscript:", v115);
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setSupportsSpeedTrapAnnouncements:", objc_msgSend(v116, "BOOLValue"));

  if (a3)
    v117 = CFSTR("supportsUserIncidentReports");
  else
    v117 = CFSTR("supports_user_incident_reports");
  objc_msgSend(v5, "objectForKeyedSubscript:", v117);
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setSupportsUserIncidentReports:", objc_msgSend(v118, "BOOLValue"));

  if (a3)
    v119 = CFSTR("supportsAreaEventsEnhancements");
  else
    v119 = CFSTR("supports_area_events_enhancements");
  objc_msgSend(v5, "objectForKeyedSubscript:", v119);
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setSupportsAreaEventsEnhancements:", objc_msgSend(v120, "BOOLValue"));

  if (a3)
    v121 = CFSTR("supportsAdvancedMap");
  else
    v121 = CFSTR("supports_advanced_map");
  objc_msgSend(v5, "objectForKeyedSubscript:", v121);
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setSupportsAdvancedMap:", objc_msgSend(v122, "BOOLValue"));

  if (a3)
    v123 = CFSTR("supportsSilentRouteUpdates");
  else
    v123 = CFSTR("supports_silent_route_updates");
  objc_msgSend(v5, "objectForKeyedSubscript:", v123);
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setSupportsSilentRouteUpdates:", objc_msgSend(v124, "BOOLValue"));

  if (a3)
    v125 = CFSTR("replaceAccidentStringWithCrash");
  else
    v125 = CFSTR("replace_accident_string_with_crash");
  objc_msgSend(v5, "objectForKeyedSubscript:", v125);
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setReplaceAccidentStringWithCrash:", objc_msgSend(v126, "BOOLValue"));

  if (a3)
    v127 = CFSTR("supportsGuidanceEventPrivacyFilters");
  else
    v127 = CFSTR("supports_guidance_event_privacy_filters");
  objc_msgSend(v5, "objectForKeyedSubscript:", v127);
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setSupportsGuidanceEventPrivacyFilters:", objc_msgSend(v128, "BOOLValue"));

  if (a3)
    v129 = CFSTR("supportsGuidanceEventImportanceInfo");
  else
    v129 = CFSTR("supports_guidance_event_importance_info");
  objc_msgSend(v5, "objectForKeyedSubscript:", v129);
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setSupportsGuidanceEventImportanceInfo:", objc_msgSend(v130, "BOOLValue"));

  if (a3)
    v131 = CFSTR("isAdvancedMap");
  else
    v131 = CFSTR("is_advanced_map");
  objc_msgSend(v5, "objectForKeyedSubscript:", v131);
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setIsAdvancedMap:", objc_msgSend(v132, "BOOLValue"));

  if (a3)
    v133 = CFSTR("isGlobeProjection");
  else
    v133 = CFSTR("is_globe_projection");
  objc_msgSend(v5, "objectForKeyedSubscript:", v133);
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setIsGlobeProjection:", objc_msgSend(v134, "BOOLValue"));

  if (a3)
    v135 = CFSTR("supportsMultipointRouting");
  else
    v135 = CFSTR("supports_multipoint_routing");
  objc_msgSend(v5, "objectForKeyedSubscript:", v135);
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v196 = 0u;
    v197 = 0u;
    v194 = 0u;
    v195 = 0u;
    v186 = v136;
    v137 = v136;
    v138 = objc_msgSend(v137, "countByEnumeratingWithState:objects:count:", &v194, v207, 16);
    if (!v138)
      goto LABEL_430;
    v139 = v138;
    v140 = *(_QWORD *)v195;
    while (1)
    {
      for (k = 0; k != v139; ++k)
      {
        if (*(_QWORD *)v195 != v140)
          objc_enumerationMutation(v137);
        v142 = *(void **)(*((_QWORD *)&v194 + 1) + 8 * k);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v143 = v142;
          if ((objc_msgSend(v143, "isEqualToString:", CFSTR("AUTOMOBILE")) & 1) != 0)
          {
            v144 = 0;
          }
          else if ((objc_msgSend(v143, "isEqualToString:", CFSTR("TRANSIT")) & 1) != 0)
          {
            v144 = 1;
          }
          else if ((objc_msgSend(v143, "isEqualToString:", CFSTR("WALKING")) & 1) != 0)
          {
            v144 = 2;
          }
          else if ((objc_msgSend(v143, "isEqualToString:", CFSTR("BICYCLE")) & 1) != 0)
          {
            v144 = 3;
          }
          else if ((objc_msgSend(v143, "isEqualToString:", CFSTR("UNKNOWN_TRANSPORT_TYPE")) & 1) != 0)
          {
            v144 = 4;
          }
          else if ((objc_msgSend(v143, "isEqualToString:", CFSTR("FERRY")) & 1) != 0)
          {
            v144 = 5;
          }
          else if (objc_msgSend(v143, "isEqualToString:", CFSTR("RIDESHARE")))
          {
            v144 = 6;
          }
          else
          {
            v144 = 0;
          }

        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            continue;
          v144 = objc_msgSend(v142, "intValue");
        }
        objc_msgSend(v6, "addSupportsMultipointRouting:", v144);
      }
      v139 = objc_msgSend(v137, "countByEnumeratingWithState:objects:count:", &v194, v207, 16);
      if (!v139)
      {
LABEL_430:

        v5 = v189;
        a3 = v188;
        v136 = v186;
        break;
      }
    }
  }

  if (a3)
    v145 = CFSTR("supportsDefaultToNewRouteFlag");
  else
    v145 = CFSTR("supports_default_to_new_route_flag");
  objc_msgSend(v5, "objectForKeyedSubscript:", v145);
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setSupportsDefaultToNewRouteFlag:", objc_msgSend(v146, "BOOLValue"));

  if (a3)
    v147 = CFSTR("walkingSupportedFeatures");
  else
    v147 = CFSTR("walking_supported_features");
  objc_msgSend(v5, "objectForKeyedSubscript:", v147);
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v149 = [GEOWalkingSupportedFeatures alloc];
    if ((a3 & 1) != 0)
      v150 = -[GEOWalkingSupportedFeatures initWithJSON:](v149, "initWithJSON:", v148);
    else
      v150 = -[GEOWalkingSupportedFeatures initWithDictionary:](v149, "initWithDictionary:", v148);
    v151 = (void *)v150;
    objc_msgSend(v6, "setWalkingSupportedFeatures:", v150);

  }
  if (a3)
    v152 = CFSTR("maxSupportedTransitFareVersion");
  else
    v152 = CFSTR("max_supported_transit_fare_version");
  objc_msgSend(v5, "objectForKeyedSubscript:", v152);
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v154 = v153;
    if ((objc_msgSend(v154, "isEqualToString:", CFSTR("TRANSIT_FARE_SUPPORT_UNKNOWN")) & 1) != 0)
    {
      v155 = 0;
    }
    else if ((objc_msgSend(v154, "isEqualToString:", CFSTR("TRANSIT_FARE_SUPPORT_VERSION_1")) & 1) != 0)
    {
      v155 = 1;
    }
    else if (objc_msgSend(v154, "isEqualToString:", CFSTR("TRANSIT_FARE_SUPPORT_VERSION_2")))
    {
      v155 = 2;
    }
    else
    {
      v155 = 0;
    }

    goto LABEL_458;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v155 = objc_msgSend(v153, "intValue");
LABEL_458:
    objc_msgSend(v6, "setMaxSupportedTransitFareVersion:", v155);
  }

  if (a3)
    v156 = CFSTR("supportsDisablingProgressBarFromBannerButtons");
  else
    v156 = CFSTR("supports_disabling_progress_bar_from_banner_buttons");
  objc_msgSend(v5, "objectForKeyedSubscript:", v156);
  v157 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setSupportsDisablingProgressBarFromBannerButtons:", objc_msgSend(v157, "BOOLValue"));

  if (a3)
    v158 = CFSTR("supportsBannerQueuing");
  else
    v158 = CFSTR("supports_banner_queuing");
  objc_msgSend(v5, "objectForKeyedSubscript:", v158);
  v159 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setSupportsBannerQueuing:", objc_msgSend(v159, "BOOLValue"));

  if (a3)
    v160 = CFSTR("supportsEv2");
  else
    v160 = CFSTR("supports_ev_2");
  objc_msgSend(v5, "objectForKeyedSubscript:", v160);
  v161 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setSupportsEv2:", objc_msgSend(v161, "BOOLValue"));

  if (a3)
    v162 = CFSTR("supportsRouteNameRanges");
  else
    v162 = CFSTR("supports_route_name_ranges");
  objc_msgSend(v5, "objectForKeyedSubscript:", v162);
  v163 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setSupportsRouteNameRanges:", objc_msgSend(v163, "BOOLValue"));

  if (a3)
    v164 = CFSTR("supportsWalkingSuggestionsAfterParking");
  else
    v164 = CFSTR("supports_walking_suggestions_after_parking");
  objc_msgSend(v5, "objectForKeyedSubscript:", v164);
  v165 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setSupportsWalkingSuggestionsAfterParking:", objc_msgSend(v165, "BOOLValue"));

  if (a3)
    v166 = CFSTR("supportsGenericCombinationsInstructionsForAllModes");
  else
    v166 = CFSTR("supports_generic_combinations_instructions_for_all_modes");
  objc_msgSend(v5, "objectForKeyedSubscript:", v166);
  v167 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setSupportsGenericCombinationsInstructionsForAllModes:", objc_msgSend(v167, "BOOLValue"));

  if (a3)
    v168 = CFSTR("supportsRouteCameraInputUpdates");
  else
    v168 = CFSTR("supports_route_camera_input_updates");
  objc_msgSend(v5, "objectForKeyedSubscript:", v168);
  v169 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setSupportsRouteCameraInputUpdates:", objc_msgSend(v169, "BOOLValue"));

  if (a3)
    v170 = CFSTR("supportsDodgeballCameraInput");
  else
    v170 = CFSTR("supports_dodgeball_camera_input");
  objc_msgSend(v5, "objectForKeyedSubscript:", v170);
  v171 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setSupportsDodgeballCameraInput:", objc_msgSend(v171, "BOOLValue"));

  if (a3)
    v172 = CFSTR("supportedElevationModel");
  else
    v172 = CFSTR("supported_elevation_model");
  objc_msgSend(v5, "objectForKeyedSubscript:", v172);
  v173 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v192 = 0u;
    v193 = 0u;
    v190 = 0u;
    v191 = 0u;
    v187 = v173;
    v174 = v173;
    v175 = objc_msgSend(v174, "countByEnumeratingWithState:objects:count:", &v190, v206, 16);
    if (!v175)
      goto LABEL_518;
    v176 = v175;
    v177 = *(_QWORD *)v191;
    while (1)
    {
      for (m = 0; m != v176; ++m)
      {
        if (*(_QWORD *)v191 != v177)
          objc_enumerationMutation(v174);
        v179 = *(void **)(*((_QWORD *)&v190 + 1) + 8 * m);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v180 = v179;
          if ((objc_msgSend(v180, "isEqualToString:", CFSTR("ELEVATION_MODEL_EGM96")) & 1) != 0)
            v181 = 0;
          else
            v181 = objc_msgSend(v180, "isEqualToString:", CFSTR("ELEVATION_MODEL_WGS84"));

        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            continue;
          v181 = objc_msgSend(v179, "intValue");
        }
        objc_msgSend(v6, "addSupportedElevationModel:", v181);
      }
      v176 = objc_msgSend(v174, "countByEnumeratingWithState:objects:count:", &v190, v206, 16);
      if (!v176)
      {
LABEL_518:

        v5 = v189;
        a3 = v188;
        v173 = v187;
        break;
      }
    }
  }

  if (a3)
    v182 = CFSTR("supportsBannerQueuingDirections");
  else
    v182 = CFSTR("supports_banner_queuing_directions");
  objc_msgSend(v5, "objectForKeyedSubscript:", v182);
  v183 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setSupportsBannerQueuingDirections:", objc_msgSend(v183, "BOOLValue"));

  a1 = v6;
LABEL_525:

  return a1;
}

- (GEOClientCapabilities)initWithJSON:(id)a3
{
  return (GEOClientCapabilities *)-[GEOClientCapabilities _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_698;
    else
      v8 = (int *)&readAll__nonRecursiveTag_699;
    GEOClientCapabilitiesReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEOClientCapabilitiesCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOClientCapabilitiesIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOClientCapabilitiesReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  $C6CCB02B41CDF0B568D1AACBF6097E71 *p_flags;
  uint64_t flags;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  PBDataReader *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader)
  {
    os_unfair_lock_assert_owner(&self->_readerLock);
    if (!(*(_QWORD *)&self->_flags & 0xFFFF800000000000 | *((_BYTE *)&self->_flags + 8) & 7))
    {
      v22 = self->_reader;
      objc_sync_enter(v22);
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "writeData:", v23);
      os_unfair_lock_unlock(p_readerLock);

      objc_sync_exit(v22);
      goto LABEL_144;
    }
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOClientCapabilities readAll:](self, "readAll:", 0);
  if (self->_appMajorVersion)
    PBDataWriterWriteStringField();
  if (self->_appMinorVersion)
    PBDataWriterWriteStringField();
  if (self->_hardwareModel)
    PBDataWriterWriteStringField();
  if (self->_hardwareClass)
    PBDataWriterWriteStringField();
  p_flags = &self->_flags;
  flags = (uint64_t)self->_flags;
  if ((flags & 2) == 0)
  {
    if ((flags & 0x200) == 0)
      goto LABEL_13;
LABEL_141:
    PBDataWriterWriteBOOLField();
    if ((*(_QWORD *)&self->_flags & 0x400) == 0)
      goto LABEL_15;
    goto LABEL_14;
  }
  PBDataWriterWriteInt32Field();
  flags = *(_QWORD *)p_flags;
  if ((*(_QWORD *)p_flags & 0x200) != 0)
    goto LABEL_141;
LABEL_13:
  if ((flags & 0x400) != 0)
LABEL_14:
    PBDataWriterWriteBOOLField();
LABEL_15:
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v8 = self->_displayLanguages;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v25 != v10)
          objc_enumerationMutation(v8);
        PBDataWriterWriteStringField();
      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v9);
  }

  if (self->_displayRegion)
    PBDataWriterWriteStringField();
  v12 = (uint64_t)self->_flags;
  if ((v12 & 8) != 0)
  {
    PBDataWriterWriteUint32Field();
    v12 = (uint64_t)self->_flags;
  }
  if ((v12 & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    v12 = (uint64_t)self->_flags;
  }
  if ((v12 & 1) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_deviceCountryCode)
    PBDataWriterWriteStringField();
  v13 = (uint64_t)self->_flags;
  if ((v13 & 0x80) != 0)
  {
    PBDataWriterWriteBOOLField();
    v13 = (uint64_t)self->_flags;
  }
  if ((v13 & 0x4000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v13 = (uint64_t)self->_flags;
  }
  if ((v13 & 0x40) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_formattedStringClientCapabilities)
    PBDataWriterWriteSubmessage();
  if (self->_advisoryClientCapabilities)
    PBDataWriterWriteSubmessage();
  v14 = (uint64_t)self->_flags;
  if ((v14 & 0x8000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v14 = (uint64_t)self->_flags;
  }
  if ((v14 & 0x100) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_userCurrentTimezone)
    PBDataWriterWriteStringField();
  v15 = (uint64_t)self->_flags;
  if ((v15 & 0x400000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v15 = (uint64_t)self->_flags;
  }
  if ((v15 & 0x80000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v15 = (uint64_t)self->_flags;
  }
  if ((v15 & 0x40000000) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_abAssignInfo)
    PBDataWriterWriteSubmessage();
  if (self->_requestTime)
    PBDataWriterWriteSubmessage();
  if ((*(_QWORD *)&self->_flags & 0x20) != 0)
    PBDataWriterWriteUint32Field();
  if (self->_supportedTransitFeatures.count)
  {
    v16 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v16;
    }
    while (v16 < self->_supportedTransitFeatures.count);
  }
  v17 = (uint64_t)self->_flags;
  if ((v17 & 0x40000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v17 = (uint64_t)self->_flags;
  }
  if ((v17 & 0x800000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v17 = (uint64_t)self->_flags;
  }
  if ((v17 & 0x100000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v17 = (uint64_t)self->_flags;
  }
  if ((v17 & 0x200000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v17 = (uint64_t)self->_flags;
  }
  if ((v17 & 0x200000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v17 = (uint64_t)self->_flags;
  }
  if ((v17 & 0x2000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v17 = (uint64_t)self->_flags;
  }
  if ((v17 & 0x20000000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v17 = (uint64_t)self->_flags;
  }
  if ((v17 & 0x100000000000) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_localizationCapabilities)
    PBDataWriterWriteSubmessage();
  if (self->_deviceSku)
    PBDataWriterWriteStringField();
  if (self->_osVersion)
    PBDataWriterWriteStringField();
  v18 = (uint64_t)self->_flags;
  if ((v18 & 0x200000000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v18 = (uint64_t)self->_flags;
  }
  if ((v18 & 0x1000000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v18 = (uint64_t)self->_flags;
  }
  if ((v18 & 0x10000000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v18 = (uint64_t)self->_flags;
  }
  if ((v18 & 0x40000000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v18 = (uint64_t)self->_flags;
  }
  if ((v18 & 0x20000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v18 = (uint64_t)self->_flags;
  }
  if ((v18 & 0x10000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v18 = (uint64_t)self->_flags;
  }
  if ((v18 & 0x8000000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v18 = (uint64_t)self->_flags;
  }
  if ((v18 & 0x2000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v18 = (uint64_t)self->_flags;
  }
  if ((v18 & 0x20000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v18 = (uint64_t)self->_flags;
  }
  if ((v18 & 0x10000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v18 = (uint64_t)self->_flags;
  }
  if ((v18 & 0x800) != 0)
  {
    PBDataWriterWriteBOOLField();
    v18 = (uint64_t)self->_flags;
  }
  if ((v18 & 0x1000) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_supportsMultipointRoutings.count)
  {
    v19 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v19;
    }
    while (v19 < self->_supportsMultipointRoutings.count);
  }
  if ((*(_QWORD *)&self->_flags & 0x400000) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_walkingSupportedFeatures)
    PBDataWriterWriteSubmessage();
  v20 = (uint64_t)self->_flags;
  if ((v20 & 0x10) != 0)
  {
    PBDataWriterWriteInt32Field();
    v20 = (uint64_t)self->_flags;
  }
  if ((v20 & 0x800000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v20 = (uint64_t)self->_flags;
  }
  if ((v20 & 0x100000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v20 = (uint64_t)self->_flags;
  }
  if ((v20 & 0x4000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v20 = (uint64_t)self->_flags;
  }
  if ((v20 & 0x4000000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v20 = (uint64_t)self->_flags;
  }
  if ((v20 & 0x80000000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v20 = (uint64_t)self->_flags;
  }
  if ((v20 & 0x8000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v20 = (uint64_t)self->_flags;
  }
  if ((v20 & 0x2000000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v20 = (uint64_t)self->_flags;
  }
  if ((v20 & 0x1000000) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_supportedElevationModels.count)
  {
    v21 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v21;
    }
    while (v21 < self->_supportedElevationModels.count);
  }
  if ((*(_QWORD *)&self->_flags & 0x80000) != 0)
    PBDataWriterWriteBOOLField();
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v24);
LABEL_144:

}

- (void)copyTo:(id)a3
{
  id *v4;
  $C6CCB02B41CDF0B568D1AACBF6097E71 *p_flags;
  uint64_t flags;
  unint64_t v7;
  unint64_t v8;
  uint64_t i;
  void *v10;
  $C6CCB02B41CDF0B568D1AACBF6097E71 *v11;
  uint64_t v12;
  id *v13;
  $C6CCB02B41CDF0B568D1AACBF6097E71 *v14;
  uint64_t v15;
  uint64_t v16;
  $C6CCB02B41CDF0B568D1AACBF6097E71 *v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t j;
  $C6CCB02B41CDF0B568D1AACBF6097E71 *v22;
  uint64_t v23;
  id *v24;
  $C6CCB02B41CDF0B568D1AACBF6097E71 *v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t k;
  id *v30;
  $C6CCB02B41CDF0B568D1AACBF6097E71 *v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t m;
  id *v36;

  v36 = (id *)a3;
  -[GEOClientCapabilities readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v36 + 1, self->_reader);
  *((_DWORD *)v36 + 56) = self->_readerMarkPos;
  *((_DWORD *)v36 + 57) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_appMajorVersion)
    objc_msgSend(v36, "setAppMajorVersion:");
  if (self->_appMinorVersion)
    objc_msgSend(v36, "setAppMinorVersion:");
  v4 = v36;
  if (self->_hardwareModel)
  {
    objc_msgSend(v36, "setHardwareModel:");
    v4 = v36;
  }
  if (self->_hardwareClass)
  {
    objc_msgSend(v36, "setHardwareClass:");
    v4 = v36;
  }
  p_flags = &self->_flags;
  flags = (uint64_t)self->_flags;
  if ((flags & 2) == 0)
  {
    if ((flags & 0x200) == 0)
      goto LABEL_11;
LABEL_107:
    *((_BYTE *)v4 + 266) = self->_internalInstall;
    v4[38] = (id)((unint64_t)v4[38] | 0x200);
    if ((*(_QWORD *)&self->_flags & 0x400) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
  *((_DWORD *)v4 + 60) = self->_maxManeuverTypeSupported;
  v4[38] = (id)((unint64_t)v4[38] | 2);
  flags = *(_QWORD *)p_flags;
  if ((*(_QWORD *)p_flags & 0x200) != 0)
    goto LABEL_107;
LABEL_11:
  if ((flags & 0x400) != 0)
  {
LABEL_12:
    *((_BYTE *)v4 + 267) = self->_internalTool;
    v4[38] = (id)((unint64_t)v4[38] | 0x400);
  }
LABEL_13:
  if (-[GEOClientCapabilities displayLanguagesCount](self, "displayLanguagesCount"))
  {
    objc_msgSend(v36, "clearDisplayLanguages");
    v7 = -[GEOClientCapabilities displayLanguagesCount](self, "displayLanguagesCount");
    if (v7)
    {
      v8 = v7;
      for (i = 0; i != v8; ++i)
      {
        -[GEOClientCapabilities displayLanguagesAtIndex:](self, "displayLanguagesAtIndex:", i);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "addDisplayLanguages:", v10);

      }
    }
  }
  if (self->_displayRegion)
    objc_msgSend(v36, "setDisplayRegion:");
  v11 = &self->_flags;
  v12 = (uint64_t)self->_flags;
  v13 = v36;
  if ((v12 & 8) != 0)
  {
    *((_DWORD *)v36 + 62) = self->_maxTrafficSpeedSupported;
    v36[38] = (id)((unint64_t)v36[38] | 8);
    v12 = *(_QWORD *)v11;
    if ((*(_QWORD *)v11 & 4) == 0)
    {
LABEL_21:
      if ((v12 & 1) == 0)
        goto LABEL_23;
      goto LABEL_22;
    }
  }
  else if ((v12 & 4) == 0)
  {
    goto LABEL_21;
  }
  *((_DWORD *)v36 + 61) = self->_maxRouteIncidentSupported;
  v36[38] = (id)((unint64_t)v36[38] | 4);
  if ((*(_QWORD *)&self->_flags & 1) != 0)
  {
LABEL_22:
    *((_DWORD *)v36 + 59) = self->_maxFormatterSupported;
    v36[38] = (id)((unint64_t)v36[38] | 1);
  }
LABEL_23:
  if (self->_deviceCountryCode)
  {
    objc_msgSend(v36, "setDeviceCountryCode:");
    v13 = v36;
  }
  v14 = &self->_flags;
  v15 = (uint64_t)self->_flags;
  if ((v15 & 0x80) != 0)
  {
    *((_BYTE *)v13 + 264) = self->_clusteredTransitRoutesSupported;
    v13[38] = (id)((unint64_t)v13[38] | 0x80);
    v15 = *(_QWORD *)v14;
    if ((*(_QWORD *)v14 & 0x4000) == 0)
    {
LABEL_27:
      if ((v15 & 0x40) == 0)
        goto LABEL_29;
      goto LABEL_28;
    }
  }
  else if ((v15 & 0x4000) == 0)
  {
    goto LABEL_27;
  }
  *((_BYTE *)v13 + 271) = self->_routeOptionsSupported;
  v13[38] = (id)((unint64_t)v13[38] | 0x4000);
  if ((*(_QWORD *)&self->_flags & 0x40) != 0)
  {
LABEL_28:
    *((_DWORD *)v13 + 65) = self->_transitMarketSupport;
    v13[38] = (id)((unint64_t)v13[38] | 0x40);
  }
LABEL_29:
  if (self->_formattedStringClientCapabilities)
  {
    objc_msgSend(v36, "setFormattedStringClientCapabilities:");
    v13 = v36;
  }
  if (self->_advisoryClientCapabilities)
  {
    objc_msgSend(v36, "setAdvisoryClientCapabilities:");
    v13 = v36;
  }
  v16 = (uint64_t)self->_flags;
  if ((v16 & 0x8000) != 0)
  {
    *((_BYTE *)v13 + 272) = self->_snapToClosestStopSupported;
    v13[38] = (id)((unint64_t)v13[38] | 0x8000);
    v16 = (uint64_t)self->_flags;
  }
  if ((v16 & 0x100) != 0)
  {
    *((_BYTE *)v13 + 265) = self->_includeCrossLanguagePhonetics;
    v13[38] = (id)((unint64_t)v13[38] | 0x100);
  }
  if (self->_userCurrentTimezone)
  {
    objc_msgSend(v36, "setUserCurrentTimezone:");
    v13 = v36;
  }
  v17 = &self->_flags;
  v18 = (uint64_t)self->_flags;
  if ((v18 & 0x400000000) != 0)
  {
    *((_BYTE *)v13 + 291) = self->_supportsLongShieldStrings;
    v13[38] = (id)((unint64_t)v13[38] | 0x400000000);
    v18 = *(_QWORD *)v17;
    if ((*(_QWORD *)v17 & 0x80000000) == 0)
    {
LABEL_41:
      if ((v18 & 0x40000000) == 0)
        goto LABEL_43;
      goto LABEL_42;
    }
  }
  else if ((v18 & 0x80000000) == 0)
  {
    goto LABEL_41;
  }
  *((_BYTE *)v13 + 288) = self->_supportsGuidanceEvents;
  v13[38] = (id)((unint64_t)v13[38] | 0x80000000);
  if ((*(_QWORD *)&self->_flags & 0x40000000) != 0)
  {
LABEL_42:
    *((_BYTE *)v13 + 287) = self->_supportsGuidanceEventsInlineShields;
    v13[38] = (id)((unint64_t)v13[38] | 0x40000000);
  }
LABEL_43:
  if (self->_abAssignInfo)
  {
    objc_msgSend(v36, "setAbAssignInfo:");
    v13 = v36;
  }
  if (self->_requestTime)
  {
    objc_msgSend(v36, "setRequestTime:");
    v13 = v36;
  }
  if ((*(_QWORD *)&self->_flags & 0x20) != 0)
  {
    *((_DWORD *)v13 + 64) = self->_maxZilchMessageVersionSupported;
    v13[38] = (id)((unint64_t)v13[38] | 0x20);
  }
  if (-[GEOClientCapabilities supportedTransitFeaturesCount](self, "supportedTransitFeaturesCount"))
  {
    objc_msgSend(v36, "clearSupportedTransitFeatures");
    v19 = -[GEOClientCapabilities supportedTransitFeaturesCount](self, "supportedTransitFeaturesCount");
    if (v19)
    {
      v20 = v19;
      for (j = 0; j != v20; ++j)
        objc_msgSend(v36, "addSupportedTransitFeature:", -[GEOClientCapabilities supportedTransitFeatureAtIndex:](self, "supportedTransitFeatureAtIndex:", j));
    }
  }
  v22 = &self->_flags;
  v23 = (uint64_t)self->_flags;
  v24 = v36;
  if ((v23 & 0x40000) != 0)
  {
    *((_BYTE *)v36 + 275) = self->_supportsArrivalMapRegion;
    v36[38] = (id)((unint64_t)v36[38] | 0x40000);
    v23 = *(_QWORD *)v22;
    if ((*(_QWORD *)v22 & 0x800000000) == 0)
    {
LABEL_55:
      if ((v23 & 0x100000000) == 0)
        goto LABEL_56;
      goto LABEL_120;
    }
  }
  else if ((v23 & 0x800000000) == 0)
  {
    goto LABEL_55;
  }
  *((_BYTE *)v36 + 292) = self->_supportsNaturalGuidance;
  v36[38] = (id)((unint64_t)v36[38] | 0x800000000);
  v23 = (uint64_t)self->_flags;
  if ((v23 & 0x100000000) == 0)
  {
LABEL_56:
    if ((v23 & 0x200000) == 0)
      goto LABEL_57;
    goto LABEL_121;
  }
LABEL_120:
  *((_BYTE *)v36 + 289) = self->_supportsJunctionView;
  v36[38] = (id)((unint64_t)v36[38] | 0x100000000);
  v23 = (uint64_t)self->_flags;
  if ((v23 & 0x200000) == 0)
  {
LABEL_57:
    if ((v23 & 0x200000000) == 0)
      goto LABEL_58;
    goto LABEL_122;
  }
LABEL_121:
  *((_BYTE *)v36 + 278) = self->_supportsCongestionZones;
  v36[38] = (id)((unint64_t)v36[38] | 0x200000);
  v23 = (uint64_t)self->_flags;
  if ((v23 & 0x200000000) == 0)
  {
LABEL_58:
    if ((v23 & 0x2000000) == 0)
      goto LABEL_59;
    goto LABEL_123;
  }
LABEL_122:
  *((_BYTE *)v36 + 290) = self->_supportsLicensePlateRestrictions;
  v36[38] = (id)((unint64_t)v36[38] | 0x200000000);
  v23 = (uint64_t)self->_flags;
  if ((v23 & 0x2000000) == 0)
  {
LABEL_59:
    if ((v23 & 0x20000000000) == 0)
      goto LABEL_60;
    goto LABEL_124;
  }
LABEL_123:
  *((_BYTE *)v36 + 282) = self->_supportsElectricVehicleRoutes;
  v36[38] = (id)((unint64_t)v36[38] | 0x2000000);
  v23 = (uint64_t)self->_flags;
  if ((v23 & 0x20000000000) == 0)
  {
LABEL_60:
    if ((v23 & 0x100000000000) == 0)
      goto LABEL_62;
    goto LABEL_61;
  }
LABEL_124:
  *((_BYTE *)v36 + 298) = self->_supportsTrafficCameras;
  v36[38] = (id)((unint64_t)v36[38] | 0x20000000000);
  if ((*(_QWORD *)&self->_flags & 0x100000000000) != 0)
  {
LABEL_61:
    *((_BYTE *)v36 + 301) = self->_supportsWaypointRoutes;
    v36[38] = (id)((unint64_t)v36[38] | 0x100000000000);
  }
LABEL_62:
  if (self->_localizationCapabilities)
  {
    objc_msgSend(v36, "setLocalizationCapabilities:");
    v24 = v36;
  }
  if (self->_deviceSku)
  {
    objc_msgSend(v36, "setDeviceSku:");
    v24 = v36;
  }
  if (self->_osVersion)
  {
    objc_msgSend(v36, "setOsVersion:");
    v24 = v36;
  }
  v25 = &self->_flags;
  v26 = (uint64_t)self->_flags;
  if ((v26 & 0x200000000000) != 0)
  {
    *((_BYTE *)v24 + 302) = self->_willSendEvDirectionsFeedback;
    v24[38] = (id)((unint64_t)v24[38] | 0x200000000000);
    v26 = *(_QWORD *)v25;
    if ((*(_QWORD *)v25 & 0x1000000000) == 0)
    {
LABEL_70:
      if ((v26 & 0x10000000000) == 0)
        goto LABEL_71;
      goto LABEL_128;
    }
  }
  else if ((v26 & 0x1000000000) == 0)
  {
    goto LABEL_70;
  }
  *((_BYTE *)v24 + 293) = self->_supportsRoadComplexities;
  v24[38] = (id)((unint64_t)v24[38] | 0x1000000000);
  v26 = (uint64_t)self->_flags;
  if ((v26 & 0x10000000000) == 0)
  {
LABEL_71:
    if ((v26 & 0x40000000000) == 0)
      goto LABEL_72;
    goto LABEL_129;
  }
LABEL_128:
  *((_BYTE *)v24 + 297) = self->_supportsSpeedTrapAnnouncements;
  v24[38] = (id)((unint64_t)v24[38] | 0x10000000000);
  v26 = (uint64_t)self->_flags;
  if ((v26 & 0x40000000000) == 0)
  {
LABEL_72:
    if ((v26 & 0x20000) == 0)
      goto LABEL_73;
    goto LABEL_130;
  }
LABEL_129:
  *((_BYTE *)v24 + 299) = self->_supportsUserIncidentReports;
  v24[38] = (id)((unint64_t)v24[38] | 0x40000000000);
  v26 = (uint64_t)self->_flags;
  if ((v26 & 0x20000) == 0)
  {
LABEL_73:
    if ((v26 & 0x10000) == 0)
      goto LABEL_74;
    goto LABEL_131;
  }
LABEL_130:
  *((_BYTE *)v24 + 274) = self->_supportsAreaEventsEnhancements;
  v24[38] = (id)((unint64_t)v24[38] | 0x20000);
  v26 = (uint64_t)self->_flags;
  if ((v26 & 0x10000) == 0)
  {
LABEL_74:
    if ((v26 & 0x8000000000) == 0)
      goto LABEL_75;
    goto LABEL_132;
  }
LABEL_131:
  *((_BYTE *)v24 + 273) = self->_supportsAdvancedMap;
  v24[38] = (id)((unint64_t)v24[38] | 0x10000);
  v26 = (uint64_t)self->_flags;
  if ((v26 & 0x8000000000) == 0)
  {
LABEL_75:
    if ((v26 & 0x2000) == 0)
      goto LABEL_76;
    goto LABEL_133;
  }
LABEL_132:
  *((_BYTE *)v24 + 296) = self->_supportsSilentRouteUpdates;
  v24[38] = (id)((unint64_t)v24[38] | 0x8000000000);
  v26 = (uint64_t)self->_flags;
  if ((v26 & 0x2000) == 0)
  {
LABEL_76:
    if ((v26 & 0x20000000) == 0)
      goto LABEL_77;
    goto LABEL_134;
  }
LABEL_133:
  *((_BYTE *)v24 + 270) = self->_replaceAccidentStringWithCrash;
  v24[38] = (id)((unint64_t)v24[38] | 0x2000);
  v26 = (uint64_t)self->_flags;
  if ((v26 & 0x20000000) == 0)
  {
LABEL_77:
    if ((v26 & 0x10000000) == 0)
      goto LABEL_78;
    goto LABEL_135;
  }
LABEL_134:
  *((_BYTE *)v24 + 286) = self->_supportsGuidanceEventPrivacyFilters;
  v24[38] = (id)((unint64_t)v24[38] | 0x20000000);
  v26 = (uint64_t)self->_flags;
  if ((v26 & 0x10000000) == 0)
  {
LABEL_78:
    if ((v26 & 0x800) == 0)
      goto LABEL_79;
LABEL_136:
    *((_BYTE *)v24 + 268) = self->_isAdvancedMap;
    v24[38] = (id)((unint64_t)v24[38] | 0x800);
    if ((*(_QWORD *)&self->_flags & 0x1000) == 0)
      goto LABEL_81;
    goto LABEL_80;
  }
LABEL_135:
  *((_BYTE *)v24 + 285) = self->_supportsGuidanceEventImportanceInfo;
  v24[38] = (id)((unint64_t)v24[38] | 0x10000000);
  v26 = (uint64_t)self->_flags;
  if ((v26 & 0x800) != 0)
    goto LABEL_136;
LABEL_79:
  if ((v26 & 0x1000) != 0)
  {
LABEL_80:
    *((_BYTE *)v24 + 269) = self->_isGlobeProjection;
    v24[38] = (id)((unint64_t)v24[38] | 0x1000);
  }
LABEL_81:
  if (-[GEOClientCapabilities supportsMultipointRoutingsCount](self, "supportsMultipointRoutingsCount"))
  {
    objc_msgSend(v36, "clearSupportsMultipointRoutings");
    v27 = -[GEOClientCapabilities supportsMultipointRoutingsCount](self, "supportsMultipointRoutingsCount");
    if (v27)
    {
      v28 = v27;
      for (k = 0; k != v28; ++k)
        objc_msgSend(v36, "addSupportsMultipointRouting:", -[GEOClientCapabilities supportsMultipointRoutingAtIndex:](self, "supportsMultipointRoutingAtIndex:", k));
    }
  }
  v30 = v36;
  if ((*(_QWORD *)&self->_flags & 0x400000) != 0)
  {
    *((_BYTE *)v36 + 279) = self->_supportsDefaultToNewRouteFlag;
    v36[38] = (id)((unint64_t)v36[38] | 0x400000);
  }
  if (self->_walkingSupportedFeatures)
  {
    objc_msgSend(v36, "setWalkingSupportedFeatures:");
    v30 = v36;
  }
  v31 = &self->_flags;
  v32 = (uint64_t)self->_flags;
  if ((v32 & 0x10) != 0)
  {
    *((_DWORD *)v30 + 63) = self->_maxSupportedTransitFareVersion;
    v30[38] = (id)((unint64_t)v30[38] | 0x10);
    v32 = *(_QWORD *)v31;
    if ((*(_QWORD *)v31 & 0x800000) == 0)
    {
LABEL_91:
      if ((v32 & 0x100000) == 0)
        goto LABEL_92;
      goto LABEL_140;
    }
  }
  else if ((v32 & 0x800000) == 0)
  {
    goto LABEL_91;
  }
  *((_BYTE *)v30 + 280) = self->_supportsDisablingProgressBarFromBannerButtons;
  v30[38] = (id)((unint64_t)v30[38] | 0x800000);
  v32 = (uint64_t)self->_flags;
  if ((v32 & 0x100000) == 0)
  {
LABEL_92:
    if ((v32 & 0x4000000) == 0)
      goto LABEL_93;
    goto LABEL_141;
  }
LABEL_140:
  *((_BYTE *)v30 + 277) = self->_supportsBannerQueuing;
  v30[38] = (id)((unint64_t)v30[38] | 0x100000);
  v32 = (uint64_t)self->_flags;
  if ((v32 & 0x4000000) == 0)
  {
LABEL_93:
    if ((v32 & 0x4000000000) == 0)
      goto LABEL_94;
    goto LABEL_142;
  }
LABEL_141:
  *((_BYTE *)v30 + 283) = self->_supportsEv2;
  v30[38] = (id)((unint64_t)v30[38] | 0x4000000);
  v32 = (uint64_t)self->_flags;
  if ((v32 & 0x4000000000) == 0)
  {
LABEL_94:
    if ((v32 & 0x80000000000) == 0)
      goto LABEL_95;
    goto LABEL_143;
  }
LABEL_142:
  *((_BYTE *)v30 + 295) = self->_supportsRouteNameRanges;
  v30[38] = (id)((unint64_t)v30[38] | 0x4000000000);
  v32 = (uint64_t)self->_flags;
  if ((v32 & 0x80000000000) == 0)
  {
LABEL_95:
    if ((v32 & 0x8000000) == 0)
      goto LABEL_96;
    goto LABEL_144;
  }
LABEL_143:
  *((_BYTE *)v30 + 300) = self->_supportsWalkingSuggestionsAfterParking;
  v30[38] = (id)((unint64_t)v30[38] | 0x80000000000);
  v32 = (uint64_t)self->_flags;
  if ((v32 & 0x8000000) == 0)
  {
LABEL_96:
    if ((v32 & 0x2000000000) == 0)
      goto LABEL_97;
LABEL_145:
    *((_BYTE *)v30 + 294) = self->_supportsRouteCameraInputUpdates;
    v30[38] = (id)((unint64_t)v30[38] | 0x2000000000);
    if ((*(_QWORD *)&self->_flags & 0x1000000) == 0)
      goto LABEL_99;
    goto LABEL_98;
  }
LABEL_144:
  *((_BYTE *)v30 + 284) = self->_supportsGenericCombinationsInstructionsForAllModes;
  v30[38] = (id)((unint64_t)v30[38] | 0x8000000);
  v32 = (uint64_t)self->_flags;
  if ((v32 & 0x2000000000) != 0)
    goto LABEL_145;
LABEL_97:
  if ((v32 & 0x1000000) != 0)
  {
LABEL_98:
    *((_BYTE *)v30 + 281) = self->_supportsDodgeballCameraInput;
    v30[38] = (id)((unint64_t)v30[38] | 0x1000000);
  }
LABEL_99:
  if (-[GEOClientCapabilities supportedElevationModelsCount](self, "supportedElevationModelsCount"))
  {
    objc_msgSend(v36, "clearSupportedElevationModels");
    v33 = -[GEOClientCapabilities supportedElevationModelsCount](self, "supportedElevationModelsCount");
    if (v33)
    {
      v34 = v33;
      for (m = 0; m != v34; ++m)
        objc_msgSend(v36, "addSupportedElevationModel:", -[GEOClientCapabilities supportedElevationModelAtIndex:](self, "supportedElevationModelAtIndex:", m));
    }
  }
  if ((*(_QWORD *)&self->_flags & 0x80000) != 0)
  {
    *((_BYTE *)v36 + 276) = self->_supportsBannerQueuingDirections;
    v36[38] = (id)((unint64_t)v36[38] | 0x80000);
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
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  $C6CCB02B41CDF0B568D1AACBF6097E71 *p_flags;
  uint64_t flags;
  NSMutableArray *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  $C6CCB02B41CDF0B568D1AACBF6097E71 *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  $C6CCB02B41CDF0B568D1AACBF6097E71 *v30;
  uint64_t v31;
  id v32;
  void *v33;
  id v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  $C6CCB02B41CDF0B568D1AACBF6097E71 *v39;
  uint64_t v40;
  id v41;
  void *v42;
  id v43;
  void *v44;
  $C6CCB02B41CDF0B568D1AACBF6097E71 *v45;
  uint64_t v46;
  id v47;
  void *v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  void *v52;
  $C6CCB02B41CDF0B568D1AACBF6097E71 *v53;
  uint64_t v54;
  id v55;
  void *v56;
  $C6CCB02B41CDF0B568D1AACBF6097E71 *v57;
  uint64_t v58;
  id v59;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*((_BYTE *)&self->_flags + 8) & 4) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOClientCapabilitiesReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_71;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOClientCapabilities readAll:](self, "readAll:", 0);
  v9 = -[NSString copyWithZone:](self->_appMajorVersion, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 112);
  *(_QWORD *)(v5 + 112) = v9;

  v11 = -[NSString copyWithZone:](self->_appMinorVersion, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 120);
  *(_QWORD *)(v5 + 120) = v11;

  v13 = -[NSString copyWithZone:](self->_hardwareModel, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 168);
  *(_QWORD *)(v5 + 168) = v13;

  v15 = -[NSString copyWithZone:](self->_hardwareClass, "copyWithZone:", a3);
  v16 = *(void **)(v5 + 176);
  *(_QWORD *)(v5 + 176) = v15;

  p_flags = &self->_flags;
  flags = (uint64_t)self->_flags;
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 240) = self->_maxManeuverTypeSupported;
    *(_QWORD *)(v5 + 304) |= 2uLL;
    flags = *(_QWORD *)p_flags;
    if ((*(_QWORD *)p_flags & 0x200) == 0)
    {
LABEL_7:
      if ((flags & 0x400) == 0)
        goto LABEL_9;
      goto LABEL_8;
    }
  }
  else if ((flags & 0x200) == 0)
  {
    goto LABEL_7;
  }
  *(_BYTE *)(v5 + 266) = self->_internalInstall;
  *(_QWORD *)(v5 + 304) |= 0x200uLL;
  if ((*(_QWORD *)&self->_flags & 0x400) != 0)
  {
LABEL_8:
    *(_BYTE *)(v5 + 267) = self->_internalTool;
    *(_QWORD *)(v5 + 304) |= 0x400uLL;
  }
LABEL_9:
  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  v19 = self->_displayLanguages;
  v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v61, v65, 16);
  if (v20)
  {
    v21 = *(_QWORD *)v62;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v62 != v21)
          objc_enumerationMutation(v19);
        v23 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v61 + 1) + 8 * v22), "copyWithZone:", a3, (_QWORD)v61);
        objc_msgSend((id)v5, "addDisplayLanguages:", v23);

        ++v22;
      }
      while (v20 != v22);
      v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v61, v65, 16);
    }
    while (v20);
  }

  v24 = -[NSString copyWithZone:](self->_displayRegion, "copyWithZone:", a3);
  v25 = *(void **)(v5 + 152);
  *(_QWORD *)(v5 + 152) = v24;

  v26 = &self->_flags;
  v27 = (uint64_t)self->_flags;
  if ((v27 & 8) != 0)
  {
    *(_DWORD *)(v5 + 248) = self->_maxTrafficSpeedSupported;
    *(_QWORD *)(v5 + 304) |= 8uLL;
    v27 = *(_QWORD *)v26;
    if ((*(_QWORD *)v26 & 4) == 0)
    {
LABEL_18:
      if ((v27 & 1) == 0)
        goto LABEL_20;
      goto LABEL_19;
    }
  }
  else if ((v27 & 4) == 0)
  {
    goto LABEL_18;
  }
  *(_DWORD *)(v5 + 244) = self->_maxRouteIncidentSupported;
  *(_QWORD *)(v5 + 304) |= 4uLL;
  if ((*(_QWORD *)&self->_flags & 1) != 0)
  {
LABEL_19:
    *(_DWORD *)(v5 + 236) = self->_maxFormatterSupported;
    *(_QWORD *)(v5 + 304) |= 1uLL;
  }
LABEL_20:
  v28 = -[NSString copyWithZone:](self->_deviceCountryCode, "copyWithZone:", a3, (_QWORD)v61);
  v29 = *(void **)(v5 + 128);
  *(_QWORD *)(v5 + 128) = v28;

  v30 = &self->_flags;
  v31 = (uint64_t)self->_flags;
  if ((v31 & 0x80) != 0)
  {
    *(_BYTE *)(v5 + 264) = self->_clusteredTransitRoutesSupported;
    *(_QWORD *)(v5 + 304) |= 0x80uLL;
    v31 = *(_QWORD *)v30;
    if ((*(_QWORD *)v30 & 0x4000) == 0)
    {
LABEL_22:
      if ((v31 & 0x40) == 0)
        goto LABEL_24;
      goto LABEL_23;
    }
  }
  else if ((v31 & 0x4000) == 0)
  {
    goto LABEL_22;
  }
  *(_BYTE *)(v5 + 271) = self->_routeOptionsSupported;
  *(_QWORD *)(v5 + 304) |= 0x4000uLL;
  if ((*(_QWORD *)&self->_flags & 0x40) != 0)
  {
LABEL_23:
    *(_DWORD *)(v5 + 260) = self->_transitMarketSupport;
    *(_QWORD *)(v5 + 304) |= 0x40uLL;
  }
LABEL_24:
  v32 = -[GEOFormattedStringClientCapabilities copyWithZone:](self->_formattedStringClientCapabilities, "copyWithZone:", a3);
  v33 = *(void **)(v5 + 160);
  *(_QWORD *)(v5 + 160) = v32;

  v34 = -[GEOAdvisoryClientCapabilities copyWithZone:](self->_advisoryClientCapabilities, "copyWithZone:", a3);
  v35 = *(void **)(v5 + 104);
  *(_QWORD *)(v5 + 104) = v34;

  v36 = (uint64_t)self->_flags;
  if ((v36 & 0x8000) != 0)
  {
    *(_BYTE *)(v5 + 272) = self->_snapToClosestStopSupported;
    *(_QWORD *)(v5 + 304) |= 0x8000uLL;
    v36 = (uint64_t)self->_flags;
  }
  if ((v36 & 0x100) != 0)
  {
    *(_BYTE *)(v5 + 265) = self->_includeCrossLanguagePhonetics;
    *(_QWORD *)(v5 + 304) |= 0x100uLL;
  }
  v37 = -[NSString copyWithZone:](self->_userCurrentTimezone, "copyWithZone:", a3);
  v38 = *(void **)(v5 + 208);
  *(_QWORD *)(v5 + 208) = v37;

  v39 = &self->_flags;
  v40 = (uint64_t)self->_flags;
  if ((v40 & 0x400000000) != 0)
  {
    *(_BYTE *)(v5 + 291) = self->_supportsLongShieldStrings;
    *(_QWORD *)(v5 + 304) |= 0x400000000uLL;
    v40 = *(_QWORD *)v39;
    if ((*(_QWORD *)v39 & 0x80000000) == 0)
    {
LABEL_30:
      if ((v40 & 0x40000000) == 0)
        goto LABEL_32;
      goto LABEL_31;
    }
  }
  else if ((v40 & 0x80000000) == 0)
  {
    goto LABEL_30;
  }
  *(_BYTE *)(v5 + 288) = self->_supportsGuidanceEvents;
  *(_QWORD *)(v5 + 304) |= 0x80000000uLL;
  if ((*(_QWORD *)&self->_flags & 0x40000000) != 0)
  {
LABEL_31:
    *(_BYTE *)(v5 + 287) = self->_supportsGuidanceEventsInlineShields;
    *(_QWORD *)(v5 + 304) |= 0x40000000uLL;
  }
LABEL_32:
  v41 = -[GEOAbAssignInfo copyWithZone:](self->_abAssignInfo, "copyWithZone:", a3);
  v42 = *(void **)(v5 + 96);
  *(_QWORD *)(v5 + 96) = v41;

  v43 = -[GEOLocalTime copyWithZone:](self->_requestTime, "copyWithZone:", a3);
  v44 = *(void **)(v5 + 200);
  *(_QWORD *)(v5 + 200) = v43;

  if ((*(_QWORD *)&self->_flags & 0x20) != 0)
  {
    *(_DWORD *)(v5 + 256) = self->_maxZilchMessageVersionSupported;
    *(_QWORD *)(v5 + 304) |= 0x20uLL;
  }
  PBRepeatedInt32Copy();
  v45 = &self->_flags;
  v46 = (uint64_t)self->_flags;
  if ((v46 & 0x40000) != 0)
  {
    *(_BYTE *)(v5 + 275) = self->_supportsArrivalMapRegion;
    *(_QWORD *)(v5 + 304) |= 0x40000uLL;
    v46 = *(_QWORD *)v45;
    if ((*(_QWORD *)v45 & 0x800000000) == 0)
    {
LABEL_36:
      if ((v46 & 0x100000000) == 0)
        goto LABEL_37;
      goto LABEL_86;
    }
  }
  else if ((v46 & 0x800000000) == 0)
  {
    goto LABEL_36;
  }
  *(_BYTE *)(v5 + 292) = self->_supportsNaturalGuidance;
  *(_QWORD *)(v5 + 304) |= 0x800000000uLL;
  v46 = (uint64_t)self->_flags;
  if ((v46 & 0x100000000) == 0)
  {
LABEL_37:
    if ((v46 & 0x200000) == 0)
      goto LABEL_38;
    goto LABEL_87;
  }
LABEL_86:
  *(_BYTE *)(v5 + 289) = self->_supportsJunctionView;
  *(_QWORD *)(v5 + 304) |= 0x100000000uLL;
  v46 = (uint64_t)self->_flags;
  if ((v46 & 0x200000) == 0)
  {
LABEL_38:
    if ((v46 & 0x200000000) == 0)
      goto LABEL_39;
    goto LABEL_88;
  }
LABEL_87:
  *(_BYTE *)(v5 + 278) = self->_supportsCongestionZones;
  *(_QWORD *)(v5 + 304) |= 0x200000uLL;
  v46 = (uint64_t)self->_flags;
  if ((v46 & 0x200000000) == 0)
  {
LABEL_39:
    if ((v46 & 0x2000000) == 0)
      goto LABEL_40;
    goto LABEL_89;
  }
LABEL_88:
  *(_BYTE *)(v5 + 290) = self->_supportsLicensePlateRestrictions;
  *(_QWORD *)(v5 + 304) |= 0x200000000uLL;
  v46 = (uint64_t)self->_flags;
  if ((v46 & 0x2000000) == 0)
  {
LABEL_40:
    if ((v46 & 0x20000000000) == 0)
      goto LABEL_41;
    goto LABEL_90;
  }
LABEL_89:
  *(_BYTE *)(v5 + 282) = self->_supportsElectricVehicleRoutes;
  *(_QWORD *)(v5 + 304) |= 0x2000000uLL;
  v46 = (uint64_t)self->_flags;
  if ((v46 & 0x20000000000) == 0)
  {
LABEL_41:
    if ((v46 & 0x100000000000) == 0)
      goto LABEL_43;
    goto LABEL_42;
  }
LABEL_90:
  *(_BYTE *)(v5 + 298) = self->_supportsTrafficCameras;
  *(_QWORD *)(v5 + 304) |= 0x20000000000uLL;
  if ((*(_QWORD *)&self->_flags & 0x100000000000) != 0)
  {
LABEL_42:
    *(_BYTE *)(v5 + 301) = self->_supportsWaypointRoutes;
    *(_QWORD *)(v5 + 304) |= 0x100000000000uLL;
  }
LABEL_43:
  v47 = -[GEOLocalizationCapabilities copyWithZone:](self->_localizationCapabilities, "copyWithZone:", a3);
  v48 = *(void **)(v5 + 184);
  *(_QWORD *)(v5 + 184) = v47;

  v49 = -[NSString copyWithZone:](self->_deviceSku, "copyWithZone:", a3);
  v50 = *(void **)(v5 + 136);
  *(_QWORD *)(v5 + 136) = v49;

  v51 = -[NSString copyWithZone:](self->_osVersion, "copyWithZone:", a3);
  v52 = *(void **)(v5 + 192);
  *(_QWORD *)(v5 + 192) = v51;

  v53 = &self->_flags;
  v54 = (uint64_t)self->_flags;
  if ((v54 & 0x200000000000) != 0)
  {
    *(_BYTE *)(v5 + 302) = self->_willSendEvDirectionsFeedback;
    *(_QWORD *)(v5 + 304) |= 0x200000000000uLL;
    v54 = *(_QWORD *)v53;
    if ((*(_QWORD *)v53 & 0x1000000000) == 0)
    {
LABEL_45:
      if ((v54 & 0x10000000000) == 0)
        goto LABEL_46;
      goto LABEL_94;
    }
  }
  else if ((v54 & 0x1000000000) == 0)
  {
    goto LABEL_45;
  }
  *(_BYTE *)(v5 + 293) = self->_supportsRoadComplexities;
  *(_QWORD *)(v5 + 304) |= 0x1000000000uLL;
  v54 = (uint64_t)self->_flags;
  if ((v54 & 0x10000000000) == 0)
  {
LABEL_46:
    if ((v54 & 0x40000000000) == 0)
      goto LABEL_47;
    goto LABEL_95;
  }
LABEL_94:
  *(_BYTE *)(v5 + 297) = self->_supportsSpeedTrapAnnouncements;
  *(_QWORD *)(v5 + 304) |= 0x10000000000uLL;
  v54 = (uint64_t)self->_flags;
  if ((v54 & 0x40000000000) == 0)
  {
LABEL_47:
    if ((v54 & 0x20000) == 0)
      goto LABEL_48;
    goto LABEL_96;
  }
LABEL_95:
  *(_BYTE *)(v5 + 299) = self->_supportsUserIncidentReports;
  *(_QWORD *)(v5 + 304) |= 0x40000000000uLL;
  v54 = (uint64_t)self->_flags;
  if ((v54 & 0x20000) == 0)
  {
LABEL_48:
    if ((v54 & 0x10000) == 0)
      goto LABEL_49;
    goto LABEL_97;
  }
LABEL_96:
  *(_BYTE *)(v5 + 274) = self->_supportsAreaEventsEnhancements;
  *(_QWORD *)(v5 + 304) |= 0x20000uLL;
  v54 = (uint64_t)self->_flags;
  if ((v54 & 0x10000) == 0)
  {
LABEL_49:
    if ((v54 & 0x8000000000) == 0)
      goto LABEL_50;
    goto LABEL_98;
  }
LABEL_97:
  *(_BYTE *)(v5 + 273) = self->_supportsAdvancedMap;
  *(_QWORD *)(v5 + 304) |= 0x10000uLL;
  v54 = (uint64_t)self->_flags;
  if ((v54 & 0x8000000000) == 0)
  {
LABEL_50:
    if ((v54 & 0x2000) == 0)
      goto LABEL_51;
    goto LABEL_99;
  }
LABEL_98:
  *(_BYTE *)(v5 + 296) = self->_supportsSilentRouteUpdates;
  *(_QWORD *)(v5 + 304) |= 0x8000000000uLL;
  v54 = (uint64_t)self->_flags;
  if ((v54 & 0x2000) == 0)
  {
LABEL_51:
    if ((v54 & 0x20000000) == 0)
      goto LABEL_52;
    goto LABEL_100;
  }
LABEL_99:
  *(_BYTE *)(v5 + 270) = self->_replaceAccidentStringWithCrash;
  *(_QWORD *)(v5 + 304) |= 0x2000uLL;
  v54 = (uint64_t)self->_flags;
  if ((v54 & 0x20000000) == 0)
  {
LABEL_52:
    if ((v54 & 0x10000000) == 0)
      goto LABEL_53;
    goto LABEL_101;
  }
LABEL_100:
  *(_BYTE *)(v5 + 286) = self->_supportsGuidanceEventPrivacyFilters;
  *(_QWORD *)(v5 + 304) |= 0x20000000uLL;
  v54 = (uint64_t)self->_flags;
  if ((v54 & 0x10000000) == 0)
  {
LABEL_53:
    if ((v54 & 0x800) == 0)
      goto LABEL_54;
    goto LABEL_102;
  }
LABEL_101:
  *(_BYTE *)(v5 + 285) = self->_supportsGuidanceEventImportanceInfo;
  *(_QWORD *)(v5 + 304) |= 0x10000000uLL;
  v54 = (uint64_t)self->_flags;
  if ((v54 & 0x800) == 0)
  {
LABEL_54:
    if ((v54 & 0x1000) == 0)
      goto LABEL_56;
    goto LABEL_55;
  }
LABEL_102:
  *(_BYTE *)(v5 + 268) = self->_isAdvancedMap;
  *(_QWORD *)(v5 + 304) |= 0x800uLL;
  if ((*(_QWORD *)&self->_flags & 0x1000) != 0)
  {
LABEL_55:
    *(_BYTE *)(v5 + 269) = self->_isGlobeProjection;
    *(_QWORD *)(v5 + 304) |= 0x1000uLL;
  }
LABEL_56:
  PBRepeatedInt32Copy();
  if ((*(_QWORD *)&self->_flags & 0x400000) != 0)
  {
    *(_BYTE *)(v5 + 279) = self->_supportsDefaultToNewRouteFlag;
    *(_QWORD *)(v5 + 304) |= 0x400000uLL;
  }
  v55 = -[GEOWalkingSupportedFeatures copyWithZone:](self->_walkingSupportedFeatures, "copyWithZone:", a3);
  v56 = *(void **)(v5 + 216);
  *(_QWORD *)(v5 + 216) = v55;

  v57 = &self->_flags;
  v58 = (uint64_t)self->_flags;
  if ((v58 & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 252) = self->_maxSupportedTransitFareVersion;
    *(_QWORD *)(v5 + 304) |= 0x10uLL;
    v58 = *(_QWORD *)v57;
    if ((*(_QWORD *)v57 & 0x800000) == 0)
    {
LABEL_60:
      if ((v58 & 0x100000) == 0)
        goto LABEL_61;
      goto LABEL_106;
    }
  }
  else if ((v58 & 0x800000) == 0)
  {
    goto LABEL_60;
  }
  *(_BYTE *)(v5 + 280) = self->_supportsDisablingProgressBarFromBannerButtons;
  *(_QWORD *)(v5 + 304) |= 0x800000uLL;
  v58 = (uint64_t)self->_flags;
  if ((v58 & 0x100000) == 0)
  {
LABEL_61:
    if ((v58 & 0x4000000) == 0)
      goto LABEL_62;
    goto LABEL_107;
  }
LABEL_106:
  *(_BYTE *)(v5 + 277) = self->_supportsBannerQueuing;
  *(_QWORD *)(v5 + 304) |= 0x100000uLL;
  v58 = (uint64_t)self->_flags;
  if ((v58 & 0x4000000) == 0)
  {
LABEL_62:
    if ((v58 & 0x4000000000) == 0)
      goto LABEL_63;
    goto LABEL_108;
  }
LABEL_107:
  *(_BYTE *)(v5 + 283) = self->_supportsEv2;
  *(_QWORD *)(v5 + 304) |= 0x4000000uLL;
  v58 = (uint64_t)self->_flags;
  if ((v58 & 0x4000000000) == 0)
  {
LABEL_63:
    if ((v58 & 0x80000000000) == 0)
      goto LABEL_64;
    goto LABEL_109;
  }
LABEL_108:
  *(_BYTE *)(v5 + 295) = self->_supportsRouteNameRanges;
  *(_QWORD *)(v5 + 304) |= 0x4000000000uLL;
  v58 = (uint64_t)self->_flags;
  if ((v58 & 0x80000000000) == 0)
  {
LABEL_64:
    if ((v58 & 0x8000000) == 0)
      goto LABEL_65;
    goto LABEL_110;
  }
LABEL_109:
  *(_BYTE *)(v5 + 300) = self->_supportsWalkingSuggestionsAfterParking;
  *(_QWORD *)(v5 + 304) |= 0x80000000000uLL;
  v58 = (uint64_t)self->_flags;
  if ((v58 & 0x8000000) == 0)
  {
LABEL_65:
    if ((v58 & 0x2000000000) == 0)
      goto LABEL_66;
LABEL_111:
    *(_BYTE *)(v5 + 294) = self->_supportsRouteCameraInputUpdates;
    *(_QWORD *)(v5 + 304) |= 0x2000000000uLL;
    if ((*(_QWORD *)&self->_flags & 0x1000000) == 0)
      goto LABEL_68;
    goto LABEL_67;
  }
LABEL_110:
  *(_BYTE *)(v5 + 284) = self->_supportsGenericCombinationsInstructionsForAllModes;
  *(_QWORD *)(v5 + 304) |= 0x8000000uLL;
  v58 = (uint64_t)self->_flags;
  if ((v58 & 0x2000000000) != 0)
    goto LABEL_111;
LABEL_66:
  if ((v58 & 0x1000000) != 0)
  {
LABEL_67:
    *(_BYTE *)(v5 + 281) = self->_supportsDodgeballCameraInput;
    *(_QWORD *)(v5 + 304) |= 0x1000000uLL;
  }
LABEL_68:
  PBRepeatedInt32Copy();
  if ((*(_QWORD *)&self->_flags & 0x80000) != 0)
  {
    *(_BYTE *)(v5 + 276) = self->_supportsBannerQueuingDirections;
    *(_QWORD *)(v5 + 304) |= 0x80000uLL;
  }
  objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
  v59 = (id)v5;
LABEL_71:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *appMajorVersion;
  NSString *appMinorVersion;
  NSString *hardwareModel;
  NSString *hardwareClass;
  uint64_t flags;
  uint64_t v10;
  NSMutableArray *displayLanguages;
  NSString *displayRegion;
  uint64_t v13;
  uint64_t v14;
  NSString *deviceCountryCode;
  GEOFormattedStringClientCapabilities *formattedStringClientCapabilities;
  GEOAdvisoryClientCapabilities *advisoryClientCapabilities;
  uint64_t v18;
  uint64_t v19;
  NSString *userCurrentTimezone;
  GEOAbAssignInfo *abAssignInfo;
  GEOLocalTime *requestTime;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  GEOLocalizationCapabilities *localizationCapabilities;
  NSString *deviceSku;
  NSString *osVersion;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  GEOWalkingSupportedFeatures *walkingSupportedFeatures;
  uint64_t v34;
  BOOL v35;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_384;
  -[GEOClientCapabilities readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  appMajorVersion = self->_appMajorVersion;
  if ((unint64_t)appMajorVersion | *((_QWORD *)v4 + 14))
  {
    if (!-[NSString isEqual:](appMajorVersion, "isEqual:"))
      goto LABEL_384;
  }
  appMinorVersion = self->_appMinorVersion;
  if ((unint64_t)appMinorVersion | *((_QWORD *)v4 + 15))
  {
    if (!-[NSString isEqual:](appMinorVersion, "isEqual:"))
      goto LABEL_384;
  }
  hardwareModel = self->_hardwareModel;
  if ((unint64_t)hardwareModel | *((_QWORD *)v4 + 21))
  {
    if (!-[NSString isEqual:](hardwareModel, "isEqual:"))
      goto LABEL_384;
  }
  hardwareClass = self->_hardwareClass;
  if ((unint64_t)hardwareClass | *((_QWORD *)v4 + 22))
  {
    if (!-[NSString isEqual:](hardwareClass, "isEqual:"))
      goto LABEL_384;
  }
  flags = (uint64_t)self->_flags;
  v10 = *((_QWORD *)v4 + 38);
  if ((flags & 2) != 0)
  {
    if ((v10 & 2) == 0 || self->_maxManeuverTypeSupported != *((_DWORD *)v4 + 60))
      goto LABEL_384;
  }
  else if ((v10 & 2) != 0)
  {
    goto LABEL_384;
  }
  if ((flags & 0x200) != 0)
  {
    if ((v10 & 0x200) == 0)
      goto LABEL_384;
    if (self->_internalInstall)
    {
      if (!*((_BYTE *)v4 + 266))
        goto LABEL_384;
    }
    else if (*((_BYTE *)v4 + 266))
    {
      goto LABEL_384;
    }
  }
  else if ((v10 & 0x200) != 0)
  {
    goto LABEL_384;
  }
  if ((flags & 0x400) != 0)
  {
    if ((v10 & 0x400) == 0)
      goto LABEL_384;
    if (self->_internalTool)
    {
      if (!*((_BYTE *)v4 + 267))
        goto LABEL_384;
    }
    else if (*((_BYTE *)v4 + 267))
    {
      goto LABEL_384;
    }
  }
  else if ((v10 & 0x400) != 0)
  {
    goto LABEL_384;
  }
  displayLanguages = self->_displayLanguages;
  if ((unint64_t)displayLanguages | *((_QWORD *)v4 + 18)
    && !-[NSMutableArray isEqual:](displayLanguages, "isEqual:"))
  {
    goto LABEL_384;
  }
  displayRegion = self->_displayRegion;
  if ((unint64_t)displayRegion | *((_QWORD *)v4 + 19))
  {
    if (!-[NSString isEqual:](displayRegion, "isEqual:"))
      goto LABEL_384;
  }
  v13 = (uint64_t)self->_flags;
  v14 = *((_QWORD *)v4 + 38);
  if ((v13 & 8) != 0)
  {
    if ((v14 & 8) == 0 || self->_maxTrafficSpeedSupported != *((_DWORD *)v4 + 62))
      goto LABEL_384;
  }
  else if ((v14 & 8) != 0)
  {
    goto LABEL_384;
  }
  if ((v13 & 4) != 0)
  {
    if ((v14 & 4) == 0 || self->_maxRouteIncidentSupported != *((_DWORD *)v4 + 61))
      goto LABEL_384;
  }
  else if ((v14 & 4) != 0)
  {
    goto LABEL_384;
  }
  if ((v13 & 1) != 0)
  {
    if ((v14 & 1) == 0 || self->_maxFormatterSupported != *((_DWORD *)v4 + 59))
      goto LABEL_384;
  }
  else if ((v14 & 1) != 0)
  {
    goto LABEL_384;
  }
  deviceCountryCode = self->_deviceCountryCode;
  if ((unint64_t)deviceCountryCode | *((_QWORD *)v4 + 16))
  {
    if (!-[NSString isEqual:](deviceCountryCode, "isEqual:"))
      goto LABEL_384;
    v13 = (uint64_t)self->_flags;
    v14 = *((_QWORD *)v4 + 38);
  }
  if ((v13 & 0x80) != 0)
  {
    if ((v14 & 0x80) == 0)
      goto LABEL_384;
    if (self->_clusteredTransitRoutesSupported)
    {
      if (!*((_BYTE *)v4 + 264))
        goto LABEL_384;
    }
    else if (*((_BYTE *)v4 + 264))
    {
      goto LABEL_384;
    }
  }
  else if ((v14 & 0x80) != 0)
  {
    goto LABEL_384;
  }
  if ((v13 & 0x4000) != 0)
  {
    if ((v14 & 0x4000) == 0)
      goto LABEL_384;
    if (self->_routeOptionsSupported)
    {
      if (!*((_BYTE *)v4 + 271))
        goto LABEL_384;
    }
    else if (*((_BYTE *)v4 + 271))
    {
      goto LABEL_384;
    }
  }
  else if ((v14 & 0x4000) != 0)
  {
    goto LABEL_384;
  }
  if ((v13 & 0x40) != 0)
  {
    if ((v14 & 0x40) == 0 || self->_transitMarketSupport != *((_DWORD *)v4 + 65))
      goto LABEL_384;
  }
  else if ((v14 & 0x40) != 0)
  {
    goto LABEL_384;
  }
  formattedStringClientCapabilities = self->_formattedStringClientCapabilities;
  if ((unint64_t)formattedStringClientCapabilities | *((_QWORD *)v4 + 20)
    && !-[GEOFormattedStringClientCapabilities isEqual:](formattedStringClientCapabilities, "isEqual:"))
  {
    goto LABEL_384;
  }
  advisoryClientCapabilities = self->_advisoryClientCapabilities;
  if ((unint64_t)advisoryClientCapabilities | *((_QWORD *)v4 + 13))
  {
    if (!-[GEOAdvisoryClientCapabilities isEqual:](advisoryClientCapabilities, "isEqual:"))
      goto LABEL_384;
  }
  v18 = (uint64_t)self->_flags;
  v19 = *((_QWORD *)v4 + 38);
  if ((v18 & 0x8000) != 0)
  {
    if ((v19 & 0x8000) == 0)
      goto LABEL_384;
    if (self->_snapToClosestStopSupported)
    {
      if (!*((_BYTE *)v4 + 272))
        goto LABEL_384;
    }
    else if (*((_BYTE *)v4 + 272))
    {
      goto LABEL_384;
    }
  }
  else if ((v19 & 0x8000) != 0)
  {
    goto LABEL_384;
  }
  if ((v18 & 0x100) != 0)
  {
    if ((v19 & 0x100) == 0)
      goto LABEL_384;
    if (self->_includeCrossLanguagePhonetics)
    {
      if (!*((_BYTE *)v4 + 265))
        goto LABEL_384;
    }
    else if (*((_BYTE *)v4 + 265))
    {
      goto LABEL_384;
    }
  }
  else if ((v19 & 0x100) != 0)
  {
    goto LABEL_384;
  }
  userCurrentTimezone = self->_userCurrentTimezone;
  if ((unint64_t)userCurrentTimezone | *((_QWORD *)v4 + 26))
  {
    if (!-[NSString isEqual:](userCurrentTimezone, "isEqual:"))
      goto LABEL_384;
    v18 = (uint64_t)self->_flags;
    v19 = *((_QWORD *)v4 + 38);
  }
  if ((v18 & 0x400000000) != 0)
  {
    if ((v19 & 0x400000000) == 0)
      goto LABEL_384;
    if (self->_supportsLongShieldStrings)
    {
      if (!*((_BYTE *)v4 + 291))
        goto LABEL_384;
    }
    else if (*((_BYTE *)v4 + 291))
    {
      goto LABEL_384;
    }
  }
  else if ((v19 & 0x400000000) != 0)
  {
    goto LABEL_384;
  }
  if ((v18 & 0x80000000) != 0)
  {
    if ((v19 & 0x80000000) == 0)
      goto LABEL_384;
    if (self->_supportsGuidanceEvents)
    {
      if (!*((_BYTE *)v4 + 288))
        goto LABEL_384;
    }
    else if (*((_BYTE *)v4 + 288))
    {
      goto LABEL_384;
    }
  }
  else if ((v19 & 0x80000000) != 0)
  {
    goto LABEL_384;
  }
  if ((v18 & 0x40000000) != 0)
  {
    if ((v19 & 0x40000000) == 0)
      goto LABEL_384;
    if (self->_supportsGuidanceEventsInlineShields)
    {
      if (!*((_BYTE *)v4 + 287))
        goto LABEL_384;
    }
    else if (*((_BYTE *)v4 + 287))
    {
      goto LABEL_384;
    }
  }
  else if ((v19 & 0x40000000) != 0)
  {
    goto LABEL_384;
  }
  abAssignInfo = self->_abAssignInfo;
  if ((unint64_t)abAssignInfo | *((_QWORD *)v4 + 12) && !-[GEOAbAssignInfo isEqual:](abAssignInfo, "isEqual:"))
    goto LABEL_384;
  requestTime = self->_requestTime;
  if ((unint64_t)requestTime | *((_QWORD *)v4 + 25))
  {
    if (!-[GEOLocalTime isEqual:](requestTime, "isEqual:"))
      goto LABEL_384;
  }
  v23 = *((_QWORD *)v4 + 38);
  if ((*(_QWORD *)&self->_flags & 0x20) != 0)
  {
    if ((v23 & 0x20) == 0 || self->_maxZilchMessageVersionSupported != *((_DWORD *)v4 + 64))
      goto LABEL_384;
  }
  else if ((v23 & 0x20) != 0)
  {
    goto LABEL_384;
  }
  if (!PBRepeatedInt32IsEqual())
  {
LABEL_384:
    v35 = 0;
    goto LABEL_385;
  }
  v24 = (uint64_t)self->_flags;
  v25 = *((_QWORD *)v4 + 38);
  if ((v24 & 0x40000) != 0)
  {
    if ((v25 & 0x40000) == 0)
      goto LABEL_384;
    if (self->_supportsArrivalMapRegion)
    {
      if (!*((_BYTE *)v4 + 275))
        goto LABEL_384;
    }
    else if (*((_BYTE *)v4 + 275))
    {
      goto LABEL_384;
    }
  }
  else if ((v25 & 0x40000) != 0)
  {
    goto LABEL_384;
  }
  if ((v24 & 0x800000000) != 0)
  {
    if ((v25 & 0x800000000) == 0)
      goto LABEL_384;
    if (self->_supportsNaturalGuidance)
    {
      if (!*((_BYTE *)v4 + 292))
        goto LABEL_384;
    }
    else if (*((_BYTE *)v4 + 292))
    {
      goto LABEL_384;
    }
  }
  else if ((v25 & 0x800000000) != 0)
  {
    goto LABEL_384;
  }
  if ((v24 & 0x100000000) != 0)
  {
    if ((v25 & 0x100000000) == 0)
      goto LABEL_384;
    if (self->_supportsJunctionView)
    {
      if (!*((_BYTE *)v4 + 289))
        goto LABEL_384;
    }
    else if (*((_BYTE *)v4 + 289))
    {
      goto LABEL_384;
    }
  }
  else if ((v25 & 0x100000000) != 0)
  {
    goto LABEL_384;
  }
  if ((v24 & 0x200000) != 0)
  {
    if ((v25 & 0x200000) == 0)
      goto LABEL_384;
    if (self->_supportsCongestionZones)
    {
      if (!*((_BYTE *)v4 + 278))
        goto LABEL_384;
    }
    else if (*((_BYTE *)v4 + 278))
    {
      goto LABEL_384;
    }
  }
  else if ((v25 & 0x200000) != 0)
  {
    goto LABEL_384;
  }
  if ((v24 & 0x200000000) != 0)
  {
    if ((v25 & 0x200000000) == 0)
      goto LABEL_384;
    if (self->_supportsLicensePlateRestrictions)
    {
      if (!*((_BYTE *)v4 + 290))
        goto LABEL_384;
    }
    else if (*((_BYTE *)v4 + 290))
    {
      goto LABEL_384;
    }
  }
  else if ((v25 & 0x200000000) != 0)
  {
    goto LABEL_384;
  }
  if ((v24 & 0x2000000) != 0)
  {
    if ((v25 & 0x2000000) == 0)
      goto LABEL_384;
    if (self->_supportsElectricVehicleRoutes)
    {
      if (!*((_BYTE *)v4 + 282))
        goto LABEL_384;
    }
    else if (*((_BYTE *)v4 + 282))
    {
      goto LABEL_384;
    }
  }
  else if ((v25 & 0x2000000) != 0)
  {
    goto LABEL_384;
  }
  if ((v24 & 0x20000000000) != 0)
  {
    if ((v25 & 0x20000000000) == 0)
      goto LABEL_384;
    if (self->_supportsTrafficCameras)
    {
      if (!*((_BYTE *)v4 + 298))
        goto LABEL_384;
    }
    else if (*((_BYTE *)v4 + 298))
    {
      goto LABEL_384;
    }
  }
  else if ((v25 & 0x20000000000) != 0)
  {
    goto LABEL_384;
  }
  if ((v24 & 0x100000000000) != 0)
  {
    if ((v25 & 0x100000000000) == 0)
      goto LABEL_384;
    if (self->_supportsWaypointRoutes)
    {
      if (!*((_BYTE *)v4 + 301))
        goto LABEL_384;
    }
    else if (*((_BYTE *)v4 + 301))
    {
      goto LABEL_384;
    }
  }
  else if ((v25 & 0x100000000000) != 0)
  {
    goto LABEL_384;
  }
  localizationCapabilities = self->_localizationCapabilities;
  if ((unint64_t)localizationCapabilities | *((_QWORD *)v4 + 23)
    && !-[GEOLocalizationCapabilities isEqual:](localizationCapabilities, "isEqual:"))
  {
    goto LABEL_384;
  }
  deviceSku = self->_deviceSku;
  if ((unint64_t)deviceSku | *((_QWORD *)v4 + 17))
  {
    if (!-[NSString isEqual:](deviceSku, "isEqual:"))
      goto LABEL_384;
  }
  osVersion = self->_osVersion;
  if ((unint64_t)osVersion | *((_QWORD *)v4 + 24))
  {
    if (!-[NSString isEqual:](osVersion, "isEqual:"))
      goto LABEL_384;
  }
  v29 = (uint64_t)self->_flags;
  v30 = *((_QWORD *)v4 + 38);
  if ((v29 & 0x200000000000) != 0)
  {
    if ((v30 & 0x200000000000) == 0)
      goto LABEL_384;
    if (self->_willSendEvDirectionsFeedback)
    {
      if (!*((_BYTE *)v4 + 302))
        goto LABEL_384;
    }
    else if (*((_BYTE *)v4 + 302))
    {
      goto LABEL_384;
    }
  }
  else if ((v30 & 0x200000000000) != 0)
  {
    goto LABEL_384;
  }
  if ((v29 & 0x1000000000) != 0)
  {
    if ((v30 & 0x1000000000) == 0)
      goto LABEL_384;
    if (self->_supportsRoadComplexities)
    {
      if (!*((_BYTE *)v4 + 293))
        goto LABEL_384;
    }
    else if (*((_BYTE *)v4 + 293))
    {
      goto LABEL_384;
    }
  }
  else if ((v30 & 0x1000000000) != 0)
  {
    goto LABEL_384;
  }
  if ((v29 & 0x10000000000) != 0)
  {
    if ((v30 & 0x10000000000) == 0)
      goto LABEL_384;
    if (self->_supportsSpeedTrapAnnouncements)
    {
      if (!*((_BYTE *)v4 + 297))
        goto LABEL_384;
    }
    else if (*((_BYTE *)v4 + 297))
    {
      goto LABEL_384;
    }
  }
  else if ((v30 & 0x10000000000) != 0)
  {
    goto LABEL_384;
  }
  if ((v29 & 0x40000000000) != 0)
  {
    if ((v30 & 0x40000000000) == 0)
      goto LABEL_384;
    if (self->_supportsUserIncidentReports)
    {
      if (!*((_BYTE *)v4 + 299))
        goto LABEL_384;
    }
    else if (*((_BYTE *)v4 + 299))
    {
      goto LABEL_384;
    }
  }
  else if ((v30 & 0x40000000000) != 0)
  {
    goto LABEL_384;
  }
  if ((v29 & 0x20000) != 0)
  {
    if ((v30 & 0x20000) == 0)
      goto LABEL_384;
    if (self->_supportsAreaEventsEnhancements)
    {
      if (!*((_BYTE *)v4 + 274))
        goto LABEL_384;
    }
    else if (*((_BYTE *)v4 + 274))
    {
      goto LABEL_384;
    }
  }
  else if ((v30 & 0x20000) != 0)
  {
    goto LABEL_384;
  }
  if ((v29 & 0x10000) != 0)
  {
    if ((v30 & 0x10000) == 0)
      goto LABEL_384;
    if (self->_supportsAdvancedMap)
    {
      if (!*((_BYTE *)v4 + 273))
        goto LABEL_384;
    }
    else if (*((_BYTE *)v4 + 273))
    {
      goto LABEL_384;
    }
  }
  else if ((v30 & 0x10000) != 0)
  {
    goto LABEL_384;
  }
  if ((v29 & 0x8000000000) != 0)
  {
    if ((v30 & 0x8000000000) == 0)
      goto LABEL_384;
    if (self->_supportsSilentRouteUpdates)
    {
      if (!*((_BYTE *)v4 + 296))
        goto LABEL_384;
    }
    else if (*((_BYTE *)v4 + 296))
    {
      goto LABEL_384;
    }
  }
  else if ((v30 & 0x8000000000) != 0)
  {
    goto LABEL_384;
  }
  if ((v29 & 0x2000) != 0)
  {
    if ((v30 & 0x2000) == 0)
      goto LABEL_384;
    if (self->_replaceAccidentStringWithCrash)
    {
      if (!*((_BYTE *)v4 + 270))
        goto LABEL_384;
    }
    else if (*((_BYTE *)v4 + 270))
    {
      goto LABEL_384;
    }
  }
  else if ((v30 & 0x2000) != 0)
  {
    goto LABEL_384;
  }
  if ((v29 & 0x20000000) != 0)
  {
    if ((v30 & 0x20000000) == 0)
      goto LABEL_384;
    if (self->_supportsGuidanceEventPrivacyFilters)
    {
      if (!*((_BYTE *)v4 + 286))
        goto LABEL_384;
    }
    else if (*((_BYTE *)v4 + 286))
    {
      goto LABEL_384;
    }
  }
  else if ((v30 & 0x20000000) != 0)
  {
    goto LABEL_384;
  }
  if ((v29 & 0x10000000) != 0)
  {
    if ((v30 & 0x10000000) == 0)
      goto LABEL_384;
    if (self->_supportsGuidanceEventImportanceInfo)
    {
      if (!*((_BYTE *)v4 + 285))
        goto LABEL_384;
    }
    else if (*((_BYTE *)v4 + 285))
    {
      goto LABEL_384;
    }
  }
  else if ((v30 & 0x10000000) != 0)
  {
    goto LABEL_384;
  }
  if ((v29 & 0x800) != 0)
  {
    if ((v30 & 0x800) == 0)
      goto LABEL_384;
    if (self->_isAdvancedMap)
    {
      if (!*((_BYTE *)v4 + 268))
        goto LABEL_384;
    }
    else if (*((_BYTE *)v4 + 268))
    {
      goto LABEL_384;
    }
  }
  else if ((v30 & 0x800) != 0)
  {
    goto LABEL_384;
  }
  if ((v29 & 0x1000) != 0)
  {
    if ((v30 & 0x1000) == 0)
      goto LABEL_384;
    if (self->_isGlobeProjection)
    {
      if (!*((_BYTE *)v4 + 269))
        goto LABEL_384;
    }
    else if (*((_BYTE *)v4 + 269))
    {
      goto LABEL_384;
    }
  }
  else if ((v30 & 0x1000) != 0)
  {
    goto LABEL_384;
  }
  if (!PBRepeatedInt32IsEqual())
    goto LABEL_384;
  v31 = (uint64_t)self->_flags;
  v32 = *((_QWORD *)v4 + 38);
  if ((v31 & 0x400000) != 0)
  {
    if ((v32 & 0x400000) == 0)
      goto LABEL_384;
    if (self->_supportsDefaultToNewRouteFlag)
    {
      if (!*((_BYTE *)v4 + 279))
        goto LABEL_384;
    }
    else if (*((_BYTE *)v4 + 279))
    {
      goto LABEL_384;
    }
  }
  else if ((v32 & 0x400000) != 0)
  {
    goto LABEL_384;
  }
  walkingSupportedFeatures = self->_walkingSupportedFeatures;
  if ((unint64_t)walkingSupportedFeatures | *((_QWORD *)v4 + 27))
  {
    if (!-[GEOWalkingSupportedFeatures isEqual:](walkingSupportedFeatures, "isEqual:"))
      goto LABEL_384;
    v31 = (uint64_t)self->_flags;
    v32 = *((_QWORD *)v4 + 38);
  }
  if ((v31 & 0x10) != 0)
  {
    if ((v32 & 0x10) == 0 || self->_maxSupportedTransitFareVersion != *((_DWORD *)v4 + 63))
      goto LABEL_384;
  }
  else if ((v32 & 0x10) != 0)
  {
    goto LABEL_384;
  }
  if ((v31 & 0x800000) != 0)
  {
    if ((v32 & 0x800000) == 0)
      goto LABEL_384;
    if (self->_supportsDisablingProgressBarFromBannerButtons)
    {
      if (!*((_BYTE *)v4 + 280))
        goto LABEL_384;
    }
    else if (*((_BYTE *)v4 + 280))
    {
      goto LABEL_384;
    }
  }
  else if ((v32 & 0x800000) != 0)
  {
    goto LABEL_384;
  }
  if ((v31 & 0x100000) != 0)
  {
    if ((v32 & 0x100000) == 0)
      goto LABEL_384;
    if (self->_supportsBannerQueuing)
    {
      if (!*((_BYTE *)v4 + 277))
        goto LABEL_384;
    }
    else if (*((_BYTE *)v4 + 277))
    {
      goto LABEL_384;
    }
  }
  else if ((v32 & 0x100000) != 0)
  {
    goto LABEL_384;
  }
  if ((v31 & 0x4000000) != 0)
  {
    if ((v32 & 0x4000000) == 0)
      goto LABEL_384;
    if (self->_supportsEv2)
    {
      if (!*((_BYTE *)v4 + 283))
        goto LABEL_384;
    }
    else if (*((_BYTE *)v4 + 283))
    {
      goto LABEL_384;
    }
  }
  else if ((v32 & 0x4000000) != 0)
  {
    goto LABEL_384;
  }
  if ((v31 & 0x4000000000) != 0)
  {
    if ((v32 & 0x4000000000) == 0)
      goto LABEL_384;
    if (self->_supportsRouteNameRanges)
    {
      if (!*((_BYTE *)v4 + 295))
        goto LABEL_384;
    }
    else if (*((_BYTE *)v4 + 295))
    {
      goto LABEL_384;
    }
  }
  else if ((v32 & 0x4000000000) != 0)
  {
    goto LABEL_384;
  }
  if ((v31 & 0x80000000000) != 0)
  {
    if ((v32 & 0x80000000000) == 0)
      goto LABEL_384;
    if (self->_supportsWalkingSuggestionsAfterParking)
    {
      if (!*((_BYTE *)v4 + 300))
        goto LABEL_384;
    }
    else if (*((_BYTE *)v4 + 300))
    {
      goto LABEL_384;
    }
  }
  else if ((v32 & 0x80000000000) != 0)
  {
    goto LABEL_384;
  }
  if ((v31 & 0x8000000) != 0)
  {
    if ((v32 & 0x8000000) == 0)
      goto LABEL_384;
    if (self->_supportsGenericCombinationsInstructionsForAllModes)
    {
      if (!*((_BYTE *)v4 + 284))
        goto LABEL_384;
    }
    else if (*((_BYTE *)v4 + 284))
    {
      goto LABEL_384;
    }
  }
  else if ((v32 & 0x8000000) != 0)
  {
    goto LABEL_384;
  }
  if ((v31 & 0x2000000000) != 0)
  {
    if ((v32 & 0x2000000000) == 0)
      goto LABEL_384;
    if (self->_supportsRouteCameraInputUpdates)
    {
      if (!*((_BYTE *)v4 + 294))
        goto LABEL_384;
    }
    else if (*((_BYTE *)v4 + 294))
    {
      goto LABEL_384;
    }
  }
  else if ((v32 & 0x2000000000) != 0)
  {
    goto LABEL_384;
  }
  if ((v31 & 0x1000000) != 0)
  {
    if ((v32 & 0x1000000) == 0)
      goto LABEL_384;
    if (self->_supportsDodgeballCameraInput)
    {
      if (!*((_BYTE *)v4 + 281))
        goto LABEL_384;
    }
    else if (*((_BYTE *)v4 + 281))
    {
      goto LABEL_384;
    }
  }
  else if ((v32 & 0x1000000) != 0)
  {
    goto LABEL_384;
  }
  if (!PBRepeatedInt32IsEqual())
    goto LABEL_384;
  v34 = *((_QWORD *)v4 + 38);
  if ((*(_QWORD *)&self->_flags & 0x80000) != 0)
  {
    if ((v34 & 0x80000) != 0)
    {
      if (self->_supportsBannerQueuingDirections)
      {
        if (!*((_BYTE *)v4 + 276))
          goto LABEL_384;
      }
      else if (*((_BYTE *)v4 + 276))
      {
        goto LABEL_384;
      }
      v35 = 1;
      goto LABEL_385;
    }
    goto LABEL_384;
  }
  v35 = (v34 & 0x80000) == 0;
LABEL_385:

  return v35;
}

- (unint64_t)hash
{
  uint64_t flags;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  NSUInteger v38;
  NSUInteger v39;
  unint64_t v40;
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
  unint64_t v51;
  unint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  NSUInteger v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  unint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  NSUInteger v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  NSUInteger v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  NSUInteger v73;
  NSUInteger v74;
  NSUInteger v75;
  NSUInteger v76;

  -[GEOClientCapabilities readAll:](self, "readAll:", 1);
  v76 = -[NSString hash](self->_appMajorVersion, "hash");
  v75 = -[NSString hash](self->_appMinorVersion, "hash");
  v74 = -[NSString hash](self->_hardwareModel, "hash");
  v73 = -[NSString hash](self->_hardwareClass, "hash");
  flags = (uint64_t)self->_flags;
  if ((flags & 2) == 0)
  {
    v72 = 0;
    if ((flags & 0x200) != 0)
      goto LABEL_3;
LABEL_6:
    v71 = 0;
    if ((flags & 0x400) != 0)
      goto LABEL_4;
    goto LABEL_7;
  }
  v72 = 2654435761 * self->_maxManeuverTypeSupported;
  if ((flags & 0x200) == 0)
    goto LABEL_6;
LABEL_3:
  v71 = 2654435761 * self->_internalInstall;
  if ((flags & 0x400) != 0)
  {
LABEL_4:
    v70 = 2654435761 * self->_internalTool;
    goto LABEL_8;
  }
LABEL_7:
  v70 = 0;
LABEL_8:
  v69 = -[NSMutableArray hash](self->_displayLanguages, "hash");
  v68 = -[NSString hash](self->_displayRegion, "hash");
  v4 = (uint64_t)self->_flags;
  if ((v4 & 8) == 0)
  {
    v67 = 0;
    if ((v4 & 4) != 0)
      goto LABEL_10;
LABEL_13:
    v66 = 0;
    if ((v4 & 1) != 0)
      goto LABEL_11;
    goto LABEL_14;
  }
  v67 = 2654435761 * self->_maxTrafficSpeedSupported;
  if ((v4 & 4) == 0)
    goto LABEL_13;
LABEL_10:
  v66 = 2654435761 * self->_maxRouteIncidentSupported;
  if ((v4 & 1) != 0)
  {
LABEL_11:
    v65 = 2654435761 * self->_maxFormatterSupported;
    goto LABEL_15;
  }
LABEL_14:
  v65 = 0;
LABEL_15:
  v64 = -[NSString hash](self->_deviceCountryCode, "hash");
  v5 = (uint64_t)self->_flags;
  if ((v5 & 0x80) == 0)
  {
    v63 = 0;
    if ((v5 & 0x4000) != 0)
      goto LABEL_17;
LABEL_20:
    v62 = 0;
    if ((v5 & 0x40) != 0)
      goto LABEL_18;
    goto LABEL_21;
  }
  v63 = 2654435761 * self->_clusteredTransitRoutesSupported;
  if ((v5 & 0x4000) == 0)
    goto LABEL_20;
LABEL_17:
  v62 = 2654435761 * self->_routeOptionsSupported;
  if ((v5 & 0x40) != 0)
  {
LABEL_18:
    v61 = 2654435761 * self->_transitMarketSupport;
    goto LABEL_22;
  }
LABEL_21:
  v61 = 0;
LABEL_22:
  v60 = -[GEOFormattedStringClientCapabilities hash](self->_formattedStringClientCapabilities, "hash");
  v59 = -[GEOAdvisoryClientCapabilities hash](self->_advisoryClientCapabilities, "hash");
  v6 = (uint64_t)self->_flags;
  if ((v6 & 0x8000) != 0)
  {
    v58 = 2654435761 * self->_snapToClosestStopSupported;
    if ((v6 & 0x100) != 0)
      goto LABEL_24;
  }
  else
  {
    v58 = 0;
    if ((v6 & 0x100) != 0)
    {
LABEL_24:
      v57 = 2654435761 * self->_includeCrossLanguagePhonetics;
      goto LABEL_27;
    }
  }
  v57 = 0;
LABEL_27:
  v56 = -[NSString hash](self->_userCurrentTimezone, "hash");
  v7 = (uint64_t)self->_flags;
  if ((v7 & 0x400000000) == 0)
  {
    v55 = 0;
    if ((v7 & 0x80000000) != 0)
      goto LABEL_29;
LABEL_32:
    v54 = 0;
    if ((v7 & 0x40000000) != 0)
      goto LABEL_30;
    goto LABEL_33;
  }
  v55 = 2654435761 * self->_supportsLongShieldStrings;
  if ((v7 & 0x80000000) == 0)
    goto LABEL_32;
LABEL_29:
  v54 = 2654435761 * self->_supportsGuidanceEvents;
  if ((v7 & 0x40000000) != 0)
  {
LABEL_30:
    v53 = 2654435761 * self->_supportsGuidanceEventsInlineShields;
    goto LABEL_34;
  }
LABEL_33:
  v53 = 0;
LABEL_34:
  v52 = -[GEOAbAssignInfo hash](self->_abAssignInfo, "hash");
  v51 = -[GEOLocalTime hash](self->_requestTime, "hash");
  if ((*(_QWORD *)&self->_flags & 0x20) != 0)
    v50 = 2654435761 * self->_maxZilchMessageVersionSupported;
  else
    v50 = 0;
  v49 = PBRepeatedInt32Hash();
  v8 = (uint64_t)self->_flags;
  if ((v8 & 0x40000) != 0)
  {
    v48 = 2654435761 * self->_supportsArrivalMapRegion;
    if ((v8 & 0x800000000) != 0)
    {
LABEL_39:
      v47 = 2654435761 * self->_supportsNaturalGuidance;
      if ((v8 & 0x100000000) != 0)
        goto LABEL_40;
      goto LABEL_48;
    }
  }
  else
  {
    v48 = 0;
    if ((v8 & 0x800000000) != 0)
      goto LABEL_39;
  }
  v47 = 0;
  if ((v8 & 0x100000000) != 0)
  {
LABEL_40:
    v46 = 2654435761 * self->_supportsJunctionView;
    if ((v8 & 0x200000) != 0)
      goto LABEL_41;
    goto LABEL_49;
  }
LABEL_48:
  v46 = 0;
  if ((v8 & 0x200000) != 0)
  {
LABEL_41:
    v45 = 2654435761 * self->_supportsCongestionZones;
    if ((v8 & 0x200000000) != 0)
      goto LABEL_42;
    goto LABEL_50;
  }
LABEL_49:
  v45 = 0;
  if ((v8 & 0x200000000) != 0)
  {
LABEL_42:
    v44 = 2654435761 * self->_supportsLicensePlateRestrictions;
    if ((v8 & 0x2000000) != 0)
      goto LABEL_43;
    goto LABEL_51;
  }
LABEL_50:
  v44 = 0;
  if ((v8 & 0x2000000) != 0)
  {
LABEL_43:
    v43 = 2654435761 * self->_supportsElectricVehicleRoutes;
    if ((v8 & 0x20000000000) != 0)
      goto LABEL_44;
LABEL_52:
    v42 = 0;
    if ((v8 & 0x100000000000) != 0)
      goto LABEL_45;
    goto LABEL_53;
  }
LABEL_51:
  v43 = 0;
  if ((v8 & 0x20000000000) == 0)
    goto LABEL_52;
LABEL_44:
  v42 = 2654435761 * self->_supportsTrafficCameras;
  if ((v8 & 0x100000000000) != 0)
  {
LABEL_45:
    v41 = 2654435761 * self->_supportsWaypointRoutes;
    goto LABEL_54;
  }
LABEL_53:
  v41 = 0;
LABEL_54:
  v40 = -[GEOLocalizationCapabilities hash](self->_localizationCapabilities, "hash");
  v39 = -[NSString hash](self->_deviceSku, "hash");
  v38 = -[NSString hash](self->_osVersion, "hash");
  v9 = (uint64_t)self->_flags;
  if ((v9 & 0x200000000000) != 0)
  {
    v37 = 2654435761 * self->_willSendEvDirectionsFeedback;
    if ((v9 & 0x1000000000) != 0)
    {
LABEL_56:
      v36 = 2654435761 * self->_supportsRoadComplexities;
      if ((v9 & 0x10000000000) != 0)
        goto LABEL_57;
      goto LABEL_69;
    }
  }
  else
  {
    v37 = 0;
    if ((v9 & 0x1000000000) != 0)
      goto LABEL_56;
  }
  v36 = 0;
  if ((v9 & 0x10000000000) != 0)
  {
LABEL_57:
    v35 = 2654435761 * self->_supportsSpeedTrapAnnouncements;
    if ((v9 & 0x40000000000) != 0)
      goto LABEL_58;
    goto LABEL_70;
  }
LABEL_69:
  v35 = 0;
  if ((v9 & 0x40000000000) != 0)
  {
LABEL_58:
    v34 = 2654435761 * self->_supportsUserIncidentReports;
    if ((v9 & 0x20000) != 0)
      goto LABEL_59;
    goto LABEL_71;
  }
LABEL_70:
  v34 = 0;
  if ((v9 & 0x20000) != 0)
  {
LABEL_59:
    v33 = 2654435761 * self->_supportsAreaEventsEnhancements;
    if ((v9 & 0x10000) != 0)
      goto LABEL_60;
    goto LABEL_72;
  }
LABEL_71:
  v33 = 0;
  if ((v9 & 0x10000) != 0)
  {
LABEL_60:
    v32 = 2654435761 * self->_supportsAdvancedMap;
    if ((v9 & 0x8000000000) != 0)
      goto LABEL_61;
    goto LABEL_73;
  }
LABEL_72:
  v32 = 0;
  if ((v9 & 0x8000000000) != 0)
  {
LABEL_61:
    v31 = 2654435761 * self->_supportsSilentRouteUpdates;
    if ((v9 & 0x2000) != 0)
      goto LABEL_62;
    goto LABEL_74;
  }
LABEL_73:
  v31 = 0;
  if ((v9 & 0x2000) != 0)
  {
LABEL_62:
    v30 = 2654435761 * self->_replaceAccidentStringWithCrash;
    if ((v9 & 0x20000000) != 0)
      goto LABEL_63;
    goto LABEL_75;
  }
LABEL_74:
  v30 = 0;
  if ((v9 & 0x20000000) != 0)
  {
LABEL_63:
    v29 = 2654435761 * self->_supportsGuidanceEventPrivacyFilters;
    if ((v9 & 0x10000000) != 0)
      goto LABEL_64;
    goto LABEL_76;
  }
LABEL_75:
  v29 = 0;
  if ((v9 & 0x10000000) != 0)
  {
LABEL_64:
    v28 = 2654435761 * self->_supportsGuidanceEventImportanceInfo;
    if ((v9 & 0x800) != 0)
      goto LABEL_65;
LABEL_77:
    v27 = 0;
    if ((v9 & 0x1000) != 0)
      goto LABEL_66;
    goto LABEL_78;
  }
LABEL_76:
  v28 = 0;
  if ((v9 & 0x800) == 0)
    goto LABEL_77;
LABEL_65:
  v27 = 2654435761 * self->_isAdvancedMap;
  if ((v9 & 0x1000) != 0)
  {
LABEL_66:
    v26 = 2654435761 * self->_isGlobeProjection;
    goto LABEL_79;
  }
LABEL_78:
  v26 = 0;
LABEL_79:
  v25 = PBRepeatedInt32Hash();
  if ((*(_QWORD *)&self->_flags & 0x400000) != 0)
    v24 = 2654435761 * self->_supportsDefaultToNewRouteFlag;
  else
    v24 = 0;
  v23 = -[GEOWalkingSupportedFeatures hash](self->_walkingSupportedFeatures, "hash");
  v10 = (uint64_t)self->_flags;
  if ((v10 & 0x10) != 0)
  {
    v22 = 2654435761 * self->_maxSupportedTransitFareVersion;
    if ((v10 & 0x800000) != 0)
    {
LABEL_84:
      v21 = 2654435761 * self->_supportsDisablingProgressBarFromBannerButtons;
      if ((v10 & 0x100000) != 0)
        goto LABEL_85;
      goto LABEL_94;
    }
  }
  else
  {
    v22 = 0;
    if ((v10 & 0x800000) != 0)
      goto LABEL_84;
  }
  v21 = 0;
  if ((v10 & 0x100000) != 0)
  {
LABEL_85:
    v11 = 2654435761 * self->_supportsBannerQueuing;
    if ((v10 & 0x4000000) != 0)
      goto LABEL_86;
    goto LABEL_95;
  }
LABEL_94:
  v11 = 0;
  if ((v10 & 0x4000000) != 0)
  {
LABEL_86:
    v12 = 2654435761 * self->_supportsEv2;
    if ((v10 & 0x4000000000) != 0)
      goto LABEL_87;
    goto LABEL_96;
  }
LABEL_95:
  v12 = 0;
  if ((v10 & 0x4000000000) != 0)
  {
LABEL_87:
    v13 = 2654435761 * self->_supportsRouteNameRanges;
    if ((v10 & 0x80000000000) != 0)
      goto LABEL_88;
    goto LABEL_97;
  }
LABEL_96:
  v13 = 0;
  if ((v10 & 0x80000000000) != 0)
  {
LABEL_88:
    v14 = 2654435761 * self->_supportsWalkingSuggestionsAfterParking;
    if ((v10 & 0x8000000) != 0)
      goto LABEL_89;
    goto LABEL_98;
  }
LABEL_97:
  v14 = 0;
  if ((v10 & 0x8000000) != 0)
  {
LABEL_89:
    v15 = 2654435761 * self->_supportsGenericCombinationsInstructionsForAllModes;
    if ((v10 & 0x2000000000) != 0)
      goto LABEL_90;
LABEL_99:
    v16 = 0;
    if ((v10 & 0x1000000) != 0)
      goto LABEL_91;
    goto LABEL_100;
  }
LABEL_98:
  v15 = 0;
  if ((v10 & 0x2000000000) == 0)
    goto LABEL_99;
LABEL_90:
  v16 = 2654435761 * self->_supportsRouteCameraInputUpdates;
  if ((v10 & 0x1000000) != 0)
  {
LABEL_91:
    v17 = 2654435761 * self->_supportsDodgeballCameraInput;
    goto LABEL_101;
  }
LABEL_100:
  v17 = 0;
LABEL_101:
  v18 = PBRepeatedInt32Hash();
  if ((*(_QWORD *)&self->_flags & 0x80000) != 0)
    v19 = 2654435761 * self->_supportsBannerQueuingDirections;
  else
    v19 = 0;
  return v75 ^ v76 ^ v74 ^ v73 ^ v72 ^ v71 ^ v70 ^ v69 ^ v68 ^ v67 ^ v66 ^ v65 ^ v64 ^ v63 ^ v62 ^ v61 ^ v60 ^ v59 ^ v58 ^ v57 ^ v56 ^ v55 ^ v54 ^ v53 ^ v52 ^ v51 ^ v50 ^ v49 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19;
}

- (void)mergeFrom:(id)a3
{
  char *v4;
  uint64_t *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  GEOFormattedStringClientCapabilities *formattedStringClientCapabilities;
  uint64_t v17;
  GEOAdvisoryClientCapabilities *advisoryClientCapabilities;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  GEOAbAssignInfo *abAssignInfo;
  uint64_t v24;
  GEOLocalTime *requestTime;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  uint64_t *v30;
  uint64_t v31;
  GEOLocalizationCapabilities *localizationCapabilities;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t k;
  GEOWalkingSupportedFeatures *walkingSupportedFeatures;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t m;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v4 = (char *)a3;
  objc_msgSend(v4, "readAll:", 0);
  if (*((_QWORD *)v4 + 14))
    -[GEOClientCapabilities setAppMajorVersion:](self, "setAppMajorVersion:");
  if (*((_QWORD *)v4 + 15))
    -[GEOClientCapabilities setAppMinorVersion:](self, "setAppMinorVersion:");
  if (*((_QWORD *)v4 + 21))
    -[GEOClientCapabilities setHardwareModel:](self, "setHardwareModel:");
  if (*((_QWORD *)v4 + 22))
    -[GEOClientCapabilities setHardwareClass:](self, "setHardwareClass:");
  v5 = (uint64_t *)(v4 + 304);
  v6 = *((_QWORD *)v4 + 38);
  if ((v6 & 2) != 0)
  {
    self->_maxManeuverTypeSupported = *((_DWORD *)v4 + 60);
    *(_QWORD *)&self->_flags |= 2uLL;
    v6 = *v5;
    if ((*v5 & 0x200) == 0)
    {
LABEL_11:
      if ((v6 & 0x400) == 0)
        goto LABEL_13;
      goto LABEL_12;
    }
  }
  else if ((v6 & 0x200) == 0)
  {
    goto LABEL_11;
  }
  self->_internalInstall = v4[266];
  *(_QWORD *)&self->_flags |= 0x200uLL;
  if ((*((_QWORD *)v4 + 38) & 0x400) != 0)
  {
LABEL_12:
    self->_internalTool = v4[267];
    *(_QWORD *)&self->_flags |= 0x400uLL;
  }
LABEL_13:
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v7 = *((id *)v4 + 18);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v47;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v47 != v10)
          objc_enumerationMutation(v7);
        -[GEOClientCapabilities addDisplayLanguages:](self, "addDisplayLanguages:", *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * i), (_QWORD)v46);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
    }
    while (v9);
  }

  if (*((_QWORD *)v4 + 19))
    -[GEOClientCapabilities setDisplayRegion:](self, "setDisplayRegion:");
  v12 = (uint64_t *)(v4 + 304);
  v13 = *((_QWORD *)v4 + 38);
  if ((v13 & 8) != 0)
  {
    self->_maxTrafficSpeedSupported = *((_DWORD *)v4 + 62);
    *(_QWORD *)&self->_flags |= 8uLL;
    v13 = *v12;
    if ((*v12 & 4) == 0)
    {
LABEL_24:
      if ((v13 & 1) == 0)
        goto LABEL_26;
      goto LABEL_25;
    }
  }
  else if ((v13 & 4) == 0)
  {
    goto LABEL_24;
  }
  self->_maxRouteIncidentSupported = *((_DWORD *)v4 + 61);
  *(_QWORD *)&self->_flags |= 4uLL;
  if ((*((_QWORD *)v4 + 38) & 1) != 0)
  {
LABEL_25:
    self->_maxFormatterSupported = *((_DWORD *)v4 + 59);
    *(_QWORD *)&self->_flags |= 1uLL;
  }
LABEL_26:
  if (*((_QWORD *)v4 + 16))
    -[GEOClientCapabilities setDeviceCountryCode:](self, "setDeviceCountryCode:");
  v14 = (uint64_t *)(v4 + 304);
  v15 = *((_QWORD *)v4 + 38);
  if ((v15 & 0x80) != 0)
  {
    self->_clusteredTransitRoutesSupported = v4[264];
    *(_QWORD *)&self->_flags |= 0x80uLL;
    v15 = *v14;
    if ((*v14 & 0x4000) == 0)
    {
LABEL_30:
      if ((v15 & 0x40) == 0)
        goto LABEL_32;
      goto LABEL_31;
    }
  }
  else if ((v15 & 0x4000) == 0)
  {
    goto LABEL_30;
  }
  self->_routeOptionsSupported = v4[271];
  *(_QWORD *)&self->_flags |= 0x4000uLL;
  if ((*((_QWORD *)v4 + 38) & 0x40) != 0)
  {
LABEL_31:
    self->_transitMarketSupport = *((_DWORD *)v4 + 65);
    *(_QWORD *)&self->_flags |= 0x40uLL;
  }
LABEL_32:
  formattedStringClientCapabilities = self->_formattedStringClientCapabilities;
  v17 = *((_QWORD *)v4 + 20);
  if (formattedStringClientCapabilities)
  {
    if (v17)
      -[GEOFormattedStringClientCapabilities mergeFrom:](formattedStringClientCapabilities, "mergeFrom:");
  }
  else if (v17)
  {
    -[GEOClientCapabilities setFormattedStringClientCapabilities:](self, "setFormattedStringClientCapabilities:");
  }
  advisoryClientCapabilities = self->_advisoryClientCapabilities;
  v19 = *((_QWORD *)v4 + 13);
  if (advisoryClientCapabilities)
  {
    if (v19)
      -[GEOAdvisoryClientCapabilities mergeFrom:](advisoryClientCapabilities, "mergeFrom:");
  }
  else if (v19)
  {
    -[GEOClientCapabilities setAdvisoryClientCapabilities:](self, "setAdvisoryClientCapabilities:");
  }
  v20 = *((_QWORD *)v4 + 38);
  if ((v20 & 0x8000) != 0)
  {
    self->_snapToClosestStopSupported = v4[272];
    *(_QWORD *)&self->_flags |= 0x8000uLL;
    v20 = *((_QWORD *)v4 + 38);
  }
  if ((v20 & 0x100) != 0)
  {
    self->_includeCrossLanguagePhonetics = v4[265];
    *(_QWORD *)&self->_flags |= 0x100uLL;
  }
  if (*((_QWORD *)v4 + 26))
    -[GEOClientCapabilities setUserCurrentTimezone:](self, "setUserCurrentTimezone:");
  v21 = (uint64_t *)(v4 + 304);
  v22 = *((_QWORD *)v4 + 38);
  if ((v22 & 0x400000000) != 0)
  {
    self->_supportsLongShieldStrings = v4[291];
    *(_QWORD *)&self->_flags |= 0x400000000uLL;
    v22 = *v21;
    if ((*v21 & 0x80000000) == 0)
    {
LABEL_59:
      if ((v22 & 0x40000000) == 0)
        goto LABEL_61;
      goto LABEL_60;
    }
  }
  else if ((v22 & 0x80000000) == 0)
  {
    goto LABEL_59;
  }
  self->_supportsGuidanceEvents = v4[288];
  *(_QWORD *)&self->_flags |= 0x80000000uLL;
  if ((*((_QWORD *)v4 + 38) & 0x40000000) != 0)
  {
LABEL_60:
    self->_supportsGuidanceEventsInlineShields = v4[287];
    *(_QWORD *)&self->_flags |= 0x40000000uLL;
  }
LABEL_61:
  abAssignInfo = self->_abAssignInfo;
  v24 = *((_QWORD *)v4 + 12);
  if (abAssignInfo)
  {
    if (v24)
      -[GEOAbAssignInfo mergeFrom:](abAssignInfo, "mergeFrom:");
  }
  else if (v24)
  {
    -[GEOClientCapabilities setAbAssignInfo:](self, "setAbAssignInfo:");
  }
  requestTime = self->_requestTime;
  v26 = *((_QWORD *)v4 + 25);
  if (requestTime)
  {
    if (v26)
      -[GEOLocalTime mergeFrom:](requestTime, "mergeFrom:");
  }
  else if (v26)
  {
    -[GEOClientCapabilities setRequestTime:](self, "setRequestTime:");
  }
  if ((*((_QWORD *)v4 + 38) & 0x20) != 0)
  {
    self->_maxZilchMessageVersionSupported = *((_DWORD *)v4 + 64);
    *(_QWORD *)&self->_flags |= 0x20uLL;
  }
  v27 = objc_msgSend(v4, "supportedTransitFeaturesCount", (_QWORD)v46);
  if (v27)
  {
    v28 = v27;
    for (j = 0; j != v28; ++j)
      -[GEOClientCapabilities addSupportedTransitFeature:](self, "addSupportedTransitFeature:", objc_msgSend(v4, "supportedTransitFeatureAtIndex:", j));
  }
  v30 = (uint64_t *)(v4 + 304);
  v31 = *((_QWORD *)v4 + 38);
  if ((v31 & 0x40000) != 0)
  {
    self->_supportsArrivalMapRegion = v4[275];
    *(_QWORD *)&self->_flags |= 0x40000uLL;
    v31 = *v30;
    if ((*v30 & 0x800000000) == 0)
    {
LABEL_81:
      if ((v31 & 0x100000000) == 0)
        goto LABEL_82;
      goto LABEL_93;
    }
  }
  else if ((v31 & 0x800000000) == 0)
  {
    goto LABEL_81;
  }
  self->_supportsNaturalGuidance = v4[292];
  *(_QWORD *)&self->_flags |= 0x800000000uLL;
  v31 = *((_QWORD *)v4 + 38);
  if ((v31 & 0x100000000) == 0)
  {
LABEL_82:
    if ((v31 & 0x200000) == 0)
      goto LABEL_83;
    goto LABEL_94;
  }
LABEL_93:
  self->_supportsJunctionView = v4[289];
  *(_QWORD *)&self->_flags |= 0x100000000uLL;
  v31 = *((_QWORD *)v4 + 38);
  if ((v31 & 0x200000) == 0)
  {
LABEL_83:
    if ((v31 & 0x200000000) == 0)
      goto LABEL_84;
    goto LABEL_95;
  }
LABEL_94:
  self->_supportsCongestionZones = v4[278];
  *(_QWORD *)&self->_flags |= 0x200000uLL;
  v31 = *((_QWORD *)v4 + 38);
  if ((v31 & 0x200000000) == 0)
  {
LABEL_84:
    if ((v31 & 0x2000000) == 0)
      goto LABEL_85;
    goto LABEL_96;
  }
LABEL_95:
  self->_supportsLicensePlateRestrictions = v4[290];
  *(_QWORD *)&self->_flags |= 0x200000000uLL;
  v31 = *((_QWORD *)v4 + 38);
  if ((v31 & 0x2000000) == 0)
  {
LABEL_85:
    if ((v31 & 0x20000000000) == 0)
      goto LABEL_86;
    goto LABEL_97;
  }
LABEL_96:
  self->_supportsElectricVehicleRoutes = v4[282];
  *(_QWORD *)&self->_flags |= 0x2000000uLL;
  v31 = *((_QWORD *)v4 + 38);
  if ((v31 & 0x20000000000) == 0)
  {
LABEL_86:
    if ((v31 & 0x100000000000) == 0)
      goto LABEL_88;
    goto LABEL_87;
  }
LABEL_97:
  self->_supportsTrafficCameras = v4[298];
  *(_QWORD *)&self->_flags |= 0x20000000000uLL;
  if ((*((_QWORD *)v4 + 38) & 0x100000000000) != 0)
  {
LABEL_87:
    self->_supportsWaypointRoutes = v4[301];
    *(_QWORD *)&self->_flags |= 0x100000000000uLL;
  }
LABEL_88:
  localizationCapabilities = self->_localizationCapabilities;
  v33 = *((_QWORD *)v4 + 23);
  if (localizationCapabilities)
  {
    if (v33)
      -[GEOLocalizationCapabilities mergeFrom:](localizationCapabilities, "mergeFrom:");
  }
  else if (v33)
  {
    -[GEOClientCapabilities setLocalizationCapabilities:](self, "setLocalizationCapabilities:");
  }
  if (*((_QWORD *)v4 + 17))
    -[GEOClientCapabilities setDeviceSku:](self, "setDeviceSku:");
  if (*((_QWORD *)v4 + 24))
    -[GEOClientCapabilities setOsVersion:](self, "setOsVersion:");
  v34 = (uint64_t *)(v4 + 304);
  v35 = *((_QWORD *)v4 + 38);
  if ((v35 & 0x200000000000) != 0)
  {
    self->_willSendEvDirectionsFeedback = v4[302];
    *(_QWORD *)&self->_flags |= 0x200000000000uLL;
    v35 = *v34;
    if ((*v34 & 0x1000000000) == 0)
    {
LABEL_107:
      if ((v35 & 0x10000000000) == 0)
        goto LABEL_108;
      goto LABEL_128;
    }
  }
  else if ((v35 & 0x1000000000) == 0)
  {
    goto LABEL_107;
  }
  self->_supportsRoadComplexities = v4[293];
  *(_QWORD *)&self->_flags |= 0x1000000000uLL;
  v35 = *((_QWORD *)v4 + 38);
  if ((v35 & 0x10000000000) == 0)
  {
LABEL_108:
    if ((v35 & 0x40000000000) == 0)
      goto LABEL_109;
    goto LABEL_129;
  }
LABEL_128:
  self->_supportsSpeedTrapAnnouncements = v4[297];
  *(_QWORD *)&self->_flags |= 0x10000000000uLL;
  v35 = *((_QWORD *)v4 + 38);
  if ((v35 & 0x40000000000) == 0)
  {
LABEL_109:
    if ((v35 & 0x20000) == 0)
      goto LABEL_110;
    goto LABEL_130;
  }
LABEL_129:
  self->_supportsUserIncidentReports = v4[299];
  *(_QWORD *)&self->_flags |= 0x40000000000uLL;
  v35 = *((_QWORD *)v4 + 38);
  if ((v35 & 0x20000) == 0)
  {
LABEL_110:
    if ((v35 & 0x10000) == 0)
      goto LABEL_111;
    goto LABEL_131;
  }
LABEL_130:
  self->_supportsAreaEventsEnhancements = v4[274];
  *(_QWORD *)&self->_flags |= 0x20000uLL;
  v35 = *((_QWORD *)v4 + 38);
  if ((v35 & 0x10000) == 0)
  {
LABEL_111:
    if ((v35 & 0x8000000000) == 0)
      goto LABEL_112;
    goto LABEL_132;
  }
LABEL_131:
  self->_supportsAdvancedMap = v4[273];
  *(_QWORD *)&self->_flags |= 0x10000uLL;
  v35 = *((_QWORD *)v4 + 38);
  if ((v35 & 0x8000000000) == 0)
  {
LABEL_112:
    if ((v35 & 0x2000) == 0)
      goto LABEL_113;
    goto LABEL_133;
  }
LABEL_132:
  self->_supportsSilentRouteUpdates = v4[296];
  *(_QWORD *)&self->_flags |= 0x8000000000uLL;
  v35 = *((_QWORD *)v4 + 38);
  if ((v35 & 0x2000) == 0)
  {
LABEL_113:
    if ((v35 & 0x20000000) == 0)
      goto LABEL_114;
    goto LABEL_134;
  }
LABEL_133:
  self->_replaceAccidentStringWithCrash = v4[270];
  *(_QWORD *)&self->_flags |= 0x2000uLL;
  v35 = *((_QWORD *)v4 + 38);
  if ((v35 & 0x20000000) == 0)
  {
LABEL_114:
    if ((v35 & 0x10000000) == 0)
      goto LABEL_115;
    goto LABEL_135;
  }
LABEL_134:
  self->_supportsGuidanceEventPrivacyFilters = v4[286];
  *(_QWORD *)&self->_flags |= 0x20000000uLL;
  v35 = *((_QWORD *)v4 + 38);
  if ((v35 & 0x10000000) == 0)
  {
LABEL_115:
    if ((v35 & 0x800) == 0)
      goto LABEL_116;
    goto LABEL_136;
  }
LABEL_135:
  self->_supportsGuidanceEventImportanceInfo = v4[285];
  *(_QWORD *)&self->_flags |= 0x10000000uLL;
  v35 = *((_QWORD *)v4 + 38);
  if ((v35 & 0x800) == 0)
  {
LABEL_116:
    if ((v35 & 0x1000) == 0)
      goto LABEL_118;
    goto LABEL_117;
  }
LABEL_136:
  self->_isAdvancedMap = v4[268];
  *(_QWORD *)&self->_flags |= 0x800uLL;
  if ((*((_QWORD *)v4 + 38) & 0x1000) != 0)
  {
LABEL_117:
    self->_isGlobeProjection = v4[269];
    *(_QWORD *)&self->_flags |= 0x1000uLL;
  }
LABEL_118:
  v36 = objc_msgSend(v4, "supportsMultipointRoutingsCount");
  if (v36)
  {
    v37 = v36;
    for (k = 0; k != v37; ++k)
      -[GEOClientCapabilities addSupportsMultipointRouting:](self, "addSupportsMultipointRouting:", objc_msgSend(v4, "supportsMultipointRoutingAtIndex:", k));
  }
  if ((*((_QWORD *)v4 + 38) & 0x400000) != 0)
  {
    self->_supportsDefaultToNewRouteFlag = v4[279];
    *(_QWORD *)&self->_flags |= 0x400000uLL;
  }
  walkingSupportedFeatures = self->_walkingSupportedFeatures;
  v40 = *((_QWORD *)v4 + 27);
  if (walkingSupportedFeatures)
  {
    if (v40)
      -[GEOWalkingSupportedFeatures mergeFrom:](walkingSupportedFeatures, "mergeFrom:");
  }
  else if (v40)
  {
    -[GEOClientCapabilities setWalkingSupportedFeatures:](self, "setWalkingSupportedFeatures:");
  }
  v41 = (uint64_t *)(v4 + 304);
  v42 = *((_QWORD *)v4 + 38);
  if ((v42 & 0x10) != 0)
  {
    self->_maxSupportedTransitFareVersion = *((_DWORD *)v4 + 63);
    *(_QWORD *)&self->_flags |= 0x10uLL;
    v42 = *v41;
    if ((*v41 & 0x800000) == 0)
    {
LABEL_142:
      if ((v42 & 0x100000) == 0)
        goto LABEL_143;
      goto LABEL_158;
    }
  }
  else if ((v42 & 0x800000) == 0)
  {
    goto LABEL_142;
  }
  self->_supportsDisablingProgressBarFromBannerButtons = v4[280];
  *(_QWORD *)&self->_flags |= 0x800000uLL;
  v42 = *((_QWORD *)v4 + 38);
  if ((v42 & 0x100000) == 0)
  {
LABEL_143:
    if ((v42 & 0x4000000) == 0)
      goto LABEL_144;
    goto LABEL_159;
  }
LABEL_158:
  self->_supportsBannerQueuing = v4[277];
  *(_QWORD *)&self->_flags |= 0x100000uLL;
  v42 = *((_QWORD *)v4 + 38);
  if ((v42 & 0x4000000) == 0)
  {
LABEL_144:
    if ((v42 & 0x4000000000) == 0)
      goto LABEL_145;
    goto LABEL_160;
  }
LABEL_159:
  self->_supportsEv2 = v4[283];
  *(_QWORD *)&self->_flags |= 0x4000000uLL;
  v42 = *((_QWORD *)v4 + 38);
  if ((v42 & 0x4000000000) == 0)
  {
LABEL_145:
    if ((v42 & 0x80000000000) == 0)
      goto LABEL_146;
    goto LABEL_161;
  }
LABEL_160:
  self->_supportsRouteNameRanges = v4[295];
  *(_QWORD *)&self->_flags |= 0x4000000000uLL;
  v42 = *((_QWORD *)v4 + 38);
  if ((v42 & 0x80000000000) == 0)
  {
LABEL_146:
    if ((v42 & 0x8000000) == 0)
      goto LABEL_147;
    goto LABEL_162;
  }
LABEL_161:
  self->_supportsWalkingSuggestionsAfterParking = v4[300];
  *(_QWORD *)&self->_flags |= 0x80000000000uLL;
  v42 = *((_QWORD *)v4 + 38);
  if ((v42 & 0x8000000) == 0)
  {
LABEL_147:
    if ((v42 & 0x2000000000) == 0)
      goto LABEL_148;
    goto LABEL_163;
  }
LABEL_162:
  self->_supportsGenericCombinationsInstructionsForAllModes = v4[284];
  *(_QWORD *)&self->_flags |= 0x8000000uLL;
  v42 = *((_QWORD *)v4 + 38);
  if ((v42 & 0x2000000000) == 0)
  {
LABEL_148:
    if ((v42 & 0x1000000) == 0)
      goto LABEL_150;
    goto LABEL_149;
  }
LABEL_163:
  self->_supportsRouteCameraInputUpdates = v4[294];
  *(_QWORD *)&self->_flags |= 0x2000000000uLL;
  if ((*((_QWORD *)v4 + 38) & 0x1000000) != 0)
  {
LABEL_149:
    self->_supportsDodgeballCameraInput = v4[281];
    *(_QWORD *)&self->_flags |= 0x1000000uLL;
  }
LABEL_150:
  v43 = objc_msgSend(v4, "supportedElevationModelsCount");
  if (v43)
  {
    v44 = v43;
    for (m = 0; m != v44; ++m)
      -[GEOClientCapabilities addSupportedElevationModel:](self, "addSupportedElevationModel:", objc_msgSend(v4, "supportedElevationModelAtIndex:", m));
  }
  if ((*((_QWORD *)v4 + 38) & 0x80000) != 0)
  {
    self->_supportsBannerQueuingDirections = v4[276];
    *(_QWORD *)&self->_flags |= 0x80000uLL;
  }

}

- (PBUnknownFields)unknownFields
{
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v5;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_QWORD *)&self->_flags & 0x400000000000) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      v5 = reader;
      objc_sync_enter(v5);
      GEOClientCapabilitiesReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_702);
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
  char v6;
  PBUnknownFields *unknownFields;

  v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  v6 = *((_BYTE *)&self->_flags + 8) | 4;
  *(_QWORD *)&self->_flags |= 0x400000000000uLL;
  *((_BYTE *)&self->_flags + 8) = v6;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEOClientCapabilities readAll:](self, "readAll:", 0);
    -[GEOFormattedStringClientCapabilities clearUnknownFields:](self->_formattedStringClientCapabilities, "clearUnknownFields:", 1);
    -[GEOAdvisoryClientCapabilities clearUnknownFields:](self->_advisoryClientCapabilities, "clearUnknownFields:", 1);
    -[GEOAbAssignInfo clearUnknownFields:](self->_abAssignInfo, "clearUnknownFields:", 1);
    -[GEOLocalTime clearUnknownFields:](self->_requestTime, "clearUnknownFields:", 1);
    -[GEOLocalizationCapabilities clearUnknownFields:](self->_localizationCapabilities, "clearUnknownFields:", 1);
    -[GEOWalkingSupportedFeatures clearUnknownFields:](self->_walkingSupportedFeatures, "clearUnknownFields:", 1);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_walkingSupportedFeatures, 0);
  objc_storeStrong((id *)&self->_userCurrentTimezone, 0);
  objc_storeStrong((id *)&self->_requestTime, 0);
  objc_storeStrong((id *)&self->_osVersion, 0);
  objc_storeStrong((id *)&self->_localizationCapabilities, 0);
  objc_storeStrong((id *)&self->_hardwareClass, 0);
  objc_storeStrong((id *)&self->_hardwareModel, 0);
  objc_storeStrong((id *)&self->_formattedStringClientCapabilities, 0);
  objc_storeStrong((id *)&self->_displayRegion, 0);
  objc_storeStrong((id *)&self->_displayLanguages, 0);
  objc_storeStrong((id *)&self->_deviceSku, 0);
  objc_storeStrong((id *)&self->_deviceCountryCode, 0);
  objc_storeStrong((id *)&self->_appMinorVersion, 0);
  objc_storeStrong((id *)&self->_appMajorVersion, 0);
  objc_storeStrong((id *)&self->_advisoryClientCapabilities, 0);
  objc_storeStrong((id *)&self->_abAssignInfo, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
