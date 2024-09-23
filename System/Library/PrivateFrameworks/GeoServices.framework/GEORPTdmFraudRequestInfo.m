@implementation GEORPTdmFraudRequestInfo

- (GEORPTdmFraudRequestInfo)init
{
  GEORPTdmFraudRequestInfo *v2;
  GEORPTdmFraudRequestInfo *v3;
  GEORPTdmFraudRequestInfo *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEORPTdmFraudRequestInfo;
  v2 = -[GEORPTdmFraudRequestInfo init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPTdmFraudRequestInfo)initWithData:(id)a3
{
  GEORPTdmFraudRequestInfo *v3;
  GEORPTdmFraudRequestInfo *v4;
  GEORPTdmFraudRequestInfo *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEORPTdmFraudRequestInfo;
  v3 = -[GEORPTdmFraudRequestInfo initWithData:](&v7, sel_initWithData_, a3);
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
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_BYTE *)(a1 + 84) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPTdmFraudRequestInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTdmNamespace_tags_3012);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasTdmNamespace
{
  -[GEORPTdmFraudRequestInfo _readTdmNamespace]((uint64_t)self);
  return self->_tdmNamespace != 0;
}

- (NSString)tdmNamespace
{
  -[GEORPTdmFraudRequestInfo _readTdmNamespace]((uint64_t)self);
  return self->_tdmNamespace;
}

- (void)setTdmNamespace:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x90u;
  objc_storeStrong((id *)&self->_tdmNamespace, a3);
}

- (void)_readTransactionId
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_BYTE *)(a1 + 84) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPTdmFraudRequestInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTransactionId_tags_3013);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasTransactionId
{
  -[GEORPTdmFraudRequestInfo _readTransactionId]((uint64_t)self);
  return self->_transactionId != 0;
}

- (NSString)transactionId
{
  -[GEORPTdmFraudRequestInfo _readTransactionId]((uint64_t)self);
  return self->_transactionId;
}

- (void)setTransactionId:(id)a3
{
  *(_BYTE *)&self->_flags |= 0xC0u;
  objc_storeStrong((id *)&self->_transactionId, a3);
}

- (void)_readAnonymousId
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_BYTE *)(a1 + 84) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPTdmFraudRequestInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAnonymousId_tags_3014);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasAnonymousId
{
  -[GEORPTdmFraudRequestInfo _readAnonymousId]((uint64_t)self);
  return self->_anonymousId != 0;
}

- (NSString)anonymousId
{
  -[GEORPTdmFraudRequestInfo _readAnonymousId]((uint64_t)self);
  return self->_anonymousId;
}

- (void)setAnonymousId:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x82u;
  objc_storeStrong((id *)&self->_anonymousId, a3);
}

- (void)_readFsrData
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_BYTE *)(a1 + 84) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPTdmFraudRequestInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readFsrData_tags_3015);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasFsrData
{
  -[GEORPTdmFraudRequestInfo _readFsrData]((uint64_t)self);
  return self->_fsrData != 0;
}

- (NSString)fsrData
{
  -[GEORPTdmFraudRequestInfo _readFsrData]((uint64_t)self);
  return self->_fsrData;
}

- (void)setFsrData:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x84u;
  objc_storeStrong((id *)&self->_fsrData, a3);
}

- (void)_readKeyId
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_BYTE *)(a1 + 84) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPTdmFraudRequestInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readKeyId_tags_3016);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasKeyId
{
  -[GEORPTdmFraudRequestInfo _readKeyId]((uint64_t)self);
  return self->_keyId != 0;
}

- (NSString)keyId
{
  -[GEORPTdmFraudRequestInfo _readKeyId]((uint64_t)self);
  return self->_keyId;
}

- (void)setKeyId:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x88u;
  objc_storeStrong((id *)&self->_keyId, a3);
}

- (void)_readTdmUserMapsStatus
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_BYTE *)(a1 + 84) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPTdmFraudRequestInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTdmUserMapsStatus_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasTdmUserMapsStatus
{
  -[GEORPTdmFraudRequestInfo _readTdmUserMapsStatus]((uint64_t)self);
  return self->_tdmUserMapsStatus != 0;
}

- (GEORPTdmUserMapsStatus)tdmUserMapsStatus
{
  -[GEORPTdmFraudRequestInfo _readTdmUserMapsStatus]((uint64_t)self);
  return self->_tdmUserMapsStatus;
}

- (void)setTdmUserMapsStatus:(id)a3
{
  *(_BYTE *)&self->_flags |= 0xA0u;
  objc_storeStrong((id *)&self->_tdmUserMapsStatus, a3);
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
  v8.super_class = (Class)GEORPTdmFraudRequestInfo;
  -[GEORPTdmFraudRequestInfo description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORPTdmFraudRequestInfo dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPTdmFraudRequestInfo _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(_QWORD *)a1
{
  void *v4;
  void *v5;
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
  void *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  _QWORD v26[4];
  id v27;

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

  objc_msgSend(a1, "transactionId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    if (a2)
      v8 = CFSTR("transactionId");
    else
      v8 = CFSTR("transaction_id");
    objc_msgSend(v4, "setObject:forKey:", v7, v8);
  }

  objc_msgSend(a1, "anonymousId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    if (a2)
      v10 = CFSTR("anonymousId");
    else
      v10 = CFSTR("anonymous_id");
    objc_msgSend(v4, "setObject:forKey:", v9, v10);
  }

  objc_msgSend(a1, "fsrData");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    if (a2)
      v12 = CFSTR("fsrData");
    else
      v12 = CFSTR("fsr_data");
    objc_msgSend(v4, "setObject:forKey:", v11, v12);
  }

  objc_msgSend(a1, "keyId");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    if (a2)
      v14 = CFSTR("keyId");
    else
      v14 = CFSTR("key_id");
    objc_msgSend(v4, "setObject:forKey:", v13, v14);
  }

  objc_msgSend(a1, "tdmUserMapsStatus");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v15, "jsonRepresentation");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = CFSTR("tdmUserMapsStatus");
    }
    else
    {
      objc_msgSend(v15, "dictionaryRepresentation");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = CFSTR("tdm_user_maps_status");
    }
    objc_msgSend(v4, "setObject:forKey:", v17, v18);

  }
  v19 = (void *)a1[2];
  if (v19)
  {
    objc_msgSend(v19, "dictionaryRepresentation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v20, "count"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __54__GEORPTdmFraudRequestInfo__dictionaryRepresentation___block_invoke;
      v26[3] = &unk_1E1C00600;
      v23 = v22;
      v27 = v23;
      objc_msgSend(v21, "enumerateKeysAndObjectsUsingBlock:", v26);
      v24 = v23;

      v21 = v24;
    }
    objc_msgSend(v4, "setObject:forKey:", v21, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEORPTdmFraudRequestInfo _dictionaryRepresentation:](self, 1);
}

void __54__GEORPTdmFraudRequestInfo__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEORPTdmFraudRequestInfo)initWithDictionary:(id)a3
{
  return (GEORPTdmFraudRequestInfo *)-[GEORPTdmFraudRequestInfo _initWithDictionary:isJSON:](self, a3, 0);
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
  const __CFString *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  GEORPTdmUserMapsStatus *v23;
  uint64_t v24;
  void *v25;

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
        v9 = CFSTR("transactionId");
      else
        v9 = CFSTR("transaction_id");
      objc_msgSend(v5, "objectForKeyedSubscript:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = (void *)objc_msgSend(v10, "copy");
        objc_msgSend(a1, "setTransactionId:", v11);

      }
      if (a3)
        v12 = CFSTR("anonymousId");
      else
        v12 = CFSTR("anonymous_id");
      objc_msgSend(v5, "objectForKeyedSubscript:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v14 = (void *)objc_msgSend(v13, "copy");
        objc_msgSend(a1, "setAnonymousId:", v14);

      }
      if (a3)
        v15 = CFSTR("fsrData");
      else
        v15 = CFSTR("fsr_data");
      objc_msgSend(v5, "objectForKeyedSubscript:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v17 = (void *)objc_msgSend(v16, "copy");
        objc_msgSend(a1, "setFsrData:", v17);

      }
      if (a3)
        v18 = CFSTR("keyId");
      else
        v18 = CFSTR("key_id");
      objc_msgSend(v5, "objectForKeyedSubscript:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v20 = (void *)objc_msgSend(v19, "copy");
        objc_msgSend(a1, "setKeyId:", v20);

      }
      if (a3)
        v21 = CFSTR("tdmUserMapsStatus");
      else
        v21 = CFSTR("tdm_user_maps_status");
      objc_msgSend(v5, "objectForKeyedSubscript:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v23 = [GEORPTdmUserMapsStatus alloc];
        if ((a3 & 1) != 0)
          v24 = -[GEORPTdmUserMapsStatus initWithJSON:](v23, "initWithJSON:", v22);
        else
          v24 = -[GEORPTdmUserMapsStatus initWithDictionary:](v23, "initWithDictionary:", v22);
        v25 = (void *)v24;
        objc_msgSend(a1, "setTdmUserMapsStatus:", v24);

      }
    }
  }

  return a1;
}

- (GEORPTdmFraudRequestInfo)initWithJSON:(id)a3
{
  return (GEORPTdmFraudRequestInfo *)-[GEORPTdmFraudRequestInfo _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_3022;
    else
      v8 = (int *)&readAll__nonRecursiveTag_3023;
    GEORPTdmFraudRequestInfoReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    -[GEORPTdmUserMapsStatus readAll:](self->_tdmUserMapsStatus, "readAll:", 1);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPTdmFraudRequestInfoIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPTdmFraudRequestInfoReadAllFrom((uint64_t)self, a3, 0);
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
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), *(_BYTE *)&self->_flags <= 1u))
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
    -[GEORPTdmFraudRequestInfo readAll:](self, "readAll:", 0);
    if (self->_tdmNamespace)
      PBDataWriterWriteStringField();
    v5 = v8;
    if (self->_transactionId)
    {
      PBDataWriterWriteStringField();
      v5 = v8;
    }
    if (self->_anonymousId)
    {
      PBDataWriterWriteStringField();
      v5 = v8;
    }
    if (self->_fsrData)
    {
      PBDataWriterWriteStringField();
      v5 = v8;
    }
    if (self->_keyId)
    {
      PBDataWriterWriteStringField();
      v5 = v8;
    }
    if (self->_tdmUserMapsStatus)
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
  -[GEORPTdmFraudRequestInfo readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 18) = self->_readerMarkPos;
  *((_DWORD *)v5 + 19) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_tdmNamespace)
    objc_msgSend(v5, "setTdmNamespace:");
  if (self->_transactionId)
    objc_msgSend(v5, "setTransactionId:");
  v4 = v5;
  if (self->_anonymousId)
  {
    objc_msgSend(v5, "setAnonymousId:");
    v4 = v5;
  }
  if (self->_fsrData)
  {
    objc_msgSend(v5, "setFsrData:");
    v4 = v5;
  }
  if (self->_keyId)
  {
    objc_msgSend(v5, "setKeyId:");
    v4 = v5;
  }
  if (self->_tdmUserMapsStatus)
  {
    objc_msgSend(v5, "setTdmUserMapsStatus:");
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
  id v18;
  void *v19;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
    goto LABEL_5;
  v7 = reader;
  objc_sync_enter(v7);
  if ((*(_BYTE *)&self->_flags & 0x80000000) != 0)
  {
    objc_sync_exit(v7);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEORPTdmFraudRequestInfo readAll:](self, "readAll:", 0);
    v8 = -[NSString copyWithZone:](self->_tdmNamespace, "copyWithZone:", a3);
    v9 = *(void **)(v5 + 48);
    *(_QWORD *)(v5 + 48) = v8;

    v10 = -[NSString copyWithZone:](self->_transactionId, "copyWithZone:", a3);
    v11 = *(void **)(v5 + 64);
    *(_QWORD *)(v5 + 64) = v10;

    v12 = -[NSString copyWithZone:](self->_anonymousId, "copyWithZone:", a3);
    v13 = *(void **)(v5 + 24);
    *(_QWORD *)(v5 + 24) = v12;

    v14 = -[NSString copyWithZone:](self->_fsrData, "copyWithZone:", a3);
    v15 = *(void **)(v5 + 32);
    *(_QWORD *)(v5 + 32) = v14;

    v16 = -[NSString copyWithZone:](self->_keyId, "copyWithZone:", a3);
    v17 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v16;

    v18 = -[GEORPTdmUserMapsStatus copyWithZone:](self->_tdmUserMapsStatus, "copyWithZone:", a3);
    v19 = *(void **)(v5 + 56);
    *(_QWORD *)(v5 + 56) = v18;

    objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
    return (id)v5;
  }
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  GEORPTdmFraudRequestInfoReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *tdmNamespace;
  NSString *transactionId;
  NSString *anonymousId;
  NSString *fsrData;
  NSString *keyId;
  GEORPTdmUserMapsStatus *tdmUserMapsStatus;
  char v11;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((-[GEORPTdmFraudRequestInfo readAll:](self, "readAll:", 1),
         objc_msgSend(v4, "readAll:", 1),
         tdmNamespace = self->_tdmNamespace,
         !((unint64_t)tdmNamespace | v4[6]))
     || -[NSString isEqual:](tdmNamespace, "isEqual:"))
    && ((transactionId = self->_transactionId, !((unint64_t)transactionId | v4[8]))
     || -[NSString isEqual:](transactionId, "isEqual:"))
    && ((anonymousId = self->_anonymousId, !((unint64_t)anonymousId | v4[3]))
     || -[NSString isEqual:](anonymousId, "isEqual:"))
    && ((fsrData = self->_fsrData, !((unint64_t)fsrData | v4[4]))
     || -[NSString isEqual:](fsrData, "isEqual:"))
    && ((keyId = self->_keyId, !((unint64_t)keyId | v4[5]))
     || -[NSString isEqual:](keyId, "isEqual:")))
  {
    tdmUserMapsStatus = self->_tdmUserMapsStatus;
    if ((unint64_t)tdmUserMapsStatus | v4[7])
      v11 = -[GEORPTdmUserMapsStatus isEqual:](tdmUserMapsStatus, "isEqual:");
    else
      v11 = 1;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;

  -[GEORPTdmFraudRequestInfo readAll:](self, "readAll:", 1);
  v3 = -[NSString hash](self->_tdmNamespace, "hash");
  v4 = -[NSString hash](self->_transactionId, "hash") ^ v3;
  v5 = -[NSString hash](self->_anonymousId, "hash");
  v6 = v4 ^ v5 ^ -[NSString hash](self->_fsrData, "hash");
  v7 = -[NSString hash](self->_keyId, "hash");
  return v6 ^ v7 ^ -[GEORPTdmUserMapsStatus hash](self->_tdmUserMapsStatus, "hash");
}

- (void)mergeFrom:(id)a3
{
  GEORPTdmUserMapsStatus *tdmUserMapsStatus;
  uint64_t v5;
  _QWORD *v6;

  v6 = a3;
  objc_msgSend(v6, "readAll:", 0);
  if (v6[6])
    -[GEORPTdmFraudRequestInfo setTdmNamespace:](self, "setTdmNamespace:");
  if (v6[8])
    -[GEORPTdmFraudRequestInfo setTransactionId:](self, "setTransactionId:");
  if (v6[3])
    -[GEORPTdmFraudRequestInfo setAnonymousId:](self, "setAnonymousId:");
  if (v6[4])
    -[GEORPTdmFraudRequestInfo setFsrData:](self, "setFsrData:");
  if (v6[5])
    -[GEORPTdmFraudRequestInfo setKeyId:](self, "setKeyId:");
  tdmUserMapsStatus = self->_tdmUserMapsStatus;
  v5 = v6[7];
  if (tdmUserMapsStatus)
  {
    if (v5)
      -[GEORPTdmUserMapsStatus mergeFrom:](tdmUserMapsStatus, "mergeFrom:");
  }
  else if (v5)
  {
    -[GEORPTdmFraudRequestInfo setTdmUserMapsStatus:](self, "setTdmUserMapsStatus:");
  }

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
      GEORPTdmFraudRequestInfoReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_3026);
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
  *(_BYTE *)&self->_flags |= 0x81u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEORPTdmFraudRequestInfo readAll:](self, "readAll:", 0);
    -[GEORPTdmUserMapsStatus clearUnknownFields:](self->_tdmUserMapsStatus, "clearUnknownFields:", 1);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionId, 0);
  objc_storeStrong((id *)&self->_tdmUserMapsStatus, 0);
  objc_storeStrong((id *)&self->_tdmNamespace, 0);
  objc_storeStrong((id *)&self->_keyId, 0);
  objc_storeStrong((id *)&self->_fsrData, 0);
  objc_storeStrong((id *)&self->_anonymousId, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
