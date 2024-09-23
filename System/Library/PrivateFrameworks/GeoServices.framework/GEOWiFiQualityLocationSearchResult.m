@implementation GEOWiFiQualityLocationSearchResult

- (GEOWiFiQualityLocationSearchResult)init
{
  GEOWiFiQualityLocationSearchResult *v2;
  GEOWiFiQualityLocationSearchResult *v3;
  GEOWiFiQualityLocationSearchResult *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOWiFiQualityLocationSearchResult;
  v2 = -[GEOWiFiQualityLocationSearchResult init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOWiFiQualityLocationSearchResult)initWithData:(id)a3
{
  GEOWiFiQualityLocationSearchResult *v3;
  GEOWiFiQualityLocationSearchResult *v4;
  GEOWiFiQualityLocationSearchResult *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOWiFiQualityLocationSearchResult;
  v3 = -[GEOWiFiQualityLocationSearchResult initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readLocation
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_BYTE *)(a1 + 64) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOWiFiQualityLocationSearchResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLocation_tags_357);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasLocation
{
  -[GEOWiFiQualityLocationSearchResult _readLocation]((uint64_t)self);
  return self->_location != 0;
}

- (GEOLocation)location
{
  -[GEOWiFiQualityLocationSearchResult _readLocation]((uint64_t)self);
  return self->_location;
}

- (void)setLocation:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x28u;
  objc_storeStrong((id *)&self->_location, a3);
}

- (unint64_t)tileKey
{
  return self->_tileKey;
}

- (void)setTileKey:(unint64_t)a3
{
  *(_BYTE *)&self->_flags |= 0x21u;
  self->_tileKey = a3;
}

- (void)setHasTileKey:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3 | 0x20;
}

- (BOOL)hasTileKey
{
  return *(_BYTE *)&self->_flags & 1;
}

- (int)status
{
  os_unfair_lock_s *p_readerLock;
  char flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 2) != 0)
    return self->_status;
  else
    return 0;
}

- (void)setStatus:(int)a3
{
  *(_BYTE *)&self->_flags |= 0x22u;
  self->_status = a3;
}

- (void)setHasStatus:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 34;
  else
    v3 = 32;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasStatus
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (id)statusAsString:(int)a3
{
  if (a3 < 3)
    return off_1E1C09FF0[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsStatus:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("OK")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("NOT_FOUND")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_readEss
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_BYTE *)(a1 + 64) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOWiFiQualityLocationSearchResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readEss_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (NSMutableArray)ess
{
  -[GEOWiFiQualityLocationSearchResult _readEss]((uint64_t)self);
  return self->_ess;
}

- (void)setEss:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *ess;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x20u;
  ess = self->_ess;
  self->_ess = v4;

}

- (void)clearEss
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x20u;
  -[NSMutableArray removeAllObjects](self->_ess, "removeAllObjects");
}

- (void)addEss:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOWiFiQualityLocationSearchResult _readEss]((uint64_t)self);
  -[GEOWiFiQualityLocationSearchResult _addNoFlagsEss:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x20u;
}

- (void)_addNoFlagsEss:(uint64_t)a1
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

- (unint64_t)essCount
{
  -[GEOWiFiQualityLocationSearchResult _readEss]((uint64_t)self);
  return -[NSMutableArray count](self->_ess, "count");
}

- (id)essAtIndex:(unint64_t)a3
{
  -[GEOWiFiQualityLocationSearchResult _readEss]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_ess, "objectAtIndex:", a3);
}

+ (Class)essType
{
  return (Class)objc_opt_class();
}

- (void)_readTiles
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_BYTE *)(a1 + 64) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOWiFiQualityLocationSearchResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTiles_tags_358);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (NSMutableArray)tiles
{
  -[GEOWiFiQualityLocationSearchResult _readTiles]((uint64_t)self);
  return self->_tiles;
}

- (void)setTiles:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *tiles;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x20u;
  tiles = self->_tiles;
  self->_tiles = v4;

}

- (void)clearTiles
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x20u;
  -[NSMutableArray removeAllObjects](self->_tiles, "removeAllObjects");
}

- (void)addTile:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOWiFiQualityLocationSearchResult _readTiles]((uint64_t)self);
  -[GEOWiFiQualityLocationSearchResult _addNoFlagsTile:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x20u;
}

- (void)_addNoFlagsTile:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 40);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 40);
      *(_QWORD *)(a1 + 40) = v5;

      v4 = *(void **)(a1 + 40);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)tilesCount
{
  -[GEOWiFiQualityLocationSearchResult _readTiles]((uint64_t)self);
  return -[NSMutableArray count](self->_tiles, "count");
}

- (id)tileAtIndex:(unint64_t)a3
{
  -[GEOWiFiQualityLocationSearchResult _readTiles]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_tiles, "objectAtIndex:", a3);
}

+ (Class)tileType
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
  v8.super_class = (Class)GEOWiFiQualityLocationSearchResult;
  -[GEOWiFiQualityLocationSearchResult description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOWiFiQualityLocationSearchResult dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOWiFiQualityLocationSearchResult _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  uint64_t v10;
  __CFString *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  void *v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)a1, "location");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v5, "jsonRepresentation");
    else
      objc_msgSend(v5, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("location"));

  }
  v8 = *(_BYTE *)(a1 + 64);
  if ((v8 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 32));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("tileKey"));

    v8 = *(_BYTE *)(a1 + 64);
  }
  if ((v8 & 2) != 0)
  {
    v10 = *(int *)(a1 + 60);
    if (v10 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 60));
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = off_1E1C09FF0[v10];
    }
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("status"));

  }
  if (objc_msgSend(*(id *)(a1 + 16), "count"))
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 16), "count"));
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v13 = *(id *)(a1 + 16);
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v34 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v18, "jsonRepresentation");
          else
            objc_msgSend(v18, "dictionaryRepresentation");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addObject:", v19);

        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
      }
      while (v15);
    }

    objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("ess"));
  }
  if (objc_msgSend(*(id *)(a1 + 40), "count"))
  {
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v21 = *(id *)(a1 + 40);
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v30;
      do
      {
        for (j = 0; j != v23; ++j)
        {
          if (*(_QWORD *)v30 != v24)
            objc_enumerationMutation(v21);
          v26 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * j);
          if ((a2 & 1) != 0)
            objc_msgSend(v26, "jsonRepresentation");
          else
            objc_msgSend(v26, "dictionaryRepresentation");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "addObject:", v27);

        }
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
      }
      while (v23);
    }

    objc_msgSend(v4, "setObject:forKey:", v20, CFSTR("tile"));
  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOWiFiQualityLocationSearchResult _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOWiFiQualityLocationSearchResult)initWithDictionary:(id)a3
{
  return (GEOWiFiQualityLocationSearchResult *)-[GEOWiFiQualityLocationSearchResult _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(char)a3 isJSON:
{
  id v5;
  void *v6;
  GEOLocation *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  GEOWiFiESS *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  uint64_t v30;
  GEOWiFiQualitySearchResultTile *v31;
  uint64_t v32;
  void *v33;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (!a1)
    goto LABEL_51;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_51;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("location"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = [GEOLocation alloc];
    if ((a3 & 1) != 0)
      v8 = -[GEOLocation initWithJSON:](v7, "initWithJSON:", v6);
    else
      v8 = -[GEOLocation initWithDictionary:](v7, "initWithDictionary:", v6);
    v9 = (void *)v8;
    objc_msgSend(a1, "setLocation:", v8);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("tileKey"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setTileKey:", objc_msgSend(v10, "unsignedLongLongValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("status"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12 = v11;
    if ((objc_msgSend(v12, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
    {
      v13 = 0;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("OK")) & 1) != 0)
    {
      v13 = 1;
    }
    else if (objc_msgSend(v12, "isEqualToString:", CFSTR("NOT_FOUND")))
    {
      v13 = 2;
    }
    else
    {
      v13 = 0;
    }

    goto LABEL_21;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v13 = objc_msgSend(v11, "intValue");
LABEL_21:
    objc_msgSend(a1, "setStatus:", v13);
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ess"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v35 = v5;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v15 = v14;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v41;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v41 != v18)
            objc_enumerationMutation(v15);
          v20 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v21 = [GEOWiFiESS alloc];
            if ((a3 & 1) != 0)
              v22 = -[GEOWiFiESS initWithJSON:](v21, "initWithJSON:", v20);
            else
              v22 = -[GEOWiFiESS initWithDictionary:](v21, "initWithDictionary:", v20);
            v23 = (void *)v22;
            objc_msgSend(a1, "addEss:", v22);

          }
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
      }
      while (v17);
    }

    v5 = v35;
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("tile"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v25 = v24;
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v37;
      do
      {
        for (j = 0; j != v27; ++j)
        {
          if (*(_QWORD *)v37 != v28)
            objc_enumerationMutation(v25);
          v30 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * j);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v31 = [GEOWiFiQualitySearchResultTile alloc];
            if ((a3 & 1) != 0)
              v32 = -[GEOWiFiQualitySearchResultTile initWithJSON:](v31, "initWithJSON:", v30);
            else
              v32 = -[GEOWiFiQualitySearchResultTile initWithDictionary:](v31, "initWithDictionary:", v30);
            v33 = (void *)v32;
            objc_msgSend(a1, "addTile:", v32);

          }
        }
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
      }
      while (v27);
    }

    v5 = v35;
  }

LABEL_51:
  return a1;
}

- (GEOWiFiQualityLocationSearchResult)initWithJSON:(id)a3
{
  return (GEOWiFiQualityLocationSearchResult *)-[GEOWiFiQualityLocationSearchResult _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_364;
    else
      v8 = (int *)&readAll__nonRecursiveTag_365;
    GEOWiFiQualityLocationSearchResultReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEOWiFiQualityLocationSearchResultCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOWiFiQualityLocationSearchResultIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOWiFiQualityLocationSearchResultReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  char flags;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  PBDataReader *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOWiFiQualityLocationSearchResultIsDirty((uint64_t)self) & 1) == 0)
  {
    v15 = self->_reader;
    objc_sync_enter(v15);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v16);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v15);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOWiFiQualityLocationSearchResult readAll:](self, "readAll:", 0);
    if (self->_location)
      PBDataWriterWriteSubmessage();
    flags = (char)self->_flags;
    if ((flags & 1) != 0)
    {
      PBDataWriterWriteUint64Field();
      flags = (char)self->_flags;
    }
    if ((flags & 2) != 0)
      PBDataWriterWriteInt32Field();
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v7 = self->_ess;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v22 != v9)
            objc_enumerationMutation(v7);
          PBDataWriterWriteSubmessage();
        }
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v8);
    }

    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v11 = self->_tiles;
    v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v18;
      do
      {
        for (j = 0; j != v12; ++j)
        {
          if (*(_QWORD *)v18 != v13)
            objc_enumerationMutation(v11);
          PBDataWriterWriteSubmessage();
        }
        v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
      }
      while (v12);
    }

  }
}

- (void)clearSensitiveFields:(unint64_t)a3
{
  GEOWiFiQualityLocationSearchResultClearSensitiveFields(self, a3, 1);
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
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

  v3 = a3;
  v26 = *MEMORY[0x1E0C80C00];
  -[GEOWiFiQualityLocationSearchResult _readEss]((uint64_t)self);
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = self->_ess;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v21;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v21 != v8)
        objc_enumerationMutation(v5);
      if ((objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v9), "hasGreenTeaWithValue:", v3) & 1) != 0)
        goto LABEL_20;
      if (v7 == ++v9)
      {
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
        if (v7)
          goto LABEL_3;
        break;
      }
    }
  }

  -[GEOWiFiQualityLocationSearchResult _readLocation]((uint64_t)self);
  if (!-[GEOLocation hasGreenTeaWithValue:](self->_location, "hasGreenTeaWithValue:", v3))
  {
    -[GEOWiFiQualityLocationSearchResult _readTiles]((uint64_t)self);
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v5 = self->_tiles;
    v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    if (!v11)
    {
LABEL_19:
      v10 = 0;
LABEL_21:

      return v10;
    }
    v12 = v11;
    v13 = *(_QWORD *)v17;
LABEL_13:
    v14 = 0;
    while (1)
    {
      if (*(_QWORD *)v17 != v13)
        objc_enumerationMutation(v5);
      if ((objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v14), "hasGreenTeaWithValue:", v3, (_QWORD)v16) & 1) != 0)
        break;
      if (v12 == ++v14)
      {
        v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
        if (v12)
          goto LABEL_13;
        goto LABEL_19;
      }
    }
LABEL_20:
    v10 = 1;
    goto LABEL_21;
  }
  return 1;
}

- (void)copyTo:(id)a3
{
  char flags;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t j;
  void *v12;
  id *v13;

  v13 = (id *)a3;
  -[GEOWiFiQualityLocationSearchResult readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v13 + 1, self->_reader);
  *((_DWORD *)v13 + 12) = self->_readerMarkPos;
  *((_DWORD *)v13 + 13) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_location)
    objc_msgSend(v13, "setLocation:");
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    v13[4] = (id)self->_tileKey;
    *((_BYTE *)v13 + 64) |= 1u;
    flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *((_DWORD *)v13 + 15) = self->_status;
    *((_BYTE *)v13 + 64) |= 2u;
  }
  if (-[GEOWiFiQualityLocationSearchResult essCount](self, "essCount"))
  {
    objc_msgSend(v13, "clearEss");
    v5 = -[GEOWiFiQualityLocationSearchResult essCount](self, "essCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        -[GEOWiFiQualityLocationSearchResult essAtIndex:](self, "essAtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addEss:", v8);

      }
    }
  }
  if (-[GEOWiFiQualityLocationSearchResult tilesCount](self, "tilesCount"))
  {
    objc_msgSend(v13, "clearTiles");
    v9 = -[GEOWiFiQualityLocationSearchResult tilesCount](self, "tilesCount");
    if (v9)
    {
      v10 = v9;
      for (j = 0; j != v10; ++j)
      {
        -[GEOWiFiQualityLocationSearchResult tileAtIndex:](self, "tileAtIndex:", j);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addTile:", v12);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  NSMutableArray *v8;
  id v9;
  void *v10;
  char flags;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
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
      GEOWiFiQualityLocationSearchResultReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (NSMutableArray *)(id)v5;
      objc_sync_exit(v7);

      goto LABEL_23;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOWiFiQualityLocationSearchResult readAll:](self, "readAll:", 0);
  v9 = -[GEOLocation copyWithZone:](self->_location, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v9;

  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    *(_QWORD *)(v5 + 32) = self->_tileKey;
    *(_BYTE *)(v5 + 64) |= 1u;
    flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 60) = self->_status;
    *(_BYTE *)(v5 + 64) |= 2u;
  }
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v12 = self->_ess;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v27 != v14)
          objc_enumerationMutation(v12);
        v16 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addEss:", v16);

      }
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v13);
  }

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v8 = self->_tiles;
  v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v17)
  {
    v18 = *(_QWORD *)v23;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v23 != v18)
          objc_enumerationMutation(v8);
        v20 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * j), "copyWithZone:", a3, (_QWORD)v22);
        objc_msgSend((id)v5, "addTile:", v20);

      }
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    }
    while (v17);
  }
LABEL_23:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  GEOLocation *location;
  NSMutableArray *ess;
  NSMutableArray *tiles;
  char v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_18;
  -[GEOWiFiQualityLocationSearchResult readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  location = self->_location;
  if ((unint64_t)location | *((_QWORD *)v4 + 3))
  {
    if (!-[GEOLocation isEqual:](location, "isEqual:"))
      goto LABEL_18;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 1) == 0 || self->_tileKey != *((_QWORD *)v4 + 4))
      goto LABEL_18;
  }
  else if ((*((_BYTE *)v4 + 64) & 1) != 0)
  {
LABEL_18:
    v8 = 0;
    goto LABEL_19;
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 2) == 0 || self->_status != *((_DWORD *)v4 + 15))
      goto LABEL_18;
  }
  else if ((*((_BYTE *)v4 + 64) & 2) != 0)
  {
    goto LABEL_18;
  }
  ess = self->_ess;
  if ((unint64_t)ess | *((_QWORD *)v4 + 2) && !-[NSMutableArray isEqual:](ess, "isEqual:"))
    goto LABEL_18;
  tiles = self->_tiles;
  if ((unint64_t)tiles | *((_QWORD *)v4 + 5))
    v8 = -[NSMutableArray isEqual:](tiles, "isEqual:");
  else
    v8 = 1;
LABEL_19:

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;

  -[GEOWiFiQualityLocationSearchResult readAll:](self, "readAll:", 1);
  v3 = -[GEOLocation hash](self->_location, "hash");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    v4 = 2654435761u * self->_tileKey;
    if ((*(_BYTE *)&self->_flags & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v5 = 0;
    goto LABEL_6;
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_flags & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v5 = 2654435761 * self->_status;
LABEL_6:
  v6 = v4 ^ v3 ^ v5 ^ -[NSMutableArray hash](self->_ess, "hash");
  return v6 ^ -[NSMutableArray hash](self->_tiles, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  GEOLocation *location;
  uint64_t v6;
  char v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  location = self->_location;
  v6 = *((_QWORD *)v4 + 3);
  if (location)
  {
    if (v6)
      -[GEOLocation mergeFrom:](location, "mergeFrom:");
  }
  else if (v6)
  {
    -[GEOWiFiQualityLocationSearchResult setLocation:](self, "setLocation:");
  }
  v7 = *((_BYTE *)v4 + 64);
  if ((v7 & 1) != 0)
  {
    self->_tileKey = *((_QWORD *)v4 + 4);
    *(_BYTE *)&self->_flags |= 1u;
    v7 = *((_BYTE *)v4 + 64);
  }
  if ((v7 & 2) != 0)
  {
    self->_status = *((_DWORD *)v4 + 15);
    *(_BYTE *)&self->_flags |= 2u;
  }
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v8 = *((id *)v4 + 2);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v23 != v11)
          objc_enumerationMutation(v8);
        -[GEOWiFiQualityLocationSearchResult addEss:](self, "addEss:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i));
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v10);
  }

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v13 = *((id *)v4 + 5);
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v19;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v19 != v16)
          objc_enumerationMutation(v13);
        -[GEOWiFiQualityLocationSearchResult addTile:](self, "addTile:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * j), (_QWORD)v18);
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    }
    while (v15);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tiles, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_ess, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
