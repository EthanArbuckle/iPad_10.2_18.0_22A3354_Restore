@implementation GEORPImageUpdate

- (GEORPImageUpdate)init
{
  GEORPImageUpdate *v2;
  GEORPImageUpdate *v3;
  GEORPImageUpdate *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEORPImageUpdate;
  v2 = -[GEORPImageUpdate init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPImageUpdate)initWithData:(id)a3
{
  GEORPImageUpdate *v3;
  GEORPImageUpdate *v4;
  GEORPImageUpdate *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEORPImageUpdate;
  v3 = -[GEORPImageUpdate initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readImageId
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(_BYTE *)(a1 + 56) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPImageUpdateReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readImageId_tags_91);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasImageId
{
  -[GEORPImageUpdate _readImageId]((uint64_t)self);
  return self->_imageId != 0;
}

- (NSString)imageId
{
  -[GEORPImageUpdate _readImageId]((uint64_t)self);
  return self->_imageId;
}

- (void)setImageId:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x12u;
  objc_storeStrong((id *)&self->_imageId, a3);
}

- (void)_readUploadResponse
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(_BYTE *)(a1 + 56) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPImageUpdateReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readUploadResponse_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasUploadResponse
{
  -[GEORPImageUpdate _readUploadResponse]((uint64_t)self);
  return self->_uploadResponse != 0;
}

- (NSData)uploadResponse
{
  -[GEORPImageUpdate _readUploadResponse]((uint64_t)self);
  return self->_uploadResponse;
}

- (void)setUploadResponse:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x18u;
  objc_storeStrong((id *)&self->_uploadResponse, a3);
}

- (int)action
{
  os_unfair_lock_s *p_readerLock;
  char flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 1) != 0)
    return self->_action;
  else
    return 0;
}

- (void)setAction:(int)a3
{
  *(_BYTE *)&self->_flags |= 0x11u;
  self->_action = a3;
}

- (void)setHasAction:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3 | 0x10;
}

- (BOOL)hasAction
{
  return *(_BYTE *)&self->_flags & 1;
}

- (id)actionAsString:(int)a3
{
  if (a3 < 4)
    return off_1E1C071F0[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsAction:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("POI_ENRICHMENT_UPDATE_ACTION_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("POI_ENRICHMENT_UPDATE_ACTION_ADD")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("POI_ENRICHMENT_UPDATE_ACTION_REMOVE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("POI_ENRICHMENT_UPDATE_ACTION_UNMODIFIED")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_readPhotoMetadata
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(_BYTE *)(a1 + 56) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPImageUpdateReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPhotoMetadata_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasPhotoMetadata
{
  -[GEORPImageUpdate _readPhotoMetadata]((uint64_t)self);
  return self->_photoMetadata != 0;
}

- (GEORPPhotoMetadata)photoMetadata
{
  -[GEORPImageUpdate _readPhotoMetadata]((uint64_t)self);
  return self->_photoMetadata;
}

- (void)setPhotoMetadata:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x14u;
  objc_storeStrong((id *)&self->_photoMetadata, a3);
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
  v8.super_class = (Class)GEORPImageUpdate;
  -[GEORPImageUpdate description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORPImageUpdate dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPImageUpdate _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v15;

  if (a1)
  {
    objc_msgSend((id)a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)a1, "imageId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      if (a2)
        v6 = CFSTR("imageId");
      else
        v6 = CFSTR("image_id");
      objc_msgSend(v4, "setObject:forKey:", v5, v6);
    }

    objc_msgSend((id)a1, "uploadResponse");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v7, "base64EncodedStringWithOptions:", 0);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("uploadResponse"));

      }
      else
      {
        objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("upload_response"));
      }
    }

    if ((*(_BYTE *)(a1 + 56) & 1) != 0)
    {
      v10 = *(int *)(a1 + 52);
      if (v10 >= 4)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 52));
        v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v11 = off_1E1C071F0[v10];
      }
      objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("action"));

    }
    objc_msgSend((id)a1, "photoMetadata");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v12, "jsonRepresentation");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = CFSTR("photoMetadata");
      }
      else
      {
        objc_msgSend(v12, "dictionaryRepresentation");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = CFSTR("photo_metadata");
      }
      objc_msgSend(v4, "setObject:forKey:", v14, v15);

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
  return -[GEORPImageUpdate _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEORPImageUpdate)initWithDictionary:(id)a3
{
  return (GEORPImageUpdate *)-[GEORPImageUpdate _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  const __CFString *v15;
  void *v16;
  GEORPPhotoMetadata *v17;
  uint64_t v18;
  void *v19;

  v5 = a2;
  if (!a1)
    goto LABEL_36;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_36;
  if (a3)
    v6 = CFSTR("imageId");
  else
    v6 = CFSTR("image_id");
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(a1, "setImageId:", v8);

  }
  if (a3)
    v9 = CFSTR("uploadResponse");
  else
    v9 = CFSTR("upload_response");
  objc_msgSend(v5, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v10, 0);
    objc_msgSend(a1, "setUploadResponse:", v11);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("action"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v13 = v12;
    if ((objc_msgSend(v13, "isEqualToString:", CFSTR("POI_ENRICHMENT_UPDATE_ACTION_UNKNOWN")) & 1) != 0)
    {
      v14 = 0;
    }
    else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("POI_ENRICHMENT_UPDATE_ACTION_ADD")) & 1) != 0)
    {
      v14 = 1;
    }
    else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("POI_ENRICHMENT_UPDATE_ACTION_REMOVE")) & 1) != 0)
    {
      v14 = 2;
    }
    else if (objc_msgSend(v13, "isEqualToString:", CFSTR("POI_ENRICHMENT_UPDATE_ACTION_UNMODIFIED")))
    {
      v14 = 3;
    }
    else
    {
      v14 = 0;
    }

    goto LABEL_26;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v14 = objc_msgSend(v12, "intValue");
LABEL_26:
    objc_msgSend(a1, "setAction:", v14);
  }

  if (a3)
    v15 = CFSTR("photoMetadata");
  else
    v15 = CFSTR("photo_metadata");
  objc_msgSend(v5, "objectForKeyedSubscript:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v17 = [GEORPPhotoMetadata alloc];
    if ((a3 & 1) != 0)
      v18 = -[GEORPPhotoMetadata initWithJSON:](v17, "initWithJSON:", v16);
    else
      v18 = -[GEORPPhotoMetadata initWithDictionary:](v17, "initWithDictionary:", v16);
    v19 = (void *)v18;
    objc_msgSend(a1, "setPhotoMetadata:", v18);

  }
LABEL_36:

  return a1;
}

- (GEORPImageUpdate)initWithJSON:(id)a3
{
  return (GEORPImageUpdate *)-[GEORPImageUpdate _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_105;
    else
      v8 = (int *)&readAll__nonRecursiveTag_106;
    GEORPImageUpdateReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    -[GEORPPhotoMetadata readAll:](self->_photoMetadata, "readAll:", 1);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPImageUpdateIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPImageUpdateReadAllFrom((uint64_t)self, a3, 0);
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
  if (self->_reader && (_GEORPImageUpdateIsDirty((uint64_t)self) & 1) == 0)
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
    -[GEORPImageUpdate readAll:](self, "readAll:", 0);
    if (self->_imageId)
      PBDataWriterWriteStringField();
    if (self->_uploadResponse)
      PBDataWriterWriteDataField();
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      PBDataWriterWriteInt32Field();
    if (self->_photoMetadata)
      PBDataWriterWriteSubmessage();
  }

}

- (void)clearSensitiveFields:(unint64_t)a3
{
  GEORPImageUpdateClearSensitiveFields(self, a3, 1);
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[GEORPImageUpdate _readPhotoMetadata]((uint64_t)self);
  return -[GEORPPhotoMetadata hasGreenTeaWithValue:](self->_photoMetadata, "hasGreenTeaWithValue:", v3);
}

- (void)copyTo:(id)a3
{
  id *v4;
  id *v5;

  v5 = (id *)a3;
  -[GEORPImageUpdate readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 10) = self->_readerMarkPos;
  *((_DWORD *)v5 + 11) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_imageId)
    objc_msgSend(v5, "setImageId:");
  if (self->_uploadResponse)
    objc_msgSend(v5, "setUploadResponse:");
  v4 = v5;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *((_DWORD *)v5 + 13) = self->_action;
    *((_BYTE *)v5 + 56) |= 1u;
  }
  if (self->_photoMetadata)
  {
    objc_msgSend(v5, "setPhotoMetadata:");
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
  uint64_t v11;
  void *v12;
  id v13;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_BYTE *)&self->_flags & 0x10) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEORPImageUpdateReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_8;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEORPImageUpdate readAll:](self, "readAll:", 0);
  v9 = -[NSString copyWithZone:](self->_imageId, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v9;

  v11 = -[NSData copyWithZone:](self->_uploadResponse, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v11;

  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 52) = self->_action;
    *(_BYTE *)(v5 + 56) |= 1u;
  }
  v13 = -[GEORPPhotoMetadata copyWithZone:](self->_photoMetadata, "copyWithZone:", a3);
  v8 = *(id *)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v13;
LABEL_8:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *imageId;
  NSData *uploadResponse;
  GEORPPhotoMetadata *photoMetadata;
  char v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_13;
  -[GEORPImageUpdate readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  imageId = self->_imageId;
  if ((unint64_t)imageId | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](imageId, "isEqual:"))
      goto LABEL_13;
  }
  uploadResponse = self->_uploadResponse;
  if ((unint64_t)uploadResponse | *((_QWORD *)v4 + 4))
  {
    if (!-[NSData isEqual:](uploadResponse, "isEqual:"))
      goto LABEL_13;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 1) == 0 || self->_action != *((_DWORD *)v4 + 13))
      goto LABEL_13;
  }
  else if ((*((_BYTE *)v4 + 56) & 1) != 0)
  {
LABEL_13:
    v8 = 0;
    goto LABEL_14;
  }
  photoMetadata = self->_photoMetadata;
  if ((unint64_t)photoMetadata | *((_QWORD *)v4 + 3))
    v8 = -[GEORPPhotoMetadata isEqual:](photoMetadata, "isEqual:");
  else
    v8 = 1;
LABEL_14:

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  uint64_t v5;

  -[GEORPImageUpdate readAll:](self, "readAll:", 1);
  v3 = -[NSString hash](self->_imageId, "hash");
  v4 = -[NSData hash](self->_uploadResponse, "hash");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v5 = 2654435761 * self->_action;
  else
    v5 = 0;
  return v4 ^ v3 ^ v5 ^ -[GEORPPhotoMetadata hash](self->_photoMetadata, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  GEORPPhotoMetadata *photoMetadata;
  uint64_t v6;
  _QWORD *v7;

  v7 = a3;
  objc_msgSend(v7, "readAll:", 0);
  v4 = v7;
  if (v7[2])
  {
    -[GEORPImageUpdate setImageId:](self, "setImageId:");
    v4 = v7;
  }
  if (v4[4])
  {
    -[GEORPImageUpdate setUploadResponse:](self, "setUploadResponse:");
    v4 = v7;
  }
  if ((v4[7] & 1) != 0)
  {
    self->_action = *((_DWORD *)v4 + 13);
    *(_BYTE *)&self->_flags |= 1u;
  }
  photoMetadata = self->_photoMetadata;
  v6 = v4[3];
  if (photoMetadata)
  {
    if (v6)
    {
      -[GEORPPhotoMetadata mergeFrom:](photoMetadata, "mergeFrom:");
LABEL_12:
      v4 = v7;
    }
  }
  else if (v6)
  {
    -[GEORPImageUpdate setPhotoMetadata:](self, "setPhotoMetadata:");
    goto LABEL_12;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uploadResponse, 0);
  objc_storeStrong((id *)&self->_photoMetadata, 0);
  objc_storeStrong((id *)&self->_imageId, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
