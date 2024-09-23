@implementation GEOLogMsgEvent

- (GEOLogMsgEvent)init
{
  GEOLogMsgEvent *v2;
  GEOLogMsgEvent *v3;
  GEOLogMsgEvent *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOLogMsgEvent;
  v2 = -[GEOLogMsgEvent init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOLogMsgEvent)initWithData:(id)a3
{
  GEOLogMsgEvent *v3;
  GEOLogMsgEvent *v4;
  GEOLogMsgEvent *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOLogMsgEvent;
  v3 = -[GEOLogMsgEvent initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readLogMsgStates
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 520));
    if ((*(_BYTE *)(a1 + 530) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLogMsgStates_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 520));
  }
}

- (NSMutableArray)logMsgStates
{
  -[GEOLogMsgEvent _readLogMsgStates]((uint64_t)self);
  return self->_logMsgStates;
}

- (void)setLogMsgStates:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *logMsgStates;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x400000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x8000000000000000;
  logMsgStates = self->_logMsgStates;
  self->_logMsgStates = v4;

}

- (void)clearLogMsgStates
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x400000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(_QWORD *)&self->_flags |= 0x8000000000000000;
  -[NSMutableArray removeAllObjects](self->_logMsgStates, "removeAllObjects");
}

- (void)addLogMsgState:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOLogMsgEvent _readLogMsgStates]((uint64_t)self);
  -[GEOLogMsgEvent _addNoFlagsLogMsgState:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x400000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x8000000000000000;
}

- (void)_addNoFlagsLogMsgState:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 176);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 176);
      *(_QWORD *)(a1 + 176) = v5;

      v4 = *(void **)(a1 + 176);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)logMsgStatesCount
{
  -[GEOLogMsgEvent _readLogMsgStates]((uint64_t)self);
  return -[NSMutableArray count](self->_logMsgStates, "count");
}

- (id)logMsgStateAtIndex:(unint64_t)a3
{
  -[GEOLogMsgEvent _readLogMsgStates]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_logMsgStates, "objectAtIndex:", a3);
}

+ (Class)logMsgStateType
{
  return (Class)objc_opt_class();
}

- (void)_readAnalyticTag
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 520));
    if ((*(_BYTE *)(a1 + 528) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAnalyticTag_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 520));
  }
}

- (BOOL)hasAnalyticTag
{
  -[GEOLogMsgEvent _readAnalyticTag]((uint64_t)self);
  return self->_analyticTag != 0;
}

- (GEOLogMsgEventId)analyticTag
{
  -[GEOLogMsgEvent _readAnalyticTag]((uint64_t)self);
  return self->_analyticTag;
}

- (void)setAnalyticTag:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x8000000000000004;
  objc_storeStrong((id *)&self->_analyticTag, a3);
}

- (void)_readMapsEnvironment
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 520));
    if ((*(_BYTE *)(a1 + 531) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMapsEnvironment_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 520));
  }
}

- (BOOL)hasMapsEnvironment
{
  -[GEOLogMsgEvent _readMapsEnvironment]((uint64_t)self);
  return self->_mapsEnvironment != 0;
}

- (NSString)mapsEnvironment
{
  -[GEOLogMsgEvent _readMapsEnvironment]((uint64_t)self);
  return self->_mapsEnvironment;
}

- (void)setMapsEnvironment:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x8000000008000000;
  objc_storeStrong((id *)&self->_mapsEnvironment, a3);
}

- (int)eventType
{
  os_unfair_lock_s *p_readerLock;
  $6A63E7CDA14C5D1C599C38C8531A0EC3 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_BYTE *)&flags & 2) != 0)
    return self->_eventType;
  else
    return 0;
}

- (void)setEventType:(int)a3
{
  *(_QWORD *)&self->_flags |= 0x8000000000000002;
  self->_eventType = a3;
}

- (void)setHasEventType:(BOOL)a3
{
  unint64_t v3;

  v3 = 0x8000000000000002;
  if (!a3)
    v3 = 0x8000000000000000;
  self->_flags = ($6A63E7CDA14C5D1C599C38C8531A0EC3)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFFFDLL | v3);
}

- (BOOL)hasEventType
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (id)eventTypeAsString:(int)a3
{
  __CFString *v3;

  v3 = CFSTR("LOG_MSG_EVENT_TYPE_UNKNOWN");
  switch(a3)
  {
    case 0:
      return v3;
    case 1:
      v3 = CFSTR("USER_ACTION");
      return v3;
    case 2:
      return CFSTR("STATE_TIMING");
    case 4:
      return CFSTR("TILE_SET_STATE");
    case 5:
      return CFSTR("PLACE_DATA_CACHE");
    case 6:
      return CFSTR("NETWORK");
    case 7:
      return CFSTR("CACHE_HIT");
    case 8:
      return CFSTR("DIRECTIONS");
    case 9:
      return CFSTR("TRANSIT_APP_LAUNCH");
    case 10:
      return CFSTR("TIME_TO_LEAVE_HYPOTHESIS");
    case 11:
      return CFSTR("TIME_TO_LEAVE_INITIAL_TRAVEL_TIME");
    case 12:
      return CFSTR("LOG_FRAMEWORK");
    case 13:
      return CFSTR("MAPS_WIDGETS_SESSION");
    case 14:
      return CFSTR("LIST_INTERACTION_SESSION");
    case 15:
      return CFSTR("REFINE_SEARCH_SESSION");
    case 16:
      return CFSTR("PROACTIVE_SUGGESTION_SESSION");
    case 17:
      return CFSTR("MAP_LAUNCH");
    case 18:
      return CFSTR("RIDE_BOOKING_SESSION");
    case 19:
      return CFSTR("RIDE_BOOKED_SESSION");
    case 20:
      return CFSTR("TABLE_BOOKING_SESSION");
    case 21:
      return CFSTR("TABLE_BOOKED_SESSION");
    case 22:
      return CFSTR("STALE_RESOURCE");
    case 23:
      return CFSTR("FULL_NAV_TRACE");
    case 24:
      return CFSTR("TELEMETRIC");
    case 25:
      return CFSTR("CLIENT_AC_SUGGESTIONS");
    case 26:
      return CFSTR("REALTIME_TRAFFIC_PROBE_COLLECTION");
    case 27:
      return CFSTR("BATCH_TRAFFIC_PROBE_COLLECTION");
    case 28:
      return CFSTR("OFFLINE_REQUEST_RESPONSE");
    case 29:
      return CFSTR("COMMUTE_WINDOW");
    case 30:
      return CFSTR("GENERIC_APP_ERROR");
    case 31:
      return CFSTR("WIFI_CONNECTION_QUALITY_PROBE");
    case 32:
      return CFSTR("PARKED_CAR");
    case 33:
      return CFSTR("TILE_CACHE_ANALYTIC");
    case 34:
      return CFSTR("GRID_DURATION");
    case 35:
      return CFSTR("DISPLAY_ANALYTIC");
    case 36:
      return CFSTR("THROTTLE");
    case 37:
      return CFSTR("MAP_KIT_COUNTS");
    case 38:
      return CFSTR("PRED_EX_TRAINING");
    case 39:
      return CFSTR("MARCOLITE_USAGE");
    case 40:
      return CFSTR("TRIP_DEPARTURE");
    case 41:
      return CFSTR("DIRECTIONS_REQUEST_DETAILS");
    case 42:
      return CFSTR("EV_ROUTING_VEHICLE_DETAILS");
    case 43:
      return CFSTR("EV_TRIP");
    case 44:
      return CFSTR("CURATED_COLLECTION_STATS");
    case 45:
      return CFSTR("CURATED_COLLECTION_USAGE");
    case 46:
      return CFSTR("MAPS_DEVICE_SETTINGS");
    case 47:
      return CFSTR("HARD_STOP");
    case 48:
      return CFSTR("VLF_USAGE");
    case 49:
      return CFSTR("LOG_DISCARD");
    case 50:
      return CFSTR("DAILY_USE_SUMMARY");
    case 51:
      return CFSTR("PRESSURE_DATA");
    case 52:
      return CFSTR("POI_BUSYNESS_DATA");
    case 53:
      return CFSTR("PERIODIC_SETTINGS_SUMMARY");
    case 54:
      return CFSTR("THERMAL_PRESSURE");
    case 55:
      return CFSTR("AR_SESSION_USAGE");
    case 56:
      return CFSTR("NETWORK_SELECTION_HARVEST");
    case 57:
      return CFSTR("IMPRESSION_EVENT");
    case 58:
      return CFSTR("SHOWCASE_SUPPRESSION");
    case 59:
      return CFSTR("PLACE_CACHE_LOOKUP");
    case 60:
      return CFSTR("DEVICE_SYNC_STATUS");
    case 61:
      return CFSTR("MAPS_INTERACTION");
    case 62:
      return CFSTR("NETWORK_EVENT_SUMMARY");
    case 63:
      return CFSTR("SERVICE_METADATA");
    case 64:
      return CFSTR("MAPS_ENGAGEMENT");
    default:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
      return v3;
  }
}

- (int)StringAsEventType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LOG_MSG_EVENT_TYPE_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("USER_ACTION")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("STATE_TIMING")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TILE_SET_STATE")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PLACE_DATA_CACHE")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NETWORK")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CACHE_HIT")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DIRECTIONS")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRANSIT_APP_LAUNCH")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TIME_TO_LEAVE_HYPOTHESIS")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TIME_TO_LEAVE_INITIAL_TRAVEL_TIME")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LOG_FRAMEWORK")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAPS_WIDGETS_SESSION")) & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LIST_INTERACTION_SESSION")) & 1) != 0)
  {
    v4 = 14;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REFINE_SEARCH_SESSION")) & 1) != 0)
  {
    v4 = 15;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PROACTIVE_SUGGESTION_SESSION")) & 1) != 0)
  {
    v4 = 16;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAP_LAUNCH")) & 1) != 0)
  {
    v4 = 17;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RIDE_BOOKING_SESSION")) & 1) != 0)
  {
    v4 = 18;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RIDE_BOOKED_SESSION")) & 1) != 0)
  {
    v4 = 19;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TABLE_BOOKING_SESSION")) & 1) != 0)
  {
    v4 = 20;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TABLE_BOOKED_SESSION")) & 1) != 0)
  {
    v4 = 21;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("STALE_RESOURCE")) & 1) != 0)
  {
    v4 = 22;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FULL_NAV_TRACE")) & 1) != 0)
  {
    v4 = 23;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TELEMETRIC")) & 1) != 0)
  {
    v4 = 24;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CLIENT_AC_SUGGESTIONS")) & 1) != 0)
  {
    v4 = 25;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REALTIME_TRAFFIC_PROBE_COLLECTION")) & 1) != 0)
  {
    v4 = 26;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BATCH_TRAFFIC_PROBE_COLLECTION")) & 1) != 0)
  {
    v4 = 27;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("OFFLINE_REQUEST_RESPONSE")) & 1) != 0)
  {
    v4 = 28;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("COMMUTE_WINDOW")) & 1) != 0)
  {
    v4 = 29;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GENERIC_APP_ERROR")) & 1) != 0)
  {
    v4 = 30;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WIFI_CONNECTION_QUALITY_PROBE")) & 1) != 0)
  {
    v4 = 31;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PARKED_CAR")) & 1) != 0)
  {
    v4 = 32;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TILE_CACHE_ANALYTIC")) & 1) != 0)
  {
    v4 = 33;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GRID_DURATION")) & 1) != 0)
  {
    v4 = 34;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DISPLAY_ANALYTIC")) & 1) != 0)
  {
    v4 = 35;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("THROTTLE")) & 1) != 0)
  {
    v4 = 36;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAP_KIT_COUNTS")) & 1) != 0)
  {
    v4 = 37;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PRED_EX_TRAINING")) & 1) != 0)
  {
    v4 = 38;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MARCOLITE_USAGE")) & 1) != 0)
  {
    v4 = 39;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRIP_DEPARTURE")) & 1) != 0)
  {
    v4 = 40;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DIRECTIONS_REQUEST_DETAILS")) & 1) != 0)
  {
    v4 = 41;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EV_ROUTING_VEHICLE_DETAILS")) & 1) != 0)
  {
    v4 = 42;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EV_TRIP")) & 1) != 0)
  {
    v4 = 43;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CURATED_COLLECTION_STATS")) & 1) != 0)
  {
    v4 = 44;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CURATED_COLLECTION_USAGE")) & 1) != 0)
  {
    v4 = 45;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAPS_DEVICE_SETTINGS")) & 1) != 0)
  {
    v4 = 46;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HARD_STOP")) & 1) != 0)
  {
    v4 = 47;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VLF_USAGE")) & 1) != 0)
  {
    v4 = 48;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LOG_DISCARD")) & 1) != 0)
  {
    v4 = 49;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DAILY_USE_SUMMARY")) & 1) != 0)
  {
    v4 = 50;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PRESSURE_DATA")) & 1) != 0)
  {
    v4 = 51;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("POI_BUSYNESS_DATA")) & 1) != 0)
  {
    v4 = 52;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PERIODIC_SETTINGS_SUMMARY")) & 1) != 0)
  {
    v4 = 53;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("THERMAL_PRESSURE")) & 1) != 0)
  {
    v4 = 54;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AR_SESSION_USAGE")) & 1) != 0)
  {
    v4 = 55;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NETWORK_SELECTION_HARVEST")) & 1) != 0)
  {
    v4 = 56;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("IMPRESSION_EVENT")) & 1) != 0)
  {
    v4 = 57;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SHOWCASE_SUPPRESSION")) & 1) != 0)
  {
    v4 = 58;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PLACE_CACHE_LOOKUP")) & 1) != 0)
  {
    v4 = 59;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DEVICE_SYNC_STATUS")) & 1) != 0)
  {
    v4 = 60;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAPS_INTERACTION")) & 1) != 0)
  {
    v4 = 61;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NETWORK_EVENT_SUMMARY")) & 1) != 0)
  {
    v4 = 62;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SERVICE_METADATA")) & 1) != 0)
  {
    v4 = 63;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("MAPS_ENGAGEMENT")))
  {
    v4 = 64;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_readUserActionEvent
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 520));
    if ((*(_BYTE *)(a1 + 535) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readUserActionEvent_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 520));
  }
}

- (BOOL)hasUserActionEvent
{
  -[GEOLogMsgEvent _readUserActionEvent]((uint64_t)self);
  return self->_userActionEvent != 0;
}

- (GEOLogMsgEventUserAction)userActionEvent
{
  -[GEOLogMsgEvent _readUserActionEvent]((uint64_t)self);
  return self->_userActionEvent;
}

- (void)setUserActionEvent:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x9000000000000000;
  objc_storeStrong((id *)&self->_userActionEvent, a3);
}

- (void)_readStateTimingEvent
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 520));
    if ((*(_BYTE *)(a1 + 534) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readStateTimingEvent_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 520));
  }
}

- (BOOL)hasStateTimingEvent
{
  -[GEOLogMsgEvent _readStateTimingEvent]((uint64_t)self);
  return self->_stateTimingEvent != 0;
}

- (GEOLogMsgEventStateTiming)stateTimingEvent
{
  -[GEOLogMsgEvent _readStateTimingEvent]((uint64_t)self);
  return self->_stateTimingEvent;
}

- (void)setStateTimingEvent:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x8001000000000000;
  objc_storeStrong((id *)&self->_stateTimingEvent, a3);
}

- (void)_readTileSetStateEvent
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 520));
    if ((*(_BYTE *)(a1 + 534) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTileSetStateEvent_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 520));
  }
}

- (BOOL)hasTileSetStateEvent
{
  -[GEOLogMsgEvent _readTileSetStateEvent]((uint64_t)self);
  return self->_tileSetStateEvent != 0;
}

- (GEOLogMsgEventTileSetState)tileSetStateEvent
{
  -[GEOLogMsgEvent _readTileSetStateEvent]((uint64_t)self);
  return self->_tileSetStateEvent;
}

- (void)setTileSetStateEvent:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x8080000000000000;
  objc_storeStrong((id *)&self->_tileSetStateEvent, a3);
}

- (void)_readPlaceDataCacheEvent
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 520));
    if ((*(_BYTE *)(a1 + 532) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPlaceDataCacheEvent_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 520));
  }
}

- (BOOL)hasPlaceDataCacheEvent
{
  -[GEOLogMsgEvent _readPlaceDataCacheEvent]((uint64_t)self);
  return self->_placeDataCacheEvent != 0;
}

- (GEOLogMsgEventPlaceDataCache)placeDataCacheEvent
{
  -[GEOLogMsgEvent _readPlaceDataCacheEvent]((uint64_t)self);
  return self->_placeDataCacheEvent;
}

- (void)setPlaceDataCacheEvent:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x8000002000000000;
  objc_storeStrong((id *)&self->_placeDataCacheEvent, a3);
}

- (void)_readNetworkEvent
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 520));
    if ((*(_BYTE *)(a1 + 532) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readNetworkEvent_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 520));
  }
}

- (BOOL)hasNetworkEvent
{
  -[GEOLogMsgEvent _readNetworkEvent]((uint64_t)self);
  return self->_networkEvent != 0;
}

- (GEOLogMsgEventNetwork)networkEvent
{
  -[GEOLogMsgEvent _readNetworkEvent]((uint64_t)self);
  return self->_networkEvent;
}

- (void)setNetworkEvent:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x8000000100000000;
  objc_storeStrong((id *)&self->_networkEvent, a3);
}

- (void)_readDirectionsEvent
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 520));
    if ((*(_BYTE *)(a1 + 529) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDirectionsEvent_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 520));
  }
}

- (BOOL)hasDirectionsEvent
{
  -[GEOLogMsgEvent _readDirectionsEvent]((uint64_t)self);
  return self->_directionsEvent != 0;
}

- (GEOLogMsgEventDirections)directionsEvent
{
  -[GEOLogMsgEvent _readDirectionsEvent]((uint64_t)self);
  return self->_directionsEvent;
}

- (void)setDirectionsEvent:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x8000000000000800;
  objc_storeStrong((id *)&self->_directionsEvent, a3);
}

- (void)_readTransitAppLaunchEvent
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 520));
    if ((*(_BYTE *)(a1 + 535) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTransitAppLaunchEvent_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 520));
  }
}

- (BOOL)hasTransitAppLaunchEvent
{
  -[GEOLogMsgEvent _readTransitAppLaunchEvent]((uint64_t)self);
  return self->_transitAppLaunchEvent != 0;
}

- (GEOLogMsgEventTransitAppLaunch)transitAppLaunchEvent
{
  -[GEOLogMsgEvent _readTransitAppLaunchEvent]((uint64_t)self);
  return self->_transitAppLaunchEvent;
}

- (void)setTransitAppLaunchEvent:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x8400000000000000;
  objc_storeStrong((id *)&self->_transitAppLaunchEvent, a3);
}

- (void)_readTimeToLeaveHypothesisEvent
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 520));
    if ((*(_BYTE *)(a1 + 535) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTimeToLeaveHypothesisEvent_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 520));
  }
}

- (BOOL)hasTimeToLeaveHypothesisEvent
{
  -[GEOLogMsgEvent _readTimeToLeaveHypothesisEvent]((uint64_t)self);
  return self->_timeToLeaveHypothesisEvent != 0;
}

- (GEOLogMsgEventTimeToLeaveHypothesis)timeToLeaveHypothesisEvent
{
  -[GEOLogMsgEvent _readTimeToLeaveHypothesisEvent]((uint64_t)self);
  return self->_timeToLeaveHypothesisEvent;
}

- (void)setTimeToLeaveHypothesisEvent:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x8100000000000000;
  objc_storeStrong((id *)&self->_timeToLeaveHypothesisEvent, a3);
}

- (void)_readTimeToLeaveInitialTravelTimeEvent
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 520));
    if ((*(_BYTE *)(a1 + 535) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTimeToLeaveInitialTravelTimeEvent_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 520));
  }
}

- (BOOL)hasTimeToLeaveInitialTravelTimeEvent
{
  -[GEOLogMsgEvent _readTimeToLeaveInitialTravelTimeEvent]((uint64_t)self);
  return self->_timeToLeaveInitialTravelTimeEvent != 0;
}

- (GEOLogMsgEventTimeToLeaveInitialTravelTime)timeToLeaveInitialTravelTimeEvent
{
  -[GEOLogMsgEvent _readTimeToLeaveInitialTravelTimeEvent]((uint64_t)self);
  return self->_timeToLeaveInitialTravelTimeEvent;
}

- (void)setTimeToLeaveInitialTravelTimeEvent:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x8200000000000000;
  objc_storeStrong((id *)&self->_timeToLeaveInitialTravelTimeEvent, a3);
}

- (void)_readMapsWidgetsInteractionSession
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 520));
    if ((*(_BYTE *)(a1 + 531) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMapsWidgetsInteractionSession_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 520));
  }
}

- (BOOL)hasMapsWidgetsInteractionSession
{
  -[GEOLogMsgEvent _readMapsWidgetsInteractionSession]((uint64_t)self);
  return self->_mapsWidgetsInteractionSession != 0;
}

- (GEOLogMsgEventMapsWidgetsInteractionSession)mapsWidgetsInteractionSession
{
  -[GEOLogMsgEvent _readMapsWidgetsInteractionSession]((uint64_t)self);
  return self->_mapsWidgetsInteractionSession;
}

- (void)setMapsWidgetsInteractionSession:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x8000000020000000;
  objc_storeStrong((id *)&self->_mapsWidgetsInteractionSession, a3);
}

- (void)_readListInteractionSession
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 520));
    if ((*(_BYTE *)(a1 + 530) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readListInteractionSession_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 520));
  }
}

- (BOOL)hasListInteractionSession
{
  -[GEOLogMsgEvent _readListInteractionSession]((uint64_t)self);
  return self->_listInteractionSession != 0;
}

- (GEOLogMsgEventListInteractionSession)listInteractionSession
{
  -[GEOLogMsgEvent _readListInteractionSession]((uint64_t)self);
  return self->_listInteractionSession;
}

- (void)setListInteractionSession:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x8000000000100000;
  objc_storeStrong((id *)&self->_listInteractionSession, a3);
}

- (void)_readRefineSearchSession
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 520));
    if ((*(_BYTE *)(a1 + 533) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRefineSearchSession_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 520));
  }
}

- (BOOL)hasRefineSearchSession
{
  -[GEOLogMsgEvent _readRefineSearchSession]((uint64_t)self);
  return self->_refineSearchSession != 0;
}

- (GEOLogMsgEventRefineSearchSession)refineSearchSession
{
  -[GEOLogMsgEvent _readRefineSearchSession]((uint64_t)self);
  return self->_refineSearchSession;
}

- (void)setRefineSearchSession:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x8000080000000000;
  objc_storeStrong((id *)&self->_refineSearchSession, a3);
}

- (void)_readProactiveSuggestionInteractionSessionEvent
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 520));
    if ((*(_BYTE *)(a1 + 533) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readProactiveSuggestionInteractionSessionEvent_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 520));
  }
}

- (BOOL)hasProactiveSuggestionInteractionSessionEvent
{
  -[GEOLogMsgEvent _readProactiveSuggestionInteractionSessionEvent]((uint64_t)self);
  return self->_proactiveSuggestionInteractionSessionEvent != 0;
}

- (GEOLogMsgEventProactiveSuggestionInteractionSession)proactiveSuggestionInteractionSessionEvent
{
  -[GEOLogMsgEvent _readProactiveSuggestionInteractionSessionEvent]((uint64_t)self);
  return self->_proactiveSuggestionInteractionSessionEvent;
}

- (void)setProactiveSuggestionInteractionSessionEvent:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x8000020000000000;
  objc_storeStrong((id *)&self->_proactiveSuggestionInteractionSessionEvent, a3);
}

- (void)_readMapLaunchEvent
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 520));
    if ((*(_BYTE *)(a1 + 531) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMapLaunchEvent_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 520));
  }
}

- (BOOL)hasMapLaunchEvent
{
  -[GEOLogMsgEvent _readMapLaunchEvent]((uint64_t)self);
  return self->_mapLaunchEvent != 0;
}

- (GEOLogMsgEventMapLaunch)mapLaunchEvent
{
  -[GEOLogMsgEvent _readMapLaunchEvent]((uint64_t)self);
  return self->_mapLaunchEvent;
}

- (void)setMapLaunchEvent:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x8000000001000000;
  objc_storeStrong((id *)&self->_mapLaunchEvent, a3);
}

- (void)_readRideBookingSession
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 520));
    if ((*(_BYTE *)(a1 + 533) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRideBookingSession_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 520));
  }
}

- (BOOL)hasRideBookingSession
{
  -[GEOLogMsgEvent _readRideBookingSession]((uint64_t)self);
  return self->_rideBookingSession != 0;
}

- (GEOLogMsgEventRideBookingSession)rideBookingSession
{
  -[GEOLogMsgEvent _readRideBookingSession]((uint64_t)self);
  return self->_rideBookingSession;
}

- (void)setRideBookingSession:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x8000200000000000;
  objc_storeStrong((id *)&self->_rideBookingSession, a3);
}

- (void)_readRideBookedSession
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 520));
    if ((*(_BYTE *)(a1 + 533) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRideBookedSession_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 520));
  }
}

- (BOOL)hasRideBookedSession
{
  -[GEOLogMsgEvent _readRideBookedSession]((uint64_t)self);
  return self->_rideBookedSession != 0;
}

- (GEOLogMsgEventRideBookedSession)rideBookedSession
{
  -[GEOLogMsgEvent _readRideBookedSession]((uint64_t)self);
  return self->_rideBookedSession;
}

- (void)setRideBookedSession:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x8000100000000000;
  objc_storeStrong((id *)&self->_rideBookedSession, a3);
}

- (void)_readTableBookingSession
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 520));
    if ((*(_BYTE *)(a1 + 534) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTableBookingSession_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 520));
  }
}

- (BOOL)hasTableBookingSession
{
  -[GEOLogMsgEvent _readTableBookingSession]((uint64_t)self);
  return self->_tableBookingSession != 0;
}

- (GEOLogMsgEventTableBookingSession)tableBookingSession
{
  -[GEOLogMsgEvent _readTableBookingSession]((uint64_t)self);
  return self->_tableBookingSession;
}

- (void)setTableBookingSession:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x8004000000000000;
  objc_storeStrong((id *)&self->_tableBookingSession, a3);
}

- (void)_readTableBookedSession
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 520));
    if ((*(_BYTE *)(a1 + 534) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTableBookedSession_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 520));
  }
}

- (BOOL)hasTableBookedSession
{
  -[GEOLogMsgEvent _readTableBookedSession]((uint64_t)self);
  return self->_tableBookedSession != 0;
}

- (GEOLogMsgEventTableBookedSession)tableBookedSession
{
  -[GEOLogMsgEvent _readTableBookedSession]((uint64_t)self);
  return self->_tableBookedSession;
}

- (void)setTableBookedSession:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x8002000000000000;
  objc_storeStrong((id *)&self->_tableBookedSession, a3);
}

- (void)_readFullNavTrace
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 520));
    if ((*(_BYTE *)(a1 + 530) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readFullNavTrace_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 520));
  }
}

- (BOOL)hasFullNavTrace
{
  -[GEOLogMsgEvent _readFullNavTrace]((uint64_t)self);
  return self->_fullNavTrace != 0;
}

- (GEOLogMsgEventFullNavTrace)fullNavTrace
{
  -[GEOLogMsgEvent _readFullNavTrace]((uint64_t)self);
  return self->_fullNavTrace;
}

- (void)setFullNavTrace:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x8000000000010000;
  objc_storeStrong((id *)&self->_fullNavTrace, a3);
}

- (void)_readTelemetric
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 520));
    if ((*(_BYTE *)(a1 + 534) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTelemetric_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 520));
  }
}

- (BOOL)hasTelemetric
{
  -[GEOLogMsgEvent _readTelemetric]((uint64_t)self);
  return self->_telemetric != 0;
}

- (GEOLogMsgEventTelemetric)telemetric
{
  -[GEOLogMsgEvent _readTelemetric]((uint64_t)self);
  return self->_telemetric;
}

- (void)setTelemetric:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x8008000000000000;
  objc_storeStrong((id *)&self->_telemetric, a3);
}

- (void)_readClientAcSuggestions
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 520));
    if ((*(_BYTE *)(a1 + 528) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readClientAcSuggestions_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 520));
  }
}

- (BOOL)hasClientAcSuggestions
{
  -[GEOLogMsgEvent _readClientAcSuggestions]((uint64_t)self);
  return self->_clientAcSuggestions != 0;
}

- (GEOLogMsgEventClientACSuggestions)clientAcSuggestions
{
  -[GEOLogMsgEvent _readClientAcSuggestions]((uint64_t)self);
  return self->_clientAcSuggestions;
}

- (void)setClientAcSuggestions:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x8000000000000020;
  objc_storeStrong((id *)&self->_clientAcSuggestions, a3);
}

- (void)_readRealtimeTrafficProbeCollection
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 520));
    if ((*(_BYTE *)(a1 + 533) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRealtimeTrafficProbeCollection_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 520));
  }
}

- (BOOL)hasRealtimeTrafficProbeCollection
{
  -[GEOLogMsgEvent _readRealtimeTrafficProbeCollection]((uint64_t)self);
  return self->_realtimeTrafficProbeCollection != 0;
}

- (GEOLogMsgEventRealtimeTrafficProbe)realtimeTrafficProbeCollection
{
  -[GEOLogMsgEvent _readRealtimeTrafficProbeCollection]((uint64_t)self);
  return self->_realtimeTrafficProbeCollection;
}

- (void)setRealtimeTrafficProbeCollection:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x8000040000000000;
  objc_storeStrong((id *)&self->_realtimeTrafficProbeCollection, a3);
}

- (void)_readBatchTrafficProbeCollection
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 520));
    if ((*(_BYTE *)(a1 + 528) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readBatchTrafficProbeCollection_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 520));
  }
}

- (BOOL)hasBatchTrafficProbeCollection
{
  -[GEOLogMsgEvent _readBatchTrafficProbeCollection]((uint64_t)self);
  return self->_batchTrafficProbeCollection != 0;
}

- (GEOLogMsgEventBatchTrafficProbe)batchTrafficProbeCollection
{
  -[GEOLogMsgEvent _readBatchTrafficProbeCollection]((uint64_t)self);
  return self->_batchTrafficProbeCollection;
}

- (void)setBatchTrafficProbeCollection:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x8000000000000010;
  objc_storeStrong((id *)&self->_batchTrafficProbeCollection, a3);
}

- (void)_readCommuteWindow
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 520));
    if ((*(_BYTE *)(a1 + 528) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCommuteWindow_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 520));
  }
}

- (BOOL)hasCommuteWindow
{
  -[GEOLogMsgEvent _readCommuteWindow]((uint64_t)self);
  return self->_commuteWindow != 0;
}

- (GEOLogMsgEventCommuteWindow)commuteWindow
{
  -[GEOLogMsgEvent _readCommuteWindow]((uint64_t)self);
  return self->_commuteWindow;
}

- (void)setCommuteWindow:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x8000000000000040;
  objc_storeStrong((id *)&self->_commuteWindow, a3);
}

- (void)_readWifiConnectionQualityProbeEvent
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 520));
    if ((*(_BYTE *)(a1 + 535) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readWifiConnectionQualityProbeEvent_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 520));
  }
}

- (BOOL)hasWifiConnectionQualityProbeEvent
{
  -[GEOLogMsgEvent _readWifiConnectionQualityProbeEvent]((uint64_t)self);
  return self->_wifiConnectionQualityProbeEvent != 0;
}

- (GEOLogMsgEventWifiConnectionQualityProbe)wifiConnectionQualityProbeEvent
{
  -[GEOLogMsgEvent _readWifiConnectionQualityProbeEvent]((uint64_t)self);
  return self->_wifiConnectionQualityProbeEvent;
}

- (void)setWifiConnectionQualityProbeEvent:(id)a3
{
  *(_QWORD *)&self->_flags |= 0xC000000000000000;
  objc_storeStrong((id *)&self->_wifiConnectionQualityProbeEvent, a3);
}

- (void)_readParkedCar
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 520));
    if ((*(_BYTE *)(a1 + 532) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readParkedCar_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 520));
  }
}

- (BOOL)hasParkedCar
{
  -[GEOLogMsgEvent _readParkedCar]((uint64_t)self);
  return self->_parkedCar != 0;
}

- (GEOLogMsgEventParkedCar)parkedCar
{
  -[GEOLogMsgEvent _readParkedCar]((uint64_t)self);
  return self->_parkedCar;
}

- (void)setParkedCar:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x8000000400000000;
  objc_storeStrong((id *)&self->_parkedCar, a3);
}

- (void)_readTileCacheAnalytic
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 520));
    if ((*(_BYTE *)(a1 + 534) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTileCacheAnalytic_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 520));
  }
}

- (BOOL)hasTileCacheAnalytic
{
  -[GEOLogMsgEvent _readTileCacheAnalytic]((uint64_t)self);
  return self->_tileCacheAnalytic != 0;
}

- (GEOLogMsgEventTileCacheAnalytic)tileCacheAnalytic
{
  -[GEOLogMsgEvent _readTileCacheAnalytic]((uint64_t)self);
  return self->_tileCacheAnalytic;
}

- (void)setTileCacheAnalytic:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x8040000000000000;
  objc_storeStrong((id *)&self->_tileCacheAnalytic, a3);
}

- (void)_readGridDuration
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 520));
    if ((*(_BYTE *)(a1 + 530) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readGridDuration_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 520));
  }
}

- (BOOL)hasGridDuration
{
  -[GEOLogMsgEvent _readGridDuration]((uint64_t)self);
  return self->_gridDuration != 0;
}

- (GEOLogMsgEventGridDuration)gridDuration
{
  -[GEOLogMsgEvent _readGridDuration]((uint64_t)self);
  return self->_gridDuration;
}

- (void)setGridDuration:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x8000000000020000;
  objc_storeStrong((id *)&self->_gridDuration, a3);
}

- (void)_readDisplayAnalytic
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 520));
    if ((*(_BYTE *)(a1 + 529) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDisplayAnalytic_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 520));
  }
}

- (BOOL)hasDisplayAnalytic
{
  -[GEOLogMsgEvent _readDisplayAnalytic]((uint64_t)self);
  return self->_displayAnalytic != 0;
}

- (GEOLogMsgEventDisplayAnalytic)displayAnalytic
{
  -[GEOLogMsgEvent _readDisplayAnalytic]((uint64_t)self);
  return self->_displayAnalytic;
}

- (void)setDisplayAnalytic:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x8000000000002000;
  objc_storeStrong((id *)&self->_displayAnalytic, a3);
}

- (void)_readThrottleEvent
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 520));
    if ((*(_BYTE *)(a1 + 534) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readThrottleEvent_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 520));
  }
}

- (BOOL)hasThrottleEvent
{
  -[GEOLogMsgEvent _readThrottleEvent]((uint64_t)self);
  return self->_throttleEvent != 0;
}

- (GEOLogMsgEventThrottle)throttleEvent
{
  -[GEOLogMsgEvent _readThrottleEvent]((uint64_t)self);
  return self->_throttleEvent;
}

- (void)setThrottleEvent:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x8020000000000000;
  objc_storeStrong((id *)&self->_throttleEvent, a3);
}

- (void)_readMapKitCounts
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 520));
    if ((*(_BYTE *)(a1 + 530) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMapKitCounts_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 520));
  }
}

- (BOOL)hasMapKitCounts
{
  -[GEOLogMsgEvent _readMapKitCounts]((uint64_t)self);
  return self->_mapKitCounts != 0;
}

- (GEOLogMsgEventMapKitCounts)mapKitCounts
{
  -[GEOLogMsgEvent _readMapKitCounts]((uint64_t)self);
  return self->_mapKitCounts;
}

- (void)setMapKitCounts:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x8000000000800000;
  objc_storeStrong((id *)&self->_mapKitCounts, a3);
}

- (void)_readPredExTrainingData
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 520));
    if ((*(_BYTE *)(a1 + 532) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPredExTrainingData_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 520));
  }
}

- (BOOL)hasPredExTrainingData
{
  -[GEOLogMsgEvent _readPredExTrainingData]((uint64_t)self);
  return self->_predExTrainingData != 0;
}

- (GEOLogMsgEventPredExTrainingData)predExTrainingData
{
  -[GEOLogMsgEvent _readPredExTrainingData]((uint64_t)self);
  return self->_predExTrainingData;
}

- (void)setPredExTrainingData:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x8000008000000000;
  objc_storeStrong((id *)&self->_predExTrainingData, a3);
}

- (void)_readMarcoLiteUsage
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 520));
    if ((*(_BYTE *)(a1 + 531) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMarcoLiteUsage_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 520));
  }
}

- (BOOL)hasMarcoLiteUsage
{
  -[GEOLogMsgEvent _readMarcoLiteUsage]((uint64_t)self);
  return self->_marcoLiteUsage != 0;
}

- (GEOLogMsgEventMarcoLiteUsage)marcoLiteUsage
{
  -[GEOLogMsgEvent _readMarcoLiteUsage]((uint64_t)self);
  return self->_marcoLiteUsage;
}

- (void)setMarcoLiteUsage:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x8000000040000000;
  objc_storeStrong((id *)&self->_marcoLiteUsage, a3);
}

- (void)_readTripDepartureFeedback
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 520));
    if ((*(_BYTE *)(a1 + 535) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTripDepartureFeedback_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 520));
  }
}

- (BOOL)hasTripDepartureFeedback
{
  -[GEOLogMsgEvent _readTripDepartureFeedback]((uint64_t)self);
  return self->_tripDepartureFeedback != 0;
}

- (GEOLogMsgEventTripDepartureFeedback)tripDepartureFeedback
{
  -[GEOLogMsgEvent _readTripDepartureFeedback]((uint64_t)self);
  return self->_tripDepartureFeedback;
}

- (void)setTripDepartureFeedback:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x8800000000000000;
  objc_storeStrong((id *)&self->_tripDepartureFeedback, a3);
}

- (void)_readDirectionsRequestDetails
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 520));
    if ((*(_BYTE *)(a1 + 529) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDirectionsRequestDetails_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 520));
  }
}

- (BOOL)hasDirectionsRequestDetails
{
  -[GEOLogMsgEvent _readDirectionsRequestDetails]((uint64_t)self);
  return self->_directionsRequestDetails != 0;
}

- (GEOLogMsgEventDirectionsRequestDetails)directionsRequestDetails
{
  -[GEOLogMsgEvent _readDirectionsRequestDetails]((uint64_t)self);
  return self->_directionsRequestDetails;
}

- (void)setDirectionsRequestDetails:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x8000000000001000;
  objc_storeStrong((id *)&self->_directionsRequestDetails, a3);
}

- (void)_readEvRoutingVehicleDetails
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 520));
    if ((*(_BYTE *)(a1 + 529) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readEvRoutingVehicleDetails_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 520));
  }
}

- (BOOL)hasEvRoutingVehicleDetails
{
  -[GEOLogMsgEvent _readEvRoutingVehicleDetails]((uint64_t)self);
  return self->_evRoutingVehicleDetails != 0;
}

- (GEOLogMsgEventEVRoutingVehicleDetails)evRoutingVehicleDetails
{
  -[GEOLogMsgEvent _readEvRoutingVehicleDetails]((uint64_t)self);
  return self->_evRoutingVehicleDetails;
}

- (void)setEvRoutingVehicleDetails:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x8000000000004000;
  objc_storeStrong((id *)&self->_evRoutingVehicleDetails, a3);
}

- (void)_readEvTrip
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 520));
    if ((*(_BYTE *)(a1 + 529) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readEvTrip_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 520));
  }
}

- (BOOL)hasEvTrip
{
  -[GEOLogMsgEvent _readEvTrip]((uint64_t)self);
  return self->_evTrip != 0;
}

- (GEOLogMsgEventEVTrip)evTrip
{
  -[GEOLogMsgEvent _readEvTrip]((uint64_t)self);
  return self->_evTrip;
}

- (void)setEvTrip:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x8000000000008000;
  objc_storeStrong((id *)&self->_evTrip, a3);
}

- (void)_readCuratedCollectionStats
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 520));
    if ((*(_BYTE *)(a1 + 528) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCuratedCollectionStats_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 520));
  }
}

- (BOOL)hasCuratedCollectionStats
{
  -[GEOLogMsgEvent _readCuratedCollectionStats]((uint64_t)self);
  return self->_curatedCollectionStats != 0;
}

- (GEOLogMsgEventCuratedCollectionStats)curatedCollectionStats
{
  -[GEOLogMsgEvent _readCuratedCollectionStats]((uint64_t)self);
  return self->_curatedCollectionStats;
}

- (void)setCuratedCollectionStats:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x8000000000000080;
  objc_storeStrong((id *)&self->_curatedCollectionStats, a3);
}

- (void)_readCuratedCollectionUsage
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 520));
    if ((*(_BYTE *)(a1 + 529) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCuratedCollectionUsage_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 520));
  }
}

- (BOOL)hasCuratedCollectionUsage
{
  -[GEOLogMsgEvent _readCuratedCollectionUsage]((uint64_t)self);
  return self->_curatedCollectionUsage != 0;
}

- (GEOLogMsgEventCuratedCollectionUsage)curatedCollectionUsage
{
  -[GEOLogMsgEvent _readCuratedCollectionUsage]((uint64_t)self);
  return self->_curatedCollectionUsage;
}

- (void)setCuratedCollectionUsage:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x8000000000000100;
  objc_storeStrong((id *)&self->_curatedCollectionUsage, a3);
}

- (void)_readMapsDeviceSettings
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 520));
    if ((*(_BYTE *)(a1 + 531) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMapsDeviceSettings_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 520));
  }
}

- (BOOL)hasMapsDeviceSettings
{
  -[GEOLogMsgEvent _readMapsDeviceSettings]((uint64_t)self);
  return self->_mapsDeviceSettings != 0;
}

- (GEOLogMsgEventMapsDeviceSettings)mapsDeviceSettings
{
  -[GEOLogMsgEvent _readMapsDeviceSettings]((uint64_t)self);
  return self->_mapsDeviceSettings;
}

- (void)setMapsDeviceSettings:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x8000000002000000;
  objc_storeStrong((id *)&self->_mapsDeviceSettings, a3);
}

- (void)_readHardStop
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 520));
    if ((*(_BYTE *)(a1 + 530) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readHardStop_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 520));
  }
}

- (BOOL)hasHardStop
{
  -[GEOLogMsgEvent _readHardStop]((uint64_t)self);
  return self->_hardStop != 0;
}

- (GEOLogMsgEventHardStop)hardStop
{
  -[GEOLogMsgEvent _readHardStop]((uint64_t)self);
  return self->_hardStop;
}

- (void)setHardStop:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x8000000000040000;
  objc_storeStrong((id *)&self->_hardStop, a3);
}

- (void)_readVlfUsage
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 520));
    if ((*(_BYTE *)(a1 + 535) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readVlfUsage_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 520));
  }
}

- (BOOL)hasVlfUsage
{
  -[GEOLogMsgEvent _readVlfUsage]((uint64_t)self);
  return self->_vlfUsage != 0;
}

- (GEOLogMsgEventVLFUsage)vlfUsage
{
  -[GEOLogMsgEvent _readVlfUsage]((uint64_t)self);
  return self->_vlfUsage;
}

- (void)setVlfUsage:(id)a3
{
  *(_QWORD *)&self->_flags |= 0xA000000000000000;
  objc_storeStrong((id *)&self->_vlfUsage, a3);
}

- (void)_readLogDiscard
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 520));
    if ((*(_BYTE *)(a1 + 530) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLogDiscard_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 520));
  }
}

- (BOOL)hasLogDiscard
{
  -[GEOLogMsgEvent _readLogDiscard]((uint64_t)self);
  return self->_logDiscard != 0;
}

- (GEOLogMsgEventLogDiscard)logDiscard
{
  -[GEOLogMsgEvent _readLogDiscard]((uint64_t)self);
  return self->_logDiscard;
}

- (void)setLogDiscard:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x8000000000200000;
  objc_storeStrong((id *)&self->_logDiscard, a3);
}

- (void)_readDailyUseSummary
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 520));
    if ((*(_BYTE *)(a1 + 529) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDailyUseSummary_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 520));
  }
}

- (BOOL)hasDailyUseSummary
{
  -[GEOLogMsgEvent _readDailyUseSummary]((uint64_t)self);
  return self->_dailyUseSummary != 0;
}

- (GEOLogMsgEventDailyUseSummary)dailyUseSummary
{
  -[GEOLogMsgEvent _readDailyUseSummary]((uint64_t)self);
  return self->_dailyUseSummary;
}

- (void)setDailyUseSummary:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x8000000000000200;
  objc_storeStrong((id *)&self->_dailyUseSummary, a3);
}

- (void)_readPressureData
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 520));
    if ((*(_BYTE *)(a1 + 533) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPressureData_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 520));
  }
}

- (BOOL)hasPressureData
{
  -[GEOLogMsgEvent _readPressureData]((uint64_t)self);
  return self->_pressureData != 0;
}

- (GEOLogMsgEventPressureData)pressureData
{
  -[GEOLogMsgEvent _readPressureData]((uint64_t)self);
  return self->_pressureData;
}

- (void)setPressureData:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x8000010000000000;
  objc_storeStrong((id *)&self->_pressureData, a3);
}

- (void)_readPoiBusynessData
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 520));
    if ((*(_BYTE *)(a1 + 532) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPoiBusynessData_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 520));
  }
}

- (BOOL)hasPoiBusynessData
{
  -[GEOLogMsgEvent _readPoiBusynessData]((uint64_t)self);
  return self->_poiBusynessData != 0;
}

- (GEOLogMsgEventPOIBusynessData)poiBusynessData
{
  -[GEOLogMsgEvent _readPoiBusynessData]((uint64_t)self);
  return self->_poiBusynessData;
}

- (void)setPoiBusynessData:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x8000004000000000;
  objc_storeStrong((id *)&self->_poiBusynessData, a3);
}

- (void)_readPeriodicSettingsSummary
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 520));
    if ((*(_BYTE *)(a1 + 532) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPeriodicSettingsSummary_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 520));
  }
}

- (BOOL)hasPeriodicSettingsSummary
{
  -[GEOLogMsgEvent _readPeriodicSettingsSummary]((uint64_t)self);
  return self->_periodicSettingsSummary != 0;
}

- (GEOLogMsgEventPeriodicSettingsSummary)periodicSettingsSummary
{
  -[GEOLogMsgEvent _readPeriodicSettingsSummary]((uint64_t)self);
  return self->_periodicSettingsSummary;
}

- (void)setPeriodicSettingsSummary:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x8000000800000000;
  objc_storeStrong((id *)&self->_periodicSettingsSummary, a3);
}

- (void)_readThermalPressure
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 520));
    if ((*(_BYTE *)(a1 + 534) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readThermalPressure_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 520));
  }
}

- (BOOL)hasThermalPressure
{
  -[GEOLogMsgEvent _readThermalPressure]((uint64_t)self);
  return self->_thermalPressure != 0;
}

- (GEOLogMsgEventThermalPressure)thermalPressure
{
  -[GEOLogMsgEvent _readThermalPressure]((uint64_t)self);
  return self->_thermalPressure;
}

- (void)setThermalPressure:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x8010000000000000;
  objc_storeStrong((id *)&self->_thermalPressure, a3);
}

- (void)_readArSessionUsage
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 520));
    if ((*(_BYTE *)(a1 + 528) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readArSessionUsage_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 520));
  }
}

- (BOOL)hasArSessionUsage
{
  -[GEOLogMsgEvent _readArSessionUsage]((uint64_t)self);
  return self->_arSessionUsage != 0;
}

- (GEOLogMsgEventARSessionUsage)arSessionUsage
{
  -[GEOLogMsgEvent _readArSessionUsage]((uint64_t)self);
  return self->_arSessionUsage;
}

- (void)setArSessionUsage:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x8000000000000008;
  objc_storeStrong((id *)&self->_arSessionUsage, a3);
}

- (void)_readNetworkSelectionHarvest
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 520));
    if ((*(_BYTE *)(a1 + 532) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readNetworkSelectionHarvest_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 520));
  }
}

- (BOOL)hasNetworkSelectionHarvest
{
  -[GEOLogMsgEvent _readNetworkSelectionHarvest]((uint64_t)self);
  return self->_networkSelectionHarvest != 0;
}

- (GEOLogMsgEventNetworkSelectionHarvest)networkSelectionHarvest
{
  -[GEOLogMsgEvent _readNetworkSelectionHarvest]((uint64_t)self);
  return self->_networkSelectionHarvest;
}

- (void)setNetworkSelectionHarvest:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x8000000200000000;
  objc_storeStrong((id *)&self->_networkSelectionHarvest, a3);
}

- (void)_readImpressionEvent
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 520));
    if ((*(_BYTE *)(a1 + 530) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readImpressionEvent_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 520));
  }
}

- (BOOL)hasImpressionEvent
{
  -[GEOLogMsgEvent _readImpressionEvent]((uint64_t)self);
  return self->_impressionEvent != 0;
}

- (GEOLogMsgEventImpressionEvent)impressionEvent
{
  -[GEOLogMsgEvent _readImpressionEvent]((uint64_t)self);
  return self->_impressionEvent;
}

- (void)setImpressionEvent:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x8000000000080000;
  objc_storeStrong((id *)&self->_impressionEvent, a3);
}

- (void)_readShowcaseSuppression
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 520));
    if ((*(_BYTE *)(a1 + 533) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readShowcaseSuppression_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 520));
  }
}

- (BOOL)hasShowcaseSuppression
{
  -[GEOLogMsgEvent _readShowcaseSuppression]((uint64_t)self);
  return self->_showcaseSuppression != 0;
}

- (GEOLogMsgEventShowcaseSuppression)showcaseSuppression
{
  -[GEOLogMsgEvent _readShowcaseSuppression]((uint64_t)self);
  return self->_showcaseSuppression;
}

- (void)setShowcaseSuppression:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x8000800000000000;
  objc_storeStrong((id *)&self->_showcaseSuppression, a3);
}

- (void)_readPlaceCacheLookup
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 520));
    if ((*(_BYTE *)(a1 + 532) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPlaceCacheLookup_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 520));
  }
}

- (BOOL)hasPlaceCacheLookup
{
  -[GEOLogMsgEvent _readPlaceCacheLookup]((uint64_t)self);
  return self->_placeCacheLookup != 0;
}

- (GEOLogMsgEventPlaceCacheLookup)placeCacheLookup
{
  -[GEOLogMsgEvent _readPlaceCacheLookup]((uint64_t)self);
  return self->_placeCacheLookup;
}

- (void)setPlaceCacheLookup:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x8000001000000000;
  objc_storeStrong((id *)&self->_placeCacheLookup, a3);
}

- (void)_readDeviceSyncStatus
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 520));
    if ((*(_BYTE *)(a1 + 529) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDeviceSyncStatus_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 520));
  }
}

- (BOOL)hasDeviceSyncStatus
{
  -[GEOLogMsgEvent _readDeviceSyncStatus]((uint64_t)self);
  return self->_deviceSyncStatus != 0;
}

- (GEOLogMsgEventDeviceSyncStatus)deviceSyncStatus
{
  -[GEOLogMsgEvent _readDeviceSyncStatus]((uint64_t)self);
  return self->_deviceSyncStatus;
}

- (void)setDeviceSyncStatus:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x8000000000000400;
  objc_storeStrong((id *)&self->_deviceSyncStatus, a3);
}

- (void)_readMapsInteraction
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 520));
    if ((*(_BYTE *)(a1 + 531) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMapsInteraction_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 520));
  }
}

- (BOOL)hasMapsInteraction
{
  -[GEOLogMsgEvent _readMapsInteraction]((uint64_t)self);
  return self->_mapsInteraction != 0;
}

- (GEOLogMsgEventMapsInteraction)mapsInteraction
{
  -[GEOLogMsgEvent _readMapsInteraction]((uint64_t)self);
  return self->_mapsInteraction;
}

- (void)setMapsInteraction:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x8000000010000000;
  objc_storeStrong((id *)&self->_mapsInteraction, a3);
}

- (void)_readNetworkEventSummary
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 520));
    if ((*(_BYTE *)(a1 + 531) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readNetworkEventSummary_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 520));
  }
}

- (BOOL)hasNetworkEventSummary
{
  -[GEOLogMsgEvent _readNetworkEventSummary]((uint64_t)self);
  return self->_networkEventSummary != 0;
}

- (GEOLogMsgEventNetworkEventSummary)networkEventSummary
{
  -[GEOLogMsgEvent _readNetworkEventSummary]((uint64_t)self);
  return self->_networkEventSummary;
}

- (void)setNetworkEventSummary:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x8000000080000000;
  objc_storeStrong((id *)&self->_networkEventSummary, a3);
}

- (void)_readServiceMetadata
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 520));
    if ((*(_BYTE *)(a1 + 533) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readServiceMetadata_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 520));
  }
}

- (BOOL)hasServiceMetadata
{
  -[GEOLogMsgEvent _readServiceMetadata]((uint64_t)self);
  return self->_serviceMetadata != 0;
}

- (GEOLogMsgEventServiceMetadata)serviceMetadata
{
  -[GEOLogMsgEvent _readServiceMetadata]((uint64_t)self);
  return self->_serviceMetadata;
}

- (void)setServiceMetadata:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x8000400000000000;
  objc_storeStrong((id *)&self->_serviceMetadata, a3);
}

- (void)_readMapsEngagement
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 520));
    if ((*(_BYTE *)(a1 + 531) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMapsEngagement_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 520));
  }
}

- (BOOL)hasMapsEngagement
{
  -[GEOLogMsgEvent _readMapsEngagement]((uint64_t)self);
  return self->_mapsEngagement != 0;
}

- (GEOLogMsgEventMapsEngagement)mapsEngagement
{
  -[GEOLogMsgEvent _readMapsEngagement]((uint64_t)self);
  return self->_mapsEngagement;
}

- (void)setMapsEngagement:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x8000000004000000;
  objc_storeStrong((id *)&self->_mapsEngagement, a3);
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
  v8.super_class = (Class)GEOLogMsgEvent;
  -[GEOLogMsgEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOLogMsgEvent dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgEvent _dictionaryRepresentation:]((uint64_t)self, 0);
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
  id v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  id v18;
  void *v19;
  const __CFString *v20;
  __CFString *v21;
  const __CFString *v22;
  void *v23;
  void *v24;
  void *v25;
  const __CFString *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  const __CFString *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  const __CFString *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  const __CFString *v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  const __CFString *v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  const __CFString *v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  const __CFString *v56;
  id v57;
  void *v58;
  void *v59;
  void *v60;
  const __CFString *v61;
  id v62;
  void *v63;
  void *v64;
  void *v65;
  const __CFString *v66;
  id v67;
  void *v68;
  void *v69;
  void *v70;
  const __CFString *v71;
  id v72;
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
  void *v89;
  void *v90;
  const __CFString *v91;
  id v92;
  void *v93;
  void *v94;
  void *v95;
  const __CFString *v96;
  id v97;
  void *v98;
  void *v99;
  void *v100;
  const __CFString *v101;
  id v102;
  void *v103;
  void *v104;
  void *v105;
  const __CFString *v106;
  id v107;
  void *v108;
  void *v109;
  void *v110;
  const __CFString *v111;
  id v112;
  void *v113;
  void *v114;
  void *v115;
  const __CFString *v116;
  id v117;
  void *v118;
  void *v119;
  id v120;
  void *v121;
  void *v122;
  void *v123;
  const __CFString *v124;
  id v125;
  void *v126;
  void *v127;
  void *v128;
  const __CFString *v129;
  id v130;
  void *v131;
  void *v132;
  void *v133;
  const __CFString *v134;
  id v135;
  void *v136;
  void *v137;
  void *v138;
  const __CFString *v139;
  id v140;
  void *v141;
  void *v142;
  void *v143;
  const __CFString *v144;
  id v145;
  void *v146;
  void *v147;
  void *v148;
  const __CFString *v149;
  id v150;
  void *v151;
  void *v152;
  void *v153;
  const __CFString *v154;
  id v155;
  void *v156;
  void *v157;
  void *v158;
  const __CFString *v159;
  id v160;
  void *v161;
  void *v162;
  void *v163;
  const __CFString *v164;
  id v165;
  void *v166;
  void *v167;
  void *v168;
  const __CFString *v169;
  id v170;
  void *v171;
  void *v172;
  void *v173;
  const __CFString *v174;
  id v175;
  void *v176;
  void *v177;
  void *v178;
  const __CFString *v179;
  id v180;
  void *v181;
  void *v182;
  void *v183;
  const __CFString *v184;
  id v185;
  void *v186;
  void *v187;
  void *v188;
  const __CFString *v189;
  id v190;
  void *v191;
  void *v192;
  void *v193;
  const __CFString *v194;
  id v195;
  void *v196;
  void *v197;
  void *v198;
  const __CFString *v199;
  id v200;
  void *v201;
  void *v202;
  void *v203;
  const __CFString *v204;
  id v205;
  void *v206;
  void *v207;
  void *v208;
  const __CFString *v209;
  id v210;
  void *v211;
  void *v212;
  void *v213;
  const __CFString *v214;
  id v215;
  void *v216;
  void *v217;
  void *v218;
  const __CFString *v219;
  id v220;
  void *v221;
  void *v222;
  void *v223;
  const __CFString *v224;
  id v225;
  void *v226;
  void *v227;
  void *v228;
  const __CFString *v229;
  id v230;
  void *v231;
  void *v232;
  void *v233;
  const __CFString *v234;
  id v235;
  void *v236;
  void *v237;
  void *v238;
  const __CFString *v239;
  id v240;
  void *v241;
  void *v242;
  void *v243;
  const __CFString *v244;
  id v245;
  void *v246;
  void *v247;
  void *v248;
  const __CFString *v249;
  id v250;
  void *v251;
  void *v252;
  void *v253;
  const __CFString *v254;
  id v255;
  void *v256;
  void *v257;
  void *v258;
  const __CFString *v259;
  id v260;
  void *v261;
  void *v262;
  void *v263;
  const __CFString *v264;
  id v265;
  void *v266;
  void *v267;
  void *v268;
  const __CFString *v269;
  id v270;
  void *v271;
  void *v272;
  void *v273;
  const __CFString *v274;
  id v275;
  void *v276;
  void *v277;
  void *v278;
  const __CFString *v279;
  id v280;
  void *v281;
  void *v282;
  void *v283;
  const __CFString *v284;
  id v285;
  void *v286;
  void *v287;
  void *v288;
  const __CFString *v289;
  id v290;
  void *v291;
  void *v292;
  void *v293;
  const __CFString *v294;
  id v295;
  void *v296;
  void *v297;
  void *v298;
  const __CFString *v299;
  id v300;
  void *v301;
  void *v302;
  void *v303;
  const __CFString *v304;
  id v305;
  void *v306;
  void *v307;
  void *v308;
  const __CFString *v309;
  id v310;
  void *v311;
  const __CFString *v312;
  id v313;
  __int128 v315;
  __int128 v316;
  __int128 v317;
  __int128 v318;
  _BYTE v319[128];
  uint64_t v320;

  v320 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 176), "count"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 176), "count"));
    v315 = 0u;
    v316 = 0u;
    v317 = 0u;
    v318 = 0u;
    v6 = *(id *)(a1 + 176);
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v315, v319, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v316;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v316 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v315 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v11, "jsonRepresentation");
          else
            objc_msgSend(v11, "dictionaryRepresentation");
          v12 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v5, "addObject:", v12);
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v315, v319, 16);
      }
      while (v8);
    }

    if (a2)
      v13 = CFSTR("logMsgState");
    else
      v13 = CFSTR("log_msg_state");
    objc_msgSend(v4, "setObject:forKey:", v5, v13);

  }
  objc_msgSend((id)a1, "analyticTag");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v14, "jsonRepresentation");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = CFSTR("analyticTag");
    }
    else
    {
      objc_msgSend(v14, "dictionaryRepresentation");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = CFSTR("analytic_tag");
    }
    v18 = v16;

    objc_msgSend(v4, "setObject:forKey:", v18, v17);
  }

  objc_msgSend((id)a1, "mapsEnvironment");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    if (a2)
      v20 = CFSTR("mapsEnvironment");
    else
      v20 = CFSTR("maps_environment");
    objc_msgSend(v4, "setObject:forKey:", v19, v20);
  }

  if ((*(_BYTE *)(a1 + 528) & 2) != 0)
  {
    v21 = CFSTR("LOG_MSG_EVENT_TYPE_UNKNOWN");
    switch(*(_DWORD *)(a1 + 524))
    {
      case 0:
        break;
      case 1:
        v21 = CFSTR("USER_ACTION");
        break;
      case 2:
        v21 = CFSTR("STATE_TIMING");
        break;
      case 4:
        v21 = CFSTR("TILE_SET_STATE");
        break;
      case 5:
        v21 = CFSTR("PLACE_DATA_CACHE");
        break;
      case 6:
        v21 = CFSTR("NETWORK");
        break;
      case 7:
        v21 = CFSTR("CACHE_HIT");
        break;
      case 8:
        v21 = CFSTR("DIRECTIONS");
        break;
      case 9:
        v21 = CFSTR("TRANSIT_APP_LAUNCH");
        break;
      case 0xA:
        v21 = CFSTR("TIME_TO_LEAVE_HYPOTHESIS");
        break;
      case 0xB:
        v21 = CFSTR("TIME_TO_LEAVE_INITIAL_TRAVEL_TIME");
        break;
      case 0xC:
        v21 = CFSTR("LOG_FRAMEWORK");
        break;
      case 0xD:
        v21 = CFSTR("MAPS_WIDGETS_SESSION");
        break;
      case 0xE:
        v21 = CFSTR("LIST_INTERACTION_SESSION");
        break;
      case 0xF:
        v21 = CFSTR("REFINE_SEARCH_SESSION");
        break;
      case 0x10:
        v21 = CFSTR("PROACTIVE_SUGGESTION_SESSION");
        break;
      case 0x11:
        v21 = CFSTR("MAP_LAUNCH");
        break;
      case 0x12:
        v21 = CFSTR("RIDE_BOOKING_SESSION");
        break;
      case 0x13:
        v21 = CFSTR("RIDE_BOOKED_SESSION");
        break;
      case 0x14:
        v21 = CFSTR("TABLE_BOOKING_SESSION");
        break;
      case 0x15:
        v21 = CFSTR("TABLE_BOOKED_SESSION");
        break;
      case 0x16:
        v21 = CFSTR("STALE_RESOURCE");
        break;
      case 0x17:
        v21 = CFSTR("FULL_NAV_TRACE");
        break;
      case 0x18:
        v21 = CFSTR("TELEMETRIC");
        break;
      case 0x19:
        v21 = CFSTR("CLIENT_AC_SUGGESTIONS");
        break;
      case 0x1A:
        v21 = CFSTR("REALTIME_TRAFFIC_PROBE_COLLECTION");
        break;
      case 0x1B:
        v21 = CFSTR("BATCH_TRAFFIC_PROBE_COLLECTION");
        break;
      case 0x1C:
        v21 = CFSTR("OFFLINE_REQUEST_RESPONSE");
        break;
      case 0x1D:
        v21 = CFSTR("COMMUTE_WINDOW");
        break;
      case 0x1E:
        v21 = CFSTR("GENERIC_APP_ERROR");
        break;
      case 0x1F:
        v21 = CFSTR("WIFI_CONNECTION_QUALITY_PROBE");
        break;
      case 0x20:
        v21 = CFSTR("PARKED_CAR");
        break;
      case 0x21:
        v21 = CFSTR("TILE_CACHE_ANALYTIC");
        break;
      case 0x22:
        v21 = CFSTR("GRID_DURATION");
        break;
      case 0x23:
        v21 = CFSTR("DISPLAY_ANALYTIC");
        break;
      case 0x24:
        v21 = CFSTR("THROTTLE");
        break;
      case 0x25:
        v21 = CFSTR("MAP_KIT_COUNTS");
        break;
      case 0x26:
        v21 = CFSTR("PRED_EX_TRAINING");
        break;
      case 0x27:
        v21 = CFSTR("MARCOLITE_USAGE");
        break;
      case 0x28:
        v21 = CFSTR("TRIP_DEPARTURE");
        break;
      case 0x29:
        v21 = CFSTR("DIRECTIONS_REQUEST_DETAILS");
        break;
      case 0x2A:
        v21 = CFSTR("EV_ROUTING_VEHICLE_DETAILS");
        break;
      case 0x2B:
        v21 = CFSTR("EV_TRIP");
        break;
      case 0x2C:
        v21 = CFSTR("CURATED_COLLECTION_STATS");
        break;
      case 0x2D:
        v21 = CFSTR("CURATED_COLLECTION_USAGE");
        break;
      case 0x2E:
        v21 = CFSTR("MAPS_DEVICE_SETTINGS");
        break;
      case 0x2F:
        v21 = CFSTR("HARD_STOP");
        break;
      case 0x30:
        v21 = CFSTR("VLF_USAGE");
        break;
      case 0x31:
        v21 = CFSTR("LOG_DISCARD");
        break;
      case 0x32:
        v21 = CFSTR("DAILY_USE_SUMMARY");
        break;
      case 0x33:
        v21 = CFSTR("PRESSURE_DATA");
        break;
      case 0x34:
        v21 = CFSTR("POI_BUSYNESS_DATA");
        break;
      case 0x35:
        v21 = CFSTR("PERIODIC_SETTINGS_SUMMARY");
        break;
      case 0x36:
        v21 = CFSTR("THERMAL_PRESSURE");
        break;
      case 0x37:
        v21 = CFSTR("AR_SESSION_USAGE");
        break;
      case 0x38:
        v21 = CFSTR("NETWORK_SELECTION_HARVEST");
        break;
      case 0x39:
        v21 = CFSTR("IMPRESSION_EVENT");
        break;
      case 0x3A:
        v21 = CFSTR("SHOWCASE_SUPPRESSION");
        break;
      case 0x3B:
        v21 = CFSTR("PLACE_CACHE_LOOKUP");
        break;
      case 0x3C:
        v21 = CFSTR("DEVICE_SYNC_STATUS");
        break;
      case 0x3D:
        v21 = CFSTR("MAPS_INTERACTION");
        break;
      case 0x3E:
        v21 = CFSTR("NETWORK_EVENT_SUMMARY");
        break;
      case 0x3F:
        v21 = CFSTR("SERVICE_METADATA");
        break;
      case 0x40:
        v21 = CFSTR("MAPS_ENGAGEMENT");
        break;
      default:
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 524));
        v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
        break;
    }
    if (a2)
      v22 = CFSTR("eventType");
    else
      v22 = CFSTR("event_type");
    objc_msgSend(v4, "setObject:forKey:", v21, v22);

  }
  objc_msgSend((id)a1, "userActionEvent");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (v23)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v23, "jsonRepresentation");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = CFSTR("userActionEvent");
    }
    else
    {
      objc_msgSend(v23, "dictionaryRepresentation");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = CFSTR("user_action_event");
    }
    v27 = v25;

    objc_msgSend(v4, "setObject:forKey:", v27, v26);
  }

  objc_msgSend((id)a1, "stateTimingEvent");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v28;
  if (v28)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v28, "jsonRepresentation");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = CFSTR("stateTimingEvent");
    }
    else
    {
      objc_msgSend(v28, "dictionaryRepresentation");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = CFSTR("state_timing_event");
    }
    v32 = v30;

    objc_msgSend(v4, "setObject:forKey:", v32, v31);
  }

  objc_msgSend((id)a1, "tileSetStateEvent");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v33;
  if (v33)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v33, "jsonRepresentation");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = CFSTR("tileSetStateEvent");
    }
    else
    {
      objc_msgSend(v33, "dictionaryRepresentation");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = CFSTR("tile_set_state_event");
    }
    v37 = v35;

    objc_msgSend(v4, "setObject:forKey:", v37, v36);
  }

  objc_msgSend((id)a1, "placeDataCacheEvent");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v38;
  if (v38)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v38, "jsonRepresentation");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = CFSTR("placeDataCacheEvent");
    }
    else
    {
      objc_msgSend(v38, "dictionaryRepresentation");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = CFSTR("place_data_cache_event");
    }
    v42 = v40;

    objc_msgSend(v4, "setObject:forKey:", v42, v41);
  }

  objc_msgSend((id)a1, "networkEvent");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = v43;
  if (v43)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v43, "jsonRepresentation");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = CFSTR("networkEvent");
    }
    else
    {
      objc_msgSend(v43, "dictionaryRepresentation");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = CFSTR("network_event");
    }
    v47 = v45;

    objc_msgSend(v4, "setObject:forKey:", v47, v46);
  }

  objc_msgSend((id)a1, "directionsEvent");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = v48;
  if (v48)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v48, "jsonRepresentation");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = CFSTR("directionsEvent");
    }
    else
    {
      objc_msgSend(v48, "dictionaryRepresentation");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = CFSTR("directions_event");
    }
    v52 = v50;

    objc_msgSend(v4, "setObject:forKey:", v52, v51);
  }

  objc_msgSend((id)a1, "transitAppLaunchEvent");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = v53;
  if (v53)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v53, "jsonRepresentation");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = CFSTR("transitAppLaunchEvent");
    }
    else
    {
      objc_msgSend(v53, "dictionaryRepresentation");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = CFSTR("transit_app_launch_event");
    }
    v57 = v55;

    objc_msgSend(v4, "setObject:forKey:", v57, v56);
  }

  objc_msgSend((id)a1, "timeToLeaveHypothesisEvent");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = v58;
  if (v58)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v58, "jsonRepresentation");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = CFSTR("timeToLeaveHypothesisEvent");
    }
    else
    {
      objc_msgSend(v58, "dictionaryRepresentation");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = CFSTR("time_to_leave_hypothesis_event");
    }
    v62 = v60;

    objc_msgSend(v4, "setObject:forKey:", v62, v61);
  }

  objc_msgSend((id)a1, "timeToLeaveInitialTravelTimeEvent");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = v63;
  if (v63)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v63, "jsonRepresentation");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = CFSTR("timeToLeaveInitialTravelTimeEvent");
    }
    else
    {
      objc_msgSend(v63, "dictionaryRepresentation");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = CFSTR("time_to_leave_initial_travel_time_event");
    }
    v67 = v65;

    objc_msgSend(v4, "setObject:forKey:", v67, v66);
  }

  objc_msgSend((id)a1, "mapsWidgetsInteractionSession");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = v68;
  if (v68)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v68, "jsonRepresentation");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      v71 = CFSTR("mapsWidgetsInteractionSession");
    }
    else
    {
      objc_msgSend(v68, "dictionaryRepresentation");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      v71 = CFSTR("maps_widgets_interaction_session");
    }
    v72 = v70;

    objc_msgSend(v4, "setObject:forKey:", v72, v71);
  }

  objc_msgSend((id)a1, "listInteractionSession");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = v73;
  if (v73)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v73, "jsonRepresentation");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      v76 = CFSTR("listInteractionSession");
    }
    else
    {
      objc_msgSend(v73, "dictionaryRepresentation");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      v76 = CFSTR("list_interaction_session");
    }
    v77 = v75;

    objc_msgSend(v4, "setObject:forKey:", v77, v76);
  }

  objc_msgSend((id)a1, "refineSearchSession");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v79 = v78;
  if (v78)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v78, "jsonRepresentation");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      v81 = CFSTR("refineSearchSession");
    }
    else
    {
      objc_msgSend(v78, "dictionaryRepresentation");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      v81 = CFSTR("refine_search_session");
    }
    v82 = v80;

    objc_msgSend(v4, "setObject:forKey:", v82, v81);
  }

  objc_msgSend((id)a1, "proactiveSuggestionInteractionSessionEvent");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v84 = v83;
  if (v83)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v83, "jsonRepresentation");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      v86 = CFSTR("proactiveSuggestionInteractionSessionEvent");
    }
    else
    {
      objc_msgSend(v83, "dictionaryRepresentation");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      v86 = CFSTR("proactive_suggestion_interaction_session_event");
    }
    v87 = v85;

    objc_msgSend(v4, "setObject:forKey:", v87, v86);
  }

  objc_msgSend((id)a1, "mapLaunchEvent");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v89 = v88;
  if (v88)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v88, "jsonRepresentation");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      v91 = CFSTR("mapLaunchEvent");
    }
    else
    {
      objc_msgSend(v88, "dictionaryRepresentation");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      v91 = CFSTR("map_launch_event");
    }
    v92 = v90;

    objc_msgSend(v4, "setObject:forKey:", v92, v91);
  }

  objc_msgSend((id)a1, "rideBookingSession");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  v94 = v93;
  if (v93)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v93, "jsonRepresentation");
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      v96 = CFSTR("rideBookingSession");
    }
    else
    {
      objc_msgSend(v93, "dictionaryRepresentation");
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      v96 = CFSTR("ride_booking_session");
    }
    v97 = v95;

    objc_msgSend(v4, "setObject:forKey:", v97, v96);
  }

  objc_msgSend((id)a1, "rideBookedSession");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  v99 = v98;
  if (v98)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v98, "jsonRepresentation");
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      v101 = CFSTR("rideBookedSession");
    }
    else
    {
      objc_msgSend(v98, "dictionaryRepresentation");
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      v101 = CFSTR("ride_booked_session");
    }
    v102 = v100;

    objc_msgSend(v4, "setObject:forKey:", v102, v101);
  }

  objc_msgSend((id)a1, "tableBookingSession");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  v104 = v103;
  if (v103)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v103, "jsonRepresentation");
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      v106 = CFSTR("tableBookingSession");
    }
    else
    {
      objc_msgSend(v103, "dictionaryRepresentation");
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      v106 = CFSTR("table_booking_session");
    }
    v107 = v105;

    objc_msgSend(v4, "setObject:forKey:", v107, v106);
  }

  objc_msgSend((id)a1, "tableBookedSession");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  v109 = v108;
  if (v108)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v108, "jsonRepresentation");
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      v111 = CFSTR("tableBookedSession");
    }
    else
    {
      objc_msgSend(v108, "dictionaryRepresentation");
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      v111 = CFSTR("table_booked_session");
    }
    v112 = v110;

    objc_msgSend(v4, "setObject:forKey:", v112, v111);
  }

  objc_msgSend((id)a1, "fullNavTrace");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  v114 = v113;
  if (v113)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v113, "jsonRepresentation");
      v115 = (void *)objc_claimAutoreleasedReturnValue();
      v116 = CFSTR("fullNavTrace");
    }
    else
    {
      objc_msgSend(v113, "dictionaryRepresentation");
      v115 = (void *)objc_claimAutoreleasedReturnValue();
      v116 = CFSTR("full_nav_trace");
    }
    v117 = v115;

    objc_msgSend(v4, "setObject:forKey:", v117, v116);
  }

  objc_msgSend((id)a1, "telemetric");
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  v119 = v118;
  if (v118)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v118, "jsonRepresentation");
    else
      objc_msgSend(v118, "dictionaryRepresentation");
    v120 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKey:", v120, CFSTR("telemetric"));
  }

  objc_msgSend((id)a1, "clientAcSuggestions");
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  v122 = v121;
  if (v121)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v121, "jsonRepresentation");
      v123 = (void *)objc_claimAutoreleasedReturnValue();
      v124 = CFSTR("clientAcSuggestions");
    }
    else
    {
      objc_msgSend(v121, "dictionaryRepresentation");
      v123 = (void *)objc_claimAutoreleasedReturnValue();
      v124 = CFSTR("client_ac_suggestions");
    }
    v125 = v123;

    objc_msgSend(v4, "setObject:forKey:", v125, v124);
  }

  objc_msgSend((id)a1, "realtimeTrafficProbeCollection");
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  v127 = v126;
  if (v126)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v126, "jsonRepresentation");
      v128 = (void *)objc_claimAutoreleasedReturnValue();
      v129 = CFSTR("realtimeTrafficProbeCollection");
    }
    else
    {
      objc_msgSend(v126, "dictionaryRepresentation");
      v128 = (void *)objc_claimAutoreleasedReturnValue();
      v129 = CFSTR("realtime_traffic_probe_collection");
    }
    v130 = v128;

    objc_msgSend(v4, "setObject:forKey:", v130, v129);
  }

  objc_msgSend((id)a1, "batchTrafficProbeCollection");
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  v132 = v131;
  if (v131)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v131, "jsonRepresentation");
      v133 = (void *)objc_claimAutoreleasedReturnValue();
      v134 = CFSTR("batchTrafficProbeCollection");
    }
    else
    {
      objc_msgSend(v131, "dictionaryRepresentation");
      v133 = (void *)objc_claimAutoreleasedReturnValue();
      v134 = CFSTR("batch_traffic_probe_collection");
    }
    v135 = v133;

    objc_msgSend(v4, "setObject:forKey:", v135, v134);
  }

  objc_msgSend((id)a1, "commuteWindow");
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  v137 = v136;
  if (v136)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v136, "jsonRepresentation");
      v138 = (void *)objc_claimAutoreleasedReturnValue();
      v139 = CFSTR("commuteWindow");
    }
    else
    {
      objc_msgSend(v136, "dictionaryRepresentation");
      v138 = (void *)objc_claimAutoreleasedReturnValue();
      v139 = CFSTR("commute_window");
    }
    v140 = v138;

    objc_msgSend(v4, "setObject:forKey:", v140, v139);
  }

  objc_msgSend((id)a1, "wifiConnectionQualityProbeEvent");
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  v142 = v141;
  if (v141)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v141, "jsonRepresentation");
      v143 = (void *)objc_claimAutoreleasedReturnValue();
      v144 = CFSTR("wifiConnectionQualityProbeEvent");
    }
    else
    {
      objc_msgSend(v141, "dictionaryRepresentation");
      v143 = (void *)objc_claimAutoreleasedReturnValue();
      v144 = CFSTR("wifi_connection_quality_probe_event");
    }
    v145 = v143;

    objc_msgSend(v4, "setObject:forKey:", v145, v144);
  }

  objc_msgSend((id)a1, "parkedCar");
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  v147 = v146;
  if (v146)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v146, "jsonRepresentation");
      v148 = (void *)objc_claimAutoreleasedReturnValue();
      v149 = CFSTR("parkedCar");
    }
    else
    {
      objc_msgSend(v146, "dictionaryRepresentation");
      v148 = (void *)objc_claimAutoreleasedReturnValue();
      v149 = CFSTR("parked_car");
    }
    v150 = v148;

    objc_msgSend(v4, "setObject:forKey:", v150, v149);
  }

  objc_msgSend((id)a1, "tileCacheAnalytic");
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  v152 = v151;
  if (v151)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v151, "jsonRepresentation");
      v153 = (void *)objc_claimAutoreleasedReturnValue();
      v154 = CFSTR("tileCacheAnalytic");
    }
    else
    {
      objc_msgSend(v151, "dictionaryRepresentation");
      v153 = (void *)objc_claimAutoreleasedReturnValue();
      v154 = CFSTR("tile_cache_analytic");
    }
    v155 = v153;

    objc_msgSend(v4, "setObject:forKey:", v155, v154);
  }

  objc_msgSend((id)a1, "gridDuration");
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  v157 = v156;
  if (v156)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v156, "jsonRepresentation");
      v158 = (void *)objc_claimAutoreleasedReturnValue();
      v159 = CFSTR("gridDuration");
    }
    else
    {
      objc_msgSend(v156, "dictionaryRepresentation");
      v158 = (void *)objc_claimAutoreleasedReturnValue();
      v159 = CFSTR("grid_duration");
    }
    v160 = v158;

    objc_msgSend(v4, "setObject:forKey:", v160, v159);
  }

  objc_msgSend((id)a1, "displayAnalytic");
  v161 = (void *)objc_claimAutoreleasedReturnValue();
  v162 = v161;
  if (v161)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v161, "jsonRepresentation");
      v163 = (void *)objc_claimAutoreleasedReturnValue();
      v164 = CFSTR("displayAnalytic");
    }
    else
    {
      objc_msgSend(v161, "dictionaryRepresentation");
      v163 = (void *)objc_claimAutoreleasedReturnValue();
      v164 = CFSTR("display_analytic");
    }
    v165 = v163;

    objc_msgSend(v4, "setObject:forKey:", v165, v164);
  }

  objc_msgSend((id)a1, "throttleEvent");
  v166 = (void *)objc_claimAutoreleasedReturnValue();
  v167 = v166;
  if (v166)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v166, "jsonRepresentation");
      v168 = (void *)objc_claimAutoreleasedReturnValue();
      v169 = CFSTR("throttleEvent");
    }
    else
    {
      objc_msgSend(v166, "dictionaryRepresentation");
      v168 = (void *)objc_claimAutoreleasedReturnValue();
      v169 = CFSTR("throttle_event");
    }
    v170 = v168;

    objc_msgSend(v4, "setObject:forKey:", v170, v169);
  }

  objc_msgSend((id)a1, "mapKitCounts");
  v171 = (void *)objc_claimAutoreleasedReturnValue();
  v172 = v171;
  if (v171)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v171, "jsonRepresentation");
      v173 = (void *)objc_claimAutoreleasedReturnValue();
      v174 = CFSTR("mapKitCounts");
    }
    else
    {
      objc_msgSend(v171, "dictionaryRepresentation");
      v173 = (void *)objc_claimAutoreleasedReturnValue();
      v174 = CFSTR("map_kit_counts");
    }
    v175 = v173;

    objc_msgSend(v4, "setObject:forKey:", v175, v174);
  }

  objc_msgSend((id)a1, "predExTrainingData");
  v176 = (void *)objc_claimAutoreleasedReturnValue();
  v177 = v176;
  if (v176)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v176, "jsonRepresentation");
      v178 = (void *)objc_claimAutoreleasedReturnValue();
      v179 = CFSTR("predExTrainingData");
    }
    else
    {
      objc_msgSend(v176, "dictionaryRepresentation");
      v178 = (void *)objc_claimAutoreleasedReturnValue();
      v179 = CFSTR("pred_ex_training_data");
    }
    v180 = v178;

    objc_msgSend(v4, "setObject:forKey:", v180, v179);
  }

  objc_msgSend((id)a1, "marcoLiteUsage");
  v181 = (void *)objc_claimAutoreleasedReturnValue();
  v182 = v181;
  if (v181)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v181, "jsonRepresentation");
      v183 = (void *)objc_claimAutoreleasedReturnValue();
      v184 = CFSTR("marcoLiteUsage");
    }
    else
    {
      objc_msgSend(v181, "dictionaryRepresentation");
      v183 = (void *)objc_claimAutoreleasedReturnValue();
      v184 = CFSTR("marco_lite_usage");
    }
    v185 = v183;

    objc_msgSend(v4, "setObject:forKey:", v185, v184);
  }

  objc_msgSend((id)a1, "tripDepartureFeedback");
  v186 = (void *)objc_claimAutoreleasedReturnValue();
  v187 = v186;
  if (v186)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v186, "jsonRepresentation");
      v188 = (void *)objc_claimAutoreleasedReturnValue();
      v189 = CFSTR("tripDepartureFeedback");
    }
    else
    {
      objc_msgSend(v186, "dictionaryRepresentation");
      v188 = (void *)objc_claimAutoreleasedReturnValue();
      v189 = CFSTR("trip_departure_feedback");
    }
    v190 = v188;

    objc_msgSend(v4, "setObject:forKey:", v190, v189);
  }

  objc_msgSend((id)a1, "directionsRequestDetails");
  v191 = (void *)objc_claimAutoreleasedReturnValue();
  v192 = v191;
  if (v191)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v191, "jsonRepresentation");
      v193 = (void *)objc_claimAutoreleasedReturnValue();
      v194 = CFSTR("directionsRequestDetails");
    }
    else
    {
      objc_msgSend(v191, "dictionaryRepresentation");
      v193 = (void *)objc_claimAutoreleasedReturnValue();
      v194 = CFSTR("directions_request_details");
    }
    v195 = v193;

    objc_msgSend(v4, "setObject:forKey:", v195, v194);
  }

  objc_msgSend((id)a1, "evRoutingVehicleDetails");
  v196 = (void *)objc_claimAutoreleasedReturnValue();
  v197 = v196;
  if (v196)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v196, "jsonRepresentation");
      v198 = (void *)objc_claimAutoreleasedReturnValue();
      v199 = CFSTR("evRoutingVehicleDetails");
    }
    else
    {
      objc_msgSend(v196, "dictionaryRepresentation");
      v198 = (void *)objc_claimAutoreleasedReturnValue();
      v199 = CFSTR("ev_routing_vehicle_details");
    }
    v200 = v198;

    objc_msgSend(v4, "setObject:forKey:", v200, v199);
  }

  objc_msgSend((id)a1, "evTrip");
  v201 = (void *)objc_claimAutoreleasedReturnValue();
  v202 = v201;
  if (v201)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v201, "jsonRepresentation");
      v203 = (void *)objc_claimAutoreleasedReturnValue();
      v204 = CFSTR("evTrip");
    }
    else
    {
      objc_msgSend(v201, "dictionaryRepresentation");
      v203 = (void *)objc_claimAutoreleasedReturnValue();
      v204 = CFSTR("ev_trip");
    }
    v205 = v203;

    objc_msgSend(v4, "setObject:forKey:", v205, v204);
  }

  objc_msgSend((id)a1, "curatedCollectionStats");
  v206 = (void *)objc_claimAutoreleasedReturnValue();
  v207 = v206;
  if (v206)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v206, "jsonRepresentation");
      v208 = (void *)objc_claimAutoreleasedReturnValue();
      v209 = CFSTR("curatedCollectionStats");
    }
    else
    {
      objc_msgSend(v206, "dictionaryRepresentation");
      v208 = (void *)objc_claimAutoreleasedReturnValue();
      v209 = CFSTR("curated_collection_stats");
    }
    v210 = v208;

    objc_msgSend(v4, "setObject:forKey:", v210, v209);
  }

  objc_msgSend((id)a1, "curatedCollectionUsage");
  v211 = (void *)objc_claimAutoreleasedReturnValue();
  v212 = v211;
  if (v211)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v211, "jsonRepresentation");
      v213 = (void *)objc_claimAutoreleasedReturnValue();
      v214 = CFSTR("curatedCollectionUsage");
    }
    else
    {
      objc_msgSend(v211, "dictionaryRepresentation");
      v213 = (void *)objc_claimAutoreleasedReturnValue();
      v214 = CFSTR("curated_collection_usage");
    }
    v215 = v213;

    objc_msgSend(v4, "setObject:forKey:", v215, v214);
  }

  objc_msgSend((id)a1, "mapsDeviceSettings");
  v216 = (void *)objc_claimAutoreleasedReturnValue();
  v217 = v216;
  if (v216)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v216, "jsonRepresentation");
      v218 = (void *)objc_claimAutoreleasedReturnValue();
      v219 = CFSTR("mapsDeviceSettings");
    }
    else
    {
      objc_msgSend(v216, "dictionaryRepresentation");
      v218 = (void *)objc_claimAutoreleasedReturnValue();
      v219 = CFSTR("maps_device_settings");
    }
    v220 = v218;

    objc_msgSend(v4, "setObject:forKey:", v220, v219);
  }

  objc_msgSend((id)a1, "hardStop");
  v221 = (void *)objc_claimAutoreleasedReturnValue();
  v222 = v221;
  if (v221)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v221, "jsonRepresentation");
      v223 = (void *)objc_claimAutoreleasedReturnValue();
      v224 = CFSTR("hardStop");
    }
    else
    {
      objc_msgSend(v221, "dictionaryRepresentation");
      v223 = (void *)objc_claimAutoreleasedReturnValue();
      v224 = CFSTR("hard_stop");
    }
    v225 = v223;

    objc_msgSend(v4, "setObject:forKey:", v225, v224);
  }

  objc_msgSend((id)a1, "vlfUsage");
  v226 = (void *)objc_claimAutoreleasedReturnValue();
  v227 = v226;
  if (v226)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v226, "jsonRepresentation");
      v228 = (void *)objc_claimAutoreleasedReturnValue();
      v229 = CFSTR("vlfUsage");
    }
    else
    {
      objc_msgSend(v226, "dictionaryRepresentation");
      v228 = (void *)objc_claimAutoreleasedReturnValue();
      v229 = CFSTR("vlf_usage");
    }
    v230 = v228;

    objc_msgSend(v4, "setObject:forKey:", v230, v229);
  }

  objc_msgSend((id)a1, "logDiscard");
  v231 = (void *)objc_claimAutoreleasedReturnValue();
  v232 = v231;
  if (v231)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v231, "jsonRepresentation");
      v233 = (void *)objc_claimAutoreleasedReturnValue();
      v234 = CFSTR("logDiscard");
    }
    else
    {
      objc_msgSend(v231, "dictionaryRepresentation");
      v233 = (void *)objc_claimAutoreleasedReturnValue();
      v234 = CFSTR("log_discard");
    }
    v235 = v233;

    objc_msgSend(v4, "setObject:forKey:", v235, v234);
  }

  objc_msgSend((id)a1, "dailyUseSummary");
  v236 = (void *)objc_claimAutoreleasedReturnValue();
  v237 = v236;
  if (v236)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v236, "jsonRepresentation");
      v238 = (void *)objc_claimAutoreleasedReturnValue();
      v239 = CFSTR("dailyUseSummary");
    }
    else
    {
      objc_msgSend(v236, "dictionaryRepresentation");
      v238 = (void *)objc_claimAutoreleasedReturnValue();
      v239 = CFSTR("daily_use_summary");
    }
    v240 = v238;

    objc_msgSend(v4, "setObject:forKey:", v240, v239);
  }

  objc_msgSend((id)a1, "pressureData");
  v241 = (void *)objc_claimAutoreleasedReturnValue();
  v242 = v241;
  if (v241)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v241, "jsonRepresentation");
      v243 = (void *)objc_claimAutoreleasedReturnValue();
      v244 = CFSTR("pressureData");
    }
    else
    {
      objc_msgSend(v241, "dictionaryRepresentation");
      v243 = (void *)objc_claimAutoreleasedReturnValue();
      v244 = CFSTR("pressure_data");
    }
    v245 = v243;

    objc_msgSend(v4, "setObject:forKey:", v245, v244);
  }

  objc_msgSend((id)a1, "poiBusynessData");
  v246 = (void *)objc_claimAutoreleasedReturnValue();
  v247 = v246;
  if (v246)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v246, "jsonRepresentation");
      v248 = (void *)objc_claimAutoreleasedReturnValue();
      v249 = CFSTR("poiBusynessData");
    }
    else
    {
      objc_msgSend(v246, "dictionaryRepresentation");
      v248 = (void *)objc_claimAutoreleasedReturnValue();
      v249 = CFSTR("poi_busyness_data");
    }
    v250 = v248;

    objc_msgSend(v4, "setObject:forKey:", v250, v249);
  }

  objc_msgSend((id)a1, "periodicSettingsSummary");
  v251 = (void *)objc_claimAutoreleasedReturnValue();
  v252 = v251;
  if (v251)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v251, "jsonRepresentation");
      v253 = (void *)objc_claimAutoreleasedReturnValue();
      v254 = CFSTR("periodicSettingsSummary");
    }
    else
    {
      objc_msgSend(v251, "dictionaryRepresentation");
      v253 = (void *)objc_claimAutoreleasedReturnValue();
      v254 = CFSTR("periodic_settings_summary");
    }
    v255 = v253;

    objc_msgSend(v4, "setObject:forKey:", v255, v254);
  }

  objc_msgSend((id)a1, "thermalPressure");
  v256 = (void *)objc_claimAutoreleasedReturnValue();
  v257 = v256;
  if (v256)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v256, "jsonRepresentation");
      v258 = (void *)objc_claimAutoreleasedReturnValue();
      v259 = CFSTR("thermalPressure");
    }
    else
    {
      objc_msgSend(v256, "dictionaryRepresentation");
      v258 = (void *)objc_claimAutoreleasedReturnValue();
      v259 = CFSTR("thermal_pressure");
    }
    v260 = v258;

    objc_msgSend(v4, "setObject:forKey:", v260, v259);
  }

  objc_msgSend((id)a1, "arSessionUsage");
  v261 = (void *)objc_claimAutoreleasedReturnValue();
  v262 = v261;
  if (v261)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v261, "jsonRepresentation");
      v263 = (void *)objc_claimAutoreleasedReturnValue();
      v264 = CFSTR("arSessionUsage");
    }
    else
    {
      objc_msgSend(v261, "dictionaryRepresentation");
      v263 = (void *)objc_claimAutoreleasedReturnValue();
      v264 = CFSTR("ar_session_usage");
    }
    v265 = v263;

    objc_msgSend(v4, "setObject:forKey:", v265, v264);
  }

  objc_msgSend((id)a1, "networkSelectionHarvest");
  v266 = (void *)objc_claimAutoreleasedReturnValue();
  v267 = v266;
  if (v266)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v266, "jsonRepresentation");
      v268 = (void *)objc_claimAutoreleasedReturnValue();
      v269 = CFSTR("networkSelectionHarvest");
    }
    else
    {
      objc_msgSend(v266, "dictionaryRepresentation");
      v268 = (void *)objc_claimAutoreleasedReturnValue();
      v269 = CFSTR("network_selection_harvest");
    }
    v270 = v268;

    objc_msgSend(v4, "setObject:forKey:", v270, v269);
  }

  objc_msgSend((id)a1, "impressionEvent");
  v271 = (void *)objc_claimAutoreleasedReturnValue();
  v272 = v271;
  if (v271)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v271, "jsonRepresentation");
      v273 = (void *)objc_claimAutoreleasedReturnValue();
      v274 = CFSTR("impressionEvent");
    }
    else
    {
      objc_msgSend(v271, "dictionaryRepresentation");
      v273 = (void *)objc_claimAutoreleasedReturnValue();
      v274 = CFSTR("impression_event");
    }
    v275 = v273;

    objc_msgSend(v4, "setObject:forKey:", v275, v274);
  }

  objc_msgSend((id)a1, "showcaseSuppression");
  v276 = (void *)objc_claimAutoreleasedReturnValue();
  v277 = v276;
  if (v276)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v276, "jsonRepresentation");
      v278 = (void *)objc_claimAutoreleasedReturnValue();
      v279 = CFSTR("showcaseSuppression");
    }
    else
    {
      objc_msgSend(v276, "dictionaryRepresentation");
      v278 = (void *)objc_claimAutoreleasedReturnValue();
      v279 = CFSTR("showcase_suppression");
    }
    v280 = v278;

    objc_msgSend(v4, "setObject:forKey:", v280, v279);
  }

  objc_msgSend((id)a1, "placeCacheLookup");
  v281 = (void *)objc_claimAutoreleasedReturnValue();
  v282 = v281;
  if (v281)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v281, "jsonRepresentation");
      v283 = (void *)objc_claimAutoreleasedReturnValue();
      v284 = CFSTR("placeCacheLookup");
    }
    else
    {
      objc_msgSend(v281, "dictionaryRepresentation");
      v283 = (void *)objc_claimAutoreleasedReturnValue();
      v284 = CFSTR("place_cache_lookup");
    }
    v285 = v283;

    objc_msgSend(v4, "setObject:forKey:", v285, v284);
  }

  objc_msgSend((id)a1, "deviceSyncStatus");
  v286 = (void *)objc_claimAutoreleasedReturnValue();
  v287 = v286;
  if (v286)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v286, "jsonRepresentation");
      v288 = (void *)objc_claimAutoreleasedReturnValue();
      v289 = CFSTR("deviceSyncStatus");
    }
    else
    {
      objc_msgSend(v286, "dictionaryRepresentation");
      v288 = (void *)objc_claimAutoreleasedReturnValue();
      v289 = CFSTR("device_sync_status");
    }
    v290 = v288;

    objc_msgSend(v4, "setObject:forKey:", v290, v289);
  }

  objc_msgSend((id)a1, "mapsInteraction");
  v291 = (void *)objc_claimAutoreleasedReturnValue();
  v292 = v291;
  if (v291)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v291, "jsonRepresentation");
      v293 = (void *)objc_claimAutoreleasedReturnValue();
      v294 = CFSTR("mapsInteraction");
    }
    else
    {
      objc_msgSend(v291, "dictionaryRepresentation");
      v293 = (void *)objc_claimAutoreleasedReturnValue();
      v294 = CFSTR("maps_interaction");
    }
    v295 = v293;

    objc_msgSend(v4, "setObject:forKey:", v295, v294);
  }

  objc_msgSend((id)a1, "networkEventSummary");
  v296 = (void *)objc_claimAutoreleasedReturnValue();
  v297 = v296;
  if (v296)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v296, "jsonRepresentation");
      v298 = (void *)objc_claimAutoreleasedReturnValue();
      v299 = CFSTR("networkEventSummary");
    }
    else
    {
      objc_msgSend(v296, "dictionaryRepresentation");
      v298 = (void *)objc_claimAutoreleasedReturnValue();
      v299 = CFSTR("network_event_summary");
    }
    v300 = v298;

    objc_msgSend(v4, "setObject:forKey:", v300, v299);
  }

  objc_msgSend((id)a1, "serviceMetadata");
  v301 = (void *)objc_claimAutoreleasedReturnValue();
  v302 = v301;
  if (v301)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v301, "jsonRepresentation");
      v303 = (void *)objc_claimAutoreleasedReturnValue();
      v304 = CFSTR("serviceMetadata");
    }
    else
    {
      objc_msgSend(v301, "dictionaryRepresentation");
      v303 = (void *)objc_claimAutoreleasedReturnValue();
      v304 = CFSTR("service_metadata");
    }
    v305 = v303;

    objc_msgSend(v4, "setObject:forKey:", v305, v304);
  }

  objc_msgSend((id)a1, "mapsEngagement");
  v306 = (void *)objc_claimAutoreleasedReturnValue();
  v307 = v306;
  if (v306)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v306, "jsonRepresentation");
      v308 = (void *)objc_claimAutoreleasedReturnValue();
      v309 = CFSTR("mapsEngagement");
    }
    else
    {
      objc_msgSend(v306, "dictionaryRepresentation");
      v308 = (void *)objc_claimAutoreleasedReturnValue();
      v309 = CFSTR("maps_engagement");
    }
    v310 = v308;

    objc_msgSend(v4, "setObject:forKey:", v310, v309);
  }

  if ((*(_BYTE *)(a1 + 528) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 480));
    v311 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v312 = CFSTR("usageEventTime");
    else
      v312 = CFSTR("usage_event_time");
    objc_msgSend(v4, "setObject:forKey:", v311, v312);

  }
  v313 = v4;

  return v313;
}

- (id)jsonRepresentation
{
  return -[GEOLogMsgEvent _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLogMsgEvent)initWithDictionary:(id)a3
{
  return (GEOLogMsgEvent *)-[GEOLogMsgEvent _initWithDictionary:isJSON:](self, a3, 0);
}

- (id)_initWithDictionary:(int)a3 isJSON:
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
  GEOLogMsgState *v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  GEOLogMsgEventId *v19;
  uint64_t v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  id v27;
  uint64_t v28;
  const __CFString *v29;
  void *v30;
  GEOLogMsgEventUserAction *v31;
  uint64_t v32;
  void *v33;
  const __CFString *v34;
  void *v35;
  GEOLogMsgEventStateTiming *v36;
  uint64_t v37;
  void *v38;
  const __CFString *v39;
  void *v40;
  GEOLogMsgEventTileSetState *v41;
  uint64_t v42;
  void *v43;
  const __CFString *v44;
  void *v45;
  GEOLogMsgEventPlaceDataCache *v46;
  uint64_t v47;
  void *v48;
  const __CFString *v49;
  void *v50;
  GEOLogMsgEventNetwork *v51;
  uint64_t v52;
  void *v53;
  const __CFString *v54;
  void *v55;
  GEOLogMsgEventDirections *v56;
  uint64_t v57;
  void *v58;
  const __CFString *v59;
  void *v60;
  GEOLogMsgEventTransitAppLaunch *v61;
  uint64_t v62;
  void *v63;
  const __CFString *v64;
  void *v65;
  GEOLogMsgEventTimeToLeaveHypothesis *v66;
  uint64_t v67;
  void *v68;
  const __CFString *v69;
  void *v70;
  GEOLogMsgEventTimeToLeaveInitialTravelTime *v71;
  uint64_t v72;
  void *v73;
  const __CFString *v74;
  void *v75;
  GEOLogMsgEventMapsWidgetsInteractionSession *v76;
  uint64_t v77;
  void *v78;
  const __CFString *v79;
  void *v80;
  GEOLogMsgEventListInteractionSession *v81;
  uint64_t v82;
  void *v83;
  const __CFString *v84;
  void *v85;
  GEOLogMsgEventRefineSearchSession *v86;
  uint64_t v87;
  void *v88;
  const __CFString *v89;
  void *v90;
  GEOLogMsgEventProactiveSuggestionInteractionSession *v91;
  uint64_t v92;
  void *v93;
  const __CFString *v94;
  void *v95;
  GEOLogMsgEventMapLaunch *v96;
  uint64_t v97;
  void *v98;
  const __CFString *v99;
  void *v100;
  GEOLogMsgEventRideBookingSession *v101;
  uint64_t v102;
  void *v103;
  const __CFString *v104;
  void *v105;
  GEOLogMsgEventRideBookedSession *v106;
  uint64_t v107;
  void *v108;
  const __CFString *v109;
  void *v110;
  GEOLogMsgEventTableBookingSession *v111;
  uint64_t v112;
  void *v113;
  const __CFString *v114;
  void *v115;
  GEOLogMsgEventTableBookedSession *v116;
  uint64_t v117;
  void *v118;
  const __CFString *v119;
  void *v120;
  GEOLogMsgEventFullNavTrace *v121;
  uint64_t v122;
  void *v123;
  void *v124;
  GEOLogMsgEventTelemetric *v125;
  uint64_t v126;
  void *v127;
  const __CFString *v128;
  void *v129;
  GEOLogMsgEventClientACSuggestions *v130;
  uint64_t v131;
  void *v132;
  const __CFString *v133;
  void *v134;
  GEOLogMsgEventRealtimeTrafficProbe *v135;
  uint64_t v136;
  void *v137;
  const __CFString *v138;
  void *v139;
  GEOLogMsgEventBatchTrafficProbe *v140;
  uint64_t v141;
  void *v142;
  const __CFString *v143;
  void *v144;
  GEOLogMsgEventCommuteWindow *v145;
  uint64_t v146;
  void *v147;
  const __CFString *v148;
  void *v149;
  GEOLogMsgEventWifiConnectionQualityProbe *v150;
  uint64_t v151;
  void *v152;
  const __CFString *v153;
  void *v154;
  GEOLogMsgEventParkedCar *v155;
  uint64_t v156;
  void *v157;
  const __CFString *v158;
  void *v159;
  GEOLogMsgEventTileCacheAnalytic *v160;
  uint64_t v161;
  void *v162;
  const __CFString *v163;
  void *v164;
  GEOLogMsgEventGridDuration *v165;
  uint64_t v166;
  void *v167;
  const __CFString *v168;
  void *v169;
  GEOLogMsgEventDisplayAnalytic *v170;
  uint64_t v171;
  void *v172;
  const __CFString *v173;
  void *v174;
  GEOLogMsgEventThrottle *v175;
  uint64_t v176;
  void *v177;
  const __CFString *v178;
  void *v179;
  GEOLogMsgEventMapKitCounts *v180;
  uint64_t v181;
  void *v182;
  const __CFString *v183;
  void *v184;
  GEOLogMsgEventPredExTrainingData *v185;
  uint64_t v186;
  void *v187;
  const __CFString *v188;
  void *v189;
  GEOLogMsgEventMarcoLiteUsage *v190;
  uint64_t v191;
  void *v192;
  const __CFString *v193;
  void *v194;
  GEOLogMsgEventTripDepartureFeedback *v195;
  uint64_t v196;
  void *v197;
  const __CFString *v198;
  void *v199;
  GEOLogMsgEventDirectionsRequestDetails *v200;
  uint64_t v201;
  void *v202;
  const __CFString *v203;
  void *v204;
  GEOLogMsgEventEVRoutingVehicleDetails *v205;
  uint64_t v206;
  void *v207;
  const __CFString *v208;
  void *v209;
  GEOLogMsgEventEVTrip *v210;
  uint64_t v211;
  void *v212;
  const __CFString *v213;
  void *v214;
  GEOLogMsgEventCuratedCollectionStats *v215;
  uint64_t v216;
  void *v217;
  const __CFString *v218;
  void *v219;
  GEOLogMsgEventCuratedCollectionUsage *v220;
  uint64_t v221;
  void *v222;
  const __CFString *v223;
  void *v224;
  GEOLogMsgEventMapsDeviceSettings *v225;
  uint64_t v226;
  void *v227;
  const __CFString *v228;
  void *v229;
  GEOLogMsgEventHardStop *v230;
  uint64_t v231;
  void *v232;
  const __CFString *v233;
  void *v234;
  GEOLogMsgEventVLFUsage *v235;
  uint64_t v236;
  void *v237;
  const __CFString *v238;
  void *v239;
  GEOLogMsgEventLogDiscard *v240;
  uint64_t v241;
  void *v242;
  const __CFString *v243;
  void *v244;
  GEOLogMsgEventDailyUseSummary *v245;
  uint64_t v246;
  void *v247;
  const __CFString *v248;
  void *v249;
  GEOLogMsgEventPressureData *v250;
  uint64_t v251;
  void *v252;
  const __CFString *v253;
  void *v254;
  GEOLogMsgEventPOIBusynessData *v255;
  uint64_t v256;
  void *v257;
  const __CFString *v258;
  void *v259;
  GEOLogMsgEventPeriodicSettingsSummary *v260;
  uint64_t v261;
  void *v262;
  const __CFString *v263;
  void *v264;
  GEOLogMsgEventThermalPressure *v265;
  uint64_t v266;
  void *v267;
  const __CFString *v268;
  void *v269;
  GEOLogMsgEventARSessionUsage *v270;
  uint64_t v271;
  void *v272;
  const __CFString *v273;
  void *v274;
  GEOLogMsgEventNetworkSelectionHarvest *v275;
  uint64_t v276;
  void *v277;
  const __CFString *v278;
  void *v279;
  GEOLogMsgEventImpressionEvent *v280;
  uint64_t v281;
  void *v282;
  const __CFString *v283;
  void *v284;
  GEOLogMsgEventShowcaseSuppression *v285;
  uint64_t v286;
  void *v287;
  const __CFString *v288;
  void *v289;
  GEOLogMsgEventPlaceCacheLookup *v290;
  uint64_t v291;
  void *v292;
  const __CFString *v293;
  void *v294;
  GEOLogMsgEventDeviceSyncStatus *v295;
  uint64_t v296;
  void *v297;
  const __CFString *v298;
  void *v299;
  GEOLogMsgEventMapsInteraction *v300;
  uint64_t v301;
  void *v302;
  const __CFString *v303;
  void *v304;
  GEOLogMsgEventNetworkEventSummary *v305;
  uint64_t v306;
  void *v307;
  const __CFString *v308;
  void *v309;
  GEOLogMsgEventServiceMetadata *v310;
  uint64_t v311;
  void *v312;
  const __CFString *v313;
  void *v314;
  GEOLogMsgEventMapsEngagement *v315;
  uint64_t v316;
  void *v317;
  const __CFString *v318;
  void *v319;
  id v321;
  __int128 v322;
  __int128 v323;
  __int128 v324;
  __int128 v325;
  _BYTE v326[128];
  uint64_t v327;

  v327 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (!a1)
    goto LABEL_637;
  a1 = (id)objc_msgSend(a1, "init");

  if (!a1)
    goto LABEL_637;
  if (a3)
    v6 = CFSTR("logMsgState");
  else
    v6 = CFSTR("log_msg_state");
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v321 = v5;
    v324 = 0u;
    v325 = 0u;
    v322 = 0u;
    v323 = 0u;
    v8 = v7;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v322, v326, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v323;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v323 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v322 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v14 = [GEOLogMsgState alloc];
            if ((a3 & 1) != 0)
              v15 = -[GEOLogMsgState initWithJSON:](v14, "initWithJSON:", v13);
            else
              v15 = -[GEOLogMsgState initWithDictionary:](v14, "initWithDictionary:", v13);
            v16 = (void *)v15;
            objc_msgSend(a1, "addLogMsgState:", v15);

          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v322, v326, 16);
      }
      while (v10);
    }

    v5 = v321;
  }

  if (a3)
    v17 = CFSTR("analyticTag");
  else
    v17 = CFSTR("analytic_tag");
  objc_msgSend(v5, "objectForKeyedSubscript:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v19 = [GEOLogMsgEventId alloc];
    if ((a3 & 1) != 0)
      v20 = -[GEOLogMsgEventId initWithJSON:](v19, "initWithJSON:", v18);
    else
      v20 = -[GEOLogMsgEventId initWithDictionary:](v19, "initWithDictionary:", v18);
    v21 = (void *)v20;
    objc_msgSend(a1, "setAnalyticTag:", v20);

  }
  if (a3)
    v22 = CFSTR("mapsEnvironment");
  else
    v22 = CFSTR("maps_environment");
  objc_msgSend(v5, "objectForKeyedSubscript:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v24 = (void *)objc_msgSend(v23, "copy");
    objc_msgSend(a1, "setMapsEnvironment:", v24);

  }
  if (a3)
    v25 = CFSTR("eventType");
  else
    v25 = CFSTR("event_type");
  objc_msgSend(v5, "objectForKeyedSubscript:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v27 = v26;
    if ((objc_msgSend(v27, "isEqualToString:", CFSTR("LOG_MSG_EVENT_TYPE_UNKNOWN")) & 1) != 0)
    {
      v28 = 0;
    }
    else if ((objc_msgSend(v27, "isEqualToString:", CFSTR("USER_ACTION")) & 1) != 0)
    {
      v28 = 1;
    }
    else if ((objc_msgSend(v27, "isEqualToString:", CFSTR("STATE_TIMING")) & 1) != 0)
    {
      v28 = 2;
    }
    else if ((objc_msgSend(v27, "isEqualToString:", CFSTR("TILE_SET_STATE")) & 1) != 0)
    {
      v28 = 4;
    }
    else if ((objc_msgSend(v27, "isEqualToString:", CFSTR("PLACE_DATA_CACHE")) & 1) != 0)
    {
      v28 = 5;
    }
    else if ((objc_msgSend(v27, "isEqualToString:", CFSTR("NETWORK")) & 1) != 0)
    {
      v28 = 6;
    }
    else if ((objc_msgSend(v27, "isEqualToString:", CFSTR("CACHE_HIT")) & 1) != 0)
    {
      v28 = 7;
    }
    else if ((objc_msgSend(v27, "isEqualToString:", CFSTR("DIRECTIONS")) & 1) != 0)
    {
      v28 = 8;
    }
    else if ((objc_msgSend(v27, "isEqualToString:", CFSTR("TRANSIT_APP_LAUNCH")) & 1) != 0)
    {
      v28 = 9;
    }
    else if ((objc_msgSend(v27, "isEqualToString:", CFSTR("TIME_TO_LEAVE_HYPOTHESIS")) & 1) != 0)
    {
      v28 = 10;
    }
    else if ((objc_msgSend(v27, "isEqualToString:", CFSTR("TIME_TO_LEAVE_INITIAL_TRAVEL_TIME")) & 1) != 0)
    {
      v28 = 11;
    }
    else if ((objc_msgSend(v27, "isEqualToString:", CFSTR("LOG_FRAMEWORK")) & 1) != 0)
    {
      v28 = 12;
    }
    else if ((objc_msgSend(v27, "isEqualToString:", CFSTR("MAPS_WIDGETS_SESSION")) & 1) != 0)
    {
      v28 = 13;
    }
    else if ((objc_msgSend(v27, "isEqualToString:", CFSTR("LIST_INTERACTION_SESSION")) & 1) != 0)
    {
      v28 = 14;
    }
    else if ((objc_msgSend(v27, "isEqualToString:", CFSTR("REFINE_SEARCH_SESSION")) & 1) != 0)
    {
      v28 = 15;
    }
    else if ((objc_msgSend(v27, "isEqualToString:", CFSTR("PROACTIVE_SUGGESTION_SESSION")) & 1) != 0)
    {
      v28 = 16;
    }
    else if ((objc_msgSend(v27, "isEqualToString:", CFSTR("MAP_LAUNCH")) & 1) != 0)
    {
      v28 = 17;
    }
    else if ((objc_msgSend(v27, "isEqualToString:", CFSTR("RIDE_BOOKING_SESSION")) & 1) != 0)
    {
      v28 = 18;
    }
    else if ((objc_msgSend(v27, "isEqualToString:", CFSTR("RIDE_BOOKED_SESSION")) & 1) != 0)
    {
      v28 = 19;
    }
    else if ((objc_msgSend(v27, "isEqualToString:", CFSTR("TABLE_BOOKING_SESSION")) & 1) != 0)
    {
      v28 = 20;
    }
    else if ((objc_msgSend(v27, "isEqualToString:", CFSTR("TABLE_BOOKED_SESSION")) & 1) != 0)
    {
      v28 = 21;
    }
    else if ((objc_msgSend(v27, "isEqualToString:", CFSTR("STALE_RESOURCE")) & 1) != 0)
    {
      v28 = 22;
    }
    else if ((objc_msgSend(v27, "isEqualToString:", CFSTR("FULL_NAV_TRACE")) & 1) != 0)
    {
      v28 = 23;
    }
    else if ((objc_msgSend(v27, "isEqualToString:", CFSTR("TELEMETRIC")) & 1) != 0)
    {
      v28 = 24;
    }
    else if ((objc_msgSend(v27, "isEqualToString:", CFSTR("CLIENT_AC_SUGGESTIONS")) & 1) != 0)
    {
      v28 = 25;
    }
    else if ((objc_msgSend(v27, "isEqualToString:", CFSTR("REALTIME_TRAFFIC_PROBE_COLLECTION")) & 1) != 0)
    {
      v28 = 26;
    }
    else if ((objc_msgSend(v27, "isEqualToString:", CFSTR("BATCH_TRAFFIC_PROBE_COLLECTION")) & 1) != 0)
    {
      v28 = 27;
    }
    else if ((objc_msgSend(v27, "isEqualToString:", CFSTR("OFFLINE_REQUEST_RESPONSE")) & 1) != 0)
    {
      v28 = 28;
    }
    else if ((objc_msgSend(v27, "isEqualToString:", CFSTR("COMMUTE_WINDOW")) & 1) != 0)
    {
      v28 = 29;
    }
    else if ((objc_msgSend(v27, "isEqualToString:", CFSTR("GENERIC_APP_ERROR")) & 1) != 0)
    {
      v28 = 30;
    }
    else if ((objc_msgSend(v27, "isEqualToString:", CFSTR("WIFI_CONNECTION_QUALITY_PROBE")) & 1) != 0)
    {
      v28 = 31;
    }
    else if ((objc_msgSend(v27, "isEqualToString:", CFSTR("PARKED_CAR")) & 1) != 0)
    {
      v28 = 32;
    }
    else if ((objc_msgSend(v27, "isEqualToString:", CFSTR("TILE_CACHE_ANALYTIC")) & 1) != 0)
    {
      v28 = 33;
    }
    else if ((objc_msgSend(v27, "isEqualToString:", CFSTR("GRID_DURATION")) & 1) != 0)
    {
      v28 = 34;
    }
    else if ((objc_msgSend(v27, "isEqualToString:", CFSTR("DISPLAY_ANALYTIC")) & 1) != 0)
    {
      v28 = 35;
    }
    else if ((objc_msgSend(v27, "isEqualToString:", CFSTR("THROTTLE")) & 1) != 0)
    {
      v28 = 36;
    }
    else if ((objc_msgSend(v27, "isEqualToString:", CFSTR("MAP_KIT_COUNTS")) & 1) != 0)
    {
      v28 = 37;
    }
    else if ((objc_msgSend(v27, "isEqualToString:", CFSTR("PRED_EX_TRAINING")) & 1) != 0)
    {
      v28 = 38;
    }
    else if ((objc_msgSend(v27, "isEqualToString:", CFSTR("MARCOLITE_USAGE")) & 1) != 0)
    {
      v28 = 39;
    }
    else if ((objc_msgSend(v27, "isEqualToString:", CFSTR("TRIP_DEPARTURE")) & 1) != 0)
    {
      v28 = 40;
    }
    else if ((objc_msgSend(v27, "isEqualToString:", CFSTR("DIRECTIONS_REQUEST_DETAILS")) & 1) != 0)
    {
      v28 = 41;
    }
    else if ((objc_msgSend(v27, "isEqualToString:", CFSTR("EV_ROUTING_VEHICLE_DETAILS")) & 1) != 0)
    {
      v28 = 42;
    }
    else if ((objc_msgSend(v27, "isEqualToString:", CFSTR("EV_TRIP")) & 1) != 0)
    {
      v28 = 43;
    }
    else if ((objc_msgSend(v27, "isEqualToString:", CFSTR("CURATED_COLLECTION_STATS")) & 1) != 0)
    {
      v28 = 44;
    }
    else if ((objc_msgSend(v27, "isEqualToString:", CFSTR("CURATED_COLLECTION_USAGE")) & 1) != 0)
    {
      v28 = 45;
    }
    else if ((objc_msgSend(v27, "isEqualToString:", CFSTR("MAPS_DEVICE_SETTINGS")) & 1) != 0)
    {
      v28 = 46;
    }
    else if ((objc_msgSend(v27, "isEqualToString:", CFSTR("HARD_STOP")) & 1) != 0)
    {
      v28 = 47;
    }
    else if ((objc_msgSend(v27, "isEqualToString:", CFSTR("VLF_USAGE")) & 1) != 0)
    {
      v28 = 48;
    }
    else if ((objc_msgSend(v27, "isEqualToString:", CFSTR("LOG_DISCARD")) & 1) != 0)
    {
      v28 = 49;
    }
    else if ((objc_msgSend(v27, "isEqualToString:", CFSTR("DAILY_USE_SUMMARY")) & 1) != 0)
    {
      v28 = 50;
    }
    else if ((objc_msgSend(v27, "isEqualToString:", CFSTR("PRESSURE_DATA")) & 1) != 0)
    {
      v28 = 51;
    }
    else if ((objc_msgSend(v27, "isEqualToString:", CFSTR("POI_BUSYNESS_DATA")) & 1) != 0)
    {
      v28 = 52;
    }
    else if ((objc_msgSend(v27, "isEqualToString:", CFSTR("PERIODIC_SETTINGS_SUMMARY")) & 1) != 0)
    {
      v28 = 53;
    }
    else if ((objc_msgSend(v27, "isEqualToString:", CFSTR("THERMAL_PRESSURE")) & 1) != 0)
    {
      v28 = 54;
    }
    else if ((objc_msgSend(v27, "isEqualToString:", CFSTR("AR_SESSION_USAGE")) & 1) != 0)
    {
      v28 = 55;
    }
    else if ((objc_msgSend(v27, "isEqualToString:", CFSTR("NETWORK_SELECTION_HARVEST")) & 1) != 0)
    {
      v28 = 56;
    }
    else if ((objc_msgSend(v27, "isEqualToString:", CFSTR("IMPRESSION_EVENT")) & 1) != 0)
    {
      v28 = 57;
    }
    else if ((objc_msgSend(v27, "isEqualToString:", CFSTR("SHOWCASE_SUPPRESSION")) & 1) != 0)
    {
      v28 = 58;
    }
    else if ((objc_msgSend(v27, "isEqualToString:", CFSTR("PLACE_CACHE_LOOKUP")) & 1) != 0)
    {
      v28 = 59;
    }
    else if ((objc_msgSend(v27, "isEqualToString:", CFSTR("DEVICE_SYNC_STATUS")) & 1) != 0)
    {
      v28 = 60;
    }
    else if ((objc_msgSend(v27, "isEqualToString:", CFSTR("MAPS_INTERACTION")) & 1) != 0)
    {
      v28 = 61;
    }
    else if ((objc_msgSend(v27, "isEqualToString:", CFSTR("NETWORK_EVENT_SUMMARY")) & 1) != 0)
    {
      v28 = 62;
    }
    else if ((objc_msgSend(v27, "isEqualToString:", CFSTR("SERVICE_METADATA")) & 1) != 0)
    {
      v28 = 63;
    }
    else if (objc_msgSend(v27, "isEqualToString:", CFSTR("MAPS_ENGAGEMENT")))
    {
      v28 = 64;
    }
    else
    {
      v28 = 0;
    }

    goto LABEL_169;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v28 = objc_msgSend(v26, "intValue");
LABEL_169:
    objc_msgSend(a1, "setEventType:", v28);
  }

  if (a3)
    v29 = CFSTR("userActionEvent");
  else
    v29 = CFSTR("user_action_event");
  objc_msgSend(v5, "objectForKeyedSubscript:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v31 = [GEOLogMsgEventUserAction alloc];
    if ((a3 & 1) != 0)
      v32 = -[GEOLogMsgEventUserAction initWithJSON:](v31, "initWithJSON:", v30);
    else
      v32 = -[GEOLogMsgEventUserAction initWithDictionary:](v31, "initWithDictionary:", v30);
    v33 = (void *)v32;
    objc_msgSend(a1, "setUserActionEvent:", v32);

  }
  if (a3)
    v34 = CFSTR("stateTimingEvent");
  else
    v34 = CFSTR("state_timing_event");
  objc_msgSend(v5, "objectForKeyedSubscript:", v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v36 = [GEOLogMsgEventStateTiming alloc];
    if ((a3 & 1) != 0)
      v37 = -[GEOLogMsgEventStateTiming initWithJSON:](v36, "initWithJSON:", v35);
    else
      v37 = -[GEOLogMsgEventStateTiming initWithDictionary:](v36, "initWithDictionary:", v35);
    v38 = (void *)v37;
    objc_msgSend(a1, "setStateTimingEvent:", v37);

  }
  if (a3)
    v39 = CFSTR("tileSetStateEvent");
  else
    v39 = CFSTR("tile_set_state_event");
  objc_msgSend(v5, "objectForKeyedSubscript:", v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v41 = [GEOLogMsgEventTileSetState alloc];
    if ((a3 & 1) != 0)
      v42 = -[GEOLogMsgEventTileSetState initWithJSON:](v41, "initWithJSON:", v40);
    else
      v42 = -[GEOLogMsgEventTileSetState initWithDictionary:](v41, "initWithDictionary:", v40);
    v43 = (void *)v42;
    objc_msgSend(a1, "setTileSetStateEvent:", v42);

  }
  if (a3)
    v44 = CFSTR("placeDataCacheEvent");
  else
    v44 = CFSTR("place_data_cache_event");
  objc_msgSend(v5, "objectForKeyedSubscript:", v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v46 = [GEOLogMsgEventPlaceDataCache alloc];
    if ((a3 & 1) != 0)
      v47 = -[GEOLogMsgEventPlaceDataCache initWithJSON:](v46, "initWithJSON:", v45);
    else
      v47 = -[GEOLogMsgEventPlaceDataCache initWithDictionary:](v46, "initWithDictionary:", v45);
    v48 = (void *)v47;
    objc_msgSend(a1, "setPlaceDataCacheEvent:", v47);

  }
  if (a3)
    v49 = CFSTR("networkEvent");
  else
    v49 = CFSTR("network_event");
  objc_msgSend(v5, "objectForKeyedSubscript:", v49);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v51 = [GEOLogMsgEventNetwork alloc];
    if ((a3 & 1) != 0)
      v52 = -[GEOLogMsgEventNetwork initWithJSON:](v51, "initWithJSON:", v50);
    else
      v52 = -[GEOLogMsgEventNetwork initWithDictionary:](v51, "initWithDictionary:", v50);
    v53 = (void *)v52;
    objc_msgSend(a1, "setNetworkEvent:", v52);

  }
  if (a3)
    v54 = CFSTR("directionsEvent");
  else
    v54 = CFSTR("directions_event");
  objc_msgSend(v5, "objectForKeyedSubscript:", v54);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v56 = [GEOLogMsgEventDirections alloc];
    if ((a3 & 1) != 0)
      v57 = -[GEOLogMsgEventDirections initWithJSON:](v56, "initWithJSON:", v55);
    else
      v57 = -[GEOLogMsgEventDirections initWithDictionary:](v56, "initWithDictionary:", v55);
    v58 = (void *)v57;
    objc_msgSend(a1, "setDirectionsEvent:", v57);

  }
  if (a3)
    v59 = CFSTR("transitAppLaunchEvent");
  else
    v59 = CFSTR("transit_app_launch_event");
  objc_msgSend(v5, "objectForKeyedSubscript:", v59);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v61 = [GEOLogMsgEventTransitAppLaunch alloc];
    if ((a3 & 1) != 0)
      v62 = -[GEOLogMsgEventTransitAppLaunch initWithJSON:](v61, "initWithJSON:", v60);
    else
      v62 = -[GEOLogMsgEventTransitAppLaunch initWithDictionary:](v61, "initWithDictionary:", v60);
    v63 = (void *)v62;
    objc_msgSend(a1, "setTransitAppLaunchEvent:", v62);

  }
  if (a3)
    v64 = CFSTR("timeToLeaveHypothesisEvent");
  else
    v64 = CFSTR("time_to_leave_hypothesis_event");
  objc_msgSend(v5, "objectForKeyedSubscript:", v64);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v66 = [GEOLogMsgEventTimeToLeaveHypothesis alloc];
    if ((a3 & 1) != 0)
      v67 = -[GEOLogMsgEventTimeToLeaveHypothesis initWithJSON:](v66, "initWithJSON:", v65);
    else
      v67 = -[GEOLogMsgEventTimeToLeaveHypothesis initWithDictionary:](v66, "initWithDictionary:", v65);
    v68 = (void *)v67;
    objc_msgSend(a1, "setTimeToLeaveHypothesisEvent:", v67);

  }
  if (a3)
    v69 = CFSTR("timeToLeaveInitialTravelTimeEvent");
  else
    v69 = CFSTR("time_to_leave_initial_travel_time_event");
  objc_msgSend(v5, "objectForKeyedSubscript:", v69);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v71 = [GEOLogMsgEventTimeToLeaveInitialTravelTime alloc];
    if ((a3 & 1) != 0)
      v72 = -[GEOLogMsgEventTimeToLeaveInitialTravelTime initWithJSON:](v71, "initWithJSON:", v70);
    else
      v72 = -[GEOLogMsgEventTimeToLeaveInitialTravelTime initWithDictionary:](v71, "initWithDictionary:", v70);
    v73 = (void *)v72;
    objc_msgSend(a1, "setTimeToLeaveInitialTravelTimeEvent:", v72);

  }
  if (a3)
    v74 = CFSTR("mapsWidgetsInteractionSession");
  else
    v74 = CFSTR("maps_widgets_interaction_session");
  objc_msgSend(v5, "objectForKeyedSubscript:", v74);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v76 = [GEOLogMsgEventMapsWidgetsInteractionSession alloc];
    if ((a3 & 1) != 0)
      v77 = -[GEOLogMsgEventMapsWidgetsInteractionSession initWithJSON:](v76, "initWithJSON:", v75);
    else
      v77 = -[GEOLogMsgEventMapsWidgetsInteractionSession initWithDictionary:](v76, "initWithDictionary:", v75);
    v78 = (void *)v77;
    objc_msgSend(a1, "setMapsWidgetsInteractionSession:", v77);

  }
  if (a3)
    v79 = CFSTR("listInteractionSession");
  else
    v79 = CFSTR("list_interaction_session");
  objc_msgSend(v5, "objectForKeyedSubscript:", v79);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v81 = [GEOLogMsgEventListInteractionSession alloc];
    if ((a3 & 1) != 0)
      v82 = -[GEOLogMsgEventListInteractionSession initWithJSON:](v81, "initWithJSON:", v80);
    else
      v82 = -[GEOLogMsgEventListInteractionSession initWithDictionary:](v81, "initWithDictionary:", v80);
    v83 = (void *)v82;
    objc_msgSend(a1, "setListInteractionSession:", v82);

  }
  if (a3)
    v84 = CFSTR("refineSearchSession");
  else
    v84 = CFSTR("refine_search_session");
  objc_msgSend(v5, "objectForKeyedSubscript:", v84);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v86 = [GEOLogMsgEventRefineSearchSession alloc];
    if ((a3 & 1) != 0)
      v87 = -[GEOLogMsgEventRefineSearchSession initWithJSON:](v86, "initWithJSON:", v85);
    else
      v87 = -[GEOLogMsgEventRefineSearchSession initWithDictionary:](v86, "initWithDictionary:", v85);
    v88 = (void *)v87;
    objc_msgSend(a1, "setRefineSearchSession:", v87);

  }
  if (a3)
    v89 = CFSTR("proactiveSuggestionInteractionSessionEvent");
  else
    v89 = CFSTR("proactive_suggestion_interaction_session_event");
  objc_msgSend(v5, "objectForKeyedSubscript:", v89);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v91 = [GEOLogMsgEventProactiveSuggestionInteractionSession alloc];
    if ((a3 & 1) != 0)
      v92 = -[GEOLogMsgEventProactiveSuggestionInteractionSession initWithJSON:](v91, "initWithJSON:", v90);
    else
      v92 = -[GEOLogMsgEventProactiveSuggestionInteractionSession initWithDictionary:](v91, "initWithDictionary:", v90);
    v93 = (void *)v92;
    objc_msgSend(a1, "setProactiveSuggestionInteractionSessionEvent:", v92);

  }
  if (a3)
    v94 = CFSTR("mapLaunchEvent");
  else
    v94 = CFSTR("map_launch_event");
  objc_msgSend(v5, "objectForKeyedSubscript:", v94);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v96 = [GEOLogMsgEventMapLaunch alloc];
    if ((a3 & 1) != 0)
      v97 = -[GEOLogMsgEventMapLaunch initWithJSON:](v96, "initWithJSON:", v95);
    else
      v97 = -[GEOLogMsgEventMapLaunch initWithDictionary:](v96, "initWithDictionary:", v95);
    v98 = (void *)v97;
    objc_msgSend(a1, "setMapLaunchEvent:", v97);

  }
  if (a3)
    v99 = CFSTR("rideBookingSession");
  else
    v99 = CFSTR("ride_booking_session");
  objc_msgSend(v5, "objectForKeyedSubscript:", v99);
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v101 = [GEOLogMsgEventRideBookingSession alloc];
    if ((a3 & 1) != 0)
      v102 = -[GEOLogMsgEventRideBookingSession initWithJSON:](v101, "initWithJSON:", v100);
    else
      v102 = -[GEOLogMsgEventRideBookingSession initWithDictionary:](v101, "initWithDictionary:", v100);
    v103 = (void *)v102;
    objc_msgSend(a1, "setRideBookingSession:", v102);

  }
  if (a3)
    v104 = CFSTR("rideBookedSession");
  else
    v104 = CFSTR("ride_booked_session");
  objc_msgSend(v5, "objectForKeyedSubscript:", v104);
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v106 = [GEOLogMsgEventRideBookedSession alloc];
    if ((a3 & 1) != 0)
      v107 = -[GEOLogMsgEventRideBookedSession initWithJSON:](v106, "initWithJSON:", v105);
    else
      v107 = -[GEOLogMsgEventRideBookedSession initWithDictionary:](v106, "initWithDictionary:", v105);
    v108 = (void *)v107;
    objc_msgSend(a1, "setRideBookedSession:", v107);

  }
  if (a3)
    v109 = CFSTR("tableBookingSession");
  else
    v109 = CFSTR("table_booking_session");
  objc_msgSend(v5, "objectForKeyedSubscript:", v109);
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v111 = [GEOLogMsgEventTableBookingSession alloc];
    if ((a3 & 1) != 0)
      v112 = -[GEOLogMsgEventTableBookingSession initWithJSON:](v111, "initWithJSON:", v110);
    else
      v112 = -[GEOLogMsgEventTableBookingSession initWithDictionary:](v111, "initWithDictionary:", v110);
    v113 = (void *)v112;
    objc_msgSend(a1, "setTableBookingSession:", v112);

  }
  if (a3)
    v114 = CFSTR("tableBookedSession");
  else
    v114 = CFSTR("table_booked_session");
  objc_msgSend(v5, "objectForKeyedSubscript:", v114);
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v116 = [GEOLogMsgEventTableBookedSession alloc];
    if ((a3 & 1) != 0)
      v117 = -[GEOLogMsgEventTableBookedSession initWithJSON:](v116, "initWithJSON:", v115);
    else
      v117 = -[GEOLogMsgEventTableBookedSession initWithDictionary:](v116, "initWithDictionary:", v115);
    v118 = (void *)v117;
    objc_msgSend(a1, "setTableBookedSession:", v117);

  }
  if (a3)
    v119 = CFSTR("fullNavTrace");
  else
    v119 = CFSTR("full_nav_trace");
  objc_msgSend(v5, "objectForKeyedSubscript:", v119);
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v121 = [GEOLogMsgEventFullNavTrace alloc];
    if ((a3 & 1) != 0)
      v122 = -[GEOLogMsgEventFullNavTrace initWithJSON:](v121, "initWithJSON:", v120);
    else
      v122 = -[GEOLogMsgEventFullNavTrace initWithDictionary:](v121, "initWithDictionary:", v120);
    v123 = (void *)v122;
    objc_msgSend(a1, "setFullNavTrace:", v122);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("telemetric"));
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v125 = [GEOLogMsgEventTelemetric alloc];
    if ((a3 & 1) != 0)
      v126 = -[GEOLogMsgEventTelemetric initWithJSON:](v125, "initWithJSON:", v124);
    else
      v126 = -[GEOLogMsgEventTelemetric initWithDictionary:](v125, "initWithDictionary:", v124);
    v127 = (void *)v126;
    objc_msgSend(a1, "setTelemetric:", v126);

  }
  if (a3)
    v128 = CFSTR("clientAcSuggestions");
  else
    v128 = CFSTR("client_ac_suggestions");
  objc_msgSend(v5, "objectForKeyedSubscript:", v128);
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v130 = [GEOLogMsgEventClientACSuggestions alloc];
    if ((a3 & 1) != 0)
      v131 = -[GEOLogMsgEventClientACSuggestions initWithJSON:](v130, "initWithJSON:", v129);
    else
      v131 = -[GEOLogMsgEventClientACSuggestions initWithDictionary:](v130, "initWithDictionary:", v129);
    v132 = (void *)v131;
    objc_msgSend(a1, "setClientAcSuggestions:", v131);

  }
  if (a3)
    v133 = CFSTR("realtimeTrafficProbeCollection");
  else
    v133 = CFSTR("realtime_traffic_probe_collection");
  objc_msgSend(v5, "objectForKeyedSubscript:", v133);
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v135 = [GEOLogMsgEventRealtimeTrafficProbe alloc];
    if ((a3 & 1) != 0)
      v136 = -[GEOLogMsgEventRealtimeTrafficProbe initWithJSON:](v135, "initWithJSON:", v134);
    else
      v136 = -[GEOLogMsgEventRealtimeTrafficProbe initWithDictionary:](v135, "initWithDictionary:", v134);
    v137 = (void *)v136;
    objc_msgSend(a1, "setRealtimeTrafficProbeCollection:", v136);

  }
  if (a3)
    v138 = CFSTR("batchTrafficProbeCollection");
  else
    v138 = CFSTR("batch_traffic_probe_collection");
  objc_msgSend(v5, "objectForKeyedSubscript:", v138);
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v140 = [GEOLogMsgEventBatchTrafficProbe alloc];
    if ((a3 & 1) != 0)
      v141 = -[GEOLogMsgEventBatchTrafficProbe initWithJSON:](v140, "initWithJSON:", v139);
    else
      v141 = -[GEOLogMsgEventBatchTrafficProbe initWithDictionary:](v140, "initWithDictionary:", v139);
    v142 = (void *)v141;
    objc_msgSend(a1, "setBatchTrafficProbeCollection:", v141);

  }
  if (a3)
    v143 = CFSTR("commuteWindow");
  else
    v143 = CFSTR("commute_window");
  objc_msgSend(v5, "objectForKeyedSubscript:", v143);
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v145 = [GEOLogMsgEventCommuteWindow alloc];
    if ((a3 & 1) != 0)
      v146 = -[GEOLogMsgEventCommuteWindow initWithJSON:](v145, "initWithJSON:", v144);
    else
      v146 = -[GEOLogMsgEventCommuteWindow initWithDictionary:](v145, "initWithDictionary:", v144);
    v147 = (void *)v146;
    objc_msgSend(a1, "setCommuteWindow:", v146);

  }
  if (a3)
    v148 = CFSTR("wifiConnectionQualityProbeEvent");
  else
    v148 = CFSTR("wifi_connection_quality_probe_event");
  objc_msgSend(v5, "objectForKeyedSubscript:", v148);
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v150 = [GEOLogMsgEventWifiConnectionQualityProbe alloc];
    if ((a3 & 1) != 0)
      v151 = -[GEOLogMsgEventWifiConnectionQualityProbe initWithJSON:](v150, "initWithJSON:", v149);
    else
      v151 = -[GEOLogMsgEventWifiConnectionQualityProbe initWithDictionary:](v150, "initWithDictionary:", v149);
    v152 = (void *)v151;
    objc_msgSend(a1, "setWifiConnectionQualityProbeEvent:", v151);

  }
  if (a3)
    v153 = CFSTR("parkedCar");
  else
    v153 = CFSTR("parked_car");
  objc_msgSend(v5, "objectForKeyedSubscript:", v153);
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v155 = [GEOLogMsgEventParkedCar alloc];
    if ((a3 & 1) != 0)
      v156 = -[GEOLogMsgEventParkedCar initWithJSON:](v155, "initWithJSON:", v154);
    else
      v156 = -[GEOLogMsgEventParkedCar initWithDictionary:](v155, "initWithDictionary:", v154);
    v157 = (void *)v156;
    objc_msgSend(a1, "setParkedCar:", v156);

  }
  if (a3)
    v158 = CFSTR("tileCacheAnalytic");
  else
    v158 = CFSTR("tile_cache_analytic");
  objc_msgSend(v5, "objectForKeyedSubscript:", v158);
  v159 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v160 = [GEOLogMsgEventTileCacheAnalytic alloc];
    if ((a3 & 1) != 0)
      v161 = -[GEOLogMsgEventTileCacheAnalytic initWithJSON:](v160, "initWithJSON:", v159);
    else
      v161 = -[GEOLogMsgEventTileCacheAnalytic initWithDictionary:](v160, "initWithDictionary:", v159);
    v162 = (void *)v161;
    objc_msgSend(a1, "setTileCacheAnalytic:", v161);

  }
  if (a3)
    v163 = CFSTR("gridDuration");
  else
    v163 = CFSTR("grid_duration");
  objc_msgSend(v5, "objectForKeyedSubscript:", v163);
  v164 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v165 = [GEOLogMsgEventGridDuration alloc];
    if ((a3 & 1) != 0)
      v166 = -[GEOLogMsgEventGridDuration initWithJSON:](v165, "initWithJSON:", v164);
    else
      v166 = -[GEOLogMsgEventGridDuration initWithDictionary:](v165, "initWithDictionary:", v164);
    v167 = (void *)v166;
    objc_msgSend(a1, "setGridDuration:", v166);

  }
  if (a3)
    v168 = CFSTR("displayAnalytic");
  else
    v168 = CFSTR("display_analytic");
  objc_msgSend(v5, "objectForKeyedSubscript:", v168);
  v169 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v170 = [GEOLogMsgEventDisplayAnalytic alloc];
    if ((a3 & 1) != 0)
      v171 = -[GEOLogMsgEventDisplayAnalytic initWithJSON:](v170, "initWithJSON:", v169);
    else
      v171 = -[GEOLogMsgEventDisplayAnalytic initWithDictionary:](v170, "initWithDictionary:", v169);
    v172 = (void *)v171;
    objc_msgSend(a1, "setDisplayAnalytic:", v171);

  }
  if (a3)
    v173 = CFSTR("throttleEvent");
  else
    v173 = CFSTR("throttle_event");
  objc_msgSend(v5, "objectForKeyedSubscript:", v173);
  v174 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v175 = [GEOLogMsgEventThrottle alloc];
    if ((a3 & 1) != 0)
      v176 = -[GEOLogMsgEventThrottle initWithJSON:](v175, "initWithJSON:", v174);
    else
      v176 = -[GEOLogMsgEventThrottle initWithDictionary:](v175, "initWithDictionary:", v174);
    v177 = (void *)v176;
    objc_msgSend(a1, "setThrottleEvent:", v176);

  }
  if (a3)
    v178 = CFSTR("mapKitCounts");
  else
    v178 = CFSTR("map_kit_counts");
  objc_msgSend(v5, "objectForKeyedSubscript:", v178);
  v179 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v180 = [GEOLogMsgEventMapKitCounts alloc];
    if ((a3 & 1) != 0)
      v181 = -[GEOLogMsgEventMapKitCounts initWithJSON:](v180, "initWithJSON:", v179);
    else
      v181 = -[GEOLogMsgEventMapKitCounts initWithDictionary:](v180, "initWithDictionary:", v179);
    v182 = (void *)v181;
    objc_msgSend(a1, "setMapKitCounts:", v181);

  }
  if (a3)
    v183 = CFSTR("predExTrainingData");
  else
    v183 = CFSTR("pred_ex_training_data");
  objc_msgSend(v5, "objectForKeyedSubscript:", v183);
  v184 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v185 = [GEOLogMsgEventPredExTrainingData alloc];
    if ((a3 & 1) != 0)
      v186 = -[GEOLogMsgEventPredExTrainingData initWithJSON:](v185, "initWithJSON:", v184);
    else
      v186 = -[GEOLogMsgEventPredExTrainingData initWithDictionary:](v185, "initWithDictionary:", v184);
    v187 = (void *)v186;
    objc_msgSend(a1, "setPredExTrainingData:", v186);

  }
  if (a3)
    v188 = CFSTR("marcoLiteUsage");
  else
    v188 = CFSTR("marco_lite_usage");
  objc_msgSend(v5, "objectForKeyedSubscript:", v188);
  v189 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v190 = [GEOLogMsgEventMarcoLiteUsage alloc];
    if ((a3 & 1) != 0)
      v191 = -[GEOLogMsgEventMarcoLiteUsage initWithJSON:](v190, "initWithJSON:", v189);
    else
      v191 = -[GEOLogMsgEventMarcoLiteUsage initWithDictionary:](v190, "initWithDictionary:", v189);
    v192 = (void *)v191;
    objc_msgSend(a1, "setMarcoLiteUsage:", v191);

  }
  if (a3)
    v193 = CFSTR("tripDepartureFeedback");
  else
    v193 = CFSTR("trip_departure_feedback");
  objc_msgSend(v5, "objectForKeyedSubscript:", v193);
  v194 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v195 = [GEOLogMsgEventTripDepartureFeedback alloc];
    if ((a3 & 1) != 0)
      v196 = -[GEOLogMsgEventTripDepartureFeedback initWithJSON:](v195, "initWithJSON:", v194);
    else
      v196 = -[GEOLogMsgEventTripDepartureFeedback initWithDictionary:](v195, "initWithDictionary:", v194);
    v197 = (void *)v196;
    objc_msgSend(a1, "setTripDepartureFeedback:", v196);

  }
  if (a3)
    v198 = CFSTR("directionsRequestDetails");
  else
    v198 = CFSTR("directions_request_details");
  objc_msgSend(v5, "objectForKeyedSubscript:", v198);
  v199 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v200 = [GEOLogMsgEventDirectionsRequestDetails alloc];
    if ((a3 & 1) != 0)
      v201 = -[GEOLogMsgEventDirectionsRequestDetails initWithJSON:](v200, "initWithJSON:", v199);
    else
      v201 = -[GEOLogMsgEventDirectionsRequestDetails initWithDictionary:](v200, "initWithDictionary:", v199);
    v202 = (void *)v201;
    objc_msgSend(a1, "setDirectionsRequestDetails:", v201);

  }
  if (a3)
    v203 = CFSTR("evRoutingVehicleDetails");
  else
    v203 = CFSTR("ev_routing_vehicle_details");
  objc_msgSend(v5, "objectForKeyedSubscript:", v203);
  v204 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v205 = [GEOLogMsgEventEVRoutingVehicleDetails alloc];
    if ((a3 & 1) != 0)
      v206 = -[GEOLogMsgEventEVRoutingVehicleDetails initWithJSON:](v205, "initWithJSON:", v204);
    else
      v206 = -[GEOLogMsgEventEVRoutingVehicleDetails initWithDictionary:](v205, "initWithDictionary:", v204);
    v207 = (void *)v206;
    objc_msgSend(a1, "setEvRoutingVehicleDetails:", v206);

  }
  if (a3)
    v208 = CFSTR("evTrip");
  else
    v208 = CFSTR("ev_trip");
  objc_msgSend(v5, "objectForKeyedSubscript:", v208);
  v209 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v210 = [GEOLogMsgEventEVTrip alloc];
    if ((a3 & 1) != 0)
      v211 = -[GEOLogMsgEventEVTrip initWithJSON:](v210, "initWithJSON:", v209);
    else
      v211 = -[GEOLogMsgEventEVTrip initWithDictionary:](v210, "initWithDictionary:", v209);
    v212 = (void *)v211;
    objc_msgSend(a1, "setEvTrip:", v211);

  }
  if (a3)
    v213 = CFSTR("curatedCollectionStats");
  else
    v213 = CFSTR("curated_collection_stats");
  objc_msgSend(v5, "objectForKeyedSubscript:", v213);
  v214 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v215 = [GEOLogMsgEventCuratedCollectionStats alloc];
    if ((a3 & 1) != 0)
      v216 = -[GEOLogMsgEventCuratedCollectionStats initWithJSON:](v215, "initWithJSON:", v214);
    else
      v216 = -[GEOLogMsgEventCuratedCollectionStats initWithDictionary:](v215, "initWithDictionary:", v214);
    v217 = (void *)v216;
    objc_msgSend(a1, "setCuratedCollectionStats:", v216);

  }
  if (a3)
    v218 = CFSTR("curatedCollectionUsage");
  else
    v218 = CFSTR("curated_collection_usage");
  objc_msgSend(v5, "objectForKeyedSubscript:", v218);
  v219 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v220 = [GEOLogMsgEventCuratedCollectionUsage alloc];
    if ((a3 & 1) != 0)
      v221 = -[GEOLogMsgEventCuratedCollectionUsage initWithJSON:](v220, "initWithJSON:", v219);
    else
      v221 = -[GEOLogMsgEventCuratedCollectionUsage initWithDictionary:](v220, "initWithDictionary:", v219);
    v222 = (void *)v221;
    objc_msgSend(a1, "setCuratedCollectionUsage:", v221);

  }
  if (a3)
    v223 = CFSTR("mapsDeviceSettings");
  else
    v223 = CFSTR("maps_device_settings");
  objc_msgSend(v5, "objectForKeyedSubscript:", v223);
  v224 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v225 = [GEOLogMsgEventMapsDeviceSettings alloc];
    if ((a3 & 1) != 0)
      v226 = -[GEOLogMsgEventMapsDeviceSettings initWithJSON:](v225, "initWithJSON:", v224);
    else
      v226 = -[GEOLogMsgEventMapsDeviceSettings initWithDictionary:](v225, "initWithDictionary:", v224);
    v227 = (void *)v226;
    objc_msgSend(a1, "setMapsDeviceSettings:", v226);

  }
  if (a3)
    v228 = CFSTR("hardStop");
  else
    v228 = CFSTR("hard_stop");
  objc_msgSend(v5, "objectForKeyedSubscript:", v228);
  v229 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v230 = [GEOLogMsgEventHardStop alloc];
    if ((a3 & 1) != 0)
      v231 = -[GEOLogMsgEventHardStop initWithJSON:](v230, "initWithJSON:", v229);
    else
      v231 = -[GEOLogMsgEventHardStop initWithDictionary:](v230, "initWithDictionary:", v229);
    v232 = (void *)v231;
    objc_msgSend(a1, "setHardStop:", v231);

  }
  if (a3)
    v233 = CFSTR("vlfUsage");
  else
    v233 = CFSTR("vlf_usage");
  objc_msgSend(v5, "objectForKeyedSubscript:", v233);
  v234 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v235 = [GEOLogMsgEventVLFUsage alloc];
    if ((a3 & 1) != 0)
      v236 = -[GEOLogMsgEventVLFUsage initWithJSON:](v235, "initWithJSON:", v234);
    else
      v236 = -[GEOLogMsgEventVLFUsage initWithDictionary:](v235, "initWithDictionary:", v234);
    v237 = (void *)v236;
    objc_msgSend(a1, "setVlfUsage:", v236);

  }
  if (a3)
    v238 = CFSTR("logDiscard");
  else
    v238 = CFSTR("log_discard");
  objc_msgSend(v5, "objectForKeyedSubscript:", v238);
  v239 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v240 = [GEOLogMsgEventLogDiscard alloc];
    if ((a3 & 1) != 0)
      v241 = -[GEOLogMsgEventLogDiscard initWithJSON:](v240, "initWithJSON:", v239);
    else
      v241 = -[GEOLogMsgEventLogDiscard initWithDictionary:](v240, "initWithDictionary:", v239);
    v242 = (void *)v241;
    objc_msgSend(a1, "setLogDiscard:", v241);

  }
  if (a3)
    v243 = CFSTR("dailyUseSummary");
  else
    v243 = CFSTR("daily_use_summary");
  objc_msgSend(v5, "objectForKeyedSubscript:", v243);
  v244 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v245 = [GEOLogMsgEventDailyUseSummary alloc];
    if ((a3 & 1) != 0)
      v246 = -[GEOLogMsgEventDailyUseSummary initWithJSON:](v245, "initWithJSON:", v244);
    else
      v246 = -[GEOLogMsgEventDailyUseSummary initWithDictionary:](v245, "initWithDictionary:", v244);
    v247 = (void *)v246;
    objc_msgSend(a1, "setDailyUseSummary:", v246);

  }
  if (a3)
    v248 = CFSTR("pressureData");
  else
    v248 = CFSTR("pressure_data");
  objc_msgSend(v5, "objectForKeyedSubscript:", v248);
  v249 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v250 = [GEOLogMsgEventPressureData alloc];
    if ((a3 & 1) != 0)
      v251 = -[GEOLogMsgEventPressureData initWithJSON:](v250, "initWithJSON:", v249);
    else
      v251 = -[GEOLogMsgEventPressureData initWithDictionary:](v250, "initWithDictionary:", v249);
    v252 = (void *)v251;
    objc_msgSend(a1, "setPressureData:", v251);

  }
  if (a3)
    v253 = CFSTR("poiBusynessData");
  else
    v253 = CFSTR("poi_busyness_data");
  objc_msgSend(v5, "objectForKeyedSubscript:", v253);
  v254 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v255 = [GEOLogMsgEventPOIBusynessData alloc];
    if ((a3 & 1) != 0)
      v256 = -[GEOLogMsgEventPOIBusynessData initWithJSON:](v255, "initWithJSON:", v254);
    else
      v256 = -[GEOLogMsgEventPOIBusynessData initWithDictionary:](v255, "initWithDictionary:", v254);
    v257 = (void *)v256;
    objc_msgSend(a1, "setPoiBusynessData:", v256);

  }
  if (a3)
    v258 = CFSTR("periodicSettingsSummary");
  else
    v258 = CFSTR("periodic_settings_summary");
  objc_msgSend(v5, "objectForKeyedSubscript:", v258);
  v259 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v260 = [GEOLogMsgEventPeriodicSettingsSummary alloc];
    if ((a3 & 1) != 0)
      v261 = -[GEOLogMsgEventPeriodicSettingsSummary initWithJSON:](v260, "initWithJSON:", v259);
    else
      v261 = -[GEOLogMsgEventPeriodicSettingsSummary initWithDictionary:](v260, "initWithDictionary:", v259);
    v262 = (void *)v261;
    objc_msgSend(a1, "setPeriodicSettingsSummary:", v261);

  }
  if (a3)
    v263 = CFSTR("thermalPressure");
  else
    v263 = CFSTR("thermal_pressure");
  objc_msgSend(v5, "objectForKeyedSubscript:", v263);
  v264 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v265 = [GEOLogMsgEventThermalPressure alloc];
    if ((a3 & 1) != 0)
      v266 = -[GEOLogMsgEventThermalPressure initWithJSON:](v265, "initWithJSON:", v264);
    else
      v266 = -[GEOLogMsgEventThermalPressure initWithDictionary:](v265, "initWithDictionary:", v264);
    v267 = (void *)v266;
    objc_msgSend(a1, "setThermalPressure:", v266);

  }
  if (a3)
    v268 = CFSTR("arSessionUsage");
  else
    v268 = CFSTR("ar_session_usage");
  objc_msgSend(v5, "objectForKeyedSubscript:", v268);
  v269 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v270 = [GEOLogMsgEventARSessionUsage alloc];
    if ((a3 & 1) != 0)
      v271 = -[GEOLogMsgEventARSessionUsage initWithJSON:](v270, "initWithJSON:", v269);
    else
      v271 = -[GEOLogMsgEventARSessionUsage initWithDictionary:](v270, "initWithDictionary:", v269);
    v272 = (void *)v271;
    objc_msgSend(a1, "setArSessionUsage:", v271);

  }
  if (a3)
    v273 = CFSTR("networkSelectionHarvest");
  else
    v273 = CFSTR("network_selection_harvest");
  objc_msgSend(v5, "objectForKeyedSubscript:", v273);
  v274 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v275 = [GEOLogMsgEventNetworkSelectionHarvest alloc];
    if ((a3 & 1) != 0)
      v276 = -[GEOLogMsgEventNetworkSelectionHarvest initWithJSON:](v275, "initWithJSON:", v274);
    else
      v276 = -[GEOLogMsgEventNetworkSelectionHarvest initWithDictionary:](v275, "initWithDictionary:", v274);
    v277 = (void *)v276;
    objc_msgSend(a1, "setNetworkSelectionHarvest:", v276);

  }
  if (a3)
    v278 = CFSTR("impressionEvent");
  else
    v278 = CFSTR("impression_event");
  objc_msgSend(v5, "objectForKeyedSubscript:", v278);
  v279 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v280 = [GEOLogMsgEventImpressionEvent alloc];
    if ((a3 & 1) != 0)
      v281 = -[GEOLogMsgEventImpressionEvent initWithJSON:](v280, "initWithJSON:", v279);
    else
      v281 = -[GEOLogMsgEventImpressionEvent initWithDictionary:](v280, "initWithDictionary:", v279);
    v282 = (void *)v281;
    objc_msgSend(a1, "setImpressionEvent:", v281);

  }
  if (a3)
    v283 = CFSTR("showcaseSuppression");
  else
    v283 = CFSTR("showcase_suppression");
  objc_msgSend(v5, "objectForKeyedSubscript:", v283);
  v284 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v285 = [GEOLogMsgEventShowcaseSuppression alloc];
    if ((a3 & 1) != 0)
      v286 = -[GEOLogMsgEventShowcaseSuppression initWithJSON:](v285, "initWithJSON:", v284);
    else
      v286 = -[GEOLogMsgEventShowcaseSuppression initWithDictionary:](v285, "initWithDictionary:", v284);
    v287 = (void *)v286;
    objc_msgSend(a1, "setShowcaseSuppression:", v286);

  }
  if (a3)
    v288 = CFSTR("placeCacheLookup");
  else
    v288 = CFSTR("place_cache_lookup");
  objc_msgSend(v5, "objectForKeyedSubscript:", v288);
  v289 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v290 = [GEOLogMsgEventPlaceCacheLookup alloc];
    if ((a3 & 1) != 0)
      v291 = -[GEOLogMsgEventPlaceCacheLookup initWithJSON:](v290, "initWithJSON:", v289);
    else
      v291 = -[GEOLogMsgEventPlaceCacheLookup initWithDictionary:](v290, "initWithDictionary:", v289);
    v292 = (void *)v291;
    objc_msgSend(a1, "setPlaceCacheLookup:", v291);

  }
  if (a3)
    v293 = CFSTR("deviceSyncStatus");
  else
    v293 = CFSTR("device_sync_status");
  objc_msgSend(v5, "objectForKeyedSubscript:", v293);
  v294 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v295 = [GEOLogMsgEventDeviceSyncStatus alloc];
    if ((a3 & 1) != 0)
      v296 = -[GEOLogMsgEventDeviceSyncStatus initWithJSON:](v295, "initWithJSON:", v294);
    else
      v296 = -[GEOLogMsgEventDeviceSyncStatus initWithDictionary:](v295, "initWithDictionary:", v294);
    v297 = (void *)v296;
    objc_msgSend(a1, "setDeviceSyncStatus:", v296);

  }
  if (a3)
    v298 = CFSTR("mapsInteraction");
  else
    v298 = CFSTR("maps_interaction");
  objc_msgSend(v5, "objectForKeyedSubscript:", v298);
  v299 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v300 = [GEOLogMsgEventMapsInteraction alloc];
    if ((a3 & 1) != 0)
      v301 = -[GEOLogMsgEventMapsInteraction initWithJSON:](v300, "initWithJSON:", v299);
    else
      v301 = -[GEOLogMsgEventMapsInteraction initWithDictionary:](v300, "initWithDictionary:", v299);
    v302 = (void *)v301;
    objc_msgSend(a1, "setMapsInteraction:", v301);

  }
  if (a3)
    v303 = CFSTR("networkEventSummary");
  else
    v303 = CFSTR("network_event_summary");
  objc_msgSend(v5, "objectForKeyedSubscript:", v303);
  v304 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v305 = [GEOLogMsgEventNetworkEventSummary alloc];
    if ((a3 & 1) != 0)
      v306 = -[GEOLogMsgEventNetworkEventSummary initWithJSON:](v305, "initWithJSON:", v304);
    else
      v306 = -[GEOLogMsgEventNetworkEventSummary initWithDictionary:](v305, "initWithDictionary:", v304);
    v307 = (void *)v306;
    objc_msgSend(a1, "setNetworkEventSummary:", v306);

  }
  if (a3)
    v308 = CFSTR("serviceMetadata");
  else
    v308 = CFSTR("service_metadata");
  objc_msgSend(v5, "objectForKeyedSubscript:", v308);
  v309 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v310 = [GEOLogMsgEventServiceMetadata alloc];
    if ((a3 & 1) != 0)
      v311 = -[GEOLogMsgEventServiceMetadata initWithJSON:](v310, "initWithJSON:", v309);
    else
      v311 = -[GEOLogMsgEventServiceMetadata initWithDictionary:](v310, "initWithDictionary:", v309);
    v312 = (void *)v311;
    objc_msgSend(a1, "setServiceMetadata:", v311);

  }
  if (a3)
    v313 = CFSTR("mapsEngagement");
  else
    v313 = CFSTR("maps_engagement");
  objc_msgSend(v5, "objectForKeyedSubscript:", v313);
  v314 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v315 = [GEOLogMsgEventMapsEngagement alloc];
    if ((a3 & 1) != 0)
      v316 = -[GEOLogMsgEventMapsEngagement initWithJSON:](v315, "initWithJSON:", v314);
    else
      v316 = -[GEOLogMsgEventMapsEngagement initWithDictionary:](v315, "initWithDictionary:", v314);
    v317 = (void *)v316;
    objc_msgSend(a1, "setMapsEngagement:", v316);

  }
  if (a3)
    v318 = CFSTR("usageEventTime");
  else
    v318 = CFSTR("usage_event_time");
  objc_msgSend(v5, "objectForKeyedSubscript:", v318);
  v319 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v319, "doubleValue");
    objc_msgSend(a1, "setUsageEventTime:");
  }

  a1 = a1;
LABEL_637:

  return a1;
}

- (GEOLogMsgEvent)initWithJSON:(id)a3
{
  return (GEOLogMsgEvent *)-[GEOLogMsgEvent _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_975;
    else
      v8 = (int *)&readAll__nonRecursiveTag_976;
    GEOLogMsgEventReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEOLogMsgEventCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgEventIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgEventReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  PBDataReader *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOLogMsgEventIsDirty((uint64_t)self) & 1) == 0)
  {
    v10 = self->_reader;
    objc_sync_enter(v10);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v11);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v10);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOLogMsgEvent readAll:](self, "readAll:", 0);
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v6 = self->_logMsgStates;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v13;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v6);
          PBDataWriterWriteSubmessage();
          ++v9;
        }
        while (v7 != v9);
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

    if (self->_analyticTag)
      PBDataWriterWriteSubmessage();
    if (self->_mapsEnvironment)
      PBDataWriterWriteStringField();
    if ((*(_BYTE *)&self->_flags & 2) != 0)
      PBDataWriterWriteInt32Field();
    if (self->_userActionEvent)
      PBDataWriterWriteSubmessage();
    if (self->_stateTimingEvent)
      PBDataWriterWriteSubmessage();
    if (self->_tileSetStateEvent)
      PBDataWriterWriteSubmessage();
    if (self->_placeDataCacheEvent)
      PBDataWriterWriteSubmessage();
    if (self->_networkEvent)
      PBDataWriterWriteSubmessage();
    if (self->_directionsEvent)
      PBDataWriterWriteSubmessage();
    if (self->_transitAppLaunchEvent)
      PBDataWriterWriteSubmessage();
    if (self->_timeToLeaveHypothesisEvent)
      PBDataWriterWriteSubmessage();
    if (self->_timeToLeaveInitialTravelTimeEvent)
      PBDataWriterWriteSubmessage();
    if (self->_mapsWidgetsInteractionSession)
      PBDataWriterWriteSubmessage();
    if (self->_listInteractionSession)
      PBDataWriterWriteSubmessage();
    if (self->_refineSearchSession)
      PBDataWriterWriteSubmessage();
    if (self->_proactiveSuggestionInteractionSessionEvent)
      PBDataWriterWriteSubmessage();
    if (self->_mapLaunchEvent)
      PBDataWriterWriteSubmessage();
    if (self->_rideBookingSession)
      PBDataWriterWriteSubmessage();
    if (self->_rideBookedSession)
      PBDataWriterWriteSubmessage();
    if (self->_tableBookingSession)
      PBDataWriterWriteSubmessage();
    if (self->_tableBookedSession)
      PBDataWriterWriteSubmessage();
    if (self->_fullNavTrace)
      PBDataWriterWriteSubmessage();
    if (self->_telemetric)
      PBDataWriterWriteSubmessage();
    if (self->_clientAcSuggestions)
      PBDataWriterWriteSubmessage();
    if (self->_realtimeTrafficProbeCollection)
      PBDataWriterWriteSubmessage();
    if (self->_batchTrafficProbeCollection)
      PBDataWriterWriteSubmessage();
    if (self->_commuteWindow)
      PBDataWriterWriteSubmessage();
    if (self->_wifiConnectionQualityProbeEvent)
      PBDataWriterWriteSubmessage();
    if (self->_parkedCar)
      PBDataWriterWriteSubmessage();
    if (self->_tileCacheAnalytic)
      PBDataWriterWriteSubmessage();
    if (self->_gridDuration)
      PBDataWriterWriteSubmessage();
    if (self->_displayAnalytic)
      PBDataWriterWriteSubmessage();
    if (self->_throttleEvent)
      PBDataWriterWriteSubmessage();
    if (self->_mapKitCounts)
      PBDataWriterWriteSubmessage();
    if (self->_predExTrainingData)
      PBDataWriterWriteSubmessage();
    if (self->_marcoLiteUsage)
      PBDataWriterWriteSubmessage();
    if (self->_tripDepartureFeedback)
      PBDataWriterWriteSubmessage();
    if (self->_directionsRequestDetails)
      PBDataWriterWriteSubmessage();
    if (self->_evRoutingVehicleDetails)
      PBDataWriterWriteSubmessage();
    if (self->_evTrip)
      PBDataWriterWriteSubmessage();
    if (self->_curatedCollectionStats)
      PBDataWriterWriteSubmessage();
    if (self->_curatedCollectionUsage)
      PBDataWriterWriteSubmessage();
    if (self->_mapsDeviceSettings)
      PBDataWriterWriteSubmessage();
    if (self->_hardStop)
      PBDataWriterWriteSubmessage();
    if (self->_vlfUsage)
      PBDataWriterWriteSubmessage();
    if (self->_logDiscard)
      PBDataWriterWriteSubmessage();
    if (self->_dailyUseSummary)
      PBDataWriterWriteSubmessage();
    if (self->_pressureData)
      PBDataWriterWriteSubmessage();
    if (self->_poiBusynessData)
      PBDataWriterWriteSubmessage();
    if (self->_periodicSettingsSummary)
      PBDataWriterWriteSubmessage();
    if (self->_thermalPressure)
      PBDataWriterWriteSubmessage();
    if (self->_arSessionUsage)
      PBDataWriterWriteSubmessage();
    if (self->_networkSelectionHarvest)
      PBDataWriterWriteSubmessage();
    if (self->_impressionEvent)
      PBDataWriterWriteSubmessage();
    if (self->_showcaseSuppression)
      PBDataWriterWriteSubmessage();
    if (self->_placeCacheLookup)
      PBDataWriterWriteSubmessage();
    if (self->_deviceSyncStatus)
      PBDataWriterWriteSubmessage();
    if (self->_mapsInteraction)
      PBDataWriterWriteSubmessage();
    if (self->_networkEventSummary)
      PBDataWriterWriteSubmessage();
    if (self->_serviceMetadata)
      PBDataWriterWriteSubmessage();
    if (self->_mapsEngagement)
      PBDataWriterWriteSubmessage();
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      PBDataWriterWriteDoubleField();
  }

}

- (void)clearSensitiveFields:(unint64_t)a3
{
  GEOLogMsgEventClearSensitiveFields((id *)&self->super.super.isa, a3, 1);
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v3 = a3;
  v16 = *MEMORY[0x1E0C80C00];
  -[GEOLogMsgEvent _readArSessionUsage]((uint64_t)self);
  if (-[GEOLogMsgEventARSessionUsage hasGreenTeaWithValue:](self->_arSessionUsage, "hasGreenTeaWithValue:", v3))
    return 1;
  -[GEOLogMsgEvent _readDirectionsEvent]((uint64_t)self);
  if (-[GEOLogMsgEventDirections hasGreenTeaWithValue:](self->_directionsEvent, "hasGreenTeaWithValue:", v3))
    return 1;
  -[GEOLogMsgEvent _readLogMsgStates]((uint64_t)self);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = self->_logMsgStates;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v9), "hasGreenTeaWithValue:", v3, (_QWORD)v11) & 1) != 0)
        {

          return 1;
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v7)
        continue;
      break;
    }
  }

  -[GEOLogMsgEvent _readMapsWidgetsInteractionSession]((uint64_t)self);
  if (-[GEOLogMsgEventMapsWidgetsInteractionSession hasGreenTeaWithValue:](self->_mapsWidgetsInteractionSession, "hasGreenTeaWithValue:", v3))
  {
    return 1;
  }
  -[GEOLogMsgEvent _readParkedCar]((uint64_t)self);
  if (-[GEOLogMsgEventParkedCar hasGreenTeaWithValue:](self->_parkedCar, "hasGreenTeaWithValue:", v3))
    return 1;
  -[GEOLogMsgEvent _readPoiBusynessData]((uint64_t)self);
  if (-[GEOLogMsgEventPOIBusynessData hasGreenTeaWithValue:](self->_poiBusynessData, "hasGreenTeaWithValue:", v3))
    return 1;
  -[GEOLogMsgEvent _readPredExTrainingData]((uint64_t)self);
  if (-[GEOLogMsgEventPredExTrainingData hasGreenTeaWithValue:](self->_predExTrainingData, "hasGreenTeaWithValue:", v3))
    return 1;
  -[GEOLogMsgEvent _readRideBookingSession]((uint64_t)self);
  if (-[GEOLogMsgEventRideBookingSession hasGreenTeaWithValue:](self->_rideBookingSession, "hasGreenTeaWithValue:", v3))
    return 1;
  -[GEOLogMsgEvent _readTransitAppLaunchEvent]((uint64_t)self);
  if (-[GEOLogMsgEventTransitAppLaunch hasGreenTeaWithValue:](self->_transitAppLaunchEvent, "hasGreenTeaWithValue:", v3))
  {
    return 1;
  }
  -[GEOLogMsgEvent _readVlfUsage]((uint64_t)self);
  if (-[GEOLogMsgEventVLFUsage hasGreenTeaWithValue:](self->_vlfUsage, "hasGreenTeaWithValue:", v3))
    return 1;
  -[GEOLogMsgEvent _readWifiConnectionQualityProbeEvent]((uint64_t)self);
  return -[GEOLogMsgEventWifiConnectionQualityProbe hasGreenTeaWithValue:](self->_wifiConnectionQualityProbeEvent, "hasGreenTeaWithValue:", v3);
}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  id *v8;
  id *v9;

  v9 = (id *)a3;
  -[GEOLogMsgEvent readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v9 + 1, self->_reader);
  *((_DWORD *)v9 + 128) = self->_readerMarkPos;
  *((_DWORD *)v9 + 129) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (-[GEOLogMsgEvent logMsgStatesCount](self, "logMsgStatesCount"))
  {
    objc_msgSend(v9, "clearLogMsgStates");
    v4 = -[GEOLogMsgEvent logMsgStatesCount](self, "logMsgStatesCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[GEOLogMsgEvent logMsgStateAtIndex:](self, "logMsgStateAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addLogMsgState:", v7);

      }
    }
  }
  if (self->_analyticTag)
    objc_msgSend(v9, "setAnalyticTag:");
  v8 = v9;
  if (self->_mapsEnvironment)
  {
    objc_msgSend(v9, "setMapsEnvironment:");
    v8 = v9;
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    *((_DWORD *)v8 + 131) = self->_eventType;
    v8[66] = (id)((unint64_t)v8[66] | 2);
  }
  if (self->_userActionEvent)
  {
    objc_msgSend(v9, "setUserActionEvent:");
    v8 = v9;
  }
  if (self->_stateTimingEvent)
  {
    objc_msgSend(v9, "setStateTimingEvent:");
    v8 = v9;
  }
  if (self->_tileSetStateEvent)
  {
    objc_msgSend(v9, "setTileSetStateEvent:");
    v8 = v9;
  }
  if (self->_placeDataCacheEvent)
  {
    objc_msgSend(v9, "setPlaceDataCacheEvent:");
    v8 = v9;
  }
  if (self->_networkEvent)
  {
    objc_msgSend(v9, "setNetworkEvent:");
    v8 = v9;
  }
  if (self->_directionsEvent)
  {
    objc_msgSend(v9, "setDirectionsEvent:");
    v8 = v9;
  }
  if (self->_transitAppLaunchEvent)
  {
    objc_msgSend(v9, "setTransitAppLaunchEvent:");
    v8 = v9;
  }
  if (self->_timeToLeaveHypothesisEvent)
  {
    objc_msgSend(v9, "setTimeToLeaveHypothesisEvent:");
    v8 = v9;
  }
  if (self->_timeToLeaveInitialTravelTimeEvent)
  {
    objc_msgSend(v9, "setTimeToLeaveInitialTravelTimeEvent:");
    v8 = v9;
  }
  if (self->_mapsWidgetsInteractionSession)
  {
    objc_msgSend(v9, "setMapsWidgetsInteractionSession:");
    v8 = v9;
  }
  if (self->_listInteractionSession)
  {
    objc_msgSend(v9, "setListInteractionSession:");
    v8 = v9;
  }
  if (self->_refineSearchSession)
  {
    objc_msgSend(v9, "setRefineSearchSession:");
    v8 = v9;
  }
  if (self->_proactiveSuggestionInteractionSessionEvent)
  {
    objc_msgSend(v9, "setProactiveSuggestionInteractionSessionEvent:");
    v8 = v9;
  }
  if (self->_mapLaunchEvent)
  {
    objc_msgSend(v9, "setMapLaunchEvent:");
    v8 = v9;
  }
  if (self->_rideBookingSession)
  {
    objc_msgSend(v9, "setRideBookingSession:");
    v8 = v9;
  }
  if (self->_rideBookedSession)
  {
    objc_msgSend(v9, "setRideBookedSession:");
    v8 = v9;
  }
  if (self->_tableBookingSession)
  {
    objc_msgSend(v9, "setTableBookingSession:");
    v8 = v9;
  }
  if (self->_tableBookedSession)
  {
    objc_msgSend(v9, "setTableBookedSession:");
    v8 = v9;
  }
  if (self->_fullNavTrace)
  {
    objc_msgSend(v9, "setFullNavTrace:");
    v8 = v9;
  }
  if (self->_telemetric)
  {
    objc_msgSend(v9, "setTelemetric:");
    v8 = v9;
  }
  if (self->_clientAcSuggestions)
  {
    objc_msgSend(v9, "setClientAcSuggestions:");
    v8 = v9;
  }
  if (self->_realtimeTrafficProbeCollection)
  {
    objc_msgSend(v9, "setRealtimeTrafficProbeCollection:");
    v8 = v9;
  }
  if (self->_batchTrafficProbeCollection)
  {
    objc_msgSend(v9, "setBatchTrafficProbeCollection:");
    v8 = v9;
  }
  if (self->_commuteWindow)
  {
    objc_msgSend(v9, "setCommuteWindow:");
    v8 = v9;
  }
  if (self->_wifiConnectionQualityProbeEvent)
  {
    objc_msgSend(v9, "setWifiConnectionQualityProbeEvent:");
    v8 = v9;
  }
  if (self->_parkedCar)
  {
    objc_msgSend(v9, "setParkedCar:");
    v8 = v9;
  }
  if (self->_tileCacheAnalytic)
  {
    objc_msgSend(v9, "setTileCacheAnalytic:");
    v8 = v9;
  }
  if (self->_gridDuration)
  {
    objc_msgSend(v9, "setGridDuration:");
    v8 = v9;
  }
  if (self->_displayAnalytic)
  {
    objc_msgSend(v9, "setDisplayAnalytic:");
    v8 = v9;
  }
  if (self->_throttleEvent)
  {
    objc_msgSend(v9, "setThrottleEvent:");
    v8 = v9;
  }
  if (self->_mapKitCounts)
  {
    objc_msgSend(v9, "setMapKitCounts:");
    v8 = v9;
  }
  if (self->_predExTrainingData)
  {
    objc_msgSend(v9, "setPredExTrainingData:");
    v8 = v9;
  }
  if (self->_marcoLiteUsage)
  {
    objc_msgSend(v9, "setMarcoLiteUsage:");
    v8 = v9;
  }
  if (self->_tripDepartureFeedback)
  {
    objc_msgSend(v9, "setTripDepartureFeedback:");
    v8 = v9;
  }
  if (self->_directionsRequestDetails)
  {
    objc_msgSend(v9, "setDirectionsRequestDetails:");
    v8 = v9;
  }
  if (self->_evRoutingVehicleDetails)
  {
    objc_msgSend(v9, "setEvRoutingVehicleDetails:");
    v8 = v9;
  }
  if (self->_evTrip)
  {
    objc_msgSend(v9, "setEvTrip:");
    v8 = v9;
  }
  if (self->_curatedCollectionStats)
  {
    objc_msgSend(v9, "setCuratedCollectionStats:");
    v8 = v9;
  }
  if (self->_curatedCollectionUsage)
  {
    objc_msgSend(v9, "setCuratedCollectionUsage:");
    v8 = v9;
  }
  if (self->_mapsDeviceSettings)
  {
    objc_msgSend(v9, "setMapsDeviceSettings:");
    v8 = v9;
  }
  if (self->_hardStop)
  {
    objc_msgSend(v9, "setHardStop:");
    v8 = v9;
  }
  if (self->_vlfUsage)
  {
    objc_msgSend(v9, "setVlfUsage:");
    v8 = v9;
  }
  if (self->_logDiscard)
  {
    objc_msgSend(v9, "setLogDiscard:");
    v8 = v9;
  }
  if (self->_dailyUseSummary)
  {
    objc_msgSend(v9, "setDailyUseSummary:");
    v8 = v9;
  }
  if (self->_pressureData)
  {
    objc_msgSend(v9, "setPressureData:");
    v8 = v9;
  }
  if (self->_poiBusynessData)
  {
    objc_msgSend(v9, "setPoiBusynessData:");
    v8 = v9;
  }
  if (self->_periodicSettingsSummary)
  {
    objc_msgSend(v9, "setPeriodicSettingsSummary:");
    v8 = v9;
  }
  if (self->_thermalPressure)
  {
    objc_msgSend(v9, "setThermalPressure:");
    v8 = v9;
  }
  if (self->_arSessionUsage)
  {
    objc_msgSend(v9, "setArSessionUsage:");
    v8 = v9;
  }
  if (self->_networkSelectionHarvest)
  {
    objc_msgSend(v9, "setNetworkSelectionHarvest:");
    v8 = v9;
  }
  if (self->_impressionEvent)
  {
    objc_msgSend(v9, "setImpressionEvent:");
    v8 = v9;
  }
  if (self->_showcaseSuppression)
  {
    objc_msgSend(v9, "setShowcaseSuppression:");
    v8 = v9;
  }
  if (self->_placeCacheLookup)
  {
    objc_msgSend(v9, "setPlaceCacheLookup:");
    v8 = v9;
  }
  if (self->_deviceSyncStatus)
  {
    objc_msgSend(v9, "setDeviceSyncStatus:");
    v8 = v9;
  }
  if (self->_mapsInteraction)
  {
    objc_msgSend(v9, "setMapsInteraction:");
    v8 = v9;
  }
  if (self->_networkEventSummary)
  {
    objc_msgSend(v9, "setNetworkEventSummary:");
    v8 = v9;
  }
  if (self->_serviceMetadata)
  {
    objc_msgSend(v9, "setServiceMetadata:");
    v8 = v9;
  }
  if (self->_mapsEngagement)
  {
    objc_msgSend(v9, "setMapsEngagement:");
    v8 = v9;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    v8[60] = *(id *)&self->_usageEventTime;
    v8[66] = (id)((unint64_t)v8[66] | 1);
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
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  id v34;
  void *v35;
  id v36;
  void *v37;
  id v38;
  void *v39;
  id v40;
  void *v41;
  id v42;
  void *v43;
  id v44;
  void *v45;
  id v46;
  void *v47;
  id v48;
  void *v49;
  id v50;
  void *v51;
  id v52;
  void *v53;
  id v54;
  void *v55;
  id v56;
  void *v57;
  id v58;
  void *v59;
  id v60;
  void *v61;
  id v62;
  void *v63;
  id v64;
  void *v65;
  id v66;
  void *v67;
  id v68;
  void *v69;
  id v70;
  void *v71;
  id v72;
  void *v73;
  id v74;
  void *v75;
  id v76;
  void *v77;
  id v78;
  void *v79;
  id v80;
  void *v81;
  id v82;
  void *v83;
  id v84;
  void *v85;
  id v86;
  void *v87;
  id v88;
  void *v89;
  id v90;
  void *v91;
  id v92;
  void *v93;
  id v94;
  void *v95;
  id v96;
  void *v97;
  id v98;
  void *v99;
  id v100;
  void *v101;
  id v102;
  void *v103;
  id v104;
  void *v105;
  id v106;
  void *v107;
  id v108;
  void *v109;
  id v110;
  void *v111;
  id v112;
  void *v113;
  id v114;
  void *v115;
  id v116;
  void *v117;
  id v118;
  void *v119;
  id v120;
  void *v121;
  id v122;
  void *v123;
  id v124;
  void *v125;
  id v126;
  void *v127;
  id v128;
  void *v129;
  id v130;
  void *v131;
  id v132;
  void *v133;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  _BYTE v139[128];
  uint64_t v140;

  v140 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_QWORD *)&self->_flags & 0x8000000000000000) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOLogMsgEventReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOLogMsgEvent readAll:](self, "readAll:", 0);
  v137 = 0u;
  v138 = 0u;
  v135 = 0u;
  v136 = 0u;
  v9 = self->_logMsgStates;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v135, v139, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v136;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v136 != v11)
          objc_enumerationMutation(v9);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v135 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v135);
        objc_msgSend((id)v5, "addLogMsgState:", v13);

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v135, v139, 16);
    }
    while (v10);
  }

  v14 = -[GEOLogMsgEventId copyWithZone:](self->_analyticTag, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v14;

  v16 = -[NSString copyWithZone:](self->_mapsEnvironment, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 216);
  *(_QWORD *)(v5 + 216) = v16;

  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 524) = self->_eventType;
    *(_QWORD *)(v5 + 528) |= 2uLL;
  }
  v18 = -[GEOLogMsgEventUserAction copyWithZone:](self->_userActionEvent, "copyWithZone:", a3, (_QWORD)v135);
  v19 = *(void **)(v5 + 488);
  *(_QWORD *)(v5 + 488) = v18;

  v20 = -[GEOLogMsgEventStateTiming copyWithZone:](self->_stateTimingEvent, "copyWithZone:", a3);
  v21 = *(void **)(v5 + 384);
  *(_QWORD *)(v5 + 384) = v20;

  v22 = -[GEOLogMsgEventTileSetState copyWithZone:](self->_tileSetStateEvent, "copyWithZone:", a3);
  v23 = *(void **)(v5 + 440);
  *(_QWORD *)(v5 + 440) = v22;

  v24 = -[GEOLogMsgEventPlaceDataCache copyWithZone:](self->_placeDataCacheEvent, "copyWithZone:", a3);
  v25 = *(void **)(v5 + 296);
  *(_QWORD *)(v5 + 296) = v24;

  v26 = -[GEOLogMsgEventNetwork copyWithZone:](self->_networkEvent, "copyWithZone:", a3);
  v27 = *(void **)(v5 + 256);
  *(_QWORD *)(v5 + 256) = v26;

  v28 = -[GEOLogMsgEventDirections copyWithZone:](self->_directionsEvent, "copyWithZone:", a3);
  v29 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v28;

  v30 = -[GEOLogMsgEventTransitAppLaunch copyWithZone:](self->_transitAppLaunchEvent, "copyWithZone:", a3);
  v31 = *(void **)(v5 + 464);
  *(_QWORD *)(v5 + 464) = v30;

  v32 = -[GEOLogMsgEventTimeToLeaveHypothesis copyWithZone:](self->_timeToLeaveHypothesisEvent, "copyWithZone:", a3);
  v33 = *(void **)(v5 + 448);
  *(_QWORD *)(v5 + 448) = v32;

  v34 = -[GEOLogMsgEventTimeToLeaveInitialTravelTime copyWithZone:](self->_timeToLeaveInitialTravelTimeEvent, "copyWithZone:", a3);
  v35 = *(void **)(v5 + 456);
  *(_QWORD *)(v5 + 456) = v34;

  v36 = -[GEOLogMsgEventMapsWidgetsInteractionSession copyWithZone:](self->_mapsWidgetsInteractionSession, "copyWithZone:", a3);
  v37 = *(void **)(v5 + 232);
  *(_QWORD *)(v5 + 232) = v36;

  v38 = -[GEOLogMsgEventListInteractionSession copyWithZone:](self->_listInteractionSession, "copyWithZone:", a3);
  v39 = *(void **)(v5 + 160);
  *(_QWORD *)(v5 + 160) = v38;

  v40 = -[GEOLogMsgEventRefineSearchSession copyWithZone:](self->_refineSearchSession, "copyWithZone:", a3);
  v41 = *(void **)(v5 + 344);
  *(_QWORD *)(v5 + 344) = v40;

  v42 = -[GEOLogMsgEventProactiveSuggestionInteractionSession copyWithZone:](self->_proactiveSuggestionInteractionSessionEvent, "copyWithZone:", a3);
  v43 = *(void **)(v5 + 328);
  *(_QWORD *)(v5 + 328) = v42;

  v44 = -[GEOLogMsgEventMapLaunch copyWithZone:](self->_mapLaunchEvent, "copyWithZone:", a3);
  v45 = *(void **)(v5 + 192);
  *(_QWORD *)(v5 + 192) = v44;

  v46 = -[GEOLogMsgEventRideBookingSession copyWithZone:](self->_rideBookingSession, "copyWithZone:", a3);
  v47 = *(void **)(v5 + 360);
  *(_QWORD *)(v5 + 360) = v46;

  v48 = -[GEOLogMsgEventRideBookedSession copyWithZone:](self->_rideBookedSession, "copyWithZone:", a3);
  v49 = *(void **)(v5 + 352);
  *(_QWORD *)(v5 + 352) = v48;

  v50 = -[GEOLogMsgEventTableBookingSession copyWithZone:](self->_tableBookingSession, "copyWithZone:", a3);
  v51 = *(void **)(v5 + 400);
  *(_QWORD *)(v5 + 400) = v50;

  v52 = -[GEOLogMsgEventTableBookedSession copyWithZone:](self->_tableBookedSession, "copyWithZone:", a3);
  v53 = *(void **)(v5 + 392);
  *(_QWORD *)(v5 + 392) = v52;

  v54 = -[GEOLogMsgEventFullNavTrace copyWithZone:](self->_fullNavTrace, "copyWithZone:", a3);
  v55 = *(void **)(v5 + 128);
  *(_QWORD *)(v5 + 128) = v54;

  v56 = -[GEOLogMsgEventTelemetric copyWithZone:](self->_telemetric, "copyWithZone:", a3);
  v57 = *(void **)(v5 + 408);
  *(_QWORD *)(v5 + 408) = v56;

  v58 = -[GEOLogMsgEventClientACSuggestions copyWithZone:](self->_clientAcSuggestions, "copyWithZone:", a3);
  v59 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v58;

  v60 = -[GEOLogMsgEventRealtimeTrafficProbe copyWithZone:](self->_realtimeTrafficProbeCollection, "copyWithZone:", a3);
  v61 = *(void **)(v5 + 336);
  *(_QWORD *)(v5 + 336) = v60;

  v62 = -[GEOLogMsgEventBatchTrafficProbe copyWithZone:](self->_batchTrafficProbeCollection, "copyWithZone:", a3);
  v63 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v62;

  v64 = -[GEOLogMsgEventCommuteWindow copyWithZone:](self->_commuteWindow, "copyWithZone:", a3);
  v65 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v64;

  v66 = -[GEOLogMsgEventWifiConnectionQualityProbe copyWithZone:](self->_wifiConnectionQualityProbeEvent, "copyWithZone:", a3);
  v67 = *(void **)(v5 + 504);
  *(_QWORD *)(v5 + 504) = v66;

  v68 = -[GEOLogMsgEventParkedCar copyWithZone:](self->_parkedCar, "copyWithZone:", a3);
  v69 = *(void **)(v5 + 272);
  *(_QWORD *)(v5 + 272) = v68;

  v70 = -[GEOLogMsgEventTileCacheAnalytic copyWithZone:](self->_tileCacheAnalytic, "copyWithZone:", a3);
  v71 = *(void **)(v5 + 432);
  *(_QWORD *)(v5 + 432) = v70;

  v72 = -[GEOLogMsgEventGridDuration copyWithZone:](self->_gridDuration, "copyWithZone:", a3);
  v73 = *(void **)(v5 + 136);
  *(_QWORD *)(v5 + 136) = v72;

  v74 = -[GEOLogMsgEventDisplayAnalytic copyWithZone:](self->_displayAnalytic, "copyWithZone:", a3);
  v75 = *(void **)(v5 + 104);
  *(_QWORD *)(v5 + 104) = v74;

  v76 = -[GEOLogMsgEventThrottle copyWithZone:](self->_throttleEvent, "copyWithZone:", a3);
  v77 = *(void **)(v5 + 424);
  *(_QWORD *)(v5 + 424) = v76;

  v78 = -[GEOLogMsgEventMapKitCounts copyWithZone:](self->_mapKitCounts, "copyWithZone:", a3);
  v79 = *(void **)(v5 + 184);
  *(_QWORD *)(v5 + 184) = v78;

  v80 = -[GEOLogMsgEventPredExTrainingData copyWithZone:](self->_predExTrainingData, "copyWithZone:", a3);
  v81 = *(void **)(v5 + 312);
  *(_QWORD *)(v5 + 312) = v80;

  v82 = -[GEOLogMsgEventMarcoLiteUsage copyWithZone:](self->_marcoLiteUsage, "copyWithZone:", a3);
  v83 = *(void **)(v5 + 240);
  *(_QWORD *)(v5 + 240) = v82;

  v84 = -[GEOLogMsgEventTripDepartureFeedback copyWithZone:](self->_tripDepartureFeedback, "copyWithZone:", a3);
  v85 = *(void **)(v5 + 472);
  *(_QWORD *)(v5 + 472) = v84;

  v86 = -[GEOLogMsgEventDirectionsRequestDetails copyWithZone:](self->_directionsRequestDetails, "copyWithZone:", a3);
  v87 = *(void **)(v5 + 96);
  *(_QWORD *)(v5 + 96) = v86;

  v88 = -[GEOLogMsgEventEVRoutingVehicleDetails copyWithZone:](self->_evRoutingVehicleDetails, "copyWithZone:", a3);
  v89 = *(void **)(v5 + 112);
  *(_QWORD *)(v5 + 112) = v88;

  v90 = -[GEOLogMsgEventEVTrip copyWithZone:](self->_evTrip, "copyWithZone:", a3);
  v91 = *(void **)(v5 + 120);
  *(_QWORD *)(v5 + 120) = v90;

  v92 = -[GEOLogMsgEventCuratedCollectionStats copyWithZone:](self->_curatedCollectionStats, "copyWithZone:", a3);
  v93 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v92;

  v94 = -[GEOLogMsgEventCuratedCollectionUsage copyWithZone:](self->_curatedCollectionUsage, "copyWithZone:", a3);
  v95 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v94;

  v96 = -[GEOLogMsgEventMapsDeviceSettings copyWithZone:](self->_mapsDeviceSettings, "copyWithZone:", a3);
  v97 = *(void **)(v5 + 200);
  *(_QWORD *)(v5 + 200) = v96;

  v98 = -[GEOLogMsgEventHardStop copyWithZone:](self->_hardStop, "copyWithZone:", a3);
  v99 = *(void **)(v5 + 144);
  *(_QWORD *)(v5 + 144) = v98;

  v100 = -[GEOLogMsgEventVLFUsage copyWithZone:](self->_vlfUsage, "copyWithZone:", a3);
  v101 = *(void **)(v5 + 496);
  *(_QWORD *)(v5 + 496) = v100;

  v102 = -[GEOLogMsgEventLogDiscard copyWithZone:](self->_logDiscard, "copyWithZone:", a3);
  v103 = *(void **)(v5 + 168);
  *(_QWORD *)(v5 + 168) = v102;

  v104 = -[GEOLogMsgEventDailyUseSummary copyWithZone:](self->_dailyUseSummary, "copyWithZone:", a3);
  v105 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v104;

  v106 = -[GEOLogMsgEventPressureData copyWithZone:](self->_pressureData, "copyWithZone:", a3);
  v107 = *(void **)(v5 + 320);
  *(_QWORD *)(v5 + 320) = v106;

  v108 = -[GEOLogMsgEventPOIBusynessData copyWithZone:](self->_poiBusynessData, "copyWithZone:", a3);
  v109 = *(void **)(v5 + 304);
  *(_QWORD *)(v5 + 304) = v108;

  v110 = -[GEOLogMsgEventPeriodicSettingsSummary copyWithZone:](self->_periodicSettingsSummary, "copyWithZone:", a3);
  v111 = *(void **)(v5 + 280);
  *(_QWORD *)(v5 + 280) = v110;

  v112 = -[GEOLogMsgEventThermalPressure copyWithZone:](self->_thermalPressure, "copyWithZone:", a3);
  v113 = *(void **)(v5 + 416);
  *(_QWORD *)(v5 + 416) = v112;

  v114 = -[GEOLogMsgEventARSessionUsage copyWithZone:](self->_arSessionUsage, "copyWithZone:", a3);
  v115 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v114;

  v116 = -[GEOLogMsgEventNetworkSelectionHarvest copyWithZone:](self->_networkSelectionHarvest, "copyWithZone:", a3);
  v117 = *(void **)(v5 + 264);
  *(_QWORD *)(v5 + 264) = v116;

  v118 = -[GEOLogMsgEventImpressionEvent copyWithZone:](self->_impressionEvent, "copyWithZone:", a3);
  v119 = *(void **)(v5 + 152);
  *(_QWORD *)(v5 + 152) = v118;

  v120 = -[GEOLogMsgEventShowcaseSuppression copyWithZone:](self->_showcaseSuppression, "copyWithZone:", a3);
  v121 = *(void **)(v5 + 376);
  *(_QWORD *)(v5 + 376) = v120;

  v122 = -[GEOLogMsgEventPlaceCacheLookup copyWithZone:](self->_placeCacheLookup, "copyWithZone:", a3);
  v123 = *(void **)(v5 + 288);
  *(_QWORD *)(v5 + 288) = v122;

  v124 = -[GEOLogMsgEventDeviceSyncStatus copyWithZone:](self->_deviceSyncStatus, "copyWithZone:", a3);
  v125 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v124;

  v126 = -[GEOLogMsgEventMapsInteraction copyWithZone:](self->_mapsInteraction, "copyWithZone:", a3);
  v127 = *(void **)(v5 + 224);
  *(_QWORD *)(v5 + 224) = v126;

  v128 = -[GEOLogMsgEventNetworkEventSummary copyWithZone:](self->_networkEventSummary, "copyWithZone:", a3);
  v129 = *(void **)(v5 + 248);
  *(_QWORD *)(v5 + 248) = v128;

  v130 = -[GEOLogMsgEventServiceMetadata copyWithZone:](self->_serviceMetadata, "copyWithZone:", a3);
  v131 = *(void **)(v5 + 368);
  *(_QWORD *)(v5 + 368) = v130;

  v132 = -[GEOLogMsgEventMapsEngagement copyWithZone:](self->_mapsEngagement, "copyWithZone:", a3);
  v133 = *(void **)(v5 + 208);
  *(_QWORD *)(v5 + 208) = v132;

  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(double *)(v5 + 480) = self->_usageEventTime;
    *(_QWORD *)(v5 + 528) |= 1uLL;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSMutableArray *logMsgStates;
  GEOLogMsgEventId *analyticTag;
  NSString *mapsEnvironment;
  uint64_t v8;
  GEOLogMsgEventUserAction *userActionEvent;
  GEOLogMsgEventStateTiming *stateTimingEvent;
  GEOLogMsgEventTileSetState *tileSetStateEvent;
  GEOLogMsgEventPlaceDataCache *placeDataCacheEvent;
  GEOLogMsgEventNetwork *networkEvent;
  GEOLogMsgEventDirections *directionsEvent;
  GEOLogMsgEventTransitAppLaunch *transitAppLaunchEvent;
  GEOLogMsgEventTimeToLeaveHypothesis *timeToLeaveHypothesisEvent;
  GEOLogMsgEventTimeToLeaveInitialTravelTime *timeToLeaveInitialTravelTimeEvent;
  GEOLogMsgEventMapsWidgetsInteractionSession *mapsWidgetsInteractionSession;
  GEOLogMsgEventListInteractionSession *listInteractionSession;
  GEOLogMsgEventRefineSearchSession *refineSearchSession;
  GEOLogMsgEventProactiveSuggestionInteractionSession *proactiveSuggestionInteractionSessionEvent;
  GEOLogMsgEventMapLaunch *mapLaunchEvent;
  GEOLogMsgEventRideBookingSession *rideBookingSession;
  GEOLogMsgEventRideBookedSession *rideBookedSession;
  GEOLogMsgEventTableBookingSession *tableBookingSession;
  GEOLogMsgEventTableBookedSession *tableBookedSession;
  GEOLogMsgEventFullNavTrace *fullNavTrace;
  GEOLogMsgEventTelemetric *telemetric;
  GEOLogMsgEventClientACSuggestions *clientAcSuggestions;
  GEOLogMsgEventRealtimeTrafficProbe *realtimeTrafficProbeCollection;
  GEOLogMsgEventBatchTrafficProbe *batchTrafficProbeCollection;
  GEOLogMsgEventCommuteWindow *commuteWindow;
  GEOLogMsgEventWifiConnectionQualityProbe *wifiConnectionQualityProbeEvent;
  GEOLogMsgEventParkedCar *parkedCar;
  GEOLogMsgEventTileCacheAnalytic *tileCacheAnalytic;
  GEOLogMsgEventGridDuration *gridDuration;
  GEOLogMsgEventDisplayAnalytic *displayAnalytic;
  GEOLogMsgEventThrottle *throttleEvent;
  GEOLogMsgEventMapKitCounts *mapKitCounts;
  GEOLogMsgEventPredExTrainingData *predExTrainingData;
  GEOLogMsgEventMarcoLiteUsage *marcoLiteUsage;
  GEOLogMsgEventTripDepartureFeedback *tripDepartureFeedback;
  GEOLogMsgEventDirectionsRequestDetails *directionsRequestDetails;
  GEOLogMsgEventEVRoutingVehicleDetails *evRoutingVehicleDetails;
  GEOLogMsgEventEVTrip *evTrip;
  GEOLogMsgEventCuratedCollectionStats *curatedCollectionStats;
  GEOLogMsgEventCuratedCollectionUsage *curatedCollectionUsage;
  GEOLogMsgEventMapsDeviceSettings *mapsDeviceSettings;
  GEOLogMsgEventHardStop *hardStop;
  GEOLogMsgEventVLFUsage *vlfUsage;
  GEOLogMsgEventLogDiscard *logDiscard;
  GEOLogMsgEventDailyUseSummary *dailyUseSummary;
  GEOLogMsgEventPressureData *pressureData;
  GEOLogMsgEventPOIBusynessData *poiBusynessData;
  GEOLogMsgEventPeriodicSettingsSummary *periodicSettingsSummary;
  GEOLogMsgEventThermalPressure *thermalPressure;
  GEOLogMsgEventARSessionUsage *arSessionUsage;
  GEOLogMsgEventNetworkSelectionHarvest *networkSelectionHarvest;
  GEOLogMsgEventImpressionEvent *impressionEvent;
  GEOLogMsgEventShowcaseSuppression *showcaseSuppression;
  GEOLogMsgEventPlaceCacheLookup *placeCacheLookup;
  GEOLogMsgEventDeviceSyncStatus *deviceSyncStatus;
  GEOLogMsgEventMapsInteraction *mapsInteraction;
  GEOLogMsgEventNetworkEventSummary *networkEventSummary;
  GEOLogMsgEventServiceMetadata *serviceMetadata;
  GEOLogMsgEventMapsEngagement *mapsEngagement;
  BOOL v67;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_134;
  -[GEOLogMsgEvent readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  logMsgStates = self->_logMsgStates;
  if ((unint64_t)logMsgStates | *((_QWORD *)v4 + 22))
  {
    if (!-[NSMutableArray isEqual:](logMsgStates, "isEqual:"))
      goto LABEL_134;
  }
  analyticTag = self->_analyticTag;
  if ((unint64_t)analyticTag | *((_QWORD *)v4 + 2))
  {
    if (!-[GEOLogMsgEventId isEqual:](analyticTag, "isEqual:"))
      goto LABEL_134;
  }
  mapsEnvironment = self->_mapsEnvironment;
  if ((unint64_t)mapsEnvironment | *((_QWORD *)v4 + 27))
  {
    if (!-[NSString isEqual:](mapsEnvironment, "isEqual:"))
      goto LABEL_134;
  }
  v8 = *((_QWORD *)v4 + 66);
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((v8 & 2) == 0 || self->_eventType != *((_DWORD *)v4 + 131))
      goto LABEL_134;
  }
  else if ((v8 & 2) != 0)
  {
LABEL_134:
    v67 = 0;
    goto LABEL_135;
  }
  userActionEvent = self->_userActionEvent;
  if ((unint64_t)userActionEvent | *((_QWORD *)v4 + 61)
    && !-[GEOLogMsgEventUserAction isEqual:](userActionEvent, "isEqual:"))
  {
    goto LABEL_134;
  }
  stateTimingEvent = self->_stateTimingEvent;
  if ((unint64_t)stateTimingEvent | *((_QWORD *)v4 + 48))
  {
    if (!-[GEOLogMsgEventStateTiming isEqual:](stateTimingEvent, "isEqual:"))
      goto LABEL_134;
  }
  tileSetStateEvent = self->_tileSetStateEvent;
  if ((unint64_t)tileSetStateEvent | *((_QWORD *)v4 + 55))
  {
    if (!-[GEOLogMsgEventTileSetState isEqual:](tileSetStateEvent, "isEqual:"))
      goto LABEL_134;
  }
  placeDataCacheEvent = self->_placeDataCacheEvent;
  if ((unint64_t)placeDataCacheEvent | *((_QWORD *)v4 + 37))
  {
    if (!-[GEOLogMsgEventPlaceDataCache isEqual:](placeDataCacheEvent, "isEqual:"))
      goto LABEL_134;
  }
  networkEvent = self->_networkEvent;
  if ((unint64_t)networkEvent | *((_QWORD *)v4 + 32))
  {
    if (!-[GEOLogMsgEventNetwork isEqual:](networkEvent, "isEqual:"))
      goto LABEL_134;
  }
  directionsEvent = self->_directionsEvent;
  if ((unint64_t)directionsEvent | *((_QWORD *)v4 + 11))
  {
    if (!-[GEOLogMsgEventDirections isEqual:](directionsEvent, "isEqual:"))
      goto LABEL_134;
  }
  transitAppLaunchEvent = self->_transitAppLaunchEvent;
  if ((unint64_t)transitAppLaunchEvent | *((_QWORD *)v4 + 58))
  {
    if (!-[GEOLogMsgEventTransitAppLaunch isEqual:](transitAppLaunchEvent, "isEqual:"))
      goto LABEL_134;
  }
  timeToLeaveHypothesisEvent = self->_timeToLeaveHypothesisEvent;
  if ((unint64_t)timeToLeaveHypothesisEvent | *((_QWORD *)v4 + 56))
  {
    if (!-[GEOLogMsgEventTimeToLeaveHypothesis isEqual:](timeToLeaveHypothesisEvent, "isEqual:"))
      goto LABEL_134;
  }
  timeToLeaveInitialTravelTimeEvent = self->_timeToLeaveInitialTravelTimeEvent;
  if ((unint64_t)timeToLeaveInitialTravelTimeEvent | *((_QWORD *)v4 + 57))
  {
    if (!-[GEOLogMsgEventTimeToLeaveInitialTravelTime isEqual:](timeToLeaveInitialTravelTimeEvent, "isEqual:"))
      goto LABEL_134;
  }
  mapsWidgetsInteractionSession = self->_mapsWidgetsInteractionSession;
  if ((unint64_t)mapsWidgetsInteractionSession | *((_QWORD *)v4 + 29))
  {
    if (!-[GEOLogMsgEventMapsWidgetsInteractionSession isEqual:](mapsWidgetsInteractionSession, "isEqual:"))
      goto LABEL_134;
  }
  listInteractionSession = self->_listInteractionSession;
  if ((unint64_t)listInteractionSession | *((_QWORD *)v4 + 20))
  {
    if (!-[GEOLogMsgEventListInteractionSession isEqual:](listInteractionSession, "isEqual:"))
      goto LABEL_134;
  }
  refineSearchSession = self->_refineSearchSession;
  if ((unint64_t)refineSearchSession | *((_QWORD *)v4 + 43))
  {
    if (!-[GEOLogMsgEventRefineSearchSession isEqual:](refineSearchSession, "isEqual:"))
      goto LABEL_134;
  }
  proactiveSuggestionInteractionSessionEvent = self->_proactiveSuggestionInteractionSessionEvent;
  if ((unint64_t)proactiveSuggestionInteractionSessionEvent | *((_QWORD *)v4 + 41))
  {
    if (!-[GEOLogMsgEventProactiveSuggestionInteractionSession isEqual:](proactiveSuggestionInteractionSessionEvent, "isEqual:"))goto LABEL_134;
  }
  mapLaunchEvent = self->_mapLaunchEvent;
  if ((unint64_t)mapLaunchEvent | *((_QWORD *)v4 + 24))
  {
    if (!-[GEOLogMsgEventMapLaunch isEqual:](mapLaunchEvent, "isEqual:"))
      goto LABEL_134;
  }
  rideBookingSession = self->_rideBookingSession;
  if ((unint64_t)rideBookingSession | *((_QWORD *)v4 + 45))
  {
    if (!-[GEOLogMsgEventRideBookingSession isEqual:](rideBookingSession, "isEqual:"))
      goto LABEL_134;
  }
  rideBookedSession = self->_rideBookedSession;
  if ((unint64_t)rideBookedSession | *((_QWORD *)v4 + 44))
  {
    if (!-[GEOLogMsgEventRideBookedSession isEqual:](rideBookedSession, "isEqual:"))
      goto LABEL_134;
  }
  tableBookingSession = self->_tableBookingSession;
  if ((unint64_t)tableBookingSession | *((_QWORD *)v4 + 50))
  {
    if (!-[GEOLogMsgEventTableBookingSession isEqual:](tableBookingSession, "isEqual:"))
      goto LABEL_134;
  }
  tableBookedSession = self->_tableBookedSession;
  if ((unint64_t)tableBookedSession | *((_QWORD *)v4 + 49))
  {
    if (!-[GEOLogMsgEventTableBookedSession isEqual:](tableBookedSession, "isEqual:"))
      goto LABEL_134;
  }
  fullNavTrace = self->_fullNavTrace;
  if ((unint64_t)fullNavTrace | *((_QWORD *)v4 + 16))
  {
    if (!-[GEOLogMsgEventFullNavTrace isEqual:](fullNavTrace, "isEqual:"))
      goto LABEL_134;
  }
  telemetric = self->_telemetric;
  if ((unint64_t)telemetric | *((_QWORD *)v4 + 51))
  {
    if (!-[GEOLogMsgEventTelemetric isEqual:](telemetric, "isEqual:"))
      goto LABEL_134;
  }
  clientAcSuggestions = self->_clientAcSuggestions;
  if ((unint64_t)clientAcSuggestions | *((_QWORD *)v4 + 5))
  {
    if (!-[GEOLogMsgEventClientACSuggestions isEqual:](clientAcSuggestions, "isEqual:"))
      goto LABEL_134;
  }
  realtimeTrafficProbeCollection = self->_realtimeTrafficProbeCollection;
  if ((unint64_t)realtimeTrafficProbeCollection | *((_QWORD *)v4 + 42))
  {
    if (!-[GEOLogMsgEventRealtimeTrafficProbe isEqual:](realtimeTrafficProbeCollection, "isEqual:"))
      goto LABEL_134;
  }
  batchTrafficProbeCollection = self->_batchTrafficProbeCollection;
  if ((unint64_t)batchTrafficProbeCollection | *((_QWORD *)v4 + 4))
  {
    if (!-[GEOLogMsgEventBatchTrafficProbe isEqual:](batchTrafficProbeCollection, "isEqual:"))
      goto LABEL_134;
  }
  commuteWindow = self->_commuteWindow;
  if ((unint64_t)commuteWindow | *((_QWORD *)v4 + 6))
  {
    if (!-[GEOLogMsgEventCommuteWindow isEqual:](commuteWindow, "isEqual:"))
      goto LABEL_134;
  }
  wifiConnectionQualityProbeEvent = self->_wifiConnectionQualityProbeEvent;
  if ((unint64_t)wifiConnectionQualityProbeEvent | *((_QWORD *)v4 + 63))
  {
    if (!-[GEOLogMsgEventWifiConnectionQualityProbe isEqual:](wifiConnectionQualityProbeEvent, "isEqual:"))
      goto LABEL_134;
  }
  parkedCar = self->_parkedCar;
  if ((unint64_t)parkedCar | *((_QWORD *)v4 + 34))
  {
    if (!-[GEOLogMsgEventParkedCar isEqual:](parkedCar, "isEqual:"))
      goto LABEL_134;
  }
  tileCacheAnalytic = self->_tileCacheAnalytic;
  if ((unint64_t)tileCacheAnalytic | *((_QWORD *)v4 + 54))
  {
    if (!-[GEOLogMsgEventTileCacheAnalytic isEqual:](tileCacheAnalytic, "isEqual:"))
      goto LABEL_134;
  }
  gridDuration = self->_gridDuration;
  if ((unint64_t)gridDuration | *((_QWORD *)v4 + 17))
  {
    if (!-[GEOLogMsgEventGridDuration isEqual:](gridDuration, "isEqual:"))
      goto LABEL_134;
  }
  displayAnalytic = self->_displayAnalytic;
  if ((unint64_t)displayAnalytic | *((_QWORD *)v4 + 13))
  {
    if (!-[GEOLogMsgEventDisplayAnalytic isEqual:](displayAnalytic, "isEqual:"))
      goto LABEL_134;
  }
  throttleEvent = self->_throttleEvent;
  if ((unint64_t)throttleEvent | *((_QWORD *)v4 + 53))
  {
    if (!-[GEOLogMsgEventThrottle isEqual:](throttleEvent, "isEqual:"))
      goto LABEL_134;
  }
  mapKitCounts = self->_mapKitCounts;
  if ((unint64_t)mapKitCounts | *((_QWORD *)v4 + 23))
  {
    if (!-[GEOLogMsgEventMapKitCounts isEqual:](mapKitCounts, "isEqual:"))
      goto LABEL_134;
  }
  predExTrainingData = self->_predExTrainingData;
  if ((unint64_t)predExTrainingData | *((_QWORD *)v4 + 39))
  {
    if (!-[GEOLogMsgEventPredExTrainingData isEqual:](predExTrainingData, "isEqual:"))
      goto LABEL_134;
  }
  marcoLiteUsage = self->_marcoLiteUsage;
  if ((unint64_t)marcoLiteUsage | *((_QWORD *)v4 + 30))
  {
    if (!-[GEOLogMsgEventMarcoLiteUsage isEqual:](marcoLiteUsage, "isEqual:"))
      goto LABEL_134;
  }
  tripDepartureFeedback = self->_tripDepartureFeedback;
  if ((unint64_t)tripDepartureFeedback | *((_QWORD *)v4 + 59))
  {
    if (!-[GEOLogMsgEventTripDepartureFeedback isEqual:](tripDepartureFeedback, "isEqual:"))
      goto LABEL_134;
  }
  directionsRequestDetails = self->_directionsRequestDetails;
  if ((unint64_t)directionsRequestDetails | *((_QWORD *)v4 + 12))
  {
    if (!-[GEOLogMsgEventDirectionsRequestDetails isEqual:](directionsRequestDetails, "isEqual:"))
      goto LABEL_134;
  }
  evRoutingVehicleDetails = self->_evRoutingVehicleDetails;
  if ((unint64_t)evRoutingVehicleDetails | *((_QWORD *)v4 + 14))
  {
    if (!-[GEOLogMsgEventEVRoutingVehicleDetails isEqual:](evRoutingVehicleDetails, "isEqual:"))
      goto LABEL_134;
  }
  evTrip = self->_evTrip;
  if ((unint64_t)evTrip | *((_QWORD *)v4 + 15))
  {
    if (!-[GEOLogMsgEventEVTrip isEqual:](evTrip, "isEqual:"))
      goto LABEL_134;
  }
  curatedCollectionStats = self->_curatedCollectionStats;
  if ((unint64_t)curatedCollectionStats | *((_QWORD *)v4 + 7))
  {
    if (!-[GEOLogMsgEventCuratedCollectionStats isEqual:](curatedCollectionStats, "isEqual:"))
      goto LABEL_134;
  }
  curatedCollectionUsage = self->_curatedCollectionUsage;
  if ((unint64_t)curatedCollectionUsage | *((_QWORD *)v4 + 8))
  {
    if (!-[GEOLogMsgEventCuratedCollectionUsage isEqual:](curatedCollectionUsage, "isEqual:"))
      goto LABEL_134;
  }
  mapsDeviceSettings = self->_mapsDeviceSettings;
  if ((unint64_t)mapsDeviceSettings | *((_QWORD *)v4 + 25))
  {
    if (!-[GEOLogMsgEventMapsDeviceSettings isEqual:](mapsDeviceSettings, "isEqual:"))
      goto LABEL_134;
  }
  hardStop = self->_hardStop;
  if ((unint64_t)hardStop | *((_QWORD *)v4 + 18))
  {
    if (!-[GEOLogMsgEventHardStop isEqual:](hardStop, "isEqual:"))
      goto LABEL_134;
  }
  vlfUsage = self->_vlfUsage;
  if ((unint64_t)vlfUsage | *((_QWORD *)v4 + 62))
  {
    if (!-[GEOLogMsgEventVLFUsage isEqual:](vlfUsage, "isEqual:"))
      goto LABEL_134;
  }
  logDiscard = self->_logDiscard;
  if ((unint64_t)logDiscard | *((_QWORD *)v4 + 21))
  {
    if (!-[GEOLogMsgEventLogDiscard isEqual:](logDiscard, "isEqual:"))
      goto LABEL_134;
  }
  dailyUseSummary = self->_dailyUseSummary;
  if ((unint64_t)dailyUseSummary | *((_QWORD *)v4 + 9))
  {
    if (!-[GEOLogMsgEventDailyUseSummary isEqual:](dailyUseSummary, "isEqual:"))
      goto LABEL_134;
  }
  pressureData = self->_pressureData;
  if ((unint64_t)pressureData | *((_QWORD *)v4 + 40))
  {
    if (!-[GEOLogMsgEventPressureData isEqual:](pressureData, "isEqual:"))
      goto LABEL_134;
  }
  poiBusynessData = self->_poiBusynessData;
  if ((unint64_t)poiBusynessData | *((_QWORD *)v4 + 38))
  {
    if (!-[GEOLogMsgEventPOIBusynessData isEqual:](poiBusynessData, "isEqual:"))
      goto LABEL_134;
  }
  periodicSettingsSummary = self->_periodicSettingsSummary;
  if ((unint64_t)periodicSettingsSummary | *((_QWORD *)v4 + 35))
  {
    if (!-[GEOLogMsgEventPeriodicSettingsSummary isEqual:](periodicSettingsSummary, "isEqual:"))
      goto LABEL_134;
  }
  thermalPressure = self->_thermalPressure;
  if ((unint64_t)thermalPressure | *((_QWORD *)v4 + 52))
  {
    if (!-[GEOLogMsgEventThermalPressure isEqual:](thermalPressure, "isEqual:"))
      goto LABEL_134;
  }
  arSessionUsage = self->_arSessionUsage;
  if ((unint64_t)arSessionUsage | *((_QWORD *)v4 + 3))
  {
    if (!-[GEOLogMsgEventARSessionUsage isEqual:](arSessionUsage, "isEqual:"))
      goto LABEL_134;
  }
  networkSelectionHarvest = self->_networkSelectionHarvest;
  if ((unint64_t)networkSelectionHarvest | *((_QWORD *)v4 + 33))
  {
    if (!-[GEOLogMsgEventNetworkSelectionHarvest isEqual:](networkSelectionHarvest, "isEqual:"))
      goto LABEL_134;
  }
  impressionEvent = self->_impressionEvent;
  if ((unint64_t)impressionEvent | *((_QWORD *)v4 + 19))
  {
    if (!-[GEOLogMsgEventImpressionEvent isEqual:](impressionEvent, "isEqual:"))
      goto LABEL_134;
  }
  showcaseSuppression = self->_showcaseSuppression;
  if ((unint64_t)showcaseSuppression | *((_QWORD *)v4 + 47))
  {
    if (!-[GEOLogMsgEventShowcaseSuppression isEqual:](showcaseSuppression, "isEqual:"))
      goto LABEL_134;
  }
  placeCacheLookup = self->_placeCacheLookup;
  if ((unint64_t)placeCacheLookup | *((_QWORD *)v4 + 36))
  {
    if (!-[GEOLogMsgEventPlaceCacheLookup isEqual:](placeCacheLookup, "isEqual:"))
      goto LABEL_134;
  }
  deviceSyncStatus = self->_deviceSyncStatus;
  if ((unint64_t)deviceSyncStatus | *((_QWORD *)v4 + 10))
  {
    if (!-[GEOLogMsgEventDeviceSyncStatus isEqual:](deviceSyncStatus, "isEqual:"))
      goto LABEL_134;
  }
  mapsInteraction = self->_mapsInteraction;
  if ((unint64_t)mapsInteraction | *((_QWORD *)v4 + 28))
  {
    if (!-[GEOLogMsgEventMapsInteraction isEqual:](mapsInteraction, "isEqual:"))
      goto LABEL_134;
  }
  networkEventSummary = self->_networkEventSummary;
  if ((unint64_t)networkEventSummary | *((_QWORD *)v4 + 31))
  {
    if (!-[GEOLogMsgEventNetworkEventSummary isEqual:](networkEventSummary, "isEqual:"))
      goto LABEL_134;
  }
  serviceMetadata = self->_serviceMetadata;
  if ((unint64_t)serviceMetadata | *((_QWORD *)v4 + 46))
  {
    if (!-[GEOLogMsgEventServiceMetadata isEqual:](serviceMetadata, "isEqual:"))
      goto LABEL_134;
  }
  mapsEngagement = self->_mapsEngagement;
  if ((unint64_t)mapsEngagement | *((_QWORD *)v4 + 26))
  {
    if (!-[GEOLogMsgEventMapsEngagement isEqual:](mapsEngagement, "isEqual:"))
      goto LABEL_134;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_QWORD *)v4 + 66) & 1) == 0 || self->_usageEventTime != *((double *)v4 + 60))
      goto LABEL_134;
    v67 = 1;
  }
  else
  {
    v67 = (*((_QWORD *)v4 + 66) & 1) == 0;
  }
LABEL_135:

  return v67;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  double usageEventTime;
  double v14;
  long double v15;
  double v16;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;
  unint64_t v42;
  unint64_t v43;
  unint64_t v44;
  unint64_t v45;
  unint64_t v46;
  unint64_t v47;
  unint64_t v48;
  unint64_t v49;
  unint64_t v50;
  unint64_t v51;
  unint64_t v52;
  unint64_t v53;
  unint64_t v54;
  unint64_t v55;
  unint64_t v56;
  unint64_t v57;
  unint64_t v58;
  unint64_t v59;
  unint64_t v60;
  unint64_t v61;
  unint64_t v62;
  unint64_t v63;
  unint64_t v64;
  unint64_t v65;
  unint64_t v66;
  uint64_t v67;
  NSUInteger v68;
  unint64_t v69;
  uint64_t v70;

  -[GEOLogMsgEvent readAll:](self, "readAll:", 1);
  v70 = -[NSMutableArray hash](self->_logMsgStates, "hash");
  v69 = -[GEOLogMsgEventId hash](self->_analyticTag, "hash");
  v68 = -[NSString hash](self->_mapsEnvironment, "hash");
  if ((*(_BYTE *)&self->_flags & 2) != 0)
    v67 = 2654435761 * self->_eventType;
  else
    v67 = 0;
  v66 = -[GEOLogMsgEventUserAction hash](self->_userActionEvent, "hash");
  v65 = -[GEOLogMsgEventStateTiming hash](self->_stateTimingEvent, "hash");
  v64 = -[GEOLogMsgEventTileSetState hash](self->_tileSetStateEvent, "hash");
  v63 = -[GEOLogMsgEventPlaceDataCache hash](self->_placeDataCacheEvent, "hash");
  v62 = -[GEOLogMsgEventNetwork hash](self->_networkEvent, "hash");
  v61 = -[GEOLogMsgEventDirections hash](self->_directionsEvent, "hash");
  v60 = -[GEOLogMsgEventTransitAppLaunch hash](self->_transitAppLaunchEvent, "hash");
  v59 = -[GEOLogMsgEventTimeToLeaveHypothesis hash](self->_timeToLeaveHypothesisEvent, "hash");
  v58 = -[GEOLogMsgEventTimeToLeaveInitialTravelTime hash](self->_timeToLeaveInitialTravelTimeEvent, "hash");
  v57 = -[GEOLogMsgEventMapsWidgetsInteractionSession hash](self->_mapsWidgetsInteractionSession, "hash");
  v56 = -[GEOLogMsgEventListInteractionSession hash](self->_listInteractionSession, "hash");
  v55 = -[GEOLogMsgEventRefineSearchSession hash](self->_refineSearchSession, "hash");
  v54 = -[GEOLogMsgEventProactiveSuggestionInteractionSession hash](self->_proactiveSuggestionInteractionSessionEvent, "hash");
  v53 = -[GEOLogMsgEventMapLaunch hash](self->_mapLaunchEvent, "hash");
  v52 = -[GEOLogMsgEventRideBookingSession hash](self->_rideBookingSession, "hash");
  v51 = -[GEOLogMsgEventRideBookedSession hash](self->_rideBookedSession, "hash");
  v50 = -[GEOLogMsgEventTableBookingSession hash](self->_tableBookingSession, "hash");
  v49 = -[GEOLogMsgEventTableBookedSession hash](self->_tableBookedSession, "hash");
  v48 = -[GEOLogMsgEventFullNavTrace hash](self->_fullNavTrace, "hash");
  v47 = -[GEOLogMsgEventTelemetric hash](self->_telemetric, "hash");
  v46 = -[GEOLogMsgEventClientACSuggestions hash](self->_clientAcSuggestions, "hash");
  v45 = -[GEOLogMsgEventRealtimeTrafficProbe hash](self->_realtimeTrafficProbeCollection, "hash");
  v44 = -[GEOLogMsgEventBatchTrafficProbe hash](self->_batchTrafficProbeCollection, "hash");
  v43 = -[GEOLogMsgEventCommuteWindow hash](self->_commuteWindow, "hash");
  v42 = -[GEOLogMsgEventWifiConnectionQualityProbe hash](self->_wifiConnectionQualityProbeEvent, "hash");
  v41 = -[GEOLogMsgEventParkedCar hash](self->_parkedCar, "hash");
  v40 = -[GEOLogMsgEventTileCacheAnalytic hash](self->_tileCacheAnalytic, "hash");
  v39 = -[GEOLogMsgEventGridDuration hash](self->_gridDuration, "hash");
  v38 = -[GEOLogMsgEventDisplayAnalytic hash](self->_displayAnalytic, "hash");
  v37 = -[GEOLogMsgEventThrottle hash](self->_throttleEvent, "hash");
  v36 = -[GEOLogMsgEventMapKitCounts hash](self->_mapKitCounts, "hash");
  v35 = -[GEOLogMsgEventPredExTrainingData hash](self->_predExTrainingData, "hash");
  v34 = -[GEOLogMsgEventMarcoLiteUsage hash](self->_marcoLiteUsage, "hash");
  v33 = -[GEOLogMsgEventTripDepartureFeedback hash](self->_tripDepartureFeedback, "hash");
  v32 = -[GEOLogMsgEventDirectionsRequestDetails hash](self->_directionsRequestDetails, "hash");
  v31 = -[GEOLogMsgEventEVRoutingVehicleDetails hash](self->_evRoutingVehicleDetails, "hash");
  v30 = -[GEOLogMsgEventEVTrip hash](self->_evTrip, "hash");
  v29 = -[GEOLogMsgEventCuratedCollectionStats hash](self->_curatedCollectionStats, "hash");
  v28 = -[GEOLogMsgEventCuratedCollectionUsage hash](self->_curatedCollectionUsage, "hash");
  v27 = -[GEOLogMsgEventMapsDeviceSettings hash](self->_mapsDeviceSettings, "hash");
  v26 = -[GEOLogMsgEventHardStop hash](self->_hardStop, "hash");
  v25 = -[GEOLogMsgEventVLFUsage hash](self->_vlfUsage, "hash");
  v24 = -[GEOLogMsgEventLogDiscard hash](self->_logDiscard, "hash");
  v23 = -[GEOLogMsgEventDailyUseSummary hash](self->_dailyUseSummary, "hash");
  v22 = -[GEOLogMsgEventPressureData hash](self->_pressureData, "hash");
  v21 = -[GEOLogMsgEventPOIBusynessData hash](self->_poiBusynessData, "hash");
  v20 = -[GEOLogMsgEventPeriodicSettingsSummary hash](self->_periodicSettingsSummary, "hash");
  v19 = -[GEOLogMsgEventThermalPressure hash](self->_thermalPressure, "hash");
  v18 = -[GEOLogMsgEventARSessionUsage hash](self->_arSessionUsage, "hash");
  v3 = -[GEOLogMsgEventNetworkSelectionHarvest hash](self->_networkSelectionHarvest, "hash");
  v4 = -[GEOLogMsgEventImpressionEvent hash](self->_impressionEvent, "hash");
  v5 = -[GEOLogMsgEventShowcaseSuppression hash](self->_showcaseSuppression, "hash");
  v6 = -[GEOLogMsgEventPlaceCacheLookup hash](self->_placeCacheLookup, "hash");
  v7 = -[GEOLogMsgEventDeviceSyncStatus hash](self->_deviceSyncStatus, "hash");
  v8 = -[GEOLogMsgEventMapsInteraction hash](self->_mapsInteraction, "hash");
  v9 = -[GEOLogMsgEventNetworkEventSummary hash](self->_networkEventSummary, "hash");
  v10 = -[GEOLogMsgEventServiceMetadata hash](self->_serviceMetadata, "hash");
  v11 = -[GEOLogMsgEventMapsEngagement hash](self->_mapsEngagement, "hash");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    usageEventTime = self->_usageEventTime;
    v14 = -usageEventTime;
    if (usageEventTime >= 0.0)
      v14 = self->_usageEventTime;
    v15 = floor(v14 + 0.5);
    v16 = (v14 - v15) * 1.84467441e19;
    v12 = 2654435761u * (unint64_t)fmod(v15, 1.84467441e19);
    if (v16 >= 0.0)
    {
      if (v16 > 0.0)
        v12 += (unint64_t)v16;
    }
    else
    {
      v12 -= (unint64_t)fabs(v16);
    }
  }
  else
  {
    v12 = 0;
  }
  return v69 ^ v70 ^ v68 ^ v67 ^ v66 ^ v65 ^ v64 ^ v63 ^ v62 ^ v61 ^ v60 ^ v59 ^ v58 ^ v57 ^ v56 ^ v55 ^ v54 ^ v53 ^ v52 ^ v51 ^ v50 ^ v49 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v18 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  GEOLogMsgEventId *analyticTag;
  uint64_t v11;
  GEOLogMsgEventUserAction *userActionEvent;
  uint64_t v13;
  GEOLogMsgEventStateTiming *stateTimingEvent;
  uint64_t v15;
  GEOLogMsgEventTileSetState *tileSetStateEvent;
  uint64_t v17;
  GEOLogMsgEventPlaceDataCache *placeDataCacheEvent;
  uint64_t v19;
  GEOLogMsgEventNetwork *networkEvent;
  uint64_t v21;
  GEOLogMsgEventDirections *directionsEvent;
  uint64_t v23;
  GEOLogMsgEventTransitAppLaunch *transitAppLaunchEvent;
  uint64_t v25;
  GEOLogMsgEventTimeToLeaveHypothesis *timeToLeaveHypothesisEvent;
  uint64_t v27;
  GEOLogMsgEventTimeToLeaveInitialTravelTime *timeToLeaveInitialTravelTimeEvent;
  uint64_t v29;
  GEOLogMsgEventMapsWidgetsInteractionSession *mapsWidgetsInteractionSession;
  uint64_t v31;
  GEOLogMsgEventListInteractionSession *listInteractionSession;
  uint64_t v33;
  GEOLogMsgEventRefineSearchSession *refineSearchSession;
  uint64_t v35;
  GEOLogMsgEventProactiveSuggestionInteractionSession *proactiveSuggestionInteractionSessionEvent;
  uint64_t v37;
  GEOLogMsgEventMapLaunch *mapLaunchEvent;
  uint64_t v39;
  GEOLogMsgEventRideBookingSession *rideBookingSession;
  uint64_t v41;
  GEOLogMsgEventRideBookedSession *rideBookedSession;
  uint64_t v43;
  GEOLogMsgEventTableBookingSession *tableBookingSession;
  uint64_t v45;
  GEOLogMsgEventTableBookedSession *tableBookedSession;
  uint64_t v47;
  GEOLogMsgEventFullNavTrace *fullNavTrace;
  uint64_t v49;
  GEOLogMsgEventTelemetric *telemetric;
  uint64_t v51;
  GEOLogMsgEventClientACSuggestions *clientAcSuggestions;
  uint64_t v53;
  GEOLogMsgEventRealtimeTrafficProbe *realtimeTrafficProbeCollection;
  uint64_t v55;
  GEOLogMsgEventBatchTrafficProbe *batchTrafficProbeCollection;
  uint64_t v57;
  GEOLogMsgEventCommuteWindow *commuteWindow;
  uint64_t v59;
  GEOLogMsgEventWifiConnectionQualityProbe *wifiConnectionQualityProbeEvent;
  uint64_t v61;
  GEOLogMsgEventParkedCar *parkedCar;
  uint64_t v63;
  GEOLogMsgEventTileCacheAnalytic *tileCacheAnalytic;
  uint64_t v65;
  GEOLogMsgEventGridDuration *gridDuration;
  uint64_t v67;
  GEOLogMsgEventDisplayAnalytic *displayAnalytic;
  uint64_t v69;
  GEOLogMsgEventThrottle *throttleEvent;
  uint64_t v71;
  GEOLogMsgEventMapKitCounts *mapKitCounts;
  uint64_t v73;
  GEOLogMsgEventPredExTrainingData *predExTrainingData;
  uint64_t v75;
  GEOLogMsgEventMarcoLiteUsage *marcoLiteUsage;
  uint64_t v77;
  GEOLogMsgEventTripDepartureFeedback *tripDepartureFeedback;
  uint64_t v79;
  GEOLogMsgEventDirectionsRequestDetails *directionsRequestDetails;
  uint64_t v81;
  GEOLogMsgEventEVRoutingVehicleDetails *evRoutingVehicleDetails;
  uint64_t v83;
  GEOLogMsgEventEVTrip *evTrip;
  uint64_t v85;
  GEOLogMsgEventCuratedCollectionStats *curatedCollectionStats;
  uint64_t v87;
  GEOLogMsgEventCuratedCollectionUsage *curatedCollectionUsage;
  uint64_t v89;
  GEOLogMsgEventMapsDeviceSettings *mapsDeviceSettings;
  uint64_t v91;
  GEOLogMsgEventHardStop *hardStop;
  uint64_t v93;
  GEOLogMsgEventVLFUsage *vlfUsage;
  uint64_t v95;
  GEOLogMsgEventLogDiscard *logDiscard;
  uint64_t v97;
  GEOLogMsgEventDailyUseSummary *dailyUseSummary;
  uint64_t v99;
  GEOLogMsgEventPressureData *pressureData;
  uint64_t v101;
  GEOLogMsgEventPOIBusynessData *poiBusynessData;
  uint64_t v103;
  GEOLogMsgEventPeriodicSettingsSummary *periodicSettingsSummary;
  uint64_t v105;
  GEOLogMsgEventThermalPressure *thermalPressure;
  uint64_t v107;
  GEOLogMsgEventARSessionUsage *arSessionUsage;
  uint64_t v109;
  GEOLogMsgEventNetworkSelectionHarvest *networkSelectionHarvest;
  uint64_t v111;
  GEOLogMsgEventImpressionEvent *impressionEvent;
  uint64_t v113;
  GEOLogMsgEventShowcaseSuppression *showcaseSuppression;
  uint64_t v115;
  GEOLogMsgEventPlaceCacheLookup *placeCacheLookup;
  uint64_t v117;
  GEOLogMsgEventDeviceSyncStatus *deviceSyncStatus;
  uint64_t v119;
  GEOLogMsgEventMapsInteraction *mapsInteraction;
  uint64_t v121;
  GEOLogMsgEventNetworkEventSummary *networkEventSummary;
  uint64_t v123;
  GEOLogMsgEventServiceMetadata *serviceMetadata;
  uint64_t v125;
  GEOLogMsgEventMapsEngagement *mapsEngagement;
  uint64_t v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  _BYTE v132[128];
  uint64_t v133;

  v133 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  v130 = 0u;
  v131 = 0u;
  v128 = 0u;
  v129 = 0u;
  v5 = *((id *)v4 + 22);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v128, v132, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v129;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v129 != v8)
          objc_enumerationMutation(v5);
        -[GEOLogMsgEvent addLogMsgState:](self, "addLogMsgState:", *(_QWORD *)(*((_QWORD *)&v128 + 1) + 8 * i), (_QWORD)v128);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v128, v132, 16);
    }
    while (v7);
  }

  analyticTag = self->_analyticTag;
  v11 = *((_QWORD *)v4 + 2);
  if (analyticTag)
  {
    if (v11)
      -[GEOLogMsgEventId mergeFrom:](analyticTag, "mergeFrom:");
  }
  else if (v11)
  {
    -[GEOLogMsgEvent setAnalyticTag:](self, "setAnalyticTag:");
  }
  if (*((_QWORD *)v4 + 27))
    -[GEOLogMsgEvent setMapsEnvironment:](self, "setMapsEnvironment:");
  if ((*((_BYTE *)v4 + 528) & 2) != 0)
  {
    self->_eventType = *((_DWORD *)v4 + 131);
    *(_QWORD *)&self->_flags |= 2uLL;
  }
  userActionEvent = self->_userActionEvent;
  v13 = *((_QWORD *)v4 + 61);
  if (userActionEvent)
  {
    if (v13)
      -[GEOLogMsgEventUserAction mergeFrom:](userActionEvent, "mergeFrom:");
  }
  else if (v13)
  {
    -[GEOLogMsgEvent setUserActionEvent:](self, "setUserActionEvent:");
  }
  stateTimingEvent = self->_stateTimingEvent;
  v15 = *((_QWORD *)v4 + 48);
  if (stateTimingEvent)
  {
    if (v15)
      -[GEOLogMsgEventStateTiming mergeFrom:](stateTimingEvent, "mergeFrom:");
  }
  else if (v15)
  {
    -[GEOLogMsgEvent setStateTimingEvent:](self, "setStateTimingEvent:");
  }
  tileSetStateEvent = self->_tileSetStateEvent;
  v17 = *((_QWORD *)v4 + 55);
  if (tileSetStateEvent)
  {
    if (v17)
      -[GEOLogMsgEventTileSetState mergeFrom:](tileSetStateEvent, "mergeFrom:");
  }
  else if (v17)
  {
    -[GEOLogMsgEvent setTileSetStateEvent:](self, "setTileSetStateEvent:");
  }
  placeDataCacheEvent = self->_placeDataCacheEvent;
  v19 = *((_QWORD *)v4 + 37);
  if (placeDataCacheEvent)
  {
    if (v19)
      -[GEOLogMsgEventPlaceDataCache mergeFrom:](placeDataCacheEvent, "mergeFrom:");
  }
  else if (v19)
  {
    -[GEOLogMsgEvent setPlaceDataCacheEvent:](self, "setPlaceDataCacheEvent:");
  }
  networkEvent = self->_networkEvent;
  v21 = *((_QWORD *)v4 + 32);
  if (networkEvent)
  {
    if (v21)
      -[GEOLogMsgEventNetwork mergeFrom:](networkEvent, "mergeFrom:");
  }
  else if (v21)
  {
    -[GEOLogMsgEvent setNetworkEvent:](self, "setNetworkEvent:");
  }
  directionsEvent = self->_directionsEvent;
  v23 = *((_QWORD *)v4 + 11);
  if (directionsEvent)
  {
    if (v23)
      -[GEOLogMsgEventDirections mergeFrom:](directionsEvent, "mergeFrom:");
  }
  else if (v23)
  {
    -[GEOLogMsgEvent setDirectionsEvent:](self, "setDirectionsEvent:");
  }
  transitAppLaunchEvent = self->_transitAppLaunchEvent;
  v25 = *((_QWORD *)v4 + 58);
  if (transitAppLaunchEvent)
  {
    if (v25)
      -[GEOLogMsgEventTransitAppLaunch mergeFrom:](transitAppLaunchEvent, "mergeFrom:");
  }
  else if (v25)
  {
    -[GEOLogMsgEvent setTransitAppLaunchEvent:](self, "setTransitAppLaunchEvent:");
  }
  timeToLeaveHypothesisEvent = self->_timeToLeaveHypothesisEvent;
  v27 = *((_QWORD *)v4 + 56);
  if (timeToLeaveHypothesisEvent)
  {
    if (v27)
      -[GEOLogMsgEventTimeToLeaveHypothesis mergeFrom:](timeToLeaveHypothesisEvent, "mergeFrom:");
  }
  else if (v27)
  {
    -[GEOLogMsgEvent setTimeToLeaveHypothesisEvent:](self, "setTimeToLeaveHypothesisEvent:");
  }
  timeToLeaveInitialTravelTimeEvent = self->_timeToLeaveInitialTravelTimeEvent;
  v29 = *((_QWORD *)v4 + 57);
  if (timeToLeaveInitialTravelTimeEvent)
  {
    if (v29)
      -[GEOLogMsgEventTimeToLeaveInitialTravelTime mergeFrom:](timeToLeaveInitialTravelTimeEvent, "mergeFrom:");
  }
  else if (v29)
  {
    -[GEOLogMsgEvent setTimeToLeaveInitialTravelTimeEvent:](self, "setTimeToLeaveInitialTravelTimeEvent:");
  }
  mapsWidgetsInteractionSession = self->_mapsWidgetsInteractionSession;
  v31 = *((_QWORD *)v4 + 29);
  if (mapsWidgetsInteractionSession)
  {
    if (v31)
      -[GEOLogMsgEventMapsWidgetsInteractionSession mergeFrom:](mapsWidgetsInteractionSession, "mergeFrom:");
  }
  else if (v31)
  {
    -[GEOLogMsgEvent setMapsWidgetsInteractionSession:](self, "setMapsWidgetsInteractionSession:");
  }
  listInteractionSession = self->_listInteractionSession;
  v33 = *((_QWORD *)v4 + 20);
  if (listInteractionSession)
  {
    if (v33)
      -[GEOLogMsgEventListInteractionSession mergeFrom:](listInteractionSession, "mergeFrom:");
  }
  else if (v33)
  {
    -[GEOLogMsgEvent setListInteractionSession:](self, "setListInteractionSession:");
  }
  refineSearchSession = self->_refineSearchSession;
  v35 = *((_QWORD *)v4 + 43);
  if (refineSearchSession)
  {
    if (v35)
      -[GEOLogMsgEventRefineSearchSession mergeFrom:](refineSearchSession, "mergeFrom:");
  }
  else if (v35)
  {
    -[GEOLogMsgEvent setRefineSearchSession:](self, "setRefineSearchSession:");
  }
  proactiveSuggestionInteractionSessionEvent = self->_proactiveSuggestionInteractionSessionEvent;
  v37 = *((_QWORD *)v4 + 41);
  if (proactiveSuggestionInteractionSessionEvent)
  {
    if (v37)
      -[GEOLogMsgEventProactiveSuggestionInteractionSession mergeFrom:](proactiveSuggestionInteractionSessionEvent, "mergeFrom:");
  }
  else if (v37)
  {
    -[GEOLogMsgEvent setProactiveSuggestionInteractionSessionEvent:](self, "setProactiveSuggestionInteractionSessionEvent:");
  }
  mapLaunchEvent = self->_mapLaunchEvent;
  v39 = *((_QWORD *)v4 + 24);
  if (mapLaunchEvent)
  {
    if (v39)
      -[GEOLogMsgEventMapLaunch mergeFrom:](mapLaunchEvent, "mergeFrom:");
  }
  else if (v39)
  {
    -[GEOLogMsgEvent setMapLaunchEvent:](self, "setMapLaunchEvent:");
  }
  rideBookingSession = self->_rideBookingSession;
  v41 = *((_QWORD *)v4 + 45);
  if (rideBookingSession)
  {
    if (v41)
      -[GEOLogMsgEventRideBookingSession mergeFrom:](rideBookingSession, "mergeFrom:");
  }
  else if (v41)
  {
    -[GEOLogMsgEvent setRideBookingSession:](self, "setRideBookingSession:");
  }
  rideBookedSession = self->_rideBookedSession;
  v43 = *((_QWORD *)v4 + 44);
  if (rideBookedSession)
  {
    if (v43)
      -[GEOLogMsgEventRideBookedSession mergeFrom:](rideBookedSession, "mergeFrom:");
  }
  else if (v43)
  {
    -[GEOLogMsgEvent setRideBookedSession:](self, "setRideBookedSession:");
  }
  tableBookingSession = self->_tableBookingSession;
  v45 = *((_QWORD *)v4 + 50);
  if (tableBookingSession)
  {
    if (v45)
      -[GEOLogMsgEventTableBookingSession mergeFrom:](tableBookingSession, "mergeFrom:");
  }
  else if (v45)
  {
    -[GEOLogMsgEvent setTableBookingSession:](self, "setTableBookingSession:");
  }
  tableBookedSession = self->_tableBookedSession;
  v47 = *((_QWORD *)v4 + 49);
  if (tableBookedSession)
  {
    if (v47)
      -[GEOLogMsgEventTableBookedSession mergeFrom:](tableBookedSession, "mergeFrom:");
  }
  else if (v47)
  {
    -[GEOLogMsgEvent setTableBookedSession:](self, "setTableBookedSession:");
  }
  fullNavTrace = self->_fullNavTrace;
  v49 = *((_QWORD *)v4 + 16);
  if (fullNavTrace)
  {
    if (v49)
      -[GEOLogMsgEventFullNavTrace mergeFrom:](fullNavTrace, "mergeFrom:");
  }
  else if (v49)
  {
    -[GEOLogMsgEvent setFullNavTrace:](self, "setFullNavTrace:");
  }
  telemetric = self->_telemetric;
  v51 = *((_QWORD *)v4 + 51);
  if (telemetric)
  {
    if (v51)
      -[GEOLogMsgEventTelemetric mergeFrom:](telemetric, "mergeFrom:");
  }
  else if (v51)
  {
    -[GEOLogMsgEvent setTelemetric:](self, "setTelemetric:");
  }
  clientAcSuggestions = self->_clientAcSuggestions;
  v53 = *((_QWORD *)v4 + 5);
  if (clientAcSuggestions)
  {
    if (v53)
      -[GEOLogMsgEventClientACSuggestions mergeFrom:](clientAcSuggestions, "mergeFrom:");
  }
  else if (v53)
  {
    -[GEOLogMsgEvent setClientAcSuggestions:](self, "setClientAcSuggestions:");
  }
  realtimeTrafficProbeCollection = self->_realtimeTrafficProbeCollection;
  v55 = *((_QWORD *)v4 + 42);
  if (realtimeTrafficProbeCollection)
  {
    if (v55)
      -[GEOLogMsgEventRealtimeTrafficProbe mergeFrom:](realtimeTrafficProbeCollection, "mergeFrom:");
  }
  else if (v55)
  {
    -[GEOLogMsgEvent setRealtimeTrafficProbeCollection:](self, "setRealtimeTrafficProbeCollection:");
  }
  batchTrafficProbeCollection = self->_batchTrafficProbeCollection;
  v57 = *((_QWORD *)v4 + 4);
  if (batchTrafficProbeCollection)
  {
    if (v57)
      -[GEOLogMsgEventBatchTrafficProbe mergeFrom:](batchTrafficProbeCollection, "mergeFrom:");
  }
  else if (v57)
  {
    -[GEOLogMsgEvent setBatchTrafficProbeCollection:](self, "setBatchTrafficProbeCollection:");
  }
  commuteWindow = self->_commuteWindow;
  v59 = *((_QWORD *)v4 + 6);
  if (commuteWindow)
  {
    if (v59)
      -[GEOLogMsgEventCommuteWindow mergeFrom:](commuteWindow, "mergeFrom:");
  }
  else if (v59)
  {
    -[GEOLogMsgEvent setCommuteWindow:](self, "setCommuteWindow:");
  }
  wifiConnectionQualityProbeEvent = self->_wifiConnectionQualityProbeEvent;
  v61 = *((_QWORD *)v4 + 63);
  if (wifiConnectionQualityProbeEvent)
  {
    if (v61)
      -[GEOLogMsgEventWifiConnectionQualityProbe mergeFrom:](wifiConnectionQualityProbeEvent, "mergeFrom:");
  }
  else if (v61)
  {
    -[GEOLogMsgEvent setWifiConnectionQualityProbeEvent:](self, "setWifiConnectionQualityProbeEvent:");
  }
  parkedCar = self->_parkedCar;
  v63 = *((_QWORD *)v4 + 34);
  if (parkedCar)
  {
    if (v63)
      -[GEOLogMsgEventParkedCar mergeFrom:](parkedCar, "mergeFrom:");
  }
  else if (v63)
  {
    -[GEOLogMsgEvent setParkedCar:](self, "setParkedCar:");
  }
  tileCacheAnalytic = self->_tileCacheAnalytic;
  v65 = *((_QWORD *)v4 + 54);
  if (tileCacheAnalytic)
  {
    if (v65)
      -[GEOLogMsgEventTileCacheAnalytic mergeFrom:](tileCacheAnalytic, "mergeFrom:");
  }
  else if (v65)
  {
    -[GEOLogMsgEvent setTileCacheAnalytic:](self, "setTileCacheAnalytic:");
  }
  gridDuration = self->_gridDuration;
  v67 = *((_QWORD *)v4 + 17);
  if (gridDuration)
  {
    if (v67)
      -[GEOLogMsgEventGridDuration mergeFrom:](gridDuration, "mergeFrom:");
  }
  else if (v67)
  {
    -[GEOLogMsgEvent setGridDuration:](self, "setGridDuration:");
  }
  displayAnalytic = self->_displayAnalytic;
  v69 = *((_QWORD *)v4 + 13);
  if (displayAnalytic)
  {
    if (v69)
      -[GEOLogMsgEventDisplayAnalytic mergeFrom:](displayAnalytic, "mergeFrom:");
  }
  else if (v69)
  {
    -[GEOLogMsgEvent setDisplayAnalytic:](self, "setDisplayAnalytic:");
  }
  throttleEvent = self->_throttleEvent;
  v71 = *((_QWORD *)v4 + 53);
  if (throttleEvent)
  {
    if (v71)
      -[GEOLogMsgEventThrottle mergeFrom:](throttleEvent, "mergeFrom:");
  }
  else if (v71)
  {
    -[GEOLogMsgEvent setThrottleEvent:](self, "setThrottleEvent:");
  }
  mapKitCounts = self->_mapKitCounts;
  v73 = *((_QWORD *)v4 + 23);
  if (mapKitCounts)
  {
    if (v73)
      -[GEOLogMsgEventMapKitCounts mergeFrom:](mapKitCounts, "mergeFrom:");
  }
  else if (v73)
  {
    -[GEOLogMsgEvent setMapKitCounts:](self, "setMapKitCounts:");
  }
  predExTrainingData = self->_predExTrainingData;
  v75 = *((_QWORD *)v4 + 39);
  if (predExTrainingData)
  {
    if (v75)
      -[GEOLogMsgEventPredExTrainingData mergeFrom:](predExTrainingData, "mergeFrom:");
  }
  else if (v75)
  {
    -[GEOLogMsgEvent setPredExTrainingData:](self, "setPredExTrainingData:");
  }
  marcoLiteUsage = self->_marcoLiteUsage;
  v77 = *((_QWORD *)v4 + 30);
  if (marcoLiteUsage)
  {
    if (v77)
      -[GEOLogMsgEventMarcoLiteUsage mergeFrom:](marcoLiteUsage, "mergeFrom:");
  }
  else if (v77)
  {
    -[GEOLogMsgEvent setMarcoLiteUsage:](self, "setMarcoLiteUsage:");
  }
  tripDepartureFeedback = self->_tripDepartureFeedback;
  v79 = *((_QWORD *)v4 + 59);
  if (tripDepartureFeedback)
  {
    if (v79)
      -[GEOLogMsgEventTripDepartureFeedback mergeFrom:](tripDepartureFeedback, "mergeFrom:");
  }
  else if (v79)
  {
    -[GEOLogMsgEvent setTripDepartureFeedback:](self, "setTripDepartureFeedback:");
  }
  directionsRequestDetails = self->_directionsRequestDetails;
  v81 = *((_QWORD *)v4 + 12);
  if (directionsRequestDetails)
  {
    if (v81)
      -[GEOLogMsgEventDirectionsRequestDetails mergeFrom:](directionsRequestDetails, "mergeFrom:");
  }
  else if (v81)
  {
    -[GEOLogMsgEvent setDirectionsRequestDetails:](self, "setDirectionsRequestDetails:");
  }
  evRoutingVehicleDetails = self->_evRoutingVehicleDetails;
  v83 = *((_QWORD *)v4 + 14);
  if (evRoutingVehicleDetails)
  {
    if (v83)
      -[GEOLogMsgEventEVRoutingVehicleDetails mergeFrom:](evRoutingVehicleDetails, "mergeFrom:");
  }
  else if (v83)
  {
    -[GEOLogMsgEvent setEvRoutingVehicleDetails:](self, "setEvRoutingVehicleDetails:");
  }
  evTrip = self->_evTrip;
  v85 = *((_QWORD *)v4 + 15);
  if (evTrip)
  {
    if (v85)
      -[GEOLogMsgEventEVTrip mergeFrom:](evTrip, "mergeFrom:");
  }
  else if (v85)
  {
    -[GEOLogMsgEvent setEvTrip:](self, "setEvTrip:");
  }
  curatedCollectionStats = self->_curatedCollectionStats;
  v87 = *((_QWORD *)v4 + 7);
  if (curatedCollectionStats)
  {
    if (v87)
      -[GEOLogMsgEventCuratedCollectionStats mergeFrom:](curatedCollectionStats, "mergeFrom:");
  }
  else if (v87)
  {
    -[GEOLogMsgEvent setCuratedCollectionStats:](self, "setCuratedCollectionStats:");
  }
  curatedCollectionUsage = self->_curatedCollectionUsage;
  v89 = *((_QWORD *)v4 + 8);
  if (curatedCollectionUsage)
  {
    if (v89)
      -[GEOLogMsgEventCuratedCollectionUsage mergeFrom:](curatedCollectionUsage, "mergeFrom:");
  }
  else if (v89)
  {
    -[GEOLogMsgEvent setCuratedCollectionUsage:](self, "setCuratedCollectionUsage:");
  }
  mapsDeviceSettings = self->_mapsDeviceSettings;
  v91 = *((_QWORD *)v4 + 25);
  if (mapsDeviceSettings)
  {
    if (v91)
      -[GEOLogMsgEventMapsDeviceSettings mergeFrom:](mapsDeviceSettings, "mergeFrom:");
  }
  else if (v91)
  {
    -[GEOLogMsgEvent setMapsDeviceSettings:](self, "setMapsDeviceSettings:");
  }
  hardStop = self->_hardStop;
  v93 = *((_QWORD *)v4 + 18);
  if (hardStop)
  {
    if (v93)
      -[GEOLogMsgEventHardStop mergeFrom:](hardStop, "mergeFrom:");
  }
  else if (v93)
  {
    -[GEOLogMsgEvent setHardStop:](self, "setHardStop:");
  }
  vlfUsage = self->_vlfUsage;
  v95 = *((_QWORD *)v4 + 62);
  if (vlfUsage)
  {
    if (v95)
      -[GEOLogMsgEventVLFUsage mergeFrom:](vlfUsage, "mergeFrom:");
  }
  else if (v95)
  {
    -[GEOLogMsgEvent setVlfUsage:](self, "setVlfUsage:");
  }
  logDiscard = self->_logDiscard;
  v97 = *((_QWORD *)v4 + 21);
  if (logDiscard)
  {
    if (v97)
      -[GEOLogMsgEventLogDiscard mergeFrom:](logDiscard, "mergeFrom:");
  }
  else if (v97)
  {
    -[GEOLogMsgEvent setLogDiscard:](self, "setLogDiscard:");
  }
  dailyUseSummary = self->_dailyUseSummary;
  v99 = *((_QWORD *)v4 + 9);
  if (dailyUseSummary)
  {
    if (v99)
      -[GEOLogMsgEventDailyUseSummary mergeFrom:](dailyUseSummary, "mergeFrom:");
  }
  else if (v99)
  {
    -[GEOLogMsgEvent setDailyUseSummary:](self, "setDailyUseSummary:");
  }
  pressureData = self->_pressureData;
  v101 = *((_QWORD *)v4 + 40);
  if (pressureData)
  {
    if (v101)
      -[GEOLogMsgEventPressureData mergeFrom:](pressureData, "mergeFrom:");
  }
  else if (v101)
  {
    -[GEOLogMsgEvent setPressureData:](self, "setPressureData:");
  }
  poiBusynessData = self->_poiBusynessData;
  v103 = *((_QWORD *)v4 + 38);
  if (poiBusynessData)
  {
    if (v103)
      -[GEOLogMsgEventPOIBusynessData mergeFrom:](poiBusynessData, "mergeFrom:");
  }
  else if (v103)
  {
    -[GEOLogMsgEvent setPoiBusynessData:](self, "setPoiBusynessData:");
  }
  periodicSettingsSummary = self->_periodicSettingsSummary;
  v105 = *((_QWORD *)v4 + 35);
  if (periodicSettingsSummary)
  {
    if (v105)
      -[GEOLogMsgEventPeriodicSettingsSummary mergeFrom:](periodicSettingsSummary, "mergeFrom:");
  }
  else if (v105)
  {
    -[GEOLogMsgEvent setPeriodicSettingsSummary:](self, "setPeriodicSettingsSummary:");
  }
  thermalPressure = self->_thermalPressure;
  v107 = *((_QWORD *)v4 + 52);
  if (thermalPressure)
  {
    if (v107)
      -[GEOLogMsgEventThermalPressure mergeFrom:](thermalPressure, "mergeFrom:");
  }
  else if (v107)
  {
    -[GEOLogMsgEvent setThermalPressure:](self, "setThermalPressure:");
  }
  arSessionUsage = self->_arSessionUsage;
  v109 = *((_QWORD *)v4 + 3);
  if (arSessionUsage)
  {
    if (v109)
      -[GEOLogMsgEventARSessionUsage mergeFrom:](arSessionUsage, "mergeFrom:");
  }
  else if (v109)
  {
    -[GEOLogMsgEvent setArSessionUsage:](self, "setArSessionUsage:");
  }
  networkSelectionHarvest = self->_networkSelectionHarvest;
  v111 = *((_QWORD *)v4 + 33);
  if (networkSelectionHarvest)
  {
    if (v111)
      -[GEOLogMsgEventNetworkSelectionHarvest mergeFrom:](networkSelectionHarvest, "mergeFrom:");
  }
  else if (v111)
  {
    -[GEOLogMsgEvent setNetworkSelectionHarvest:](self, "setNetworkSelectionHarvest:");
  }
  impressionEvent = self->_impressionEvent;
  v113 = *((_QWORD *)v4 + 19);
  if (impressionEvent)
  {
    if (v113)
      -[GEOLogMsgEventImpressionEvent mergeFrom:](impressionEvent, "mergeFrom:");
  }
  else if (v113)
  {
    -[GEOLogMsgEvent setImpressionEvent:](self, "setImpressionEvent:");
  }
  showcaseSuppression = self->_showcaseSuppression;
  v115 = *((_QWORD *)v4 + 47);
  if (showcaseSuppression)
  {
    if (v115)
      -[GEOLogMsgEventShowcaseSuppression mergeFrom:](showcaseSuppression, "mergeFrom:");
  }
  else if (v115)
  {
    -[GEOLogMsgEvent setShowcaseSuppression:](self, "setShowcaseSuppression:");
  }
  placeCacheLookup = self->_placeCacheLookup;
  v117 = *((_QWORD *)v4 + 36);
  if (placeCacheLookup)
  {
    if (v117)
      -[GEOLogMsgEventPlaceCacheLookup mergeFrom:](placeCacheLookup, "mergeFrom:");
  }
  else if (v117)
  {
    -[GEOLogMsgEvent setPlaceCacheLookup:](self, "setPlaceCacheLookup:");
  }
  deviceSyncStatus = self->_deviceSyncStatus;
  v119 = *((_QWORD *)v4 + 10);
  if (deviceSyncStatus)
  {
    if (v119)
      -[GEOLogMsgEventDeviceSyncStatus mergeFrom:](deviceSyncStatus, "mergeFrom:");
  }
  else if (v119)
  {
    -[GEOLogMsgEvent setDeviceSyncStatus:](self, "setDeviceSyncStatus:");
  }
  mapsInteraction = self->_mapsInteraction;
  v121 = *((_QWORD *)v4 + 28);
  if (mapsInteraction)
  {
    if (v121)
      -[GEOLogMsgEventMapsInteraction mergeFrom:](mapsInteraction, "mergeFrom:");
  }
  else if (v121)
  {
    -[GEOLogMsgEvent setMapsInteraction:](self, "setMapsInteraction:");
  }
  networkEventSummary = self->_networkEventSummary;
  v123 = *((_QWORD *)v4 + 31);
  if (networkEventSummary)
  {
    if (v123)
      -[GEOLogMsgEventNetworkEventSummary mergeFrom:](networkEventSummary, "mergeFrom:");
  }
  else if (v123)
  {
    -[GEOLogMsgEvent setNetworkEventSummary:](self, "setNetworkEventSummary:");
  }
  serviceMetadata = self->_serviceMetadata;
  v125 = *((_QWORD *)v4 + 46);
  if (serviceMetadata)
  {
    if (v125)
      -[GEOLogMsgEventServiceMetadata mergeFrom:](serviceMetadata, "mergeFrom:");
  }
  else if (v125)
  {
    -[GEOLogMsgEvent setServiceMetadata:](self, "setServiceMetadata:");
  }
  mapsEngagement = self->_mapsEngagement;
  v127 = *((_QWORD *)v4 + 26);
  if (mapsEngagement)
  {
    if (v127)
      -[GEOLogMsgEventMapsEngagement mergeFrom:](mapsEngagement, "mergeFrom:");
  }
  else if (v127)
  {
    -[GEOLogMsgEvent setMapsEngagement:](self, "setMapsEngagement:");
  }
  if ((*((_BYTE *)v4 + 528) & 1) != 0)
  {
    self->_usageEventTime = *((double *)v4 + 60);
    *(_QWORD *)&self->_flags |= 1uLL;
  }

}

- (double)usageEventTime
{
  return self->_usageEventTime;
}

- (void)setUsageEventTime:(double)a3
{
  *(_QWORD *)&self->_flags |= 0x8000000000000001;
  self->_usageEventTime = a3;
}

- (void)setHasUsageEventTime:(BOOL)a3
{
  self->_flags = ($6A63E7CDA14C5D1C599C38C8531A0EC3)(*(_QWORD *)&self->_flags & 0x7FFFFFFFFFFFFFFELL | a3 | 0x8000000000000000);
}

- (BOOL)hasUsageEventTime
{
  return *(_DWORD *)&self->_flags & 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wifiConnectionQualityProbeEvent, 0);
  objc_storeStrong((id *)&self->_vlfUsage, 0);
  objc_storeStrong((id *)&self->_userActionEvent, 0);
  objc_storeStrong((id *)&self->_tripDepartureFeedback, 0);
  objc_storeStrong((id *)&self->_transitAppLaunchEvent, 0);
  objc_storeStrong((id *)&self->_timeToLeaveInitialTravelTimeEvent, 0);
  objc_storeStrong((id *)&self->_timeToLeaveHypothesisEvent, 0);
  objc_storeStrong((id *)&self->_tileSetStateEvent, 0);
  objc_storeStrong((id *)&self->_tileCacheAnalytic, 0);
  objc_storeStrong((id *)&self->_throttleEvent, 0);
  objc_storeStrong((id *)&self->_thermalPressure, 0);
  objc_storeStrong((id *)&self->_telemetric, 0);
  objc_storeStrong((id *)&self->_tableBookingSession, 0);
  objc_storeStrong((id *)&self->_tableBookedSession, 0);
  objc_storeStrong((id *)&self->_stateTimingEvent, 0);
  objc_storeStrong((id *)&self->_showcaseSuppression, 0);
  objc_storeStrong((id *)&self->_serviceMetadata, 0);
  objc_storeStrong((id *)&self->_rideBookingSession, 0);
  objc_storeStrong((id *)&self->_rideBookedSession, 0);
  objc_storeStrong((id *)&self->_refineSearchSession, 0);
  objc_storeStrong((id *)&self->_realtimeTrafficProbeCollection, 0);
  objc_storeStrong((id *)&self->_proactiveSuggestionInteractionSessionEvent, 0);
  objc_storeStrong((id *)&self->_pressureData, 0);
  objc_storeStrong((id *)&self->_predExTrainingData, 0);
  objc_storeStrong((id *)&self->_poiBusynessData, 0);
  objc_storeStrong((id *)&self->_placeDataCacheEvent, 0);
  objc_storeStrong((id *)&self->_placeCacheLookup, 0);
  objc_storeStrong((id *)&self->_periodicSettingsSummary, 0);
  objc_storeStrong((id *)&self->_parkedCar, 0);
  objc_storeStrong((id *)&self->_networkSelectionHarvest, 0);
  objc_storeStrong((id *)&self->_networkEvent, 0);
  objc_storeStrong((id *)&self->_networkEventSummary, 0);
  objc_storeStrong((id *)&self->_marcoLiteUsage, 0);
  objc_storeStrong((id *)&self->_mapsWidgetsInteractionSession, 0);
  objc_storeStrong((id *)&self->_mapsInteraction, 0);
  objc_storeStrong((id *)&self->_mapsEnvironment, 0);
  objc_storeStrong((id *)&self->_mapsEngagement, 0);
  objc_storeStrong((id *)&self->_mapsDeviceSettings, 0);
  objc_storeStrong((id *)&self->_mapLaunchEvent, 0);
  objc_storeStrong((id *)&self->_mapKitCounts, 0);
  objc_storeStrong((id *)&self->_logMsgStates, 0);
  objc_storeStrong((id *)&self->_logDiscard, 0);
  objc_storeStrong((id *)&self->_listInteractionSession, 0);
  objc_storeStrong((id *)&self->_impressionEvent, 0);
  objc_storeStrong((id *)&self->_hardStop, 0);
  objc_storeStrong((id *)&self->_gridDuration, 0);
  objc_storeStrong((id *)&self->_fullNavTrace, 0);
  objc_storeStrong((id *)&self->_evTrip, 0);
  objc_storeStrong((id *)&self->_evRoutingVehicleDetails, 0);
  objc_storeStrong((id *)&self->_displayAnalytic, 0);
  objc_storeStrong((id *)&self->_directionsRequestDetails, 0);
  objc_storeStrong((id *)&self->_directionsEvent, 0);
  objc_storeStrong((id *)&self->_deviceSyncStatus, 0);
  objc_storeStrong((id *)&self->_dailyUseSummary, 0);
  objc_storeStrong((id *)&self->_curatedCollectionUsage, 0);
  objc_storeStrong((id *)&self->_curatedCollectionStats, 0);
  objc_storeStrong((id *)&self->_commuteWindow, 0);
  objc_storeStrong((id *)&self->_clientAcSuggestions, 0);
  objc_storeStrong((id *)&self->_batchTrafficProbeCollection, 0);
  objc_storeStrong((id *)&self->_arSessionUsage, 0);
  objc_storeStrong((id *)&self->_analyticTag, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
