@implementation GEOLogMsgEventMapLaunch

- (GEOLogMsgEventMapLaunch)init
{
  GEOLogMsgEventMapLaunch *v2;
  GEOLogMsgEventMapLaunch *v3;
  GEOLogMsgEventMapLaunch *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOLogMsgEventMapLaunch;
  v2 = -[GEOLogMsgEventMapLaunch init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOLogMsgEventMapLaunch)initWithData:(id)a3
{
  GEOLogMsgEventMapLaunch *v3;
  GEOLogMsgEventMapLaunch *v4;
  GEOLogMsgEventMapLaunch *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOLogMsgEventMapLaunch;
  v3 = -[GEOLogMsgEventMapLaunch initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readSourceAppId
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(_BYTE *)(a1 + 52) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventMapLaunchReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSourceAppId_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasSourceAppId
{
  -[GEOLogMsgEventMapLaunch _readSourceAppId]((uint64_t)self);
  return self->_sourceAppId != 0;
}

- (NSString)sourceAppId
{
  -[GEOLogMsgEventMapLaunch _readSourceAppId]((uint64_t)self);
  return self->_sourceAppId;
}

- (void)setSourceAppId:(id)a3
{
  *(_BYTE *)&self->_flags |= 0xAu;
  objc_storeStrong((id *)&self->_sourceAppId, a3);
}

- (void)_readLaunchUri
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(_BYTE *)(a1 + 52) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventMapLaunchReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLaunchUri_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasLaunchUri
{
  -[GEOLogMsgEventMapLaunch _readLaunchUri]((uint64_t)self);
  return self->_launchUri != 0;
}

- (NSString)launchUri
{
  -[GEOLogMsgEventMapLaunch _readLaunchUri]((uint64_t)self);
  return self->_launchUri;
}

- (void)setLaunchUri:(id)a3
{
  *(_BYTE *)&self->_flags |= 9u;
  objc_storeStrong((id *)&self->_launchUri, a3);
}

- (void)_readTimeToLeave
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(_BYTE *)(a1 + 52) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventMapLaunchReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTimeToLeave_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasTimeToLeave
{
  -[GEOLogMsgEventMapLaunch _readTimeToLeave]((uint64_t)self);
  return self->_timeToLeave != 0;
}

- (GEOTimeToLeaveMapLaunch)timeToLeave
{
  -[GEOLogMsgEventMapLaunch _readTimeToLeave]((uint64_t)self);
  return self->_timeToLeave;
}

- (void)setTimeToLeave:(id)a3
{
  *(_BYTE *)&self->_flags |= 0xCu;
  objc_storeStrong((id *)&self->_timeToLeave, a3);
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
  v8.super_class = (Class)GEOLogMsgEventMapLaunch;
  -[GEOLogMsgEventMapLaunch description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOLogMsgEventMapLaunch dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgEventMapLaunch _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(void *)a1
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

  if (a1)
  {
    objc_msgSend(a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "sourceAppId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      if (a2)
        v6 = CFSTR("sourceAppId");
      else
        v6 = CFSTR("source_app_id");
      objc_msgSend(v4, "setObject:forKey:", v5, v6);
    }

    objc_msgSend(a1, "launchUri");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      if (a2)
        v8 = CFSTR("launchUri");
      else
        v8 = CFSTR("launch_uri");
      objc_msgSend(v4, "setObject:forKey:", v7, v8);
    }

    objc_msgSend(a1, "timeToLeave");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v9, "jsonRepresentation");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = CFSTR("timeToLeave");
      }
      else
      {
        objc_msgSend(v9, "dictionaryRepresentation");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = CFSTR("time_to_leave");
      }
      objc_msgSend(v4, "setObject:forKey:", v11, v12);

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
  return -[GEOLogMsgEventMapLaunch _dictionaryRepresentation:](self, 1);
}

- (GEOLogMsgEventMapLaunch)initWithDictionary:(id)a3
{
  return (GEOLogMsgEventMapLaunch *)-[GEOLogMsgEventMapLaunch _initWithDictionary:isJSON:](self, a3, 0);
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
  GEOTimeToLeaveMapLaunch *v14;
  uint64_t v15;
  void *v16;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("sourceAppId");
      else
        v6 = CFSTR("source_app_id");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = (void *)objc_msgSend(v7, "copy");
        objc_msgSend(a1, "setSourceAppId:", v8);

      }
      if (a3)
        v9 = CFSTR("launchUri");
      else
        v9 = CFSTR("launch_uri");
      objc_msgSend(v5, "objectForKeyedSubscript:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = (void *)objc_msgSend(v10, "copy");
        objc_msgSend(a1, "setLaunchUri:", v11);

      }
      if (a3)
        v12 = CFSTR("timeToLeave");
      else
        v12 = CFSTR("time_to_leave");
      objc_msgSend(v5, "objectForKeyedSubscript:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v14 = [GEOTimeToLeaveMapLaunch alloc];
        if ((a3 & 1) != 0)
          v15 = -[GEOTimeToLeaveMapLaunch initWithJSON:](v14, "initWithJSON:", v13);
        else
          v15 = -[GEOTimeToLeaveMapLaunch initWithDictionary:](v14, "initWithDictionary:", v13);
        v16 = (void *)v15;
        objc_msgSend(a1, "setTimeToLeave:", v15);

      }
    }
  }

  return a1;
}

- (GEOLogMsgEventMapLaunch)initWithJSON:(id)a3
{
  return (GEOLogMsgEventMapLaunch *)-[GEOLogMsgEventMapLaunch _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_2864;
    else
      v8 = (int *)&readAll__nonRecursiveTag_2865;
    GEOLogMsgEventMapLaunchReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    -[GEOTimeToLeaveMapLaunch readAll:](self->_timeToLeave, "readAll:", 1);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgEventMapLaunchIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgEventMapLaunchReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  PBDataReader *v5;
  void *v6;
  id v7;

  v7 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_BYTE *)&self->_flags & 0xF) == 0))
  {
    v5 = self->_reader;
    objc_sync_enter(v5);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "writeData:", v6);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v5);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOLogMsgEventMapLaunch readAll:](self, "readAll:", 0);
    if (self->_sourceAppId)
      PBDataWriterWriteStringField();
    if (self->_launchUri)
      PBDataWriterWriteStringField();
    if (self->_timeToLeave)
      PBDataWriterWriteSubmessage();
  }

}

- (void)copyTo:(id)a3
{
  id *v4;
  id *v5;

  v5 = (id *)a3;
  -[GEOLogMsgEventMapLaunch readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 10) = self->_readerMarkPos;
  *((_DWORD *)v5 + 11) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_sourceAppId)
    objc_msgSend(v5, "setSourceAppId:");
  if (self->_launchUri)
    objc_msgSend(v5, "setLaunchUri:");
  v4 = v5;
  if (self->_timeToLeave)
  {
    objc_msgSend(v5, "setTimeToLeave:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  PBDataReader *reader;
  PBDataReader *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
    goto LABEL_5;
  v7 = reader;
  objc_sync_enter(v7);
  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
    objc_sync_exit(v7);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOLogMsgEventMapLaunch readAll:](self, "readAll:", 0);
    v8 = -[NSString copyWithZone:](self->_sourceAppId, "copyWithZone:", a3);
    v9 = (void *)v5[3];
    v5[3] = v8;

    v10 = -[NSString copyWithZone:](self->_launchUri, "copyWithZone:", a3);
    v11 = (void *)v5[2];
    v5[2] = v10;

    v12 = -[GEOTimeToLeaveMapLaunch copyWithZone:](self->_timeToLeave, "copyWithZone:", a3);
    v7 = (PBDataReader *)v5[4];
    v5[4] = v12;
    goto LABEL_6;
  }
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  GEOLogMsgEventMapLaunchReadAllFrom((uint64_t)v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);
LABEL_6:

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *sourceAppId;
  NSString *launchUri;
  GEOTimeToLeaveMapLaunch *timeToLeave;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((-[GEOLogMsgEventMapLaunch readAll:](self, "readAll:", 1),
         objc_msgSend(v4, "readAll:", 1),
         sourceAppId = self->_sourceAppId,
         !((unint64_t)sourceAppId | v4[3]))
     || -[NSString isEqual:](sourceAppId, "isEqual:"))
    && ((launchUri = self->_launchUri, !((unint64_t)launchUri | v4[2]))
     || -[NSString isEqual:](launchUri, "isEqual:")))
  {
    timeToLeave = self->_timeToLeave;
    if ((unint64_t)timeToLeave | v4[4])
      v8 = -[GEOTimeToLeaveMapLaunch isEqual:](timeToLeave, "isEqual:");
    else
      v8 = 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;

  -[GEOLogMsgEventMapLaunch readAll:](self, "readAll:", 1);
  v3 = -[NSString hash](self->_sourceAppId, "hash");
  v4 = -[NSString hash](self->_launchUri, "hash") ^ v3;
  return v4 ^ -[GEOTimeToLeaveMapLaunch hash](self->_timeToLeave, "hash");
}

- (void)mergeFrom:(id)a3
{
  GEOTimeToLeaveMapLaunch *timeToLeave;
  uint64_t v5;
  _QWORD *v6;

  v6 = a3;
  objc_msgSend(v6, "readAll:", 0);
  if (v6[3])
    -[GEOLogMsgEventMapLaunch setSourceAppId:](self, "setSourceAppId:");
  if (v6[2])
    -[GEOLogMsgEventMapLaunch setLaunchUri:](self, "setLaunchUri:");
  timeToLeave = self->_timeToLeave;
  v5 = v6[4];
  if (timeToLeave)
  {
    if (v5)
      -[GEOTimeToLeaveMapLaunch mergeFrom:](timeToLeave, "mergeFrom:");
  }
  else if (v5)
  {
    -[GEOLogMsgEventMapLaunch setTimeToLeave:](self, "setTimeToLeave:");
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeToLeave, 0);
  objc_storeStrong((id *)&self->_sourceAppId, 0);
  objc_storeStrong((id *)&self->_launchUri, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
