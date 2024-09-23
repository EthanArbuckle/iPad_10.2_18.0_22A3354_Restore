@implementation GEOGuidanceEvent

- (GEOGuidanceEvent)init
{
  GEOGuidanceEvent *v2;
  GEOGuidanceEvent *v3;
  GEOGuidanceEvent *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOGuidanceEvent;
  v2 = -[GEOGuidanceEvent init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOGuidanceEvent)initWithData:(id)a3
{
  GEOGuidanceEvent *v3;
  GEOGuidanceEvent *v4;
  GEOGuidanceEvent *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOGuidanceEvent;
  v3 = -[GEOGuidanceEvent initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (int)startValidDistance
{
  return self->_startValidDistance;
}

- (void)setStartValidDistance:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x800800u;
  self->_startValidDistance = a3;
}

- (void)setHasStartValidDistance:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 8390656;
  else
    v3 = 0x800000;
  self->_flags = ($FCA46E1F49AB8635A99719300DB73115)(*(_DWORD *)&self->_flags & 0xFFFFF7FF | v3);
}

- (BOOL)hasStartValidDistance
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 3) & 1;
}

- (int)endValidDistance
{
  return self->_endValidDistance;
}

- (void)setEndValidDistance:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x800020u;
  self->_endValidDistance = a3;
}

- (void)setHasEndValidDistance:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 8388640;
  else
    v3 = 0x800000;
  self->_flags = ($FCA46E1F49AB8635A99719300DB73115)(*(_DWORD *)&self->_flags & 0xFFFFFFDF | v3);
}

- (BOOL)hasEndValidDistance
{
  return (*(_BYTE *)&self->_flags >> 5) & 1;
}

- (void)_readSignGuidance
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_BYTE *)(a1 + 158) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOGuidanceEventReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSignGuidance_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (BOOL)hasSignGuidance
{
  -[GEOGuidanceEvent _readSignGuidance]((uint64_t)self);
  return self->_signGuidance != 0;
}

- (GEOSignGuidance)signGuidance
{
  -[GEOGuidanceEvent _readSignGuidance]((uint64_t)self);
  return self->_signGuidance;
}

- (void)setSignGuidance:(id)a3
{
  *(_DWORD *)&self->_flags |= 0xA00000u;
  objc_storeStrong((id *)&self->_signGuidance, a3);
}

- (void)_readSpokenGuidance
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_BYTE *)(a1 + 158) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOGuidanceEventReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSpokenGuidance_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (BOOL)hasSpokenGuidance
{
  -[GEOGuidanceEvent _readSpokenGuidance]((uint64_t)self);
  return self->_spokenGuidance != 0;
}

- (GEOSpokenGuidance)spokenGuidance
{
  -[GEOGuidanceEvent _readSpokenGuidance]((uint64_t)self);
  return self->_spokenGuidance;
}

- (void)setSpokenGuidance:(id)a3
{
  *(_DWORD *)&self->_flags |= 0xC00000u;
  objc_storeStrong((id *)&self->_spokenGuidance, a3);
}

- (void)_readLaneGuidance
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_BYTE *)(a1 + 158) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOGuidanceEventReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLaneGuidance_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (BOOL)hasLaneGuidance
{
  -[GEOGuidanceEvent _readLaneGuidance]((uint64_t)self);
  return self->_laneGuidance != 0;
}

- (GEOVisualLaneGuidance)laneGuidance
{
  -[GEOGuidanceEvent _readLaneGuidance]((uint64_t)self);
  return self->_laneGuidance;
}

- (void)setLaneGuidance:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x880000u;
  objc_storeStrong((id *)&self->_laneGuidance, a3);
}

- (void)_readArGuidance
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_BYTE *)(a1 + 158) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOGuidanceEventReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readArGuidance_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (BOOL)hasArGuidance
{
  -[GEOGuidanceEvent _readArGuidance]((uint64_t)self);
  return self->_arGuidance != 0;
}

- (GEOARGuidance)arGuidance
{
  -[GEOGuidanceEvent _readArGuidance]((uint64_t)self);
  return self->_arGuidance;
}

- (void)setArGuidance:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x810000u;
  objc_storeStrong((id *)&self->_arGuidance, a3);
}

- (void)_readNavTrayGuidance
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_BYTE *)(a1 + 158) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOGuidanceEventReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readNavTrayGuidance_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (BOOL)hasNavTrayGuidance
{
  -[GEOGuidanceEvent _readNavTrayGuidance]((uint64_t)self);
  return self->_navTrayGuidance != 0;
}

- (GEONavTrayGuidance)navTrayGuidance
{
  -[GEOGuidanceEvent _readNavTrayGuidance]((uint64_t)self);
  return self->_navTrayGuidance;
}

- (void)setNavTrayGuidance:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x900000u;
  objc_storeStrong((id *)&self->_navTrayGuidance, a3);
}

- (void)_readJunctionView
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_BYTE *)(a1 + 158) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOGuidanceEventReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readJunctionView_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (BOOL)hasJunctionView
{
  -[GEOGuidanceEvent _readJunctionView]((uint64_t)self);
  return self->_junctionView != 0;
}

- (GEOJunctionView)junctionView
{
  -[GEOGuidanceEvent _readJunctionView]((uint64_t)self);
  return self->_junctionView;
}

- (void)setJunctionView:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x840000u;
  objc_storeStrong((id *)&self->_junctionView, a3);
}

- (int)distanceZilchIndex
{
  return self->_distanceZilchIndex;
}

- (void)setDistanceZilchIndex:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x800008u;
  self->_distanceZilchIndex = a3;
}

- (void)setHasDistanceZilchIndex:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 8388616;
  else
    v3 = 0x800000;
  self->_flags = ($FCA46E1F49AB8635A99719300DB73115)(*(_DWORD *)&self->_flags & 0xFFFFFFF7 | v3);
}

- (BOOL)hasDistanceZilchIndex
{
  return (*(_BYTE *)&self->_flags >> 3) & 1;
}

- (double)minSpeed
{
  return self->_minSpeed;
}

- (void)setMinSpeed:(double)a3
{
  *(_DWORD *)&self->_flags |= 0x800002u;
  self->_minSpeed = a3;
}

- (void)setHasMinSpeed:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 8388610;
  else
    v3 = 0x800000;
  self->_flags = ($FCA46E1F49AB8635A99719300DB73115)(*(_DWORD *)&self->_flags & 0xFFFFFFFD | v3);
}

- (BOOL)hasMinSpeed
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (double)maxSpeed
{
  return self->_maxSpeed;
}

- (void)setMaxSpeed:(double)a3
{
  *(_DWORD *)&self->_flags |= 0x800001u;
  self->_maxSpeed = a3;
}

- (void)setHasMaxSpeed:(BOOL)a3
{
  self->_flags = ($FCA46E1F49AB8635A99719300DB73115)(*(_DWORD *)&self->_flags & 0xFFFFFFFE | a3 | 0x800000);
}

- (BOOL)hasMaxSpeed
{
  return *(_DWORD *)&self->_flags & 1;
}

- (int)eventType
{
  os_unfair_lock_s *p_readerLock;
  $FCA46E1F49AB8635A99719300DB73115 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_BYTE *)&flags & 0x80) != 0)
    return self->_eventType;
  else
    return 0;
}

- (void)setEventType:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x800080u;
  self->_eventType = a3;
}

- (void)setHasEventType:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 8388736;
  else
    v3 = 0x800000;
  self->_flags = ($FCA46E1F49AB8635A99719300DB73115)(*(_DWORD *)&self->_flags & 0xFF7FFF7F | v3);
}

- (BOOL)hasEventType
{
  return *(_BYTE *)&self->_flags >> 7;
}

- (id)eventTypeAsString:(int)a3
{
  if (a3 < 0xF)
    return off_1E1C08220[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsEventType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_GUIDANCE_EVENT_TYPE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("START")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GET_ON_ROUTE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RETURN_TO_ROUTE")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MERGE")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CONTINUE")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("INITIAL")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PREPARE")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EXECUTE")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LANE_MID_STEP")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LANE_MANEUVER")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("END")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PRE_ARRIVAL_MODE_END")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ARRIVAL_CHARGING_STATION")) & 1) != 0)
  {
    v4 = 13;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("CHARGING_AT_STATION")))
  {
    v4 = 14;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (unsigned)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x800100u;
  self->_identifier = a3;
}

- (void)setHasIdentifier:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 8388864;
  else
    v3 = 0x800000;
  self->_flags = ($FCA46E1F49AB8635A99719300DB73115)(*(_DWORD *)&self->_flags & 0xFFFFFEFF | v3);
}

- (BOOL)hasIdentifier
{
  return *((_BYTE *)&self->_flags + 1) & 1;
}

- (int)offsetForDistanceString
{
  return self->_offsetForDistanceString;
}

- (void)setOffsetForDistanceString:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x800200u;
  self->_offsetForDistanceString = a3;
}

- (void)setHasOffsetForDistanceString:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 8389120;
  else
    v3 = 0x800000;
  self->_flags = ($FCA46E1F49AB8635A99719300DB73115)(*(_DWORD *)&self->_flags & 0xFFFFFDFF | v3);
}

- (BOOL)hasOffsetForDistanceString
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 1) & 1;
}

- (BOOL)sticky
{
  return self->_sticky;
}

- (void)setSticky:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x804000u;
  self->_sticky = a3;
}

- (void)setHasSticky:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 8404992;
  else
    v3 = 0x800000;
  self->_flags = ($FCA46E1F49AB8635A99719300DB73115)(*(_DWORD *)&self->_flags & 0xFFFFBFFF | v3);
}

- (BOOL)hasSticky
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 6) & 1;
}

- (unsigned)zilchPathIndex
{
  return self->_zilchPathIndex;
}

- (void)setZilchPathIndex:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x801000u;
  self->_zilchPathIndex = a3;
}

- (void)setHasZilchPathIndex:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 8392704;
  else
    v3 = 0x800000;
  self->_flags = ($FCA46E1F49AB8635A99719300DB73115)(*(_DWORD *)&self->_flags & 0xFFFFEFFF | v3);
}

- (BOOL)hasZilchPathIndex
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 4) & 1;
}

- (unsigned)enrouteNoticeIndex
{
  return self->_enrouteNoticeIndex;
}

- (void)setEnrouteNoticeIndex:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x800040u;
  self->_enrouteNoticeIndex = a3;
}

- (void)setHasEnrouteNoticeIndex:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 8388672;
  else
    v3 = 0x800000;
  self->_flags = ($FCA46E1F49AB8635A99719300DB73115)(*(_DWORD *)&self->_flags & 0xFFFFFFBF | v3);
}

- (BOOL)hasEnrouteNoticeIndex
{
  return (*(_BYTE *)&self->_flags >> 6) & 1;
}

- (unsigned)startValidDistanceOffsetCm
{
  return self->_startValidDistanceOffsetCm;
}

- (void)setStartValidDistanceOffsetCm:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x800400u;
  self->_startValidDistanceOffsetCm = a3;
}

- (void)setHasStartValidDistanceOffsetCm:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 8389632;
  else
    v3 = 0x800000;
  self->_flags = ($FCA46E1F49AB8635A99719300DB73115)(*(_DWORD *)&self->_flags & 0xFFFFFBFF | v3);
}

- (BOOL)hasStartValidDistanceOffsetCm
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 2) & 1;
}

- (unsigned)endValidDistanceOffsetCm
{
  return self->_endValidDistanceOffsetCm;
}

- (void)setEndValidDistanceOffsetCm:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x800010u;
  self->_endValidDistanceOffsetCm = a3;
}

- (void)setHasEndValidDistanceOffsetCm:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 8388624;
  else
    v3 = 0x800000;
  self->_flags = ($FCA46E1F49AB8635A99719300DB73115)(*(_DWORD *)&self->_flags & 0xFFFFFFEF | v3);
}

- (BOOL)hasEndValidDistanceOffsetCm
{
  return (*(_BYTE *)&self->_flags >> 4) & 1;
}

- (unsigned)distanceReferenceEndpointOffsetCm
{
  return self->_distanceReferenceEndpointOffsetCm;
}

- (void)setDistanceReferenceEndpointOffsetCm:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x800004u;
  self->_distanceReferenceEndpointOffsetCm = a3;
}

- (void)setHasDistanceReferenceEndpointOffsetCm:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 8388612;
  else
    v3 = 0x800000;
  self->_flags = ($FCA46E1F49AB8635A99719300DB73115)(*(_DWORD *)&self->_flags & 0xFFFFFFFB | v3);
}

- (BOOL)hasDistanceReferenceEndpointOffsetCm
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (BOOL)preserveEventInUpdates
{
  os_unfair_lock_s *p_readerLock;
  $FCA46E1F49AB8635A99719300DB73115 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  return (*(_WORD *)&flags & 0x2000) == 0 || self->_preserveEventInUpdates;
}

- (void)setPreserveEventInUpdates:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x802000u;
  self->_preserveEventInUpdates = a3;
}

- (void)setHasPreserveEventInUpdates:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 8396800;
  else
    v3 = 0x800000;
  self->_flags = ($FCA46E1F49AB8635A99719300DB73115)(*(_DWORD *)&self->_flags & 0xFFFFDFFF | v3);
}

- (BOOL)hasPreserveEventInUpdates
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 5) & 1;
}

- (void)_readImportanceInfo
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_BYTE *)(a1 + 158) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOGuidanceEventReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readImportanceInfo_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (BOOL)hasImportanceInfo
{
  -[GEOGuidanceEvent _readImportanceInfo]((uint64_t)self);
  return self->_importanceInfo != 0;
}

- (GEOGuidanceImportanceMode)importanceInfo
{
  -[GEOGuidanceEvent _readImportanceInfo]((uint64_t)self);
  return self->_importanceInfo;
}

- (void)setImportanceInfo:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x820000u;
  objc_storeStrong((id *)&self->_importanceInfo, a3);
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
  v8.super_class = (Class)GEOGuidanceEvent;
  -[GEOGuidanceEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOGuidanceEvent dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOGuidanceEvent _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  int v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  void *v27;
  void *v28;
  const __CFString *v29;
  void *v30;
  void *v31;
  void *v32;
  const __CFString *v33;
  int v34;
  void *v35;
  const __CFString *v36;
  void *v37;
  void *v38;
  void *v39;
  const __CFString *v40;
  void *v41;
  const __CFString *v42;
  void *v43;
  const __CFString *v44;
  void *v45;
  const __CFString *v46;
  uint64_t v47;
  __CFString *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  id v54;
  const __CFString *v56;
  void *v57;
  void *v58;
  const __CFString *v59;
  void *v60;
  void *v61;
  const __CFString *v62;
  void *v63;
  const __CFString *v64;
  void *v65;
  const __CFString *v66;
  void *v67;
  const __CFString *v68;
  void *v69;
  const __CFString *v70;
  _QWORD v71[4];
  id v72;

  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_DWORD *)(a1 + 156);
  if ((v5 & 0x800) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 144));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v7 = CFSTR("startValidDistance");
    else
      v7 = CFSTR("start_valid_distance");
    objc_msgSend(v4, "setObject:forKey:", v6, v7);

    v5 = *(_DWORD *)(a1 + 156);
  }
  if ((v5 & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 120));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v9 = CFSTR("endValidDistance");
    else
      v9 = CFSTR("end_valid_distance");
    objc_msgSend(v4, "setObject:forKey:", v8, v9);

  }
  objc_msgSend((id)a1, "signGuidance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v10, "jsonRepresentation");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = CFSTR("signGuidance");
    }
    else
    {
      objc_msgSend(v10, "dictionaryRepresentation");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = CFSTR("sign_guidance");
    }
    objc_msgSend(v4, "setObject:forKey:", v12, v13);

  }
  objc_msgSend((id)a1, "spokenGuidance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v14, "jsonRepresentation");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = CFSTR("spokenGuidance");
    }
    else
    {
      objc_msgSend(v14, "dictionaryRepresentation");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = CFSTR("spoken_guidance");
    }
    objc_msgSend(v4, "setObject:forKey:", v16, v17);

  }
  objc_msgSend((id)a1, "laneGuidance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v18)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v18, "jsonRepresentation");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = CFSTR("laneGuidance");
    }
    else
    {
      objc_msgSend(v18, "dictionaryRepresentation");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = CFSTR("lane_guidance");
    }
    objc_msgSend(v4, "setObject:forKey:", v20, v21);

  }
  objc_msgSend((id)a1, "arGuidance");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22;
  if (v22)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v22, "jsonRepresentation");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = CFSTR("arGuidance");
    }
    else
    {
      objc_msgSend(v22, "dictionaryRepresentation");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = CFSTR("ar_guidance");
    }
    objc_msgSend(v4, "setObject:forKey:", v24, v25);

  }
  objc_msgSend((id)a1, "navTrayGuidance");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v26;
  if (v26)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v26, "jsonRepresentation");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = CFSTR("navTrayGuidance");
    }
    else
    {
      objc_msgSend(v26, "dictionaryRepresentation");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = CFSTR("nav_tray_guidance");
    }
    objc_msgSend(v4, "setObject:forKey:", v28, v29);

  }
  objc_msgSend((id)a1, "junctionView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v30;
  if (v30)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v30, "jsonRepresentation");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = CFSTR("junctionView");
    }
    else
    {
      objc_msgSend(v30, "dictionaryRepresentation");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = CFSTR("junction_view");
    }
    objc_msgSend(v4, "setObject:forKey:", v32, v33);

  }
  v34 = *(_DWORD *)(a1 + 156);
  if ((v34 & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 112));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v42 = CFSTR("distanceZilchIndex");
    else
      v42 = CFSTR("distance_zilch_index");
    objc_msgSend(v4, "setObject:forKey:", v41, v42);

    v34 = *(_DWORD *)(a1 + 156);
    if ((v34 & 2) == 0)
    {
LABEL_44:
      if ((v34 & 1) == 0)
        goto LABEL_45;
      goto LABEL_70;
    }
  }
  else if ((v34 & 2) == 0)
  {
    goto LABEL_44;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 64));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v44 = CFSTR("minSpeed");
  else
    v44 = CFSTR("min_speed");
  objc_msgSend(v4, "setObject:forKey:", v43, v44);

  v34 = *(_DWORD *)(a1 + 156);
  if ((v34 & 1) == 0)
  {
LABEL_45:
    if ((v34 & 0x80) == 0)
      goto LABEL_46;
    goto LABEL_74;
  }
LABEL_70:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 56));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v46 = CFSTR("maxSpeed");
  else
    v46 = CFSTR("max_speed");
  objc_msgSend(v4, "setObject:forKey:", v45, v46);

  v34 = *(_DWORD *)(a1 + 156);
  if ((v34 & 0x80) == 0)
  {
LABEL_46:
    if ((v34 & 0x100) == 0)
      goto LABEL_47;
    goto LABEL_89;
  }
LABEL_74:
  v47 = *(int *)(a1 + 128);
  if (v47 >= 0xF)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 128));
    v48 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v48 = off_1E1C08220[v47];
  }
  if (a2)
    v56 = CFSTR("eventType");
  else
    v56 = CFSTR("event_type");
  objc_msgSend(v4, "setObject:forKey:", v48, v56);

  v34 = *(_DWORD *)(a1 + 156);
  if ((v34 & 0x100) == 0)
  {
LABEL_47:
    if ((v34 & 0x200) == 0)
      goto LABEL_48;
    goto LABEL_90;
  }
LABEL_89:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 132));
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v57, CFSTR("identifier"));

  v34 = *(_DWORD *)(a1 + 156);
  if ((v34 & 0x200) == 0)
  {
LABEL_48:
    if ((v34 & 0x4000) == 0)
      goto LABEL_49;
    goto LABEL_94;
  }
LABEL_90:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 136));
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v59 = CFSTR("offsetForDistanceString");
  else
    v59 = CFSTR("offset_for_distance_string");
  objc_msgSend(v4, "setObject:forKey:", v58, v59);

  v34 = *(_DWORD *)(a1 + 156);
  if ((v34 & 0x4000) == 0)
  {
LABEL_49:
    if ((v34 & 0x1000) == 0)
      goto LABEL_50;
    goto LABEL_95;
  }
LABEL_94:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 153));
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v60, CFSTR("sticky"));

  v34 = *(_DWORD *)(a1 + 156);
  if ((v34 & 0x1000) == 0)
  {
LABEL_50:
    if ((v34 & 0x40) == 0)
      goto LABEL_51;
    goto LABEL_99;
  }
LABEL_95:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 148));
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v62 = CFSTR("zilchPathIndex");
  else
    v62 = CFSTR("zilch_path_index");
  objc_msgSend(v4, "setObject:forKey:", v61, v62);

  v34 = *(_DWORD *)(a1 + 156);
  if ((v34 & 0x40) == 0)
  {
LABEL_51:
    if ((v34 & 0x400) == 0)
      goto LABEL_52;
    goto LABEL_103;
  }
LABEL_99:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 124));
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v64 = CFSTR("enrouteNoticeIndex");
  else
    v64 = CFSTR("enroute_notice_index");
  objc_msgSend(v4, "setObject:forKey:", v63, v64);

  v34 = *(_DWORD *)(a1 + 156);
  if ((v34 & 0x400) == 0)
  {
LABEL_52:
    if ((v34 & 0x10) == 0)
      goto LABEL_53;
    goto LABEL_107;
  }
LABEL_103:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 140));
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v66 = CFSTR("startValidDistanceOffsetCm");
  else
    v66 = CFSTR("start_valid_distance_offset_cm");
  objc_msgSend(v4, "setObject:forKey:", v65, v66);

  v34 = *(_DWORD *)(a1 + 156);
  if ((v34 & 0x10) == 0)
  {
LABEL_53:
    if ((v34 & 4) == 0)
      goto LABEL_54;
LABEL_111:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 108));
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v70 = CFSTR("distanceReferenceEndpointOffsetCm");
    else
      v70 = CFSTR("distance_reference_endpoint_offset_cm");
    objc_msgSend(v4, "setObject:forKey:", v69, v70);

    if ((*(_DWORD *)(a1 + 156) & 0x2000) == 0)
      goto LABEL_59;
    goto LABEL_55;
  }
LABEL_107:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 116));
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v68 = CFSTR("endValidDistanceOffsetCm");
  else
    v68 = CFSTR("end_valid_distance_offset_cm");
  objc_msgSend(v4, "setObject:forKey:", v67, v68);

  v34 = *(_DWORD *)(a1 + 156);
  if ((v34 & 4) != 0)
    goto LABEL_111;
LABEL_54:
  if ((v34 & 0x2000) != 0)
  {
LABEL_55:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 152));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v36 = CFSTR("preserveEventInUpdates");
    else
      v36 = CFSTR("preserve_event_in_updates");
    objc_msgSend(v4, "setObject:forKey:", v35, v36);

  }
LABEL_59:
  objc_msgSend((id)a1, "importanceInfo");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v37;
  if (v37)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v37, "jsonRepresentation");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = CFSTR("importanceInfo");
    }
    else
    {
      objc_msgSend(v37, "dictionaryRepresentation");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = CFSTR("importance_info");
    }
    objc_msgSend(v4, "setObject:forKey:", v39, v40);

  }
  v49 = *(void **)(a1 + 16);
  if (v49)
  {
    objc_msgSend(v49, "dictionaryRepresentation");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = v50;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v50, "count"));
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v71[0] = MEMORY[0x1E0C809B0];
      v71[1] = 3221225472;
      v71[2] = __46__GEOGuidanceEvent__dictionaryRepresentation___block_invoke;
      v71[3] = &unk_1E1C00600;
      v53 = v52;
      v72 = v53;
      objc_msgSend(v51, "enumerateKeysAndObjectsUsingBlock:", v71);
      v54 = v53;

      v51 = v54;
    }
    objc_msgSend(v4, "setObject:forKey:", v51, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOGuidanceEvent _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __46__GEOGuidanceEvent__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOGuidanceEvent)initWithDictionary:(id)a3
{
  return (GEOGuidanceEvent *)-[GEOGuidanceEvent _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  GEOSignGuidance *v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  GEOSpokenGuidance *v17;
  uint64_t v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  GEOVisualLaneGuidance *v22;
  uint64_t v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  GEOARGuidance *v27;
  uint64_t v28;
  void *v29;
  const __CFString *v30;
  void *v31;
  GEONavTrayGuidance *v32;
  uint64_t v33;
  void *v34;
  const __CFString *v35;
  void *v36;
  GEOJunctionView *v37;
  uint64_t v38;
  void *v39;
  const __CFString *v40;
  void *v41;
  const __CFString *v42;
  void *v43;
  const __CFString *v44;
  void *v45;
  const __CFString *v46;
  void *v47;
  id v48;
  uint64_t v49;
  void *v50;
  const __CFString *v51;
  void *v52;
  void *v53;
  const __CFString *v54;
  void *v55;
  const __CFString *v56;
  void *v57;
  const __CFString *v58;
  void *v59;
  const __CFString *v60;
  void *v61;
  const __CFString *v62;
  void *v63;
  const __CFString *v64;
  void *v65;
  const __CFString *v66;
  void *v67;
  GEOGuidanceImportanceMode *v68;
  uint64_t v69;
  void *v70;

  v5 = a2;
  if (!a1)
    goto LABEL_163;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_163;
  if (a3)
    v6 = CFSTR("startValidDistance");
  else
    v6 = CFSTR("start_valid_distance");
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setStartValidDistance:", objc_msgSend(v7, "intValue"));

  if (a3)
    v8 = CFSTR("endValidDistance");
  else
    v8 = CFSTR("end_valid_distance");
  objc_msgSend(v5, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setEndValidDistance:", objc_msgSend(v9, "intValue"));

  if (a3)
    v10 = CFSTR("signGuidance");
  else
    v10 = CFSTR("sign_guidance");
  objc_msgSend(v5, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12 = [GEOSignGuidance alloc];
    if ((a3 & 1) != 0)
      v13 = -[GEOSignGuidance initWithJSON:](v12, "initWithJSON:", v11);
    else
      v13 = -[GEOSignGuidance initWithDictionary:](v12, "initWithDictionary:", v11);
    v14 = (void *)v13;
    objc_msgSend(a1, "setSignGuidance:", v13);

  }
  if (a3)
    v15 = CFSTR("spokenGuidance");
  else
    v15 = CFSTR("spoken_guidance");
  objc_msgSend(v5, "objectForKeyedSubscript:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v17 = [GEOSpokenGuidance alloc];
    if ((a3 & 1) != 0)
      v18 = -[GEOSpokenGuidance initWithJSON:](v17, "initWithJSON:", v16);
    else
      v18 = -[GEOSpokenGuidance initWithDictionary:](v17, "initWithDictionary:", v16);
    v19 = (void *)v18;
    objc_msgSend(a1, "setSpokenGuidance:", v18);

  }
  if (a3)
    v20 = CFSTR("laneGuidance");
  else
    v20 = CFSTR("lane_guidance");
  objc_msgSend(v5, "objectForKeyedSubscript:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v22 = [GEOVisualLaneGuidance alloc];
    if ((a3 & 1) != 0)
      v23 = -[GEOVisualLaneGuidance initWithJSON:](v22, "initWithJSON:", v21);
    else
      v23 = -[GEOVisualLaneGuidance initWithDictionary:](v22, "initWithDictionary:", v21);
    v24 = (void *)v23;
    objc_msgSend(a1, "setLaneGuidance:", v23);

  }
  if (a3)
    v25 = CFSTR("arGuidance");
  else
    v25 = CFSTR("ar_guidance");
  objc_msgSend(v5, "objectForKeyedSubscript:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v27 = [GEOARGuidance alloc];
    if ((a3 & 1) != 0)
      v28 = -[GEOARGuidance initWithJSON:](v27, "initWithJSON:", v26);
    else
      v28 = -[GEOARGuidance initWithDictionary:](v27, "initWithDictionary:", v26);
    v29 = (void *)v28;
    objc_msgSend(a1, "setArGuidance:", v28);

  }
  if (a3)
    v30 = CFSTR("navTrayGuidance");
  else
    v30 = CFSTR("nav_tray_guidance");
  objc_msgSend(v5, "objectForKeyedSubscript:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v32 = [GEONavTrayGuidance alloc];
    if ((a3 & 1) != 0)
      v33 = -[GEONavTrayGuidance initWithJSON:](v32, "initWithJSON:", v31);
    else
      v33 = -[GEONavTrayGuidance initWithDictionary:](v32, "initWithDictionary:", v31);
    v34 = (void *)v33;
    objc_msgSend(a1, "setNavTrayGuidance:", v33);

  }
  if (a3)
    v35 = CFSTR("junctionView");
  else
    v35 = CFSTR("junction_view");
  objc_msgSend(v5, "objectForKeyedSubscript:", v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v37 = [GEOJunctionView alloc];
    if ((a3 & 1) != 0)
      v38 = -[GEOJunctionView initWithJSON:](v37, "initWithJSON:", v36);
    else
      v38 = -[GEOJunctionView initWithDictionary:](v37, "initWithDictionary:", v36);
    v39 = (void *)v38;
    objc_msgSend(a1, "setJunctionView:", v38);

  }
  if (a3)
    v40 = CFSTR("distanceZilchIndex");
  else
    v40 = CFSTR("distance_zilch_index");
  objc_msgSend(v5, "objectForKeyedSubscript:", v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setDistanceZilchIndex:", objc_msgSend(v41, "intValue"));

  if (a3)
    v42 = CFSTR("minSpeed");
  else
    v42 = CFSTR("min_speed");
  objc_msgSend(v5, "objectForKeyedSubscript:", v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v43, "doubleValue");
    objc_msgSend(a1, "setMinSpeed:");
  }

  if (a3)
    v44 = CFSTR("maxSpeed");
  else
    v44 = CFSTR("max_speed");
  objc_msgSend(v5, "objectForKeyedSubscript:", v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v45, "doubleValue");
    objc_msgSend(a1, "setMaxSpeed:");
  }

  if (a3)
    v46 = CFSTR("eventType");
  else
    v46 = CFSTR("event_type");
  objc_msgSend(v5, "objectForKeyedSubscript:", v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v48 = v47;
    if ((objc_msgSend(v48, "isEqualToString:", CFSTR("UNKNOWN_GUIDANCE_EVENT_TYPE")) & 1) != 0)
    {
      v49 = 0;
    }
    else if ((objc_msgSend(v48, "isEqualToString:", CFSTR("START")) & 1) != 0)
    {
      v49 = 1;
    }
    else if ((objc_msgSend(v48, "isEqualToString:", CFSTR("GET_ON_ROUTE")) & 1) != 0)
    {
      v49 = 2;
    }
    else if ((objc_msgSend(v48, "isEqualToString:", CFSTR("RETURN_TO_ROUTE")) & 1) != 0)
    {
      v49 = 3;
    }
    else if ((objc_msgSend(v48, "isEqualToString:", CFSTR("MERGE")) & 1) != 0)
    {
      v49 = 4;
    }
    else if ((objc_msgSend(v48, "isEqualToString:", CFSTR("CONTINUE")) & 1) != 0)
    {
      v49 = 5;
    }
    else if ((objc_msgSend(v48, "isEqualToString:", CFSTR("INITIAL")) & 1) != 0)
    {
      v49 = 6;
    }
    else if ((objc_msgSend(v48, "isEqualToString:", CFSTR("PREPARE")) & 1) != 0)
    {
      v49 = 7;
    }
    else if ((objc_msgSend(v48, "isEqualToString:", CFSTR("EXECUTE")) & 1) != 0)
    {
      v49 = 8;
    }
    else if ((objc_msgSend(v48, "isEqualToString:", CFSTR("LANE_MID_STEP")) & 1) != 0)
    {
      v49 = 9;
    }
    else if ((objc_msgSend(v48, "isEqualToString:", CFSTR("LANE_MANEUVER")) & 1) != 0)
    {
      v49 = 10;
    }
    else if ((objc_msgSend(v48, "isEqualToString:", CFSTR("END")) & 1) != 0)
    {
      v49 = 11;
    }
    else if ((objc_msgSend(v48, "isEqualToString:", CFSTR("PRE_ARRIVAL_MODE_END")) & 1) != 0)
    {
      v49 = 12;
    }
    else if ((objc_msgSend(v48, "isEqualToString:", CFSTR("ARRIVAL_CHARGING_STATION")) & 1) != 0)
    {
      v49 = 13;
    }
    else if (objc_msgSend(v48, "isEqualToString:", CFSTR("CHARGING_AT_STATION")))
    {
      v49 = 14;
    }
    else
    {
      v49 = 0;
    }

    goto LABEL_114;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v49 = objc_msgSend(v47, "intValue");
LABEL_114:
    objc_msgSend(a1, "setEventType:", v49);
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("identifier"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setIdentifier:", objc_msgSend(v50, "unsignedIntValue"));

  if (a3)
    v51 = CFSTR("offsetForDistanceString");
  else
    v51 = CFSTR("offset_for_distance_string");
  objc_msgSend(v5, "objectForKeyedSubscript:", v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setOffsetForDistanceString:", objc_msgSend(v52, "intValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("sticky"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setSticky:", objc_msgSend(v53, "BOOLValue"));

  if (a3)
    v54 = CFSTR("zilchPathIndex");
  else
    v54 = CFSTR("zilch_path_index");
  objc_msgSend(v5, "objectForKeyedSubscript:", v54);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setZilchPathIndex:", objc_msgSend(v55, "unsignedIntValue"));

  if (a3)
    v56 = CFSTR("enrouteNoticeIndex");
  else
    v56 = CFSTR("enroute_notice_index");
  objc_msgSend(v5, "objectForKeyedSubscript:", v56);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setEnrouteNoticeIndex:", objc_msgSend(v57, "unsignedIntValue"));

  if (a3)
    v58 = CFSTR("startValidDistanceOffsetCm");
  else
    v58 = CFSTR("start_valid_distance_offset_cm");
  objc_msgSend(v5, "objectForKeyedSubscript:", v58);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setStartValidDistanceOffsetCm:", objc_msgSend(v59, "unsignedIntValue"));

  if (a3)
    v60 = CFSTR("endValidDistanceOffsetCm");
  else
    v60 = CFSTR("end_valid_distance_offset_cm");
  objc_msgSend(v5, "objectForKeyedSubscript:", v60);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setEndValidDistanceOffsetCm:", objc_msgSend(v61, "unsignedIntValue"));

  if (a3)
    v62 = CFSTR("distanceReferenceEndpointOffsetCm");
  else
    v62 = CFSTR("distance_reference_endpoint_offset_cm");
  objc_msgSend(v5, "objectForKeyedSubscript:", v62);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setDistanceReferenceEndpointOffsetCm:", objc_msgSend(v63, "unsignedIntValue"));

  if (a3)
    v64 = CFSTR("preserveEventInUpdates");
  else
    v64 = CFSTR("preserve_event_in_updates");
  objc_msgSend(v5, "objectForKeyedSubscript:", v64);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setPreserveEventInUpdates:", objc_msgSend(v65, "BOOLValue"));

  if (a3)
    v66 = CFSTR("importanceInfo");
  else
    v66 = CFSTR("importance_info");
  objc_msgSend(v5, "objectForKeyedSubscript:", v66);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v68 = [GEOGuidanceImportanceMode alloc];
    if ((a3 & 1) != 0)
      v69 = -[GEOGuidanceImportanceMode initWithJSON:](v68, "initWithJSON:", v67);
    else
      v69 = -[GEOGuidanceImportanceMode initWithDictionary:](v68, "initWithDictionary:", v67);
    v70 = (void *)v69;
    objc_msgSend(a1, "setImportanceInfo:", v69);

  }
LABEL_163:

  return a1;
}

- (GEOGuidanceEvent)initWithJSON:(id)a3
{
  return (GEOGuidanceEvent *)-[GEOGuidanceEvent _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_2412;
    else
      v8 = (int *)&readAll__nonRecursiveTag_2413;
    GEOGuidanceEventReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEOGuidanceEventCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOGuidanceEventIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOGuidanceEventReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  $FCA46E1F49AB8635A99719300DB73115 flags;
  id v6;
  $FCA46E1F49AB8635A99719300DB73115 v7;
  PBDataReader *v8;
  void *v9;
  id v10;

  v10 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOGuidanceEventIsDirty((uint64_t)self) & 1) == 0)
  {
    v8 = self->_reader;
    objc_sync_enter(v8);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "writeData:", v9);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v8);
    goto LABEL_50;
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOGuidanceEvent readAll:](self, "readAll:", 0);
  flags = self->_flags;
  if ((*(_WORD *)&flags & 0x800) != 0)
  {
    PBDataWriterWriteInt32Field();
    flags = self->_flags;
  }
  v6 = v10;
  if ((*(_BYTE *)&flags & 0x20) != 0)
  {
    PBDataWriterWriteInt32Field();
    v6 = v10;
  }
  if (self->_signGuidance)
  {
    PBDataWriterWriteSubmessage();
    v6 = v10;
  }
  if (self->_spokenGuidance)
  {
    PBDataWriterWriteSubmessage();
    v6 = v10;
  }
  if (self->_laneGuidance)
  {
    PBDataWriterWriteSubmessage();
    v6 = v10;
  }
  if (self->_arGuidance)
  {
    PBDataWriterWriteSubmessage();
    v6 = v10;
  }
  if (self->_navTrayGuidance)
  {
    PBDataWriterWriteSubmessage();
    v6 = v10;
  }
  if (self->_junctionView)
  {
    PBDataWriterWriteSubmessage();
    v6 = v10;
  }
  v7 = self->_flags;
  if ((*(_BYTE *)&v7 & 8) != 0)
  {
    PBDataWriterWriteInt32Field();
    v6 = v10;
    v7 = self->_flags;
    if ((*(_BYTE *)&v7 & 2) == 0)
    {
LABEL_21:
      if ((*(_BYTE *)&v7 & 1) == 0)
        goto LABEL_22;
      goto LABEL_38;
    }
  }
  else if ((*(_BYTE *)&v7 & 2) == 0)
  {
    goto LABEL_21;
  }
  PBDataWriterWriteDoubleField();
  v6 = v10;
  v7 = self->_flags;
  if ((*(_BYTE *)&v7 & 1) == 0)
  {
LABEL_22:
    if ((*(_BYTE *)&v7 & 0x80) == 0)
      goto LABEL_23;
    goto LABEL_39;
  }
LABEL_38:
  PBDataWriterWriteDoubleField();
  v6 = v10;
  v7 = self->_flags;
  if ((*(_BYTE *)&v7 & 0x80) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&v7 & 0x100) == 0)
      goto LABEL_24;
    goto LABEL_40;
  }
LABEL_39:
  PBDataWriterWriteInt32Field();
  v6 = v10;
  v7 = self->_flags;
  if ((*(_WORD *)&v7 & 0x100) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&v7 & 0x200) == 0)
      goto LABEL_25;
    goto LABEL_41;
  }
LABEL_40:
  PBDataWriterWriteUint32Field();
  v6 = v10;
  v7 = self->_flags;
  if ((*(_WORD *)&v7 & 0x200) == 0)
  {
LABEL_25:
    if ((*(_WORD *)&v7 & 0x4000) == 0)
      goto LABEL_26;
    goto LABEL_42;
  }
LABEL_41:
  PBDataWriterWriteInt32Field();
  v6 = v10;
  v7 = self->_flags;
  if ((*(_WORD *)&v7 & 0x4000) == 0)
  {
LABEL_26:
    if ((*(_WORD *)&v7 & 0x1000) == 0)
      goto LABEL_27;
    goto LABEL_43;
  }
LABEL_42:
  PBDataWriterWriteBOOLField();
  v6 = v10;
  v7 = self->_flags;
  if ((*(_WORD *)&v7 & 0x1000) == 0)
  {
LABEL_27:
    if ((*(_BYTE *)&v7 & 0x40) == 0)
      goto LABEL_28;
    goto LABEL_44;
  }
LABEL_43:
  PBDataWriterWriteUint32Field();
  v6 = v10;
  v7 = self->_flags;
  if ((*(_BYTE *)&v7 & 0x40) == 0)
  {
LABEL_28:
    if ((*(_WORD *)&v7 & 0x400) == 0)
      goto LABEL_29;
    goto LABEL_45;
  }
LABEL_44:
  PBDataWriterWriteUint32Field();
  v6 = v10;
  v7 = self->_flags;
  if ((*(_WORD *)&v7 & 0x400) == 0)
  {
LABEL_29:
    if ((*(_BYTE *)&v7 & 0x10) == 0)
      goto LABEL_30;
    goto LABEL_46;
  }
LABEL_45:
  PBDataWriterWriteUint32Field();
  v6 = v10;
  v7 = self->_flags;
  if ((*(_BYTE *)&v7 & 0x10) == 0)
  {
LABEL_30:
    if ((*(_BYTE *)&v7 & 4) == 0)
      goto LABEL_31;
LABEL_47:
    PBDataWriterWriteUint32Field();
    v6 = v10;
    if ((*(_DWORD *)&self->_flags & 0x2000) == 0)
      goto LABEL_33;
    goto LABEL_32;
  }
LABEL_46:
  PBDataWriterWriteUint32Field();
  v6 = v10;
  v7 = self->_flags;
  if ((*(_BYTE *)&v7 & 4) != 0)
    goto LABEL_47;
LABEL_31:
  if ((*(_WORD *)&v7 & 0x2000) != 0)
  {
LABEL_32:
    PBDataWriterWriteBOOLField();
    v6 = v10;
  }
LABEL_33:
  if (self->_importanceInfo)
  {
    PBDataWriterWriteSubmessage();
    v6 = v10;
  }
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v6);
LABEL_50:

}

- (void)copyTo:(id)a3
{
  id *v4;
  $FCA46E1F49AB8635A99719300DB73115 flags;
  $FCA46E1F49AB8635A99719300DB73115 v6;
  id *v7;

  v7 = (id *)a3;
  -[GEOGuidanceEvent readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v7 + 1, self->_reader);
  *((_DWORD *)v7 + 24) = self->_readerMarkPos;
  *((_DWORD *)v7 + 25) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  v4 = v7;
  flags = self->_flags;
  if ((*(_WORD *)&flags & 0x800) != 0)
  {
    *((_DWORD *)v7 + 36) = self->_startValidDistance;
    *((_DWORD *)v7 + 39) |= 0x800u;
    flags = self->_flags;
  }
  if ((*(_BYTE *)&flags & 0x20) != 0)
  {
    *((_DWORD *)v7 + 30) = self->_endValidDistance;
    *((_DWORD *)v7 + 39) |= 0x20u;
  }
  if (self->_signGuidance)
  {
    objc_msgSend(v7, "setSignGuidance:");
    v4 = v7;
  }
  if (self->_spokenGuidance)
  {
    objc_msgSend(v7, "setSpokenGuidance:");
    v4 = v7;
  }
  if (self->_laneGuidance)
  {
    objc_msgSend(v7, "setLaneGuidance:");
    v4 = v7;
  }
  if (self->_arGuidance)
  {
    objc_msgSend(v7, "setArGuidance:");
    v4 = v7;
  }
  if (self->_navTrayGuidance)
  {
    objc_msgSend(v7, "setNavTrayGuidance:");
    v4 = v7;
  }
  if (self->_junctionView)
  {
    objc_msgSend(v7, "setJunctionView:");
    v4 = v7;
  }
  v6 = self->_flags;
  if ((*(_BYTE *)&v6 & 8) != 0)
  {
    *((_DWORD *)v4 + 28) = self->_distanceZilchIndex;
    *((_DWORD *)v4 + 39) |= 8u;
    v6 = self->_flags;
    if ((*(_BYTE *)&v6 & 2) == 0)
    {
LABEL_19:
      if ((*(_BYTE *)&v6 & 1) == 0)
        goto LABEL_20;
      goto LABEL_36;
    }
  }
  else if ((*(_BYTE *)&v6 & 2) == 0)
  {
    goto LABEL_19;
  }
  v4[8] = *(id *)&self->_minSpeed;
  *((_DWORD *)v4 + 39) |= 2u;
  v6 = self->_flags;
  if ((*(_BYTE *)&v6 & 1) == 0)
  {
LABEL_20:
    if ((*(_BYTE *)&v6 & 0x80) == 0)
      goto LABEL_21;
    goto LABEL_37;
  }
LABEL_36:
  v4[7] = *(id *)&self->_maxSpeed;
  *((_DWORD *)v4 + 39) |= 1u;
  v6 = self->_flags;
  if ((*(_BYTE *)&v6 & 0x80) == 0)
  {
LABEL_21:
    if ((*(_WORD *)&v6 & 0x100) == 0)
      goto LABEL_22;
    goto LABEL_38;
  }
LABEL_37:
  *((_DWORD *)v4 + 32) = self->_eventType;
  *((_DWORD *)v4 + 39) |= 0x80u;
  v6 = self->_flags;
  if ((*(_WORD *)&v6 & 0x100) == 0)
  {
LABEL_22:
    if ((*(_WORD *)&v6 & 0x200) == 0)
      goto LABEL_23;
    goto LABEL_39;
  }
LABEL_38:
  *((_DWORD *)v4 + 33) = self->_identifier;
  *((_DWORD *)v4 + 39) |= 0x100u;
  v6 = self->_flags;
  if ((*(_WORD *)&v6 & 0x200) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&v6 & 0x4000) == 0)
      goto LABEL_24;
    goto LABEL_40;
  }
LABEL_39:
  *((_DWORD *)v4 + 34) = self->_offsetForDistanceString;
  *((_DWORD *)v4 + 39) |= 0x200u;
  v6 = self->_flags;
  if ((*(_WORD *)&v6 & 0x4000) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&v6 & 0x1000) == 0)
      goto LABEL_25;
    goto LABEL_41;
  }
LABEL_40:
  *((_BYTE *)v4 + 153) = self->_sticky;
  *((_DWORD *)v4 + 39) |= 0x4000u;
  v6 = self->_flags;
  if ((*(_WORD *)&v6 & 0x1000) == 0)
  {
LABEL_25:
    if ((*(_BYTE *)&v6 & 0x40) == 0)
      goto LABEL_26;
    goto LABEL_42;
  }
LABEL_41:
  *((_DWORD *)v4 + 37) = self->_zilchPathIndex;
  *((_DWORD *)v4 + 39) |= 0x1000u;
  v6 = self->_flags;
  if ((*(_BYTE *)&v6 & 0x40) == 0)
  {
LABEL_26:
    if ((*(_WORD *)&v6 & 0x400) == 0)
      goto LABEL_27;
    goto LABEL_43;
  }
LABEL_42:
  *((_DWORD *)v4 + 31) = self->_enrouteNoticeIndex;
  *((_DWORD *)v4 + 39) |= 0x40u;
  v6 = self->_flags;
  if ((*(_WORD *)&v6 & 0x400) == 0)
  {
LABEL_27:
    if ((*(_BYTE *)&v6 & 0x10) == 0)
      goto LABEL_28;
    goto LABEL_44;
  }
LABEL_43:
  *((_DWORD *)v4 + 35) = self->_startValidDistanceOffsetCm;
  *((_DWORD *)v4 + 39) |= 0x400u;
  v6 = self->_flags;
  if ((*(_BYTE *)&v6 & 0x10) == 0)
  {
LABEL_28:
    if ((*(_BYTE *)&v6 & 4) == 0)
      goto LABEL_29;
    goto LABEL_45;
  }
LABEL_44:
  *((_DWORD *)v4 + 29) = self->_endValidDistanceOffsetCm;
  *((_DWORD *)v4 + 39) |= 0x10u;
  v6 = self->_flags;
  if ((*(_BYTE *)&v6 & 4) == 0)
  {
LABEL_29:
    if ((*(_WORD *)&v6 & 0x2000) == 0)
      goto LABEL_31;
    goto LABEL_30;
  }
LABEL_45:
  *((_DWORD *)v4 + 27) = self->_distanceReferenceEndpointOffsetCm;
  *((_DWORD *)v4 + 39) |= 4u;
  if ((*(_DWORD *)&self->_flags & 0x2000) != 0)
  {
LABEL_30:
    *((_BYTE *)v4 + 152) = self->_preserveEventInUpdates;
    *((_DWORD *)v4 + 39) |= 0x2000u;
  }
LABEL_31:
  if (self->_importanceInfo)
  {
    objc_msgSend(v7, "setImportanceInfo:");
    v4 = v7;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  $FCA46E1F49AB8635A99719300DB73115 flags;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  $FCA46E1F49AB8635A99719300DB73115 v22;
  id v23;
  void *v24;
  PBUnknownFields *v25;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
  {
LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOGuidanceEvent readAll:](self, "readAll:", 0);
    flags = self->_flags;
    if ((*(_WORD *)&flags & 0x800) != 0)
    {
      *(_DWORD *)(v5 + 144) = self->_startValidDistance;
      *(_DWORD *)(v5 + 156) |= 0x800u;
      flags = self->_flags;
    }
    if ((*(_BYTE *)&flags & 0x20) != 0)
    {
      *(_DWORD *)(v5 + 120) = self->_endValidDistance;
      *(_DWORD *)(v5 + 156) |= 0x20u;
    }
    v10 = -[GEOSignGuidance copyWithZone:](self->_signGuidance, "copyWithZone:", a3);
    v11 = *(void **)(v5 + 80);
    *(_QWORD *)(v5 + 80) = v10;

    v12 = -[GEOSpokenGuidance copyWithZone:](self->_spokenGuidance, "copyWithZone:", a3);
    v13 = *(void **)(v5 + 88);
    *(_QWORD *)(v5 + 88) = v12;

    v14 = -[GEOVisualLaneGuidance copyWithZone:](self->_laneGuidance, "copyWithZone:", a3);
    v15 = *(void **)(v5 + 48);
    *(_QWORD *)(v5 + 48) = v14;

    v16 = -[GEOARGuidance copyWithZone:](self->_arGuidance, "copyWithZone:", a3);
    v17 = *(void **)(v5 + 24);
    *(_QWORD *)(v5 + 24) = v16;

    v18 = -[GEONavTrayGuidance copyWithZone:](self->_navTrayGuidance, "copyWithZone:", a3);
    v19 = *(void **)(v5 + 72);
    *(_QWORD *)(v5 + 72) = v18;

    v20 = -[GEOJunctionView copyWithZone:](self->_junctionView, "copyWithZone:", a3);
    v21 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v20;

    v22 = self->_flags;
    if ((*(_BYTE *)&v22 & 8) != 0)
    {
      *(_DWORD *)(v5 + 112) = self->_distanceZilchIndex;
      *(_DWORD *)(v5 + 156) |= 8u;
      v22 = self->_flags;
      if ((*(_BYTE *)&v22 & 2) == 0)
      {
LABEL_11:
        if ((*(_BYTE *)&v22 & 1) == 0)
          goto LABEL_12;
        goto LABEL_27;
      }
    }
    else if ((*(_BYTE *)&v22 & 2) == 0)
    {
      goto LABEL_11;
    }
    *(double *)(v5 + 64) = self->_minSpeed;
    *(_DWORD *)(v5 + 156) |= 2u;
    v22 = self->_flags;
    if ((*(_BYTE *)&v22 & 1) == 0)
    {
LABEL_12:
      if ((*(_BYTE *)&v22 & 0x80) == 0)
        goto LABEL_13;
      goto LABEL_28;
    }
LABEL_27:
    *(double *)(v5 + 56) = self->_maxSpeed;
    *(_DWORD *)(v5 + 156) |= 1u;
    v22 = self->_flags;
    if ((*(_BYTE *)&v22 & 0x80) == 0)
    {
LABEL_13:
      if ((*(_WORD *)&v22 & 0x100) == 0)
        goto LABEL_14;
      goto LABEL_29;
    }
LABEL_28:
    *(_DWORD *)(v5 + 128) = self->_eventType;
    *(_DWORD *)(v5 + 156) |= 0x80u;
    v22 = self->_flags;
    if ((*(_WORD *)&v22 & 0x100) == 0)
    {
LABEL_14:
      if ((*(_WORD *)&v22 & 0x200) == 0)
        goto LABEL_15;
      goto LABEL_30;
    }
LABEL_29:
    *(_DWORD *)(v5 + 132) = self->_identifier;
    *(_DWORD *)(v5 + 156) |= 0x100u;
    v22 = self->_flags;
    if ((*(_WORD *)&v22 & 0x200) == 0)
    {
LABEL_15:
      if ((*(_WORD *)&v22 & 0x4000) == 0)
        goto LABEL_16;
      goto LABEL_31;
    }
LABEL_30:
    *(_DWORD *)(v5 + 136) = self->_offsetForDistanceString;
    *(_DWORD *)(v5 + 156) |= 0x200u;
    v22 = self->_flags;
    if ((*(_WORD *)&v22 & 0x4000) == 0)
    {
LABEL_16:
      if ((*(_WORD *)&v22 & 0x1000) == 0)
        goto LABEL_17;
      goto LABEL_32;
    }
LABEL_31:
    *(_BYTE *)(v5 + 153) = self->_sticky;
    *(_DWORD *)(v5 + 156) |= 0x4000u;
    v22 = self->_flags;
    if ((*(_WORD *)&v22 & 0x1000) == 0)
    {
LABEL_17:
      if ((*(_BYTE *)&v22 & 0x40) == 0)
        goto LABEL_18;
      goto LABEL_33;
    }
LABEL_32:
    *(_DWORD *)(v5 + 148) = self->_zilchPathIndex;
    *(_DWORD *)(v5 + 156) |= 0x1000u;
    v22 = self->_flags;
    if ((*(_BYTE *)&v22 & 0x40) == 0)
    {
LABEL_18:
      if ((*(_WORD *)&v22 & 0x400) == 0)
        goto LABEL_19;
      goto LABEL_34;
    }
LABEL_33:
    *(_DWORD *)(v5 + 124) = self->_enrouteNoticeIndex;
    *(_DWORD *)(v5 + 156) |= 0x40u;
    v22 = self->_flags;
    if ((*(_WORD *)&v22 & 0x400) == 0)
    {
LABEL_19:
      if ((*(_BYTE *)&v22 & 0x10) == 0)
        goto LABEL_20;
      goto LABEL_35;
    }
LABEL_34:
    *(_DWORD *)(v5 + 140) = self->_startValidDistanceOffsetCm;
    *(_DWORD *)(v5 + 156) |= 0x400u;
    v22 = self->_flags;
    if ((*(_BYTE *)&v22 & 0x10) == 0)
    {
LABEL_20:
      if ((*(_BYTE *)&v22 & 4) == 0)
        goto LABEL_21;
      goto LABEL_36;
    }
LABEL_35:
    *(_DWORD *)(v5 + 116) = self->_endValidDistanceOffsetCm;
    *(_DWORD *)(v5 + 156) |= 0x10u;
    v22 = self->_flags;
    if ((*(_BYTE *)&v22 & 4) == 0)
    {
LABEL_21:
      if ((*(_WORD *)&v22 & 0x2000) == 0)
      {
LABEL_23:
        v23 = -[GEOGuidanceImportanceMode copyWithZone:](self->_importanceInfo, "copyWithZone:", a3);
        v24 = *(void **)(v5 + 32);
        *(_QWORD *)(v5 + 32) = v23;

        v25 = self->_unknownFields;
        v8 = *(id *)(v5 + 16);
        *(_QWORD *)(v5 + 16) = v25;
        goto LABEL_24;
      }
LABEL_22:
      *(_BYTE *)(v5 + 152) = self->_preserveEventInUpdates;
      *(_DWORD *)(v5 + 156) |= 0x2000u;
      goto LABEL_23;
    }
LABEL_36:
    *(_DWORD *)(v5 + 108) = self->_distanceReferenceEndpointOffsetCm;
    *(_DWORD *)(v5 + 156) |= 4u;
    if ((*(_DWORD *)&self->_flags & 0x2000) == 0)
      goto LABEL_23;
    goto LABEL_22;
  }
  v7 = reader;
  objc_sync_enter(v7);
  if ((*((_BYTE *)&self->_flags + 2) & 0x80) != 0)
  {
    objc_sync_exit(v7);

    goto LABEL_5;
  }
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  GEOGuidanceEventReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  v8 = (id)v5;
  objc_sync_exit(v7);

LABEL_24:
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  $FCA46E1F49AB8635A99719300DB73115 flags;
  int v6;
  GEOSignGuidance *signGuidance;
  GEOSpokenGuidance *spokenGuidance;
  GEOVisualLaneGuidance *laneGuidance;
  GEOARGuidance *arGuidance;
  GEONavTrayGuidance *navTrayGuidance;
  GEOJunctionView *junctionView;
  $FCA46E1F49AB8635A99719300DB73115 v13;
  int v14;
  char v15;
  GEOGuidanceImportanceMode *importanceInfo;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_91;
  -[GEOGuidanceEvent readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  flags = self->_flags;
  v6 = *((_DWORD *)v4 + 39);
  if ((*(_WORD *)&flags & 0x800) != 0)
  {
    if ((v6 & 0x800) == 0 || self->_startValidDistance != *((_DWORD *)v4 + 36))
      goto LABEL_91;
  }
  else if ((v6 & 0x800) != 0)
  {
    goto LABEL_91;
  }
  if ((*(_BYTE *)&flags & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_endValidDistance != *((_DWORD *)v4 + 30))
      goto LABEL_91;
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_91;
  }
  signGuidance = self->_signGuidance;
  if ((unint64_t)signGuidance | *((_QWORD *)v4 + 10) && !-[GEOSignGuidance isEqual:](signGuidance, "isEqual:"))
    goto LABEL_91;
  spokenGuidance = self->_spokenGuidance;
  if ((unint64_t)spokenGuidance | *((_QWORD *)v4 + 11))
  {
    if (!-[GEOSpokenGuidance isEqual:](spokenGuidance, "isEqual:"))
      goto LABEL_91;
  }
  laneGuidance = self->_laneGuidance;
  if ((unint64_t)laneGuidance | *((_QWORD *)v4 + 6))
  {
    if (!-[GEOVisualLaneGuidance isEqual:](laneGuidance, "isEqual:"))
      goto LABEL_91;
  }
  arGuidance = self->_arGuidance;
  if ((unint64_t)arGuidance | *((_QWORD *)v4 + 3))
  {
    if (!-[GEOARGuidance isEqual:](arGuidance, "isEqual:"))
      goto LABEL_91;
  }
  navTrayGuidance = self->_navTrayGuidance;
  if ((unint64_t)navTrayGuidance | *((_QWORD *)v4 + 9))
  {
    if (!-[GEONavTrayGuidance isEqual:](navTrayGuidance, "isEqual:"))
      goto LABEL_91;
  }
  junctionView = self->_junctionView;
  if ((unint64_t)junctionView | *((_QWORD *)v4 + 5))
  {
    if (!-[GEOJunctionView isEqual:](junctionView, "isEqual:"))
      goto LABEL_91;
  }
  v13 = self->_flags;
  v14 = *((_DWORD *)v4 + 39);
  if ((*(_BYTE *)&v13 & 8) != 0)
  {
    if ((v14 & 8) == 0 || self->_distanceZilchIndex != *((_DWORD *)v4 + 28))
      goto LABEL_91;
  }
  else if ((v14 & 8) != 0)
  {
    goto LABEL_91;
  }
  if ((*(_BYTE *)&v13 & 2) != 0)
  {
    if ((v14 & 2) == 0 || self->_minSpeed != *((double *)v4 + 8))
      goto LABEL_91;
  }
  else if ((v14 & 2) != 0)
  {
    goto LABEL_91;
  }
  if ((*(_BYTE *)&v13 & 1) != 0)
  {
    if ((v14 & 1) == 0 || self->_maxSpeed != *((double *)v4 + 7))
      goto LABEL_91;
  }
  else if ((v14 & 1) != 0)
  {
    goto LABEL_91;
  }
  if ((*(_BYTE *)&v13 & 0x80) != 0)
  {
    if ((v14 & 0x80) == 0 || self->_eventType != *((_DWORD *)v4 + 32))
      goto LABEL_91;
  }
  else if ((v14 & 0x80) != 0)
  {
    goto LABEL_91;
  }
  if ((*(_WORD *)&v13 & 0x100) != 0)
  {
    if ((v14 & 0x100) == 0 || self->_identifier != *((_DWORD *)v4 + 33))
      goto LABEL_91;
  }
  else if ((v14 & 0x100) != 0)
  {
    goto LABEL_91;
  }
  if ((*(_WORD *)&v13 & 0x200) != 0)
  {
    if ((v14 & 0x200) == 0 || self->_offsetForDistanceString != *((_DWORD *)v4 + 34))
      goto LABEL_91;
  }
  else if ((v14 & 0x200) != 0)
  {
    goto LABEL_91;
  }
  if ((*(_WORD *)&v13 & 0x4000) != 0)
  {
    if ((v14 & 0x4000) == 0)
      goto LABEL_91;
    if (self->_sticky)
    {
      if (!*((_BYTE *)v4 + 153))
        goto LABEL_91;
    }
    else if (*((_BYTE *)v4 + 153))
    {
      goto LABEL_91;
    }
  }
  else if ((v14 & 0x4000) != 0)
  {
    goto LABEL_91;
  }
  if ((*(_WORD *)&v13 & 0x1000) != 0)
  {
    if ((v14 & 0x1000) == 0 || self->_zilchPathIndex != *((_DWORD *)v4 + 37))
      goto LABEL_91;
  }
  else if ((v14 & 0x1000) != 0)
  {
    goto LABEL_91;
  }
  if ((*(_BYTE *)&v13 & 0x40) != 0)
  {
    if ((v14 & 0x40) == 0 || self->_enrouteNoticeIndex != *((_DWORD *)v4 + 31))
      goto LABEL_91;
  }
  else if ((v14 & 0x40) != 0)
  {
    goto LABEL_91;
  }
  if ((*(_WORD *)&v13 & 0x400) != 0)
  {
    if ((v14 & 0x400) == 0 || self->_startValidDistanceOffsetCm != *((_DWORD *)v4 + 35))
      goto LABEL_91;
  }
  else if ((v14 & 0x400) != 0)
  {
    goto LABEL_91;
  }
  if ((*(_BYTE *)&v13 & 0x10) != 0)
  {
    if ((v14 & 0x10) == 0 || self->_endValidDistanceOffsetCm != *((_DWORD *)v4 + 29))
      goto LABEL_91;
  }
  else if ((v14 & 0x10) != 0)
  {
    goto LABEL_91;
  }
  if ((*(_BYTE *)&v13 & 4) != 0)
  {
    if ((v14 & 4) == 0 || self->_distanceReferenceEndpointOffsetCm != *((_DWORD *)v4 + 27))
      goto LABEL_91;
  }
  else if ((v14 & 4) != 0)
  {
    goto LABEL_91;
  }
  if ((*(_WORD *)&v13 & 0x2000) == 0)
  {
    if ((v14 & 0x2000) == 0)
      goto LABEL_97;
LABEL_91:
    v15 = 0;
    goto LABEL_92;
  }
  if ((v14 & 0x2000) == 0)
    goto LABEL_91;
  if (!self->_preserveEventInUpdates)
  {
    if (!*((_BYTE *)v4 + 152))
      goto LABEL_97;
    goto LABEL_91;
  }
  if (!*((_BYTE *)v4 + 152))
    goto LABEL_91;
LABEL_97:
  importanceInfo = self->_importanceInfo;
  if ((unint64_t)importanceInfo | *((_QWORD *)v4 + 4))
    v15 = -[GEOGuidanceImportanceMode isEqual:](importanceInfo, "isEqual:");
  else
    v15 = 1;
LABEL_92:

  return v15;
}

- (unint64_t)hash
{
  $FCA46E1F49AB8635A99719300DB73115 flags;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  $FCA46E1F49AB8635A99719300DB73115 v9;
  uint64_t v10;
  double minSpeed;
  double v12;
  long double v13;
  double v14;
  unint64_t v15;
  unint64_t v16;
  double maxSpeed;
  double v18;
  long double v19;
  double v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;

  -[GEOGuidanceEvent readAll:](self, "readAll:", 1);
  flags = self->_flags;
  if ((*(_WORD *)&flags & 0x800) != 0)
  {
    v34 = 2654435761 * self->_startValidDistance;
    if ((*(_BYTE *)&flags & 0x20) != 0)
      goto LABEL_3;
  }
  else
  {
    v34 = 0;
    if ((*(_BYTE *)&flags & 0x20) != 0)
    {
LABEL_3:
      v33 = 2654435761 * self->_endValidDistance;
      goto LABEL_6;
    }
  }
  v33 = 0;
LABEL_6:
  v32 = -[GEOSignGuidance hash](self->_signGuidance, "hash");
  v4 = -[GEOSpokenGuidance hash](self->_spokenGuidance, "hash");
  v5 = -[GEOVisualLaneGuidance hash](self->_laneGuidance, "hash");
  v6 = -[GEOARGuidance hash](self->_arGuidance, "hash");
  v7 = -[GEONavTrayGuidance hash](self->_navTrayGuidance, "hash");
  v8 = -[GEOJunctionView hash](self->_junctionView, "hash");
  v9 = self->_flags;
  if ((*(_BYTE *)&v9 & 8) != 0)
  {
    v10 = 2654435761 * self->_distanceZilchIndex;
    if ((*(_BYTE *)&v9 & 2) != 0)
      goto LABEL_8;
LABEL_13:
    v15 = 0;
    goto LABEL_16;
  }
  v10 = 0;
  if ((*(_BYTE *)&v9 & 2) == 0)
    goto LABEL_13;
LABEL_8:
  minSpeed = self->_minSpeed;
  v12 = -minSpeed;
  if (minSpeed >= 0.0)
    v12 = self->_minSpeed;
  v13 = floor(v12 + 0.5);
  v14 = (v12 - v13) * 1.84467441e19;
  v15 = 2654435761u * (unint64_t)fmod(v13, 1.84467441e19);
  if (v14 >= 0.0)
  {
    if (v14 > 0.0)
      v15 += (unint64_t)v14;
  }
  else
  {
    v15 -= (unint64_t)fabs(v14);
  }
LABEL_16:
  if ((*(_BYTE *)&v9 & 1) != 0)
  {
    maxSpeed = self->_maxSpeed;
    v18 = -maxSpeed;
    if (maxSpeed >= 0.0)
      v18 = self->_maxSpeed;
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
  if ((*(_BYTE *)&v9 & 0x80) != 0)
  {
    v21 = 2654435761 * self->_eventType;
    if ((*(_WORD *)&v9 & 0x100) != 0)
    {
LABEL_26:
      v22 = 2654435761 * self->_identifier;
      if ((*(_WORD *)&v9 & 0x200) != 0)
        goto LABEL_27;
      goto LABEL_37;
    }
  }
  else
  {
    v21 = 0;
    if ((*(_WORD *)&v9 & 0x100) != 0)
      goto LABEL_26;
  }
  v22 = 0;
  if ((*(_WORD *)&v9 & 0x200) != 0)
  {
LABEL_27:
    v23 = 2654435761 * self->_offsetForDistanceString;
    if ((*(_WORD *)&v9 & 0x4000) != 0)
      goto LABEL_28;
    goto LABEL_38;
  }
LABEL_37:
  v23 = 0;
  if ((*(_WORD *)&v9 & 0x4000) != 0)
  {
LABEL_28:
    v24 = 2654435761 * self->_sticky;
    if ((*(_WORD *)&v9 & 0x1000) != 0)
      goto LABEL_29;
    goto LABEL_39;
  }
LABEL_38:
  v24 = 0;
  if ((*(_WORD *)&v9 & 0x1000) != 0)
  {
LABEL_29:
    v25 = 2654435761 * self->_zilchPathIndex;
    if ((*(_BYTE *)&v9 & 0x40) != 0)
      goto LABEL_30;
    goto LABEL_40;
  }
LABEL_39:
  v25 = 0;
  if ((*(_BYTE *)&v9 & 0x40) != 0)
  {
LABEL_30:
    v26 = 2654435761 * self->_enrouteNoticeIndex;
    if ((*(_WORD *)&v9 & 0x400) != 0)
      goto LABEL_31;
    goto LABEL_41;
  }
LABEL_40:
  v26 = 0;
  if ((*(_WORD *)&v9 & 0x400) != 0)
  {
LABEL_31:
    v27 = 2654435761 * self->_startValidDistanceOffsetCm;
    if ((*(_BYTE *)&v9 & 0x10) != 0)
      goto LABEL_32;
    goto LABEL_42;
  }
LABEL_41:
  v27 = 0;
  if ((*(_BYTE *)&v9 & 0x10) != 0)
  {
LABEL_32:
    v28 = 2654435761 * self->_endValidDistanceOffsetCm;
    if ((*(_BYTE *)&v9 & 4) != 0)
      goto LABEL_33;
LABEL_43:
    v29 = 0;
    if ((*(_WORD *)&v9 & 0x2000) != 0)
      goto LABEL_34;
LABEL_44:
    v30 = 0;
    return v33 ^ v34 ^ v32 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v10 ^ v15 ^ v16 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ v27 ^ v28 ^ v29 ^ v30 ^ -[GEOGuidanceImportanceMode hash](self->_importanceInfo, "hash");
  }
LABEL_42:
  v28 = 0;
  if ((*(_BYTE *)&v9 & 4) == 0)
    goto LABEL_43;
LABEL_33:
  v29 = 2654435761 * self->_distanceReferenceEndpointOffsetCm;
  if ((*(_WORD *)&v9 & 0x2000) == 0)
    goto LABEL_44;
LABEL_34:
  v30 = 2654435761 * self->_preserveEventInUpdates;
  return v33 ^ v34 ^ v32 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v10 ^ v15 ^ v16 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ v27 ^ v28 ^ v29 ^ v30 ^ -[GEOGuidanceImportanceMode hash](self->_importanceInfo, "hash");
}

- (void)mergeFrom:(id)a3
{
  int *v4;
  int v5;
  GEOSignGuidance *signGuidance;
  uint64_t v7;
  GEOSpokenGuidance *spokenGuidance;
  uint64_t v9;
  GEOVisualLaneGuidance *laneGuidance;
  uint64_t v11;
  GEOARGuidance *arGuidance;
  uint64_t v13;
  GEONavTrayGuidance *navTrayGuidance;
  uint64_t v15;
  GEOJunctionView *junctionView;
  uint64_t v17;
  int v18;
  GEOGuidanceImportanceMode *importanceInfo;
  uint64_t v20;
  int *v21;

  v21 = (int *)a3;
  objc_msgSend(v21, "readAll:", 0);
  v4 = v21;
  v5 = v21[39];
  if ((v5 & 0x800) != 0)
  {
    self->_startValidDistance = v21[36];
    *(_DWORD *)&self->_flags |= 0x800u;
    v5 = v21[39];
  }
  if ((v5 & 0x20) != 0)
  {
    self->_endValidDistance = v21[30];
    *(_DWORD *)&self->_flags |= 0x20u;
  }
  signGuidance = self->_signGuidance;
  v7 = *((_QWORD *)v21 + 10);
  if (signGuidance)
  {
    if (!v7)
      goto LABEL_11;
    -[GEOSignGuidance mergeFrom:](signGuidance, "mergeFrom:");
  }
  else
  {
    if (!v7)
      goto LABEL_11;
    -[GEOGuidanceEvent setSignGuidance:](self, "setSignGuidance:");
  }
  v4 = v21;
LABEL_11:
  spokenGuidance = self->_spokenGuidance;
  v9 = *((_QWORD *)v4 + 11);
  if (spokenGuidance)
  {
    if (!v9)
      goto LABEL_17;
    -[GEOSpokenGuidance mergeFrom:](spokenGuidance, "mergeFrom:");
  }
  else
  {
    if (!v9)
      goto LABEL_17;
    -[GEOGuidanceEvent setSpokenGuidance:](self, "setSpokenGuidance:");
  }
  v4 = v21;
LABEL_17:
  laneGuidance = self->_laneGuidance;
  v11 = *((_QWORD *)v4 + 6);
  if (laneGuidance)
  {
    if (!v11)
      goto LABEL_23;
    -[GEOVisualLaneGuidance mergeFrom:](laneGuidance, "mergeFrom:");
  }
  else
  {
    if (!v11)
      goto LABEL_23;
    -[GEOGuidanceEvent setLaneGuidance:](self, "setLaneGuidance:");
  }
  v4 = v21;
LABEL_23:
  arGuidance = self->_arGuidance;
  v13 = *((_QWORD *)v4 + 3);
  if (arGuidance)
  {
    if (!v13)
      goto LABEL_29;
    -[GEOARGuidance mergeFrom:](arGuidance, "mergeFrom:");
  }
  else
  {
    if (!v13)
      goto LABEL_29;
    -[GEOGuidanceEvent setArGuidance:](self, "setArGuidance:");
  }
  v4 = v21;
LABEL_29:
  navTrayGuidance = self->_navTrayGuidance;
  v15 = *((_QWORD *)v4 + 9);
  if (navTrayGuidance)
  {
    if (!v15)
      goto LABEL_35;
    -[GEONavTrayGuidance mergeFrom:](navTrayGuidance, "mergeFrom:");
  }
  else
  {
    if (!v15)
      goto LABEL_35;
    -[GEOGuidanceEvent setNavTrayGuidance:](self, "setNavTrayGuidance:");
  }
  v4 = v21;
LABEL_35:
  junctionView = self->_junctionView;
  v17 = *((_QWORD *)v4 + 5);
  if (junctionView)
  {
    if (!v17)
      goto LABEL_41;
    -[GEOJunctionView mergeFrom:](junctionView, "mergeFrom:");
  }
  else
  {
    if (!v17)
      goto LABEL_41;
    -[GEOGuidanceEvent setJunctionView:](self, "setJunctionView:");
  }
  v4 = v21;
LABEL_41:
  v18 = v4[39];
  if ((v18 & 8) != 0)
  {
    self->_distanceZilchIndex = v4[28];
    *(_DWORD *)&self->_flags |= 8u;
    v18 = v4[39];
    if ((v18 & 2) == 0)
    {
LABEL_43:
      if ((v18 & 1) == 0)
        goto LABEL_44;
      goto LABEL_60;
    }
  }
  else if ((v18 & 2) == 0)
  {
    goto LABEL_43;
  }
  self->_minSpeed = *((double *)v4 + 8);
  *(_DWORD *)&self->_flags |= 2u;
  v18 = v4[39];
  if ((v18 & 1) == 0)
  {
LABEL_44:
    if ((v18 & 0x80) == 0)
      goto LABEL_45;
    goto LABEL_61;
  }
LABEL_60:
  self->_maxSpeed = *((double *)v4 + 7);
  *(_DWORD *)&self->_flags |= 1u;
  v18 = v4[39];
  if ((v18 & 0x80) == 0)
  {
LABEL_45:
    if ((v18 & 0x100) == 0)
      goto LABEL_46;
    goto LABEL_62;
  }
LABEL_61:
  self->_eventType = v4[32];
  *(_DWORD *)&self->_flags |= 0x80u;
  v18 = v4[39];
  if ((v18 & 0x100) == 0)
  {
LABEL_46:
    if ((v18 & 0x200) == 0)
      goto LABEL_47;
    goto LABEL_63;
  }
LABEL_62:
  self->_identifier = v4[33];
  *(_DWORD *)&self->_flags |= 0x100u;
  v18 = v4[39];
  if ((v18 & 0x200) == 0)
  {
LABEL_47:
    if ((v18 & 0x4000) == 0)
      goto LABEL_48;
    goto LABEL_64;
  }
LABEL_63:
  self->_offsetForDistanceString = v4[34];
  *(_DWORD *)&self->_flags |= 0x200u;
  v18 = v4[39];
  if ((v18 & 0x4000) == 0)
  {
LABEL_48:
    if ((v18 & 0x1000) == 0)
      goto LABEL_49;
    goto LABEL_65;
  }
LABEL_64:
  self->_sticky = *((_BYTE *)v4 + 153);
  *(_DWORD *)&self->_flags |= 0x4000u;
  v18 = v4[39];
  if ((v18 & 0x1000) == 0)
  {
LABEL_49:
    if ((v18 & 0x40) == 0)
      goto LABEL_50;
    goto LABEL_66;
  }
LABEL_65:
  self->_zilchPathIndex = v4[37];
  *(_DWORD *)&self->_flags |= 0x1000u;
  v18 = v4[39];
  if ((v18 & 0x40) == 0)
  {
LABEL_50:
    if ((v18 & 0x400) == 0)
      goto LABEL_51;
    goto LABEL_67;
  }
LABEL_66:
  self->_enrouteNoticeIndex = v4[31];
  *(_DWORD *)&self->_flags |= 0x40u;
  v18 = v4[39];
  if ((v18 & 0x400) == 0)
  {
LABEL_51:
    if ((v18 & 0x10) == 0)
      goto LABEL_52;
    goto LABEL_68;
  }
LABEL_67:
  self->_startValidDistanceOffsetCm = v4[35];
  *(_DWORD *)&self->_flags |= 0x400u;
  v18 = v4[39];
  if ((v18 & 0x10) == 0)
  {
LABEL_52:
    if ((v18 & 4) == 0)
      goto LABEL_53;
    goto LABEL_69;
  }
LABEL_68:
  self->_endValidDistanceOffsetCm = v4[29];
  *(_DWORD *)&self->_flags |= 0x10u;
  v18 = v4[39];
  if ((v18 & 4) == 0)
  {
LABEL_53:
    if ((v18 & 0x2000) == 0)
      goto LABEL_55;
    goto LABEL_54;
  }
LABEL_69:
  self->_distanceReferenceEndpointOffsetCm = v4[27];
  *(_DWORD *)&self->_flags |= 4u;
  if ((v4[39] & 0x2000) != 0)
  {
LABEL_54:
    self->_preserveEventInUpdates = *((_BYTE *)v4 + 152);
    *(_DWORD *)&self->_flags |= 0x2000u;
  }
LABEL_55:
  importanceInfo = self->_importanceInfo;
  v20 = *((_QWORD *)v4 + 4);
  if (importanceInfo)
  {
    if (v20)
    {
      -[GEOGuidanceImportanceMode mergeFrom:](importanceInfo, "mergeFrom:");
LABEL_73:
      v4 = v21;
    }
  }
  else if (v20)
  {
    -[GEOGuidanceEvent setImportanceInfo:](self, "setImportanceInfo:");
    goto LABEL_73;
  }

}

- (PBUnknownFields)unknownFields
{
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v5;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*((_BYTE *)&self->_flags + 1) & 0x80) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      v5 = reader;
      objc_sync_enter(v5);
      GEOGuidanceEventReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_2416);
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
  *(_DWORD *)&self->_flags |= 0x808000u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEOGuidanceEvent readAll:](self, "readAll:", 0);
    -[GEOSignGuidance clearUnknownFields:](self->_signGuidance, "clearUnknownFields:", 1);
    -[GEOSpokenGuidance clearUnknownFields:](self->_spokenGuidance, "clearUnknownFields:", 1);
    -[GEOVisualLaneGuidance clearUnknownFields:](self->_laneGuidance, "clearUnknownFields:", 1);
    -[GEOARGuidance clearUnknownFields:](self->_arGuidance, "clearUnknownFields:", 1);
    -[GEONavTrayGuidance clearUnknownFields:](self->_navTrayGuidance, "clearUnknownFields:", 1);
    -[GEOJunctionView clearUnknownFields:](self->_junctionView, "clearUnknownFields:", 1);
    -[GEOGuidanceImportanceMode clearUnknownFields:](self->_importanceInfo, "clearUnknownFields:", 1);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spokenGuidance, 0);
  objc_storeStrong((id *)&self->_signGuidance, 0);
  objc_storeStrong((id *)&self->_navTrayGuidance, 0);
  objc_storeStrong((id *)&self->_laneGuidance, 0);
  objc_storeStrong((id *)&self->_junctionView, 0);
  objc_storeStrong((id *)&self->_importanceInfo, 0);
  objc_storeStrong((id *)&self->_arGuidance, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
