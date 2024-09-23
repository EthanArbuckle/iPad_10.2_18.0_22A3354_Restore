@implementation _GEOSearchAttributionManifestVersionMigrationTask

- (_GEOSearchAttributionManifestVersionMigrationTask)init
{
  _GEOSearchAttributionManifestVersionMigrationTask *result;

  result = (_GEOSearchAttributionManifestVersionMigrationTask *)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GEOMethodNotAvailableException"), CFSTR("This method is unavailable."));
  __break(1u);
  return result;
}

- (_GEOSearchAttributionManifestVersionMigrationTask)initWithMigrator:(id)a3 newSearchAttributionManifestURL:(id)a4 oldTileGroup:(id)a5
{
  id v8;
  id v9;
  id v10;
  _GEOSearchAttributionManifestVersionMigrationTask *v11;
  _GEOSearchAttributionManifestVersionMigrationTask *v12;
  uint64_t v13;
  OS_dispatch_queue *workQueue;
  uint64_t v15;
  NSURL *newSearchAttributionManifestURL;
  uint64_t v17;
  GEOReportedProgress *progress;
  GEOReportedProgress *v19;
  _GEOSearchAttributionManifestVersionMigrationTask *v20;
  _QWORD v22[4];
  id v23;
  id location;
  objc_super v25;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v25.receiver = self;
  v25.super_class = (Class)_GEOSearchAttributionManifestVersionMigrationTask;
  v11 = -[_GEOSearchAttributionManifestVersionMigrationTask init](&v25, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_migrator, v8);
    geo_dispatch_queue_create_with_workloop_qos();
    v13 = objc_claimAutoreleasedReturnValue();
    workQueue = v12->_workQueue;
    v12->_workQueue = (OS_dispatch_queue *)v13;

    v15 = objc_msgSend(v9, "copy");
    newSearchAttributionManifestURL = v12->_newSearchAttributionManifestURL;
    v12->_newSearchAttributionManifestURL = (NSURL *)v15;

    objc_storeStrong((id *)&v12->_oldTileGroup, a5);
    +[GEOReportedProgress progressWithTotalUnitCount:](GEOReportedProgress, "progressWithTotalUnitCount:", 1);
    v17 = objc_claimAutoreleasedReturnValue();
    progress = v12->_progress;
    v12->_progress = (GEOReportedProgress *)v17;

    -[GEOReportedProgress setKind:](v12->_progress, "setKind:", *MEMORY[0x1E0CB30F8]);
    objc_initWeak(&location, v12);
    v19 = v12->_progress;
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __115___GEOSearchAttributionManifestVersionMigrationTask_initWithMigrator_newSearchAttributionManifestURL_oldTileGroup___block_invoke;
    v22[3] = &unk_1E1BFF8B0;
    objc_copyWeak(&v23, &location);
    -[GEOReportedProgress setCancellationHandler:](v19, "setCancellationHandler:", v22);
    v20 = v12;
    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }

  return v12;
}

- (void)dealloc
{
  objc_super v3;

  -[NSURLSession invalidateAndCancel](self->_urlSession, "invalidateAndCancel");
  v3.receiver = self;
  v3.super_class = (Class)_GEOSearchAttributionManifestVersionMigrationTask;
  -[_GEOSearchAttributionManifestVersionMigrationTask dealloc](&v3, sel_dealloc);
}

- (int64_t)estimatedWeight
{
  return 1;
}

- (NSProgress)progress
{
  return -[GEOReportedProgress progress](self->_progress, "progress");
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
  block[2] = __94___GEOSearchAttributionManifestVersionMigrationTask_startWithCompletionHandler_callbackQueue___block_invoke;
  block[3] = &unk_1E1C00BB8;
  v13 = v7;
  v14 = v6;
  block[4] = self;
  v10 = v7;
  v11 = v6;
  dispatch_async(workQueue, block);

}

- (void)_handleResponse:(id)a3 withData:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  GEOSearchAttributionManifest *v10;
  NSURLSessionDataTask *downloadTask;
  GEORequestCounterTicket *requestCounterTicket;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  const __CFString *v17;
  GEOSearchAttributionManifest *v18;
  GEOSearchAttributionManifest *v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  id v32;
  uint8_t buf[4];
  GEOSearchAttributionManifest *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (GEOSearchAttributionManifest *)a5;
  downloadTask = self->_downloadTask;
  self->_downloadTask = 0;

  requestCounterTicket = self->_requestCounterTicket;
  self->_requestCounterTicket = 0;

  if (v10)
  {
    -[GEOSearchAttributionManifest domain](v10, "domain");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0CB32E8]) & 1) != 0)
    {
      v14 = -[GEOSearchAttributionManifest code](v10, "code");

      if (v14 == -999)
      {
        v15 = (void *)MEMORY[0x1E0CB35C8];
        v16 = -2;
        v17 = 0;
        goto LABEL_11;
      }
    }
    else
    {

    }
  }
  if (!v9)
  {
    v19 = 0;
    goto LABEL_12;
  }
  v18 = -[GEOSearchAttributionManifest initWithData:]([GEOSearchAttributionManifest alloc], "initWithData:", v9);
  if (v18)
  {
    v19 = v18;
    goto LABEL_12;
  }
  v15 = (void *)MEMORY[0x1E0CB35C8];
  v17 = CFSTR("Could not parse attribution manifest");
  v16 = -11;
LABEL_11:
  objc_msgSend(v15, "GEOErrorWithCode:reason:", v16, v17);
  v20 = objc_claimAutoreleasedReturnValue();

  v19 = 0;
  v10 = (GEOSearchAttributionManifest *)v20;
LABEL_12:
  -[GEORequestCounterTicket requestCompleted:](self->_requestCounterTicket, "requestCompleted:", v10);
  if (v10)
  {
    GEOFindOrCreateLog("com.apple.GeoServices", "ResourceManifest");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v34 = v10;
      _os_log_impl(&dword_1885A9000, v21, OS_LOG_TYPE_ERROR, "[SearchAttributionManifest] Failed to load new attribution manifest: %{public}@", buf, 0xCu);
    }

    -[_GEOSearchAttributionManifestVersionMigrationTask _completeWithError:](self, "_completeWithError:", v10);
  }
  else
  {
    -[GEOSearchAttributionManifest setTimestamp:](v19, "setTimestamp:", CFAbsoluteTimeGetCurrent());
    objc_msgSend(v8, "URL");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "absoluteString");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOSearchAttributionManifest setSourceURL:](v19, "setSourceURL:", v23);

    GEOFindOrCreateLog("com.apple.GeoServices", "ResourceManifest");
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1885A9000, v24, OS_LOG_TYPE_INFO, "[SearchAttributionManifest] Received valid new search attribution manifest.", buf, 2u);
    }

    GEOFindOrCreateLog("com.apple.GeoServices", "ResourceManifest");
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543362;
      v34 = v19;
      _os_log_impl(&dword_1885A9000, v25, OS_LOG_TYPE_DEBUG, "[SearchAttributionManifest] New search attribution manifest: %{public}@", buf, 0xCu);
    }

    +[GEOFilePaths pathFor:](GEOFilePaths, "pathFor:", 30);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "stringByDeletingLastPathComponent");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    buf[0] = 0;
    if (!objc_msgSend(v28, "fileExistsAtPath:isDirectory:", v27, buf) || !buf[0])
      objc_msgSend(v28, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v27, 1, 0, 0);
    -[GEOSearchAttributionManifest data](v19, "data");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    +[GEOFilePaths pathFor:](GEOFilePaths, "pathFor:", 30);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 0;
    v31 = objc_msgSend(v29, "writeToFile:options:error:", v30, 268435457, &v32);
    v10 = (GEOSearchAttributionManifest *)v32;

    if (v31)
    {
      notify_post(GEOSearchAttributionManifestUpdatedDarwinNotificationName);
      objc_storeStrong((id *)&self->_attributionManifest, v19);
    }
    -[_GEOSearchAttributionManifestVersionMigrationTask _completeWithError:](self, "_completeWithError:", v10);

  }
}

- (void)cancel
{
  NSObject *workQueue;
  _QWORD block[5];

  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59___GEOSearchAttributionManifestVersionMigrationTask_cancel__block_invoke;
  block[3] = &unk_1E1BFF6F8;
  block[4] = self;
  dispatch_async(workQueue, block);
}

- (void)_completeWithError:(id)a3
{
  id v4;
  void *v5;
  OS_dispatch_queue *v6;
  id completionHandler;
  OS_dispatch_queue *callbackQueue;
  id WeakRetained;
  _QWORD v10[4];
  id v11;
  id v12;

  v4 = a3;
  v5 = (void *)MEMORY[0x18D765024](self->_completionHandler);
  v6 = self->_callbackQueue;
  completionHandler = self->_completionHandler;
  self->_completionHandler = 0;

  callbackQueue = self->_callbackQueue;
  self->_callbackQueue = 0;

  -[GEOReportedProgress setCompletedUnitCount:](self->_progress, "setCompletedUnitCount:", -[GEOReportedProgress totalUnitCount](self->_progress, "totalUnitCount"));
  if (v5 && v6)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __72___GEOSearchAttributionManifestVersionMigrationTask__completeWithError___block_invoke;
    v10[3] = &unk_1E1BFF970;
    v12 = v5;
    v11 = v4;
    dispatch_async((dispatch_queue_t)v6, v10);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_migrator);
  objc_msgSend(WeakRetained, "_removeRunningTask:", self);

}

- (void)removeOldData:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  char v9;
  uint64_t j;
  id *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  id *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  char v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  id obj;
  uint64_t v38;
  uint64_t v40;
  uint64_t v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char v47;
  uint64_t v48;
  void *v49;
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
  __int128 v68;
  __int128 v69;
  uint8_t buf[4];
  uint64_t v71;
  _BYTE v72[128];
  _BYTE v73[128];
  _BYTE v74[128];
  _BYTE v75[128];
  _BYTE v76[128];
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v36 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[GEOFilePaths pathFor:](GEOFilePaths, "pathFor:", 16);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentsOfDirectoryAtPath:error:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v68 = 0u;
  v69 = 0u;
  v66 = 0u;
  v67 = 0u;
  obj = v5;
  v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v76, 16);
  if (v40)
  {
    v38 = *(_QWORD *)v67;
    do
    {
      for (i = 0; i != v40; ++i)
      {
        if (*(_QWORD *)v67 != v38)
          objc_enumerationMutation(obj);
        v7 = *(_QWORD *)(*((_QWORD *)&v66 + 1) + 8 * i);
        v62 = 0u;
        v63 = 0u;
        v64 = 0u;
        v65 = 0u;
        -[GEOSearchAttributionManifest searchAttributionSources]((id *)&self->_attributionManifest->super.super.isa);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v62, v75, 16);
        if (!v48)
        {

LABEL_43:
          GEOFindOrCreateLog("com.apple.GeoServices", "ResourceManifest");
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138543362;
            v71 = v7;
            _os_log_impl(&dword_1885A9000, v32, OS_LOG_TYPE_DEBUG, "[SearchAttributionManifest] Removing %{public}@", buf, 0xCu);
          }

          objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          +[GEOFilePaths pathFor:](GEOFilePaths, "pathFor:", 16);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "stringByAppendingPathComponent:", v7);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "removeItemAtPath:error:", v35, 0);

          continue;
        }
        v41 = i;
        v42 = v8;
        v9 = 0;
        v46 = *(_QWORD *)v63;
        do
        {
          for (j = 0; j != v48; ++j)
          {
            if (*(_QWORD *)v63 != v46)
              objc_enumerationMutation(v42);
            v11 = *(id **)(*((_QWORD *)&v62 + 1) + 8 * j);
            v58 = 0u;
            v59 = 0u;
            v60 = 0u;
            v61 = 0u;
            -[GEOSearchAttributionSource localizedAttributions](v11);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v58, v74, 16);
            if (v13)
            {
              v14 = *(_QWORD *)v59;
              v15 = v9;
              v43 = *(_QWORD *)v59;
              v49 = v12;
              while (2)
              {
                v16 = 0;
                v44 = v13;
                do
                {
                  v47 = v15;
                  if (*(_QWORD *)v59 != v14)
                    objc_enumerationMutation(v12);
                  v45 = v16;
                  v17 = *(id **)(*((_QWORD *)&v58 + 1) + 8 * v16);
                  v18 = (void *)MEMORY[0x18D764E2C]();
                  v54 = 0u;
                  v55 = 0u;
                  v56 = 0u;
                  v57 = 0u;
                  -[GEOLocalizedAttribution logoURLs](v17);
                  v19 = (void *)objc_claimAutoreleasedReturnValue();
                  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v54, v73, 16);
                  if (v20)
                  {
                    v21 = v20;
                    v22 = *(_QWORD *)v55;
LABEL_18:
                    v23 = 0;
                    while (1)
                    {
                      if (*(_QWORD *)v55 != v22)
                        objc_enumerationMutation(v19);
                      objc_msgSend(*(id *)(*((_QWORD *)&v54 + 1) + 8 * v23), "lastPathComponent");
                      v24 = (void *)objc_claimAutoreleasedReturnValue();
                      v25 = objc_msgSend(v24, "isEqualToString:", v7);

                      if ((v25 & 1) != 0)
                        goto LABEL_36;
                      if (v21 == ++v23)
                      {
                        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v54, v73, 16);
                        if (v21)
                          goto LABEL_18;
                        break;
                      }
                    }
                  }

                  objc_autoreleasePoolPop(v18);
                  if ((v47 & 1) != 0)
                    goto LABEL_37;
                  v18 = (void *)MEMORY[0x18D764E2C]();
                  v50 = 0u;
                  v51 = 0u;
                  v52 = 0u;
                  v53 = 0u;
                  -[GEOLocalizedAttribution snippetLogoURLs](v17);
                  v19 = (void *)objc_claimAutoreleasedReturnValue();
                  v26 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v50, v72, 16);
                  if (v26)
                  {
                    v27 = v26;
                    v28 = *(_QWORD *)v51;
LABEL_27:
                    v29 = 0;
                    while (1)
                    {
                      if (*(_QWORD *)v51 != v28)
                        objc_enumerationMutation(v19);
                      objc_msgSend(*(id *)(*((_QWORD *)&v50 + 1) + 8 * v29), "lastPathComponent");
                      v30 = (void *)objc_claimAutoreleasedReturnValue();
                      v31 = objc_msgSend(v30, "isEqualToString:", v7);

                      if ((v31 & 1) != 0)
                        break;
                      if (v27 == ++v29)
                      {
                        v27 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v50, v72, 16);
                        if (v27)
                          goto LABEL_27;
                        goto LABEL_33;
                      }
                    }
LABEL_36:

                    objc_autoreleasePoolPop(v18);
LABEL_37:
                    v9 = 1;
                    v12 = v49;
                    goto LABEL_38;
                  }
LABEL_33:

                  objc_autoreleasePoolPop(v18);
                  v15 = 0;
                  v16 = v45 + 1;
                  v14 = v43;
                  v12 = v49;
                }
                while (v45 + 1 != v44);
                v13 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v58, v74, 16);
                v15 = 0;
                v9 = 0;
                if (v13)
                  continue;
                break;
              }
            }
LABEL_38:

          }
          v48 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v62, v75, 16);
        }
        while (v48);

        i = v41;
        if ((v9 & 1) == 0)
          goto LABEL_43;
      }
      v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v76, 16);
    }
    while (v40);
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
  objc_storeStrong((id *)&self->_attributionManifest, 0);
  objc_storeStrong((id *)&self->_requestCounterTicket, 0);
  objc_storeStrong((id *)&self->_downloadTask, 0);
  objc_storeStrong((id *)&self->_urlSession, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_oldTileGroup, 0);
  objc_storeStrong((id *)&self->_newSearchAttributionManifestURL, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_migrator);
}

@end
