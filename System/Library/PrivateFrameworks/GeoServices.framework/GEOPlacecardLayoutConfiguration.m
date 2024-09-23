@implementation GEOPlacecardLayoutConfiguration

- (GEOPlacecardLayoutConfiguration)initWithPlacecardLayoutConfiguration:(id)a3 moduleConfigurationProvider:(id)a4
{
  id v7;
  id v8;
  GEOPlacecardLayoutConfiguration *v9;
  GEOPlacecardLayoutConfiguration *v10;
  GEOPlacecardLayoutConfiguration *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)GEOPlacecardLayoutConfiguration;
  v9 = -[GEOPlacecardLayoutConfiguration init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_placecardLayoutConfiguration, a3);
    objc_storeWeak((id *)&v10->_moduleConfigProvider, v8);
    v11 = v10;
  }

  return v10;
}

- (GEOModuleLayoutEntry)currentModuleLayoutEntry
{
  void *v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  int v14;
  int v15;
  int v16;
  void *v17;
  uint64_t v18;
  BOOL v19;
  int v20;
  void *v21;
  id v22;
  char v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  id v32;
  NSObject *v33;
  GEOModuleLayoutEntry *v34;
  id WeakRetained;
  GEOModuleLayoutEntry *v36;
  GEOPlacecardLayoutConfiguration *v38;
  void *v39;
  id obj;
  uint64_t v41;
  uint64_t v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t v47[128];
  uint8_t buf[4];
  uint64_t v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v4 = objc_claimAutoreleasedReturnValue();

  GEOGetPlaceCardLayoutLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v49 = v4;
    _os_log_impl(&dword_1885A9000, v5, OS_LOG_TYPE_INFO, "Current bundle identifier is %@", buf, 0xCu);
  }

  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v38 = self;
  -[GEOPDPlacecardLayoutConfiguration entries](self->_placecardLayoutConfiguration, "entries");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v39 = (void *)v4;
  v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
  v6 = 0;
  v7 = 0;
  v8 = 0;
  v9 = 0;
  if (v42)
  {
    v41 = *(_QWORD *)v44;
    do
    {
      for (i = 0; i != v42; ++i)
      {
        if (*(_QWORD *)v44 != v41)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
        objc_msgSend(v11, "applicationIds");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "containsObject:", v4);

        v14 = objc_msgSend(v11, "platformType");
        v15 = v14;
        if (v7)
          v16 = 1;
        else
          v16 = v13 ^ 1;
        if (!v16)
          v7 = 0;
        if ((v16 & 1) == 0 && v14 == 1)
          v7 = v11;
        if (v9)
          goto LABEL_21;
        objc_msgSend(v11, "applicationIds");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "count");

        v4 = (uint64_t)v39;
        v19 = v18 == 0;
        v9 = 0;
        v19 = v19 && v15 == 1;
        if (v19)
        {
          v9 = v11;
          if (((v8 == 0) & v13) != 0)
            v8 = 0;
          if (!v6)
          {
LABEL_30:
            objc_msgSend(v11, "applicationIds");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v21, "count"))
            {

              v6 = 0;
            }
            else
            {
              v22 = v9;
              v23 = objc_msgSend(v11, "hasPlatformType");

              if ((v23 & 1) != 0)
                v6 = 0;
              else
                v6 = v11;
              v9 = v22;
            }
            continue;
          }
        }
        else
        {
LABEL_21:
          if (v8)
            v20 = 1;
          else
            v20 = v13 ^ 1;
          if (!v20)
            v8 = 0;
          if ((v20 & 1) == 0 && v15 != 1)
            v8 = v11;
          if (!v6)
            goto LABEL_30;
        }
      }
      v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
    }
    while (v42);
  }

  if (v7)
    v24 = v7;
  else
    v24 = v8;
  v25 = v24;
  v26 = v9;
  v27 = v25;
  v28 = v26;
  if (v25)
    v26 = v25;
  v29 = v26;

  if (v29)
    v30 = v29;
  else
    v30 = v6;
  v31 = v30;

  if (v31)
  {
    v32 = v6;
    GEOGetPlaceCardLayoutLog();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v49 = (uint64_t)v31;
      _os_log_impl(&dword_1885A9000, v33, OS_LOG_TYPE_DEBUG, "Using layout %@", buf, 0xCu);
    }

    v34 = [GEOModuleLayoutEntry alloc];
    WeakRetained = objc_loadWeakRetained((id *)&v38->_moduleConfigProvider);
    v36 = -[GEOModuleLayoutEntry initWithModuleLayoutEntry:moduleConfigProvider:](v34, "initWithModuleLayoutEntry:moduleConfigProvider:", v31, WeakRetained);

    v6 = v32;
  }
  else
  {
    v36 = 0;
  }

  return v36;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_moduleConfigProvider);
  objc_storeStrong((id *)&self->_placecardLayoutConfiguration, 0);
}

@end
