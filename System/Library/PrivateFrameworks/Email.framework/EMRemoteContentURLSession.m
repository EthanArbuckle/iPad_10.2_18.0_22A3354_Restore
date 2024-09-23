@implementation EMRemoteContentURLSession

- (EMRemoteContentURLSession)initWithCache:(id)a3 sourceBundleIdentifier:(id)a4
{
  id v7;
  id v8;
  EMRemoteContentURLSession *v9;
  EMRemoteContentURLSession *v10;
  id v11;
  void *v12;
  uint64_t v13;
  EFLocked *activeTasks;
  id v15;
  void *v16;
  uint64_t v17;
  EFLocked *observers;
  NSOperationQueue *v19;
  NSOperationQueue *delegateQueue;
  objc_super v22;

  v7 = a3;
  v8 = a4;
  v22.receiver = self;
  v22.super_class = (Class)EMRemoteContentURLSession;
  v9 = -[EMRemoteContentURLSession init](&v22, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_cache, a3);
    objc_storeStrong((id *)&v10->_sourceBundleIdentifier, a4);
    v11 = objc_alloc(MEMORY[0x1E0D1EEF0]);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "initWithObject:", v12);
    activeTasks = v10->_activeTasks;
    v10->_activeTasks = (EFLocked *)v13;

    v15 = objc_alloc(MEMORY[0x1E0D1EEF0]);
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "initWithObject:", v16);
    observers = v10->_observers;
    v10->_observers = (EFLocked *)v17;

    v19 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    delegateQueue = v10->_delegateQueue;
    v10->_delegateQueue = v19;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v10->_delegateQueue, "setMaxConcurrentOperationCount:", 1);
    v10->_sessionLock._os_unfair_lock_opaque = 0;
    -[EMRemoteContentURLSession _createURLSession](v10, "_createURLSession");
  }

  return v10;
}

- (void)_createURLSession
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSURLSession *v7;
  NSURLSession *session;
  id v9;

  -[EMRemoteContentURLSession cache](self, "cache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMRemoteContentURLSession sourceBundleIdentifier](self, "sourceBundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMRemoteContentURLSession _configurationWithCache:sourceBundleIdentifier:](self, v3, v4);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x1E0C92C98];
  -[EMRemoteContentURLSession delegateQueue](self, "delegateQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sessionWithConfiguration:delegate:delegateQueue:", v9, self, v6);
  v7 = (NSURLSession *)objc_claimAutoreleasedReturnValue();
  session = self->_session;
  self->_session = v7;

}

- (NSString)sourceBundleIdentifier
{
  return self->_sourceBundleIdentifier;
}

- (NSOperationQueue)delegateQueue
{
  return self->_delegateQueue;
}

- (EMRemoteContentURLCache)cache
{
  return self->_cache;
}

- (id)_configurationWithCache:(void *)a3 sourceBundleIdentifier:
{
  id v5;
  id v6;
  void *v7;

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0C92CA0], "ephemeralSessionConfiguration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    a1 = v7;
    if (v5)
    {
      objc_msgSend(v7, "setRequestCachePolicy:", 2);
      objc_msgSend(a1, "setURLCache:", v5);
    }
    objc_msgSend(a1, "set_sourceApplicationBundleIdentifier:", v6);
    objc_msgSend(a1, "setHTTPShouldSetCookies:", 0);
    objc_msgSend(a1, "setHTTPCookieAcceptPolicy:", 1);
    objc_msgSend(a1, "setHTTPCookieStorage:", 0);
  }

  return a1;
}

- (EMRemoteContentURLSession)initWithCache:(id)a3
{
  return -[EMRemoteContentURLSession initWithCache:sourceBundleIdentifier:](self, "initWithCache:sourceBundleIdentifier:", a3, 0);
}

void ___ef_log_EMRemoteContentURLSession_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.email", "EMRemoteContentURLSession");
  v1 = (void *)_ef_log_EMRemoteContentURLSession_log;
  _ef_log_EMRemoteContentURLSession_log = (uint64_t)v0;

}

+ (NSDictionary)genericHTTPHeaderFields
{
  if (genericHTTPHeaderFields_onceToken != -1)
    dispatch_once(&genericHTTPHeaderFields_onceToken, &__block_literal_global_95);
  return (NSDictionary *)(id)genericHTTPHeaderFields_sHeaderFields;
}

void __52__EMRemoteContentURLSession_genericHTTPHeaderFields__block_invoke()
{
  void *v0;

  v0 = (void *)genericHTTPHeaderFields_sHeaderFields;
  genericHTTPHeaderFields_sHeaderFields = (uint64_t)&unk_1E711F748;

}

- (id)dataTaskWithRequest:(id)a3 isSynthetic:(BOOL)a4 completionHandler:(id)a5
{
  -[EMRemoteContentURLSession dataTaskWithRequest:isSynthetic:allowProxying:failOpen:completionHandler:](self, "dataTaskWithRequest:isSynthetic:allowProxying:failOpen:completionHandler:", a3, a4, 1, 0, a5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)dataTaskWithRequest:(id)a3 isSynthetic:(BOOL)a4 allowProxying:(BOOL)a5 failOpen:(BOOL)a6 completionHandler:(id)a7
{
  _BOOL8 v8;
  _BOOL4 v9;
  _BOOL8 v10;
  id v13;
  NSURLSession *v14;
  uint64_t v15;
  id v16;
  void *v17;
  char v18;
  char v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  void (**v28)(_QWORD);
  NSObject *v29;
  void *v30;
  void *v31;
  _EMRemoteContentDataTaskInfo *v32;
  EFLocked *activeTasks;
  _EMRemoteContentDataTaskInfo *v34;
  void *v35;
  void *v37;
  id v38;
  _QWORD v39[4];
  _EMRemoteContentDataTaskInfo *v40;
  _QWORD v41[4];
  char v42;
  BOOL v43;
  uint8_t buf[4];
  EMRemoteContentURLSession *v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  void *v49;
  uint64_t v50;

  v8 = a6;
  v9 = a5;
  v10 = a4;
  v50 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v38 = a7;
  os_unfair_lock_lock(&self->_sessionLock);
  v14 = self->_session;
  os_unfair_lock_unlock(&self->_sessionLock);
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EMRemoteContentURLSession.m"), 174, CFSTR("New data tasks cannot be created on EMRemoteContentURLSession after it's been invalidated."));

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v15 = objc_msgSend(v13, "mutableCopy");

    v13 = (id)v15;
  }
  v16 = v13;
  if (!v9
    || (objc_msgSend(MEMORY[0x1E0C99EA0], "em_userDefaults"),
        v17 = (void *)objc_claimAutoreleasedReturnValue(),
        v18 = objc_msgSend(v17, "integerForKey:", CFSTR("LoadRemoteContent-v2")),
        v17,
        (v18 & 4) != 0))
  {
    v19 = 0;
  }
  else
  {
    objc_msgSend(v16, "_setKnownTracker:", 1);
    v19 = 1;
    if (!v8)
      objc_msgSend(v16, "_setPrivacyProxyFailClosed:", 1);
  }
  objc_msgSend(v16, "_setNonAppInitiated:", 1);
  objc_msgSend((id)objc_opt_class(), "genericHTTPHeaderFields");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setAllHTTPHeaderFields:", v20);

  objc_msgSend(v16, "setCachePolicy:", 2);
  objc_msgSend(v16, "URL");
  v21 = (id)objc_claimAutoreleasedReturnValue();
  if (+[EMInternalPreferences preferenceEnabled:](EMInternalPreferences, "preferenceEnabled:", 13))
  {
    objc_msgSend(v21, "absoluteString");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v23 = (void *)MEMORY[0x1E0D1EF48];
    objc_msgSend(v21, "absoluteString");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "fullyRedactedStringForString:", v24);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

  }
  _ef_log_EMRemoteContentURLSession();
  v25 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v16, "allHTTPHeaderFields");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    v45 = self;
    v46 = 2114;
    v47 = v22;
    v48 = 2114;
    v49 = v26;
    _os_log_impl(&dword_1B99BB000, v25, OS_LOG_TYPE_INFO, "[%p][Request] URL: %{public}@\nHeaders: %{public}@", buf, 0x20u);

  }
  v27 = MEMORY[0x1E0C809B0];
  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __102__EMRemoteContentURLSession_dataTaskWithRequest_isSynthetic_allowProxying_failOpen_completionHandler___block_invoke;
  v41[3] = &__block_descriptor_34_e15___NSString_8__0l;
  v42 = v19;
  v43 = v8;
  v28 = (void (**)(_QWORD))MEMORY[0x1BCCC8C10](v41);
  _ef_log_EMRemoteContentURLSession();
  v29 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    v28[2](v28);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    v45 = self;
    v46 = 2112;
    v47 = v30;
    v48 = 2114;
    v49 = v22;
    _os_log_impl(&dword_1B99BB000, v29, OS_LOG_TYPE_DEFAULT, "[%p][Proxy] %@ URL: %{public}@", buf, 0x20u);

  }
  -[NSURLSession dataTaskWithRequest:](v14, "dataTaskWithRequest:", v16);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "ec_setActivityWithDomain:type:", 21, 23);
  v32 = -[_EMRemoteContentDataTaskInfo initWithDataTask:isSynthetic:failOpen:completion:]([_EMRemoteContentDataTaskInfo alloc], "initWithDataTask:isSynthetic:failOpen:completion:", v31, v10, v8, v38);
  activeTasks = self->_activeTasks;
  v39[0] = v27;
  v39[1] = 3221225472;
  v39[2] = __102__EMRemoteContentURLSession_dataTaskWithRequest_isSynthetic_allowProxying_failOpen_completionHandler___block_invoke_127;
  v39[3] = &unk_1E70F5A28;
  v34 = v32;
  v40 = v34;
  -[EFLocked performWhileLocked:](activeTasks, "performWhileLocked:", v39);
  -[_EMRemoteContentDataTaskInfo dataTask](v34, "dataTask");
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  return v35;
}

const __CFString *__102__EMRemoteContentURLSession_dataTaskWithRequest_isSynthetic_allowProxying_failOpen_completionHandler___block_invoke(uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 32))
    return CFSTR("Not proxying");
  if (*(_BYTE *)(a1 + 33))
    return CFSTR("Proxying (fail-open)");
  return CFSTR("Proxying");
}

void __102__EMRemoteContentURLSession_dataTaskWithRequest_isSynthetic_allowProxying_failOpen_completionHandler___block_invoke_127(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  v3 = *(void **)(a1 + 32);
  objc_msgSend(v3, "dataTask");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v3, v4);

}

- (void)abortTask:(id)a3
{
  id v4;
  EFLocked *activeTasks;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  activeTasks = self->_activeTasks;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __39__EMRemoteContentURLSession_abortTask___block_invoke;
  v7[3] = &unk_1E70F5A28;
  v6 = v4;
  v8 = v6;
  -[EFLocked performWhileLocked:](activeTasks, "performWhileLocked:", v7);
  objc_msgSend(v6, "cancel");

}

uint64_t __39__EMRemoteContentURLSession_abortTask___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setObject:forKeyedSubscript:", 0, *(_QWORD *)(a1 + 32));
}

- (void)invalidateAndCancel:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_sessionLock;
  NSURLSession *v6;

  v3 = a3;
  p_sessionLock = &self->_sessionLock;
  os_unfair_lock_lock(&self->_sessionLock);
  v6 = self->_session;
  os_unfair_lock_unlock(p_sessionLock);
  if (v3)
    -[NSURLSession invalidateAndCancel](v6, "invalidateAndCancel");
  else
    -[NSURLSession finishTasksAndInvalidate](v6, "finishTasksAndInvalidate");

}

- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4
{
  id v7;
  NSURLSession *v8;
  NSURLSession *session;
  NSObject *v10;
  void *v11;
  void *v12;
  NSURLSession *v13;
  _QWORD v14[4];

  v14[3] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = (NSURLSession *)a3;
  os_unfair_lock_lock(&self->_sessionLock);
  session = self->_session;

  if (session != v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EMRemoteContentURLSession.m"), 263, CFSTR("NSURLSession was invalidated, but was not our NSURLSession!"));

    if (v7)
      goto LABEL_3;
LABEL_7:
    v13 = self->_session;
    self->_session = 0;

    goto LABEL_8;
  }
  if (!v7)
    goto LABEL_7;
LABEL_3:
  _ef_log_EMRemoteContentURLSession();
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v7, "ef_publicDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMRemoteContentURLSession URLSession:didBecomeInvalidWithError:].cold.1((uint64_t)self, v11, (uint64_t)v14, v10);
  }

  -[EMRemoteContentURLSession _createURLSession](self, "_createURLSession");
LABEL_8:
  os_unfair_lock_unlock(&self->_sessionLock);

}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  id v7;
  id v8;
  EFLocked *activeTasks;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *);
  void *v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v7 = a4;
  v8 = a5;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__12;
  v21 = __Block_byref_object_dispose__12;
  v22 = 0;
  activeTasks = self->_activeTasks;
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __64__EMRemoteContentURLSession_URLSession_dataTask_didReceiveData___block_invoke;
  v14 = &unk_1E70F5A50;
  v16 = &v17;
  v10 = v7;
  v15 = v10;
  -[EFLocked performWhileLocked:](activeTasks, "performWhileLocked:", &v11);
  objc_msgSend((id)v18[5], "receiveData:", v8, v11, v12, v13, v14);

  _Block_object_dispose(&v17, 8);
}

void __64__EMRemoteContentURLSession_URLSession_dataTask_didReceiveData___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (void)URLSession:(id)a3 task:(id)a4 didFinishCollectingMetrics:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  EFLocked *activeTasks;
  id v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  EMRemoteContentURLSession *v22;
  uint64_t *v23;
  char v24;
  _QWORD v25[4];
  id v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  v7 = a4;
  v8 = a5;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__12;
  v32 = __Block_byref_object_dispose__12;
  v33 = 0;
  v9 = MEMORY[0x1E0C809B0];
  activeTasks = self->_activeTasks;
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __72__EMRemoteContentURLSession_URLSession_task_didFinishCollectingMetrics___block_invoke;
  v25[3] = &unk_1E70F5A50;
  v27 = &v28;
  v11 = v7;
  v26 = v11;
  -[EFLocked performWhileLocked:](activeTasks, "performWhileLocked:", v25);
  if (v29[5])
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "calendarIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0C996C8]);

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "components:fromDate:", 8760, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "transactionMetrics");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v9;
    v19[1] = 3221225472;
    v19[2] = __72__EMRemoteContentURLSession_URLSession_task_didFinishCollectingMetrics___block_invoke_2;
    v19[3] = &unk_1E70F5A78;
    v23 = &v28;
    v24 = v14;
    v18 = v16;
    v20 = v18;
    v21 = v11;
    v22 = self;
    objc_msgSend(v17, "enumerateObjectsUsingBlock:", v19);

  }
  _Block_object_dispose(&v28, 8);

}

void __72__EMRemoteContentURLSession_URLSession_task_didFinishCollectingMetrics___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setDidCollectMetrics:", 1);
  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "didComplete"))
    objc_msgSend(v6, "setObject:forKeyedSubscript:", 0, *(_QWORD *)(a1 + 32));

}

void __72__EMRemoteContentURLSession_URLSession_task_didFinishCollectingMetrics___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  id v25;
  char v26;
  uint64_t v27;
  const __CFString *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  __CFString *v43;
  void *v44;
  __CFString *v45;
  id v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint64_t v51;
  uint64_t v52;
  id (*v53)(uint64_t);
  void *v54;
  __CFString *v55;
  uint8_t v56[128];
  uint8_t buf[4];
  uint64_t v58;
  __int16 v59;
  const __CFString *v60;
  __int16 v61;
  __CFString *v62;
  _QWORD v63[13];
  _QWORD v64[16];

  v64[13] = *MEMORY[0x1E0C80C00];
  v46 = a2;
  v3 = objc_msgSend(v46, "_privacyStance");
  v63[0] = CFSTR("isSynthetic");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "isSynthetic"));
  v64[0] = objc_claimAutoreleasedReturnValue();
  v63[1] = CFSTR("metrics_resourceFetchType");
  v44 = (void *)v64[0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v46, "resourceFetchType"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v64[1] = v41;
  v63[2] = CFSTR("metrics_privacyStance");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v3);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v64[2] = v42;
  v63[3] = CFSTR("metrics_isCellular");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v46, "isCellular"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v64[3] = v40;
  v63[4] = CFSTR("metrics_isExpensive");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v46, "isExpensive"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v64[4] = v39;
  v63[5] = CFSTR("metrics_isConstrained");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v46, "isConstrained"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v64[5] = v38;
  v63[6] = CFSTR("metrics_countOfResponseBodyBytesAfterDecoding");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v46, "countOfResponseBodyBytesAfterDecoding"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v64[6] = v4;
  v63[7] = CFSTR("time_isGregorian");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 64));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v64[7] = v5;
  v63[8] = CFSTR("time_hour");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "hour"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v64[8] = v6;
  v63[9] = CFSTR("time_month");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "month"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v64[9] = v7;
  v63[10] = CFSTR("time_day");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "day"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v64[10] = v8;
  v63[11] = CFSTR("time_weekOfYear");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "weekOfYear"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v64[11] = v9;
  v63[12] = CFSTR("time_dayOfWeek");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "weekday"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v64[12] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v64, v63, 13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v51 = MEMORY[0x1E0C809B0];
  v52 = 3221225472;
  v53 = __72__EMRemoteContentURLSession_URLSession_task_didFinishCollectingMetrics___block_invoke_3;
  v54 = &unk_1E70F28C0;
  v43 = v11;
  v55 = v43;
  AnalyticsSendEventLazy();
  objc_msgSend(*(id *)(a1 + 40), "originalRequest");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "URL");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  if (+[EMInternalPreferences preferenceEnabled:](EMInternalPreferences, "preferenceEnabled:", 13))
  {
    objc_msgSend(v13, "absoluteString");
    v45 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = (void *)MEMORY[0x1E0D1EF48];
    objc_msgSend(v13, "absoluteString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "fullyRedactedStringForString:", v15);
    v45 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  _ef_log_EMRemoteContentURLSession();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    v36 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)buf = 134218498;
    v58 = v36;
    v59 = 2114;
    v60 = v45;
    v61 = 2114;
    v62 = v43;
    _os_log_debug_impl(&dword_1B99BB000, v16, OS_LOG_TYPE_DEBUG, "[%p][Analytics] URL: %{public}@\n%{public}@", buf, 0x20u);
  }

  if ((_DWORD)v3 == 1)
  {
    objc_msgSend(*(id *)(a1 + 40), "originalRequest");
    v25 = (id)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v25, "_isKnownTracker"))
    {
LABEL_35:

      goto LABEL_36;
    }
    v26 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "failOpen");

    if ((v26 & 1) == 0)
    {
      _ef_log_EMRemoteContentURLSession();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v27 = *(_QWORD *)(a1 + 48);
        *(_DWORD *)buf = 134218242;
        v58 = v27;
        v59 = 2114;
        v60 = v45;
        _os_log_impl(&dword_1B99BB000, v20, OS_LOG_TYPE_DEFAULT, "[%p][Proxy] Used VPN for URL: %{public}@", buf, 0x16u);
      }
      v24 = 2;
      goto LABEL_27;
    }
  }
  else if ((_DWORD)v3 == 3)
  {
    objc_msgSend(*(id *)(a1 + 40), "error");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "ef_underlyingError");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "userInfo");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectForKeyedSubscript:", *MEMORY[0x1E0C92FA8]);
    v20 = objc_claimAutoreleasedReturnValue();

    v21 = (void *)nw_path_copy_parameters();
    if (v21)
    {
      nw_parameters_copy_effective_proxy_config();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (v22)
      {
        if ((nw_proxy_config_is_privacy_proxy() & 1) != 0)
        {

          _ef_log_EMRemoteContentURLSession();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            __72__EMRemoteContentURLSession_URLSession_task_didFinishCollectingMetrics___block_invoke_2_cold_1(a1, (uint64_t)v45, v23);
          v24 = 0;
LABEL_26:

LABEL_27:
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 24), "getObject");
          v49 = 0u;
          v50 = 0u;
          v47 = 0u;
          v48 = 0u;
          v25 = (id)objc_claimAutoreleasedReturnValue();
          v29 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v47, v56, 16);
          if (v29)
          {
            v30 = *(_QWORD *)v48;
            do
            {
              for (i = 0; i != v29; ++i)
              {
                if (*(_QWORD *)v48 != v30)
                  objc_enumerationMutation(v25);
                v32 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
                v33 = *(_QWORD *)(a1 + 48);
                objc_msgSend(v46, "request");
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v34, "URL");
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v32, "remoteContentURLSession:failedToProxyURL:failureReason:", v33, v35, v24);

              }
              v29 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v47, v56, 16);
            }
            while (v29);
          }

          goto LABEL_35;
        }
        v28 = CFSTR("effective proxy config is not privacy proxy");
      }
      else
      {
        v28 = CFSTR("no effective proxy config");
      }

    }
    else
    {
      v28 = CFSTR("no path parameters");
    }
    _ef_log_EMRemoteContentURLSession();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v37 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 134218498;
      v58 = v37;
      v59 = 2114;
      v60 = v28;
      v61 = 2114;
      v62 = v45;
      _os_log_error_impl(&dword_1B99BB000, v23, OS_LOG_TYPE_ERROR, "[%p][Proxy] Unavailable for URL (%{public}@): %{public}@", buf, 0x20u);
    }
    v24 = 1;
    goto LABEL_26;
  }
LABEL_36:

}

id __72__EMRemoteContentURLSession_URLSession_task_didFinishCollectingMetrics___block_invoke_3(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  EFLocked *activeTasks;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  char v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  _BOOL4 v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(uint64_t, int);
  void *v33;
  EMRemoteContentURLSession *v34;
  id v35;
  _QWORD v36[5];
  id v37;
  _QWORD v38[4];
  id v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  uint8_t buf[4];
  EMRemoteContentURLSession *v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  uint64_t v52;
  __int16 v53;
  void *v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  v41 = 0;
  v42 = &v41;
  v43 = 0x3032000000;
  v44 = __Block_byref_object_copy__12;
  v45 = __Block_byref_object_dispose__12;
  v46 = 0;
  v9 = MEMORY[0x1E0C809B0];
  activeTasks = self->_activeTasks;
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __66__EMRemoteContentURLSession_URLSession_task_didCompleteWithError___block_invoke;
  v38[3] = &unk_1E70F5A50;
  v40 = &v41;
  v11 = v7;
  v39 = v11;
  -[EFLocked performWhileLocked:](activeTasks, "performWhileLocked:", v38);
  if (!v42[5])
    goto LABEL_25;
  objc_msgSend(v11, "originalRequest");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "URL");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  if (+[EMInternalPreferences preferenceEnabled:](EMInternalPreferences, "preferenceEnabled:", 13))
  {
    objc_msgSend(v13, "absoluteString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = (void *)MEMORY[0x1E0D1EF48];
    objc_msgSend(v13, "absoluteString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "fullyRedactedStringForString:", v16);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v11, "response");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    _ef_log_EMRemoteContentURLSession();
    v18 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v8, "ef_publicDescription");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v48 = self;
      v49 = 2114;
      v50 = v14;
      v51 = 2114;
      v52 = (uint64_t)v19;
      _os_log_impl(&dword_1B99BB000, v18, OS_LOG_TYPE_INFO, "[%p][Error] URL: %{public}@\nError: %{public}@", buf, 0x20u);

    }
  }
  else
  {
    v20 = objc_opt_respondsToSelector();
    _ef_log_EMRemoteContentURLSession();
    v21 = objc_claimAutoreleasedReturnValue();
    v18 = v21;
    if ((v20 & 1) == 0)
    {
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134218242;
        v48 = self;
        v49 = 2114;
        v50 = v14;
        _os_log_impl(&dword_1B99BB000, v18, OS_LOG_TYPE_INFO, "[%p][Response] URL: %{public}@", buf, 0x16u);
      }
      goto LABEL_15;
    }
    v18 = v21;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      v22 = objc_msgSend(v17, "statusCode");
      objc_msgSend(v17, "_allHTTPHeaderFieldsAsArrays");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218754;
      v48 = self;
      v49 = 2114;
      v50 = v14;
      v51 = 2048;
      v52 = v22;
      v53 = 2114;
      v54 = v23;
      _os_log_impl(&dword_1B99BB000, v18, OS_LOG_TYPE_INFO, "[%p][Response] URL: %{public}@\nStatus Code: %ld\nHeaders: %{public}@", buf, 0x2Au);

    }
  }

LABEL_15:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v24 = v11;
    if (v8 || !v17)
    {
      objc_msgSend(v8, "domain");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v27, "isEqualToString:", *MEMORY[0x1E0CB32E8]))
      {
        v28 = objc_msgSend(v8, "code") == -999;

        if (v28)
        {
          -[EMRemoteContentURLSession cache](self, "cache");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = v9;
          v31 = 3221225472;
          v32 = __66__EMRemoteContentURLSession_URLSession_task_didCompleteWithError___block_invoke_177;
          v33 = &unk_1E70F5AA0;
          v34 = self;
          v35 = v14;
          objc_msgSend(v29, "storeCancelationIfNeededForDataTask:completionHandler:", v24, &v30);

        }
      }
      else
      {

      }
    }
    else
    {
      -[EMRemoteContentURLSession cache](self, "cache");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v42[5], "data");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v36[0] = v9;
      v36[1] = 3221225472;
      v36[2] = __66__EMRemoteContentURLSession_URLSession_task_didCompleteWithError___block_invoke_175;
      v36[3] = &unk_1E70F5AA0;
      v36[4] = self;
      v37 = v14;
      objc_msgSend(v25, "storeResponseIfNeeded:withData:forDataTask:completionHandler:", v17, v26, v24, v36);

    }
  }
  objc_msgSend((id)v42[5], "finishWithError:", v8, v30, v31, v32, v33, v34);

LABEL_25:
  _Block_object_dispose(&v41, 8);

}

void __66__EMRemoteContentURLSession_URLSession_task_didCompleteWithError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setDidComplete:", 1);
  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "didCollectMetrics"))
    objc_msgSend(v6, "setObject:forKeyedSubscript:", 0, *(_QWORD *)(a1 + 32));

}

void __66__EMRemoteContentURLSession_URLSession_task_didCompleteWithError___block_invoke_175(uint64_t a1, int a2)
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    _ef_log_EMRemoteContentURLSession();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v4 = *(_QWORD *)(a1 + 32);
      v5 = *(_QWORD *)(a1 + 40);
      v6 = 134218242;
      v7 = v4;
      v8 = 2114;
      v9 = v5;
      _os_log_impl(&dword_1B99BB000, v3, OS_LOG_TYPE_INFO, "[%p][Cache] Forced caching of response for URL: %{public}@", (uint8_t *)&v6, 0x16u);
    }

  }
}

void __66__EMRemoteContentURLSession_URLSession_task_didCompleteWithError___block_invoke_177(uint64_t a1, int a2)
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    _ef_log_EMRemoteContentURLSession();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v4 = *(_QWORD *)(a1 + 32);
      v5 = *(_QWORD *)(a1 + 40);
      v6 = 134218242;
      v7 = v4;
      v8 = 2114;
      v9 = v5;
      _os_log_impl(&dword_1B99BB000, v3, OS_LOG_TYPE_INFO, "[%p][Cache] Forced caching of cancelation for URL: %{public}@", (uint8_t *)&v6, 0x16u);
    }

  }
}

- (void)registerObserver:(id)a3
{
  id v4;
  EFLocked *observers;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  observers = self->_observers;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __46__EMRemoteContentURLSession_registerObserver___block_invoke;
  v7[3] = &unk_1E70F2CF0;
  v8 = v4;
  v6 = v4;
  -[EFLocked performWhileLocked:](observers, "performWhileLocked:", v7);

}

uint64_t __46__EMRemoteContentURLSession_registerObserver___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "addObject:", *(_QWORD *)(a1 + 32));
}

- (void)unregisterObserver:(id)a3
{
  id v4;
  EFLocked *observers;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  observers = self->_observers;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__EMRemoteContentURLSession_unregisterObserver___block_invoke;
  v7[3] = &unk_1E70F2CF0;
  v8 = v4;
  v6 = v4;
  -[EFLocked performWhileLocked:](observers, "performWhileLocked:", v7);

}

uint64_t __48__EMRemoteContentURLSession_unregisterObserver___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeObject:", *(_QWORD *)(a1 + 32));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_sourceBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_activeTasks, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

- (void)URLSession:(uint64_t)a3 didBecomeInvalidWithError:(NSObject *)a4 .cold.1(uint64_t a1, void *a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a3 = 134218242;
  *(_QWORD *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2114;
  *(_QWORD *)(a3 + 14) = a2;
  OUTLINED_FUNCTION_0_6(&dword_1B99BB000, a4, a3, "[%p][Session] Session was invalidated with error: %{public}@", (uint8_t *)a3);

}

void __72__EMRemoteContentURLSession_URLSession_task_didFinishCollectingMetrics___block_invoke_2_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 48);
  v4 = 134218242;
  v5 = v3;
  v6 = 2114;
  v7 = a2;
  OUTLINED_FUNCTION_0_6(&dword_1B99BB000, a3, (uint64_t)a3, "[%p][Proxy] Failed for URL: %{public}@", (uint8_t *)&v4);
}

@end
