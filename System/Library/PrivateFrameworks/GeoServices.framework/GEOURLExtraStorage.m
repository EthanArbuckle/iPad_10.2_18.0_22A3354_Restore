@implementation GEOURLExtraStorage

- (GEOURLExtraStorage)init
{
  GEOURLExtraStorage *v2;
  GEOURLExtraStorage *v3;
  GEOURLExtraStorage *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOURLExtraStorage;
  v2 = -[GEOURLExtraStorage init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOURLExtraStorage)initWithData:(id)a3
{
  GEOURLExtraStorage *v3;
  GEOURLExtraStorage *v4;
  GEOURLExtraStorage *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOURLExtraStorage;
  v3 = -[GEOURLExtraStorage initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readStyleAttributes
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
        GEOURLExtraStorageReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readStyleAttributes_tags_7);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasStyleAttributes
{
  -[GEOURLExtraStorage _readStyleAttributes]((uint64_t)self);
  return self->_styleAttributes != 0;
}

- (GEOStyleAttributes)styleAttributes
{
  -[GEOURLExtraStorage _readStyleAttributes]((uint64_t)self);
  return self->_styleAttributes;
}

- (void)setStyleAttributes:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x28u;
  objc_storeStrong((id *)&self->_styleAttributes, a3);
}

- (void)_readMapRegion
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
        GEOURLExtraStorageReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMapRegion_tags_3371);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasMapRegion
{
  -[GEOURLExtraStorage _readMapRegion]((uint64_t)self);
  return self->_mapRegion != 0;
}

- (GEOMapRegion)mapRegion
{
  -[GEOURLExtraStorage _readMapRegion]((uint64_t)self);
  return self->_mapRegion;
}

- (void)setMapRegion:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x22u;
  objc_storeStrong((id *)&self->_mapRegion, a3);
}

- (void)_readPhoneNumber
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
        GEOURLExtraStorageReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPhoneNumber_tags_3372);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasPhoneNumber
{
  -[GEOURLExtraStorage _readPhoneNumber]((uint64_t)self);
  return self->_phoneNumber != 0;
}

- (NSString)phoneNumber
{
  -[GEOURLExtraStorage _readPhoneNumber]((uint64_t)self);
  return self->_phoneNumber;
}

- (void)setPhoneNumber:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x24u;
  objc_storeStrong((id *)&self->_phoneNumber, a3);
}

- (void)_readUrl
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
        GEOURLExtraStorageReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readUrl_tags_3373);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasUrl
{
  -[GEOURLExtraStorage _readUrl]((uint64_t)self);
  return self->_url != 0;
}

- (NSString)url
{
  -[GEOURLExtraStorage _readUrl]((uint64_t)self);
  return self->_url;
}

- (void)setUrl:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x30u;
  objc_storeStrong((id *)&self->_url, a3);
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
  v8.super_class = (Class)GEOURLExtraStorage;
  -[GEOURLExtraStorage description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOURLExtraStorage dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOURLExtraStorage _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(_QWORD *)a1
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
  void *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  _QWORD v23[4];
  id v24;

  if (!a1)
    return 0;
  objc_msgSend(a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "styleAttributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v5, "jsonRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = CFSTR("styleAttributes");
    }
    else
    {
      objc_msgSend(v5, "dictionaryRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = CFSTR("style_attributes");
    }
    objc_msgSend(v4, "setObject:forKey:", v7, v8);

  }
  objc_msgSend(a1, "mapRegion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v9, "jsonRepresentation");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = CFSTR("mapRegion");
    }
    else
    {
      objc_msgSend(v9, "dictionaryRepresentation");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = CFSTR("map_region");
    }
    objc_msgSend(v4, "setObject:forKey:", v11, v12);

  }
  objc_msgSend(a1, "phoneNumber");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    if (a2)
      v14 = CFSTR("phoneNumber");
    else
      v14 = CFSTR("phone_number");
    objc_msgSend(v4, "setObject:forKey:", v13, v14);
  }

  objc_msgSend(a1, "url");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
    objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("url"));

  v16 = (void *)a1[2];
  if (v16)
  {
    objc_msgSend(v16, "dictionaryRepresentation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v17, "count"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __48__GEOURLExtraStorage__dictionaryRepresentation___block_invoke;
      v23[3] = &unk_1E1C00600;
      v20 = v19;
      v24 = v20;
      objc_msgSend(v18, "enumerateKeysAndObjectsUsingBlock:", v23);
      v21 = v20;

      v18 = v21;
    }
    objc_msgSend(v4, "setObject:forKey:", v18, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOURLExtraStorage _dictionaryRepresentation:](self, 1);
}

void __48__GEOURLExtraStorage__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOURLExtraStorage)initWithDictionary:(id)a3
{
  return (GEOURLExtraStorage *)-[GEOURLExtraStorage _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  GEOStyleAttributes *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  GEOMapRegion *v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("styleAttributes");
      else
        v6 = CFSTR("style_attributes");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = [GEOStyleAttributes alloc];
        if ((a3 & 1) != 0)
          v9 = -[GEOStyleAttributes initWithJSON:](v8, "initWithJSON:", v7);
        else
          v9 = -[GEOStyleAttributes initWithDictionary:](v8, "initWithDictionary:", v7);
        v10 = (void *)v9;
        objc_msgSend(a1, "setStyleAttributes:", v9);

      }
      if (a3)
        v11 = CFSTR("mapRegion");
      else
        v11 = CFSTR("map_region");
      objc_msgSend(v5, "objectForKeyedSubscript:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v13 = [GEOMapRegion alloc];
        if ((a3 & 1) != 0)
          v14 = -[GEOMapRegion initWithJSON:](v13, "initWithJSON:", v12);
        else
          v14 = -[GEOMapRegion initWithDictionary:](v13, "initWithDictionary:", v12);
        v15 = (void *)v14;
        objc_msgSend(a1, "setMapRegion:", v14);

      }
      if (a3)
        v16 = CFSTR("phoneNumber");
      else
        v16 = CFSTR("phone_number");
      objc_msgSend(v5, "objectForKeyedSubscript:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v18 = (void *)objc_msgSend(v17, "copy");
        objc_msgSend(a1, "setPhoneNumber:", v18);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("url"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v20 = (void *)objc_msgSend(v19, "copy");
        objc_msgSend(a1, "setUrl:", v20);

      }
    }
  }

  return a1;
}

- (GEOURLExtraStorage)initWithJSON:(id)a3
{
  return (GEOURLExtraStorage *)-[GEOURLExtraStorage _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_3381;
    else
      v8 = (int *)&readAll__nonRecursiveTag_3382;
    GEOURLExtraStorageReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
  {
    -[GEOStyleAttributes readAll:](self->_styleAttributes, "readAll:", 1);
    -[GEOMapRegion readAll:](self->_mapRegion, "readAll:", 1);
  }
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOURLExtraStorageIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOURLExtraStorageReadAllFrom((uint64_t)self, a3, 0);
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
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_BYTE *)&self->_flags & 0x3E) == 0))
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
    -[GEOURLExtraStorage readAll:](self, "readAll:", 0);
    if (self->_styleAttributes)
      PBDataWriterWriteSubmessage();
    v5 = v8;
    if (self->_mapRegion)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_phoneNumber)
    {
      PBDataWriterWriteStringField();
      v5 = v8;
    }
    if (self->_url)
    {
      PBDataWriterWriteStringField();
      v5 = v8;
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v5);
  }

}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[GEOURLExtraStorage _readMapRegion]((uint64_t)self);
  return -[GEOMapRegion hasGreenTeaWithValue:](self->_mapRegion, "hasGreenTeaWithValue:", v3);
}

- (void)copyTo:(id)a3
{
  id *v4;
  id *v5;

  v5 = (id *)a3;
  -[GEOURLExtraStorage readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 14) = self->_readerMarkPos;
  *((_DWORD *)v5 + 15) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_styleAttributes)
    objc_msgSend(v5, "setStyleAttributes:");
  if (self->_mapRegion)
    objc_msgSend(v5, "setMapRegion:");
  v4 = v5;
  if (self->_phoneNumber)
  {
    objc_msgSend(v5, "setPhoneNumber:");
    v4 = v5;
  }
  if (self->_url)
  {
    objc_msgSend(v5, "setUrl:");
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
  uint64_t v12;
  void *v13;
  uint64_t v14;
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
    -[GEOURLExtraStorage readAll:](self, "readAll:", 0);
    v8 = -[GEOStyleAttributes copyWithZone:](self->_styleAttributes, "copyWithZone:", a3);
    v9 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v8;

    v10 = -[GEOMapRegion copyWithZone:](self->_mapRegion, "copyWithZone:", a3);
    v11 = *(void **)(v5 + 24);
    *(_QWORD *)(v5 + 24) = v10;

    v12 = -[NSString copyWithZone:](self->_phoneNumber, "copyWithZone:", a3);
    v13 = *(void **)(v5 + 32);
    *(_QWORD *)(v5 + 32) = v12;

    v14 = -[NSString copyWithZone:](self->_url, "copyWithZone:", a3);
    v15 = *(void **)(v5 + 48);
    *(_QWORD *)(v5 + 48) = v14;

    objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
    return (id)v5;
  }
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  GEOURLExtraStorageReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  GEOStyleAttributes *styleAttributes;
  GEOMapRegion *mapRegion;
  NSString *phoneNumber;
  NSString *url;
  char v9;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((-[GEOURLExtraStorage readAll:](self, "readAll:", 1),
         objc_msgSend(v4, "readAll:", 1),
         styleAttributes = self->_styleAttributes,
         !((unint64_t)styleAttributes | v4[5]))
     || -[GEOStyleAttributes isEqual:](styleAttributes, "isEqual:"))
    && ((mapRegion = self->_mapRegion, !((unint64_t)mapRegion | v4[3]))
     || -[GEOMapRegion isEqual:](mapRegion, "isEqual:"))
    && ((phoneNumber = self->_phoneNumber, !((unint64_t)phoneNumber | v4[4]))
     || -[NSString isEqual:](phoneNumber, "isEqual:")))
  {
    url = self->_url;
    if ((unint64_t)url | v4[6])
      v9 = -[NSString isEqual:](url, "isEqual:");
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
  NSUInteger v5;

  -[GEOURLExtraStorage readAll:](self, "readAll:", 1);
  v3 = -[GEOStyleAttributes hash](self->_styleAttributes, "hash");
  v4 = -[GEOMapRegion hash](self->_mapRegion, "hash") ^ v3;
  v5 = -[NSString hash](self->_phoneNumber, "hash");
  return v4 ^ v5 ^ -[NSString hash](self->_url, "hash");
}

- (void)mergeFrom:(id)a3
{
  GEOStyleAttributes *styleAttributes;
  uint64_t v5;
  GEOMapRegion *mapRegion;
  uint64_t v7;
  _QWORD *v8;

  v8 = a3;
  objc_msgSend(v8, "readAll:", 0);
  styleAttributes = self->_styleAttributes;
  v5 = v8[5];
  if (styleAttributes)
  {
    if (v5)
      -[GEOStyleAttributes mergeFrom:](styleAttributes, "mergeFrom:");
  }
  else if (v5)
  {
    -[GEOURLExtraStorage setStyleAttributes:](self, "setStyleAttributes:");
  }
  mapRegion = self->_mapRegion;
  v7 = v8[3];
  if (mapRegion)
  {
    if (v7)
      -[GEOMapRegion mergeFrom:](mapRegion, "mergeFrom:");
  }
  else if (v7)
  {
    -[GEOURLExtraStorage setMapRegion:](self, "setMapRegion:");
  }
  if (v8[4])
    -[GEOURLExtraStorage setPhoneNumber:](self, "setPhoneNumber:");
  if (v8[6])
    -[GEOURLExtraStorage setUrl:](self, "setUrl:");

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
      GEOURLExtraStorageReadSpecified((uint64_t)self, (unint64_t)self->_reader, unknownFields_tags_3385);
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
    -[GEOURLExtraStorage readAll:](self, "readAll:", 0);
    -[GEOStyleAttributes clearUnknownFields:](self->_styleAttributes, "clearUnknownFields:", 1);
    -[GEOMapRegion clearUnknownFields:](self->_mapRegion, "clearUnknownFields:", 1);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_styleAttributes, 0);
  objc_storeStrong((id *)&self->_phoneNumber, 0);
  objc_storeStrong((id *)&self->_mapRegion, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
