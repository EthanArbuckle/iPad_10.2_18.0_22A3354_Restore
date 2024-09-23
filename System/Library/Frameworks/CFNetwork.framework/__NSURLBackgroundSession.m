@implementation __NSURLBackgroundSession

- (__NSURLBackgroundSession)initWithConfiguration:(id)a3 delegate:(id)a4 delegateQueue:(id)a5 delegateDispatchQueue:(id)a6
{
  __NSURLBackgroundSession *v7;
  __NSURLBackgroundSession *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  CFTypeRef v14;
  NSURLSessionConfiguration *local_immutable_configuration_ivar;
  NSObject *workQueue;
  NSObject *v17;
  uint64_t v19;
  _QWORD handler[5];
  objc_super v21;
  __int128 buf;
  uint64_t (*v23)(_QWORD *, void *);
  void *v24;
  uint64_t v25;
  CFTypeRef v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v21.receiver = self;
  v21.super_class = (Class)__NSURLBackgroundSession;
  v7 = -[NSURLSession initWithConfiguration:delegate:delegateQueue:delegateDispatchQueue:](&v21, sel_initWithConfiguration_delegate_delegateQueue_delegateDispatchQueue_, a3, a4, a5, a6);
  v8 = v7;
  if (v7)
  {
    v7->_identSeed = 1;
    v7->_tasks = (NSMutableDictionary *)(id)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8->_taskIDsToFailOnReconnection = (NSMutableArray *)objc_opt_new();
    v8->_taskIDsGettingAuthHeaders = (NSMutableSet *)objc_opt_new();
    v8->_downloadDirectory = (NSURL *)objc_msgSend(a3, "_directoryForDownloadedFiles");
    v8->_companionAvailable = objc_msgSend(a3, "_isProxySession");
    v9 = -[NSDictionary objectForKeyedSubscript:](-[NSURLSessionConfiguration HTTPAdditionalHeaders](v8->super._local_immutable_configuration_ivar, "HTTPAdditionalHeaders"), "objectForKeyedSubscript:", 0x1EDCFD8C8);
    v10 = -[NSDictionary objectForKeyedSubscript:](-[NSURLSessionConfiguration HTTPAdditionalHeaders](v8->super._local_immutable_configuration_ivar, "HTTPAdditionalHeaders"), "objectForKeyedSubscript:", 0x1EDCFCBE0);
    v11 = v10;
    v12 = MEMORY[0x1E0C809B0];
    if (!v9 || !v10)
    {
      pthread_once(&initControl, initializeUserAgentString);
      v13 = sUserAgentString;
      v14 = (id)_CFNetworkCopyPreferredLanguageCode();
      *(_QWORD *)&buf = v12;
      *((_QWORD *)&buf + 1) = 3221225472;
      v23 = __41____NSURLBackgroundSession_cleanupConfig__block_invoke;
      v24 = &unk_1E14F8500;
      v25 = v13;
      v26 = v14;
      v27 = v9;
      v28 = v11;
      local_immutable_configuration_ivar = v8->super._local_immutable_configuration_ivar;
      v8->super._local_immutable_configuration_ivar = (NSURLSessionConfiguration *)-[NSURLSessionConfiguration copyImmutableVariant:](local_immutable_configuration_ivar, "copyImmutableVariant:", &buf);

    }
    -[__NSURLBackgroundSession setupXPCConnection]((uint64_t)v8);
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "addObserver:selector:name:object:", v8, sel_wentToBackground_, CFSTR("UIApplicationDidEnterBackgroundNotification"), 0);
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "addObserver:selector:name:object:", v8, sel_cameIntoForeground_, CFSTR("UIApplicationWillEnterForegroundNotification"), 0);
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "addObserver:selector:name:object:", v8, sel_appWasLaunchedForBackgroundSession_, CFSTR("NSURLSessionAppWasResumedForBackgroundSessionNotification"), 0);
    -[__NSURLBackgroundSession setupBackgroundSession]((uint64_t)v8);
    if ((objc_msgSend(a3, "_isProxySession") & 1) == 0)
    {
      v8->_notifyToken = 0;
      workQueue = v8->super._workQueue;
      handler[0] = v12;
      handler[1] = 3221225472;
      handler[2] = __95____NSURLBackgroundSession_initWithConfiguration_delegate_delegateQueue_delegateDispatchQueue___block_invoke;
      handler[3] = &unk_1E14FB818;
      handler[4] = v8;
      notify_register_dispatch("com.apple.nsurlsessiond.started", &v8->_notifyToken, workQueue, handler);
    }
    if (objc_msgSend(a3, "isDiscretionary")
      && objc_msgSend(a3, "_xpcActivityBudgeted") == 2)
    {
      if (__CFNAPIMisuseFaultLogHandle::onceToken != -1)
        dispatch_once(&__CFNAPIMisuseFaultLogHandle::onceToken, &__block_literal_global_7_4765);
      v17 = __CFNAPIMisuseFaultLogHandle::logger;
      if (os_log_type_enabled((os_log_t)__CFNAPIMisuseFaultLogHandle::logger, OS_LOG_TYPE_FAULT))
      {
        v19 = objc_msgSend(a3, "identifier");
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v19;
        _os_log_fault_impl(&dword_183ECA000, v17, OS_LOG_TYPE_FAULT, "Discretionary background URLSessionConfiguration (%@) is inconsistent with xpc activity configuration. If this is intended, please reach out to cfnetwork / duetactivityscheduler", (uint8_t *)&buf, 0xCu);
      }
    }
  }
  return v8;
}

- (uint64_t)setupXPCConnection
{
  uint64_t v1;
  const __CFString *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[5];
  _QWORD v7[5];

  if (result)
  {
    v1 = result;
    if (objc_msgSend(*(id *)(result + 112), "_isProxySession"))
      v2 = CFSTR("com.apple.nsurlsessiond.NSURLSessionProxyService");
    else
      v2 = CFSTR("com.apple.nsurlsessiond");
    *(_QWORD *)(v1 + 176) = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", v2, 0);
    objc_msgSend(*(id *)(v1 + 176), "setRemoteObjectInterface:", +[__NSCFURLSessionXPC bgSessionManagerInterface](__NSCFURLSessionXPC, "bgSessionManagerInterface"));
    v3 = *(void **)(v1 + 176);
    v4 = MEMORY[0x1E0C809B0];
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __46____NSURLBackgroundSession_setupXPCConnection__block_invoke;
    v7[3] = &unk_1E14FE118;
    v7[4] = v1;
    objc_msgSend(v3, "setInterruptionHandler:", v7);
    v5 = *(void **)(v1 + 176);
    v6[0] = v4;
    v6[1] = 3221225472;
    v6[2] = __46____NSURLBackgroundSession_setupXPCConnection__block_invoke_2_18;
    v6[3] = &unk_1E14FE118;
    v6[4] = v1;
    objc_msgSend(v5, "setInvalidationHandler:", v6);
    *(_BYTE *)(v1 + 281) = 0;
    return objc_msgSend(*(id *)(v1 + 176), "resume");
  }
  return result;
}

- (void)setupBackgroundSession
{
  double v2;
  int v3;
  NSObject *v4;
  _BOOL4 v5;
  uint64_t v6;
  const char *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  const char *v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  const char *v23;
  NSObject *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  id v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD v38[5];
  _QWORD v39[5];
  _QWORD v40[8];
  _QWORD v41[5];
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  char v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  char v49;
  __int128 v50;
  uint64_t v51;
  void (*v52)(uint64_t, uint64_t);
  void (*v53)(uint64_t);
  uint64_t v54;
  _BYTE buf[24];
  void *v56;
  uint64_t v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return;
  *(_BYTE *)(a1 + 280) = 0;
  if ((objc_msgSend(*(id *)(a1 + 112), "_isProxySession") & 1) == 0
    && MKBDeviceUnlockedSinceBoot_delayInitStub(v2) != 1)
  {
    v3 = objc_msgSend(*(id *)(a1 + 112), "_isProxySession");
    if (CFNLog::onceToken != -1)
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
    v4 = CFNLog::logger;
    v5 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR);
    if (v3)
    {
      if (!v5)
        goto LABEL_10;
      v6 = *(_QWORD *)(a1 + 128);
      LODWORD(v50) = 138543362;
      *(_QWORD *)((char *)&v50 + 4) = v6;
      v7 = "ProxySession <%{public}@> attempting to setup a background session before first device unlock!";
    }
    else
    {
      if (!v5)
        goto LABEL_10;
      v37 = *(_QWORD *)(a1 + 128);
      LODWORD(v50) = 138543362;
      *(_QWORD *)((char *)&v50 + 4) = v37;
      v7 = "BackgroundSession <%{public}@> attempting to setup a background session before first device unlock!";
    }
    _os_log_error_impl(&dword_183ECA000, v4, OS_LOG_TYPE_ERROR, v7, (uint8_t *)&v50, 0xCu);
  }
LABEL_10:
  v46 = 0;
  v47 = &v46;
  v48 = 0x2020000000;
  v49 = 0;
  *(_QWORD *)&v50 = 0;
  *((_QWORD *)&v50 + 1) = &v50;
  v51 = 0x3052000000;
  v52 = __Block_byref_object_copy__4402;
  v53 = __Block_byref_object_dispose__4403;
  v54 = 0;
  v42 = 0;
  v43 = &v42;
  v44 = 0x2020000000;
  v45 = 0;
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 176), "remoteObjectProxy"), "boost");
  v8 = *(void **)(a1 + 176);
  v9 = MEMORY[0x1E0C809B0];
  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __50____NSURLBackgroundSession_setupBackgroundSession__block_invoke;
  v41[3] = &unk_1E14F9B68;
  v41[4] = a1;
  v10 = (void *)objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", v41);
  v11 = (void *)objc_msgSend(*(id *)(a1 + 112), "_overriddenDelegateOptions");
  if (!v11)
    v11 = (void *)-[NSURLSession delegateOptions](a1, v12);
  v13 = (id)objc_msgSend(v11, "mutableCopy");
  objc_msgSend(v13, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 128), CFSTR("NDBackgroundSessionManagerKeySessionUUID"));
  if (objc_msgSend(*(id *)(a1 + 112), "_isProxySession"))
  {
    if (CFNLog::onceToken != -1)
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
    v14 = CFNLog::logger;
    if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT))
    {
      v15 = *(_QWORD *)(a1 + 128);
      v16 = objc_msgSend(*(id *)(a1 + 112), "identifier");
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v15;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = a1;
      *(_WORD *)&buf[22] = 2112;
      v56 = (void *)v16;
      v17 = "ProxySession <%{public}@> background session setup will wait for reply: session %@ with identifier %@";
LABEL_21:
      _os_log_impl(&dword_183ECA000, v14, OS_LOG_TYPE_DEFAULT, v17, buf, 0x20u);
    }
  }
  else
  {
    if (CFNLog::onceToken != -1)
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
    v14 = CFNLog::logger;
    if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT))
    {
      v18 = *(_QWORD *)(a1 + 128);
      v19 = objc_msgSend(*(id *)(a1 + 112), "identifier");
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v18;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = a1;
      *(_WORD *)&buf[22] = 2112;
      v56 = (void *)v19;
      v17 = "BackgroundSession <%{public}@> background session setup will wait for reply: session %@ with identifier %@";
      goto LABEL_21;
    }
  }
  v20 = *(_QWORD *)(a1 + 112);
  v40[0] = v9;
  v40[1] = 3221225472;
  v40[2] = __50____NSURLBackgroundSession_setupBackgroundSession__block_invoke_46;
  v40[3] = &unk_1E14F8528;
  v40[4] = a1;
  v40[5] = &v46;
  v40[6] = &v42;
  v40[7] = &v50;
  objc_msgSend(v10, "createSessionWithConfiguration:clientProxy:cachesDirectory:options:reply:", v20, a1, 0, v13, v40);
  if (*((_BYTE *)v43 + 24))
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("Creating an AVAssetDownloadURLSession requires the com.apple.developer.media-asset-download entitlement"), 0));
  if (*((_BYTE *)v47 + 24))
  {
    if (objc_msgSend(*(id *)(a1 + 112), "_isProxySession"))
    {
      if (CFNLog::onceToken != -1)
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
      v21 = CFNLog::logger;
      if (!os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT))
        goto LABEL_36;
      v22 = *(_QWORD *)(a1 + 128);
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v22;
      v23 = "ProxySession <%{public}@> will reconnect to existing state by requesting pending callbacks";
    }
    else
    {
      if (CFNLog::onceToken != -1)
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
      v21 = CFNLog::logger;
      if (!os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT))
        goto LABEL_36;
      v25 = *(_QWORD *)(a1 + 128);
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v25;
      v23 = "BackgroundSession <%{public}@> will reconnect to existing state by requesting pending callbacks";
    }
    _os_log_impl(&dword_183ECA000, v21, OS_LOG_TYPE_DEFAULT, v23, buf, 0xCu);
LABEL_36:
    v26 = *(void **)(a1 + 176);
    v39[0] = v9;
    v39[1] = 3221225472;
    v39[2] = __50____NSURLBackgroundSession_setupBackgroundSession__block_invoke_59;
    v39[3] = &unk_1E14F9B68;
    v39[4] = a1;
    v27 = (void *)objc_msgSend(v26, "remoteObjectProxyWithErrorHandler:", v39);
    v28 = objc_msgSend(*(id *)(a1 + 112), "identifier");
    v38[0] = v9;
    v38[1] = 3221225472;
    v38[2] = __50____NSURLBackgroundSession_setupBackgroundSession__block_invoke_60;
    v38[3] = &unk_1E14FE118;
    v38[4] = a1;
    objc_msgSend(v27, "sendPendingCallbacksForIdentifier:reply:", v28, v38);
    goto LABEL_37;
  }
  if (objc_msgSend(*(id *)(a1 + 192), "count"))
  {
    v24 = *(NSObject **)(a1 + 120);
    *(_QWORD *)buf = v9;
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __49____NSURLBackgroundSession_failDisconnectedTasks__block_invoke;
    v56 = &unk_1E14FE118;
    v57 = a1;
    dispatch_async(v24, buf);
  }
LABEL_37:
  if (!*(_QWORD *)(a1 + 272))
    goto LABEL_47;
  if (objc_msgSend(*(id *)(a1 + 112), "_isProxySession"))
  {
    if (CFNLog::onceToken != -1)
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
    v29 = CFNLog::logger;
    if (!os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
      goto LABEL_46;
    v30 = *(_QWORD *)(a1 + 128);
    v31 = *(_QWORD *)(a1 + 272);
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v30;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v31;
    v32 = "ProxySession <%{public}@> received invalidation error %@ when attempting to connect to background transfer daemon";
  }
  else
  {
    if (CFNLog::onceToken != -1)
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
    v29 = CFNLog::logger;
    if (!os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
      goto LABEL_46;
    v35 = *(_QWORD *)(a1 + 128);
    v36 = *(_QWORD *)(a1 + 272);
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v35;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v36;
    v32 = "BackgroundSession <%{public}@> received invalidation error %@ when attempting to connect to background transfer daemon";
  }
  _os_log_error_impl(&dword_183ECA000, v29, OS_LOG_TYPE_ERROR, v32, buf, 0x16u);
LABEL_46:

  *(_QWORD *)(a1 + 272) = 0;
LABEL_47:
  if (*(_QWORD *)(*((_QWORD *)&v50 + 1) + 40))
  {
    objc_msgSend(*(id *)(a1 + 176), "invalidate");

    *(_QWORD *)(a1 + 176) = 0;
    *(_QWORD *)(a1 + 168) = 0;
    v33 = *(id *)(*((_QWORD *)&v50 + 1) + 40);
    *(_QWORD *)(a1 + 272) = v33;
    v34 = (void *)objc_msgSend(v33, "domain");
    if (objc_msgSend(v34, "isEqualToString:", *MEMORY[0x1E0CB32E8]))
    {
      if (objc_msgSend(*(id *)(a1 + 272), "code") == -996 || objc_msgSend(*(id *)(a1 + 272), "code") == -1009)
        *(_BYTE *)(a1 + 280) = 1;
    }
  }
  _Block_object_dispose(&v42, 8);
  _Block_object_dispose(&v50, 8);
  _Block_object_dispose(&v46, 8);
}

- (void)_onqueue_getTasksWithCompletionHandler:(id)a3
{
  __NSURLBackgroundSession *v4;
  _QWORD v5[6];

  v4 = self;
  if (self)
    self = (__NSURLBackgroundSession *)objc_msgSend((id)-[NSMutableDictionary allValues](self->_tasks, "allValues"), "copy");
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __67____NSURLBackgroundSession__onqueue_getTasksWithCompletionHandler___block_invoke;
  v5[3] = &unk_1E14FDF00;
  v5[4] = self;
  v5[5] = a3;
  -[NSURLSession runDelegateBlock:]((uint64_t)v4, v5);
}

- (uint64_t)ensureRemoteSession
{
  uint64_t v1;
  int v2;
  int v3;
  NSObject *v4;
  _BOOL4 v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    if (!*(_QWORD *)(result + 168))
    {
      v2 = *(unsigned __int8 *)(result + 280);
      v3 = objc_msgSend(*(id *)(result + 112), "_isProxySession");
      if (CFNLog::onceToken != -1)
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
      v4 = CFNLog::logger;
      v5 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT);
      if (v2)
      {
        if (v3)
        {
          if (v5)
          {
            v6 = *(_QWORD *)(v1 + 128);
            v12 = 138543362;
            v13 = v6;
            v7 = "ProxySession <%{public}@> attempting to reconnect to background transfer daemon";
LABEL_14:
            _os_log_impl(&dword_183ECA000, v4, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v12, 0xCu);
          }
        }
        else if (v5)
        {
          v10 = *(_QWORD *)(v1 + 128);
          v12 = 138543362;
          v13 = v10;
          v7 = "BackgroundSession <%{public}@> attempting to reconnect to background transfer daemon";
          goto LABEL_14;
        }
        -[__NSURLBackgroundSession setupXPCConnection](v1);
        -[__NSURLBackgroundSession setupBackgroundSession](v1);
        return *(_QWORD *)(v1 + 168);
      }
      if (!v3)
      {
        if (!v5)
          return *(_QWORD *)(v1 + 168);
        v11 = *(_QWORD *)(v1 + 128);
        v12 = 138543362;
        v13 = v11;
        v9 = "BackgroundSession <%{public}@> no connection to background transfer daemon, and will not try to reconnect";
LABEL_18:
        _os_log_impl(&dword_183ECA000, v4, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v12, 0xCu);
        return *(_QWORD *)(v1 + 168);
      }
      if (v5)
      {
        v8 = *(_QWORD *)(v1 + 128);
        v12 = 138543362;
        v13 = v8;
        v9 = "ProxySession <%{public}@> no connection to background transfer daemon, and will not try to reconnect";
        goto LABEL_18;
      }
    }
    return *(_QWORD *)(v1 + 168);
  }
  return result;
}

- (void)credStorage_getInitialCredentialDictionariesWithReply:(id)a3
{
  uint64_t v4;

  v4 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
  (*((void (**)(id, uint64_t, uint64_t))a3 + 2))(a3, v4, objc_msgSend(MEMORY[0x1E0C99D80], "dictionary"));
}

- (id).cxx_construct
{
  *((_QWORD *)self + 28) = 0;
  *((_QWORD *)self + 29) = 0;
  return self;
}

- (uint64_t)validateSerializabilityForRequest:(uint64_t)result completion:(uint64_t)a2
{
  void *v3;
  uint64_t v4;
  const __CFString *v5;
  void *v6;
  uint64_t v7;

  if (result)
  {
    objc_opt_class();
    result = objc_opt_isKindOfClass();
    if ((result & 1) == 0)
    {
      objc_opt_class();
      result = objc_opt_isKindOfClass();
      if ((result & 1) == 0)
      {
        v6 = (void *)MEMORY[0x1E0C99DA0];
        v7 = *MEMORY[0x1E0C99778];
        v5 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Custom subclasses of NSURLRequest are not supported in background sessions. Attempted to use a request of class %@"), objc_opt_class());
        v3 = v6;
        v4 = v7;
LABEL_7:
        objc_exception_throw((id)objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0));
      }
    }
  }
  if (a2)
  {
    v3 = (void *)MEMORY[0x1E0C99DA0];
    v4 = *MEMORY[0x1E0C99750];
    v5 = CFSTR("Completion handler blocks are not supported in background sessions. Use a delegate instead.");
    goto LABEL_7;
  }
  return result;
}

- (id)taskForIdentifier:(id *)result
{
  if (result)
    return (id *)(id)objc_msgSend(result[23], "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2));
  return result;
}

- (void)performBlockOnQueueAndRethrowExceptions:(uint64_t)a1
{
  NSObject *v2;
  void *v3;
  _QWORD block[7];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  uint64_t v10;

  if (a1)
  {
    v5 = 0;
    v6 = &v5;
    v7 = 0x3052000000;
    v8 = __Block_byref_object_copy__4402;
    v9 = __Block_byref_object_dispose__4403;
    v10 = 0;
    v2 = *(NSObject **)(a1 + 120);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __68____NSURLBackgroundSession_performBlockOnQueueAndRethrowExceptions___block_invoke;
    block[3] = &unk_1E14F85C0;
    block[4] = a1;
    block[5] = a2;
    block[6] = &v5;
    dispatch_sync(v2, block);
    v3 = (void *)v6[5];
    if (v3)
      objc_exception_throw(v3);
    _Block_object_dispose(&v5, 8);
  }
}

- (void)backgroundTaskDidResume:(unint64_t)a3
{
  NSObject *workQueue;
  _QWORD v4[6];

  if (self)
    workQueue = self->super._workQueue;
  else
    workQueue = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __52____NSURLBackgroundSession_backgroundTaskDidResume___block_invoke;
  v4[3] = &unk_1E14FE140;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(workQueue, v4);
}

- (void)backgroundTask:(unint64_t)a3 didCompleteWithError:(id)a4 taskMetrics:(id)a5 info:(id)a6 reply:(id)a7
{
  __NSURLBackgroundSession *v7;
  _QWORD v8[10];

  v7 = self;
  if (self)
    self = (__NSURLBackgroundSession *)self->super._workQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __87____NSURLBackgroundSession_backgroundTask_didCompleteWithError_taskMetrics_info_reply___block_invoke;
  v8[3] = &unk_1E14F88F8;
  v8[4] = v7;
  v8[5] = a4;
  v8[8] = a7;
  v8[9] = a3;
  v8[6] = a5;
  v8[7] = a6;
  dispatch_async(&self->super.super, v8);
}

- (id)_uploadTaskWithTaskForClass:(id)a3
{
  __NSURLBackgroundSession *v4;
  void *v5;
  _QWORD v7[7];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  uint64_t v13;

  v4 = self;
  if (self)
    self = (__NSURLBackgroundSession *)self->super._local_immutable_configuration_ivar;
  if (-[__NSURLBackgroundSession _supportsAVAssetDownloads](self, "_supportsAVAssetDownloads"))
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("AVAssetDownloadURLSession does not support NSURLSessionUploadTask"), 0));
  v8 = 0;
  v9 = &v8;
  v10 = 0x3052000000;
  v11 = __Block_byref_object_copy__4402;
  v12 = __Block_byref_object_dispose__4403;
  v13 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __56____NSURLBackgroundSession__uploadTaskWithTaskForClass___block_invoke;
  v7[3] = &unk_1E14FD9A0;
  v7[5] = a3;
  v7[6] = &v8;
  v7[4] = v4;
  -[__NSURLBackgroundSession performBlockOnQueueAndRethrowExceptions:]((uint64_t)v4, (uint64_t)v7);
  v5 = (void *)v9[5];
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (id)_downloadTaskWithTaskForClass:(id)a3
{
  __NSURLBackgroundSession *v4;
  void *v5;
  _QWORD v7[7];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  uint64_t v13;

  v4 = self;
  if (self)
    self = (__NSURLBackgroundSession *)self->super._local_immutable_configuration_ivar;
  if (-[__NSURLBackgroundSession _supportsAVAssetDownloads](self, "_supportsAVAssetDownloads"))
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("AVAssetDownloadURLSession does not support NSURLSessionDownloadTask"), 0));
  v8 = 0;
  v9 = &v8;
  v10 = 0x3052000000;
  v11 = __Block_byref_object_copy__4402;
  v12 = __Block_byref_object_dispose__4403;
  v13 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58____NSURLBackgroundSession__downloadTaskWithTaskForClass___block_invoke;
  v7[3] = &unk_1E14FD9A0;
  v7[5] = a3;
  v7[6] = &v8;
  v7[4] = v4;
  -[__NSURLBackgroundSession performBlockOnQueueAndRethrowExceptions:]((uint64_t)v4, (uint64_t)v7);
  v5 = (void *)v9[5];
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (void)wentToBackground:(id)a3
{
  NSObject *workQueue;
  _QWORD block[5];

  if (self)
    workQueue = self->super._workQueue;
  else
    workQueue = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45____NSURLBackgroundSession_wentToBackground___block_invoke;
  block[3] = &unk_1E14FE118;
  block[4] = self;
  dispatch_async(workQueue, block);
}

- (void)cameIntoForeground:(id)a3
{
  NSObject *workQueue;
  _QWORD block[5];

  if (self)
    workQueue = self->super._workQueue;
  else
    workQueue = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47____NSURLBackgroundSession_cameIntoForeground___block_invoke;
  block[3] = &unk_1E14FE118;
  block[4] = self;
  dispatch_async(workQueue, block);
}

- (void)appWasLaunchedForBackgroundSession:(id)a3
{
  NSObject *workQueue;
  _QWORD block[5];

  if (self)
    workQueue = self->super._workQueue;
  else
    workQueue = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63____NSURLBackgroundSession_appWasLaunchedForBackgroundSession___block_invoke;
  block[3] = &unk_1E14FE118;
  block[4] = self;
  dispatch_async(workQueue, block);
}

- (void)dealloc
{
  objc_super v3;

  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "removeObserver:", self);
  -[NSXPCConnection invalidate](self->_xpcConn, "invalidate");

  v3.receiver = self;
  v3.super_class = (Class)__NSURLBackgroundSession;
  -[NSURLSession dealloc](&v3, sel_dealloc);
}

- (void)_useTLSSessionCacheFromSession:(id)a3
{
  NSObject *workQueue;
  _QWORD block[5];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)__NSURLBackgroundSession;
  -[NSURLSession _useTLSSessionCacheFromSession:](&v6, sel__useTLSSessionCacheFromSession_, a3);
  if (self)
    workQueue = self->super._workQueue;
  else
    workQueue = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59____NSURLBackgroundSession__useTLSSessionCacheFromSession___block_invoke;
  block[3] = &unk_1E14FE118;
  block[4] = self;
  dispatch_async(workQueue, block);
}

- (id)_dataTaskWithTaskForClass:(id)a3
{
  __NSURLBackgroundSession *v4;
  void *v5;
  _QWORD v7[7];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  uint64_t v13;

  v4 = self;
  if (self)
    self = (__NSURLBackgroundSession *)self->super._local_immutable_configuration_ivar;
  if (-[__NSURLBackgroundSession _supportsAVAssetDownloads](self, "_supportsAVAssetDownloads"))
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("AVAssetDownloadURLSession does not support NSURLSessionDataTask"), 0));
  v8 = 0;
  v9 = &v8;
  v10 = 0x3052000000;
  v11 = __Block_byref_object_copy__4402;
  v12 = __Block_byref_object_dispose__4403;
  v13 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __54____NSURLBackgroundSession__dataTaskWithTaskForClass___block_invoke;
  v7[3] = &unk_1E14FD9A0;
  v7[5] = a3;
  v7[6] = &v8;
  v7[4] = v4;
  -[__NSURLBackgroundSession performBlockOnQueueAndRethrowExceptions:]((uint64_t)v4, (uint64_t)v7);
  v5 = (void *)v9[5];
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (id)webSocketTaskForRequest:(id)a3
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("WebSocket tasks are not supported in background sessions"), 0));
}

- (id)webSocketTaskForURL:(id)a3 protocols:(id)a4
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("WebSocket tasks are not supported in background sessions"), 0));
}

- (id)_AVAssetDownloadTaskForURL:(id)a3 destinationURL:(id)a4 options:(id)a5
{
  void *v5;
  _QWORD v7[9];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  uint64_t v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3052000000;
  v11 = __Block_byref_object_copy__4402;
  v12 = __Block_byref_object_dispose__4403;
  v13 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __78____NSURLBackgroundSession__AVAssetDownloadTaskForURL_destinationURL_options___block_invoke;
  v7[3] = &unk_1E14F8670;
  v7[7] = a5;
  v7[8] = &v8;
  v7[4] = self;
  v7[5] = a3;
  v7[6] = a4;
  -[__NSURLBackgroundSession performBlockOnQueueAndRethrowExceptions:]((uint64_t)self, (uint64_t)v7);
  v5 = (void *)v9[5];
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (id)AVAssetDownloadTaskForURLAsset:(id)a3 destinationURL:(id)a4 options:(id)a5
{
  void *v5;
  _QWORD v7[9];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  uint64_t v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3052000000;
  v11 = __Block_byref_object_copy__4402;
  v12 = __Block_byref_object_dispose__4403;
  v13 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __82____NSURLBackgroundSession_AVAssetDownloadTaskForURLAsset_destinationURL_options___block_invoke;
  v7[3] = &unk_1E14F8670;
  v7[7] = a5;
  v7[8] = &v8;
  v7[4] = self;
  v7[5] = a3;
  v7[6] = a4;
  -[__NSURLBackgroundSession performBlockOnQueueAndRethrowExceptions:]((uint64_t)self, (uint64_t)v7);
  v5 = (void *)v9[5];
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (id)AVAssetDownloadTaskForURLAsset:(id)a3 assetTitle:(id)a4 assetArtworkData:(id)a5 options:(id)a6 downloadConfiguration:(id)a7
{
  void *v7;
  _QWORD v9[11];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  uint64_t v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3052000000;
  v13 = __Block_byref_object_copy__4402;
  v14 = __Block_byref_object_dispose__4403;
  v15 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __117____NSURLBackgroundSession_AVAssetDownloadTaskForURLAsset_assetTitle_assetArtworkData_options_downloadConfiguration___block_invoke;
  v9[3] = &unk_1E14F86B8;
  v9[9] = a6;
  v9[10] = &v10;
  v9[4] = a7;
  v9[5] = self;
  v9[6] = a3;
  v9[7] = a4;
  v9[8] = a5;
  -[__NSURLBackgroundSession performBlockOnQueueAndRethrowExceptions:]((uint64_t)self, (uint64_t)v9);
  v7 = (void *)v11[5];
  _Block_object_dispose(&v10, 8);
  return v7;
}

- (id)AVAggregateAssetDownloadTaskForURLAsset:(id)a3 mediaSelections:(id)a4 assetTitle:(id)a5 assetArtworkData:(id)a6 options:(id)a7
{
  void *v7;
  _QWORD v9[11];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  uint64_t v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3052000000;
  v13 = __Block_byref_object_copy__4402;
  v14 = __Block_byref_object_dispose__4403;
  v15 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __120____NSURLBackgroundSession_AVAggregateAssetDownloadTaskForURLAsset_mediaSelections_assetTitle_assetArtworkData_options___block_invoke;
  v9[3] = &unk_1E14F86B8;
  v9[9] = a7;
  v9[10] = &v10;
  v9[4] = self;
  v9[5] = a3;
  v9[6] = a4;
  v9[7] = a5;
  v9[8] = a6;
  -[__NSURLBackgroundSession performBlockOnQueueAndRethrowExceptions:]((uint64_t)self, (uint64_t)v9);
  v7 = (void *)v11[5];
  _Block_object_dispose(&v10, 8);
  return v7;
}

- (void)_onqueue_flushWithCompletionHandler:(id)a3
{
  NSObject *global_queue;

  if (self)
    self = (__NSURLBackgroundSession *)self->super._local_immutable_configuration_ivar;
  objc_msgSend((id)-[__NSURLBackgroundSession HTTPCookieStorage](self, "HTTPCookieStorage"), "_saveCookies");
  global_queue = dispatch_get_global_queue(0, 0);
  dispatch_async(global_queue, a3);
}

- (void)_onqueue_resetStorageWithCompletionHandler:(id)a3
{
  void *v5;
  NSHTTPCookieStorage *v6;
  NSURLSessionConfiguration *local_immutable_configuration_ivar;
  NSURLCredentialStorage *v8;
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSDictionary *v14;
  uint64_t v15;
  NDBackgroundSessionProtocol *remoteSession;
  NSObject *global_queue;
  _QWORD v18[5];
  _QWORD v19[5];
  _QWORD v20[5];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x186DB8C8C](self, a2);
  if (self)
  {
    v6 = -[NSURLSessionConfiguration HTTPCookieStorage](self->super._local_immutable_configuration_ivar, "HTTPCookieStorage");
    local_immutable_configuration_ivar = self->super._local_immutable_configuration_ivar;
  }
  else
  {
    v6 = (NSHTTPCookieStorage *)objc_msgSend(0, "HTTPCookieStorage");
    local_immutable_configuration_ivar = 0;
  }
  v8 = -[NSURLSessionConfiguration URLCredentialStorage](local_immutable_configuration_ivar, "URLCredentialStorage");
  v9 = -[NSHTTPCookieStorage cookies](v6, "cookies");
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v22;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v22 != v12)
          objc_enumerationMutation(v9);
        -[NSHTTPCookieStorage deleteCookie:](v6, "deleteCookie:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v13++));
      }
      while (v11 != v13);
      v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v11);
  }
  -[NSHTTPCookieStorage _saveCookies](v6, "_saveCookies");
  v14 = -[NSURLCredentialStorage allCredentials](v8, "allCredentials");
  v15 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __71____NSURLBackgroundSession__onqueue_resetStorageWithCompletionHandler___block_invoke;
  v20[3] = &unk_1E14F8758;
  v20[4] = v8;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](v14, "enumerateKeysAndObjectsUsingBlock:", v20);
  remoteSession = self->_remoteSession;
  if (remoteSession)
  {
    v19[0] = v15;
    v19[1] = 3221225472;
    v19[2] = __71____NSURLBackgroundSession__onqueue_resetStorageWithCompletionHandler___block_invoke_3;
    v19[3] = &unk_1E14F8780;
    v19[4] = a3;
    v18[0] = v15;
    v18[1] = 3221225472;
    v18[2] = __71____NSURLBackgroundSession__onqueue_resetStorageWithCompletionHandler___block_invoke_4;
    v18[3] = &unk_1E14FDEB0;
    v18[4] = a3;
    objc_msgSend((id)-[NDBackgroundSessionProtocol remoteObjectProxyWithErrorHandler:](remoteSession, "remoteObjectProxyWithErrorHandler:", v19), "resetStorageWithReply:", v18);
  }
  else
  {
    global_queue = dispatch_get_global_queue(0, 0);
    dispatch_async(global_queue, a3);
  }
  objc_autoreleasePoolPop(v5);
}

- (void)backgroundTaskDidSuspend:(unint64_t)a3
{
  NSObject *workQueue;
  _QWORD v4[6];

  if (self)
    workQueue = self->super._workQueue;
  else
    workQueue = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __53____NSURLBackgroundSession_backgroundTaskDidSuspend___block_invoke;
  v4[3] = &unk_1E14FE140;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(workQueue, v4);
}

- (void)backgroundTask:(unint64_t)a3 didReceiveChallenge:(id)a4 reply:(id)a5
{
  __NSURLBackgroundSession *v5;
  _QWORD v6[8];

  v5 = self;
  if (self)
    self = (__NSURLBackgroundSession *)self->super._workQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __69____NSURLBackgroundSession_backgroundTask_didReceiveChallenge_reply___block_invoke;
  v6[3] = &unk_1E14FCE60;
  v6[4] = v5;
  v6[5] = a4;
  v6[6] = a5;
  v6[7] = a3;
  dispatch_async(&self->super.super, v6);
}

- (void)backgroundTask:(unint64_t)a3 willBeginDelayedRequest:(id)a4 reply:(id)a5
{
  __NSURLBackgroundSession *v5;
  _QWORD v6[8];

  v5 = self;
  if (self)
    self = (__NSURLBackgroundSession *)self->super._workQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __73____NSURLBackgroundSession_backgroundTask_willBeginDelayedRequest_reply___block_invoke;
  v6[3] = &unk_1E14FCE60;
  v6[4] = v5;
  v6[5] = a4;
  v6[6] = a5;
  v6[7] = a3;
  dispatch_async(&self->super.super, v6);
}

- (void)backgroundTask:(unint64_t)a3 willPerformHTTPRedirection:(id)a4 withNewRequest:(id)a5 reply:(id)a6
{
  __NSURLBackgroundSession *v6;
  _QWORD block[9];

  v6 = self;
  if (self)
    self = (__NSURLBackgroundSession *)self->super._workQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __91____NSURLBackgroundSession_backgroundTask_willPerformHTTPRedirection_withNewRequest_reply___block_invoke;
  block[3] = &unk_1E14FCE88;
  block[7] = a6;
  block[8] = a3;
  block[4] = v6;
  block[5] = a4;
  block[6] = a5;
  dispatch_async(&self->super.super, block);
}

- (void)backgroundTask:(unint64_t)a3 _willSendRequestForEstablishedConnection:(id)a4 reply:(id)a5
{
  __NSURLBackgroundSession *v5;
  _QWORD v6[8];

  v5 = self;
  if (self)
    self = (__NSURLBackgroundSession *)self->super._workQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __90____NSURLBackgroundSession_backgroundTask__willSendRequestForEstablishedConnection_reply___block_invoke;
  v6[3] = &unk_1E14FCE60;
  v6[4] = v5;
  v6[5] = a4;
  v6[6] = a5;
  v6[7] = a3;
  dispatch_async(&self->super.super, v6);
}

- (void)backgroundTaskHasConnectionWaiting:(unint64_t)a3
{
  NSObject *workQueue;
  _QWORD v4[6];

  if (self)
    workQueue = self->super._workQueue;
  else
    workQueue = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __63____NSURLBackgroundSession_backgroundTaskHasConnectionWaiting___block_invoke;
  v4[3] = &unk_1E14FE140;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(workQueue, v4);
}

- (void)backgroundTask:(unint64_t)a3 hasConnectionWaitingWithReason:(int64_t)a4
{
  __NSURLBackgroundSession *v4;
  _QWORD block[7];

  v4 = self;
  if (self)
    self = (__NSURLBackgroundSession *)self->super._workQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74____NSURLBackgroundSession_backgroundTask_hasConnectionWaitingWithReason___block_invoke;
  block[3] = &unk_1E14FB048;
  block[4] = v4;
  block[5] = a3;
  block[6] = a4;
  dispatch_async(&self->super.super, block);
}

- (void)backgroundTask:(unint64_t)a3 hasConnectionWaitingWithError:(id)a4
{
  NSObject *workQueue;
  _QWORD block[7];

  if (self)
    workQueue = self->super._workQueue;
  else
    workQueue = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73____NSURLBackgroundSession_backgroundTask_hasConnectionWaitingWithError___block_invoke;
  block[3] = &unk_1E14FD950;
  block[5] = a4;
  block[6] = a3;
  block[4] = self;
  dispatch_async(workQueue, block);
}

- (void)backgroundTask:(unint64_t)a3 didReceiveInformationalResponse:(id)a4
{
  NSObject *workQueue;
  _QWORD block[7];

  if (self)
    workQueue = self->super._workQueue;
  else
    workQueue = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75____NSURLBackgroundSession_backgroundTask_didReceiveInformationalResponse___block_invoke;
  block[3] = &unk_1E14FD950;
  block[5] = a4;
  block[6] = a3;
  block[4] = self;
  dispatch_async(workQueue, block);
}

- (void)backgroundTask:(unint64_t)a3 didReceiveResponse:(id)a4 transactionMetrics:(id)a5
{
  __NSURLBackgroundSession *v5;
  _QWORD v6[8];

  v5 = self;
  if (self)
    self = (__NSURLBackgroundSession *)self->super._workQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __81____NSURLBackgroundSession_backgroundTask_didReceiveResponse_transactionMetrics___block_invoke;
  v6[3] = &unk_1E14FBE88;
  v6[4] = v5;
  v6[5] = a5;
  v6[6] = a4;
  v6[7] = a3;
  dispatch_async(&self->super.super, v6);
}

- (void)backgroundTask:(unint64_t)a3 didReceiveResponse:(id)a4 transactionMetrics:(id)a5 reply:(id)a6
{
  __NSURLBackgroundSession *v6;
  _QWORD block[9];

  v6 = self;
  if (self)
    self = (__NSURLBackgroundSession *)self->super._workQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __87____NSURLBackgroundSession_backgroundTask_didReceiveResponse_transactionMetrics_reply___block_invoke;
  block[3] = &unk_1E14FCE88;
  block[7] = a6;
  block[8] = a3;
  block[4] = v6;
  block[5] = a5;
  block[6] = a4;
  dispatch_async(&self->super.super, block);
}

- (void)backgroundTask:(unint64_t)a3 didSendBodyData:(int64_t)a4 totalBytesSent:(int64_t)a5 totalBytesExpectedToSend:(int64_t)a6
{
  __NSURLBackgroundSession *v6;
  _QWORD block[9];

  v6 = self;
  if (self)
    self = (__NSURLBackgroundSession *)self->super._workQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __99____NSURLBackgroundSession_backgroundTask_didSendBodyData_totalBytesSent_totalBytesExpectedToSend___block_invoke;
  block[3] = &unk_1E14FB7C8;
  block[4] = v6;
  block[5] = a3;
  block[6] = a4;
  block[7] = a5;
  block[8] = a6;
  dispatch_async(&self->super.super, block);
}

- (void)backgroundTask:(unint64_t)a3 needNewBodyStream:(BOOL)a4 withReply:(id)a5
{
  NSObject *workQueue;
  _QWORD v6[7];
  BOOL v7;

  if (self)
    workQueue = self->super._workQueue;
  else
    workQueue = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __71____NSURLBackgroundSession_backgroundTask_needNewBodyStream_withReply___block_invoke;
  v6[3] = &unk_1E14F88B0;
  v6[5] = a5;
  v6[6] = a3;
  v7 = a4;
  v6[4] = self;
  dispatch_async(workQueue, v6);
}

- (void)backgroundDataTask:(unint64_t)a3 didReceiveData:(id)a4 withReply:(id)a5
{
  __NSURLBackgroundSession *v5;
  _QWORD v6[8];

  v5 = self;
  if (self)
    self = (__NSURLBackgroundSession *)self->super._workQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __72____NSURLBackgroundSession_backgroundDataTask_didReceiveData_withReply___block_invoke;
  v6[3] = &unk_1E14FCE60;
  v6[4] = v5;
  v6[5] = a4;
  v6[6] = a5;
  v6[7] = a3;
  dispatch_async(&self->super.super, v6);
}

- (void)backgroundTask:(unint64_t)a3 getAuthHeadersForResponse:(id)a4 reply:(id)a5
{
  __NSURLBackgroundSession *v5;
  _QWORD v6[8];

  v5 = self;
  if (self)
    self = (__NSURLBackgroundSession *)self->super._workQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __75____NSURLBackgroundSession_backgroundTask_getAuthHeadersForResponse_reply___block_invoke;
  v6[3] = &unk_1E14FCE60;
  v6[4] = v5;
  v6[5] = a4;
  v6[6] = a5;
  v6[7] = a3;
  dispatch_async(&self->super.super, v6);
}

- (void)backgroundDataTaskDidBecomeDownloadTask:(unint64_t)a3
{
  NSObject *workQueue;
  _QWORD v4[6];

  if (self)
    workQueue = self->super._workQueue;
  else
    workQueue = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __68____NSURLBackgroundSession_backgroundDataTaskDidBecomeDownloadTask___block_invoke;
  v4[3] = &unk_1E14FE140;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(workQueue, v4);
}

- (void)willRetryBackgroundDataTask:(unint64_t)a3 withError:(id)a4 transactionMetrics:(id)a5
{
  __NSURLBackgroundSession *v5;
  _QWORD v6[8];

  v5 = self;
  if (self)
    self = (__NSURLBackgroundSession *)self->super._workQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __85____NSURLBackgroundSession_willRetryBackgroundDataTask_withError_transactionMetrics___block_invoke;
  v6[3] = &unk_1E14FBE88;
  v6[4] = v5;
  v6[5] = a5;
  v6[6] = a4;
  v6[7] = a3;
  dispatch_async(&self->super.super, v6);
}

- (void)backgroundDownloadTask:(unint64_t)a3 didFinishDownloadingToURL:(id)a4 response:(id)a5 reply:(id)a6
{
  __NSURLBackgroundSession *v6;
  _QWORD block[9];

  v6 = self;
  if (self)
    self = (__NSURLBackgroundSession *)self->super._workQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __92____NSURLBackgroundSession_backgroundDownloadTask_didFinishDownloadingToURL_response_reply___block_invoke;
  block[3] = &unk_1E14FCE88;
  block[7] = a6;
  block[8] = a3;
  block[4] = v6;
  block[5] = a5;
  block[6] = a4;
  dispatch_async(&self->super.super, block);
}

- (void)backgroundDownloadTask:(unint64_t)a3 didWriteData:(int64_t)a4 totalBytesWritten:(int64_t)a5 totalBytesExpectedToWrite:(int64_t)a6
{
  __NSURLBackgroundSession *v6;
  _QWORD block[9];

  v6 = self;
  if (self)
    self = (__NSURLBackgroundSession *)self->super._workQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __108____NSURLBackgroundSession_backgroundDownloadTask_didWriteData_totalBytesWritten_totalBytesExpectedToWrite___block_invoke;
  block[3] = &unk_1E14FB7C8;
  block[4] = v6;
  block[5] = a3;
  block[6] = a4;
  block[7] = a5;
  block[8] = a6;
  dispatch_async(&self->super.super, block);
}

- (void)backgroundDownloadTask:(unint64_t)a3 didResumeAtOffset:(int64_t)a4 expectedTotalBytes:(int64_t)a5
{
  __NSURLBackgroundSession *v5;
  _QWORD v6[8];

  v5 = self;
  if (self)
    self = (__NSURLBackgroundSession *)self->super._workQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __88____NSURLBackgroundSession_backgroundDownloadTask_didResumeAtOffset_expectedTotalBytes___block_invoke;
  v6[3] = &unk_1E14FAF58;
  v6[4] = v5;
  v6[5] = a3;
  v6[6] = a4;
  v6[7] = a5;
  dispatch_async(&self->super.super, v6);
}

- (void)openFileAtPath:(id)a3 mode:(int)a4 withReply:(id)a5
{
  (*((void (**)(id, _QWORD))a5 + 2))(a5, 0);
}

- (void)backgroundAVAssetDownloadTaskDidUpdateProgress:(unint64_t)a3 totalBytesWritten:(unint64_t)a4 totalBytesExpectedToWrite:(unint64_t)a5
{
  __NSURLBackgroundSession *v5;
  _QWORD v6[8];

  v5 = self;
  if (self)
    self = (__NSURLBackgroundSession *)self->super._workQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __119____NSURLBackgroundSession_backgroundAVAssetDownloadTaskDidUpdateProgress_totalBytesWritten_totalBytesExpectedToWrite___block_invoke;
  v6[3] = &unk_1E14FAF58;
  v6[4] = v5;
  v6[5] = a3;
  v6[6] = a4;
  v6[7] = a5;
  dispatch_async(&self->super.super, v6);
}

- (void)backgroundAVAssetDownloadTask:(unint64_t)a3 didReceiveDownloadToken:(unint64_t)a4
{
  __NSURLBackgroundSession *v4;
  _QWORD block[7];

  v4 = self;
  if (self)
    self = (__NSURLBackgroundSession *)self->super._workQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __82____NSURLBackgroundSession_backgroundAVAssetDownloadTask_didReceiveDownloadToken___block_invoke;
  block[3] = &unk_1E14FB048;
  block[4] = v4;
  block[5] = a3;
  block[6] = a4;
  dispatch_async(&self->super.super, block);
}

- (void)backgroundAVAssetDownloadTask:(unint64_t)a3 didLoadTimeRange:(id)a4 totalTimeRangesLoaded:(id)a5 timeRangeExpectedToLoad:(id)a6 forMediaSelectionPropertyList:(id)a7
{
  __NSURLBackgroundSession *v7;
  _QWORD v8[10];

  v7 = self;
  if (self)
    self = (__NSURLBackgroundSession *)self->super._workQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __151____NSURLBackgroundSession_backgroundAVAssetDownloadTask_didLoadTimeRange_totalTimeRangesLoaded_timeRangeExpectedToLoad_forMediaSelectionPropertyList___block_invoke;
  v8[3] = &unk_1E14F89B0;
  v8[4] = v7;
  v8[5] = a4;
  v8[6] = a5;
  v8[7] = a6;
  v8[8] = a7;
  v8[9] = a3;
  dispatch_async(&self->super.super, v8);
}

- (void)backgroundAVAssetDownloadTask:(unint64_t)a3 didResolveMediaSelectionProperyList:(id)a4 reply:(id)a5
{
  __NSURLBackgroundSession *v5;
  _QWORD v6[8];

  v5 = self;
  if (self)
    self = (__NSURLBackgroundSession *)self->super._workQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __100____NSURLBackgroundSession_backgroundAVAssetDownloadTask_didResolveMediaSelectionProperyList_reply___block_invoke;
  v6[3] = &unk_1E14FCE60;
  v6[4] = v5;
  v6[5] = a4;
  v6[6] = a5;
  v6[7] = a3;
  dispatch_async(&self->super.super, v6);
}

- (void)backgroundAVAssetDownloadTask:(unint64_t)a3 willDownloadToURL:(id)a4
{
  NSObject *workQueue;
  _QWORD block[7];

  if (self)
    workQueue = self->super._workQueue;
  else
    workQueue = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76____NSURLBackgroundSession_backgroundAVAssetDownloadTask_willDownloadToURL___block_invoke;
  block[3] = &unk_1E14FD950;
  block[5] = a4;
  block[6] = a3;
  block[4] = self;
  dispatch_async(workQueue, block);
}

- (void)backgroundAVAssetDownloadTask:(unint64_t)a3 willDownloadVariants:(id)a4 reply:(id)a5
{
  __NSURLBackgroundSession *v5;
  _QWORD v6[8];

  v5 = self;
  if (self)
    self = (__NSURLBackgroundSession *)self->super._workQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __85____NSURLBackgroundSession_backgroundAVAssetDownloadTask_willDownloadVariants_reply___block_invoke;
  v6[3] = &unk_1E14FCE60;
  v6[4] = v5;
  v6[5] = a4;
  v6[6] = a5;
  v6[7] = a3;
  dispatch_async(&self->super.super, v6);
}

- (void)backgroundAVAssetDownloadTask:(unint64_t)a3 didFinishDownloadForMediaSelectionPropertyList:(id)a4
{
  NSObject *workQueue;
  _QWORD block[7];

  if (self)
    workQueue = self->super._workQueue;
  else
    workQueue = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __105____NSURLBackgroundSession_backgroundAVAssetDownloadTask_didFinishDownloadForMediaSelectionPropertyList___block_invoke;
  block[3] = &unk_1E14FD950;
  block[5] = a4;
  block[6] = a3;
  block[4] = self;
  dispatch_async(workQueue, block);
}

- (void)backgroundSessionDidStartAppWake:(id)a3 reply:(id)a4
{
  __NSURLBackgroundSession *v4;
  _QWORD block[7];

  v4 = self;
  if (self)
    self = (__NSURLBackgroundSession *)self->super._workQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67____NSURLBackgroundSession_backgroundSessionDidStartAppWake_reply___block_invoke;
  block[3] = &unk_1E14FE070;
  block[4] = v4;
  block[5] = a3;
  block[6] = a4;
  dispatch_async(&self->super.super, block);
}

- (void)backgroundSessionDidFinishAppWake:(id)a3 reply:(id)a4
{
  __NSURLBackgroundSession *v4;
  _QWORD block[7];

  v4 = self;
  if (self)
    self = (__NSURLBackgroundSession *)self->super._workQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68____NSURLBackgroundSession_backgroundSessionDidFinishAppWake_reply___block_invoke;
  block[3] = &unk_1E14FE070;
  block[4] = v4;
  block[5] = a3;
  block[6] = a4;
  dispatch_async(&self->super.super, block);
}

- (void)credStorage_allCredentialsWithReply:(id)a3
{
  if (self)
    self = (__NSURLBackgroundSession *)self->super._local_immutable_configuration_ivar;
  (*((void (**)(id, uint64_t))a3 + 2))(a3, objc_msgSend((id)-[__NSURLBackgroundSession URLCredentialStorage](self, "URLCredentialStorage"), "allCredentials"));
}

- (void)credStorage_credentialsForProtectionSpace:(id)a3 reply:(id)a4
{
  if (self)
    self = (__NSURLBackgroundSession *)self->super._local_immutable_configuration_ivar;
  (*((void (**)(id, uint64_t))a4 + 2))(a4, objc_msgSend((id)-[__NSURLBackgroundSession URLCredentialStorage](self, "URLCredentialStorage"), "credentialsForProtectionSpace:", a3));
}

- (void)credStorage_setCredential:(id)a3 forProtectionSpace:(id)a4
{
  if (self)
    self = (__NSURLBackgroundSession *)self->super._local_immutable_configuration_ivar;
  objc_msgSend((id)-[__NSURLBackgroundSession URLCredentialStorage](self, "URLCredentialStorage"), "setCredential:forProtectionSpace:", a3, a4);
}

- (void)credStorage_removeCredential:(id)a3 forProtectionSpace:(id)a4
{
  if (self)
    self = (__NSURLBackgroundSession *)self->super._local_immutable_configuration_ivar;
  objc_msgSend((id)-[__NSURLBackgroundSession URLCredentialStorage](self, "URLCredentialStorage"), "removeCredential:forProtectionSpace:", a3, a4);
}

- (void)credStorage_defaultCredentialForProtectionSpace:(id)a3 reply:(id)a4
{
  void *v5;

  if (self)
    self = (__NSURLBackgroundSession *)self->super._local_immutable_configuration_ivar;
  v5 = (void *)objc_msgSend((id)-[__NSURLBackgroundSession URLCredentialStorage](self, "URLCredentialStorage"), "defaultCredentialForProtectionSpace:", a3);
  if (objc_msgSend(v5, "hasPassword"))
    objc_msgSend(v5, "password");
  (*((void (**)(id, void *))a4 + 2))(a4, v5);
}

- (void)credStorage_setDefaultCredential:(id)a3 forProtectionSpace:(id)a4
{
  if (self)
    self = (__NSURLBackgroundSession *)self->super._local_immutable_configuration_ivar;
  objc_msgSend((id)-[__NSURLBackgroundSession URLCredentialStorage](self, "URLCredentialStorage"), "setDefaultCredential:forProtectionSpace:", a3, a4);
}

- (void)_onqueue_completeInvalidation:(BOOL)a3
{
  OS_dispatch_queue *workQueue;
  _BOOL4 v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  _QWORD aBlock[5];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (self)
  {
    workQueue = self->super._workQueue;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __58____NSURLBackgroundSession__onqueue_completeInvalidation___block_invoke;
    aBlock[3] = &unk_1E14F8A00;
    aBlock[4] = self;
    if (self->_invalidateCallback)
    {
      __58____NSURLBackgroundSession__onqueue_completeInvalidation___block_invoke((uint64_t)aBlock, 0);
    }
    else
    {
      v5 = a3;
      self->_invalidateCallback = _Block_copy(aBlock);
      self->_invalidateQueue = workQueue;
      if (workQueue)
        dispatch_retain((dispatch_object_t)workQueue);
      if (v5)
      {
        v6 = (void *)objc_msgSend((id)-[NSMutableDictionary allValues](self->_tasks, "allValues"), "copy");
        v12 = 0u;
        v13 = 0u;
        v14 = 0u;
        v15 = 0u;
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v7)
        {
          v8 = v7;
          v9 = *(_QWORD *)v13;
          do
          {
            for (i = 0; i != v8; ++i)
            {
              if (*(_QWORD *)v13 != v9)
                objc_enumerationMutation(v6);
              objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "cancel");
            }
            v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
          }
          while (v8);
        }

      }
      -[__NSURLBackgroundSession sendInvalidationRequest]((uint64_t)self);
    }
  }
}

- (NSString)appWakeUUID
{
  return (NSString *)objc_getProperty(self, a2, 240, 1);
}

- (void)setAppWakeUUID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 240);
}

- (void).cxx_destruct
{
  std::shared_ptr<HTTPResponseMessage>::~shared_ptr[abi:nn180100]((uint64_t)&self->_backgroundSessionDidFinishAppWakeBlock);
}

- (void)sendInvalidationRequest
{
  void *v2;
  _QWORD v3[5];

  if (a1)
  {
    v2 = *(void **)(a1 + 168);
    if (v2
      || *(_BYTE *)(a1 + 280)
      && (-[__NSURLBackgroundSession setupXPCConnection](a1),
          -[__NSURLBackgroundSession setupBackgroundSession](a1),
          (v2 = *(void **)(a1 + 168)) != 0))
    {
      v3[0] = MEMORY[0x1E0C809B0];
      v3[1] = 3221225472;
      v3[2] = __51____NSURLBackgroundSession_sendInvalidationRequest__block_invoke;
      v3[3] = &unk_1E14FE118;
      v3[4] = a1;
      objc_msgSend(v2, "invalidateWithReply:", v3);
    }
    else
    {
      -[__NSURLBackgroundSession _onqueue_invokeInvalidateCallback](a1);
    }
  }
}

- (void)_onqueue_invokeInvalidateCallback
{
  uint64_t v1;
  NSObject *v2;
  _QWORD v3[6];

  if (a1)
  {
    v1 = *(_QWORD *)(a1 + 216);
    if (v1)
    {
      if (*(_QWORD *)(a1 + 208))
      {
        *(_QWORD *)(a1 + 216) = 0;
        v2 = *(NSObject **)(a1 + 208);
        *(_QWORD *)(a1 + 208) = 0;
        v3[0] = MEMORY[0x1E0C809B0];
        v3[1] = 3221225472;
        v3[2] = __61____NSURLBackgroundSession__onqueue_invokeInvalidateCallback__block_invoke;
        v3[3] = &unk_1E14FDF00;
        v3[4] = a1;
        v3[5] = v1;
        dispatch_async(v2, v3);
        dispatch_release(v2);
      }
    }
  }
}

- (void)_onqueue_retryDataTaskWithIdentifier:(uint64_t)a1
{
  id *v4;
  id *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  NSObject *v14;
  _BOOL4 v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  _QWORD v19[6];
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v4 = -[__NSURLBackgroundSession taskForIdentifier:]((id *)a1, a2);
    if (!v4)
    {
      v13 = objc_msgSend(*(id *)(a1 + 112), "_isProxySession");
      if (CFNLog::onceToken != -1)
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
      v14 = CFNLog::logger;
      v15 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR);
      if (v13)
      {
        if (!v15)
          return;
        v16 = *(_QWORD *)(a1 + 128);
        *(_DWORD *)buf = 138543618;
        v21 = v16;
        v22 = 2048;
        v23 = a2;
        v17 = "ProxySession <%{public}@> cannot retry background data task with identifier %lu because there is no such task";
      }
      else
      {
        if (!v15)
          return;
        v18 = *(_QWORD *)(a1 + 128);
        *(_DWORD *)buf = 138543618;
        v21 = v18;
        v22 = 2048;
        v23 = a2;
        v17 = "BackgroundSession <%{public}@> cannot retry background data task with identifier %lu because there is no such task";
      }
      _os_log_error_impl(&dword_183ECA000, v14, OS_LOG_TYPE_ERROR, v17, buf, 0x16u);
      return;
    }
    v5 = v4;
    -[__NSCFBackgroundDataTask _onqueue_finishStream:]((uint64_t)v4, 1u);
    v6 = (uint64_t)v5[88];
    if (!v6)
      v6 = (uint64_t)v5[87];
    v7 = objc_msgSend((id)objc_msgSend(v5, "currentRequest"), "URL");
    -[__NSCFURLSessionDelegateWrapper _willRetryBackgroundDataTask:withError:](v6, v5, (void *)objc_msgSend(MEMORY[0x1E0CB35C8], "_web_errorWithDomain:code:URL:", *MEMORY[0x1E0CB32E8], -1005, v7));
    v8 = (id)objc_msgSend((id)objc_msgSend(v5, "currentRequest"), "mutableCopy");
    v9 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v5, "startTime");
    +[NSURLProtocol setProperty:forKey:inRequest:](NSURLProtocol, "setProperty:forKey:inRequest:", objc_msgSend(v9, "numberWithDouble:"), CFSTR("NSURLSessionTaskOriginalStartTimeKey"), v8);
    v10 = *(void **)(a1 + 168);
    v11 = objc_msgSend(v5, "originalRequest");
    v12 = objc_msgSend(v5, "_uniqueIdentifier");
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __65____NSURLBackgroundSession__onqueue_retryDataTaskWithIdentifier___block_invoke;
    v19[3] = &unk_1E14F87A8;
    v19[4] = a1;
    v19[5] = a2;
    objc_msgSend(v10, "dataTaskWithRequest:originalRequest:identifier:uniqueIdentifier:reply:", v8, v11, a2, v12, v19);
    if (objc_msgSend(v5, "_priorityValue"))
      objc_msgSend(*(id *)(a1 + 168), "setPriority:forTaskWithIdentifier:", objc_msgSend(v5, "_priorityValue"), a2);
    if (objc_msgSend(v5, "_bytesPerSecondLimit"))
      objc_msgSend(*(id *)(a1 + 168), "setBytesPerSecondLimit:forTaskWithIdentifier:", objc_msgSend(v5, "_bytesPerSecondLimit"), a2);
    if (objc_msgSend(v5, "_expectedProgressTarget"))
      objc_msgSend(*(id *)(a1 + 168), "setExpectedProgressTarget:forTaskWithIdentifier:", objc_msgSend(v5, "_expectedProgressTarget"), a2);
    if (objc_msgSend(v5, "_TLSMinimumSupportedProtocolVersion"))
      objc_msgSend(*(id *)(a1 + 168), "setTLSMinimumSupportedProtocolVersion:forTaskWithIdentifier:", objc_msgSend(v5, "_TLSMinimumSupportedProtocolVersion"), a2);
    if (objc_msgSend(v5, "_TLSMaximumSupportedProtocolVersion"))
      objc_msgSend(*(id *)(a1 + 168), "setTLSMaximumSupportedProtocolVersion:forTaskWithIdentifier:", objc_msgSend(v5, "_TLSMaximumSupportedProtocolVersion"), a2);
    objc_msgSend(*(id *)(a1 + 168), "resumeTaskWithIdentifier:withProperties:", a2, 0);
  }
}

- (void)setCookiesFromResponse:(void *)a3 forCurrentRequest:(const void *)a4 partitionIdentifier:
{
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  const __CFURL *v14;
  const void *v15;
  int v16;
  int v17;
  const __CFAllocator *v18;
  const __CFArray *CookiesWithResponseMessage;
  const __CFArray *v20;
  _BYTE v21[104];

  if (a1)
  {
    if (objc_msgSend(*(id *)(a1 + 112), "HTTPCookieStorage"))
    {
      v8 = objc_msgSend(*(id *)(a1 + 112), "HTTPShouldSetCookies");
      if (a2)
      {
        if (v8)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v9 = objc_msgSend(a2, "allHeaderFields");
            objc_msgSend(*(id *)(a1 + 112), "HTTPCookieStorage");
            if ((objc_opt_respondsToSelector() & 1) != 0
              && (v10 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 112), "HTTPCookieStorage"), "_cookieStorage")) != 0)
            {
              v11 = v10;
              v12 = (void *)objc_msgSend(a2, "_CFURLResponse");
              if (v12)
              {
                v13 = *(_QWORD *)(objc_msgSend(v12, "_inner") + 88);
                v14 = (const __CFURL *)objc_msgSend(a2, "URL");
                v15 = (const void *)objc_msgSend(a3, "mainDocumentURL");
                v16 = objc_msgSend(*(id *)(a1 + 112), "HTTPCookieAcceptPolicy");
                if (v14)
                {
                  v17 = v16;
                  v18 = CFGetAllocator((CFTypeRef)v11);
                  CookiesWithResponseMessage = _CFHTTPCookieCreateCookiesWithResponseMessage(v18, v13 - 16, v14, a4);
                  if (CookiesWithResponseMessage)
                  {
                    v20 = CookiesWithResponseMessage;
                    if (CFArrayGetCount(CookiesWithResponseMessage) >= 1)
                    {
                      HTTPCookieStoragePolicy::HTTPCookieStoragePolicy((uint64_t)v21, v14, v15, (uint64_t)a4, v17, 1, 0);
                      if (HTTPCookieStorage::Class(void)::sOnce_HTTPCookieStorage != -1)
                        dispatch_once(&HTTPCookieStorage::Class(void)::sOnce_HTTPCookieStorage, &__block_literal_global_9783);
                      HTTPCookieStorage::setCookiesWithPolicy((HTTPCookieStorage *)(v11 + 16), v20, (const HTTPCookieStoragePolicy *)v21);
                      HTTPCookieStoragePolicy::~HTTPCookieStoragePolicy((HTTPCookieStoragePolicy *)v21);
                    }
                    CFRelease(v20);
                  }
                }
              }
            }
            else
            {
              objc_msgSend((id)objc_msgSend(*(id *)(a1 + 112), "HTTPCookieStorage"), "setCookies:forURL:mainDocumentURL:", +[NSHTTPCookie cookiesWithResponseHeaderFields:forURL:](NSHTTPCookie, "cookiesWithResponseHeaderFields:forURL:", v9, objc_msgSend(a2, "URL")), objc_msgSend(a2, "URL"), objc_msgSend(a3, "mainDocumentURL"));
            }
          }
        }
      }
    }
  }
}

- (uint64_t)doesAVAssetDownloadSessionSupportMultipleDownloads
{
  uint64_t result;

  gotLoadHelper_x19__OBJC_CLASS___AVAssetDownloadSession(a1);
  if (objc_opt_class())
    return objc_opt_respondsToSelector() & 1;
  result = _os_crash();
  __break(1u);
  return result;
}

- (void)serializableAVAssetDownloadTaskOptionsFromOptions:(void *)a1 mediaSelections:(void *)a2 downloadConfiguration:(uint64_t)a3
{
  id v6;
  double v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  void *v28;
  CFTypeRef v29;
  const void *DictionaryRepresentation_delayInitStub;
  double v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  if (a1)
    v6 = (id)objc_msgSend(a1, "mutableCopy");
  else
    v6 = (id)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v8 = v6;
  if (!-[__NSURLBackgroundSession doesAVAssetDownloadSessionSupportMultipleDownloads](v7))
  {
    if (!objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("AVAssetDownloadTaskMediaSelectionKey")))
      goto LABEL_29;
    v16 = objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("AVAssetDownloadTaskMediaSelectionKey")), "propertyList");
    v17 = v8;
    v18 = CFSTR("AVAssetDownloadTaskMediaSelectionKey");
    goto LABEL_28;
  }
  if (a2)
  {
    v9 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v10 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v38;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v38 != v12)
            objc_enumerationMutation(a2);
          objc_msgSend(v9, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * i), "propertyList"));
        }
        v11 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
      }
      while (v11);
    }
    v14 = v8;
    v15 = (uint64_t)v9;
    goto LABEL_18;
  }
  if (objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("AVAssetDownloadTaskMediaSelectionKey")))
  {
    v19 = (void *)objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("AVAssetDownloadTaskMediaSelectionKey"));
    v15 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", objc_msgSend(v19, "propertyList"));
    v14 = v8;
LABEL_18:
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v15, CFSTR("AVAssetDownloadSessionMediaSelectionArrayKey"));
  }
  v20 = objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("AVAssetDownloadTaskMediaSelectionsForMultichannelKey"));
  if (!v20)
    goto LABEL_29;
  v21 = (void *)v20;
  v22 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v34;
    do
    {
      for (j = 0; j != v24; ++j)
      {
        if (*(_QWORD *)v34 != v25)
          objc_enumerationMutation(v21);
        objc_msgSend(v22, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * j), "propertyList"));
      }
      v24 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
    }
    while (v24);
  }
  v18 = CFSTR("AVAssetDownloadTaskMediaSelectionsForMultichannelKey");
  v17 = v8;
  v16 = (uint64_t)v22;
LABEL_28:
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v16, v18);
LABEL_29:
  if (a3)
    objc_msgSend(v8, "setObject:forKeyedSubscript:", a3, CFSTR("AVAssetDownloadTaskDownloadConfigurationKey"));
  v27 = (void *)objc_msgSend(v8, "objectForKey:", CFSTR("AVAssetDownloadTaskMinimumRequiredPresentationSizeKey"));
  if (v27)
  {
    v28 = v27;
    if (!strncmp((const char *)objc_msgSend(v27, "objCType"), "{CGSize=dd}", 0x10uLL))
    {
      objc_msgSend(v28, "getValue:", &v32);
      DictionaryRepresentation_delayInitStub = (const void *)CGSizeCreateDictionaryRepresentation_delayInitStub(v32);
      v29 = (id)CFMakeCollectable(DictionaryRepresentation_delayInitStub);
    }
    else
    {
      v29 = 0;
    }
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v29, CFSTR("AVAssetDownloadTaskMinimumRequiredPresentationSizeKey"));
  }
  objc_msgSend(v8, "removeObjectsForKeys:", objc_msgSend((id)objc_msgSend(v8, "keysOfEntriesPassingTest:", &__block_literal_global_156), "allObjects"));
  return v8;
}

- (id)_onqueue_AVAssetDownloadTaskForURLAsset:(uint64_t)a3 URL:(uint64_t)a4 destinationURL:(uint64_t)a5 assetTitle:(uint64_t)a6 assetArtworkData:(void *)a7 options:(uint64_t)a8 downloadConfiguration:(char)a9 enableSPIDelegateCallbacks:
{
  uint64_t v9;
  int v10;
  NSObject *v11;
  _BOOL4 v12;
  uint64_t v13;
  const char *v14;
  __NSCFBackgroundAVAssetDownloadTask *v20;
  uint64_t v21;
  uint64_t v22;
  __NSCFBackgroundAVAssetDownloadTask *v23;
  const char *v24;
  __NSCFBackgroundAVAssetDownloadTask *v25;
  NSString *v26;
  id v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  __NSCFBackgroundAVAssetDownloadTask *v34;
  uint64_t v35;
  uint64_t v36;
  __NSCFBackgroundAVAssetDownloadTask *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  int v41;
  NSObject *v42;
  _BOOL4 v43;
  const char *v44;
  uint64_t v45;
  const char *v46;
  int v47;
  NSObject *v48;
  _BOOL4 v49;
  uint64_t v50;
  const char *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  _QWORD v66[7];
  id newValue;
  _QWORD v68[7];
  uint8_t buf[4];
  uint64_t v70;
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  if (!result)
    return result;
  v9 = (uint64_t)result;
  if (*((_BYTE *)result + 265))
  {
    v10 = objc_msgSend(result[14], "_isProxySession");
    if (CFNLog::onceToken != -1)
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
    v11 = CFNLog::logger;
    v12 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR);
    if (v10)
    {
      if (v12)
      {
        v13 = *(_QWORD *)(v9 + 128);
        *(_DWORD *)buf = 138543362;
        v70 = v13;
        v14 = "ProxySession <%{public}@> attempted to create an AVAssetDownloadTask in a session that has been invalidated";
LABEL_50:
        _os_log_error_impl(&dword_183ECA000, v11, OS_LOG_TYPE_ERROR, v14, buf, 0xCu);
      }
    }
    else if (v12)
    {
      v58 = *(_QWORD *)(v9 + 128);
      *(_DWORD *)buf = 138543362;
      v70 = v58;
      v14 = "BackgroundSession <%{public}@> attempted to create an AVAssetDownloadTask in a session that has been invalidated";
      goto LABEL_50;
    }
    v26 = (NSString *)dyld_program_sdk_at_least();
    if ((_DWORD)v26)
      __URLSESSION_CLIENT_API_MISUSE_INVALIDATED_SESSION__(v26);
    return 0;
  }
  if (!result[34])
  {
    if (a7)
      v28 = (id)objc_msgSend(a7, "mutableCopy");
    else
      v28 = (id)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v29 = v28;
    v65 = a4;
    if (a4)
    {
      if (a2)
      {
LABEL_21:
        v30 = objc_msgSend(a2, "downloadToken");
        v31 = 0;
        v64 = v30;
        if (!a8 && v65 && a4)
        {
          v32 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CFNetworkAVDownload_%@.movpkg"), destinationURLFragment(a2, (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%llu"), v30)));
          v31 = objc_msgSend(-[__NSURLBackgroundSession backgroundDownloadsDirectory](v9), "URLByAppendingPathComponent:isDirectory:", v32, 0);
          if (objc_msgSend((id)objc_msgSend(a2, "URL"), "isFileURL"))
            objc_msgSend(v29, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("AVAssetDownloadSessionLinkAssetURLToDestinationURLKey"));
          objc_msgSend(v29, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("AVAssetDownloadSessionDeleteDownloadWhenAssetFinalizesKey"));
          a3 = 0;
        }
        else
        {
          a3 = 0;
        }
LABEL_30:
        v33 = -[__NSURLBackgroundSession serializableAVAssetDownloadTaskOptionsFromOptions:mediaSelections:downloadConfiguration:](v29, 0, a8);
        v34 = [__NSCFBackgroundAVAssetDownloadTask alloc];
        v35 = objc_msgSend((id)v9, "defaultTaskGroup");
        v36 = *(_QWORD *)(v9 + 160);
        *(_QWORD *)(v9 + 160) = v36 + 1;
        LOBYTE(v61) = a9;
        v37 = -[__NSCFBackgroundAVAssetDownloadTask initWithTaskGroup:URLAsset:URL:destinationURL:temporaryDestinationURL:assetTitle:assetArtworkData:ident:enableSPIDelegateCallbacks:](v34, "initWithTaskGroup:URLAsset:URL:destinationURL:temporaryDestinationURL:assetTitle:assetArtworkData:ident:enableSPIDelegateCallbacks:", v35, a2, a3, v65, v31, a5, a6, v36, v61);
        v38 = *(void **)(v9 + 168);
        if (v38)
        {
          v68[0] = MEMORY[0x1E0C809B0];
          v68[1] = 3221225472;
          v68[2] = __172____NSURLBackgroundSession__onqueue_AVAssetDownloadTaskForURLAsset_URL_destinationURL_assetTitle_assetArtworkData_options_downloadConfiguration_enableSPIDelegateCallbacks___block_invoke;
          v68[3] = &unk_1E14F85E8;
          v68[4] = v9;
          v68[5] = v37;
          v68[6] = a3;
          v39 = objc_msgSend(v38, "synchronousRemoteObjectProxyWithErrorHandler:", v68);
          newValue = 0;
          if (a2)
          {
            v40 = objc_msgSend(a2, "propertyListForNSURLSessionAssetReturningError:", &newValue);
            if (!v40)
            {
              v41 = objc_msgSend(*(id *)(v9 + 112), "_isProxySession");
              if (CFNLog::onceToken != -1)
                dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
              v42 = CFNLog::logger;
              v43 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR);
              if (v41)
              {
                if (v43)
                {
                  v45 = *(_QWORD *)(v9 + 128);
                  *(_DWORD *)buf = 138543362;
                  v70 = v45;
                  v46 = "ProxySession <%{public}@> failed to create a background AVAssetDownloadTask, as URLAsset Propert"
                        "yList could not be serialized.";
                  goto LABEL_60;
                }
              }
              else if (v43)
              {
                v60 = *(_QWORD *)(v9 + 128);
                *(_DWORD *)buf = 138543362;
                v70 = v60;
                v46 = "BackgroundSession <%{public}@> failed to create a background AVAssetDownloadTask, as URLAsset Prop"
                      "ertyList could not be serialized.";
LABEL_60:
                _os_log_error_impl(&dword_183ECA000, v42, OS_LOG_TYPE_ERROR, v46, buf, 0xCu);
                if (!v37)
                  return (id *)v37;
                goto LABEL_53;
              }
              if (v37)
              {
LABEL_53:
                v57 = newValue;
                goto LABEL_54;
              }
              return (id *)v37;
            }
          }
          else
          {
            v40 = MEMORY[0x1E0C9AA70];
          }
          v63 = v31;
          v52 = (void *)v39;
          v53 = v33;
          v54 = -[NSURLSessionTask taskIdentifier](v37, "taskIdentifier");
          v55 = -[NSURLSessionTask _uniqueIdentifier](v37, "_uniqueIdentifier");
          v66[0] = MEMORY[0x1E0C809B0];
          v66[1] = 3221225472;
          v66[2] = __172____NSURLBackgroundSession__onqueue_AVAssetDownloadTaskForURLAsset_URL_destinationURL_assetTitle_assetArtworkData_options_downloadConfiguration_enableSPIDelegateCallbacks___block_invoke_168;
          v66[3] = &unk_1E14F8610;
          v66[4] = v37;
          v66[5] = v9;
          v66[6] = a3;
          LOBYTE(v62) = a9;
          objc_msgSend(v52, "avAssetDownloadTaskWithDownloadToken:URL:destinationURL:temporaryDestinationURL:assetTitle:assetArtworkData:options:assetOptions:identifier:uniqueIdentifier:taskKind:enableSPIDelegateCallbacks:reply:", v64, a3, v65, v63, a5, a6, v53, v40, v54, v55, 3, v62, v66);
          if (!v37)
            return (id *)v37;
          goto LABEL_55;
        }
        v47 = objc_msgSend(*(id *)(v9 + 112), "_isProxySession");
        if (CFNLog::onceToken != -1)
          dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
        v48 = CFNLog::logger;
        v49 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR);
        if (v47)
        {
          if (!v49)
            goto LABEL_47;
          v50 = *(_QWORD *)(v9 + 128);
          *(_DWORD *)buf = 138543362;
          v70 = v50;
          v51 = "ProxySession <%{public}@> failed to create a background AVAssetDownloadTask, as remote session is unavailable";
        }
        else
        {
          if (!v49)
            goto LABEL_47;
          v59 = *(_QWORD *)(v9 + 128);
          *(_DWORD *)buf = 138543362;
          v70 = v59;
          v51 = "BackgroundSession <%{public}@> failed to create a background AVAssetDownloadTask, as remote session is unavailable";
        }
        _os_log_error_impl(&dword_183ECA000, v48, OS_LOG_TYPE_ERROR, v51, buf, 0xCu);
LABEL_47:
        v56 = objc_msgSend(MEMORY[0x1E0CB35C8], "_web_errorWithDomain:code:URL:", *MEMORY[0x1E0CB32E8], -1, a3);
        if (v37)
        {
          v57 = (id)v56;
LABEL_54:
          objc_setProperty_atomic(v37, v44, v57, 776);
LABEL_55:
          objc_msgSend(*(id *)(v9 + 184), "setObject:forKeyedSubscript:", v37, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[NSURLSessionTask taskIdentifier](v37, "taskIdentifier")));
          return (id *)v37;
        }
        return (id *)v37;
      }
    }
    else
    {
      v65 = objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("AVAssetDownloadTaskDestinationURLKey"));
      if (a2)
        goto LABEL_21;
    }
    v64 = 0;
    v31 = 0;
    goto LABEL_30;
  }
  v20 = [__NSCFBackgroundAVAssetDownloadTask alloc];
  v21 = objc_msgSend((id)v9, "defaultTaskGroup");
  v22 = *(_QWORD *)(v9 + 160);
  *(_QWORD *)(v9 + 160) = v22 + 1;
  LOBYTE(v61) = a9;
  v23 = -[__NSCFBackgroundAVAssetDownloadTask initWithTaskGroup:URLAsset:URL:destinationURL:temporaryDestinationURL:assetTitle:assetArtworkData:ident:enableSPIDelegateCallbacks:](v20, "initWithTaskGroup:URLAsset:URL:destinationURL:temporaryDestinationURL:assetTitle:assetArtworkData:ident:enableSPIDelegateCallbacks:", v21, a2, a3, a4, 0, a5, a6, v22, v61);
  v25 = v23;
  if (v23)
    objc_setProperty_atomic(v23, v24, *(id *)(v9 + 272), 776);
  return (id *)v25;
}

- (void)backgroundDownloadsDirectory
{
  void *v2;
  int v3;
  BOOL v4;
  int v5;
  NSObject *v6;
  _BOOL4 v7;
  uint64_t v8;
  const char *v9;
  void *v10;
  void *v11;
  int v12;
  NSObject *v13;
  _BOOL4 v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  int v18;
  NSObject *v19;
  _BOOL4 v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  int v24;
  NSObject *v25;
  _BOOL4 v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  NSObject *v33;
  _BOOL4 v34;
  uint64_t v35;
  const char *v36;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint8_t buf[4];
  uint64_t v44;
  __int16 v45;
  uint64_t v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 248);
  v41 = 0;
  if (v2)
    goto LABEL_2;
  v42 = 0;
  if (!objc_msgSend(*(id *)(a1 + 112), "sharedContainerIdentifier"))
    goto LABEL_34;
  v10 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "containerURLForSecurityApplicationGroupIdentifier:", objc_msgSend(*(id *)(a1 + 112), "sharedContainerIdentifier"));
  if (!v10)
  {
    v18 = objc_msgSend(*(id *)(a1 + 112), "_isProxySession");
    if (CFNLog::onceToken != -1)
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
    v19 = CFNLog::logger;
    v20 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR);
    if (v18)
    {
      if (!v20)
        goto LABEL_34;
      v21 = *(_QWORD *)(a1 + 128);
      v22 = objc_msgSend(*(id *)(a1 + 112), "sharedContainerIdentifier");
      *(_DWORD *)buf = 138543618;
      v44 = v21;
      v45 = 2112;
      v46 = v22;
      v23 = "ProxySession <%{public}@> failed to get URL for container with identifier %@";
    }
    else
    {
      if (!v20)
        goto LABEL_34;
      v39 = *(_QWORD *)(a1 + 128);
      v40 = objc_msgSend(*(id *)(a1 + 112), "sharedContainerIdentifier");
      *(_DWORD *)buf = 138543618;
      v44 = v39;
      v45 = 2112;
      v46 = v40;
      v23 = "BackgroundSession <%{public}@> failed to get URL for container with identifier %@";
    }
    _os_log_error_impl(&dword_183ECA000, v19, OS_LOG_TYPE_ERROR, v23, buf, 0x16u);
LABEL_34:
    v11 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager", v41), "URLForDirectory:inDomain:appropriateForURL:create:error:", 13, 1, 0, 1, &v42);
    if (v42)
    {
      v24 = objc_msgSend(*(id *)(a1 + 112), "_isProxySession");
      if (CFNLog::onceToken != -1)
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
      v25 = CFNLog::logger;
      v26 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR);
      if (v24)
      {
        if (v26)
        {
          v27 = *(_QWORD *)(a1 + 128);
          *(_DWORD *)buf = 138543618;
          v44 = v27;
          v45 = 2112;
          v46 = v42;
          v28 = "ProxySession <%{public}@> failed to get caches directory for app, error: %@";
          goto LABEL_47;
        }
      }
      else if (v26)
      {
        v31 = *(_QWORD *)(a1 + 128);
        *(_DWORD *)buf = 138543618;
        v44 = v31;
        v45 = 2112;
        v46 = v42;
        v28 = "BackgroundSession <%{public}@> failed to get caches directory for app, error: %@";
LABEL_47:
        _os_log_error_impl(&dword_183ECA000, v25, OS_LOG_TYPE_ERROR, v28, buf, 0x16u);
        if (!v11)
          goto LABEL_48;
        goto LABEL_42;
      }
    }
    if (!v11)
      goto LABEL_48;
    goto LABEL_42;
  }
  v11 = (void *)objc_msgSend((id)objc_msgSend(v10, "URLByAppendingPathComponent:", CFSTR("Library")), "URLByAppendingPathComponent:", CFSTR("Caches"));
  if (!v11)
  {
LABEL_48:
    v32 = objc_msgSend(*(id *)(a1 + 112), "_isProxySession", v41);
    if (CFNLog::onceToken != -1)
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
    v33 = CFNLog::logger;
    v34 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR);
    if (v32)
    {
      if (v34)
      {
        v35 = *(_QWORD *)(a1 + 128);
        *(_DWORD *)buf = 138543362;
        v44 = v35;
        v36 = "ProxySession <%{public}@> failed to obtain the Caches directory for this user-context. We will not be able to download.";
LABEL_57:
        _os_log_error_impl(&dword_183ECA000, v33, OS_LOG_TYPE_ERROR, v36, buf, 0xCu);
      }
    }
    else if (v34)
    {
      v38 = *(_QWORD *)(a1 + 128);
      *(_DWORD *)buf = 138543362;
      v44 = v38;
      v36 = "BackgroundSession <%{public}@> failed to obtain the Caches directory for this user-context. We will not be a"
            "ble to download.";
      goto LABEL_57;
    }
    return 0;
  }
LABEL_42:
  v2 = (void *)objc_msgSend(v11, "URLByAppendingPathComponent:", CFSTR("com.apple.nsurlsessiond/Downloads"), v41);
  v29 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle"), "bundleIdentifier");
  if (v29)
    v2 = (void *)objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", v29, 1);
LABEL_2:
  LOBYTE(v42) = 0;
  v3 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager", v41), "fileExistsAtPath:isDirectory:", objc_msgSend(v2, "path"), &v42);
  if (v3)
    v4 = v42 == 0;
  else
    v4 = 0;
  if (v4)
  {
    if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "removeItemAtURL:error:", v2, &v41) & 1) != 0)
      goto LABEL_19;
    v5 = objc_msgSend(*(id *)(a1 + 112), "_isProxySession");
    if (CFNLog::onceToken != -1)
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
    v6 = CFNLog::logger;
    v7 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR);
    if (v5)
    {
      if (!v7)
        goto LABEL_19;
      v8 = *(_QWORD *)(a1 + 128);
      *(_DWORD *)buf = 138543618;
      v44 = v8;
      v45 = 2112;
      v46 = v41;
      v9 = "ProxySession <%{public}@> error removing file at location of downloads directory: %@";
    }
    else
    {
      if (!v7)
        goto LABEL_19;
      v30 = *(_QWORD *)(a1 + 128);
      *(_DWORD *)buf = 138543618;
      v44 = v30;
      v45 = 2112;
      v46 = v41;
      v9 = "BackgroundSession <%{public}@> error removing file at location of downloads directory: %@";
    }
    _os_log_error_impl(&dword_183ECA000, v6, OS_LOG_TYPE_ERROR, v9, buf, 0x16u);
  }
  else if ((v3 & 1) != 0)
  {
    return v2;
  }
LABEL_19:
  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v2, 1, 0, &v41) & 1) == 0)
  {
    v12 = objc_msgSend(*(id *)(a1 + 112), "_isProxySession");
    if (CFNLog::onceToken != -1)
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
    v13 = CFNLog::logger;
    v14 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR);
    if (v12)
    {
      if (v14)
      {
        v15 = *(_QWORD *)(a1 + 128);
        *(_DWORD *)buf = 138543618;
        v44 = v15;
        v45 = 2112;
        v46 = v41;
        v16 = "ProxySession <%{public}@> error creating background downloads directory: %@";
LABEL_27:
        _os_log_error_impl(&dword_183ECA000, v13, OS_LOG_TYPE_ERROR, v16, buf, 0x16u);
      }
    }
    else if (v14)
    {
      v17 = *(_QWORD *)(a1 + 128);
      *(_DWORD *)buf = 138543618;
      v44 = v17;
      v45 = 2112;
      v46 = v41;
      v16 = "BackgroundSession <%{public}@> error creating background downloads directory: %@";
      goto LABEL_27;
    }
  }
  return v2;
}

- (id)_onqueue_dummyTaskForClass:(_QWORD *)a1 withRequest:(Class)a2 error:(void *)a3
{
  id v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;

  v5 = [a2 alloc];
  v6 = a1[20];
  a1[20] = v6 + 1;
  v7 = (void *)objc_msgSend(v5, "initWithOriginalRequest:ident:taskGroup:", 0, v6, objc_msgSend(a1, "defaultTaskGroup"));
  v9 = v7;
  if (v7)
    objc_setProperty_atomic(v7, v8, a3, 776);
  return v9;
}

- (void)moveFileForResumeData:(void *)a3 fromDirectory:(void *)a4 toDirectory:
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  int v13;
  NSObject *v14;
  _BOOL4 v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = copyDecodedResumeData(a2);
  v8 = objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("NSURLSessionResumeInfoTempFileName"));
  if (v8)
  {
    v9 = v8;
    v10 = objc_msgSend(a3, "stringByAppendingPathComponent:", v8);
    v11 = objc_msgSend(a4, "stringByAppendingPathComponent:", v9);
    v19 = 0;
    if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "moveItemAtPath:toPath:error:", v10, v11, &v19) & 1) == 0)
    {
      if (a1)
        v12 = *(void **)(a1 + 112);
      else
        v12 = 0;
      v13 = objc_msgSend(v12, "_isProxySession");
      if (CFNLog::onceToken != -1)
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
      v14 = CFNLog::logger;
      v15 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEBUG);
      if (v13)
      {
        if (v15)
        {
          if (a1)
            v16 = *(_QWORD *)(a1 + 128);
          else
            v16 = 0;
          *(_DWORD *)buf = 138543618;
          v21 = v16;
          v22 = 2112;
          v23 = v19;
          v17 = "ProxySession <%{public}@> error moving resume file: %@";
LABEL_17:
          _os_log_debug_impl(&dword_183ECA000, v14, OS_LOG_TYPE_DEBUG, v17, buf, 0x16u);
        }
      }
      else if (v15)
      {
        if (a1)
          v18 = *(_QWORD *)(a1 + 128);
        else
          v18 = 0;
        *(_DWORD *)buf = 138543618;
        v21 = v18;
        v22 = 2112;
        v23 = v19;
        v17 = "BackgroundSession <%{public}@> error moving resume file: %@";
        goto LABEL_17;
      }
    }
  }

}

- (void)moveFileToTempForBackgroundResumeData:(uint64_t)a1
{
  void *v4;
  void *v5;
  NSString *v6;

  if (a1 && !objc_msgSend(*(id *)(a1 + 112), "_directoryForDownloadedFiles"))
  {
    v4 = -[__NSURLBackgroundSession backgroundDownloadsDirectory](a1);
    if (v4)
    {
      v5 = (void *)objc_msgSend(v4, "path");
      v6 = NSTemporaryDirectory();
      -[__NSURLBackgroundSession moveFileForResumeData:fromDirectory:toDirectory:](a1, a2, v5, v6);
    }
  }
}

@end
