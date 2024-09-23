@implementation GEOCacheMiss

- (int)requestorType
{
  if ((*(_BYTE *)&self->_flags & 0x10) != 0)
    return self->_requestorType;
  else
    return 0;
}

- (void)setRequestorType:(int)a3
{
  *(_BYTE *)&self->_flags |= 0x10u;
  self->_requestorType = a3;
}

- (void)setHasRequestorType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xEF | v3;
}

- (BOOL)hasRequestorType
{
  return (*(_BYTE *)&self->_flags >> 4) & 1;
}

- (id)requestorTypeAsString:(int)a3
{
  if (a3 < 7)
    return off_1E1C22188[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsRequestorType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("INTERACTIVE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NAV")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PROACTIVE")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PROACTIVE_REGION")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PROACTIVE_REFRESH")) & 1) != 0)
  {
    v4 = 5;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("PROACTIVE_REGION_AND_REFRESH")))
  {
    v4 = 6;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)missType
{
  if ((*(_BYTE *)&self->_flags & 8) != 0)
    return self->_missType;
  else
    return 0;
}

- (void)setMissType:(int)a3
{
  *(_BYTE *)&self->_flags |= 8u;
  self->_missType = a3;
}

- (void)setHasMissType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xF7 | v3;
}

- (BOOL)hasMissType
{
  return (*(_BYTE *)&self->_flags >> 3) & 1;
}

- (id)missTypeAsString:(int)a3
{
  if (a3 < 4)
    return off_1E1C221C0[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsMissType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNAVAILABLE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("STALE_UNUSABLE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("STALE_USABLE")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (unsigned)count
{
  return self->_count;
}

- (void)setCount:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 2u;
  self->_count = a3;
}

- (void)setHasCount:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasCount
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (unsigned)bytes
{
  return self->_bytes;
}

- (void)setBytes:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_bytes = a3;
}

- (void)setHasBytes:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasBytes
{
  return *(_BYTE *)&self->_flags & 1;
}

- (NSMutableArray)errors
{
  return self->_errors;
}

- (void)setErrors:(id)a3
{
  objc_storeStrong((id *)&self->_errors, a3);
}

- (void)clearErrors
{
  -[NSMutableArray removeAllObjects](self->_errors, "removeAllObjects");
}

- (void)addErrors:(id)a3
{
  id v4;
  NSMutableArray *errors;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  errors = self->_errors;
  v8 = v4;
  if (!errors)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_errors;
    self->_errors = v6;

    v4 = v8;
    errors = self->_errors;
  }
  -[NSMutableArray addObject:](errors, "addObject:", v4);

}

- (unint64_t)errorsCount
{
  return -[NSMutableArray count](self->_errors, "count");
}

- (id)errorsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_errors, "objectAtIndex:", a3);
}

+ (Class)errorsType
{
  return (Class)objc_opt_class();
}

- (unsigned)httpStatus
{
  return self->_httpStatus;
}

- (void)setHttpStatus:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 4u;
  self->_httpStatus = a3;
}

- (void)setHasHttpStatus:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasHttpStatus
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
  v8.super_class = (Class)GEOCacheMiss;
  -[GEOCacheMiss description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOCacheMiss dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOCacheMiss _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  char v5;
  uint64_t v6;
  __CFString *v7;
  const __CFString *v8;
  uint64_t v9;
  __CFString *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  const __CFString *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_BYTE *)(a1 + 36);
  if ((v5 & 0x10) != 0)
  {
    v6 = *(int *)(a1 + 32);
    if (v6 >= 7)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 32));
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_1E1C22188[v6];
    }
    if (a2)
      v8 = CFSTR("requestorType");
    else
      v8 = CFSTR("requestor_type");
    objc_msgSend(v4, "setObject:forKey:", v7, v8);

    v5 = *(_BYTE *)(a1 + 36);
  }
  if ((v5 & 8) != 0)
  {
    v9 = *(int *)(a1 + 28);
    if (v9 >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 28));
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = off_1E1C221C0[v9];
    }
    if (a2)
      v11 = CFSTR("missType");
    else
      v11 = CFSTR("miss_type");
    objc_msgSend(v4, "setObject:forKey:", v10, v11);

    v5 = *(_BYTE *)(a1 + 36);
  }
  if ((v5 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 20));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("count"));

    v5 = *(_BYTE *)(a1 + 36);
  }
  if ((v5 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 16));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("bytes"));

  }
  if (objc_msgSend(*(id *)(a1 + 8), "count"))
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 8), "count"));
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v15 = *(id *)(a1 + 8);
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v26 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v20, "jsonRepresentation");
          else
            objc_msgSend(v20, "dictionaryRepresentation");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "addObject:", v21);

        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v17);
    }

    objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("errors"));
  }
  if ((*(_BYTE *)(a1 + 36) & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 24));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v23 = CFSTR("httpStatus");
    else
      v23 = CFSTR("http_status");
    objc_msgSend(v4, "setObject:forKey:", v22, v23);

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOCacheMiss _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOCacheMiss)initWithDictionary:(id)a3
{
  return (GEOCacheMiss *)-[GEOCacheMiss _initWithDictionary:isJSON:](self, a3, 0);
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
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  GEOCacheMissLoadError *v23;
  uint64_t v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (!a1)
    goto LABEL_67;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_67;
  if (a3)
    v6 = CFSTR("requestorType");
  else
    v6 = CFSTR("requestor_type");
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
    if ((objc_msgSend(v8, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
    {
      v9 = 0;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("INTERACTIVE")) & 1) != 0)
    {
      v9 = 1;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("NAV")) & 1) != 0)
    {
      v9 = 2;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("PROACTIVE")) & 1) != 0)
    {
      v9 = 3;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("PROACTIVE_REGION")) & 1) != 0)
    {
      v9 = 4;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("PROACTIVE_REFRESH")) & 1) != 0)
    {
      v9 = 5;
    }
    else if (objc_msgSend(v8, "isEqualToString:", CFSTR("PROACTIVE_REGION_AND_REFRESH")))
    {
      v9 = 6;
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_26;
    v9 = objc_msgSend(v7, "intValue");
  }
  objc_msgSend(a1, "setRequestorType:", v9);
LABEL_26:

  if (a3)
    v10 = CFSTR("missType");
  else
    v10 = CFSTR("miss_type");
  objc_msgSend(v5, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12 = v11;
    if ((objc_msgSend(v12, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
    {
      v13 = 0;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("UNAVAILABLE")) & 1) != 0)
    {
      v13 = 1;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("STALE_UNUSABLE")) & 1) != 0)
    {
      v13 = 2;
    }
    else if (objc_msgSend(v12, "isEqualToString:", CFSTR("STALE_USABLE")))
    {
      v13 = 3;
    }
    else
    {
      v13 = 0;
    }

    goto LABEL_42;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v13 = objc_msgSend(v11, "intValue");
LABEL_42:
    objc_msgSend(a1, "setMissType:", v13);
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("count"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setCount:", objc_msgSend(v14, "unsignedIntValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("bytes"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setBytes:", objc_msgSend(v15, "unsignedIntValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("errors"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v29 = v5;
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v17 = v16;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v31 != v20)
            objc_enumerationMutation(v17);
          v22 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v23 = [GEOCacheMissLoadError alloc];
            if ((a3 & 1) != 0)
              v24 = -[GEOCacheMissLoadError initWithJSON:](v23, "initWithJSON:", v22);
            else
              v24 = -[GEOCacheMissLoadError initWithDictionary:](v23, "initWithDictionary:", v22);
            v25 = (void *)v24;
            objc_msgSend(a1, "addErrors:", v24);

          }
        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      }
      while (v19);
    }

    v5 = v29;
  }

  if (a3)
    v26 = CFSTR("httpStatus");
  else
    v26 = CFSTR("http_status");
  objc_msgSend(v5, "objectForKeyedSubscript:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setHttpStatus:", objc_msgSend(v27, "unsignedIntValue"));

LABEL_67:
  return a1;
}

- (GEOCacheMiss)initWithJSON:(id)a3
{
  return (GEOCacheMiss *)-[GEOCacheMiss _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOCacheMissIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOCacheMissReadAllFrom(self, a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char flags;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  flags = (char)self->_flags;
  if ((flags & 0x10) != 0)
  {
    PBDataWriterWriteInt32Field();
    flags = (char)self->_flags;
    if ((flags & 8) == 0)
    {
LABEL_3:
      if ((flags & 2) == 0)
        goto LABEL_4;
      goto LABEL_18;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_4:
    if ((flags & 1) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_18:
  PBDataWriterWriteUint32Field();
  if ((*(_BYTE *)&self->_flags & 1) != 0)
LABEL_5:
    PBDataWriterWriteUint32Field();
LABEL_6:
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = self->_errors;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        PBDataWriterWriteSubmessage();
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

  if ((*(_BYTE *)&self->_flags & 4) != 0)
    PBDataWriterWriteUint32Field();

}

- (void)copyTo:(id)a3
{
  char flags;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  void *v8;
  _DWORD *v9;

  v9 = a3;
  -[GEOCacheMiss readAll:](self, "readAll:", 0);
  flags = (char)self->_flags;
  if ((flags & 0x10) != 0)
  {
    v9[8] = self->_requestorType;
    *((_BYTE *)v9 + 36) |= 0x10u;
    flags = (char)self->_flags;
    if ((flags & 8) == 0)
    {
LABEL_3:
      if ((flags & 2) == 0)
        goto LABEL_4;
LABEL_15:
      v9[5] = self->_count;
      *((_BYTE *)v9 + 36) |= 2u;
      if ((*(_BYTE *)&self->_flags & 1) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 8) == 0)
  {
    goto LABEL_3;
  }
  v9[7] = self->_missType;
  *((_BYTE *)v9 + 36) |= 8u;
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
    goto LABEL_15;
LABEL_4:
  if ((flags & 1) != 0)
  {
LABEL_5:
    v9[4] = self->_bytes;
    *((_BYTE *)v9 + 36) |= 1u;
  }
LABEL_6:
  if (-[GEOCacheMiss errorsCount](self, "errorsCount"))
  {
    objc_msgSend(v9, "clearErrors");
    v5 = -[GEOCacheMiss errorsCount](self, "errorsCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        -[GEOCacheMiss errorsAtIndex:](self, "errorsAtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addErrors:", v8);

      }
    }
  }
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    v9[6] = self->_httpStatus;
    *((_BYTE *)v9 + 36) |= 4u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  char flags;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  flags = (char)self->_flags;
  if ((flags & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 32) = self->_requestorType;
    *(_BYTE *)(v5 + 36) |= 0x10u;
    flags = (char)self->_flags;
    if ((flags & 8) == 0)
    {
LABEL_3:
      if ((flags & 2) == 0)
        goto LABEL_4;
      goto LABEL_18;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 8) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 28) = self->_missType;
  *(_BYTE *)(v5 + 36) |= 8u;
  flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_4:
    if ((flags & 1) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_18:
  *(_DWORD *)(v5 + 20) = self->_count;
  *(_BYTE *)(v5 + 36) |= 2u;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
LABEL_5:
    *(_DWORD *)(v5 + 16) = self->_bytes;
    *(_BYTE *)(v5 + 36) |= 1u;
  }
LABEL_6:
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = self->_errors;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v15);
        objc_msgSend((id)v6, "addErrors:", v13);

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    *(_DWORD *)(v6 + 24) = self->_httpStatus;
    *(_BYTE *)(v6 + 36) |= 4u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char flags;
  char v6;
  NSMutableArray *errors;
  BOOL v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_29;
  -[GEOCacheMiss readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  flags = (char)self->_flags;
  v6 = *((_BYTE *)v4 + 36);
  if ((flags & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 0x10) == 0 || self->_requestorType != *((_DWORD *)v4 + 8))
      goto LABEL_29;
  }
  else if ((*((_BYTE *)v4 + 36) & 0x10) != 0)
  {
    goto LABEL_29;
  }
  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 8) == 0 || self->_missType != *((_DWORD *)v4 + 7))
      goto LABEL_29;
  }
  else if ((*((_BYTE *)v4 + 36) & 8) != 0)
  {
    goto LABEL_29;
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 2) == 0 || self->_count != *((_DWORD *)v4 + 5))
      goto LABEL_29;
  }
  else if ((*((_BYTE *)v4 + 36) & 2) != 0)
  {
    goto LABEL_29;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 1) == 0 || self->_bytes != *((_DWORD *)v4 + 4))
      goto LABEL_29;
  }
  else if ((*((_BYTE *)v4 + 36) & 1) != 0)
  {
    goto LABEL_29;
  }
  errors = self->_errors;
  if ((unint64_t)errors | *((_QWORD *)v4 + 1))
  {
    if (!-[NSMutableArray isEqual:](errors, "isEqual:"))
    {
LABEL_29:
      v8 = 0;
      goto LABEL_30;
    }
    flags = (char)self->_flags;
    v6 = *((_BYTE *)v4 + 36);
  }
  v8 = (v6 & 4) == 0;
  if ((flags & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_httpStatus != *((_DWORD *)v4 + 6))
      goto LABEL_29;
    v8 = 1;
  }
LABEL_30:

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  -[GEOCacheMiss readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 0x10) != 0)
  {
    v3 = 2654435761 * self->_requestorType;
    if ((*(_BYTE *)&self->_flags & 8) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_missType;
      if ((*(_BYTE *)&self->_flags & 2) != 0)
        goto LABEL_4;
LABEL_8:
      v5 = 0;
      if ((*(_BYTE *)&self->_flags & 1) != 0)
        goto LABEL_5;
      goto LABEL_9;
    }
  }
  else
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_flags & 8) != 0)
      goto LABEL_3;
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_flags & 2) == 0)
    goto LABEL_8;
LABEL_4:
  v5 = 2654435761 * self->_count;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
LABEL_5:
    v6 = 2654435761 * self->_bytes;
    goto LABEL_10;
  }
LABEL_9:
  v6 = 0;
LABEL_10:
  v7 = -[NSMutableArray hash](self->_errors, "hash");
  if ((*(_BYTE *)&self->_flags & 4) != 0)
    v8 = 2654435761 * self->_httpStatus;
  else
    v8 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v8 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  v5 = *((_BYTE *)v4 + 36);
  if ((v5 & 0x10) != 0)
  {
    self->_requestorType = *((_DWORD *)v4 + 8);
    *(_BYTE *)&self->_flags |= 0x10u;
    v5 = *((_BYTE *)v4 + 36);
    if ((v5 & 8) == 0)
    {
LABEL_3:
      if ((v5 & 2) == 0)
        goto LABEL_4;
      goto LABEL_18;
    }
  }
  else if ((*((_BYTE *)v4 + 36) & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_missType = *((_DWORD *)v4 + 7);
  *(_BYTE *)&self->_flags |= 8u;
  v5 = *((_BYTE *)v4 + 36);
  if ((v5 & 2) == 0)
  {
LABEL_4:
    if ((v5 & 1) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_18:
  self->_count = *((_DWORD *)v4 + 5);
  *(_BYTE *)&self->_flags |= 2u;
  if ((*((_BYTE *)v4 + 36) & 1) != 0)
  {
LABEL_5:
    self->_bytes = *((_DWORD *)v4 + 4);
    *(_BYTE *)&self->_flags |= 1u;
  }
LABEL_6:
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = *((id *)v4 + 1);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        -[GEOCacheMiss addErrors:](self, "addErrors:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i), (_QWORD)v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

  if ((*((_BYTE *)v4 + 36) & 4) != 0)
  {
    self->_httpStatus = *((_DWORD *)v4 + 6);
    *(_BYTE *)&self->_flags |= 4u;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errors, 0);
}

@end
