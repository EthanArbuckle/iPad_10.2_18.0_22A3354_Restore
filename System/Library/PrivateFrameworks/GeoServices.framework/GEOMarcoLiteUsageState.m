@implementation GEOMarcoLiteUsageState

- (int)stateType
{
  if ((*(_BYTE *)&self->_flags & 4) != 0)
    return self->_stateType;
  else
    return 0;
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
  if (a3 < 0x1A)
    return off_1E1C23110[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsStateType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DISABLED_REASON_DEVICE_LOW_POWER_MODE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DISABLED_REASON_DEVICE_STATIONARY")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DISABLED_REASON_ARTRACKINGSTATE_THRESHOLD_REACHED")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DISABLED_REASON_DEVICE_BATTERY_THRESHOLD_REACHED")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DISABLED_REASON_DAILY_USAGE_LIMIT_REACHED")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DISABLED_REASON_MANUALLY_DISABLED")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AR_TRACKING_NORMAL")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AR_TRACKING_LIMITED_INITIALIZING")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AR_TRACKING_LIMITED_EXCESSIVE_MOTION")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AR_TRACKING_LIMITED_INSUFFICIENT_FEATURES")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AR_TRACKING_LIMITED_RELOCALIZING")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AR_TRACKING_NOT_AVAILABLE")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AR_SESSION_INTERRUPTED")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AR_INITIALIZING")) & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AR_INITIALIZATION_SUCCESS")) & 1) != 0)
  {
    v4 = 14;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DISABLED_END_NAV")) & 1) != 0)
  {
    v4 = 15;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DISABLED_INITIALIZATION_FAILED")) & 1) != 0)
  {
    v4 = 16;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DISABLED_REASON_NIGHT")) & 1) != 0)
  {
    v4 = 17;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DISABLED_REASON_VLF")) & 1) != 0)
  {
    v4 = 18;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DISABLED_REASON_THERMAL_PRESSURE")) & 1) != 0)
  {
    v4 = 19;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DISABLED_REASON_LOCATION_ACCURACY")) & 1) != 0)
  {
    v4 = 20;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DISABLED_REASON_FUSED_LOCATION")) & 1) != 0)
  {
    v4 = 21;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DISABLED_REASON_SESSION_TIMEOUT")) & 1) != 0)
  {
    v4 = 22;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DISABLED_REASON_HORIZONTAL_DISTANCE_TRAVELED")) & 1) != 0)
  {
    v4 = 23;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DISABLED_REASON_APP_BACKGROUND")) & 1) != 0)
  {
    v4 = 24;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("AR_TRACKING_LIMITED_LOW_LIGHT")))
  {
    v4 = 25;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (unsigned)stateValue
{
  return self->_stateValue;
}

- (void)setStateValue:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 8u;
  self->_stateValue = a3;
}

- (void)setHasStateValue:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xF7 | v3;
}

- (BOOL)hasStateValue
{
  return (*(_BYTE *)&self->_flags >> 3) & 1;
}

- (unsigned)stateTime
{
  return self->_stateTime;
}

- (void)setStateTime:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 2u;
  self->_stateTime = a3;
}

- (void)setHasStateTime:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasStateTime
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (int)stateExitReason
{
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    return self->_stateExitReason;
  else
    return 0;
}

- (void)setStateExitReason:(int)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_stateExitReason = a3;
}

- (void)setHasStateExitReason:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasStateExitReason
{
  return *(_BYTE *)&self->_flags & 1;
}

- (id)stateExitReasonAsString:(int)a3
{
  if (a3 < 0x1A)
    return off_1E1C23110[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsStateExitReason:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DISABLED_REASON_DEVICE_LOW_POWER_MODE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DISABLED_REASON_DEVICE_STATIONARY")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DISABLED_REASON_ARTRACKINGSTATE_THRESHOLD_REACHED")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DISABLED_REASON_DEVICE_BATTERY_THRESHOLD_REACHED")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DISABLED_REASON_DAILY_USAGE_LIMIT_REACHED")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DISABLED_REASON_MANUALLY_DISABLED")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AR_TRACKING_NORMAL")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AR_TRACKING_LIMITED_INITIALIZING")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AR_TRACKING_LIMITED_EXCESSIVE_MOTION")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AR_TRACKING_LIMITED_INSUFFICIENT_FEATURES")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AR_TRACKING_LIMITED_RELOCALIZING")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AR_TRACKING_NOT_AVAILABLE")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AR_SESSION_INTERRUPTED")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AR_INITIALIZING")) & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AR_INITIALIZATION_SUCCESS")) & 1) != 0)
  {
    v4 = 14;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DISABLED_END_NAV")) & 1) != 0)
  {
    v4 = 15;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DISABLED_INITIALIZATION_FAILED")) & 1) != 0)
  {
    v4 = 16;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DISABLED_REASON_NIGHT")) & 1) != 0)
  {
    v4 = 17;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DISABLED_REASON_VLF")) & 1) != 0)
  {
    v4 = 18;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DISABLED_REASON_THERMAL_PRESSURE")) & 1) != 0)
  {
    v4 = 19;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DISABLED_REASON_LOCATION_ACCURACY")) & 1) != 0)
  {
    v4 = 20;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DISABLED_REASON_FUSED_LOCATION")) & 1) != 0)
  {
    v4 = 21;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DISABLED_REASON_SESSION_TIMEOUT")) & 1) != 0)
  {
    v4 = 22;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DISABLED_REASON_HORIZONTAL_DISTANCE_TRAVELED")) & 1) != 0)
  {
    v4 = 23;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DISABLED_REASON_APP_BACKGROUND")) & 1) != 0)
  {
    v4 = 24;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("AR_TRACKING_LIMITED_LOW_LIGHT")))
  {
    v4 = 25;
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
  v8.super_class = (Class)GEOMarcoLiteUsageState;
  -[GEOMarcoLiteUsageState description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOMarcoLiteUsageState dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOMarcoLiteUsageState _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  char v5;
  uint64_t v6;
  __CFString *v7;
  const __CFString *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  const __CFString *v12;
  uint64_t v13;
  __CFString *v14;
  const __CFString *v15;

  if (!a1)
  {
    v4 = 0;
    return v4;
  }
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_BYTE *)(a1 + 24);
  if ((v5 & 4) != 0)
  {
    v6 = *(int *)(a1 + 16);
    if (v6 >= 0x1A)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 16));
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_1E1C23110[v6];
    }
    if (a2)
      v8 = CFSTR("stateType");
    else
      v8 = CFSTR("state_type");
    objc_msgSend(v4, "setObject:forKey:", v7, v8);

    v5 = *(_BYTE *)(a1 + 24);
  }
  if ((v5 & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 20));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v10 = CFSTR("stateValue");
    else
      v10 = CFSTR("state_value");
    objc_msgSend(v4, "setObject:forKey:", v9, v10);

    v5 = *(_BYTE *)(a1 + 24);
    if ((v5 & 2) == 0)
    {
LABEL_12:
      if ((v5 & 1) == 0)
        return v4;
      goto LABEL_22;
    }
  }
  else if ((v5 & 2) == 0)
  {
    goto LABEL_12;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 12));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v12 = CFSTR("stateTime");
  else
    v12 = CFSTR("state_time");
  objc_msgSend(v4, "setObject:forKey:", v11, v12);

  if ((*(_BYTE *)(a1 + 24) & 1) != 0)
  {
LABEL_22:
    v13 = *(int *)(a1 + 8);
    if (v13 >= 0x1A)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 8));
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = off_1E1C23110[v13];
    }
    if (a2)
      v15 = CFSTR("stateExitReason");
    else
      v15 = CFSTR("state_exit_reason");
    objc_msgSend(v4, "setObject:forKey:", v14, v15);

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOMarcoLiteUsageState _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOMarcoLiteUsageState)initWithDictionary:(id)a3
{
  return (GEOMarcoLiteUsageState *)-[GEOMarcoLiteUsageState _initWithDictionary:isJSON:](self, a3, 0);
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
  const __CFString *v12;
  void *v13;
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
        if ((objc_msgSend(v8, "isEqualToString:", CFSTR("DISABLED_REASON_DEVICE_LOW_POWER_MODE")) & 1) != 0)
        {
          v9 = 0;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("DISABLED_REASON_DEVICE_STATIONARY")) & 1) != 0)
        {
          v9 = 1;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("DISABLED_REASON_ARTRACKINGSTATE_THRESHOLD_REACHED")) & 1) != 0)
        {
          v9 = 2;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("DISABLED_REASON_DEVICE_BATTERY_THRESHOLD_REACHED")) & 1) != 0)
        {
          v9 = 3;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("DISABLED_REASON_DAILY_USAGE_LIMIT_REACHED")) & 1) != 0)
        {
          v9 = 4;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("DISABLED_REASON_MANUALLY_DISABLED")) & 1) != 0)
        {
          v9 = 5;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("AR_TRACKING_NORMAL")) & 1) != 0)
        {
          v9 = 6;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("AR_TRACKING_LIMITED_INITIALIZING")) & 1) != 0)
        {
          v9 = 7;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("AR_TRACKING_LIMITED_EXCESSIVE_MOTION")) & 1) != 0)
        {
          v9 = 8;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("AR_TRACKING_LIMITED_INSUFFICIENT_FEATURES")) & 1) != 0)
        {
          v9 = 9;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("AR_TRACKING_LIMITED_RELOCALIZING")) & 1) != 0)
        {
          v9 = 10;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("AR_TRACKING_NOT_AVAILABLE")) & 1) != 0)
        {
          v9 = 11;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("AR_SESSION_INTERRUPTED")) & 1) != 0)
        {
          v9 = 12;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("AR_INITIALIZING")) & 1) != 0)
        {
          v9 = 13;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("AR_INITIALIZATION_SUCCESS")) & 1) != 0)
        {
          v9 = 14;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("DISABLED_END_NAV")) & 1) != 0)
        {
          v9 = 15;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("DISABLED_INITIALIZATION_FAILED")) & 1) != 0)
        {
          v9 = 16;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("DISABLED_REASON_NIGHT")) & 1) != 0)
        {
          v9 = 17;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("DISABLED_REASON_VLF")) & 1) != 0)
        {
          v9 = 18;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("DISABLED_REASON_THERMAL_PRESSURE")) & 1) != 0)
        {
          v9 = 19;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("DISABLED_REASON_LOCATION_ACCURACY")) & 1) != 0)
        {
          v9 = 20;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("DISABLED_REASON_FUSED_LOCATION")) & 1) != 0)
        {
          v9 = 21;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("DISABLED_REASON_SESSION_TIMEOUT")) & 1) != 0)
        {
          v9 = 22;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("DISABLED_REASON_HORIZONTAL_DISTANCE_TRAVELED")) & 1) != 0)
        {
          v9 = 23;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("DISABLED_REASON_APP_BACKGROUND")) & 1) != 0)
        {
          v9 = 24;
        }
        else if (objc_msgSend(v8, "isEqualToString:", CFSTR("AR_TRACKING_LIMITED_LOW_LIGHT")))
        {
          v9 = 25;
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
          goto LABEL_64;
        v9 = objc_msgSend(v7, "intValue");
      }
      objc_msgSend(a1, "setStateType:", v9);
LABEL_64:

      if (a3)
        v10 = CFSTR("stateValue");
      else
        v10 = CFSTR("state_value");
      objc_msgSend(v5, "objectForKeyedSubscript:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setStateValue:", objc_msgSend(v11, "unsignedIntValue"));

      if (a3)
        v12 = CFSTR("stateTime");
      else
        v12 = CFSTR("state_time");
      objc_msgSend(v5, "objectForKeyedSubscript:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setStateTime:", objc_msgSend(v13, "unsignedIntValue"));

      if (a3)
        v14 = CFSTR("stateExitReason");
      else
        v14 = CFSTR("state_exit_reason");
      objc_msgSend(v5, "objectForKeyedSubscript:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v16 = v15;
        if ((objc_msgSend(v16, "isEqualToString:", CFSTR("DISABLED_REASON_DEVICE_LOW_POWER_MODE")) & 1) != 0)
        {
          v17 = 0;
        }
        else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("DISABLED_REASON_DEVICE_STATIONARY")) & 1) != 0)
        {
          v17 = 1;
        }
        else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("DISABLED_REASON_ARTRACKINGSTATE_THRESHOLD_REACHED")) & 1) != 0)
        {
          v17 = 2;
        }
        else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("DISABLED_REASON_DEVICE_BATTERY_THRESHOLD_REACHED")) & 1) != 0)
        {
          v17 = 3;
        }
        else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("DISABLED_REASON_DAILY_USAGE_LIMIT_REACHED")) & 1) != 0)
        {
          v17 = 4;
        }
        else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("DISABLED_REASON_MANUALLY_DISABLED")) & 1) != 0)
        {
          v17 = 5;
        }
        else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("AR_TRACKING_NORMAL")) & 1) != 0)
        {
          v17 = 6;
        }
        else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("AR_TRACKING_LIMITED_INITIALIZING")) & 1) != 0)
        {
          v17 = 7;
        }
        else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("AR_TRACKING_LIMITED_EXCESSIVE_MOTION")) & 1) != 0)
        {
          v17 = 8;
        }
        else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("AR_TRACKING_LIMITED_INSUFFICIENT_FEATURES")) & 1) != 0)
        {
          v17 = 9;
        }
        else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("AR_TRACKING_LIMITED_RELOCALIZING")) & 1) != 0)
        {
          v17 = 10;
        }
        else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("AR_TRACKING_NOT_AVAILABLE")) & 1) != 0)
        {
          v17 = 11;
        }
        else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("AR_SESSION_INTERRUPTED")) & 1) != 0)
        {
          v17 = 12;
        }
        else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("AR_INITIALIZING")) & 1) != 0)
        {
          v17 = 13;
        }
        else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("AR_INITIALIZATION_SUCCESS")) & 1) != 0)
        {
          v17 = 14;
        }
        else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("DISABLED_END_NAV")) & 1) != 0)
        {
          v17 = 15;
        }
        else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("DISABLED_INITIALIZATION_FAILED")) & 1) != 0)
        {
          v17 = 16;
        }
        else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("DISABLED_REASON_NIGHT")) & 1) != 0)
        {
          v17 = 17;
        }
        else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("DISABLED_REASON_VLF")) & 1) != 0)
        {
          v17 = 18;
        }
        else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("DISABLED_REASON_THERMAL_PRESSURE")) & 1) != 0)
        {
          v17 = 19;
        }
        else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("DISABLED_REASON_LOCATION_ACCURACY")) & 1) != 0)
        {
          v17 = 20;
        }
        else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("DISABLED_REASON_FUSED_LOCATION")) & 1) != 0)
        {
          v17 = 21;
        }
        else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("DISABLED_REASON_SESSION_TIMEOUT")) & 1) != 0)
        {
          v17 = 22;
        }
        else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("DISABLED_REASON_HORIZONTAL_DISTANCE_TRAVELED")) & 1) != 0)
        {
          v17 = 23;
        }
        else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("DISABLED_REASON_APP_BACKGROUND")) & 1) != 0)
        {
          v17 = 24;
        }
        else if (objc_msgSend(v16, "isEqualToString:", CFSTR("AR_TRACKING_LIMITED_LOW_LIGHT")))
        {
          v17 = 25;
        }
        else
        {
          v17 = 0;
        }

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_135:

          goto LABEL_136;
        }
        v17 = objc_msgSend(v15, "intValue");
      }
      objc_msgSend(a1, "setStateExitReason:", v17);
      goto LABEL_135;
    }
  }
LABEL_136:

  return a1;
}

- (GEOMarcoLiteUsageState)initWithJSON:(id)a3
{
  return (GEOMarcoLiteUsageState *)-[GEOMarcoLiteUsageState _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOMarcoLiteUsageStateIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOMarcoLiteUsageStateReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  char flags;
  id v5;

  v5 = a3;
  flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    flags = (char)self->_flags;
    if ((flags & 8) == 0)
    {
LABEL_3:
      if ((flags & 2) == 0)
        goto LABEL_4;
LABEL_9:
      PBDataWriterWriteUint32Field();
      if ((*(_BYTE *)&self->_flags & 1) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
    goto LABEL_9;
LABEL_4:
  if ((flags & 1) != 0)
LABEL_5:
    PBDataWriterWriteInt32Field();
LABEL_6:

}

- (void)copyTo:(id)a3
{
  char flags;
  _DWORD *v5;

  v5 = a3;
  -[GEOMarcoLiteUsageState readAll:](self, "readAll:", 0);
  flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    v5[4] = self->_stateType;
    *((_BYTE *)v5 + 24) |= 4u;
    flags = (char)self->_flags;
    if ((flags & 8) == 0)
    {
LABEL_3:
      if ((flags & 2) == 0)
        goto LABEL_4;
LABEL_9:
      v5[3] = self->_stateTime;
      *((_BYTE *)v5 + 24) |= 2u;
      if ((*(_BYTE *)&self->_flags & 1) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 8) == 0)
  {
    goto LABEL_3;
  }
  v5[5] = self->_stateValue;
  *((_BYTE *)v5 + 24) |= 8u;
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
    goto LABEL_9;
LABEL_4:
  if ((flags & 1) != 0)
  {
LABEL_5:
    v5[2] = self->_stateExitReason;
    *((_BYTE *)v5 + 24) |= 1u;
  }
LABEL_6:

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
    *((_BYTE *)result + 24) |= 4u;
    flags = (char)self->_flags;
    if ((flags & 8) == 0)
    {
LABEL_3:
      if ((flags & 2) == 0)
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 8) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 5) = self->_stateValue;
  *((_BYTE *)result + 24) |= 8u;
  flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_4:
    if ((flags & 1) == 0)
      return result;
    goto LABEL_5;
  }
LABEL_9:
  *((_DWORD *)result + 3) = self->_stateTime;
  *((_BYTE *)result + 24) |= 2u;
  if ((*(_BYTE *)&self->_flags & 1) == 0)
    return result;
LABEL_5:
  *((_DWORD *)result + 2) = self->_stateExitReason;
  *((_BYTE *)result + 24) |= 1u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_21;
  -[GEOMarcoLiteUsageState readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 4) == 0 || self->_stateType != *((_DWORD *)v4 + 4))
      goto LABEL_21;
  }
  else if ((*((_BYTE *)v4 + 24) & 4) != 0)
  {
LABEL_21:
    v5 = 0;
    goto LABEL_22;
  }
  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 8) == 0 || self->_stateValue != *((_DWORD *)v4 + 5))
      goto LABEL_21;
  }
  else if ((*((_BYTE *)v4 + 24) & 8) != 0)
  {
    goto LABEL_21;
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 2) == 0 || self->_stateTime != *((_DWORD *)v4 + 3))
      goto LABEL_21;
  }
  else if ((*((_BYTE *)v4 + 24) & 2) != 0)
  {
    goto LABEL_21;
  }
  v5 = (*((_BYTE *)v4 + 24) & 1) == 0;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 1) == 0 || self->_stateExitReason != *((_DWORD *)v4 + 2))
      goto LABEL_21;
    v5 = 1;
  }
LABEL_22:

  return v5;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  -[GEOMarcoLiteUsageState readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    v3 = 2654435761 * self->_stateType;
    if ((*(_BYTE *)&self->_flags & 8) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_stateValue;
      if ((*(_BYTE *)&self->_flags & 2) != 0)
        goto LABEL_4;
LABEL_8:
      v5 = 0;
      if ((*(_BYTE *)&self->_flags & 1) != 0)
        goto LABEL_5;
LABEL_9:
      v6 = 0;
      return v4 ^ v3 ^ v5 ^ v6;
    }
  }
  else
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_flags & 8) != 0)
      goto LABEL_3;
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_flags & 2) == 0)
    goto LABEL_8;
LABEL_4:
  v5 = 2654435761 * self->_stateTime;
  if ((*(_BYTE *)&self->_flags & 1) == 0)
    goto LABEL_9;
LABEL_5:
  v6 = 2654435761 * self->_stateExitReason;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  char v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "readAll:", 0);
  v4 = *((_BYTE *)v5 + 24);
  if ((v4 & 4) != 0)
  {
    self->_stateType = *((_DWORD *)v5 + 4);
    *(_BYTE *)&self->_flags |= 4u;
    v4 = *((_BYTE *)v5 + 24);
    if ((v4 & 8) == 0)
    {
LABEL_3:
      if ((v4 & 2) == 0)
        goto LABEL_4;
LABEL_9:
      self->_stateTime = *((_DWORD *)v5 + 3);
      *(_BYTE *)&self->_flags |= 2u;
      if ((*((_BYTE *)v5 + 24) & 1) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*((_BYTE *)v5 + 24) & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_stateValue = *((_DWORD *)v5 + 5);
  *(_BYTE *)&self->_flags |= 8u;
  v4 = *((_BYTE *)v5 + 24);
  if ((v4 & 2) != 0)
    goto LABEL_9;
LABEL_4:
  if ((v4 & 1) != 0)
  {
LABEL_5:
    self->_stateExitReason = *((_DWORD *)v5 + 2);
    *(_BYTE *)&self->_flags |= 1u;
  }
LABEL_6:

}

@end
