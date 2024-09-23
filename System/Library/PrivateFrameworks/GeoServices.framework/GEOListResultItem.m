@implementation GEOListResultItem

- (int)resultType
{
  if ((*(_BYTE *)&self->_flags & 4) != 0)
    return self->_resultType;
  else
    return 0;
}

- (void)setResultType:(int)a3
{
  *(_BYTE *)&self->_flags |= 4u;
  self->_resultType = a3;
}

- (void)setHasResultType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasResultType
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (id)resultTypeAsString:(int)a3
{
  if (a3 < 4)
    return off_1E1C14078[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsResultType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RESULT_TYPE_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RESULT_TYPE_SERVER")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RESULT_TYPE_CLIENT")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("RESULT_TYPE_PROACTIVE")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)initiallyVisible
{
  return self->_initiallyVisible;
}

- (void)setInitiallyVisible:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 0x20u;
  self->_initiallyVisible = a3;
}

- (void)setHasInitiallyVisible:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xDF | v3;
}

- (BOOL)hasInitiallyVisible
{
  return (*(_BYTE *)&self->_flags >> 5) & 1;
}

- (BOOL)eventuallyVisible
{
  return self->_eventuallyVisible;
}

- (void)setEventuallyVisible:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 0x10u;
  self->_eventuallyVisible = a3;
}

- (void)setHasEventuallyVisible:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xEF | v3;
}

- (BOOL)hasEventuallyVisible
{
  return (*(_BYTE *)&self->_flags >> 4) & 1;
}

- (int64_t)latency
{
  if ((*(_BYTE *)&self->_flags & 2) != 0)
    return self->_latency;
  else
    return -1;
}

- (void)setLatency:(int64_t)a3
{
  *(_BYTE *)&self->_flags |= 2u;
  self->_latency = a3;
}

- (void)setHasLatency:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasLatency
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (int)tappedCount
{
  return self->_tappedCount;
}

- (void)setTappedCount:(int)a3
{
  *(_BYTE *)&self->_flags |= 8u;
  self->_tappedCount = a3;
}

- (void)setHasTappedCount:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xF7 | v3;
}

- (BOOL)hasTappedCount
{
  return (*(_BYTE *)&self->_flags >> 3) & 1;
}

- (unint64_t)businessId
{
  return self->_businessId;
}

- (void)setBusinessId:(unint64_t)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_businessId = a3;
}

- (void)setHasBusinessId:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasBusinessId
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
  v8.super_class = (Class)GEOListResultItem;
  -[GEOListResultItem description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOListResultItem dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOListResultItem _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  char v5;
  uint64_t v6;
  __CFString *v7;
  const __CFString *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  const __CFString *v17;

  if (!a1)
  {
    v4 = 0;
    return v4;
  }
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_BYTE *)(a1 + 36);
  if ((v5 & 4) != 0)
  {
    v6 = *(int *)(a1 + 24);
    if (v6 >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 24));
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_1E1C14078[v6];
    }
    if (a2)
      v8 = CFSTR("resultType");
    else
      v8 = CFSTR("result_type");
    objc_msgSend(v4, "setObject:forKey:", v7, v8);

    v5 = *(_BYTE *)(a1 + 36);
  }
  if ((v5 & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 33));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v10 = CFSTR("initiallyVisible");
    else
      v10 = CFSTR("initially_visible");
    objc_msgSend(v4, "setObject:forKey:", v9, v10);

    v5 = *(_BYTE *)(a1 + 36);
    if ((v5 & 0x10) == 0)
    {
LABEL_12:
      if ((v5 & 2) == 0)
        goto LABEL_13;
      goto LABEL_24;
    }
  }
  else if ((v5 & 0x10) == 0)
  {
    goto LABEL_12;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 32));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v12 = CFSTR("eventuallyVisible");
  else
    v12 = CFSTR("eventually_visible");
  objc_msgSend(v4, "setObject:forKey:", v11, v12);

  v5 = *(_BYTE *)(a1 + 36);
  if ((v5 & 2) == 0)
  {
LABEL_13:
    if ((v5 & 8) == 0)
      goto LABEL_14;
    goto LABEL_25;
  }
LABEL_24:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(a1 + 16));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("latency"));

  v5 = *(_BYTE *)(a1 + 36);
  if ((v5 & 8) == 0)
  {
LABEL_14:
    if ((v5 & 1) == 0)
      return v4;
    goto LABEL_29;
  }
LABEL_25:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 28));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v15 = CFSTR("tappedCount");
  else
    v15 = CFSTR("tapped_count");
  objc_msgSend(v4, "setObject:forKey:", v14, v15);

  if ((*(_BYTE *)(a1 + 36) & 1) != 0)
  {
LABEL_29:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 8));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v17 = CFSTR("businessId");
    else
      v17 = CFSTR("business_id");
    objc_msgSend(v4, "setObject:forKey:", v16, v17);

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOListResultItem _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOListResultItem)initWithDictionary:(id)a3
{
  return (GEOListResultItem *)-[GEOListResultItem _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  id v8;
  uint64_t v9;
  const __CFString *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  const __CFString *v17;
  void *v18;

  v5 = a2;
  if (!a1)
    goto LABEL_43;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_43;
  if (a3)
    v6 = CFSTR("resultType");
  else
    v6 = CFSTR("result_type");
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
    if ((objc_msgSend(v8, "isEqualToString:", CFSTR("RESULT_TYPE_UNKNOWN")) & 1) != 0)
    {
      v9 = 0;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("RESULT_TYPE_SERVER")) & 1) != 0)
    {
      v9 = 1;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("RESULT_TYPE_CLIENT")) & 1) != 0)
    {
      v9 = 2;
    }
    else if (objc_msgSend(v8, "isEqualToString:", CFSTR("RESULT_TYPE_PROACTIVE")))
    {
      v9 = 3;
    }
    else
    {
      v9 = 0;
    }

    goto LABEL_19;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = objc_msgSend(v7, "intValue");
LABEL_19:
    objc_msgSend(a1, "setResultType:", v9);
  }

  if (a3)
    v10 = CFSTR("initiallyVisible");
  else
    v10 = CFSTR("initially_visible");
  objc_msgSend(v5, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setInitiallyVisible:", objc_msgSend(v11, "BOOLValue"));

  if (a3)
    v12 = CFSTR("eventuallyVisible");
  else
    v12 = CFSTR("eventually_visible");
  objc_msgSend(v5, "objectForKeyedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setEventuallyVisible:", objc_msgSend(v13, "BOOLValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("latency"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setLatency:", objc_msgSend(v14, "longLongValue"));

  if (a3)
    v15 = CFSTR("tappedCount");
  else
    v15 = CFSTR("tapped_count");
  objc_msgSend(v5, "objectForKeyedSubscript:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setTappedCount:", objc_msgSend(v16, "intValue"));

  if (a3)
    v17 = CFSTR("businessId");
  else
    v17 = CFSTR("business_id");
  objc_msgSend(v5, "objectForKeyedSubscript:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setBusinessId:", objc_msgSend(v18, "unsignedLongLongValue"));

LABEL_43:
  return a1;
}

- (GEOListResultItem)initWithJSON:(id)a3
{
  return (GEOListResultItem *)-[GEOListResultItem _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOListResultItemIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOListResultItemReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  char flags;
  id v5;

  v5 = a3;
  flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    flags = (char)self->_flags;
    if ((flags & 0x20) == 0)
    {
LABEL_3:
      if ((flags & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 0x20) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  flags = (char)self->_flags;
  if ((flags & 0x10) == 0)
  {
LABEL_4:
    if ((flags & 2) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  PBDataWriterWriteBOOLField();
  flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_5:
    if ((flags & 8) == 0)
      goto LABEL_6;
LABEL_13:
    PBDataWriterWriteInt32Field();
    if ((*(_BYTE *)&self->_flags & 1) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_12:
  PBDataWriterWriteInt64Field();
  flags = (char)self->_flags;
  if ((flags & 8) != 0)
    goto LABEL_13;
LABEL_6:
  if ((flags & 1) != 0)
LABEL_7:
    PBDataWriterWriteUint64Field();
LABEL_8:

}

- (void)copyTo:(id)a3
{
  char flags;
  _DWORD *v5;

  v5 = a3;
  -[GEOListResultItem readAll:](self, "readAll:", 0);
  flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    v5[6] = self->_resultType;
    *((_BYTE *)v5 + 36) |= 4u;
    flags = (char)self->_flags;
    if ((flags & 0x20) == 0)
    {
LABEL_3:
      if ((flags & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 0x20) == 0)
  {
    goto LABEL_3;
  }
  *((_BYTE *)v5 + 33) = self->_initiallyVisible;
  *((_BYTE *)v5 + 36) |= 0x20u;
  flags = (char)self->_flags;
  if ((flags & 0x10) == 0)
  {
LABEL_4:
    if ((flags & 2) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  *((_BYTE *)v5 + 32) = self->_eventuallyVisible;
  *((_BYTE *)v5 + 36) |= 0x10u;
  flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_5:
    if ((flags & 8) == 0)
      goto LABEL_6;
LABEL_13:
    v5[7] = self->_tappedCount;
    *((_BYTE *)v5 + 36) |= 8u;
    if ((*(_BYTE *)&self->_flags & 1) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_12:
  *((_QWORD *)v5 + 2) = self->_latency;
  *((_BYTE *)v5 + 36) |= 2u;
  flags = (char)self->_flags;
  if ((flags & 8) != 0)
    goto LABEL_13;
LABEL_6:
  if ((flags & 1) != 0)
  {
LABEL_7:
    *((_QWORD *)v5 + 1) = self->_businessId;
    *((_BYTE *)v5 + 36) |= 1u;
  }
LABEL_8:

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char flags;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    *((_DWORD *)result + 6) = self->_resultType;
    *((_BYTE *)result + 36) |= 4u;
    flags = (char)self->_flags;
    if ((flags & 0x20) == 0)
    {
LABEL_3:
      if ((flags & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 0x20) == 0)
  {
    goto LABEL_3;
  }
  *((_BYTE *)result + 33) = self->_initiallyVisible;
  *((_BYTE *)result + 36) |= 0x20u;
  flags = (char)self->_flags;
  if ((flags & 0x10) == 0)
  {
LABEL_4:
    if ((flags & 2) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  *((_BYTE *)result + 32) = self->_eventuallyVisible;
  *((_BYTE *)result + 36) |= 0x10u;
  flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_5:
    if ((flags & 8) == 0)
      goto LABEL_6;
    goto LABEL_13;
  }
LABEL_12:
  *((_QWORD *)result + 2) = self->_latency;
  *((_BYTE *)result + 36) |= 2u;
  flags = (char)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_6:
    if ((flags & 1) == 0)
      return result;
    goto LABEL_7;
  }
LABEL_13:
  *((_DWORD *)result + 7) = self->_tappedCount;
  *((_BYTE *)result + 36) |= 8u;
  if ((*(_BYTE *)&self->_flags & 1) == 0)
    return result;
LABEL_7:
  *((_QWORD *)result + 1) = self->_businessId;
  *((_BYTE *)result + 36) |= 1u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_37;
  -[GEOListResultItem readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 4) == 0 || self->_resultType != *((_DWORD *)v4 + 6))
      goto LABEL_37;
  }
  else if ((*((_BYTE *)v4 + 36) & 4) != 0)
  {
    goto LABEL_37;
  }
  if ((*(_BYTE *)&self->_flags & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 0x20) == 0)
      goto LABEL_37;
    if (self->_initiallyVisible)
    {
      if (!*((_BYTE *)v4 + 33))
        goto LABEL_37;
    }
    else if (*((_BYTE *)v4 + 33))
    {
      goto LABEL_37;
    }
  }
  else if ((*((_BYTE *)v4 + 36) & 0x20) != 0)
  {
    goto LABEL_37;
  }
  if ((*(_BYTE *)&self->_flags & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 0x10) != 0)
    {
      if (self->_eventuallyVisible)
      {
        if (!*((_BYTE *)v4 + 32))
          goto LABEL_37;
        goto LABEL_23;
      }
      if (!*((_BYTE *)v4 + 32))
        goto LABEL_23;
    }
LABEL_37:
    v5 = 0;
    goto LABEL_38;
  }
  if ((*((_BYTE *)v4 + 36) & 0x10) != 0)
    goto LABEL_37;
LABEL_23:
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 2) == 0 || self->_latency != *((_QWORD *)v4 + 2))
      goto LABEL_37;
  }
  else if ((*((_BYTE *)v4 + 36) & 2) != 0)
  {
    goto LABEL_37;
  }
  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 8) == 0 || self->_tappedCount != *((_DWORD *)v4 + 7))
      goto LABEL_37;
  }
  else if ((*((_BYTE *)v4 + 36) & 8) != 0)
  {
    goto LABEL_37;
  }
  v5 = (*((_BYTE *)v4 + 36) & 1) == 0;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 1) == 0 || self->_businessId != *((_QWORD *)v4 + 1))
      goto LABEL_37;
    v5 = 1;
  }
LABEL_38:

  return v5;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;

  -[GEOListResultItem readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    v3 = 2654435761 * self->_resultType;
    if ((*(_BYTE *)&self->_flags & 0x20) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_initiallyVisible;
      if ((*(_BYTE *)&self->_flags & 0x10) != 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_flags & 0x20) != 0)
      goto LABEL_3;
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_flags & 0x10) != 0)
  {
LABEL_4:
    v5 = 2654435761 * self->_eventuallyVisible;
    if ((*(_BYTE *)&self->_flags & 2) != 0)
      goto LABEL_5;
    goto LABEL_11;
  }
LABEL_10:
  v5 = 0;
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
LABEL_5:
    v6 = 2654435761 * self->_latency;
    if ((*(_BYTE *)&self->_flags & 8) != 0)
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
  if ((*(_BYTE *)&self->_flags & 8) == 0)
    goto LABEL_12;
LABEL_6:
  v7 = 2654435761 * self->_tappedCount;
  if ((*(_BYTE *)&self->_flags & 1) == 0)
    goto LABEL_13;
LABEL_7:
  v8 = 2654435761u * self->_businessId;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (void)mergeFrom:(id)a3
{
  char v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "readAll:", 0);
  v4 = *((_BYTE *)v5 + 36);
  if ((v4 & 4) != 0)
  {
    self->_resultType = *((_DWORD *)v5 + 6);
    *(_BYTE *)&self->_flags |= 4u;
    v4 = *((_BYTE *)v5 + 36);
    if ((v4 & 0x20) == 0)
    {
LABEL_3:
      if ((v4 & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*((_BYTE *)v5 + 36) & 0x20) == 0)
  {
    goto LABEL_3;
  }
  self->_initiallyVisible = *((_BYTE *)v5 + 33);
  *(_BYTE *)&self->_flags |= 0x20u;
  v4 = *((_BYTE *)v5 + 36);
  if ((v4 & 0x10) == 0)
  {
LABEL_4:
    if ((v4 & 2) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  self->_eventuallyVisible = *((_BYTE *)v5 + 32);
  *(_BYTE *)&self->_flags |= 0x10u;
  v4 = *((_BYTE *)v5 + 36);
  if ((v4 & 2) == 0)
  {
LABEL_5:
    if ((v4 & 8) == 0)
      goto LABEL_6;
LABEL_13:
    self->_tappedCount = *((_DWORD *)v5 + 7);
    *(_BYTE *)&self->_flags |= 8u;
    if ((*((_BYTE *)v5 + 36) & 1) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_12:
  self->_latency = *((_QWORD *)v5 + 2);
  *(_BYTE *)&self->_flags |= 2u;
  v4 = *((_BYTE *)v5 + 36);
  if ((v4 & 8) != 0)
    goto LABEL_13;
LABEL_6:
  if ((v4 & 1) != 0)
  {
LABEL_7:
    self->_businessId = *((_QWORD *)v5 + 1);
    *(_BYTE *)&self->_flags |= 1u;
  }
LABEL_8:

}

@end
