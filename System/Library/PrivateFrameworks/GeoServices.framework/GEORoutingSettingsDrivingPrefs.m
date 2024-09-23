@implementation GEORoutingSettingsDrivingPrefs

- (BOOL)avoidHighways
{
  return self->_avoidHighways;
}

- (void)setAvoidHighways:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_avoidHighways = a3;
}

- (void)setHasAvoidHighways:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasAvoidHighways
{
  return *(_BYTE *)&self->_flags & 1;
}

- (BOOL)avoidTolls
{
  return self->_avoidTolls;
}

- (void)setAvoidTolls:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 2u;
  self->_avoidTolls = a3;
}

- (void)setHasAvoidTolls:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasAvoidTolls
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (BOOL)speedLimitEnabled
{
  return self->_speedLimitEnabled;
}

- (void)setSpeedLimitEnabled:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 4u;
  self->_speedLimitEnabled = a3;
}

- (void)setHasSpeedLimitEnabled:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasSpeedLimitEnabled
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (BOOL)trafficEnabled
{
  return self->_trafficEnabled;
}

- (void)setTrafficEnabled:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 8u;
  self->_trafficEnabled = a3;
}

- (void)setHasTrafficEnabled:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xF7 | v3;
}

- (BOOL)hasTrafficEnabled
{
  return (*(_BYTE *)&self->_flags >> 3) & 1;
}

- (BOOL)voiceNavEnabled
{
  return self->_voiceNavEnabled;
}

- (void)setVoiceNavEnabled:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 0x10u;
  self->_voiceNavEnabled = a3;
}

- (void)setHasVoiceNavEnabled:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xEF | v3;
}

- (BOOL)hasVoiceNavEnabled
{
  return (*(_BYTE *)&self->_flags >> 4) & 1;
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
  v8.super_class = (Class)GEORoutingSettingsDrivingPrefs;
  -[GEORoutingSettingsDrivingPrefs description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORoutingSettingsDrivingPrefs dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORoutingSettingsDrivingPrefs _dictionaryRepresentation:]((unsigned __int8 *)self, 0);
}

- (id)_dictionaryRepresentation:(unsigned __int8 *)a1
{
  void *v4;
  unsigned __int8 v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  const __CFString *v15;

  if (!a1)
  {
    v4 = 0;
    return v4;
  }
  objc_msgSend(a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = a1[16];
  if ((v5 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a1[8]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v7 = CFSTR("avoidHighways");
    else
      v7 = CFSTR("avoid_highways");
    objc_msgSend(v4, "setObject:forKey:", v6, v7);

    v5 = a1[16];
  }
  if ((v5 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a1[9]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v9 = CFSTR("avoidTolls");
    else
      v9 = CFSTR("avoid_tolls");
    objc_msgSend(v4, "setObject:forKey:", v8, v9);

    v5 = a1[16];
    if ((v5 & 4) == 0)
    {
LABEL_9:
      if ((v5 & 8) == 0)
        goto LABEL_10;
      goto LABEL_20;
    }
  }
  else if ((v5 & 4) == 0)
  {
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a1[10]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v11 = CFSTR("speedLimitEnabled");
  else
    v11 = CFSTR("speed_limit_enabled");
  objc_msgSend(v4, "setObject:forKey:", v10, v11);

  v5 = a1[16];
  if ((v5 & 8) == 0)
  {
LABEL_10:
    if ((v5 & 0x10) == 0)
      return v4;
    goto LABEL_24;
  }
LABEL_20:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a1[11]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v13 = CFSTR("trafficEnabled");
  else
    v13 = CFSTR("traffic_enabled");
  objc_msgSend(v4, "setObject:forKey:", v12, v13);

  if ((a1[16] & 0x10) != 0)
  {
LABEL_24:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a1[12]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v15 = CFSTR("voiceNavEnabled");
    else
      v15 = CFSTR("voice_nav_enabled");
    objc_msgSend(v4, "setObject:forKey:", v14, v15);

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEORoutingSettingsDrivingPrefs _dictionaryRepresentation:]((unsigned __int8 *)self, 1);
}

- (GEORoutingSettingsDrivingPrefs)initWithDictionary:(id)a3
{
  return (GEORoutingSettingsDrivingPrefs *)-[GEORoutingSettingsDrivingPrefs _initWithDictionary:isJSON:](self, a3, 0);
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

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("avoidHighways");
      else
        v6 = CFSTR("avoid_highways");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setAvoidHighways:", objc_msgSend(v7, "BOOLValue"));

      if (a3)
        v8 = CFSTR("avoidTolls");
      else
        v8 = CFSTR("avoid_tolls");
      objc_msgSend(v5, "objectForKeyedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setAvoidTolls:", objc_msgSend(v9, "BOOLValue"));

      if (a3)
        v10 = CFSTR("speedLimitEnabled");
      else
        v10 = CFSTR("speed_limit_enabled");
      objc_msgSend(v5, "objectForKeyedSubscript:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setSpeedLimitEnabled:", objc_msgSend(v11, "BOOLValue"));

      if (a3)
        v12 = CFSTR("trafficEnabled");
      else
        v12 = CFSTR("traffic_enabled");
      objc_msgSend(v5, "objectForKeyedSubscript:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setTrafficEnabled:", objc_msgSend(v13, "BOOLValue"));

      if (a3)
        v14 = CFSTR("voiceNavEnabled");
      else
        v14 = CFSTR("voice_nav_enabled");
      objc_msgSend(v5, "objectForKeyedSubscript:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setVoiceNavEnabled:", objc_msgSend(v15, "BOOLValue"));

    }
  }

  return a1;
}

- (GEORoutingSettingsDrivingPrefs)initWithJSON:(id)a3
{
  return (GEORoutingSettingsDrivingPrefs *)-[GEORoutingSettingsDrivingPrefs _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEORoutingSettingsDrivingPrefsIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORoutingSettingsDrivingPrefsReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  char flags;
  id v5;

  v5 = a3;
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    PBDataWriterWriteBOOLField();
    flags = (char)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_3:
      if ((flags & 4) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  flags = (char)self->_flags;
  if ((flags & 4) == 0)
  {
LABEL_4:
    if ((flags & 8) == 0)
      goto LABEL_5;
LABEL_11:
    PBDataWriterWriteBOOLField();
    if ((*(_BYTE *)&self->_flags & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_10:
  PBDataWriterWriteBOOLField();
  flags = (char)self->_flags;
  if ((flags & 8) != 0)
    goto LABEL_11;
LABEL_5:
  if ((flags & 0x10) != 0)
LABEL_6:
    PBDataWriterWriteBOOLField();
LABEL_7:

}

- (void)copyTo:(id)a3
{
  char flags;
  _BYTE *v5;

  v5 = a3;
  -[GEORoutingSettingsDrivingPrefs readAll:](self, "readAll:", 0);
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    v5[8] = self->_avoidHighways;
    v5[16] |= 1u;
    flags = (char)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_3:
      if ((flags & 4) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 2) == 0)
  {
    goto LABEL_3;
  }
  v5[9] = self->_avoidTolls;
  v5[16] |= 2u;
  flags = (char)self->_flags;
  if ((flags & 4) == 0)
  {
LABEL_4:
    if ((flags & 8) == 0)
      goto LABEL_5;
LABEL_11:
    v5[11] = self->_trafficEnabled;
    v5[16] |= 8u;
    if ((*(_BYTE *)&self->_flags & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_10:
  v5[10] = self->_speedLimitEnabled;
  v5[16] |= 4u;
  flags = (char)self->_flags;
  if ((flags & 8) != 0)
    goto LABEL_11;
LABEL_5:
  if ((flags & 0x10) != 0)
  {
LABEL_6:
    v5[12] = self->_voiceNavEnabled;
    v5[16] |= 0x10u;
  }
LABEL_7:

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char flags;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    *((_BYTE *)result + 8) = self->_avoidHighways;
    *((_BYTE *)result + 16) |= 1u;
    flags = (char)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_3:
      if ((flags & 4) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_BYTE *)result + 9) = self->_avoidTolls;
  *((_BYTE *)result + 16) |= 2u;
  flags = (char)self->_flags;
  if ((flags & 4) == 0)
  {
LABEL_4:
    if ((flags & 8) == 0)
      goto LABEL_5;
    goto LABEL_11;
  }
LABEL_10:
  *((_BYTE *)result + 10) = self->_speedLimitEnabled;
  *((_BYTE *)result + 16) |= 4u;
  flags = (char)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_5:
    if ((flags & 0x10) == 0)
      return result;
    goto LABEL_6;
  }
LABEL_11:
  *((_BYTE *)result + 11) = self->_trafficEnabled;
  *((_BYTE *)result + 16) |= 8u;
  if ((*(_BYTE *)&self->_flags & 0x10) == 0)
    return result;
LABEL_6:
  *((_BYTE *)result + 12) = self->_voiceNavEnabled;
  *((_BYTE *)result + 16) |= 0x10u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_36;
  -[GEORoutingSettingsDrivingPrefs readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((v4[16] & 1) == 0)
      goto LABEL_36;
    if (self->_avoidHighways)
    {
      if (!v4[8])
        goto LABEL_36;
    }
    else if (v4[8])
    {
      goto LABEL_36;
    }
  }
  else if ((v4[16] & 1) != 0)
  {
    goto LABEL_36;
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((v4[16] & 2) == 0)
      goto LABEL_36;
    if (self->_avoidTolls)
    {
      if (!v4[9])
        goto LABEL_36;
    }
    else if (v4[9])
    {
      goto LABEL_36;
    }
  }
  else if ((v4[16] & 2) != 0)
  {
    goto LABEL_36;
  }
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    if ((v4[16] & 4) == 0)
      goto LABEL_36;
    if (self->_speedLimitEnabled)
    {
      if (!v4[10])
        goto LABEL_36;
    }
    else if (v4[10])
    {
      goto LABEL_36;
    }
  }
  else if ((v4[16] & 4) != 0)
  {
    goto LABEL_36;
  }
  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
    if ((v4[16] & 8) == 0)
      goto LABEL_36;
    if (self->_trafficEnabled)
    {
      if (!v4[11])
        goto LABEL_36;
    }
    else if (v4[11])
    {
      goto LABEL_36;
    }
  }
  else if ((v4[16] & 8) != 0)
  {
    goto LABEL_36;
  }
  v5 = (v4[16] & 0x10) == 0;
  if ((*(_BYTE *)&self->_flags & 0x10) != 0)
  {
    if ((v4[16] & 0x10) != 0)
    {
      if (self->_voiceNavEnabled)
      {
        if (!v4[12])
          goto LABEL_36;
      }
      else if (v4[12])
      {
        goto LABEL_36;
      }
      v5 = 1;
      goto LABEL_37;
    }
LABEL_36:
    v5 = 0;
  }
LABEL_37:

  return v5;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  -[GEORoutingSettingsDrivingPrefs readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    v3 = 2654435761 * self->_avoidHighways;
    if ((*(_BYTE *)&self->_flags & 2) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_avoidTolls;
      if ((*(_BYTE *)&self->_flags & 4) != 0)
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  else
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_flags & 2) != 0)
      goto LABEL_3;
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
LABEL_4:
    v5 = 2654435761 * self->_speedLimitEnabled;
    if ((*(_BYTE *)&self->_flags & 8) != 0)
      goto LABEL_5;
LABEL_10:
    v6 = 0;
    if ((*(_BYTE *)&self->_flags & 0x10) != 0)
      goto LABEL_6;
LABEL_11:
    v7 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7;
  }
LABEL_9:
  v5 = 0;
  if ((*(_BYTE *)&self->_flags & 8) == 0)
    goto LABEL_10;
LABEL_5:
  v6 = 2654435761 * self->_trafficEnabled;
  if ((*(_BYTE *)&self->_flags & 0x10) == 0)
    goto LABEL_11;
LABEL_6:
  v7 = 2654435761 * self->_voiceNavEnabled;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  BOOL v4;
  BOOL *v5;

  v5 = (BOOL *)a3;
  objc_msgSend(v5, "readAll:", 0);
  v4 = v5[16];
  if (v4)
  {
    self->_avoidHighways = v5[8];
    *(_BYTE *)&self->_flags |= 1u;
    v4 = v5[16];
    if ((v4 & 2) == 0)
    {
LABEL_3:
      if ((v4 & 4) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((v5[16] & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_avoidTolls = v5[9];
  *(_BYTE *)&self->_flags |= 2u;
  v4 = v5[16];
  if ((v4 & 4) == 0)
  {
LABEL_4:
    if ((v4 & 8) == 0)
      goto LABEL_5;
LABEL_11:
    self->_trafficEnabled = v5[11];
    *(_BYTE *)&self->_flags |= 8u;
    if ((v5[16] & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_10:
  self->_speedLimitEnabled = v5[10];
  *(_BYTE *)&self->_flags |= 4u;
  v4 = v5[16];
  if ((v4 & 8) != 0)
    goto LABEL_11;
LABEL_5:
  if ((v4 & 0x10) != 0)
  {
LABEL_6:
    self->_voiceNavEnabled = v5[12];
    *(_BYTE *)&self->_flags |= 0x10u;
  }
LABEL_7:

}

@end
