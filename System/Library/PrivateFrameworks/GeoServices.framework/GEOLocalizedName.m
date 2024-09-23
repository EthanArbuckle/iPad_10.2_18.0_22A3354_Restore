@implementation GEOLocalizedName

- (GEOLocalizedName)initWithPlaceDataLocalizedString:(id)a3
{
  id v4;
  GEOLocalizedName *v5;
  void *v6;
  void *v7;
  GEOLocalizedName *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GEOLocalizedName;
  v5 = -[GEOLocalizedName init](&v10, sel_init);
  if (v5)
  {
    if (objc_msgSend(v4, "hasLocale"))
    {
      objc_msgSend(v4, "locale");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEOLocalizedName setLanguageCode:](v5, "setLanguageCode:", v6);

    }
    if (objc_msgSend(v4, "hasStringValue"))
    {
      objc_msgSend(v4, "stringValue");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEOLocalizedName setName:](v5, "setName:", v7);

    }
    v8 = v5;
  }

  return v5;
}

- (GEOLocalizedName)init
{
  GEOLocalizedName *v2;
  GEOLocalizedName *v3;
  GEOLocalizedName *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOLocalizedName;
  v2 = -[GEOLocalizedName init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOLocalizedName)initWithData:(id)a3
{
  GEOLocalizedName *v3;
  GEOLocalizedName *v4;
  GEOLocalizedName *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOLocalizedName;
  v3 = -[GEOLocalizedName initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (BOOL)isDefault
{
  return self->_isDefault;
}

- (void)setIsDefault:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 0x82u;
  self->_isDefault = a3;
}

- (void)setHasIsDefault:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = -126;
  else
    v3 = 0x80;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasIsDefault
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (void)_readLanguageCode
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
        GEOLocalizedNameReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLanguageCode_tags_1);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasLanguageCode
{
  -[GEOLocalizedName _readLanguageCode]((uint64_t)self);
  return self->_languageCode != 0;
}

- (NSString)languageCode
{
  -[GEOLocalizedName _readLanguageCode]((uint64_t)self);
  return self->_languageCode;
}

- (void)setLanguageCode:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x88u;
  objc_storeStrong((id *)&self->_languageCode, a3);
}

- (void)_readNameType
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
        GEOLocalizedNameReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readNameType_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasNameType
{
  -[GEOLocalizedName _readNameType]((uint64_t)self);
  return self->_nameType != 0;
}

- (NSString)nameType
{
  -[GEOLocalizedName _readNameType]((uint64_t)self);
  return self->_nameType;
}

- (void)setNameType:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x90u;
  objc_storeStrong((id *)&self->_nameType, a3);
}

- (void)_readName
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
        GEOLocalizedNameReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readName_tags_1276);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasName
{
  -[GEOLocalizedName _readName]((uint64_t)self);
  return self->_name != 0;
}

- (NSString)name
{
  -[GEOLocalizedName _readName]((uint64_t)self);
  return self->_name;
}

- (void)setName:(id)a3
{
  *(_BYTE *)&self->_flags |= 0xA0u;
  objc_storeStrong((id *)&self->_name, a3);
}

- (unsigned)nameRank
{
  return self->_nameRank;
}

- (void)setNameRank:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 0x81u;
  self->_nameRank = a3;
}

- (void)setHasNameRank:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0x7E | a3 | 0x80;
}

- (BOOL)hasNameRank
{
  return *(_BYTE *)&self->_flags & 1;
}

- (void)_readPhoneticName
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
        GEOLocalizedNameReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPhoneticName_tags_1277);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasPhoneticName
{
  -[GEOLocalizedName _readPhoneticName]((uint64_t)self);
  return self->_phoneticName != 0;
}

- (NSString)phoneticName
{
  -[GEOLocalizedName _readPhoneticName]((uint64_t)self);
  return self->_phoneticName;
}

- (void)setPhoneticName:(id)a3
{
  *(_BYTE *)&self->_flags |= 0xC0u;
  objc_storeStrong((id *)&self->_phoneticName, a3);
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
  v8.super_class = (Class)GEOLocalizedName;
  -[GEOLocalizedName description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOLocalizedName dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLocalizedName _dictionaryRepresentation:]((uint64_t)self, 0);
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
  id v15;
  id v16;
  _QWORD v18[4];
  id v19;

  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)(a1 + 76) & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 72));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("isDefault"));

  }
  objc_msgSend((id)a1, "languageCode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("languageCode"));

  objc_msgSend((id)a1, "nameType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("nameType"));

  objc_msgSend((id)a1, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("name"));

  if ((*(_BYTE *)(a1 + 76) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 68));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("nameRank"));

  }
  objc_msgSend((id)a1, "phoneticName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("phoneticName"));

  v11 = *(void **)(a1 + 16);
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
      v18[2] = __46__GEOLocalizedName__dictionaryRepresentation___block_invoke;
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
  return -[GEOLocalizedName _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __46__GEOLocalizedName__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOLocalizedName)initWithDictionary:(id)a3
{
  return (GEOLocalizedName *)-[GEOLocalizedName _initWithDictionary:isJSON:](self, a3);
}

- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2
{
  id v3;
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

  v3 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("isDefault"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setIsDefault:", objc_msgSend(v4, "BOOLValue"));

      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("languageCode"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v6 = (void *)objc_msgSend(v5, "copy");
        objc_msgSend(a1, "setLanguageCode:", v6);

      }
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("nameType"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = (void *)objc_msgSend(v7, "copy");
        objc_msgSend(a1, "setNameType:", v8);

      }
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("name"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v10 = (void *)objc_msgSend(v9, "copy");
        objc_msgSend(a1, "setName:", v10);

      }
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("nameRank"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setNameRank:", objc_msgSend(v11, "unsignedIntValue"));

      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("phoneticName"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v13 = (void *)objc_msgSend(v12, "copy");
        objc_msgSend(a1, "setPhoneticName:", v13);

      }
    }
  }

  return a1;
}

- (GEOLocalizedName)initWithJSON:(id)a3
{
  return (GEOLocalizedName *)-[GEOLocalizedName _initWithDictionary:isJSON:](self, a3);
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
      v8 = (int *)&readAll__recursiveTag_1286;
    else
      v8 = (int *)&readAll__nonRecursiveTag_1287;
    GEOLocalizedNameReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLocalizedNameIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLocalizedNameReadAllFrom((uint64_t)self, a3, 0);
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
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), *(_BYTE *)&self->_flags <= 7u))
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
    -[GEOLocalizedName readAll:](self, "readAll:", 0);
    if ((*(_BYTE *)&self->_flags & 2) != 0)
      PBDataWriterWriteBOOLField();
    v5 = v8;
    if (self->_languageCode)
    {
      PBDataWriterWriteStringField();
      v5 = v8;
    }
    if (self->_nameType)
    {
      PBDataWriterWriteStringField();
      v5 = v8;
    }
    if (self->_name)
    {
      PBDataWriterWriteStringField();
      v5 = v8;
    }
    if ((*(_BYTE *)&self->_flags & 1) != 0)
    {
      PBDataWriterWriteUint32Field();
      v5 = v8;
    }
    if (self->_phoneticName)
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
  -[GEOLocalizedName readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 14) = self->_readerMarkPos;
  *((_DWORD *)v5 + 15) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  v4 = v5;
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    *((_BYTE *)v5 + 72) = self->_isDefault;
    *((_BYTE *)v5 + 76) |= 2u;
  }
  if (self->_languageCode)
  {
    objc_msgSend(v5, "setLanguageCode:");
    v4 = v5;
  }
  if (self->_nameType)
  {
    objc_msgSend(v5, "setNameType:");
    v4 = v5;
  }
  if (self->_name)
  {
    objc_msgSend(v5, "setName:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *((_DWORD *)v4 + 17) = self->_nameRank;
    *((_BYTE *)v4 + 76) |= 1u;
  }
  if (self->_phoneticName)
  {
    objc_msgSend(v5, "setPhoneticName:");
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
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  PBUnknownFields *v17;

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
      GEOLocalizedNameReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_10;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOLocalizedName readAll:](self, "readAll:", 0);
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    *(_BYTE *)(v5 + 72) = self->_isDefault;
    *(_BYTE *)(v5 + 76) |= 2u;
  }
  v9 = -[NSString copyWithZone:](self->_languageCode, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v9;

  v11 = -[NSString copyWithZone:](self->_nameType, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v11;

  v13 = -[NSString copyWithZone:](self->_name, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v13;

  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 68) = self->_nameRank;
    *(_BYTE *)(v5 + 76) |= 1u;
  }
  v15 = -[NSString copyWithZone:](self->_phoneticName, "copyWithZone:", a3);
  v16 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v15;

  v17 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v17;
LABEL_10:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *languageCode;
  NSString *nameType;
  NSString *name;
  NSString *phoneticName;
  char v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_23;
  -[GEOLocalizedName readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 76) & 2) != 0)
    {
      if (self->_isDefault)
      {
        if (!*((_BYTE *)v4 + 72))
          goto LABEL_23;
        goto LABEL_10;
      }
      if (!*((_BYTE *)v4 + 72))
        goto LABEL_10;
    }
LABEL_23:
    v9 = 0;
    goto LABEL_24;
  }
  if ((*((_BYTE *)v4 + 76) & 2) != 0)
    goto LABEL_23;
LABEL_10:
  languageCode = self->_languageCode;
  if ((unint64_t)languageCode | *((_QWORD *)v4 + 3)
    && !-[NSString isEqual:](languageCode, "isEqual:"))
  {
    goto LABEL_23;
  }
  nameType = self->_nameType;
  if ((unint64_t)nameType | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](nameType, "isEqual:"))
      goto LABEL_23;
  }
  name = self->_name;
  if ((unint64_t)name | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](name, "isEqual:"))
      goto LABEL_23;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 76) & 1) == 0 || self->_nameRank != *((_DWORD *)v4 + 17))
      goto LABEL_23;
  }
  else if ((*((_BYTE *)v4 + 76) & 1) != 0)
  {
    goto LABEL_23;
  }
  phoneticName = self->_phoneticName;
  if ((unint64_t)phoneticName | *((_QWORD *)v4 + 6))
    v9 = -[NSString isEqual:](phoneticName, "isEqual:");
  else
    v9 = 1;
LABEL_24:

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  uint64_t v7;

  -[GEOLocalizedName readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 2) != 0)
    v3 = 2654435761 * self->_isDefault;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_languageCode, "hash");
  v5 = -[NSString hash](self->_nameType, "hash");
  v6 = -[NSString hash](self->_name, "hash");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v7 = 2654435761 * self->_nameRank;
  else
    v7 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ -[NSString hash](self->_phoneticName, "hash");
}

- (void)mergeFrom:(id)a3
{
  BOOL *v4;
  BOOL *v5;

  v5 = (BOOL *)a3;
  objc_msgSend(v5, "readAll:", 0);
  v4 = v5;
  if ((v5[76] & 2) != 0)
  {
    self->_isDefault = v5[72];
    *(_BYTE *)&self->_flags |= 2u;
  }
  if (*((_QWORD *)v5 + 3))
  {
    -[GEOLocalizedName setLanguageCode:](self, "setLanguageCode:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 4))
  {
    -[GEOLocalizedName setNameType:](self, "setNameType:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 5))
  {
    -[GEOLocalizedName setName:](self, "setName:");
    v4 = v5;
  }
  if (v4[76])
  {
    self->_nameRank = *((_DWORD *)v4 + 17);
    *(_BYTE *)&self->_flags |= 1u;
  }
  if (*((_QWORD *)v4 + 6))
  {
    -[GEOLocalizedName setPhoneticName:](self, "setPhoneticName:");
    v4 = v5;
  }

}

- (PBUnknownFields)unknownFields
{
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v5;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_BYTE *)&self->_flags & 4) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      v5 = reader;
      objc_sync_enter(v5);
      GEOLocalizedNameReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_1290);
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
  *(_BYTE *)&self->_flags |= 0x84u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
    -[GEOLocalizedName readAll:](self, "readAll:", 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_phoneticName, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_nameType, 0);
  objc_storeStrong((id *)&self->_languageCode, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
