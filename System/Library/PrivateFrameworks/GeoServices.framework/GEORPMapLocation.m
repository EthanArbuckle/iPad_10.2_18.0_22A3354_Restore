@implementation GEORPMapLocation

- (GEORPMapLocation)init
{
  GEORPMapLocation *v2;
  GEORPMapLocation *v3;
  GEORPMapLocation *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEORPMapLocation;
  v2 = -[GEORPMapLocation init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPMapLocation)initWithData:(id)a3
{
  GEORPMapLocation *v3;
  GEORPMapLocation *v4;
  GEORPMapLocation *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEORPMapLocation;
  v3 = -[GEORPMapLocation initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readImage
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_BYTE *)(a1 + 64) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPMapLocationReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readImage_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasImage
{
  -[GEORPMapLocation _readImage]((uint64_t)self);
  return self->_image != 0;
}

- (NSData)image
{
  -[GEORPMapLocation _readImage]((uint64_t)self);
  return self->_image;
}

- (void)setImage:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x24u;
  objc_storeStrong((id *)&self->_image, a3);
}

- (void)_readCoordinate
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_BYTE *)(a1 + 64) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPMapLocationReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCoordinate_tags_1104);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasCoordinate
{
  -[GEORPMapLocation _readCoordinate]((uint64_t)self);
  return self->_coordinate != 0;
}

- (GEOLatLng)coordinate
{
  -[GEORPMapLocation _readCoordinate]((uint64_t)self);
  return self->_coordinate;
}

- (void)setCoordinate:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x22u;
  objc_storeStrong((id *)&self->_coordinate, a3);
}

- (float)zoomLevel
{
  return self->_zoomLevel;
}

- (void)setZoomLevel:(float)a3
{
  *(_BYTE *)&self->_flags |= 0x21u;
  self->_zoomLevel = a3;
}

- (void)setHasZoomLevel:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3 | 0x20;
}

- (BOOL)hasZoomLevel
{
  return *(_BYTE *)&self->_flags & 1;
}

- (void)_readViewportInfo
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_BYTE *)(a1 + 64) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPMapLocationReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readViewportInfo_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasViewportInfo
{
  -[GEORPMapLocation _readViewportInfo]((uint64_t)self);
  return self->_viewportInfo != 0;
}

- (GEOPDViewportInfo)viewportInfo
{
  -[GEORPMapLocation _readViewportInfo]((uint64_t)self);
  return self->_viewportInfo;
}

- (void)setViewportInfo:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x30u;
  objc_storeStrong((id *)&self->_viewportInfo, a3);
}

- (void)_readMapScreenshotId
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_BYTE *)(a1 + 64) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPMapLocationReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMapScreenshotId_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasMapScreenshotId
{
  -[GEORPMapLocation _readMapScreenshotId]((uint64_t)self);
  return self->_mapScreenshotId != 0;
}

- (NSString)mapScreenshotId
{
  -[GEORPMapLocation _readMapScreenshotId]((uint64_t)self);
  return self->_mapScreenshotId;
}

- (void)setMapScreenshotId:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x28u;
  objc_storeStrong((id *)&self->_mapScreenshotId, a3);
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
  v8.super_class = (Class)GEORPMapLocation;
  -[GEORPMapLocation description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORPMapLocation dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPMapLocation _dictionaryRepresentation:]((uint64_t)self, 0);
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
  double v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  const __CFString *v19;

  if (a1)
  {
    objc_msgSend((id)a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)a1, "image");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v5, "base64EncodedStringWithOptions:", 0);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("image"));

      }
      else
      {
        objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("image"));
      }
    }

    objc_msgSend((id)a1, "coordinate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      if ((a2 & 1) != 0)
        objc_msgSend(v8, "jsonRepresentation");
      else
        objc_msgSend(v8, "dictionaryRepresentation");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("coordinate"));

    }
    if ((*(_BYTE *)(a1 + 64) & 1) != 0)
    {
      LODWORD(v11) = *(_DWORD *)(a1 + 60);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
        v13 = CFSTR("zoomLevel");
      else
        v13 = CFSTR("zoom_level");
      objc_msgSend(v4, "setObject:forKey:", v12, v13);

    }
    objc_msgSend((id)a1, "viewportInfo");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v14, "jsonRepresentation");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = CFSTR("viewportInfo");
      }
      else
      {
        objc_msgSend(v14, "dictionaryRepresentation");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = CFSTR("viewport_info");
      }
      objc_msgSend(v4, "setObject:forKey:", v16, v17);

    }
    objc_msgSend((id)a1, "mapScreenshotId");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      if (a2)
        v19 = CFSTR("mapScreenshotId");
      else
        v19 = CFSTR("map_screenshot_id");
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
  return -[GEORPMapLocation _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEORPMapLocation)initWithDictionary:(id)a3
{
  return (GEORPMapLocation *)-[GEORPMapLocation _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  GEOLatLng *v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  GEOPDViewportInfo *v16;
  uint64_t v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  void *v21;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("image"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v6, 0);
        objc_msgSend(a1, "setImage:", v7);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("coordinate"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v9 = [GEOLatLng alloc];
        if ((a3 & 1) != 0)
          v10 = -[GEOLatLng initWithJSON:](v9, "initWithJSON:", v8);
        else
          v10 = -[GEOLatLng initWithDictionary:](v9, "initWithDictionary:", v8);
        v11 = (void *)v10;
        objc_msgSend(a1, "setCoordinate:", v10);

      }
      if (a3)
        v12 = CFSTR("zoomLevel");
      else
        v12 = CFSTR("zoom_level");
      objc_msgSend(v5, "objectForKeyedSubscript:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v13, "floatValue");
        objc_msgSend(a1, "setZoomLevel:");
      }

      if (a3)
        v14 = CFSTR("viewportInfo");
      else
        v14 = CFSTR("viewport_info");
      objc_msgSend(v5, "objectForKeyedSubscript:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v16 = [GEOPDViewportInfo alloc];
        if ((a3 & 1) != 0)
          v17 = -[GEOPDViewportInfo initWithJSON:](v16, "initWithJSON:", v15);
        else
          v17 = -[GEOPDViewportInfo initWithDictionary:](v16, "initWithDictionary:", v15);
        v18 = (void *)v17;
        objc_msgSend(a1, "setViewportInfo:", v17);

      }
      if (a3)
        v19 = CFSTR("mapScreenshotId");
      else
        v19 = CFSTR("map_screenshot_id");
      objc_msgSend(v5, "objectForKeyedSubscript:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v21 = (void *)objc_msgSend(v20, "copy");
        objc_msgSend(a1, "setMapScreenshotId:", v21);

      }
    }
  }

  return a1;
}

- (GEORPMapLocation)initWithJSON:(id)a3
{
  return (GEORPMapLocation *)-[GEORPMapLocation _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_1120;
    else
      v8 = (int *)&readAll__nonRecursiveTag_1121;
    GEORPMapLocationReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
  {
    -[GEOLatLng readAll:](self->_coordinate, "readAll:", 1);
    -[GEOPDViewportInfo readAll:](self->_viewportInfo, "readAll:", 1);
  }
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPMapLocationIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPMapLocationReadAllFrom((uint64_t)self, a3, 0);
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
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_BYTE *)&self->_flags & 0x3E) == 0))
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
    -[GEORPMapLocation readAll:](self, "readAll:", 0);
    if (self->_image)
      PBDataWriterWriteDataField();
    if (self->_coordinate)
      PBDataWriterWriteSubmessage();
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      PBDataWriterWriteFloatField();
    if (self->_viewportInfo)
      PBDataWriterWriteSubmessage();
    if (self->_mapScreenshotId)
      PBDataWriterWriteStringField();
  }

}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[GEORPMapLocation _readCoordinate]((uint64_t)self);
  if (-[GEOLatLng hasGreenTeaWithValue:](self->_coordinate, "hasGreenTeaWithValue:", v3))
    return 1;
  -[GEORPMapLocation _readViewportInfo]((uint64_t)self);
  return -[GEOPDViewportInfo hasGreenTeaWithValue:](self->_viewportInfo, "hasGreenTeaWithValue:", v3);
}

- (void)copyTo:(id)a3
{
  id *v4;
  id *v5;

  v5 = (id *)a3;
  -[GEORPMapLocation readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 12) = self->_readerMarkPos;
  *((_DWORD *)v5 + 13) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_image)
    objc_msgSend(v5, "setImage:");
  if (self->_coordinate)
    objc_msgSend(v5, "setCoordinate:");
  v4 = v5;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *((_DWORD *)v5 + 15) = LODWORD(self->_zoomLevel);
    *((_BYTE *)v5 + 64) |= 1u;
  }
  if (self->_viewportInfo)
  {
    objc_msgSend(v5, "setViewportInfo:");
    v4 = v5;
  }
  if (self->_mapScreenshotId)
  {
    objc_msgSend(v5, "setMapScreenshotId:");
    v4 = v5;
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
  id v13;
  void *v14;
  uint64_t v15;

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
      GEORPMapLocationReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_8;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEORPMapLocation readAll:](self, "readAll:", 0);
  v9 = -[NSData copyWithZone:](self->_image, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v9;

  v11 = -[GEOLatLng copyWithZone:](self->_coordinate, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v11;

  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(float *)(v5 + 60) = self->_zoomLevel;
    *(_BYTE *)(v5 + 64) |= 1u;
  }
  v13 = -[GEOPDViewportInfo copyWithZone:](self->_viewportInfo, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v13;

  v15 = -[NSString copyWithZone:](self->_mapScreenshotId, "copyWithZone:", a3);
  v8 = *(id *)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v15;
LABEL_8:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSData *image;
  GEOLatLng *coordinate;
  GEOPDViewportInfo *viewportInfo;
  NSString *mapScreenshotId;
  char v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_15;
  -[GEORPMapLocation readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  image = self->_image;
  if ((unint64_t)image | *((_QWORD *)v4 + 3))
  {
    if (!-[NSData isEqual:](image, "isEqual:"))
      goto LABEL_15;
  }
  coordinate = self->_coordinate;
  if ((unint64_t)coordinate | *((_QWORD *)v4 + 2))
  {
    if (!-[GEOLatLng isEqual:](coordinate, "isEqual:"))
      goto LABEL_15;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 1) == 0 || self->_zoomLevel != *((float *)v4 + 15))
      goto LABEL_15;
  }
  else if ((*((_BYTE *)v4 + 64) & 1) != 0)
  {
LABEL_15:
    v9 = 0;
    goto LABEL_16;
  }
  viewportInfo = self->_viewportInfo;
  if ((unint64_t)viewportInfo | *((_QWORD *)v4 + 5) && !-[GEOPDViewportInfo isEqual:](viewportInfo, "isEqual:"))
    goto LABEL_15;
  mapScreenshotId = self->_mapScreenshotId;
  if ((unint64_t)mapScreenshotId | *((_QWORD *)v4 + 4))
    v9 = -[NSString isEqual:](mapScreenshotId, "isEqual:");
  else
    v9 = 1;
LABEL_16:

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  float zoomLevel;
  double v7;
  long double v8;
  double v9;
  unint64_t v10;

  -[GEORPMapLocation readAll:](self, "readAll:", 1);
  v3 = -[NSData hash](self->_image, "hash");
  v4 = -[GEOLatLng hash](self->_coordinate, "hash");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    zoomLevel = self->_zoomLevel;
    v7 = zoomLevel;
    if (zoomLevel < 0.0)
      v7 = -zoomLevel;
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
  v10 = v4 ^ v3 ^ v5 ^ -[GEOPDViewportInfo hash](self->_viewportInfo, "hash");
  return v10 ^ -[NSString hash](self->_mapScreenshotId, "hash");
}

- (void)mergeFrom:(id)a3
{
  float *v4;
  GEOLatLng *coordinate;
  uint64_t v6;
  GEOPDViewportInfo *viewportInfo;
  uint64_t v8;
  _QWORD *v9;

  v9 = a3;
  objc_msgSend(v9, "readAll:", 0);
  v4 = (float *)v9;
  if (v9[3])
  {
    -[GEORPMapLocation setImage:](self, "setImage:");
    v4 = (float *)v9;
  }
  coordinate = self->_coordinate;
  v6 = *((_QWORD *)v4 + 2);
  if (coordinate)
  {
    if (!v6)
      goto LABEL_9;
    -[GEOLatLng mergeFrom:](coordinate, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_9;
    -[GEORPMapLocation setCoordinate:](self, "setCoordinate:");
  }
  v4 = (float *)v9;
LABEL_9:
  if (((_BYTE)v4[16] & 1) != 0)
  {
    self->_zoomLevel = v4[15];
    *(_BYTE *)&self->_flags |= 1u;
  }
  viewportInfo = self->_viewportInfo;
  v8 = *((_QWORD *)v4 + 5);
  if (viewportInfo)
  {
    if (!v8)
      goto LABEL_17;
    -[GEOPDViewportInfo mergeFrom:](viewportInfo, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_17;
    -[GEORPMapLocation setViewportInfo:](self, "setViewportInfo:");
  }
  v4 = (float *)v9;
LABEL_17:
  if (*((_QWORD *)v4 + 4))
  {
    -[GEORPMapLocation setMapScreenshotId:](self, "setMapScreenshotId:");
    v4 = (float *)v9;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewportInfo, 0);
  objc_storeStrong((id *)&self->_mapScreenshotId, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_coordinate, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

- (void)_setMapMode:(int)a3 region:(id)a4
{
  uint64_t v4;
  GEOPDViewportInfo *v6;
  GEOPDViewportInfo *v7;
  id v8;

  v4 = *(_QWORD *)&a3;
  v8 = a4;
  v6 = objc_alloc_init(GEOPDViewportInfo);
  v7 = v6;
  if (v4 <= 4)
    -[GEOPDViewportInfo setMapType:](v6, "setMapType:", v4);
  -[GEOPDViewportInfo setMapRegion:](v7, "setMapRegion:", v8);
  -[GEORPMapLocation setViewportInfo:](self, "setViewportInfo:", v7);

}

@end
