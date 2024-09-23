@implementation GEORPPhotoWithMetadata

- (GEORPPhotoWithMetadata)init
{
  GEORPPhotoWithMetadata *v2;
  GEORPPhotoWithMetadata *v3;
  GEORPPhotoWithMetadata *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEORPPhotoWithMetadata;
  v2 = -[GEORPPhotoWithMetadata init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPPhotoWithMetadata)initWithData:(id)a3
{
  GEORPPhotoWithMetadata *v3;
  GEORPPhotoWithMetadata *v4;
  GEORPPhotoWithMetadata *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEORPPhotoWithMetadata;
  v3 = -[GEORPPhotoWithMetadata initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readImageData
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 68) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPPhotoWithMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readImageData_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasImageData
{
  -[GEORPPhotoWithMetadata _readImageData]((uint64_t)self);
  return self->_imageData != 0;
}

- (NSData)imageData
{
  -[GEORPPhotoWithMetadata _readImageData]((uint64_t)self);
  return self->_imageData;
}

- (void)setImageData:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x28u;
  objc_storeStrong((id *)&self->_imageData, a3);
}

- (double)creationDate
{
  return self->_creationDate;
}

- (void)setCreationDate:(double)a3
{
  *(_BYTE *)&self->_flags |= 0x21u;
  self->_creationDate = a3;
}

- (void)setHasCreationDate:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3 | 0x20;
}

- (BOOL)hasCreationDate
{
  return *(_BYTE *)&self->_flags & 1;
}

- (void)_readGeotagCoordinate
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 68) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPPhotoWithMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readGeotagCoordinate_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasGeotagCoordinate
{
  -[GEORPPhotoWithMetadata _readGeotagCoordinate]((uint64_t)self);
  return self->_geotagCoordinate != 0;
}

- (GEOLatLng)geotagCoordinate
{
  -[GEORPPhotoWithMetadata _readGeotagCoordinate]((uint64_t)self);
  return self->_geotagCoordinate;
}

- (void)setGeotagCoordinate:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x30u;
  objc_storeStrong((id *)&self->_geotagCoordinate, a3);
}

- (double)geotagHorizontalAccuracy
{
  return self->_geotagHorizontalAccuracy;
}

- (void)setGeotagHorizontalAccuracy:(double)a3
{
  *(_BYTE *)&self->_flags |= 0x22u;
  self->_geotagHorizontalAccuracy = a3;
}

- (void)setHasGeotagHorizontalAccuracy:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 34;
  else
    v3 = 32;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasGeotagHorizontalAccuracy
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (double)geotagTimestamp
{
  return self->_geotagTimestamp;
}

- (void)setGeotagTimestamp:(double)a3
{
  *(_BYTE *)&self->_flags |= 0x24u;
  self->_geotagTimestamp = a3;
}

- (void)setHasGeotagTimestamp:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 36;
  else
    v3 = 32;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasGeotagTimestamp
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
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
  v8.super_class = (Class)GEORPPhotoWithMetadata;
  -[GEORPPhotoWithMetadata description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORPPhotoWithMetadata dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPPhotoWithMetadata _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  char v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  const __CFString *v18;

  if (a1)
  {
    objc_msgSend((id)a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)a1, "imageData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v5, "base64EncodedStringWithOptions:", 0);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("data"));

      }
      else
      {
        objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("data"));
      }
    }

    if ((*(_BYTE *)(a1 + 68) & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 16));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
        v9 = CFSTR("creationDate");
      else
        v9 = CFSTR("creation_date");
      objc_msgSend(v4, "setObject:forKey:", v8, v9);

    }
    objc_msgSend((id)a1, "geotagCoordinate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v10, "jsonRepresentation");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = CFSTR("geotagCoordinate");
      }
      else
      {
        objc_msgSend(v10, "dictionaryRepresentation");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = CFSTR("geotag_coordinate");
      }
      objc_msgSend(v4, "setObject:forKey:", v12, v13);

    }
    v14 = *(_BYTE *)(a1 + 68);
    if ((v14 & 2) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 40));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
        v16 = CFSTR("geotagHorizontalAccuracy");
      else
        v16 = CFSTR("geotag_horizontal_accuracy");
      objc_msgSend(v4, "setObject:forKey:", v15, v16);

      v14 = *(_BYTE *)(a1 + 68);
    }
    if ((v14 & 4) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 48));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
        v18 = CFSTR("geotagTimestamp");
      else
        v18 = CFSTR("geotag_timestamp");
      objc_msgSend(v4, "setObject:forKey:", v17, v18);

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
  return -[GEORPPhotoWithMetadata _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEORPPhotoWithMetadata)initWithDictionary:(id)a3
{
  return (GEORPPhotoWithMetadata *)-[GEORPPhotoWithMetadata _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  GEOLatLng *v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  const __CFString *v17;
  void *v18;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("data"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v6, 0);
        objc_msgSend(a1, "setImageData:", v7);

      }
      if (a3)
        v8 = CFSTR("creationDate");
      else
        v8 = CFSTR("creation_date");
      objc_msgSend(v5, "objectForKeyedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v9, "doubleValue");
        objc_msgSend(a1, "setCreationDate:");
      }

      if (a3)
        v10 = CFSTR("geotagCoordinate");
      else
        v10 = CFSTR("geotag_coordinate");
      objc_msgSend(v5, "objectForKeyedSubscript:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v12 = [GEOLatLng alloc];
        if ((a3 & 1) != 0)
          v13 = -[GEOLatLng initWithJSON:](v12, "initWithJSON:", v11);
        else
          v13 = -[GEOLatLng initWithDictionary:](v12, "initWithDictionary:", v11);
        v14 = (void *)v13;
        objc_msgSend(a1, "setGeotagCoordinate:", v13);

      }
      if (a3)
        v15 = CFSTR("geotagHorizontalAccuracy");
      else
        v15 = CFSTR("geotag_horizontal_accuracy");
      objc_msgSend(v5, "objectForKeyedSubscript:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v16, "doubleValue");
        objc_msgSend(a1, "setGeotagHorizontalAccuracy:");
      }

      if (a3)
        v17 = CFSTR("geotagTimestamp");
      else
        v17 = CFSTR("geotag_timestamp");
      objc_msgSend(v5, "objectForKeyedSubscript:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v18, "doubleValue");
        objc_msgSend(a1, "setGeotagTimestamp:");
      }

    }
  }

  return a1;
}

- (GEORPPhotoWithMetadata)initWithJSON:(id)a3
{
  return (GEORPPhotoWithMetadata *)-[GEORPPhotoWithMetadata _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_1554;
    else
      v8 = (int *)&readAll__nonRecursiveTag_1555;
    GEORPPhotoWithMetadataReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    -[GEOLatLng readAll:](self->_geotagCoordinate, "readAll:", 1);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPPhotoWithMetadataIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPPhotoWithMetadataReadAllFrom((uint64_t)self, a3, 0);
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
    -[GEORPPhotoWithMetadata readAll:](self, "readAll:", 0);
    if (self->_imageData)
      PBDataWriterWriteDataField();
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      PBDataWriterWriteDoubleField();
    if (self->_geotagCoordinate)
      PBDataWriterWriteSubmessage();
    flags = (char)self->_flags;
    if ((flags & 2) != 0)
    {
      PBDataWriterWriteDoubleField();
      flags = (char)self->_flags;
    }
    if ((flags & 4) != 0)
      PBDataWriterWriteDoubleField();
  }

}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[GEORPPhotoWithMetadata _readGeotagCoordinate]((uint64_t)self);
  return -[GEOLatLng hasGreenTeaWithValue:](self->_geotagCoordinate, "hasGreenTeaWithValue:", v3);
}

- (void)copyTo:(id)a3
{
  id *v4;
  char flags;
  id *v6;

  v6 = (id *)a3;
  -[GEORPPhotoWithMetadata readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v6 + 1, self->_reader);
  *((_DWORD *)v6 + 14) = self->_readerMarkPos;
  *((_DWORD *)v6 + 15) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_imageData)
    objc_msgSend(v6, "setImageData:");
  v4 = v6;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    v6[2] = *(id *)&self->_creationDate;
    *((_BYTE *)v6 + 68) |= 1u;
  }
  if (self->_geotagCoordinate)
  {
    objc_msgSend(v6, "setGeotagCoordinate:");
    v4 = v6;
  }
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    v4[5] = *(id *)&self->_geotagHorizontalAccuracy;
    *((_BYTE *)v4 + 68) |= 2u;
    flags = (char)self->_flags;
  }
  if ((flags & 4) != 0)
  {
    v4[6] = *(id *)&self->_geotagTimestamp;
    *((_BYTE *)v4 + 68) |= 4u;
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
  id v11;
  void *v12;
  char flags;

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
      GEORPPhotoWithMetadataReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEORPPhotoWithMetadata readAll:](self, "readAll:", 0);
  v9 = -[NSData copyWithZone:](self->_imageData, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v9;

  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(double *)(v5 + 16) = self->_creationDate;
    *(_BYTE *)(v5 + 68) |= 1u;
  }
  v11 = -[GEOLatLng copyWithZone:](self->_geotagCoordinate, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v11;

  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *(double *)(v5 + 40) = self->_geotagHorizontalAccuracy;
    *(_BYTE *)(v5 + 68) |= 2u;
    flags = (char)self->_flags;
  }
  if ((flags & 4) != 0)
  {
    *(double *)(v5 + 48) = self->_geotagTimestamp;
    *(_BYTE *)(v5 + 68) |= 4u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSData *imageData;
  char flags;
  char v7;
  GEOLatLng *geotagCoordinate;
  BOOL v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_21;
  -[GEORPPhotoWithMetadata readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  imageData = self->_imageData;
  if ((unint64_t)imageData | *((_QWORD *)v4 + 3))
  {
    if (!-[NSData isEqual:](imageData, "isEqual:"))
      goto LABEL_21;
  }
  flags = (char)self->_flags;
  v7 = *((_BYTE *)v4 + 68);
  if ((flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 68) & 1) == 0 || self->_creationDate != *((double *)v4 + 2))
      goto LABEL_21;
  }
  else if ((*((_BYTE *)v4 + 68) & 1) != 0)
  {
    goto LABEL_21;
  }
  geotagCoordinate = self->_geotagCoordinate;
  if ((unint64_t)geotagCoordinate | *((_QWORD *)v4 + 4))
  {
    if (!-[GEOLatLng isEqual:](geotagCoordinate, "isEqual:"))
    {
LABEL_21:
      v9 = 0;
      goto LABEL_22;
    }
    flags = (char)self->_flags;
    v7 = *((_BYTE *)v4 + 68);
  }
  if ((flags & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_geotagHorizontalAccuracy != *((double *)v4 + 5))
      goto LABEL_21;
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_21;
  }
  v9 = (v7 & 4) == 0;
  if ((flags & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_geotagTimestamp != *((double *)v4 + 6))
      goto LABEL_21;
    v9 = 1;
  }
LABEL_22:

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  double creationDate;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;
  char flags;
  unint64_t v11;
  double geotagHorizontalAccuracy;
  double v13;
  long double v14;
  double v15;
  unint64_t v16;
  double geotagTimestamp;
  double v18;
  long double v19;
  double v20;

  -[GEORPPhotoWithMetadata readAll:](self, "readAll:", 1);
  v3 = -[NSData hash](self->_imageData, "hash");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    creationDate = self->_creationDate;
    v6 = -creationDate;
    if (creationDate >= 0.0)
      v6 = self->_creationDate;
    v7 = floor(v6 + 0.5);
    v8 = (v6 - v7) * 1.84467441e19;
    v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0)
        v4 += (unint64_t)v8;
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    v4 = 0;
  }
  v9 = -[GEOLatLng hash](self->_geotagCoordinate, "hash");
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    geotagHorizontalAccuracy = self->_geotagHorizontalAccuracy;
    v13 = -geotagHorizontalAccuracy;
    if (geotagHorizontalAccuracy >= 0.0)
      v13 = self->_geotagHorizontalAccuracy;
    v14 = floor(v13 + 0.5);
    v15 = (v13 - v14) * 1.84467441e19;
    v11 = 2654435761u * (unint64_t)fmod(v14, 1.84467441e19);
    if (v15 >= 0.0)
    {
      if (v15 > 0.0)
        v11 += (unint64_t)v15;
    }
    else
    {
      v11 -= (unint64_t)fabs(v15);
    }
  }
  else
  {
    v11 = 0;
  }
  if ((flags & 4) != 0)
  {
    geotagTimestamp = self->_geotagTimestamp;
    v18 = -geotagTimestamp;
    if (geotagTimestamp >= 0.0)
      v18 = self->_geotagTimestamp;
    v19 = floor(v18 + 0.5);
    v20 = (v18 - v19) * 1.84467441e19;
    v16 = 2654435761u * (unint64_t)fmod(v19, 1.84467441e19);
    if (v20 >= 0.0)
    {
      if (v20 > 0.0)
        v16 += (unint64_t)v20;
    }
    else
    {
      v16 -= (unint64_t)fabs(v20);
    }
  }
  else
  {
    v16 = 0;
  }
  return v4 ^ v3 ^ v9 ^ v11 ^ v16;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  GEOLatLng *geotagCoordinate;
  uint64_t v6;
  char v7;
  _QWORD *v8;

  v8 = a3;
  objc_msgSend(v8, "readAll:", 0);
  v4 = v8;
  if (v8[3])
  {
    -[GEORPPhotoWithMetadata setImageData:](self, "setImageData:");
    v4 = v8;
  }
  if ((*((_BYTE *)v4 + 68) & 1) != 0)
  {
    self->_creationDate = (double)v4[2];
    *(_BYTE *)&self->_flags |= 1u;
  }
  geotagCoordinate = self->_geotagCoordinate;
  v6 = v4[4];
  if (geotagCoordinate)
  {
    if (!v6)
      goto LABEL_11;
    -[GEOLatLng mergeFrom:](geotagCoordinate, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_11;
    -[GEORPPhotoWithMetadata setGeotagCoordinate:](self, "setGeotagCoordinate:");
  }
  v4 = v8;
LABEL_11:
  v7 = *((_BYTE *)v4 + 68);
  if ((v7 & 2) != 0)
  {
    self->_geotagHorizontalAccuracy = (double)v4[5];
    *(_BYTE *)&self->_flags |= 2u;
    v7 = *((_BYTE *)v4 + 68);
  }
  if ((v7 & 4) != 0)
  {
    self->_geotagTimestamp = (double)v4[6];
    *(_BYTE *)&self->_flags |= 4u;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_geotagCoordinate, 0);
  objc_storeStrong((id *)&self->_imageData, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
