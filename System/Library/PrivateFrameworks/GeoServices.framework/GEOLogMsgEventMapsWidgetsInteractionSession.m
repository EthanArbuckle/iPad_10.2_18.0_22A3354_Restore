@implementation GEOLogMsgEventMapsWidgetsInteractionSession

- (GEOLogMsgEventMapsWidgetsInteractionSession)init
{
  GEOLogMsgEventMapsWidgetsInteractionSession *v2;
  GEOLogMsgEventMapsWidgetsInteractionSession *v3;
  GEOLogMsgEventMapsWidgetsInteractionSession *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOLogMsgEventMapsWidgetsInteractionSession;
  v2 = -[GEOLogMsgEventMapsWidgetsInteractionSession init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOLogMsgEventMapsWidgetsInteractionSession)initWithData:(id)a3
{
  GEOLogMsgEventMapsWidgetsInteractionSession *v3;
  GEOLogMsgEventMapsWidgetsInteractionSession *v4;
  GEOLogMsgEventMapsWidgetsInteractionSession *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOLogMsgEventMapsWidgetsInteractionSession;
  v3 = -[GEOLogMsgEventMapsWidgetsInteractionSession initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (int)mapsWidgetType
{
  os_unfair_lock_s *p_readerLock;
  __int16 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 0x10) != 0)
    return self->_mapsWidgetType;
  else
    return 0;
}

- (void)setMapsWidgetType:(int)a3
{
  *(_WORD *)&self->_flags |= 0x210u;
  self->_mapsWidgetType = a3;
}

- (void)setHasMapsWidgetType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 528;
  else
    v3 = 512;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFEF | v3;
}

- (BOOL)hasMapsWidgetType
{
  return (*(_WORD *)&self->_flags >> 4) & 1;
}

- (id)mapsWidgetTypeAsString:(int)a3
{
  if (a3 < 4)
    return *(&off_1E1C032C0 + a3);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsMapsWidgetType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAPS_WIDGET_TYPE_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAPS_WIDGET_TYPE_DESTINATIONS")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAPS_WIDGET_TYPE_TRANSIT")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("MAPS_WIDGET_TYPE_NEARBY")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)endState
{
  os_unfair_lock_s *p_readerLock;
  __int16 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 2) != 0)
    return self->_endState;
  else
    return 0;
}

- (void)setEndState:(int)a3
{
  *(_WORD *)&self->_flags |= 0x202u;
  self->_endState = a3;
}

- (void)setHasEndState:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 514;
  else
    v3 = 512;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasEndState
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
}

- (id)endStateAsString:(int)a3
{
  if (a3 < 3)
    return *(&off_1E1C032E0 + a3);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsEndState:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MPSES_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MPSES_INTERACTED")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("MPSES_ABANDONED")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_readMapsDestinationsWidget
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(_WORD *)(a1 + 76) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventMapsWidgetsInteractionSessionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMapsDestinationsWidget_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasMapsDestinationsWidget
{
  -[GEOLogMsgEventMapsWidgetsInteractionSession _readMapsDestinationsWidget]((uint64_t)self);
  return self->_mapsDestinationsWidget != 0;
}

- (GEOMapsDestinationsWidget)mapsDestinationsWidget
{
  -[GEOLogMsgEventMapsWidgetsInteractionSession _readMapsDestinationsWidget]((uint64_t)self);
  return self->_mapsDestinationsWidget;
}

- (void)setMapsDestinationsWidget:(id)a3
{
  *(_WORD *)&self->_flags |= 0x240u;
  objc_storeStrong((id *)&self->_mapsDestinationsWidget, a3);
}

- (void)_readMapsTransitWidget
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(_WORD *)(a1 + 76) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventMapsWidgetsInteractionSessionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMapsTransitWidget_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasMapsTransitWidget
{
  -[GEOLogMsgEventMapsWidgetsInteractionSession _readMapsTransitWidget]((uint64_t)self);
  return self->_mapsTransitWidget != 0;
}

- (GEOMapsTransitWidget)mapsTransitWidget
{
  -[GEOLogMsgEventMapsWidgetsInteractionSession _readMapsTransitWidget]((uint64_t)self);
  return self->_mapsTransitWidget;
}

- (void)setMapsTransitWidget:(id)a3
{
  *(_WORD *)&self->_flags |= 0x300u;
  objc_storeStrong((id *)&self->_mapsTransitWidget, a3);
}

- (void)_readMapsNearbyWidget
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(_WORD *)(a1 + 76) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventMapsWidgetsInteractionSessionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMapsNearbyWidget_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasMapsNearbyWidget
{
  -[GEOLogMsgEventMapsWidgetsInteractionSession _readMapsNearbyWidget]((uint64_t)self);
  return self->_mapsNearbyWidget != 0;
}

- (GEOMapsNearbyWidget)mapsNearbyWidget
{
  -[GEOLogMsgEventMapsWidgetsInteractionSession _readMapsNearbyWidget]((uint64_t)self);
  return self->_mapsNearbyWidget;
}

- (void)setMapsNearbyWidget:(id)a3
{
  *(_WORD *)&self->_flags |= 0x280u;
  objc_storeStrong((id *)&self->_mapsNearbyWidget, a3);
}

- (BOOL)lockedMode
{
  return self->_lockedMode;
}

- (void)setLockedMode:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x220u;
  self->_lockedMode = a3;
}

- (void)setHasLockedMode:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 544;
  else
    v3 = 512;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFDF | v3;
}

- (BOOL)hasLockedMode
{
  return (*(_WORD *)&self->_flags >> 5) & 1;
}

- (int)localHour
{
  return self->_localHour;
}

- (void)setLocalHour:(int)a3
{
  *(_WORD *)&self->_flags |= 0x208u;
  self->_localHour = a3;
}

- (void)setHasLocalHour:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 520;
  else
    v3 = 512;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFF7 | v3;
}

- (BOOL)hasLocalHour
{
  return (*(_WORD *)&self->_flags >> 3) & 1;
}

- (int)localDayOfWeek
{
  return self->_localDayOfWeek;
}

- (void)setLocalDayOfWeek:(int)a3
{
  *(_WORD *)&self->_flags |= 0x204u;
  self->_localDayOfWeek = a3;
}

- (void)setHasLocalDayOfWeek:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 516;
  else
    v3 = 512;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFB | v3;
}

- (BOOL)hasLocalDayOfWeek
{
  return (*(_WORD *)&self->_flags >> 2) & 1;
}

- (int)duration
{
  return self->_duration;
}

- (void)setDuration:(int)a3
{
  *(_WORD *)&self->_flags |= 0x201u;
  self->_duration = a3;
}

- (void)setHasDuration:(BOOL)a3
{
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFE | a3 | 0x200;
}

- (BOOL)hasDuration
{
  return *(_WORD *)&self->_flags & 1;
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
  v8.super_class = (Class)GEOLogMsgEventMapsWidgetsInteractionSession;
  -[GEOLogMsgEventMapsWidgetsInteractionSession description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOLogMsgEventMapsWidgetsInteractionSession dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgEventMapsWidgetsInteractionSession _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  __int16 v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  const __CFString *v23;
  __int16 v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  const __CFString *v30;
  void *v31;

  if (!a1)
  {
    v4 = 0;
    return v4;
  }
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_WORD *)(a1 + 76);
  if ((v5 & 0x10) != 0)
  {
    v6 = *(int *)(a1 + 68);
    if (v6 >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 68));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = *(&off_1E1C032C0 + v6);
    }
    if (a2)
      v8 = CFSTR("mapsWidgetType");
    else
      v8 = CFSTR("maps_widget_type");
    objc_msgSend(v4, "setObject:forKey:", v7, v8);

    v5 = *(_WORD *)(a1 + 76);
  }
  if ((v5 & 2) != 0)
  {
    v9 = *(int *)(a1 + 56);
    if (v9 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 56));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = *(&off_1E1C032E0 + v9);
    }
    if (a2)
      v11 = CFSTR("endState");
    else
      v11 = CFSTR("end_state");
    objc_msgSend(v4, "setObject:forKey:", v10, v11);

  }
  objc_msgSend((id)a1, "mapsDestinationsWidget");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v12, "jsonRepresentation");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = CFSTR("mapsDestinationsWidget");
    }
    else
    {
      objc_msgSend(v12, "dictionaryRepresentation");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = CFSTR("maps_destinations_widget");
    }
    objc_msgSend(v4, "setObject:forKey:", v14, v15);

  }
  objc_msgSend((id)a1, "mapsTransitWidget");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v16)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v16, "jsonRepresentation");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = CFSTR("mapsTransitWidget");
    }
    else
    {
      objc_msgSend(v16, "dictionaryRepresentation");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = CFSTR("maps_transit_widget");
    }
    objc_msgSend(v4, "setObject:forKey:", v18, v19);

  }
  objc_msgSend((id)a1, "mapsNearbyWidget");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v20)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v20, "jsonRepresentation");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = CFSTR("mapsNearbyWidget");
    }
    else
    {
      objc_msgSend(v20, "dictionaryRepresentation");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = CFSTR("maps_nearby_widget");
    }
    objc_msgSend(v4, "setObject:forKey:", v22, v23);

  }
  v24 = *(_WORD *)(a1 + 76);
  if ((v24 & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 72));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v26 = CFSTR("lockedMode");
    else
      v26 = CFSTR("locked_mode");
    objc_msgSend(v4, "setObject:forKey:", v25, v26);

    v24 = *(_WORD *)(a1 + 76);
    if ((v24 & 8) == 0)
    {
LABEL_35:
      if ((v24 & 4) == 0)
        goto LABEL_36;
      goto LABEL_46;
    }
  }
  else if ((v24 & 8) == 0)
  {
    goto LABEL_35;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 64));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v28 = CFSTR("localHour");
  else
    v28 = CFSTR("local_hour");
  objc_msgSend(v4, "setObject:forKey:", v27, v28);

  v24 = *(_WORD *)(a1 + 76);
  if ((v24 & 4) == 0)
  {
LABEL_36:
    if ((v24 & 1) == 0)
      return v4;
    goto LABEL_50;
  }
LABEL_46:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 60));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v30 = CFSTR("localDayOfWeek");
  else
    v30 = CFSTR("local_day_of_week");
  objc_msgSend(v4, "setObject:forKey:", v29, v30);

  if ((*(_WORD *)(a1 + 76) & 1) != 0)
  {
LABEL_50:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 52));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v31, CFSTR("duration"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOLogMsgEventMapsWidgetsInteractionSession _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLogMsgEventMapsWidgetsInteractionSession)initWithDictionary:(id)a3
{
  return (GEOLogMsgEventMapsWidgetsInteractionSession *)-[GEOLogMsgEventMapsWidgetsInteractionSession _initWithDictionary:isJSON:](self, a3, 0);
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
  GEOMapsDestinationsWidget *v16;
  uint64_t v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  GEOMapsTransitWidget *v21;
  uint64_t v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  GEOMapsNearbyWidget *v26;
  uint64_t v27;
  void *v28;
  const __CFString *v29;
  void *v30;
  const __CFString *v31;
  void *v32;
  const __CFString *v33;
  void *v34;
  void *v35;

  v5 = a2;
  if (!a1)
    goto LABEL_77;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_77;
  if (a3)
    v6 = CFSTR("mapsWidgetType");
  else
    v6 = CFSTR("maps_widget_type");
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
    if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MAPS_WIDGET_TYPE_UNKNOWN")) & 1) != 0)
    {
      v9 = 0;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MAPS_WIDGET_TYPE_DESTINATIONS")) & 1) != 0)
    {
      v9 = 1;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MAPS_WIDGET_TYPE_TRANSIT")) & 1) != 0)
    {
      v9 = 2;
    }
    else if (objc_msgSend(v8, "isEqualToString:", CFSTR("MAPS_WIDGET_TYPE_NEARBY")))
    {
      v9 = 3;
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
      goto LABEL_20;
    v9 = objc_msgSend(v7, "intValue");
  }
  objc_msgSend(a1, "setMapsWidgetType:", v9);
LABEL_20:

  if (a3)
    v10 = CFSTR("endState");
  else
    v10 = CFSTR("end_state");
  objc_msgSend(v5, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12 = v11;
    if ((objc_msgSend(v12, "isEqualToString:", CFSTR("MPSES_UNKNOWN")) & 1) != 0)
    {
      v13 = 0;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("MPSES_INTERACTED")) & 1) != 0)
    {
      v13 = 1;
    }
    else if (objc_msgSend(v12, "isEqualToString:", CFSTR("MPSES_ABANDONED")))
    {
      v13 = 2;
    }
    else
    {
      v13 = 0;
    }

    goto LABEL_34;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v13 = objc_msgSend(v11, "intValue");
LABEL_34:
    objc_msgSend(a1, "setEndState:", v13);
  }

  if (a3)
    v14 = CFSTR("mapsDestinationsWidget");
  else
    v14 = CFSTR("maps_destinations_widget");
  objc_msgSend(v5, "objectForKeyedSubscript:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v16 = [GEOMapsDestinationsWidget alloc];
    if ((a3 & 1) != 0)
      v17 = -[GEOMapsDestinationsWidget initWithJSON:](v16, "initWithJSON:", v15);
    else
      v17 = -[GEOMapsDestinationsWidget initWithDictionary:](v16, "initWithDictionary:", v15);
    v18 = (void *)v17;
    objc_msgSend(a1, "setMapsDestinationsWidget:", v17);

  }
  if (a3)
    v19 = CFSTR("mapsTransitWidget");
  else
    v19 = CFSTR("maps_transit_widget");
  objc_msgSend(v5, "objectForKeyedSubscript:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v21 = [GEOMapsTransitWidget alloc];
    if ((a3 & 1) != 0)
      v22 = -[GEOMapsTransitWidget initWithJSON:](v21, "initWithJSON:", v20);
    else
      v22 = -[GEOMapsTransitWidget initWithDictionary:](v21, "initWithDictionary:", v20);
    v23 = (void *)v22;
    objc_msgSend(a1, "setMapsTransitWidget:", v22);

  }
  if (a3)
    v24 = CFSTR("mapsNearbyWidget");
  else
    v24 = CFSTR("maps_nearby_widget");
  objc_msgSend(v5, "objectForKeyedSubscript:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v26 = [GEOMapsNearbyWidget alloc];
    if ((a3 & 1) != 0)
      v27 = -[GEOMapsNearbyWidget initWithJSON:](v26, "initWithJSON:", v25);
    else
      v27 = -[GEOMapsNearbyWidget initWithDictionary:](v26, "initWithDictionary:", v25);
    v28 = (void *)v27;
    objc_msgSend(a1, "setMapsNearbyWidget:", v27);

  }
  if (a3)
    v29 = CFSTR("lockedMode");
  else
    v29 = CFSTR("locked_mode");
  objc_msgSend(v5, "objectForKeyedSubscript:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setLockedMode:", objc_msgSend(v30, "BOOLValue"));

  if (a3)
    v31 = CFSTR("localHour");
  else
    v31 = CFSTR("local_hour");
  objc_msgSend(v5, "objectForKeyedSubscript:", v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setLocalHour:", objc_msgSend(v32, "intValue"));

  if (a3)
    v33 = CFSTR("localDayOfWeek");
  else
    v33 = CFSTR("local_day_of_week");
  objc_msgSend(v5, "objectForKeyedSubscript:", v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setLocalDayOfWeek:", objc_msgSend(v34, "intValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("duration"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setDuration:", objc_msgSend(v35, "intValue"));

LABEL_77:
  return a1;
}

- (GEOLogMsgEventMapsWidgetsInteractionSession)initWithJSON:(id)a3
{
  return (GEOLogMsgEventMapsWidgetsInteractionSession *)-[GEOLogMsgEventMapsWidgetsInteractionSession _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_5;
    else
      v8 = (int *)&readAll__nonRecursiveTag_5;
    GEOLogMsgEventMapsWidgetsInteractionSessionReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
  {
    -[GEOMapsDestinationsWidget readAll:](self->_mapsDestinationsWidget, "readAll:", 1);
    -[GEOMapsTransitWidget readAll:](self->_mapsTransitWidget, "readAll:", 1);
    -[GEOMapsNearbyWidget readAll:](self->_mapsNearbyWidget, "readAll:", 1);
  }
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgEventMapsWidgetsInteractionSessionIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgEventMapsWidgetsInteractionSessionReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  __int16 flags;
  __int16 v6;
  PBDataReader *v7;
  void *v8;
  id v9;

  v9 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader)
  {
    os_unfair_lock_assert_owner(&self->_readerLock);
    if ((*(_WORD *)&self->_flags & 0x3C0) == 0)
    {
      v7 = self->_reader;
      objc_sync_enter(v7);
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "writeData:", v8);
      os_unfair_lock_unlock(p_readerLock);

      objc_sync_exit(v7);
      goto LABEL_23;
    }
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOLogMsgEventMapsWidgetsInteractionSession readAll:](self, "readAll:", 0);
  flags = (__int16)self->_flags;
  if ((flags & 0x10) != 0)
  {
    PBDataWriterWriteInt32Field();
    flags = (__int16)self->_flags;
  }
  if ((flags & 2) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_mapsDestinationsWidget)
    PBDataWriterWriteSubmessage();
  if (self->_mapsTransitWidget)
    PBDataWriterWriteSubmessage();
  if (self->_mapsNearbyWidget)
    PBDataWriterWriteSubmessage();
  v6 = (__int16)self->_flags;
  if ((v6 & 0x20) != 0)
  {
    PBDataWriterWriteBOOLField();
    v6 = (__int16)self->_flags;
    if ((v6 & 8) == 0)
    {
LABEL_15:
      if ((v6 & 4) == 0)
        goto LABEL_16;
      goto LABEL_20;
    }
  }
  else if ((v6 & 8) == 0)
  {
    goto LABEL_15;
  }
  PBDataWriterWriteInt32Field();
  v6 = (__int16)self->_flags;
  if ((v6 & 4) == 0)
  {
LABEL_16:
    if ((v6 & 1) == 0)
      goto LABEL_23;
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteInt32Field();
  if ((*(_WORD *)&self->_flags & 1) != 0)
LABEL_21:
    PBDataWriterWriteInt32Field();
LABEL_23:

}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[GEOLogMsgEventMapsWidgetsInteractionSession _readMapsNearbyWidget]((uint64_t)self);
  return -[GEOMapsNearbyWidget hasGreenTeaWithValue:](self->_mapsNearbyWidget, "hasGreenTeaWithValue:", v3);
}

- (void)copyTo:(id)a3
{
  id *v4;
  __int16 flags;
  __int16 v6;
  id *v7;

  v7 = (id *)a3;
  -[GEOLogMsgEventMapsWidgetsInteractionSession readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v7 + 1, self->_reader);
  *((_DWORD *)v7 + 10) = self->_readerMarkPos;
  *((_DWORD *)v7 + 11) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  v4 = v7;
  flags = (__int16)self->_flags;
  if ((flags & 0x10) != 0)
  {
    *((_DWORD *)v7 + 17) = self->_mapsWidgetType;
    *((_WORD *)v7 + 38) |= 0x10u;
    flags = (__int16)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *((_DWORD *)v7 + 14) = self->_endState;
    *((_WORD *)v7 + 38) |= 2u;
  }
  if (self->_mapsDestinationsWidget)
  {
    objc_msgSend(v7, "setMapsDestinationsWidget:");
    v4 = v7;
  }
  if (self->_mapsTransitWidget)
  {
    objc_msgSend(v7, "setMapsTransitWidget:");
    v4 = v7;
  }
  if (self->_mapsNearbyWidget)
  {
    objc_msgSend(v7, "setMapsNearbyWidget:");
    v4 = v7;
  }
  v6 = (__int16)self->_flags;
  if ((v6 & 0x20) != 0)
  {
    *((_BYTE *)v4 + 72) = self->_lockedMode;
    *((_WORD *)v4 + 38) |= 0x20u;
    v6 = (__int16)self->_flags;
    if ((v6 & 8) == 0)
    {
LABEL_13:
      if ((v6 & 4) == 0)
        goto LABEL_14;
LABEL_19:
      *((_DWORD *)v4 + 15) = self->_localDayOfWeek;
      *((_WORD *)v4 + 38) |= 4u;
      if ((*(_WORD *)&self->_flags & 1) == 0)
        goto LABEL_16;
      goto LABEL_15;
    }
  }
  else if ((v6 & 8) == 0)
  {
    goto LABEL_13;
  }
  *((_DWORD *)v4 + 16) = self->_localHour;
  *((_WORD *)v4 + 38) |= 8u;
  v6 = (__int16)self->_flags;
  if ((v6 & 4) != 0)
    goto LABEL_19;
LABEL_14:
  if ((v6 & 1) != 0)
  {
LABEL_15:
    *((_DWORD *)v4 + 13) = self->_duration;
    *((_WORD *)v4 + 38) |= 1u;
  }
LABEL_16:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  __int16 flags;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  __int16 v16;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
  {
LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOLogMsgEventMapsWidgetsInteractionSession readAll:](self, "readAll:", 0);
    flags = (__int16)self->_flags;
    if ((flags & 0x10) != 0)
    {
      *(_DWORD *)(v5 + 68) = self->_mapsWidgetType;
      *(_WORD *)(v5 + 76) |= 0x10u;
      flags = (__int16)self->_flags;
    }
    if ((flags & 2) != 0)
    {
      *(_DWORD *)(v5 + 56) = self->_endState;
      *(_WORD *)(v5 + 76) |= 2u;
    }
    v10 = -[GEOMapsDestinationsWidget copyWithZone:](self->_mapsDestinationsWidget, "copyWithZone:", a3);
    v11 = *(void **)(v5 + 16);
    *(_QWORD *)(v5 + 16) = v10;

    v12 = -[GEOMapsTransitWidget copyWithZone:](self->_mapsTransitWidget, "copyWithZone:", a3);
    v13 = *(void **)(v5 + 32);
    *(_QWORD *)(v5 + 32) = v12;

    v14 = -[GEOMapsNearbyWidget copyWithZone:](self->_mapsNearbyWidget, "copyWithZone:", a3);
    v15 = *(void **)(v5 + 24);
    *(_QWORD *)(v5 + 24) = v14;

    v16 = (__int16)self->_flags;
    if ((v16 & 0x20) != 0)
    {
      *(_BYTE *)(v5 + 72) = self->_lockedMode;
      *(_WORD *)(v5 + 76) |= 0x20u;
      v16 = (__int16)self->_flags;
      if ((v16 & 8) == 0)
      {
LABEL_11:
        if ((v16 & 4) == 0)
          goto LABEL_12;
        goto LABEL_17;
      }
    }
    else if ((v16 & 8) == 0)
    {
      goto LABEL_11;
    }
    *(_DWORD *)(v5 + 64) = self->_localHour;
    *(_WORD *)(v5 + 76) |= 8u;
    v16 = (__int16)self->_flags;
    if ((v16 & 4) == 0)
    {
LABEL_12:
      if ((v16 & 1) == 0)
        return (id)v5;
LABEL_13:
      *(_DWORD *)(v5 + 52) = self->_duration;
      *(_WORD *)(v5 + 76) |= 1u;
      return (id)v5;
    }
LABEL_17:
    *(_DWORD *)(v5 + 60) = self->_localDayOfWeek;
    *(_WORD *)(v5 + 76) |= 4u;
    if ((*(_WORD *)&self->_flags & 1) == 0)
      return (id)v5;
    goto LABEL_13;
  }
  v7 = reader;
  objc_sync_enter(v7);
  if ((*(_WORD *)&self->_flags & 0x200) != 0)
  {
    objc_sync_exit(v7);

    goto LABEL_5;
  }
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  GEOLogMsgEventMapsWidgetsInteractionSessionReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  v8 = (id)v5;
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  __int16 flags;
  __int16 v6;
  GEOMapsDestinationsWidget *mapsDestinationsWidget;
  GEOMapsTransitWidget *mapsTransitWidget;
  GEOMapsNearbyWidget *mapsNearbyWidget;
  __int16 v10;
  __int16 v11;
  BOOL v12;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_40;
  -[GEOLogMsgEventMapsWidgetsInteractionSession readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  flags = (__int16)self->_flags;
  v6 = *((_WORD *)v4 + 38);
  if ((flags & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_mapsWidgetType != *((_DWORD *)v4 + 17))
      goto LABEL_40;
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_40;
  }
  if ((flags & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_endState != *((_DWORD *)v4 + 14))
      goto LABEL_40;
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_40;
  }
  mapsDestinationsWidget = self->_mapsDestinationsWidget;
  if ((unint64_t)mapsDestinationsWidget | *((_QWORD *)v4 + 2)
    && !-[GEOMapsDestinationsWidget isEqual:](mapsDestinationsWidget, "isEqual:"))
  {
    goto LABEL_40;
  }
  mapsTransitWidget = self->_mapsTransitWidget;
  if ((unint64_t)mapsTransitWidget | *((_QWORD *)v4 + 4))
  {
    if (!-[GEOMapsTransitWidget isEqual:](mapsTransitWidget, "isEqual:"))
      goto LABEL_40;
  }
  mapsNearbyWidget = self->_mapsNearbyWidget;
  if ((unint64_t)mapsNearbyWidget | *((_QWORD *)v4 + 3))
  {
    if (!-[GEOMapsNearbyWidget isEqual:](mapsNearbyWidget, "isEqual:"))
      goto LABEL_40;
  }
  v10 = (__int16)self->_flags;
  v11 = *((_WORD *)v4 + 38);
  if ((v10 & 0x20) != 0)
  {
    if ((v11 & 0x20) != 0)
    {
      if (self->_lockedMode)
      {
        if (!*((_BYTE *)v4 + 72))
          goto LABEL_40;
        goto LABEL_26;
      }
      if (!*((_BYTE *)v4 + 72))
        goto LABEL_26;
    }
LABEL_40:
    v12 = 0;
    goto LABEL_41;
  }
  if ((v11 & 0x20) != 0)
    goto LABEL_40;
LABEL_26:
  if ((v10 & 8) != 0)
  {
    if ((v11 & 8) == 0 || self->_localHour != *((_DWORD *)v4 + 16))
      goto LABEL_40;
  }
  else if ((v11 & 8) != 0)
  {
    goto LABEL_40;
  }
  if ((v10 & 4) != 0)
  {
    if ((v11 & 4) == 0 || self->_localDayOfWeek != *((_DWORD *)v4 + 15))
      goto LABEL_40;
  }
  else if ((v11 & 4) != 0)
  {
    goto LABEL_40;
  }
  v12 = (v11 & 1) == 0;
  if ((v10 & 1) != 0)
  {
    if ((v11 & 1) == 0 || self->_duration != *((_DWORD *)v4 + 13))
      goto LABEL_40;
    v12 = 1;
  }
LABEL_41:

  return v12;
}

- (unint64_t)hash
{
  __int16 flags;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  -[GEOLogMsgEventMapsWidgetsInteractionSession readAll:](self, "readAll:", 1);
  flags = (__int16)self->_flags;
  if ((flags & 0x10) != 0)
  {
    v4 = 2654435761 * self->_mapsWidgetType;
    if ((flags & 2) != 0)
      goto LABEL_3;
  }
  else
  {
    v4 = 0;
    if ((flags & 2) != 0)
    {
LABEL_3:
      v5 = 2654435761 * self->_endState;
      goto LABEL_6;
    }
  }
  v5 = 0;
LABEL_6:
  v6 = -[GEOMapsDestinationsWidget hash](self->_mapsDestinationsWidget, "hash");
  v7 = -[GEOMapsTransitWidget hash](self->_mapsTransitWidget, "hash");
  v8 = -[GEOMapsNearbyWidget hash](self->_mapsNearbyWidget, "hash");
  v9 = (__int16)self->_flags;
  if ((v9 & 0x20) != 0)
  {
    v10 = 2654435761 * self->_lockedMode;
    if ((v9 & 8) != 0)
    {
LABEL_8:
      v11 = 2654435761 * self->_localHour;
      if ((v9 & 4) != 0)
        goto LABEL_9;
LABEL_13:
      v12 = 0;
      if ((v9 & 1) != 0)
        goto LABEL_10;
LABEL_14:
      v13 = 0;
      return v5 ^ v4 ^ v6 ^ v7 ^ v8 ^ v10 ^ v11 ^ v12 ^ v13;
    }
  }
  else
  {
    v10 = 0;
    if ((v9 & 8) != 0)
      goto LABEL_8;
  }
  v11 = 0;
  if ((v9 & 4) == 0)
    goto LABEL_13;
LABEL_9:
  v12 = 2654435761 * self->_localDayOfWeek;
  if ((v9 & 1) == 0)
    goto LABEL_14;
LABEL_10:
  v13 = 2654435761 * self->_duration;
  return v5 ^ v4 ^ v6 ^ v7 ^ v8 ^ v10 ^ v11 ^ v12 ^ v13;
}

- (void)mergeFrom:(id)a3
{
  int *v4;
  __int16 v5;
  GEOMapsDestinationsWidget *mapsDestinationsWidget;
  uint64_t v7;
  GEOMapsTransitWidget *mapsTransitWidget;
  uint64_t v9;
  GEOMapsNearbyWidget *mapsNearbyWidget;
  uint64_t v11;
  __int16 v12;
  int *v13;

  v13 = (int *)a3;
  objc_msgSend(v13, "readAll:", 0);
  v4 = v13;
  v5 = *((_WORD *)v13 + 38);
  if ((v5 & 0x10) != 0)
  {
    self->_mapsWidgetType = v13[17];
    *(_WORD *)&self->_flags |= 0x10u;
    v5 = *((_WORD *)v13 + 38);
  }
  if ((v5 & 2) != 0)
  {
    self->_endState = v13[14];
    *(_WORD *)&self->_flags |= 2u;
  }
  mapsDestinationsWidget = self->_mapsDestinationsWidget;
  v7 = *((_QWORD *)v13 + 2);
  if (mapsDestinationsWidget)
  {
    if (!v7)
      goto LABEL_11;
    -[GEOMapsDestinationsWidget mergeFrom:](mapsDestinationsWidget, "mergeFrom:");
  }
  else
  {
    if (!v7)
      goto LABEL_11;
    -[GEOLogMsgEventMapsWidgetsInteractionSession setMapsDestinationsWidget:](self, "setMapsDestinationsWidget:");
  }
  v4 = v13;
LABEL_11:
  mapsTransitWidget = self->_mapsTransitWidget;
  v9 = *((_QWORD *)v4 + 4);
  if (mapsTransitWidget)
  {
    if (!v9)
      goto LABEL_17;
    -[GEOMapsTransitWidget mergeFrom:](mapsTransitWidget, "mergeFrom:");
  }
  else
  {
    if (!v9)
      goto LABEL_17;
    -[GEOLogMsgEventMapsWidgetsInteractionSession setMapsTransitWidget:](self, "setMapsTransitWidget:");
  }
  v4 = v13;
LABEL_17:
  mapsNearbyWidget = self->_mapsNearbyWidget;
  v11 = *((_QWORD *)v4 + 3);
  if (mapsNearbyWidget)
  {
    if (!v11)
      goto LABEL_23;
    -[GEOMapsNearbyWidget mergeFrom:](mapsNearbyWidget, "mergeFrom:");
  }
  else
  {
    if (!v11)
      goto LABEL_23;
    -[GEOLogMsgEventMapsWidgetsInteractionSession setMapsNearbyWidget:](self, "setMapsNearbyWidget:");
  }
  v4 = v13;
LABEL_23:
  v12 = *((_WORD *)v4 + 38);
  if ((v12 & 0x20) != 0)
  {
    self->_lockedMode = *((_BYTE *)v4 + 72);
    *(_WORD *)&self->_flags |= 0x20u;
    v12 = *((_WORD *)v4 + 38);
    if ((v12 & 8) == 0)
    {
LABEL_25:
      if ((v12 & 4) == 0)
        goto LABEL_26;
LABEL_31:
      self->_localDayOfWeek = v4[15];
      *(_WORD *)&self->_flags |= 4u;
      if ((v4[19] & 1) == 0)
        goto LABEL_28;
      goto LABEL_27;
    }
  }
  else if ((v12 & 8) == 0)
  {
    goto LABEL_25;
  }
  self->_localHour = v4[16];
  *(_WORD *)&self->_flags |= 8u;
  v12 = *((_WORD *)v4 + 38);
  if ((v12 & 4) != 0)
    goto LABEL_31;
LABEL_26:
  if ((v12 & 1) != 0)
  {
LABEL_27:
    self->_duration = v4[13];
    *(_WORD *)&self->_flags |= 1u;
  }
LABEL_28:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapsTransitWidget, 0);
  objc_storeStrong((id *)&self->_mapsNearbyWidget, 0);
  objc_storeStrong((id *)&self->_mapsDestinationsWidget, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
