@implementation GEORPTransitLineTileInfo

- (GEORPTransitLineTileInfo)init
{
  GEORPTransitLineTileInfo *v2;
  GEORPTransitLineTileInfo *v3;
  GEORPTransitLineTileInfo *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEORPTransitLineTileInfo;
  v2 = -[GEORPTransitLineTileInfo init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPTransitLineTileInfo)initWithData:(id)a3
{
  GEORPTransitLineTileInfo *v3;
  GEORPTransitLineTileInfo *v4;
  GEORPTransitLineTileInfo *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEORPTransitLineTileInfo;
  v3 = -[GEORPTransitLineTileInfo initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (unint64_t)transitLineMuid
{
  return self->_transitLineMuid;
}

- (void)setTransitLineMuid:(unint64_t)a3
{
  *(_BYTE *)&self->_flags |= 9u;
  self->_transitLineMuid = a3;
}

- (void)setHasTransitLineMuid:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3 | 8;
}

- (BOOL)hasTransitLineMuid
{
  return *(_BYTE *)&self->_flags & 1;
}

- (void)_readTransitLineName
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
        GEORPTransitLineTileInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTransitLineName_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasTransitLineName
{
  -[GEORPTransitLineTileInfo _readTransitLineName]((uint64_t)self);
  return self->_transitLineName != 0;
}

- (NSString)transitLineName
{
  -[GEORPTransitLineTileInfo _readTransitLineName]((uint64_t)self);
  return self->_transitLineName;
}

- (void)setTransitLineName:(id)a3
{
  *(_BYTE *)&self->_flags |= 0xAu;
  objc_storeStrong((id *)&self->_transitLineName, a3);
}

- (void)_readTransitSystemName
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
        GEORPTransitLineTileInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTransitSystemName_tags_1);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasTransitSystemName
{
  -[GEORPTransitLineTileInfo _readTransitSystemName]((uint64_t)self);
  return self->_transitSystemName != 0;
}

- (NSString)transitSystemName
{
  -[GEORPTransitLineTileInfo _readTransitSystemName]((uint64_t)self);
  return self->_transitSystemName;
}

- (void)setTransitSystemName:(id)a3
{
  *(_BYTE *)&self->_flags |= 0xCu;
  objc_storeStrong((id *)&self->_transitSystemName, a3);
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
  v8.super_class = (Class)GEORPTransitLineTileInfo;
  -[GEORPTransitLineTileInfo description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORPTransitLineTileInfo dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPTransitLineTileInfo _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  const __CFString *v10;

  if (a1)
  {
    objc_msgSend((id)a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((*(_BYTE *)(a1 + 52) & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 16));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
        v6 = CFSTR("transitLineMuid");
      else
        v6 = CFSTR("transit_line_muid");
      objc_msgSend(v4, "setObject:forKey:", v5, v6);

    }
    objc_msgSend((id)a1, "transitLineName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      if (a2)
        v8 = CFSTR("transitLineName");
      else
        v8 = CFSTR("transit_line_name");
      objc_msgSend(v4, "setObject:forKey:", v7, v8);
    }

    objc_msgSend((id)a1, "transitSystemName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      if (a2)
        v10 = CFSTR("transitSystemName");
      else
        v10 = CFSTR("transit_system_name");
      objc_msgSend(v4, "setObject:forKey:", v9, v10);
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
  return -[GEORPTransitLineTileInfo _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEORPTransitLineTileInfo)initWithDictionary:(id)a3
{
  return (GEORPTransitLineTileInfo *)-[GEORPTransitLineTileInfo _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("transitLineMuid");
      else
        v6 = CFSTR("transit_line_muid");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setTransitLineMuid:", objc_msgSend(v7, "unsignedLongLongValue"));

      if (a3)
        v8 = CFSTR("transitLineName");
      else
        v8 = CFSTR("transit_line_name");
      objc_msgSend(v5, "objectForKeyedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v10 = (void *)objc_msgSend(v9, "copy");
        objc_msgSend(a1, "setTransitLineName:", v10);

      }
      if (a3)
        v11 = CFSTR("transitSystemName");
      else
        v11 = CFSTR("transit_system_name");
      objc_msgSend(v5, "objectForKeyedSubscript:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v13 = (void *)objc_msgSend(v12, "copy");
        objc_msgSend(a1, "setTransitSystemName:", v13);

      }
    }
  }

  return a1;
}

- (GEORPTransitLineTileInfo)initWithJSON:(id)a3
{
  return (GEORPTransitLineTileInfo *)-[GEORPTransitLineTileInfo _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_2783;
    else
      v8 = (int *)&readAll__nonRecursiveTag_2784;
    GEORPTransitLineTileInfoReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPTransitLineTileInfoIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPTransitLineTileInfoReadAllFrom((uint64_t)self, a3, 0);
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
    -[GEORPTransitLineTileInfo readAll:](self, "readAll:", 0);
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      PBDataWriterWriteUint64Field();
    if (self->_transitLineName)
      PBDataWriterWriteStringField();
    if (self->_transitSystemName)
      PBDataWriterWriteStringField();
  }

}

- (void)copyTo:(id)a3
{
  id *v4;
  id *v5;

  v5 = (id *)a3;
  -[GEORPTransitLineTileInfo readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 10) = self->_readerMarkPos;
  *((_DWORD *)v5 + 11) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  v4 = v5;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    v5[2] = (id)self->_transitLineMuid;
    *((_BYTE *)v5 + 52) |= 1u;
  }
  if (self->_transitLineName)
  {
    objc_msgSend(v5, "setTransitLineName:");
    v4 = v5;
  }
  if (self->_transitSystemName)
  {
    objc_msgSend(v5, "setTransitSystemName:");
    v4 = v5;
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
      GEORPTransitLineTileInfoReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_8;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEORPTransitLineTileInfo readAll:](self, "readAll:", 0);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_QWORD *)(v5 + 16) = self->_transitLineMuid;
    *(_BYTE *)(v5 + 52) |= 1u;
  }
  v9 = -[NSString copyWithZone:](self->_transitLineName, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v9;

  v11 = -[NSString copyWithZone:](self->_transitSystemName, "copyWithZone:", a3);
  v8 = *(id *)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v11;
LABEL_8:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *transitLineName;
  NSString *transitSystemName;
  char v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_11;
  -[GEORPTransitLineTileInfo readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 1) == 0 || self->_transitLineMuid != *((_QWORD *)v4 + 2))
      goto LABEL_11;
  }
  else if ((*((_BYTE *)v4 + 52) & 1) != 0)
  {
LABEL_11:
    v7 = 0;
    goto LABEL_12;
  }
  transitLineName = self->_transitLineName;
  if ((unint64_t)transitLineName | *((_QWORD *)v4 + 3)
    && !-[NSString isEqual:](transitLineName, "isEqual:"))
  {
    goto LABEL_11;
  }
  transitSystemName = self->_transitSystemName;
  if ((unint64_t)transitSystemName | *((_QWORD *)v4 + 4))
    v7 = -[NSString isEqual:](transitSystemName, "isEqual:");
  else
    v7 = 1;
LABEL_12:

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;

  -[GEORPTransitLineTileInfo readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v3 = 2654435761u * self->_transitLineMuid;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_transitLineName, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_transitSystemName, "hash");
}

- (void)mergeFrom:(id)a3
{
  unint64_t *v4;
  unint64_t *v5;

  v5 = (unint64_t *)a3;
  objc_msgSend(v5, "readAll:", 0);
  v4 = v5;
  if ((*((_BYTE *)v5 + 52) & 1) != 0)
  {
    self->_transitLineMuid = v5[2];
    *(_BYTE *)&self->_flags |= 1u;
  }
  if (v5[3])
  {
    -[GEORPTransitLineTileInfo setTransitLineName:](self, "setTransitLineName:");
    v4 = v5;
  }
  if (v4[4])
  {
    -[GEORPTransitLineTileInfo setTransitSystemName:](self, "setTransitSystemName:");
    v4 = v5;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitSystemName, 0);
  objc_storeStrong((id *)&self->_transitLineName, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
