@implementation GEOLogMsgStateOffline

- (BOOL)isMapsInOfflineMode
{
  return self->_isMapsInOfflineMode;
}

- (void)setIsMapsInOfflineMode:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 8u;
  self->_isMapsInOfflineMode = a3;
}

- (void)setHasIsMapsInOfflineMode:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xF7 | v3;
}

- (BOOL)hasIsMapsInOfflineMode
{
  return (*(_BYTE *)&self->_flags >> 3) & 1;
}

- (BOOL)isNetworkConnected
{
  return self->_isNetworkConnected;
}

- (void)setIsNetworkConnected:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 0x10u;
  self->_isNetworkConnected = a3;
}

- (void)setHasIsNetworkConnected:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xEF | v3;
}

- (BOOL)hasIsNetworkConnected
{
  return (*(_BYTE *)&self->_flags >> 4) & 1;
}

- (BOOL)isOnlyUseOffline
{
  return self->_isOnlyUseOffline;
}

- (void)setIsOnlyUseOffline:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 0x20u;
  self->_isOnlyUseOffline = a3;
}

- (void)setHasIsOnlyUseOffline:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xDF | v3;
}

- (BOOL)hasIsOnlyUseOffline
{
  return (*(_BYTE *)&self->_flags >> 5) & 1;
}

- (unsigned)numberOfDownloadedRegions
{
  return self->_numberOfDownloadedRegions;
}

- (void)setNumberOfDownloadedRegions:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 4u;
  self->_numberOfDownloadedRegions = a3;
}

- (void)setHasNumberOfDownloadedRegions:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasNumberOfDownloadedRegions
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (unint64_t)searchOdsVersion
{
  return self->_searchOdsVersion;
}

- (void)setSearchOdsVersion:(unint64_t)a3
{
  *(_BYTE *)&self->_flags |= 2u;
  self->_searchOdsVersion = a3;
}

- (void)setHasSearchOdsVersion:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasSearchOdsVersion
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (unint64_t)routingOdsVersion
{
  return self->_routingOdsVersion;
}

- (void)setRoutingOdsVersion:(unint64_t)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_routingOdsVersion = a3;
}

- (void)setHasRoutingOdsVersion:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasRoutingOdsVersion
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
  v8.super_class = (Class)GEOLogMsgStateOffline;
  -[GEOLogMsgStateOffline description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOLogMsgStateOffline dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgStateOffline _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  char v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  const __CFString *v17;

  if (!a1)
  {
    v4 = 0;
    return v4;
  }
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_BYTE *)(a1 + 32);
  if ((v5 & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 28));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v7 = CFSTR("isMapsInOfflineMode");
    else
      v7 = CFSTR("is_maps_in_offline_mode");
    objc_msgSend(v4, "setObject:forKey:", v6, v7);

    v5 = *(_BYTE *)(a1 + 32);
  }
  if ((v5 & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 29));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v9 = CFSTR("isNetworkConnected");
    else
      v9 = CFSTR("is_network_connected");
    objc_msgSend(v4, "setObject:forKey:", v8, v9);

    v5 = *(_BYTE *)(a1 + 32);
    if ((v5 & 0x20) == 0)
    {
LABEL_9:
      if ((v5 & 4) == 0)
        goto LABEL_10;
      goto LABEL_21;
    }
  }
  else if ((v5 & 0x20) == 0)
  {
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 30));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v11 = CFSTR("isOnlyUseOffline");
  else
    v11 = CFSTR("is_only_use_offline");
  objc_msgSend(v4, "setObject:forKey:", v10, v11);

  v5 = *(_BYTE *)(a1 + 32);
  if ((v5 & 4) == 0)
  {
LABEL_10:
    if ((v5 & 2) == 0)
      goto LABEL_11;
    goto LABEL_25;
  }
LABEL_21:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 24));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v13 = CFSTR("numberOfDownloadedRegions");
  else
    v13 = CFSTR("number_of_downloaded_regions");
  objc_msgSend(v4, "setObject:forKey:", v12, v13);

  v5 = *(_BYTE *)(a1 + 32);
  if ((v5 & 2) == 0)
  {
LABEL_11:
    if ((v5 & 1) == 0)
      return v4;
    goto LABEL_29;
  }
LABEL_25:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 16));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v15 = CFSTR("searchOdsVersion");
  else
    v15 = CFSTR("search_ods_version");
  objc_msgSend(v4, "setObject:forKey:", v14, v15);

  if ((*(_BYTE *)(a1 + 32) & 1) != 0)
  {
LABEL_29:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 8));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v17 = CFSTR("routingOdsVersion");
    else
      v17 = CFSTR("routing_ods_version");
    objc_msgSend(v4, "setObject:forKey:", v16, v17);

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOLogMsgStateOffline _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLogMsgStateOffline)initWithDictionary:(id)a3
{
  return (GEOLogMsgStateOffline *)-[GEOLogMsgStateOffline _initWithDictionary:isJSON:](self, a3, 0);
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
        v6 = CFSTR("isMapsInOfflineMode");
      else
        v6 = CFSTR("is_maps_in_offline_mode");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setIsMapsInOfflineMode:", objc_msgSend(v7, "BOOLValue"));

      if (a3)
        v8 = CFSTR("isNetworkConnected");
      else
        v8 = CFSTR("is_network_connected");
      objc_msgSend(v5, "objectForKeyedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setIsNetworkConnected:", objc_msgSend(v9, "BOOLValue"));

      if (a3)
        v10 = CFSTR("isOnlyUseOffline");
      else
        v10 = CFSTR("is_only_use_offline");
      objc_msgSend(v5, "objectForKeyedSubscript:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setIsOnlyUseOffline:", objc_msgSend(v11, "BOOLValue"));

      if (a3)
        v12 = CFSTR("numberOfDownloadedRegions");
      else
        v12 = CFSTR("number_of_downloaded_regions");
      objc_msgSend(v5, "objectForKeyedSubscript:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setNumberOfDownloadedRegions:", objc_msgSend(v13, "unsignedIntValue"));

      if (a3)
        v14 = CFSTR("searchOdsVersion");
      else
        v14 = CFSTR("search_ods_version");
      objc_msgSend(v5, "objectForKeyedSubscript:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setSearchOdsVersion:", objc_msgSend(v15, "unsignedLongLongValue"));

      if (a3)
        v16 = CFSTR("routingOdsVersion");
      else
        v16 = CFSTR("routing_ods_version");
      objc_msgSend(v5, "objectForKeyedSubscript:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setRoutingOdsVersion:", objc_msgSend(v17, "unsignedLongLongValue"));

    }
  }

  return a1;
}

- (GEOLogMsgStateOffline)initWithJSON:(id)a3
{
  return (GEOLogMsgStateOffline *)-[GEOLogMsgStateOffline _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgStateOfflineIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgStateOfflineReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  char flags;
  id v5;

  v5 = a3;
  flags = (char)self->_flags;
  if ((flags & 8) != 0)
  {
    PBDataWriterWriteBOOLField();
    flags = (char)self->_flags;
    if ((flags & 0x10) == 0)
    {
LABEL_3:
      if ((flags & 0x20) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 0x10) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  flags = (char)self->_flags;
  if ((flags & 0x20) == 0)
  {
LABEL_4:
    if ((flags & 4) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  PBDataWriterWriteBOOLField();
  flags = (char)self->_flags;
  if ((flags & 4) == 0)
  {
LABEL_5:
    if ((flags & 2) == 0)
      goto LABEL_6;
LABEL_13:
    PBDataWriterWriteUint64Field();
    if ((*(_BYTE *)&self->_flags & 1) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_12:
  PBDataWriterWriteUint32Field();
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
    goto LABEL_13;
LABEL_6:
  if ((flags & 1) != 0)
LABEL_7:
    PBDataWriterWriteUint64Field();
LABEL_8:

}

- (void)copyTo:(id)a3
{
  char flags;
  _BYTE *v5;

  v5 = a3;
  -[GEOLogMsgStateOffline readAll:](self, "readAll:", 0);
  flags = (char)self->_flags;
  if ((flags & 8) != 0)
  {
    v5[28] = self->_isMapsInOfflineMode;
    v5[32] |= 8u;
    flags = (char)self->_flags;
    if ((flags & 0x10) == 0)
    {
LABEL_3:
      if ((flags & 0x20) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 0x10) == 0)
  {
    goto LABEL_3;
  }
  v5[29] = self->_isNetworkConnected;
  v5[32] |= 0x10u;
  flags = (char)self->_flags;
  if ((flags & 0x20) == 0)
  {
LABEL_4:
    if ((flags & 4) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  v5[30] = self->_isOnlyUseOffline;
  v5[32] |= 0x20u;
  flags = (char)self->_flags;
  if ((flags & 4) == 0)
  {
LABEL_5:
    if ((flags & 2) == 0)
      goto LABEL_6;
LABEL_13:
    *((_QWORD *)v5 + 2) = self->_searchOdsVersion;
    v5[32] |= 2u;
    if ((*(_BYTE *)&self->_flags & 1) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_12:
  *((_DWORD *)v5 + 6) = self->_numberOfDownloadedRegions;
  v5[32] |= 4u;
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
    goto LABEL_13;
LABEL_6:
  if ((flags & 1) != 0)
  {
LABEL_7:
    *((_QWORD *)v5 + 1) = self->_routingOdsVersion;
    v5[32] |= 1u;
  }
LABEL_8:

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char flags;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  flags = (char)self->_flags;
  if ((flags & 8) != 0)
  {
    *((_BYTE *)result + 28) = self->_isMapsInOfflineMode;
    *((_BYTE *)result + 32) |= 8u;
    flags = (char)self->_flags;
    if ((flags & 0x10) == 0)
    {
LABEL_3:
      if ((flags & 0x20) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *((_BYTE *)result + 29) = self->_isNetworkConnected;
  *((_BYTE *)result + 32) |= 0x10u;
  flags = (char)self->_flags;
  if ((flags & 0x20) == 0)
  {
LABEL_4:
    if ((flags & 4) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  *((_BYTE *)result + 30) = self->_isOnlyUseOffline;
  *((_BYTE *)result + 32) |= 0x20u;
  flags = (char)self->_flags;
  if ((flags & 4) == 0)
  {
LABEL_5:
    if ((flags & 2) == 0)
      goto LABEL_6;
    goto LABEL_13;
  }
LABEL_12:
  *((_DWORD *)result + 6) = self->_numberOfDownloadedRegions;
  *((_BYTE *)result + 32) |= 4u;
  flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_6:
    if ((flags & 1) == 0)
      return result;
    goto LABEL_7;
  }
LABEL_13:
  *((_QWORD *)result + 2) = self->_searchOdsVersion;
  *((_BYTE *)result + 32) |= 2u;
  if ((*(_BYTE *)&self->_flags & 1) == 0)
    return result;
LABEL_7:
  *((_QWORD *)result + 1) = self->_routingOdsVersion;
  *((_BYTE *)result + 32) |= 1u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_40;
  -[GEOLogMsgStateOffline readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 8) == 0)
      goto LABEL_40;
    if (self->_isMapsInOfflineMode)
    {
      if (!*((_BYTE *)v4 + 28))
        goto LABEL_40;
    }
    else if (*((_BYTE *)v4 + 28))
    {
      goto LABEL_40;
    }
  }
  else if ((*((_BYTE *)v4 + 32) & 8) != 0)
  {
    goto LABEL_40;
  }
  if ((*(_BYTE *)&self->_flags & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 0x10) == 0)
      goto LABEL_40;
    if (self->_isNetworkConnected)
    {
      if (!*((_BYTE *)v4 + 29))
        goto LABEL_40;
    }
    else if (*((_BYTE *)v4 + 29))
    {
      goto LABEL_40;
    }
  }
  else if ((*((_BYTE *)v4 + 32) & 0x10) != 0)
  {
    goto LABEL_40;
  }
  if ((*(_BYTE *)&self->_flags & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 0x20) != 0)
    {
      if (self->_isOnlyUseOffline)
      {
        if (!*((_BYTE *)v4 + 30))
          goto LABEL_40;
        goto LABEL_26;
      }
      if (!*((_BYTE *)v4 + 30))
        goto LABEL_26;
    }
LABEL_40:
    v5 = 0;
    goto LABEL_41;
  }
  if ((*((_BYTE *)v4 + 32) & 0x20) != 0)
    goto LABEL_40;
LABEL_26:
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 4) == 0 || self->_numberOfDownloadedRegions != *((_DWORD *)v4 + 6))
      goto LABEL_40;
  }
  else if ((*((_BYTE *)v4 + 32) & 4) != 0)
  {
    goto LABEL_40;
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 2) == 0 || self->_searchOdsVersion != *((_QWORD *)v4 + 2))
      goto LABEL_40;
  }
  else if ((*((_BYTE *)v4 + 32) & 2) != 0)
  {
    goto LABEL_40;
  }
  v5 = (*((_BYTE *)v4 + 32) & 1) == 0;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 1) == 0 || self->_routingOdsVersion != *((_QWORD *)v4 + 1))
      goto LABEL_40;
    v5 = 1;
  }
LABEL_41:

  return v5;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;

  -[GEOLogMsgStateOffline readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
    v3 = 2654435761 * self->_isMapsInOfflineMode;
    if ((*(_BYTE *)&self->_flags & 0x10) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_isNetworkConnected;
      if ((*(_BYTE *)&self->_flags & 0x20) != 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_flags & 0x10) != 0)
      goto LABEL_3;
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_flags & 0x20) != 0)
  {
LABEL_4:
    v5 = 2654435761 * self->_isOnlyUseOffline;
    if ((*(_BYTE *)&self->_flags & 4) != 0)
      goto LABEL_5;
    goto LABEL_11;
  }
LABEL_10:
  v5 = 0;
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
LABEL_5:
    v6 = 2654435761 * self->_numberOfDownloadedRegions;
    if ((*(_BYTE *)&self->_flags & 2) != 0)
      goto LABEL_6;
LABEL_12:
    v7 = 0;
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      goto LABEL_7;
LABEL_13:
    v8 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
  }
LABEL_11:
  v6 = 0;
  if ((*(_BYTE *)&self->_flags & 2) == 0)
    goto LABEL_12;
LABEL_6:
  v7 = 2654435761u * self->_searchOdsVersion;
  if ((*(_BYTE *)&self->_flags & 1) == 0)
    goto LABEL_13;
LABEL_7:
  v8 = 2654435761u * self->_routingOdsVersion;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (void)mergeFrom:(id)a3
{
  char v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "readAll:", 0);
  v4 = *((_BYTE *)v5 + 32);
  if ((v4 & 8) != 0)
  {
    self->_isMapsInOfflineMode = *((_BYTE *)v5 + 28);
    *(_BYTE *)&self->_flags |= 8u;
    v4 = *((_BYTE *)v5 + 32);
    if ((v4 & 0x10) == 0)
    {
LABEL_3:
      if ((v4 & 0x20) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*((_BYTE *)v5 + 32) & 0x10) == 0)
  {
    goto LABEL_3;
  }
  self->_isNetworkConnected = *((_BYTE *)v5 + 29);
  *(_BYTE *)&self->_flags |= 0x10u;
  v4 = *((_BYTE *)v5 + 32);
  if ((v4 & 0x20) == 0)
  {
LABEL_4:
    if ((v4 & 4) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  self->_isOnlyUseOffline = *((_BYTE *)v5 + 30);
  *(_BYTE *)&self->_flags |= 0x20u;
  v4 = *((_BYTE *)v5 + 32);
  if ((v4 & 4) == 0)
  {
LABEL_5:
    if ((v4 & 2) == 0)
      goto LABEL_6;
LABEL_13:
    self->_searchOdsVersion = *((_QWORD *)v5 + 2);
    *(_BYTE *)&self->_flags |= 2u;
    if ((*((_BYTE *)v5 + 32) & 1) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_12:
  self->_numberOfDownloadedRegions = *((_DWORD *)v5 + 6);
  *(_BYTE *)&self->_flags |= 4u;
  v4 = *((_BYTE *)v5 + 32);
  if ((v4 & 2) != 0)
    goto LABEL_13;
LABEL_6:
  if ((v4 & 1) != 0)
  {
LABEL_7:
    self->_routingOdsVersion = *((_QWORD *)v5 + 1);
    *(_BYTE *)&self->_flags |= 1u;
  }
LABEL_8:

}

@end
