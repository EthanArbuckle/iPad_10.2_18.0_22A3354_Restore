@implementation GEOPBCompanionSubscription

- (GEOPBCompanionSubscription)init
{
  GEOPBCompanionSubscription *v2;
  GEOPBCompanionSubscription *v3;
  GEOPBCompanionSubscription *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPBCompanionSubscription;
  v2 = -[GEOPBCompanionSubscription init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPBCompanionSubscription)initWithData:(id)a3
{
  GEOPBCompanionSubscription *v3;
  GEOPBCompanionSubscription *v4;
  GEOPBCompanionSubscription *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPBCompanionSubscription;
  v3 = -[GEOPBCompanionSubscription initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readIdentifier
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 92) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPBCompanionSubscriptionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readIdentifier_tags_3);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasIdentifier
{
  -[GEOPBCompanionSubscription _readIdentifier]((uint64_t)self);
  return self->_identifier != 0;
}

- (NSString)identifier
{
  -[GEOPBCompanionSubscription _readIdentifier]((uint64_t)self);
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  *(_WORD *)&self->_flags |= 0x240u;
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (void)_readRegion
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 92) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPBCompanionSubscriptionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRegion_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasRegion
{
  -[GEOPBCompanionSubscription _readRegion]((uint64_t)self);
  return self->_region != 0;
}

- (GEOMapRegion)region
{
  -[GEOPBCompanionSubscription _readRegion]((uint64_t)self);
  return self->_region;
}

- (void)setRegion:(id)a3
{
  *(_WORD *)&self->_flags |= 0x300u;
  objc_storeStrong((id *)&self->_region, a3);
}

- (unint64_t)dataType
{
  return self->_dataType;
}

- (void)setDataType:(unint64_t)a3
{
  *(_WORD *)&self->_flags |= 0x201u;
  self->_dataType = a3;
}

- (void)setHasDataType:(BOOL)a3
{
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFE | a3 | 0x200;
}

- (BOOL)hasDataType
{
  return *(_WORD *)&self->_flags & 1;
}

- (unsigned)policy
{
  return self->_policy;
}

- (void)setPolicy:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x204u;
  self->_policy = a3;
}

- (void)setHasPolicy:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 516;
  else
    v3 = 512;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFB | v3;
}

- (BOOL)hasPolicy
{
  return (*(_WORD *)&self->_flags >> 2) & 1;
}

- (void)_readOriginatingBundleIdentifier
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 92) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPBCompanionSubscriptionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readOriginatingBundleIdentifier_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasOriginatingBundleIdentifier
{
  -[GEOPBCompanionSubscription _readOriginatingBundleIdentifier]((uint64_t)self);
  return self->_originatingBundleIdentifier != 0;
}

- (NSString)originatingBundleIdentifier
{
  -[GEOPBCompanionSubscription _readOriginatingBundleIdentifier]((uint64_t)self);
  return self->_originatingBundleIdentifier;
}

- (void)setOriginatingBundleIdentifier:(id)a3
{
  *(_WORD *)&self->_flags |= 0x280u;
  objc_storeStrong((id *)&self->_originatingBundleIdentifier, a3);
}

- (void)_readDisplayName
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 92) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPBCompanionSubscriptionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDisplayName_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasDisplayName
{
  -[GEOPBCompanionSubscription _readDisplayName]((uint64_t)self);
  return self->_displayName != 0;
}

- (NSString)displayName
{
  -[GEOPBCompanionSubscription _readDisplayName]((uint64_t)self);
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
  *(_WORD *)&self->_flags |= 0x220u;
  objc_storeStrong((id *)&self->_displayName, a3);
}

- (BOOL)syncToWatch
{
  return self->_syncToWatch;
}

- (void)setSyncToWatch:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x208u;
  self->_syncToWatch = a3;
}

- (void)setHasSyncToWatch:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 520;
  else
    v3 = 512;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFF7 | v3;
}

- (BOOL)hasSyncToWatch
{
  return (*(_WORD *)&self->_flags >> 3) & 1;
}

- (unint64_t)downloadedDataBytes
{
  return self->_downloadedDataBytes;
}

- (void)setDownloadedDataBytes:(unint64_t)a3
{
  *(_WORD *)&self->_flags |= 0x202u;
  self->_downloadedDataBytes = a3;
}

- (void)setHasDownloadedDataBytes:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 514;
  else
    v3 = 512;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasDownloadedDataBytes
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
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
  v8.super_class = (Class)GEOPBCompanionSubscription;
  -[GEOPBCompanionSubscription description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPBCompanionSubscription dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPBCompanionSubscription _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  __int16 v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  const __CFString *v16;
  __int16 v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  _QWORD v29[4];
  id v30;

  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)a1, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("identifier"));

  objc_msgSend((id)a1, "region");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v6, "jsonRepresentation");
    else
      objc_msgSend(v6, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("region"));

  }
  v9 = *(_WORD *)(a1 + 92);
  if ((v9 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 24));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v11 = CFSTR("dataType");
    else
      v11 = CFSTR("data_type");
    objc_msgSend(v4, "setObject:forKey:", v10, v11);

    v9 = *(_WORD *)(a1 + 92);
  }
  if ((v9 & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 84));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("policy"));

  }
  objc_msgSend((id)a1, "originatingBundleIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    if (a2)
      v14 = CFSTR("originatingBundleIdentifier");
    else
      v14 = CFSTR("originating_bundle_identifier");
    objc_msgSend(v4, "setObject:forKey:", v13, v14);
  }

  objc_msgSend((id)a1, "displayName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    if (a2)
      v16 = CFSTR("displayName");
    else
      v16 = CFSTR("display_name");
    objc_msgSend(v4, "setObject:forKey:", v15, v16);
  }

  v17 = *(_WORD *)(a1 + 92);
  if ((v17 & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 88));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v19 = CFSTR("syncToWatch");
    else
      v19 = CFSTR("sync_to_watch");
    objc_msgSend(v4, "setObject:forKey:", v18, v19);

    v17 = *(_WORD *)(a1 + 92);
  }
  if ((v17 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 40));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v21 = CFSTR("downloadedDataBytes");
    else
      v21 = CFSTR("downloaded_data_bytes");
    objc_msgSend(v4, "setObject:forKey:", v20, v21);

  }
  v22 = *(void **)(a1 + 16);
  if (v22)
  {
    objc_msgSend(v22, "dictionaryRepresentation");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v23, "count"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __56__GEOPBCompanionSubscription__dictionaryRepresentation___block_invoke;
      v29[3] = &unk_1E1C00600;
      v26 = v25;
      v30 = v26;
      objc_msgSend(v24, "enumerateKeysAndObjectsUsingBlock:", v29);
      v27 = v26;

      v24 = v27;
    }
    objc_msgSend(v4, "setObject:forKey:", v24, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPBCompanionSubscription _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __56__GEOPBCompanionSubscription__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOPBCompanionSubscription)initWithDictionary:(id)a3
{
  return (GEOPBCompanionSubscription *)-[GEOPBCompanionSubscription _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  GEOMapRegion *v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  const __CFString *v23;
  void *v24;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("identifier"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = (void *)objc_msgSend(v6, "copy");
        objc_msgSend(a1, "setIdentifier:", v7);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("region"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v9 = [GEOMapRegion alloc];
        if ((a3 & 1) != 0)
          v10 = -[GEOMapRegion initWithJSON:](v9, "initWithJSON:", v8);
        else
          v10 = -[GEOMapRegion initWithDictionary:](v9, "initWithDictionary:", v8);
        v11 = (void *)v10;
        objc_msgSend(a1, "setRegion:", v10);

      }
      if (a3)
        v12 = CFSTR("dataType");
      else
        v12 = CFSTR("data_type");
      objc_msgSend(v5, "objectForKeyedSubscript:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setDataType:", objc_msgSend(v13, "unsignedLongLongValue"));

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("policy"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setPolicy:", objc_msgSend(v14, "unsignedIntValue"));

      if (a3)
        v15 = CFSTR("originatingBundleIdentifier");
      else
        v15 = CFSTR("originating_bundle_identifier");
      objc_msgSend(v5, "objectForKeyedSubscript:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v17 = (void *)objc_msgSend(v16, "copy");
        objc_msgSend(a1, "setOriginatingBundleIdentifier:", v17);

      }
      if (a3)
        v18 = CFSTR("displayName");
      else
        v18 = CFSTR("display_name");
      objc_msgSend(v5, "objectForKeyedSubscript:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v20 = (void *)objc_msgSend(v19, "copy");
        objc_msgSend(a1, "setDisplayName:", v20);

      }
      if (a3)
        v21 = CFSTR("syncToWatch");
      else
        v21 = CFSTR("sync_to_watch");
      objc_msgSend(v5, "objectForKeyedSubscript:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setSyncToWatch:", objc_msgSend(v22, "BOOLValue"));

      if (a3)
        v23 = CFSTR("downloadedDataBytes");
      else
        v23 = CFSTR("downloaded_data_bytes");
      objc_msgSend(v5, "objectForKeyedSubscript:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setDownloadedDataBytes:", objc_msgSend(v24, "unsignedLongLongValue"));

    }
  }

  return a1;
}

- (GEOPBCompanionSubscription)initWithJSON:(id)a3
{
  return (GEOPBCompanionSubscription *)-[GEOPBCompanionSubscription _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_24;
    else
      v8 = (int *)&readAll__nonRecursiveTag_24;
    GEOPBCompanionSubscriptionReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    -[GEOMapRegion readAll:](self->_region, "readAll:", 1);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPBCompanionSubscriptionIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPBCompanionSubscriptionReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  id v5;
  __int16 flags;
  __int16 v7;
  PBDataReader *v8;
  void *v9;
  id v10;

  v10 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_WORD *)&self->_flags & 0x3E0) == 0))
  {
    v8 = self->_reader;
    objc_sync_enter(v8);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "writeData:", v9);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v8);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPBCompanionSubscription readAll:](self, "readAll:", 0);
    if (self->_identifier)
      PBDataWriterWriteStringField();
    v5 = v10;
    if (self->_region)
    {
      PBDataWriterWriteSubmessage();
      v5 = v10;
    }
    flags = (__int16)self->_flags;
    if ((flags & 1) != 0)
    {
      PBDataWriterWriteUint64Field();
      v5 = v10;
      flags = (__int16)self->_flags;
    }
    if ((flags & 4) != 0)
    {
      PBDataWriterWriteUint32Field();
      v5 = v10;
    }
    if (self->_originatingBundleIdentifier)
    {
      PBDataWriterWriteStringField();
      v5 = v10;
    }
    if (self->_displayName)
    {
      PBDataWriterWriteStringField();
      v5 = v10;
    }
    v7 = (__int16)self->_flags;
    if ((v7 & 8) != 0)
    {
      PBDataWriterWriteBOOLField();
      v5 = v10;
      v7 = (__int16)self->_flags;
    }
    if ((v7 & 2) != 0)
    {
      PBDataWriterWriteUint64Field();
      v5 = v10;
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v5);
  }

}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[GEOPBCompanionSubscription _readRegion]((uint64_t)self);
  return -[GEOMapRegion hasGreenTeaWithValue:](self->_region, "hasGreenTeaWithValue:", v3);
}

- (void)copyTo:(id)a3
{
  __int16 flags;
  id *v5;
  __int16 v6;
  id *v7;

  v7 = (id *)a3;
  -[GEOPBCompanionSubscription readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v7 + 1, self->_reader);
  *((_DWORD *)v7 + 18) = self->_readerMarkPos;
  *((_DWORD *)v7 + 19) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_identifier)
    objc_msgSend(v7, "setIdentifier:");
  if (self->_region)
    objc_msgSend(v7, "setRegion:");
  flags = (__int16)self->_flags;
  v5 = v7;
  if ((flags & 1) != 0)
  {
    v7[3] = (id)self->_dataType;
    *((_WORD *)v7 + 46) |= 1u;
    flags = (__int16)self->_flags;
  }
  if ((flags & 4) != 0)
  {
    *((_DWORD *)v7 + 21) = self->_policy;
    *((_WORD *)v7 + 46) |= 4u;
  }
  if (self->_originatingBundleIdentifier)
  {
    objc_msgSend(v7, "setOriginatingBundleIdentifier:");
    v5 = v7;
  }
  if (self->_displayName)
  {
    objc_msgSend(v7, "setDisplayName:");
    v5 = v7;
  }
  v6 = (__int16)self->_flags;
  if ((v6 & 8) != 0)
  {
    *((_BYTE *)v5 + 88) = self->_syncToWatch;
    *((_WORD *)v5 + 46) |= 8u;
    v6 = (__int16)self->_flags;
  }
  if ((v6 & 2) != 0)
  {
    v5[5] = (id)self->_downloadedDataBytes;
    *((_WORD *)v5 + 46) |= 2u;
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
  id v11;
  void *v12;
  __int16 flags;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  __int16 v18;
  PBUnknownFields *v19;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x200) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOPBCompanionSubscriptionReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_14;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPBCompanionSubscription readAll:](self, "readAll:", 0);
  v9 = -[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v9;

  v11 = -[GEOMapRegion copyWithZone:](self->_region, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v11;

  flags = (__int16)self->_flags;
  if ((flags & 1) != 0)
  {
    *(_QWORD *)(v5 + 24) = self->_dataType;
    *(_WORD *)(v5 + 92) |= 1u;
    flags = (__int16)self->_flags;
  }
  if ((flags & 4) != 0)
  {
    *(_DWORD *)(v5 + 84) = self->_policy;
    *(_WORD *)(v5 + 92) |= 4u;
  }
  v14 = -[NSString copyWithZone:](self->_originatingBundleIdentifier, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v14;

  v16 = -[NSString copyWithZone:](self->_displayName, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v16;

  v18 = (__int16)self->_flags;
  if ((v18 & 8) != 0)
  {
    *(_BYTE *)(v5 + 88) = self->_syncToWatch;
    *(_WORD *)(v5 + 92) |= 8u;
    v18 = (__int16)self->_flags;
  }
  if ((v18 & 2) != 0)
  {
    *(_QWORD *)(v5 + 40) = self->_downloadedDataBytes;
    *(_WORD *)(v5 + 92) |= 2u;
  }
  v19 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v19;
LABEL_14:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *identifier;
  GEOMapRegion *region;
  __int16 flags;
  __int16 v8;
  NSString *originatingBundleIdentifier;
  NSString *displayName;
  __int16 v11;
  __int16 v12;
  BOOL v13;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_32;
  -[GEOPBCompanionSubscription readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  identifier = self->_identifier;
  if ((unint64_t)identifier | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](identifier, "isEqual:"))
      goto LABEL_32;
  }
  region = self->_region;
  if ((unint64_t)region | *((_QWORD *)v4 + 8))
  {
    if (!-[GEOMapRegion isEqual:](region, "isEqual:"))
      goto LABEL_32;
  }
  flags = (__int16)self->_flags;
  v8 = *((_WORD *)v4 + 46);
  if ((flags & 1) != 0)
  {
    if ((v8 & 1) == 0 || self->_dataType != *((_QWORD *)v4 + 3))
      goto LABEL_32;
  }
  else if ((v8 & 1) != 0)
  {
    goto LABEL_32;
  }
  if ((flags & 4) != 0)
  {
    if ((v8 & 4) == 0 || self->_policy != *((_DWORD *)v4 + 21))
      goto LABEL_32;
  }
  else if ((v8 & 4) != 0)
  {
    goto LABEL_32;
  }
  originatingBundleIdentifier = self->_originatingBundleIdentifier;
  if ((unint64_t)originatingBundleIdentifier | *((_QWORD *)v4 + 7)
    && !-[NSString isEqual:](originatingBundleIdentifier, "isEqual:"))
  {
    goto LABEL_32;
  }
  displayName = self->_displayName;
  if ((unint64_t)displayName | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](displayName, "isEqual:"))
      goto LABEL_32;
  }
  v11 = (__int16)self->_flags;
  v12 = *((_WORD *)v4 + 46);
  if ((v11 & 8) != 0)
  {
    if ((v12 & 8) != 0)
    {
      if (self->_syncToWatch)
      {
        if (!*((_BYTE *)v4 + 88))
          goto LABEL_32;
        goto LABEL_28;
      }
      if (!*((_BYTE *)v4 + 88))
        goto LABEL_28;
    }
LABEL_32:
    v13 = 0;
    goto LABEL_33;
  }
  if ((v12 & 8) != 0)
    goto LABEL_32;
LABEL_28:
  v13 = (v12 & 2) == 0;
  if ((v11 & 2) != 0)
  {
    if ((v12 & 2) == 0 || self->_downloadedDataBytes != *((_QWORD *)v4 + 5))
      goto LABEL_32;
    v13 = 1;
  }
LABEL_33:

  return v13;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;
  __int16 flags;
  unint64_t v6;
  uint64_t v7;
  NSUInteger v8;
  NSUInteger v9;
  __int16 v10;
  uint64_t v11;
  unint64_t v12;

  -[GEOPBCompanionSubscription readAll:](self, "readAll:", 1);
  v3 = -[NSString hash](self->_identifier, "hash");
  v4 = -[GEOMapRegion hash](self->_region, "hash");
  flags = (__int16)self->_flags;
  if ((flags & 1) != 0)
  {
    v6 = 2654435761u * self->_dataType;
    if ((flags & 4) != 0)
      goto LABEL_3;
  }
  else
  {
    v6 = 0;
    if ((flags & 4) != 0)
    {
LABEL_3:
      v7 = 2654435761 * self->_policy;
      goto LABEL_6;
    }
  }
  v7 = 0;
LABEL_6:
  v8 = -[NSString hash](self->_originatingBundleIdentifier, "hash");
  v9 = -[NSString hash](self->_displayName, "hash");
  v10 = (__int16)self->_flags;
  if ((v10 & 8) != 0)
  {
    v11 = 2654435761 * self->_syncToWatch;
    if ((v10 & 2) != 0)
      goto LABEL_8;
LABEL_10:
    v12 = 0;
    return v4 ^ v3 ^ v6 ^ v7 ^ v8 ^ v9 ^ v11 ^ v12;
  }
  v11 = 0;
  if ((v10 & 2) == 0)
    goto LABEL_10;
LABEL_8:
  v12 = 2654435761u * self->_downloadedDataBytes;
  return v4 ^ v3 ^ v6 ^ v7 ^ v8 ^ v9 ^ v11 ^ v12;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  GEOMapRegion *region;
  uint64_t v6;
  __int16 v7;
  __int16 v8;
  _QWORD *v9;

  v9 = a3;
  objc_msgSend(v9, "readAll:", 0);
  v4 = v9;
  if (v9[6])
  {
    -[GEOPBCompanionSubscription setIdentifier:](self, "setIdentifier:");
    v4 = v9;
  }
  region = self->_region;
  v6 = v4[8];
  if (region)
  {
    if (!v6)
      goto LABEL_9;
    -[GEOMapRegion mergeFrom:](region, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_9;
    -[GEOPBCompanionSubscription setRegion:](self, "setRegion:");
  }
  v4 = v9;
LABEL_9:
  v7 = *((_WORD *)v4 + 46);
  if ((v7 & 1) != 0)
  {
    self->_dataType = v4[3];
    *(_WORD *)&self->_flags |= 1u;
    v7 = *((_WORD *)v4 + 46);
  }
  if ((v7 & 4) != 0)
  {
    self->_policy = *((_DWORD *)v4 + 21);
    *(_WORD *)&self->_flags |= 4u;
  }
  if (v4[7])
  {
    -[GEOPBCompanionSubscription setOriginatingBundleIdentifier:](self, "setOriginatingBundleIdentifier:");
    v4 = v9;
  }
  if (v4[4])
  {
    -[GEOPBCompanionSubscription setDisplayName:](self, "setDisplayName:");
    v4 = v9;
  }
  v8 = *((_WORD *)v4 + 46);
  if ((v8 & 8) != 0)
  {
    self->_syncToWatch = *((_BYTE *)v4 + 88);
    *(_WORD *)&self->_flags |= 8u;
    v8 = *((_WORD *)v4 + 46);
  }
  if ((v8 & 2) != 0)
  {
    self->_downloadedDataBytes = v4[5];
    *(_WORD *)&self->_flags |= 2u;
  }

}

- (PBUnknownFields)unknownFields
{
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v5;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_WORD *)&self->_flags & 0x10) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      v5 = reader;
      objc_sync_enter(v5);
      GEOPBCompanionSubscriptionReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_4);
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
  *(_WORD *)&self->_flags |= 0x210u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEOPBCompanionSubscription readAll:](self, "readAll:", 0);
    -[GEOMapRegion clearUnknownFields:](self->_region, "clearUnknownFields:", 1);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_region, 0);
  objc_storeStrong((id *)&self->_originatingBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
