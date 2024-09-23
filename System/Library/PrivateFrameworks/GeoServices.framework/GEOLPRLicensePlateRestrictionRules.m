@implementation GEOLPRLicensePlateRestrictionRules

- (GEOLPRLicensePlateRestrictionRules)init
{
  GEOLPRLicensePlateRestrictionRules *v2;
  GEOLPRLicensePlateRestrictionRules *v3;
  GEOLPRLicensePlateRestrictionRules *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOLPRLicensePlateRestrictionRules;
  v2 = -[GEOLPRLicensePlateRestrictionRules init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOLPRLicensePlateRestrictionRules)initWithData:(id)a3
{
  GEOLPRLicensePlateRestrictionRules *v3;
  GEOLPRLicensePlateRestrictionRules *v4;
  GEOLPRLicensePlateRestrictionRules *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOLPRLicensePlateRestrictionRules;
  v3 = -[GEOLPRLicensePlateRestrictionRules initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (NSData)version
{
  PBDataReader *reader;
  PBDataReader *v4;

  if (self)
  {
    os_unfair_lock_lock(&self->_readerLock);
    if ((*(_BYTE *)&self->_flags & 2) == 0)
    {
      reader = self->_reader;
      if (reader)
      {
        v4 = reader;
        objc_sync_enter(v4);
        GEOLPRLicensePlateRestrictionRulesReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&_readVersion_tags);
        objc_sync_exit(v4);

      }
    }
    os_unfair_lock_unlock(&self->_readerLock);
  }
  return self->_version;
}

- (void)setVersion:(id)a3
{
  *(_BYTE *)&self->_flags |= 6u;
  objc_storeStrong((id *)&self->_version, a3);
}

- (unsigned)createTime
{
  return self->_createTime;
}

- (void)setCreateTime:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 4u;
  self->_createTime = a3;
}

- (void)_readLicensePlateRegions
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if ((*(_BYTE *)(a1 + 48) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLPRLicensePlateRestrictionRulesReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLicensePlateRegions_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (NSMutableArray)licensePlateRegions
{
  -[GEOLPRLicensePlateRestrictionRules _readLicensePlateRegions]((uint64_t)self);
  return self->_licensePlateRegions;
}

- (void)setLicensePlateRegions:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *licensePlateRegions;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 1u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 4u;
  licensePlateRegions = self->_licensePlateRegions;
  self->_licensePlateRegions = v4;

}

- (void)clearLicensePlateRegions
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 1u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 4u;
  -[NSMutableArray removeAllObjects](self->_licensePlateRegions, "removeAllObjects");
}

- (void)addLicensePlateRegion:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOLPRLicensePlateRestrictionRules _readLicensePlateRegions]((uint64_t)self);
  -[GEOLPRLicensePlateRestrictionRules _addNoFlagsLicensePlateRegion:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 1u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 4u;
}

- (void)_addNoFlagsLicensePlateRegion:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 16);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 16);
      *(_QWORD *)(a1 + 16) = v5;

      v4 = *(void **)(a1 + 16);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)licensePlateRegionsCount
{
  -[GEOLPRLicensePlateRestrictionRules _readLicensePlateRegions]((uint64_t)self);
  return -[NSMutableArray count](self->_licensePlateRegions, "count");
}

- (id)licensePlateRegionAtIndex:(unint64_t)a3
{
  -[GEOLPRLicensePlateRestrictionRules _readLicensePlateRegions]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_licensePlateRegions, "objectAtIndex:", a3);
}

+ (Class)licensePlateRegionType
{
  return (Class)objc_opt_class();
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
  v8.super_class = (Class)GEOLPRLicensePlateRestrictionRules;
  -[GEOLPRLicensePlateRestrictionRules description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOLPRLicensePlateRestrictionRules dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLPRLicensePlateRestrictionRules _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  const __CFString *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)a1, "version");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v5, "base64EncodedStringWithOptions:", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("version"));

    }
    else
    {
      objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("version"));
    }
  }

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 44));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v9 = CFSTR("createTime");
  else
    v9 = CFSTR("create_time");
  objc_msgSend(v4, "setObject:forKey:", v8, v9);

  if (objc_msgSend(*(id *)(a1 + 16), "count"))
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 16), "count"));
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v11 = *(id *)(a1 + 16);
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v21 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v16, "jsonRepresentation");
          else
            objc_msgSend(v16, "dictionaryRepresentation", (_QWORD)v20);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addObject:", v17, (_QWORD)v20);

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v13);
    }

    if (a2)
      v18 = CFSTR("licensePlateRegion");
    else
      v18 = CFSTR("license_plate_region");
    objc_msgSend(v4, "setObject:forKey:", v10, v18, (_QWORD)v20);

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOLPRLicensePlateRestrictionRules _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLPRLicensePlateRestrictionRules)initWithDictionary:(id)a3
{
  return (GEOLPRLicensePlateRestrictionRules *)-[GEOLPRLicensePlateRestrictionRules _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  GEOLPRLicensePlateRegion *v18;
  uint64_t v19;
  void *v20;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("version"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v6, 0);
        objc_msgSend(a1, "setVersion:", v7);

      }
      if (a3)
        v8 = CFSTR("createTime");
      else
        v8 = CFSTR("create_time");
      objc_msgSend(v5, "objectForKeyedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setCreateTime:", objc_msgSend(v9, "unsignedIntValue"));

      if (a3)
        v10 = CFSTR("licensePlateRegion");
      else
        v10 = CFSTR("license_plate_region");
      objc_msgSend(v5, "objectForKeyedSubscript:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v25 = 0u;
        v26 = 0u;
        v23 = 0u;
        v24 = 0u;
        v22 = v11;
        v12 = v11;
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v24;
          do
          {
            for (i = 0; i != v14; ++i)
            {
              if (*(_QWORD *)v24 != v15)
                objc_enumerationMutation(v12);
              v17 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v18 = [GEOLPRLicensePlateRegion alloc];
                if ((a3 & 1) != 0)
                  v19 = -[GEOLPRLicensePlateRegion initWithJSON:](v18, "initWithJSON:", v17);
                else
                  v19 = -[GEOLPRLicensePlateRegion initWithDictionary:](v18, "initWithDictionary:", v17);
                v20 = (void *)v19;
                objc_msgSend(a1, "addLicensePlateRegion:", v19);

              }
            }
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
          }
          while (v14);
        }

        v11 = v22;
      }

    }
  }

  return a1;
}

- (GEOLPRLicensePlateRestrictionRules)initWithJSON:(id)a3
{
  return (GEOLPRLicensePlateRestrictionRules *)-[GEOLPRLicensePlateRestrictionRules _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_460;
    else
      v8 = (int *)&readAll__nonRecursiveTag_461;
    GEOLPRLicensePlateRestrictionRulesReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEOLPRLicensePlateRestrictionRulesCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLPRLicensePlateRestrictionRulesIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLPRLicensePlateRestrictionRulesReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  PBDataReader *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOLPRLicensePlateRestrictionRulesIsDirty((uint64_t)self) & 1) == 0)
  {
    v10 = self->_reader;
    objc_sync_enter(v10);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v11);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v10);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOLPRLicensePlateRestrictionRules readAll:](self, "readAll:", 0);
    PBDataWriterWriteDataField();
    PBDataWriterWriteUint32Field();
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v6 = self->_licensePlateRegions;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v6);
          PBDataWriterWriteSubmessage();
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

  }
}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  id *v8;

  v8 = (id *)a3;
  -[GEOLPRLicensePlateRestrictionRules readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v8 + 1, self->_reader);
  *((_DWORD *)v8 + 8) = self->_readerMarkPos;
  *((_DWORD *)v8 + 9) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  objc_msgSend(v8, "setVersion:", self->_version);
  *((_DWORD *)v8 + 11) = self->_createTime;
  if (-[GEOLPRLicensePlateRestrictionRules licensePlateRegionsCount](self, "licensePlateRegionsCount"))
  {
    objc_msgSend(v8, "clearLicensePlateRegions");
    v4 = -[GEOLPRLicensePlateRestrictionRules licensePlateRegionsCount](self, "licensePlateRegionsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[GEOLPRLicensePlateRestrictionRules licensePlateRegionAtIndex:](self, "licensePlateRegionAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addLicensePlateRegion:", v7);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  uint64_t v8;
  void *v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_BYTE *)&self->_flags & 4) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOLPRLicensePlateRestrictionRulesReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOLPRLicensePlateRestrictionRules readAll:](self, "readAll:", 0);
  v8 = -[NSData copyWithZone:](self->_version, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v8;

  *(_DWORD *)(v5 + 44) = self->_createTime;
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v10 = self->_licensePlateRegions;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v10);
        v14 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v16);
        objc_msgSend((id)v5, "addLicensePlateRegion:", v14);

      }
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSData *version;
  NSMutableArray *licensePlateRegions;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((-[GEOLPRLicensePlateRestrictionRules readAll:](self, "readAll:", 1),
         objc_msgSend(v4, "readAll:", 1),
         version = self->_version,
         !((unint64_t)version | v4[3]))
     || -[NSData isEqual:](version, "isEqual:"))
    && self->_createTime == *((_DWORD *)v4 + 11))
  {
    licensePlateRegions = self->_licensePlateRegions;
    if ((unint64_t)licensePlateRegions | v4[2])
      v7 = -[NSMutableArray isEqual:](licensePlateRegions, "isEqual:");
    else
      v7 = 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;

  -[GEOLPRLicensePlateRestrictionRules readAll:](self, "readAll:", 1);
  v3 = -[NSData hash](self->_version, "hash");
  v4 = 2654435761 * self->_createTime;
  return v4 ^ v3 ^ -[NSMutableArray hash](self->_licensePlateRegions, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  if (*((_QWORD *)v4 + 3))
    -[GEOLPRLicensePlateRestrictionRules setVersion:](self, "setVersion:");
  self->_createTime = *((_DWORD *)v4 + 11);
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = *((id *)v4 + 2);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        -[GEOLPRLicensePlateRestrictionRules addLicensePlateRegion:](self, "addLicensePlateRegion:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i), (_QWORD)v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_licensePlateRegions, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
