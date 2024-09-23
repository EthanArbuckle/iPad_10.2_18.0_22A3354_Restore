@implementation ENDownloadManager

- (ENDownloadManager)initWithQueue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  ENDownloadManager *v8;

  v4 = a3;
  ENDataVaultPath();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("Downloads"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E90], "fileURLWithPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[ENDownloadManager initWithDirectoryURL:queue:](self, "initWithDirectoryURL:queue:", v7, v4);

  return v8;
}

- (ENDownloadManager)initWithDirectoryURL:(id)a3 queue:(id)a4
{
  id v6;
  id v7;
  ENDownloadManager *v8;
  uint64_t v9;
  NSURL *directoryURL;
  void *v11;
  ENDownloadManager *v12;
  ENSecureArchiveFileWrapper *v13;
  ENSecureArchiveFileWrapper *stateFileWrapper;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)ENDownloadManager;
  v8 = -[ENDownloadManager init](&v16, sel_init);
  if (!v8)
    goto LABEL_4;
  v9 = objc_msgSend(v6, "copy");
  directoryURL = v8->_directoryURL;
  v8->_directoryURL = (NSURL *)v9;

  objc_storeStrong((id *)&v8->_queue, a4);
  -[NSURL URLByAppendingPathComponent:](v8->_directoryURL, "URLByAppendingPathComponent:", CFSTR("state.dat"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "path");
  v12 = (ENDownloadManager *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v13 = -[ENSecureArchiveFileWrapper initWithPath:]([ENSecureArchiveFileWrapper alloc], "initWithPath:", v12);
    stateFileWrapper = v8->_stateFileWrapper;
    v8->_stateFileWrapper = v13;

LABEL_4:
    v12 = v8;
  }

  return v12;
}

- (void)activate
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __29__ENDownloadManager_activate__block_invoke;
  block[3] = &unk_1E87D9C28;
  block[4] = self;
  dispatch_sync(queue, block);
}

uint64_t __29__ENDownloadManager_activate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_activate");
}

- (void)_activate
{
  void *v3;
  void *v4;
  NSURLSession *v5;
  NSURLSession *URLSession;

  if (!self->_URLSession)
  {
    objc_msgSend(MEMORY[0x1E0C92CA8], "defaultSessionConfiguration");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    ENBundleIdentifierForURLSessions();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "set_sourceApplicationBundleIdentifier:", v4);

    objc_msgSend(MEMORY[0x1E0C92C90], "sessionWithConfiguration:", v3);
    v5 = (NSURLSession *)objc_claimAutoreleasedReturnValue();
    URLSession = self->_URLSession;
    self->_URLSession = v5;

  }
  -[ENDownloadManager _update](self, "_update");
}

- (void)invalidate
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__ENDownloadManager_invalidate__block_invoke;
  block[3] = &unk_1E87D9C28;
  block[4] = self;
  dispatch_sync(queue, block);
}

uint64_t __31__ENDownloadManager_invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidate");
}

- (void)_invalidate
{
  NSBackgroundActivityScheduler *fetchScheduler;
  NSURLSession *URLSession;

  self->_invalidated = 1;
  -[NSBackgroundActivityScheduler invalidate](self->_fetchScheduler, "invalidate");
  fetchScheduler = self->_fetchScheduler;
  self->_fetchScheduler = 0;

  -[ENSecureArchiveFileWrapper close](self->_stateFileWrapper, "close");
  -[NSURLSession invalidateAndCancel](self->_URLSession, "invalidateAndCancel");
  URLSession = self->_URLSession;
  self->_URLSession = 0;

}

- (void)_reportErrorMetric:(unsigned int)a3
{
  void (**errorMetricReporter)(id, _QWORD);

  errorMetricReporter = (void (**)(id, _QWORD))self->_errorMetricReporter;
  if (errorMetricReporter)
    errorMetricReporter[2](errorMetricReporter, *(_QWORD *)&a3);
}

- (void)_reportErrorMetricForHTTPStatus:(int64_t)a3 forIndexFile:(BOOL)a4
{
  int v4;
  int v5;

  if (a4)
    v4 = 8000;
  else
    v4 = 9000;
  if ((unint64_t)a3 <= 0x3E7)
    v5 = a3;
  else
    v5 = 0;
  -[ENDownloadManager _reportErrorMetric:](self, "_reportErrorMetric:", (v4 + v5));
}

- (id)countOfAvailableDownloadsWithError:(id *)a3
{
  NSObject *queue;
  id v4;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__5;
  v11 = __Block_byref_object_dispose__5;
  v12 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__ENDownloadManager_countOfAvailableDownloadsWithError___block_invoke;
  block[3] = &unk_1E87D9F68;
  block[4] = self;
  block[5] = &v7;
  block[6] = a3;
  dispatch_sync(queue, block);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __56__ENDownloadManager_countOfAvailableDownloadsWithError___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_countOfAvailableDownloadsWithError:", *(_QWORD *)(a1 + 48));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_countOfAvailableDownloadsWithError:(id *)a3
{
  void *v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __57__ENDownloadManager__countOfAvailableDownloadsWithError___block_invoke;
  v5[3] = &unk_1E87DB160;
  v5[4] = &v6;
  if (-[ENDownloadManager _enumerateDownloadsWithError:handler:](self, "_enumerateDownloadsWithError:handler:", a3, v5))
  {
    objc_msgSend(MEMORY[0x1E0CB37E0], "numberWithInteger:", v7[3]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __57__ENDownloadManager__countOfAvailableDownloadsWithError___block_invoke(uint64_t a1)
{
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return 2;
}

- (BOOL)enumerateDownloadsWithError:(id *)a3 handler:(id)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD v10[5];
  id v11;
  uint64_t *v12;
  id *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v6 = a4;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 1;
  queue = self->_queue;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __57__ENDownloadManager_enumerateDownloadsWithError_handler___block_invoke;
  v10[3] = &unk_1E87DB188;
  v12 = &v14;
  v13 = a3;
  v10[4] = self;
  v11 = v6;
  v8 = v6;
  dispatch_barrier_sync(queue, v10);
  LOBYTE(self) = *((_BYTE *)v15 + 24);

  _Block_object_dispose(&v14, 8);
  return (char)self;
}

uint64_t __57__ENDownloadManager_enumerateDownloadsWithError_handler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_enumerateDownloadsWithError:handler:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (BOOL)_enumerateDownloadsWithError:(id *)a3 handler:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  uint64_t v33;
  char v34;
  BOOL v35;
  void *v37;
  id *v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  ENDownloadManager *v43;
  int v44;
  void *v45;
  uint64_t v46;
  id v47;
  id obj;
  uint64_t (**v49)(id, _QWORD, void *, id *);
  void *v50;
  id v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  id v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _BYTE v65[128];
  _BYTE v66[128];
  uint64_t v67;
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v49 = (uint64_t (**)(id, _QWORD, void *, id *))a4;
  v6 = objc_alloc_init(MEMORY[0x1E0CB3618]);
  v43 = self;
  -[ENDownloadManagerState endpointStates](self->_state, "endpointStates");
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v61, v68, 16);
  if (v8)
  {
    v9 = v8;
    v38 = a3;
    v10 = 0;
    v11 = *(_QWORD *)v62;
    v40 = *(_QWORD *)v62;
    v41 = *MEMORY[0x1E0C998B8];
    v39 = v7;
    while (2)
    {
      v12 = 0;
      v42 = v9;
      do
      {
        if (*(_QWORD *)v62 != v11)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * v12);
        objc_msgSend(v13, "endpoint", v37);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v50, "enabled"))
        {
          v46 = v12;
          v14 = (void *)MEMORY[0x1E0C99E90];
          -[ENDownloadManager _downloadsDirectoryPathForEndpointState:](v43, "_downloadsDirectoryPathForEndpointState:", v13);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "fileURLWithPath:isDirectory:", v15, 1);
          v16 = objc_claimAutoreleasedReturnValue();

          if (v16)
          {
            v47 = objc_alloc_init(MEMORY[0x1E0C99DE0]);
            v67 = v41;
            objc_msgSend(MEMORY[0x1E0C99D18], "arrayWithObjects:count:", &v67, 1);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v45 = (void *)v16;
            objc_msgSend(v6, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v16, v17, 1, 0);
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            v60 = 0u;
            v58 = 0u;
            v59 = 0u;
            v57 = 0u;
            obj = v18;
            v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v66, 16);
            if (v19)
            {
              v20 = v19;
              v21 = *(_QWORD *)v58;
              while (2)
              {
                v22 = 0;
                v23 = v10;
                do
                {
                  if (*(_QWORD *)v58 != v21)
                    objc_enumerationMutation(obj);
                  v24 = *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * v22);
                  v25 = (void *)MEMORY[0x1D17A7CB8]();
                  v56 = v23;
                  v26 = v49[2](v49, v24, v50, &v56);
                  v10 = v56;

                  if (v26 == 1)
                  {
                    objc_msgSend(v47, "addObject:", v24);
                  }
                  else if (!v26)
                  {
                    if (v10
                      && gLogCategory__ENDownloadManager <= 90
                      && (gLogCategory__ENDownloadManager != -1 || _LogCategory_Initialize()))
                    {
                      CUPrintNSError();
                      v37 = (void *)objc_claimAutoreleasedReturnValue();
                      LogPrintF_safe();

                    }
                    objc_autoreleasePoolPop(v25);
                    v44 = 1;
                    goto LABEL_27;
                  }
                  objc_autoreleasePoolPop(v25);
                  ++v22;
                  v23 = v10;
                }
                while (v20 != v22);
                v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v66, 16);
                if (v20)
                  continue;
                break;
              }
              v44 = 0;
LABEL_27:
              v7 = v39;
            }
            else
            {
              v44 = 0;
            }

            v54 = 0u;
            v55 = 0u;
            v52 = 0u;
            v53 = 0u;
            v27 = v47;
            v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v52, v65, 16);
            if (v28)
            {
              v29 = v28;
              v30 = *(_QWORD *)v53;
              do
              {
                for (i = 0; i != v29; ++i)
                {
                  v32 = v10;
                  if (*(_QWORD *)v53 != v30)
                    objc_enumerationMutation(v27);
                  v33 = *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * i);
                  v51 = v10;
                  v34 = objc_msgSend(v6, "removeItemAtURL:error:", v33, &v51, v37);
                  v10 = v51;

                  if ((v34 & 1) == 0
                    && gLogCategory__ENDownloadManager <= 90
                    && (gLogCategory__ENDownloadManager != -1 || _LogCategory_Initialize()))
                  {
                    CUPrintNSError();
                    v37 = (void *)objc_claimAutoreleasedReturnValue();
                    LogPrintF_safe();

                  }
                }
                v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v52, v65, 16);
              }
              while (v29);
            }

            if (v44)
            {
              if (v38 && v10)
                *v38 = objc_retainAutorelease(v10);
              v35 = v10 == 0;

              goto LABEL_52;
            }

            v11 = v40;
            v9 = v42;
          }
          v12 = v46;
        }

        ++v12;
      }
      while (v12 != v9);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v61, v68, 16);
      if (v9)
        continue;
      break;
    }
  }
  else
  {
    v10 = 0;
  }
  v35 = 1;
LABEL_52:

  return v35;
}

- (void)update
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __27__ENDownloadManager_update__block_invoke;
  block[3] = &unk_1E87D9C28;
  block[4] = self;
  dispatch_sync(queue, block);
}

uint64_t __27__ENDownloadManager_update__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_update");
}

- (void)_update
{
  ENDownloadManager *v2;
  BOOL v3;
  id v4;
  void *v5;
  NSArray *v6;
  NSArray *pendingEndpoints;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  __objc2_class_ro **p_info;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  int v17;
  int v18;
  void *v19;
  void *v20;
  int v21;
  const char *v22;
  void *v23;
  __objc2_class_ro **v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  const char *v34;
  void *v35;
  void *v36;
  NSArray *v37;
  ENDownloadManager *v38;
  void *v39;
  uint64_t v40;
  const char *v41;
  void *v42;
  void *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  id v48;
  _BYTE v49[128];
  uint64_t v50;

  v2 = self;
  v50 = *MEMORY[0x1E0C80C00];
  v48 = 0;
  v3 = -[ENDownloadManager _readStateIfNecessaryWithError:](self, "_readStateIfNecessaryWithError:", &v48);
  v4 = v48;
  v5 = v4;
  if (v3)
  {
    v6 = v2->_pendingEndpoints;
    if (v6)
    {
      v39 = v5;
      v37 = v6;
      -[ENDownloadManagerState setEndpoints:](v2->_state, "setEndpoints:", v6);
      -[ENDownloadManager _saveState](v2, "_saveState");
      pendingEndpoints = v2->_pendingEndpoints;
      v2->_pendingEndpoints = 0;

      v46 = 0u;
      v47 = 0u;
      v44 = 0u;
      v45 = 0u;
      v38 = v2;
      -[ENDownloadManagerState endpointStates](v2->_state, "endpointStates");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
      if (v9)
      {
        v10 = v9;
        v11 = 0x1E87D8000uLL;
        p_info = &OBJC_METACLASS___ENExposureDetectionManager.info;
        v13 = *(_QWORD *)v45;
        v40 = *(_QWORD *)v45;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v45 != v13)
              objc_enumerationMutation(v8);
            v15 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
            objc_msgSend(*(id *)(v11 + 3824), "sharedENLoggingPrefs", v31, v33, v34, v35, v36);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_msgSend(v16, "isSensitiveLoggingAllowed");

            if (v17)
            {
              v18 = *((_DWORD *)p_info + 1010);
              if (v18 <= 30 && (v18 != -1 || _LogCategory_Initialize()))
              {
                objc_msgSend(v15, "shortIdentifier");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v15, "endpoint");
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v43, "serverBaseURL");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v15, "endpoint");
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                v21 = objc_msgSend(v42, "enabled");
                v22 = "no";
                if (v21)
                  v22 = "yes";
                v41 = v22;
                objc_msgSend(v15, "endpoint");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v23, "downloadInterval");
                CUPrintDurationDouble();
                v24 = p_info;
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v15, "lastFetchAttemptDate");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v26, "timeIntervalSinceNow");
                CUPrintDurationDouble();
                v35 = v25;
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                v33 = v20;
                v34 = v41;
                v31 = v19;
                LogPrintF_safe();

                p_info = v24;
                v13 = v40;

                v11 = 0x1E87D8000;
              }
            }
          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
        }
        while (v10);
      }

      v2 = v38;
      v5 = v39;
      v6 = v37;
    }
    -[ENDownloadManager _updateFetchSchedule](v2, "_updateFetchSchedule", v31);
    goto LABEL_19;
  }
  v27 = v4;
  objc_msgSend(v27, "domain");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v28, "isEqualToString:", *MEMORY[0x1E0CAA290]) & 1) != 0)
  {
    v29 = objc_msgSend(v27, "code");

    if (v29 == 16)
    {
      if (gLogCategory_ENDownloadManager <= 30
        && (gLogCategory_ENDownloadManager != -1 || _LogCategory_Initialize()))
      {
        LogPrintF_safe();
      }
      goto LABEL_20;
    }
  }
  else
  {

  }
  if (gLogCategory__ENDownloadManager <= 90
    && (gLogCategory__ENDownloadManager != -1 || _LogCategory_Initialize()))
  {
    CUPrintNSError();
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF_safe();

  }
  if (v27)
  {
    objc_msgSend(v27, "domain");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    if ((-[NSArray isEqualToString:](v6, "isEqualToString:", *MEMORY[0x1E0CB28B0]) & 1) == 0)
    {
LABEL_19:

      goto LABEL_20;
    }
    v30 = objc_msgSend(v27, "code");

    if (v30 == 4864)
    {
      -[ENDownloadManager _reportErrorMetric:](v2, "_reportErrorMetric:", 2004);
      -[ENDownloadManager resetStateFile](v2, "resetStateFile");
    }
  }
LABEL_20:

}

- (void)setDownloadEndpoints:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__ENDownloadManager_setDownloadEndpoints___block_invoke;
  block[3] = &unk_1E87D9DD8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

uint64_t __42__ENDownloadManager_setDownloadEndpoints___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setDownloadEndpoints:", *(_QWORD *)(a1 + 40));
}

- (void)_setDownloadEndpoints:(id)a3
{
  id v4;
  int v5;
  NSArray *v6;
  NSArray *pendingEndpoints;
  uint64_t v8;
  id v9;

  v4 = a3;
  v9 = v4;
  if (gLogCategory_ENDownloadManager <= 10)
  {
    if (gLogCategory_ENDownloadManager != -1 || (v5 = _LogCategory_Initialize(), v4 = v9, v5))
    {
      v8 = objc_msgSend(v4, "count");
      LogPrintF_safe();
      v4 = v9;
    }
  }
  v6 = (NSArray *)objc_msgSend(v4, "copy", v8);
  pendingEndpoints = self->_pendingEndpoints;
  self->_pendingEndpoints = v6;

  -[ENDownloadManager _update](self, "_update");
}

- (unint64_t)enabledEndpointCount
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[ENDownloadManagerState endpointStates](self->_state, "endpointStates", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "endpoint");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v5 += objc_msgSend(v8, "enabled");

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)performDownloadsForced:(BOOL)a3 completion:(id)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD block[5];
  id v10;
  BOOL v11;

  v6 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__ENDownloadManager_performDownloadsForced_completion___block_invoke;
  block[3] = &unk_1E87DB1D8;
  v11 = a3;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_sync(queue, block);

}

void __55__ENDownloadManager_performDownloadsForced_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99D60], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(unsigned __int8 *)(a1 + 48);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __55__ENDownloadManager_performDownloadsForced_completion___block_invoke_2;
  v5[3] = &unk_1E87DB1B0;
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v2, "_performDownloadsWithScheduler:atDate:forced:completion:", 0, v3, v4, v5);

}

uint64_t __55__ENDownloadManager_performDownloadsForced_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)performDownloadsAtDate:(id)a3 forced:(BOOL)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *queue;
  id v11;
  id v12;
  _QWORD block[5];
  id v14;
  id v15;
  BOOL v16;

  v8 = a3;
  v9 = a5;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__ENDownloadManager_performDownloadsAtDate_forced_completion___block_invoke;
  block[3] = &unk_1E87DB200;
  block[4] = self;
  v14 = v8;
  v16 = a4;
  v15 = v9;
  v11 = v9;
  v12 = v8;
  dispatch_sync(queue, block);

}

void __62__ENDownloadManager_performDownloadsAtDate_forced_completion___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(unsigned __int8 *)(a1 + 56);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __62__ENDownloadManager_performDownloadsAtDate_forced_completion___block_invoke_2;
  v4[3] = &unk_1E87DB1B0;
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v1, "_performDownloadsWithScheduler:atDate:forced:completion:", 0, v2, v3, v4);

}

uint64_t __62__ENDownloadManager_performDownloadsAtDate_forced_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_performDownloadsWithScheduler:(id)a3 atDate:(id)a4 forced:(BOOL)a5 completion:(id)a6
{
  _BOOL4 v7;
  id v10;
  const char *v11;
  const char *v12;
  void *v13;
  id v14;
  uint64_t i;
  void *v16;
  const char *v17;
  void *v18;
  char *v19;
  void *v20;
  ENDownloadManager *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  NSObject *queue;
  id v30;
  id v31;
  const char *v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  id v36;
  id v37;
  _BOOL4 v38;
  NSObject *group;
  id v40;
  id obj;
  uint64_t v42;
  uint64_t v43;
  _QWORD block[4];
  id v45;
  ENDownloadManager *v46;
  id v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  _BYTE v57[128];
  uint64_t v58;

  v7 = a5;
  v58 = *MEMORY[0x1E0C80C00];
  v40 = a3;
  v10 = a4;
  v36 = a6;
  if (gLogCategory_ENDownloadManager <= 50
    && (gLogCategory_ENDownloadManager != -1 || _LogCategory_Initialize()))
  {
    if (v40)
      v11 = "scheduled";
    else
      v11 = "immediate";
    if (v7)
      v12 = " (forced)";
    else
      v12 = "";
    -[ENDownloadManagerState endpoints](self->_state, "endpoints");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v12;
    v34 = objc_msgSend(v13, "count");
    v32 = v11;
    LogPrintF_safe();

  }
  group = dispatch_group_create();
  v14 = objc_alloc_init(MEMORY[0x1E0C99DE0]);
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  -[ENDownloadManagerState endpointStates](self->_state, "endpointStates");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v43 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
  if (v43)
  {
    v42 = *(_QWORD *)v53;
    v38 = v7;
    v37 = v10;
    do
    {
      for (i = 0; i != v43; ++i)
      {
        if (*(_QWORD *)v53 != v42)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
        objc_msgSend(v10, "timeIntervalSinceReferenceDate", v32, v33, v34, v35);
        if (-[ENDownloadManager _shouldFetchFromEndpointWithState:time:](self, "_shouldFetchFromEndpointWithState:time:", v16)|| (v17 = "Skipping", v7))
        {
          +[ENDownloadTask taskWithEndpointState:date:group:scheduler:](ENDownloadTask, "taskWithEndpointState:date:group:scheduler:", v16, v10, group, v40);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setLastFetchAttemptDate:", v10);
          dispatch_group_enter(group);
          objc_msgSend(v14, "addObject:", v18);

          v17 = "Initiating";
        }
        if (gLogCategory_ENDownloadManager <= 50
          && (gLogCategory_ENDownloadManager != -1 || _LogCategory_Initialize()))
        {
          objc_msgSend(v16, "shortIdentifier");
          v19 = (char *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "endpoint");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "downloadInterval");
          CUPrintDurationDouble();
          v21 = self;
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "lastFetchAttemptDate");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "timeIntervalSinceNow");
          CUPrintDurationDouble();
          v34 = (uint64_t)v22;
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = v17;
          v33 = v19;
          LogPrintF_safe();

          self = v21;
          v10 = v37;
          v7 = v38;

        }
      }
      v43 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
    }
    while (v43);
  }

  if (objc_msgSend(v14, "count"))
  {
    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    v24 = v14;
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v49;
      do
      {
        for (j = 0; j != v26; ++j)
        {
          if (*(_QWORD *)v49 != v27)
            objc_enumerationMutation(v24);
          -[ENDownloadManager _downloadIndexWithTask:](self, "_downloadIndexWithTask:", *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * j), v32, v33, v34);
        }
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
      }
      while (v26);
    }

    -[ENDownloadManager _saveState](self, "_saveState");
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__ENDownloadManager__performDownloadsWithScheduler_atDate_forced_completion___block_invoke;
  block[3] = &unk_1E87D9D18;
  v45 = v14;
  v46 = self;
  v47 = v36;
  v30 = v36;
  v31 = v14;
  dispatch_group_notify(group, queue, block);

}

uint64_t __77__ENDownloadManager__performDownloadsWithScheduler_atDate_forced_completion___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (!v3)
  {

    v11 = *(_QWORD *)(a1 + 48);
LABEL_13:
    v12 = 1;
    return (*(uint64_t (**)(uint64_t, uint64_t))(v11 + 16))(v11, v12);
  }
  v4 = v3;
  v5 = 0;
  v6 = 0;
  v7 = *(_QWORD *)v15;
  do
  {
    for (i = 0; i != v4; ++i)
    {
      if (*(_QWORD *)v15 != v7)
        objc_enumerationMutation(v2);
      v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
      v5 += objc_msgSend(v9, "downloadCount", (_QWORD)v14);
      v6 |= objc_msgSend(v9, "didDefer");
    }
    v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  }
  while (v4);

  if (v5 >= 1)
  {
    objc_msgSend(MEMORY[0x1E0CB37C8], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "postNotificationName:object:", CFSTR("ENDownloadManagerDownloadsAvailable"), *(_QWORD *)(a1 + 40));

  }
  v11 = *(_QWORD *)(a1 + 48);
  if ((v6 & 1) == 0)
    goto LABEL_13;
  v12 = 2;
  return (*(uint64_t (**)(uint64_t, uint64_t))(v11 + 16))(v11, v12);
}

- (BOOL)_shouldFetchFromEndpointWithState:(id)a3 time:(double)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  BOOL v12;

  v5 = a3;
  objc_msgSend(v5, "endpoint");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "enabled"))
  {
    objc_msgSend(v5, "lastFetchAttemptDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      objc_msgSend(v7, "timeIntervalSinceReferenceDate");
      v10 = v9;
      objc_msgSend(v6, "downloadInterval");
      v12 = v10 + v11 * 0.75 < a4;
    }
    else
    {
      v12 = 1;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)_downloadIndexWithTask:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  CFAbsoluteTime Current;
  NSURLSession *URLSession;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *, void *, void *);
  void *v17;
  ENDownloadManager *v18;
  id v19;
  id v20;
  CFAbsoluteTime v21;

  v4 = a3;
  objc_msgSend(v4, "endpointState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "endpoint");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "serverIndexURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C92C30]), "initWithURL:", v7);
  objc_msgSend(v8, "addValue:forHTTPHeaderField:", CFSTR("text/plain"), CFSTR("Accept"));
  Current = CFAbsoluteTimeGetCurrent();
  URLSession = self->_URLSession;
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __44__ENDownloadManager__downloadIndexWithTask___block_invoke;
  v17 = &unk_1E87DB250;
  v18 = self;
  v19 = v6;
  v20 = v4;
  v21 = Current;
  v11 = v4;
  v12 = v6;
  -[NSURLSession downloadTaskWithRequest:completionHandler:](URLSession, "downloadTaskWithRequest:completionHandler:", v8, &v14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "resume", v14, v15, v16, v17, v18);

}

void __44__ENDownloadManager__downloadIndexWithTask___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  _QWORD block[4];
  id v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  id v23;
  uint64_t v24;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = *(void **)(a1 + 40);
  v11 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__ENDownloadManager__downloadIndexWithTask___block_invoke_2;
  block[3] = &unk_1E87DB228;
  v18 = v8;
  v19 = v10;
  v20 = v9;
  v12 = *(id *)(a1 + 48);
  v13 = *(_QWORD *)(a1 + 32);
  v21 = v12;
  v22 = v13;
  v24 = *(_QWORD *)(a1 + 56);
  v23 = v7;
  v14 = v7;
  v15 = v9;
  v16 = v8;
  dispatch_sync(v11, block);

}

void __44__ENDownloadManager__downloadIndexWithTask___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;

  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    v16 = v2;
    v3 = objc_msgSend(v16, "statusCode");
    objc_msgSend(v16, "MIMEType");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (gLogCategory_ENDownloadManager <= 50
      && (gLogCategory_ENDownloadManager != -1 || _LogCategory_Initialize()))
    {
      objc_msgSend(*(id *)(a1 + 56), "endpointState");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "shortIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      CFAbsoluteTimeGetCurrent();
      CUPrintDurationDouble();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

    }
    if (v3 == 200)
    {
      objc_msgSend(v4, "lowercaseString");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("text/plain"));

      if (v9)
      {
        v11 = *(_QWORD *)(a1 + 56);
        v10 = *(void **)(a1 + 64);
        objc_msgSend(*(id *)(a1 + 72), "path");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "_handleIndexFileDownloadFinishedForTask:filePath:", v11, v12);
LABEL_15:

        return;
      }
      ENErrorF();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 64), "_reportErrorMetric:", 2001, v4);
    }
    else
    {
      ENErrorF();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 64), "_reportErrorMetricForHTTPStatus:forIndexFile:", v3, 1, v3);
    }
    objc_msgSend(*(id *)(a1 + 56), "finishDeferred:error:", 0, v12);
    goto LABEL_15;
  }
  if (gLogCategory_ENDownloadManager <= 90
    && (gLogCategory_ENDownloadManager != -1 || _LogCategory_Initialize()))
  {
    v7 = *(_QWORD *)(a1 + 40);
    CUPrintNSError();
    v13 = v7;
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF_safe();

  }
  objc_msgSend(*(id *)(a1 + 56), "finishDeferred:error:", 0, *(_QWORD *)(a1 + 48), v13, v14);
  objc_msgSend(*(id *)(a1 + 64), "_reportErrorMetric:", 2000);
}

- (id)_baseDirectoryPathForEndpointWithState:(id)a3
{
  NSURL *directoryURL;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;

  directoryURL = self->_directoryURL;
  objc_msgSend(a3, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSURL URLByAppendingPathComponent:](directoryURL, "URLByAppendingPathComponent:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "path");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3490], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ENDownloadManager.m"), 482, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("path != nil"));

  }
  return v9;
}

- (id)_downloadsDirectoryPathForEndpointState:(id)a3
{
  void *v3;
  void *v4;

  -[ENDownloadManager _baseDirectoryPathForEndpointWithState:](self, "_baseDirectoryPathForEndpointWithState:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("Downloads"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_indexFilePathForEndpointState:(id)a3
{
  void *v3;
  void *v4;

  -[ENDownloadManager _baseDirectoryPathForEndpointWithState:](self, "_baseDirectoryPathForEndpointWithState:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("index.txt"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)_copyDownloadedFileAtPath:(id)a3 toPath:(id)a4 removeExisting:(BOOL)a5 error:(id *)a6
{
  _BOOL4 v7;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  BOOL v14;

  v7 = a5;
  v9 = a3;
  v10 = a4;
  v11 = v9;
  if (v11)
  {
    objc_msgSend(v10, "stringByDeletingLastPathComponent");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_alloc_init(MEMORY[0x1E0CB3618]);
    if ((objc_msgSend(v13, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v12, 1, 0, a6) & 1) != 0)
    {
      if (v7
        && objc_msgSend(v13, "fileExistsAtPath:", v10)
        && (objc_msgSend(v13, "removeItemAtPath:error:", v10, a6) & 1) == 0)
      {
        if (gLogCategory_ENDownloadManager > 90
          || gLogCategory_ENDownloadManager == -1 && !_LogCategory_Initialize())
        {
          goto LABEL_22;
        }
      }
      else
      {
        if ((objc_msgSend(v13, "copyItemAtPath:toPath:error:", v11, v10, a6) & 1) != 0)
        {
          v14 = 1;
LABEL_23:

          goto LABEL_24;
        }
        if (gLogCategory_ENDownloadManager > 90
          || gLogCategory_ENDownloadManager == -1 && !_LogCategory_Initialize())
        {
LABEL_22:
          v14 = 0;
          goto LABEL_23;
        }
      }
    }
    else if (gLogCategory_ENDownloadManager > 90
           || gLogCategory_ENDownloadManager == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_22;
    }
    LogPrintF_safe();
    goto LABEL_22;
  }
  if (a6)
  {
    ENErrorF();
    v14 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }
LABEL_24:

  return v14;
}

- (void)_handleIndexFileDownloadFinishedForTask:(id)a3 filePath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  BOOL v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  void *v17;
  id v18;

  v6 = a3;
  v7 = a4;
  if (self->_invalidated)
  {
    ENErrorF();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "finishDeferred:error:", 0, v8);
  }
  else
  {
    objc_msgSend(v6, "endpointState");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (gLogCategory_ENDownloadManager <= 50
      && (gLogCategory_ENDownloadManager != -1 || _LogCategory_Initialize()))
    {
      objc_msgSend(v6, "shortIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v7;
      LogPrintF_safe();

    }
    -[ENDownloadManager _indexFilePathForEndpointState:](self, "_indexFilePathForEndpointState:", v8, v13, v15);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    v10 = -[ENDownloadManager _copyDownloadedFileAtPath:toPath:removeExisting:error:](self, "_copyDownloadedFileAtPath:toPath:removeExisting:error:", v7, v9, 1, &v18);
    v11 = v18;
    if (v10)
    {
      -[ENDownloadManager _downloadNextFileFromServerWithTask:](self, "_downloadNextFileFromServerWithTask:", v6);
    }
    else if (gLogCategory_ENDownloadManager <= 90
           && (gLogCategory_ENDownloadManager != -1 || _LogCategory_Initialize()))
    {
      objc_msgSend(v6, "shortIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      CUPrintNSError();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

      objc_msgSend(v6, "finishDeferred:error:", 0, v11, v12, v17);
    }
    else
    {
      objc_msgSend(v6, "finishDeferred:error:", 0, v11, v14, v16);
    }

  }
}

- (void)_downloadNextFileFromServerWithTask:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  CFAbsoluteTime Current;
  NSURLSession *URLSession;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  id v23;
  CFAbsoluteTime v24;

  v4 = a3;
  v5 = v4;
  if (self->_invalidated)
  {
    ENErrorF();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "finishDeferred:error:", 0, v6);
LABEL_21:

    goto LABEL_22;
  }
  if (!objc_msgSend(v4, "shouldDefer"))
  {
    objc_msgSend(v5, "endpointState");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "endpoint");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ENDownloadManager _nextFilePathToDownloadWithEndpointState:](self, "_nextFilePathToDownloadWithEndpointState:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v7, "serverURLForFileWithRelativePath:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C92C30]), "initWithURL:", v9);
        objc_msgSend(v10, "setValue:forHTTPHeaderField:", CFSTR("application/zip"), CFSTR("Accept"));
        +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isSensitiveLoggingAllowed");

        if (v12
          && gLogCategory_ENDownloadManager <= 50
          && (gLogCategory_ENDownloadManager != -1 || _LogCategory_Initialize()))
        {
          objc_msgSend(v9, "absoluteURL");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "shortIdentifier");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          LogPrintF_safe();

        }
        Current = CFAbsoluteTimeGetCurrent();
        URLSession = self->_URLSession;
        v19[0] = MEMORY[0x1E0C809B0];
        v19[1] = 3221225472;
        v19[2] = __57__ENDownloadManager__downloadNextFileFromServerWithTask___block_invoke;
        v19[3] = &unk_1E87DB2A0;
        v19[4] = self;
        v20 = v5;
        v21 = v9;
        v24 = Current;
        v22 = v8;
        v23 = v6;
        -[NSURLSession downloadTaskWithRequest:completionHandler:](URLSession, "downloadTaskWithRequest:completionHandler:", v10, v19);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "resume");

      }
      else
      {
        ENErrorF();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "finishDeferred:error:", 0, v10);
      }

    }
    else
    {
      if (gLogCategory_ENDownloadManager <= 50
        && (gLogCategory_ENDownloadManager != -1 || _LogCategory_Initialize()))
      {
        objc_msgSend(v6, "identifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF_safe();

      }
      objc_msgSend(v5, "finishDeferred:error:", 0, 0, v17);
    }

    goto LABEL_21;
  }
  objc_msgSend(v5, "finishDeferred:error:", 1, 0);
LABEL_22:

}

void __57__ENDownloadManager__downloadNextFileFromServerWithTask___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD block[4];
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = *(void **)(a1 + 40);
  v11 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__ENDownloadManager__downloadNextFileFromServerWithTask___block_invoke_2;
  block[3] = &unk_1E87DB278;
  v16 = v8;
  v17 = v10;
  v18 = v9;
  v19 = *(_QWORD *)(a1 + 32);
  v20 = *(id *)(a1 + 48);
  v24 = *(_QWORD *)(a1 + 72);
  v21 = *(id *)(a1 + 56);
  v22 = v7;
  v23 = *(id *)(a1 + 64);
  v12 = v7;
  v13 = v9;
  v14 = v8;
  dispatch_sync(v11, block);

}

void __57__ENDownloadManager__downloadNextFileFromServerWithTask___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  id v22;

  v2 = *(void **)(a1 + 32);
  if (!v2)
  {
    objc_msgSend(*(id *)(a1 + 40), "finishDeferred:error:", 0, *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 56), "_reportErrorMetric:", 2002);
    return;
  }
  v22 = v2;
  v3 = objc_msgSend(v22, "statusCode");
  objc_msgSend(v22, "MIMEType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v22, "expectedContentLength");
  if (gLogCategory_ENDownloadManager <= 50)
  {
    v6 = v5;
    if (gLogCategory_ENDownloadManager != -1 || _LogCategory_Initialize())
    {
      objc_msgSend(*(id *)(a1 + 64), "absoluteURL");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "shortIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      CFAbsoluteTimeGetCurrent();
      CUPrintDurationDouble();
      v20 = v4;
      v21 = v6;
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v3;
      v16 = (uint64_t)v7;
      v17 = v8;
      LogPrintF_safe();

    }
  }
  if (v3 == 403)
  {
    if (gLogCategory_ENDownloadManager <= 90
      && (gLogCategory_ENDownloadManager != -1 || _LogCategory_Initialize()))
    {
      objc_msgSend(*(id *)(a1 + 40), "shortIdentifier", v16, v17, v18, v19, v20, v21);
      v16 = 403;
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

    }
    objc_msgSend(*(id *)(a1 + 88), "setLastDownloadedFilePath:", *(_QWORD *)(a1 + 72), v16, v17);
    objc_msgSend(*(id *)(a1 + 56), "_saveState");
    objc_msgSend(*(id *)(a1 + 56), "_downloadNextFileFromServerWithTask:", *(_QWORD *)(a1 + 40));
    goto LABEL_19;
  }
  if (v3 != 200)
  {
    ENErrorF();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "_reportErrorMetricForHTTPStatus:forIndexFile:", v3, 0, v3);
LABEL_16:
    objc_msgSend(*(id *)(a1 + 40), "finishDeferred:error:", 0, v15);

    goto LABEL_19;
  }
  objc_msgSend(v4, "lowercaseString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("application/zip"));

  if (!v10)
  {
    ENErrorF();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "_reportErrorMetric:", 2003, v4);
    goto LABEL_16;
  }
  v11 = *(void **)(a1 + 56);
  v12 = *(_QWORD *)(a1 + 40);
  v13 = *(_QWORD *)(a1 + 72);
  objc_msgSend(*(id *)(a1 + 80), "path");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_handleFileDownloadFinishedForTask:serverFilePath:downloadedFilePath:", v12, v13, v14);

LABEL_19:
}

- (void)_handleFileDownloadFinishedForTask:(id)a3 serverFilePath:(id)a4 downloadedFilePath:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  BOOL v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "endpointState");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (gLogCategory_ENDownloadManager <= 50
    && (gLogCategory_ENDownloadManager != -1 || _LogCategory_Initialize()))
  {
    objc_msgSend(v8, "shortIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF_safe();

  }
  objc_msgSend(v9, "pathComponents", v22);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "componentsJoinedByString:", CFSTR("_"));
  v13 = objc_claimAutoreleasedReturnValue();

  -[ENDownloadManager _downloadsDirectoryPathForEndpointState:](self, "_downloadsDirectoryPathForEndpointState:", v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringByAppendingPathComponent:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = 0;
  LOBYTE(v13) = -[ENDownloadManager _copyDownloadedFileAtPath:toPath:removeExisting:error:](self, "_copyDownloadedFileAtPath:toPath:removeExisting:error:", v10, v15, 0, &v26);

  v16 = v26;
  if ((v13 & 1) != 0)
  {
    objc_msgSend(v8, "date");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setLastSuccessfulFetchDate:", v17);

    objc_msgSend(v11, "setLastDownloadedFilePath:", v9);
    v25 = v16;
    v18 = -[ENDownloadManager _saveStateWithError:](self, "_saveStateWithError:", &v25);
    v19 = v25;

    if (!v18
      && gLogCategory_ENDownloadManager <= 90
      && (gLogCategory_ENDownloadManager != -1 || _LogCategory_Initialize()))
    {
      objc_msgSend(v8, "shortIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      CUPrintNSError();
      v23 = v20;
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

    }
    objc_msgSend(v8, "incrementDownloadCount", v23, v24);
    -[ENDownloadManager _downloadNextFileFromServerWithTask:](self, "_downloadNextFileFromServerWithTask:", v8);
  }
  else
  {
    if (gLogCategory_ENDownloadManager <= 90
      && (gLogCategory_ENDownloadManager != -1 || _LogCategory_Initialize()))
    {
      objc_msgSend(v8, "shortIdentifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      CUPrintNSError();
      v23 = v21;
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

    }
    objc_msgSend(v8, "finishDeferred:error:", 0, v16, v23, v24);
    v19 = v16;
  }

}

- (id)_nextFilePathToDownloadWithEndpointState:(id)a3
{
  id v4;
  id v5;
  int v6;
  int v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  char v12;
  id v13;
  uint64_t *v14;
  void *v15;
  id v16;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;

  v4 = a3;
  -[ENDownloadManager _indexFilePathForEndpointState:](self, "_indexFilePathForEndpointState:", v4);
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v6 = open((const char *)objc_msgSend(v5, "fileSystemRepresentation"), 0);
  if (v6 < 0)
  {
    if (gLogCategory_ENDownloadManager <= 90
      && (gLogCategory_ENDownloadManager != -1 || _LogCategory_Initialize()))
    {
      objc_msgSend(v4, "shortIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      __error();
      LogPrintF_safe();

    }
    v16 = 0;
  }
  else
  {
    v7 = v6;
    objc_msgSend(v4, "lastDownloadedFilePath");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 0;
    v31 = &v30;
    v32 = 0x3032000000;
    v33 = __Block_byref_object_copy__5;
    v34 = __Block_byref_object_dispose__5;
    v35 = 0;
    v24 = 0;
    v25 = &v24;
    v26 = 0x3032000000;
    v27 = __Block_byref_object_copy__5;
    v28 = __Block_byref_object_dispose__5;
    v29 = 0;
    v20 = 0;
    v21 = &v20;
    v22 = 0x2020000000;
    v23 = 0;
    objc_msgSend(MEMORY[0x1E0CB3508], "whitespaceAndNewlineCharacterSet");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v10 = v8;
    v11 = v4;
    v12 = ENReadLinesFromFile();
    v13 = 0;
    close(v7);
    if ((v12 & 1) != 0)
    {
      if (*((_BYTE *)v21 + 24))
        v14 = v25;
      else
        v14 = v31;
      v16 = (id)v14[5];
    }
    else
    {
      if (gLogCategory_ENDownloadManager <= 90
        && (gLogCategory_ENDownloadManager != -1 || _LogCategory_Initialize()))
      {
        objc_msgSend(v11, "shortIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        CUPrintNSError();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF_safe();

      }
      v16 = 0;
    }

    _Block_object_dispose(&v20, 8);
    _Block_object_dispose(&v24, 8);

    _Block_object_dispose(&v30, 8);
  }

  return v16;
}

void __62__ENDownloadManager__nextFilePathToDownloadWithEndpointState___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id *v9;
  uint64_t v10;
  id obj;

  objc_msgSend(a2, "stringByTrimmingCharactersInSet:", *(_QWORD *)(a1 + 32));
  obj = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(obj, "length"))
  {
    v5 = *(void **)(a1 + 40);
    if (v5
      && !*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24)
      && objc_msgSend(v5, "isEqualToString:", obj))
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
      goto LABEL_17;
    }
    objc_msgSend(*(id *)(a1 + 48), "endpoint");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "serverURLForFileWithRelativePath:", obj);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
      {
        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), obj);
LABEL_9:
        *a3 = 1;
        goto LABEL_17;
      }
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
      v10 = *(_QWORD *)(v8 + 40);
      v9 = (id *)(v8 + 40);
      if (!v10)
      {
        objc_storeStrong(v9, obj);
        if (!*(_QWORD *)(a1 + 40))
          goto LABEL_9;
      }
    }
    else if (gLogCategory_ENDownloadManager <= 90
           && (gLogCategory_ENDownloadManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
  }
LABEL_17:

}

- (void)purgeAllDownloads
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__ENDownloadManager_purgeAllDownloads__block_invoke;
  block[3] = &unk_1E87D9C28;
  block[4] = self;
  dispatch_sync(queue, block);
}

uint64_t __38__ENDownloadManager_purgeAllDownloads__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_purgeAllDownloads");
}

- (void)_purgeAllDownloads
{
  void *v3;
  void *v4;
  void *v5;
  ENDownloadManagerState *state;
  void *v7;
  void *v8;
  char v9;
  id v10;
  void *v11;
  id v12;

  if (gLogCategory_ENDownloadManager <= 50
    && (gLogCategory_ENDownloadManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
  objc_msgSend(MEMORY[0x1E0C99E68], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D60], "distantPast");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ENDownloadManager _purgeKeepingDownloadsForIdentifiers:expiryDate:](self, "_purgeKeepingDownloadsForIdentifiers:expiryDate:", v3, v4);

  -[ENDownloadManagerState endpoints](self->_state, "endpoints");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  state = self->_state;
  self->_state = 0;

  -[ENSecureArchiveFileWrapper close](self->_stateFileWrapper, "close");
  objc_msgSend(MEMORY[0x1E0CB3618], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ENSecureArchiveFileWrapper path](self->_stateFileWrapper, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v9 = objc_msgSend(v7, "removeItemAtPath:error:", v8, &v12);
  v10 = v12;

  if ((v9 & 1) == 0
    && gLogCategory__ENDownloadManager <= 90
    && (gLogCategory__ENDownloadManager != -1 || _LogCategory_Initialize()))
  {
    CUPrintNSError();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF_safe();

  }
  -[ENDownloadManager _setDownloadEndpoints:](self, "_setDownloadEndpoints:", v5, v11);

}

- (void)purgeExpiredDownloadsWithDate:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__ENDownloadManager_purgeExpiredDownloadsWithDate___block_invoke;
  block[3] = &unk_1E87D9DD8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

uint64_t __51__ENDownloadManager_purgeExpiredDownloadsWithDate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_purgeExpiredDownloadsWithDate:", *(_QWORD *)(a1 + 40));
}

- (void)_purgeExpiredDownloadsWithDate:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_state)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99E28]);
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    -[ENDownloadManagerState endpointStates](self->_state, "endpointStates");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v7)
    {
      v8 = v7;
      v16 = v4;
      v9 = 0;
      v10 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v18 != v10)
            objc_enumerationMutation(v6);
          v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          objc_msgSend(v12, "endpoint");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "enabled");

          if (v14)
          {
            objc_msgSend(v12, "identifier");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "addObject:", v15);

          }
          else
          {
            objc_msgSend(v12, "setLastDownloadedFilePath:", 0);
            v9 = 1;
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v8);

      v4 = v16;
      -[ENDownloadManager _purgeKeepingDownloadsForIdentifiers:expiryDate:](self, "_purgeKeepingDownloadsForIdentifiers:expiryDate:", v5, v16);
      if ((v9 & 1) != 0)
        -[ENDownloadManager _saveState](self, "_saveState");
    }
    else
    {

      -[ENDownloadManager _purgeKeepingDownloadsForIdentifiers:expiryDate:](self, "_purgeKeepingDownloadsForIdentifiers:expiryDate:", v5, v4);
    }

  }
  else if (gLogCategory__ENDownloadManager <= 90
         && (gLogCategory__ENDownloadManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }

}

- (void)_purgeKeepingDownloadsForIdentifiers:(id)a3 expiryDate:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  char v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  id v28;
  ENDownloadManager *v29;
  id v30;
  id v31;
  id obj;
  _QWORD v33[4];
  id v34;
  _QWORD *v35;
  _QWORD *v36;
  id v37;
  _QWORD v38[4];
  _QWORD v39[4];
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v31 = a3;
  v28 = a4;
  v30 = objc_alloc_init(MEMORY[0x1E0C99DE0]);
  v6 = objc_alloc_init(MEMORY[0x1E0CB3618]);
  v29 = self;
  objc_msgSend(v6, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", self->_directoryURL, 0, 1, 0);
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v46;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v46 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
        v11 = (void *)MEMORY[0x1D17A7CB8]();
        LOBYTE(v39[0]) = 0;
        objc_msgSend(v10, "path");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v6, "fileExistsAtPath:isDirectory:", v12, v39);
        if (LOBYTE(v39[0]))
          v14 = v13;
        else
          v14 = 0;
        if (v14 == 1)
        {
          objc_msgSend(v10, "path");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "lastPathComponent");
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A30]), "initWithUUIDString:", v16);
          if (v17 && (objc_msgSend(v31, "containsObject:", v17) & 1) == 0)
            objc_msgSend(v30, "addObject:", v10);

        }
        objc_autoreleasePoolPop(v11);
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
    }
    while (v7);
  }

  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v18 = v30;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
  if (v19)
  {
    v20 = *(_QWORD *)v42;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v42 != v20)
          objc_enumerationMutation(v18);
        v22 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * j);
        if (gLogCategory_ENDownloadManager <= 50
          && (gLogCategory_ENDownloadManager != -1 || _LogCategory_Initialize()))
        {
          objc_msgSend(v22, "path", v27);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          LogPrintF_safe();

        }
        v40 = 0;
        v23 = objc_msgSend(v6, "removeItemAtURL:error:", v22, &v40, v27);
        v24 = v40;
        if ((v23 & 1) == 0
          && gLogCategory__ENDownloadManager <= 90
          && (gLogCategory__ENDownloadManager != -1 || _LogCategory_Initialize()))
        {
          CUPrintNSError();
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          LogPrintF_safe();

        }
      }
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
    }
    while (v19);
  }

  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x2020000000;
  v39[3] = 0;
  v38[0] = 0;
  v38[1] = v38;
  v38[2] = 0x2020000000;
  v38[3] = 0;
  v37 = 0;
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __69__ENDownloadManager__purgeKeepingDownloadsForIdentifiers_expiryDate___block_invoke;
  v33[3] = &unk_1E87DB2F0;
  v35 = v39;
  v25 = v28;
  v34 = v25;
  v36 = v38;
  -[ENDownloadManager _enumerateDownloadsWithError:handler:](v29, "_enumerateDownloadsWithError:handler:", &v37, v33);
  v26 = v37;
  if (gLogCategory_ENDownloadManager <= 50
    && (gLogCategory_ENDownloadManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }

  _Block_object_dispose(v38, 8);
  _Block_object_dispose(v39, 8);

}

uint64_t __69__ENDownloadManager__purgeKeepingDownloadsForIdentifiers_expiryDate___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t v4;
  char v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v11;
  id v12;
  id v13;

  v3 = a2;
  ++*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24);
  v13 = 0;
  v4 = *MEMORY[0x1E0C998B8];
  v12 = 0;
  v5 = objc_msgSend(v3, "getResourceValue:forKey:error:", &v13, v4, &v12);
  v6 = v13;
  v7 = v12;
  if ((v5 & 1) == 0)
  {
    if (gLogCategory__ENDownloadManager <= 90
      && (gLogCategory__ENDownloadManager != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

    }
    goto LABEL_14;
  }
  if (!v6)
  {
    if (gLogCategory__ENDownloadManager <= 90
      && (gLogCategory__ENDownloadManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
    goto LABEL_14;
  }
  objc_msgSend(v6, "earlierDate:", a1[4]);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 != v6)
  {
LABEL_14:
    v9 = 2;
    goto LABEL_15;
  }
  ++*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24);
  v9 = 1;
LABEL_15:

  return v9;
}

- (BOOL)resetStateFile
{
  id v3;
  NSURL *directoryURL;
  void *v5;
  void *v6;
  char v7;
  id v8;
  ENDownloadManagerState *state;
  BOOL v10;
  void *v12;
  id v13;

  v3 = objc_alloc_init(MEMORY[0x1E0CB3618]);
  directoryURL = self->_directoryURL;
  if (directoryURL)
  {
    -[NSURL URLByAppendingPathComponent:](directoryURL, "URLByAppendingPathComponent:", CFSTR("state.dat"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "path");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v13 = 0;
      v7 = objc_msgSend(v3, "removeItemAtPath:error:", v6, &v13);
      v8 = v13;
      if ((v7 & 1) != 0)
      {
        state = self->_state;
        self->_state = 0;

        -[ENSecureArchiveFileWrapper close](self->_stateFileWrapper, "close");
        if (gLogCategory_ENDownloadManager <= 50
          && (gLogCategory_ENDownloadManager != -1 || _LogCategory_Initialize()))
        {
          LogPrintF_safe();
        }
        v10 = 1;
        goto LABEL_9;
      }
      if (gLogCategory__ENDownloadManager <= 90
        && (gLogCategory__ENDownloadManager != -1 || _LogCategory_Initialize()))
      {
        CUPrintNSError();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF_safe();

      }
    }
    else
    {
      if (gLogCategory__ENDownloadManager <= 90
        && (gLogCategory__ENDownloadManager != -1 || _LogCategory_Initialize()))
      {
        LogPrintF_safe();
      }
      v8 = 0;
    }
    v10 = 0;
LABEL_9:

    goto LABEL_10;
  }
  if (gLogCategory__ENDownloadManager <= 90
    && (gLogCategory__ENDownloadManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
  v10 = 0;
LABEL_10:

  return v10;
}

- (void)_updateFetchSchedule
{
  NSArray *pendingEndpoints;
  NSArray *v4;
  NSArray *v5;
  NSBackgroundActivityScheduler *v6;
  NSBackgroundActivityScheduler *fetchScheduler;
  xpc_object_t v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  NSBackgroundActivityScheduler *v13;
  OS_dispatch_queue *v14;
  NSBackgroundActivityScheduler *v15;
  OS_dispatch_queue *v16;
  int v17;
  NSBackgroundActivityScheduler *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  _QWORD v22[4];
  OS_dispatch_queue *v23;
  id v24;
  id location;

  pendingEndpoints = self->_pendingEndpoints;
  if (pendingEndpoints)
  {
    v4 = pendingEndpoints;
  }
  else
  {
    -[ENDownloadManagerState endpoints](self->_state, "endpoints");
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;
  if (!self->_fetchScheduler && (-[NSArray count](v4, "count") || !self->_didUnscheduleOnce))
  {
    -[ENDownloadManager createScheduler](self, "createScheduler");
    v6 = (NSBackgroundActivityScheduler *)objc_claimAutoreleasedReturnValue();
    fetchScheduler = self->_fetchScheduler;
    self->_fetchScheduler = v6;

    -[NSBackgroundActivityScheduler setQualityOfService:](self->_fetchScheduler, "setQualityOfService:", 17);
    -[NSBackgroundActivityScheduler setInterval:](self->_fetchScheduler, "setInterval:", 1.79769313e308);
    v8 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_BOOL(v8, (const char *)*MEMORY[0x1E0C80738], 1);
    xpc_dictionary_set_BOOL(v8, (const char *)*MEMORY[0x1E0C808D0], 1);
    xpc_dictionary_set_BOOL(v8, (const char *)*MEMORY[0x1E0C808B8], 1);
    -[NSBackgroundActivityScheduler _setAdditionalXPCActivityProperties:](self->_fetchScheduler, "_setAdditionalXPCActivityProperties:", v8);

  }
  if (-[NSArray count](v5, "count"))
  {
    -[ENDownloadManager _aggregateDownloadIntervalFromEndpoints:](self, "_aggregateDownloadIntervalFromEndpoints:", v5);
    v10 = v9;
    -[NSBackgroundActivityScheduler interval](self->_fetchScheduler, "interval");
    if (v11 != v10)
    {
      if (gLogCategory_ENDownloadManager <= 50
        && (gLogCategory_ENDownloadManager != -1 || _LogCategory_Initialize()))
      {
        -[NSBackgroundActivityScheduler identifier](self->_fetchScheduler, "identifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        CUPrintDurationDouble();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = -[NSArray count](v5, "count");
        v19 = v12;
        LogPrintF_safe();

      }
      -[NSBackgroundActivityScheduler setInterval:](self->_fetchScheduler, "setInterval:", v10, v19, v20, v21);
      -[NSBackgroundActivityScheduler setTolerance:](self->_fetchScheduler, "setTolerance:", v10 * 0.25);
      -[NSBackgroundActivityScheduler setRepeats:](self->_fetchScheduler, "setRepeats:", 1);
      v14 = self->_queue;
      location = 0;
      objc_initWeak(&location, self);
      v15 = self->_fetchScheduler;
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __41__ENDownloadManager__updateFetchSchedule__block_invoke;
      v22[3] = &unk_1E87DB318;
      objc_copyWeak(&v24, &location);
      v16 = v14;
      v23 = v16;
      -[NSBackgroundActivityScheduler scheduleWithBlock:](v15, "scheduleWithBlock:", v22);

      objc_destroyWeak(&v24);
      objc_destroyWeak(&location);

    }
  }
  else
  {
    v13 = self->_fetchScheduler;
    if (v13)
    {
      if (gLogCategory_ENDownloadManager <= 50)
      {
        if (gLogCategory_ENDownloadManager != -1 || (v17 = _LogCategory_Initialize(), v13 = self->_fetchScheduler, v17))
        {
          -[NSBackgroundActivityScheduler identifier](v13, "identifier");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          LogPrintF_safe();

          v13 = self->_fetchScheduler;
        }
      }
      -[NSBackgroundActivityScheduler invalidate](v13, "invalidate", v19);
      v18 = self->_fetchScheduler;
      self->_fetchScheduler = 0;

      self->_didUnscheduleOnce = 1;
    }
  }

}

void __41__ENDownloadManager__updateFetchSchedule__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = *(NSObject **)(a1 + 32);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __41__ENDownloadManager__updateFetchSchedule__block_invoke_2;
    v7[3] = &unk_1E87DA188;
    v8 = WeakRetained;
    v9 = v3;
    dispatch_async(v6, v7);

  }
  else
  {
    (*((void (**)(id, uint64_t))v3 + 2))(v3, 1);
  }

}

uint64_t __41__ENDownloadManager__updateFetchSchedule__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_backgroundActivityFiredWithCompletion:", *(_QWORD *)(a1 + 40));
}

- (void)_backgroundActivityFiredWithCompletion:(id)a3
{
  NSBackgroundActivityScheduler *v4;
  void *v5;
  void (**v6)(id, uint64_t);

  v6 = (void (**)(id, uint64_t))a3;
  if (gLogCategory_ENDownloadManager <= 50
    && (gLogCategory_ENDownloadManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
  v4 = self->_fetchScheduler;
  if (v4)
  {
    -[ENDownloadManager _update](self, "_update");
    objc_msgSend(MEMORY[0x1E0C99D60], "date");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ENDownloadManager _performDownloadsWithScheduler:atDate:forced:completion:](self, "_performDownloadsWithScheduler:atDate:forced:completion:", v4, v5, 0, v6);

  }
  else
  {
    if (gLogCategory_ENDownloadManager <= 50
      && (gLogCategory_ENDownloadManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
    v6[2](v6, 1);
  }

}

- (double)_aggregateDownloadIntervalFromEndpoints:(id)a3
{
  id v3;
  uint64_t v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  uint64_t i;
  void *v10;
  double v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  v5 = 86400.0;
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v14;
    v8 = 1.79769313e308;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v3);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v10, "enabled"))
        {
          objc_msgSend(v10, "downloadInterval");
          if (v11 < v8)
            v8 = v11;
        }
      }
      v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
    if (v8 <= 28800.0)
    {
      v5 = 28800.0;
      if (v8 <= 14400.0)
        v5 = dbl_1CC251300[v8 > 7200.0];
    }
  }

  return v5;
}

- (BOOL)_readStateIfNecessaryWithError:(id *)a3
{
  _BOOL4 v3;
  void *v7;
  id v8;
  ENSecureArchiveFileWrapper *stateFileWrapper;
  id v10;
  void *v11;
  ENDownloadManagerState *v12;
  ENDownloadManagerState *state;
  void *v15;
  id v16;

  if (self->_state)
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    -[NSURL path](self->_directoryURL, "path");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3490], "currentHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ENDownloadManager.m"), 991, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("directoryPath != nil"));

    }
    v8 = objc_alloc_init(MEMORY[0x1E0CB3618]);
    if (objc_msgSend(v8, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v7, 1, 0, a3))
    {
      if (!-[NSURL setResourceValue:forKey:error:](self->_directoryURL, "setResourceValue:forKey:error:", MEMORY[0x1E0C9AA98], *MEMORY[0x1E0C999E0], a3)&& gLogCategory_ENDownloadManager <= 90&& (gLogCategory_ENDownloadManager != -1 || _LogCategory_Initialize()))
      {
        LogPrintF_safe();
      }
      stateFileWrapper = self->_stateFileWrapper;
      v16 = 0;
      v3 = -[ENSecureArchiveFileWrapper readObject:ofClass:error:](stateFileWrapper, "readObject:ofClass:error:", &v16, objc_opt_class(), a3);
      v10 = v16;
      v11 = v10;
      if (v3)
      {
        if (v10)
          v12 = (ENDownloadManagerState *)v10;
        else
          v12 = objc_alloc_init(ENDownloadManagerState);
        state = self->_state;
        self->_state = v12;

      }
    }
    else
    {
      LOBYTE(v3) = 0;
    }

  }
  return v3;
}

- (BOOL)_saveState
{
  BOOL v2;
  id v3;
  void *v5;
  id v6;

  v6 = 0;
  v2 = -[ENDownloadManager _saveStateWithError:](self, "_saveStateWithError:", &v6);
  v3 = v6;
  if (!v2
    && gLogCategory_ENDownloadManager <= 90
    && (gLogCategory_ENDownloadManager != -1 || _LogCategory_Initialize()))
  {
    CUPrintNSError();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF_safe();

  }
  return v2;
}

- (BOOL)_saveStateWithError:(id *)a3
{
  ENDownloadManagerState *state;

  state = self->_state;
  return !state
      || -[ENSecureArchiveFileWrapper saveObject:error:](self->_stateFileWrapper, "saveObject:error:", state, a3);
}

- (id)createScheduler
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB34B8]), "initWithIdentifier:", CFSTR("com.apple.ExposureNotification.periodicDownload"));
}

- (id)description
{
  void *v2;
  void *v3;
  uint64_t v4;
  const char *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  uint64_t v18;
  double v19;
  id v20;
  void *v21;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  id obj;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  id v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  -[ENDownloadManager state](self, "state");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endpointStates");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "count");
  v34 = 0;
  v5 = "s";
  if (v4 == 1)
    v5 = "";
  v23 = v4;
  v27 = v5;
  NSAppendPrintF_safe();
  v6 = v34;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = v3;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16, v23, v27);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v31 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        objc_msgSend(v11, "endpoint", v24);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "region");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        NSAppendPrintF_safe();
        v13 = v6;

        if ((objc_msgSend(v12, "enabled", v25) & 1) == 0)
        {
          NSAppendPrintF_safe();
          v14 = v13;

          v13 = v14;
        }
        objc_msgSend(v11, "lastFetchAttemptDate");
        v15 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "lastSuccessfulFetchDate");
        v16 = objc_claimAutoreleasedReturnValue();
        if (v15 | v16)
        {
          objc_msgSend((id)v15, "timeIntervalSinceNow");
          v18 = -v17;
          objc_msgSend((id)v16, "timeIntervalSinceNow");
          v26 = v18;
          v28 = -v19;
          NSAppendPrintF();
          v20 = v13;

          v13 = v20;
        }
        objc_msgSend(v12, "serverBaseURL", v26, v28);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "absoluteString");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        NSAppendPrintF_safe();
        v6 = v13;

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16, v24);
    }
    while (v8);
  }

  return v6;
}

- (NSURL)directoryURL
{
  return self->_directoryURL;
}

- (id)errorMetricReporter
{
  return self->_errorMetricReporter;
}

- (void)setErrorMetricReporter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSBackgroundActivityScheduler)fetchScheduler
{
  return self->_fetchScheduler;
}

- (NSURLSession)URLSession
{
  return self->_URLSession;
}

- (void)setURLSession:(id)a3
{
  objc_storeStrong((id *)&self->_URLSession, a3);
}

- (ENDownloadManagerState)state
{
  return self->_state;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_URLSession, 0);
  objc_storeStrong((id *)&self->_fetchScheduler, 0);
  objc_storeStrong(&self->_errorMetricReporter, 0);
  objc_storeStrong((id *)&self->_directoryURL, 0);
  objc_storeStrong((id *)&self->_stateFileWrapper, 0);
  objc_storeStrong((id *)&self->_pendingEndpoints, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
