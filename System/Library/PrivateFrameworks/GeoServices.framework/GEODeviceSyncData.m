@implementation GEODeviceSyncData

- (GEOSessionID)sessionId
{
  GEOSessionID *p_sessionId;
  unint64_t high;
  unint64_t low;
  GEOSessionID result;

  p_sessionId = &self->_sessionId;
  high = self->_sessionId._high;
  low = p_sessionId->_low;
  result._low = low;
  result._high = high;
  return result;
}

- (void)setSessionId:(GEOSessionID)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_sessionId = a3;
}

- (void)setHasSessionId:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasSessionId
{
  return *(_BYTE *)&self->_flags & 1;
}

- (double)createTime
{
  return self->_createTime;
}

- (void)setCreateTime:(double)a3
{
  *(_BYTE *)&self->_flags |= 2u;
  self->_createTime = a3;
}

- (void)setHasCreateTime:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasCreateTime
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
  v8.super_class = (Class)GEODeviceSyncData;
  -[GEODeviceSyncData description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEODeviceSyncData dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEODeviceSyncData _dictionaryRepresentation:]((uint64_t)self, 0);
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
    v5 = *(_BYTE *)(a1 + 32);
    if ((v5 & 1) != 0)
    {
      _GEOSessionIDDictionaryRepresentation((_QWORD *)(a1 + 8));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
        v7 = CFSTR("sessionId");
      else
        v7 = CFSTR("session_id");
      objc_msgSend(v4, "setObject:forKey:", v6, v7);

      v5 = *(_BYTE *)(a1 + 32);
    }
    if ((v5 & 2) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 24));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
        v9 = CFSTR("createTime");
      else
        v9 = CFSTR("create_time");
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
  return -[GEODeviceSyncData _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEODeviceSyncData)initWithDictionary:(id)a3
{
  return (GEODeviceSyncData *)-[GEODeviceSyncData _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("sessionId");
      else
        v6 = CFSTR("session_id");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = 0;
        v12 = 0;
        _GEOSessionIDFromDictionaryRepresentation(v7, &v11);
        objc_msgSend(a1, "setSessionId:", v11, v12);
      }

      if (a3)
        v8 = CFSTR("createTime");
      else
        v8 = CFSTR("create_time");
      objc_msgSend(v5, "objectForKeyedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v9, "doubleValue");
        objc_msgSend(a1, "setCreateTime:");
      }

    }
  }

  return a1;
}

- (GEODeviceSyncData)initWithJSON:(id)a3
{
  return (GEODeviceSyncData *)-[GEODeviceSyncData _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEODeviceSyncDataIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEODeviceSyncDataReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char flags;

  v4 = a3;
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    PBDataWriterPlaceMark();
    PBDataWriterWriteUint64Field();
    PBDataWriterWriteUint64Field();
    PBDataWriterRecallMark();
    flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
    PBDataWriterWriteDoubleField();

}

- (void)copyTo:(id)a3
{
  char flags;
  char *v5;

  v5 = (char *)a3;
  -[GEODeviceSyncData readAll:](self, "readAll:", 0);
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    *(GEOSessionID *)(v5 + 8) = self->_sessionId;
    v5[32] |= 1u;
    flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *((_QWORD *)v5 + 3) = *(_QWORD *)&self->_createTime;
    v5[32] |= 2u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char flags;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    *(GEOSessionID *)((char *)result + 8) = self->_sessionId;
    *((_BYTE *)result + 32) |= 1u;
    flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *((_QWORD *)result + 3) = *(_QWORD *)&self->_createTime;
    *((_BYTE *)result + 32) |= 2u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_15;
  -[GEODeviceSyncData readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 1) == 0)
      goto LABEL_15;
    if (self->_sessionId._high != *((_QWORD *)v4 + 1) || self->_sessionId._low != *((_QWORD *)v4 + 2))
      goto LABEL_15;
  }
  else if ((*((_BYTE *)v4 + 32) & 1) != 0)
  {
LABEL_15:
    v6 = 0;
    goto LABEL_16;
  }
  v6 = (*((_BYTE *)v4 + 32) & 2) == 0;
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 2) == 0 || self->_createTime != *((double *)v4 + 3))
      goto LABEL_15;
    v6 = 1;
  }
LABEL_16:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;
  double createTime;
  double v5;
  long double v6;
  double v7;
  unint64_t v8;

  -[GEODeviceSyncData readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    v3 = PBHashBytes();
    if ((*(_BYTE *)&self->_flags & 2) != 0)
      goto LABEL_3;
LABEL_8:
    v8 = 0;
    return v8 ^ v3;
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_flags & 2) == 0)
    goto LABEL_8;
LABEL_3:
  createTime = self->_createTime;
  v5 = -createTime;
  if (createTime >= 0.0)
    v5 = self->_createTime;
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
  char *v5;

  v5 = (char *)a3;
  objc_msgSend(v5, "readAll:", 0);
  v4 = v5[32];
  if ((v4 & 1) != 0)
  {
    self->_sessionId = *(GEOSessionID *)(v5 + 8);
    *(_BYTE *)&self->_flags |= 1u;
    v4 = v5[32];
  }
  if ((v4 & 2) != 0)
  {
    self->_createTime = *((double *)v5 + 3);
    *(_BYTE *)&self->_flags |= 2u;
  }

}

@end
