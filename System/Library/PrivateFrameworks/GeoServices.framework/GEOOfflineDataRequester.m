@implementation GEOOfflineDataRequester

- (GEOOfflineDataRequester)initWithRequest:(id)a3 requestOptions:(unint64_t)a4 auditToken:(id)a5 log:(id)a6 logPrefix:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  GEOOfflineDataRequester *v17;
  GEOOfflineDataRequester *v18;
  uint64_t v19;
  NSString *logPrefix;
  uint64_t v21;
  GEODataURLSession *dataSession;
  uint64_t v23;
  OS_dispatch_queue *workQueue;
  GEOOfflineDataRequester *v25;
  objc_super v27;

  v13 = a3;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v27.receiver = self;
  v27.super_class = (Class)GEOOfflineDataRequester;
  v17 = -[GEOOfflineDataRequester init](&v27, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_request, a3);
    v18->_requestOptions = a4;
    objc_storeStrong((id *)&v18->_auditToken, a5);
    objc_storeStrong((id *)&v18->_log, a6);
    v19 = objc_msgSend(v16, "copy");
    logPrefix = v18->_logPrefix;
    v18->_logPrefix = (NSString *)v19;

    +[GEODataURLSession sharedDataURLSession](GEODataURLSession, "sharedDataURLSession");
    v21 = objc_claimAutoreleasedReturnValue();
    dataSession = v18->_dataSession;
    v18->_dataSession = (GEODataURLSession *)v21;

    geo_dispatch_queue_create_with_workloop_qos();
    v23 = objc_claimAutoreleasedReturnValue();
    workQueue = v18->_workQueue;
    v18->_workQueue = (OS_dispatch_queue *)v23;

    v25 = v18;
  }

  return v18;
}

- (void)start
{
  NSObject *workQueue;
  _QWORD block[5];

  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__GEOOfflineDataRequester_start__block_invoke;
  block[3] = &unk_1E1BFF6F8;
  block[4] = self;
  dispatch_async(workQueue, block);
}

void __32__GEOOfflineDataRequester_start__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  GEODataRequest *v6;
  _QWORD *v7;
  _QWORD *v8;
  GEODataRequest *v9;
  void *v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;

  +[GEORequestCounter sharedCounter](GEORequestCounter, "sharedCounter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
  if (v4)
  {
    objc_msgSend(v2, "requestCounterTicketForType:auditToken:traits:", 2859, v4, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[GEOApplicationAuditToken currentProcessAuditToken](GEOApplicationAuditToken, "currentProcessAuditToken");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "requestCounterTicketForType:auditToken:traits:", 2859, v5, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v6 = [GEODataRequest alloc];
  v7 = *(_QWORD **)(*(_QWORD *)(a1 + 32) + 8);
  if (v7)
    v7 = (_QWORD *)v7[2];
  v8 = v7;
  v9 = -[GEODataRequest initWithKind:URL:auditToken:timeoutInterval:additionalHTTPHeaders:bodyData:userAgent:entityTag:cachedData:requestCounterTicket:multipathServiceType:multipathAlternatePort:throttleToken:options:](v6, "initWithKind:URL:auditToken:timeoutInterval:additionalHTTPHeaders:bodyData:userAgent:entityTag:cachedData:requestCounterTicket:multipathServiceType:multipathAlternatePort:throttleToken:options:", 2859, v8, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), 0, 0, 0, GEOConfigGetDouble(GeoOfflineConfig_BatchDownloadTimeout, (uint64_t)off_1EDF4EB28), 0, 0, v15, 0, 0, 0, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));

  +[GEODataURLSession sharedDataURLSession](GEODataURLSession, "sharedDataURLSession");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v11) = *MEMORY[0x1E0CB3338];
  objc_msgSend(v10, "downloadTaskWithRequest:priority:delegate:delegateQueue:", v9, *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64), v11);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = *(_QWORD *)(a1 + 32);
  v14 = *(void **)(v13 + 72);
  *(_QWORD *)(v13 + 72) = v12;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "start");
}

- (void)cancel
{
  NSObject *workQueue;
  _QWORD block[5];

  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__GEOOfflineDataRequester_cancel__block_invoke;
  block[3] = &unk_1E1BFF6F8;
  block[4] = self;
  dispatch_async(workQueue, block);
}

uint64_t __33__GEOOfflineDataRequester_cancel__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "cancel");
}

- (void)dataURLSession:(id)a3 didCompleteTask:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  char v8;
  id v9;
  void *v10;
  void *v11;
  OS_os_log *log;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  NSString *logPrefix;
  NSObject *v28;
  NSString *v29;
  NSObject *v30;
  uint64_t v31;
  GEOTileData *v32;
  void *v33;
  GEOTileData *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  id v45;
  id v46;
  uint8_t buf[4];
  NSString *v48;
  __int16 v49;
  uint64_t v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  if (objc_msgSend(v5, "failedDueToCancel"))
  {
    -[GEOOfflineDataRequester delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -2, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "offlineRequester:didFailWithError:", self, v7);

  }
  else
  {
    v46 = 0;
    v8 = objc_msgSend(v5, "validateTransportWithError:", &v46);
    v9 = v46;
    v10 = v9;
    if ((v8 & 1) != 0)
    {
      v39 = v9;
      v40 = v5;
      objc_msgSend(v5, "downloadedFileURL");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      log = self->_log;
      v45 = 0;
      +[GEOUnarchiver getContentsOfArchiveAtURL:log:error:](GEOUnarchiver, "getContentsOfArchiveAtURL:log:error:", v11, log, &v45);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v45;

      if (!v13)
      {
        -[GEOOfflineDataRequester delegate](self, "delegate");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "offlineRequester:didFailWithError:", self, v14);

      }
      v38 = v14;
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v13, "count"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = 0u;
      v42 = 0u;
      v43 = 0u;
      v44 = 0u;
      v17 = v13;
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v41, v51, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v42;
        do
        {
          for (i = 0; i != v19; ++i)
          {
            if (*(_QWORD *)v42 != v20)
              objc_enumerationMutation(v17);
            v22 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
            objc_msgSend(v22, "filePath");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "lastPathComponent");
            v24 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x1E0C99D50], "_geo_dataForHexString:", v24);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            if (v25)
            {
              objc_msgSend(v16, "setObject:forKey:", v22, v25);
            }
            else
            {
              v26 = self->_log;
              if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
              {
                logPrefix = self->_logPrefix;
                *(_DWORD *)buf = 138543618;
                v48 = logPrefix;
                v49 = 2114;
                v50 = (uint64_t)v24;
                _os_log_impl(&dword_1885A9000, v26, OS_LOG_TYPE_FAULT, "%{public}@ Archive contains unexpected filename: %{public}@", buf, 0x16u);
              }
            }

          }
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v41, v51, 16);
        }
        while (v19);
      }

      v28 = self->_log;
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      {
        v29 = self->_logPrefix;
        v30 = v28;
        v31 = objc_msgSend(v16, "count");
        *(_DWORD *)buf = 138543618;
        v48 = v29;
        v49 = 2050;
        v50 = v31;
        _os_log_impl(&dword_1885A9000, v30, OS_LOG_TYPE_DEBUG, "%{public}@ Archive contains %{public}llu data keys", buf, 0x16u);

      }
      v32 = [GEOTileData alloc];
      v5 = v40;
      objc_msgSend(v40, "downloadedFileURL");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = -[GEOTileData initWithFileURL:](v32, "initWithFileURL:", v33);

      -[GEOOfflineDataRequester delegate](self, "delegate");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "entityTag");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "offlineRequester:didFinishWithData:withETag:containingDataKeys:", self, v34, v36, v16);

      v37 = v38;
      v10 = v39;
    }
    else
    {
      -[GEOOfflineDataRequester delegate](self, "delegate");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "offlineRequester:didFailWithError:", self, v10);
    }

  }
}

- (GEOOfflineDataRequest)request
{
  return self->_request;
}

- (GEOOfflineDataRequesterDelegate)delegate
{
  return (GEOOfflineDataRequesterDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_task, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_dataSession, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_logPrefix, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_auditToken, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

@end
