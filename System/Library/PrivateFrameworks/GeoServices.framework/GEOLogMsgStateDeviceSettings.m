@implementation GEOLogMsgStateDeviceSettings

- (BOOL)deviceDarkMode
{
  return self->_deviceDarkMode;
}

- (void)setDeviceDarkMode:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_deviceDarkMode = a3;
}

- (void)setHasDeviceDarkMode:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasDeviceDarkMode
{
  return *(_BYTE *)&self->_flags & 1;
}

- (BOOL)isAltAccountPairedDevice
{
  return self->_isAltAccountPairedDevice;
}

- (void)setIsAltAccountPairedDevice:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 2u;
  self->_isAltAccountPairedDevice = a3;
}

- (void)setHasIsAltAccountPairedDevice:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasIsAltAccountPairedDevice
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (BOOL)supportsAdvancedMap
{
  return self->_supportsAdvancedMap;
}

- (void)setSupportsAdvancedMap:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 4u;
  self->_supportsAdvancedMap = a3;
}

- (void)setHasSupportsAdvancedMap:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasSupportsAdvancedMap
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
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
  v8.super_class = (Class)GEOLogMsgStateDeviceSettings;
  -[GEOLogMsgStateDeviceSettings description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOLogMsgStateDeviceSettings dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgStateDeviceSettings _dictionaryRepresentation:]((unsigned __int8 *)self, 0);
}

- (id)_dictionaryRepresentation:(unsigned __int8 *)a1
{
  void *v4;
  unsigned __int8 v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  const __CFString *v11;

  if (!a1)
  {
    v4 = 0;
    return v4;
  }
  objc_msgSend(a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = a1[12];
  if ((v5 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a1[8]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v7 = CFSTR("deviceDarkMode");
    else
      v7 = CFSTR("device_dark_mode");
    objc_msgSend(v4, "setObject:forKey:", v6, v7);

    v5 = a1[12];
    if ((v5 & 2) == 0)
    {
LABEL_4:
      if ((v5 & 4) == 0)
        return v4;
      goto LABEL_14;
    }
  }
  else if ((a1[12] & 2) == 0)
  {
    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a1[9]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v9 = CFSTR("isAltAccountPairedDevice");
  else
    v9 = CFSTR("is_alt_account_paired_device");
  objc_msgSend(v4, "setObject:forKey:", v8, v9);

  if ((a1[12] & 4) != 0)
  {
LABEL_14:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a1[10]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v11 = CFSTR("supportsAdvancedMap");
    else
      v11 = CFSTR("supports_advanced_map");
    objc_msgSend(v4, "setObject:forKey:", v10, v11);

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOLogMsgStateDeviceSettings _dictionaryRepresentation:]((unsigned __int8 *)self, 1);
}

- (GEOLogMsgStateDeviceSettings)initWithDictionary:(id)a3
{
  return (GEOLogMsgStateDeviceSettings *)-[GEOLogMsgStateDeviceSettings _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  const __CFString *v10;
  void *v11;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("deviceDarkMode");
      else
        v6 = CFSTR("device_dark_mode");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setDeviceDarkMode:", objc_msgSend(v7, "BOOLValue"));

      if (a3)
        v8 = CFSTR("isAltAccountPairedDevice");
      else
        v8 = CFSTR("is_alt_account_paired_device");
      objc_msgSend(v5, "objectForKeyedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setIsAltAccountPairedDevice:", objc_msgSend(v9, "BOOLValue"));

      if (a3)
        v10 = CFSTR("supportsAdvancedMap");
      else
        v10 = CFSTR("supports_advanced_map");
      objc_msgSend(v5, "objectForKeyedSubscript:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setSupportsAdvancedMap:", objc_msgSend(v11, "BOOLValue"));

    }
  }

  return a1;
}

- (GEOLogMsgStateDeviceSettings)initWithJSON:(id)a3
{
  return (GEOLogMsgStateDeviceSettings *)-[GEOLogMsgStateDeviceSettings _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgStateDeviceSettingsIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgStateDeviceSettingsReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char flags;
  id v6;

  v4 = a3;
  flags = (char)self->_flags;
  v6 = v4;
  if ((flags & 1) == 0)
  {
    if ((*(_BYTE *)&self->_flags & 2) == 0)
      goto LABEL_3;
LABEL_7:
    PBDataWriterWriteBOOLField();
    v4 = v6;
    if ((*(_BYTE *)&self->_flags & 4) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  PBDataWriterWriteBOOLField();
  v4 = v6;
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
    goto LABEL_7;
LABEL_3:
  if ((flags & 4) != 0)
  {
LABEL_4:
    PBDataWriterWriteBOOLField();
    v4 = v6;
  }
LABEL_5:

}

- (void)copyTo:(id)a3
{
  char flags;
  _BYTE *v5;

  v5 = a3;
  -[GEOLogMsgStateDeviceSettings readAll:](self, "readAll:", 0);
  flags = (char)self->_flags;
  if ((flags & 1) == 0)
  {
    if ((*(_BYTE *)&self->_flags & 2) == 0)
      goto LABEL_3;
LABEL_7:
    v5[9] = self->_isAltAccountPairedDevice;
    v5[12] |= 2u;
    if ((*(_BYTE *)&self->_flags & 4) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  v5[8] = self->_deviceDarkMode;
  v5[12] |= 1u;
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
    goto LABEL_7;
LABEL_3:
  if ((flags & 4) != 0)
  {
LABEL_4:
    v5[10] = self->_supportsAdvancedMap;
    v5[12] |= 4u;
  }
LABEL_5:

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char flags;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    *((_BYTE *)result + 8) = self->_deviceDarkMode;
    *((_BYTE *)result + 12) |= 1u;
    flags = (char)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_3:
      if ((flags & 4) == 0)
        return result;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_BYTE *)result + 9) = self->_isAltAccountPairedDevice;
  *((_BYTE *)result + 12) |= 2u;
  if ((*(_BYTE *)&self->_flags & 4) == 0)
    return result;
LABEL_4:
  *((_BYTE *)result + 10) = self->_supportsAdvancedMap;
  *((_BYTE *)result + 12) |= 4u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_20;
  -[GEOLogMsgStateDeviceSettings readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((v4[12] & 1) == 0)
      goto LABEL_20;
    if (self->_deviceDarkMode)
    {
      if (!v4[8])
        goto LABEL_20;
    }
    else if (v4[8])
    {
      goto LABEL_20;
    }
  }
  else if ((v4[12] & 1) != 0)
  {
    goto LABEL_20;
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((v4[12] & 2) == 0)
      goto LABEL_20;
    if (self->_isAltAccountPairedDevice)
    {
      if (!v4[9])
        goto LABEL_20;
    }
    else if (v4[9])
    {
      goto LABEL_20;
    }
  }
  else if ((v4[12] & 2) != 0)
  {
    goto LABEL_20;
  }
  v5 = (v4[12] & 4) == 0;
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    if ((v4[12] & 4) != 0)
    {
      if (self->_supportsAdvancedMap)
      {
        if (!v4[10])
          goto LABEL_20;
      }
      else if (v4[10])
      {
        goto LABEL_20;
      }
      v5 = 1;
      goto LABEL_21;
    }
LABEL_20:
    v5 = 0;
  }
LABEL_21:

  return v5;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  -[GEOLogMsgStateDeviceSettings readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) == 0)
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_flags & 2) != 0)
      goto LABEL_3;
LABEL_6:
    v4 = 0;
    if ((*(_BYTE *)&self->_flags & 4) != 0)
      goto LABEL_4;
LABEL_7:
    v5 = 0;
    return v4 ^ v3 ^ v5;
  }
  v3 = 2654435761 * self->_deviceDarkMode;
  if ((*(_BYTE *)&self->_flags & 2) == 0)
    goto LABEL_6;
LABEL_3:
  v4 = 2654435761 * self->_isAltAccountPairedDevice;
  if ((*(_BYTE *)&self->_flags & 4) == 0)
    goto LABEL_7;
LABEL_4:
  v5 = 2654435761 * self->_supportsAdvancedMap;
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  BOOL v4;
  BOOL *v5;

  v5 = (BOOL *)a3;
  objc_msgSend(v5, "readAll:", 0);
  v4 = v5[12];
  if (!v4)
  {
    if ((v5[12] & 2) == 0)
      goto LABEL_3;
LABEL_7:
    self->_isAltAccountPairedDevice = v5[9];
    *(_BYTE *)&self->_flags |= 2u;
    if ((v5[12] & 4) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  self->_deviceDarkMode = v5[8];
  *(_BYTE *)&self->_flags |= 1u;
  v4 = v5[12];
  if ((v4 & 2) != 0)
    goto LABEL_7;
LABEL_3:
  if ((v4 & 4) != 0)
  {
LABEL_4:
    self->_supportsAdvancedMap = v5[10];
    *(_BYTE *)&self->_flags |= 4u;
  }
LABEL_5:

}

@end
