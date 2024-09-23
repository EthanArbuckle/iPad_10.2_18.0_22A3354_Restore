@implementation GEORequestResponseMetadata

- (GEORequestResponseMetadata)init
{
  GEORequestResponseMetadata *v2;
  GEORequestResponseMetadata *v3;
  GEORequestResponseMetadata *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEORequestResponseMetadata;
  v2 = -[GEORequestResponseMetadata init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORequestResponseMetadata)initWithData:(id)a3
{
  GEORequestResponseMetadata *v3;
  GEORequestResponseMetadata *v4;
  GEORequestResponseMetadata *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEORequestResponseMetadata;
  v3 = -[GEORequestResponseMetadata initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readEventMetadata
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 72) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORequestResponseMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readEventMetadata_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasEventMetadata
{
  -[GEORequestResponseMetadata _readEventMetadata]((uint64_t)self);
  return self->_eventMetadata != 0;
}

- (GEOLogMsgEventServiceMetadata)eventMetadata
{
  -[GEORequestResponseMetadata _readEventMetadata]((uint64_t)self);
  return self->_eventMetadata;
}

- (void)setEventMetadata:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x48u;
  objc_storeStrong((id *)&self->_eventMetadata, a3);
}

- (void)_readStateUserSession
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 72) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORequestResponseMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readStateUserSession_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasStateUserSession
{
  -[GEORequestResponseMetadata _readStateUserSession]((uint64_t)self);
  return self->_stateUserSession != 0;
}

- (GEOLogMsgStateUserSession)stateUserSession
{
  -[GEORequestResponseMetadata _readStateUserSession]((uint64_t)self);
  return self->_stateUserSession;
}

- (void)setStateUserSession:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x60u;
  objc_storeStrong((id *)&self->_stateUserSession, a3);
}

- (unsigned)sessionBatchIdBits
{
  return self->_sessionBatchIdBits;
}

- (void)setSessionBatchIdBits:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 0x42u;
  self->_sessionBatchIdBits = a3;
}

- (void)setHasSessionBatchIdBits:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 66;
  else
    v3 = 64;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasSessionBatchIdBits
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (double)collectionTime
{
  return self->_collectionTime;
}

- (void)setCollectionTime:(double)a3
{
  *(_BYTE *)&self->_flags |= 0x41u;
  self->_collectionTime = a3;
}

- (void)setHasCollectionTime:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3 | 0x40;
}

- (BOOL)hasCollectionTime
{
  return *(_BYTE *)&self->_flags & 1;
}

- (void)_readStateOffline
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 72) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORequestResponseMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readStateOffline_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasStateOffline
{
  -[GEORequestResponseMetadata _readStateOffline]((uint64_t)self);
  return self->_stateOffline != 0;
}

- (GEOLogMsgStateOffline)stateOffline
{
  -[GEORequestResponseMetadata _readStateOffline]((uint64_t)self);
  return self->_stateOffline;
}

- (void)setStateOffline:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x50u;
  objc_storeStrong((id *)&self->_stateOffline, a3);
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
  v8.super_class = (Class)GEORequestResponseMetadata;
  -[GEORequestResponseMetadata description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORequestResponseMetadata dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORequestResponseMetadata _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  char v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  _QWORD v29[4];
  id v30;

  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)a1, "eventMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v5, "jsonRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = CFSTR("eventMetadata");
    }
    else
    {
      objc_msgSend(v5, "dictionaryRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = CFSTR("event_metadata");
    }
    objc_msgSend(v4, "setObject:forKey:", v7, v8);

  }
  objc_msgSend((id)a1, "stateUserSession");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v9, "jsonRepresentation");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = CFSTR("stateUserSession");
    }
    else
    {
      objc_msgSend(v9, "dictionaryRepresentation");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = CFSTR("state_user_session");
    }
    objc_msgSend(v4, "setObject:forKey:", v11, v12);

  }
  v13 = *(_BYTE *)(a1 + 72);
  if ((v13 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 68));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v15 = CFSTR("sessionBatchIdBits");
    else
      v15 = CFSTR("session_batch_id_bits");
    objc_msgSend(v4, "setObject:forKey:", v14, v15);

    v13 = *(_BYTE *)(a1 + 72);
  }
  if ((v13 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 24));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v17 = CFSTR("collectionTime");
    else
      v17 = CFSTR("collection_time");
    objc_msgSend(v4, "setObject:forKey:", v16, v17);

  }
  objc_msgSend((id)a1, "stateOffline");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v18)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v18, "jsonRepresentation");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = CFSTR("stateOffline");
    }
    else
    {
      objc_msgSend(v18, "dictionaryRepresentation");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = CFSTR("state_offline");
    }
    objc_msgSend(v4, "setObject:forKey:", v20, v21);

  }
  v22 = *(void **)(a1 + 16);
  if (v22)
  {
    objc_msgSend(v22, "dictionaryRepresentation");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v23, "count"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __56__GEORequestResponseMetadata__dictionaryRepresentation___block_invoke;
      v29[3] = &unk_1E1C00600;
      v26 = v25;
      v30 = v26;
      objc_msgSend(v24, "enumerateKeysAndObjectsUsingBlock:", v29);
      v27 = v26;

      v24 = v27;
    }
    objc_msgSend(v4, "setObject:forKey:", v24, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEORequestResponseMetadata _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __56__GEORequestResponseMetadata__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEORequestResponseMetadata)initWithDictionary:(id)a3
{
  return (GEORequestResponseMetadata *)-[GEORequestResponseMetadata _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  GEOLogMsgEventServiceMetadata *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  GEOLogMsgStateUserSession *v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  GEOLogMsgStateOffline *v22;
  uint64_t v23;
  void *v24;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("eventMetadata");
      else
        v6 = CFSTR("event_metadata");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = [GEOLogMsgEventServiceMetadata alloc];
        if ((a3 & 1) != 0)
          v9 = -[GEOLogMsgEventServiceMetadata initWithJSON:](v8, "initWithJSON:", v7);
        else
          v9 = -[GEOLogMsgEventServiceMetadata initWithDictionary:](v8, "initWithDictionary:", v7);
        v10 = (void *)v9;
        objc_msgSend(a1, "setEventMetadata:", v9);

      }
      if (a3)
        v11 = CFSTR("stateUserSession");
      else
        v11 = CFSTR("state_user_session");
      objc_msgSend(v5, "objectForKeyedSubscript:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v13 = [GEOLogMsgStateUserSession alloc];
        if ((a3 & 1) != 0)
          v14 = -[GEOLogMsgStateUserSession initWithJSON:](v13, "initWithJSON:", v12);
        else
          v14 = -[GEOLogMsgStateUserSession initWithDictionary:](v13, "initWithDictionary:", v12);
        v15 = (void *)v14;
        objc_msgSend(a1, "setStateUserSession:", v14);

      }
      if (a3)
        v16 = CFSTR("sessionBatchIdBits");
      else
        v16 = CFSTR("session_batch_id_bits");
      objc_msgSend(v5, "objectForKeyedSubscript:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setSessionBatchIdBits:", objc_msgSend(v17, "unsignedIntValue"));

      if (a3)
        v18 = CFSTR("collectionTime");
      else
        v18 = CFSTR("collection_time");
      objc_msgSend(v5, "objectForKeyedSubscript:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v19, "doubleValue");
        objc_msgSend(a1, "setCollectionTime:");
      }

      if (a3)
        v20 = CFSTR("stateOffline");
      else
        v20 = CFSTR("state_offline");
      objc_msgSend(v5, "objectForKeyedSubscript:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v22 = [GEOLogMsgStateOffline alloc];
        if ((a3 & 1) != 0)
          v23 = -[GEOLogMsgStateOffline initWithJSON:](v22, "initWithJSON:", v21);
        else
          v23 = -[GEOLogMsgStateOffline initWithDictionary:](v22, "initWithDictionary:", v21);
        v24 = (void *)v23;
        objc_msgSend(a1, "setStateOffline:", v23);

      }
    }
  }

  return a1;
}

- (GEORequestResponseMetadata)initWithJSON:(id)a3
{
  return (GEORequestResponseMetadata *)-[GEORequestResponseMetadata _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_2631;
    else
      v8 = (int *)&readAll__nonRecursiveTag_2632;
    GEORequestResponseMetadataReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
  {
    -[GEOLogMsgEventServiceMetadata readAll:](self->_eventMetadata, "readAll:", 1);
    -[GEOLogMsgStateUserSession readAll:](self->_stateUserSession, "readAll:", 1);
    -[GEOLogMsgStateOffline readAll:](self->_stateOffline, "readAll:", 1);
  }
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORequestResponseMetadataIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORequestResponseMetadataReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  id v5;
  char flags;
  PBDataReader *v7;
  void *v8;
  id v9;

  v9 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEORequestResponseMetadataIsDirty((uint64_t)self) & 1) == 0)
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
    -[GEORequestResponseMetadata readAll:](self, "readAll:", 0);
    if (self->_eventMetadata)
      PBDataWriterWriteSubmessage();
    v5 = v9;
    if (self->_stateUserSession)
    {
      PBDataWriterWriteSubmessage();
      v5 = v9;
    }
    flags = (char)self->_flags;
    if ((flags & 2) != 0)
    {
      PBDataWriterWriteUint32Field();
      v5 = v9;
      flags = (char)self->_flags;
    }
    if ((flags & 1) != 0)
    {
      PBDataWriterWriteDoubleField();
      v5 = v9;
    }
    if (self->_stateOffline)
    {
      PBDataWriterWriteSubmessage();
      v5 = v9;
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v5);
  }

}

- (void)copyTo:(id)a3
{
  char flags;
  id *v5;
  id *v6;

  v6 = (id *)a3;
  -[GEORequestResponseMetadata readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v6 + 1, self->_reader);
  *((_DWORD *)v6 + 14) = self->_readerMarkPos;
  *((_DWORD *)v6 + 15) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_eventMetadata)
    objc_msgSend(v6, "setEventMetadata:");
  if (self->_stateUserSession)
    objc_msgSend(v6, "setStateUserSession:");
  flags = (char)self->_flags;
  v5 = v6;
  if ((flags & 2) != 0)
  {
    *((_DWORD *)v6 + 17) = self->_sessionBatchIdBits;
    *((_BYTE *)v6 + 72) |= 2u;
    flags = (char)self->_flags;
  }
  if ((flags & 1) != 0)
  {
    v6[3] = *(id *)&self->_collectionTime;
    *((_BYTE *)v6 + 72) |= 1u;
  }
  if (self->_stateOffline)
  {
    objc_msgSend(v6, "setStateOffline:");
    v5 = v6;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  char flags;
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
      GEORequestResponseMetadataReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_10;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEORequestResponseMetadata readAll:](self, "readAll:", 0);
  v9 = -[GEOLogMsgEventServiceMetadata copyWithZone:](self->_eventMetadata, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v9;

  v11 = -[GEOLogMsgStateUserSession copyWithZone:](self->_stateUserSession, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v11;

  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 68) = self->_sessionBatchIdBits;
    *(_BYTE *)(v5 + 72) |= 2u;
    flags = (char)self->_flags;
  }
  if ((flags & 1) != 0)
  {
    *(double *)(v5 + 24) = self->_collectionTime;
    *(_BYTE *)(v5 + 72) |= 1u;
  }
  v14 = -[GEOLogMsgStateOffline copyWithZone:](self->_stateOffline, "copyWithZone:", a3);
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
  GEOLogMsgEventServiceMetadata *eventMetadata;
  GEOLogMsgStateUserSession *stateUserSession;
  GEOLogMsgStateOffline *stateOffline;
  char v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_18;
  -[GEORequestResponseMetadata readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  eventMetadata = self->_eventMetadata;
  if ((unint64_t)eventMetadata | *((_QWORD *)v4 + 4))
  {
    if (!-[GEOLogMsgEventServiceMetadata isEqual:](eventMetadata, "isEqual:"))
      goto LABEL_18;
  }
  stateUserSession = self->_stateUserSession;
  if ((unint64_t)stateUserSession | *((_QWORD *)v4 + 6))
  {
    if (!-[GEOLogMsgStateUserSession isEqual:](stateUserSession, "isEqual:"))
      goto LABEL_18;
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 72) & 2) == 0 || self->_sessionBatchIdBits != *((_DWORD *)v4 + 17))
      goto LABEL_18;
  }
  else if ((*((_BYTE *)v4 + 72) & 2) != 0)
  {
LABEL_18:
    v8 = 0;
    goto LABEL_19;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 72) & 1) == 0 || self->_collectionTime != *((double *)v4 + 3))
      goto LABEL_18;
  }
  else if ((*((_BYTE *)v4 + 72) & 1) != 0)
  {
    goto LABEL_18;
  }
  stateOffline = self->_stateOffline;
  if ((unint64_t)stateOffline | *((_QWORD *)v4 + 5))
    v8 = -[GEOLogMsgStateOffline isEqual:](stateOffline, "isEqual:");
  else
    v8 = 1;
LABEL_19:

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  double collectionTime;
  double v7;
  long double v8;
  double v9;
  unint64_t v10;

  -[GEORequestResponseMetadata readAll:](self, "readAll:", 1);
  v3 = -[GEOLogMsgEventServiceMetadata hash](self->_eventMetadata, "hash");
  v4 = -[GEOLogMsgStateUserSession hash](self->_stateUserSession, "hash");
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    v5 = 2654435761 * self->_sessionBatchIdBits;
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      goto LABEL_3;
LABEL_8:
    v10 = 0;
    return v4 ^ v3 ^ v5 ^ v10 ^ -[GEOLogMsgStateOffline hash](self->_stateOffline, "hash");
  }
  v5 = 0;
  if ((*(_BYTE *)&self->_flags & 1) == 0)
    goto LABEL_8;
LABEL_3:
  collectionTime = self->_collectionTime;
  v7 = -collectionTime;
  if (collectionTime >= 0.0)
    v7 = self->_collectionTime;
  v8 = floor(v7 + 0.5);
  v9 = (v7 - v8) * 1.84467441e19;
  v10 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
  if (v9 >= 0.0)
  {
    if (v9 > 0.0)
      v10 += (unint64_t)v9;
  }
  else
  {
    v10 -= (unint64_t)fabs(v9);
  }
  return v4 ^ v3 ^ v5 ^ v10 ^ -[GEOLogMsgStateOffline hash](self->_stateOffline, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  GEOLogMsgEventServiceMetadata *eventMetadata;
  uint64_t v6;
  GEOLogMsgStateUserSession *stateUserSession;
  uint64_t v8;
  char v9;
  GEOLogMsgStateOffline *stateOffline;
  uint64_t v11;
  _QWORD *v12;

  v12 = a3;
  objc_msgSend(v12, "readAll:", 0);
  v4 = v12;
  eventMetadata = self->_eventMetadata;
  v6 = v12[4];
  if (eventMetadata)
  {
    if (!v6)
      goto LABEL_7;
    -[GEOLogMsgEventServiceMetadata mergeFrom:](eventMetadata, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[GEORequestResponseMetadata setEventMetadata:](self, "setEventMetadata:");
  }
  v4 = v12;
LABEL_7:
  stateUserSession = self->_stateUserSession;
  v8 = v4[6];
  if (stateUserSession)
  {
    if (!v8)
      goto LABEL_13;
    -[GEOLogMsgStateUserSession mergeFrom:](stateUserSession, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_13;
    -[GEORequestResponseMetadata setStateUserSession:](self, "setStateUserSession:");
  }
  v4 = v12;
LABEL_13:
  v9 = *((_BYTE *)v4 + 72);
  if ((v9 & 2) != 0)
  {
    self->_sessionBatchIdBits = *((_DWORD *)v4 + 17);
    *(_BYTE *)&self->_flags |= 2u;
    v9 = *((_BYTE *)v4 + 72);
  }
  if ((v9 & 1) != 0)
  {
    self->_collectionTime = (double)v4[3];
    *(_BYTE *)&self->_flags |= 1u;
  }
  stateOffline = self->_stateOffline;
  v11 = v4[5];
  if (stateOffline)
  {
    if (v11)
    {
      -[GEOLogMsgStateOffline mergeFrom:](stateOffline, "mergeFrom:");
LABEL_22:
      v4 = v12;
    }
  }
  else if (v11)
  {
    -[GEORequestResponseMetadata setStateOffline:](self, "setStateOffline:");
    goto LABEL_22;
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
      GEORequestResponseMetadataReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_2635);
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
    -[GEORequestResponseMetadata readAll:](self, "readAll:", 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateUserSession, 0);
  objc_storeStrong((id *)&self->_stateOffline, 0);
  objc_storeStrong((id *)&self->_eventMetadata, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
