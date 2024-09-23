@implementation _GEORegionalResourcesVersionMigrationTask

- (_GEORegionalResourcesVersionMigrationTask)init
{
  _GEORegionalResourcesVersionMigrationTask *result;

  result = (_GEORegionalResourcesVersionMigrationTask *)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GEOMethodNotAvailableException"), CFSTR("This method is unavailable."));
  __break(1u);
  return result;
}

- (_GEORegionalResourcesVersionMigrationTask)initWithMigrator:(id)a3 manifestConfiguration:(id)a4 newTileGroup:(id)a5 inResourceManifest:(id)a6 activeScales:(id)a7 activeScenarios:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  _GEORegionalResourcesVersionMigrationTask *v18;
  _GEORegionalResourcesVersionMigrationTask *v19;
  uint64_t v20;
  GEOReportedProgress *progress;
  GEOReportedProgress *v22;
  _GEORegionalResourcesVersionMigrationTask *v23;
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id location;
  objc_super v30;

  v14 = a3;
  v26 = a4;
  v25 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v30.receiver = self;
  v30.super_class = (Class)_GEORegionalResourcesVersionMigrationTask;
  v18 = -[_GEORegionalResourcesVersionMigrationTask init](&v30, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeWeak((id *)&v18->_migrator, v14);
    objc_storeStrong((id *)&v19->_manifestConfiguration, a4);
    objc_storeStrong((id *)&v19->_newTileGroup, a5);
    objc_storeStrong((id *)&v19->_resourceManifest, a6);
    objc_storeStrong((id *)&v19->_activeScales, a7);
    objc_storeStrong((id *)&v19->_activeScenarios, a8);
    +[GEOReportedProgress progressWithTotalUnitCount:](GEOReportedProgress, "progressWithTotalUnitCount:", -1, v25, v26);
    v20 = objc_claimAutoreleasedReturnValue();
    progress = v19->_progress;
    v19->_progress = (GEOReportedProgress *)v20;

    -[GEOReportedProgress setKind:](v19->_progress, "setKind:", *MEMORY[0x1E0CB30F8]);
    objc_initWeak(&location, v19);
    v22 = v19->_progress;
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __145___GEORegionalResourcesVersionMigrationTask_initWithMigrator_manifestConfiguration_newTileGroup_inResourceManifest_activeScales_activeScenarios___block_invoke;
    v27[3] = &unk_1E1BFF8B0;
    objc_copyWeak(&v28, &location);
    -[GEOReportedProgress setCancellationHandler:](v22, "setCancellationHandler:", v27);
    v23 = v19;
    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);
  }

  return v19;
}

+ (id)_resourcesDirectory:(id)a3
{
  return GEORegionalResourcesDirectory(a3);
}

- (int64_t)estimatedWeight
{
  return 1;
}

- (NSProgress)progress
{
  return -[GEOReportedProgress progress](self->_progress, "progress");
}

- (id)_resourcesDirectory
{
  return (id)objc_msgSend((id)objc_opt_class(), "_resourcesDirectory:", self->_manifestConfiguration);
}

- (void)startWithCompletionHandler:(id)a3 callbackQueue:(id)a4
{
  id v6;
  GEOReportedProgress *progress;
  NSObject *v8;
  id v9;
  _QWORD block[4];
  id v11;

  v6 = a3;
  progress = self->_progress;
  v8 = a4;
  -[GEOReportedProgress setTotalUnitCount:](progress, "setTotalUnitCount:", 1);
  -[GEOReportedProgress setCompletedUnitCount:](self->_progress, "setCompletedUnitCount:", 1);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __86___GEORegionalResourcesVersionMigrationTask_startWithCompletionHandler_callbackQueue___block_invoke;
  block[3] = &unk_1E1C01F48;
  v11 = v6;
  v9 = v6;
  dispatch_async(v8, block);

}

- (void)populateTileGroup:(id)a3
{
  id v4;
  GEOResources *resourceManifest;
  NSSet *activeScenarios;
  NSSet *activeScales;
  GEOTileGroup *v8;
  GEOResources *v9;
  NSSet *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  unsigned int v14;
  void *v15;
  void *v16;
  void (**v17)(_QWORD, _QWORD);
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t k;
  void *v34;
  id v35;
  void *v36;
  id obj;
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
  _QWORD v50[4];
  id v51;
  _BYTE v52[128];
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  resourceManifest = self->_resourceManifest;
  activeScales = self->_activeScales;
  activeScenarios = self->_activeScenarios;
  v8 = self->_newTileGroup;
  v9 = resourceManifest;
  v10 = activeScales;
  v11 = (void *)-[NSSet mutableCopy](activeScenarios, "mutableCopy");
  objc_msgSend(v11, "addObject:", &unk_1E1E81418);
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[GEOTileGroup resourceIndexsCount](v8, "resourceIndexsCount"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[GEOTileGroup resourceIndexsCount](v8, "resourceIndexsCount"))
  {
    v13 = 0;
    do
    {
      v14 = -[GEOTileGroup resourceIndexAtIndex:](v8, "resourceIndexAtIndex:", v13);
      if (-[GEOResources resourcesCount](v9, "resourcesCount") > v14)
      {
        -[GEOResources resourceAtIndex:](v9, "resourceAtIndex:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v15, "regionsCount")
          && objc_msgSend(v15, "_geo_isRelevantForScales:scenarios:", v10, v11))
        {
          objc_msgSend(v12, "addObject:", v15);
        }

      }
      ++v13;
    }
    while (v13 < -[GEOTileGroup resourceIndexsCount](v8, "resourceIndexsCount"));
  }

  -[GEOActiveTileGroup populateRegionalResources:](v4, v12);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v12, "count"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v50[0] = MEMORY[0x1E0C809B0];
  v50[1] = 3221225472;
  v50[2] = __63___GEORegionalResourcesVersionMigrationTask_populateTileGroup___block_invoke;
  v50[3] = &unk_1E1C09578;
  v35 = v16;
  v51 = v35;
  v17 = (void (**)(_QWORD, _QWORD))MEMORY[0x18D765024](v50);
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  obj = v12;
  v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v47;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v47 != v20)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v46 + 1) + 8 * i), "filename");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v17)[2](v17, v22);

      }
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
    }
    while (v19);
  }
  v36 = v4;

  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  -[GEOResources attributions](self->_resourceManifest, "attributions");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v42, v53, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v43;
    do
    {
      for (j = 0; j != v25; ++j)
      {
        if (*(_QWORD *)v43 != v26)
          objc_enumerationMutation(v23);
        v28 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * j);
        if (objc_msgSend(v28, "regionsCount"))
        {
          v40 = 0u;
          v41 = 0u;
          v38 = 0u;
          v39 = 0u;
          objc_msgSend(v28, "resources");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v38, v52, 16);
          if (v30)
          {
            v31 = v30;
            v32 = *(_QWORD *)v39;
            do
            {
              for (k = 0; k != v31; ++k)
              {
                if (*(_QWORD *)v39 != v32)
                  objc_enumerationMutation(v29);
                objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * k), "filename");
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                ((void (**)(_QWORD, void *))v17)[2](v17, v34);

              }
              v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v38, v52, 16);
            }
            while (v31);
          }

        }
      }
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v42, v53, 16);
    }
    while (v25);
  }

  objc_msgSend(v36, "setRegionalResourceCanonicalNameToFileName:", v35);
}

- (void)removeOldData:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t k;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t m;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t n;
  uint64_t v35;
  void *v36;
  void *v37;
  char v38;
  id v39;
  NSObject *v40;
  void *v41;
  void *v42;
  id obj;
  id obja;
  id objb;
  void *v46;
  id v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  uint8_t buf[4];
  uint64_t v69;
  __int16 v70;
  id v71;
  _BYTE v72[128];
  _BYTE v73[128];
  _BYTE v74[128];
  _BYTE v75[128];
  _BYTE v76[128];
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_GEORegionalResourcesVersionMigrationTask _resourcesDirectory](self, "_resourcesDirectory");
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = (void *)v5;
  objc_msgSend(v6, "contentsOfDirectoryAtPath:error:", v5, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "count"))
  {
    v41 = v7;
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = 0u;
    v65 = 0u;
    v66 = 0u;
    v67 = 0u;
    v42 = v4;
    objc_msgSend(v4, "regionalResources");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v76, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v65;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v65 != v11)
            objc_enumerationMutation(obj);
          v13 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * i);
          v60 = 0u;
          v61 = 0u;
          v62 = 0u;
          v63 = 0u;
          objc_msgSend(v13, "resources");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v60, v75, 16);
          if (v15)
          {
            v16 = v15;
            v17 = *(_QWORD *)v61;
            do
            {
              for (j = 0; j != v16; ++j)
              {
                if (*(_QWORD *)v61 != v17)
                  objc_enumerationMutation(v14);
                objc_msgSend(*(id *)(*((_QWORD *)&v60 + 1) + 8 * j), "filename");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v8, "removeObject:", v19);

              }
              v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v60, v75, 16);
            }
            while (v16);
          }

        }
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v76, 16);
      }
      while (v10);
    }

    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    objc_msgSend(v42, "attributions");
    obja = (id)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v56, v74, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v57;
      do
      {
        for (k = 0; k != v21; ++k)
        {
          if (*(_QWORD *)v57 != v22)
            objc_enumerationMutation(obja);
          v24 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * k);
          if (objc_msgSend(v24, "regionsCount"))
          {
            v54 = 0u;
            v55 = 0u;
            v52 = 0u;
            v53 = 0u;
            objc_msgSend(v24, "resources");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v52, v73, 16);
            if (v26)
            {
              v27 = v26;
              v28 = *(_QWORD *)v53;
              do
              {
                for (m = 0; m != v27; ++m)
                {
                  if (*(_QWORD *)v53 != v28)
                    objc_enumerationMutation(v25);
                  objc_msgSend(*(id *)(*((_QWORD *)&v52 + 1) + 8 * m), "filename");
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v8, "removeObject:", v30);

                }
                v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v52, v73, 16);
              }
              while (v27);
            }

          }
        }
        v21 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v56, v74, 16);
      }
      while (v21);
    }

    if (objc_msgSend(v8, "count"))
    {
      v50 = 0u;
      v51 = 0u;
      v48 = 0u;
      v49 = 0u;
      objb = v8;
      v31 = objc_msgSend(objb, "countByEnumeratingWithState:objects:count:", &v48, v72, 16);
      if (v31)
      {
        v32 = v31;
        v33 = *(_QWORD *)v49;
        do
        {
          for (n = 0; n != v32; ++n)
          {
            if (*(_QWORD *)v49 != v33)
              objc_enumerationMutation(objb);
            v35 = *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * n);
            objc_msgSend(v46, "stringByAppendingPathComponent:", v35);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            v47 = 0;
            v38 = objc_msgSend(v37, "removeItemAtPath:error:", v36, &v47);
            v39 = v47;

            if ((v38 & 1) == 0)
            {
              GEOFindOrCreateLog("com.apple.GeoServices", "ResourceManifest");
              v40 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543618;
                v69 = v35;
                v70 = 2114;
                v71 = v39;
                _os_log_impl(&dword_1885A9000, v40, OS_LOG_TYPE_ERROR, "Could not remove regional resource resource '%{public}@' from disk: %{public}@", buf, 0x16u);
              }

            }
          }
          v32 = objc_msgSend(objb, "countByEnumeratingWithState:objects:count:", &v48, v72, 16);
        }
        while (v32);
      }

    }
    v7 = v41;
    v4 = v42;
  }

}

- (NSObject)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
  objc_storeStrong((id *)&self->_transaction, a3);
}

- (GEOActiveTileGroupMigrationTaskOptions)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
  objc_storeStrong((id *)&self->_options, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_activeScenarios, 0);
  objc_storeStrong((id *)&self->_activeScales, 0);
  objc_storeStrong((id *)&self->_resourceManifest, 0);
  objc_storeStrong((id *)&self->_newTileGroup, 0);
  objc_storeStrong((id *)&self->_manifestConfiguration, 0);
  objc_destroyWeak((id *)&self->_migrator);
}

@end
