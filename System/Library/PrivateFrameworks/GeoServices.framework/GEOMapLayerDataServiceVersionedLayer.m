@implementation GEOMapLayerDataServiceVersionedLayer

- (GEOMapLayerDataServiceVersionedLayer)init
{
  GEOMapLayerDataServiceVersionedLayer *v2;
  GEOMapLayerDataServiceVersionedLayer *v3;
  GEOMapLayerDataServiceVersionedLayer *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOMapLayerDataServiceVersionedLayer;
  v2 = -[GEOMapLayerDataServiceVersionedLayer init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOMapLayerDataServiceVersionedLayer)initWithData:(id)a3
{
  GEOMapLayerDataServiceVersionedLayer *v3;
  GEOMapLayerDataServiceVersionedLayer *v4;
  GEOMapLayerDataServiceVersionedLayer *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOMapLayerDataServiceVersionedLayer;
  v3 = -[GEOMapLayerDataServiceVersionedLayer initWithData:](&v7, sel_initWithData_, a3);
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
  v8.super_class = (Class)GEOMapLayerDataServiceVersionedLayer;
  -[GEOMapLayerDataServiceVersionedLayer description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOMapLayerDataServiceVersionedLayer dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOMapLayerDataServiceVersionedLayer _dictionaryRepresentation:]((uint64_t)self, 0);
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
  void *v13;
  void *v14;

  if (a1)
  {
    -[GEOMapLayerDataServiceVersionedLayer readAll:](a1, 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if ((*(_BYTE *)(a1 + 44) & 1) == 0)
    {
      v5 = *(void **)(a1 + 8);
      if (v5)
      {
        v6 = v5;
        objc_sync_enter(v6);
        GEOMapLayerDataServiceVersionedLayerReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLayer_tags_112);
        objc_sync_exit(v6);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
    v7 = *(id *)(a1 + 16);
    v8 = v7;
    if (v7)
    {
      if ((a2 & 1) != 0)
        objc_msgSend(v7, "jsonRepresentation");
      else
        objc_msgSend(v7, "dictionaryRepresentation");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("layer"));

    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if ((*(_BYTE *)(a1 + 44) & 2) == 0)
    {
      v10 = *(void **)(a1 + 8);
      if (v10)
      {
        v11 = v10;
        objc_sync_enter(v11);
        GEOMapLayerDataServiceVersionedLayerReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readVersion_tags_113);
        objc_sync_exit(v11);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
    v12 = *(id *)(a1 + 24);
    v13 = v12;
    if (v12)
    {
      if ((a2 & 1) != 0)
        objc_msgSend(v12, "jsonRepresentation");
      else
        objc_msgSend(v12, "dictionaryRepresentation");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("version"));

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
  return -[GEOMapLayerDataServiceVersionedLayer _dictionaryRepresentation:]((uint64_t)self, 1);
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
        v6 = (int *)&readAll__recursiveTag_114;
      else
        v6 = (int *)&readAll__nonRecursiveTag_115;
      GEOMapLayerDataServiceVersionedLayerReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (BOOL)readFrom:(id)a3
{
  return GEOMapLayerDataServiceVersionedLayerReadAllFrom((uint64_t)self, a3);
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
    -[GEOMapLayerDataServiceVersionedLayer readAll:]((uint64_t)self, 0);
    if (self->_layer)
      PBDataWriterWriteSubmessage();
    if (self->_version)
      PBDataWriterWriteSubmessage();
  }

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
    -[GEOMapLayerDataServiceVersionedLayer readAll:]((uint64_t)self, 0);
    v8 = -[GEOMapLayerDataServiceLayer copyWithZone:](self->_layer, "copyWithZone:", a3);
    v9 = (void *)v5[2];
    v5[2] = v8;

    v10 = -[GEOMapLayerDataServiceVersion copyWithZone:](self->_version, "copyWithZone:", a3);
    v7 = (PBDataReader *)v5[3];
    v5[3] = v10;
    goto LABEL_6;
  }
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  GEOMapLayerDataServiceVersionedLayerReadAllFrom((uint64_t)v5, self->_reader);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);
LABEL_6:

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  GEOMapLayerDataServiceLayer *layer;
  GEOMapLayerDataServiceVersion *version;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((-[GEOMapLayerDataServiceVersionedLayer readAll:]((uint64_t)self, 1),
         -[GEOMapLayerDataServiceVersionedLayer readAll:]((uint64_t)v4, 1),
         layer = self->_layer,
         !((unint64_t)layer | v4[2]))
     || -[GEOMapLayerDataServiceLayer isEqual:](layer, "isEqual:")))
  {
    version = self->_version;
    if ((unint64_t)version | v4[3])
      v7 = -[GEOMapLayerDataServiceVersion isEqual:](version, "isEqual:");
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

  -[GEOMapLayerDataServiceVersionedLayer readAll:]((uint64_t)self, 1);
  v3 = -[GEOMapLayerDataServiceLayer hash](self->_layer, "hash");
  return -[GEOMapLayerDataServiceVersion hash](self->_version, "hash") ^ v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_layer, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
