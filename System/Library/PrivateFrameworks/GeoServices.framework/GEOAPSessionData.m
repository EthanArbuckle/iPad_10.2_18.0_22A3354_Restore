@implementation GEOAPSessionData

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
  *(_BYTE *)&self->_flags |= 4u;
  self->_createTime = a3;
}

- (void)setHasCreateTime:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasCreateTime
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (unint64_t)sessionEpoch
{
  return self->_sessionEpoch;
}

- (void)setSessionEpoch:(unint64_t)a3
{
  *(_BYTE *)&self->_flags |= 0x10u;
  self->_sessionEpoch = a3;
}

- (void)setHasSessionEpoch:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xEF | v3;
}

- (BOOL)hasSessionEpoch
{
  return (*(_BYTE *)&self->_flags >> 4) & 1;
}

- (double)mapsUserStartDate
{
  return self->_mapsUserStartDate;
}

- (void)setMapsUserStartDate:(double)a3
{
  *(_BYTE *)&self->_flags |= 8u;
  self->_mapsUserStartDate = a3;
}

- (void)setHasMapsUserStartDate:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xF7 | v3;
}

- (BOOL)hasMapsUserStartDate
{
  return (*(_BYTE *)&self->_flags >> 3) & 1;
}

- (unsigned)opaqueAppId
{
  return self->_opaqueAppId;
}

- (void)setOpaqueAppId:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 0x20u;
  self->_opaqueAppId = a3;
}

- (void)setHasOpaqueAppId:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xDF | v3;
}

- (BOOL)hasOpaqueAppId
{
  return (*(_BYTE *)&self->_flags >> 5) & 1;
}

- (BOOL)hasOriginHardwareClass
{
  return self->_originHardwareClass != 0;
}

- (NSString)originHardwareClass
{
  return self->_originHardwareClass;
}

- (void)setOriginHardwareClass:(id)a3
{
  objc_storeStrong((id *)&self->_originHardwareClass, a3);
}

- (double)createTimeInUse
{
  return self->_createTimeInUse;
}

- (void)setCreateTimeInUse:(double)a3
{
  *(_BYTE *)&self->_flags |= 2u;
  self->_createTimeInUse = a3;
}

- (void)setHasCreateTimeInUse:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasCreateTimeInUse
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (BOOL)sessionHasRotated
{
  return self->_sessionHasRotated;
}

- (void)setSessionHasRotated:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 0x40u;
  self->_sessionHasRotated = a3;
}

- (void)setHasSessionHasRotated:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xBF | v3;
}

- (BOOL)hasSessionHasRotated
{
  return (*(_BYTE *)&self->_flags >> 6) & 1;
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
  v8.super_class = (Class)GEOAPSessionData;
  -[GEOAPSessionData description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOAPSessionData dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOAPSessionData _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  char v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  const __CFString *v11;
  char v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  const __CFString *v16;
  void *v18;
  const __CFString *v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  const __CFString *v23;

  if (!a1)
  {
    v4 = 0;
    return v4;
  }
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_BYTE *)(a1 + 72);
  if ((v5 & 1) != 0)
  {
    _GEOSessionIDDictionaryRepresentation((_QWORD *)(a1 + 8));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v7 = CFSTR("sessionId");
    else
      v7 = CFSTR("session_id");
    objc_msgSend(v4, "setObject:forKey:", v6, v7);

    v5 = *(_BYTE *)(a1 + 72);
  }
  if ((v5 & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 32));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v19 = CFSTR("createTime");
    else
      v19 = CFSTR("create_time");
    objc_msgSend(v4, "setObject:forKey:", v18, v19);

    v5 = *(_BYTE *)(a1 + 72);
    if ((v5 & 0x10) == 0)
    {
LABEL_9:
      if ((v5 & 8) == 0)
        goto LABEL_10;
LABEL_39:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 40));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
        v23 = CFSTR("mapsUserStartDate");
      else
        v23 = CFSTR("maps_user_start_date");
      objc_msgSend(v4, "setObject:forKey:", v22, v23);

      if ((*(_BYTE *)(a1 + 72) & 0x20) == 0)
        goto LABEL_15;
      goto LABEL_11;
    }
  }
  else if ((v5 & 0x10) == 0)
  {
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 56));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v21 = CFSTR("sessionEpoch");
  else
    v21 = CFSTR("session_epoch");
  objc_msgSend(v4, "setObject:forKey:", v20, v21);

  v5 = *(_BYTE *)(a1 + 72);
  if ((v5 & 8) != 0)
    goto LABEL_39;
LABEL_10:
  if ((v5 & 0x20) != 0)
  {
LABEL_11:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 64));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v9 = CFSTR("opaqueAppId");
    else
      v9 = CFSTR("opaque_app_id");
    objc_msgSend(v4, "setObject:forKey:", v8, v9);

  }
LABEL_15:
  objc_msgSend((id)a1, "originHardwareClass");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    if (a2)
      v11 = CFSTR("originHardwareClass");
    else
      v11 = CFSTR("origin_hardware_class");
    objc_msgSend(v4, "setObject:forKey:", v10, v11);
  }

  v12 = *(_BYTE *)(a1 + 72);
  if ((v12 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 24));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v14 = CFSTR("createTimeInUse");
    else
      v14 = CFSTR("create_time_in_use");
    objc_msgSend(v4, "setObject:forKey:", v13, v14);

    v12 = *(_BYTE *)(a1 + 72);
  }
  if ((v12 & 0x40) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 68));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v16 = CFSTR("sessionHasRotated");
    else
      v16 = CFSTR("session_has_rotated");
    objc_msgSend(v4, "setObject:forKey:", v15, v16);

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOAPSessionData _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOAPSessionData)initWithDictionary:(id)a3
{
  return (GEOAPSessionData *)-[GEOAPSessionData _initWithDictionary:isJSON:](self, a3, 0);
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
  void *v18;
  const __CFString *v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  uint64_t v24;
  uint64_t v25;

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
        v24 = 0;
        v25 = 0;
        _GEOSessionIDFromDictionaryRepresentation(v7, &v24);
        objc_msgSend(a1, "setSessionId:", v24, v25);
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

      if (a3)
        v10 = CFSTR("sessionEpoch");
      else
        v10 = CFSTR("session_epoch");
      objc_msgSend(v5, "objectForKeyedSubscript:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setSessionEpoch:", objc_msgSend(v11, "unsignedLongLongValue"));

      if (a3)
        v12 = CFSTR("mapsUserStartDate");
      else
        v12 = CFSTR("maps_user_start_date");
      objc_msgSend(v5, "objectForKeyedSubscript:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v13, "doubleValue");
        objc_msgSend(a1, "setMapsUserStartDate:");
      }

      if (a3)
        v14 = CFSTR("opaqueAppId");
      else
        v14 = CFSTR("opaque_app_id");
      objc_msgSend(v5, "objectForKeyedSubscript:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setOpaqueAppId:", objc_msgSend(v15, "unsignedIntValue"));

      if (a3)
        v16 = CFSTR("originHardwareClass");
      else
        v16 = CFSTR("origin_hardware_class");
      objc_msgSend(v5, "objectForKeyedSubscript:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v18 = (void *)objc_msgSend(v17, "copy");
        objc_msgSend(a1, "setOriginHardwareClass:", v18);

      }
      if (a3)
        v19 = CFSTR("createTimeInUse");
      else
        v19 = CFSTR("create_time_in_use");
      objc_msgSend(v5, "objectForKeyedSubscript:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v20, "doubleValue");
        objc_msgSend(a1, "setCreateTimeInUse:");
      }

      if (a3)
        v21 = CFSTR("sessionHasRotated");
      else
        v21 = CFSTR("session_has_rotated");
      objc_msgSend(v5, "objectForKeyedSubscript:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setSessionHasRotated:", objc_msgSend(v22, "BOOLValue"));

    }
  }

  return a1;
}

- (GEOAPSessionData)initWithJSON:(id)a3
{
  return (GEOAPSessionData *)-[GEOAPSessionData _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOAPSessionDataIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOAPSessionDataReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char flags;
  char v6;

  v4 = a3;
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    PBDataWriterPlaceMark();
    PBDataWriterWriteUint64Field();
    PBDataWriterWriteUint64Field();
    PBDataWriterRecallMark();
    flags = (char)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_3:
      if ((flags & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_16;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteDoubleField();
  flags = (char)self->_flags;
  if ((flags & 0x10) == 0)
  {
LABEL_4:
    if ((flags & 8) == 0)
      goto LABEL_5;
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteUint64Field();
  flags = (char)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_5:
    if ((flags & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_17:
  PBDataWriterWriteDoubleField();
  if ((*(_BYTE *)&self->_flags & 0x20) != 0)
LABEL_6:
    PBDataWriterWriteUint32Field();
LABEL_7:
  if (self->_originHardwareClass)
    PBDataWriterWriteStringField();
  v6 = (char)self->_flags;
  if ((v6 & 2) != 0)
  {
    PBDataWriterWriteDoubleField();
    v6 = (char)self->_flags;
  }
  if ((v6 & 0x40) != 0)
    PBDataWriterWriteBOOLField();

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  char flags;
  char v6;
  char *v7;

  v7 = (char *)a3;
  -[GEOAPSessionData readAll:](self, "readAll:", 0);
  v4 = v7;
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    *(GEOSessionID *)(v7 + 8) = self->_sessionId;
    v7[72] |= 1u;
    flags = (char)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_3:
      if ((flags & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_16;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_QWORD *)v7 + 4) = *(_QWORD *)&self->_createTime;
  v7[72] |= 4u;
  flags = (char)self->_flags;
  if ((flags & 0x10) == 0)
  {
LABEL_4:
    if ((flags & 8) == 0)
      goto LABEL_5;
    goto LABEL_17;
  }
LABEL_16:
  *((_QWORD *)v7 + 7) = self->_sessionEpoch;
  v7[72] |= 0x10u;
  flags = (char)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_5:
    if ((flags & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_17:
  *((_QWORD *)v7 + 5) = *(_QWORD *)&self->_mapsUserStartDate;
  v7[72] |= 8u;
  if ((*(_BYTE *)&self->_flags & 0x20) != 0)
  {
LABEL_6:
    *((_DWORD *)v7 + 16) = self->_opaqueAppId;
    v7[72] |= 0x20u;
  }
LABEL_7:
  if (self->_originHardwareClass)
  {
    objc_msgSend(v7, "setOriginHardwareClass:");
    v4 = v7;
  }
  v6 = (char)self->_flags;
  if ((v6 & 2) != 0)
  {
    v4[3] = *(_QWORD *)&self->_createTimeInUse;
    *((_BYTE *)v4 + 72) |= 2u;
    v6 = (char)self->_flags;
  }
  if ((v6 & 0x40) != 0)
  {
    *((_BYTE *)v4 + 68) = self->_sessionHasRotated;
    *((_BYTE *)v4 + 72) |= 0x40u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  char flags;
  uint64_t v8;
  void *v9;
  char v10;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    *(GEOSessionID *)(v5 + 8) = self->_sessionId;
    *(_BYTE *)(v5 + 72) |= 1u;
    flags = (char)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_3:
      if ((flags & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_14;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 4) == 0)
  {
    goto LABEL_3;
  }
  *(double *)(v5 + 32) = self->_createTime;
  *(_BYTE *)(v5 + 72) |= 4u;
  flags = (char)self->_flags;
  if ((flags & 0x10) == 0)
  {
LABEL_4:
    if ((flags & 8) == 0)
      goto LABEL_5;
    goto LABEL_15;
  }
LABEL_14:
  *(_QWORD *)(v5 + 56) = self->_sessionEpoch;
  *(_BYTE *)(v5 + 72) |= 0x10u;
  flags = (char)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_5:
    if ((flags & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_15:
  *(double *)(v5 + 40) = self->_mapsUserStartDate;
  *(_BYTE *)(v5 + 72) |= 8u;
  if ((*(_BYTE *)&self->_flags & 0x20) != 0)
  {
LABEL_6:
    *(_DWORD *)(v5 + 64) = self->_opaqueAppId;
    *(_BYTE *)(v5 + 72) |= 0x20u;
  }
LABEL_7:
  v8 = -[NSString copyWithZone:](self->_originHardwareClass, "copyWithZone:", a3);
  v9 = *(void **)(v6 + 48);
  *(_QWORD *)(v6 + 48) = v8;

  v10 = (char)self->_flags;
  if ((v10 & 2) != 0)
  {
    *(double *)(v6 + 24) = self->_createTimeInUse;
    *(_BYTE *)(v6 + 72) |= 2u;
    v10 = (char)self->_flags;
  }
  if ((v10 & 0x40) != 0)
  {
    *(_BYTE *)(v6 + 68) = self->_sessionHasRotated;
    *(_BYTE *)(v6 + 72) |= 0x40u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char flags;
  char v6;
  NSString *originHardwareClass;
  BOOL v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_41;
  -[GEOAPSessionData readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  flags = (char)self->_flags;
  v6 = *((_BYTE *)v4 + 72);
  if ((flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 72) & 1) == 0)
      goto LABEL_41;
    if (self->_sessionId._high != *((_QWORD *)v4 + 1) || self->_sessionId._low != *((_QWORD *)v4 + 2))
      goto LABEL_41;
  }
  else if ((*((_BYTE *)v4 + 72) & 1) != 0)
  {
    goto LABEL_41;
  }
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 72) & 4) == 0 || self->_createTime != *((double *)v4 + 4))
      goto LABEL_41;
  }
  else if ((*((_BYTE *)v4 + 72) & 4) != 0)
  {
    goto LABEL_41;
  }
  if ((*(_BYTE *)&self->_flags & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 72) & 0x10) == 0 || self->_sessionEpoch != *((_QWORD *)v4 + 7))
      goto LABEL_41;
  }
  else if ((*((_BYTE *)v4 + 72) & 0x10) != 0)
  {
    goto LABEL_41;
  }
  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 72) & 8) == 0 || self->_mapsUserStartDate != *((double *)v4 + 5))
      goto LABEL_41;
  }
  else if ((*((_BYTE *)v4 + 72) & 8) != 0)
  {
    goto LABEL_41;
  }
  if ((*(_BYTE *)&self->_flags & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 72) & 0x20) == 0 || self->_opaqueAppId != *((_DWORD *)v4 + 16))
      goto LABEL_41;
  }
  else if ((*((_BYTE *)v4 + 72) & 0x20) != 0)
  {
    goto LABEL_41;
  }
  originHardwareClass = self->_originHardwareClass;
  if ((unint64_t)originHardwareClass | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](originHardwareClass, "isEqual:"))
      goto LABEL_41;
    flags = (char)self->_flags;
    v6 = *((_BYTE *)v4 + 72);
  }
  if ((flags & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_createTimeInUse != *((double *)v4 + 3))
      goto LABEL_41;
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_41;
  }
  v9 = (v6 & 0x40) == 0;
  if ((flags & 0x40) != 0)
  {
    if ((v6 & 0x40) != 0)
    {
      if (self->_sessionHasRotated)
      {
        if (!*((_BYTE *)v4 + 68))
          goto LABEL_41;
      }
      else if (*((_BYTE *)v4 + 68))
      {
        goto LABEL_41;
      }
      v9 = 1;
      goto LABEL_42;
    }
LABEL_41:
    v9 = 0;
  }
LABEL_42:

  return v9;
}

- (unint64_t)hash
{
  char flags;
  uint64_t v4;
  unint64_t v5;
  double createTime;
  double v7;
  long double v8;
  double v9;
  unint64_t v10;
  double mapsUserStartDate;
  double v12;
  long double v13;
  double v14;
  unint64_t v15;
  uint64_t v16;
  NSUInteger v17;
  char v18;
  unint64_t v19;
  double createTimeInUse;
  double v21;
  long double v22;
  double v23;
  uint64_t v24;

  -[GEOAPSessionData readAll:](self, "readAll:", 1);
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    v4 = PBHashBytes();
    flags = (char)self->_flags;
  }
  else
  {
    v4 = 0;
  }
  if ((flags & 4) != 0)
  {
    createTime = self->_createTime;
    v7 = -createTime;
    if (createTime >= 0.0)
      v7 = self->_createTime;
    v8 = floor(v7 + 0.5);
    v9 = (v7 - v8) * 1.84467441e19;
    v5 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0)
        v5 += (unint64_t)v9;
    }
    else
    {
      v5 -= (unint64_t)fabs(v9);
    }
  }
  else
  {
    v5 = 0;
  }
  if ((flags & 0x10) != 0)
  {
    v10 = 2654435761u * self->_sessionEpoch;
    if ((flags & 8) != 0)
      goto LABEL_14;
LABEL_19:
    v15 = 0;
    goto LABEL_22;
  }
  v10 = 0;
  if ((flags & 8) == 0)
    goto LABEL_19;
LABEL_14:
  mapsUserStartDate = self->_mapsUserStartDate;
  v12 = -mapsUserStartDate;
  if (mapsUserStartDate >= 0.0)
    v12 = self->_mapsUserStartDate;
  v13 = floor(v12 + 0.5);
  v14 = (v12 - v13) * 1.84467441e19;
  v15 = 2654435761u * (unint64_t)fmod(v13, 1.84467441e19);
  if (v14 >= 0.0)
  {
    if (v14 > 0.0)
      v15 += (unint64_t)v14;
  }
  else
  {
    v15 -= (unint64_t)fabs(v14);
  }
LABEL_22:
  if ((flags & 0x20) != 0)
    v16 = 2654435761 * self->_opaqueAppId;
  else
    v16 = 0;
  v17 = -[NSString hash](self->_originHardwareClass, "hash");
  v18 = (char)self->_flags;
  if ((v18 & 2) != 0)
  {
    createTimeInUse = self->_createTimeInUse;
    v21 = -createTimeInUse;
    if (createTimeInUse >= 0.0)
      v21 = self->_createTimeInUse;
    v22 = floor(v21 + 0.5);
    v23 = (v21 - v22) * 1.84467441e19;
    v19 = 2654435761u * (unint64_t)fmod(v22, 1.84467441e19);
    if (v23 >= 0.0)
    {
      if (v23 > 0.0)
        v19 += (unint64_t)v23;
    }
    else
    {
      v19 -= (unint64_t)fabs(v23);
    }
  }
  else
  {
    v19 = 0;
  }
  if ((v18 & 0x40) != 0)
    v24 = 2654435761 * self->_sessionHasRotated;
  else
    v24 = 0;
  return v5 ^ v4 ^ v10 ^ v15 ^ v16 ^ v19 ^ v24 ^ v17;
}

- (void)mergeFrom:(id)a3
{
  double *v4;
  char v5;
  char v6;
  char *v7;

  v7 = (char *)a3;
  objc_msgSend(v7, "readAll:", 0);
  v4 = (double *)v7;
  v5 = v7[72];
  if ((v5 & 1) != 0)
  {
    self->_sessionId = *(GEOSessionID *)(v7 + 8);
    *(_BYTE *)&self->_flags |= 1u;
    v5 = v7[72];
    if ((v5 & 4) == 0)
    {
LABEL_3:
      if ((v5 & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_16;
    }
  }
  else if ((v7[72] & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_createTime = *((double *)v7 + 4);
  *(_BYTE *)&self->_flags |= 4u;
  v5 = v7[72];
  if ((v5 & 0x10) == 0)
  {
LABEL_4:
    if ((v5 & 8) == 0)
      goto LABEL_5;
    goto LABEL_17;
  }
LABEL_16:
  self->_sessionEpoch = *((_QWORD *)v7 + 7);
  *(_BYTE *)&self->_flags |= 0x10u;
  v5 = v7[72];
  if ((v5 & 8) == 0)
  {
LABEL_5:
    if ((v5 & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_17:
  self->_mapsUserStartDate = *((double *)v7 + 5);
  *(_BYTE *)&self->_flags |= 8u;
  if ((v7[72] & 0x20) != 0)
  {
LABEL_6:
    self->_opaqueAppId = *((_DWORD *)v7 + 16);
    *(_BYTE *)&self->_flags |= 0x20u;
  }
LABEL_7:
  if (*((_QWORD *)v7 + 6))
  {
    -[GEOAPSessionData setOriginHardwareClass:](self, "setOriginHardwareClass:");
    v4 = (double *)v7;
  }
  v6 = *((_BYTE *)v4 + 72);
  if ((v6 & 2) != 0)
  {
    self->_createTimeInUse = v4[3];
    *(_BYTE *)&self->_flags |= 2u;
    v6 = *((_BYTE *)v4 + 72);
  }
  if ((v6 & 0x40) != 0)
  {
    self->_sessionHasRotated = *((_BYTE *)v4 + 68);
    *(_BYTE *)&self->_flags |= 0x40u;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originHardwareClass, 0);
}

@end
