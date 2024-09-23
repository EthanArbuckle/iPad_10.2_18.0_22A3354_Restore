@implementation GEORPPhotoMetadata

- (GEORPPhotoMetadata)init
{
  GEORPPhotoMetadata *v2;
  GEORPPhotoMetadata *v3;
  GEORPPhotoMetadata *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEORPPhotoMetadata;
  v2 = -[GEORPPhotoMetadata init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPPhotoMetadata)initWithData:(id)a3
{
  GEORPPhotoMetadata *v3;
  GEORPPhotoMetadata *v4;
  GEORPPhotoMetadata *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEORPPhotoMetadata;
  v3 = -[GEORPPhotoMetadata initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readClientImageUuid
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 88) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPPhotoMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readClientImageUuid_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasClientImageUuid
{
  -[GEORPPhotoMetadata _readClientImageUuid]((uint64_t)self);
  return self->_clientImageUuid != 0;
}

- (NSString)clientImageUuid
{
  -[GEORPPhotoMetadata _readClientImageUuid]((uint64_t)self);
  return self->_clientImageUuid;
}

- (void)setClientImageUuid:(id)a3
{
  *(_WORD *)&self->_flags |= 0x104u;
  objc_storeStrong((id *)&self->_clientImageUuid, a3);
}

- (void)_readImageDescription
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 88) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPPhotoMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readImageDescription_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasImageDescription
{
  -[GEORPPhotoMetadata _readImageDescription]((uint64_t)self);
  return self->_imageDescription != 0;
}

- (NSString)imageDescription
{
  -[GEORPPhotoMetadata _readImageDescription]((uint64_t)self);
  return self->_imageDescription;
}

- (void)setImageDescription:(id)a3
{
  *(_WORD *)&self->_flags |= 0x140u;
  objc_storeStrong((id *)&self->_imageDescription, a3);
}

- (void)_readGeotag
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 88) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPPhotoMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readGeotag_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasGeotag
{
  -[GEORPPhotoMetadata _readGeotag]((uint64_t)self);
  return self->_geotag != 0;
}

- (GEOLocation)geotag
{
  -[GEORPPhotoMetadata _readGeotag]((uint64_t)self);
  return self->_geotag;
}

- (void)setGeotag:(id)a3
{
  *(_WORD *)&self->_flags |= 0x120u;
  objc_storeStrong((id *)&self->_geotag, a3);
}

- (unint64_t)size
{
  return self->_size;
}

- (void)setSize:(unint64_t)a3
{
  *(_WORD *)&self->_flags |= 0x101u;
  self->_size = a3;
}

- (void)setHasSize:(BOOL)a3
{
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFE | a3 | 0x100;
}

- (BOOL)hasSize
{
  return *(_WORD *)&self->_flags & 1;
}

- (void)_readMediaType
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 88) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPPhotoMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMediaType_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasMediaType
{
  -[GEORPPhotoMetadata _readMediaType]((uint64_t)self);
  return self->_mediaType != 0;
}

- (NSString)mediaType
{
  -[GEORPPhotoMetadata _readMediaType]((uint64_t)self);
  return self->_mediaType;
}

- (void)setMediaType:(id)a3
{
  *(_WORD *)&self->_flags |= 0x180u;
  objc_storeStrong((id *)&self->_mediaType, a3);
}

- (int)source
{
  os_unfair_lock_s *p_readerLock;
  __int16 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 2) != 0)
    return self->_source;
  else
    return 0;
}

- (void)setSource:(int)a3
{
  *(_WORD *)&self->_flags |= 0x102u;
  self->_source = a3;
}

- (void)setHasSource:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 258;
  else
    v3 = 256;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasSource
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
}

- (id)sourceAsString:(int)a3
{
  if (a3 < 3)
    return *((id *)&off_1E1C14948 + a3);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsSource:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PHOTO_METADATA_SOURCE_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PHOTO_METADATA_SOURCE_CAMERA")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("PHOTO_METADATA_SOURCE_PHOTO_LIBRARY")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_readDeviceLensMake
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 88) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPPhotoMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDeviceLensMake_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasDeviceLensMake
{
  -[GEORPPhotoMetadata _readDeviceLensMake]((uint64_t)self);
  return self->_deviceLensMake != 0;
}

- (NSString)deviceLensMake
{
  -[GEORPPhotoMetadata _readDeviceLensMake]((uint64_t)self);
  return self->_deviceLensMake;
}

- (void)setDeviceLensMake:(id)a3
{
  *(_WORD *)&self->_flags |= 0x108u;
  objc_storeStrong((id *)&self->_deviceLensMake, a3);
}

- (void)_readDeviceLensModel
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 88) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPPhotoMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDeviceLensModel_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasDeviceLensModel
{
  -[GEORPPhotoMetadata _readDeviceLensModel]((uint64_t)self);
  return self->_deviceLensModel != 0;
}

- (NSString)deviceLensModel
{
  -[GEORPPhotoMetadata _readDeviceLensModel]((uint64_t)self);
  return self->_deviceLensModel;
}

- (void)setDeviceLensModel:(id)a3
{
  *(_WORD *)&self->_flags |= 0x110u;
  objc_storeStrong((id *)&self->_deviceLensModel, a3);
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
  v8.super_class = (Class)GEORPPhotoMetadata;
  -[GEORPPhotoMetadata description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORPPhotoMetadata dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPPhotoMetadata _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  const __CFString *v20;

  if (a1)
  {
    objc_msgSend((id)a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)a1, "clientImageUuid");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      if (a2)
        v6 = CFSTR("clientImageUuid");
      else
        v6 = CFSTR("client_image_uuid");
      objc_msgSend(v4, "setObject:forKey:", v5, v6);
    }

    objc_msgSend((id)a1, "imageDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      if (a2)
        v8 = CFSTR("imageDescription");
      else
        v8 = CFSTR("image_description");
      objc_msgSend(v4, "setObject:forKey:", v7, v8);
    }

    objc_msgSend((id)a1, "geotag");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      if ((a2 & 1) != 0)
        objc_msgSend(v9, "jsonRepresentation");
      else
        objc_msgSend(v9, "dictionaryRepresentation");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("geotag"));

    }
    if ((*(_WORD *)(a1 + 88) & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 64));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("size"));

    }
    objc_msgSend((id)a1, "mediaType");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      if (a2)
        v14 = CFSTR("mediaType");
      else
        v14 = CFSTR("media_type");
      objc_msgSend(v4, "setObject:forKey:", v13, v14);
    }

    if ((*(_WORD *)(a1 + 88) & 2) != 0)
    {
      v15 = *(int *)(a1 + 84);
      if (v15 >= 3)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 84));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v16 = (void *)*((_QWORD *)&off_1E1C14948 + v15);
      }
      objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("source"));

    }
    objc_msgSend((id)a1, "deviceLensMake");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      if (a2)
        v18 = CFSTR("deviceLensMake");
      else
        v18 = CFSTR("device_lens_make");
      objc_msgSend(v4, "setObject:forKey:", v17, v18);
    }

    objc_msgSend((id)a1, "deviceLensModel");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      if (a2)
        v20 = CFSTR("deviceLensModel");
      else
        v20 = CFSTR("device_lens_model");
      objc_msgSend(v4, "setObject:forKey:", v19, v20);
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
  return -[GEORPPhotoMetadata _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEORPPhotoMetadata)initWithDictionary:(id)a3
{
  return (GEORPPhotoMetadata *)-[GEORPPhotoMetadata _initWithDictionary:isJSON:](self, a3, 0);
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
  GEOLocation *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  void *v28;

  v5 = a2;
  if (!a1)
    goto LABEL_48;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_48;
  if (a3)
    v6 = CFSTR("clientImageUuid");
  else
    v6 = CFSTR("client_image_uuid");
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(a1, "setClientImageUuid:", v8);

  }
  if (a3)
    v9 = CFSTR("imageDescription");
  else
    v9 = CFSTR("image_description");
  objc_msgSend(v5, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = (void *)objc_msgSend(v10, "copy");
    objc_msgSend(a1, "setImageDescription:", v11);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("geotag"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v13 = [GEOLocation alloc];
    if ((a3 & 1) != 0)
      v14 = -[GEOLocation initWithJSON:](v13, "initWithJSON:", v12);
    else
      v14 = -[GEOLocation initWithDictionary:](v13, "initWithDictionary:", v12);
    v15 = (void *)v14;
    objc_msgSend(a1, "setGeotag:", v14);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("size"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setSize:", objc_msgSend(v16, "unsignedLongLongValue"));

  if (a3)
    v17 = CFSTR("mediaType");
  else
    v17 = CFSTR("media_type");
  objc_msgSend(v5, "objectForKeyedSubscript:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v19 = (void *)objc_msgSend(v18, "copy");
    objc_msgSend(a1, "setMediaType:", v19);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("source"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v21 = v20;
    if ((objc_msgSend(v21, "isEqualToString:", CFSTR("PHOTO_METADATA_SOURCE_UNKNOWN")) & 1) != 0)
    {
      v22 = 0;
    }
    else if ((objc_msgSend(v21, "isEqualToString:", CFSTR("PHOTO_METADATA_SOURCE_CAMERA")) & 1) != 0)
    {
      v22 = 1;
    }
    else if (objc_msgSend(v21, "isEqualToString:", CFSTR("PHOTO_METADATA_SOURCE_PHOTO_LIBRARY")))
    {
      v22 = 2;
    }
    else
    {
      v22 = 0;
    }

    goto LABEL_36;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v22 = objc_msgSend(v20, "intValue");
LABEL_36:
    objc_msgSend(a1, "setSource:", v22);
  }

  if (a3)
    v23 = CFSTR("deviceLensMake");
  else
    v23 = CFSTR("device_lens_make");
  objc_msgSend(v5, "objectForKeyedSubscript:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v25 = (void *)objc_msgSend(v24, "copy");
    objc_msgSend(a1, "setDeviceLensMake:", v25);

  }
  if (a3)
    v26 = CFSTR("deviceLensModel");
  else
    v26 = CFSTR("device_lens_model");
  objc_msgSend(v5, "objectForKeyedSubscript:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v28 = (void *)objc_msgSend(v27, "copy");
    objc_msgSend(a1, "setDeviceLensModel:", v28);

  }
LABEL_48:

  return a1;
}

- (GEORPPhotoMetadata)initWithJSON:(id)a3
{
  return (GEORPPhotoMetadata *)-[GEORPPhotoMetadata _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_264;
    else
      v8 = (int *)&readAll__nonRecursiveTag_265;
    GEORPPhotoMetadataReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    -[GEOLocation readAll:](self->_geotag, "readAll:", 1);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPPhotoMetadataIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPPhotoMetadataReadAllFrom((uint64_t)self, a3, 0);
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
  if (self->_reader && (_GEORPPhotoMetadataIsDirty((uint64_t)self) & 1) == 0)
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
    -[GEORPPhotoMetadata readAll:](self, "readAll:", 0);
    if (self->_clientImageUuid)
      PBDataWriterWriteStringField();
    if (self->_imageDescription)
      PBDataWriterWriteStringField();
    if (self->_geotag)
      PBDataWriterWriteSubmessage();
    if ((*(_WORD *)&self->_flags & 1) != 0)
      PBDataWriterWriteUint64Field();
    if (self->_mediaType)
      PBDataWriterWriteStringField();
    if ((*(_WORD *)&self->_flags & 2) != 0)
      PBDataWriterWriteInt32Field();
    if (self->_deviceLensMake)
      PBDataWriterWriteStringField();
    if (self->_deviceLensModel)
      PBDataWriterWriteStringField();
  }

}

- (void)clearSensitiveFields:(unint64_t)a3
{
  GEORPPhotoMetadataClearSensitiveFields(self, a3, 1);
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[GEORPPhotoMetadata _readGeotag]((uint64_t)self);
  return -[GEOLocation hasGreenTeaWithValue:](self->_geotag, "hasGreenTeaWithValue:", v3);
}

- (void)copyTo:(id)a3
{
  id *v4;
  id *v5;

  v5 = (id *)a3;
  -[GEORPPhotoMetadata readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 18) = self->_readerMarkPos;
  *((_DWORD *)v5 + 19) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_clientImageUuid)
    objc_msgSend(v5, "setClientImageUuid:");
  if (self->_imageDescription)
    objc_msgSend(v5, "setImageDescription:");
  v4 = v5;
  if (self->_geotag)
  {
    objc_msgSend(v5, "setGeotag:");
    v4 = v5;
  }
  if ((*(_WORD *)&self->_flags & 1) != 0)
  {
    v4[8] = (id)self->_size;
    *((_WORD *)v4 + 44) |= 1u;
  }
  if (self->_mediaType)
  {
    objc_msgSend(v5, "setMediaType:");
    v4 = v5;
  }
  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    *((_DWORD *)v4 + 21) = self->_source;
    *((_WORD *)v4 + 44) |= 2u;
  }
  if (self->_deviceLensMake)
  {
    objc_msgSend(v5, "setDeviceLensMake:");
    v4 = v5;
  }
  if (self->_deviceLensModel)
  {
    objc_msgSend(v5, "setDeviceLensModel:");
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
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x100) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEORPPhotoMetadataReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_10;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEORPPhotoMetadata readAll:](self, "readAll:", 0);
  v9 = -[NSString copyWithZone:](self->_clientImageUuid, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v9;

  v11 = -[NSString copyWithZone:](self->_imageDescription, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v11;

  v13 = -[GEOLocation copyWithZone:](self->_geotag, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v13;

  if ((*(_WORD *)&self->_flags & 1) != 0)
  {
    *(_QWORD *)(v5 + 64) = self->_size;
    *(_WORD *)(v5 + 88) |= 1u;
  }
  v15 = -[NSString copyWithZone:](self->_mediaType, "copyWithZone:", a3);
  v16 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v15;

  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 84) = self->_source;
    *(_WORD *)(v5 + 88) |= 2u;
  }
  v17 = -[NSString copyWithZone:](self->_deviceLensMake, "copyWithZone:", a3);
  v18 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v17;

  v19 = -[NSString copyWithZone:](self->_deviceLensModel, "copyWithZone:", a3);
  v8 = *(id *)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v19;
LABEL_10:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *clientImageUuid;
  NSString *imageDescription;
  GEOLocation *geotag;
  __int16 flags;
  __int16 v9;
  NSString *mediaType;
  NSString *deviceLensMake;
  NSString *deviceLensModel;
  char v13;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_25;
  -[GEORPPhotoMetadata readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  clientImageUuid = self->_clientImageUuid;
  if ((unint64_t)clientImageUuid | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](clientImageUuid, "isEqual:"))
      goto LABEL_25;
  }
  imageDescription = self->_imageDescription;
  if ((unint64_t)imageDescription | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](imageDescription, "isEqual:"))
      goto LABEL_25;
  }
  geotag = self->_geotag;
  if ((unint64_t)geotag | *((_QWORD *)v4 + 5))
  {
    if (!-[GEOLocation isEqual:](geotag, "isEqual:"))
      goto LABEL_25;
  }
  flags = (__int16)self->_flags;
  v9 = *((_WORD *)v4 + 44);
  if ((flags & 1) != 0)
  {
    if ((v9 & 1) == 0 || self->_size != *((_QWORD *)v4 + 8))
      goto LABEL_25;
  }
  else if ((v9 & 1) != 0)
  {
    goto LABEL_25;
  }
  mediaType = self->_mediaType;
  if ((unint64_t)mediaType | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](mediaType, "isEqual:"))
    {
LABEL_25:
      v13 = 0;
      goto LABEL_26;
    }
    flags = (__int16)self->_flags;
    v9 = *((_WORD *)v4 + 44);
  }
  if ((flags & 2) != 0)
  {
    if ((v9 & 2) == 0 || self->_source != *((_DWORD *)v4 + 21))
      goto LABEL_25;
  }
  else if ((v9 & 2) != 0)
  {
    goto LABEL_25;
  }
  deviceLensMake = self->_deviceLensMake;
  if ((unint64_t)deviceLensMake | *((_QWORD *)v4 + 3)
    && !-[NSString isEqual:](deviceLensMake, "isEqual:"))
  {
    goto LABEL_25;
  }
  deviceLensModel = self->_deviceLensModel;
  if ((unint64_t)deviceLensModel | *((_QWORD *)v4 + 4))
    v13 = -[NSString isEqual:](deviceLensModel, "isEqual:");
  else
    v13 = 1;
LABEL_26:

  return v13;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  unint64_t v5;
  unint64_t v6;
  NSUInteger v7;
  uint64_t v8;
  NSUInteger v9;
  NSUInteger v10;

  -[GEORPPhotoMetadata readAll:](self, "readAll:", 1);
  v3 = -[NSString hash](self->_clientImageUuid, "hash");
  v4 = -[NSString hash](self->_imageDescription, "hash");
  v5 = -[GEOLocation hash](self->_geotag, "hash");
  if ((*(_WORD *)&self->_flags & 1) != 0)
    v6 = 2654435761u * self->_size;
  else
    v6 = 0;
  v7 = -[NSString hash](self->_mediaType, "hash");
  if ((*(_WORD *)&self->_flags & 2) != 0)
    v8 = 2654435761 * self->_source;
  else
    v8 = 0;
  v9 = v4 ^ v3 ^ v5 ^ v6 ^ v7;
  v10 = v8 ^ -[NSString hash](self->_deviceLensMake, "hash");
  return v9 ^ v10 ^ -[NSString hash](self->_deviceLensModel, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  GEOLocation *geotag;
  uint64_t v6;
  _QWORD *v7;

  v7 = a3;
  objc_msgSend(v7, "readAll:", 0);
  v4 = v7;
  if (v7[2])
  {
    -[GEORPPhotoMetadata setClientImageUuid:](self, "setClientImageUuid:");
    v4 = v7;
  }
  if (v4[6])
  {
    -[GEORPPhotoMetadata setImageDescription:](self, "setImageDescription:");
    v4 = v7;
  }
  geotag = self->_geotag;
  v6 = v4[5];
  if (geotag)
  {
    if (!v6)
      goto LABEL_11;
    -[GEOLocation mergeFrom:](geotag, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_11;
    -[GEORPPhotoMetadata setGeotag:](self, "setGeotag:");
  }
  v4 = v7;
LABEL_11:
  if ((v4[11] & 1) != 0)
  {
    self->_size = v4[8];
    *(_WORD *)&self->_flags |= 1u;
  }
  if (v4[7])
  {
    -[GEORPPhotoMetadata setMediaType:](self, "setMediaType:");
    v4 = v7;
  }
  if ((v4[11] & 2) != 0)
  {
    self->_source = *((_DWORD *)v4 + 21);
    *(_WORD *)&self->_flags |= 2u;
  }
  if (v4[3])
  {
    -[GEORPPhotoMetadata setDeviceLensMake:](self, "setDeviceLensMake:");
    v4 = v7;
  }
  if (v4[4])
  {
    -[GEORPPhotoMetadata setDeviceLensModel:](self, "setDeviceLensModel:");
    v4 = v7;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaType, 0);
  objc_storeStrong((id *)&self->_imageDescription, 0);
  objc_storeStrong((id *)&self->_geotag, 0);
  objc_storeStrong((id *)&self->_deviceLensModel, 0);
  objc_storeStrong((id *)&self->_deviceLensMake, 0);
  objc_storeStrong((id *)&self->_clientImageUuid, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
