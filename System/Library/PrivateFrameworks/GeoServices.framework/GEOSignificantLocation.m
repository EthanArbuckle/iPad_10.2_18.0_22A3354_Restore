@implementation GEOSignificantLocation

- (GEOSignificantLocation)init
{
  GEOSignificantLocation *v2;
  GEOSignificantLocation *v3;
  GEOSignificantLocation *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOSignificantLocation;
  v2 = -[GEOSignificantLocation init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOSignificantLocation)initWithData:(id)a3
{
  GEOSignificantLocation *v3;
  GEOSignificantLocation *v4;
  GEOSignificantLocation *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOSignificantLocation;
  v3 = -[GEOSignificantLocation initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readLocation
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_BYTE *)(a1 + 68) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOSignificantLocationReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLocation_tags_3);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasLocation
{
  -[GEOSignificantLocation _readLocation]((uint64_t)self);
  return self->_location != 0;
}

- (GEOLocation)location
{
  -[GEOSignificantLocation _readLocation]((uint64_t)self);
  return self->_location;
}

- (void)setLocation:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x60u;
  objc_storeStrong((id *)&self->_location, a3);
}

- (unsigned)locationIndex
{
  return self->_locationIndex;
}

- (void)setLocationIndex:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 0x42u;
  self->_locationIndex = a3;
}

- (void)setHasLocationIndex:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 66;
  else
    v3 = 64;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasLocationIndex
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (unsigned)numberOfVisitsBucket
{
  return self->_numberOfVisitsBucket;
}

- (void)setNumberOfVisitsBucket:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 0x44u;
  self->_numberOfVisitsBucket = a3;
}

- (void)setHasNumberOfVisitsBucket:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 68;
  else
    v3 = 64;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasNumberOfVisitsBucket
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (void)_readIdentifier
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_BYTE *)(a1 + 68) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOSignificantLocationReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readIdentifier_tags_2);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasIdentifier
{
  -[GEOSignificantLocation _readIdentifier]((uint64_t)self);
  return self->_identifier != 0;
}

- (NSString)identifier
{
  -[GEOSignificantLocation _readIdentifier]((uint64_t)self);
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x50u;
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (double)confidence
{
  return self->_confidence;
}

- (void)setConfidence:(double)a3
{
  *(_BYTE *)&self->_flags |= 0x41u;
  self->_confidence = a3;
}

- (void)setHasConfidence:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3 | 0x40;
}

- (BOOL)hasConfidence
{
  return *(_BYTE *)&self->_flags & 1;
}

- (void)_readAddress
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_BYTE *)(a1 + 68) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOSignificantLocationReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAddress_tags_260);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasAddress
{
  -[GEOSignificantLocation _readAddress]((uint64_t)self);
  return self->_address != 0;
}

- (GEOStructuredAddress)address
{
  -[GEOSignificantLocation _readAddress]((uint64_t)self);
  return self->_address;
}

- (void)setAddress:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x48u;
  objc_storeStrong((id *)&self->_address, a3);
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
  v8.super_class = (Class)GEOSignificantLocation;
  -[GEOSignificantLocation description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOSignificantLocation dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOSignificantLocation _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  if (a1)
  {
    objc_msgSend((id)a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)a1, "location");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      if ((a2 & 1) != 0)
        objc_msgSend(v5, "jsonRepresentation");
      else
        objc_msgSend(v5, "dictionaryRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("location"));

    }
    v8 = *(_BYTE *)(a1 + 68);
    if ((v8 & 2) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 60));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("locationIndex"));

      v8 = *(_BYTE *)(a1 + 68);
    }
    if ((v8 & 4) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 64));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("numberOfVisitsBucket"));

    }
    objc_msgSend((id)a1, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
      objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("identifier"));

    if ((*(_BYTE *)(a1 + 68) & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 24));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("confidence"));

    }
    objc_msgSend((id)a1, "address");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      if ((a2 & 1) != 0)
        objc_msgSend(v13, "jsonRepresentation");
      else
        objc_msgSend(v13, "dictionaryRepresentation");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("address"));

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
  return -[GEOSignificantLocation _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOSignificantLocation)initWithDictionary:(id)a3
{
  return (GEOSignificantLocation *)-[GEOSignificantLocation _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(char)a3 isJSON:
{
  id v5;
  void *v6;
  GEOLocation *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  GEOStructuredAddress *v16;
  uint64_t v17;
  void *v18;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("location"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = [GEOLocation alloc];
        if ((a3 & 1) != 0)
          v8 = -[GEOLocation initWithJSON:](v7, "initWithJSON:", v6);
        else
          v8 = -[GEOLocation initWithDictionary:](v7, "initWithDictionary:", v6);
        v9 = (void *)v8;
        objc_msgSend(a1, "setLocation:", v8);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("locationIndex"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setLocationIndex:", objc_msgSend(v10, "unsignedIntValue"));

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("numberOfVisitsBucket"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setNumberOfVisitsBucket:", objc_msgSend(v11, "unsignedIntValue"));

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("identifier"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v13 = (void *)objc_msgSend(v12, "copy");
        objc_msgSend(a1, "setIdentifier:", v13);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("confidence"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v14, "doubleValue");
        objc_msgSend(a1, "setConfidence:");
      }

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("address"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v16 = [GEOStructuredAddress alloc];
        if ((a3 & 1) != 0)
          v17 = -[GEOStructuredAddress initWithJSON:](v16, "initWithJSON:", v15);
        else
          v17 = -[GEOStructuredAddress initWithDictionary:](v16, "initWithDictionary:", v15);
        v18 = (void *)v17;
        objc_msgSend(a1, "setAddress:", v17);

      }
    }
  }

  return a1;
}

- (GEOSignificantLocation)initWithJSON:(id)a3
{
  return (GEOSignificantLocation *)-[GEOSignificantLocation _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_272_0;
    else
      v8 = (int *)&readAll__nonRecursiveTag_273_0;
    GEOSignificantLocationReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    -[GEOLocation readAll:](self->_location, "readAll:", 1);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOSignificantLocationIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOSignificantLocationReadAllFrom((uint64_t)self, a3, 0);
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
  if (self->_reader && (_GEOSignificantLocationIsDirty((uint64_t)self) & 1) == 0)
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
    -[GEOSignificantLocation readAll:](self, "readAll:", 0);
    if (self->_location)
      PBDataWriterWriteSubmessage();
    flags = (char)self->_flags;
    if ((flags & 2) != 0)
    {
      PBDataWriterWriteUint32Field();
      flags = (char)self->_flags;
    }
    if ((flags & 4) != 0)
      PBDataWriterWriteUint32Field();
    if (self->_identifier)
      PBDataWriterWriteStringField();
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      PBDataWriterWriteDoubleField();
    if (self->_address)
      PBDataWriterWriteSubmessage();
  }

}

- (void)clearSensitiveFields:(unint64_t)a3
{
  GEOSignificantLocationClearSensitiveFields(self, a3, 1);
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[GEOSignificantLocation _readLocation]((uint64_t)self);
  return -[GEOLocation hasGreenTeaWithValue:](self->_location, "hasGreenTeaWithValue:", v3);
}

- (void)copyTo:(id)a3
{
  char flags;
  id *v5;
  id *v6;

  v6 = (id *)a3;
  -[GEOSignificantLocation readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v6 + 1, self->_reader);
  *((_DWORD *)v6 + 12) = self->_readerMarkPos;
  *((_DWORD *)v6 + 13) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_location)
    objc_msgSend(v6, "setLocation:");
  flags = (char)self->_flags;
  v5 = v6;
  if ((flags & 2) != 0)
  {
    *((_DWORD *)v6 + 15) = self->_locationIndex;
    *((_BYTE *)v6 + 68) |= 2u;
    flags = (char)self->_flags;
  }
  if ((flags & 4) != 0)
  {
    *((_DWORD *)v6 + 16) = self->_numberOfVisitsBucket;
    *((_BYTE *)v6 + 68) |= 4u;
  }
  if (self->_identifier)
  {
    objc_msgSend(v6, "setIdentifier:");
    v5 = v6;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    v5[3] = *(id *)&self->_confidence;
    *((_BYTE *)v5 + 68) |= 1u;
  }
  if (self->_address)
  {
    objc_msgSend(v6, "setAddress:");
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
  char flags;
  uint64_t v12;
  void *v13;
  id v14;

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
      GEOSignificantLocationReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_12;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOSignificantLocation readAll:](self, "readAll:", 0);
  v9 = -[GEOLocation copyWithZone:](self->_location, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v9;

  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 60) = self->_locationIndex;
    *(_BYTE *)(v5 + 68) |= 2u;
    flags = (char)self->_flags;
  }
  if ((flags & 4) != 0)
  {
    *(_DWORD *)(v5 + 64) = self->_numberOfVisitsBucket;
    *(_BYTE *)(v5 + 68) |= 4u;
  }
  v12 = -[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v12;

  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(double *)(v5 + 24) = self->_confidence;
    *(_BYTE *)(v5 + 68) |= 1u;
  }
  v14 = -[GEOStructuredAddress copyWithZone:](self->_address, "copyWithZone:", a3);
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v14;
LABEL_12:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  GEOLocation *location;
  char flags;
  char v7;
  NSString *identifier;
  GEOStructuredAddress *address;
  char v10;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_24;
  -[GEOSignificantLocation readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  location = self->_location;
  if ((unint64_t)location | *((_QWORD *)v4 + 5))
  {
    if (!-[GEOLocation isEqual:](location, "isEqual:"))
      goto LABEL_24;
  }
  flags = (char)self->_flags;
  v7 = *((_BYTE *)v4 + 68);
  if ((flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 68) & 2) == 0 || self->_locationIndex != *((_DWORD *)v4 + 15))
      goto LABEL_24;
  }
  else if ((*((_BYTE *)v4 + 68) & 2) != 0)
  {
    goto LABEL_24;
  }
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 68) & 4) == 0 || self->_numberOfVisitsBucket != *((_DWORD *)v4 + 16))
      goto LABEL_24;
  }
  else if ((*((_BYTE *)v4 + 68) & 4) != 0)
  {
    goto LABEL_24;
  }
  identifier = self->_identifier;
  if ((unint64_t)identifier | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](identifier, "isEqual:"))
    {
LABEL_24:
      v10 = 0;
      goto LABEL_25;
    }
    flags = (char)self->_flags;
    v7 = *((_BYTE *)v4 + 68);
  }
  if ((flags & 1) != 0)
  {
    if ((v7 & 1) == 0 || self->_confidence != *((double *)v4 + 3))
      goto LABEL_24;
  }
  else if ((v7 & 1) != 0)
  {
    goto LABEL_24;
  }
  address = self->_address;
  if ((unint64_t)address | *((_QWORD *)v4 + 2))
    v10 = -[GEOStructuredAddress isEqual:](address, "isEqual:");
  else
    v10 = 1;
LABEL_25:

  return v10;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSUInteger v6;
  unint64_t v7;
  double confidence;
  double v9;
  long double v10;
  double v11;

  -[GEOSignificantLocation readAll:](self, "readAll:", 1);
  v3 = -[GEOLocation hash](self->_location, "hash");
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    v4 = 2654435761 * self->_locationIndex;
    if ((*(_BYTE *)&self->_flags & 4) != 0)
      goto LABEL_3;
  }
  else
  {
    v4 = 0;
    if ((*(_BYTE *)&self->_flags & 4) != 0)
    {
LABEL_3:
      v5 = 2654435761 * self->_numberOfVisitsBucket;
      goto LABEL_6;
    }
  }
  v5 = 0;
LABEL_6:
  v6 = -[NSString hash](self->_identifier, "hash");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    confidence = self->_confidence;
    v9 = -confidence;
    if (confidence >= 0.0)
      v9 = self->_confidence;
    v10 = floor(v9 + 0.5);
    v11 = (v9 - v10) * 1.84467441e19;
    v7 = 2654435761u * (unint64_t)fmod(v10, 1.84467441e19);
    if (v11 >= 0.0)
    {
      if (v11 > 0.0)
        v7 += (unint64_t)v11;
    }
    else
    {
      v7 -= (unint64_t)fabs(v11);
    }
  }
  else
  {
    v7 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ -[GEOStructuredAddress hash](self->_address, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  GEOLocation *location;
  uint64_t v6;
  char v7;
  GEOStructuredAddress *address;
  uint64_t v9;
  _QWORD *v10;

  v10 = a3;
  objc_msgSend(v10, "readAll:", 0);
  v4 = v10;
  location = self->_location;
  v6 = v10[5];
  if (location)
  {
    if (!v6)
      goto LABEL_7;
    -[GEOLocation mergeFrom:](location, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[GEOSignificantLocation setLocation:](self, "setLocation:");
  }
  v4 = v10;
LABEL_7:
  v7 = *((_BYTE *)v4 + 68);
  if ((v7 & 2) != 0)
  {
    self->_locationIndex = *((_DWORD *)v4 + 15);
    *(_BYTE *)&self->_flags |= 2u;
    v7 = *((_BYTE *)v4 + 68);
  }
  if ((v7 & 4) != 0)
  {
    self->_numberOfVisitsBucket = *((_DWORD *)v4 + 16);
    *(_BYTE *)&self->_flags |= 4u;
  }
  if (v4[4])
  {
    -[GEOSignificantLocation setIdentifier:](self, "setIdentifier:");
    v4 = v10;
  }
  if ((*((_BYTE *)v4 + 68) & 1) != 0)
  {
    self->_confidence = (double)v4[3];
    *(_BYTE *)&self->_flags |= 1u;
  }
  address = self->_address;
  v9 = v4[2];
  if (address)
  {
    if (v9)
    {
      -[GEOStructuredAddress mergeFrom:](address, "mergeFrom:");
LABEL_20:
      v4 = v10;
    }
  }
  else if (v9)
  {
    -[GEOSignificantLocation setAddress:](self, "setAddress:");
    goto LABEL_20;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_address, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
