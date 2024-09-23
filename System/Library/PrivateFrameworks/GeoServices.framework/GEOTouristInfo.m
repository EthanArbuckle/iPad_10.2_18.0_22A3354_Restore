@implementation GEOTouristInfo

- (BOOL)isTourist
{
  return self->_isTourist;
}

- (void)setIsTourist:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 2u;
  self->_isTourist = a3;
}

- (void)setHasIsTourist:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasIsTourist
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (double)fetchTimestamp
{
  return self->_fetchTimestamp;
}

- (void)setFetchTimestamp:(double)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_fetchTimestamp = a3;
}

- (void)setHasFetchTimestamp:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasFetchTimestamp
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
  v8.super_class = (Class)GEOTouristInfo;
  -[GEOTouristInfo description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOTouristInfo dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOTouristInfo _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  char v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  const __CFString *v9;

  if (a1)
  {
    objc_msgSend((id)a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_BYTE *)(a1 + 20);
    if ((v5 & 2) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 16));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
        v7 = CFSTR("isTourist");
      else
        v7 = CFSTR("is_tourist");
      objc_msgSend(v4, "setObject:forKey:", v6, v7);

      v5 = *(_BYTE *)(a1 + 20);
    }
    if ((v5 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 8));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
        v9 = CFSTR("fetchTimestamp");
      else
        v9 = CFSTR("fetch_timestamp");
      objc_msgSend(v4, "setObject:forKey:", v8, v9);

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
  return -[GEOTouristInfo _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOTouristInfo)initWithDictionary:(id)a3
{
  return (GEOTouristInfo *)-[GEOTouristInfo _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  const __CFString *v8;
  void *v9;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("isTourist");
      else
        v6 = CFSTR("is_tourist");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setIsTourist:", objc_msgSend(v7, "BOOLValue"));

      if (a3)
        v8 = CFSTR("fetchTimestamp");
      else
        v8 = CFSTR("fetch_timestamp");
      objc_msgSend(v5, "objectForKeyedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v9, "doubleValue");
        objc_msgSend(a1, "setFetchTimestamp:");
      }

    }
  }

  return a1;
}

- (GEOTouristInfo)initWithJSON:(id)a3
{
  return (GEOTouristInfo *)-[GEOTouristInfo _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOTouristInfoIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOTouristInfoReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char flags;
  id v6;

  v4 = a3;
  flags = (char)self->_flags;
  v6 = v4;
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v6;
    flags = (char)self->_flags;
  }
  if ((flags & 1) != 0)
  {
    PBDataWriterWriteDoubleField();
    v4 = v6;
  }

}

- (void)copyTo:(id)a3
{
  char flags;
  _BYTE *v5;

  v5 = a3;
  -[GEOTouristInfo readAll:](self, "readAll:", 0);
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    v5[16] = self->_isTourist;
    v5[20] |= 2u;
    flags = (char)self->_flags;
  }
  if ((flags & 1) != 0)
  {
    *((_QWORD *)v5 + 1) = *(_QWORD *)&self->_fetchTimestamp;
    v5[20] |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char flags;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *((_BYTE *)result + 16) = self->_isTourist;
    *((_BYTE *)result + 20) |= 2u;
    flags = (char)self->_flags;
  }
  if ((flags & 1) != 0)
  {
    *((_QWORD *)result + 1) = *(_QWORD *)&self->_fetchTimestamp;
    *((_BYTE *)result + 20) |= 1u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_14;
  -[GEOTouristInfo readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 2) != 0)
    {
      if (self->_isTourist)
      {
        if (!*((_BYTE *)v4 + 16))
          goto LABEL_14;
        goto LABEL_10;
      }
      if (!*((_BYTE *)v4 + 16))
        goto LABEL_10;
    }
LABEL_14:
    v5 = 0;
    goto LABEL_15;
  }
  if ((*((_BYTE *)v4 + 20) & 2) != 0)
    goto LABEL_14;
LABEL_10:
  v5 = (*((_BYTE *)v4 + 20) & 1) == 0;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 1) == 0 || self->_fetchTimestamp != *((double *)v4 + 1))
      goto LABEL_14;
    v5 = 1;
  }
LABEL_15:

  return v5;
}

- (unint64_t)hash
{
  uint64_t v3;
  double fetchTimestamp;
  double v5;
  long double v6;
  double v7;
  unint64_t v8;

  -[GEOTouristInfo readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    v3 = 2654435761 * self->_isTourist;
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      goto LABEL_3;
LABEL_8:
    v8 = 0;
    return v8 ^ v3;
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_flags & 1) == 0)
    goto LABEL_8;
LABEL_3:
  fetchTimestamp = self->_fetchTimestamp;
  v5 = -fetchTimestamp;
  if (fetchTimestamp >= 0.0)
    v5 = self->_fetchTimestamp;
  v6 = floor(v5 + 0.5);
  v7 = (v5 - v6) * 1.84467441e19;
  v8 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
  if (v7 >= 0.0)
  {
    if (v7 > 0.0)
      v8 += (unint64_t)v7;
  }
  else
  {
    v8 -= (unint64_t)fabs(v7);
  }
  return v8 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  char v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "readAll:", 0);
  v4 = *((_BYTE *)v5 + 20);
  if ((v4 & 2) != 0)
  {
    self->_isTourist = *((_BYTE *)v5 + 16);
    *(_BYTE *)&self->_flags |= 2u;
    v4 = *((_BYTE *)v5 + 20);
  }
  if ((v4 & 1) != 0)
  {
    self->_fetchTimestamp = *((double *)v5 + 1);
    *(_BYTE *)&self->_flags |= 1u;
  }

}

@end
