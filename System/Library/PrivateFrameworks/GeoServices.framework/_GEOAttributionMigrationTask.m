@implementation _GEOAttributionMigrationTask

- (_GEOAttributionMigrationTask)init
{
  _GEOAttributionMigrationTask *result;

  result = (_GEOAttributionMigrationTask *)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GEOMethodNotAvailableException"), CFSTR("This method is unavailable."));
  __break(1u);
  return result;
}

- (_GEOAttributionMigrationTask)initWithMigrator:(id)a3 manifestConfiguration:(id)a4 newTileGroup:(id)a5 inResourceManifest:(id)a6 oldTileGroup:(id)a7 dataSet:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  _GEOAttributionMigrationTask *v18;
  _GEOAttributionMigrationTask *v19;
  uint64_t v20;
  OS_dispatch_queue *workQueue;
  uint64_t v22;
  GEOReportedProgress *progress;
  _GEOAttributionMigrationTask *v24;
  id v26;
  id v27;
  objc_super v28;

  v14 = a3;
  v27 = a4;
  v26 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v28.receiver = self;
  v28.super_class = (Class)_GEOAttributionMigrationTask;
  v18 = -[_GEOAttributionMigrationTask init](&v28, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeWeak((id *)&v18->_migrator, v14);
    objc_storeStrong((id *)&v19->_manifestConfiguration, a4);
    objc_storeStrong((id *)&v19->_newTileGroup, a5);
    objc_storeStrong((id *)&v19->_resourceManifest, a6);
    objc_storeStrong((id *)&v19->_oldTileGroup, a7);
    objc_storeStrong((id *)&v19->_dataSetDescription, a8);
    v20 = geo_dispatch_queue_create();
    workQueue = v19->_workQueue;
    v19->_workQueue = (OS_dispatch_queue *)v20;

    +[GEOReportedProgress progressWithTotalUnitCount:](GEOReportedProgress, "progressWithTotalUnitCount:", -1, v26, v27);
    v22 = objc_claimAutoreleasedReturnValue();
    progress = v19->_progress;
    v19->_progress = (GEOReportedProgress *)v22;

    v24 = v19;
  }

  return v19;
}

- (int64_t)estimatedWeight
{
  return 0;
}

- (NSProgress)progress
{
  return -[GEOReportedProgress progress](self->_progress, "progress");
}

- (void)startWithCompletionHandler:(id)a3 callbackQueue:(id)a4
{
  id v6;
  id v7;
  NSObject *workQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73___GEOAttributionMigrationTask_startWithCompletionHandler_callbackQueue___block_invoke;
  block[3] = &unk_1E1C00BB8;
  v12 = v7;
  v13 = v6;
  block[4] = self;
  v9 = v7;
  v10 = v6;
  dispatch_async(workQueue, block);

}

- (BOOL)_hasExistingUsableDownloadForURL:(id)a3 withChecksum:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  int v14;
  NSObject *v15;
  _BOOL4 v16;
  const char *v17;
  int v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(a3, "lastPathComponent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSURL URLByAppendingPathComponent:](self->_destinationDirectory, "URLByAppendingPathComponent:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "path");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "fileExistsAtPath:", v10);

  if (v11)
  {
    if (v6)
    {
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfURL:options:error:", v8, 1, 0);
      objc_msgSend(v12, "_geo_SHA256Hash");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "isEqualToData:", v6);
      GEOGetResourceManifestLog();
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = os_log_type_enabled(v15, OS_LOG_TYPE_INFO);
      if (v14)
      {
        if (v16)
        {
          v19 = 138543362;
          v20 = v7;
          v17 = "[Attribution] Existing file %{public}@ matches expected checksum";
LABEL_10:
          _os_log_impl(&dword_1885A9000, v15, OS_LOG_TYPE_INFO, v17, (uint8_t *)&v19, 0xCu);
        }
      }
      else if (v16)
      {
        v19 = 138543362;
        v20 = v7;
        v17 = "[Attribution] Existing file %{public}@ does not match expected checksum";
        goto LABEL_10;
      }

      goto LABEL_12;
    }
    LOBYTE(v14) = 1;
  }
  else
  {
    LOBYTE(v14) = 0;
  }
LABEL_12:

  return v14;
}

- (void)_startWithCompletionHandler:(id)a3 callbackQueue:(id)a4
{
  id v6;
  id WeakRetained;
  NSURL *v8;
  NSURL *destinationDirectory;
  void *v10;
  id completionHandler;
  void *v12;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  BOOL v24;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  _BOOL4 v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  NSMutableArray *v33;
  NSMutableArray *inProgressTasks;
  NSMutableArray *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  NSObject *v43;
  void *v44;
  id v45;
  id v46;
  id obj;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _QWORD v52[5];
  uint8_t v53[128];
  uint8_t buf[4];
  uint64_t v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v45 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_migrator);
  objc_msgSend(WeakRetained, "_addRunningTask:", self);

  +[GEOFilePaths urlFor:](GEOFilePaths, "urlFor:", 20);
  v8 = (NSURL *)objc_claimAutoreleasedReturnValue();
  destinationDirectory = self->_destinationDirectory;
  self->_destinationDirectory = v8;

  objc_storeStrong((id *)&self->_callbackQueue, a4);
  v46 = v6;
  v10 = (void *)objc_msgSend(v6, "copy");
  completionHandler = self->_completionHandler;
  self->_completionHandler = v10;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  obj = (id)objc_claimAutoreleasedReturnValue();
  if (-[GEOTileGroup attributionIndexsCount](self->_newTileGroup, "attributionIndexsCount"))
  {
    v14 = 0;
    while (1)
    {
      v15 = -[GEOTileGroup attributionIndexAtIndex:](self->_newTileGroup, "attributionIndexAtIndex:", v14);
      if (-[GEOResources attributionsCount](self->_resourceManifest, "attributionsCount") <= v15)
        break;
      -[GEOResources attributionAtIndex:](self->_resourceManifest, "attributionAtIndex:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16;
      if (!self->_dataSetDescription
        || !objc_msgSend(v16, "hasDataSet")
        || (v18 = objc_msgSend(v17, "dataSet"),
            v18 == -[GEODataSetDescription identifier](self->_dataSetDescription, "identifier")))
      {
        if (objc_msgSend(v17, "hasPlainTextURL"))
        {
          v19 = (void *)MEMORY[0x1E0C99E98];
          objc_msgSend(v17, "plainTextURL");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "URLWithString:", v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          if (v21)
          {
            objc_msgSend(v21, "lastPathComponent");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v22, "length"))
            {
              objc_msgSend(v12, "addObject:", v22);
              objc_msgSend(v17, "plainTextURLSHA256Checksum");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              v24 = -[_GEOAttributionMigrationTask _hasExistingUsableDownloadForURL:withChecksum:](self, "_hasExistingUsableDownloadForURL:withChecksum:", v21, v23);

              if (!v24)
              {
                objc_msgSend(v13, "addObject:", v21);
                if (objc_msgSend(v17, "hasPlainTextURLSHA256Checksum"))
                {
                  objc_msgSend(v17, "plainTextURLSHA256Checksum");
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(obj, "setObject:forKey:", v25, v21);

                }
              }
            }
            else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: filename.length > 0", buf, 2u);
            }

          }
        }
      }

      if (++v14 >= -[GEOTileGroup attributionIndexsCount](self->_newTileGroup, "attributionIndexsCount"))
        goto LABEL_19;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Attribution index %i outside of list length %lu"), v15, -[GEOResources attributionsCount](self->_resourceManifest, "attributionsCount"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    GEOGetResourceManifestLog();
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v55 = (uint64_t)v42;
      _os_log_impl(&dword_1885A9000, v43, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
    }

    -[GEOReportedProgress setTotalUnitCount:](self->_progress, "setTotalUnitCount:", 1);
    objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -13, v42);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[_GEOAttributionMigrationTask _finishWithError:](self, "_finishWithError:", v44);

    goto LABEL_36;
  }
LABEL_19:
  objc_storeStrong((id *)&self->_allAttributionFilenames, v12);
  objc_storeStrong((id *)&self->_urlToChecksum, obj);
  v26 = objc_msgSend(v13, "count");
  GEOGetResourceManifestLog();
  v27 = objc_claimAutoreleasedReturnValue();
  v28 = os_log_type_enabled(v27, OS_LOG_TYPE_INFO);
  if (!v26)
  {
    if (v28)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1885A9000, v27, OS_LOG_TYPE_INFO, "[Attribution] No new plain-text attribution to download. Finished", buf, 2u);
    }

    -[GEOReportedProgress setTotalUnitCount:](self->_progress, "setTotalUnitCount:", 1);
    -[_GEOAttributionMigrationTask _finishWithError:](self, "_finishWithError:", 0);
LABEL_36:
    v37 = v45;
    v41 = v46;
    goto LABEL_37;
  }
  if (v28)
  {
    v29 = objc_msgSend(v13, "count");
    *(_DWORD *)buf = 134217984;
    v55 = v29;
    _os_log_impl(&dword_1885A9000, v27, OS_LOG_TYPE_INFO, "[Attribution] Need to load %llu plain-text attributions", buf, 0xCu);
  }

  objc_msgSend(v13, "allObjects");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "_geo_map:", &__block_literal_global_21);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  v52[0] = MEMORY[0x1E0C809B0];
  v52[1] = 3221225472;
  v52[2] = __74___GEOAttributionMigrationTask__startWithCompletionHandler_callbackQueue___block_invoke_2;
  v52[3] = &unk_1E1C02A38;
  v52[4] = self;
  objc_msgSend(v31, "_geo_map:", v52);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = (NSMutableArray *)objc_msgSend(v32, "mutableCopy");
  inProgressTasks = self->_inProgressTasks;
  self->_inProgressTasks = v33;

  -[GEOReportedProgress setTotalUnitCount:](self->_progress, "setTotalUnitCount:", -[NSMutableArray count](self->_inProgressTasks, "count"));
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v35 = self->_inProgressTasks;
  v36 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v35, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
  v37 = v45;
  if (v36)
  {
    v38 = v36;
    v39 = *(_QWORD *)v49;
    do
    {
      v40 = 0;
      do
      {
        if (*(_QWORD *)v49 != v39)
          objc_enumerationMutation(v35);
        objc_msgSend(*(id *)(*((_QWORD *)&v48 + 1) + 8 * v40++), "start");
      }
      while (v38 != v40);
      v38 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v35, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
    }
    while (v38);
  }

  v41 = v46;
LABEL_37:

}

- (void)_finishWithError:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __49___GEOAttributionMigrationTask__finishWithError___block_invoke;
  v6[3] = &unk_1E1C00738;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  GEOOnce((uint64_t)&self->_finished, v6);

}

- (void)_finishedAllTasks
{
  -[_GEOAttributionMigrationTask _finishWithError:](self, "_finishWithError:", 0);
}

- (void)cancel
{
  NSObject *workQueue;
  _QWORD block[5];

  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38___GEOAttributionMigrationTask_cancel__block_invoke;
  block[3] = &unk_1E1BFF6F8;
  block[4] = self;
  dispatch_async(workQueue, block);
}

- (void)removeOldData:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  void *v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", self->_destinationDirectory, 0, 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v19;
    *(_QWORD *)&v8 = 138543362;
    v17 = v8;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v11);
        objc_msgSend(v12, "lastPathComponent", v17, (_QWORD)v18);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v13, "length"))
        {
          if (!-[NSSet containsObject:](self->_allAttributionFilenames, "containsObject:", v13))
          {
            GEOGetResourceManifestLog();
            v14 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = v17;
              v23 = v13;
              _os_log_impl(&dword_1885A9000, v14, OS_LOG_TYPE_DEBUG, "[Attribution] Removing %{public}@", buf, 0xCu);
            }

            objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "removeItemAtURL:error:", v12, 0);

          }
        }
        else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: fileName.length > 0", buf, 2u);
        }

        ++v11;
      }
      while (v9 != v11);
      v16 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
      v9 = v16;
    }
    while (v16);
  }

}

- (void)dataURLSession:(id)a3 didCompleteTask:(id)a4
{
  id v5;
  int64_t v6;
  int64_t v7;
  GEOReportedProgress *progress;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSDictionary *urlToChecksum;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  NSObject *v29;
  void *v30;
  char v31;
  void *v32;
  void *v33;
  int v34;
  int v35;
  void *v36;
  void *v37;
  void *v38;
  char v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  void *v47;
  NSObject *v48;
  const char *v49;
  NSObject *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  NSObject *v55;
  void *v56;
  id v57;
  id v58;
  id v59;
  unsigned __int8 v60;
  id v61;
  _QWORD v62[2];
  _QWORD v63[2];
  uint8_t buf[4];
  id v65;
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  -[NSMutableArray removeObject:](self->_inProgressTasks, "removeObject:", v5);
  v6 = -[GEOReportedProgress totalUnitCount](self->_progress, "totalUnitCount");
  v7 = -[GEOReportedProgress completedUnitCount](self->_progress, "completedUnitCount");
  progress = self->_progress;
  if (v6 <= v7)
    v9 = -[GEOReportedProgress totalUnitCount](progress, "totalUnitCount");
  else
    v9 = -[GEOReportedProgress completedUnitCount](progress, "completedUnitCount") + 1;
  -[GEOReportedProgress setCompletedUnitCount:](self->_progress, "setCompletedUnitCount:", v9);
  objc_msgSend(v5, "error");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    objc_msgSend(v5, "downloadedFileURL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -13, CFSTR("Unexpectedly-missing file URL"));
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
    objc_msgSend(v5, "originalURLRequest");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "URL");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "lastPathComponent");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: filename != nil", buf, 2u);
      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -13, CFSTR("Unexpectedly-empty file name"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[_GEOAttributionMigrationTask _finishWithError:](self, "_finishWithError:", v16);
      goto LABEL_44;
    }
    -[NSURL URLByAppendingPathComponent:](self->_destinationDirectory, "URLByAppendingPathComponent:", v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    GEOGetResourceManifestLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543362;
      v65 = v12;
      _os_log_impl(&dword_1885A9000, v17, OS_LOG_TYPE_DEBUG, "[Attribution] Finished downloading %{public}@", buf, 0xCu);
    }

    urlToChecksum = self->_urlToChecksum;
    objc_msgSend(v5, "originalURLRequest");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "URL");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKeyedSubscript:](urlToChecksum, "objectForKeyedSubscript:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      v22 = objc_alloc(MEMORY[0x1E0C99D50]);
      objc_msgSend(v5, "downloadedFileURL");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (id)objc_msgSend(v22, "initWithContentsOfURL:", v23);

      if (v24)
      {
        objc_msgSend(v24, "_geo_SHA256Hash");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v25, "isEqualToData:", v21) & 1) == 0)
        {
          GEOGetResourceManifestLog();
          v50 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v50, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138543362;
            v65 = v21;
            _os_log_impl(&dword_1885A9000, v50, OS_LOG_TYPE_FAULT, "[Attribution] Checksum of downloaded file %{public}@ does not match expected value", buf, 0xCu);
          }

          objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -11, CFSTR("Checksum mismatch"));
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          -[_GEOAttributionMigrationTask _finishWithError:](self, "_finishWithError:", v51);

          goto LABEL_43;
        }

      }
    }
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "path");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v26, "fileExistsAtPath:", v27);

    if (v28)
    {
      GEOGetResourceManifestLog();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        v65 = v16;
        _os_log_impl(&dword_1885A9000, v29, OS_LOG_TYPE_INFO, "[Attribution] File already exists at destination. Will overwrite. (%{public}@)", buf, 0xCu);
      }

      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = 0;
      v31 = objc_msgSend(v30, "removeItemAtURL:error:", v16, &v61);
      v24 = v61;

      if ((v31 & 1) == 0)
      {
        GEOGetResourceManifestLog();
        v48 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v65 = v24;
          v49 = "[Attribution] Error removing existing file at path: %{public}@";
          goto LABEL_38;
        }
LABEL_39:

        -[_GEOAttributionMigrationTask _finishWithError:](self, "_finishWithError:", v24);
LABEL_43:

LABEL_44:
        goto LABEL_45;
      }

    }
    v60 = 0;
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSURL path](self->_destinationDirectory, "path");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v32, "fileExistsAtPath:isDirectory:", v33, &v60);
    v35 = v60;

    if (!v34 || !v35)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", self->_destinationDirectory, 1, 0, 0);

    }
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "downloadedFileURL");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = 0;
    v39 = objc_msgSend(v37, "moveItemAtURL:toURL:error:", v38, v16, &v59);
    v24 = v59;

    if ((v39 & 1) != 0)
    {
      v56 = v21;
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "path");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = 0;
      objc_msgSend(v40, "attributesOfItemAtPath:error:", v41, &v58);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = v58;

      if (!v43)
      {
        v44 = *MEMORY[0x1E0CB2AA8];
        objc_msgSend(v42, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2AA8]);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = objc_msgSend(v45, "isEqualToNumber:", &unk_1E1E80AE8);

        if ((v46 & 1) == 0)
        {
          v52 = *MEMORY[0x1E0CB2AE0];
          v62[0] = *MEMORY[0x1E0CB2AD8];
          v62[1] = v44;
          v63[0] = v52;
          v63[1] = &unk_1E1E80AE8;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v63, v62, 2);
          v47 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "path");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          v57 = 0;
          objc_msgSend(v53, "setAttributes:ofItemAtPath:error:", v47, v54, &v57);
          v43 = v57;

          if (v43)
          {
            GEOGetResourceManifestLog();
            v55 = objc_claimAutoreleasedReturnValue();
            v21 = v56;
            if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              v65 = v43;
              _os_log_impl(&dword_1885A9000, v55, OS_LOG_TYPE_ERROR, "[Attribution] Couldn't set permissions for attribution file: %{public}@", buf, 0xCu);
            }

            goto LABEL_30;
          }
LABEL_29:
          v21 = v56;
LABEL_30:
          if (!-[NSMutableArray count](self->_inProgressTasks, "count"))
            -[_GEOAttributionMigrationTask _finishedAllTasks](self, "_finishedAllTasks");

          goto LABEL_43;
        }
        v43 = 0;
      }
      v47 = v42;
      goto LABEL_29;
    }
    GEOGetResourceManifestLog();
    v48 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v65 = v24;
      v49 = "[Attribution] Failed to move downloaded file to destination: %{public}@";
LABEL_38:
      _os_log_impl(&dword_1885A9000, v48, OS_LOG_TYPE_ERROR, v49, buf, 0xCu);
      goto LABEL_39;
    }
    goto LABEL_39;
  }
  objc_msgSend(v5, "error");
  v11 = objc_claimAutoreleasedReturnValue();
LABEL_6:
  v12 = (void *)v11;
  -[_GEOAttributionMigrationTask _finishWithError:](self, "_finishWithError:", v11);
LABEL_45:

}

- (GEOActiveTileGroupMigrationTaskOptions)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
  objc_storeStrong((id *)&self->_options, a3);
}

- (NSObject)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
  objc_storeStrong((id *)&self->_transaction, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlToChecksum, 0);
  objc_storeStrong((id *)&self->_allAttributionFilenames, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_destinationDirectory, 0);
  objc_storeStrong((id *)&self->_inProgressTasks, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_dataSetDescription, 0);
  objc_storeStrong((id *)&self->_oldTileGroup, 0);
  objc_storeStrong((id *)&self->_resourceManifest, 0);
  objc_storeStrong((id *)&self->_newTileGroup, 0);
  objc_storeStrong((id *)&self->_manifestConfiguration, 0);
  objc_destroyWeak((id *)&self->_migrator);
}

@end
