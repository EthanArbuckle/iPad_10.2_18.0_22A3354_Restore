@implementation GEOTraversalTimes

- (unsigned)estimatedSeconds
{
  return self->_estimatedSeconds;
}

- (void)setEstimatedSeconds:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 4u;
  self->_estimatedSeconds = a3;
}

- (void)setHasEstimatedSeconds:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasEstimatedSeconds
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (unsigned)historicalEstimatedSeconds
{
  return self->_historicalEstimatedSeconds;
}

- (void)setHistoricalEstimatedSeconds:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 0x10u;
  self->_historicalEstimatedSeconds = a3;
}

- (void)setHasHistoricalEstimatedSeconds:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xEF | v3;
}

- (BOOL)hasHistoricalEstimatedSeconds
{
  return (*(_BYTE *)&self->_flags >> 4) & 1;
}

- (unsigned)freeflowEstimatedSeconds
{
  return self->_freeflowEstimatedSeconds;
}

- (void)setFreeflowEstimatedSeconds:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 8u;
  self->_freeflowEstimatedSeconds = a3;
}

- (void)setHasFreeflowEstimatedSeconds:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xF7 | v3;
}

- (BOOL)hasFreeflowEstimatedSeconds
{
  return (*(_BYTE *)&self->_flags >> 3) & 1;
}

- (unsigned)aggressiveEstimatedSeconds
{
  return self->_aggressiveEstimatedSeconds;
}

- (void)setAggressiveEstimatedSeconds:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_aggressiveEstimatedSeconds = a3;
}

- (void)setHasAggressiveEstimatedSeconds:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasAggressiveEstimatedSeconds
{
  return *(_BYTE *)&self->_flags & 1;
}

- (unsigned)conservativeEstimatedSeconds
{
  return self->_conservativeEstimatedSeconds;
}

- (void)setConservativeEstimatedSeconds:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 2u;
  self->_conservativeEstimatedSeconds = a3;
}

- (void)setHasConservativeEstimatedSeconds:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasConservativeEstimatedSeconds
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
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
  v8.super_class = (Class)GEOTraversalTimes;
  -[GEOTraversalTimes description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOTraversalTimes dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOTraversalTimes _dictionaryRepresentation:]((uint64_t)self, 0);
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
  _QWORD v23[4];
  id v24;

  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_BYTE *)(a1 + 36);
  if ((v5 & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 24));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v16 = CFSTR("estimatedSeconds");
    else
      v16 = CFSTR("estimated_seconds");
    objc_msgSend(v4, "setObject:forKey:", v15, v16);

    v5 = *(_BYTE *)(a1 + 36);
    if ((v5 & 0x10) == 0)
    {
LABEL_4:
      if ((v5 & 8) == 0)
        goto LABEL_5;
      goto LABEL_25;
    }
  }
  else if ((*(_BYTE *)(a1 + 36) & 0x10) == 0)
  {
    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 32));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v18 = CFSTR("historicalEstimatedSeconds");
  else
    v18 = CFSTR("historical_estimated_seconds");
  objc_msgSend(v4, "setObject:forKey:", v17, v18);

  v5 = *(_BYTE *)(a1 + 36);
  if ((v5 & 8) == 0)
  {
LABEL_5:
    if ((v5 & 1) == 0)
      goto LABEL_6;
LABEL_29:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 16));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v22 = CFSTR("aggressiveEstimatedSeconds");
    else
      v22 = CFSTR("aggressive_estimated_seconds");
    objc_msgSend(v4, "setObject:forKey:", v21, v22);

    if ((*(_BYTE *)(a1 + 36) & 2) == 0)
      goto LABEL_11;
    goto LABEL_7;
  }
LABEL_25:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 28));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v20 = CFSTR("freeflowEstimatedSeconds");
  else
    v20 = CFSTR("freeflow_estimated_seconds");
  objc_msgSend(v4, "setObject:forKey:", v19, v20);

  v5 = *(_BYTE *)(a1 + 36);
  if ((v5 & 1) != 0)
    goto LABEL_29;
LABEL_6:
  if ((v5 & 2) != 0)
  {
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 20));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v7 = CFSTR("conservativeEstimatedSeconds");
    else
      v7 = CFSTR("conservative_estimated_seconds");
    objc_msgSend(v4, "setObject:forKey:", v6, v7);

  }
LABEL_11:
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
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __47__GEOTraversalTimes__dictionaryRepresentation___block_invoke;
      v23[3] = &unk_1E1C00600;
      v12 = v11;
      v24 = v12;
      objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v23);
      v13 = v12;

      v10 = v13;
    }
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOTraversalTimes _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __47__GEOTraversalTimes__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOTraversalTimes)initWithDictionary:(id)a3
{
  return (GEOTraversalTimes *)-[GEOTraversalTimes _initWithDictionary:isJSON:](self, a3, 0);
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
        v6 = CFSTR("estimatedSeconds");
      else
        v6 = CFSTR("estimated_seconds");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setEstimatedSeconds:", objc_msgSend(v7, "unsignedIntValue"));

      if (a3)
        v8 = CFSTR("historicalEstimatedSeconds");
      else
        v8 = CFSTR("historical_estimated_seconds");
      objc_msgSend(v5, "objectForKeyedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setHistoricalEstimatedSeconds:", objc_msgSend(v9, "unsignedIntValue"));

      if (a3)
        v10 = CFSTR("freeflowEstimatedSeconds");
      else
        v10 = CFSTR("freeflow_estimated_seconds");
      objc_msgSend(v5, "objectForKeyedSubscript:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setFreeflowEstimatedSeconds:", objc_msgSend(v11, "unsignedIntValue"));

      if (a3)
        v12 = CFSTR("aggressiveEstimatedSeconds");
      else
        v12 = CFSTR("aggressive_estimated_seconds");
      objc_msgSend(v5, "objectForKeyedSubscript:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setAggressiveEstimatedSeconds:", objc_msgSend(v13, "unsignedIntValue"));

      if (a3)
        v14 = CFSTR("conservativeEstimatedSeconds");
      else
        v14 = CFSTR("conservative_estimated_seconds");
      objc_msgSend(v5, "objectForKeyedSubscript:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setConservativeEstimatedSeconds:", objc_msgSend(v15, "unsignedIntValue"));

    }
  }

  return a1;
}

- (GEOTraversalTimes)initWithJSON:(id)a3
{
  return (GEOTraversalTimes *)-[GEOTraversalTimes _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOTraversalTimesIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOTraversalTimesReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  char flags;
  id v5;

  v5 = a3;
  flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    PBDataWriterWriteUint32Field();
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
  PBDataWriterWriteUint32Field();
  flags = (char)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_4:
    if ((flags & 1) == 0)
      goto LABEL_5;
LABEL_11:
    PBDataWriterWriteUint32Field();
    if ((*(_BYTE *)&self->_flags & 2) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_10:
  PBDataWriterWriteUint32Field();
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
    goto LABEL_11;
LABEL_5:
  if ((flags & 2) != 0)
LABEL_6:
    PBDataWriterWriteUint32Field();
LABEL_7:
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v5);

}

- (void)copyTo:(id)a3
{
  char flags;
  _DWORD *v5;

  v5 = a3;
  -[GEOTraversalTimes readAll:](self, "readAll:", 0);
  flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    v5[6] = self->_estimatedSeconds;
    *((_BYTE *)v5 + 36) |= 4u;
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
  v5[8] = self->_historicalEstimatedSeconds;
  *((_BYTE *)v5 + 36) |= 0x10u;
  flags = (char)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_4:
    if ((flags & 1) == 0)
      goto LABEL_5;
LABEL_11:
    v5[4] = self->_aggressiveEstimatedSeconds;
    *((_BYTE *)v5 + 36) |= 1u;
    if ((*(_BYTE *)&self->_flags & 2) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_10:
  v5[7] = self->_freeflowEstimatedSeconds;
  *((_BYTE *)v5 + 36) |= 8u;
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
    goto LABEL_11;
LABEL_5:
  if ((flags & 2) != 0)
  {
LABEL_6:
    v5[5] = self->_conservativeEstimatedSeconds;
    *((_BYTE *)v5 + 36) |= 2u;
  }
LABEL_7:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  void *v5;
  char flags;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = (void *)v4;
  flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    *(_DWORD *)(v4 + 24) = self->_estimatedSeconds;
    *(_BYTE *)(v4 + 36) |= 4u;
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
  *(_DWORD *)(v4 + 32) = self->_historicalEstimatedSeconds;
  *(_BYTE *)(v4 + 36) |= 0x10u;
  flags = (char)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_4:
    if ((flags & 1) == 0)
      goto LABEL_5;
LABEL_11:
    *(_DWORD *)(v4 + 16) = self->_aggressiveEstimatedSeconds;
    *(_BYTE *)(v4 + 36) |= 1u;
    if ((*(_BYTE *)&self->_flags & 2) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_10:
  *(_DWORD *)(v4 + 28) = self->_freeflowEstimatedSeconds;
  *(_BYTE *)(v4 + 36) |= 8u;
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
    goto LABEL_11;
LABEL_5:
  if ((flags & 2) != 0)
  {
LABEL_6:
    *(_DWORD *)(v4 + 20) = self->_conservativeEstimatedSeconds;
    *(_BYTE *)(v4 + 36) |= 2u;
  }
LABEL_7:
  objc_storeStrong((id *)(v4 + 8), self->_unknownFields);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_26;
  -[GEOTraversalTimes readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 4) == 0 || self->_estimatedSeconds != *((_DWORD *)v4 + 6))
      goto LABEL_26;
  }
  else if ((*((_BYTE *)v4 + 36) & 4) != 0)
  {
LABEL_26:
    v5 = 0;
    goto LABEL_27;
  }
  if ((*(_BYTE *)&self->_flags & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 0x10) == 0 || self->_historicalEstimatedSeconds != *((_DWORD *)v4 + 8))
      goto LABEL_26;
  }
  else if ((*((_BYTE *)v4 + 36) & 0x10) != 0)
  {
    goto LABEL_26;
  }
  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 8) == 0 || self->_freeflowEstimatedSeconds != *((_DWORD *)v4 + 7))
      goto LABEL_26;
  }
  else if ((*((_BYTE *)v4 + 36) & 8) != 0)
  {
    goto LABEL_26;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 1) == 0 || self->_aggressiveEstimatedSeconds != *((_DWORD *)v4 + 4))
      goto LABEL_26;
  }
  else if ((*((_BYTE *)v4 + 36) & 1) != 0)
  {
    goto LABEL_26;
  }
  v5 = (*((_BYTE *)v4 + 36) & 2) == 0;
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 2) == 0 || self->_conservativeEstimatedSeconds != *((_DWORD *)v4 + 5))
      goto LABEL_26;
    v5 = 1;
  }
LABEL_27:

  return v5;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  -[GEOTraversalTimes readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    v3 = 2654435761 * self->_estimatedSeconds;
    if ((*(_BYTE *)&self->_flags & 0x10) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_historicalEstimatedSeconds;
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
    v5 = 2654435761 * self->_freeflowEstimatedSeconds;
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      goto LABEL_5;
LABEL_10:
    v6 = 0;
    if ((*(_BYTE *)&self->_flags & 2) != 0)
      goto LABEL_6;
LABEL_11:
    v7 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7;
  }
LABEL_9:
  v5 = 0;
  if ((*(_BYTE *)&self->_flags & 1) == 0)
    goto LABEL_10;
LABEL_5:
  v6 = 2654435761 * self->_aggressiveEstimatedSeconds;
  if ((*(_BYTE *)&self->_flags & 2) == 0)
    goto LABEL_11;
LABEL_6:
  v7 = 2654435761 * self->_conservativeEstimatedSeconds;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  char v4;
  unsigned int *v5;

  v5 = (unsigned int *)a3;
  objc_msgSend(v5, "readAll:", 0);
  v4 = *((_BYTE *)v5 + 36);
  if ((v4 & 4) != 0)
  {
    self->_estimatedSeconds = v5[6];
    *(_BYTE *)&self->_flags |= 4u;
    v4 = *((_BYTE *)v5 + 36);
    if ((v4 & 0x10) == 0)
    {
LABEL_3:
      if ((v4 & 8) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((v5[9] & 0x10) == 0)
  {
    goto LABEL_3;
  }
  self->_historicalEstimatedSeconds = v5[8];
  *(_BYTE *)&self->_flags |= 0x10u;
  v4 = *((_BYTE *)v5 + 36);
  if ((v4 & 8) == 0)
  {
LABEL_4:
    if ((v4 & 1) == 0)
      goto LABEL_5;
LABEL_11:
    self->_aggressiveEstimatedSeconds = v5[4];
    *(_BYTE *)&self->_flags |= 1u;
    if ((v5[9] & 2) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_10:
  self->_freeflowEstimatedSeconds = v5[7];
  *(_BYTE *)&self->_flags |= 8u;
  v4 = *((_BYTE *)v5 + 36);
  if ((v4 & 1) != 0)
    goto LABEL_11;
LABEL_5:
  if ((v4 & 2) != 0)
  {
LABEL_6:
    self->_conservativeEstimatedSeconds = v5[5];
    *(_BYTE *)&self->_flags |= 2u;
  }
LABEL_7:

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
    -[GEOTraversalTimes readAll:](self, "readAll:", 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end
