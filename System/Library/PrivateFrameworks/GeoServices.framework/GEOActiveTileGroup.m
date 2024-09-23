@implementation GEOActiveTileGroup

- (BOOL)isRegionalResource:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  char v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "resourceType") != 5 && objc_msgSend(v4, "resourceType") != 6)
  {
LABEL_12:
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    -[GEOActiveTileGroup regionalResources](self, "regionalResources", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v20;
LABEL_14:
      v15 = 0;
      while (1)
      {
        if (*(_QWORD *)v20 != v14)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v15), "resources");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "containsObject:", v4);

        if ((v17 & 1) != 0)
          break;
        if (v13 == ++v15)
        {
          v13 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
          if (v13)
            goto LABEL_14;
          goto LABEL_24;
        }
      }
LABEL_22:
      LOBYTE(v13) = 1;
    }
    goto LABEL_24;
  }
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[GEOActiveTileGroup attributions](self, "attributions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (!v6)
  {
LABEL_11:

    goto LABEL_12;
  }
  v7 = v6;
  v8 = *(_QWORD *)v24;
LABEL_5:
  v9 = 0;
  while (1)
  {
    if (*(_QWORD *)v24 != v8)
      objc_enumerationMutation(v5);
    v10 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v9);
    objc_msgSend(v10, "resources");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "containsObject:", v4);

    if (v12)
      break;
    if (v7 == ++v9)
    {
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      if (v7)
        goto LABEL_5;
      goto LABEL_11;
    }
  }
  if (objc_msgSend(v10, "regionsCount"))
    goto LABEL_22;
  LOBYTE(v13) = objc_msgSend(v4, "regionsCount") != 0;
LABEL_24:

  return v13;
}

- (NSMutableArray)regionalResources
{
  -[GEOActiveTileGroup _readRegionalResources]((uint64_t)self);
  return self->_regionalResources;
}

- (id)regionalResourceAtIndex:(unint64_t)a3
{
  -[GEOActiveTileGroup _readRegionalResources]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_regionalResources, "objectAtIndex:", a3);
}

- (unint64_t)regionalResourcesCount
{
  -[GEOActiveTileGroup _readRegionalResources]((uint64_t)self);
  return -[NSMutableArray count](self->_regionalResources, "count");
}

- (void)_readRegionalResources
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(_QWORD *)(a1 + 632) & 0x1000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOActiveTileGroupReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRegionalResources_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (GEOActiveTileGroup)initWithData:(id)a3
{
  GEOActiveTileGroup *v3;
  GEOActiveTileGroup *v4;
  GEOActiveTileGroup *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOActiveTileGroup;
  v3 = -[GEOActiveTileGroup initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (GEOURLInfoSet)urlInfoSet
{
  -[GEOActiveTileGroup _readUrlInfoSet]((uint64_t)self);
  return self->_urlInfoSet;
}

- (void)_readUrlInfoSet
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(_BYTE *)(a1 + 640) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOActiveTileGroupReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readUrlInfoSet_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (id)languageForTileKey:(void *)a1
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "activeTileSetForKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "bestLanguageWithOverrideLocale:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)activeTileSetForKey:(uint64_t)a3
{
  int v4;
  unsigned __int16 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  unsigned int v10;
  unsigned int v12;

  if (a3)
  {
    v4 = *(_BYTE *)a3 & 0x7F;
    if (v4 == 16)
    {
      v10 = *(_DWORD *)(a3 + 9);
      v6 = ((*(_QWORD *)(a3 + 1) >> 61) | (8 * v10)) & 0x3FFF;
      v7 = (v10 >> 11) & 0xF;
      v8 = (v10 >> 15) & 0xF;
      goto LABEL_8;
    }
    if (v4 == 2)
    {
      v5 = *(unsigned __int8 *)(a3 + 15);
      v6 = *(unsigned __int16 *)(a3 + 13) >> 2;
      v7 = v5 & 0xF;
      v8 = v5 >> 4;
LABEL_8:
      objc_msgSend(a1, "activeTileSetForStyle:size:scale:", v6, v7, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      return v9;
    }
    v12 = 0;
    if (GEOTileKeyStyle(a3, &v12))
    {
      objc_msgSend(a1, "activeTileSetForStyle:", v12);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (id)activeTileSetForStyle:(int)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[GEOActiveTileGroup tileSets](self, "tileSets", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v9, "style") == a3)
        {
          v10 = v9;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (id)activeTileSetForTileType:(int)a3 scale:(int)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  id v13;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[GEOActiveTileGroup tileSets](self, "tileSets", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v12, "style") == a3)
        {
          if (objc_msgSend(v12, "scale") == a4)
          {
            v14 = v12;

            v9 = v14;
            goto LABEL_15;
          }
          if (!objc_msgSend(v12, "scale"))
          {
            v13 = v12;

            v9 = v13;
          }
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v8)
        continue;
      break;
    }
  }
  else
  {
    v9 = 0;
  }
LABEL_15:

  return v9;
}

- (id)activeTileSetForStyle:(int)a3 size:(int)a4 scale:(int)a5
{
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[GEOActiveTileGroup tileSets](self, "tileSets", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v13, "style") == a3
          && objc_msgSend(v13, "size") == a4
          && objc_msgSend(v13, "scale") == a5)
        {
          v14 = v13;
          goto LABEL_13;
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v10)
        continue;
      break;
    }
  }
  v14 = 0;
LABEL_13:

  return v14;
}

- (NSMutableArray)tileSets
{
  -[GEOActiveTileGroup _readTileSets]((uint64_t)self);
  return self->_tileSets;
}

- (void)_readTileSets
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(_QWORD *)(a1 + 632) & 0x8000000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOActiveTileGroupReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTileSets_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (NSMutableArray)attributions
{
  -[GEOActiveTileGroup _readAttributions]((uint64_t)self);
  return self->_attributions;
}

- (id)attributionAtIndex:(unint64_t)a3
{
  -[GEOActiveTileGroup _readAttributions]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_attributions, "objectAtIndex:", a3);
}

- (unint64_t)attributionsCount
{
  -[GEOActiveTileGroup _readAttributions]((uint64_t)self);
  return -[NSMutableArray count](self->_attributions, "count");
}

- (void)_readAttributions
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(_QWORD *)(a1 + 632) & 0x1000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOActiveTileGroupReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAttributions_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (void)_setNoFlagsRegionalResourceCanonicalNameToFileNameValue:(void *)a3 forKey:
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  if (a1)
  {
    v6 = *(void **)(a1 + 400);
    if (!v6)
    {
      v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v8 = *(void **)(a1 + 400);
      *(_QWORD *)(a1 + 400) = v7;

      v6 = *(void **)(a1 + 400);
    }
    objc_msgSend(v6, "setObject:forKey:", v9, v5);
  }

}

- (void)_addNoFlagsRegionalResource:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 432);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 432);
      *(_QWORD *)(a1 + 432) = v5;

      v4 = *(void **)(a1 + 432);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (void)_addNoFlagsTileSet:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 552);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 552);
      *(_QWORD *)(a1 + 552) = v5;

      v4 = *(void **)(a1 + 552);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (void)_setNoFlagsResourceCanonicalNameToFileNameValue:(void *)a3 forKey:
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  if (a1)
  {
    v6 = *(void **)(a1 + 456);
    if (!v6)
    {
      v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v8 = *(void **)(a1 + 456);
      *(_QWORD *)(a1 + 456) = v7;

      v6 = *(void **)(a1 + 456);
    }
    objc_msgSend(v6, "setObject:forKey:", v9, v5);
  }

}

- (void)_addNoFlagsActiveResource:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 104);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 104);
      *(_QWORD *)(a1 + 104) = v5;

      v4 = *(void **)(a1 + 104);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (void)_addNoFlagsAnnouncementsSupportedLanguages:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 128);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 128);
      *(_QWORD *)(a1 + 128) = v5;

      v4 = *(void **)(a1 + 128);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (void)_addNoFlagsMuninBucket:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 328);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 328);
      *(_QWORD *)(a1 + 328) = v5;

      v4 = *(void **)(a1 + 328);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (void)_addNoFlagsAttribution:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 144);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 144);
      *(_QWORD *)(a1 + 144) = v5;

      v4 = *(void **)(a1 + 144);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (void)_addNoFlagsExplicitResource:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 248);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 248);
      *(_QWORD *)(a1 + 248) = v5;

      v4 = *(void **)(a1 + 248);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (void)_addNoFlagsDisplayStrings:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 224);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 224);
      *(_QWORD *)(a1 + 224) = v5;

      v4 = *(void **)(a1 + 224);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unsigned)identifier
{
  return self->_identifier;
}

- (BOOL)readFrom:(id)a3
{
  return GEOActiveTileGroupReadAllFrom((uint64_t)self, a3, 0);
}

- (BOOL)isMuninEnabled
{
  unint64_t v3;
  void *v4;
  BOOL v5;

  v3 = -[GEOActiveTileGroup muninBucketsCount](self, "muninBucketsCount");
  -[GEOActiveTileGroup activeTileSetForStyle:](self, "activeTileSetForStyle:", 57);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v5 = v4 == 0;
  else
    v5 = 1;
  return !v5;
}

- (unint64_t)muninBucketsCount
{
  -[GEOActiveTileGroup _readMuninBuckets]((uint64_t)self);
  return -[NSMutableArray count](self->_muninBuckets, "count");
}

- (void)_readMuninBuckets
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(_QWORD *)(a1 + 632) & 0x800000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOActiveTileGroupReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMuninBuckets_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (uint64_t)versionForTileKey:(void *)a1
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "activeTileSetForKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "version");

  return v2;
}

- (id)languageForTileKey:(uint64_t)a3 overrideLocale:(void *)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  objc_msgSend(a1, "activeTileSetForKey:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bestLanguageWithOverrideLocale:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (unint64_t)activeScenariosCount
{
  -[GEOActiveTileGroup _readActiveScenarios]((uint64_t)self);
  return self->_activeScenarios.count;
}

- (void)_readActiveScenarios
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(_QWORD *)(a1 + 632) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOActiveTileGroupReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readActiveScenarios_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (unint64_t)activeScalesCount
{
  -[GEOActiveTileGroup _readActiveScales]((uint64_t)self);
  return self->_activeScales.count;
}

- (void)_readActiveScales
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(_QWORD *)(a1 + 632) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOActiveTileGroupReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readActiveScales_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (NSString)uniqueIdentifier
{
  -[GEOActiveTileGroup _readUniqueIdentifier]((uint64_t)self);
  return self->_uniqueIdentifier;
}

- (unint64_t)staleResourcesCount
{
  -[GEOActiveTileGroup _readStaleResources]((uint64_t)self);
  return -[NSMutableArray count](self->_staleResources, "count");
}

- (unsigned)modelVersion
{
  return self->_modelVersion;
}

- (GEODataSetDescription)dataSet
{
  -[GEOActiveTileGroup _readDataSet]((uint64_t)self);
  return self->_dataSet;
}

- (int)activeScenarioAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_activeScenarios;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEOActiveTileGroup _readActiveScenarios]((uint64_t)self);
  p_activeScenarios = &self->_activeScenarios;
  count = self->_activeScenarios.count;
  if (count <= a3)
  {
    v7 = (void *)MEMORY[0x1E0C99DA0];
    v8 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "exceptionWithName:reason:userInfo:", v8, v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "raise");

  }
  return p_activeScenarios->list[a3];
}

- (int)activeScaleAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_activeScales;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEOActiveTileGroup _readActiveScales]((uint64_t)self);
  p_activeScales = &self->_activeScales;
  count = self->_activeScales.count;
  if (count <= a3)
  {
    v7 = (void *)MEMORY[0x1E0C99DA0];
    v8 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "exceptionWithName:reason:userInfo:", v8, v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "raise");

  }
  return p_activeScales->list[a3];
}

- (void)_readUniqueIdentifier
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(_BYTE *)(a1 + 640) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOActiveTileGroupReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readUniqueIdentifier_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (void)_readStaleResources
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(_QWORD *)(a1 + 632) & 0x400000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOActiveTileGroupReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readStaleResources_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (void)_readDataSet
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(_QWORD *)(a1 + 632) & 0x80000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOActiveTileGroupReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDataSet_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (NSMutableDictionary)resourceCanonicalNameToFileName
{
  -[GEOActiveTileGroup _readResourceCanonicalNameToFileName]((uint64_t)self);
  return self->_resourceCanonicalNameToFileName;
}

- (void)_readResourceCanonicalNameToFileName
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(_QWORD *)(a1 + 632) & 0x8000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOActiveTileGroupReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readResourceCanonicalNameToFileName_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (NSMutableDictionary)regionalResourceCanonicalNameToFileName
{
  -[GEOActiveTileGroup _readRegionalResourceCanonicalNameToFileName]((uint64_t)self);
  return self->_regionalResourceCanonicalNameToFileName;
}

- (void)_readRegionalResourceCanonicalNameToFileName
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(_QWORD *)(a1 + 632) & 0x100000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOActiveTileGroupReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRegionalResourceCanonicalNameToFileName_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (void)dealloc
{
  objc_super v3;

  -[GEOActiveTileGroup clearHybridUnavailableRegions](self, "clearHybridUnavailableRegions");
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOActiveTileGroup;
  -[GEOActiveTileGroup dealloc](&v3, sel_dealloc);
}

- (void)clearHybridUnavailableRegions
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x20uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((_BYTE *)&self->_flags + 8) |= 0x40u;
  self->_hybridUnavailableRegionsSpace = 0;
  self->_hybridUnavailableRegionsCount = 0;
  free(self->_hybridUnavailableRegions);
  self->_hybridUnavailableRegions = 0;
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
      v8 = (int *)&readAll__recursiveTag_25;
    else
      v8 = (int *)&readAll__nonRecursiveTag_25;
    GEOActiveTileGroupReadSpecified((uint64_t)self, (uint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEOActiveTileGroupCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  os_unfair_lock_unlock(p_readerLock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xmls, 0);
  objc_storeStrong((id *)&self->_xmlChecksums, 0);
  objc_storeStrong((id *)&self->_wifiConnectionQualityProbeURLLegacy, 0);
  objc_storeStrong((id *)&self->_versionManifest, 0);
  objc_storeStrong((id *)&self->_urlInfoSet, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_tileSets, 0);
  objc_storeStrong((id *)&self->_textures, 0);
  objc_storeStrong((id *)&self->_textureChecksums, 0);
  objc_storeStrong((id *)&self->_styleSheets, 0);
  objc_storeStrong((id *)&self->_styleSheetChecksums, 0);
  objc_storeStrong((id *)&self->_staleResources, 0);
  objc_storeStrong((id *)&self->_spatialLookupURLLegacy, 0);
  objc_storeStrong((id *)&self->_simpleETAURLLegacy, 0);
  objc_storeStrong((id *)&self->_searchAttributionManifestURLLegacy, 0);
  objc_storeStrong((id *)&self->_reverseGeocoderVersionsURLLegacy, 0);
  objc_storeStrong((id *)&self->_resources, 0);
  objc_storeStrong((id *)&self->_resourcesURLLegacy, 0);
  objc_storeStrong((id *)&self->_resourceCanonicalNameToFileName, 0);
  objc_storeStrong((id *)&self->_reserved, 0);
  objc_storeStrong((id *)&self->_releaseInfo, 0);
  objc_storeStrong((id *)&self->_regionalResources, 0);
  objc_storeStrong((id *)&self->_regionalResourcesURLLegacy, 0);
  objc_storeStrong((id *)&self->_regionalResourceTiles, 0);
  objc_storeStrong((id *)&self->_regionalResourceRegions, 0);
  objc_storeStrong((id *)&self->_regionalResourceCanonicalNameToFileName, 0);
  objc_storeStrong((id *)&self->_realtimeTrafficProbeURLLegacy, 0);
  objc_storeStrong((id *)&self->_problemSubmissionURLLegacy, 0);
  objc_storeStrong((id *)&self->_problemStatusURLLegacy, 0);
  objc_storeStrong((id *)&self->_problemOptInURLLegacy, 0);
  objc_storeStrong((id *)&self->_problemCategoriesURLLegacy, 0);
  objc_storeStrong((id *)&self->_proactiveRoutingURLLegacy, 0);
  objc_storeStrong((id *)&self->_polyLocationShiftURLLegacy, 0);
  objc_storeStrong((id *)&self->_offlineMetadata, 0);
  objc_storeStrong((id *)&self->_muninBuckets, 0);
  objc_storeStrong((id *)&self->_muninBaseURL, 0);
  objc_storeStrong((id *)&self->_logMessageUsageV3URLLegacy, 0);
  objc_storeStrong((id *)&self->_logMessageUsageURLLegacy, 0);
  objc_storeStrong((id *)&self->_locationShiftEnabledRegions, 0);
  objc_storeStrong((id *)&self->_icons, 0);
  objc_storeStrong((id *)&self->_iconChecksums, 0);
  objc_storeStrong((id *)&self->_fonts, 0);
  objc_storeStrong((id *)&self->_fontChecksums, 0);
  objc_storeStrong((id *)&self->_flyoverRegionVersions, 0);
  objc_storeStrong((id *)&self->_explicitResources, 0);
  objc_storeStrong((id *)&self->_etaURLLegacy, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_displayStrings, 0);
  objc_storeStrong((id *)&self->_dispatcherURLLegacy, 0);
  objc_storeStrong((id *)&self->_directionsURLLegacy, 0);
  objc_storeStrong((id *)&self->_dataSet, 0);
  objc_storeStrong((id *)&self->_businessPortalBaseURLLegacy, 0);
  objc_storeStrong((id *)&self->_bluePOIURLLegacy, 0);
  objc_storeStrong((id *)&self->_batchTrafficProbeURLLegacy, 0);
  objc_storeStrong((id *)&self->_batchReverseGeocoderURLLegacy, 0);
  objc_storeStrong((id *)&self->_backgroundRevGeoURLLegacy, 0);
  objc_storeStrong((id *)&self->_backgroundDispatcherURLLegacy, 0);
  objc_storeStrong((id *)&self->_attributions, 0);
  objc_storeStrong((id *)&self->_announcementsURLLegacy, 0);
  objc_storeStrong((id *)&self->_announcementsSupportedLanguages, 0);
  objc_storeStrong((id *)&self->_addressCorrectionUpdateURLLegacy, 0);
  objc_storeStrong((id *)&self->_addressCorrectionInitURLLegacy, 0);
  objc_storeStrong((id *)&self->_activeResources, 0);
  objc_storeStrong((id *)&self->_abExperimentURLLegacy, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

- (GEOVersionManifest)versionManifest
{
  -[GEOActiveTileGroup _readVersionManifest]((uint64_t)self);
  return self->_versionManifest;
}

- (void)_readVersionManifest
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(_BYTE *)(a1 + 640) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOActiveTileGroupReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readVersionManifest_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (GEOActiveTileGroup)init
{
  GEOActiveTileGroup *v2;
  GEOActiveTileGroup *v3;
  GEOActiveTileGroup *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOActiveTileGroup;
  v2 = -[GEOActiveTileGroup init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (void)setIdentifier:(unsigned int)a3
{
  *((_BYTE *)&self->_flags + 8) |= 0x40u;
  self->_identifier = a3;
}

- (void)setTileSets:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *tileSets;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x8000000000000000;
  os_unfair_lock_unlock(&self->_readerLock);
  *((_BYTE *)&self->_flags + 8) |= 0x40u;
  tileSets = self->_tileSets;
  self->_tileSets = v4;

}

- (void)clearTileSets
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x8000000000000000;
  os_unfair_lock_unlock(p_readerLock);
  *((_BYTE *)&self->_flags + 8) |= 0x40u;
  -[NSMutableArray removeAllObjects](self->_tileSets, "removeAllObjects");
}

- (void)addTileSet:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;

  v4 = a3;
  -[GEOActiveTileGroup _readTileSets]((uint64_t)self);
  -[GEOActiveTileGroup _addNoFlagsTileSet:]((uint64_t)self, v4);

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  self = (GEOActiveTileGroup *)((char *)self + 632);
  self->super.super.isa = (Class)((unint64_t)self->super.super.isa | 0x8000000000000000);
  os_unfair_lock_unlock(p_readerLock);
  LOBYTE(self->_reader) |= 0x40u;
}

- (unint64_t)tileSetsCount
{
  -[GEOActiveTileGroup _readTileSets]((uint64_t)self);
  return -[NSMutableArray count](self->_tileSets, "count");
}

- (id)tileSetAtIndex:(unint64_t)a3
{
  -[GEOActiveTileGroup _readTileSets]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_tileSets, "objectAtIndex:", a3);
}

+ (Class)tileSetType
{
  return (Class)objc_opt_class();
}

- (void)_readResources
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(_QWORD *)(a1 + 632) & 0x20000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOActiveTileGroupReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readResources_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (NSMutableArray)resources
{
  -[GEOActiveTileGroup _readResources]((uint64_t)self);
  return self->_resources;
}

- (void)setResources:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *resources;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x20000000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *((_BYTE *)&self->_flags + 8) |= 0x40u;
  resources = self->_resources;
  self->_resources = v4;

}

- (void)clearResources
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x20000000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((_BYTE *)&self->_flags + 8) |= 0x40u;
  -[NSMutableArray removeAllObjects](self->_resources, "removeAllObjects");
}

- (void)addResource:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;

  v4 = a3;
  -[GEOActiveTileGroup _readResources]((uint64_t)self);
  -[GEOActiveTileGroup _addNoFlagsResource:]((uint64_t)self, v4);

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  self = (GEOActiveTileGroup *)((char *)self + 632);
  self->super.super.isa = (Class)((unint64_t)self->super.super.isa | 0x20000000000000);
  os_unfair_lock_unlock(p_readerLock);
  LOBYTE(self->_reader) |= 0x40u;
}

- (void)_addNoFlagsResource:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 472);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 472);
      *(_QWORD *)(a1 + 472) = v5;

      v4 = *(void **)(a1 + 472);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)resourcesCount
{
  -[GEOActiveTileGroup _readResources]((uint64_t)self);
  return -[NSMutableArray count](self->_resources, "count");
}

- (id)resourceAtIndex:(unint64_t)a3
{
  -[GEOActiveTileGroup _readResources]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_resources, "objectAtIndex:", a3);
}

+ (Class)resourceType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasUniqueIdentifier
{
  -[GEOActiveTileGroup _readUniqueIdentifier]((uint64_t)self);
  return self->_uniqueIdentifier != 0;
}

- (void)setUniqueIdentifier:(id)a3
{
  *((_BYTE *)&self->_flags + 8) |= 0x41u;
  objc_storeStrong((id *)&self->_uniqueIdentifier, a3);
}

- (void)setAttributions:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *attributions;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x1000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *((_BYTE *)&self->_flags + 8) |= 0x40u;
  attributions = self->_attributions;
  self->_attributions = v4;

}

- (void)clearAttributions
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x1000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((_BYTE *)&self->_flags + 8) |= 0x40u;
  -[NSMutableArray removeAllObjects](self->_attributions, "removeAllObjects");
}

- (void)addAttribution:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;

  v4 = a3;
  -[GEOActiveTileGroup _readAttributions]((uint64_t)self);
  -[GEOActiveTileGroup _addNoFlagsAttribution:]((uint64_t)self, v4);

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  self = (GEOActiveTileGroup *)((char *)self + 632);
  self->super.super.isa = (Class)((unint64_t)self->super.super.isa | 0x1000);
  os_unfair_lock_unlock(p_readerLock);
  LOBYTE(self->_reader) |= 0x40u;
}

+ (Class)attributionType
{
  return (Class)objc_opt_class();
}

- (void)_readRegionalResourceTiles
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(_QWORD *)(a1 + 632) & 0x400000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOActiveTileGroupReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRegionalResourceTiles_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (NSMutableArray)regionalResourceTiles
{
  -[GEOActiveTileGroup _readRegionalResourceTiles]((uint64_t)self);
  return self->_regionalResourceTiles;
}

- (void)setRegionalResourceTiles:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *regionalResourceTiles;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x400000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *((_BYTE *)&self->_flags + 8) |= 0x40u;
  regionalResourceTiles = self->_regionalResourceTiles;
  self->_regionalResourceTiles = v4;

}

- (void)clearRegionalResourceTiles
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x400000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((_BYTE *)&self->_flags + 8) |= 0x40u;
  -[NSMutableArray removeAllObjects](self->_regionalResourceTiles, "removeAllObjects");
}

- (void)addRegionalResourceTile:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;

  v4 = a3;
  -[GEOActiveTileGroup _readRegionalResourceTiles]((uint64_t)self);
  -[GEOActiveTileGroup _addNoFlagsRegionalResourceTile:]((uint64_t)self, v4);

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  self = (GEOActiveTileGroup *)((char *)self + 632);
  self->super.super.isa = (Class)((unint64_t)self->super.super.isa | 0x400000000000);
  os_unfair_lock_unlock(p_readerLock);
  LOBYTE(self->_reader) |= 0x40u;
}

- (void)_addNoFlagsRegionalResourceTile:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 416);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 416);
      *(_QWORD *)(a1 + 416) = v5;

      v4 = *(void **)(a1 + 416);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)regionalResourceTilesCount
{
  -[GEOActiveTileGroup _readRegionalResourceTiles]((uint64_t)self);
  return -[NSMutableArray count](self->_regionalResourceTiles, "count");
}

- (id)regionalResourceTileAtIndex:(unint64_t)a3
{
  -[GEOActiveTileGroup _readRegionalResourceTiles]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_regionalResourceTiles, "objectAtIndex:", a3);
}

+ (Class)regionalResourceTileType
{
  return (Class)objc_opt_class();
}

- (void)_readRegionalResourceRegions
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(_QWORD *)(a1 + 632) & 0x200000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOActiveTileGroupReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRegionalResourceRegions_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (NSMutableArray)regionalResourceRegions
{
  -[GEOActiveTileGroup _readRegionalResourceRegions]((uint64_t)self);
  return self->_regionalResourceRegions;
}

- (void)setRegionalResourceRegions:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *regionalResourceRegions;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x200000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *((_BYTE *)&self->_flags + 8) |= 0x40u;
  regionalResourceRegions = self->_regionalResourceRegions;
  self->_regionalResourceRegions = v4;

}

- (void)clearRegionalResourceRegions
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x200000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((_BYTE *)&self->_flags + 8) |= 0x40u;
  -[NSMutableArray removeAllObjects](self->_regionalResourceRegions, "removeAllObjects");
}

- (void)addRegionalResourceRegion:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;

  v4 = a3;
  -[GEOActiveTileGroup _readRegionalResourceRegions]((uint64_t)self);
  -[GEOActiveTileGroup _addNoFlagsRegionalResourceRegion:]((uint64_t)self, v4);

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  self = (GEOActiveTileGroup *)((char *)self + 632);
  self->super.super.isa = (Class)((unint64_t)self->super.super.isa | 0x200000000000);
  os_unfair_lock_unlock(p_readerLock);
  LOBYTE(self->_reader) |= 0x40u;
}

- (void)_addNoFlagsRegionalResourceRegion:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 408);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 408);
      *(_QWORD *)(a1 + 408) = v5;

      v4 = *(void **)(a1 + 408);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)regionalResourceRegionsCount
{
  -[GEOActiveTileGroup _readRegionalResourceRegions]((uint64_t)self);
  return -[NSMutableArray count](self->_regionalResourceRegions, "count");
}

- (id)regionalResourceRegionAtIndex:(unint64_t)a3
{
  -[GEOActiveTileGroup _readRegionalResourceRegions]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_regionalResourceRegions, "objectAtIndex:", a3);
}

+ (Class)regionalResourceRegionType
{
  return (Class)objc_opt_class();
}

- (void)_readRegionalResourcesURLLegacy
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(_QWORD *)(a1 + 632) & 0x800000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOActiveTileGroupReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRegionalResourcesURLLegacy_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (BOOL)hasRegionalResourcesURLLegacy
{
  -[GEOActiveTileGroup _readRegionalResourcesURLLegacy]((uint64_t)self);
  return self->_regionalResourcesURLLegacy != 0;
}

- (NSString)regionalResourcesURLLegacy
{
  -[GEOActiveTileGroup _readRegionalResourcesURLLegacy]((uint64_t)self);
  return self->_regionalResourcesURLLegacy;
}

- (void)setRegionalResourcesURLLegacy:(id)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 0x40;
  *(_QWORD *)&self->_flags |= 0x800000000000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_regionalResourcesURLLegacy, a3);
}

- (void)_readSearchAttributionManifestURLLegacy
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(_QWORD *)(a1 + 632) & 0x80000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOActiveTileGroupReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSearchAttributionManifestURLLegacy_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (BOOL)hasSearchAttributionManifestURLLegacy
{
  -[GEOActiveTileGroup _readSearchAttributionManifestURLLegacy]((uint64_t)self);
  return self->_searchAttributionManifestURLLegacy != 0;
}

- (NSString)searchAttributionManifestURLLegacy
{
  -[GEOActiveTileGroup _readSearchAttributionManifestURLLegacy]((uint64_t)self);
  return self->_searchAttributionManifestURLLegacy;
}

- (void)setSearchAttributionManifestURLLegacy:(id)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 0x40;
  *(_QWORD *)&self->_flags |= 0x80000000000000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_searchAttributionManifestURLLegacy, a3);
}

- (void)_readDirectionsURLLegacy
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(_QWORD *)(a1 + 632) & 0x100000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOActiveTileGroupReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDirectionsURLLegacy_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (BOOL)hasDirectionsURLLegacy
{
  -[GEOActiveTileGroup _readDirectionsURLLegacy]((uint64_t)self);
  return self->_directionsURLLegacy != 0;
}

- (NSString)directionsURLLegacy
{
  -[GEOActiveTileGroup _readDirectionsURLLegacy]((uint64_t)self);
  return self->_directionsURLLegacy;
}

- (void)setDirectionsURLLegacy:(id)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 0x40;
  *(_QWORD *)&self->_flags |= 0x100000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_directionsURLLegacy, a3);
}

- (void)_readEtaURLLegacy
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(_QWORD *)(a1 + 632) & 0x1000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOActiveTileGroupReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readEtaURLLegacy_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (BOOL)hasEtaURLLegacy
{
  -[GEOActiveTileGroup _readEtaURLLegacy]((uint64_t)self);
  return self->_etaURLLegacy != 0;
}

- (NSString)etaURLLegacy
{
  -[GEOActiveTileGroup _readEtaURLLegacy]((uint64_t)self);
  return self->_etaURLLegacy;
}

- (void)setEtaURLLegacy:(id)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 0x40;
  *(_QWORD *)&self->_flags |= 0x1000000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_etaURLLegacy, a3);
}

- (void)_readBatchReverseGeocoderURLLegacy
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(_QWORD *)(a1 + 632) & 0x8000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOActiveTileGroupReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readBatchReverseGeocoderURLLegacy_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (BOOL)hasBatchReverseGeocoderURLLegacy
{
  -[GEOActiveTileGroup _readBatchReverseGeocoderURLLegacy]((uint64_t)self);
  return self->_batchReverseGeocoderURLLegacy != 0;
}

- (NSString)batchReverseGeocoderURLLegacy
{
  -[GEOActiveTileGroup _readBatchReverseGeocoderURLLegacy]((uint64_t)self);
  return self->_batchReverseGeocoderURLLegacy;
}

- (void)setBatchReverseGeocoderURLLegacy:(id)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 0x40;
  *(_QWORD *)&self->_flags |= 0x8000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_batchReverseGeocoderURLLegacy, a3);
}

- (void)_readReleaseInfo
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(_QWORD *)(a1 + 632) & 0x2000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOActiveTileGroupReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readReleaseInfo_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (BOOL)hasReleaseInfo
{
  -[GEOActiveTileGroup _readReleaseInfo]((uint64_t)self);
  return self->_releaseInfo != 0;
}

- (NSString)releaseInfo
{
  -[GEOActiveTileGroup _readReleaseInfo]((uint64_t)self);
  return self->_releaseInfo;
}

- (void)setReleaseInfo:(id)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 0x40;
  *(_QWORD *)&self->_flags |= 0x2000000000000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_releaseInfo, a3);
}

- (void)_readResourcesURLLegacy
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(_QWORD *)(a1 + 632) & 0x10000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOActiveTileGroupReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readResourcesURLLegacy_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (BOOL)hasResourcesURLLegacy
{
  -[GEOActiveTileGroup _readResourcesURLLegacy]((uint64_t)self);
  return self->_resourcesURLLegacy != 0;
}

- (NSString)resourcesURLLegacy
{
  -[GEOActiveTileGroup _readResourcesURLLegacy]((uint64_t)self);
  return self->_resourcesURLLegacy;
}

- (void)setResourcesURLLegacy:(id)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 0x40;
  *(_QWORD *)&self->_flags |= 0x10000000000000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_resourcesURLLegacy, a3);
}

- (void)_readSimpleETAURLLegacy
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(_QWORD *)(a1 + 632) & 0x100000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOActiveTileGroupReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSimpleETAURLLegacy_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (BOOL)hasSimpleETAURLLegacy
{
  -[GEOActiveTileGroup _readSimpleETAURLLegacy]((uint64_t)self);
  return self->_simpleETAURLLegacy != 0;
}

- (NSString)simpleETAURLLegacy
{
  -[GEOActiveTileGroup _readSimpleETAURLLegacy]((uint64_t)self);
  return self->_simpleETAURLLegacy;
}

- (void)setSimpleETAURLLegacy:(id)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 0x40;
  *(_QWORD *)&self->_flags |= 0x100000000000000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_simpleETAURLLegacy, a3);
}

- (void)_readAddressCorrectionInitURLLegacy
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(_QWORD *)(a1 + 632) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOActiveTileGroupReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAddressCorrectionInitURLLegacy_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (BOOL)hasAddressCorrectionInitURLLegacy
{
  -[GEOActiveTileGroup _readAddressCorrectionInitURLLegacy]((uint64_t)self);
  return self->_addressCorrectionInitURLLegacy != 0;
}

- (NSString)addressCorrectionInitURLLegacy
{
  -[GEOActiveTileGroup _readAddressCorrectionInitURLLegacy]((uint64_t)self);
  return self->_addressCorrectionInitURLLegacy;
}

- (void)setAddressCorrectionInitURLLegacy:(id)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 0x40;
  *(_QWORD *)&self->_flags |= 0x100uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_addressCorrectionInitURLLegacy, a3);
}

- (void)_readAddressCorrectionUpdateURLLegacy
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(_QWORD *)(a1 + 632) & 0x200) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOActiveTileGroupReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAddressCorrectionUpdateURLLegacy_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (BOOL)hasAddressCorrectionUpdateURLLegacy
{
  -[GEOActiveTileGroup _readAddressCorrectionUpdateURLLegacy]((uint64_t)self);
  return self->_addressCorrectionUpdateURLLegacy != 0;
}

- (NSString)addressCorrectionUpdateURLLegacy
{
  -[GEOActiveTileGroup _readAddressCorrectionUpdateURLLegacy]((uint64_t)self);
  return self->_addressCorrectionUpdateURLLegacy;
}

- (void)setAddressCorrectionUpdateURLLegacy:(id)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 0x40;
  *(_QWORD *)&self->_flags |= 0x200uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_addressCorrectionUpdateURLLegacy, a3);
}

- (void)_readPolyLocationShiftURLLegacy
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(_QWORD *)(a1 + 632) & 0x2000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOActiveTileGroupReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPolyLocationShiftURLLegacy_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (BOOL)hasPolyLocationShiftURLLegacy
{
  -[GEOActiveTileGroup _readPolyLocationShiftURLLegacy]((uint64_t)self);
  return self->_polyLocationShiftURLLegacy != 0;
}

- (NSString)polyLocationShiftURLLegacy
{
  -[GEOActiveTileGroup _readPolyLocationShiftURLLegacy]((uint64_t)self);
  return self->_polyLocationShiftURLLegacy;
}

- (void)setPolyLocationShiftURLLegacy:(id)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 0x40;
  *(_QWORD *)&self->_flags |= 0x2000000000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_polyLocationShiftURLLegacy, a3);
}

- (void)_readProblemSubmissionURLLegacy
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(_QWORD *)(a1 + 632) & 0x40000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOActiveTileGroupReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readProblemSubmissionURLLegacy_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (BOOL)hasProblemSubmissionURLLegacy
{
  -[GEOActiveTileGroup _readProblemSubmissionURLLegacy]((uint64_t)self);
  return self->_problemSubmissionURLLegacy != 0;
}

- (NSString)problemSubmissionURLLegacy
{
  -[GEOActiveTileGroup _readProblemSubmissionURLLegacy]((uint64_t)self);
  return self->_problemSubmissionURLLegacy;
}

- (void)setProblemSubmissionURLLegacy:(id)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 0x40;
  *(_QWORD *)&self->_flags |= 0x40000000000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_problemSubmissionURLLegacy, a3);
}

- (void)_readProblemStatusURLLegacy
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(_QWORD *)(a1 + 632) & 0x20000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOActiveTileGroupReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readProblemStatusURLLegacy_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (BOOL)hasProblemStatusURLLegacy
{
  -[GEOActiveTileGroup _readProblemStatusURLLegacy]((uint64_t)self);
  return self->_problemStatusURLLegacy != 0;
}

- (NSString)problemStatusURLLegacy
{
  -[GEOActiveTileGroup _readProblemStatusURLLegacy]((uint64_t)self);
  return self->_problemStatusURLLegacy;
}

- (void)setProblemStatusURLLegacy:(id)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 0x40;
  *(_QWORD *)&self->_flags |= 0x20000000000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_problemStatusURLLegacy, a3);
}

- (void)_readReverseGeocoderVersionsURLLegacy
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(_QWORD *)(a1 + 632) & 0x40000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOActiveTileGroupReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readReverseGeocoderVersionsURLLegacy_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (BOOL)hasReverseGeocoderVersionsURLLegacy
{
  -[GEOActiveTileGroup _readReverseGeocoderVersionsURLLegacy]((uint64_t)self);
  return self->_reverseGeocoderVersionsURLLegacy != 0;
}

- (NSString)reverseGeocoderVersionsURLLegacy
{
  -[GEOActiveTileGroup _readReverseGeocoderVersionsURLLegacy]((uint64_t)self);
  return self->_reverseGeocoderVersionsURLLegacy;
}

- (void)setReverseGeocoderVersionsURLLegacy:(id)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 0x40;
  *(_QWORD *)&self->_flags |= 0x40000000000000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_reverseGeocoderVersionsURLLegacy, a3);
}

- (void)_readProblemCategoriesURLLegacy
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(_QWORD *)(a1 + 632) & 0x8000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOActiveTileGroupReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readProblemCategoriesURLLegacy_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (BOOL)hasProblemCategoriesURLLegacy
{
  -[GEOActiveTileGroup _readProblemCategoriesURLLegacy]((uint64_t)self);
  return self->_problemCategoriesURLLegacy != 0;
}

- (NSString)problemCategoriesURLLegacy
{
  -[GEOActiveTileGroup _readProblemCategoriesURLLegacy]((uint64_t)self);
  return self->_problemCategoriesURLLegacy;
}

- (void)setProblemCategoriesURLLegacy:(id)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 0x40;
  *(_QWORD *)&self->_flags |= 0x8000000000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_problemCategoriesURLLegacy, a3);
}

- (void)_readAnnouncementsURLLegacy
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(_QWORD *)(a1 + 632) & 0x800) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOActiveTileGroupReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAnnouncementsURLLegacy_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (BOOL)hasAnnouncementsURLLegacy
{
  -[GEOActiveTileGroup _readAnnouncementsURLLegacy]((uint64_t)self);
  return self->_announcementsURLLegacy != 0;
}

- (NSString)announcementsURLLegacy
{
  -[GEOActiveTileGroup _readAnnouncementsURLLegacy]((uint64_t)self);
  return self->_announcementsURLLegacy;
}

- (void)setAnnouncementsURLLegacy:(id)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 0x40;
  *(_QWORD *)&self->_flags |= 0x800uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_announcementsURLLegacy, a3);
}

- (void)_readAnnouncementsSupportedLanguages
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(_QWORD *)(a1 + 632) & 0x400) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOActiveTileGroupReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAnnouncementsSupportedLanguages_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (NSMutableArray)announcementsSupportedLanguages
{
  -[GEOActiveTileGroup _readAnnouncementsSupportedLanguages]((uint64_t)self);
  return self->_announcementsSupportedLanguages;
}

- (void)setAnnouncementsSupportedLanguages:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *announcementsSupportedLanguages;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x400uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *((_BYTE *)&self->_flags + 8) |= 0x40u;
  announcementsSupportedLanguages = self->_announcementsSupportedLanguages;
  self->_announcementsSupportedLanguages = v4;

}

- (void)clearAnnouncementsSupportedLanguages
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x400uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((_BYTE *)&self->_flags + 8) |= 0x40u;
  -[NSMutableArray removeAllObjects](self->_announcementsSupportedLanguages, "removeAllObjects");
}

- (void)addAnnouncementsSupportedLanguages:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;

  v4 = a3;
  -[GEOActiveTileGroup _readAnnouncementsSupportedLanguages]((uint64_t)self);
  -[GEOActiveTileGroup _addNoFlagsAnnouncementsSupportedLanguages:]((uint64_t)self, v4);

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  self = (GEOActiveTileGroup *)((char *)self + 632);
  self->super.super.isa = (Class)((unint64_t)self->super.super.isa | 0x400);
  os_unfair_lock_unlock(p_readerLock);
  LOBYTE(self->_reader) |= 0x40u;
}

- (unint64_t)announcementsSupportedLanguagesCount
{
  -[GEOActiveTileGroup _readAnnouncementsSupportedLanguages]((uint64_t)self);
  return -[NSMutableArray count](self->_announcementsSupportedLanguages, "count");
}

- (id)announcementsSupportedLanguagesAtIndex:(unint64_t)a3
{
  -[GEOActiveTileGroup _readAnnouncementsSupportedLanguages]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_announcementsSupportedLanguages, "objectAtIndex:", a3);
}

+ (Class)announcementsSupportedLanguagesType
{
  return (Class)objc_opt_class();
}

- (void)_readDispatcherURLLegacy
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(_QWORD *)(a1 + 632) & 0x200000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOActiveTileGroupReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDispatcherURLLegacy_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (BOOL)hasDispatcherURLLegacy
{
  -[GEOActiveTileGroup _readDispatcherURLLegacy]((uint64_t)self);
  return self->_dispatcherURLLegacy != 0;
}

- (NSString)dispatcherURLLegacy
{
  -[GEOActiveTileGroup _readDispatcherURLLegacy]((uint64_t)self);
  return self->_dispatcherURLLegacy;
}

- (void)setDispatcherURLLegacy:(id)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 0x40;
  *(_QWORD *)&self->_flags |= 0x200000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_dispatcherURLLegacy, a3);
}

- (void)_readProblemOptInURLLegacy
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(_QWORD *)(a1 + 632) & 0x10000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOActiveTileGroupReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readProblemOptInURLLegacy_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (BOOL)hasProblemOptInURLLegacy
{
  -[GEOActiveTileGroup _readProblemOptInURLLegacy]((uint64_t)self);
  return self->_problemOptInURLLegacy != 0;
}

- (NSString)problemOptInURLLegacy
{
  -[GEOActiveTileGroup _readProblemOptInURLLegacy]((uint64_t)self);
  return self->_problemOptInURLLegacy;
}

- (void)setProblemOptInURLLegacy:(id)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 0x40;
  *(_QWORD *)&self->_flags |= 0x10000000000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_problemOptInURLLegacy, a3);
}

- (BOOL)hasVersionManifest
{
  -[GEOActiveTileGroup _readVersionManifest]((uint64_t)self);
  return self->_versionManifest != 0;
}

- (void)setVersionManifest:(id)a3
{
  *((_BYTE *)&self->_flags + 8) |= 0x44u;
  objc_storeStrong((id *)&self->_versionManifest, a3);
}

- (void)_readStyleSheets
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(_QWORD *)(a1 + 632) & 0x1000000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOActiveTileGroupReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readStyleSheets_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (NSMutableArray)styleSheets
{
  -[GEOActiveTileGroup _readStyleSheets]((uint64_t)self);
  return self->_styleSheets;
}

- (void)setStyleSheets:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *styleSheets;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x1000000000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *((_BYTE *)&self->_flags + 8) |= 0x40u;
  styleSheets = self->_styleSheets;
  self->_styleSheets = v4;

}

- (void)clearStyleSheets
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x1000000000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((_BYTE *)&self->_flags + 8) |= 0x40u;
  -[NSMutableArray removeAllObjects](self->_styleSheets, "removeAllObjects");
}

- (void)addStyleSheet:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;

  v4 = a3;
  -[GEOActiveTileGroup _readStyleSheets]((uint64_t)self);
  -[GEOActiveTileGroup _addNoFlagsStyleSheet:]((uint64_t)self, v4);

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  self = (GEOActiveTileGroup *)((char *)self + 632);
  self->super.super.isa = (Class)((unint64_t)self->super.super.isa | 0x1000000000000000);
  os_unfair_lock_unlock(p_readerLock);
  LOBYTE(self->_reader) |= 0x40u;
}

- (void)_addNoFlagsStyleSheet:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 528);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 528);
      *(_QWORD *)(a1 + 528) = v5;

      v4 = *(void **)(a1 + 528);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)styleSheetsCount
{
  -[GEOActiveTileGroup _readStyleSheets]((uint64_t)self);
  return -[NSMutableArray count](self->_styleSheets, "count");
}

- (id)styleSheetAtIndex:(unint64_t)a3
{
  -[GEOActiveTileGroup _readStyleSheets]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_styleSheets, "objectAtIndex:", a3);
}

+ (Class)styleSheetType
{
  return (Class)objc_opt_class();
}

- (void)_readStyleSheetChecksums
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(_QWORD *)(a1 + 632) & 0x800000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOActiveTileGroupReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readStyleSheetChecksums_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (NSMutableArray)styleSheetChecksums
{
  -[GEOActiveTileGroup _readStyleSheetChecksums]((uint64_t)self);
  return self->_styleSheetChecksums;
}

- (void)setStyleSheetChecksums:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *styleSheetChecksums;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x800000000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *((_BYTE *)&self->_flags + 8) |= 0x40u;
  styleSheetChecksums = self->_styleSheetChecksums;
  self->_styleSheetChecksums = v4;

}

- (void)clearStyleSheetChecksums
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x800000000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((_BYTE *)&self->_flags + 8) |= 0x40u;
  -[NSMutableArray removeAllObjects](self->_styleSheetChecksums, "removeAllObjects");
}

- (void)addStyleSheetChecksum:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;

  v4 = a3;
  -[GEOActiveTileGroup _readStyleSheetChecksums]((uint64_t)self);
  -[GEOActiveTileGroup _addNoFlagsStyleSheetChecksum:]((uint64_t)self, v4);

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  self = (GEOActiveTileGroup *)((char *)self + 632);
  self->super.super.isa = (Class)((unint64_t)self->super.super.isa | 0x800000000000000);
  os_unfair_lock_unlock(p_readerLock);
  LOBYTE(self->_reader) |= 0x40u;
}

- (void)_addNoFlagsStyleSheetChecksum:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 520);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 520);
      *(_QWORD *)(a1 + 520) = v5;

      v4 = *(void **)(a1 + 520);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)styleSheetChecksumsCount
{
  -[GEOActiveTileGroup _readStyleSheetChecksums]((uint64_t)self);
  return -[NSMutableArray count](self->_styleSheetChecksums, "count");
}

- (id)styleSheetChecksumAtIndex:(unint64_t)a3
{
  -[GEOActiveTileGroup _readStyleSheetChecksums]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_styleSheetChecksums, "objectAtIndex:", a3);
}

+ (Class)styleSheetChecksumType
{
  return (Class)objc_opt_class();
}

- (void)_readTextures
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(_QWORD *)(a1 + 632) & 0x4000000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOActiveTileGroupReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTextures_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (NSMutableArray)textures
{
  -[GEOActiveTileGroup _readTextures]((uint64_t)self);
  return self->_textures;
}

- (void)setTextures:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *textures;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x4000000000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *((_BYTE *)&self->_flags + 8) |= 0x40u;
  textures = self->_textures;
  self->_textures = v4;

}

- (void)clearTextures
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x4000000000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((_BYTE *)&self->_flags + 8) |= 0x40u;
  -[NSMutableArray removeAllObjects](self->_textures, "removeAllObjects");
}

- (void)addTexture:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;

  v4 = a3;
  -[GEOActiveTileGroup _readTextures]((uint64_t)self);
  -[GEOActiveTileGroup _addNoFlagsTexture:]((uint64_t)self, v4);

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  self = (GEOActiveTileGroup *)((char *)self + 632);
  self->super.super.isa = (Class)((unint64_t)self->super.super.isa | 0x4000000000000000);
  os_unfair_lock_unlock(p_readerLock);
  LOBYTE(self->_reader) |= 0x40u;
}

- (void)_addNoFlagsTexture:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 544);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 544);
      *(_QWORD *)(a1 + 544) = v5;

      v4 = *(void **)(a1 + 544);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)texturesCount
{
  -[GEOActiveTileGroup _readTextures]((uint64_t)self);
  return -[NSMutableArray count](self->_textures, "count");
}

- (id)textureAtIndex:(unint64_t)a3
{
  -[GEOActiveTileGroup _readTextures]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_textures, "objectAtIndex:", a3);
}

+ (Class)textureType
{
  return (Class)objc_opt_class();
}

- (void)_readTextureChecksums
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(_QWORD *)(a1 + 632) & 0x2000000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOActiveTileGroupReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTextureChecksums_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (NSMutableArray)textureChecksums
{
  -[GEOActiveTileGroup _readTextureChecksums]((uint64_t)self);
  return self->_textureChecksums;
}

- (void)setTextureChecksums:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *textureChecksums;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x2000000000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *((_BYTE *)&self->_flags + 8) |= 0x40u;
  textureChecksums = self->_textureChecksums;
  self->_textureChecksums = v4;

}

- (void)clearTextureChecksums
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x2000000000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((_BYTE *)&self->_flags + 8) |= 0x40u;
  -[NSMutableArray removeAllObjects](self->_textureChecksums, "removeAllObjects");
}

- (void)addTextureChecksum:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;

  v4 = a3;
  -[GEOActiveTileGroup _readTextureChecksums]((uint64_t)self);
  -[GEOActiveTileGroup _addNoFlagsTextureChecksum:]((uint64_t)self, v4);

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  self = (GEOActiveTileGroup *)((char *)self + 632);
  self->super.super.isa = (Class)((unint64_t)self->super.super.isa | 0x2000000000000000);
  os_unfair_lock_unlock(p_readerLock);
  LOBYTE(self->_reader) |= 0x40u;
}

- (void)_addNoFlagsTextureChecksum:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 536);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 536);
      *(_QWORD *)(a1 + 536) = v5;

      v4 = *(void **)(a1 + 536);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)textureChecksumsCount
{
  -[GEOActiveTileGroup _readTextureChecksums]((uint64_t)self);
  return -[NSMutableArray count](self->_textureChecksums, "count");
}

- (id)textureChecksumAtIndex:(unint64_t)a3
{
  -[GEOActiveTileGroup _readTextureChecksums]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_textureChecksums, "objectAtIndex:", a3);
}

+ (Class)textureChecksumType
{
  return (Class)objc_opt_class();
}

- (void)_readFonts
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(_QWORD *)(a1 + 632) & 0x10000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOActiveTileGroupReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readFonts_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (NSMutableArray)fonts
{
  -[GEOActiveTileGroup _readFonts]((uint64_t)self);
  return self->_fonts;
}

- (void)setFonts:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *fonts;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x10000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *((_BYTE *)&self->_flags + 8) |= 0x40u;
  fonts = self->_fonts;
  self->_fonts = v4;

}

- (void)clearFonts
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x10000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((_BYTE *)&self->_flags + 8) |= 0x40u;
  -[NSMutableArray removeAllObjects](self->_fonts, "removeAllObjects");
}

- (void)addFont:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;

  v4 = a3;
  -[GEOActiveTileGroup _readFonts]((uint64_t)self);
  -[GEOActiveTileGroup _addNoFlagsFont:]((uint64_t)self, v4);

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  self = (GEOActiveTileGroup *)((char *)self + 632);
  self->super.super.isa = (Class)((unint64_t)self->super.super.isa | 0x10000000);
  os_unfair_lock_unlock(p_readerLock);
  LOBYTE(self->_reader) |= 0x40u;
}

- (void)_addNoFlagsFont:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 272);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 272);
      *(_QWORD *)(a1 + 272) = v5;

      v4 = *(void **)(a1 + 272);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)fontsCount
{
  -[GEOActiveTileGroup _readFonts]((uint64_t)self);
  return -[NSMutableArray count](self->_fonts, "count");
}

- (id)fontAtIndex:(unint64_t)a3
{
  -[GEOActiveTileGroup _readFonts]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_fonts, "objectAtIndex:", a3);
}

+ (Class)fontType
{
  return (Class)objc_opt_class();
}

- (void)_readFontChecksums
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(_QWORD *)(a1 + 632) & 0x8000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOActiveTileGroupReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readFontChecksums_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (NSMutableArray)fontChecksums
{
  -[GEOActiveTileGroup _readFontChecksums]((uint64_t)self);
  return self->_fontChecksums;
}

- (void)setFontChecksums:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *fontChecksums;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x8000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *((_BYTE *)&self->_flags + 8) |= 0x40u;
  fontChecksums = self->_fontChecksums;
  self->_fontChecksums = v4;

}

- (void)clearFontChecksums
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x8000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((_BYTE *)&self->_flags + 8) |= 0x40u;
  -[NSMutableArray removeAllObjects](self->_fontChecksums, "removeAllObjects");
}

- (void)addFontChecksum:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;

  v4 = a3;
  -[GEOActiveTileGroup _readFontChecksums]((uint64_t)self);
  -[GEOActiveTileGroup _addNoFlagsFontChecksum:]((uint64_t)self, v4);

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  self = (GEOActiveTileGroup *)((char *)self + 632);
  self->super.super.isa = (Class)((unint64_t)self->super.super.isa | 0x8000000);
  os_unfair_lock_unlock(p_readerLock);
  LOBYTE(self->_reader) |= 0x40u;
}

- (void)_addNoFlagsFontChecksum:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 264);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 264);
      *(_QWORD *)(a1 + 264) = v5;

      v4 = *(void **)(a1 + 264);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)fontChecksumsCount
{
  -[GEOActiveTileGroup _readFontChecksums]((uint64_t)self);
  return -[NSMutableArray count](self->_fontChecksums, "count");
}

- (id)fontChecksumAtIndex:(unint64_t)a3
{
  -[GEOActiveTileGroup _readFontChecksums]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_fontChecksums, "objectAtIndex:", a3);
}

+ (Class)fontChecksumType
{
  return (Class)objc_opt_class();
}

- (void)_readIcons
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(_QWORD *)(a1 + 632) & 0x40000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOActiveTileGroupReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readIcons_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (NSMutableArray)icons
{
  -[GEOActiveTileGroup _readIcons]((uint64_t)self);
  return self->_icons;
}

- (void)setIcons:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *icons;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x40000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *((_BYTE *)&self->_flags + 8) |= 0x40u;
  icons = self->_icons;
  self->_icons = v4;

}

- (void)clearIcons
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x40000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((_BYTE *)&self->_flags + 8) |= 0x40u;
  -[NSMutableArray removeAllObjects](self->_icons, "removeAllObjects");
}

- (void)addIcon:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;

  v4 = a3;
  -[GEOActiveTileGroup _readIcons]((uint64_t)self);
  -[GEOActiveTileGroup _addNoFlagsIcon:]((uint64_t)self, v4);

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  self = (GEOActiveTileGroup *)((char *)self + 632);
  self->super.super.isa = (Class)((unint64_t)self->super.super.isa | 0x40000000);
  os_unfair_lock_unlock(p_readerLock);
  LOBYTE(self->_reader) |= 0x40u;
}

- (void)_addNoFlagsIcon:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 288);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 288);
      *(_QWORD *)(a1 + 288) = v5;

      v4 = *(void **)(a1 + 288);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)iconsCount
{
  -[GEOActiveTileGroup _readIcons]((uint64_t)self);
  return -[NSMutableArray count](self->_icons, "count");
}

- (id)iconAtIndex:(unint64_t)a3
{
  -[GEOActiveTileGroup _readIcons]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_icons, "objectAtIndex:", a3);
}

+ (Class)iconType
{
  return (Class)objc_opt_class();
}

- (void)_readIconChecksums
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(_QWORD *)(a1 + 632) & 0x20000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOActiveTileGroupReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readIconChecksums_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (NSMutableArray)iconChecksums
{
  -[GEOActiveTileGroup _readIconChecksums]((uint64_t)self);
  return self->_iconChecksums;
}

- (void)setIconChecksums:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *iconChecksums;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x20000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *((_BYTE *)&self->_flags + 8) |= 0x40u;
  iconChecksums = self->_iconChecksums;
  self->_iconChecksums = v4;

}

- (void)clearIconChecksums
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x20000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((_BYTE *)&self->_flags + 8) |= 0x40u;
  -[NSMutableArray removeAllObjects](self->_iconChecksums, "removeAllObjects");
}

- (void)addIconChecksum:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;

  v4 = a3;
  -[GEOActiveTileGroup _readIconChecksums]((uint64_t)self);
  -[GEOActiveTileGroup _addNoFlagsIconChecksum:]((uint64_t)self, v4);

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  self = (GEOActiveTileGroup *)((char *)self + 632);
  self->super.super.isa = (Class)((unint64_t)self->super.super.isa | 0x20000000);
  os_unfair_lock_unlock(p_readerLock);
  LOBYTE(self->_reader) |= 0x40u;
}

- (void)_addNoFlagsIconChecksum:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 280);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 280);
      *(_QWORD *)(a1 + 280) = v5;

      v4 = *(void **)(a1 + 280);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)iconChecksumsCount
{
  -[GEOActiveTileGroup _readIconChecksums]((uint64_t)self);
  return -[NSMutableArray count](self->_iconChecksums, "count");
}

- (id)iconChecksumAtIndex:(unint64_t)a3
{
  -[GEOActiveTileGroup _readIconChecksums]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_iconChecksums, "objectAtIndex:", a3);
}

+ (Class)iconChecksumType
{
  return (Class)objc_opt_class();
}

- (void)_readXmls
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(_BYTE *)(a1 + 640) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOActiveTileGroupReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readXmls_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (NSMutableArray)xmls
{
  -[GEOActiveTileGroup _readXmls]((uint64_t)self);
  return self->_xmls;
}

- (void)setXmls:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *xmls;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *((_BYTE *)&self->_flags + 8) |= 0x20u;
  os_unfair_lock_unlock(&self->_readerLock);
  *((_BYTE *)&self->_flags + 8) |= 0x40u;
  xmls = self->_xmls;
  self->_xmls = v4;

}

- (void)clearXmls
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *((_BYTE *)&self->_flags + 8) |= 0x20u;
  os_unfair_lock_unlock(p_readerLock);
  *((_BYTE *)&self->_flags + 8) |= 0x40u;
  -[NSMutableArray removeAllObjects](self->_xmls, "removeAllObjects");
}

- (void)addXml:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;

  v4 = a3;
  -[GEOActiveTileGroup _readXmls]((uint64_t)self);
  -[GEOActiveTileGroup _addNoFlagsXml:]((uint64_t)self, v4);

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  self = (GEOActiveTileGroup *)((char *)self + 632);
  LOBYTE(self->_reader) |= 0x20u;
  os_unfair_lock_unlock(p_readerLock);
  LOBYTE(self->_reader) |= 0x40u;
}

- (void)_addNoFlagsXml:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 600);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 600);
      *(_QWORD *)(a1 + 600) = v5;

      v4 = *(void **)(a1 + 600);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)xmlsCount
{
  -[GEOActiveTileGroup _readXmls]((uint64_t)self);
  return -[NSMutableArray count](self->_xmls, "count");
}

- (id)xmlAtIndex:(unint64_t)a3
{
  -[GEOActiveTileGroup _readXmls]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_xmls, "objectAtIndex:", a3);
}

+ (Class)xmlType
{
  return (Class)objc_opt_class();
}

- (void)_readXmlChecksums
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(_BYTE *)(a1 + 640) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOActiveTileGroupReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readXmlChecksums_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (NSMutableArray)xmlChecksums
{
  -[GEOActiveTileGroup _readXmlChecksums]((uint64_t)self);
  return self->_xmlChecksums;
}

- (void)setXmlChecksums:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *xmlChecksums;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *((_BYTE *)&self->_flags + 8) |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *((_BYTE *)&self->_flags + 8) |= 0x40u;
  xmlChecksums = self->_xmlChecksums;
  self->_xmlChecksums = v4;

}

- (void)clearXmlChecksums
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *((_BYTE *)&self->_flags + 8) |= 0x10u;
  os_unfair_lock_unlock(p_readerLock);
  *((_BYTE *)&self->_flags + 8) |= 0x40u;
  -[NSMutableArray removeAllObjects](self->_xmlChecksums, "removeAllObjects");
}

- (void)addXmlChecksum:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;

  v4 = a3;
  -[GEOActiveTileGroup _readXmlChecksums]((uint64_t)self);
  -[GEOActiveTileGroup _addNoFlagsXmlChecksum:]((uint64_t)self, v4);

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  self = (GEOActiveTileGroup *)((char *)self + 632);
  LOBYTE(self->_reader) |= 0x10u;
  os_unfair_lock_unlock(p_readerLock);
  LOBYTE(self->_reader) |= 0x40u;
}

- (void)_addNoFlagsXmlChecksum:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 592);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 592);
      *(_QWORD *)(a1 + 592) = v5;

      v4 = *(void **)(a1 + 592);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)xmlChecksumsCount
{
  -[GEOActiveTileGroup _readXmlChecksums]((uint64_t)self);
  return -[NSMutableArray count](self->_xmlChecksums, "count");
}

- (id)xmlChecksumAtIndex:(unint64_t)a3
{
  -[GEOActiveTileGroup _readXmlChecksums]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_xmlChecksums, "objectAtIndex:", a3);
}

+ (Class)xmlChecksumType
{
  return (Class)objc_opt_class();
}

- (void)_readAbExperimentURLLegacy
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(_QWORD *)(a1 + 632) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOActiveTileGroupReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAbExperimentURLLegacy_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (BOOL)hasAbExperimentURLLegacy
{
  -[GEOActiveTileGroup _readAbExperimentURLLegacy]((uint64_t)self);
  return self->_abExperimentURLLegacy != 0;
}

- (NSString)abExperimentURLLegacy
{
  -[GEOActiveTileGroup _readAbExperimentURLLegacy]((uint64_t)self);
  return self->_abExperimentURLLegacy;
}

- (void)setAbExperimentURLLegacy:(id)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 0x40;
  *(_QWORD *)&self->_flags |= 0x40uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_abExperimentURLLegacy, a3);
}

- (void)_readBusinessPortalBaseURLLegacy
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(_QWORD *)(a1 + 632) & 0x40000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOActiveTileGroupReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readBusinessPortalBaseURLLegacy_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (BOOL)hasBusinessPortalBaseURLLegacy
{
  -[GEOActiveTileGroup _readBusinessPortalBaseURLLegacy]((uint64_t)self);
  return self->_businessPortalBaseURLLegacy != 0;
}

- (NSString)businessPortalBaseURLLegacy
{
  -[GEOActiveTileGroup _readBusinessPortalBaseURLLegacy]((uint64_t)self);
  return self->_businessPortalBaseURLLegacy;
}

- (void)setBusinessPortalBaseURLLegacy:(id)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 0x40;
  *(_QWORD *)&self->_flags |= 0x40000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_businessPortalBaseURLLegacy, a3);
}

- (void)_readLogMessageUsageURLLegacy
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(_QWORD *)(a1 + 632) & 0x100000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOActiveTileGroupReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLogMessageUsageURLLegacy_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (BOOL)hasLogMessageUsageURLLegacy
{
  -[GEOActiveTileGroup _readLogMessageUsageURLLegacy]((uint64_t)self);
  return self->_logMessageUsageURLLegacy != 0;
}

- (NSString)logMessageUsageURLLegacy
{
  -[GEOActiveTileGroup _readLogMessageUsageURLLegacy]((uint64_t)self);
  return self->_logMessageUsageURLLegacy;
}

- (void)setLogMessageUsageURLLegacy:(id)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 0x40;
  *(_QWORD *)&self->_flags |= 0x100000000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_logMessageUsageURLLegacy, a3);
}

- (void)_readLocationShiftEnabledRegions
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(_QWORD *)(a1 + 632) & 0x80000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOActiveTileGroupReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLocationShiftEnabledRegions_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (NSMutableArray)locationShiftEnabledRegions
{
  -[GEOActiveTileGroup _readLocationShiftEnabledRegions]((uint64_t)self);
  return self->_locationShiftEnabledRegions;
}

- (void)setLocationShiftEnabledRegions:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *locationShiftEnabledRegions;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x80000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *((_BYTE *)&self->_flags + 8) |= 0x40u;
  locationShiftEnabledRegions = self->_locationShiftEnabledRegions;
  self->_locationShiftEnabledRegions = v4;

}

- (void)clearLocationShiftEnabledRegions
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x80000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((_BYTE *)&self->_flags + 8) |= 0x40u;
  -[NSMutableArray removeAllObjects](self->_locationShiftEnabledRegions, "removeAllObjects");
}

- (void)addLocationShiftEnabledRegion:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;

  v4 = a3;
  -[GEOActiveTileGroup _readLocationShiftEnabledRegions]((uint64_t)self);
  -[GEOActiveTileGroup _addNoFlagsLocationShiftEnabledRegion:]((uint64_t)self, v4);

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  self = (GEOActiveTileGroup *)((char *)self + 632);
  self->super.super.isa = (Class)((unint64_t)self->super.super.isa | 0x80000000);
  os_unfair_lock_unlock(p_readerLock);
  LOBYTE(self->_reader) |= 0x40u;
}

- (void)_addNoFlagsLocationShiftEnabledRegion:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 296);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 296);
      *(_QWORD *)(a1 + 296) = v5;

      v4 = *(void **)(a1 + 296);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)locationShiftEnabledRegionsCount
{
  -[GEOActiveTileGroup _readLocationShiftEnabledRegions]((uint64_t)self);
  return -[NSMutableArray count](self->_locationShiftEnabledRegions, "count");
}

- (id)locationShiftEnabledRegionAtIndex:(unint64_t)a3
{
  -[GEOActiveTileGroup _readLocationShiftEnabledRegions]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_locationShiftEnabledRegions, "objectAtIndex:", a3);
}

+ (Class)locationShiftEnabledRegionType
{
  return (Class)objc_opt_class();
}

- (unsigned)locationShiftVersion
{
  return self->_locationShiftVersion;
}

- (void)setLocationShiftVersion:(unsigned int)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 0x40;
  *(_QWORD *)&self->_flags |= 1uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  self->_locationShiftVersion = a3;
}

- (void)setHasLocationShiftVersion:(BOOL)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 0x40;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFFFELL | a3;
  *((_BYTE *)&self->_flags + 8) = v3;
}

- (BOOL)hasLocationShiftVersion
{
  return *(_DWORD *)&self->_flags & 1;
}

- (void)_readHybridUnavailableRegions
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(_QWORD *)(a1 + 632) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOActiveTileGroupReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readHybridUnavailableRegions_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (unint64_t)hybridUnavailableRegionsCount
{
  -[GEOActiveTileGroup _readHybridUnavailableRegions]((uint64_t)self);
  return self->_hybridUnavailableRegionsCount;
}

- (GEOTileSetRegion)hybridUnavailableRegions
{
  -[GEOActiveTileGroup _readHybridUnavailableRegions]((uint64_t)self);
  return self->_hybridUnavailableRegions;
}

- (uint64_t)_reserveHybridUnavailableRegions:(uint64_t)a1
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
    v4 = *(_QWORD *)(a1 + 80);
    v5 = v4 + a2;
    if (v4 + a2 <= v4)
      return 0;
    v6 = *(_QWORD *)(a1 + 88);
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
    result = (uint64_t)malloc_type_realloc(*(void **)(a1 + 72), 24 * v9, 0x62D9EB57uLL);
    if (result)
    {
      *(_QWORD *)(a1 + 88) = v9;
      *(_QWORD *)(a1 + 72) = result;
      bzero((void *)(result + 24 * *(_QWORD *)(a1 + 80)), 24 * (v9 - *(_QWORD *)(a1 + 80)));
      return 1;
    }
  }
  return result;
}

- (void)addHybridUnavailableRegion:(GEOTileSetRegion *)a3
{
  os_unfair_lock_s *p_readerLock;
  $C037152B3533EA725D592E212B352B24 *p_flags;
  GEOTileSetRegion v7;

  -[GEOActiveTileGroup _readHybridUnavailableRegions]((uint64_t)self);
  v7 = *a3;
  if (self && -[GEOActiveTileGroup _reserveHybridUnavailableRegions:]((uint64_t)self, 1uLL))
    self->_hybridUnavailableRegions[self->_hybridUnavailableRegionsCount++] = v7;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  p_flags = &self->_flags;
  *(_QWORD *)p_flags |= 0x20uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((_BYTE *)p_flags + 8) |= 0x40u;
}

- (GEOTileSetRegion)hybridUnavailableRegionAtIndex:(SEL)a3
{
  GEOTileSetRegion *result;
  unint64_t hybridUnavailableRegionsCount;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  GEOTileSetRegion *v13;

  -[GEOActiveTileGroup _readHybridUnavailableRegions]((uint64_t)self);
  hybridUnavailableRegionsCount = self->_hybridUnavailableRegionsCount;
  if (hybridUnavailableRegionsCount <= a4)
  {
    v9 = (void *)MEMORY[0x1E0C99DA0];
    v10 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a4, hybridUnavailableRegionsCount);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "exceptionWithName:reason:userInfo:", v10, v11, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "raise");

  }
  v13 = &self->_hybridUnavailableRegions[a4];
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&v13->var0;
  *(_QWORD *)&retstr->var4 = *(_QWORD *)&v13->var4;
  return result;
}

- (void)setHybridUnavailableRegions:(GEOTileSetRegion *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x20uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((_BYTE *)&self->_flags + 8) |= 0x40u;
  -[GEOActiveTileGroup clearHybridUnavailableRegions](self, "clearHybridUnavailableRegions");
  if (-[GEOActiveTileGroup _reserveHybridUnavailableRegions:]((uint64_t)self, a4))
  {
    memcpy(self->_hybridUnavailableRegions, a3, 24 * a4);
    self->_hybridUnavailableRegionsCount = a4;
  }
}

- (void)_readReserved
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(_QWORD *)(a1 + 632) & 0x4000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOActiveTileGroupReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readReserved_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (BOOL)hasReserved
{
  -[GEOActiveTileGroup _readReserved]((uint64_t)self);
  return self->_reserved != 0;
}

- (NSData)reserved
{
  -[GEOActiveTileGroup _readReserved]((uint64_t)self);
  return self->_reserved;
}

- (void)setReserved:(id)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 0x40;
  *(_QWORD *)&self->_flags |= 0x4000000000000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_reserved, a3);
}

- (void)_readSpatialLookupURLLegacy
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(_QWORD *)(a1 + 632) & 0x200000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOActiveTileGroupReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSpatialLookupURLLegacy_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (BOOL)hasSpatialLookupURLLegacy
{
  -[GEOActiveTileGroup _readSpatialLookupURLLegacy]((uint64_t)self);
  return self->_spatialLookupURLLegacy != 0;
}

- (NSString)spatialLookupURLLegacy
{
  -[GEOActiveTileGroup _readSpatialLookupURLLegacy]((uint64_t)self);
  return self->_spatialLookupURLLegacy;
}

- (void)setSpatialLookupURLLegacy:(id)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 0x40;
  *(_QWORD *)&self->_flags |= 0x200000000000000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_spatialLookupURLLegacy, a3);
}

- (void)_readActiveResources
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(_QWORD *)(a1 + 632) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOActiveTileGroupReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readActiveResources_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (NSMutableArray)activeResources
{
  -[GEOActiveTileGroup _readActiveResources]((uint64_t)self);
  return self->_activeResources;
}

- (void)setActiveResources:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *activeResources;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x80uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *((_BYTE *)&self->_flags + 8) |= 0x40u;
  activeResources = self->_activeResources;
  self->_activeResources = v4;

}

- (void)clearActiveResources
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x80uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((_BYTE *)&self->_flags + 8) |= 0x40u;
  -[NSMutableArray removeAllObjects](self->_activeResources, "removeAllObjects");
}

- (void)addActiveResource:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;

  v4 = a3;
  -[GEOActiveTileGroup _readActiveResources]((uint64_t)self);
  -[GEOActiveTileGroup _addNoFlagsActiveResource:]((uint64_t)self, v4);

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  self = (GEOActiveTileGroup *)((char *)self + 632);
  self->super.super.isa = (Class)((unint64_t)self->super.super.isa | 0x80);
  os_unfair_lock_unlock(p_readerLock);
  LOBYTE(self->_reader) |= 0x40u;
}

- (unint64_t)activeResourcesCount
{
  -[GEOActiveTileGroup _readActiveResources]((uint64_t)self);
  return -[NSMutableArray count](self->_activeResources, "count");
}

- (id)activeResourceAtIndex:(unint64_t)a3
{
  -[GEOActiveTileGroup _readActiveResources]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_activeResources, "objectAtIndex:", a3);
}

+ (Class)activeResourceType
{
  return (Class)objc_opt_class();
}

- (void)setRegionalResources:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *regionalResources;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x1000000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *((_BYTE *)&self->_flags + 8) |= 0x40u;
  regionalResources = self->_regionalResources;
  self->_regionalResources = v4;

}

- (void)clearRegionalResources
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x1000000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((_BYTE *)&self->_flags + 8) |= 0x40u;
  -[NSMutableArray removeAllObjects](self->_regionalResources, "removeAllObjects");
}

- (void)addRegionalResource:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;

  v4 = a3;
  -[GEOActiveTileGroup _readRegionalResources]((uint64_t)self);
  -[GEOActiveTileGroup _addNoFlagsRegionalResource:]((uint64_t)self, v4);

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  self = (GEOActiveTileGroup *)((char *)self + 632);
  self->super.super.isa = (Class)((unint64_t)self->super.super.isa | 0x1000000000000);
  os_unfair_lock_unlock(p_readerLock);
  LOBYTE(self->_reader) |= 0x40u;
}

+ (Class)regionalResourceType
{
  return (Class)objc_opt_class();
}

- (void)setModelVersion:(unsigned int)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 0x40;
  *(_QWORD *)&self->_flags |= 2uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  self->_modelVersion = a3;
}

- (void)setHasModelVersion:(BOOL)a3
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)&self->_flags + 8);
  v4 = 2;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFFFDLL | v4;
  *((_BYTE *)&self->_flags + 8) = v3 | 0x40;
}

- (BOOL)hasModelVersion
{
  return (*(_QWORD *)&self->_flags >> 1) & 1;
}

- (int)activeScales
{
  -[GEOActiveTileGroup _readActiveScales]((uint64_t)self);
  return self->_activeScales.list;
}

- (void)clearActiveScales
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 8uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((_BYTE *)&self->_flags + 8) |= 0x40u;
  PBRepeatedInt32Clear();
}

- (void)addActiveScale:(int)a3
{
  os_unfair_lock_s *p_readerLock;
  $C037152B3533EA725D592E212B352B24 *p_flags;

  -[GEOActiveTileGroup _readActiveScales]((uint64_t)self);
  if (self)
    PBRepeatedInt32Add();
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  p_flags = &self->_flags;
  *(_QWORD *)p_flags |= 8uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((_BYTE *)p_flags + 8) |= 0x40u;
}

- (void)setActiveScales:(int *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 8uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((_BYTE *)&self->_flags + 8) |= 0x40u;
  PBRepeatedInt32Set();
}

- (id)activeScalesAsString:(int)a3
{
  if (a3 < 4)
    return off_1E1C07DD8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsActiveScales:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RESOURCE_FILTER_SCALE_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RESOURCE_FILTER_SCALE_1X")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RESOURCE_FILTER_SCALE_2X")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("RESOURCE_FILTER_SCALE_3X")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)activeScenarios
{
  -[GEOActiveTileGroup _readActiveScenarios]((uint64_t)self);
  return self->_activeScenarios.list;
}

- (void)clearActiveScenarios
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x10uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((_BYTE *)&self->_flags + 8) |= 0x40u;
  PBRepeatedInt32Clear();
}

- (void)addActiveScenario:(int)a3
{
  os_unfair_lock_s *p_readerLock;
  $C037152B3533EA725D592E212B352B24 *p_flags;

  -[GEOActiveTileGroup _readActiveScenarios]((uint64_t)self);
  if (self)
    PBRepeatedInt32Add();
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  p_flags = &self->_flags;
  *(_QWORD *)p_flags |= 0x10uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((_BYTE *)p_flags + 8) |= 0x40u;
}

- (void)setActiveScenarios:(int *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x10uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((_BYTE *)&self->_flags + 8) |= 0x40u;
  PBRepeatedInt32Set();
}

- (id)activeScenariosAsString:(int)a3
{
  if (a3 < 5)
    return off_1E1C07DF8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsActiveScenarios:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RESOURCE_FILTER_SCENARIO_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RESOURCE_FILTER_SCENARIO_CARPLAY")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RESOURCE_FILTER_SCENARIO_NAVIGATION")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RESOURCE_FILTER_SCENARIO_HIGHVISIBILITY")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("RESOURCE_FILTER_SCENARIO_EXPLICIT")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (NSMutableArray)staleResources
{
  -[GEOActiveTileGroup _readStaleResources]((uint64_t)self);
  return self->_staleResources;
}

- (void)setStaleResources:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *staleResources;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x400000000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *((_BYTE *)&self->_flags + 8) |= 0x40u;
  staleResources = self->_staleResources;
  self->_staleResources = v4;

}

- (void)clearStaleResources
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x400000000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((_BYTE *)&self->_flags + 8) |= 0x40u;
  -[NSMutableArray removeAllObjects](self->_staleResources, "removeAllObjects");
}

- (void)addStaleResource:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;

  v4 = a3;
  -[GEOActiveTileGroup _readStaleResources]((uint64_t)self);
  -[GEOActiveTileGroup _addNoFlagsStaleResource:]((uint64_t)self, v4);

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  self = (GEOActiveTileGroup *)((char *)self + 632);
  self->super.super.isa = (Class)((unint64_t)self->super.super.isa | 0x400000000000000);
  os_unfair_lock_unlock(p_readerLock);
  LOBYTE(self->_reader) |= 0x40u;
}

- (void)_addNoFlagsStaleResource:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 512);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 512);
      *(_QWORD *)(a1 + 512) = v5;

      v4 = *(void **)(a1 + 512);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (id)staleResourceAtIndex:(unint64_t)a3
{
  -[GEOActiveTileGroup _readStaleResources]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_staleResources, "objectAtIndex:", a3);
}

+ (Class)staleResourceType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasDataSet
{
  -[GEOActiveTileGroup _readDataSet]((uint64_t)self);
  return self->_dataSet != 0;
}

- (void)setDataSet:(id)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 0x40;
  *(_QWORD *)&self->_flags |= 0x80000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_dataSet, a3);
}

- (void)_readRealtimeTrafficProbeURLLegacy
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(_QWORD *)(a1 + 632) & 0x80000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOActiveTileGroupReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRealtimeTrafficProbeURLLegacy_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (BOOL)hasRealtimeTrafficProbeURLLegacy
{
  -[GEOActiveTileGroup _readRealtimeTrafficProbeURLLegacy]((uint64_t)self);
  return self->_realtimeTrafficProbeURLLegacy != 0;
}

- (NSString)realtimeTrafficProbeURLLegacy
{
  -[GEOActiveTileGroup _readRealtimeTrafficProbeURLLegacy]((uint64_t)self);
  return self->_realtimeTrafficProbeURLLegacy;
}

- (void)setRealtimeTrafficProbeURLLegacy:(id)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 0x40;
  *(_QWORD *)&self->_flags |= 0x80000000000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_realtimeTrafficProbeURLLegacy, a3);
}

- (void)_readBatchTrafficProbeURLLegacy
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(_QWORD *)(a1 + 632) & 0x10000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOActiveTileGroupReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readBatchTrafficProbeURLLegacy_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (BOOL)hasBatchTrafficProbeURLLegacy
{
  -[GEOActiveTileGroup _readBatchTrafficProbeURLLegacy]((uint64_t)self);
  return self->_batchTrafficProbeURLLegacy != 0;
}

- (NSString)batchTrafficProbeURLLegacy
{
  -[GEOActiveTileGroup _readBatchTrafficProbeURLLegacy]((uint64_t)self);
  return self->_batchTrafficProbeURLLegacy;
}

- (void)setBatchTrafficProbeURLLegacy:(id)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 0x40;
  *(_QWORD *)&self->_flags |= 0x10000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_batchTrafficProbeURLLegacy, a3);
}

- (void)_readLogMessageUsageV3URLLegacy
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(_QWORD *)(a1 + 632) & 0x200000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOActiveTileGroupReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLogMessageUsageV3URLLegacy_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (BOOL)hasLogMessageUsageV3URLLegacy
{
  -[GEOActiveTileGroup _readLogMessageUsageV3URLLegacy]((uint64_t)self);
  return self->_logMessageUsageV3URLLegacy != 0;
}

- (NSString)logMessageUsageV3URLLegacy
{
  -[GEOActiveTileGroup _readLogMessageUsageV3URLLegacy]((uint64_t)self);
  return self->_logMessageUsageV3URLLegacy;
}

- (void)setLogMessageUsageV3URLLegacy:(id)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 0x40;
  *(_QWORD *)&self->_flags |= 0x200000000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_logMessageUsageV3URLLegacy, a3);
}

- (void)_readProactiveRoutingURLLegacy
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(_QWORD *)(a1 + 632) & 0x4000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOActiveTileGroupReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readProactiveRoutingURLLegacy_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (BOOL)hasProactiveRoutingURLLegacy
{
  -[GEOActiveTileGroup _readProactiveRoutingURLLegacy]((uint64_t)self);
  return self->_proactiveRoutingURLLegacy != 0;
}

- (NSString)proactiveRoutingURLLegacy
{
  -[GEOActiveTileGroup _readProactiveRoutingURLLegacy]((uint64_t)self);
  return self->_proactiveRoutingURLLegacy;
}

- (void)setProactiveRoutingURLLegacy:(id)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 0x40;
  *(_QWORD *)&self->_flags |= 0x4000000000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_proactiveRoutingURLLegacy, a3);
}

- (void)_readBackgroundDispatcherURLLegacy
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(_QWORD *)(a1 + 632) & 0x2000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOActiveTileGroupReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readBackgroundDispatcherURLLegacy_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (BOOL)hasBackgroundDispatcherURLLegacy
{
  -[GEOActiveTileGroup _readBackgroundDispatcherURLLegacy]((uint64_t)self);
  return self->_backgroundDispatcherURLLegacy != 0;
}

- (NSString)backgroundDispatcherURLLegacy
{
  -[GEOActiveTileGroup _readBackgroundDispatcherURLLegacy]((uint64_t)self);
  return self->_backgroundDispatcherURLLegacy;
}

- (void)setBackgroundDispatcherURLLegacy:(id)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 0x40;
  *(_QWORD *)&self->_flags |= 0x2000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_backgroundDispatcherURLLegacy, a3);
}

- (void)_readBluePOIURLLegacy
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(_QWORD *)(a1 + 632) & 0x20000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOActiveTileGroupReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readBluePOIURLLegacy_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (BOOL)hasBluePOIURLLegacy
{
  -[GEOActiveTileGroup _readBluePOIURLLegacy]((uint64_t)self);
  return self->_bluePOIURLLegacy != 0;
}

- (NSString)bluePOIURLLegacy
{
  -[GEOActiveTileGroup _readBluePOIURLLegacy]((uint64_t)self);
  return self->_bluePOIURLLegacy;
}

- (void)setBluePOIURLLegacy:(id)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 0x40;
  *(_QWORD *)&self->_flags |= 0x20000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_bluePOIURLLegacy, a3);
}

- (void)_readBackgroundRevGeoURLLegacy
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(_QWORD *)(a1 + 632) & 0x4000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOActiveTileGroupReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readBackgroundRevGeoURLLegacy_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (BOOL)hasBackgroundRevGeoURLLegacy
{
  -[GEOActiveTileGroup _readBackgroundRevGeoURLLegacy]((uint64_t)self);
  return self->_backgroundRevGeoURLLegacy != 0;
}

- (NSString)backgroundRevGeoURLLegacy
{
  -[GEOActiveTileGroup _readBackgroundRevGeoURLLegacy]((uint64_t)self);
  return self->_backgroundRevGeoURLLegacy;
}

- (void)setBackgroundRevGeoURLLegacy:(id)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 0x40;
  *(_QWORD *)&self->_flags |= 0x4000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_backgroundRevGeoURLLegacy, a3);
}

- (void)_readWifiConnectionQualityProbeURLLegacy
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(_BYTE *)(a1 + 640) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOActiveTileGroupReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readWifiConnectionQualityProbeURLLegacy_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (BOOL)hasWifiConnectionQualityProbeURLLegacy
{
  -[GEOActiveTileGroup _readWifiConnectionQualityProbeURLLegacy]((uint64_t)self);
  return self->_wifiConnectionQualityProbeURLLegacy != 0;
}

- (NSString)wifiConnectionQualityProbeURLLegacy
{
  -[GEOActiveTileGroup _readWifiConnectionQualityProbeURLLegacy]((uint64_t)self);
  return self->_wifiConnectionQualityProbeURLLegacy;
}

- (void)setWifiConnectionQualityProbeURLLegacy:(id)a3
{
  *((_BYTE *)&self->_flags + 8) |= 0x48u;
  objc_storeStrong((id *)&self->_wifiConnectionQualityProbeURLLegacy, a3);
}

- (void)_readMuninBaseURL
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(_QWORD *)(a1 + 632) & 0x400000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOActiveTileGroupReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMuninBaseURL_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (BOOL)hasMuninBaseURL
{
  -[GEOActiveTileGroup _readMuninBaseURL]((uint64_t)self);
  return self->_muninBaseURL != 0;
}

- (NSString)muninBaseURL
{
  -[GEOActiveTileGroup _readMuninBaseURL]((uint64_t)self);
  return self->_muninBaseURL;
}

- (void)setMuninBaseURL:(id)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 0x40;
  *(_QWORD *)&self->_flags |= 0x400000000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_muninBaseURL, a3);
}

- (void)_readFlyoverRegionVersions
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(_QWORD *)(a1 + 632) & 0x4000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOActiveTileGroupReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readFlyoverRegionVersions_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (BOOL)hasFlyoverRegionVersions
{
  -[GEOActiveTileGroup _readFlyoverRegionVersions]((uint64_t)self);
  return self->_flyoverRegionVersions != 0;
}

- (NSData)flyoverRegionVersions
{
  -[GEOActiveTileGroup _readFlyoverRegionVersions]((uint64_t)self);
  return self->_flyoverRegionVersions;
}

- (void)setFlyoverRegionVersions:(id)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 0x40;
  *(_QWORD *)&self->_flags |= 0x4000000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_flyoverRegionVersions, a3);
}

- (BOOL)hasUrlInfoSet
{
  -[GEOActiveTileGroup _readUrlInfoSet]((uint64_t)self);
  return self->_urlInfoSet != 0;
}

- (void)setUrlInfoSet:(id)a3
{
  *((_BYTE *)&self->_flags + 8) |= 0x42u;
  objc_storeStrong((id *)&self->_urlInfoSet, a3);
}

- (NSMutableArray)muninBuckets
{
  -[GEOActiveTileGroup _readMuninBuckets]((uint64_t)self);
  return self->_muninBuckets;
}

- (void)setMuninBuckets:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *muninBuckets;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x800000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *((_BYTE *)&self->_flags + 8) |= 0x40u;
  muninBuckets = self->_muninBuckets;
  self->_muninBuckets = v4;

}

- (void)clearMuninBuckets
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x800000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((_BYTE *)&self->_flags + 8) |= 0x40u;
  -[NSMutableArray removeAllObjects](self->_muninBuckets, "removeAllObjects");
}

- (void)addMuninBucket:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;

  v4 = a3;
  -[GEOActiveTileGroup _readMuninBuckets]((uint64_t)self);
  -[GEOActiveTileGroup _addNoFlagsMuninBucket:]((uint64_t)self, v4);

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  self = (GEOActiveTileGroup *)((char *)self + 632);
  self->super.super.isa = (Class)((unint64_t)self->super.super.isa | 0x800000000);
  os_unfair_lock_unlock(p_readerLock);
  LOBYTE(self->_reader) |= 0x40u;
}

- (id)muninBucketAtIndex:(unint64_t)a3
{
  -[GEOActiveTileGroup _readMuninBuckets]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_muninBuckets, "objectAtIndex:", a3);
}

+ (Class)muninBucketType
{
  return (Class)objc_opt_class();
}

- (void)_readEnvironment
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(_QWORD *)(a1 + 632) & 0x800000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOActiveTileGroupReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readEnvironment_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (BOOL)hasEnvironment
{
  -[GEOActiveTileGroup _readEnvironment]((uint64_t)self);
  return self->_environment != 0;
}

- (NSString)environment
{
  -[GEOActiveTileGroup _readEnvironment]((uint64_t)self);
  return self->_environment;
}

- (void)setEnvironment:(id)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 0x40;
  *(_QWORD *)&self->_flags |= 0x800000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_environment, a3);
}

- (void)_readDisplayStrings
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(_QWORD *)(a1 + 632) & 0x400000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOActiveTileGroupReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDisplayStrings_tags_2);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (NSMutableArray)displayStrings
{
  -[GEOActiveTileGroup _readDisplayStrings]((uint64_t)self);
  return self->_displayStrings;
}

- (void)setDisplayStrings:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *displayStrings;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x400000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *((_BYTE *)&self->_flags + 8) |= 0x40u;
  displayStrings = self->_displayStrings;
  self->_displayStrings = v4;

}

- (void)clearDisplayStrings
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x400000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((_BYTE *)&self->_flags + 8) |= 0x40u;
  -[NSMutableArray removeAllObjects](self->_displayStrings, "removeAllObjects");
}

- (void)addDisplayStrings:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;

  v4 = a3;
  -[GEOActiveTileGroup _readDisplayStrings]((uint64_t)self);
  -[GEOActiveTileGroup _addNoFlagsDisplayStrings:]((uint64_t)self, v4);

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  self = (GEOActiveTileGroup *)((char *)self + 632);
  self->super.super.isa = (Class)((unint64_t)self->super.super.isa | 0x400000);
  os_unfair_lock_unlock(p_readerLock);
  LOBYTE(self->_reader) |= 0x40u;
}

- (unint64_t)displayStringsCount
{
  -[GEOActiveTileGroup _readDisplayStrings]((uint64_t)self);
  return -[NSMutableArray count](self->_displayStrings, "count");
}

- (id)displayStringsAtIndex:(unint64_t)a3
{
  -[GEOActiveTileGroup _readDisplayStrings]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_displayStrings, "objectAtIndex:", a3);
}

+ (Class)displayStringsType
{
  return (Class)objc_opt_class();
}

- (void)_readExplicitResources
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(_QWORD *)(a1 + 632) & 0x2000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOActiveTileGroupReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readExplicitResources_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (NSMutableArray)explicitResources
{
  -[GEOActiveTileGroup _readExplicitResources]((uint64_t)self);
  return self->_explicitResources;
}

- (void)setExplicitResources:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *explicitResources;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x2000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *((_BYTE *)&self->_flags + 8) |= 0x40u;
  explicitResources = self->_explicitResources;
  self->_explicitResources = v4;

}

- (void)clearExplicitResources
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x2000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((_BYTE *)&self->_flags + 8) |= 0x40u;
  -[NSMutableArray removeAllObjects](self->_explicitResources, "removeAllObjects");
}

- (void)addExplicitResource:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;

  v4 = a3;
  -[GEOActiveTileGroup _readExplicitResources]((uint64_t)self);
  -[GEOActiveTileGroup _addNoFlagsExplicitResource:]((uint64_t)self, v4);

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  self = (GEOActiveTileGroup *)((char *)self + 632);
  self->super.super.isa = (Class)((unint64_t)self->super.super.isa | 0x2000000);
  os_unfair_lock_unlock(p_readerLock);
  LOBYTE(self->_reader) |= 0x40u;
}

- (unint64_t)explicitResourcesCount
{
  -[GEOActiveTileGroup _readExplicitResources]((uint64_t)self);
  return -[NSMutableArray count](self->_explicitResources, "count");
}

- (id)explicitResourceAtIndex:(unint64_t)a3
{
  -[GEOActiveTileGroup _readExplicitResources]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_explicitResources, "objectAtIndex:", a3);
}

+ (Class)explicitResourceType
{
  return (Class)objc_opt_class();
}

- (void)_readOfflineMetadata
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(_QWORD *)(a1 + 632) & 0x1000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOActiveTileGroupReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readOfflineMetadata_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (BOOL)hasOfflineMetadata
{
  -[GEOActiveTileGroup _readOfflineMetadata]((uint64_t)self);
  return self->_offlineMetadata != 0;
}

- (GEOOfflineMetadata)offlineMetadata
{
  -[GEOActiveTileGroup _readOfflineMetadata]((uint64_t)self);
  return self->_offlineMetadata;
}

- (void)setOfflineMetadata:(id)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_flags + 8) | 0x40;
  *(_QWORD *)&self->_flags |= 0x1000000000uLL;
  *((_BYTE *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_offlineMetadata, a3);
}

- (void)setResourceCanonicalNameToFileName:(id)a3
{
  NSMutableDictionary *v4;
  NSMutableDictionary *resourceCanonicalNameToFileName;

  v4 = (NSMutableDictionary *)a3;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x8000000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *((_BYTE *)&self->_flags + 8) |= 0x40u;
  resourceCanonicalNameToFileName = self->_resourceCanonicalNameToFileName;
  self->_resourceCanonicalNameToFileName = v4;

}

- (void)clearResourceCanonicalNameToFileName
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x8000000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((_BYTE *)&self->_flags + 8) |= 0x40u;
  -[NSMutableDictionary removeAllObjects](self->_resourceCanonicalNameToFileName, "removeAllObjects");
}

- (void)setResourceCanonicalNameToFileNameValue:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  os_unfair_lock_s *p_readerLock;

  v6 = a4;
  v7 = a3;
  -[GEOActiveTileGroup _readResourceCanonicalNameToFileName]((uint64_t)self);
  -[GEOActiveTileGroup _setNoFlagsResourceCanonicalNameToFileNameValue:forKey:]((uint64_t)self, v7, v6);

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  self = (GEOActiveTileGroup *)((char *)self + 632);
  self->super.super.isa = (Class)((unint64_t)self->super.super.isa | 0x8000000000000);
  os_unfair_lock_unlock(p_readerLock);
  LOBYTE(self->_reader) |= 0x40u;
}

- (id)resourceCanonicalNameToFileNameForKey:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[GEOActiveTileGroup _readResourceCanonicalNameToFileName]((uint64_t)self);
  -[NSMutableDictionary objectForKey:](self->_resourceCanonicalNameToFileName, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)enumerateResourceCanonicalNameToFileNameUsingBlock:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOActiveTileGroup _readResourceCanonicalNameToFileName]((uint64_t)self);
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](self->_resourceCanonicalNameToFileName, "enumerateKeysAndObjectsUsingBlock:", v4);

}

- (unint64_t)resourceCanonicalNameToFileNameCount
{
  -[GEOActiveTileGroup _readResourceCanonicalNameToFileName]((uint64_t)self);
  return -[NSMutableDictionary count](self->_resourceCanonicalNameToFileName, "count");
}

+ (Class)resourceCanonicalNameToFileNameType
{
  return (Class)objc_opt_class();
}

- (void)setRegionalResourceCanonicalNameToFileName:(id)a3
{
  NSMutableDictionary *v4;
  NSMutableDictionary *regionalResourceCanonicalNameToFileName;

  v4 = (NSMutableDictionary *)a3;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x100000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *((_BYTE *)&self->_flags + 8) |= 0x40u;
  regionalResourceCanonicalNameToFileName = self->_regionalResourceCanonicalNameToFileName;
  self->_regionalResourceCanonicalNameToFileName = v4;

}

- (void)clearRegionalResourceCanonicalNameToFileName
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x100000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((_BYTE *)&self->_flags + 8) |= 0x40u;
  -[NSMutableDictionary removeAllObjects](self->_regionalResourceCanonicalNameToFileName, "removeAllObjects");
}

- (void)setRegionalResourceCanonicalNameToFileNameValue:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  os_unfair_lock_s *p_readerLock;

  v6 = a4;
  v7 = a3;
  -[GEOActiveTileGroup _readRegionalResourceCanonicalNameToFileName]((uint64_t)self);
  -[GEOActiveTileGroup _setNoFlagsRegionalResourceCanonicalNameToFileNameValue:forKey:]((uint64_t)self, v7, v6);

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  self = (GEOActiveTileGroup *)((char *)self + 632);
  self->super.super.isa = (Class)((unint64_t)self->super.super.isa | 0x100000000000);
  os_unfair_lock_unlock(p_readerLock);
  LOBYTE(self->_reader) |= 0x40u;
}

- (id)regionalResourceCanonicalNameToFileNameForKey:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[GEOActiveTileGroup _readRegionalResourceCanonicalNameToFileName]((uint64_t)self);
  -[NSMutableDictionary objectForKey:](self->_regionalResourceCanonicalNameToFileName, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)enumerateRegionalResourceCanonicalNameToFileNameUsingBlock:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOActiveTileGroup _readRegionalResourceCanonicalNameToFileName]((uint64_t)self);
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](self->_regionalResourceCanonicalNameToFileName, "enumerateKeysAndObjectsUsingBlock:", v4);

}

- (unint64_t)regionalResourceCanonicalNameToFileNameCount
{
  -[GEOActiveTileGroup _readRegionalResourceCanonicalNameToFileName]((uint64_t)self);
  return -[NSMutableDictionary count](self->_regionalResourceCanonicalNameToFileName, "count");
}

+ (Class)regionalResourceCanonicalNameToFileNameType
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
  v8.super_class = (Class)GEOActiveTileGroup;
  -[GEOActiveTileGroup description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOActiveTileGroup dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOActiveTileGroup _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  id v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t k;
  void *v30;
  id v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t m;
  void *v38;
  id v39;
  void *v40;
  const __CFString *v41;
  void *v42;
  const __CFString *v43;
  void *v44;
  const __CFString *v45;
  void *v46;
  const __CFString *v47;
  void *v48;
  const __CFString *v49;
  void *v50;
  void *v51;
  const __CFString *v52;
  void *v53;
  const __CFString *v54;
  void *v55;
  const __CFString *v56;
  void *v57;
  const __CFString *v58;
  void *v59;
  const __CFString *v60;
  void *v61;
  const __CFString *v62;
  void *v63;
  const __CFString *v64;
  void *v65;
  const __CFString *v66;
  void *v67;
  const __CFString *v68;
  void *v69;
  const __CFString *v70;
  void *v71;
  void *v72;
  const __CFString *v73;
  void *v74;
  const __CFString *v75;
  void *v76;
  void *v77;
  id v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  const __CFString *v90;
  void *v91;
  const __CFString *v92;
  void *v93;
  const __CFString *v94;
  void *v95;
  id v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t n;
  void *v101;
  id v102;
  void *v103;
  void *v104;
  uint64_t v105;
  unint64_t v106;
  id v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  const __CFString *v112;
  void *v113;
  id v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t ii;
  void *v119;
  id v120;
  void *v121;
  id v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t jj;
  void *v127;
  id v128;
  void *v129;
  void *v130;
  _QWORD *v131;
  unint64_t v132;
  uint64_t v133;
  __CFString *v134;
  void *v135;
  _QWORD *v136;
  unint64_t v137;
  uint64_t v138;
  __CFString *v139;
  void *v140;
  id v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t kk;
  void *v146;
  id v147;
  void *v148;
  void *v149;
  id v150;
  void *v151;
  const __CFString *v152;
  void *v153;
  const __CFString *v154;
  void *v155;
  const __CFString *v156;
  void *v157;
  const __CFString *v158;
  void *v159;
  const __CFString *v160;
  void *v161;
  const __CFString *v162;
  void *v163;
  const __CFString *v164;
  void *v165;
  const __CFString *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  id v173;
  void *v174;
  id v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t mm;
  void *v180;
  id v181;
  void *v182;
  void *v183;
  id v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t nn;
  void *v189;
  id v190;
  void *v191;
  id v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t i1;
  void *v197;
  id v198;
  void *v199;
  void *v200;
  id v201;
  uint64_t v202;
  uint64_t v203;
  void *v204;
  void *v205;
  id v206;
  void *v207;
  void *v208;
  id v209;
  void *v210;
  void *v211;
  void *v212;
  id v213;
  id v214;
  id v215;
  _QWORD v217[4];
  id v218;
  _QWORD v219[4];
  id v220;
  _QWORD v221[4];
  id v222;
  __int128 v223;
  __int128 v224;
  __int128 v225;
  __int128 v226;
  __int128 v227;
  __int128 v228;
  __int128 v229;
  __int128 v230;
  __int128 v231;
  __int128 v232;
  __int128 v233;
  __int128 v234;
  __int128 v235;
  __int128 v236;
  __int128 v237;
  __int128 v238;
  __int128 v239;
  __int128 v240;
  __int128 v241;
  __int128 v242;
  __int128 v243;
  __int128 v244;
  __int128 v245;
  __int128 v246;
  __int128 v247;
  __int128 v248;
  __int128 v249;
  __int128 v250;
  __int128 v251;
  __int128 v252;
  __int128 v253;
  __int128 v254;
  __int128 v255;
  __int128 v256;
  __int128 v257;
  __int128 v258;
  __int128 v259;
  __int128 v260;
  __int128 v261;
  __int128 v262;
  __int128 v263;
  __int128 v264;
  __int128 v265;
  __int128 v266;
  _BYTE v267[128];
  _BYTE v268[128];
  _BYTE v269[128];
  _BYTE v270[128];
  _BYTE v271[128];
  _BYTE v272[128];
  _BYTE v273[128];
  _BYTE v274[128];
  _BYTE v275[128];
  _BYTE v276[128];
  _BYTE v277[128];
  uint64_t v278;

  v278 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 620));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("identifier"));

  if (objc_msgSend(*(id *)(a1 + 552), "count"))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 552), "count"));
    v263 = 0u;
    v264 = 0u;
    v265 = 0u;
    v266 = 0u;
    v7 = *(id *)(a1 + 552);
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v263, v277, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v264;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v264 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v263 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v12, "jsonRepresentation");
          else
            objc_msgSend(v12, "dictionaryRepresentation");
          v13 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v6, "addObject:", v13);
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v263, v277, 16);
      }
      while (v9);
    }

    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("tileSet"));
  }
  if (*(_QWORD *)(a1 + 472))
  {
    objc_msgSend((id)a1, "resources");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("resource"));

  }
  objc_msgSend((id)a1, "uniqueIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
    objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("uniqueIdentifier"));

  if (objc_msgSend(*(id *)(a1 + 144), "count"))
  {
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 144), "count"));
    v259 = 0u;
    v260 = 0u;
    v261 = 0u;
    v262 = 0u;
    v17 = *(id *)(a1 + 144);
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v259, v276, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v260;
      do
      {
        for (j = 0; j != v19; ++j)
        {
          if (*(_QWORD *)v260 != v20)
            objc_enumerationMutation(v17);
          v22 = *(void **)(*((_QWORD *)&v259 + 1) + 8 * j);
          if ((a2 & 1) != 0)
            objc_msgSend(v22, "jsonRepresentation");
          else
            objc_msgSend(v22, "dictionaryRepresentation");
          v23 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v16, "addObject:", v23);
        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v259, v276, 16);
      }
      while (v19);
    }

    objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("attribution"));
  }
  if (objc_msgSend(*(id *)(a1 + 416), "count"))
  {
    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 416), "count"));
    v255 = 0u;
    v256 = 0u;
    v257 = 0u;
    v258 = 0u;
    v25 = *(id *)(a1 + 416);
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v255, v275, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v256;
      do
      {
        for (k = 0; k != v27; ++k)
        {
          if (*(_QWORD *)v256 != v28)
            objc_enumerationMutation(v25);
          v30 = *(void **)(*((_QWORD *)&v255 + 1) + 8 * k);
          if ((a2 & 1) != 0)
            objc_msgSend(v30, "jsonRepresentation");
          else
            objc_msgSend(v30, "dictionaryRepresentation");
          v31 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v24, "addObject:", v31);
        }
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v255, v275, 16);
      }
      while (v27);
    }

    objc_msgSend(v4, "setObject:forKey:", v24, CFSTR("regionalResourceTile"));
  }
  if (objc_msgSend(*(id *)(a1 + 408), "count"))
  {
    v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 408), "count"));
    v251 = 0u;
    v252 = 0u;
    v253 = 0u;
    v254 = 0u;
    v33 = *(id *)(a1 + 408);
    v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v251, v274, 16);
    if (v34)
    {
      v35 = v34;
      v36 = *(_QWORD *)v252;
      do
      {
        for (m = 0; m != v35; ++m)
        {
          if (*(_QWORD *)v252 != v36)
            objc_enumerationMutation(v33);
          v38 = *(void **)(*((_QWORD *)&v251 + 1) + 8 * m);
          if ((a2 & 1) != 0)
            objc_msgSend(v38, "jsonRepresentation");
          else
            objc_msgSend(v38, "dictionaryRepresentation");
          v39 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v32, "addObject:", v39);
        }
        v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v251, v274, 16);
      }
      while (v35);
    }

    objc_msgSend(v4, "setObject:forKey:", v32, CFSTR("regionalResourceRegion"));
  }
  objc_msgSend((id)a1, "regionalResourcesURLLegacy");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  if (v40)
  {
    if (a2)
      v41 = CFSTR("regionalResourcesURLLegacy");
    else
      v41 = CFSTR("regionalResourcesURL_legacy");
    objc_msgSend(v4, "setObject:forKey:", v40, v41);
  }

  objc_msgSend((id)a1, "searchAttributionManifestURLLegacy");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  if (v42)
  {
    if (a2)
      v43 = CFSTR("searchAttributionManifestURLLegacy");
    else
      v43 = CFSTR("searchAttributionManifestURL_legacy");
    objc_msgSend(v4, "setObject:forKey:", v42, v43);
  }

  objc_msgSend((id)a1, "directionsURLLegacy");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  if (v44)
  {
    if (a2)
      v45 = CFSTR("directionsURLLegacy");
    else
      v45 = CFSTR("directionsURL_legacy");
    objc_msgSend(v4, "setObject:forKey:", v44, v45);
  }

  objc_msgSend((id)a1, "etaURLLegacy");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  if (v46)
  {
    if (a2)
      v47 = CFSTR("etaURLLegacy");
    else
      v47 = CFSTR("etaURL_legacy");
    objc_msgSend(v4, "setObject:forKey:", v46, v47);
  }

  objc_msgSend((id)a1, "batchReverseGeocoderURLLegacy");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  if (v48)
  {
    if (a2)
      v49 = CFSTR("batchReverseGeocoderURLLegacy");
    else
      v49 = CFSTR("batchReverseGeocoderURL_legacy");
    objc_msgSend(v4, "setObject:forKey:", v48, v49);
  }

  objc_msgSend((id)a1, "releaseInfo");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  if (v50)
    objc_msgSend(v4, "setObject:forKey:", v50, CFSTR("releaseInfo"));

  objc_msgSend((id)a1, "resourcesURLLegacy");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  if (v51)
  {
    if (a2)
      v52 = CFSTR("resourcesURLLegacy");
    else
      v52 = CFSTR("resourcesURL_legacy");
    objc_msgSend(v4, "setObject:forKey:", v51, v52);
  }

  objc_msgSend((id)a1, "simpleETAURLLegacy");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  if (v53)
  {
    if (a2)
      v54 = CFSTR("simpleETAURLLegacy");
    else
      v54 = CFSTR("simpleETAURL_legacy");
    objc_msgSend(v4, "setObject:forKey:", v53, v54);
  }

  objc_msgSend((id)a1, "addressCorrectionInitURLLegacy");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  if (v55)
  {
    if (a2)
      v56 = CFSTR("addressCorrectionInitURLLegacy");
    else
      v56 = CFSTR("addressCorrectionInitURL_legacy");
    objc_msgSend(v4, "setObject:forKey:", v55, v56);
  }

  objc_msgSend((id)a1, "addressCorrectionUpdateURLLegacy");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  if (v57)
  {
    if (a2)
      v58 = CFSTR("addressCorrectionUpdateURLLegacy");
    else
      v58 = CFSTR("addressCorrectionUpdateURL_legacy");
    objc_msgSend(v4, "setObject:forKey:", v57, v58);
  }

  objc_msgSend((id)a1, "polyLocationShiftURLLegacy");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  if (v59)
  {
    if (a2)
      v60 = CFSTR("polyLocationShiftURLLegacy");
    else
      v60 = CFSTR("polyLocationShiftURL_legacy");
    objc_msgSend(v4, "setObject:forKey:", v59, v60);
  }

  objc_msgSend((id)a1, "problemSubmissionURLLegacy");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  if (v61)
  {
    if (a2)
      v62 = CFSTR("problemSubmissionURLLegacy");
    else
      v62 = CFSTR("problemSubmissionURL_legacy");
    objc_msgSend(v4, "setObject:forKey:", v61, v62);
  }

  objc_msgSend((id)a1, "problemStatusURLLegacy");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  if (v63)
  {
    if (a2)
      v64 = CFSTR("problemStatusURLLegacy");
    else
      v64 = CFSTR("problemStatusURL_legacy");
    objc_msgSend(v4, "setObject:forKey:", v63, v64);
  }

  objc_msgSend((id)a1, "reverseGeocoderVersionsURLLegacy");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  if (v65)
  {
    if (a2)
      v66 = CFSTR("reverseGeocoderVersionsURLLegacy");
    else
      v66 = CFSTR("reverseGeocoderVersionsURL_legacy");
    objc_msgSend(v4, "setObject:forKey:", v65, v66);
  }

  objc_msgSend((id)a1, "problemCategoriesURLLegacy");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  if (v67)
  {
    if (a2)
      v68 = CFSTR("problemCategoriesURLLegacy");
    else
      v68 = CFSTR("problemCategoriesURL_legacy");
    objc_msgSend(v4, "setObject:forKey:", v67, v68);
  }

  objc_msgSend((id)a1, "announcementsURLLegacy");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  if (v69)
  {
    if (a2)
      v70 = CFSTR("announcementsURLLegacy");
    else
      v70 = CFSTR("announcementsURL_legacy");
    objc_msgSend(v4, "setObject:forKey:", v69, v70);
  }

  if (*(_QWORD *)(a1 + 128))
  {
    objc_msgSend((id)a1, "announcementsSupportedLanguages");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v71, CFSTR("announcementsSupportedLanguages"));

  }
  objc_msgSend((id)a1, "dispatcherURLLegacy");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  if (v72)
  {
    if (a2)
      v73 = CFSTR("dispatcherURLLegacy");
    else
      v73 = CFSTR("dispatcherURL_legacy");
    objc_msgSend(v4, "setObject:forKey:", v72, v73);
  }

  objc_msgSend((id)a1, "problemOptInURLLegacy");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  if (v74)
  {
    if (a2)
      v75 = CFSTR("problemOptInURLLegacy");
    else
      v75 = CFSTR("problemOptInURL_legacy");
    objc_msgSend(v4, "setObject:forKey:", v74, v75);
  }

  objc_msgSend((id)a1, "versionManifest");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v77 = v76;
  if (v76)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v76, "jsonRepresentation");
    else
      objc_msgSend(v76, "dictionaryRepresentation");
    v78 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKey:", v78, CFSTR("versionManifest"));
  }

  if (*(_QWORD *)(a1 + 528))
  {
    objc_msgSend((id)a1, "styleSheets");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v79, CFSTR("styleSheet"));

  }
  if (*(_QWORD *)(a1 + 520))
  {
    objc_msgSend((id)a1, "styleSheetChecksums");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v80, CFSTR("styleSheetChecksum"));

  }
  if (*(_QWORD *)(a1 + 544))
  {
    objc_msgSend((id)a1, "textures");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v81, CFSTR("texture"));

  }
  if (*(_QWORD *)(a1 + 536))
  {
    objc_msgSend((id)a1, "textureChecksums");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v82, CFSTR("textureChecksum"));

  }
  if (*(_QWORD *)(a1 + 272))
  {
    objc_msgSend((id)a1, "fonts");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v83, CFSTR("font"));

  }
  if (*(_QWORD *)(a1 + 264))
  {
    objc_msgSend((id)a1, "fontChecksums");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v84, CFSTR("fontChecksum"));

  }
  if (*(_QWORD *)(a1 + 288))
  {
    objc_msgSend((id)a1, "icons");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v85, CFSTR("icon"));

  }
  if (*(_QWORD *)(a1 + 280))
  {
    objc_msgSend((id)a1, "iconChecksums");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v86, CFSTR("iconChecksum"));

  }
  if (*(_QWORD *)(a1 + 600))
  {
    objc_msgSend((id)a1, "xmls");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v87, CFSTR("xml"));

  }
  if (*(_QWORD *)(a1 + 592))
  {
    objc_msgSend((id)a1, "xmlChecksums");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v88, CFSTR("xmlChecksum"));

  }
  objc_msgSend((id)a1, "abExperimentURLLegacy");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  if (v89)
  {
    if (a2)
      v90 = CFSTR("abExperimentURLLegacy");
    else
      v90 = CFSTR("abExperimentURL_legacy");
    objc_msgSend(v4, "setObject:forKey:", v89, v90);
  }

  objc_msgSend((id)a1, "businessPortalBaseURLLegacy");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  if (v91)
  {
    if (a2)
      v92 = CFSTR("businessPortalBaseURLLegacy");
    else
      v92 = CFSTR("businessPortalBaseURL_legacy");
    objc_msgSend(v4, "setObject:forKey:", v91, v92);
  }

  objc_msgSend((id)a1, "logMessageUsageURLLegacy");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  if (v93)
  {
    if (a2)
      v94 = CFSTR("logMessageUsageURLLegacy");
    else
      v94 = CFSTR("logMessageUsageURL_legacy");
    objc_msgSend(v4, "setObject:forKey:", v93, v94);
  }

  if (objc_msgSend(*(id *)(a1 + 296), "count"))
  {
    v95 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 296), "count"));
    v247 = 0u;
    v248 = 0u;
    v249 = 0u;
    v250 = 0u;
    v96 = *(id *)(a1 + 296);
    v97 = objc_msgSend(v96, "countByEnumeratingWithState:objects:count:", &v247, v273, 16);
    if (v97)
    {
      v98 = v97;
      v99 = *(_QWORD *)v248;
      do
      {
        for (n = 0; n != v98; ++n)
        {
          if (*(_QWORD *)v248 != v99)
            objc_enumerationMutation(v96);
          v101 = *(void **)(*((_QWORD *)&v247 + 1) + 8 * n);
          if ((a2 & 1) != 0)
            objc_msgSend(v101, "jsonRepresentation");
          else
            objc_msgSend(v101, "dictionaryRepresentation");
          v102 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v95, "addObject:", v102);
        }
        v98 = objc_msgSend(v96, "countByEnumeratingWithState:objects:count:", &v247, v273, 16);
      }
      while (v98);
    }

    objc_msgSend(v4, "setObject:forKey:", v95, CFSTR("locationShiftEnabledRegion"));
  }
  if ((*(_QWORD *)(a1 + 632) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 624));
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v103, CFSTR("locationShiftVersion"));

  }
  if (*(_QWORD *)(a1 + 80))
  {
    v104 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", *(_QWORD *)(a1 + 80));
    if (*(_QWORD *)(a1 + 80))
    {
      v105 = 0;
      v106 = 0;
      do
      {
        _GEOTileSetRegionDictionaryRepresentation((unsigned int *)(*(_QWORD *)(a1 + 72) + v105));
        v107 = (id)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v104, "addObject:", v107);
        ++v106;
        v105 += 24;
      }
      while (v106 < *(_QWORD *)(a1 + 80));
    }
    objc_msgSend(v4, "setObject:forKey:", v104, CFSTR("hybridUnavailableRegion"));

  }
  objc_msgSend((id)a1, "reserved");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  v109 = v108;
  if (v108)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v108, "base64EncodedStringWithOptions:", 0);
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v110, CFSTR("reserved"));

    }
    else
    {
      objc_msgSend(v4, "setObject:forKey:", v108, CFSTR("reserved"));
    }
  }

  objc_msgSend((id)a1, "spatialLookupURLLegacy");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  if (v111)
  {
    if (a2)
      v112 = CFSTR("spatialLookupURLLegacy");
    else
      v112 = CFSTR("spatialLookupURL_legacy");
    objc_msgSend(v4, "setObject:forKey:", v111, v112);
  }

  if (objc_msgSend(*(id *)(a1 + 104), "count"))
  {
    v113 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 104), "count"));
    v243 = 0u;
    v244 = 0u;
    v245 = 0u;
    v246 = 0u;
    v114 = *(id *)(a1 + 104);
    v115 = objc_msgSend(v114, "countByEnumeratingWithState:objects:count:", &v243, v272, 16);
    if (v115)
    {
      v116 = v115;
      v117 = *(_QWORD *)v244;
      do
      {
        for (ii = 0; ii != v116; ++ii)
        {
          if (*(_QWORD *)v244 != v117)
            objc_enumerationMutation(v114);
          v119 = *(void **)(*((_QWORD *)&v243 + 1) + 8 * ii);
          if ((a2 & 1) != 0)
            objc_msgSend(v119, "jsonRepresentation");
          else
            objc_msgSend(v119, "dictionaryRepresentation");
          v120 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v113, "addObject:", v120);
        }
        v116 = objc_msgSend(v114, "countByEnumeratingWithState:objects:count:", &v243, v272, 16);
      }
      while (v116);
    }

    objc_msgSend(v4, "setObject:forKey:", v113, CFSTR("activeResource"));
  }
  if (objc_msgSend(*(id *)(a1 + 432), "count"))
  {
    v121 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 432), "count"));
    v239 = 0u;
    v240 = 0u;
    v241 = 0u;
    v242 = 0u;
    v122 = *(id *)(a1 + 432);
    v123 = objc_msgSend(v122, "countByEnumeratingWithState:objects:count:", &v239, v271, 16);
    if (v123)
    {
      v124 = v123;
      v125 = *(_QWORD *)v240;
      do
      {
        for (jj = 0; jj != v124; ++jj)
        {
          if (*(_QWORD *)v240 != v125)
            objc_enumerationMutation(v122);
          v127 = *(void **)(*((_QWORD *)&v239 + 1) + 8 * jj);
          if ((a2 & 1) != 0)
            objc_msgSend(v127, "jsonRepresentation");
          else
            objc_msgSend(v127, "dictionaryRepresentation");
          v128 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v121, "addObject:", v128);
        }
        v124 = objc_msgSend(v122, "countByEnumeratingWithState:objects:count:", &v239, v271, 16);
      }
      while (v124);
    }

    objc_msgSend(v4, "setObject:forKey:", v121, CFSTR("regionalResource"));
  }
  if ((*(_QWORD *)(a1 + 632) & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 628));
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v129, CFSTR("modelVersion"));

  }
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    v131 = (_QWORD *)(a1 + 24);
    if (*(_QWORD *)(a1 + 32))
    {
      v132 = 0;
      do
      {
        v133 = *(int *)(*v131 + 4 * v132);
        if (v133 >= 4)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v133);
          v134 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v134 = off_1E1C07DD8[v133];
        }
        objc_msgSend(v130, "addObject:", v134);

        ++v132;
        v131 = (_QWORD *)(a1 + 24);
      }
      while (v132 < *(_QWORD *)(a1 + 32));
    }
    objc_msgSend(v4, "setObject:forKey:", v130, CFSTR("activeScale"));

  }
  if (*(_QWORD *)(a1 + 56))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    v136 = (_QWORD *)(a1 + 48);
    if (*(_QWORD *)(a1 + 56))
    {
      v137 = 0;
      do
      {
        v138 = *(int *)(*v136 + 4 * v137);
        if (v138 >= 5)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v138);
          v139 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v139 = off_1E1C07DF8[v138];
        }
        objc_msgSend(v135, "addObject:", v139);

        ++v137;
        v136 = (_QWORD *)(a1 + 48);
      }
      while (v137 < *(_QWORD *)(a1 + 56));
    }
    objc_msgSend(v4, "setObject:forKey:", v135, CFSTR("activeScenario"));

  }
  if (objc_msgSend(*(id *)(a1 + 512), "count"))
  {
    v140 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 512), "count"));
    v235 = 0u;
    v236 = 0u;
    v237 = 0u;
    v238 = 0u;
    v141 = *(id *)(a1 + 512);
    v142 = objc_msgSend(v141, "countByEnumeratingWithState:objects:count:", &v235, v270, 16);
    if (v142)
    {
      v143 = v142;
      v144 = *(_QWORD *)v236;
      do
      {
        for (kk = 0; kk != v143; ++kk)
        {
          if (*(_QWORD *)v236 != v144)
            objc_enumerationMutation(v141);
          v146 = *(void **)(*((_QWORD *)&v235 + 1) + 8 * kk);
          if ((a2 & 1) != 0)
            objc_msgSend(v146, "jsonRepresentation");
          else
            objc_msgSend(v146, "dictionaryRepresentation");
          v147 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v140, "addObject:", v147);
        }
        v143 = objc_msgSend(v141, "countByEnumeratingWithState:objects:count:", &v235, v270, 16);
      }
      while (v143);
    }

    objc_msgSend(v4, "setObject:forKey:", v140, CFSTR("staleResource"));
  }
  objc_msgSend((id)a1, "dataSet");
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  v149 = v148;
  if (v148)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v148, "jsonRepresentation");
    else
      objc_msgSend(v148, "dictionaryRepresentation");
    v150 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKey:", v150, CFSTR("dataSet"));
  }

  objc_msgSend((id)a1, "realtimeTrafficProbeURLLegacy");
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  if (v151)
  {
    if (a2)
      v152 = CFSTR("realtimeTrafficProbeURLLegacy");
    else
      v152 = CFSTR("realtimeTrafficProbeURL_legacy");
    objc_msgSend(v4, "setObject:forKey:", v151, v152);
  }

  objc_msgSend((id)a1, "batchTrafficProbeURLLegacy");
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  if (v153)
  {
    if (a2)
      v154 = CFSTR("batchTrafficProbeURLLegacy");
    else
      v154 = CFSTR("batchTrafficProbeURL_legacy");
    objc_msgSend(v4, "setObject:forKey:", v153, v154);
  }

  objc_msgSend((id)a1, "logMessageUsageV3URLLegacy");
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  if (v155)
  {
    if (a2)
      v156 = CFSTR("logMessageUsageV3URLLegacy");
    else
      v156 = CFSTR("logMessageUsageV3URL_legacy");
    objc_msgSend(v4, "setObject:forKey:", v155, v156);
  }

  objc_msgSend((id)a1, "proactiveRoutingURLLegacy");
  v157 = (void *)objc_claimAutoreleasedReturnValue();
  if (v157)
  {
    if (a2)
      v158 = CFSTR("proactiveRoutingURLLegacy");
    else
      v158 = CFSTR("proactiveRoutingURL_legacy");
    objc_msgSend(v4, "setObject:forKey:", v157, v158);
  }

  objc_msgSend((id)a1, "backgroundDispatcherURLLegacy");
  v159 = (void *)objc_claimAutoreleasedReturnValue();
  if (v159)
  {
    if (a2)
      v160 = CFSTR("backgroundDispatcherURLLegacy");
    else
      v160 = CFSTR("backgroundDispatcherURL_legacy");
    objc_msgSend(v4, "setObject:forKey:", v159, v160);
  }

  objc_msgSend((id)a1, "bluePOIURLLegacy");
  v161 = (void *)objc_claimAutoreleasedReturnValue();
  if (v161)
  {
    if (a2)
      v162 = CFSTR("bluePOIURLLegacy");
    else
      v162 = CFSTR("bluePOIURL_legacy");
    objc_msgSend(v4, "setObject:forKey:", v161, v162);
  }

  objc_msgSend((id)a1, "backgroundRevGeoURLLegacy");
  v163 = (void *)objc_claimAutoreleasedReturnValue();
  if (v163)
  {
    if (a2)
      v164 = CFSTR("backgroundRevGeoURLLegacy");
    else
      v164 = CFSTR("backgroundRevGeoURL_legacy");
    objc_msgSend(v4, "setObject:forKey:", v163, v164);
  }

  objc_msgSend((id)a1, "wifiConnectionQualityProbeURLLegacy");
  v165 = (void *)objc_claimAutoreleasedReturnValue();
  if (v165)
  {
    if (a2)
      v166 = CFSTR("wifiConnectionQualityProbeURLLegacy");
    else
      v166 = CFSTR("wifiConnectionQualityProbeURL_legacy");
    objc_msgSend(v4, "setObject:forKey:", v165, v166);
  }

  objc_msgSend((id)a1, "muninBaseURL");
  v167 = (void *)objc_claimAutoreleasedReturnValue();
  if (v167)
    objc_msgSend(v4, "setObject:forKey:", v167, CFSTR("muninBaseURL"));

  objc_msgSend((id)a1, "flyoverRegionVersions");
  v168 = (void *)objc_claimAutoreleasedReturnValue();
  v169 = v168;
  if (v168)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v168, "base64EncodedStringWithOptions:", 0);
      v170 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v170, CFSTR("flyoverRegionVersions"));

    }
    else
    {
      objc_msgSend(v4, "setObject:forKey:", v168, CFSTR("flyoverRegionVersions"));
    }
  }

  objc_msgSend((id)a1, "urlInfoSet");
  v171 = (void *)objc_claimAutoreleasedReturnValue();
  v172 = v171;
  if (v171)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v171, "jsonRepresentation");
    else
      objc_msgSend(v171, "dictionaryRepresentation");
    v173 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKey:", v173, CFSTR("urlInfoSet"));
  }

  if (objc_msgSend(*(id *)(a1 + 328), "count"))
  {
    v174 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 328), "count"));
    v231 = 0u;
    v232 = 0u;
    v233 = 0u;
    v234 = 0u;
    v175 = *(id *)(a1 + 328);
    v176 = objc_msgSend(v175, "countByEnumeratingWithState:objects:count:", &v231, v269, 16);
    if (v176)
    {
      v177 = v176;
      v178 = *(_QWORD *)v232;
      do
      {
        for (mm = 0; mm != v177; ++mm)
        {
          if (*(_QWORD *)v232 != v178)
            objc_enumerationMutation(v175);
          v180 = *(void **)(*((_QWORD *)&v231 + 1) + 8 * mm);
          if ((a2 & 1) != 0)
            objc_msgSend(v180, "jsonRepresentation");
          else
            objc_msgSend(v180, "dictionaryRepresentation");
          v181 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v174, "addObject:", v181);
        }
        v177 = objc_msgSend(v175, "countByEnumeratingWithState:objects:count:", &v231, v269, 16);
      }
      while (v177);
    }

    objc_msgSend(v4, "setObject:forKey:", v174, CFSTR("muninBucket"));
  }
  objc_msgSend((id)a1, "environment");
  v182 = (void *)objc_claimAutoreleasedReturnValue();
  if (v182)
    objc_msgSend(v4, "setObject:forKey:", v182, CFSTR("environment"));

  if (objc_msgSend(*(id *)(a1 + 224), "count"))
  {
    v183 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 224), "count"));
    v227 = 0u;
    v228 = 0u;
    v229 = 0u;
    v230 = 0u;
    v184 = *(id *)(a1 + 224);
    v185 = objc_msgSend(v184, "countByEnumeratingWithState:objects:count:", &v227, v268, 16);
    if (v185)
    {
      v186 = v185;
      v187 = *(_QWORD *)v228;
      do
      {
        for (nn = 0; nn != v186; ++nn)
        {
          if (*(_QWORD *)v228 != v187)
            objc_enumerationMutation(v184);
          v189 = *(void **)(*((_QWORD *)&v227 + 1) + 8 * nn);
          if ((a2 & 1) != 0)
            objc_msgSend(v189, "jsonRepresentation");
          else
            objc_msgSend(v189, "dictionaryRepresentation");
          v190 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v183, "addObject:", v190);
        }
        v186 = objc_msgSend(v184, "countByEnumeratingWithState:objects:count:", &v227, v268, 16);
      }
      while (v186);
    }

    objc_msgSend(v4, "setObject:forKey:", v183, CFSTR("displayStrings"));
  }
  if (objc_msgSend(*(id *)(a1 + 248), "count"))
  {
    v191 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 248), "count"));
    v223 = 0u;
    v224 = 0u;
    v225 = 0u;
    v226 = 0u;
    v192 = *(id *)(a1 + 248);
    v193 = objc_msgSend(v192, "countByEnumeratingWithState:objects:count:", &v223, v267, 16);
    if (v193)
    {
      v194 = v193;
      v195 = *(_QWORD *)v224;
      do
      {
        for (i1 = 0; i1 != v194; ++i1)
        {
          if (*(_QWORD *)v224 != v195)
            objc_enumerationMutation(v192);
          v197 = *(void **)(*((_QWORD *)&v223 + 1) + 8 * i1);
          if ((a2 & 1) != 0)
            objc_msgSend(v197, "jsonRepresentation");
          else
            objc_msgSend(v197, "dictionaryRepresentation");
          v198 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v191, "addObject:", v198);
        }
        v194 = objc_msgSend(v192, "countByEnumeratingWithState:objects:count:", &v223, v267, 16);
      }
      while (v194);
    }

    objc_msgSend(v4, "setObject:forKey:", v191, CFSTR("explicitResource"));
  }
  objc_msgSend((id)a1, "offlineMetadata");
  v199 = (void *)objc_claimAutoreleasedReturnValue();
  v200 = v199;
  if (v199)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v199, "jsonRepresentation");
    else
      objc_msgSend(v199, "dictionaryRepresentation");
    v201 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKey:", v201, CFSTR("offlineMetadata"));
  }

  v202 = objc_msgSend(*(id *)(a1 + 456), "count");
  v203 = MEMORY[0x1E0C809B0];
  if (v202)
  {
    v204 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 456), "count"));
    v205 = *(void **)(a1 + 456);
    v221[0] = v203;
    v221[1] = 3221225472;
    v221[2] = __48__GEOActiveTileGroup__dictionaryRepresentation___block_invoke;
    v221[3] = &unk_1E1C07D90;
    v206 = v204;
    v222 = v206;
    objc_msgSend(v205, "enumerateKeysAndObjectsUsingBlock:", v221);
    objc_msgSend(v4, "setObject:forKey:", v206, CFSTR("resourceCanonicalNameToFileName"));

  }
  if (objc_msgSend(*(id *)(a1 + 400), "count"))
  {
    v207 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 400), "count"));
    v208 = *(void **)(a1 + 400);
    v219[0] = v203;
    v219[1] = 3221225472;
    v219[2] = __48__GEOActiveTileGroup__dictionaryRepresentation___block_invoke_2;
    v219[3] = &unk_1E1C07D90;
    v209 = v207;
    v220 = v209;
    objc_msgSend(v208, "enumerateKeysAndObjectsUsingBlock:", v219);
    objc_msgSend(v4, "setObject:forKey:", v209, CFSTR("regionalResourceCanonicalNameToFileName"));

  }
  v210 = *(void **)(a1 + 16);
  if (v210)
  {
    objc_msgSend(v210, "dictionaryRepresentation");
    v211 = (void *)objc_claimAutoreleasedReturnValue();
    v212 = v211;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v211, "count"));
      v217[0] = v203;
      v217[1] = 3221225472;
      v217[2] = __48__GEOActiveTileGroup__dictionaryRepresentation___block_invoke_3;
      v217[3] = &unk_1E1C00600;
      v213 = (id)objc_claimAutoreleasedReturnValue();
      v218 = v213;
      objc_msgSend(v212, "enumerateKeysAndObjectsUsingBlock:", v217);
      v214 = v213;

      v212 = v214;
    }
    objc_msgSend(v4, "setObject:forKey:", v212, CFSTR("Unknown Fields"));

  }
  v215 = v4;

  return v215;
}

- (id)jsonRepresentation
{
  return -[GEOActiveTileGroup _dictionaryRepresentation:]((uint64_t)self, 1);
}

uint64_t __48__GEOActiveTileGroup__dictionaryRepresentation___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", a3, a2);
}

uint64_t __48__GEOActiveTileGroup__dictionaryRepresentation___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", a3, a2);
}

void __48__GEOActiveTileGroup__dictionaryRepresentation___block_invoke_3(uint64_t a1, void *a2, void *a3)
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

- (GEOActiveTileGroup)initWithDictionary:(id)a3
{
  return (GEOActiveTileGroup *)-[GEOActiveTileGroup _initWithDictionary:isJSON:]();
}

- (id)_initWithDictionary:isJSON:
{
  uint64_t v0;
  int v1;
  id *v2;
  id v3;
  id v4;
  id *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  GEOActiveTileSet *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t k;
  uint64_t v33;
  GEOAttribution *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t m;
  uint64_t v43;
  GEORegionalResourceTile *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t n;
  uint64_t v53;
  GEORegionalResourceRegion *v54;
  uint64_t v55;
  void *v56;
  const __CFString *v57;
  void *v58;
  void *v59;
  const __CFString *v60;
  void *v61;
  void *v62;
  const __CFString *v63;
  void *v64;
  void *v65;
  const __CFString *v66;
  void *v67;
  void *v68;
  const __CFString *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  const __CFString *v74;
  void *v75;
  void *v76;
  const __CFString *v77;
  void *v78;
  void *v79;
  const __CFString *v80;
  void *v81;
  void *v82;
  const __CFString *v83;
  void *v84;
  void *v85;
  const __CFString *v86;
  void *v87;
  void *v88;
  const __CFString *v89;
  void *v90;
  void *v91;
  const __CFString *v92;
  void *v93;
  void *v94;
  const __CFString *v95;
  void *v96;
  void *v97;
  const __CFString *v98;
  void *v99;
  void *v100;
  const __CFString *v101;
  void *v102;
  void *v103;
  void *v104;
  id v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t ii;
  void *v110;
  void *v111;
  const __CFString *v112;
  void *v113;
  void *v114;
  const __CFString *v115;
  void *v116;
  void *v117;
  void *v118;
  GEOVersionManifest *v119;
  uint64_t v120;
  void *v121;
  void *v122;
  id v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t jj;
  void *v128;
  void *v129;
  void *v130;
  id v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t kk;
  void *v136;
  void *v137;
  void *v138;
  id v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t mm;
  void *v144;
  void *v145;
  void *v146;
  id v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t nn;
  void *v152;
  void *v153;
  void *v154;
  id v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t i1;
  void *v160;
  void *v161;
  void *v162;
  id v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t i2;
  void *v168;
  void *v169;
  void *v170;
  id v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t i3;
  void *v176;
  void *v177;
  void *v178;
  id v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t i4;
  void *v184;
  void *v185;
  void *v186;
  id v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t i5;
  void *v192;
  void *v193;
  void *v194;
  id v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t i6;
  void *v200;
  void *v201;
  const __CFString *v202;
  void *v203;
  void *v204;
  const __CFString *v205;
  void *v206;
  void *v207;
  const __CFString *v208;
  void *v209;
  void *v210;
  void *v211;
  id v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t i7;
  uint64_t v217;
  GEOMapRegion *v218;
  uint64_t v219;
  void *v220;
  void *v221;
  void *v222;
  id v223;
  uint64_t v224;
  uint64_t v225;
  uint64_t v226;
  uint64_t i8;
  void *v228;
  void *v229;
  void *v230;
  const __CFString *v231;
  void *v232;
  void *v233;
  void *v234;
  id v235;
  uint64_t v236;
  uint64_t v237;
  uint64_t v238;
  uint64_t i9;
  uint64_t v240;
  GEOResource *v241;
  uint64_t v242;
  void *v243;
  void *v244;
  id v245;
  uint64_t v246;
  uint64_t v247;
  uint64_t v248;
  uint64_t i10;
  uint64_t v250;
  GEORegionalResourceSet *v251;
  uint64_t v252;
  void *v253;
  void *v254;
  void *v255;
  id v256;
  uint64_t v257;
  uint64_t v258;
  uint64_t v259;
  uint64_t i11;
  void *v261;
  id v262;
  uint64_t v263;
  void *v264;
  id v265;
  uint64_t v266;
  uint64_t v267;
  uint64_t v268;
  uint64_t i12;
  void *v270;
  id v271;
  uint64_t v272;
  void *v273;
  id v274;
  uint64_t v275;
  uint64_t v276;
  uint64_t v277;
  uint64_t i13;
  uint64_t v279;
  GEOStaleResource *v280;
  uint64_t v281;
  void *v282;
  void *v283;
  GEODataSetDescription *v284;
  uint64_t v285;
  void *v286;
  const __CFString *v287;
  void *v288;
  void *v289;
  const __CFString *v290;
  void *v291;
  void *v292;
  const __CFString *v293;
  void *v294;
  void *v295;
  const __CFString *v296;
  void *v297;
  void *v298;
  const __CFString *v299;
  void *v300;
  void *v301;
  const __CFString *v302;
  void *v303;
  void *v304;
  const __CFString *v305;
  void *v306;
  void *v307;
  const __CFString *v308;
  void *v309;
  void *v310;
  void *v311;
  void *v312;
  void *v313;
  void *v314;
  void *v315;
  GEOURLInfoSet *v316;
  uint64_t v317;
  void *v318;
  void *v319;
  id v320;
  uint64_t v321;
  uint64_t v322;
  uint64_t v323;
  uint64_t i14;
  uint64_t v325;
  GEOMuninBucket *v326;
  uint64_t v327;
  void *v328;
  void *v329;
  void *v330;
  void *v331;
  id v332;
  uint64_t v333;
  uint64_t v334;
  uint64_t v335;
  uint64_t i15;
  uint64_t v337;
  GEODisplayString *v338;
  uint64_t v339;
  void *v340;
  void *v341;
  id v342;
  uint64_t v343;
  uint64_t v344;
  uint64_t v345;
  uint64_t i16;
  uint64_t v347;
  GEOResource *v348;
  uint64_t v349;
  void *v350;
  void *v351;
  GEOOfflineMetadata *v352;
  uint64_t v353;
  void *v354;
  void *v355;
  uint64_t v356;
  id v357;
  id v358;
  uint64_t v359;
  uint64_t v360;
  uint64_t v361;
  uint64_t i17;
  uint64_t v363;
  void *v364;
  void *v365;
  uint64_t v366;
  id v367;
  id v368;
  uint64_t v369;
  uint64_t v370;
  uint64_t v371;
  uint64_t i18;
  uint64_t v373;
  void *v374;
  void *v376;
  id v377;
  int v378;
  __int128 v379;
  __int128 v380;
  __int128 v381;
  __int128 v382;
  __int128 v383;
  __int128 v384;
  __int128 v385;
  __int128 v386;
  __int128 v387;
  __int128 v388;
  __int128 v389;
  __int128 v390;
  __int128 v391;
  __int128 v392;
  __int128 v393;
  __int128 v394;
  __int128 v395;
  __int128 v396;
  __int128 v397;
  __int128 v398;
  __int128 v399;
  __int128 v400;
  __int128 v401;
  __int128 v402;
  __int128 v403;
  __int128 v404;
  __int128 v405;
  __int128 v406;
  __int128 v407;
  __int128 v408;
  __int128 v409;
  __int128 v410;
  __int128 v411;
  __int128 v412;
  __int128 v413;
  __int128 v414;
  __int128 v415;
  __int128 v416;
  __int128 v417;
  __int128 v418;
  __int128 v419;
  uint64_t v420;
  __int128 v421;
  uint64_t v422;
  __int128 v423;
  __int128 v424;
  __int128 v425;
  __int128 v426;
  __int128 v427;
  __int128 v428;
  __int128 v429;
  __int128 v430;
  __int128 v431;
  __int128 v432;
  __int128 v433;
  __int128 v434;
  __int128 v435;
  __int128 v436;
  __int128 v437;
  __int128 v438;
  __int128 v439;
  __int128 v440;
  __int128 v441;
  __int128 v442;
  __int128 v443;
  __int128 v444;
  __int128 v445;
  __int128 v446;
  __int128 v447;
  __int128 v448;
  __int128 v449;
  __int128 v450;
  __int128 v451;
  __int128 v452;
  __int128 v453;
  __int128 v454;
  __int128 v455;
  __int128 v456;
  __int128 v457;
  __int128 v458;
  __int128 v459;
  __int128 v460;
  __int128 v461;
  __int128 v462;
  __int128 v463;
  __int128 v464;
  __int128 v465;
  __int128 v466;
  __int128 v467;
  __int128 v468;
  __int128 v469;
  __int128 v470;
  __int128 v471;
  __int128 v472;
  __int128 v473;
  __int128 v474;
  __int128 v475;
  __int128 v476;
  __int128 v477;
  __int128 v478;
  __int128 v479;
  __int128 v480;
  __int128 v481;
  __int128 v482;
  __int128 v483;
  __int128 v484;
  __int128 v485;
  __int128 v486;
  __int128 v487;
  __int128 v488;
  __int128 v489;
  __int128 v490;
  __int128 v491;
  __int128 v492;
  __int128 v493;
  __int128 v494;
  _BYTE v495[128];
  _BYTE v496[128];
  _BYTE v497[128];
  _BYTE v498[128];
  _BYTE v499[128];
  _BYTE v500[128];
  _BYTE v501[128];
  _BYTE v502[128];
  _BYTE v503[128];
  _BYTE v504[128];
  _BYTE v505[128];
  _BYTE v506[128];
  _BYTE v507[128];
  _BYTE v508[128];
  _BYTE v509[128];
  _BYTE v510[128];
  _BYTE v511[128];
  _BYTE v512[128];
  _BYTE v513[128];
  _BYTE v514[128];
  _BYTE v515[128];
  _BYTE v516[128];
  _BYTE v517[128];
  _BYTE v518[128];
  _BYTE v519[128];
  _BYTE v520[128];
  _BYTE v521[128];
  _BYTE v522[128];
  uint64_t v523;

  v0 = MEMORY[0x1E0C80A78]();
  v378 = v1;
  v2 = (id *)v0;
  v523 = *MEMORY[0x1E0C80C00];
  v4 = v3;
  if (!v2)
    goto LABEL_551;
  v5 = objc_msgSend(v2, "init");

  if (!v5)
  {
    v2 = 0;
    goto LABEL_551;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("identifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v5, "setIdentifier:", objc_msgSend(v6, "unsignedIntValue"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("tileSet"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v494 = 0u;
    v493 = 0u;
    v492 = 0u;
    v491 = 0u;
    v8 = v7;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v491, v522, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v492;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v492 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v491 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v14 = [GEOActiveTileSet alloc];
            if ((v378 & 1) != 0)
              v15 = -[GEOActiveTileSet initWithJSON:](v14, "initWithJSON:", v13);
            else
              v15 = -[GEOActiveTileSet initWithDictionary:](v14, "initWithDictionary:", v13);
            v16 = (void *)v15;
            objc_msgSend(v5, "addTileSet:", v15);

          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v491, v522, 16);
      }
      while (v10);
    }

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("resource"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v490 = 0u;
    v489 = 0u;
    v488 = 0u;
    v487 = 0u;
    v18 = v17;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v487, v521, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v488;
      do
      {
        for (j = 0; j != v20; ++j)
        {
          if (*(_QWORD *)v488 != v21)
            objc_enumerationMutation(v18);
          v23 = *(void **)(*((_QWORD *)&v487 + 1) + 8 * j);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v24 = (void *)objc_msgSend(v23, "copy");
            objc_msgSend(v5, "addResource:", v24);

          }
        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v487, v521, 16);
      }
      while (v20);
    }

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("uniqueIdentifier"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v26 = (void *)objc_msgSend(v25, "copy");
    objc_msgSend(v5, "setUniqueIdentifier:", v26);

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("attribution"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v377 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v486 = 0u;
    v485 = 0u;
    v484 = 0u;
    v483 = 0u;
    v28 = v27;
    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v483, v520, 16);
    if (v29)
    {
      v30 = v29;
      v31 = *(_QWORD *)v484;
      do
      {
        for (k = 0; k != v30; ++k)
        {
          if (*(_QWORD *)v484 != v31)
            objc_enumerationMutation(v28);
          v33 = *(_QWORD *)(*((_QWORD *)&v483 + 1) + 8 * k);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v34 = [GEOAttribution alloc];
            if ((v378 & 1) != 0)
              v35 = -[GEOAttribution initWithJSON:](v34, "initWithJSON:", v33);
            else
              v35 = -[GEOAttribution initWithDictionary:](v34, "initWithDictionary:", v33);
            v36 = (void *)v35;
            objc_msgSend(v5, "addAttribution:", v35);

          }
        }
        v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v483, v520, 16);
      }
      while (v30);
    }

    v4 = v377;
  }

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("regionalResourceTile"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v482 = 0u;
    v481 = 0u;
    v480 = 0u;
    v479 = 0u;
    v38 = v37;
    v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v479, v519, 16);
    if (v39)
    {
      v40 = v39;
      v41 = *(_QWORD *)v480;
      do
      {
        for (m = 0; m != v40; ++m)
        {
          if (*(_QWORD *)v480 != v41)
            objc_enumerationMutation(v38);
          v43 = *(_QWORD *)(*((_QWORD *)&v479 + 1) + 8 * m);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v44 = [GEORegionalResourceTile alloc];
            if ((v378 & 1) != 0)
              v45 = -[GEORegionalResourceTile initWithJSON:](v44, "initWithJSON:", v43);
            else
              v45 = -[GEORegionalResourceTile initWithDictionary:](v44, "initWithDictionary:", v43);
            v46 = (void *)v45;
            objc_msgSend(v5, "addRegionalResourceTile:", v45);

          }
        }
        v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v479, v519, 16);
      }
      while (v40);
    }

    v4 = v377;
  }

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("regionalResourceRegion"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v478 = 0u;
    v477 = 0u;
    v476 = 0u;
    v475 = 0u;
    v48 = v47;
    v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v475, v518, 16);
    if (v49)
    {
      v50 = v49;
      v51 = *(_QWORD *)v476;
      do
      {
        for (n = 0; n != v50; ++n)
        {
          if (*(_QWORD *)v476 != v51)
            objc_enumerationMutation(v48);
          v53 = *(_QWORD *)(*((_QWORD *)&v475 + 1) + 8 * n);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v54 = [GEORegionalResourceRegion alloc];
            if ((v378 & 1) != 0)
              v55 = -[GEORegionalResourceRegion initWithJSON:](v54, "initWithJSON:", v53);
            else
              v55 = -[GEORegionalResourceRegion initWithDictionary:](v54, "initWithDictionary:", v53);
            v56 = (void *)v55;
            objc_msgSend(v5, "addRegionalResourceRegion:", v55);

          }
        }
        v50 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v475, v518, 16);
      }
      while (v50);
    }

    v4 = v377;
  }

  if (v378)
    v57 = CFSTR("regionalResourcesURLLegacy");
  else
    v57 = CFSTR("regionalResourcesURL_legacy");
  objc_msgSend(v4, "objectForKeyedSubscript:", v57);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v59 = (void *)objc_msgSend(v58, "copy");
    objc_msgSend(v5, "setRegionalResourcesURLLegacy:", v59);

  }
  if (v378)
    v60 = CFSTR("searchAttributionManifestURLLegacy");
  else
    v60 = CFSTR("searchAttributionManifestURL_legacy");
  objc_msgSend(v4, "objectForKeyedSubscript:", v60);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v62 = (void *)objc_msgSend(v61, "copy");
    objc_msgSend(v5, "setSearchAttributionManifestURLLegacy:", v62);

  }
  if (v378)
    v63 = CFSTR("directionsURLLegacy");
  else
    v63 = CFSTR("directionsURL_legacy");
  objc_msgSend(v4, "objectForKeyedSubscript:", v63);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v65 = (void *)objc_msgSend(v64, "copy");
    objc_msgSend(v5, "setDirectionsURLLegacy:", v65);

  }
  if (v378)
    v66 = CFSTR("etaURLLegacy");
  else
    v66 = CFSTR("etaURL_legacy");
  objc_msgSend(v4, "objectForKeyedSubscript:", v66);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v68 = (void *)objc_msgSend(v67, "copy");
    objc_msgSend(v5, "setEtaURLLegacy:", v68);

  }
  if (v378)
    v69 = CFSTR("batchReverseGeocoderURLLegacy");
  else
    v69 = CFSTR("batchReverseGeocoderURL_legacy");
  objc_msgSend(v4, "objectForKeyedSubscript:", v69);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v71 = (void *)objc_msgSend(v70, "copy");
    objc_msgSend(v5, "setBatchReverseGeocoderURLLegacy:", v71);

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("releaseInfo"));
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v73 = (void *)objc_msgSend(v72, "copy");
    objc_msgSend(v5, "setReleaseInfo:", v73);

  }
  if (v378)
    v74 = CFSTR("resourcesURLLegacy");
  else
    v74 = CFSTR("resourcesURL_legacy");
  objc_msgSend(v4, "objectForKeyedSubscript:", v74);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v76 = (void *)objc_msgSend(v75, "copy");
    objc_msgSend(v5, "setResourcesURLLegacy:", v76);

  }
  if (v378)
    v77 = CFSTR("simpleETAURLLegacy");
  else
    v77 = CFSTR("simpleETAURL_legacy");
  objc_msgSend(v4, "objectForKeyedSubscript:", v77);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v79 = (void *)objc_msgSend(v78, "copy");
    objc_msgSend(v5, "setSimpleETAURLLegacy:", v79);

  }
  if (v378)
    v80 = CFSTR("addressCorrectionInitURLLegacy");
  else
    v80 = CFSTR("addressCorrectionInitURL_legacy");
  objc_msgSend(v4, "objectForKeyedSubscript:", v80);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v82 = (void *)objc_msgSend(v81, "copy");
    objc_msgSend(v5, "setAddressCorrectionInitURLLegacy:", v82);

  }
  if (v378)
    v83 = CFSTR("addressCorrectionUpdateURLLegacy");
  else
    v83 = CFSTR("addressCorrectionUpdateURL_legacy");
  objc_msgSend(v4, "objectForKeyedSubscript:", v83);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v85 = (void *)objc_msgSend(v84, "copy");
    objc_msgSend(v5, "setAddressCorrectionUpdateURLLegacy:", v85);

  }
  if (v378)
    v86 = CFSTR("polyLocationShiftURLLegacy");
  else
    v86 = CFSTR("polyLocationShiftURL_legacy");
  objc_msgSend(v4, "objectForKeyedSubscript:", v86);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v88 = (void *)objc_msgSend(v87, "copy");
    objc_msgSend(v5, "setPolyLocationShiftURLLegacy:", v88);

  }
  if (v378)
    v89 = CFSTR("problemSubmissionURLLegacy");
  else
    v89 = CFSTR("problemSubmissionURL_legacy");
  objc_msgSend(v4, "objectForKeyedSubscript:", v89);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v91 = (void *)objc_msgSend(v90, "copy");
    objc_msgSend(v5, "setProblemSubmissionURLLegacy:", v91);

  }
  if (v378)
    v92 = CFSTR("problemStatusURLLegacy");
  else
    v92 = CFSTR("problemStatusURL_legacy");
  objc_msgSend(v4, "objectForKeyedSubscript:", v92);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v94 = (void *)objc_msgSend(v93, "copy");
    objc_msgSend(v5, "setProblemStatusURLLegacy:", v94);

  }
  if (v378)
    v95 = CFSTR("reverseGeocoderVersionsURLLegacy");
  else
    v95 = CFSTR("reverseGeocoderVersionsURL_legacy");
  objc_msgSend(v4, "objectForKeyedSubscript:", v95);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v97 = (void *)objc_msgSend(v96, "copy");
    objc_msgSend(v5, "setReverseGeocoderVersionsURLLegacy:", v97);

  }
  if (v378)
    v98 = CFSTR("problemCategoriesURLLegacy");
  else
    v98 = CFSTR("problemCategoriesURL_legacy");
  objc_msgSend(v4, "objectForKeyedSubscript:", v98);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v100 = (void *)objc_msgSend(v99, "copy");
    objc_msgSend(v5, "setProblemCategoriesURLLegacy:", v100);

  }
  if (v378)
    v101 = CFSTR("announcementsURLLegacy");
  else
    v101 = CFSTR("announcementsURL_legacy");
  objc_msgSend(v4, "objectForKeyedSubscript:", v101);
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v103 = (void *)objc_msgSend(v102, "copy");
    objc_msgSend(v5, "setAnnouncementsURLLegacy:", v103);

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("announcementsSupportedLanguages"));
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v474 = 0u;
    v473 = 0u;
    v472 = 0u;
    v471 = 0u;
    v105 = v104;
    v106 = objc_msgSend(v105, "countByEnumeratingWithState:objects:count:", &v471, v517, 16);
    if (v106)
    {
      v107 = v106;
      v108 = *(_QWORD *)v472;
      do
      {
        for (ii = 0; ii != v107; ++ii)
        {
          if (*(_QWORD *)v472 != v108)
            objc_enumerationMutation(v105);
          v110 = *(void **)(*((_QWORD *)&v471 + 1) + 8 * ii);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v111 = (void *)objc_msgSend(v110, "copy");
            objc_msgSend(v5, "addAnnouncementsSupportedLanguages:", v111);

          }
        }
        v107 = objc_msgSend(v105, "countByEnumeratingWithState:objects:count:", &v471, v517, 16);
      }
      while (v107);
    }

  }
  if (v378)
    v112 = CFSTR("dispatcherURLLegacy");
  else
    v112 = CFSTR("dispatcherURL_legacy");
  objc_msgSend(v4, "objectForKeyedSubscript:", v112);
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v114 = (void *)objc_msgSend(v113, "copy");
    objc_msgSend(v5, "setDispatcherURLLegacy:", v114);

  }
  if (v378)
    v115 = CFSTR("problemOptInURLLegacy");
  else
    v115 = CFSTR("problemOptInURL_legacy");
  objc_msgSend(v4, "objectForKeyedSubscript:", v115);
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v117 = (void *)objc_msgSend(v116, "copy");
    objc_msgSend(v5, "setProblemOptInURLLegacy:", v117);

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("versionManifest"));
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v119 = [GEOVersionManifest alloc];
    if ((v378 & 1) != 0)
      v120 = -[GEOVersionManifest initWithJSON:](v119, "initWithJSON:", v118);
    else
      v120 = -[GEOVersionManifest initWithDictionary:](v119, "initWithDictionary:", v118);
    v121 = (void *)v120;
    objc_msgSend(v5, "setVersionManifest:", v120);

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("styleSheet"));
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v470 = 0u;
    v469 = 0u;
    v468 = 0u;
    v467 = 0u;
    v123 = v122;
    v124 = objc_msgSend(v123, "countByEnumeratingWithState:objects:count:", &v467, v516, 16);
    if (v124)
    {
      v125 = v124;
      v126 = *(_QWORD *)v468;
      do
      {
        for (jj = 0; jj != v125; ++jj)
        {
          if (*(_QWORD *)v468 != v126)
            objc_enumerationMutation(v123);
          v128 = *(void **)(*((_QWORD *)&v467 + 1) + 8 * jj);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v129 = (void *)objc_msgSend(v128, "copy");
            objc_msgSend(v5, "addStyleSheet:", v129);

          }
        }
        v125 = objc_msgSend(v123, "countByEnumeratingWithState:objects:count:", &v467, v516, 16);
      }
      while (v125);
    }

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("styleSheetChecksum"));
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v466 = 0u;
    v465 = 0u;
    v464 = 0u;
    v463 = 0u;
    v131 = v130;
    v132 = objc_msgSend(v131, "countByEnumeratingWithState:objects:count:", &v463, v515, 16);
    if (v132)
    {
      v133 = v132;
      v134 = *(_QWORD *)v464;
      do
      {
        for (kk = 0; kk != v133; ++kk)
        {
          if (*(_QWORD *)v464 != v134)
            objc_enumerationMutation(v131);
          v136 = *(void **)(*((_QWORD *)&v463 + 1) + 8 * kk);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v137 = (void *)objc_msgSend(v136, "copy");
            objc_msgSend(v5, "addStyleSheetChecksum:", v137);

          }
        }
        v133 = objc_msgSend(v131, "countByEnumeratingWithState:objects:count:", &v463, v515, 16);
      }
      while (v133);
    }

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("texture"));
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v462 = 0u;
    v461 = 0u;
    v460 = 0u;
    v459 = 0u;
    v139 = v138;
    v140 = objc_msgSend(v139, "countByEnumeratingWithState:objects:count:", &v459, v514, 16);
    if (v140)
    {
      v141 = v140;
      v142 = *(_QWORD *)v460;
      do
      {
        for (mm = 0; mm != v141; ++mm)
        {
          if (*(_QWORD *)v460 != v142)
            objc_enumerationMutation(v139);
          v144 = *(void **)(*((_QWORD *)&v459 + 1) + 8 * mm);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v145 = (void *)objc_msgSend(v144, "copy");
            objc_msgSend(v5, "addTexture:", v145);

          }
        }
        v141 = objc_msgSend(v139, "countByEnumeratingWithState:objects:count:", &v459, v514, 16);
      }
      while (v141);
    }

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("textureChecksum"));
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v458 = 0u;
    v457 = 0u;
    v456 = 0u;
    v455 = 0u;
    v147 = v146;
    v148 = objc_msgSend(v147, "countByEnumeratingWithState:objects:count:", &v455, v513, 16);
    if (v148)
    {
      v149 = v148;
      v150 = *(_QWORD *)v456;
      do
      {
        for (nn = 0; nn != v149; ++nn)
        {
          if (*(_QWORD *)v456 != v150)
            objc_enumerationMutation(v147);
          v152 = *(void **)(*((_QWORD *)&v455 + 1) + 8 * nn);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v153 = (void *)objc_msgSend(v152, "copy");
            objc_msgSend(v5, "addTextureChecksum:", v153);

          }
        }
        v149 = objc_msgSend(v147, "countByEnumeratingWithState:objects:count:", &v455, v513, 16);
      }
      while (v149);
    }

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("font"));
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v454 = 0u;
    v453 = 0u;
    v452 = 0u;
    v451 = 0u;
    v155 = v154;
    v156 = objc_msgSend(v155, "countByEnumeratingWithState:objects:count:", &v451, v512, 16);
    if (v156)
    {
      v157 = v156;
      v158 = *(_QWORD *)v452;
      do
      {
        for (i1 = 0; i1 != v157; ++i1)
        {
          if (*(_QWORD *)v452 != v158)
            objc_enumerationMutation(v155);
          v160 = *(void **)(*((_QWORD *)&v451 + 1) + 8 * i1);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v161 = (void *)objc_msgSend(v160, "copy");
            objc_msgSend(v5, "addFont:", v161);

          }
        }
        v157 = objc_msgSend(v155, "countByEnumeratingWithState:objects:count:", &v451, v512, 16);
      }
      while (v157);
    }

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("fontChecksum"));
  v162 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v450 = 0u;
    v449 = 0u;
    v448 = 0u;
    v447 = 0u;
    v163 = v162;
    v164 = objc_msgSend(v163, "countByEnumeratingWithState:objects:count:", &v447, v511, 16);
    if (v164)
    {
      v165 = v164;
      v166 = *(_QWORD *)v448;
      do
      {
        for (i2 = 0; i2 != v165; ++i2)
        {
          if (*(_QWORD *)v448 != v166)
            objc_enumerationMutation(v163);
          v168 = *(void **)(*((_QWORD *)&v447 + 1) + 8 * i2);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v169 = (void *)objc_msgSend(v168, "copy");
            objc_msgSend(v5, "addFontChecksum:", v169);

          }
        }
        v165 = objc_msgSend(v163, "countByEnumeratingWithState:objects:count:", &v447, v511, 16);
      }
      while (v165);
    }

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("icon"));
  v170 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v446 = 0u;
    v445 = 0u;
    v444 = 0u;
    v443 = 0u;
    v171 = v170;
    v172 = objc_msgSend(v171, "countByEnumeratingWithState:objects:count:", &v443, v510, 16);
    if (v172)
    {
      v173 = v172;
      v174 = *(_QWORD *)v444;
      do
      {
        for (i3 = 0; i3 != v173; ++i3)
        {
          if (*(_QWORD *)v444 != v174)
            objc_enumerationMutation(v171);
          v176 = *(void **)(*((_QWORD *)&v443 + 1) + 8 * i3);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v177 = (void *)objc_msgSend(v176, "copy");
            objc_msgSend(v5, "addIcon:", v177);

          }
        }
        v173 = objc_msgSend(v171, "countByEnumeratingWithState:objects:count:", &v443, v510, 16);
      }
      while (v173);
    }

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("iconChecksum"));
  v178 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v441 = 0u;
    v442 = 0u;
    v439 = 0u;
    v440 = 0u;
    v179 = v178;
    v180 = objc_msgSend(v179, "countByEnumeratingWithState:objects:count:", &v439, v509, 16);
    if (v180)
    {
      v181 = v180;
      v182 = *(_QWORD *)v440;
      do
      {
        for (i4 = 0; i4 != v181; ++i4)
        {
          if (*(_QWORD *)v440 != v182)
            objc_enumerationMutation(v179);
          v184 = *(void **)(*((_QWORD *)&v439 + 1) + 8 * i4);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v185 = (void *)objc_msgSend(v184, "copy");
            objc_msgSend(v5, "addIconChecksum:", v185);

          }
        }
        v181 = objc_msgSend(v179, "countByEnumeratingWithState:objects:count:", &v439, v509, 16);
      }
      while (v181);
    }

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("xml"));
  v186 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v437 = 0u;
    v438 = 0u;
    v435 = 0u;
    v436 = 0u;
    v187 = v186;
    v188 = objc_msgSend(v187, "countByEnumeratingWithState:objects:count:", &v435, v508, 16);
    if (v188)
    {
      v189 = v188;
      v190 = *(_QWORD *)v436;
      do
      {
        for (i5 = 0; i5 != v189; ++i5)
        {
          if (*(_QWORD *)v436 != v190)
            objc_enumerationMutation(v187);
          v192 = *(void **)(*((_QWORD *)&v435 + 1) + 8 * i5);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v193 = (void *)objc_msgSend(v192, "copy");
            objc_msgSend(v5, "addXml:", v193);

          }
        }
        v189 = objc_msgSend(v187, "countByEnumeratingWithState:objects:count:", &v435, v508, 16);
      }
      while (v189);
    }

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("xmlChecksum"));
  v194 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v433 = 0u;
    v434 = 0u;
    v431 = 0u;
    v432 = 0u;
    v195 = v194;
    v196 = objc_msgSend(v195, "countByEnumeratingWithState:objects:count:", &v431, v507, 16);
    if (v196)
    {
      v197 = v196;
      v198 = *(_QWORD *)v432;
      do
      {
        for (i6 = 0; i6 != v197; ++i6)
        {
          if (*(_QWORD *)v432 != v198)
            objc_enumerationMutation(v195);
          v200 = *(void **)(*((_QWORD *)&v431 + 1) + 8 * i6);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v201 = (void *)objc_msgSend(v200, "copy");
            objc_msgSend(v5, "addXmlChecksum:", v201);

          }
        }
        v197 = objc_msgSend(v195, "countByEnumeratingWithState:objects:count:", &v431, v507, 16);
      }
      while (v197);
    }

  }
  if (v378)
    v202 = CFSTR("abExperimentURLLegacy");
  else
    v202 = CFSTR("abExperimentURL_legacy");
  objc_msgSend(v4, "objectForKeyedSubscript:", v202);
  v203 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v204 = (void *)objc_msgSend(v203, "copy");
    objc_msgSend(v5, "setAbExperimentURLLegacy:", v204);

  }
  if (v378)
    v205 = CFSTR("businessPortalBaseURLLegacy");
  else
    v205 = CFSTR("businessPortalBaseURL_legacy");
  objc_msgSend(v4, "objectForKeyedSubscript:", v205);
  v206 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v207 = (void *)objc_msgSend(v206, "copy");
    objc_msgSend(v5, "setBusinessPortalBaseURLLegacy:", v207);

  }
  if (v378)
    v208 = CFSTR("logMessageUsageURLLegacy");
  else
    v208 = CFSTR("logMessageUsageURL_legacy");
  objc_msgSend(v4, "objectForKeyedSubscript:", v208);
  v209 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v210 = (void *)objc_msgSend(v209, "copy");
    objc_msgSend(v5, "setLogMessageUsageURLLegacy:", v210);

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("locationShiftEnabledRegion"));
  v211 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v429 = 0u;
    v430 = 0u;
    v427 = 0u;
    v428 = 0u;
    v212 = v211;
    v213 = objc_msgSend(v212, "countByEnumeratingWithState:objects:count:", &v427, v506, 16);
    if (v213)
    {
      v214 = v213;
      v215 = *(_QWORD *)v428;
      do
      {
        for (i7 = 0; i7 != v214; ++i7)
        {
          if (*(_QWORD *)v428 != v215)
            objc_enumerationMutation(v212);
          v217 = *(_QWORD *)(*((_QWORD *)&v427 + 1) + 8 * i7);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v218 = [GEOMapRegion alloc];
            if ((v378 & 1) != 0)
              v219 = -[GEOMapRegion initWithJSON:](v218, "initWithJSON:", v217);
            else
              v219 = -[GEOMapRegion initWithDictionary:](v218, "initWithDictionary:", v217);
            v220 = (void *)v219;
            objc_msgSend(v5, "addLocationShiftEnabledRegion:", v219);

          }
        }
        v214 = objc_msgSend(v212, "countByEnumeratingWithState:objects:count:", &v427, v506, 16);
      }
      while (v214);
    }

    v4 = v377;
  }

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("locationShiftVersion"));
  v221 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v5, "setLocationShiftVersion:", objc_msgSend(v221, "unsignedIntValue"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hybridUnavailableRegion"));
  v222 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v425 = 0u;
    v426 = 0u;
    v423 = 0u;
    v424 = 0u;
    v223 = v222;
    v224 = objc_msgSend(v223, "countByEnumeratingWithState:objects:count:", &v423, v505, 16);
    if (v224)
    {
      v225 = v224;
      v226 = *(_QWORD *)v424;
      do
      {
        for (i8 = 0; i8 != v225; ++i8)
        {
          if (*(_QWORD *)v424 != v226)
            objc_enumerationMutation(v223);
          v228 = *(void **)(*((_QWORD *)&v423 + 1) + 8 * i8);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v421 = 0uLL;
            v422 = 0;
            _GEOTileSetRegionFromDictionaryRepresentation(v228, &v421);
            v419 = v421;
            v420 = v422;
            objc_msgSend(v5, "addHybridUnavailableRegion:", &v419);
          }
        }
        v225 = objc_msgSend(v223, "countByEnumeratingWithState:objects:count:", &v423, v505, 16);
      }
      while (v225);
    }

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("reserved"));
  v229 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v230 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v229, 0);
    objc_msgSend(v5, "setReserved:", v230);

  }
  if (v378)
    v231 = CFSTR("spatialLookupURLLegacy");
  else
    v231 = CFSTR("spatialLookupURL_legacy");
  objc_msgSend(v4, "objectForKeyedSubscript:", v231);
  v232 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v233 = (void *)objc_msgSend(v232, "copy");
    objc_msgSend(v5, "setSpatialLookupURLLegacy:", v233);

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("activeResource"));
  v234 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v417 = 0u;
    v418 = 0u;
    v415 = 0u;
    v416 = 0u;
    v235 = v234;
    v236 = objc_msgSend(v235, "countByEnumeratingWithState:objects:count:", &v415, v504, 16);
    if (v236)
    {
      v237 = v236;
      v238 = *(_QWORD *)v416;
      do
      {
        for (i9 = 0; i9 != v237; ++i9)
        {
          if (*(_QWORD *)v416 != v238)
            objc_enumerationMutation(v235);
          v240 = *(_QWORD *)(*((_QWORD *)&v415 + 1) + 8 * i9);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v241 = [GEOResource alloc];
            if ((v378 & 1) != 0)
              v242 = -[GEOResource initWithJSON:](v241, "initWithJSON:", v240);
            else
              v242 = -[GEOResource initWithDictionary:](v241, "initWithDictionary:", v240);
            v243 = (void *)v242;
            objc_msgSend(v5, "addActiveResource:", v242);

          }
        }
        v237 = objc_msgSend(v235, "countByEnumeratingWithState:objects:count:", &v415, v504, 16);
      }
      while (v237);
    }

    v4 = v377;
  }

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("regionalResource"));
  v244 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v413 = 0u;
    v414 = 0u;
    v411 = 0u;
    v412 = 0u;
    v245 = v244;
    v246 = objc_msgSend(v245, "countByEnumeratingWithState:objects:count:", &v411, v503, 16);
    if (v246)
    {
      v247 = v246;
      v248 = *(_QWORD *)v412;
      do
      {
        for (i10 = 0; i10 != v247; ++i10)
        {
          if (*(_QWORD *)v412 != v248)
            objc_enumerationMutation(v245);
          v250 = *(_QWORD *)(*((_QWORD *)&v411 + 1) + 8 * i10);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v251 = [GEORegionalResourceSet alloc];
            if ((v378 & 1) != 0)
              v252 = -[GEORegionalResourceSet initWithJSON:](v251, "initWithJSON:", v250);
            else
              v252 = -[GEORegionalResourceSet initWithDictionary:](v251, "initWithDictionary:", v250);
            v253 = (void *)v252;
            objc_msgSend(v5, "addRegionalResource:", v252);

          }
        }
        v247 = objc_msgSend(v245, "countByEnumeratingWithState:objects:count:", &v411, v503, 16);
      }
      while (v247);
    }

    v4 = v377;
  }

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("modelVersion"));
  v254 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v5, "setModelVersion:", objc_msgSend(v254, "unsignedIntValue"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("activeScale"));
  v255 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v409 = 0u;
    v410 = 0u;
    v407 = 0u;
    v408 = 0u;
    v256 = v255;
    v257 = objc_msgSend(v256, "countByEnumeratingWithState:objects:count:", &v407, v502, 16);
    if (!v257)
      goto LABEL_389;
    v258 = v257;
    v259 = *(_QWORD *)v408;
    while (1)
    {
      for (i11 = 0; i11 != v258; ++i11)
      {
        if (*(_QWORD *)v408 != v259)
          objc_enumerationMutation(v256);
        v261 = *(void **)(*((_QWORD *)&v407 + 1) + 8 * i11);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v262 = v261;
          if ((objc_msgSend(v262, "isEqualToString:", CFSTR("RESOURCE_FILTER_SCALE_UNKNOWN")) & 1) != 0)
          {
            v263 = 0;
          }
          else if ((objc_msgSend(v262, "isEqualToString:", CFSTR("RESOURCE_FILTER_SCALE_1X")) & 1) != 0)
          {
            v263 = 1;
          }
          else if ((objc_msgSend(v262, "isEqualToString:", CFSTR("RESOURCE_FILTER_SCALE_2X")) & 1) != 0)
          {
            v263 = 2;
          }
          else if (objc_msgSend(v262, "isEqualToString:", CFSTR("RESOURCE_FILTER_SCALE_3X")))
          {
            v263 = 3;
          }
          else
          {
            v263 = 0;
          }

        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            continue;
          v263 = objc_msgSend(v261, "intValue");
        }
        objc_msgSend(v5, "addActiveScale:", v263);
      }
      v258 = objc_msgSend(v256, "countByEnumeratingWithState:objects:count:", &v407, v502, 16);
      if (!v258)
      {
LABEL_389:

        v4 = v377;
        break;
      }
    }
  }

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("activeScenario"));
  v264 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_415;
  v405 = 0u;
  v406 = 0u;
  v403 = 0u;
  v404 = 0u;
  v376 = v264;
  v265 = v264;
  v266 = objc_msgSend(v265, "countByEnumeratingWithState:objects:count:", &v403, v501, 16);
  if (!v266)
    goto LABEL_414;
  v267 = v266;
  v268 = *(_QWORD *)v404;
  do
  {
    for (i12 = 0; i12 != v267; ++i12)
    {
      if (*(_QWORD *)v404 != v268)
        objc_enumerationMutation(v265);
      v270 = *(void **)(*((_QWORD *)&v403 + 1) + 8 * i12);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v271 = v270;
        if ((objc_msgSend(v271, "isEqualToString:", CFSTR("RESOURCE_FILTER_SCENARIO_UNKNOWN")) & 1) != 0)
        {
          v272 = 0;
        }
        else if ((objc_msgSend(v271, "isEqualToString:", CFSTR("RESOURCE_FILTER_SCENARIO_CARPLAY")) & 1) != 0)
        {
          v272 = 1;
        }
        else if ((objc_msgSend(v271, "isEqualToString:", CFSTR("RESOURCE_FILTER_SCENARIO_NAVIGATION")) & 1) != 0)
        {
          v272 = 2;
        }
        else if ((objc_msgSend(v271, "isEqualToString:", CFSTR("RESOURCE_FILTER_SCENARIO_HIGHVISIBILITY")) & 1) != 0)
        {
          v272 = 3;
        }
        else if (objc_msgSend(v271, "isEqualToString:", CFSTR("RESOURCE_FILTER_SCENARIO_EXPLICIT")))
        {
          v272 = 4;
        }
        else
        {
          v272 = 0;
        }

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          continue;
        v272 = objc_msgSend(v270, "intValue");
      }
      objc_msgSend(v5, "addActiveScenario:", v272);
    }
    v267 = objc_msgSend(v265, "countByEnumeratingWithState:objects:count:", &v403, v501, 16);
  }
  while (v267);
LABEL_414:

  v264 = v376;
  v4 = v377;
LABEL_415:

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("staleResource"));
  v273 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v401 = 0u;
    v402 = 0u;
    v399 = 0u;
    v400 = 0u;
    v274 = v273;
    v275 = objc_msgSend(v274, "countByEnumeratingWithState:objects:count:", &v399, v500, 16);
    if (v275)
    {
      v276 = v275;
      v277 = *(_QWORD *)v400;
      do
      {
        for (i13 = 0; i13 != v276; ++i13)
        {
          if (*(_QWORD *)v400 != v277)
            objc_enumerationMutation(v274);
          v279 = *(_QWORD *)(*((_QWORD *)&v399 + 1) + 8 * i13);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v280 = [GEOStaleResource alloc];
            if ((v378 & 1) != 0)
              v281 = -[GEOStaleResource initWithJSON:](v280, "initWithJSON:", v279);
            else
              v281 = -[GEOStaleResource initWithDictionary:](v280, "initWithDictionary:", v279);
            v282 = (void *)v281;
            objc_msgSend(v5, "addStaleResource:", v281);

          }
        }
        v276 = objc_msgSend(v274, "countByEnumeratingWithState:objects:count:", &v399, v500, 16);
      }
      while (v276);
    }

    v4 = v377;
  }

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("dataSet"));
  v283 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v284 = [GEODataSetDescription alloc];
    if ((v378 & 1) != 0)
      v285 = -[GEODataSetDescription initWithJSON:](v284, "initWithJSON:", v283);
    else
      v285 = -[GEODataSetDescription initWithDictionary:](v284, "initWithDictionary:", v283);
    v286 = (void *)v285;
    objc_msgSend(v5, "setDataSet:", v285);

  }
  if (v378)
    v287 = CFSTR("realtimeTrafficProbeURLLegacy");
  else
    v287 = CFSTR("realtimeTrafficProbeURL_legacy");
  objc_msgSend(v4, "objectForKeyedSubscript:", v287);
  v288 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v289 = (void *)objc_msgSend(v288, "copy");
    objc_msgSend(v5, "setRealtimeTrafficProbeURLLegacy:", v289);

  }
  if (v378)
    v290 = CFSTR("batchTrafficProbeURLLegacy");
  else
    v290 = CFSTR("batchTrafficProbeURL_legacy");
  objc_msgSend(v4, "objectForKeyedSubscript:", v290);
  v291 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v292 = (void *)objc_msgSend(v291, "copy");
    objc_msgSend(v5, "setBatchTrafficProbeURLLegacy:", v292);

  }
  if (v378)
    v293 = CFSTR("logMessageUsageV3URLLegacy");
  else
    v293 = CFSTR("logMessageUsageV3URL_legacy");
  objc_msgSend(v4, "objectForKeyedSubscript:", v293);
  v294 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v295 = (void *)objc_msgSend(v294, "copy");
    objc_msgSend(v5, "setLogMessageUsageV3URLLegacy:", v295);

  }
  if (v378)
    v296 = CFSTR("proactiveRoutingURLLegacy");
  else
    v296 = CFSTR("proactiveRoutingURL_legacy");
  objc_msgSend(v4, "objectForKeyedSubscript:", v296);
  v297 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v298 = (void *)objc_msgSend(v297, "copy");
    objc_msgSend(v5, "setProactiveRoutingURLLegacy:", v298);

  }
  if (v378)
    v299 = CFSTR("backgroundDispatcherURLLegacy");
  else
    v299 = CFSTR("backgroundDispatcherURL_legacy");
  objc_msgSend(v4, "objectForKeyedSubscript:", v299);
  v300 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v301 = (void *)objc_msgSend(v300, "copy");
    objc_msgSend(v5, "setBackgroundDispatcherURLLegacy:", v301);

  }
  if (v378)
    v302 = CFSTR("bluePOIURLLegacy");
  else
    v302 = CFSTR("bluePOIURL_legacy");
  objc_msgSend(v4, "objectForKeyedSubscript:", v302);
  v303 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v304 = (void *)objc_msgSend(v303, "copy");
    objc_msgSend(v5, "setBluePOIURLLegacy:", v304);

  }
  if (v378)
    v305 = CFSTR("backgroundRevGeoURLLegacy");
  else
    v305 = CFSTR("backgroundRevGeoURL_legacy");
  objc_msgSend(v4, "objectForKeyedSubscript:", v305);
  v306 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v307 = (void *)objc_msgSend(v306, "copy");
    objc_msgSend(v5, "setBackgroundRevGeoURLLegacy:", v307);

  }
  if (v378)
    v308 = CFSTR("wifiConnectionQualityProbeURLLegacy");
  else
    v308 = CFSTR("wifiConnectionQualityProbeURL_legacy");
  objc_msgSend(v4, "objectForKeyedSubscript:", v308);
  v309 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v310 = (void *)objc_msgSend(v309, "copy");
    objc_msgSend(v5, "setWifiConnectionQualityProbeURLLegacy:", v310);

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("muninBaseURL"));
  v311 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v312 = (void *)objc_msgSend(v311, "copy");
    objc_msgSend(v5, "setMuninBaseURL:", v312);

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("flyoverRegionVersions"));
  v313 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v314 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v313, 0);
    objc_msgSend(v5, "setFlyoverRegionVersions:", v314);

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("urlInfoSet"));
  v315 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v316 = [GEOURLInfoSet alloc];
    if ((v378 & 1) != 0)
      v317 = -[GEOURLInfoSet initWithJSON:](v316, "initWithJSON:", v315);
    else
      v317 = -[GEOURLInfoSet initWithDictionary:](v316, "initWithDictionary:", v315);
    v318 = (void *)v317;
    objc_msgSend(v5, "setUrlInfoSet:", v317);

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("muninBucket"));
  v319 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v397 = 0u;
    v398 = 0u;
    v395 = 0u;
    v396 = 0u;
    v320 = v319;
    v321 = objc_msgSend(v320, "countByEnumeratingWithState:objects:count:", &v395, v499, 16);
    if (v321)
    {
      v322 = v321;
      v323 = *(_QWORD *)v396;
      do
      {
        for (i14 = 0; i14 != v322; ++i14)
        {
          if (*(_QWORD *)v396 != v323)
            objc_enumerationMutation(v320);
          v325 = *(_QWORD *)(*((_QWORD *)&v395 + 1) + 8 * i14);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v326 = [GEOMuninBucket alloc];
            if ((v378 & 1) != 0)
              v327 = -[GEOMuninBucket initWithJSON:](v326, "initWithJSON:", v325);
            else
              v327 = -[GEOMuninBucket initWithDictionary:](v326, "initWithDictionary:", v325);
            v328 = (void *)v327;
            objc_msgSend(v5, "addMuninBucket:", v327);

          }
        }
        v322 = objc_msgSend(v320, "countByEnumeratingWithState:objects:count:", &v395, v499, 16);
      }
      while (v322);
    }

    v4 = v377;
  }

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("environment"));
  v329 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v330 = (void *)objc_msgSend(v329, "copy");
    objc_msgSend(v5, "setEnvironment:", v330);

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("displayStrings"));
  v331 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v393 = 0u;
    v394 = 0u;
    v391 = 0u;
    v392 = 0u;
    v332 = v331;
    v333 = objc_msgSend(v332, "countByEnumeratingWithState:objects:count:", &v391, v498, 16);
    if (v333)
    {
      v334 = v333;
      v335 = *(_QWORD *)v392;
      do
      {
        for (i15 = 0; i15 != v334; ++i15)
        {
          if (*(_QWORD *)v392 != v335)
            objc_enumerationMutation(v332);
          v337 = *(_QWORD *)(*((_QWORD *)&v391 + 1) + 8 * i15);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v338 = [GEODisplayString alloc];
            if ((v378 & 1) != 0)
              v339 = -[GEODisplayString initWithJSON:](v338, "initWithJSON:", v337);
            else
              v339 = -[GEODisplayString initWithDictionary:](v338, "initWithDictionary:", v337);
            v340 = (void *)v339;
            objc_msgSend(v5, "addDisplayStrings:", v339);

          }
        }
        v334 = objc_msgSend(v332, "countByEnumeratingWithState:objects:count:", &v391, v498, 16);
      }
      while (v334);
    }

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("explicitResource"));
  v341 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v389 = 0u;
    v390 = 0u;
    v387 = 0u;
    v388 = 0u;
    v342 = v341;
    v343 = objc_msgSend(v342, "countByEnumeratingWithState:objects:count:", &v387, v497, 16);
    if (v343)
    {
      v344 = v343;
      v345 = *(_QWORD *)v388;
      do
      {
        for (i16 = 0; i16 != v344; ++i16)
        {
          if (*(_QWORD *)v388 != v345)
            objc_enumerationMutation(v342);
          v347 = *(_QWORD *)(*((_QWORD *)&v387 + 1) + 8 * i16);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v348 = [GEOResource alloc];
            if ((v378 & 1) != 0)
              v349 = -[GEOResource initWithJSON:](v348, "initWithJSON:", v347);
            else
              v349 = -[GEOResource initWithDictionary:](v348, "initWithDictionary:", v347);
            v350 = (void *)v349;
            objc_msgSend(v5, "addExplicitResource:", v349);

          }
        }
        v344 = objc_msgSend(v342, "countByEnumeratingWithState:objects:count:", &v387, v497, 16);
      }
      while (v344);
    }

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("offlineMetadata"));
  v351 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v352 = [GEOOfflineMetadata alloc];
    if ((v378 & 1) != 0)
      v353 = -[GEOOfflineMetadata initWithJSON:](v352, "initWithJSON:", v351);
    else
      v353 = -[GEOOfflineMetadata initWithDictionary:](v352, "initWithDictionary:", v351);
    v354 = (void *)v353;
    objc_msgSend(v5, "setOfflineMetadata:", v353);

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("resourceCanonicalNameToFileName"));
  v355 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v356 = objc_claimAutoreleasedReturnValue();
    v357 = v5[57];
    v5[57] = (id)v356;

    v385 = 0u;
    v386 = 0u;
    v383 = 0u;
    v384 = 0u;
    v358 = v355;
    v359 = objc_msgSend(v358, "countByEnumeratingWithState:objects:count:", &v383, v496, 16);
    if (v359)
    {
      v360 = v359;
      v361 = *(_QWORD *)v384;
      do
      {
        for (i17 = 0; i17 != v360; ++i17)
        {
          if (*(_QWORD *)v384 != v361)
            objc_enumerationMutation(v358);
          v363 = *(_QWORD *)(*((_QWORD *)&v383 + 1) + 8 * i17);
          objc_msgSend(v358, "objectForKeyedSubscript:", v363);
          v364 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5[57], "setObject:forKey:", v364, v363);

        }
        v360 = objc_msgSend(v358, "countByEnumeratingWithState:objects:count:", &v383, v496, 16);
      }
      while (v360);
    }

    v4 = v377;
  }

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("regionalResourceCanonicalNameToFileName"));
  v365 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v366 = objc_claimAutoreleasedReturnValue();
    v367 = v5[50];
    v5[50] = (id)v366;

    v381 = 0u;
    v382 = 0u;
    v379 = 0u;
    v380 = 0u;
    v368 = v365;
    v369 = objc_msgSend(v368, "countByEnumeratingWithState:objects:count:", &v379, v495, 16);
    if (v369)
    {
      v370 = v369;
      v371 = *(_QWORD *)v380;
      do
      {
        for (i18 = 0; i18 != v370; ++i18)
        {
          if (*(_QWORD *)v380 != v371)
            objc_enumerationMutation(v368);
          v373 = *(_QWORD *)(*((_QWORD *)&v379 + 1) + 8 * i18);
          objc_msgSend(v368, "objectForKeyedSubscript:", v373);
          v374 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5[50], "setObject:forKey:", v374, v373);

        }
        v370 = objc_msgSend(v368, "countByEnumeratingWithState:objects:count:", &v379, v495, 16);
      }
      while (v370);
    }

  }
  v2 = v5;

LABEL_551:
  return v2;
}

- (GEOActiveTileGroup)initWithJSON:(id)a3
{
  return (GEOActiveTileGroup *)-[GEOActiveTileGroup _initWithDictionary:isJSON:]();
}

+ (BOOL)isValid:(id)a3
{
  return GEOActiveTileGroupIsValid((char *)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t k;
  NSMutableArray *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t m;
  NSMutableArray *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t n;
  NSMutableArray *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t ii;
  NSMutableArray *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t jj;
  NSMutableArray *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t kk;
  NSMutableArray *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t mm;
  NSMutableArray *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t nn;
  NSMutableArray *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t i1;
  NSMutableArray *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t i2;
  NSMutableArray *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t i3;
  NSMutableArray *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t i4;
  NSMutableArray *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t i5;
  NSMutableArray *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t i6;
  NSMutableArray *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t i7;
  uint64_t v74;
  unint64_t v75;
  NSMutableArray *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t i8;
  NSMutableArray *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t i9;
  unint64_t v84;
  unint64_t v85;
  NSMutableArray *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t i10;
  NSMutableArray *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t i11;
  NSMutableArray *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t i12;
  NSMutableArray *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t i13;
  NSMutableDictionary *resourceCanonicalNameToFileName;
  uint64_t v103;
  id v104;
  NSMutableDictionary *regionalResourceCanonicalNameToFileName;
  id v106;
  PBDataReader *v107;
  void *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t (*v111)(uint64_t, void *, void *);
  void *v112;
  id v113;
  _QWORD v114[4];
  id v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  uint64_t v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  __int128 v188;
  __int128 v189;
  __int128 v190;
  __int128 v191;
  __int128 v192;
  __int128 v193;
  __int128 v194;
  __int128 v195;
  __int128 v196;
  __int128 v197;
  __int128 v198;
  __int128 v199;
  __int128 v200;
  __int128 v201;
  __int128 v202;
  __int128 v203;
  __int128 v204;
  __int128 v205;
  __int128 v206;
  __int128 v207;
  __int128 v208;
  _BYTE v209[128];
  _BYTE v210[128];
  _BYTE v211[128];
  _BYTE v212[128];
  _BYTE v213[128];
  _BYTE v214[128];
  _BYTE v215[128];
  _BYTE v216[128];
  _BYTE v217[128];
  _BYTE v218[128];
  _BYTE v219[128];
  _BYTE v220[128];
  _BYTE v221[128];
  _BYTE v222[128];
  _BYTE v223[128];
  _BYTE v224[128];
  _BYTE v225[128];
  _BYTE v226[128];
  _BYTE v227[128];
  _BYTE v228[128];
  _BYTE v229[128];
  _BYTE v230[128];
  _BYTE v231[128];
  uint64_t v232;

  v232 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOActiveTileGroupIsDirty((uint64_t)self) & 1) == 0)
  {
    v107 = self->_reader;
    objc_sync_enter(v107);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v108);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v107);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOActiveTileGroup readAll:](self, "readAll:", 0);
    PBDataWriterWriteUint32Field();
    v208 = 0u;
    v207 = 0u;
    v206 = 0u;
    v205 = 0u;
    v6 = self->_tileSets;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v205, v231, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v206;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v206 != v8)
            objc_enumerationMutation(v6);
          PBDataWriterWriteSubmessage();
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v205, v231, 16);
      }
      while (v7);
    }

    v204 = 0u;
    v203 = 0u;
    v202 = 0u;
    v201 = 0u;
    v10 = self->_resources;
    v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v201, v230, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v202;
      do
      {
        for (j = 0; j != v11; ++j)
        {
          if (*(_QWORD *)v202 != v12)
            objc_enumerationMutation(v10);
          PBDataWriterWriteStringField();
        }
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v201, v230, 16);
      }
      while (v11);
    }

    if (self->_uniqueIdentifier)
      PBDataWriterWriteStringField();
    v200 = 0u;
    v199 = 0u;
    v198 = 0u;
    v197 = 0u;
    v14 = self->_attributions;
    v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v197, v229, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v198;
      do
      {
        for (k = 0; k != v15; ++k)
        {
          if (*(_QWORD *)v198 != v16)
            objc_enumerationMutation(v14);
          PBDataWriterWriteSubmessage();
        }
        v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v197, v229, 16);
      }
      while (v15);
    }

    v196 = 0u;
    v195 = 0u;
    v194 = 0u;
    v193 = 0u;
    v18 = self->_regionalResourceTiles;
    v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v193, v228, 16);
    if (v19)
    {
      v20 = *(_QWORD *)v194;
      do
      {
        for (m = 0; m != v19; ++m)
        {
          if (*(_QWORD *)v194 != v20)
            objc_enumerationMutation(v18);
          PBDataWriterWriteSubmessage();
        }
        v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v193, v228, 16);
      }
      while (v19);
    }

    v192 = 0u;
    v191 = 0u;
    v190 = 0u;
    v189 = 0u;
    v22 = self->_regionalResourceRegions;
    v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v189, v227, 16);
    if (v23)
    {
      v24 = *(_QWORD *)v190;
      do
      {
        for (n = 0; n != v23; ++n)
        {
          if (*(_QWORD *)v190 != v24)
            objc_enumerationMutation(v22);
          PBDataWriterWriteSubmessage();
        }
        v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v189, v227, 16);
      }
      while (v23);
    }

    if (self->_regionalResourcesURLLegacy)
      PBDataWriterWriteStringField();
    if (self->_searchAttributionManifestURLLegacy)
      PBDataWriterWriteStringField();
    if (self->_directionsURLLegacy)
      PBDataWriterWriteStringField();
    if (self->_etaURLLegacy)
      PBDataWriterWriteStringField();
    if (self->_batchReverseGeocoderURLLegacy)
      PBDataWriterWriteStringField();
    if (self->_releaseInfo)
      PBDataWriterWriteStringField();
    if (self->_resourcesURLLegacy)
      PBDataWriterWriteStringField();
    if (self->_simpleETAURLLegacy)
      PBDataWriterWriteStringField();
    if (self->_addressCorrectionInitURLLegacy)
      PBDataWriterWriteStringField();
    if (self->_addressCorrectionUpdateURLLegacy)
      PBDataWriterWriteStringField();
    if (self->_polyLocationShiftURLLegacy)
      PBDataWriterWriteStringField();
    if (self->_problemSubmissionURLLegacy)
      PBDataWriterWriteStringField();
    if (self->_problemStatusURLLegacy)
      PBDataWriterWriteStringField();
    if (self->_reverseGeocoderVersionsURLLegacy)
      PBDataWriterWriteStringField();
    if (self->_problemCategoriesURLLegacy)
      PBDataWriterWriteStringField();
    if (self->_announcementsURLLegacy)
      PBDataWriterWriteStringField();
    v188 = 0u;
    v187 = 0u;
    v186 = 0u;
    v185 = 0u;
    v26 = self->_announcementsSupportedLanguages;
    v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v185, v226, 16);
    if (v27)
    {
      v28 = *(_QWORD *)v186;
      do
      {
        for (ii = 0; ii != v27; ++ii)
        {
          if (*(_QWORD *)v186 != v28)
            objc_enumerationMutation(v26);
          PBDataWriterWriteStringField();
        }
        v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v185, v226, 16);
      }
      while (v27);
    }

    if (self->_dispatcherURLLegacy)
      PBDataWriterWriteStringField();
    if (self->_problemOptInURLLegacy)
      PBDataWriterWriteStringField();
    if (self->_versionManifest)
      PBDataWriterWriteSubmessage();
    v184 = 0u;
    v183 = 0u;
    v182 = 0u;
    v181 = 0u;
    v30 = self->_styleSheets;
    v31 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v181, v225, 16);
    if (v31)
    {
      v32 = *(_QWORD *)v182;
      do
      {
        for (jj = 0; jj != v31; ++jj)
        {
          if (*(_QWORD *)v182 != v32)
            objc_enumerationMutation(v30);
          PBDataWriterWriteStringField();
        }
        v31 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v181, v225, 16);
      }
      while (v31);
    }

    v180 = 0u;
    v179 = 0u;
    v178 = 0u;
    v177 = 0u;
    v34 = self->_styleSheetChecksums;
    v35 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v34, "countByEnumeratingWithState:objects:count:", &v177, v224, 16);
    if (v35)
    {
      v36 = *(_QWORD *)v178;
      do
      {
        for (kk = 0; kk != v35; ++kk)
        {
          if (*(_QWORD *)v178 != v36)
            objc_enumerationMutation(v34);
          PBDataWriterWriteStringField();
        }
        v35 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v34, "countByEnumeratingWithState:objects:count:", &v177, v224, 16);
      }
      while (v35);
    }

    v176 = 0u;
    v174 = 0u;
    v175 = 0u;
    v173 = 0u;
    v38 = self->_textures;
    v39 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v38, "countByEnumeratingWithState:objects:count:", &v173, v223, 16);
    if (v39)
    {
      v40 = *(_QWORD *)v174;
      do
      {
        for (mm = 0; mm != v39; ++mm)
        {
          if (*(_QWORD *)v174 != v40)
            objc_enumerationMutation(v38);
          PBDataWriterWriteStringField();
        }
        v39 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v38, "countByEnumeratingWithState:objects:count:", &v173, v223, 16);
      }
      while (v39);
    }

    v171 = 0u;
    v172 = 0u;
    v169 = 0u;
    v170 = 0u;
    v42 = self->_textureChecksums;
    v43 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v42, "countByEnumeratingWithState:objects:count:", &v169, v222, 16);
    if (v43)
    {
      v44 = *(_QWORD *)v170;
      do
      {
        for (nn = 0; nn != v43; ++nn)
        {
          if (*(_QWORD *)v170 != v44)
            objc_enumerationMutation(v42);
          PBDataWriterWriteStringField();
        }
        v43 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v42, "countByEnumeratingWithState:objects:count:", &v169, v222, 16);
      }
      while (v43);
    }

    v167 = 0u;
    v168 = 0u;
    v165 = 0u;
    v166 = 0u;
    v46 = self->_fonts;
    v47 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v46, "countByEnumeratingWithState:objects:count:", &v165, v221, 16);
    if (v47)
    {
      v48 = *(_QWORD *)v166;
      do
      {
        for (i1 = 0; i1 != v47; ++i1)
        {
          if (*(_QWORD *)v166 != v48)
            objc_enumerationMutation(v46);
          PBDataWriterWriteStringField();
        }
        v47 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v46, "countByEnumeratingWithState:objects:count:", &v165, v221, 16);
      }
      while (v47);
    }

    v163 = 0u;
    v164 = 0u;
    v161 = 0u;
    v162 = 0u;
    v50 = self->_fontChecksums;
    v51 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v50, "countByEnumeratingWithState:objects:count:", &v161, v220, 16);
    if (v51)
    {
      v52 = *(_QWORD *)v162;
      do
      {
        for (i2 = 0; i2 != v51; ++i2)
        {
          if (*(_QWORD *)v162 != v52)
            objc_enumerationMutation(v50);
          PBDataWriterWriteStringField();
        }
        v51 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v50, "countByEnumeratingWithState:objects:count:", &v161, v220, 16);
      }
      while (v51);
    }

    v159 = 0u;
    v160 = 0u;
    v157 = 0u;
    v158 = 0u;
    v54 = self->_icons;
    v55 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v54, "countByEnumeratingWithState:objects:count:", &v157, v219, 16);
    if (v55)
    {
      v56 = *(_QWORD *)v158;
      do
      {
        for (i3 = 0; i3 != v55; ++i3)
        {
          if (*(_QWORD *)v158 != v56)
            objc_enumerationMutation(v54);
          PBDataWriterWriteStringField();
        }
        v55 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v54, "countByEnumeratingWithState:objects:count:", &v157, v219, 16);
      }
      while (v55);
    }

    v155 = 0u;
    v156 = 0u;
    v153 = 0u;
    v154 = 0u;
    v58 = self->_iconChecksums;
    v59 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v58, "countByEnumeratingWithState:objects:count:", &v153, v218, 16);
    if (v59)
    {
      v60 = *(_QWORD *)v154;
      do
      {
        for (i4 = 0; i4 != v59; ++i4)
        {
          if (*(_QWORD *)v154 != v60)
            objc_enumerationMutation(v58);
          PBDataWriterWriteStringField();
        }
        v59 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v58, "countByEnumeratingWithState:objects:count:", &v153, v218, 16);
      }
      while (v59);
    }

    v151 = 0u;
    v152 = 0u;
    v149 = 0u;
    v150 = 0u;
    v62 = self->_xmls;
    v63 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v62, "countByEnumeratingWithState:objects:count:", &v149, v217, 16);
    if (v63)
    {
      v64 = *(_QWORD *)v150;
      do
      {
        for (i5 = 0; i5 != v63; ++i5)
        {
          if (*(_QWORD *)v150 != v64)
            objc_enumerationMutation(v62);
          PBDataWriterWriteStringField();
        }
        v63 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v62, "countByEnumeratingWithState:objects:count:", &v149, v217, 16);
      }
      while (v63);
    }

    v147 = 0u;
    v148 = 0u;
    v145 = 0u;
    v146 = 0u;
    v66 = self->_xmlChecksums;
    v67 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v66, "countByEnumeratingWithState:objects:count:", &v145, v216, 16);
    if (v67)
    {
      v68 = *(_QWORD *)v146;
      do
      {
        for (i6 = 0; i6 != v67; ++i6)
        {
          if (*(_QWORD *)v146 != v68)
            objc_enumerationMutation(v66);
          PBDataWriterWriteStringField();
        }
        v67 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v66, "countByEnumeratingWithState:objects:count:", &v145, v216, 16);
      }
      while (v67);
    }

    if (self->_abExperimentURLLegacy)
      PBDataWriterWriteStringField();
    if (self->_businessPortalBaseURLLegacy)
      PBDataWriterWriteStringField();
    if (self->_logMessageUsageURLLegacy)
      PBDataWriterWriteStringField();
    v143 = 0u;
    v144 = 0u;
    v141 = 0u;
    v142 = 0u;
    v70 = self->_locationShiftEnabledRegions;
    v71 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v70, "countByEnumeratingWithState:objects:count:", &v141, v215, 16);
    if (v71)
    {
      v72 = *(_QWORD *)v142;
      do
      {
        for (i7 = 0; i7 != v71; ++i7)
        {
          if (*(_QWORD *)v142 != v72)
            objc_enumerationMutation(v70);
          PBDataWriterWriteSubmessage();
        }
        v71 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v70, "countByEnumeratingWithState:objects:count:", &v141, v215, 16);
      }
      while (v71);
    }

    if ((*(_QWORD *)&self->_flags & 1) != 0)
      PBDataWriterWriteUint32Field();
    if (self->_hybridUnavailableRegionsCount)
    {
      v74 = 0;
      v75 = 0;
      do
      {
        v140 = 0;
        PBDataWriterPlaceMark();
        GEOTileSetRegionWriteTo();
        PBDataWriterRecallMark();
        ++v75;
        v74 += 24;
      }
      while (v75 < self->_hybridUnavailableRegionsCount);
    }
    if (self->_reserved)
      PBDataWriterWriteDataField();
    if (self->_spatialLookupURLLegacy)
      PBDataWriterWriteStringField();
    v138 = 0u;
    v139 = 0u;
    v136 = 0u;
    v137 = 0u;
    v76 = self->_activeResources;
    v77 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v76, "countByEnumeratingWithState:objects:count:", &v136, v214, 16);
    if (v77)
    {
      v78 = *(_QWORD *)v137;
      do
      {
        for (i8 = 0; i8 != v77; ++i8)
        {
          if (*(_QWORD *)v137 != v78)
            objc_enumerationMutation(v76);
          PBDataWriterWriteSubmessage();
        }
        v77 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v76, "countByEnumeratingWithState:objects:count:", &v136, v214, 16);
      }
      while (v77);
    }

    v134 = 0u;
    v135 = 0u;
    v132 = 0u;
    v133 = 0u;
    v80 = self->_regionalResources;
    v81 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v80, "countByEnumeratingWithState:objects:count:", &v132, v213, 16);
    if (v81)
    {
      v82 = *(_QWORD *)v133;
      do
      {
        for (i9 = 0; i9 != v81; ++i9)
        {
          if (*(_QWORD *)v133 != v82)
            objc_enumerationMutation(v80);
          PBDataWriterWriteSubmessage();
        }
        v81 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v80, "countByEnumeratingWithState:objects:count:", &v132, v213, 16);
      }
      while (v81);
    }

    if ((*(_QWORD *)&self->_flags & 2) != 0)
      PBDataWriterWriteUint32Field();
    if (self->_activeScales.count)
    {
      v84 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        ++v84;
      }
      while (v84 < self->_activeScales.count);
    }
    if (self->_activeScenarios.count)
    {
      v85 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        ++v85;
      }
      while (v85 < self->_activeScenarios.count);
    }
    v130 = 0u;
    v131 = 0u;
    v128 = 0u;
    v129 = 0u;
    v86 = self->_staleResources;
    v87 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v86, "countByEnumeratingWithState:objects:count:", &v128, v212, 16);
    if (v87)
    {
      v88 = *(_QWORD *)v129;
      do
      {
        for (i10 = 0; i10 != v87; ++i10)
        {
          if (*(_QWORD *)v129 != v88)
            objc_enumerationMutation(v86);
          PBDataWriterWriteSubmessage();
        }
        v87 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v86, "countByEnumeratingWithState:objects:count:", &v128, v212, 16);
      }
      while (v87);
    }

    if (self->_dataSet)
      PBDataWriterWriteSubmessage();
    if (self->_realtimeTrafficProbeURLLegacy)
      PBDataWriterWriteStringField();
    if (self->_batchTrafficProbeURLLegacy)
      PBDataWriterWriteStringField();
    if (self->_logMessageUsageV3URLLegacy)
      PBDataWriterWriteStringField();
    if (self->_proactiveRoutingURLLegacy)
      PBDataWriterWriteStringField();
    if (self->_backgroundDispatcherURLLegacy)
      PBDataWriterWriteStringField();
    if (self->_bluePOIURLLegacy)
      PBDataWriterWriteStringField();
    if (self->_backgroundRevGeoURLLegacy)
      PBDataWriterWriteStringField();
    if (self->_wifiConnectionQualityProbeURLLegacy)
      PBDataWriterWriteStringField();
    if (self->_muninBaseURL)
      PBDataWriterWriteStringField();
    if (self->_flyoverRegionVersions)
      PBDataWriterWriteDataField();
    if (self->_urlInfoSet)
      PBDataWriterWriteSubmessage();
    v126 = 0u;
    v127 = 0u;
    v124 = 0u;
    v125 = 0u;
    v90 = self->_muninBuckets;
    v91 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v90, "countByEnumeratingWithState:objects:count:", &v124, v211, 16);
    if (v91)
    {
      v92 = *(_QWORD *)v125;
      do
      {
        for (i11 = 0; i11 != v91; ++i11)
        {
          if (*(_QWORD *)v125 != v92)
            objc_enumerationMutation(v90);
          PBDataWriterWriteSubmessage();
        }
        v91 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v90, "countByEnumeratingWithState:objects:count:", &v124, v211, 16);
      }
      while (v91);
    }

    if (self->_environment)
      PBDataWriterWriteStringField();
    v122 = 0u;
    v123 = 0u;
    v120 = 0u;
    v121 = 0u;
    v94 = self->_displayStrings;
    v95 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v94, "countByEnumeratingWithState:objects:count:", &v120, v210, 16);
    if (v95)
    {
      v96 = *(_QWORD *)v121;
      do
      {
        for (i12 = 0; i12 != v95; ++i12)
        {
          if (*(_QWORD *)v121 != v96)
            objc_enumerationMutation(v94);
          PBDataWriterWriteSubmessage();
        }
        v95 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v94, "countByEnumeratingWithState:objects:count:", &v120, v210, 16);
      }
      while (v95);
    }

    v118 = 0u;
    v119 = 0u;
    v116 = 0u;
    v117 = 0u;
    v98 = self->_explicitResources;
    v99 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v98, "countByEnumeratingWithState:objects:count:", &v116, v209, 16);
    if (v99)
    {
      v100 = *(_QWORD *)v117;
      do
      {
        for (i13 = 0; i13 != v99; ++i13)
        {
          if (*(_QWORD *)v117 != v100)
            objc_enumerationMutation(v98);
          PBDataWriterWriteSubmessage();
        }
        v99 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v98, "countByEnumeratingWithState:objects:count:", &v116, v209, 16);
      }
      while (v99);
    }

    if (self->_offlineMetadata)
      PBDataWriterWriteSubmessage();
    resourceCanonicalNameToFileName = self->_resourceCanonicalNameToFileName;
    v103 = MEMORY[0x1E0C809B0];
    v114[0] = MEMORY[0x1E0C809B0];
    v114[1] = 3221225472;
    v114[2] = __30__GEOActiveTileGroup_writeTo___block_invoke;
    v114[3] = &unk_1E1C07D90;
    v104 = v4;
    v115 = v104;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](resourceCanonicalNameToFileName, "enumerateKeysAndObjectsUsingBlock:", v114);

    regionalResourceCanonicalNameToFileName = self->_regionalResourceCanonicalNameToFileName;
    v109 = v103;
    v110 = 3221225472;
    v111 = __30__GEOActiveTileGroup_writeTo___block_invoke_2;
    v112 = &unk_1E1C07D90;
    v106 = v104;
    v113 = v106;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](regionalResourceCanonicalNameToFileName, "enumerateKeysAndObjectsUsingBlock:", &v109);

    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v106, v109, v110, v111, v112);
  }

}

uint64_t __30__GEOActiveTileGroup_writeTo___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;

  v4 = a3;
  v5 = a2;
  PBDataWriterPlaceMark();
  PBDataWriterWriteStringField();

  PBDataWriterWriteStringField();
  return PBDataWriterRecallMark();
}

uint64_t __30__GEOActiveTileGroup_writeTo___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;

  v4 = a3;
  v5 = a2;
  PBDataWriterPlaceMark();
  PBDataWriterWriteStringField();

  PBDataWriterWriteStringField();
  return PBDataWriterRecallMark();
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  BOOL v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  -[GEOActiveTileGroup _readLocationShiftEnabledRegions]((uint64_t)self);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_locationShiftEnabledRegions;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "hasGreenTeaWithValue:", v3, (_QWORD)v12) & 1) != 0)
        {
          v10 = 1;
          goto LABEL_11;
        }
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v7)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (void)copyTo:(id)a3
{
  id *v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t j;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t k;
  void *v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t m;
  void *v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t n;
  void *v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t ii;
  void *v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t jj;
  void *v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t kk;
  void *v36;
  unint64_t v37;
  unint64_t v38;
  uint64_t mm;
  void *v40;
  unint64_t v41;
  unint64_t v42;
  uint64_t nn;
  void *v44;
  unint64_t v45;
  unint64_t v46;
  uint64_t i1;
  void *v48;
  unint64_t v49;
  unint64_t v50;
  uint64_t i2;
  void *v52;
  unint64_t v53;
  unint64_t v54;
  uint64_t i3;
  void *v56;
  unint64_t v57;
  unint64_t v58;
  uint64_t i4;
  void *v60;
  unint64_t v61;
  unint64_t v62;
  uint64_t i5;
  void *v64;
  unint64_t v65;
  unint64_t v66;
  uint64_t i6;
  void *v68;
  unint64_t v69;
  unint64_t v70;
  uint64_t i7;
  void *v72;
  unint64_t v73;
  unint64_t v74;
  uint64_t i8;
  unint64_t v76;
  unint64_t v77;
  uint64_t i9;
  void *v79;
  unint64_t v80;
  unint64_t v81;
  uint64_t i10;
  void *v83;
  unint64_t v84;
  unint64_t v85;
  uint64_t i11;
  unint64_t v87;
  unint64_t v88;
  uint64_t i12;
  unint64_t v90;
  unint64_t v91;
  uint64_t i13;
  void *v93;
  unint64_t v94;
  unint64_t v95;
  uint64_t i14;
  void *v97;
  unint64_t v98;
  unint64_t v99;
  uint64_t i15;
  void *v101;
  unint64_t v102;
  unint64_t v103;
  uint64_t i16;
  void *v105;
  unint64_t v106;
  uint64_t v107;
  id v108;
  id v109;
  NSMutableDictionary *resourceCanonicalNameToFileName;
  id v111;
  id v112;
  NSMutableDictionary *regionalResourceCanonicalNameToFileName;
  _QWORD v114[4];
  id *v115;
  _QWORD v116[4];
  id *v117;
  char v118[24];

  v4 = (id *)a3;
  -[GEOActiveTileGroup readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v4 + 1, self->_reader);
  *((_DWORD *)v4 + 152) = self->_readerMarkPos;
  *((_DWORD *)v4 + 153) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  *((_DWORD *)v4 + 155) = self->_identifier;
  if (-[GEOActiveTileGroup tileSetsCount](self, "tileSetsCount"))
  {
    objc_msgSend(v4, "clearTileSets");
    v5 = -[GEOActiveTileGroup tileSetsCount](self, "tileSetsCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        -[GEOActiveTileGroup tileSetAtIndex:](self, "tileSetAtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addTileSet:", v8);

      }
    }
  }
  if (-[GEOActiveTileGroup resourcesCount](self, "resourcesCount"))
  {
    objc_msgSend(v4, "clearResources");
    v9 = -[GEOActiveTileGroup resourcesCount](self, "resourcesCount");
    if (v9)
    {
      v10 = v9;
      for (j = 0; j != v10; ++j)
      {
        -[GEOActiveTileGroup resourceAtIndex:](self, "resourceAtIndex:", j);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addResource:", v12);

      }
    }
  }
  if (self->_uniqueIdentifier)
    objc_msgSend(v4, "setUniqueIdentifier:");
  if (-[GEOActiveTileGroup attributionsCount](self, "attributionsCount"))
  {
    objc_msgSend(v4, "clearAttributions");
    v13 = -[GEOActiveTileGroup attributionsCount](self, "attributionsCount");
    if (v13)
    {
      v14 = v13;
      for (k = 0; k != v14; ++k)
      {
        -[GEOActiveTileGroup attributionAtIndex:](self, "attributionAtIndex:", k);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addAttribution:", v16);

      }
    }
  }
  if (-[GEOActiveTileGroup regionalResourceTilesCount](self, "regionalResourceTilesCount"))
  {
    objc_msgSend(v4, "clearRegionalResourceTiles");
    v17 = -[GEOActiveTileGroup regionalResourceTilesCount](self, "regionalResourceTilesCount");
    if (v17)
    {
      v18 = v17;
      for (m = 0; m != v18; ++m)
      {
        -[GEOActiveTileGroup regionalResourceTileAtIndex:](self, "regionalResourceTileAtIndex:", m);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addRegionalResourceTile:", v20);

      }
    }
  }
  if (-[GEOActiveTileGroup regionalResourceRegionsCount](self, "regionalResourceRegionsCount"))
  {
    objc_msgSend(v4, "clearRegionalResourceRegions");
    v21 = -[GEOActiveTileGroup regionalResourceRegionsCount](self, "regionalResourceRegionsCount");
    if (v21)
    {
      v22 = v21;
      for (n = 0; n != v22; ++n)
      {
        -[GEOActiveTileGroup regionalResourceRegionAtIndex:](self, "regionalResourceRegionAtIndex:", n);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addRegionalResourceRegion:", v24);

      }
    }
  }
  if (self->_regionalResourcesURLLegacy)
    objc_msgSend(v4, "setRegionalResourcesURLLegacy:");
  if (self->_searchAttributionManifestURLLegacy)
    objc_msgSend(v4, "setSearchAttributionManifestURLLegacy:");
  if (self->_directionsURLLegacy)
    objc_msgSend(v4, "setDirectionsURLLegacy:");
  if (self->_etaURLLegacy)
    objc_msgSend(v4, "setEtaURLLegacy:");
  if (self->_batchReverseGeocoderURLLegacy)
    objc_msgSend(v4, "setBatchReverseGeocoderURLLegacy:");
  if (self->_releaseInfo)
    objc_msgSend(v4, "setReleaseInfo:");
  if (self->_resourcesURLLegacy)
    objc_msgSend(v4, "setResourcesURLLegacy:");
  if (self->_simpleETAURLLegacy)
    objc_msgSend(v4, "setSimpleETAURLLegacy:");
  if (self->_addressCorrectionInitURLLegacy)
    objc_msgSend(v4, "setAddressCorrectionInitURLLegacy:");
  if (self->_addressCorrectionUpdateURLLegacy)
    objc_msgSend(v4, "setAddressCorrectionUpdateURLLegacy:");
  if (self->_polyLocationShiftURLLegacy)
    objc_msgSend(v4, "setPolyLocationShiftURLLegacy:");
  if (self->_problemSubmissionURLLegacy)
    objc_msgSend(v4, "setProblemSubmissionURLLegacy:");
  if (self->_problemStatusURLLegacy)
    objc_msgSend(v4, "setProblemStatusURLLegacy:");
  if (self->_reverseGeocoderVersionsURLLegacy)
    objc_msgSend(v4, "setReverseGeocoderVersionsURLLegacy:");
  if (self->_problemCategoriesURLLegacy)
    objc_msgSend(v4, "setProblemCategoriesURLLegacy:");
  if (self->_announcementsURLLegacy)
    objc_msgSend(v4, "setAnnouncementsURLLegacy:");
  if (-[GEOActiveTileGroup announcementsSupportedLanguagesCount](self, "announcementsSupportedLanguagesCount"))
  {
    objc_msgSend(v4, "clearAnnouncementsSupportedLanguages");
    v25 = -[GEOActiveTileGroup announcementsSupportedLanguagesCount](self, "announcementsSupportedLanguagesCount");
    if (v25)
    {
      v26 = v25;
      for (ii = 0; ii != v26; ++ii)
      {
        -[GEOActiveTileGroup announcementsSupportedLanguagesAtIndex:](self, "announcementsSupportedLanguagesAtIndex:", ii);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addAnnouncementsSupportedLanguages:", v28);

      }
    }
  }
  if (self->_dispatcherURLLegacy)
    objc_msgSend(v4, "setDispatcherURLLegacy:");
  if (self->_problemOptInURLLegacy)
    objc_msgSend(v4, "setProblemOptInURLLegacy:");
  if (self->_versionManifest)
    objc_msgSend(v4, "setVersionManifest:");
  if (-[GEOActiveTileGroup styleSheetsCount](self, "styleSheetsCount"))
  {
    objc_msgSend(v4, "clearStyleSheets");
    v29 = -[GEOActiveTileGroup styleSheetsCount](self, "styleSheetsCount");
    if (v29)
    {
      v30 = v29;
      for (jj = 0; jj != v30; ++jj)
      {
        -[GEOActiveTileGroup styleSheetAtIndex:](self, "styleSheetAtIndex:", jj);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addStyleSheet:", v32);

      }
    }
  }
  if (-[GEOActiveTileGroup styleSheetChecksumsCount](self, "styleSheetChecksumsCount"))
  {
    objc_msgSend(v4, "clearStyleSheetChecksums");
    v33 = -[GEOActiveTileGroup styleSheetChecksumsCount](self, "styleSheetChecksumsCount");
    if (v33)
    {
      v34 = v33;
      for (kk = 0; kk != v34; ++kk)
      {
        -[GEOActiveTileGroup styleSheetChecksumAtIndex:](self, "styleSheetChecksumAtIndex:", kk);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addStyleSheetChecksum:", v36);

      }
    }
  }
  if (-[GEOActiveTileGroup texturesCount](self, "texturesCount"))
  {
    objc_msgSend(v4, "clearTextures");
    v37 = -[GEOActiveTileGroup texturesCount](self, "texturesCount");
    if (v37)
    {
      v38 = v37;
      for (mm = 0; mm != v38; ++mm)
      {
        -[GEOActiveTileGroup textureAtIndex:](self, "textureAtIndex:", mm);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addTexture:", v40);

      }
    }
  }
  if (-[GEOActiveTileGroup textureChecksumsCount](self, "textureChecksumsCount"))
  {
    objc_msgSend(v4, "clearTextureChecksums");
    v41 = -[GEOActiveTileGroup textureChecksumsCount](self, "textureChecksumsCount");
    if (v41)
    {
      v42 = v41;
      for (nn = 0; nn != v42; ++nn)
      {
        -[GEOActiveTileGroup textureChecksumAtIndex:](self, "textureChecksumAtIndex:", nn);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addTextureChecksum:", v44);

      }
    }
  }
  if (-[GEOActiveTileGroup fontsCount](self, "fontsCount"))
  {
    objc_msgSend(v4, "clearFonts");
    v45 = -[GEOActiveTileGroup fontsCount](self, "fontsCount");
    if (v45)
    {
      v46 = v45;
      for (i1 = 0; i1 != v46; ++i1)
      {
        -[GEOActiveTileGroup fontAtIndex:](self, "fontAtIndex:", i1);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addFont:", v48);

      }
    }
  }
  if (-[GEOActiveTileGroup fontChecksumsCount](self, "fontChecksumsCount"))
  {
    objc_msgSend(v4, "clearFontChecksums");
    v49 = -[GEOActiveTileGroup fontChecksumsCount](self, "fontChecksumsCount");
    if (v49)
    {
      v50 = v49;
      for (i2 = 0; i2 != v50; ++i2)
      {
        -[GEOActiveTileGroup fontChecksumAtIndex:](self, "fontChecksumAtIndex:", i2);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addFontChecksum:", v52);

      }
    }
  }
  if (-[GEOActiveTileGroup iconsCount](self, "iconsCount"))
  {
    objc_msgSend(v4, "clearIcons");
    v53 = -[GEOActiveTileGroup iconsCount](self, "iconsCount");
    if (v53)
    {
      v54 = v53;
      for (i3 = 0; i3 != v54; ++i3)
      {
        -[GEOActiveTileGroup iconAtIndex:](self, "iconAtIndex:", i3);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addIcon:", v56);

      }
    }
  }
  if (-[GEOActiveTileGroup iconChecksumsCount](self, "iconChecksumsCount"))
  {
    objc_msgSend(v4, "clearIconChecksums");
    v57 = -[GEOActiveTileGroup iconChecksumsCount](self, "iconChecksumsCount");
    if (v57)
    {
      v58 = v57;
      for (i4 = 0; i4 != v58; ++i4)
      {
        -[GEOActiveTileGroup iconChecksumAtIndex:](self, "iconChecksumAtIndex:", i4);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addIconChecksum:", v60);

      }
    }
  }
  if (-[GEOActiveTileGroup xmlsCount](self, "xmlsCount"))
  {
    objc_msgSend(v4, "clearXmls");
    v61 = -[GEOActiveTileGroup xmlsCount](self, "xmlsCount");
    if (v61)
    {
      v62 = v61;
      for (i5 = 0; i5 != v62; ++i5)
      {
        -[GEOActiveTileGroup xmlAtIndex:](self, "xmlAtIndex:", i5);
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addXml:", v64);

      }
    }
  }
  if (-[GEOActiveTileGroup xmlChecksumsCount](self, "xmlChecksumsCount"))
  {
    objc_msgSend(v4, "clearXmlChecksums");
    v65 = -[GEOActiveTileGroup xmlChecksumsCount](self, "xmlChecksumsCount");
    if (v65)
    {
      v66 = v65;
      for (i6 = 0; i6 != v66; ++i6)
      {
        -[GEOActiveTileGroup xmlChecksumAtIndex:](self, "xmlChecksumAtIndex:", i6);
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addXmlChecksum:", v68);

      }
    }
  }
  if (self->_abExperimentURLLegacy)
    objc_msgSend(v4, "setAbExperimentURLLegacy:");
  if (self->_businessPortalBaseURLLegacy)
    objc_msgSend(v4, "setBusinessPortalBaseURLLegacy:");
  if (self->_logMessageUsageURLLegacy)
    objc_msgSend(v4, "setLogMessageUsageURLLegacy:");
  if (-[GEOActiveTileGroup locationShiftEnabledRegionsCount](self, "locationShiftEnabledRegionsCount"))
  {
    objc_msgSend(v4, "clearLocationShiftEnabledRegions");
    v69 = -[GEOActiveTileGroup locationShiftEnabledRegionsCount](self, "locationShiftEnabledRegionsCount");
    if (v69)
    {
      v70 = v69;
      for (i7 = 0; i7 != v70; ++i7)
      {
        -[GEOActiveTileGroup locationShiftEnabledRegionAtIndex:](self, "locationShiftEnabledRegionAtIndex:", i7);
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addLocationShiftEnabledRegion:", v72);

      }
    }
  }
  if ((*(_QWORD *)&self->_flags & 1) != 0)
  {
    *((_DWORD *)v4 + 156) = self->_locationShiftVersion;
    v4[79] = (id)((unint64_t)v4[79] | 1);
  }
  if (-[GEOActiveTileGroup hybridUnavailableRegionsCount](self, "hybridUnavailableRegionsCount"))
  {
    objc_msgSend(v4, "clearHybridUnavailableRegions");
    v73 = -[GEOActiveTileGroup hybridUnavailableRegionsCount](self, "hybridUnavailableRegionsCount");
    if (v73)
    {
      v74 = v73;
      for (i8 = 0; i8 != v74; ++i8)
      {
        -[GEOActiveTileGroup hybridUnavailableRegionAtIndex:](self, "hybridUnavailableRegionAtIndex:", i8);
        objc_msgSend(v4, "addHybridUnavailableRegion:", v118);
      }
    }
  }
  if (self->_reserved)
    objc_msgSend(v4, "setReserved:");
  if (self->_spatialLookupURLLegacy)
    objc_msgSend(v4, "setSpatialLookupURLLegacy:");
  if (-[GEOActiveTileGroup activeResourcesCount](self, "activeResourcesCount"))
  {
    objc_msgSend(v4, "clearActiveResources");
    v76 = -[GEOActiveTileGroup activeResourcesCount](self, "activeResourcesCount");
    if (v76)
    {
      v77 = v76;
      for (i9 = 0; i9 != v77; ++i9)
      {
        -[GEOActiveTileGroup activeResourceAtIndex:](self, "activeResourceAtIndex:", i9);
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addActiveResource:", v79);

      }
    }
  }
  if (-[GEOActiveTileGroup regionalResourcesCount](self, "regionalResourcesCount"))
  {
    objc_msgSend(v4, "clearRegionalResources");
    v80 = -[GEOActiveTileGroup regionalResourcesCount](self, "regionalResourcesCount");
    if (v80)
    {
      v81 = v80;
      for (i10 = 0; i10 != v81; ++i10)
      {
        -[GEOActiveTileGroup regionalResourceAtIndex:](self, "regionalResourceAtIndex:", i10);
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addRegionalResource:", v83);

      }
    }
  }
  if ((*(_QWORD *)&self->_flags & 2) != 0)
  {
    *((_DWORD *)v4 + 157) = self->_modelVersion;
    v4[79] = (id)((unint64_t)v4[79] | 2);
  }
  if (-[GEOActiveTileGroup activeScalesCount](self, "activeScalesCount"))
  {
    objc_msgSend(v4, "clearActiveScales");
    v84 = -[GEOActiveTileGroup activeScalesCount](self, "activeScalesCount");
    if (v84)
    {
      v85 = v84;
      for (i11 = 0; i11 != v85; ++i11)
        objc_msgSend(v4, "addActiveScale:", -[GEOActiveTileGroup activeScaleAtIndex:](self, "activeScaleAtIndex:", i11));
    }
  }
  if (-[GEOActiveTileGroup activeScenariosCount](self, "activeScenariosCount"))
  {
    objc_msgSend(v4, "clearActiveScenarios");
    v87 = -[GEOActiveTileGroup activeScenariosCount](self, "activeScenariosCount");
    if (v87)
    {
      v88 = v87;
      for (i12 = 0; i12 != v88; ++i12)
        objc_msgSend(v4, "addActiveScenario:", -[GEOActiveTileGroup activeScenarioAtIndex:](self, "activeScenarioAtIndex:", i12));
    }
  }
  if (-[GEOActiveTileGroup staleResourcesCount](self, "staleResourcesCount"))
  {
    objc_msgSend(v4, "clearStaleResources");
    v90 = -[GEOActiveTileGroup staleResourcesCount](self, "staleResourcesCount");
    if (v90)
    {
      v91 = v90;
      for (i13 = 0; i13 != v91; ++i13)
      {
        -[GEOActiveTileGroup staleResourceAtIndex:](self, "staleResourceAtIndex:", i13);
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addStaleResource:", v93);

      }
    }
  }
  if (self->_dataSet)
    objc_msgSend(v4, "setDataSet:");
  if (self->_realtimeTrafficProbeURLLegacy)
    objc_msgSend(v4, "setRealtimeTrafficProbeURLLegacy:");
  if (self->_batchTrafficProbeURLLegacy)
    objc_msgSend(v4, "setBatchTrafficProbeURLLegacy:");
  if (self->_logMessageUsageV3URLLegacy)
    objc_msgSend(v4, "setLogMessageUsageV3URLLegacy:");
  if (self->_proactiveRoutingURLLegacy)
    objc_msgSend(v4, "setProactiveRoutingURLLegacy:");
  if (self->_backgroundDispatcherURLLegacy)
    objc_msgSend(v4, "setBackgroundDispatcherURLLegacy:");
  if (self->_bluePOIURLLegacy)
    objc_msgSend(v4, "setBluePOIURLLegacy:");
  if (self->_backgroundRevGeoURLLegacy)
    objc_msgSend(v4, "setBackgroundRevGeoURLLegacy:");
  if (self->_wifiConnectionQualityProbeURLLegacy)
    objc_msgSend(v4, "setWifiConnectionQualityProbeURLLegacy:");
  if (self->_muninBaseURL)
    objc_msgSend(v4, "setMuninBaseURL:");
  if (self->_flyoverRegionVersions)
    objc_msgSend(v4, "setFlyoverRegionVersions:");
  if (self->_urlInfoSet)
    objc_msgSend(v4, "setUrlInfoSet:");
  if (-[GEOActiveTileGroup muninBucketsCount](self, "muninBucketsCount"))
  {
    objc_msgSend(v4, "clearMuninBuckets");
    v94 = -[GEOActiveTileGroup muninBucketsCount](self, "muninBucketsCount");
    if (v94)
    {
      v95 = v94;
      for (i14 = 0; i14 != v95; ++i14)
      {
        -[GEOActiveTileGroup muninBucketAtIndex:](self, "muninBucketAtIndex:", i14);
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addMuninBucket:", v97);

      }
    }
  }
  if (self->_environment)
    objc_msgSend(v4, "setEnvironment:");
  if (-[GEOActiveTileGroup displayStringsCount](self, "displayStringsCount"))
  {
    objc_msgSend(v4, "clearDisplayStrings");
    v98 = -[GEOActiveTileGroup displayStringsCount](self, "displayStringsCount");
    if (v98)
    {
      v99 = v98;
      for (i15 = 0; i15 != v99; ++i15)
      {
        -[GEOActiveTileGroup displayStringsAtIndex:](self, "displayStringsAtIndex:", i15);
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addDisplayStrings:", v101);

      }
    }
  }
  if (-[GEOActiveTileGroup explicitResourcesCount](self, "explicitResourcesCount"))
  {
    objc_msgSend(v4, "clearExplicitResources");
    v102 = -[GEOActiveTileGroup explicitResourcesCount](self, "explicitResourcesCount");
    if (v102)
    {
      v103 = v102;
      for (i16 = 0; i16 != v103; ++i16)
      {
        -[GEOActiveTileGroup explicitResourceAtIndex:](self, "explicitResourceAtIndex:", i16);
        v105 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addExplicitResource:", v105);

      }
    }
  }
  if (self->_offlineMetadata)
    objc_msgSend(v4, "setOfflineMetadata:");
  v106 = -[GEOActiveTileGroup resourceCanonicalNameToFileNameCount](self, "resourceCanonicalNameToFileNameCount");
  v107 = MEMORY[0x1E0C809B0];
  if (v106)
  {
    objc_msgSend(v4, "clearResourceCanonicalNameToFileName");
    if (!v4[57])
    {
      v108 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v109 = v4[57];
      v4[57] = v108;

    }
    resourceCanonicalNameToFileName = self->_resourceCanonicalNameToFileName;
    v116[0] = v107;
    v116[1] = 3221225472;
    v116[2] = __29__GEOActiveTileGroup_copyTo___block_invoke;
    v116[3] = &unk_1E1C07D90;
    v117 = v4;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](resourceCanonicalNameToFileName, "enumerateKeysAndObjectsUsingBlock:", v116);

  }
  if (-[GEOActiveTileGroup regionalResourceCanonicalNameToFileNameCount](self, "regionalResourceCanonicalNameToFileNameCount"))
  {
    objc_msgSend(v4, "clearRegionalResourceCanonicalNameToFileName");
    if (!v4[50])
    {
      v111 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v112 = v4[50];
      v4[50] = v111;

    }
    regionalResourceCanonicalNameToFileName = self->_regionalResourceCanonicalNameToFileName;
    v114[0] = v107;
    v114[1] = 3221225472;
    v114[2] = __29__GEOActiveTileGroup_copyTo___block_invoke_2;
    v114[3] = &unk_1E1C07D90;
    v115 = v4;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](regionalResourceCanonicalNameToFileName, "enumerateKeysAndObjectsUsingBlock:", v114);

  }
}

void __29__GEOActiveTileGroup_copyTo___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v5 = a2;
  v6 = (id)objc_msgSend(a3, "copy");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 456), "setObject:forKey:", v6, v5);

}

void __29__GEOActiveTileGroup_copyTo___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v5 = a2;
  v6 = (id)objc_msgSend(a3, "copy");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 400), "setObject:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  uint64_t v19;
  void *v20;
  NSMutableArray *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t k;
  void *v25;
  NSMutableArray *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t m;
  void *v30;
  NSMutableArray *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t n;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  void *v67;
  NSMutableArray *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t ii;
  void *v72;
  uint64_t v73;
  void *v74;
  uint64_t v75;
  void *v76;
  id v77;
  void *v78;
  NSMutableArray *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t jj;
  void *v83;
  NSMutableArray *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t kk;
  void *v88;
  NSMutableArray *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t mm;
  void *v93;
  NSMutableArray *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t nn;
  void *v98;
  NSMutableArray *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t i1;
  void *v103;
  NSMutableArray *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t i2;
  void *v108;
  NSMutableArray *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t i3;
  void *v113;
  NSMutableArray *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t i4;
  void *v118;
  NSMutableArray *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t i5;
  void *v123;
  NSMutableArray *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t i6;
  void *v128;
  uint64_t v129;
  void *v130;
  uint64_t v131;
  void *v132;
  uint64_t v133;
  void *v134;
  NSMutableArray *v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t i7;
  void *v139;
  unint64_t hybridUnavailableRegionsCount;
  uint64_t v141;
  void *v142;
  uint64_t v143;
  void *v144;
  NSMutableArray *v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t i8;
  void *v149;
  NSMutableArray *v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t i9;
  void *v154;
  NSMutableArray *v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t i10;
  void *v159;
  id v160;
  void *v161;
  uint64_t v162;
  void *v163;
  uint64_t v164;
  void *v165;
  uint64_t v166;
  void *v167;
  uint64_t v168;
  void *v169;
  uint64_t v170;
  void *v171;
  uint64_t v172;
  void *v173;
  uint64_t v174;
  void *v175;
  uint64_t v176;
  void *v177;
  uint64_t v178;
  void *v179;
  uint64_t v180;
  void *v181;
  id v182;
  void *v183;
  NSMutableArray *v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t i11;
  void *v188;
  uint64_t v189;
  void *v190;
  NSMutableArray *v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t i12;
  void *v195;
  NSMutableArray *v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t i13;
  void *v200;
  id v201;
  void *v202;
  uint64_t v203;
  uint64_t v204;
  id v205;
  void *v206;
  NSMutableDictionary *resourceCanonicalNameToFileName;
  id v208;
  void *v209;
  NSMutableDictionary *regionalResourceCanonicalNameToFileName;
  id v211;
  _QWORD v213[4];
  id v214;
  _NSZone *v215;
  _QWORD v216[4];
  id v217;
  _NSZone *v218;
  __int128 v219;
  __int128 v220;
  __int128 v221;
  __int128 v222;
  __int128 v223;
  __int128 v224;
  __int128 v225;
  __int128 v226;
  __int128 v227;
  __int128 v228;
  __int128 v229;
  __int128 v230;
  __int128 v231;
  __int128 v232;
  __int128 v233;
  __int128 v234;
  __int128 v235;
  __int128 v236;
  __int128 v237;
  __int128 v238;
  __int128 v239;
  __int128 v240;
  __int128 v241;
  __int128 v242;
  __int128 v243;
  __int128 v244;
  __int128 v245;
  __int128 v246;
  __int128 v247;
  __int128 v248;
  __int128 v249;
  __int128 v250;
  __int128 v251;
  __int128 v252;
  __int128 v253;
  __int128 v254;
  __int128 v255;
  __int128 v256;
  __int128 v257;
  __int128 v258;
  __int128 v259;
  __int128 v260;
  __int128 v261;
  __int128 v262;
  __int128 v263;
  __int128 v264;
  __int128 v265;
  __int128 v266;
  __int128 v267;
  __int128 v268;
  __int128 v269;
  __int128 v270;
  __int128 v271;
  __int128 v272;
  __int128 v273;
  __int128 v274;
  __int128 v275;
  __int128 v276;
  __int128 v277;
  __int128 v278;
  __int128 v279;
  __int128 v280;
  __int128 v281;
  __int128 v282;
  __int128 v283;
  __int128 v284;
  __int128 v285;
  __int128 v286;
  __int128 v287;
  __int128 v288;
  __int128 v289;
  __int128 v290;
  __int128 v291;
  __int128 v292;
  __int128 v293;
  __int128 v294;
  __int128 v295;
  __int128 v296;
  __int128 v297;
  __int128 v298;
  __int128 v299;
  __int128 v300;
  __int128 v301;
  __int128 v302;
  __int128 v303;
  __int128 v304;
  __int128 v305;
  __int128 v306;
  __int128 v307;
  __int128 v308;
  __int128 v309;
  __int128 v310;
  _BYTE v311[128];
  _BYTE v312[128];
  _BYTE v313[128];
  _BYTE v314[128];
  _BYTE v315[128];
  _BYTE v316[128];
  _BYTE v317[128];
  _BYTE v318[128];
  _BYTE v319[128];
  _BYTE v320[128];
  _BYTE v321[128];
  _BYTE v322[128];
  _BYTE v323[128];
  _BYTE v324[128];
  _BYTE v325[128];
  _BYTE v326[128];
  _BYTE v327[128];
  _BYTE v328[128];
  _BYTE v329[128];
  _BYTE v330[128];
  _BYTE v331[128];
  _BYTE v332[128];
  _BYTE v333[128];
  uint64_t v334;

  v334 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*((_BYTE *)&self->_flags + 8) & 0x40) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOActiveTileGroupReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_177;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOActiveTileGroup readAll:](self, "readAll:", 0);
  *(_DWORD *)(v5 + 620) = self->_identifier;
  v310 = 0u;
  v309 = 0u;
  v308 = 0u;
  v307 = 0u;
  v9 = self->_tileSets;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v307, v333, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v308;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v308 != v11)
          objc_enumerationMutation(v9);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v307 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addTileSet:", v13);

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v307, v333, 16);
    }
    while (v10);
  }

  v306 = 0u;
  v305 = 0u;
  v304 = 0u;
  v303 = 0u;
  v14 = self->_resources;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v303, v332, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v304;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v304 != v16)
          objc_enumerationMutation(v14);
        v18 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v303 + 1) + 8 * j), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addResource:", v18);

      }
      v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v303, v332, 16);
    }
    while (v15);
  }

  v19 = -[NSString copyWithZone:](self->_uniqueIdentifier, "copyWithZone:", a3);
  v20 = *(void **)(v5 + 560);
  *(_QWORD *)(v5 + 560) = v19;

  v302 = 0u;
  v301 = 0u;
  v300 = 0u;
  v299 = 0u;
  v21 = self->_attributions;
  v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v299, v331, 16);
  if (v22)
  {
    v23 = *(_QWORD *)v300;
    do
    {
      for (k = 0; k != v22; ++k)
      {
        if (*(_QWORD *)v300 != v23)
          objc_enumerationMutation(v21);
        v25 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v299 + 1) + 8 * k), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addAttribution:", v25);

      }
      v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v299, v331, 16);
    }
    while (v22);
  }

  v298 = 0u;
  v297 = 0u;
  v296 = 0u;
  v295 = 0u;
  v26 = self->_regionalResourceTiles;
  v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v295, v330, 16);
  if (v27)
  {
    v28 = *(_QWORD *)v296;
    do
    {
      for (m = 0; m != v27; ++m)
      {
        if (*(_QWORD *)v296 != v28)
          objc_enumerationMutation(v26);
        v30 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v295 + 1) + 8 * m), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addRegionalResourceTile:", v30);

      }
      v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v295, v330, 16);
    }
    while (v27);
  }

  v294 = 0u;
  v293 = 0u;
  v292 = 0u;
  v291 = 0u;
  v31 = self->_regionalResourceRegions;
  v32 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v291, v329, 16);
  if (v32)
  {
    v33 = *(_QWORD *)v292;
    do
    {
      for (n = 0; n != v32; ++n)
      {
        if (*(_QWORD *)v292 != v33)
          objc_enumerationMutation(v31);
        v35 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v291 + 1) + 8 * n), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addRegionalResourceRegion:", v35);

      }
      v32 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v291, v329, 16);
    }
    while (v32);
  }

  v36 = -[NSString copyWithZone:](self->_regionalResourcesURLLegacy, "copyWithZone:", a3);
  v37 = *(void **)(v5 + 424);
  *(_QWORD *)(v5 + 424) = v36;

  v38 = -[NSString copyWithZone:](self->_searchAttributionManifestURLLegacy, "copyWithZone:", a3);
  v39 = *(void **)(v5 + 488);
  *(_QWORD *)(v5 + 488) = v38;

  v40 = -[NSString copyWithZone:](self->_directionsURLLegacy, "copyWithZone:", a3);
  v41 = *(void **)(v5 + 208);
  *(_QWORD *)(v5 + 208) = v40;

  v42 = -[NSString copyWithZone:](self->_etaURLLegacy, "copyWithZone:", a3);
  v43 = *(void **)(v5 + 240);
  *(_QWORD *)(v5 + 240) = v42;

  v44 = -[NSString copyWithZone:](self->_batchReverseGeocoderURLLegacy, "copyWithZone:", a3);
  v45 = *(void **)(v5 + 168);
  *(_QWORD *)(v5 + 168) = v44;

  v46 = -[NSString copyWithZone:](self->_releaseInfo, "copyWithZone:", a3);
  v47 = *(void **)(v5 + 440);
  *(_QWORD *)(v5 + 440) = v46;

  v48 = -[NSString copyWithZone:](self->_resourcesURLLegacy, "copyWithZone:", a3);
  v49 = *(void **)(v5 + 464);
  *(_QWORD *)(v5 + 464) = v48;

  v50 = -[NSString copyWithZone:](self->_simpleETAURLLegacy, "copyWithZone:", a3);
  v51 = *(void **)(v5 + 496);
  *(_QWORD *)(v5 + 496) = v50;

  v52 = -[NSString copyWithZone:](self->_addressCorrectionInitURLLegacy, "copyWithZone:", a3);
  v53 = *(void **)(v5 + 112);
  *(_QWORD *)(v5 + 112) = v52;

  v54 = -[NSString copyWithZone:](self->_addressCorrectionUpdateURLLegacy, "copyWithZone:", a3);
  v55 = *(void **)(v5 + 120);
  *(_QWORD *)(v5 + 120) = v54;

  v56 = -[NSString copyWithZone:](self->_polyLocationShiftURLLegacy, "copyWithZone:", a3);
  v57 = *(void **)(v5 + 344);
  *(_QWORD *)(v5 + 344) = v56;

  v58 = -[NSString copyWithZone:](self->_problemSubmissionURLLegacy, "copyWithZone:", a3);
  v59 = *(void **)(v5 + 384);
  *(_QWORD *)(v5 + 384) = v58;

  v60 = -[NSString copyWithZone:](self->_problemStatusURLLegacy, "copyWithZone:", a3);
  v61 = *(void **)(v5 + 376);
  *(_QWORD *)(v5 + 376) = v60;

  v62 = -[NSString copyWithZone:](self->_reverseGeocoderVersionsURLLegacy, "copyWithZone:", a3);
  v63 = *(void **)(v5 + 480);
  *(_QWORD *)(v5 + 480) = v62;

  v64 = -[NSString copyWithZone:](self->_problemCategoriesURLLegacy, "copyWithZone:", a3);
  v65 = *(void **)(v5 + 360);
  *(_QWORD *)(v5 + 360) = v64;

  v66 = -[NSString copyWithZone:](self->_announcementsURLLegacy, "copyWithZone:", a3);
  v67 = *(void **)(v5 + 136);
  *(_QWORD *)(v5 + 136) = v66;

  v290 = 0u;
  v289 = 0u;
  v288 = 0u;
  v287 = 0u;
  v68 = self->_announcementsSupportedLanguages;
  v69 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v68, "countByEnumeratingWithState:objects:count:", &v287, v328, 16);
  if (v69)
  {
    v70 = *(_QWORD *)v288;
    do
    {
      for (ii = 0; ii != v69; ++ii)
      {
        if (*(_QWORD *)v288 != v70)
          objc_enumerationMutation(v68);
        v72 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v287 + 1) + 8 * ii), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addAnnouncementsSupportedLanguages:", v72);

      }
      v69 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v68, "countByEnumeratingWithState:objects:count:", &v287, v328, 16);
    }
    while (v69);
  }

  v73 = -[NSString copyWithZone:](self->_dispatcherURLLegacy, "copyWithZone:", a3);
  v74 = *(void **)(v5 + 216);
  *(_QWORD *)(v5 + 216) = v73;

  v75 = -[NSString copyWithZone:](self->_problemOptInURLLegacy, "copyWithZone:", a3);
  v76 = *(void **)(v5 + 368);
  *(_QWORD *)(v5 + 368) = v75;

  v77 = -[GEOVersionManifest copyWithZone:](self->_versionManifest, "copyWithZone:", a3);
  v78 = *(void **)(v5 + 576);
  *(_QWORD *)(v5 + 576) = v77;

  v286 = 0u;
  v285 = 0u;
  v284 = 0u;
  v283 = 0u;
  v79 = self->_styleSheets;
  v80 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v79, "countByEnumeratingWithState:objects:count:", &v283, v327, 16);
  if (v80)
  {
    v81 = *(_QWORD *)v284;
    do
    {
      for (jj = 0; jj != v80; ++jj)
      {
        if (*(_QWORD *)v284 != v81)
          objc_enumerationMutation(v79);
        v83 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v283 + 1) + 8 * jj), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addStyleSheet:", v83);

      }
      v80 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v79, "countByEnumeratingWithState:objects:count:", &v283, v327, 16);
    }
    while (v80);
  }

  v282 = 0u;
  v281 = 0u;
  v280 = 0u;
  v279 = 0u;
  v84 = self->_styleSheetChecksums;
  v85 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v84, "countByEnumeratingWithState:objects:count:", &v279, v326, 16);
  if (v85)
  {
    v86 = *(_QWORD *)v280;
    do
    {
      for (kk = 0; kk != v85; ++kk)
      {
        if (*(_QWORD *)v280 != v86)
          objc_enumerationMutation(v84);
        v88 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v279 + 1) + 8 * kk), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addStyleSheetChecksum:", v88);

      }
      v85 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v84, "countByEnumeratingWithState:objects:count:", &v279, v326, 16);
    }
    while (v85);
  }

  v278 = 0u;
  v276 = 0u;
  v277 = 0u;
  v275 = 0u;
  v89 = self->_textures;
  v90 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v89, "countByEnumeratingWithState:objects:count:", &v275, v325, 16);
  if (v90)
  {
    v91 = *(_QWORD *)v276;
    do
    {
      for (mm = 0; mm != v90; ++mm)
      {
        if (*(_QWORD *)v276 != v91)
          objc_enumerationMutation(v89);
        v93 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v275 + 1) + 8 * mm), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addTexture:", v93);

      }
      v90 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v89, "countByEnumeratingWithState:objects:count:", &v275, v325, 16);
    }
    while (v90);
  }

  v273 = 0u;
  v274 = 0u;
  v271 = 0u;
  v272 = 0u;
  v94 = self->_textureChecksums;
  v95 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v94, "countByEnumeratingWithState:objects:count:", &v271, v324, 16);
  if (v95)
  {
    v96 = *(_QWORD *)v272;
    do
    {
      for (nn = 0; nn != v95; ++nn)
      {
        if (*(_QWORD *)v272 != v96)
          objc_enumerationMutation(v94);
        v98 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v271 + 1) + 8 * nn), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addTextureChecksum:", v98);

      }
      v95 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v94, "countByEnumeratingWithState:objects:count:", &v271, v324, 16);
    }
    while (v95);
  }

  v269 = 0u;
  v270 = 0u;
  v267 = 0u;
  v268 = 0u;
  v99 = self->_fonts;
  v100 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v99, "countByEnumeratingWithState:objects:count:", &v267, v323, 16);
  if (v100)
  {
    v101 = *(_QWORD *)v268;
    do
    {
      for (i1 = 0; i1 != v100; ++i1)
      {
        if (*(_QWORD *)v268 != v101)
          objc_enumerationMutation(v99);
        v103 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v267 + 1) + 8 * i1), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addFont:", v103);

      }
      v100 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v99, "countByEnumeratingWithState:objects:count:", &v267, v323, 16);
    }
    while (v100);
  }

  v265 = 0u;
  v266 = 0u;
  v263 = 0u;
  v264 = 0u;
  v104 = self->_fontChecksums;
  v105 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v104, "countByEnumeratingWithState:objects:count:", &v263, v322, 16);
  if (v105)
  {
    v106 = *(_QWORD *)v264;
    do
    {
      for (i2 = 0; i2 != v105; ++i2)
      {
        if (*(_QWORD *)v264 != v106)
          objc_enumerationMutation(v104);
        v108 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v263 + 1) + 8 * i2), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addFontChecksum:", v108);

      }
      v105 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v104, "countByEnumeratingWithState:objects:count:", &v263, v322, 16);
    }
    while (v105);
  }

  v261 = 0u;
  v262 = 0u;
  v259 = 0u;
  v260 = 0u;
  v109 = self->_icons;
  v110 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v109, "countByEnumeratingWithState:objects:count:", &v259, v321, 16);
  if (v110)
  {
    v111 = *(_QWORD *)v260;
    do
    {
      for (i3 = 0; i3 != v110; ++i3)
      {
        if (*(_QWORD *)v260 != v111)
          objc_enumerationMutation(v109);
        v113 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v259 + 1) + 8 * i3), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addIcon:", v113);

      }
      v110 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v109, "countByEnumeratingWithState:objects:count:", &v259, v321, 16);
    }
    while (v110);
  }

  v257 = 0u;
  v258 = 0u;
  v255 = 0u;
  v256 = 0u;
  v114 = self->_iconChecksums;
  v115 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v114, "countByEnumeratingWithState:objects:count:", &v255, v320, 16);
  if (v115)
  {
    v116 = *(_QWORD *)v256;
    do
    {
      for (i4 = 0; i4 != v115; ++i4)
      {
        if (*(_QWORD *)v256 != v116)
          objc_enumerationMutation(v114);
        v118 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v255 + 1) + 8 * i4), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addIconChecksum:", v118);

      }
      v115 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v114, "countByEnumeratingWithState:objects:count:", &v255, v320, 16);
    }
    while (v115);
  }

  v253 = 0u;
  v254 = 0u;
  v251 = 0u;
  v252 = 0u;
  v119 = self->_xmls;
  v120 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v119, "countByEnumeratingWithState:objects:count:", &v251, v319, 16);
  if (v120)
  {
    v121 = *(_QWORD *)v252;
    do
    {
      for (i5 = 0; i5 != v120; ++i5)
      {
        if (*(_QWORD *)v252 != v121)
          objc_enumerationMutation(v119);
        v123 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v251 + 1) + 8 * i5), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addXml:", v123);

      }
      v120 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v119, "countByEnumeratingWithState:objects:count:", &v251, v319, 16);
    }
    while (v120);
  }

  v249 = 0u;
  v250 = 0u;
  v247 = 0u;
  v248 = 0u;
  v124 = self->_xmlChecksums;
  v125 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v124, "countByEnumeratingWithState:objects:count:", &v247, v318, 16);
  if (v125)
  {
    v126 = *(_QWORD *)v248;
    do
    {
      for (i6 = 0; i6 != v125; ++i6)
      {
        if (*(_QWORD *)v248 != v126)
          objc_enumerationMutation(v124);
        v128 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v247 + 1) + 8 * i6), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addXmlChecksum:", v128);

      }
      v125 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v124, "countByEnumeratingWithState:objects:count:", &v247, v318, 16);
    }
    while (v125);
  }

  v129 = -[NSString copyWithZone:](self->_abExperimentURLLegacy, "copyWithZone:", a3);
  v130 = *(void **)(v5 + 96);
  *(_QWORD *)(v5 + 96) = v129;

  v131 = -[NSString copyWithZone:](self->_businessPortalBaseURLLegacy, "copyWithZone:", a3);
  v132 = *(void **)(v5 + 192);
  *(_QWORD *)(v5 + 192) = v131;

  v133 = -[NSString copyWithZone:](self->_logMessageUsageURLLegacy, "copyWithZone:", a3);
  v134 = *(void **)(v5 + 304);
  *(_QWORD *)(v5 + 304) = v133;

  v245 = 0u;
  v246 = 0u;
  v243 = 0u;
  v244 = 0u;
  v135 = self->_locationShiftEnabledRegions;
  v136 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v135, "countByEnumeratingWithState:objects:count:", &v243, v317, 16);
  if (v136)
  {
    v137 = *(_QWORD *)v244;
    do
    {
      for (i7 = 0; i7 != v136; ++i7)
      {
        if (*(_QWORD *)v244 != v137)
          objc_enumerationMutation(v135);
        v139 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v243 + 1) + 8 * i7), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addLocationShiftEnabledRegion:", v139);

      }
      v136 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v135, "countByEnumeratingWithState:objects:count:", &v243, v317, 16);
    }
    while (v136);
  }

  if ((*(_QWORD *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 624) = self->_locationShiftVersion;
    *(_QWORD *)(v5 + 632) |= 1uLL;
  }
  hybridUnavailableRegionsCount = self->_hybridUnavailableRegionsCount;
  if (hybridUnavailableRegionsCount)
  {
    -[GEOActiveTileGroup _reserveHybridUnavailableRegions:](v5, hybridUnavailableRegionsCount);
    memcpy(*(void **)(v5 + 72), self->_hybridUnavailableRegions, 24 * self->_hybridUnavailableRegionsCount);
    *(_QWORD *)(v5 + 80) = self->_hybridUnavailableRegionsCount;
  }
  v141 = -[NSData copyWithZone:](self->_reserved, "copyWithZone:", a3);
  v142 = *(void **)(v5 + 448);
  *(_QWORD *)(v5 + 448) = v141;

  v143 = -[NSString copyWithZone:](self->_spatialLookupURLLegacy, "copyWithZone:", a3);
  v144 = *(void **)(v5 + 504);
  *(_QWORD *)(v5 + 504) = v143;

  v241 = 0u;
  v242 = 0u;
  v239 = 0u;
  v240 = 0u;
  v145 = self->_activeResources;
  v146 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v145, "countByEnumeratingWithState:objects:count:", &v239, v316, 16);
  if (v146)
  {
    v147 = *(_QWORD *)v240;
    do
    {
      for (i8 = 0; i8 != v146; ++i8)
      {
        if (*(_QWORD *)v240 != v147)
          objc_enumerationMutation(v145);
        v149 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v239 + 1) + 8 * i8), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addActiveResource:", v149);

      }
      v146 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v145, "countByEnumeratingWithState:objects:count:", &v239, v316, 16);
    }
    while (v146);
  }

  v237 = 0u;
  v238 = 0u;
  v235 = 0u;
  v236 = 0u;
  v150 = self->_regionalResources;
  v151 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v150, "countByEnumeratingWithState:objects:count:", &v235, v315, 16);
  if (v151)
  {
    v152 = *(_QWORD *)v236;
    do
    {
      for (i9 = 0; i9 != v151; ++i9)
      {
        if (*(_QWORD *)v236 != v152)
          objc_enumerationMutation(v150);
        v154 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v235 + 1) + 8 * i9), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addRegionalResource:", v154);

      }
      v151 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v150, "countByEnumeratingWithState:objects:count:", &v235, v315, 16);
    }
    while (v151);
  }

  if ((*(_QWORD *)&self->_flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 628) = self->_modelVersion;
    *(_QWORD *)(v5 + 632) |= 2uLL;
  }
  PBRepeatedInt32Copy();
  PBRepeatedInt32Copy();
  v233 = 0u;
  v234 = 0u;
  v231 = 0u;
  v232 = 0u;
  v155 = self->_staleResources;
  v156 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v155, "countByEnumeratingWithState:objects:count:", &v231, v314, 16);
  if (v156)
  {
    v157 = *(_QWORD *)v232;
    do
    {
      for (i10 = 0; i10 != v156; ++i10)
      {
        if (*(_QWORD *)v232 != v157)
          objc_enumerationMutation(v155);
        v159 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v231 + 1) + 8 * i10), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addStaleResource:", v159);

      }
      v156 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v155, "countByEnumeratingWithState:objects:count:", &v231, v314, 16);
    }
    while (v156);
  }

  v160 = -[GEODataSetDescription copyWithZone:](self->_dataSet, "copyWithZone:", a3);
  v161 = *(void **)(v5 + 200);
  *(_QWORD *)(v5 + 200) = v160;

  v162 = -[NSString copyWithZone:](self->_realtimeTrafficProbeURLLegacy, "copyWithZone:", a3);
  v163 = *(void **)(v5 + 392);
  *(_QWORD *)(v5 + 392) = v162;

  v164 = -[NSString copyWithZone:](self->_batchTrafficProbeURLLegacy, "copyWithZone:", a3);
  v165 = *(void **)(v5 + 176);
  *(_QWORD *)(v5 + 176) = v164;

  v166 = -[NSString copyWithZone:](self->_logMessageUsageV3URLLegacy, "copyWithZone:", a3);
  v167 = *(void **)(v5 + 312);
  *(_QWORD *)(v5 + 312) = v166;

  v168 = -[NSString copyWithZone:](self->_proactiveRoutingURLLegacy, "copyWithZone:", a3);
  v169 = *(void **)(v5 + 352);
  *(_QWORD *)(v5 + 352) = v168;

  v170 = -[NSString copyWithZone:](self->_backgroundDispatcherURLLegacy, "copyWithZone:", a3);
  v171 = *(void **)(v5 + 152);
  *(_QWORD *)(v5 + 152) = v170;

  v172 = -[NSString copyWithZone:](self->_bluePOIURLLegacy, "copyWithZone:", a3);
  v173 = *(void **)(v5 + 184);
  *(_QWORD *)(v5 + 184) = v172;

  v174 = -[NSString copyWithZone:](self->_backgroundRevGeoURLLegacy, "copyWithZone:", a3);
  v175 = *(void **)(v5 + 160);
  *(_QWORD *)(v5 + 160) = v174;

  v176 = -[NSString copyWithZone:](self->_wifiConnectionQualityProbeURLLegacy, "copyWithZone:", a3);
  v177 = *(void **)(v5 + 584);
  *(_QWORD *)(v5 + 584) = v176;

  v178 = -[NSString copyWithZone:](self->_muninBaseURL, "copyWithZone:", a3);
  v179 = *(void **)(v5 + 320);
  *(_QWORD *)(v5 + 320) = v178;

  v180 = -[NSData copyWithZone:](self->_flyoverRegionVersions, "copyWithZone:", a3);
  v181 = *(void **)(v5 + 256);
  *(_QWORD *)(v5 + 256) = v180;

  v182 = -[GEOURLInfoSet copyWithZone:](self->_urlInfoSet, "copyWithZone:", a3);
  v183 = *(void **)(v5 + 568);
  *(_QWORD *)(v5 + 568) = v182;

  v229 = 0u;
  v230 = 0u;
  v227 = 0u;
  v228 = 0u;
  v184 = self->_muninBuckets;
  v185 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v184, "countByEnumeratingWithState:objects:count:", &v227, v313, 16);
  if (v185)
  {
    v186 = *(_QWORD *)v228;
    do
    {
      for (i11 = 0; i11 != v185; ++i11)
      {
        if (*(_QWORD *)v228 != v186)
          objc_enumerationMutation(v184);
        v188 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v227 + 1) + 8 * i11), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addMuninBucket:", v188);

      }
      v185 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v184, "countByEnumeratingWithState:objects:count:", &v227, v313, 16);
    }
    while (v185);
  }

  v189 = -[NSString copyWithZone:](self->_environment, "copyWithZone:", a3);
  v190 = *(void **)(v5 + 232);
  *(_QWORD *)(v5 + 232) = v189;

  v225 = 0u;
  v226 = 0u;
  v223 = 0u;
  v224 = 0u;
  v191 = self->_displayStrings;
  v192 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v191, "countByEnumeratingWithState:objects:count:", &v223, v312, 16);
  if (v192)
  {
    v193 = *(_QWORD *)v224;
    do
    {
      for (i12 = 0; i12 != v192; ++i12)
      {
        if (*(_QWORD *)v224 != v193)
          objc_enumerationMutation(v191);
        v195 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v223 + 1) + 8 * i12), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addDisplayStrings:", v195);

      }
      v192 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v191, "countByEnumeratingWithState:objects:count:", &v223, v312, 16);
    }
    while (v192);
  }

  v221 = 0u;
  v222 = 0u;
  v219 = 0u;
  v220 = 0u;
  v196 = self->_explicitResources;
  v197 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v196, "countByEnumeratingWithState:objects:count:", &v219, v311, 16);
  if (v197)
  {
    v198 = *(_QWORD *)v220;
    do
    {
      for (i13 = 0; i13 != v197; ++i13)
      {
        if (*(_QWORD *)v220 != v198)
          objc_enumerationMutation(v196);
        v200 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v219 + 1) + 8 * i13), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addExplicitResource:", v200);

      }
      v197 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v196, "countByEnumeratingWithState:objects:count:", &v219, v311, 16);
    }
    while (v197);
  }

  v201 = -[GEOOfflineMetadata copyWithZone:](self->_offlineMetadata, "copyWithZone:", a3);
  v202 = *(void **)(v5 + 336);
  *(_QWORD *)(v5 + 336) = v201;

  v203 = -[NSMutableDictionary count](self->_resourceCanonicalNameToFileName, "count");
  v204 = MEMORY[0x1E0C809B0];
  if (v203)
  {
    objc_msgSend((id)v5, "clearResourceCanonicalNameToFileName");
    v205 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v206 = *(void **)(v5 + 456);
    *(_QWORD *)(v5 + 456) = v205;

    resourceCanonicalNameToFileName = self->_resourceCanonicalNameToFileName;
    v216[0] = v204;
    v216[1] = 3221225472;
    v216[2] = __35__GEOActiveTileGroup_copyWithZone___block_invoke;
    v216[3] = &unk_1E1C07DB8;
    v218 = a3;
    v217 = (id)v5;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](resourceCanonicalNameToFileName, "enumerateKeysAndObjectsUsingBlock:", v216);

  }
  if (-[NSMutableDictionary count](self->_regionalResourceCanonicalNameToFileName, "count"))
  {
    objc_msgSend((id)v5, "clearRegionalResourceCanonicalNameToFileName");
    v208 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v209 = *(void **)(v5 + 400);
    *(_QWORD *)(v5 + 400) = v208;

    regionalResourceCanonicalNameToFileName = self->_regionalResourceCanonicalNameToFileName;
    v213[0] = v204;
    v213[1] = 3221225472;
    v213[2] = __35__GEOActiveTileGroup_copyWithZone___block_invoke_2;
    v213[3] = &unk_1E1C07DB8;
    v215 = a3;
    v214 = (id)v5;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](regionalResourceCanonicalNameToFileName, "enumerateKeysAndObjectsUsingBlock:", v213);

  }
  objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
  v211 = (id)v5;
LABEL_177:

  return (id)v5;
}

void __35__GEOActiveTileGroup_copyWithZone___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  id v6;
  id v7;

  v5 = *(_QWORD *)(a1 + 40);
  v6 = a2;
  v7 = (id)objc_msgSend(a3, "copyWithZone:", v5);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 456), "setObject:forKey:", v7, v6);

}

void __35__GEOActiveTileGroup_copyWithZone___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  id v6;
  id v7;

  v5 = *(_QWORD *)(a1 + 40);
  v6 = a2;
  v7 = (id)objc_msgSend(a3, "copyWithZone:", v5);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 400), "setObject:forKey:", v7, v6);

}

- (BOOL)isEqual:(id)a3
{
  const void **v4;
  NSMutableArray *tileSets;
  NSMutableArray *resources;
  NSString *uniqueIdentifier;
  NSMutableArray *attributions;
  NSMutableArray *regionalResourceTiles;
  NSMutableArray *regionalResourceRegions;
  NSString *regionalResourcesURLLegacy;
  NSString *searchAttributionManifestURLLegacy;
  NSString *directionsURLLegacy;
  NSString *etaURLLegacy;
  NSString *batchReverseGeocoderURLLegacy;
  NSString *releaseInfo;
  NSString *resourcesURLLegacy;
  NSString *simpleETAURLLegacy;
  NSString *addressCorrectionInitURLLegacy;
  NSString *addressCorrectionUpdateURLLegacy;
  NSString *polyLocationShiftURLLegacy;
  NSString *problemSubmissionURLLegacy;
  NSString *problemStatusURLLegacy;
  NSString *reverseGeocoderVersionsURLLegacy;
  NSString *problemCategoriesURLLegacy;
  NSString *announcementsURLLegacy;
  NSMutableArray *announcementsSupportedLanguages;
  NSString *dispatcherURLLegacy;
  NSString *problemOptInURLLegacy;
  GEOVersionManifest *versionManifest;
  NSMutableArray *styleSheets;
  NSMutableArray *styleSheetChecksums;
  NSMutableArray *textures;
  NSMutableArray *textureChecksums;
  NSMutableArray *fonts;
  NSMutableArray *fontChecksums;
  NSMutableArray *icons;
  NSMutableArray *iconChecksums;
  NSMutableArray *xmls;
  NSMutableArray *xmlChecksums;
  NSString *abExperimentURLLegacy;
  NSString *businessPortalBaseURLLegacy;
  NSString *logMessageUsageURLLegacy;
  NSMutableArray *locationShiftEnabledRegions;
  const void *v45;
  unint64_t hybridUnavailableRegionsCount;
  char v47;
  NSData *reserved;
  NSString *spatialLookupURLLegacy;
  NSMutableArray *activeResources;
  NSMutableArray *regionalResources;
  const void *v53;
  NSMutableArray *staleResources;
  GEODataSetDescription *dataSet;
  NSString *realtimeTrafficProbeURLLegacy;
  NSString *batchTrafficProbeURLLegacy;
  NSString *logMessageUsageV3URLLegacy;
  NSString *proactiveRoutingURLLegacy;
  NSString *backgroundDispatcherURLLegacy;
  NSString *bluePOIURLLegacy;
  NSString *backgroundRevGeoURLLegacy;
  NSString *wifiConnectionQualityProbeURLLegacy;
  NSString *muninBaseURL;
  NSData *flyoverRegionVersions;
  GEOURLInfoSet *urlInfoSet;
  NSMutableArray *muninBuckets;
  NSString *environment;
  NSMutableArray *displayStrings;
  NSMutableArray *explicitResources;
  GEOOfflineMetadata *offlineMetadata;
  NSMutableDictionary *resourceCanonicalNameToFileName;
  NSMutableDictionary *regionalResourceCanonicalNameToFileName;

  v4 = (const void **)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_90;
  -[GEOActiveTileGroup readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if (self->_identifier != *((_DWORD *)v4 + 155))
    goto LABEL_90;
  tileSets = self->_tileSets;
  if ((unint64_t)tileSets | (unint64_t)v4[69])
  {
    if (!-[NSMutableArray isEqual:](tileSets, "isEqual:"))
      goto LABEL_90;
  }
  resources = self->_resources;
  if ((unint64_t)resources | (unint64_t)v4[59])
  {
    if (!-[NSMutableArray isEqual:](resources, "isEqual:"))
      goto LABEL_90;
  }
  uniqueIdentifier = self->_uniqueIdentifier;
  if ((unint64_t)uniqueIdentifier | (unint64_t)v4[70])
  {
    if (!-[NSString isEqual:](uniqueIdentifier, "isEqual:"))
      goto LABEL_90;
  }
  attributions = self->_attributions;
  if ((unint64_t)attributions | (unint64_t)v4[18])
  {
    if (!-[NSMutableArray isEqual:](attributions, "isEqual:"))
      goto LABEL_90;
  }
  regionalResourceTiles = self->_regionalResourceTiles;
  if ((unint64_t)regionalResourceTiles | (unint64_t)v4[52])
  {
    if (!-[NSMutableArray isEqual:](regionalResourceTiles, "isEqual:"))
      goto LABEL_90;
  }
  regionalResourceRegions = self->_regionalResourceRegions;
  if ((unint64_t)regionalResourceRegions | (unint64_t)v4[51])
  {
    if (!-[NSMutableArray isEqual:](regionalResourceRegions, "isEqual:"))
      goto LABEL_90;
  }
  regionalResourcesURLLegacy = self->_regionalResourcesURLLegacy;
  if ((unint64_t)regionalResourcesURLLegacy | (unint64_t)v4[53])
  {
    if (!-[NSString isEqual:](regionalResourcesURLLegacy, "isEqual:"))
      goto LABEL_90;
  }
  searchAttributionManifestURLLegacy = self->_searchAttributionManifestURLLegacy;
  if ((unint64_t)searchAttributionManifestURLLegacy | (unint64_t)v4[61])
  {
    if (!-[NSString isEqual:](searchAttributionManifestURLLegacy, "isEqual:"))
      goto LABEL_90;
  }
  directionsURLLegacy = self->_directionsURLLegacy;
  if ((unint64_t)directionsURLLegacy | (unint64_t)v4[26])
  {
    if (!-[NSString isEqual:](directionsURLLegacy, "isEqual:"))
      goto LABEL_90;
  }
  etaURLLegacy = self->_etaURLLegacy;
  if ((unint64_t)etaURLLegacy | (unint64_t)v4[30])
  {
    if (!-[NSString isEqual:](etaURLLegacy, "isEqual:"))
      goto LABEL_90;
  }
  batchReverseGeocoderURLLegacy = self->_batchReverseGeocoderURLLegacy;
  if ((unint64_t)batchReverseGeocoderURLLegacy | (unint64_t)v4[21])
  {
    if (!-[NSString isEqual:](batchReverseGeocoderURLLegacy, "isEqual:"))
      goto LABEL_90;
  }
  releaseInfo = self->_releaseInfo;
  if ((unint64_t)releaseInfo | (unint64_t)v4[55])
  {
    if (!-[NSString isEqual:](releaseInfo, "isEqual:"))
      goto LABEL_90;
  }
  resourcesURLLegacy = self->_resourcesURLLegacy;
  if ((unint64_t)resourcesURLLegacy | (unint64_t)v4[58])
  {
    if (!-[NSString isEqual:](resourcesURLLegacy, "isEqual:"))
      goto LABEL_90;
  }
  simpleETAURLLegacy = self->_simpleETAURLLegacy;
  if ((unint64_t)simpleETAURLLegacy | (unint64_t)v4[62])
  {
    if (!-[NSString isEqual:](simpleETAURLLegacy, "isEqual:"))
      goto LABEL_90;
  }
  addressCorrectionInitURLLegacy = self->_addressCorrectionInitURLLegacy;
  if ((unint64_t)addressCorrectionInitURLLegacy | (unint64_t)v4[14])
  {
    if (!-[NSString isEqual:](addressCorrectionInitURLLegacy, "isEqual:"))
      goto LABEL_90;
  }
  addressCorrectionUpdateURLLegacy = self->_addressCorrectionUpdateURLLegacy;
  if ((unint64_t)addressCorrectionUpdateURLLegacy | (unint64_t)v4[15])
  {
    if (!-[NSString isEqual:](addressCorrectionUpdateURLLegacy, "isEqual:"))
      goto LABEL_90;
  }
  polyLocationShiftURLLegacy = self->_polyLocationShiftURLLegacy;
  if ((unint64_t)polyLocationShiftURLLegacy | (unint64_t)v4[43])
  {
    if (!-[NSString isEqual:](polyLocationShiftURLLegacy, "isEqual:"))
      goto LABEL_90;
  }
  problemSubmissionURLLegacy = self->_problemSubmissionURLLegacy;
  if ((unint64_t)problemSubmissionURLLegacy | (unint64_t)v4[48])
  {
    if (!-[NSString isEqual:](problemSubmissionURLLegacy, "isEqual:"))
      goto LABEL_90;
  }
  problemStatusURLLegacy = self->_problemStatusURLLegacy;
  if ((unint64_t)problemStatusURLLegacy | (unint64_t)v4[47])
  {
    if (!-[NSString isEqual:](problemStatusURLLegacy, "isEqual:"))
      goto LABEL_90;
  }
  reverseGeocoderVersionsURLLegacy = self->_reverseGeocoderVersionsURLLegacy;
  if ((unint64_t)reverseGeocoderVersionsURLLegacy | (unint64_t)v4[60])
  {
    if (!-[NSString isEqual:](reverseGeocoderVersionsURLLegacy, "isEqual:"))
      goto LABEL_90;
  }
  problemCategoriesURLLegacy = self->_problemCategoriesURLLegacy;
  if ((unint64_t)problemCategoriesURLLegacy | (unint64_t)v4[45])
  {
    if (!-[NSString isEqual:](problemCategoriesURLLegacy, "isEqual:"))
      goto LABEL_90;
  }
  announcementsURLLegacy = self->_announcementsURLLegacy;
  if ((unint64_t)announcementsURLLegacy | (unint64_t)v4[17])
  {
    if (!-[NSString isEqual:](announcementsURLLegacy, "isEqual:"))
      goto LABEL_90;
  }
  announcementsSupportedLanguages = self->_announcementsSupportedLanguages;
  if ((unint64_t)announcementsSupportedLanguages | (unint64_t)v4[16])
  {
    if (!-[NSMutableArray isEqual:](announcementsSupportedLanguages, "isEqual:"))
      goto LABEL_90;
  }
  dispatcherURLLegacy = self->_dispatcherURLLegacy;
  if ((unint64_t)dispatcherURLLegacy | (unint64_t)v4[27])
  {
    if (!-[NSString isEqual:](dispatcherURLLegacy, "isEqual:"))
      goto LABEL_90;
  }
  problemOptInURLLegacy = self->_problemOptInURLLegacy;
  if ((unint64_t)problemOptInURLLegacy | (unint64_t)v4[46])
  {
    if (!-[NSString isEqual:](problemOptInURLLegacy, "isEqual:"))
      goto LABEL_90;
  }
  versionManifest = self->_versionManifest;
  if ((unint64_t)versionManifest | (unint64_t)v4[72])
  {
    if (!-[GEOVersionManifest isEqual:](versionManifest, "isEqual:"))
      goto LABEL_90;
  }
  styleSheets = self->_styleSheets;
  if ((unint64_t)styleSheets | (unint64_t)v4[66])
  {
    if (!-[NSMutableArray isEqual:](styleSheets, "isEqual:"))
      goto LABEL_90;
  }
  styleSheetChecksums = self->_styleSheetChecksums;
  if ((unint64_t)styleSheetChecksums | (unint64_t)v4[65])
  {
    if (!-[NSMutableArray isEqual:](styleSheetChecksums, "isEqual:"))
      goto LABEL_90;
  }
  textures = self->_textures;
  if ((unint64_t)textures | (unint64_t)v4[68])
  {
    if (!-[NSMutableArray isEqual:](textures, "isEqual:"))
      goto LABEL_90;
  }
  textureChecksums = self->_textureChecksums;
  if ((unint64_t)textureChecksums | (unint64_t)v4[67])
  {
    if (!-[NSMutableArray isEqual:](textureChecksums, "isEqual:"))
      goto LABEL_90;
  }
  fonts = self->_fonts;
  if ((unint64_t)fonts | (unint64_t)v4[34])
  {
    if (!-[NSMutableArray isEqual:](fonts, "isEqual:"))
      goto LABEL_90;
  }
  fontChecksums = self->_fontChecksums;
  if ((unint64_t)fontChecksums | (unint64_t)v4[33])
  {
    if (!-[NSMutableArray isEqual:](fontChecksums, "isEqual:"))
      goto LABEL_90;
  }
  icons = self->_icons;
  if ((unint64_t)icons | (unint64_t)v4[36])
  {
    if (!-[NSMutableArray isEqual:](icons, "isEqual:"))
      goto LABEL_90;
  }
  iconChecksums = self->_iconChecksums;
  if ((unint64_t)iconChecksums | (unint64_t)v4[35])
  {
    if (!-[NSMutableArray isEqual:](iconChecksums, "isEqual:"))
      goto LABEL_90;
  }
  xmls = self->_xmls;
  if ((unint64_t)xmls | (unint64_t)v4[75])
  {
    if (!-[NSMutableArray isEqual:](xmls, "isEqual:"))
      goto LABEL_90;
  }
  xmlChecksums = self->_xmlChecksums;
  if ((unint64_t)xmlChecksums | (unint64_t)v4[74])
  {
    if (!-[NSMutableArray isEqual:](xmlChecksums, "isEqual:"))
      goto LABEL_90;
  }
  abExperimentURLLegacy = self->_abExperimentURLLegacy;
  if ((unint64_t)abExperimentURLLegacy | (unint64_t)v4[12])
  {
    if (!-[NSString isEqual:](abExperimentURLLegacy, "isEqual:"))
      goto LABEL_90;
  }
  businessPortalBaseURLLegacy = self->_businessPortalBaseURLLegacy;
  if ((unint64_t)businessPortalBaseURLLegacy | (unint64_t)v4[24])
  {
    if (!-[NSString isEqual:](businessPortalBaseURLLegacy, "isEqual:"))
      goto LABEL_90;
  }
  logMessageUsageURLLegacy = self->_logMessageUsageURLLegacy;
  if ((unint64_t)logMessageUsageURLLegacy | (unint64_t)v4[38])
  {
    if (!-[NSString isEqual:](logMessageUsageURLLegacy, "isEqual:"))
      goto LABEL_90;
  }
  locationShiftEnabledRegions = self->_locationShiftEnabledRegions;
  if ((unint64_t)locationShiftEnabledRegions | (unint64_t)v4[37])
  {
    if (!-[NSMutableArray isEqual:](locationShiftEnabledRegions, "isEqual:"))
      goto LABEL_90;
  }
  v45 = v4[79];
  if ((*(_QWORD *)&self->_flags & 1) != 0)
  {
    if ((v45 & 1) == 0 || self->_locationShiftVersion != *((_DWORD *)v4 + 156))
      goto LABEL_90;
  }
  else if ((v45 & 1) != 0)
  {
    goto LABEL_90;
  }
  hybridUnavailableRegionsCount = self->_hybridUnavailableRegionsCount;
  if ((const void *)hybridUnavailableRegionsCount != v4[10])
    goto LABEL_90;
  if (memcmp(self->_hybridUnavailableRegions, v4[9], 24 * hybridUnavailableRegionsCount))
    goto LABEL_90;
  reserved = self->_reserved;
  if ((unint64_t)reserved | (unint64_t)v4[56])
  {
    if (!-[NSData isEqual:](reserved, "isEqual:"))
      goto LABEL_90;
  }
  spatialLookupURLLegacy = self->_spatialLookupURLLegacy;
  if ((unint64_t)spatialLookupURLLegacy | (unint64_t)v4[63])
  {
    if (!-[NSString isEqual:](spatialLookupURLLegacy, "isEqual:"))
      goto LABEL_90;
  }
  activeResources = self->_activeResources;
  if ((unint64_t)activeResources | (unint64_t)v4[13])
  {
    if (!-[NSMutableArray isEqual:](activeResources, "isEqual:"))
      goto LABEL_90;
  }
  regionalResources = self->_regionalResources;
  if ((unint64_t)regionalResources | (unint64_t)v4[54])
  {
    if (!-[NSMutableArray isEqual:](regionalResources, "isEqual:"))
      goto LABEL_90;
  }
  v53 = v4[79];
  if ((*(_QWORD *)&self->_flags & 2) != 0)
  {
    if ((v53 & 2) == 0 || self->_modelVersion != *((_DWORD *)v4 + 157))
      goto LABEL_90;
  }
  else if ((v53 & 2) != 0)
  {
LABEL_90:
    v47 = 0;
    goto LABEL_91;
  }
  if (!PBRepeatedInt32IsEqual())
    goto LABEL_90;
  if (!PBRepeatedInt32IsEqual())
    goto LABEL_90;
  staleResources = self->_staleResources;
  if ((unint64_t)staleResources | (unint64_t)v4[64])
  {
    if (!-[NSMutableArray isEqual:](staleResources, "isEqual:"))
      goto LABEL_90;
  }
  dataSet = self->_dataSet;
  if ((unint64_t)dataSet | (unint64_t)v4[25])
  {
    if (!-[GEODataSetDescription isEqual:](dataSet, "isEqual:"))
      goto LABEL_90;
  }
  realtimeTrafficProbeURLLegacy = self->_realtimeTrafficProbeURLLegacy;
  if ((unint64_t)realtimeTrafficProbeURLLegacy | (unint64_t)v4[49])
  {
    if (!-[NSString isEqual:](realtimeTrafficProbeURLLegacy, "isEqual:"))
      goto LABEL_90;
  }
  batchTrafficProbeURLLegacy = self->_batchTrafficProbeURLLegacy;
  if ((unint64_t)batchTrafficProbeURLLegacy | (unint64_t)v4[22])
  {
    if (!-[NSString isEqual:](batchTrafficProbeURLLegacy, "isEqual:"))
      goto LABEL_90;
  }
  logMessageUsageV3URLLegacy = self->_logMessageUsageV3URLLegacy;
  if ((unint64_t)logMessageUsageV3URLLegacy | (unint64_t)v4[39])
  {
    if (!-[NSString isEqual:](logMessageUsageV3URLLegacy, "isEqual:"))
      goto LABEL_90;
  }
  proactiveRoutingURLLegacy = self->_proactiveRoutingURLLegacy;
  if ((unint64_t)proactiveRoutingURLLegacy | (unint64_t)v4[44])
  {
    if (!-[NSString isEqual:](proactiveRoutingURLLegacy, "isEqual:"))
      goto LABEL_90;
  }
  backgroundDispatcherURLLegacy = self->_backgroundDispatcherURLLegacy;
  if ((unint64_t)backgroundDispatcherURLLegacy | (unint64_t)v4[19])
  {
    if (!-[NSString isEqual:](backgroundDispatcherURLLegacy, "isEqual:"))
      goto LABEL_90;
  }
  bluePOIURLLegacy = self->_bluePOIURLLegacy;
  if ((unint64_t)bluePOIURLLegacy | (unint64_t)v4[23])
  {
    if (!-[NSString isEqual:](bluePOIURLLegacy, "isEqual:"))
      goto LABEL_90;
  }
  backgroundRevGeoURLLegacy = self->_backgroundRevGeoURLLegacy;
  if ((unint64_t)backgroundRevGeoURLLegacy | (unint64_t)v4[20])
  {
    if (!-[NSString isEqual:](backgroundRevGeoURLLegacy, "isEqual:"))
      goto LABEL_90;
  }
  wifiConnectionQualityProbeURLLegacy = self->_wifiConnectionQualityProbeURLLegacy;
  if ((unint64_t)wifiConnectionQualityProbeURLLegacy | (unint64_t)v4[73])
  {
    if (!-[NSString isEqual:](wifiConnectionQualityProbeURLLegacy, "isEqual:"))
      goto LABEL_90;
  }
  muninBaseURL = self->_muninBaseURL;
  if ((unint64_t)muninBaseURL | (unint64_t)v4[40])
  {
    if (!-[NSString isEqual:](muninBaseURL, "isEqual:"))
      goto LABEL_90;
  }
  flyoverRegionVersions = self->_flyoverRegionVersions;
  if ((unint64_t)flyoverRegionVersions | (unint64_t)v4[32])
  {
    if (!-[NSData isEqual:](flyoverRegionVersions, "isEqual:"))
      goto LABEL_90;
  }
  urlInfoSet = self->_urlInfoSet;
  if ((unint64_t)urlInfoSet | (unint64_t)v4[71])
  {
    if (!-[GEOURLInfoSet isEqual:](urlInfoSet, "isEqual:"))
      goto LABEL_90;
  }
  muninBuckets = self->_muninBuckets;
  if ((unint64_t)muninBuckets | (unint64_t)v4[41])
  {
    if (!-[NSMutableArray isEqual:](muninBuckets, "isEqual:"))
      goto LABEL_90;
  }
  environment = self->_environment;
  if ((unint64_t)environment | (unint64_t)v4[29])
  {
    if (!-[NSString isEqual:](environment, "isEqual:"))
      goto LABEL_90;
  }
  displayStrings = self->_displayStrings;
  if ((unint64_t)displayStrings | (unint64_t)v4[28])
  {
    if (!-[NSMutableArray isEqual:](displayStrings, "isEqual:"))
      goto LABEL_90;
  }
  explicitResources = self->_explicitResources;
  if ((unint64_t)explicitResources | (unint64_t)v4[31])
  {
    if (!-[NSMutableArray isEqual:](explicitResources, "isEqual:"))
      goto LABEL_90;
  }
  offlineMetadata = self->_offlineMetadata;
  if ((unint64_t)offlineMetadata | (unint64_t)v4[42])
  {
    if (!-[GEOOfflineMetadata isEqual:](offlineMetadata, "isEqual:"))
      goto LABEL_90;
  }
  resourceCanonicalNameToFileName = self->_resourceCanonicalNameToFileName;
  if ((unint64_t)resourceCanonicalNameToFileName | (unint64_t)v4[57])
  {
    if (!-[NSMutableDictionary isEqual:](resourceCanonicalNameToFileName, "isEqual:"))
      goto LABEL_90;
  }
  regionalResourceCanonicalNameToFileName = self->_regionalResourceCanonicalNameToFileName;
  if ((unint64_t)regionalResourceCanonicalNameToFileName | (unint64_t)v4[50])
    v47 = -[NSMutableDictionary isEqual:](regionalResourceCanonicalNameToFileName, "isEqual:");
  else
    v47 = 1;
LABEL_91:

  return v47;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSUInteger v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  NSUInteger v17;
  NSUInteger v18;
  NSUInteger v19;
  NSUInteger v20;
  NSUInteger v21;
  NSUInteger v22;
  NSUInteger v23;
  NSUInteger v24;
  NSUInteger v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  NSUInteger v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  NSUInteger v35;
  NSUInteger v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  NSUInteger v48;
  NSUInteger v49;
  uint64_t v50;
  NSUInteger v51;
  NSUInteger v52;
  NSUInteger v53;
  NSUInteger v54;
  NSUInteger v55;
  NSUInteger v56;
  NSUInteger v57;
  NSUInteger v58;
  NSUInteger v59;
  NSUInteger v60;
  NSUInteger v61;
  NSUInteger v62;
  NSUInteger v63;
  NSUInteger v64;
  NSUInteger v65;
  NSUInteger v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  NSUInteger v70;
  uint64_t v71;
  uint64_t v72;
  unsigned int identifier;

  -[GEOActiveTileGroup readAll:](self, "readAll:", 1);
  identifier = self->_identifier;
  v72 = -[NSMutableArray hash](self->_tileSets, "hash");
  v71 = -[NSMutableArray hash](self->_resources, "hash");
  v70 = -[NSString hash](self->_uniqueIdentifier, "hash");
  v69 = -[NSMutableArray hash](self->_attributions, "hash");
  v68 = -[NSMutableArray hash](self->_regionalResourceTiles, "hash");
  v67 = -[NSMutableArray hash](self->_regionalResourceRegions, "hash");
  v66 = -[NSString hash](self->_regionalResourcesURLLegacy, "hash");
  v65 = -[NSString hash](self->_searchAttributionManifestURLLegacy, "hash");
  v64 = -[NSString hash](self->_directionsURLLegacy, "hash");
  v63 = -[NSString hash](self->_etaURLLegacy, "hash");
  v62 = -[NSString hash](self->_batchReverseGeocoderURLLegacy, "hash");
  v61 = -[NSString hash](self->_releaseInfo, "hash");
  v60 = -[NSString hash](self->_resourcesURLLegacy, "hash");
  v59 = -[NSString hash](self->_simpleETAURLLegacy, "hash");
  v58 = -[NSString hash](self->_addressCorrectionInitURLLegacy, "hash");
  v57 = -[NSString hash](self->_addressCorrectionUpdateURLLegacy, "hash");
  v56 = -[NSString hash](self->_polyLocationShiftURLLegacy, "hash");
  v55 = -[NSString hash](self->_problemSubmissionURLLegacy, "hash");
  v54 = -[NSString hash](self->_problemStatusURLLegacy, "hash");
  v53 = -[NSString hash](self->_reverseGeocoderVersionsURLLegacy, "hash");
  v52 = -[NSString hash](self->_problemCategoriesURLLegacy, "hash");
  v51 = -[NSString hash](self->_announcementsURLLegacy, "hash");
  v50 = -[NSMutableArray hash](self->_announcementsSupportedLanguages, "hash");
  v49 = -[NSString hash](self->_dispatcherURLLegacy, "hash");
  v48 = -[NSString hash](self->_problemOptInURLLegacy, "hash");
  v47 = -[GEOVersionManifest hash](self->_versionManifest, "hash");
  v46 = -[NSMutableArray hash](self->_styleSheets, "hash");
  v45 = -[NSMutableArray hash](self->_styleSheetChecksums, "hash");
  v44 = -[NSMutableArray hash](self->_textures, "hash");
  v43 = -[NSMutableArray hash](self->_textureChecksums, "hash");
  v42 = -[NSMutableArray hash](self->_fonts, "hash");
  v41 = -[NSMutableArray hash](self->_fontChecksums, "hash");
  v40 = -[NSMutableArray hash](self->_icons, "hash");
  v39 = -[NSMutableArray hash](self->_iconChecksums, "hash");
  v38 = -[NSMutableArray hash](self->_xmls, "hash");
  v37 = -[NSMutableArray hash](self->_xmlChecksums, "hash");
  v36 = -[NSString hash](self->_abExperimentURLLegacy, "hash");
  v35 = -[NSString hash](self->_businessPortalBaseURLLegacy, "hash");
  v3 = -[NSString hash](self->_logMessageUsageURLLegacy, "hash");
  v4 = -[NSMutableArray hash](self->_locationShiftEnabledRegions, "hash");
  if ((*(_QWORD *)&self->_flags & 1) != 0)
    v5 = 2654435761 * self->_locationShiftVersion;
  else
    v5 = 0;
  v6 = PBHashBytes();
  v7 = -[NSData hash](self->_reserved, "hash");
  v8 = -[NSString hash](self->_spatialLookupURLLegacy, "hash");
  v9 = -[NSMutableArray hash](self->_activeResources, "hash");
  v10 = -[NSMutableArray hash](self->_regionalResources, "hash");
  if ((*(_QWORD *)&self->_flags & 2) != 0)
    v11 = 2654435761 * self->_modelVersion;
  else
    v11 = 0;
  v12 = v72 ^ v71 ^ v70 ^ v69 ^ (2654435761 * identifier) ^ v68 ^ v67 ^ v66 ^ v65 ^ v64 ^ v63 ^ v62 ^ v61 ^ v60 ^ v59 ^ v58 ^ v57 ^ v56 ^ v55 ^ v54 ^ v53 ^ v52 ^ v51 ^ v50 ^ v49 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
  v13 = PBRepeatedInt32Hash();
  v14 = v13 ^ PBRepeatedInt32Hash();
  v15 = v14 ^ -[NSMutableArray hash](self->_staleResources, "hash");
  v16 = v15 ^ -[GEODataSetDescription hash](self->_dataSet, "hash");
  v17 = v16 ^ -[NSString hash](self->_realtimeTrafficProbeURLLegacy, "hash");
  v18 = v17 ^ -[NSString hash](self->_batchTrafficProbeURLLegacy, "hash");
  v19 = v18 ^ -[NSString hash](self->_logMessageUsageV3URLLegacy, "hash");
  v20 = v19 ^ -[NSString hash](self->_proactiveRoutingURLLegacy, "hash");
  v21 = v20 ^ -[NSString hash](self->_backgroundDispatcherURLLegacy, "hash");
  v22 = v21 ^ -[NSString hash](self->_bluePOIURLLegacy, "hash");
  v23 = v22 ^ -[NSString hash](self->_backgroundRevGeoURLLegacy, "hash");
  v24 = v12 ^ v23 ^ -[NSString hash](self->_wifiConnectionQualityProbeURLLegacy, "hash");
  v25 = -[NSString hash](self->_muninBaseURL, "hash");
  v26 = v25 ^ -[NSData hash](self->_flyoverRegionVersions, "hash");
  v27 = v26 ^ -[GEOURLInfoSet hash](self->_urlInfoSet, "hash");
  v28 = v27 ^ -[NSMutableArray hash](self->_muninBuckets, "hash");
  v29 = v28 ^ -[NSString hash](self->_environment, "hash");
  v30 = v29 ^ -[NSMutableArray hash](self->_displayStrings, "hash");
  v31 = v30 ^ -[NSMutableArray hash](self->_explicitResources, "hash");
  v32 = v31 ^ -[GEOOfflineMetadata hash](self->_offlineMetadata, "hash");
  v33 = v32 ^ -[NSMutableDictionary hash](self->_resourceCanonicalNameToFileName, "hash");
  return v24 ^ v33 ^ -[NSMutableDictionary hash](self->_regionalResourceCanonicalNameToFileName, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t k;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t m;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t n;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t ii;
  GEOVersionManifest *versionManifest;
  uint64_t v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t jj;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t kk;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t mm;
  id v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t nn;
  id v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t i1;
  id v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t i2;
  id v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t i3;
  id v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t i4;
  id v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t i5;
  id v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t i6;
  id v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t i7;
  uint64_t v92;
  uint64_t v93;
  uint64_t i8;
  id v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t i9;
  id v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t i10;
  uint64_t v105;
  uint64_t v106;
  uint64_t i11;
  uint64_t v108;
  uint64_t v109;
  uint64_t i12;
  id v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t i13;
  GEODataSetDescription *dataSet;
  uint64_t v117;
  GEOURLInfoSet *urlInfoSet;
  uint64_t v119;
  id v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t i14;
  id v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t i15;
  id v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t i16;
  GEOOfflineMetadata *offlineMetadata;
  uint64_t v136;
  NSMutableDictionary *resourceCanonicalNameToFileName;
  NSMutableDictionary *v138;
  NSMutableDictionary *v139;
  NSMutableDictionary *regionalResourceCanonicalNameToFileName;
  NSMutableDictionary *v141;
  NSMutableDictionary *v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  _BYTE v167[24];
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  __int128 v188;
  __int128 v189;
  __int128 v190;
  __int128 v191;
  __int128 v192;
  __int128 v193;
  __int128 v194;
  __int128 v195;
  __int128 v196;
  __int128 v197;
  __int128 v198;
  __int128 v199;
  __int128 v200;
  __int128 v201;
  __int128 v202;
  __int128 v203;
  __int128 v204;
  __int128 v205;
  __int128 v206;
  __int128 v207;
  __int128 v208;
  __int128 v209;
  __int128 v210;
  __int128 v211;
  __int128 v212;
  __int128 v213;
  __int128 v214;
  __int128 v215;
  __int128 v216;
  __int128 v217;
  __int128 v218;
  __int128 v219;
  __int128 v220;
  __int128 v221;
  __int128 v222;
  __int128 v223;
  __int128 v224;
  __int128 v225;
  __int128 v226;
  __int128 v227;
  __int128 v228;
  __int128 v229;
  __int128 v230;
  __int128 v231;
  __int128 v232;
  __int128 v233;
  __int128 v234;
  __int128 v235;
  _BYTE v236[128];
  _BYTE v237[128];
  _BYTE v238[128];
  _BYTE v239[128];
  _BYTE v240[128];
  _BYTE v241[128];
  _BYTE v242[128];
  _BYTE v243[128];
  _BYTE v244[128];
  _BYTE v245[128];
  _BYTE v246[128];
  _BYTE v247[128];
  _BYTE v248[128];
  _BYTE v249[128];
  _BYTE v250[128];
  _BYTE v251[128];
  _BYTE v252[128];
  _BYTE v253[128];
  _BYTE v254[128];
  _BYTE v255[128];
  _BYTE v256[128];
  _BYTE v257[128];
  _BYTE v258[128];
  uint64_t v259;

  v259 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  self->_identifier = *((_DWORD *)v4 + 155);
  v232 = 0u;
  v233 = 0u;
  v234 = 0u;
  v235 = 0u;
  v5 = *((id *)v4 + 69);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v232, v258, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v233;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v233 != v8)
          objc_enumerationMutation(v5);
        -[GEOActiveTileGroup addTileSet:](self, "addTileSet:", *(_QWORD *)(*((_QWORD *)&v232 + 1) + 8 * i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v232, v258, 16);
    }
    while (v7);
  }

  v231 = 0u;
  v230 = 0u;
  v229 = 0u;
  v228 = 0u;
  v10 = *((id *)v4 + 59);
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v228, v257, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v229;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v229 != v13)
          objc_enumerationMutation(v10);
        -[GEOActiveTileGroup addResource:](self, "addResource:", *(_QWORD *)(*((_QWORD *)&v228 + 1) + 8 * j));
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v228, v257, 16);
    }
    while (v12);
  }

  if (*((_QWORD *)v4 + 70))
    -[GEOActiveTileGroup setUniqueIdentifier:](self, "setUniqueIdentifier:");
  v227 = 0u;
  v226 = 0u;
  v225 = 0u;
  v224 = 0u;
  v15 = *((id *)v4 + 18);
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v224, v256, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v225;
    do
    {
      for (k = 0; k != v17; ++k)
      {
        if (*(_QWORD *)v225 != v18)
          objc_enumerationMutation(v15);
        -[GEOActiveTileGroup addAttribution:](self, "addAttribution:", *(_QWORD *)(*((_QWORD *)&v224 + 1) + 8 * k));
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v224, v256, 16);
    }
    while (v17);
  }

  v223 = 0u;
  v222 = 0u;
  v221 = 0u;
  v220 = 0u;
  v20 = *((id *)v4 + 52);
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v220, v255, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v221;
    do
    {
      for (m = 0; m != v22; ++m)
      {
        if (*(_QWORD *)v221 != v23)
          objc_enumerationMutation(v20);
        -[GEOActiveTileGroup addRegionalResourceTile:](self, "addRegionalResourceTile:", *(_QWORD *)(*((_QWORD *)&v220 + 1) + 8 * m));
      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v220, v255, 16);
    }
    while (v22);
  }

  v219 = 0u;
  v218 = 0u;
  v217 = 0u;
  v216 = 0u;
  v25 = *((id *)v4 + 51);
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v216, v254, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v217;
    do
    {
      for (n = 0; n != v27; ++n)
      {
        if (*(_QWORD *)v217 != v28)
          objc_enumerationMutation(v25);
        -[GEOActiveTileGroup addRegionalResourceRegion:](self, "addRegionalResourceRegion:", *(_QWORD *)(*((_QWORD *)&v216 + 1) + 8 * n));
      }
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v216, v254, 16);
    }
    while (v27);
  }

  if (*((_QWORD *)v4 + 53))
    -[GEOActiveTileGroup setRegionalResourcesURLLegacy:](self, "setRegionalResourcesURLLegacy:");
  if (*((_QWORD *)v4 + 61))
    -[GEOActiveTileGroup setSearchAttributionManifestURLLegacy:](self, "setSearchAttributionManifestURLLegacy:");
  if (*((_QWORD *)v4 + 26))
    -[GEOActiveTileGroup setDirectionsURLLegacy:](self, "setDirectionsURLLegacy:");
  if (*((_QWORD *)v4 + 30))
    -[GEOActiveTileGroup setEtaURLLegacy:](self, "setEtaURLLegacy:");
  if (*((_QWORD *)v4 + 21))
    -[GEOActiveTileGroup setBatchReverseGeocoderURLLegacy:](self, "setBatchReverseGeocoderURLLegacy:");
  if (*((_QWORD *)v4 + 55))
    -[GEOActiveTileGroup setReleaseInfo:](self, "setReleaseInfo:");
  if (*((_QWORD *)v4 + 58))
    -[GEOActiveTileGroup setResourcesURLLegacy:](self, "setResourcesURLLegacy:");
  if (*((_QWORD *)v4 + 62))
    -[GEOActiveTileGroup setSimpleETAURLLegacy:](self, "setSimpleETAURLLegacy:");
  if (*((_QWORD *)v4 + 14))
    -[GEOActiveTileGroup setAddressCorrectionInitURLLegacy:](self, "setAddressCorrectionInitURLLegacy:");
  if (*((_QWORD *)v4 + 15))
    -[GEOActiveTileGroup setAddressCorrectionUpdateURLLegacy:](self, "setAddressCorrectionUpdateURLLegacy:");
  if (*((_QWORD *)v4 + 43))
    -[GEOActiveTileGroup setPolyLocationShiftURLLegacy:](self, "setPolyLocationShiftURLLegacy:");
  if (*((_QWORD *)v4 + 48))
    -[GEOActiveTileGroup setProblemSubmissionURLLegacy:](self, "setProblemSubmissionURLLegacy:");
  if (*((_QWORD *)v4 + 47))
    -[GEOActiveTileGroup setProblemStatusURLLegacy:](self, "setProblemStatusURLLegacy:");
  if (*((_QWORD *)v4 + 60))
    -[GEOActiveTileGroup setReverseGeocoderVersionsURLLegacy:](self, "setReverseGeocoderVersionsURLLegacy:");
  if (*((_QWORD *)v4 + 45))
    -[GEOActiveTileGroup setProblemCategoriesURLLegacy:](self, "setProblemCategoriesURLLegacy:");
  if (*((_QWORD *)v4 + 17))
    -[GEOActiveTileGroup setAnnouncementsURLLegacy:](self, "setAnnouncementsURLLegacy:");
  v215 = 0u;
  v214 = 0u;
  v213 = 0u;
  v212 = 0u;
  v30 = *((id *)v4 + 16);
  v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v212, v253, 16);
  if (v31)
  {
    v32 = v31;
    v33 = *(_QWORD *)v213;
    do
    {
      for (ii = 0; ii != v32; ++ii)
      {
        if (*(_QWORD *)v213 != v33)
          objc_enumerationMutation(v30);
        -[GEOActiveTileGroup addAnnouncementsSupportedLanguages:](self, "addAnnouncementsSupportedLanguages:", *(_QWORD *)(*((_QWORD *)&v212 + 1) + 8 * ii));
      }
      v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v212, v253, 16);
    }
    while (v32);
  }

  if (*((_QWORD *)v4 + 27))
    -[GEOActiveTileGroup setDispatcherURLLegacy:](self, "setDispatcherURLLegacy:");
  if (*((_QWORD *)v4 + 46))
    -[GEOActiveTileGroup setProblemOptInURLLegacy:](self, "setProblemOptInURLLegacy:");
  versionManifest = self->_versionManifest;
  v36 = *((_QWORD *)v4 + 72);
  if (versionManifest)
  {
    if (v36)
      -[GEOVersionManifest mergeFrom:](versionManifest, "mergeFrom:");
  }
  else if (v36)
  {
    -[GEOActiveTileGroup setVersionManifest:](self, "setVersionManifest:");
  }
  v211 = 0u;
  v210 = 0u;
  v209 = 0u;
  v208 = 0u;
  v37 = *((id *)v4 + 66);
  v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v208, v252, 16);
  if (v38)
  {
    v39 = v38;
    v40 = *(_QWORD *)v209;
    do
    {
      for (jj = 0; jj != v39; ++jj)
      {
        if (*(_QWORD *)v209 != v40)
          objc_enumerationMutation(v37);
        -[GEOActiveTileGroup addStyleSheet:](self, "addStyleSheet:", *(_QWORD *)(*((_QWORD *)&v208 + 1) + 8 * jj));
      }
      v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v208, v252, 16);
    }
    while (v39);
  }

  v207 = 0u;
  v205 = 0u;
  v206 = 0u;
  v204 = 0u;
  v42 = *((id *)v4 + 65);
  v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v204, v251, 16);
  if (v43)
  {
    v44 = v43;
    v45 = *(_QWORD *)v205;
    do
    {
      for (kk = 0; kk != v44; ++kk)
      {
        if (*(_QWORD *)v205 != v45)
          objc_enumerationMutation(v42);
        -[GEOActiveTileGroup addStyleSheetChecksum:](self, "addStyleSheetChecksum:", *(_QWORD *)(*((_QWORD *)&v204 + 1) + 8 * kk));
      }
      v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v204, v251, 16);
    }
    while (v44);
  }

  v202 = 0u;
  v203 = 0u;
  v200 = 0u;
  v201 = 0u;
  v47 = *((id *)v4 + 68);
  v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v200, v250, 16);
  if (v48)
  {
    v49 = v48;
    v50 = *(_QWORD *)v201;
    do
    {
      for (mm = 0; mm != v49; ++mm)
      {
        if (*(_QWORD *)v201 != v50)
          objc_enumerationMutation(v47);
        -[GEOActiveTileGroup addTexture:](self, "addTexture:", *(_QWORD *)(*((_QWORD *)&v200 + 1) + 8 * mm));
      }
      v49 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v200, v250, 16);
    }
    while (v49);
  }

  v198 = 0u;
  v199 = 0u;
  v196 = 0u;
  v197 = 0u;
  v52 = *((id *)v4 + 67);
  v53 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v196, v249, 16);
  if (v53)
  {
    v54 = v53;
    v55 = *(_QWORD *)v197;
    do
    {
      for (nn = 0; nn != v54; ++nn)
      {
        if (*(_QWORD *)v197 != v55)
          objc_enumerationMutation(v52);
        -[GEOActiveTileGroup addTextureChecksum:](self, "addTextureChecksum:", *(_QWORD *)(*((_QWORD *)&v196 + 1) + 8 * nn));
      }
      v54 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v196, v249, 16);
    }
    while (v54);
  }

  v194 = 0u;
  v195 = 0u;
  v192 = 0u;
  v193 = 0u;
  v57 = *((id *)v4 + 34);
  v58 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v192, v248, 16);
  if (v58)
  {
    v59 = v58;
    v60 = *(_QWORD *)v193;
    do
    {
      for (i1 = 0; i1 != v59; ++i1)
      {
        if (*(_QWORD *)v193 != v60)
          objc_enumerationMutation(v57);
        -[GEOActiveTileGroup addFont:](self, "addFont:", *(_QWORD *)(*((_QWORD *)&v192 + 1) + 8 * i1));
      }
      v59 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v192, v248, 16);
    }
    while (v59);
  }

  v190 = 0u;
  v191 = 0u;
  v188 = 0u;
  v189 = 0u;
  v62 = *((id *)v4 + 33);
  v63 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v188, v247, 16);
  if (v63)
  {
    v64 = v63;
    v65 = *(_QWORD *)v189;
    do
    {
      for (i2 = 0; i2 != v64; ++i2)
      {
        if (*(_QWORD *)v189 != v65)
          objc_enumerationMutation(v62);
        -[GEOActiveTileGroup addFontChecksum:](self, "addFontChecksum:", *(_QWORD *)(*((_QWORD *)&v188 + 1) + 8 * i2));
      }
      v64 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v188, v247, 16);
    }
    while (v64);
  }

  v186 = 0u;
  v187 = 0u;
  v184 = 0u;
  v185 = 0u;
  v67 = *((id *)v4 + 36);
  v68 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v184, v246, 16);
  if (v68)
  {
    v69 = v68;
    v70 = *(_QWORD *)v185;
    do
    {
      for (i3 = 0; i3 != v69; ++i3)
      {
        if (*(_QWORD *)v185 != v70)
          objc_enumerationMutation(v67);
        -[GEOActiveTileGroup addIcon:](self, "addIcon:", *(_QWORD *)(*((_QWORD *)&v184 + 1) + 8 * i3));
      }
      v69 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v184, v246, 16);
    }
    while (v69);
  }

  v182 = 0u;
  v183 = 0u;
  v180 = 0u;
  v181 = 0u;
  v72 = *((id *)v4 + 35);
  v73 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v180, v245, 16);
  if (v73)
  {
    v74 = v73;
    v75 = *(_QWORD *)v181;
    do
    {
      for (i4 = 0; i4 != v74; ++i4)
      {
        if (*(_QWORD *)v181 != v75)
          objc_enumerationMutation(v72);
        -[GEOActiveTileGroup addIconChecksum:](self, "addIconChecksum:", *(_QWORD *)(*((_QWORD *)&v180 + 1) + 8 * i4));
      }
      v74 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v180, v245, 16);
    }
    while (v74);
  }

  v178 = 0u;
  v179 = 0u;
  v176 = 0u;
  v177 = 0u;
  v77 = *((id *)v4 + 75);
  v78 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v176, v244, 16);
  if (v78)
  {
    v79 = v78;
    v80 = *(_QWORD *)v177;
    do
    {
      for (i5 = 0; i5 != v79; ++i5)
      {
        if (*(_QWORD *)v177 != v80)
          objc_enumerationMutation(v77);
        -[GEOActiveTileGroup addXml:](self, "addXml:", *(_QWORD *)(*((_QWORD *)&v176 + 1) + 8 * i5));
      }
      v79 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v176, v244, 16);
    }
    while (v79);
  }

  v174 = 0u;
  v175 = 0u;
  v172 = 0u;
  v173 = 0u;
  v82 = *((id *)v4 + 74);
  v83 = objc_msgSend(v82, "countByEnumeratingWithState:objects:count:", &v172, v243, 16);
  if (v83)
  {
    v84 = v83;
    v85 = *(_QWORD *)v173;
    do
    {
      for (i6 = 0; i6 != v84; ++i6)
      {
        if (*(_QWORD *)v173 != v85)
          objc_enumerationMutation(v82);
        -[GEOActiveTileGroup addXmlChecksum:](self, "addXmlChecksum:", *(_QWORD *)(*((_QWORD *)&v172 + 1) + 8 * i6));
      }
      v84 = objc_msgSend(v82, "countByEnumeratingWithState:objects:count:", &v172, v243, 16);
    }
    while (v84);
  }

  if (*((_QWORD *)v4 + 12))
    -[GEOActiveTileGroup setAbExperimentURLLegacy:](self, "setAbExperimentURLLegacy:");
  if (*((_QWORD *)v4 + 24))
    -[GEOActiveTileGroup setBusinessPortalBaseURLLegacy:](self, "setBusinessPortalBaseURLLegacy:");
  if (*((_QWORD *)v4 + 38))
    -[GEOActiveTileGroup setLogMessageUsageURLLegacy:](self, "setLogMessageUsageURLLegacy:");
  v170 = 0u;
  v171 = 0u;
  v168 = 0u;
  v169 = 0u;
  v87 = *((id *)v4 + 37);
  v88 = objc_msgSend(v87, "countByEnumeratingWithState:objects:count:", &v168, v242, 16);
  if (v88)
  {
    v89 = v88;
    v90 = *(_QWORD *)v169;
    do
    {
      for (i7 = 0; i7 != v89; ++i7)
      {
        if (*(_QWORD *)v169 != v90)
          objc_enumerationMutation(v87);
        -[GEOActiveTileGroup addLocationShiftEnabledRegion:](self, "addLocationShiftEnabledRegion:", *(_QWORD *)(*((_QWORD *)&v168 + 1) + 8 * i7));
      }
      v89 = objc_msgSend(v87, "countByEnumeratingWithState:objects:count:", &v168, v242, 16);
    }
    while (v89);
  }

  if ((*((_QWORD *)v4 + 79) & 1) != 0)
  {
    self->_locationShiftVersion = *((_DWORD *)v4 + 156);
    *(_QWORD *)&self->_flags |= 1uLL;
  }
  v92 = objc_msgSend(v4, "hybridUnavailableRegionsCount");
  if (v92)
  {
    v93 = v92;
    for (i8 = 0; i8 != v93; ++i8)
    {
      objc_msgSend(v4, "hybridUnavailableRegionAtIndex:", i8);
      -[GEOActiveTileGroup addHybridUnavailableRegion:](self, "addHybridUnavailableRegion:", v167);
    }
  }
  if (*((_QWORD *)v4 + 56))
    -[GEOActiveTileGroup setReserved:](self, "setReserved:");
  if (*((_QWORD *)v4 + 63))
    -[GEOActiveTileGroup setSpatialLookupURLLegacy:](self, "setSpatialLookupURLLegacy:");
  v165 = 0u;
  v166 = 0u;
  v163 = 0u;
  v164 = 0u;
  v95 = *((id *)v4 + 13);
  v96 = objc_msgSend(v95, "countByEnumeratingWithState:objects:count:", &v163, v241, 16);
  if (v96)
  {
    v97 = v96;
    v98 = *(_QWORD *)v164;
    do
    {
      for (i9 = 0; i9 != v97; ++i9)
      {
        if (*(_QWORD *)v164 != v98)
          objc_enumerationMutation(v95);
        -[GEOActiveTileGroup addActiveResource:](self, "addActiveResource:", *(_QWORD *)(*((_QWORD *)&v163 + 1) + 8 * i9));
      }
      v97 = objc_msgSend(v95, "countByEnumeratingWithState:objects:count:", &v163, v241, 16);
    }
    while (v97);
  }

  v161 = 0u;
  v162 = 0u;
  v159 = 0u;
  v160 = 0u;
  v100 = *((id *)v4 + 54);
  v101 = objc_msgSend(v100, "countByEnumeratingWithState:objects:count:", &v159, v240, 16);
  if (v101)
  {
    v102 = v101;
    v103 = *(_QWORD *)v160;
    do
    {
      for (i10 = 0; i10 != v102; ++i10)
      {
        if (*(_QWORD *)v160 != v103)
          objc_enumerationMutation(v100);
        -[GEOActiveTileGroup addRegionalResource:](self, "addRegionalResource:", *(_QWORD *)(*((_QWORD *)&v159 + 1) + 8 * i10));
      }
      v102 = objc_msgSend(v100, "countByEnumeratingWithState:objects:count:", &v159, v240, 16);
    }
    while (v102);
  }

  if ((*((_QWORD *)v4 + 79) & 2) != 0)
  {
    self->_modelVersion = *((_DWORD *)v4 + 157);
    *(_QWORD *)&self->_flags |= 2uLL;
  }
  v105 = objc_msgSend(v4, "activeScalesCount");
  if (v105)
  {
    v106 = v105;
    for (i11 = 0; i11 != v106; ++i11)
      -[GEOActiveTileGroup addActiveScale:](self, "addActiveScale:", objc_msgSend(v4, "activeScaleAtIndex:", i11));
  }
  v108 = objc_msgSend(v4, "activeScenariosCount");
  if (v108)
  {
    v109 = v108;
    for (i12 = 0; i12 != v109; ++i12)
      -[GEOActiveTileGroup addActiveScenario:](self, "addActiveScenario:", objc_msgSend(v4, "activeScenarioAtIndex:", i12));
  }
  v157 = 0u;
  v158 = 0u;
  v155 = 0u;
  v156 = 0u;
  v111 = *((id *)v4 + 64);
  v112 = objc_msgSend(v111, "countByEnumeratingWithState:objects:count:", &v155, v239, 16);
  if (v112)
  {
    v113 = v112;
    v114 = *(_QWORD *)v156;
    do
    {
      for (i13 = 0; i13 != v113; ++i13)
      {
        if (*(_QWORD *)v156 != v114)
          objc_enumerationMutation(v111);
        -[GEOActiveTileGroup addStaleResource:](self, "addStaleResource:", *(_QWORD *)(*((_QWORD *)&v155 + 1) + 8 * i13));
      }
      v113 = objc_msgSend(v111, "countByEnumeratingWithState:objects:count:", &v155, v239, 16);
    }
    while (v113);
  }

  dataSet = self->_dataSet;
  v117 = *((_QWORD *)v4 + 25);
  if (dataSet)
  {
    if (v117)
      -[GEODataSetDescription mergeFrom:](dataSet, "mergeFrom:");
  }
  else if (v117)
  {
    -[GEOActiveTileGroup setDataSet:](self, "setDataSet:");
  }
  if (*((_QWORD *)v4 + 49))
    -[GEOActiveTileGroup setRealtimeTrafficProbeURLLegacy:](self, "setRealtimeTrafficProbeURLLegacy:");
  if (*((_QWORD *)v4 + 22))
    -[GEOActiveTileGroup setBatchTrafficProbeURLLegacy:](self, "setBatchTrafficProbeURLLegacy:");
  if (*((_QWORD *)v4 + 39))
    -[GEOActiveTileGroup setLogMessageUsageV3URLLegacy:](self, "setLogMessageUsageV3URLLegacy:");
  if (*((_QWORD *)v4 + 44))
    -[GEOActiveTileGroup setProactiveRoutingURLLegacy:](self, "setProactiveRoutingURLLegacy:");
  if (*((_QWORD *)v4 + 19))
    -[GEOActiveTileGroup setBackgroundDispatcherURLLegacy:](self, "setBackgroundDispatcherURLLegacy:");
  if (*((_QWORD *)v4 + 23))
    -[GEOActiveTileGroup setBluePOIURLLegacy:](self, "setBluePOIURLLegacy:");
  if (*((_QWORD *)v4 + 20))
    -[GEOActiveTileGroup setBackgroundRevGeoURLLegacy:](self, "setBackgroundRevGeoURLLegacy:");
  if (*((_QWORD *)v4 + 73))
    -[GEOActiveTileGroup setWifiConnectionQualityProbeURLLegacy:](self, "setWifiConnectionQualityProbeURLLegacy:");
  if (*((_QWORD *)v4 + 40))
    -[GEOActiveTileGroup setMuninBaseURL:](self, "setMuninBaseURL:");
  if (*((_QWORD *)v4 + 32))
    -[GEOActiveTileGroup setFlyoverRegionVersions:](self, "setFlyoverRegionVersions:");
  urlInfoSet = self->_urlInfoSet;
  v119 = *((_QWORD *)v4 + 71);
  if (urlInfoSet)
  {
    if (v119)
      -[GEOURLInfoSet mergeFrom:](urlInfoSet, "mergeFrom:");
  }
  else if (v119)
  {
    -[GEOActiveTileGroup setUrlInfoSet:](self, "setUrlInfoSet:");
  }
  v153 = 0u;
  v154 = 0u;
  v151 = 0u;
  v152 = 0u;
  v120 = *((id *)v4 + 41);
  v121 = objc_msgSend(v120, "countByEnumeratingWithState:objects:count:", &v151, v238, 16);
  if (v121)
  {
    v122 = v121;
    v123 = *(_QWORD *)v152;
    do
    {
      for (i14 = 0; i14 != v122; ++i14)
      {
        if (*(_QWORD *)v152 != v123)
          objc_enumerationMutation(v120);
        -[GEOActiveTileGroup addMuninBucket:](self, "addMuninBucket:", *(_QWORD *)(*((_QWORD *)&v151 + 1) + 8 * i14));
      }
      v122 = objc_msgSend(v120, "countByEnumeratingWithState:objects:count:", &v151, v238, 16);
    }
    while (v122);
  }

  if (*((_QWORD *)v4 + 29))
    -[GEOActiveTileGroup setEnvironment:](self, "setEnvironment:");
  v149 = 0u;
  v150 = 0u;
  v147 = 0u;
  v148 = 0u;
  v125 = *((id *)v4 + 28);
  v126 = objc_msgSend(v125, "countByEnumeratingWithState:objects:count:", &v147, v237, 16);
  if (v126)
  {
    v127 = v126;
    v128 = *(_QWORD *)v148;
    do
    {
      for (i15 = 0; i15 != v127; ++i15)
      {
        if (*(_QWORD *)v148 != v128)
          objc_enumerationMutation(v125);
        -[GEOActiveTileGroup addDisplayStrings:](self, "addDisplayStrings:", *(_QWORD *)(*((_QWORD *)&v147 + 1) + 8 * i15));
      }
      v127 = objc_msgSend(v125, "countByEnumeratingWithState:objects:count:", &v147, v237, 16);
    }
    while (v127);
  }

  v145 = 0u;
  v146 = 0u;
  v143 = 0u;
  v144 = 0u;
  v130 = *((id *)v4 + 31);
  v131 = objc_msgSend(v130, "countByEnumeratingWithState:objects:count:", &v143, v236, 16);
  if (v131)
  {
    v132 = v131;
    v133 = *(_QWORD *)v144;
    do
    {
      for (i16 = 0; i16 != v132; ++i16)
      {
        if (*(_QWORD *)v144 != v133)
          objc_enumerationMutation(v130);
        -[GEOActiveTileGroup addExplicitResource:](self, "addExplicitResource:", *(_QWORD *)(*((_QWORD *)&v143 + 1) + 8 * i16), (_QWORD)v143);
      }
      v132 = objc_msgSend(v130, "countByEnumeratingWithState:objects:count:", &v143, v236, 16);
    }
    while (v132);
  }

  offlineMetadata = self->_offlineMetadata;
  v136 = *((_QWORD *)v4 + 42);
  if (offlineMetadata)
  {
    if (v136)
      -[GEOOfflineMetadata mergeFrom:](offlineMetadata, "mergeFrom:");
  }
  else if (v136)
  {
    -[GEOActiveTileGroup setOfflineMetadata:](self, "setOfflineMetadata:");
  }
  if (*((_QWORD *)v4 + 57))
  {
    resourceCanonicalNameToFileName = self->_resourceCanonicalNameToFileName;
    if (resourceCanonicalNameToFileName)
    {
      -[NSMutableDictionary addEntriesFromDictionary:](resourceCanonicalNameToFileName, "addEntriesFromDictionary:");
    }
    else
    {
      v138 = (NSMutableDictionary *)objc_msgSend(*((id *)v4 + 57), "copy");
      v139 = self->_resourceCanonicalNameToFileName;
      self->_resourceCanonicalNameToFileName = v138;

    }
  }
  if (*((_QWORD *)v4 + 50))
  {
    regionalResourceCanonicalNameToFileName = self->_regionalResourceCanonicalNameToFileName;
    if (regionalResourceCanonicalNameToFileName)
    {
      -[NSMutableDictionary addEntriesFromDictionary:](regionalResourceCanonicalNameToFileName, "addEntriesFromDictionary:");
    }
    else
    {
      v141 = (NSMutableDictionary *)objc_msgSend(*((id *)v4 + 50), "copy");
      v142 = self->_regionalResourceCanonicalNameToFileName;
      self->_regionalResourceCanonicalNameToFileName = v141;

    }
  }

}

- (PBUnknownFields)unknownFields
{
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v5;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_QWORD *)&self->_flags & 4) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      v5 = reader;
      objc_sync_enter(v5);
      GEOActiveTileGroupReadSpecified((uint64_t)self, (uint64_t)self->_reader, (int *)&unknownFields_tags_5);
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
  char v6;
  PBUnknownFields *unknownFields;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSMutableArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSMutableArray *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSMutableArray *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSMutableArray *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  NSMutableArray *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  NSMutableArray *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  NSMutableArray *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  NSMutableArray *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  NSMutableArray *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  NSMutableArray *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
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
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  _BYTE v107[128];
  _BYTE v108[128];
  _BYTE v109[128];
  _BYTE v110[128];
  _BYTE v111[128];
  _BYTE v112[128];
  _BYTE v113[128];
  _BYTE v114[128];
  _BYTE v115[128];
  _BYTE v116[128];
  _BYTE v117[128];
  uint64_t v118;

  v3 = a3;
  v118 = *MEMORY[0x1E0C80C00];
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  v6 = *((_BYTE *)&self->_flags + 8) | 0x40;
  *(_QWORD *)&self->_flags |= 4uLL;
  *((_BYTE *)&self->_flags + 8) = v6;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEOActiveTileGroup readAll:](self, "readAll:", 0);
    v105 = 0u;
    v106 = 0u;
    v103 = 0u;
    v104 = 0u;
    v8 = self->_tileSets;
    v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v103, v117, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v104;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v104 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v103 + 1) + 8 * v12++), "clearUnknownFields:", 1);
        }
        while (v10 != v12);
        v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v103, v117, 16);
      }
      while (v10);
    }

    v101 = 0u;
    v102 = 0u;
    v99 = 0u;
    v100 = 0u;
    v13 = self->_attributions;
    v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v99, v116, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v100;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v100 != v16)
            objc_enumerationMutation(v13);
          objc_msgSend(*(id *)(*((_QWORD *)&v99 + 1) + 8 * v17++), "clearUnknownFields:", 1);
        }
        while (v15 != v17);
        v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v99, v116, 16);
      }
      while (v15);
    }

    v97 = 0u;
    v98 = 0u;
    v95 = 0u;
    v96 = 0u;
    v18 = self->_regionalResourceTiles;
    v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v95, v115, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v96;
      do
      {
        v22 = 0;
        do
        {
          if (*(_QWORD *)v96 != v21)
            objc_enumerationMutation(v18);
          objc_msgSend(*(id *)(*((_QWORD *)&v95 + 1) + 8 * v22++), "clearUnknownFields:", 1);
        }
        while (v20 != v22);
        v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v95, v115, 16);
      }
      while (v20);
    }

    v93 = 0u;
    v94 = 0u;
    v91 = 0u;
    v92 = 0u;
    v23 = self->_regionalResourceRegions;
    v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v91, v114, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v92;
      do
      {
        v27 = 0;
        do
        {
          if (*(_QWORD *)v92 != v26)
            objc_enumerationMutation(v23);
          objc_msgSend(*(id *)(*((_QWORD *)&v91 + 1) + 8 * v27++), "clearUnknownFields:", 1);
        }
        while (v25 != v27);
        v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v91, v114, 16);
      }
      while (v25);
    }

    -[GEOVersionManifest clearUnknownFields:](self->_versionManifest, "clearUnknownFields:", 1);
    v89 = 0u;
    v90 = 0u;
    v87 = 0u;
    v88 = 0u;
    v28 = self->_locationShiftEnabledRegions;
    v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v87, v113, 16);
    if (v29)
    {
      v30 = v29;
      v31 = *(_QWORD *)v88;
      do
      {
        v32 = 0;
        do
        {
          if (*(_QWORD *)v88 != v31)
            objc_enumerationMutation(v28);
          objc_msgSend(*(id *)(*((_QWORD *)&v87 + 1) + 8 * v32++), "clearUnknownFields:", 1);
        }
        while (v30 != v32);
        v30 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v87, v113, 16);
      }
      while (v30);
    }

    v85 = 0u;
    v86 = 0u;
    v83 = 0u;
    v84 = 0u;
    v33 = self->_activeResources;
    v34 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v83, v112, 16);
    if (v34)
    {
      v35 = v34;
      v36 = *(_QWORD *)v84;
      do
      {
        v37 = 0;
        do
        {
          if (*(_QWORD *)v84 != v36)
            objc_enumerationMutation(v33);
          objc_msgSend(*(id *)(*((_QWORD *)&v83 + 1) + 8 * v37++), "clearUnknownFields:", 1);
        }
        while (v35 != v37);
        v35 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v83, v112, 16);
      }
      while (v35);
    }

    v81 = 0u;
    v82 = 0u;
    v79 = 0u;
    v80 = 0u;
    v38 = self->_regionalResources;
    v39 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v38, "countByEnumeratingWithState:objects:count:", &v79, v111, 16);
    if (v39)
    {
      v40 = v39;
      v41 = *(_QWORD *)v80;
      do
      {
        v42 = 0;
        do
        {
          if (*(_QWORD *)v80 != v41)
            objc_enumerationMutation(v38);
          objc_msgSend(*(id *)(*((_QWORD *)&v79 + 1) + 8 * v42++), "clearUnknownFields:", 1);
        }
        while (v40 != v42);
        v40 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v38, "countByEnumeratingWithState:objects:count:", &v79, v111, 16);
      }
      while (v40);
    }

    v77 = 0u;
    v78 = 0u;
    v75 = 0u;
    v76 = 0u;
    v43 = self->_staleResources;
    v44 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v43, "countByEnumeratingWithState:objects:count:", &v75, v110, 16);
    if (v44)
    {
      v45 = v44;
      v46 = *(_QWORD *)v76;
      do
      {
        v47 = 0;
        do
        {
          if (*(_QWORD *)v76 != v46)
            objc_enumerationMutation(v43);
          objc_msgSend(*(id *)(*((_QWORD *)&v75 + 1) + 8 * v47++), "clearUnknownFields:", 1);
        }
        while (v45 != v47);
        v45 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v43, "countByEnumeratingWithState:objects:count:", &v75, v110, 16);
      }
      while (v45);
    }

    -[GEODataSetDescription clearUnknownFields:](self->_dataSet, "clearUnknownFields:", 1);
    -[GEOURLInfoSet clearUnknownFields:](self->_urlInfoSet, "clearUnknownFields:", 1);
    v73 = 0u;
    v74 = 0u;
    v71 = 0u;
    v72 = 0u;
    v48 = self->_muninBuckets;
    v49 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v48, "countByEnumeratingWithState:objects:count:", &v71, v109, 16);
    if (v49)
    {
      v50 = v49;
      v51 = *(_QWORD *)v72;
      do
      {
        v52 = 0;
        do
        {
          if (*(_QWORD *)v72 != v51)
            objc_enumerationMutation(v48);
          objc_msgSend(*(id *)(*((_QWORD *)&v71 + 1) + 8 * v52++), "clearUnknownFields:", 1);
        }
        while (v50 != v52);
        v50 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v48, "countByEnumeratingWithState:objects:count:", &v71, v109, 16);
      }
      while (v50);
    }

    v69 = 0u;
    v70 = 0u;
    v67 = 0u;
    v68 = 0u;
    v53 = self->_displayStrings;
    v54 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v53, "countByEnumeratingWithState:objects:count:", &v67, v108, 16);
    if (v54)
    {
      v55 = v54;
      v56 = *(_QWORD *)v68;
      do
      {
        v57 = 0;
        do
        {
          if (*(_QWORD *)v68 != v56)
            objc_enumerationMutation(v53);
          objc_msgSend(*(id *)(*((_QWORD *)&v67 + 1) + 8 * v57++), "clearUnknownFields:", 1);
        }
        while (v55 != v57);
        v55 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v53, "countByEnumeratingWithState:objects:count:", &v67, v108, 16);
      }
      while (v55);
    }

    v65 = 0u;
    v66 = 0u;
    v63 = 0u;
    v64 = 0u;
    v58 = self->_explicitResources;
    v59 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v58, "countByEnumeratingWithState:objects:count:", &v63, v107, 16);
    if (v59)
    {
      v60 = v59;
      v61 = *(_QWORD *)v64;
      do
      {
        v62 = 0;
        do
        {
          if (*(_QWORD *)v64 != v61)
            objc_enumerationMutation(v58);
          objc_msgSend(*(id *)(*((_QWORD *)&v63 + 1) + 8 * v62++), "clearUnknownFields:", 1, (_QWORD)v63);
        }
        while (v60 != v62);
        v60 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v58, "countByEnumeratingWithState:objects:count:", &v63, v107, 16);
      }
      while (v60);
    }

    -[GEOOfflineMetadata clearUnknownFields:](self->_offlineMetadata, "clearUnknownFields:", 1);
  }
}

- (id)_decodedFlyoverRegionVersions
{
  _GEOFlyoverRegionVersionMap *v3;
  _GEOFlyoverRegionVersionMap *v4;
  void *v5;
  _GEOFlyoverRegionVersionMap *v6;

  if (-[GEOActiveTileGroup hasFlyoverRegionVersions](self, "hasFlyoverRegionVersions"))
  {
    objc_getAssociatedObject(self, &_DecodedFlyoverRegionVersions);
    v3 = (_GEOFlyoverRegionVersionMap *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v4 = [_GEOFlyoverRegionVersionMap alloc];
      -[GEOActiveTileGroup flyoverRegionVersions](self, "flyoverRegionVersions");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = -[_GEOFlyoverRegionVersionMap initWithData:](v4, "initWithData:", v5);

      objc_setAssociatedObject(self, &_DecodedFlyoverRegionVersions, v3, (void *)0x301);
    }
    v6 = v3;

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (unsigned)versionForFlyoverRegion:(unsigned int)a3
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  unsigned int v6;

  v3 = *(_QWORD *)&a3;
  -[GEOActiveTileGroup _decodedFlyoverRegionVersions](self, "_decodedFlyoverRegionVersions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "regionForID:", v3);
  if (v5)
    v6 = *(_DWORD *)(v5 + 8);
  else
    v6 = 0;

  return v6;
}

- (BOOL)hasDataVersionForFlyoverRegion:(unsigned int)a3
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  BOOL v6;

  v3 = *(_QWORD *)&a3;
  -[GEOActiveTileGroup _decodedFlyoverRegionVersions](self, "_decodedFlyoverRegionVersions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "regionForID:", v3);
  if (v5)
    v6 = *(_BYTE *)(v5 + 12) & 1;
  else
    v6 = 0;

  return v6;
}

- (unsigned)dataVersionForFlyoverRegion:(unsigned int)a3
{
  uint64_t v3;
  void *v4;
  unsigned int *v5;
  unsigned int v6;

  v3 = *(_QWORD *)&a3;
  -[GEOActiveTileGroup _decodedFlyoverRegionVersions](self, "_decodedFlyoverRegionVersions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (unsigned int *)objc_msgSend(v4, "regionForID:", v3);
  if (v5)
    v6 = *v5;
  else
    v6 = 0;

  return v6;
}

- (void)enumerateFlyoverRegions:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[GEOActiveTileGroup _decodedFlyoverRegionVersions](self, "_decodedFlyoverRegionVersions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "enumerateFlyoverRegions:", v5);

}

- (void)_setDecodedFlyoverRegionVersions:(id)a3
{
  _GEOFlyoverRegionVersionMap *v4;
  id v5;

  v5 = a3;
  v4 = -[_GEOFlyoverRegionVersionMap initWithFlyoverRegions:]([_GEOFlyoverRegionVersionMap alloc], "initWithFlyoverRegions:", v5);
  objc_setAssociatedObject(self, &_DecodedFlyoverRegionVersions, v4, (void *)0x301);

}

- (id)localizationURLStringForTileKey:(void *)a1
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "activeTileSetForKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "localizationURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (uint64_t)requestStyleForTileKey:(void *)a1
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "activeTileSetForKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "requestStyle");

  return v2;
}

- (double)timeToLiveForTileKey:(void *)a1
{
  void *v1;
  void *v2;
  double v3;
  void *v4;
  double v5;

  objc_msgSend(a1, "activeTileSetForKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1 && objc_msgSend(v1, "hasTimeToLiveSeconds"))
  {
    v3 = (double)objc_msgSend(v2, "timeToLiveSeconds");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timeIntervalSince1970");
    v3 = v5;

  }
  return v3;
}

- (uint64_t)isAvailableForTileKey:(uint64_t)a3
{
  void *v4;
  uint64_t v5;

  objc_msgSend(a1, "activeTileSetForKey:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isAvailableForTileKey:", a3);

  return v5;
}

- (uint64_t)isHybridModeAvailableForTileKey:(uint64_t)a3
{
  _BOOL4 v5;
  uint64_t v7;
  uint64_t v8;
  unsigned int *v9;
  uint64_t v10;
  uint64_t v11;

  if (!a3)
    return 0;
  GEOTileKeyAssertIsStandard(a3);
  if (qword_1ECDBBF68 != -1)
    dispatch_once(&qword_1ECDBBF68, &__block_literal_global_319);
  if (!byte_1ECDBBED2)
  {
LABEL_9:
    v7 = objc_msgSend(a1, "hybridUnavailableRegionsCount");
    if (v7)
    {
      v8 = v7;
      v9 = (unsigned int *)objc_msgSend(a1, "hybridUnavailableRegions");
      v10 = v8 - 1;
      do
      {
        v11 = v10;
        v5 = GEOTileSetRegionContainsTileKey(v9, a3);
        if (v5)
          break;
        v10 = v11 - 1;
        v9 += 6;
      }
      while (v11);
      return !v5;
    }
    return 1;
  }
  if (qword_1ECDBBF60 != 2)
  {
    if (qword_1ECDBBF60 == 1)
    {
      v5 = GEOTileSetRegionContainsTileKey((unsigned int *)&xmmword_1ECDBBF70, a3);
      return !v5;
    }
    goto LABEL_9;
  }
  if ((*(_DWORD *)(a3 + 6) & 0x3Fu) < dword_1ECDBBF84)
    return 1;
  return GEOTileSetRegionContainsTileKey((unsigned int *)&xmmword_1ECDBBF70, a3);
}

double __91__GEOActiveTileGroup_GEOResourceManifestManagerAdditions__isHybridModeAvailableForTileKey___block_invoke()
{
  _BOOL4 HasValue;
  double result;

  HasValue = _GEOConfigHasValue(GeoServicesConfig_HybridUnavailableSimulationType, (uint64_t)off_1EDF4D458);
  byte_1ECDBBED2 = HasValue;
  if (HasValue)
  {
    qword_1ECDBBF60 = GEOConfigGetInteger(GeoServicesConfig_HybridUnavailableSimulationType, (uint64_t)off_1EDF4D458);
    if (byte_1ECDBBED2)
    {
      unk_1ECDBBF80 = 0x600000017;
      *(_QWORD *)&result = 0x1900000036;
      xmmword_1ECDBBF70 = xmmword_189CD4100;
    }
  }
  return result;
}

- (uint64_t)useProxyAuthForTileKey:(uint64_t)a3
{
  uint64_t result;
  void *v6;
  uint64_t v7;

  result = GEOAuthProxyEnabledForActiveTileGroup(a1);
  if ((_DWORD)result)
  {
    objc_msgSend(a1, "activeTileSetForKey:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "useAuthProxy");

    return v7;
  }
  return result;
}

- (BOOL)supportsTileStyle:(int)a3 size:(int)a4 scale:(int)a5
{
  void *v5;
  BOOL v6;

  -[GEOActiveTileGroup activeTileSetForStyle:size:scale:](self, "activeTileSetForStyle:size:scale:", *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5 != 0;

  return v6;
}

- (void)_resetBestLanguages
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[GEOActiveTileGroup tileSets](self, "tileSets", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "_resetBestLanguage");
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (uint64_t)hasRegionalResourcesForTileKey:(uint64_t)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  objc_msgSend(a1, "regionalResources");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v28;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v28 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        if (objc_msgSend(v10, "regionsCount"))
        {
          v11 = 0;
          while (1)
          {
            v24 = 0;
            v25 = 0;
            v26 = 0;
            if (v10)
              objc_msgSend(v10, "regionAtIndex:", v11);
            if (GEOTileSetRegionContainsTileKey((unsigned int *)&v24, a3))
              break;
            if (++v11 >= (unint64_t)objc_msgSend(v10, "regionsCount"))
              goto LABEL_12;
          }
LABEL_28:
          v18 = 1;
          goto LABEL_29;
        }
LABEL_12:
        ;
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      if (v7)
        continue;
      break;
    }
  }

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(a1, "attributions", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v31, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v21;
    while (2)
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v21 != v14)
          objc_enumerationMutation(v5);
        v16 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * j);
        if (objc_msgSend(v16, "regionsCount"))
        {
          v17 = 0;
          do
          {
            v24 = 0;
            v25 = 0;
            v26 = 0;
            if (v16)
              objc_msgSend(v16, "regionAtIndex:", v17);
            if (GEOTileSetRegionContainsTileKey((unsigned int *)&v24, a3))
              goto LABEL_28;
          }
          while (++v17 < (unint64_t)objc_msgSend(v16, "regionsCount"));
        }
      }
      v13 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v31, 16);
      if (v13)
        continue;
      break;
    }
  }
  v18 = 0;
LABEL_29:

  return v18;
}

- (GEOTileKeyList)regionalResourceKeysForTileKey:(uint64_t)a3 scale:(unsigned __int8)a4 scenarios:(void *)a5
{
  id v8;
  GEOTileKeyList *v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  uint64_t v13;
  unsigned __int8 active;
  __int128 v15;
  unint64_t v16;
  unint64_t v17;
  void *v18;
  uint64_t v19;
  unsigned __int8 v20;
  __int128 v21;
  unsigned __int128 v23;
  unsigned __int128 v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unsigned __int128 v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = objc_alloc_init(GEOTileKeyList);
  if (objc_msgSend(a1, "regionalResourcesCount"))
  {
    v10 = 0;
    v11 = (unint64_t)a4 << 54;
    v23 = xmmword_189CD4110;
    do
    {
      objc_msgSend(a1, "regionalResourceAtIndex:", v10, v23);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v12, "regionsCount"))
      {
        v13 = 0;
        while (1)
        {
          v25 = 0;
          v26 = 0;
          v27 = 0;
          if (v12)
            objc_msgSend(v12, "regionAtIndex:", v13);
          if (GEOTileSetRegionContainsTileKey((unsigned int *)&v25, a3))
            break;
          if (++v13 >= (unint64_t)objc_msgSend(v12, "regionsCount"))
            goto LABEL_11;
        }
        v29 = 0;
        v30 = 0;
        active = GEORegionalResourceTileKeyActiveScenariosBitSet(v8);
        v28 = v23;
        *(_QWORD *)((char *)&v28 + 1) = (v23 >> 8) & 0xC000000000000000 | v11 | v10 | ((unint64_t)active << 32) | 0x800000000000;
        *((_QWORD *)&v15 + 1) = (*((_QWORD *)&v23 + 1) >> 8) | ((unint64_t)((unsigned __int16)(HIDWORD(v23) >> 8) | (HIBYTE(v23) << 16)) << 32);
        *(_QWORD *)&v15 = (v23 >> 8) & 0xC000000000000000 | v11;
        v29 = v28;
        v30 = v15 >> 56;
        -[GEOTileKeyList addKey:](v9, "addKey:", &v29);
      }
LABEL_11:

      ++v10;
    }
    while (v10 < objc_msgSend(a1, "regionalResourcesCount"));
  }
  if (objc_msgSend(a1, "attributionsCount"))
  {
    v16 = 0;
    v17 = (unint64_t)a4 << 54;
    v24 = xmmword_189CD4110;
    do
    {
      objc_msgSend(a1, "attributionAtIndex:", v16, v24);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v18, "regionsCount"))
      {
        v19 = 0;
        while (1)
        {
          v25 = 0;
          v26 = 0;
          v27 = 0;
          if (v18)
            objc_msgSend(v18, "regionAtIndex:", v19);
          if (GEOTileSetRegionContainsTileKey((unsigned int *)&v25, a3))
            break;
          if (++v19 >= (unint64_t)objc_msgSend(v18, "regionsCount"))
            goto LABEL_22;
        }
        v29 = 0;
        v30 = 0;
        v20 = GEORegionalResourceTileKeyActiveScenariosBitSet(v8);
        v28 = v24;
        *(_QWORD *)((char *)&v28 + 1) = (v24 >> 8) & 0xC000000000000000 | v17 | v16 | ((unint64_t)v20 << 32) | 0x810000000000;
        *((_QWORD *)&v21 + 1) = (*((_QWORD *)&v24 + 1) >> 8) | ((unint64_t)((unsigned __int16)(HIDWORD(v24) >> 8) | (HIBYTE(v24) << 16)) << 32);
        *(_QWORD *)&v21 = (v24 >> 8) & 0xC000000000000000 | v17;
        v29 = v28;
        v30 = v21 >> 56;
        -[GEOTileKeyList addKey:](v9, "addKey:", &v29);
      }
LABEL_22:

      ++v16;
    }
    while (v16 < objc_msgSend(a1, "attributionsCount"));
  }

  return v9;
}

- (id)regionalResourcesForMapRegions:(id)a3 resourceFilter:(id)a4 attributionFilter:(id)a5
{
  id v8;
  unsigned int (**v9)(id, _QWORD);
  unsigned int (**v10)(id, _QWORD);
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  unint64_t v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t j;
  uint64_t v48;
  uint64_t v50;
  GEOActiveTileGroup *v51;
  uint64_t v52;
  uint64_t v53;
  id v54;
  uint64_t v55;
  void *v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  _BYTE v68[128];
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (unsigned int (**)(id, _QWORD))a4;
  v10 = (unsigned int (**)(id, _QWORD))a5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = self;
  if (v9 && -[GEOActiveTileGroup regionalResourcesCount](self, "regionalResourcesCount"))
  {
    v12 = 0;
    v54 = v8;
    do
    {
      v52 = v12;
      -[GEOActiveTileGroup regionalResourceAtIndex:](self, "regionalResourceAtIndex:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v13, "regionsCount"))
      {
        v14 = 0;
        do
        {
          v65 = 0;
          v66 = 0;
          v67 = 0;
          if (v13)
            objc_msgSend(v13, "regionAtIndex:", v14);
          v55 = v14;
          if (objc_msgSend(v8, "count"))
          {
            v15 = 0;
            do
            {
              objc_msgSend(v8, "objectAtIndexedSubscript:", v15);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = GEOMapRectForMapRegion(v16);
              v19 = v18;
              v21 = v20;
              v23 = v22;

              if (GEOTileSetRegionIntersectsMapRect((unsigned int *)&v65, v17, v19, v21, v23))
              {
                v63 = 0u;
                v64 = 0u;
                v61 = 0u;
                v62 = 0u;
                v24 = v13;
                objc_msgSend(v13, "resources");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v61, v69, 16);
                if (v26)
                {
                  v27 = v26;
                  v28 = *(_QWORD *)v62;
                  do
                  {
                    for (i = 0; i != v27; ++i)
                    {
                      if (*(_QWORD *)v62 != v28)
                        objc_enumerationMutation(v25);
                      v30 = *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * i);
                      if (v9[2](v9, v30))
                        objc_msgSend(v11, "addObject:", v30);
                    }
                    v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v61, v69, 16);
                  }
                  while (v27);
                }

                v13 = v24;
                v8 = v54;
              }
              ++v15;
            }
            while (v15 < objc_msgSend(v8, "count"));
          }
          v14 = v55 + 1;
        }
        while (v55 + 1 < (unint64_t)objc_msgSend(v13, "regionsCount"));
      }

      self = v51;
      v12 = v52 + 1;
    }
    while (v52 + 1 < -[GEOActiveTileGroup regionalResourcesCount](v51, "regionalResourcesCount"));
  }
  if (v10 && -[GEOActiveTileGroup attributionsCount](self, "attributionsCount"))
  {
    v31 = 0;
    do
    {
      v50 = v31;
      -[GEOActiveTileGroup attributionAtIndex:](self, "attributionAtIndex:", v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v32, "regionsCount"))
      {
        v33 = 0;
        v56 = v32;
        do
        {
          v65 = 0;
          v66 = 0;
          v67 = 0;
          if (v32)
            objc_msgSend(v32, "regionAtIndex:", v33);
          v53 = v33;
          if (objc_msgSend(v8, "count"))
          {
            v34 = 0;
            do
            {
              objc_msgSend(v8, "objectAtIndexedSubscript:", v34);
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              v36 = GEOMapRectForMapRegion(v35);
              v38 = v37;
              v40 = v39;
              v42 = v41;

              if (GEOTileSetRegionIntersectsMapRect((unsigned int *)&v65, v36, v38, v40, v42))
              {
                v59 = 0u;
                v60 = 0u;
                v57 = 0u;
                v58 = 0u;
                objc_msgSend(v32, "resources");
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v57, v68, 16);
                if (v44)
                {
                  v45 = v44;
                  v46 = *(_QWORD *)v58;
                  do
                  {
                    for (j = 0; j != v45; ++j)
                    {
                      if (*(_QWORD *)v58 != v46)
                        objc_enumerationMutation(v43);
                      v48 = *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * j);
                      if (v10[2](v10, v48))
                        objc_msgSend(v11, "addObject:", v48);
                    }
                    v45 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v57, v68, 16);
                  }
                  while (v45);
                }

                v32 = v56;
              }
              ++v34;
            }
            while (v34 < objc_msgSend(v8, "count"));
          }
          v33 = v53 + 1;
        }
        while (v53 + 1 < (unint64_t)objc_msgSend(v32, "regionsCount"));
      }

      self = v51;
      v31 = v50 + 1;
    }
    while (v50 + 1 < -[GEOActiveTileGroup attributionsCount](v51, "attributionsCount"));
  }

  return v11;
}

- (uint64_t)largestRegionalResourceZoomLevelContainingTileKey:(uint64_t)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  unint64_t v12;
  _BOOL4 v13;
  unsigned int v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  unint64_t v21;
  _BOOL4 v22;
  unsigned int v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  objc_msgSend(a1, "regionalResources");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v33 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        if (objc_msgSend(v11, "regionsCount"))
        {
          v12 = 0;
          do
          {
            v29 = 0;
            v30 = 0;
            v31 = 0;
            if (v11)
              objc_msgSend(v11, "regionAtIndex:", v12);
            v13 = GEOTileSetRegionContainsTileKey((unsigned int *)&v29, a3);
            if (v8 <= HIDWORD(v31))
              v14 = HIDWORD(v31);
            else
              v14 = v8;
            if (v13)
              v8 = v14;
            else
              v8 = v8;
            ++v12;
          }
          while (v12 < objc_msgSend(v11, "regionsCount"));
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  objc_msgSend(a1, "attributions", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v36, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v26;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v26 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * j);
        if (objc_msgSend(v20, "regionsCount"))
        {
          v21 = 0;
          do
          {
            v29 = 0;
            v30 = 0;
            v31 = 0;
            if (v20)
              objc_msgSend(v20, "regionAtIndex:", v21);
            v22 = GEOTileSetRegionContainsTileKey((unsigned int *)&v29, a3);
            if (v8 <= HIDWORD(v31))
              v23 = HIDWORD(v31);
            else
              v23 = v8;
            if (v22)
              v8 = v23;
            else
              v8 = v8;
            ++v21;
          }
          while (v21 < objc_msgSend(v20, "regionsCount"));
        }
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v36, 16);
    }
    while (v17);
  }

  return v8;
}

- (id)regionalResourcesForMapRect:(id)a3
{
  double var1;
  double var0;
  double v5;
  double v6;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  uint64_t v23;
  void *v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  var1 = a3.var1.var1;
  var0 = a3.var1.var0;
  v5 = a3.var0.var1;
  v6 = a3.var0.var0;
  v39 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  -[GEOActiveTileGroup regionalResources](self, "regionalResources");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v34 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        if (objc_msgSend(v14, "regionsCount"))
        {
          v15 = 0;
          while (1)
          {
            v30 = 0;
            v31 = 0;
            v32 = 0;
            if (v14)
              objc_msgSend(v14, "regionAtIndex:", v15);
            if (GEOTileSetRegionIntersectsMapRect((unsigned int *)&v30, v6, v5, var0, var1))
              break;
            if (++v15 >= (unint64_t)objc_msgSend(v14, "regionsCount"))
              goto LABEL_14;
          }
          objc_msgSend(v14, "resources");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObjectsFromArray:", v16);

        }
LABEL_14:
        ;
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    }
    while (v11);
  }

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  -[GEOActiveTileGroup attributions](self, "attributions", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v26, v37, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v27;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v27 != v20)
          objc_enumerationMutation(v17);
        v22 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * j);
        if (objc_msgSend(v22, "regionsCount"))
        {
          v23 = 0;
          while (1)
          {
            v30 = 0;
            v31 = 0;
            v32 = 0;
            if (v22)
              objc_msgSend(v22, "regionAtIndex:", v23);
            if (GEOTileSetRegionIntersectsMapRect((unsigned int *)&v30, v6, v5, var0, var1))
              break;
            if (++v23 >= (unint64_t)objc_msgSend(v22, "regionsCount"))
              goto LABEL_29;
          }
          objc_msgSend(v22, "resources");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObjectsFromArray:", v24);

        }
LABEL_29:
        ;
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v26, v37, 16);
    }
    while (v19);
  }

  return v8;
}

- (id)mapAttributionForCoordinate:(id)a3 isGlobal:(BOOL *)a4
{
  double var1;
  double var0;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  long double v15;
  id v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  uint64_t v23;
  id v24;
  id v25;
  _QWORD v27[3];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  var1 = a3.var1;
  var0 = a3.var0;
  v33 = *MEMORY[0x1E0C80C00];
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  +[GEOResourceManifestManager modernManager](GEOResourceManifestManager, "modernManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "activeTileGroup");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "attributions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v10)
  {
    v11 = v10;
    v12 = GEOTilePointForCoordinate(var0, var1, 20.0);
    v14 = v13;
    v15 = GEOMapPointsPerMeterAtLatitude(var0);
    v16 = 0;
    v17 = v12 - v15;
    v18 = v14 - v15;
    v19 = v15 + v15;
    v20 = *(_QWORD *)v29;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v29 != v20)
          objc_enumerationMutation(v9);
        v22 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        if (objc_msgSend(v22, "regionsCount"))
        {
          if (objc_msgSend(v22, "regionsCount"))
          {
            v23 = 0;
            while (1)
            {
              memset(v27, 0, sizeof(v27));
              if (v22)
                objc_msgSend(v22, "regionAtIndex:", v23);
              if (GEOTileSetRegionIntersectsMapRect((unsigned int *)v27, v17, v18, v19, v19))
                break;
              if (++v23 >= (unint64_t)objc_msgSend(v22, "regionsCount"))
                goto LABEL_15;
            }
            if (a4)
              *a4 = 0;
            v25 = v22;

            goto LABEL_25;
          }
        }
        else
        {
          v24 = v22;

          v16 = v24;
        }
LABEL_15:
        ;
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      if (v11)
        continue;
      break;
    }
  }
  else
  {
    v16 = 0;
  }

  if (a4)
    *a4 = 1;
  v16 = v16;
  v25 = v16;
LABEL_25:

  return v25;
}

- (id)mapAttributionURLForCoordinate:(id)a3
{
  double var1;
  double var0;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  const char *v11;
  void *v12;
  char v14;
  uint8_t buf[4];
  double v16;
  __int16 v17;
  double v18;
  __int16 v19;
  double v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  var1 = a3.var1;
  var0 = a3.var0;
  v23 = *MEMORY[0x1E0C80C00];
  v14 = 0;
  -[GEOActiveTileGroup mapAttributionForCoordinate:isGlobal:](self, "mapAttributionForCoordinate:isGlobal:", &v14);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    GEOGetResourceManifestLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 134218240;
      v16 = var0;
      v17 = 2048;
      v18 = var1;
      _os_log_impl(&dword_1885A9000, v10, OS_LOG_TYPE_FAULT, "Attribution for (%f,%f) is nil", buf, 0x16u);
    }
    goto LABEL_10;
  }
  v7 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(v5, "url");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URLWithString:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    GEOGetResourceManifestLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      if (v14)
        v11 = "Global";
      else
        v11 = "Regional";
      objc_msgSend(v6, "url");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315907;
      v16 = *(double *)&v11;
      v17 = 2049;
      v18 = var0;
      v19 = 2049;
      v20 = var1;
      v21 = 2112;
      v22 = v12;
      _os_log_impl(&dword_1885A9000, v10, OS_LOG_TYPE_FAULT, "%s (%{private}f,%{private}f) attribution URL is invalid \"%@\", buf, 0x2Au);

    }
LABEL_10:

    v9 = 0;
  }

  return v9;
}

- (void)iterateActiveTileSets:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int v10;
  int v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  __int16 v17;
  _QWORD v18[5];
  id v19;
  uint64_t *v20;
  uint64_t *v21;
  int v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  int v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  const char *v34;
  int v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v31 = 0;
    v32 = &v31;
    v33 = 0x2810000000;
    v34 = "";
    v35 = 0;
    v27 = 0;
    v28 = &v27;
    v29 = 0x2020000000;
    v30 = 0;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    -[GEOActiveTileGroup tileSets](self, "tileSets");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v36, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v24;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v24 != v7)
            objc_enumerationMutation(v5);
          v9 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v8);
          if (objc_msgSend(v9, "style") == 14
            || objc_msgSend(v9, "style") == 15
            || objc_msgSend(v9, "style") == 16
            || objc_msgSend(v9, "style") == 42
            || objc_msgSend(v9, "style") == 52
            || objc_msgSend(v9, "style") == 43
            || objc_msgSend(v9, "style") == 44)
          {
            v10 = objc_msgSend(v9, "style");
            v18[0] = MEMORY[0x1E0C809B0];
            if (v10 == 14)
              v11 = 4;
            else
              v11 = 3;
            v18[1] = 3221225472;
            v18[2] = __81__GEOActiveTileGroup_GEOResourceManifestManagerAdditions__iterateActiveTileSets___block_invoke;
            v18[3] = &unk_1E1C0AD48;
            v20 = &v31;
            v21 = &v27;
            v18[4] = v9;
            v19 = v4;
            v22 = v11;
            -[GEOActiveTileGroup enumerateFlyoverRegions:](self, "enumerateFlyoverRegions:", v18);

          }
          else
          {
            v12 = GEOTileProviderForStyle(objc_msgSend(v9, "style"));
            v17 = objc_msgSend(v9, "style");
            v16 = objc_msgSend(v9, "scale");
            v13 = objc_msgSend(v9, "size");
            *((_DWORD *)v32 + 8) = ((v17 & 0x3FFF | ((v13 & 0xF) << 14) & 0xFFC3FFFF | ((v16 & 0xF) << 18)) << 8) | 1;
            v14 = objc_msgSend(v9, "version");
            *((_DWORD *)v28 + 6) = v14;
            (*((void (**)(id, void *, _QWORD, _QWORD, uint64_t, uint64_t))v4 + 2))(v4, v9, 0, *((unsigned int *)v32 + 8), v14, v12);
          }
          ++v8;
        }
        while (v6 != v8);
        v15 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v36, 16);
        v6 = v15;
      }
      while (v15);
    }

    _Block_object_dispose(&v27, 8);
    _Block_object_dispose(&v31, 8);
  }

}

uint64_t __81__GEOActiveTileGroup_GEOResourceManifestManagerAdditions__iterateActiveTileSets___block_invoke(uint64_t a1, uint64_t a2)
{
  int v4;

  v4 = *(_DWORD *)(a2 + 4);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32) = (objc_msgSend(*(id *)(a1 + 32), "style") << 8) | (v4 << 16) | 2;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = *(_DWORD *)(a2 + 8);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (id)muninBucketURLForId:(unsigned __int16)a3 lod:(unsigned __int8)a4
{
  unsigned int v4;
  int v5;
  unsigned int v7;
  unint64_t v8;
  __CFString *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v4 = a4;
  v5 = a3;
  if (-[GEOActiveTileGroup muninBucketsCount](self, "muninBucketsCount"))
  {
    v7 = 0;
    v8 = 0;
    v9 = 0;
    do
    {
      -[GEOActiveTileGroup muninBucketAtIndex:](self, "muninBucketAtIndex:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "hasLodLevel")
        && objc_msgSend(v10, "hasBucketID")
        && objc_msgSend(v10, "bucketID") == v5
        && objc_msgSend(v10, "hasBucketURL"))
      {
        if (objc_msgSend(v10, "lodLevel") == v4)
        {
          objc_msgSend(v10, "bucketURL");
          v13 = objc_claimAutoreleasedReturnValue();

          goto LABEL_24;
        }
        if (objc_msgSend(v10, "lodLevel") < v4 && objc_msgSend(v10, "lodLevel") >= v7)
        {
          v7 = objc_msgSend(v10, "lodLevel");
          objc_msgSend(v10, "bucketURL");
          v11 = objc_claimAutoreleasedReturnValue();

          v9 = (__CFString *)v11;
        }
      }

      ++v8;
    }
    while (v8 < -[GEOActiveTileGroup muninBucketsCount](self, "muninBucketsCount"));
    if (v9)
      return v9;
  }
  if (-[GEOActiveTileGroup muninBucketsCount](self, "muninBucketsCount"))
  {
    v12 = 0;
    while (1)
    {
      -[GEOActiveTileGroup muninBucketAtIndex:](self, "muninBucketAtIndex:", v12);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if ((-[__CFString hasLodLevel](v9, "hasLodLevel") & 1) == 0
        && -[__CFString hasBucketID](v9, "hasBucketID")
        && -[__CFString bucketID](v9, "bucketID") == v5
        && -[__CFString hasBucketURL](v9, "hasBucketURL"))
      {
        break;
      }

      if (++v12 >= -[GEOActiveTileGroup muninBucketsCount](self, "muninBucketsCount"))
      {
        v9 = &stru_1E1C241D0;
        return v9;
      }
    }
    -[__CFString bucketURL](v9, "bucketURL");
    v13 = objc_claimAutoreleasedReturnValue();
LABEL_24:

    v9 = (__CFString *)v13;
  }
  else
  {
    v9 = &stru_1E1C241D0;
  }
  return v9;
}

- (id)hashForPurpose:(unint64_t)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  int v17;
  void *v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  CC_MD5_CTX c;
  _QWORD v26[4];
  id v27;
  unsigned __int8 md[16];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (a3)
    return 0;
  objc_getAssociatedObject(self, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E1E85600);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOActiveTileGroup activeResources](self, "activeResources");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __74__GEOActiveTileGroup_GEOResourceManifestManagerAdditions__hashForPurpose___block_invoke;
    v26[3] = &unk_1E1C0AD70;
    v8 = v6;
    v27 = v8;
    objc_msgSend(v7, "_geo_compactMap:", v26);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "mutableCopy");

    objc_msgSend(v10, "sortUsingComparator:", &__block_literal_global_337);
    memset(&c, 0, sizeof(c));
    if (CC_MD5_Init(&c) != 1)
      goto LABEL_16;
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v11 = v10;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v22;
      while (2)
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v22 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v15), "dataUsingEncoding:", 4, (_QWORD)v21);
          v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v17 = CC_MD5_Update(&c, (const void *)objc_msgSend(v16, "bytes"), objc_msgSend(v16, "length"));

          if (v17 != 1)
          {

            goto LABEL_16;
          }
          ++v15;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
        if (v13)
          continue;
        break;
      }
    }

    if (CC_MD5_Final(md, &c) == 1)
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", md, 16, 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "_geo_hexString");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_setAssociatedObject(self, 0, v19, (void *)1);
      v5 = v19;

    }
    else
    {
LABEL_16:
      v5 = 0;
    }

  }
  return v5;
}

id __74__GEOActiveTileGroup_GEOResourceManifestManagerAdditions__hashForPurpose___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a2, "filename");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pathExtension");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "length");
  if (v5)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "containsObject:", v4))
      v5 = v3;
    else
      v5 = 0;
  }
  v6 = v5;

  return v6;
}

uint64_t __74__GEOActiveTileGroup_GEOResourceManifestManagerAdditions__hashForPurpose___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (void)populateRegionalResources:(void *)a1
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  unint64_t v12;
  void *v13;
  GEORegionalResourceSet *v14;
  void *v15;
  id v16;
  _QWORD v17[3];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v16 = v3;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v19 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          if (objc_msgSend(v10, "regionsCount"))
          {
            v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            if (objc_msgSend(v10, "regionsCount"))
            {
              v12 = 0;
              do
              {
                memset(v17, 0, sizeof(v17));
                if (v10)
                  objc_msgSend(v10, "regionAtIndex:", v12);
                v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", v17, 24);
                objc_msgSend(v11, "addObject:", v13);

                ++v12;
              }
              while (v12 < objc_msgSend(v10, "regionsCount"));
            }
            objc_msgSend(v4, "objectForKey:", v11);
            v14 = (GEORegionalResourceSet *)objc_claimAutoreleasedReturnValue();
            if (!v14)
            {
              v14 = objc_alloc_init(GEORegionalResourceSet);
              -[GEORegionalResourceSet setRegions:count:](v14, "setRegions:count:", objc_msgSend(v10, "regions"), objc_msgSend(v10, "regionsCount"));
              objc_msgSend(v4, "setObject:forKey:", v14, v11);
              objc_msgSend(a1, "addRegionalResource:", v14);
            }
            v15 = (void *)objc_msgSend(v10, "copy");
            objc_msgSend(v15, "clearRegions");
            -[GEORegionalResourceSet addResource:](v14, "addResource:", v15);

          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v7);
    }

    v3 = v16;
  }

}

- (void)populateLegacyFormat
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  int v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  int v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  int v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  int v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  int v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  int v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  int v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  int v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  int v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  int v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  int v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  int v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  int v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  int v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  int v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  int v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  int v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  int v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  int v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  int v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  int v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  int v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  int v173;
  void *v174;
  void *v175;
  id v176;

  -[GEOActiveTileGroup urlInfoSet](self, "urlInfoSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resourcesURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hasUrl");

  if (v5)
  {
    -[GEOActiveTileGroup urlInfoSet](self, "urlInfoSet");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "resourcesURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "url");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOActiveTileGroup setRegionalResourcesURLLegacy:](self, "setRegionalResourcesURLLegacy:", v8);

  }
  -[GEOActiveTileGroup urlInfoSet](self, "urlInfoSet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "searchAttributionManifestURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hasUrl");

  if (v11)
  {
    -[GEOActiveTileGroup urlInfoSet](self, "urlInfoSet");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "searchAttributionManifestURL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "url");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOActiveTileGroup setSearchAttributionManifestURLLegacy:](self, "setSearchAttributionManifestURLLegacy:", v14);

  }
  -[GEOActiveTileGroup urlInfoSet](self, "urlInfoSet");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "directionsURL");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "hasUrl");

  if (v17)
  {
    -[GEOActiveTileGroup urlInfoSet](self, "urlInfoSet");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "directionsURL");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "url");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOActiveTileGroup setDirectionsURLLegacy:](self, "setDirectionsURLLegacy:", v20);

  }
  -[GEOActiveTileGroup urlInfoSet](self, "urlInfoSet");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "etaURL");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "hasUrl");

  if (v23)
  {
    -[GEOActiveTileGroup urlInfoSet](self, "urlInfoSet");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "etaURL");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "url");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOActiveTileGroup setEtaURLLegacy:](self, "setEtaURLLegacy:", v26);

  }
  -[GEOActiveTileGroup urlInfoSet](self, "urlInfoSet");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "batchReverseGeocoderURL");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "hasUrl");

  if (v29)
  {
    -[GEOActiveTileGroup urlInfoSet](self, "urlInfoSet");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "batchReverseGeocoderURL");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "url");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOActiveTileGroup setBatchReverseGeocoderURLLegacy:](self, "setBatchReverseGeocoderURLLegacy:", v32);

  }
  -[GEOActiveTileGroup urlInfoSet](self, "urlInfoSet");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "resourcesURL");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "hasUrl");

  if (v35)
  {
    -[GEOActiveTileGroup urlInfoSet](self, "urlInfoSet");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "resourcesURL");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "url");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOActiveTileGroup setResourcesURLLegacy:](self, "setResourcesURLLegacy:", v38);

  }
  -[GEOActiveTileGroup urlInfoSet](self, "urlInfoSet");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "simpleETAURL");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v40, "hasUrl");

  if (v41)
  {
    -[GEOActiveTileGroup urlInfoSet](self, "urlInfoSet");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "simpleETAURL");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "url");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOActiveTileGroup setSimpleETAURLLegacy:](self, "setSimpleETAURLLegacy:", v44);

  }
  -[GEOActiveTileGroup urlInfoSet](self, "urlInfoSet");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "addressCorrectionInitURL");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = objc_msgSend(v46, "hasUrl");

  if (v47)
  {
    -[GEOActiveTileGroup urlInfoSet](self, "urlInfoSet");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "addressCorrectionInitURL");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "url");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOActiveTileGroup setAddressCorrectionInitURLLegacy:](self, "setAddressCorrectionInitURLLegacy:", v50);

  }
  -[GEOActiveTileGroup urlInfoSet](self, "urlInfoSet");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "addressCorrectionUpdateURL");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = objc_msgSend(v52, "hasUrl");

  if (v53)
  {
    -[GEOActiveTileGroup urlInfoSet](self, "urlInfoSet");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "addressCorrectionUpdateURL");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "url");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOActiveTileGroup setAddressCorrectionUpdateURLLegacy:](self, "setAddressCorrectionUpdateURLLegacy:", v56);

  }
  -[GEOActiveTileGroup urlInfoSet](self, "urlInfoSet");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "polyLocationShiftURL");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = objc_msgSend(v58, "hasUrl");

  if (v59)
  {
    -[GEOActiveTileGroup urlInfoSet](self, "urlInfoSet");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "polyLocationShiftURL");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "url");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOActiveTileGroup setPolyLocationShiftURLLegacy:](self, "setPolyLocationShiftURLLegacy:", v62);

  }
  -[GEOActiveTileGroup urlInfoSet](self, "urlInfoSet");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "problemSubmissionURL");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = objc_msgSend(v64, "hasUrl");

  if (v65)
  {
    -[GEOActiveTileGroup urlInfoSet](self, "urlInfoSet");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "problemSubmissionURL");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "url");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOActiveTileGroup setProblemSubmissionURLLegacy:](self, "setProblemSubmissionURLLegacy:", v68);

  }
  -[GEOActiveTileGroup urlInfoSet](self, "urlInfoSet");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "problemStatusURL");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = objc_msgSend(v70, "hasUrl");

  if (v71)
  {
    -[GEOActiveTileGroup urlInfoSet](self, "urlInfoSet");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "problemStatusURL");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "url");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOActiveTileGroup setProblemStatusURLLegacy:](self, "setProblemStatusURLLegacy:", v74);

  }
  -[GEOActiveTileGroup urlInfoSet](self, "urlInfoSet");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "reverseGeocoderVersionsURL");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v77 = objc_msgSend(v76, "hasUrl");

  if (v77)
  {
    -[GEOActiveTileGroup urlInfoSet](self, "urlInfoSet");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "reverseGeocoderVersionsURL");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "url");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOActiveTileGroup setReverseGeocoderVersionsURLLegacy:](self, "setReverseGeocoderVersionsURLLegacy:", v80);

  }
  -[GEOActiveTileGroup urlInfoSet](self, "urlInfoSet");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "problemCategoriesURL");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v83 = objc_msgSend(v82, "hasUrl");

  if (v83)
  {
    -[GEOActiveTileGroup urlInfoSet](self, "urlInfoSet");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "problemCategoriesURL");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "url");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOActiveTileGroup setProblemCategoriesURLLegacy:](self, "setProblemCategoriesURLLegacy:", v86);

  }
  -[GEOActiveTileGroup urlInfoSet](self, "urlInfoSet");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "announcementsURL");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v89 = objc_msgSend(v88, "hasUrl");

  if (v89)
  {
    -[GEOActiveTileGroup urlInfoSet](self, "urlInfoSet");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "announcementsURL");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "url");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOActiveTileGroup setAnnouncementsURLLegacy:](self, "setAnnouncementsURLLegacy:", v92);

  }
  -[GEOActiveTileGroup urlInfoSet](self, "urlInfoSet");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "dispatcherURL");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  v95 = objc_msgSend(v94, "hasUrl");

  if (v95)
  {
    -[GEOActiveTileGroup urlInfoSet](self, "urlInfoSet");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v96, "dispatcherURL");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v97, "url");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOActiveTileGroup setDispatcherURLLegacy:](self, "setDispatcherURLLegacy:", v98);

  }
  -[GEOActiveTileGroup urlInfoSet](self, "urlInfoSet");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v99, "problemOptInURL");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  v101 = objc_msgSend(v100, "hasUrl");

  if (v101)
  {
    -[GEOActiveTileGroup urlInfoSet](self, "urlInfoSet");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v102, "problemOptInURL");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v103, "url");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOActiveTileGroup setProblemOptInURLLegacy:](self, "setProblemOptInURLLegacy:", v104);

  }
  -[GEOActiveTileGroup urlInfoSet](self, "urlInfoSet");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v105, "abExperimentURL");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  v107 = objc_msgSend(v106, "hasUrl");

  if (v107)
  {
    -[GEOActiveTileGroup urlInfoSet](self, "urlInfoSet");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v108, "abExperimentURL");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v109, "url");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOActiveTileGroup setAbExperimentURLLegacy:](self, "setAbExperimentURLLegacy:", v110);

  }
  -[GEOActiveTileGroup urlInfoSet](self, "urlInfoSet");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v111, "businessPortalBaseURL");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  v113 = objc_msgSend(v112, "hasUrl");

  if (v113)
  {
    -[GEOActiveTileGroup urlInfoSet](self, "urlInfoSet");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v114, "businessPortalBaseURL");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v115, "url");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOActiveTileGroup setBusinessPortalBaseURLLegacy:](self, "setBusinessPortalBaseURLLegacy:", v116);

  }
  -[GEOActiveTileGroup urlInfoSet](self, "urlInfoSet");
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v117, "logMessageUsageURL");
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  v119 = objc_msgSend(v118, "hasUrl");

  if (v119)
  {
    -[GEOActiveTileGroup urlInfoSet](self, "urlInfoSet");
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v120, "logMessageUsageURL");
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v121, "url");
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOActiveTileGroup setLogMessageUsageURLLegacy:](self, "setLogMessageUsageURLLegacy:", v122);

  }
  -[GEOActiveTileGroup urlInfoSet](self, "urlInfoSet");
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v123, "spatialLookupURL");
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  v125 = objc_msgSend(v124, "hasUrl");

  if (v125)
  {
    -[GEOActiveTileGroup urlInfoSet](self, "urlInfoSet");
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v126, "spatialLookupURL");
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v127, "url");
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOActiveTileGroup setSpatialLookupURLLegacy:](self, "setSpatialLookupURLLegacy:", v128);

  }
  -[GEOActiveTileGroup urlInfoSet](self, "urlInfoSet");
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v129, "realtimeTrafficProbeURL");
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  v131 = objc_msgSend(v130, "hasUrl");

  if (v131)
  {
    -[GEOActiveTileGroup urlInfoSet](self, "urlInfoSet");
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v132, "realtimeTrafficProbeURL");
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v133, "url");
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOActiveTileGroup setRealtimeTrafficProbeURLLegacy:](self, "setRealtimeTrafficProbeURLLegacy:", v134);

  }
  -[GEOActiveTileGroup urlInfoSet](self, "urlInfoSet");
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v135, "batchTrafficProbeURL");
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  v137 = objc_msgSend(v136, "hasUrl");

  if (v137)
  {
    -[GEOActiveTileGroup urlInfoSet](self, "urlInfoSet");
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v138, "batchTrafficProbeURL");
    v139 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v139, "url");
    v140 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOActiveTileGroup setBatchTrafficProbeURLLegacy:](self, "setBatchTrafficProbeURLLegacy:", v140);

  }
  -[GEOActiveTileGroup urlInfoSet](self, "urlInfoSet");
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v141, "logMessageUsageV3URL");
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  v143 = objc_msgSend(v142, "hasUrl");

  if (v143)
  {
    -[GEOActiveTileGroup urlInfoSet](self, "urlInfoSet");
    v144 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v144, "logMessageUsageV3URL");
    v145 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v145, "url");
    v146 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOActiveTileGroup setLogMessageUsageV3URLLegacy:](self, "setLogMessageUsageV3URLLegacy:", v146);

  }
  -[GEOActiveTileGroup urlInfoSet](self, "urlInfoSet");
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v147, "proactiveRoutingURL");
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  v149 = objc_msgSend(v148, "hasUrl");

  if (v149)
  {
    -[GEOActiveTileGroup urlInfoSet](self, "urlInfoSet");
    v150 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v150, "proactiveRoutingURL");
    v151 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v151, "url");
    v152 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOActiveTileGroup setProactiveRoutingURLLegacy:](self, "setProactiveRoutingURLLegacy:", v152);

  }
  -[GEOActiveTileGroup urlInfoSet](self, "urlInfoSet");
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v153, "backgroundDispatcherURL");
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  v155 = objc_msgSend(v154, "hasUrl");

  if (v155)
  {
    -[GEOActiveTileGroup urlInfoSet](self, "urlInfoSet");
    v156 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v156, "backgroundDispatcherURL");
    v157 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v157, "url");
    v158 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOActiveTileGroup setBackgroundDispatcherURLLegacy:](self, "setBackgroundDispatcherURLLegacy:", v158);

  }
  -[GEOActiveTileGroup urlInfoSet](self, "urlInfoSet");
  v159 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v159, "bluePOIDispatcherURL");
  v160 = (void *)objc_claimAutoreleasedReturnValue();
  v161 = objc_msgSend(v160, "hasUrl");

  if (v161)
  {
    -[GEOActiveTileGroup urlInfoSet](self, "urlInfoSet");
    v162 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v162, "bluePOIDispatcherURL");
    v163 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v163, "url");
    v164 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOActiveTileGroup setBluePOIURLLegacy:](self, "setBluePOIURLLegacy:", v164);

  }
  -[GEOActiveTileGroup urlInfoSet](self, "urlInfoSet");
  v165 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v165, "backgroundRevGeoURL");
  v166 = (void *)objc_claimAutoreleasedReturnValue();
  v167 = objc_msgSend(v166, "hasUrl");

  if (v167)
  {
    -[GEOActiveTileGroup urlInfoSet](self, "urlInfoSet");
    v168 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v168, "backgroundRevGeoURL");
    v169 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v169, "url");
    v170 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOActiveTileGroup setBackgroundRevGeoURLLegacy:](self, "setBackgroundRevGeoURLLegacy:", v170);

  }
  -[GEOActiveTileGroup urlInfoSet](self, "urlInfoSet");
  v171 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v171, "wifiConnectionQualityProbeURL");
  v172 = (void *)objc_claimAutoreleasedReturnValue();
  v173 = objc_msgSend(v172, "hasUrl");

  if (v173)
  {
    -[GEOActiveTileGroup urlInfoSet](self, "urlInfoSet");
    v176 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v176, "wifiConnectionQualityProbeURL");
    v174 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v174, "url");
    v175 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOActiveTileGroup setWifiConnectionQualityProbeURLLegacy:](self, "setWifiConnectionQualityProbeURLLegacy:", v175);

  }
}

- (void)clearModernFormatFields
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[GEOActiveTileGroup attributions](self, "attributions", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v9, "regionsCount"))
          objc_msgSend(v3, "addObject:", v9);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  -[GEOActiveTileGroup attributions](self, "attributions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeObjectsInArray:", v3);

  -[GEOActiveTileGroup clearActiveResources](self, "clearActiveResources");
  -[GEOActiveTileGroup clearStaleResources](self, "clearStaleResources");
  -[GEOActiveTileGroup clearRegionalResources](self, "clearRegionalResources");

}

@end
