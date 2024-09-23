@implementation GEOURLRouteHandle

- (GEOURLRouteHandle)init
{
  GEOURLRouteHandle *v2;
  GEOURLRouteHandle *v3;
  GEOURLRouteHandle *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOURLRouteHandle;
  v2 = -[GEOURLRouteHandle init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOURLRouteHandle)initWithData:(id)a3
{
  GEOURLRouteHandle *v3;
  GEOURLRouteHandle *v4;
  GEOURLRouteHandle *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOURLRouteHandle;
  v3 = -[GEOURLRouteHandle initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readDirectionsResponseID
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_BYTE *)(a1 + 60) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOURLRouteHandleReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDirectionsResponseID_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasDirectionsResponseID
{
  -[GEOURLRouteHandle _readDirectionsResponseID]((uint64_t)self);
  return self->_directionsResponseID != 0;
}

- (NSData)directionsResponseID
{
  -[GEOURLRouteHandle _readDirectionsResponseID]((uint64_t)self);
  return self->_directionsResponseID;
}

- (void)setDirectionsResponseID:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x11u;
  objc_storeStrong((id *)&self->_directionsResponseID, a3);
}

- (void)_readRouteID
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
        GEOURLRouteHandleReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRouteID_tags_1);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasRouteID
{
  -[GEOURLRouteHandle _readRouteID]((uint64_t)self);
  return self->_routeID != 0;
}

- (NSData)routeID
{
  -[GEOURLRouteHandle _readRouteID]((uint64_t)self);
  return self->_routeID;
}

- (void)setRouteID:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x12u;
  objc_storeStrong((id *)&self->_routeID, a3);
}

- (void)_readZilchPoints
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
        GEOURLRouteHandleReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readZilchPoints_tags_2);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasZilchPoints
{
  -[GEOURLRouteHandle _readZilchPoints]((uint64_t)self);
  return self->_zilchPoints != 0;
}

- (NSData)zilchPoints
{
  -[GEOURLRouteHandle _readZilchPoints]((uint64_t)self);
  return self->_zilchPoints;
}

- (void)setZilchPoints:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x18u;
  objc_storeStrong((id *)&self->_zilchPoints, a3);
}

- (void)_readTransitData
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
        GEOURLRouteHandleReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTransitData_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasTransitData
{
  -[GEOURLRouteHandle _readTransitData]((uint64_t)self);
  return self->_transitData != 0;
}

- (NSData)transitData
{
  -[GEOURLRouteHandle _readTransitData]((uint64_t)self);
  return self->_transitData;
}

- (void)setTransitData:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x14u;
  objc_storeStrong((id *)&self->_transitData, a3);
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
  v8.super_class = (Class)GEOURLRouteHandle;
  -[GEOURLRouteHandle description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOURLRouteHandle dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOURLRouteHandle _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(void *)a1
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
    objc_msgSend(a1, "directionsResponseID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v5, "base64EncodedStringWithOptions:", 0);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("directionsResponseID"));

      }
      else
      {
        objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("directionsResponseID"));
      }
    }

    objc_msgSend(a1, "routeID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v8, "base64EncodedStringWithOptions:", 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("routeID"));

      }
      else
      {
        objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("routeID"));
      }
    }

    objc_msgSend(a1, "zilchPoints");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v11, "base64EncodedStringWithOptions:", 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("zilchPoints"));

      }
      else
      {
        objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("zilchPoints"));
      }
    }

    objc_msgSend(a1, "transitData");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v14, "base64EncodedStringWithOptions:", 0);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("transitData"));

      }
      else
      {
        objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("transitData"));
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
  return -[GEOURLRouteHandle _dictionaryRepresentation:](self, 1);
}

- (GEOURLRouteHandle)initWithDictionary:(id)a3
{
  return (GEOURLRouteHandle *)-[GEOURLRouteHandle _initWithDictionary:isJSON:](self, a3);
}

- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("directionsResponseID"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v4, 0);
        objc_msgSend(a1, "setDirectionsResponseID:", v5);

      }
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("routeID"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v6, 0);
        objc_msgSend(a1, "setRouteID:", v7);

      }
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("zilchPoints"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v8, 0);
        objc_msgSend(a1, "setZilchPoints:", v9);

      }
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("transitData"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v10, 0);
        objc_msgSend(a1, "setTransitData:", v11);

      }
    }
  }

  return a1;
}

- (GEOURLRouteHandle)initWithJSON:(id)a3
{
  return (GEOURLRouteHandle *)-[GEOURLRouteHandle _initWithDictionary:isJSON:](self, a3);
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
      v8 = (int *)&readAll__recursiveTag_299;
    else
      v8 = (int *)&readAll__nonRecursiveTag_300;
    GEOURLRouteHandleReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOURLRouteHandleIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOURLRouteHandleReadAllFrom((uint64_t)self, a3, 0);
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
    -[GEOURLRouteHandle readAll:](self, "readAll:", 0);
    if (self->_directionsResponseID)
      PBDataWriterWriteDataField();
    if (self->_routeID)
      PBDataWriterWriteDataField();
    if (self->_zilchPoints)
      PBDataWriterWriteDataField();
    if (self->_transitData)
      PBDataWriterWriteDataField();
  }

}

- (void)copyTo:(id)a3
{
  id *v4;
  id *v5;

  v5 = (id *)a3;
  -[GEOURLRouteHandle readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 12) = self->_readerMarkPos;
  *((_DWORD *)v5 + 13) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_directionsResponseID)
    objc_msgSend(v5, "setDirectionsResponseID:");
  if (self->_routeID)
    objc_msgSend(v5, "setRouteID:");
  v4 = v5;
  if (self->_zilchPoints)
  {
    objc_msgSend(v5, "setZilchPoints:");
    v4 = v5;
  }
  if (self->_transitData)
  {
    objc_msgSend(v5, "setTransitData:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  PBDataReader *reader;
  PBDataReader *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;

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
    -[GEOURLRouteHandle readAll:](self, "readAll:", 0);
    v8 = -[NSData copyWithZone:](self->_directionsResponseID, "copyWithZone:", a3);
    v9 = (void *)v5[2];
    v5[2] = v8;

    v10 = -[NSData copyWithZone:](self->_routeID, "copyWithZone:", a3);
    v11 = (void *)v5[3];
    v5[3] = v10;

    v12 = -[NSData copyWithZone:](self->_zilchPoints, "copyWithZone:", a3);
    v13 = (void *)v5[5];
    v5[5] = v12;

    v14 = -[NSData copyWithZone:](self->_transitData, "copyWithZone:", a3);
    v7 = (PBDataReader *)v5[4];
    v5[4] = v14;
    goto LABEL_6;
  }
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  GEOURLRouteHandleReadAllFrom((uint64_t)v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);
LABEL_6:

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSData *directionsResponseID;
  NSData *routeID;
  NSData *zilchPoints;
  NSData *transitData;
  char v9;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((-[GEOURLRouteHandle readAll:](self, "readAll:", 1),
         objc_msgSend(v4, "readAll:", 1),
         directionsResponseID = self->_directionsResponseID,
         !((unint64_t)directionsResponseID | v4[2]))
     || -[NSData isEqual:](directionsResponseID, "isEqual:"))
    && ((routeID = self->_routeID, !((unint64_t)routeID | v4[3]))
     || -[NSData isEqual:](routeID, "isEqual:"))
    && ((zilchPoints = self->_zilchPoints, !((unint64_t)zilchPoints | v4[5]))
     || -[NSData isEqual:](zilchPoints, "isEqual:")))
  {
    transitData = self->_transitData;
    if ((unint64_t)transitData | v4[4])
      v9 = -[NSData isEqual:](transitData, "isEqual:");
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
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  -[GEOURLRouteHandle readAll:](self, "readAll:", 1);
  v3 = -[NSData hash](self->_directionsResponseID, "hash");
  v4 = -[NSData hash](self->_routeID, "hash") ^ v3;
  v5 = -[NSData hash](self->_zilchPoints, "hash");
  return v4 ^ v5 ^ -[NSData hash](self->_transitData, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;

  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  if (v4[2])
    -[GEOURLRouteHandle setDirectionsResponseID:](self, "setDirectionsResponseID:");
  if (v4[3])
    -[GEOURLRouteHandle setRouteID:](self, "setRouteID:");
  if (v4[5])
    -[GEOURLRouteHandle setZilchPoints:](self, "setZilchPoints:");
  if (v4[4])
    -[GEOURLRouteHandle setTransitData:](self, "setTransitData:");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zilchPoints, 0);
  objc_storeStrong((id *)&self->_transitData, 0);
  objc_storeStrong((id *)&self->_routeID, 0);
  objc_storeStrong((id *)&self->_directionsResponseID, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
