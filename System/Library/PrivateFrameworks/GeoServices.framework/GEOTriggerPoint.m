@implementation GEOTriggerPoint

- (unsigned)time
{
  return self->_time;
}

- (void)setTime:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 2u;
  self->_time = a3;
}

- (void)setHasTime:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasTime
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (unsigned)referenceOffsetCm
{
  return self->_referenceOffsetCm;
}

- (void)setReferenceOffsetCm:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_referenceOffsetCm = a3;
}

- (void)setHasReferenceOffsetCm:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasReferenceOffsetCm
{
  return *(_BYTE *)&self->_flags & 1;
}

- (BOOL)countBeforeReferenceOffset
{
  return self->_countBeforeReferenceOffset;
}

- (void)setCountBeforeReferenceOffset:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 8u;
  self->_countBeforeReferenceOffset = a3;
}

- (void)setHasCountBeforeReferenceOffset:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xF7 | v3;
}

- (BOOL)hasCountBeforeReferenceOffset
{
  return (*(_BYTE *)&self->_flags >> 3) & 1;
}

- (BOOL)allowsShifting
{
  return (*(_BYTE *)&self->_flags & 4) != 0 && self->_allowsShifting;
}

- (void)setAllowsShifting:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 4u;
  self->_allowsShifting = a3;
}

- (void)setHasAllowsShifting:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasAllowsShifting
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
  v8.super_class = (Class)GEOTriggerPoint;
  -[GEOTriggerPoint description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOTriggerPoint dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOTriggerPoint _dictionaryRepresentation:]((uint64_t)self, 0);
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
  void *v16;
  const __CFString *v17;
  void *v18;
  const __CFString *v19;
  _QWORD v20[4];
  id v21;

  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_BYTE *)(a1 + 28);
  if ((v5 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 20));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("time"));

    v5 = *(_BYTE *)(a1 + 28);
    if ((v5 & 1) == 0)
    {
LABEL_4:
      if ((v5 & 8) == 0)
        goto LABEL_5;
LABEL_21:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 25));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
        v19 = CFSTR("countBeforeReferenceOffset");
      else
        v19 = CFSTR("count_before_reference_offset");
      objc_msgSend(v4, "setObject:forKey:", v18, v19);

      if ((*(_BYTE *)(a1 + 28) & 4) == 0)
        goto LABEL_10;
      goto LABEL_6;
    }
  }
  else if ((*(_BYTE *)(a1 + 28) & 1) == 0)
  {
    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 16));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v17 = CFSTR("referenceOffsetCm");
  else
    v17 = CFSTR("reference_offset_cm");
  objc_msgSend(v4, "setObject:forKey:", v16, v17);

  v5 = *(_BYTE *)(a1 + 28);
  if ((v5 & 8) != 0)
    goto LABEL_21;
LABEL_5:
  if ((v5 & 4) != 0)
  {
LABEL_6:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 24));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v7 = CFSTR("allowsShifting");
    else
      v7 = CFSTR("allows_shifting");
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
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __45__GEOTriggerPoint__dictionaryRepresentation___block_invoke;
      v20[3] = &unk_1E1C00600;
      v12 = v11;
      v21 = v12;
      objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v20);
      v13 = v12;

      v10 = v13;
    }
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOTriggerPoint _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __45__GEOTriggerPoint__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOTriggerPoint)initWithDictionary:(id)a3
{
  return (GEOTriggerPoint *)-[GEOTriggerPoint _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  const __CFString *v11;
  void *v12;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("time"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setTime:", objc_msgSend(v6, "unsignedIntValue"));

      if (a3)
        v7 = CFSTR("referenceOffsetCm");
      else
        v7 = CFSTR("reference_offset_cm");
      objc_msgSend(v5, "objectForKeyedSubscript:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setReferenceOffsetCm:", objc_msgSend(v8, "unsignedIntValue"));

      if (a3)
        v9 = CFSTR("countBeforeReferenceOffset");
      else
        v9 = CFSTR("count_before_reference_offset");
      objc_msgSend(v5, "objectForKeyedSubscript:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setCountBeforeReferenceOffset:", objc_msgSend(v10, "BOOLValue"));

      if (a3)
        v11 = CFSTR("allowsShifting");
      else
        v11 = CFSTR("allows_shifting");
      objc_msgSend(v5, "objectForKeyedSubscript:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setAllowsShifting:", objc_msgSend(v12, "BOOLValue"));

    }
  }

  return a1;
}

- (GEOTriggerPoint)initWithJSON:(id)a3
{
  return (GEOTriggerPoint *)-[GEOTriggerPoint _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOTriggerPointIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOTriggerPointReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  char flags;
  id v5;

  v5 = a3;
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    flags = (char)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_3:
      if ((flags & 8) == 0)
        goto LABEL_4;
LABEL_9:
      PBDataWriterWriteBOOLField();
      if ((*(_BYTE *)&self->_flags & 4) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 1) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  flags = (char)self->_flags;
  if ((flags & 8) != 0)
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
  _DWORD *v5;

  v5 = a3;
  -[GEOTriggerPoint readAll:](self, "readAll:", 0);
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    v5[5] = self->_time;
    *((_BYTE *)v5 + 28) |= 2u;
    flags = (char)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_3:
      if ((flags & 8) == 0)
        goto LABEL_4;
LABEL_9:
      *((_BYTE *)v5 + 25) = self->_countBeforeReferenceOffset;
      *((_BYTE *)v5 + 28) |= 8u;
      if ((*(_BYTE *)&self->_flags & 4) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 1) == 0)
  {
    goto LABEL_3;
  }
  v5[4] = self->_referenceOffsetCm;
  *((_BYTE *)v5 + 28) |= 1u;
  flags = (char)self->_flags;
  if ((flags & 8) != 0)
    goto LABEL_9;
LABEL_4:
  if ((flags & 4) != 0)
  {
LABEL_5:
    *((_BYTE *)v5 + 24) = self->_allowsShifting;
    *((_BYTE *)v5 + 28) |= 4u;
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
    *(_DWORD *)(v4 + 20) = self->_time;
    *(_BYTE *)(v4 + 28) |= 2u;
    flags = (char)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_3:
      if ((flags & 8) == 0)
        goto LABEL_4;
LABEL_9:
      *(_BYTE *)(v4 + 25) = self->_countBeforeReferenceOffset;
      *(_BYTE *)(v4 + 28) |= 8u;
      if ((*(_BYTE *)&self->_flags & 4) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 1) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v4 + 16) = self->_referenceOffsetCm;
  *(_BYTE *)(v4 + 28) |= 1u;
  flags = (char)self->_flags;
  if ((flags & 8) != 0)
    goto LABEL_9;
LABEL_4:
  if ((flags & 4) != 0)
  {
LABEL_5:
    *(_BYTE *)(v4 + 24) = self->_allowsShifting;
    *(_BYTE *)(v4 + 28) |= 4u;
  }
LABEL_6:
  objc_storeStrong((id *)(v4 + 8), self->_unknownFields);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_22;
  -[GEOTriggerPoint readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 2) == 0 || self->_time != *((_DWORD *)v4 + 5))
      goto LABEL_22;
  }
  else if ((*((_BYTE *)v4 + 28) & 2) != 0)
  {
    goto LABEL_22;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 1) == 0 || self->_referenceOffsetCm != *((_DWORD *)v4 + 4))
      goto LABEL_22;
  }
  else if ((*((_BYTE *)v4 + 28) & 1) != 0)
  {
    goto LABEL_22;
  }
  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 8) == 0)
      goto LABEL_22;
    if (self->_countBeforeReferenceOffset)
    {
      if (!*((_BYTE *)v4 + 25))
        goto LABEL_22;
    }
    else if (*((_BYTE *)v4 + 25))
    {
      goto LABEL_22;
    }
  }
  else if ((*((_BYTE *)v4 + 28) & 8) != 0)
  {
    goto LABEL_22;
  }
  v5 = (*((_BYTE *)v4 + 28) & 4) == 0;
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 4) != 0)
    {
      if (self->_allowsShifting)
      {
        if (!*((_BYTE *)v4 + 24))
          goto LABEL_22;
      }
      else if (*((_BYTE *)v4 + 24))
      {
        goto LABEL_22;
      }
      v5 = 1;
      goto LABEL_23;
    }
LABEL_22:
    v5 = 0;
  }
LABEL_23:

  return v5;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  -[GEOTriggerPoint readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    v3 = 2654435761 * self->_time;
    if ((*(_BYTE *)&self->_flags & 1) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_referenceOffsetCm;
      if ((*(_BYTE *)&self->_flags & 8) != 0)
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
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      goto LABEL_3;
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_flags & 8) == 0)
    goto LABEL_8;
LABEL_4:
  v5 = 2654435761 * self->_countBeforeReferenceOffset;
  if ((*(_BYTE *)&self->_flags & 4) == 0)
    goto LABEL_9;
LABEL_5:
  v6 = 2654435761 * self->_allowsShifting;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  char v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "readAll:", 0);
  v4 = *((_BYTE *)v5 + 28);
  if ((v4 & 2) != 0)
  {
    self->_time = *((_DWORD *)v5 + 5);
    *(_BYTE *)&self->_flags |= 2u;
    v4 = *((_BYTE *)v5 + 28);
    if ((v4 & 1) == 0)
    {
LABEL_3:
      if ((v4 & 8) == 0)
        goto LABEL_4;
LABEL_9:
      self->_countBeforeReferenceOffset = *((_BYTE *)v5 + 25);
      *(_BYTE *)&self->_flags |= 8u;
      if ((*((_BYTE *)v5 + 28) & 4) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*((_BYTE *)v5 + 28) & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_referenceOffsetCm = *((_DWORD *)v5 + 4);
  *(_BYTE *)&self->_flags |= 1u;
  v4 = *((_BYTE *)v5 + 28);
  if ((v4 & 8) != 0)
    goto LABEL_9;
LABEL_4:
  if ((v4 & 4) != 0)
  {
LABEL_5:
    self->_allowsShifting = *((_BYTE *)v5 + 24);
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
    -[GEOTriggerPoint readAll:](self, "readAll:", 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end
