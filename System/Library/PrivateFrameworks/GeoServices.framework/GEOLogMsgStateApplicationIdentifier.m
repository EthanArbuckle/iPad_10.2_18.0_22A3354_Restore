@implementation GEOLogMsgStateApplicationIdentifier

- (GEOLogMsgStateApplicationIdentifier)init
{
  GEOLogMsgStateApplicationIdentifier *v2;
  GEOLogMsgStateApplicationIdentifier *v3;
  GEOLogMsgStateApplicationIdentifier *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOLogMsgStateApplicationIdentifier;
  v2 = -[GEOLogMsgStateApplicationIdentifier init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOLogMsgStateApplicationIdentifier)initWithData:(id)a3
{
  GEOLogMsgStateApplicationIdentifier *v3;
  GEOLogMsgStateApplicationIdentifier *v4;
  GEOLogMsgStateApplicationIdentifier *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOLogMsgStateApplicationIdentifier;
  v3 = -[GEOLogMsgStateApplicationIdentifier initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readAppIdentifier
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_BYTE *)(a1 + 68) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateApplicationIdentifierReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAppIdentifier_tags_3);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasAppIdentifier
{
  -[GEOLogMsgStateApplicationIdentifier _readAppIdentifier]((uint64_t)self);
  return self->_appIdentifier != 0;
}

- (NSString)appIdentifier
{
  -[GEOLogMsgStateApplicationIdentifier _readAppIdentifier]((uint64_t)self);
  return self->_appIdentifier;
}

- (void)setAppIdentifier:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x44u;
  objc_storeStrong((id *)&self->_appIdentifier, a3);
}

- (void)_readAppMajorVersion
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_BYTE *)(a1 + 68) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateApplicationIdentifierReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAppMajorVersion_tags_2);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasAppMajorVersion
{
  -[GEOLogMsgStateApplicationIdentifier _readAppMajorVersion]((uint64_t)self);
  return self->_appMajorVersion != 0;
}

- (NSString)appMajorVersion
{
  -[GEOLogMsgStateApplicationIdentifier _readAppMajorVersion]((uint64_t)self);
  return self->_appMajorVersion;
}

- (void)setAppMajorVersion:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x48u;
  objc_storeStrong((id *)&self->_appMajorVersion, a3);
}

- (void)_readAppMinorVersion
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_BYTE *)(a1 + 68) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateApplicationIdentifierReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAppMinorVersion_tags_2);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasAppMinorVersion
{
  -[GEOLogMsgStateApplicationIdentifier _readAppMinorVersion]((uint64_t)self);
  return self->_appMinorVersion != 0;
}

- (NSString)appMinorVersion
{
  -[GEOLogMsgStateApplicationIdentifier _readAppMinorVersion]((uint64_t)self);
  return self->_appMinorVersion;
}

- (void)setAppMinorVersion:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x50u;
  objc_storeStrong((id *)&self->_appMinorVersion, a3);
}

- (BOOL)appDarkMode
{
  return self->_appDarkMode;
}

- (void)setAppDarkMode:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 0x42u;
  self->_appDarkMode = a3;
}

- (void)setHasAppDarkMode:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 66;
  else
    v3 = 64;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasAppDarkMode
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (void)_readProcessName
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_BYTE *)(a1 + 68) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateApplicationIdentifierReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readProcessName_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasProcessName
{
  -[GEOLogMsgStateApplicationIdentifier _readProcessName]((uint64_t)self);
  return self->_processName != 0;
}

- (NSString)processName
{
  -[GEOLogMsgStateApplicationIdentifier _readProcessName]((uint64_t)self);
  return self->_processName;
}

- (void)setProcessName:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x60u;
  objc_storeStrong((id *)&self->_processName, a3);
}

- (int)appType
{
  os_unfair_lock_s *p_readerLock;
  char flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 1) != 0)
    return self->_appType;
  else
    return 0;
}

- (void)setAppType:(int)a3
{
  *(_BYTE *)&self->_flags |= 0x41u;
  self->_appType = a3;
}

- (void)setHasAppType:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3 | 0x40;
}

- (BOOL)hasAppType
{
  return *(_BYTE *)&self->_flags & 1;
}

- (id)appTypeAsString:(int)a3
{
  if (a3 < 5)
    return off_1E1C230E8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsAppType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FIRST_PARTY")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SECOND_PARTY")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("THIRD_PARTY")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DAEMONS")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("END_SENTINEL")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
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
  v8.super_class = (Class)GEOLogMsgStateApplicationIdentifier;
  -[GEOLogMsgStateApplicationIdentifier description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOLogMsgStateApplicationIdentifier dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgStateApplicationIdentifier _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  const __CFString *v14;
  uint64_t v15;
  __CFString *v16;
  const __CFString *v17;

  if (a1)
  {
    objc_msgSend((id)a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)a1, "appIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      if (a2)
        v6 = CFSTR("appIdentifier");
      else
        v6 = CFSTR("app_identifier");
      objc_msgSend(v4, "setObject:forKey:", v5, v6);
    }

    objc_msgSend((id)a1, "appMajorVersion");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      if (a2)
        v8 = CFSTR("appMajorVersion");
      else
        v8 = CFSTR("app_major_version");
      objc_msgSend(v4, "setObject:forKey:", v7, v8);
    }

    objc_msgSend((id)a1, "appMinorVersion");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      if (a2)
        v10 = CFSTR("appMinorVersion");
      else
        v10 = CFSTR("app_minor_version");
      objc_msgSend(v4, "setObject:forKey:", v9, v10);
    }

    if ((*(_BYTE *)(a1 + 68) & 2) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 64));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
        v12 = CFSTR("appDarkMode");
      else
        v12 = CFSTR("app_dark_mode");
      objc_msgSend(v4, "setObject:forKey:", v11, v12);

    }
    objc_msgSend((id)a1, "processName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      if (a2)
        v14 = CFSTR("processName");
      else
        v14 = CFSTR("process_name");
      objc_msgSend(v4, "setObject:forKey:", v13, v14);
    }

    if ((*(_BYTE *)(a1 + 68) & 1) != 0)
    {
      v15 = *(int *)(a1 + 60);
      if (v15 >= 5)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 60));
        v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v16 = off_1E1C230E8[v15];
      }
      if (a2)
        v17 = CFSTR("appType");
      else
        v17 = CFSTR("app_type");
      objc_msgSend(v4, "setObject:forKey:", v16, v17);

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
  return -[GEOLogMsgStateApplicationIdentifier _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLogMsgStateApplicationIdentifier)initWithDictionary:(id)a3
{
  return (GEOLogMsgStateApplicationIdentifier *)-[GEOLogMsgStateApplicationIdentifier _initWithDictionary:isJSON:](self, a3, 0);
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
  const __CFString *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  id v22;
  uint64_t v23;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("appIdentifier");
      else
        v6 = CFSTR("app_identifier");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = (void *)objc_msgSend(v7, "copy");
        objc_msgSend(a1, "setAppIdentifier:", v8);

      }
      if (a3)
        v9 = CFSTR("appMajorVersion");
      else
        v9 = CFSTR("app_major_version");
      objc_msgSend(v5, "objectForKeyedSubscript:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = (void *)objc_msgSend(v10, "copy");
        objc_msgSend(a1, "setAppMajorVersion:", v11);

      }
      if (a3)
        v12 = CFSTR("appMinorVersion");
      else
        v12 = CFSTR("app_minor_version");
      objc_msgSend(v5, "objectForKeyedSubscript:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v14 = (void *)objc_msgSend(v13, "copy");
        objc_msgSend(a1, "setAppMinorVersion:", v14);

      }
      if (a3)
        v15 = CFSTR("appDarkMode");
      else
        v15 = CFSTR("app_dark_mode");
      objc_msgSend(v5, "objectForKeyedSubscript:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setAppDarkMode:", objc_msgSend(v16, "BOOLValue"));

      if (a3)
        v17 = CFSTR("processName");
      else
        v17 = CFSTR("process_name");
      objc_msgSend(v5, "objectForKeyedSubscript:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v19 = (void *)objc_msgSend(v18, "copy");
        objc_msgSend(a1, "setProcessName:", v19);

      }
      if (a3)
        v20 = CFSTR("appType");
      else
        v20 = CFSTR("app_type");
      objc_msgSend(v5, "objectForKeyedSubscript:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v22 = v21;
        if ((objc_msgSend(v22, "isEqualToString:", CFSTR("FIRST_PARTY")) & 1) != 0)
        {
          v23 = 0;
        }
        else if ((objc_msgSend(v22, "isEqualToString:", CFSTR("SECOND_PARTY")) & 1) != 0)
        {
          v23 = 1;
        }
        else if ((objc_msgSend(v22, "isEqualToString:", CFSTR("THIRD_PARTY")) & 1) != 0)
        {
          v23 = 2;
        }
        else if ((objc_msgSend(v22, "isEqualToString:", CFSTR("DAEMONS")) & 1) != 0)
        {
          v23 = 3;
        }
        else if (objc_msgSend(v22, "isEqualToString:", CFSTR("END_SENTINEL")))
        {
          v23 = 4;
        }
        else
        {
          v23 = 0;
        }

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_47:

          goto LABEL_48;
        }
        v23 = objc_msgSend(v21, "intValue");
      }
      objc_msgSend(a1, "setAppType:", v23);
      goto LABEL_47;
    }
  }
LABEL_48:

  return a1;
}

- (GEOLogMsgStateApplicationIdentifier)initWithJSON:(id)a3
{
  return (GEOLogMsgStateApplicationIdentifier *)-[GEOLogMsgStateApplicationIdentifier _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_5557;
    else
      v8 = (int *)&readAll__nonRecursiveTag_5558;
    GEOLogMsgStateApplicationIdentifierReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgStateApplicationIdentifierIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgStateApplicationIdentifierReadAllFrom((uint64_t)self, a3, 0);
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
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_BYTE *)&self->_flags & 0x7C) == 0))
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
    -[GEOLogMsgStateApplicationIdentifier readAll:](self, "readAll:", 0);
    if (self->_appIdentifier)
      PBDataWriterWriteStringField();
    if (self->_appMajorVersion)
      PBDataWriterWriteStringField();
    if (self->_appMinorVersion)
      PBDataWriterWriteStringField();
    if ((*(_BYTE *)&self->_flags & 2) != 0)
      PBDataWriterWriteBOOLField();
    if (self->_processName)
      PBDataWriterWriteStringField();
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      PBDataWriterWriteInt32Field();
  }

}

- (void)copyTo:(id)a3
{
  id *v4;
  id *v5;

  v5 = (id *)a3;
  -[GEOLogMsgStateApplicationIdentifier readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 12) = self->_readerMarkPos;
  *((_DWORD *)v5 + 13) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_appIdentifier)
    objc_msgSend(v5, "setAppIdentifier:");
  if (self->_appMajorVersion)
    objc_msgSend(v5, "setAppMajorVersion:");
  v4 = v5;
  if (self->_appMinorVersion)
  {
    objc_msgSend(v5, "setAppMinorVersion:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    *((_BYTE *)v4 + 64) = self->_appDarkMode;
    *((_BYTE *)v4 + 68) |= 2u;
  }
  if (self->_processName)
  {
    objc_msgSend(v5, "setProcessName:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *((_DWORD *)v4 + 15) = self->_appType;
    *((_BYTE *)v4 + 68) |= 1u;
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

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_BYTE *)&self->_flags & 0x40) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOLogMsgStateApplicationIdentifierReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOLogMsgStateApplicationIdentifier readAll:](self, "readAll:", 0);
  v9 = -[NSString copyWithZone:](self->_appIdentifier, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v9;

  v11 = -[NSString copyWithZone:](self->_appMajorVersion, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v11;

  v13 = -[NSString copyWithZone:](self->_appMinorVersion, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v13;

  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    *(_BYTE *)(v5 + 64) = self->_appDarkMode;
    *(_BYTE *)(v5 + 68) |= 2u;
  }
  v15 = -[NSString copyWithZone:](self->_processName, "copyWithZone:", a3);
  v16 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v15;

  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 60) = self->_appType;
    *(_BYTE *)(v5 + 68) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *appIdentifier;
  NSString *appMajorVersion;
  NSString *appMinorVersion;
  char flags;
  char v9;
  NSString *processName;
  BOOL v11;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_23;
  -[GEOLogMsgStateApplicationIdentifier readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  appIdentifier = self->_appIdentifier;
  if ((unint64_t)appIdentifier | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](appIdentifier, "isEqual:"))
      goto LABEL_23;
  }
  appMajorVersion = self->_appMajorVersion;
  if ((unint64_t)appMajorVersion | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](appMajorVersion, "isEqual:"))
      goto LABEL_23;
  }
  appMinorVersion = self->_appMinorVersion;
  if ((unint64_t)appMinorVersion | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](appMinorVersion, "isEqual:"))
      goto LABEL_23;
  }
  flags = (char)self->_flags;
  v9 = *((_BYTE *)v4 + 68);
  if ((flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 68) & 2) == 0)
      goto LABEL_23;
    if (self->_appDarkMode)
    {
      if (!*((_BYTE *)v4 + 64))
        goto LABEL_23;
    }
    else if (*((_BYTE *)v4 + 64))
    {
      goto LABEL_23;
    }
  }
  else if ((*((_BYTE *)v4 + 68) & 2) != 0)
  {
    goto LABEL_23;
  }
  processName = self->_processName;
  if (!((unint64_t)processName | *((_QWORD *)v4 + 5)))
    goto LABEL_19;
  if (!-[NSString isEqual:](processName, "isEqual:"))
  {
LABEL_23:
    v11 = 0;
    goto LABEL_24;
  }
  flags = (char)self->_flags;
  v9 = *((_BYTE *)v4 + 68);
LABEL_19:
  v11 = (v9 & 1) == 0;
  if ((flags & 1) != 0)
  {
    if ((v9 & 1) == 0 || self->_appType != *((_DWORD *)v4 + 15))
      goto LABEL_23;
    v11 = 1;
  }
LABEL_24:

  return v11;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  uint64_t v6;
  NSUInteger v7;
  uint64_t v8;

  -[GEOLogMsgStateApplicationIdentifier readAll:](self, "readAll:", 1);
  v3 = -[NSString hash](self->_appIdentifier, "hash");
  v4 = -[NSString hash](self->_appMajorVersion, "hash");
  v5 = -[NSString hash](self->_appMinorVersion, "hash");
  if ((*(_BYTE *)&self->_flags & 2) != 0)
    v6 = 2654435761 * self->_appDarkMode;
  else
    v6 = 0;
  v7 = -[NSString hash](self->_processName, "hash");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v8 = 2654435761 * self->_appType;
  else
    v8 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;

  v5 = a3;
  objc_msgSend(v5, "readAll:", 0);
  v4 = v5;
  if (v5[2])
  {
    -[GEOLogMsgStateApplicationIdentifier setAppIdentifier:](self, "setAppIdentifier:");
    v4 = v5;
  }
  if (v4[3])
  {
    -[GEOLogMsgStateApplicationIdentifier setAppMajorVersion:](self, "setAppMajorVersion:");
    v4 = v5;
  }
  if (v4[4])
  {
    -[GEOLogMsgStateApplicationIdentifier setAppMinorVersion:](self, "setAppMinorVersion:");
    v4 = v5;
  }
  if ((*((_BYTE *)v4 + 68) & 2) != 0)
  {
    self->_appDarkMode = *((_BYTE *)v4 + 64);
    *(_BYTE *)&self->_flags |= 2u;
  }
  if (v4[5])
  {
    -[GEOLogMsgStateApplicationIdentifier setProcessName:](self, "setProcessName:");
    v4 = v5;
  }
  if ((*((_BYTE *)v4 + 68) & 1) != 0)
  {
    self->_appType = *((_DWORD *)v4 + 15);
    *(_BYTE *)&self->_flags |= 1u;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processName, 0);
  objc_storeStrong((id *)&self->_appMinorVersion, 0);
  objc_storeStrong((id *)&self->_appMajorVersion, 0);
  objc_storeStrong((id *)&self->_appIdentifier, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
