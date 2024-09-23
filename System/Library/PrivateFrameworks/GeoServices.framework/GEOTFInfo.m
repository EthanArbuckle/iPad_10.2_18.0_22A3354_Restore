@implementation GEOTFInfo

- (GEOTFInfo)init
{
  GEOTFInfo *v2;
  GEOTFInfo *v3;
  GEOTFInfo *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOTFInfo;
  v2 = -[GEOTFInfo init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOTFInfo)initWithData:(id)a3
{
  GEOTFInfo *v3;
  GEOTFInfo *v4;
  GEOTFInfo *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOTFInfo;
  v3 = -[GEOTFInfo initWithData:](&v7, sel_initWithData_, a3);
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
  v8.super_class = (Class)GEOTFInfo;
  -[GEOTFInfo description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOTFInfo dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;

  if (a1)
  {
    -[GEOTFInfo readAll:](a1, 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if ((*(_BYTE *)(a1 + 44) & 2) == 0)
    {
      v3 = *(void **)(a1 + 8);
      if (v3)
      {
        v4 = v3;
        objc_sync_enter(v4);
        GEOTFInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLanguage_tags);
        objc_sync_exit(v4);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
    v5 = *(id *)(a1 + 24);
    if (v5)
      objc_msgSend(v2, "setObject:forKey:", v5, CFSTR("language"));

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if ((*(_BYTE *)(a1 + 44) & 1) == 0)
    {
      v6 = *(void **)(a1 + 8);
      if (v6)
      {
        v7 = v6;
        objc_sync_enter(v7);
        GEOTFInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readComment_tags);
        objc_sync_exit(v7);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
    v8 = *(id *)(a1 + 16);
    if (v8)
      objc_msgSend(v2, "setObject:forKey:", v8, CFSTR("comment"));

  }
  else
  {
    v2 = 0;
  }
  return v2;
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
        v6 = (int *)&readAll__recursiveTag_222;
      else
        v6 = (int *)&readAll__nonRecursiveTag_223;
      GEOTFInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (BOOL)readFrom:(id)a3
{
  return GEOTFInfoReadAllFrom((uint64_t)self, a3, 0);
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
    -[GEOTFInfo readAll:]((uint64_t)self, 0);
    if (self->_language)
      PBDataWriterWriteStringField();
    if (self->_comment)
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
    -[GEOTFInfo readAll:]((uint64_t)self, 0);
    v8 = -[NSString copyWithZone:](self->_language, "copyWithZone:", a3);
    v9 = (void *)v5[3];
    v5[3] = v8;

    v10 = -[NSString copyWithZone:](self->_comment, "copyWithZone:", a3);
    v7 = (PBDataReader *)v5[2];
    v5[2] = v10;
    goto LABEL_6;
  }
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  GEOTFInfoReadAllFrom((uint64_t)v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);
LABEL_6:

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *language;
  NSString *comment;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((-[GEOTFInfo readAll:]((uint64_t)self, 1),
         -[GEOTFInfo readAll:]((uint64_t)v4, 1),
         language = self->_language,
         !((unint64_t)language | v4[3]))
     || -[NSString isEqual:](language, "isEqual:")))
  {
    comment = self->_comment;
    if ((unint64_t)comment | v4[2])
      v7 = -[NSString isEqual:](comment, "isEqual:");
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
  NSUInteger v3;

  -[GEOTFInfo readAll:]((uint64_t)self, 1);
  v3 = -[NSString hash](self->_language, "hash");
  return -[NSString hash](self->_comment, "hash") ^ v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_comment, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
