@implementation GEORPPhotoAttributionPreferences

- (GEORPPhotoAttributionPreferences)init
{
  GEORPPhotoAttributionPreferences *v2;
  GEORPPhotoAttributionPreferences *v3;
  GEORPPhotoAttributionPreferences *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEORPPhotoAttributionPreferences;
  v2 = -[GEORPPhotoAttributionPreferences init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPPhotoAttributionPreferences)initWithData:(id)a3
{
  GEORPPhotoAttributionPreferences *v3;
  GEORPPhotoAttributionPreferences *v4;
  GEORPPhotoAttributionPreferences *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEORPPhotoAttributionPreferences;
  v3 = -[GEORPPhotoAttributionPreferences initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readVersion
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if ((*(_BYTE *)(a1 + 48) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPPhotoAttributionPreferencesReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readVersion_tags_3);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (BOOL)hasVersion
{
  -[GEORPPhotoAttributionPreferences _readVersion]((uint64_t)self);
  return self->_version != 0;
}

- (NSString)version
{
  -[GEORPPhotoAttributionPreferences _readVersion]((uint64_t)self);
  return self->_version;
}

- (void)setVersion:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x18u;
  objc_storeStrong((id *)&self->_version, a3);
}

- (BOOL)attributePhotos
{
  return self->_attributePhotos;
}

- (void)setAttributePhotos:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 0x11u;
  self->_attributePhotos = a3;
}

- (void)setHasAttributePhotos:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3 | 0x10;
}

- (BOOL)hasAttributePhotos
{
  return *(_BYTE *)&self->_flags & 1;
}

- (void)_readAttributionName
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if ((*(_BYTE *)(a1 + 48) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPPhotoAttributionPreferencesReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAttributionName_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (BOOL)hasAttributionName
{
  -[GEORPPhotoAttributionPreferences _readAttributionName]((uint64_t)self);
  return self->_attributionName != 0;
}

- (NSString)attributionName
{
  -[GEORPPhotoAttributionPreferences _readAttributionName]((uint64_t)self);
  return self->_attributionName;
}

- (void)setAttributionName:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x14u;
  objc_storeStrong((id *)&self->_attributionName, a3);
}

- (BOOL)wasCleared
{
  return self->_wasCleared;
}

- (void)setWasCleared:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 0x12u;
  self->_wasCleared = a3;
}

- (void)setHasWasCleared:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 18;
  else
    v3 = 16;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasWasCleared
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
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
  v8.super_class = (Class)GEORPPhotoAttributionPreferences;
  -[GEORPPhotoAttributionPreferences description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORPPhotoAttributionPreferences dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPPhotoAttributionPreferences _dictionaryRepresentation:]((unsigned __int8 *)self, 0);
}

- (id)_dictionaryRepresentation:(unsigned __int8 *)a1
{
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  const __CFString *v11;

  if (a1)
  {
    objc_msgSend(a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "version");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("version"));

    if ((a1[48] & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a1[44]);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
        v7 = CFSTR("attributePhotos");
      else
        v7 = CFSTR("attribute_photos");
      objc_msgSend(v4, "setObject:forKey:", v6, v7);

    }
    objc_msgSend(a1, "attributionName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      if (a2)
        v9 = CFSTR("attributionName");
      else
        v9 = CFSTR("attribution_name");
      objc_msgSend(v4, "setObject:forKey:", v8, v9);
    }

    if ((a1[48] & 2) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a1[45]);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
        v11 = CFSTR("wasCleared");
      else
        v11 = CFSTR("was_cleared");
      objc_msgSend(v4, "setObject:forKey:", v10, v11);

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
  return -[GEORPPhotoAttributionPreferences _dictionaryRepresentation:]((unsigned __int8 *)self, 1);
}

- (GEORPPhotoAttributionPreferences)initWithDictionary:(id)a3
{
  return (GEORPPhotoAttributionPreferences *)-[GEORPPhotoAttributionPreferences _initWithDictionary:isJSON:](self, a3, 0);
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
  void *v12;
  const __CFString *v13;
  void *v14;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("version"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = (void *)objc_msgSend(v6, "copy");
        objc_msgSend(a1, "setVersion:", v7);

      }
      if (a3)
        v8 = CFSTR("attributePhotos");
      else
        v8 = CFSTR("attribute_photos");
      objc_msgSend(v5, "objectForKeyedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setAttributePhotos:", objc_msgSend(v9, "BOOLValue"));

      if (a3)
        v10 = CFSTR("attributionName");
      else
        v10 = CFSTR("attribution_name");
      objc_msgSend(v5, "objectForKeyedSubscript:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v12 = (void *)objc_msgSend(v11, "copy");
        objc_msgSend(a1, "setAttributionName:", v12);

      }
      if (a3)
        v13 = CFSTR("wasCleared");
      else
        v13 = CFSTR("was_cleared");
      objc_msgSend(v5, "objectForKeyedSubscript:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setWasCleared:", objc_msgSend(v14, "BOOLValue"));

    }
  }

  return a1;
}

- (GEORPPhotoAttributionPreferences)initWithJSON:(id)a3
{
  return (GEORPPhotoAttributionPreferences *)-[GEORPPhotoAttributionPreferences _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_57;
    else
      v8 = (int *)&readAll__nonRecursiveTag_57;
    GEORPPhotoAttributionPreferencesReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPPhotoAttributionPreferencesIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPPhotoAttributionPreferencesReadAllFrom((uint64_t)self, a3, 0);
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
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_BYTE *)&self->_flags & 0x1C) == 0))
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
    -[GEORPPhotoAttributionPreferences readAll:](self, "readAll:", 0);
    if (self->_version)
      PBDataWriterWriteStringField();
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      PBDataWriterWriteBOOLField();
    if (self->_attributionName)
      PBDataWriterWriteStringField();
    if ((*(_BYTE *)&self->_flags & 2) != 0)
      PBDataWriterWriteBOOLField();
  }

}

- (void)copyTo:(id)a3
{
  id *v4;
  id *v5;

  v5 = (id *)a3;
  -[GEORPPhotoAttributionPreferences readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 8) = self->_readerMarkPos;
  *((_DWORD *)v5 + 9) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_version)
    objc_msgSend(v5, "setVersion:");
  v4 = v5;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *((_BYTE *)v5 + 44) = self->_attributePhotos;
    *((_BYTE *)v5 + 48) |= 1u;
  }
  if (self->_attributionName)
  {
    objc_msgSend(v5, "setAttributionName:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    *((_BYTE *)v4 + 45) = self->_wasCleared;
    *((_BYTE *)v4 + 48) |= 2u;
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
      GEORPPhotoAttributionPreferencesReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEORPPhotoAttributionPreferences readAll:](self, "readAll:", 0);
  v9 = -[NSString copyWithZone:](self->_version, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v9;

  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_BYTE *)(v5 + 44) = self->_attributePhotos;
    *(_BYTE *)(v5 + 48) |= 1u;
  }
  v11 = -[NSString copyWithZone:](self->_attributionName, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v11;

  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    *(_BYTE *)(v5 + 45) = self->_wasCleared;
    *(_BYTE *)(v5 + 48) |= 2u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *version;
  char flags;
  char v7;
  NSString *attributionName;
  BOOL v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_17;
  -[GEORPPhotoAttributionPreferences readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  version = self->_version;
  if ((unint64_t)version | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](version, "isEqual:"))
      goto LABEL_17;
  }
  flags = (char)self->_flags;
  v7 = *((_BYTE *)v4 + 48);
  if ((flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 1) == 0)
      goto LABEL_17;
    if (self->_attributePhotos)
    {
      if (!*((_BYTE *)v4 + 44))
        goto LABEL_17;
    }
    else if (*((_BYTE *)v4 + 44))
    {
      goto LABEL_17;
    }
  }
  else if ((*((_BYTE *)v4 + 48) & 1) != 0)
  {
    goto LABEL_17;
  }
  attributionName = self->_attributionName;
  if ((unint64_t)attributionName | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](attributionName, "isEqual:"))
      goto LABEL_17;
    flags = (char)self->_flags;
    v7 = *((_BYTE *)v4 + 48);
  }
  v9 = (v7 & 2) == 0;
  if ((flags & 2) != 0)
  {
    if ((v7 & 2) != 0)
    {
      if (self->_wasCleared)
      {
        if (!*((_BYTE *)v4 + 45))
          goto LABEL_17;
      }
      else if (*((_BYTE *)v4 + 45))
      {
        goto LABEL_17;
      }
      v9 = 1;
      goto LABEL_18;
    }
LABEL_17:
    v9 = 0;
  }
LABEL_18:

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  NSUInteger v5;
  uint64_t v6;

  -[GEORPPhotoAttributionPreferences readAll:](self, "readAll:", 1);
  v3 = -[NSString hash](self->_version, "hash");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v4 = 2654435761 * self->_attributePhotos;
  else
    v4 = 0;
  v5 = -[NSString hash](self->_attributionName, "hash");
  if ((*(_BYTE *)&self->_flags & 2) != 0)
    v6 = 2654435761 * self->_wasCleared;
  else
    v6 = 0;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;

  v5 = a3;
  objc_msgSend(v5, "readAll:", 0);
  v4 = v5;
  if (v5[3])
  {
    -[GEORPPhotoAttributionPreferences setVersion:](self, "setVersion:");
    v4 = v5;
  }
  if ((v4[6] & 1) != 0)
  {
    self->_attributePhotos = *((_BYTE *)v4 + 44);
    *(_BYTE *)&self->_flags |= 1u;
  }
  if (v4[2])
  {
    -[GEORPPhotoAttributionPreferences setAttributionName:](self, "setAttributionName:");
    v4 = v5;
  }
  if ((v4[6] & 2) != 0)
  {
    self->_wasCleared = *((_BYTE *)v4 + 45);
    *(_BYTE *)&self->_flags |= 2u;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_attributionName, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
