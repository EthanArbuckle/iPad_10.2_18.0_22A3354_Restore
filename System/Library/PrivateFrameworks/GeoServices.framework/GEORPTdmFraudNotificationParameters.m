@implementation GEORPTdmFraudNotificationParameters

- (GEORPTdmFraudNotificationParameters)init
{
  GEORPTdmFraudNotificationParameters *v2;
  GEORPTdmFraudNotificationParameters *v3;
  GEORPTdmFraudNotificationParameters *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEORPTdmFraudNotificationParameters;
  v2 = -[GEORPTdmFraudNotificationParameters init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPTdmFraudNotificationParameters)initWithData:(id)a3
{
  GEORPTdmFraudNotificationParameters *v3;
  GEORPTdmFraudNotificationParameters *v4;
  GEORPTdmFraudNotificationParameters *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEORPTdmFraudNotificationParameters;
  v3 = -[GEORPTdmFraudNotificationParameters initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readTdmNamespace
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_BYTE *)(a1 + 76) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPTdmFraudNotificationParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTdmNamespace_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasTdmNamespace
{
  -[GEORPTdmFraudNotificationParameters _readTdmNamespace]((uint64_t)self);
  return self->_tdmNamespace != 0;
}

- (NSString)tdmNamespace
{
  -[GEORPTdmFraudNotificationParameters _readTdmNamespace]((uint64_t)self);
  return self->_tdmNamespace;
}

- (void)setTdmNamespace:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x48u;
  objc_storeStrong((id *)&self->_tdmNamespace, a3);
}

- (void)_readAnonymousId
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_BYTE *)(a1 + 76) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPTdmFraudNotificationParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAnonymousId_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasAnonymousId
{
  -[GEORPTdmFraudNotificationParameters _readAnonymousId]((uint64_t)self);
  return self->_anonymousId != 0;
}

- (NSString)anonymousId
{
  -[GEORPTdmFraudNotificationParameters _readAnonymousId]((uint64_t)self);
  return self->_anonymousId;
}

- (void)setAnonymousId:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x42u;
  objc_storeStrong((id *)&self->_anonymousId, a3);
}

- (void)_readToken
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_BYTE *)(a1 + 76) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPTdmFraudNotificationParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readToken_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasToken
{
  -[GEORPTdmFraudNotificationParameters _readToken]((uint64_t)self);
  return self->_token != 0;
}

- (NSString)token
{
  -[GEORPTdmFraudNotificationParameters _readToken]((uint64_t)self);
  return self->_token;
}

- (void)setToken:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x50u;
  objc_storeStrong((id *)&self->_token, a3);
}

- (void)_readFsrData
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_BYTE *)(a1 + 76) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPTdmFraudNotificationParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readFsrData_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasFsrData
{
  -[GEORPTdmFraudNotificationParameters _readFsrData]((uint64_t)self);
  return self->_fsrData != 0;
}

- (NSString)fsrData
{
  -[GEORPTdmFraudNotificationParameters _readFsrData]((uint64_t)self);
  return self->_fsrData;
}

- (void)setFsrData:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x44u;
  objc_storeStrong((id *)&self->_fsrData, a3);
}

- (void)_readTransactionId
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_BYTE *)(a1 + 76) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPTdmFraudNotificationParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTransactionId_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasTransactionId
{
  -[GEORPTdmFraudNotificationParameters _readTransactionId]((uint64_t)self);
  return self->_transactionId != 0;
}

- (NSString)transactionId
{
  -[GEORPTdmFraudNotificationParameters _readTransactionId]((uint64_t)self);
  return self->_transactionId;
}

- (void)setTransactionId:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x60u;
  objc_storeStrong((id *)&self->_transactionId, a3);
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
  v8.super_class = (Class)GEORPTdmFraudNotificationParameters;
  -[GEORPTdmFraudNotificationParameters description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORPTdmFraudNotificationParameters dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPTdmFraudNotificationParameters _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(_QWORD *)a1
{
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
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
  objc_msgSend(a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "tdmNamespace");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (a2)
      v6 = CFSTR("tdmNamespace");
    else
      v6 = CFSTR("tdm_namespace");
    objc_msgSend(v4, "setObject:forKey:", v5, v6);
  }

  objc_msgSend(a1, "anonymousId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    if (a2)
      v8 = CFSTR("anonymousId");
    else
      v8 = CFSTR("anonymous_id");
    objc_msgSend(v4, "setObject:forKey:", v7, v8);
  }

  objc_msgSend(a1, "token");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("token"));

  objc_msgSend(a1, "fsrData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    if (a2)
      v11 = CFSTR("fsrData");
    else
      v11 = CFSTR("fsr_data");
    objc_msgSend(v4, "setObject:forKey:", v10, v11);
  }

  objc_msgSend(a1, "transactionId");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    if (a2)
      v13 = CFSTR("transactionId");
    else
      v13 = CFSTR("transaction_id");
    objc_msgSend(v4, "setObject:forKey:", v12, v13);
  }

  v14 = (void *)a1[2];
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
      v21[2] = __65__GEORPTdmFraudNotificationParameters__dictionaryRepresentation___block_invoke;
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
  return -[GEORPTdmFraudNotificationParameters _dictionaryRepresentation:](self, 1);
}

void __65__GEORPTdmFraudNotificationParameters__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEORPTdmFraudNotificationParameters)initWithDictionary:(id)a3
{
  return (GEORPTdmFraudNotificationParameters *)-[GEORPTdmFraudNotificationParameters _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v19;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("tdmNamespace");
      else
        v6 = CFSTR("tdm_namespace");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = (void *)objc_msgSend(v7, "copy");
        objc_msgSend(a1, "setTdmNamespace:", v8);

      }
      if (a3)
        v9 = CFSTR("anonymousId");
      else
        v9 = CFSTR("anonymous_id");
      objc_msgSend(v5, "objectForKeyedSubscript:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = (void *)objc_msgSend(v10, "copy");
        objc_msgSend(a1, "setAnonymousId:", v11);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("token"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v13 = (void *)objc_msgSend(v12, "copy");
        objc_msgSend(a1, "setToken:", v13);

      }
      if (a3)
        v14 = CFSTR("fsrData");
      else
        v14 = CFSTR("fsr_data");
      objc_msgSend(v5, "objectForKeyedSubscript:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v16 = (void *)objc_msgSend(v15, "copy");
        objc_msgSend(a1, "setFsrData:", v16);

      }
      if (a3)
        v17 = CFSTR("transactionId");
      else
        v17 = CFSTR("transaction_id");
      objc_msgSend(v5, "objectForKeyedSubscript:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v19 = (void *)objc_msgSend(v18, "copy");
        objc_msgSend(a1, "setTransactionId:", v19);

      }
    }
  }

  return a1;
}

- (GEORPTdmFraudNotificationParameters)initWithJSON:(id)a3
{
  return (GEORPTdmFraudNotificationParameters *)-[GEORPTdmFraudNotificationParameters _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_2973;
    else
      v8 = (int *)&readAll__nonRecursiveTag_2974;
    GEORPTdmFraudNotificationParametersReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPTdmFraudNotificationParametersIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPTdmFraudNotificationParametersReadAllFrom((uint64_t)self, a3, 0);
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
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_BYTE *)&self->_flags & 0x7E) == 0))
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
    -[GEORPTdmFraudNotificationParameters readAll:](self, "readAll:", 0);
    if (self->_tdmNamespace)
      PBDataWriterWriteStringField();
    v5 = v8;
    if (self->_anonymousId)
    {
      PBDataWriterWriteStringField();
      v5 = v8;
    }
    if (self->_token)
    {
      PBDataWriterWriteStringField();
      v5 = v8;
    }
    if (self->_fsrData)
    {
      PBDataWriterWriteStringField();
      v5 = v8;
    }
    if (self->_transactionId)
    {
      PBDataWriterWriteStringField();
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
  -[GEORPTdmFraudNotificationParameters readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 16) = self->_readerMarkPos;
  *((_DWORD *)v5 + 17) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_tdmNamespace)
    objc_msgSend(v5, "setTdmNamespace:");
  if (self->_anonymousId)
    objc_msgSend(v5, "setAnonymousId:");
  v4 = v5;
  if (self->_token)
  {
    objc_msgSend(v5, "setToken:");
    v4 = v5;
  }
  if (self->_fsrData)
  {
    objc_msgSend(v5, "setFsrData:");
    v4 = v5;
  }
  if (self->_transactionId)
  {
    objc_msgSend(v5, "setTransactionId:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
    goto LABEL_5;
  v7 = reader;
  objc_sync_enter(v7);
  if ((*(_BYTE *)&self->_flags & 0x40) != 0)
  {
    objc_sync_exit(v7);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEORPTdmFraudNotificationParameters readAll:](self, "readAll:", 0);
    v8 = -[NSString copyWithZone:](self->_tdmNamespace, "copyWithZone:", a3);
    v9 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v8;

    v10 = -[NSString copyWithZone:](self->_anonymousId, "copyWithZone:", a3);
    v11 = *(void **)(v5 + 24);
    *(_QWORD *)(v5 + 24) = v10;

    v12 = -[NSString copyWithZone:](self->_token, "copyWithZone:", a3);
    v13 = *(void **)(v5 + 48);
    *(_QWORD *)(v5 + 48) = v12;

    v14 = -[NSString copyWithZone:](self->_fsrData, "copyWithZone:", a3);
    v15 = *(void **)(v5 + 32);
    *(_QWORD *)(v5 + 32) = v14;

    v16 = -[NSString copyWithZone:](self->_transactionId, "copyWithZone:", a3);
    v17 = *(void **)(v5 + 56);
    *(_QWORD *)(v5 + 56) = v16;

    objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
    return (id)v5;
  }
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  GEORPTdmFraudNotificationParametersReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *tdmNamespace;
  NSString *anonymousId;
  NSString *token;
  NSString *fsrData;
  NSString *transactionId;
  char v10;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((-[GEORPTdmFraudNotificationParameters readAll:](self, "readAll:", 1),
         objc_msgSend(v4, "readAll:", 1),
         tdmNamespace = self->_tdmNamespace,
         !((unint64_t)tdmNamespace | v4[5]))
     || -[NSString isEqual:](tdmNamespace, "isEqual:"))
    && ((anonymousId = self->_anonymousId, !((unint64_t)anonymousId | v4[3]))
     || -[NSString isEqual:](anonymousId, "isEqual:"))
    && ((token = self->_token, !((unint64_t)token | v4[6]))
     || -[NSString isEqual:](token, "isEqual:"))
    && ((fsrData = self->_fsrData, !((unint64_t)fsrData | v4[4]))
     || -[NSString isEqual:](fsrData, "isEqual:")))
  {
    transactionId = self->_transactionId;
    if ((unint64_t)transactionId | v4[7])
      v10 = -[NSString isEqual:](transactionId, "isEqual:");
    else
      v10 = 1;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;

  -[GEORPTdmFraudNotificationParameters readAll:](self, "readAll:", 1);
  v3 = -[NSString hash](self->_tdmNamespace, "hash");
  v4 = -[NSString hash](self->_anonymousId, "hash") ^ v3;
  v5 = -[NSString hash](self->_token, "hash");
  v6 = v4 ^ v5 ^ -[NSString hash](self->_fsrData, "hash");
  return v6 ^ -[NSString hash](self->_transactionId, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;

  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  if (v4[5])
    -[GEORPTdmFraudNotificationParameters setTdmNamespace:](self, "setTdmNamespace:");
  if (v4[3])
    -[GEORPTdmFraudNotificationParameters setAnonymousId:](self, "setAnonymousId:");
  if (v4[6])
    -[GEORPTdmFraudNotificationParameters setToken:](self, "setToken:");
  if (v4[4])
    -[GEORPTdmFraudNotificationParameters setFsrData:](self, "setFsrData:");
  if (v4[7])
    -[GEORPTdmFraudNotificationParameters setTransactionId:](self, "setTransactionId:");

}

- (PBUnknownFields)unknownFields
{
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v5;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_BYTE *)&self->_flags & 1) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      v5 = reader;
      objc_sync_enter(v5);
      GEORPTdmFraudNotificationParametersReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_2977);
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
  *(_BYTE *)&self->_flags |= 0x41u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
    -[GEORPTdmFraudNotificationParameters readAll:](self, "readAll:", 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionId, 0);
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong((id *)&self->_tdmNamespace, 0);
  objc_storeStrong((id *)&self->_fsrData, 0);
  objc_storeStrong((id *)&self->_anonymousId, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
