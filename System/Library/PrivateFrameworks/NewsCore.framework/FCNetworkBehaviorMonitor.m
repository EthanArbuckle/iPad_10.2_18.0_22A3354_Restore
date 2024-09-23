@implementation FCNetworkBehaviorMonitor

- (void)operationThrottlerPerformOperation:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = objc_alloc_init(MEMORY[0x1E0D62748]);
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__FCNetworkBehaviorMonitor_operationThrottlerPerformOperation___block_invoke;
  block[3] = &unk_1E463AD10;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(accessQueue, block);
  -[FCKeyValueStore setObject:forKey:](self->_localStore, "setObject:forKey:", v6, CFSTR("sessions"));

}

- (FCNetworkBehaviorMonitor)initWithCacheDirectory:(id)a3
{
  return -[FCNetworkBehaviorMonitor initWithOptions:cacheDirectory:](self, "initWithOptions:cacheDirectory:", 15, a3);
}

void __44__FCNetworkBehaviorMonitor_logNetworkEvent___block_invoke_2(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  id v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t i;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "startTime");
  v3 = v2;
  objc_msgSend(*(id *)(a1 + 32), "dnsDuration");
  v5 = v4;
  objc_msgSend(*(id *)(a1 + 32), "connectDuration");
  v7 = v6;
  objc_msgSend(*(id *)(a1 + 32), "requestDuration");
  v9 = v8;
  objc_msgSend(*(id *)(a1 + 32), "responseDuration");
  v11 = v10;
  v12 = *(void **)(a1 + 40);
  v13 = *(id *)(a1 + 32);
  v14 = v13;
  if (v12)
  {
    v15 = objc_msgSend(v13, "type");
    if ((v15 - 1) >= 0x10)
    {
      if (v15 != 17)
      {
        v19 = 0;
        goto LABEL_13;
      }
      objc_msgSend(v14, "HTTPResponseHeaders");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16;
      v18 = CFSTR("X-Responding-Instance");
    }
    else
    {
      objc_msgSend(v14, "HTTPResponseHeaders");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16;
      v18 = CFSTR("Via");
    }
    objc_msgSend(v16, "objectForKeyedSubscript:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      v20 = objc_msgSend(v19, "rangeOfString:", CFSTR("-"));
      if (v20 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v21 = v20;
        if (qword_1ED0F7EE0 != -1)
          dispatch_once(&qword_1ED0F7EE0, &__block_literal_global_37_0);
        v22 = objc_msgSend(v19, "rangeOfCharacterFromSet:options:range:", _MergedGlobals_148, 4, 0, v21);
        if (v22 != 0x7FFFFFFFFFFFFFFFLL)
        {
          objc_msgSend(v19, "substringWithRange:", v22 + v23, v21 - (v22 + v23));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_14:

          goto LABEL_15;
        }
      }
    }
LABEL_13:
    v12 = 0;
    goto LABEL_14;
  }
LABEL_15:

  v24 = objc_alloc_init(MEMORY[0x1E0D62738]);
  if (v3 != 0.0)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", v3);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setStartTime:", objc_msgSend(v25, "fc_millisecondTimeIntervalSince1970"));

  }
  if (v5 != 0.0)
    objc_msgSend(v24, "setDnsDuration:", (unint64_t)(fmax(v5, 0.0) * 1000.0));
  if (v7 != 0.0)
    objc_msgSend(v24, "setConnectDuration:", (unint64_t)(fmax(v7, 0.0) * 1000.0));
  if (v9 != 0.0)
    objc_msgSend(v24, "setRequestDuration:", (unint64_t)(fmax(v9, 0.0) * 1000.0));
  if (v11 != 0.0)
    objc_msgSend(v24, "setResponseDuration:", (unint64_t)(fmax(v11, 0.0) * 1000.0));
  if (objc_msgSend(*(id *)(a1 + 32), "responseSize"))
    objc_msgSend(v24, "setResponseSize:", objc_msgSend(*(id *)(a1 + 32), "responseSize"));
  if (objc_msgSend(*(id *)(a1 + 32), "HTTPStatusCode"))
    objc_msgSend(v24, "setHttpStatusCode:", objc_msgSend(*(id *)(a1 + 32), "HTTPStatusCode"));
  objc_msgSend(*(id *)(a1 + 32), "error");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "code");

  if (v27)
  {
    objc_msgSend(*(id *)(a1 + 32), "error");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setErrorCode:", objc_msgSend(v28, "code"));

  }
  if (objc_msgSend(*(id *)(a1 + 32), "type"))
    objc_msgSend(v24, "setType:", objc_msgSend(*(id *)(a1 + 32), "type"));
  objc_msgSend(*(id *)(a1 + 32), "URL");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    objc_msgSend(*(id *)(a1 + 32), "URL");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "absoluteString");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setUrl:", v31);

  }
  objc_msgSend(*(id *)(a1 + 32), "requestUUID");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32)
  {
    objc_msgSend(*(id *)(a1 + 32), "requestUUID");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setRequestUUID:", v33);

  }
  if (v12)
    objc_msgSend(v24, "setRespondingPOP:", v12);
  if (objc_msgSend(*(id *)(a1 + 32), "isProxyConnection"))
    objc_msgSend(v24, "setIsProxyConnection:", objc_msgSend(*(id *)(a1 + 32), "isProxyConnection"));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "lastObject");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v34, "sessionID"))
    objc_msgSend(v24, "setSessionID:", objc_msgSend(v34, "sessionID"));
  v35 = *(_QWORD *)(a1 + 40);
  v36 = *(_QWORD *)(v35 + 64);
  if ((v36 & 2) == 0)
  {
    if ((v36 & 4) == 0)
      goto LABEL_45;
LABEL_56:
    objc_msgSend(*(id *)(v35 + 32), "addObject:", v24, (_QWORD)v42);
    v35 = *(_QWORD *)(a1 + 40);
    if ((*(_QWORD *)(v35 + 64) & 8) == 0)
      goto LABEL_47;
    goto LABEL_46;
  }
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v37 = *(id *)(v35 + 56);
  v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
  if (v38)
  {
    v39 = v38;
    v40 = *(_QWORD *)v43;
    do
    {
      for (i = 0; i != v39; ++i)
      {
        if (*(_QWORD *)v43 != v40)
          objc_enumerationMutation(v37);
        objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * i), "networkEventMonitor:loggedEvent:inSession:", *(_QWORD *)(a1 + 40), v24, v34, (_QWORD)v42);
      }
      v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
    }
    while (v39);
  }

  v35 = *(_QWORD *)(a1 + 40);
  v36 = *(_QWORD *)(v35 + 64);
  if ((v36 & 4) != 0)
    goto LABEL_56;
LABEL_45:
  if ((v36 & 8) != 0)
LABEL_46:
    objc_msgSend(*(id *)(v35 + 48), "tickle", (_QWORD)v42);
LABEL_47:

}

- (void)logNetworkEvent:(id)a3
{
  id v4;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  const char *v20;
  void *v21;
  uint64_t v22;
  NSObject *accessQueue;
  NSObject *v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  FCNetworkBehaviorMonitor *v28;
  uint8_t buf[4];
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (!self)
    goto LABEL_11;
  objc_msgSend(v4, "startTime");
  if (v6 == 0.0)
  {
LABEL_8:

    goto LABEL_9;
  }
  objc_msgSend(v5, "error");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "fc_isCancellationError"))
  {
LABEL_7:

    goto LABEL_8;
  }
  objc_msgSend(v5, "error");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "domain");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0CB32E8]))
  {

LABEL_11:
    goto LABEL_12;
  }
  objc_msgSend(v5, "error");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "code") == -1005)
  {

    goto LABEL_7;
  }
  objc_msgSend(v5, "error");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "code");

  if (v22 == -1009)
    goto LABEL_9;
LABEL_12:
  objc_msgSend(v5, "error");
  v11 = objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = (void *)v11;
    objc_msgSend(v5, "error");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "fc_isRecoverableNetworkError");

    if (v14)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[FCNetworkBehaviorMonitor setDateOfLastNetworkIssue:](self, "setDateOfLastNetworkIssue:", v15);

    }
  }
  if ((self->_options & 1) == 0)
    goto LABEL_28;
  objc_msgSend(v5, "error");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = FCNetworkLog;
  if (v16)
  {
    if (os_log_type_enabled((os_log_t)FCNetworkLog, OS_LOG_TYPE_ERROR))
    {
      v24 = v17;
      objc_msgSend(v5, "description");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v30 = v25;
      _os_log_error_impl(&dword_1A1B90000, v24, OS_LOG_TYPE_ERROR, "logged network event: %{public}@. This log is being duplicated as an default-level log.", buf, 0xCu);

      v17 = FCNetworkLog;
    }
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      goto LABEL_28;
    v18 = v17;
    objc_msgSend(v5, "description");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v30 = v19;
    v20 = "logged network event: %{public}@. This log is being duplicated as an error-level log.";
  }
  else
  {
    if (os_log_type_enabled((os_log_t)FCNetworkLog, OS_LOG_TYPE_DEBUG))
    {
      v18 = v17;
      objc_msgSend(v5, "debugDescription");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v30 = v19;
      _os_log_debug_impl(&dword_1A1B90000, v18, OS_LOG_TYPE_DEBUG, "logged network event: %{public}@", buf, 0xCu);
      goto LABEL_27;
    }
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      goto LABEL_28;
    v18 = v17;
    objc_msgSend(v5, "description");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v30 = v19;
    v20 = "logged network event: %{public}@";
  }
  _os_log_impl(&dword_1A1B90000, v18, OS_LOG_TYPE_DEFAULT, v20, buf, 0xCu);
LABEL_27:

LABEL_28:
  if ((self->_options & 6) != 0)
  {
    accessQueue = self->_accessQueue;
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __44__FCNetworkBehaviorMonitor_logNetworkEvent___block_invoke_2;
    v26[3] = &unk_1E463AD10;
    v27 = v5;
    v28 = self;
    dispatch_async(accessQueue, v26);

  }
LABEL_9:

}

- (id)initForLoggingOnly
{
  return -[FCNetworkBehaviorMonitor initWithOptions:cacheDirectory:](self, "initWithOptions:cacheDirectory:", 1, 0);
}

void __63__FCNetworkBehaviorMonitor_operationThrottlerPerformOperation___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "fc_trimFromFrontToMaxCount:", 2500);
  v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "mutableCopy");
  objc_msgSend(*(id *)(a1 + 40), "setNetworkSessions:", v2);

  v3 = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "mutableCopy");
  objc_msgSend(*(id *)(a1 + 40), "setNetworkEvents:", v3);

}

void __52__FCNetworkBehaviorMonitor__respondingPOPFromEvent___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR(": "));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_MergedGlobals_148;
  _MergedGlobals_148 = v0;

}

- (void)addObserver:(id)a3
{
  void *v4;
  id v5;

  v4 = (void *)MEMORY[0x1E0CB3978];
  v5 = a3;
  objc_msgSend(v4, "isMainThread");
  -[NSHashTable addObject:](self->_observers, "addObject:", v5);

}

- (FCNetworkBehaviorMonitor)init
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Do not call method"));
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCNetworkBehaviorMonitor init]";
    v9 = 2080;
    v10 = "FCNetworkBehaviorMonitor.m";
    v11 = 1024;
    v12 = 100;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCNetworkBehaviorMonitor init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (FCNetworkBehaviorMonitor)initWithOptions:(int64_t)a3 cacheDirectory:(id)a4
{
  id v6;
  FCNetworkBehaviorMonitor *v7;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *accessQueue;
  NSMutableArray *v11;
  NSMutableArray *sessions;
  NSMutableIndexSet *v13;
  NSMutableIndexSet *sessionIDsThisLaunch;
  NSMutableArray *v15;
  NSMutableArray *events;
  uint64_t v17;
  NSHashTable *observers;
  void *v19;
  FCTimedOperationThrottler *v20;
  FCOperationThrottler *saveThrottler;
  NSObject *v22;
  _QWORD v24[4];
  FCNetworkBehaviorMonitor *v25;
  id v26;
  objc_super v27;

  v6 = a4;
  v27.receiver = self;
  v27.super_class = (Class)FCNetworkBehaviorMonitor;
  v7 = -[FCNetworkBehaviorMonitor init](&v27, sel_init);
  if (v7)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_queue_create("FCNetworkBehaviorMonitor.accessQueue", v8);
    accessQueue = v7->_accessQueue;
    v7->_accessQueue = (OS_dispatch_queue *)v9;

    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    sessions = v7->_sessions;
    v7->_sessions = v11;

    v13 = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x1E0CB3788]);
    sessionIDsThisLaunch = v7->_sessionIDsThisLaunch;
    v7->_sessionIDsThisLaunch = v13;

    v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    events = v7->_events;
    v7->_events = v15;

    objc_msgSend(MEMORY[0x1E0CB3690], "hashTableWithOptions:", 517);
    v17 = objc_claimAutoreleasedReturnValue();
    observers = v7->_observers;
    v7->_observers = (NSHashTable *)v17;

    v7->_options = a3;
    +[FCNetworkReachability sharedNetworkReachability](FCNetworkReachability, "sharedNetworkReachability");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObserver:", v7);

    if (v6 && (v7->_options & 8) != 0)
    {
      v20 = -[FCTimedOperationThrottler initWithDelegate:]([FCTimedOperationThrottler alloc], "initWithDelegate:", v7);
      -[FCTimedOperationThrottler setCooldownTime:](v20, "setCooldownTime:", 2.0);
      saveThrottler = v7->_saveThrottler;
      v7->_saveThrottler = (FCOperationThrottler *)v20;

    }
    v22 = v7->_accessQueue;
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __59__FCNetworkBehaviorMonitor_initWithOptions_cacheDirectory___block_invoke;
    v24[3] = &unk_1E463AD10;
    v25 = v7;
    v26 = v6;
    dispatch_async(v22, v24);

  }
  return v7;
}

void __59__FCNetworkBehaviorMonitor_initWithOptions_cacheDirectory___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  FCKeyValueStoreClassRegistry *v5;
  FCKeyValueStore *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  id v33;
  _QWORD v34[4];
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0D62740]);
  objc_msgSend(v2, "setSessionID:", 0);
  +[FCNetworkReachability sharedNetworkReachability](FCNetworkReachability, "sharedNetworkReachability");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWifiReachable:", objc_msgSend(v3, "isNetworkReachableViaWiFi"));

  +[FCNetworkReachability sharedNetworkReachability](FCNetworkReachability, "sharedNetworkReachability");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setCellularRadioAccessTechnology:", objc_msgSend(v4, "cellularRadioAccessTechnology"));

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "addObject:", v2);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "addIndex:", objc_msgSend(v2, "sessionID"));
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 64) & 8) != 0 && *(_QWORD *)(a1 + 40))
  {
    v5 = objc_alloc_init(FCKeyValueStoreClassRegistry);
    -[FCKeyValueStoreClassRegistry registerClass:](v5, "registerClass:", objc_opt_class());
    v6 = -[FCKeyValueStore initWithName:directory:version:options:classRegistry:]([FCKeyValueStore alloc], "initWithName:directory:version:options:classRegistry:", CFSTR("network-behavior-monitor"), *(_QWORD *)(a1 + 40), 8, 0, v5);
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "objectForKey:", CFSTR("sessions"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "networkSessions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");

    if (v11)
    {
      v12 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
      objc_msgSend(v9, "networkSessions");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "fc_insertObjects:atIndex:", v13, 0);

      objc_msgSend(v9, "networkSessions");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "lastObject");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "sessionID") + 1;
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "lastObject");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setSessionID:", v16);

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeIndex:", 0);
      v18 = *(_QWORD *)(a1 + 32);
      v19 = *(void **)(v18 + 24);
      objc_msgSend(*(id *)(v18 + 16), "lastObject");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "addIndex:", objc_msgSend(v20, "sessionID"));

    }
    objc_msgSend(v9, "networkEvents");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "count");

    if (v22)
    {
      v23 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
      objc_msgSend(v9, "networkEvents");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "fc_insertObjects:atIndex:", v24, 0);

    }
    if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "count"))
    {
      objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = 0u;
      v39 = 0u;
      v36 = 0u;
      v37 = 0u;
      v26 = *(id *)(*(_QWORD *)(a1 + 32) + 32);
      v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
      if (v27)
      {
        v28 = v27;
        v29 = *(_QWORD *)v37;
        do
        {
          v30 = 0;
          do
          {
            if (*(_QWORD *)v37 != v29)
              objc_enumerationMutation(v26);
            objc_msgSend(v25, "addIndex:", objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * v30++), "sessionID"));
          }
          while (v28 != v30);
          v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
        }
        while (v28);
      }

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "lastObject");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "addIndex:", objc_msgSend(v31, "sessionID"));

      v32 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
      v34[0] = MEMORY[0x1E0C809B0];
      v34[1] = 3221225472;
      v34[2] = __59__FCNetworkBehaviorMonitor_initWithOptions_cacheDirectory___block_invoke_2;
      v34[3] = &unk_1E463EC48;
      v35 = v25;
      v33 = v25;
      objc_msgSend(v32, "fc_removeObjectsPassingTest:", v34);

    }
  }

}

uint64_t __59__FCNetworkBehaviorMonitor_initWithOptions_cacheDirectory___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsIndex:", objc_msgSend(a2, "sessionID")) ^ 1;
}

- (void)populateTelemetry:(id)a3 withNetworkEventsFromDate:(id)a4 toDate:(id)a5
{
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v8 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __79__FCNetworkBehaviorMonitor_populateTelemetry_withNetworkEventsFromDate_toDate___block_invoke;
  v10[3] = &unk_1E463EC70;
  v11 = v8;
  v9 = v8;
  -[FCNetworkBehaviorMonitor _visitEventGroupsFromDate:toDate:block:]((uint64_t)self, a4, a5, v10);

}

uint64_t __79__FCNetworkBehaviorMonitor_populateTelemetry_withNetworkEventsFromDate_toDate___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addNetworkEventGroups:", a2);
}

- (void)_visitEventGroupsFromDate:(void *)a3 toDate:(void *)a4 block:
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  _QWORD block[5];
  id v13;
  uint64_t v14;
  uint64_t v15;

  v11 = a4;
  if (a1)
  {
    v7 = a3;
    v8 = objc_msgSend(a2, "fc_millisecondTimeIntervalSince1970");
    v9 = objc_msgSend(v7, "fc_millisecondTimeIntervalSince1970");

    v10 = *(NSObject **)(a1 + 8);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __67__FCNetworkBehaviorMonitor__visitEventGroupsFromDate_toDate_block___block_invoke;
    block[3] = &unk_1E463ED60;
    block[4] = a1;
    v14 = v8;
    v15 = v9;
    v13 = v11;
    dispatch_sync(v10, block);

  }
}

- (NSArray)sessions
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __36__FCNetworkBehaviorMonitor_sessions__block_invoke;
  v8[3] = &unk_1E463EC70;
  v9 = v3;
  v4 = v3;
  -[FCNetworkBehaviorMonitor _visitEventGroupsFromDate:toDate:block:]((uint64_t)self, 0, 0, v8);
  objc_msgSend(v4, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sortedArrayUsingComparator:", &__block_literal_global_30);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v6;
}

void __36__FCNetworkBehaviorMonitor_sessions__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  FCNetworkSession *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  v5 = a3;
  v6 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v5, "sessionID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v8 = (FCNetworkSession *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v8 = objc_alloc_init(FCNetworkSession);
    -[FCNetworkSession setWifiReachable:](v8, "setWifiReachable:", objc_msgSend(v5, "wifiReachable"));
    -[FCNetworkSession setCellularRadioAccessTechnology:](v8, "setCellularRadioAccessTechnology:", (int)objc_msgSend(v5, "cellularRadioAccessTechnology"));
    v9 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v5, "sessionID"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, v10);

  }
  -[FCNetworkSession addEventGroup:](v8, "addEventGroup:", v11);

}

uint64_t __36__FCNetworkBehaviorMonitor_sessions__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a2;
  objc_msgSend(a3, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (NSArray)networkEvents
{
  NSObject *accessQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__19;
  v10 = __Block_byref_object_dispose__19;
  v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __41__FCNetworkBehaviorMonitor_networkEvents__block_invoke;
  v5[3] = &unk_1E463AD80;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

void __41__FCNetworkBehaviorMonitor_networkEvents__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[5];

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 32);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __41__FCNetworkBehaviorMonitor_networkEvents__block_invoke_2;
  v7[3] = &unk_1E463ECB8;
  v7[4] = v2;
  objc_msgSend(v3, "fc_arrayOfObjectsPassingTest:", v7);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

uint64_t __41__FCNetworkBehaviorMonitor_networkEvents__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "containsIndex:", objc_msgSend(a2, "sessionID"));
}

- (void)removeObserver:(id)a3
{
  void *v4;
  id v5;

  v4 = (void *)MEMORY[0x1E0CB3978];
  v5 = a3;
  objc_msgSend(v4, "isMainThread");
  -[NSHashTable removeObject:](self->_observers, "removeObject:", v5);

}

void __67__FCNetworkBehaviorMonitor__visitEventGroupsFromDate_toDate_block___block_invoke(_QWORD *a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __objc2_class **v6;
  uint64_t v7;
  void *v8;
  id v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __objc2_class **v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  uint64_t v36;
  void *v37;
  id obj;
  id obja;
  void *v40;
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
  objc_msgSend(*(id *)(a1[4] + 16), "fc_dictionaryWithKeyBlock:", &__block_literal_global_42);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  obj = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v2 = *(id *)(a1[4] + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v46;
    v6 = off_1E4634000;
    v33 = *(_QWORD *)v46;
    v35 = v2;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v46 != v5)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * v7);
        if ((!a1[6] || (unint64_t)objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * v7), "startTime") >= a1[6])
          && (!a1[7] || (unint64_t)objc_msgSend(v8, "startTime") < a1[7]))
        {
          v9 = objc_alloc_init(v6[290]);
          v10 = objc_msgSend(v8, "type");
          if (v9)
          {
            *((_DWORD *)v9 + 2) = v10;
            *((_QWORD *)v9 + 2) = objc_msgSend(v8, "sessionID");
            objc_msgSend(v8, "respondingPOP");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_storeStrong((id *)v9 + 3, v11);
          }
          else
          {
            objc_msgSend(v8, "sessionID");
            objc_msgSend(v8, "respondingPOP");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
          }

          objc_msgSend(obj, "objectForKeyedSubscript:", v9);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v12)
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v8, "sessionID"));
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "objectForKeyedSubscript:", v13);
            v14 = (void *)objc_claimAutoreleasedReturnValue();

            v15 = v6;
            v16 = objc_alloc_init(MEMORY[0x1E0D62858]);
            objc_msgSend(v16, "setEventType:", objc_msgSend(v8, "pbNetworkEventType"));
            objc_msgSend(v8, "respondingPOP");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "setRespondingPop:", v17);

            objc_msgSend(v16, "setWifiReachabilityStatus:", objc_msgSend(v14, "wifiReachable"));
            objc_msgSend(v16, "setCellularRadioAccessTechnology:", objc_msgSend(v14, "cellularRadioAccessTechnology"));
            objc_msgSend(obj, "setObject:forKeyedSubscript:", v16, v9);
            objc_msgSend(v37, "setObject:forKeyedSubscript:", v14, v9);
            objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "setObject:forKeyedSubscript:", v18, v9);

            v2 = v35;
            v6 = v15;
            v5 = v33;

          }
          objc_msgSend(v40, "objectForKeyedSubscript:", v9);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "addObject:", v8);

        }
        ++v7;
      }
      while (v4 != v7);
      v20 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
      v4 = v20;
    }
    while (v20);
  }

  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  obja = obj;
  v36 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
  if (v36)
  {
    v34 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v36; ++i)
      {
        if (*(_QWORD *)v42 != v34)
          objc_enumerationMutation(obja);
        v22 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * i);
        objc_msgSend(obja, "objectForKeyedSubscript:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "objectForKeyedSubscript:", v22);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "objectForKeyedSubscript:", v22);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "fc_arrayOfObjectsPassingTest:", &__block_literal_global_45_3);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "fc_arrayOfObjectsFailingTest:", &__block_literal_global_45_3);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "fc_arrayByTransformingWithBlock:", &__block_literal_global_47_1);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = (void *)objc_msgSend(v28, "mutableCopy");
        objc_msgSend(v23, "setSuccesses:", v29);

        objc_msgSend(v27, "fc_arrayByTransformingWithBlock:", &__block_literal_global_47_1);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = (void *)objc_msgSend(v30, "mutableCopy");
        objc_msgSend(v23, "setFailures:", v31);

        (*(void (**)(void))(a1[5] + 16))();
      }
      v36 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
    }
    while (v36);
  }

}

uint64_t __67__FCNetworkBehaviorMonitor__visitEventGroupsFromDate_toDate_block___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(a2, "sessionID"));
}

uint64_t __67__FCNetworkBehaviorMonitor__visitEventGroupsFromDate_toDate_block___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isSuccess");
}

id __67__FCNetworkBehaviorMonitor__visitEventGroupsFromDate_toDate_block___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v2 = a2;
  v3 = objc_alloc_init(MEMORY[0x1E0D62850]);
  if (objc_msgSend(v2, "startTime"))
    objc_msgSend(v3, "setStartTime:", objc_msgSend(v2, "startTime"));
  if (objc_msgSend(v2, "dnsDuration"))
    objc_msgSend(v3, "setDnsDuration:", objc_msgSend(v2, "dnsDuration"));
  if (objc_msgSend(v2, "connectDuration"))
    objc_msgSend(v3, "setConnectDuration:", objc_msgSend(v2, "connectDuration"));
  if (objc_msgSend(v2, "requestDuration"))
    objc_msgSend(v3, "setRequestDuration:", objc_msgSend(v2, "requestDuration"));
  if (objc_msgSend(v2, "responseDuration"))
    objc_msgSend(v3, "setResponseDuration:", objc_msgSend(v2, "responseDuration"));
  if (objc_msgSend(v2, "responseSize"))
    objc_msgSend(v3, "setResponseSize:", objc_msgSend(v2, "responseSize"));
  if (objc_msgSend(v2, "cacheState"))
    objc_msgSend(v3, "setCacheState:", objc_msgSend(v2, "pbNetworkEventCacheState"));
  if (objc_msgSend(v2, "httpStatusCode"))
    objc_msgSend(v3, "setHttpStatusCode:", objc_msgSend(v2, "httpStatusCode"));
  if (objc_msgSend(v2, "errorCode"))
    objc_msgSend(v3, "setErrorCode:", objc_msgSend(v2, "errorCode"));

  return v3;
}

- (void)wifiReachabilityDidChange:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  uint64_t v7;
  NSObject *accessQueue;
  id v9;
  _QWORD v10[4];
  id v11;
  FCNetworkBehaviorMonitor *v12;

  v4 = (objc_class *)MEMORY[0x1E0D62740];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  objc_msgSend(v6, "setWifiReachable:", objc_msgSend(v5, "isNetworkReachableViaWiFi"));
  v7 = objc_msgSend(v5, "cellularRadioAccessTechnology");

  objc_msgSend(v6, "setCellularRadioAccessTechnology:", v7);
  accessQueue = self->_accessQueue;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __54__FCNetworkBehaviorMonitor_wifiReachabilityDidChange___block_invoke;
  v10[3] = &unk_1E463AD10;
  v11 = v6;
  v12 = self;
  v9 = v6;
  dispatch_async(accessQueue, v10);

}

uint64_t __54__FCNetworkBehaviorMonitor_wifiReachabilityDidChange___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "lastObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setSessionID:", objc_msgSend(v2, "sessionID") + 1);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "addObject:", *(_QWORD *)(a1 + 32));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "addIndex:", objc_msgSend(*(id *)(a1 + 32), "sessionID"));
}

- (NSDate)dateOfLastNetworkIssue
{
  return (NSDate *)objc_getProperty(self, a2, 72, 1);
}

- (void)setDateOfLastNetworkIssue:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateOfLastNetworkIssue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_saveThrottler, 0);
  objc_storeStrong((id *)&self->_localStore, 0);
  objc_storeStrong((id *)&self->_events, 0);
  objc_storeStrong((id *)&self->_sessionIDsThisLaunch, 0);
  objc_storeStrong((id *)&self->_sessions, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

@end
