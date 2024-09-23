@implementation NSURLSession

- (NSURLSessionDownloadTask)downloadTaskWithRequest:(NSURLRequest *)request
{
  _QWORD *v5;
  const char *v6;
  void *v7;

  v5 = -[__NSCFTaskForClass initWithGroup:]([__NSCFTaskForClass alloc], -[NSURLSession defaultTaskGroup](self, "defaultTaskGroup"));
  v7 = v5;
  if (v5)
    objc_setProperty_atomic(v5, v6, request, 16);
  return (NSURLSessionDownloadTask *)-[NSURLSession _downloadTaskWithTaskForClass:](self, "_downloadTaskWithTaskForClass:", v7);
}

- (NSURLSessionUploadTask)uploadTaskWithRequest:(NSURLRequest *)request fromFile:(NSURL *)fileURL
{
  _QWORD *v7;
  const char *v8;
  void *v9;
  SEL v10;

  v7 = -[__NSCFTaskForClass initWithGroup:]([__NSCFTaskForClass alloc], -[NSURLSession defaultTaskGroup](self, "defaultTaskGroup"));
  v9 = v7;
  if (v7)
  {
    objc_setProperty_atomic(v7, v8, request, 16);
    objc_setProperty_atomic(v9, v10, fileURL, 32);
  }
  return (NSURLSessionUploadTask *)-[NSURLSession _uploadTaskWithTaskForClass:](self, "_uploadTaskWithTaskForClass:", v9);
}

- (NSURLSessionUploadTask)uploadTaskWithRequest:(NSURLRequest *)request fromData:(NSData *)bodyData completionHandler:(void *)completionHandler
{
  _QWORD *v9;
  const char *v10;
  void *v11;
  SEL v12;
  SEL v13;

  v9 = -[__NSCFTaskForClass initWithGroup:]([__NSCFTaskForClass alloc], -[NSURLSession defaultTaskGroup](self, "defaultTaskGroup"));
  v11 = v9;
  if (v9)
  {
    objc_setProperty_atomic(v9, v10, request, 16);
    objc_setProperty_atomic(v11, v12, bodyData, 40);
    objc_setProperty_atomic_copy(v11, v13, completionHandler, 48);
  }
  return (NSURLSessionUploadTask *)-[NSURLSession _uploadTaskWithTaskForClass:](self, "_uploadTaskWithTaskForClass:", v11);
}

- (NSURLSessionDataTask)dataTaskWithURL:(NSURL *)url
{
  _QWORD *v5;
  NSURLRequest *v6;
  const char *v7;

  v5 = -[__NSCFTaskForClass initWithGroup:]([__NSCFTaskForClass alloc], -[NSURLSession defaultTaskGroup](self, "defaultTaskGroup"));
  v6 = +[NSURLRequest requestWithURL:](NSURLRequest, "requestWithURL:", url);
  if (v5)
    objc_setProperty_atomic(v5, v7, v6, 16);
  return (NSURLSessionDataTask *)-[NSURLSession _dataTaskWithTaskForClass:](self, "_dataTaskWithTaskForClass:", v5);
}

- (NSURLSessionDataTask)dataTaskWithURL:(NSURL *)url completionHandler:(void *)completionHandler
{
  _QWORD *v7;
  NSURLRequest *v8;
  const char *v9;
  SEL v10;

  v7 = -[__NSCFTaskForClass initWithGroup:]([__NSCFTaskForClass alloc], -[NSURLSession defaultTaskGroup](self, "defaultTaskGroup"));
  v8 = +[NSURLRequest requestWithURL:](NSURLRequest, "requestWithURL:", url);
  if (v7)
  {
    objc_setProperty_atomic(v7, v9, v8, 16);
    objc_setProperty_atomic_copy(v7, v10, completionHandler, 48);
  }
  return (NSURLSessionDataTask *)-[NSURLSession _dataTaskWithTaskForClass:](self, "_dataTaskWithTaskForClass:", v7);
}

- (id)_dataTaskWithRequest:(id)a3 delegate:(id)a4 completionHandler:(id)a5
{
  _QWORD *v9;
  const char *v10;
  void *v11;
  SEL v12;
  SEL v13;

  v9 = -[__NSCFTaskForClass initWithGroup:]([__NSCFTaskForClass alloc], -[NSURLSession defaultTaskGroup](self, "defaultTaskGroup"));
  v11 = v9;
  if (v9)
  {
    objc_setProperty_atomic(v9, v10, a3, 16);
    objc_setProperty_atomic_copy(v11, v12, a5, 48);
    objc_setProperty_atomic(v11, v13, a4, 80);
  }
  return -[NSURLSession _dataTaskWithTaskForClass:](self, "_dataTaskWithTaskForClass:", v11);
}

- (NSURLSessionDataTask)dataTaskWithRequest:(NSURLRequest *)request
{
  _QWORD *v5;
  const char *v6;
  void *v7;

  v5 = -[__NSCFTaskForClass initWithGroup:]([__NSCFTaskForClass alloc], -[NSURLSession defaultTaskGroup](self, "defaultTaskGroup"));
  v7 = v5;
  if (v5)
    objc_setProperty_atomic(v5, v6, request, 16);
  return (NSURLSessionDataTask *)-[NSURLSession _dataTaskWithTaskForClass:](self, "_dataTaskWithTaskForClass:", v7);
}

- (NSURLSessionDataTask)dataTaskWithRequest:(NSURLRequest *)request completionHandler:(void *)completionHandler
{
  _QWORD *v7;
  const char *v8;
  void *v9;
  SEL v10;

  v7 = -[__NSCFTaskForClass initWithGroup:]([__NSCFTaskForClass alloc], -[NSURLSession defaultTaskGroup](self, "defaultTaskGroup"));
  v9 = v7;
  if (v7)
  {
    objc_setProperty_atomic(v7, v8, request, 16);
    objc_setProperty_atomic_copy(v9, v10, completionHandler, 48);
  }
  return (NSURLSessionDataTask *)-[NSURLSession _dataTaskWithTaskForClass:](self, "_dataTaskWithTaskForClass:", v9);
}

- (NSURLSessionConfiguration)_groupConfiguration
{
  return self->_local_immutable_configuration_ivar;
}

- (NSString)_tlsSessionCachePrefix
{
  return self->_tlsSessionCachePrefix;
}

+ (uint64_t)_sharedSessionForConnection
{
  uint64_t v0;

  objc_opt_self();
  v0 = +[NSURLSession _sharedSession]();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (+[NSURLSession _sharedSessionForConnection]::sOnce != -1)
      dispatch_once(&+[NSURLSession _sharedSessionForConnection]::sOnce, &__block_literal_global_33_12766);
    return +[NSURLSession _sharedSessionForConnection]::sSharedSession;
  }
  return v0;
}

+ (uint64_t)_sharedSession
{
  void *v0;
  void *v1;
  uint64_t v2;
  const char *Name;
  objc_class *v4;

  v0 = (void *)objc_opt_self();
  if (objc_msgSend(v0, "isEqual:", objc_opt_class()))
  {
    v1 = (void *)MEMORY[0x1E0C99DA0];
    v2 = *MEMORY[0x1E0C99778];
    Name = sel_getName(sel__sharedSession);
    v4 = (objc_class *)objc_opt_class();
    objc_msgSend(v1, "raise:format:", v2, CFSTR("*** -%s is not supported by %s"), Name, class_getName(v4));
  }
  if (+[NSURLSession _sharedSession]::sOnce != -1)
    dispatch_once(&+[NSURLSession _sharedSession]::sOnce, &__block_literal_global_29_12691);
  return +[NSURLSession _sharedSession]::sSharedSession;
}

- (uint64_t)_onqueue_didCompleteTask:(void *)a3 withError:
{
  void *v4;
  uint64_t v5;
  const char *v6;
  os_log_type_t v7;
  int v8;
  uint64_t v9;
  _BOOL4 v10;
  NSObject *v11;
  os_log_type_t v12;
  uint32_t v13;
  uint64_t v14;
  _QWORD v15[5];
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (!result)
    return result;
  v4 = (void *)+[NSURLSession _errorFromError:forTask:]((uint64_t)NSURLSession, a3, a2);
  objc_msgSend(a2, "setState:", 3);
  if (!v4)
  {
    if (CFNLog::onceToken != -1)
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
    v5 = CFNLog::logger;
    if (!os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT))
      goto LABEL_23;
    *(_DWORD *)buf = 138543362;
    v17 = objc_msgSend(a2, "_loggableDescription");
    v6 = "%{public}@ finished successfully";
LABEL_18:
    v11 = v5;
    v12 = OS_LOG_TYPE_DEFAULT;
    v13 = 12;
LABEL_22:
    _os_log_impl(&dword_183ECA000, v11, v12, v6, buf, v13);
    goto LABEL_23;
  }
  if (objc_msgSend(a2, "_cacheOnly") && objc_msgSend(v4, "code") == -2000)
  {
    if (CFNLog::onceToken != -1)
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
    v5 = CFNLog::logger;
    if (!os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT))
      goto LABEL_23;
    *(_DWORD *)buf = 138543362;
    v17 = objc_msgSend(a2, "_loggableDescription");
    v6 = "%{public}@ finished - cache miss";
    goto LABEL_18;
  }
  v7 = 16 * (objc_msgSend(v4, "code") != -999);
  v8 = objc_msgSend((id)objc_msgSend(a2, "_effectiveConfiguration"), "_loggingPrivacyLevel");
  if (CFNLog::onceToken != -1)
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
  v9 = CFNLog::logger;
  v10 = os_log_type_enabled((os_log_t)CFNLog::logger, v7);
  if (v8 > 2)
  {
    if (v10)
    {
      *(_DWORD *)buf = 138543875;
      v17 = objc_msgSend(a2, "_loggableDescription");
      v18 = 2048;
      v19 = objc_msgSend(v4, "code");
      v20 = 2117;
      v21 = v4;
      v6 = "%{public}@ finished with error [%ld] %{sensitive}@";
      goto LABEL_21;
    }
  }
  else if (v10)
  {
    *(_DWORD *)buf = 138543874;
    v17 = objc_msgSend(a2, "_loggableDescription");
    v18 = 2048;
    v19 = objc_msgSend(v4, "code");
    v20 = 2112;
    v21 = v4;
    v6 = "%{public}@ finished with error [%ld] %@";
LABEL_21:
    v11 = v9;
    v12 = v7;
    v13 = 32;
    goto LABEL_22;
  }
LABEL_23:
  if (a2)
  {
    v14 = a2[88];
    if (!v14)
      v14 = a2[87];
  }
  else
  {
    v14 = 0;
  }
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __51__NSURLSession__onqueue_didCompleteTask_withError___block_invoke;
  v15[3] = &unk_1E14FE118;
  v15[4] = a2;
  -[__NSCFURLSessionDelegateWrapper task:didCompleteWithError:completionHandler:](v14, a2, v4, v15);
  return +[__NSURLSessionStatistics reportMetricsToSymptoms:](__NSURLSessionStatistics, "reportMetricsToSymptoms:", a2);
}

+ (uint64_t)_errorFromError:(void *)a3 forTask:
{
  id v5;
  void *v7;
  id v8;
  void *v9;

  objc_opt_self();
  if (!a2)
    return 0;
  if (objc_msgSend(a2, "userInfo"))
    v5 = (id)objc_msgSend((id)objc_msgSend(a2, "userInfo"), "mutableCopy");
  else
    v5 = (id)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 2);
  v7 = v5;
  if (objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("_NSURLErrorRelatedURLSessionTaskErrorKey")))
    v8 = (id)objc_msgSend((id)objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("_NSURLErrorRelatedURLSessionTaskErrorKey")), "mutableCopy");
  else
    v8 = (id)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 1);
  v9 = v8;
  objc_msgSend(v8, "insertObject:atIndex:", objc_msgSend(a3, "_description"), 0);
  objc_msgSend(v7, "setObject:forKeyedSubscript:", (id)objc_msgSend(v9, "copy"), CFSTR("_NSURLErrorRelatedURLSessionTaskErrorKey"));
  objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(a3, "_description"), CFSTR("_NSURLErrorFailingURLSessionTaskErrorKey"));
  return objc_msgSend(MEMORY[0x1E0CB39B8], "errorWithDomain:code:userInfo:", objc_msgSend(a2, "domain"), objc_msgSend(a2, "code"), v7);
}

+ (__NSURLSessionLocal)_sessionWithConfiguration:(uint64_t)a3 delegate:(uint64_t)a4 delegateQueue:(uint64_t)a5 delegateDispatchQueue:
{
  id *v9;
  void *v10;
  uint64_t v11;
  const char *Name;
  objc_class *v13;
  int v14;
  void *v15;
  double v16;
  NSObject *v17;
  double v18;
  double v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  uint64_t v23;
  double v24;
  uint64_t v25;
  const char *v26;
  double v27;
  __NSURLSessionLocal *v28;
  NSObject *v29;
  __NSURLSessionLocal *v30;
  io_connect_t v31;
  uint64_t v32;
  void *v33;
  NSObject *v34;
  uint64_t v35;
  uint64_t v36;
  double v37;
  NSObject *v39;
  __NSURLSessionLocal *v40;
  NSObject *v42;
  uint8_t v43[8];
  uint64_t v44;
  uint64_t (*v45)(uint64_t);
  void *v46;
  uint64_t *v47;
  _QWORD block[5];
  uint64_t v49;
  int *v50;
  uint64_t v51;
  int v52;
  __int128 buf;
  uint64_t (*v54)(uint64_t, int);
  void *v55;
  _QWORD *v56;
  uint64_t *v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v9 = (id *)objc_opt_self();
  if (objc_msgSend(v9, "isEqual:", objc_opt_class()))
  {
    v10 = (void *)MEMORY[0x1E0C99DA0];
    v11 = *MEMORY[0x1E0C99778];
    Name = sel_getName(sel__sessionWithConfiguration_delegate_delegateQueue_delegateDispatchQueue_);
    v13 = (objc_class *)objc_opt_class();
    objc_msgSend(v10, "raise:format:", v11, CFSTR("*** -%s is not supported by %s"), Name, class_getName(v13));
  }
  objc_opt_self();
  if (-[NSString isEqualToString:](-[NSURLSessionConfiguration disposition](a2, "disposition"), "isEqualToString:", 0x1EDD00610)|| -[NSURLSessionConfiguration _disablesNWLoader](a2, "_disablesNWLoader"))
  {
    goto LABEL_9;
  }
  if (__CFNUseNWLoader::onceToken != -1)
    dispatch_once(&__CFNUseNWLoader::onceToken, &__block_literal_global_32);
  if (__CFNUseNWLoader::useNWLoader == 1
    || __CFNUseNWLoader::useNWLoader != 2
    && (-[NSURLSessionConfiguration _usesNWLoader](a2, "_usesNWLoader")
     || -[NSURLSessionConfiguration proxiesRequireNWLoader](a2, "proxiesRequireNWLoader")
     || (objc_opt_self(), gotLoadHelper_x22__OBJC_CLASS___PrivacyProxyClient(v37), objc_opt_class())
     && (objc_msgSend(v9[343], "currentProcessShouldUseOpaqueProxying") & 1) != 0))
  {
    v14 = 1;
  }
  else
  {
LABEL_9:
    v14 = 0;
  }
  if (+[NSURLSession _sessionWithConfiguration:delegate:delegateQueue:delegateDispatchQueue:]::onceToken != -1)
    dispatch_once(&+[NSURLSession _sessionWithConfiguration:delegate:delegateQueue:delegateDispatchQueue:]::onceToken, &__block_literal_global_47_12650);
  v15 = (void *)MEMORY[0x186DB8C8C]();
  if (!a2)
  {
    if ((v14 & 1) != 0)
    {
LABEL_33:
      objc_autoreleasePoolPop(v15);
      return (__NSURLSessionLocal *)(id)objc_msgSend(objc_alloc(objc_getClass("NWURLSession")), "initWithConfiguration:delegate:delegateQueue:", a2, a3, a4);
    }
    a2 = +[NSURLSessionConfiguration defaultSessionConfiguration](NSURLSessionConfiguration, "defaultSessionConfiguration");
LABEL_34:
    v28 = -[__NSURLSessionLocal initWithConfiguration:delegate:delegateQueue:delegateDispatchQueue:]([__NSURLSessionLocal alloc], "initWithConfiguration:delegate:delegateQueue:delegateDispatchQueue:", a2, a3, a4, a5);
    if (-[NSURLSessionConfiguration _disableAPWakeOnIdleConnections](a2, "_disableAPWakeOnIdleConnections"))
    {
      if (CFNLog::onceToken != -1)
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
      v29 = CFNLog::logger;
      if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_183ECA000, v29, OS_LOG_TYPE_DEFAULT, "Session opted-in for _disableAPWakeOnIdleConnections", (uint8_t *)&buf, 2u);
      }
      v30 = v28;
      if (v28)
      {
        *((_DWORD *)v28 + 13) = 0;
        *((_DWORD *)v28 + 12) = 0;
        *((_BYTE *)v28 + 69) = 0;
        v31 = IORegisterForSystemPower(v28, (IONotificationPortRef *)v28 + 7, (IOServiceInterestCallback)_systemPowerNotificationsCallback, (io_object_t *)v28 + 16);
        *((_DWORD *)v28 + 13) = v31;
        if (v31)
        {
          IONotificationPortSetDispatchQueue(*((IONotificationPortRef *)v28 + 7), *((dispatch_queue_t *)v28 + 15));
        }
        else
        {
          if (CFNLog::onceToken != -1)
            dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
          v39 = CFNLog::logger;
          if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
          {
            LOWORD(buf) = 0;
            _os_log_error_impl(&dword_183ECA000, v39, OS_LOG_TYPE_ERROR, "Failed to IORegisterForSystemPower", (uint8_t *)&buf, 2u);
          }
        }
      }
    }
    objc_autoreleasePoolPop(v15);
    goto LABEL_67;
  }
  if (!CFEqual(-[NSURLSessionConfiguration disposition](a2, "disposition"), &unk_1EDD00610))
  {
    if ((v14 & 1) != 0)
      goto LABEL_33;
    goto LABEL_34;
  }
  if (!-[NSURLSessionConfiguration _isProxySession](a2, "_isProxySession")
    && MKBDeviceUnlockedSinceBoot_delayInitStub(v16) != 1)
  {
    if (CFNLog::onceToken != -1)
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
    v17 = CFNLog::logger;
    if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf) = 0;
      _os_log_error_impl(&dword_183ECA000, v17, OS_LOG_TYPE_ERROR, "Attempting to create a background session before first device unlock!", (uint8_t *)&buf, 2u);
    }
    if (MKBDeviceFormattedForContentProtection_delayInitStub(v18)
      && MKBDeviceUnlockedSinceBoot_delayInitStub(v19) != 1)
    {
      if (CFNLog::onceToken != -1)
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
      v20 = CFNLog::logger;
      if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_183ECA000, v20, OS_LOG_TYPE_DEFAULT, "Waiting for first unlock", (uint8_t *)&buf, 2u);
      }
      v49 = 0;
      v50 = (int *)&v49;
      v51 = 0x2020000000;
      v52 = 0;
      v21 = dispatch_semaphore_create(0);
      v22 = dispatch_queue_create("com.apple.nsurlsession.wait-unlock", 0);
      v23 = MEMORY[0x1E0C809B0];
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = ___ZL28CFNWaitUntilDeviceIsUnlockedv_block_invoke;
      block[3] = &unk_1E14FE118;
      block[4] = v21;
      gotLoadHelper_x8__kMobileKeyBagLockStatusNotifyToken(v24);
      v26 = **(const char ***)(v25 + 1536);
      *(_QWORD *)&buf = v23;
      *((_QWORD *)&buf + 1) = 3221225472;
      v54 = ___ZL28CFNWaitUntilDeviceIsUnlockedv_block_invoke_347;
      v55 = &unk_1E14FBFC0;
      v56 = block;
      v57 = &v49;
      if (notify_register_dispatch(v26, v50 + 6, v22, &buf))
      {
        if (CFNLog::onceToken != -1)
          dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
        v42 = CFNLog::logger;
        if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v43 = 0;
          _os_log_error_impl(&dword_183ECA000, v42, OS_LOG_TYPE_ERROR, "Failed to regsiter for lock status notification! Calling abort()", v43, 2u);
        }
        abort();
      }
      dispatch_async(v22, block);
      dispatch_semaphore_wait(v21, 0xFFFFFFFFFFFFFFFFLL);
      *(_QWORD *)v43 = v23;
      v44 = 3221225472;
      v45 = ___ZL28CFNWaitUntilDeviceIsUnlockedv_block_invoke_348;
      v46 = &unk_1E14FD3D8;
      v47 = &v49;
      dispatch_sync(v22, v43);
      dispatch_release(v22);
      dispatch_release(v21);
      _Block_object_dispose(&v49, 8);
    }
  }
  if (-[NSURLSessionConfiguration _isProxySession](a2, "_isProxySession"))
  {
    v28 = -[__NSURLBackgroundSession initWithConfiguration:delegate:delegateQueue:delegateDispatchQueue:]([__NSURLBackgroundSession alloc], "initWithConfiguration:delegate:delegateQueue:delegateDispatchQueue:", a2, a3, a4, a5);
    goto LABEL_60;
  }
  if (__CFNIsInDevelopmentEnvironment::onceToken != -1)
    dispatch_once(&__CFNIsInDevelopmentEnvironment::onceToken, &__block_literal_global_21_4777);
  if (__CFNIsInDevelopmentEnvironment::ok)
  {
    gotLoadHelper_x8__CPCopyBundleIdentifierAndTeamFromSecTaskRef(v27);
    if (*(_QWORD *)(v32 + 576))
    {
      if (+[NSURLSession _sessionWithConfiguration:delegate:delegateQueue:delegateDispatchQueue:]::onceToken != -1)
        dispatch_once(&+[NSURLSession _sessionWithConfiguration:delegate:delegateQueue:delegateDispatchQueue:]::onceToken, &__block_literal_global_51_12655);
    }
  }
  v33 = (void *)objc_opt_class();
  objc_sync_enter(v33);
  if (!objc_msgSend((id)gBackgroundSessions, "objectForKey:", -[NSURLSessionConfiguration identifier](a2, "identifier")))
  {
    v28 = -[__NSURLBackgroundSession initWithConfiguration:delegate:delegateQueue:delegateDispatchQueue:]([__NSURLBackgroundSession alloc], "initWithConfiguration:delegate:delegateQueue:delegateDispatchQueue:", a2, a3, a4, a5);
    objc_msgSend((id)gBackgroundSessions, "setObject:forKey:", v28, -[NSURLSessionConfiguration identifier](a2, "identifier"));
    objc_sync_exit(v33);
LABEL_60:
    objc_autoreleasePoolPop(v15);
    if (v14)
      return (__NSURLSessionLocal *)(id)objc_msgSend(objc_alloc(objc_getClass("NWURLSession")), "initWithConfiguration:delegate:delegateQueue:", a2, a3, a4);
LABEL_67:
    if (-[NSURLSession delegate](v28, "delegate"))
      v40 = v28;
    return v28;
  }
  if (CFNLog::onceToken != -1)
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
  v34 = CFNLog::logger;
  if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT))
  {
    v35 = -[NSURLSessionConfiguration identifier](a2, "identifier");
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v35;
    _os_log_impl(&dword_183ECA000, v34, OS_LOG_TYPE_DEFAULT, "A background URLSession with identifier %@ already exists!", (uint8_t *)&buf, 0xCu);
  }
  v36 = objc_msgSend((id)gBackgroundSessions, "objectForKey:", -[NSURLSessionConfiguration identifier](a2, "identifier"));
  objc_sync_exit(v33);
  objc_autoreleasePoolPop(v15);
  return (__NSURLSessionLocal *)v36;
}

- (id)delegate
{
  return objc_getProperty(self, a2, 96, 1);
}

- (NSURLSession)initWithConfiguration:(id)a3 delegate:(id)a4 delegateQueue:(id)a5 delegateDispatchQueue:(id)a6
{
  NSURLSession *v10;
  NSObject *v11;
  NSObject *v12;
  NSUUID *v13;
  uint64_t v14;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  id *v18;
  const char *v19;
  NSObject *v21;
  __int128 v22;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)NSURLSession;
  v10 = -[NSURLSession init](&v23, sel_init);
  if (!v10)
    return v10;
  if (!a3)
    a3 = +[NSURLSessionConfiguration defaultSessionConfiguration](NSURLSessionConfiguration, "defaultSessionConfiguration");
  v10->_local_immutable_configuration_ivar = (NSURLSessionConfiguration *)objc_msgSend(a3, "copyImmutableVariant:", &__block_literal_global_101);
  v10->_delegateQueue_ivar = (NSOperationQueue *)a5;
  v10->_delegate_ivar = (NSURLSessionDelegate *)a4;
  if (a6)
  {
    v10->_delegateDispatchQueue = (OS_dispatch_queue *)a6;
    v11 = a6;
  }
  else
  {
    if ((id)objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue") != a5)
    {
      if (!a5)
      {
        v21 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
        v10->_delegateDispatchQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.NSURLSession-delegate", v21);
      }
      goto LABEL_7;
    }
    v11 = MEMORY[0x1E0C80D38];
    v10->_delegateDispatchQueue = (OS_dispatch_queue *)MEMORY[0x1E0C80D38];
  }
  dispatch_retain(v11);
LABEL_7:
  v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v10->_workQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.NSURLSession-work", v12);
  v13 = (NSUUID *)objc_alloc_init(MEMORY[0x1E0CB3A28]);
  v10->_uuid_ivar = v13;
  v10->_tlsSessionCachePrefix = (NSString *)-[NSString copy](-[NSUUID UUIDString](v13, "UUIDString"), "copy");
  objc_opt_self();
  if (+[__CFN_ConnectionContextManager sharedManager]::onceToken != -1)
    dispatch_once(&+[__CFN_ConnectionContextManager sharedManager]::onceToken, &__block_literal_global_13582);
  v14 = _sharedManager;
  v10->_nwContextManager = (__CFN_ConnectionContextManager *)_sharedManager;
  -[__CFN_ConnectionContextManager registerSession:](&v22, v14, (uint64_t)v10);
  std::shared_ptr<CoreSchedulingSet>::operator=[abi:nn180100]((uint64_t)&v10->_nwContext, &v22);
  v15 = (std::__shared_weak_count *)*((_QWORD *)&v22 + 1);
  if (*((_QWORD *)&v22 + 1))
  {
    v16 = (unint64_t *)(*((_QWORD *)&v22 + 1) + 8);
    do
      v17 = __ldaxr(v16);
    while (__stlxr(v17 - 1, v16));
    if (!v17)
    {
      ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
      std::__shared_weak_count::__release_weak(v15);
    }
  }
  v10->_lock._os_unfair_lock_opaque = 0;
  v18 = -[__NSCFURLSessionDelegateWrapper initWithSession:]((id *)[__NSCFURLSessionDelegateWrapper alloc], v10);
  v10->_delegateWrapper = (__NSCFURLSessionDelegateWrapper *)v18;
  if (v18)
    objc_setProperty_atomic(v18, v19, a4, 32);
  return v10;
}

uint64_t __83__NSURLSession_initWithConfiguration_delegate_delegateQueue_delegateDispatchQueue___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "_appleIDContext");
  if (result)
    return objc_msgSend(a2, "set_authenticatorStatusCodes:", objc_msgSend((id)objc_msgSend(a2, "_appleIDContext"), "relevantHTTPStatusCodes"));
  return result;
}

- (uint64_t)delegateOptions
{
  uint64_t v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;

  v3 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[__NSCFURLSessionDelegateWrapper _willSendRequestForEstablishedConnection](*(_QWORD *)(a1 + 72), a2));
  v5 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[__NSCFURLSessionDelegateWrapper sessionDidReceiveChallenge](*(_QWORD *)(a1 + 72), v4));
  v7 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[__NSCFURLSessionDelegateWrapper didReceiveChallenge](*(_QWORD *)(a1 + 72), v6));
  v10 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[__NSCFURLSessionDelegateWrapper willBeginDelayedRequest](*(_QWORD *)(a1 + 72), v8));
  v11 = (void *)MEMORY[0x1E0CB37E8];
  v12 = *(_QWORD *)(a1 + 72);
  if (v12)
  {
    if ((-[__NSCFURLSessionDelegateWrapper check_willPerformHTTPRedirection](*(unsigned __int8 **)(a1 + 72), v9) & 1) != 0)
      v14 = 1;
    else
      v14 = -[__NSCFURLSessionDelegateWrapper check_willPerformHTTPRedirection](*(unsigned __int8 **)(v12 + 24), v13);
  }
  else
  {
    v14 = 0;
  }
  v15 = objc_msgSend(v11, "numberWithBool:", v14);
  return objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", v3, CFSTR("NSURLSessionDelegateImplementsWillSendRequestForEstablishedConnectionKey"), v5, CFSTR("NSURLSessionDelegateImplementsSessionAuthChallengeKey"), v7, CFSTR("NSURLSessionDelegateImplementsTaskAuthChallengeKey"), v10, CFSTR("NSURLSessionDelegateImplementsWillBeginDelayedRequestKey"), v15, CFSTR("NSURLSessionDelegateImplementsWillPerformRedirectionKey"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[__NSCFURLSessionDelegateWrapper didReceiveResponse](*(_QWORD *)(a1 + 72), v16)), CFSTR("NSURLSessionDelegateImplementsDidReceiveResponseKey"), 0);
}

void __46__NSURLSession_getTasksWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];

  v2 = (void *)MEMORY[0x186DB8C8C]();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __46__NSURLSession_getTasksWithCompletionHandler___block_invoke_2;
  v4[3] = &unk_1E14FC7C8;
  v3 = *(void **)(a1 + 32);
  v4[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v3, "_onqueue_getTasksWithCompletionHandler:", v4);
  objc_autoreleasePoolPop(v2);
}

- (void)finalizeDelegateWithError:(uint64_t)a1
{
  const char *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  _QWORD block[5];

  if (a1)
  {
    if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 112), "disposition"), "isEqualToString:", 0x1EDD00610)&& (objc_msgSend(*(id *)(a1 + 112), "_isProxySession") & 1) == 0)
    {
      v3 = (void *)objc_opt_class();
      objc_sync_enter(v3);
      v4 = objc_msgSend(*(id *)(a1 + 112), "identifier");
      if (v4 && gBackgroundSessions && objc_msgSend((id)gBackgroundSessions, "objectForKey:", v4))
        objc_msgSend((id)gBackgroundSessions, "removeObjectForKey:", v4);
      objc_sync_exit(v3);
    }
    v5 = *(void **)(a1 + 96);
    if (v5)
    {
      *(_QWORD *)(a1 + 96) = 0;
      -[__NSCFURLSessionDelegateWrapper didBecomeInvalidWithError:](*(_QWORD *)(a1 + 72), v2);

      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __42__NSURLSession_finalizeDelegateWithError___block_invoke;
      block[3] = &unk_1E14FE118;
      block[4] = a1;
      v6 = *(NSObject **)(a1 + 88);
      if (v6)
        dispatch_async(v6, block);
      else
        objc_msgSend(*(id *)(a1 + 80), "addOperationWithBlock:", block);
    }
  }
}

- (void)runDelegateBlock:(uint64_t)a1
{
  if (a1)
  {
    if (*(_QWORD *)(a1 + 88))
      dispatch_async(*(dispatch_queue_t *)(a1 + 88), a2);
    else
      objc_msgSend(*(id *)(a1 + 80), "addOperationWithBlock:", a2);
  }
}

void __51__NSURLSession__onqueue_didCompleteTask_withError___block_invoke(uint64_t a1)
{
  const char *v2;

  objc_msgSend(*(id *)(a1 + 32), "_onSessionQueue_disavow");
  objc_msgSend(*(id *)(a1 + 32), "_onSessionQueue_cleanupAndBreakCycles");
  -[NSURLSessionTask _resetTaskDelegate](*(_QWORD *)(a1 + 32), v2);
}

- (void)dealloc
{
  NSObject *workQueue;
  const char *v4;
  std::__shared_weak_count *v5;
  unint64_t *v6;
  unint64_t v7;
  SEL v8;
  NSObject *delegateDispatchQueue;
  objc_super v10;
  __int128 v11;

  if (self->_isSharedSession_ivar)
    __assert_rtn("-[NSURLSession dealloc]", "Session.mm", 542, "! _isSharedSession_ivar");
  -[__CFN_ConnectionContextManager unregisterSession:]((uint64_t)self->_nwContextManager, (uint64_t)self);
  workQueue = self->_workQueue;
  if (workQueue)
  {
    dispatch_release(workQueue);
    self->_workQueue = 0;
  }

  self->_uuid_ivar = 0;
  self->_tlsSessionCachePrefix = 0;
  v11 = 0uLL;
  std::shared_ptr<CoreSchedulingSet>::operator=[abi:nn180100]((uint64_t)&self->_nwContext, &v11);
  v5 = (std::__shared_weak_count *)*((_QWORD *)&v11 + 1);
  if (*((_QWORD *)&v11 + 1))
  {
    v6 = (unint64_t *)(*((_QWORD *)&v11 + 1) + 8);
    do
      v7 = __ldaxr(v6);
    while (__stlxr(v7 - 1, v6));
    if (!v7)
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }
  self->_nwContextManager = 0;
  objc_setProperty_atomic(self, v4, 0, 144);
  objc_setProperty_atomic(self, v8, 0, 152);

  self->_sessionDescription_ivar = 0;
  self->_atsState_ivar = 0;

  delegateDispatchQueue = self->_delegateDispatchQueue;
  if (delegateDispatchQueue)
    dispatch_release(delegateDispatchQueue);

  self->_delegate_ivar = 0;
  self->_local_immutable_configuration_ivar = 0;
  v10.receiver = self;
  v10.super_class = (Class)NSURLSession;
  -[NSURLSession dealloc](&v10, sel_dealloc);
}

- (void)set_tlsSessionCachePrefix:(id)a3
{
  NSString *tlsSessionCachePrefix;
  NSString *v6;
  std::__shared_weak_count *v7;
  unint64_t *v8;
  unint64_t v9;
  __int128 v10;

  tlsSessionCachePrefix = self->_tlsSessionCachePrefix;
  -[__CFN_ConnectionContextManager unregisterSession:]((uint64_t)self->_nwContextManager, (uint64_t)self);
  if (a3)
    v6 = (NSString *)a3;
  else
    v6 = (NSString *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3A28], "UUID"), "UUIDString"), "copy");
  self->_tlsSessionCachePrefix = v6;

  -[__CFN_ConnectionContextManager registerSession:](&v10, (uint64_t)self->_nwContextManager, (uint64_t)self);
  std::shared_ptr<CoreSchedulingSet>::operator=[abi:nn180100]((uint64_t)&self->_nwContext, &v10);
  v7 = (std::__shared_weak_count *)*((_QWORD *)&v10 + 1);
  if (*((_QWORD *)&v10 + 1))
  {
    v8 = (unint64_t *)(*((_QWORD *)&v10 + 1) + 8);
    do
      v9 = __ldaxr(v8);
    while (__stlxr(v9 - 1, v8));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }
}

- (void)_useTLSSessionCacheFromSession:(id)a3
{
  -[NSURLSession set_tlsSessionCachePrefix:](self, "set_tlsSessionCachePrefix:", objc_msgSend(a3, "_tlsSessionCachePrefix"));
}

- (NSURLSessionConfiguration)configuration
{
  return (NSURLSessionConfiguration *)(id)-[NSURLSessionConfiguration mutableCopy](self->_local_immutable_configuration_ivar, "mutableCopy");
}

- (id).cxx_construct
{
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  return self;
}

+ (NSURLSession)sessionWithConfiguration:(NSURLSessionConfiguration *)configuration delegate:(id)delegate delegateQueue:(NSOperationQueue *)queue
{
  return (NSURLSession *)+[NSURLSession _sessionWithConfiguration:delegate:delegateQueue:delegateDispatchQueue:]((uint64_t)NSURLSession, configuration, (uint64_t)delegate, (uint64_t)queue, 0);
}

- (NSString)sessionDescription
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

+ (id)_sessionWithConfiguration:(id)a3 delegate:(id)a4 delegateDispatchQueue:(id)a5
{
  return +[NSURLSession _sessionWithConfiguration:delegate:delegateQueue:delegateDispatchQueue:]((uint64_t)NSURLSession, (NSURLSessionConfiguration *)a3, (uint64_t)a4, 0, (uint64_t)a5);
}

uint64_t __35__NSURLSession_invalidateAndCancel__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_completeInvalidation:", 1);
}

void __46__NSURLSession_getTasksWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[7];

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 0);
  v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 0);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __46__NSURLSession_getTasksWithCompletionHandler___block_invoke_3;
  v7[3] = &unk_1E14FBF28;
  v7[4] = v5;
  v7[5] = v4;
  v7[6] = v6;
  objc_msgSend(a2, "enumerateObjectsUsingBlock:", v7);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)invalidateAndCancel
{
  _BOOL4 invalid_ivar;
  NSObject *workQueue;
  _QWORD block[5];

  if (self->_isSharedSession_ivar)
  {
    NSLog(CFSTR("[NSURLSession sharedSession] may not be invalidated"), a2);
  }
  else
  {
    objc_sync_enter(self);
    invalid_ivar = self->_invalid_ivar;
    self->_invalid_ivar = 1;
    objc_sync_exit(self);
    if (!invalid_ivar)
    {
      workQueue = self->_workQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __35__NSURLSession_invalidateAndCancel__block_invoke;
      block[3] = &unk_1E14FE118;
      block[4] = self;
      dispatch_async(workQueue, block);
    }
  }
}

+ (NSURLSession)sessionWithConfiguration:(NSURLSessionConfiguration *)configuration
{
  void *v5;
  uint64_t v6;
  const char *Name;
  objc_class *v8;

  if (objc_msgSend(a1, "isEqual:", objc_opt_class()))
  {
    v5 = (void *)MEMORY[0x1E0C99DA0];
    v6 = *MEMORY[0x1E0C99778];
    Name = sel_getName(a2);
    v8 = (objc_class *)objc_opt_class();
    objc_msgSend(v5, "raise:format:", v6, CFSTR("*** -%s is not supported by %s"), Name, class_getName(v8));
  }
  return +[NSURLSession sessionWithConfiguration:delegate:delegateQueue:](NSURLSession, "sessionWithConfiguration:delegate:delegateQueue:", configuration, 0, 0);
}

void __42__NSURLSession_finalizeDelegateWithError___block_invoke(uint64_t a1)
{

}

uint64_t __49__NSURLSession_getAllTasksWithCompletionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_getTasksWithCompletionHandler:", *(_QWORD *)(a1 + 40));
}

- (void)getAllTasksWithCompletionHandler:(void *)completionHandler
{
  NSObject *workQueue;
  _QWORD v4[6];

  if (self)
    workQueue = self->_workQueue;
  else
    workQueue = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __49__NSURLSession_getAllTasksWithCompletionHandler___block_invoke;
  v4[3] = &unk_1E14FDF00;
  v4[4] = self;
  v4[5] = completionHandler;
  dispatch_async(workQueue, v4);
}

uint64_t __87__NSURLSession__sessionWithConfiguration_delegate_delegateQueue_delegateDispatchQueue___block_invoke()
{
  uint64_t result;

  result = objc_opt_new();
  gBackgroundSessions = result;
  return result;
}

- (NSOperationQueue)delegateQueue
{
  os_unfair_lock_s *p_lock;
  NSOperationQueue *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_delegateQueue_ivar)
  {
    v4 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    self->_delegateQueue_ivar = v4;
    -[NSOperationQueue setMaxConcurrentOperationCount:](v4, "setMaxConcurrentOperationCount:", 1);
    -[NSOperationQueue setUnderlyingQueue:](self->_delegateQueue_ivar, "setUnderlyingQueue:", self->_delegateDispatchQueue);
  }
  os_unfair_lock_unlock(p_lock);
  return self->_delegateQueue_ivar;
}

- (void).cxx_destruct
{
  std::shared_ptr<HTTPResponseMessage>::~shared_ptr[abi:nn180100]((uint64_t)&self->_nwContext);
}

uint64_t __40__NSURLSession_finishTasksAndInvalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_completeInvalidation:", 0);
}

- (void)getTasksWithCompletionHandler:(void *)completionHandler
{
  NSObject *workQueue;
  _QWORD v4[6];

  if (self)
    workQueue = self->_workQueue;
  else
    workQueue = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __46__NSURLSession_getTasksWithCompletionHandler___block_invoke;
  v4[3] = &unk_1E14FDF00;
  v4[4] = self;
  v4[5] = completionHandler;
  dispatch_async(workQueue, v4);
}

- (void)finishTasksAndInvalidate
{
  _BOOL4 invalid_ivar;
  NSObject *workQueue;
  _QWORD block[5];

  if (self->_isSharedSession_ivar)
  {
    NSLog(CFSTR("[NSURLSession sharedSession] may not be invalidated"), a2);
  }
  else
  {
    objc_sync_enter(self);
    invalid_ivar = self->_invalid_ivar;
    self->_invalid_ivar = 1;
    objc_sync_exit(self);
    if (!invalid_ivar)
    {
      workQueue = self->_workQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __40__NSURLSession_finishTasksAndInvalidate__block_invoke;
      block[3] = &unk_1E14FE118;
      block[4] = self;
      dispatch_async(workQueue, block);
    }
  }
}

+ (NSURLSession)sharedSession
{
  return (NSURLSession *)+[NSURLSession _sharedSession]();
}

uint64_t __30__NSURLSession__sharedSession__block_invoke()
{
  uint64_t result;

  +[NSURLSession _sharedSession]::sSharedSession = +[NSURLSession _sessionWithConfiguration:delegate:delegateQueue:delegateDispatchQueue:]((uint64_t)NSURLSession, (NSURLSessionConfiguration *)+[NSURLSessionConfiguration sessionConfigurationForSharedSession](NSURLSessionConfiguration, "sessionConfigurationForSharedSession"), 0, 0, 0);
  objc_getClass("NWURLSession");
  result = objc_opt_isKindOfClass();
  if ((result & 1) == 0)
  {
    if (+[NSURLSession _sharedSession]::sSharedSession)
      *(_BYTE *)(+[NSURLSession _sharedSession]::sSharedSession + 68) = 1;
  }
  return result;
}

- (NSURLSessionUploadTask)uploadTaskWithRequest:(NSURLRequest *)request fromData:(NSData *)bodyData
{
  _QWORD *v7;
  const char *v8;
  void *v9;
  SEL v10;

  v7 = -[__NSCFTaskForClass initWithGroup:]([__NSCFTaskForClass alloc], -[NSURLSession defaultTaskGroup](self, "defaultTaskGroup"));
  v9 = v7;
  if (v7)
  {
    objc_setProperty_atomic(v7, v8, request, 16);
    objc_setProperty_atomic(v9, v10, bodyData, 40);
  }
  return (NSURLSessionUploadTask *)-[NSURLSession _uploadTaskWithTaskForClass:](self, "_uploadTaskWithTaskForClass:", v9);
}

- (void)setSessionDescription:(NSString *)sessionDescription
{
  objc_setProperty_atomic_copy(self, a2, sessionDescription, 104);
}

- (id)_downloadTaskWithRequest:(id)a3 downloadFilePath:(id)a4
{
  _QWORD *v7;
  const char *v8;
  void *v9;
  SEL v10;

  v7 = -[__NSCFTaskForClass initWithGroup:]([__NSCFTaskForClass alloc], -[NSURLSession defaultTaskGroup](self, "defaultTaskGroup"));
  v9 = v7;
  if (v7)
  {
    objc_setProperty_atomic(v7, v8, a3, 16);
    objc_setProperty_atomic(v9, v10, a4, 56);
  }
  return -[NSURLSession _downloadTaskWithTaskForClass:](self, "_downloadTaskWithTaskForClass:", v9);
}

+ (void)_getActiveSessionIdentifiersWithCompletionHandler:(id)a3
{
  void *v4;
  _QWORD v5[6];
  _QWORD v6[6];

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.nsurlsessiond"), 0);
  objc_msgSend(v4, "setRemoteObjectInterface:", +[__NSCFURLSessionXPC bgSessionManagerInterface](__NSCFURLSessionXPC, "bgSessionManagerInterface"));
  objc_msgSend(v4, "resume");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __66__NSURLSession__getActiveSessionIdentifiersWithCompletionHandler___block_invoke;
  v6[3] = &unk_1E14FBDD0;
  v6[4] = v4;
  v6[5] = a3;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __66__NSURLSession__getActiveSessionIdentifiersWithCompletionHandler___block_invoke_40;
  v5[3] = &unk_1E14FBDA8;
  v5[4] = v4;
  v5[5] = a3;
  objc_msgSend((id)objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", v6), "getActiveSessionIdentifiersWithReply:", v5);
}

+ (void)_disableAppSSO
{
  AppSSO::AppSSODisabled = 1;
}

- (NSURLSession)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NSURLSession;
  return -[NSURLSession init](&v3, sel_init);
}

- (OS_nw_context)_networkContext
{
  return self->_nwContext.__ptr_;
}

- (void)resetWithCompletionHandler:(void *)completionHandler
{
  NSObject *workQueue;
  _QWORD v4[6];

  if (self)
    workQueue = self->_workQueue;
  else
    workQueue = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __43__NSURLSession_resetWithCompletionHandler___block_invoke;
  v4[3] = &unk_1E14FDF00;
  v4[4] = self;
  v4[5] = completionHandler;
  dispatch_async(workQueue, v4);
}

- (void)flushWithCompletionHandler:(void *)completionHandler
{
  NSObject *workQueue;
  _QWORD v4[6];

  if (self)
    workQueue = self->_workQueue;
  else
    workQueue = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __43__NSURLSession_flushWithCompletionHandler___block_invoke;
  v4[3] = &unk_1E14FDF00;
  v4[4] = self;
  v4[5] = completionHandler;
  dispatch_async(workQueue, v4);
}

- (id)_dataTaskWithTaskForClass:(id)a3
{
  abort();
}

- (id)dataTaskWithRequest:(id)a3 uniqueIdentifier:(id)a4
{
  _QWORD *v7;
  const char *v8;
  void *v9;
  SEL v10;

  v7 = -[__NSCFTaskForClass initWithGroup:]([__NSCFTaskForClass alloc], -[NSURLSession defaultTaskGroup](self, "defaultTaskGroup"));
  v9 = v7;
  if (v7)
  {
    objc_setProperty_atomic(v7, v8, a3, 16);
    objc_setProperty_atomic(v9, v10, a4, 24);
  }
  return -[NSURLSession _dataTaskWithTaskForClass:](self, "_dataTaskWithTaskForClass:", v9);
}

- (id)_dataTaskWithRequest:(id)a3 delegate:(id)a4
{
  _QWORD *v7;
  const char *v8;
  void *v9;
  SEL v10;

  v7 = -[__NSCFTaskForClass initWithGroup:]([__NSCFTaskForClass alloc], -[NSURLSession defaultTaskGroup](self, "defaultTaskGroup"));
  v9 = v7;
  if (v7)
  {
    objc_setProperty_atomic(v7, v8, a3, 16);
    objc_setProperty_atomic(v9, v10, a4, 80);
  }
  return -[NSURLSession _dataTaskWithTaskForClass:](self, "_dataTaskWithTaskForClass:", v9);
}

- (id)_dataTaskWithURL:(id)a3 delegate:(id)a4
{
  _QWORD *v7;
  NSURLRequest *v8;
  const char *v9;
  SEL v10;

  v7 = -[__NSCFTaskForClass initWithGroup:]([__NSCFTaskForClass alloc], -[NSURLSession defaultTaskGroup](self, "defaultTaskGroup"));
  v8 = +[NSURLRequest requestWithURL:](NSURLRequest, "requestWithURL:", a3);
  if (v7)
  {
    objc_setProperty_atomic(v7, v9, v8, 16);
    objc_setProperty_atomic(v7, v10, a4, 80);
  }
  return -[NSURLSession _dataTaskWithTaskForClass:](self, "_dataTaskWithTaskForClass:", v7);
}

- (id)_dataTaskWithURL:(id)a3 delegate:(id)a4 completionHandler:(id)a5
{
  _QWORD *v9;
  NSURLRequest *v10;
  const char *v11;
  SEL v12;
  SEL v13;

  v9 = -[__NSCFTaskForClass initWithGroup:]([__NSCFTaskForClass alloc], -[NSURLSession defaultTaskGroup](self, "defaultTaskGroup"));
  v10 = +[NSURLRequest requestWithURL:](NSURLRequest, "requestWithURL:", a3);
  if (v9)
  {
    objc_setProperty_atomic(v9, v11, v10, 16);
    objc_setProperty_atomic_copy(v9, v12, a5, 48);
    objc_setProperty_atomic(v9, v13, a4, 80);
  }
  return -[NSURLSession _dataTaskWithTaskForClass:](self, "_dataTaskWithTaskForClass:", v9);
}

- (NSURLSessionWebSocketTask)webSocketTaskWithURL:(NSURL *)url
{
  return (NSURLSessionWebSocketTask *)-[NSURLSession webSocketTaskForURL:protocols:](self, "webSocketTaskForURL:protocols:", url, 0);
}

- (NSURLSessionWebSocketTask)webSocketTaskWithRequest:(NSURLRequest *)request
{
  return (NSURLSessionWebSocketTask *)-[NSURLSession webSocketTaskForRequest:](self, "webSocketTaskForRequest:", (id)-[NSURLRequest mutableCopy](request, "mutableCopy"));
}

- (id)_uploadTaskWithTaskForClass:(id)a3
{
  abort();
}

- (NSURLSessionUploadTask)uploadTaskWithStreamedRequest:(NSURLRequest *)request
{
  _QWORD *v5;
  const char *v6;
  void *v7;

  v5 = -[__NSCFTaskForClass initWithGroup:]([__NSCFTaskForClass alloc], -[NSURLSession defaultTaskGroup](self, "defaultTaskGroup"));
  v7 = v5;
  if (v5)
    objc_setProperty_atomic(v5, v6, request, 16);
  return (NSURLSessionUploadTask *)-[NSURLSession _uploadTaskWithTaskForClass:](self, "_uploadTaskWithTaskForClass:", v7);
}

- (NSURLSessionUploadTask)uploadTaskWithResumeData:(NSData *)resumeData
{
  _QWORD *v5;
  const char *v6;
  void *v7;

  v5 = -[__NSCFTaskForClass initWithGroup:]([__NSCFTaskForClass alloc], -[NSURLSession defaultTaskGroup](self, "defaultTaskGroup"));
  v7 = v5;
  if (v5)
    objc_setProperty_atomic(v5, v6, resumeData, 64);
  return (NSURLSessionUploadTask *)-[NSURLSession _uploadTaskWithTaskForClass:](self, "_uploadTaskWithTaskForClass:", v7);
}

- (NSURLSessionUploadTask)uploadTaskWithRequest:(NSURLRequest *)request fromFile:(NSURL *)fileURL completionHandler:(void *)completionHandler
{
  _QWORD *v9;
  const char *v10;
  void *v11;
  SEL v12;
  SEL v13;

  v9 = -[__NSCFTaskForClass initWithGroup:]([__NSCFTaskForClass alloc], -[NSURLSession defaultTaskGroup](self, "defaultTaskGroup"));
  v11 = v9;
  if (v9)
  {
    objc_setProperty_atomic(v9, v10, request, 16);
    objc_setProperty_atomic(v11, v12, fileURL, 32);
    objc_setProperty_atomic_copy(v11, v13, completionHandler, 48);
  }
  return (NSURLSessionUploadTask *)-[NSURLSession _uploadTaskWithTaskForClass:](self, "_uploadTaskWithTaskForClass:", v11);
}

- (NSURLSessionUploadTask)uploadTaskWithResumeData:(NSData *)resumeData completionHandler:(void *)completionHandler
{
  _QWORD *v7;
  const char *v8;
  void *v9;
  SEL v10;

  v7 = -[__NSCFTaskForClass initWithGroup:]([__NSCFTaskForClass alloc], -[NSURLSession defaultTaskGroup](self, "defaultTaskGroup"));
  v9 = v7;
  if (v7)
  {
    objc_setProperty_atomic(v7, v8, resumeData, 64);
    objc_setProperty_atomic_copy(v9, v10, completionHandler, 48);
  }
  return (NSURLSessionUploadTask *)-[NSURLSession _uploadTaskWithTaskForClass:](self, "_uploadTaskWithTaskForClass:", v9);
}

- (id)_uploadTaskWithRequest:(id)a3 fromFile:(id)a4 delegate:(id)a5 completionHandler:(id)a6
{
  _QWORD *v11;
  const char *v12;
  void *v13;
  SEL v14;
  SEL v15;
  SEL v16;

  v11 = -[__NSCFTaskForClass initWithGroup:]([__NSCFTaskForClass alloc], -[NSURLSession defaultTaskGroup](self, "defaultTaskGroup"));
  v13 = v11;
  if (v11)
  {
    objc_setProperty_atomic(v11, v12, a3, 16);
    objc_setProperty_atomic(v13, v14, a4, 32);
    objc_setProperty_atomic_copy(v13, v15, a6, 48);
    objc_setProperty_atomic(v13, v16, a5, 80);
  }
  return -[NSURLSession _uploadTaskWithTaskForClass:](self, "_uploadTaskWithTaskForClass:", v13);
}

- (id)_uploadTaskWithRequest:(id)a3 fromData:(id)a4 delegate:(id)a5 completionHandler:(id)a6
{
  _QWORD *v11;
  const char *v12;
  void *v13;
  SEL v14;
  SEL v15;
  SEL v16;

  v11 = -[__NSCFTaskForClass initWithGroup:]([__NSCFTaskForClass alloc], -[NSURLSession defaultTaskGroup](self, "defaultTaskGroup"));
  v13 = v11;
  if (v11)
  {
    objc_setProperty_atomic(v11, v12, a3, 16);
    objc_setProperty_atomic(v13, v14, a4, 40);
    objc_setProperty_atomic_copy(v13, v15, a6, 48);
    objc_setProperty_atomic(v13, v16, a5, 80);
  }
  return -[NSURLSession _uploadTaskWithTaskForClass:](self, "_uploadTaskWithTaskForClass:", v13);
}

- (id)_uploadTaskWithResumeData:(id)a3 delegate:(id)a4 completionHandler:(id)a5
{
  _QWORD *v9;
  const char *v10;
  void *v11;
  SEL v12;
  SEL v13;

  v9 = -[__NSCFTaskForClass initWithGroup:]([__NSCFTaskForClass alloc], -[NSURLSession defaultTaskGroup](self, "defaultTaskGroup"));
  v11 = v9;
  if (v9)
  {
    objc_setProperty_atomic(v9, v10, a3, 64);
    objc_setProperty_atomic_copy(v11, v12, a5, 48);
    objc_setProperty_atomic(v11, v13, a4, 80);
  }
  return -[NSURLSession _uploadTaskWithTaskForClass:](self, "_uploadTaskWithTaskForClass:", v11);
}

- (id)_downloadTaskWithTaskForClass:(id)a3
{
  abort();
}

- (NSURLSessionDownloadTask)downloadTaskWithURL:(NSURL *)url
{
  _QWORD *v5;
  NSURLRequest *v6;
  const char *v7;

  v5 = -[__NSCFTaskForClass initWithGroup:]([__NSCFTaskForClass alloc], -[NSURLSession defaultTaskGroup](self, "defaultTaskGroup"));
  v6 = +[NSURLRequest requestWithURL:](NSURLRequest, "requestWithURL:", url);
  if (v5)
    objc_setProperty_atomic(v5, v7, v6, 16);
  return (NSURLSessionDownloadTask *)-[NSURLSession _downloadTaskWithTaskForClass:](self, "_downloadTaskWithTaskForClass:", v5);
}

- (NSURLSessionDownloadTask)downloadTaskWithResumeData:(NSData *)resumeData
{
  _QWORD *v5;
  const char *v6;
  void *v7;

  v5 = -[__NSCFTaskForClass initWithGroup:]([__NSCFTaskForClass alloc], -[NSURLSession defaultTaskGroup](self, "defaultTaskGroup"));
  v7 = v5;
  if (v5)
    objc_setProperty_atomic(v5, v6, resumeData, 64);
  return (NSURLSessionDownloadTask *)-[NSURLSession _downloadTaskWithTaskForClass:](self, "_downloadTaskWithTaskForClass:", v7);
}

- (NSURLSessionDownloadTask)downloadTaskWithRequest:(NSURLRequest *)request completionHandler:(void *)completionHandler
{
  _QWORD *v7;
  const char *v8;
  void *v9;
  SEL v10;

  v7 = -[__NSCFTaskForClass initWithGroup:]([__NSCFTaskForClass alloc], -[NSURLSession defaultTaskGroup](self, "defaultTaskGroup"));
  v9 = v7;
  if (v7)
  {
    objc_setProperty_atomic(v7, v8, request, 16);
    objc_setProperty_atomic_copy(v9, v10, completionHandler, 72);
  }
  return (NSURLSessionDownloadTask *)-[NSURLSession _downloadTaskWithTaskForClass:](self, "_downloadTaskWithTaskForClass:", v9);
}

- (NSURLSessionDownloadTask)downloadTaskWithURL:(NSURL *)url completionHandler:(void *)completionHandler
{
  _QWORD *v7;
  NSURLRequest *v8;
  const char *v9;
  SEL v10;

  v7 = -[__NSCFTaskForClass initWithGroup:]([__NSCFTaskForClass alloc], -[NSURLSession defaultTaskGroup](self, "defaultTaskGroup"));
  v8 = +[NSURLRequest requestWithURL:](NSURLRequest, "requestWithURL:", url);
  if (v7)
  {
    objc_setProperty_atomic(v7, v9, v8, 16);
    objc_setProperty_atomic_copy(v7, v10, completionHandler, 72);
  }
  return (NSURLSessionDownloadTask *)-[NSURLSession _downloadTaskWithTaskForClass:](self, "_downloadTaskWithTaskForClass:", v7);
}

- (NSURLSessionDownloadTask)downloadTaskWithResumeData:(NSData *)resumeData completionHandler:(void *)completionHandler
{
  _QWORD *v7;
  const char *v8;
  void *v9;
  SEL v10;

  v7 = -[__NSCFTaskForClass initWithGroup:]([__NSCFTaskForClass alloc], -[NSURLSession defaultTaskGroup](self, "defaultTaskGroup"));
  v9 = v7;
  if (v7)
  {
    objc_setProperty_atomic(v7, v8, resumeData, 64);
    objc_setProperty_atomic_copy(v9, v10, completionHandler, 72);
  }
  return (NSURLSessionDownloadTask *)-[NSURLSession _downloadTaskWithTaskForClass:](self, "_downloadTaskWithTaskForClass:", v9);
}

- (id)_downloadTaskWithRequest:(id)a3 delegate:(id)a4 completionHandler:(id)a5
{
  _QWORD *v9;
  const char *v10;
  void *v11;
  SEL v12;
  SEL v13;

  v9 = -[__NSCFTaskForClass initWithGroup:]([__NSCFTaskForClass alloc], -[NSURLSession defaultTaskGroup](self, "defaultTaskGroup"));
  v11 = v9;
  if (v9)
  {
    objc_setProperty_atomic(v9, v10, a3, 16);
    objc_setProperty_atomic_copy(v11, v12, a5, 72);
    objc_setProperty_atomic(v11, v13, a4, 80);
  }
  return -[NSURLSession _downloadTaskWithTaskForClass:](self, "_downloadTaskWithTaskForClass:", v11);
}

- (id)_downloadTaskWithURL:(id)a3 delegate:(id)a4 completionHandler:(id)a5
{
  _QWORD *v9;
  NSURLRequest *v10;
  const char *v11;
  SEL v12;
  SEL v13;

  v9 = -[__NSCFTaskForClass initWithGroup:]([__NSCFTaskForClass alloc], -[NSURLSession defaultTaskGroup](self, "defaultTaskGroup"));
  v10 = +[NSURLRequest requestWithURL:](NSURLRequest, "requestWithURL:", a3);
  if (v9)
  {
    objc_setProperty_atomic(v9, v11, v10, 16);
    objc_setProperty_atomic_copy(v9, v12, a5, 72);
    objc_setProperty_atomic(v9, v13, a4, 80);
  }
  return -[NSURLSession _downloadTaskWithTaskForClass:](self, "_downloadTaskWithTaskForClass:", v9);
}

- (id)_downloadTaskWithResumeData:(id)a3 delegate:(id)a4 completionHandler:(id)a5
{
  _QWORD *v9;
  const char *v10;
  void *v11;
  SEL v12;
  SEL v13;

  v9 = -[__NSCFTaskForClass initWithGroup:]([__NSCFTaskForClass alloc], -[NSURLSession defaultTaskGroup](self, "defaultTaskGroup"));
  v11 = v9;
  if (v9)
  {
    objc_setProperty_atomic(v9, v10, a3, 64);
    objc_setProperty_atomic_copy(v11, v12, a5, 72);
    objc_setProperty_atomic(v11, v13, a4, 80);
  }
  return -[NSURLSession _downloadTaskWithTaskForClass:](self, "_downloadTaskWithTaskForClass:", v11);
}

- (id)assetDownloadTaskWithURLAsset:(id)a3 assetTitle:(id)a4 assetArtworkData:(id)a5 options:(id)a6
{
  return (id)-[NSURLSession AVAssetDownloadTaskForURLAsset:assetTitle:assetArtworkData:options:downloadConfiguration:](self, "AVAssetDownloadTaskForURLAsset:assetTitle:assetArtworkData:options:downloadConfiguration:", a3, a4, a5, a6, 0);
}

- (id)assetDownloadTaskWithConfiguration:(id)a3
{
  return (id)-[NSURLSession AVAssetDownloadTaskForURLAsset:assetTitle:assetArtworkData:options:downloadConfiguration:](self, "AVAssetDownloadTaskForURLAsset:assetTitle:assetArtworkData:options:downloadConfiguration:", objc_msgSend(a3, "_asset"), objc_msgSend(a3, "_assetTitle"), objc_msgSend(a3, "artworkData"), 0, a3);
}

- (NSURLSessionStreamTask)streamTaskWithHostName:(NSString *)hostname port:(NSInteger)port
{
  __NSCFTCPIOStreamTask *v7;
  id v8;
  __NSCFTCPIOStreamTask *v9;
  uint64_t internalDelegateWrapper;
  _QWORD v12[5];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("Stream tasks are not supported in background sessions"), 0));
  v7 = [__NSCFTCPIOStreamTask alloc];
  v8 = -[NSURLSession defaultTaskGroup](self, "defaultTaskGroup");
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __44__NSURLSession_streamTaskWithHostName_port___block_invoke;
  v12[3] = &unk_1E14FBF50;
  v12[4] = self;
  v9 = -[__NSCFTCPIOStreamTask initWithHost:port:taskGroup:disavow:](v7, "initWithHost:port:taskGroup:disavow:", hostname, port, v8, v12);
  -[__NSURLSessionLocal addUnresumedTask:]((uint64_t)self, (uint64_t)v9);
  if (v9)
  {
    internalDelegateWrapper = (uint64_t)v9->super._internalDelegateWrapper;
    if (!internalDelegateWrapper)
      internalDelegateWrapper = (uint64_t)v9->super._publicDelegateWrapper;
  }
  else
  {
    internalDelegateWrapper = 0;
  }
  -[__NSCFURLSessionDelegateWrapper didCreateTask:](internalDelegateWrapper, v9);
  return (NSURLSessionStreamTask *)v9;
}

- (NSURLSessionStreamTask)streamTaskWithNetService:(NSNetService *)service
{
  __NSCFURLLocalStreamTask *v5;
  id v6;
  __NSCFURLLocalStreamTask *v7;
  uint64_t internalDelegateWrapper;
  _QWORD v10[5];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("Stream tasks are not supported in background sessions"), 0));
  v5 = [__NSCFURLLocalStreamTask alloc];
  v6 = -[NSURLSession defaultTaskGroup](self, "defaultTaskGroup");
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __41__NSURLSession_streamTaskWithNetService___block_invoke;
  v10[3] = &unk_1E14FBF50;
  v10[4] = self;
  v7 = -[__NSCFURLLocalStreamTask initWithNetService:taskGroup:disavow:](v5, "initWithNetService:taskGroup:disavow:", service, v6, v10);
  -[__NSURLSessionLocal addUnresumedTask:]((uint64_t)self, (uint64_t)v7);
  if (v7)
  {
    internalDelegateWrapper = (uint64_t)v7->super.super._internalDelegateWrapper;
    if (!internalDelegateWrapper)
      internalDelegateWrapper = (uint64_t)v7->super.super._publicDelegateWrapper;
  }
  else
  {
    internalDelegateWrapper = 0;
  }
  -[__NSCFURLSessionDelegateWrapper didCreateTask:](internalDelegateWrapper, v7);
  return (NSURLSessionStreamTask *)v7;
}

- (id)taskGroupWithConfiguration:(id)a3
{
  __NSCFURLSessionTaskGroup *v5;
  NSURLSession *v6;
  objc_super v8;

  v5 = [__NSCFURLSessionTaskGroup alloc];
  if (!v5)
    return 0;
  v8.receiver = v5;
  v8.super_class = (Class)__NSCFURLSessionTaskGroup;
  v6 = -[NSURLSession init](&v8, sel_init);
  if (v6)
  {
    v6->_nwContext.__ptr_ = (OS_nw_context *)self;
    v6->_nwContextManager = (__CFN_ConnectionContextManager *)objc_msgSend(a3, "copyImmutableVariant:", 0);
  }
  return v6;
}

void __41__NSURLSession_streamTaskWithNetService___block_invoke(uint64_t a1, uint64_t a2)
{
  -[__NSURLSessionLocal removeConnectionlessTask:](*(_QWORD *)(a1 + 32), a2);
}

void __44__NSURLSession_streamTaskWithHostName_port___block_invoke(uint64_t a1, uint64_t a2)
{
  -[__NSURLSessionLocal removeConnectionlessTask:](*(_QWORD *)(a1 + 32), a2);
}

uint64_t __46__NSURLSession_getTasksWithCompletionHandler___block_invoke_3(id *a1, uint64_t a2)
{
  id *v4;
  uint64_t result;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = a1 + 4;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v4 = a1 + 5;
    }
    else
    {
      objc_opt_class();
      result = objc_opt_isKindOfClass();
      if ((result & 1) == 0)
        return result;
      v4 = a1 + 6;
    }
  }
  return objc_msgSend(*v4, "addObject:", a2);
}

uint64_t __43__NSURLSession_flushWithCompletionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_flushWithCompletionHandler:", *(_QWORD *)(a1 + 40));
}

uint64_t __43__NSURLSession_resetWithCompletionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_resetStorageWithCompletionHandler:", *(_QWORD *)(a1 + 40));
}

+ (BOOL)_backgroundServiceAvailable
{
  if (+[NSURLSession _backgroundServiceAvailable]::onceToken != -1)
    dispatch_once(&+[NSURLSession _backgroundServiceAvailable]::onceToken, &__block_literal_global_12693);
  return +[NSURLSession _backgroundServiceAvailable]::available;
}

+ (void)_sendPendingCallbacksForSessionIdentifier:(id)a3
{
  void *v4;
  void *v5;
  _QWORD v6[5];

  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:", CFSTR("NSURLSessionAppWasResumedForBackgroundSessionNotification"), 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.nsurlsessiond"), 0);
  objc_msgSend(v4, "setRemoteObjectInterface:", +[__NSCFURLSessionXPC bgSessionManagerInterface](__NSCFURLSessionXPC, "bgSessionManagerInterface"));
  objc_msgSend(v4, "resume");
  v5 = (void *)objc_msgSend(v4, "remoteObjectProxy");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __58__NSURLSession__sendPendingCallbacksForSessionIdentifier___block_invoke;
  v6[3] = &unk_1E14FE118;
  v6[4] = v4;
  objc_msgSend(v5, "okayToSendPendingCallbacksForIdentifier:reply:", a3, v6);
}

+ (void)_releaseProcessAssertionForSessionIdentifier:(id)a3
{
  void *v4;
  void *v5;
  _QWORD v6[5];

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.nsurlsessiond"), 0);
  objc_msgSend(v4, "setRemoteObjectInterface:", +[__NSCFURLSessionXPC bgSessionManagerInterface](__NSCFURLSessionXPC, "bgSessionManagerInterface"));
  objc_msgSend(v4, "resume");
  v5 = (void *)objc_msgSend(v4, "remoteObjectProxy");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __61__NSURLSession__releaseProcessAssertionForSessionIdentifier___block_invoke;
  v6[3] = &unk_1E14FE118;
  v6[4] = v4;
  objc_msgSend(v5, "releaseAssertionForSession:reply:", a3, v6);
}

+ (void)_obliterateAllBackgroundSessionsWithCompletionHandler:(id)a3
{
  void *v4;
  _QWORD v5[6];
  _QWORD v6[6];

  if (+[NSURLSession _backgroundServiceAvailable](NSURLSession, "_backgroundServiceAvailable"))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.nsurlsessiond"), 0);
    objc_msgSend(v4, "setRemoteObjectInterface:", +[__NSCFURLSessionXPC bgSessionManagerInterface](__NSCFURLSessionXPC, "bgSessionManagerInterface"));
    objc_msgSend(v4, "resume");
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __70__NSURLSession__obliterateAllBackgroundSessionsWithCompletionHandler___block_invoke;
    v6[3] = &unk_1E14FBDD0;
    v6[4] = v4;
    v6[5] = a3;
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __70__NSURLSession__obliterateAllBackgroundSessionsWithCompletionHandler___block_invoke_42;
    v5[3] = &unk_1E14FDF00;
    v5[4] = v4;
    v5[5] = a3;
    objc_msgSend((id)objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", v6), "obliterateAllSessionsWithReply:", v5);
  }
  else
  {
    (*((void (**)(id))a3 + 2))(a3);
  }
}

+ (void)_strictTrustEvaluate:(id)a3 queue:(id)a4 completionHandler:(id)a5
{
  void *v8;
  const void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  _QWORD *v16;
  CFTypeRef v17;
  __int128 *p_buf;
  uint64_t v19;
  std::__shared_weak_count *v20;
  unint64_t *p_shared_owners;
  unint64_t v22;
  _QWORD v23[7];
  _QWORD v24[6];
  __int128 buf;
  uint64_t v26;
  __n128 (*v27)(__n128 *, __n128 *);
  uint64_t (*v28)(uint64_t);
  void *v29;
  char *v30;
  std::__shared_weak_count *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v8 = (void *)objc_msgSend(a3, "protectionSpace");
  v9 = (const void *)objc_msgSend((id)objc_msgSend(a3, "protectionSpace"), "serverTrust");
  if (CFNLog::onceToken != -1)
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
  v10 = CFNLog::logger;
  if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = v9;
    _os_log_impl(&dword_183ECA000, v10, OS_LOG_TYPE_INFO, "strict trust evaluate %p", (uint8_t *)&buf, 0xCu);
  }
  v11 = objc_msgSend(v8, "_CFURLProtectionSpace");
  v12 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __61__NSURLSession__strictTrustEvaluate_queue_completionHandler___block_invoke;
  v23[3] = &unk_1E14FBDF8;
  v23[5] = a5;
  v23[6] = v9;
  v23[4] = a3;
  if (URLProtectionSpace::Class(void)::sOnce_URLProtectionSpace != -1)
    dispatch_once(&URLProtectionSpace::Class(void)::sOnce_URLProtectionSpace, &__block_literal_global_8641);
  v13 = v11 + 16;
  if (!v11)
    v13 = 0;
  v14 = *(_DWORD *)(v13 + 88);
  v15 = *(_QWORD *)(v13 + 96);
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v26 = 0x4012000000;
  v27 = __Block_byref_object_copy__131;
  v28 = __Block_byref_object_dispose__132;
  v29 = &unk_18422E08D;
  v16 = operator new(0x48uLL);
  v16[1] = 0;
  v16[2] = 0;
  *v16 = &off_1E14F0948;
  v16[3] = &off_1E14E6B30;
  *((_WORD *)v16 + 28) = 0;
  if (v9)
  {
    v17 = CFRetain(v9);
    p_buf = (__int128 *)*((_QWORD *)&buf + 1);
  }
  else
  {
    v17 = 0;
    p_buf = &buf;
  }
  v16[5] = 0;
  v16[6] = 0;
  v16[4] = v17;
  v30 = (char *)(v16 + 3);
  v31 = (std::__shared_weak_count *)v16;
  v19 = *((_QWORD *)p_buf + 6);
  v24[0] = v12;
  v24[1] = 3221225472;
  v24[2] = __performStrictTrustEvaluationAsync_block_invoke;
  v24[3] = &unk_1E14FBFC0;
  v24[4] = v23;
  v24[5] = &buf;
  CFNetworkTrust::strictEvaluateAsync(v19, v15, v14 & 1, (uint64_t)a4, (uint64_t)v24);
  _Block_object_dispose(&buf, 8);
  v20 = v31;
  if (v31)
  {
    p_shared_owners = (unint64_t *)&v31->__shared_owners_;
    do
      v22 = __ldaxr(p_shared_owners);
    while (__stlxr(v22 - 1, p_shared_owners));
    if (!v22)
    {
      ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
      std::__shared_weak_count::__release_weak(v20);
    }
  }
}

+ (void)_disableATS
{
  const __CFAllocator *v2;
  __CFDictionary *Mutable;
  CFDataRef Data;
  CFDataRef v5;

  v2 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 1, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  CFDictionarySetValue(Mutable, CFSTR("NSAllowsArbitraryLoads"), (const void *)*MEMORY[0x1E0C9AE50]);
  Data = CFPropertyListCreateData(v2, Mutable, kCFPropertyListBinaryFormat_v1_0, 0, 0);
  v5 = Data;
  if (Data)
  {
    _CFNetworkSetATSContext(Data);
    CFRelease(v5);
  }
  if (Mutable)
    CFRelease(Mutable);
}

+ (void)_enumerateHTTPHeaderFieldsWithCFHTTPMessage:(__CFHTTPMessage *)a3 usingBlock:(id)a4
{
  char *v6;

  if (HTTPMessage::Class(void)::sOnce_HTTPMessage != -1)
    dispatch_once(&HTTPMessage::Class(void)::sOnce_HTTPMessage, &__block_literal_global_5133);
  if (a3)
    v6 = (char *)a3 + 16;
  else
    v6 = 0;
  (*(void (**)(char *, id))(*(_QWORD *)v6 + 56))(v6, a4);
}

+ (void)_enumerateHTTPHeaderFieldsWithRequest:(id)a3 usingBlock:(id)a4
{
  uint64_t v5;

  v5 = *(_QWORD *)(objc_msgSend(a3, "_inner") + 56);
  if (v5)
    (*(void (**)(uint64_t, id))(*(_QWORD *)v5 + 56))(v5, a4);
}

uint64_t __52__NSURLSession_handleSystemHasPoweredOnNotification__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_markConnectionsReusedAfterAPSleepWake");
}

void __87__NSURLSession__sessionWithConfiguration_delegate_delegateQueue_delegateDispatchQueue___block_invoke_50()
{
  __CFBundle *MainBundle;
  SecTaskRef v1;
  double v2;
  SecTaskRef v3;
  uint64_t v4;
  const char *v5;
  NSObject *v6;
  uint32_t v7;
  uint64_t v8;
  uint8_t buf[4];
  const __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  MainBundle = CFBundleGetMainBundle();
  if (CFBundleGetIdentifier(MainBundle))
  {
    v1 = SecTaskCreateFromSelf((CFAllocatorRef)*MEMORY[0x1E0C9AE00]);
    if (v1)
    {
      v3 = v1;
      CPCopyBundleIdentifierAndTeamFromSecTaskRef_delayInitStub(v2);
      CFRelease(v3);
    }
    if (__CFNAPIMisuseFaultLogHandle::onceToken != -1)
      dispatch_once(&__CFNAPIMisuseFaultLogHandle::onceToken, &__block_literal_global_7_4765);
    v4 = __CFNAPIMisuseFaultLogHandle::logger;
    if (os_log_type_enabled((os_log_t)__CFNAPIMisuseFaultLogHandle::logger, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138543362;
      v10 = CFSTR("application-identifier");
      v5 = "Background URLSession adopters are required to have %{public}@ entitlement.";
      v6 = v4;
      v7 = 12;
LABEL_13:
      _os_log_fault_impl(&dword_183ECA000, v6, OS_LOG_TYPE_FAULT, v5, buf, v7);
    }
  }
  else
  {
    if (__CFNAPIMisuseFaultLogHandle::onceToken != -1)
      dispatch_once(&__CFNAPIMisuseFaultLogHandle::onceToken, &__block_literal_global_7_4765);
    v8 = __CFNAPIMisuseFaultLogHandle::logger;
    if (os_log_type_enabled((os_log_t)__CFNAPIMisuseFaultLogHandle::logger, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      v5 = "Background URLSession adopters are required to have a bundle identifier. If you are developing a daemon, plea"
           "se enable CREATE_INFOPLIST_SECTION_IN_BINARY build setting.";
      v6 = v8;
      v7 = 2;
      goto LABEL_13;
    }
  }
}

uint64_t __61__NSURLSession__strictTrustEvaluate_queue_completionHandler___block_invoke(uint64_t a1, int a2)
{
  NSObject *v4;
  uint64_t v5;
  int v7;
  uint64_t v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (CFNLog::onceToken != -1)
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
  v4 = CFNLog::logger;
  if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_INFO))
  {
    v5 = *(_QWORD *)(a1 + 48);
    v7 = 134218240;
    v8 = v5;
    v9 = 1024;
    v10 = a2;
    _os_log_impl(&dword_183ECA000, v4, OS_LOG_TYPE_INFO, "strict trust evaluate %p complete %d", (uint8_t *)&v7, 0x12u);
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __70__NSURLSession__obliterateAllBackgroundSessionsWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (CFNLog::onceToken != -1)
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
  v4 = CFNLog::logger;
  if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
  {
    v5 = 138412290;
    v6 = a2;
    _os_log_error_impl(&dword_183ECA000, v4, OS_LOG_TYPE_ERROR, "obliterateAllSessionsWithReply error handler called with error %@", (uint8_t *)&v5, 0xCu);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "invalidate");

}

void __70__NSURLSession__obliterateAllBackgroundSessionsWithCompletionHandler___block_invoke_42(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "invalidate");

}

uint64_t __66__NSURLSession__getActiveSessionIdentifiersWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (CFNLog::onceToken != -1)
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
  v4 = CFNLog::logger;
  if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
  {
    v6 = 138412290;
    v7 = a2;
    _os_log_error_impl(&dword_183ECA000, v4, OS_LOG_TYPE_ERROR, "getActiveSessionIdentifiersWithReply error handler called with error %@", (uint8_t *)&v6, 0xCu);
  }
  objc_msgSend(*(id *)(a1 + 32), "invalidate");

  return +[NSURLSession _getActiveSessionIdentifiersWithCompletionHandler:](NSURLSession, "_getActiveSessionIdentifiersWithCompletionHandler:", *(_QWORD *)(a1 + 40));
}

void __66__NSURLSession__getActiveSessionIdentifiersWithCompletionHandler___block_invoke_40(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "invalidate");

}

void __61__NSURLSession__releaseProcessAssertionForSessionIdentifier___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "invalidate");

}

void __58__NSURLSession__sendPendingCallbacksForSessionIdentifier___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "invalidate");

}

uint64_t __43__NSURLSession__backgroundServiceAvailable__block_invoke()
{
  uint64_t result;

  result = __CFNIsMachServiceReachable((char *)objc_msgSend(CFSTR("com.apple.nsurlsessiond"), "UTF8String"));
  +[NSURLSession _backgroundServiceAvailable]::available = result;
  return result;
}

__NSURLSessionLocal *__43__NSURLSession__sharedSessionForConnection__block_invoke()
{
  NSURLSessionConfiguration *v0;
  __NSURLSessionLocal *result;

  v0 = +[NSURLSessionConfiguration sessionConfigurationForSharedSession](NSURLSessionConfiguration, "sessionConfigurationForSharedSession");
  -[NSURLSessionConfiguration set_disablesUseOfProxySession:](v0, "set_disablesUseOfProxySession:", 1);
  -[NSURLSessionConfiguration set_disablesNWLoader:](v0, "set_disablesNWLoader:", 1);
  result = +[NSURLSession _sessionWithConfiguration:delegate:delegateQueue:delegateDispatchQueue:]((uint64_t)NSURLSession, v0, 0, 0, 0);
  +[NSURLSession _sharedSessionForConnection]::sSharedSession = (uint64_t)result;
  if (result)
    *((_BYTE *)result + 68) = 1;
  return result;
}

uint64_t __102__NSURLSession_delegate_AVAssetDownloadTask_didWriteData_totalBytesWritten_totalBytesExpectedToWrite___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "URLSession:avAssetDownloadTask:didWriteData:totalBytesWritten:totalBytesExpectedToWrite:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
}

uint64_t __69__NSURLSession_delegate_AVAssetDownloadTask_didReceiveDownloadToken___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "URLSession:avAssetDownloadTask:didReceiveAVAssetDownloadToken:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

uint64_t __108__NSURLSession_delegate_AVAssetDownloadTask_didLoadTimeRange_totalTimeRangesLoaded_timeRangeExpectedToLoad___block_invoke(uint64_t a1)
{
  __int128 v1;
  __int128 v2;
  __int128 v3;
  __int128 v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  _OWORD v10[3];
  _OWORD v11[3];

  v1 = *(_OWORD *)(a1 + 80);
  v11[0] = *(_OWORD *)(a1 + 64);
  v11[1] = v1;
  v2 = *(_OWORD *)(a1 + 112);
  v11[2] = *(_OWORD *)(a1 + 96);
  v3 = *(_OWORD *)(a1 + 128);
  v4 = *(_OWORD *)(a1 + 144);
  v10[0] = v2;
  v10[1] = v3;
  v6 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 48);
  v8 = *(_QWORD *)(a1 + 56);
  v10[2] = v4;
  return objc_msgSend(v6, "URLSession:assetDownloadTask:didLoadTimeRange:totalTimeRangesLoaded:timeRangeExpectedToLoad:", v5, v7, v11, v8, v10);
}

uint64_t __66__NSURLSession_delegate_AVAssetDownloadTask_willDownloadVariants___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "URLSession:assetDownloadTask:willDownloadVariants:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)delegate_AVAssetDownloadTask:(uint64_t)a3 didResolveMediaSelection:
{
  NSObject *v3;
  _QWORD v4[8];

  if (a1)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __70__NSURLSession_delegate_AVAssetDownloadTask_didResolveMediaSelection___block_invoke;
    v4[3] = &unk_1E14FBED8;
    v3 = *(NSObject **)(a1 + 88);
    v4[4] = *(_QWORD *)(a1 + 96);
    v4[5] = a1;
    v4[6] = a2;
    v4[7] = a3;
    if (v3)
      dispatch_async(v3, v4);
    else
      objc_msgSend(*(id *)(a1 + 80), "addOperationWithBlock:", v4);
  }
}

uint64_t __70__NSURLSession_delegate_AVAssetDownloadTask_didResolveMediaSelection___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "URLSession:assetDownloadTask:didResolveMediaSelection:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

uint64_t __89__NSURLSession_delegate_AVAssetDownloadTask_didFinishDownloadingToURL_completionHandler___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "URLSession:assetDownloadTask:didFinishDownloadingToURL:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
}

uint64_t __63__NSURLSession_delegate_AVAssetDownloadTask_willDownloadToURL___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "URLSession:assetDownloadTask:willDownloadToURL:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)delegate_AVAggregateAssetDownloadTask:(uint64_t)a3 willDownloadToURL:
{
  NSObject *v3;
  _QWORD v4[8];

  if (a1)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __72__NSURLSession_delegate_AVAggregateAssetDownloadTask_willDownloadToURL___block_invoke;
    v4[3] = &unk_1E14FBED8;
    v3 = *(NSObject **)(a1 + 88);
    v4[4] = *(_QWORD *)(a1 + 96);
    v4[5] = a1;
    v4[6] = a2;
    v4[7] = a3;
    if (v3)
      dispatch_async(v3, v4);
    else
      objc_msgSend(*(id *)(a1 + 80), "addOperationWithBlock:", v4);
  }
}

uint64_t __72__NSURLSession_delegate_AVAggregateAssetDownloadTask_willDownloadToURL___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "URLSession:aggregateAssetDownloadTask:willDownloadToURL:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)delegate_AVAggregateAssetDownloadTask:(uint64_t)a3 didCompleteForMediaSelection:
{
  NSObject *v3;
  _QWORD v4[8];

  if (a1)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __83__NSURLSession_delegate_AVAggregateAssetDownloadTask_didCompleteForMediaSelection___block_invoke;
    v4[3] = &unk_1E14FBED8;
    v3 = *(NSObject **)(a1 + 88);
    v4[4] = *(_QWORD *)(a1 + 96);
    v4[5] = a1;
    v4[6] = a2;
    v4[7] = a3;
    if (v3)
      dispatch_async(v3, v4);
    else
      objc_msgSend(*(id *)(a1 + 80), "addOperationWithBlock:", v4);
  }
}

uint64_t __83__NSURLSession_delegate_AVAggregateAssetDownloadTask_didCompleteForMediaSelection___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "URLSession:aggregateAssetDownloadTask:didCompleteForMediaSelection:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)delegate_AVAggregateAssetDownloadTask:(__int128 *)a3 didLoadTimeRange:(uint64_t)a4 totalTimeRangesLoaded:(__int128 *)a5 timeRangeExpectedToLoad:(uint64_t)a6 forMediaSelection:
{
  NSObject *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _QWORD block[9];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;

  if (a1)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __135__NSURLSession_delegate_AVAggregateAssetDownloadTask_didLoadTimeRange_totalTimeRangesLoaded_timeRangeExpectedToLoad_forMediaSelection___block_invoke;
    block[3] = &unk_1E14FBF00;
    v6 = *(NSObject **)(a1 + 88);
    block[4] = *(_QWORD *)(a1 + 96);
    block[5] = a1;
    v7 = a3[1];
    v12 = *a3;
    v13 = v7;
    v8 = a3[2];
    block[6] = a2;
    block[7] = a4;
    v9 = *a5;
    v10 = a5[1];
    v17 = a5[2];
    v16 = v10;
    v14 = v8;
    v15 = v9;
    block[8] = a6;
    if (v6)
      dispatch_async(v6, block);
    else
      objc_msgSend(*(id *)(a1 + 80), "addOperationWithBlock:", block);
  }
}

uint64_t __135__NSURLSession_delegate_AVAggregateAssetDownloadTask_didLoadTimeRange_totalTimeRangesLoaded_timeRangeExpectedToLoad_forMediaSelection___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  __int128 v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  _OWORD v8[3];
  _OWORD v9[3];

  v2 = *(void **)(a1 + 32);
  v1 = *(_QWORD *)(a1 + 40);
  v3 = *(_OWORD *)(a1 + 88);
  v9[0] = *(_OWORD *)(a1 + 72);
  v9[1] = v3;
  v9[2] = *(_OWORD *)(a1 + 104);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 56);
  v6 = *(_OWORD *)(a1 + 136);
  v8[0] = *(_OWORD *)(a1 + 120);
  v8[1] = v6;
  v8[2] = *(_OWORD *)(a1 + 152);
  return objc_msgSend(v2, "URLSession:aggregateAssetDownloadTask:didLoadTimeRange:totalTimeRangesLoaded:timeRangeExpectedToLoad:forMediaSelection:", v1, v4, v9, v5, v8, *(_QWORD *)(a1 + 64));
}

- (uint64_t)addToHTTPFallbackHosts:(uint64_t)a3 forbiddenProtocols:
{
  void *v5;
  SEL v6;
  id Property;
  SEL v8;

  if (result)
  {
    v5 = (void *)result;
    os_unfair_lock_lock((os_unfair_lock_t)&_httpFallbackHostsLock);
    Property = objc_getProperty(v5, v6, 144, 1);
    if (!Property)
    {
      Property = (id)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      objc_setProperty_atomic(v5, v8, Property, 144);
    }
    objc_msgSend(Property, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", a3), a2);
    os_unfair_lock_unlock((os_unfair_lock_t)&_httpFallbackHostsLock);
    result = objc_msgSend(a2, "isEqualToString:", CFSTR("localhost"));
    if ((result & 1) == 0)
      return AnalyticsSendEventLazy_delayInitStub(COERCE_DOUBLE(3221225472));
  }
  return result;
}

uint64_t __58__NSURLSession_addToHTTPFallbackHosts_forbiddenProtocols___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD v4[2];
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v1 = *(_QWORD *)(a1 + 40);
  v4[0] = CFSTR("domain");
  v4[1] = CFSTR("forbiddenProtocols");
  v5[0] = v2;
  v5[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v1);
  return objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 2);
}

@end
