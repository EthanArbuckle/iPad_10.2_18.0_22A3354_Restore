@implementation GEOMapItemCorrectedLocationAttributes

- (GEOMapItemCorrectedLocationAttributes)init
{
  GEOMapItemCorrectedLocationAttributes *v2;
  GEOMapItemCorrectedLocationAttributes *v3;
  GEOMapItemCorrectedLocationAttributes *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOMapItemCorrectedLocationAttributes;
  v2 = -[GEOMapItemCorrectedLocationAttributes init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOMapItemCorrectedLocationAttributes)initWithData:(id)a3
{
  GEOMapItemCorrectedLocationAttributes *v3;
  GEOMapItemCorrectedLocationAttributes *v4;
  GEOMapItemCorrectedLocationAttributes *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOMapItemCorrectedLocationAttributes;
  v3 = -[GEOMapItemCorrectedLocationAttributes initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readCorrectedCoordinate
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_BYTE *)(a1 + 80) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOMapItemCorrectedLocationAttributesReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCorrectedCoordinate_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasCorrectedCoordinate
{
  -[GEOMapItemCorrectedLocationAttributes _readCorrectedCoordinate]((uint64_t)self);
  return self->_correctedCoordinate != 0;
}

- (GEOLatLng)correctedCoordinate
{
  -[GEOMapItemCorrectedLocationAttributes _readCorrectedCoordinate]((uint64_t)self);
  return self->_correctedCoordinate;
}

- (void)setCorrectedCoordinate:(id)a3
{
  *(_BYTE *)&self->_flags |= 0xA0u;
  objc_storeStrong((id *)&self->_correctedCoordinate, a3);
}

- (void)_readCorrectedAddress
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_BYTE *)(a1 + 80) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOMapItemCorrectedLocationAttributesReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCorrectedAddress_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasCorrectedAddress
{
  -[GEOMapItemCorrectedLocationAttributes _readCorrectedAddress]((uint64_t)self);
  return self->_correctedAddress != 0;
}

- (GEOAddress)correctedAddress
{
  -[GEOMapItemCorrectedLocationAttributes _readCorrectedAddress]((uint64_t)self);
  return self->_correctedAddress;
}

- (void)setCorrectedAddress:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x90u;
  objc_storeStrong((id *)&self->_correctedAddress, a3);
}

- (void)_readCorrectedAddressSecondaryStreetLine
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_BYTE *)(a1 + 80) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOMapItemCorrectedLocationAttributesReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCorrectedAddressSecondaryStreetLine_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasCorrectedAddressSecondaryStreetLine
{
  -[GEOMapItemCorrectedLocationAttributes _readCorrectedAddressSecondaryStreetLine]((uint64_t)self);
  return self->_correctedAddressSecondaryStreetLine != 0;
}

- (NSString)correctedAddressSecondaryStreetLine
{
  -[GEOMapItemCorrectedLocationAttributes _readCorrectedAddressSecondaryStreetLine]((uint64_t)self);
  return self->_correctedAddressSecondaryStreetLine;
}

- (void)setCorrectedAddressSecondaryStreetLine:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x88u;
  objc_storeStrong((id *)&self->_correctedAddressSecondaryStreetLine, a3);
}

- (void)_readCustomLabel
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_BYTE *)(a1 + 80) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOMapItemCorrectedLocationAttributesReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCustomLabel_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasCustomLabel
{
  -[GEOMapItemCorrectedLocationAttributes _readCustomLabel]((uint64_t)self);
  return self->_customLabel != 0;
}

- (NSString)customLabel
{
  -[GEOMapItemCorrectedLocationAttributes _readCustomLabel]((uint64_t)self);
  return self->_customLabel;
}

- (void)setCustomLabel:(id)a3
{
  *(_BYTE *)&self->_flags |= 0xC0u;
  objc_storeStrong((id *)&self->_customLabel, a3);
}

- (double)lastUpdateDate
{
  return self->_lastUpdateDate;
}

- (void)setLastUpdateDate:(double)a3
{
  *(_BYTE *)&self->_flags |= 0x81u;
  self->_lastUpdateDate = a3;
}

- (void)setHasLastUpdateDate:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0x7E | a3 | 0x80;
}

- (BOOL)hasLastUpdateDate
{
  return *(_BYTE *)&self->_flags & 1;
}

- (BOOL)hasSubmittedRAP
{
  return self->_hasSubmittedRAP;
}

- (void)setHasSubmittedRAP:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 0x82u;
  self->_hasSubmittedRAP = a3;
}

- (void)setHasHasSubmittedRAP:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = -126;
  else
    v3 = 0x80;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasHasSubmittedRAP
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
  v8.super_class = (Class)GEOMapItemCorrectedLocationAttributes;
  -[GEOMapItemCorrectedLocationAttributes description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOMapItemCorrectedLocationAttributes dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOMapItemCorrectedLocationAttributes _dictionaryRepresentation:]((uint64_t)self, 0);
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
  char v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  _QWORD v23[4];
  id v24;

  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)a1, "correctedCoordinate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v5, "jsonRepresentation");
    else
      objc_msgSend(v5, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("correctedCoordinate"));

  }
  objc_msgSend((id)a1, "correctedAddress");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v8, "jsonRepresentation");
    else
      objc_msgSend(v8, "dictionaryRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("correctedAddress"));

  }
  objc_msgSend((id)a1, "correctedAddressSecondaryStreetLine");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("correctedAddressSecondaryStreetLine"));

  objc_msgSend((id)a1, "customLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("customLabel"));

  v13 = *(_BYTE *)(a1 + 80);
  if ((v13 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 56));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("lastUpdateDate"));

    v13 = *(_BYTE *)(a1 + 80);
  }
  if ((v13 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 76));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("hasSubmittedRAP"));

  }
  v16 = *(void **)(a1 + 16);
  if (v16)
  {
    objc_msgSend(v16, "dictionaryRepresentation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v17, "count"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __67__GEOMapItemCorrectedLocationAttributes__dictionaryRepresentation___block_invoke;
      v23[3] = &unk_1E1C00600;
      v20 = v19;
      v24 = v20;
      objc_msgSend(v18, "enumerateKeysAndObjectsUsingBlock:", v23);
      v21 = v20;

      v18 = v21;
    }
    objc_msgSend(v4, "setObject:forKey:", v18, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOMapItemCorrectedLocationAttributes _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __67__GEOMapItemCorrectedLocationAttributes__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOMapItemCorrectedLocationAttributes)initWithDictionary:(id)a3
{
  return (GEOMapItemCorrectedLocationAttributes *)-[GEOMapItemCorrectedLocationAttributes _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(char)a3 isJSON:
{
  id v5;
  void *v6;
  GEOLatLng *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  GEOAddress *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("correctedCoordinate"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = [GEOLatLng alloc];
        if ((a3 & 1) != 0)
          v8 = -[GEOLatLng initWithJSON:](v7, "initWithJSON:", v6);
        else
          v8 = -[GEOLatLng initWithDictionary:](v7, "initWithDictionary:", v6);
        v9 = (void *)v8;
        objc_msgSend(a1, "setCorrectedCoordinate:", v8);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("correctedAddress"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = [GEOAddress alloc];
        if ((a3 & 1) != 0)
          v12 = -[GEOAddress initWithJSON:](v11, "initWithJSON:", v10);
        else
          v12 = -[GEOAddress initWithDictionary:](v11, "initWithDictionary:", v10);
        v13 = (void *)v12;
        objc_msgSend(a1, "setCorrectedAddress:", v12);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("correctedAddressSecondaryStreetLine"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v15 = (void *)objc_msgSend(v14, "copy");
        objc_msgSend(a1, "setCorrectedAddressSecondaryStreetLine:", v15);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("customLabel"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v17 = (void *)objc_msgSend(v16, "copy");
        objc_msgSend(a1, "setCustomLabel:", v17);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("lastUpdateDate"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v18, "doubleValue");
        objc_msgSend(a1, "setLastUpdateDate:");
      }

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("hasSubmittedRAP"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setHasSubmittedRAP:", objc_msgSend(v19, "BOOLValue"));

    }
  }

  return a1;
}

- (GEOMapItemCorrectedLocationAttributes)initWithJSON:(id)a3
{
  return (GEOMapItemCorrectedLocationAttributes *)-[GEOMapItemCorrectedLocationAttributes _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_795;
    else
      v8 = (int *)&readAll__nonRecursiveTag_796;
    GEOMapItemCorrectedLocationAttributesReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
  {
    -[GEOLatLng readAll:](self->_correctedCoordinate, "readAll:", 1);
    -[GEOAddress readAll:](self->_correctedAddress, "readAll:", 1);
  }
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOMapItemCorrectedLocationAttributesIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOMapItemCorrectedLocationAttributesReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  id v5;
  char flags;
  PBDataReader *v7;
  void *v8;
  id v9;

  v9 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOMapItemCorrectedLocationAttributesIsDirty((uint64_t)self) & 1) == 0)
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
    -[GEOMapItemCorrectedLocationAttributes readAll:](self, "readAll:", 0);
    if (self->_correctedCoordinate)
      PBDataWriterWriteSubmessage();
    v5 = v9;
    if (self->_correctedAddress)
    {
      PBDataWriterWriteSubmessage();
      v5 = v9;
    }
    if (self->_correctedAddressSecondaryStreetLine)
    {
      PBDataWriterWriteStringField();
      v5 = v9;
    }
    if (self->_customLabel)
    {
      PBDataWriterWriteStringField();
      v5 = v9;
    }
    flags = (char)self->_flags;
    if ((flags & 1) != 0)
    {
      PBDataWriterWriteDoubleField();
      v5 = v9;
      flags = (char)self->_flags;
    }
    if ((flags & 2) != 0)
    {
      PBDataWriterWriteBOOLField();
      v5 = v9;
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v5);
  }

}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[GEOMapItemCorrectedLocationAttributes _readCorrectedCoordinate]((uint64_t)self);
  return -[GEOLatLng hasGreenTeaWithValue:](self->_correctedCoordinate, "hasGreenTeaWithValue:", v3);
}

- (void)copyTo:(id)a3
{
  id *v4;
  char flags;
  id *v6;

  v6 = (id *)a3;
  -[GEOMapItemCorrectedLocationAttributes readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v6 + 1, self->_reader);
  *((_DWORD *)v6 + 16) = self->_readerMarkPos;
  *((_DWORD *)v6 + 17) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_correctedCoordinate)
    objc_msgSend(v6, "setCorrectedCoordinate:");
  if (self->_correctedAddress)
    objc_msgSend(v6, "setCorrectedAddress:");
  v4 = v6;
  if (self->_correctedAddressSecondaryStreetLine)
  {
    objc_msgSend(v6, "setCorrectedAddressSecondaryStreetLine:");
    v4 = v6;
  }
  if (self->_customLabel)
  {
    objc_msgSend(v6, "setCustomLabel:");
    v4 = v6;
  }
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    v4[7] = *(id *)&self->_lastUpdateDate;
    *((_BYTE *)v4 + 80) |= 1u;
    flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *((_BYTE *)v4 + 76) = self->_hasSubmittedRAP;
    *((_BYTE *)v4 + 80) |= 2u;
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
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  char flags;
  PBUnknownFields *v18;

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
      GEOMapItemCorrectedLocationAttributesReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_10;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOMapItemCorrectedLocationAttributes readAll:](self, "readAll:", 0);
  v9 = -[GEOLatLng copyWithZone:](self->_correctedCoordinate, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v9;

  v11 = -[GEOAddress copyWithZone:](self->_correctedAddress, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v11;

  v13 = -[NSString copyWithZone:](self->_correctedAddressSecondaryStreetLine, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v13;

  v15 = -[NSString copyWithZone:](self->_customLabel, "copyWithZone:", a3);
  v16 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v15;

  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    *(double *)(v5 + 56) = self->_lastUpdateDate;
    *(_BYTE *)(v5 + 80) |= 1u;
    flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *(_BYTE *)(v5 + 76) = self->_hasSubmittedRAP;
    *(_BYTE *)(v5 + 80) |= 2u;
  }
  v18 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v18;
LABEL_10:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  GEOLatLng *correctedCoordinate;
  GEOAddress *correctedAddress;
  NSString *correctedAddressSecondaryStreetLine;
  NSString *customLabel;
  BOOL v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_17;
  -[GEOMapItemCorrectedLocationAttributes readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  correctedCoordinate = self->_correctedCoordinate;
  if ((unint64_t)correctedCoordinate | *((_QWORD *)v4 + 5))
  {
    if (!-[GEOLatLng isEqual:](correctedCoordinate, "isEqual:"))
      goto LABEL_17;
  }
  correctedAddress = self->_correctedAddress;
  if ((unint64_t)correctedAddress | *((_QWORD *)v4 + 4))
  {
    if (!-[GEOAddress isEqual:](correctedAddress, "isEqual:"))
      goto LABEL_17;
  }
  correctedAddressSecondaryStreetLine = self->_correctedAddressSecondaryStreetLine;
  if ((unint64_t)correctedAddressSecondaryStreetLine | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](correctedAddressSecondaryStreetLine, "isEqual:"))
      goto LABEL_17;
  }
  customLabel = self->_customLabel;
  if ((unint64_t)customLabel | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](customLabel, "isEqual:"))
      goto LABEL_17;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 80) & 1) == 0 || self->_lastUpdateDate != *((double *)v4 + 7))
      goto LABEL_17;
  }
  else if ((*((_BYTE *)v4 + 80) & 1) != 0)
  {
    goto LABEL_17;
  }
  v9 = (*((_BYTE *)v4 + 80) & 2) == 0;
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 80) & 2) == 0)
    {
LABEL_17:
      v9 = 0;
      goto LABEL_18;
    }
    if (self->_hasSubmittedRAP)
    {
      if (!*((_BYTE *)v4 + 76))
        goto LABEL_17;
    }
    else if (*((_BYTE *)v4 + 76))
    {
      goto LABEL_17;
    }
    v9 = 1;
  }
LABEL_18:

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  NSUInteger v5;
  NSUInteger v6;
  char flags;
  unint64_t v8;
  double lastUpdateDate;
  double v10;
  long double v11;
  double v12;
  uint64_t v13;

  -[GEOMapItemCorrectedLocationAttributes readAll:](self, "readAll:", 1);
  v3 = -[GEOLatLng hash](self->_correctedCoordinate, "hash");
  v4 = -[GEOAddress hash](self->_correctedAddress, "hash");
  v5 = -[NSString hash](self->_correctedAddressSecondaryStreetLine, "hash");
  v6 = -[NSString hash](self->_customLabel, "hash");
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    lastUpdateDate = self->_lastUpdateDate;
    v10 = -lastUpdateDate;
    if (lastUpdateDate >= 0.0)
      v10 = self->_lastUpdateDate;
    v11 = floor(v10 + 0.5);
    v12 = (v10 - v11) * 1.84467441e19;
    v8 = 2654435761u * (unint64_t)fmod(v11, 1.84467441e19);
    if (v12 >= 0.0)
    {
      if (v12 > 0.0)
        v8 += (unint64_t)v12;
    }
    else
    {
      v8 -= (unint64_t)fabs(v12);
    }
  }
  else
  {
    v8 = 0;
  }
  if ((flags & 2) != 0)
    v13 = 2654435761 * self->_hasSubmittedRAP;
  else
    v13 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v8 ^ v13;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  GEOLatLng *correctedCoordinate;
  uint64_t v6;
  GEOAddress *correctedAddress;
  uint64_t v8;
  char v9;
  _QWORD *v10;

  v10 = a3;
  objc_msgSend(v10, "readAll:", 0);
  v4 = v10;
  correctedCoordinate = self->_correctedCoordinate;
  v6 = v10[5];
  if (correctedCoordinate)
  {
    if (!v6)
      goto LABEL_7;
    -[GEOLatLng mergeFrom:](correctedCoordinate, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[GEOMapItemCorrectedLocationAttributes setCorrectedCoordinate:](self, "setCorrectedCoordinate:");
  }
  v4 = v10;
LABEL_7:
  correctedAddress = self->_correctedAddress;
  v8 = v4[4];
  if (correctedAddress)
  {
    if (!v8)
      goto LABEL_13;
    -[GEOAddress mergeFrom:](correctedAddress, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_13;
    -[GEOMapItemCorrectedLocationAttributes setCorrectedAddress:](self, "setCorrectedAddress:");
  }
  v4 = v10;
LABEL_13:
  if (v4[3])
  {
    -[GEOMapItemCorrectedLocationAttributes setCorrectedAddressSecondaryStreetLine:](self, "setCorrectedAddressSecondaryStreetLine:");
    v4 = v10;
  }
  if (v4[6])
  {
    -[GEOMapItemCorrectedLocationAttributes setCustomLabel:](self, "setCustomLabel:");
    v4 = v10;
  }
  v9 = *((_BYTE *)v4 + 80);
  if ((v9 & 1) != 0)
  {
    self->_lastUpdateDate = (double)v4[7];
    *(_BYTE *)&self->_flags |= 1u;
    v9 = *((_BYTE *)v4 + 80);
  }
  if ((v9 & 2) != 0)
  {
    self->_hasSubmittedRAP = *((_BYTE *)v4 + 76);
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
      GEOMapItemCorrectedLocationAttributesReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_799);
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
  *(_BYTE *)&self->_flags |= 0x84u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEOMapItemCorrectedLocationAttributes readAll:](self, "readAll:", 0);
    -[GEOLatLng clearUnknownFields:](self->_correctedCoordinate, "clearUnknownFields:", 1);
    -[GEOAddress clearUnknownFields:](self->_correctedAddress, "clearUnknownFields:", 1);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customLabel, 0);
  objc_storeStrong((id *)&self->_correctedCoordinate, 0);
  objc_storeStrong((id *)&self->_correctedAddress, 0);
  objc_storeStrong((id *)&self->_correctedAddressSecondaryStreetLine, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
