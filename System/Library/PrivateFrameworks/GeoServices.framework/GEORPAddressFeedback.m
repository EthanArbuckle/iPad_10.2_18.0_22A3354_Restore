@implementation GEORPAddressFeedback

- (GEORPAddressFeedback)init
{
  GEORPAddressFeedback *v2;
  GEORPAddressFeedback *v3;
  GEORPAddressFeedback *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEORPAddressFeedback;
  v2 = -[GEORPAddressFeedback init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPAddressFeedback)initWithData:(id)a3
{
  GEORPAddressFeedback *v3;
  GEORPAddressFeedback *v4;
  GEORPAddressFeedback *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEORPAddressFeedback;
  v3 = -[GEORPAddressFeedback initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readAddress
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
        GEORPAddressFeedbackReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAddress_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasAddress
{
  -[GEORPAddressFeedback _readAddress]((uint64_t)self);
  return self->_address != 0;
}

- (GEORPAddressCorrections)address
{
  -[GEORPAddressFeedback _readAddress]((uint64_t)self);
  return self->_address;
}

- (void)setAddress:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x44u;
  objc_storeStrong((id *)&self->_address, a3);
}

- (void)_readPlace
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
        GEORPAddressFeedbackReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPlace_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasPlace
{
  -[GEORPAddressFeedback _readPlace]((uint64_t)self);
  return self->_place != 0;
}

- (GEOPDPlace)place
{
  -[GEORPAddressFeedback _readPlace]((uint64_t)self);
  return self->_place;
}

- (void)setPlace:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x60u;
  objc_storeStrong((id *)&self->_place, a3);
}

- (int)type
{
  os_unfair_lock_s *p_readerLock;
  char flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 1) != 0)
    return self->_type;
  else
    return 0;
}

- (void)setType:(int)a3
{
  *(_BYTE *)&self->_flags |= 0x41u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3 | 0x40;
}

- (BOOL)hasType
{
  return *(_BYTE *)&self->_flags & 1;
}

- (id)typeAsString:(int)a3
{
  if (a3 < 3)
    return off_1E1C03858[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ADDRESS_CORRECTION_TYPE_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ADDRESS_CORRECTION_TYPE_ADD")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("ADDRESS_CORRECTION_TYPE_EDIT")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_readPersonalizedMaps
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
        GEORPAddressFeedbackReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPersonalizedMaps_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasPersonalizedMaps
{
  -[GEORPAddressFeedback _readPersonalizedMaps]((uint64_t)self);
  return self->_personalizedMaps != 0;
}

- (GEORPPersonalizedMapsContext)personalizedMaps
{
  -[GEORPAddressFeedback _readPersonalizedMaps]((uint64_t)self);
  return self->_personalizedMaps;
}

- (void)setPersonalizedMaps:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x48u;
  objc_storeStrong((id *)&self->_personalizedMaps, a3);
}

- (void)_readPlaceRequest
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
        GEORPAddressFeedbackReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPlaceRequest_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasPlaceRequest
{
  -[GEORPAddressFeedback _readPlaceRequest]((uint64_t)self);
  return self->_placeRequest != 0;
}

- (GEOPDPlaceRequest)placeRequest
{
  -[GEORPAddressFeedback _readPlaceRequest]((uint64_t)self);
  return self->_placeRequest;
}

- (void)setPlaceRequest:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x50u;
  objc_storeStrong((id *)&self->_placeRequest, a3);
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
  v8.super_class = (Class)GEORPAddressFeedback;
  -[GEORPAddressFeedback description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORPAddressFeedback dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPAddressFeedback _dictionaryRepresentation:]((uint64_t)self, 0);
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
  uint64_t v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
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
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)a1, "address");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v5, "jsonRepresentation");
    else
      objc_msgSend(v5, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("address"));

  }
  objc_msgSend((id)a1, "place");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v8, "jsonRepresentation");
    else
      objc_msgSend(v8, "dictionaryRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("place"));

  }
  if ((*(_BYTE *)(a1 + 72) & 1) != 0)
  {
    v11 = *(int *)(a1 + 68);
    if (v11 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 68));
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = off_1E1C03858[v11];
    }
    objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("type"));

  }
  objc_msgSend((id)a1, "personalizedMaps");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v13, "jsonRepresentation");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = CFSTR("personalizedMaps");
    }
    else
    {
      objc_msgSend(v13, "dictionaryRepresentation");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = CFSTR("personalized_maps");
    }
    objc_msgSend(v4, "setObject:forKey:", v15, v16);

  }
  objc_msgSend((id)a1, "placeRequest");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v17, "jsonRepresentation");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = CFSTR("placeRequest");
    }
    else
    {
      objc_msgSend(v17, "dictionaryRepresentation");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = CFSTR("place_request");
    }
    objc_msgSend(v4, "setObject:forKey:", v19, v20);

  }
  v21 = *(void **)(a1 + 16);
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
      v28[2] = __50__GEORPAddressFeedback__dictionaryRepresentation___block_invoke;
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
  return -[GEORPAddressFeedback _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __50__GEORPAddressFeedback__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEORPAddressFeedback)initWithDictionary:(id)a3
{
  return (GEORPAddressFeedback *)-[GEORPAddressFeedback _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  void *v6;
  GEORPAddressCorrections *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  GEOPDPlace *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  const __CFString *v17;
  void *v18;
  GEORPPersonalizedMapsContext *v19;
  uint64_t v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  GEOPDPlaceRequest *v24;
  uint64_t v25;
  void *v26;

  v5 = a2;
  if (!a1)
    goto LABEL_42;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_42;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("address"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = [GEORPAddressCorrections alloc];
    if ((a3 & 1) != 0)
      v8 = -[GEORPAddressCorrections initWithJSON:](v7, "initWithJSON:", v6);
    else
      v8 = -[GEORPAddressCorrections initWithDictionary:](v7, "initWithDictionary:", v6);
    v9 = (void *)v8;
    objc_msgSend(a1, "setAddress:", v8);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("place"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = [GEOPDPlace alloc];
    if ((a3 & 1) != 0)
      v12 = -[GEOPDPlace initWithJSON:](v11, "initWithJSON:", v10);
    else
      v12 = -[GEOPDPlace initWithDictionary:](v11, "initWithDictionary:", v10);
    v13 = (void *)v12;
    objc_msgSend(a1, "setPlace:", v12);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("type"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v15 = v14;
    if ((objc_msgSend(v15, "isEqualToString:", CFSTR("ADDRESS_CORRECTION_TYPE_UNKNOWN")) & 1) != 0)
    {
      v16 = 0;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("ADDRESS_CORRECTION_TYPE_ADD")) & 1) != 0)
    {
      v16 = 1;
    }
    else if (objc_msgSend(v15, "isEqualToString:", CFSTR("ADDRESS_CORRECTION_TYPE_EDIT")))
    {
      v16 = 2;
    }
    else
    {
      v16 = 0;
    }

    goto LABEL_24;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v16 = objc_msgSend(v14, "intValue");
LABEL_24:
    objc_msgSend(a1, "setType:", v16);
  }

  if (a3)
    v17 = CFSTR("personalizedMaps");
  else
    v17 = CFSTR("personalized_maps");
  objc_msgSend(v5, "objectForKeyedSubscript:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v19 = [GEORPPersonalizedMapsContext alloc];
    if ((a3 & 1) != 0)
      v20 = -[GEORPPersonalizedMapsContext initWithJSON:](v19, "initWithJSON:", v18);
    else
      v20 = -[GEORPPersonalizedMapsContext initWithDictionary:](v19, "initWithDictionary:", v18);
    v21 = (void *)v20;
    objc_msgSend(a1, "setPersonalizedMaps:", v20);

  }
  if (a3)
    v22 = CFSTR("placeRequest");
  else
    v22 = CFSTR("place_request");
  objc_msgSend(v5, "objectForKeyedSubscript:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v24 = [GEOPDPlaceRequest alloc];
    if ((a3 & 1) != 0)
      v25 = -[GEOPDPlaceRequest initWithJSON:](v24, "initWithJSON:", v23);
    else
      v25 = -[GEOPDPlaceRequest initWithDictionary:](v24, "initWithDictionary:", v23);
    v26 = (void *)v25;
    objc_msgSend(a1, "setPlaceRequest:", v25);

  }
LABEL_42:

  return a1;
}

- (GEORPAddressFeedback)initWithJSON:(id)a3
{
  return (GEORPAddressFeedback *)-[GEORPAddressFeedback _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_202;
    else
      v8 = (int *)&readAll__nonRecursiveTag_203;
    GEORPAddressFeedbackReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEORPAddressFeedbackCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPAddressFeedbackIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPAddressFeedbackReadAllFrom((uint64_t)self, a3, 0);
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
  if (self->_reader && (_GEORPAddressFeedbackIsDirty((uint64_t)self) & 1) == 0)
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
    -[GEORPAddressFeedback readAll:](self, "readAll:", 0);
    if (self->_address)
      PBDataWriterWriteSubmessage();
    v5 = v8;
    if (self->_place)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if ((*(_BYTE *)&self->_flags & 1) != 0)
    {
      PBDataWriterWriteInt32Field();
      v5 = v8;
    }
    if (self->_personalizedMaps)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_placeRequest)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v5);
  }

}

- (void)clearSensitiveFields:(unint64_t)a3
{
  GEORPAddressFeedbackClearSensitiveFields(self, a3, 1);
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[GEORPAddressFeedback _readAddress]((uint64_t)self);
  if (-[GEORPAddressCorrections hasGreenTeaWithValue:](self->_address, "hasGreenTeaWithValue:", v3))
    return 1;
  -[GEORPAddressFeedback _readPlace]((uint64_t)self);
  if (-[GEOPDPlace hasGreenTeaWithValue:](self->_place, "hasGreenTeaWithValue:", v3))
    return 1;
  -[GEORPAddressFeedback _readPlaceRequest]((uint64_t)self);
  return -[GEOPDPlaceRequest hasGreenTeaWithValue:](self->_placeRequest, "hasGreenTeaWithValue:", v3);
}

- (void)copyTo:(id)a3
{
  id *v4;
  id *v5;

  v5 = (id *)a3;
  -[GEORPAddressFeedback readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 14) = self->_readerMarkPos;
  *((_DWORD *)v5 + 15) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_address)
    objc_msgSend(v5, "setAddress:");
  if (self->_place)
    objc_msgSend(v5, "setPlace:");
  v4 = v5;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *((_DWORD *)v5 + 17) = self->_type;
    *((_BYTE *)v5 + 72) |= 1u;
  }
  if (self->_personalizedMaps)
  {
    objc_msgSend(v5, "setPersonalizedMaps:");
    v4 = v5;
  }
  if (self->_placeRequest)
  {
    objc_msgSend(v5, "setPlaceRequest:");
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
  void *v14;
  id v15;
  void *v16;
  PBUnknownFields *v17;

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
      GEORPAddressFeedbackReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_8;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEORPAddressFeedback readAll:](self, "readAll:", 0);
  v9 = -[GEORPAddressCorrections copyWithZone:](self->_address, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v9;

  v11 = -[GEOPDPlace copyWithZone:](self->_place, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v11;

  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 68) = self->_type;
    *(_BYTE *)(v5 + 72) |= 1u;
  }
  v13 = -[GEORPPersonalizedMapsContext copyWithZone:](self->_personalizedMaps, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v13;

  v15 = -[GEOPDPlaceRequest copyWithZone:](self->_placeRequest, "copyWithZone:", a3);
  v16 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v15;

  v17 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v17;
LABEL_8:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  GEORPAddressCorrections *address;
  GEOPDPlace *place;
  GEORPPersonalizedMapsContext *personalizedMaps;
  GEOPDPlaceRequest *placeRequest;
  char v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_15;
  -[GEORPAddressFeedback readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  address = self->_address;
  if ((unint64_t)address | *((_QWORD *)v4 + 3))
  {
    if (!-[GEORPAddressCorrections isEqual:](address, "isEqual:"))
      goto LABEL_15;
  }
  place = self->_place;
  if ((unint64_t)place | *((_QWORD *)v4 + 6))
  {
    if (!-[GEOPDPlace isEqual:](place, "isEqual:"))
      goto LABEL_15;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 72) & 1) == 0 || self->_type != *((_DWORD *)v4 + 17))
      goto LABEL_15;
  }
  else if ((*((_BYTE *)v4 + 72) & 1) != 0)
  {
LABEL_15:
    v9 = 0;
    goto LABEL_16;
  }
  personalizedMaps = self->_personalizedMaps;
  if ((unint64_t)personalizedMaps | *((_QWORD *)v4 + 4)
    && !-[GEORPPersonalizedMapsContext isEqual:](personalizedMaps, "isEqual:"))
  {
    goto LABEL_15;
  }
  placeRequest = self->_placeRequest;
  if ((unint64_t)placeRequest | *((_QWORD *)v4 + 5))
    v9 = -[GEOPDPlaceRequest isEqual:](placeRequest, "isEqual:");
  else
    v9 = 1;
LABEL_16:

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;

  -[GEORPAddressFeedback readAll:](self, "readAll:", 1);
  v3 = -[GEORPAddressCorrections hash](self->_address, "hash");
  v4 = -[GEOPDPlace hash](self->_place, "hash");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v5 = 2654435761 * self->_type;
  else
    v5 = 0;
  v6 = v4 ^ v3 ^ v5 ^ -[GEORPPersonalizedMapsContext hash](self->_personalizedMaps, "hash");
  return v6 ^ -[GEOPDPlaceRequest hash](self->_placeRequest, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  GEORPAddressCorrections *address;
  uint64_t v6;
  GEOPDPlace *place;
  uint64_t v8;
  GEORPPersonalizedMapsContext *personalizedMaps;
  uint64_t v10;
  GEOPDPlaceRequest *placeRequest;
  uint64_t v12;
  _QWORD *v13;

  v13 = a3;
  objc_msgSend(v13, "readAll:", 0);
  v4 = v13;
  address = self->_address;
  v6 = v13[3];
  if (address)
  {
    if (!v6)
      goto LABEL_7;
    -[GEORPAddressCorrections mergeFrom:](address, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[GEORPAddressFeedback setAddress:](self, "setAddress:");
  }
  v4 = v13;
LABEL_7:
  place = self->_place;
  v8 = v4[6];
  if (place)
  {
    if (!v8)
      goto LABEL_13;
    -[GEOPDPlace mergeFrom:](place, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_13;
    -[GEORPAddressFeedback setPlace:](self, "setPlace:");
  }
  v4 = v13;
LABEL_13:
  if ((v4[9] & 1) != 0)
  {
    self->_type = *((_DWORD *)v4 + 17);
    *(_BYTE *)&self->_flags |= 1u;
  }
  personalizedMaps = self->_personalizedMaps;
  v10 = v4[4];
  if (personalizedMaps)
  {
    if (!v10)
      goto LABEL_21;
    -[GEORPPersonalizedMapsContext mergeFrom:](personalizedMaps, "mergeFrom:");
  }
  else
  {
    if (!v10)
      goto LABEL_21;
    -[GEORPAddressFeedback setPersonalizedMaps:](self, "setPersonalizedMaps:");
  }
  v4 = v13;
LABEL_21:
  placeRequest = self->_placeRequest;
  v12 = v4[5];
  if (placeRequest)
  {
    if (v12)
    {
      -[GEOPDPlaceRequest mergeFrom:](placeRequest, "mergeFrom:");
LABEL_26:
      v4 = v13;
    }
  }
  else if (v12)
  {
    -[GEORPAddressFeedback setPlaceRequest:](self, "setPlaceRequest:");
    goto LABEL_26;
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
      GEORPAddressFeedbackReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_206);
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
  *(_BYTE *)&self->_flags |= 0x42u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEORPAddressFeedback readAll:](self, "readAll:", 0);
    -[GEORPAddressCorrections clearUnknownFields:](self->_address, "clearUnknownFields:", 1);
    -[GEOPDPlace clearUnknownFields:](self->_place, "clearUnknownFields:", 1);
    -[GEORPPersonalizedMapsContext clearUnknownFields:](self->_personalizedMaps, "clearUnknownFields:", 1);
    -[GEOPDPlaceRequest clearUnknownFields:](self->_placeRequest, "clearUnknownFields:", 1);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_place, 0);
  objc_storeStrong((id *)&self->_placeRequest, 0);
  objc_storeStrong((id *)&self->_personalizedMaps, 0);
  objc_storeStrong((id *)&self->_address, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
