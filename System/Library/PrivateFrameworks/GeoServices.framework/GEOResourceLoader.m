@implementation GEOResourceLoader

- (void)_loadResourcesFromDisk
{
  void *v3;
  __int128 v4;
  void *v5;
  NSString *directory;
  void *v7;
  void *v8;
  void *v9;
  NSObject *log;
  NSObject *v11;
  void *v12;
  NSMutableArray *loadedResources;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  BOOL v21;
  id v22;
  NSMutableArray *v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  id v28;
  uint64_t (**v29)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  NSString *additionalDirectoryToConsider;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t j;
  uint64_t v43;
  void *v44;
  void *v45;
  __int128 v46;
  uint64_t (**v47)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  void *v48;
  void *v49;
  void *v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _QWORD v55[5];
  id v56;
  id v57;
  id v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  uint8_t v63[128];
  uint8_t buf[4];
  void *v65;
  __int16 v66;
  id v67;
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v3 = (void *)-[NSMutableArray mutableCopy](self->_resourcesToLoad, "mutableCopy");
  if (objc_msgSend(v3, "count"))
  {
    *(_QWORD *)&v4 = 138477827;
    v46 = v4;
    v50 = v3;
    while (1)
    {
      objc_msgSend(v3, "firstObject", v46);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "removeObjectAtIndex:", 0);
      directory = self->_directory;
      objc_msgSend(v5, "name");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSString stringByAppendingPathComponent:](directory, "stringByAppendingPathComponent:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v7) = objc_msgSend(v9, "fileExistsAtPath:", v8);

      if (!(_DWORD)v7)
        break;
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
      {
        v11 = log;
        objc_msgSend(v5, "name");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = v46;
        v65 = v12;
        _os_log_impl(&dword_1885A9000, v11, OS_LOG_TYPE_DEBUG, "Found matching resource in destination directory for '%{private}@'", buf, 0xCu);

        log = self->_log;
      }
      if ((objc_msgSend(v5, "shouldCheckForUpdateForResourceAtPath:useExtendedAttrs:forceUpdateCheck:log:", v8, 1, self->_forceUpdateCheck, log) & 1) == 0)
      {
        if (!objc_msgSend(v5, "validateResourceAtPath:useExtendedAttrs:log:", v8, 1, self->_log))
          break;
        v48 = v8;
        -[NSMutableArray removeObject:](self->_resourcesToLoad, "removeObject:", v5);
        loadedResources = self->_loadedResources;
        objc_msgSend(v5, "resource");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray addObject:](loadedResources, "addObject:", v14);

        v61 = 0u;
        v62 = 0u;
        v59 = 0u;
        v60 = 0u;
        objc_msgSend(v5, "equivalentResources");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v59, v68, 16);
        if (v16)
        {
          v17 = v16;
          v18 = *(_QWORD *)v60;
          do
          {
            for (i = 0; i != v17; ++i)
            {
              if (*(_QWORD *)v60 != v18)
                objc_enumerationMutation(v15);
              v20 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * i);
              v58 = 0;
              v21 = -[GEOResourceLoader _establishHardLinkIfPossibleForResource:toResource:error:](self, "_establishHardLinkIfPossibleForResource:toResource:error:", v20, v5, &v58);
              v22 = v58;
              if (v21)
              {
                v23 = self->_loadedResources;
                objc_msgSend(v20, "resource");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSMutableArray addObject:](v23, "addObject:", v24);

              }
              else
              {
                v25 = self->_log;
                if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
                {
                  v26 = v25;
                  objc_msgSend(v20, "name");
                  v27 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138478083;
                  v65 = v27;
                  v66 = 2113;
                  v67 = v22;
                  _os_log_impl(&dword_1885A9000, v26, OS_LOG_TYPE_DEBUG, "Failed to establish hard link for resource '%{private}@': %{private}@. Loading normally.", buf, 0x16u);

                }
                -[NSMutableArray addObject:](self->_resourcesToLoad, "addObject:", v20);
                objc_msgSend(v50, "addObject:", v20);
              }

            }
            v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v59, v68, 16);
          }
          while (v17);
        }

        v3 = v50;
        v8 = v48;
      }
LABEL_37:

      if (!objc_msgSend(v3, "count"))
        goto LABEL_38;
    }
    v55[0] = MEMORY[0x1E0C809B0];
    v55[1] = 3221225472;
    v55[2] = __43__GEOResourceLoader__loadResourcesFromDisk__block_invoke;
    v55[3] = &unk_1E1C0B420;
    v55[4] = self;
    v28 = v5;
    v56 = v28;
    v57 = v3;
    v29 = (uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x18D765024](v55);
    if (!-[NSString length](self->_additionalDirectoryToConsider, "length"))
      goto LABEL_23;
    additionalDirectoryToConsider = self->_additionalDirectoryToConsider;
    objc_msgSend(v28, "name");
    v31 = objc_claimAutoreleasedReturnValue();
    -[NSString stringByAppendingPathComponent:](additionalDirectoryToConsider, "stringByAppendingPathComponent:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    LOBYTE(v31) = ((uint64_t (**)(_QWORD, void *, const __CFString *, uint64_t, uint64_t))v29)[2](v29, v32, CFSTR("alternate"), 1, 1);
    if ((v31 & 1) == 0)
    {
LABEL_23:
      v47 = v29;
      v49 = v8;
      objc_msgSend(v28, "name");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "stringByDeletingPathExtension");
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v28, "name");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "pathExtension");
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB34D0], "__geoBundle");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "pathForResource:ofType:", v34, v36);
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      if (v38)
      {
LABEL_34:
        objc_msgSend(v38, "stringByResolvingSymlinksInPath");
        v45 = (void *)objc_claimAutoreleasedReturnValue();

        v29 = v47;
        ((uint64_t (**)(_QWORD, void *, const __CFString *, _QWORD, _QWORD))v47)[2](v47, v45, CFSTR("GeoServices framework"), 0, 0);

      }
      else
      {
        v53 = 0u;
        v54 = 0u;
        v51 = 0u;
        v52 = 0u;
        v39 = objc_msgSend(&unk_1E1E85618, "countByEnumeratingWithState:objects:count:", &v51, v63, 16);
        if (v39)
        {
          v40 = v39;
          v41 = *(_QWORD *)v52;
          while (2)
          {
            for (j = 0; j != v40; ++j)
            {
              if (*(_QWORD *)v52 != v41)
                objc_enumerationMutation(&unk_1E1E85618);
              v43 = *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * j);
              objc_msgSend(MEMORY[0x1E0CB34D0], "__geoBundle");
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v44, "pathForResource:ofType:inDirectory:", v34, v36, v43);
              v38 = (void *)objc_claimAutoreleasedReturnValue();

              if (v38)
              {
                v3 = v50;
                goto LABEL_34;
              }
            }
            v40 = objc_msgSend(&unk_1E1E85618, "countByEnumeratingWithState:objects:count:", &v51, v63, 16);
            v3 = v50;
            v29 = v47;
            if (v40)
              continue;
            break;
          }
        }
      }

      v8 = v49;
    }

    goto LABEL_37;
  }
LABEL_38:

}

- (void)startWithCompletionHandler:(id)a3 callbackQueue:(id)a4
{
  id v6;
  id global_queue;
  NSMutableArray *v8;
  NSMutableArray *resourcesToLoad;
  void *v10;
  id completionHandler;
  NSObject *log;
  NSArray *resourceInfos;
  NSObject *v14;
  uint64_t v15;
  NSArray *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSArray *v21;
  unint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  NSObject *v27;
  NSObject *v28;
  void *v29;
  NSObject *workQueue;
  id v31;
  void *v32;
  void *v33;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v36;
  __int16 v37;
  NSArray *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  global_queue = a4;
  v8 = (NSMutableArray *)-[NSArray mutableCopy](self->_resourceInfos, "mutableCopy");
  resourcesToLoad = self->_resourcesToLoad;
  self->_resourcesToLoad = v8;

  v33 = v6;
  v10 = (void *)objc_msgSend(v6, "copy");
  completionHandler = self->_completionHandler;
  self->_completionHandler = v10;

  if (!global_queue)
    global_queue = (id)geo_get_global_queue();
  v31 = global_queue;
  objc_storeStrong((id *)&self->_callbackQueue, global_queue);
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
  {
    resourceInfos = self->_resourceInfos;
    v14 = log;
    v15 = -[NSArray count](resourceInfos, "count", global_queue);
    v16 = self->_resourceInfos;
    *(_DWORD *)buf = 134218243;
    v36 = v15;
    v37 = 2113;
    v38 = v16;
    _os_log_impl(&dword_1885A9000, v14, OS_LOG_TYPE_DEBUG, "Starting load of %lu resources: %{private}@", buf, 0x16u);

  }
  if (-[NSMutableArray count](self->_resourcesToLoad, "count", v31))
  {
    v17 = 0;
    do
    {
      -[NSMutableArray objectAtIndex:](self->_resourcesToLoad, "objectAtIndex:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "checksum");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "length");

      ++v17;
      if (v20)
      {
        if (v17 >= -[NSMutableArray count](self->_resourcesToLoad, "count"))
        {
          v21 = 0;
        }
        else
        {
          v21 = 0;
          v22 = v17;
          do
          {
            -[NSMutableArray objectAtIndex:](self->_resourcesToLoad, "objectAtIndex:", v22);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "checksum");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "checksum");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = objc_msgSend(v24, "isEqualToData:", v25);

            if (v26)
            {
              if (!v21)
              {
                objc_msgSend(MEMORY[0x1E0C99DE8], "array");
                v21 = (NSArray *)objc_claimAutoreleasedReturnValue();
              }
              -[NSArray addObject:](v21, "addObject:", v23);
            }
            ++v22;

          }
          while (v22 < -[NSMutableArray count](self->_resourcesToLoad, "count"));
        }
        if (-[NSArray count](v21, "count"))
        {
          v27 = self->_log;
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
          {
            v28 = v27;
            objc_msgSend(v18, "name");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138478083;
            v36 = (uint64_t)v29;
            v37 = 2113;
            v38 = v21;
            _os_log_impl(&dword_1885A9000, v28, OS_LOG_TYPE_DEBUG, "Found multiple resources with the same checksum as '%{private}@': %{private}@", buf, 0x16u);

          }
          objc_msgSend(v18, "setEquivalentResources:", v21);
          -[NSMutableArray removeObjectsInArray:](self->_resourcesToLoad, "removeObjectsInArray:", v21);
        }

      }
    }
    while (v17 < -[NSMutableArray count](self->_resourcesToLoad, "count"));
  }
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__GEOResourceLoader_startWithCompletionHandler_callbackQueue___block_invoke;
  block[3] = &unk_1E1BFF6F8;
  block[4] = self;
  dispatch_async(workQueue, block);

}

- (GEOResourceLoader)initWithTargetDirectory:(id)a3 auditToken:(id)a4 baseURL:(id)a5 alternateURLs:(id)a6 proxyURL:(id)a7 resources:(id)a8 forceUpdateCheck:(BOOL)a9 maximumConcurrentLoads:(unint64_t)a10 additionalDirectoryToConsider:(id)a11 log:(id)a12 signpostID:(unint64_t)a13
{
  id v19;
  GEOResourceLoader *v20;
  uint64_t v21;
  NSString *directory;
  char v23;
  char v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  GEOResourceInfo *v31;
  NSMutableArray *v32;
  NSMutableArray *loadedResources;
  uint64_t v34;
  NSURL *baseURL;
  uint64_t v36;
  NSArray *alternateURLs;
  uint64_t v38;
  NSURL *proxyURL;
  uint64_t v40;
  NSString *additionalDirectoryToConsider;
  uint64_t v42;
  OS_dispatch_queue *workQueue;
  uint64_t v44;
  GEOReportedProgress *progress;
  GEOReportedProgress *v46;
  id obj;
  id v49;
  id v50;
  void *v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  _QWORD v57[4];
  id v58;
  id location;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  char v64;
  objc_super v65;
  _BYTE v66[128];
  uint64_t v67;
  _QWORD v68[3];

  v68[1] = *MEMORY[0x1E0C80C00];
  v56 = a3;
  v49 = a4;
  v54 = a5;
  v53 = a6;
  obj = a7;
  v52 = a7;
  v19 = a8;
  v55 = a11;
  v50 = a12;
  v65.receiver = self;
  v65.super_class = (Class)GEOResourceLoader;
  v20 = -[GEOResourceLoader init](&v65, sel_init);
  if (v20)
  {
    v21 = objc_msgSend(v56, "copy");
    directory = v20->_directory;
    v20->_directory = (NSString *)v21;

    objc_storeStrong((id *)&v20->_log, a12);
    v20->_signpostID = a13;
    v64 = 0;
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v51, "fileExistsAtPath:isDirectory:", v20->_directory, &v64);
    if (v64)
      v24 = v23;
    else
      v24 = 0;
    if ((v24 & 1) == 0)
    {
      v67 = *MEMORY[0x1E0CB2AA8];
      v68[0] = &unk_1E1E81298;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v68, &v67, 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v20->_directory, 1, v25, 0);

    }
    v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v19, "count"));
    v62 = 0u;
    v63 = 0u;
    v60 = 0u;
    v61 = 0u;
    v27 = v19;
    v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v60, v66, 16);
    if (v28)
    {
      v29 = *(_QWORD *)v61;
      do
      {
        for (i = 0; i != v28; ++i)
        {
          if (*(_QWORD *)v61 != v29)
            objc_enumerationMutation(v27);
          v31 = -[GEOResourceInfo initWithResource:]([GEOResourceInfo alloc], "initWithResource:", *(_QWORD *)(*((_QWORD *)&v60 + 1) + 8 * i));
          objc_msgSend(v26, "addObject:", v31);

        }
        v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v60, v66, 16);
      }
      while (v28);
    }

    objc_storeStrong((id *)&v20->_resourceInfos, v26);
    v32 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    loadedResources = v20->_loadedResources;
    v20->_loadedResources = v32;

    objc_storeStrong((id *)&v20->_auditToken, a4);
    v34 = objc_msgSend(v54, "copy");
    baseURL = v20->_baseURL;
    v20->_baseURL = (NSURL *)v34;

    v36 = objc_msgSend(v53, "copy");
    alternateURLs = v20->_alternateURLs;
    v20->_alternateURLs = (NSArray *)v36;

    v38 = objc_msgSend(v52, "copy");
    proxyURL = v20->_proxyURL;
    v20->_proxyURL = (NSURL *)v38;

    v20->_forceUpdateCheck = a9;
    v20->_maxConcurrentLoads = a10;
    v40 = objc_msgSend(v55, "copy");
    additionalDirectoryToConsider = v20->_additionalDirectoryToConsider;
    v20->_additionalDirectoryToConsider = (NSString *)v40;

    v42 = geo_dispatch_queue_create();
    workQueue = v20->_workQueue;
    v20->_workQueue = (OS_dispatch_queue *)v42;

    +[GEOReportedProgress progressWithTotalUnitCount:](GEOReportedProgress, "progressWithTotalUnitCount:", -1);
    v44 = objc_claimAutoreleasedReturnValue();
    progress = v20->_progress;
    v20->_progress = (GEOReportedProgress *)v44;

    objc_storeStrong((id *)&v20->_proxyURL, obj);
    objc_initWeak(&location, v20);
    v46 = v20->_progress;
    v57[0] = MEMORY[0x1E0C809B0];
    v57[1] = 3221225472;
    v57[2] = __182__GEOResourceLoader_initWithTargetDirectory_auditToken_baseURL_alternateURLs_proxyURL_resources_forceUpdateCheck_maximumConcurrentLoads_additionalDirectoryToConsider_log_signpostID___block_invoke;
    v57[3] = &unk_1E1BFF8B0;
    objc_copyWeak(&v58, &location);
    -[GEOReportedProgress setCancellationHandler:](v46, "setCancellationHandler:", v57);
    objc_destroyWeak(&v58);
    objc_destroyWeak(&location);

  }
  return v20;
}

void __49__GEOResourceLoader__loadNextResourceFromNetwork__block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x18D764E2C]();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_autoreleasePoolPop(v2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_authProxyURL, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_inProgressResourceDownloads, 0);
  objc_storeStrong((id *)&self->_auditToken, 0);
  objc_storeStrong((id *)&self->_loadedResources, 0);
  objc_storeStrong((id *)&self->_resourceInfos, 0);
  objc_storeStrong((id *)&self->_proxyURL, 0);
  objc_storeStrong((id *)&self->_alternateURLs, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_resourcesToLoad, 0);
  objc_storeStrong((id *)&self->_additionalDirectoryToConsider, 0);
  objc_storeStrong((id *)&self->_directory, 0);
}

- (void)_loadNextResourceFromNetwork
{
  uint64_t v3;
  unint64_t numberOfDownloadsInProgress;
  id v5;
  NSObject *log;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  NSMapTable *inProgressResourceDownloads;
  NSMapTable *v13;
  NSMapTable *v14;
  os_signpost_id_t v15;
  OS_os_log *v16;
  NSObject *v17;
  unint64_t signpostID;
  void *v19;
  NSObject *v20;
  void *v21;
  id completionHandler;
  NSObject *callbackQueue;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  unint64_t v27;
  _QWORD v28[5];
  id v29;
  os_signpost_id_t v30;
  _QWORD block[5];
  void *v32;
  uint8_t buf[4];
  unint64_t v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  if (self->_canceled)
    return;
  v3 = -[NSMutableArray count](self->_resourcesToLoad, "count");
  numberOfDownloadsInProgress = self->_numberOfDownloadsInProgress;
  if (v3 | numberOfDownloadsInProgress)
    goto LABEL_6;
  if (self->_numberOfCopiesInProgress)
  {
    numberOfDownloadsInProgress = 0;
LABEL_6:
    if (numberOfDownloadsInProgress >= self->_maxConcurrentLoads
      || !-[NSMutableArray count](self->_resourcesToLoad, "count"))
    {
      return;
    }
    -[NSMutableArray objectAtIndex:](self->_resourcesToLoad, "objectAtIndex:", 0);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray removeObjectAtIndex:](self->_resourcesToLoad, "removeObjectAtIndex:", 0);
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138477827;
      v34 = (unint64_t)v5;
      _os_log_impl(&dword_1885A9000, log, OS_LOG_TYPE_DEBUG, "Loading next resource: %{private}@", buf, 0xCu);
      log = self->_log;
    }
    ++self->_numberOfDownloadsInProgress;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
    {
      v7 = log;
      objc_msgSend(v5, "name");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138477827;
      v34 = (unint64_t)v8;
      _os_log_impl(&dword_1885A9000, v7, OS_LOG_TYPE_DEBUG, "Loading resource '%{private}@' from network", buf, 0xCu);

    }
    -[GEOReportedProgress becomeCurrentWithPendingUnitCount:](self->_progress, "becomeCurrentWithPendingUnitCount:", 1);
    v9 = objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "resourceLoadOperationClass"));
    objc_msgSend(v5, "eTag");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v9, "initWithResource:eTag:auditToken:baseURL:alternateURLs:proxyURL:log:", v5, v10, self->_auditToken, self->_baseURL, self->_alternateURLs, self->_proxyURL, self->_log);

    if (v11)
    {
      objc_msgSend(v11, "setRequiresWiFi:", self->_requiresWiFi);
      inProgressResourceDownloads = self->_inProgressResourceDownloads;
      if (!inProgressResourceDownloads)
      {
        v13 = (NSMapTable *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 512, 512, self->_maxConcurrentLoads);
        v14 = self->_inProgressResourceDownloads;
        self->_inProgressResourceDownloads = v13;

        inProgressResourceDownloads = self->_inProgressResourceDownloads;
      }
      -[NSMapTable setObject:forKey:](inProgressResourceDownloads, "setObject:forKey:", v11, v5);
      if (self->_signpostID)
      {
        v15 = os_signpost_id_generate((os_log_t)self->_log);
        v16 = self->_log;
        v17 = v16;
        if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v16))
        {
          signpostID = self->_signpostID;
          objc_msgSend(v5, "name");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134218242;
          v34 = signpostID;
          v35 = 2112;
          v36 = v19;
          _os_signpost_emit_with_name_impl(&dword_1885A9000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v15, "LoadResource", "parent_signpost=%llu Name=%@", buf, 0x16u);

        }
      }
      else
      {
        v15 = 0;
      }
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __49__GEOResourceLoader__loadNextResourceFromNetwork__block_invoke_45;
      v28[3] = &unk_1E1C0B470;
      v28[4] = self;
      v5 = v5;
      v29 = v5;
      v30 = v15;
      objc_msgSend(v11, "startWithCompletionHandler:callbackQueue:", v28, self->_workQueue);
      -[GEOReportedProgress resignCurrent](self->_progress, "resignCurrent");
      -[GEOResourceLoader _loadNextResourceFromNetwork](self, "_loadNextResourceFromNetwork");

    }
    else
    {
      v24 = self->_log;
      if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
      {
        v25 = v24;
        objc_msgSend(v5, "name");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138477827;
        v34 = (unint64_t)v26;
        _os_log_impl(&dword_1885A9000, v25, OS_LOG_TYPE_FAULT, "Unable to create operation for resource %{private}@", buf, 0xCu);

      }
      v27 = self->_numberOfDownloadsInProgress;
      if (v27)
        self->_numberOfDownloadsInProgress = v27 - 1;
      -[GEOReportedProgress resignCurrent](self->_progress, "resignCurrent");
      -[GEOResourceLoader _loadNextResourceFromNetwork](self, "_loadNextResourceFromNetwork");
      v11 = 0;
    }
LABEL_31:

    return;
  }
  v20 = self->_log;
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1885A9000, v20, OS_LOG_TYPE_DEBUG, "Finished loading all resources", buf, 2u);
  }
  -[GEOResourceLoader _cleanup](self, "_cleanup");
  if (self->_completionHandler)
  {
    v21 = (void *)MEMORY[0x18D765024]();
    completionHandler = self->_completionHandler;
    self->_completionHandler = 0;

    callbackQueue = self->_callbackQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __49__GEOResourceLoader__loadNextResourceFromNetwork__block_invoke;
    block[3] = &unk_1E1BFF970;
    block[4] = self;
    v32 = v21;
    v5 = v21;
    dispatch_async(callbackQueue, block);
    v11 = v32;
    goto LABEL_31;
  }
}

- (void)_cleanup
{
  NSMapTable *v3;
  NSMapTable *inProgressResourceDownloads;
  NSMapTable *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSMutableArray *resourcesToLoad;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = self->_inProgressResourceDownloads;
  inProgressResourceDownloads = self->_inProgressResourceDownloads;
  self->_inProgressResourceDownloads = 0;

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = v3;
  v6 = -[NSMapTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        -[NSMapTable objectForKey:](v5, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9), (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "cancel");

        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMapTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  resourcesToLoad = self->_resourcesToLoad;
  self->_resourcesToLoad = 0;

}

uint64_t __62__GEOResourceLoader_startWithCompletionHandler_callbackQueue___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_loadResourcesFromDisk");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "setTotalUnitCount:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "count"));
  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "count"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "setTotalUnitCount:", 1);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "setCompletedUnitCount:", 1);
  }
  return objc_msgSend(*(id *)(a1 + 32), "_loadNextResourceFromNetwork");
}

+ (Class)resourceLoadOperationClass
{
  return (Class)objc_opt_class();
}

- (GEOResourceLoader)init
{
  GEOResourceLoader *result;

  result = (GEOResourceLoader *)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GEOMethodNotAvailableException"), CFSTR("This method is unavailable."));
  __break(1u);
  return result;
}

void __182__GEOResourceLoader_initWithTargetDirectory_auditToken_baseURL_alternateURLs_proxyURL_resources_forceUpdateCheck_maximumConcurrentLoads_additionalDirectoryToConsider_log_signpostID___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "cancel");

}

- (NSProgress)progress
{
  return -[GEOReportedProgress progress](self->_progress, "progress");
}

- (BOOL)_establishHardLinkIfPossibleForResource:(id)a3 toResource:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSString *directory;
  void *v11;
  void *v12;
  NSString *v13;
  void *v14;
  void *v15;
  NSObject *log;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  id v28;
  void *v29;
  BOOL v30;
  id v31;
  void *v32;
  char v33;
  id v34;
  NSObject *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  id *v41;
  id v42;
  id v43;
  uint8_t buf[4];
  id v45;
  __int16 v46;
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  directory = self->_directory;
  objc_msgSend(v9, "name");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSString stringByAppendingPathComponent:](directory, "stringByAppendingPathComponent:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = self->_directory;
  objc_msgSend(v8, "name");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSString stringByAppendingPathComponent:](v13, "stringByAppendingPathComponent:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
  {
    v17 = log;
    objc_msgSend(v8, "name");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "name");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138478083;
    v45 = v18;
    v46 = 2113;
    v47 = v19;
    _os_log_impl(&dword_1885A9000, v17, OS_LOG_TYPE_DEBUG, "Resource '%{private}@' should be identical to '%{private}@'. Checking...", buf, 0x16u);

  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "fileExistsAtPath:", v15);

  if (v21)
  {
    v22 = self->_log;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      v23 = v22;
      objc_msgSend(v8, "name");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138477827;
      v45 = v24;
      _os_log_impl(&dword_1885A9000, v23, OS_LOG_TYPE_DEBUG, "Found matching resource in destination directory for '%{private}@'", buf, 0xCu);

      v22 = self->_log;
    }
    v25 = v15;
    v26 = v22;
    GEOGetSHA1FromExtendedAttributes(v25);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = a5;
    if (objc_msgSend(v27, "length"))
    {
      v28 = v27;
    }
    else
    {
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138477827;
        v45 = v25;
        _os_log_impl(&dword_1885A9000, v26, OS_LOG_TYPE_DEBUG, "Checksum not found in extended attributes for '%{private}@'. Calculating instead...", buf, 0xCu);
      }
      GEOCalculateSHA1ForFile(v25);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      v43 = 0;
      v30 = GEOSetSHA1OnExtendedAttribute(v25, v29, &v43);
      v31 = v43;
      if (!v30 && os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v45 = v31;
        _os_log_impl(&dword_1885A9000, v26, OS_LOG_TYPE_ERROR, "Failed to write checksum into extended attributes: %{public}@", buf, 0xCu);
      }
      v28 = v29;

    }
    objc_msgSend(v9, "checksum");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "isEqualToData:", v28);

    if ((v33 & 1) != 0)
    {
      v34 = 0;
      a5 = v41;
      goto LABEL_22;
    }
    v35 = self->_log;
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      v36 = v35;
      objc_msgSend(v8, "name");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v45 = v37;
      _os_log_impl(&dword_1885A9000, v36, OS_LOG_TYPE_ERROR, "Incorrect checksum for cached resource %{public}@", buf, 0xCu);

    }
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "removeItemAtPath:error:", v25, 0);

    a5 = v41;
  }
  v39 = self->_log;
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138478083;
    v45 = v15;
    v46 = 2113;
    v47 = v12;
    _os_log_impl(&dword_1885A9000, v39, OS_LOG_TYPE_DEBUG, "Establishing hard link from '%{private}@' to '%{private}@'", buf, 0x16u);
  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v28 = (id)objc_claimAutoreleasedReturnValue();
  v42 = 0;
  objc_msgSend(v28, "linkItemAtPath:toPath:error:", v12, v15, &v42);
  v34 = v42;
LABEL_22:

  if (a5)
    *a5 = objc_retainAutorelease(v34);

  return v34 == 0;
}

uint64_t __43__GEOResourceLoader__loadResourcesFromDisk__block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5)
{
  id v9;
  id v10;
  void *v11;
  int v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  _QWORD *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  void *v30;
  uint64_t v31;
  char v32;
  id v33;
  uint64_t v34;
  void *v35;
  void *v36;
  NSObject *v37;
  NSObject *v38;
  void *v39;
  uint64_t v40;
  id v42;
  id v43;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint8_t v49[128];
  uint8_t buf[4];
  id v51;
  __int16 v52;
  id v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "fileExistsAtPath:", v9);

  if (!v12)
    goto LABEL_23;
  v13 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 168);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    v14 = *(void **)(a1 + 40);
    v15 = v13;
    objc_msgSend(v14, "name");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138478083;
    v51 = v10;
    v52 = 2113;
    v53 = v16;
    _os_log_impl(&dword_1885A9000, v15, OS_LOG_TYPE_DEBUG, "Found matching resource in %{private}@ directory for '%{private}@'", buf, 0x16u);

    v13 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 168);
  }
  if (!objc_msgSend(*(id *)(a1 + 40), "validateResourceAtPath:useExtendedAttrs:log:", v9, a5, v13))
    goto LABEL_23;
  v17 = *(_QWORD **)(a1 + 32);
  v18 = v17[21];
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    v19 = *(void **)(a1 + 40);
    v20 = v18;
    objc_msgSend(v19, "name");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138478083;
    v51 = v10;
    v52 = 2113;
    v53 = v21;
    _os_log_impl(&dword_1885A9000, v20, OS_LOG_TYPE_DEBUG, "Using resource from %{private}@ directory: '%{private}@'", buf, 0x16u);

    v17 = *(_QWORD **)(a1 + 32);
  }
  if (objc_msgSend(v17, "_copyResource:fromPath:allowCreatingHardLink:error:", *(_QWORD *)(a1 + 40), v9, a4, 0))
  {
    v42 = v10;
    v43 = v9;
    if ((objc_msgSend(*(id *)(a1 + 40), "shouldCheckForUpdateForResourceAtPath:useExtendedAttrs:forceUpdateCheck:log:", v9, a5, *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 88), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 168)) & 1) == 0)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeObject:", *(_QWORD *)(a1 + 40));
      v22 = *(void **)(*(_QWORD *)(a1 + 32) + 112);
      objc_msgSend(*(id *)(a1 + 40), "resource");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "addObject:", v23);

    }
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    objc_msgSend(*(id *)(a1 + 40), "equivalentResources");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v46;
      do
      {
        for (i = 0; i != v26; ++i)
        {
          if (*(_QWORD *)v46 != v27)
            objc_enumerationMutation(v24);
          v29 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
          v30 = *(void **)(a1 + 32);
          v31 = *(_QWORD *)(a1 + 40);
          v44 = 0;
          v32 = objc_msgSend(v30, "_establishHardLinkIfPossibleForResource:toResource:error:", v29, v31, &v44);
          v33 = v44;
          v34 = *(_QWORD *)(a1 + 32);
          if ((v32 & 1) != 0)
          {
            v35 = *(void **)(v34 + 112);
            objc_msgSend(v29, "resource");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "addObject:", v36);

          }
          else
          {
            v37 = *(NSObject **)(v34 + 168);
            if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
            {
              v38 = v37;
              objc_msgSend(v29, "name");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v51 = v39;
              v52 = 2114;
              v53 = v33;
              _os_log_impl(&dword_1885A9000, v38, OS_LOG_TYPE_ERROR, "Failed to establish hard link for resource '%{public}@': %{public}@. Loading normally.", buf, 0x16u);

              v34 = *(_QWORD *)(a1 + 32);
            }
            objc_msgSend(*(id *)(v34 + 24), "addObject:", v29);
            objc_msgSend(*(id *)(a1 + 48), "addObject:", v29);
          }

        }
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
      }
      while (v26);
    }

    v40 = 1;
    v10 = v42;
    v9 = v43;
  }
  else
  {
LABEL_23:
    v40 = 0;
  }

  return v40;
}

void __49__GEOResourceLoader__loadNextResourceFromNetwork__block_invoke_45(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  os_signpost_id_t v17;
  uint64_t v18;
  id v19;
  id v20;
  void *v21;
  NSObject *v22;
  void *v23;
  char v24;
  id v25;
  NSObject *v26;
  uint64_t v27;
  NSObject *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  NSObject *v32;
  id v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  _QWORD v38[5];
  id v39;
  _QWORD block[5];
  id v41;
  id v42;
  id v43;
  id v44;
  uint8_t buf[4];
  uint64_t v46;
  __int16 v47;
  id v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = *(_QWORD *)(a1 + 32);
  v14 = *(_QWORD *)(v13 + 40);
  if (v14)
  {
    *(_QWORD *)(v13 + 40) = v14 - 1;
    v13 = *(_QWORD *)(a1 + 32);
  }
  objc_msgSend(*(id *)(v13 + 128), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
  if (*(_QWORD *)(a1 + 48))
  {
    v15 = *(id *)(*(_QWORD *)(a1 + 32) + 168);
    v16 = v15;
    v17 = *(_QWORD *)(a1 + 48);
    if (!v12)
    {
      if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
      {
        *(_DWORD *)buf = 134217984;
        v46 = objc_msgSend(v10, "length");
        _os_signpost_emit_with_name_impl(&dword_1885A9000, v16, OS_SIGNPOST_INTERVAL_END, v17, "LoadResource", "Result=Success Size=%llu", buf, 0xCu);
      }

      if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 56))
        goto LABEL_37;
LABEL_16:
      if (v9)
      {
        v44 = 0;
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v9, 1, &v44);
        v19 = (id)objc_claimAutoreleasedReturnValue();
        v20 = v44;
        v21 = v20;
        v12 = 0;
        if (!v19)
        {
          v12 = v20;
          v22 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 168);
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v46 = (uint64_t)v9;
            v47 = 2112;
            v48 = v12;
            _os_log_impl(&dword_1885A9000, v22, OS_LOG_TYPE_ERROR, "Could not read temp resource file at \"%@\": %@", buf, 0x16u);
          }
        }

        if (!v19)
          goto LABEL_30;
      }
      else
      {
        v19 = v10;
        v12 = 0;
        if (!v19)
        {
LABEL_30:

          v18 = *(_QWORD *)(a1 + 32);
          if (v12)
            goto LABEL_31;
          v35 = *(void **)(a1 + 40);
          objc_msgSend(v35, "checksum");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v38[0] = MEMORY[0x1E0C809B0];
          v38[1] = 3221225472;
          v38[2] = __49__GEOResourceLoader__loadNextResourceFromNetwork__block_invoke_2;
          v38[3] = &unk_1E1C0B448;
          v37 = *(void **)(a1 + 40);
          v38[4] = *(_QWORD *)(a1 + 32);
          v39 = v37;
          objc_msgSend((id)v18, "_writeResourceToDisk:withData:orTempFile:checksum:eTag:completionHandler:callbackQueue:", v35, v10, v9, v36, v11, v38, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 136));

LABEL_37:
          v12 = 0;
          goto LABEL_38;
        }
      }
      if ((objc_msgSend(*(id *)(a1 + 40), "validateResource:log:", v19, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 168)) & 1) == 0)
      {
        if (v9)
        {
          objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = 0;
          v24 = objc_msgSend(v23, "removeItemAtURL:error:", v9, &v43);
          v25 = v43;

          if ((v24 & 1) == 0)
          {
            v26 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 168);
            if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              v46 = (uint64_t)v9;
              v47 = 2112;
              v48 = v25;
              _os_log_impl(&dword_1885A9000, v26, OS_LOG_TYPE_ERROR, "Unable to delete temp file at \"%@\": %@", buf, 0x16u);
            }
          }

        }
        objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:", -11);
        v27 = objc_claimAutoreleasedReturnValue();

        v12 = (id)v27;
      }
      goto LABEL_30;
    }
    if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1885A9000, v16, OS_SIGNPOST_INTERVAL_END, v17, "LoadResource", "Result=Error", buf, 2u);
    }

  }
  v18 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v18 + 56))
    goto LABEL_38;
  if (!v12)
    goto LABEL_16;
LABEL_31:
  v28 = *(NSObject **)(v18 + 168);
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v46 = (uint64_t)v12;
    _os_log_impl(&dword_1885A9000, v28, OS_LOG_TYPE_ERROR, "Error downloading resource: %{public}@", buf, 0xCu);
    v18 = *(_QWORD *)(a1 + 32);
  }
  v29 = (void *)MEMORY[0x18D765024](*(_QWORD *)(v18 + 32));
  v30 = *(_QWORD *)(a1 + 32);
  v31 = *(void **)(v30 + 32);
  *(_QWORD *)(v30 + 32) = 0;

  objc_msgSend(*(id *)(a1 + 32), "cancel");
  if (v29)
  {
    v32 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 144);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __49__GEOResourceLoader__loadNextResourceFromNetwork__block_invoke_48;
    block[3] = &unk_1E1C01358;
    v33 = v29;
    v34 = *(_QWORD *)(a1 + 32);
    v42 = v33;
    block[4] = v34;
    v41 = v12;
    dispatch_async(v32, block);

  }
LABEL_38:

}

void __49__GEOResourceLoader__loadNextResourceFromNetwork__block_invoke_48(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x18D764E2C]();
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  objc_autoreleasePoolPop(v2);
}

void __49__GEOResourceLoader__loadNextResourceFromNetwork__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  uint64_t v21;
  char v22;
  id v23;
  uint64_t v24;
  void *v25;
  void *v26;
  NSObject *v27;
  NSObject *v28;
  void *v29;
  _QWORD block[5];
  id v31;
  id v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  id v39;
  __int16 v40;
  id v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(_QWORD **)(a1 + 32);
  if (v3)
  {
    v5 = v4[21];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v39 = v3;
      _os_log_impl(&dword_1885A9000, v5, OS_LOG_TYPE_ERROR, "Error processing resource: %{public}@", buf, 0xCu);
      v4 = *(_QWORD **)(a1 + 32);
    }
    v6 = (void *)MEMORY[0x18D765024](v4[4]);
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v7 + 32);
    *(_QWORD *)(v7 + 32) = 0;

    objc_msgSend(*(id *)(a1 + 32), "cancel");
    if (v6)
    {
      v9 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 144);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __49__GEOResourceLoader__loadNextResourceFromNetwork__block_invoke_49;
      block[3] = &unk_1E1C01358;
      v10 = v6;
      v11 = *(_QWORD *)(a1 + 32);
      v32 = v10;
      block[4] = v11;
      v31 = v3;
      dispatch_async(v9, block);

    }
  }
  else
  {
    v12 = (void *)v4[14];
    objc_msgSend(*(id *)(a1 + 40), "resource");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v13);

    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    objc_msgSend(*(id *)(a1 + 40), "equivalentResources");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v35 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
          v20 = *(void **)(a1 + 32);
          v21 = *(_QWORD *)(a1 + 40);
          v33 = 0;
          v22 = objc_msgSend(v20, "_establishHardLinkIfPossibleForResource:toResource:error:", v19, v21, &v33);
          v23 = v33;
          v24 = *(_QWORD *)(a1 + 32);
          if ((v22 & 1) != 0)
          {
            v25 = *(void **)(v24 + 112);
            objc_msgSend(v19, "resource");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "addObject:", v26);

          }
          else
          {
            v27 = *(NSObject **)(v24 + 168);
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            {
              v28 = v27;
              objc_msgSend(v19, "name");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v39 = v29;
              v40 = 2114;
              v41 = v23;
              _os_log_impl(&dword_1885A9000, v28, OS_LOG_TYPE_ERROR, "Failed to establish hard link for resource '%{public}@': %{public}@. Loading normally.", buf, 0x16u);

              v24 = *(_QWORD *)(a1 + 32);
            }
            objc_msgSend(*(id *)(v24 + 24), "addObject:", v19);
          }

        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
      }
      while (v16);
    }

    objc_msgSend(*(id *)(a1 + 32), "_loadNextResourceFromNetwork");
    v3 = 0;
  }

}

void __49__GEOResourceLoader__loadNextResourceFromNetwork__block_invoke_49(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x18D764E2C]();
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  objc_autoreleasePoolPop(v2);
}

- (void)_writeResourceToDisk:(id)a3 withData:(id)a4 orTempFile:(id)a5 checksum:(id)a6 eTag:(id)a7 completionHandler:(id)a8 callbackQueue:(id)a9
{
  id v15;
  unint64_t v16;
  unint64_t v17;
  id v18;
  id v19;
  NSObject *v20;
  NSString *directory;
  void *v22;
  void *v23;
  void *v24;
  id *v25;
  OS_os_log *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  GEOResourceLoader *v32;
  id v33;
  id v34;
  id v35;
  NSObject *v36;
  id v37;
  uint64_t *v38;
  _QWORD block[4];
  id v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  char v44;
  uint8_t buf[4];
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = (unint64_t)a4;
  v17 = (unint64_t)a5;
  v29 = a6;
  v18 = a7;
  v19 = a8;
  v20 = a9;
  directory = self->_directory;
  v28 = v15;
  objc_msgSend(v15, "name");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSString stringByAppendingPathComponent:](directory, "stringByAppendingPathComponent:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v41 = 0;
  v42 = &v41;
  v43 = 0x2020000000;
  v44 = 0;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v15) = objc_msgSend(v24, "fileExistsAtPath:", v23);

  v44 = (char)v15;
  if (v16 | v17 || v18 && *((_BYTE *)v42 + 24))
  {
    ++self->_numberOfCopiesInProgress;
    v30 = (id)v17;
    v38 = &v41;
    v31 = v23;
    v32 = self;
    v33 = (id)v16;
    v34 = v29;
    v35 = v18;
    v36 = v20;
    v37 = v19;
    geo_dispatch_async_qos();

    v25 = &v30;
  }
  else
  {
    v26 = self->_log;
    if (os_log_type_enabled((os_log_t)v26, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v28, "name");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v46 = v27;
      _os_log_impl(&dword_1885A9000, (os_log_t)v26, OS_LOG_TYPE_ERROR, "Can't write resource to disk -- no data/eTag (%{public}@)", buf, 0xCu);

    }
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __108__GEOResourceLoader__writeResourceToDisk_withData_orTempFile_checksum_eTag_completionHandler_callbackQueue___block_invoke;
    block[3] = &unk_1E1C01F48;
    v25 = &v40;
    v40 = v19;
    dispatch_async(v20, block);
  }

  _Block_object_dispose(&v41, 8);
}

void __108__GEOResourceLoader__writeResourceToDisk_withData_orTempFile_checksum_eTag_completionHandler_callbackQueue___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:", -11);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __108__GEOResourceLoader__writeResourceToDisk_withData_orTempFile_checksum_eTag_completionHandler_callbackQueue___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  char v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  BOOL v23;
  id v24;
  NSObject *v25;
  id v26;
  void *v27;
  void *v28;
  BOOL v29;
  id v30;
  NSObject *v31;
  NSObject *v32;
  id v33;
  id v34;
  _QWORD block[5];
  id v36;
  id v37;
  id v38;
  id v39;
  void *v40;
  id v41;
  id v42;
  id v43;
  _QWORD v44[2];
  __int128 buf;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", *(_QWORD *)(a1 + 40));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24))
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = 0;
      v4 = objc_msgSend(v3, "removeItemAtURL:error:", v2, &v43);
      v5 = v43;
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24) = v4 ^ 1;

      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24))
      {
        v6 = *(NSObject **)(*(_QWORD *)(a1 + 48) + 168);
        if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
          goto LABEL_14;
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v5;
        _os_log_impl(&dword_1885A9000, v6, OS_LOG_TYPE_ERROR, "Failed to remove existing file at URL: %@", (uint8_t *)&buf, 0xCu);
        if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24))
          goto LABEL_14;
      }
    }
    else
    {
      v5 = 0;
    }
    v9 = v5;
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1 + 32);
    v42 = v5;
    v12 = objc_msgSend(v10, "moveItemAtURL:toURL:error:", v11, v2, &v42);
    v5 = v42;

    if ((v12 & 1) == 0)
    {
      v13 = *(NSObject **)(*(_QWORD *)(a1 + 48) + 168);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v5;
        _os_log_impl(&dword_1885A9000, v13, OS_LOG_TYPE_ERROR, "Failed to move downloaded file to final URL: %@", (uint8_t *)&buf, 0xCu);
      }
    }
LABEL_14:

    if (v5)
      goto LABEL_20;
    goto LABEL_17;
  }
  v7 = *(void **)(a1 + 56);
  v8 = *(void **)(a1 + 40);
  if (v7)
  {
    v41 = 0;
    objc_msgSend(v7, "writeToFile:options:error:", v8, 268435457, &v41);
    v5 = v41;
    if (v5)
      goto LABEL_20;
  }
  else
  {
    utimes((const char *)objc_msgSend(objc_retainAutorelease(v8), "fileSystemRepresentation"), 0);
  }
LABEL_17:
  v14 = *(void **)(a1 + 40);
  v40 = 0;
  if (v14)
  {
    v15 = (void *)MEMORY[0x1E0CB3620];
    v16 = v14;
    objc_msgSend(v15, "defaultManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = *MEMORY[0x1E0CB2AD8];
    v44[0] = *MEMORY[0x1E0CB2AA8];
    v44[1] = v18;
    v19 = *MEMORY[0x1E0CB2AE0];
    *(_QWORD *)&buf = &unk_1E1E812B0;
    *((_QWORD *)&buf + 1) = v19;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &buf, v44, 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setAttributes:ofItemAtPath:error:", v20, v16, &v40);

    v14 = v40;
  }
  v5 = v14;
LABEL_20:
  if (objc_msgSend(*(id *)(a1 + 64), "length"))
  {
    v21 = *(void **)(a1 + 40);
    v22 = *(void **)(a1 + 64);
    v39 = 0;
    v23 = GEOSetSHA1OnExtendedAttribute(v21, v22, &v39);
    v24 = v39;
    if (!v23)
    {
      v25 = *(NSObject **)(*(_QWORD *)(a1 + 48) + 168);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138543362;
        *(_QWORD *)((char *)&buf + 4) = v24;
        _os_log_impl(&dword_1885A9000, v25, OS_LOG_TYPE_ERROR, "Failed to write checksum into extended attributes: %{public}@", (uint8_t *)&buf, 0xCu);
      }
    }
    if (!*(_QWORD *)(a1 + 56) && v24)
    {
      v26 = v24;

      v5 = v26;
    }

  }
  if (objc_msgSend(*(id *)(a1 + 72), "length"))
  {
    v27 = *(void **)(a1 + 40);
    v28 = *(void **)(a1 + 72);
    v38 = 0;
    v29 = GEOSetETagOnExtendedAttribute(v27, v28, &v38);
    v30 = v38;
    if (!v29)
    {
      v31 = *(NSObject **)(*(_QWORD *)(a1 + 48) + 168);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138543362;
        *(_QWORD *)((char *)&buf + 4) = v30;
        _os_log_impl(&dword_1885A9000, v31, OS_LOG_TYPE_ERROR, "Failed to write eTag into extended attributes: %{public}@", (uint8_t *)&buf, 0xCu);
      }
    }
    if (!*(_QWORD *)(a1 + 56) && !v5 && v30)
      v5 = v30;

  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __108__GEOResourceLoader__writeResourceToDisk_withData_orTempFile_checksum_eTag_completionHandler_callbackQueue___block_invoke_53;
  block[3] = &unk_1E1C00BB8;
  block[4] = *(_QWORD *)(a1 + 48);
  v32 = *(NSObject **)(a1 + 80);
  v33 = *(id *)(a1 + 88);
  v36 = v5;
  v37 = v33;
  v34 = v5;
  dispatch_async(v32, block);

}

uint64_t __108__GEOResourceLoader__writeResourceToDisk_withData_orTempFile_checksum_eTag_completionHandler_callbackQueue___block_invoke_53(_QWORD *a1)
{
  --*(_QWORD *)(a1[4] + 48);
  return (*(uint64_t (**)(_QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[5]);
}

- (BOOL)_copyResource:(id)a3 fromPath:(id)a4 allowCreatingHardLink:(BOOL)a5 error:(id *)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  NSString *directory;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  id v17;
  int v18;
  NSObject *log;
  void *v20;
  id v21;
  id v22;
  id *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  id v28;
  NSObject *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  id *v34;
  void *v35;
  BOOL v36;
  id v37;
  NSObject *v38;
  char v39;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  _BYTE buf[22];
  __int16 v48;
  id v49;
  _QWORD v50[3];

  v7 = a5;
  v50[2] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  directory = self->_directory;
  objc_msgSend(v10, "name");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSString stringByAppendingPathComponent:](directory, "stringByAppendingPathComponent:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "fileExistsAtPath:", v14))
    objc_msgSend(v15, "removeItemAtPath:error:", v14, 0);
  if (v7)
  {
    v46 = 0;
    v16 = objc_msgSend(v15, "linkItemAtPath:toPath:error:", v11, v14, &v46);
    v17 = v46;
    if ((v16 & 1) != 0)
    {
      LOBYTE(v18) = 1;
      goto LABEL_25;
    }
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v11;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v14;
      v48 = 2114;
      v49 = v17;
      _os_log_impl(&dword_1885A9000, log, OS_LOG_TYPE_ERROR, "Failed to create hard link from '%{public}@' to '%{public}@': %{public}@", buf, 0x20u);
    }
  }
  else
  {
    v17 = 0;
  }
  v20 = v17;
  v45 = v17;
  v18 = objc_msgSend(v15, "copyItemAtPath:toPath:error:", v11, v14, &v45);
  v17 = v45;

  if (v18)
  {
    v44 = v17;
    v21 = v14;
    if (v21)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v41 = v10;
      v22 = v11;
      v23 = a6;
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = *MEMORY[0x1E0CB2AD8];
      v50[0] = *MEMORY[0x1E0CB2AA8];
      v50[1] = v25;
      v26 = *MEMORY[0x1E0CB2AE0];
      *(_QWORD *)buf = &unk_1E1E812B0;
      *(_QWORD *)&buf[8] = v26;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v50, 2);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setAttributes:ofItemAtPath:error:", v27, v21, &v44);

      a6 = v23;
      v11 = v22;
      v10 = v41;
    }

    v28 = v44;
    v17 = v28;
  }
  else
  {
    v29 = self->_log;
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      v30 = v29;
      objc_msgSend(v10, "name");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v31;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v17;
      _os_log_impl(&dword_1885A9000, v30, OS_LOG_TYPE_ERROR, "Failed to copy resource '%{public}@': %{public}@", buf, 0x16u);

    }
  }
  objc_msgSend(v10, "checksum");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "length");

  if (v33)
  {
    v42 = v11;
    v34 = a6;
    objc_msgSend(v10, "checksum");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = 0;
    v36 = GEOSetSHA1OnExtendedAttribute(v14, v35, &v43);
    v37 = v43;

    if (!v36)
    {
      v38 = self->_log;
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v37;
        _os_log_impl(&dword_1885A9000, v38, OS_LOG_TYPE_ERROR, "Failed to write checksum into extended attributes: %{public}@", buf, 0xCu);
      }
    }

    a6 = v34;
    v11 = v42;
  }
  if (a6)
    v39 = v18;
  else
    v39 = 1;
  if ((v39 & 1) == 0)
  {
    v17 = objc_retainAutorelease(v17);
    LOBYTE(v18) = 0;
    *a6 = v17;
  }
LABEL_25:

  return v18;
}

- (void)cancel
{
  NSObject *workQueue;
  _QWORD block[5];

  self->_canceled = 1;
  -[GEOReportedProgress cancel](self->_progress, "cancel");
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __27__GEOResourceLoader_cancel__block_invoke;
  block[3] = &unk_1E1BFF6F8;
  block[4] = self;
  dispatch_async(workQueue, block);
}

uint64_t __27__GEOResourceLoader_cancel__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 32);
  *(_QWORD *)(v2 + 32) = 0;

  return objc_msgSend(*(id *)(a1 + 32), "_cleanup");
}

+ (BOOL)validateUnpackedResource:(id)a3 at:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "fileExistsAtPath:", v8);

  if (v9)
  {
    objc_msgSend(v6, "URLByDeletingPathExtension");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "path");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "fileExistsAtPath:", v12);

    if (v13)
    {
      if (objc_msgSend(v5, "validationMethod") == 1)
      {
        objc_msgSend(v6, "path");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        GEOGetETagFromExtendedAttributes(v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v10, "path");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        GEOGetETagFromExtendedAttributes(v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        v18 = v15;
        v19 = v17;
      }
      else
      {
        objc_msgSend(v10, "path");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        GEOGetSHA1FromExtendedAttributes(v20);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v5, "checksum");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v18;
        v19 = v15;
      }
      LOBYTE(v9) = objc_msgSend(v18, "isEqual:", v19);

    }
    else
    {
      LOBYTE(v9) = 0;
    }

  }
  return v9;
}

+ (id)unpackResource:(id)a3 at:(id)a4 log:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  char v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  id v27;
  BOOL v28;
  id v29;
  void *v30;
  BOOL v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  BOOL v37;
  void *v38;
  void *v39;
  BOOL v40;
  void *v41;
  int v42;
  void *v43;
  void *v44;
  int v45;
  char v46;
  char v47;
  id v48;
  id *v49;
  id v50;
  char v52;
  char v53;
  void *v54;
  void *v55;
  void *v56;
  id *v57;
  void *v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  uint8_t buf[4];
  id v70;
  __int16 v71;
  id v72;
  __int16 v73;
  id v74;
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(v11, "URLByDeletingPathExtension");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(a1, "validateUnpackedResource:at:", v10, v11))
  {
    v50 = v13;
    v21 = 0;
    goto LABEL_44;
  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "URLByAppendingPathExtension:", CFSTR("unpack-folder"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "path");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v14, "fileExistsAtPath:", v16);

  if (v17)
  {
    v68 = 0;
    v18 = objc_msgSend(v14, "removeItemAtURL:error:", v15, &v68);
    v19 = v68;
    v20 = v19;
    if ((v18 & 1) == 0)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v70 = v15;
        v71 = 2112;
        v72 = v20;
        _os_log_error_impl(&dword_1885A9000, v12, OS_LOG_TYPE_ERROR, "Unable to remove old temporary path \"%@\" - %@", buf, 0x16u);
      }
      v43 = 0;
      if (!a6)
        goto LABEL_42;
      goto LABEL_36;
    }
    v57 = a6;
    v21 = v19;
  }
  else
  {
    v57 = a6;
    v21 = 0;
  }
  v58 = v14;
  if (objc_msgSend(v10, "validationMethod") == 1)
  {
    objc_msgSend(v11, "path");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    GEOGetETagFromExtendedAttributes(v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v23, "length"))
    {

      v43 = 0;
      v50 = 0;
      goto LABEL_43;
    }
    v24 = v12;
    objc_msgSend(v11, "path");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = v21;
    +[GEOSignedResource loadResourceAtPath:error:](GEOSignedResource, "loadResourceAtPath:error:", v25, &v67);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v67;

    if (v26)
    {
      v54 = v13;
      v66 = v27;
      v28 = +[GEOUnarchiver unarchiveData:toURL:log:error:](GEOUnarchiver, "unarchiveData:toURL:log:error:", v26, v15, v24, &v66);
      v29 = v66;

      if (v28)
      {
        objc_msgSend(v15, "path");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v65 = v29;
        v31 = GEOSetETagOnExtendedAttribute(v30, v23, &v65);
        v27 = v65;

        if (v31)
        {

          v32 = v54;
          a6 = v57;
          goto LABEL_16;
        }
        v12 = v24;
        a6 = v57;
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v70 = v15;
          v71 = 2112;
          v72 = v27;
          _os_log_error_impl(&dword_1885A9000, v24, OS_LOG_TYPE_ERROR, "Unable to set etag on temporary path \"%@\" - %@", buf, 0x16u);
        }
        v13 = v54;
        v14 = v58;
LABEL_35:

        v43 = 0;
        v20 = v27;
        if (a6)
          goto LABEL_36;
LABEL_42:
        v50 = 0;
        v21 = v20;
        goto LABEL_43;
      }
      v12 = v24;
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        v70 = v11;
        v71 = 2112;
        v72 = v15;
        v73 = 2112;
        v74 = v29;
        _os_log_error_impl(&dword_1885A9000, v24, OS_LOG_TYPE_ERROR, "Unable to unarchive resource \"%@\" to \"%@\" - %@", buf, 0x20u);
      }
      v27 = v29;
    }
    else
    {
      v12 = v24;
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v70 = v11;
        v71 = 2112;
        v72 = v27;
        _os_log_error_impl(&dword_1885A9000, v24, OS_LOG_TYPE_ERROR, "Unable to load data from resource at \"%@\" - %@", buf, 0x16u);
      }
    }
    a6 = v57;
    v14 = v58;
    goto LABEL_35;
  }
  v33 = v10;
  v34 = v13;
  v24 = v12;
  v56 = v33;
  objc_msgSend(v33, "checksum");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v35, "length");

  if (!v36)
  {
    v43 = 0;
    v50 = 0;
    v12 = v24;
    v13 = v34;
    v10 = v56;
    v14 = v58;
    goto LABEL_43;
  }
  v64 = v21;
  v12 = v24;
  v37 = +[GEOUnarchiver unarchiveDataAtURL:toURL:log:error:](GEOUnarchiver, "unarchiveDataAtURL:toURL:log:error:", v11, v15, v24, &v64);
  v20 = v64;

  if (!v37)
  {
    v13 = v34;
    a6 = v57;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v70 = v11;
      v71 = 2112;
      v72 = v15;
      v73 = 2112;
      v74 = v20;
      _os_log_error_impl(&dword_1885A9000, v24, OS_LOG_TYPE_ERROR, "Unable to unarchive resource \"%@\" to \"%@\" - %@", buf, 0x20u);
    }
    v43 = 0;
    goto LABEL_40;
  }
  objc_msgSend(v15, "path");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "checksum");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = v20;
  v40 = GEOSetSHA1OnExtendedAttribute(v38, v39, &v63);
  v27 = v63;

  a6 = v57;
  if (!v40)
  {
    v12 = v24;
    v13 = v34;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v70 = v15;
      v71 = 2112;
      v72 = v27;
      _os_log_error_impl(&dword_1885A9000, v24, OS_LOG_TYPE_ERROR, "Unable to set sha1 on temporary path \"%@\" - %@", buf, 0x16u);
    }
    v43 = 0;
    v20 = v27;
LABEL_40:
    v10 = v56;
LABEL_41:
    v14 = v58;
    if (a6)
      goto LABEL_36;
    goto LABEL_42;
  }
  v32 = v34;
  v10 = v56;
LABEL_16:
  objc_msgSend(v32, "path");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(v58, "fileExistsAtPath:", v41);

  v55 = v32;
  if (!v42)
  {
    v43 = 0;
    v12 = v24;
    v14 = v58;
LABEL_46:
    v60 = v27;
    v52 = objc_msgSend(v14, "moveItemAtURL:toURL:error:", v15, v55, &v60, v55);
    v20 = v60;

    if ((v52 & 1) != 0)
    {
      if (v43)
      {
        v59 = v20;
        v53 = objc_msgSend(v14, "removeItemAtURL:error:", v43, &v59);
        v21 = v59;

        if ((v53 & 1) == 0 && os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v70 = v43;
          v71 = 2112;
          v72 = v21;
          _os_log_impl(&dword_1885A9000, v12, OS_LOG_TYPE_DEFAULT, "Unable remove \"%@\" - %@", buf, 0x16u);
        }
      }
      else
      {
        v21 = v20;
      }
      v13 = v55;
      v50 = v55;
      goto LABEL_43;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v70 = v15;
      v71 = 2112;
      v13 = v55;
      v72 = v55;
      v73 = 2112;
      v74 = v20;
      goto LABEL_65;
    }
    goto LABEL_57;
  }
  objc_msgSend(v32, "URLByAppendingPathExtension:", CFSTR("exchange-folder"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "path");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = objc_msgSend(v58, "fileExistsAtPath:", v44);

  if (v45)
  {
    v62 = v27;
    v46 = objc_msgSend(v58, "removeItemAtURL:error:", v43, &v62);
    v20 = v62;

    if ((v46 & 1) != 0)
    {
      v27 = v20;
      goto LABEL_20;
    }
    v12 = v24;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v70 = v43;
      v71 = 2112;
      v72 = v20;
      _os_log_error_impl(&dword_1885A9000, v24, OS_LOG_TYPE_ERROR, "Unable remove old swap path \"%@\" - %@", buf, 0x16u);
    }
    v13 = v55;
    goto LABEL_41;
  }
LABEL_20:
  v12 = v24;
  v61 = v27;
  v14 = v58;
  v47 = objc_msgSend(v58, "moveItemAtURL:toURL:error:", v55, v43, &v61, v55);
  v20 = v61;

  if ((v47 & 1) != 0)
  {
    v27 = v20;
    goto LABEL_46;
  }
  if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
LABEL_57:
    v13 = v55;
    if (a6)
      goto LABEL_36;
    goto LABEL_42;
  }
  *(_DWORD *)buf = 138412802;
  v13 = v55;
  v70 = v55;
  v71 = 2112;
  v72 = v43;
  v73 = 2112;
  v74 = v20;
LABEL_65:
  _os_log_error_impl(&dword_1885A9000, v12, OS_LOG_TYPE_ERROR, "Unable move \"%@\" to \"%@\" - %@", buf, 0x20u);
  if (!a6)
    goto LABEL_42;
LABEL_36:
  v48 = objc_retainAutorelease(v20);
  v49 = a6;
  v21 = v48;
  v50 = 0;
  *v49 = v48;
LABEL_43:

LABEL_44:
  return v50;
}

- (BOOL)requiresWiFi
{
  return self->_requiresWiFi;
}

- (void)setRequiresWiFi:(BOOL)a3
{
  self->_requiresWiFi = a3;
}

- (BOOL)preferDirectNetworking
{
  return self->_preferDirectNetworking;
}

- (void)setPreferDirectNetworking:(BOOL)a3
{
  self->_preferDirectNetworking = a3;
}

@end
