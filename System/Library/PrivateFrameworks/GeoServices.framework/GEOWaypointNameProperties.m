@implementation GEOWaypointNameProperties

- (BOOL)hasDisplayName
{
  return self->_hasDisplayName;
}

- (void)setHasDisplayName:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 2u;
  self->_hasDisplayName = a3;
}

- (void)setHasHasDisplayName:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasHasDisplayName
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (BOOL)hasSpokenName
{
  return self->_hasSpokenName;
}

- (void)setHasSpokenName:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 8u;
  self->_hasSpokenName = a3;
}

- (void)setHasHasSpokenName:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xF7 | v3;
}

- (BOOL)hasHasSpokenName
{
  return (*(_BYTE *)&self->_flags >> 3) & 1;
}

- (BOOL)hasDisplayAddress
{
  return self->_hasDisplayAddress;
}

- (void)setHasDisplayAddress:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_hasDisplayAddress = a3;
}

- (void)setHasHasDisplayAddress:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasHasDisplayAddress
{
  return *(_BYTE *)&self->_flags & 1;
}

- (BOOL)hasSpokenAddress
{
  return self->_hasSpokenAddress;
}

- (void)setHasSpokenAddress:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 4u;
  self->_hasSpokenAddress = a3;
}

- (void)setHasHasSpokenAddress:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasHasSpokenAddress
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
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
  v8.super_class = (Class)GEOWaypointNameProperties;
  -[GEOWaypointNameProperties description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOWaypointNameProperties dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOWaypointNameProperties _dictionaryRepresentation:]((uint64_t)self, 0);
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
  void *v19;
  const __CFString *v20;
  _QWORD v21[4];
  id v22;

  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_BYTE *)(a1 + 20);
  if ((v5 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 17));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v16 = CFSTR("hasDisplayName");
    else
      v16 = CFSTR("has_display_name");
    objc_msgSend(v4, "setObject:forKey:", v15, v16);

    v5 = *(_BYTE *)(a1 + 20);
    if ((v5 & 8) == 0)
    {
LABEL_4:
      if ((v5 & 1) == 0)
        goto LABEL_5;
LABEL_24:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 16));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
        v20 = CFSTR("hasDisplayAddress");
      else
        v20 = CFSTR("has_display_address");
      objc_msgSend(v4, "setObject:forKey:", v19, v20);

      if ((*(_BYTE *)(a1 + 20) & 4) == 0)
        goto LABEL_10;
      goto LABEL_6;
    }
  }
  else if ((*(_BYTE *)(a1 + 20) & 8) == 0)
  {
    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 19));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v18 = CFSTR("hasSpokenName");
  else
    v18 = CFSTR("has_spoken_name");
  objc_msgSend(v4, "setObject:forKey:", v17, v18);

  v5 = *(_BYTE *)(a1 + 20);
  if ((v5 & 1) != 0)
    goto LABEL_24;
LABEL_5:
  if ((v5 & 4) != 0)
  {
LABEL_6:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 18));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v7 = CFSTR("hasSpokenAddress");
    else
      v7 = CFSTR("has_spoken_address");
    objc_msgSend(v4, "setObject:forKey:", v6, v7);

  }
LABEL_10:
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
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __55__GEOWaypointNameProperties__dictionaryRepresentation___block_invoke;
      v21[3] = &unk_1E1C00600;
      v12 = v11;
      v22 = v12;
      objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v21);
      v13 = v12;

      v10 = v13;
    }
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOWaypointNameProperties _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __55__GEOWaypointNameProperties__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOWaypointNameProperties)initWithDictionary:(id)a3
{
  return (GEOWaypointNameProperties *)-[GEOWaypointNameProperties _initWithDictionary:isJSON:](self, a3, 0);
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

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("hasDisplayName");
      else
        v6 = CFSTR("has_display_name");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setHasDisplayName:", objc_msgSend(v7, "BOOLValue"));

      if (a3)
        v8 = CFSTR("hasSpokenName");
      else
        v8 = CFSTR("has_spoken_name");
      objc_msgSend(v5, "objectForKeyedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setHasSpokenName:", objc_msgSend(v9, "BOOLValue"));

      if (a3)
        v10 = CFSTR("hasDisplayAddress");
      else
        v10 = CFSTR("has_display_address");
      objc_msgSend(v5, "objectForKeyedSubscript:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setHasDisplayAddress:", objc_msgSend(v11, "BOOLValue"));

      if (a3)
        v12 = CFSTR("hasSpokenAddress");
      else
        v12 = CFSTR("has_spoken_address");
      objc_msgSend(v5, "objectForKeyedSubscript:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setHasSpokenAddress:", objc_msgSend(v13, "BOOLValue"));

    }
  }

  return a1;
}

- (GEOWaypointNameProperties)initWithJSON:(id)a3
{
  return (GEOWaypointNameProperties *)-[GEOWaypointNameProperties _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOWaypointNamePropertiesIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOWaypointNamePropertiesReadAllFrom((uint64_t)self, a3);
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
    if ((flags & 8) == 0)
    {
LABEL_3:
      if ((flags & 1) == 0)
        goto LABEL_4;
LABEL_9:
      PBDataWriterWriteBOOLField();
      if ((*(_BYTE *)&self->_flags & 4) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
    goto LABEL_9;
LABEL_4:
  if ((flags & 4) != 0)
LABEL_5:
    PBDataWriterWriteBOOLField();
LABEL_6:
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v5);

}

- (void)copyTo:(id)a3
{
  char flags;
  _BYTE *v5;

  v5 = a3;
  -[GEOWaypointNameProperties readAll:](self, "readAll:", 0);
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    v5[17] = self->_hasDisplayName;
    v5[20] |= 2u;
    flags = (char)self->_flags;
    if ((flags & 8) == 0)
    {
LABEL_3:
      if ((flags & 1) == 0)
        goto LABEL_4;
LABEL_9:
      v5[16] = self->_hasDisplayAddress;
      v5[20] |= 1u;
      if ((*(_BYTE *)&self->_flags & 4) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 8) == 0)
  {
    goto LABEL_3;
  }
  v5[19] = self->_hasSpokenName;
  v5[20] |= 8u;
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
    goto LABEL_9;
LABEL_4:
  if ((flags & 4) != 0)
  {
LABEL_5:
    v5[18] = self->_hasSpokenAddress;
    v5[20] |= 4u;
  }
LABEL_6:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  void *v5;
  char flags;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = (void *)v4;
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *(_BYTE *)(v4 + 17) = self->_hasDisplayName;
    *(_BYTE *)(v4 + 20) |= 2u;
    flags = (char)self->_flags;
    if ((flags & 8) == 0)
    {
LABEL_3:
      if ((flags & 1) == 0)
        goto LABEL_4;
LABEL_9:
      *(_BYTE *)(v4 + 16) = self->_hasDisplayAddress;
      *(_BYTE *)(v4 + 20) |= 1u;
      if ((*(_BYTE *)&self->_flags & 4) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 8) == 0)
  {
    goto LABEL_3;
  }
  *(_BYTE *)(v4 + 19) = self->_hasSpokenName;
  *(_BYTE *)(v4 + 20) |= 8u;
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
    goto LABEL_9;
LABEL_4:
  if ((flags & 4) != 0)
  {
LABEL_5:
    *(_BYTE *)(v4 + 18) = self->_hasSpokenAddress;
    *(_BYTE *)(v4 + 20) |= 4u;
  }
LABEL_6:
  objc_storeStrong((id *)(v4 + 8), self->_unknownFields);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_28;
  -[GEOWaypointNameProperties readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((v4[20] & 2) == 0)
      goto LABEL_28;
    if (self->_hasDisplayName)
    {
      if (!v4[17])
        goto LABEL_28;
    }
    else if (v4[17])
    {
      goto LABEL_28;
    }
  }
  else if ((v4[20] & 2) != 0)
  {
    goto LABEL_28;
  }
  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
    if ((v4[20] & 8) == 0)
      goto LABEL_28;
    if (self->_hasSpokenName)
    {
      if (!v4[19])
        goto LABEL_28;
    }
    else if (v4[19])
    {
      goto LABEL_28;
    }
  }
  else if ((v4[20] & 8) != 0)
  {
    goto LABEL_28;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((v4[20] & 1) == 0)
      goto LABEL_28;
    if (self->_hasDisplayAddress)
    {
      if (!v4[16])
        goto LABEL_28;
    }
    else if (v4[16])
    {
      goto LABEL_28;
    }
  }
  else if ((v4[20] & 1) != 0)
  {
    goto LABEL_28;
  }
  v5 = (v4[20] & 4) == 0;
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    if ((v4[20] & 4) != 0)
    {
      if (self->_hasSpokenAddress)
      {
        if (!v4[18])
          goto LABEL_28;
      }
      else if (v4[18])
      {
        goto LABEL_28;
      }
      v5 = 1;
      goto LABEL_29;
    }
LABEL_28:
    v5 = 0;
  }
LABEL_29:

  return v5;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  -[GEOWaypointNameProperties readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    v3 = 2654435761 * self->_hasDisplayName;
    if ((*(_BYTE *)&self->_flags & 8) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_hasSpokenName;
      if ((*(_BYTE *)&self->_flags & 1) != 0)
        goto LABEL_4;
LABEL_8:
      v5 = 0;
      if ((*(_BYTE *)&self->_flags & 4) != 0)
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
  if ((*(_BYTE *)&self->_flags & 1) == 0)
    goto LABEL_8;
LABEL_4:
  v5 = 2654435761 * self->_hasDisplayAddress;
  if ((*(_BYTE *)&self->_flags & 4) == 0)
    goto LABEL_9;
LABEL_5:
  v6 = 2654435761 * self->_hasSpokenAddress;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  BOOL v4;
  BOOL *v5;

  v5 = (BOOL *)a3;
  objc_msgSend(v5, "readAll:", 0);
  v4 = v5[20];
  if ((v4 & 2) != 0)
  {
    self->_hasDisplayName = v5[17];
    *(_BYTE *)&self->_flags |= 2u;
    v4 = v5[20];
    if ((v4 & 8) == 0)
    {
LABEL_3:
      if (!v4)
        goto LABEL_4;
LABEL_9:
      self->_hasDisplayAddress = v5[16];
      *(_BYTE *)&self->_flags |= 1u;
      if ((v5[20] & 4) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((v5[20] & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_hasSpokenName = v5[19];
  *(_BYTE *)&self->_flags |= 8u;
  v4 = v5[20];
  if (v4)
    goto LABEL_9;
LABEL_4:
  if ((v4 & 4) != 0)
  {
LABEL_5:
    self->_hasSpokenAddress = v5[18];
    *(_BYTE *)&self->_flags |= 4u;
  }
LABEL_6:

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
    -[GEOWaypointNameProperties readAll:](self, "readAll:", 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end
