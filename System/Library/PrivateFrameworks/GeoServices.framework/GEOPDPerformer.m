@implementation GEOPDPerformer

- (GEOPDPerformer)init
{
  GEOPDPerformer *v2;
  GEOPDPerformer *v3;
  GEOPDPerformer *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDPerformer;
  v2 = -[GEOPDPerformer init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDPerformer)initWithData:(id)a3
{
  GEOPDPerformer *v3;
  GEOPDPerformer *v4;
  GEOPDPerformer *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDPerformer;
  v3 = -[GEOPDPerformer initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readName
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
        GEOPDPerformerReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readName_tags_5166);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)name
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDPerformer _readName]((uint64_t)a1);
    a1 = (id *)v1[5];
  }
  return a1;
}

- (void)_readItunesId
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
        GEOPDPerformerReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readItunesId_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)itunesId
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDPerformer _readItunesId]((uint64_t)a1);
    a1 = (id *)v1[3];
  }
  return a1;
}

- (void)_readItunesUrl
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
        GEOPDPerformerReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readItunesUrl_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)itunesUrl
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDPerformer _readItunesUrl]((uint64_t)a1);
    a1 = (id *)v1[4];
  }
  return a1;
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
  v8.super_class = (Class)GEOPDPerformer;
  -[GEOPDPerformer description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDPerformer dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDPerformer _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  const __CFString *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  const __CFString *v15;
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
  -[GEOPDPerformer readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDPerformer name]((id *)a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v5, "jsonRepresentation");
    else
      objc_msgSend(v5, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("name"));

  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
  if ((*(_BYTE *)(a1 + 68) & 0x10) == 0)
  {
    v8 = *(void **)(a1 + 8);
    if (v8)
    {
      v9 = v8;
      objc_sync_enter(v9);
      GEOPDPerformerReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPerformerId_tags);
      objc_sync_exit(v9);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  v10 = *(id *)(a1 + 48);
  if (v10)
  {
    if (a2)
      v11 = CFSTR("performerId");
    else
      v11 = CFSTR("performer_id");
    objc_msgSend(v4, "setObject:forKey:", v10, v11);
  }

  -[GEOPDPerformer itunesId]((id *)a1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    if (a2)
      v13 = CFSTR("itunesId");
    else
      v13 = CFSTR("itunes_id");
    objc_msgSend(v4, "setObject:forKey:", v12, v13);
  }

  -[GEOPDPerformer itunesUrl]((id *)a1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    if (a2)
      v15 = CFSTR("itunesUrl");
    else
      v15 = CFSTR("itunes_url");
    objc_msgSend(v4, "setObject:forKey:", v14, v15);
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
      v23[2] = __44__GEOPDPerformer__dictionaryRepresentation___block_invoke;
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
  return -[GEOPDPerformer _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  void *v4;
  id v5;
  int *v6;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      v5 = v4;
      objc_sync_enter(v5);
      if (a2)
        v6 = (int *)&readAll__recursiveTag_5179;
      else
        v6 = (int *)&readAll__nonRecursiveTag_5180;
      GEOPDPerformerReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
      objc_msgSend(*(id *)(a1 + 40), "readAll:", 1);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

void __44__GEOPDPerformer__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (BOOL)readFrom:(id)a3
{
  return GEOPDPerformerReadAllFrom((uint64_t)self, a3, 0);
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
  if (self->_reader && (_GEOPDPerformerIsDirty((uint64_t)self) & 1) == 0)
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
    -[GEOPDPerformer readAll:]((uint64_t)self, 0);
    if (self->_name)
      PBDataWriterWriteSubmessage();
    v5 = v8;
    if (self->_performerId)
    {
      PBDataWriterWriteStringField();
      v5 = v8;
    }
    if (self->_itunesId)
    {
      PBDataWriterWriteStringField();
      v5 = v8;
    }
    if (self->_itunesUrl)
    {
      PBDataWriterWriteStringField();
      v5 = v8;
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v5);
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
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
    -[GEOPDPerformer readAll:]((uint64_t)self, 0);
    v8 = -[GEOLocalizedString copyWithZone:](self->_name, "copyWithZone:", a3);
    v9 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v8;

    v10 = -[NSString copyWithZone:](self->_performerId, "copyWithZone:", a3);
    v11 = *(void **)(v5 + 48);
    *(_QWORD *)(v5 + 48) = v10;

    v12 = -[NSString copyWithZone:](self->_itunesId, "copyWithZone:", a3);
    v13 = *(void **)(v5 + 24);
    *(_QWORD *)(v5 + 24) = v12;

    v14 = -[NSString copyWithZone:](self->_itunesUrl, "copyWithZone:", a3);
    v15 = *(void **)(v5 + 32);
    *(_QWORD *)(v5 + 32) = v14;

    objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
    return (id)v5;
  }
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  GEOPDPerformerReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  GEOLocalizedString *name;
  NSString *performerId;
  NSString *itunesId;
  NSString *itunesUrl;
  char v9;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((-[GEOPDPerformer readAll:]((uint64_t)self, 1),
         -[GEOPDPerformer readAll:]((uint64_t)v4, 1),
         name = self->_name,
         !((unint64_t)name | v4[5]))
     || -[GEOLocalizedString isEqual:](name, "isEqual:"))
    && ((performerId = self->_performerId, !((unint64_t)performerId | v4[6]))
     || -[NSString isEqual:](performerId, "isEqual:"))
    && ((itunesId = self->_itunesId, !((unint64_t)itunesId | v4[3]))
     || -[NSString isEqual:](itunesId, "isEqual:")))
  {
    itunesUrl = self->_itunesUrl;
    if ((unint64_t)itunesUrl | v4[4])
      v9 = -[NSString isEqual:](itunesUrl, "isEqual:");
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
  unint64_t v3;
  NSUInteger v4;
  NSUInteger v5;

  -[GEOPDPerformer readAll:]((uint64_t)self, 1);
  v3 = -[GEOLocalizedString hash](self->_name, "hash");
  v4 = -[NSString hash](self->_performerId, "hash") ^ v3;
  v5 = -[NSString hash](self->_itunesId, "hash");
  return v4 ^ v5 ^ -[NSString hash](self->_itunesUrl, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_performerId, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_itunesUrl, 0);
  objc_storeStrong((id *)&self->_itunesId, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
