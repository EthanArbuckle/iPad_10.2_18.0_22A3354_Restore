@implementation GEOCompanionWaypoint

- (GEOCompanionWaypoint)init
{
  GEOCompanionWaypoint *v2;
  GEOCompanionWaypoint *v3;
  GEOCompanionWaypoint *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOCompanionWaypoint;
  v2 = -[GEOCompanionWaypoint init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOCompanionWaypoint)initWithData:(id)a3
{
  GEOCompanionWaypoint *v3;
  GEOCompanionWaypoint *v4;
  GEOCompanionWaypoint *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOCompanionWaypoint;
  v3 = -[GEOCompanionWaypoint initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readMapItem
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 72) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOCompanionWaypointReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMapItem_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasMapItem
{
  -[GEOCompanionWaypoint _readMapItem]((uint64_t)self);
  return self->_mapItem != 0;
}

- (GEOMapItemStorage)mapItem
{
  -[GEOCompanionWaypoint _readMapItem]((uint64_t)self);
  return self->_mapItem;
}

- (void)setMapItem:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x44u;
  objc_storeStrong((id *)&self->_mapItem, a3);
}

- (void)_readWaypointTyped
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 72) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOCompanionWaypointReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readWaypointTyped_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasWaypointTyped
{
  -[GEOCompanionWaypoint _readWaypointTyped]((uint64_t)self);
  return self->_waypointTyped != 0;
}

- (GEOWaypointTyped)waypointTyped
{
  -[GEOCompanionWaypoint _readWaypointTyped]((uint64_t)self);
  return self->_waypointTyped;
}

- (void)setWaypointTyped:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x60u;
  objc_storeStrong((id *)&self->_waypointTyped, a3);
}

- (BOOL)isCurrentLocation
{
  return self->_isCurrentLocation;
}

- (void)setIsCurrentLocation:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 0x41u;
  self->_isCurrentLocation = a3;
}

- (void)setHasIsCurrentLocation:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3 | 0x40;
}

- (BOOL)hasIsCurrentLocation
{
  return *(_BYTE *)&self->_flags & 1;
}

- (void)_readSearchString
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 72) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOCompanionWaypointReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSearchString_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasSearchString
{
  -[GEOCompanionWaypoint _readSearchString]((uint64_t)self);
  return self->_searchString != 0;
}

- (NSString)searchString
{
  -[GEOCompanionWaypoint _readSearchString]((uint64_t)self);
  return self->_searchString;
}

- (void)setSearchString:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x50u;
  objc_storeStrong((id *)&self->_searchString, a3);
}

- (void)_readFindMyHandleID
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 72) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOCompanionWaypointReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readFindMyHandleID_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasFindMyHandleID
{
  -[GEOCompanionWaypoint _readFindMyHandleID]((uint64_t)self);
  return self->_findMyHandleID != 0;
}

- (NSString)findMyHandleID
{
  -[GEOCompanionWaypoint _readFindMyHandleID]((uint64_t)self);
  return self->_findMyHandleID;
}

- (void)setFindMyHandleID:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x42u;
  objc_storeStrong((id *)&self->_findMyHandleID, a3);
}

- (void)_readRouteData
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 72) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOCompanionWaypointReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRouteData_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasRouteData
{
  -[GEOCompanionWaypoint _readRouteData]((uint64_t)self);
  return self->_routeData != 0;
}

- (NSData)routeData
{
  -[GEOCompanionWaypoint _readRouteData]((uint64_t)self);
  return self->_routeData;
}

- (void)setRouteData:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x48u;
  objc_storeStrong((id *)&self->_routeData, a3);
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
  v8.super_class = (Class)GEOCompanionWaypoint;
  -[GEOCompanionWaypoint description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOCompanionWaypoint dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOCompanionWaypoint _dictionaryRepresentation:]((unsigned __int8 *)self, 0);
}

- (id)_dictionaryRepresentation:(unsigned __int8 *)a1
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

  if (a1)
  {
    objc_msgSend(a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "mapItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      if ((a2 & 1) != 0)
        objc_msgSend(v5, "jsonRepresentation");
      else
        objc_msgSend(v5, "dictionaryRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("mapItem"));

    }
    objc_msgSend(a1, "waypointTyped");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      if ((a2 & 1) != 0)
        objc_msgSend(v8, "jsonRepresentation");
      else
        objc_msgSend(v8, "dictionaryRepresentation");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("waypointTyped"));

    }
    if ((a1[72] & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a1[68]);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("isCurrentLocation"));

    }
    objc_msgSend(a1, "searchString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
      objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("searchString"));

    objc_msgSend(a1, "findMyHandleID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
      objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("findMyHandleID"));

    objc_msgSend(a1, "routeData");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v14, "base64EncodedStringWithOptions:", 0);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("routeData"));

      }
      else
      {
        objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("routeData"));
      }
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
  return -[GEOCompanionWaypoint _dictionaryRepresentation:]((unsigned __int8 *)self, 1);
}

- (GEOCompanionWaypoint)initWithDictionary:(id)a3
{
  return (GEOCompanionWaypoint *)-[GEOCompanionWaypoint _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(char)a3 isJSON:
{
  id v5;
  void *v6;
  GEOMapItemStorage *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  GEOWaypointTyped *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
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
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("mapItem"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = [GEOMapItemStorage alloc];
        if ((a3 & 1) != 0)
          v8 = -[GEOMapItemStorage initWithJSON:](v7, "initWithJSON:", v6);
        else
          v8 = -[GEOMapItemStorage initWithDictionary:](v7, "initWithDictionary:", v6);
        v9 = (void *)v8;
        objc_msgSend(a1, "setMapItem:", v8);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("waypointTyped"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = [GEOWaypointTyped alloc];
        if ((a3 & 1) != 0)
          v12 = -[GEOWaypointTyped initWithJSON:](v11, "initWithJSON:", v10);
        else
          v12 = -[GEOWaypointTyped initWithDictionary:](v11, "initWithDictionary:", v10);
        v13 = (void *)v12;
        objc_msgSend(a1, "setWaypointTyped:", v12);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("isCurrentLocation"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setIsCurrentLocation:", objc_msgSend(v14, "BOOLValue"));

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("searchString"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v16 = (void *)objc_msgSend(v15, "copy");
        objc_msgSend(a1, "setSearchString:", v16);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("findMyHandleID"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v18 = (void *)objc_msgSend(v17, "copy");
        objc_msgSend(a1, "setFindMyHandleID:", v18);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("routeData"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v19, 0);
        objc_msgSend(a1, "setRouteData:", v20);

      }
    }
  }

  return a1;
}

- (GEOCompanionWaypoint)initWithJSON:(id)a3
{
  return (GEOCompanionWaypoint *)-[GEOCompanionWaypoint _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_1109;
    else
      v8 = (int *)&readAll__nonRecursiveTag_1110;
    GEOCompanionWaypointReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
  {
    -[GEOMapItemStorage readAll:](self->_mapItem, "readAll:", 1);
    -[GEOWaypointTyped readAll:](self->_waypointTyped, "readAll:", 1);
  }
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOCompanionWaypointIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOCompanionWaypointReadAllFrom((uint64_t)self, a3, 0);
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
  if (self->_reader && (_GEOCompanionWaypointIsDirty((uint64_t)self) & 1) == 0)
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
    -[GEOCompanionWaypoint readAll:](self, "readAll:", 0);
    if (self->_mapItem)
      PBDataWriterWriteSubmessage();
    if (self->_waypointTyped)
      PBDataWriterWriteSubmessage();
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      PBDataWriterWriteBOOLField();
    if (self->_searchString)
      PBDataWriterWriteStringField();
    if (self->_findMyHandleID)
      PBDataWriterWriteStringField();
    if (self->_routeData)
      PBDataWriterWriteDataField();
  }

}

- (void)clearSensitiveFields:(unint64_t)a3
{
  GEOCompanionWaypointClearSensitiveFields(self, a3, 1);
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[GEOCompanionWaypoint _readMapItem]((uint64_t)self);
  if (-[GEOMapItemStorage hasGreenTeaWithValue:](self->_mapItem, "hasGreenTeaWithValue:", v3))
    return 1;
  -[GEOCompanionWaypoint _readWaypointTyped]((uint64_t)self);
  return -[GEOWaypointTyped hasGreenTeaWithValue:](self->_waypointTyped, "hasGreenTeaWithValue:", v3);
}

- (void)copyTo:(id)a3
{
  id *v4;
  id *v5;

  v5 = (id *)a3;
  -[GEOCompanionWaypoint readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 14) = self->_readerMarkPos;
  *((_DWORD *)v5 + 15) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_mapItem)
    objc_msgSend(v5, "setMapItem:");
  if (self->_waypointTyped)
    objc_msgSend(v5, "setWaypointTyped:");
  v4 = v5;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *((_BYTE *)v5 + 68) = self->_isCurrentLocation;
    *((_BYTE *)v5 + 72) |= 1u;
  }
  if (self->_searchString)
  {
    objc_msgSend(v5, "setSearchString:");
    v4 = v5;
  }
  if (self->_findMyHandleID)
  {
    objc_msgSend(v5, "setFindMyHandleID:");
    v4 = v5;
  }
  if (self->_routeData)
  {
    objc_msgSend(v5, "setRouteData:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_BYTE *)&self->_flags & 0x40) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOCompanionWaypointReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_8;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOCompanionWaypoint readAll:](self, "readAll:", 0);
  v9 = -[GEOMapItemStorage copyWithZone:](self->_mapItem, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v9;

  v11 = -[GEOWaypointTyped copyWithZone:](self->_waypointTyped, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v11;

  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_BYTE *)(v5 + 68) = self->_isCurrentLocation;
    *(_BYTE *)(v5 + 72) |= 1u;
  }
  v13 = -[NSString copyWithZone:](self->_searchString, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v13;

  v15 = -[NSString copyWithZone:](self->_findMyHandleID, "copyWithZone:", a3);
  v16 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v15;

  v17 = -[NSData copyWithZone:](self->_routeData, "copyWithZone:", a3);
  v8 = *(id *)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v17;
LABEL_8:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  GEOMapItemStorage *mapItem;
  GEOWaypointTyped *waypointTyped;
  NSString *searchString;
  NSString *findMyHandleID;
  NSData *routeData;
  char v10;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_20;
  -[GEOCompanionWaypoint readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  mapItem = self->_mapItem;
  if ((unint64_t)mapItem | *((_QWORD *)v4 + 3))
  {
    if (!-[GEOMapItemStorage isEqual:](mapItem, "isEqual:"))
      goto LABEL_20;
  }
  waypointTyped = self->_waypointTyped;
  if ((unint64_t)waypointTyped | *((_QWORD *)v4 + 6))
  {
    if (!-[GEOWaypointTyped isEqual:](waypointTyped, "isEqual:"))
      goto LABEL_20;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 72) & 1) != 0)
    {
      if (self->_isCurrentLocation)
      {
        if (!*((_BYTE *)v4 + 68))
          goto LABEL_20;
        goto LABEL_14;
      }
      if (!*((_BYTE *)v4 + 68))
        goto LABEL_14;
    }
LABEL_20:
    v10 = 0;
    goto LABEL_21;
  }
  if ((*((_BYTE *)v4 + 72) & 1) != 0)
    goto LABEL_20;
LABEL_14:
  searchString = self->_searchString;
  if ((unint64_t)searchString | *((_QWORD *)v4 + 5)
    && !-[NSString isEqual:](searchString, "isEqual:"))
  {
    goto LABEL_20;
  }
  findMyHandleID = self->_findMyHandleID;
  if ((unint64_t)findMyHandleID | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](findMyHandleID, "isEqual:"))
      goto LABEL_20;
  }
  routeData = self->_routeData;
  if ((unint64_t)routeData | *((_QWORD *)v4 + 4))
    v10 = -[NSData isEqual:](routeData, "isEqual:");
  else
    v10 = 1;
LABEL_21:

  return v10;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  NSUInteger v6;
  NSUInteger v7;

  -[GEOCompanionWaypoint readAll:](self, "readAll:", 1);
  v3 = -[GEOMapItemStorage hash](self->_mapItem, "hash");
  v4 = -[GEOWaypointTyped hash](self->_waypointTyped, "hash");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v5 = 2654435761 * self->_isCurrentLocation;
  else
    v5 = 0;
  v6 = v4 ^ v3 ^ v5 ^ -[NSString hash](self->_searchString, "hash");
  v7 = -[NSString hash](self->_findMyHandleID, "hash");
  return v6 ^ v7 ^ -[NSData hash](self->_routeData, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  GEOMapItemStorage *mapItem;
  uint64_t v6;
  GEOWaypointTyped *waypointTyped;
  uint64_t v8;
  _QWORD *v9;

  v9 = a3;
  objc_msgSend(v9, "readAll:", 0);
  v4 = v9;
  mapItem = self->_mapItem;
  v6 = v9[3];
  if (mapItem)
  {
    if (!v6)
      goto LABEL_7;
    -[GEOMapItemStorage mergeFrom:](mapItem, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[GEOCompanionWaypoint setMapItem:](self, "setMapItem:");
  }
  v4 = v9;
LABEL_7:
  waypointTyped = self->_waypointTyped;
  v8 = v4[6];
  if (waypointTyped)
  {
    if (!v8)
      goto LABEL_13;
    -[GEOWaypointTyped mergeFrom:](waypointTyped, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_13;
    -[GEOCompanionWaypoint setWaypointTyped:](self, "setWaypointTyped:");
  }
  v4 = v9;
LABEL_13:
  if ((v4[9] & 1) != 0)
  {
    self->_isCurrentLocation = *((_BYTE *)v4 + 68);
    *(_BYTE *)&self->_flags |= 1u;
  }
  if (v4[5])
  {
    -[GEOCompanionWaypoint setSearchString:](self, "setSearchString:");
    v4 = v9;
  }
  if (v4[2])
  {
    -[GEOCompanionWaypoint setFindMyHandleID:](self, "setFindMyHandleID:");
    v4 = v9;
  }
  if (v4[4])
  {
    -[GEOCompanionWaypoint setRouteData:](self, "setRouteData:");
    v4 = v9;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_waypointTyped, 0);
  objc_storeStrong((id *)&self->_searchString, 0);
  objc_storeStrong((id *)&self->_routeData, 0);
  objc_storeStrong((id *)&self->_mapItem, 0);
  objc_storeStrong((id *)&self->_findMyHandleID, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

- (GEOCompanionWaypoint)initWithComposedWaypoint:(id)a3
{
  id v4;
  GEOCompanionWaypoint *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  id v16;
  objc_super v17;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)GEOCompanionWaypoint;
  v5 = -[GEOCompanionWaypoint init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "mapItemStorage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOCompanionWaypoint setMapItem:](v5, "setMapItem:", v6);

    objc_msgSend(v4, "geoWaypointTyped");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOCompanionWaypoint setWaypointTyped:](v5, "setWaypointTyped:", v7);

    -[GEOCompanionWaypoint setIsCurrentLocation:](v5, "setIsCurrentLocation:", objc_msgSend(v4, "isCurrentLocation"));
    objc_msgSend(v4, "route");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      v10 = (void *)MEMORY[0x1E0CB36F8];
      objc_msgSend(v8, "persistentData");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 0;
      objc_msgSend(v10, "archivedDataWithRootObject:requiringSecureCoding:error:", v11, 1, &v16);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v16;
      -[GEOCompanionWaypoint setRouteData:](v5, "setRouteData:", v12);

      if (v13)
      {
        GEOGetCompanionExtrasLog();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v19 = v13;
          _os_log_impl(&dword_1885A9000, v14, OS_LOG_TYPE_ERROR, "Error encoding route data: %{public}@", buf, 0xCu);
        }

      }
    }

  }
  return v5;
}

- (GEOLocation)location
{
  void *v3;
  GEOLocation *v4;
  void *v5;
  double v6;
  double v7;
  GEOLocation *v8;
  void *v9;

  -[GEOCompanionWaypoint mapItem](self, "mapItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = [GEOLocation alloc];
    -[GEOCompanionWaypoint mapItem](self, "mapItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "coordinate");
    v8 = -[GEOLocation initWithGEOCoordinate:isUserLocation:](v4, "initWithGEOCoordinate:isUserLocation:", -[GEOCompanionWaypoint isCurrentLocation](self, "isCurrentLocation"), v6, v7);
  }
  else
  {
    -[GEOCompanionWaypoint waypointTyped](self, "waypointTyped");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "waypointLocation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "location");
    v8 = (GEOLocation *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

@end
