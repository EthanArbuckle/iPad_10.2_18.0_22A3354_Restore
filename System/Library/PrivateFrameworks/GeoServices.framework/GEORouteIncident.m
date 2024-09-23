@implementation GEORouteIncident

- (GEORouteIncident)init
{
  GEORouteIncident *v2;
  GEORouteIncident *v3;
  GEORouteIncident *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEORouteIncident;
  v2 = -[GEORouteIncident init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORouteIncident)initWithData:(id)a3
{
  GEORouteIncident *v3;
  GEORouteIncident *v4;
  GEORouteIncident *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEORouteIncident;
  v3 = -[GEORouteIncident initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readPosition
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_BYTE *)(a1 + 154) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORouteIncidentReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPosition_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (BOOL)hasPosition
{
  -[GEORouteIncident _readPosition]((uint64_t)self);
  return self->_position != 0;
}

- (GEOLatLng)position
{
  -[GEORouteIncident _readPosition]((uint64_t)self);
  return self->_position;
}

- (void)setPosition:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x110000u;
  objc_storeStrong((id *)&self->_position, a3);
}

- (void)_readIncidentId
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_BYTE *)(a1 + 153) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORouteIncidentReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readIncidentId_tags_1);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (BOOL)hasIncidentId
{
  -[GEORouteIncident _readIncidentId]((uint64_t)self);
  return self->_incidentId != 0;
}

- (NSString)incidentId
{
  -[GEORouteIncident _readIncidentId]((uint64_t)self);
  return self->_incidentId;
}

- (void)setIncidentId:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x104000u;
  objc_storeStrong((id *)&self->_incidentId, a3);
}

- (void)_readInfo
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_BYTE *)(a1 + 153) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORouteIncidentReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readInfo_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (BOOL)hasInfo
{
  -[GEORouteIncident _readInfo]((uint64_t)self);
  return self->_info != 0;
}

- (NSString)info
{
  -[GEORouteIncident _readInfo]((uint64_t)self);
  return self->_info;
}

- (void)setInfo:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x108000u;
  objc_storeStrong((id *)&self->_info, a3);
}

- (int)type
{
  os_unfair_lock_s *p_readerLock;
  $24DAC98BB42E806208BFDF9810E4926F flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_BYTE *)&flags & 0x80) != 0)
    return self->_type;
  else
    return 0;
}

- (void)setType:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x100080u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1048704;
  else
    v3 = 0x100000;
  self->_flags = ($24DAC98BB42E806208BFDF9810E4926F)(*(_DWORD *)&self->_flags & 0xFFFFFF7F | v3);
}

- (BOOL)hasType
{
  return *(_BYTE *)&self->_flags >> 7;
}

- (id)typeAsString:(int)a3
{
  __CFString *v3;

  v3 = CFSTR("ACCIDENT");
  switch(a3)
  {
    case 0:
      return v3;
    case 1:
      v3 = CFSTR("CONSTRUCTION");
      return v3;
    case 2:
      return CFSTR("ROAD_CLOSURE");
    case 3:
      return CFSTR("EVENT");
    case 4:
      return CFSTR("HAZARD");
    case 5:
      return CFSTR("LANE_CLOSURE");
    case 6:
      return CFSTR("RAMP_CLOSURE");
    case 7:
      return CFSTR("TRAFFIC");
    case 8:
      return CFSTR("WALKING_CLOSURE");
    case 9:
      return CFSTR("CONGESTION_ZONE_RESTRICTION");
    case 10:
      return CFSTR("LICENSE_PLATE_RESTRICTION");
    case 11:
    case 12:
      goto LABEL_7;
    case 13:
      return CFSTR("SPEED_TRAP");
    case 14:
      return CFSTR("AREA_INCIDENT");
    default:
      if (a3 == 100)
        return CFSTR("TIME_BASED_RESTRICTION");
LABEL_7:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
      return v3;
  }
}

- (int)StringAsType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ACCIDENT")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CONSTRUCTION")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ROAD_CLOSURE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EVENT")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HAZARD")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LANE_CLOSURE")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAMP_CLOSURE")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRAFFIC")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WALKING_CLOSURE")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CONGESTION_ZONE_RESTRICTION")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LICENSE_PLATE_RESTRICTION")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SPEED_TRAP")) & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AREA_INCIDENT")) & 1) != 0)
  {
    v4 = 14;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("TIME_BASED_RESTRICTION")))
  {
    v4 = 100;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_readStreet
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_BYTE *)(a1 + 154) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORouteIncidentReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readStreet_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (BOOL)hasStreet
{
  -[GEORouteIncident _readStreet]((uint64_t)self);
  return self->_street != 0;
}

- (NSString)street
{
  -[GEORouteIncident _readStreet]((uint64_t)self);
  return self->_street;
}

- (void)setStreet:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x140000u;
  objc_storeStrong((id *)&self->_street, a3);
}

- (void)_readCrossStreet
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_BYTE *)(a1 + 153) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORouteIncidentReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCrossStreet_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (BOOL)hasCrossStreet
{
  -[GEORouteIncident _readCrossStreet]((uint64_t)self);
  return self->_crossStreet != 0;
}

- (NSString)crossStreet
{
  -[GEORouteIncident _readCrossStreet]((uint64_t)self);
  return self->_crossStreet;
}

- (void)setCrossStreet:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x102000u;
  objc_storeStrong((id *)&self->_crossStreet, a3);
}

- (int64_t)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(int64_t)a3
{
  *(_DWORD *)&self->_flags |= 0x100002u;
  self->_startTime = a3;
}

- (void)setHasStartTime:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1048578;
  else
    v3 = 0x100000;
  self->_flags = ($24DAC98BB42E806208BFDF9810E4926F)(*(_DWORD *)&self->_flags & 0xFFFFFFFD | v3);
}

- (BOOL)hasStartTime
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (int64_t)endTime
{
  return self->_endTime;
}

- (void)setEndTime:(int64_t)a3
{
  *(_DWORD *)&self->_flags |= 0x100001u;
  self->_endTime = a3;
}

- (void)setHasEndTime:(BOOL)a3
{
  self->_flags = ($24DAC98BB42E806208BFDF9810E4926F)(*(_DWORD *)&self->_flags & 0xFFFFFFFE | a3 | 0x100000);
}

- (BOOL)hasEndTime
{
  return *(_DWORD *)&self->_flags & 1;
}

- (int64_t)updateTime
{
  return self->_updateTime;
}

- (void)setUpdateTime:(int64_t)a3
{
  *(_DWORD *)&self->_flags |= 0x100004u;
  self->_updateTime = a3;
}

- (void)setHasUpdateTime:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1048580;
  else
    v3 = 0x100000;
  self->_flags = ($24DAC98BB42E806208BFDF9810E4926F)(*(_DWORD *)&self->_flags & 0xFFFFFFFB | v3);
}

- (BOOL)hasUpdateTime
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (int)laneClosureType
{
  os_unfair_lock_s *p_readerLock;
  $24DAC98BB42E806208BFDF9810E4926F flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_BYTE *)&flags & 0x20) != 0)
    return self->_laneClosureType;
  else
    return 1;
}

- (void)setLaneClosureType:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x100020u;
  self->_laneClosureType = a3;
}

- (void)setHasLaneClosureType:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1048608;
  else
    v3 = 0x100000;
  self->_flags = ($24DAC98BB42E806208BFDF9810E4926F)(*(_DWORD *)&self->_flags & 0xFFFFFFDF | v3);
}

- (BOOL)hasLaneClosureType
{
  return (*(_BYTE *)&self->_flags >> 5) & 1;
}

- (id)laneClosureTypeAsString:(int)a3
{
  if ((a3 - 1) < 9)
    return off_1E1C08628[a3 - 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsLaneClosureType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LEFT_LANE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CENTER_LANE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RIGHT_LANE")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SHOULDER_LANE")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CARPOOL_LANE")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BUS_LANE")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("OTHER_LANE")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ON_RAMP")) & 1) != 0)
  {
    v4 = 8;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("OFF_RAMP")))
  {
    v4 = 9;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (unsigned)laneClosureCount
{
  return self->_laneClosureCount;
}

- (void)setLaneClosureCount:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x100010u;
  self->_laneClosureCount = a3;
}

- (void)setHasLaneClosureCount:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1048592;
  else
    v3 = 0x100000;
  self->_flags = ($24DAC98BB42E806208BFDF9810E4926F)(*(_DWORD *)&self->_flags & 0xFFEFFFEF | v3);
}

- (BOOL)hasLaneClosureCount
{
  return (*(_BYTE *)&self->_flags >> 4) & 1;
}

- (BOOL)endTimeReliable
{
  return self->_endTimeReliable;
}

- (void)setEndTimeReliable:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x100200u;
  self->_endTimeReliable = a3;
}

- (void)setHasEndTimeReliable:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1049088;
  else
    v3 = 0x100000;
  self->_flags = ($24DAC98BB42E806208BFDF9810E4926F)(*(_DWORD *)&self->_flags & 0xFFFFFDFF | v3);
}

- (BOOL)hasEndTimeReliable
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 1) & 1;
}

- (int)significance
{
  os_unfair_lock_s *p_readerLock;
  $24DAC98BB42E806208BFDF9810E4926F flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_BYTE *)&flags & 0x40) != 0)
    return self->_significance;
  else
    return 0;
}

- (void)setSignificance:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x100040u;
  self->_significance = a3;
}

- (void)setHasSignificance:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1048640;
  else
    v3 = 0x100000;
  self->_flags = ($24DAC98BB42E806208BFDF9810E4926F)(*(_DWORD *)&self->_flags & 0xFFFFFFBF | v3);
}

- (BOOL)hasSignificance
{
  return (*(_BYTE *)&self->_flags >> 6) & 1;
}

- (id)significanceAsString:(int)a3
{
  if (a3 < 6)
    return off_1E1C08670[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsSignificance:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_IMPACT")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LOW_IMPACT")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MODERATE_LOCAL_IMPACT")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HIGH_LOCAL_IMPACT")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MODERATE_REGIONAL_IMPACT")) & 1) != 0)
  {
    v4 = 4;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("WIDE_REGIONAL_IMPACT")))
  {
    v4 = 5;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_readRestrictionInfo
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_BYTE *)(a1 + 154) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORouteIncidentReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRestrictionInfo_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (BOOL)hasRestrictionInfo
{
  -[GEORouteIncident _readRestrictionInfo]((uint64_t)self);
  return self->_restrictionInfo != 0;
}

- (GEORestrictionInfo)restrictionInfo
{
  -[GEORouteIncident _readRestrictionInfo]((uint64_t)self);
  return self->_restrictionInfo;
}

- (void)setRestrictionInfo:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x120000u;
  objc_storeStrong((id *)&self->_restrictionInfo, a3);
}

- (unsigned)userReportsCount
{
  return self->_userReportsCount;
}

- (void)setUserReportsCount:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x100100u;
  self->_userReportsCount = a3;
}

- (void)setHasUserReportsCount:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1048832;
  else
    v3 = 0x100000;
  self->_flags = ($24DAC98BB42E806208BFDF9810E4926F)(*(_DWORD *)&self->_flags & 0xFFFFFEFF | v3);
}

- (BOOL)hasUserReportsCount
{
  return *((_BYTE *)&self->_flags + 1) & 1;
}

- (BOOL)shouldDisplayOnMap
{
  os_unfair_lock_s *p_readerLock;
  $24DAC98BB42E806208BFDF9810E4926F flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  return (*(_WORD *)&flags & 0x400) == 0 || self->_shouldDisplayOnMap;
}

- (void)setShouldDisplayOnMap:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x100400u;
  self->_shouldDisplayOnMap = a3;
}

- (void)setHasShouldDisplayOnMap:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1049600;
  else
    v3 = 0x100000;
  self->_flags = ($24DAC98BB42E806208BFDF9810E4926F)(*(_DWORD *)&self->_flags & 0xFFFFFBFF | v3);
}

- (BOOL)hasShouldDisplayOnMap
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 2) & 1;
}

- (void)_readUserReportIds
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_BYTE *)(a1 + 154) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORouteIncidentReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readUserReportIds_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (NSMutableArray)userReportIds
{
  -[GEORouteIncident _readUserReportIds]((uint64_t)self);
  return self->_userReportIds;
}

- (void)setUserReportIds:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *userReportIds;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x80000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x100000u;
  userReportIds = self->_userReportIds;
  self->_userReportIds = v4;

}

- (void)clearUserReportIds
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x80000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x100000u;
  -[NSMutableArray removeAllObjects](self->_userReportIds, "removeAllObjects");
}

- (void)addUserReportId:(id)a3
{
  id v4;

  v4 = a3;
  -[GEORouteIncident _readUserReportIds]((uint64_t)self);
  -[GEORouteIncident _addNoFlagsUserReportId:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x80000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x100000u;
}

- (void)_addNoFlagsUserReportId:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 104);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 104);
      *(_QWORD *)(a1 + 104) = v5;

      v4 = *(void **)(a1 + 104);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)userReportIdsCount
{
  -[GEORouteIncident _readUserReportIds]((uint64_t)self);
  return -[NSMutableArray count](self->_userReportIds, "count");
}

- (id)userReportIdAtIndex:(unint64_t)a3
{
  -[GEORouteIncident _readUserReportIds]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_userReportIds, "objectAtIndex:", a3);
}

+ (Class)userReportIdType
{
  return (Class)objc_opt_class();
}

- (unsigned)delaySeconds
{
  return self->_delaySeconds;
}

- (void)setDelaySeconds:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x100008u;
  self->_delaySeconds = a3;
}

- (void)setHasDelaySeconds:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1048584;
  else
    v3 = 0x100000;
  self->_flags = ($24DAC98BB42E806208BFDF9810E4926F)(*(_DWORD *)&self->_flags & 0xFFFFFFF7 | v3);
}

- (BOOL)hasDelaySeconds
{
  return (*(_BYTE *)&self->_flags >> 3) & 1;
}

- (void)_readArtwork
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_BYTE *)(a1 + 153) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORouteIncidentReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readArtwork_tags_5148);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (BOOL)hasArtwork
{
  -[GEORouteIncident _readArtwork]((uint64_t)self);
  return self->_artwork != 0;
}

- (GEOPBTransitArtwork)artwork
{
  -[GEORouteIncident _readArtwork]((uint64_t)self);
  return self->_artwork;
}

- (void)setArtwork:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x101000u;
  objc_storeStrong((id *)&self->_artwork, a3);
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
  v8.super_class = (Class)GEORouteIncident;
  -[GEORouteIncident description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORouteIncident dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORouteIncident _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  __CFString *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned int v18;
  __CFString *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  const __CFString *v31;
  void *v32;
  const __CFString *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  _QWORD v44[4];
  id v45;

  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)a1, "position");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v5, "jsonRepresentation");
    else
      objc_msgSend(v5, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("position"));

  }
  objc_msgSend((id)a1, "incidentId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("incidentId"));

  objc_msgSend((id)a1, "info");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("info"));

  if ((*(_BYTE *)(a1 + 152) & 0x80) != 0)
  {
    v10 = *(_DWORD *)(a1 + 140);
    v11 = CFSTR("ACCIDENT");
    switch(v10)
    {
      case 0:
        break;
      case 1:
        v11 = CFSTR("CONSTRUCTION");
        break;
      case 2:
        v11 = CFSTR("ROAD_CLOSURE");
        break;
      case 3:
        v11 = CFSTR("EVENT");
        break;
      case 4:
        v11 = CFSTR("HAZARD");
        break;
      case 5:
        v11 = CFSTR("LANE_CLOSURE");
        break;
      case 6:
        v11 = CFSTR("RAMP_CLOSURE");
        break;
      case 7:
        v11 = CFSTR("TRAFFIC");
        break;
      case 8:
        v11 = CFSTR("WALKING_CLOSURE");
        break;
      case 9:
        v11 = CFSTR("CONGESTION_ZONE_RESTRICTION");
        break;
      case 10:
        v11 = CFSTR("LICENSE_PLATE_RESTRICTION");
        break;
      case 11:
      case 12:
        goto LABEL_16;
      case 13:
        v11 = CFSTR("SPEED_TRAP");
        break;
      case 14:
        v11 = CFSTR("AREA_INCIDENT");
        break;
      default:
        if (v10 == 100)
        {
          v11 = CFSTR("TIME_BASED_RESTRICTION");
        }
        else
        {
LABEL_16:
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 140));
          v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        break;
    }
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("type"));

  }
  objc_msgSend((id)a1, "street");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("street"));

  objc_msgSend((id)a1, "crossStreet");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("crossStreet"));

  v14 = *(_DWORD *)(a1 + 152);
  if ((v14 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(a1 + 80));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("startTime"));

    v14 = *(_DWORD *)(a1 + 152);
    if ((v14 & 1) == 0)
    {
LABEL_35:
      if ((v14 & 4) == 0)
        goto LABEL_36;
      goto LABEL_43;
    }
  }
  else if ((v14 & 1) == 0)
  {
    goto LABEL_35;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(a1 + 40));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("endTime"));

  v14 = *(_DWORD *)(a1 + 152);
  if ((v14 & 4) == 0)
  {
LABEL_36:
    if ((v14 & 0x20) == 0)
      goto LABEL_37;
    goto LABEL_44;
  }
LABEL_43:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(a1 + 96));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v17, CFSTR("updateTime"));

  v14 = *(_DWORD *)(a1 + 152);
  if ((v14 & 0x20) == 0)
  {
LABEL_37:
    if ((v14 & 0x10) == 0)
      goto LABEL_38;
    goto LABEL_48;
  }
LABEL_44:
  v18 = *(_DWORD *)(a1 + 132) - 1;
  if (v18 >= 9)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 132));
    v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = off_1E1C08628[v18];
  }
  objc_msgSend(v4, "setObject:forKey:", v19, CFSTR("laneClosureType"));

  v14 = *(_DWORD *)(a1 + 152);
  if ((v14 & 0x10) == 0)
  {
LABEL_38:
    if ((v14 & 0x200) == 0)
      goto LABEL_39;
    goto LABEL_49;
  }
LABEL_48:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 128));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v20, CFSTR("laneClosureCount"));

  v14 = *(_DWORD *)(a1 + 152);
  if ((v14 & 0x200) == 0)
  {
LABEL_39:
    if ((v14 & 0x40) == 0)
      goto LABEL_54;
LABEL_50:
    v22 = *(int *)(a1 + 136);
    if (v22 >= 6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 136));
      v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v23 = off_1E1C08670[v22];
    }
    objc_msgSend(v4, "setObject:forKey:", v23, CFSTR("significance"));

    goto LABEL_54;
  }
LABEL_49:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 148));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v21, CFSTR("endTimeReliable"));

  if ((*(_DWORD *)(a1 + 152) & 0x40) != 0)
    goto LABEL_50;
LABEL_54:
  objc_msgSend((id)a1, "restrictionInfo");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v24;
  if (v24)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v24, "jsonRepresentation");
    else
      objc_msgSend(v24, "dictionaryRepresentation");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v26, CFSTR("restrictionInfo"));

  }
  v27 = *(_DWORD *)(a1 + 152);
  if ((v27 & 0x100) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 144));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v28, CFSTR("userReportsCount"));

    v27 = *(_DWORD *)(a1 + 152);
  }
  if ((v27 & 0x400) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 149));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v29, CFSTR("shouldDisplayOnMap"));

  }
  if (*(_QWORD *)(a1 + 104))
  {
    objc_msgSend((id)a1, "userReportIds");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v31 = CFSTR("userReportId");
    else
      v31 = CFSTR("user_report_id");
    objc_msgSend(v4, "setObject:forKey:", v30, v31);

  }
  if ((*(_BYTE *)(a1 + 152) & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 124));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v33 = CFSTR("delaySeconds");
    else
      v33 = CFSTR("delay_seconds");
    objc_msgSend(v4, "setObject:forKey:", v32, v33);

  }
  objc_msgSend((id)a1, "artwork");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v34;
  if (v34)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v34, "jsonRepresentation");
    else
      objc_msgSend(v34, "dictionaryRepresentation");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v36, CFSTR("artwork"));

  }
  v37 = *(void **)(a1 + 16);
  if (v37)
  {
    objc_msgSend(v37, "dictionaryRepresentation");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = v38;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v38, "count"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v44[0] = MEMORY[0x1E0C809B0];
      v44[1] = 3221225472;
      v44[2] = __46__GEORouteIncident__dictionaryRepresentation___block_invoke;
      v44[3] = &unk_1E1C00600;
      v41 = v40;
      v45 = v41;
      objc_msgSend(v39, "enumerateKeysAndObjectsUsingBlock:", v44);
      v42 = v41;

      v39 = v42;
    }
    objc_msgSend(v4, "setObject:forKey:", v39, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEORouteIncident _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __46__GEORouteIncident__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEORouteIncident)initWithDictionary:(id)a3
{
  return (GEORouteIncident *)-[GEORouteIncident _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  void *v6;
  GEOLatLng *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  void *v32;
  GEORestrictionInfo *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  const __CFString *v38;
  void *v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t i;
  void *v45;
  void *v46;
  const __CFString *v47;
  void *v48;
  void *v49;
  GEOPBTransitArtwork *v50;
  uint64_t v51;
  void *v52;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (!a1)
    goto LABEL_136;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_136;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("position"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = [GEOLatLng alloc];
    if ((a3 & 1) != 0)
      v8 = -[GEOLatLng initWithJSON:](v7, "initWithJSON:", v6);
    else
      v8 = -[GEOLatLng initWithDictionary:](v7, "initWithDictionary:", v6);
    v9 = (void *)v8;
    objc_msgSend(a1, "setPosition:", v8);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("incidentId"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = (void *)objc_msgSend(v10, "copy");
    objc_msgSend(a1, "setIncidentId:", v11);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("info"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v13 = (void *)objc_msgSend(v12, "copy");
    objc_msgSend(a1, "setInfo:", v13);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("type"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v15 = v14;
    if ((objc_msgSend(v15, "isEqualToString:", CFSTR("ACCIDENT")) & 1) != 0)
    {
      v16 = 0;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("CONSTRUCTION")) & 1) != 0)
    {
      v16 = 1;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("ROAD_CLOSURE")) & 1) != 0)
    {
      v16 = 2;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("EVENT")) & 1) != 0)
    {
      v16 = 3;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("HAZARD")) & 1) != 0)
    {
      v16 = 4;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("LANE_CLOSURE")) & 1) != 0)
    {
      v16 = 5;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("RAMP_CLOSURE")) & 1) != 0)
    {
      v16 = 6;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("TRAFFIC")) & 1) != 0)
    {
      v16 = 7;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("WALKING_CLOSURE")) & 1) != 0)
    {
      v16 = 8;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("CONGESTION_ZONE_RESTRICTION")) & 1) != 0)
    {
      v16 = 9;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("LICENSE_PLATE_RESTRICTION")) & 1) != 0)
    {
      v16 = 10;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("SPEED_TRAP")) & 1) != 0)
    {
      v16 = 13;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("AREA_INCIDENT")) & 1) != 0)
    {
      v16 = 14;
    }
    else if (objc_msgSend(v15, "isEqualToString:", CFSTR("TIME_BASED_RESTRICTION")))
    {
      v16 = 100;
    }
    else
    {
      v16 = 0;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_46;
    v16 = objc_msgSend(v14, "intValue");
  }
  objc_msgSend(a1, "setType:", v16);
LABEL_46:

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("street"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v18 = (void *)objc_msgSend(v17, "copy");
    objc_msgSend(a1, "setStreet:", v18);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("crossStreet"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v20 = (void *)objc_msgSend(v19, "copy");
    objc_msgSend(a1, "setCrossStreet:", v20);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("startTime"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setStartTime:", objc_msgSend(v21, "longLongValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("endTime"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setEndTime:", objc_msgSend(v22, "longLongValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("updateTime"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setUpdateTime:", objc_msgSend(v23, "longLongValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("laneClosureType"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v25 = v24;
    if ((objc_msgSend(v25, "isEqualToString:", CFSTR("LEFT_LANE")) & 1) != 0)
    {
      v26 = 1;
    }
    else if ((objc_msgSend(v25, "isEqualToString:", CFSTR("CENTER_LANE")) & 1) != 0)
    {
      v26 = 2;
    }
    else if ((objc_msgSend(v25, "isEqualToString:", CFSTR("RIGHT_LANE")) & 1) != 0)
    {
      v26 = 3;
    }
    else if ((objc_msgSend(v25, "isEqualToString:", CFSTR("SHOULDER_LANE")) & 1) != 0)
    {
      v26 = 4;
    }
    else if ((objc_msgSend(v25, "isEqualToString:", CFSTR("CARPOOL_LANE")) & 1) != 0)
    {
      v26 = 5;
    }
    else if ((objc_msgSend(v25, "isEqualToString:", CFSTR("BUS_LANE")) & 1) != 0)
    {
      v26 = 6;
    }
    else if ((objc_msgSend(v25, "isEqualToString:", CFSTR("OTHER_LANE")) & 1) != 0)
    {
      v26 = 7;
    }
    else if ((objc_msgSend(v25, "isEqualToString:", CFSTR("ON_RAMP")) & 1) != 0)
    {
      v26 = 8;
    }
    else if (objc_msgSend(v25, "isEqualToString:", CFSTR("OFF_RAMP")))
    {
      v26 = 9;
    }
    else
    {
      v26 = 1;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_80;
    v26 = objc_msgSend(v24, "intValue");
  }
  objc_msgSend(a1, "setLaneClosureType:", v26);
LABEL_80:

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("laneClosureCount"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setLaneClosureCount:", objc_msgSend(v27, "unsignedIntValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("endTimeReliable"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setEndTimeReliable:", objc_msgSend(v28, "BOOLValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("significance"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v30 = v29;
    if ((objc_msgSend(v30, "isEqualToString:", CFSTR("UNKNOWN_IMPACT")) & 1) != 0)
    {
      v31 = 0;
    }
    else if ((objc_msgSend(v30, "isEqualToString:", CFSTR("LOW_IMPACT")) & 1) != 0)
    {
      v31 = 1;
    }
    else if ((objc_msgSend(v30, "isEqualToString:", CFSTR("MODERATE_LOCAL_IMPACT")) & 1) != 0)
    {
      v31 = 2;
    }
    else if ((objc_msgSend(v30, "isEqualToString:", CFSTR("HIGH_LOCAL_IMPACT")) & 1) != 0)
    {
      v31 = 3;
    }
    else if ((objc_msgSend(v30, "isEqualToString:", CFSTR("MODERATE_REGIONAL_IMPACT")) & 1) != 0)
    {
      v31 = 4;
    }
    else if (objc_msgSend(v30, "isEqualToString:", CFSTR("WIDE_REGIONAL_IMPACT")))
    {
      v31 = 5;
    }
    else
    {
      v31 = 0;
    }

    goto LABEL_101;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v31 = objc_msgSend(v29, "intValue");
LABEL_101:
    objc_msgSend(a1, "setSignificance:", v31);
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("restrictionInfo"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v33 = [GEORestrictionInfo alloc];
    if ((a3 & 1) != 0)
      v34 = -[GEORestrictionInfo initWithJSON:](v33, "initWithJSON:", v32);
    else
      v34 = -[GEORestrictionInfo initWithDictionary:](v33, "initWithDictionary:", v32);
    v35 = (void *)v34;
    objc_msgSend(a1, "setRestrictionInfo:", v34);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("userReportsCount"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setUserReportsCount:", objc_msgSend(v36, "unsignedIntValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("shouldDisplayOnMap"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setShouldDisplayOnMap:", objc_msgSend(v37, "BOOLValue"));

  if (a3)
    v38 = CFSTR("userReportId");
  else
    v38 = CFSTR("user_report_id");
  objc_msgSend(v5, "objectForKeyedSubscript:", v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    v40 = v39;
    v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v54, v58, 16);
    if (v41)
    {
      v42 = v41;
      v43 = *(_QWORD *)v55;
      do
      {
        for (i = 0; i != v42; ++i)
        {
          if (*(_QWORD *)v55 != v43)
            objc_enumerationMutation(v40);
          v45 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v46 = (void *)objc_msgSend(v45, "copy", (_QWORD)v54);
            objc_msgSend(a1, "addUserReportId:", v46);

          }
        }
        v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v54, v58, 16);
      }
      while (v42);
    }

  }
  if (a3)
    v47 = CFSTR("delaySeconds");
  else
    v47 = CFSTR("delay_seconds");
  objc_msgSend(v5, "objectForKeyedSubscript:", v47, (_QWORD)v54);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setDelaySeconds:", objc_msgSend(v48, "unsignedIntValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("artwork"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v50 = [GEOPBTransitArtwork alloc];
    if ((a3 & 1) != 0)
      v51 = -[GEOPBTransitArtwork initWithJSON:](v50, "initWithJSON:", v49);
    else
      v51 = -[GEOPBTransitArtwork initWithDictionary:](v50, "initWithDictionary:", v49);
    v52 = (void *)v51;
    objc_msgSend(a1, "setArtwork:", v51);

  }
LABEL_136:

  return a1;
}

- (GEORouteIncident)initWithJSON:(id)a3
{
  return (GEORouteIncident *)-[GEORouteIncident _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_5188;
    else
      v8 = (int *)&readAll__nonRecursiveTag_5189;
    GEORouteIncidentReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
  {
    -[GEOLatLng readAll:](self->_position, "readAll:", 1);
    -[GEORestrictionInfo readAll:](self->_restrictionInfo, "readAll:", 1);
    -[GEOPBTransitArtwork readAll:](self->_artwork, "readAll:", 1);
  }
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORouteIncidentIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORouteIncidentReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  $24DAC98BB42E806208BFDF9810E4926F flags;
  $24DAC98BB42E806208BFDF9810E4926F v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
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
  if (self->_reader && (_GEORouteIncidentIsDirty((uint64_t)self) & 1) == 0)
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
    goto LABEL_49;
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEORouteIncident readAll:](self, "readAll:", 0);
  if (self->_position)
    PBDataWriterWriteSubmessage();
  if (self->_incidentId)
    PBDataWriterWriteStringField();
  if (self->_info)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_flags & 0x80) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_street)
    PBDataWriterWriteStringField();
  if (self->_crossStreet)
    PBDataWriterWriteStringField();
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 2) != 0)
  {
    PBDataWriterWriteSfixed64Field();
    flags = self->_flags;
    if ((*(_BYTE *)&flags & 1) == 0)
    {
LABEL_17:
      if ((*(_BYTE *)&flags & 4) == 0)
        goto LABEL_18;
      goto LABEL_43;
    }
  }
  else if ((*(_BYTE *)&flags & 1) == 0)
  {
    goto LABEL_17;
  }
  PBDataWriterWriteSfixed64Field();
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 4) == 0)
  {
LABEL_18:
    if ((*(_BYTE *)&flags & 0x20) == 0)
      goto LABEL_19;
    goto LABEL_44;
  }
LABEL_43:
  PBDataWriterWriteSfixed64Field();
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 0x20) == 0)
  {
LABEL_19:
    if ((*(_BYTE *)&flags & 0x10) == 0)
      goto LABEL_20;
    goto LABEL_45;
  }
LABEL_44:
  PBDataWriterWriteInt32Field();
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 0x10) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&flags & 0x200) == 0)
      goto LABEL_21;
LABEL_46:
    PBDataWriterWriteBOOLField();
    if ((*(_DWORD *)&self->_flags & 0x40) == 0)
      goto LABEL_23;
    goto LABEL_22;
  }
LABEL_45:
  PBDataWriterWriteUint32Field();
  flags = self->_flags;
  if ((*(_WORD *)&flags & 0x200) != 0)
    goto LABEL_46;
LABEL_21:
  if ((*(_BYTE *)&flags & 0x40) != 0)
LABEL_22:
    PBDataWriterWriteInt32Field();
LABEL_23:
  if (self->_restrictionInfo)
    PBDataWriterWriteSubmessage();
  v7 = self->_flags;
  if ((*(_WORD *)&v7 & 0x100) != 0)
  {
    PBDataWriterWriteUint32Field();
    v7 = self->_flags;
  }
  if ((*(_WORD *)&v7 & 0x400) != 0)
    PBDataWriterWriteBOOLField();
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v8 = self->_userReportIds;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v8);
        PBDataWriterWriteStringField();
        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

  if ((*(_BYTE *)&self->_flags & 8) != 0)
    PBDataWriterWriteUint32Field();
  if (self->_artwork)
    PBDataWriterWriteSubmessage();
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v14);
LABEL_49:

}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[GEORouteIncident _readPosition]((uint64_t)self);
  return -[GEOLatLng hasGreenTeaWithValue:](self->_position, "hasGreenTeaWithValue:", v3);
}

- (void)copyTo:(id)a3
{
  id *v4;
  $24DAC98BB42E806208BFDF9810E4926F flags;
  $24DAC98BB42E806208BFDF9810E4926F v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t i;
  void *v10;
  id *v11;
  id *v12;

  v12 = (id *)a3;
  -[GEORouteIncident readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v12 + 1, self->_reader);
  *((_DWORD *)v12 + 28) = self->_readerMarkPos;
  *((_DWORD *)v12 + 29) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_position)
    objc_msgSend(v12, "setPosition:");
  if (self->_incidentId)
    objc_msgSend(v12, "setIncidentId:");
  v4 = v12;
  if (self->_info)
  {
    objc_msgSend(v12, "setInfo:");
    v4 = v12;
  }
  if ((*(_BYTE *)&self->_flags & 0x80) != 0)
  {
    *((_DWORD *)v4 + 35) = self->_type;
    *((_DWORD *)v4 + 38) |= 0x80u;
  }
  if (self->_street)
  {
    objc_msgSend(v12, "setStreet:");
    v4 = v12;
  }
  if (self->_crossStreet)
  {
    objc_msgSend(v12, "setCrossStreet:");
    v4 = v12;
  }
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 2) != 0)
  {
    v4[10] = (id)self->_startTime;
    *((_DWORD *)v4 + 38) |= 2u;
    flags = self->_flags;
    if ((*(_BYTE *)&flags & 1) == 0)
    {
LABEL_15:
      if ((*(_BYTE *)&flags & 4) == 0)
        goto LABEL_16;
      goto LABEL_38;
    }
  }
  else if ((*(_BYTE *)&flags & 1) == 0)
  {
    goto LABEL_15;
  }
  v4[5] = (id)self->_endTime;
  *((_DWORD *)v4 + 38) |= 1u;
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 4) == 0)
  {
LABEL_16:
    if ((*(_BYTE *)&flags & 0x20) == 0)
      goto LABEL_17;
    goto LABEL_39;
  }
LABEL_38:
  v4[12] = (id)self->_updateTime;
  *((_DWORD *)v4 + 38) |= 4u;
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 0x20) == 0)
  {
LABEL_17:
    if ((*(_BYTE *)&flags & 0x10) == 0)
      goto LABEL_18;
    goto LABEL_40;
  }
LABEL_39:
  *((_DWORD *)v4 + 33) = self->_laneClosureType;
  *((_DWORD *)v4 + 38) |= 0x20u;
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 0x10) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&flags & 0x200) == 0)
      goto LABEL_19;
    goto LABEL_41;
  }
LABEL_40:
  *((_DWORD *)v4 + 32) = self->_laneClosureCount;
  *((_DWORD *)v4 + 38) |= 0x10u;
  flags = self->_flags;
  if ((*(_WORD *)&flags & 0x200) == 0)
  {
LABEL_19:
    if ((*(_BYTE *)&flags & 0x40) == 0)
      goto LABEL_21;
    goto LABEL_20;
  }
LABEL_41:
  *((_BYTE *)v4 + 148) = self->_endTimeReliable;
  *((_DWORD *)v4 + 38) |= 0x200u;
  if ((*(_DWORD *)&self->_flags & 0x40) != 0)
  {
LABEL_20:
    *((_DWORD *)v4 + 34) = self->_significance;
    *((_DWORD *)v4 + 38) |= 0x40u;
  }
LABEL_21:
  if (self->_restrictionInfo)
  {
    objc_msgSend(v12, "setRestrictionInfo:");
    v4 = v12;
  }
  v6 = self->_flags;
  if ((*(_WORD *)&v6 & 0x100) != 0)
  {
    *((_DWORD *)v4 + 36) = self->_userReportsCount;
    *((_DWORD *)v4 + 38) |= 0x100u;
    v6 = self->_flags;
  }
  if ((*(_WORD *)&v6 & 0x400) != 0)
  {
    *((_BYTE *)v4 + 149) = self->_shouldDisplayOnMap;
    *((_DWORD *)v4 + 38) |= 0x400u;
  }
  if (-[GEORouteIncident userReportIdsCount](self, "userReportIdsCount"))
  {
    objc_msgSend(v12, "clearUserReportIds");
    v7 = -[GEORouteIncident userReportIdsCount](self, "userReportIdsCount");
    if (v7)
    {
      v8 = v7;
      for (i = 0; i != v8; ++i)
      {
        -[GEORouteIncident userReportIdAtIndex:](self, "userReportIdAtIndex:", i);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addUserReportId:", v10);

      }
    }
  }
  v11 = v12;
  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
    *((_DWORD *)v12 + 31) = self->_delaySeconds;
    *((_DWORD *)v12 + 38) |= 8u;
  }
  if (self->_artwork)
  {
    objc_msgSend(v12, "setArtwork:");
    v11 = v12;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  $24DAC98BB42E806208BFDF9810E4926F flags;
  id v20;
  void *v21;
  $24DAC98BB42E806208BFDF9810E4926F v22;
  NSMutableArray *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  id v28;
  void *v29;
  PBUnknownFields *v30;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
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
    if ((*((_BYTE *)&self->_flags + 2) & 0x10) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEORouteIncidentReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_29;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEORouteIncident readAll:](self, "readAll:", 0);
  v9 = -[GEOLatLng copyWithZone:](self->_position, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v9;

  v11 = -[NSString copyWithZone:](self->_incidentId, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v11;

  v13 = -[NSString copyWithZone:](self->_info, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v13;

  if ((*(_BYTE *)&self->_flags & 0x80) != 0)
  {
    *(_DWORD *)(v5 + 140) = self->_type;
    *(_DWORD *)(v5 + 152) |= 0x80u;
  }
  v15 = -[NSString copyWithZone:](self->_street, "copyWithZone:", a3);
  v16 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v15;

  v17 = -[NSString copyWithZone:](self->_crossStreet, "copyWithZone:", a3);
  v18 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v17;

  flags = self->_flags;
  if ((*(_BYTE *)&flags & 2) != 0)
  {
    *(_QWORD *)(v5 + 80) = self->_startTime;
    *(_DWORD *)(v5 + 152) |= 2u;
    flags = self->_flags;
    if ((*(_BYTE *)&flags & 1) == 0)
    {
LABEL_9:
      if ((*(_BYTE *)&flags & 4) == 0)
        goto LABEL_10;
      goto LABEL_32;
    }
  }
  else if ((*(_BYTE *)&flags & 1) == 0)
  {
    goto LABEL_9;
  }
  *(_QWORD *)(v5 + 40) = self->_endTime;
  *(_DWORD *)(v5 + 152) |= 1u;
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 4) == 0)
  {
LABEL_10:
    if ((*(_BYTE *)&flags & 0x20) == 0)
      goto LABEL_11;
    goto LABEL_33;
  }
LABEL_32:
  *(_QWORD *)(v5 + 96) = self->_updateTime;
  *(_DWORD *)(v5 + 152) |= 4u;
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 0x20) == 0)
  {
LABEL_11:
    if ((*(_BYTE *)&flags & 0x10) == 0)
      goto LABEL_12;
    goto LABEL_34;
  }
LABEL_33:
  *(_DWORD *)(v5 + 132) = self->_laneClosureType;
  *(_DWORD *)(v5 + 152) |= 0x20u;
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 0x10) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&flags & 0x200) == 0)
      goto LABEL_13;
LABEL_35:
    *(_BYTE *)(v5 + 148) = self->_endTimeReliable;
    *(_DWORD *)(v5 + 152) |= 0x200u;
    if ((*(_DWORD *)&self->_flags & 0x40) == 0)
      goto LABEL_15;
    goto LABEL_14;
  }
LABEL_34:
  *(_DWORD *)(v5 + 128) = self->_laneClosureCount;
  *(_DWORD *)(v5 + 152) |= 0x10u;
  flags = self->_flags;
  if ((*(_WORD *)&flags & 0x200) != 0)
    goto LABEL_35;
LABEL_13:
  if ((*(_BYTE *)&flags & 0x40) != 0)
  {
LABEL_14:
    *(_DWORD *)(v5 + 136) = self->_significance;
    *(_DWORD *)(v5 + 152) |= 0x40u;
  }
LABEL_15:
  v20 = -[GEORestrictionInfo copyWithZone:](self->_restrictionInfo, "copyWithZone:", a3);
  v21 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v20;

  v22 = self->_flags;
  if ((*(_WORD *)&v22 & 0x100) != 0)
  {
    *(_DWORD *)(v5 + 144) = self->_userReportsCount;
    *(_DWORD *)(v5 + 152) |= 0x100u;
    v22 = self->_flags;
  }
  if ((*(_WORD *)&v22 & 0x400) != 0)
  {
    *(_BYTE *)(v5 + 149) = self->_shouldDisplayOnMap;
    *(_DWORD *)(v5 + 152) |= 0x400u;
  }
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v23 = self->_userReportIds;
  v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v24)
  {
    v25 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v33 != v25)
          objc_enumerationMutation(v23);
        v27 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v32);
        objc_msgSend((id)v5, "addUserReportId:", v27);

      }
      v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    }
    while (v24);
  }

  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
    *(_DWORD *)(v5 + 124) = self->_delaySeconds;
    *(_DWORD *)(v5 + 152) |= 8u;
  }
  v28 = -[GEOPBTransitArtwork copyWithZone:](self->_artwork, "copyWithZone:", a3, (_QWORD)v32);
  v29 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v28;

  v30 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v30;
LABEL_29:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  GEOLatLng *position;
  NSString *incidentId;
  NSString *info;
  int v8;
  NSString *street;
  NSString *crossStreet;
  $24DAC98BB42E806208BFDF9810E4926F flags;
  int v12;
  GEORestrictionInfo *restrictionInfo;
  NSMutableArray *userReportIds;
  GEOPBTransitArtwork *artwork;
  char v16;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_81;
  -[GEORouteIncident readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  position = self->_position;
  if ((unint64_t)position | *((_QWORD *)v4 + 8))
  {
    if (!-[GEOLatLng isEqual:](position, "isEqual:"))
      goto LABEL_81;
  }
  incidentId = self->_incidentId;
  if ((unint64_t)incidentId | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](incidentId, "isEqual:"))
      goto LABEL_81;
  }
  info = self->_info;
  if ((unint64_t)info | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](info, "isEqual:"))
      goto LABEL_81;
  }
  v8 = *((_DWORD *)v4 + 38);
  if ((*(_BYTE *)&self->_flags & 0x80) != 0)
  {
    if ((v8 & 0x80) == 0 || self->_type != *((_DWORD *)v4 + 35))
      goto LABEL_81;
  }
  else if ((v8 & 0x80) != 0)
  {
    goto LABEL_81;
  }
  street = self->_street;
  if ((unint64_t)street | *((_QWORD *)v4 + 11) && !-[NSString isEqual:](street, "isEqual:"))
    goto LABEL_81;
  crossStreet = self->_crossStreet;
  if ((unint64_t)crossStreet | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](crossStreet, "isEqual:"))
      goto LABEL_81;
  }
  flags = self->_flags;
  v12 = *((_DWORD *)v4 + 38);
  if ((*(_BYTE *)&flags & 2) != 0)
  {
    if ((v12 & 2) == 0 || self->_startTime != *((_QWORD *)v4 + 10))
      goto LABEL_81;
  }
  else if ((v12 & 2) != 0)
  {
    goto LABEL_81;
  }
  if ((*(_BYTE *)&flags & 1) != 0)
  {
    if ((v12 & 1) == 0 || self->_endTime != *((_QWORD *)v4 + 5))
      goto LABEL_81;
  }
  else if ((v12 & 1) != 0)
  {
    goto LABEL_81;
  }
  if ((*(_BYTE *)&flags & 4) != 0)
  {
    if ((v12 & 4) == 0 || self->_updateTime != *((_QWORD *)v4 + 12))
      goto LABEL_81;
  }
  else if ((v12 & 4) != 0)
  {
    goto LABEL_81;
  }
  if ((*(_BYTE *)&flags & 0x20) != 0)
  {
    if ((v12 & 0x20) == 0 || self->_laneClosureType != *((_DWORD *)v4 + 33))
      goto LABEL_81;
  }
  else if ((v12 & 0x20) != 0)
  {
    goto LABEL_81;
  }
  if ((*(_BYTE *)&flags & 0x10) != 0)
  {
    if ((v12 & 0x10) == 0 || self->_laneClosureCount != *((_DWORD *)v4 + 32))
      goto LABEL_81;
  }
  else if ((v12 & 0x10) != 0)
  {
    goto LABEL_81;
  }
  if ((*(_WORD *)&flags & 0x200) != 0)
  {
    if ((v12 & 0x200) == 0)
      goto LABEL_81;
    if (self->_endTimeReliable)
    {
      if (!*((_BYTE *)v4 + 148))
        goto LABEL_81;
    }
    else if (*((_BYTE *)v4 + 148))
    {
      goto LABEL_81;
    }
  }
  else if ((v12 & 0x200) != 0)
  {
    goto LABEL_81;
  }
  if ((*(_BYTE *)&flags & 0x40) != 0)
  {
    if ((v12 & 0x40) == 0 || self->_significance != *((_DWORD *)v4 + 34))
      goto LABEL_81;
  }
  else if ((v12 & 0x40) != 0)
  {
    goto LABEL_81;
  }
  restrictionInfo = self->_restrictionInfo;
  if ((unint64_t)restrictionInfo | *((_QWORD *)v4 + 9))
  {
    if (!-[GEORestrictionInfo isEqual:](restrictionInfo, "isEqual:"))
      goto LABEL_81;
    flags = self->_flags;
    v12 = *((_DWORD *)v4 + 38);
  }
  if ((*(_WORD *)&flags & 0x100) != 0)
  {
    if ((v12 & 0x100) == 0 || self->_userReportsCount != *((_DWORD *)v4 + 36))
      goto LABEL_81;
  }
  else if ((v12 & 0x100) != 0)
  {
    goto LABEL_81;
  }
  if ((*(_WORD *)&flags & 0x400) != 0)
  {
    if ((v12 & 0x400) == 0)
      goto LABEL_81;
    if (self->_shouldDisplayOnMap)
    {
      if (!*((_BYTE *)v4 + 149))
        goto LABEL_81;
    }
    else if (*((_BYTE *)v4 + 149))
    {
      goto LABEL_81;
    }
  }
  else if ((v12 & 0x400) != 0)
  {
    goto LABEL_81;
  }
  userReportIds = self->_userReportIds;
  if (!((unint64_t)userReportIds | *((_QWORD *)v4 + 13)))
    goto LABEL_74;
  if (!-[NSMutableArray isEqual:](userReportIds, "isEqual:"))
  {
LABEL_81:
    v16 = 0;
    goto LABEL_82;
  }
  flags = self->_flags;
  v12 = *((_DWORD *)v4 + 38);
LABEL_74:
  if ((*(_BYTE *)&flags & 8) != 0)
  {
    if ((v12 & 8) == 0 || self->_delaySeconds != *((_DWORD *)v4 + 31))
      goto LABEL_81;
  }
  else if ((v12 & 8) != 0)
  {
    goto LABEL_81;
  }
  artwork = self->_artwork;
  if ((unint64_t)artwork | *((_QWORD *)v4 + 3))
    v16 = -[GEOPBTransitArtwork isEqual:](artwork, "isEqual:");
  else
    v16 = 1;
LABEL_82:

  return v16;
}

- (unint64_t)hash
{
  $24DAC98BB42E806208BFDF9810E4926F flags;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  $24DAC98BB42E806208BFDF9810E4926F v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSUInteger v18;
  NSUInteger v19;
  uint64_t v20;
  NSUInteger v21;
  NSUInteger v22;
  unint64_t v23;

  -[GEORouteIncident readAll:](self, "readAll:", 1);
  v23 = -[GEOLatLng hash](self->_position, "hash");
  v22 = -[NSString hash](self->_incidentId, "hash");
  v21 = -[NSString hash](self->_info, "hash");
  if ((*(_BYTE *)&self->_flags & 0x80) != 0)
    v20 = 2654435761 * self->_type;
  else
    v20 = 0;
  v19 = -[NSString hash](self->_street, "hash");
  v18 = -[NSString hash](self->_crossStreet, "hash");
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 2) != 0)
  {
    v17 = 2654435761 * self->_startTime;
    if ((*(_BYTE *)&flags & 1) != 0)
    {
LABEL_6:
      v16 = 2654435761 * self->_endTime;
      if ((*(_BYTE *)&flags & 4) != 0)
        goto LABEL_7;
      goto LABEL_14;
    }
  }
  else
  {
    v17 = 0;
    if ((*(_BYTE *)&flags & 1) != 0)
      goto LABEL_6;
  }
  v16 = 0;
  if ((*(_BYTE *)&flags & 4) != 0)
  {
LABEL_7:
    v15 = 2654435761 * self->_updateTime;
    if ((*(_BYTE *)&flags & 0x20) != 0)
      goto LABEL_8;
    goto LABEL_15;
  }
LABEL_14:
  v15 = 0;
  if ((*(_BYTE *)&flags & 0x20) != 0)
  {
LABEL_8:
    v4 = 2654435761 * self->_laneClosureType;
    if ((*(_BYTE *)&flags & 0x10) != 0)
      goto LABEL_9;
    goto LABEL_16;
  }
LABEL_15:
  v4 = 0;
  if ((*(_BYTE *)&flags & 0x10) != 0)
  {
LABEL_9:
    v5 = 2654435761 * self->_laneClosureCount;
    if ((*(_WORD *)&flags & 0x200) != 0)
      goto LABEL_10;
LABEL_17:
    v6 = 0;
    if ((*(_BYTE *)&flags & 0x40) != 0)
      goto LABEL_11;
    goto LABEL_18;
  }
LABEL_16:
  v5 = 0;
  if ((*(_WORD *)&flags & 0x200) == 0)
    goto LABEL_17;
LABEL_10:
  v6 = 2654435761 * self->_endTimeReliable;
  if ((*(_BYTE *)&flags & 0x40) != 0)
  {
LABEL_11:
    v7 = 2654435761 * self->_significance;
    goto LABEL_19;
  }
LABEL_18:
  v7 = 0;
LABEL_19:
  v8 = -[GEORestrictionInfo hash](self->_restrictionInfo, "hash");
  v9 = self->_flags;
  if ((*(_WORD *)&v9 & 0x100) != 0)
  {
    v10 = 2654435761 * self->_userReportsCount;
    if ((*(_WORD *)&v9 & 0x400) != 0)
      goto LABEL_21;
  }
  else
  {
    v10 = 0;
    if ((*(_WORD *)&v9 & 0x400) != 0)
    {
LABEL_21:
      v11 = 2654435761 * self->_shouldDisplayOnMap;
      goto LABEL_24;
    }
  }
  v11 = 0;
LABEL_24:
  v12 = -[NSMutableArray hash](self->_userReportIds, "hash");
  if ((*(_BYTE *)&self->_flags & 8) != 0)
    v13 = 2654435761 * self->_delaySeconds;
  else
    v13 = 0;
  return v22 ^ v23 ^ v21 ^ v20 ^ v19 ^ v18 ^ v17 ^ v16 ^ v15 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v10 ^ v11 ^ v12 ^ v13 ^ -[GEOPBTransitArtwork hash](self->_artwork, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  GEOLatLng *position;
  uint64_t v6;
  int v7;
  GEORestrictionInfo *restrictionInfo;
  uint64_t v9;
  int v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  GEOPBTransitArtwork *artwork;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  position = self->_position;
  v6 = *((_QWORD *)v4 + 8);
  if (position)
  {
    if (v6)
      -[GEOLatLng mergeFrom:](position, "mergeFrom:");
  }
  else if (v6)
  {
    -[GEORouteIncident setPosition:](self, "setPosition:");
  }
  if (*((_QWORD *)v4 + 6))
    -[GEORouteIncident setIncidentId:](self, "setIncidentId:");
  if (*((_QWORD *)v4 + 7))
    -[GEORouteIncident setInfo:](self, "setInfo:");
  if ((*((_BYTE *)v4 + 152) & 0x80) != 0)
  {
    self->_type = *((_DWORD *)v4 + 35);
    *(_DWORD *)&self->_flags |= 0x80u;
  }
  if (*((_QWORD *)v4 + 11))
    -[GEORouteIncident setStreet:](self, "setStreet:");
  if (*((_QWORD *)v4 + 4))
    -[GEORouteIncident setCrossStreet:](self, "setCrossStreet:");
  v7 = *((_DWORD *)v4 + 38);
  if ((v7 & 2) != 0)
  {
    self->_startTime = *((_QWORD *)v4 + 10);
    *(_DWORD *)&self->_flags |= 2u;
    v7 = *((_DWORD *)v4 + 38);
    if ((v7 & 1) == 0)
    {
LABEL_18:
      if ((v7 & 4) == 0)
        goto LABEL_19;
      goto LABEL_29;
    }
  }
  else if ((v7 & 1) == 0)
  {
    goto LABEL_18;
  }
  self->_endTime = *((_QWORD *)v4 + 5);
  *(_DWORD *)&self->_flags |= 1u;
  v7 = *((_DWORD *)v4 + 38);
  if ((v7 & 4) == 0)
  {
LABEL_19:
    if ((v7 & 0x20) == 0)
      goto LABEL_20;
    goto LABEL_30;
  }
LABEL_29:
  self->_updateTime = *((_QWORD *)v4 + 12);
  *(_DWORD *)&self->_flags |= 4u;
  v7 = *((_DWORD *)v4 + 38);
  if ((v7 & 0x20) == 0)
  {
LABEL_20:
    if ((v7 & 0x10) == 0)
      goto LABEL_21;
    goto LABEL_31;
  }
LABEL_30:
  self->_laneClosureType = *((_DWORD *)v4 + 33);
  *(_DWORD *)&self->_flags |= 0x20u;
  v7 = *((_DWORD *)v4 + 38);
  if ((v7 & 0x10) == 0)
  {
LABEL_21:
    if ((v7 & 0x200) == 0)
      goto LABEL_22;
    goto LABEL_32;
  }
LABEL_31:
  self->_laneClosureCount = *((_DWORD *)v4 + 32);
  *(_DWORD *)&self->_flags |= 0x10u;
  v7 = *((_DWORD *)v4 + 38);
  if ((v7 & 0x200) == 0)
  {
LABEL_22:
    if ((v7 & 0x40) == 0)
      goto LABEL_24;
    goto LABEL_23;
  }
LABEL_32:
  self->_endTimeReliable = *((_BYTE *)v4 + 148);
  *(_DWORD *)&self->_flags |= 0x200u;
  if ((*((_DWORD *)v4 + 38) & 0x40) != 0)
  {
LABEL_23:
    self->_significance = *((_DWORD *)v4 + 34);
    *(_DWORD *)&self->_flags |= 0x40u;
  }
LABEL_24:
  restrictionInfo = self->_restrictionInfo;
  v9 = *((_QWORD *)v4 + 9);
  if (restrictionInfo)
  {
    if (v9)
      -[GEORestrictionInfo mergeFrom:](restrictionInfo, "mergeFrom:");
  }
  else if (v9)
  {
    -[GEORouteIncident setRestrictionInfo:](self, "setRestrictionInfo:");
  }
  v10 = *((_DWORD *)v4 + 38);
  if ((v10 & 0x100) != 0)
  {
    self->_userReportsCount = *((_DWORD *)v4 + 36);
    *(_DWORD *)&self->_flags |= 0x100u;
    v10 = *((_DWORD *)v4 + 38);
  }
  if ((v10 & 0x400) != 0)
  {
    self->_shouldDisplayOnMap = *((_BYTE *)v4 + 149);
    *(_DWORD *)&self->_flags |= 0x400u;
  }
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v11 = *((id *)v4 + 13);
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v19 != v14)
          objc_enumerationMutation(v11);
        -[GEORouteIncident addUserReportId:](self, "addUserReportId:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i), (_QWORD)v18);
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v13);
  }

  if ((*((_BYTE *)v4 + 152) & 8) != 0)
  {
    self->_delaySeconds = *((_DWORD *)v4 + 31);
    *(_DWORD *)&self->_flags |= 8u;
  }
  artwork = self->_artwork;
  v17 = *((_QWORD *)v4 + 3);
  if (artwork)
  {
    if (v17)
      -[GEOPBTransitArtwork mergeFrom:](artwork, "mergeFrom:");
  }
  else if (v17)
  {
    -[GEORouteIncident setArtwork:](self, "setArtwork:");
  }

}

- (PBUnknownFields)unknownFields
{
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v5;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*((_BYTE *)&self->_flags + 1) & 8) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      v5 = reader;
      objc_sync_enter(v5);
      GEORouteIncidentReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_5192);
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

  v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x100800u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEORouteIncident readAll:](self, "readAll:", 0);
    -[GEOLatLng clearUnknownFields:](self->_position, "clearUnknownFields:", 1);
    -[GEORestrictionInfo clearUnknownFields:](self->_restrictionInfo, "clearUnknownFields:", 1);
    -[GEOPBTransitArtwork clearUnknownFields:](self->_artwork, "clearUnknownFields:", 1);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userReportIds, 0);
  objc_storeStrong((id *)&self->_street, 0);
  objc_storeStrong((id *)&self->_restrictionInfo, 0);
  objc_storeStrong((id *)&self->_position, 0);
  objc_storeStrong((id *)&self->_info, 0);
  objc_storeStrong((id *)&self->_incidentId, 0);
  objc_storeStrong((id *)&self->_crossStreet, 0);
  objc_storeStrong((id *)&self->_artwork, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
