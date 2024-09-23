@implementation GEOGuidanceEventFeedback

- (GEOGuidanceEventFeedback)init
{
  GEOGuidanceEventFeedback *v2;
  GEOGuidanceEventFeedback *v3;
  GEOGuidanceEventFeedback *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOGuidanceEventFeedback;
  v2 = -[GEOGuidanceEventFeedback init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOGuidanceEventFeedback)initWithData:(id)a3
{
  GEOGuidanceEventFeedback *v3;
  GEOGuidanceEventFeedback *v4;
  GEOGuidanceEventFeedback *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOGuidanceEventFeedback;
  v3 = -[GEOGuidanceEventFeedback initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readRouteID
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_WORD *)(a1 + 100) & 0x200) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOGuidanceEventFeedbackReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRouteID_tags_2);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasRouteID
{
  -[GEOGuidanceEventFeedback _readRouteID]((uint64_t)self);
  return self->_routeID != 0;
}

- (NSData)routeID
{
  -[GEOGuidanceEventFeedback _readRouteID]((uint64_t)self);
  return self->_routeID;
}

- (void)setRouteID:(id)a3
{
  *(_WORD *)&self->_flags |= 0x2200u;
  objc_storeStrong((id *)&self->_routeID, a3);
}

- (unsigned)stepID
{
  return self->_stepID;
}

- (void)setStepID:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x2010u;
  self->_stepID = a3;
}

- (void)setHasStepID:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8208;
  else
    v3 = 0x2000;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFEF | v3;
}

- (BOOL)hasStepID
{
  return (*(_WORD *)&self->_flags >> 4) & 1;
}

- (unsigned)enrouteNoticeIndex
{
  return self->_enrouteNoticeIndex;
}

- (void)setEnrouteNoticeIndex:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x2004u;
  self->_enrouteNoticeIndex = a3;
}

- (void)setHasEnrouteNoticeIndex:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8196;
  else
    v3 = 0x2000;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFB | v3;
}

- (BOOL)hasEnrouteNoticeIndex
{
  return (*(_WORD *)&self->_flags >> 2) & 1;
}

- (unsigned)eventIndex
{
  return self->_eventIndex;
}

- (void)setEventIndex:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x2008u;
  self->_eventIndex = a3;
}

- (void)setHasEventIndex:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8200;
  else
    v3 = 0x2000;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFF7 | v3;
}

- (BOOL)hasEventIndex
{
  return (*(_WORD *)&self->_flags >> 3) & 1;
}

- (float)distanceToManeuver
{
  return self->_distanceToManeuver;
}

- (void)setDistanceToManeuver:(float)a3
{
  *(_WORD *)&self->_flags |= 0x2001u;
  self->_distanceToManeuver = a3;
}

- (void)setHasDistanceToManeuver:(BOOL)a3
{
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFE | a3 | 0x2000;
}

- (BOOL)hasDistanceToManeuver
{
  return *(_WORD *)&self->_flags & 1;
}

- (float)timeToManeuver
{
  return self->_timeToManeuver;
}

- (void)setTimeToManeuver:(float)a3
{
  *(_WORD *)&self->_flags |= 0x2020u;
  self->_timeToManeuver = a3;
}

- (void)setHasTimeToManeuver:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8224;
  else
    v3 = 0x2000;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFDF | v3;
}

- (BOOL)hasTimeToManeuver
{
  return (*(_WORD *)&self->_flags >> 5) & 1;
}

- (float)vehicleSpeed
{
  return self->_vehicleSpeed;
}

- (void)setVehicleSpeed:(float)a3
{
  *(_WORD *)&self->_flags |= 0x2080u;
  self->_vehicleSpeed = a3;
}

- (void)setHasVehicleSpeed:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8320;
  else
    v3 = 0x2000;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFF7F | v3;
}

- (BOOL)hasVehicleSpeed
{
  return (*(_WORD *)&self->_flags >> 7) & 1;
}

- (int)trafficSpeed
{
  os_unfair_lock_s *p_readerLock;
  __int16 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 0x40) != 0)
    return self->_trafficSpeed;
  else
    return 4;
}

- (void)setTrafficSpeed:(int)a3
{
  *(_WORD *)&self->_flags |= 0x2040u;
  self->_trafficSpeed = a3;
}

- (void)setHasTrafficSpeed:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8256;
  else
    v3 = 0x2000;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFBF | v3;
}

- (BOOL)hasTrafficSpeed
{
  return (*(_WORD *)&self->_flags >> 6) & 1;
}

- (id)trafficSpeedAsString:(int)a3
{
  if (a3 < 5)
    return off_1E1C0CB00[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsTrafficSpeed:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CLOSED")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SLOW")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MEDIUM")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FAST")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("SPEED_NONE")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (float)duration
{
  return self->_duration;
}

- (void)setDuration:(float)a3
{
  *(_WORD *)&self->_flags |= 0x2002u;
  self->_duration = a3;
}

- (void)setHasDuration:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8194;
  else
    v3 = 0x2000;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasDuration
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
}

- (void)_readSignGuidanceFeedback
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_WORD *)(a1 + 100) & 0x400) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOGuidanceEventFeedbackReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSignGuidanceFeedback_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasSignGuidanceFeedback
{
  -[GEOGuidanceEventFeedback _readSignGuidanceFeedback]((uint64_t)self);
  return self->_signGuidanceFeedback != 0;
}

- (GEOSignGuidanceFeedback)signGuidanceFeedback
{
  -[GEOGuidanceEventFeedback _readSignGuidanceFeedback]((uint64_t)self);
  return self->_signGuidanceFeedback;
}

- (void)setSignGuidanceFeedback:(id)a3
{
  *(_WORD *)&self->_flags |= 0x2400u;
  objc_storeStrong((id *)&self->_signGuidanceFeedback, a3);
}

- (void)_readSpokenGuidanceFeedback
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_WORD *)(a1 + 100) & 0x800) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOGuidanceEventFeedbackReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSpokenGuidanceFeedback_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasSpokenGuidanceFeedback
{
  -[GEOGuidanceEventFeedback _readSpokenGuidanceFeedback]((uint64_t)self);
  return self->_spokenGuidanceFeedback != 0;
}

- (GEOSpokenGuidanceFeedback)spokenGuidanceFeedback
{
  -[GEOGuidanceEventFeedback _readSpokenGuidanceFeedback]((uint64_t)self);
  return self->_spokenGuidanceFeedback;
}

- (void)setSpokenGuidanceFeedback:(id)a3
{
  *(_WORD *)&self->_flags |= 0x2800u;
  objc_storeStrong((id *)&self->_spokenGuidanceFeedback, a3);
}

- (void)_readJunctionViewGuidanceFeedback
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_WORD *)(a1 + 100) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOGuidanceEventFeedbackReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readJunctionViewGuidanceFeedback_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasJunctionViewGuidanceFeedback
{
  -[GEOGuidanceEventFeedback _readJunctionViewGuidanceFeedback]((uint64_t)self);
  return self->_junctionViewGuidanceFeedback != 0;
}

- (GEOJunctionViewGuidanceFeedback)junctionViewGuidanceFeedback
{
  -[GEOGuidanceEventFeedback _readJunctionViewGuidanceFeedback]((uint64_t)self);
  return self->_junctionViewGuidanceFeedback;
}

- (void)setJunctionViewGuidanceFeedback:(id)a3
{
  *(_WORD *)&self->_flags |= 0x2100u;
  objc_storeStrong((id *)&self->_junctionViewGuidanceFeedback, a3);
}

- (void)_readTrafficCameraGuidanceFeedback
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_WORD *)(a1 + 100) & 0x1000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOGuidanceEventFeedbackReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTrafficCameraGuidanceFeedback_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasTrafficCameraGuidanceFeedback
{
  -[GEOGuidanceEventFeedback _readTrafficCameraGuidanceFeedback]((uint64_t)self);
  return self->_trafficCameraGuidanceFeedback != 0;
}

- (GEOTrafficCameraInformation)trafficCameraGuidanceFeedback
{
  -[GEOGuidanceEventFeedback _readTrafficCameraGuidanceFeedback]((uint64_t)self);
  return self->_trafficCameraGuidanceFeedback;
}

- (void)setTrafficCameraGuidanceFeedback:(id)a3
{
  *(_WORD *)&self->_flags |= 0x3000u;
  objc_storeStrong((id *)&self->_trafficCameraGuidanceFeedback, a3);
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
  v8.super_class = (Class)GEOGuidanceEventFeedback;
  -[GEOGuidanceEventFeedback description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOGuidanceEventFeedback dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOGuidanceEventFeedback _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  __int16 v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  const __CFString *v25;
  uint64_t v26;
  __CFString *v27;
  void *v28;
  void *v29;
  void *v30;
  const __CFString *v31;
  void *v32;
  void *v33;
  void *v34;
  const __CFString *v35;
  void *v36;
  void *v37;
  void *v38;
  const __CFString *v39;
  const __CFString *v41;

  if (!a1)
  {
    v4 = 0;
    return v4;
  }
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)a1, "routeID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v5, "base64EncodedStringWithOptions:", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("routeID"));

    }
    else
    {
      objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("routeID"));
    }
  }

  v9 = *(_WORD *)(a1 + 100);
  if ((v9 & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 84));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("stepID"));

    v9 = *(_WORD *)(a1 + 100);
    if ((v9 & 4) == 0)
    {
LABEL_8:
      if ((v9 & 8) == 0)
        goto LABEL_9;
      goto LABEL_23;
    }
  }
  else if ((v9 & 4) == 0)
  {
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 76));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v17 = CFSTR("enrouteNoticeIndex");
  else
    v17 = CFSTR("enroute_notice_index");
  objc_msgSend(v4, "setObject:forKey:", v16, v17);

  v9 = *(_WORD *)(a1 + 100);
  if ((v9 & 8) == 0)
  {
LABEL_9:
    if ((v9 & 1) == 0)
      goto LABEL_10;
    goto LABEL_27;
  }
LABEL_23:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 80));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v19 = CFSTR("eventIndex");
  else
    v19 = CFSTR("event_index");
  objc_msgSend(v4, "setObject:forKey:", v18, v19);

  v9 = *(_WORD *)(a1 + 100);
  if ((v9 & 1) == 0)
  {
LABEL_10:
    if ((v9 & 0x20) == 0)
      goto LABEL_11;
    goto LABEL_31;
  }
LABEL_27:
  LODWORD(v8) = *(_DWORD *)(a1 + 68);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v8);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v21 = CFSTR("distanceToManeuver");
  else
    v21 = CFSTR("distance_to_maneuver");
  objc_msgSend(v4, "setObject:forKey:", v20, v21);

  v9 = *(_WORD *)(a1 + 100);
  if ((v9 & 0x20) == 0)
  {
LABEL_11:
    if ((v9 & 0x80) == 0)
      goto LABEL_12;
    goto LABEL_35;
  }
LABEL_31:
  LODWORD(v8) = *(_DWORD *)(a1 + 88);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v8);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v23 = CFSTR("timeToManeuver");
  else
    v23 = CFSTR("time_to_maneuver");
  objc_msgSend(v4, "setObject:forKey:", v22, v23);

  v9 = *(_WORD *)(a1 + 100);
  if ((v9 & 0x80) == 0)
  {
LABEL_12:
    if ((v9 & 0x40) == 0)
      goto LABEL_13;
LABEL_39:
    v26 = *(int *)(a1 + 92);
    if (v26 >= 5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 92));
      v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v27 = off_1E1C0CB00[v26];
    }
    if (a2)
      v41 = CFSTR("trafficSpeed");
    else
      v41 = CFSTR("traffic_speed");
    objc_msgSend(v4, "setObject:forKey:", v27, v41);

    if ((*(_WORD *)(a1 + 100) & 2) == 0)
      goto LABEL_15;
    goto LABEL_14;
  }
LABEL_35:
  LODWORD(v8) = *(_DWORD *)(a1 + 96);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v8);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v25 = CFSTR("vehicleSpeed");
  else
    v25 = CFSTR("vehicle_speed");
  objc_msgSend(v4, "setObject:forKey:", v24, v25);

  v9 = *(_WORD *)(a1 + 100);
  if ((v9 & 0x40) != 0)
    goto LABEL_39;
LABEL_13:
  if ((v9 & 2) != 0)
  {
LABEL_14:
    LODWORD(v8) = *(_DWORD *)(a1 + 72);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("duration"));

  }
LABEL_15:
  objc_msgSend((id)a1, "signGuidanceFeedback");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v11, "jsonRepresentation");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = CFSTR("signGuidanceFeedback");
    }
    else
    {
      objc_msgSend(v11, "dictionaryRepresentation");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = CFSTR("sign_guidance_feedback");
    }
    objc_msgSend(v4, "setObject:forKey:", v13, v14);

  }
  objc_msgSend((id)a1, "spokenGuidanceFeedback");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v28;
  if (v28)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v28, "jsonRepresentation");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = CFSTR("spokenGuidanceFeedback");
    }
    else
    {
      objc_msgSend(v28, "dictionaryRepresentation");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = CFSTR("spoken_guidance_feedback");
    }
    objc_msgSend(v4, "setObject:forKey:", v30, v31);

  }
  objc_msgSend((id)a1, "junctionViewGuidanceFeedback");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v32;
  if (v32)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v32, "jsonRepresentation");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = CFSTR("junctionViewGuidanceFeedback");
    }
    else
    {
      objc_msgSend(v32, "dictionaryRepresentation");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = CFSTR("junction_view_guidance_feedback");
    }
    objc_msgSend(v4, "setObject:forKey:", v34, v35);

  }
  objc_msgSend((id)a1, "trafficCameraGuidanceFeedback");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v36;
  if (v36)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v36, "jsonRepresentation");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = CFSTR("trafficCameraGuidanceFeedback");
    }
    else
    {
      objc_msgSend(v36, "dictionaryRepresentation");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = CFSTR("traffic_camera_guidance_feedback");
    }
    objc_msgSend(v4, "setObject:forKey:", v38, v39);

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOGuidanceEventFeedback _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOGuidanceEventFeedback)initWithDictionary:(id)a3
{
  return (GEOGuidanceEventFeedback *)-[GEOGuidanceEventFeedback _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  GEOSignGuidanceFeedback *v26;
  uint64_t v27;
  void *v28;
  const __CFString *v29;
  void *v30;
  GEOSpokenGuidanceFeedback *v31;
  uint64_t v32;
  void *v33;
  const __CFString *v34;
  void *v35;
  GEOJunctionViewGuidanceFeedback *v36;
  uint64_t v37;
  void *v38;
  const __CFString *v39;
  void *v40;
  GEOTrafficCameraInformation *v41;
  uint64_t v42;
  void *v43;

  v5 = a2;
  if (!a1)
    goto LABEL_86;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_86;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("routeID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v6, 0);
    objc_msgSend(a1, "setRouteID:", v7);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("stepID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setStepID:", objc_msgSend(v8, "unsignedIntValue"));

  if (a3)
    v9 = CFSTR("enrouteNoticeIndex");
  else
    v9 = CFSTR("enroute_notice_index");
  objc_msgSend(v5, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setEnrouteNoticeIndex:", objc_msgSend(v10, "unsignedIntValue"));

  if (a3)
    v11 = CFSTR("eventIndex");
  else
    v11 = CFSTR("event_index");
  objc_msgSend(v5, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setEventIndex:", objc_msgSend(v12, "unsignedIntValue"));

  if (a3)
    v13 = CFSTR("distanceToManeuver");
  else
    v13 = CFSTR("distance_to_maneuver");
  objc_msgSend(v5, "objectForKeyedSubscript:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v14, "floatValue");
    objc_msgSend(a1, "setDistanceToManeuver:");
  }

  if (a3)
    v15 = CFSTR("timeToManeuver");
  else
    v15 = CFSTR("time_to_maneuver");
  objc_msgSend(v5, "objectForKeyedSubscript:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v16, "floatValue");
    objc_msgSend(a1, "setTimeToManeuver:");
  }

  if (a3)
    v17 = CFSTR("vehicleSpeed");
  else
    v17 = CFSTR("vehicle_speed");
  objc_msgSend(v5, "objectForKeyedSubscript:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v18, "floatValue");
    objc_msgSend(a1, "setVehicleSpeed:");
  }

  if (a3)
    v19 = CFSTR("trafficSpeed");
  else
    v19 = CFSTR("traffic_speed");
  objc_msgSend(v5, "objectForKeyedSubscript:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v21 = v20;
    if ((objc_msgSend(v21, "isEqualToString:", CFSTR("CLOSED")) & 1) != 0)
    {
      v22 = 0;
    }
    else if ((objc_msgSend(v21, "isEqualToString:", CFSTR("SLOW")) & 1) != 0)
    {
      v22 = 1;
    }
    else if ((objc_msgSend(v21, "isEqualToString:", CFSTR("MEDIUM")) & 1) != 0)
    {
      v22 = 2;
    }
    else if ((objc_msgSend(v21, "isEqualToString:", CFSTR("FAST")) & 1) != 0)
    {
      v22 = 3;
    }
    else if (objc_msgSend(v21, "isEqualToString:", CFSTR("SPEED_NONE")))
    {
      v22 = 4;
    }
    else
    {
      v22 = 0;
    }

    goto LABEL_50;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v22 = objc_msgSend(v20, "intValue");
LABEL_50:
    objc_msgSend(a1, "setTrafficSpeed:", v22);
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("duration"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v23, "floatValue");
    objc_msgSend(a1, "setDuration:");
  }

  if (a3)
    v24 = CFSTR("signGuidanceFeedback");
  else
    v24 = CFSTR("sign_guidance_feedback");
  objc_msgSend(v5, "objectForKeyedSubscript:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v26 = [GEOSignGuidanceFeedback alloc];
    if ((a3 & 1) != 0)
      v27 = -[GEOSignGuidanceFeedback initWithJSON:](v26, "initWithJSON:", v25);
    else
      v27 = -[GEOSignGuidanceFeedback initWithDictionary:](v26, "initWithDictionary:", v25);
    v28 = (void *)v27;
    objc_msgSend(a1, "setSignGuidanceFeedback:", v27);

  }
  if (a3)
    v29 = CFSTR("spokenGuidanceFeedback");
  else
    v29 = CFSTR("spoken_guidance_feedback");
  objc_msgSend(v5, "objectForKeyedSubscript:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v31 = [GEOSpokenGuidanceFeedback alloc];
    if ((a3 & 1) != 0)
      v32 = -[GEOSpokenGuidanceFeedback initWithJSON:](v31, "initWithJSON:", v30);
    else
      v32 = -[GEOSpokenGuidanceFeedback initWithDictionary:](v31, "initWithDictionary:", v30);
    v33 = (void *)v32;
    objc_msgSend(a1, "setSpokenGuidanceFeedback:", v32);

  }
  if (a3)
    v34 = CFSTR("junctionViewGuidanceFeedback");
  else
    v34 = CFSTR("junction_view_guidance_feedback");
  objc_msgSend(v5, "objectForKeyedSubscript:", v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v36 = [GEOJunctionViewGuidanceFeedback alloc];
    if ((a3 & 1) != 0)
      v37 = -[GEOJunctionViewGuidanceFeedback initWithJSON:](v36, "initWithJSON:", v35);
    else
      v37 = -[GEOJunctionViewGuidanceFeedback initWithDictionary:](v36, "initWithDictionary:", v35);
    v38 = (void *)v37;
    objc_msgSend(a1, "setJunctionViewGuidanceFeedback:", v37);

  }
  if (a3)
    v39 = CFSTR("trafficCameraGuidanceFeedback");
  else
    v39 = CFSTR("traffic_camera_guidance_feedback");
  objc_msgSend(v5, "objectForKeyedSubscript:", v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v41 = [GEOTrafficCameraInformation alloc];
    if ((a3 & 1) != 0)
      v42 = -[GEOTrafficCameraInformation initWithJSON:](v41, "initWithJSON:", v40);
    else
      v42 = -[GEOTrafficCameraInformation initWithDictionary:](v41, "initWithDictionary:", v40);
    v43 = (void *)v42;
    objc_msgSend(a1, "setTrafficCameraGuidanceFeedback:", v42);

  }
LABEL_86:

  return a1;
}

- (GEOGuidanceEventFeedback)initWithJSON:(id)a3
{
  return (GEOGuidanceEventFeedback *)-[GEOGuidanceEventFeedback _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_401;
    else
      v8 = (int *)&readAll__nonRecursiveTag_402;
    GEOGuidanceEventFeedbackReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEOGuidanceEventFeedbackCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOGuidanceEventFeedbackIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOGuidanceEventFeedbackReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  __int16 flags;
  PBDataReader *v6;
  void *v7;
  id v8;

  v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader)
  {
    os_unfair_lock_assert_owner(&self->_readerLock);
    if ((*(_WORD *)&self->_flags & 0x3F00) == 0)
    {
      v6 = self->_reader;
      objc_sync_enter(v6);
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "writeData:", v7);
      os_unfair_lock_unlock(p_readerLock);

      objc_sync_exit(v6);
      goto LABEL_31;
    }
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOGuidanceEventFeedback readAll:](self, "readAll:", 0);
  if (self->_routeID)
    PBDataWriterWriteDataField();
  flags = (__int16)self->_flags;
  if ((flags & 0x10) != 0)
  {
    PBDataWriterWriteUint32Field();
    flags = (__int16)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_7:
      if ((flags & 8) == 0)
        goto LABEL_8;
      goto LABEL_24;
    }
  }
  else if ((flags & 4) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteUint32Field();
  flags = (__int16)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_8:
    if ((flags & 1) == 0)
      goto LABEL_9;
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteUint32Field();
  flags = (__int16)self->_flags;
  if ((flags & 1) == 0)
  {
LABEL_9:
    if ((flags & 0x20) == 0)
      goto LABEL_10;
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteFloatField();
  flags = (__int16)self->_flags;
  if ((flags & 0x20) == 0)
  {
LABEL_10:
    if ((flags & 0x80) == 0)
      goto LABEL_11;
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteFloatField();
  flags = (__int16)self->_flags;
  if ((flags & 0x80) == 0)
  {
LABEL_11:
    if ((flags & 0x40) == 0)
      goto LABEL_12;
LABEL_28:
    PBDataWriterWriteInt32Field();
    if ((*(_WORD *)&self->_flags & 2) == 0)
      goto LABEL_14;
    goto LABEL_13;
  }
LABEL_27:
  PBDataWriterWriteFloatField();
  flags = (__int16)self->_flags;
  if ((flags & 0x40) != 0)
    goto LABEL_28;
LABEL_12:
  if ((flags & 2) != 0)
LABEL_13:
    PBDataWriterWriteFloatField();
LABEL_14:
  if (self->_signGuidanceFeedback)
    PBDataWriterWriteSubmessage();
  if (self->_spokenGuidanceFeedback)
    PBDataWriterWriteSubmessage();
  if (self->_junctionViewGuidanceFeedback)
    PBDataWriterWriteSubmessage();
  if (self->_trafficCameraGuidanceFeedback)
    PBDataWriterWriteSubmessage();
LABEL_31:

}

- (void)copyTo:(id)a3
{
  __int16 flags;
  id *v5;
  id *v6;

  v6 = (id *)a3;
  -[GEOGuidanceEventFeedback readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v6 + 1, self->_reader);
  *((_DWORD *)v6 + 14) = self->_readerMarkPos;
  *((_DWORD *)v6 + 15) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_routeID)
    objc_msgSend(v6, "setRouteID:");
  flags = (__int16)self->_flags;
  v5 = v6;
  if ((flags & 0x10) != 0)
  {
    *((_DWORD *)v6 + 21) = self->_stepID;
    *((_WORD *)v6 + 50) |= 0x10u;
    flags = (__int16)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_5:
      if ((flags & 8) == 0)
        goto LABEL_6;
      goto LABEL_23;
    }
  }
  else if ((flags & 4) == 0)
  {
    goto LABEL_5;
  }
  *((_DWORD *)v6 + 19) = self->_enrouteNoticeIndex;
  *((_WORD *)v6 + 50) |= 4u;
  flags = (__int16)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_6:
    if ((flags & 1) == 0)
      goto LABEL_7;
    goto LABEL_24;
  }
LABEL_23:
  *((_DWORD *)v6 + 20) = self->_eventIndex;
  *((_WORD *)v6 + 50) |= 8u;
  flags = (__int16)self->_flags;
  if ((flags & 1) == 0)
  {
LABEL_7:
    if ((flags & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_25;
  }
LABEL_24:
  *((_DWORD *)v6 + 17) = LODWORD(self->_distanceToManeuver);
  *((_WORD *)v6 + 50) |= 1u;
  flags = (__int16)self->_flags;
  if ((flags & 0x20) == 0)
  {
LABEL_8:
    if ((flags & 0x80) == 0)
      goto LABEL_9;
    goto LABEL_26;
  }
LABEL_25:
  *((_DWORD *)v6 + 22) = LODWORD(self->_timeToManeuver);
  *((_WORD *)v6 + 50) |= 0x20u;
  flags = (__int16)self->_flags;
  if ((flags & 0x80) == 0)
  {
LABEL_9:
    if ((flags & 0x40) == 0)
      goto LABEL_10;
    goto LABEL_27;
  }
LABEL_26:
  *((_DWORD *)v6 + 24) = LODWORD(self->_vehicleSpeed);
  *((_WORD *)v6 + 50) |= 0x80u;
  flags = (__int16)self->_flags;
  if ((flags & 0x40) == 0)
  {
LABEL_10:
    if ((flags & 2) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_27:
  *((_DWORD *)v6 + 23) = self->_trafficSpeed;
  *((_WORD *)v6 + 50) |= 0x40u;
  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
LABEL_11:
    *((_DWORD *)v6 + 18) = LODWORD(self->_duration);
    *((_WORD *)v6 + 50) |= 2u;
  }
LABEL_12:
  if (self->_signGuidanceFeedback)
  {
    objc_msgSend(v6, "setSignGuidanceFeedback:");
    v5 = v6;
  }
  if (self->_spokenGuidanceFeedback)
  {
    objc_msgSend(v6, "setSpokenGuidanceFeedback:");
    v5 = v6;
  }
  if (self->_junctionViewGuidanceFeedback)
  {
    objc_msgSend(v6, "setJunctionViewGuidanceFeedback:");
    v5 = v6;
  }
  if (self->_trafficCameraGuidanceFeedback)
  {
    objc_msgSend(v6, "setTrafficCameraGuidanceFeedback:");
    v5 = v6;
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
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
  {
LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOGuidanceEventFeedback readAll:](self, "readAll:", 0);
    v9 = -[NSData copyWithZone:](self->_routeID, "copyWithZone:", a3);
    v10 = *(void **)(v5 + 24);
    *(_QWORD *)(v5 + 24) = v9;

    flags = (__int16)self->_flags;
    if ((flags & 0x10) != 0)
    {
      *(_DWORD *)(v5 + 84) = self->_stepID;
      *(_WORD *)(v5 + 100) |= 0x10u;
      flags = (__int16)self->_flags;
      if ((flags & 4) == 0)
      {
LABEL_7:
        if ((flags & 8) == 0)
          goto LABEL_8;
        goto LABEL_18;
      }
    }
    else if ((flags & 4) == 0)
    {
      goto LABEL_7;
    }
    *(_DWORD *)(v5 + 76) = self->_enrouteNoticeIndex;
    *(_WORD *)(v5 + 100) |= 4u;
    flags = (__int16)self->_flags;
    if ((flags & 8) == 0)
    {
LABEL_8:
      if ((flags & 1) == 0)
        goto LABEL_9;
      goto LABEL_19;
    }
LABEL_18:
    *(_DWORD *)(v5 + 80) = self->_eventIndex;
    *(_WORD *)(v5 + 100) |= 8u;
    flags = (__int16)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_9:
      if ((flags & 0x20) == 0)
        goto LABEL_10;
      goto LABEL_20;
    }
LABEL_19:
    *(float *)(v5 + 68) = self->_distanceToManeuver;
    *(_WORD *)(v5 + 100) |= 1u;
    flags = (__int16)self->_flags;
    if ((flags & 0x20) == 0)
    {
LABEL_10:
      if ((flags & 0x80) == 0)
        goto LABEL_11;
      goto LABEL_21;
    }
LABEL_20:
    *(float *)(v5 + 88) = self->_timeToManeuver;
    *(_WORD *)(v5 + 100) |= 0x20u;
    flags = (__int16)self->_flags;
    if ((flags & 0x80) == 0)
    {
LABEL_11:
      if ((flags & 0x40) == 0)
        goto LABEL_12;
      goto LABEL_22;
    }
LABEL_21:
    *(float *)(v5 + 96) = self->_vehicleSpeed;
    *(_WORD *)(v5 + 100) |= 0x80u;
    flags = (__int16)self->_flags;
    if ((flags & 0x40) == 0)
    {
LABEL_12:
      if ((flags & 2) == 0)
      {
LABEL_14:
        v12 = -[GEOSignGuidanceFeedback copyWithZone:](self->_signGuidanceFeedback, "copyWithZone:", a3);
        v13 = *(void **)(v5 + 32);
        *(_QWORD *)(v5 + 32) = v12;

        v14 = -[GEOSpokenGuidanceFeedback copyWithZone:](self->_spokenGuidanceFeedback, "copyWithZone:", a3);
        v15 = *(void **)(v5 + 40);
        *(_QWORD *)(v5 + 40) = v14;

        v16 = -[GEOJunctionViewGuidanceFeedback copyWithZone:](self->_junctionViewGuidanceFeedback, "copyWithZone:", a3);
        v17 = *(void **)(v5 + 16);
        *(_QWORD *)(v5 + 16) = v16;

        v18 = -[GEOTrafficCameraInformation copyWithZone:](self->_trafficCameraGuidanceFeedback, "copyWithZone:", a3);
        v8 = *(id *)(v5 + 48);
        *(_QWORD *)(v5 + 48) = v18;
        goto LABEL_15;
      }
LABEL_13:
      *(float *)(v5 + 72) = self->_duration;
      *(_WORD *)(v5 + 100) |= 2u;
      goto LABEL_14;
    }
LABEL_22:
    *(_DWORD *)(v5 + 92) = self->_trafficSpeed;
    *(_WORD *)(v5 + 100) |= 0x40u;
    if ((*(_WORD *)&self->_flags & 2) == 0)
      goto LABEL_14;
    goto LABEL_13;
  }
  v7 = reader;
  objc_sync_enter(v7);
  if ((*(_WORD *)&self->_flags & 0x2000) != 0)
  {
    objc_sync_exit(v7);

    goto LABEL_5;
  }
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  GEOGuidanceEventFeedbackReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  v8 = (id)v5;
  objc_sync_exit(v7);

LABEL_15:
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSData *routeID;
  __int16 flags;
  __int16 v7;
  GEOSignGuidanceFeedback *signGuidanceFeedback;
  GEOSpokenGuidanceFeedback *spokenGuidanceFeedback;
  GEOJunctionViewGuidanceFeedback *junctionViewGuidanceFeedback;
  GEOTrafficCameraInformation *trafficCameraGuidanceFeedback;
  char v12;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_52;
  -[GEOGuidanceEventFeedback readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  routeID = self->_routeID;
  if ((unint64_t)routeID | *((_QWORD *)v4 + 3))
  {
    if (!-[NSData isEqual:](routeID, "isEqual:"))
      goto LABEL_52;
  }
  flags = (__int16)self->_flags;
  v7 = *((_WORD *)v4 + 50);
  if ((flags & 0x10) != 0)
  {
    if ((v7 & 0x10) == 0 || self->_stepID != *((_DWORD *)v4 + 21))
      goto LABEL_52;
  }
  else if ((v7 & 0x10) != 0)
  {
LABEL_52:
    v12 = 0;
    goto LABEL_53;
  }
  if ((flags & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_enrouteNoticeIndex != *((_DWORD *)v4 + 19))
      goto LABEL_52;
  }
  else if ((v7 & 4) != 0)
  {
    goto LABEL_52;
  }
  if ((flags & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_eventIndex != *((_DWORD *)v4 + 20))
      goto LABEL_52;
  }
  else if ((v7 & 8) != 0)
  {
    goto LABEL_52;
  }
  if ((flags & 1) != 0)
  {
    if ((v7 & 1) == 0 || self->_distanceToManeuver != *((float *)v4 + 17))
      goto LABEL_52;
  }
  else if ((v7 & 1) != 0)
  {
    goto LABEL_52;
  }
  if ((flags & 0x20) != 0)
  {
    if ((v7 & 0x20) == 0 || self->_timeToManeuver != *((float *)v4 + 22))
      goto LABEL_52;
  }
  else if ((v7 & 0x20) != 0)
  {
    goto LABEL_52;
  }
  if ((flags & 0x80) != 0)
  {
    if ((v7 & 0x80) == 0 || self->_vehicleSpeed != *((float *)v4 + 24))
      goto LABEL_52;
  }
  else if ((v7 & 0x80) != 0)
  {
    goto LABEL_52;
  }
  if ((flags & 0x40) != 0)
  {
    if ((v7 & 0x40) == 0 || self->_trafficSpeed != *((_DWORD *)v4 + 23))
      goto LABEL_52;
  }
  else if ((v7 & 0x40) != 0)
  {
    goto LABEL_52;
  }
  if ((flags & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_duration != *((float *)v4 + 18))
      goto LABEL_52;
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_52;
  }
  signGuidanceFeedback = self->_signGuidanceFeedback;
  if ((unint64_t)signGuidanceFeedback | *((_QWORD *)v4 + 4)
    && !-[GEOSignGuidanceFeedback isEqual:](signGuidanceFeedback, "isEqual:"))
  {
    goto LABEL_52;
  }
  spokenGuidanceFeedback = self->_spokenGuidanceFeedback;
  if ((unint64_t)spokenGuidanceFeedback | *((_QWORD *)v4 + 5))
  {
    if (!-[GEOSpokenGuidanceFeedback isEqual:](spokenGuidanceFeedback, "isEqual:"))
      goto LABEL_52;
  }
  junctionViewGuidanceFeedback = self->_junctionViewGuidanceFeedback;
  if ((unint64_t)junctionViewGuidanceFeedback | *((_QWORD *)v4 + 2))
  {
    if (!-[GEOJunctionViewGuidanceFeedback isEqual:](junctionViewGuidanceFeedback, "isEqual:"))
      goto LABEL_52;
  }
  trafficCameraGuidanceFeedback = self->_trafficCameraGuidanceFeedback;
  if ((unint64_t)trafficCameraGuidanceFeedback | *((_QWORD *)v4 + 6))
    v12 = -[GEOTrafficCameraInformation isEqual:](trafficCameraGuidanceFeedback, "isEqual:");
  else
    v12 = 1;
LABEL_53:

  return v12;
}

- (unint64_t)hash
{
  __int16 flags;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  float distanceToManeuver;
  double v8;
  long double v9;
  double v10;
  unint64_t v11;
  unint64_t v12;
  float timeToManeuver;
  double v14;
  long double v15;
  double v16;
  unint64_t v17;
  float vehicleSpeed;
  double v19;
  long double v20;
  double v21;
  uint64_t v22;
  float duration;
  double v24;
  long double v25;
  double v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v33;

  -[GEOGuidanceEventFeedback readAll:](self, "readAll:", 1);
  v33 = -[NSData hash](self->_routeID, "hash");
  flags = (__int16)self->_flags;
  if ((flags & 0x10) != 0)
  {
    v4 = 2654435761 * self->_stepID;
    if ((flags & 4) != 0)
    {
LABEL_3:
      v5 = 2654435761 * self->_enrouteNoticeIndex;
      if ((flags & 8) != 0)
        goto LABEL_4;
LABEL_11:
      v6 = 0;
      if ((flags & 1) != 0)
        goto LABEL_5;
LABEL_12:
      v11 = 0;
      goto LABEL_15;
    }
  }
  else
  {
    v4 = 0;
    if ((flags & 4) != 0)
      goto LABEL_3;
  }
  v5 = 0;
  if ((flags & 8) == 0)
    goto LABEL_11;
LABEL_4:
  v6 = 2654435761 * self->_eventIndex;
  if ((flags & 1) == 0)
    goto LABEL_12;
LABEL_5:
  distanceToManeuver = self->_distanceToManeuver;
  v8 = distanceToManeuver;
  if (distanceToManeuver < 0.0)
    v8 = -distanceToManeuver;
  v9 = floor(v8 + 0.5);
  v10 = (v8 - v9) * 1.84467441e19;
  v11 = 2654435761u * (unint64_t)fmod(v9, 1.84467441e19);
  if (v10 >= 0.0)
  {
    if (v10 > 0.0)
      v11 += (unint64_t)v10;
  }
  else
  {
    v11 -= (unint64_t)fabs(v10);
  }
LABEL_15:
  if ((flags & 0x20) != 0)
  {
    timeToManeuver = self->_timeToManeuver;
    v14 = timeToManeuver;
    if (timeToManeuver < 0.0)
      v14 = -timeToManeuver;
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
  if ((flags & 0x80) != 0)
  {
    vehicleSpeed = self->_vehicleSpeed;
    v19 = vehicleSpeed;
    if (vehicleSpeed < 0.0)
      v19 = -vehicleSpeed;
    v20 = floor(v19 + 0.5);
    v21 = (v19 - v20) * 1.84467441e19;
    v17 = 2654435761u * (unint64_t)fmod(v20, 1.84467441e19);
    if (v21 >= 0.0)
    {
      if (v21 > 0.0)
        v17 += (unint64_t)v21;
    }
    else
    {
      v17 -= (unint64_t)fabs(v21);
    }
  }
  else
  {
    v17 = 0;
  }
  if ((flags & 0x40) != 0)
  {
    v22 = 2654435761 * self->_trafficSpeed;
    if ((flags & 2) != 0)
      goto LABEL_33;
LABEL_38:
    v27 = 0;
    goto LABEL_41;
  }
  v22 = 0;
  if ((flags & 2) == 0)
    goto LABEL_38;
LABEL_33:
  duration = self->_duration;
  v24 = duration;
  if (duration < 0.0)
    v24 = -duration;
  v25 = floor(v24 + 0.5);
  v26 = (v24 - v25) * 1.84467441e19;
  v27 = 2654435761u * (unint64_t)fmod(v25, 1.84467441e19);
  if (v26 >= 0.0)
  {
    if (v26 > 0.0)
      v27 += (unint64_t)v26;
  }
  else
  {
    v27 -= (unint64_t)fabs(v26);
  }
LABEL_41:
  v28 = v4 ^ v33 ^ v5 ^ v6 ^ v11 ^ v12 ^ v17 ^ v22 ^ v27;
  v29 = -[GEOSignGuidanceFeedback hash](self->_signGuidanceFeedback, "hash");
  v30 = v28 ^ v29 ^ -[GEOSpokenGuidanceFeedback hash](self->_spokenGuidanceFeedback, "hash");
  v31 = -[GEOJunctionViewGuidanceFeedback hash](self->_junctionViewGuidanceFeedback, "hash");
  return v30 ^ v31 ^ -[GEOTrafficCameraInformation hash](self->_trafficCameraGuidanceFeedback, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  __int16 v5;
  GEOSignGuidanceFeedback *signGuidanceFeedback;
  uint64_t v7;
  GEOSpokenGuidanceFeedback *spokenGuidanceFeedback;
  uint64_t v9;
  GEOJunctionViewGuidanceFeedback *junctionViewGuidanceFeedback;
  uint64_t v11;
  GEOTrafficCameraInformation *trafficCameraGuidanceFeedback;
  uint64_t v13;
  _QWORD *v14;

  v14 = a3;
  objc_msgSend(v14, "readAll:", 0);
  v4 = v14;
  if (v14[3])
  {
    -[GEOGuidanceEventFeedback setRouteID:](self, "setRouteID:");
    v4 = v14;
  }
  v5 = *((_WORD *)v4 + 50);
  if ((v5 & 0x10) != 0)
  {
    self->_stepID = *((_DWORD *)v4 + 21);
    *(_WORD *)&self->_flags |= 0x10u;
    v5 = *((_WORD *)v4 + 50);
    if ((v5 & 4) == 0)
    {
LABEL_5:
      if ((v5 & 8) == 0)
        goto LABEL_6;
      goto LABEL_17;
    }
  }
  else if ((v5 & 4) == 0)
  {
    goto LABEL_5;
  }
  self->_enrouteNoticeIndex = *((_DWORD *)v4 + 19);
  *(_WORD *)&self->_flags |= 4u;
  v5 = *((_WORD *)v4 + 50);
  if ((v5 & 8) == 0)
  {
LABEL_6:
    if ((v5 & 1) == 0)
      goto LABEL_7;
    goto LABEL_18;
  }
LABEL_17:
  self->_eventIndex = *((_DWORD *)v4 + 20);
  *(_WORD *)&self->_flags |= 8u;
  v5 = *((_WORD *)v4 + 50);
  if ((v5 & 1) == 0)
  {
LABEL_7:
    if ((v5 & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_19;
  }
LABEL_18:
  self->_distanceToManeuver = *((float *)v4 + 17);
  *(_WORD *)&self->_flags |= 1u;
  v5 = *((_WORD *)v4 + 50);
  if ((v5 & 0x20) == 0)
  {
LABEL_8:
    if ((v5 & 0x80) == 0)
      goto LABEL_9;
    goto LABEL_20;
  }
LABEL_19:
  self->_timeToManeuver = *((float *)v4 + 22);
  *(_WORD *)&self->_flags |= 0x20u;
  v5 = *((_WORD *)v4 + 50);
  if ((v5 & 0x80) == 0)
  {
LABEL_9:
    if ((v5 & 0x40) == 0)
      goto LABEL_10;
    goto LABEL_21;
  }
LABEL_20:
  self->_vehicleSpeed = *((float *)v4 + 24);
  *(_WORD *)&self->_flags |= 0x80u;
  v5 = *((_WORD *)v4 + 50);
  if ((v5 & 0x40) == 0)
  {
LABEL_10:
    if ((v5 & 2) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_21:
  self->_trafficSpeed = *((_DWORD *)v4 + 23);
  *(_WORD *)&self->_flags |= 0x40u;
  if ((*((_WORD *)v4 + 50) & 2) != 0)
  {
LABEL_11:
    self->_duration = *((float *)v4 + 18);
    *(_WORD *)&self->_flags |= 2u;
  }
LABEL_12:
  signGuidanceFeedback = self->_signGuidanceFeedback;
  v7 = v4[4];
  if (signGuidanceFeedback)
  {
    if (!v7)
      goto LABEL_26;
    -[GEOSignGuidanceFeedback mergeFrom:](signGuidanceFeedback, "mergeFrom:");
  }
  else
  {
    if (!v7)
      goto LABEL_26;
    -[GEOGuidanceEventFeedback setSignGuidanceFeedback:](self, "setSignGuidanceFeedback:");
  }
  v4 = v14;
LABEL_26:
  spokenGuidanceFeedback = self->_spokenGuidanceFeedback;
  v9 = v4[5];
  if (spokenGuidanceFeedback)
  {
    if (!v9)
      goto LABEL_32;
    -[GEOSpokenGuidanceFeedback mergeFrom:](spokenGuidanceFeedback, "mergeFrom:");
  }
  else
  {
    if (!v9)
      goto LABEL_32;
    -[GEOGuidanceEventFeedback setSpokenGuidanceFeedback:](self, "setSpokenGuidanceFeedback:");
  }
  v4 = v14;
LABEL_32:
  junctionViewGuidanceFeedback = self->_junctionViewGuidanceFeedback;
  v11 = v4[2];
  if (junctionViewGuidanceFeedback)
  {
    if (!v11)
      goto LABEL_38;
    -[GEOJunctionViewGuidanceFeedback mergeFrom:](junctionViewGuidanceFeedback, "mergeFrom:");
  }
  else
  {
    if (!v11)
      goto LABEL_38;
    -[GEOGuidanceEventFeedback setJunctionViewGuidanceFeedback:](self, "setJunctionViewGuidanceFeedback:");
  }
  v4 = v14;
LABEL_38:
  trafficCameraGuidanceFeedback = self->_trafficCameraGuidanceFeedback;
  v13 = v4[6];
  if (trafficCameraGuidanceFeedback)
  {
    if (v13)
    {
      -[GEOTrafficCameraInformation mergeFrom:](trafficCameraGuidanceFeedback, "mergeFrom:");
LABEL_43:
      v4 = v14;
    }
  }
  else if (v13)
  {
    -[GEOGuidanceEventFeedback setTrafficCameraGuidanceFeedback:](self, "setTrafficCameraGuidanceFeedback:");
    goto LABEL_43;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trafficCameraGuidanceFeedback, 0);
  objc_storeStrong((id *)&self->_spokenGuidanceFeedback, 0);
  objc_storeStrong((id *)&self->_signGuidanceFeedback, 0);
  objc_storeStrong((id *)&self->_routeID, 0);
  objc_storeStrong((id *)&self->_junctionViewGuidanceFeedback, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
