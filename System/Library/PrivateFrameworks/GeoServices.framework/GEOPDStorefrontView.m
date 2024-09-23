@implementation GEOPDStorefrontView

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  const __CFString *v22;

  if (a1)
  {
    objc_msgSend((id)a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)a1, "photoPosition");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v5, "jsonRepresentation");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = CFSTR("photoPosition");
      }
      else
      {
        objc_msgSend(v5, "dictionaryRepresentation");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = CFSTR("photo_position");
      }
      objc_msgSend(v4, "setObject:forKey:", v7, v8);

    }
    if ((*(_BYTE *)(a1 + 68) & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 16));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
        v10 = CFSTR("imdataId");
      else
        v10 = CFSTR("imdata_id");
      objc_msgSend(v4, "setObject:forKey:", v9, v10);

    }
    objc_msgSend((id)a1, "lookAt");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v11, "jsonRepresentation");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = CFSTR("lookAt");
      }
      else
      {
        objc_msgSend(v11, "dictionaryRepresentation");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = CFSTR("look_at");
      }
      objc_msgSend(v4, "setObject:forKey:", v13, v14);

    }
    objc_msgSend((id)a1, "lookAtGeo");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v15, "jsonRepresentation");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = CFSTR("lookAtGeo");
      }
      else
      {
        objc_msgSend(v15, "dictionaryRepresentation");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = CFSTR("look_at_geo");
      }
      objc_msgSend(v4, "setObject:forKey:", v17, v18);

    }
    objc_msgSend((id)a1, "viewpointGeo");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v19)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v19, "jsonRepresentation");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = CFSTR("viewpointGeo");
      }
      else
      {
        objc_msgSend(v19, "dictionaryRepresentation");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = CFSTR("viewpoint_geo");
      }
      objc_msgSend(v4, "setObject:forKey:", v21, v22);

    }
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (GEOPDGeographicCoordinate)viewpointGeo
{
  -[GEOPDStorefrontView _readViewpointGeo]((uint64_t)self);
  return self->_viewpointGeo;
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
      v8 = (int *)&readAll__recursiveTag_248_1;
    else
      v8 = (int *)&readAll__nonRecursiveTag_249_1;
    GEOPDStorefrontViewReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEOPDStorefrontViewCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  os_unfair_lock_unlock(p_readerLock);
}

- (GEOPDPhotoPosition)photoPosition
{
  -[GEOPDStorefrontView _readPhotoPosition]((uint64_t)self);
  return self->_photoPosition;
}

- (GEOPDOrientedPosition)lookAt
{
  -[GEOPDStorefrontView _readLookAt]((uint64_t)self);
  return self->_lookAt;
}

- (GEOPDGeographicCoordinate)lookAtGeo
{
  -[GEOPDStorefrontView _readLookAtGeo]((uint64_t)self);
  return self->_lookAtGeo;
}

- (GEOPDStorefrontView)init
{
  GEOPDStorefrontView *v2;
  GEOPDStorefrontView *v3;
  GEOPDStorefrontView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDStorefrontView;
  v2 = -[GEOPDStorefrontView init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDStorefrontView _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (void)_readViewpointGeo
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
        GEOPDStorefrontViewReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readViewpointGeo_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (void)_readPhotoPosition
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
        GEOPDStorefrontViewReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPhotoPosition_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (void)_readLookAt
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 68) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDStorefrontViewReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLookAt_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (void)_readLookAtGeo
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 68) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDStorefrontViewReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLookAtGeo_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (GEOPDStorefrontView)initWithData:(id)a3
{
  GEOPDStorefrontView *v3;
  GEOPDStorefrontView *v4;
  GEOPDStorefrontView *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDStorefrontView;
  v3 = -[GEOPDStorefrontView initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (BOOL)hasPhotoPosition
{
  -[GEOPDStorefrontView _readPhotoPosition]((uint64_t)self);
  return self->_photoPosition != 0;
}

- (void)setPhotoPosition:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x28u;
  objc_storeStrong((id *)&self->_photoPosition, a3);
}

- (unint64_t)imdataId
{
  return self->_imdataId;
}

- (void)setImdataId:(unint64_t)a3
{
  *(_BYTE *)&self->_flags |= 0x21u;
  self->_imdataId = a3;
}

- (void)setHasImdataId:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3 | 0x20;
}

- (BOOL)hasImdataId
{
  return *(_BYTE *)&self->_flags & 1;
}

- (BOOL)hasLookAt
{
  -[GEOPDStorefrontView _readLookAt]((uint64_t)self);
  return self->_lookAt != 0;
}

- (void)setLookAt:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x24u;
  objc_storeStrong((id *)&self->_lookAt, a3);
}

- (BOOL)hasLookAtGeo
{
  -[GEOPDStorefrontView _readLookAtGeo]((uint64_t)self);
  return self->_lookAtGeo != 0;
}

- (void)setLookAtGeo:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x22u;
  objc_storeStrong((id *)&self->_lookAtGeo, a3);
}

- (BOOL)hasViewpointGeo
{
  -[GEOPDStorefrontView _readViewpointGeo]((uint64_t)self);
  return self->_viewpointGeo != 0;
}

- (void)setViewpointGeo:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x30u;
  objc_storeStrong((id *)&self->_viewpointGeo, a3);
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
  v8.super_class = (Class)GEOPDStorefrontView;
  -[GEOPDStorefrontView description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDStorefrontView dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)jsonRepresentation
{
  return -[GEOPDStorefrontView _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOPDStorefrontView)initWithDictionary:(id)a3
{
  return (GEOPDStorefrontView *)-[GEOPDStorefrontView _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  GEOPDPhotoPosition *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  GEOPDOrientedPosition *v15;
  uint64_t v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  GEOPDGeographicCoordinate *v20;
  uint64_t v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  GEOPDGeographicCoordinate *v25;
  uint64_t v26;
  void *v27;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("photoPosition");
      else
        v6 = CFSTR("photo_position");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = [GEOPDPhotoPosition alloc];
        if ((a3 & 1) != 0)
          v9 = -[GEOPDPhotoPosition initWithJSON:](v8, "initWithJSON:", v7);
        else
          v9 = -[GEOPDPhotoPosition initWithDictionary:](v8, "initWithDictionary:", v7);
        v10 = (void *)v9;
        objc_msgSend(a1, "setPhotoPosition:", v9);

      }
      if (a3)
        v11 = CFSTR("imdataId");
      else
        v11 = CFSTR("imdata_id");
      objc_msgSend(v5, "objectForKeyedSubscript:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setImdataId:", objc_msgSend(v12, "unsignedLongLongValue"));

      if (a3)
        v13 = CFSTR("lookAt");
      else
        v13 = CFSTR("look_at");
      objc_msgSend(v5, "objectForKeyedSubscript:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v15 = [GEOPDOrientedPosition alloc];
        if ((a3 & 1) != 0)
          v16 = -[GEOPDOrientedPosition initWithJSON:](v15, "initWithJSON:", v14);
        else
          v16 = -[GEOPDOrientedPosition initWithDictionary:](v15, "initWithDictionary:", v14);
        v17 = (void *)v16;
        objc_msgSend(a1, "setLookAt:", v16);

      }
      if (a3)
        v18 = CFSTR("lookAtGeo");
      else
        v18 = CFSTR("look_at_geo");
      objc_msgSend(v5, "objectForKeyedSubscript:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v20 = [GEOPDGeographicCoordinate alloc];
        if ((a3 & 1) != 0)
          v21 = -[GEOPDGeographicCoordinate initWithJSON:](v20, "initWithJSON:", v19);
        else
          v21 = -[GEOPDGeographicCoordinate initWithDictionary:](v20, "initWithDictionary:", v19);
        v22 = (void *)v21;
        objc_msgSend(a1, "setLookAtGeo:", v21);

      }
      if (a3)
        v23 = CFSTR("viewpointGeo");
      else
        v23 = CFSTR("viewpoint_geo");
      objc_msgSend(v5, "objectForKeyedSubscript:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v25 = [GEOPDGeographicCoordinate alloc];
        if ((a3 & 1) != 0)
          v26 = -[GEOPDGeographicCoordinate initWithJSON:](v25, "initWithJSON:", v24);
        else
          v26 = -[GEOPDGeographicCoordinate initWithDictionary:](v25, "initWithDictionary:", v24);
        v27 = (void *)v26;
        objc_msgSend(a1, "setViewpointGeo:", v26);

      }
    }
  }

  return a1;
}

- (GEOPDStorefrontView)initWithJSON:(id)a3
{
  return (GEOPDStorefrontView *)-[GEOPDStorefrontView _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPDStorefrontViewIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDStorefrontViewReadAllFrom((uint64_t)self, a3, 0);
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
  if (self->_reader && (_GEOPDStorefrontViewIsDirty((uint64_t)self) & 1) == 0)
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
    -[GEOPDStorefrontView readAll:](self, "readAll:", 0);
    if (self->_photoPosition)
      PBDataWriterWriteSubmessage();
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      PBDataWriterWriteUint64Field();
    if (self->_lookAt)
      PBDataWriterWriteSubmessage();
    if (self->_lookAtGeo)
      PBDataWriterWriteSubmessage();
    if (self->_viewpointGeo)
      PBDataWriterWriteSubmessage();
  }

}

- (void)copyTo:(id)a3
{
  id *v4;
  id *v5;

  v5 = (id *)a3;
  -[GEOPDStorefrontView readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 14) = self->_readerMarkPos;
  *((_DWORD *)v5 + 15) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_photoPosition)
    objc_msgSend(v5, "setPhotoPosition:");
  v4 = v5;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    v5[2] = (id)self->_imdataId;
    *((_BYTE *)v5 + 68) |= 1u;
  }
  if (self->_lookAt)
  {
    objc_msgSend(v5, "setLookAt:");
    v4 = v5;
  }
  if (self->_lookAtGeo)
  {
    objc_msgSend(v5, "setLookAtGeo:");
    v4 = v5;
  }
  if (self->_viewpointGeo)
  {
    objc_msgSend(v5, "setViewpointGeo:");
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
      GEOPDStorefrontViewReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_8;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDStorefrontView readAll:](self, "readAll:", 0);
  v9 = -[GEOPDPhotoPosition copyWithZone:](self->_photoPosition, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v9;

  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_QWORD *)(v5 + 16) = self->_imdataId;
    *(_BYTE *)(v5 + 68) |= 1u;
  }
  v11 = -[GEOPDOrientedPosition copyWithZone:](self->_lookAt, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v11;

  v13 = -[GEOPDGeographicCoordinate copyWithZone:](self->_lookAtGeo, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v13;

  v15 = -[GEOPDGeographicCoordinate copyWithZone:](self->_viewpointGeo, "copyWithZone:", a3);
  v8 = *(id *)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v15;
LABEL_8:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  GEOPDPhotoPosition *photoPosition;
  GEOPDOrientedPosition *lookAt;
  GEOPDGeographicCoordinate *lookAtGeo;
  GEOPDGeographicCoordinate *viewpointGeo;
  char v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_15;
  -[GEOPDStorefrontView readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  photoPosition = self->_photoPosition;
  if ((unint64_t)photoPosition | *((_QWORD *)v4 + 5))
  {
    if (!-[GEOPDPhotoPosition isEqual:](photoPosition, "isEqual:"))
      goto LABEL_15;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 68) & 1) == 0 || self->_imdataId != *((_QWORD *)v4 + 2))
      goto LABEL_15;
  }
  else if ((*((_BYTE *)v4 + 68) & 1) != 0)
  {
LABEL_15:
    v9 = 0;
    goto LABEL_16;
  }
  lookAt = self->_lookAt;
  if ((unint64_t)lookAt | *((_QWORD *)v4 + 4) && !-[GEOPDOrientedPosition isEqual:](lookAt, "isEqual:"))
    goto LABEL_15;
  lookAtGeo = self->_lookAtGeo;
  if ((unint64_t)lookAtGeo | *((_QWORD *)v4 + 3))
  {
    if (!-[GEOPDGeographicCoordinate isEqual:](lookAtGeo, "isEqual:"))
      goto LABEL_15;
  }
  viewpointGeo = self->_viewpointGeo;
  if ((unint64_t)viewpointGeo | *((_QWORD *)v4 + 6))
    v9 = -[GEOPDGeographicCoordinate isEqual:](viewpointGeo, "isEqual:");
  else
    v9 = 1;
LABEL_16:

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;

  -[GEOPDStorefrontView readAll:](self, "readAll:", 1);
  v3 = -[GEOPDPhotoPosition hash](self->_photoPosition, "hash");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v4 = 2654435761u * self->_imdataId;
  else
    v4 = 0;
  v5 = v4 ^ v3;
  v6 = -[GEOPDOrientedPosition hash](self->_lookAt, "hash");
  v7 = v5 ^ v6 ^ -[GEOPDGeographicCoordinate hash](self->_lookAtGeo, "hash");
  return v7 ^ -[GEOPDGeographicCoordinate hash](self->_viewpointGeo, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  GEOPDPhotoPosition *photoPosition;
  uint64_t v6;
  GEOPDOrientedPosition *lookAt;
  uint64_t v8;
  GEOPDGeographicCoordinate *lookAtGeo;
  uint64_t v10;
  GEOPDGeographicCoordinate *viewpointGeo;
  uint64_t v12;
  _QWORD *v13;

  v13 = a3;
  objc_msgSend(v13, "readAll:", 0);
  v4 = v13;
  photoPosition = self->_photoPosition;
  v6 = v13[5];
  if (photoPosition)
  {
    if (!v6)
      goto LABEL_7;
    -[GEOPDPhotoPosition mergeFrom:](photoPosition, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[GEOPDStorefrontView setPhotoPosition:](self, "setPhotoPosition:");
  }
  v4 = v13;
LABEL_7:
  if ((*((_BYTE *)v4 + 68) & 1) != 0)
  {
    self->_imdataId = v4[2];
    *(_BYTE *)&self->_flags |= 1u;
  }
  lookAt = self->_lookAt;
  v8 = v4[4];
  if (lookAt)
  {
    if (!v8)
      goto LABEL_15;
    -[GEOPDOrientedPosition mergeFrom:](lookAt, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_15;
    -[GEOPDStorefrontView setLookAt:](self, "setLookAt:");
  }
  v4 = v13;
LABEL_15:
  lookAtGeo = self->_lookAtGeo;
  v10 = v4[3];
  if (lookAtGeo)
  {
    if (!v10)
      goto LABEL_21;
    -[GEOPDGeographicCoordinate mergeFrom:](lookAtGeo, "mergeFrom:");
  }
  else
  {
    if (!v10)
      goto LABEL_21;
    -[GEOPDStorefrontView setLookAtGeo:](self, "setLookAtGeo:");
  }
  v4 = v13;
LABEL_21:
  viewpointGeo = self->_viewpointGeo;
  v12 = v4[6];
  if (viewpointGeo)
  {
    if (v12)
    {
      -[GEOPDGeographicCoordinate mergeFrom:](viewpointGeo, "mergeFrom:");
LABEL_26:
      v4 = v13;
    }
  }
  else if (v12)
  {
    -[GEOPDStorefrontView setViewpointGeo:](self, "setViewpointGeo:");
    goto LABEL_26;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewpointGeo, 0);
  objc_storeStrong((id *)&self->_photoPosition, 0);
  objc_storeStrong((id *)&self->_lookAt, 0);
  objc_storeStrong((id *)&self->_lookAtGeo, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
