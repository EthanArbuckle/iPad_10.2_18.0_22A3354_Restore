@implementation GEOPDSearchStringStringPair

- (GEOPDSearchStringStringPair)init
{
  GEOPDSearchStringStringPair *v2;
  GEOPDSearchStringStringPair *v3;
  GEOPDSearchStringStringPair *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDSearchStringStringPair;
  v2 = -[GEOPDSearchStringStringPair init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDSearchStringStringPair)initWithData:(id)a3
{
  GEOPDSearchStringStringPair *v3;
  GEOPDSearchStringStringPair *v4;
  GEOPDSearchStringStringPair *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDSearchStringStringPair;
  v3 = -[GEOPDSearchStringStringPair initWithData:](&v7, sel_initWithData_, a3);
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
  v8.super_class = (Class)GEOPDSearchStringStringPair;
  -[GEOPDSearchStringStringPair description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDSearchStringStringPair dictionaryRepresentation](self, "dictionaryRepresentation");
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
    -[GEOPDSearchStringStringPair readAll:](a1, 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if ((*(_BYTE *)(a1 + 44) & 1) == 0)
    {
      v3 = *(void **)(a1 + 8);
      if (v3)
      {
        v4 = v3;
        objc_sync_enter(v4);
        GEOPDSearchStringStringPairReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readKey_tags_1733);
        objc_sync_exit(v4);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
    v5 = *(id *)(a1 + 16);
    if (v5)
      objc_msgSend(v2, "setObject:forKey:", v5, CFSTR("key"));

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if ((*(_BYTE *)(a1 + 44) & 2) == 0)
    {
      v6 = *(void **)(a1 + 8);
      if (v6)
      {
        v7 = v6;
        objc_sync_enter(v7);
        GEOPDSearchStringStringPairReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readVal_tags);
        objc_sync_exit(v7);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
    v8 = *(id *)(a1 + 24);
    if (v8)
      objc_msgSend(v2, "setObject:forKey:", v8, CFSTR("val"));

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
        v6 = (int *)&readAll__recursiveTag_1734;
      else
        v6 = (int *)&readAll__nonRecursiveTag_1735;
      GEOPDSearchStringStringPairReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (uint64_t)_initWithDictionary:(void *)a1 isJSON:(void *)a2
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v3 = a2;
  v4 = objc_msgSend(a1, "init");
  if (v4)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("key"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = (void *)objc_msgSend(v5, "copy");
      v7 = v6;
      *(_BYTE *)(v4 + 44) |= 1u;
      *(_BYTE *)(v4 + 44) |= 4u;
      objc_storeStrong((id *)(v4 + 16), v6);

    }
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("val"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)objc_msgSend(v8, "copy");
      v10 = v9;
      *(_BYTE *)(v4 + 44) |= 2u;
      *(_BYTE *)(v4 + 44) |= 4u;
      objc_storeStrong((id *)(v4 + 24), v9);

    }
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSearchStringStringPairReadAllFrom((uint64_t)self, a3, 0);
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
    -[GEOPDSearchStringStringPair readAll:]((uint64_t)self, 0);
    PBDataWriterWriteStringField();
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
    -[GEOPDSearchStringStringPair readAll:]((uint64_t)self, 0);
    v8 = -[NSString copyWithZone:](self->_key, "copyWithZone:", a3);
    v9 = (void *)v5[2];
    v5[2] = v8;

    v10 = -[NSString copyWithZone:](self->_val, "copyWithZone:", a3);
    v7 = (PBDataReader *)v5[3];
    v5[3] = v10;
    goto LABEL_6;
  }
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  GEOPDSearchStringStringPairReadAllFrom((uint64_t)v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);
LABEL_6:

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *key;
  NSString *val;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((-[GEOPDSearchStringStringPair readAll:]((uint64_t)self, 1),
         -[GEOPDSearchStringStringPair readAll:]((uint64_t)v4, 1),
         key = self->_key,
         !((unint64_t)key | v4[2]))
     || -[NSString isEqual:](key, "isEqual:")))
  {
    val = self->_val;
    if ((unint64_t)val | v4[3])
      v7 = -[NSString isEqual:](val, "isEqual:");
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

  -[GEOPDSearchStringStringPair readAll:]((uint64_t)self, 1);
  v3 = -[NSString hash](self->_key, "hash");
  return -[NSString hash](self->_val, "hash") ^ v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_val, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
