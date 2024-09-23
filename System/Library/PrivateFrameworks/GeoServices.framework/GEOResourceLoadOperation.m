@implementation GEOResourceLoadOperation

- (GEOResourceLoadOperation)initWithResource:(id)a3 eTag:(id)a4 auditToken:(id)a5 baseURL:(id)a6 alternateURLs:(id)a7 proxyURL:(id)a8 log:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  GEOResourceLoadOperation *v22;
  void *v23;
  int v24;
  void *v25;
  unsigned int v26;
  unint64_t v27;
  void *v28;
  uint64_t v29;
  id v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  id v38;
  unsigned int v39;
  id v40;
  const __CFString *v41;
  GEOResourceLoadOperation *v42;
  void *v43;
  void *v44;
  void *eTag;
  void *v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  int v52;
  BOOL v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  NSURL *url;
  uint64_t v58;
  NSURL *proxyURL;
  uint64_t v60;
  GEOReportedProgress *progress;
  GEOReportedProgress *v62;
  id v64;
  id v65;
  id v66;
  id obj;
  _QWORD v68[4];
  id v69;
  id location;
  objc_super v71;

  v15 = a3;
  v16 = a4;
  obj = a5;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  v71.receiver = self;
  v71.super_class = (Class)GEOResourceLoadOperation;
  v22 = -[GEOResourceLoadOperation init](&v71, sel_init);
  if (v22)
  {
    v66 = v21;
    objc_msgSend(v15, "resource");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "hasAlternateResourceURLIndex");

    if (v24)
    {
      objc_msgSend(v15, "resource");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "alternateResourceURLIndex");
      v27 = objc_msgSend(v19, "count");

      if (v27 <= v26)
      {
        v42 = 0;
        v21 = v66;
        goto LABEL_21;
      }
      objc_msgSend(v15, "resource");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "objectAtIndexedSubscript:", objc_msgSend(v28, "alternateResourceURLIndex"));
      v29 = objc_claimAutoreleasedReturnValue();

      v18 = (id)v29;
    }
    v30 = v18;
    v31 = v15;
    v32 = v31;
    v33 = 0;
    if (v31 && v30)
    {
      v34 = v30;
      objc_msgSend(v31, "name");
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      if (v35)
      {
        v64 = v15;
        v36 = v20;
        v37 = v19;
        v38 = v17;
        v39 = objc_msgSend(v32, "type");
        v40 = v16;
        if (v39 > 7)
          v41 = &stru_1E1C241D0;
        else
          v41 = off_1E1C0B4B8[v39];
        v30 = v34;
        objc_msgSend(v34, "URLByAppendingPathComponent:", v41);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "name");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "URLByAppendingPathComponent:", v44);
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        v16 = v40;
        v17 = v38;
        v19 = v37;
        v20 = v36;
        v15 = v64;
      }
      else
      {
        v33 = 0;
        v30 = v34;
      }
    }

    v65 = v30;
    objc_msgSend(v32, "resource");
    eTag = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(eTag, "hasUpdateMethod"))
    {
      objc_msgSend(v32, "resource");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = v15;
      v48 = v20;
      v49 = v19;
      v50 = v17;
      v51 = v16;
      v52 = objc_msgSend(v46, "updateMethod");

      v53 = v52 == 1;
      v16 = v51;
      v17 = v50;
      v19 = v49;
      v20 = v48;
      v15 = v47;
      v21 = v66;
      if (!v53)
        goto LABEL_19;
      v54 = objc_msgSend(v16, "copy");
      eTag = v22->_eTag;
      v22->_eTag = (NSString *)v54;
    }
    else
    {
      v21 = v66;
    }

LABEL_19:
    GEOURLAuthenticationGenerateURL((uint64_t)v33);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = objc_msgSend(v55, "copy");
    url = v22->_url;
    v22->_url = (NSURL *)v56;

    v58 = objc_msgSend(v20, "copy");
    proxyURL = v22->_proxyURL;
    v22->_proxyURL = (NSURL *)v58;

    objc_storeStrong((id *)&v22->_auditToken, obj);
    objc_storeStrong((id *)&v22->_log, a9);
    v22->_lock._os_unfair_lock_opaque = 0;
    +[GEOReportedProgress progressWithTotalUnitCount:](GEOReportedProgress, "progressWithTotalUnitCount:", -1);
    v60 = objc_claimAutoreleasedReturnValue();
    progress = v22->_progress;
    v22->_progress = (GEOReportedProgress *)v60;

    -[GEOReportedProgress setKind:](v22->_progress, "setKind:", *MEMORY[0x1E0CB30F8]);
    -[GEOReportedProgress setUserInfoObject:forKey:](v22->_progress, "setUserInfoObject:forKey:", *MEMORY[0x1E0CB30B8], *MEMORY[0x1E0CB30C8]);
    objc_initWeak(&location, v22);
    v62 = v22->_progress;
    v68[0] = MEMORY[0x1E0C809B0];
    v68[1] = 3221225472;
    v68[2] = __96__GEOResourceLoadOperation_initWithResource_eTag_auditToken_baseURL_alternateURLs_proxyURL_log___block_invoke;
    v68[3] = &unk_1E1BFF8B0;
    objc_copyWeak(&v69, &location);
    -[GEOReportedProgress setCancellationHandler:](v62, "setCancellationHandler:", v68);
    v42 = v22;
    objc_destroyWeak(&v69);
    objc_destroyWeak(&location);

    v18 = v65;
    goto LABEL_21;
  }
  v42 = 0;
LABEL_21:

  return v42;
}

void __96__GEOResourceLoadOperation_initWithResource_eTag_auditToken_baseURL_alternateURLs_proxyURL_log___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "cancel");

}

- (void)dealloc
{
  objc_super v3;

  -[NSURLSession invalidateAndCancel](self->_session, "invalidateAndCancel");
  v3.receiver = self;
  v3.super_class = (Class)GEOResourceLoadOperation;
  -[GEOResourceLoadOperation dealloc](&v3, sel_dealloc);
}

- (NSProgress)progress
{
  return -[GEOReportedProgress progress](self->_progress, "progress");
}

- (void)startWithCompletionHandler:(id)a3 callbackQueue:(id)a4
{
  void *v7;
  id completionHandler;
  void *v9;
  void *v10;
  uint64_t BOOL;
  void *v12;
  void *v13;
  NSString *eTag;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  NSURLSession *v21;
  NSURLSessionTask *v22;
  void *v23;
  GEORequestCounterTicket *v24;
  NSURLSession *session;
  NSURLSession *v26;
  NSURLSessionTask *task;
  NSURLSessionTask *v28;
  GEORequestCounterTicket *requestCounterTicket;
  GEORequestCounterTicket *v30;
  NSDate *v31;
  NSDate *starttime;
  id v33;
  _QWORD v34[4];
  id v35;

  v33 = a4;
  v7 = (void *)objc_msgSend(a3, "copy");
  completionHandler = self->_completionHandler;
  self->_completionHandler = v7;

  objc_storeStrong((id *)&self->_callbackQueue, a4);
  v9 = (void *)MEMORY[0x1E0CB39E0];
  +[GEOPlatform sharedPlatform](GEOPlatform, "sharedPlatform");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "isInternalInstall"))
    BOOL = GEOConfigGetBOOL(GeoServicesConfig_AllowNonEVCerts, (uint64_t)off_1EDF4CFE8);
  else
    BOOL = 0;

  -[NSURL host](self->_url, "host");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAllowsAnyHTTPSCertificate:forHost:", BOOL, v12);

  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A8]), "initWithURL:", self->_url);
  objc_msgSend(v13, "setHTTPShouldHandleCookies:", 0);
  eTag = self->_eTag;
  if (eTag)
    objc_msgSend(v13, "setValue:forHTTPHeaderField:", eTag, CFSTR("If-None-Match"));
  objc_msgSend(MEMORY[0x1E0CB39F8], "ephemeralSessionConfiguration");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "geo_setApplicationAttribution:", self->_auditToken);
  if (self->_proxyURL)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[GEOMapsAuthServiceHelper sharedAuthHelper](GEOMapsAuthServiceHelper, "sharedAuthHelper");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addProxyAuthHeaderOrReAuth:authProxyURL:", v16, self->_proxyURL);

    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __69__GEOResourceLoadOperation_startWithCompletionHandler_callbackQueue___block_invoke;
    v34[3] = &unk_1E1C07D90;
    v18 = v13;
    v35 = v18;
    objc_msgSend(v16, "enumerateKeysAndObjectsUsingBlock:", v34);
    +[GEOMapsAuthServiceHelper sharedAuthHelper](GEOMapsAuthServiceHelper, "sharedAuthHelper");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "URL");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setConnectionProxyDictionary:url:proxyURL:", v15, v20, self->_proxyURL);

  }
  objc_msgSend(v15, "setAllowsExpensiveNetworkAccess:", !self->_requiresWiFi);
  objc_msgSend(MEMORY[0x1E0CB39F0], "sessionWithConfiguration:delegate:delegateQueue:", v15, self, 0);
  v21 = (NSURLSession *)objc_claimAutoreleasedReturnValue();
  -[NSURLSession dataTaskWithRequest:](v21, "dataTaskWithRequest:", v13);
  v22 = (NSURLSessionTask *)objc_claimAutoreleasedReturnValue();
  +[GEORequestCounter sharedCounter](GEORequestCounter, "sharedCounter");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "requestCounterTicketForType:auditToken:traits:", 4, self->_auditToken, 0);
  v24 = (GEORequestCounterTicket *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_lock_with_options();
  session = self->_session;
  self->_session = v21;
  v26 = v21;

  task = self->_task;
  self->_task = v22;
  v28 = v22;

  requestCounterTicket = self->_requestCounterTicket;
  self->_requestCounterTicket = v24;
  v30 = v24;

  os_unfair_lock_unlock(&self->_lock);
  -[GEORequestCounterTicket startingRequestWithTask:](v30, "startingRequestWithTask:", self->_task);
  -[NSURLSessionTask resume](v28, "resume");
  v31 = (NSDate *)objc_alloc_init(MEMORY[0x1E0C99D68]);
  starttime = self->_starttime;
  self->_starttime = v31;

}

uint64_t __69__GEOResourceLoadOperation_startWithCompletionHandler_callbackQueue___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setValue:forHTTPHeaderField:", a3, a2);
}

- (void)cancel
{
  os_unfair_lock_s *p_lock;
  NSURLSessionTask *task;
  NSURLSession *session;
  NSURLSessionTask *v6;
  NSURLSessionTask *v7;
  id completionHandler;
  NSURLSession *v9;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  session = self->_session;
  task = self->_task;
  self->_session = 0;
  v6 = task;
  v9 = session;

  v7 = self->_task;
  self->_task = 0;

  completionHandler = self->_completionHandler;
  self->_completionHandler = 0;

  os_unfair_lock_unlock(p_lock);
  -[NSURLSessionTask cancel](v6, "cancel");
  -[NSURLSession invalidateAndCancel](v9, "invalidateAndCancel");
  -[GEOReportedProgress cancel](self->_progress, "cancel");

}

- (void)URLSession:(id)a3 task:(id)a4 didFinishCollectingMetrics:(id)a5
{
  void *v6;
  NSString *v7;
  NSString *serviceAddress;
  id v9;

  objc_msgSend(a5, "transactionMetrics", a3, a4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteAddress");
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  serviceAddress = self->_serviceAddress;
  self->_serviceAddress = v7;

}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
  id v8;
  void (**v9)(id, _QWORD);
  id v10;
  uint64_t v11;
  _BOOL4 v12;
  NSURLSession *v13;
  NSURLSession *v14;
  NSURLSessionTask *v15;
  void *v16;
  NSString *v17;
  NSString *eTag;
  void *v19;
  void *v20;
  _xlocale *v21;
  id v22;
  int v23;
  unint64_t v24;
  int v25;
  NSURLSession *v26;
  NSURLSession *session;
  NSURLSessionTask *task;
  void *v29;
  id completionHandler;
  NSMutableData *data;
  int64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  NSObject *log;
  id v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  NSObject *callbackQueue;
  unint64_t UInteger;
  void (*v47)(id, uint64_t);
  NSObject *v48;
  NSURLSessionTask *v49;
  NSObject *v50;
  void *v51;
  void *v52;
  const char *v53;
  NSObject *v54;
  NSURLSessionTask *v55;
  NSObject *v56;
  void *v57;
  char v58;
  NSMutableData *v59;
  NSMutableData *v60;
  NSObject *v61;
  NSURLSessionTask *v62;
  void *v63;
  NSURLSession *v64;
  _QWORD block[5];
  id v66;
  id v67;
  _QWORD v68[3];
  _QWORD v69[3];
  _BYTE buf[12];
  __int16 v71;
  int v72;
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = (void (**)(id, _QWORD))a6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = v8;
    -[GEOReportedProgress setTotalUnitCount:](self->_progress, "setTotalUnitCount:", objc_msgSend(v10, "expectedContentLength"));
    v11 = objc_msgSend(v10, "statusCode");
    if (v11 != 200)
    {
      v12 = v11 == 304 && -[NSString length](self->_eTag, "length") != 0;
      ((void (**)(id, _BOOL4))v9)[2](v9, v12);
      os_unfair_lock_lock_with_options();
      v26 = self->_session;
      session = self->_session;
      self->_session = 0;

      task = self->_task;
      self->_task = 0;

      v29 = (void *)MEMORY[0x18D765024](self->_completionHandler);
      completionHandler = self->_completionHandler;
      self->_completionHandler = 0;

      os_unfair_lock_unlock(&self->_lock);
      if (v12)
        -[NSURLSession finishTasksAndInvalidate](v26, "finishTasksAndInvalidate");
      else
        -[NSURLSession invalidateAndCancel](v26, "invalidateAndCancel");
      data = self->_data;
      self->_data = 0;

      if (-[GEOReportedProgress totalUnitCount](self->_progress, "totalUnitCount") < 1)
        v32 = 1;
      else
        v32 = -[GEOReportedProgress totalUnitCount](self->_progress, "totalUnitCount");
      -[GEOReportedProgress setTotalUnitCount:](self->_progress, "setTotalUnitCount:", v32);
      -[GEOReportedProgress setCompletedUnitCount:](self->_progress, "setCompletedUnitCount:", -[GEOReportedProgress totalUnitCount](self->_progress, "totalUnitCount"));
      if (v12)
      {
        v33 = 0;
        if (!v29)
          goto LABEL_24;
      }
      else
      {
        v63 = v29;
        v64 = v26;
        v34 = (void *)MEMORY[0x1E0CB3940];
        v35 = objc_msgSend(v10, "statusCode");
        objc_msgSend(v10, "URL");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "stringWithFormat:", CFSTR("Manifest server returned HTTP error %ld for URL %@"), v35, v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        log = self->_log;
        if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          *(_QWORD *)&buf[4] = v37;
          _os_log_impl(&dword_1885A9000, log, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
        }
        v39 = (id)*MEMORY[0x1E0C9AFA8];
        v69[0] = v37;
        v68[0] = v39;
        v68[1] = CFSTR("HTTPStatus");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v10, "statusCode"));
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v69[1] = v40;
        v68[2] = *MEMORY[0x1E0CB3300];
        objc_msgSend(v10, "URL");
        v41 = v10;
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "absoluteString");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v69[2] = v43;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v69, v68, 3);
        v44 = (void *)objc_claimAutoreleasedReturnValue();

        v10 = v41;
        objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:userInfo:", -7, v44);
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        v29 = v63;
        v26 = v64;
        if (!v63)
          goto LABEL_24;
      }
      callbackQueue = self->_callbackQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __85__GEOResourceLoadOperation_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke;
      block[3] = &unk_1E1C01358;
      v67 = v29;
      block[4] = self;
      v66 = v33;
      dispatch_async(callbackQueue, block);

LABEL_24:
      goto LABEL_25;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_25:

      goto LABEL_26;
    }
    objc_msgSend(v10, "allHeaderFields");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("ETag"));
    v17 = (NSString *)objc_claimAutoreleasedReturnValue();
    eTag = self->_eTag;
    self->_eTag = v17;

    objc_msgSend(v10, "allHeaderFields");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("Content-Length"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      v21 = newlocale(63, 0, 0);
      *(_QWORD *)buf = 0;
      v22 = objc_retainAutorelease(v20);
      v23 = sscanf_l((const char *)objc_msgSend(v22, "UTF8String"), v21, "%zu", buf);
      freelocale(v21);
      if (v23 == 1)
      {
        v24 = *(_QWORD *)buf;

        v25 = 1;
        goto LABEL_31;
      }

    }
    if (GEOConfigGetBOOL(GeoServicesConfig_ResourceLoaderMissingContentLengthShouldDownloadToFile, (uint64_t)off_1EDF4E098))
    {
      v9[2](v9, 2);
      goto LABEL_35;
    }
    v25 = 0;
    v24 = 0;
LABEL_31:
    UInteger = GEOConfigGetUInteger(GeoServicesConfig_ResourceLoaderInMemoryDownloadSizeThreshold, (uint64_t)off_1EDF4E0A8);
    v47 = v9[2];
    if (v24 <= UInteger)
    {
      v47(v9, 1);
      v58 = v25 ^ 1;
      if (self->_data)
        v58 = 1;
      if ((v58 & 1) == 0 && v24)
      {
        v59 = (NSMutableData *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithCapacity:", v24);
        v60 = self->_data;
        self->_data = v59;

      }
      v61 = self->_log;
      if (!os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
        goto LABEL_25;
      v62 = self->_task;
      v50 = v61;
      -[NSURLSessionTask originalRequest](v62, "originalRequest");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "URL");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138478083;
      *(_QWORD *)&buf[4] = v52;
      v71 = 1025;
      v72 = v24;
      v53 = "Resource at %{private}@ (%{private}u bytes) does not exceed threshold";
LABEL_44:
      _os_log_impl(&dword_1885A9000, v50, OS_LOG_TYPE_DEBUG, v53, buf, 0x12u);

      goto LABEL_45;
    }
    v47(v9, 2);
    if (v25)
    {
      v48 = self->_log;
      if (!os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
        goto LABEL_25;
      v49 = self->_task;
      v50 = v48;
      -[NSURLSessionTask originalRequest](v49, "originalRequest");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "URL");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138478083;
      *(_QWORD *)&buf[4] = v52;
      v71 = 1025;
      v72 = v24;
      v53 = "Resource at %{private}@ (%{private}u bytes) exceeds threshold, converting to download";
      goto LABEL_44;
    }
LABEL_35:
    v54 = self->_log;
    if (!os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
      goto LABEL_25;
    v55 = self->_task;
    v56 = v54;
    -[NSURLSessionTask originalRequest](v55, "originalRequest");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "URL");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138477827;
    *(_QWORD *)&buf[4] = v57;
    _os_log_impl(&dword_1885A9000, v56, OS_LOG_TYPE_DEBUG, "Resource at %{private}@ is missing content-length header, converting to download", buf, 0xCu);

LABEL_45:
    goto LABEL_25;
  }
  v9[2](v9, 0);
  os_unfair_lock_lock_with_options();
  v13 = self->_session;
  self->_session = 0;
  v14 = v13;

  v15 = self->_task;
  self->_task = 0;

  os_unfair_lock_unlock(&self->_lock);
  -[NSURLSession invalidateAndCancel](v14, "invalidateAndCancel");

LABEL_26:
}

void __85__GEOResourceLoadOperation_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x18D764E2C]();
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  objc_autoreleasePoolPop(v2);
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didBecomeDownloadTask:(id)a5
{
  NSURLSessionTask *v7;
  id v8;
  os_unfair_lock_s *p_lock;
  NSURLSessionTask *v10;
  NSURLSessionTask **p_task;
  NSURLSessionTask *task;
  __int16 v13[8];

  v7 = (NSURLSessionTask *)a4;
  v8 = a5;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_session)
  {
    task = self->_task;
    p_task = &self->_task;
    v10 = task;
    if (task)
    {
      if (v10 == v7)
      {
        objc_storeStrong((id *)p_task, a5);
      }
      else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      {
        v13[0] = 0;
        _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: _task == dataTask", (uint8_t *)v13, 2u);
      }
    }
  }
  os_unfair_lock_unlock(p_lock);

}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  id v8;
  id v9;
  NSMutableData *data;
  NSMutableData *v11;
  NSMutableData *v12;
  id v13;

  v13 = a3;
  v8 = a4;
  v9 = a5;
  data = self->_data;
  if (!data)
  {
    v11 = (NSMutableData *)objc_alloc_init(MEMORY[0x1E0C99DF0]);
    v12 = self->_data;
    self->_data = v11;

    data = self->_data;
  }
  -[NSMutableData appendData:](data, "appendData:", v9);
  if (-[GEOReportedProgress totalUnitCount](self->_progress, "totalUnitCount") >= 1)
    -[GEOReportedProgress setCompletedUnitCount:](self->_progress, "setCompletedUnitCount:", -[GEOReportedProgress completedUnitCount](self->_progress, "completedUnitCount") + objc_msgSend(v9, "length"));

}

- (void)URLSession:(id)a3 downloadTask:(id)a4 didFinishDownloadingToURL:(id)a5
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  NSObject *log;
  id v23;
  id v24;
  _QWORD v25[2];
  __int128 buf;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = (void *)MEMORY[0x1E0C99E98];
  v7 = a5;
  NSTemporaryDirectory();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fileURLWithPath:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "UUIDString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "URLByAppendingPathComponent:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  LODWORD(v9) = objc_msgSend(v13, "moveItemAtURL:toURL:error:", v7, v12, &v24);

  v14 = v24;
  if ((_DWORD)v9)
  {
    objc_msgSend(v12, "path");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v14;
    v16 = v14;
    if (v15)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = *MEMORY[0x1E0CB2AD8];
      v25[0] = *MEMORY[0x1E0CB2AA8];
      v25[1] = v18;
      v19 = *MEMORY[0x1E0CB2AE0];
      *(_QWORD *)&buf = &unk_1E1E812B0;
      *((_QWORD *)&buf + 1) = v19;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &buf, v25, 2);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setAttributes:ofItemAtPath:error:", v20, v15, &v23);

      v16 = v23;
    }
    v21 = v16;

    objc_storeStrong((id *)&self->_downloadedFileURL, v12);
    v14 = v21;
  }
  else
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v14;
      _os_log_impl(&dword_1885A9000, log, OS_LOG_TYPE_ERROR, "Failed to move downloaded data to temporary URL: %{public}@", (uint8_t *)&buf, 0xCu);
    }
  }

}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v7;
  id v8;
  NSDate *starttime;
  NSURLSession *v10;
  NSURLSession *session;
  NSURLSessionTask *task;
  void *v13;
  id completionHandler;
  int64_t v15;
  NSMutableData *data;
  void *v17;
  uint64_t v18;
  NSMutableData *v19;
  void *eTag;
  void *v21;
  char isKindOfClass;
  void *v23;
  NSString *v24;
  NSString *v25;
  NSObject *callbackQueue;
  _QWORD block[5];
  id v28;
  id v29;

  v7 = a4;
  v8 = a5;
  starttime = self->_starttime;
  self->_starttime = 0;

  os_unfair_lock_lock_with_options();
  v10 = self->_session;
  session = self->_session;
  self->_session = 0;

  task = self->_task;
  self->_task = 0;

  v13 = (void *)MEMORY[0x18D765024](self->_completionHandler);
  completionHandler = self->_completionHandler;
  self->_completionHandler = 0;

  os_unfair_lock_unlock(&self->_lock);
  -[NSURLSession finishTasksAndInvalidate](v10, "finishTasksAndInvalidate");
  if (-[GEOReportedProgress totalUnitCount](self->_progress, "totalUnitCount") < 1)
    v15 = 1;
  else
    v15 = -[GEOReportedProgress totalUnitCount](self->_progress, "totalUnitCount");
  -[GEOReportedProgress setTotalUnitCount:](self->_progress, "setTotalUnitCount:", v15);
  -[GEOReportedProgress setCompletedUnitCount:](self->_progress, "setCompletedUnitCount:", -[GEOReportedProgress totalUnitCount](self->_progress, "totalUnitCount"));
  data = self->_data;
  if (data && !-[NSMutableData length](data, "length"))
  {
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", self->_url, *MEMORY[0x1E0CB3300], 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:userInfo:", -11, v17);
    v18 = objc_claimAutoreleasedReturnValue();

    v19 = self->_data;
    self->_data = 0;

    v8 = (id)v18;
  }
  -[GEORequestCounterTicket requestCompleted:](self->_requestCounterTicket, "requestCompleted:", v8);
  eTag = self->_eTag;
  if (v8)
  {
    self->_eTag = 0;
LABEL_9:

    goto LABEL_13;
  }
  if (!eTag)
  {
    objc_msgSend(v7, "response");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v7, "response");
      eTag = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(eTag, "allHeaderFields");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("ETag"));
      v24 = (NSString *)objc_claimAutoreleasedReturnValue();
      v25 = self->_eTag;
      self->_eTag = v24;

      goto LABEL_9;
    }
  }
LABEL_13:
  if (v13)
  {
    callbackQueue = self->_callbackQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __65__GEOResourceLoadOperation_URLSession_task_didCompleteWithError___block_invoke;
    block[3] = &unk_1E1C01358;
    v29 = v13;
    block[4] = self;
    v28 = v8;
    dispatch_async(callbackQueue, block);

  }
}

void __65__GEOResourceLoadOperation_URLSession_task_didCompleteWithError___block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x18D764E2C]();
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  objc_autoreleasePoolPop(v2);
}

- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  void (**v11)(id, uint64_t, _QWORD);
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  NSObject *v19;
  NSMutableData *data;
  void *v21;
  uint8_t v22[16];

  v9 = a3;
  v10 = a5;
  v11 = (void (**)(id, uint64_t, _QWORD))a6;
  objc_msgSend(v10, "protectionSpace");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "proxyType");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13 != (void *)*MEMORY[0x1E0CB3328])
    goto LABEL_4;
  objc_msgSend(v10, "protectionSpace");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "authenticationMethod");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15 != (void *)*MEMORY[0x1E0CB32B8])
  {

LABEL_4:
    goto LABEL_5;
  }
  objc_msgSend(v9, "configuration");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "_requiresSecureHTTPSProxyConnection");

  if (v18)
  {
    GEOGetMapsProxyAuthLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v22 = 0;
      _os_log_impl(&dword_1885A9000, v19, OS_LOG_TYPE_DEBUG, "Received a secure proxy challenge", v22, 2u);
    }

    data = self->_data;
    self->_data = 0;

    +[GEOMapsAuthServiceHelper sharedAuthHelper](GEOMapsAuthServiceHelper, "sharedAuthHelper");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleSecureProxyChallenge:", v10);

  }
LABEL_5:
  v11[2](v11, 1, 0);

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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_downloadedFileURL, 0);
  objc_storeStrong((id *)&self->_starttime, 0);
  objc_storeStrong((id *)&self->_serviceAddress, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_authProxyURL, 0);
  objc_storeStrong((id *)&self->_auditToken, 0);
  objc_storeStrong((id *)&self->_eTag, 0);
  objc_storeStrong((id *)&self->_requestCounterTicket, 0);
  objc_storeStrong((id *)&self->_task, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_proxyURL, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end
