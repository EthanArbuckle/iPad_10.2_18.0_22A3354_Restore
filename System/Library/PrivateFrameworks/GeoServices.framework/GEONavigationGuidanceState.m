@implementation GEONavigationGuidanceState

- (int)trackedTransportType
{
  if ((*(_BYTE *)&self->_flags & 0x10) != 0)
    return self->_trackedTransportType;
  else
    return 4;
}

- (void)setTrackedTransportType:(int)a3
{
  *(_BYTE *)&self->_flags |= 0x10u;
  self->_trackedTransportType = a3;
}

- (void)setHasTrackedTransportType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xEF | v3;
}

- (BOOL)hasTrackedTransportType
{
  return (*(_BYTE *)&self->_flags >> 4) & 1;
}

- (id)trackedTransportTypeAsString:(int)a3
{
  if (a3 < 7)
    return off_1E1C09228[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsTrackedTransportType:(id)a3
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

- (int)navigationState
{
  if ((*(_BYTE *)&self->_flags & 4) != 0)
    return self->_navigationState;
  else
    return 0;
}

- (void)setNavigationState:(int)a3
{
  *(_BYTE *)&self->_flags |= 4u;
  self->_navigationState = a3;
}

- (void)setHasNavigationState:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasNavigationState
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (id)navigationStateAsString:(int)a3
{
  if (a3 < 9)
    return off_1E1C091A8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsNavigationState:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NOT_NAVIGATING")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PROCEEDING_TO_ROUTE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ON_ROUTE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("OFF_ROUTE_OFF_ROAD")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("OFF_ROUTE_ON_ROAD")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RECALCULATING")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("END_OF_ROUTE")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("END_OF_SEGMENT")) & 1) != 0)
  {
    v4 = 7;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("OUTSIDE_NAVIGABLE_AREA")))
  {
    v4 = 8;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)guidanceLevel
{
  if ((*(_BYTE *)&self->_flags & 2) != 0)
    return self->_guidanceLevel;
  else
    return 0;
}

- (void)setGuidanceLevel:(int)a3
{
  *(_BYTE *)&self->_flags |= 2u;
  self->_guidanceLevel = a3;
}

- (void)setHasGuidanceLevel:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasGuidanceLevel
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (id)guidanceLevelAsString:(int)a3
{
  if (a3 < 4)
    return off_1E1C091F0[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsGuidanceLevel:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NONE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PREPARE_TO_TRAVEL")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRACKING")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("TURN_BY_TURN")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)shouldSuppressCellularDataAlerts
{
  return self->_shouldSuppressCellularDataAlerts;
}

- (void)setShouldSuppressCellularDataAlerts:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 0x20u;
  self->_shouldSuppressCellularDataAlerts = a3;
}

- (void)setHasShouldSuppressCellularDataAlerts:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xDF | v3;
}

- (BOOL)hasShouldSuppressCellularDataAlerts
{
  return (*(_BYTE *)&self->_flags >> 5) & 1;
}

- (int)guidanceLevelIgnoringTimeCriterion
{
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    return self->_guidanceLevelIgnoringTimeCriterion;
  else
    return 0;
}

- (void)setGuidanceLevelIgnoringTimeCriterion:(int)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_guidanceLevelIgnoringTimeCriterion = a3;
}

- (void)setHasGuidanceLevelIgnoringTimeCriterion:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasGuidanceLevelIgnoringTimeCriterion
{
  return *(_BYTE *)&self->_flags & 1;
}

- (id)guidanceLevelIgnoringTimeCriterionAsString:(int)a3
{
  if (a3 < 4)
    return off_1E1C091F0[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsGuidanceLevelIgnoringTimeCriterion:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NONE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PREPARE_TO_TRAVEL")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRACKING")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("TURN_BY_TURN")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)navigationType
{
  if ((*(_BYTE *)&self->_flags & 8) != 0)
    return self->_navigationType;
  else
    return 0;
}

- (void)setNavigationType:(int)a3
{
  *(_BYTE *)&self->_flags |= 8u;
  self->_navigationType = a3;
}

- (void)setHasNavigationType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xF7 | v3;
}

- (BOOL)hasNavigationType
{
  return (*(_BYTE *)&self->_flags >> 3) & 1;
}

- (id)navigationTypeAsString:(int)a3
{
  if (a3 < 3)
    return off_1E1C09210[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsNavigationType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NONE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TURN_BY_TURN")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("STEPPING")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
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
  v8.super_class = (Class)GEONavigationGuidanceState;
  -[GEONavigationGuidanceState description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEONavigationGuidanceState dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v2;
  char v3;
  uint64_t v4;
  __CFString *v5;
  uint64_t v6;
  __CFString *v7;
  uint64_t v8;
  __CFString *v9;
  void *v10;
  uint64_t v11;
  __CFString *v12;
  uint64_t v13;
  __CFString *v14;

  if (!a1)
  {
    v2 = 0;
    return v2;
  }
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_BYTE *)(a1 + 32);
  if ((v3 & 0x10) != 0)
  {
    v4 = *(int *)(a1 + 24);
    if (v4 >= 7)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 24));
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_1E1C09228[v4];
    }
    objc_msgSend(v2, "setObject:forKey:", v5, CFSTR("trackedTransportType"));

    v3 = *(_BYTE *)(a1 + 32);
    if ((v3 & 4) == 0)
    {
LABEL_4:
      if ((v3 & 2) == 0)
        goto LABEL_5;
      goto LABEL_17;
    }
  }
  else if ((*(_BYTE *)(a1 + 32) & 4) == 0)
  {
    goto LABEL_4;
  }
  v6 = *(int *)(a1 + 16);
  if (v6 >= 9)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 16));
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = off_1E1C091A8[v6];
  }
  objc_msgSend(v2, "setObject:forKey:", v7, CFSTR("navigationState"));

  v3 = *(_BYTE *)(a1 + 32);
  if ((v3 & 2) == 0)
  {
LABEL_5:
    if ((v3 & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_21;
  }
LABEL_17:
  v8 = *(int *)(a1 + 12);
  if (v8 >= 4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 12));
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = off_1E1C091F0[v8];
  }
  objc_msgSend(v2, "setObject:forKey:", v9, CFSTR("guidanceLevel"));

  v3 = *(_BYTE *)(a1 + 32);
  if ((v3 & 0x20) == 0)
  {
LABEL_6:
    if ((v3 & 1) == 0)
      goto LABEL_7;
    goto LABEL_22;
  }
LABEL_21:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 28));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v10, CFSTR("shouldSuppressCellularDataAlerts"));

  v3 = *(_BYTE *)(a1 + 32);
  if ((v3 & 1) == 0)
  {
LABEL_7:
    if ((v3 & 8) == 0)
      return v2;
    goto LABEL_26;
  }
LABEL_22:
  v11 = *(int *)(a1 + 8);
  if (v11 >= 4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 8));
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = off_1E1C091F0[v11];
  }
  objc_msgSend(v2, "setObject:forKey:", v12, CFSTR("guidanceLevelIgnoringTimeCriterion"));

  if ((*(_BYTE *)(a1 + 32) & 8) != 0)
  {
LABEL_26:
    v13 = *(int *)(a1 + 20);
    if (v13 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 20));
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = off_1E1C09210[v13];
    }
    objc_msgSend(v2, "setObject:forKey:", v14, CFSTR("navigationType"));

  }
  return v2;
}

- (GEONavigationGuidanceState)initWithDictionary:(id)a3
{
  return (GEONavigationGuidanceState *)-[GEONavigationGuidanceState _initWithDictionary:isJSON:](self, a3);
}

- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  id v18;
  uint64_t v19;

  v3 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("trackedTransportType"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v5 = v4;
        if ((objc_msgSend(v5, "isEqualToString:", CFSTR("AUTOMOBILE")) & 1) != 0)
        {
          v6 = 0;
        }
        else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("TRANSIT")) & 1) != 0)
        {
          v6 = 1;
        }
        else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("WALKING")) & 1) != 0)
        {
          v6 = 2;
        }
        else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("BICYCLE")) & 1) != 0)
        {
          v6 = 3;
        }
        else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("UNKNOWN_TRANSPORT_TYPE")) & 1) != 0)
        {
          v6 = 4;
        }
        else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("FERRY")) & 1) != 0)
        {
          v6 = 5;
        }
        else if (objc_msgSend(v5, "isEqualToString:", CFSTR("RIDESHARE")))
        {
          v6 = 6;
        }
        else
        {
          v6 = 0;
        }

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_23;
        v6 = objc_msgSend(v4, "intValue");
      }
      objc_msgSend(a1, "setTrackedTransportType:", v6);
LABEL_23:

      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("navigationState"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = v7;
        if ((objc_msgSend(v8, "isEqualToString:", CFSTR("NOT_NAVIGATING")) & 1) != 0)
        {
          v9 = 0;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("PROCEEDING_TO_ROUTE")) & 1) != 0)
        {
          v9 = 1;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("ON_ROUTE")) & 1) != 0)
        {
          v9 = 2;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("OFF_ROUTE_OFF_ROAD")) & 1) != 0)
        {
          v9 = 3;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("OFF_ROUTE_ON_ROAD")) & 1) != 0)
        {
          v9 = 4;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("RECALCULATING")) & 1) != 0)
        {
          v9 = 5;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("END_OF_ROUTE")) & 1) != 0)
        {
          v9 = 6;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("END_OF_SEGMENT")) & 1) != 0)
        {
          v9 = 7;
        }
        else if (objc_msgSend(v8, "isEqualToString:", CFSTR("OUTSIDE_NAVIGABLE_AREA")))
        {
          v9 = 8;
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
          goto LABEL_47;
        v9 = objc_msgSend(v7, "intValue");
      }
      objc_msgSend(a1, "setNavigationState:", v9);
LABEL_47:

      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("guidanceLevel"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = v10;
        if ((objc_msgSend(v11, "isEqualToString:", CFSTR("NONE")) & 1) != 0)
        {
          v12 = 0;
        }
        else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("PREPARE_TO_TRAVEL")) & 1) != 0)
        {
          v12 = 1;
        }
        else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("TRACKING")) & 1) != 0)
        {
          v12 = 2;
        }
        else if (objc_msgSend(v11, "isEqualToString:", CFSTR("TURN_BY_TURN")))
        {
          v12 = 3;
        }
        else
        {
          v12 = 0;
        }

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_61;
        v12 = objc_msgSend(v10, "intValue");
      }
      objc_msgSend(a1, "setGuidanceLevel:", v12);
LABEL_61:

      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("shouldSuppressCellularDataAlerts"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setShouldSuppressCellularDataAlerts:", objc_msgSend(v13, "BOOLValue"));

      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("guidanceLevelIgnoringTimeCriterion"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v15 = v14;
        if ((objc_msgSend(v15, "isEqualToString:", CFSTR("NONE")) & 1) != 0)
        {
          v16 = 0;
        }
        else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("PREPARE_TO_TRAVEL")) & 1) != 0)
        {
          v16 = 1;
        }
        else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("TRACKING")) & 1) != 0)
        {
          v16 = 2;
        }
        else if (objc_msgSend(v15, "isEqualToString:", CFSTR("TURN_BY_TURN")))
        {
          v16 = 3;
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
          goto LABEL_77;
        v16 = objc_msgSend(v14, "intValue");
      }
      objc_msgSend(a1, "setGuidanceLevelIgnoringTimeCriterion:", v16);
LABEL_77:

      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("navigationType"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v18 = v17;
        if ((objc_msgSend(v18, "isEqualToString:", CFSTR("NONE")) & 1) != 0)
        {
          v19 = 0;
        }
        else if ((objc_msgSend(v18, "isEqualToString:", CFSTR("TURN_BY_TURN")) & 1) != 0)
        {
          v19 = 1;
        }
        else if (objc_msgSend(v18, "isEqualToString:", CFSTR("STEPPING")))
        {
          v19 = 2;
        }
        else
        {
          v19 = 0;
        }

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_89:

          goto LABEL_90;
        }
        v19 = objc_msgSend(v17, "intValue");
      }
      objc_msgSend(a1, "setNavigationType:", v19);
      goto LABEL_89;
    }
  }
LABEL_90:

  return a1;
}

- (GEONavigationGuidanceState)initWithJSON:(id)a3
{
  return (GEONavigationGuidanceState *)-[GEONavigationGuidanceState _initWithDictionary:isJSON:](self, a3);
}

+ (BOOL)isValid:(id)a3
{
  return GEONavigationGuidanceStateIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEONavigationGuidanceStateReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  char flags;
  id v5;

  v5 = a3;
  flags = (char)self->_flags;
  if ((flags & 0x10) != 0)
  {
    PBDataWriterWriteInt32Field();
    flags = (char)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_3:
      if ((flags & 2) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_4:
    if ((flags & 0x20) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  PBDataWriterWriteInt32Field();
  flags = (char)self->_flags;
  if ((flags & 0x20) == 0)
  {
LABEL_5:
    if ((flags & 1) == 0)
      goto LABEL_6;
LABEL_13:
    PBDataWriterWriteInt32Field();
    if ((*(_BYTE *)&self->_flags & 8) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_12:
  PBDataWriterWriteBOOLField();
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
    goto LABEL_13;
LABEL_6:
  if ((flags & 8) != 0)
LABEL_7:
    PBDataWriterWriteInt32Field();
LABEL_8:

}

- (void)copyTo:(id)a3
{
  char flags;
  _DWORD *v5;

  v5 = a3;
  -[GEONavigationGuidanceState readAll:](self, "readAll:", 0);
  flags = (char)self->_flags;
  if ((flags & 0x10) != 0)
  {
    v5[6] = self->_trackedTransportType;
    *((_BYTE *)v5 + 32) |= 0x10u;
    flags = (char)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_3:
      if ((flags & 2) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 4) == 0)
  {
    goto LABEL_3;
  }
  v5[4] = self->_navigationState;
  *((_BYTE *)v5 + 32) |= 4u;
  flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_4:
    if ((flags & 0x20) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  v5[3] = self->_guidanceLevel;
  *((_BYTE *)v5 + 32) |= 2u;
  flags = (char)self->_flags;
  if ((flags & 0x20) == 0)
  {
LABEL_5:
    if ((flags & 1) == 0)
      goto LABEL_6;
LABEL_13:
    v5[2] = self->_guidanceLevelIgnoringTimeCriterion;
    *((_BYTE *)v5 + 32) |= 1u;
    if ((*(_BYTE *)&self->_flags & 8) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_12:
  *((_BYTE *)v5 + 28) = self->_shouldSuppressCellularDataAlerts;
  *((_BYTE *)v5 + 32) |= 0x20u;
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
    goto LABEL_13;
LABEL_6:
  if ((flags & 8) != 0)
  {
LABEL_7:
    v5[5] = self->_navigationType;
    *((_BYTE *)v5 + 32) |= 8u;
  }
LABEL_8:

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char flags;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  flags = (char)self->_flags;
  if ((flags & 0x10) != 0)
  {
    *((_DWORD *)result + 6) = self->_trackedTransportType;
    *((_BYTE *)result + 32) |= 0x10u;
    flags = (char)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_3:
      if ((flags & 2) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 4) = self->_navigationState;
  *((_BYTE *)result + 32) |= 4u;
  flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_4:
    if ((flags & 0x20) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  *((_DWORD *)result + 3) = self->_guidanceLevel;
  *((_BYTE *)result + 32) |= 2u;
  flags = (char)self->_flags;
  if ((flags & 0x20) == 0)
  {
LABEL_5:
    if ((flags & 1) == 0)
      goto LABEL_6;
    goto LABEL_13;
  }
LABEL_12:
  *((_BYTE *)result + 28) = self->_shouldSuppressCellularDataAlerts;
  *((_BYTE *)result + 32) |= 0x20u;
  flags = (char)self->_flags;
  if ((flags & 1) == 0)
  {
LABEL_6:
    if ((flags & 8) == 0)
      return result;
    goto LABEL_7;
  }
LABEL_13:
  *((_DWORD *)result + 2) = self->_guidanceLevelIgnoringTimeCriterion;
  *((_BYTE *)result + 32) |= 1u;
  if ((*(_BYTE *)&self->_flags & 8) == 0)
    return result;
LABEL_7:
  *((_DWORD *)result + 5) = self->_navigationType;
  *((_BYTE *)result + 32) |= 8u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_34;
  -[GEONavigationGuidanceState readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 0x10) == 0 || self->_trackedTransportType != *((_DWORD *)v4 + 6))
      goto LABEL_34;
  }
  else if ((*((_BYTE *)v4 + 32) & 0x10) != 0)
  {
    goto LABEL_34;
  }
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 4) == 0 || self->_navigationState != *((_DWORD *)v4 + 4))
      goto LABEL_34;
  }
  else if ((*((_BYTE *)v4 + 32) & 4) != 0)
  {
    goto LABEL_34;
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 2) == 0 || self->_guidanceLevel != *((_DWORD *)v4 + 3))
      goto LABEL_34;
  }
  else if ((*((_BYTE *)v4 + 32) & 2) != 0)
  {
    goto LABEL_34;
  }
  if ((*(_BYTE *)&self->_flags & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 0x20) != 0)
    {
      if (self->_shouldSuppressCellularDataAlerts)
      {
        if (!*((_BYTE *)v4 + 28))
          goto LABEL_34;
        goto LABEL_25;
      }
      if (!*((_BYTE *)v4 + 28))
        goto LABEL_25;
    }
LABEL_34:
    v5 = 0;
    goto LABEL_35;
  }
  if ((*((_BYTE *)v4 + 32) & 0x20) != 0)
    goto LABEL_34;
LABEL_25:
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 1) == 0 || self->_guidanceLevelIgnoringTimeCriterion != *((_DWORD *)v4 + 2))
      goto LABEL_34;
  }
  else if ((*((_BYTE *)v4 + 32) & 1) != 0)
  {
    goto LABEL_34;
  }
  v5 = (*((_BYTE *)v4 + 32) & 8) == 0;
  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 8) == 0 || self->_navigationType != *((_DWORD *)v4 + 5))
      goto LABEL_34;
    v5 = 1;
  }
LABEL_35:

  return v5;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  -[GEONavigationGuidanceState readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 0x10) != 0)
  {
    v3 = 2654435761 * self->_trackedTransportType;
    if ((*(_BYTE *)&self->_flags & 4) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_navigationState;
      if ((*(_BYTE *)&self->_flags & 2) != 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_flags & 4) != 0)
      goto LABEL_3;
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
LABEL_4:
    v5 = 2654435761 * self->_guidanceLevel;
    if ((*(_BYTE *)&self->_flags & 0x20) != 0)
      goto LABEL_5;
    goto LABEL_11;
  }
LABEL_10:
  v5 = 0;
  if ((*(_BYTE *)&self->_flags & 0x20) != 0)
  {
LABEL_5:
    v6 = 2654435761 * self->_shouldSuppressCellularDataAlerts;
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      goto LABEL_6;
LABEL_12:
    v7 = 0;
    if ((*(_BYTE *)&self->_flags & 8) != 0)
      goto LABEL_7;
LABEL_13:
    v8 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
  }
LABEL_11:
  v6 = 0;
  if ((*(_BYTE *)&self->_flags & 1) == 0)
    goto LABEL_12;
LABEL_6:
  v7 = 2654435761 * self->_guidanceLevelIgnoringTimeCriterion;
  if ((*(_BYTE *)&self->_flags & 8) == 0)
    goto LABEL_13;
LABEL_7:
  v8 = 2654435761 * self->_navigationType;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (void)mergeFrom:(id)a3
{
  char v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "readAll:", 0);
  v4 = *((_BYTE *)v5 + 32);
  if ((v4 & 0x10) != 0)
  {
    self->_trackedTransportType = *((_DWORD *)v5 + 6);
    *(_BYTE *)&self->_flags |= 0x10u;
    v4 = *((_BYTE *)v5 + 32);
    if ((v4 & 4) == 0)
    {
LABEL_3:
      if ((v4 & 2) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*((_BYTE *)v5 + 32) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_navigationState = *((_DWORD *)v5 + 4);
  *(_BYTE *)&self->_flags |= 4u;
  v4 = *((_BYTE *)v5 + 32);
  if ((v4 & 2) == 0)
  {
LABEL_4:
    if ((v4 & 0x20) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  self->_guidanceLevel = *((_DWORD *)v5 + 3);
  *(_BYTE *)&self->_flags |= 2u;
  v4 = *((_BYTE *)v5 + 32);
  if ((v4 & 0x20) == 0)
  {
LABEL_5:
    if ((v4 & 1) == 0)
      goto LABEL_6;
LABEL_13:
    self->_guidanceLevelIgnoringTimeCriterion = *((_DWORD *)v5 + 2);
    *(_BYTE *)&self->_flags |= 1u;
    if ((*((_BYTE *)v5 + 32) & 8) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_12:
  self->_shouldSuppressCellularDataAlerts = *((_BYTE *)v5 + 28);
  *(_BYTE *)&self->_flags |= 0x20u;
  v4 = *((_BYTE *)v5 + 32);
  if ((v4 & 1) != 0)
    goto LABEL_13;
LABEL_6:
  if ((v4 & 8) != 0)
  {
LABEL_7:
    self->_navigationType = *((_DWORD *)v5 + 5);
    *(_BYTE *)&self->_flags |= 8u;
  }
LABEL_8:

}

- (GEONavigationGuidanceState)initWithTransportType:(int)a3
{
  uint64_t v3;
  GEONavigationGuidanceState *v4;
  GEONavigationGuidanceState *v5;
  GEONavigationGuidanceState *v6;

  v3 = *(_QWORD *)&a3;
  v4 = -[GEONavigationGuidanceState init](self, "init");
  v5 = v4;
  if (v4)
  {
    -[GEONavigationGuidanceState setTrackedTransportType:](v4, "setTrackedTransportType:", v3);
    v6 = v5;
  }

  return v5;
}

- (GEONavigationGuidanceState)initWithGuidanceLevel:(int)a3
{
  uint64_t v3;
  GEONavigationGuidanceState *v4;
  GEONavigationGuidanceState *v5;
  GEONavigationGuidanceState *v6;

  v3 = *(_QWORD *)&a3;
  v4 = -[GEONavigationGuidanceState init](self, "init");
  v5 = v4;
  if (v4)
  {
    -[GEONavigationGuidanceState setGuidanceLevel:](v4, "setGuidanceLevel:", v3);
    v6 = v5;
  }

  return v5;
}

@end
