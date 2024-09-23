@implementation MSPPinnedPlaceStorage

- (int)type
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_type;
  else
    return 0;
}

- (void)setType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasType
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)typeAsString:(int)a3
{
  if (a3 < 6)
    return off_1E6652040[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAP_ITEM")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HOME")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WORK")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PARKED_CAR")) & 1) != 0)
  {
    v4 = 4;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("SCHOOL")))
  {
    v4 = 5;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (BOOL)hasCustomName
{
  return self->_customName != 0;
}

- (BOOL)hasMapItemStorage
{
  return self->_mapItemStorage != 0;
}

- (void)clearContactStorages
{
  -[NSMutableArray removeAllObjects](self->_contactStorages, "removeAllObjects");
}

- (void)addContactStorage:(id)a3
{
  id v4;
  NSMutableArray *contactStorages;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  contactStorages = self->_contactStorages;
  v8 = v4;
  if (!contactStorages)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_contactStorages;
    self->_contactStorages = v6;

    v4 = v8;
    contactStorages = self->_contactStorages;
  }
  -[NSMutableArray addObject:](contactStorages, "addObject:", v4);

}

- (unint64_t)contactStoragesCount
{
  return -[NSMutableArray count](self->_contactStorages, "count");
}

- (id)contactStorageAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_contactStorages, "objectAtIndex:", a3);
}

+ (Class)contactStorageType
{
  return (Class)objc_opt_class();
}

- (void)setHidden:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_hidden = a3;
}

- (void)setHasHidden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasHidden
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasOriginatingAddressString
{
  return self->_originatingAddressString != 0;
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
  v8.super_class = (Class)MSPPinnedPlaceStorage;
  -[MSPPinnedPlaceStorage description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSPPinnedPlaceStorage dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  uint64_t type;
  __CFString *v5;
  NSString *identifier;
  NSString *customName;
  GEOMapItemStorage *mapItemStorage;
  void *v9;
  void *v10;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  NSString *originatingAddressString;
  PBUnknownFields *unknownFields;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    type = self->_type;
    if (type >= 6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_type);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_1E6652040[type];
    }
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("type"));

  }
  identifier = self->_identifier;
  if (identifier)
    objc_msgSend(v3, "setObject:forKey:", identifier, CFSTR("identifier"));
  customName = self->_customName;
  if (customName)
    objc_msgSend(v3, "setObject:forKey:", customName, CFSTR("customName"));
  mapItemStorage = self->_mapItemStorage;
  if (mapItemStorage)
  {
    -[GEOMapItemStorage dictionaryRepresentation](mapItemStorage, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("mapItemStorage"));

  }
  if (-[NSMutableArray count](self->_contactStorages, "count"))
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_contactStorages, "count"));
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v11 = self->_contactStorages;
    v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v23 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "dictionaryRepresentation");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addObject:", v16);

        }
        v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v13);
    }

    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("contactStorage"));
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_hidden);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("hidden"));

  }
  originatingAddressString = self->_originatingAddressString;
  if (originatingAddressString)
    objc_msgSend(v3, "setObject:forKey:", originatingAddressString, CFSTR("originatingAddressString"));
  unknownFields = self->_unknownFields;
  if (unknownFields)
  {
    -[PBUnknownFields dictionaryRepresentation](unknownFields, "dictionaryRepresentation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("Unknown Fields"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return MSPPinnedPlaceStorageReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_identifier)
    PBDataWriterWriteStringField();
  if (self->_customName)
    PBDataWriterWriteStringField();
  if (self->_mapItemStorage)
    PBDataWriterWriteSubmessage();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_contactStorages;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_originatingAddressString)
    PBDataWriterWriteStringField();
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v10);

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  _BYTE *v10;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[14] = self->_type;
    *((_BYTE *)v4 + 64) |= 1u;
  }
  v10 = v4;
  if (self->_identifier)
    objc_msgSend(v4, "setIdentifier:");
  if (self->_customName)
    objc_msgSend(v10, "setCustomName:");
  if (self->_mapItemStorage)
    objc_msgSend(v10, "setMapItemStorage:");
  if (-[MSPPinnedPlaceStorage contactStoragesCount](self, "contactStoragesCount"))
  {
    objc_msgSend(v10, "clearContactStorages");
    v5 = -[MSPPinnedPlaceStorage contactStoragesCount](self, "contactStoragesCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        -[MSPPinnedPlaceStorage contactStorageAtIndex:](self, "contactStorageAtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addContactStorage:", v8);

      }
    }
  }
  v9 = v10;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v10[60] = self->_hidden;
    v10[64] |= 2u;
  }
  if (self->_originatingAddressString)
  {
    objc_msgSend(v10, "setOriginatingAddressString:");
    v9 = v10;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSMutableArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  uint64_t v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 56) = self->_type;
    *(_BYTE *)(v5 + 64) |= 1u;
  }
  v7 = -[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  v8 = *(void **)(v6 + 32);
  *(_QWORD *)(v6 + 32) = v7;

  v9 = -[NSString copyWithZone:](self->_customName, "copyWithZone:", a3);
  v10 = *(void **)(v6 + 24);
  *(_QWORD *)(v6 + 24) = v9;

  v11 = -[GEOMapItemStorage copyWithZone:](self->_mapItemStorage, "copyWithZone:", a3);
  v12 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v11;

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v13 = self->_contactStorages;
  v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v23 != v16)
          objc_enumerationMutation(v13);
        v18 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v22);
        objc_msgSend((id)v6, "addContactStorage:", v18);

      }
      v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v15);
  }

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_BYTE *)(v6 + 60) = self->_hidden;
    *(_BYTE *)(v6 + 64) |= 2u;
  }
  v19 = -[NSString copyWithZone:](self->_originatingAddressString, "copyWithZone:", a3, (_QWORD)v22);
  v20 = *(void **)(v6 + 48);
  *(_QWORD *)(v6 + 48) = v19;

  objc_storeStrong((id *)(v6 + 8), self->_unknownFields);
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *identifier;
  NSString *customName;
  GEOMapItemStorage *mapItemStorage;
  NSMutableArray *contactStorages;
  char v9;
  NSString *originatingAddressString;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_19;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 1) == 0 || self->_type != *((_DWORD *)v4 + 14))
      goto LABEL_19;
  }
  else if ((*((_BYTE *)v4 + 64) & 1) != 0)
  {
    goto LABEL_19;
  }
  identifier = self->_identifier;
  if ((unint64_t)identifier | *((_QWORD *)v4 + 4) && !-[NSString isEqual:](identifier, "isEqual:"))
    goto LABEL_19;
  customName = self->_customName;
  if ((unint64_t)customName | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](customName, "isEqual:"))
      goto LABEL_19;
  }
  mapItemStorage = self->_mapItemStorage;
  if ((unint64_t)mapItemStorage | *((_QWORD *)v4 + 5))
  {
    if (!-[GEOMapItemStorage isEqual:](mapItemStorage, "isEqual:"))
      goto LABEL_19;
  }
  contactStorages = self->_contactStorages;
  if ((unint64_t)contactStorages | *((_QWORD *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](contactStorages, "isEqual:"))
      goto LABEL_19;
  }
  if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    if ((*((_BYTE *)v4 + 64) & 2) == 0)
      goto LABEL_25;
LABEL_19:
    v9 = 0;
    goto LABEL_20;
  }
  if ((*((_BYTE *)v4 + 64) & 2) == 0)
    goto LABEL_19;
  if (!self->_hidden)
  {
    if (!*((_BYTE *)v4 + 60))
      goto LABEL_25;
    goto LABEL_19;
  }
  if (!*((_BYTE *)v4 + 60))
    goto LABEL_19;
LABEL_25:
  originatingAddressString = self->_originatingAddressString;
  if ((unint64_t)originatingAddressString | *((_QWORD *)v4 + 6))
    v9 = -[NSString isEqual:](originatingAddressString, "isEqual:");
  else
    v9 = 1;
LABEL_20:

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_type;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_identifier, "hash");
  v5 = -[NSString hash](self->_customName, "hash");
  v6 = -[GEOMapItemStorage hash](self->_mapItemStorage, "hash");
  v7 = -[NSMutableArray hash](self->_contactStorages, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v8 = 2654435761 * self->_hidden;
  else
    v8 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ -[NSString hash](self->_originatingAddressString, "hash");
}

- (void)mergeFrom:(id)a3
{
  _DWORD *v4;
  id v5;
  GEOMapItemStorage *mapItemStorage;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if ((v4[16] & 1) != 0)
  {
    self->_type = v4[14];
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 4))
    -[MSPPinnedPlaceStorage setIdentifier:](self, "setIdentifier:");
  if (*((_QWORD *)v5 + 3))
    -[MSPPinnedPlaceStorage setCustomName:](self, "setCustomName:");
  mapItemStorage = self->_mapItemStorage;
  v7 = *((_QWORD *)v5 + 5);
  if (mapItemStorage)
  {
    if (v7)
      -[GEOMapItemStorage mergeFrom:](mapItemStorage, "mergeFrom:");
  }
  else if (v7)
  {
    -[MSPPinnedPlaceStorage setMapItemStorage:](self, "setMapItemStorage:");
  }
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v8 = *((id *)v5 + 2);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        -[MSPPinnedPlaceStorage addContactStorage:](self, "addContactStorage:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i), (_QWORD)v13);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

  if ((*((_BYTE *)v5 + 64) & 2) != 0)
  {
    self->_hidden = *((_BYTE *)v5 + 60);
    *(_BYTE *)&self->_has |= 2u;
  }
  if (*((_QWORD *)v5 + 6))
    -[MSPPinnedPlaceStorage setOriginatingAddressString:](self, "setOriginatingAddressString:");

}

- (PBUnknownFields)unknownFields
{
  return self->_unknownFields;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSString)customName
{
  return self->_customName;
}

- (void)setCustomName:(id)a3
{
  objc_storeStrong((id *)&self->_customName, a3);
}

- (GEOMapItemStorage)mapItemStorage
{
  return self->_mapItemStorage;
}

- (void)setMapItemStorage:(id)a3
{
  objc_storeStrong((id *)&self->_mapItemStorage, a3);
}

- (NSMutableArray)contactStorages
{
  return self->_contactStorages;
}

- (void)setContactStorages:(id)a3
{
  objc_storeStrong((id *)&self->_contactStorages, a3);
}

- (BOOL)hidden
{
  return self->_hidden;
}

- (NSString)originatingAddressString
{
  return self->_originatingAddressString;
}

- (void)setOriginatingAddressString:(id)a3
{
  objc_storeStrong((id *)&self->_originatingAddressString, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originatingAddressString, 0);
  objc_storeStrong((id *)&self->_mapItemStorage, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_customName, 0);
  objc_storeStrong((id *)&self->_contactStorages, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end
