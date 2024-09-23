@implementation GEOActiveTileSet

- (unsigned)minimumZoomLevelInRect:(id)a3
{
  double var1;
  double var0;
  double v5;
  double v6;
  unint64_t v8;
  GEOTileSetRegion *v9;
  unsigned int *p_var0;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  BOOL v14;

  var1 = a3.var1.var1;
  var0 = a3.var1.var0;
  v5 = a3.var0.var1;
  v6 = a3.var0.var0;
  if (!-[GEOActiveTileSet availableTilesCount](self, "availableTilesCount"))
    return 0;
  v8 = -[GEOActiveTileSet availableTilesCount](self, "availableTilesCount");
  v9 = -[GEOActiveTileSet availableTiles](self, "availableTiles");
  if (!v8)
    return 100;
  p_var0 = &v9->var0;
  v11 = 100;
  do
  {
    v12 = p_var0[5];
    if (v12 <= 1)
      v12 = 1;
    if (v12 >= p_var0[2])
      v13 = p_var0[2];
    else
      v13 = v12;
    if (v13)
      v14 = v13 >= v11;
    else
      v14 = 1;
    if (!v14 && GEOTileSetRegionIntersectsMapRect(p_var0, v6, v5, var0, var1))
      v11 = v13;
    p_var0 += 6;
    --v8;
  }
  while (v8);
  return v11;
}

- (GEOTileSetRegion)availableTiles
{
  -[GEOActiveTileSet _readAvailableTiles]((uint64_t)self);
  return self->_availableTiles;
}

- (unint64_t)availableTilesCount
{
  -[GEOActiveTileSet _readAvailableTiles]((uint64_t)self);
  return self->_availableTilesCount;
}

- (void)_readAvailableTiles
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 144) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOActiveTileSetReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAvailableTiles_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
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
      v8 = (int *)&readAll__recursiveTag_933;
    else
      v8 = (int *)&readAll__nonRecursiveTag_934;
    GEOActiveTileSetReadSpecified((uint64_t)self, (uint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEOActiveTileSetCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  os_unfair_lock_unlock(p_readerLock);
}

- (void)_addNoFlagsSupportedLanguage:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 88);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 88);
      *(_QWORD *)(a1 + 88) = v5;

      v4 = *(void **)(a1 + 88);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (uint64_t)_reserveAvailableTiles:(uint64_t)a1
{
  uint64_t result;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;

  result = 0;
  if (a1 && a2)
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = v4 + a2;
    if (v4 + a2 <= v4)
      return 0;
    v6 = *(_QWORD *)(a1 + 40);
    if (v6 >= v5)
      return 1;
    v7 = v6 + a2;
    if (v6 + a2)
    {
      v8 = 1;
      while (1)
      {
        v9 = v8;
        if (v8 >= v7)
          break;
        v8 *= 2;
        if ((v9 & 0x8000000000000000) != 0)
        {
          v9 = -1;
          goto LABEL_12;
        }
      }
    }
    else
    {
      v9 = 0;
    }
    if (v9 < a2)
      return 0;
LABEL_12:
    if (24 * v9 < v9)
      return 0;
    result = (uint64_t)malloc_type_realloc(*(void **)(a1 + 24), 24 * v9, 0x79F00F76uLL);
    if (result)
    {
      *(_QWORD *)(a1 + 40) = v9;
      *(_QWORD *)(a1 + 24) = result;
      bzero((void *)(result + 24 * *(_QWORD *)(a1 + 32)), 24 * (v9 - *(_QWORD *)(a1 + 32)));
      return 1;
    }
  }
  return result;
}

- (unsigned)maximumZoomLevelInRect:(id)a3
{
  double var1;
  double var0;
  double v5;
  double v6;
  unint64_t v8;
  unint64_t v9;
  GEOTileSetRegion *v10;
  unsigned int var2;

  var1 = a3.var1.var1;
  var0 = a3.var1.var0;
  v5 = a3.var0.var1;
  v6 = a3.var0.var0;
  v8 = -[GEOActiveTileSet availableTilesCount](self, "availableTilesCount");
  if (!v8)
    return 21;
  v9 = v8;
  v10 = -[GEOActiveTileSet availableTiles](self, "availableTiles");
  var2 = 0;
  do
  {
    if (v10->var2 > var2 && GEOTileSetRegionIntersectsMapRect(&v10->var0, v6, v5, var0, var1))
      var2 = v10->var2;
    ++v10;
    --v9;
  }
  while (v9);
  return var2;
}

- (void)_addNoFlagsCountryRegionAllowlist:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 56);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 56);
      *(_QWORD *)(a1 + 56) = v5;

      v4 = *(void **)(a1 + 56);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (void)_addNoFlagsSentinelTile:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 80);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 80);
      *(_QWORD *)(a1 + 80) = v5;

      v4 = *(void **)(a1 + 80);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (BOOL)isEqual:(id)a3
{
  const void **v4;
  NSString *baseURL;
  __int16 v6;
  unint64_t availableTilesCount;
  char v8;
  NSMutableArray *sentinelTiles;
  NSString *localizationURL;
  NSMutableArray *supportedLanguages;
  __int16 flags;
  __int16 v14;
  NSMutableArray *countryRegionAllowlists;
  NSMutableArray *deviceSKUAllowlists;

  v4 = (const void **)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_15;
  -[GEOActiveTileSet readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  baseURL = self->_baseURL;
  if ((unint64_t)baseURL | (unint64_t)v4[6])
  {
    if (!-[NSString isEqual:](baseURL, "isEqual:"))
      goto LABEL_15;
  }
  if (self->_style != *((_DWORD *)v4 + 31)
    || self->_scale != *((_DWORD *)v4 + 29)
    || self->_size != *((_DWORD *)v4 + 30)
    || self->_version != *((_DWORD *)v4 + 34))
  {
    goto LABEL_15;
  }
  v6 = *((_WORD *)v4 + 72);
  if ((*(_WORD *)&self->_flags & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_timeToLiveSeconds != *((_DWORD *)v4 + 32))
      goto LABEL_15;
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_15;
  }
  availableTilesCount = self->_availableTilesCount;
  if ((const void *)availableTilesCount != v4[4])
    goto LABEL_15;
  if (memcmp(self->_availableTiles, v4[3], 24 * availableTilesCount))
    goto LABEL_15;
  sentinelTiles = self->_sentinelTiles;
  if ((unint64_t)sentinelTiles | (unint64_t)v4[10])
  {
    if (!-[NSMutableArray isEqual:](sentinelTiles, "isEqual:"))
      goto LABEL_15;
  }
  localizationURL = self->_localizationURL;
  if ((unint64_t)localizationURL | (unint64_t)v4[9])
  {
    if (!-[NSString isEqual:](localizationURL, "isEqual:"))
      goto LABEL_15;
  }
  supportedLanguages = self->_supportedLanguages;
  if ((unint64_t)supportedLanguages | (unint64_t)v4[11])
  {
    if (!-[NSMutableArray isEqual:](supportedLanguages, "isEqual:"))
      goto LABEL_15;
  }
  flags = (__int16)self->_flags;
  v14 = *((_WORD *)v4 + 72);
  if ((flags & 8) != 0)
  {
    if ((v14 & 8) == 0 || self->_updateBehavior != *((_DWORD *)v4 + 33))
      goto LABEL_15;
  }
  else if ((v14 & 8) != 0)
  {
    goto LABEL_15;
  }
  countryRegionAllowlists = self->_countryRegionAllowlists;
  if ((unint64_t)countryRegionAllowlists | (unint64_t)v4[7])
  {
    if (!-[NSMutableArray isEqual:](countryRegionAllowlists, "isEqual:"))
      goto LABEL_15;
    flags = (__int16)self->_flags;
    v14 = *((_WORD *)v4 + 72);
  }
  if ((flags & 1) != 0)
  {
    if ((v14 & 1) == 0 || self->_checksumType != *((_DWORD *)v4 + 27))
      goto LABEL_15;
  }
  else if ((v14 & 1) != 0)
  {
    goto LABEL_15;
  }
  if ((flags & 2) != 0)
  {
    if ((v14 & 2) == 0 || self->_requestStyle != *((_DWORD *)v4 + 28))
      goto LABEL_15;
  }
  else if ((v14 & 2) != 0)
  {
    goto LABEL_15;
  }
  if ((flags & 0x10) == 0)
  {
    if ((v14 & 0x10) == 0)
      goto LABEL_49;
LABEL_15:
    v8 = 0;
    goto LABEL_16;
  }
  if ((v14 & 0x10) == 0)
    goto LABEL_15;
  if (!self->_useAuthProxy)
  {
    if (!*((_BYTE *)v4 + 140))
      goto LABEL_49;
    goto LABEL_15;
  }
  if (!*((_BYTE *)v4 + 140))
    goto LABEL_15;
LABEL_49:
  deviceSKUAllowlists = self->_deviceSKUAllowlists;
  if ((unint64_t)deviceSKUAllowlists | (unint64_t)v4[8])
    v8 = -[NSMutableArray isEqual:](deviceSKUAllowlists, "isEqual:");
  else
    v8 = 1;
LABEL_16:

  return v8;
}

- (unsigned)version
{
  return self->_version;
}

- (id)bestLanguageWithOverrideLocale:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  if (v4
    || (objc_getAssociatedObject(self, &GEOActiveTileSetBestLanguageKey),
        (v5 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v4)
    {
      v8 = (void *)MEMORY[0x1E0C99DE8];
      objc_msgSend(v4, "localeIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "arrayWithObject:", v9);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "addObjectsFromArray:", v6);
    }
    v10 = (void *)MEMORY[0x1E0C99DC8];
    -[GEOActiveTileSet supportedLanguages](self, "supportedLanguages");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "mostPreferredLanguageOf:withPreferredLanguages:forUsage:options:", v11, v7, 1, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4 && v5)
      objc_setAssociatedObject(self, &GEOActiveTileSetBestLanguageKey, v5, (void *)0x303);

  }
  return v5;
}

- (NSMutableArray)supportedLanguages
{
  -[GEOActiveTileSet _readSupportedLanguages]((uint64_t)self);
  return self->_supportedLanguages;
}

- (void)_readSupportedLanguages
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 144) & 0x1000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOActiveTileSetReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSupportedLanguages_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (int)style
{
  return self->_style;
}

- (int)scale
{
  return self->_scale;
}

- (int)size
{
  return self->_size;
}

- (GEOActiveTileSet)init
{
  GEOActiveTileSet *v2;
  GEOActiveTileSet *v3;
  GEOActiveTileSet *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOActiveTileSet;
  v2 = -[GEOActiveTileSet init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (BOOL)hasTimeToLiveSeconds
{
  return (*(_WORD *)&self->_flags >> 2) & 1;
}

- (unsigned)timeToLiveSeconds
{
  return self->_timeToLiveSeconds;
}

- (BOOL)hasChecksumType
{
  return *(_WORD *)&self->_flags & 1;
}

- (int)checksumType
{
  os_unfair_lock_s *p_readerLock;
  __int16 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 1) != 0)
    return self->_checksumType;
  else
    return 0;
}

- (id)disputedBordersQueryItemsForCountry:(id)a3 region:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  void *v15;

  v6 = a3;
  v7 = a4;
  -[GEOActiveTileSet _bestCountryRegionAllowlistMatchForCountry:region:](self, "_bestCountryRegionAllowlistMatchForCountry:region:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    if (objc_msgSend(v8, "hasCountryCode")
      && (objc_msgSend(v9, "countryCode"),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          v11 = objc_msgSend(v10, "length"),
          v10,
          v11))
    {
      v12 = v6;
    }
    else
    {
      v12 = 0;
    }
    if (objc_msgSend(v9, "hasRegion"))
    {
      objc_msgSend(v9, "region");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (id)objc_msgSend(v13, "length");

      if (v14)
        v14 = v7;
    }
    else
    {
      v14 = 0;
    }
    +[GEOActiveTileSet buildDisputedBordersQueryItemsForCountry:region:](GEOActiveTileSet, "buildDisputedBordersQueryItemsForCountry:region:", v12, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v15;
}

- (id)_bestCountryRegionAllowlistMatchForCountry:(id)a3 region:(id)a4
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  int v16;
  void *v17;
  int v18;
  void *v19;
  int v20;
  id v21;
  id v22;
  id obj;
  unint64_t v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = (unint64_t)a3;
  v25 = (unint64_t)a4;
  v26 = (void *)v6;
  if (v6 | v25)
  {
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    -[GEOActiveTileSet countryRegionAllowlists](self, "countryRegionAllowlists");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v7)
    {
      v8 = v7;
      v9 = 0;
      v10 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v28 != v10)
            objc_enumerationMutation(obj);
          v12 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          if (objc_msgSend(v12, "hasCountryCode"))
          {
            objc_msgSend(v12, "countryCode");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = objc_msgSend(v26, "isEqualToString:", v13);

          }
          else
          {
            v14 = 0;
          }
          if (objc_msgSend(v12, "hasRegion"))
          {
            objc_msgSend(v12, "region");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend((id)v25, "isEqualToString:", v15);

            if ((v14 & v16 & 1) != 0)
            {
              v22 = v12;

              goto LABEL_28;
            }
          }
          else
          {
            v16 = 0;
          }
          if (objc_msgSend(v12, "hasCountryCode"))
          {
            objc_msgSend(v12, "countryCode");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("*"));

          }
          else
          {
            v18 = 1;
          }
          if (objc_msgSend(v12, "hasRegion"))
          {
            objc_msgSend(v12, "region");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("*"));

          }
          else
          {
            v20 = 1;
          }
          if (((v18 | v14) & (v20 | v16)) == 1)
          {
            v21 = v12;

            v9 = v21;
          }
        }
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      }
      while (v8);
    }
    else
    {
      v9 = 0;
    }

    v9 = v9;
    v22 = v9;
LABEL_28:

  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (NSMutableArray)deviceSKUAllowlists
{
  -[GEOActiveTileSet _readDeviceSKUAllowlists]((uint64_t)self);
  return self->_deviceSKUAllowlists;
}

- (NSMutableArray)countryRegionAllowlists
{
  -[GEOActiveTileSet _readCountryRegionAllowlists]((uint64_t)self);
  return self->_countryRegionAllowlists;
}

- (void)_readDeviceSKUAllowlists
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 144) & 0x200) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOActiveTileSetReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDeviceSKUAllowlists_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (void)_readCountryRegionAllowlists
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 144) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOActiveTileSetReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCountryRegionAllowlists_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (unsigned)maximumZoomLevelForMapPoint:(id)a3
{
  double var1;
  double var0;
  unint64_t v6;
  unint64_t v7;
  GEOTileSetRegion *v8;
  unsigned int var2;

  var1 = a3.var1;
  var0 = a3.var0;
  v6 = -[GEOActiveTileSet availableTilesCount](self, "availableTilesCount");
  if (!v6)
    return 21;
  v7 = v6;
  v8 = -[GEOActiveTileSet availableTiles](self, "availableTiles");
  var2 = 0;
  do
  {
    if (v8->var2 > var2 && RegionContainsPoint(&v8->var0, var0, var1))
      var2 = v8->var2;
    ++v8;
    --v7;
  }
  while (v7);
  return var2;
}

- (NSString)baseURL
{
  -[GEOActiveTileSet _readBaseURL]((uint64_t)self);
  return self->_baseURL;
}

- (BOOL)hasBaseURL
{
  -[GEOActiveTileSet _readBaseURL]((uint64_t)self);
  return self->_baseURL != 0;
}

- (void)_readBaseURL
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 144) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOActiveTileSetReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readBaseURL_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (unint64_t)supportedLanguagesCount
{
  -[GEOActiveTileSet _readSupportedLanguages]((uint64_t)self);
  return -[NSMutableArray count](self->_supportedLanguages, "count");
}

- (int)requestStyle
{
  os_unfair_lock_s *p_readerLock;
  __int16 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 2) != 0)
    return self->_requestStyle;
  else
    return 0;
}

- (BOOL)hasLocalizationURL
{
  -[GEOActiveTileSet _readLocalizationURL]((uint64_t)self);
  return self->_localizationURL != 0;
}

- (NSString)localizationURL
{
  -[GEOActiveTileSet _readLocalizationURL]((uint64_t)self);
  return self->_localizationURL;
}

- (void)_readLocalizationURL
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 144) & 0x400) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOActiveTileSetReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLocalizationURL_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (GEOActiveTileSet)initWithData:(id)a3
{
  GEOActiveTileSet *v3;
  GEOActiveTileSet *v4;
  GEOActiveTileSet *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOActiveTileSet;
  v3 = -[GEOActiveTileSet initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)dealloc
{
  objc_super v3;

  -[GEOActiveTileSet clearAvailableTiles](self, "clearAvailableTiles");
  v3.receiver = self;
  v3.super_class = (Class)GEOActiveTileSet;
  -[GEOActiveTileSet dealloc](&v3, sel_dealloc);
}

- (void)setBaseURL:(id)a3
{
  *(_WORD *)&self->_flags |= 0x2080u;
  objc_storeStrong((id *)&self->_baseURL, a3);
}

- (void)setStyle:(int)a3
{
  *(_WORD *)&self->_flags |= 0x2000u;
  self->_style = a3;
}

- (id)styleAsString:(int)a3
{
  __CFString *v3;

  v3 = CFSTR("RASTER_STANDARD");
  switch(a3)
  {
    case 0:
      return v3;
    case 1:
      v3 = CFSTR("VECTOR_STANDARD");
      return v3;
    case 2:
      return CFSTR("VECTOR_TRAFFIC_SEGMENTS_FOR_RASTER");
    case 3:
      return CFSTR("VECTOR_TRAFFIC_INCIDENTS_FOR_RASTER");
    case 4:
      return CFSTR("VECTOR_TRAFFIC_SEGMENTS_AND_INCIDENTS_FOR_RASTER");
    case 5:
      return CFSTR("RASTER_STANDARD_BACKGROUND");
    case 6:
      return CFSTR("RASTER_HYBRID");
    case 7:
      return CFSTR("RASTER_SATELLITE");
    case 8:
      return CFSTR("RASTER_TERRAIN");
    case 11:
      return CFSTR("VECTOR_BUILDINGS");
    case 12:
      return CFSTR("VECTOR_TRAFFIC");
    case 13:
      return CFSTR("VECTOR_POI");
    case 14:
      return CFSTR("SPUTNIK_METADATA");
    case 15:
      return CFSTR("SPUTNIK_C3M");
    case 16:
      return CFSTR("SPUTNIK_DSM");
    case 17:
      return CFSTR("SPUTNIK_DSM_GLOBAL");
    case 18:
      return CFSTR("VECTOR_REALISTIC");
    case 19:
      return CFSTR("VECTOR_LEGACY_REALISTIC");
    case 20:
      return CFSTR("VECTOR_ROADS");
    case 21:
      return CFSTR("RASTER_VEGETATION");
    case 22:
      return CFSTR("VECTOR_TRAFFIC_SKELETON");
    case 23:
      return CFSTR("RASTER_COASTLINE_MASK");
    case 24:
      return CFSTR("RASTER_HILLSHADE");
    case 25:
      return CFSTR("VECTOR_TRAFFIC_WITH_GREEN");
    case 26:
      return CFSTR("VECTOR_TRAFFIC_STATIC");
    case 27:
      return CFSTR("RASTER_COASTLINE_DROP_MASK");
    case 28:
      return CFSTR("VECTOR_TRAFFIC_SKELETON_WITH_HISTORICAL");
    case 29:
      return CFSTR("VECTOR_SPEED_PROFILES");
    case 30:
      return CFSTR("VECTOR_VENUES");
    case 31:
      return CFSTR("RASTER_DOWN_SAMPLED");
    case 32:
      return CFSTR("RASTER_COLOR_BALANCED");
    case 33:
      return CFSTR("RASTER_SATELLITE_NIGHT");
    case 34:
      return CFSTR("SPUTNIK_VECTOR_BORDER");
    case 35:
      return CFSTR("RASTER_SATELLITE_DIGITIZE");
    case 36:
      return CFSTR("RASTER_HILLSHADE_PARKS");
    case 37:
      return CFSTR("VECTOR_TRANSIT");
    case 38:
      return CFSTR("RASTER_STANDARD_BASE");
    case 39:
      return CFSTR("RASTER_STANDARD_LABELS");
    case 40:
      return CFSTR("RASTER_HYBRID_ROADS");
    case 41:
      return CFSTR("RASTER_HYBRID_LABELS");
    case 42:
      return CFSTR("FLYOVER_C3M_MESH");
    case 43:
      return CFSTR("FLYOVER_C3M_JPEG_TEXTURE");
    case 44:
      return CFSTR("FLYOVER_C3M_ASTC_TEXTURE");
    case 45:
      return CFSTR("RASTER_SATELLITE_ASTC");
    case 46:
      return CFSTR("RASTER_HYBRID_ROADS_AND_LABELS");
    case 47:
      return CFSTR("VECTOR_TRANSIT_SELECTION");
    case 48:
      return CFSTR("VECTOR_COVERAGE");
    case 52:
      return CFSTR("FLYOVER_METADATA");
    case 53:
      return CFSTR("VECTOR_ROAD_NETWORK");
    case 54:
      return CFSTR("VECTOR_LAND_COVER");
    case 55:
      return CFSTR("VECTOR_DEBUG");
    case 56:
      return CFSTR("VECTOR_STREET_POI");
    case 57:
      return CFSTR("MUNIN_METADATA");
    case 58:
      return CFSTR("VECTOR_SPR_MERCATOR");
    case 59:
      return CFSTR("VECTOR_SPR_MODELS");
    case 60:
      return CFSTR("VECTOR_SPR_MATERIALS");
    case 61:
      return CFSTR("VECTOR_SPR_METADATA");
    case 62:
      return CFSTR("VECTOR_TRACKS");
    case 63:
      return CFSTR("VECTOR_RESERVED_2");
    case 64:
      return CFSTR("VECTOR_STREET_LANDMARKS");
    case 65:
      return CFSTR("COARSE_LOCATION_POLYGONS");
    case 66:
      return CFSTR("VECTOR_SPR_ROADS");
    case 67:
      return CFSTR("VECTOR_SPR_STANDARD");
    case 68:
      return CFSTR("VECTOR_POI_V2");
    case 69:
      return CFSTR("VECTOR_POLYGON_SELECTION");
    case 70:
      return CFSTR("VL_METADATA");
    case 71:
      return CFSTR("VL_DATA");
    case 72:
      return CFSTR("PROACTIVE_APP_CLIP");
    case 73:
      return CFSTR("VECTOR_BUILDINGS_V2");
    case 74:
      return CFSTR("POI_BUSYNESS");
    case 75:
      return CFSTR("POI_DP_BUSYNESS");
    case 76:
      return CFSTR("SMART_INTERFACE_SELECTION");
    case 77:
      return CFSTR("VECTOR_ASSETS");
    case 78:
      return CFSTR("SPR_ASSET_METADATA");
    case 79:
      return CFSTR("VECTOR_SPR_POLAR");
    case 80:
      return CFSTR("SMART_DATA_MODE");
    case 81:
      return CFSTR("CELLULAR_PERFORMANCE_SCORE");
    case 82:
      return CFSTR("VECTOR_SPR_MODELS_OCCLUSION");
    case 83:
      return CFSTR("VECTOR_TOPOGRAPHIC");
    case 84:
      return CFSTR("VECTOR_POI_V2_UPDATE");
    case 85:
      return CFSTR("VECTOR_LIVE_DATA_UPDATES");
    case 86:
      return CFSTR("VECTOR_TRAFFIC_V2");
    case 87:
      return CFSTR("VECTOR_ROAD_SELECTION");
    case 88:
      return CFSTR("VECTOR_REGION_METADATA");
    case 89:
      return CFSTR("RAY_TRACING");
    case 90:
      return CFSTR("VECTOR_CONTOURS");
    case 91:
      return CFSTR("RASTER_SATELLITE_POLAR");
    case 92:
      return CFSTR("VMAP4_ELEVATION");
    case 93:
      return CFSTR("VMAP4_ELEVATION_POLAR");
    case 94:
      return CFSTR("CELLULAR_COVERAGE_PLMN");
    case 95:
      return CFSTR("RASTER_SATELLITE_POLAR_NIGHT");
    case 96:
      return CFSTR("UNUSED_96");
    case 97:
      return CFSTR("UNUSED_97");
    case 98:
      return CFSTR("UNUSED_98");
    case 99:
      return CFSTR("UNUSED_99");
    case 100:
      return CFSTR("UNUSED_100");
    case 101:
      return CFSTR("UNUSED_101");
    case 102:
      return CFSTR("UNUSED_102");
    case 103:
      return CFSTR("UNUSED_103");
    case 104:
      return CFSTR("UNUSED_104");
    case 105:
      return CFSTR("UNUSED_105");
    case 106:
      return CFSTR("UNUSED_106");
    case 107:
      return CFSTR("UNUSED_107");
    case 108:
      return CFSTR("UNUSED_108");
    case 109:
      return CFSTR("UNUSED_109");
    case 110:
      return CFSTR("UNUSED_110");
    case 111:
      return CFSTR("UNUSED_111");
    case 112:
      return CFSTR("UNUSED_112");
    case 113:
      return CFSTR("UNUSED_113");
    case 114:
      return CFSTR("UNUSED_114");
    case 115:
      return CFSTR("UNUSED_115");
    case 116:
      return CFSTR("UNUSED_116");
    case 117:
      return CFSTR("UNUSED_117");
    case 118:
      return CFSTR("UNUSED_118");
    case 119:
      return CFSTR("UNUSED_119");
    default:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
      return v3;
  }
}

- (int)StringAsStyle:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RASTER_STANDARD")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VECTOR_STANDARD")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VECTOR_TRAFFIC_SEGMENTS_FOR_RASTER")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VECTOR_TRAFFIC_INCIDENTS_FOR_RASTER")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VECTOR_TRAFFIC_SEGMENTS_AND_INCIDENTS_FOR_RASTER")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RASTER_STANDARD_BACKGROUND")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RASTER_HYBRID")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RASTER_SATELLITE")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RASTER_TERRAIN")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VECTOR_BUILDINGS")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VECTOR_TRAFFIC")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VECTOR_POI")) & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SPUTNIK_METADATA")) & 1) != 0)
  {
    v4 = 14;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SPUTNIK_C3M")) & 1) != 0)
  {
    v4 = 15;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SPUTNIK_DSM")) & 1) != 0)
  {
    v4 = 16;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SPUTNIK_DSM_GLOBAL")) & 1) != 0)
  {
    v4 = 17;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VECTOR_REALISTIC")) & 1) != 0)
  {
    v4 = 18;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VECTOR_LEGACY_REALISTIC")) & 1) != 0)
  {
    v4 = 19;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VECTOR_ROADS")) & 1) != 0)
  {
    v4 = 20;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RASTER_VEGETATION")) & 1) != 0)
  {
    v4 = 21;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VECTOR_TRAFFIC_SKELETON")) & 1) != 0)
  {
    v4 = 22;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RASTER_COASTLINE_MASK")) & 1) != 0)
  {
    v4 = 23;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RASTER_HILLSHADE")) & 1) != 0)
  {
    v4 = 24;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VECTOR_TRAFFIC_WITH_GREEN")) & 1) != 0)
  {
    v4 = 25;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VECTOR_TRAFFIC_STATIC")) & 1) != 0)
  {
    v4 = 26;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RASTER_COASTLINE_DROP_MASK")) & 1) != 0)
  {
    v4 = 27;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VECTOR_TRAFFIC_SKELETON_WITH_HISTORICAL")) & 1) != 0)
  {
    v4 = 28;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VECTOR_SPEED_PROFILES")) & 1) != 0)
  {
    v4 = 29;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VECTOR_VENUES")) & 1) != 0)
  {
    v4 = 30;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RASTER_DOWN_SAMPLED")) & 1) != 0)
  {
    v4 = 31;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RASTER_COLOR_BALANCED")) & 1) != 0)
  {
    v4 = 32;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RASTER_SATELLITE_NIGHT")) & 1) != 0)
  {
    v4 = 33;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SPUTNIK_VECTOR_BORDER")) & 1) != 0)
  {
    v4 = 34;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RASTER_SATELLITE_DIGITIZE")) & 1) != 0)
  {
    v4 = 35;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RASTER_HILLSHADE_PARKS")) & 1) != 0)
  {
    v4 = 36;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VECTOR_TRANSIT")) & 1) != 0)
  {
    v4 = 37;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RASTER_STANDARD_BASE")) & 1) != 0)
  {
    v4 = 38;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RASTER_STANDARD_LABELS")) & 1) != 0)
  {
    v4 = 39;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RASTER_HYBRID_ROADS")) & 1) != 0)
  {
    v4 = 40;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RASTER_HYBRID_LABELS")) & 1) != 0)
  {
    v4 = 41;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FLYOVER_C3M_MESH")) & 1) != 0)
  {
    v4 = 42;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FLYOVER_C3M_JPEG_TEXTURE")) & 1) != 0)
  {
    v4 = 43;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FLYOVER_C3M_ASTC_TEXTURE")) & 1) != 0)
  {
    v4 = 44;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RASTER_SATELLITE_ASTC")) & 1) != 0)
  {
    v4 = 45;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RASTER_HYBRID_ROADS_AND_LABELS")) & 1) != 0)
  {
    v4 = 46;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VECTOR_TRANSIT_SELECTION")) & 1) != 0)
  {
    v4 = 47;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VECTOR_COVERAGE")) & 1) != 0)
  {
    v4 = 48;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FLYOVER_METADATA")) & 1) != 0)
  {
    v4 = 52;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VECTOR_ROAD_NETWORK")) & 1) != 0)
  {
    v4 = 53;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VECTOR_LAND_COVER")) & 1) != 0)
  {
    v4 = 54;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VECTOR_DEBUG")) & 1) != 0)
  {
    v4 = 55;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VECTOR_STREET_POI")) & 1) != 0)
  {
    v4 = 56;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MUNIN_METADATA")) & 1) != 0)
  {
    v4 = 57;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VECTOR_SPR_MERCATOR")) & 1) != 0)
  {
    v4 = 58;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VECTOR_SPR_MODELS")) & 1) != 0)
  {
    v4 = 59;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VECTOR_SPR_MATERIALS")) & 1) != 0)
  {
    v4 = 60;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VECTOR_SPR_METADATA")) & 1) != 0)
  {
    v4 = 61;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VECTOR_TRACKS")) & 1) != 0)
  {
    v4 = 62;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VECTOR_RESERVED_2")) & 1) != 0)
  {
    v4 = 63;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VECTOR_STREET_LANDMARKS")) & 1) != 0)
  {
    v4 = 64;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("COARSE_LOCATION_POLYGONS")) & 1) != 0)
  {
    v4 = 65;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VECTOR_SPR_ROADS")) & 1) != 0)
  {
    v4 = 66;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VECTOR_SPR_STANDARD")) & 1) != 0)
  {
    v4 = 67;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VECTOR_POI_V2")) & 1) != 0)
  {
    v4 = 68;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VECTOR_POLYGON_SELECTION")) & 1) != 0)
  {
    v4 = 69;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VL_METADATA")) & 1) != 0)
  {
    v4 = 70;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VL_DATA")) & 1) != 0)
  {
    v4 = 71;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PROACTIVE_APP_CLIP")) & 1) != 0)
  {
    v4 = 72;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VECTOR_BUILDINGS_V2")) & 1) != 0)
  {
    v4 = 73;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("POI_BUSYNESS")) & 1) != 0)
  {
    v4 = 74;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("POI_DP_BUSYNESS")) & 1) != 0)
  {
    v4 = 75;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SMART_INTERFACE_SELECTION")) & 1) != 0)
  {
    v4 = 76;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VECTOR_ASSETS")) & 1) != 0)
  {
    v4 = 77;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SPR_ASSET_METADATA")) & 1) != 0)
  {
    v4 = 78;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VECTOR_SPR_POLAR")) & 1) != 0)
  {
    v4 = 79;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SMART_DATA_MODE")) & 1) != 0)
  {
    v4 = 80;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CELLULAR_PERFORMANCE_SCORE")) & 1) != 0)
  {
    v4 = 81;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VECTOR_SPR_MODELS_OCCLUSION")) & 1) != 0)
  {
    v4 = 82;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VECTOR_TOPOGRAPHIC")) & 1) != 0)
  {
    v4 = 83;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VECTOR_POI_V2_UPDATE")) & 1) != 0)
  {
    v4 = 84;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VECTOR_LIVE_DATA_UPDATES")) & 1) != 0)
  {
    v4 = 85;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VECTOR_TRAFFIC_V2")) & 1) != 0)
  {
    v4 = 86;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VECTOR_ROAD_SELECTION")) & 1) != 0)
  {
    v4 = 87;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VECTOR_REGION_METADATA")) & 1) != 0)
  {
    v4 = 88;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAY_TRACING")) & 1) != 0)
  {
    v4 = 89;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VECTOR_CONTOURS")) & 1) != 0)
  {
    v4 = 90;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RASTER_SATELLITE_POLAR")) & 1) != 0)
  {
    v4 = 91;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VMAP4_ELEVATION")) & 1) != 0)
  {
    v4 = 92;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VMAP4_ELEVATION_POLAR")) & 1) != 0)
  {
    v4 = 93;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CELLULAR_COVERAGE_PLMN")) & 1) != 0)
  {
    v4 = 94;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RASTER_SATELLITE_POLAR_NIGHT")) & 1) != 0)
  {
    v4 = 95;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNUSED_96")) & 1) != 0)
  {
    v4 = 96;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNUSED_97")) & 1) != 0)
  {
    v4 = 97;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNUSED_98")) & 1) != 0)
  {
    v4 = 98;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNUSED_99")) & 1) != 0)
  {
    v4 = 99;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNUSED_100")) & 1) != 0)
  {
    v4 = 100;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNUSED_101")) & 1) != 0)
  {
    v4 = 101;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNUSED_102")) & 1) != 0)
  {
    v4 = 102;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNUSED_103")) & 1) != 0)
  {
    v4 = 103;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNUSED_104")) & 1) != 0)
  {
    v4 = 104;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNUSED_105")) & 1) != 0)
  {
    v4 = 105;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNUSED_106")) & 1) != 0)
  {
    v4 = 106;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNUSED_107")) & 1) != 0)
  {
    v4 = 107;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNUSED_108")) & 1) != 0)
  {
    v4 = 108;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNUSED_109")) & 1) != 0)
  {
    v4 = 109;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNUSED_110")) & 1) != 0)
  {
    v4 = 110;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNUSED_111")) & 1) != 0)
  {
    v4 = 111;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNUSED_112")) & 1) != 0)
  {
    v4 = 112;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNUSED_113")) & 1) != 0)
  {
    v4 = 113;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNUSED_114")) & 1) != 0)
  {
    v4 = 114;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNUSED_115")) & 1) != 0)
  {
    v4 = 115;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNUSED_116")) & 1) != 0)
  {
    v4 = 116;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNUSED_117")) & 1) != 0)
  {
    v4 = 117;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNUSED_118")) & 1) != 0)
  {
    v4 = 118;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("UNUSED_119")))
  {
    v4 = 119;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setScale:(int)a3
{
  *(_WORD *)&self->_flags |= 0x2000u;
  self->_scale = a3;
}

- (id)scaleAsString:(int)a3
{
  if (a3 < 3)
    return off_1E1C07E20[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsScale:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NODPI")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LODPI")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("HIDPI")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setSize:(int)a3
{
  *(_WORD *)&self->_flags |= 0x2000u;
  self->_size = a3;
}

- (id)sizeAsString:(int)a3
{
  if (a3 < 3)
    return off_1E1C07E38[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsSize:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PX128")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PX256")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("PX512")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setVersion:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x2000u;
  self->_version = a3;
}

- (void)setTimeToLiveSeconds:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x2004u;
  self->_timeToLiveSeconds = a3;
}

- (void)setHasTimeToLiveSeconds:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8196;
  else
    v3 = 0x2000;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFB | v3;
}

- (void)clearAvailableTiles
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
  self->_availableTilesSpace = 0;
  self->_availableTilesCount = 0;
  free(self->_availableTiles);
  self->_availableTiles = 0;
}

- (void)addAvailableTiles:(GEOTileSetRegion *)a3
{
  GEOTileSetRegion v5;

  -[GEOActiveTileSet _readAvailableTiles]((uint64_t)self);
  v5 = *a3;
  if (self && -[GEOActiveTileSet _reserveAvailableTiles:]((uint64_t)self, 1uLL))
    self->_availableTiles[self->_availableTilesCount++] = v5;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
}

- (GEOTileSetRegion)availableTilesAtIndex:(SEL)a3
{
  GEOTileSetRegion *result;
  unint64_t availableTilesCount;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  GEOTileSetRegion *v13;

  -[GEOActiveTileSet _readAvailableTiles]((uint64_t)self);
  availableTilesCount = self->_availableTilesCount;
  if (availableTilesCount <= a4)
  {
    v9 = (void *)MEMORY[0x1E0C99DA0];
    v10 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a4, availableTilesCount);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "exceptionWithName:reason:userInfo:", v10, v11, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "raise");

  }
  v13 = &self->_availableTiles[a4];
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&v13->var0;
  *(_QWORD *)&retstr->var4 = *(_QWORD *)&v13->var4;
  return result;
}

- (void)setAvailableTiles:(GEOTileSetRegion *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
  -[GEOActiveTileSet clearAvailableTiles](self, "clearAvailableTiles");
  if (-[GEOActiveTileSet _reserveAvailableTiles:]((uint64_t)self, a4))
  {
    memcpy(self->_availableTiles, a3, 24 * a4);
    self->_availableTilesCount = a4;
  }
}

- (void)_readSentinelTiles
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 144) & 0x800) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOActiveTileSetReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSentinelTiles_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (NSMutableArray)sentinelTiles
{
  -[GEOActiveTileSet _readSentinelTiles]((uint64_t)self);
  return self->_sentinelTiles;
}

- (void)setSentinelTiles:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *sentinelTiles;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x800u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
  sentinelTiles = self->_sentinelTiles;
  self->_sentinelTiles = v4;

}

- (void)clearSentinelTiles
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x800u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
  -[NSMutableArray removeAllObjects](self->_sentinelTiles, "removeAllObjects");
}

- (void)addSentinelTile:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOActiveTileSet _readSentinelTiles]((uint64_t)self);
  -[GEOActiveTileSet _addNoFlagsSentinelTile:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x800u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
}

- (unint64_t)sentinelTilesCount
{
  -[GEOActiveTileSet _readSentinelTiles]((uint64_t)self);
  return -[NSMutableArray count](self->_sentinelTiles, "count");
}

- (id)sentinelTileAtIndex:(unint64_t)a3
{
  -[GEOActiveTileSet _readSentinelTiles]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_sentinelTiles, "objectAtIndex:", a3);
}

+ (Class)sentinelTileType
{
  return (Class)objc_opt_class();
}

- (void)setLocalizationURL:(id)a3
{
  *(_WORD *)&self->_flags |= 0x2400u;
  objc_storeStrong((id *)&self->_localizationURL, a3);
}

- (void)setSupportedLanguages:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *supportedLanguages;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x1000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
  supportedLanguages = self->_supportedLanguages;
  self->_supportedLanguages = v4;

}

- (void)clearSupportedLanguages
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x1000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
  -[NSMutableArray removeAllObjects](self->_supportedLanguages, "removeAllObjects");
}

- (void)addSupportedLanguage:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOActiveTileSet _readSupportedLanguages]((uint64_t)self);
  -[GEOActiveTileSet _addNoFlagsSupportedLanguage:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x1000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
}

- (id)supportedLanguageAtIndex:(unint64_t)a3
{
  -[GEOActiveTileSet _readSupportedLanguages]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_supportedLanguages, "objectAtIndex:", a3);
}

+ (Class)supportedLanguageType
{
  return (Class)objc_opt_class();
}

- (int)updateBehavior
{
  os_unfair_lock_s *p_readerLock;
  __int16 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 8) != 0)
    return self->_updateBehavior;
  else
    return 1;
}

- (void)setUpdateBehavior:(int)a3
{
  *(_WORD *)&self->_flags |= 0x2008u;
  self->_updateBehavior = a3;
}

- (void)setHasUpdateBehavior:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8200;
  else
    v3 = 0x2000;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFF7 | v3;
}

- (BOOL)hasUpdateBehavior
{
  return (*(_WORD *)&self->_flags >> 3) & 1;
}

- (id)updateBehaviorAsString:(int)a3
{
  __CFString *v3;

  if (!a3)
    return CFSTR("TILE_UPDATE_BEHAVIOR_FLUSH");
  if (a3 == 1)
  {
    v3 = CFSTR("TILE_UPDATE_BEHAVIOR_ETAG");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsUpdateBehavior:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TILE_UPDATE_BEHAVIOR_FLUSH")) & 1) != 0)
    v4 = 0;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("TILE_UPDATE_BEHAVIOR_ETAG"));

  return v4;
}

- (void)setCountryRegionAllowlists:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *countryRegionAllowlists;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x100u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
  countryRegionAllowlists = self->_countryRegionAllowlists;
  self->_countryRegionAllowlists = v4;

}

- (void)clearCountryRegionAllowlists
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x100u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
  -[NSMutableArray removeAllObjects](self->_countryRegionAllowlists, "removeAllObjects");
}

- (void)addCountryRegionAllowlist:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOActiveTileSet _readCountryRegionAllowlists]((uint64_t)self);
  -[GEOActiveTileSet _addNoFlagsCountryRegionAllowlist:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x100u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
}

- (unint64_t)countryRegionAllowlistsCount
{
  -[GEOActiveTileSet _readCountryRegionAllowlists]((uint64_t)self);
  return -[NSMutableArray count](self->_countryRegionAllowlists, "count");
}

- (id)countryRegionAllowlistAtIndex:(unint64_t)a3
{
  -[GEOActiveTileSet _readCountryRegionAllowlists]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_countryRegionAllowlists, "objectAtIndex:", a3);
}

+ (Class)countryRegionAllowlistType
{
  return (Class)objc_opt_class();
}

- (void)setChecksumType:(int)a3
{
  *(_WORD *)&self->_flags |= 0x2001u;
  self->_checksumType = a3;
}

- (void)setHasChecksumType:(BOOL)a3
{
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFE | a3 | 0x2000;
}

- (id)checksumTypeAsString:(int)a3
{
  __CFString *v3;

  if (!a3)
    return CFSTR("CHECKSUM_TYPE_NONE");
  if (a3 == 1)
  {
    v3 = CFSTR("CHECKSUM_TYPE_APPENDED_MD5");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsChecksumType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CHECKSUM_TYPE_NONE")) & 1) != 0)
    v4 = 0;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("CHECKSUM_TYPE_APPENDED_MD5"));

  return v4;
}

- (void)setRequestStyle:(int)a3
{
  *(_WORD *)&self->_flags |= 0x2002u;
  self->_requestStyle = a3;
}

- (void)setHasRequestStyle:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8194;
  else
    v3 = 0x2000;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasRequestStyle
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
}

- (id)requestStyleAsString:(int)a3
{
  __CFString *v3;

  if (!a3)
    return CFSTR("REQUEST_STYLE_LEGACY");
  if (a3 == 1)
  {
    v3 = CFSTR("REQUEST_STYLE_HEADER_PARAMS_VERSION_BASED_HMAC_AUTH");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsRequestStyle:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_STYLE_LEGACY")) & 1) != 0)
    v4 = 0;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_STYLE_HEADER_PARAMS_VERSION_BASED_HMAC_AUTH"));

  return v4;
}

- (BOOL)useAuthProxy
{
  os_unfair_lock_s *p_readerLock;
  __int16 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  return (flags & 0x10) != 0 && self->_useAuthProxy;
}

- (void)setUseAuthProxy:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x2010u;
  self->_useAuthProxy = a3;
}

- (void)setHasUseAuthProxy:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8208;
  else
    v3 = 0x2000;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFEF | v3;
}

- (BOOL)hasUseAuthProxy
{
  return (*(_WORD *)&self->_flags >> 4) & 1;
}

- (void)setDeviceSKUAllowlists:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *deviceSKUAllowlists;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x200u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
  deviceSKUAllowlists = self->_deviceSKUAllowlists;
  self->_deviceSKUAllowlists = v4;

}

- (void)clearDeviceSKUAllowlists
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x200u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
  -[NSMutableArray removeAllObjects](self->_deviceSKUAllowlists, "removeAllObjects");
}

- (void)addDeviceSKUAllowlist:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOActiveTileSet _readDeviceSKUAllowlists]((uint64_t)self);
  -[GEOActiveTileSet _addNoFlagsDeviceSKUAllowlist:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x200u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
}

- (void)_addNoFlagsDeviceSKUAllowlist:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 64);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 64);
      *(_QWORD *)(a1 + 64) = v5;

      v4 = *(void **)(a1 + 64);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)deviceSKUAllowlistsCount
{
  -[GEOActiveTileSet _readDeviceSKUAllowlists]((uint64_t)self);
  return -[NSMutableArray count](self->_deviceSKUAllowlists, "count");
}

- (id)deviceSKUAllowlistAtIndex:(unint64_t)a3
{
  -[GEOActiveTileSet _readDeviceSKUAllowlists]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_deviceSKUAllowlists, "objectAtIndex:", a3);
}

+ (Class)deviceSKUAllowlistType
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
  v8.super_class = (Class)GEOActiveTileSet;
  -[GEOActiveTileSet description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOActiveTileSet dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOActiveTileSet _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  __CFString *v6;
  uint64_t v7;
  __CFString *v8;
  uint64_t v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  __CFString *v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t j;
  void *v35;
  void *v36;
  __int16 v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  int v47;
  __CFString *v48;
  int v49;
  __CFString *v50;
  _QWORD v51[4];
  id v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _BYTE v61[128];
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)a1, "baseURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("baseURL"));

  v6 = CFSTR("RASTER_STANDARD");
  switch(*(_DWORD *)(a1 + 124))
  {
    case 0:
      break;
    case 1:
      v6 = CFSTR("VECTOR_STANDARD");
      break;
    case 2:
      v6 = CFSTR("VECTOR_TRAFFIC_SEGMENTS_FOR_RASTER");
      break;
    case 3:
      v6 = CFSTR("VECTOR_TRAFFIC_INCIDENTS_FOR_RASTER");
      break;
    case 4:
      v6 = CFSTR("VECTOR_TRAFFIC_SEGMENTS_AND_INCIDENTS_FOR_RASTER");
      break;
    case 5:
      v6 = CFSTR("RASTER_STANDARD_BACKGROUND");
      break;
    case 6:
      v6 = CFSTR("RASTER_HYBRID");
      break;
    case 7:
      v6 = CFSTR("RASTER_SATELLITE");
      break;
    case 8:
      v6 = CFSTR("RASTER_TERRAIN");
      break;
    case 0xB:
      v6 = CFSTR("VECTOR_BUILDINGS");
      break;
    case 0xC:
      v6 = CFSTR("VECTOR_TRAFFIC");
      break;
    case 0xD:
      v6 = CFSTR("VECTOR_POI");
      break;
    case 0xE:
      v6 = CFSTR("SPUTNIK_METADATA");
      break;
    case 0xF:
      v6 = CFSTR("SPUTNIK_C3M");
      break;
    case 0x10:
      v6 = CFSTR("SPUTNIK_DSM");
      break;
    case 0x11:
      v6 = CFSTR("SPUTNIK_DSM_GLOBAL");
      break;
    case 0x12:
      v6 = CFSTR("VECTOR_REALISTIC");
      break;
    case 0x13:
      v6 = CFSTR("VECTOR_LEGACY_REALISTIC");
      break;
    case 0x14:
      v6 = CFSTR("VECTOR_ROADS");
      break;
    case 0x15:
      v6 = CFSTR("RASTER_VEGETATION");
      break;
    case 0x16:
      v6 = CFSTR("VECTOR_TRAFFIC_SKELETON");
      break;
    case 0x17:
      v6 = CFSTR("RASTER_COASTLINE_MASK");
      break;
    case 0x18:
      v6 = CFSTR("RASTER_HILLSHADE");
      break;
    case 0x19:
      v6 = CFSTR("VECTOR_TRAFFIC_WITH_GREEN");
      break;
    case 0x1A:
      v6 = CFSTR("VECTOR_TRAFFIC_STATIC");
      break;
    case 0x1B:
      v6 = CFSTR("RASTER_COASTLINE_DROP_MASK");
      break;
    case 0x1C:
      v6 = CFSTR("VECTOR_TRAFFIC_SKELETON_WITH_HISTORICAL");
      break;
    case 0x1D:
      v6 = CFSTR("VECTOR_SPEED_PROFILES");
      break;
    case 0x1E:
      v6 = CFSTR("VECTOR_VENUES");
      break;
    case 0x1F:
      v6 = CFSTR("RASTER_DOWN_SAMPLED");
      break;
    case 0x20:
      v6 = CFSTR("RASTER_COLOR_BALANCED");
      break;
    case 0x21:
      v6 = CFSTR("RASTER_SATELLITE_NIGHT");
      break;
    case 0x22:
      v6 = CFSTR("SPUTNIK_VECTOR_BORDER");
      break;
    case 0x23:
      v6 = CFSTR("RASTER_SATELLITE_DIGITIZE");
      break;
    case 0x24:
      v6 = CFSTR("RASTER_HILLSHADE_PARKS");
      break;
    case 0x25:
      v6 = CFSTR("VECTOR_TRANSIT");
      break;
    case 0x26:
      v6 = CFSTR("RASTER_STANDARD_BASE");
      break;
    case 0x27:
      v6 = CFSTR("RASTER_STANDARD_LABELS");
      break;
    case 0x28:
      v6 = CFSTR("RASTER_HYBRID_ROADS");
      break;
    case 0x29:
      v6 = CFSTR("RASTER_HYBRID_LABELS");
      break;
    case 0x2A:
      v6 = CFSTR("FLYOVER_C3M_MESH");
      break;
    case 0x2B:
      v6 = CFSTR("FLYOVER_C3M_JPEG_TEXTURE");
      break;
    case 0x2C:
      v6 = CFSTR("FLYOVER_C3M_ASTC_TEXTURE");
      break;
    case 0x2D:
      v6 = CFSTR("RASTER_SATELLITE_ASTC");
      break;
    case 0x2E:
      v6 = CFSTR("RASTER_HYBRID_ROADS_AND_LABELS");
      break;
    case 0x2F:
      v6 = CFSTR("VECTOR_TRANSIT_SELECTION");
      break;
    case 0x30:
      v6 = CFSTR("VECTOR_COVERAGE");
      break;
    case 0x34:
      v6 = CFSTR("FLYOVER_METADATA");
      break;
    case 0x35:
      v6 = CFSTR("VECTOR_ROAD_NETWORK");
      break;
    case 0x36:
      v6 = CFSTR("VECTOR_LAND_COVER");
      break;
    case 0x37:
      v6 = CFSTR("VECTOR_DEBUG");
      break;
    case 0x38:
      v6 = CFSTR("VECTOR_STREET_POI");
      break;
    case 0x39:
      v6 = CFSTR("MUNIN_METADATA");
      break;
    case 0x3A:
      v6 = CFSTR("VECTOR_SPR_MERCATOR");
      break;
    case 0x3B:
      v6 = CFSTR("VECTOR_SPR_MODELS");
      break;
    case 0x3C:
      v6 = CFSTR("VECTOR_SPR_MATERIALS");
      break;
    case 0x3D:
      v6 = CFSTR("VECTOR_SPR_METADATA");
      break;
    case 0x3E:
      v6 = CFSTR("VECTOR_TRACKS");
      break;
    case 0x3F:
      v6 = CFSTR("VECTOR_RESERVED_2");
      break;
    case 0x40:
      v6 = CFSTR("VECTOR_STREET_LANDMARKS");
      break;
    case 0x41:
      v6 = CFSTR("COARSE_LOCATION_POLYGONS");
      break;
    case 0x42:
      v6 = CFSTR("VECTOR_SPR_ROADS");
      break;
    case 0x43:
      v6 = CFSTR("VECTOR_SPR_STANDARD");
      break;
    case 0x44:
      v6 = CFSTR("VECTOR_POI_V2");
      break;
    case 0x45:
      v6 = CFSTR("VECTOR_POLYGON_SELECTION");
      break;
    case 0x46:
      v6 = CFSTR("VL_METADATA");
      break;
    case 0x47:
      v6 = CFSTR("VL_DATA");
      break;
    case 0x48:
      v6 = CFSTR("PROACTIVE_APP_CLIP");
      break;
    case 0x49:
      v6 = CFSTR("VECTOR_BUILDINGS_V2");
      break;
    case 0x4A:
      v6 = CFSTR("POI_BUSYNESS");
      break;
    case 0x4B:
      v6 = CFSTR("POI_DP_BUSYNESS");
      break;
    case 0x4C:
      v6 = CFSTR("SMART_INTERFACE_SELECTION");
      break;
    case 0x4D:
      v6 = CFSTR("VECTOR_ASSETS");
      break;
    case 0x4E:
      v6 = CFSTR("SPR_ASSET_METADATA");
      break;
    case 0x4F:
      v6 = CFSTR("VECTOR_SPR_POLAR");
      break;
    case 0x50:
      v6 = CFSTR("SMART_DATA_MODE");
      break;
    case 0x51:
      v6 = CFSTR("CELLULAR_PERFORMANCE_SCORE");
      break;
    case 0x52:
      v6 = CFSTR("VECTOR_SPR_MODELS_OCCLUSION");
      break;
    case 0x53:
      v6 = CFSTR("VECTOR_TOPOGRAPHIC");
      break;
    case 0x54:
      v6 = CFSTR("VECTOR_POI_V2_UPDATE");
      break;
    case 0x55:
      v6 = CFSTR("VECTOR_LIVE_DATA_UPDATES");
      break;
    case 0x56:
      v6 = CFSTR("VECTOR_TRAFFIC_V2");
      break;
    case 0x57:
      v6 = CFSTR("VECTOR_ROAD_SELECTION");
      break;
    case 0x58:
      v6 = CFSTR("VECTOR_REGION_METADATA");
      break;
    case 0x59:
      v6 = CFSTR("RAY_TRACING");
      break;
    case 0x5A:
      v6 = CFSTR("VECTOR_CONTOURS");
      break;
    case 0x5B:
      v6 = CFSTR("RASTER_SATELLITE_POLAR");
      break;
    case 0x5C:
      v6 = CFSTR("VMAP4_ELEVATION");
      break;
    case 0x5D:
      v6 = CFSTR("VMAP4_ELEVATION_POLAR");
      break;
    case 0x5E:
      v6 = CFSTR("CELLULAR_COVERAGE_PLMN");
      break;
    case 0x5F:
      v6 = CFSTR("RASTER_SATELLITE_POLAR_NIGHT");
      break;
    case 0x60:
      v6 = CFSTR("UNUSED_96");
      break;
    case 0x61:
      v6 = CFSTR("UNUSED_97");
      break;
    case 0x62:
      v6 = CFSTR("UNUSED_98");
      break;
    case 0x63:
      v6 = CFSTR("UNUSED_99");
      break;
    case 0x64:
      v6 = CFSTR("UNUSED_100");
      break;
    case 0x65:
      v6 = CFSTR("UNUSED_101");
      break;
    case 0x66:
      v6 = CFSTR("UNUSED_102");
      break;
    case 0x67:
      v6 = CFSTR("UNUSED_103");
      break;
    case 0x68:
      v6 = CFSTR("UNUSED_104");
      break;
    case 0x69:
      v6 = CFSTR("UNUSED_105");
      break;
    case 0x6A:
      v6 = CFSTR("UNUSED_106");
      break;
    case 0x6B:
      v6 = CFSTR("UNUSED_107");
      break;
    case 0x6C:
      v6 = CFSTR("UNUSED_108");
      break;
    case 0x6D:
      v6 = CFSTR("UNUSED_109");
      break;
    case 0x6E:
      v6 = CFSTR("UNUSED_110");
      break;
    case 0x6F:
      v6 = CFSTR("UNUSED_111");
      break;
    case 0x70:
      v6 = CFSTR("UNUSED_112");
      break;
    case 0x71:
      v6 = CFSTR("UNUSED_113");
      break;
    case 0x72:
      v6 = CFSTR("UNUSED_114");
      break;
    case 0x73:
      v6 = CFSTR("UNUSED_115");
      break;
    case 0x74:
      v6 = CFSTR("UNUSED_116");
      break;
    case 0x75:
      v6 = CFSTR("UNUSED_117");
      break;
    case 0x76:
      v6 = CFSTR("UNUSED_118");
      break;
    case 0x77:
      v6 = CFSTR("UNUSED_119");
      break;
    default:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 124));
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
  }
  objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("style"));

  v7 = *(int *)(a1 + 116);
  if (v7 >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 116));
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = off_1E1C07E20[v7];
  }
  objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("scale"));

  v9 = *(int *)(a1 + 120);
  if (v9 >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 120));
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = off_1E1C07E38[v9];
  }
  objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("size"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 136));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("version"));

  if ((*(_WORD *)(a1 + 144) & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 128));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("timeToLiveSeconds"));

  }
  if (*(_QWORD *)(a1 + 32))
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", *(_QWORD *)(a1 + 32));
    if (*(_QWORD *)(a1 + 32))
    {
      v14 = 0;
      v15 = 0;
      do
      {
        _GEOTileSetRegionDictionaryRepresentation((unsigned int *)(*(_QWORD *)(a1 + 24) + v14));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addObject:", v16);

        ++v15;
        v14 += 24;
      }
      while (v15 < *(_QWORD *)(a1 + 32));
    }
    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("availableTiles"));

  }
  if (objc_msgSend(*(id *)(a1 + 80), "count"))
  {
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 80), "count"));
    v57 = 0u;
    v58 = 0u;
    v59 = 0u;
    v60 = 0u;
    v18 = *(id *)(a1 + 80);
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v57, v62, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v58;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v58 != v21)
            objc_enumerationMutation(v18);
          v23 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v23, "jsonRepresentation");
          else
            objc_msgSend(v23, "dictionaryRepresentation");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "addObject:", v24);

        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v57, v62, 16);
      }
      while (v20);
    }

    objc_msgSend(v4, "setObject:forKey:", v17, CFSTR("sentinelTile"));
  }
  objc_msgSend((id)a1, "localizationURL");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v25)
    objc_msgSend(v4, "setObject:forKey:", v25, CFSTR("localizationURL"));

  if (*(_QWORD *)(a1 + 88))
  {
    objc_msgSend((id)a1, "supportedLanguages");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v26, CFSTR("supportedLanguage"));

  }
  if ((*(_WORD *)(a1 + 144) & 8) != 0)
  {
    v27 = *(_DWORD *)(a1 + 132);
    if (v27)
    {
      if (v27 == 1)
      {
        v28 = CFSTR("TILE_UPDATE_BEHAVIOR_ETAG");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 132));
        v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v28 = CFSTR("TILE_UPDATE_BEHAVIOR_FLUSH");
    }
    objc_msgSend(v4, "setObject:forKey:", v28, CFSTR("updateBehavior"));

  }
  if (objc_msgSend(*(id *)(a1 + 56), "count"))
  {
    v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 56), "count"));
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    v30 = *(id *)(a1 + 56);
    v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v53, v61, 16);
    if (v31)
    {
      v32 = v31;
      v33 = *(_QWORD *)v54;
      do
      {
        for (j = 0; j != v32; ++j)
        {
          if (*(_QWORD *)v54 != v33)
            objc_enumerationMutation(v30);
          v35 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * j);
          if ((a2 & 1) != 0)
            objc_msgSend(v35, "jsonRepresentation");
          else
            objc_msgSend(v35, "dictionaryRepresentation");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "addObject:", v36);

        }
        v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v53, v61, 16);
      }
      while (v32);
    }

    objc_msgSend(v4, "setObject:forKey:", v29, CFSTR("countryRegionAllowlist"));
  }
  v37 = *(_WORD *)(a1 + 144);
  if ((v37 & 1) == 0)
  {
    if ((v37 & 2) == 0)
      goto LABEL_170;
LABEL_185:
    v49 = *(_DWORD *)(a1 + 112);
    if (v49)
    {
      if (v49 == 1)
      {
        v50 = CFSTR("REQUEST_STYLE_HEADER_PARAMS_VERSION_BASED_HMAC_AUTH");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 112));
        v50 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v50 = CFSTR("REQUEST_STYLE_LEGACY");
    }
    objc_msgSend(v4, "setObject:forKey:", v50, CFSTR("requestStyle"));

    if ((*(_WORD *)(a1 + 144) & 0x10) == 0)
      goto LABEL_172;
    goto LABEL_171;
  }
  v47 = *(_DWORD *)(a1 + 108);
  if (v47)
  {
    if (v47 == 1)
    {
      v48 = CFSTR("CHECKSUM_TYPE_APPENDED_MD5");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 108));
      v48 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v48 = CFSTR("CHECKSUM_TYPE_NONE");
  }
  objc_msgSend(v4, "setObject:forKey:", v48, CFSTR("checksumType"));

  v37 = *(_WORD *)(a1 + 144);
  if ((v37 & 2) != 0)
    goto LABEL_185;
LABEL_170:
  if ((v37 & 0x10) != 0)
  {
LABEL_171:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 140));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v38, CFSTR("useAuthProxy"));

  }
LABEL_172:
  if (*(_QWORD *)(a1 + 64))
  {
    objc_msgSend((id)a1, "deviceSKUAllowlists");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v39, CFSTR("deviceSKUAllowlist"));

  }
  v40 = *(void **)(a1 + 16);
  if (v40)
  {
    objc_msgSend(v40, "dictionaryRepresentation");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = v41;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v41, "count"));
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v51[0] = MEMORY[0x1E0C809B0];
      v51[1] = 3221225472;
      v51[2] = __46__GEOActiveTileSet__dictionaryRepresentation___block_invoke;
      v51[3] = &unk_1E1C00600;
      v44 = v43;
      v52 = v44;
      objc_msgSend(v42, "enumerateKeysAndObjectsUsingBlock:", v51);
      v45 = v44;

      v42 = v45;
    }
    objc_msgSend(v4, "setObject:forKey:", v42, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOActiveTileSet _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __46__GEOActiveTileSet__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOActiveTileSet)initWithDictionary:(id)a3
{
  return (GEOActiveTileSet *)-[GEOActiveTileSet _initWithDictionary:isJSON:](self, a3, 0);
}

- (id)_initWithDictionary:(char)a3 isJSON:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  uint64_t v32;
  GEOSentinelTile *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t k;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  uint64_t v48;
  void *v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t m;
  uint64_t v55;
  GEOCountryRegionTuple *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  id v60;
  uint64_t v61;
  void *v62;
  id v63;
  uint64_t v64;
  void *v65;
  void *v66;
  id v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t n;
  void *v72;
  void *v73;
  void *v75;
  id v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  uint64_t v94;
  __int128 v95;
  uint64_t v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  _BYTE v101[128];
  _BYTE v102[128];
  _BYTE v103[128];
  _BYTE v104[128];
  _BYTE v105[128];
  uint64_t v106;

  v106 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (!a1)
    goto LABEL_359;
  a1 = (id)objc_msgSend(a1, "init");

  if (!a1)
    goto LABEL_359;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("baseURL"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(a1, "setBaseURL:", v7);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("style"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v76 = v5;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = v8;
    if ((objc_msgSend(v9, "isEqualToString:", CFSTR("RASTER_STANDARD")) & 1) != 0)
    {
      v10 = 0;
    }
    else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("VECTOR_STANDARD")) & 1) != 0)
    {
      v10 = 1;
    }
    else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("VECTOR_TRAFFIC_SEGMENTS_FOR_RASTER")) & 1) != 0)
    {
      v10 = 2;
    }
    else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("VECTOR_TRAFFIC_INCIDENTS_FOR_RASTER")) & 1) != 0)
    {
      v10 = 3;
    }
    else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("VECTOR_TRAFFIC_SEGMENTS_AND_INCIDENTS_FOR_RASTER")) & 1) != 0)
    {
      v10 = 4;
    }
    else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("RASTER_STANDARD_BACKGROUND")) & 1) != 0)
    {
      v10 = 5;
    }
    else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("RASTER_HYBRID")) & 1) != 0)
    {
      v10 = 6;
    }
    else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("RASTER_SATELLITE")) & 1) != 0)
    {
      v10 = 7;
    }
    else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("RASTER_TERRAIN")) & 1) != 0)
    {
      v10 = 8;
    }
    else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("VECTOR_BUILDINGS")) & 1) != 0)
    {
      v10 = 11;
    }
    else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("VECTOR_TRAFFIC")) & 1) != 0)
    {
      v10 = 12;
    }
    else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("VECTOR_POI")) & 1) != 0)
    {
      v10 = 13;
    }
    else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("SPUTNIK_METADATA")) & 1) != 0)
    {
      v10 = 14;
    }
    else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("SPUTNIK_C3M")) & 1) != 0)
    {
      v10 = 15;
    }
    else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("SPUTNIK_DSM")) & 1) != 0)
    {
      v10 = 16;
    }
    else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("SPUTNIK_DSM_GLOBAL")) & 1) != 0)
    {
      v10 = 17;
    }
    else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("VECTOR_REALISTIC")) & 1) != 0)
    {
      v10 = 18;
    }
    else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("VECTOR_LEGACY_REALISTIC")) & 1) != 0)
    {
      v10 = 19;
    }
    else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("VECTOR_ROADS")) & 1) != 0)
    {
      v10 = 20;
    }
    else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("RASTER_VEGETATION")) & 1) != 0)
    {
      v10 = 21;
    }
    else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("VECTOR_TRAFFIC_SKELETON")) & 1) != 0)
    {
      v10 = 22;
    }
    else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("RASTER_COASTLINE_MASK")) & 1) != 0)
    {
      v10 = 23;
    }
    else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("RASTER_HILLSHADE")) & 1) != 0)
    {
      v10 = 24;
    }
    else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("VECTOR_TRAFFIC_WITH_GREEN")) & 1) != 0)
    {
      v10 = 25;
    }
    else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("VECTOR_TRAFFIC_STATIC")) & 1) != 0)
    {
      v10 = 26;
    }
    else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("RASTER_COASTLINE_DROP_MASK")) & 1) != 0)
    {
      v10 = 27;
    }
    else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("VECTOR_TRAFFIC_SKELETON_WITH_HISTORICAL")) & 1) != 0)
    {
      v10 = 28;
    }
    else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("VECTOR_SPEED_PROFILES")) & 1) != 0)
    {
      v10 = 29;
    }
    else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("VECTOR_VENUES")) & 1) != 0)
    {
      v10 = 30;
    }
    else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("RASTER_DOWN_SAMPLED")) & 1) != 0)
    {
      v10 = 31;
    }
    else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("RASTER_COLOR_BALANCED")) & 1) != 0)
    {
      v10 = 32;
    }
    else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("RASTER_SATELLITE_NIGHT")) & 1) != 0)
    {
      v10 = 33;
    }
    else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("SPUTNIK_VECTOR_BORDER")) & 1) != 0)
    {
      v10 = 34;
    }
    else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("RASTER_SATELLITE_DIGITIZE")) & 1) != 0)
    {
      v10 = 35;
    }
    else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("RASTER_HILLSHADE_PARKS")) & 1) != 0)
    {
      v10 = 36;
    }
    else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("VECTOR_TRANSIT")) & 1) != 0)
    {
      v10 = 37;
    }
    else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("RASTER_STANDARD_BASE")) & 1) != 0)
    {
      v10 = 38;
    }
    else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("RASTER_STANDARD_LABELS")) & 1) != 0)
    {
      v10 = 39;
    }
    else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("RASTER_HYBRID_ROADS")) & 1) != 0)
    {
      v10 = 40;
    }
    else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("RASTER_HYBRID_LABELS")) & 1) != 0)
    {
      v10 = 41;
    }
    else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("FLYOVER_C3M_MESH")) & 1) != 0)
    {
      v10 = 42;
    }
    else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("FLYOVER_C3M_JPEG_TEXTURE")) & 1) != 0)
    {
      v10 = 43;
    }
    else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("FLYOVER_C3M_ASTC_TEXTURE")) & 1) != 0)
    {
      v10 = 44;
    }
    else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("RASTER_SATELLITE_ASTC")) & 1) != 0)
    {
      v10 = 45;
    }
    else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("RASTER_HYBRID_ROADS_AND_LABELS")) & 1) != 0)
    {
      v10 = 46;
    }
    else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("VECTOR_TRANSIT_SELECTION")) & 1) != 0)
    {
      v10 = 47;
    }
    else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("VECTOR_COVERAGE")) & 1) != 0)
    {
      v10 = 48;
    }
    else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("FLYOVER_METADATA")) & 1) != 0)
    {
      v10 = 52;
    }
    else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("VECTOR_ROAD_NETWORK")) & 1) != 0)
    {
      v10 = 53;
    }
    else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("VECTOR_LAND_COVER")) & 1) != 0)
    {
      v10 = 54;
    }
    else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("VECTOR_DEBUG")) & 1) != 0)
    {
      v10 = 55;
    }
    else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("VECTOR_STREET_POI")) & 1) != 0)
    {
      v10 = 56;
    }
    else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("MUNIN_METADATA")) & 1) != 0)
    {
      v10 = 57;
    }
    else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("VECTOR_SPR_MERCATOR")) & 1) != 0)
    {
      v10 = 58;
    }
    else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("VECTOR_SPR_MODELS")) & 1) != 0)
    {
      v10 = 59;
    }
    else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("VECTOR_SPR_MATERIALS")) & 1) != 0)
    {
      v10 = 60;
    }
    else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("VECTOR_SPR_METADATA")) & 1) != 0)
    {
      v10 = 61;
    }
    else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("VECTOR_TRACKS")) & 1) != 0)
    {
      v10 = 62;
    }
    else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("VECTOR_RESERVED_2")) & 1) != 0)
    {
      v10 = 63;
    }
    else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("VECTOR_STREET_LANDMARKS")) & 1) != 0)
    {
      v10 = 64;
    }
    else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("COARSE_LOCATION_POLYGONS")) & 1) != 0)
    {
      v10 = 65;
    }
    else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("VECTOR_SPR_ROADS")) & 1) != 0)
    {
      v10 = 66;
    }
    else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("VECTOR_SPR_STANDARD")) & 1) != 0)
    {
      v10 = 67;
    }
    else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("VECTOR_POI_V2")) & 1) != 0)
    {
      v10 = 68;
    }
    else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("VECTOR_POLYGON_SELECTION")) & 1) != 0)
    {
      v10 = 69;
    }
    else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("VL_METADATA")) & 1) != 0)
    {
      v10 = 70;
    }
    else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("VL_DATA")) & 1) != 0)
    {
      v10 = 71;
    }
    else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("PROACTIVE_APP_CLIP")) & 1) != 0)
    {
      v10 = 72;
    }
    else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("VECTOR_BUILDINGS_V2")) & 1) != 0)
    {
      v10 = 73;
    }
    else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("POI_BUSYNESS")) & 1) != 0)
    {
      v10 = 74;
    }
    else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("POI_DP_BUSYNESS")) & 1) != 0)
    {
      v10 = 75;
    }
    else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("SMART_INTERFACE_SELECTION")) & 1) != 0)
    {
      v10 = 76;
    }
    else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("VECTOR_ASSETS")) & 1) != 0)
    {
      v10 = 77;
    }
    else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("SPR_ASSET_METADATA")) & 1) != 0)
    {
      v10 = 78;
    }
    else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("VECTOR_SPR_POLAR")) & 1) != 0)
    {
      v10 = 79;
    }
    else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("SMART_DATA_MODE")) & 1) != 0)
    {
      v10 = 80;
    }
    else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("CELLULAR_PERFORMANCE_SCORE")) & 1) != 0)
    {
      v10 = 81;
    }
    else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("VECTOR_SPR_MODELS_OCCLUSION")) & 1) != 0)
    {
      v10 = 82;
    }
    else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("VECTOR_TOPOGRAPHIC")) & 1) != 0)
    {
      v10 = 83;
    }
    else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("VECTOR_POI_V2_UPDATE")) & 1) != 0)
    {
      v10 = 84;
    }
    else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("VECTOR_LIVE_DATA_UPDATES")) & 1) != 0)
    {
      v10 = 85;
    }
    else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("VECTOR_TRAFFIC_V2")) & 1) != 0)
    {
      v10 = 86;
    }
    else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("VECTOR_ROAD_SELECTION")) & 1) != 0)
    {
      v10 = 87;
    }
    else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("VECTOR_REGION_METADATA")) & 1) != 0)
    {
      v10 = 88;
    }
    else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("RAY_TRACING")) & 1) != 0)
    {
      v10 = 89;
    }
    else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("VECTOR_CONTOURS")) & 1) != 0)
    {
      v10 = 90;
    }
    else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("RASTER_SATELLITE_POLAR")) & 1) != 0)
    {
      v10 = 91;
    }
    else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("VMAP4_ELEVATION")) & 1) != 0)
    {
      v10 = 92;
    }
    else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("VMAP4_ELEVATION_POLAR")) & 1) != 0)
    {
      v10 = 93;
    }
    else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("CELLULAR_COVERAGE_PLMN")) & 1) != 0)
    {
      v10 = 94;
    }
    else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("RASTER_SATELLITE_POLAR_NIGHT")) & 1) != 0)
    {
      v10 = 95;
    }
    else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("UNUSED_96")) & 1) != 0)
    {
      v10 = 96;
    }
    else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("UNUSED_97")) & 1) != 0)
    {
      v10 = 97;
    }
    else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("UNUSED_98")) & 1) != 0)
    {
      v10 = 98;
    }
    else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("UNUSED_99")) & 1) != 0)
    {
      v10 = 99;
    }
    else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("UNUSED_100")) & 1) != 0)
    {
      v10 = 100;
    }
    else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("UNUSED_101")) & 1) != 0)
    {
      v10 = 101;
    }
    else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("UNUSED_102")) & 1) != 0)
    {
      v10 = 102;
    }
    else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("UNUSED_103")) & 1) != 0)
    {
      v10 = 103;
    }
    else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("UNUSED_104")) & 1) != 0)
    {
      v10 = 104;
    }
    else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("UNUSED_105")) & 1) != 0)
    {
      v10 = 105;
    }
    else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("UNUSED_106")) & 1) != 0)
    {
      v10 = 106;
    }
    else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("UNUSED_107")) & 1) != 0)
    {
      v10 = 107;
    }
    else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("UNUSED_108")) & 1) != 0)
    {
      v10 = 108;
    }
    else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("UNUSED_109")) & 1) != 0)
    {
      v10 = 109;
    }
    else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("UNUSED_110")) & 1) != 0)
    {
      v10 = 110;
    }
    else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("UNUSED_111")) & 1) != 0)
    {
      v10 = 111;
    }
    else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("UNUSED_112")) & 1) != 0)
    {
      v10 = 112;
    }
    else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("UNUSED_113")) & 1) != 0)
    {
      v10 = 113;
    }
    else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("UNUSED_114")) & 1) != 0)
    {
      v10 = 114;
    }
    else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("UNUSED_115")) & 1) != 0)
    {
      v10 = 115;
    }
    else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("UNUSED_116")) & 1) != 0)
    {
      v10 = 116;
    }
    else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("UNUSED_117")) & 1) != 0)
    {
      v10 = 117;
    }
    else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("UNUSED_118")) & 1) != 0)
    {
      v10 = 118;
    }
    else if (objc_msgSend(v9, "isEqualToString:", CFSTR("UNUSED_119")))
    {
      v10 = 119;
    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_241;
    v10 = objc_msgSend(v8, "intValue");
  }
  objc_msgSend(a1, "setStyle:", v10);
LABEL_241:

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("scale"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12 = v11;
    if ((objc_msgSend(v12, "isEqualToString:", CFSTR("NODPI")) & 1) != 0)
    {
      v13 = 0;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("LODPI")) & 1) != 0)
    {
      v13 = 1;
    }
    else if (objc_msgSend(v12, "isEqualToString:", CFSTR("HIDPI")))
    {
      v13 = 2;
    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_253;
    v13 = objc_msgSend(v11, "intValue");
  }
  objc_msgSend(a1, "setScale:", v13);
LABEL_253:

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("size"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v15 = v14;
    if ((objc_msgSend(v15, "isEqualToString:", CFSTR("PX128")) & 1) != 0)
    {
      v16 = 0;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("PX256")) & 1) != 0)
    {
      v16 = 1;
    }
    else if (objc_msgSend(v15, "isEqualToString:", CFSTR("PX512")))
    {
      v16 = 2;
    }
    else
    {
      v16 = 0;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_265;
    v16 = objc_msgSend(v14, "intValue");
  }
  objc_msgSend(a1, "setSize:", v16);
LABEL_265:

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("version"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setVersion:", objc_msgSend(v17, "unsignedIntValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("timeToLiveSeconds"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setTimeToLiveSeconds:", objc_msgSend(v18, "unsignedIntValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("availableTiles"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v99 = 0u;
    v100 = 0u;
    v97 = 0u;
    v98 = 0u;
    v20 = v19;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v97, v105, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v98;
      do
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v98 != v23)
            objc_enumerationMutation(v20);
          v25 = *(void **)(*((_QWORD *)&v97 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v95 = 0uLL;
            v96 = 0;
            _GEOTileSetRegionFromDictionaryRepresentation(v25, &v95);
            v93 = v95;
            v94 = v96;
            objc_msgSend(a1, "addAvailableTiles:", &v93);
          }
        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v97, v105, 16);
      }
      while (v22);
    }

    v5 = v76;
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("sentinelTile"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v91 = 0u;
    v92 = 0u;
    v89 = 0u;
    v90 = 0u;
    v75 = v26;
    v27 = v26;
    v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v89, v104, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v90;
      do
      {
        for (j = 0; j != v29; ++j)
        {
          if (*(_QWORD *)v90 != v30)
            objc_enumerationMutation(v27);
          v32 = *(_QWORD *)(*((_QWORD *)&v89 + 1) + 8 * j);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v33 = [GEOSentinelTile alloc];
            if ((a3 & 1) != 0)
              v34 = -[GEOSentinelTile initWithJSON:](v33, "initWithJSON:", v32);
            else
              v34 = -[GEOSentinelTile initWithDictionary:](v33, "initWithDictionary:", v32);
            v35 = (void *)v34;
            objc_msgSend(a1, "addSentinelTile:", v34, v75);

          }
        }
        v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v89, v104, 16);
      }
      while (v29);
    }

    v26 = v75;
    v5 = v76;
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("localizationURL"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v37 = (void *)objc_msgSend(v36, "copy");
    objc_msgSend(a1, "setLocalizationURL:", v37);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("supportedLanguage"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v87 = 0u;
    v88 = 0u;
    v85 = 0u;
    v86 = 0u;
    v39 = v38;
    v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v85, v103, 16);
    if (v40)
    {
      v41 = v40;
      v42 = *(_QWORD *)v86;
      do
      {
        for (k = 0; k != v41; ++k)
        {
          if (*(_QWORD *)v86 != v42)
            objc_enumerationMutation(v39);
          v44 = *(void **)(*((_QWORD *)&v85 + 1) + 8 * k);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v45 = (void *)objc_msgSend(v44, "copy");
            objc_msgSend(a1, "addSupportedLanguage:", v45);

          }
        }
        v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v85, v103, 16);
      }
      while (v41);
    }

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("updateBehavior"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v47 = v46;
    if ((objc_msgSend(v47, "isEqualToString:", CFSTR("TILE_UPDATE_BEHAVIOR_FLUSH")) & 1) != 0)
      v48 = 0;
    else
      v48 = objc_msgSend(v47, "isEqualToString:", CFSTR("TILE_UPDATE_BEHAVIOR_ETAG"));

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_315;
    v48 = objc_msgSend(v46, "intValue");
  }
  objc_msgSend(a1, "setUpdateBehavior:", v48, v75);
LABEL_315:

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("countryRegionAllowlist"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v83 = 0u;
    v84 = 0u;
    v81 = 0u;
    v82 = 0u;
    v75 = v49;
    v50 = v49;
    v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v81, v102, 16);
    if (v51)
    {
      v52 = v51;
      v53 = *(_QWORD *)v82;
      do
      {
        for (m = 0; m != v52; ++m)
        {
          if (*(_QWORD *)v82 != v53)
            objc_enumerationMutation(v50);
          v55 = *(_QWORD *)(*((_QWORD *)&v81 + 1) + 8 * m);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v56 = [GEOCountryRegionTuple alloc];
            if ((a3 & 1) != 0)
              v57 = -[GEOCountryRegionTuple initWithJSON:](v56, "initWithJSON:", v55);
            else
              v57 = -[GEOCountryRegionTuple initWithDictionary:](v56, "initWithDictionary:", v55);
            v58 = (void *)v57;
            objc_msgSend(a1, "addCountryRegionAllowlist:", v57, v75);

          }
        }
        v52 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v81, v102, 16);
      }
      while (v52);
    }

    v49 = v75;
    v5 = v76;
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("checksumType"));
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v60 = v59;
    if ((objc_msgSend(v60, "isEqualToString:", CFSTR("CHECKSUM_TYPE_NONE")) & 1) != 0)
      v61 = 0;
    else
      v61 = objc_msgSend(v60, "isEqualToString:", CFSTR("CHECKSUM_TYPE_APPENDED_MD5"));

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_337;
    v61 = objc_msgSend(v59, "intValue");
  }
  objc_msgSend(a1, "setChecksumType:", v61, v75);
LABEL_337:

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("requestStyle"));
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v63 = v62;
    if ((objc_msgSend(v63, "isEqualToString:", CFSTR("REQUEST_STYLE_LEGACY")) & 1) != 0)
      v64 = 0;
    else
      v64 = objc_msgSend(v63, "isEqualToString:", CFSTR("REQUEST_STYLE_HEADER_PARAMS_VERSION_BASED_HMAC_AUTH"));

    goto LABEL_344;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v64 = objc_msgSend(v62, "intValue");
LABEL_344:
    objc_msgSend(a1, "setRequestStyle:", v64, v75);
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("useAuthProxy"));
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setUseAuthProxy:", objc_msgSend(v65, "BOOLValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("deviceSKUAllowlist"));
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v79 = 0u;
    v80 = 0u;
    v77 = 0u;
    v78 = 0u;
    v67 = v66;
    v68 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v77, v101, 16);
    if (v68)
    {
      v69 = v68;
      v70 = *(_QWORD *)v78;
      do
      {
        for (n = 0; n != v69; ++n)
        {
          if (*(_QWORD *)v78 != v70)
            objc_enumerationMutation(v67);
          v72 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * n);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v73 = (void *)objc_msgSend(v72, "copy");
            objc_msgSend(a1, "addDeviceSKUAllowlist:", v73);

          }
        }
        v69 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v77, v101, 16);
      }
      while (v69);
    }

  }
  a1 = a1;

LABEL_359:
  return a1;
}

- (GEOActiveTileSet)initWithJSON:(id)a3
{
  return (GEOActiveTileSet *)-[GEOActiveTileSet _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOActiveTileSetIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOActiveTileSetReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  uint64_t v6;
  unint64_t v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t k;
  __int16 flags;
  NSMutableArray *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t m;
  PBDataReader *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint64_t v43;
  _BYTE v44[128];
  _BYTE v45[128];
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_WORD *)&self->_flags & 0x3FC0) == 0))
  {
    v25 = self->_reader;
    objc_sync_enter(v25);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v26);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v25);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOActiveTileSet readAll:](self, "readAll:", 0);
    if (self->_baseURL)
      PBDataWriterWriteStringField();
    PBDataWriterWriteInt32Field();
    PBDataWriterWriteInt32Field();
    PBDataWriterWriteInt32Field();
    PBDataWriterWriteUint32Field();
    if ((*(_WORD *)&self->_flags & 4) != 0)
      PBDataWriterWriteUint32Field();
    if (self->_availableTilesCount)
    {
      v6 = 0;
      v7 = 0;
      do
      {
        v43 = 0;
        PBDataWriterPlaceMark();
        GEOTileSetRegionWriteTo();
        PBDataWriterRecallMark();
        ++v7;
        v6 += 24;
      }
      while (v7 < self->_availableTilesCount);
    }
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v8 = self->_sentinelTiles;
    v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v40;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v40 != v10)
            objc_enumerationMutation(v8);
          PBDataWriterWriteSubmessage();
        }
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
      }
      while (v9);
    }

    if (self->_localizationURL)
      PBDataWriterWriteStringField();
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v12 = self->_supportedLanguages;
    v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v35, v46, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v36;
      do
      {
        for (j = 0; j != v13; ++j)
        {
          if (*(_QWORD *)v36 != v14)
            objc_enumerationMutation(v12);
          PBDataWriterWriteStringField();
        }
        v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v35, v46, 16);
      }
      while (v13);
    }

    if ((*(_WORD *)&self->_flags & 8) != 0)
      PBDataWriterWriteInt32Field();
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v16 = self->_countryRegionAllowlists;
    v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v31, v45, 16);
    if (v17)
    {
      v18 = *(_QWORD *)v32;
      do
      {
        for (k = 0; k != v17; ++k)
        {
          if (*(_QWORD *)v32 != v18)
            objc_enumerationMutation(v16);
          PBDataWriterWriteSubmessage();
        }
        v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v31, v45, 16);
      }
      while (v17);
    }

    flags = (__int16)self->_flags;
    if ((flags & 1) != 0)
    {
      PBDataWriterWriteInt32Field();
      flags = (__int16)self->_flags;
    }
    if ((flags & 2) != 0)
    {
      PBDataWriterWriteInt32Field();
      flags = (__int16)self->_flags;
    }
    if ((flags & 0x10) != 0)
      PBDataWriterWriteBOOLField();
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v21 = self->_deviceSKUAllowlists;
    v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v27, v44, 16);
    if (v22)
    {
      v23 = *(_QWORD *)v28;
      do
      {
        for (m = 0; m != v22; ++m)
        {
          if (*(_QWORD *)v28 != v23)
            objc_enumerationMutation(v21);
          PBDataWriterWriteStringField();
        }
        v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v27, v44, 16);
      }
      while (v22);
    }

    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v27);
  }

}

- (void)copyTo:(id)a3
{
  id *v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  unint64_t v8;
  unint64_t v9;
  uint64_t j;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t k;
  void *v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t m;
  void *v19;
  __int16 flags;
  unint64_t v21;
  unint64_t v22;
  uint64_t n;
  void *v24;
  _BYTE v25[24];

  v4 = (id *)a3;
  -[GEOActiveTileSet readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v4 + 1, self->_reader);
  *((_DWORD *)v4 + 24) = self->_readerMarkPos;
  *((_DWORD *)v4 + 25) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_baseURL)
    objc_msgSend(v4, "setBaseURL:");
  *((_DWORD *)v4 + 31) = self->_style;
  *((_DWORD *)v4 + 29) = self->_scale;
  *((_DWORD *)v4 + 30) = self->_size;
  *((_DWORD *)v4 + 34) = self->_version;
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    *((_DWORD *)v4 + 32) = self->_timeToLiveSeconds;
    *((_WORD *)v4 + 72) |= 4u;
  }
  if (-[GEOActiveTileSet availableTilesCount](self, "availableTilesCount"))
  {
    objc_msgSend(v4, "clearAvailableTiles");
    v5 = -[GEOActiveTileSet availableTilesCount](self, "availableTilesCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        -[GEOActiveTileSet availableTilesAtIndex:](self, "availableTilesAtIndex:", i);
        objc_msgSend(v4, "addAvailableTiles:", v25);
      }
    }
  }
  if (-[GEOActiveTileSet sentinelTilesCount](self, "sentinelTilesCount"))
  {
    objc_msgSend(v4, "clearSentinelTiles");
    v8 = -[GEOActiveTileSet sentinelTilesCount](self, "sentinelTilesCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
      {
        -[GEOActiveTileSet sentinelTileAtIndex:](self, "sentinelTileAtIndex:", j);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addSentinelTile:", v11);

      }
    }
  }
  if (self->_localizationURL)
    objc_msgSend(v4, "setLocalizationURL:");
  if (-[GEOActiveTileSet supportedLanguagesCount](self, "supportedLanguagesCount"))
  {
    objc_msgSend(v4, "clearSupportedLanguages");
    v12 = -[GEOActiveTileSet supportedLanguagesCount](self, "supportedLanguagesCount");
    if (v12)
    {
      v13 = v12;
      for (k = 0; k != v13; ++k)
      {
        -[GEOActiveTileSet supportedLanguageAtIndex:](self, "supportedLanguageAtIndex:", k);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addSupportedLanguage:", v15);

      }
    }
  }
  if ((*(_WORD *)&self->_flags & 8) != 0)
  {
    *((_DWORD *)v4 + 33) = self->_updateBehavior;
    *((_WORD *)v4 + 72) |= 8u;
  }
  if (-[GEOActiveTileSet countryRegionAllowlistsCount](self, "countryRegionAllowlistsCount"))
  {
    objc_msgSend(v4, "clearCountryRegionAllowlists");
    v16 = -[GEOActiveTileSet countryRegionAllowlistsCount](self, "countryRegionAllowlistsCount");
    if (v16)
    {
      v17 = v16;
      for (m = 0; m != v17; ++m)
      {
        -[GEOActiveTileSet countryRegionAllowlistAtIndex:](self, "countryRegionAllowlistAtIndex:", m);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addCountryRegionAllowlist:", v19);

      }
    }
  }
  flags = (__int16)self->_flags;
  if ((flags & 1) == 0)
  {
    if ((flags & 2) == 0)
      goto LABEL_27;
LABEL_35:
    *((_DWORD *)v4 + 28) = self->_requestStyle;
    *((_WORD *)v4 + 72) |= 2u;
    if ((*(_WORD *)&self->_flags & 0x10) == 0)
      goto LABEL_29;
    goto LABEL_28;
  }
  *((_DWORD *)v4 + 27) = self->_checksumType;
  *((_WORD *)v4 + 72) |= 1u;
  flags = (__int16)self->_flags;
  if ((flags & 2) != 0)
    goto LABEL_35;
LABEL_27:
  if ((flags & 0x10) != 0)
  {
LABEL_28:
    *((_BYTE *)v4 + 140) = self->_useAuthProxy;
    *((_WORD *)v4 + 72) |= 0x10u;
  }
LABEL_29:
  if (-[GEOActiveTileSet deviceSKUAllowlistsCount](self, "deviceSKUAllowlistsCount"))
  {
    objc_msgSend(v4, "clearDeviceSKUAllowlists");
    v21 = -[GEOActiveTileSet deviceSKUAllowlistsCount](self, "deviceSKUAllowlistsCount");
    if (v21)
    {
      v22 = v21;
      for (n = 0; n != v22; ++n)
      {
        -[GEOActiveTileSet deviceSKUAllowlistAtIndex:](self, "deviceSKUAllowlistAtIndex:", n);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addDeviceSKUAllowlist:", v24);

      }
    }
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
  unint64_t availableTilesCount;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  uint64_t v17;
  void *v18;
  NSMutableArray *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  NSMutableArray *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t k;
  void *v28;
  __int16 flags;
  NSMutableArray *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t m;
  void *v34;
  PBUnknownFields *v35;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  _BYTE v54[128];
  _BYTE v55[128];
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x2000) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOActiveTileSetReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_44;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOActiveTileSet readAll:](self, "readAll:", 0);
  v9 = -[NSString copyWithZone:](self->_baseURL, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v9;

  *(_DWORD *)(v5 + 124) = self->_style;
  *(_DWORD *)(v5 + 116) = self->_scale;
  *(_DWORD *)(v5 + 120) = self->_size;
  *(_DWORD *)(v5 + 136) = self->_version;
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    *(_DWORD *)(v5 + 128) = self->_timeToLiveSeconds;
    *(_WORD *)(v5 + 144) |= 4u;
  }
  availableTilesCount = self->_availableTilesCount;
  if (availableTilesCount)
  {
    -[GEOActiveTileSet _reserveAvailableTiles:](v5, availableTilesCount);
    memcpy(*(void **)(v5 + 24), self->_availableTiles, 24 * self->_availableTilesCount);
    *(_QWORD *)(v5 + 32) = self->_availableTilesCount;
  }
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v12 = self->_sentinelTiles;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v49, v56, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v50;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v50 != v14)
          objc_enumerationMutation(v12);
        v16 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v49 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addSentinelTile:", v16);

      }
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v49, v56, 16);
    }
    while (v13);
  }

  v17 = -[NSString copyWithZone:](self->_localizationURL, "copyWithZone:", a3);
  v18 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v17;

  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v19 = self->_supportedLanguages;
  v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v45, v55, 16);
  if (v20)
  {
    v21 = *(_QWORD *)v46;
    do
    {
      for (j = 0; j != v20; ++j)
      {
        if (*(_QWORD *)v46 != v21)
          objc_enumerationMutation(v19);
        v23 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * j), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addSupportedLanguage:", v23);

      }
      v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v45, v55, 16);
    }
    while (v20);
  }

  if ((*(_WORD *)&self->_flags & 8) != 0)
  {
    *(_DWORD *)(v5 + 132) = self->_updateBehavior;
    *(_WORD *)(v5 + 144) |= 8u;
  }
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v24 = self->_countryRegionAllowlists;
  v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v41, v54, 16);
  if (v25)
  {
    v26 = *(_QWORD *)v42;
    do
    {
      for (k = 0; k != v25; ++k)
      {
        if (*(_QWORD *)v42 != v26)
          objc_enumerationMutation(v24);
        v28 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * k), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addCountryRegionAllowlist:", v28);

      }
      v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v41, v54, 16);
    }
    while (v25);
  }

  flags = (__int16)self->_flags;
  if ((flags & 1) == 0)
  {
    if ((flags & 2) == 0)
      goto LABEL_34;
LABEL_46:
    *(_DWORD *)(v5 + 112) = self->_requestStyle;
    *(_WORD *)(v5 + 144) |= 2u;
    if ((*(_WORD *)&self->_flags & 0x10) == 0)
      goto LABEL_36;
    goto LABEL_35;
  }
  *(_DWORD *)(v5 + 108) = self->_checksumType;
  *(_WORD *)(v5 + 144) |= 1u;
  flags = (__int16)self->_flags;
  if ((flags & 2) != 0)
    goto LABEL_46;
LABEL_34:
  if ((flags & 0x10) != 0)
  {
LABEL_35:
    *(_BYTE *)(v5 + 140) = self->_useAuthProxy;
    *(_WORD *)(v5 + 144) |= 0x10u;
  }
LABEL_36:
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v30 = self->_deviceSKUAllowlists;
  v31 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v37, v53, 16);
  if (v31)
  {
    v32 = *(_QWORD *)v38;
    do
    {
      for (m = 0; m != v31; ++m)
      {
        if (*(_QWORD *)v38 != v32)
          objc_enumerationMutation(v30);
        v34 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * m), "copyWithZone:", a3, (_QWORD)v37);
        objc_msgSend((id)v5, "addDeviceSKUAllowlist:", v34);

      }
      v31 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v37, v53, 16);
    }
    while (v31);
  }

  v35 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v35;
LABEL_44:

  return (id)v5;
}

- (unint64_t)hash
{
  unsigned int version;
  uint64_t size;
  uint64_t v5;
  uint64_t v6;
  NSUInteger v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int16 flags;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t scale;
  uint64_t v17;
  uint64_t style;
  uint64_t v19;
  uint64_t v20;
  NSUInteger v21;

  -[GEOActiveTileSet readAll:](self, "readAll:", 1);
  v21 = -[NSString hash](self->_baseURL, "hash");
  if ((*(_WORD *)&self->_flags & 4) != 0)
    v20 = 2654435761 * self->_timeToLiveSeconds;
  else
    v20 = 0;
  version = self->_version;
  scale = self->_scale;
  style = self->_style;
  size = self->_size;
  v5 = PBHashBytes();
  v6 = -[NSMutableArray hash](self->_sentinelTiles, "hash");
  v7 = -[NSString hash](self->_localizationURL, "hash");
  v8 = -[NSMutableArray hash](self->_supportedLanguages, "hash");
  if ((*(_WORD *)&self->_flags & 8) != 0)
    v9 = 2654435761 * self->_updateBehavior;
  else
    v9 = 0;
  v10 = -[NSMutableArray hash](self->_countryRegionAllowlists, "hash", scale, style);
  flags = (__int16)self->_flags;
  if ((flags & 1) == 0)
  {
    v12 = 0;
    if ((flags & 2) != 0)
      goto LABEL_9;
LABEL_12:
    v13 = 0;
    if ((flags & 0x10) != 0)
      goto LABEL_10;
LABEL_13:
    v14 = 0;
    return (2654435761 * v19) ^ v21 ^ (2654435761 * v17) ^ (2654435761 * size) ^ (2654435761 * version) ^ v20 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v12 ^ v13 ^ v14 ^ -[NSMutableArray hash](self->_deviceSKUAllowlists, "hash");
  }
  v12 = 2654435761 * self->_checksumType;
  if ((flags & 2) == 0)
    goto LABEL_12;
LABEL_9:
  v13 = 2654435761 * self->_requestStyle;
  if ((flags & 0x10) == 0)
    goto LABEL_13;
LABEL_10:
  v14 = 2654435761 * self->_useAuthProxy;
  return (2654435761 * v19) ^ v21 ^ (2654435761 * v17) ^ (2654435761 * size) ^ (2654435761 * version) ^ v20 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v12 ^ v13 ^ v14 ^ -[NSMutableArray hash](self->_deviceSKUAllowlists, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t k;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t m;
  __int16 v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t n;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[24];
  _BYTE v46[128];
  _BYTE v47[128];
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  if (*((_QWORD *)v4 + 6))
    -[GEOActiveTileSet setBaseURL:](self, "setBaseURL:");
  self->_style = *((_DWORD *)v4 + 31);
  self->_scale = *((_DWORD *)v4 + 29);
  self->_size = *((_DWORD *)v4 + 30);
  self->_version = *((_DWORD *)v4 + 34);
  if ((*((_BYTE *)v4 + 144) & 4) != 0)
  {
    self->_timeToLiveSeconds = *((_DWORD *)v4 + 32);
    *(_WORD *)&self->_flags |= 4u;
  }
  v5 = objc_msgSend(v4, "availableTilesCount");
  if (v5)
  {
    v6 = v5;
    for (i = 0; i != v6; ++i)
    {
      objc_msgSend(v4, "availableTilesAtIndex:", i);
      -[GEOActiveTileSet addAvailableTiles:](self, "addAvailableTiles:", v45);
    }
  }
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v8 = *((id *)v4 + 10);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v42;
    do
    {
      for (j = 0; j != v10; ++j)
      {
        if (*(_QWORD *)v42 != v11)
          objc_enumerationMutation(v8);
        -[GEOActiveTileSet addSentinelTile:](self, "addSentinelTile:", *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * j));
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
    }
    while (v10);
  }

  if (*((_QWORD *)v4 + 9))
    -[GEOActiveTileSet setLocalizationURL:](self, "setLocalizationURL:");
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v13 = *((id *)v4 + 11);
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v37, v48, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v38;
    do
    {
      for (k = 0; k != v15; ++k)
      {
        if (*(_QWORD *)v38 != v16)
          objc_enumerationMutation(v13);
        -[GEOActiveTileSet addSupportedLanguage:](self, "addSupportedLanguage:", *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * k));
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v37, v48, 16);
    }
    while (v15);
  }

  if ((*((_WORD *)v4 + 72) & 8) != 0)
  {
    self->_updateBehavior = *((_DWORD *)v4 + 33);
    *(_WORD *)&self->_flags |= 8u;
  }
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v18 = *((id *)v4 + 7);
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v33, v47, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v34;
    do
    {
      for (m = 0; m != v20; ++m)
      {
        if (*(_QWORD *)v34 != v21)
          objc_enumerationMutation(v18);
        -[GEOActiveTileSet addCountryRegionAllowlist:](self, "addCountryRegionAllowlist:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * m));
      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v33, v47, 16);
    }
    while (v20);
  }

  v23 = *((_WORD *)v4 + 72);
  if ((v23 & 1) != 0)
  {
    self->_checksumType = *((_DWORD *)v4 + 27);
    *(_WORD *)&self->_flags |= 1u;
    v23 = *((_WORD *)v4 + 72);
    if ((v23 & 2) == 0)
    {
LABEL_35:
      if ((v23 & 0x10) == 0)
        goto LABEL_37;
      goto LABEL_36;
    }
  }
  else if ((v23 & 2) == 0)
  {
    goto LABEL_35;
  }
  self->_requestStyle = *((_DWORD *)v4 + 28);
  *(_WORD *)&self->_flags |= 2u;
  if ((*((_WORD *)v4 + 72) & 0x10) != 0)
  {
LABEL_36:
    self->_useAuthProxy = *((_BYTE *)v4 + 140);
    *(_WORD *)&self->_flags |= 0x10u;
  }
LABEL_37:
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v24 = *((id *)v4 + 8);
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v29, v46, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v30;
    do
    {
      for (n = 0; n != v26; ++n)
      {
        if (*(_QWORD *)v30 != v27)
          objc_enumerationMutation(v24);
        -[GEOActiveTileSet addDeviceSKUAllowlist:](self, "addDeviceSKUAllowlist:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * n), (_QWORD)v29);
      }
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v29, v46, 16);
    }
    while (v26);
  }

}

- (PBUnknownFields)unknownFields
{
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v5;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_WORD *)&self->_flags & 0x20) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      v5 = reader;
      objc_sync_enter(v5);
      GEOActiveTileSetReadSpecified((uint64_t)self, (uint64_t)self->_reader, (int *)&unknownFields_tags_937);
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
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
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

  v3 = a3;
  v27 = *MEMORY[0x1E0C80C00];
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x2020u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEOActiveTileSet readAll:](self, "readAll:", 0);
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v7 = self->_sentinelTiles;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v22;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v22 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v11++), "clearUnknownFields:", 1);
        }
        while (v9 != v11);
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v9);
    }

    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v12 = self->_countryRegionAllowlists;
    v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v18;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v18 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v16++), "clearUnknownFields:", 1, (_QWORD)v17);
        }
        while (v14 != v16);
        v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
      }
      while (v14);
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedLanguages, 0);
  objc_storeStrong((id *)&self->_sentinelTiles, 0);
  objc_storeStrong((id *)&self->_localizationURL, 0);
  objc_storeStrong((id *)&self->_deviceSKUAllowlists, 0);
  objc_storeStrong((id *)&self->_countryRegionAllowlists, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

- (unsigned)minimumZoomLevelForMapPoint:(id)a3
{
  double var1;
  double var0;
  unint64_t v6;
  unint64_t v7;
  GEOTileSetRegion *v8;
  unsigned int v9;
  unsigned int var5;
  unsigned int var2;
  BOOL v12;

  var1 = a3.var1;
  var0 = a3.var0;
  v6 = -[GEOActiveTileSet availableTilesCount](self, "availableTilesCount");
  if (!v6)
    return 0;
  v7 = v6;
  v8 = -[GEOActiveTileSet availableTiles](self, "availableTiles");
  v9 = 100;
  do
  {
    var5 = v8->var5;
    if (var5 <= 1)
      var5 = 1;
    if (var5 >= v8->var2)
      var2 = v8->var2;
    else
      var2 = var5;
    if (var2)
      v12 = var2 >= v9;
    else
      v12 = 1;
    if (!v12 && RegionContainsPoint(&v8->var0, var0, var1))
      v9 = var2;
    ++v8;
    --v7;
  }
  while (v7);
  return v9;
}

- (unsigned)largestZoomLevelLEQ:(unsigned int)a3 inRect:(id)a4
{
  double var1;
  double var0;
  double v6;
  double v7;
  unint64_t v10;
  unint64_t v11;
  GEOTileSetRegion *v12;
  unsigned int v13;
  unsigned int var2;

  var1 = a4.var1.var1;
  var0 = a4.var1.var0;
  v6 = a4.var0.var1;
  v7 = a4.var0.var0;
  v10 = -[GEOActiveTileSet availableTilesCount](self, "availableTilesCount");
  if (!v10)
    return a3;
  v11 = v10;
  v12 = -[GEOActiveTileSet availableTiles](self, "availableTiles");
  v13 = 0;
  do
  {
    if (v12->var5 <= a3
      && v12->var2 >= v13
      && GEOTileSetRegionIntersectsMapRect(&v12->var0, v7, v6, var0, var1))
    {
      var2 = v12->var2;
      v13 = var2 >= a3 ? a3 : v12->var2;
      if (var2 >= a3)
        break;
    }
    ++v12;
    --v11;
  }
  while (v11);
  return v13;
}

- (BOOL)isAvailableForTileKey:(uint64_t)a3
{
  uint64_t v5;
  uint64_t v6;
  unsigned int *v7;
  uint64_t v8;
  uint64_t v9;
  _BOOL8 result;

  v5 = objc_msgSend(a1, "availableTilesCount");
  if (!v5)
    return 1;
  v6 = v5;
  v7 = (unsigned int *)objc_msgSend(a1, "availableTiles");
  v8 = v6 - 1;
  do
  {
    v9 = v8;
    result = GEOTileSetRegionContainsTileKey(v7, a3);
    if (result)
      break;
    v8 = v9 - 1;
    v7 += 6;
  }
  while (v9);
  return result;
}

- (id)dataForGenericTileType:(int)a3 configuration:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[GEOActiveTileSet sentinelTiles](self, "sentinelTiles", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        if (objc_msgSend(v12, "type") == a3)
        {
          GEOResourcesPath(v6);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "resourceName");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "stringByAppendingPathComponent:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v15, "length"))
          {
            objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", v15);
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            goto LABEL_13;
          }

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v9)
        continue;
      break;
    }
  }
  v16 = 0;
LABEL_13:

  return v16;
}

- (BOOL)isDisputedBordersAllowlistedForCountry:(id)a3 region:(id)a4
{
  void *v4;

  -[GEOActiveTileSet _bestCountryRegionAllowlistMatchForCountry:region:](self, "_bestCountryRegionAllowlistMatchForCountry:region:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4 != 0;
}

+ (id)buildDisputedBordersQueryItemsForCountry:(id)a3 region:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("country"), v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v8);

  }
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("region"), v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v9);

  }
  return v7;
}

- (id)disputedBordersOfflineKeySuffixForCountry:(id)a3 region:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  __CFString *v12;
  void *v13;
  uint64_t v14;
  __CFString *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;

  v6 = a3;
  v7 = a4;
  -[GEOActiveTileSet _bestCountryRegionAllowlistMatchForCountry:region:](self, "_bestCountryRegionAllowlistMatchForCountry:region:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    if (objc_msgSend(v8, "hasCountryCode")
      && (objc_msgSend(v9, "countryCode"),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          v11 = objc_msgSend(v10, "length"),
          v10,
          v11))
    {
      v12 = (__CFString *)v6;
    }
    else
    {
      v12 = CFSTR("ZZ");
    }
    if (objc_msgSend(v9, "hasRegion")
      && (objc_msgSend(v9, "region"),
          v13 = (void *)objc_claimAutoreleasedReturnValue(),
          v14 = objc_msgSend(v13, "length"),
          v13,
          v14))
    {
      v15 = (__CFString *)v7;
    }
    else
    {
      v15 = CFSTR("ZZ");
    }
    if (-[__CFString length](v12, "length") || -[__CFString length](v15, "length"))
    {
      v16 = -[__CFString length](v12, "length");
      v17 = -[__CFString length](v15, "length");
      objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCapacity:", v16 + v17 + 2);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "appendString:", v12);
      objc_msgSend(v18, "appendString:", CFSTR("_@"));
      objc_msgSend(v18, "appendString:", v15);
    }
    else
    {
      v18 = 0;
    }

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (BOOL)isEquivalentTileSet:(id)a3
{
  GEOActiveTileSet *v4;
  GEOActiveTileSet *v5;
  int v6;
  int v7;
  int v8;
  unsigned int v9;
  BOOL v10;

  v4 = (GEOActiveTileSet *)a3;
  v5 = v4;
  v10 = 1;
  if (v4 != self)
  {
    if (!v4
      || (v6 = -[GEOActiveTileSet scale](self, "scale"), v6 != -[GEOActiveTileSet scale](v5, "scale"))
      || (v7 = -[GEOActiveTileSet size](self, "size"), v7 != -[GEOActiveTileSet size](v5, "size"))
      || (v8 = -[GEOActiveTileSet style](self, "style"), v8 != -[GEOActiveTileSet style](v5, "style"))
      || (v9 = -[GEOActiveTileSet version](self, "version"), v9 != -[GEOActiveTileSet version](v5, "version")))
    {
      v10 = 0;
    }
  }

  return v10;
}

- (void)_resetBestLanguage
{
  objc_setAssociatedObject(self, &GEOActiveTileSetBestLanguageKey, 0, 0);
}

- (id)initWithTileSet:(int)a3 version:(void *)a4 resourceManifest:
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  _DWORD *v15;
  uint64_t v16;
  _DWORD *v17;
  void *v18;
  uint64_t v19;
  unint64_t i;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  GEOSentinelTile *v26;
  GEOSentinelTile *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  uint64_t v33;
  void *j;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t k;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t m;
  void *v46;
  GEOCountryRegionTuple *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t n;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t ii;
  void *v64;
  NSObject *v65;
  void *v67;
  id v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  objc_super v93;
  _BYTE v94[128];
  _BYTE v95[128];
  _BYTE v96[128];
  _BYTE v97[128];
  uint8_t v98[128];
  uint8_t buf[4];
  void *v100;
  _BYTE v101[128];
  uint64_t v102;

  v102 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a4;
  if (a1
    && (v93.receiver = a1,
        v93.super_class = (Class)GEOActiveTileSet,
        (v9 = objc_msgSendSuper2(&v93, sel_init)) != 0))
  {
    v10 = v9;
    v91 = 0u;
    v92 = 0u;
    v89 = 0u;
    v90 = 0u;
    objc_msgSend(v7, "validVersions");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (id)objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v89, v101, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v90;
      while (2)
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v90 != v13)
            objc_enumerationMutation(v11);
          v15 = *(_DWORD **)(*((_QWORD *)&v89 + 1) + 8 * (_QWORD)v14);
          if (v15)
          {
            if (v15[21] == a3)
            {
              v17 = v15;

              objc_msgSend(v7, "baseURL");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "setBaseURL:", v18);

              objc_msgSend(v10, "setStyle:", objc_msgSend(v7, "style"));
              objc_msgSend(v10, "setScale:", objc_msgSend(v7, "scale"));
              objc_msgSend(v10, "setSize:", objc_msgSend(v7, "size"));
              if (objc_msgSend(v7, "hasUpdateBehavior"))
                objc_msgSend(v10, "setUpdateBehavior:", objc_msgSend(v7, "updateBehavior"));
              if (objc_msgSend(v7, "hasChecksumType"))
                objc_msgSend(v10, "setChecksumType:", objc_msgSend(v7, "checksumType"));
              if (objc_msgSend(v7, "hasRequestStyle"))
                objc_msgSend(v10, "setRequestStyle:", objc_msgSend(v7, "requestStyle"));
              if (objc_msgSend(v7, "hasUseAuthProxy"))
                objc_msgSend(v10, "setUseAuthProxy:", objc_msgSend(v7, "useAuthProxy"));
              v67 = v7;
              objc_msgSend(v10, "setVersion:", v17[21]);
              if ((v17[24] & 2) != 0)
                objc_msgSend(v10, "setTimeToLiveSeconds:", v17[23]);
              -[GEOTileSetVersion _readAvailableTiles]((uint64_t)v17);
              v19 = *((_QWORD *)v17 + 3);
              -[GEOTileSetVersion _readAvailableTiles]((uint64_t)v17);
              objc_msgSend(v10, "setAvailableTiles:count:", v19, *((_QWORD *)v17 + 4));
              -[GEOTileSetVersion _readGenericTiles]((uint64_t)v17);
              v68 = v8;
              if (*((_QWORD *)v17 + 7))
              {
                for (i = 0; i < *((_QWORD *)v17 + 7); ++i)
                {
                  v21 = -[GEOTileSetVersion genericTileAtIndex:]((uint64_t)v17, i);
                  if ((v22 & 0x100000000) != 0)
                  {
                    v23 = v21;
                    v24 = v22;
                    if (objc_msgSend(v8, "resourcesCount") <= (unint64_t)v21)
                    {
                      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Generic tile's resource index %i outside of list length %lu"), v23, objc_msgSend(v8, "resourcesCount"));
                      v53 = (void *)objc_claimAutoreleasedReturnValue();
                      GEOGetResourceManifestLog();
                      v65 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)buf = 138543362;
                        v100 = v53;
                        _os_log_impl(&dword_1885A9000, v65, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
                      }

                      v12 = 0;
                      goto LABEL_85;
                    }
                    objc_msgSend(v8, "resourceAtIndex:", v23);
                    v25 = (void *)objc_claimAutoreleasedReturnValue();
                    v26 = objc_alloc_init(GEOSentinelTile);
                    v27 = v26;
                    if ((v24 & 0x400000000) != 0)
                      v28 = v24;
                    else
                      v28 = 1;
                    -[GEOSentinelTile setType:](v26, "setType:", v28);
                    objc_msgSend(v25, "filename");
                    v29 = (void *)objc_claimAutoreleasedReturnValue();
                    -[GEOSentinelTile setResourceName:](v27, "setResourceName:", v29);

                    objc_msgSend(v10, "addSentinelTile:", v27);
                    v8 = v68;

                  }
                  -[GEOTileSetVersion _readGenericTiles]((uint64_t)v17);
                }
              }
              objc_msgSend(v7, "localizationURL");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "setLocalizationURL:", v30);

              if ((v17[24] & 1) != 0)
              {
                v87 = 0u;
                v88 = 0u;
                v85 = 0u;
                v86 = 0u;
                objc_msgSend(v7, "supportedLanguages");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                v32 = (id)objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v85, v98, 16);
                if (v32)
                {
                  v33 = *(_QWORD *)v86;
                  while (2)
                  {
                    for (j = 0; j != v32; j = (char *)j + 1)
                    {
                      if (*(_QWORD *)v86 != v33)
                        objc_enumerationMutation(v31);
                      v35 = *(void **)(*((_QWORD *)&v85 + 1) + 8 * (_QWORD)j);
                      if (objc_msgSend(v35, "identifier") == v17[22])
                      {
                        v32 = v35;
                        goto LABEL_47;
                      }
                    }
                    v32 = (id)objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v85, v98, 16);
                    if (v32)
                      continue;
                    break;
                  }
                }
LABEL_47:

                v83 = 0u;
                v84 = 0u;
                v81 = 0u;
                v82 = 0u;
                objc_msgSend(v32, "languages");
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v81, v97, 16);
                if (v37)
                {
                  v38 = v37;
                  v39 = *(_QWORD *)v82;
                  do
                  {
                    for (k = 0; k != v38; ++k)
                    {
                      if (*(_QWORD *)v82 != v39)
                        objc_enumerationMutation(v36);
                      objc_msgSend(v10, "addSupportedLanguage:", *(_QWORD *)(*((_QWORD *)&v81 + 1) + 8 * k));
                    }
                    v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v81, v97, 16);
                  }
                  while (v38);
                }

              }
              v79 = 0u;
              v80 = 0u;
              v77 = 0u;
              v78 = 0u;
              objc_msgSend(v7, "countryRegionAllowlists");
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v77, v96, 16);
              if (v42)
              {
                v43 = v42;
                v44 = *(_QWORD *)v78;
                do
                {
                  for (m = 0; m != v43; ++m)
                  {
                    if (*(_QWORD *)v78 != v44)
                      objc_enumerationMutation(v41);
                    v46 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * m);
                    v47 = objc_alloc_init(GEOCountryRegionTuple);
                    objc_msgSend(v46, "copyTo:", v47);
                    -[GEOCountryRegionTuple countryCode](v47, "countryCode");
                    v48 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v48, "uppercaseString");
                    v49 = (void *)objc_claimAutoreleasedReturnValue();
                    -[GEOCountryRegionTuple setCountryCode:](v47, "setCountryCode:", v49);

                    -[GEOCountryRegionTuple region](v47, "region");
                    v50 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v50, "uppercaseString");
                    v51 = (void *)objc_claimAutoreleasedReturnValue();
                    -[GEOCountryRegionTuple setRegion:](v47, "setRegion:", v51);

                    objc_msgSend(v10, "addCountryRegionAllowlist:", v47);
                  }
                  v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v77, v96, 16);
                }
                while (v43);
              }

              _getValue(GeoServicesConfig__debug_TileSetSKURegionsAllowlistOverride, (uint64_t)off_1EDF4DDE8, 1, 0, 0, 0);
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              v53 = v52;
              if (v52)
              {
                v75 = 0uLL;
                v76 = 0uLL;
                v73 = 0uLL;
                v74 = 0uLL;
                v54 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v73, v95, 16);
                v7 = v67;
                if (v54)
                {
                  v55 = v54;
                  v56 = *(_QWORD *)v74;
                  do
                  {
                    for (n = 0; n != v55; ++n)
                    {
                      if (*(_QWORD *)v74 != v56)
                        objc_enumerationMutation(v53);
                      v58 = *(_QWORD *)(*((_QWORD *)&v73 + 1) + 8 * n);
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                        objc_msgSend(v10, "addDeviceSKUAllowlist:", v58);
                    }
                    v55 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v73, v95, 16);
                  }
                  while (v55);
                }
              }
              else
              {
                v71 = 0uLL;
                v72 = 0uLL;
                v69 = 0uLL;
                v70 = 0uLL;
                v7 = v67;
                objc_msgSend(v67, "deviceSKUAllowlists");
                v59 = (void *)objc_claimAutoreleasedReturnValue();
                v60 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v69, v94, 16);
                if (v60)
                {
                  v61 = v60;
                  v62 = *(_QWORD *)v70;
                  do
                  {
                    for (ii = 0; ii != v61; ++ii)
                    {
                      if (*(_QWORD *)v70 != v62)
                        objc_enumerationMutation(v59);
                      objc_msgSend(*(id *)(*((_QWORD *)&v69 + 1) + 8 * ii), "uppercaseString");
                      v64 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v10, "addDeviceSKUAllowlist:", v64);

                    }
                    v61 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v69, v94, 16);
                  }
                  while (v61);
                }

              }
              v12 = v10;
              v8 = v68;
LABEL_85:

              goto LABEL_86;
            }
          }
          else if (!a3)
          {
            v12 = 0;
            goto LABEL_15;
          }
          v14 = (char *)v14 + 1;
        }
        while (v12 != v14);
        v16 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v89, v101, 16);
        v12 = (id)v16;
        if (v16)
          continue;
        break;
      }
    }
LABEL_15:
    v17 = v11;
LABEL_86:

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

@end
