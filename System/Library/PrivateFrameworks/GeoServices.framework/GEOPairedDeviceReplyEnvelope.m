@implementation GEOPairedDeviceReplyEnvelope

- (GEOPairedDeviceReplyEnvelope)init
{
  GEOPairedDeviceReplyEnvelope *v2;
  GEOPairedDeviceReplyEnvelope *v3;
  GEOPairedDeviceReplyEnvelope *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPairedDeviceReplyEnvelope;
  v2 = -[GEOPairedDeviceReplyEnvelope init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPairedDeviceReplyEnvelope)initWithData:(id)a3
{
  GEOPairedDeviceReplyEnvelope *v3;
  GEOPairedDeviceReplyEnvelope *v4;
  GEOPairedDeviceReplyEnvelope *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPairedDeviceReplyEnvelope;
  v3 = -[GEOPairedDeviceReplyEnvelope initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)resetResult
{
  GEOPairedDeviceReply *success;
  GEOPairedDeviceReplyError *error;

  success = self->_success;
  self->_success = 0;

  error = self->_error;
  self->_error = 0;

  self->_whichResult = 0;
}

- (void)_readMetadata
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_BYTE *)(a1 + 60) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPairedDeviceReplyEnvelopeReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMetadata_tags_354);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasMetadata
{
  -[GEOPairedDeviceReplyEnvelope _readMetadata]((uint64_t)self);
  return self->_metadata != 0;
}

- (GEOPairedDeviceReplyMetadata)metadata
{
  -[GEOPairedDeviceReplyEnvelope _readMetadata]((uint64_t)self);
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x14u;
  objc_storeStrong((id *)&self->_metadata, a3);
}

- (GEOPairedDeviceReply)success
{
  PBDataReader *reader;
  PBDataReader *v4;
  GEOPairedDeviceReply *v5;

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
        GEOPairedDeviceReplyEnvelopeReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&_readSuccess_tags);
        objc_sync_exit(v4);

      }
    }
    os_unfair_lock_unlock(&self->_readerLock);
  }
  if (self->_whichResult == 1)
    v5 = self->_success;
  else
    v5 = 0;
  return v5;
}

- (void)setSuccess:(id)a3
{
  GEOPairedDeviceReply *v4;
  GEOPairedDeviceReply *success;

  v4 = (GEOPairedDeviceReply *)a3;
  *(_BYTE *)&self->_flags |= 0x18u;
  -[GEOPairedDeviceReplyEnvelope resetResult](self, "resetResult");
  success = self->_success;
  self->_success = v4;

  if (v4)
    self->_whichResult = 1;
}

- (GEOPairedDeviceReplyError)error
{
  PBDataReader *reader;
  PBDataReader *v4;
  GEOPairedDeviceReplyError *v5;

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
        GEOPairedDeviceReplyEnvelopeReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&_readError_tags_0);
        objc_sync_exit(v4);

      }
    }
    os_unfair_lock_unlock(&self->_readerLock);
  }
  if (self->_whichResult == 2)
    v5 = self->_error;
  else
    v5 = 0;
  return v5;
}

- (void)setError:(id)a3
{
  GEOPairedDeviceReplyError *v4;
  GEOPairedDeviceReplyError *error;

  v4 = (GEOPairedDeviceReplyError *)a3;
  *(_BYTE *)&self->_flags |= 0x12u;
  -[GEOPairedDeviceReplyEnvelope resetResult](self, "resetResult");
  error = self->_error;
  self->_error = v4;

  if (v4)
    self->_whichResult = 2;
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
  v8.super_class = (Class)GEOPairedDeviceReplyEnvelope;
  -[GEOPairedDeviceReplyEnvelope description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPairedDeviceReplyEnvelope dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPairedDeviceReplyEnvelope _dictionaryRepresentation:](self, 0);
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
  v5 = a1[8];
  if (v5 == 2)
  {
    objc_msgSend(a1, "error");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v8;
    if (v8)
    {
      if ((a2 & 1) != 0)
        objc_msgSend(v8, "jsonRepresentation");
      else
        objc_msgSend(v8, "dictionaryRepresentation");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = CFSTR("error");
      goto LABEL_14;
    }
LABEL_15:

    goto LABEL_16;
  }
  if (v5 == 1)
  {
    objc_msgSend(a1, "success");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      if ((a2 & 1) != 0)
        objc_msgSend(v6, "jsonRepresentation");
      else
        objc_msgSend(v6, "dictionaryRepresentation");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = CFSTR("success");
LABEL_14:
      objc_msgSend(v4, "setObject:forKey:", v9, v10);

      goto LABEL_15;
    }
    goto LABEL_15;
  }
LABEL_16:
  objc_msgSend(a1, "metadata");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v11, "jsonRepresentation");
    else
      objc_msgSend(v11, "dictionaryRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("metadata"));

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
      v21[2] = __58__GEOPairedDeviceReplyEnvelope__dictionaryRepresentation___block_invoke;
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
  return -[GEOPairedDeviceReplyEnvelope _dictionaryRepresentation:](self, 1);
}

void __58__GEOPairedDeviceReplyEnvelope__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOPairedDeviceReplyEnvelope)initWithDictionary:(id)a3
{
  return (GEOPairedDeviceReplyEnvelope *)-[GEOPairedDeviceReplyEnvelope _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(char)a3 isJSON:
{
  id v5;
  void *v6;
  GEOPairedDeviceReplyMetadata *v7;
  uint64_t v8;
  void *v9;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("metadata"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = [GEOPairedDeviceReplyMetadata alloc];
        if ((a3 & 1) != 0)
          v8 = -[GEOPairedDeviceReplyMetadata initWithJSON:](v7, "initWithJSON:", v6);
        else
          v8 = -[GEOPairedDeviceReplyMetadata initWithDictionary:](v7, "initWithDictionary:", v6);
        v9 = (void *)v8;
        objc_msgSend(a1, "setMetadata:", v8);

      }
    }
  }

  return a1;
}

- (GEOPairedDeviceReplyEnvelope)initWithJSON:(id)a3
{
  return (GEOPairedDeviceReplyEnvelope *)-[GEOPairedDeviceReplyEnvelope _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_360;
    else
      v8 = (int *)&readAll__nonRecursiveTag_361;
    GEOPairedDeviceReplyEnvelopeReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
  {
    -[GEOPairedDeviceReplyMetadata readAll:](self->_metadata, "readAll:", 1);
    -[GEOPairedDeviceReply readAll:](self->_success, "readAll:", 1);
    -[GEOPairedDeviceReplyError readAll:](self->_error, "readAll:", 1);
  }
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPairedDeviceReplyEnvelopeIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPairedDeviceReplyEnvelopeReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  unint64_t whichResult;
  id v6;
  PBDataReader *v7;
  void *v8;
  id v9;

  v9 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPairedDeviceReplyEnvelopeIsDirty((uint64_t)self) & 1) == 0)
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
    -[GEOPairedDeviceReplyEnvelope readAll:](self, "readAll:", 0);
    if (self->_metadata)
      PBDataWriterWriteSubmessage();
    whichResult = self->_whichResult;
    v6 = v9;
    if (whichResult == 1)
    {
      PBDataWriterWriteSubmessage();
      v6 = v9;
      whichResult = self->_whichResult;
    }
    if (whichResult == 2)
    {
      PBDataWriterWriteSubmessage();
      v6 = v9;
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v6);
  }

}

- (void)copyTo:(id)a3
{
  unint64_t whichResult;
  int *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id *v9;
  id *v10;

  v10 = (id *)a3;
  -[GEOPairedDeviceReplyEnvelope readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v10 + 1, self->_reader);
  *((_DWORD *)v10 + 12) = self->_readerMarkPos;
  *((_DWORD *)v10 + 13) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPairedDeviceReplyEnvelope resetResult](self, "resetResult");
  whichResult = self->_whichResult;
  if (whichResult == 1)
  {
    v5 = &OBJC_IVAR___GEOPairedDeviceReplyEnvelope__success;
  }
  else
  {
    if (whichResult != 2)
      goto LABEL_6;
    v5 = &OBJC_IVAR___GEOPairedDeviceReplyEnvelope__error;
  }
  v6 = *v5;
  v7 = *(id *)((char *)&self->super.super.isa + v6);
  v8 = *(id *)((char *)v10 + v6);
  *(id *)((char *)v10 + v6) = v7;

  whichResult = self->_whichResult;
LABEL_6:
  v9 = v10;
  v10[8] = (id)whichResult;
  if (self->_metadata)
  {
    objc_msgSend(v10, "setMetadata:");
    v9 = v10;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  unint64_t whichResult;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
  {
LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPairedDeviceReplyEnvelope readAll:](self, "readAll:", 0);
    whichResult = self->_whichResult;
    if (whichResult == 2)
    {
      v9 = 24;
    }
    else
    {
      if (whichResult != 1)
      {
LABEL_10:
        *(_QWORD *)(v5 + 64) = whichResult;
        v12 = -[GEOPairedDeviceReplyMetadata copyWithZone:](self->_metadata, "copyWithZone:", a3);
        v13 = *(void **)(v5 + 32);
        *(_QWORD *)(v5 + 32) = v12;

        objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
        return (id)v5;
      }
      v9 = 40;
    }
    v10 = objc_msgSend(*(id *)((char *)&self->super.super.isa + v9), "copyWithZone:", a3);
    v11 = *(void **)(v5 + v9);
    *(_QWORD *)(v5 + v9) = v10;

    whichResult = self->_whichResult;
    goto LABEL_10;
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
  GEOPairedDeviceReplyEnvelopeReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  unint64_t whichResult;
  GEOPairedDeviceReplyMetadata *metadata;
  char v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_9;
  -[GEOPairedDeviceReplyEnvelope readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  whichResult = self->_whichResult;
  if (whichResult != v4[8])
    goto LABEL_9;
  if (whichResult != 2)
  {
    if (whichResult != 1 || -[GEOPairedDeviceReply isEqual:](self->_success, "isEqual:", v4[5]))
      goto LABEL_6;
LABEL_9:
    v7 = 0;
    goto LABEL_10;
  }
  if (!-[GEOPairedDeviceReplyError isEqual:](self->_error, "isEqual:", v4[3]))
    goto LABEL_9;
LABEL_6:
  metadata = self->_metadata;
  if ((unint64_t)metadata | v4[4])
    v7 = -[GEOPairedDeviceReplyMetadata isEqual:](metadata, "isEqual:");
  else
    v7 = 1;
LABEL_10:

  return v7;
}

- (unint64_t)hash
{
  int *v3;
  unint64_t whichResult;
  uint64_t v5;

  -[GEOPairedDeviceReplyEnvelope readAll:](self, "readAll:", 1);
  v3 = &OBJC_IVAR___GEOPairedDeviceReplyEnvelope__success;
  whichResult = self->_whichResult;
  v5 = 2654435761u * whichResult;
  if (whichResult == 1)
    goto LABEL_4;
  if (whichResult == 2)
  {
    v3 = &OBJC_IVAR___GEOPairedDeviceReplyEnvelope__error;
LABEL_4:
    v5 ^= objc_msgSend(*(id *)((char *)&self->super.super.isa + *v3), "hash");
  }
  return -[GEOPairedDeviceReplyMetadata hash](self->_metadata, "hash") ^ v5;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  int *v5;
  unint64_t v6;
  uint64_t v7;
  objc_class *v8;
  void *v9;
  GEOPairedDeviceReplyMetadata *metadata;
  uint64_t v11;
  _QWORD *v12;

  v12 = a3;
  objc_msgSend(v12, "readAll:", 0);
  -[GEOPairedDeviceReplyEnvelope resetResult](self, "resetResult");
  v4 = v12;
  v5 = &OBJC_IVAR___GEOPairedDeviceReplyEnvelope__success;
  v6 = v12[8];
  if (v6 != 1)
  {
    if (v6 != 2)
      goto LABEL_5;
    v5 = &OBJC_IVAR___GEOPairedDeviceReplyEnvelope__error;
  }
  v7 = *v5;
  v8 = (objc_class *)*(id *)((char *)v12 + v7);
  v9 = *(Class *)((char *)&self->super.super.isa + v7);
  *(Class *)((char *)&self->super.super.isa + v7) = v8;

  v4 = v12;
  v6 = v12[8];
LABEL_5:
  self->_whichResult = v6;
  metadata = self->_metadata;
  v11 = v4[4];
  if (metadata)
  {
    if (v11)
    {
      -[GEOPairedDeviceReplyMetadata mergeFrom:](metadata, "mergeFrom:");
LABEL_10:
      v4 = v12;
    }
  }
  else if (v11)
  {
    -[GEOPairedDeviceReplyEnvelope setMetadata:](self, "setMetadata:");
    goto LABEL_10;
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
      GEOPairedDeviceReplyEnvelopeReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_364);
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
    -[GEOPairedDeviceReplyEnvelope readAll:](self, "readAll:", 0);
    -[GEOPairedDeviceReplyMetadata clearUnknownFields:](self->_metadata, "clearUnknownFields:", 1);
    -[GEOPairedDeviceReply clearUnknownFields:](self->_success, "clearUnknownFields:", 1);
    -[GEOPairedDeviceReplyError clearUnknownFields:](self->_error, "clearUnknownFields:", 1);
  }
}

- (unint64_t)whichResult
{
  return self->_whichResult;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_success, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
