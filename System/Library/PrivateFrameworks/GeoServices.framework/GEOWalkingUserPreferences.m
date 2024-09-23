@implementation GEOWalkingUserPreferences

- (BOOL)avoidStairs
{
  return self->_avoidStairs;
}

- (void)setAvoidStairs:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 4u;
  self->_avoidStairs = a3;
}

- (void)setHasAvoidStairs:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasAvoidStairs
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (BOOL)avoidHills
{
  return self->_avoidHills;
}

- (void)setAvoidHills:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 2u;
  self->_avoidHills = a3;
}

- (void)setHasAvoidHills:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasAvoidHills
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (BOOL)avoidBusyRoads
{
  return self->_avoidBusyRoads;
}

- (void)setAvoidBusyRoads:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_avoidBusyRoads = a3;
}

- (void)setHasAvoidBusyRoads:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasAvoidBusyRoads
{
  return *(_BYTE *)&self->_flags & 1;
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
  v8.super_class = (Class)GEOWalkingUserPreferences;
  -[GEOWalkingUserPreferences description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOWalkingUserPreferences dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOWalkingUserPreferences _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  char v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v15;
  const __CFString *v16;
  void *v17;
  const __CFString *v18;
  _QWORD v19[4];
  id v20;

  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_BYTE *)(a1 + 20);
  if ((v5 & 4) == 0)
  {
    if ((*(_BYTE *)(a1 + 20) & 2) == 0)
      goto LABEL_4;
LABEL_19:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 17));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v18 = CFSTR("avoidHills");
    else
      v18 = CFSTR("avoid_hills");
    objc_msgSend(v4, "setObject:forKey:", v17, v18);

    if ((*(_BYTE *)(a1 + 20) & 1) == 0)
      goto LABEL_9;
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 18));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v16 = CFSTR("avoidStairs");
  else
    v16 = CFSTR("avoid_stairs");
  objc_msgSend(v4, "setObject:forKey:", v15, v16);

  v5 = *(_BYTE *)(a1 + 20);
  if ((v5 & 2) != 0)
    goto LABEL_19;
LABEL_4:
  if ((v5 & 1) != 0)
  {
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 16));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v7 = CFSTR("avoidBusyRoads");
    else
      v7 = CFSTR("avoid_busy_roads");
    objc_msgSend(v4, "setObject:forKey:", v6, v7);

  }
LABEL_9:
  v8 = *(void **)(a1 + 8);
  if (v8)
  {
    objc_msgSend(v8, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v9, "count"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __55__GEOWalkingUserPreferences__dictionaryRepresentation___block_invoke;
      v19[3] = &unk_1E1C00600;
      v12 = v11;
      v20 = v12;
      objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v19);
      v13 = v12;

      v10 = v13;
    }
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOWalkingUserPreferences _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __55__GEOWalkingUserPreferences__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOWalkingUserPreferences)initWithDictionary:(id)a3
{
  return (GEOWalkingUserPreferences *)-[GEOCyclingUserPreferences _initWithDictionary:isJSON:](self, a3, 0);
}

- (GEOWalkingUserPreferences)initWithJSON:(id)a3
{
  return (GEOWalkingUserPreferences *)-[GEOCyclingUserPreferences _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOWalkingUserPreferencesIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOWalkingUserPreferencesReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  char flags;
  id v5;

  v5 = a3;
  flags = (char)self->_flags;
  if ((flags & 4) == 0)
  {
    if ((*(_BYTE *)&self->_flags & 2) == 0)
      goto LABEL_3;
LABEL_7:
    PBDataWriterWriteBOOLField();
    if ((*(_BYTE *)&self->_flags & 1) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  PBDataWriterWriteBOOLField();
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
    goto LABEL_7;
LABEL_3:
  if ((flags & 1) != 0)
LABEL_4:
    PBDataWriterWriteBOOLField();
LABEL_5:
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v5);

}

- (void)copyTo:(id)a3
{
  char flags;
  _BYTE *v5;

  v5 = a3;
  -[GEOWalkingUserPreferences readAll:](self, "readAll:", 0);
  flags = (char)self->_flags;
  if ((flags & 4) == 0)
  {
    if ((*(_BYTE *)&self->_flags & 2) == 0)
      goto LABEL_3;
LABEL_7:
    v5[17] = self->_avoidHills;
    v5[20] |= 2u;
    if ((*(_BYTE *)&self->_flags & 1) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  v5[18] = self->_avoidStairs;
  v5[20] |= 4u;
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
    goto LABEL_7;
LABEL_3:
  if ((flags & 1) != 0)
  {
LABEL_4:
    v5[16] = self->_avoidBusyRoads;
    v5[20] |= 1u;
  }
LABEL_5:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  void *v5;
  char flags;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = (void *)v4;
  flags = (char)self->_flags;
  if ((flags & 4) == 0)
  {
    if ((*(_BYTE *)&self->_flags & 2) == 0)
      goto LABEL_3;
LABEL_7:
    *(_BYTE *)(v4 + 17) = self->_avoidHills;
    *(_BYTE *)(v4 + 20) |= 2u;
    if ((*(_BYTE *)&self->_flags & 1) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  *(_BYTE *)(v4 + 18) = self->_avoidStairs;
  *(_BYTE *)(v4 + 20) |= 4u;
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
    goto LABEL_7;
LABEL_3:
  if ((flags & 1) != 0)
  {
LABEL_4:
    *(_BYTE *)(v4 + 16) = self->_avoidBusyRoads;
    *(_BYTE *)(v4 + 20) |= 1u;
  }
LABEL_5:
  objc_storeStrong((id *)(v4 + 8), self->_unknownFields);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_20;
  -[GEOWalkingUserPreferences readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    if ((v4[20] & 4) == 0)
      goto LABEL_20;
    if (self->_avoidStairs)
    {
      if (!v4[18])
        goto LABEL_20;
    }
    else if (v4[18])
    {
      goto LABEL_20;
    }
  }
  else if ((v4[20] & 4) != 0)
  {
    goto LABEL_20;
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((v4[20] & 2) == 0)
      goto LABEL_20;
    if (self->_avoidHills)
    {
      if (!v4[17])
        goto LABEL_20;
    }
    else if (v4[17])
    {
      goto LABEL_20;
    }
  }
  else if ((v4[20] & 2) != 0)
  {
    goto LABEL_20;
  }
  v5 = (v4[20] & 1) == 0;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((v4[20] & 1) != 0)
    {
      if (self->_avoidBusyRoads)
      {
        if (!v4[16])
          goto LABEL_20;
      }
      else if (v4[16])
      {
        goto LABEL_20;
      }
      v5 = 1;
      goto LABEL_21;
    }
LABEL_20:
    v5 = 0;
  }
LABEL_21:

  return v5;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  -[GEOWalkingUserPreferences readAll:](self, "readAll:", 1);
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
  v3 = 2654435761 * self->_avoidStairs;
  if ((*(_BYTE *)&self->_flags & 2) == 0)
    goto LABEL_6;
LABEL_3:
  v4 = 2654435761 * self->_avoidHills;
  if ((*(_BYTE *)&self->_flags & 1) == 0)
    goto LABEL_7;
LABEL_4:
  v5 = 2654435761 * self->_avoidBusyRoads;
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  BOOL v4;
  BOOL *v5;

  v5 = (BOOL *)a3;
  objc_msgSend(v5, "readAll:", 0);
  v4 = v5[20];
  if ((v4 & 4) == 0)
  {
    if ((v5[20] & 2) == 0)
      goto LABEL_3;
LABEL_7:
    self->_avoidHills = v5[17];
    *(_BYTE *)&self->_flags |= 2u;
    if (!v5[20])
      goto LABEL_5;
    goto LABEL_4;
  }
  self->_avoidStairs = v5[18];
  *(_BYTE *)&self->_flags |= 4u;
  v4 = v5[20];
  if ((v4 & 2) != 0)
    goto LABEL_7;
LABEL_3:
  if (v4)
  {
LABEL_4:
    self->_avoidBusyRoads = v5[16];
    *(_BYTE *)&self->_flags |= 1u;
  }
LABEL_5:

}

- (PBUnknownFields)unknownFields
{
  return self->_unknownFields;
}

- (void)clearUnknownFields:(BOOL)a3
{
  _BOOL4 v3;
  PBUnknownFields *unknownFields;

  v3 = a3;
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
    -[GEOWalkingUserPreferences readAll:](self, "readAll:", 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end
