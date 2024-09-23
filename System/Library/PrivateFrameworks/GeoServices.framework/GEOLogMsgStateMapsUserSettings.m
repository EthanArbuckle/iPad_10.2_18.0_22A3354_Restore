@implementation GEOLogMsgStateMapsUserSettings

- (int)locationType
{
  if ((*(_BYTE *)&self->_flags & 2) != 0)
    return self->_locationType;
  else
    return 0;
}

- (void)setLocationType:(int)a3
{
  *(_BYTE *)&self->_flags |= 2u;
  self->_locationType = a3;
}

- (void)setHasLocationType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasLocationType
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (id)locationTypeAsString:(int)a3
{
  if (a3 < 3)
    return off_1E1C22D48[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsLocationType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LOCATION_TYPE_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LOCATION_TYPE_PRECISE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("LOCATION_TYPE_COURSE")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)locationCadence
{
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    return self->_locationCadence;
  else
    return 0;
}

- (void)setLocationCadence:(int)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_locationCadence = a3;
}

- (void)setHasLocationCadence:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasLocationCadence
{
  return *(_BYTE *)&self->_flags & 1;
}

- (id)locationCadenceAsString:(int)a3
{
  if (a3 < 5)
    return off_1E1C22D60[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsLocationCadence:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LOCATION_CADENCE_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LOCATION_CADENCE_NEVER")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LOCATION_CADENCE_ONCE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LOCATION_CADENCE_IN_APP")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("LOCATION_CADENCE_ALWAYS")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)notificationsEnabled
{
  return self->_notificationsEnabled;
}

- (void)setNotificationsEnabled:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 0x20u;
  self->_notificationsEnabled = a3;
}

- (void)setHasNotificationsEnabled:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xDF | v3;
}

- (BOOL)hasNotificationsEnabled
{
  return (*(_BYTE *)&self->_flags >> 5) & 1;
}

- (BOOL)siriSuggestionsEnabled
{
  return self->_siriSuggestionsEnabled;
}

- (void)setSiriSuggestionsEnabled:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 0x40u;
  self->_siriSuggestionsEnabled = a3;
}

- (void)setHasSiriSuggestionsEnabled:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xBF | v3;
}

- (BOOL)hasSiriSuggestionsEnabled
{
  return (*(_BYTE *)&self->_flags >> 6) & 1;
}

- (BOOL)learnFromAppEnabled
{
  return self->_learnFromAppEnabled;
}

- (void)setLearnFromAppEnabled:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 0x10u;
  self->_learnFromAppEnabled = a3;
}

- (void)setHasLearnFromAppEnabled:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xEF | v3;
}

- (BOOL)hasLearnFromAppEnabled
{
  return (*(_BYTE *)&self->_flags >> 4) & 1;
}

- (BOOL)airQualityShown
{
  return self->_airQualityShown;
}

- (void)setAirQualityShown:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 4u;
  self->_airQualityShown = a3;
}

- (void)setHasAirQualityShown:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasAirQualityShown
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (BOOL)weatherShown
{
  return self->_weatherShown;
}

- (void)setWeatherShown:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 0x80u;
  self->_weatherShown = a3;
}

- (void)setHasWeatherShown:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 0x80;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = v3 & 0x80 | *(_BYTE *)&self->_flags & 0x7F;
}

- (BOOL)hasWeatherShown
{
  return *(_BYTE *)&self->_flags >> 7;
}

- (BOOL)isOptedInToVlCrowdsourcing
{
  return self->_isOptedInToVlCrowdsourcing;
}

- (void)setIsOptedInToVlCrowdsourcing:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 8u;
  self->_isOptedInToVlCrowdsourcing = a3;
}

- (void)setHasIsOptedInToVlCrowdsourcing:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xF7 | v3;
}

- (BOOL)hasIsOptedInToVlCrowdsourcing
{
  return (*(_BYTE *)&self->_flags >> 3) & 1;
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
  v8.super_class = (Class)GEOLogMsgStateMapsUserSettings;
  -[GEOLogMsgStateMapsUserSettings description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOLogMsgStateMapsUserSettings dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgStateMapsUserSettings _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  char v5;
  uint64_t v6;
  __CFString *v7;
  const __CFString *v8;
  uint64_t v9;
  __CFString *v10;
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
  const __CFString *v21;
  void *v22;
  const __CFString *v23;

  if (!a1)
  {
    v4 = 0;
    return v4;
  }
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_BYTE *)(a1 + 24);
  if ((v5 & 2) != 0)
  {
    v6 = *(int *)(a1 + 12);
    if (v6 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 12));
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_1E1C22D48[v6];
    }
    if (a2)
      v8 = CFSTR("locationType");
    else
      v8 = CFSTR("location_type");
    objc_msgSend(v4, "setObject:forKey:", v7, v8);

    v5 = *(_BYTE *)(a1 + 24);
  }
  if ((v5 & 1) != 0)
  {
    v9 = *(int *)(a1 + 8);
    if (v9 >= 5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 8));
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = off_1E1C22D60[v9];
    }
    if (a2)
      v11 = CFSTR("locationCadence");
    else
      v11 = CFSTR("location_cadence");
    objc_msgSend(v4, "setObject:forKey:", v10, v11);

    v5 = *(_BYTE *)(a1 + 24);
  }
  if ((v5 & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 19));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v13 = CFSTR("notificationsEnabled");
    else
      v13 = CFSTR("notifications_enabled");
    objc_msgSend(v4, "setObject:forKey:", v12, v13);

    v5 = *(_BYTE *)(a1 + 24);
    if ((v5 & 0x40) == 0)
    {
LABEL_20:
      if ((v5 & 0x10) == 0)
        goto LABEL_21;
      goto LABEL_33;
    }
  }
  else if ((v5 & 0x40) == 0)
  {
    goto LABEL_20;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 20));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v15 = CFSTR("siriSuggestionsEnabled");
  else
    v15 = CFSTR("siri_suggestions_enabled");
  objc_msgSend(v4, "setObject:forKey:", v14, v15);

  v5 = *(_BYTE *)(a1 + 24);
  if ((v5 & 0x10) == 0)
  {
LABEL_21:
    if ((v5 & 4) == 0)
      goto LABEL_22;
    goto LABEL_37;
  }
LABEL_33:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 18));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v17 = CFSTR("learnFromAppEnabled");
  else
    v17 = CFSTR("learn_from_app_enabled");
  objc_msgSend(v4, "setObject:forKey:", v16, v17);

  v5 = *(_BYTE *)(a1 + 24);
  if ((v5 & 4) == 0)
  {
LABEL_22:
    if ((v5 & 0x80) == 0)
      goto LABEL_23;
    goto LABEL_41;
  }
LABEL_37:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 16));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v19 = CFSTR("airQualityShown");
  else
    v19 = CFSTR("air_quality_shown");
  objc_msgSend(v4, "setObject:forKey:", v18, v19);

  v5 = *(_BYTE *)(a1 + 24);
  if ((v5 & 0x80) == 0)
  {
LABEL_23:
    if ((v5 & 8) == 0)
      return v4;
    goto LABEL_45;
  }
LABEL_41:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 21));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v21 = CFSTR("weatherShown");
  else
    v21 = CFSTR("weather_shown");
  objc_msgSend(v4, "setObject:forKey:", v20, v21);

  if ((*(_BYTE *)(a1 + 24) & 8) != 0)
  {
LABEL_45:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 17));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v23 = CFSTR("isOptedInToVlCrowdsourcing");
    else
      v23 = CFSTR("is_opted_in_to_vl_crowdsourcing");
    objc_msgSend(v4, "setObject:forKey:", v22, v23);

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOLogMsgStateMapsUserSettings _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLogMsgStateMapsUserSettings)initWithDictionary:(id)a3
{
  return (GEOLogMsgStateMapsUserSettings *)-[GEOLogMsgStateMapsUserSettings _initWithDictionary:isJSON:](self, a3, 0);
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
  const __CFString *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  const __CFString *v24;
  void *v25;

  v5 = a2;
  if (!a1)
    goto LABEL_68;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_68;
  if (a3)
    v6 = CFSTR("locationType");
  else
    v6 = CFSTR("location_type");
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
    if ((objc_msgSend(v8, "isEqualToString:", CFSTR("LOCATION_TYPE_UNKNOWN")) & 1) != 0)
    {
      v9 = 0;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("LOCATION_TYPE_PRECISE")) & 1) != 0)
    {
      v9 = 1;
    }
    else if (objc_msgSend(v8, "isEqualToString:", CFSTR("LOCATION_TYPE_COURSE")))
    {
      v9 = 2;
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
      goto LABEL_18;
    v9 = objc_msgSend(v7, "intValue");
  }
  objc_msgSend(a1, "setLocationType:", v9);
LABEL_18:

  if (a3)
    v10 = CFSTR("locationCadence");
  else
    v10 = CFSTR("location_cadence");
  objc_msgSend(v5, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12 = v11;
    if ((objc_msgSend(v12, "isEqualToString:", CFSTR("LOCATION_CADENCE_UNKNOWN")) & 1) != 0)
    {
      v13 = 0;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("LOCATION_CADENCE_NEVER")) & 1) != 0)
    {
      v13 = 1;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("LOCATION_CADENCE_ONCE")) & 1) != 0)
    {
      v13 = 2;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("LOCATION_CADENCE_IN_APP")) & 1) != 0)
    {
      v13 = 3;
    }
    else if (objc_msgSend(v12, "isEqualToString:", CFSTR("LOCATION_CADENCE_ALWAYS")))
    {
      v13 = 4;
    }
    else
    {
      v13 = 0;
    }

    goto LABEL_36;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v13 = objc_msgSend(v11, "intValue");
LABEL_36:
    objc_msgSend(a1, "setLocationCadence:", v13);
  }

  if (a3)
    v14 = CFSTR("notificationsEnabled");
  else
    v14 = CFSTR("notifications_enabled");
  objc_msgSend(v5, "objectForKeyedSubscript:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setNotificationsEnabled:", objc_msgSend(v15, "BOOLValue"));

  if (a3)
    v16 = CFSTR("siriSuggestionsEnabled");
  else
    v16 = CFSTR("siri_suggestions_enabled");
  objc_msgSend(v5, "objectForKeyedSubscript:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setSiriSuggestionsEnabled:", objc_msgSend(v17, "BOOLValue"));

  if (a3)
    v18 = CFSTR("learnFromAppEnabled");
  else
    v18 = CFSTR("learn_from_app_enabled");
  objc_msgSend(v5, "objectForKeyedSubscript:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setLearnFromAppEnabled:", objc_msgSend(v19, "BOOLValue"));

  if (a3)
    v20 = CFSTR("airQualityShown");
  else
    v20 = CFSTR("air_quality_shown");
  objc_msgSend(v5, "objectForKeyedSubscript:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setAirQualityShown:", objc_msgSend(v21, "BOOLValue"));

  if (a3)
    v22 = CFSTR("weatherShown");
  else
    v22 = CFSTR("weather_shown");
  objc_msgSend(v5, "objectForKeyedSubscript:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setWeatherShown:", objc_msgSend(v23, "BOOLValue"));

  if (a3)
    v24 = CFSTR("isOptedInToVlCrowdsourcing");
  else
    v24 = CFSTR("is_opted_in_to_vl_crowdsourcing");
  objc_msgSend(v5, "objectForKeyedSubscript:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setIsOptedInToVlCrowdsourcing:", objc_msgSend(v25, "BOOLValue"));

LABEL_68:
  return a1;
}

- (GEOLogMsgStateMapsUserSettings)initWithJSON:(id)a3
{
  return (GEOLogMsgStateMapsUserSettings *)-[GEOLogMsgStateMapsUserSettings _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgStateMapsUserSettingsIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgStateMapsUserSettingsReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  char flags;
  id v5;

  v5 = a3;
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    flags = (char)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_3:
      if ((flags & 0x20) == 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 1) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  flags = (char)self->_flags;
  if ((flags & 0x20) == 0)
  {
LABEL_4:
    if ((flags & 0x40) == 0)
      goto LABEL_5;
    goto LABEL_14;
  }
LABEL_13:
  PBDataWriterWriteBOOLField();
  flags = (char)self->_flags;
  if ((flags & 0x40) == 0)
  {
LABEL_5:
    if ((flags & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_15;
  }
LABEL_14:
  PBDataWriterWriteBOOLField();
  flags = (char)self->_flags;
  if ((flags & 0x10) == 0)
  {
LABEL_6:
    if ((flags & 4) == 0)
      goto LABEL_7;
    goto LABEL_16;
  }
LABEL_15:
  PBDataWriterWriteBOOLField();
  flags = (char)self->_flags;
  if ((flags & 4) == 0)
  {
LABEL_7:
    if ((flags & 0x80) == 0)
      goto LABEL_8;
LABEL_17:
    PBDataWriterWriteBOOLField();
    if ((*(_BYTE *)&self->_flags & 8) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
LABEL_16:
  PBDataWriterWriteBOOLField();
  flags = (char)self->_flags;
  if (flags < 0)
    goto LABEL_17;
LABEL_8:
  if ((flags & 8) != 0)
LABEL_9:
    PBDataWriterWriteBOOLField();
LABEL_10:

}

- (void)copyTo:(id)a3
{
  char flags;
  _DWORD *v5;

  v5 = a3;
  -[GEOLogMsgStateMapsUserSettings readAll:](self, "readAll:", 0);
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    v5[3] = self->_locationType;
    *((_BYTE *)v5 + 24) |= 2u;
    flags = (char)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_3:
      if ((flags & 0x20) == 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 1) == 0)
  {
    goto LABEL_3;
  }
  v5[2] = self->_locationCadence;
  *((_BYTE *)v5 + 24) |= 1u;
  flags = (char)self->_flags;
  if ((flags & 0x20) == 0)
  {
LABEL_4:
    if ((flags & 0x40) == 0)
      goto LABEL_5;
    goto LABEL_14;
  }
LABEL_13:
  *((_BYTE *)v5 + 19) = self->_notificationsEnabled;
  *((_BYTE *)v5 + 24) |= 0x20u;
  flags = (char)self->_flags;
  if ((flags & 0x40) == 0)
  {
LABEL_5:
    if ((flags & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_15;
  }
LABEL_14:
  *((_BYTE *)v5 + 20) = self->_siriSuggestionsEnabled;
  *((_BYTE *)v5 + 24) |= 0x40u;
  flags = (char)self->_flags;
  if ((flags & 0x10) == 0)
  {
LABEL_6:
    if ((flags & 4) == 0)
      goto LABEL_7;
    goto LABEL_16;
  }
LABEL_15:
  *((_BYTE *)v5 + 18) = self->_learnFromAppEnabled;
  *((_BYTE *)v5 + 24) |= 0x10u;
  flags = (char)self->_flags;
  if ((flags & 4) == 0)
  {
LABEL_7:
    if ((flags & 0x80) == 0)
      goto LABEL_8;
LABEL_17:
    *((_BYTE *)v5 + 21) = self->_weatherShown;
    *((_BYTE *)v5 + 24) |= 0x80u;
    if ((*(_BYTE *)&self->_flags & 8) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
LABEL_16:
  *((_BYTE *)v5 + 16) = self->_airQualityShown;
  *((_BYTE *)v5 + 24) |= 4u;
  flags = (char)self->_flags;
  if (flags < 0)
    goto LABEL_17;
LABEL_8:
  if ((flags & 8) != 0)
  {
LABEL_9:
    *((_BYTE *)v5 + 17) = self->_isOptedInToVlCrowdsourcing;
    *((_BYTE *)v5 + 24) |= 8u;
  }
LABEL_10:

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char flags;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *((_DWORD *)result + 3) = self->_locationType;
    *((_BYTE *)result + 24) |= 2u;
    flags = (char)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_3:
      if ((flags & 0x20) == 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 1) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 2) = self->_locationCadence;
  *((_BYTE *)result + 24) |= 1u;
  flags = (char)self->_flags;
  if ((flags & 0x20) == 0)
  {
LABEL_4:
    if ((flags & 0x40) == 0)
      goto LABEL_5;
    goto LABEL_14;
  }
LABEL_13:
  *((_BYTE *)result + 19) = self->_notificationsEnabled;
  *((_BYTE *)result + 24) |= 0x20u;
  flags = (char)self->_flags;
  if ((flags & 0x40) == 0)
  {
LABEL_5:
    if ((flags & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_15;
  }
LABEL_14:
  *((_BYTE *)result + 20) = self->_siriSuggestionsEnabled;
  *((_BYTE *)result + 24) |= 0x40u;
  flags = (char)self->_flags;
  if ((flags & 0x10) == 0)
  {
LABEL_6:
    if ((flags & 4) == 0)
      goto LABEL_7;
    goto LABEL_16;
  }
LABEL_15:
  *((_BYTE *)result + 18) = self->_learnFromAppEnabled;
  *((_BYTE *)result + 24) |= 0x10u;
  flags = (char)self->_flags;
  if ((flags & 4) == 0)
  {
LABEL_7:
    if ((flags & 0x80) == 0)
      goto LABEL_8;
    goto LABEL_17;
  }
LABEL_16:
  *((_BYTE *)result + 16) = self->_airQualityShown;
  *((_BYTE *)result + 24) |= 4u;
  flags = (char)self->_flags;
  if ((flags & 0x80) == 0)
  {
LABEL_8:
    if ((flags & 8) == 0)
      return result;
    goto LABEL_9;
  }
LABEL_17:
  *((_BYTE *)result + 21) = self->_weatherShown;
  *((_BYTE *)result + 24) |= 0x80u;
  if ((*(_BYTE *)&self->_flags & 8) == 0)
    return result;
LABEL_9:
  *((_BYTE *)result + 17) = self->_isOptedInToVlCrowdsourcing;
  *((_BYTE *)result + 24) |= 8u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_52;
  -[GEOLogMsgStateMapsUserSettings readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 2) == 0 || self->_locationType != *((_DWORD *)v4 + 3))
      goto LABEL_52;
  }
  else if ((*((_BYTE *)v4 + 24) & 2) != 0)
  {
    goto LABEL_52;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 1) == 0 || self->_locationCadence != *((_DWORD *)v4 + 2))
      goto LABEL_52;
  }
  else if ((*((_BYTE *)v4 + 24) & 1) != 0)
  {
    goto LABEL_52;
  }
  if ((*(_BYTE *)&self->_flags & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 0x20) == 0)
      goto LABEL_52;
    if (self->_notificationsEnabled)
    {
      if (!*((_BYTE *)v4 + 19))
        goto LABEL_52;
    }
    else if (*((_BYTE *)v4 + 19))
    {
      goto LABEL_52;
    }
  }
  else if ((*((_BYTE *)v4 + 24) & 0x20) != 0)
  {
    goto LABEL_52;
  }
  if ((*(_BYTE *)&self->_flags & 0x40) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 0x40) == 0)
      goto LABEL_52;
    if (self->_siriSuggestionsEnabled)
    {
      if (!*((_BYTE *)v4 + 20))
        goto LABEL_52;
    }
    else if (*((_BYTE *)v4 + 20))
    {
      goto LABEL_52;
    }
  }
  else if ((*((_BYTE *)v4 + 24) & 0x40) != 0)
  {
    goto LABEL_52;
  }
  if ((*(_BYTE *)&self->_flags & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 0x10) == 0)
      goto LABEL_52;
    if (self->_learnFromAppEnabled)
    {
      if (!*((_BYTE *)v4 + 18))
        goto LABEL_52;
    }
    else if (*((_BYTE *)v4 + 18))
    {
      goto LABEL_52;
    }
  }
  else if ((*((_BYTE *)v4 + 24) & 0x10) != 0)
  {
    goto LABEL_52;
  }
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 4) == 0)
      goto LABEL_52;
    if (self->_airQualityShown)
    {
      if (!*((_BYTE *)v4 + 16))
        goto LABEL_52;
    }
    else if (*((_BYTE *)v4 + 16))
    {
      goto LABEL_52;
    }
  }
  else if ((*((_BYTE *)v4 + 24) & 4) != 0)
  {
    goto LABEL_52;
  }
  if ((*(_BYTE *)&self->_flags & 0x80) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 0x80) == 0)
      goto LABEL_52;
    if (self->_weatherShown)
    {
      if (!*((_BYTE *)v4 + 21))
        goto LABEL_52;
    }
    else if (*((_BYTE *)v4 + 21))
    {
      goto LABEL_52;
    }
  }
  else if ((*((_BYTE *)v4 + 24) & 0x80) != 0)
  {
    goto LABEL_52;
  }
  v5 = (*((_BYTE *)v4 + 24) & 8) == 0;
  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 8) != 0)
    {
      if (self->_isOptedInToVlCrowdsourcing)
      {
        if (!*((_BYTE *)v4 + 17))
          goto LABEL_52;
LABEL_60:
        v5 = 1;
        goto LABEL_53;
      }
      if (!*((_BYTE *)v4 + 17))
        goto LABEL_60;
    }
LABEL_52:
    v5 = 0;
  }
LABEL_53:

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
  uint64_t v9;
  uint64_t v10;

  -[GEOLogMsgStateMapsUserSettings readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    v3 = 2654435761 * self->_locationType;
    if ((*(_BYTE *)&self->_flags & 1) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_locationCadence;
      if ((*(_BYTE *)&self->_flags & 0x20) != 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      goto LABEL_3;
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_flags & 0x20) != 0)
  {
LABEL_4:
    v5 = 2654435761 * self->_notificationsEnabled;
    if ((*(_BYTE *)&self->_flags & 0x40) != 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  v5 = 0;
  if ((*(_BYTE *)&self->_flags & 0x40) != 0)
  {
LABEL_5:
    v6 = 2654435761 * self->_siriSuggestionsEnabled;
    if ((*(_BYTE *)&self->_flags & 0x10) != 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  v6 = 0;
  if ((*(_BYTE *)&self->_flags & 0x10) != 0)
  {
LABEL_6:
    v7 = 2654435761 * self->_learnFromAppEnabled;
    if ((*(_BYTE *)&self->_flags & 4) != 0)
      goto LABEL_7;
    goto LABEL_15;
  }
LABEL_14:
  v7 = 0;
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
LABEL_7:
    v8 = 2654435761 * self->_airQualityShown;
    if ((*(_BYTE *)&self->_flags & 0x80) != 0)
      goto LABEL_8;
LABEL_16:
    v9 = 0;
    if ((*(_BYTE *)&self->_flags & 8) != 0)
      goto LABEL_9;
LABEL_17:
    v10 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
  }
LABEL_15:
  v8 = 0;
  if ((*(_BYTE *)&self->_flags & 0x80) == 0)
    goto LABEL_16;
LABEL_8:
  v9 = 2654435761 * self->_weatherShown;
  if ((*(_BYTE *)&self->_flags & 8) == 0)
    goto LABEL_17;
LABEL_9:
  v10 = 2654435761 * self->_isOptedInToVlCrowdsourcing;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
}

- (void)mergeFrom:(id)a3
{
  char v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "readAll:", 0);
  v4 = *((_BYTE *)v5 + 24);
  if ((v4 & 2) != 0)
  {
    self->_locationType = *((_DWORD *)v5 + 3);
    *(_BYTE *)&self->_flags |= 2u;
    v4 = *((_BYTE *)v5 + 24);
    if ((v4 & 1) == 0)
    {
LABEL_3:
      if ((v4 & 0x20) == 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else if ((*((_BYTE *)v5 + 24) & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_locationCadence = *((_DWORD *)v5 + 2);
  *(_BYTE *)&self->_flags |= 1u;
  v4 = *((_BYTE *)v5 + 24);
  if ((v4 & 0x20) == 0)
  {
LABEL_4:
    if ((v4 & 0x40) == 0)
      goto LABEL_5;
    goto LABEL_14;
  }
LABEL_13:
  self->_notificationsEnabled = *((_BYTE *)v5 + 19);
  *(_BYTE *)&self->_flags |= 0x20u;
  v4 = *((_BYTE *)v5 + 24);
  if ((v4 & 0x40) == 0)
  {
LABEL_5:
    if ((v4 & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_15;
  }
LABEL_14:
  self->_siriSuggestionsEnabled = *((_BYTE *)v5 + 20);
  *(_BYTE *)&self->_flags |= 0x40u;
  v4 = *((_BYTE *)v5 + 24);
  if ((v4 & 0x10) == 0)
  {
LABEL_6:
    if ((v4 & 4) == 0)
      goto LABEL_7;
    goto LABEL_16;
  }
LABEL_15:
  self->_learnFromAppEnabled = *((_BYTE *)v5 + 18);
  *(_BYTE *)&self->_flags |= 0x10u;
  v4 = *((_BYTE *)v5 + 24);
  if ((v4 & 4) == 0)
  {
LABEL_7:
    if ((v4 & 0x80) == 0)
      goto LABEL_8;
LABEL_17:
    self->_weatherShown = *((_BYTE *)v5 + 21);
    *(_BYTE *)&self->_flags |= 0x80u;
    if ((*((_BYTE *)v5 + 24) & 8) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
LABEL_16:
  self->_airQualityShown = *((_BYTE *)v5 + 16);
  *(_BYTE *)&self->_flags |= 4u;
  v4 = *((_BYTE *)v5 + 24);
  if (v4 < 0)
    goto LABEL_17;
LABEL_8:
  if ((v4 & 8) != 0)
  {
LABEL_9:
    self->_isOptedInToVlCrowdsourcing = *((_BYTE *)v5 + 17);
    *(_BYTE *)&self->_flags |= 8u;
  }
LABEL_10:

}

@end
