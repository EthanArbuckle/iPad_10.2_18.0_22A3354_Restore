@implementation GEOMapItemStorageUserValues

- (GEOMapItemStorageUserValues)init
{
  GEOMapItemStorageUserValues *v2;
  GEOMapItemStorageUserValues *v3;
  GEOMapItemStorageUserValues *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOMapItemStorageUserValues;
  v2 = -[GEOMapItemStorageUserValues init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOMapItemStorageUserValues)initWithData:(id)a3
{
  GEOMapItemStorageUserValues *v3;
  GEOMapItemStorageUserValues *v4;
  GEOMapItemStorageUserValues *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOMapItemStorageUserValues;
  v3 = -[GEOMapItemStorageUserValues initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readName
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_BYTE *)(a1 + 76) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOMapItemStorageUserValuesReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readName_tags_1033);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasName
{
  -[GEOMapItemStorageUserValues _readName]((uint64_t)self);
  return self->_name != 0;
}

- (NSString)name
{
  -[GEOMapItemStorageUserValues _readName]((uint64_t)self);
  return self->_name;
}

- (void)setName:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x42u;
  objc_storeStrong((id *)&self->_name, a3);
}

- (void)_readPhoneNumber
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_BYTE *)(a1 + 76) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOMapItemStorageUserValuesReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPhoneNumber_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasPhoneNumber
{
  -[GEOMapItemStorageUserValues _readPhoneNumber]((uint64_t)self);
  return self->_phoneNumber != 0;
}

- (NSString)phoneNumber
{
  -[GEOMapItemStorageUserValues _readPhoneNumber]((uint64_t)self);
  return self->_phoneNumber;
}

- (void)setPhoneNumber:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x44u;
  objc_storeStrong((id *)&self->_phoneNumber, a3);
}

- (void)_readUrl
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_BYTE *)(a1 + 76) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOMapItemStorageUserValuesReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readUrl_tags_7);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasUrl
{
  -[GEOMapItemStorageUserValues _readUrl]((uint64_t)self);
  return self->_url != 0;
}

- (NSString)url
{
  -[GEOMapItemStorageUserValues _readUrl]((uint64_t)self);
  return self->_url;
}

- (void)setUrl:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x60u;
  objc_storeStrong((id *)&self->_url, a3);
}

- (void)_readTimeZoneName
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_BYTE *)(a1 + 76) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOMapItemStorageUserValuesReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTimeZoneName_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasTimeZoneName
{
  -[GEOMapItemStorageUserValues _readTimeZoneName]((uint64_t)self);
  return self->_timeZoneName != 0;
}

- (NSString)timeZoneName
{
  -[GEOMapItemStorageUserValues _readTimeZoneName]((uint64_t)self);
  return self->_timeZoneName;
}

- (void)setTimeZoneName:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x50u;
  objc_storeStrong((id *)&self->_timeZoneName, a3);
}

- (void)_readTimeZoneData
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_BYTE *)(a1 + 76) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOMapItemStorageUserValuesReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTimeZoneData_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasTimeZoneData
{
  -[GEOMapItemStorageUserValues _readTimeZoneData]((uint64_t)self);
  return self->_timeZoneData != 0;
}

- (NSData)timeZoneData
{
  -[GEOMapItemStorageUserValues _readTimeZoneData]((uint64_t)self);
  return self->_timeZoneData;
}

- (void)setTimeZoneData:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x48u;
  objc_storeStrong((id *)&self->_timeZoneData, a3);
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
  v8.super_class = (Class)GEOMapItemStorageUserValues;
  -[GEOMapItemStorageUserValues description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOMapItemStorageUserValues dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOMapItemStorageUserValues _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(_QWORD *)a1
{
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  _QWORD v21[4];
  id v22;

  if (!a1)
    return 0;
  objc_msgSend(a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("name"));

  objc_msgSend(a1, "phoneNumber");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    if (a2)
      v7 = CFSTR("phoneNumber");
    else
      v7 = CFSTR("phone_number");
    objc_msgSend(v4, "setObject:forKey:", v6, v7);
  }

  objc_msgSend(a1, "url");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("url"));

  objc_msgSend(a1, "timeZoneName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    if (a2)
      v10 = CFSTR("timeZoneName");
    else
      v10 = CFSTR("time_zone_name");
    objc_msgSend(v4, "setObject:forKey:", v9, v10);
  }

  objc_msgSend(a1, "timeZoneData");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v11, "base64EncodedStringWithOptions:", 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("timeZoneData"));

    }
    else
    {
      objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("time_zone_data"));
    }
  }

  v14 = (void *)a1[2];
  if (v14)
  {
    objc_msgSend(v14, "dictionaryRepresentation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v15, "count"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __57__GEOMapItemStorageUserValues__dictionaryRepresentation___block_invoke;
      v21[3] = &unk_1E1C00600;
      v18 = v17;
      v22 = v18;
      objc_msgSend(v16, "enumerateKeysAndObjectsUsingBlock:", v21);
      v19 = v18;

      v16 = v19;
    }
    objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOMapItemStorageUserValues _dictionaryRepresentation:](self, 1);
}

void __57__GEOMapItemStorageUserValues__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOMapItemStorageUserValues)initWithDictionary:(id)a3
{
  return (GEOMapItemStorageUserValues *)-[GEOMapItemStorageUserValues _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  void *v18;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("name"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = (void *)objc_msgSend(v6, "copy");
        objc_msgSend(a1, "setName:", v7);

      }
      if (a3)
        v8 = CFSTR("phoneNumber");
      else
        v8 = CFSTR("phone_number");
      objc_msgSend(v5, "objectForKeyedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v10 = (void *)objc_msgSend(v9, "copy");
        objc_msgSend(a1, "setPhoneNumber:", v10);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("url"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v12 = (void *)objc_msgSend(v11, "copy");
        objc_msgSend(a1, "setUrl:", v12);

      }
      if (a3)
        v13 = CFSTR("timeZoneName");
      else
        v13 = CFSTR("time_zone_name");
      objc_msgSend(v5, "objectForKeyedSubscript:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v15 = (void *)objc_msgSend(v14, "copy");
        objc_msgSend(a1, "setTimeZoneName:", v15);

      }
      if (a3)
        v16 = CFSTR("timeZoneData");
      else
        v16 = CFSTR("time_zone_data");
      objc_msgSend(v5, "objectForKeyedSubscript:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v17, 0);
        objc_msgSend(a1, "setTimeZoneData:", v18);

      }
    }
  }

  return a1;
}

- (GEOMapItemStorageUserValues)initWithJSON:(id)a3
{
  return (GEOMapItemStorageUserValues *)-[GEOMapItemStorageUserValues _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_1048;
    else
      v8 = (int *)&readAll__nonRecursiveTag_1049;
    GEOMapItemStorageUserValuesReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOMapItemStorageUserValuesIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOMapItemStorageUserValuesReadAllFrom((uint64_t)self, a3, 0);
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
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_BYTE *)&self->_flags & 0x7E) == 0))
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
    -[GEOMapItemStorageUserValues readAll:](self, "readAll:", 0);
    if (self->_name)
      PBDataWriterWriteStringField();
    v5 = v8;
    if (self->_phoneNumber)
    {
      PBDataWriterWriteStringField();
      v5 = v8;
    }
    if (self->_url)
    {
      PBDataWriterWriteStringField();
      v5 = v8;
    }
    if (self->_timeZoneName)
    {
      PBDataWriterWriteStringField();
      v5 = v8;
    }
    if (self->_timeZoneData)
    {
      PBDataWriterWriteDataField();
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
  -[GEOMapItemStorageUserValues readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 16) = self->_readerMarkPos;
  *((_DWORD *)v5 + 17) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_name)
    objc_msgSend(v5, "setName:");
  if (self->_phoneNumber)
    objc_msgSend(v5, "setPhoneNumber:");
  v4 = v5;
  if (self->_url)
  {
    objc_msgSend(v5, "setUrl:");
    v4 = v5;
  }
  if (self->_timeZoneName)
  {
    objc_msgSend(v5, "setTimeZoneName:");
    v4 = v5;
  }
  if (self->_timeZoneData)
  {
    objc_msgSend(v5, "setTimeZoneData:");
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
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
    goto LABEL_5;
  v7 = reader;
  objc_sync_enter(v7);
  if ((*(_BYTE *)&self->_flags & 0x40) != 0)
  {
    objc_sync_exit(v7);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOMapItemStorageUserValues readAll:](self, "readAll:", 0);
    v8 = -[NSString copyWithZone:](self->_name, "copyWithZone:", a3);
    v9 = *(void **)(v5 + 24);
    *(_QWORD *)(v5 + 24) = v8;

    v10 = -[NSString copyWithZone:](self->_phoneNumber, "copyWithZone:", a3);
    v11 = *(void **)(v5 + 32);
    *(_QWORD *)(v5 + 32) = v10;

    v12 = -[NSString copyWithZone:](self->_url, "copyWithZone:", a3);
    v13 = *(void **)(v5 + 56);
    *(_QWORD *)(v5 + 56) = v12;

    v14 = -[NSString copyWithZone:](self->_timeZoneName, "copyWithZone:", a3);
    v15 = *(void **)(v5 + 48);
    *(_QWORD *)(v5 + 48) = v14;

    v16 = -[NSData copyWithZone:](self->_timeZoneData, "copyWithZone:", a3);
    v17 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v16;

    objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
    return (id)v5;
  }
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  GEOMapItemStorageUserValuesReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *name;
  NSString *phoneNumber;
  NSString *url;
  NSString *timeZoneName;
  NSData *timeZoneData;
  char v10;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((-[GEOMapItemStorageUserValues readAll:](self, "readAll:", 1),
         objc_msgSend(v4, "readAll:", 1),
         name = self->_name,
         !((unint64_t)name | v4[3]))
     || -[NSString isEqual:](name, "isEqual:"))
    && ((phoneNumber = self->_phoneNumber, !((unint64_t)phoneNumber | v4[4]))
     || -[NSString isEqual:](phoneNumber, "isEqual:"))
    && ((url = self->_url, !((unint64_t)url | v4[7])) || -[NSString isEqual:](url, "isEqual:"))
    && ((timeZoneName = self->_timeZoneName, !((unint64_t)timeZoneName | v4[6]))
     || -[NSString isEqual:](timeZoneName, "isEqual:")))
  {
    timeZoneData = self->_timeZoneData;
    if ((unint64_t)timeZoneData | v4[5])
      v10 = -[NSData isEqual:](timeZoneData, "isEqual:");
    else
      v10 = 1;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;

  -[GEOMapItemStorageUserValues readAll:](self, "readAll:", 1);
  v3 = -[NSString hash](self->_name, "hash");
  v4 = -[NSString hash](self->_phoneNumber, "hash") ^ v3;
  v5 = -[NSString hash](self->_url, "hash");
  v6 = v4 ^ v5 ^ -[NSString hash](self->_timeZoneName, "hash");
  return v6 ^ -[NSData hash](self->_timeZoneData, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;

  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  if (v4[3])
    -[GEOMapItemStorageUserValues setName:](self, "setName:");
  if (v4[4])
    -[GEOMapItemStorageUserValues setPhoneNumber:](self, "setPhoneNumber:");
  if (v4[7])
    -[GEOMapItemStorageUserValues setUrl:](self, "setUrl:");
  if (v4[6])
    -[GEOMapItemStorageUserValues setTimeZoneName:](self, "setTimeZoneName:");
  if (v4[5])
    -[GEOMapItemStorageUserValues setTimeZoneData:](self, "setTimeZoneData:");

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
      GEOMapItemStorageUserValuesReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_1052);
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
  *(_BYTE *)&self->_flags |= 0x41u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
    -[GEOMapItemStorageUserValues readAll:](self, "readAll:", 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_timeZoneName, 0);
  objc_storeStrong((id *)&self->_timeZoneData, 0);
  objc_storeStrong((id *)&self->_phoneNumber, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
