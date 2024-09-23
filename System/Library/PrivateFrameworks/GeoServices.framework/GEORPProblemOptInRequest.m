@implementation GEORPProblemOptInRequest

- (GEORPProblemOptInRequest)init
{
  GEORPProblemOptInRequest *v2;
  GEORPProblemOptInRequest *v3;
  GEORPProblemOptInRequest *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEORPProblemOptInRequest;
  v2 = -[GEORPProblemOptInRequest init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPProblemOptInRequest)initWithData:(id)a3
{
  GEORPProblemOptInRequest *v3;
  GEORPProblemOptInRequest *v4;
  GEORPProblemOptInRequest *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEORPProblemOptInRequest;
  v3 = -[GEORPProblemOptInRequest initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readProblemId
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_BYTE *)(a1 + 64) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPProblemOptInRequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readProblemId_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasProblemId
{
  -[GEORPProblemOptInRequest _readProblemId]((uint64_t)self);
  return self->_problemId != 0;
}

- (NSString)problemId
{
  -[GEORPProblemOptInRequest _readProblemId]((uint64_t)self);
  return self->_problemId;
}

- (void)setProblemId:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x24u;
  objc_storeStrong((id *)&self->_problemId, a3);
}

- (BOOL)didOptIn
{
  return self->_didOptIn;
}

- (void)setDidOptIn:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 0x21u;
  self->_didOptIn = a3;
}

- (void)setHasDidOptIn:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3 | 0x20;
}

- (BOOL)hasDidOptIn
{
  return *(_BYTE *)&self->_flags & 1;
}

- (void)_readUserCredentials
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_BYTE *)(a1 + 64) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPProblemOptInRequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readUserCredentials_tags_2334);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasUserCredentials
{
  -[GEORPProblemOptInRequest _readUserCredentials]((uint64_t)self);
  return self->_userCredentials != 0;
}

- (GEORPUserCredentials)userCredentials
{
  -[GEORPProblemOptInRequest _readUserCredentials]((uint64_t)self);
  return self->_userCredentials;
}

- (void)setUserCredentials:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x28u;
  objc_storeStrong((id *)&self->_userCredentials, a3);
}

- (void)_readDevicePushToken
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_BYTE *)(a1 + 64) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPProblemOptInRequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDevicePushToken_tags_2335);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasDevicePushToken
{
  -[GEORPProblemOptInRequest _readDevicePushToken]((uint64_t)self);
  return self->_devicePushToken != 0;
}

- (NSData)devicePushToken
{
  -[GEORPProblemOptInRequest _readDevicePushToken]((uint64_t)self);
  return self->_devicePushToken;
}

- (void)setDevicePushToken:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x22u;
  objc_storeStrong((id *)&self->_devicePushToken, a3);
}

- (void)_readUserEmail
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_BYTE *)(a1 + 64) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPProblemOptInRequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readUserEmail_tags_2336);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasUserEmail
{
  -[GEORPProblemOptInRequest _readUserEmail]((uint64_t)self);
  return self->_userEmail != 0;
}

- (NSString)userEmail
{
  -[GEORPProblemOptInRequest _readUserEmail]((uint64_t)self);
  return self->_userEmail;
}

- (void)setUserEmail:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x30u;
  objc_storeStrong((id *)&self->_userEmail, a3);
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
  v8.super_class = (Class)GEORPProblemOptInRequest;
  -[GEORPProblemOptInRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORPProblemOptInRequest dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPProblemOptInRequest _dictionaryRepresentation:]((unsigned __int8 *)self, 0);
}

- (id)_dictionaryRepresentation:(unsigned __int8 *)a1
{
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  const __CFString *v17;

  if (a1)
  {
    objc_msgSend(a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "problemId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      if (a2)
        v6 = CFSTR("problemId");
      else
        v6 = CFSTR("problem_id");
      objc_msgSend(v4, "setObject:forKey:", v5, v6);
    }

    if ((a1[64] & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a1[60]);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
        v8 = CFSTR("didOptIn");
      else
        v8 = CFSTR("did_opt_in");
      objc_msgSend(v4, "setObject:forKey:", v7, v8);

    }
    objc_msgSend(a1, "userCredentials");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v9, "jsonRepresentation");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = CFSTR("userCredentials");
      }
      else
      {
        objc_msgSend(v9, "dictionaryRepresentation");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = CFSTR("user_credentials");
      }
      objc_msgSend(v4, "setObject:forKey:", v11, v12);

    }
    objc_msgSend(a1, "devicePushToken");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v13, "base64EncodedStringWithOptions:", 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("devicePushToken"));

      }
      else
      {
        objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("device_push_token"));
      }
    }

    objc_msgSend(a1, "userEmail");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      if (a2)
        v17 = CFSTR("userEmail");
      else
        v17 = CFSTR("user_email");
      objc_msgSend(v4, "setObject:forKey:", v16, v17);
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
  return -[GEORPProblemOptInRequest _dictionaryRepresentation:]((unsigned __int8 *)self, 1);
}

- (GEORPProblemOptInRequest)initWithDictionary:(id)a3
{
  return (GEORPProblemOptInRequest *)-[GEORPProblemOptInRequest _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  GEORPUserCredentials *v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  void *v21;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("problemId");
      else
        v6 = CFSTR("problem_id");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = (void *)objc_msgSend(v7, "copy");
        objc_msgSend(a1, "setProblemId:", v8);

      }
      if (a3)
        v9 = CFSTR("didOptIn");
      else
        v9 = CFSTR("did_opt_in");
      objc_msgSend(v5, "objectForKeyedSubscript:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setDidOptIn:", objc_msgSend(v10, "BOOLValue"));

      if (a3)
        v11 = CFSTR("userCredentials");
      else
        v11 = CFSTR("user_credentials");
      objc_msgSend(v5, "objectForKeyedSubscript:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v13 = [GEORPUserCredentials alloc];
        if ((a3 & 1) != 0)
          v14 = -[GEORPUserCredentials initWithJSON:](v13, "initWithJSON:", v12);
        else
          v14 = -[GEORPUserCredentials initWithDictionary:](v13, "initWithDictionary:", v12);
        v15 = (void *)v14;
        objc_msgSend(a1, "setUserCredentials:", v14);

      }
      if (a3)
        v16 = CFSTR("devicePushToken");
      else
        v16 = CFSTR("device_push_token");
      objc_msgSend(v5, "objectForKeyedSubscript:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v17, 0);
        objc_msgSend(a1, "setDevicePushToken:", v18);

      }
      if (a3)
        v19 = CFSTR("userEmail");
      else
        v19 = CFSTR("user_email");
      objc_msgSend(v5, "objectForKeyedSubscript:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v21 = (void *)objc_msgSend(v20, "copy");
        objc_msgSend(a1, "setUserEmail:", v21);

      }
    }
  }

  return a1;
}

- (GEORPProblemOptInRequest)initWithJSON:(id)a3
{
  return (GEORPProblemOptInRequest *)-[GEORPProblemOptInRequest _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_2341;
    else
      v8 = (int *)&readAll__nonRecursiveTag_2342;
    GEORPProblemOptInRequestReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    -[GEORPUserCredentials readAll:](self->_userCredentials, "readAll:", 1);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  int *v4;
  int *v5;
  int *v6;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  int v16;
  int v17;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  int v23;
  BOOL v25;

  objc_msgSend(a3, "position");
  objc_msgSend(a3, "length");
  v4 = (int *)MEMORY[0x1E0D82BF0];
  v5 = (int *)MEMORY[0x1E0D82BD8];
  v6 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)((char *)a3 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)((char *)a3 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*((_BYTE *)a3 + *v6))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v4;
        v12 = *(_QWORD *)((char *)a3 + v11);
        v13 = v12 + 1;
        if (v12 == -1 || v13 > *(_QWORD *)((char *)a3 + *v5))
          break;
        v14 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v7) + v12);
        *(_QWORD *)((char *)a3 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v16 = *((unsigned __int8 *)a3 + *v6);
          goto LABEL_14;
        }
      }
      *((_BYTE *)a3 + *v6) = 1;
LABEL_12:
      v16 = *((unsigned __int8 *)a3 + *v6);
      if (*((_BYTE *)a3 + *v6))
        v10 = 0;
LABEL_14:
      v17 = v10 & 7;
      if (v16 || v17 == 4)
        break;
      switch((v10 >> 3))
      {
        case 1u:
          if (v17 != 2)
            goto LABEL_42;
          goto LABEL_36;
        case 2u:
          if ((v10 & 7) != 0)
            goto LABEL_42;
          v19 = 0;
          break;
        case 3u:
          if (v17 != 2 || !PBReaderPlaceMark() || !GEORPUserCredentialsIsValid((char *)a3))
            goto LABEL_42;
          PBReaderRecallMark();
          continue;
        case 4u:
          if (v17 == 2)
            goto LABEL_36;
          goto LABEL_42;
        case 5u:
          if (v17 == 2)
            goto LABEL_36;
          goto LABEL_42;
        default:
LABEL_36:
          if ((PBReaderSkipValueWithTag() & 1) != 0)
            continue;
LABEL_42:
          PBReaderRecallMark();
          return 0;
      }
      while (1)
      {
        v20 = *v4;
        v21 = *(_QWORD *)((char *)a3 + v20);
        v22 = v21 + 1;
        if (v21 == -1 || v22 > *(_QWORD *)((char *)a3 + *v5))
          break;
        v23 = *(char *)(*(_QWORD *)((char *)a3 + *v7) + v21);
        *(_QWORD *)((char *)a3 + v20) = v22;
        if (v23 < 0 && v19++ <= 8)
          continue;
        goto LABEL_37;
      }
      *((_BYTE *)a3 + *v6) = 1;
LABEL_37:
      ;
    }
    while (*(_QWORD *)((char *)a3 + *v4) < *(_QWORD *)((char *)a3 + *v5));
  }
  v25 = *((_BYTE *)a3 + *v6) == 0;
  PBReaderRecallMark();
  return v25;
}

- (BOOL)readFrom:(id)a3
{
  return GEORPProblemOptInRequestReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  char flags;
  void *v6;
  PBDataReader *v7;
  void *v8;
  id v9;

  v9 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader)
  {
    os_unfair_lock_assert_owner(&self->_readerLock);
    flags = (char)self->_flags;
    if ((flags & 0x24) == 0)
    {
      if ((*(_BYTE *)&self->_flags & 8) != 0)
      {
        if (GEORPUserCredentialsIsDirty((uint64_t)self->_userCredentials))
          goto LABEL_7;
        flags = (char)self->_flags;
      }
      if ((flags & 0x12) == 0)
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
        goto LABEL_17;
      }
    }
  }
LABEL_7:
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEORPProblemOptInRequest readAll:](self, "readAll:", 0);
  if (self->_problemId)
    PBDataWriterWriteStringField();
  v6 = v9;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    PBDataWriterWriteBOOLField();
    v6 = v9;
  }
  if (self->_userCredentials)
  {
    PBDataWriterWriteSubmessage();
    v6 = v9;
  }
  if (self->_devicePushToken)
  {
    PBDataWriterWriteDataField();
    v6 = v9;
  }
  if (self->_userEmail)
  {
    PBDataWriterWriteStringField();
LABEL_17:
    v6 = v9;
  }

}

- (unsigned)requestTypeCode
{
  return 1013;
}

- (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (void)copyTo:(id)a3
{
  id *v4;
  id *v5;

  v5 = (id *)a3;
  -[GEORPProblemOptInRequest readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 12) = self->_readerMarkPos;
  *((_DWORD *)v5 + 13) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_problemId)
    objc_msgSend(v5, "setProblemId:");
  v4 = v5;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *((_BYTE *)v5 + 60) = self->_didOptIn;
    *((_BYTE *)v5 + 64) |= 1u;
  }
  if (self->_userCredentials)
  {
    objc_msgSend(v5, "setUserCredentials:");
    v4 = v5;
  }
  if (self->_devicePushToken)
  {
    objc_msgSend(v5, "setDevicePushToken:");
    v4 = v5;
  }
  if (self->_userEmail)
  {
    objc_msgSend(v5, "setUserEmail:");
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
  uint64_t v13;
  void *v14;
  uint64_t v15;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_BYTE *)&self->_flags & 0x20) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEORPProblemOptInRequestReadAllFrom(v5, self->_reader);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_8;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEORPProblemOptInRequest readAll:](self, "readAll:", 0);
  v9 = -[NSString copyWithZone:](self->_problemId, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v9;

  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_BYTE *)(v5 + 60) = self->_didOptIn;
    *(_BYTE *)(v5 + 64) |= 1u;
  }
  v11 = -[GEORPUserCredentials copyWithZone:](self->_userCredentials, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v11;

  v13 = -[NSData copyWithZone:](self->_devicePushToken, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v13;

  v15 = -[NSString copyWithZone:](self->_userEmail, "copyWithZone:", a3);
  v8 = *(id *)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v15;
LABEL_8:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *problemId;
  GEORPUserCredentials *userCredentials;
  NSData *devicePushToken;
  NSString *userEmail;
  char v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_18;
  -[GEORPProblemOptInRequest readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  problemId = self->_problemId;
  if ((unint64_t)problemId | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](problemId, "isEqual:"))
      goto LABEL_18;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 1) != 0)
    {
      if (self->_didOptIn)
      {
        if (!*((_BYTE *)v4 + 60))
          goto LABEL_18;
        goto LABEL_12;
      }
      if (!*((_BYTE *)v4 + 60))
        goto LABEL_12;
    }
LABEL_18:
    v9 = 0;
    goto LABEL_19;
  }
  if ((*((_BYTE *)v4 + 64) & 1) != 0)
    goto LABEL_18;
LABEL_12:
  userCredentials = self->_userCredentials;
  if ((unint64_t)userCredentials | *((_QWORD *)v4 + 4)
    && !-[GEORPUserCredentials isEqual:](userCredentials, "isEqual:"))
  {
    goto LABEL_18;
  }
  devicePushToken = self->_devicePushToken;
  if ((unint64_t)devicePushToken | *((_QWORD *)v4 + 2))
  {
    if (!-[NSData isEqual:](devicePushToken, "isEqual:"))
      goto LABEL_18;
  }
  userEmail = self->_userEmail;
  if ((unint64_t)userEmail | *((_QWORD *)v4 + 5))
    v9 = -[NSString isEqual:](userEmail, "isEqual:");
  else
    v9 = 1;
LABEL_19:

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  NSUInteger v5;
  unint64_t v6;
  uint64_t v7;

  -[GEORPProblemOptInRequest readAll:](self, "readAll:", 1);
  v3 = -[NSString hash](self->_problemId, "hash");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v4 = 2654435761 * self->_didOptIn;
  else
    v4 = 0;
  v5 = v4 ^ v3;
  v6 = -[GEORPUserCredentials hash](self->_userCredentials, "hash");
  v7 = v5 ^ v6 ^ -[NSData hash](self->_devicePushToken, "hash");
  return v7 ^ -[NSString hash](self->_userEmail, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  GEORPUserCredentials *userCredentials;
  uint64_t v6;
  _QWORD *v7;

  v7 = a3;
  objc_msgSend(v7, "readAll:", 0);
  v4 = v7;
  if (v7[3])
  {
    -[GEORPProblemOptInRequest setProblemId:](self, "setProblemId:");
    v4 = v7;
  }
  if ((v4[8] & 1) != 0)
  {
    self->_didOptIn = *((_BYTE *)v4 + 60);
    *(_BYTE *)&self->_flags |= 1u;
  }
  userCredentials = self->_userCredentials;
  v6 = v4[4];
  if (userCredentials)
  {
    if (!v6)
      goto LABEL_11;
    -[GEORPUserCredentials mergeFrom:](userCredentials, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_11;
    -[GEORPProblemOptInRequest setUserCredentials:](self, "setUserCredentials:");
  }
  v4 = v7;
LABEL_11:
  if (v4[2])
  {
    -[GEORPProblemOptInRequest setDevicePushToken:](self, "setDevicePushToken:");
    v4 = v7;
  }
  if (v4[5])
  {
    -[GEORPProblemOptInRequest setUserEmail:](self, "setUserEmail:");
    v4 = v7;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userEmail, 0);
  objc_storeStrong((id *)&self->_userCredentials, 0);
  objc_storeStrong((id *)&self->_problemId, 0);
  objc_storeStrong((id *)&self->_devicePushToken, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

- (GEORPProblemOptInRequest)initWithSubmissionID:(id)a3 allowContactBackAtEmailAddress:(id)a4 traits:(id)a5
{
  id v7;
  id v8;
  GEORPProblemOptInRequest *v9;
  GEORPProblemOptInRequest *v10;
  void *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)GEORPProblemOptInRequest;
  v9 = -[GEORPProblemOptInRequest init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    -[GEORPProblemOptInRequest setProblemId:](v9, "setProblemId:", v7);
    +[GEORPUserCredentials _credentialsForPrimaryICloudAccount](GEORPUserCredentials, "_credentialsForPrimaryICloudAccount");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEORPProblemOptInRequest setUserCredentials:](v10, "setUserCredentials:", v11);

    -[GEORPProblemOptInRequest setUserEmail:](v10, "setUserEmail:", v8);
  }

  return v10;
}

@end
