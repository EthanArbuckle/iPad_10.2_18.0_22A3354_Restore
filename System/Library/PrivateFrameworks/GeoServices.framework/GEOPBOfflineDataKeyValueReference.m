@implementation GEOPBOfflineDataKeyValueReference

- (GEOPBOfflineDataKeyValueReference)init
{
  GEOPBOfflineDataKeyValueReference *v2;
  GEOPBOfflineDataKeyValueReference *v3;
  GEOPBOfflineDataKeyValueReference *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPBOfflineDataKeyValueReference;
  v2 = -[GEOPBOfflineDataKeyValueReference init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPBOfflineDataKeyValueReference)initWithData:(id)a3
{
  GEOPBOfflineDataKeyValueReference *v3;
  GEOPBOfflineDataKeyValueReference *v4;
  GEOPBOfflineDataKeyValueReference *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPBOfflineDataKeyValueReference;
  v3 = -[GEOPBOfflineDataKeyValueReference initWithData:](&v7, sel_initWithData_, a3);
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
  v8.super_class = (Class)GEOPBOfflineDataKeyValueReference;
  -[GEOPBOfflineDataKeyValueReference description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPBOfflineDataKeyValueReference dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPBOfflineDataKeyValueReference _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  char v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  const __CFString *v17;

  if (a1)
  {
    -[GEOPBOfflineDataKeyValueReference readAll:](a1, 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_BYTE *)(a1 + 60) & 4) == 0)
    {
      v5 = *(void **)(a1 + 8);
      if (v5)
      {
        v6 = v5;
        objc_sync_enter(v6);
        GEOPBOfflineDataKeyValueReferenceReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readServiceKey_tags);
        objc_sync_exit(v6);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
    v7 = *(id *)(a1 + 16);
    v8 = v7;
    if (v7)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v7, "base64EncodedStringWithOptions:", 0);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("serviceKey"));

      }
      else
      {
        objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("service_key"));
      }
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_BYTE *)(a1 + 60) & 8) == 0)
    {
      v10 = *(void **)(a1 + 8);
      if (v10)
      {
        v11 = v10;
        objc_sync_enter(v11);
        GEOPBOfflineDataKeyValueReferenceReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readUrl_tags_217);
        objc_sync_exit(v11);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
    v12 = *(id *)(a1 + 24);
    if (v12)
      objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("url"));

    v13 = *(_BYTE *)(a1 + 60);
    if ((v13 & 2) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 40));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
        v15 = CFSTR("valueSizeBytes");
      else
        v15 = CFSTR("value_size_bytes");
      objc_msgSend(v4, "setObject:forKey:", v14, v15);

      v13 = *(_BYTE *)(a1 + 60);
    }
    if ((v13 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 32));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
        v17 = CFSTR("valueCompressedSizeBytes");
      else
        v17 = CFSTR("value_compressed_size_bytes");
      objc_msgSend(v4, "setObject:forKey:", v16, v17);

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
  return -[GEOPBOfflineDataKeyValueReference _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  void *v4;
  id v5;
  int *v6;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      v5 = v4;
      objc_sync_enter(v5);
      if (a2)
        v6 = (int *)&readAll__recursiveTag_230_0;
      else
        v6 = (int *)&readAll__nonRecursiveTag_231_0;
      GEOPBOfflineDataKeyValueReferenceReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)readFrom:(id)a3
{
  return GEOPBOfflineDataKeyValueReferenceReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  char flags;
  PBDataReader *v6;
  void *v7;
  id v8;

  v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_BYTE *)&self->_flags & 0x1C) == 0))
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
    -[GEOPBOfflineDataKeyValueReference readAll:]((uint64_t)self, 0);
    if (self->_serviceKey)
      PBDataWriterWriteDataField();
    if (self->_url)
      PBDataWriterWriteStringField();
    flags = (char)self->_flags;
    if ((flags & 2) != 0)
    {
      PBDataWriterWriteUint64Field();
      flags = (char)self->_flags;
    }
    if ((flags & 1) != 0)
      PBDataWriterWriteUint64Field();
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
  char flags;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_BYTE *)&self->_flags & 0x10) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOPBOfflineDataKeyValueReferenceReadAllFrom(v5, self->_reader);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPBOfflineDataKeyValueReference readAll:]((uint64_t)self, 0);
  v9 = -[NSData copyWithZone:](self->_serviceKey, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v9;

  v11 = -[NSString copyWithZone:](self->_url, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v11;

  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *(_QWORD *)(v5 + 40) = self->_valueSizeBytes;
    *(_BYTE *)(v5 + 60) |= 2u;
    flags = (char)self->_flags;
  }
  if ((flags & 1) != 0)
  {
    *(_QWORD *)(v5 + 32) = self->_valueCompressedSizeBytes;
    *(_BYTE *)(v5 + 60) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSData *serviceKey;
  NSString *url;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_15;
  -[GEOPBOfflineDataKeyValueReference readAll:]((uint64_t)self, 1);
  -[GEOPBOfflineDataKeyValueReference readAll:]((uint64_t)v4, 1);
  serviceKey = self->_serviceKey;
  if ((unint64_t)serviceKey | *((_QWORD *)v4 + 2))
  {
    if (!-[NSData isEqual:](serviceKey, "isEqual:"))
      goto LABEL_15;
  }
  url = self->_url;
  if ((unint64_t)url | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](url, "isEqual:"))
      goto LABEL_15;
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 2) == 0 || self->_valueSizeBytes != *((_QWORD *)v4 + 5))
      goto LABEL_15;
  }
  else if ((*((_BYTE *)v4 + 60) & 2) != 0)
  {
LABEL_15:
    v7 = 0;
    goto LABEL_16;
  }
  v7 = (*((_BYTE *)v4 + 60) & 1) == 0;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 1) == 0 || self->_valueCompressedSizeBytes != *((_QWORD *)v4 + 4))
      goto LABEL_15;
    v7 = 1;
  }
LABEL_16:

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  unint64_t v5;
  unint64_t v6;

  -[GEOPBOfflineDataKeyValueReference readAll:]((uint64_t)self, 1);
  v3 = -[NSData hash](self->_serviceKey, "hash");
  v4 = -[NSString hash](self->_url, "hash");
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    v5 = 2654435761u * self->_valueSizeBytes;
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      goto LABEL_3;
LABEL_5:
    v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6;
  }
  v5 = 0;
  if ((*(_BYTE *)&self->_flags & 1) == 0)
    goto LABEL_5;
LABEL_3:
  v6 = 2654435761u * self->_valueCompressedSizeBytes;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_serviceKey, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
