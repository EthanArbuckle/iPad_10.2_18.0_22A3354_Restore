@implementation GEOLogMsgStateDeviceConnection

- (GEOLogMsgStateDeviceConnection)init
{
  GEOLogMsgStateDeviceConnection *v2;
  GEOLogMsgStateDeviceConnection *v3;
  GEOLogMsgStateDeviceConnection *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOLogMsgStateDeviceConnection;
  v2 = -[GEOLogMsgStateDeviceConnection init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOLogMsgStateDeviceConnection)initWithData:(id)a3
{
  GEOLogMsgStateDeviceConnection *v3;
  GEOLogMsgStateDeviceConnection *v4;
  GEOLogMsgStateDeviceConnection *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOLogMsgStateDeviceConnection;
  v3 = -[GEOLogMsgStateDeviceConnection initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (int)deviceNetworkConnectivity
{
  os_unfair_lock_s *p_readerLock;
  char flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 2) != 0)
    return self->_deviceNetworkConnectivity;
  else
    return 0;
}

- (void)setDeviceNetworkConnectivity:(int)a3
{
  *(_BYTE *)&self->_flags |= 0x12u;
  self->_deviceNetworkConnectivity = a3;
}

- (void)setHasDeviceNetworkConnectivity:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 18;
  else
    v3 = 16;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasDeviceNetworkConnectivity
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (id)deviceNetworkConnectivityAsString:(int)a3
{
  if (a3 < 4)
    return off_1E1C22A58[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsDeviceNetworkConnectivity:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DEVICE_NETWORK_CONNECTIVITY_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DEVICE_NETWORK_CONNECTIVITY_NOT_CONNECTED")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DEVICE_NETWORK_CONNECTIVITY_CELLULAR")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("DEVICE_NETWORK_CONNECTIVITY_WIFI")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_readDeviceCountryCode
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if ((*(_BYTE *)(a1 + 52) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateDeviceConnectionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDeviceCountryCode_tags_3);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (BOOL)hasDeviceCountryCode
{
  -[GEOLogMsgStateDeviceConnection _readDeviceCountryCode]((uint64_t)self);
  return self->_deviceCountryCode != 0;
}

- (NSString)deviceCountryCode
{
  -[GEOLogMsgStateDeviceConnection _readDeviceCountryCode]((uint64_t)self);
  return self->_deviceCountryCode;
}

- (void)setDeviceCountryCode:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x18u;
  objc_storeStrong((id *)&self->_deviceCountryCode, a3);
}

- (void)_readDeviceCarrierName
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if ((*(_BYTE *)(a1 + 52) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateDeviceConnectionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDeviceCarrierName_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (BOOL)hasDeviceCarrierName
{
  -[GEOLogMsgStateDeviceConnection _readDeviceCarrierName]((uint64_t)self);
  return self->_deviceCarrierName != 0;
}

- (NSString)deviceCarrierName
{
  -[GEOLogMsgStateDeviceConnection _readDeviceCarrierName]((uint64_t)self);
  return self->_deviceCarrierName;
}

- (void)setDeviceCarrierName:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x14u;
  objc_storeStrong((id *)&self->_deviceCarrierName, a3);
}

- (int)cellularDataState
{
  os_unfair_lock_s *p_readerLock;
  char flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 1) != 0)
    return self->_cellularDataState;
  else
    return 0;
}

- (void)setCellularDataState:(int)a3
{
  *(_BYTE *)&self->_flags |= 0x11u;
  self->_cellularDataState = a3;
}

- (void)setHasCellularDataState:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3 | 0x10;
}

- (BOOL)hasCellularDataState
{
  return *(_BYTE *)&self->_flags & 1;
}

- (id)cellularDataStateAsString:(int)a3
{
  if (a3 < 5)
    return off_1E1C22A78[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsCellularDataState:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CELLULAR_DATA_STATE_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CELLULAR_DATA_STATE_ALLOWED")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CELLULAR_DATA_STATE_DISABLED_FOR_MAPS")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CELLULAR_DATA_STATE_DISABLED_GLOBALLY")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("CELLULAR_DATA_STATE_NOT_SUPPORTED")))
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
  v8.super_class = (Class)GEOLogMsgStateDeviceConnection;
  -[GEOLogMsgStateDeviceConnection description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOLogMsgStateDeviceConnection dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgStateDeviceConnection _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  uint64_t v5;
  __CFString *v6;
  const __CFString *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  const __CFString *v11;
  uint64_t v12;
  __CFString *v13;
  const __CFString *v14;

  if (a1)
  {
    objc_msgSend((id)a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((*(_BYTE *)(a1 + 52) & 2) != 0)
    {
      v5 = *(int *)(a1 + 48);
      if (v5 >= 4)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 48));
        v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v6 = off_1E1C22A58[v5];
      }
      if (a2)
        v7 = CFSTR("deviceNetworkConnectivity");
      else
        v7 = CFSTR("device_network_connectivity");
      objc_msgSend(v4, "setObject:forKey:", v6, v7);

    }
    objc_msgSend((id)a1, "deviceCountryCode");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      if (a2)
        v9 = CFSTR("deviceCountryCode");
      else
        v9 = CFSTR("device_country_code");
      objc_msgSend(v4, "setObject:forKey:", v8, v9);
    }

    objc_msgSend((id)a1, "deviceCarrierName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      if (a2)
        v11 = CFSTR("deviceCarrierName");
      else
        v11 = CFSTR("device_carrier_name");
      objc_msgSend(v4, "setObject:forKey:", v10, v11);
    }

    if ((*(_BYTE *)(a1 + 52) & 1) != 0)
    {
      v12 = *(int *)(a1 + 44);
      if (v12 >= 5)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 44));
        v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v13 = off_1E1C22A78[v12];
      }
      if (a2)
        v14 = CFSTR("cellularDataState");
      else
        v14 = CFSTR("cellular_data_state");
      objc_msgSend(v4, "setObject:forKey:", v13, v14);

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
  return -[GEOLogMsgStateDeviceConnection _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLogMsgStateDeviceConnection)initWithDictionary:(id)a3
{
  return (GEOLogMsgStateDeviceConnection *)-[GEOLogMsgStateDeviceConnection _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  id v8;
  uint64_t v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  id v18;
  uint64_t v19;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("deviceNetworkConnectivity");
      else
        v6 = CFSTR("device_network_connectivity");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = v7;
        if ((objc_msgSend(v8, "isEqualToString:", CFSTR("DEVICE_NETWORK_CONNECTIVITY_UNKNOWN")) & 1) != 0)
        {
          v9 = 0;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("DEVICE_NETWORK_CONNECTIVITY_NOT_CONNECTED")) & 1) != 0)
        {
          v9 = 1;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("DEVICE_NETWORK_CONNECTIVITY_CELLULAR")) & 1) != 0)
        {
          v9 = 2;
        }
        else if (objc_msgSend(v8, "isEqualToString:", CFSTR("DEVICE_NETWORK_CONNECTIVITY_WIFI")))
        {
          v9 = 3;
        }
        else
        {
          v9 = 0;
        }

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_20;
        v9 = objc_msgSend(v7, "intValue");
      }
      objc_msgSend(a1, "setDeviceNetworkConnectivity:", v9);
LABEL_20:

      if (a3)
        v10 = CFSTR("deviceCountryCode");
      else
        v10 = CFSTR("device_country_code");
      objc_msgSend(v5, "objectForKeyedSubscript:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v12 = (void *)objc_msgSend(v11, "copy");
        objc_msgSend(a1, "setDeviceCountryCode:", v12);

      }
      if (a3)
        v13 = CFSTR("deviceCarrierName");
      else
        v13 = CFSTR("device_carrier_name");
      objc_msgSend(v5, "objectForKeyedSubscript:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v15 = (void *)objc_msgSend(v14, "copy");
        objc_msgSend(a1, "setDeviceCarrierName:", v15);

      }
      if (a3)
        v16 = CFSTR("cellularDataState");
      else
        v16 = CFSTR("cellular_data_state");
      objc_msgSend(v5, "objectForKeyedSubscript:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v18 = v17;
        if ((objc_msgSend(v18, "isEqualToString:", CFSTR("CELLULAR_DATA_STATE_UNKNOWN")) & 1) != 0)
        {
          v19 = 0;
        }
        else if ((objc_msgSend(v18, "isEqualToString:", CFSTR("CELLULAR_DATA_STATE_ALLOWED")) & 1) != 0)
        {
          v19 = 1;
        }
        else if ((objc_msgSend(v18, "isEqualToString:", CFSTR("CELLULAR_DATA_STATE_DISABLED_FOR_MAPS")) & 1) != 0)
        {
          v19 = 2;
        }
        else if ((objc_msgSend(v18, "isEqualToString:", CFSTR("CELLULAR_DATA_STATE_DISABLED_GLOBALLY")) & 1) != 0)
        {
          v19 = 3;
        }
        else if (objc_msgSend(v18, "isEqualToString:", CFSTR("CELLULAR_DATA_STATE_NOT_SUPPORTED")))
        {
          v19 = 4;
        }
        else
        {
          v19 = 0;
        }

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_49:

          goto LABEL_50;
        }
        v19 = objc_msgSend(v17, "intValue");
      }
      objc_msgSend(a1, "setCellularDataState:", v19);
      goto LABEL_49;
    }
  }
LABEL_50:

  return a1;
}

- (GEOLogMsgStateDeviceConnection)initWithJSON:(id)a3
{
  return (GEOLogMsgStateDeviceConnection *)-[GEOLogMsgStateDeviceConnection _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_5864;
    else
      v8 = (int *)&readAll__nonRecursiveTag_5865;
    GEOLogMsgStateDeviceConnectionReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgStateDeviceConnectionIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgStateDeviceConnectionReadAllFrom((uint64_t)self, a3, 0);
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
    -[GEOLogMsgStateDeviceConnection readAll:](self, "readAll:", 0);
    if ((*(_BYTE *)&self->_flags & 2) != 0)
      PBDataWriterWriteInt32Field();
    if (self->_deviceCountryCode)
      PBDataWriterWriteStringField();
    if (self->_deviceCarrierName)
      PBDataWriterWriteStringField();
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      PBDataWriterWriteInt32Field();
  }

}

- (void)copyTo:(id)a3
{
  id *v4;

  v4 = (id *)a3;
  -[GEOLogMsgStateDeviceConnection readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v4 + 1, self->_reader);
  *((_DWORD *)v4 + 8) = self->_readerMarkPos;
  *((_DWORD *)v4 + 9) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    *((_DWORD *)v4 + 12) = self->_deviceNetworkConnectivity;
    *((_BYTE *)v4 + 52) |= 2u;
  }
  if (self->_deviceCountryCode)
    objc_msgSend(v4, "setDeviceCountryCode:");
  if (self->_deviceCarrierName)
    objc_msgSend(v4, "setDeviceCarrierName:");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *((_DWORD *)v4 + 11) = self->_cellularDataState;
    *((_BYTE *)v4 + 52) |= 1u;
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
      GEOLogMsgStateDeviceConnectionReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOLogMsgStateDeviceConnection readAll:](self, "readAll:", 0);
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 48) = self->_deviceNetworkConnectivity;
    *(_BYTE *)(v5 + 52) |= 2u;
  }
  v9 = -[NSString copyWithZone:](self->_deviceCountryCode, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v9;

  v11 = -[NSString copyWithZone:](self->_deviceCarrierName, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v11;

  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 44) = self->_cellularDataState;
    *(_BYTE *)(v5 + 52) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *deviceCountryCode;
  NSString *deviceCarrierName;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_15;
  -[GEOLogMsgStateDeviceConnection readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 2) == 0 || self->_deviceNetworkConnectivity != *((_DWORD *)v4 + 12))
      goto LABEL_15;
  }
  else if ((*((_BYTE *)v4 + 52) & 2) != 0)
  {
LABEL_15:
    v7 = 0;
    goto LABEL_16;
  }
  deviceCountryCode = self->_deviceCountryCode;
  if ((unint64_t)deviceCountryCode | *((_QWORD *)v4 + 3)
    && !-[NSString isEqual:](deviceCountryCode, "isEqual:"))
  {
    goto LABEL_15;
  }
  deviceCarrierName = self->_deviceCarrierName;
  if ((unint64_t)deviceCarrierName | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](deviceCarrierName, "isEqual:"))
      goto LABEL_15;
  }
  v7 = (*((_BYTE *)v4 + 52) & 1) == 0;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 1) == 0 || self->_cellularDataState != *((_DWORD *)v4 + 11))
      goto LABEL_15;
    v7 = 1;
  }
LABEL_16:

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  uint64_t v6;

  -[GEOLogMsgStateDeviceConnection readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 2) != 0)
    v3 = 2654435761 * self->_deviceNetworkConnectivity;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_deviceCountryCode, "hash");
  v5 = -[NSString hash](self->_deviceCarrierName, "hash");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v6 = 2654435761 * self->_cellularDataState;
  else
    v6 = 0;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  int *v4;
  int *v5;

  v5 = (int *)a3;
  objc_msgSend(v5, "readAll:", 0);
  v4 = v5;
  if ((v5[13] & 2) != 0)
  {
    self->_deviceNetworkConnectivity = v5[12];
    *(_BYTE *)&self->_flags |= 2u;
  }
  if (*((_QWORD *)v5 + 3))
  {
    -[GEOLogMsgStateDeviceConnection setDeviceCountryCode:](self, "setDeviceCountryCode:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 2))
  {
    -[GEOLogMsgStateDeviceConnection setDeviceCarrierName:](self, "setDeviceCarrierName:");
    v4 = v5;
  }
  if ((v4[13] & 1) != 0)
  {
    self->_cellularDataState = v4[11];
    *(_BYTE *)&self->_flags |= 1u;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceCountryCode, 0);
  objc_storeStrong((id *)&self->_deviceCarrierName, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
