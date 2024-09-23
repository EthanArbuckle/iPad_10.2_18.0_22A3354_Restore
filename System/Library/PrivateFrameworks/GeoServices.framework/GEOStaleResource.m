@implementation GEOStaleResource

- (GEOStaleResource)init
{
  GEOStaleResource *v2;
  GEOStaleResource *v3;
  GEOStaleResource *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOStaleResource;
  v2 = -[GEOStaleResource init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOStaleResource)initWithData:(id)a3
{
  GEOStaleResource *v3;
  GEOStaleResource *v4;
  GEOStaleResource *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOStaleResource;
  v3 = -[GEOStaleResource initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readDesiredResource
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_BYTE *)(a1 + 60) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOStaleResourceReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDesiredResource_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasDesiredResource
{
  -[GEOStaleResource _readDesiredResource]((uint64_t)self);
  return self->_desiredResource != 0;
}

- (GEOResource)desiredResource
{
  -[GEOStaleResource _readDesiredResource]((uint64_t)self);
  return self->_desiredResource;
}

- (void)setDesiredResource:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x14u;
  objc_storeStrong((id *)&self->_desiredResource, a3);
}

- (void)_readFallbackResource
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_BYTE *)(a1 + 60) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOStaleResourceReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readFallbackResource_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasFallbackResource
{
  -[GEOStaleResource _readFallbackResource]((uint64_t)self);
  return self->_fallbackResource != 0;
}

- (GEOResource)fallbackResource
{
  -[GEOStaleResource _readFallbackResource]((uint64_t)self);
  return self->_fallbackResource;
}

- (void)setFallbackResource:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x18u;
  objc_storeStrong((id *)&self->_fallbackResource, a3);
}

- (double)originalTimestamp
{
  return self->_originalTimestamp;
}

- (void)setOriginalTimestamp:(double)a3
{
  *(_BYTE *)&self->_flags |= 0x11u;
  self->_originalTimestamp = a3;
}

- (void)setHasOriginalTimestamp:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3 | 0x10;
}

- (BOOL)hasOriginalTimestamp
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
  v8.super_class = (Class)GEOStaleResource;
  -[GEOStaleResource description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOStaleResource dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOStaleResource _dictionaryRepresentation:]((uint64_t)self, 0);
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
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v19[4];
  id v20;

  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)a1, "desiredResource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v5, "jsonRepresentation");
    else
      objc_msgSend(v5, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("desiredResource"));

  }
  objc_msgSend((id)a1, "fallbackResource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v8, "jsonRepresentation");
    else
      objc_msgSend(v8, "dictionaryRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("fallbackResource"));

  }
  if ((*(_BYTE *)(a1 + 60) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 40));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("originalTimestamp"));

  }
  v12 = *(void **)(a1 + 16);
  if (v12)
  {
    objc_msgSend(v12, "dictionaryRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v13, "count"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __46__GEOStaleResource__dictionaryRepresentation___block_invoke;
      v19[3] = &unk_1E1C00600;
      v16 = v15;
      v20 = v16;
      objc_msgSend(v14, "enumerateKeysAndObjectsUsingBlock:", v19);
      v17 = v16;

      v14 = v17;
    }
    objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOStaleResource _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __46__GEOStaleResource__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOStaleResource)initWithDictionary:(id)a3
{
  return (GEOStaleResource *)-[GEOStaleResource _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(char)a3 isJSON:
{
  id v5;
  void *v6;
  GEOResource *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  GEOResource *v11;
  uint64_t v12;
  void *v13;
  void *v14;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("desiredResource"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = [GEOResource alloc];
        if ((a3 & 1) != 0)
          v8 = -[GEOResource initWithJSON:](v7, "initWithJSON:", v6);
        else
          v8 = -[GEOResource initWithDictionary:](v7, "initWithDictionary:", v6);
        v9 = (void *)v8;
        objc_msgSend(a1, "setDesiredResource:", v8);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("fallbackResource"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = [GEOResource alloc];
        if ((a3 & 1) != 0)
          v12 = -[GEOResource initWithJSON:](v11, "initWithJSON:", v10);
        else
          v12 = -[GEOResource initWithDictionary:](v11, "initWithDictionary:", v10);
        v13 = (void *)v12;
        objc_msgSend(a1, "setFallbackResource:", v12);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("originalTimestamp"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v14, "doubleValue");
        objc_msgSend(a1, "setOriginalTimestamp:");
      }

    }
  }

  return a1;
}

- (GEOStaleResource)initWithJSON:(id)a3
{
  return (GEOStaleResource *)-[GEOStaleResource _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_1251;
    else
      v8 = (int *)&readAll__nonRecursiveTag_1252;
    GEOStaleResourceReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
  {
    -[GEOResource readAll:](self->_desiredResource, "readAll:", 1);
    -[GEOResource readAll:](self->_fallbackResource, "readAll:", 1);
  }
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOStaleResourceIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOStaleResourceReadAllFrom((uint64_t)self, a3, 0);
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
  if (self->_reader && (_GEOStaleResourceIsDirty((uint64_t)self) & 1) == 0)
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
    -[GEOStaleResource readAll:](self, "readAll:", 0);
    if (self->_desiredResource)
      PBDataWriterWriteSubmessage();
    v5 = v8;
    if (self->_fallbackResource)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if ((*(_BYTE *)&self->_flags & 1) != 0)
    {
      PBDataWriterWriteDoubleField();
      v5 = v8;
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v5);
  }

}

- (void)copyTo:(id)a3
{
  id *v4;

  v4 = (id *)a3;
  -[GEOStaleResource readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v4 + 1, self->_reader);
  *((_DWORD *)v4 + 12) = self->_readerMarkPos;
  *((_DWORD *)v4 + 13) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_desiredResource)
    objc_msgSend(v4, "setDesiredResource:");
  if (self->_fallbackResource)
    objc_msgSend(v4, "setFallbackResource:");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    v4[5] = *(id *)&self->_originalTimestamp;
    *((_BYTE *)v4 + 60) |= 1u;
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
  PBUnknownFields *v13;

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
      GEOStaleResourceReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_8;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOStaleResource readAll:](self, "readAll:", 0);
  v9 = -[GEOResource copyWithZone:](self->_desiredResource, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v9;

  v11 = -[GEOResource copyWithZone:](self->_fallbackResource, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v11;

  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(double *)(v5 + 40) = self->_originalTimestamp;
    *(_BYTE *)(v5 + 60) |= 1u;
  }
  v13 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v13;
LABEL_8:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  GEOResource *desiredResource;
  GEOResource *fallbackResource;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_10;
  -[GEOStaleResource readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  desiredResource = self->_desiredResource;
  if ((unint64_t)desiredResource | *((_QWORD *)v4 + 3))
  {
    if (!-[GEOResource isEqual:](desiredResource, "isEqual:"))
      goto LABEL_10;
  }
  fallbackResource = self->_fallbackResource;
  if ((unint64_t)fallbackResource | *((_QWORD *)v4 + 4))
  {
    if (!-[GEOResource isEqual:](fallbackResource, "isEqual:"))
      goto LABEL_10;
  }
  v7 = (*((_BYTE *)v4 + 60) & 1) == 0;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 1) != 0 && self->_originalTimestamp == *((double *)v4 + 5))
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
  unint64_t v4;
  unint64_t v5;
  double originalTimestamp;
  double v7;
  long double v8;
  double v9;

  -[GEOStaleResource readAll:](self, "readAll:", 1);
  v3 = -[GEOResource hash](self->_desiredResource, "hash");
  v4 = -[GEOResource hash](self->_fallbackResource, "hash");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    originalTimestamp = self->_originalTimestamp;
    v7 = -originalTimestamp;
    if (originalTimestamp >= 0.0)
      v7 = self->_originalTimestamp;
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
  _QWORD *v4;
  GEOResource *desiredResource;
  uint64_t v6;
  GEOResource *fallbackResource;
  uint64_t v8;
  _QWORD *v9;

  v9 = a3;
  objc_msgSend(v9, "readAll:", 0);
  v4 = v9;
  desiredResource = self->_desiredResource;
  v6 = v9[3];
  if (desiredResource)
  {
    if (!v6)
      goto LABEL_7;
    -[GEOResource mergeFrom:](desiredResource, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[GEOStaleResource setDesiredResource:](self, "setDesiredResource:");
  }
  v4 = v9;
LABEL_7:
  fallbackResource = self->_fallbackResource;
  v8 = v4[4];
  if (fallbackResource)
  {
    if (!v8)
      goto LABEL_13;
    -[GEOResource mergeFrom:](fallbackResource, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_13;
    -[GEOStaleResource setFallbackResource:](self, "setFallbackResource:");
  }
  v4 = v9;
LABEL_13:
  if ((*((_BYTE *)v4 + 60) & 1) != 0)
  {
    self->_originalTimestamp = (double)v4[5];
    *(_BYTE *)&self->_flags |= 1u;
  }

}

- (PBUnknownFields)unknownFields
{
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v5;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_BYTE *)&self->_flags & 2) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      v5 = reader;
      objc_sync_enter(v5);
      GEOStaleResourceReadSpecified((uint64_t)self, (unint64_t)self->_reader, unknownFields_tags_1255);
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
  *(_BYTE *)&self->_flags |= 0x12u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEOStaleResource readAll:](self, "readAll:", 0);
    -[GEOResource clearUnknownFields:](self->_desiredResource, "clearUnknownFields:", 1);
    -[GEOResource clearUnknownFields:](self->_fallbackResource, "clearUnknownFields:", 1);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fallbackResource, 0);
  objc_storeStrong((id *)&self->_desiredResource, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
