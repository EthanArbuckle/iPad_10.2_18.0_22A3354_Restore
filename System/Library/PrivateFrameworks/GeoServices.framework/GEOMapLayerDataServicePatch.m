@implementation GEOMapLayerDataServicePatch

- (GEOMapLayerDataServicePatch)init
{
  GEOMapLayerDataServicePatch *v2;
  GEOMapLayerDataServicePatch *v3;
  GEOMapLayerDataServicePatch *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOMapLayerDataServicePatch;
  v2 = -[GEOMapLayerDataServicePatch init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOMapLayerDataServicePatch)initWithData:(id)a3
{
  GEOMapLayerDataServicePatch *v3;
  GEOMapLayerDataServicePatch *v4;
  GEOMapLayerDataServicePatch *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOMapLayerDataServicePatch;
  v3 = -[GEOMapLayerDataServicePatch initWithData:](&v7, sel_initWithData_, a3);
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
  v8.super_class = (Class)GEOMapLayerDataServicePatch;
  -[GEOMapLayerDataServicePatch description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOMapLayerDataServicePatch dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOMapLayerDataServicePatch _dictionaryRepresentation:]((uint64_t)self, 0);
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
  const __CFString *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  void *v26;

  if (a1)
  {
    -[GEOMapLayerDataServicePatch readAll:](a1, 1);
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
        GEOMapLayerDataServicePatchReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLayer_tags_63);
        objc_sync_exit(v6);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
    v7 = *(id *)(a1 + 24);
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
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_BYTE *)(a1 + 60) & 4) == 0)
    {
      v10 = *(void **)(a1 + 8);
      if (v10)
      {
        v11 = v10;
        objc_sync_enter(v11);
        GEOMapLayerDataServicePatchReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSourceVersion_tags_0);
        objc_sync_exit(v11);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
    v12 = *(id *)(a1 + 32);
    v13 = v12;
    if (v12)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v12, "jsonRepresentation");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = CFSTR("sourceVersion");
      }
      else
      {
        objc_msgSend(v12, "dictionaryRepresentation");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = CFSTR("source_version");
      }
      objc_msgSend(v4, "setObject:forKey:", v14, v15);

    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_BYTE *)(a1 + 60) & 8) == 0)
    {
      v16 = *(void **)(a1 + 8);
      if (v16)
      {
        v17 = v16;
        objc_sync_enter(v17);
        GEOMapLayerDataServicePatchReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTargetVersion_tags);
        objc_sync_exit(v17);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
    v18 = *(id *)(a1 + 40);
    v19 = v18;
    if (v18)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v18, "jsonRepresentation");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = CFSTR("targetVersion");
      }
      else
      {
        objc_msgSend(v18, "dictionaryRepresentation");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = CFSTR("target_version");
      }
      objc_msgSend(v4, "setObject:forKey:", v20, v21);

    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_BYTE *)(a1 + 60) & 1) == 0)
    {
      v22 = *(void **)(a1 + 8);
      if (v22)
      {
        v23 = v22;
        objc_sync_enter(v23);
        GEOMapLayerDataServicePatchReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readIndex_tags_64);
        objc_sync_exit(v23);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
    v24 = *(id *)(a1 + 16);
    v25 = v24;
    if (v24)
    {
      if ((a2 & 1) != 0)
        objc_msgSend(v24, "jsonRepresentation");
      else
        objc_msgSend(v24, "dictionaryRepresentation");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v26, CFSTR("index"));

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
  return -[GEOMapLayerDataServicePatch _dictionaryRepresentation:]((uint64_t)self, 1);
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
        v6 = (int *)&readAll__recursiveTag_73;
      else
        v6 = (int *)&readAll__nonRecursiveTag_74;
      GEOMapLayerDataServicePatchReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)readFrom:(id)a3
{
  return GEOMapLayerDataServicePatchReadAllFrom((uint64_t)self, a3);
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
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_BYTE *)&self->_flags & 0x1F) == 0))
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
    -[GEOMapLayerDataServicePatch readAll:]((uint64_t)self, 0);
    if (self->_layer)
      PBDataWriterWriteSubmessage();
    if (self->_sourceVersion)
      PBDataWriterWriteSubmessage();
    if (self->_targetVersion)
      PBDataWriterWriteSubmessage();
    if (self->_index)
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
  void *v11;
  id v12;
  void *v13;
  id v14;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
    goto LABEL_5;
  v7 = reader;
  objc_sync_enter(v7);
  if ((*(_BYTE *)&self->_flags & 0x10) != 0)
  {
    objc_sync_exit(v7);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOMapLayerDataServicePatch readAll:]((uint64_t)self, 0);
    v8 = -[GEOMapLayerDataServiceLayer copyWithZone:](self->_layer, "copyWithZone:", a3);
    v9 = (void *)v5[3];
    v5[3] = v8;

    v10 = -[GEOMapLayerDataServiceVersion copyWithZone:](self->_sourceVersion, "copyWithZone:", a3);
    v11 = (void *)v5[4];
    v5[4] = v10;

    v12 = -[GEOMapLayerDataServiceVersion copyWithZone:](self->_targetVersion, "copyWithZone:", a3);
    v13 = (void *)v5[5];
    v5[5] = v12;

    v14 = -[GEOMapLayerDataServiceLayerIndex copyWithZone:](self->_index, "copyWithZone:", a3);
    v7 = (PBDataReader *)v5[2];
    v5[2] = v14;
    goto LABEL_6;
  }
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  GEOMapLayerDataServicePatchReadAllFrom((uint64_t)v5, self->_reader);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);
LABEL_6:

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  GEOMapLayerDataServiceLayer *layer;
  GEOMapLayerDataServiceVersion *sourceVersion;
  GEOMapLayerDataServiceVersion *targetVersion;
  GEOMapLayerDataServiceLayerIndex *index;
  char v9;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((-[GEOMapLayerDataServicePatch readAll:]((uint64_t)self, 1),
         -[GEOMapLayerDataServicePatch readAll:]((uint64_t)v4, 1),
         layer = self->_layer,
         !((unint64_t)layer | v4[3]))
     || -[GEOMapLayerDataServiceLayer isEqual:](layer, "isEqual:"))
    && ((sourceVersion = self->_sourceVersion, !((unint64_t)sourceVersion | v4[4]))
     || -[GEOMapLayerDataServiceVersion isEqual:](sourceVersion, "isEqual:"))
    && ((targetVersion = self->_targetVersion, !((unint64_t)targetVersion | v4[5]))
     || -[GEOMapLayerDataServiceVersion isEqual:](targetVersion, "isEqual:")))
  {
    index = self->_index;
    if ((unint64_t)index | v4[2])
      v9 = -[GEOMapLayerDataServiceLayerIndex isEqual:](index, "isEqual:");
    else
      v9 = 1;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;

  -[GEOMapLayerDataServicePatch readAll:]((uint64_t)self, 1);
  v3 = -[GEOMapLayerDataServiceLayer hash](self->_layer, "hash");
  v4 = -[GEOMapLayerDataServiceVersion hash](self->_sourceVersion, "hash") ^ v3;
  v5 = -[GEOMapLayerDataServiceVersion hash](self->_targetVersion, "hash");
  return v4 ^ v5 ^ -[GEOMapLayerDataServiceLayerIndex hash](self->_index, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetVersion, 0);
  objc_storeStrong((id *)&self->_sourceVersion, 0);
  objc_storeStrong((id *)&self->_layer, 0);
  objc_storeStrong((id *)&self->_index, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
