@implementation GEOResourceManifestDownload

- (GEOResources)resources
{
  -[GEOResourceManifestDownload _readResources]((uint64_t)self);
  return self->_resources;
}

- (void)_readResources
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
        GEOResourceManifestDownloadReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readResources_tags_1202);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (GEODownloadMetadata)metadata
{
  PBDataReader *reader;
  PBDataReader *v4;

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
        GEOResourceManifestDownloadReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&_readMetadata_tags_0);
        objc_sync_exit(v4);

      }
    }
    os_unfair_lock_unlock(&self->_readerLock);
  }
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
  *(_BYTE *)&self->_flags |= 0xAu;
  objc_storeStrong((id *)&self->_metadata, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resources, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
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
    -[GEOResourceManifestDownload readAll:](self, "readAll:", 0);
    v8 = -[GEOResources copyWithZone:](self->_resources, "copyWithZone:", a3);
    v9 = *(void **)(v5 + 32);
    *(_QWORD *)(v5 + 32) = v8;

    v10 = -[GEODownloadMetadata copyWithZone:](self->_metadata, "copyWithZone:", a3);
    v11 = *(void **)(v5 + 24);
    *(_QWORD *)(v5 + 24) = v10;

    objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
    return (id)v5;
  }
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  GEOResourceManifestDownloadReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);

  return (id)v5;
}

- (GEOResourceManifestDownload)init
{
  GEOResourceManifestDownload *v2;
  GEOResourceManifestDownload *v3;
  GEOResourceManifestDownload *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOResourceManifestDownload;
  v2 = -[GEOResourceManifestDownload init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
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
  if (self->_reader && !_GEOResourceManifestDownloadIsDirty((uint64_t)self))
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
    -[GEOResourceManifestDownload readAll:](self, "readAll:", 0);
    if (self->_resources)
      PBDataWriterWriteSubmessage();
    PBDataWriterWriteSubmessage();
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v7);
  }

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
      v8 = (int *)&readAll__recursiveTag_1209;
    else
      v8 = (int *)&readAll__nonRecursiveTag_1210;
    GEOResourceManifestDownloadReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
  {
    -[GEOResources readAll:](self->_resources, "readAll:", 1);
    -[GEODownloadMetadata readAll:](self->_metadata, "readAll:", 1);
  }
  os_unfair_lock_unlock(p_readerLock);
}

- (GEOResourceManifestDownload)initWithData:(id)a3
{
  GEOResourceManifestDownload *v3;
  GEOResourceManifestDownload *v4;
  GEOResourceManifestDownload *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOResourceManifestDownload;
  v3 = -[GEOResourceManifestDownload initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (BOOL)hasResources
{
  -[GEOResourceManifestDownload _readResources]((uint64_t)self);
  return self->_resources != 0;
}

- (void)setResources:(id)a3
{
  *(_BYTE *)&self->_flags |= 0xCu;
  objc_storeStrong((id *)&self->_resources, a3);
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
  v8.super_class = (Class)GEOResourceManifestDownload;
  -[GEOResourceManifestDownload description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOResourceManifestDownload dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOResourceManifestDownload _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(_QWORD *)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v18[4];
  id v19;

  if (!a1)
    return 0;
  objc_msgSend(a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "resources");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v5, "jsonRepresentation");
    else
      objc_msgSend(v5, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("resources"));

  }
  objc_msgSend(a1, "metadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v8, "jsonRepresentation");
    else
      objc_msgSend(v8, "dictionaryRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("metadata"));

  }
  v11 = (void *)a1[2];
  if (v11)
  {
    objc_msgSend(v11, "dictionaryRepresentation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v12, "count"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __57__GEOResourceManifestDownload__dictionaryRepresentation___block_invoke;
      v18[3] = &unk_1E1C00600;
      v15 = v14;
      v19 = v15;
      objc_msgSend(v13, "enumerateKeysAndObjectsUsingBlock:", v18);
      v16 = v15;

      v13 = v16;
    }
    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOResourceManifestDownload _dictionaryRepresentation:](self, 1);
}

void __57__GEOResourceManifestDownload__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOResourceManifestDownload)initWithDictionary:(id)a3
{
  return (GEOResourceManifestDownload *)-[GEOResourceManifestDownload _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(char)a3 isJSON:
{
  id v5;
  void *v6;
  GEOResources *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  GEODownloadMetadata *v11;
  uint64_t v12;
  void *v13;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("resources"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = [GEOResources alloc];
        if ((a3 & 1) != 0)
          v8 = -[GEOResources initWithJSON:](v7, "initWithJSON:", v6);
        else
          v8 = -[GEOResources initWithDictionary:](v7, "initWithDictionary:", v6);
        v9 = (void *)v8;
        objc_msgSend(a1, "setResources:", v8);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("metadata"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = [GEODownloadMetadata alloc];
        if ((a3 & 1) != 0)
          v12 = -[GEODownloadMetadata initWithJSON:](v11, "initWithJSON:", v10);
        else
          v12 = -[GEODownloadMetadata initWithDictionary:](v11, "initWithDictionary:", v10);
        v13 = (void *)v12;
        objc_msgSend(a1, "setMetadata:", v12);

      }
    }
  }

  return a1;
}

- (GEOResourceManifestDownload)initWithJSON:(id)a3
{
  return (GEOResourceManifestDownload *)-[GEOResourceManifestDownload _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOResourceManifestDownloadIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOResourceManifestDownloadReadAllFrom((uint64_t)self, a3, 0);
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[GEOResourceManifestDownload _readResources]((uint64_t)self);
  return -[GEOResources hasGreenTeaWithValue:](self->_resources, "hasGreenTeaWithValue:", v3);
}

- (void)copyTo:(id)a3
{
  id *v4;

  v4 = (id *)a3;
  -[GEOResourceManifestDownload readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v4 + 1, self->_reader);
  *((_DWORD *)v4 + 10) = self->_readerMarkPos;
  *((_DWORD *)v4 + 11) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_resources)
    objc_msgSend(v4, "setResources:");
  objc_msgSend(v4, "setMetadata:", self->_metadata);

}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  GEOResources *resources;
  GEODownloadMetadata *metadata;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((-[GEOResourceManifestDownload readAll:](self, "readAll:", 1),
         objc_msgSend(v4, "readAll:", 1),
         resources = self->_resources,
         !((unint64_t)resources | v4[4]))
     || -[GEOResources isEqual:](resources, "isEqual:")))
  {
    metadata = self->_metadata;
    if ((unint64_t)metadata | v4[3])
      v7 = -[GEODownloadMetadata isEqual:](metadata, "isEqual:");
    else
      v7 = 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3;

  -[GEOResourceManifestDownload readAll:](self, "readAll:", 1);
  v3 = -[GEOResources hash](self->_resources, "hash");
  return -[GEODownloadMetadata hash](self->_metadata, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  GEOResources *resources;
  uint64_t v5;
  GEODownloadMetadata *metadata;
  uint64_t v7;
  _QWORD *v8;

  v8 = a3;
  objc_msgSend(v8, "readAll:", 0);
  resources = self->_resources;
  v5 = v8[4];
  if (resources)
  {
    if (v5)
      -[GEOResources mergeFrom:](resources, "mergeFrom:");
  }
  else if (v5)
  {
    -[GEOResourceManifestDownload setResources:](self, "setResources:");
  }
  metadata = self->_metadata;
  v7 = v8[3];
  if (metadata)
  {
    if (v7)
      -[GEODownloadMetadata mergeFrom:](metadata, "mergeFrom:");
  }
  else if (v7)
  {
    -[GEOResourceManifestDownload setMetadata:](self, "setMetadata:");
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
      GEOResourceManifestDownloadReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_1213);
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
  *(_BYTE *)&self->_flags |= 9u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEOResourceManifestDownload readAll:](self, "readAll:", 0);
    -[GEOResources clearUnknownFields:](self->_resources, "clearUnknownFields:", 1);
    -[GEODownloadMetadata clearUnknownFields:](self->_metadata, "clearUnknownFields:", 1);
  }
}

- (GEOResourceManifestDownload)initWithResourceManifestData:(id)a3
{
  id v4;
  GEOResourceManifestDownload *v5;
  GEOResources *v6;
  GEODownloadMetadata *v7;
  GEOResourceManifestDownload *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GEOResourceManifestDownload;
  v5 = -[GEOResourceManifestDownload init](&v10, sel_init);
  if (v5)
  {
    v6 = -[GEOResources initWithData:]([GEOResources alloc], "initWithData:", v4);
    if (v6)
    {
      -[GEOResourceManifestDownload setResources:](v5, "setResources:", v6);
      v7 = objc_alloc_init(GEODownloadMetadata);
      -[GEODownloadMetadata setTimestamp:](v7, "setTimestamp:", CFAbsoluteTimeGetCurrent());
      -[GEOResourceManifestDownload setMetadata:](v5, "setMetadata:", v7);
      v8 = v5;

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end
