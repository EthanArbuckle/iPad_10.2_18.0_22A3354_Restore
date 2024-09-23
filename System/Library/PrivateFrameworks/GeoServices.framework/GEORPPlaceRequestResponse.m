@implementation GEORPPlaceRequestResponse

- (GEORPPlaceRequestResponse)init
{
  GEORPPlaceRequestResponse *v2;
  GEORPPlaceRequestResponse *v3;
  GEORPPlaceRequestResponse *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEORPPlaceRequestResponse;
  v2 = -[GEORPPlaceRequestResponse init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPPlaceRequestResponse)initWithData:(id)a3
{
  GEORPPlaceRequestResponse *v3;
  GEORPPlaceRequestResponse *v4;
  GEORPPlaceRequestResponse *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEORPPlaceRequestResponse;
  v3 = -[GEORPPlaceRequestResponse initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readPlaceRequest
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(_BYTE *)(a1 + 52) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPPlaceRequestResponseReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPlaceRequest_tags_2413);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasPlaceRequest
{
  -[GEORPPlaceRequestResponse _readPlaceRequest]((uint64_t)self);
  return self->_placeRequest != 0;
}

- (GEOPDPlaceRequest)placeRequest
{
  -[GEORPPlaceRequestResponse _readPlaceRequest]((uint64_t)self);
  return self->_placeRequest;
}

- (void)setPlaceRequest:(id)a3
{
  *(_BYTE *)&self->_flags |= 0xAu;
  objc_storeStrong((id *)&self->_placeRequest, a3);
}

- (void)_readPlaceResponse
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(_BYTE *)(a1 + 52) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPPlaceRequestResponseReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPlaceResponse_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasPlaceResponse
{
  -[GEORPPlaceRequestResponse _readPlaceResponse]((uint64_t)self);
  return self->_placeResponse != 0;
}

- (GEOPDPlaceResponse)placeResponse
{
  -[GEORPPlaceRequestResponse _readPlaceResponse]((uint64_t)self);
  return self->_placeResponse;
}

- (void)setPlaceResponse:(id)a3
{
  *(_BYTE *)&self->_flags |= 0xCu;
  objc_storeStrong((id *)&self->_placeResponse, a3);
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
  v8.super_class = (Class)GEORPPlaceRequestResponse;
  -[GEORPPlaceRequestResponse description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORPPlaceRequestResponse dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPPlaceRequestResponse _dictionaryRepresentation:](self, 0);
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
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  _QWORD v20[4];
  id v21;

  if (!a1)
    return 0;
  objc_msgSend(a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "placeRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v5, "jsonRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = CFSTR("placeRequest");
    }
    else
    {
      objc_msgSend(v5, "dictionaryRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = CFSTR("place_request");
    }
    objc_msgSend(v4, "setObject:forKey:", v7, v8);

  }
  objc_msgSend(a1, "placeResponse");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v9, "jsonRepresentation");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = CFSTR("placeResponse");
    }
    else
    {
      objc_msgSend(v9, "dictionaryRepresentation");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = CFSTR("place_response");
    }
    objc_msgSend(v4, "setObject:forKey:", v11, v12);

  }
  v13 = (void *)a1[2];
  if (v13)
  {
    objc_msgSend(v13, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v14, "count"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __55__GEORPPlaceRequestResponse__dictionaryRepresentation___block_invoke;
      v20[3] = &unk_1E1C00600;
      v17 = v16;
      v21 = v17;
      objc_msgSend(v15, "enumerateKeysAndObjectsUsingBlock:", v20);
      v18 = v17;

      v15 = v18;
    }
    objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEORPPlaceRequestResponse _dictionaryRepresentation:](self, 1);
}

void __55__GEORPPlaceRequestResponse__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEORPPlaceRequestResponse)initWithDictionary:(id)a3
{
  return (GEORPPlaceRequestResponse *)-[GEORPPlaceRequestResponse _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  GEOPDPlaceRequest *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  GEOPDPlaceResponse *v13;
  uint64_t v14;
  void *v15;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("placeRequest");
      else
        v6 = CFSTR("place_request");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = [GEOPDPlaceRequest alloc];
        if ((a3 & 1) != 0)
          v9 = -[GEOPDPlaceRequest initWithJSON:](v8, "initWithJSON:", v7);
        else
          v9 = -[GEOPDPlaceRequest initWithDictionary:](v8, "initWithDictionary:", v7);
        v10 = (void *)v9;
        objc_msgSend(a1, "setPlaceRequest:", v9);

      }
      if (a3)
        v11 = CFSTR("placeResponse");
      else
        v11 = CFSTR("place_response");
      objc_msgSend(v5, "objectForKeyedSubscript:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v13 = [GEOPDPlaceResponse alloc];
        if ((a3 & 1) != 0)
          v14 = -[GEOPDPlaceResponse initWithJSON:](v13, "initWithJSON:", v12);
        else
          v14 = -[GEOPDPlaceResponse initWithDictionary:](v13, "initWithDictionary:", v12);
        v15 = (void *)v14;
        objc_msgSend(a1, "setPlaceResponse:", v14);

      }
    }
  }

  return a1;
}

- (GEORPPlaceRequestResponse)initWithJSON:(id)a3
{
  return (GEORPPlaceRequestResponse *)-[GEORPPlaceRequestResponse _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_2419;
    else
      v8 = (int *)&readAll__nonRecursiveTag_2420;
    GEORPPlaceRequestResponseReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
  {
    -[GEOPDPlaceRequest readAll:](self->_placeRequest, "readAll:", 1);
    -[GEOPDPlaceResponse readAll:](self->_placeResponse, "readAll:", 1);
  }
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPPlaceRequestResponseIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPPlaceRequestResponseReadAllFrom((uint64_t)self, a3, 0);
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
  if (self->_reader && (_GEORPPlaceRequestResponseIsDirty((uint64_t)self) & 1) == 0)
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
    -[GEORPPlaceRequestResponse readAll:](self, "readAll:", 0);
    if (self->_placeRequest)
      PBDataWriterWriteSubmessage();
    v5 = v8;
    if (self->_placeResponse)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v5);
  }

}

- (void)clearSensitiveFields:(unint64_t)a3
{
  GEORPPlaceRequestResponseClearSensitiveFields(self, a3, 1);
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[GEORPPlaceRequestResponse _readPlaceRequest]((uint64_t)self);
  if (-[GEOPDPlaceRequest hasGreenTeaWithValue:](self->_placeRequest, "hasGreenTeaWithValue:", v3))
    return 1;
  -[GEORPPlaceRequestResponse _readPlaceResponse]((uint64_t)self);
  return -[GEOPDPlaceResponse hasGreenTeaWithValue:](self->_placeResponse, "hasGreenTeaWithValue:", v3);
}

- (void)copyTo:(id)a3
{
  id *v4;

  v4 = (id *)a3;
  -[GEORPPlaceRequestResponse readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v4 + 1, self->_reader);
  *((_DWORD *)v4 + 10) = self->_readerMarkPos;
  *((_DWORD *)v4 + 11) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_placeRequest)
    objc_msgSend(v4, "setPlaceRequest:");
  if (self->_placeResponse)
    objc_msgSend(v4, "setPlaceResponse:");

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

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
    goto LABEL_5;
  v7 = reader;
  objc_sync_enter(v7);
  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
    objc_sync_exit(v7);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEORPPlaceRequestResponse readAll:](self, "readAll:", 0);
    v8 = -[GEOPDPlaceRequest copyWithZone:](self->_placeRequest, "copyWithZone:", a3);
    v9 = *(void **)(v5 + 24);
    *(_QWORD *)(v5 + 24) = v8;

    v10 = -[GEOPDPlaceResponse copyWithZone:](self->_placeResponse, "copyWithZone:", a3);
    v11 = *(void **)(v5 + 32);
    *(_QWORD *)(v5 + 32) = v10;

    objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
    return (id)v5;
  }
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  GEORPPlaceRequestResponseReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  GEOPDPlaceRequest *placeRequest;
  GEOPDPlaceResponse *placeResponse;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((-[GEORPPlaceRequestResponse readAll:](self, "readAll:", 1),
         objc_msgSend(v4, "readAll:", 1),
         placeRequest = self->_placeRequest,
         !((unint64_t)placeRequest | v4[3]))
     || -[GEOPDPlaceRequest isEqual:](placeRequest, "isEqual:")))
  {
    placeResponse = self->_placeResponse;
    if ((unint64_t)placeResponse | v4[4])
      v7 = -[GEOPDPlaceResponse isEqual:](placeResponse, "isEqual:");
    else
      v7 = 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3;

  -[GEORPPlaceRequestResponse readAll:](self, "readAll:", 1);
  v3 = -[GEOPDPlaceRequest hash](self->_placeRequest, "hash");
  return -[GEOPDPlaceResponse hash](self->_placeResponse, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  GEOPDPlaceRequest *placeRequest;
  uint64_t v5;
  GEOPDPlaceResponse *placeResponse;
  uint64_t v7;
  _QWORD *v8;

  v8 = a3;
  objc_msgSend(v8, "readAll:", 0);
  placeRequest = self->_placeRequest;
  v5 = v8[3];
  if (placeRequest)
  {
    if (v5)
      -[GEOPDPlaceRequest mergeFrom:](placeRequest, "mergeFrom:");
  }
  else if (v5)
  {
    -[GEORPPlaceRequestResponse setPlaceRequest:](self, "setPlaceRequest:");
  }
  placeResponse = self->_placeResponse;
  v7 = v8[4];
  if (placeResponse)
  {
    if (v7)
      -[GEOPDPlaceResponse mergeFrom:](placeResponse, "mergeFrom:");
  }
  else if (v7)
  {
    -[GEORPPlaceRequestResponse setPlaceResponse:](self, "setPlaceResponse:");
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
      GEORPPlaceRequestResponseReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_2423);
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
  *(_BYTE *)&self->_flags |= 9u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEORPPlaceRequestResponse readAll:](self, "readAll:", 0);
    -[GEOPDPlaceRequest clearUnknownFields:](self->_placeRequest, "clearUnknownFields:", 1);
    -[GEOPDPlaceResponse clearUnknownFields:](self->_placeResponse, "clearUnknownFields:", 1);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeResponse, 0);
  objc_storeStrong((id *)&self->_placeRequest, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

- (void)clearLocations
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[GEORPPlaceRequestResponse placeResponse](self, "placeResponse");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _clearedPlaceResponseFromResponse(v3);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6)
    -[GEORPPlaceRequestResponse setPlaceResponse:](self, "setPlaceResponse:", v6);
  -[GEORPPlaceRequestResponse placeRequest](self, "placeRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _clearedPlaceRequestFromRequest(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    -[GEORPPlaceRequestResponse setPlaceRequest:](self, "setPlaceRequest:", v5);

}

@end
