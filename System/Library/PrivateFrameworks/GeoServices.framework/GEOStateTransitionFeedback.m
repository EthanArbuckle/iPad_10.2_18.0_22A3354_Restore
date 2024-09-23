@implementation GEOStateTransitionFeedback

- (int)stateType
{
  if ((*(_BYTE *)&self->_flags & 4) != 0)
    return self->_stateType;
  else
    return 1;
}

- (void)setStateType:(int)a3
{
  *(_BYTE *)&self->_flags |= 4u;
  self->_stateType = a3;
}

- (void)setHasStateType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasStateType
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (id)stateTypeAsString:(int)a3
{
  if ((a3 - 1) < 0xC)
    return off_1E1C0CB58[a3 - 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsStateType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAP_DISPLAY_TYPE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PITCHED")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FLYOVER")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRAFFIC")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("APP_FOCUS")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NAVIGATION_GUIDANCE")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NAVIGATION_OVERVIEW")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRACKING")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CARPLAY_TRACKING")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CARPLAY_PITCHED")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CARPLAY_CONNECTED_STATE")) & 1) != 0)
  {
    v4 = 11;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("MAP_APP_STATE")))
  {
    v4 = 12;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (int)oldValue
{
  if ((*(_BYTE *)&self->_flags & 2) != 0)
    return self->_oldValue;
  else
    return 1;
}

- (void)setOldValue:(int)a3
{
  *(_BYTE *)&self->_flags |= 2u;
  self->_oldValue = a3;
}

- (void)setHasOldValue:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasOldValue
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (id)oldValueAsString:(int)a3
{
  if ((a3 - 1) < 0x13)
    return off_1E1C0CBB8[a3 - 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsOldValue:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAP_TYPE_STANDARD")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAP_TYPE_SATELLITE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAP_TYPE_HYBRID")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAP_TYPE_SATELLITE_GLOBE")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAP_TYPE_HYBRID_GLOBE")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAP_TYPE_NAVIGATION")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAP_TYPE_TRANSIT")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEATURE_ACTIVE")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEATURE_INACTIVE")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEATURE_UNAVAILABLE")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("APP_FOREGROUND")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("APP_BACKGROUND")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRACKING_OFF")) & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRACKING_ON")) & 1) != 0)
  {
    v4 = 14;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRACKING_ON_WITH_HEADING")) & 1) != 0)
  {
    v4 = 15;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("APP_STATE_MAP_BROWSING")) & 1) != 0)
  {
    v4 = 16;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("APP_STATE_NAVIGATION")) & 1) != 0)
  {
    v4 = 17;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("APP_STATE_ROUTE_PREVIEW")) & 1) != 0)
  {
    v4 = 18;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("APP_STATE_ROUTE_GENIUS")))
  {
    v4 = 19;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (int)newValue
{
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    return self->_newValue;
  else
    return 1;
}

- (void)setNewValue:(int)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_newValue = a3;
}

- (void)setHasNewValue:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasNewValue
{
  return *(_BYTE *)&self->_flags & 1;
}

- (id)newValueAsString:(int)a3
{
  if ((a3 - 1) < 0x13)
    return off_1E1C0CBB8[a3 - 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsNewValue:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAP_TYPE_STANDARD")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAP_TYPE_SATELLITE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAP_TYPE_HYBRID")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAP_TYPE_SATELLITE_GLOBE")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAP_TYPE_HYBRID_GLOBE")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAP_TYPE_NAVIGATION")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAP_TYPE_TRANSIT")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEATURE_ACTIVE")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEATURE_INACTIVE")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEATURE_UNAVAILABLE")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("APP_FOREGROUND")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("APP_BACKGROUND")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRACKING_OFF")) & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRACKING_ON")) & 1) != 0)
  {
    v4 = 14;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRACKING_ON_WITH_HEADING")) & 1) != 0)
  {
    v4 = 15;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("APP_STATE_MAP_BROWSING")) & 1) != 0)
  {
    v4 = 16;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("APP_STATE_NAVIGATION")) & 1) != 0)
  {
    v4 = 17;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("APP_STATE_ROUTE_PREVIEW")) & 1) != 0)
  {
    v4 = 18;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("APP_STATE_ROUTE_GENIUS")))
  {
    v4 = 19;
  }
  else
  {
    v4 = 1;
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
  v8.super_class = (Class)GEOStateTransitionFeedback;
  -[GEOStateTransitionFeedback description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOStateTransitionFeedback dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOStateTransitionFeedback _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  char v5;
  unsigned int v6;
  __CFString *v7;
  const __CFString *v8;
  unsigned int v9;
  __CFString *v10;
  const __CFString *v11;
  unsigned int v12;
  __CFString *v13;
  const __CFString *v14;

  if (!a1)
  {
    v4 = 0;
    return v4;
  }
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_BYTE *)(a1 + 20);
  if ((v5 & 4) != 0)
  {
    v6 = *(_DWORD *)(a1 + 16) - 1;
    if (v6 >= 0xC)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 16));
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_1E1C0CB58[v6];
    }
    if (a2)
      v8 = CFSTR("stateType");
    else
      v8 = CFSTR("state_type");
    objc_msgSend(v4, "setObject:forKey:", v7, v8);

    v5 = *(_BYTE *)(a1 + 20);
    if ((v5 & 2) == 0)
    {
LABEL_4:
      if ((v5 & 1) == 0)
        return v4;
      goto LABEL_20;
    }
  }
  else if ((*(_BYTE *)(a1 + 20) & 2) == 0)
  {
    goto LABEL_4;
  }
  v9 = *(_DWORD *)(a1 + 12) - 1;
  if (v9 >= 0x13)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 12));
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = off_1E1C0CBB8[v9];
  }
  if (a2)
    v11 = CFSTR("oldValue");
  else
    v11 = CFSTR("old_value");
  objc_msgSend(v4, "setObject:forKey:", v10, v11);

  if ((*(_BYTE *)(a1 + 20) & 1) != 0)
  {
LABEL_20:
    v12 = *(_DWORD *)(a1 + 8) - 1;
    if (v12 >= 0x13)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 8));
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = off_1E1C0CBB8[v12];
    }
    if (a2)
      v14 = CFSTR("newValue");
    else
      v14 = CFSTR("new_value");
    objc_msgSend(v4, "setObject:forKey:", v13, v14);

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOStateTransitionFeedback _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOStateTransitionFeedback)initWithDictionary:(id)a3
{
  return (GEOStateTransitionFeedback *)-[GEOStateTransitionFeedback _initWithDictionary:isJSON:](self, a3, 0);
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
  id v16;
  uint64_t v17;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("stateType");
      else
        v6 = CFSTR("state_type");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = v7;
        if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MAP_DISPLAY_TYPE")) & 1) != 0)
        {
          v9 = 1;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("PITCHED")) & 1) != 0)
        {
          v9 = 2;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("FLYOVER")) & 1) != 0)
        {
          v9 = 3;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("TRAFFIC")) & 1) != 0)
        {
          v9 = 4;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("APP_FOCUS")) & 1) != 0)
        {
          v9 = 5;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("NAVIGATION_GUIDANCE")) & 1) != 0)
        {
          v9 = 6;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("NAVIGATION_OVERVIEW")) & 1) != 0)
        {
          v9 = 7;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("TRACKING")) & 1) != 0)
        {
          v9 = 8;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("CARPLAY_TRACKING")) & 1) != 0)
        {
          v9 = 9;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("CARPLAY_PITCHED")) & 1) != 0)
        {
          v9 = 10;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("CARPLAY_CONNECTED_STATE")) & 1) != 0)
        {
          v9 = 11;
        }
        else if (objc_msgSend(v8, "isEqualToString:", CFSTR("MAP_APP_STATE")))
        {
          v9 = 12;
        }
        else
        {
          v9 = 1;
        }

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_36;
        v9 = objc_msgSend(v7, "intValue");
      }
      objc_msgSend(a1, "setStateType:", v9);
LABEL_36:

      if (a3)
        v10 = CFSTR("oldValue");
      else
        v10 = CFSTR("old_value");
      objc_msgSend(v5, "objectForKeyedSubscript:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v12 = v11;
        if ((objc_msgSend(v12, "isEqualToString:", CFSTR("MAP_TYPE_STANDARD")) & 1) != 0)
        {
          v13 = 1;
        }
        else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("MAP_TYPE_SATELLITE")) & 1) != 0)
        {
          v13 = 2;
        }
        else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("MAP_TYPE_HYBRID")) & 1) != 0)
        {
          v13 = 3;
        }
        else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("MAP_TYPE_SATELLITE_GLOBE")) & 1) != 0)
        {
          v13 = 4;
        }
        else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("MAP_TYPE_HYBRID_GLOBE")) & 1) != 0)
        {
          v13 = 5;
        }
        else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("MAP_TYPE_NAVIGATION")) & 1) != 0)
        {
          v13 = 6;
        }
        else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("MAP_TYPE_TRANSIT")) & 1) != 0)
        {
          v13 = 7;
        }
        else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("FEATURE_ACTIVE")) & 1) != 0)
        {
          v13 = 8;
        }
        else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("FEATURE_INACTIVE")) & 1) != 0)
        {
          v13 = 9;
        }
        else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("FEATURE_UNAVAILABLE")) & 1) != 0)
        {
          v13 = 10;
        }
        else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("APP_FOREGROUND")) & 1) != 0)
        {
          v13 = 11;
        }
        else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("APP_BACKGROUND")) & 1) != 0)
        {
          v13 = 12;
        }
        else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("TRACKING_OFF")) & 1) != 0)
        {
          v13 = 13;
        }
        else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("TRACKING_ON")) & 1) != 0)
        {
          v13 = 14;
        }
        else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("TRACKING_ON_WITH_HEADING")) & 1) != 0)
        {
          v13 = 15;
        }
        else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("APP_STATE_MAP_BROWSING")) & 1) != 0)
        {
          v13 = 16;
        }
        else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("APP_STATE_NAVIGATION")) & 1) != 0)
        {
          v13 = 17;
        }
        else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("APP_STATE_ROUTE_PREVIEW")) & 1) != 0)
        {
          v13 = 18;
        }
        else if (objc_msgSend(v12, "isEqualToString:", CFSTR("APP_STATE_ROUTE_GENIUS")))
        {
          v13 = 19;
        }
        else
        {
          v13 = 1;
        }

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_83;
        v13 = objc_msgSend(v11, "intValue");
      }
      objc_msgSend(a1, "setOldValue:", v13);
LABEL_83:

      if (a3)
        v14 = CFSTR("newValue");
      else
        v14 = CFSTR("new_value");
      objc_msgSend(v5, "objectForKeyedSubscript:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v16 = v15;
        if ((objc_msgSend(v16, "isEqualToString:", CFSTR("MAP_TYPE_STANDARD")) & 1) != 0)
        {
          v17 = 1;
        }
        else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("MAP_TYPE_SATELLITE")) & 1) != 0)
        {
          v17 = 2;
        }
        else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("MAP_TYPE_HYBRID")) & 1) != 0)
        {
          v17 = 3;
        }
        else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("MAP_TYPE_SATELLITE_GLOBE")) & 1) != 0)
        {
          v17 = 4;
        }
        else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("MAP_TYPE_HYBRID_GLOBE")) & 1) != 0)
        {
          v17 = 5;
        }
        else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("MAP_TYPE_NAVIGATION")) & 1) != 0)
        {
          v17 = 6;
        }
        else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("MAP_TYPE_TRANSIT")) & 1) != 0)
        {
          v17 = 7;
        }
        else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("FEATURE_ACTIVE")) & 1) != 0)
        {
          v17 = 8;
        }
        else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("FEATURE_INACTIVE")) & 1) != 0)
        {
          v17 = 9;
        }
        else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("FEATURE_UNAVAILABLE")) & 1) != 0)
        {
          v17 = 10;
        }
        else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("APP_FOREGROUND")) & 1) != 0)
        {
          v17 = 11;
        }
        else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("APP_BACKGROUND")) & 1) != 0)
        {
          v17 = 12;
        }
        else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("TRACKING_OFF")) & 1) != 0)
        {
          v17 = 13;
        }
        else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("TRACKING_ON")) & 1) != 0)
        {
          v17 = 14;
        }
        else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("TRACKING_ON_WITH_HEADING")) & 1) != 0)
        {
          v17 = 15;
        }
        else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("APP_STATE_MAP_BROWSING")) & 1) != 0)
        {
          v17 = 16;
        }
        else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("APP_STATE_NAVIGATION")) & 1) != 0)
        {
          v17 = 17;
        }
        else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("APP_STATE_ROUTE_PREVIEW")) & 1) != 0)
        {
          v17 = 18;
        }
        else if (objc_msgSend(v16, "isEqualToString:", CFSTR("APP_STATE_ROUTE_GENIUS")))
        {
          v17 = 19;
        }
        else
        {
          v17 = 1;
        }

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_130:

          goto LABEL_131;
        }
        v17 = objc_msgSend(v15, "intValue");
      }
      objc_msgSend(a1, "setNewValue:", v17);
      goto LABEL_130;
    }
  }
LABEL_131:

  return a1;
}

- (GEOStateTransitionFeedback)initWithJSON:(id)a3
{
  return (GEOStateTransitionFeedback *)-[GEOStateTransitionFeedback _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOStateTransitionFeedbackIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOStateTransitionFeedbackReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char flags;
  id v6;

  v4 = a3;
  flags = (char)self->_flags;
  v6 = v4;
  if ((flags & 4) == 0)
  {
    if ((*(_BYTE *)&self->_flags & 2) == 0)
      goto LABEL_3;
LABEL_7:
    PBDataWriterWriteInt32Field();
    v4 = v6;
    if ((*(_BYTE *)&self->_flags & 1) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  PBDataWriterWriteInt32Field();
  v4 = v6;
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
    goto LABEL_7;
LABEL_3:
  if ((flags & 1) != 0)
  {
LABEL_4:
    PBDataWriterWriteInt32Field();
    v4 = v6;
  }
LABEL_5:

}

- (void)copyTo:(id)a3
{
  char flags;
  _DWORD *v5;

  v5 = a3;
  -[GEOStateTransitionFeedback readAll:](self, "readAll:", 0);
  flags = (char)self->_flags;
  if ((flags & 4) == 0)
  {
    if ((*(_BYTE *)&self->_flags & 2) == 0)
      goto LABEL_3;
LABEL_7:
    v5[3] = self->_oldValue;
    *((_BYTE *)v5 + 20) |= 2u;
    if ((*(_BYTE *)&self->_flags & 1) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  v5[4] = self->_stateType;
  *((_BYTE *)v5 + 20) |= 4u;
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
    goto LABEL_7;
LABEL_3:
  if ((flags & 1) != 0)
  {
LABEL_4:
    v5[2] = self->_newValue;
    *((_BYTE *)v5 + 20) |= 1u;
  }
LABEL_5:

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char flags;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    *((_DWORD *)result + 4) = self->_stateType;
    *((_BYTE *)result + 20) |= 4u;
    flags = (char)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_3:
      if ((flags & 1) == 0)
        return result;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 3) = self->_oldValue;
  *((_BYTE *)result + 20) |= 2u;
  if ((*(_BYTE *)&self->_flags & 1) == 0)
    return result;
LABEL_4:
  *((_DWORD *)result + 2) = self->_newValue;
  *((_BYTE *)result + 20) |= 1u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_16;
  -[GEOStateTransitionFeedback readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 4) == 0 || self->_stateType != *((_DWORD *)v4 + 4))
      goto LABEL_16;
  }
  else if ((*((_BYTE *)v4 + 20) & 4) != 0)
  {
LABEL_16:
    v5 = 0;
    goto LABEL_17;
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 2) == 0 || self->_oldValue != *((_DWORD *)v4 + 3))
      goto LABEL_16;
  }
  else if ((*((_BYTE *)v4 + 20) & 2) != 0)
  {
    goto LABEL_16;
  }
  v5 = (*((_BYTE *)v4 + 20) & 1) == 0;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 1) == 0 || self->_newValue != *((_DWORD *)v4 + 2))
      goto LABEL_16;
    v5 = 1;
  }
LABEL_17:

  return v5;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  -[GEOStateTransitionFeedback readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 4) == 0)
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_flags & 2) != 0)
      goto LABEL_3;
LABEL_6:
    v4 = 0;
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      goto LABEL_4;
LABEL_7:
    v5 = 0;
    return v4 ^ v3 ^ v5;
  }
  v3 = 2654435761 * self->_stateType;
  if ((*(_BYTE *)&self->_flags & 2) == 0)
    goto LABEL_6;
LABEL_3:
  v4 = 2654435761 * self->_oldValue;
  if ((*(_BYTE *)&self->_flags & 1) == 0)
    goto LABEL_7;
LABEL_4:
  v5 = 2654435761 * self->_newValue;
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  char v4;
  int *v5;

  v5 = (int *)a3;
  objc_msgSend(v5, "readAll:", 0);
  v4 = *((_BYTE *)v5 + 20);
  if ((v4 & 4) == 0)
  {
    if ((v5[5] & 2) == 0)
      goto LABEL_3;
LABEL_7:
    self->_oldValue = v5[3];
    *(_BYTE *)&self->_flags |= 2u;
    if ((v5[5] & 1) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  self->_stateType = v5[4];
  *(_BYTE *)&self->_flags |= 4u;
  v4 = *((_BYTE *)v5 + 20);
  if ((v4 & 2) != 0)
    goto LABEL_7;
LABEL_3:
  if ((v4 & 1) != 0)
  {
LABEL_4:
    self->_newValue = v5[2];
    *(_BYTE *)&self->_flags |= 1u;
  }
LABEL_5:

}

@end
