@implementation GEOOriginalRoute

- (GEOOriginalRoute)init
{
  GEOOriginalRoute *v2;
  GEOOriginalRoute *v3;
  GEOOriginalRoute *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOOriginalRoute;
  v2 = -[GEOOriginalRoute init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOOriginalRoute)initWithData:(id)a3
{
  GEOOriginalRoute *v3;
  GEOOriginalRoute *v4;
  GEOOriginalRoute *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOOriginalRoute;
  v3 = -[GEOOriginalRoute initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (int)originalRoutePurpose
{
  os_unfair_lock_s *p_readerLock;
  char flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 1) != 0)
    return self->_originalRoutePurpose;
  else
    return -1;
}

- (void)setOriginalRoutePurpose:(int)a3
{
  *(_BYTE *)&self->_flags |= 0x21u;
  self->_originalRoutePurpose = a3;
}

- (void)setHasOriginalRoutePurpose:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3 | 0x20;
}

- (BOOL)hasOriginalRoutePurpose
{
  return *(_BYTE *)&self->_flags & 1;
}

- (id)originalRoutePurposeAsString:(int)a3
{
  __CFString *v3;

  if (a3 == -1)
    return CFSTR("PURPOSE_UNKNOWN");
  if (a3 == 2)
  {
    v3 = CFSTR("RETRIEVE_ROUTE_SET");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsOriginalRoutePurpose:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PURPOSE_UNKNOWN")) & 1) != 0)
  {
    v4 = -1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("RETRIEVE_ROUTE_SET")))
  {
    v4 = 2;
  }
  else
  {
    v4 = -1;
  }

  return v4;
}

- (void)_readRouteHandle
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(_BYTE *)(a1 + 60) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOOriginalRouteReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRouteHandle_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasRouteHandle
{
  -[GEOOriginalRoute _readRouteHandle]((uint64_t)self);
  return self->_routeHandle != 0;
}

- (NSData)routeHandle
{
  -[GEOOriginalRoute _readRouteHandle]((uint64_t)self);
  return self->_routeHandle;
}

- (void)setRouteHandle:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x30u;
  objc_storeStrong((id *)&self->_routeHandle, a3);
}

- (void)_readOriginalDirectionsResponseID
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(_BYTE *)(a1 + 60) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOOriginalRouteReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readOriginalDirectionsResponseID_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasOriginalDirectionsResponseID
{
  -[GEOOriginalRoute _readOriginalDirectionsResponseID]((uint64_t)self);
  return self->_originalDirectionsResponseID != 0;
}

- (NSData)originalDirectionsResponseID
{
  -[GEOOriginalRoute _readOriginalDirectionsResponseID]((uint64_t)self);
  return self->_originalDirectionsResponseID;
}

- (void)setOriginalDirectionsResponseID:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x28u;
  objc_storeStrong((id *)&self->_originalDirectionsResponseID, a3);
}

- (unsigned)routeIndex
{
  return self->_routeIndex;
}

- (void)setRouteIndex:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 0x22u;
  self->_routeIndex = a3;
}

- (void)setHasRouteIndex:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 34;
  else
    v3 = 32;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasRouteIndex
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
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
  v8.super_class = (Class)GEOOriginalRoute;
  -[GEOOriginalRoute description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOOriginalRoute dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOOriginalRoute _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  int v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
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
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)(a1 + 60) & 1) != 0)
  {
    v5 = *(_DWORD *)(a1 + 52);
    if (v5 == -1)
    {
      v6 = CFSTR("PURPOSE_UNKNOWN");
    }
    else if (v5 == 2)
    {
      v6 = CFSTR("RETRIEVE_ROUTE_SET");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 52));
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("originalRoutePurpose"));

  }
  objc_msgSend((id)a1, "routeHandle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v7, "base64EncodedStringWithOptions:", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("routeHandle"));

    }
    else
    {
      objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("routeHandle"));
    }
  }

  objc_msgSend((id)a1, "originalDirectionsResponseID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v10, "base64EncodedStringWithOptions:", 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("originalDirectionsResponseID"));

    }
    else
    {
      objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("originalDirectionsResponseID"));
    }
  }

  if ((*(_BYTE *)(a1 + 60) & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 56));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v14 = CFSTR("routeIndex");
    else
      v14 = CFSTR("route_index");
    objc_msgSend(v4, "setObject:forKey:", v13, v14);

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
      v22[2] = __46__GEOOriginalRoute__dictionaryRepresentation___block_invoke;
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
  return -[GEOOriginalRoute _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __46__GEOOriginalRoute__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOOriginalRoute)initWithDictionary:(id)a3
{
  return (GEOOriginalRoute *)-[GEOOriginalRoute _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  void *v14;

  v5 = a2;
  if (!a1)
    goto LABEL_23;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_23;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("originalRoutePurpose"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v6;
    if ((objc_msgSend(v7, "isEqualToString:", CFSTR("PURPOSE_UNKNOWN")) & 1) != 0)
    {
      v8 = 0xFFFFFFFFLL;
    }
    else if (objc_msgSend(v7, "isEqualToString:", CFSTR("RETRIEVE_ROUTE_SET")))
    {
      v8 = 2;
    }
    else
    {
      v8 = 0xFFFFFFFFLL;
    }

    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = objc_msgSend(v6, "intValue");
LABEL_12:
    objc_msgSend(a1, "setOriginalRoutePurpose:", v8);
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("routeHandle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v9, 0);
    objc_msgSend(a1, "setRouteHandle:", v10);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("originalDirectionsResponseID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v11, 0);
    objc_msgSend(a1, "setOriginalDirectionsResponseID:", v12);

  }
  if (a3)
    v13 = CFSTR("routeIndex");
  else
    v13 = CFSTR("route_index");
  objc_msgSend(v5, "objectForKeyedSubscript:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setRouteIndex:", objc_msgSend(v14, "unsignedIntValue"));

LABEL_23:
  return a1;
}

- (GEOOriginalRoute)initWithJSON:(id)a3
{
  return (GEOOriginalRoute *)-[GEOOriginalRoute _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_3310;
    else
      v8 = (int *)&readAll__nonRecursiveTag_3311;
    GEOOriginalRouteReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOOriginalRouteIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOOriginalRouteReadAllFrom((uint64_t)self, a3, 0);
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
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_BYTE *)&self->_flags & 0x38) == 0))
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
    -[GEOOriginalRoute readAll:](self, "readAll:", 0);
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      PBDataWriterWriteInt32Field();
    v5 = v8;
    if (self->_routeHandle)
    {
      PBDataWriterWriteDataField();
      v5 = v8;
    }
    if (self->_originalDirectionsResponseID)
    {
      PBDataWriterWriteDataField();
      v5 = v8;
    }
    if ((*(_BYTE *)&self->_flags & 2) != 0)
    {
      PBDataWriterWriteUint32Field();
      v5 = v8;
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v5);
  }

}

- (void)copyTo:(id)a3
{
  id *v4;

  v4 = (id *)a3;
  -[GEOOriginalRoute readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v4 + 1, self->_reader);
  *((_DWORD *)v4 + 10) = self->_readerMarkPos;
  *((_DWORD *)v4 + 11) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *((_DWORD *)v4 + 13) = self->_originalRoutePurpose;
    *((_BYTE *)v4 + 60) |= 1u;
  }
  if (self->_routeHandle)
    objc_msgSend(v4, "setRouteHandle:");
  if (self->_originalDirectionsResponseID)
    objc_msgSend(v4, "setOriginalDirectionsResponseID:");
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    *((_DWORD *)v4 + 14) = self->_routeIndex;
    *((_BYTE *)v4 + 60) |= 2u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  uint64_t v9;
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
    if ((*(_BYTE *)&self->_flags & 0x20) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOOriginalRouteReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_10;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOOriginalRoute readAll:](self, "readAll:", 0);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 52) = self->_originalRoutePurpose;
    *(_BYTE *)(v5 + 60) |= 1u;
  }
  v9 = -[NSData copyWithZone:](self->_routeHandle, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v9;

  v11 = -[NSData copyWithZone:](self->_originalDirectionsResponseID, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v11;

  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 56) = self->_routeIndex;
    *(_BYTE *)(v5 + 60) |= 2u;
  }
  v13 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v13;
LABEL_10:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSData *routeHandle;
  NSData *originalDirectionsResponseID;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_15;
  -[GEOOriginalRoute readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 1) == 0 || self->_originalRoutePurpose != *((_DWORD *)v4 + 13))
      goto LABEL_15;
  }
  else if ((*((_BYTE *)v4 + 60) & 1) != 0)
  {
LABEL_15:
    v7 = 0;
    goto LABEL_16;
  }
  routeHandle = self->_routeHandle;
  if ((unint64_t)routeHandle | *((_QWORD *)v4 + 4) && !-[NSData isEqual:](routeHandle, "isEqual:"))
    goto LABEL_15;
  originalDirectionsResponseID = self->_originalDirectionsResponseID;
  if ((unint64_t)originalDirectionsResponseID | *((_QWORD *)v4 + 3))
  {
    if (!-[NSData isEqual:](originalDirectionsResponseID, "isEqual:"))
      goto LABEL_15;
  }
  v7 = (*((_BYTE *)v4 + 60) & 2) == 0;
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 2) == 0 || self->_routeIndex != *((_DWORD *)v4 + 14))
      goto LABEL_15;
    v7 = 1;
  }
LABEL_16:

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  -[GEOOriginalRoute readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v3 = 2654435761 * self->_originalRoutePurpose;
  else
    v3 = 0;
  v4 = -[NSData hash](self->_routeHandle, "hash");
  v5 = -[NSData hash](self->_originalDirectionsResponseID, "hash");
  if ((*(_BYTE *)&self->_flags & 2) != 0)
    v6 = 2654435761 * self->_routeIndex;
  else
    v6 = 0;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  int *v4;
  int *v5;

  v5 = (int *)a3;
  objc_msgSend(v5, "readAll:", 0);
  v4 = v5;
  if ((v5[15] & 1) != 0)
  {
    self->_originalRoutePurpose = v5[13];
    *(_BYTE *)&self->_flags |= 1u;
  }
  if (*((_QWORD *)v5 + 4))
  {
    -[GEOOriginalRoute setRouteHandle:](self, "setRouteHandle:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[GEOOriginalRoute setOriginalDirectionsResponseID:](self, "setOriginalDirectionsResponseID:");
    v4 = v5;
  }
  if ((v4[15] & 2) != 0)
  {
    self->_routeIndex = v4[14];
    *(_BYTE *)&self->_flags |= 2u;
  }

}

- (PBUnknownFields)unknownFields
{
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v5;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_BYTE *)&self->_flags & 4) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      v5 = reader;
      objc_sync_enter(v5);
      GEOOriginalRouteReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_3314);
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
  *(_BYTE *)&self->_flags |= 0x24u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
    -[GEOOriginalRoute readAll:](self, "readAll:", 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routeHandle, 0);
  objc_storeStrong((id *)&self->_originalDirectionsResponseID, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
