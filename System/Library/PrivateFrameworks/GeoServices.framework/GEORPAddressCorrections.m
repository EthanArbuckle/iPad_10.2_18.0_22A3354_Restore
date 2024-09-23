@implementation GEORPAddressCorrections

- (GEORPAddressCorrections)init
{
  GEORPAddressCorrections *v2;
  GEORPAddressCorrections *v3;
  GEORPAddressCorrections *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEORPAddressCorrections;
  v2 = -[GEORPAddressCorrections init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPAddressCorrections)initWithData:(id)a3
{
  GEORPAddressCorrections *v3;
  GEORPAddressCorrections *v4;
  GEORPAddressCorrections *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEORPAddressCorrections;
  v3 = -[GEORPAddressCorrections initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readAddressFields
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
        GEORPAddressCorrectionsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAddressFields_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasAddressFields
{
  -[GEORPAddressCorrections _readAddressFields]((uint64_t)self);
  return self->_addressFields != 0;
}

- (GEORPFeedbackAddressFields)addressFields
{
  -[GEORPAddressCorrections _readAddressFields]((uint64_t)self);
  return self->_addressFields;
}

- (void)setAddressFields:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x44u;
  objc_storeStrong((id *)&self->_addressFields, a3);
}

- (void)_readCoordinate
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
        GEORPAddressCorrectionsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCoordinate_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasCoordinate
{
  -[GEORPAddressCorrections _readCoordinate]((uint64_t)self);
  return self->_coordinate != 0;
}

- (GEORPCorrectedCoordinate)coordinate
{
  -[GEORPAddressCorrections _readCoordinate]((uint64_t)self);
  return self->_coordinate;
}

- (void)setCoordinate:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x48u;
  objc_storeStrong((id *)&self->_coordinate, a3);
}

- (void)_readMapLocation
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
        GEORPAddressCorrectionsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMapLocation_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasMapLocation
{
  -[GEORPAddressCorrections _readMapLocation]((uint64_t)self);
  return self->_mapLocation != 0;
}

- (GEORPMapLocation)mapLocation
{
  -[GEORPAddressCorrections _readMapLocation]((uint64_t)self);
  return self->_mapLocation;
}

- (void)setMapLocation:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x50u;
  objc_storeStrong((id *)&self->_mapLocation, a3);
}

- (void)_readAccessPoint
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
        GEORPAddressCorrectionsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAccessPoint_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasAccessPoint
{
  -[GEORPAddressCorrections _readAccessPoint]((uint64_t)self);
  return self->_accessPoint != 0;
}

- (GEORPAccessPointCorrections)accessPoint
{
  -[GEORPAddressCorrections _readAccessPoint]((uint64_t)self);
  return self->_accessPoint;
}

- (void)setAccessPoint:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x42u;
  objc_storeStrong((id *)&self->_accessPoint, a3);
}

- (void)_readOriginalAddressFields
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
        GEORPAddressCorrectionsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readOriginalAddressFields_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasOriginalAddressFields
{
  -[GEORPAddressCorrections _readOriginalAddressFields]((uint64_t)self);
  return self->_originalAddressFields != 0;
}

- (GEORPFeedbackAddressFields)originalAddressFields
{
  -[GEORPAddressCorrections _readOriginalAddressFields]((uint64_t)self);
  return self->_originalAddressFields;
}

- (void)setOriginalAddressFields:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x60u;
  objc_storeStrong((id *)&self->_originalAddressFields, a3);
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
  v8.super_class = (Class)GEORPAddressCorrections;
  -[GEORPAddressCorrections description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORPAddressCorrections dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPAddressCorrections _dictionaryRepresentation:](self, 0);
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
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  _QWORD v31[4];
  id v32;

  if (!a1)
    return 0;
  objc_msgSend(a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "addressFields");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v5, "jsonRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = CFSTR("addressFields");
    }
    else
    {
      objc_msgSend(v5, "dictionaryRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = CFSTR("address_fields");
    }
    objc_msgSend(v4, "setObject:forKey:", v7, v8);

  }
  objc_msgSend(a1, "coordinate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v9, "jsonRepresentation");
    else
      objc_msgSend(v9, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("coordinate"));

  }
  objc_msgSend(a1, "mapLocation");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v12, "jsonRepresentation");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = CFSTR("mapLocation");
    }
    else
    {
      objc_msgSend(v12, "dictionaryRepresentation");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = CFSTR("map_location");
    }
    objc_msgSend(v4, "setObject:forKey:", v14, v15);

  }
  objc_msgSend(a1, "accessPoint");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v16)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v16, "jsonRepresentation");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = CFSTR("accessPoint");
    }
    else
    {
      objc_msgSend(v16, "dictionaryRepresentation");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = CFSTR("access_point");
    }
    objc_msgSend(v4, "setObject:forKey:", v18, v19);

  }
  objc_msgSend(a1, "originalAddressFields");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v20)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v20, "jsonRepresentation");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = CFSTR("originalAddressFields");
    }
    else
    {
      objc_msgSend(v20, "dictionaryRepresentation");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = CFSTR("original_address_fields");
    }
    objc_msgSend(v4, "setObject:forKey:", v22, v23);

  }
  v24 = (void *)a1[2];
  if (v24)
  {
    objc_msgSend(v24, "dictionaryRepresentation");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v25;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v25, "count"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __53__GEORPAddressCorrections__dictionaryRepresentation___block_invoke;
      v31[3] = &unk_1E1C00600;
      v28 = v27;
      v32 = v28;
      objc_msgSend(v26, "enumerateKeysAndObjectsUsingBlock:", v31);
      v29 = v28;

      v26 = v29;
    }
    objc_msgSend(v4, "setObject:forKey:", v26, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEORPAddressCorrections _dictionaryRepresentation:](self, 1);
}

void __53__GEORPAddressCorrections__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEORPAddressCorrections)initWithDictionary:(id)a3
{
  return (GEORPAddressCorrections *)-[GEORPAddressCorrections _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  GEORPFeedbackAddressFields *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  GEORPCorrectedCoordinate *v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  GEORPMapLocation *v17;
  uint64_t v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  GEORPAccessPointCorrections *v22;
  uint64_t v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  GEORPFeedbackAddressFields *v27;
  uint64_t v28;
  void *v29;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("addressFields");
      else
        v6 = CFSTR("address_fields");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = [GEORPFeedbackAddressFields alloc];
        if ((a3 & 1) != 0)
          v9 = -[GEORPFeedbackAddressFields initWithJSON:](v8, "initWithJSON:", v7);
        else
          v9 = -[GEORPFeedbackAddressFields initWithDictionary:](v8, "initWithDictionary:", v7);
        v10 = (void *)v9;
        objc_msgSend(a1, "setAddressFields:", v9);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("coordinate"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v12 = [GEORPCorrectedCoordinate alloc];
        if ((a3 & 1) != 0)
          v13 = -[GEORPCorrectedCoordinate initWithJSON:](v12, "initWithJSON:", v11);
        else
          v13 = -[GEORPCorrectedCoordinate initWithDictionary:](v12, "initWithDictionary:", v11);
        v14 = (void *)v13;
        objc_msgSend(a1, "setCoordinate:", v13);

      }
      if (a3)
        v15 = CFSTR("mapLocation");
      else
        v15 = CFSTR("map_location");
      objc_msgSend(v5, "objectForKeyedSubscript:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v17 = [GEORPMapLocation alloc];
        if ((a3 & 1) != 0)
          v18 = -[GEORPMapLocation initWithJSON:](v17, "initWithJSON:", v16);
        else
          v18 = -[GEORPMapLocation initWithDictionary:](v17, "initWithDictionary:", v16);
        v19 = (void *)v18;
        objc_msgSend(a1, "setMapLocation:", v18);

      }
      if (a3)
        v20 = CFSTR("accessPoint");
      else
        v20 = CFSTR("access_point");
      objc_msgSend(v5, "objectForKeyedSubscript:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v22 = [GEORPAccessPointCorrections alloc];
        if ((a3 & 1) != 0)
          v23 = -[GEORPAccessPointCorrections initWithJSON:](v22, "initWithJSON:", v21);
        else
          v23 = -[GEORPAccessPointCorrections initWithDictionary:](v22, "initWithDictionary:", v21);
        v24 = (void *)v23;
        objc_msgSend(a1, "setAccessPoint:", v23);

      }
      if (a3)
        v25 = CFSTR("originalAddressFields");
      else
        v25 = CFSTR("original_address_fields");
      objc_msgSend(v5, "objectForKeyedSubscript:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v27 = [GEORPFeedbackAddressFields alloc];
        if ((a3 & 1) != 0)
          v28 = -[GEORPFeedbackAddressFields initWithJSON:](v27, "initWithJSON:", v26);
        else
          v28 = -[GEORPFeedbackAddressFields initWithDictionary:](v27, "initWithDictionary:", v26);
        v29 = (void *)v28;
        objc_msgSend(a1, "setOriginalAddressFields:", v28);

      }
    }
  }

  return a1;
}

- (GEORPAddressCorrections)initWithJSON:(id)a3
{
  return (GEORPAddressCorrections *)-[GEORPAddressCorrections _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_136;
    else
      v8 = (int *)&readAll__nonRecursiveTag_137;
    GEORPAddressCorrectionsReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEORPAddressCorrectionsCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPAddressCorrectionsIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPAddressCorrectionsReadAllFrom((uint64_t)self, a3, 0);
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
  if (self->_reader && !_GEORPAddressCorrectionsIsDirty((uint64_t)self))
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
    -[GEORPAddressCorrections readAll:](self, "readAll:", 0);
    if (self->_addressFields)
      PBDataWriterWriteSubmessage();
    v5 = v8;
    if (self->_coordinate)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_mapLocation)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_accessPoint)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_originalAddressFields)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v5);
  }

}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[GEORPAddressCorrections _readAccessPoint]((uint64_t)self);
  if (-[GEORPAccessPointCorrections hasGreenTeaWithValue:](self->_accessPoint, "hasGreenTeaWithValue:", v3))
    return 1;
  -[GEORPAddressCorrections _readCoordinate]((uint64_t)self);
  if (-[GEORPCorrectedCoordinate hasGreenTeaWithValue:](self->_coordinate, "hasGreenTeaWithValue:", v3))
    return 1;
  -[GEORPAddressCorrections _readMapLocation]((uint64_t)self);
  return -[GEORPMapLocation hasGreenTeaWithValue:](self->_mapLocation, "hasGreenTeaWithValue:", v3);
}

- (void)copyTo:(id)a3
{
  id *v4;
  id *v5;

  v5 = (id *)a3;
  -[GEORPAddressCorrections readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 16) = self->_readerMarkPos;
  *((_DWORD *)v5 + 17) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_addressFields)
    objc_msgSend(v5, "setAddressFields:");
  if (self->_coordinate)
    objc_msgSend(v5, "setCoordinate:");
  v4 = v5;
  if (self->_mapLocation)
  {
    objc_msgSend(v5, "setMapLocation:");
    v4 = v5;
  }
  if (self->_accessPoint)
  {
    objc_msgSend(v5, "setAccessPoint:");
    v4 = v5;
  }
  if (self->_originalAddressFields)
  {
    objc_msgSend(v5, "setOriginalAddressFields:");
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
  id v12;
  void *v13;
  id v14;
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
    -[GEORPAddressCorrections readAll:](self, "readAll:", 0);
    v8 = -[GEORPFeedbackAddressFields copyWithZone:](self->_addressFields, "copyWithZone:", a3);
    v9 = *(void **)(v5 + 32);
    *(_QWORD *)(v5 + 32) = v8;

    v10 = -[GEORPCorrectedCoordinate copyWithZone:](self->_coordinate, "copyWithZone:", a3);
    v11 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v10;

    v12 = -[GEORPMapLocation copyWithZone:](self->_mapLocation, "copyWithZone:", a3);
    v13 = *(void **)(v5 + 48);
    *(_QWORD *)(v5 + 48) = v12;

    v14 = -[GEORPAccessPointCorrections copyWithZone:](self->_accessPoint, "copyWithZone:", a3);
    v15 = *(void **)(v5 + 24);
    *(_QWORD *)(v5 + 24) = v14;

    v16 = -[GEORPFeedbackAddressFields copyWithZone:](self->_originalAddressFields, "copyWithZone:", a3);
    v17 = *(void **)(v5 + 56);
    *(_QWORD *)(v5 + 56) = v16;

    objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
    return (id)v5;
  }
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  GEORPAddressCorrectionsReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  GEORPFeedbackAddressFields *addressFields;
  GEORPCorrectedCoordinate *coordinate;
  GEORPMapLocation *mapLocation;
  GEORPAccessPointCorrections *accessPoint;
  GEORPFeedbackAddressFields *originalAddressFields;
  char v10;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((-[GEORPAddressCorrections readAll:](self, "readAll:", 1),
         objc_msgSend(v4, "readAll:", 1),
         addressFields = self->_addressFields,
         !((unint64_t)addressFields | v4[4]))
     || -[GEORPFeedbackAddressFields isEqual:](addressFields, "isEqual:"))
    && ((coordinate = self->_coordinate, !((unint64_t)coordinate | v4[5]))
     || -[GEORPCorrectedCoordinate isEqual:](coordinate, "isEqual:"))
    && ((mapLocation = self->_mapLocation, !((unint64_t)mapLocation | v4[6]))
     || -[GEORPMapLocation isEqual:](mapLocation, "isEqual:"))
    && ((accessPoint = self->_accessPoint, !((unint64_t)accessPoint | v4[3]))
     || -[GEORPAccessPointCorrections isEqual:](accessPoint, "isEqual:")))
  {
    originalAddressFields = self->_originalAddressFields;
    if ((unint64_t)originalAddressFields | v4[7])
      v10 = -[GEORPFeedbackAddressFields isEqual:](originalAddressFields, "isEqual:");
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
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;

  -[GEORPAddressCorrections readAll:](self, "readAll:", 1);
  v3 = -[GEORPFeedbackAddressFields hash](self->_addressFields, "hash");
  v4 = -[GEORPCorrectedCoordinate hash](self->_coordinate, "hash") ^ v3;
  v5 = -[GEORPMapLocation hash](self->_mapLocation, "hash");
  v6 = v4 ^ v5 ^ -[GEORPAccessPointCorrections hash](self->_accessPoint, "hash");
  return v6 ^ -[GEORPFeedbackAddressFields hash](self->_originalAddressFields, "hash");
}

- (void)mergeFrom:(id)a3
{
  GEORPFeedbackAddressFields *addressFields;
  uint64_t v5;
  GEORPCorrectedCoordinate *coordinate;
  uint64_t v7;
  GEORPMapLocation *mapLocation;
  uint64_t v9;
  GEORPAccessPointCorrections *accessPoint;
  uint64_t v11;
  GEORPFeedbackAddressFields *originalAddressFields;
  uint64_t v13;
  _QWORD *v14;

  v14 = a3;
  objc_msgSend(v14, "readAll:", 0);
  addressFields = self->_addressFields;
  v5 = v14[4];
  if (addressFields)
  {
    if (v5)
      -[GEORPFeedbackAddressFields mergeFrom:](addressFields, "mergeFrom:");
  }
  else if (v5)
  {
    -[GEORPAddressCorrections setAddressFields:](self, "setAddressFields:");
  }
  coordinate = self->_coordinate;
  v7 = v14[5];
  if (coordinate)
  {
    if (v7)
      -[GEORPCorrectedCoordinate mergeFrom:](coordinate, "mergeFrom:");
  }
  else if (v7)
  {
    -[GEORPAddressCorrections setCoordinate:](self, "setCoordinate:");
  }
  mapLocation = self->_mapLocation;
  v9 = v14[6];
  if (mapLocation)
  {
    if (v9)
      -[GEORPMapLocation mergeFrom:](mapLocation, "mergeFrom:");
  }
  else if (v9)
  {
    -[GEORPAddressCorrections setMapLocation:](self, "setMapLocation:");
  }
  accessPoint = self->_accessPoint;
  v11 = v14[3];
  if (accessPoint)
  {
    if (v11)
      -[GEORPAccessPointCorrections mergeFrom:](accessPoint, "mergeFrom:");
  }
  else if (v11)
  {
    -[GEORPAddressCorrections setAccessPoint:](self, "setAccessPoint:");
  }
  originalAddressFields = self->_originalAddressFields;
  v13 = v14[7];
  if (originalAddressFields)
  {
    if (v13)
      -[GEORPFeedbackAddressFields mergeFrom:](originalAddressFields, "mergeFrom:");
  }
  else if (v13)
  {
    -[GEORPAddressCorrections setOriginalAddressFields:](self, "setOriginalAddressFields:");
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
      GEORPAddressCorrectionsReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_140);
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
    -[GEORPAddressCorrections readAll:](self, "readAll:", 0);
    -[GEORPAccessPointCorrections clearUnknownFields:](self->_accessPoint, "clearUnknownFields:", 1);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalAddressFields, 0);
  objc_storeStrong((id *)&self->_mapLocation, 0);
  objc_storeStrong((id *)&self->_coordinate, 0);
  objc_storeStrong((id *)&self->_addressFields, 0);
  objc_storeStrong((id *)&self->_accessPoint, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
