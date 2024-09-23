@implementation GEOLocalizationRegionsInfo

- (GEOLocalizationRegionsInfo)init
{
  GEOLocalizationRegionsInfo *v2;
  GEOLocalizationRegionsInfo *v3;
  GEOLocalizationRegionsInfo *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOLocalizationRegionsInfo;
  v2 = -[GEOLocalizationRegionsInfo init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_regionsLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (void)reset
{
  os_unfair_lock_s *p_regionsLock;
  NSDictionary *regions;

  p_regionsLock = &self->_regionsLock;
  os_unfair_lock_lock_with_options();
  regions = self->_regions;
  self->_regions = 0;

  os_unfair_lock_unlock(p_regionsLock);
}

- (uint64_t)needsLocalizationForKey:(uint64_t)a3 language:(void *)a4
{
  id v6;
  os_unfair_lock_s *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v34;
  id v35;
  unsigned int v36[6];
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = (os_unfair_lock_s *)(a1 + 16);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
  v8 = *(void **)(a1 + 8);
  if (!v8)
  {
    +[GEOResourceManager sharedManager](GEOResourceManager, "sharedManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "__geoBundle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "pathForResourceWithName:fallbackBundle:", CFSTR("localizationRegions.plist"), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v11, "length"))
    {
      v12 = objc_alloc(MEMORY[0x1E0C99D80]);
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v12, "initWithContentsOfURL:error:", v13, 0);
      v15 = *(void **)(a1 + 8);
      *(_QWORD *)(a1 + 8) = v14;

    }
    if (!*(_QWORD *)(a1 + 8))
    {
      v16 = objc_alloc_init(MEMORY[0x1E0C99D80]);
      v17 = *(void **)(a1 + 8);
      *(_QWORD *)(a1 + 8) = v16;

    }
    v8 = *(void **)(a1 + 8);
  }
  v18 = v8;
  os_unfair_lock_unlock(v7);
  objc_msgSend(v18, "objectForKey:", v6);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v20 = v19;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
    if (v21)
    {
      v22 = v21;
      v34 = v19;
      v35 = v18;
      v23 = *(_QWORD *)v38;
      while (2)
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v38 != v23)
            objc_enumerationMutation(v20);
          v25 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v26 = v25;
            objc_msgSend(v26, "objectForKey:", CFSTR("minX"));
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v36[3] = objc_msgSend(v27, "unsignedIntValue");

            objc_msgSend(v26, "objectForKey:", CFSTR("maxX"));
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v36[0] = objc_msgSend(v28, "unsignedIntValue");

            objc_msgSend(v26, "objectForKey:", CFSTR("minY"));
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v36[4] = objc_msgSend(v29, "unsignedIntValue");

            objc_msgSend(v26, "objectForKey:", CFSTR("maxY"));
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v36[1] = objc_msgSend(v30, "unsignedIntValue");

            objc_msgSend(v26, "objectForKey:", CFSTR("z"));
            v31 = (void *)objc_claimAutoreleasedReturnValue();

            v36[5] = objc_msgSend(v31, "unsignedIntValue");
            v36[2] = -1;
            if (GEOTileSetRegionContainsTileKey(v36, a3))
            {
              v32 = 0;
              goto LABEL_20;
            }
          }
        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
        if (v22)
          continue;
        break;
      }
      v32 = 1;
LABEL_20:
      v18 = v35;
      v19 = v34;
    }
    else
    {
      v32 = 1;
    }

  }
  else
  {
    v32 = 1;
  }

  return v32;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_regions, 0);
}

@end
