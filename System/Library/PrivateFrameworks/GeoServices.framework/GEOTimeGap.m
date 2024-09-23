@implementation GEOTimeGap

- (unsigned)subsequentEventId
{
  return self->_subsequentEventId;
}

- (void)setSubsequentEventId:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 2u;
  self->_subsequentEventId = a3;
}

- (void)setHasSubsequentEventId:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasSubsequentEventId
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (unsigned)seconds
{
  return self->_seconds;
}

- (void)setSeconds:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_seconds = a3;
}

- (void)setHasSeconds:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasSeconds
{
  return *(_BYTE *)&self->_flags & 1;
}

- (BOOL)ifChained
{
  return self->_ifChained;
}

- (void)setIfChained:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 4u;
  self->_ifChained = a3;
}

- (void)setHasIfChained:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasIfChained
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
  v8.super_class = (Class)GEOTimeGap;
  -[GEOTimeGap description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOTimeGap dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOTimeGap _dictionaryRepresentation:]((uint64_t)self, 0);
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
  _QWORD v18[4];
  id v19;

  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_BYTE *)(a1 + 28);
  if ((v5 & 2) == 0)
  {
    if ((*(_BYTE *)(a1 + 28) & 1) == 0)
      goto LABEL_4;
LABEL_19:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 16));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v17, CFSTR("seconds"));

    if ((*(_BYTE *)(a1 + 28) & 4) != 0)
      goto LABEL_5;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 20));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v16 = CFSTR("subsequentEventId");
  else
    v16 = CFSTR("subsequent_event_id");
  objc_msgSend(v4, "setObject:forKey:", v15, v16);

  v5 = *(_BYTE *)(a1 + 28);
  if ((v5 & 1) != 0)
    goto LABEL_19;
LABEL_4:
  if ((v5 & 4) != 0)
  {
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 24));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v7 = CFSTR("ifChained");
    else
      v7 = CFSTR("if_chained");
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
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __40__GEOTimeGap__dictionaryRepresentation___block_invoke;
      v18[3] = &unk_1E1C00600;
      v12 = v11;
      v19 = v12;
      objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v18);
      v13 = v12;

      v10 = v13;
    }
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOTimeGap _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __40__GEOTimeGap__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOTimeGap)initWithDictionary:(id)a3
{
  return (GEOTimeGap *)-[GEOTimeGap _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("subsequentEventId");
      else
        v6 = CFSTR("subsequent_event_id");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setSubsequentEventId:", objc_msgSend(v7, "unsignedIntValue"));

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("seconds"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setSeconds:", objc_msgSend(v8, "unsignedIntValue"));

      if (a3)
        v9 = CFSTR("ifChained");
      else
        v9 = CFSTR("if_chained");
      objc_msgSend(v5, "objectForKeyedSubscript:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setIfChained:", objc_msgSend(v10, "BOOLValue"));

    }
  }

  return a1;
}

- (GEOTimeGap)initWithJSON:(id)a3
{
  return (GEOTimeGap *)-[GEOTimeGap _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOTimeGapIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOTimeGapReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  char flags;
  id v5;

  v5 = a3;
  flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
    if ((*(_BYTE *)&self->_flags & 1) == 0)
      goto LABEL_3;
LABEL_7:
    PBDataWriterWriteUint32Field();
    if ((*(_BYTE *)&self->_flags & 4) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  PBDataWriterWriteUint32Field();
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
    goto LABEL_7;
LABEL_3:
  if ((flags & 4) != 0)
LABEL_4:
    PBDataWriterWriteBOOLField();
LABEL_5:
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v5);

}

- (void)copyTo:(id)a3
{
  char flags;
  _DWORD *v5;

  v5 = a3;
  -[GEOTimeGap readAll:](self, "readAll:", 0);
  flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
    if ((*(_BYTE *)&self->_flags & 1) == 0)
      goto LABEL_3;
LABEL_7:
    v5[4] = self->_seconds;
    *((_BYTE *)v5 + 28) |= 1u;
    if ((*(_BYTE *)&self->_flags & 4) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  v5[5] = self->_subsequentEventId;
  *((_BYTE *)v5 + 28) |= 2u;
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
    goto LABEL_7;
LABEL_3:
  if ((flags & 4) != 0)
  {
LABEL_4:
    *((_BYTE *)v5 + 24) = self->_ifChained;
    *((_BYTE *)v5 + 28) |= 4u;
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
  if ((flags & 2) == 0)
  {
    if ((*(_BYTE *)&self->_flags & 1) == 0)
      goto LABEL_3;
LABEL_7:
    *(_DWORD *)(v4 + 16) = self->_seconds;
    *(_BYTE *)(v4 + 28) |= 1u;
    if ((*(_BYTE *)&self->_flags & 4) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  *(_DWORD *)(v4 + 20) = self->_subsequentEventId;
  *(_BYTE *)(v4 + 28) |= 2u;
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
    goto LABEL_7;
LABEL_3:
  if ((flags & 4) != 0)
  {
LABEL_4:
    *(_BYTE *)(v4 + 24) = self->_ifChained;
    *(_BYTE *)(v4 + 28) |= 4u;
  }
LABEL_5:
  objc_storeStrong((id *)(v4 + 8), self->_unknownFields);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_14;
  -[GEOTimeGap readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 2) == 0 || self->_subsequentEventId != *((_DWORD *)v4 + 5))
      goto LABEL_14;
  }
  else if ((*((_BYTE *)v4 + 28) & 2) != 0)
  {
    goto LABEL_14;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 1) == 0 || self->_seconds != *((_DWORD *)v4 + 4))
      goto LABEL_14;
  }
  else if ((*((_BYTE *)v4 + 28) & 1) != 0)
  {
    goto LABEL_14;
  }
  v5 = (*((_BYTE *)v4 + 28) & 4) == 0;
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 4) == 0)
    {
LABEL_14:
      v5 = 0;
      goto LABEL_15;
    }
    if (self->_ifChained)
    {
      if (!*((_BYTE *)v4 + 24))
        goto LABEL_14;
    }
    else if (*((_BYTE *)v4 + 24))
    {
      goto LABEL_14;
    }
    v5 = 1;
  }
LABEL_15:

  return v5;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  -[GEOTimeGap readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 2) == 0)
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      goto LABEL_3;
LABEL_6:
    v4 = 0;
    if ((*(_BYTE *)&self->_flags & 4) != 0)
      goto LABEL_4;
LABEL_7:
    v5 = 0;
    return v4 ^ v3 ^ v5;
  }
  v3 = 2654435761 * self->_subsequentEventId;
  if ((*(_BYTE *)&self->_flags & 1) == 0)
    goto LABEL_6;
LABEL_3:
  v4 = 2654435761 * self->_seconds;
  if ((*(_BYTE *)&self->_flags & 4) == 0)
    goto LABEL_7;
LABEL_4:
  v5 = 2654435761 * self->_ifChained;
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  char v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "readAll:", 0);
  v4 = *((_BYTE *)v5 + 28);
  if ((v4 & 2) == 0)
  {
    if ((*((_BYTE *)v5 + 28) & 1) == 0)
      goto LABEL_3;
LABEL_7:
    self->_seconds = *((_DWORD *)v5 + 4);
    *(_BYTE *)&self->_flags |= 1u;
    if ((*((_BYTE *)v5 + 28) & 4) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  self->_subsequentEventId = *((_DWORD *)v5 + 5);
  *(_BYTE *)&self->_flags |= 2u;
  v4 = *((_BYTE *)v5 + 28);
  if ((v4 & 1) != 0)
    goto LABEL_7;
LABEL_3:
  if ((v4 & 4) != 0)
  {
LABEL_4:
    self->_ifChained = *((_BYTE *)v5 + 24);
    *(_BYTE *)&self->_flags |= 4u;
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
    -[GEOTimeGap readAll:](self, "readAll:", 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end
