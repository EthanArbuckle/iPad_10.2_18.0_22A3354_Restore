@implementation GEOPairedDeviceReply

- (GEOPairedDeviceReply)init
{
  GEOPairedDeviceReply *v2;
  GEOPairedDeviceReply *v3;
  GEOPairedDeviceReply *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPairedDeviceReply;
  v2 = -[GEOPairedDeviceReply init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPairedDeviceReply)initWithData:(id)a3
{
  GEOPairedDeviceReply *v3;
  GEOPairedDeviceReply *v4;
  GEOPairedDeviceReply *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPairedDeviceReply;
  v3 = -[GEOPairedDeviceReply initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)resetPayload
{
  GEOPairedDevicePingReply *ping;
  GEOPairedDeviceGetStorageInfoReply *getStorageInfo;
  GEOPairedDeviceConfigureSubscriptionShouldSyncReply *configureSubscriptionShouldSync;

  ping = self->_ping;
  self->_ping = 0;

  getStorageInfo = self->_getStorageInfo;
  self->_getStorageInfo = 0;

  configureSubscriptionShouldSync = self->_configureSubscriptionShouldSync;
  self->_configureSubscriptionShouldSync = 0;

  self->_whichPayload = 0;
}

- (GEOPairedDevicePingReply)ping
{
  PBDataReader *reader;
  PBDataReader *v4;
  GEOPairedDevicePingReply *v5;

  if (self)
  {
    os_unfair_lock_lock(&self->_readerLock);
    if ((*(_BYTE *)&self->_flags & 8) == 0)
    {
      reader = self->_reader;
      if (reader)
      {
        v4 = reader;
        objc_sync_enter(v4);
        GEOPairedDeviceReplyReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&_readPing_tags_336);
        objc_sync_exit(v4);

      }
    }
    os_unfair_lock_unlock(&self->_readerLock);
  }
  if (self->_whichPayload == 1)
    v5 = self->_ping;
  else
    v5 = 0;
  return v5;
}

- (void)setPing:(id)a3
{
  GEOPairedDevicePingReply *v4;
  GEOPairedDevicePingReply *ping;

  v4 = (GEOPairedDevicePingReply *)a3;
  *(_BYTE *)&self->_flags |= 0x18u;
  -[GEOPairedDeviceReply resetPayload](self, "resetPayload");
  ping = self->_ping;
  self->_ping = v4;

  if (v4)
    self->_whichPayload = 1;
}

- (GEOPairedDeviceGetStorageInfoReply)getStorageInfo
{
  PBDataReader *reader;
  PBDataReader *v4;
  GEOPairedDeviceGetStorageInfoReply *v5;

  if (self)
  {
    os_unfair_lock_lock(&self->_readerLock);
    if ((*(_BYTE *)&self->_flags & 4) == 0)
    {
      reader = self->_reader;
      if (reader)
      {
        v4 = reader;
        objc_sync_enter(v4);
        GEOPairedDeviceReplyReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&_readGetStorageInfo_tags_337);
        objc_sync_exit(v4);

      }
    }
    os_unfair_lock_unlock(&self->_readerLock);
  }
  if (self->_whichPayload == 2)
    v5 = self->_getStorageInfo;
  else
    v5 = 0;
  return v5;
}

- (void)setGetStorageInfo:(id)a3
{
  GEOPairedDeviceGetStorageInfoReply *v4;
  GEOPairedDeviceGetStorageInfoReply *getStorageInfo;

  v4 = (GEOPairedDeviceGetStorageInfoReply *)a3;
  *(_BYTE *)&self->_flags |= 0x14u;
  -[GEOPairedDeviceReply resetPayload](self, "resetPayload");
  getStorageInfo = self->_getStorageInfo;
  self->_getStorageInfo = v4;

  if (v4)
    self->_whichPayload = 2;
}

- (GEOPairedDeviceConfigureSubscriptionShouldSyncReply)configureSubscriptionShouldSync
{
  PBDataReader *reader;
  PBDataReader *v4;
  GEOPairedDeviceConfigureSubscriptionShouldSyncReply *v5;

  if (self)
  {
    os_unfair_lock_lock(&self->_readerLock);
    if ((*(_BYTE *)&self->_flags & 2) == 0)
    {
      reader = self->_reader;
      if (reader)
      {
        v4 = reader;
        objc_sync_enter(v4);
        GEOPairedDeviceReplyReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&_readConfigureSubscriptionShouldSync_tags_338);
        objc_sync_exit(v4);

      }
    }
    os_unfair_lock_unlock(&self->_readerLock);
  }
  if (self->_whichPayload == 3)
    v5 = self->_configureSubscriptionShouldSync;
  else
    v5 = 0;
  return v5;
}

- (void)setConfigureSubscriptionShouldSync:(id)a3
{
  GEOPairedDeviceConfigureSubscriptionShouldSyncReply *v4;
  GEOPairedDeviceConfigureSubscriptionShouldSyncReply *configureSubscriptionShouldSync;

  v4 = (GEOPairedDeviceConfigureSubscriptionShouldSyncReply *)a3;
  *(_BYTE *)&self->_flags |= 0x12u;
  -[GEOPairedDeviceReply resetPayload](self, "resetPayload");
  configureSubscriptionShouldSync = self->_configureSubscriptionShouldSync;
  self->_configureSubscriptionShouldSync = v4;

  if (v4)
    self->_whichPayload = 3;
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
  v8.super_class = (Class)GEOPairedDeviceReply;
  -[GEOPairedDeviceReply description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPairedDeviceReply dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPairedDeviceReply _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(_QWORD *)a1
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v19[4];
  id v20;

  if (!a1)
    return 0;
  objc_msgSend(a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = a1[8];
  switch(v5)
  {
    case 3:
      objc_msgSend(a1, "configureSubscriptionShouldSync");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v11;
      if (!v11)
        goto LABEL_19;
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v11, "jsonRepresentation");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = CFSTR("configureSubscriptionShouldSync");
      }
      else
      {
        objc_msgSend(v11, "dictionaryRepresentation");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = CFSTR("configure_subscription_should_sync");
      }
      goto LABEL_18;
    case 2:
      objc_msgSend(a1, "getStorageInfo");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v8;
      if (!v8)
        goto LABEL_19;
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v8, "jsonRepresentation");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = CFSTR("getStorageInfo");
      }
      else
      {
        objc_msgSend(v8, "dictionaryRepresentation");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = CFSTR("get_storage_info");
      }
LABEL_18:
      objc_msgSend(v4, "setObject:forKey:", v9, v10);

      goto LABEL_19;
    case 1:
      objc_msgSend(a1, "ping");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (v6)
      {
        if ((a2 & 1) != 0)
          objc_msgSend(v6, "jsonRepresentation");
        else
          objc_msgSend(v6, "dictionaryRepresentation");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = CFSTR("ping");
        goto LABEL_18;
      }
LABEL_19:

      break;
  }
  v12 = (void *)a1[2];
  if (v12)
  {
    objc_msgSend(v12, "dictionaryRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v13, "count"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __50__GEOPairedDeviceReply__dictionaryRepresentation___block_invoke;
      v19[3] = &unk_1E1C00600;
      v16 = v15;
      v20 = v16;
      objc_msgSend(v14, "enumerateKeysAndObjectsUsingBlock:", v19);
      v17 = v16;

      v14 = v17;
    }
    objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPairedDeviceReply _dictionaryRepresentation:](self, 1);
}

void __50__GEOPairedDeviceReply__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOPairedDeviceReply)initWithDictionary:(id)a3
{
  return (GEOPairedDeviceReply *)-[GEOACResult _initWithDictionary:isJSON:](self, a3);
}

- (GEOPairedDeviceReply)initWithJSON:(id)a3
{
  return (GEOPairedDeviceReply *)-[GEOACResult _initWithDictionary:isJSON:](self, a3);
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
      v8 = (int *)&readAll__recursiveTag_339;
    else
      v8 = (int *)&readAll__nonRecursiveTag_340;
    GEOPairedDeviceReplyReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
  {
    -[GEOPairedDevicePingReply readAll:](self->_ping, "readAll:", 1);
    -[GEOPairedDeviceGetStorageInfoReply readAll:](self->_getStorageInfo, "readAll:", 1);
    -[GEOPairedDeviceConfigureSubscriptionShouldSyncReply readAll:](self->_configureSubscriptionShouldSync, "readAll:", 1);
  }
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPairedDeviceReplyIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPairedDeviceReplyReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  unint64_t whichPayload;
  id v6;
  PBDataReader *v7;
  void *v8;
  id v9;

  v9 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_BYTE *)&self->_flags & 0x1E) == 0))
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
    -[GEOPairedDeviceReply readAll:](self, "readAll:", 0);
    whichPayload = self->_whichPayload;
    if (whichPayload == 1)
    {
      PBDataWriterWriteSubmessage();
      whichPayload = self->_whichPayload;
    }
    v6 = v9;
    if (whichPayload == 2)
    {
      PBDataWriterWriteSubmessage();
      v6 = v9;
      whichPayload = self->_whichPayload;
    }
    if (whichPayload == 3)
    {
      PBDataWriterWriteSubmessage();
      v6 = v9;
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v6);
  }

}

- (void)copyTo:(id)a3
{
  unint64_t whichPayload;
  uint64_t v5;
  id v6;
  void *v7;
  id *v8;

  v8 = (id *)a3;
  -[GEOPairedDeviceReply readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v8 + 1, self->_reader);
  *((_DWORD *)v8 + 12) = self->_readerMarkPos;
  *((_DWORD *)v8 + 13) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPairedDeviceReply resetPayload](self, "resetPayload");
  whichPayload = self->_whichPayload;
  if (whichPayload - 1 <= 2)
  {
    v5 = *off_1E1C15778[whichPayload - 1];
    v6 = *(id *)((char *)&self->super.super.isa + v5);
    v7 = *(id *)((char *)v8 + v5);
    *(id *)((char *)v8 + v5) = v6;

    whichPayload = self->_whichPayload;
  }
  v8[8] = (id)whichPayload;

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  unint64_t whichPayload;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
  {
LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPairedDeviceReply readAll:](self, "readAll:", 0);
    whichPayload = self->_whichPayload;
    switch(whichPayload)
    {
      case 3uLL:
        v9 = 24;
        break;
      case 2uLL:
        v9 = 32;
        break;
      case 1uLL:
        v9 = 40;
        break;
      default:
LABEL_12:
        *(_QWORD *)(v5 + 64) = whichPayload;
        objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
        return (id)v5;
    }
    v10 = objc_msgSend(*(id *)((char *)&self->super.super.isa + v9), "copyWithZone:", a3);
    v11 = *(void **)(v5 + v9);
    *(_QWORD *)(v5 + v9) = v10;

    whichPayload = self->_whichPayload;
    goto LABEL_12;
  }
  v7 = reader;
  objc_sync_enter(v7);
  if ((*(_BYTE *)&self->_flags & 0x10) != 0)
  {
    objc_sync_exit(v7);

    goto LABEL_5;
  }
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  GEOPairedDeviceReplyReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  unint64_t whichPayload;
  uint64_t v6;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_8;
  -[GEOPairedDeviceReply readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  whichPayload = self->_whichPayload;
  if (whichPayload != v4[8])
    goto LABEL_8;
  if (whichPayload == 3)
  {
    if (!-[GEOPairedDeviceConfigureSubscriptionShouldSyncReply isEqual:](self->_configureSubscriptionShouldSync, "isEqual:", v4[3]))goto LABEL_8;
    goto LABEL_12;
  }
  if (whichPayload != 2)
  {
    if (whichPayload == 1)
    {
      v6 = 5;
      goto LABEL_11;
    }
LABEL_12:
    v7 = 1;
    goto LABEL_9;
  }
  v6 = 4;
LABEL_11:
  if ((objc_msgSend(*(id *)((char *)&self->super.super.isa + v6 * 8), "isEqual:", v4[v6]) & 1) != 0)
    goto LABEL_12;
LABEL_8:
  v7 = 0;
LABEL_9:

  return v7;
}

- (unint64_t)hash
{
  unint64_t whichPayload;
  unint64_t v4;
  unint64_t v5;

  -[GEOPairedDeviceReply readAll:](self, "readAll:", 1);
  whichPayload = self->_whichPayload;
  v4 = 2654435761u * whichPayload;
  v5 = whichPayload - 1;
  if (v5 <= 2)
    v4 ^= objc_msgSend(*(id *)((char *)&self->super.super.isa + *off_1E1C156E0[v5]), "hash");
  return v4;
}

- (void)mergeFrom:(id)a3
{
  void *v4;
  unint64_t v5;
  uint64_t v6;
  objc_class *v7;
  void *v8;
  _QWORD *v9;

  v9 = a3;
  objc_msgSend(v9, "readAll:", 0);
  -[GEOPairedDeviceReply resetPayload](self, "resetPayload");
  v4 = v9;
  v5 = v9[8];
  if (v5 - 1 <= 2)
  {
    v6 = *off_1E1C15790[v5 - 1];
    v7 = (objc_class *)*(id *)((char *)v9 + v6);
    v8 = *(Class *)((char *)&self->super.super.isa + v6);
    *(Class *)((char *)&self->super.super.isa + v6) = v7;

    v4 = v9;
    v5 = v9[8];
  }
  self->_whichPayload = v5;

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
      GEOPairedDeviceReplyReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_343);
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
  *(_BYTE *)&self->_flags |= 0x11u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEOPairedDeviceReply readAll:](self, "readAll:", 0);
    -[GEOPairedDevicePingReply clearUnknownFields:](self->_ping, "clearUnknownFields:", 1);
    -[GEOPairedDeviceGetStorageInfoReply clearUnknownFields:](self->_getStorageInfo, "clearUnknownFields:", 1);
    -[GEOPairedDeviceConfigureSubscriptionShouldSyncReply clearUnknownFields:](self->_configureSubscriptionShouldSync, "clearUnknownFields:", 1);
  }
}

- (unint64_t)whichPayload
{
  return self->_whichPayload;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ping, 0);
  objc_storeStrong((id *)&self->_getStorageInfo, 0);
  objc_storeStrong((id *)&self->_configureSubscriptionShouldSync, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
