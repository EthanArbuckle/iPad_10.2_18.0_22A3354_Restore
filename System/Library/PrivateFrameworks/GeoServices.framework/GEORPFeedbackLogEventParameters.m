@implementation GEORPFeedbackLogEventParameters

- (GEORPFeedbackLogEventParameters)init
{
  GEORPFeedbackLogEventParameters *v2;
  GEORPFeedbackLogEventParameters *v3;
  GEORPFeedbackLogEventParameters *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEORPFeedbackLogEventParameters;
  v2 = -[GEORPFeedbackLogEventParameters init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPFeedbackLogEventParameters)initWithData:(id)a3
{
  GEORPFeedbackLogEventParameters *v3;
  GEORPFeedbackLogEventParameters *v4;
  GEORPFeedbackLogEventParameters *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEORPFeedbackLogEventParameters;
  v3 = -[GEORPFeedbackLogEventParameters initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readClientEventUuid
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
        GEORPFeedbackLogEventParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readClientEventUuid_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasClientEventUuid
{
  -[GEORPFeedbackLogEventParameters _readClientEventUuid]((uint64_t)self);
  return self->_clientEventUuid != 0;
}

- (NSString)clientEventUuid
{
  -[GEORPFeedbackLogEventParameters _readClientEventUuid]((uint64_t)self);
  return self->_clientEventUuid;
}

- (void)setClientEventUuid:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x24u;
  objc_storeStrong((id *)&self->_clientEventUuid, a3);
}

- (void)_readCreatedAt
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
        GEORPFeedbackLogEventParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCreatedAt_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasCreatedAt
{
  -[GEORPFeedbackLogEventParameters _readCreatedAt]((uint64_t)self);
  return self->_createdAt != 0;
}

- (GEORPTimestamp)createdAt
{
  -[GEORPFeedbackLogEventParameters _readCreatedAt]((uint64_t)self);
  return self->_createdAt;
}

- (void)setCreatedAt:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x28u;
  objc_storeStrong((id *)&self->_createdAt, a3);
}

- (int)type
{
  os_unfair_lock_s *p_readerLock;
  char flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 1) != 0)
    return self->_type;
  else
    return 0;
}

- (void)setType:(int)a3
{
  *(_BYTE *)&self->_flags |= 0x21u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3 | 0x20;
}

- (BOOL)hasType
{
  return *(_BYTE *)&self->_flags & 1;
}

- (id)typeAsString:(int)a3
{
  __CFString *v3;

  if (!a3)
    return CFSTR("FEEDBACK_LOG_EVENT_TYPE_UNKNOWN");
  if (a3 == 1)
  {
    v3 = CFSTR("FEEDBACK_LOG_EVENT_TYPE_RAP_NOTIFICATION");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_LOG_EVENT_TYPE_UNKNOWN")) & 1) != 0)
    v4 = 0;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_LOG_EVENT_TYPE_RAP_NOTIFICATION"));

  return v4;
}

- (void)_readDetails
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
        GEORPFeedbackLogEventParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDetails_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasDetails
{
  -[GEORPFeedbackLogEventParameters _readDetails]((uint64_t)self);
  return self->_details != 0;
}

- (GEORPFeedbackLogEventDetails)details
{
  -[GEORPFeedbackLogEventParameters _readDetails]((uint64_t)self);
  return self->_details;
}

- (void)setDetails:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x30u;
  objc_storeStrong((id *)&self->_details, a3);
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
  v8.super_class = (Class)GEORPFeedbackLogEventParameters;
  -[GEORPFeedbackLogEventParameters description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORPFeedbackLogEventParameters dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPFeedbackLogEventParameters _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  int v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  _QWORD v23[4];
  id v24;

  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)a1, "clientEventUuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (a2)
      v6 = CFSTR("clientEventUuid");
    else
      v6 = CFSTR("client_event_uuid");
    objc_msgSend(v4, "setObject:forKey:", v5, v6);
  }

  objc_msgSend((id)a1, "createdAt");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v7, "jsonRepresentation");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = CFSTR("createdAt");
    }
    else
    {
      objc_msgSend(v7, "dictionaryRepresentation");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = CFSTR("created_at");
    }
    objc_msgSend(v4, "setObject:forKey:", v9, v10);

  }
  if ((*(_BYTE *)(a1 + 64) & 1) != 0)
  {
    v11 = *(_DWORD *)(a1 + 60);
    if (v11)
    {
      if (v11 == 1)
      {
        v12 = CFSTR("FEEDBACK_LOG_EVENT_TYPE_RAP_NOTIFICATION");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 60));
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v12 = CFSTR("FEEDBACK_LOG_EVENT_TYPE_UNKNOWN");
    }
    objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("type"));

  }
  objc_msgSend((id)a1, "details");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v13, "jsonRepresentation");
    else
      objc_msgSend(v13, "dictionaryRepresentation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("details"));

  }
  v16 = *(void **)(a1 + 16);
  if (v16)
  {
    objc_msgSend(v16, "dictionaryRepresentation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v17, "count"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __61__GEORPFeedbackLogEventParameters__dictionaryRepresentation___block_invoke;
      v23[3] = &unk_1E1C00600;
      v20 = v19;
      v24 = v20;
      objc_msgSend(v18, "enumerateKeysAndObjectsUsingBlock:", v23);
      v21 = v20;

      v18 = v21;
    }
    objc_msgSend(v4, "setObject:forKey:", v18, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEORPFeedbackLogEventParameters _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __61__GEORPFeedbackLogEventParameters__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEORPFeedbackLogEventParameters)initWithDictionary:(id)a3
{
  return (GEORPFeedbackLogEventParameters *)-[GEORPFeedbackLogEventParameters _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  GEORPTimestamp *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  GEORPFeedbackLogEventDetails *v18;
  uint64_t v19;
  void *v20;

  v5 = a2;
  if (!a1)
    goto LABEL_30;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_30;
  if (a3)
    v6 = CFSTR("clientEventUuid");
  else
    v6 = CFSTR("client_event_uuid");
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(a1, "setClientEventUuid:", v8);

  }
  if (a3)
    v9 = CFSTR("createdAt");
  else
    v9 = CFSTR("created_at");
  objc_msgSend(v5, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = [GEORPTimestamp alloc];
    if ((a3 & 1) != 0)
      v12 = -[GEORPTimestamp initWithJSON:](v11, "initWithJSON:", v10);
    else
      v12 = -[GEORPTimestamp initWithDictionary:](v11, "initWithDictionary:", v10);
    v13 = (void *)v12;
    objc_msgSend(a1, "setCreatedAt:", v12);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("type"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v15 = v14;
    if ((objc_msgSend(v15, "isEqualToString:", CFSTR("FEEDBACK_LOG_EVENT_TYPE_UNKNOWN")) & 1) != 0)
      v16 = 0;
    else
      v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("FEEDBACK_LOG_EVENT_TYPE_RAP_NOTIFICATION"));

    goto LABEL_23;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v16 = objc_msgSend(v14, "intValue");
LABEL_23:
    objc_msgSend(a1, "setType:", v16);
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("details"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v18 = [GEORPFeedbackLogEventDetails alloc];
    if ((a3 & 1) != 0)
      v19 = -[GEORPFeedbackLogEventDetails initWithJSON:](v18, "initWithJSON:", v17);
    else
      v19 = -[GEORPFeedbackLogEventDetails initWithDictionary:](v18, "initWithDictionary:", v17);
    v20 = (void *)v19;
    objc_msgSend(a1, "setDetails:", v19);

  }
LABEL_30:

  return a1;
}

- (GEORPFeedbackLogEventParameters)initWithJSON:(id)a3
{
  return (GEORPFeedbackLogEventParameters *)-[GEORPFeedbackLogEventParameters _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_1453;
    else
      v8 = (int *)&readAll__nonRecursiveTag_1454;
    GEORPFeedbackLogEventParametersReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
  {
    -[GEORPTimestamp readAll:](self->_createdAt, "readAll:", 1);
    -[GEORPFeedbackLogEventDetails readAll:](self->_details, "readAll:", 1);
  }
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPFeedbackLogEventParametersIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPFeedbackLogEventParametersReadAllFrom((uint64_t)self, a3, 0);
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
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_BYTE *)&self->_flags & 0x3C) == 0))
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
    -[GEORPFeedbackLogEventParameters readAll:](self, "readAll:", 0);
    if (self->_clientEventUuid)
      PBDataWriterWriteStringField();
    v5 = v8;
    if (self->_createdAt)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if ((*(_BYTE *)&self->_flags & 1) != 0)
    {
      PBDataWriterWriteInt32Field();
      v5 = v8;
    }
    if (self->_details)
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
  -[GEORPFeedbackLogEventParameters readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 12) = self->_readerMarkPos;
  *((_DWORD *)v5 + 13) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_clientEventUuid)
    objc_msgSend(v5, "setClientEventUuid:");
  if (self->_createdAt)
    objc_msgSend(v5, "setCreatedAt:");
  v4 = v5;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *((_DWORD *)v5 + 15) = self->_type;
    *((_BYTE *)v5 + 64) |= 1u;
  }
  if (self->_details)
  {
    objc_msgSend(v5, "setDetails:");
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
  id v13;
  void *v14;
  PBUnknownFields *v15;

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
      GEORPFeedbackLogEventParametersReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_8;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEORPFeedbackLogEventParameters readAll:](self, "readAll:", 0);
  v9 = -[NSString copyWithZone:](self->_clientEventUuid, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v9;

  v11 = -[GEORPTimestamp copyWithZone:](self->_createdAt, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v11;

  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 60) = self->_type;
    *(_BYTE *)(v5 + 64) |= 1u;
  }
  v13 = -[GEORPFeedbackLogEventDetails copyWithZone:](self->_details, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v13;

  v15 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v15;
LABEL_8:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *clientEventUuid;
  GEORPTimestamp *createdAt;
  GEORPFeedbackLogEventDetails *details;
  char v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_13;
  -[GEORPFeedbackLogEventParameters readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  clientEventUuid = self->_clientEventUuid;
  if ((unint64_t)clientEventUuid | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](clientEventUuid, "isEqual:"))
      goto LABEL_13;
  }
  createdAt = self->_createdAt;
  if ((unint64_t)createdAt | *((_QWORD *)v4 + 4))
  {
    if (!-[GEORPTimestamp isEqual:](createdAt, "isEqual:"))
      goto LABEL_13;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 1) == 0 || self->_type != *((_DWORD *)v4 + 15))
      goto LABEL_13;
  }
  else if ((*((_BYTE *)v4 + 64) & 1) != 0)
  {
LABEL_13:
    v8 = 0;
    goto LABEL_14;
  }
  details = self->_details;
  if ((unint64_t)details | *((_QWORD *)v4 + 5))
    v8 = -[GEORPFeedbackLogEventDetails isEqual:](details, "isEqual:");
  else
    v8 = 1;
LABEL_14:

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;
  uint64_t v5;

  -[GEORPFeedbackLogEventParameters readAll:](self, "readAll:", 1);
  v3 = -[NSString hash](self->_clientEventUuid, "hash");
  v4 = -[GEORPTimestamp hash](self->_createdAt, "hash");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v5 = 2654435761 * self->_type;
  else
    v5 = 0;
  return v4 ^ v3 ^ v5 ^ -[GEORPFeedbackLogEventDetails hash](self->_details, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  GEORPTimestamp *createdAt;
  uint64_t v6;
  GEORPFeedbackLogEventDetails *details;
  uint64_t v8;
  _QWORD *v9;

  v9 = a3;
  objc_msgSend(v9, "readAll:", 0);
  v4 = v9;
  if (v9[3])
  {
    -[GEORPFeedbackLogEventParameters setClientEventUuid:](self, "setClientEventUuid:");
    v4 = v9;
  }
  createdAt = self->_createdAt;
  v6 = v4[4];
  if (createdAt)
  {
    if (!v6)
      goto LABEL_9;
    -[GEORPTimestamp mergeFrom:](createdAt, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_9;
    -[GEORPFeedbackLogEventParameters setCreatedAt:](self, "setCreatedAt:");
  }
  v4 = v9;
LABEL_9:
  if ((v4[8] & 1) != 0)
  {
    self->_type = *((_DWORD *)v4 + 15);
    *(_BYTE *)&self->_flags |= 1u;
  }
  details = self->_details;
  v8 = v4[5];
  if (details)
  {
    if (v8)
    {
      -[GEORPFeedbackLogEventDetails mergeFrom:](details, "mergeFrom:");
LABEL_16:
      v4 = v9;
    }
  }
  else if (v8)
  {
    -[GEORPFeedbackLogEventParameters setDetails:](self, "setDetails:");
    goto LABEL_16;
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
      GEORPFeedbackLogEventParametersReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_1457);
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
  *(_BYTE *)&self->_flags |= 0x22u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEORPFeedbackLogEventParameters readAll:](self, "readAll:", 0);
    -[GEORPFeedbackLogEventDetails clearUnknownFields:](self->_details, "clearUnknownFields:", 1);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_details, 0);
  objc_storeStrong((id *)&self->_createdAt, 0);
  objc_storeStrong((id *)&self->_clientEventUuid, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
