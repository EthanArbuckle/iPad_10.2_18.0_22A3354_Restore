@implementation GEORPCorrectedFlag

- (int)flag
{
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    return self->_flag;
  else
    return 0;
}

- (void)setFlag:(int)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_flag = a3;
}

- (void)setHasFlag:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasFlag
{
  return *(_BYTE *)&self->_flags & 1;
}

- (id)flagAsString:(int)a3
{
  __CFString *v3;

  if (!a3)
    return CFSTR("FLAG_TYPE_UNKNOWN");
  if (a3 == 1)
  {
    v3 = CFSTR("FLAG_TYPE_ACCEPTS_APPLE_PAY");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsFlag:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FLAG_TYPE_UNKNOWN")) & 1) != 0)
    v4 = 0;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("FLAG_TYPE_ACCEPTS_APPLE_PAY"));

  return v4;
}

- (BOOL)originalValue
{
  return self->_originalValue;
}

- (void)setOriginalValue:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 4u;
  self->_originalValue = a3;
}

- (void)setHasOriginalValue:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasOriginalValue
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (BOOL)correctedValue
{
  return self->_correctedValue;
}

- (void)setCorrectedValue:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 2u;
  self->_correctedValue = a3;
}

- (void)setHasCorrectedValue:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasCorrectedValue
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
  v8.super_class = (Class)GEORPCorrectedFlag;
  -[GEORPCorrectedFlag description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORPCorrectedFlag dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPCorrectedFlag _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  char v5;
  int v6;
  __CFString *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  const __CFString *v11;

  if (a1)
  {
    objc_msgSend((id)a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_BYTE *)(a1 + 16);
    if ((v5 & 1) != 0)
    {
      v6 = *(_DWORD *)(a1 + 8);
      if (v6)
      {
        if (v6 == 1)
        {
          v7 = CFSTR("FLAG_TYPE_ACCEPTS_APPLE_PAY");
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 8));
          v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
      }
      else
      {
        v7 = CFSTR("FLAG_TYPE_UNKNOWN");
      }
      objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("flag"));

      v5 = *(_BYTE *)(a1 + 16);
    }
    if ((v5 & 4) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 13));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
        v9 = CFSTR("originalValue");
      else
        v9 = CFSTR("original_value");
      objc_msgSend(v4, "setObject:forKey:", v8, v9);

      v5 = *(_BYTE *)(a1 + 16);
    }
    if ((v5 & 2) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 12));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
        v11 = CFSTR("correctedValue");
      else
        v11 = CFSTR("corrected_value");
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
  return -[GEORPCorrectedFlag _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEORPCorrectedFlag)initWithDictionary:(id)a3
{
  return (GEORPCorrectedFlag *)-[GEORPCorrectedFlag _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  const __CFString *v9;
  void *v10;
  const __CFString *v11;
  void *v12;

  v5 = a2;
  if (!a1)
    goto LABEL_22;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_22;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("flag"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v6;
    if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FLAG_TYPE_UNKNOWN")) & 1) != 0)
      v8 = 0;
    else
      v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("FLAG_TYPE_ACCEPTS_APPLE_PAY"));

    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = objc_msgSend(v6, "intValue");
LABEL_10:
    objc_msgSend(a1, "setFlag:", v8);
  }

  if (a3)
    v9 = CFSTR("originalValue");
  else
    v9 = CFSTR("original_value");
  objc_msgSend(v5, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setOriginalValue:", objc_msgSend(v10, "BOOLValue"));

  if (a3)
    v11 = CFSTR("correctedValue");
  else
    v11 = CFSTR("corrected_value");
  objc_msgSend(v5, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setCorrectedValue:", objc_msgSend(v12, "BOOLValue"));

LABEL_22:
  return a1;
}

- (GEORPCorrectedFlag)initWithJSON:(id)a3
{
  return (GEORPCorrectedFlag *)-[GEORPCorrectedFlag _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPCorrectedFlagIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPCorrectedFlagReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char flags;
  id v6;

  v4 = a3;
  flags = (char)self->_flags;
  v6 = v4;
  if ((flags & 1) == 0)
  {
    if ((*(_BYTE *)&self->_flags & 4) == 0)
      goto LABEL_3;
LABEL_7:
    PBDataWriterWriteBOOLField();
    v4 = v6;
    if ((*(_BYTE *)&self->_flags & 2) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  PBDataWriterWriteInt32Field();
  v4 = v6;
  flags = (char)self->_flags;
  if ((flags & 4) != 0)
    goto LABEL_7;
LABEL_3:
  if ((flags & 2) != 0)
  {
LABEL_4:
    PBDataWriterWriteBOOLField();
    v4 = v6;
  }
LABEL_5:

}

- (void)copyTo:(id)a3
{
  char flags;
  _BYTE *v5;

  v5 = a3;
  -[GEORPCorrectedFlag readAll:](self, "readAll:", 0);
  flags = (char)self->_flags;
  if ((flags & 1) == 0)
  {
    if ((*(_BYTE *)&self->_flags & 4) == 0)
      goto LABEL_3;
LABEL_7:
    v5[13] = self->_originalValue;
    v5[16] |= 4u;
    if ((*(_BYTE *)&self->_flags & 2) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  *((_DWORD *)v5 + 2) = self->_flag;
  v5[16] |= 1u;
  flags = (char)self->_flags;
  if ((flags & 4) != 0)
    goto LABEL_7;
LABEL_3:
  if ((flags & 2) != 0)
  {
LABEL_4:
    v5[12] = self->_correctedValue;
    v5[16] |= 2u;
  }
LABEL_5:

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char flags;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    *((_DWORD *)result + 2) = self->_flag;
    *((_BYTE *)result + 16) |= 1u;
    flags = (char)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_3:
      if ((flags & 2) == 0)
        return result;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_BYTE *)result + 13) = self->_originalValue;
  *((_BYTE *)result + 16) |= 4u;
  if ((*(_BYTE *)&self->_flags & 2) == 0)
    return result;
LABEL_4:
  *((_BYTE *)result + 12) = self->_correctedValue;
  *((_BYTE *)result + 16) |= 2u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_17;
  -[GEORPCorrectedFlag readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 16) & 1) == 0 || self->_flag != *((_DWORD *)v4 + 2))
      goto LABEL_17;
  }
  else if ((*((_BYTE *)v4 + 16) & 1) != 0)
  {
    goto LABEL_17;
  }
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 16) & 4) == 0)
      goto LABEL_17;
    if (self->_originalValue)
    {
      if (!*((_BYTE *)v4 + 13))
        goto LABEL_17;
    }
    else if (*((_BYTE *)v4 + 13))
    {
      goto LABEL_17;
    }
  }
  else if ((*((_BYTE *)v4 + 16) & 4) != 0)
  {
    goto LABEL_17;
  }
  v5 = (*((_BYTE *)v4 + 16) & 2) == 0;
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 16) & 2) != 0)
    {
      if (self->_correctedValue)
      {
        if (!*((_BYTE *)v4 + 12))
          goto LABEL_17;
      }
      else if (*((_BYTE *)v4 + 12))
      {
        goto LABEL_17;
      }
      v5 = 1;
      goto LABEL_18;
    }
LABEL_17:
    v5 = 0;
  }
LABEL_18:

  return v5;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  -[GEORPCorrectedFlag readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) == 0)
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_flags & 4) != 0)
      goto LABEL_3;
LABEL_6:
    v4 = 0;
    if ((*(_BYTE *)&self->_flags & 2) != 0)
      goto LABEL_4;
LABEL_7:
    v5 = 0;
    return v4 ^ v3 ^ v5;
  }
  v3 = 2654435761 * self->_flag;
  if ((*(_BYTE *)&self->_flags & 4) == 0)
    goto LABEL_6;
LABEL_3:
  v4 = 2654435761 * self->_originalValue;
  if ((*(_BYTE *)&self->_flags & 2) == 0)
    goto LABEL_7;
LABEL_4:
  v5 = 2654435761 * self->_correctedValue;
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  char v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "readAll:", 0);
  v4 = *((_BYTE *)v5 + 16);
  if ((v4 & 1) == 0)
  {
    if ((*((_BYTE *)v5 + 16) & 4) == 0)
      goto LABEL_3;
LABEL_7:
    self->_originalValue = *((_BYTE *)v5 + 13);
    *(_BYTE *)&self->_flags |= 4u;
    if ((*((_BYTE *)v5 + 16) & 2) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  self->_flag = *((_DWORD *)v5 + 2);
  *(_BYTE *)&self->_flags |= 1u;
  v4 = *((_BYTE *)v5 + 16);
  if ((v4 & 4) != 0)
    goto LABEL_7;
LABEL_3:
  if ((v4 & 2) != 0)
  {
LABEL_4:
    self->_correctedValue = *((_BYTE *)v5 + 12);
    *(_BYTE *)&self->_flags |= 2u;
  }
LABEL_5:

}

@end
