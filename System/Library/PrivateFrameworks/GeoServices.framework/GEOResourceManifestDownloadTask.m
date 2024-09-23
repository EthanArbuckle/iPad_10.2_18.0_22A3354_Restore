@implementation GEOResourceManifestDownloadTask

- (void)dataURLSession:(id)a3 didCompleteTask:(id)a4
{
  GEODataURLSessionTask *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  id v12;
  id v13;
  NSObject *v14;
  BOOL v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  GEOResources *v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  NSObject *v25;
  NSURL *url;
  uint64_t v27;
  id v28;
  id v29;
  id v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  int v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = (GEODataURLSessionTask *)a4;
  if (self->_task == v5)
  {
    GEOGetResourceManifestLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      -[GEODataURLSessionTask originalRequestURL](v5, "originalRequestURL");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEODataURLSessionTask error](v5, "error");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "domain");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEODataURLSessionTask error](v5, "error");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v32 = v7;
      v33 = 2114;
      v34 = v9;
      v35 = 1024;
      v36 = objc_msgSend(v10, "code");
      _os_log_impl(&dword_1885A9000, v6, OS_LOG_TYPE_DEBUG, "Finished loading manifest from '%{public}@': error: %{public}@ / %u", buf, 0x1Cu);

    }
    -[GEOResourceManifestDownloadTask _recordNetworkEventDataForTask:](self, "_recordNetworkEventDataForTask:", v5);
    v29 = 0;
    v30 = 0;
    v11 = -[GEODataURLSessionTask didValidateEntityTagForData:entityTag:](v5, "didValidateEntityTagForData:entityTag:", &v30, &v29);
    v12 = v30;
    v13 = v29;
    if (v11)
    {
      GEOGetResourceManifestLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1885A9000, v14, OS_LOG_TYPE_DEBUG, "Cached manifest is still current (HTTP 304)", buf, 2u);
      }

      -[GEOResourceManifestDownloadTask _finishWithUpdatedManifest:newETag:isExistingManifestCurrent:error:](self, "_finishWithUpdatedManifest:newETag:isExistingManifestCurrent:error:", 0, 0, 1, 0);
    }
    else
    {
      v28 = 0;
      v15 = -[GEODataURLSessionTask validateTransportWithError:](v5, "validateTransportWithError:", &v28);
      v16 = v28;
      if (v15)
      {
        -[GEODataURLSessionTask downloadedFileURL](v5, "downloadedFileURL");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "path");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "length");

        if (v19)
        {
          objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v17, 1, 0);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = -[GEOResources initWithData:]([GEOResources alloc], "initWithData:", v20);
          if (-[GEOResources isValid](v21, "isValid"))
          {
            -[GEODataURLSessionTask entityTag](v5, "entityTag");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            -[GEOResourceManifestDownloadTask _finishWithUpdatedManifest:newETag:isExistingManifestCurrent:error:](self, "_finishWithUpdatedManifest:newETag:isExistingManifestCurrent:error:", v21, v22, 0, 0);

          }
          else
          {
            GEOGetResourceManifestLog();
            v25 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
            {
              url = self->_url;
              *(_DWORD *)buf = 138543362;
              v32 = url;
              _os_log_impl(&dword_1885A9000, v25, OS_LOG_TYPE_ERROR, "Error parsing manifest data from URL: %{public}@", buf, 0xCu);
            }

            objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:userInfo:", -11, 0);
            v27 = objc_claimAutoreleasedReturnValue();

            -[GEOResourceManifestDownloadTask _finishWithUpdatedManifest:newETag:isExistingManifestCurrent:error:](self, "_finishWithUpdatedManifest:newETag:isExistingManifestCurrent:error:", 0, 0, 0, v27);
            v16 = (id)v27;
          }

        }
        else
        {
          GEOGetResourceManifestLog();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138543362;
            v32 = v5;
            _os_log_impl(&dword_1885A9000, v23, OS_LOG_TYPE_FAULT, "Manifest temp URL is empty from task: %{public}@", buf, 0xCu);
          }

          objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -18, CFSTR("Downloaded manifest temp file missing"));
          v24 = objc_claimAutoreleasedReturnValue();

          -[GEOResourceManifestDownloadTask _finishWithUpdatedManifest:newETag:isExistingManifestCurrent:error:](self, "_finishWithUpdatedManifest:newETag:isExistingManifestCurrent:error:", 0, 0, 0, v24);
          v16 = (id)v24;
        }

      }
      else
      {
        -[GEOResourceManifestDownloadTask _finishWithUpdatedManifest:newETag:isExistingManifestCurrent:error:](self, "_finishWithUpdatedManifest:newETag:isExistingManifestCurrent:error:", 0, 0, 0, v16);
      }

    }
  }

}

- (void)_recordNetworkEventDataForTask:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a3;
  GEOApplicationIdentifierOrProcessName();
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clientMetrics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[GEONetworkEventDataRecorder recordNetworkEventDataForDataRequestKind:usedBackgroundURL:requestAppIdentifier:appMajorVersion:appMinorVersion:error:clientMetrics:additionalStates:](GEONetworkEventDataRecorder, "recordNetworkEventDataForDataRequestKind:usedBackgroundURL:requestAppIdentifier:appMajorVersion:appMinorVersion:error:clientMetrics:additionalStates:", 3, MEMORY[0x1E0C9AAA0], v6, 0, 0, v4, v5, 0);
}

- (void)_finishWithUpdatedManifest:(id)a3 newETag:(id)a4 isExistingManifestCurrent:(BOOL)a5 error:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  BOOL v20;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __102__GEOResourceManifestDownloadTask__finishWithUpdatedManifest_newETag_isExistingManifestCurrent_error___block_invoke;
  v16[3] = &unk_1E1C10468;
  v16[4] = self;
  v17 = v10;
  v20 = a5;
  v18 = v11;
  v19 = v12;
  v13 = v12;
  v14 = v11;
  v15 = v10;
  GEOOnce((uint64_t)&self->_finished, v16);

}

void __68__GEOResourceManifestDownloadTask_startWithQueue_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  GEODataRequest *v7;
  int BOOL;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 64), *(id *)(a1 + 40));
  v2 = objc_msgSend(*(id *)(a1 + 48), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 72);
  *(_QWORD *)(v3 + 72) = v2;

  +[GEORequestCounter sharedCounter](GEORequestCounter, "sharedCounter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[GEOApplicationAuditToken currentProcessAuditToken](GEOApplicationAuditToken, "currentProcessAuditToken");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "requestCounterTicketForType:auditToken:traits:", 3, v6, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[GEODataRequest initWithKind:URL:auditToken:timeoutInterval:additionalHTTPHeaders:bodyData:userAgent:entityTag:cachedData:requestCounterTicket:multipathServiceType:multipathAlternatePort:throttleToken:options:]([GEODataRequest alloc], "initWithKind:URL:auditToken:timeoutInterval:additionalHTTPHeaders:bodyData:userAgent:entityTag:cachedData:requestCounterTicket:multipathServiceType:multipathAlternatePort:throttleToken:options:", 3, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40), 0, 0, 0, 0, 0.0, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48), 0, v14, 0, 0, 0, 2);
  BOOL = GEOConfigGetBOOL(GeoServicesConfig_TransactionsForMigration, (uint64_t)off_1EDF4D128);
  if (BOOL)
  {
    _GEOCreateTransaction();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 32), v9);
  if (BOOL)

  +[GEODataURLSession sharedDataURLSession](GEODataURLSession, "sharedDataURLSession");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "taskWithRequest:delegate:delegateQueue:", v7, *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = *(_QWORD *)(a1 + 32);
  v13 = *(void **)(v12 + 56);
  *(_QWORD *)(v12 + 56) = v11;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "start");
}

void __102__GEOResourceManifestDownloadTask__finishWithUpdatedManifest_newETag_isExistingManifestCurrent_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  void *v9;
  _QWORD block[4];
  id v11;
  id v12;
  id v13;
  id v14;
  char v15;

  v2 = (void *)MEMORY[0x18D765024](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 72));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 72);
  *(_QWORD *)(v3 + 72) = 0;

  v5 = *(void **)(a1 + 40);
  v6 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 64);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __102__GEOResourceManifestDownloadTask__finishWithUpdatedManifest_newETag_isExistingManifestCurrent_error___block_invoke_2;
  block[3] = &unk_1E1C10440;
  v14 = v2;
  v11 = v5;
  v12 = *(id *)(a1 + 48);
  v15 = *(_BYTE *)(a1 + 64);
  v13 = *(id *)(a1 + 56);
  v7 = v2;
  dispatch_async(v6, block);
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v8 + 32);
  *(_QWORD *)(v8 + 32) = 0;

}

uint64_t __102__GEOResourceManifestDownloadTask__finishWithUpdatedManifest_newETag_isExistingManifestCurrent_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 48));
}

- (void)dataURLSession:(id)a3 shouldConvertDataTask:(id)a4 toDownloadTaskForEstimatedResponseSize:(unint64_t)a5 completionHandler:(id)a6
{
  (*((void (**)(id, uint64_t))a6 + 2))(a6, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_callback, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_task, 0);
  objc_storeStrong((id *)&self->_existingETag, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __68__GEOResourceManifestDownloadTask_startWithQueue_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  _QWORD block[5];
  id v6;
  id v7;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = *(NSObject **)(v2 + 24);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__GEOResourceManifestDownloadTask_startWithQueue_completionHandler___block_invoke_2;
  block[3] = &unk_1E1BFFC90;
  block[4] = v2;
  v6 = v3;
  v7 = *(id *)(a1 + 48);
  dispatch_async(v4, block);

}

- (void)startWithQueue:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;

  v7 = a3;
  v6 = a4;
  if (v7 && v6)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __68__GEOResourceManifestDownloadTask_startWithQueue_completionHandler___block_invoke;
    v8[3] = &unk_1E1BFFC90;
    v8[4] = self;
    v9 = v7;
    v10 = v6;
    GEOOnce((uint64_t)&self->_started, v8);

  }
}

- (GEOResourceManifestDownloadTask)initWithURL:(id)a3 eTag:(id)a4
{
  id v6;
  id v7;
  GEOResourceManifestDownloadTask *v8;
  GEOResourceManifestDownloadTask *v9;
  uint64_t v10;
  OS_dispatch_queue *queue;
  uint64_t v12;
  NSURL *url;
  GEOResourceManifestDownloadTask *v14;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)GEOResourceManifestDownloadTask;
  v8 = -[GEOResourceManifestDownloadTask init](&v16, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_started.lock._os_unfair_lock_opaque = 0;
    v8->_started.didRun = 0;
    v10 = geo_dispatch_queue_create();
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v10;

    v12 = objc_msgSend(v6, "copy");
    url = v9->_url;
    v9->_url = (NSURL *)v12;

    objc_storeStrong((id *)&v9->_existingETag, a4);
    v14 = v9;
  }

  return v9;
}

- (GEOResourceManifestDownloadTask)init
{
  GEOResourceManifestDownloadTask *result;

  result = (GEOResourceManifestDownloadTask *)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GEOMethodNotAvailableException"), CFSTR("This method is unavailable."));
  __break(1u);
  return result;
}

- (void)cancel
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__GEOResourceManifestDownloadTask_cancel__block_invoke;
  block[3] = &unk_1E1BFF6F8;
  block[4] = self;
  dispatch_async(queue, block);
}

void __41__GEOResourceManifestDownloadTask_cancel__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "cancel");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 56);
  *(_QWORD *)(v2 + 56) = 0;

  v4 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -2, CFSTR("Canceled"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_finishWithUpdatedManifest:newETag:isExistingManifestCurrent:error:", 0, 0, 0, v5);

}

@end
