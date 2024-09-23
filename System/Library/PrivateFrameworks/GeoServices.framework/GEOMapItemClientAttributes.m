@implementation GEOMapItemClientAttributes

- (GEOMapItemClientAttributes)init
{
  GEOMapItemClientAttributes *v2;
  GEOMapItemClientAttributes *v3;
  GEOMapItemClientAttributes *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOMapItemClientAttributes;
  v2 = -[GEOMapItemClientAttributes init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOMapItemClientAttributes)initWithData:(id)a3
{
  GEOMapItemClientAttributes *v3;
  GEOMapItemClientAttributes *v4;
  GEOMapItemClientAttributes *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOMapItemClientAttributes;
  v3 = -[GEOMapItemClientAttributes initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readAddressBookAttributes
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 68) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOMapItemClientAttributesReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAddressBookAttributes_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasAddressBookAttributes
{
  -[GEOMapItemClientAttributes _readAddressBookAttributes]((uint64_t)self);
  return self->_addressBookAttributes != 0;
}

- (GEOMapItemAddressBookAttributes)addressBookAttributes
{
  -[GEOMapItemClientAttributes _readAddressBookAttributes]((uint64_t)self);
  return self->_addressBookAttributes;
}

- (void)setAddressBookAttributes:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x22u;
  objc_storeStrong((id *)&self->_addressBookAttributes, a3);
}

- (void)_readRoutineAttributes
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 68) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOMapItemClientAttributesReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRoutineAttributes_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasRoutineAttributes
{
  -[GEOMapItemClientAttributes _readRoutineAttributes]((uint64_t)self);
  return self->_routineAttributes != 0;
}

- (GEOMapItemRoutineAttributes)routineAttributes
{
  -[GEOMapItemClientAttributes _readRoutineAttributes]((uint64_t)self);
  return self->_routineAttributes;
}

- (void)setRoutineAttributes:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x30u;
  objc_storeStrong((id *)&self->_routineAttributes, a3);
}

- (void)_readCorrectedLocationAttributes
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 68) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOMapItemClientAttributesReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCorrectedLocationAttributes_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasCorrectedLocationAttributes
{
  -[GEOMapItemClientAttributes _readCorrectedLocationAttributes]((uint64_t)self);
  return self->_correctedLocationAttributes != 0;
}

- (GEOMapItemCorrectedLocationAttributes)correctedLocationAttributes
{
  -[GEOMapItemClientAttributes _readCorrectedLocationAttributes]((uint64_t)self);
  return self->_correctedLocationAttributes;
}

- (void)setCorrectedLocationAttributes:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x24u;
  objc_storeStrong((id *)&self->_correctedLocationAttributes, a3);
}

- (void)_readMapsSyncAttributes
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 68) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOMapItemClientAttributesReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMapsSyncAttributes_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasMapsSyncAttributes
{
  -[GEOMapItemClientAttributes _readMapsSyncAttributes]((uint64_t)self);
  return self->_mapsSyncAttributes != 0;
}

- (GEOMapItemMapsSyncAttributes)mapsSyncAttributes
{
  -[GEOMapItemClientAttributes _readMapsSyncAttributes]((uint64_t)self);
  return self->_mapsSyncAttributes;
}

- (void)setMapsSyncAttributes:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x28u;
  objc_storeStrong((id *)&self->_mapsSyncAttributes, a3);
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
  v8.super_class = (Class)GEOMapItemClientAttributes;
  -[GEOMapItemClientAttributes description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOMapItemClientAttributes dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOMapItemClientAttributes _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(_QWORD *)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  _QWORD v24[4];
  id v25;

  if (!a1)
    return 0;
  objc_msgSend(a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "addressBookAttributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v5, "jsonRepresentation");
    else
      objc_msgSend(v5, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("addressBookAttributes"));

  }
  objc_msgSend(a1, "routineAttributes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v8, "jsonRepresentation");
    else
      objc_msgSend(v8, "dictionaryRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("routineAttributes"));

  }
  objc_msgSend(a1, "correctedLocationAttributes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v11, "jsonRepresentation");
    else
      objc_msgSend(v11, "dictionaryRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("correctedLocationAttributes"));

  }
  objc_msgSend(a1, "mapsSyncAttributes");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v14, "jsonRepresentation");
    else
      objc_msgSend(v14, "dictionaryRepresentation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("mapsSyncAttributes"));

  }
  v17 = (void *)a1[2];
  if (v17)
  {
    objc_msgSend(v17, "dictionaryRepresentation");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v18, "count"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __56__GEOMapItemClientAttributes__dictionaryRepresentation___block_invoke;
      v24[3] = &unk_1E1C00600;
      v21 = v20;
      v25 = v21;
      objc_msgSend(v19, "enumerateKeysAndObjectsUsingBlock:", v24);
      v22 = v21;

      v19 = v22;
    }
    objc_msgSend(v4, "setObject:forKey:", v19, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOMapItemClientAttributes _dictionaryRepresentation:](self, 1);
}

void __56__GEOMapItemClientAttributes__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOMapItemClientAttributes)initWithDictionary:(id)a3
{
  return (GEOMapItemClientAttributes *)-[GEOMapItemClientAttributes _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(char)a3 isJSON:
{
  id v5;
  void *v6;
  GEOMapItemAddressBookAttributes *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  GEOMapItemRoutineAttributes *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  GEOMapItemCorrectedLocationAttributes *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  GEOMapItemMapsSyncAttributes *v19;
  uint64_t v20;
  void *v21;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("addressBookAttributes"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = [GEOMapItemAddressBookAttributes alloc];
        if ((a3 & 1) != 0)
          v8 = -[GEOMapItemAddressBookAttributes initWithJSON:](v7, "initWithJSON:", v6);
        else
          v8 = -[GEOMapItemAddressBookAttributes initWithDictionary:](v7, "initWithDictionary:", v6);
        v9 = (void *)v8;
        objc_msgSend(a1, "setAddressBookAttributes:", v8);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("routineAttributes"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = [GEOMapItemRoutineAttributes alloc];
        if ((a3 & 1) != 0)
          v12 = -[GEOMapItemRoutineAttributes initWithJSON:](v11, "initWithJSON:", v10);
        else
          v12 = -[GEOMapItemRoutineAttributes initWithDictionary:](v11, "initWithDictionary:", v10);
        v13 = (void *)v12;
        objc_msgSend(a1, "setRoutineAttributes:", v12);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("correctedLocationAttributes"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v15 = [GEOMapItemCorrectedLocationAttributes alloc];
        if ((a3 & 1) != 0)
          v16 = -[GEOMapItemCorrectedLocationAttributes initWithJSON:](v15, "initWithJSON:", v14);
        else
          v16 = -[GEOMapItemCorrectedLocationAttributes initWithDictionary:](v15, "initWithDictionary:", v14);
        v17 = (void *)v16;
        objc_msgSend(a1, "setCorrectedLocationAttributes:", v16);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("mapsSyncAttributes"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v19 = [GEOMapItemMapsSyncAttributes alloc];
        if ((a3 & 1) != 0)
          v20 = -[GEOMapItemMapsSyncAttributes initWithJSON:](v19, "initWithJSON:", v18);
        else
          v20 = -[GEOMapItemMapsSyncAttributes initWithDictionary:](v19, "initWithDictionary:", v18);
        v21 = (void *)v20;
        objc_msgSend(a1, "setMapsSyncAttributes:", v20);

      }
    }
  }

  return a1;
}

- (GEOMapItemClientAttributes)initWithJSON:(id)a3
{
  return (GEOMapItemClientAttributes *)-[GEOMapItemClientAttributes _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_741;
    else
      v8 = (int *)&readAll__nonRecursiveTag_742;
    GEOMapItemClientAttributesReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEOMapItemClientAttributesCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOMapItemClientAttributesIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOMapItemClientAttributesReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  id v5;
  PBDataReader *v6;
  void *v7;
  id v8;

  v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && !_GEOMapItemClientAttributesIsDirty((uint64_t)self))
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
    -[GEOMapItemClientAttributes readAll:](self, "readAll:", 0);
    if (self->_addressBookAttributes)
      PBDataWriterWriteSubmessage();
    v5 = v8;
    if (self->_routineAttributes)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_correctedLocationAttributes)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_mapsSyncAttributes)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v5);
  }

}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[GEOMapItemClientAttributes _readCorrectedLocationAttributes]((uint64_t)self);
  return -[GEOMapItemCorrectedLocationAttributes hasGreenTeaWithValue:](self->_correctedLocationAttributes, "hasGreenTeaWithValue:", v3);
}

- (void)copyTo:(id)a3
{
  id *v4;
  id *v5;

  v5 = (id *)a3;
  -[GEOMapItemClientAttributes readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 14) = self->_readerMarkPos;
  *((_DWORD *)v5 + 15) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_addressBookAttributes)
    objc_msgSend(v5, "setAddressBookAttributes:");
  if (self->_routineAttributes)
    objc_msgSend(v5, "setRoutineAttributes:");
  v4 = v5;
  if (self->_correctedLocationAttributes)
  {
    objc_msgSend(v5, "setCorrectedLocationAttributes:");
    v4 = v5;
  }
  if (self->_mapsSyncAttributes)
  {
    objc_msgSend(v5, "setMapsSyncAttributes:");
    v4 = v5;
  }

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
  id v12;
  void *v13;
  id v14;
  void *v15;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
    goto LABEL_5;
  v7 = reader;
  objc_sync_enter(v7);
  if ((*(_BYTE *)&self->_flags & 0x20) != 0)
  {
    objc_sync_exit(v7);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOMapItemClientAttributes readAll:](self, "readAll:", 0);
    v8 = -[GEOMapItemAddressBookAttributes copyWithZone:](self->_addressBookAttributes, "copyWithZone:", a3);
    v9 = *(void **)(v5 + 24);
    *(_QWORD *)(v5 + 24) = v8;

    v10 = -[GEOMapItemRoutineAttributes copyWithZone:](self->_routineAttributes, "copyWithZone:", a3);
    v11 = *(void **)(v5 + 48);
    *(_QWORD *)(v5 + 48) = v10;

    v12 = -[GEOMapItemCorrectedLocationAttributes copyWithZone:](self->_correctedLocationAttributes, "copyWithZone:", a3);
    v13 = *(void **)(v5 + 32);
    *(_QWORD *)(v5 + 32) = v12;

    v14 = -[GEOMapItemMapsSyncAttributes copyWithZone:](self->_mapsSyncAttributes, "copyWithZone:", a3);
    v15 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v14;

    objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
    return (id)v5;
  }
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  GEOMapItemClientAttributesReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  GEOMapItemAddressBookAttributes *addressBookAttributes;
  GEOMapItemRoutineAttributes *routineAttributes;
  GEOMapItemCorrectedLocationAttributes *correctedLocationAttributes;
  GEOMapItemMapsSyncAttributes *mapsSyncAttributes;
  char v9;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((-[GEOMapItemClientAttributes readAll:](self, "readAll:", 1),
         objc_msgSend(v4, "readAll:", 1),
         addressBookAttributes = self->_addressBookAttributes,
         !((unint64_t)addressBookAttributes | v4[3]))
     || -[GEOMapItemAddressBookAttributes isEqual:](addressBookAttributes, "isEqual:"))
    && ((routineAttributes = self->_routineAttributes, !((unint64_t)routineAttributes | v4[6]))
     || -[GEOMapItemRoutineAttributes isEqual:](routineAttributes, "isEqual:"))
    && ((correctedLocationAttributes = self->_correctedLocationAttributes,
         !((unint64_t)correctedLocationAttributes | v4[4]))
     || -[GEOMapItemCorrectedLocationAttributes isEqual:](correctedLocationAttributes, "isEqual:")))
  {
    mapsSyncAttributes = self->_mapsSyncAttributes;
    if ((unint64_t)mapsSyncAttributes | v4[5])
      v9 = -[GEOMapItemMapsSyncAttributes isEqual:](mapsSyncAttributes, "isEqual:");
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

  -[GEOMapItemClientAttributes readAll:](self, "readAll:", 1);
  v3 = -[GEOMapItemAddressBookAttributes hash](self->_addressBookAttributes, "hash");
  v4 = -[GEOMapItemRoutineAttributes hash](self->_routineAttributes, "hash") ^ v3;
  v5 = -[GEOMapItemCorrectedLocationAttributes hash](self->_correctedLocationAttributes, "hash");
  return v4 ^ v5 ^ -[GEOMapItemMapsSyncAttributes hash](self->_mapsSyncAttributes, "hash");
}

- (void)mergeFrom:(id)a3
{
  GEOMapItemAddressBookAttributes *addressBookAttributes;
  uint64_t v5;
  GEOMapItemRoutineAttributes *routineAttributes;
  uint64_t v7;
  GEOMapItemCorrectedLocationAttributes *correctedLocationAttributes;
  uint64_t v9;
  GEOMapItemMapsSyncAttributes *mapsSyncAttributes;
  uint64_t v11;
  _QWORD *v12;

  v12 = a3;
  objc_msgSend(v12, "readAll:", 0);
  addressBookAttributes = self->_addressBookAttributes;
  v5 = v12[3];
  if (addressBookAttributes)
  {
    if (v5)
      -[GEOMapItemAddressBookAttributes mergeFrom:](addressBookAttributes, "mergeFrom:");
  }
  else if (v5)
  {
    -[GEOMapItemClientAttributes setAddressBookAttributes:](self, "setAddressBookAttributes:");
  }
  routineAttributes = self->_routineAttributes;
  v7 = v12[6];
  if (routineAttributes)
  {
    if (v7)
      -[GEOMapItemRoutineAttributes mergeFrom:](routineAttributes, "mergeFrom:");
  }
  else if (v7)
  {
    -[GEOMapItemClientAttributes setRoutineAttributes:](self, "setRoutineAttributes:");
  }
  correctedLocationAttributes = self->_correctedLocationAttributes;
  v9 = v12[4];
  if (correctedLocationAttributes)
  {
    if (v9)
      -[GEOMapItemCorrectedLocationAttributes mergeFrom:](correctedLocationAttributes, "mergeFrom:");
  }
  else if (v9)
  {
    -[GEOMapItemClientAttributes setCorrectedLocationAttributes:](self, "setCorrectedLocationAttributes:");
  }
  mapsSyncAttributes = self->_mapsSyncAttributes;
  v11 = v12[5];
  if (mapsSyncAttributes)
  {
    if (v11)
      -[GEOMapItemMapsSyncAttributes mergeFrom:](mapsSyncAttributes, "mergeFrom:");
  }
  else if (v11)
  {
    -[GEOMapItemClientAttributes setMapsSyncAttributes:](self, "setMapsSyncAttributes:");
  }

}

- (PBUnknownFields)unknownFields
{
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v5;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_BYTE *)&self->_flags & 1) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      v5 = reader;
      objc_sync_enter(v5);
      GEOMapItemClientAttributesReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_745);
      objc_sync_exit(v5);

    }
  }
  os_unfair_lock_unlock(p_readerLock);
  return self->_unknownFields;
}

- (void)clearUnknownFields:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_readerLock;
  PBUnknownFields *unknownFields;

  v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x21u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEOMapItemClientAttributes readAll:](self, "readAll:", 0);
    -[GEOMapItemAddressBookAttributes clearUnknownFields:](self->_addressBookAttributes, "clearUnknownFields:", 1);
    -[GEOMapItemRoutineAttributes clearUnknownFields:](self->_routineAttributes, "clearUnknownFields:", 1);
    -[GEOMapItemCorrectedLocationAttributes clearUnknownFields:](self->_correctedLocationAttributes, "clearUnknownFields:", 1);
    -[GEOMapItemMapsSyncAttributes clearUnknownFields:](self->_mapsSyncAttributes, "clearUnknownFields:", 1);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routineAttributes, 0);
  objc_storeStrong((id *)&self->_mapsSyncAttributes, 0);
  objc_storeStrong((id *)&self->_correctedLocationAttributes, 0);
  objc_storeStrong((id *)&self->_addressBookAttributes, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
