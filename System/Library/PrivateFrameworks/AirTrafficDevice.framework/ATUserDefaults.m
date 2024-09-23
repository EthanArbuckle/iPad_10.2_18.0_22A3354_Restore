@implementation ATUserDefaults

- (ATUserDefaults)init
{
  ATUserDefaults *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *defaults;
  NSMutableDictionary *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)ATUserDefaults;
  v2 = -[ATUserDefaults init](&v11, sel_init);
  if (v2)
  {
    _airTrafficPersistentDictionary();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
    {
      objc_msgSend(v3, "deepMutableObject");
      v5 = objc_claimAutoreleasedReturnValue();
      defaults = v2->_defaults;
      v2->_defaults = (NSMutableDictionary *)v5;
    }
    else
    {
      v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      v8 = v2->_defaults;
      v2->_defaults = v7;

      v9 = v2->_defaults;
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      defaults = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", defaults, CFSTR("Hosts"));
    }

  }
  return v2;
}

- (BOOL)hasCompletedDataMigration
{
  NSMutableDictionary *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = self->_defaults;
  objc_sync_enter(v3);
  -[NSMutableDictionary objectForKey:](self->_defaults, "objectForKey:", CFSTR("DataMigrated"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "BOOLValue") & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    _atcStandardDefaults();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", CFSTR("DataMigrated"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v8, "BOOLValue");

  }
  objc_sync_exit(v3);

  return v5;
}

- (void)updateHostInfo:(id)a3 disabledAssetTypes:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  _BOOL4 v27;
  NSMutableDictionary *defaults;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t j;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  BOOL v51;
  void *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t k;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  NSMutableDictionary *v66;
  id v67;
  void *v68;
  void *v69;
  id obj;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  uint64_t v74;
  ATUserDefaults *v75;
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
  _BYTE v93[128];
  _BYTE v94[128];
  _BYTE v95[128];
  _BYTE v96[128];
  uint64_t v97;

  v97 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v67 = a4;
  v75 = self;
  v66 = self->_defaults;
  objc_sync_enter(v66);
  v73 = v6;
  objc_msgSend(v6, "objectForKey:", CFSTR("LibraryID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[NSMutableDictionary objectForKey:](self->_defaults, "objectForKey:", CFSTR("Hosts"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", CFSTR("LibraryID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      v76 = v10;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v76 = (id)objc_claimAutoreleasedReturnValue();
    }

    objc_msgSend(v73, "objectForKey:", CFSTR("Wakeable"));
    v12 = objc_claimAutoreleasedReturnValue();
    if (v12)
      objc_msgSend(v76, "setObject:forKey:", v12, CFSTR("Wakeable"));
    else
      objc_msgSend(v76, "removeObjectForKey:", CFSTR("Wakeable"));
    v65 = (void *)v12;
    objc_msgSend(v73, "objectForKey:", CFSTR("SyncHostName"));
    v13 = objc_claimAutoreleasedReturnValue();
    if (v13)
      objc_msgSend(v76, "setObject:forKey:", v13, CFSTR("SyncHostName"));
    v64 = (void *)v13;
    objc_msgSend(v73, "objectForKey:", CFSTR("SyncedAssetTypes"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "deepMutableObject");
    v68 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v68, "removeObjectsInArray:", v67);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "setObject:forKey:", v15, CFSTR("SyncedDataclasses"));

    v91 = 0u;
    v92 = 0u;
    v89 = 0u;
    v90 = 0u;
    objc_msgSend(v73, "objectForKey:", CFSTR("SyncedDataclasses"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v89, v96, 16);
    if (v17)
    {
      v18 = *(_QWORD *)v90;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v90 != v18)
            objc_enumerationMutation(v16);
          v20 = *(_QWORD *)(*((_QWORD *)&v89 + 1) + 8 * i);
          objc_msgSend(v76, "objectForKey:", CFSTR("SyncedDataclasses"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "setObject:forKey:", v22, v20);

        }
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v89, v96, 16);
      }
      while (v17);
    }

    if (v68)
    {
      objc_msgSend(v76, "objectForKey:", CFSTR("SyncedDataclasses"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setObject:forKey:", v68, CFSTR("Media"));

    }
    objc_msgSend(v73, "objectForKey:", CFSTR("LibraryID"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "setObject:forKey:", v24, CFSTR("LibraryID"));

    objc_msgSend(v73, "objectForKey:", CFSTR("MacOSVersion"));
    v25 = objc_claimAutoreleasedReturnValue();
    if (v25)
    {
      objc_msgSend(v76, "setObject:forKey:", CFSTR("MacOS"), CFSTR("OSType"));
      objc_msgSend(v76, "setObject:forKey:", v25, CFSTR("OSVersion"));
    }
    else
    {
      objc_msgSend(v73, "objectForKey:", CFSTR("WindowsOSVersion"));
      v25 = objc_claimAutoreleasedReturnValue();
      if (v25)
      {
        objc_msgSend(v76, "setObject:forKey:", CFSTR("Windows"), CFSTR("OSType"));
        objc_msgSend(v76, "setObject:forKey:", v25, CFSTR("OSVersion"));
      }
    }
    -[NSMutableDictionary objectForKey:](v75->_defaults, "objectForKey:", CFSTR("Hosts"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = v25;
    v27 = v26 == 0;

    if (v27)
    {
      defaults = v75->_defaults;
      v29 = (void *)objc_opt_new();
      -[NSMutableDictionary setObject:forKey:](defaults, "setObject:forKey:", v29, CFSTR("Hosts"), v62);

    }
    -[NSMutableDictionary objectForKey:](v75->_defaults, "objectForKey:", CFSTR("Hosts"), v62);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "objectForKey:", CFSTR("LibraryID"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setObject:forKey:", v76, v31);

    objc_msgSend(v76, "objectForKey:", CFSTR("SyncedDataclasses"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "allKeys");
    v69 = (void *)objc_claimAutoreleasedReturnValue();

    v87 = 0u;
    v88 = 0u;
    v85 = 0u;
    v86 = 0u;
    -[NSMutableDictionary objectForKey:](v75->_defaults, "objectForKey:", CFSTR("Hosts"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "allKeys");
    obj = (id)objc_claimAutoreleasedReturnValue();

    v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v85, v95, 16);
    if (v34)
    {
      v71 = *(_QWORD *)v86;
      do
      {
        v35 = 0;
        v72 = v34;
        do
        {
          if (*(_QWORD *)v86 != v71)
            objc_enumerationMutation(obj);
          v74 = v35;
          v36 = *(void **)(*((_QWORD *)&v85 + 1) + 8 * v35);
          -[NSMutableDictionary objectForKey:](v75->_defaults, "objectForKey:", CFSTR("Hosts"));
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "objectForKey:", v36);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "objectForKey:", CFSTR("SyncedDataclasses"));
          v39 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v73, "objectForKey:", CFSTR("LibraryID"));
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v36) = objc_msgSend(v36, "isEqualToString:", v40);

          if ((v36 & 1) == 0)
          {
            v83 = 0u;
            v84 = 0u;
            v81 = 0u;
            v82 = 0u;
            v41 = v69;
            v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v81, v94, 16);
            if (v42)
            {
              v43 = *(_QWORD *)v82;
              do
              {
                for (j = 0; j != v42; ++j)
                {
                  if (*(_QWORD *)v82 != v43)
                    objc_enumerationMutation(v41);
                  v45 = *(_QWORD *)(*((_QWORD *)&v81 + 1) + 8 * j);
                  objc_msgSend(v39, "objectForKey:", v45);
                  v46 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v46)
                  {
                    objc_msgSend(v76, "objectForKey:", CFSTR("SyncedDataclasses"));
                    v47 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v47, "objectForKey:", v45);
                    v48 = (void *)objc_claimAutoreleasedReturnValue();

                    if (!objc_msgSend(v48, "count"))
                      goto LABEL_39;
                    objc_msgSend(v39, "objectForKey:", v45);
                    v49 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v49, "removeObjectsInArray:", v48);

                    objc_msgSend(v39, "objectForKey:", v45);
                    v50 = (void *)objc_claimAutoreleasedReturnValue();
                    v51 = objc_msgSend(v50, "count") == 0;

                    if (v51)
LABEL_39:
                      objc_msgSend(v39, "removeObjectForKey:", v45);

                  }
                }
                v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v81, v94, 16);
              }
              while (v42);
            }

          }
          v35 = v74 + 1;
        }
        while (v74 + 1 != v72);
        v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v85, v95, 16);
      }
      while (v34);
    }

    v79 = 0u;
    v80 = 0u;
    v77 = 0u;
    v78 = 0u;
    -[NSMutableDictionary objectForKey:](v75->_defaults, "objectForKey:", CFSTR("Hosts"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "allKeys");
    v53 = (void *)objc_claimAutoreleasedReturnValue();

    v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v77, v93, 16);
    if (v54)
    {
      v55 = *(_QWORD *)v78;
      do
      {
        for (k = 0; k != v54; ++k)
        {
          if (*(_QWORD *)v78 != v55)
            objc_enumerationMutation(v53);
          v57 = *(_QWORD *)(*((_QWORD *)&v77 + 1) + 8 * k);
          -[NSMutableDictionary objectForKey:](v75->_defaults, "objectForKey:", CFSTR("Hosts"));
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "objectForKey:", v57);
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v59, "objectForKey:", CFSTR("SyncedDataclasses"));
          v60 = (void *)objc_claimAutoreleasedReturnValue();

          if (!objc_msgSend(v60, "count"))
          {
            -[NSMutableDictionary objectForKey:](v75->_defaults, "objectForKey:", CFSTR("Hosts"));
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v61, "removeObjectForKey:", v57);

          }
        }
        v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v77, v93, 16);
      }
      while (v54);
    }

    -[ATUserDefaults _updateDefaults](v75, "_updateDefaults");
  }
  objc_sync_exit(v66);

}

- (void)updateLastSyncWithHostLibrary:(id)a3
{
  NSMutableDictionary *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v4 = self->_defaults;
  objc_sync_enter(v4);
  -[NSMutableDictionary objectForKey:](self->_defaults, "objectForKey:", CFSTR("Hosts"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[NSMutableDictionary objectForKey:](self->_defaults, "objectForKey:", CFSTR("Hosts"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "timeIntervalSinceReferenceDate");
    objc_msgSend(v9, "numberWithDouble:");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v11, CFSTR("LastSync"));

  }
  -[ATUserDefaults _updateDefaults](self, "_updateDefaults");
  objc_sync_exit(v4);

}

- (void)removeHost:(id)a3
{
  NSMutableDictionary *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = self->_defaults;
  objc_sync_enter(v4);
  -[NSMutableDictionary objectForKey:](self->_defaults, "objectForKey:", CFSTR("Hosts"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObjectForKey:", v6);

  -[ATUserDefaults _updateDefaults](self, "_updateDefaults");
  objc_sync_exit(v4);

}

- (id)hostInfoForIdentifier:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = self->_defaults;
  objc_sync_enter(v5);
  -[NSMutableDictionary objectForKey:](self->_defaults, "objectForKey:", CFSTR("Hosts"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v5);
  return v7;
}

- (id)allHosts
{
  NSMutableDictionary *v3;
  void *v4;

  v3 = self->_defaults;
  objc_sync_enter(v3);
  -[NSMutableDictionary objectForKey:](self->_defaults, "objectForKey:", CFSTR("Hosts"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v3);

  return v4;
}

- (void)setHasCompletedDataMigration:(BOOL)a3
{
  _BOOL8 v3;
  NSMutableDictionary *defaults;
  void *v6;
  NSMutableDictionary *obj;

  v3 = a3;
  obj = self->_defaults;
  objc_sync_enter(obj);
  defaults = self->_defaults;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](defaults, "setObject:forKey:", v6, CFSTR("DataMigrated"));

  -[ATUserDefaults _updateDefaults](self, "_updateDefaults");
  objc_sync_exit(obj);

}

- (void)setDiskUsageInfo:(id)a3
{
  NSMutableDictionary *v4;
  NSMutableDictionary *defaults;
  void *v6;
  id v7;

  v7 = a3;
  v4 = self->_defaults;
  objc_sync_enter(v4);
  defaults = self->_defaults;
  objc_msgSend(v7, "deepMutableObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](defaults, "setObject:forKey:", v6, CFSTR("DiskUsage"));

  -[ATUserDefaults _updateDefaults](self, "_updateDefaults");
  objc_sync_exit(v4);

}

- (NSDictionary)diskUsageInfo
{
  NSMutableDictionary *v3;
  void *v4;

  v3 = self->_defaults;
  objc_sync_enter(v3);
  -[NSMutableDictionary objectForKey:](self->_defaults, "objectForKey:", CFSTR("DiskUsage"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v3);

  return (NSDictionary *)v4;
}

- (NSNumber)minimumNetworkLinkQualityForDownloads
{
  void *v2;
  void *v3;

  _atcStandardDefaults();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("MinimumNetworkLinkQualityForDownloads"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (void)setMinimumNetworkLinkQualityForDownloads:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  _atcStandardDefaults();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v3, CFSTR("MinimumNetworkLinkQualityForDownloads"));

}

- (void)_updateDefaults
{
  void *v3;
  void *v4;
  id v5;

  _atcStandardDefaults();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[ATUserDefaults allHosts](self, "allHosts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(v5, "setObject:forKey:", v3, CFSTR("Hosts"));
  -[ATUserDefaults diskUsageInfo](self, "diskUsageInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("DiskUsage"));
  objc_msgSend((id)objc_opt_class(), "synchronize");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaults, 0);
}

+ (ATUserDefaults)sharedInstance
{
  if (sharedInstance_onceToken_2982 != -1)
    dispatch_once(&sharedInstance_onceToken_2982, &__block_literal_global_2983);
  return (ATUserDefaults *)(id)sharedInstance___sharedInstance_2984;
}

+ (void)synchronize
{
  CFPreferencesAppSynchronize(CFSTR("com.apple.atc"));
}

+ (id)readOnlyDefaults
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  _airTrafficPersistentDictionary();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

void __32__ATUserDefaults_sharedInstance__block_invoke()
{
  ATUserDefaults *v0;
  void *v1;

  v0 = objc_alloc_init(ATUserDefaults);
  v1 = (void *)sharedInstance___sharedInstance_2984;
  sharedInstance___sharedInstance_2984 = (uint64_t)v0;

}

@end
