@implementation GEORPPoiImageFeedback

- (GEORPPoiImageFeedback)init
{
  GEORPPoiImageFeedback *v2;
  GEORPPoiImageFeedback *v3;
  GEORPPoiImageFeedback *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEORPPoiImageFeedback;
  v2 = -[GEORPPoiImageFeedback init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPPoiImageFeedback)initWithData:(id)a3
{
  GEORPPoiImageFeedback *v3;
  GEORPPoiImageFeedback *v4;
  GEORPPoiImageFeedback *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEORPPoiImageFeedback;
  v3 = -[GEORPPoiImageFeedback initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readPoiImageContext
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
        GEORPPoiImageFeedbackReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPoiImageContext_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasPoiImageContext
{
  -[GEORPPoiImageFeedback _readPoiImageContext]((uint64_t)self);
  return self->_poiImageContext != 0;
}

- (GEORPPoiImageFeedbackContext)poiImageContext
{
  -[GEORPPoiImageFeedback _readPoiImageContext]((uint64_t)self);
  return self->_poiImageContext;
}

- (void)setPoiImageContext:(id)a3
{
  *(_BYTE *)&self->_flags |= 0xAu;
  objc_storeStrong((id *)&self->_poiImageContext, a3);
}

- (void)_readPoiImageCorrections
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
        GEORPPoiImageFeedbackReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPoiImageCorrections_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasPoiImageCorrections
{
  -[GEORPPoiImageFeedback _readPoiImageCorrections]((uint64_t)self);
  return self->_poiImageCorrections != 0;
}

- (GEORPPoiImageFeedbackCorrections)poiImageCorrections
{
  -[GEORPPoiImageFeedback _readPoiImageCorrections]((uint64_t)self);
  return self->_poiImageCorrections;
}

- (void)setPoiImageCorrections:(id)a3
{
  *(_BYTE *)&self->_flags |= 0xCu;
  objc_storeStrong((id *)&self->_poiImageCorrections, a3);
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
  v8.super_class = (Class)GEORPPoiImageFeedback;
  -[GEORPPoiImageFeedback description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORPPoiImageFeedback dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPPoiImageFeedback _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(_QWORD *)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  _QWORD v20[4];
  id v21;

  if (!a1)
    return 0;
  objc_msgSend(a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "poiImageContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v5, "jsonRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = CFSTR("poiImageContext");
    }
    else
    {
      objc_msgSend(v5, "dictionaryRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = CFSTR("poi_image_context");
    }
    objc_msgSend(v4, "setObject:forKey:", v7, v8);

  }
  objc_msgSend(a1, "poiImageCorrections");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v9, "jsonRepresentation");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = CFSTR("poiImageCorrections");
    }
    else
    {
      objc_msgSend(v9, "dictionaryRepresentation");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = CFSTR("poi_image_corrections");
    }
    objc_msgSend(v4, "setObject:forKey:", v11, v12);

  }
  v13 = (void *)a1[2];
  if (v13)
  {
    objc_msgSend(v13, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v14, "count"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __51__GEORPPoiImageFeedback__dictionaryRepresentation___block_invoke;
      v20[3] = &unk_1E1C00600;
      v17 = v16;
      v21 = v17;
      objc_msgSend(v15, "enumerateKeysAndObjectsUsingBlock:", v20);
      v18 = v17;

      v15 = v18;
    }
    objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEORPPoiImageFeedback _dictionaryRepresentation:](self, 1);
}

void __51__GEORPPoiImageFeedback__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEORPPoiImageFeedback)initWithDictionary:(id)a3
{
  return (GEORPPoiImageFeedback *)-[GEORPPoiImageFeedback _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  GEORPPoiImageFeedbackContext *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  GEORPPoiImageFeedbackCorrections *v13;
  uint64_t v14;
  void *v15;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("poiImageContext");
      else
        v6 = CFSTR("poi_image_context");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = [GEORPPoiImageFeedbackContext alloc];
        if ((a3 & 1) != 0)
          v9 = -[GEORPPoiImageFeedbackContext initWithJSON:](v8, "initWithJSON:", v7);
        else
          v9 = -[GEORPPoiImageFeedbackContext initWithDictionary:](v8, "initWithDictionary:", v7);
        v10 = (void *)v9;
        objc_msgSend(a1, "setPoiImageContext:", v9);

      }
      if (a3)
        v11 = CFSTR("poiImageCorrections");
      else
        v11 = CFSTR("poi_image_corrections");
      objc_msgSend(v5, "objectForKeyedSubscript:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v13 = [GEORPPoiImageFeedbackCorrections alloc];
        if ((a3 & 1) != 0)
          v14 = -[GEORPPoiImageFeedbackCorrections initWithJSON:](v13, "initWithJSON:", v12);
        else
          v14 = -[GEORPPoiImageFeedbackCorrections initWithDictionary:](v13, "initWithDictionary:", v12);
        v15 = (void *)v14;
        objc_msgSend(a1, "setPoiImageCorrections:", v14);

      }
    }
  }

  return a1;
}

- (GEORPPoiImageFeedback)initWithJSON:(id)a3
{
  return (GEORPPoiImageFeedback *)-[GEORPPoiImageFeedback _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_2697;
    else
      v8 = (int *)&readAll__nonRecursiveTag_2698;
    GEORPPoiImageFeedbackReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
  {
    -[GEORPPoiImageFeedbackContext readAll:](self->_poiImageContext, "readAll:", 1);
    -[GEORPPoiImageFeedbackCorrections readAll:](self->_poiImageCorrections, "readAll:", 1);
  }
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPPoiImageFeedbackIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPPoiImageFeedbackReadAllFrom((uint64_t)self, a3, 0);
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
  if (self->_reader && (_GEORPPoiImageFeedbackIsDirty((uint64_t)self) & 1) == 0)
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
    -[GEORPPoiImageFeedback readAll:](self, "readAll:", 0);
    if (self->_poiImageContext)
      PBDataWriterWriteSubmessage();
    v5 = v8;
    if (self->_poiImageCorrections)
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
  -[GEORPPoiImageFeedback _readPoiImageContext]((uint64_t)self);
  return -[GEORPPoiImageFeedbackContext hasGreenTeaWithValue:](self->_poiImageContext, "hasGreenTeaWithValue:", v3);
}

- (void)copyTo:(id)a3
{
  id *v4;

  v4 = (id *)a3;
  -[GEORPPoiImageFeedback readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v4 + 1, self->_reader);
  *((_DWORD *)v4 + 10) = self->_readerMarkPos;
  *((_DWORD *)v4 + 11) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_poiImageContext)
    objc_msgSend(v4, "setPoiImageContext:");
  if (self->_poiImageCorrections)
    objc_msgSend(v4, "setPoiImageCorrections:");

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
    goto LABEL_5;
  v7 = reader;
  objc_sync_enter(v7);
  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
    objc_sync_exit(v7);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEORPPoiImageFeedback readAll:](self, "readAll:", 0);
    v8 = -[GEORPPoiImageFeedbackContext copyWithZone:](self->_poiImageContext, "copyWithZone:", a3);
    v9 = *(void **)(v5 + 24);
    *(_QWORD *)(v5 + 24) = v8;

    v10 = -[GEORPPoiImageFeedbackCorrections copyWithZone:](self->_poiImageCorrections, "copyWithZone:", a3);
    v11 = *(void **)(v5 + 32);
    *(_QWORD *)(v5 + 32) = v10;

    objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
    return (id)v5;
  }
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  GEORPPoiImageFeedbackReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  GEORPPoiImageFeedbackContext *poiImageContext;
  GEORPPoiImageFeedbackCorrections *poiImageCorrections;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((-[GEORPPoiImageFeedback readAll:](self, "readAll:", 1),
         objc_msgSend(v4, "readAll:", 1),
         poiImageContext = self->_poiImageContext,
         !((unint64_t)poiImageContext | v4[3]))
     || -[GEORPPoiImageFeedbackContext isEqual:](poiImageContext, "isEqual:")))
  {
    poiImageCorrections = self->_poiImageCorrections;
    if ((unint64_t)poiImageCorrections | v4[4])
      v7 = -[GEORPPoiImageFeedbackCorrections isEqual:](poiImageCorrections, "isEqual:");
    else
      v7 = 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3;

  -[GEORPPoiImageFeedback readAll:](self, "readAll:", 1);
  v3 = -[GEORPPoiImageFeedbackContext hash](self->_poiImageContext, "hash");
  return -[GEORPPoiImageFeedbackCorrections hash](self->_poiImageCorrections, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  GEORPPoiImageFeedbackContext *poiImageContext;
  uint64_t v5;
  GEORPPoiImageFeedbackCorrections *poiImageCorrections;
  uint64_t v7;
  _QWORD *v8;

  v8 = a3;
  objc_msgSend(v8, "readAll:", 0);
  poiImageContext = self->_poiImageContext;
  v5 = v8[3];
  if (poiImageContext)
  {
    if (v5)
      -[GEORPPoiImageFeedbackContext mergeFrom:](poiImageContext, "mergeFrom:");
  }
  else if (v5)
  {
    -[GEORPPoiImageFeedback setPoiImageContext:](self, "setPoiImageContext:");
  }
  poiImageCorrections = self->_poiImageCorrections;
  v7 = v8[4];
  if (poiImageCorrections)
  {
    if (v7)
      -[GEORPPoiImageFeedbackCorrections mergeFrom:](poiImageCorrections, "mergeFrom:");
  }
  else if (v7)
  {
    -[GEORPPoiImageFeedback setPoiImageCorrections:](self, "setPoiImageCorrections:");
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
      GEORPPoiImageFeedbackReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_2701);
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
  *(_BYTE *)&self->_flags |= 9u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEORPPoiImageFeedback readAll:](self, "readAll:", 0);
    -[GEORPPoiImageFeedbackContext clearUnknownFields:](self->_poiImageContext, "clearUnknownFields:", 1);
    -[GEORPPoiImageFeedbackCorrections clearUnknownFields:](self->_poiImageCorrections, "clearUnknownFields:", 1);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_poiImageCorrections, 0);
  objc_storeStrong((id *)&self->_poiImageContext, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
