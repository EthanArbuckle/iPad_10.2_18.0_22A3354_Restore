@implementation GEOPDCategoryInformation

- (GEOPDCategoryInformation)init
{
  GEOPDCategoryInformation *v2;
  GEOPDCategoryInformation *v3;
  GEOPDCategoryInformation *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDCategoryInformation;
  v2 = -[GEOPDCategoryInformation init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDCategoryInformation)initWithData:(id)a3
{
  GEOPDCategoryInformation *v3;
  GEOPDCategoryInformation *v4;
  GEOPDCategoryInformation *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDCategoryInformation;
  v3 = -[GEOPDCategoryInformation initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readWalletCategoryId
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
        GEOPDCategoryInformationReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readWalletCategoryId_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasWalletCategoryId
{
  -[GEOPDCategoryInformation _readWalletCategoryId]((uint64_t)self);
  return self->_walletCategoryId != 0;
}

- (NSString)walletCategoryId
{
  -[GEOPDCategoryInformation _readWalletCategoryId]((uint64_t)self);
  return self->_walletCategoryId;
}

- (void)setWalletCategoryId:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x30u;
  objc_storeStrong((id *)&self->_walletCategoryId, a3);
}

- (void)_readMapsCategoryId
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
        GEOPDCategoryInformationReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMapsCategoryId_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasMapsCategoryId
{
  -[GEOPDCategoryInformation _readMapsCategoryId]((uint64_t)self);
  return self->_mapsCategoryId != 0;
}

- (NSString)mapsCategoryId
{
  -[GEOPDCategoryInformation _readMapsCategoryId]((uint64_t)self);
  return self->_mapsCategoryId;
}

- (void)setMapsCategoryId:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x24u;
  objc_storeStrong((id *)&self->_mapsCategoryId, a3);
}

- (void)_readLocalizedMapsCategoryName
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
        GEOPDCategoryInformationReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLocalizedMapsCategoryName_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasLocalizedMapsCategoryName
{
  -[GEOPDCategoryInformation _readLocalizedMapsCategoryName]((uint64_t)self);
  return self->_localizedMapsCategoryName != 0;
}

- (GEOLocalizedString)localizedMapsCategoryName
{
  -[GEOPDCategoryInformation _readLocalizedMapsCategoryName]((uint64_t)self);
  return self->_localizedMapsCategoryName;
}

- (void)setLocalizedMapsCategoryName:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x22u;
  objc_storeStrong((id *)&self->_localizedMapsCategoryName, a3);
}

- (void)_readMapsCategoryStyleAttributes
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
        GEOPDCategoryInformationReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMapsCategoryStyleAttributes_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasMapsCategoryStyleAttributes
{
  -[GEOPDCategoryInformation _readMapsCategoryStyleAttributes]((uint64_t)self);
  return self->_mapsCategoryStyleAttributes != 0;
}

- (GEOStyleAttributes)mapsCategoryStyleAttributes
{
  -[GEOPDCategoryInformation _readMapsCategoryStyleAttributes]((uint64_t)self);
  return self->_mapsCategoryStyleAttributes;
}

- (void)setMapsCategoryStyleAttributes:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x28u;
  objc_storeStrong((id *)&self->_mapsCategoryStyleAttributes, a3);
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
  v8.super_class = (Class)GEOPDCategoryInformation;
  -[GEOPDCategoryInformation description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDCategoryInformation dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDCategoryInformation _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(_QWORD *)a1
{
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
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
  objc_msgSend(a1, "walletCategoryId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (a2)
      v6 = CFSTR("walletCategoryId");
    else
      v6 = CFSTR("wallet_category_id");
    objc_msgSend(v4, "setObject:forKey:", v5, v6);
  }

  objc_msgSend(a1, "mapsCategoryId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    if (a2)
      v8 = CFSTR("mapsCategoryId");
    else
      v8 = CFSTR("maps_category_id");
    objc_msgSend(v4, "setObject:forKey:", v7, v8);
  }

  objc_msgSend(a1, "localizedMapsCategoryName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v9, "jsonRepresentation");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = CFSTR("localizedMapsCategoryName");
    }
    else
    {
      objc_msgSend(v9, "dictionaryRepresentation");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = CFSTR("localized_maps_category_name");
    }
    objc_msgSend(v4, "setObject:forKey:", v11, v12);

  }
  objc_msgSend(a1, "mapsCategoryStyleAttributes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v13, "jsonRepresentation");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = CFSTR("mapsCategoryStyleAttributes");
    }
    else
    {
      objc_msgSend(v13, "dictionaryRepresentation");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = CFSTR("maps_category_style_attributes");
    }
    objc_msgSend(v4, "setObject:forKey:", v15, v16);

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
      v24[2] = __54__GEOPDCategoryInformation__dictionaryRepresentation___block_invoke;
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
  return -[GEOPDCategoryInformation _dictionaryRepresentation:](self, 1);
}

void __54__GEOPDCategoryInformation__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOPDCategoryInformation)initWithDictionary:(id)a3
{
  return (GEOPDCategoryInformation *)-[GEOPDCategoryInformation _initWithDictionary:isJSON:](self, a3, 0);
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
  GEOLocalizedString *v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  GEOStyleAttributes *v19;
  uint64_t v20;
  void *v21;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("walletCategoryId");
      else
        v6 = CFSTR("wallet_category_id");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = (void *)objc_msgSend(v7, "copy");
        objc_msgSend(a1, "setWalletCategoryId:", v8);

      }
      if (a3)
        v9 = CFSTR("mapsCategoryId");
      else
        v9 = CFSTR("maps_category_id");
      objc_msgSend(v5, "objectForKeyedSubscript:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = (void *)objc_msgSend(v10, "copy");
        objc_msgSend(a1, "setMapsCategoryId:", v11);

      }
      if (a3)
        v12 = CFSTR("localizedMapsCategoryName");
      else
        v12 = CFSTR("localized_maps_category_name");
      objc_msgSend(v5, "objectForKeyedSubscript:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v14 = [GEOLocalizedString alloc];
        if ((a3 & 1) != 0)
          v15 = -[GEOLocalizedString initWithJSON:](v14, "initWithJSON:", v13);
        else
          v15 = -[GEOLocalizedString initWithDictionary:](v14, "initWithDictionary:", v13);
        v16 = (void *)v15;
        objc_msgSend(a1, "setLocalizedMapsCategoryName:", v15);

      }
      if (a3)
        v17 = CFSTR("mapsCategoryStyleAttributes");
      else
        v17 = CFSTR("maps_category_style_attributes");
      objc_msgSend(v5, "objectForKeyedSubscript:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v19 = [GEOStyleAttributes alloc];
        if ((a3 & 1) != 0)
          v20 = -[GEOStyleAttributes initWithJSON:](v19, "initWithJSON:", v18);
        else
          v20 = -[GEOStyleAttributes initWithDictionary:](v19, "initWithDictionary:", v18);
        v21 = (void *)v20;
        objc_msgSend(a1, "setMapsCategoryStyleAttributes:", v20);

      }
    }
  }

  return a1;
}

- (GEOPDCategoryInformation)initWithJSON:(id)a3
{
  return (GEOPDCategoryInformation *)-[GEOPDCategoryInformation _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_1070;
    else
      v8 = (int *)&readAll__nonRecursiveTag_1071;
    GEOPDCategoryInformationReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
  {
    -[GEOLocalizedString readAll:](self->_localizedMapsCategoryName, "readAll:", 1);
    -[GEOStyleAttributes readAll:](self->_mapsCategoryStyleAttributes, "readAll:", 1);
  }
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPDCategoryInformationIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDCategoryInformationReadAllFrom((uint64_t)self, a3, 0);
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
  if (self->_reader && (_GEOPDCategoryInformationIsDirty((uint64_t)self) & 1) == 0)
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
    -[GEOPDCategoryInformation readAll:](self, "readAll:", 0);
    if (self->_walletCategoryId)
      PBDataWriterWriteStringField();
    v5 = v8;
    if (self->_mapsCategoryId)
    {
      PBDataWriterWriteStringField();
      v5 = v8;
    }
    if (self->_localizedMapsCategoryName)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_mapsCategoryStyleAttributes)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v5);
  }

}

- (void)copyTo:(id)a3
{
  id *v4;
  id *v5;

  v5 = (id *)a3;
  -[GEOPDCategoryInformation readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 14) = self->_readerMarkPos;
  *((_DWORD *)v5 + 15) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_walletCategoryId)
    objc_msgSend(v5, "setWalletCategoryId:");
  if (self->_mapsCategoryId)
    objc_msgSend(v5, "setMapsCategoryId:");
  v4 = v5;
  if (self->_localizedMapsCategoryName)
  {
    objc_msgSend(v5, "setLocalizedMapsCategoryName:");
    v4 = v5;
  }
  if (self->_mapsCategoryStyleAttributes)
  {
    objc_msgSend(v5, "setMapsCategoryStyleAttributes:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
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
    -[GEOPDCategoryInformation readAll:](self, "readAll:", 0);
    v8 = -[NSString copyWithZone:](self->_walletCategoryId, "copyWithZone:", a3);
    v9 = *(void **)(v5 + 48);
    *(_QWORD *)(v5 + 48) = v8;

    v10 = -[NSString copyWithZone:](self->_mapsCategoryId, "copyWithZone:", a3);
    v11 = *(void **)(v5 + 32);
    *(_QWORD *)(v5 + 32) = v10;

    v12 = -[GEOLocalizedString copyWithZone:](self->_localizedMapsCategoryName, "copyWithZone:", a3);
    v13 = *(void **)(v5 + 24);
    *(_QWORD *)(v5 + 24) = v12;

    v14 = -[GEOStyleAttributes copyWithZone:](self->_mapsCategoryStyleAttributes, "copyWithZone:", a3);
    v15 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v14;

    objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
    return (id)v5;
  }
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  GEOPDCategoryInformationReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *walletCategoryId;
  NSString *mapsCategoryId;
  GEOLocalizedString *localizedMapsCategoryName;
  GEOStyleAttributes *mapsCategoryStyleAttributes;
  char v9;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((-[GEOPDCategoryInformation readAll:](self, "readAll:", 1),
         objc_msgSend(v4, "readAll:", 1),
         walletCategoryId = self->_walletCategoryId,
         !((unint64_t)walletCategoryId | v4[6]))
     || -[NSString isEqual:](walletCategoryId, "isEqual:"))
    && ((mapsCategoryId = self->_mapsCategoryId, !((unint64_t)mapsCategoryId | v4[4]))
     || -[NSString isEqual:](mapsCategoryId, "isEqual:"))
    && ((localizedMapsCategoryName = self->_localizedMapsCategoryName,
         !((unint64_t)localizedMapsCategoryName | v4[3]))
     || -[GEOLocalizedString isEqual:](localizedMapsCategoryName, "isEqual:")))
  {
    mapsCategoryStyleAttributes = self->_mapsCategoryStyleAttributes;
    if ((unint64_t)mapsCategoryStyleAttributes | v4[5])
      v9 = -[GEOStyleAttributes isEqual:](mapsCategoryStyleAttributes, "isEqual:");
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
  NSUInteger v3;
  NSUInteger v4;
  unint64_t v5;

  -[GEOPDCategoryInformation readAll:](self, "readAll:", 1);
  v3 = -[NSString hash](self->_walletCategoryId, "hash");
  v4 = -[NSString hash](self->_mapsCategoryId, "hash") ^ v3;
  v5 = -[GEOLocalizedString hash](self->_localizedMapsCategoryName, "hash");
  return v4 ^ v5 ^ -[GEOStyleAttributes hash](self->_mapsCategoryStyleAttributes, "hash");
}

- (void)mergeFrom:(id)a3
{
  GEOLocalizedString *localizedMapsCategoryName;
  uint64_t v5;
  GEOStyleAttributes *mapsCategoryStyleAttributes;
  uint64_t v7;
  _QWORD *v8;

  v8 = a3;
  objc_msgSend(v8, "readAll:", 0);
  if (v8[6])
    -[GEOPDCategoryInformation setWalletCategoryId:](self, "setWalletCategoryId:");
  if (v8[4])
    -[GEOPDCategoryInformation setMapsCategoryId:](self, "setMapsCategoryId:");
  localizedMapsCategoryName = self->_localizedMapsCategoryName;
  v5 = v8[3];
  if (localizedMapsCategoryName)
  {
    if (v5)
      -[GEOLocalizedString mergeFrom:](localizedMapsCategoryName, "mergeFrom:");
  }
  else if (v5)
  {
    -[GEOPDCategoryInformation setLocalizedMapsCategoryName:](self, "setLocalizedMapsCategoryName:");
  }
  mapsCategoryStyleAttributes = self->_mapsCategoryStyleAttributes;
  v7 = v8[5];
  if (mapsCategoryStyleAttributes)
  {
    if (v7)
      -[GEOStyleAttributes mergeFrom:](mapsCategoryStyleAttributes, "mergeFrom:");
  }
  else if (v7)
  {
    -[GEOPDCategoryInformation setMapsCategoryStyleAttributes:](self, "setMapsCategoryStyleAttributes:");
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
      GEOPDCategoryInformationReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_1074);
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
    -[GEOPDCategoryInformation readAll:](self, "readAll:", 0);
    -[GEOLocalizedString clearUnknownFields:](self->_localizedMapsCategoryName, "clearUnknownFields:", 1);
    -[GEOStyleAttributes clearUnknownFields:](self->_mapsCategoryStyleAttributes, "clearUnknownFields:", 1);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_walletCategoryId, 0);
  objc_storeStrong((id *)&self->_mapsCategoryStyleAttributes, 0);
  objc_storeStrong((id *)&self->_mapsCategoryId, 0);
  objc_storeStrong((id *)&self->_localizedMapsCategoryName, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
