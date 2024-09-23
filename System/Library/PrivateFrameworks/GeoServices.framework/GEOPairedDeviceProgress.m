@implementation GEOPairedDeviceProgress

- (BOOL)isIndeterminate
{
  return self->_isIndeterminate;
}

- (void)setIsIndeterminate:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 0x10u;
  self->_isIndeterminate = a3;
}

- (void)setHasIsIndeterminate:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xEF | v3;
}

- (BOOL)hasIsIndeterminate
{
  return (*(_BYTE *)&self->_flags >> 4) & 1;
}

- (float)fractionCompleted
{
  return self->_fractionCompleted;
}

- (void)setFractionCompleted:(float)a3
{
  *(_BYTE *)&self->_flags |= 4u;
  self->_fractionCompleted = a3;
}

- (void)setHasFractionCompleted:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasFractionCompleted
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (int)kind
{
  if ((*(_BYTE *)&self->_flags & 8) != 0)
    return self->_kind;
  else
    return 1;
}

- (void)setKind:(int)a3
{
  *(_BYTE *)&self->_flags |= 8u;
  self->_kind = a3;
}

- (void)setHasKind:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xF7 | v3;
}

- (BOOL)hasKind
{
  return (*(_BYTE *)&self->_flags >> 3) & 1;
}

- (id)kindAsString:(int)a3
{
  __CFString *v3;

  if (a3 == 1)
  {
    v3 = CFSTR("KIND_FILE");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsKind:(id)a3
{
  objc_msgSend(a3, "isEqualToString:", CFSTR("KIND_FILE"));
  return 1;
}

- (unint64_t)byteTotalCount
{
  return self->_byteTotalCount;
}

- (void)setByteTotalCount:(unint64_t)a3
{
  *(_BYTE *)&self->_flags |= 2u;
  self->_byteTotalCount = a3;
}

- (void)setHasByteTotalCount:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasByteTotalCount
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (unint64_t)byteCompletedCount
{
  return self->_byteCompletedCount;
}

- (void)setByteCompletedCount:(unint64_t)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_byteCompletedCount = a3;
}

- (void)setHasByteCompletedCount:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasByteCompletedCount
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
  v8.super_class = (Class)GEOPairedDeviceProgress;
  -[GEOPairedDeviceProgress description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPairedDeviceProgress dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPairedDeviceProgress _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  double v5;
  char v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v18;
  const __CFString *v19;
  __CFString *v20;
  void *v21;
  const __CFString *v22;
  _QWORD v23[4];
  id v24;

  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_BYTE *)(a1 + 44);
  if ((v6 & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 40));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v8 = CFSTR("isIndeterminate");
    else
      v8 = CFSTR("is_indeterminate");
    objc_msgSend(v4, "setObject:forKey:", v7, v8);

    v6 = *(_BYTE *)(a1 + 44);
  }
  if ((v6 & 4) != 0)
  {
    LODWORD(v5) = *(_DWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v19 = CFSTR("fractionCompleted");
    else
      v19 = CFSTR("fraction_completed");
    objc_msgSend(v4, "setObject:forKey:", v18, v19);

    v6 = *(_BYTE *)(a1 + 44);
    if ((v6 & 8) == 0)
    {
LABEL_9:
      if ((v6 & 2) == 0)
        goto LABEL_10;
LABEL_29:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 24));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
        v22 = CFSTR("byteTotalCount");
      else
        v22 = CFSTR("byte_total_count");
      objc_msgSend(v4, "setObject:forKey:", v21, v22);

      if ((*(_BYTE *)(a1 + 44) & 1) == 0)
        goto LABEL_15;
      goto LABEL_11;
    }
  }
  else if ((v6 & 8) == 0)
  {
    goto LABEL_9;
  }
  if (*(_DWORD *)(a1 + 36) == 1)
  {
    v20 = CFSTR("KIND_FILE");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 36));
    v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "setObject:forKey:", v20, CFSTR("kind"));

  v6 = *(_BYTE *)(a1 + 44);
  if ((v6 & 2) != 0)
    goto LABEL_29;
LABEL_10:
  if ((v6 & 1) != 0)
  {
LABEL_11:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 16));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v10 = CFSTR("byteCompletedCount");
    else
      v10 = CFSTR("byte_completed_count");
    objc_msgSend(v4, "setObject:forKey:", v9, v10);

  }
LABEL_15:
  v11 = *(void **)(a1 + 8);
  if (v11)
  {
    objc_msgSend(v11, "dictionaryRepresentation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v12, "count"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __53__GEOPairedDeviceProgress__dictionaryRepresentation___block_invoke;
      v23[3] = &unk_1E1C00600;
      v15 = v14;
      v24 = v15;
      objc_msgSend(v13, "enumerateKeysAndObjectsUsingBlock:", v23);
      v16 = v15;

      v13 = v16;
    }
    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPairedDeviceProgress _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __53__GEOPairedDeviceProgress__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOPairedDeviceProgress)initWithDictionary:(id)a3
{
  return (GEOPairedDeviceProgress *)-[GEOPairedDeviceProgress _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  const __CFString *v12;
  void *v13;
  const __CFString *v14;
  void *v15;

  v5 = a2;
  if (!a1)
    goto LABEL_29;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_29;
  if (a3)
    v6 = CFSTR("isIndeterminate");
  else
    v6 = CFSTR("is_indeterminate");
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setIsIndeterminate:", objc_msgSend(v7, "BOOLValue"));

  if (a3)
    v8 = CFSTR("fractionCompleted");
  else
    v8 = CFSTR("fraction_completed");
  objc_msgSend(v5, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v9, "floatValue");
    objc_msgSend(a1, "setFractionCompleted:");
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kind"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v10, "isEqualToString:", CFSTR("KIND_FILE"));
    v11 = 1;
LABEL_17:
    objc_msgSend(a1, "setKind:", v11);
    goto LABEL_18;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = objc_msgSend(v10, "intValue");
    goto LABEL_17;
  }
LABEL_18:

  if (a3)
    v12 = CFSTR("byteTotalCount");
  else
    v12 = CFSTR("byte_total_count");
  objc_msgSend(v5, "objectForKeyedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setByteTotalCount:", objc_msgSend(v13, "unsignedLongLongValue"));

  if (a3)
    v14 = CFSTR("byteCompletedCount");
  else
    v14 = CFSTR("byte_completed_count");
  objc_msgSend(v5, "objectForKeyedSubscript:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setByteCompletedCount:", objc_msgSend(v15, "unsignedLongLongValue"));

LABEL_29:
  return a1;
}

- (GEOPairedDeviceProgress)initWithJSON:(id)a3
{
  return (GEOPairedDeviceProgress *)-[GEOPairedDeviceProgress _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPairedDeviceProgressIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPairedDeviceProgressReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  char flags;
  id v5;

  v5 = a3;
  flags = (char)self->_flags;
  if ((flags & 0x10) != 0)
  {
    PBDataWriterWriteBOOLField();
    flags = (char)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_3:
      if ((flags & 8) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteFloatField();
  flags = (char)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_4:
    if ((flags & 2) == 0)
      goto LABEL_5;
LABEL_11:
    PBDataWriterWriteUint64Field();
    if ((*(_BYTE *)&self->_flags & 1) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_10:
  PBDataWriterWriteInt32Field();
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
    goto LABEL_11;
LABEL_5:
  if ((flags & 1) != 0)
LABEL_6:
    PBDataWriterWriteUint64Field();
LABEL_7:
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v5);

}

- (void)copyTo:(id)a3
{
  char flags;
  _BYTE *v5;

  v5 = a3;
  -[GEOPairedDeviceProgress readAll:](self, "readAll:", 0);
  flags = (char)self->_flags;
  if ((flags & 0x10) != 0)
  {
    v5[40] = self->_isIndeterminate;
    v5[44] |= 0x10u;
    flags = (char)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_3:
      if ((flags & 8) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v5 + 8) = LODWORD(self->_fractionCompleted);
  v5[44] |= 4u;
  flags = (char)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_4:
    if ((flags & 2) == 0)
      goto LABEL_5;
LABEL_11:
    *((_QWORD *)v5 + 3) = self->_byteTotalCount;
    v5[44] |= 2u;
    if ((*(_BYTE *)&self->_flags & 1) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_10:
  *((_DWORD *)v5 + 9) = self->_kind;
  v5[44] |= 8u;
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
    goto LABEL_11;
LABEL_5:
  if ((flags & 1) != 0)
  {
LABEL_6:
    *((_QWORD *)v5 + 2) = self->_byteCompletedCount;
    v5[44] |= 1u;
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
  if ((flags & 0x10) != 0)
  {
    *(_BYTE *)(v4 + 40) = self->_isIndeterminate;
    *(_BYTE *)(v4 + 44) |= 0x10u;
    flags = (char)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_3:
      if ((flags & 8) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 4) == 0)
  {
    goto LABEL_3;
  }
  *(float *)(v4 + 32) = self->_fractionCompleted;
  *(_BYTE *)(v4 + 44) |= 4u;
  flags = (char)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_4:
    if ((flags & 2) == 0)
      goto LABEL_5;
LABEL_11:
    *(_QWORD *)(v4 + 24) = self->_byteTotalCount;
    *(_BYTE *)(v4 + 44) |= 2u;
    if ((*(_BYTE *)&self->_flags & 1) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_10:
  *(_DWORD *)(v4 + 36) = self->_kind;
  *(_BYTE *)(v4 + 44) |= 8u;
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
    goto LABEL_11;
LABEL_5:
  if ((flags & 1) != 0)
  {
LABEL_6:
    *(_QWORD *)(v4 + 16) = self->_byteCompletedCount;
    *(_BYTE *)(v4 + 44) |= 1u;
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
    goto LABEL_29;
  -[GEOPairedDeviceProgress readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 0x10) != 0)
    {
      if (self->_isIndeterminate)
      {
        if (!*((_BYTE *)v4 + 40))
          goto LABEL_29;
        goto LABEL_10;
      }
      if (!*((_BYTE *)v4 + 40))
        goto LABEL_10;
    }
LABEL_29:
    v5 = 0;
    goto LABEL_30;
  }
  if ((*((_BYTE *)v4 + 44) & 0x10) != 0)
    goto LABEL_29;
LABEL_10:
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 4) == 0 || self->_fractionCompleted != *((float *)v4 + 8))
      goto LABEL_29;
  }
  else if ((*((_BYTE *)v4 + 44) & 4) != 0)
  {
    goto LABEL_29;
  }
  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 8) == 0 || self->_kind != *((_DWORD *)v4 + 9))
      goto LABEL_29;
  }
  else if ((*((_BYTE *)v4 + 44) & 8) != 0)
  {
    goto LABEL_29;
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 2) == 0 || self->_byteTotalCount != *((_QWORD *)v4 + 3))
      goto LABEL_29;
  }
  else if ((*((_BYTE *)v4 + 44) & 2) != 0)
  {
    goto LABEL_29;
  }
  v5 = (*((_BYTE *)v4 + 44) & 1) == 0;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 1) == 0 || self->_byteCompletedCount != *((_QWORD *)v4 + 2))
      goto LABEL_29;
    v5 = 1;
  }
LABEL_30:

  return v5;
}

- (unint64_t)hash
{
  char flags;
  uint64_t v4;
  float fractionCompleted;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;

  -[GEOPairedDeviceProgress readAll:](self, "readAll:", 1);
  flags = (char)self->_flags;
  if ((flags & 0x10) != 0)
  {
    v4 = 2654435761 * self->_isIndeterminate;
    if ((*(_BYTE *)&self->_flags & 4) != 0)
      goto LABEL_3;
LABEL_8:
    v9 = 0;
    goto LABEL_11;
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_flags & 4) == 0)
    goto LABEL_8;
LABEL_3:
  fractionCompleted = self->_fractionCompleted;
  v6 = fractionCompleted;
  if (fractionCompleted < 0.0)
    v6 = -fractionCompleted;
  v7 = floor(v6 + 0.5);
  v8 = (v6 - v7) * 1.84467441e19;
  v9 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
  if (v8 >= 0.0)
  {
    if (v8 > 0.0)
      v9 += (unint64_t)v8;
  }
  else
  {
    v9 -= (unint64_t)fabs(v8);
  }
LABEL_11:
  if ((flags & 8) == 0)
  {
    v10 = 0;
    if ((flags & 2) != 0)
      goto LABEL_13;
LABEL_16:
    v11 = 0;
    if ((flags & 1) != 0)
      goto LABEL_14;
LABEL_17:
    v12 = 0;
    return v9 ^ v4 ^ v10 ^ v11 ^ v12;
  }
  v10 = 2654435761 * self->_kind;
  if ((flags & 2) == 0)
    goto LABEL_16;
LABEL_13:
  v11 = 2654435761u * self->_byteTotalCount;
  if ((flags & 1) == 0)
    goto LABEL_17;
LABEL_14:
  v12 = 2654435761u * self->_byteCompletedCount;
  return v9 ^ v4 ^ v10 ^ v11 ^ v12;
}

- (void)mergeFrom:(id)a3
{
  char v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "readAll:", 0);
  v4 = *((_BYTE *)v5 + 44);
  if ((v4 & 0x10) != 0)
  {
    self->_isIndeterminate = *((_BYTE *)v5 + 40);
    *(_BYTE *)&self->_flags |= 0x10u;
    v4 = *((_BYTE *)v5 + 44);
    if ((v4 & 4) == 0)
    {
LABEL_3:
      if ((v4 & 8) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*((_BYTE *)v5 + 44) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_fractionCompleted = *((float *)v5 + 8);
  *(_BYTE *)&self->_flags |= 4u;
  v4 = *((_BYTE *)v5 + 44);
  if ((v4 & 8) == 0)
  {
LABEL_4:
    if ((v4 & 2) == 0)
      goto LABEL_5;
LABEL_11:
    self->_byteTotalCount = *((_QWORD *)v5 + 3);
    *(_BYTE *)&self->_flags |= 2u;
    if ((*((_BYTE *)v5 + 44) & 1) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_10:
  self->_kind = *((_DWORD *)v5 + 9);
  *(_BYTE *)&self->_flags |= 8u;
  v4 = *((_BYTE *)v5 + 44);
  if ((v4 & 2) != 0)
    goto LABEL_11;
LABEL_5:
  if ((v4 & 1) != 0)
  {
LABEL_6:
    self->_byteCompletedCount = *((_QWORD *)v5 + 2);
    *(_BYTE *)&self->_flags |= 1u;
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
    -[GEOPairedDeviceProgress readAll:](self, "readAll:", 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end
