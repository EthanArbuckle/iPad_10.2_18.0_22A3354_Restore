@implementation GEOSource

- (GEOSource)init
{
  GEOSource *v2;
  GEOSource *v3;
  GEOSource *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOSource;
  v2 = -[GEOSource init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOSource)initWithData:(id)a3
{
  GEOSource *v3;
  GEOSource *v4;
  GEOSource *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOSource;
  v3 = -[GEOSource initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (NSString)sourceName
{
  PBDataReader *reader;
  PBDataReader *v4;

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
        GEOSourceReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&_readSourceName_tags_0);
        objc_sync_exit(v4);

      }
    }
    os_unfair_lock_unlock(&self->_readerLock);
  }
  return self->_sourceName;
}

- (void)setSourceName:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x14u;
  objc_storeStrong((id *)&self->_sourceName, a3);
}

- (NSString)sourceId
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
        GEOSourceReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&_readSourceId_tags_1);
        objc_sync_exit(v4);

      }
    }
    os_unfair_lock_unlock(&self->_readerLock);
  }
  return self->_sourceId;
}

- (void)setSourceId:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x12u;
  objc_storeStrong((id *)&self->_sourceId, a3);
}

- (void)_readSourceVersion
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_BYTE *)(a1 + 60) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOSourceReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSourceVersion_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasSourceVersion
{
  -[GEOSource _readSourceVersion]((uint64_t)self);
  return self->_sourceVersion != 0;
}

- (NSString)sourceVersion
{
  -[GEOSource _readSourceVersion]((uint64_t)self);
  return self->_sourceVersion;
}

- (void)setSourceVersion:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x18u;
  objc_storeStrong((id *)&self->_sourceVersion, a3);
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
  v8.super_class = (Class)GEOSource;
  -[GEOSource description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOSource dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOSource _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(_QWORD *)a1
{
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  const __CFString *v10;
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
  objc_msgSend(a1, "sourceName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (a2)
      v6 = CFSTR("sourceName");
    else
      v6 = CFSTR("source_name");
    objc_msgSend(v4, "setObject:forKey:", v5, v6);
  }

  objc_msgSend(a1, "sourceId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    if (a2)
      v8 = CFSTR("sourceId");
    else
      v8 = CFSTR("source_id");
    objc_msgSend(v4, "setObject:forKey:", v7, v8);
  }

  objc_msgSend(a1, "sourceVersion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    if (a2)
      v10 = CFSTR("sourceVersion");
    else
      v10 = CFSTR("source_version");
    objc_msgSend(v4, "setObject:forKey:", v9, v10);
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
      v18[2] = __39__GEOSource__dictionaryRepresentation___block_invoke;
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
  return -[GEOSource _dictionaryRepresentation:](self, 1);
}

void __39__GEOSource__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOSource)initWithDictionary:(id)a3
{
  return (GEOSource *)-[GEOSource _initWithDictionary:isJSON:](self, a3, 0);
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
  void *v14;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("sourceName");
      else
        v6 = CFSTR("source_name");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = (void *)objc_msgSend(v7, "copy");
        objc_msgSend(a1, "setSourceName:", v8);

      }
      if (a3)
        v9 = CFSTR("sourceId");
      else
        v9 = CFSTR("source_id");
      objc_msgSend(v5, "objectForKeyedSubscript:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = (void *)objc_msgSend(v10, "copy");
        objc_msgSend(a1, "setSourceId:", v11);

      }
      if (a3)
        v12 = CFSTR("sourceVersion");
      else
        v12 = CFSTR("source_version");
      objc_msgSend(v5, "objectForKeyedSubscript:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v14 = (void *)objc_msgSend(v13, "copy");
        objc_msgSend(a1, "setSourceVersion:", v14);

      }
    }
  }

  return a1;
}

- (GEOSource)initWithJSON:(id)a3
{
  return (GEOSource *)-[GEOSource _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_2751;
    else
      v8 = (int *)&readAll__nonRecursiveTag_2752;
    GEOSourceReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOSourceIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOSourceReadAllFrom((uint64_t)self, a3, 0);
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
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_BYTE *)&self->_flags & 0x1E) == 0))
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
    -[GEOSource readAll:](self, "readAll:", 0);
    PBDataWriterWriteStringField();
    PBDataWriterWriteStringField();
    if (self->_sourceVersion)
      PBDataWriterWriteStringField();
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v7);
  }

}

- (void)copyTo:(id)a3
{
  id *v4;

  v4 = (id *)a3;
  -[GEOSource readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v4 + 1, self->_reader);
  *((_DWORD *)v4 + 12) = self->_readerMarkPos;
  *((_DWORD *)v4 + 13) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  objc_msgSend(v4, "setSourceName:", self->_sourceName);
  objc_msgSend(v4, "setSourceId:", self->_sourceId);
  if (self->_sourceVersion)
    objc_msgSend(v4, "setSourceVersion:");

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

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
    goto LABEL_5;
  v7 = reader;
  objc_sync_enter(v7);
  if ((*(_BYTE *)&self->_flags & 0x10) != 0)
  {
    objc_sync_exit(v7);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOSource readAll:](self, "readAll:", 0);
    v8 = -[NSString copyWithZone:](self->_sourceName, "copyWithZone:", a3);
    v9 = *(void **)(v5 + 32);
    *(_QWORD *)(v5 + 32) = v8;

    v10 = -[NSString copyWithZone:](self->_sourceId, "copyWithZone:", a3);
    v11 = *(void **)(v5 + 24);
    *(_QWORD *)(v5 + 24) = v10;

    v12 = -[NSString copyWithZone:](self->_sourceVersion, "copyWithZone:", a3);
    v13 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v12;

    objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
    return (id)v5;
  }
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  GEOSourceReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *sourceName;
  NSString *sourceId;
  NSString *sourceVersion;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((-[GEOSource readAll:](self, "readAll:", 1),
         objc_msgSend(v4, "readAll:", 1),
         sourceName = self->_sourceName,
         !((unint64_t)sourceName | v4[4]))
     || -[NSString isEqual:](sourceName, "isEqual:"))
    && ((sourceId = self->_sourceId, !((unint64_t)sourceId | v4[3]))
     || -[NSString isEqual:](sourceId, "isEqual:")))
  {
    sourceVersion = self->_sourceVersion;
    if ((unint64_t)sourceVersion | v4[5])
      v8 = -[NSString isEqual:](sourceVersion, "isEqual:");
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

  -[GEOSource readAll:](self, "readAll:", 1);
  v3 = -[NSString hash](self->_sourceName, "hash");
  v4 = -[NSString hash](self->_sourceId, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_sourceVersion, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;

  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  if (v4[4])
    -[GEOSource setSourceName:](self, "setSourceName:");
  if (v4[3])
    -[GEOSource setSourceId:](self, "setSourceId:");
  if (v4[5])
    -[GEOSource setSourceVersion:](self, "setSourceVersion:");

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
      GEOSourceReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_2755);
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
    -[GEOSource readAll:](self, "readAll:", 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceVersion, 0);
  objc_storeStrong((id *)&self->_sourceName, 0);
  objc_storeStrong((id *)&self->_sourceId, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

- (GEOSource)initWithAttributionID:(id)a3
{
  id v4;
  GEOSource *v5;
  GEOSource *v6;
  GEOSource *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEOSource;
  v5 = -[GEOSource init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    -[GEOSource setSourceName:](v5, "setSourceName:", CFSTR("yelp"));
    -[GEOSource setSourceId:](v6, "setSourceId:", v4);
    v7 = v6;
  }

  return v6;
}

@end
