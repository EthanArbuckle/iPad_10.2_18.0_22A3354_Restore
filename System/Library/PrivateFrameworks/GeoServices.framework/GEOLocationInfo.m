@implementation GEOLocationInfo

- (GEOLocationInfo)init
{
  GEOLocationInfo *v2;
  GEOLocationInfo *v3;
  GEOLocationInfo *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOLocationInfo;
  v2 = -[GEOLocationInfo init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOLocationInfo)initWithData:(id)a3
{
  GEOLocationInfo *v3;
  GEOLocationInfo *v4;
  GEOLocationInfo *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOLocationInfo;
  v3 = -[GEOLocationInfo initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readLocationName
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
        GEOLocationInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLocationName_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasLocationName
{
  -[GEOLocationInfo _readLocationName]((uint64_t)self);
  return self->_locationName != 0;
}

- (NSString)locationName
{
  -[GEOLocationInfo _readLocationName]((uint64_t)self);
  return self->_locationName;
}

- (void)setLocationName:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x14u;
  objc_storeStrong((id *)&self->_locationName, a3);
}

- (void)_readSecondaryLocationName
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
        GEOLocationInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSecondaryLocationName_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasSecondaryLocationName
{
  -[GEOLocationInfo _readSecondaryLocationName]((uint64_t)self);
  return self->_secondaryLocationName != 0;
}

- (NSString)secondaryLocationName
{
  -[GEOLocationInfo _readSecondaryLocationName]((uint64_t)self);
  return self->_secondaryLocationName;
}

- (void)setSecondaryLocationName:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x18u;
  objc_storeStrong((id *)&self->_secondaryLocationName, a3);
}

- (void)_readLocalityName
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_BYTE *)(a1 + 60) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLocationInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLocalityName_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasLocalityName
{
  -[GEOLocationInfo _readLocalityName]((uint64_t)self);
  return self->_localityName != 0;
}

- (NSString)localityName
{
  -[GEOLocationInfo _readLocalityName]((uint64_t)self);
  return self->_localityName;
}

- (void)setLocalityName:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x12u;
  objc_storeStrong((id *)&self->_localityName, a3);
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
  v8.super_class = (Class)GEOLocationInfo;
  -[GEOLocationInfo description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOLocationInfo dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLocationInfo _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(_QWORD *)a1
{
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v18[4];
  id v19;

  if (!a1)
    return 0;
  objc_msgSend(a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "locationName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (a2)
      v6 = CFSTR("locationName");
    else
      v6 = CFSTR("location_name");
    objc_msgSend(v4, "setObject:forKey:", v5, v6);
  }

  objc_msgSend(a1, "secondaryLocationName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    if (a2)
      v8 = CFSTR("secondaryLocationName");
    else
      v8 = CFSTR("secondary_location_name");
    objc_msgSend(v4, "setObject:forKey:", v7, v8);
  }

  objc_msgSend(a1, "localityName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    if (a2)
      v10 = CFSTR("localityName");
    else
      v10 = CFSTR("locality_name");
    objc_msgSend(v4, "setObject:forKey:", v9, v10);
  }

  v11 = (void *)a1[2];
  if (v11)
  {
    objc_msgSend(v11, "dictionaryRepresentation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v12, "count"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __45__GEOLocationInfo__dictionaryRepresentation___block_invoke;
      v18[3] = &unk_1E1C00600;
      v15 = v14;
      v19 = v15;
      objc_msgSend(v13, "enumerateKeysAndObjectsUsingBlock:", v18);
      v16 = v15;

      v13 = v16;
    }
    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOLocationInfo _dictionaryRepresentation:](self, 1);
}

void __45__GEOLocationInfo__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOLocationInfo)initWithDictionary:(id)a3
{
  return (GEOLocationInfo *)-[GEOLocationInfo _initWithDictionary:isJSON:](self, a3, 0);
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
  const __CFString *v12;
  void *v13;
  void *v14;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("locationName");
      else
        v6 = CFSTR("location_name");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = (void *)objc_msgSend(v7, "copy");
        objc_msgSend(a1, "setLocationName:", v8);

      }
      if (a3)
        v9 = CFSTR("secondaryLocationName");
      else
        v9 = CFSTR("secondary_location_name");
      objc_msgSend(v5, "objectForKeyedSubscript:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = (void *)objc_msgSend(v10, "copy");
        objc_msgSend(a1, "setSecondaryLocationName:", v11);

      }
      if (a3)
        v12 = CFSTR("localityName");
      else
        v12 = CFSTR("locality_name");
      objc_msgSend(v5, "objectForKeyedSubscript:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v14 = (void *)objc_msgSend(v13, "copy");
        objc_msgSend(a1, "setLocalityName:", v14);

      }
    }
  }

  return a1;
}

- (GEOLocationInfo)initWithJSON:(id)a3
{
  return (GEOLocationInfo *)-[GEOLocationInfo _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_648;
    else
      v8 = (int *)&readAll__nonRecursiveTag_649;
    GEOLocationInfoReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLocationInfoIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLocationInfoReadAllFrom((uint64_t)self, a3, 0);
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
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_BYTE *)&self->_flags & 0x1E) == 0))
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
    -[GEOLocationInfo readAll:](self, "readAll:", 0);
    if (self->_locationName)
      PBDataWriterWriteStringField();
    v5 = v8;
    if (self->_secondaryLocationName)
    {
      PBDataWriterWriteStringField();
      v5 = v8;
    }
    if (self->_localityName)
    {
      PBDataWriterWriteStringField();
      v5 = v8;
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v5);
  }

}

- (void)copyTo:(id)a3
{
  id *v4;
  id *v5;

  v5 = (id *)a3;
  -[GEOLocationInfo readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 12) = self->_readerMarkPos;
  *((_DWORD *)v5 + 13) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_locationName)
    objc_msgSend(v5, "setLocationName:");
  if (self->_secondaryLocationName)
    objc_msgSend(v5, "setSecondaryLocationName:");
  v4 = v5;
  if (self->_localityName)
  {
    objc_msgSend(v5, "setLocalityName:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
    goto LABEL_5;
  v7 = reader;
  objc_sync_enter(v7);
  if ((*(_BYTE *)&self->_flags & 0x10) != 0)
  {
    objc_sync_exit(v7);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOLocationInfo readAll:](self, "readAll:", 0);
    v8 = -[NSString copyWithZone:](self->_locationName, "copyWithZone:", a3);
    v9 = *(void **)(v5 + 32);
    *(_QWORD *)(v5 + 32) = v8;

    v10 = -[NSString copyWithZone:](self->_secondaryLocationName, "copyWithZone:", a3);
    v11 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v10;

    v12 = -[NSString copyWithZone:](self->_localityName, "copyWithZone:", a3);
    v13 = *(void **)(v5 + 24);
    *(_QWORD *)(v5 + 24) = v12;

    objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
    return (id)v5;
  }
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  GEOLocationInfoReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *locationName;
  NSString *secondaryLocationName;
  NSString *localityName;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((-[GEOLocationInfo readAll:](self, "readAll:", 1),
         objc_msgSend(v4, "readAll:", 1),
         locationName = self->_locationName,
         !((unint64_t)locationName | v4[4]))
     || -[NSString isEqual:](locationName, "isEqual:"))
    && ((secondaryLocationName = self->_secondaryLocationName, !((unint64_t)secondaryLocationName | v4[5]))
     || -[NSString isEqual:](secondaryLocationName, "isEqual:")))
  {
    localityName = self->_localityName;
    if ((unint64_t)localityName | v4[3])
      v8 = -[NSString isEqual:](localityName, "isEqual:");
    else
      v8 = 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;

  -[GEOLocationInfo readAll:](self, "readAll:", 1);
  v3 = -[NSString hash](self->_locationName, "hash");
  v4 = -[NSString hash](self->_secondaryLocationName, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_localityName, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;

  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  if (v4[4])
    -[GEOLocationInfo setLocationName:](self, "setLocationName:");
  if (v4[5])
    -[GEOLocationInfo setSecondaryLocationName:](self, "setSecondaryLocationName:");
  if (v4[3])
    -[GEOLocationInfo setLocalityName:](self, "setLocalityName:");

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
      GEOLocationInfoReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_652);
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
  *(_BYTE *)&self->_flags |= 0x11u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
    -[GEOLocationInfo readAll:](self, "readAll:", 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryLocationName, 0);
  objc_storeStrong((id *)&self->_locationName, 0);
  objc_storeStrong((id *)&self->_localityName, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
