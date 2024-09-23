@implementation GEOPDSearchQueryDymMetadata

- (GEOPDSearchQueryDymMetadata)init
{
  GEOPDSearchQueryDymMetadata *v2;
  GEOPDSearchQueryDymMetadata *v3;
  GEOPDSearchQueryDymMetadata *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDSearchQueryDymMetadata;
  v2 = -[GEOPDSearchQueryDymMetadata init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDSearchQueryDymMetadata)initWithData:(id)a3
{
  GEOPDSearchQueryDymMetadata *v3;
  GEOPDSearchQueryDymMetadata *v4;
  GEOPDSearchQueryDymMetadata *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDSearchQueryDymMetadata;
  v3 = -[GEOPDSearchQueryDymMetadata initWithData:](&v7, sel_initWithData_, a3);
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
  v8.super_class = (Class)GEOPDSearchQueryDymMetadata;
  -[GEOPDSearchQueryDymMetadata description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDSearchQueryDymMetadata dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSearchQueryDymMetadata _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  uint64_t v5;
  __CFString *v6;
  void *v7;
  id v8;
  id v9;
  const __CFString *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  const __CFString *v16;

  if (a1)
  {
    -[GEOPDSearchQueryDymMetadata readAll:](a1, 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((*(_BYTE *)(a1 + 48) & 1) != 0)
    {
      v5 = *(int *)(a1 + 44);
      if (v5 >= 4)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 44));
        v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v6 = off_1E1C0A718[v5];
      }
      objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("type"));

    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if ((*(_BYTE *)(a1 + 48) & 2) == 0)
    {
      v7 = *(void **)(a1 + 8);
      if (v7)
      {
        v8 = v7;
        objc_sync_enter(v8);
        GEOPDSearchQueryDymMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readOriginalQuery_tags);
        objc_sync_exit(v8);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
    v9 = *(id *)(a1 + 16);
    if (v9)
    {
      if (a2)
        v10 = CFSTR("originalQuery");
      else
        v10 = CFSTR("original_query");
      objc_msgSend(v4, "setObject:forKey:", v9, v10);
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if ((*(_BYTE *)(a1 + 48) & 4) == 0)
    {
      v11 = *(void **)(a1 + 8);
      if (v11)
      {
        v12 = v11;
        objc_sync_enter(v12);
        GEOPDSearchQueryDymMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSynonymMetadata_tags);
        objc_sync_exit(v12);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
    v13 = *(id *)(a1 + 24);
    v14 = v13;
    if (v13)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v13, "jsonRepresentation");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = CFSTR("synonymMetadata");
      }
      else
      {
        objc_msgSend(v13, "dictionaryRepresentation");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = CFSTR("synonym_metadata");
      }
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
  return -[GEOPDSearchQueryDymMetadata _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  void *v4;
  id v5;
  int *v6;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      v5 = v4;
      objc_sync_enter(v5);
      if (a2)
        v6 = (int *)&readAll__recursiveTag_962;
      else
        v6 = (int *)&readAll__nonRecursiveTag_963;
      GEOPDSearchQueryDymMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
      -[GEOPDSearchQuerySynonymMetadata readAll:](*(_QWORD *)(a1 + 24), 1);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSearchQueryDymMetadataReadAllFrom((uint64_t)self, a3, 0);
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
  if (self->_reader && !_GEOPDSearchQueryDymMetadataIsDirty((uint64_t)self))
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
    -[GEOPDSearchQueryDymMetadata readAll:]((uint64_t)self, 0);
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      PBDataWriterWriteInt32Field();
    if (self->_originalQuery)
      PBDataWriterWriteStringField();
    if (self->_synonymMetadata)
      PBDataWriterWriteSubmessage();
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

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_BYTE *)&self->_flags & 8) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOPDSearchQueryDymMetadataReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_8;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDSearchQueryDymMetadata readAll:]((uint64_t)self, 0);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 44) = self->_type;
    *(_BYTE *)(v5 + 48) |= 1u;
  }
  v9 = -[NSString copyWithZone:](self->_originalQuery, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v9;

  v11 = -[GEOPDSearchQuerySynonymMetadata copyWithZone:](self->_synonymMetadata, "copyWithZone:", a3);
  v8 = *(id *)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v11;
LABEL_8:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *originalQuery;
  GEOPDSearchQuerySynonymMetadata *synonymMetadata;
  char v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_11;
  -[GEOPDSearchQueryDymMetadata readAll:]((uint64_t)self, 1);
  -[GEOPDSearchQueryDymMetadata readAll:]((uint64_t)v4, 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 1) == 0 || self->_type != *((_DWORD *)v4 + 11))
      goto LABEL_11;
  }
  else if ((*((_BYTE *)v4 + 48) & 1) != 0)
  {
LABEL_11:
    v7 = 0;
    goto LABEL_12;
  }
  originalQuery = self->_originalQuery;
  if ((unint64_t)originalQuery | *((_QWORD *)v4 + 2)
    && !-[NSString isEqual:](originalQuery, "isEqual:"))
  {
    goto LABEL_11;
  }
  synonymMetadata = self->_synonymMetadata;
  if ((unint64_t)synonymMetadata | *((_QWORD *)v4 + 3))
    v7 = -[GEOPDSearchQuerySynonymMetadata isEqual:](synonymMetadata, "isEqual:");
  else
    v7 = 1;
LABEL_12:

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;

  -[GEOPDSearchQueryDymMetadata readAll:]((uint64_t)self, 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v3 = 2654435761 * self->_type;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_originalQuery, "hash") ^ v3;
  return v4 ^ -[GEOPDSearchQuerySynonymMetadata hash](self->_synonymMetadata, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_synonymMetadata, 0);
  objc_storeStrong((id *)&self->_originalQuery, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
