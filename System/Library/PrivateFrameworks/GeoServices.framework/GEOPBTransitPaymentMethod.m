@implementation GEOPBTransitPaymentMethod

- (GEOPBTransitPaymentMethod)init
{
  GEOPBTransitPaymentMethod *v2;
  GEOPBTransitPaymentMethod *v3;
  GEOPBTransitPaymentMethod *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPBTransitPaymentMethod;
  v2 = -[GEOPBTransitPaymentMethod init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPBTransitPaymentMethod)initWithData:(id)a3
{
  GEOPBTransitPaymentMethod *v3;
  GEOPBTransitPaymentMethod *v4;
  GEOPBTransitPaymentMethod *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPBTransitPaymentMethod;
  v3 = -[GEOPBTransitPaymentMethod initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readIdentifier
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_BYTE *)(a1 + 68) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPBTransitPaymentMethodReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readIdentifier_tags_6);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasIdentifier
{
  -[GEOPBTransitPaymentMethod _readIdentifier]((uint64_t)self);
  return self->_identifier != 0;
}

- (NSString)identifier
{
  -[GEOPBTransitPaymentMethod _readIdentifier]((uint64_t)self);
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x50u;
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (unint64_t)muid
{
  return self->_muid;
}

- (void)setMuid:(unint64_t)a3
{
  *(_BYTE *)&self->_flags |= 0x41u;
  self->_muid = a3;
}

- (void)setHasMuid:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3 | 0x40;
}

- (BOOL)hasMuid
{
  return *(_BYTE *)&self->_flags & 1;
}

- (int)paymentMethodType
{
  os_unfair_lock_s *p_readerLock;
  char flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 4) != 0)
    return self->_paymentMethodType;
  else
    return 0;
}

- (void)setPaymentMethodType:(int)a3
{
  *(_BYTE *)&self->_flags |= 0x44u;
  self->_paymentMethodType = a3;
}

- (void)setHasPaymentMethodType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 68;
  else
    v3 = 64;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasPaymentMethodType
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (id)paymentMethodTypeAsString:(int)a3
{
  if (a3 < 5)
    return off_1E1C0DFD8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsPaymentMethodType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PAYMENT_METHOD_TYPE_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PAYMENT_METHOD_TYPE_OPEN_LOOP")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PAYMENT_METHOD_TYPE_CLOSED_LOOP_DCI")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PAYMENT_METHOD_TYPE_CASH")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("PAYMENT_METHOD_TYPE_CLOSED_LOOP_NON_DCI")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)addValueName
{
  os_unfair_lock_s *p_readerLock;
  char flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 2) != 0)
    return self->_addValueName;
  else
    return 0;
}

- (void)setAddValueName:(int)a3
{
  *(_BYTE *)&self->_flags |= 0x42u;
  self->_addValueName = a3;
}

- (void)setHasAddValueName:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 66;
  else
    v3 = 64;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasAddValueName
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (id)addValueNameAsString:(int)a3
{
  if (a3 < 4)
    return off_1E1C0E000[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsAddValueName:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PAYMENT_METHOD_ADD_VALUE_NAME_RELOAD")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PAYMENT_METHOD_ADD_VALUE_NAME_TOP_UP")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PAYMENT_METHOD_ADD_VALUE_NAME_REFILL")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("PAYMENT_METHOD_ADD_VALUE_NAME_LOAD")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_readName
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_BYTE *)(a1 + 68) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPBTransitPaymentMethodReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readName_tags_12);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasName
{
  -[GEOPBTransitPaymentMethod _readName]((uint64_t)self);
  return self->_name != 0;
}

- (NSString)name
{
  -[GEOPBTransitPaymentMethod _readName]((uint64_t)self);
  return self->_name;
}

- (void)setName:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x60u;
  objc_storeStrong((id *)&self->_name, a3);
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
  v8.super_class = (Class)GEOPBTransitPaymentMethod;
  -[GEOPBTransitPaymentMethod description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPBTransitPaymentMethod dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPBTransitPaymentMethod _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  char v6;
  void *v7;
  uint64_t v8;
  __CFString *v9;
  const __CFString *v10;
  uint64_t v11;
  __CFString *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  _QWORD v22[4];
  id v23;

  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)a1, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("identifier"));

  v6 = *(_BYTE *)(a1 + 68);
  if ((v6 & 1) == 0)
  {
    if ((*(_BYTE *)(a1 + 68) & 4) == 0)
      goto LABEL_6;
LABEL_9:
    v8 = *(int *)(a1 + 64);
    if (v8 >= 5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 64));
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = off_1E1C0DFD8[v8];
    }
    if (a2)
      v10 = CFSTR("paymentMethodType");
    else
      v10 = CFSTR("payment_method_type");
    objc_msgSend(v4, "setObject:forKey:", v9, v10);

    if ((*(_BYTE *)(a1 + 68) & 2) == 0)
      goto LABEL_23;
    goto LABEL_16;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 32));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("muid"));

  v6 = *(_BYTE *)(a1 + 68);
  if ((v6 & 4) != 0)
    goto LABEL_9;
LABEL_6:
  if ((v6 & 2) != 0)
  {
LABEL_16:
    v11 = *(int *)(a1 + 60);
    if (v11 >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 60));
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = off_1E1C0E000[v11];
    }
    if (a2)
      v13 = CFSTR("addValueName");
    else
      v13 = CFSTR("add_value_name");
    objc_msgSend(v4, "setObject:forKey:", v12, v13);

  }
LABEL_23:
  objc_msgSend((id)a1, "name");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
    objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("name"));

  v15 = *(void **)(a1 + 16);
  if (v15)
  {
    objc_msgSend(v15, "dictionaryRepresentation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v16, "count"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __55__GEOPBTransitPaymentMethod__dictionaryRepresentation___block_invoke;
      v22[3] = &unk_1E1C00600;
      v19 = v18;
      v23 = v19;
      objc_msgSend(v17, "enumerateKeysAndObjectsUsingBlock:", v22);
      v20 = v19;

      v17 = v20;
    }
    objc_msgSend(v4, "setObject:forKey:", v17, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPBTransitPaymentMethod _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __55__GEOPBTransitPaymentMethod__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOPBTransitPaymentMethod)initWithDictionary:(id)a3
{
  return (GEOPBTransitPaymentMethod *)-[GEOPBTransitPaymentMethod _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  id v11;
  uint64_t v12;
  const __CFString *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;

  v5 = a2;
  if (!a1)
    goto LABEL_46;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_46;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("identifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(a1, "setIdentifier:", v7);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("muid"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setMuid:", objc_msgSend(v8, "unsignedLongLongValue"));

  if (a3)
    v9 = CFSTR("paymentMethodType");
  else
    v9 = CFSTR("payment_method_type");
  objc_msgSend(v5, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = v10;
    if ((objc_msgSend(v11, "isEqualToString:", CFSTR("PAYMENT_METHOD_TYPE_UNKNOWN")) & 1) != 0)
    {
      v12 = 0;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("PAYMENT_METHOD_TYPE_OPEN_LOOP")) & 1) != 0)
    {
      v12 = 1;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("PAYMENT_METHOD_TYPE_CLOSED_LOOP_DCI")) & 1) != 0)
    {
      v12 = 2;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("PAYMENT_METHOD_TYPE_CASH")) & 1) != 0)
    {
      v12 = 3;
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("PAYMENT_METHOD_TYPE_CLOSED_LOOP_NON_DCI")))
    {
      v12 = 4;
    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_26;
    v12 = objc_msgSend(v10, "intValue");
  }
  objc_msgSend(a1, "setPaymentMethodType:", v12);
LABEL_26:

  if (a3)
    v13 = CFSTR("addValueName");
  else
    v13 = CFSTR("add_value_name");
  objc_msgSend(v5, "objectForKeyedSubscript:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v15 = v14;
    if ((objc_msgSend(v15, "isEqualToString:", CFSTR("PAYMENT_METHOD_ADD_VALUE_NAME_RELOAD")) & 1) != 0)
    {
      v16 = 0;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("PAYMENT_METHOD_ADD_VALUE_NAME_TOP_UP")) & 1) != 0)
    {
      v16 = 1;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("PAYMENT_METHOD_ADD_VALUE_NAME_REFILL")) & 1) != 0)
    {
      v16 = 2;
    }
    else if (objc_msgSend(v15, "isEqualToString:", CFSTR("PAYMENT_METHOD_ADD_VALUE_NAME_LOAD")))
    {
      v16 = 3;
    }
    else
    {
      v16 = 0;
    }

    goto LABEL_42;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v16 = objc_msgSend(v14, "intValue");
LABEL_42:
    objc_msgSend(a1, "setAddValueName:", v16);
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("name"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v18 = (void *)objc_msgSend(v17, "copy");
    objc_msgSend(a1, "setName:", v18);

  }
LABEL_46:

  return a1;
}

- (GEOPBTransitPaymentMethod)initWithJSON:(id)a3
{
  return (GEOPBTransitPaymentMethod *)-[GEOPBTransitPaymentMethod _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_552;
    else
      v8 = (int *)&readAll__nonRecursiveTag_553;
    GEOPBTransitPaymentMethodReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPBTransitPaymentMethodIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPBTransitPaymentMethodReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  char flags;
  id v6;
  PBDataReader *v7;
  void *v8;
  id v9;

  v9 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader)
  {
    os_unfair_lock_assert_owner(&self->_readerLock);
    if ((*(_BYTE *)&self->_flags & 0x70) == 0)
    {
      v7 = self->_reader;
      objc_sync_enter(v7);
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "writeData:", v8);
      os_unfair_lock_unlock(p_readerLock);

      objc_sync_exit(v7);
      goto LABEL_16;
    }
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPBTransitPaymentMethod readAll:](self, "readAll:", 0);
  if (self->_identifier)
    PBDataWriterWriteStringField();
  flags = (char)self->_flags;
  v6 = v9;
  if ((flags & 1) == 0)
  {
    if ((*(_BYTE *)&self->_flags & 4) == 0)
      goto LABEL_7;
LABEL_13:
    PBDataWriterWriteInt32Field();
    v6 = v9;
    if ((*(_BYTE *)&self->_flags & 2) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
  PBDataWriterWriteUint64Field();
  v6 = v9;
  flags = (char)self->_flags;
  if ((flags & 4) != 0)
    goto LABEL_13;
LABEL_7:
  if ((flags & 2) != 0)
  {
LABEL_8:
    PBDataWriterWriteInt32Field();
    v6 = v9;
  }
LABEL_9:
  if (self->_name)
  {
    PBDataWriterWriteStringField();
    v6 = v9;
  }
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v6);
LABEL_16:

}

- (void)copyTo:(id)a3
{
  char flags;
  id *v5;
  id *v6;

  v6 = (id *)a3;
  -[GEOPBTransitPaymentMethod readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v6 + 1, self->_reader);
  *((_DWORD *)v6 + 12) = self->_readerMarkPos;
  *((_DWORD *)v6 + 13) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_identifier)
    objc_msgSend(v6, "setIdentifier:");
  flags = (char)self->_flags;
  v5 = v6;
  if ((flags & 1) != 0)
  {
    v6[4] = (id)self->_muid;
    *((_BYTE *)v6 + 68) |= 1u;
    flags = (char)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_5:
      if ((flags & 2) == 0)
        goto LABEL_7;
      goto LABEL_6;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 4) == 0)
  {
    goto LABEL_5;
  }
  *((_DWORD *)v6 + 16) = self->_paymentMethodType;
  *((_BYTE *)v6 + 68) |= 4u;
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
LABEL_6:
    *((_DWORD *)v6 + 15) = self->_addValueName;
    *((_BYTE *)v6 + 68) |= 2u;
  }
LABEL_7:
  if (self->_name)
  {
    objc_msgSend(v6, "setName:");
    v5 = v6;
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
  char flags;
  uint64_t v12;
  void *v13;
  PBUnknownFields *v14;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
  {
LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPBTransitPaymentMethod readAll:](self, "readAll:", 0);
    v9 = -[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
    v10 = *(void **)(v5 + 24);
    *(_QWORD *)(v5 + 24) = v9;

    flags = (char)self->_flags;
    if ((flags & 1) != 0)
    {
      *(_QWORD *)(v5 + 32) = self->_muid;
      *(_BYTE *)(v5 + 68) |= 1u;
      flags = (char)self->_flags;
      if ((flags & 4) == 0)
      {
LABEL_7:
        if ((flags & 2) == 0)
        {
LABEL_9:
          v12 = -[NSString copyWithZone:](self->_name, "copyWithZone:", a3);
          v13 = *(void **)(v5 + 40);
          *(_QWORD *)(v5 + 40) = v12;

          v14 = self->_unknownFields;
          v8 = *(id *)(v5 + 16);
          *(_QWORD *)(v5 + 16) = v14;
          goto LABEL_10;
        }
LABEL_8:
        *(_DWORD *)(v5 + 60) = self->_addValueName;
        *(_BYTE *)(v5 + 68) |= 2u;
        goto LABEL_9;
      }
    }
    else if ((*(_BYTE *)&self->_flags & 4) == 0)
    {
      goto LABEL_7;
    }
    *(_DWORD *)(v5 + 64) = self->_paymentMethodType;
    *(_BYTE *)(v5 + 68) |= 4u;
    if ((*(_BYTE *)&self->_flags & 2) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
  v7 = reader;
  objc_sync_enter(v7);
  if ((*(_BYTE *)&self->_flags & 0x40) != 0)
  {
    objc_sync_exit(v7);

    goto LABEL_5;
  }
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  GEOPBTransitPaymentMethodReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  v8 = (id)v5;
  objc_sync_exit(v7);

LABEL_10:
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *identifier;
  NSString *name;
  char v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_21;
  -[GEOPBTransitPaymentMethod readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  identifier = self->_identifier;
  if ((unint64_t)identifier | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](identifier, "isEqual:"))
      goto LABEL_21;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 68) & 1) == 0 || self->_muid != *((_QWORD *)v4 + 4))
      goto LABEL_21;
  }
  else if ((*((_BYTE *)v4 + 68) & 1) != 0)
  {
LABEL_21:
    v7 = 0;
    goto LABEL_22;
  }
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 68) & 4) == 0 || self->_paymentMethodType != *((_DWORD *)v4 + 16))
      goto LABEL_21;
  }
  else if ((*((_BYTE *)v4 + 68) & 4) != 0)
  {
    goto LABEL_21;
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 68) & 2) == 0 || self->_addValueName != *((_DWORD *)v4 + 15))
      goto LABEL_21;
  }
  else if ((*((_BYTE *)v4 + 68) & 2) != 0)
  {
    goto LABEL_21;
  }
  name = self->_name;
  if ((unint64_t)name | *((_QWORD *)v4 + 5))
    v7 = -[NSString isEqual:](name, "isEqual:");
  else
    v7 = 1;
LABEL_22:

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;

  -[GEOPBTransitPaymentMethod readAll:](self, "readAll:", 1);
  v3 = -[NSString hash](self->_identifier, "hash");
  if ((*(_BYTE *)&self->_flags & 1) == 0)
  {
    v4 = 0;
    if ((*(_BYTE *)&self->_flags & 4) != 0)
      goto LABEL_3;
LABEL_6:
    v5 = 0;
    if ((*(_BYTE *)&self->_flags & 2) != 0)
      goto LABEL_4;
LABEL_7:
    v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ -[NSString hash](self->_name, "hash");
  }
  v4 = 2654435761u * self->_muid;
  if ((*(_BYTE *)&self->_flags & 4) == 0)
    goto LABEL_6;
LABEL_3:
  v5 = 2654435761 * self->_paymentMethodType;
  if ((*(_BYTE *)&self->_flags & 2) == 0)
    goto LABEL_7;
LABEL_4:
  v6 = 2654435761 * self->_addValueName;
  return v4 ^ v3 ^ v5 ^ v6 ^ -[NSString hash](self->_name, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  char v5;
  _QWORD *v6;

  v6 = a3;
  objc_msgSend(v6, "readAll:", 0);
  v4 = v6;
  if (v6[3])
  {
    -[GEOPBTransitPaymentMethod setIdentifier:](self, "setIdentifier:");
    v4 = v6;
  }
  v5 = *((_BYTE *)v4 + 68);
  if ((v5 & 1) != 0)
  {
    self->_muid = v4[4];
    *(_BYTE *)&self->_flags |= 1u;
    v5 = *((_BYTE *)v4 + 68);
    if ((v5 & 4) == 0)
    {
LABEL_5:
      if ((v5 & 2) == 0)
        goto LABEL_7;
      goto LABEL_6;
    }
  }
  else if ((*((_BYTE *)v4 + 68) & 4) == 0)
  {
    goto LABEL_5;
  }
  self->_paymentMethodType = *((_DWORD *)v4 + 16);
  *(_BYTE *)&self->_flags |= 4u;
  if ((*((_BYTE *)v4 + 68) & 2) != 0)
  {
LABEL_6:
    self->_addValueName = *((_DWORD *)v4 + 15);
    *(_BYTE *)&self->_flags |= 2u;
  }
LABEL_7:
  if (v4[5])
  {
    -[GEOPBTransitPaymentMethod setName:](self, "setName:");
    v4 = v6;
  }

}

- (PBUnknownFields)unknownFields
{
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v5;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_BYTE *)&self->_flags & 8) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      v5 = reader;
      objc_sync_enter(v5);
      GEOPBTransitPaymentMethodReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_556);
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
  *(_BYTE *)&self->_flags |= 0x48u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
    -[GEOPBTransitPaymentMethod readAll:](self, "readAll:", 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
