@implementation GEORPFeedbackTransitLine

- (GEORPFeedbackTransitLine)init
{
  GEORPFeedbackTransitLine *v2;
  GEORPFeedbackTransitLine *v3;
  GEORPFeedbackTransitLine *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEORPFeedbackTransitLine;
  v2 = -[GEORPFeedbackTransitLine init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPFeedbackTransitLine)initWithData:(id)a3
{
  GEORPFeedbackTransitLine *v3;
  GEORPFeedbackTransitLine *v4;
  GEORPFeedbackTransitLine *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEORPFeedbackTransitLine;
  v3 = -[GEORPFeedbackTransitLine initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readTransitLineMuid
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(_BYTE *)(a1 + 52) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackTransitLineReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTransitLineMuid_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasTransitLineMuid
{
  -[GEORPFeedbackTransitLine _readTransitLineMuid]((uint64_t)self);
  return self->_transitLineMuid != 0;
}

- (NSString)transitLineMuid
{
  -[GEORPFeedbackTransitLine _readTransitLineMuid]((uint64_t)self);
  return self->_transitLineMuid;
}

- (void)setTransitLineMuid:(id)a3
{
  *(_BYTE *)&self->_flags |= 9u;
  objc_storeStrong((id *)&self->_transitLineMuid, a3);
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
        GEORPFeedbackTransitLineReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTransitLineName_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasTransitLineName
{
  -[GEORPFeedbackTransitLine _readTransitLineName]((uint64_t)self);
  return self->_transitLineName != 0;
}

- (NSString)transitLineName
{
  -[GEORPFeedbackTransitLine _readTransitLineName]((uint64_t)self);
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
        GEORPFeedbackTransitLineReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTransitSystemName_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasTransitSystemName
{
  -[GEORPFeedbackTransitLine _readTransitSystemName]((uint64_t)self);
  return self->_transitSystemName != 0;
}

- (NSString)transitSystemName
{
  -[GEORPFeedbackTransitLine _readTransitSystemName]((uint64_t)self);
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
  v8.super_class = (Class)GEORPFeedbackTransitLine;
  -[GEORPFeedbackTransitLine description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORPFeedbackTransitLine dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPFeedbackTransitLine _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(void *)a1
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
    objc_msgSend(a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "transitLineMuid");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      if (a2)
        v6 = CFSTR("transitLineMuid");
      else
        v6 = CFSTR("transit_line_muid");
      objc_msgSend(v4, "setObject:forKey:", v5, v6);
    }

    objc_msgSend(a1, "transitLineName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      if (a2)
        v8 = CFSTR("transitLineName");
      else
        v8 = CFSTR("transit_line_name");
      objc_msgSend(v4, "setObject:forKey:", v7, v8);
    }

    objc_msgSend(a1, "transitSystemName");
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
  return -[GEORPFeedbackTransitLine _dictionaryRepresentation:](self, 1);
}

- (GEORPFeedbackTransitLine)initWithDictionary:(id)a3
{
  return (GEORPFeedbackTransitLine *)-[GEORPFeedbackTransitLine _initWithDictionary:isJSON:](self, a3, 0);
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
        v6 = CFSTR("transitLineMuid");
      else
        v6 = CFSTR("transit_line_muid");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = (void *)objc_msgSend(v7, "copy");
        objc_msgSend(a1, "setTransitLineMuid:", v8);

      }
      if (a3)
        v9 = CFSTR("transitLineName");
      else
        v9 = CFSTR("transit_line_name");
      objc_msgSend(v5, "objectForKeyedSubscript:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = (void *)objc_msgSend(v10, "copy");
        objc_msgSend(a1, "setTransitLineName:", v11);

      }
      if (a3)
        v12 = CFSTR("transitSystemName");
      else
        v12 = CFSTR("transit_system_name");
      objc_msgSend(v5, "objectForKeyedSubscript:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v14 = (void *)objc_msgSend(v13, "copy");
        objc_msgSend(a1, "setTransitSystemName:", v14);

      }
    }
  }

  return a1;
}

- (GEORPFeedbackTransitLine)initWithJSON:(id)a3
{
  return (GEORPFeedbackTransitLine *)-[GEORPFeedbackTransitLine _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_888;
    else
      v8 = (int *)&readAll__nonRecursiveTag_889;
    GEORPFeedbackTransitLineReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPFeedbackTransitLineIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPFeedbackTransitLineReadAllFrom((uint64_t)self, a3, 0);
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
    -[GEORPFeedbackTransitLine readAll:](self, "readAll:", 0);
    if (self->_transitLineMuid)
      PBDataWriterWriteStringField();
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
  -[GEORPFeedbackTransitLine readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 10) = self->_readerMarkPos;
  *((_DWORD *)v5 + 11) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_transitLineMuid)
    objc_msgSend(v5, "setTransitLineMuid:");
  if (self->_transitLineName)
    objc_msgSend(v5, "setTransitLineName:");
  v4 = v5;
  if (self->_transitSystemName)
  {
    objc_msgSend(v5, "setTransitSystemName:");
    v4 = v5;
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
    -[GEORPFeedbackTransitLine readAll:](self, "readAll:", 0);
    v8 = -[NSString copyWithZone:](self->_transitLineMuid, "copyWithZone:", a3);
    v9 = (void *)v5[2];
    v5[2] = v8;

    v10 = -[NSString copyWithZone:](self->_transitLineName, "copyWithZone:", a3);
    v11 = (void *)v5[3];
    v5[3] = v10;

    v12 = -[NSString copyWithZone:](self->_transitSystemName, "copyWithZone:", a3);
    v7 = (PBDataReader *)v5[4];
    v5[4] = v12;
    goto LABEL_6;
  }
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  GEORPFeedbackTransitLineReadAllFrom((uint64_t)v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);
LABEL_6:

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *transitLineMuid;
  NSString *transitLineName;
  NSString *transitSystemName;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((-[GEORPFeedbackTransitLine readAll:](self, "readAll:", 1),
         objc_msgSend(v4, "readAll:", 1),
         transitLineMuid = self->_transitLineMuid,
         !((unint64_t)transitLineMuid | v4[2]))
     || -[NSString isEqual:](transitLineMuid, "isEqual:"))
    && ((transitLineName = self->_transitLineName, !((unint64_t)transitLineName | v4[3]))
     || -[NSString isEqual:](transitLineName, "isEqual:")))
  {
    transitSystemName = self->_transitSystemName;
    if ((unint64_t)transitSystemName | v4[4])
      v8 = -[NSString isEqual:](transitSystemName, "isEqual:");
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

  -[GEORPFeedbackTransitLine readAll:](self, "readAll:", 1);
  v3 = -[NSString hash](self->_transitLineMuid, "hash");
  v4 = -[NSString hash](self->_transitLineName, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_transitSystemName, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;

  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  if (v4[2])
    -[GEORPFeedbackTransitLine setTransitLineMuid:](self, "setTransitLineMuid:");
  if (v4[3])
    -[GEORPFeedbackTransitLine setTransitLineName:](self, "setTransitLineName:");
  if (v4[4])
    -[GEORPFeedbackTransitLine setTransitSystemName:](self, "setTransitSystemName:");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitSystemName, 0);
  objc_storeStrong((id *)&self->_transitLineName, 0);
  objc_storeStrong((id *)&self->_transitLineMuid, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
