@implementation GEOStorageResumeRouteHandle

- (GEOStorageResumeRouteHandle)init
{
  GEOStorageResumeRouteHandle *v2;
  GEOStorageResumeRouteHandle *v3;
  GEOStorageResumeRouteHandle *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOStorageResumeRouteHandle;
  v2 = -[GEOStorageResumeRouteHandle init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOStorageResumeRouteHandle)initWithData:(id)a3
{
  GEOStorageResumeRouteHandle *v3;
  GEOStorageResumeRouteHandle *v4;
  GEOStorageResumeRouteHandle *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOStorageResumeRouteHandle;
  v3 = -[GEOStorageResumeRouteHandle initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readRouteGeometry
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(_BYTE *)(a1 + 56) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOStorageResumeRouteHandleReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRouteGeometry_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasRouteGeometry
{
  -[GEOStorageResumeRouteHandle _readRouteGeometry]((uint64_t)self);
  return self->_routeGeometry != 0;
}

- (GEOOriginalWaypointRoute)routeGeometry
{
  -[GEOStorageResumeRouteHandle _readRouteGeometry]((uint64_t)self);
  return self->_routeGeometry;
}

- (void)setRouteGeometry:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x14u;
  objc_storeStrong((id *)&self->_routeGeometry, a3);
}

- (void)_readServerSessionState
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(_BYTE *)(a1 + 56) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOStorageResumeRouteHandleReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readServerSessionState_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasServerSessionState
{
  -[GEOStorageResumeRouteHandle _readServerSessionState]((uint64_t)self);
  return self->_serverSessionState != 0;
}

- (NSData)serverSessionState
{
  -[GEOStorageResumeRouteHandle _readServerSessionState]((uint64_t)self);
  return self->_serverSessionState;
}

- (void)setServerSessionState:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x18u;
  objc_storeStrong((id *)&self->_serverSessionState, a3);
}

- (BOOL)hasVisitedFirstStop
{
  return self->_hasVisitedFirstStop;
}

- (void)setHasVisitedFirstStop:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 0x11u;
  self->_hasVisitedFirstStop = a3;
}

- (void)setHasHasVisitedFirstStop:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3 | 0x10;
}

- (BOOL)hasHasVisitedFirstStop
{
  return *(_BYTE *)&self->_flags & 1;
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
  v8.super_class = (Class)GEOStorageResumeRouteHandle;
  -[GEOStorageResumeRouteHandle description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOStorageResumeRouteHandle dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOStorageResumeRouteHandle _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
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
  id v16;
  id v17;
  _QWORD v19[4];
  id v20;

  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)a1, "routeGeometry");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v5, "jsonRepresentation");
    else
      objc_msgSend(v5, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("routeGeometry"));

  }
  objc_msgSend((id)a1, "serverSessionState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v8, "base64EncodedStringWithOptions:", 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("serverSessionState"));

    }
    else
    {
      objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("serverSessionState"));
    }
  }

  if ((*(_BYTE *)(a1 + 56) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 52));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("hasVisitedFirstStop"));

  }
  v12 = *(void **)(a1 + 16);
  if (v12)
  {
    objc_msgSend(v12, "dictionaryRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v13, "count"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __57__GEOStorageResumeRouteHandle__dictionaryRepresentation___block_invoke;
      v19[3] = &unk_1E1C00600;
      v16 = v15;
      v20 = v16;
      objc_msgSend(v14, "enumerateKeysAndObjectsUsingBlock:", v19);
      v17 = v16;

      v14 = v17;
    }
    objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOStorageResumeRouteHandle _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __57__GEOStorageResumeRouteHandle__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOStorageResumeRouteHandle)initWithDictionary:(id)a3
{
  return (GEOStorageResumeRouteHandle *)-[GEOStorageResumeRouteHandle _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(char)a3 isJSON:
{
  id v5;
  void *v6;
  GEOOriginalWaypointRoute *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("routeGeometry"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = [GEOOriginalWaypointRoute alloc];
        if ((a3 & 1) != 0)
          v8 = -[GEOOriginalWaypointRoute initWithJSON:](v7, "initWithJSON:", v6);
        else
          v8 = -[GEOOriginalWaypointRoute initWithDictionary:](v7, "initWithDictionary:", v6);
        v9 = (void *)v8;
        objc_msgSend(a1, "setRouteGeometry:", v8);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("serverSessionState"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v10, 0);
        objc_msgSend(a1, "setServerSessionState:", v11);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("hasVisitedFirstStop"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setHasVisitedFirstStop:", objc_msgSend(v12, "BOOLValue"));

    }
  }

  return a1;
}

- (GEOStorageResumeRouteHandle)initWithJSON:(id)a3
{
  return (GEOStorageResumeRouteHandle *)-[GEOStorageResumeRouteHandle _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_30;
    else
      v8 = (int *)&readAll__nonRecursiveTag_30;
    GEOStorageResumeRouteHandleReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    -[GEOOriginalWaypointRoute readAll:](self->_routeGeometry, "readAll:", 1);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOStorageResumeRouteHandleIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOStorageResumeRouteHandleReadAllFrom((uint64_t)self, a3, 0);
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
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_BYTE *)&self->_flags & 0x1C) == 0))
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
    -[GEOStorageResumeRouteHandle readAll:](self, "readAll:", 0);
    if (self->_routeGeometry)
      PBDataWriterWriteSubmessage();
    v5 = v8;
    if (self->_serverSessionState)
    {
      PBDataWriterWriteDataField();
      v5 = v8;
    }
    if ((*(_BYTE *)&self->_flags & 1) != 0)
    {
      PBDataWriterWriteBOOLField();
      v5 = v8;
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v5);
  }

}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[GEOStorageResumeRouteHandle _readRouteGeometry]((uint64_t)self);
  return -[GEOOriginalWaypointRoute hasGreenTeaWithValue:](self->_routeGeometry, "hasGreenTeaWithValue:", v3);
}

- (void)copyTo:(id)a3
{
  id *v4;

  v4 = (id *)a3;
  -[GEOStorageResumeRouteHandle readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v4 + 1, self->_reader);
  *((_DWORD *)v4 + 10) = self->_readerMarkPos;
  *((_DWORD *)v4 + 11) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_routeGeometry)
    objc_msgSend(v4, "setRouteGeometry:");
  if (self->_serverSessionState)
    objc_msgSend(v4, "setServerSessionState:");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *((_BYTE *)v4 + 52) = self->_hasVisitedFirstStop;
    *((_BYTE *)v4 + 56) |= 1u;
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
  uint64_t v11;
  void *v12;
  PBUnknownFields *v13;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_BYTE *)&self->_flags & 0x10) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOStorageResumeRouteHandleReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_8;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOStorageResumeRouteHandle readAll:](self, "readAll:", 0);
  v9 = -[GEOOriginalWaypointRoute copyWithZone:](self->_routeGeometry, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v9;

  v11 = -[NSData copyWithZone:](self->_serverSessionState, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v11;

  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_BYTE *)(v5 + 52) = self->_hasVisitedFirstStop;
    *(_BYTE *)(v5 + 56) |= 1u;
  }
  v13 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v13;
LABEL_8:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  GEOOriginalWaypointRoute *routeGeometry;
  NSData *serverSessionState;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_8;
  -[GEOStorageResumeRouteHandle readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  routeGeometry = self->_routeGeometry;
  if ((unint64_t)routeGeometry | *((_QWORD *)v4 + 3))
  {
    if (!-[GEOOriginalWaypointRoute isEqual:](routeGeometry, "isEqual:"))
      goto LABEL_8;
  }
  serverSessionState = self->_serverSessionState;
  if ((unint64_t)serverSessionState | *((_QWORD *)v4 + 4))
  {
    if (!-[NSData isEqual:](serverSessionState, "isEqual:"))
      goto LABEL_8;
  }
  v7 = (*((_BYTE *)v4 + 56) & 1) == 0;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 1) == 0)
    {
LABEL_8:
      v7 = 0;
      goto LABEL_9;
    }
    if (self->_hasVisitedFirstStop)
    {
      if (!*((_BYTE *)v4 + 52))
        goto LABEL_8;
    }
    else if (*((_BYTE *)v4 + 52))
    {
      goto LABEL_8;
    }
    v7 = 1;
  }
LABEL_9:

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;

  -[GEOStorageResumeRouteHandle readAll:](self, "readAll:", 1);
  v3 = -[GEOOriginalWaypointRoute hash](self->_routeGeometry, "hash");
  v4 = -[NSData hash](self->_serverSessionState, "hash");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v5 = 2654435761 * self->_hasVisitedFirstStop;
  else
    v5 = 0;
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  GEOOriginalWaypointRoute *routeGeometry;
  uint64_t v5;
  BOOL *v6;
  _QWORD *v7;

  v7 = a3;
  objc_msgSend(v7, "readAll:", 0);
  routeGeometry = self->_routeGeometry;
  v5 = v7[3];
  if (routeGeometry)
  {
    if (v5)
      -[GEOOriginalWaypointRoute mergeFrom:](routeGeometry, "mergeFrom:");
  }
  else if (v5)
  {
    -[GEOStorageResumeRouteHandle setRouteGeometry:](self, "setRouteGeometry:");
  }
  v6 = (BOOL *)v7;
  if (v7[4])
  {
    -[GEOStorageResumeRouteHandle setServerSessionState:](self, "setServerSessionState:");
    v6 = (BOOL *)v7;
  }
  if (v6[56])
  {
    self->_hasVisitedFirstStop = v6[52];
    *(_BYTE *)&self->_flags |= 1u;
  }

}

- (PBUnknownFields)unknownFields
{
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v5;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_BYTE *)&self->_flags & 2) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      v5 = reader;
      objc_sync_enter(v5);
      GEOStorageResumeRouteHandleReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_7);
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
  *(_BYTE *)&self->_flags |= 0x12u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEOStorageResumeRouteHandle readAll:](self, "readAll:", 0);
    -[GEOOriginalWaypointRoute clearUnknownFields:](self->_routeGeometry, "clearUnknownFields:", 1);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverSessionState, 0);
  objc_storeStrong((id *)&self->_routeGeometry, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
