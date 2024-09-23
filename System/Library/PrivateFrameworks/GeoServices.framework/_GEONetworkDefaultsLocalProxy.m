@implementation _GEONetworkDefaultsLocalProxy

- (void)_updateNetworkDefaults
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  _GEONetworkDefaultsLocalProxy *v18;
  id v19;
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t);
  void *v31;
  _GEONetworkDefaultsLocalProxy *v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  char v37;

  v34 = 0;
  v35 = &v34;
  v36 = 0x2020000000;
  v37 = 0;
  v3 = MEMORY[0x1E0C809B0];
  v28 = MEMORY[0x1E0C809B0];
  v29 = 3221225472;
  v30 = __55___GEONetworkDefaultsLocalProxy__updateNetworkDefaults__block_invoke;
  v31 = &unk_1E1BFF920;
  v32 = self;
  v33 = &v34;
  geo_isolate_sync_data();
  if (!*((_BYTE *)v35 + 24))
  {
    -[_GEONetworkDefaultsLocalProxy _urlRequestForNetworkDefaults](self, "_urlRequestForNetworkDefaults");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)MEMORY[0x1E0CB39F0];
    objc_msgSend(MEMORY[0x1E0CB39F8], "ephemeralSessionConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sessionWithConfiguration:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    +[GEORequestCounter sharedCounter](GEORequestCounter, "sharedCounter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[GEOApplicationAuditToken currentProcessAuditToken](GEOApplicationAuditToken, "currentProcessAuditToken");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "requestCounterTicketForType:auditToken:traits:", 6, v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = 0;
    v23 = &v22;
    v24 = 0x3032000000;
    v25 = __Block_byref_object_copy__47;
    v26 = __Block_byref_object_dispose__47;
    v27 = 0;
    v16[0] = v3;
    v16[1] = 3221225472;
    v16[2] = __55___GEONetworkDefaultsLocalProxy__updateNetworkDefaults__block_invoke_2;
    v16[3] = &unk_1E1C0C778;
    v21 = &v22;
    v11 = v10;
    v17 = v11;
    v18 = self;
    v12 = v4;
    v19 = v12;
    v13 = v7;
    v20 = v13;
    objc_msgSend(v13, "dataTaskWithRequest:completionHandler:", v12, v16);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v23[5];
    v23[5] = v14;

    objc_msgSend(v11, "startingRequestWithTask:", v23[5]);
    objc_msgSend((id)v23[5], "resume");
    _Block_object_dispose(&v22, 8);

  }
  _Block_object_dispose(&v34, 8);
}

- (id)_urlRequestForNetworkDefaults
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  int v9;
  id v10;
  void *v11;
  NSObject *v12;
  const char *v13;
  NSObject *v14;
  os_log_type_t v15;
  uint32_t v16;
  id v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  _networkDefaultsURL();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A8]), "initWithURL:cachePolicy:timeoutInterval:", v2, 1, 60.0);
  _getValue(GeoServicesConfig_LastNetworkDefaultsURL, (uint64_t)off_1EDF4CD38, 1, 0, 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _getValue(GeoServicesConfig_LastNetworkDefaultsETag, (uint64_t)off_1EDF4CD48, 1, 0, 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[GEOFilePaths urlFor:](GEOFilePaths, "urlFor:", 23);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v2, "absoluteString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v4, "isEqualToString:", v7);

    if (v8)
    {
      objc_msgSend(v6, "removeAllCachedResourceValues");
      v18 = 0;
      v9 = objc_msgSend(v6, "getResourceValue:forKey:error:", &v18, *MEMORY[0x1E0C99A10], 0);
      v10 = v18;
      v11 = v10;
      if (v9 && objc_msgSend(v10, "BOOLValue"))
      {
        objc_msgSend(v3, "setValue:forHTTPHeaderField:", v5, CFSTR("If-None-Match"));
        GEOGetNetworkDefaultsLog();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138477827;
          v20 = v5;
          v13 = "Using ETag for request: %{private}@";
          v14 = v12;
          v15 = OS_LOG_TYPE_DEBUG;
          v16 = 12;
LABEL_9:
          _os_log_impl(&dword_1885A9000, v14, v15, v13, buf, v16);
        }
      }
      else
      {
        GEOGetNetworkDefaultsLog();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          v13 = "Cached file is missing/unreadable on-disk. Ignoring stored ETag.";
          v14 = v12;
          v15 = OS_LOG_TYPE_ERROR;
          v16 = 2;
          goto LABEL_9;
        }
      }

    }
  }

  objc_msgSend(v3, "setValue:forHTTPHeaderField:", 0, CFSTR("Accept-Language"));
  return v3;
}

- (void)_processNetworkDefaultsResponse:(id)a3 data:(id)a4 error:(id)a5 request:(id)a6
{
  id v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  double v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  int v22;
  const char *v23;
  uint64_t v24;
  NSObject *v25;
  NSObject *v26;
  os_log_type_t v27;
  uint32_t v28;
  NSObject *v29;
  id v30;
  id v31;
  uint8_t buf[4];
  NSObject *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  GEOGetMonotonicTime();
  self->_lastAttempt = v14;
  if (!v11)
  {
    -[NSObject domain](v12, "domain");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "isEqualToString:", *MEMORY[0x1E0CB32E8]);

    if (v22 && -[NSObject code](v12, "code") == -1009)
    {
      GEOGetNetworkDefaultsLog();
      v16 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        goto LABEL_28;
      *(_WORD *)buf = 0;
      v23 = "Could not update networkDefaults because device is offline. Will try again later.";
      goto LABEL_16;
    }
    GEOGetNetworkDefaultsLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      goto LABEL_28;
    *(_DWORD *)buf = 138543362;
    v33 = v12;
    v23 = "Error updating network defaults: %{public}@";
    v26 = v16;
    v27 = OS_LOG_TYPE_ERROR;
    v28 = 12;
LABEL_21:
    _os_log_impl(&dword_1885A9000, v26, v27, v23, buf, v28);
    goto LABEL_28;
  }
  if (objc_msgSend(v10, "statusCode") != 200)
  {
    v24 = objc_msgSend(v10, "statusCode");
    GEOGetNetworkDefaultsLog();
    v25 = objc_claimAutoreleasedReturnValue();
    v16 = v25;
    if (v24 == 304)
    {
      if (!os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        goto LABEL_28;
      *(_WORD *)buf = 0;
      v23 = "Network defaults not modified (304).";
LABEL_16:
      v26 = v16;
      v27 = OS_LOG_TYPE_DEBUG;
      v28 = 2;
      goto LABEL_21;
    }
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      goto LABEL_28;
    *(_DWORD *)buf = 67109120;
    LODWORD(v33) = objc_msgSend(v10, "statusCode");
    v23 = "Received unexpected HTTP status code %u";
    v26 = v16;
    v27 = OS_LOG_TYPE_ERROR;
    v28 = 8;
    goto LABEL_21;
  }
  v31 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v11, 0, 0, &v31);
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = v31;
  if (!v15)
  {
    GEOGetNetworkDefaultsLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v33 = v16;
      _os_log_impl(&dword_1885A9000, v15, OS_LOG_TYPE_ERROR, "Failed to decode new network defaults: %{public}@", buf, 0xCu);
    }
    goto LABEL_27;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    GEOGetNetworkDefaultsLog();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v33 = v11;
      _os_log_impl(&dword_1885A9000, v29, OS_LOG_TYPE_ERROR, "Invalid network defaults payload -- not of expected type: %{public}@", buf, 0xCu);
    }

LABEL_27:
    goto LABEL_28;
  }

  v30 = 0;
  -[_GEONetworkDefaultsLocalProxy _updateWithNewConfig:request:response:error:](self, "_updateWithNewConfig:request:response:error:", v15, v13, v10, &v30);
  v17 = v30;
  v18 = v17;
  if (v17)
    v19 = v17;
  else
    v19 = v12;
  v20 = v19;

  v16 = v15;
  v12 = v20;
LABEL_28:

  -[_GEONetworkDefaultsLocalProxy _callCompletionHandlersWithError:](self, "_callCompletionHandlersWithError:", v12);
}

- (void)_callCompletionHandlersWithError:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t);
  void *v16;
  _GEONetworkDefaultsLocalProxy *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__47;
  v23 = __Block_byref_object_dispose__47;
  v24 = 0;
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __66___GEONetworkDefaultsLocalProxy__callCompletionHandlersWithError___block_invoke;
  v16 = &unk_1E1C00760;
  v17 = self;
  v18 = &v19;
  geo_isolate_sync_data();
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v5 = (id)v20[5];
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v9, v25, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v5);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8) + 16))(*(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8));
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v9, v25, 16);
    }
    while (v6);
  }

  _Block_object_dispose(&v19, 8);
}

- (void)updateNetworkDefaultsWithReason:(unint64_t)a3 completionHandler:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  atomic_flag *p_isWaiting;
  unsigned __int8 v11;
  NSObject *v12;
  int missingContainerRetryCount;
  dispatch_time_t v14;
  NSObject *global_queue;
  double Double;
  double v17;
  double v18;
  NSObject *v19;
  const __CFString *v20;
  NSObject *v21;
  const __CFString *v22;
  _QWORD block[10];
  id v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;
  uint8_t buf[4];
  const __CFString *v31;
  __int16 v32;
  double v33;
  __int16 v34;
  double v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  v7 = MEMORY[0x1E0C809B0];
  block[5] = MEMORY[0x1E0C809B0];
  block[6] = 3221225472;
  block[7] = __83___GEONetworkDefaultsLocalProxy_updateNetworkDefaultsWithReason_completionHandler___block_invoke;
  block[8] = &unk_1E1C0C750;
  v25 = &v26;
  block[9] = self;
  v8 = v6;
  v24 = v8;
  geo_isolate_sync_data();
  if (*((_BYTE *)v27 + 24))
    goto LABEL_27;
  +[GEOFilePaths urlFor:](GEOFilePaths, "urlFor:", 23);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {

LABEL_11:
    if (self->_lastAttempt == 2.22507386e-308)
      goto LABEL_15;
    Double = 20.0;
    if (a3 <= 2)
      Double = GEOConfigGetDouble(GeoServicesConfig_NetworkDefaultUpdateMinimumInterval, (uint64_t)off_1EDF4D3C8);
    GEOGetMonotonicTime();
    v18 = v17 - self->_lastAttempt;
    if (v18 >= Double)
    {
LABEL_15:
      GEOGetNetworkDefaultsLog();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        if (a3 > 5)
          v20 = CFSTR("<invalid>");
        else
          v20 = off_1E1C0C7C0[a3];
        *(_DWORD *)buf = 138412290;
        v31 = v20;
        _os_log_impl(&dword_1885A9000, v19, OS_LOG_TYPE_DEBUG, "Updating network defaults with reason %@", buf, 0xCu);
      }

      geo_dispatch_async_qos();
    }
    else
    {
      GEOGetNetworkDefaultsLog();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        if (a3 > 5)
          v22 = CFSTR("<invalid>");
        else
          v22 = off_1E1C0C7C0[a3];
        *(_DWORD *)buf = 138412802;
        v31 = v22;
        v32 = 2048;
        v33 = v18;
        v34 = 2048;
        v35 = Double;
        _os_log_impl(&dword_1885A9000, v21, OS_LOG_TYPE_INFO, "Not updating, reason is %@ and the last update was %f seconds ago which is less than the required %f", buf, 0x20u);
      }

      -[_GEONetworkDefaultsLocalProxy _callCompletionHandlersWithError:](self, "_callCompletionHandlersWithError:", 0);
    }
    goto LABEL_27;
  }
  if (self->_missingContainerRetryCount > 4)
    goto LABEL_11;
  p_isWaiting = &self->_isWaiting;
  do
    v11 = __ldaxr((unsigned __int8 *)p_isWaiting);
  while (__stlxr(1u, (unsigned __int8 *)p_isWaiting));
  if ((v11 & 1) == 0)
  {
    ++self->_missingContainerRetryCount;
    GEOGetNetworkDefaultsLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      missingContainerRetryCount = self->_missingContainerRetryCount;
      *(_DWORD *)buf = 67109120;
      LODWORD(v31) = missingContainerRetryCount;
      _os_log_impl(&dword_1885A9000, v12, OS_LOG_TYPE_DEFAULT, "Can't get network defaults file path, will try again shortly (attempt %d)", buf, 8u);
    }

    v14 = dispatch_time(0, 2000000000);
    global_queue = geo_get_global_queue();
    block[0] = v7;
    block[1] = 3221225472;
    block[2] = __83___GEONetworkDefaultsLocalProxy_updateNetworkDefaultsWithReason_completionHandler___block_invoke_94;
    block[3] = &unk_1E1BFF6F8;
    block[4] = self;
    dispatch_after(v14, global_queue, block);

  }
LABEL_27:

  _Block_object_dispose(&v26, 8);
}

- (_GEONetworkDefaultsLocalProxy)init
{
  _GEONetworkDefaultsLocalProxy *v2;
  uint64_t v3;
  geo_isolater *isolation;
  void *v5;
  _GEONetworkDefaultsLocalProxy *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_GEONetworkDefaultsLocalProxy;
  v2 = -[_GEONetworkDefaultsLocalProxy init](&v8, sel_init);
  if (v2)
  {
    v3 = geo_isolater_create();
    isolation = v2->_isolation;
    v2->_isolation = (geo_isolater *)v3;

    v2->_missingContainerRetryCount = 0;
    v2->_lastAttempt = 2.22507386e-308;
    v7 = v2;
    geo_dispatch_async_qos();
    dispatch_get_global_queue(21, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    GEORegisterPListStateCaptureLegacy();

  }
  return v2;
}

- (unint64_t)_updateReason
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  char v7;
  id v8;
  id v9;
  void *v10;
  double v11;
  _BOOL4 v12;
  unint64_t v13;
  NSObject *v14;
  id v16;
  id v17;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  _networkDefaultsURL();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "absoluteString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  _getValue(GeoServicesConfig_LastNetworkDefaultsURL, (uint64_t)off_1EDF4CD38, 1, 0, 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqualToString:", v4))
  {
    +[GEOFilePaths urlFor:](GEOFilePaths, "urlFor:", 23);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    v6 = *MEMORY[0x1E0C998D8];
    v16 = 0;
    v7 = objc_msgSend(v5, "getResourceValue:forKey:error:", &v17, v6, &v16);
    v8 = v17;
    v9 = v16;

    if ((v7 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "timeIntervalSinceDate:", v8);
      v12 = v11 > 79200.0;

      v13 = 2 * v12;
    }
    else
    {
      GEOGetNetworkDefaultsLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v19 = v9;
        _os_log_impl(&dword_1885A9000, v14, OS_LOG_TYPE_ERROR, "Could get date of network defaults file: %@", buf, 0xCu);
      }

      v13 = 5;
    }

  }
  else
  {
    v13 = 3;
  }

  return v13;
}

- (void)valueChangedForGEOConfigKey:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  GEOGetNetworkDefaultsLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1885A9000, v4, OS_LOG_TYPE_DEBUG, "Updating network defaults due to config key change", v5, 2u);
  }

  -[_GEONetworkDefaultsLocalProxy _updateNetworkDefaults](self, "_updateNetworkDefaults");
}

- (void)updateNetworkDefaults:(id)a3
{
  -[_GEONetworkDefaultsLocalProxy updateNetworkDefaultsWithReason:completionHandler:](self, "updateNetworkDefaultsWithReason:completionHandler:", 4, a3);
}

- (BOOL)_updateWithNewConfig:(id)a3 request:(id)a4 response:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  char v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  BOOL v29;
  NSObject *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id WeakRetained;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  NSObject *v53;
  id v54;
  NSObject *v55;
  NSObject *v56;
  id v57;
  const char *v58;
  id v59;
  _GEONetworkDefaultsLocalProxy *v61;
  void *v62;
  void *v63;
  id v64[2];
  __int128 buf;
  uint8_t v66[4];
  id v67;
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (v10)
  {
    readNetworkDefaultsFromFile((uint64_t *)a6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13 && (objc_msgSend(v10, "isEqualToDictionary:", v13) & 1) != 0)
    {
      GEOGetNetworkDefaultsLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_1885A9000, v14, OS_LOG_TYPE_DEBUG, "Updated network defaults are identical to old network defaults.", (uint8_t *)&buf, 2u);
      }

      +[GEOFilePaths urlFor:](GEOFilePaths, "urlFor:", 23);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = *MEMORY[0x1E0C998D8];
      v64[0] = 0;
      v18 = objc_msgSend(v15, "setResourceValue:forKey:error:", v16, v17, v64);
      v19 = v64[0];

      if ((v18 & 1) == 0)
      {
        GEOGetNetworkDefaultsLog();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          LODWORD(buf) = 138543362;
          *(_QWORD *)((char *)&buf + 4) = v19;
          _os_log_impl(&dword_1885A9000, v20, OS_LOG_TYPE_ERROR, "Failed to update modification time of network defaults: %{public}@", (uint8_t *)&buf, 0xCu);
        }

      }
      _getValue(GeoServicesConfig_LastNetworkDefaultsURL, (uint64_t)off_1EDF4CD38, 1, 0, 0, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "URL");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "absoluteString");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v21, "isEqualToString:", v23);

      if ((v24 & 1) == 0)
      {
        objc_msgSend(v11, "URL");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "absoluteString");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        _setValue(GeoServicesConfig_LastNetworkDefaultsURL, (uint64_t)off_1EDF4CD38, v26, 1, 0);

      }
      objc_msgSend(v12, "allHeaderFields");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("ETag"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      if (v28 && !_GEOConfigHasValue(GeoServicesConfig_LastNetworkDefaultsETag, (uint64_t)off_1EDF4CD48))
        _setValue(GeoServicesConfig_LastNetworkDefaultsETag, (uint64_t)off_1EDF4CD48, v28, 1, 0);

      v29 = 1;
      goto LABEL_39;
    }
    GEOGetNetworkDefaultsLog();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1885A9000, v30, OS_LOG_TYPE_INFO, "Received new network defaults. Informing interested clients.", (uint8_t *)&buf, 2u);
    }

    v31 = v10;
    +[GEOFilePaths urlFor:](GEOFilePaths, "urlFor:", 23);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v32)
    {
      if (a6)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -13, CFSTR("Could not get GEONetworkDefaultsFile"));
        *a6 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        GEOGetNetworkDefaultsLog();
        v55 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v66 = 0;
          _os_log_impl(&dword_1885A9000, v55, OS_LOG_TYPE_ERROR, "Missing the error argument. Could not get GEONetworkDefaultsFile.", v66, 2u);
        }

      }
      v29 = 0;
      goto LABEL_39;
    }
    v33 = v32;
    v62 = v12;
    v63 = v11;
    objc_msgSend(v32, "URLByDeletingLastPathComponent");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v35, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v34, 1, 0, a6) & 1) == 0)
    {
      GEOGetNetworkDefaultsLog();
      v53 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
      {
        v54 = *a6;
        *(_DWORD *)v66 = 138543362;
        v67 = v54;
        _os_log_impl(&dword_1885A9000, v53, OS_LOG_TYPE_ERROR, "Failed to create parent directory for network defaults: %{public}@", v66, 0xCu);
      }

      goto LABEL_38;
    }
    v61 = self;
    v36 = *MEMORY[0x1E0CB2AE0];
    v37 = (void *)*MEMORY[0x1E0CB2AA8];
    v64[0] = *(id *)MEMORY[0x1E0CB2AD8];
    v64[1] = v37;
    *(_QWORD *)&buf = v36;
    *((_QWORD *)&buf + 1) = &unk_1E1E812E0;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &buf, v64, 2);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "absoluteURL");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "path");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "createFileAtPath:contents:attributes:", v40, 0, v38);

    objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v31, 200, 0, a6);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = v41;
    if (v41)
    {
      if ((objc_msgSend(v41, "writeToURL:options:error:", v33, 268435457, a6) & 1) != 0)
      {

        v11 = v63;
        objc_msgSend(v63, "URL");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "absoluteString");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = 1;
        _setValue(GeoServicesConfig_LastNetworkDefaultsURL, (uint64_t)off_1EDF4CD38, v44, 1, 0);

        v12 = v62;
        objc_msgSend(v62, "allHeaderFields");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "objectForKeyedSubscript:", CFSTR("ETag"));
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        _setValue(GeoServicesConfig_LastNetworkDefaultsETag, (uint64_t)off_1EDF4CD48, v46, 1, 0);

        WeakRetained = objc_loadWeakRetained((id *)&v61->_delegate);
        objc_msgSend(WeakRetained, "serverProxy:networkDefaultsDidChange:", v61, v31);

        notify_post("com.apple.GeoServices.internal.networkDefaultsChanged");
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 2);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)GEODefaultsDomain(), "lastPathComponent");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKeyedSubscript:", v49);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "setObject:forKeyedSubscript:", v50, *MEMORY[0x1E0CB2CC8]);

        objc_msgSend(v31, "objectForKeyedSubscript:", v49);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "setObject:forKeyedSubscript:", v51, *MEMORY[0x1E0CB2CB8]);

        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "postNotificationName:object:userInfo:", CFSTR("GEONetworkDefaultsDidChangeInternalNotification"), v61, v48);

LABEL_39:
        goto LABEL_40;
      }
      GEOGetNetworkDefaultsLog();
      v56 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
        goto LABEL_37;
      v59 = *a6;
      *(_DWORD *)v66 = 138543362;
      v67 = v59;
      v58 = "Failed to write new network defaults to disk: %{public}@";
    }
    else
    {
      GEOGetNetworkDefaultsLog();
      v56 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
      {
LABEL_37:

LABEL_38:
        v29 = 0;
        v12 = v62;
        v11 = v63;
        goto LABEL_39;
      }
      v57 = *a6;
      *(_DWORD *)v66 = 138543362;
      v67 = v57;
      v58 = "Unable to serialize new network defaults data: %{public}@";
    }
    _os_log_impl(&dword_1885A9000, v56, OS_LOG_TYPE_ERROR, v58, v66, 0xCu);
    goto LABEL_37;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    LOWORD(buf) = 0;
    _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: newConfig != ((void *)0)", (uint8_t *)&buf, 2u);
  }
  v29 = 0;
LABEL_40:

  return v29;
}

- (id)captureStatePlistWithHints:(os_state_hints_s *)a3
{
  id v3;
  void *v4;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v6;
  geo_isolate_sync();
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

- (_GEONetworkDefaultsServerProxyDelegate)delegate
{
  return (_GEONetworkDefaultsServerProxyDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateCompletionHandlers, 0);
  objc_storeStrong((id *)&self->_isolation, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
