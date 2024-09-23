@implementation GEOMapItemHandle

+ (id)handleDataForMapItem:(id)a3
{
  void *v3;
  void *v4;

  +[GEOMapItemHandle handleForMapItem:](GEOMapItemHandle, "handleForMapItem:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setPlaceRefinementParameters:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x14u;
  objc_storeStrong((id *)&self->_placeRefinementParameters, a3);
}

- (void)setHandleType:(int)a3
{
  *(_BYTE *)&self->_flags |= 0x11u;
  self->_handleType = a3;
}

- (void)setClientAttributes:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x12u;
  objc_storeStrong((id *)&self->_clientAttributes, a3);
}

- (GEOPDPlaceRefinementParameters)placeRefinementParameters
{
  -[GEOMapItemHandle _readPlaceRefinementParameters]((uint64_t)self);
  return self->_placeRefinementParameters;
}

- (GEOMapItemHandle)init
{
  GEOMapItemHandle *v2;
  GEOMapItemHandle *v3;
  GEOMapItemHandle *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOMapItemHandle;
  v2 = -[GEOMapItemHandle init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (void)_readPlaceRefinementParameters
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
        GEOMapItemHandleReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPlaceRefinementParameters_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeRequestData, 0);
  objc_storeStrong((id *)&self->_placeRefinementParameters, 0);
  objc_storeStrong((id *)&self->_clientAttributes, 0);
  objc_storeStrong((id *)&self->_reader, 0);
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
  if (self->_reader && (_GEOMapItemHandleIsDirty((uint64_t)self) & 1) == 0)
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
    -[GEOMapItemHandle readAll:](self, "readAll:", 0);
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      PBDataWriterWriteInt32Field();
    if (self->_placeRefinementParameters)
      PBDataWriterWriteSubmessage();
    if (self->_placeRequestData)
      PBDataWriterWriteSubmessage();
    if (self->_clientAttributes)
      PBDataWriterWriteSubmessage();
  }

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
      v8 = (int *)&readAll__recursiveTag_61;
    else
      v8 = (int *)&readAll__nonRecursiveTag_61;
    GEOMapItemHandleReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEOMapItemHandleCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  os_unfair_lock_unlock(p_readerLock);
}

- (void)setPlaceRequestData:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x18u;
  objc_storeStrong((id *)&self->_placeRequestData, a3);
}

+ (id)handleForMapItem:(id)a3
{
  id v3;
  GEOMapItemHandle *v4;
  GEOPDPlaceRequest *v5;
  id *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = a3;
  if (!v3)
  {
    v4 = 0;
    goto LABEL_11;
  }
  v4 = objc_alloc_init(GEOMapItemHandle);
  v5 = -[GEOPDPlaceRequest initWithMapItemToRefine:traits:]([GEOPDPlaceRequest alloc], "initWithMapItemToRefine:traits:", v3, 0);
  -[GEOMapItemHandle setHandleType:](v4, "setHandleType:", 1);
  -[GEOPDPlaceRequest placeRequestParameters](v5, "placeRequestParameters");
  v6 = (id *)objc_claimAutoreleasedReturnValue();
  -[GEOPDPlaceRequestParameters placeRefinementParameters](v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOMapItemHandle setPlaceRefinementParameters:](v4, "setPlaceRefinementParameters:", v7);

  objc_msgSend(v3, "_clientAttributes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOMapItemHandle setClientAttributes:](v4, "setClientAttributes:", v8);

  -[GEOMapItemHandle placeRefinementParameters](v4, "placeRefinementParameters");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDPlaceRefinementParameters setAddressObjectHint:]((uint64_t)v9, 0);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "placeData");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v12 = 0;
      goto LABEL_8;
    }
    objc_msgSend(v3, "_placeData");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;
  objc_msgSend(v10, "requestData");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_8:
  if (((objc_msgSend(v12, "requestType") - 2) & 0xFFFFFFFD) == 0)
    -[GEOMapItemHandle setPlaceRequestData:](v4, "setPlaceRequestData:", v12);

LABEL_11:
  return v4;
}

- (GEOMapItemHandle)initWithData:(id)a3
{
  GEOMapItemHandle *v3;
  GEOMapItemHandle *v4;
  GEOMapItemHandle *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOMapItemHandle;
  v3 = -[GEOMapItemHandle initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (int)handleType
{
  os_unfair_lock_s *p_readerLock;
  char flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 1) != 0)
    return self->_handleType;
  else
    return 0;
}

- (void)setHasHandleType:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3 | 0x10;
}

- (BOOL)hasHandleType
{
  return *(_BYTE *)&self->_flags & 1;
}

- (id)handleTypeAsString:(int)a3
{
  __CFString *v3;

  if (!a3)
    return CFSTR("UNKNOWN_TYPE");
  if (a3 == 1)
  {
    v3 = CFSTR("PLACE_REFINEMENT_PARAMETERS_TYPE");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsHandleType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_TYPE")) & 1) != 0)
    v4 = 0;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("PLACE_REFINEMENT_PARAMETERS_TYPE"));

  return v4;
}

- (BOOL)hasPlaceRefinementParameters
{
  -[GEOMapItemHandle _readPlaceRefinementParameters]((uint64_t)self);
  return self->_placeRefinementParameters != 0;
}

- (void)_readPlaceRequestData
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
        GEOMapItemHandleReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPlaceRequestData_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasPlaceRequestData
{
  -[GEOMapItemHandle _readPlaceRequestData]((uint64_t)self);
  return self->_placeRequestData != 0;
}

- (GEOMapItemInitialRequestData)placeRequestData
{
  -[GEOMapItemHandle _readPlaceRequestData]((uint64_t)self);
  return self->_placeRequestData;
}

- (void)_readClientAttributes
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(_BYTE *)(a1 + 56) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOMapItemHandleReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readClientAttributes_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasClientAttributes
{
  -[GEOMapItemHandle _readClientAttributes]((uint64_t)self);
  return self->_clientAttributes != 0;
}

- (GEOMapItemClientAttributes)clientAttributes
{
  -[GEOMapItemHandle _readClientAttributes]((uint64_t)self);
  return self->_clientAttributes;
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
  v8.super_class = (Class)GEOMapItemHandle;
  -[GEOMapItemHandle description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOMapItemHandle dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOMapItemHandle _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  int v5;
  __CFString *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  const __CFString *v19;

  if (a1)
  {
    objc_msgSend((id)a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((*(_BYTE *)(a1 + 56) & 1) != 0)
    {
      v5 = *(_DWORD *)(a1 + 52);
      if (v5)
      {
        if (v5 == 1)
        {
          v6 = CFSTR("PLACE_REFINEMENT_PARAMETERS_TYPE");
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 52));
          v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
      }
      else
      {
        v6 = CFSTR("UNKNOWN_TYPE");
      }
      if (a2)
        v7 = CFSTR("handleType");
      else
        v7 = CFSTR("handle_type");
      objc_msgSend(v4, "setObject:forKey:", v6, v7);

    }
    objc_msgSend((id)a1, "placeRefinementParameters");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v8, "jsonRepresentation");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = CFSTR("placeRefinementParameters");
      }
      else
      {
        objc_msgSend(v8, "dictionaryRepresentation");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = CFSTR("place_refinement_parameters");
      }
      objc_msgSend(v4, "setObject:forKey:", v10, v11);

    }
    objc_msgSend((id)a1, "placeRequestData");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v12, "jsonRepresentation");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = CFSTR("placeRequestData");
      }
      else
      {
        objc_msgSend(v12, "dictionaryRepresentation");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = CFSTR("place_request_data");
      }
      objc_msgSend(v4, "setObject:forKey:", v14, v15);

    }
    objc_msgSend((id)a1, "clientAttributes");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v16)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v16, "jsonRepresentation");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = CFSTR("clientAttributes");
      }
      else
      {
        objc_msgSend(v16, "dictionaryRepresentation");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = CFSTR("client_attributes");
      }
      objc_msgSend(v4, "setObject:forKey:", v18, v19);

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
  return -[GEOMapItemHandle _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOMapItemHandle)initWithDictionary:(id)a3
{
  return (GEOMapItemHandle *)-[GEOMapItemHandle _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  id v8;
  uint64_t v9;
  const __CFString *v10;
  void *v11;
  GEOPDPlaceRefinementParameters *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  GEOMapItemInitialRequestData *v16;
  uint64_t v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  GEOMapItemClientAttributes *v21;
  uint64_t v22;
  void *v23;

  v5 = a2;
  if (!a1)
    goto LABEL_38;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_38;
  if (a3)
    v6 = CFSTR("handleType");
  else
    v6 = CFSTR("handle_type");
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
    if ((objc_msgSend(v8, "isEqualToString:", CFSTR("UNKNOWN_TYPE")) & 1) != 0)
      v9 = 0;
    else
      v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("PLACE_REFINEMENT_PARAMETERS_TYPE"));

    goto LABEL_13;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = objc_msgSend(v7, "intValue");
LABEL_13:
    objc_msgSend(a1, "setHandleType:", v9);
  }

  if (a3)
    v10 = CFSTR("placeRefinementParameters");
  else
    v10 = CFSTR("place_refinement_parameters");
  objc_msgSend(v5, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12 = [GEOPDPlaceRefinementParameters alloc];
    if (v12)
      v13 = (void *)-[GEOPDPlaceRefinementParameters _initWithDictionary:isJSON:]((uint64_t)v12, v11, a3);
    else
      v13 = 0;
    objc_msgSend(a1, "setPlaceRefinementParameters:", v13);

  }
  if (a3)
    v14 = CFSTR("placeRequestData");
  else
    v14 = CFSTR("place_request_data");
  objc_msgSend(v5, "objectForKeyedSubscript:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v16 = [GEOMapItemInitialRequestData alloc];
    if ((a3 & 1) != 0)
      v17 = -[GEOMapItemInitialRequestData initWithJSON:](v16, "initWithJSON:", v15);
    else
      v17 = -[GEOMapItemInitialRequestData initWithDictionary:](v16, "initWithDictionary:", v15);
    v18 = (void *)v17;
    objc_msgSend(a1, "setPlaceRequestData:", v17);

  }
  if (a3)
    v19 = CFSTR("clientAttributes");
  else
    v19 = CFSTR("client_attributes");
  objc_msgSend(v5, "objectForKeyedSubscript:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v21 = [GEOMapItemClientAttributes alloc];
    if ((a3 & 1) != 0)
      v22 = -[GEOMapItemClientAttributes initWithJSON:](v21, "initWithJSON:", v20);
    else
      v22 = -[GEOMapItemClientAttributes initWithDictionary:](v21, "initWithDictionary:", v20);
    v23 = (void *)v22;
    objc_msgSend(a1, "setClientAttributes:", v22);

  }
LABEL_38:

  return a1;
}

- (GEOMapItemHandle)initWithJSON:(id)a3
{
  return (GEOMapItemHandle *)-[GEOMapItemHandle _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOMapItemHandleIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOMapItemHandleReadAllFrom((uint64_t)self, a3, 0);
}

- (void)clearSensitiveFields:(unint64_t)a3
{
  GEOMapItemHandleClearSensitiveFields(self, a3, 1);
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[GEOMapItemHandle _readClientAttributes]((uint64_t)self);
  if (-[GEOMapItemClientAttributes hasGreenTeaWithValue:](self->_clientAttributes, "hasGreenTeaWithValue:", v3))
    return 1;
  -[GEOMapItemHandle _readPlaceRefinementParameters]((uint64_t)self);
  if ((-[GEOPDPlaceRefinementParameters hasGreenTeaWithValue:]((uint64_t)self->_placeRefinementParameters, v3) & 1) != 0)
    return 1;
  -[GEOMapItemHandle _readPlaceRequestData]((uint64_t)self);
  return -[GEOMapItemInitialRequestData hasGreenTeaWithValue:](self->_placeRequestData, "hasGreenTeaWithValue:", v3);
}

- (void)copyTo:(id)a3
{
  id *v4;
  id *v5;

  v5 = (id *)a3;
  -[GEOMapItemHandle readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 10) = self->_readerMarkPos;
  *((_DWORD *)v5 + 11) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  v4 = v5;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *((_DWORD *)v5 + 13) = self->_handleType;
    *((_BYTE *)v5 + 56) |= 1u;
  }
  if (self->_placeRefinementParameters)
  {
    objc_msgSend(v5, "setPlaceRefinementParameters:");
    v4 = v5;
  }
  if (self->_placeRequestData)
  {
    objc_msgSend(v5, "setPlaceRequestData:");
    v4 = v5;
  }
  if (self->_clientAttributes)
  {
    objc_msgSend(v5, "setClientAttributes:");
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
  id v13;

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
      GEOMapItemHandleReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_8;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOMapItemHandle readAll:](self, "readAll:", 0);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 52) = self->_handleType;
    *(_BYTE *)(v5 + 56) |= 1u;
  }
  v9 = -[GEOPDPlaceRefinementParameters copyWithZone:](self->_placeRefinementParameters, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v9;

  v11 = -[GEOMapItemInitialRequestData copyWithZone:](self->_placeRequestData, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v11;

  v13 = -[GEOMapItemClientAttributes copyWithZone:](self->_clientAttributes, "copyWithZone:", a3);
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v13;
LABEL_8:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  GEOPDPlaceRefinementParameters *placeRefinementParameters;
  GEOMapItemInitialRequestData *placeRequestData;
  GEOMapItemClientAttributes *clientAttributes;
  char v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_13;
  -[GEOMapItemHandle readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 1) == 0 || self->_handleType != *((_DWORD *)v4 + 13))
      goto LABEL_13;
  }
  else if ((*((_BYTE *)v4 + 56) & 1) != 0)
  {
LABEL_13:
    v8 = 0;
    goto LABEL_14;
  }
  placeRefinementParameters = self->_placeRefinementParameters;
  if ((unint64_t)placeRefinementParameters | *((_QWORD *)v4 + 3)
    && !-[GEOPDPlaceRefinementParameters isEqual:](placeRefinementParameters, "isEqual:"))
  {
    goto LABEL_13;
  }
  placeRequestData = self->_placeRequestData;
  if ((unint64_t)placeRequestData | *((_QWORD *)v4 + 4))
  {
    if (!-[GEOMapItemInitialRequestData isEqual:](placeRequestData, "isEqual:"))
      goto LABEL_13;
  }
  clientAttributes = self->_clientAttributes;
  if ((unint64_t)clientAttributes | *((_QWORD *)v4 + 2))
    v8 = -[GEOMapItemClientAttributes isEqual:](clientAttributes, "isEqual:");
  else
    v8 = 1;
LABEL_14:

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;

  -[GEOMapItemHandle readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v3 = 2654435761 * self->_handleType;
  else
    v3 = 0;
  v4 = -[GEOPDPlaceRefinementParameters hash](self->_placeRefinementParameters, "hash") ^ v3;
  v5 = -[GEOMapItemInitialRequestData hash](self->_placeRequestData, "hash");
  return v4 ^ v5 ^ -[GEOMapItemClientAttributes hash](self->_clientAttributes, "hash");
}

- (void)mergeFrom:(id)a3
{
  int *v4;
  GEOPDPlaceRefinementParameters *placeRefinementParameters;
  void *v6;
  GEOMapItemInitialRequestData *placeRequestData;
  uint64_t v8;
  GEOMapItemClientAttributes *clientAttributes;
  uint64_t v10;
  int *v11;

  v11 = (int *)a3;
  objc_msgSend(v11, "readAll:", 0);
  v4 = v11;
  if ((v11[14] & 1) != 0)
  {
    self->_handleType = v11[13];
    *(_BYTE *)&self->_flags |= 1u;
  }
  placeRefinementParameters = self->_placeRefinementParameters;
  v6 = (void *)*((_QWORD *)v11 + 3);
  if (placeRefinementParameters)
  {
    if (!v6)
      goto LABEL_9;
    -[GEOPDPlaceRefinementParameters mergeFrom:]((uint64_t)placeRefinementParameters, v6);
  }
  else
  {
    if (!v6)
      goto LABEL_9;
    -[GEOMapItemHandle setPlaceRefinementParameters:](self, "setPlaceRefinementParameters:", *((_QWORD *)v11 + 3));
  }
  v4 = v11;
LABEL_9:
  placeRequestData = self->_placeRequestData;
  v8 = *((_QWORD *)v4 + 4);
  if (placeRequestData)
  {
    if (!v8)
      goto LABEL_15;
    -[GEOMapItemInitialRequestData mergeFrom:](placeRequestData, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_15;
    -[GEOMapItemHandle setPlaceRequestData:](self, "setPlaceRequestData:");
  }
  v4 = v11;
LABEL_15:
  clientAttributes = self->_clientAttributes;
  v10 = *((_QWORD *)v4 + 2);
  if (clientAttributes)
  {
    if (v10)
    {
      -[GEOMapItemClientAttributes mergeFrom:](clientAttributes, "mergeFrom:");
LABEL_20:
      v4 = v11;
    }
  }
  else if (v10)
  {
    -[GEOMapItemHandle setClientAttributes:](self, "setClientAttributes:");
    goto LABEL_20;
  }

}

@end
