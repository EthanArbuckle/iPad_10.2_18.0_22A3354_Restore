@implementation GEONavVoiceGuidanceSettings

- (int)navVoiceGuidanceLevel
{
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    return self->_navVoiceGuidanceLevel;
  else
    return 0;
}

- (void)setNavVoiceGuidanceLevel:(int)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_navVoiceGuidanceLevel = a3;
}

- (void)setHasNavVoiceGuidanceLevel:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasNavVoiceGuidanceLevel
{
  return *(_BYTE *)&self->_flags & 1;
}

- (id)navVoiceGuidanceLevelAsString:(int)a3
{
  if (a3 < 4)
    return off_1E1C23248[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsNavVoiceGuidanceLevel:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LEVEL_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LEVEL_NONE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LEVEL_INCIDENTS")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("LEVEL_FULL")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)transportMode
{
  if ((*(_BYTE *)&self->_flags & 2) != 0)
    return self->_transportMode;
  else
    return 0;
}

- (void)setTransportMode:(int)a3
{
  *(_BYTE *)&self->_flags |= 2u;
  self->_transportMode = a3;
}

- (void)setHasTransportMode:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasTransportMode
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (id)transportModeAsString:(int)a3
{
  if (a3 < 6)
    return off_1E1C23268[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsTransportMode:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_TRANSPORT_MODE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DRIVING_MODE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WALKING_MODE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRANSIT_MODE")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RIDESHARE_MODE")) & 1) != 0)
  {
    v4 = 4;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("CYCLING_MODE")))
  {
    v4 = 5;
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
  v8.super_class = (Class)GEONavVoiceGuidanceSettings;
  -[GEONavVoiceGuidanceSettings description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEONavVoiceGuidanceSettings dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEONavVoiceGuidanceSettings _dictionaryRepresentation:]((uint64_t)self, 0);
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

  if (a1)
  {
    objc_msgSend((id)a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_BYTE *)(a1 + 16);
    if ((v5 & 1) != 0)
    {
      v6 = *(int *)(a1 + 8);
      if (v6 >= 4)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 8));
        v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v7 = off_1E1C23248[v6];
      }
      if (a2)
        v8 = CFSTR("navVoiceGuidanceLevel");
      else
        v8 = CFSTR("nav_voice_guidance_level");
      objc_msgSend(v4, "setObject:forKey:", v7, v8);

      v5 = *(_BYTE *)(a1 + 16);
    }
    if ((v5 & 2) != 0)
    {
      v9 = *(int *)(a1 + 12);
      if (v9 >= 6)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 12));
        v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v10 = off_1E1C23268[v9];
      }
      if (a2)
        v11 = CFSTR("transportMode");
      else
        v11 = CFSTR("transport_mode");
      objc_msgSend(v4, "setObject:forKey:", v10, v11);

    }
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEONavVoiceGuidanceSettings _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEONavVoiceGuidanceSettings)initWithDictionary:(id)a3
{
  return (GEONavVoiceGuidanceSettings *)-[GEONavVoiceGuidanceSettings _initWithDictionary:isJSON:](self, a3, 0);
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

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("navVoiceGuidanceLevel");
      else
        v6 = CFSTR("nav_voice_guidance_level");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = v7;
        if ((objc_msgSend(v8, "isEqualToString:", CFSTR("LEVEL_UNKNOWN")) & 1) != 0)
        {
          v9 = 0;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("LEVEL_NONE")) & 1) != 0)
        {
          v9 = 1;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("LEVEL_INCIDENTS")) & 1) != 0)
        {
          v9 = 2;
        }
        else if (objc_msgSend(v8, "isEqualToString:", CFSTR("LEVEL_FULL")))
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
      objc_msgSend(a1, "setNavVoiceGuidanceLevel:", v9);
LABEL_20:

      if (a3)
        v10 = CFSTR("transportMode");
      else
        v10 = CFSTR("transport_mode");
      objc_msgSend(v5, "objectForKeyedSubscript:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v12 = v11;
        if ((objc_msgSend(v12, "isEqualToString:", CFSTR("UNKNOWN_TRANSPORT_MODE")) & 1) != 0)
        {
          v13 = 0;
        }
        else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("DRIVING_MODE")) & 1) != 0)
        {
          v13 = 1;
        }
        else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("WALKING_MODE")) & 1) != 0)
        {
          v13 = 2;
        }
        else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("TRANSIT_MODE")) & 1) != 0)
        {
          v13 = 3;
        }
        else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("RIDESHARE_MODE")) & 1) != 0)
        {
          v13 = 4;
        }
        else if (objc_msgSend(v12, "isEqualToString:", CFSTR("CYCLING_MODE")))
        {
          v13 = 5;
        }
        else
        {
          v13 = 0;
        }

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_41:

          goto LABEL_42;
        }
        v13 = objc_msgSend(v11, "intValue");
      }
      objc_msgSend(a1, "setTransportMode:", v13);
      goto LABEL_41;
    }
  }
LABEL_42:

  return a1;
}

- (GEONavVoiceGuidanceSettings)initWithJSON:(id)a3
{
  return (GEONavVoiceGuidanceSettings *)-[GEONavVoiceGuidanceSettings _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEONavVoiceGuidanceSettingsIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEONavVoiceGuidanceSettingsReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char flags;
  id v6;

  v4 = a3;
  flags = (char)self->_flags;
  v6 = v4;
  if ((flags & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
    flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
  }

}

- (void)copyTo:(id)a3
{
  char flags;
  _DWORD *v5;

  v5 = a3;
  -[GEONavVoiceGuidanceSettings readAll:](self, "readAll:", 0);
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    v5[2] = self->_navVoiceGuidanceLevel;
    *((_BYTE *)v5 + 16) |= 1u;
    flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    v5[3] = self->_transportMode;
    *((_BYTE *)v5 + 16) |= 2u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char flags;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    *((_DWORD *)result + 2) = self->_navVoiceGuidanceLevel;
    *((_BYTE *)result + 16) |= 1u;
    flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *((_DWORD *)result + 3) = self->_transportMode;
    *((_BYTE *)result + 16) |= 2u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_11;
  -[GEONavVoiceGuidanceSettings readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 16) & 1) == 0 || self->_navVoiceGuidanceLevel != *((_DWORD *)v4 + 2))
      goto LABEL_11;
  }
  else if ((*((_BYTE *)v4 + 16) & 1) != 0)
  {
LABEL_11:
    v5 = 0;
    goto LABEL_12;
  }
  v5 = (*((_BYTE *)v4 + 16) & 2) == 0;
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 16) & 2) == 0 || self->_transportMode != *((_DWORD *)v4 + 3))
      goto LABEL_11;
    v5 = 1;
  }
LABEL_12:

  return v5;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;

  -[GEONavVoiceGuidanceSettings readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    v3 = 2654435761 * self->_navVoiceGuidanceLevel;
    if ((*(_BYTE *)&self->_flags & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v4 = 0;
    return v4 ^ v3;
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_flags & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v4 = 2654435761 * self->_transportMode;
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  char v4;
  int *v5;

  v5 = (int *)a3;
  objc_msgSend(v5, "readAll:", 0);
  v4 = *((_BYTE *)v5 + 16);
  if ((v4 & 1) != 0)
  {
    self->_navVoiceGuidanceLevel = v5[2];
    *(_BYTE *)&self->_flags |= 1u;
    v4 = *((_BYTE *)v5 + 16);
  }
  if ((v4 & 2) != 0)
  {
    self->_transportMode = v5[3];
    *(_BYTE *)&self->_flags |= 2u;
  }

}

@end
