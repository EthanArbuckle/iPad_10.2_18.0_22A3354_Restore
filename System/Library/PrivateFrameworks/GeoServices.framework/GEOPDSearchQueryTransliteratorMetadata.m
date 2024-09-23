@implementation GEOPDSearchQueryTransliteratorMetadata

- (GEOPDSearchQueryTransliteratorMetadata)init
{
  GEOPDSearchQueryTransliteratorMetadata *v2;
  GEOPDSearchQueryTransliteratorMetadata *v3;
  GEOPDSearchQueryTransliteratorMetadata *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDSearchQueryTransliteratorMetadata;
  v2 = -[GEOPDSearchQueryTransliteratorMetadata init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDSearchQueryTransliteratorMetadata)initWithData:(id)a3
{
  GEOPDSearchQueryTransliteratorMetadata *v3;
  GEOPDSearchQueryTransliteratorMetadata *v4;
  GEOPDSearchQueryTransliteratorMetadata *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDSearchQueryTransliteratorMetadata;
  v3 = -[GEOPDSearchQueryTransliteratorMetadata initWithData:](&v7, sel_initWithData_, a3);
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
  v8.super_class = (Class)GEOPDSearchQueryTransliteratorMetadata;
  -[GEOPDSearchQueryTransliteratorMetadata description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDSearchQueryTransliteratorMetadata dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSearchQueryTransliteratorMetadata _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  const __CFString *v11;
  uint64_t v12;
  __CFString *v13;
  const __CFString *v14;

  if (a1)
  {
    -[GEOPDSearchQueryTransliteratorMetadata readAll:](a1, 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if ((*(_BYTE *)(a1 + 48) & 4) == 0)
    {
      v5 = *(void **)(a1 + 8);
      if (v5)
      {
        v6 = v5;
        objc_sync_enter(v6);
        GEOPDSearchQueryTransliteratorMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readReading_tags);
        objc_sync_exit(v6);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
    v7 = *(id *)(a1 + 24);
    if (v7)
      objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("reading"));

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if ((*(_BYTE *)(a1 + 48) & 2) == 0)
    {
      v8 = *(void **)(a1 + 8);
      if (v8)
      {
        v9 = v8;
        objc_sync_enter(v9);
        GEOPDSearchQueryTransliteratorMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readParentQuery_tags);
        objc_sync_exit(v9);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
    v10 = *(id *)(a1 + 16);
    if (v10)
    {
      if (a2)
        v11 = CFSTR("parentQuery");
      else
        v11 = CFSTR("parent_query");
      objc_msgSend(v4, "setObject:forKey:", v10, v11);
    }

    if ((*(_BYTE *)(a1 + 48) & 1) != 0)
    {
      v12 = *(int *)(a1 + 44);
      if (v12 >= 3)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 44));
        v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v13 = off_1E1C0A948[v12];
      }
      if (a2)
        v14 = CFSTR("transliteratorSource");
      else
        v14 = CFSTR("transliterator_source");
      objc_msgSend(v4, "setObject:forKey:", v13, v14);

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
  return -[GEOPDSearchQueryTransliteratorMetadata _dictionaryRepresentation:]((uint64_t)self, 1);
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
        v6 = (int *)&readAll__recursiveTag_1639;
      else
        v6 = (int *)&readAll__nonRecursiveTag_1640;
      GEOPDSearchQueryTransliteratorMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSearchQueryTransliteratorMetadataReadAllFrom((uint64_t)self, a3, 0);
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
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_BYTE *)&self->_flags & 0xE) == 0))
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
    -[GEOPDSearchQueryTransliteratorMetadata readAll:]((uint64_t)self, 0);
    if (self->_reading)
      PBDataWriterWriteStringField();
    if (self->_parentQuery)
      PBDataWriterWriteStringField();
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      PBDataWriterWriteInt32Field();
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
  uint64_t v11;
  void *v12;

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
      GEOPDSearchQueryTransliteratorMetadataReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDSearchQueryTransliteratorMetadata readAll:]((uint64_t)self, 0);
  v9 = -[NSString copyWithZone:](self->_reading, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v9;

  v11 = -[NSString copyWithZone:](self->_parentQuery, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v11;

  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 44) = self->_transliteratorSource;
    *(_BYTE *)(v5 + 48) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *reading;
  NSString *parentQuery;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_10;
  -[GEOPDSearchQueryTransliteratorMetadata readAll:]((uint64_t)self, 1);
  -[GEOPDSearchQueryTransliteratorMetadata readAll:]((uint64_t)v4, 1);
  reading = self->_reading;
  if ((unint64_t)reading | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](reading, "isEqual:"))
      goto LABEL_10;
  }
  parentQuery = self->_parentQuery;
  if ((unint64_t)parentQuery | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](parentQuery, "isEqual:"))
      goto LABEL_10;
  }
  v7 = (*((_BYTE *)v4 + 48) & 1) == 0;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 1) != 0 && self->_transliteratorSource == *((_DWORD *)v4 + 11))
    {
      v7 = 1;
      goto LABEL_11;
    }
LABEL_10:
    v7 = 0;
  }
LABEL_11:

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  uint64_t v5;

  -[GEOPDSearchQueryTransliteratorMetadata readAll:]((uint64_t)self, 1);
  v3 = -[NSString hash](self->_reading, "hash");
  v4 = -[NSString hash](self->_parentQuery, "hash");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v5 = 2654435761 * self->_transliteratorSource;
  else
    v5 = 0;
  return v4 ^ v3 ^ v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reading, 0);
  objc_storeStrong((id *)&self->_parentQuery, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
