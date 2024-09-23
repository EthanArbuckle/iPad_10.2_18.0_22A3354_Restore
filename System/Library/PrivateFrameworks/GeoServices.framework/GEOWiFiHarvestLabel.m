@implementation GEOWiFiHarvestLabel

- (GEOWiFiHarvestLabel)init
{
  GEOWiFiHarvestLabel *v2;
  GEOWiFiHarvestLabel *v3;
  GEOWiFiHarvestLabel *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOWiFiHarvestLabel;
  v2 = -[GEOWiFiHarvestLabel init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOWiFiHarvestLabel)initWithData:(id)a3
{
  GEOWiFiHarvestLabel *v3;
  GEOWiFiHarvestLabel *v4;
  GEOWiFiHarvestLabel *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOWiFiHarvestLabel;
  v3 = -[GEOWiFiHarvestLabel initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (int)originator
{
  os_unfair_lock_s *p_readerLock;
  char flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 2) != 0)
    return self->_originator;
  else
    return 0;
}

- (void)setOriginator:(int)a3
{
  *(_BYTE *)&self->_flags |= 0x22u;
  self->_originator = a3;
}

- (void)setHasOriginator:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 34;
  else
    v3 = 32;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasOriginator
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (id)originatorAsString:(int)a3
{
  if (a3 < 3)
    return off_1E1C122D0[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsOriginator:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_LABEL_ORIGINATOR")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("APP")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("SETTINGS")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_readVenueCategory
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(_BYTE *)(a1 + 60) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOWiFiHarvestLabelReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readVenueCategory_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasVenueCategory
{
  -[GEOWiFiHarvestLabel _readVenueCategory]((uint64_t)self);
  return self->_venueCategory != 0;
}

- (NSString)venueCategory
{
  -[GEOWiFiHarvestLabel _readVenueCategory]((uint64_t)self);
  return self->_venueCategory;
}

- (void)setVenueCategory:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x30u;
  objc_storeStrong((id *)&self->_venueCategory, a3);
}

- (void)_readComment
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(_BYTE *)(a1 + 60) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOWiFiHarvestLabelReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readComment_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasComment
{
  -[GEOWiFiHarvestLabel _readComment]((uint64_t)self);
  return self->_comment != 0;
}

- (NSString)comment
{
  -[GEOWiFiHarvestLabel _readComment]((uint64_t)self);
  return self->_comment;
}

- (void)setComment:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x24u;
  objc_storeStrong((id *)&self->_comment, a3);
}

- (int)networkType
{
  os_unfair_lock_s *p_readerLock;
  char flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 1) != 0)
    return self->_networkType;
  else
    return 0;
}

- (void)setNetworkType:(int)a3
{
  *(_BYTE *)&self->_flags |= 0x21u;
  self->_networkType = a3;
}

- (void)setHasNetworkType:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3 | 0x20;
}

- (BOOL)hasNetworkType
{
  return *(_BYTE *)&self->_flags & 1;
}

- (id)networkTypeAsString:(int)a3
{
  if (a3 < 0x11)
    return off_1E1C122E8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsNetworkType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_NETWORK_TYPE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PRIVATE_NETWORK_TYPE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PRIVATE_WITH_GUEST_ACCESS_NETWORK_TYPE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CHARGEABLE_PUBLIC_NETWORK_TYPE")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FREE_PUBLIC_NETWORK_TYPE")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PERSONAL_DEVICE_NETWORK_TYPE")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EMERGENCY_SERVICE_ONLY_NETWORK_TYPE")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WIFI_NETWORK_TYPE_RESERVED_1")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WIFI_NETWORK_TYPE_RESERVED_2")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WIFI_NETWORK_TYPE_RESERVED_3")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WIFI_NETWORK_TYPE_RESERVED_4")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WIFI_NETWORK_TYPE_RESERVED_5")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WIFI_NETWORK_TYPE_RESERVED_6")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WIFI_NETWORK_TYPE_RESERVED_7")) & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WIFI_NETWORK_TYPE_RESERVED_8")) & 1) != 0)
  {
    v4 = 14;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TEST_OR_EXPERIMENTAL_NETWORK_TYPE")) & 1) != 0)
  {
    v4 = 15;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("WILDCARD_NETWORK_TYPE")))
  {
    v4 = 16;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_readInternalIdentifier
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(_BYTE *)(a1 + 60) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOWiFiHarvestLabelReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readInternalIdentifier_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasInternalIdentifier
{
  -[GEOWiFiHarvestLabel _readInternalIdentifier]((uint64_t)self);
  return self->_internalIdentifier != 0;
}

- (NSString)internalIdentifier
{
  -[GEOWiFiHarvestLabel _readInternalIdentifier]((uint64_t)self);
  return self->_internalIdentifier;
}

- (void)setInternalIdentifier:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x28u;
  objc_storeStrong((id *)&self->_internalIdentifier, a3);
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
  v8.super_class = (Class)GEOWiFiHarvestLabel;
  -[GEOWiFiHarvestLabel description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOWiFiHarvestLabel dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v2;
  uint64_t v3;
  __CFString *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  __CFString *v8;
  void *v9;

  if (a1)
  {
    objc_msgSend((id)a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if ((*(_BYTE *)(a1 + 60) & 2) != 0)
    {
      v3 = *(int *)(a1 + 56);
      if (v3 >= 3)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 56));
        v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v4 = off_1E1C122D0[v3];
      }
      objc_msgSend(v2, "setObject:forKey:", v4, CFSTR("originator"));

    }
    objc_msgSend((id)a1, "venueCategory");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      objc_msgSend(v2, "setObject:forKey:", v5, CFSTR("venueCategory"));

    objc_msgSend((id)a1, "comment");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      objc_msgSend(v2, "setObject:forKey:", v6, CFSTR("comment"));

    if ((*(_BYTE *)(a1 + 60) & 1) != 0)
    {
      v7 = *(int *)(a1 + 52);
      if (v7 >= 0x11)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 52));
        v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v8 = off_1E1C122E8[v7];
      }
      objc_msgSend(v2, "setObject:forKey:", v8, CFSTR("networkType"));

    }
    objc_msgSend((id)a1, "internalIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
      objc_msgSend(v2, "setObject:forKey:", v9, CFSTR("internalIdentifier"));

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (GEOWiFiHarvestLabel)initWithDictionary:(id)a3
{
  return (GEOWiFiHarvestLabel *)-[GEOWiFiHarvestLabel _initWithDictionary:isJSON:](self, a3);
}

- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;

  v3 = a2;
  if (!a1)
    goto LABEL_62;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_62;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("originator"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("UNKNOWN_LABEL_ORIGINATOR")) & 1) != 0)
    {
      v6 = 0;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("APP")) & 1) != 0)
    {
      v6 = 1;
    }
    else if (objc_msgSend(v5, "isEqualToString:", CFSTR("SETTINGS")))
    {
      v6 = 2;
    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_15;
    v6 = objc_msgSend(v4, "intValue");
  }
  objc_msgSend(a1, "setOriginator:", v6);
LABEL_15:

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("venueCategory"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(a1, "setVenueCategory:", v8);

  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("comment"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = (void *)objc_msgSend(v9, "copy");
    objc_msgSend(a1, "setComment:", v10);

  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("networkType"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12 = v11;
    if ((objc_msgSend(v12, "isEqualToString:", CFSTR("UNKNOWN_NETWORK_TYPE")) & 1) != 0)
    {
      v13 = 0;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("PRIVATE_NETWORK_TYPE")) & 1) != 0)
    {
      v13 = 1;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("PRIVATE_WITH_GUEST_ACCESS_NETWORK_TYPE")) & 1) != 0)
    {
      v13 = 2;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("CHARGEABLE_PUBLIC_NETWORK_TYPE")) & 1) != 0)
    {
      v13 = 3;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("FREE_PUBLIC_NETWORK_TYPE")) & 1) != 0)
    {
      v13 = 4;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("PERSONAL_DEVICE_NETWORK_TYPE")) & 1) != 0)
    {
      v13 = 5;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("EMERGENCY_SERVICE_ONLY_NETWORK_TYPE")) & 1) != 0)
    {
      v13 = 6;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("WIFI_NETWORK_TYPE_RESERVED_1")) & 1) != 0)
    {
      v13 = 7;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("WIFI_NETWORK_TYPE_RESERVED_2")) & 1) != 0)
    {
      v13 = 8;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("WIFI_NETWORK_TYPE_RESERVED_3")) & 1) != 0)
    {
      v13 = 9;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("WIFI_NETWORK_TYPE_RESERVED_4")) & 1) != 0)
    {
      v13 = 10;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("WIFI_NETWORK_TYPE_RESERVED_5")) & 1) != 0)
    {
      v13 = 11;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("WIFI_NETWORK_TYPE_RESERVED_6")) & 1) != 0)
    {
      v13 = 12;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("WIFI_NETWORK_TYPE_RESERVED_7")) & 1) != 0)
    {
      v13 = 13;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("WIFI_NETWORK_TYPE_RESERVED_8")) & 1) != 0)
    {
      v13 = 14;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("TEST_OR_EXPERIMENTAL_NETWORK_TYPE")) & 1) != 0)
    {
      v13 = 15;
    }
    else if (objc_msgSend(v12, "isEqualToString:", CFSTR("WILDCARD_NETWORK_TYPE")))
    {
      v13 = 16;
    }
    else
    {
      v13 = 0;
    }

    goto LABEL_58;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v13 = objc_msgSend(v11, "intValue");
LABEL_58:
    objc_msgSend(a1, "setNetworkType:", v13);
  }

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("internalIdentifier"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v15 = (void *)objc_msgSend(v14, "copy");
    objc_msgSend(a1, "setInternalIdentifier:", v15);

  }
LABEL_62:

  return a1;
}

- (GEOWiFiHarvestLabel)initWithJSON:(id)a3
{
  return (GEOWiFiHarvestLabel *)-[GEOWiFiHarvestLabel _initWithDictionary:isJSON:](self, a3);
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
      v8 = (int *)&readAll__recursiveTag_894;
    else
      v8 = (int *)&readAll__nonRecursiveTag_895;
    GEOWiFiHarvestLabelReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOWiFiHarvestLabelIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOWiFiHarvestLabelReadAllFrom((uint64_t)self, a3, 0);
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
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_BYTE *)&self->_flags & 0x3C) == 0))
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
    -[GEOWiFiHarvestLabel readAll:](self, "readAll:", 0);
    if ((*(_BYTE *)&self->_flags & 2) != 0)
      PBDataWriterWriteInt32Field();
    if (self->_venueCategory)
      PBDataWriterWriteStringField();
    if (self->_comment)
      PBDataWriterWriteStringField();
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      PBDataWriterWriteInt32Field();
    if (self->_internalIdentifier)
      PBDataWriterWriteStringField();
  }

}

- (void)copyTo:(id)a3
{
  id *v4;
  id *v5;

  v5 = (id *)a3;
  -[GEOWiFiHarvestLabel readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 10) = self->_readerMarkPos;
  *((_DWORD *)v5 + 11) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  v4 = v5;
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    *((_DWORD *)v5 + 14) = self->_originator;
    *((_BYTE *)v5 + 60) |= 2u;
  }
  if (self->_venueCategory)
  {
    objc_msgSend(v5, "setVenueCategory:");
    v4 = v5;
  }
  if (self->_comment)
  {
    objc_msgSend(v5, "setComment:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *((_DWORD *)v4 + 13) = self->_networkType;
    *((_BYTE *)v4 + 60) |= 1u;
  }
  if (self->_internalIdentifier)
  {
    objc_msgSend(v5, "setInternalIdentifier:");
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

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_BYTE *)&self->_flags & 0x20) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOWiFiHarvestLabelReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_10;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOWiFiHarvestLabel readAll:](self, "readAll:", 0);
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 56) = self->_originator;
    *(_BYTE *)(v5 + 60) |= 2u;
  }
  v9 = -[NSString copyWithZone:](self->_venueCategory, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v9;

  v11 = -[NSString copyWithZone:](self->_comment, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v11;

  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 52) = self->_networkType;
    *(_BYTE *)(v5 + 60) |= 1u;
  }
  v13 = -[NSString copyWithZone:](self->_internalIdentifier, "copyWithZone:", a3);
  v8 = *(id *)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v13;
LABEL_10:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *venueCategory;
  NSString *comment;
  NSString *internalIdentifier;
  char v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_18;
  -[GEOWiFiHarvestLabel readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 2) == 0 || self->_originator != *((_DWORD *)v4 + 14))
      goto LABEL_18;
  }
  else if ((*((_BYTE *)v4 + 60) & 2) != 0)
  {
LABEL_18:
    v8 = 0;
    goto LABEL_19;
  }
  venueCategory = self->_venueCategory;
  if ((unint64_t)venueCategory | *((_QWORD *)v4 + 4)
    && !-[NSString isEqual:](venueCategory, "isEqual:"))
  {
    goto LABEL_18;
  }
  comment = self->_comment;
  if ((unint64_t)comment | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](comment, "isEqual:"))
      goto LABEL_18;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 1) == 0 || self->_networkType != *((_DWORD *)v4 + 13))
      goto LABEL_18;
  }
  else if ((*((_BYTE *)v4 + 60) & 1) != 0)
  {
    goto LABEL_18;
  }
  internalIdentifier = self->_internalIdentifier;
  if ((unint64_t)internalIdentifier | *((_QWORD *)v4 + 3))
    v8 = -[NSString isEqual:](internalIdentifier, "isEqual:");
  else
    v8 = 1;
LABEL_19:

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  uint64_t v6;

  -[GEOWiFiHarvestLabel readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 2) != 0)
    v3 = 2654435761 * self->_originator;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_venueCategory, "hash");
  v5 = -[NSString hash](self->_comment, "hash");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v6 = 2654435761 * self->_networkType;
  else
    v6 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ -[NSString hash](self->_internalIdentifier, "hash");
}

- (void)mergeFrom:(id)a3
{
  int *v4;
  int *v5;

  v5 = (int *)a3;
  objc_msgSend(v5, "readAll:", 0);
  v4 = v5;
  if ((v5[15] & 2) != 0)
  {
    self->_originator = v5[14];
    *(_BYTE *)&self->_flags |= 2u;
  }
  if (*((_QWORD *)v5 + 4))
  {
    -[GEOWiFiHarvestLabel setVenueCategory:](self, "setVenueCategory:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 2))
  {
    -[GEOWiFiHarvestLabel setComment:](self, "setComment:");
    v4 = v5;
  }
  if ((v4[15] & 1) != 0)
  {
    self->_networkType = v4[13];
    *(_BYTE *)&self->_flags |= 1u;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[GEOWiFiHarvestLabel setInternalIdentifier:](self, "setInternalIdentifier:");
    v4 = v5;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_venueCategory, 0);
  objc_storeStrong((id *)&self->_internalIdentifier, 0);
  objc_storeStrong((id *)&self->_comment, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
