@implementation GEOPDAutocompleteEntryBusiness

- (GEOPDAutocompleteEntryBusiness)init
{
  GEOPDAutocompleteEntryBusiness *v2;
  GEOPDAutocompleteEntryBusiness *v3;
  GEOPDAutocompleteEntryBusiness *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDAutocompleteEntryBusiness;
  v2 = -[GEOPDAutocompleteEntryBusiness init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDAutocompleteEntryBusiness)initWithData:(id)a3
{
  GEOPDAutocompleteEntryBusiness *v3;
  GEOPDAutocompleteEntryBusiness *v4;
  GEOPDAutocompleteEntryBusiness *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDAutocompleteEntryBusiness;
  v3 = -[GEOPDAutocompleteEntryBusiness initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (unint64_t)muid
{
  return self->_muid;
}

- (void)setMuid:(unint64_t)a3
{
  *(_BYTE *)&self->_flags |= 0x42u;
  self->_muid = a3;
}

- (void)setHasMuid:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 66;
  else
    v3 = 64;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasMuid
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (int)resultProviderId
{
  return self->_resultProviderId;
}

- (void)setResultProviderId:(int)a3
{
  *(_BYTE *)&self->_flags |= 0x44u;
  self->_resultProviderId = a3;
}

- (void)setHasResultProviderId:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 68;
  else
    v3 = 64;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasResultProviderId
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
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
        GEOPDAutocompleteEntryBusinessReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPlace_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasPlace
{
  -[GEOPDAutocompleteEntryBusiness _readPlace]((uint64_t)self);
  return self->_place != 0;
}

- (GEOPDPlace)place
{
  -[GEOPDAutocompleteEntryBusiness _readPlace]((uint64_t)self);
  return self->_place;
}

- (void)setPlace:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x60u;
  objc_storeStrong((id *)&self->_place, a3);
}

- (double)distance
{
  return self->_distance;
}

- (void)setDistance:(double)a3
{
  *(_BYTE *)&self->_flags |= 0x41u;
  self->_distance = a3;
}

- (void)setHasDistance:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3 | 0x40;
}

- (BOOL)hasDistance
{
  return *(_BYTE *)&self->_flags & 1;
}

- (void)_readMapsId
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
        GEOPDAutocompleteEntryBusinessReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMapsId_tags_426);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasMapsId
{
  -[GEOPDAutocompleteEntryBusiness _readMapsId]((uint64_t)self);
  return self->_mapsId != 0;
}

- (GEOPDMapsIdentifier)mapsId
{
  -[GEOPDAutocompleteEntryBusiness _readMapsId]((uint64_t)self);
  return self->_mapsId;
}

- (void)setMapsId:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x50u;
  objc_storeStrong((id *)&self->_mapsId, a3);
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
  v8.super_class = (Class)GEOPDAutocompleteEntryBusiness;
  -[GEOPDAutocompleteEntryBusiness description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDAutocompleteEntryBusiness dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDAutocompleteEntryBusiness _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  _QWORD v24[4];
  id v25;

  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_BYTE *)(a1 + 72);
  if ((v5 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 40));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("muid"));

    v5 = *(_BYTE *)(a1 + 72);
  }
  if ((v5 & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 68));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v8 = CFSTR("resultProviderId");
    else
      v8 = CFSTR("result_provider_id");
    objc_msgSend(v4, "setObject:forKey:", v7, v8);

  }
  objc_msgSend((id)a1, "place");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v9, "jsonRepresentation");
    else
      objc_msgSend(v9, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("place"));

  }
  if ((*(_BYTE *)(a1 + 72) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 24));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("distance"));

  }
  objc_msgSend((id)a1, "mapsId");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v13, "jsonRepresentation");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = CFSTR("mapsId");
    }
    else
    {
      objc_msgSend(v13, "dictionaryRepresentation");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = CFSTR("maps_id");
    }
    objc_msgSend(v4, "setObject:forKey:", v15, v16);

  }
  v17 = *(void **)(a1 + 16);
  if (v17)
  {
    objc_msgSend(v17, "dictionaryRepresentation");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v18, "count"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __60__GEOPDAutocompleteEntryBusiness__dictionaryRepresentation___block_invoke;
      v24[3] = &unk_1E1C00600;
      v21 = v20;
      v25 = v21;
      objc_msgSend(v19, "enumerateKeysAndObjectsUsingBlock:", v24);
      v22 = v21;

      v19 = v22;
    }
    objc_msgSend(v4, "setObject:forKey:", v19, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDAutocompleteEntryBusiness _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __60__GEOPDAutocompleteEntryBusiness__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOPDAutocompleteEntryBusiness)initWithDictionary:(id)a3
{
  return (GEOPDAutocompleteEntryBusiness *)-[GEOPDAutocompleteEntryBusiness _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  GEOPDPlace *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  GEOPDMapsIdentifier *v16;
  uint64_t v17;
  void *v18;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("muid"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setMuid:", objc_msgSend(v6, "unsignedLongLongValue"));

      if (a3)
        v7 = CFSTR("resultProviderId");
      else
        v7 = CFSTR("result_provider_id");
      objc_msgSend(v5, "objectForKeyedSubscript:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setResultProviderId:", objc_msgSend(v8, "intValue"));

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("place"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v10 = [GEOPDPlace alloc];
        if ((a3 & 1) != 0)
          v11 = -[GEOPDPlace initWithJSON:](v10, "initWithJSON:", v9);
        else
          v11 = -[GEOPDPlace initWithDictionary:](v10, "initWithDictionary:", v9);
        v12 = (void *)v11;
        objc_msgSend(a1, "setPlace:", v11);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("distance"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v13, "doubleValue");
        objc_msgSend(a1, "setDistance:");
      }

      if (a3)
        v14 = CFSTR("mapsId");
      else
        v14 = CFSTR("maps_id");
      objc_msgSend(v5, "objectForKeyedSubscript:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v16 = [GEOPDMapsIdentifier alloc];
        if ((a3 & 1) != 0)
          v17 = -[GEOPDMapsIdentifier initWithJSON:](v16, "initWithJSON:", v15);
        else
          v17 = -[GEOPDMapsIdentifier initWithDictionary:](v16, "initWithDictionary:", v15);
        v18 = (void *)v17;
        objc_msgSend(a1, "setMapsId:", v17);

      }
    }
  }

  return a1;
}

- (GEOPDAutocompleteEntryBusiness)initWithJSON:(id)a3
{
  return (GEOPDAutocompleteEntryBusiness *)-[GEOPDAutocompleteEntryBusiness _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_436;
    else
      v8 = (int *)&readAll__nonRecursiveTag_437;
    GEOPDAutocompleteEntryBusinessReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
  {
    -[GEOPDPlace readAll:](self->_place, "readAll:", 1);
    -[GEOPDMapsIdentifier readAll:](self->_mapsId, "readAll:", 1);
  }
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPDAutocompleteEntryBusinessIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDAutocompleteEntryBusinessReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  char flags;
  id v6;
  PBDataReader *v7;
  void *v8;
  id v9;

  v9 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPDAutocompleteEntryBusinessIsDirty((uint64_t)self) & 1) == 0)
  {
    v7 = self->_reader;
    objc_sync_enter(v7);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "writeData:", v8);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v7);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDAutocompleteEntryBusiness readAll:](self, "readAll:", 0);
    flags = (char)self->_flags;
    if ((flags & 2) != 0)
    {
      PBDataWriterWriteUint64Field();
      flags = (char)self->_flags;
    }
    v6 = v9;
    if ((flags & 4) != 0)
    {
      PBDataWriterWriteInt32Field();
      v6 = v9;
    }
    if (self->_place)
    {
      PBDataWriterWriteSubmessage();
      v6 = v9;
    }
    if ((*(_BYTE *)&self->_flags & 1) != 0)
    {
      PBDataWriterWriteDoubleField();
      v6 = v9;
    }
    if (self->_mapsId)
    {
      PBDataWriterWriteSubmessage();
      v6 = v9;
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v6);
  }

}

- (void)clearSensitiveFields:(unint64_t)a3
{
  GEOPDAutocompleteEntryBusinessClearSensitiveFields(self, a3, 1);
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[GEOPDAutocompleteEntryBusiness _readMapsId]((uint64_t)self);
  if (-[GEOPDMapsIdentifier hasGreenTeaWithValue:](self->_mapsId, "hasGreenTeaWithValue:", v3))
    return 1;
  -[GEOPDAutocompleteEntryBusiness _readPlace]((uint64_t)self);
  return -[GEOPDPlace hasGreenTeaWithValue:](self->_place, "hasGreenTeaWithValue:", v3);
}

- (void)copyTo:(id)a3
{
  id *v4;
  char flags;
  id *v6;

  v6 = (id *)a3;
  -[GEOPDAutocompleteEntryBusiness readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v6 + 1, self->_reader);
  *((_DWORD *)v6 + 14) = self->_readerMarkPos;
  *((_DWORD *)v6 + 15) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  v4 = v6;
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    v6[5] = (id)self->_muid;
    *((_BYTE *)v6 + 72) |= 2u;
    flags = (char)self->_flags;
  }
  if ((flags & 4) != 0)
  {
    *((_DWORD *)v6 + 17) = self->_resultProviderId;
    *((_BYTE *)v6 + 72) |= 4u;
  }
  if (self->_place)
  {
    objc_msgSend(v6, "setPlace:");
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    v4[3] = *(id *)&self->_distance;
    *((_BYTE *)v4 + 72) |= 1u;
  }
  if (self->_mapsId)
  {
    objc_msgSend(v6, "setMapsId:");
    v4 = v6;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  char flags;
  id v10;
  void *v11;
  id v12;
  void *v13;
  PBUnknownFields *v14;

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
      GEOPDAutocompleteEntryBusinessReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_12;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDAutocompleteEntryBusiness readAll:](self, "readAll:", 0);
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *(_QWORD *)(v5 + 40) = self->_muid;
    *(_BYTE *)(v5 + 72) |= 2u;
    flags = (char)self->_flags;
  }
  if ((flags & 4) != 0)
  {
    *(_DWORD *)(v5 + 68) = self->_resultProviderId;
    *(_BYTE *)(v5 + 72) |= 4u;
  }
  v10 = -[GEOPDPlace copyWithZone:](self->_place, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v10;

  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(double *)(v5 + 24) = self->_distance;
    *(_BYTE *)(v5 + 72) |= 1u;
  }
  v12 = -[GEOPDMapsIdentifier copyWithZone:](self->_mapsId, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v12;

  v14 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v14;
LABEL_12:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char flags;
  char v6;
  GEOPDPlace *place;
  GEOPDMapsIdentifier *mapsId;
  char v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_22;
  -[GEOPDAutocompleteEntryBusiness readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  flags = (char)self->_flags;
  v6 = *((_BYTE *)v4 + 72);
  if ((flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 72) & 2) == 0 || self->_muid != *((_QWORD *)v4 + 5))
      goto LABEL_22;
  }
  else if ((*((_BYTE *)v4 + 72) & 2) != 0)
  {
    goto LABEL_22;
  }
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 72) & 4) == 0 || self->_resultProviderId != *((_DWORD *)v4 + 17))
      goto LABEL_22;
  }
  else if ((*((_BYTE *)v4 + 72) & 4) != 0)
  {
    goto LABEL_22;
  }
  place = self->_place;
  if ((unint64_t)place | *((_QWORD *)v4 + 6))
  {
    if (!-[GEOPDPlace isEqual:](place, "isEqual:"))
    {
LABEL_22:
      v9 = 0;
      goto LABEL_23;
    }
    flags = (char)self->_flags;
    v6 = *((_BYTE *)v4 + 72);
  }
  if ((flags & 1) != 0)
  {
    if ((v6 & 1) == 0 || self->_distance != *((double *)v4 + 3))
      goto LABEL_22;
  }
  else if ((v6 & 1) != 0)
  {
    goto LABEL_22;
  }
  mapsId = self->_mapsId;
  if ((unint64_t)mapsId | *((_QWORD *)v4 + 4))
    v9 = -[GEOPDMapsIdentifier isEqual:](mapsId, "isEqual:");
  else
    v9 = 1;
LABEL_23:

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  double distance;
  double v8;
  long double v9;
  double v10;

  -[GEOPDAutocompleteEntryBusiness readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    v3 = 2654435761u * self->_muid;
    if ((*(_BYTE *)&self->_flags & 4) != 0)
      goto LABEL_3;
  }
  else
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_flags & 4) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_resultProviderId;
      goto LABEL_6;
    }
  }
  v4 = 0;
LABEL_6:
  v5 = -[GEOPDPlace hash](self->_place, "hash");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    distance = self->_distance;
    v8 = -distance;
    if (distance >= 0.0)
      v8 = self->_distance;
    v9 = floor(v8 + 0.5);
    v10 = (v8 - v9) * 1.84467441e19;
    v6 = 2654435761u * (unint64_t)fmod(v9, 1.84467441e19);
    if (v10 >= 0.0)
    {
      if (v10 > 0.0)
        v6 += (unint64_t)v10;
    }
    else
    {
      v6 -= (unint64_t)fabs(v10);
    }
  }
  else
  {
    v6 = 0;
  }
  return v4 ^ v3 ^ v6 ^ v5 ^ -[GEOPDMapsIdentifier hash](self->_mapsId, "hash");
}

- (void)mergeFrom:(id)a3
{
  double *v4;
  char v5;
  GEOPDPlace *place;
  uint64_t v7;
  GEOPDMapsIdentifier *mapsId;
  uint64_t v9;
  id v10;

  v10 = a3;
  objc_msgSend(v10, "readAll:", 0);
  v4 = (double *)v10;
  v5 = *((_BYTE *)v10 + 72);
  if ((v5 & 2) != 0)
  {
    self->_muid = *((_QWORD *)v10 + 5);
    *(_BYTE *)&self->_flags |= 2u;
    v5 = *((_BYTE *)v10 + 72);
  }
  if ((v5 & 4) != 0)
  {
    self->_resultProviderId = *((_DWORD *)v10 + 17);
    *(_BYTE *)&self->_flags |= 4u;
  }
  place = self->_place;
  v7 = *((_QWORD *)v10 + 6);
  if (place)
  {
    if (!v7)
      goto LABEL_11;
    -[GEOPDPlace mergeFrom:](place, "mergeFrom:");
  }
  else
  {
    if (!v7)
      goto LABEL_11;
    -[GEOPDAutocompleteEntryBusiness setPlace:](self, "setPlace:");
  }
  v4 = (double *)v10;
LABEL_11:
  if (((_BYTE)v4[9] & 1) != 0)
  {
    self->_distance = v4[3];
    *(_BYTE *)&self->_flags |= 1u;
  }
  mapsId = self->_mapsId;
  v9 = *((_QWORD *)v4 + 4);
  if (mapsId)
  {
    if (v9)
    {
      -[GEOPDMapsIdentifier mergeFrom:](mapsId, "mergeFrom:");
LABEL_18:
      v4 = (double *)v10;
    }
  }
  else if (v9)
  {
    -[GEOPDAutocompleteEntryBusiness setMapsId:](self, "setMapsId:");
    goto LABEL_18;
  }

}

- (PBUnknownFields)unknownFields
{
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v5;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_BYTE *)&self->_flags & 8) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      v5 = reader;
      objc_sync_enter(v5);
      GEOPDAutocompleteEntryBusinessReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_440);
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
  *(_BYTE *)&self->_flags |= 0x48u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEOPDAutocompleteEntryBusiness readAll:](self, "readAll:", 0);
    -[GEOPDPlace clearUnknownFields:](self->_place, "clearUnknownFields:", 1);
    -[GEOPDMapsIdentifier clearUnknownFields:](self->_mapsId, "clearUnknownFields:", 1);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_place, 0);
  objc_storeStrong((id *)&self->_mapsId, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
