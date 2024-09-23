@implementation GEOTrafficRerouteFeedback

- (GEOTrafficRerouteFeedback)init
{
  GEOTrafficRerouteFeedback *v2;
  GEOTrafficRerouteFeedback *v3;
  GEOTrafficRerouteFeedback *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOTrafficRerouteFeedback;
  v2 = -[GEOTrafficRerouteFeedback init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOTrafficRerouteFeedback)initWithData:(id)a3
{
  GEOTrafficRerouteFeedback *v3;
  GEOTrafficRerouteFeedback *v4;
  GEOTrafficRerouteFeedback *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOTrafficRerouteFeedback;
  v3 = -[GEOTrafficRerouteFeedback initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (unsigned)oldRouteTravelTime
{
  return self->_oldRouteTravelTime;
}

- (void)setOldRouteTravelTime:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x8020u;
  self->_oldRouteTravelTime = a3;
}

- (void)setHasOldRouteTravelTime:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = -32736;
  else
    v3 = 0x8000;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFDF | v3;
}

- (BOOL)hasOldRouteTravelTime
{
  return (*(_WORD *)&self->_flags >> 5) & 1;
}

- (unsigned)reroutedRouteTravelTime
{
  return self->_reroutedRouteTravelTime;
}

- (void)setReroutedRouteTravelTime:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x8100u;
  self->_reroutedRouteTravelTime = a3;
}

- (void)setHasReroutedRouteTravelTime:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = -32512;
  else
    v3 = 0x8000;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFEFF | v3;
}

- (BOOL)hasReroutedRouteTravelTime
{
  return HIBYTE(*(_WORD *)&self->_flags) & 1;
}

- (unsigned)oldRouteHistoricTravelTime
{
  return self->_oldRouteHistoricTravelTime;
}

- (void)setOldRouteHistoricTravelTime:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x8010u;
  self->_oldRouteHistoricTravelTime = a3;
}

- (void)setHasOldRouteHistoricTravelTime:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = -32752;
  else
    v3 = 0x8000;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFEF | v3;
}

- (BOOL)hasOldRouteHistoricTravelTime
{
  return (*(_WORD *)&self->_flags >> 4) & 1;
}

- (unsigned)reroutedRouteHistoricTravelTime
{
  return self->_reroutedRouteHistoricTravelTime;
}

- (void)setReroutedRouteHistoricTravelTime:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x8080u;
  self->_reroutedRouteHistoricTravelTime = a3;
}

- (void)setHasReroutedRouteHistoricTravelTime:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = -32640;
  else
    v3 = 0x8000;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFF7F | v3;
}

- (BOOL)hasReroutedRouteHistoricTravelTime
{
  return (*(_WORD *)&self->_flags >> 7) & 1;
}

- (void)_readOldRouteIncidents
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 116) & 0x1000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTrafficRerouteFeedbackReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readOldRouteIncidents_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (NSMutableArray)oldRouteIncidents
{
  -[GEOTrafficRerouteFeedback _readOldRouteIncidents]((uint64_t)self);
  return self->_oldRouteIncidents;
}

- (void)setOldRouteIncidents:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *oldRouteIncidents;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x1000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x8000u;
  oldRouteIncidents = self->_oldRouteIncidents;
  self->_oldRouteIncidents = v4;

}

- (void)clearOldRouteIncidents
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x1000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x8000u;
  -[NSMutableArray removeAllObjects](self->_oldRouteIncidents, "removeAllObjects");
}

- (void)addOldRouteIncidents:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOTrafficRerouteFeedback _readOldRouteIncidents]((uint64_t)self);
  -[GEOTrafficRerouteFeedback _addNoFlagsOldRouteIncidents:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x1000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x8000u;
}

- (void)_addNoFlagsOldRouteIncidents:(uint64_t)a1
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

- (unint64_t)oldRouteIncidentsCount
{
  -[GEOTrafficRerouteFeedback _readOldRouteIncidents]((uint64_t)self);
  return -[NSMutableArray count](self->_oldRouteIncidents, "count");
}

- (id)oldRouteIncidentsAtIndex:(unint64_t)a3
{
  -[GEOTrafficRerouteFeedback _readOldRouteIncidents]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_oldRouteIncidents, "objectAtIndex:", a3);
}

+ (Class)oldRouteIncidentsType
{
  return (Class)objc_opt_class();
}

- (void)_readOldRouteID
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 116) & 0x800) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTrafficRerouteFeedbackReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readOldRouteID_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasOldRouteID
{
  -[GEOTrafficRerouteFeedback _readOldRouteID]((uint64_t)self);
  return self->_oldRouteID != 0;
}

- (NSData)oldRouteID
{
  -[GEOTrafficRerouteFeedback _readOldRouteID]((uint64_t)self);
  return self->_oldRouteID;
}

- (void)setOldRouteID:(id)a3
{
  *(_WORD *)&self->_flags |= 0x8800u;
  objc_storeStrong((id *)&self->_oldRouteID, a3);
}

- (void)_readReroutedRouteID
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 116) & 0x2000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTrafficRerouteFeedbackReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readReroutedRouteID_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasReroutedRouteID
{
  -[GEOTrafficRerouteFeedback _readReroutedRouteID]((uint64_t)self);
  return self->_reroutedRouteID != 0;
}

- (NSData)reroutedRouteID
{
  -[GEOTrafficRerouteFeedback _readReroutedRouteID]((uint64_t)self);
  return self->_reroutedRouteID;
}

- (void)setReroutedRouteID:(id)a3
{
  *(_WORD *)&self->_flags |= 0xA000u;
  objc_storeStrong((id *)&self->_reroutedRouteID, a3);
}

- (int)actionType
{
  os_unfair_lock_s *p_readerLock;
  __int16 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 4) != 0)
    return self->_actionType;
  else
    return 0;
}

- (void)setActionType:(int)a3
{
  *(_WORD *)&self->_flags |= 0x8004u;
  self->_actionType = a3;
}

- (void)setHasActionType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = -32764;
  else
    v3 = 0x8000;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFB | v3;
}

- (BOOL)hasActionType
{
  return (*(_WORD *)&self->_flags >> 2) & 1;
}

- (id)actionTypeAsString:(int)a3
{
  if (a3 < 8)
    return off_1E1C0CC68[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsActionType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_ACTION_TYPE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ACCEPTED")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DISMISSED")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TIMED_OUT")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SHOWN")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DROVE")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UP_VOTE")) & 1) != 0)
  {
    v4 = 6;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("DOWN_VOTE")))
  {
    v4 = 7;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)alertType
{
  os_unfair_lock_s *p_readerLock;
  __int16 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 8) != 0)
    return self->_alertType;
  else
    return 0;
}

- (void)setAlertType:(int)a3
{
  *(_WORD *)&self->_flags |= 0x8008u;
  self->_alertType = a3;
}

- (void)setHasAlertType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = -32760;
  else
    v3 = 0x8000;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFF7 | v3;
}

- (BOOL)hasAlertType
{
  return (*(_WORD *)&self->_flags >> 3) & 1;
}

- (id)alertTypeAsString:(int)a3
{
  if (a3 < 6)
    return off_1E1C0CCA8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsAlertType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_ALERT_TYPE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BLOCKAGE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HEAVY_TRAFFIC_WITH_REROUTE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HEAVY_TRAFFIC_NO_REROUTE")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SUGGEST_NEW_ROUTE")) & 1) != 0)
  {
    v4 = 4;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("TRAFFIC_INCIDENT")))
  {
    v4 = 5;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)backgrounded
{
  return self->_backgrounded;
}

- (void)setBackgrounded:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x8200u;
  self->_backgrounded = a3;
}

- (void)setHasBackgrounded:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = -32256;
  else
    v3 = 0x8000;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFDFF | v3;
}

- (BOOL)hasBackgrounded
{
  return (*(_WORD *)&self->_flags >> 9) & 1;
}

- (int)rerouteType
{
  os_unfair_lock_s *p_readerLock;
  __int16 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 0x40) != 0)
    return self->_rerouteType;
  else
    return 0;
}

- (void)setRerouteType:(int)a3
{
  *(_WORD *)&self->_flags |= 0x8040u;
  self->_rerouteType = a3;
}

- (void)setHasRerouteType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = -32704;
  else
    v3 = 0x8000;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFBF | v3;
}

- (BOOL)hasRerouteType
{
  return (*(_WORD *)&self->_flags >> 6) & 1;
}

- (id)rerouteTypeAsString:(int)a3
{
  if (a3 < 3)
    return off_1E1C0CCD8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsRerouteType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_REROUTE_TYPE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LIVE_ALT_REROUTE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("DODGEBALL_REROUTE")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_readResponseId
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 116) & 0x4000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTrafficRerouteFeedbackReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readResponseId_tags_1);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasResponseId
{
  -[GEOTrafficRerouteFeedback _readResponseId]((uint64_t)self);
  return self->_responseId != 0;
}

- (NSData)responseId
{
  -[GEOTrafficRerouteFeedback _readResponseId]((uint64_t)self);
  return self->_responseId;
}

- (void)setResponseId:(id)a3
{
  *(_WORD *)&self->_flags |= 0xC000u;
  objc_storeStrong((id *)&self->_responseId, a3);
}

- (double)bannerDurationSeconds
{
  return self->_bannerDurationSeconds;
}

- (void)setBannerDurationSeconds:(double)a3
{
  *(_WORD *)&self->_flags |= 0x8001u;
  self->_bannerDurationSeconds = a3;
}

- (void)setHasBannerDurationSeconds:(BOOL)a3
{
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0x7FFE | a3 | 0x8000;
}

- (BOOL)hasBannerDurationSeconds
{
  return *(_WORD *)&self->_flags & 1;
}

- (void)_readDisplayedBannerId
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 116) & 0x400) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTrafficRerouteFeedbackReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDisplayedBannerId_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasDisplayedBannerId
{
  -[GEOTrafficRerouteFeedback _readDisplayedBannerId]((uint64_t)self);
  return self->_displayedBannerId != 0;
}

- (NSString)displayedBannerId
{
  -[GEOTrafficRerouteFeedback _readDisplayedBannerId]((uint64_t)self);
  return self->_displayedBannerId;
}

- (void)setDisplayedBannerId:(id)a3
{
  *(_WORD *)&self->_flags |= 0x8400u;
  objc_storeStrong((id *)&self->_displayedBannerId, a3);
}

- (double)distanceToDestination
{
  return self->_distanceToDestination;
}

- (void)setDistanceToDestination:(double)a3
{
  *(_WORD *)&self->_flags |= 0x8002u;
  self->_distanceToDestination = a3;
}

- (void)setHasDistanceToDestination:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = -32766;
  else
    v3 = 0x8000;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasDistanceToDestination
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
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
  v8.super_class = (Class)GEOTrafficRerouteFeedback;
  -[GEOTrafficRerouteFeedback description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOTrafficRerouteFeedback dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOTrafficRerouteFeedback _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  __int16 v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  __int16 v24;
  uint64_t v25;
  __CFString *v26;
  uint64_t v27;
  __CFString *v28;
  void *v29;
  uint64_t v30;
  __CFString *v31;
  const __CFString *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  const __CFString *v37;
  void *v38;
  const __CFString *v39;
  void *v40;
  const __CFString *v41;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_WORD *)(a1 + 116);
  if ((v5 & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 96));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("oldRouteTravelTime"));

    v5 = *(_WORD *)(a1 + 116);
  }
  if ((v5 & 0x100) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 108));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v19, CFSTR("reroutedRouteTravelTime"));

    v5 = *(_WORD *)(a1 + 116);
    if ((v5 & 0x10) == 0)
    {
LABEL_6:
      if ((v5 & 0x80) == 0)
        goto LABEL_8;
      goto LABEL_7;
    }
  }
  else if ((v5 & 0x10) == 0)
  {
    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 92));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v20, CFSTR("oldRouteHistoricTravelTime"));

  if ((*(_WORD *)(a1 + 116) & 0x80) != 0)
  {
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 104));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("reroutedRouteHistoricTravelTime"));

  }
LABEL_8:
  if (objc_msgSend(*(id *)(a1 + 48), "count"))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v9 = *(id *)(a1 + 48);
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v44;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v44 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v14, "jsonRepresentation");
          else
            objc_msgSend(v14, "dictionaryRepresentation");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v15);

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
      }
      while (v11);
    }

    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("oldRouteIncidents"));
  }
  objc_msgSend((id)a1, "oldRouteID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v16)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v16, "base64EncodedStringWithOptions:", 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v18, CFSTR("oldRouteID"));

    }
    else
    {
      objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("oldRouteID"));
    }
  }

  objc_msgSend((id)a1, "reroutedRouteID");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (v21)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v21, "base64EncodedStringWithOptions:", 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v23, CFSTR("reroutedRouteID"));

    }
    else
    {
      objc_msgSend(v4, "setObject:forKey:", v21, CFSTR("reroutedRouteID"));
    }
  }

  v24 = *(_WORD *)(a1 + 116);
  if ((v24 & 4) != 0)
  {
    v25 = *(int *)(a1 + 84);
    if (v25 >= 8)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 84));
      v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v26 = off_1E1C0CC68[v25];
    }
    objc_msgSend(v4, "setObject:forKey:", v26, CFSTR("actionType"));

    v24 = *(_WORD *)(a1 + 116);
    if ((v24 & 8) == 0)
    {
LABEL_33:
      if ((v24 & 0x200) == 0)
        goto LABEL_34;
      goto LABEL_44;
    }
  }
  else if ((v24 & 8) == 0)
  {
    goto LABEL_33;
  }
  v27 = *(int *)(a1 + 88);
  if (v27 >= 6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 88));
    v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v28 = off_1E1C0CCA8[v27];
  }
  objc_msgSend(v4, "setObject:forKey:", v28, CFSTR("alertType"));

  v24 = *(_WORD *)(a1 + 116);
  if ((v24 & 0x200) == 0)
  {
LABEL_34:
    if ((v24 & 0x40) == 0)
      goto LABEL_52;
LABEL_45:
    v30 = *(int *)(a1 + 100);
    if (v30 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 100));
      v31 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v31 = off_1E1C0CCD8[v30];
    }
    if (a2)
      v32 = CFSTR("rerouteType");
    else
      v32 = CFSTR("reroute_type");
    objc_msgSend(v4, "setObject:forKey:", v31, v32);

    goto LABEL_52;
  }
LABEL_44:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 112));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v29, CFSTR("backgrounded"));

  if ((*(_WORD *)(a1 + 116) & 0x40) != 0)
    goto LABEL_45;
LABEL_52:
  objc_msgSend((id)a1, "responseId");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v33;
  if (v33)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v33, "base64EncodedStringWithOptions:", 0);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v35, CFSTR("responseId"));

    }
    else
    {
      objc_msgSend(v4, "setObject:forKey:", v33, CFSTR("response_id"));
    }
  }

  if ((*(_WORD *)(a1 + 116) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 16));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v37 = CFSTR("bannerDurationSeconds");
    else
      v37 = CFSTR("banner_duration_seconds");
    objc_msgSend(v4, "setObject:forKey:", v36, v37);

  }
  objc_msgSend((id)a1, "displayedBannerId");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  if (v38)
  {
    if (a2)
      v39 = CFSTR("displayedBannerId");
    else
      v39 = CFSTR("displayed_banner_id");
    objc_msgSend(v4, "setObject:forKey:", v38, v39);
  }

  if ((*(_WORD *)(a1 + 116) & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 32));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v41 = CFSTR("distanceToDestination");
    else
      v41 = CFSTR("distance_to_destination");
    objc_msgSend(v4, "setObject:forKey:", v40, v41);

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOTrafficRerouteFeedback _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOTrafficRerouteFeedback)initWithDictionary:(id)a3
{
  return (GEOTrafficRerouteFeedback *)-[GEOTrafficRerouteFeedback _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  GEORouteIncident *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  void *v27;
  id v28;
  uint64_t v29;
  void *v30;
  const __CFString *v31;
  void *v32;
  id v33;
  uint64_t v34;
  const __CFString *v35;
  void *v36;
  void *v37;
  const __CFString *v38;
  void *v39;
  const __CFString *v40;
  void *v41;
  void *v42;
  const __CFString *v43;
  void *v44;
  id v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (!a1)
    goto LABEL_107;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_107;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("oldRouteTravelTime"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setOldRouteTravelTime:", objc_msgSend(v6, "unsignedIntValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("reroutedRouteTravelTime"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setReroutedRouteTravelTime:", objc_msgSend(v7, "unsignedIntValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("oldRouteHistoricTravelTime"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setOldRouteHistoricTravelTime:", objc_msgSend(v8, "unsignedIntValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("reroutedRouteHistoricTravelTime"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setReroutedRouteHistoricTravelTime:", objc_msgSend(v9, "unsignedIntValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("oldRouteIncidents"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v46 = v5;
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    v11 = v10;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v48;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v48 != v14)
            objc_enumerationMutation(v11);
          v16 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v17 = [GEORouteIncident alloc];
            if ((a3 & 1) != 0)
              v18 = -[GEORouteIncident initWithJSON:](v17, "initWithJSON:", v16);
            else
              v18 = -[GEORouteIncident initWithDictionary:](v17, "initWithDictionary:", v16);
            v19 = (void *)v18;
            objc_msgSend(a1, "addOldRouteIncidents:", v18);

          }
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
      }
      while (v13);
    }

    v5 = v46;
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("oldRouteID"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v20, 0);
    objc_msgSend(a1, "setOldRouteID:", v21);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("reroutedRouteID"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v22, 0);
    objc_msgSend(a1, "setReroutedRouteID:", v23);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("actionType"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v25 = v24;
    if ((objc_msgSend(v25, "isEqualToString:", CFSTR("UNKNOWN_ACTION_TYPE")) & 1) != 0)
    {
      v26 = 0;
    }
    else if ((objc_msgSend(v25, "isEqualToString:", CFSTR("ACCEPTED")) & 1) != 0)
    {
      v26 = 1;
    }
    else if ((objc_msgSend(v25, "isEqualToString:", CFSTR("DISMISSED")) & 1) != 0)
    {
      v26 = 2;
    }
    else if ((objc_msgSend(v25, "isEqualToString:", CFSTR("TIMED_OUT")) & 1) != 0)
    {
      v26 = 3;
    }
    else if ((objc_msgSend(v25, "isEqualToString:", CFSTR("SHOWN")) & 1) != 0)
    {
      v26 = 4;
    }
    else if ((objc_msgSend(v25, "isEqualToString:", CFSTR("DROVE")) & 1) != 0)
    {
      v26 = 5;
    }
    else if ((objc_msgSend(v25, "isEqualToString:", CFSTR("UP_VOTE")) & 1) != 0)
    {
      v26 = 6;
    }
    else if (objc_msgSend(v25, "isEqualToString:", CFSTR("DOWN_VOTE")))
    {
      v26 = 7;
    }
    else
    {
      v26 = 0;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_51;
    v26 = objc_msgSend(v24, "intValue");
  }
  objc_msgSend(a1, "setActionType:", v26);
LABEL_51:

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("alertType"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v28 = v27;
    if ((objc_msgSend(v28, "isEqualToString:", CFSTR("UNKNOWN_ALERT_TYPE")) & 1) != 0)
    {
      v29 = 0;
    }
    else if ((objc_msgSend(v28, "isEqualToString:", CFSTR("BLOCKAGE")) & 1) != 0)
    {
      v29 = 1;
    }
    else if ((objc_msgSend(v28, "isEqualToString:", CFSTR("HEAVY_TRAFFIC_WITH_REROUTE")) & 1) != 0)
    {
      v29 = 2;
    }
    else if ((objc_msgSend(v28, "isEqualToString:", CFSTR("HEAVY_TRAFFIC_NO_REROUTE")) & 1) != 0)
    {
      v29 = 3;
    }
    else if ((objc_msgSend(v28, "isEqualToString:", CFSTR("SUGGEST_NEW_ROUTE")) & 1) != 0)
    {
      v29 = 4;
    }
    else if (objc_msgSend(v28, "isEqualToString:", CFSTR("TRAFFIC_INCIDENT")))
    {
      v29 = 5;
    }
    else
    {
      v29 = 0;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_69;
    v29 = objc_msgSend(v27, "intValue");
  }
  objc_msgSend(a1, "setAlertType:", v29);
LABEL_69:

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("backgrounded"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setBackgrounded:", objc_msgSend(v30, "BOOLValue"));

  if (a3)
    v31 = CFSTR("rerouteType");
  else
    v31 = CFSTR("reroute_type");
  objc_msgSend(v5, "objectForKeyedSubscript:", v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v33 = v32;
    if ((objc_msgSend(v33, "isEqualToString:", CFSTR("UNKNOWN_REROUTE_TYPE")) & 1) != 0)
    {
      v34 = 0;
    }
    else if ((objc_msgSend(v33, "isEqualToString:", CFSTR("LIVE_ALT_REROUTE")) & 1) != 0)
    {
      v34 = 1;
    }
    else if (objc_msgSend(v33, "isEqualToString:", CFSTR("DODGEBALL_REROUTE")))
    {
      v34 = 2;
    }
    else
    {
      v34 = 0;
    }

    goto LABEL_85;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v34 = objc_msgSend(v32, "intValue");
LABEL_85:
    objc_msgSend(a1, "setRerouteType:", v34);
  }

  if (a3)
    v35 = CFSTR("responseId");
  else
    v35 = CFSTR("response_id");
  objc_msgSend(v5, "objectForKeyedSubscript:", v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v36, 0);
    objc_msgSend(a1, "setResponseId:", v37);

  }
  if (a3)
    v38 = CFSTR("bannerDurationSeconds");
  else
    v38 = CFSTR("banner_duration_seconds");
  objc_msgSend(v5, "objectForKeyedSubscript:", v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v39, "doubleValue");
    objc_msgSend(a1, "setBannerDurationSeconds:");
  }

  if (a3)
    v40 = CFSTR("displayedBannerId");
  else
    v40 = CFSTR("displayed_banner_id");
  objc_msgSend(v5, "objectForKeyedSubscript:", v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v42 = (void *)objc_msgSend(v41, "copy");
    objc_msgSend(a1, "setDisplayedBannerId:", v42);

  }
  if (a3)
    v43 = CFSTR("distanceToDestination");
  else
    v43 = CFSTR("distance_to_destination");
  objc_msgSend(v5, "objectForKeyedSubscript:", v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v44, "doubleValue");
    objc_msgSend(a1, "setDistanceToDestination:");
  }

LABEL_107:
  return a1;
}

- (GEOTrafficRerouteFeedback)initWithJSON:(id)a3
{
  return (GEOTrafficRerouteFeedback *)-[GEOTrafficRerouteFeedback _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_1179;
    else
      v8 = (int *)&readAll__nonRecursiveTag_1180;
    GEOTrafficRerouteFeedbackReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEOTrafficRerouteFeedbackCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOTrafficRerouteFeedbackIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOTrafficRerouteFeedbackReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  __int16 flags;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int16 v11;
  PBDataReader *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader)
  {
    os_unfair_lock_assert_owner(&self->_readerLock);
    if (*(_WORD *)&self->_flags <= 0x3FFu)
    {
      v12 = self->_reader;
      objc_sync_enter(v12);
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "writeData:", v13);
      os_unfair_lock_unlock(p_readerLock);

      objc_sync_exit(v12);
      goto LABEL_40;
    }
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOTrafficRerouteFeedback readAll:](self, "readAll:", 0);
  flags = (__int16)self->_flags;
  if ((flags & 0x20) != 0)
  {
    PBDataWriterWriteUint32Field();
    flags = (__int16)self->_flags;
    if ((flags & 0x100) == 0)
    {
LABEL_5:
      if ((flags & 0x10) == 0)
        goto LABEL_6;
LABEL_37:
      PBDataWriterWriteUint32Field();
      if ((*(_WORD *)&self->_flags & 0x80) == 0)
        goto LABEL_8;
      goto LABEL_7;
    }
  }
  else if ((*(_WORD *)&self->_flags & 0x100) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteUint32Field();
  flags = (__int16)self->_flags;
  if ((flags & 0x10) != 0)
    goto LABEL_37;
LABEL_6:
  if ((flags & 0x80) != 0)
LABEL_7:
    PBDataWriterWriteUint32Field();
LABEL_8:
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = self->_oldRouteIncidents;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v7);
        PBDataWriterWriteSubmessage();
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  if (self->_oldRouteID)
    PBDataWriterWriteDataField();
  if (self->_reroutedRouteID)
    PBDataWriterWriteDataField();
  v11 = (__int16)self->_flags;
  if ((v11 & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    v11 = (__int16)self->_flags;
  }
  if ((v11 & 8) != 0)
  {
    PBDataWriterWriteInt32Field();
    v11 = (__int16)self->_flags;
  }
  if ((v11 & 0x200) != 0)
  {
    PBDataWriterWriteBOOLField();
    v11 = (__int16)self->_flags;
  }
  if ((v11 & 0x40) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_responseId)
    PBDataWriterWriteDataField();
  if ((*(_WORD *)&self->_flags & 1) != 0)
    PBDataWriterWriteDoubleField();
  if (self->_displayedBannerId)
    PBDataWriterWriteStringField();
  if ((*(_WORD *)&self->_flags & 2) != 0)
    PBDataWriterWriteDoubleField();
LABEL_40:

}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  BOOL v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  -[GEOTrafficRerouteFeedback _readOldRouteIncidents]((uint64_t)self);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_oldRouteIncidents;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "hasGreenTeaWithValue:", v3, (_QWORD)v12) & 1) != 0)
        {
          v10 = 1;
          goto LABEL_11;
        }
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v7)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (void)copyTo:(id)a3
{
  __int16 flags;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  void *v8;
  id *v9;
  __int16 v10;
  id *v11;

  v11 = (id *)a3;
  -[GEOTrafficRerouteFeedback readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v11 + 1, self->_reader);
  *((_DWORD *)v11 + 18) = self->_readerMarkPos;
  *((_DWORD *)v11 + 19) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  flags = (__int16)self->_flags;
  if ((flags & 0x20) != 0)
  {
    *((_DWORD *)v11 + 24) = self->_oldRouteTravelTime;
    *((_WORD *)v11 + 58) |= 0x20u;
    flags = (__int16)self->_flags;
    if ((flags & 0x100) == 0)
    {
LABEL_3:
      if ((flags & 0x10) == 0)
        goto LABEL_4;
LABEL_30:
      *((_DWORD *)v11 + 23) = self->_oldRouteHistoricTravelTime;
      *((_WORD *)v11 + 58) |= 0x10u;
      if ((*(_WORD *)&self->_flags & 0x80) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*(_WORD *)&self->_flags & 0x100) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v11 + 27) = self->_reroutedRouteTravelTime;
  *((_WORD *)v11 + 58) |= 0x100u;
  flags = (__int16)self->_flags;
  if ((flags & 0x10) != 0)
    goto LABEL_30;
LABEL_4:
  if ((flags & 0x80) != 0)
  {
LABEL_5:
    *((_DWORD *)v11 + 26) = self->_reroutedRouteHistoricTravelTime;
    *((_WORD *)v11 + 58) |= 0x80u;
  }
LABEL_6:
  if (-[GEOTrafficRerouteFeedback oldRouteIncidentsCount](self, "oldRouteIncidentsCount"))
  {
    objc_msgSend(v11, "clearOldRouteIncidents");
    v5 = -[GEOTrafficRerouteFeedback oldRouteIncidentsCount](self, "oldRouteIncidentsCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        -[GEOTrafficRerouteFeedback oldRouteIncidentsAtIndex:](self, "oldRouteIncidentsAtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addOldRouteIncidents:", v8);

      }
    }
  }
  if (self->_oldRouteID)
    objc_msgSend(v11, "setOldRouteID:");
  v9 = v11;
  if (self->_reroutedRouteID)
  {
    objc_msgSend(v11, "setReroutedRouteID:");
    v9 = v11;
  }
  v10 = (__int16)self->_flags;
  if ((v10 & 4) != 0)
  {
    *((_DWORD *)v9 + 21) = self->_actionType;
    *((_WORD *)v9 + 58) |= 4u;
    v10 = (__int16)self->_flags;
    if ((v10 & 8) == 0)
    {
LABEL_16:
      if ((v10 & 0x200) == 0)
        goto LABEL_17;
      goto LABEL_34;
    }
  }
  else if ((v10 & 8) == 0)
  {
    goto LABEL_16;
  }
  *((_DWORD *)v9 + 22) = self->_alertType;
  *((_WORD *)v9 + 58) |= 8u;
  v10 = (__int16)self->_flags;
  if ((v10 & 0x200) == 0)
  {
LABEL_17:
    if ((v10 & 0x40) == 0)
      goto LABEL_19;
    goto LABEL_18;
  }
LABEL_34:
  *((_BYTE *)v9 + 112) = self->_backgrounded;
  *((_WORD *)v9 + 58) |= 0x200u;
  if ((*(_WORD *)&self->_flags & 0x40) != 0)
  {
LABEL_18:
    *((_DWORD *)v9 + 25) = self->_rerouteType;
    *((_WORD *)v9 + 58) |= 0x40u;
  }
LABEL_19:
  if (self->_responseId)
  {
    objc_msgSend(v11, "setResponseId:");
    v9 = v11;
  }
  if ((*(_WORD *)&self->_flags & 1) != 0)
  {
    v9[2] = *(id *)&self->_bannerDurationSeconds;
    *((_WORD *)v9 + 58) |= 1u;
  }
  if (self->_displayedBannerId)
  {
    objc_msgSend(v11, "setDisplayedBannerId:");
    v9 = v11;
  }
  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    v9[4] = *(id *)&self->_distanceToDestination;
    *((_WORD *)v9 + 58) |= 2u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  __int16 flags;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  __int16 v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x80000000) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOTrafficRerouteFeedbackReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOTrafficRerouteFeedback readAll:](self, "readAll:", 0);
  flags = (__int16)self->_flags;
  if ((flags & 0x20) != 0)
  {
    *(_DWORD *)(v5 + 96) = self->_oldRouteTravelTime;
    *(_WORD *)(v5 + 116) |= 0x20u;
    flags = (__int16)self->_flags;
    if ((flags & 0x100) == 0)
    {
LABEL_7:
      if ((flags & 0x10) == 0)
        goto LABEL_8;
      goto LABEL_29;
    }
  }
  else if ((*(_WORD *)&self->_flags & 0x100) == 0)
  {
    goto LABEL_7;
  }
  *(_DWORD *)(v5 + 108) = self->_reroutedRouteTravelTime;
  *(_WORD *)(v5 + 116) |= 0x100u;
  flags = (__int16)self->_flags;
  if ((flags & 0x10) == 0)
  {
LABEL_8:
    if ((flags & 0x80) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
LABEL_29:
  *(_DWORD *)(v5 + 92) = self->_oldRouteHistoricTravelTime;
  *(_WORD *)(v5 + 116) |= 0x10u;
  if ((*(_WORD *)&self->_flags & 0x80) != 0)
  {
LABEL_9:
    *(_DWORD *)(v5 + 104) = self->_reroutedRouteHistoricTravelTime;
    *(_WORD *)(v5 + 116) |= 0x80u;
  }
LABEL_10:
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v10 = self->_oldRouteIncidents;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v26 != v12)
          objc_enumerationMutation(v10);
        v14 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v25);
        objc_msgSend((id)v5, "addOldRouteIncidents:", v14);

      }
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v11);
  }

  v15 = -[NSData copyWithZone:](self->_oldRouteID, "copyWithZone:", a3);
  v16 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v15;

  v17 = -[NSData copyWithZone:](self->_reroutedRouteID, "copyWithZone:", a3);
  v18 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v17;

  v19 = (__int16)self->_flags;
  if ((v19 & 4) != 0)
  {
    *(_DWORD *)(v5 + 84) = self->_actionType;
    *(_WORD *)(v5 + 116) |= 4u;
    v19 = (__int16)self->_flags;
    if ((v19 & 8) == 0)
    {
LABEL_19:
      if ((v19 & 0x200) == 0)
        goto LABEL_20;
LABEL_33:
      *(_BYTE *)(v5 + 112) = self->_backgrounded;
      *(_WORD *)(v5 + 116) |= 0x200u;
      if ((*(_WORD *)&self->_flags & 0x40) == 0)
        goto LABEL_22;
      goto LABEL_21;
    }
  }
  else if ((v19 & 8) == 0)
  {
    goto LABEL_19;
  }
  *(_DWORD *)(v5 + 88) = self->_alertType;
  *(_WORD *)(v5 + 116) |= 8u;
  v19 = (__int16)self->_flags;
  if ((v19 & 0x200) != 0)
    goto LABEL_33;
LABEL_20:
  if ((v19 & 0x40) != 0)
  {
LABEL_21:
    *(_DWORD *)(v5 + 100) = self->_rerouteType;
    *(_WORD *)(v5 + 116) |= 0x40u;
  }
LABEL_22:
  v20 = -[NSData copyWithZone:](self->_responseId, "copyWithZone:", a3, (_QWORD)v25);
  v21 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v20;

  if ((*(_WORD *)&self->_flags & 1) != 0)
  {
    *(double *)(v5 + 16) = self->_bannerDurationSeconds;
    *(_WORD *)(v5 + 116) |= 1u;
  }
  v22 = -[NSString copyWithZone:](self->_displayedBannerId, "copyWithZone:", a3);
  v23 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v22;

  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    *(double *)(v5 + 32) = self->_distanceToDestination;
    *(_WORD *)(v5 + 116) |= 2u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  __int16 flags;
  __int16 v6;
  NSMutableArray *oldRouteIncidents;
  NSData *oldRouteID;
  NSData *reroutedRouteID;
  __int16 v10;
  __int16 v11;
  NSData *responseId;
  NSString *displayedBannerId;
  BOOL v14;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_67;
  -[GEOTrafficRerouteFeedback readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  flags = (__int16)self->_flags;
  v6 = *((_WORD *)v4 + 58);
  if ((flags & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_oldRouteTravelTime != *((_DWORD *)v4 + 24))
      goto LABEL_67;
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_67;
  }
  if ((*(_WORD *)&self->_flags & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 58) & 0x100) == 0 || self->_reroutedRouteTravelTime != *((_DWORD *)v4 + 27))
      goto LABEL_67;
  }
  else if ((*((_WORD *)v4 + 58) & 0x100) != 0)
  {
    goto LABEL_67;
  }
  if ((flags & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_oldRouteHistoricTravelTime != *((_DWORD *)v4 + 23))
      goto LABEL_67;
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_67;
  }
  if ((flags & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_reroutedRouteHistoricTravelTime != *((_DWORD *)v4 + 26))
      goto LABEL_67;
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_67;
  }
  oldRouteIncidents = self->_oldRouteIncidents;
  if ((unint64_t)oldRouteIncidents | *((_QWORD *)v4 + 6)
    && !-[NSMutableArray isEqual:](oldRouteIncidents, "isEqual:"))
  {
    goto LABEL_67;
  }
  oldRouteID = self->_oldRouteID;
  if ((unint64_t)oldRouteID | *((_QWORD *)v4 + 5))
  {
    if (!-[NSData isEqual:](oldRouteID, "isEqual:"))
      goto LABEL_67;
  }
  reroutedRouteID = self->_reroutedRouteID;
  if ((unint64_t)reroutedRouteID | *((_QWORD *)v4 + 7))
  {
    if (!-[NSData isEqual:](reroutedRouteID, "isEqual:"))
      goto LABEL_67;
  }
  v10 = (__int16)self->_flags;
  v11 = *((_WORD *)v4 + 58);
  if ((v10 & 4) != 0)
  {
    if ((v11 & 4) == 0 || self->_actionType != *((_DWORD *)v4 + 21))
      goto LABEL_67;
  }
  else if ((v11 & 4) != 0)
  {
    goto LABEL_67;
  }
  if ((v10 & 8) != 0)
  {
    if ((v11 & 8) == 0 || self->_alertType != *((_DWORD *)v4 + 22))
      goto LABEL_67;
  }
  else if ((v11 & 8) != 0)
  {
    goto LABEL_67;
  }
  if ((*(_WORD *)&self->_flags & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 58) & 0x200) == 0)
      goto LABEL_67;
    if (self->_backgrounded)
    {
      if (!*((_BYTE *)v4 + 112))
        goto LABEL_67;
    }
    else if (*((_BYTE *)v4 + 112))
    {
      goto LABEL_67;
    }
  }
  else if ((*((_WORD *)v4 + 58) & 0x200) != 0)
  {
    goto LABEL_67;
  }
  if ((v10 & 0x40) != 0)
  {
    if ((v11 & 0x40) == 0 || self->_rerouteType != *((_DWORD *)v4 + 25))
      goto LABEL_67;
  }
  else if ((v11 & 0x40) != 0)
  {
    goto LABEL_67;
  }
  responseId = self->_responseId;
  if ((unint64_t)responseId | *((_QWORD *)v4 + 8))
  {
    if (!-[NSData isEqual:](responseId, "isEqual:"))
      goto LABEL_67;
    v10 = (__int16)self->_flags;
    v11 = *((_WORD *)v4 + 58);
  }
  if ((v10 & 1) != 0)
  {
    if ((v11 & 1) == 0 || self->_bannerDurationSeconds != *((double *)v4 + 2))
      goto LABEL_67;
  }
  else if ((v11 & 1) != 0)
  {
    goto LABEL_67;
  }
  displayedBannerId = self->_displayedBannerId;
  if ((unint64_t)displayedBannerId | *((_QWORD *)v4 + 3))
  {
    if (-[NSString isEqual:](displayedBannerId, "isEqual:"))
    {
      v10 = (__int16)self->_flags;
      v11 = *((_WORD *)v4 + 58);
      goto LABEL_62;
    }
LABEL_67:
    v14 = 0;
    goto LABEL_68;
  }
LABEL_62:
  if ((v10 & 2) != 0)
  {
    if ((v11 & 2) == 0 || self->_distanceToDestination != *((double *)v4 + 4))
      goto LABEL_67;
    v14 = 1;
  }
  else
  {
    v14 = (v11 & 2) == 0;
  }
LABEL_68:

  return v14;
}

- (unint64_t)hash
{
  __int16 flags;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  double bannerDurationSeconds;
  double v12;
  long double v13;
  double v14;
  NSUInteger v15;
  unint64_t v16;
  double distanceToDestination;
  double v18;
  long double v19;
  double v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  -[GEOTrafficRerouteFeedback readAll:](self, "readAll:", 1);
  flags = (__int16)self->_flags;
  if ((flags & 0x20) != 0)
  {
    v28 = 2654435761 * self->_oldRouteTravelTime;
    if ((*(_WORD *)&self->_flags & 0x100) != 0)
    {
LABEL_3:
      v27 = 2654435761 * self->_reroutedRouteTravelTime;
      if ((flags & 0x10) != 0)
        goto LABEL_4;
LABEL_8:
      v26 = 0;
      if ((flags & 0x80) != 0)
        goto LABEL_5;
      goto LABEL_9;
    }
  }
  else
  {
    v28 = 0;
    if ((*(_WORD *)&self->_flags & 0x100) != 0)
      goto LABEL_3;
  }
  v27 = 0;
  if ((flags & 0x10) == 0)
    goto LABEL_8;
LABEL_4:
  v26 = 2654435761 * self->_oldRouteHistoricTravelTime;
  if ((flags & 0x80) != 0)
  {
LABEL_5:
    v25 = 2654435761 * self->_reroutedRouteHistoricTravelTime;
    goto LABEL_10;
  }
LABEL_9:
  v25 = 0;
LABEL_10:
  v24 = -[NSMutableArray hash](self->_oldRouteIncidents, "hash");
  v23 = -[NSData hash](self->_oldRouteID, "hash");
  v22 = -[NSData hash](self->_reroutedRouteID, "hash");
  v4 = (__int16)self->_flags;
  if ((v4 & 4) != 0)
  {
    v5 = 2654435761 * self->_actionType;
    if ((v4 & 8) != 0)
    {
LABEL_12:
      v6 = 2654435761 * self->_alertType;
      if ((*(_WORD *)&self->_flags & 0x200) != 0)
        goto LABEL_13;
LABEL_17:
      v7 = 0;
      if ((v4 & 0x40) != 0)
        goto LABEL_14;
      goto LABEL_18;
    }
  }
  else
  {
    v5 = 0;
    if ((v4 & 8) != 0)
      goto LABEL_12;
  }
  v6 = 0;
  if ((*(_WORD *)&self->_flags & 0x200) == 0)
    goto LABEL_17;
LABEL_13:
  v7 = 2654435761 * self->_backgrounded;
  if ((v4 & 0x40) != 0)
  {
LABEL_14:
    v8 = 2654435761 * self->_rerouteType;
    goto LABEL_19;
  }
LABEL_18:
  v8 = 0;
LABEL_19:
  v9 = -[NSData hash](self->_responseId, "hash");
  if ((*(_WORD *)&self->_flags & 1) != 0)
  {
    bannerDurationSeconds = self->_bannerDurationSeconds;
    v12 = -bannerDurationSeconds;
    if (bannerDurationSeconds >= 0.0)
      v12 = self->_bannerDurationSeconds;
    v13 = floor(v12 + 0.5);
    v14 = (v12 - v13) * 1.84467441e19;
    v10 = 2654435761u * (unint64_t)fmod(v13, 1.84467441e19);
    if (v14 >= 0.0)
    {
      if (v14 > 0.0)
        v10 += (unint64_t)v14;
    }
    else
    {
      v10 -= (unint64_t)fabs(v14);
    }
  }
  else
  {
    v10 = 0;
  }
  v15 = -[NSString hash](self->_displayedBannerId, "hash");
  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    distanceToDestination = self->_distanceToDestination;
    v18 = -distanceToDestination;
    if (distanceToDestination >= 0.0)
      v18 = self->_distanceToDestination;
    v19 = floor(v18 + 0.5);
    v20 = (v18 - v19) * 1.84467441e19;
    v16 = 2654435761u * (unint64_t)fmod(v19, 1.84467441e19);
    if (v20 >= 0.0)
    {
      if (v20 > 0.0)
        v16 += (unint64_t)v20;
    }
    else
    {
      v16 -= (unint64_t)fabs(v20);
    }
  }
  else
  {
    v16 = 0;
  }
  return v27 ^ v28 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v15 ^ v16;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  __int16 v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int16 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  v5 = *((_WORD *)v4 + 58);
  if ((v5 & 0x20) != 0)
  {
    self->_oldRouteTravelTime = *((_DWORD *)v4 + 24);
    *(_WORD *)&self->_flags |= 0x20u;
    v5 = *((_WORD *)v4 + 58);
    if ((v5 & 0x100) == 0)
    {
LABEL_3:
      if ((v5 & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_33;
    }
  }
  else if ((*((_WORD *)v4 + 58) & 0x100) == 0)
  {
    goto LABEL_3;
  }
  self->_reroutedRouteTravelTime = *((_DWORD *)v4 + 27);
  *(_WORD *)&self->_flags |= 0x100u;
  v5 = *((_WORD *)v4 + 58);
  if ((v5 & 0x10) == 0)
  {
LABEL_4:
    if ((v5 & 0x80) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_33:
  self->_oldRouteHistoricTravelTime = *((_DWORD *)v4 + 23);
  *(_WORD *)&self->_flags |= 0x10u;
  if ((*((_WORD *)v4 + 58) & 0x80) != 0)
  {
LABEL_5:
    self->_reroutedRouteHistoricTravelTime = *((_DWORD *)v4 + 26);
    *(_WORD *)&self->_flags |= 0x80u;
  }
LABEL_6:
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = *((id *)v4 + 6);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        -[GEOTrafficRerouteFeedback addOldRouteIncidents:](self, "addOldRouteIncidents:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i), (_QWORD)v12);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

  if (*((_QWORD *)v4 + 5))
    -[GEOTrafficRerouteFeedback setOldRouteID:](self, "setOldRouteID:");
  if (*((_QWORD *)v4 + 7))
    -[GEOTrafficRerouteFeedback setReroutedRouteID:](self, "setReroutedRouteID:");
  v11 = *((_WORD *)v4 + 58);
  if ((v11 & 4) != 0)
  {
    self->_actionType = *((_DWORD *)v4 + 21);
    *(_WORD *)&self->_flags |= 4u;
    v11 = *((_WORD *)v4 + 58);
    if ((v11 & 8) == 0)
    {
LABEL_19:
      if ((v11 & 0x200) == 0)
        goto LABEL_20;
      goto LABEL_37;
    }
  }
  else if ((v11 & 8) == 0)
  {
    goto LABEL_19;
  }
  self->_alertType = *((_DWORD *)v4 + 22);
  *(_WORD *)&self->_flags |= 8u;
  v11 = *((_WORD *)v4 + 58);
  if ((v11 & 0x200) == 0)
  {
LABEL_20:
    if ((v11 & 0x40) == 0)
      goto LABEL_22;
    goto LABEL_21;
  }
LABEL_37:
  self->_backgrounded = *((_BYTE *)v4 + 112);
  *(_WORD *)&self->_flags |= 0x200u;
  if ((*((_WORD *)v4 + 58) & 0x40) != 0)
  {
LABEL_21:
    self->_rerouteType = *((_DWORD *)v4 + 25);
    *(_WORD *)&self->_flags |= 0x40u;
  }
LABEL_22:
  if (*((_QWORD *)v4 + 8))
    -[GEOTrafficRerouteFeedback setResponseId:](self, "setResponseId:");
  if ((*((_WORD *)v4 + 58) & 1) != 0)
  {
    self->_bannerDurationSeconds = *((double *)v4 + 2);
    *(_WORD *)&self->_flags |= 1u;
  }
  if (*((_QWORD *)v4 + 3))
    -[GEOTrafficRerouteFeedback setDisplayedBannerId:](self, "setDisplayedBannerId:");
  if ((*((_WORD *)v4 + 58) & 2) != 0)
  {
    self->_distanceToDestination = *((double *)v4 + 4);
    *(_WORD *)&self->_flags |= 2u;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseId, 0);
  objc_storeStrong((id *)&self->_reroutedRouteID, 0);
  objc_storeStrong((id *)&self->_oldRouteIncidents, 0);
  objc_storeStrong((id *)&self->_oldRouteID, 0);
  objc_storeStrong((id *)&self->_displayedBannerId, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
