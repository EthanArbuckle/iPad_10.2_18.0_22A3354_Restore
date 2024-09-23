@implementation GEOResourceFiltersManager

- (void)activateScale:(int)a3
{
  uint64_t v3;
  NSObject *v5;
  __CFString *v6;
  NSObject *v7;
  void *v8;
  id WeakRetained;
  _QWORD v10[4];
  int v11;
  _QWORD v12[4];
  int v13;
  uint8_t buf[4];
  __CFString *v15;
  uint64_t v16;

  v3 = *(_QWORD *)&a3;
  v16 = *MEMORY[0x1E0C80C00];
  GEOFindOrCreateLog("com.apple.GeoServices", "ResourceManifest");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    if (v3 >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v3);
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = off_1E1C072F0[(int)v3];
    }
    *(_DWORD *)buf = 138477827;
    v15 = v6;
    _os_log_impl(&dword_1885A9000, v5, OS_LOG_TYPE_DEBUG, "Asked to activate scale '%{private}@'", buf, 0xCu);

  }
  if (-[GEOResourceManifestConfiguration defaultScale](self->_configuration, "defaultScale") == (_DWORD)v3)
  {
    GEOFindOrCreateLog("com.apple.GeoServices", "ResourceManifest");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1885A9000, v7, OS_LOG_TYPE_DEBUG, "Not bothering to formally activate this scale, since it is the device's main screen scale", buf, 2u);
    }
  }
  else
  {
    -[GEOResourceFiltersManager activeScales](self, "activeScales");
    v7 = objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __43__GEOResourceFiltersManager_activateScale___block_invoke;
    v12[3] = &__block_descriptor_36_e33_B16__0__GEOActiveResourceFilter_8l;
    v13 = v3;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __43__GEOResourceFiltersManager_activateScale___block_invoke_2;
    v10[3] = &__block_descriptor_36_e33_v16__0__GEOActiveResourceFilter_8l;
    v11 = v3;
    -[GEOResourceFiltersManager _activateFilters:setValueBlock:](self, "_activateFilters:setValueBlock:", v12, v10);
    -[GEOResourceFiltersManager activeScales](self, "activeScales");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "isEqualToSet:", v7) & 1) == 0)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "filtersManagerDidChangeActiveFilters:", self);

    }
  }

}

- (NSSet)activeScenarios
{
  void *v4;
  os_unfair_lock_s *p_lock;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (GEOConfigGetBOOL(GeoServicesConfig_ActivateAllResourceFilters, (uint64_t)off_1EDF4D528))
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E1E855A0);
    return (NSSet *)(id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    p_lock = &self->_lock;
    os_unfair_lock_lock_with_options();
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    -[GEOActiveResourceFilters filters](self->_activeFilters, "filters", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
          if (objc_msgSend(v11, "whichFilter") == 2 && (objc_msgSend(v11, "_isFilterStaleThresholdExpired") & 1) == 0)
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v11, "scenario"));
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "addObject:", v12);

          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }

    os_unfair_lock_unlock(p_lock);
    objc_msgSend(v4, "addObject:", &unk_1E1E80FE0);
    return (NSSet *)v4;
  }
}

- (NSSet)activeScales
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (GEOConfigGetBOOL(GeoServicesConfig_ActivateAllResourceFilters, (uint64_t)off_1EDF4D528))
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E1E85588);
    return (NSSet *)(id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_lock_with_options();
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    -[GEOActiveResourceFilters filters](self->_activeFilters, "filters", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
          if (objc_msgSend(v10, "whichFilter") == 1 && (objc_msgSend(v10, "_isFilterStaleThresholdExpired") & 1) == 0)
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v10, "scale"));
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "addObject:", v11);

          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v7);
    }

    os_unfair_lock_unlock(&self->_lock);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[GEOResourceManifestConfiguration defaultScale](self->_configuration, "defaultScale"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v12);

    return (NSSet *)v4;
  }
}

- (GEOResourceFiltersManager)init
{
  GEOResourceFiltersManager *result;

  result = (GEOResourceFiltersManager *)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GEOMethodNotAvailableException"), CFSTR("This method is unavailable."));
  __break(1u);
  return result;
}

- (GEOResourceFiltersManager)initWithConfiguration:(id)a3
{
  GEOResourceManifestConfiguration *v4;
  GEOResourceFiltersManager *v5;
  void *v6;
  void *v7;
  GEOActiveResourceFilters *v8;
  GEOActiveResourceFilters *activeFilters;
  GEOActiveResourceFilters *v10;
  GEOActiveResourceFilters *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  GEOResourceFiltersManager *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  objc_super v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = (GEOResourceManifestConfiguration *)a3;
  v26.receiver = self;
  v26.super_class = (Class)GEOResourceFiltersManager;
  v5 = -[GEOResourceFiltersManager init](&v26, sel_init);
  if (v5)
  {
    if (!v4)
      v4 = objc_alloc_init(GEOResourceManifestConfiguration);
    objc_storeStrong((id *)&v5->_configuration, v4);
    v5->_lock._os_unfair_lock_opaque = 0;
    GEOActiveResourceFiltersPath(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "length"))
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        v8 = -[GEOActiveResourceFilters initWithData:]([GEOActiveResourceFilters alloc], "initWithData:", v7);
        activeFilters = v5->_activeFilters;
        v5->_activeFilters = v8;

      }
    }
    if (!v5->_activeFilters)
    {
      v10 = objc_alloc_init(GEOActiveResourceFilters);
      v11 = v5->_activeFilters;
      v5->_activeFilters = v10;

    }
    _getValue(GeoServicesConfig_ExplicitResourceFilters, (uint64_t)off_1EDF4CD58, 1, 0, 0, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOResourceFiltersManager activeNames](v5, "activeNames");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v12, "isEqual:", v13) & 1) == 0)
    {
      v14 = (void *)objc_msgSend(v12, "mutableCopy");
      objc_msgSend(v14, "minusSet:", v13);
      v24 = 0u;
      v25 = 0u;
      v22 = 0u;
      v23 = 0u;
      v15 = v14;
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v23;
        do
        {
          v19 = 0;
          do
          {
            if (*(_QWORD *)v23 != v18)
              objc_enumerationMutation(v15);
            -[GEOResourceFiltersManager activateName:](v5, "activateName:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v19++), (_QWORD)v22);
          }
          while (v17 != v19);
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
        }
        while (v17);
      }

    }
    -[GEOResourceFiltersManager _cleanUpOrphanedEmptyFiltersIfNecessary](v5, "_cleanUpOrphanedEmptyFiltersIfNecessary", (_QWORD)v22);
    v20 = v5;

  }
  return v5;
}

- (void)_cleanUpOrphanedEmptyFiltersIfNecessary
{
  os_unfair_lock_s *p_lock;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[GEOActiveResourceFilters filters](self->_activeFilters, "filters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v20 != v7)
          objc_enumerationMutation(v4);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "whichFilter"))
        {

          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = 0u;
          v16 = 0u;
          v17 = 0u;
          v18 = 0u;
          -[GEOActiveResourceFilters filters](self->_activeFilters, "filters", 0);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
          if (v10)
          {
            v11 = v10;
            v12 = *(_QWORD *)v16;
            do
            {
              for (j = 0; j != v11; ++j)
              {
                if (*(_QWORD *)v16 != v12)
                  objc_enumerationMutation(v9);
                v14 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * j);
                if (objc_msgSend(v14, "whichFilter"))
                  objc_msgSend(v4, "addObject:", v14);
              }
              v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
            }
            while (v11);
          }

          -[GEOActiveResourceFilters setFilters:](self->_activeFilters, "setFilters:", v4);
          -[GEOResourceFiltersManager _writeToDisk](self, "_writeToDisk");
          goto LABEL_20;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_20:

  os_unfair_lock_unlock(p_lock);
}

- (NSSet)activeNames
{
  void *v3;
  os_unfair_lock_s *p_lock;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[GEOActiveResourceFilters filters](self->_activeFilters, "filters", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v10, "whichFilter") == 3 && (objc_msgSend(v10, "_isFilterStaleThresholdExpired") & 1) == 0)
        {
          objc_msgSend(v10, "name");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v11);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  os_unfair_lock_unlock(p_lock);
  return (NSSet *)v3;
}

- (void)_writeToDisk
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  char v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  id v20;
  id v21;
  id v22;
  char v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  NSObject *v27;
  _QWORD v28[2];
  _QWORD v29[2];
  uint64_t v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  GEOActiveResourceFiltersPath(self->_configuration);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByDeletingLastPathComponent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  if (objc_msgSend(v5, "fileExistsAtPath:isDirectory:", v4, &v23))
    v6 = v23 == 0;
  else
    v6 = 1;
  if (v6)
  {
    v30 = *MEMORY[0x1E0CB2AA8];
    v31[0] = &unk_1E1E81028;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, &v30, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v4, 1, v7, 0);

  }
  -[GEOActiveResourceFilters data](self->_activeFilters, "data");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  v9 = objc_msgSend(v8, "writeToFile:options:error:", v3, 268435457, &v22);
  v10 = v22;

  if (v9)
  {
    v21 = 0;
    objc_msgSend(v5, "attributesOfItemAtPath:error:", v3, &v21);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v21;
    if (v12)
    {
      v13 = v12;
    }
    else
    {
      v14 = *MEMORY[0x1E0CB2AA8];
      objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2AA8]);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "isEqualToNumber:", &unk_1E1E81040);

      if ((v16 & 1) == 0)
      {
        v18 = *MEMORY[0x1E0CB2AE0];
        v28[0] = *MEMORY[0x1E0CB2AD8];
        v28[1] = v14;
        v29[0] = v18;
        v29[1] = &unk_1E1E81040;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 2);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        v20 = 0;
        objc_msgSend(v5, "setAttributes:ofItemAtPath:error:", v17, v3, &v20);
        v13 = v20;
        if (v13)
        {
          GEOFindOrCreateLog("com.apple.GeoServices", "ResourceManifest");
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138478083;
            v25 = v3;
            v26 = 2113;
            v27 = v13;
            _os_log_impl(&dword_1885A9000, v19, OS_LOG_TYPE_DEBUG, "Couldn't set permissions for active resource filters %{private}@\n%{private}@", buf, 0x16u);
          }

        }
        goto LABEL_15;
      }
      v13 = 0;
    }
    v17 = v11;
LABEL_15:

    goto LABEL_16;
  }
  GEOFindOrCreateLog("com.apple.GeoServices", "ResourceManifest");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v25 = v10;
    _os_log_impl(&dword_1885A9000, v13, OS_LOG_TYPE_ERROR, "Couldn't write active resource filters to disk: %{public}@", buf, 0xCu);
  }
LABEL_16:

}

- (void)_activateFilters:(id)a3 setValueBlock:(id)a4
{
  unsigned int (**v6)(id, void *);
  id v7;
  void (**v8)(_QWORD, _QWORD);
  double Current;
  GEOActiveResourceFilter *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = (unsigned int (**)(id, void *))a3;
  v7 = a4;
  v8 = (void (**)(_QWORD, _QWORD))v7;
  if (v6 && v7)
  {
    Current = CFAbsoluteTimeGetCurrent();
    os_unfair_lock_lock(&self->_lock);
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    -[GEOActiveResourceFilters filters](self->_activeFilters, "filters", 0);
    v10 = (GEOActiveResourceFilter *)objc_claimAutoreleasedReturnValue();
    v11 = -[GEOActiveResourceFilter countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v17;
      while (2)
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v17 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          if (v6[2](v6, v15))
          {
            objc_msgSend(v15, "setLastTimestamp:", Current);
            goto LABEL_13;
          }
        }
        v12 = -[GEOActiveResourceFilter countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v12)
          continue;
        break;
      }
    }

    v10 = objc_alloc_init(GEOActiveResourceFilter);
    -[GEOActiveResourceFilter setLastTimestamp:](v10, "setLastTimestamp:", Current);
    ((void (**)(_QWORD, GEOActiveResourceFilter *))v8)[2](v8, v10);
    -[GEOActiveResourceFilters addFilter:](self->_activeFilters, "addFilter:", v10);
LABEL_13:

    -[GEOResourceFiltersManager _writeToDisk](self, "_writeToDisk");
    os_unfair_lock_unlock(&self->_lock);
  }

}

- (void)_deactivateFilters:(id)a3
{
  uint64_t (**v4)(id, _QWORD);
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  GEOActiveResourceFilters *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  uint64_t v16;
  GEOActiveResourceFilters *activeFilters;
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
  v4 = (uint64_t (**)(id, _QWORD))a3;
  if (v4)
  {
    os_unfair_lock_lock(&self->_lock);
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    -[GEOActiveResourceFilters filters](self->_activeFilters, "filters");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v23;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v23 != v8)
            objc_enumerationMutation(v5);
          if ((v4[2](v4, *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i)) & 1) != 0)
          {

            if (-[GEOActiveResourceFilters filtersCount](self->_activeFilters, "filtersCount") == 1)
            {
              -[GEOActiveResourceFilters clearFilters](self->_activeFilters, "clearFilters");
            }
            else
            {
              v10 = objc_alloc_init(GEOActiveResourceFilters);
              v18 = 0u;
              v19 = 0u;
              v20 = 0u;
              v21 = 0u;
              -[GEOActiveResourceFilters filters](self->_activeFilters, "filters", 0);
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
              if (v12)
              {
                v13 = v12;
                v14 = *(_QWORD *)v19;
                do
                {
                  for (j = 0; j != v13; ++j)
                  {
                    if (*(_QWORD *)v19 != v14)
                      objc_enumerationMutation(v11);
                    v16 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * j);
                    if ((v4[2](v4, v16) & 1) == 0)
                      -[GEOActiveResourceFilters addFilter:](v10, "addFilter:", v16);
                  }
                  v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
                }
                while (v13);
              }

              activeFilters = self->_activeFilters;
              self->_activeFilters = v10;

            }
            goto LABEL_23;
          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
        if (v7)
          continue;
        break;
      }
    }

LABEL_23:
    -[GEOResourceFiltersManager _writeToDisk](self, "_writeToDisk");
    os_unfair_lock_unlock(&self->_lock);
  }

}

BOOL __43__GEOResourceFiltersManager_activateScale___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _BOOL8 v4;

  v3 = a2;
  v4 = objc_msgSend(v3, "whichFilter") == 1 && objc_msgSend(v3, "scale") == *(_DWORD *)(a1 + 32);

  return v4;
}

uint64_t __43__GEOResourceFiltersManager_activateScale___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setScale:", *(unsigned int *)(a1 + 32));
}

- (void)deactivateScale:(int)a3
{
  uint64_t v3;
  NSObject *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  id WeakRetained;
  _QWORD v10[4];
  int v11;
  uint8_t buf[4];
  __CFString *v13;
  uint64_t v14;

  v3 = *(_QWORD *)&a3;
  v14 = *MEMORY[0x1E0C80C00];
  GEOFindOrCreateLog("com.apple.GeoServices", "ResourceManifest");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    if (v3 >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v3);
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = off_1E1C072F0[(int)v3];
    }
    *(_DWORD *)buf = 138477827;
    v13 = v6;
    _os_log_impl(&dword_1885A9000, v5, OS_LOG_TYPE_DEBUG, "Asked to deactivate scale '%{private}@'", buf, 0xCu);

  }
  -[GEOResourceFiltersManager activeScales](self, "activeScales");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __45__GEOResourceFiltersManager_deactivateScale___block_invoke;
  v10[3] = &__block_descriptor_36_e33_B16__0__GEOActiveResourceFilter_8l;
  v11 = v3;
  -[GEOResourceFiltersManager _deactivateFilters:](self, "_deactivateFilters:", v10);
  -[GEOResourceFiltersManager activeScales](self, "activeScales");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "isEqualToSet:", v7) & 1) == 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "filtersManagerDidChangeActiveFilters:", self);

  }
}

BOOL __45__GEOResourceFiltersManager_deactivateScale___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _BOOL8 v4;

  v3 = a2;
  v4 = objc_msgSend(v3, "whichFilter") == 1 && objc_msgSend(v3, "scale") == *(_DWORD *)(a1 + 32);

  return v4;
}

- (void)activateScenario:(int)a3
{
  uint64_t v3;
  NSObject *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  id WeakRetained;
  _QWORD v10[4];
  int v11;
  _QWORD v12[4];
  int v13;
  uint8_t buf[4];
  __CFString *v15;
  uint64_t v16;

  v3 = *(_QWORD *)&a3;
  v16 = *MEMORY[0x1E0C80C00];
  GEOFindOrCreateLog("com.apple.GeoServices", "ResourceManifest");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    if (v3 >= 5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v3);
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = off_1E1C07310[(int)v3];
    }
    *(_DWORD *)buf = 138477827;
    v15 = v6;
    _os_log_impl(&dword_1885A9000, v5, OS_LOG_TYPE_DEBUG, "Asked to activate scenario '%{private}@'", buf, 0xCu);

  }
  -[GEOResourceFiltersManager activeScenarios](self, "activeScenarios");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __46__GEOResourceFiltersManager_activateScenario___block_invoke;
  v12[3] = &__block_descriptor_36_e33_B16__0__GEOActiveResourceFilter_8l;
  v13 = v3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __46__GEOResourceFiltersManager_activateScenario___block_invoke_2;
  v10[3] = &__block_descriptor_36_e33_v16__0__GEOActiveResourceFilter_8l;
  v11 = v3;
  -[GEOResourceFiltersManager _activateFilters:setValueBlock:](self, "_activateFilters:setValueBlock:", v12, v10);
  -[GEOResourceFiltersManager activeScenarios](self, "activeScenarios");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "isEqualToSet:", v7) & 1) == 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "filtersManagerDidChangeActiveFilters:", self);

  }
}

BOOL __46__GEOResourceFiltersManager_activateScenario___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _BOOL8 v4;

  v3 = a2;
  v4 = objc_msgSend(v3, "whichFilter") == 2 && objc_msgSend(v3, "scenario") == *(_DWORD *)(a1 + 32);

  return v4;
}

uint64_t __46__GEOResourceFiltersManager_activateScenario___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setScenario:", *(unsigned int *)(a1 + 32));
}

- (void)deactivateScenario:(int)a3
{
  uint64_t v3;
  NSObject *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  id WeakRetained;
  _QWORD v10[4];
  int v11;
  uint8_t buf[4];
  __CFString *v13;
  uint64_t v14;

  v3 = *(_QWORD *)&a3;
  v14 = *MEMORY[0x1E0C80C00];
  GEOFindOrCreateLog("com.apple.GeoServices", "ResourceManifest");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    if (v3 >= 5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v3);
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = off_1E1C07310[(int)v3];
    }
    *(_DWORD *)buf = 138477827;
    v13 = v6;
    _os_log_impl(&dword_1885A9000, v5, OS_LOG_TYPE_DEBUG, "Asked to deactivate scenario '%{private}@'", buf, 0xCu);

  }
  -[GEOResourceFiltersManager activeScenarios](self, "activeScenarios");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __48__GEOResourceFiltersManager_deactivateScenario___block_invoke;
  v10[3] = &__block_descriptor_36_e33_B16__0__GEOActiveResourceFilter_8l;
  v11 = v3;
  -[GEOResourceFiltersManager _deactivateFilters:](self, "_deactivateFilters:", v10);
  -[GEOResourceFiltersManager activeScenarios](self, "activeScenarios");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "isEqualToSet:", v7) & 1) == 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "filtersManagerDidChangeActiveFilters:", self);

  }
}

BOOL __48__GEOResourceFiltersManager_deactivateScenario___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _BOOL8 v4;

  v3 = a2;
  v4 = objc_msgSend(v3, "whichFilter") == 2 && objc_msgSend(v3, "scenario") == *(_DWORD *)(a1 + 32);

  return v4;
}

- (void)activateName:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id WeakRetained;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *);
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    GEOFindOrCreateLog("com.apple.GeoServices", "ResourceManifest");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138477827;
      v18 = v4;
      _os_log_impl(&dword_1885A9000, v5, OS_LOG_TYPE_DEBUG, "Asked to activate name '%{private}@'", buf, 0xCu);
    }

    -[GEOResourceFiltersManager activeNames](self, "activeNames");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = MEMORY[0x1E0C809B0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __42__GEOResourceFiltersManager_activateName___block_invoke;
    v15[3] = &unk_1E1C072A8;
    v16 = v4;
    v10 = v7;
    v11 = 3221225472;
    v12 = __42__GEOResourceFiltersManager_activateName___block_invoke_2;
    v13 = &unk_1E1C072D0;
    v14 = v16;
    -[GEOResourceFiltersManager _activateFilters:setValueBlock:](self, "_activateFilters:setValueBlock:", v15, &v10);
    -[GEOResourceFiltersManager activeNames](self, "activeNames", v10, v11, v12, v13);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "isEqualToSet:", v6) & 1) == 0)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "filtersManagerDidChangeActiveFilters:", self);

    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: name != ((void *)0)", buf, 2u);
  }

}

uint64_t __42__GEOResourceFiltersManager_activateName___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = a2;
  if (objc_msgSend(v3, "whichFilter") == 3)
  {
    objc_msgSend(v3, "name");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqual:", *(_QWORD *)(a1 + 32));

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void __42__GEOResourceFiltersManager_activateName___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "setName:", v2);
  objc_msgSend(v3, "setHasLastTimestamp:", 0);

}

- (void)deactivateName:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  id WeakRetained;
  _QWORD v10[4];
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  GEOFindOrCreateLog("com.apple.GeoServices", "ResourceManifest");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138477827;
    v13 = v4;
    _os_log_impl(&dword_1885A9000, v5, OS_LOG_TYPE_DEBUG, "Asked to deactivate name '%{private}@'", buf, 0xCu);
  }

  -[GEOResourceFiltersManager activeNames](self, "activeNames");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __44__GEOResourceFiltersManager_deactivateName___block_invoke;
  v10[3] = &unk_1E1C072A8;
  v11 = v4;
  v7 = v4;
  -[GEOResourceFiltersManager _deactivateFilters:](self, "_deactivateFilters:", v10);
  -[GEOResourceFiltersManager activeNames](self, "activeNames");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "isEqualToSet:", v6) & 1) == 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "filtersManagerDidChangeActiveFilters:", self);

  }
}

uint64_t __44__GEOResourceFiltersManager_deactivateName___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = a2;
  if (objc_msgSend(v3, "whichFilter") == 3)
  {
    objc_msgSend(v3, "name");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqual:", *(_QWORD *)(a1 + 32));

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (GEOResourceFiltersManagerDelegate)delegate
{
  return (GEOResourceFiltersManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_activeFilters, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
