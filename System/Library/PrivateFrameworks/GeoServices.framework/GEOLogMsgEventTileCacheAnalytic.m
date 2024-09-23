@implementation GEOLogMsgEventTileCacheAnalytic

- (GEOLogMsgEventTileCacheAnalytic)init
{
  GEOLogMsgEventTileCacheAnalytic *v2;
  GEOLogMsgEventTileCacheAnalytic *v3;
  GEOLogMsgEventTileCacheAnalytic *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOLogMsgEventTileCacheAnalytic;
  v2 = -[GEOLogMsgEventTileCacheAnalytic init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOLogMsgEventTileCacheAnalytic)initWithData:(id)a3
{
  GEOLogMsgEventTileCacheAnalytic *v3;
  GEOLogMsgEventTileCacheAnalytic *v4;
  GEOLogMsgEventTileCacheAnalytic *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOLogMsgEventTileCacheAnalytic;
  v3 = -[GEOLogMsgEventTileCacheAnalytic initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readCacheHit
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if ((*(_BYTE *)(a1 + 44) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventTileCacheAnalyticReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCacheHit_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (BOOL)hasCacheHit
{
  -[GEOLogMsgEventTileCacheAnalytic _readCacheHit]((uint64_t)self);
  return self->_cacheHit != 0;
}

- (GEOCacheHit)cacheHit
{
  -[GEOLogMsgEventTileCacheAnalytic _readCacheHit]((uint64_t)self);
  return self->_cacheHit;
}

- (void)setCacheHit:(id)a3
{
  *(_BYTE *)&self->_flags |= 5u;
  objc_storeStrong((id *)&self->_cacheHit, a3);
}

- (void)_readCacheMiss
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if ((*(_BYTE *)(a1 + 44) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventTileCacheAnalyticReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCacheMiss_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (BOOL)hasCacheMiss
{
  -[GEOLogMsgEventTileCacheAnalytic _readCacheMiss]((uint64_t)self);
  return self->_cacheMiss != 0;
}

- (GEOCacheMiss)cacheMiss
{
  -[GEOLogMsgEventTileCacheAnalytic _readCacheMiss]((uint64_t)self);
  return self->_cacheMiss;
}

- (void)setCacheMiss:(id)a3
{
  *(_BYTE *)&self->_flags |= 6u;
  objc_storeStrong((id *)&self->_cacheMiss, a3);
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
  v8.super_class = (Class)GEOLogMsgEventTileCacheAnalytic;
  -[GEOLogMsgEventTileCacheAnalytic description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOLogMsgEventTileCacheAnalytic dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgEventTileCacheAnalytic _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(void *)a1
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

  if (a1)
  {
    objc_msgSend(a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "cacheHit");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v5, "jsonRepresentation");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = CFSTR("cacheHit");
      }
      else
      {
        objc_msgSend(v5, "dictionaryRepresentation");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = CFSTR("cache_hit");
      }
      objc_msgSend(v4, "setObject:forKey:", v7, v8);

    }
    objc_msgSend(a1, "cacheMiss");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v9, "jsonRepresentation");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = CFSTR("cacheMiss");
      }
      else
      {
        objc_msgSend(v9, "dictionaryRepresentation");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = CFSTR("cache_miss");
      }
      objc_msgSend(v4, "setObject:forKey:", v11, v12);

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
  return -[GEOLogMsgEventTileCacheAnalytic _dictionaryRepresentation:](self, 1);
}

- (GEOLogMsgEventTileCacheAnalytic)initWithDictionary:(id)a3
{
  return (GEOLogMsgEventTileCacheAnalytic *)-[GEOLogMsgEventTileCacheAnalytic _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  GEOCacheHit *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  GEOCacheMiss *v13;
  uint64_t v14;
  void *v15;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("cacheHit");
      else
        v6 = CFSTR("cache_hit");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = [GEOCacheHit alloc];
        if ((a3 & 1) != 0)
          v9 = -[GEOCacheHit initWithJSON:](v8, "initWithJSON:", v7);
        else
          v9 = -[GEOCacheHit initWithDictionary:](v8, "initWithDictionary:", v7);
        v10 = (void *)v9;
        objc_msgSend(a1, "setCacheHit:", v9);

      }
      if (a3)
        v11 = CFSTR("cacheMiss");
      else
        v11 = CFSTR("cache_miss");
      objc_msgSend(v5, "objectForKeyedSubscript:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v13 = [GEOCacheMiss alloc];
        if ((a3 & 1) != 0)
          v14 = -[GEOCacheMiss initWithJSON:](v13, "initWithJSON:", v12);
        else
          v14 = -[GEOCacheMiss initWithDictionary:](v13, "initWithDictionary:", v12);
        v15 = (void *)v14;
        objc_msgSend(a1, "setCacheMiss:", v14);

      }
    }
  }

  return a1;
}

- (GEOLogMsgEventTileCacheAnalytic)initWithJSON:(id)a3
{
  return (GEOLogMsgEventTileCacheAnalytic *)-[GEOLogMsgEventTileCacheAnalytic _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_4256;
    else
      v8 = (int *)&readAll__nonRecursiveTag_4257;
    GEOLogMsgEventTileCacheAnalyticReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
  {
    -[GEOCacheHit readAll:](self->_cacheHit, "readAll:", 1);
    -[GEOCacheMiss readAll:](self->_cacheMiss, "readAll:", 1);
  }
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgEventTileCacheAnalyticIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgEventTileCacheAnalyticReadAllFrom((uint64_t)self, a3, 0);
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
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_BYTE *)&self->_flags & 7) == 0))
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
    -[GEOLogMsgEventTileCacheAnalytic readAll:](self, "readAll:", 0);
    if (self->_cacheHit)
      PBDataWriterWriteSubmessage();
    if (self->_cacheMiss)
      PBDataWriterWriteSubmessage();
  }

}

- (void)copyTo:(id)a3
{
  id *v4;

  v4 = (id *)a3;
  -[GEOLogMsgEventTileCacheAnalytic readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v4 + 1, self->_reader);
  *((_DWORD *)v4 + 8) = self->_readerMarkPos;
  *((_DWORD *)v4 + 9) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_cacheHit)
    objc_msgSend(v4, "setCacheHit:");
  if (self->_cacheMiss)
    objc_msgSend(v4, "setCacheMiss:");

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  void *v9;
  id v10;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
    goto LABEL_5;
  v7 = reader;
  objc_sync_enter(v7);
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    objc_sync_exit(v7);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOLogMsgEventTileCacheAnalytic readAll:](self, "readAll:", 0);
    v8 = -[GEOCacheHit copyWithZone:](self->_cacheHit, "copyWithZone:", a3);
    v9 = (void *)v5[2];
    v5[2] = v8;

    v10 = -[GEOCacheMiss copyWithZone:](self->_cacheMiss, "copyWithZone:", a3);
    v7 = (PBDataReader *)v5[3];
    v5[3] = v10;
    goto LABEL_6;
  }
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  GEOLogMsgEventTileCacheAnalyticReadAllFrom((uint64_t)v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);
LABEL_6:

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  GEOCacheHit *cacheHit;
  GEOCacheMiss *cacheMiss;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((-[GEOLogMsgEventTileCacheAnalytic readAll:](self, "readAll:", 1),
         objc_msgSend(v4, "readAll:", 1),
         cacheHit = self->_cacheHit,
         !((unint64_t)cacheHit | v4[2]))
     || -[GEOCacheHit isEqual:](cacheHit, "isEqual:")))
  {
    cacheMiss = self->_cacheMiss;
    if ((unint64_t)cacheMiss | v4[3])
      v7 = -[GEOCacheMiss isEqual:](cacheMiss, "isEqual:");
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

  -[GEOLogMsgEventTileCacheAnalytic readAll:](self, "readAll:", 1);
  v3 = -[GEOCacheHit hash](self->_cacheHit, "hash");
  return -[GEOCacheMiss hash](self->_cacheMiss, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  GEOCacheHit *cacheHit;
  uint64_t v5;
  GEOCacheMiss *cacheMiss;
  uint64_t v7;
  _QWORD *v8;

  v8 = a3;
  objc_msgSend(v8, "readAll:", 0);
  cacheHit = self->_cacheHit;
  v5 = v8[2];
  if (cacheHit)
  {
    if (v5)
      -[GEOCacheHit mergeFrom:](cacheHit, "mergeFrom:");
  }
  else if (v5)
  {
    -[GEOLogMsgEventTileCacheAnalytic setCacheHit:](self, "setCacheHit:");
  }
  cacheMiss = self->_cacheMiss;
  v7 = v8[3];
  if (cacheMiss)
  {
    if (v7)
      -[GEOCacheMiss mergeFrom:](cacheMiss, "mergeFrom:");
  }
  else if (v7)
  {
    -[GEOLogMsgEventTileCacheAnalytic setCacheMiss:](self, "setCacheMiss:");
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheMiss, 0);
  objc_storeStrong((id *)&self->_cacheHit, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
