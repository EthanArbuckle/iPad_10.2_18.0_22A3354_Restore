@implementation GEOSharedNavWaypointInfo

- (GEOSharedNavWaypointInfo)init
{
  GEOSharedNavWaypointInfo *v2;
  GEOSharedNavWaypointInfo *v3;
  GEOSharedNavWaypointInfo *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOSharedNavWaypointInfo;
  v2 = -[GEOSharedNavWaypointInfo init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOSharedNavWaypointInfo)initWithData:(id)a3
{
  GEOSharedNavWaypointInfo *v3;
  GEOSharedNavWaypointInfo *v4;
  GEOSharedNavWaypointInfo *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOSharedNavWaypointInfo;
  v3 = -[GEOSharedNavWaypointInfo initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readMapItemStorage
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_BYTE *)(a1 + 60) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOSharedNavWaypointInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMapItemStorage_tags_1);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasMapItemStorage
{
  -[GEOSharedNavWaypointInfo _readMapItemStorage]((uint64_t)self);
  return self->_mapItemStorage != 0;
}

- (GEOMapItemStorage)mapItemStorage
{
  -[GEOSharedNavWaypointInfo _readMapItemStorage]((uint64_t)self);
  return self->_mapItemStorage;
}

- (void)setMapItemStorage:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x14u;
  objc_storeStrong((id *)&self->_mapItemStorage, a3);
}

- (void)_readChargingStationInfo
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_BYTE *)(a1 + 60) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOSharedNavWaypointInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readChargingStationInfo_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasChargingStationInfo
{
  -[GEOSharedNavWaypointInfo _readChargingStationInfo]((uint64_t)self);
  return self->_chargingStationInfo != 0;
}

- (GEOSharedNavChargingStationInfo)chargingStationInfo
{
  -[GEOSharedNavWaypointInfo _readChargingStationInfo]((uint64_t)self);
  return self->_chargingStationInfo;
}

- (void)setChargingStationInfo:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x12u;
  objc_storeStrong((id *)&self->_chargingStationInfo, a3);
}

- (void)_readUniqueIdentifier
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_BYTE *)(a1 + 60) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOSharedNavWaypointInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readUniqueIdentifier_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasUniqueIdentifier
{
  -[GEOSharedNavWaypointInfo _readUniqueIdentifier]((uint64_t)self);
  return self->_uniqueIdentifier != 0;
}

- (NSString)uniqueIdentifier
{
  -[GEOSharedNavWaypointInfo _readUniqueIdentifier]((uint64_t)self);
  return self->_uniqueIdentifier;
}

- (void)setUniqueIdentifier:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x18u;
  objc_storeStrong((id *)&self->_uniqueIdentifier, a3);
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
  v8.super_class = (Class)GEOSharedNavWaypointInfo;
  -[GEOSharedNavWaypointInfo description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOSharedNavWaypointInfo dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOSharedNavWaypointInfo _dictionaryRepresentation:](self, 0);
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
  id v19;
  id v20;
  _QWORD v22[4];
  id v23;

  if (!a1)
    return 0;
  objc_msgSend(a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "mapItemStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v5, "jsonRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = CFSTR("mapItemStorage");
    }
    else
    {
      objc_msgSend(v5, "dictionaryRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = CFSTR("map_item_storage");
    }
    objc_msgSend(v4, "setObject:forKey:", v7, v8);

  }
  objc_msgSend(a1, "chargingStationInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v9, "jsonRepresentation");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = CFSTR("chargingStationInfo");
    }
    else
    {
      objc_msgSend(v9, "dictionaryRepresentation");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = CFSTR("charging_station_info");
    }
    objc_msgSend(v4, "setObject:forKey:", v11, v12);

  }
  objc_msgSend(a1, "uniqueIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    if (a2)
      v14 = CFSTR("uniqueIdentifier");
    else
      v14 = CFSTR("unique_identifier");
    objc_msgSend(v4, "setObject:forKey:", v13, v14);
  }

  v15 = (void *)a1[2];
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
      v22[2] = __54__GEOSharedNavWaypointInfo__dictionaryRepresentation___block_invoke;
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
  return -[GEOSharedNavWaypointInfo _dictionaryRepresentation:](self, 1);
}

void __54__GEOSharedNavWaypointInfo__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOSharedNavWaypointInfo)initWithDictionary:(id)a3
{
  return (GEOSharedNavWaypointInfo *)-[GEOSharedNavWaypointInfo _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  GEOMapItemStorage *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  GEOSharedNavChargingStationInfo *v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  void *v18;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("mapItemStorage");
      else
        v6 = CFSTR("map_item_storage");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = [GEOMapItemStorage alloc];
        if ((a3 & 1) != 0)
          v9 = -[GEOMapItemStorage initWithJSON:](v8, "initWithJSON:", v7);
        else
          v9 = -[GEOMapItemStorage initWithDictionary:](v8, "initWithDictionary:", v7);
        v10 = (void *)v9;
        objc_msgSend(a1, "setMapItemStorage:", v9);

      }
      if (a3)
        v11 = CFSTR("chargingStationInfo");
      else
        v11 = CFSTR("charging_station_info");
      objc_msgSend(v5, "objectForKeyedSubscript:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v13 = [GEOSharedNavChargingStationInfo alloc];
        if ((a3 & 1) != 0)
          v14 = -[GEOSharedNavChargingStationInfo initWithJSON:](v13, "initWithJSON:", v12);
        else
          v14 = -[GEOSharedNavChargingStationInfo initWithDictionary:](v13, "initWithDictionary:", v12);
        v15 = (void *)v14;
        objc_msgSend(a1, "setChargingStationInfo:", v14);

      }
      if (a3)
        v16 = CFSTR("uniqueIdentifier");
      else
        v16 = CFSTR("unique_identifier");
      objc_msgSend(v5, "objectForKeyedSubscript:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v18 = (void *)objc_msgSend(v17, "copy");
        objc_msgSend(a1, "setUniqueIdentifier:", v18);

      }
    }
  }

  return a1;
}

- (GEOSharedNavWaypointInfo)initWithJSON:(id)a3
{
  return (GEOSharedNavWaypointInfo *)-[GEOSharedNavWaypointInfo _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_3206;
    else
      v8 = (int *)&readAll__nonRecursiveTag_3207;
    GEOSharedNavWaypointInfoReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
  {
    -[GEOMapItemStorage readAll:](self->_mapItemStorage, "readAll:", 1);
    -[GEOSharedNavChargingStationInfo readAll:](self->_chargingStationInfo, "readAll:", 1);
  }
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOSharedNavWaypointInfoIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOSharedNavWaypointInfoReadAllFrom((uint64_t)self, a3, 0);
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
  if (self->_reader && (_GEOSharedNavWaypointInfoIsDirty((uint64_t)self) & 1) == 0)
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
    -[GEOSharedNavWaypointInfo readAll:](self, "readAll:", 0);
    if (self->_mapItemStorage)
      PBDataWriterWriteSubmessage();
    v5 = v8;
    if (self->_chargingStationInfo)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_uniqueIdentifier)
    {
      PBDataWriterWriteStringField();
      v5 = v8;
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v5);
  }

}

- (void)clearSensitiveFields:(unint64_t)a3
{
  GEOSharedNavWaypointInfoClearSensitiveFields(self, a3, 1);
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[GEOSharedNavWaypointInfo _readMapItemStorage]((uint64_t)self);
  return -[GEOMapItemStorage hasGreenTeaWithValue:](self->_mapItemStorage, "hasGreenTeaWithValue:", v3);
}

- (void)copyTo:(id)a3
{
  id *v4;
  id *v5;

  v5 = (id *)a3;
  -[GEOSharedNavWaypointInfo readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 12) = self->_readerMarkPos;
  *((_DWORD *)v5 + 13) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_mapItemStorage)
    objc_msgSend(v5, "setMapItemStorage:");
  if (self->_chargingStationInfo)
    objc_msgSend(v5, "setChargingStationInfo:");
  v4 = v5;
  if (self->_uniqueIdentifier)
  {
    objc_msgSend(v5, "setUniqueIdentifier:");
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

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
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
    -[GEOSharedNavWaypointInfo readAll:](self, "readAll:", 0);
    v8 = -[GEOMapItemStorage copyWithZone:](self->_mapItemStorage, "copyWithZone:", a3);
    v9 = *(void **)(v5 + 32);
    *(_QWORD *)(v5 + 32) = v8;

    v10 = -[GEOSharedNavChargingStationInfo copyWithZone:](self->_chargingStationInfo, "copyWithZone:", a3);
    v11 = *(void **)(v5 + 24);
    *(_QWORD *)(v5 + 24) = v10;

    v12 = -[NSString copyWithZone:](self->_uniqueIdentifier, "copyWithZone:", a3);
    v13 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v12;

    objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
    return (id)v5;
  }
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  GEOSharedNavWaypointInfoReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  GEOMapItemStorage *mapItemStorage;
  GEOSharedNavChargingStationInfo *chargingStationInfo;
  NSString *uniqueIdentifier;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((-[GEOSharedNavWaypointInfo readAll:](self, "readAll:", 1),
         objc_msgSend(v4, "readAll:", 1),
         mapItemStorage = self->_mapItemStorage,
         !((unint64_t)mapItemStorage | v4[4]))
     || -[GEOMapItemStorage isEqual:](mapItemStorage, "isEqual:"))
    && ((chargingStationInfo = self->_chargingStationInfo, !((unint64_t)chargingStationInfo | v4[3]))
     || -[GEOSharedNavChargingStationInfo isEqual:](chargingStationInfo, "isEqual:")))
  {
    uniqueIdentifier = self->_uniqueIdentifier;
    if ((unint64_t)uniqueIdentifier | v4[5])
      v8 = -[NSString isEqual:](uniqueIdentifier, "isEqual:");
    else
      v8 = 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;

  -[GEOSharedNavWaypointInfo readAll:](self, "readAll:", 1);
  v3 = -[GEOMapItemStorage hash](self->_mapItemStorage, "hash");
  v4 = -[GEOSharedNavChargingStationInfo hash](self->_chargingStationInfo, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_uniqueIdentifier, "hash");
}

- (void)mergeFrom:(id)a3
{
  GEOMapItemStorage *mapItemStorage;
  uint64_t v5;
  GEOSharedNavChargingStationInfo *chargingStationInfo;
  uint64_t v7;
  _QWORD *v8;

  v8 = a3;
  objc_msgSend(v8, "readAll:", 0);
  mapItemStorage = self->_mapItemStorage;
  v5 = v8[4];
  if (mapItemStorage)
  {
    if (v5)
      -[GEOMapItemStorage mergeFrom:](mapItemStorage, "mergeFrom:");
  }
  else if (v5)
  {
    -[GEOSharedNavWaypointInfo setMapItemStorage:](self, "setMapItemStorage:");
  }
  chargingStationInfo = self->_chargingStationInfo;
  v7 = v8[3];
  if (chargingStationInfo)
  {
    if (v7)
      -[GEOSharedNavChargingStationInfo mergeFrom:](chargingStationInfo, "mergeFrom:");
  }
  else if (v7)
  {
    -[GEOSharedNavWaypointInfo setChargingStationInfo:](self, "setChargingStationInfo:");
  }
  if (v8[5])
    -[GEOSharedNavWaypointInfo setUniqueIdentifier:](self, "setUniqueIdentifier:");

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
      GEOSharedNavWaypointInfoReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_3210);
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
  *(_BYTE *)&self->_flags |= 0x11u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEOSharedNavWaypointInfo readAll:](self, "readAll:", 0);
    -[GEOMapItemStorage clearUnknownFields:](self->_mapItemStorage, "clearUnknownFields:", 1);
    -[GEOSharedNavChargingStationInfo clearUnknownFields:](self->_chargingStationInfo, "clearUnknownFields:", 1);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_mapItemStorage, 0);
  objc_storeStrong((id *)&self->_chargingStationInfo, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
