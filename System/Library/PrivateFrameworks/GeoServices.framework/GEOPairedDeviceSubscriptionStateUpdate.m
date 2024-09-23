@implementation GEOPairedDeviceSubscriptionStateUpdate

- (GEOPairedDeviceSubscriptionStateUpdate)init
{
  GEOPairedDeviceSubscriptionStateUpdate *v2;
  GEOPairedDeviceSubscriptionStateUpdate *v3;
  GEOPairedDeviceSubscriptionStateUpdate *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPairedDeviceSubscriptionStateUpdate;
  v2 = -[GEOPairedDeviceSubscriptionStateUpdate init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPairedDeviceSubscriptionStateUpdate)initWithData:(id)a3
{
  GEOPairedDeviceSubscriptionStateUpdate *v3;
  GEOPairedDeviceSubscriptionStateUpdate *v4;
  GEOPairedDeviceSubscriptionStateUpdate *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPairedDeviceSubscriptionStateUpdate;
  v3 = -[GEOPairedDeviceSubscriptionStateUpdate initWithData:](&v7, sel_initWithData_, a3);
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
    if ((*(_BYTE *)(a1 + 68) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPairedDeviceSubscriptionStateUpdateReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readIdentifier_tags_9);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasIdentifier
{
  -[GEOPairedDeviceSubscriptionStateUpdate _readIdentifier]((uint64_t)self);
  return self->_identifier != 0;
}

- (NSString)identifier
{
  -[GEOPairedDeviceSubscriptionStateUpdate _readIdentifier]((uint64_t)self);
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x48u;
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (unsigned)loadState
{
  return self->_loadState;
}

- (void)setLoadState:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 0x42u;
  self->_loadState = a3;
}

- (void)setHasLoadState:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 66;
  else
    v3 = 64;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasLoadState
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (unsigned)downloadState
{
  return self->_downloadState;
}

- (void)setDownloadState:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 0x41u;
  self->_downloadState = a3;
}

- (void)setHasDownloadState:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3 | 0x40;
}

- (BOOL)hasDownloadState
{
  return *(_BYTE *)&self->_flags & 1;
}

- (void)_readProgress
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
        GEOPairedDeviceSubscriptionStateUpdateReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readProgress_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasProgress
{
  -[GEOPairedDeviceSubscriptionStateUpdate _readProgress]((uint64_t)self);
  return self->_progress != 0;
}

- (GEOPairedDeviceProgress)progress
{
  -[GEOPairedDeviceSubscriptionStateUpdate _readProgress]((uint64_t)self);
  return self->_progress;
}

- (void)setProgress:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x50u;
  objc_storeStrong((id *)&self->_progress, a3);
}

- (void)_readUserInfo
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
        GEOPairedDeviceSubscriptionStateUpdateReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readUserInfo_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasUserInfo
{
  -[GEOPairedDeviceSubscriptionStateUpdate _readUserInfo]((uint64_t)self);
  return self->_userInfo != 0;
}

- (GEOPairedDeviceSubscriptionStateUserInfo)userInfo
{
  -[GEOPairedDeviceSubscriptionStateUpdate _readUserInfo]((uint64_t)self);
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x60u;
  objc_storeStrong((id *)&self->_userInfo, a3);
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
  v8.super_class = (Class)GEOPairedDeviceSubscriptionStateUpdate;
  -[GEOPairedDeviceSubscriptionStateUpdate description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPairedDeviceSubscriptionStateUpdate dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPairedDeviceSubscriptionStateUpdate _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  char v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  _QWORD v25[4];
  id v26;

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
  if ((v6 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 64));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v8 = CFSTR("loadState");
    else
      v8 = CFSTR("load_state");
    objc_msgSend(v4, "setObject:forKey:", v7, v8);

    v6 = *(_BYTE *)(a1 + 68);
  }
  if ((v6 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 60));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v10 = CFSTR("downloadState");
    else
      v10 = CFSTR("download_state");
    objc_msgSend(v4, "setObject:forKey:", v9, v10);

  }
  objc_msgSend((id)a1, "progress");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v11, "jsonRepresentation");
    else
      objc_msgSend(v11, "dictionaryRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("progress"));

  }
  objc_msgSend((id)a1, "userInfo");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v14, "jsonRepresentation");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = CFSTR("userInfo");
    }
    else
    {
      objc_msgSend(v14, "dictionaryRepresentation");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = CFSTR("user_info");
    }
    objc_msgSend(v4, "setObject:forKey:", v16, v17);

  }
  v18 = *(void **)(a1 + 16);
  if (v18)
  {
    objc_msgSend(v18, "dictionaryRepresentation");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v19, "count"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __68__GEOPairedDeviceSubscriptionStateUpdate__dictionaryRepresentation___block_invoke;
      v25[3] = &unk_1E1C00600;
      v22 = v21;
      v26 = v22;
      objc_msgSend(v20, "enumerateKeysAndObjectsUsingBlock:", v25);
      v23 = v22;

      v20 = v23;
    }
    objc_msgSend(v4, "setObject:forKey:", v20, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPairedDeviceSubscriptionStateUpdate _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __68__GEOPairedDeviceSubscriptionStateUpdate__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOPairedDeviceSubscriptionStateUpdate)initWithDictionary:(id)a3
{
  return (GEOPairedDeviceSubscriptionStateUpdate *)-[GEOPairedDeviceSubscriptionStateUpdate _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  GEOPairedDeviceProgress *v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  GEOPairedDeviceSubscriptionStateUserInfo *v18;
  uint64_t v19;
  void *v20;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("identifier"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = (void *)objc_msgSend(v6, "copy");
        objc_msgSend(a1, "setIdentifier:", v7);

      }
      if (a3)
        v8 = CFSTR("loadState");
      else
        v8 = CFSTR("load_state");
      objc_msgSend(v5, "objectForKeyedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setLoadState:", objc_msgSend(v9, "unsignedIntValue"));

      if (a3)
        v10 = CFSTR("downloadState");
      else
        v10 = CFSTR("download_state");
      objc_msgSend(v5, "objectForKeyedSubscript:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setDownloadState:", objc_msgSend(v11, "unsignedIntValue"));

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("progress"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v13 = [GEOPairedDeviceProgress alloc];
        if ((a3 & 1) != 0)
          v14 = -[GEOPairedDeviceProgress initWithJSON:](v13, "initWithJSON:", v12);
        else
          v14 = -[GEOPairedDeviceProgress initWithDictionary:](v13, "initWithDictionary:", v12);
        v15 = (void *)v14;
        objc_msgSend(a1, "setProgress:", v14);

      }
      if (a3)
        v16 = CFSTR("userInfo");
      else
        v16 = CFSTR("user_info");
      objc_msgSend(v5, "objectForKeyedSubscript:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v18 = [GEOPairedDeviceSubscriptionStateUserInfo alloc];
        if ((a3 & 1) != 0)
          v19 = -[GEOPairedDeviceSubscriptionStateUserInfo initWithJSON:](v18, "initWithJSON:", v17);
        else
          v19 = -[GEOPairedDeviceSubscriptionStateUserInfo initWithDictionary:](v18, "initWithDictionary:", v17);
        v20 = (void *)v19;
        objc_msgSend(a1, "setUserInfo:", v19);

      }
    }
  }

  return a1;
}

- (GEOPairedDeviceSubscriptionStateUpdate)initWithJSON:(id)a3
{
  return (GEOPairedDeviceSubscriptionStateUpdate *)-[GEOPairedDeviceSubscriptionStateUpdate _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_514_0;
    else
      v8 = (int *)&readAll__nonRecursiveTag_515_0;
    GEOPairedDeviceSubscriptionStateUpdateReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
  {
    -[GEOPairedDeviceProgress readAll:](self->_progress, "readAll:", 1);
    -[GEOPairedDeviceSubscriptionStateUserInfo readAll:](self->_userInfo, "readAll:", 1);
  }
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPairedDeviceSubscriptionStateUpdateIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPairedDeviceSubscriptionStateUpdateReadAllFrom((uint64_t)self, a3, 0);
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
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_BYTE *)&self->_flags & 0x78) == 0))
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
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPairedDeviceSubscriptionStateUpdate readAll:](self, "readAll:", 0);
    if (self->_identifier)
      PBDataWriterWriteStringField();
    flags = (char)self->_flags;
    v6 = v9;
    if ((flags & 2) != 0)
    {
      PBDataWriterWriteUint32Field();
      v6 = v9;
      flags = (char)self->_flags;
    }
    if ((flags & 1) != 0)
    {
      PBDataWriterWriteUint32Field();
      v6 = v9;
    }
    if (self->_progress)
    {
      PBDataWriterWriteSubmessage();
      v6 = v9;
    }
    if (self->_userInfo)
    {
      PBDataWriterWriteSubmessage();
      v6 = v9;
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v6);
  }

}

- (void)copyTo:(id)a3
{
  char flags;
  id *v5;
  id *v6;

  v6 = (id *)a3;
  -[GEOPairedDeviceSubscriptionStateUpdate readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v6 + 1, self->_reader);
  *((_DWORD *)v6 + 12) = self->_readerMarkPos;
  *((_DWORD *)v6 + 13) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_identifier)
    objc_msgSend(v6, "setIdentifier:");
  flags = (char)self->_flags;
  v5 = v6;
  if ((flags & 2) != 0)
  {
    *((_DWORD *)v6 + 16) = self->_loadState;
    *((_BYTE *)v6 + 68) |= 2u;
    flags = (char)self->_flags;
  }
  if ((flags & 1) != 0)
  {
    *((_DWORD *)v6 + 15) = self->_downloadState;
    *((_BYTE *)v6 + 68) |= 1u;
  }
  if (self->_progress)
  {
    objc_msgSend(v6, "setProgress:");
    v5 = v6;
  }
  if (self->_userInfo)
  {
    objc_msgSend(v6, "setUserInfo:");
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
  id v12;
  void *v13;
  id v14;
  void *v15;
  PBUnknownFields *v16;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_BYTE *)&self->_flags & 0x40) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOPairedDeviceSubscriptionStateUpdateReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_10;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPairedDeviceSubscriptionStateUpdate readAll:](self, "readAll:", 0);
  v9 = -[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v9;

  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 64) = self->_loadState;
    *(_BYTE *)(v5 + 68) |= 2u;
    flags = (char)self->_flags;
  }
  if ((flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 60) = self->_downloadState;
    *(_BYTE *)(v5 + 68) |= 1u;
  }
  v12 = -[GEOPairedDeviceProgress copyWithZone:](self->_progress, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v12;

  v14 = -[GEOPairedDeviceSubscriptionStateUserInfo copyWithZone:](self->_userInfo, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v14;

  v16 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v16;
LABEL_10:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *identifier;
  GEOPairedDeviceProgress *progress;
  GEOPairedDeviceSubscriptionStateUserInfo *userInfo;
  char v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_18;
  -[GEOPairedDeviceSubscriptionStateUpdate readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  identifier = self->_identifier;
  if ((unint64_t)identifier | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](identifier, "isEqual:"))
      goto LABEL_18;
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 68) & 2) == 0 || self->_loadState != *((_DWORD *)v4 + 16))
      goto LABEL_18;
  }
  else if ((*((_BYTE *)v4 + 68) & 2) != 0)
  {
LABEL_18:
    v8 = 0;
    goto LABEL_19;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 68) & 1) == 0 || self->_downloadState != *((_DWORD *)v4 + 15))
      goto LABEL_18;
  }
  else if ((*((_BYTE *)v4 + 68) & 1) != 0)
  {
    goto LABEL_18;
  }
  progress = self->_progress;
  if ((unint64_t)progress | *((_QWORD *)v4 + 4) && !-[GEOPairedDeviceProgress isEqual:](progress, "isEqual:"))
    goto LABEL_18;
  userInfo = self->_userInfo;
  if ((unint64_t)userInfo | *((_QWORD *)v4 + 5))
    v8 = -[GEOPairedDeviceSubscriptionStateUserInfo isEqual:](userInfo, "isEqual:");
  else
    v8 = 1;
LABEL_19:

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;

  -[GEOPairedDeviceSubscriptionStateUpdate readAll:](self, "readAll:", 1);
  v3 = -[NSString hash](self->_identifier, "hash");
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    v4 = 2654435761 * self->_loadState;
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      goto LABEL_3;
LABEL_5:
    v5 = 0;
    goto LABEL_6;
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_flags & 1) == 0)
    goto LABEL_5;
LABEL_3:
  v5 = 2654435761 * self->_downloadState;
LABEL_6:
  v6 = v4 ^ v3 ^ v5 ^ -[GEOPairedDeviceProgress hash](self->_progress, "hash");
  return v6 ^ -[GEOPairedDeviceSubscriptionStateUserInfo hash](self->_userInfo, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  char v5;
  GEOPairedDeviceProgress *progress;
  uint64_t v7;
  GEOPairedDeviceSubscriptionStateUserInfo *userInfo;
  uint64_t v9;
  _QWORD *v10;

  v10 = a3;
  objc_msgSend(v10, "readAll:", 0);
  v4 = v10;
  if (v10[3])
  {
    -[GEOPairedDeviceSubscriptionStateUpdate setIdentifier:](self, "setIdentifier:");
    v4 = v10;
  }
  v5 = *((_BYTE *)v4 + 68);
  if ((v5 & 2) != 0)
  {
    self->_loadState = *((_DWORD *)v4 + 16);
    *(_BYTE *)&self->_flags |= 2u;
    v5 = *((_BYTE *)v4 + 68);
  }
  if ((v5 & 1) != 0)
  {
    self->_downloadState = *((_DWORD *)v4 + 15);
    *(_BYTE *)&self->_flags |= 1u;
  }
  progress = self->_progress;
  v7 = v4[4];
  if (progress)
  {
    if (!v7)
      goto LABEL_13;
    -[GEOPairedDeviceProgress mergeFrom:](progress, "mergeFrom:");
  }
  else
  {
    if (!v7)
      goto LABEL_13;
    -[GEOPairedDeviceSubscriptionStateUpdate setProgress:](self, "setProgress:");
  }
  v4 = v10;
LABEL_13:
  userInfo = self->_userInfo;
  v9 = v4[5];
  if (userInfo)
  {
    if (v9)
    {
      -[GEOPairedDeviceSubscriptionStateUserInfo mergeFrom:](userInfo, "mergeFrom:");
LABEL_18:
      v4 = v10;
    }
  }
  else if (v9)
  {
    -[GEOPairedDeviceSubscriptionStateUpdate setUserInfo:](self, "setUserInfo:");
    goto LABEL_18;
  }

}

- (PBUnknownFields)unknownFields
{
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v5;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_BYTE *)&self->_flags & 4) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      v5 = reader;
      objc_sync_enter(v5);
      GEOPairedDeviceSubscriptionStateUpdateReadSpecified((uint64_t)self, (unint64_t)self->_reader, unknownFields_tags_518);
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
  *(_BYTE *)&self->_flags |= 0x44u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEOPairedDeviceSubscriptionStateUpdate readAll:](self, "readAll:", 0);
    -[GEOPairedDeviceProgress clearUnknownFields:](self->_progress, "clearUnknownFields:", 1);
    -[GEOPairedDeviceSubscriptionStateUserInfo clearUnknownFields:](self->_userInfo, "clearUnknownFields:", 1);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
