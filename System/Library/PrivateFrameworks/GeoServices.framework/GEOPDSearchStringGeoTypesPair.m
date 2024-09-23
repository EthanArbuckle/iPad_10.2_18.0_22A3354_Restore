@implementation GEOPDSearchStringGeoTypesPair

- (GEOPDSearchStringGeoTypesPair)init
{
  GEOPDSearchStringGeoTypesPair *v2;
  GEOPDSearchStringGeoTypesPair *v3;
  GEOPDSearchStringGeoTypesPair *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDSearchStringGeoTypesPair;
  v2 = -[GEOPDSearchStringGeoTypesPair init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDSearchStringGeoTypesPair)initWithData:(id)a3
{
  GEOPDSearchStringGeoTypesPair *v3;
  GEOPDSearchStringGeoTypesPair *v4;
  GEOPDSearchStringGeoTypesPair *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDSearchStringGeoTypesPair;
  v3 = -[GEOPDSearchStringGeoTypesPair initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)dealloc
{
  objc_super v3;

  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOPDSearchStringGeoTypesPair;
  -[GEOPDSearchStringGeoTypesPair dealloc](&v3, sel_dealloc);
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
  v8.super_class = (Class)GEOPDSearchStringGeoTypesPair;
  -[GEOPDSearchStringGeoTypesPair description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDSearchStringGeoTypesPair dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSearchStringGeoTypesPair _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  const __CFString *v9;

  if (a1)
  {
    -[GEOPDSearchStringGeoTypesPair readAll:](a1, 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_BYTE *)(a1 + 60) & 2) == 0)
    {
      v5 = *(void **)(a1 + 8);
      if (v5)
      {
        v6 = v5;
        objc_sync_enter(v6);
        GEOPDSearchStringGeoTypesPairReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readKey_tags_1723);
        objc_sync_exit(v6);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
    v7 = *(id *)(a1 + 40);
    if (v7)
      objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("key"));

    if (*(_QWORD *)(a1 + 24))
    {
      PBRepeatedInt32NSArray();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
        v9 = CFSTR("geoTypeId");
      else
        v9 = CFSTR("geo_type_id");
      objc_msgSend(v4, "setObject:forKey:", v8, v9);

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
  return -[GEOPDSearchStringGeoTypesPair _dictionaryRepresentation:]((uint64_t)self, 1);
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
        v6 = (int *)&readAll__recursiveTag_1724;
      else
        v6 = (int *)&readAll__nonRecursiveTag_1725;
      GEOPDSearchStringGeoTypesPairReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSearchStringGeoTypesPairReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  void *v5;
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_geoTypeIds;
  unint64_t v7;
  PBDataReader *v8;
  void *v9;
  id v10;

  v10 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_BYTE *)&self->_flags & 7) == 0))
  {
    v8 = self->_reader;
    objc_sync_enter(v8);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "writeData:", v9);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v8);
    v5 = v10;
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDSearchStringGeoTypesPair readAll:]((uint64_t)self, 0);
    PBDataWriterWriteStringField();
    v5 = v10;
    p_geoTypeIds = &self->_geoTypeIds;
    if (p_geoTypeIds->count)
    {
      v7 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        v5 = v10;
        ++v7;
      }
      while (v7 < p_geoTypeIds->count);
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  PBDataReader *reader;
  PBDataReader *v7;
  uint64_t v8;
  void *v9;

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
    -[GEOPDSearchStringGeoTypesPair readAll:]((uint64_t)self, 0);
    v8 = -[NSString copyWithZone:](self->_key, "copyWithZone:", a3);
    v9 = (void *)v5[5];
    v5[5] = v8;

    PBRepeatedInt32Copy();
    return v5;
  }
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  GEOPDSearchStringGeoTypesPairReadAllFrom((uint64_t)v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *key;
  char IsEqual;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((-[GEOPDSearchStringGeoTypesPair readAll:]((uint64_t)self, 1),
         -[GEOPDSearchStringGeoTypesPair readAll:]((uint64_t)v4, 1),
         key = self->_key,
         !((unint64_t)key | v4[5]))
     || -[NSString isEqual:](key, "isEqual:")))
  {
    IsEqual = PBRepeatedInt32IsEqual();
  }
  else
  {
    IsEqual = 0;
  }

  return IsEqual;
}

- (unint64_t)hash
{
  NSUInteger v3;

  -[GEOPDSearchStringGeoTypesPair readAll:]((uint64_t)self, 1);
  v3 = -[NSString hash](self->_key, "hash");
  return PBRepeatedInt32Hash() ^ v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
