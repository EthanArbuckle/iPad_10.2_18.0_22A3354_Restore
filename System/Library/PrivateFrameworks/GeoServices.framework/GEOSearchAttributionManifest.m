@implementation GEOSearchAttributionManifest

- (GEOSearchAttributionManifest)init
{
  GEOSearchAttributionManifest *v2;
  GEOSearchAttributionManifest *v3;
  GEOSearchAttributionManifest *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOSearchAttributionManifest;
  v2 = -[GEOSearchAttributionManifest init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOSearchAttributionManifest)initWithData:(id)a3
{
  GEOSearchAttributionManifest *v3;
  GEOSearchAttributionManifest *v4;
  GEOSearchAttributionManifest *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOSearchAttributionManifest;
  v3 = -[GEOSearchAttributionManifest initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readSearchAttributionSources
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 68) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOSearchAttributionManifestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSearchAttributionSources_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)searchAttributionSources
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOSearchAttributionManifest _readSearchAttributionSources]((uint64_t)a1);
    a1 = (id *)v1[4];
  }
  return a1;
}

- (void)_addNoFlagsSearchAttributionSources:(uint64_t)a1
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

- (void)_addNoFlagsActionComponentMapEntries:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 24);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 24);
      *(_QWORD *)(a1 + 24) = v5;

      v4 = *(void **)(a1 + 24);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

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
  v8.super_class = (Class)GEOSearchAttributionManifest;
  -[GEOSearchAttributionManifest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOSearchAttributionManifest dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOSearchAttributionManifest _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  _QWORD v30[4];
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  -[GEOSearchAttributionManifest readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v6 = *(id *)(a1 + 32);
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v37;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v37 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v11, "jsonRepresentation");
          else
            objc_msgSend(v11, "dictionaryRepresentation");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v12);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
      }
      while (v8);
    }

    objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("searchAttributionSources"));
  }
  if (objc_msgSend(*(id *)(a1 + 24), "count"))
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v14 = *(id *)(a1 + 24);
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v33;
      do
      {
        for (j = 0; j != v16; ++j)
        {
          if (*(_QWORD *)v33 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * j);
          if ((a2 & 1) != 0)
            objc_msgSend(v19, "jsonRepresentation");
          else
            objc_msgSend(v19, "dictionaryRepresentation");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addObject:", v20);

        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
      }
      while (v16);
    }

    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("actionComponentMapEntries"));
  }
  if ((*(_BYTE *)(a1 + 68) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 48));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v21, CFSTR("timestamp"));

  }
  objc_msgSend((id)a1, "sourceURL");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
    objc_msgSend(v4, "setObject:forKey:", v22, CFSTR("sourceURL"));

  v23 = *(void **)(a1 + 16);
  if (v23)
  {
    objc_msgSend(v23, "dictionaryRepresentation");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v24;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v24, "count"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __58__GEOSearchAttributionManifest__dictionaryRepresentation___block_invoke;
      v30[3] = &unk_1E1C00600;
      v27 = v26;
      v31 = v27;
      objc_msgSend(v25, "enumerateKeysAndObjectsUsingBlock:", v30);
      v28 = v27;

      v25 = v28;
    }
    objc_msgSend(v4, "setObject:forKey:", v25, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOSearchAttributionManifest _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  void *v4;
  id v5;
  int *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  id v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      v5 = v4;
      objc_sync_enter(v5);
      if (a2)
        v6 = (int *)&readAll__recursiveTag_309_0;
      else
        v6 = (int *)&readAll__nonRecursiveTag_310_0;
      GEOSearchAttributionManifestReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
    {
      v18 = 0u;
      v19 = 0u;
      v20 = 0u;
      v21 = 0u;
      v7 = *(id *)(a1 + 32);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
      if (v8)
      {
        v9 = *(_QWORD *)v19;
        do
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v19 != v9)
              objc_enumerationMutation(v7);
            -[GEOSearchAttributionSource readAll:](*(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i), 1);
          }
          v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
        }
        while (v8);
      }

      v16 = 0u;
      v17 = 0u;
      v14 = 0u;
      v15 = 0u;
      v11 = *(id *)(a1 + 24);
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
      if (v12)
      {
        v13 = *(_QWORD *)v15;
        while (1)
        {
          if (*(_QWORD *)v15 != v13)
            objc_enumerationMutation(v11);
          if (!--v12)
          {
            v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
            if (!v12)
              break;
          }
        }
      }

    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

void __58__GEOSearchAttributionManifest__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (BOOL)readFrom:(id)a3
{
  return GEOSearchAttributionManifestReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  PBDataReader *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_BYTE *)&self->_flags & 0x3C) == 0))
  {
    v14 = self->_reader;
    objc_sync_enter(v14);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v15);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v14);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOSearchAttributionManifest readAll:]((uint64_t)self, 0);
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v6 = self->_searchAttributionSources;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v21;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v21 != v8)
            objc_enumerationMutation(v6);
          PBDataWriterWriteSubmessage();
          ++v9;
        }
        while (v7 != v9);
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      }
      while (v7);
    }

    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v10 = self->_actionComponentMapEntries;
    v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v17;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v17 != v12)
            objc_enumerationMutation(v10);
          PBDataWriterWriteSubmessage();
          ++v13;
        }
        while (v11 != v13);
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
      }
      while (v11);
    }

    if ((*(_BYTE *)&self->_flags & 1) != 0)
      PBDataWriterWriteDoubleField();
    if (self->_sourceURL)
      PBDataWriterWriteStringField();
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v16);
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  GEOSearchAttributionManifest *v8;
  PBDataReader *v9;
  id v10;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  os_unfair_lock_s *v20;
  uint64_t j;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  uint64_t v27;
  void *v28;
  PBUnknownFields *v29;
  GEOSearchAttributionManifest *v31;
  NSMutableArray *obj;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v8 = self;
    v9 = reader;
    objc_sync_enter(v9);
    if ((*(_BYTE *)&v8->_flags & 0x20) == 0)
    {
      *(_QWORD *)((char *)v8->_reader + (int)*MEMORY[0x1E0D82BD8]) = v8->_readerMarkLength;
      -[PBDataReader seekToOffset:](v8->_reader, "seekToOffset:", v8->_readerMarkPos);
      GEOSearchAttributionManifestReadAllFrom(v5, v8->_reader);
      os_unfair_lock_unlock(p_readerLock);
      v10 = (id)v5;
      objc_sync_exit(v9);

      goto LABEL_29;
    }
    objc_sync_exit(v9);

    self = v8;
  }
  os_unfair_lock_unlock(p_readerLock);
  -[GEOSearchAttributionManifest readAll:]((uint64_t)self, 0);
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v31 = self;
  v11 = self->_searchAttributionSources;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v38 != v13)
          objc_enumerationMutation(v11);
        v15 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * i), "copyWithZone:", a3);
        v16 = v15;
        if (v5)
        {
          v17 = v15;
          -[GEOSearchAttributionManifest _readSearchAttributionSources](v5);
          -[GEOSearchAttributionManifest _addNoFlagsSearchAttributionSources:](v5, v17);

          os_unfair_lock_lock_with_options();
          *(_BYTE *)(v5 + 68) |= 8u;
          os_unfair_lock_unlock((os_unfair_lock_t)(v5 + 64));
          *(_BYTE *)(v5 + 68) |= 0x20u;
        }

      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    }
    while (v12);
  }

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  obj = v31->_actionComponentMapEntries;
  v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
  if (v18)
  {
    v19 = *(_QWORD *)v34;
    v20 = (os_unfair_lock_s *)(v5 + 64);
    do
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v34 != v19)
          objc_enumerationMutation(obj);
        v22 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * j), "copyWithZone:", a3);
        v23 = v22;
        if (v5)
        {
          v24 = v22;
          os_unfair_lock_lock(v20);
          if ((*(_BYTE *)(v5 + 68) & 4) == 0)
          {
            v25 = *(void **)(v5 + 8);
            if (v25)
            {
              v26 = v25;
              objc_sync_enter(v26);
              GEOSearchAttributionManifestReadSpecified(v5, *(_QWORD *)(v5 + 8), (int *)&_readActionComponentMapEntries_tags);
              objc_sync_exit(v26);

            }
          }
          os_unfair_lock_unlock(v20);
          -[GEOSearchAttributionManifest _addNoFlagsActionComponentMapEntries:](v5, v24);

          os_unfair_lock_lock_with_options();
          *(_BYTE *)(v5 + 68) |= 4u;
          os_unfair_lock_unlock(v20);
          *(_BYTE *)(v5 + 68) |= 0x20u;
        }

      }
      v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
    }
    while (v18);
  }

  if ((*(_BYTE *)&v31->_flags & 1) != 0)
  {
    *(double *)(v5 + 48) = v31->_timestamp;
    *(_BYTE *)(v5 + 68) |= 1u;
  }
  v27 = -[NSString copyWithZone:](v31->_sourceURL, "copyWithZone:", a3, 64);
  v28 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v27;

  v29 = v31->_unknownFields;
  v10 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v29;
LABEL_29:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSMutableArray *searchAttributionSources;
  NSMutableArray *actionComponentMapEntries;
  NSString *sourceURL;
  char v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_13;
  -[GEOSearchAttributionManifest readAll:]((uint64_t)self, 1);
  -[GEOSearchAttributionManifest readAll:]((uint64_t)v4, 1);
  searchAttributionSources = self->_searchAttributionSources;
  if ((unint64_t)searchAttributionSources | *((_QWORD *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](searchAttributionSources, "isEqual:"))
      goto LABEL_13;
  }
  actionComponentMapEntries = self->_actionComponentMapEntries;
  if ((unint64_t)actionComponentMapEntries | *((_QWORD *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](actionComponentMapEntries, "isEqual:"))
      goto LABEL_13;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 68) & 1) == 0 || self->_timestamp != *((double *)v4 + 6))
      goto LABEL_13;
  }
  else if ((*((_BYTE *)v4 + 68) & 1) != 0)
  {
LABEL_13:
    v8 = 0;
    goto LABEL_14;
  }
  sourceURL = self->_sourceURL;
  if ((unint64_t)sourceURL | *((_QWORD *)v4 + 5))
    v8 = -[NSString isEqual:](sourceURL, "isEqual:");
  else
    v8 = 1;
LABEL_14:

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  double timestamp;
  double v7;
  long double v8;
  double v9;

  -[GEOSearchAttributionManifest readAll:]((uint64_t)self, 1);
  v3 = -[NSMutableArray hash](self->_searchAttributionSources, "hash");
  v4 = -[NSMutableArray hash](self->_actionComponentMapEntries, "hash");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    timestamp = self->_timestamp;
    v7 = -timestamp;
    if (timestamp >= 0.0)
      v7 = self->_timestamp;
    v8 = floor(v7 + 0.5);
    v9 = (v7 - v8) * 1.84467441e19;
    v5 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0)
        v5 += (unint64_t)v9;
    }
    else
    {
      v5 -= (unint64_t)fabs(v9);
    }
  }
  else
  {
    v5 = 0;
  }
  return v4 ^ v3 ^ v5 ^ -[NSString hash](self->_sourceURL, "hash");
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  *(_BYTE *)&self->_flags |= 0x21u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3 | 0x20;
}

- (BOOL)hasTimestamp
{
  return *(_BYTE *)&self->_flags & 1;
}

- (void)_readSourceURL
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 68) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOSearchAttributionManifestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSourceURL_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasSourceURL
{
  -[GEOSearchAttributionManifest _readSourceURL]((uint64_t)self);
  return self->_sourceURL != 0;
}

- (NSString)sourceURL
{
  -[GEOSearchAttributionManifest _readSourceURL]((uint64_t)self);
  return self->_sourceURL;
}

- (void)setSourceURL:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x30u;
  objc_storeStrong((id *)&self->_sourceURL, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceURL, 0);
  objc_storeStrong((id *)&self->_searchAttributionSources, 0);
  objc_storeStrong((id *)&self->_actionComponentMapEntries, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
