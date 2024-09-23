@implementation GEORPCuratedCollectionFeedback

- (GEORPCuratedCollectionFeedback)init
{
  GEORPCuratedCollectionFeedback *v2;
  GEORPCuratedCollectionFeedback *v3;
  GEORPCuratedCollectionFeedback *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEORPCuratedCollectionFeedback;
  v2 = -[GEORPCuratedCollectionFeedback init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPCuratedCollectionFeedback)initWithData:(id)a3
{
  GEORPCuratedCollectionFeedback *v3;
  GEORPCuratedCollectionFeedback *v4;
  GEORPCuratedCollectionFeedback *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEORPCuratedCollectionFeedback;
  v3 = -[GEORPCuratedCollectionFeedback initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readCuratedCollectionContext
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
        GEORPCuratedCollectionFeedbackReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCuratedCollectionContext_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasCuratedCollectionContext
{
  -[GEORPCuratedCollectionFeedback _readCuratedCollectionContext]((uint64_t)self);
  return self->_curatedCollectionContext != 0;
}

- (GEORPCuratedCollectionContext)curatedCollectionContext
{
  -[GEORPCuratedCollectionFeedback _readCuratedCollectionContext]((uint64_t)self);
  return self->_curatedCollectionContext;
}

- (void)setCuratedCollectionContext:(id)a3
{
  *(_BYTE *)&self->_flags |= 0xAu;
  objc_storeStrong((id *)&self->_curatedCollectionContext, a3);
}

- (void)_readCuratedCollectionCorrections
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
        GEORPCuratedCollectionFeedbackReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCuratedCollectionCorrections_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasCuratedCollectionCorrections
{
  -[GEORPCuratedCollectionFeedback _readCuratedCollectionCorrections]((uint64_t)self);
  return self->_curatedCollectionCorrections != 0;
}

- (GEORPCuratedCollectionCorrections)curatedCollectionCorrections
{
  -[GEORPCuratedCollectionFeedback _readCuratedCollectionCorrections]((uint64_t)self);
  return self->_curatedCollectionCorrections;
}

- (void)setCuratedCollectionCorrections:(id)a3
{
  *(_BYTE *)&self->_flags |= 0xCu;
  objc_storeStrong((id *)&self->_curatedCollectionCorrections, a3);
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
  v8.super_class = (Class)GEORPCuratedCollectionFeedback;
  -[GEORPCuratedCollectionFeedback description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORPCuratedCollectionFeedback dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPCuratedCollectionFeedback _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(_QWORD *)a1
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
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  _QWORD v20[4];
  id v21;

  if (!a1)
    return 0;
  objc_msgSend(a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "curatedCollectionContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v5, "jsonRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = CFSTR("curatedCollectionContext");
    }
    else
    {
      objc_msgSend(v5, "dictionaryRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = CFSTR("curated_collection_context");
    }
    objc_msgSend(v4, "setObject:forKey:", v7, v8);

  }
  objc_msgSend(a1, "curatedCollectionCorrections");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v9, "jsonRepresentation");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = CFSTR("curatedCollectionCorrections");
    }
    else
    {
      objc_msgSend(v9, "dictionaryRepresentation");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = CFSTR("curated_collection_corrections");
    }
    objc_msgSend(v4, "setObject:forKey:", v11, v12);

  }
  v13 = (void *)a1[2];
  if (v13)
  {
    objc_msgSend(v13, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v14, "count"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __60__GEORPCuratedCollectionFeedback__dictionaryRepresentation___block_invoke;
      v20[3] = &unk_1E1C00600;
      v17 = v16;
      v21 = v17;
      objc_msgSend(v15, "enumerateKeysAndObjectsUsingBlock:", v20);
      v18 = v17;

      v15 = v18;
    }
    objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEORPCuratedCollectionFeedback _dictionaryRepresentation:](self, 1);
}

void __60__GEORPCuratedCollectionFeedback__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEORPCuratedCollectionFeedback)initWithDictionary:(id)a3
{
  return (GEORPCuratedCollectionFeedback *)-[GEORPCuratedCollectionFeedback _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  GEORPCuratedCollectionContext *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  GEORPCuratedCollectionCorrections *v13;
  uint64_t v14;
  void *v15;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("curatedCollectionContext");
      else
        v6 = CFSTR("curated_collection_context");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = [GEORPCuratedCollectionContext alloc];
        if ((a3 & 1) != 0)
          v9 = -[GEORPCuratedCollectionContext initWithJSON:](v8, "initWithJSON:", v7);
        else
          v9 = -[GEORPCuratedCollectionContext initWithDictionary:](v8, "initWithDictionary:", v7);
        v10 = (void *)v9;
        objc_msgSend(a1, "setCuratedCollectionContext:", v9);

      }
      if (a3)
        v11 = CFSTR("curatedCollectionCorrections");
      else
        v11 = CFSTR("curated_collection_corrections");
      objc_msgSend(v5, "objectForKeyedSubscript:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v13 = [GEORPCuratedCollectionCorrections alloc];
        if ((a3 & 1) != 0)
          v14 = -[GEORPCuratedCollectionCorrections initWithJSON:](v13, "initWithJSON:", v12);
        else
          v14 = -[GEORPCuratedCollectionCorrections initWithDictionary:](v13, "initWithDictionary:", v12);
        v15 = (void *)v14;
        objc_msgSend(a1, "setCuratedCollectionCorrections:", v14);

      }
    }
  }

  return a1;
}

- (GEORPCuratedCollectionFeedback)initWithJSON:(id)a3
{
  return (GEORPCuratedCollectionFeedback *)-[GEORPCuratedCollectionFeedback _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_513;
    else
      v8 = (int *)&readAll__nonRecursiveTag_514;
    GEORPCuratedCollectionFeedbackReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
  {
    -[GEORPCuratedCollectionContext readAll:](self->_curatedCollectionContext, "readAll:", 1);
    -[GEORPCuratedCollectionCorrections readAll:](self->_curatedCollectionCorrections, "readAll:", 1);
  }
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPCuratedCollectionFeedbackIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPCuratedCollectionFeedbackReadAllFrom((uint64_t)self, a3, 0);
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
  if (self->_reader && (_GEORPCuratedCollectionFeedbackIsDirty((uint64_t)self) & 1) == 0)
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
    -[GEORPCuratedCollectionFeedback readAll:](self, "readAll:", 0);
    if (self->_curatedCollectionContext)
      PBDataWriterWriteSubmessage();
    v5 = v8;
    if (self->_curatedCollectionCorrections)
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

  v4 = (id *)a3;
  -[GEORPCuratedCollectionFeedback readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v4 + 1, self->_reader);
  *((_DWORD *)v4 + 10) = self->_readerMarkPos;
  *((_DWORD *)v4 + 11) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_curatedCollectionContext)
    objc_msgSend(v4, "setCuratedCollectionContext:");
  if (self->_curatedCollectionCorrections)
    objc_msgSend(v4, "setCuratedCollectionCorrections:");

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
    -[GEORPCuratedCollectionFeedback readAll:](self, "readAll:", 0);
    v8 = -[GEORPCuratedCollectionContext copyWithZone:](self->_curatedCollectionContext, "copyWithZone:", a3);
    v9 = *(void **)(v5 + 24);
    *(_QWORD *)(v5 + 24) = v8;

    v10 = -[GEORPCuratedCollectionCorrections copyWithZone:](self->_curatedCollectionCorrections, "copyWithZone:", a3);
    v11 = *(void **)(v5 + 32);
    *(_QWORD *)(v5 + 32) = v10;

    objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
    return (id)v5;
  }
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  GEORPCuratedCollectionFeedbackReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  GEORPCuratedCollectionContext *curatedCollectionContext;
  GEORPCuratedCollectionCorrections *curatedCollectionCorrections;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((-[GEORPCuratedCollectionFeedback readAll:](self, "readAll:", 1),
         objc_msgSend(v4, "readAll:", 1),
         curatedCollectionContext = self->_curatedCollectionContext,
         !((unint64_t)curatedCollectionContext | v4[3]))
     || -[GEORPCuratedCollectionContext isEqual:](curatedCollectionContext, "isEqual:")))
  {
    curatedCollectionCorrections = self->_curatedCollectionCorrections;
    if ((unint64_t)curatedCollectionCorrections | v4[4])
      v7 = -[GEORPCuratedCollectionCorrections isEqual:](curatedCollectionCorrections, "isEqual:");
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

  -[GEORPCuratedCollectionFeedback readAll:](self, "readAll:", 1);
  v3 = -[GEORPCuratedCollectionContext hash](self->_curatedCollectionContext, "hash");
  return -[GEORPCuratedCollectionCorrections hash](self->_curatedCollectionCorrections, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  GEORPCuratedCollectionContext *curatedCollectionContext;
  uint64_t v5;
  GEORPCuratedCollectionCorrections *curatedCollectionCorrections;
  uint64_t v7;
  _QWORD *v8;

  v8 = a3;
  objc_msgSend(v8, "readAll:", 0);
  curatedCollectionContext = self->_curatedCollectionContext;
  v5 = v8[3];
  if (curatedCollectionContext)
  {
    if (v5)
      -[GEORPCuratedCollectionContext mergeFrom:](curatedCollectionContext, "mergeFrom:");
  }
  else if (v5)
  {
    -[GEORPCuratedCollectionFeedback setCuratedCollectionContext:](self, "setCuratedCollectionContext:");
  }
  curatedCollectionCorrections = self->_curatedCollectionCorrections;
  v7 = v8[4];
  if (curatedCollectionCorrections)
  {
    if (v7)
      -[GEORPCuratedCollectionCorrections mergeFrom:](curatedCollectionCorrections, "mergeFrom:");
  }
  else if (v7)
  {
    -[GEORPCuratedCollectionFeedback setCuratedCollectionCorrections:](self, "setCuratedCollectionCorrections:");
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
      GEORPCuratedCollectionFeedbackReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_517);
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
    -[GEORPCuratedCollectionFeedback readAll:](self, "readAll:", 0);
    -[GEORPCuratedCollectionContext clearUnknownFields:](self->_curatedCollectionContext, "clearUnknownFields:", 1);
    -[GEORPCuratedCollectionCorrections clearUnknownFields:](self->_curatedCollectionCorrections, "clearUnknownFields:", 1);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_curatedCollectionCorrections, 0);
  objc_storeStrong((id *)&self->_curatedCollectionContext, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
