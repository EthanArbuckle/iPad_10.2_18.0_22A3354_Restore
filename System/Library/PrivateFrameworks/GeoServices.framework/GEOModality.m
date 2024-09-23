@implementation GEOModality

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(_BYTE *)&self->_flags & 1;
}

- (BOOL)expectedModality
{
  return self->_expectedModality;
}

- (void)setExpectedModality:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 4u;
  self->_expectedModality = a3;
}

- (void)setHasExpectedModality:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasExpectedModality
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (BOOL)notMoving
{
  return self->_notMoving;
}

- (void)setNotMoving:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 8u;
  self->_notMoving = a3;
}

- (void)setHasNotMoving:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xF7 | v3;
}

- (BOOL)hasNotMoving
{
  return (*(_BYTE *)&self->_flags >> 3) & 1;
}

- (int)confidence
{
  if ((*(_BYTE *)&self->_flags & 2) != 0)
    return self->_confidence;
  else
    return 0;
}

- (void)setConfidence:(int)a3
{
  *(_BYTE *)&self->_flags |= 2u;
  self->_confidence = a3;
}

- (void)setHasConfidence:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasConfidence
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (id)confidenceAsString:(int)a3
{
  if (a3 < 3)
    return off_1E1C0CB28[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsConfidence:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MODALITY_CONFIDENCE_LOW")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MODALITY_CONFIDENCE_MEDIUM")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("MODALITY_CONFIDENCE_HIGH")))
  {
    v4 = 2;
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
  v8.super_class = (Class)GEOModality;
  -[GEOModality description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOModality dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOModality _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  const __CFString *v10;
  uint64_t v11;
  __CFString *v12;

  if (!a1)
  {
    v4 = 0;
    return v4;
  }
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_BYTE *)(a1 + 24);
  if ((v5 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 8));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("timestamp"));

    v5 = *(_BYTE *)(a1 + 24);
  }
  if ((v5 & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 20));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v8 = CFSTR("expectedModality");
    else
      v8 = CFSTR("expected_modality");
    objc_msgSend(v4, "setObject:forKey:", v7, v8);

    v5 = *(_BYTE *)(a1 + 24);
    if ((v5 & 8) == 0)
    {
LABEL_6:
      if ((v5 & 2) == 0)
        return v4;
      goto LABEL_16;
    }
  }
  else if ((v5 & 8) == 0)
  {
    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 21));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v10 = CFSTR("notMoving");
  else
    v10 = CFSTR("not_moving");
  objc_msgSend(v4, "setObject:forKey:", v9, v10);

  if ((*(_BYTE *)(a1 + 24) & 2) != 0)
  {
LABEL_16:
    v11 = *(int *)(a1 + 16);
    if (v11 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 16));
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = off_1E1C0CB28[v11];
    }
    objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("confidence"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOModality _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOModality)initWithDictionary:(id)a3
{
  return (GEOModality *)-[GEOModality _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("timestamp"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v6, "doubleValue");
        objc_msgSend(a1, "setTimestamp:");
      }

      if (a3)
        v7 = CFSTR("expectedModality");
      else
        v7 = CFSTR("expected_modality");
      objc_msgSend(v5, "objectForKeyedSubscript:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setExpectedModality:", objc_msgSend(v8, "BOOLValue"));

      if (a3)
        v9 = CFSTR("notMoving");
      else
        v9 = CFSTR("not_moving");
      objc_msgSend(v5, "objectForKeyedSubscript:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setNotMoving:", objc_msgSend(v10, "BOOLValue"));

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("confidence"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v12 = v11;
        if ((objc_msgSend(v12, "isEqualToString:", CFSTR("MODALITY_CONFIDENCE_LOW")) & 1) != 0)
        {
          v13 = 0;
        }
        else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("MODALITY_CONFIDENCE_MEDIUM")) & 1) != 0)
        {
          v13 = 1;
        }
        else if (objc_msgSend(v12, "isEqualToString:", CFSTR("MODALITY_CONFIDENCE_HIGH")))
        {
          v13 = 2;
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
LABEL_27:

          goto LABEL_28;
        }
        v13 = objc_msgSend(v11, "intValue");
      }
      objc_msgSend(a1, "setConfidence:", v13);
      goto LABEL_27;
    }
  }
LABEL_28:

  return a1;
}

- (GEOModality)initWithJSON:(id)a3
{
  return (GEOModality *)-[GEOModality _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOModalityIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOModalityReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  char flags;
  id v5;

  v5 = a3;
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    PBDataWriterWriteDoubleField();
    flags = (char)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_3:
      if ((flags & 8) == 0)
        goto LABEL_4;
LABEL_9:
      PBDataWriterWriteBOOLField();
      if ((*(_BYTE *)&self->_flags & 2) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  flags = (char)self->_flags;
  if ((flags & 8) != 0)
    goto LABEL_9;
LABEL_4:
  if ((flags & 2) != 0)
LABEL_5:
    PBDataWriterWriteInt32Field();
LABEL_6:

}

- (void)copyTo:(id)a3
{
  char flags;
  _QWORD *v5;

  v5 = a3;
  -[GEOModality readAll:](self, "readAll:", 0);
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    v5[1] = *(_QWORD *)&self->_timestamp;
    *((_BYTE *)v5 + 24) |= 1u;
    flags = (char)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_3:
      if ((flags & 8) == 0)
        goto LABEL_4;
LABEL_9:
      *((_BYTE *)v5 + 21) = self->_notMoving;
      *((_BYTE *)v5 + 24) |= 8u;
      if ((*(_BYTE *)&self->_flags & 2) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_BYTE *)v5 + 20) = self->_expectedModality;
  *((_BYTE *)v5 + 24) |= 4u;
  flags = (char)self->_flags;
  if ((flags & 8) != 0)
    goto LABEL_9;
LABEL_4:
  if ((flags & 2) != 0)
  {
LABEL_5:
    *((_DWORD *)v5 + 4) = self->_confidence;
    *((_BYTE *)v5 + 24) |= 2u;
  }
LABEL_6:

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char flags;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    *((_QWORD *)result + 1) = *(_QWORD *)&self->_timestamp;
    *((_BYTE *)result + 24) |= 1u;
    flags = (char)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_3:
      if ((flags & 8) == 0)
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_BYTE *)result + 20) = self->_expectedModality;
  *((_BYTE *)result + 24) |= 4u;
  flags = (char)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_4:
    if ((flags & 2) == 0)
      return result;
    goto LABEL_5;
  }
LABEL_9:
  *((_BYTE *)result + 21) = self->_notMoving;
  *((_BYTE *)result + 24) |= 8u;
  if ((*(_BYTE *)&self->_flags & 2) == 0)
    return result;
LABEL_5:
  *((_DWORD *)result + 4) = self->_confidence;
  *((_BYTE *)result + 24) |= 2u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_27;
  -[GEOModality readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 1) == 0 || self->_timestamp != *((double *)v4 + 1))
      goto LABEL_27;
  }
  else if ((*((_BYTE *)v4 + 24) & 1) != 0)
  {
    goto LABEL_27;
  }
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 4) == 0)
      goto LABEL_27;
    if (self->_expectedModality)
    {
      if (!*((_BYTE *)v4 + 20))
        goto LABEL_27;
    }
    else if (*((_BYTE *)v4 + 20))
    {
      goto LABEL_27;
    }
  }
  else if ((*((_BYTE *)v4 + 24) & 4) != 0)
  {
    goto LABEL_27;
  }
  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 8) != 0)
    {
      if (self->_notMoving)
      {
        if (!*((_BYTE *)v4 + 21))
          goto LABEL_27;
        goto LABEL_23;
      }
      if (!*((_BYTE *)v4 + 21))
        goto LABEL_23;
    }
LABEL_27:
    v5 = 0;
    goto LABEL_28;
  }
  if ((*((_BYTE *)v4 + 24) & 8) != 0)
    goto LABEL_27;
LABEL_23:
  v5 = (*((_BYTE *)v4 + 24) & 2) == 0;
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 2) == 0 || self->_confidence != *((_DWORD *)v4 + 4))
      goto LABEL_27;
    v5 = 1;
  }
LABEL_28:

  return v5;
}

- (unint64_t)hash
{
  char flags;
  unint64_t v4;
  double timestamp;
  double v6;
  long double v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  -[GEOModality readAll:](self, "readAll:", 1);
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    timestamp = self->_timestamp;
    v6 = -timestamp;
    if (timestamp >= 0.0)
      v6 = self->_timestamp;
    v7 = floor(v6 + 0.5);
    v8 = (v6 - v7) * 1.84467441e19;
    v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0)
        v4 += (unint64_t)v8;
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    v4 = 0;
  }
  if ((flags & 4) == 0)
  {
    v9 = 0;
    if ((flags & 8) != 0)
      goto LABEL_11;
LABEL_14:
    v10 = 0;
    if ((flags & 2) != 0)
      goto LABEL_12;
LABEL_15:
    v11 = 0;
    return v9 ^ v4 ^ v10 ^ v11;
  }
  v9 = 2654435761 * self->_expectedModality;
  if ((flags & 8) == 0)
    goto LABEL_14;
LABEL_11:
  v10 = 2654435761 * self->_notMoving;
  if ((flags & 2) == 0)
    goto LABEL_15;
LABEL_12:
  v11 = 2654435761 * self->_confidence;
  return v9 ^ v4 ^ v10 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  char v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "readAll:", 0);
  v4 = *((_BYTE *)v5 + 24);
  if ((v4 & 1) != 0)
  {
    self->_timestamp = *((double *)v5 + 1);
    *(_BYTE *)&self->_flags |= 1u;
    v4 = *((_BYTE *)v5 + 24);
    if ((v4 & 4) == 0)
    {
LABEL_3:
      if ((v4 & 8) == 0)
        goto LABEL_4;
LABEL_9:
      self->_notMoving = *((_BYTE *)v5 + 21);
      *(_BYTE *)&self->_flags |= 8u;
      if ((*((_BYTE *)v5 + 24) & 2) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*((_BYTE *)v5 + 24) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_expectedModality = *((_BYTE *)v5 + 20);
  *(_BYTE *)&self->_flags |= 4u;
  v4 = *((_BYTE *)v5 + 24);
  if ((v4 & 8) != 0)
    goto LABEL_9;
LABEL_4:
  if ((v4 & 2) != 0)
  {
LABEL_5:
    self->_confidence = *((_DWORD *)v5 + 4);
    *(_BYTE *)&self->_flags |= 2u;
  }
LABEL_6:

}

@end
