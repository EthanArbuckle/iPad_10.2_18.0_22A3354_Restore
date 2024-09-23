@implementation GEORPCurrentEnvironmentManifestURLs

- (GEORPCurrentEnvironmentManifestURLs)init
{
  GEORPCurrentEnvironmentManifestURLs *v2;
  GEORPCurrentEnvironmentManifestURLs *v3;
  GEORPCurrentEnvironmentManifestURLs *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEORPCurrentEnvironmentManifestURLs;
  v2 = -[GEORPCurrentEnvironmentManifestURLs init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPCurrentEnvironmentManifestURLs)initWithData:(id)a3
{
  GEORPCurrentEnvironmentManifestURLs *v3;
  GEORPCurrentEnvironmentManifestURLs *v4;
  GEORPCurrentEnvironmentManifestURLs *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEORPCurrentEnvironmentManifestURLs;
  v3 = -[GEORPCurrentEnvironmentManifestURLs initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readEnvironmentDisplayName
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(_BYTE *)(a1 + 52) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPCurrentEnvironmentManifestURLsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readEnvironmentDisplayName_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasEnvironmentDisplayName
{
  -[GEORPCurrentEnvironmentManifestURLs _readEnvironmentDisplayName]((uint64_t)self);
  return self->_environmentDisplayName != 0;
}

- (NSString)environmentDisplayName
{
  -[GEORPCurrentEnvironmentManifestURLs _readEnvironmentDisplayName]((uint64_t)self);
  return self->_environmentDisplayName;
}

- (void)setEnvironmentDisplayName:(id)a3
{
  *(_BYTE *)&self->_flags |= 9u;
  objc_storeStrong((id *)&self->_environmentDisplayName, a3);
}

- (void)_readEnvironmentReleaseName
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(_BYTE *)(a1 + 52) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPCurrentEnvironmentManifestURLsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readEnvironmentReleaseName_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasEnvironmentReleaseName
{
  -[GEORPCurrentEnvironmentManifestURLs _readEnvironmentReleaseName]((uint64_t)self);
  return self->_environmentReleaseName != 0;
}

- (NSString)environmentReleaseName
{
  -[GEORPCurrentEnvironmentManifestURLs _readEnvironmentReleaseName]((uint64_t)self);
  return self->_environmentReleaseName;
}

- (void)setEnvironmentReleaseName:(id)a3
{
  *(_BYTE *)&self->_flags |= 0xAu;
  objc_storeStrong((id *)&self->_environmentReleaseName, a3);
}

- (void)_readUrls
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(_BYTE *)(a1 + 52) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPCurrentEnvironmentManifestURLsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readUrls_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (NSMutableArray)urls
{
  -[GEORPCurrentEnvironmentManifestURLs _readUrls]((uint64_t)self);
  return self->_urls;
}

- (void)setUrls:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *urls;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 8u;
  urls = self->_urls;
  self->_urls = v4;

}

- (void)clearUrls
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 8u;
  -[NSMutableArray removeAllObjects](self->_urls, "removeAllObjects");
}

- (void)addUrl:(id)a3
{
  id v4;

  v4 = a3;
  -[GEORPCurrentEnvironmentManifestURLs _readUrls]((uint64_t)self);
  -[GEORPCurrentEnvironmentManifestURLs _addNoFlagsUrl:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 8u;
}

- (void)_addNoFlagsUrl:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 32);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 32);
      *(_QWORD *)(a1 + 32) = v5;

      v4 = *(void **)(a1 + 32);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)urlsCount
{
  -[GEORPCurrentEnvironmentManifestURLs _readUrls]((uint64_t)self);
  return -[NSMutableArray count](self->_urls, "count");
}

- (id)urlAtIndex:(unint64_t)a3
{
  -[GEORPCurrentEnvironmentManifestURLs _readUrls]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_urls, "objectAtIndex:", a3);
}

+ (Class)urlType
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
  v8.super_class = (Class)GEORPCurrentEnvironmentManifestURLs;
  -[GEORPCurrentEnvironmentManifestURLs description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORPCurrentEnvironmentManifestURLs dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPCurrentEnvironmentManifestURLs _dictionaryRepresentation:]((id *)&self->super.super.isa, 0);
}

- (id)_dictionaryRepresentation:(id *)a1
{
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend(a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "environmentDisplayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (a2)
      v6 = CFSTR("environmentDisplayName");
    else
      v6 = CFSTR("environment_display_name");
    objc_msgSend(v4, "setObject:forKey:", v5, v6);
  }

  objc_msgSend(a1, "environmentReleaseName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    if (a2)
      v8 = CFSTR("environmentReleaseName");
    else
      v8 = CFSTR("environment_release_name");
    objc_msgSend(v4, "setObject:forKey:", v7, v8);
  }

  if (objc_msgSend(a1[4], "count"))
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(a1[4], "count"));
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v10 = a1[4];
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v19 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v15, "jsonRepresentation");
          else
            objc_msgSend(v15, "dictionaryRepresentation", (_QWORD)v18);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v16, (_QWORD)v18);

        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v12);
    }

    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("url"));
  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEORPCurrentEnvironmentManifestURLs _dictionaryRepresentation:]((id *)&self->super.super.isa, 1);
}

- (GEORPCurrentEnvironmentManifestURLs)initWithDictionary:(id)a3
{
  return (GEORPCurrentEnvironmentManifestURLs *)-[GEORPCurrentEnvironmentManifestURLs _initWithDictionary:isJSON:](self, a3, 0);
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
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  GEORPManifestURL *v19;
  uint64_t v20;
  void *v21;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("environmentDisplayName");
      else
        v6 = CFSTR("environment_display_name");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = (void *)objc_msgSend(v7, "copy");
        objc_msgSend(a1, "setEnvironmentDisplayName:", v8);

      }
      if (a3)
        v9 = CFSTR("environmentReleaseName");
      else
        v9 = CFSTR("environment_release_name");
      objc_msgSend(v5, "objectForKeyedSubscript:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = (void *)objc_msgSend(v10, "copy");
        objc_msgSend(a1, "setEnvironmentReleaseName:", v11);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("url"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v26 = 0u;
        v27 = 0u;
        v24 = 0u;
        v25 = 0u;
        v23 = v12;
        v13 = v12;
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v25;
          do
          {
            for (i = 0; i != v15; ++i)
            {
              if (*(_QWORD *)v25 != v16)
                objc_enumerationMutation(v13);
              v18 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v19 = [GEORPManifestURL alloc];
                if ((a3 & 1) != 0)
                  v20 = -[GEORPManifestURL initWithJSON:](v19, "initWithJSON:", v18);
                else
                  v20 = -[GEORPManifestURL initWithDictionary:](v19, "initWithDictionary:", v18);
                v21 = (void *)v20;
                objc_msgSend(a1, "addUrl:", v20);

              }
            }
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
          }
          while (v15);
        }

        v12 = v23;
      }

    }
  }

  return a1;
}

- (GEORPCurrentEnvironmentManifestURLs)initWithJSON:(id)a3
{
  return (GEORPCurrentEnvironmentManifestURLs *)-[GEORPCurrentEnvironmentManifestURLs _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_514;
    else
      v8 = (int *)&readAll__nonRecursiveTag_515;
    GEORPCurrentEnvironmentManifestURLsReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEORPCurrentEnvironmentManifestURLsCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPCurrentEnvironmentManifestURLsIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPCurrentEnvironmentManifestURLsReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
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
  if (self->_reader && (_GEORPCurrentEnvironmentManifestURLsIsDirty((uint64_t)self) & 1) == 0)
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
    -[GEORPCurrentEnvironmentManifestURLs readAll:](self, "readAll:", 0);
    if (self->_environmentDisplayName)
      PBDataWriterWriteStringField();
    if (self->_environmentReleaseName)
      PBDataWriterWriteStringField();
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v6 = self->_urls;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v13;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v6);
          PBDataWriterWriteSubmessage();
          ++v9;
        }
        while (v7 != v9);
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
  -[GEORPCurrentEnvironmentManifestURLs readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v8 + 1, self->_reader);
  *((_DWORD *)v8 + 10) = self->_readerMarkPos;
  *((_DWORD *)v8 + 11) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_environmentDisplayName)
    objc_msgSend(v8, "setEnvironmentDisplayName:");
  if (self->_environmentReleaseName)
    objc_msgSend(v8, "setEnvironmentReleaseName:");
  if (-[GEORPCurrentEnvironmentManifestURLs urlsCount](self, "urlsCount"))
  {
    objc_msgSend(v8, "clearUrls");
    v4 = -[GEORPCurrentEnvironmentManifestURLs urlsCount](self, "urlsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[GEORPCurrentEnvironmentManifestURLs urlAtIndex:](self, "urlAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addUrl:", v7);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  PBDataReader *reader;
  PBDataReader *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_BYTE *)&self->_flags & 8) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEORPCurrentEnvironmentManifestURLsReadAllFrom((uint64_t)v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return v5;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEORPCurrentEnvironmentManifestURLs readAll:](self, "readAll:", 0);
  v8 = -[NSString copyWithZone:](self->_environmentDisplayName, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  v10 = -[NSString copyWithZone:](self->_environmentReleaseName, "copyWithZone:", a3);
  v11 = (void *)v5[3];
  v5[3] = v10;

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v12 = self->_urls;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v19;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v19 != v14)
          objc_enumerationMutation(v12);
        v16 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v15), "copyWithZone:", a3, (_QWORD)v18);
        objc_msgSend(v5, "addUrl:", v16);

        ++v15;
      }
      while (v13 != v15);
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v13);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *environmentDisplayName;
  NSString *environmentReleaseName;
  NSMutableArray *urls;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((-[GEORPCurrentEnvironmentManifestURLs readAll:](self, "readAll:", 1),
         objc_msgSend(v4, "readAll:", 1),
         environmentDisplayName = self->_environmentDisplayName,
         !((unint64_t)environmentDisplayName | v4[2]))
     || -[NSString isEqual:](environmentDisplayName, "isEqual:"))
    && ((environmentReleaseName = self->_environmentReleaseName, !((unint64_t)environmentReleaseName | v4[3]))
     || -[NSString isEqual:](environmentReleaseName, "isEqual:")))
  {
    urls = self->_urls;
    if ((unint64_t)urls | v4[4])
      v8 = -[NSMutableArray isEqual:](urls, "isEqual:");
    else
      v8 = 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;

  -[GEORPCurrentEnvironmentManifestURLs readAll:](self, "readAll:", 1);
  v3 = -[NSString hash](self->_environmentDisplayName, "hash");
  v4 = -[NSString hash](self->_environmentReleaseName, "hash") ^ v3;
  return v4 ^ -[NSMutableArray hash](self->_urls, "hash");
}

- (void)mergeFrom:(id)a3
{
  id *v4;
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
  v4 = (id *)a3;
  objc_msgSend(v4, "readAll:", 0);
  if (v4[2])
    -[GEORPCurrentEnvironmentManifestURLs setEnvironmentDisplayName:](self, "setEnvironmentDisplayName:");
  if (v4[3])
    -[GEORPCurrentEnvironmentManifestURLs setEnvironmentReleaseName:](self, "setEnvironmentReleaseName:");
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = v4[4];
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
        -[GEORPCurrentEnvironmentManifestURLs addUrl:](self, "addUrl:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i), (_QWORD)v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urls, 0);
  objc_storeStrong((id *)&self->_environmentReleaseName, 0);
  objc_storeStrong((id *)&self->_environmentDisplayName, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
