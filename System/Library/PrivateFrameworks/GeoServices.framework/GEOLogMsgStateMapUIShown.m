@implementation GEOLogMsgStateMapUIShown

- (BOOL)isAirQualityShown
{
  return self->_isAirQualityShown;
}

- (void)setIsAirQualityShown:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 2u;
  self->_isAirQualityShown = a3;
}

- (void)setHasIsAirQualityShown:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasIsAirQualityShown
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (BOOL)isWeatherShown
{
  return self->_isWeatherShown;
}

- (void)setIsWeatherShown:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 0x10u;
  self->_isWeatherShown = a3;
}

- (void)setHasIsWeatherShown:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xEF | v3;
}

- (BOOL)hasIsWeatherShown
{
  return (*(_BYTE *)&self->_flags >> 4) & 1;
}

- (BOOL)isVenueExperienceShown
{
  return self->_isVenueExperienceShown;
}

- (void)setIsVenueExperienceShown:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 8u;
  self->_isVenueExperienceShown = a3;
}

- (void)setHasIsVenueExperienceShown:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xF7 | v3;
}

- (BOOL)hasIsVenueExperienceShown
{
  return (*(_BYTE *)&self->_flags >> 3) & 1;
}

- (BOOL)isLookAroundEntryIconShown
{
  return self->_isLookAroundEntryIconShown;
}

- (void)setIsLookAroundEntryIconShown:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 4u;
  self->_isLookAroundEntryIconShown = a3;
}

- (void)setHasIsLookAroundEntryIconShown:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasIsLookAroundEntryIconShown
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (int)activeNavMode
{
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    return self->_activeNavMode;
  else
    return 0;
}

- (void)setActiveNavMode:(int)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_activeNavMode = a3;
}

- (void)setHasActiveNavMode:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasActiveNavMode
{
  return *(_BYTE *)&self->_flags & 1;
}

- (id)activeNavModeAsString:(int)a3
{
  if (a3 < 7)
    return off_1E1C22C88[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsActiveNavMode:(id)a3
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

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)GEOLogMsgStateMapUIShown;
  -[GEOLogMsgStateMapUIShown description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOLogMsgStateMapUIShown dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgStateMapUIShown _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  char v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  const __CFString *v13;
  uint64_t v14;
  __CFString *v15;
  const __CFString *v16;

  if (!a1)
  {
    v4 = 0;
    return v4;
  }
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_BYTE *)(a1 + 16);
  if ((v5 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 12));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v7 = CFSTR("isAirQualityShown");
    else
      v7 = CFSTR("is_air_quality_shown");
    objc_msgSend(v4, "setObject:forKey:", v6, v7);

    v5 = *(_BYTE *)(a1 + 16);
  }
  if ((v5 & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 15));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v9 = CFSTR("isWeatherShown");
    else
      v9 = CFSTR("is_weather_shown");
    objc_msgSend(v4, "setObject:forKey:", v8, v9);

    v5 = *(_BYTE *)(a1 + 16);
    if ((v5 & 8) == 0)
    {
LABEL_9:
      if ((v5 & 4) == 0)
        goto LABEL_10;
      goto LABEL_20;
    }
  }
  else if ((v5 & 8) == 0)
  {
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 14));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v11 = CFSTR("isVenueExperienceShown");
  else
    v11 = CFSTR("is_venue_experience_shown");
  objc_msgSend(v4, "setObject:forKey:", v10, v11);

  v5 = *(_BYTE *)(a1 + 16);
  if ((v5 & 4) == 0)
  {
LABEL_10:
    if ((v5 & 1) == 0)
      return v4;
    goto LABEL_24;
  }
LABEL_20:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 13));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v13 = CFSTR("isLookAroundEntryIconShown");
  else
    v13 = CFSTR("is_look_around_entry_icon_shown");
  objc_msgSend(v4, "setObject:forKey:", v12, v13);

  if ((*(_BYTE *)(a1 + 16) & 1) != 0)
  {
LABEL_24:
    v14 = *(int *)(a1 + 8);
    if (v14 >= 7)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 8));
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = off_1E1C22C88[v14];
    }
    if (a2)
      v16 = CFSTR("activeNavMode");
    else
      v16 = CFSTR("active_nav_mode");
    objc_msgSend(v4, "setObject:forKey:", v15, v16);

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOLogMsgStateMapUIShown _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLogMsgStateMapUIShown)initWithDictionary:(id)a3
{
  return (GEOLogMsgStateMapUIShown *)-[GEOLogMsgStateMapUIShown _initWithDictionary:isJSON:](self, a3, 0);
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
        v6 = CFSTR("isAirQualityShown");
      else
        v6 = CFSTR("is_air_quality_shown");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setIsAirQualityShown:", objc_msgSend(v7, "BOOLValue"));

      if (a3)
        v8 = CFSTR("isWeatherShown");
      else
        v8 = CFSTR("is_weather_shown");
      objc_msgSend(v5, "objectForKeyedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setIsWeatherShown:", objc_msgSend(v9, "BOOLValue"));

      if (a3)
        v10 = CFSTR("isVenueExperienceShown");
      else
        v10 = CFSTR("is_venue_experience_shown");
      objc_msgSend(v5, "objectForKeyedSubscript:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setIsVenueExperienceShown:", objc_msgSend(v11, "BOOLValue"));

      if (a3)
        v12 = CFSTR("isLookAroundEntryIconShown");
      else
        v12 = CFSTR("is_look_around_entry_icon_shown");
      objc_msgSend(v5, "objectForKeyedSubscript:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setIsLookAroundEntryIconShown:", objc_msgSend(v13, "BOOLValue"));

      if (a3)
        v14 = CFSTR("activeNavMode");
      else
        v14 = CFSTR("active_nav_mode");
      objc_msgSend(v5, "objectForKeyedSubscript:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v16 = v15;
        if ((objc_msgSend(v16, "isEqualToString:", CFSTR("AUTOMOBILE")) & 1) != 0)
        {
          v17 = 0;
        }
        else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("TRANSIT")) & 1) != 0)
        {
          v17 = 1;
        }
        else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("WALKING")) & 1) != 0)
        {
          v17 = 2;
        }
        else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("BICYCLE")) & 1) != 0)
        {
          v17 = 3;
        }
        else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("UNKNOWN_TRANSPORT_TYPE")) & 1) != 0)
        {
          v17 = 4;
        }
        else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("FERRY")) & 1) != 0)
        {
          v17 = 5;
        }
        else if (objc_msgSend(v16, "isEqualToString:", CFSTR("RIDESHARE")))
        {
          v17 = 6;
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
LABEL_46:

          goto LABEL_47;
        }
        v17 = objc_msgSend(v15, "intValue");
      }
      objc_msgSend(a1, "setActiveNavMode:", v17);
      goto LABEL_46;
    }
  }
LABEL_47:

  return a1;
}

- (GEOLogMsgStateMapUIShown)initWithJSON:(id)a3
{
  return (GEOLogMsgStateMapUIShown *)-[GEOLogMsgStateMapUIShown _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgStateMapUIShownIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgStateMapUIShownReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  char flags;
  id v5;

  v5 = a3;
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    flags = (char)self->_flags;
    if ((flags & 0x10) == 0)
    {
LABEL_3:
      if ((flags & 8) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 0x10) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  flags = (char)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_4:
    if ((flags & 4) == 0)
      goto LABEL_5;
LABEL_11:
    PBDataWriterWriteBOOLField();
    if ((*(_BYTE *)&self->_flags & 1) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_10:
  PBDataWriterWriteBOOLField();
  flags = (char)self->_flags;
  if ((flags & 4) != 0)
    goto LABEL_11;
LABEL_5:
  if ((flags & 1) != 0)
LABEL_6:
    PBDataWriterWriteInt32Field();
LABEL_7:

}

- (void)copyTo:(id)a3
{
  char flags;
  _BYTE *v5;

  v5 = a3;
  -[GEOLogMsgStateMapUIShown readAll:](self, "readAll:", 0);
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    v5[12] = self->_isAirQualityShown;
    v5[16] |= 2u;
    flags = (char)self->_flags;
    if ((flags & 0x10) == 0)
    {
LABEL_3:
      if ((flags & 8) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 0x10) == 0)
  {
    goto LABEL_3;
  }
  v5[15] = self->_isWeatherShown;
  v5[16] |= 0x10u;
  flags = (char)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_4:
    if ((flags & 4) == 0)
      goto LABEL_5;
LABEL_11:
    v5[13] = self->_isLookAroundEntryIconShown;
    v5[16] |= 4u;
    if ((*(_BYTE *)&self->_flags & 1) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_10:
  v5[14] = self->_isVenueExperienceShown;
  v5[16] |= 8u;
  flags = (char)self->_flags;
  if ((flags & 4) != 0)
    goto LABEL_11;
LABEL_5:
  if ((flags & 1) != 0)
  {
LABEL_6:
    *((_DWORD *)v5 + 2) = self->_activeNavMode;
    v5[16] |= 1u;
  }
LABEL_7:

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char flags;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *((_BYTE *)result + 12) = self->_isAirQualityShown;
    *((_BYTE *)result + 16) |= 2u;
    flags = (char)self->_flags;
    if ((flags & 0x10) == 0)
    {
LABEL_3:
      if ((flags & 8) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *((_BYTE *)result + 15) = self->_isWeatherShown;
  *((_BYTE *)result + 16) |= 0x10u;
  flags = (char)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_4:
    if ((flags & 4) == 0)
      goto LABEL_5;
    goto LABEL_11;
  }
LABEL_10:
  *((_BYTE *)result + 14) = self->_isVenueExperienceShown;
  *((_BYTE *)result + 16) |= 8u;
  flags = (char)self->_flags;
  if ((flags & 4) == 0)
  {
LABEL_5:
    if ((flags & 1) == 0)
      return result;
    goto LABEL_6;
  }
LABEL_11:
  *((_BYTE *)result + 13) = self->_isLookAroundEntryIconShown;
  *((_BYTE *)result + 16) |= 4u;
  if ((*(_BYTE *)&self->_flags & 1) == 0)
    return result;
LABEL_6:
  *((_DWORD *)result + 2) = self->_activeNavMode;
  *((_BYTE *)result + 16) |= 1u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_38;
  -[GEOLogMsgStateMapUIShown readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 16) & 2) == 0)
      goto LABEL_38;
    if (self->_isAirQualityShown)
    {
      if (!*((_BYTE *)v4 + 12))
        goto LABEL_38;
    }
    else if (*((_BYTE *)v4 + 12))
    {
      goto LABEL_38;
    }
  }
  else if ((*((_BYTE *)v4 + 16) & 2) != 0)
  {
    goto LABEL_38;
  }
  if ((*(_BYTE *)&self->_flags & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 16) & 0x10) == 0)
      goto LABEL_38;
    if (self->_isWeatherShown)
    {
      if (!*((_BYTE *)v4 + 15))
        goto LABEL_38;
    }
    else if (*((_BYTE *)v4 + 15))
    {
      goto LABEL_38;
    }
  }
  else if ((*((_BYTE *)v4 + 16) & 0x10) != 0)
  {
    goto LABEL_38;
  }
  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 16) & 8) == 0)
      goto LABEL_38;
    if (self->_isVenueExperienceShown)
    {
      if (!*((_BYTE *)v4 + 14))
        goto LABEL_38;
    }
    else if (*((_BYTE *)v4 + 14))
    {
      goto LABEL_38;
    }
  }
  else if ((*((_BYTE *)v4 + 16) & 8) != 0)
  {
    goto LABEL_38;
  }
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 16) & 4) != 0)
    {
      if (self->_isLookAroundEntryIconShown)
      {
        if (!*((_BYTE *)v4 + 13))
          goto LABEL_38;
        goto LABEL_34;
      }
      if (!*((_BYTE *)v4 + 13))
        goto LABEL_34;
    }
LABEL_38:
    v5 = 0;
    goto LABEL_39;
  }
  if ((*((_BYTE *)v4 + 16) & 4) != 0)
    goto LABEL_38;
LABEL_34:
  v5 = (*((_BYTE *)v4 + 16) & 1) == 0;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 16) & 1) == 0 || self->_activeNavMode != *((_DWORD *)v4 + 2))
      goto LABEL_38;
    v5 = 1;
  }
LABEL_39:

  return v5;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  -[GEOLogMsgStateMapUIShown readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    v3 = 2654435761 * self->_isAirQualityShown;
    if ((*(_BYTE *)&self->_flags & 0x10) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_isWeatherShown;
      if ((*(_BYTE *)&self->_flags & 8) != 0)
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  else
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_flags & 0x10) != 0)
      goto LABEL_3;
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
LABEL_4:
    v5 = 2654435761 * self->_isVenueExperienceShown;
    if ((*(_BYTE *)&self->_flags & 4) != 0)
      goto LABEL_5;
LABEL_10:
    v6 = 0;
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      goto LABEL_6;
LABEL_11:
    v7 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7;
  }
LABEL_9:
  v5 = 0;
  if ((*(_BYTE *)&self->_flags & 4) == 0)
    goto LABEL_10;
LABEL_5:
  v6 = 2654435761 * self->_isLookAroundEntryIconShown;
  if ((*(_BYTE *)&self->_flags & 1) == 0)
    goto LABEL_11;
LABEL_6:
  v7 = 2654435761 * self->_activeNavMode;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  char v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "readAll:", 0);
  v4 = *((_BYTE *)v5 + 16);
  if ((v4 & 2) != 0)
  {
    self->_isAirQualityShown = *((_BYTE *)v5 + 12);
    *(_BYTE *)&self->_flags |= 2u;
    v4 = *((_BYTE *)v5 + 16);
    if ((v4 & 0x10) == 0)
    {
LABEL_3:
      if ((v4 & 8) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*((_BYTE *)v5 + 16) & 0x10) == 0)
  {
    goto LABEL_3;
  }
  self->_isWeatherShown = *((_BYTE *)v5 + 15);
  *(_BYTE *)&self->_flags |= 0x10u;
  v4 = *((_BYTE *)v5 + 16);
  if ((v4 & 8) == 0)
  {
LABEL_4:
    if ((v4 & 4) == 0)
      goto LABEL_5;
LABEL_11:
    self->_isLookAroundEntryIconShown = *((_BYTE *)v5 + 13);
    *(_BYTE *)&self->_flags |= 4u;
    if ((*((_BYTE *)v5 + 16) & 1) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_10:
  self->_isVenueExperienceShown = *((_BYTE *)v5 + 14);
  *(_BYTE *)&self->_flags |= 8u;
  v4 = *((_BYTE *)v5 + 16);
  if ((v4 & 4) != 0)
    goto LABEL_11;
LABEL_5:
  if ((v4 & 1) != 0)
  {
LABEL_6:
    self->_activeNavMode = *((_DWORD *)v5 + 2);
    *(_BYTE *)&self->_flags |= 1u;
  }
LABEL_7:

}

@end
