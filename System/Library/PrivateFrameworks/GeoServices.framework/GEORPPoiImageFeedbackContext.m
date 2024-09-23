@implementation GEORPPoiImageFeedbackContext

- (GEORPPoiImageFeedbackContext)init
{
  GEORPPoiImageFeedbackContext *v2;
  GEORPPoiImageFeedbackContext *v3;
  GEORPPoiImageFeedbackContext *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEORPPoiImageFeedbackContext;
  v2 = -[GEORPPoiImageFeedbackContext init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPPoiImageFeedbackContext)initWithData:(id)a3
{
  GEORPPoiImageFeedbackContext *v3;
  GEORPPoiImageFeedbackContext *v4;
  GEORPPoiImageFeedbackContext *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEORPPoiImageFeedbackContext;
  v3 = -[GEORPPoiImageFeedbackContext initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readPlace
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
        GEORPPoiImageFeedbackContextReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPlace_tags_2722);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasPlace
{
  -[GEORPPoiImageFeedbackContext _readPlace]((uint64_t)self);
  return self->_place != 0;
}

- (GEOPDPlace)place
{
  -[GEORPPoiImageFeedbackContext _readPlace]((uint64_t)self);
  return self->_place;
}

- (void)setPlace:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x28u;
  objc_storeStrong((id *)&self->_place, a3);
}

- (void)_readProviderImageId
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
        GEORPPoiImageFeedbackContextReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readProviderImageId_tags_2723);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasProviderImageId
{
  -[GEORPPoiImageFeedbackContext _readProviderImageId]((uint64_t)self);
  return self->_providerImageId != 0;
}

- (NSString)providerImageId
{
  -[GEORPPoiImageFeedbackContext _readProviderImageId]((uint64_t)self);
  return self->_providerImageId;
}

- (void)setProviderImageId:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x30u;
  objc_storeStrong((id *)&self->_providerImageId, a3);
}

- (void)_readImageUrl
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
        GEORPPoiImageFeedbackContextReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readImageUrl_tags_2724);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasImageUrl
{
  -[GEORPPoiImageFeedbackContext _readImageUrl]((uint64_t)self);
  return self->_imageUrl != 0;
}

- (NSString)imageUrl
{
  -[GEORPPoiImageFeedbackContext _readImageUrl]((uint64_t)self);
  return self->_imageUrl;
}

- (void)setImageUrl:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x24u;
  objc_storeStrong((id *)&self->_imageUrl, a3);
}

- (void)_readImageInfo
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
        GEORPPoiImageFeedbackContextReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readImageInfo_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasImageInfo
{
  -[GEORPPoiImageFeedbackContext _readImageInfo]((uint64_t)self);
  return self->_imageInfo != 0;
}

- (GEORPFeedbackClientImageInfo)imageInfo
{
  -[GEORPPoiImageFeedbackContext _readImageInfo]((uint64_t)self);
  return self->_imageInfo;
}

- (void)setImageInfo:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x22u;
  objc_storeStrong((id *)&self->_imageInfo, a3);
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
  v8.super_class = (Class)GEORPPoiImageFeedbackContext;
  -[GEORPPoiImageFeedbackContext description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORPPoiImageFeedbackContext dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPPoiImageFeedbackContext _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(_QWORD *)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
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
  objc_msgSend(a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "place");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v5, "jsonRepresentation");
    else
      objc_msgSend(v5, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("place"));

  }
  objc_msgSend(a1, "providerImageId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    if (a2)
      v9 = CFSTR("providerImageId");
    else
      v9 = CFSTR("provider_image_id");
    objc_msgSend(v4, "setObject:forKey:", v8, v9);
  }

  objc_msgSend(a1, "imageUrl");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    if (a2)
      v11 = CFSTR("imageUrl");
    else
      v11 = CFSTR("image_url");
    objc_msgSend(v4, "setObject:forKey:", v10, v11);
  }

  objc_msgSend(a1, "imageInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v12, "jsonRepresentation");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = CFSTR("imageInfo");
    }
    else
    {
      objc_msgSend(v12, "dictionaryRepresentation");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = CFSTR("image_info");
    }
    objc_msgSend(v4, "setObject:forKey:", v14, v15);

  }
  v16 = (void *)a1[2];
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
      v23[2] = __58__GEORPPoiImageFeedbackContext__dictionaryRepresentation___block_invoke;
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
  return -[GEORPPoiImageFeedbackContext _dictionaryRepresentation:](self, 1);
}

void __58__GEORPPoiImageFeedbackContext__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEORPPoiImageFeedbackContext)initWithDictionary:(id)a3
{
  return (GEORPPoiImageFeedbackContext *)-[GEORPPoiImageFeedbackContext _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  void *v6;
  GEOPDPlace *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  GEORPFeedbackClientImageInfo *v18;
  uint64_t v19;
  void *v20;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("place"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = [GEOPDPlace alloc];
        if ((a3 & 1) != 0)
          v8 = -[GEOPDPlace initWithJSON:](v7, "initWithJSON:", v6);
        else
          v8 = -[GEOPDPlace initWithDictionary:](v7, "initWithDictionary:", v6);
        v9 = (void *)v8;
        objc_msgSend(a1, "setPlace:", v8);

      }
      if (a3)
        v10 = CFSTR("providerImageId");
      else
        v10 = CFSTR("provider_image_id");
      objc_msgSend(v5, "objectForKeyedSubscript:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v12 = (void *)objc_msgSend(v11, "copy");
        objc_msgSend(a1, "setProviderImageId:", v12);

      }
      if (a3)
        v13 = CFSTR("imageUrl");
      else
        v13 = CFSTR("image_url");
      objc_msgSend(v5, "objectForKeyedSubscript:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v15 = (void *)objc_msgSend(v14, "copy");
        objc_msgSend(a1, "setImageUrl:", v15);

      }
      if (a3)
        v16 = CFSTR("imageInfo");
      else
        v16 = CFSTR("image_info");
      objc_msgSend(v5, "objectForKeyedSubscript:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v18 = [GEORPFeedbackClientImageInfo alloc];
        if ((a3 & 1) != 0)
          v19 = -[GEORPFeedbackClientImageInfo initWithJSON:](v18, "initWithJSON:", v17);
        else
          v19 = -[GEORPFeedbackClientImageInfo initWithDictionary:](v18, "initWithDictionary:", v17);
        v20 = (void *)v19;
        objc_msgSend(a1, "setImageInfo:", v19);

      }
    }
  }

  return a1;
}

- (GEORPPoiImageFeedbackContext)initWithJSON:(id)a3
{
  return (GEORPPoiImageFeedbackContext *)-[GEORPPoiImageFeedbackContext _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_2725;
    else
      v8 = (int *)&readAll__nonRecursiveTag_2726;
    GEORPPoiImageFeedbackContextReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
  {
    -[GEOPDPlace readAll:](self->_place, "readAll:", 1);
    -[GEORPFeedbackClientImageInfo readAll:](self->_imageInfo, "readAll:", 1);
  }
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPPoiImageFeedbackContextIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPPoiImageFeedbackContextReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  id v5;
  PBDataReader *v6;
  void *v7;
  id v8;

  v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && !_GEORPPoiImageFeedbackContextIsDirty((uint64_t)self))
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
    -[GEORPPoiImageFeedbackContext readAll:](self, "readAll:", 0);
    if (self->_place)
      PBDataWriterWriteSubmessage();
    v5 = v8;
    if (self->_providerImageId)
    {
      PBDataWriterWriteStringField();
      v5 = v8;
    }
    if (self->_imageUrl)
    {
      PBDataWriterWriteStringField();
      v5 = v8;
    }
    if (self->_imageInfo)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v5);
  }

}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[GEORPPoiImageFeedbackContext _readPlace]((uint64_t)self);
  return -[GEOPDPlace hasGreenTeaWithValue:](self->_place, "hasGreenTeaWithValue:", v3);
}

- (void)copyTo:(id)a3
{
  id *v4;
  id *v5;

  v5 = (id *)a3;
  -[GEORPPoiImageFeedbackContext readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 14) = self->_readerMarkPos;
  *((_DWORD *)v5 + 15) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_place)
    objc_msgSend(v5, "setPlace:");
  if (self->_providerImageId)
    objc_msgSend(v5, "setProviderImageId:");
  v4 = v5;
  if (self->_imageUrl)
  {
    objc_msgSend(v5, "setImageUrl:");
    v4 = v5;
  }
  if (self->_imageInfo)
  {
    objc_msgSend(v5, "setImageInfo:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
    goto LABEL_5;
  v7 = reader;
  objc_sync_enter(v7);
  if ((*(_BYTE *)&self->_flags & 0x20) != 0)
  {
    objc_sync_exit(v7);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEORPPoiImageFeedbackContext readAll:](self, "readAll:", 0);
    v8 = -[GEOPDPlace copyWithZone:](self->_place, "copyWithZone:", a3);
    v9 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v8;

    v10 = -[NSString copyWithZone:](self->_providerImageId, "copyWithZone:", a3);
    v11 = *(void **)(v5 + 48);
    *(_QWORD *)(v5 + 48) = v10;

    v12 = -[NSString copyWithZone:](self->_imageUrl, "copyWithZone:", a3);
    v13 = *(void **)(v5 + 32);
    *(_QWORD *)(v5 + 32) = v12;

    v14 = -[GEORPFeedbackClientImageInfo copyWithZone:](self->_imageInfo, "copyWithZone:", a3);
    v15 = *(void **)(v5 + 24);
    *(_QWORD *)(v5 + 24) = v14;

    objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
    return (id)v5;
  }
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  GEORPPoiImageFeedbackContextReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  GEOPDPlace *place;
  NSString *providerImageId;
  NSString *imageUrl;
  GEORPFeedbackClientImageInfo *imageInfo;
  char v9;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((-[GEORPPoiImageFeedbackContext readAll:](self, "readAll:", 1),
         objc_msgSend(v4, "readAll:", 1),
         place = self->_place,
         !((unint64_t)place | v4[5]))
     || -[GEOPDPlace isEqual:](place, "isEqual:"))
    && ((providerImageId = self->_providerImageId, !((unint64_t)providerImageId | v4[6]))
     || -[NSString isEqual:](providerImageId, "isEqual:"))
    && ((imageUrl = self->_imageUrl, !((unint64_t)imageUrl | v4[4]))
     || -[NSString isEqual:](imageUrl, "isEqual:")))
  {
    imageInfo = self->_imageInfo;
    if ((unint64_t)imageInfo | v4[3])
      v9 = -[GEORPFeedbackClientImageInfo isEqual:](imageInfo, "isEqual:");
    else
      v9 = 1;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  NSUInteger v5;

  -[GEORPPoiImageFeedbackContext readAll:](self, "readAll:", 1);
  v3 = -[GEOPDPlace hash](self->_place, "hash");
  v4 = -[NSString hash](self->_providerImageId, "hash") ^ v3;
  v5 = -[NSString hash](self->_imageUrl, "hash");
  return v4 ^ v5 ^ -[GEORPFeedbackClientImageInfo hash](self->_imageInfo, "hash");
}

- (void)mergeFrom:(id)a3
{
  GEOPDPlace *place;
  uint64_t v5;
  GEORPFeedbackClientImageInfo *imageInfo;
  uint64_t v7;
  _QWORD *v8;

  v8 = a3;
  objc_msgSend(v8, "readAll:", 0);
  place = self->_place;
  v5 = v8[5];
  if (place)
  {
    if (v5)
      -[GEOPDPlace mergeFrom:](place, "mergeFrom:");
  }
  else if (v5)
  {
    -[GEORPPoiImageFeedbackContext setPlace:](self, "setPlace:");
  }
  if (v8[6])
    -[GEORPPoiImageFeedbackContext setProviderImageId:](self, "setProviderImageId:");
  if (v8[4])
    -[GEORPPoiImageFeedbackContext setImageUrl:](self, "setImageUrl:");
  imageInfo = self->_imageInfo;
  v7 = v8[3];
  if (imageInfo)
  {
    if (v7)
      -[GEORPFeedbackClientImageInfo mergeFrom:](imageInfo, "mergeFrom:");
  }
  else if (v7)
  {
    -[GEORPPoiImageFeedbackContext setImageInfo:](self, "setImageInfo:");
  }

}

- (PBUnknownFields)unknownFields
{
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v5;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_BYTE *)&self->_flags & 1) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      v5 = reader;
      objc_sync_enter(v5);
      GEORPPoiImageFeedbackContextReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_2729);
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
  *(_BYTE *)&self->_flags |= 0x21u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEORPPoiImageFeedbackContext readAll:](self, "readAll:", 0);
    -[GEOPDPlace clearUnknownFields:](self->_place, "clearUnknownFields:", 1);
    -[GEORPFeedbackClientImageInfo clearUnknownFields:](self->_imageInfo, "clearUnknownFields:", 1);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_providerImageId, 0);
  objc_storeStrong((id *)&self->_place, 0);
  objc_storeStrong((id *)&self->_imageUrl, 0);
  objc_storeStrong((id *)&self->_imageInfo, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
