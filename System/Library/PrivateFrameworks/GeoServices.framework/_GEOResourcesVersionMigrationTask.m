@implementation _GEOResourcesVersionMigrationTask

- (_GEOResourcesVersionMigrationTask)init
{
  _GEOResourcesVersionMigrationTask *result;

  result = (_GEOResourcesVersionMigrationTask *)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GEOMethodNotAvailableException"), CFSTR("This method is unavailable."));
  __break(1u);
  return result;
}

- (id)initForWithMigrator:(id)a3 manifestConfiguration:(id)a4 newTileGroup:(id)a5 inResourceManifest:(id)a6 dataSet:(id)a7 oldTileGroup:(id)a8 activeScales:(id)a9 activeScenarios:(id)a10 activeNames:(id)a11
{
  id v17;
  _GEOResourcesVersionMigrationTask *v18;
  _GEOResourcesVersionMigrationTask *v19;
  uint64_t v20;
  OS_dispatch_queue *workQueue;
  uint64_t v22;
  GEOReportedProgress *progress;
  GEOReportedProgress *v24;
  _GEOResourcesVersionMigrationTask *v25;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  _QWORD v35[4];
  id v36;
  id location;
  objc_super v38;

  v17 = a3;
  v34 = a4;
  v33 = a5;
  v32 = a6;
  v31 = a7;
  v30 = a8;
  v29 = a9;
  v28 = a10;
  v27 = a11;
  v38.receiver = self;
  v38.super_class = (Class)_GEOResourcesVersionMigrationTask;
  v18 = -[_GEOResourcesVersionMigrationTask init](&v38, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeWeak((id *)&v18->_migrator, v17);
    objc_storeStrong((id *)&v19->_manifestConfiguration, a4);
    v20 = geo_dispatch_queue_create();
    workQueue = v19->_workQueue;
    v19->_workQueue = (OS_dispatch_queue *)v20;

    objc_storeStrong((id *)&v19->_newTileGroup, a5);
    objc_storeStrong((id *)&v19->_resourceManifest, a6);
    objc_storeStrong((id *)&v19->_preferredDataSet, a7);
    objc_storeStrong((id *)&v19->_oldTileGroup, a8);
    objc_storeStrong((id *)&v19->_activeScales, a9);
    objc_storeStrong((id *)&v19->_activeScenarios, a10);
    objc_storeStrong((id *)&v19->_activeNames, a11);
    +[GEOReportedProgress progressWithTotalUnitCount:](GEOReportedProgress, "progressWithTotalUnitCount:", -1);
    v22 = objc_claimAutoreleasedReturnValue();
    progress = v19->_progress;
    v19->_progress = (GEOReportedProgress *)v22;

    -[GEOReportedProgress setKind:](v19->_progress, "setKind:", *MEMORY[0x1E0CB30F8]);
    objc_initWeak(&location, v19);
    v24 = v19->_progress;
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __173___GEOResourcesVersionMigrationTask_initForWithMigrator_manifestConfiguration_newTileGroup_inResourceManifest_dataSet_oldTileGroup_activeScales_activeScenarios_activeNames___block_invoke;
    v35[3] = &unk_1E1BFF8B0;
    objc_copyWeak(&v36, &location);
    -[GEOReportedProgress setCancellationHandler:](v24, "setCancellationHandler:", v35);
    v25 = v19;
    objc_destroyWeak(&v36);
    objc_destroyWeak(&location);
  }

  return v19;
}

- (id)initForRequiredWithMigrator:(id)a3 manifestConfiguration:(id)a4 newTileGroup:(id)a5 inResourceManifest:(id)a6 dataSet:(id)a7 oldTileGroup:(id)a8 activeScales:(id)a9 activeScenarios:(id)a10
{
  return -[_GEOResourcesVersionMigrationTask initForWithMigrator:manifestConfiguration:newTileGroup:inResourceManifest:dataSet:oldTileGroup:activeScales:activeScenarios:activeNames:](self, "initForWithMigrator:manifestConfiguration:newTileGroup:inResourceManifest:dataSet:oldTileGroup:activeScales:activeScenarios:activeNames:", a3, a4, a5, a6, a7, a8, a9, a10, 0);
}

- (id)initForOpportunisticWithMigrator:(id)a3 manifestConfiguration:(id)a4 newTileGroup:(id)a5 inResourceManifest:(id)a6 dataSet:(id)a7 oldTileGroup:(id)a8 activeNames:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _GEOResourcesVersionMigrationTask *v22;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  if (objc_msgSend(v21, "count"))
  {
    self = (_GEOResourcesVersionMigrationTask *)-[_GEOResourcesVersionMigrationTask initForWithMigrator:manifestConfiguration:newTileGroup:inResourceManifest:dataSet:oldTileGroup:activeScales:activeScenarios:activeNames:](self, "initForWithMigrator:manifestConfiguration:newTileGroup:inResourceManifest:dataSet:oldTileGroup:activeScales:activeScenarios:activeNames:", v15, v16, v17, v18, v19, v20, 0, 0, v21);
    v22 = self;
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

+ (Class)_resourceLoaderClass
{
  return (Class)objc_opt_class();
}

+ (id)_resourcesDirectory:(id)a3
{
  return GEOResourcesPath(a3);
}

- (int64_t)estimatedWeight
{
  return 4;
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
  id v7;
  id WeakRetained;
  NSObject *workQueue;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  self->_running = 1;
  WeakRetained = objc_loadWeakRetained((id *)&self->_migrator);
  objc_msgSend(WeakRetained, "_addRunningTask:", self);

  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78___GEOResourcesVersionMigrationTask_startWithCompletionHandler_callbackQueue___block_invoke;
  block[3] = &unk_1E1C00BB8;
  v13 = v7;
  v14 = v6;
  block[4] = self;
  v10 = v7;
  v11 = v6;
  dispatch_async(workQueue, block);

}

- (void)cancel
{
  NSObject *workQueue;
  _QWORD block[5];

  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43___GEOResourcesVersionMigrationTask_cancel__block_invoke;
  block[3] = &unk_1E1BFF6F8;
  block[4] = self;
  dispatch_async(workQueue, block);
}

- (void)populateTileGroup:(id)a3
{
  NSObject *workQueue;
  id v5;
  _QWORD block[5];
  id v7;

  v5 = a3;
  if (!self->_activeNames)
  {
    dispatch_assert_queue_not_V2((dispatch_queue_t)self->_workQueue);
    workQueue = self->_workQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __55___GEOResourcesVersionMigrationTask_populateTileGroup___block_invoke;
    block[3] = &unk_1E1C00738;
    block[4] = self;
    v7 = v5;
    dispatch_sync(workQueue, block);

  }
}

- (void)removeOldData:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  __int128 v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  id v25;
  void *v26;
  BOOL v27;
  NSObject *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  char v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t k;
  void *v46;
  char v47;
  uint64_t v48;
  void *v49;
  void *v50;
  char v51;
  NSObject *v52;
  uint64_t v53;
  __int128 v54;
  uint64_t v55;
  _GEOResourcesVersionMigrationTask *v56;
  uint64_t v57;
  id obj;
  uint64_t v59;
  uint64_t v60;
  id v61;
  uint64_t v62;
  id v63;
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
  uint8_t buf[4];
  id v85;
  __int16 v86;
  id v87;
  _BYTE v88[128];
  _BYTE v89[128];
  _BYTE v90[128];
  _BYTE v91[128];
  _BYTE v92[128];
  uint64_t v93;

  v93 = *MEMORY[0x1E0C80C00];
  v61 = a3;
  v80 = 0u;
  v81 = 0u;
  v82 = 0u;
  v83 = 0u;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_GEOResourcesVersionMigrationTask _resourcesDirectory](self, "_resourcesDirectory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentsOfDirectoryAtPath:error:", v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v6;
  v60 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v80, v92, 16);
  if (v60)
  {
    v59 = *(_QWORD *)v81;
    *(_QWORD *)&v7 = 138543618;
    v54 = v7;
    v56 = self;
    do
    {
      for (i = 0; i != v60; i = v53 + 1)
      {
        if (*(_QWORD *)v81 != v59)
          objc_enumerationMutation(obj);
        v62 = i;
        v9 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * i);
        objc_msgSend(v61, "activeResources", v54);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (void *)objc_msgSend(v10, "mutableCopy");

        objc_msgSend(v61, "explicitResources");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addObjectsFromArray:", v12);

        v78 = 0u;
        v79 = 0u;
        v76 = 0u;
        v77 = 0u;
        v13 = v11;
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v76, v91, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v77;
          while (2)
          {
            for (j = 0; j != v15; ++j)
            {
              if (*(_QWORD *)v77 != v16)
                objc_enumerationMutation(v13);
              v18 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * j);
              objc_msgSend(v18, "filename");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v20 = objc_msgSend(v19, "isEqualToString:", v9);

              if ((v20 & 1) != 0)
              {
                v29 = v13;
                goto LABEL_50;
              }
              objc_msgSend(v18, "filename");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "stringByDeletingPathExtension");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              v23 = objc_msgSend(v22, "isEqualToString:", v9);

              if (v23)
              {
                -[_GEOResourcesVersionMigrationTask _resourcesDirectory](self, "_resourcesDirectory");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v24, "stringByAppendingPathComponent:", v9);
                v25 = (id)objc_claimAutoreleasedReturnValue();

                objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v25);
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                v27 = +[GEOResourceLoader validateUnpackedResource:at:](GEOResourceLoader, "validateUnpackedResource:at:", v18, v26);

                if (v27)
                {
                  v29 = v13;
                  goto LABEL_53;
                }
                GEOGetResourceManifestLog();
                v28 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  v85 = v25;
                  _os_log_impl(&dword_1885A9000, v28, OS_LOG_TYPE_ERROR, "Unable to validate unpacked resource at \"%@\", will remove folder", buf, 0xCu);
                }

              }
            }
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v76, v91, 16);
            if (v15)
              continue;
            break;
          }
        }

        v74 = 0u;
        v75 = 0u;
        v72 = 0u;
        v73 = 0u;
        objc_msgSend(v61, "staleResources");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v72, v90, 16);
        if (v30)
        {
          v31 = v30;
          v32 = *(_QWORD *)v73;
LABEL_21:
          v33 = 0;
          while (1)
          {
            if (*(_QWORD *)v73 != v32)
              objc_enumerationMutation(v29);
            objc_msgSend(*(id *)(*((_QWORD *)&v72 + 1) + 8 * v33), "fallbackResource");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "filename");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v36 = objc_msgSend(v35, "isEqualToString:", v9);

            if ((v36 & 1) != 0)
              break;
            if (v31 == ++v33)
            {
              v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v72, v90, 16);
              if (v31)
                goto LABEL_21;
              goto LABEL_27;
            }
          }
LABEL_50:
          v53 = v62;
        }
        else
        {
LABEL_27:

          v70 = 0u;
          v71 = 0u;
          v68 = 0u;
          v69 = 0u;
          objc_msgSend(v61, "attributions");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v68, v89, 16);
          if (v37)
          {
            v38 = v37;
            v39 = *(_QWORD *)v69;
            v55 = *(_QWORD *)v69;
            do
            {
              v40 = 0;
              v57 = v38;
              do
              {
                if (*(_QWORD *)v69 != v39)
                  objc_enumerationMutation(v29);
                v41 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * v40);
                if (!objc_msgSend(v41, "regionsCount"))
                {
                  v66 = 0u;
                  v67 = 0u;
                  v64 = 0u;
                  v65 = 0u;
                  objc_msgSend(v41, "resources");
                  v25 = (id)objc_claimAutoreleasedReturnValue();
                  v42 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v64, v88, 16);
                  if (v42)
                  {
                    v43 = v42;
                    v44 = *(_QWORD *)v65;
                    while (2)
                    {
                      for (k = 0; k != v43; ++k)
                      {
                        if (*(_QWORD *)v65 != v44)
                          objc_enumerationMutation(v25);
                        objc_msgSend(*(id *)(*((_QWORD *)&v64 + 1) + 8 * k), "filename");
                        v46 = (void *)objc_claimAutoreleasedReturnValue();
                        v47 = objc_msgSend(v46, "isEqualToString:", v9);

                        if ((v47 & 1) != 0)
                        {
                          self = v56;
                          goto LABEL_53;
                        }
                      }
                      v43 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v64, v88, 16);
                      if (v43)
                        continue;
                      break;
                    }
                  }

                  v39 = v55;
                  self = v56;
                  v38 = v57;
                }
                ++v40;
              }
              while (v40 != v38);
              v48 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v68, v89, 16);
              v38 = v48;
            }
            while (v48);
          }

          -[_GEOResourcesVersionMigrationTask _resourcesDirectory](self, "_resourcesDirectory");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "stringByAppendingPathComponent:", v9);
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          v63 = 0;
          v51 = objc_msgSend(v50, "removeItemAtPath:error:", v29, &v63);
          v25 = v63;

          if ((v51 & 1) != 0)
          {
LABEL_53:
            v53 = v62;
          }
          else
          {
            GEOGetResourceManifestLog();
            v52 = objc_claimAutoreleasedReturnValue();
            v53 = v62;
            if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v54;
              v85 = v9;
              v86 = 2114;
              v87 = v25;
              _os_log_impl(&dword_1885A9000, v52, OS_LOG_TYPE_ERROR, "Could not remove resource '%{public}@' from disk: %{public}@", buf, 0x16u);
            }

          }
        }

      }
      v60 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v80, v92, 16);
    }
    while (v60);
  }

}

- (void)_loadImmediateResources:(id)a3 conditionalWifiResources:(id)a4 completionHandler:(id)a5
{
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  double Double;
  GEOPowerAssertion *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  GEOPowerAssertion *v24;
  GEOPowerAssertion *powerAssertion;
  id v26;
  void *v27;
  void *v28;
  GEOResourceLoader *v29;
  GEOResourceLoader *immediateResourceLoader;
  GEOResourceLoader *v31;
  OS_dispatch_queue *workQueue;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  id v46;
  _QWORD v47[5];
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  objc_class *v55;
  uint64_t v56;

  v46 = a4;
  v8 = a5;
  v9 = v8;
  if (v8)
  {
    v44 = v8;
    v10 = a3;
    -[_GEOResourcesVersionMigrationTask _resourcesDirectory](self, "_resourcesDirectory");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    if (self->_oldTileGroup)
      v11 = 3;
    else
      v11 = 6;
    if (-[GEOResourceManifestConfiguration isDefaultConfiguration](self->_manifestConfiguration, "isDefaultConfiguration"))
    {
      v12 = 0;
    }
    else
    {
      GEOResourcesPath(0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v13 = (objc_class *)objc_msgSend((id)objc_opt_class(), "_resourceLoaderClass");
    -[GEOResources preferedURLSetFor:](self->_resourceManifest, "preferedURLSetFor:", self->_preferredDataSet);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "resourcesURL");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "nsURL");
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "resourcesProxyURL");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = v14;
    objc_msgSend(v14, "alternateResourcesNSURLs");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = v11;
    if (GEOConfigGetBOOL(GeoServicesConfig_ResourceLoadingShouldTakePowerAssertion, (uint64_t)off_1EDF4D3A8))
    {
      Double = GEOConfigGetDouble(GeoServicesConfig_ResourceLoadingPowerAssertionTimeout, (uint64_t)off_1EDF4D398);
      v17 = [GEOPowerAssertion alloc];
      v18 = (void *)MEMORY[0x1E0CB3940];
      -[_GEOResourcesVersionMigrationTask description](self, "description");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v20 = v12;
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "UUIDString");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "stringWithFormat:", CFSTR("%@_%@"), v19, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = -[GEOPowerAssertion initWithType:identifier:timeout:](v17, "initWithType:identifier:timeout:", 0, v23, Double);
      powerAssertion = self->_powerAssertion;
      self->_powerAssertion = v24;

      v12 = v20;
      v11 = v45;

    }
    -[GEOReportedProgress becomeCurrentWithPendingUnitCount:](self->_progress, "becomeCurrentWithPendingUnitCount:", objc_msgSend(v10, "count"));
    v26 = [v13 alloc];
    +[GEOApplicationAuditToken currentProcessAuditToken](GEOApplicationAuditToken, "currentProcessAuditToken");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    GEOGetResourceManifestLog();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v38) = 0;
    v29 = (GEOResourceLoader *)objc_msgSend(v26, "initWithTargetDirectory:auditToken:baseURL:alternateURLs:proxyURL:resources:forceUpdateCheck:maximumConcurrentLoads:additionalDirectoryToConsider:log:signpostID:", v42, v27, v41, v39, v40, v10, v38, v11, v12, v28, 0);

    immediateResourceLoader = self->_immediateResourceLoader;
    self->_immediateResourceLoader = v29;

    -[GEOReportedProgress resignCurrent](self->_progress, "resignCurrent");
    v31 = self->_immediateResourceLoader;
    v47[0] = MEMORY[0x1E0C809B0];
    v47[1] = 3221225472;
    v47[2] = __104___GEOResourcesVersionMigrationTask__loadImmediateResources_conditionalWifiResources_completionHandler___block_invoke;
    v47[3] = &unk_1E1C095C8;
    v47[4] = self;
    v9 = v44;
    v54 = v44;
    v48 = v46;
    v49 = v42;
    v50 = v41;
    v51 = v39;
    v55 = v13;
    v56 = v45;
    v52 = v40;
    v53 = v12;
    workQueue = self->_workQueue;
    v33 = v12;
    v34 = v40;
    v35 = v39;
    v36 = v41;
    v37 = v42;
    -[GEOResourceLoader startWithCompletionHandler:callbackQueue:](v31, "startWithCompletionHandler:callbackQueue:", v47, workQueue);

  }
}

- (id)_staleResourceForResource:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  NSObject *v22;
  GEOStaleResource *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  unint64_t v52;
  uint64_t k;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  unint64_t v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  NSObject *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  char v73;
  void *v74;
  char v75;
  id v76;
  NSObject *v77;
  void *v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  char v82;
  id v83;
  NSObject *v84;
  GEOResource *v85;
  void *v86;
  void *v88;
  GEOStaleResource *v89;
  id obj;
  uint64_t v91;
  void *v92;
  uint64_t v93;
  void *v94;
  _GEOResourcesVersionMigrationTask *v95;
  id v96;
  id v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  _QWORD v114[2];
  _QWORD v115[2];
  _BYTE v116[128];
  _BYTE v117[128];
  _QWORD v118[4];
  uint8_t v119[128];
  uint8_t buf[4];
  id v121;
  __int16 v122;
  void *v123;
  _BYTE v124[128];
  uint64_t v125;

  v125 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v89 = objc_alloc_init(GEOStaleResource);
  -[GEOStaleResource setDesiredResource:](v89, "setDesiredResource:", v4);
  v94 = v4;
  objc_msgSend(v4, "filename");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  GEOCanonicalResourceNameForVersionedName(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v112 = 0u;
  v113 = 0u;
  v110 = 0u;
  v111 = 0u;
  v95 = self;
  -[GEOActiveTileGroup activeResources](self->_oldTileGroup, "activeResources");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v110, v124, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v111;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v111 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v110 + 1) + 8 * i);
        if (objc_msgSend(v12, "hasFilename"))
        {
          objc_msgSend(v12, "filename");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          GEOCanonicalResourceNameForVersionedName(v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v14, "isEqualToString:", v6))
          {
            GEOGetResourceManifestLog();
            v15 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
            {
              objc_msgSend(v94, "filename");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "filename");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138478083;
              v121 = v16;
              v122 = 2113;
              v123 = v17;
              _os_log_impl(&dword_1885A9000, v15, OS_LOG_TYPE_INFO, "Found already-loaded fallback resource: '%{private}@' -> '%{private}@'", buf, 0x16u);

            }
            -[_GEOResourcesVersionMigrationTask _resourcesDirectory](v95, "_resourcesDirectory");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "filename");
            v19 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "stringByAppendingPathComponent:", v19);
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            LOBYTE(v19) = objc_msgSend(v21, "fileExistsAtPath:", v20);

            if ((v19 & 1) != 0)
            {
              -[GEOStaleResource setFallbackResource:](v89, "setFallbackResource:", v12);

              goto LABEL_19;
            }
            GEOGetResourceManifestLog();
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              v121 = v20;
              _os_log_impl(&dword_1885A9000, v22, OS_LOG_TYPE_ERROR, "Stale resource does not actually exist on-disk. Ignoring... (%{public}@)", buf, 0xCu);
            }

          }
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v110, v124, 16);
      if (v9)
        continue;
      break;
    }
  }
LABEL_19:

  v23 = v89;
  if (!-[GEOStaleResource hasFallbackResource](v89, "hasFallbackResource"))
  {
    v108 = 0u;
    v109 = 0u;
    v106 = 0u;
    v107 = 0u;
    -[GEOActiveTileGroup staleResources](v95->_oldTileGroup, "staleResources");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v106, v119, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v107;
      v92 = v24;
      while (2)
      {
        for (j = 0; j != v26; ++j)
        {
          if (*(_QWORD *)v107 != v27)
            objc_enumerationMutation(v24);
          v29 = *(void **)(*((_QWORD *)&v106 + 1) + 8 * j);
          objc_msgSend(v29, "fallbackResource");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = objc_msgSend(v30, "hasFilename");

          if (v31)
          {
            objc_msgSend(v29, "fallbackResource");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "filename");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            GEOCanonicalResourceNameForVersionedName(v33);
            v34 = (void *)objc_claimAutoreleasedReturnValue();

            if (objc_msgSend(v34, "isEqualToString:", v6))
            {
              GEOGetResourceManifestLog();
              v35 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
              {
                objc_msgSend(v94, "filename");
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v29, "fallbackResource");
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v37, "filename");
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138478083;
                v121 = v36;
                v122 = 2113;
                v123 = v38;
                _os_log_impl(&dword_1885A9000, v35, OS_LOG_TYPE_INFO, "Found already-loaded (but also stale) fallback resource: '%{private}@' -> '%{private}@'", buf, 0x16u);

              }
              -[_GEOResourcesVersionMigrationTask _resourcesDirectory](v95, "_resourcesDirectory");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "fallbackResource");
              v40 = objc_claimAutoreleasedReturnValue();
              objc_msgSend((id)v40, "filename");
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v39, "stringByAppendingPathComponent:", v41);
              v42 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              LOBYTE(v40) = objc_msgSend(v43, "fileExistsAtPath:", v42);

              if ((v40 & 1) != 0)
              {
                objc_msgSend(v29, "fallbackResource");
                v45 = (void *)objc_claimAutoreleasedReturnValue();
                -[GEOStaleResource setFallbackResource:](v89, "setFallbackResource:", v45);

                objc_msgSend(v29, "originalTimestamp");
                -[GEOStaleResource setOriginalTimestamp:](v89, "setOriginalTimestamp:");

                v24 = v92;
                goto LABEL_38;
              }
              GEOGetResourceManifestLog();
              v44 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543362;
                v121 = v42;
                _os_log_impl(&dword_1885A9000, v44, OS_LOG_TYPE_ERROR, "Stale resource does not actually exist on-disk. Ignoring... (%{public}@)", buf, 0xCu);
              }

              v24 = v92;
            }

          }
        }
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v106, v119, 16);
        if (v26)
          continue;
        break;
      }
    }
LABEL_38:

    v23 = v89;
  }
  if (!-[GEOStaleResource hasFallbackResource](v23, "hasFallbackResource"))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "__geoBundle");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "resourcePath");
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    v88 = v47;
    if (v47)
    {
      v118[0] = v47;
      objc_msgSend(v47, "stringByAppendingPathComponent:", CFSTR("InitialResources@3x"));
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v118[1] = v48;
      objc_msgSend(v47, "stringByAppendingPathComponent:", CFSTR("InitialResources@2x"));
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v118[2] = v49;
      objc_msgSend(v47, "stringByAppendingPathComponent:", CFSTR("InitialResources"));
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v118[3] = v50;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v118, 4);
      v51 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v51 = 0;
    }
    v104 = 0u;
    v105 = 0u;
    v102 = 0u;
    v103 = 0u;
    obj = v51;
    v93 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v102, v117, 16);
    if (v93)
    {
      v91 = *(_QWORD *)v103;
      v52 = 0x1E0CB3000uLL;
      while (2)
      {
        for (k = 0; k != v93; ++k)
        {
          if (*(_QWORD *)v103 != v91)
            objc_enumerationMutation(obj);
          v54 = *(void **)(*((_QWORD *)&v102 + 1) + 8 * k);
          objc_msgSend(*(id *)(v52 + 1568), "defaultManager");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "contentsOfDirectoryAtPath:error:", v54, 0);
          v56 = (void *)objc_claimAutoreleasedReturnValue();

          v100 = 0u;
          v101 = 0u;
          v98 = 0u;
          v99 = 0u;
          v57 = v56;
          v58 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v98, v116, 16);
          v59 = v57;
          if (v58)
          {
            v60 = v58;
            v61 = v52;
            v62 = *(_QWORD *)v99;
LABEL_50:
            v63 = 0;
            while (1)
            {
              if (*(_QWORD *)v99 != v62)
                objc_enumerationMutation(v57);
              v64 = *(void **)(*((_QWORD *)&v98 + 1) + 8 * v63);
              GEOCanonicalResourceNameForVersionedName(v64);
              v65 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_msgSend(v65, "isEqualToString:", v6) & 1) != 0)
                break;

              if (v60 == ++v63)
              {
                v60 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v98, v116, 16);
                if (v60)
                  goto LABEL_50;
                v59 = v57;
                goto LABEL_65;
              }
            }
            objc_msgSend(v54, "stringByAppendingPathComponent:", v64);
            v66 = (void *)objc_claimAutoreleasedReturnValue();

            v52 = v61;
            if (!v66)
              goto LABEL_67;
            objc_msgSend(v66, "lastPathComponent");
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            GEOGetResourceManifestLog();
            v68 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
            {
              objc_msgSend(v94, "filename");
              v69 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138478083;
              v121 = v69;
              v122 = 2113;
              v123 = v67;
              _os_log_impl(&dword_1885A9000, v68, OS_LOG_TYPE_INFO, "Found fallback resource bundled in GeoServices.framework: '%{private}@' -> '%{private}@'", buf, 0x16u);

            }
            objc_msgSend(v66, "stringByResolvingSymlinksInPath");
            v59 = (void *)objc_claimAutoreleasedReturnValue();

            -[_GEOResourcesVersionMigrationTask _resourcesDirectory](v95, "_resourcesDirectory");
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v70, "stringByAppendingPathComponent:", v67);
            v71 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(*(id *)(v61 + 1568), "defaultManager");
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            v73 = objc_msgSend(v72, "fileExistsAtPath:", v71);

            if ((v73 & 1) == 0)
            {
              objc_msgSend(*(id *)(v61 + 1568), "defaultManager");
              v74 = (void *)objc_claimAutoreleasedReturnValue();
              v97 = 0;
              v75 = objc_msgSend(v74, "copyItemAtPath:toPath:error:", v59, v71, &v97);
              v76 = v97;

              if ((v75 & 1) == 0)
              {
                GEOGetResourceManifestLog();
                v77 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138543362;
                  v121 = v76;
                  _os_log_impl(&dword_1885A9000, v77, OS_LOG_TYPE_ERROR, "Failed to copy (stale) bundled resource: %{public}@", buf, 0xCu);
                }

LABEL_65:
                v52 = v61;
                goto LABEL_66;
              }
              objc_msgSend(*(id *)(v61 + 1568), "defaultManager");
              v78 = (void *)objc_claimAutoreleasedReturnValue();
              v79 = *MEMORY[0x1E0CB2AE0];
              v80 = *MEMORY[0x1E0CB2AA8];
              v114[0] = *MEMORY[0x1E0CB2AD8];
              v114[1] = v80;
              v115[0] = v79;
              v115[1] = &unk_1E1E811C0;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v115, v114, 2);
              v81 = (void *)objc_claimAutoreleasedReturnValue();
              v96 = 0;
              v82 = objc_msgSend(v78, "setAttributes:ofItemAtPath:error:", v81, v71, &v96);
              v83 = v96;

              if ((v82 & 1) == 0)
              {
                GEOGetResourceManifestLog();
                v84 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138543362;
                  v121 = v83;
                  _os_log_impl(&dword_1885A9000, v84, OS_LOG_TYPE_ERROR, "Failed to set permissions for resource: %{public}@", buf, 0xCu);
                }

              }
            }
            v85 = objc_alloc_init(GEOResource);
            -[GEOResource setFilename:](v85, "setFilename:", v67);
            GEOCalculateSHA1ForFile(v71);
            v86 = (void *)objc_claimAutoreleasedReturnValue();
            -[GEOResource setChecksum:](v85, "setChecksum:", v86);

            v23 = v89;
            -[GEOStaleResource setFallbackResource:](v89, "setFallbackResource:", v85);

            goto LABEL_76;
          }
LABEL_66:

LABEL_67:
        }
        v23 = v89;
        v93 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v102, v117, 16);
        if (v93)
          continue;
        break;
      }
    }
LABEL_76:

  }
  if (!-[GEOStaleResource hasOriginalTimestamp](v23, "hasOriginalTimestamp"))
    -[GEOStaleResource setOriginalTimestamp:](v23, "setOriginalTimestamp:", CFAbsoluteTimeGetCurrent());

  return v23;
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
  objc_storeStrong((id *)&self->_powerAssertion, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_unloadedConditionalResources, 0);
  objc_storeStrong((id *)&self->_loadedResources, 0);
  objc_storeStrong((id *)&self->_wifiOnlyResourceLoader, 0);
  objc_storeStrong((id *)&self->_immediateResourceLoader, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_activeNames, 0);
  objc_storeStrong((id *)&self->_activeScenarios, 0);
  objc_storeStrong((id *)&self->_activeScales, 0);
  objc_storeStrong((id *)&self->_oldTileGroup, 0);
  objc_storeStrong((id *)&self->_preferredDataSet, 0);
  objc_storeStrong((id *)&self->_resourceManifest, 0);
  objc_storeStrong((id *)&self->_newTileGroup, 0);
  objc_storeStrong((id *)&self->_manifestConfiguration, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_migrator);
}

@end
