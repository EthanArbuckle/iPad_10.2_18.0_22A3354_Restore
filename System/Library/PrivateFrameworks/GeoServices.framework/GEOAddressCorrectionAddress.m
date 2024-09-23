@implementation GEOAddressCorrectionAddress

- (GEOAddressCorrectionAddress)init
{
  GEOAddressCorrectionAddress *v2;
  GEOAddressCorrectionAddress *v3;
  GEOAddressCorrectionAddress *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOAddressCorrectionAddress;
  v2 = -[GEOAddressCorrectionAddress init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOAddressCorrectionAddress)initWithData:(id)a3
{
  GEOAddressCorrectionAddress *v3;
  GEOAddressCorrectionAddress *v4;
  GEOAddressCorrectionAddress *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOAddressCorrectionAddress;
  v3 = -[GEOAddressCorrectionAddress initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readAddressLocation
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
        GEOAddressCorrectionAddressReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAddressLocation_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasAddressLocation
{
  -[GEOAddressCorrectionAddress _readAddressLocation]((uint64_t)self);
  return self->_addressLocation != 0;
}

- (GEOLocation)addressLocation
{
  -[GEOAddressCorrectionAddress _readAddressLocation]((uint64_t)self);
  return self->_addressLocation;
}

- (void)setAddressLocation:(id)a3
{
  *(_BYTE *)&self->_flags |= 0xCu;
  objc_storeStrong((id *)&self->_addressLocation, a3);
}

- (void)_readAddressID
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
        GEOAddressCorrectionAddressReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAddressID_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasAddressID
{
  -[GEOAddressCorrectionAddress _readAddressID]((uint64_t)self);
  return self->_addressID != 0;
}

- (NSString)addressID
{
  -[GEOAddressCorrectionAddress _readAddressID]((uint64_t)self);
  return self->_addressID;
}

- (void)setAddressID:(id)a3
{
  *(_BYTE *)&self->_flags |= 0xAu;
  objc_storeStrong((id *)&self->_addressID, a3);
}

- (double)radiusInMeters
{
  return self->_radiusInMeters;
}

- (void)setRadiusInMeters:(double)a3
{
  *(_BYTE *)&self->_flags |= 9u;
  self->_radiusInMeters = a3;
}

- (void)setHasRadiusInMeters:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3 | 8;
}

- (BOOL)hasRadiusInMeters
{
  return *(_BYTE *)&self->_flags & 1;
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
  v8.super_class = (Class)GEOAddressCorrectionAddress;
  -[GEOAddressCorrectionAddress description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOAddressCorrectionAddress dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOAddressCorrectionAddress _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  if (a1)
  {
    objc_msgSend((id)a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)a1, "addressLocation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      if ((a2 & 1) != 0)
        objc_msgSend(v5, "jsonRepresentation");
      else
        objc_msgSend(v5, "dictionaryRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("addressLocation"));

    }
    objc_msgSend((id)a1, "addressID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("addressID"));

    if ((*(_BYTE *)(a1 + 52) & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 32));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("radiusInMeters"));

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
  return -[GEOAddressCorrectionAddress _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOAddressCorrectionAddress)initWithDictionary:(id)a3
{
  return (GEOAddressCorrectionAddress *)-[GEOAddressCorrectionAddress _initWithDictionary:isJSON:](self, a3, 0);
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

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("addressLocation"));
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
        objc_msgSend(a1, "setAddressLocation:", v8);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("addressID"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = (void *)objc_msgSend(v10, "copy");
        objc_msgSend(a1, "setAddressID:", v11);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("radiusInMeters"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v12, "doubleValue");
        objc_msgSend(a1, "setRadiusInMeters:");
      }

    }
  }

  return a1;
}

- (GEOAddressCorrectionAddress)initWithJSON:(id)a3
{
  return (GEOAddressCorrectionAddress *)-[GEOAddressCorrectionAddress _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_19;
    else
      v8 = (int *)&readAll__nonRecursiveTag_19;
    GEOAddressCorrectionAddressReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    -[GEOLocation readAll:](self->_addressLocation, "readAll:", 1);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOAddressCorrectionAddressIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOAddressCorrectionAddressReadAllFrom((uint64_t)self, a3, 0);
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
  if (self->_reader && (_GEOAddressCorrectionAddressIsDirty((uint64_t)self) & 1) == 0)
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
    -[GEOAddressCorrectionAddress readAll:](self, "readAll:", 0);
    if (self->_addressLocation)
      PBDataWriterWriteSubmessage();
    if (self->_addressID)
      PBDataWriterWriteStringField();
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      PBDataWriterWriteDoubleField();
  }

}

- (void)clearSensitiveFields:(unint64_t)a3
{
  GEOAddressCorrectionAddressClearSensitiveFields(self, a3, 1);
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[GEOAddressCorrectionAddress _readAddressLocation]((uint64_t)self);
  return -[GEOLocation hasGreenTeaWithValue:](self->_addressLocation, "hasGreenTeaWithValue:", v3);
}

- (void)copyTo:(id)a3
{
  id *v4;

  v4 = (id *)a3;
  -[GEOAddressCorrectionAddress readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v4 + 1, self->_reader);
  *((_DWORD *)v4 + 10) = self->_readerMarkPos;
  *((_DWORD *)v4 + 11) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_addressLocation)
    objc_msgSend(v4, "setAddressLocation:");
  if (self->_addressID)
    objc_msgSend(v4, "setAddressID:");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    v4[4] = *(id *)&self->_radiusInMeters;
    *((_BYTE *)v4 + 52) |= 1u;
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
  uint64_t v11;
  void *v12;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_BYTE *)&self->_flags & 8) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOAddressCorrectionAddressReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOAddressCorrectionAddress readAll:](self, "readAll:", 0);
  v9 = -[GEOLocation copyWithZone:](self->_addressLocation, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v9;

  v11 = -[NSString copyWithZone:](self->_addressID, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v11;

  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(double *)(v5 + 32) = self->_radiusInMeters;
    *(_BYTE *)(v5 + 52) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  GEOLocation *addressLocation;
  NSString *addressID;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_10;
  -[GEOAddressCorrectionAddress readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  addressLocation = self->_addressLocation;
  if ((unint64_t)addressLocation | *((_QWORD *)v4 + 3))
  {
    if (!-[GEOLocation isEqual:](addressLocation, "isEqual:"))
      goto LABEL_10;
  }
  addressID = self->_addressID;
  if ((unint64_t)addressID | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](addressID, "isEqual:"))
      goto LABEL_10;
  }
  v7 = (*((_BYTE *)v4 + 52) & 1) == 0;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 1) != 0 && self->_radiusInMeters == *((double *)v4 + 4))
    {
      v7 = 1;
      goto LABEL_11;
    }
LABEL_10:
    v7 = 0;
  }
LABEL_11:

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  unint64_t v5;
  double radiusInMeters;
  double v7;
  long double v8;
  double v9;

  -[GEOAddressCorrectionAddress readAll:](self, "readAll:", 1);
  v3 = -[GEOLocation hash](self->_addressLocation, "hash");
  v4 = -[NSString hash](self->_addressID, "hash");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    radiusInMeters = self->_radiusInMeters;
    v7 = -radiusInMeters;
    if (radiusInMeters >= 0.0)
      v7 = self->_radiusInMeters;
    v8 = floor(v7 + 0.5);
    v9 = (v7 - v8) * 1.84467441e19;
    v5 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0)
        v5 += (unint64_t)v9;
    }
    else
    {
      v5 -= (unint64_t)fabs(v9);
    }
  }
  else
  {
    v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  GEOLocation *addressLocation;
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;

  v7 = a3;
  objc_msgSend(v7, "readAll:", 0);
  addressLocation = self->_addressLocation;
  v5 = v7[3];
  if (addressLocation)
  {
    if (v5)
      -[GEOLocation mergeFrom:](addressLocation, "mergeFrom:");
  }
  else if (v5)
  {
    -[GEOAddressCorrectionAddress setAddressLocation:](self, "setAddressLocation:");
  }
  v6 = v7;
  if (v7[2])
  {
    -[GEOAddressCorrectionAddress setAddressID:](self, "setAddressID:");
    v6 = v7;
  }
  if ((*((_BYTE *)v6 + 52) & 1) != 0)
  {
    self->_radiusInMeters = (double)v6[4];
    *(_BYTE *)&self->_flags |= 1u;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addressLocation, 0);
  objc_storeStrong((id *)&self->_addressID, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
