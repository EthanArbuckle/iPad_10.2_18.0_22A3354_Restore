@implementation GEOPlaceCollectionStorage

- (GEOPlaceCollectionStorage)init
{
  GEOPlaceCollectionStorage *v2;
  GEOPlaceCollectionStorage *v3;
  GEOPlaceCollectionStorage *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPlaceCollectionStorage;
  v2 = -[GEOPlaceCollectionStorage init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPlaceCollectionStorage)initWithData:(id)a3
{
  GEOPlaceCollectionStorage *v3;
  GEOPlaceCollectionStorage *v4;
  GEOPlaceCollectionStorage *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPlaceCollectionStorage;
  v3 = -[GEOPlaceCollectionStorage initWithData:](&v7, sel_initWithData_, a3);
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
  v8.super_class = (Class)GEOPlaceCollectionStorage;
  -[GEOPlaceCollectionStorage description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPlaceCollectionStorage dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPlaceCollectionStorage _dictionaryRepresentation:]((uint64_t)self, 0);
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
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  _QWORD v22[4];
  id v23;

  if (!a1)
    return 0;
  -[GEOPlaceCollectionStorage readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
  if ((*(_BYTE *)(a1 + 52) & 4) == 0)
  {
    v5 = *(void **)(a1 + 8);
    if (v5)
    {
      v6 = v5;
      objc_sync_enter(v6);
      GEOPlaceCollectionStorageReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPlaceCollection_tags);
      objc_sync_exit(v6);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  v7 = *(id *)(a1 + 32);
  v8 = v7;
  if (v7)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v7, "jsonRepresentation");
    else
      objc_msgSend(v7, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("placeCollection"));

  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
  if ((*(_BYTE *)(a1 + 52) & 2) == 0)
  {
    v10 = *(void **)(a1 + 8);
    if (v10)
    {
      v11 = v10;
      objc_sync_enter(v11);
      GEOPlaceCollectionStorageReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAttribution_tags_0);
      objc_sync_exit(v11);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  v12 = *(id *)(a1 + 24);
  v13 = v12;
  if (v12)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v12, "jsonRepresentation");
    else
      objc_msgSend(v12, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("attribution"));

  }
  v15 = *(void **)(a1 + 16);
  if (v15)
  {
    objc_msgSend(v15, "dictionaryRepresentation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v16, "count"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __55__GEOPlaceCollectionStorage__dictionaryRepresentation___block_invoke;
      v22[3] = &unk_1E1C00600;
      v19 = v18;
      v23 = v19;
      objc_msgSend(v17, "enumerateKeysAndObjectsUsingBlock:", v22);
      v20 = v19;

      v17 = v20;
    }
    objc_msgSend(v4, "setObject:forKey:", v17, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPlaceCollectionStorage _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  void *v4;
  id v5;
  int *v6;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      v5 = v4;
      objc_sync_enter(v5);
      if (a2)
        v6 = (int *)&readAll__recursiveTag_2595;
      else
        v6 = (int *)&readAll__nonRecursiveTag_2596;
      GEOPlaceCollectionStorageReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
    {
      -[GEOPDPlaceCollection readAll:](*(_QWORD *)(a1 + 32), 1);
      -[GEOPDAttribution readAll:](*(_QWORD *)(a1 + 24), 1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

void __55__GEOPlaceCollectionStorage__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v7 = *(void **)(a1 + 32);
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v5, "base64EncodedStringWithOptions:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "description");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v8, v9);

  }
  else
  {
    objc_msgSend(v10, "description");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v5, v8);
  }

}

- (BOOL)readFrom:(id)a3
{
  return GEOPlaceCollectionStorageReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  char flags;
  id v6;
  PBDataReader *v7;
  void *v8;
  id v9;

  v9 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (!self->_reader)
    goto LABEL_8;
  os_unfair_lock_assert_owner(&self->_readerLock);
  flags = (char)self->_flags;
  if ((flags & 8) != 0)
    goto LABEL_8;
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    if ((GEOPDPlaceCollectionIsDirty((os_unfair_lock_s *)self->_placeCollection) & 1) != 0)
      goto LABEL_8;
    flags = (char)self->_flags;
  }
  if ((flags & 2) == 0 || !GEOPDAttributionIsDirty((uint64_t)self->_attribution))
  {
    v7 = self->_reader;
    objc_sync_enter(v7);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "writeData:", v8);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v7);
    goto LABEL_13;
  }
LABEL_8:
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPlaceCollectionStorage readAll:]((uint64_t)self, 0);
  if (self->_placeCollection)
    PBDataWriterWriteSubmessage();
  v6 = v9;
  if (self->_attribution)
  {
    PBDataWriterWriteSubmessage();
    v6 = v9;
  }
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v6);
LABEL_13:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
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
    -[GEOPlaceCollectionStorage readAll:]((uint64_t)self, 0);
    v8 = -[GEOPDPlaceCollection copyWithZone:](self->_placeCollection, "copyWithZone:", a3);
    v9 = *(void **)(v5 + 32);
    *(_QWORD *)(v5 + 32) = v8;

    v10 = -[GEOPDAttribution copyWithZone:](self->_attribution, "copyWithZone:", a3);
    v11 = *(void **)(v5 + 24);
    *(_QWORD *)(v5 + 24) = v10;

    objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
    return (id)v5;
  }
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  GEOPlaceCollectionStorageReadAllFrom(v5, self->_reader);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  GEOPDPlaceCollection *placeCollection;
  GEOPDAttribution *attribution;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((-[GEOPlaceCollectionStorage readAll:]((uint64_t)self, 1),
         -[GEOPlaceCollectionStorage readAll:]((uint64_t)v4, 1),
         placeCollection = self->_placeCollection,
         !((unint64_t)placeCollection | v4[4]))
     || -[GEOPDPlaceCollection isEqual:](placeCollection, "isEqual:")))
  {
    attribution = self->_attribution;
    if ((unint64_t)attribution | v4[3])
      v7 = -[GEOPDAttribution isEqual:](attribution, "isEqual:");
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

  -[GEOPlaceCollectionStorage readAll:]((uint64_t)self, 1);
  v3 = -[GEOPDPlaceCollection hash](self->_placeCollection, "hash");
  return -[GEOPDAttribution hash](self->_attribution, "hash") ^ v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeCollection, 0);
  objc_storeStrong((id *)&self->_attribution, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
