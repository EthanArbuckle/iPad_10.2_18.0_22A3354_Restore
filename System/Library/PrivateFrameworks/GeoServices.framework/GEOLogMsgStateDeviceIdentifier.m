@implementation GEOLogMsgStateDeviceIdentifier

- (GEOLogMsgStateDeviceIdentifier)init
{
  GEOLogMsgStateDeviceIdentifier *v2;
  GEOLogMsgStateDeviceIdentifier *v3;
  GEOLogMsgStateDeviceIdentifier *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOLogMsgStateDeviceIdentifier;
  v2 = -[GEOLogMsgStateDeviceIdentifier init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOLogMsgStateDeviceIdentifier)initWithData:(id)a3
{
  GEOLogMsgStateDeviceIdentifier *v3;
  GEOLogMsgStateDeviceIdentifier *v4;
  GEOLogMsgStateDeviceIdentifier *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOLogMsgStateDeviceIdentifier;
  v3 = -[GEOLogMsgStateDeviceIdentifier initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readDeviceOsVersion
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if ((*(_BYTE *)(a1 + 48) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateDeviceIdentifierReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDeviceOsVersion_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (BOOL)hasDeviceOsVersion
{
  -[GEOLogMsgStateDeviceIdentifier _readDeviceOsVersion]((uint64_t)self);
  return self->_deviceOsVersion != 0;
}

- (NSString)deviceOsVersion
{
  -[GEOLogMsgStateDeviceIdentifier _readDeviceOsVersion]((uint64_t)self);
  return self->_deviceOsVersion;
}

- (void)setDeviceOsVersion:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x30u;
  objc_storeStrong((id *)&self->_deviceOsVersion, a3);
}

- (void)_readDeviceHwIdentifier
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
        GEOLogMsgStateDeviceIdentifierReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDeviceHwIdentifier_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (BOOL)hasDeviceHwIdentifier
{
  -[GEOLogMsgStateDeviceIdentifier _readDeviceHwIdentifier]((uint64_t)self);
  return self->_deviceHwIdentifier != 0;
}

- (NSString)deviceHwIdentifier
{
  -[GEOLogMsgStateDeviceIdentifier _readDeviceHwIdentifier]((uint64_t)self);
  return self->_deviceHwIdentifier;
}

- (void)setDeviceHwIdentifier:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x28u;
  objc_storeStrong((id *)&self->_deviceHwIdentifier, a3);
}

- (BOOL)isInternalTool
{
  return self->_isInternalTool;
}

- (void)setIsInternalTool:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 0x24u;
  self->_isInternalTool = a3;
}

- (void)setHasIsInternalTool:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 36;
  else
    v3 = 32;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasIsInternalTool
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (BOOL)isInternalInstall
{
  return self->_isInternalInstall;
}

- (void)setIsInternalInstall:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 0x22u;
  self->_isInternalInstall = a3;
}

- (void)setHasIsInternalInstall:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 34;
  else
    v3 = 32;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasIsInternalInstall
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (BOOL)deviceDarkMode
{
  return self->_deviceDarkMode;
}

- (void)setDeviceDarkMode:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 0x21u;
  self->_deviceDarkMode = a3;
}

- (void)setHasDeviceDarkMode:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3 | 0x20;
}

- (BOOL)hasDeviceDarkMode
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
  v8.super_class = (Class)GEOLogMsgStateDeviceIdentifier;
  -[GEOLogMsgStateDeviceIdentifier description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOLogMsgStateDeviceIdentifier dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgStateDeviceIdentifier _dictionaryRepresentation:]((unsigned __int8 *)self, 0);
}

- (id)_dictionaryRepresentation:(unsigned __int8 *)a1
{
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  const __CFString *v8;
  unsigned __int8 v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  const __CFString *v15;

  if (!a1)
  {
    v4 = 0;
    return v4;
  }
  objc_msgSend(a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "deviceOsVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (a2)
      v6 = CFSTR("deviceOsVersion");
    else
      v6 = CFSTR("device_os_version");
    objc_msgSend(v4, "setObject:forKey:", v5, v6);
  }

  objc_msgSend(a1, "deviceHwIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    if (a2)
      v8 = CFSTR("deviceHwIdentifier");
    else
      v8 = CFSTR("device_hw_identifier");
    objc_msgSend(v4, "setObject:forKey:", v7, v8);
  }

  v9 = a1[48];
  if ((v9 & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a1[46]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v11 = CFSTR("isInternalTool");
    else
      v11 = CFSTR("is_internal_tool");
    objc_msgSend(v4, "setObject:forKey:", v10, v11);

    v9 = a1[48];
    if ((v9 & 2) == 0)
    {
LABEL_14:
      if ((v9 & 1) == 0)
        return v4;
      goto LABEL_24;
    }
  }
  else if ((a1[48] & 2) == 0)
  {
    goto LABEL_14;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a1[45]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v13 = CFSTR("isInternalInstall");
  else
    v13 = CFSTR("is_internal_install");
  objc_msgSend(v4, "setObject:forKey:", v12, v13);

  if ((a1[48] & 1) != 0)
  {
LABEL_24:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a1[44]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v15 = CFSTR("deviceDarkMode");
    else
      v15 = CFSTR("device_dark_mode");
    objc_msgSend(v4, "setObject:forKey:", v14, v15);

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOLogMsgStateDeviceIdentifier _dictionaryRepresentation:]((unsigned __int8 *)self, 1);
}

- (GEOLogMsgStateDeviceIdentifier)initWithDictionary:(id)a3
{
  return (GEOLogMsgStateDeviceIdentifier *)-[GEOLogMsgStateDeviceIdentifier _initWithDictionary:isJSON:](self, a3, 0);
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
  const __CFString *v14;
  void *v15;
  const __CFString *v16;
  void *v17;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("deviceOsVersion");
      else
        v6 = CFSTR("device_os_version");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = (void *)objc_msgSend(v7, "copy");
        objc_msgSend(a1, "setDeviceOsVersion:", v8);

      }
      if (a3)
        v9 = CFSTR("deviceHwIdentifier");
      else
        v9 = CFSTR("device_hw_identifier");
      objc_msgSend(v5, "objectForKeyedSubscript:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = (void *)objc_msgSend(v10, "copy");
        objc_msgSend(a1, "setDeviceHwIdentifier:", v11);

      }
      if (a3)
        v12 = CFSTR("isInternalTool");
      else
        v12 = CFSTR("is_internal_tool");
      objc_msgSend(v5, "objectForKeyedSubscript:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setIsInternalTool:", objc_msgSend(v13, "BOOLValue"));

      if (a3)
        v14 = CFSTR("isInternalInstall");
      else
        v14 = CFSTR("is_internal_install");
      objc_msgSend(v5, "objectForKeyedSubscript:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setIsInternalInstall:", objc_msgSend(v15, "BOOLValue"));

      if (a3)
        v16 = CFSTR("deviceDarkMode");
      else
        v16 = CFSTR("device_dark_mode");
      objc_msgSend(v5, "objectForKeyedSubscript:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setDeviceDarkMode:", objc_msgSend(v17, "BOOLValue"));

    }
  }

  return a1;
}

- (GEOLogMsgStateDeviceIdentifier)initWithJSON:(id)a3
{
  return (GEOLogMsgStateDeviceIdentifier *)-[GEOLogMsgStateDeviceIdentifier _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_5922;
    else
      v8 = (int *)&readAll__nonRecursiveTag_5923;
    GEOLogMsgStateDeviceIdentifierReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgStateDeviceIdentifierIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgStateDeviceIdentifierReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  char flags;
  PBDataReader *v6;
  void *v7;
  id v8;

  v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader)
  {
    os_unfair_lock_assert_owner(&self->_readerLock);
    if ((*(_BYTE *)&self->_flags & 0x38) == 0)
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
      goto LABEL_15;
    }
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOLogMsgStateDeviceIdentifier readAll:](self, "readAll:", 0);
  if (self->_deviceOsVersion)
    PBDataWriterWriteStringField();
  if (self->_deviceHwIdentifier)
    PBDataWriterWriteStringField();
  flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    PBDataWriterWriteBOOLField();
    flags = (char)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_9:
      if ((flags & 1) == 0)
        goto LABEL_15;
      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 2) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteBOOLField();
  if ((*(_BYTE *)&self->_flags & 1) != 0)
LABEL_13:
    PBDataWriterWriteBOOLField();
LABEL_15:

}

- (void)copyTo:(id)a3
{
  char flags;
  id *v5;

  v5 = (id *)a3;
  -[GEOLogMsgStateDeviceIdentifier readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 8) = self->_readerMarkPos;
  *((_DWORD *)v5 + 9) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_deviceOsVersion)
    objc_msgSend(v5, "setDeviceOsVersion:");
  if (self->_deviceHwIdentifier)
    objc_msgSend(v5, "setDeviceHwIdentifier:");
  flags = (char)self->_flags;
  if ((flags & 4) == 0)
  {
    if ((*(_BYTE *)&self->_flags & 2) == 0)
      goto LABEL_7;
LABEL_11:
    *((_BYTE *)v5 + 45) = self->_isInternalInstall;
    *((_BYTE *)v5 + 48) |= 2u;
    if ((*(_BYTE *)&self->_flags & 1) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
  *((_BYTE *)v5 + 46) = self->_isInternalTool;
  *((_BYTE *)v5 + 48) |= 4u;
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
    goto LABEL_11;
LABEL_7:
  if ((flags & 1) != 0)
  {
LABEL_8:
    *((_BYTE *)v5 + 44) = self->_deviceDarkMode;
    *((_BYTE *)v5 + 48) |= 1u;
  }
LABEL_9:

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
  char flags;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
  {
LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOLogMsgStateDeviceIdentifier readAll:](self, "readAll:", 0);
    v9 = -[NSString copyWithZone:](self->_deviceOsVersion, "copyWithZone:", a3);
    v10 = *(void **)(v5 + 24);
    *(_QWORD *)(v5 + 24) = v9;

    v11 = -[NSString copyWithZone:](self->_deviceHwIdentifier, "copyWithZone:", a3);
    v12 = *(void **)(v5 + 16);
    *(_QWORD *)(v5 + 16) = v11;

    flags = (char)self->_flags;
    if ((flags & 4) != 0)
    {
      *(_BYTE *)(v5 + 46) = self->_isInternalTool;
      *(_BYTE *)(v5 + 48) |= 4u;
      flags = (char)self->_flags;
      if ((flags & 2) == 0)
      {
LABEL_7:
        if ((flags & 1) == 0)
          return (id)v5;
LABEL_8:
        *(_BYTE *)(v5 + 44) = self->_deviceDarkMode;
        *(_BYTE *)(v5 + 48) |= 1u;
        return (id)v5;
      }
    }
    else if ((*(_BYTE *)&self->_flags & 2) == 0)
    {
      goto LABEL_7;
    }
    *(_BYTE *)(v5 + 45) = self->_isInternalInstall;
    *(_BYTE *)(v5 + 48) |= 2u;
    if ((*(_BYTE *)&self->_flags & 1) == 0)
      return (id)v5;
    goto LABEL_8;
  }
  v7 = reader;
  objc_sync_enter(v7);
  if ((*(_BYTE *)&self->_flags & 0x20) != 0)
  {
    objc_sync_exit(v7);

    goto LABEL_5;
  }
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  GEOLogMsgStateDeviceIdentifierReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  v8 = (id)v5;
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *deviceOsVersion;
  NSString *deviceHwIdentifier;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_24;
  -[GEOLogMsgStateDeviceIdentifier readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  deviceOsVersion = self->_deviceOsVersion;
  if ((unint64_t)deviceOsVersion | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](deviceOsVersion, "isEqual:"))
      goto LABEL_24;
  }
  deviceHwIdentifier = self->_deviceHwIdentifier;
  if ((unint64_t)deviceHwIdentifier | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](deviceHwIdentifier, "isEqual:"))
      goto LABEL_24;
  }
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 4) == 0)
      goto LABEL_24;
    if (self->_isInternalTool)
    {
      if (!*((_BYTE *)v4 + 46))
        goto LABEL_24;
    }
    else if (*((_BYTE *)v4 + 46))
    {
      goto LABEL_24;
    }
  }
  else if ((*((_BYTE *)v4 + 48) & 4) != 0)
  {
    goto LABEL_24;
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 2) == 0)
      goto LABEL_24;
    if (self->_isInternalInstall)
    {
      if (!*((_BYTE *)v4 + 45))
        goto LABEL_24;
    }
    else if (*((_BYTE *)v4 + 45))
    {
      goto LABEL_24;
    }
  }
  else if ((*((_BYTE *)v4 + 48) & 2) != 0)
  {
    goto LABEL_24;
  }
  v7 = (*((_BYTE *)v4 + 48) & 1) == 0;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 1) != 0)
    {
      if (self->_deviceDarkMode)
      {
        if (!*((_BYTE *)v4 + 44))
          goto LABEL_24;
      }
      else if (*((_BYTE *)v4 + 44))
      {
        goto LABEL_24;
      }
      v7 = 1;
      goto LABEL_25;
    }
LABEL_24:
    v7 = 0;
  }
LABEL_25:

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  -[GEOLogMsgStateDeviceIdentifier readAll:](self, "readAll:", 1);
  v3 = -[NSString hash](self->_deviceOsVersion, "hash");
  v4 = -[NSString hash](self->_deviceHwIdentifier, "hash");
  if ((*(_BYTE *)&self->_flags & 4) == 0)
  {
    v5 = 0;
    if ((*(_BYTE *)&self->_flags & 2) != 0)
      goto LABEL_3;
LABEL_6:
    v6 = 0;
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      goto LABEL_4;
LABEL_7:
    v7 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7;
  }
  v5 = 2654435761 * self->_isInternalTool;
  if ((*(_BYTE *)&self->_flags & 2) == 0)
    goto LABEL_6;
LABEL_3:
  v6 = 2654435761 * self->_isInternalInstall;
  if ((*(_BYTE *)&self->_flags & 1) == 0)
    goto LABEL_7;
LABEL_4:
  v7 = 2654435761 * self->_deviceDarkMode;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  char v5;
  _QWORD *v6;

  v6 = a3;
  objc_msgSend(v6, "readAll:", 0);
  v4 = v6;
  if (v6[3])
  {
    -[GEOLogMsgStateDeviceIdentifier setDeviceOsVersion:](self, "setDeviceOsVersion:");
    v4 = v6;
  }
  if (v4[2])
  {
    -[GEOLogMsgStateDeviceIdentifier setDeviceHwIdentifier:](self, "setDeviceHwIdentifier:");
    v4 = v6;
  }
  v5 = *((_BYTE *)v4 + 48);
  if ((v5 & 4) == 0)
  {
    if ((v4[6] & 2) == 0)
      goto LABEL_7;
LABEL_11:
    self->_isInternalInstall = *((_BYTE *)v4 + 45);
    *(_BYTE *)&self->_flags |= 2u;
    if ((v4[6] & 1) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
  self->_isInternalTool = *((_BYTE *)v4 + 46);
  *(_BYTE *)&self->_flags |= 4u;
  v5 = *((_BYTE *)v4 + 48);
  if ((v5 & 2) != 0)
    goto LABEL_11;
LABEL_7:
  if ((v5 & 1) != 0)
  {
LABEL_8:
    self->_deviceDarkMode = *((_BYTE *)v4 + 44);
    *(_BYTE *)&self->_flags |= 1u;
  }
LABEL_9:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceOsVersion, 0);
  objc_storeStrong((id *)&self->_deviceHwIdentifier, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
