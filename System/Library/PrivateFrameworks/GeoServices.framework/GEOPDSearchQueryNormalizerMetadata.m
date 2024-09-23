@implementation GEOPDSearchQueryNormalizerMetadata

- (GEOPDSearchQueryNormalizerMetadata)init
{
  GEOPDSearchQueryNormalizerMetadata *v2;
  GEOPDSearchQueryNormalizerMetadata *v3;
  GEOPDSearchQueryNormalizerMetadata *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDSearchQueryNormalizerMetadata;
  v2 = -[GEOPDSearchQueryNormalizerMetadata init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDSearchQueryNormalizerMetadata)initWithData:(id)a3
{
  GEOPDSearchQueryNormalizerMetadata *v3;
  GEOPDSearchQueryNormalizerMetadata *v4;
  GEOPDSearchQueryNormalizerMetadata *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDSearchQueryNormalizerMetadata;
  v3 = -[GEOPDSearchQueryNormalizerMetadata initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
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
  v8.super_class = (Class)GEOPDSearchQueryNormalizerMetadata;
  -[GEOPDSearchQueryNormalizerMetadata description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDSearchQueryNormalizerMetadata dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSearchQueryNormalizerMetadata _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  const __CFString *v8;
  void *v9;
  id v10;
  id v11;
  const __CFString *v12;
  void *v13;
  id v14;
  id v15;
  const __CFString *v16;

  if (a1)
  {
    -[GEOPDSearchQueryNormalizerMetadata readAll:](a1, 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(_BYTE *)(a1 + 52) & 4) == 0)
    {
      v5 = *(void **)(a1 + 8);
      if (v5)
      {
        v6 = v5;
        objc_sync_enter(v6);
        GEOPDSearchQueryNormalizerMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readOriginalQuery_tags_1404);
        objc_sync_exit(v6);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
    v7 = *(id *)(a1 + 32);
    if (v7)
    {
      if (a2)
        v8 = CFSTR("originalQuery");
      else
        v8 = CFSTR("original_query");
      objc_msgSend(v4, "setObject:forKey:", v7, v8);
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(_BYTE *)(a1 + 52) & 1) == 0)
    {
      v9 = *(void **)(a1 + 8);
      if (v9)
      {
        v10 = v9;
        objc_sync_enter(v10);
        GEOPDSearchQueryNormalizerMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readNormalizedQuery_tags);
        objc_sync_exit(v10);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
    v11 = *(id *)(a1 + 16);
    if (v11)
    {
      if (a2)
        v12 = CFSTR("normalizedQuery");
      else
        v12 = CFSTR("normalized_query");
      objc_msgSend(v4, "setObject:forKey:", v11, v12);
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(_BYTE *)(a1 + 52) & 2) == 0)
    {
      v13 = *(void **)(a1 + 8);
      if (v13)
      {
        v14 = v13;
        objc_sync_enter(v14);
        GEOPDSearchQueryNormalizerMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readNormalizerName_tags);
        objc_sync_exit(v14);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
    v15 = *(id *)(a1 + 24);
    if (v15)
    {
      if (a2)
        v16 = CFSTR("normalizerName");
      else
        v16 = CFSTR("normalizer_name");
      objc_msgSend(v4, "setObject:forKey:", v15, v16);
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
  return -[GEOPDSearchQueryNormalizerMetadata _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  void *v4;
  id v5;
  int *v6;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      v5 = v4;
      objc_sync_enter(v5);
      if (a2)
        v6 = (int *)&readAll__recursiveTag_1413;
      else
        v6 = (int *)&readAll__nonRecursiveTag_1414;
      GEOPDSearchQueryNormalizerMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSearchQueryNormalizerMetadataReadAllFrom((uint64_t)self, a3, 0);
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
    -[GEOPDSearchQueryNormalizerMetadata readAll:]((uint64_t)self, 0);
    if (self->_originalQuery)
      PBDataWriterWriteStringField();
    if (self->_normalizedQuery)
      PBDataWriterWriteStringField();
    if (self->_normalizerName)
      PBDataWriterWriteStringField();
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
  uint64_t v12;

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
    -[GEOPDSearchQueryNormalizerMetadata readAll:]((uint64_t)self, 0);
    v8 = -[NSString copyWithZone:](self->_originalQuery, "copyWithZone:", a3);
    v9 = (void *)v5[4];
    v5[4] = v8;

    v10 = -[NSString copyWithZone:](self->_normalizedQuery, "copyWithZone:", a3);
    v11 = (void *)v5[2];
    v5[2] = v10;

    v12 = -[NSString copyWithZone:](self->_normalizerName, "copyWithZone:", a3);
    v7 = (PBDataReader *)v5[3];
    v5[3] = v12;
    goto LABEL_6;
  }
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  GEOPDSearchQueryNormalizerMetadataReadAllFrom((uint64_t)v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);
LABEL_6:

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *originalQuery;
  NSString *normalizedQuery;
  NSString *normalizerName;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((-[GEOPDSearchQueryNormalizerMetadata readAll:]((uint64_t)self, 1),
         -[GEOPDSearchQueryNormalizerMetadata readAll:]((uint64_t)v4, 1),
         originalQuery = self->_originalQuery,
         !((unint64_t)originalQuery | v4[4]))
     || -[NSString isEqual:](originalQuery, "isEqual:"))
    && ((normalizedQuery = self->_normalizedQuery, !((unint64_t)normalizedQuery | v4[2]))
     || -[NSString isEqual:](normalizedQuery, "isEqual:")))
  {
    normalizerName = self->_normalizerName;
    if ((unint64_t)normalizerName | v4[3])
      v8 = -[NSString isEqual:](normalizerName, "isEqual:");
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

  -[GEOPDSearchQueryNormalizerMetadata readAll:]((uint64_t)self, 1);
  v3 = -[NSString hash](self->_originalQuery, "hash");
  v4 = -[NSString hash](self->_normalizedQuery, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_normalizerName, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalQuery, 0);
  objc_storeStrong((id *)&self->_normalizerName, 0);
  objc_storeStrong((id *)&self->_normalizedQuery, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
