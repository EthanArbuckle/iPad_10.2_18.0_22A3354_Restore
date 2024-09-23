@implementation GEOPDDepartureFrequency

- (unsigned)minDepartureFrequency
{
  return self->_minDepartureFrequency;
}

- (void)setMinDepartureFrequency:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 0x10u;
  self->_minDepartureFrequency = a3;
}

- (void)setHasMinDepartureFrequency:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xEF | v3;
}

- (BOOL)hasMinDepartureFrequency
{
  return (*(_BYTE *)&self->_flags >> 4) & 1;
}

- (unsigned)maxDepartureFrequency
{
  return self->_maxDepartureFrequency;
}

- (void)setMaxDepartureFrequency:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 8u;
  self->_maxDepartureFrequency = a3;
}

- (void)setHasMaxDepartureFrequency:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xF7 | v3;
}

- (BOOL)hasMaxDepartureFrequency
{
  return (*(_BYTE *)&self->_flags >> 3) & 1;
}

- (unsigned)earliestDepartureTime
{
  return self->_earliestDepartureTime;
}

- (void)setEarliestDepartureTime:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 2u;
  self->_earliestDepartureTime = a3;
}

- (void)setHasEarliestDepartureTime:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasEarliestDepartureTime
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (unsigned)latestDepartureTime
{
  return self->_latestDepartureTime;
}

- (void)setLatestDepartureTime:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 4u;
  self->_latestDepartureTime = a3;
}

- (void)setHasLatestDepartureTime:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasLatestDepartureTime
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (BOOL)isEstimated
{
  return self->_isEstimated;
}

- (void)setIsEstimated:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 0x20u;
  self->_isEstimated = a3;
}

- (void)setHasIsEstimated:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xDF | v3;
}

- (BOOL)hasIsEstimated
{
  return (*(_BYTE *)&self->_flags >> 5) & 1;
}

- (unsigned)displayDepartureFrequency
{
  return self->_displayDepartureFrequency;
}

- (void)setDisplayDepartureFrequency:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_displayDepartureFrequency = a3;
}

- (void)setHasDisplayDepartureFrequency:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasDisplayDepartureFrequency
{
  return *(_BYTE *)&self->_flags & 1;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)GEOPDDepartureFrequency;
  -[GEOPDDepartureFrequency description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDDepartureFrequency dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDDepartureFrequency _dictionaryRepresentation:]((uint64_t)self, 0);
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
  void *v21;
  const __CFString *v22;
  void *v23;
  const __CFString *v24;
  _QWORD v25[4];
  id v26;

  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_BYTE *)(a1 + 40);
  if ((v5 & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 32));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v16 = CFSTR("minDepartureFrequency");
    else
      v16 = CFSTR("min_departure_frequency");
    objc_msgSend(v4, "setObject:forKey:", v15, v16);

    v5 = *(_BYTE *)(a1 + 40);
    if ((v5 & 8) == 0)
    {
LABEL_4:
      if ((v5 & 2) == 0)
        goto LABEL_5;
      goto LABEL_26;
    }
  }
  else if ((*(_BYTE *)(a1 + 40) & 8) == 0)
  {
    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 28));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v18 = CFSTR("maxDepartureFrequency");
  else
    v18 = CFSTR("max_departure_frequency");
  objc_msgSend(v4, "setObject:forKey:", v17, v18);

  v5 = *(_BYTE *)(a1 + 40);
  if ((v5 & 2) == 0)
  {
LABEL_5:
    if ((v5 & 4) == 0)
      goto LABEL_6;
    goto LABEL_30;
  }
LABEL_26:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 20));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v20 = CFSTR("earliestDepartureTime");
  else
    v20 = CFSTR("earliest_departure_time");
  objc_msgSend(v4, "setObject:forKey:", v19, v20);

  v5 = *(_BYTE *)(a1 + 40);
  if ((v5 & 4) == 0)
  {
LABEL_6:
    if ((v5 & 0x20) == 0)
      goto LABEL_7;
LABEL_34:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 36));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v24 = CFSTR("isEstimated");
    else
      v24 = CFSTR("is_estimated");
    objc_msgSend(v4, "setObject:forKey:", v23, v24);

    if ((*(_BYTE *)(a1 + 40) & 1) == 0)
      goto LABEL_12;
    goto LABEL_8;
  }
LABEL_30:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 24));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v22 = CFSTR("latestDepartureTime");
  else
    v22 = CFSTR("latest_departure_time");
  objc_msgSend(v4, "setObject:forKey:", v21, v22);

  v5 = *(_BYTE *)(a1 + 40);
  if ((v5 & 0x20) != 0)
    goto LABEL_34;
LABEL_7:
  if ((v5 & 1) != 0)
  {
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 16));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v7 = CFSTR("displayDepartureFrequency");
    else
      v7 = CFSTR("display_departure_frequency");
    objc_msgSend(v4, "setObject:forKey:", v6, v7);

  }
LABEL_12:
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
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __53__GEOPDDepartureFrequency__dictionaryRepresentation___block_invoke;
      v25[3] = &unk_1E1C00600;
      v12 = v11;
      v26 = v12;
      objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v25);
      v13 = v12;

      v10 = v13;
    }
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDDepartureFrequency _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __53__GEOPDDepartureFrequency__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOPDDepartureFrequency)initWithDictionary:(id)a3
{
  return (GEOPDDepartureFrequency *)-[GEOPDDepartureFrequency _initWithDictionary:isJSON:](self, a3, 0);
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
  const __CFString *v16;
  void *v17;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("minDepartureFrequency");
      else
        v6 = CFSTR("min_departure_frequency");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setMinDepartureFrequency:", objc_msgSend(v7, "unsignedIntValue"));

      if (a3)
        v8 = CFSTR("maxDepartureFrequency");
      else
        v8 = CFSTR("max_departure_frequency");
      objc_msgSend(v5, "objectForKeyedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setMaxDepartureFrequency:", objc_msgSend(v9, "unsignedIntValue"));

      if (a3)
        v10 = CFSTR("earliestDepartureTime");
      else
        v10 = CFSTR("earliest_departure_time");
      objc_msgSend(v5, "objectForKeyedSubscript:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setEarliestDepartureTime:", objc_msgSend(v11, "unsignedIntValue"));

      if (a3)
        v12 = CFSTR("latestDepartureTime");
      else
        v12 = CFSTR("latest_departure_time");
      objc_msgSend(v5, "objectForKeyedSubscript:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setLatestDepartureTime:", objc_msgSend(v13, "unsignedIntValue"));

      if (a3)
        v14 = CFSTR("isEstimated");
      else
        v14 = CFSTR("is_estimated");
      objc_msgSend(v5, "objectForKeyedSubscript:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setIsEstimated:", objc_msgSend(v15, "BOOLValue"));

      if (a3)
        v16 = CFSTR("displayDepartureFrequency");
      else
        v16 = CFSTR("display_departure_frequency");
      objc_msgSend(v5, "objectForKeyedSubscript:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setDisplayDepartureFrequency:", objc_msgSend(v17, "unsignedIntValue"));

    }
  }

  return a1;
}

- (GEOPDDepartureFrequency)initWithJSON:(id)a3
{
  return (GEOPDDepartureFrequency *)-[GEOPDDepartureFrequency _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPDDepartureFrequencyIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDDepartureFrequencyReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  char flags;
  id v5;

  v5 = a3;
  flags = (char)self->_flags;
  if ((flags & 0x10) != 0)
  {
    PBDataWriterWriteUint32Field();
    flags = (char)self->_flags;
    if ((flags & 8) == 0)
    {
LABEL_3:
      if ((flags & 2) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_4:
    if ((flags & 4) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  PBDataWriterWriteUint32Field();
  flags = (char)self->_flags;
  if ((flags & 4) == 0)
  {
LABEL_5:
    if ((flags & 0x20) == 0)
      goto LABEL_6;
LABEL_13:
    PBDataWriterWriteBOOLField();
    if ((*(_BYTE *)&self->_flags & 1) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_12:
  PBDataWriterWriteUint32Field();
  flags = (char)self->_flags;
  if ((flags & 0x20) != 0)
    goto LABEL_13;
LABEL_6:
  if ((flags & 1) != 0)
LABEL_7:
    PBDataWriterWriteUint32Field();
LABEL_8:
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v5);

}

- (void)copyTo:(id)a3
{
  char flags;
  _DWORD *v5;

  v5 = a3;
  -[GEOPDDepartureFrequency readAll:](self, "readAll:", 0);
  flags = (char)self->_flags;
  if ((flags & 0x10) != 0)
  {
    v5[8] = self->_minDepartureFrequency;
    *((_BYTE *)v5 + 40) |= 0x10u;
    flags = (char)self->_flags;
    if ((flags & 8) == 0)
    {
LABEL_3:
      if ((flags & 2) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 8) == 0)
  {
    goto LABEL_3;
  }
  v5[7] = self->_maxDepartureFrequency;
  *((_BYTE *)v5 + 40) |= 8u;
  flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_4:
    if ((flags & 4) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  v5[5] = self->_earliestDepartureTime;
  *((_BYTE *)v5 + 40) |= 2u;
  flags = (char)self->_flags;
  if ((flags & 4) == 0)
  {
LABEL_5:
    if ((flags & 0x20) == 0)
      goto LABEL_6;
LABEL_13:
    *((_BYTE *)v5 + 36) = self->_isEstimated;
    *((_BYTE *)v5 + 40) |= 0x20u;
    if ((*(_BYTE *)&self->_flags & 1) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_12:
  v5[6] = self->_latestDepartureTime;
  *((_BYTE *)v5 + 40) |= 4u;
  flags = (char)self->_flags;
  if ((flags & 0x20) != 0)
    goto LABEL_13;
LABEL_6:
  if ((flags & 1) != 0)
  {
LABEL_7:
    v5[4] = self->_displayDepartureFrequency;
    *((_BYTE *)v5 + 40) |= 1u;
  }
LABEL_8:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  void *v5;
  char flags;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = (void *)v4;
  flags = (char)self->_flags;
  if ((flags & 0x10) != 0)
  {
    *(_DWORD *)(v4 + 32) = self->_minDepartureFrequency;
    *(_BYTE *)(v4 + 40) |= 0x10u;
    flags = (char)self->_flags;
    if ((flags & 8) == 0)
    {
LABEL_3:
      if ((flags & 2) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 8) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v4 + 28) = self->_maxDepartureFrequency;
  *(_BYTE *)(v4 + 40) |= 8u;
  flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_4:
    if ((flags & 4) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  *(_DWORD *)(v4 + 20) = self->_earliestDepartureTime;
  *(_BYTE *)(v4 + 40) |= 2u;
  flags = (char)self->_flags;
  if ((flags & 4) == 0)
  {
LABEL_5:
    if ((flags & 0x20) == 0)
      goto LABEL_6;
LABEL_13:
    *(_BYTE *)(v4 + 36) = self->_isEstimated;
    *(_BYTE *)(v4 + 40) |= 0x20u;
    if ((*(_BYTE *)&self->_flags & 1) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_12:
  *(_DWORD *)(v4 + 24) = self->_latestDepartureTime;
  *(_BYTE *)(v4 + 40) |= 4u;
  flags = (char)self->_flags;
  if ((flags & 0x20) != 0)
    goto LABEL_13;
LABEL_6:
  if ((flags & 1) != 0)
  {
LABEL_7:
    *(_DWORD *)(v4 + 16) = self->_displayDepartureFrequency;
    *(_BYTE *)(v4 + 40) |= 1u;
  }
LABEL_8:
  objc_storeStrong((id *)(v4 + 8), self->_unknownFields);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_34;
  -[GEOPDDepartureFrequency readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 0x10) == 0 || self->_minDepartureFrequency != *((_DWORD *)v4 + 8))
      goto LABEL_34;
  }
  else if ((*((_BYTE *)v4 + 40) & 0x10) != 0)
  {
    goto LABEL_34;
  }
  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 8) == 0 || self->_maxDepartureFrequency != *((_DWORD *)v4 + 7))
      goto LABEL_34;
  }
  else if ((*((_BYTE *)v4 + 40) & 8) != 0)
  {
    goto LABEL_34;
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 2) == 0 || self->_earliestDepartureTime != *((_DWORD *)v4 + 5))
      goto LABEL_34;
  }
  else if ((*((_BYTE *)v4 + 40) & 2) != 0)
  {
    goto LABEL_34;
  }
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 4) == 0 || self->_latestDepartureTime != *((_DWORD *)v4 + 6))
      goto LABEL_34;
  }
  else if ((*((_BYTE *)v4 + 40) & 4) != 0)
  {
    goto LABEL_34;
  }
  if ((*(_BYTE *)&self->_flags & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 0x20) != 0)
    {
      if (self->_isEstimated)
      {
        if (!*((_BYTE *)v4 + 36))
          goto LABEL_34;
        goto LABEL_30;
      }
      if (!*((_BYTE *)v4 + 36))
        goto LABEL_30;
    }
LABEL_34:
    v5 = 0;
    goto LABEL_35;
  }
  if ((*((_BYTE *)v4 + 40) & 0x20) != 0)
    goto LABEL_34;
LABEL_30:
  v5 = (*((_BYTE *)v4 + 40) & 1) == 0;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 1) == 0 || self->_displayDepartureFrequency != *((_DWORD *)v4 + 4))
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

  -[GEOPDDepartureFrequency readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 0x10) != 0)
  {
    v3 = 2654435761 * self->_minDepartureFrequency;
    if ((*(_BYTE *)&self->_flags & 8) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_maxDepartureFrequency;
      if ((*(_BYTE *)&self->_flags & 2) != 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_flags & 8) != 0)
      goto LABEL_3;
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
LABEL_4:
    v5 = 2654435761 * self->_earliestDepartureTime;
    if ((*(_BYTE *)&self->_flags & 4) != 0)
      goto LABEL_5;
    goto LABEL_11;
  }
LABEL_10:
  v5 = 0;
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
LABEL_5:
    v6 = 2654435761 * self->_latestDepartureTime;
    if ((*(_BYTE *)&self->_flags & 0x20) != 0)
      goto LABEL_6;
LABEL_12:
    v7 = 0;
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      goto LABEL_7;
LABEL_13:
    v8 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
  }
LABEL_11:
  v6 = 0;
  if ((*(_BYTE *)&self->_flags & 0x20) == 0)
    goto LABEL_12;
LABEL_6:
  v7 = 2654435761 * self->_isEstimated;
  if ((*(_BYTE *)&self->_flags & 1) == 0)
    goto LABEL_13;
LABEL_7:
  v8 = 2654435761 * self->_displayDepartureFrequency;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (void)mergeFrom:(id)a3
{
  char v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "readAll:", 0);
  v4 = *((_BYTE *)v5 + 40);
  if ((v4 & 0x10) != 0)
  {
    self->_minDepartureFrequency = *((_DWORD *)v5 + 8);
    *(_BYTE *)&self->_flags |= 0x10u;
    v4 = *((_BYTE *)v5 + 40);
    if ((v4 & 8) == 0)
    {
LABEL_3:
      if ((v4 & 2) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*((_BYTE *)v5 + 40) & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_maxDepartureFrequency = *((_DWORD *)v5 + 7);
  *(_BYTE *)&self->_flags |= 8u;
  v4 = *((_BYTE *)v5 + 40);
  if ((v4 & 2) == 0)
  {
LABEL_4:
    if ((v4 & 4) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  self->_earliestDepartureTime = *((_DWORD *)v5 + 5);
  *(_BYTE *)&self->_flags |= 2u;
  v4 = *((_BYTE *)v5 + 40);
  if ((v4 & 4) == 0)
  {
LABEL_5:
    if ((v4 & 0x20) == 0)
      goto LABEL_6;
LABEL_13:
    self->_isEstimated = *((_BYTE *)v5 + 36);
    *(_BYTE *)&self->_flags |= 0x20u;
    if ((*((_BYTE *)v5 + 40) & 1) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_12:
  self->_latestDepartureTime = *((_DWORD *)v5 + 6);
  *(_BYTE *)&self->_flags |= 4u;
  v4 = *((_BYTE *)v5 + 40);
  if ((v4 & 0x20) != 0)
    goto LABEL_13;
LABEL_6:
  if ((v4 & 1) != 0)
  {
LABEL_7:
    self->_displayDepartureFrequency = *((_DWORD *)v5 + 4);
    *(_BYTE *)&self->_flags |= 1u;
  }
LABEL_8:

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
    -[GEOPDDepartureFrequency readAll:](self, "readAll:", 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unknownFields, 0);
}

- (NSDate)firstTimeInFrequency
{
  if (-[GEOPDDepartureFrequency hasEarliestDepartureTime](self, "hasEarliestDepartureTime"))
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", (double)-[GEOPDDepartureFrequency earliestDepartureTime](self, "earliestDepartureTime"));
  else
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  return (NSDate *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSDate)lastTimeInFrequency
{
  if (-[GEOPDDepartureFrequency hasLatestDepartureTime](self, "hasLatestDepartureTime"))
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", (double)-[GEOPDDepartureFrequency latestDepartureTime](self, "latestDepartureTime"));
  else
    objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  return (NSDate *)(id)objc_claimAutoreleasedReturnValue();
}

- (int64_t)displayFrequency
{
  if (!-[GEOPDDepartureFrequency hasDisplayDepartureFrequency](self, "hasDisplayDepartureFrequency"))
    return -[GEOPDDepartureFrequency minFrequency](self, "minFrequency");
  if ((uint64_t)llroundf((float)-[GEOPDDepartureFrequency displayDepartureFrequency](self, "displayDepartureFrequency") / 60.0) < 1)
    return 1;
  return llroundf((float)-[GEOPDDepartureFrequency displayDepartureFrequency](self, "displayDepartureFrequency") / 60.0);
}

- (int64_t)minFrequency
{
  return llroundf((float)-[GEOPDDepartureFrequency minDepartureFrequency](self, "minDepartureFrequency") / 60.0);
}

- (int64_t)maxFrequency
{
  return llroundf((float)-[GEOPDDepartureFrequency maxDepartureFrequency](self, "maxDepartureFrequency") / 60.0);
}

- (int64_t)frequencyType
{
  int64_t v4;

  if (-[GEOPDDepartureFrequency hasDisplayDepartureFrequency](self, "hasDisplayDepartureFrequency"))
    return 2;
  if (!-[GEOPDDepartureFrequency hasMinDepartureFrequency](self, "hasMinDepartureFrequency")
    || !-[GEOPDDepartureFrequency hasMaxDepartureFrequency](self, "hasMaxDepartureFrequency"))
  {
    return 0;
  }
  v4 = -[GEOPDDepartureFrequency minFrequency](self, "minFrequency");
  if (v4 == -[GEOPDDepartureFrequency maxFrequency](self, "maxFrequency"))
    return 2;
  else
    return 1;
}

- (BOOL)isValidAtDate:(id)a3
{
  id v4;
  void *v5;
  double v6;
  BOOL v7;
  void *v8;
  double v9;

  v4 = a3;
  if (-[GEOPDDepartureFrequency frequencyType](self, "frequencyType"))
  {
    -[GEOPDDepartureFrequency firstTimeInFrequency](self, "firstTimeInFrequency");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timeIntervalSinceDate:", v5);
    if (v6 >= 0.0)
    {
      -[GEOPDDepartureFrequency lastTimeInFrequency](self, "lastTimeInFrequency");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "timeIntervalSinceDate:", v8);
      v7 = v9 <= 0.0;

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (double)frequencyForSorting
{
  int64_t v3;
  double result;
  int64_t v5;

  v3 = -[GEOPDDepartureFrequency frequencyType](self, "frequencyType");
  if (v3 == 2)
    return (double)-[GEOPDDepartureFrequency displayFrequency](self, "displayFrequency");
  result = 0.0;
  if (v3 == 1)
  {
    v5 = -[GEOPDDepartureFrequency minFrequency](self, "minFrequency", 0.0);
    return (double)(-[GEOPDDepartureFrequency maxFrequency](self, "maxFrequency") + v5) * 0.5;
  }
  return result;
}

@end
