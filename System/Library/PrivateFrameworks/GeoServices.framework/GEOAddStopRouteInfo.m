@implementation GEOAddStopRouteInfo

- (GEOAddStopRouteInfo)init
{
  GEOAddStopRouteInfo *v2;
  GEOAddStopRouteInfo *v3;
  GEOAddStopRouteInfo *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOAddStopRouteInfo;
  v2 = -[GEOAddStopRouteInfo init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOAddStopRouteInfo)initWithData:(id)a3
{
  GEOAddStopRouteInfo *v3;
  GEOAddStopRouteInfo *v4;
  GEOAddStopRouteInfo *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOAddStopRouteInfo;
  v3 = -[GEOAddStopRouteInfo initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readOriginalWaypointRouteRepresentation
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_BYTE *)(a1 + 76) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOAddStopRouteInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readOriginalWaypointRouteRepresentation_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasOriginalWaypointRouteRepresentation
{
  -[GEOAddStopRouteInfo _readOriginalWaypointRouteRepresentation]((uint64_t)self);
  return self->_originalWaypointRouteRepresentation != 0;
}

- (NSData)originalWaypointRouteRepresentation
{
  -[GEOAddStopRouteInfo _readOriginalWaypointRouteRepresentation]((uint64_t)self);
  return self->_originalWaypointRouteRepresentation;
}

- (void)setOriginalWaypointRouteRepresentation:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x42u;
  objc_storeStrong((id *)&self->_originalWaypointRouteRepresentation, a3);
}

- (void)_readZilchData
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_BYTE *)(a1 + 76) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOAddStopRouteInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readZilchData_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasZilchData
{
  -[GEOAddStopRouteInfo _readZilchData]((uint64_t)self);
  return self->_zilchData != 0;
}

- (NSData)zilchData
{
  -[GEOAddStopRouteInfo _readZilchData]((uint64_t)self);
  return self->_zilchData;
}

- (void)setZilchData:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x60u;
  objc_storeStrong((id *)&self->_zilchData, a3);
}

- (void)_readSessionState
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_BYTE *)(a1 + 76) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOAddStopRouteInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSessionState_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasSessionState
{
  -[GEOAddStopRouteInfo _readSessionState]((uint64_t)self);
  return self->_sessionState != 0;
}

- (NSData)sessionState
{
  -[GEOAddStopRouteInfo _readSessionState]((uint64_t)self);
  return self->_sessionState;
}

- (void)setSessionState:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x50u;
  objc_storeStrong((id *)&self->_sessionState, a3);
}

- (void)_readRouteId
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_BYTE *)(a1 + 76) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOAddStopRouteInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRouteId_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasRouteId
{
  -[GEOAddStopRouteInfo _readRouteId]((uint64_t)self);
  return self->_routeId != 0;
}

- (NSData)routeId
{
  -[GEOAddStopRouteInfo _readRouteId]((uint64_t)self);
  return self->_routeId;
}

- (void)setRouteId:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x48u;
  objc_storeStrong((id *)&self->_routeId, a3);
}

- (void)_readRouteAttributes
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_BYTE *)(a1 + 76) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOAddStopRouteInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRouteAttributes_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasRouteAttributes
{
  -[GEOAddStopRouteInfo _readRouteAttributes]((uint64_t)self);
  return self->_routeAttributes != 0;
}

- (GEORouteAttributes)routeAttributes
{
  -[GEOAddStopRouteInfo _readRouteAttributes]((uint64_t)self);
  return self->_routeAttributes;
}

- (void)setRouteAttributes:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x44u;
  objc_storeStrong((id *)&self->_routeAttributes, a3);
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
  v8.super_class = (Class)GEOAddStopRouteInfo;
  -[GEOAddStopRouteInfo description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOAddStopRouteInfo dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOAddStopRouteInfo _dictionaryRepresentation:](self, 0);
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
  const __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  _QWORD v28[4];
  id v29;

  if (!a1)
    return 0;
  objc_msgSend(a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "originalWaypointRouteRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v5, "base64EncodedStringWithOptions:", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("originalWaypointRouteRepresentation"));

    }
    else
    {
      objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("original_waypoint_route_representation"));
    }
  }

  objc_msgSend(a1, "zilchData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v8, "base64EncodedStringWithOptions:", 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("zilchData"));

    }
    else
    {
      objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("zilch_data"));
    }
  }

  objc_msgSend(a1, "sessionState");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v11, "base64EncodedStringWithOptions:", 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("sessionState"));

    }
    else
    {
      objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("session_state"));
    }
  }

  objc_msgSend(a1, "routeId");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v14, "base64EncodedStringWithOptions:", 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("routeId"));

    }
    else
    {
      objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("route_id"));
    }
  }

  objc_msgSend(a1, "routeAttributes");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v17, "jsonRepresentation");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = CFSTR("routeAttributes");
    }
    else
    {
      objc_msgSend(v17, "dictionaryRepresentation");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = CFSTR("route_attributes");
    }
    objc_msgSend(v4, "setObject:forKey:", v19, v20);

  }
  v21 = (void *)a1[2];
  if (v21)
  {
    objc_msgSend(v21, "dictionaryRepresentation");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v22, "count"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __49__GEOAddStopRouteInfo__dictionaryRepresentation___block_invoke;
      v28[3] = &unk_1E1C00600;
      v25 = v24;
      v29 = v25;
      objc_msgSend(v23, "enumerateKeysAndObjectsUsingBlock:", v28);
      v26 = v25;

      v23 = v26;
    }
    objc_msgSend(v4, "setObject:forKey:", v23, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOAddStopRouteInfo _dictionaryRepresentation:](self, 1);
}

void __49__GEOAddStopRouteInfo__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOAddStopRouteInfo)initWithDictionary:(id)a3
{
  return (GEOAddStopRouteInfo *)-[GEOAddStopRouteInfo _initWithDictionary:isJSON:](self, a3, 0);
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
  void *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  GEORouteAttributes *v20;
  uint64_t v21;
  void *v22;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("originalWaypointRouteRepresentation");
      else
        v6 = CFSTR("original_waypoint_route_representation");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v7, 0);
        objc_msgSend(a1, "setOriginalWaypointRouteRepresentation:", v8);

      }
      if (a3)
        v9 = CFSTR("zilchData");
      else
        v9 = CFSTR("zilch_data");
      objc_msgSend(v5, "objectForKeyedSubscript:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v10, 0);
        objc_msgSend(a1, "setZilchData:", v11);

      }
      if (a3)
        v12 = CFSTR("sessionState");
      else
        v12 = CFSTR("session_state");
      objc_msgSend(v5, "objectForKeyedSubscript:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v13, 0);
        objc_msgSend(a1, "setSessionState:", v14);

      }
      if (a3)
        v15 = CFSTR("routeId");
      else
        v15 = CFSTR("route_id");
      objc_msgSend(v5, "objectForKeyedSubscript:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v16, 0);
        objc_msgSend(a1, "setRouteId:", v17);

      }
      if (a3)
        v18 = CFSTR("routeAttributes");
      else
        v18 = CFSTR("route_attributes");
      objc_msgSend(v5, "objectForKeyedSubscript:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v20 = [GEORouteAttributes alloc];
        if ((a3 & 1) != 0)
          v21 = -[GEORouteAttributes initWithJSON:](v20, "initWithJSON:", v19);
        else
          v21 = -[GEORouteAttributes initWithDictionary:](v20, "initWithDictionary:", v19);
        v22 = (void *)v21;
        objc_msgSend(a1, "setRouteAttributes:", v21);

      }
    }
  }

  return a1;
}

- (GEOAddStopRouteInfo)initWithJSON:(id)a3
{
  return (GEOAddStopRouteInfo *)-[GEOAddStopRouteInfo _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_53;
    else
      v8 = (int *)&readAll__nonRecursiveTag_53;
    GEOAddStopRouteInfoReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    -[GEORouteAttributes readAll:](self->_routeAttributes, "readAll:", 1);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOAddStopRouteInfoIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOAddStopRouteInfoReadAllFrom((uint64_t)self, a3, 0);
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
  if (self->_reader && (_GEOAddStopRouteInfoIsDirty((uint64_t)self) & 1) == 0)
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
    -[GEOAddStopRouteInfo readAll:](self, "readAll:", 0);
    if (self->_originalWaypointRouteRepresentation)
      PBDataWriterWriteDataField();
    v5 = v8;
    if (self->_zilchData)
    {
      PBDataWriterWriteDataField();
      v5 = v8;
    }
    if (self->_sessionState)
    {
      PBDataWriterWriteDataField();
      v5 = v8;
    }
    if (self->_routeId)
    {
      PBDataWriterWriteDataField();
      v5 = v8;
    }
    if (self->_routeAttributes)
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
  -[GEOAddStopRouteInfo readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 16) = self->_readerMarkPos;
  *((_DWORD *)v5 + 17) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_originalWaypointRouteRepresentation)
    objc_msgSend(v5, "setOriginalWaypointRouteRepresentation:");
  if (self->_zilchData)
    objc_msgSend(v5, "setZilchData:");
  v4 = v5;
  if (self->_sessionState)
  {
    objc_msgSend(v5, "setSessionState:");
    v4 = v5;
  }
  if (self->_routeId)
  {
    objc_msgSend(v5, "setRouteId:");
    v4 = v5;
  }
  if (self->_routeAttributes)
  {
    objc_msgSend(v5, "setRouteAttributes:");
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
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
    goto LABEL_5;
  v7 = reader;
  objc_sync_enter(v7);
  if ((*(_BYTE *)&self->_flags & 0x40) != 0)
  {
    objc_sync_exit(v7);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOAddStopRouteInfo readAll:](self, "readAll:", 0);
    v8 = -[NSData copyWithZone:](self->_originalWaypointRouteRepresentation, "copyWithZone:", a3);
    v9 = *(void **)(v5 + 24);
    *(_QWORD *)(v5 + 24) = v8;

    v10 = -[NSData copyWithZone:](self->_zilchData, "copyWithZone:", a3);
    v11 = *(void **)(v5 + 56);
    *(_QWORD *)(v5 + 56) = v10;

    v12 = -[NSData copyWithZone:](self->_sessionState, "copyWithZone:", a3);
    v13 = *(void **)(v5 + 48);
    *(_QWORD *)(v5 + 48) = v12;

    v14 = -[NSData copyWithZone:](self->_routeId, "copyWithZone:", a3);
    v15 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v14;

    v16 = -[GEORouteAttributes copyWithZone:](self->_routeAttributes, "copyWithZone:", a3);
    v17 = *(void **)(v5 + 32);
    *(_QWORD *)(v5 + 32) = v16;

    objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
    return (id)v5;
  }
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  GEOAddStopRouteInfoReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSData *originalWaypointRouteRepresentation;
  NSData *zilchData;
  NSData *sessionState;
  NSData *routeId;
  GEORouteAttributes *routeAttributes;
  char v10;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((-[GEOAddStopRouteInfo readAll:](self, "readAll:", 1),
         objc_msgSend(v4, "readAll:", 1),
         originalWaypointRouteRepresentation = self->_originalWaypointRouteRepresentation,
         !((unint64_t)originalWaypointRouteRepresentation | v4[3]))
     || -[NSData isEqual:](originalWaypointRouteRepresentation, "isEqual:"))
    && ((zilchData = self->_zilchData, !((unint64_t)zilchData | v4[7]))
     || -[NSData isEqual:](zilchData, "isEqual:"))
    && ((sessionState = self->_sessionState, !((unint64_t)sessionState | v4[6]))
     || -[NSData isEqual:](sessionState, "isEqual:"))
    && ((routeId = self->_routeId, !((unint64_t)routeId | v4[5]))
     || -[NSData isEqual:](routeId, "isEqual:")))
  {
    routeAttributes = self->_routeAttributes;
    if ((unint64_t)routeAttributes | v4[4])
      v10 = -[GEORouteAttributes isEqual:](routeAttributes, "isEqual:");
    else
      v10 = 1;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  -[GEOAddStopRouteInfo readAll:](self, "readAll:", 1);
  v3 = -[NSData hash](self->_originalWaypointRouteRepresentation, "hash");
  v4 = -[NSData hash](self->_zilchData, "hash") ^ v3;
  v5 = -[NSData hash](self->_sessionState, "hash");
  v6 = v4 ^ v5 ^ -[NSData hash](self->_routeId, "hash");
  return v6 ^ -[GEORouteAttributes hash](self->_routeAttributes, "hash");
}

- (void)mergeFrom:(id)a3
{
  GEORouteAttributes *routeAttributes;
  uint64_t v5;
  _QWORD *v6;

  v6 = a3;
  objc_msgSend(v6, "readAll:", 0);
  if (v6[3])
    -[GEOAddStopRouteInfo setOriginalWaypointRouteRepresentation:](self, "setOriginalWaypointRouteRepresentation:");
  if (v6[7])
    -[GEOAddStopRouteInfo setZilchData:](self, "setZilchData:");
  if (v6[6])
    -[GEOAddStopRouteInfo setSessionState:](self, "setSessionState:");
  if (v6[5])
    -[GEOAddStopRouteInfo setRouteId:](self, "setRouteId:");
  routeAttributes = self->_routeAttributes;
  v5 = v6[4];
  if (routeAttributes)
  {
    if (v5)
      -[GEORouteAttributes mergeFrom:](routeAttributes, "mergeFrom:");
  }
  else if (v5)
  {
    -[GEOAddStopRouteInfo setRouteAttributes:](self, "setRouteAttributes:");
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
      GEOAddStopRouteInfoReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_11);
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
  *(_BYTE *)&self->_flags |= 0x41u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEOAddStopRouteInfo readAll:](self, "readAll:", 0);
    -[GEORouteAttributes clearUnknownFields:](self->_routeAttributes, "clearUnknownFields:", 1);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zilchData, 0);
  objc_storeStrong((id *)&self->_sessionState, 0);
  objc_storeStrong((id *)&self->_routeId, 0);
  objc_storeStrong((id *)&self->_routeAttributes, 0);
  objc_storeStrong((id *)&self->_originalWaypointRouteRepresentation, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
