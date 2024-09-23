@implementation GEOABConfigKeyValuePair

- (GEOABConfigKeyValuePair)init
{
  GEOABConfigKeyValuePair *v2;
  GEOABConfigKeyValuePair *v3;
  GEOABConfigKeyValuePair *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOABConfigKeyValuePair;
  v2 = -[GEOABConfigKeyValuePair init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOABConfigKeyValuePair)initWithData:(id)a3
{
  GEOABConfigKeyValuePair *v3;
  GEOABConfigKeyValuePair *v4;
  GEOABConfigKeyValuePair *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOABConfigKeyValuePair;
  v3 = -[GEOABConfigKeyValuePair initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readAbConfigKey
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(_BYTE *)(a1 + 56) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOABConfigKeyValuePairReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAbConfigKey_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasAbConfigKey
{
  -[GEOABConfigKeyValuePair _readAbConfigKey]((uint64_t)self);
  return self->_abConfigKey != 0;
}

- (NSString)abConfigKey
{
  -[GEOABConfigKeyValuePair _readAbConfigKey]((uint64_t)self);
  return self->_abConfigKey;
}

- (void)setAbConfigKey:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x14u;
  objc_storeStrong((id *)&self->_abConfigKey, a3);
}

- (int)abConfigValueType
{
  os_unfair_lock_s *p_readerLock;
  char flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 1) != 0)
    return self->_abConfigValueType;
  else
    return 0;
}

- (void)setAbConfigValueType:(int)a3
{
  *(_BYTE *)&self->_flags |= 0x11u;
  self->_abConfigValueType = a3;
}

- (void)setHasAbConfigValueType:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3 | 0x10;
}

- (BOOL)hasAbConfigValueType
{
  return *(_BYTE *)&self->_flags & 1;
}

- (id)abConfigValueTypeAsString:(int)a3
{
  if (a3 < 5)
    return off_1E1C14370[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsAbConfigValueType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ABVAL_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ABVAL_SINT64")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ABVAL_DOUBLE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ABVAL_STRING")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("ABVAL_BOOL")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_readAbConfigValue
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(_BYTE *)(a1 + 56) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOABConfigKeyValuePairReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAbConfigValue_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasAbConfigValue
{
  -[GEOABConfigKeyValuePair _readAbConfigValue]((uint64_t)self);
  return self->_abConfigValue != 0;
}

- (GEOABConfigValue)abConfigValue
{
  -[GEOABConfigKeyValuePair _readAbConfigValue]((uint64_t)self);
  return self->_abConfigValue;
}

- (void)setAbConfigValue:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x18u;
  objc_storeStrong((id *)&self->_abConfigValue, a3);
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
  v8.super_class = (Class)GEOABConfigKeyValuePair;
  -[GEOABConfigKeyValuePair description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOABConfigKeyValuePair dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOABConfigKeyValuePair _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  const __CFString *v6;
  uint64_t v7;
  __CFString *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  _QWORD v21[4];
  id v22;

  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)a1, "abConfigKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (a2)
      v6 = CFSTR("abConfigKey");
    else
      v6 = CFSTR("ab_config_key");
    objc_msgSend(v4, "setObject:forKey:", v5, v6);
  }

  if ((*(_BYTE *)(a1 + 56) & 1) != 0)
  {
    v7 = *(int *)(a1 + 52);
    if (v7 >= 5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 52));
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = off_1E1C14370[v7];
    }
    if (a2)
      v9 = CFSTR("abConfigValueType");
    else
      v9 = CFSTR("ab_config_value_type");
    objc_msgSend(v4, "setObject:forKey:", v8, v9);

  }
  objc_msgSend((id)a1, "abConfigValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v10, "jsonRepresentation");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = CFSTR("abConfigValue");
    }
    else
    {
      objc_msgSend(v10, "dictionaryRepresentation");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = CFSTR("ab_config_value");
    }
    objc_msgSend(v4, "setObject:forKey:", v12, v13);

  }
  v14 = *(void **)(a1 + 16);
  if (v14)
  {
    objc_msgSend(v14, "dictionaryRepresentation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v15, "count"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __53__GEOABConfigKeyValuePair__dictionaryRepresentation___block_invoke;
      v21[3] = &unk_1E1C00600;
      v18 = v17;
      v22 = v18;
      objc_msgSend(v16, "enumerateKeysAndObjectsUsingBlock:", v21);
      v19 = v18;

      v16 = v19;
    }
    objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOABConfigKeyValuePair _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __53__GEOABConfigKeyValuePair__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOABConfigKeyValuePair)initWithDictionary:(id)a3
{
  return (GEOABConfigKeyValuePair *)-[GEOABConfigKeyValuePair _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  id v11;
  uint64_t v12;
  const __CFString *v13;
  void *v14;
  GEOABConfigValue *v15;
  uint64_t v16;
  void *v17;

  v5 = a2;
  if (!a1)
    goto LABEL_36;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_36;
  if (a3)
    v6 = CFSTR("abConfigKey");
  else
    v6 = CFSTR("ab_config_key");
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(a1, "setAbConfigKey:", v8);

  }
  if (a3)
    v9 = CFSTR("abConfigValueType");
  else
    v9 = CFSTR("ab_config_value_type");
  objc_msgSend(v5, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = v10;
    if ((objc_msgSend(v11, "isEqualToString:", CFSTR("ABVAL_UNKNOWN")) & 1) != 0)
    {
      v12 = 0;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("ABVAL_SINT64")) & 1) != 0)
    {
      v12 = 1;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("ABVAL_DOUBLE")) & 1) != 0)
    {
      v12 = 2;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("ABVAL_STRING")) & 1) != 0)
    {
      v12 = 3;
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("ABVAL_BOOL")))
    {
      v12 = 4;
    }
    else
    {
      v12 = 0;
    }

    goto LABEL_26;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12 = objc_msgSend(v10, "intValue");
LABEL_26:
    objc_msgSend(a1, "setAbConfigValueType:", v12);
  }

  if (a3)
    v13 = CFSTR("abConfigValue");
  else
    v13 = CFSTR("ab_config_value");
  objc_msgSend(v5, "objectForKeyedSubscript:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v15 = [GEOABConfigValue alloc];
    if ((a3 & 1) != 0)
      v16 = -[GEOABConfigValue initWithJSON:](v15, "initWithJSON:", v14);
    else
      v16 = -[GEOABConfigValue initWithDictionary:](v15, "initWithDictionary:", v14);
    v17 = (void *)v16;
    objc_msgSend(a1, "setAbConfigValue:", v16);

  }
LABEL_36:

  return a1;
}

- (GEOABConfigKeyValuePair)initWithJSON:(id)a3
{
  return (GEOABConfigKeyValuePair *)-[GEOABConfigKeyValuePair _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v7;
  int *v8;

  v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if (v3)
      v8 = (int *)&readAll__recursiveTag_375_0;
    else
      v8 = (int *)&readAll__nonRecursiveTag_376_0;
    GEOABConfigKeyValuePairReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    -[GEOABConfigValue readAll:](self->_abConfigValue, "readAll:", 1);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOABConfigKeyValuePairIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOABConfigKeyValuePairReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  id v5;
  PBDataReader *v6;
  void *v7;
  id v8;

  v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_BYTE *)&self->_flags & 0x1C) == 0))
  {
    v6 = self->_reader;
    objc_sync_enter(v6);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "writeData:", v7);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v6);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOABConfigKeyValuePair readAll:](self, "readAll:", 0);
    if (self->_abConfigKey)
      PBDataWriterWriteStringField();
    v5 = v8;
    if ((*(_BYTE *)&self->_flags & 1) != 0)
    {
      PBDataWriterWriteInt32Field();
      v5 = v8;
    }
    if (self->_abConfigValue)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v5);
  }

}

- (void)copyTo:(id)a3
{
  id *v4;
  id *v5;

  v5 = (id *)a3;
  -[GEOABConfigKeyValuePair readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 10) = self->_readerMarkPos;
  *((_DWORD *)v5 + 11) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_abConfigKey)
    objc_msgSend(v5, "setAbConfigKey:");
  v4 = v5;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *((_DWORD *)v5 + 13) = self->_abConfigValueType;
    *((_BYTE *)v5 + 56) |= 1u;
  }
  if (self->_abConfigValue)
  {
    objc_msgSend(v5, "setAbConfigValue:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  PBUnknownFields *v13;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_BYTE *)&self->_flags & 0x10) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOABConfigKeyValuePairReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_8;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOABConfigKeyValuePair readAll:](self, "readAll:", 0);
  v9 = -[NSString copyWithZone:](self->_abConfigKey, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v9;

  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 52) = self->_abConfigValueType;
    *(_BYTE *)(v5 + 56) |= 1u;
  }
  v11 = -[GEOABConfigValue copyWithZone:](self->_abConfigValue, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v11;

  v13 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v13;
LABEL_8:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *abConfigKey;
  GEOABConfigValue *abConfigValue;
  char v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_11;
  -[GEOABConfigKeyValuePair readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  abConfigKey = self->_abConfigKey;
  if ((unint64_t)abConfigKey | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](abConfigKey, "isEqual:"))
      goto LABEL_11;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 1) == 0 || self->_abConfigValueType != *((_DWORD *)v4 + 13))
      goto LABEL_11;
  }
  else if ((*((_BYTE *)v4 + 56) & 1) != 0)
  {
LABEL_11:
    v7 = 0;
    goto LABEL_12;
  }
  abConfigValue = self->_abConfigValue;
  if ((unint64_t)abConfigValue | *((_QWORD *)v4 + 4))
    v7 = -[GEOABConfigValue isEqual:](abConfigValue, "isEqual:");
  else
    v7 = 1;
LABEL_12:

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;

  -[GEOABConfigKeyValuePair readAll:](self, "readAll:", 1);
  v3 = -[NSString hash](self->_abConfigKey, "hash");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v4 = 2654435761 * self->_abConfigValueType;
  else
    v4 = 0;
  return v4 ^ -[GEOABConfigValue hash](self->_abConfigValue, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  GEOABConfigValue *abConfigValue;
  uint64_t v6;
  _QWORD *v7;

  v7 = a3;
  objc_msgSend(v7, "readAll:", 0);
  v4 = v7;
  if (v7[3])
  {
    -[GEOABConfigKeyValuePair setAbConfigKey:](self, "setAbConfigKey:");
    v4 = v7;
  }
  if ((v4[7] & 1) != 0)
  {
    self->_abConfigValueType = *((_DWORD *)v4 + 13);
    *(_BYTE *)&self->_flags |= 1u;
  }
  abConfigValue = self->_abConfigValue;
  v6 = v4[4];
  if (abConfigValue)
  {
    if (v6)
    {
      -[GEOABConfigValue mergeFrom:](abConfigValue, "mergeFrom:");
LABEL_10:
      v4 = v7;
    }
  }
  else if (v6)
  {
    -[GEOABConfigKeyValuePair setAbConfigValue:](self, "setAbConfigValue:");
    goto LABEL_10;
  }

}

- (PBUnknownFields)unknownFields
{
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v5;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_BYTE *)&self->_flags & 2) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      v5 = reader;
      objc_sync_enter(v5);
      GEOABConfigKeyValuePairReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_379);
      objc_sync_exit(v5);

    }
  }
  os_unfair_lock_unlock(p_readerLock);
  return self->_unknownFields;
}

- (void)clearUnknownFields:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_readerLock;
  PBUnknownFields *unknownFields;

  v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x12u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEOABConfigKeyValuePair readAll:](self, "readAll:", 0);
    -[GEOABConfigValue clearUnknownFields:](self->_abConfigValue, "clearUnknownFields:", 1);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_abConfigValue, 0);
  objc_storeStrong((id *)&self->_abConfigKey, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
