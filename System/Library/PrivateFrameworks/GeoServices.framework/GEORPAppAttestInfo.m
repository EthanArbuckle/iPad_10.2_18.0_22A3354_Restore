@implementation GEORPAppAttestInfo

- (GEORPAppAttestInfo)init
{
  GEORPAppAttestInfo *v2;
  GEORPAppAttestInfo *v3;
  GEORPAppAttestInfo *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEORPAppAttestInfo;
  v2 = -[GEORPAppAttestInfo init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPAppAttestInfo)initWithData:(id)a3
{
  GEORPAppAttestInfo *v3;
  GEORPAppAttestInfo *v4;
  GEORPAppAttestInfo *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEORPAppAttestInfo;
  v3 = -[GEORPAppAttestInfo initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readAnonymousUserId
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 68) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPAppAttestInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAnonymousUserId_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasAnonymousUserId
{
  -[GEORPAppAttestInfo _readAnonymousUserId]((uint64_t)self);
  return self->_anonymousUserId != 0;
}

- (NSString)anonymousUserId
{
  -[GEORPAppAttestInfo _readAnonymousUserId]((uint64_t)self);
  return self->_anonymousUserId;
}

- (void)setAnonymousUserId:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x22u;
  objc_storeStrong((id *)&self->_anonymousUserId, a3);
}

- (void)_readAttestation
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 68) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPAppAttestInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAttestation_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasAttestation
{
  -[GEORPAppAttestInfo _readAttestation]((uint64_t)self);
  return self->_attestation != 0;
}

- (NSData)attestation
{
  -[GEORPAppAttestInfo _readAttestation]((uint64_t)self);
  return self->_attestation;
}

- (void)setAttestation:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x28u;
  objc_storeStrong((id *)&self->_attestation, a3);
}

- (void)_readAssertion
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 68) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPAppAttestInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAssertion_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasAssertion
{
  -[GEORPAppAttestInfo _readAssertion]((uint64_t)self);
  return self->_assertion != 0;
}

- (NSData)assertion
{
  -[GEORPAppAttestInfo _readAssertion]((uint64_t)self);
  return self->_assertion;
}

- (void)setAssertion:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x24u;
  objc_storeStrong((id *)&self->_assertion, a3);
}

- (void)_readKeyId
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 68) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPAppAttestInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readKeyId_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasKeyId
{
  -[GEORPAppAttestInfo _readKeyId]((uint64_t)self);
  return self->_keyId != 0;
}

- (NSString)keyId
{
  -[GEORPAppAttestInfo _readKeyId]((uint64_t)self);
  return self->_keyId;
}

- (void)setKeyId:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x30u;
  objc_storeStrong((id *)&self->_keyId, a3);
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
  v8.super_class = (Class)GEORPAppAttestInfo;
  -[GEORPAppAttestInfo description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORPAppAttestInfo dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPAppAttestInfo _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(_QWORD *)a1
{
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
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
  objc_msgSend(a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "anonymousUserId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (a2)
      v6 = CFSTR("anonymousUserId");
    else
      v6 = CFSTR("anonymous_user_id");
    objc_msgSend(v4, "setObject:forKey:", v5, v6);
  }

  objc_msgSend(a1, "attestation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v7, "base64EncodedStringWithOptions:", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("attestation"));

    }
    else
    {
      objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("attestation"));
    }
  }

  objc_msgSend(a1, "assertion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v10, "base64EncodedStringWithOptions:", 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("assertion"));

    }
    else
    {
      objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("assertion"));
    }
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

  v15 = (void *)a1[2];
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
      v22[2] = __48__GEORPAppAttestInfo__dictionaryRepresentation___block_invoke;
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
  return -[GEORPAppAttestInfo _dictionaryRepresentation:](self, 1);
}

void __48__GEORPAppAttestInfo__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEORPAppAttestInfo)initWithDictionary:(id)a3
{
  return (GEORPAppAttestInfo *)-[GEORPAppAttestInfo _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("anonymousUserId");
      else
        v6 = CFSTR("anonymous_user_id");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = (void *)objc_msgSend(v7, "copy");
        objc_msgSend(a1, "setAnonymousUserId:", v8);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("attestation"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v9, 0);
        objc_msgSend(a1, "setAttestation:", v10);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("assertion"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v11, 0);
        objc_msgSend(a1, "setAssertion:", v12);

      }
      if (a3)
        v13 = CFSTR("keyId");
      else
        v13 = CFSTR("key_id");
      objc_msgSend(v5, "objectForKeyedSubscript:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v15 = (void *)objc_msgSend(v14, "copy");
        objc_msgSend(a1, "setKeyId:", v15);

      }
    }
  }

  return a1;
}

- (GEORPAppAttestInfo)initWithJSON:(id)a3
{
  return (GEORPAppAttestInfo *)-[GEORPAppAttestInfo _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_272;
    else
      v8 = (int *)&readAll__nonRecursiveTag_273;
    GEORPAppAttestInfoReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPAppAttestInfoIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPAppAttestInfoReadAllFrom((uint64_t)self, a3, 0);
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
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_BYTE *)&self->_flags & 0x3E) == 0))
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
    -[GEORPAppAttestInfo readAll:](self, "readAll:", 0);
    if (self->_anonymousUserId)
      PBDataWriterWriteStringField();
    v5 = v8;
    if (self->_attestation)
    {
      PBDataWriterWriteDataField();
      v5 = v8;
    }
    if (self->_assertion)
    {
      PBDataWriterWriteDataField();
      v5 = v8;
    }
    if (self->_keyId)
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
  -[GEORPAppAttestInfo readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 14) = self->_readerMarkPos;
  *((_DWORD *)v5 + 15) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_anonymousUserId)
    objc_msgSend(v5, "setAnonymousUserId:");
  if (self->_attestation)
    objc_msgSend(v5, "setAttestation:");
  v4 = v5;
  if (self->_assertion)
  {
    objc_msgSend(v5, "setAssertion:");
    v4 = v5;
  }
  if (self->_keyId)
  {
    objc_msgSend(v5, "setKeyId:");
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

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
    goto LABEL_5;
  v7 = reader;
  objc_sync_enter(v7);
  if ((*(_BYTE *)&self->_flags & 0x20) != 0)
  {
    objc_sync_exit(v7);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEORPAppAttestInfo readAll:](self, "readAll:", 0);
    v8 = -[NSString copyWithZone:](self->_anonymousUserId, "copyWithZone:", a3);
    v9 = *(void **)(v5 + 24);
    *(_QWORD *)(v5 + 24) = v8;

    v10 = -[NSData copyWithZone:](self->_attestation, "copyWithZone:", a3);
    v11 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v10;

    v12 = -[NSData copyWithZone:](self->_assertion, "copyWithZone:", a3);
    v13 = *(void **)(v5 + 32);
    *(_QWORD *)(v5 + 32) = v12;

    v14 = -[NSString copyWithZone:](self->_keyId, "copyWithZone:", a3);
    v15 = *(void **)(v5 + 48);
    *(_QWORD *)(v5 + 48) = v14;

    objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
    return (id)v5;
  }
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  GEORPAppAttestInfoReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *anonymousUserId;
  NSData *attestation;
  NSData *assertion;
  NSString *keyId;
  char v9;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((-[GEORPAppAttestInfo readAll:](self, "readAll:", 1),
         objc_msgSend(v4, "readAll:", 1),
         anonymousUserId = self->_anonymousUserId,
         !((unint64_t)anonymousUserId | v4[3]))
     || -[NSString isEqual:](anonymousUserId, "isEqual:"))
    && ((attestation = self->_attestation, !((unint64_t)attestation | v4[5]))
     || -[NSData isEqual:](attestation, "isEqual:"))
    && ((assertion = self->_assertion, !((unint64_t)assertion | v4[4]))
     || -[NSData isEqual:](assertion, "isEqual:")))
  {
    keyId = self->_keyId;
    if ((unint64_t)keyId | v4[6])
      v9 = -[NSString isEqual:](keyId, "isEqual:");
    else
      v9 = 1;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  uint64_t v5;

  -[GEORPAppAttestInfo readAll:](self, "readAll:", 1);
  v3 = -[NSString hash](self->_anonymousUserId, "hash");
  v4 = -[NSData hash](self->_attestation, "hash") ^ v3;
  v5 = -[NSData hash](self->_assertion, "hash");
  return v4 ^ v5 ^ -[NSString hash](self->_keyId, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;

  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  if (v4[3])
    -[GEORPAppAttestInfo setAnonymousUserId:](self, "setAnonymousUserId:");
  if (v4[5])
    -[GEORPAppAttestInfo setAttestation:](self, "setAttestation:");
  if (v4[4])
    -[GEORPAppAttestInfo setAssertion:](self, "setAssertion:");
  if (v4[6])
    -[GEORPAppAttestInfo setKeyId:](self, "setKeyId:");

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
      GEORPAppAttestInfoReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_276);
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
  *(_BYTE *)&self->_flags |= 0x21u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
    -[GEORPAppAttestInfo readAll:](self, "readAll:", 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyId, 0);
  objc_storeStrong((id *)&self->_attestation, 0);
  objc_storeStrong((id *)&self->_assertion, 0);
  objc_storeStrong((id *)&self->_anonymousUserId, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
