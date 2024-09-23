@implementation GEORPInstructionCorrection

- (GEORPInstructionCorrection)init
{
  GEORPInstructionCorrection *v2;
  GEORPInstructionCorrection *v3;
  GEORPInstructionCorrection *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEORPInstructionCorrection;
  v2 = -[GEORPInstructionCorrection init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPInstructionCorrection)initWithData:(id)a3
{
  GEORPInstructionCorrection *v3;
  GEORPInstructionCorrection *v4;
  GEORPInstructionCorrection *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEORPInstructionCorrection;
  v3 = -[GEORPInstructionCorrection initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (unsigned)routeStepIndex
{
  return self->_routeStepIndex;
}

- (void)setRouteStepIndex:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 0x81u;
  self->_routeStepIndex = a3;
}

- (void)setHasRouteStepIndex:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0x7E | a3 | 0x80;
}

- (BOOL)hasRouteStepIndex
{
  return *(_BYTE *)&self->_flags & 1;
}

- (void)_readComments
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 76) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPInstructionCorrectionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readComments_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasComments
{
  -[GEORPInstructionCorrection _readComments]((uint64_t)self);
  return self->_comments != 0;
}

- (NSString)comments
{
  -[GEORPInstructionCorrection _readComments]((uint64_t)self);
  return self->_comments;
}

- (void)setComments:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x84u;
  objc_storeStrong((id *)&self->_comments, a3);
}

- (void)_readPhoto
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 76) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPInstructionCorrectionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPhoto_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasPhoto
{
  -[GEORPInstructionCorrection _readPhoto]((uint64_t)self);
  return self->_photo != 0;
}

- (GEORPPhotoWithMetadata)photo
{
  -[GEORPInstructionCorrection _readPhoto]((uint64_t)self);
  return self->_photo;
}

- (void)setPhoto:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x90u;
  objc_storeStrong((id *)&self->_photo, a3);
}

- (unsigned)routeStepSubstepIndex
{
  return self->_routeStepSubstepIndex;
}

- (void)setRouteStepSubstepIndex:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 0x82u;
  self->_routeStepSubstepIndex = a3;
}

- (void)setHasRouteStepSubstepIndex:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = -126;
  else
    v3 = 0x80;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasRouteStepSubstepIndex
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (void)_readRouteStepScreenshotImageData
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 76) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPInstructionCorrectionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRouteStepScreenshotImageData_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasRouteStepScreenshotImageData
{
  -[GEORPInstructionCorrection _readRouteStepScreenshotImageData]((uint64_t)self);
  return self->_routeStepScreenshotImageData != 0;
}

- (NSData)routeStepScreenshotImageData
{
  -[GEORPInstructionCorrection _readRouteStepScreenshotImageData]((uint64_t)self);
  return self->_routeStepScreenshotImageData;
}

- (void)setRouteStepScreenshotImageData:(id)a3
{
  *(_BYTE *)&self->_flags |= 0xA0u;
  objc_storeStrong((id *)&self->_routeStepScreenshotImageData, a3);
}

- (void)_readPhotoId
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 76) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPInstructionCorrectionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPhotoId_tags_1);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasPhotoId
{
  -[GEORPInstructionCorrection _readPhotoId]((uint64_t)self);
  return self->_photoId != 0;
}

- (NSString)photoId
{
  -[GEORPInstructionCorrection _readPhotoId]((uint64_t)self);
  return self->_photoId;
}

- (void)setPhotoId:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x88u;
  objc_storeStrong((id *)&self->_photoId, a3);
}

- (void)_readRouteStepScreenshotImageId
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 76) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPInstructionCorrectionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRouteStepScreenshotImageId_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasRouteStepScreenshotImageId
{
  -[GEORPInstructionCorrection _readRouteStepScreenshotImageId]((uint64_t)self);
  return self->_routeStepScreenshotImageId != 0;
}

- (NSString)routeStepScreenshotImageId
{
  -[GEORPInstructionCorrection _readRouteStepScreenshotImageId]((uint64_t)self);
  return self->_routeStepScreenshotImageId;
}

- (void)setRouteStepScreenshotImageId:(id)a3
{
  *(_BYTE *)&self->_flags |= 0xC0u;
  objc_storeStrong((id *)&self->_routeStepScreenshotImageId, a3);
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
  v8.super_class = (Class)GEORPInstructionCorrection;
  -[GEORPInstructionCorrection description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORPInstructionCorrection dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPInstructionCorrection _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
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
    if ((*(_BYTE *)(a1 + 76) & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 68));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
        v6 = CFSTR("routeStepIndex");
      else
        v6 = CFSTR("route_step_index");
      objc_msgSend(v4, "setObject:forKey:", v5, v6);

    }
    objc_msgSend((id)a1, "comments");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("comments"));

    objc_msgSend((id)a1, "photo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      if ((a2 & 1) != 0)
        objc_msgSend(v8, "jsonRepresentation");
      else
        objc_msgSend(v8, "dictionaryRepresentation");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("photo"));

    }
    if ((*(_BYTE *)(a1 + 76) & 2) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 72));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
        v12 = CFSTR("routeStepSubstepIndex");
      else
        v12 = CFSTR("route_step_substep_index");
      objc_msgSend(v4, "setObject:forKey:", v11, v12);

    }
    objc_msgSend((id)a1, "routeStepScreenshotImageData");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v13, "base64EncodedStringWithOptions:", 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("routeStepScreenshotImageData"));

      }
      else
      {
        objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("route_step_screenshot_image_data"));
      }
    }

    objc_msgSend((id)a1, "photoId");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      if (a2)
        v17 = CFSTR("photoId");
      else
        v17 = CFSTR("photo_id");
      objc_msgSend(v4, "setObject:forKey:", v16, v17);
    }

    objc_msgSend((id)a1, "routeStepScreenshotImageId");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      if (a2)
        v19 = CFSTR("routeStepScreenshotImageId");
      else
        v19 = CFSTR("route_step_screenshot_image_id");
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
  return -[GEORPInstructionCorrection _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEORPInstructionCorrection)initWithDictionary:(id)a3
{
  return (GEORPInstructionCorrection *)-[GEORPInstructionCorrection _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  GEORPPhotoWithMetadata *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  void *v24;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("routeStepIndex");
      else
        v6 = CFSTR("route_step_index");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setRouteStepIndex:", objc_msgSend(v7, "unsignedIntValue"));

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("comments"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v9 = (void *)objc_msgSend(v8, "copy");
        objc_msgSend(a1, "setComments:", v9);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("photo"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = [GEORPPhotoWithMetadata alloc];
        if ((a3 & 1) != 0)
          v12 = -[GEORPPhotoWithMetadata initWithJSON:](v11, "initWithJSON:", v10);
        else
          v12 = -[GEORPPhotoWithMetadata initWithDictionary:](v11, "initWithDictionary:", v10);
        v13 = (void *)v12;
        objc_msgSend(a1, "setPhoto:", v12);

      }
      if (a3)
        v14 = CFSTR("routeStepSubstepIndex");
      else
        v14 = CFSTR("route_step_substep_index");
      objc_msgSend(v5, "objectForKeyedSubscript:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setRouteStepSubstepIndex:", objc_msgSend(v15, "unsignedIntValue"));

      if (a3)
        v16 = CFSTR("routeStepScreenshotImageData");
      else
        v16 = CFSTR("route_step_screenshot_image_data");
      objc_msgSend(v5, "objectForKeyedSubscript:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v17, 0);
        objc_msgSend(a1, "setRouteStepScreenshotImageData:", v18);

      }
      if (a3)
        v19 = CFSTR("photoId");
      else
        v19 = CFSTR("photo_id");
      objc_msgSend(v5, "objectForKeyedSubscript:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v21 = (void *)objc_msgSend(v20, "copy");
        objc_msgSend(a1, "setPhotoId:", v21);

      }
      if (a3)
        v22 = CFSTR("routeStepScreenshotImageId");
      else
        v22 = CFSTR("route_step_screenshot_image_id");
      objc_msgSend(v5, "objectForKeyedSubscript:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v24 = (void *)objc_msgSend(v23, "copy");
        objc_msgSend(a1, "setRouteStepScreenshotImageId:", v24);

      }
    }
  }

  return a1;
}

- (GEORPInstructionCorrection)initWithJSON:(id)a3
{
  return (GEORPInstructionCorrection *)-[GEORPInstructionCorrection _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_1022;
    else
      v8 = (int *)&readAll__nonRecursiveTag_1023;
    GEORPInstructionCorrectionReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    -[GEORPPhotoWithMetadata readAll:](self->_photo, "readAll:", 1);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPInstructionCorrectionIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPInstructionCorrectionReadAllFrom((uint64_t)self, a3, 0);
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
  if (self->_reader && (_GEORPInstructionCorrectionIsDirty((uint64_t)self) & 1) == 0)
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
    -[GEORPInstructionCorrection readAll:](self, "readAll:", 0);
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      PBDataWriterWriteUint32Field();
    if (self->_comments)
      PBDataWriterWriteStringField();
    if (self->_photo)
      PBDataWriterWriteSubmessage();
    if ((*(_BYTE *)&self->_flags & 2) != 0)
      PBDataWriterWriteUint32Field();
    if (self->_routeStepScreenshotImageData)
      PBDataWriterWriteDataField();
    if (self->_photoId)
      PBDataWriterWriteStringField();
    if (self->_routeStepScreenshotImageId)
      PBDataWriterWriteStringField();
  }

}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[GEORPInstructionCorrection _readPhoto]((uint64_t)self);
  return -[GEORPPhotoWithMetadata hasGreenTeaWithValue:](self->_photo, "hasGreenTeaWithValue:", v3);
}

- (void)copyTo:(id)a3
{
  id *v4;
  id *v5;

  v5 = (id *)a3;
  -[GEORPInstructionCorrection readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 14) = self->_readerMarkPos;
  *((_DWORD *)v5 + 15) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  v4 = v5;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *((_DWORD *)v5 + 17) = self->_routeStepIndex;
    *((_BYTE *)v5 + 76) |= 1u;
  }
  if (self->_comments)
  {
    objc_msgSend(v5, "setComments:");
    v4 = v5;
  }
  if (self->_photo)
  {
    objc_msgSend(v5, "setPhoto:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    *((_DWORD *)v4 + 18) = self->_routeStepSubstepIndex;
    *((_BYTE *)v4 + 76) |= 2u;
  }
  if (self->_routeStepScreenshotImageData)
  {
    objc_msgSend(v5, "setRouteStepScreenshotImageData:");
    v4 = v5;
  }
  if (self->_photoId)
  {
    objc_msgSend(v5, "setPhotoId:");
    v4 = v5;
  }
  if (self->_routeStepScreenshotImageId)
  {
    objc_msgSend(v5, "setRouteStepScreenshotImageId:");
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
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;

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
      GEORPInstructionCorrectionReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_10;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEORPInstructionCorrection readAll:](self, "readAll:", 0);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 68) = self->_routeStepIndex;
    *(_BYTE *)(v5 + 76) |= 1u;
  }
  v9 = -[NSString copyWithZone:](self->_comments, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v9;

  v11 = -[GEORPPhotoWithMetadata copyWithZone:](self->_photo, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v11;

  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 72) = self->_routeStepSubstepIndex;
    *(_BYTE *)(v5 + 76) |= 2u;
  }
  v13 = -[NSData copyWithZone:](self->_routeStepScreenshotImageData, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v13;

  v15 = -[NSString copyWithZone:](self->_photoId, "copyWithZone:", a3);
  v16 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v15;

  v17 = -[NSString copyWithZone:](self->_routeStepScreenshotImageId, "copyWithZone:", a3);
  v8 = *(id *)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v17;
LABEL_10:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *comments;
  GEORPPhotoWithMetadata *photo;
  NSData *routeStepScreenshotImageData;
  NSString *photoId;
  NSString *routeStepScreenshotImageId;
  char v10;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_22;
  -[GEORPInstructionCorrection readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 76) & 1) == 0 || self->_routeStepIndex != *((_DWORD *)v4 + 17))
      goto LABEL_22;
  }
  else if ((*((_BYTE *)v4 + 76) & 1) != 0)
  {
LABEL_22:
    v10 = 0;
    goto LABEL_23;
  }
  comments = self->_comments;
  if ((unint64_t)comments | *((_QWORD *)v4 + 2) && !-[NSString isEqual:](comments, "isEqual:"))
    goto LABEL_22;
  photo = self->_photo;
  if ((unint64_t)photo | *((_QWORD *)v4 + 4))
  {
    if (!-[GEORPPhotoWithMetadata isEqual:](photo, "isEqual:"))
      goto LABEL_22;
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 76) & 2) == 0 || self->_routeStepSubstepIndex != *((_DWORD *)v4 + 18))
      goto LABEL_22;
  }
  else if ((*((_BYTE *)v4 + 76) & 2) != 0)
  {
    goto LABEL_22;
  }
  routeStepScreenshotImageData = self->_routeStepScreenshotImageData;
  if ((unint64_t)routeStepScreenshotImageData | *((_QWORD *)v4 + 5)
    && !-[NSData isEqual:](routeStepScreenshotImageData, "isEqual:"))
  {
    goto LABEL_22;
  }
  photoId = self->_photoId;
  if ((unint64_t)photoId | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](photoId, "isEqual:"))
      goto LABEL_22;
  }
  routeStepScreenshotImageId = self->_routeStepScreenshotImageId;
  if ((unint64_t)routeStepScreenshotImageId | *((_QWORD *)v4 + 6))
    v10 = -[NSString isEqual:](routeStepScreenshotImageId, "isEqual:");
  else
    v10 = 1;
LABEL_23:

  return v10;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  unint64_t v5;
  uint64_t v6;
  NSUInteger v7;
  uint64_t v8;
  NSUInteger v9;

  -[GEORPInstructionCorrection readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v3 = 2654435761 * self->_routeStepIndex;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_comments, "hash");
  v5 = -[GEORPPhotoWithMetadata hash](self->_photo, "hash");
  if ((*(_BYTE *)&self->_flags & 2) != 0)
    v6 = 2654435761 * self->_routeStepSubstepIndex;
  else
    v6 = 0;
  v7 = v4 ^ v3 ^ v5 ^ v6;
  v8 = -[NSData hash](self->_routeStepScreenshotImageData, "hash");
  v9 = v7 ^ v8 ^ -[NSString hash](self->_photoId, "hash");
  return v9 ^ -[NSString hash](self->_routeStepScreenshotImageId, "hash");
}

- (void)mergeFrom:(id)a3
{
  unsigned int *v4;
  GEORPPhotoWithMetadata *photo;
  uint64_t v6;
  unsigned int *v7;

  v7 = (unsigned int *)a3;
  objc_msgSend(v7, "readAll:", 0);
  v4 = v7;
  if ((v7[19] & 1) != 0)
  {
    self->_routeStepIndex = v7[17];
    *(_BYTE *)&self->_flags |= 1u;
  }
  if (*((_QWORD *)v7 + 2))
  {
    -[GEORPInstructionCorrection setComments:](self, "setComments:");
    v4 = v7;
  }
  photo = self->_photo;
  v6 = *((_QWORD *)v4 + 4);
  if (photo)
  {
    if (!v6)
      goto LABEL_11;
    -[GEORPPhotoWithMetadata mergeFrom:](photo, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_11;
    -[GEORPInstructionCorrection setPhoto:](self, "setPhoto:");
  }
  v4 = v7;
LABEL_11:
  if ((v4[19] & 2) != 0)
  {
    self->_routeStepSubstepIndex = v4[18];
    *(_BYTE *)&self->_flags |= 2u;
  }
  if (*((_QWORD *)v4 + 5))
  {
    -[GEORPInstructionCorrection setRouteStepScreenshotImageData:](self, "setRouteStepScreenshotImageData:");
    v4 = v7;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[GEORPInstructionCorrection setPhotoId:](self, "setPhotoId:");
    v4 = v7;
  }
  if (*((_QWORD *)v4 + 6))
  {
    -[GEORPInstructionCorrection setRouteStepScreenshotImageId:](self, "setRouteStepScreenshotImageId:");
    v4 = v7;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routeStepScreenshotImageId, 0);
  objc_storeStrong((id *)&self->_routeStepScreenshotImageData, 0);
  objc_storeStrong((id *)&self->_photo, 0);
  objc_storeStrong((id *)&self->_photoId, 0);
  objc_storeStrong((id *)&self->_comments, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
