@implementation GEORPCorrectedSearch

- (GEORPCorrectedSearch)init
{
  GEORPCorrectedSearch *v2;
  GEORPCorrectedSearch *v3;
  GEORPCorrectedSearch *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEORPCorrectedSearch;
  v2 = -[GEORPCorrectedSearch init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPCorrectedSearch)initWithData:(id)a3
{
  GEORPCorrectedSearch *v3;
  GEORPCorrectedSearch *v4;
  GEORPCorrectedSearch *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEORPCorrectedSearch;
  v3 = -[GEORPCorrectedSearch initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readPlaceSearchRequest
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 76) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPCorrectedSearchReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPlaceSearchRequest_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasPlaceSearchRequest
{
  -[GEORPCorrectedSearch _readPlaceSearchRequest]((uint64_t)self);
  return self->_placeSearchRequest != 0;
}

- (GEOPlaceSearchRequest)placeSearchRequest
{
  -[GEORPCorrectedSearch _readPlaceSearchRequest]((uint64_t)self);
  return self->_placeSearchRequest;
}

- (void)setPlaceSearchRequest:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x90u;
  objc_storeStrong((id *)&self->_placeSearchRequest, a3);
}

- (void)_readPlaceSearchResponse
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 76) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPCorrectedSearchReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPlaceSearchResponse_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasPlaceSearchResponse
{
  -[GEORPCorrectedSearch _readPlaceSearchResponse]((uint64_t)self);
  return self->_placeSearchResponse != 0;
}

- (GEOPlaceSearchResponse)placeSearchResponse
{
  -[GEORPCorrectedSearch _readPlaceSearchResponse]((uint64_t)self);
  return self->_placeSearchResponse;
}

- (void)setPlaceSearchResponse:(id)a3
{
  *(_BYTE *)&self->_flags |= 0xA0u;
  objc_storeStrong((id *)&self->_placeSearchResponse, a3);
}

- (unsigned)originalSearchResultIndex
{
  return self->_originalSearchResultIndex;
}

- (void)setOriginalSearchResultIndex:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 0x82u;
  self->_originalSearchResultIndex = a3;
}

- (void)setHasOriginalSearchResultIndex:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = -126;
  else
    v3 = 0x80;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasOriginalSearchResultIndex
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (unsigned)correctedSearchResultIndex
{
  return self->_correctedSearchResultIndex;
}

- (void)setCorrectedSearchResultIndex:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 0x81u;
  self->_correctedSearchResultIndex = a3;
}

- (void)setHasCorrectedSearchResultIndex:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0x7E | a3 | 0x80;
}

- (BOOL)hasCorrectedSearchResultIndex
{
  return *(_BYTE *)&self->_flags & 1;
}

- (void)_readPreferredSearchDisplayLocation
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 76) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPCorrectedSearchReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPreferredSearchDisplayLocation_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasPreferredSearchDisplayLocation
{
  -[GEORPCorrectedSearch _readPreferredSearchDisplayLocation]((uint64_t)self);
  return self->_preferredSearchDisplayLocation != 0;
}

- (NSString)preferredSearchDisplayLocation
{
  -[GEORPCorrectedSearch _readPreferredSearchDisplayLocation]((uint64_t)self);
  return self->_preferredSearchDisplayLocation;
}

- (void)setPreferredSearchDisplayLocation:(id)a3
{
  *(_BYTE *)&self->_flags |= 0xC0u;
  objc_storeStrong((id *)&self->_preferredSearchDisplayLocation, a3);
}

- (void)_readPlaceRequest
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 76) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPCorrectedSearchReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPlaceRequest_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasPlaceRequest
{
  -[GEORPCorrectedSearch _readPlaceRequest]((uint64_t)self);
  return self->_placeRequest != 0;
}

- (GEOPDPlaceRequest)placeRequest
{
  -[GEORPCorrectedSearch _readPlaceRequest]((uint64_t)self);
  return self->_placeRequest;
}

- (void)setPlaceRequest:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x84u;
  objc_storeStrong((id *)&self->_placeRequest, a3);
}

- (void)_readPlaceResponse
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 76) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPCorrectedSearchReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPlaceResponse_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasPlaceResponse
{
  -[GEORPCorrectedSearch _readPlaceResponse]((uint64_t)self);
  return self->_placeResponse != 0;
}

- (GEOPDPlaceResponse)placeResponse
{
  -[GEORPCorrectedSearch _readPlaceResponse]((uint64_t)self);
  return self->_placeResponse;
}

- (void)setPlaceResponse:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x88u;
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
  v8.super_class = (Class)GEORPCorrectedSearch;
  -[GEORPCorrectedSearch description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORPCorrectedSearch dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPCorrectedSearch _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
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
  char v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  const __CFString *v27;

  if (a1)
  {
    objc_msgSend((id)a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)a1, "placeSearchRequest");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v5, "jsonRepresentation");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = CFSTR("placeSearchRequest");
      }
      else
      {
        objc_msgSend(v5, "dictionaryRepresentation");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = CFSTR("place_search_request");
      }
      objc_msgSend(v4, "setObject:forKey:", v7, v8);

    }
    objc_msgSend((id)a1, "placeSearchResponse");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v9, "jsonRepresentation");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = CFSTR("placeSearchResponse");
      }
      else
      {
        objc_msgSend(v9, "dictionaryRepresentation");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = CFSTR("place_search_response");
      }
      objc_msgSend(v4, "setObject:forKey:", v11, v12);

    }
    v13 = *(_BYTE *)(a1 + 76);
    if ((v13 & 2) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 72));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
        v15 = CFSTR("originalSearchResultIndex");
      else
        v15 = CFSTR("original_search_result_index");
      objc_msgSend(v4, "setObject:forKey:", v14, v15);

      v13 = *(_BYTE *)(a1 + 76);
    }
    if ((v13 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 68));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
        v17 = CFSTR("correctedSearchResultIndex");
      else
        v17 = CFSTR("corrected_search_result_index");
      objc_msgSend(v4, "setObject:forKey:", v16, v17);

    }
    objc_msgSend((id)a1, "preferredSearchDisplayLocation");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      if (a2)
        v19 = CFSTR("preferredSearchDisplayLocation");
      else
        v19 = CFSTR("preferred_search_display_location");
      objc_msgSend(v4, "setObject:forKey:", v18, v19);
    }

    objc_msgSend((id)a1, "placeRequest");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (v20)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v20, "jsonRepresentation");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = CFSTR("placeRequest");
      }
      else
      {
        objc_msgSend(v20, "dictionaryRepresentation");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = CFSTR("place_request");
      }
      objc_msgSend(v4, "setObject:forKey:", v22, v23);

    }
    objc_msgSend((id)a1, "placeResponse");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v24;
    if (v24)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v24, "jsonRepresentation");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = CFSTR("placeResponse");
      }
      else
      {
        objc_msgSend(v24, "dictionaryRepresentation");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = CFSTR("place_response");
      }
      objc_msgSend(v4, "setObject:forKey:", v26, v27);

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
  return -[GEORPCorrectedSearch _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEORPCorrectedSearch)initWithDictionary:(id)a3
{
  return (GEORPCorrectedSearch *)-[GEORPCorrectedSearch _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  GEOPlaceSearchRequest *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  GEOPlaceSearchResponse *v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  GEOPDPlaceRequest *v25;
  uint64_t v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  GEOPDPlaceResponse *v30;
  uint64_t v31;
  void *v32;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("placeSearchRequest");
      else
        v6 = CFSTR("place_search_request");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = [GEOPlaceSearchRequest alloc];
        if ((a3 & 1) != 0)
          v9 = -[GEOPlaceSearchRequest initWithJSON:](v8, "initWithJSON:", v7);
        else
          v9 = -[GEOPlaceSearchRequest initWithDictionary:](v8, "initWithDictionary:", v7);
        v10 = (void *)v9;
        objc_msgSend(a1, "setPlaceSearchRequest:", v9);

      }
      if (a3)
        v11 = CFSTR("placeSearchResponse");
      else
        v11 = CFSTR("place_search_response");
      objc_msgSend(v5, "objectForKeyedSubscript:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v13 = [GEOPlaceSearchResponse alloc];
        if ((a3 & 1) != 0)
          v14 = -[GEOPlaceSearchResponse initWithJSON:](v13, "initWithJSON:", v12);
        else
          v14 = -[GEOPlaceSearchResponse initWithDictionary:](v13, "initWithDictionary:", v12);
        v15 = (void *)v14;
        objc_msgSend(a1, "setPlaceSearchResponse:", v14);

      }
      if (a3)
        v16 = CFSTR("originalSearchResultIndex");
      else
        v16 = CFSTR("original_search_result_index");
      objc_msgSend(v5, "objectForKeyedSubscript:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setOriginalSearchResultIndex:", objc_msgSend(v17, "unsignedIntValue"));

      if (a3)
        v18 = CFSTR("correctedSearchResultIndex");
      else
        v18 = CFSTR("corrected_search_result_index");
      objc_msgSend(v5, "objectForKeyedSubscript:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setCorrectedSearchResultIndex:", objc_msgSend(v19, "unsignedIntValue"));

      if (a3)
        v20 = CFSTR("preferredSearchDisplayLocation");
      else
        v20 = CFSTR("preferred_search_display_location");
      objc_msgSend(v5, "objectForKeyedSubscript:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v22 = (void *)objc_msgSend(v21, "copy");
        objc_msgSend(a1, "setPreferredSearchDisplayLocation:", v22);

      }
      if (a3)
        v23 = CFSTR("placeRequest");
      else
        v23 = CFSTR("place_request");
      objc_msgSend(v5, "objectForKeyedSubscript:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v25 = [GEOPDPlaceRequest alloc];
        if ((a3 & 1) != 0)
          v26 = -[GEOPDPlaceRequest initWithJSON:](v25, "initWithJSON:", v24);
        else
          v26 = -[GEOPDPlaceRequest initWithDictionary:](v25, "initWithDictionary:", v24);
        v27 = (void *)v26;
        objc_msgSend(a1, "setPlaceRequest:", v26);

      }
      if (a3)
        v28 = CFSTR("placeResponse");
      else
        v28 = CFSTR("place_response");
      objc_msgSend(v5, "objectForKeyedSubscript:", v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v30 = [GEOPDPlaceResponse alloc];
        if ((a3 & 1) != 0)
          v31 = -[GEOPDPlaceResponse initWithJSON:](v30, "initWithJSON:", v29);
        else
          v31 = -[GEOPDPlaceResponse initWithDictionary:](v30, "initWithDictionary:", v29);
        v32 = (void *)v31;
        objc_msgSend(a1, "setPlaceResponse:", v31);

      }
    }
  }

  return a1;
}

- (GEORPCorrectedSearch)initWithJSON:(id)a3
{
  return (GEORPCorrectedSearch *)-[GEORPCorrectedSearch _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_439_0;
    else
      v8 = (int *)&readAll__nonRecursiveTag_440_0;
    GEORPCorrectedSearchReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEORPCorrectedSearchCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPCorrectedSearchIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPCorrectedSearchReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  char flags;
  PBDataReader *v6;
  void *v7;
  id v8;

  v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEORPCorrectedSearchIsDirty((uint64_t)self) & 1) == 0)
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
    -[GEORPCorrectedSearch readAll:](self, "readAll:", 0);
    if (self->_placeSearchRequest)
      PBDataWriterWriteSubmessage();
    if (self->_placeSearchResponse)
      PBDataWriterWriteSubmessage();
    flags = (char)self->_flags;
    if ((flags & 2) != 0)
    {
      PBDataWriterWriteUint32Field();
      flags = (char)self->_flags;
    }
    if ((flags & 1) != 0)
      PBDataWriterWriteUint32Field();
    if (self->_preferredSearchDisplayLocation)
      PBDataWriterWriteStringField();
    if (self->_placeRequest)
      PBDataWriterWriteSubmessage();
    if (self->_placeResponse)
      PBDataWriterWriteSubmessage();
  }

}

- (void)clearSensitiveFields:(unint64_t)a3
{
  GEORPCorrectedSearchClearSensitiveFields(self, a3, 1);
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[GEORPCorrectedSearch _readPlaceRequest]((uint64_t)self);
  if (-[GEOPDPlaceRequest hasGreenTeaWithValue:](self->_placeRequest, "hasGreenTeaWithValue:", v3))
    return 1;
  -[GEORPCorrectedSearch _readPlaceResponse]((uint64_t)self);
  if (-[GEOPDPlaceResponse hasGreenTeaWithValue:](self->_placeResponse, "hasGreenTeaWithValue:", v3))
    return 1;
  -[GEORPCorrectedSearch _readPlaceSearchRequest]((uint64_t)self);
  if (-[GEOPlaceSearchRequest hasGreenTeaWithValue:](self->_placeSearchRequest, "hasGreenTeaWithValue:", v3))
    return 1;
  -[GEORPCorrectedSearch _readPlaceSearchResponse]((uint64_t)self);
  return -[GEOPlaceSearchResponse hasGreenTeaWithValue:](self->_placeSearchResponse, "hasGreenTeaWithValue:", v3);
}

- (void)copyTo:(id)a3
{
  char flags;
  id *v5;
  id *v6;

  v6 = (id *)a3;
  -[GEORPCorrectedSearch readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v6 + 1, self->_reader);
  *((_DWORD *)v6 + 14) = self->_readerMarkPos;
  *((_DWORD *)v6 + 15) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_placeSearchRequest)
    objc_msgSend(v6, "setPlaceSearchRequest:");
  if (self->_placeSearchResponse)
    objc_msgSend(v6, "setPlaceSearchResponse:");
  flags = (char)self->_flags;
  v5 = v6;
  if ((flags & 2) != 0)
  {
    *((_DWORD *)v6 + 18) = self->_originalSearchResultIndex;
    *((_BYTE *)v6 + 76) |= 2u;
    flags = (char)self->_flags;
  }
  if ((flags & 1) != 0)
  {
    *((_DWORD *)v6 + 17) = self->_correctedSearchResultIndex;
    *((_BYTE *)v6 + 76) |= 1u;
  }
  if (self->_preferredSearchDisplayLocation)
  {
    objc_msgSend(v6, "setPreferredSearchDisplayLocation:");
    v5 = v6;
  }
  if (self->_placeRequest)
  {
    objc_msgSend(v6, "setPlaceRequest:");
    v5 = v6;
  }
  if (self->_placeResponse)
  {
    objc_msgSend(v6, "setPlaceResponse:");
    v5 = v6;
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
  char flags;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  id v18;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_BYTE *)&self->_flags & 0x80000000) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEORPCorrectedSearchReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_10;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEORPCorrectedSearch readAll:](self, "readAll:", 0);
  v9 = -[GEOPlaceSearchRequest copyWithZone:](self->_placeSearchRequest, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v9;

  v11 = -[GEOPlaceSearchResponse copyWithZone:](self->_placeSearchResponse, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v11;

  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 72) = self->_originalSearchResultIndex;
    *(_BYTE *)(v5 + 76) |= 2u;
    flags = (char)self->_flags;
  }
  if ((flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 68) = self->_correctedSearchResultIndex;
    *(_BYTE *)(v5 + 76) |= 1u;
  }
  v14 = -[NSString copyWithZone:](self->_preferredSearchDisplayLocation, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v14;

  v16 = -[GEOPDPlaceRequest copyWithZone:](self->_placeRequest, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v16;

  v18 = -[GEOPDPlaceResponse copyWithZone:](self->_placeResponse, "copyWithZone:", a3);
  v8 = *(id *)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v18;
LABEL_10:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  GEOPlaceSearchRequest *placeSearchRequest;
  GEOPlaceSearchResponse *placeSearchResponse;
  NSString *preferredSearchDisplayLocation;
  GEOPDPlaceRequest *placeRequest;
  GEOPDPlaceResponse *placeResponse;
  char v10;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_22;
  -[GEORPCorrectedSearch readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  placeSearchRequest = self->_placeSearchRequest;
  if ((unint64_t)placeSearchRequest | *((_QWORD *)v4 + 4))
  {
    if (!-[GEOPlaceSearchRequest isEqual:](placeSearchRequest, "isEqual:"))
      goto LABEL_22;
  }
  placeSearchResponse = self->_placeSearchResponse;
  if ((unint64_t)placeSearchResponse | *((_QWORD *)v4 + 5))
  {
    if (!-[GEOPlaceSearchResponse isEqual:](placeSearchResponse, "isEqual:"))
      goto LABEL_22;
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 76) & 2) == 0 || self->_originalSearchResultIndex != *((_DWORD *)v4 + 18))
      goto LABEL_22;
  }
  else if ((*((_BYTE *)v4 + 76) & 2) != 0)
  {
LABEL_22:
    v10 = 0;
    goto LABEL_23;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 76) & 1) == 0 || self->_correctedSearchResultIndex != *((_DWORD *)v4 + 17))
      goto LABEL_22;
  }
  else if ((*((_BYTE *)v4 + 76) & 1) != 0)
  {
    goto LABEL_22;
  }
  preferredSearchDisplayLocation = self->_preferredSearchDisplayLocation;
  if ((unint64_t)preferredSearchDisplayLocation | *((_QWORD *)v4 + 6)
    && !-[NSString isEqual:](preferredSearchDisplayLocation, "isEqual:"))
  {
    goto LABEL_22;
  }
  placeRequest = self->_placeRequest;
  if ((unint64_t)placeRequest | *((_QWORD *)v4 + 2))
  {
    if (!-[GEOPDPlaceRequest isEqual:](placeRequest, "isEqual:"))
      goto LABEL_22;
  }
  placeResponse = self->_placeResponse;
  if ((unint64_t)placeResponse | *((_QWORD *)v4 + 3))
    v10 = -[GEOPDPlaceResponse isEqual:](placeResponse, "isEqual:");
  else
    v10 = 1;
LABEL_23:

  return v10;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSUInteger v7;
  unint64_t v8;

  -[GEORPCorrectedSearch readAll:](self, "readAll:", 1);
  v3 = -[GEOPlaceSearchRequest hash](self->_placeSearchRequest, "hash");
  v4 = -[GEOPlaceSearchResponse hash](self->_placeSearchResponse, "hash");
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    v5 = 2654435761 * self->_originalSearchResultIndex;
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      goto LABEL_3;
LABEL_5:
    v6 = 0;
    goto LABEL_6;
  }
  v5 = 0;
  if ((*(_BYTE *)&self->_flags & 1) == 0)
    goto LABEL_5;
LABEL_3:
  v6 = 2654435761 * self->_correctedSearchResultIndex;
LABEL_6:
  v7 = v4 ^ v3 ^ v5 ^ v6 ^ -[NSString hash](self->_preferredSearchDisplayLocation, "hash");
  v8 = -[GEOPDPlaceRequest hash](self->_placeRequest, "hash");
  return v7 ^ v8 ^ -[GEOPDPlaceResponse hash](self->_placeResponse, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  GEOPlaceSearchRequest *placeSearchRequest;
  uint64_t v6;
  GEOPlaceSearchResponse *placeSearchResponse;
  uint64_t v8;
  char v9;
  GEOPDPlaceRequest *placeRequest;
  uint64_t v11;
  GEOPDPlaceResponse *placeResponse;
  uint64_t v13;
  _QWORD *v14;

  v14 = a3;
  objc_msgSend(v14, "readAll:", 0);
  v4 = v14;
  placeSearchRequest = self->_placeSearchRequest;
  v6 = v14[4];
  if (placeSearchRequest)
  {
    if (!v6)
      goto LABEL_7;
    -[GEOPlaceSearchRequest mergeFrom:](placeSearchRequest, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[GEORPCorrectedSearch setPlaceSearchRequest:](self, "setPlaceSearchRequest:");
  }
  v4 = v14;
LABEL_7:
  placeSearchResponse = self->_placeSearchResponse;
  v8 = v4[5];
  if (placeSearchResponse)
  {
    if (!v8)
      goto LABEL_13;
    -[GEOPlaceSearchResponse mergeFrom:](placeSearchResponse, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_13;
    -[GEORPCorrectedSearch setPlaceSearchResponse:](self, "setPlaceSearchResponse:");
  }
  v4 = v14;
LABEL_13:
  v9 = *((_BYTE *)v4 + 76);
  if ((v9 & 2) != 0)
  {
    self->_originalSearchResultIndex = *((_DWORD *)v4 + 18);
    *(_BYTE *)&self->_flags |= 2u;
    v9 = *((_BYTE *)v4 + 76);
  }
  if ((v9 & 1) != 0)
  {
    self->_correctedSearchResultIndex = *((_DWORD *)v4 + 17);
    *(_BYTE *)&self->_flags |= 1u;
  }
  if (v4[6])
  {
    -[GEORPCorrectedSearch setPreferredSearchDisplayLocation:](self, "setPreferredSearchDisplayLocation:");
    v4 = v14;
  }
  placeRequest = self->_placeRequest;
  v11 = v4[2];
  if (placeRequest)
  {
    if (!v11)
      goto LABEL_25;
    -[GEOPDPlaceRequest mergeFrom:](placeRequest, "mergeFrom:");
  }
  else
  {
    if (!v11)
      goto LABEL_25;
    -[GEORPCorrectedSearch setPlaceRequest:](self, "setPlaceRequest:");
  }
  v4 = v14;
LABEL_25:
  placeResponse = self->_placeResponse;
  v13 = v4[3];
  if (placeResponse)
  {
    if (v13)
    {
      -[GEOPDPlaceResponse mergeFrom:](placeResponse, "mergeFrom:");
LABEL_30:
      v4 = v14;
    }
  }
  else if (v13)
  {
    -[GEORPCorrectedSearch setPlaceResponse:](self, "setPlaceResponse:");
    goto LABEL_30;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredSearchDisplayLocation, 0);
  objc_storeStrong((id *)&self->_placeSearchResponse, 0);
  objc_storeStrong((id *)&self->_placeSearchRequest, 0);
  objc_storeStrong((id *)&self->_placeResponse, 0);
  objc_storeStrong((id *)&self->_placeRequest, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

- (BOOL)containsReportableData
{
  void *v3;
  void *v4;
  BOOL v5;
  void *v6;
  void *v7;

  -[GEORPCorrectedSearch placeSearchRequest](self, "placeSearchRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[GEORPCorrectedSearch placeSearchResponse](self, "placeSearchResponse");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = 1;
LABEL_9:

      goto LABEL_10;
    }
  }
  -[GEORPCorrectedSearch placeRequest](self, "placeRequest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[GEORPCorrectedSearch placeResponse](self, "placeResponse");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v7 != 0;

  }
  else
  {
    v5 = 0;
  }

  if (v3)
  {
    v4 = 0;
    goto LABEL_9;
  }
LABEL_10:

  return v5;
}

@end
