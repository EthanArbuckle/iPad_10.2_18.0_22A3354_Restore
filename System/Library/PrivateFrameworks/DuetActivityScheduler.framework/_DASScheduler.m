@implementation _DASScheduler

- (NSXPCConnection)xpcConnection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 24, 1);
}

- (void)unprotectedEstablishDaemonConnectionIfInterrupted
{
  NSObject *v3;
  _BOOL4 interrupted;
  void *v5;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (self->_interrupted)
  {
    objc_msgSend((id)objc_opt_class(), "log");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      interrupted = self->_interrupted;
      v6[0] = 67109120;
      v6[1] = interrupted;
      _os_log_impl(&dword_1B0DF4000, v3, OS_LOG_TYPE_DEFAULT, "Establish daemon connection; interrupted: %d",
        (uint8_t *)v6,
        8u);
    }

    -[_DASScheduler setupXPCConnectionWithEndpoint:](self, "setupXPCConnectionWithEndpoint:", self->_endpoint);
    -[_DASScheduler resubmitRunningActivities](self, "resubmitRunningActivities");
    -[_DASScheduler resubmitPendingStartActivities](self, "resubmitPendingStartActivities");
    -[_DASScheduler resubmitPendingActivities](self, "resubmitPendingActivities");
    -[_DASScheduler backgroundTaskSchedulerDelegate](self, "backgroundTaskSchedulerDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
      -[_DASScheduler connectToDaemon:](self, "connectToDaemon:", 1);
  }
}

+ (id)log
{
  if (log_onceToken != -1)
    dispatch_once(&log_onceToken, &__block_literal_global_333);
  return (id)log_log;
}

- (void)handleNoLongerRunningActivities:(id)a3
{
  _DASScheduler *v4;
  NSMutableDictionary *submittedActivities;
  void *v6;
  NSMutableDictionary *delayedStartTasks;
  void *v8;
  NSMutableDictionary *startedActivities;
  void *v10;
  NSMutableDictionary *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v4 = self;
  objc_sync_enter(v4);
  submittedActivities = v4->_submittedActivities;
  objc_msgSend(v15, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectForKey:](submittedActivities, "removeObjectForKey:", v6);

  delayedStartTasks = v4->_delayedStartTasks;
  objc_msgSend(v15, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectForKey:](delayedStartTasks, "removeObjectForKey:", v8);

  startedActivities = v4->_startedActivities;
  objc_msgSend(v15, "uuid");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectForKey:](startedActivities, "removeObjectForKey:", v10);

  objc_sync_exit(v4);
  v11 = v4->_activityToDataMap;
  objc_sync_enter(v11);
  -[NSMutableDictionary objectForKeyedSubscript:](v4->_activityToDataMap, "objectForKeyedSubscript:", v15);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    -[_DASScheduler currentConnection](v4, "currentConnection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "remoteObjectProxy");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "updateActivity:withParameters:", v15, v12);

    -[NSMutableDictionary removeObjectForKey:](v4->_activityToDataMap, "removeObjectForKey:", v15);
  }

  objc_sync_exit(v11);
}

- (void)cancelTaskRequestWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  _QWORD v11[5];

  v4 = a3;
  -[_DASScheduler currentConnection](self, "currentConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __49___DASScheduler_cancelTaskRequestWithIdentifier___block_invoke;
  v11[3] = &unk_1E624BB88;
  v11[4] = self;
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v6;
  v9[1] = 3221225472;
  v9[2] = __49___DASScheduler_cancelTaskRequestWithIdentifier___block_invoke_337;
  v9[3] = &unk_1E624B688;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  objc_msgSend(v7, "cancelTaskRequestWithIdentifier:completionHandler:", v8, v9);

}

- (void)activityStartedWithParameters:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[_DASScheduler currentConnection](self, "currentConnection");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteObjectProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activityStartedWithParameters:", v4);

}

- (void)getPendingTaskRequestsWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  -[_DASScheduler currentConnection](self, "currentConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __61___DASScheduler_getPendingTaskRequestsWithCompletionHandler___block_invoke;
  v12[3] = &unk_1E624BDB0;
  v7 = v4;
  v13 = v7;
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __61___DASScheduler_getPendingTaskRequestsWithCompletionHandler___block_invoke_2;
  v10[3] = &unk_1E624BDD8;
  v11 = v7;
  v9 = v7;
  objc_msgSend(v8, "getPendingTaskRequestsWithCompletionHandler:", v10);

}

- (void)cancelAllTaskRequests
{
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[5];
  _QWORD v7[5];

  -[_DASScheduler currentConnection](self, "currentConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __38___DASScheduler_cancelAllTaskRequests__block_invoke;
  v7[3] = &unk_1E624BB88;
  v7[4] = self;
  objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __38___DASScheduler_cancelAllTaskRequests__block_invoke_338;
  v6[3] = &unk_1E624B598;
  v6[4] = self;
  objc_msgSend(v5, "cancelAllTaskRequestsWithCompletionHandler:", v6);

}

- (void)activityCanceled:(id)a3
{
  _DASSubmissionManager *submissionManager;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[_DASScheduler handleNoLongerRunningActivities:](self, "handleNoLongerRunningActivities:", v9);
  if (!objc_msgSend(v9, "preClearedMode"))
  {
    submissionManager = self->_submissionManager;
    -[_DASScheduler currentConnection](self, "currentConnection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "remoteObjectProxy");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_DASSubmissionManager activityCanceled:withScheduler:](submissionManager, "activityCanceled:withScheduler:", v9, v6);

    -[_DASScheduler currentConnection](self, "currentConnection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "remoteObjectProxy");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "activityCanceled:", v9);

  }
}

- (void)activityCompleted:(id)a3
{
  _DASSubmissionManager *submissionManager;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[_DASScheduler handleNoLongerRunningActivities:](self, "handleNoLongerRunningActivities:", v9);
  if (!objc_msgSend(v9, "preClearedMode"))
  {
    submissionManager = self->_submissionManager;
    -[_DASScheduler currentConnection](self, "currentConnection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "remoteObjectProxy");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_DASSubmissionManager activityCompleted:withScheduler:](submissionManager, "activityCompleted:withScheduler:", v9, v6);

    -[_DASScheduler currentConnection](self, "currentConnection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "remoteObjectProxy");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "activityCompleted:", v9);

  }
}

- (void)connectToDaemon:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  uint8_t buf[4];
  _BOOL4 v10;
  uint64_t v11;

  v3 = a3;
  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v10 = v3;
    _os_log_impl(&dword_1B0DF4000, v5, OS_LOG_TYPE_DEFAULT, "Connecting to daemon; reconnect: %d", buf, 8u);
  }

  if (v3)
    -[_DASScheduler xpcConnection](self, "xpcConnection");
  else
    -[_DASScheduler currentConnection](self, "currentConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteObjectProxy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __33___DASScheduler_connectToDaemon___block_invoke;
  v8[3] = &unk_1E624B598;
  v8[4] = self;
  objc_msgSend(v7, "establishConnection:", v8);

}

- (BOOL)submitActivityInternal:(id)a3
{
  id v4;
  void *v5;
  _BOOL4 v6;
  NSObject *dasFrameworkLog;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  _DASScheduler *v12;
  void *v13;
  int v14;
  NSMutableDictionary *submittedActivities;
  void *v16;
  NSMutableDictionary *v17;
  void *v18;
  void *v19;
  void *v20;
  NSMutableDictionary *v21;
  void *v22;
  char v23;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(uint64_t, uint64_t, void *, _BYTE *);
  void *v28;
  id v29;
  _DASScheduler *v30;
  uint64_t *v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  char v42;

  v4 = a3;
  objc_msgSend(v4, "limitationResponse");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = +[_DASLimiterResponse queryActivityDecision:fromResponses:](_DASLimiterResponse, "queryActivityDecision:fromResponses:", 4, v5);

  if (v6)
  {
    dasFrameworkLog = self->_dasFrameworkLog;
    if (os_log_type_enabled(dasFrameworkLog, OS_LOG_TYPE_ERROR))
      -[_DASScheduler submitActivityInternal:].cold.1(dasFrameworkLog, v4);
  }
  else
  {
    objc_msgSend(v4, "limitationResponse");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    if (v9)
    {
      v10 = self->_dasFrameworkLog;
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[_DASScheduler submitActivityInternal:].cold.2(v10, v4);
    }
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSubmitDate:", v11);
  if (self->_clientName)
    objc_msgSend(v4, "setClientName:");
  v39 = 0;
  v40 = &v39;
  v41 = 0x2020000000;
  v42 = 1;
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__0;
  v37 = __Block_byref_object_dispose__0;
  v38 = 0;
  v12 = self;
  objc_sync_enter(v12);
  if ((objc_msgSend(v4, "requestsApplicationLaunch") & 1) != 0
    || objc_msgSend(v4, "requestsExtensionLaunch"))
  {
    objc_msgSend(v4, "rateLimitConfigurationName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
      v14 = objc_msgSend(v4, "keepsPrevious");
      if ((v14 | objc_msgSend(v4, "overwritesPrevious")) == 1)
      {
        submittedActivities = v12->_submittedActivities;
        v25 = MEMORY[0x1E0C809B0];
        v26 = 3221225472;
        v27 = __40___DASScheduler_submitActivityInternal___block_invoke;
        v28 = &unk_1E624BAE8;
        v29 = v4;
        v30 = v12;
        v31 = &v39;
        v32 = &v33;
        -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](submittedActivities, "enumerateKeysAndObjectsUsingBlock:", &v25);

      }
    }
  }
  objc_msgSend(v4, "rateLimitConfigurationName", v25, v26, v27, v28);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    *((_BYTE *)v40 + 24) = 1;
  }
  else if (!*((_BYTE *)v40 + 24))
  {
    goto LABEL_18;
  }
  v17 = v12->_submittedActivities;
  objc_msgSend(v4, "uuid");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](v17, "setObject:forKeyedSubscript:", v4, v18);

LABEL_18:
  v19 = (void *)v34[5];
  if (v19)
  {
    if (objc_msgSend(v19, "requestsExtensionLaunch"))
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v34[5]);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[_DASScheduler cancelActivities:](v12, "cancelActivities:", v20);

    }
    v21 = v12->_submittedActivities;
    objc_msgSend((id)v34[5], "uuid");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](v21, "removeObjectForKey:", v22);

  }
  objc_sync_exit(v12);

  v23 = *((_BYTE *)v40 + 24);
  _Block_object_dispose(&v33, 8);

  _Block_object_dispose(&v39, 8);
  return v23;
}

- (id)submitTaskRequest:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  _QWORD v12[5];
  _QWORD v13[6];
  __int128 buf;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v4;
    _os_log_impl(&dword_1B0DF4000, v5, OS_LOG_TYPE_DEFAULT, "Submitting task request activity: %@", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__0;
  v17 = __Block_byref_object_dispose__0;
  v18 = 0;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSubmitDate:", v6);

  -[_DASScheduler currentConnection](self, "currentConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __35___DASScheduler_submitTaskRequest___block_invoke;
  v13[3] = &unk_1E624BCC8;
  v13[4] = self;
  v13[5] = &buf;
  objc_msgSend(v7, "remoteObjectProxyWithErrorHandler:", v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __35___DASScheduler_submitTaskRequest___block_invoke_336;
  v12[3] = &unk_1E624BB10;
  v12[4] = &buf;
  objc_msgSend(v9, "submitTaskRequest:withHandler:", v4, v12);

  v10 = *(id *)(*((_QWORD *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  return v10;
}

- (void)setMinimumBackgroundFetchInterval:(double)a3 forApp:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[5];

  v6 = a4;
  -[_DASScheduler currentConnection](self, "currentConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __58___DASScheduler_setMinimumBackgroundFetchInterval_forApp___block_invoke;
  v9[3] = &unk_1E624BB88;
  v9[4] = self;
  objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setMinimumBackgroundFetchInterval:forApp:", v6, a3);

}

- (id)currentConnection
{
  NSObject *connectionCreationQueue;
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
  v9 = __Block_byref_object_copy__0;
  v10 = __Block_byref_object_dispose__0;
  v11 = 0;
  connectionCreationQueue = self->_connectionCreationQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __34___DASScheduler_currentConnection__block_invoke;
  v5[3] = &unk_1E624BAC0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(connectionCreationQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)submitActivity:(id)a3 inGroupWithName:(id)a4
{
  id v6;

  v6 = a3;
  objc_msgSend(v6, "setGroupName:", a4);
  -[_DASScheduler submitActivity:](self, "submitActivity:", v6);

}

- (void)submitActivity:(id)a3
{
  id v4;
  _BOOL4 v5;
  NSObject *v6;
  _BOOL4 v7;
  _DASSubmissionManager *submissionManager;
  void *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[_DASScheduler submitActivityInternal:](self, "submitActivityInternal:", v4);
  -[_DASScheduler dasFrameworkLog](self, "dasFrameworkLog");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      v10 = 138543362;
      v11 = v4;
      _os_log_impl(&dword_1B0DF4000, v6, OS_LOG_TYPE_DEFAULT, "SUBMITTING: %{public}@", (uint8_t *)&v10, 0xCu);
    }

    if (objc_msgSend(v4, "preClearedMode"))
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v4);
      v6 = objc_claimAutoreleasedReturnValue();
      -[_DASScheduler runActivities:](self, "runActivities:", v6);
    }
    else
    {
      submissionManager = self->_submissionManager;
      -[_DASScheduler currentConnection](self, "currentConnection");
      v6 = objc_claimAutoreleasedReturnValue();
      -[NSObject remoteObjectProxy](v6, "remoteObjectProxy");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[_DASSubmissionManager submitActivity:withScheduler:](submissionManager, "submitActivity:withScheduler:", v4, v9);

    }
  }
  else if (v7)
  {
    v10 = 138412290;
    v11 = v4;
    _os_log_impl(&dword_1B0DF4000, v6, OS_LOG_TYPE_DEFAULT, "Duplicate Activity: %@", (uint8_t *)&v10, 0xCu);
  }

}

- (OS_os_log)dasFrameworkLog
{
  return self->_dasFrameworkLog;
}

+ (id)scheduler
{
  return -[_DASScheduler initWithListenerEndpoint:]([_DASScheduler alloc], "initWithListenerEndpoint:", 0);
}

- (_DASScheduler)initWithListenerEndpoint:(id)a3
{
  id v4;
  _DASScheduler *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *runQueue;
  dispatch_queue_t v8;
  OS_dispatch_queue *queue;
  dispatch_queue_t v10;
  OS_dispatch_queue *connectionCreationQueue;
  uint64_t v12;
  NSMutableDictionary *submittedActivities;
  uint64_t v14;
  NSMutableDictionary *startedActivities;
  uint64_t v16;
  NSMutableDictionary *delayedStartTasks;
  _DASSubmissionManager *v18;
  _DASSubmissionManager *submissionManager;
  os_log_t v20;
  OS_os_log *dasFrameworkLog;
  uint64_t v22;
  NSMutableDictionary *activityToDataMap;
  const char *v24;
  NSObject *v25;
  _QWORD v27[4];
  id v28;
  id location;
  objc_super v30;

  v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)_DASScheduler;
  v5 = -[_DASScheduler init](&v30, sel_init);
  if (v5)
  {
    v6 = dispatch_queue_create("com.apple.duet.activityscheduler.client.taskrunqueue", MEMORY[0x1E0C80D50]);
    runQueue = v5->_runQueue;
    v5->_runQueue = (OS_dispatch_queue *)v6;

    v8 = dispatch_queue_create("com.apple.duet.activityscheduler.client.xpcqueue", 0);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v8;

    v10 = dispatch_queue_create("com.apple.duet.activityscheduler.client.connectionReestablish", 0);
    connectionCreationQueue = v5->_connectionCreationQueue;
    v5->_connectionCreationQueue = (OS_dispatch_queue *)v10;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v12 = objc_claimAutoreleasedReturnValue();
    submittedActivities = v5->_submittedActivities;
    v5->_submittedActivities = (NSMutableDictionary *)v12;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v14 = objc_claimAutoreleasedReturnValue();
    startedActivities = v5->_startedActivities;
    v5->_startedActivities = (NSMutableDictionary *)v14;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v16 = objc_claimAutoreleasedReturnValue();
    delayedStartTasks = v5->_delayedStartTasks;
    v5->_delayedStartTasks = (NSMutableDictionary *)v16;

    v18 = objc_alloc_init(_DASSubmissionManager);
    submissionManager = v5->_submissionManager;
    v5->_submissionManager = v18;

    v20 = os_log_create((const char *)objc_msgSend(CFSTR("com.apple.duetactivityscheduler"), "UTF8String"), (const char *)objc_msgSend(CFSTR("client"), "UTF8String"));
    dasFrameworkLog = v5->_dasFrameworkLog;
    v5->_dasFrameworkLog = (OS_os_log *)v20;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v22 = objc_claimAutoreleasedReturnValue();
    activityToDataMap = v5->_activityToDataMap;
    v5->_activityToDataMap = (NSMutableDictionary *)v22;

    -[_DASScheduler setupXPCConnectionWithEndpoint:](v5, "setupXPCConnectionWithEndpoint:", v4);
    objc_initWeak(&location, v5);
    v24 = (const char *)objc_msgSend(CFSTR("com.appple.duet.activityscheduler.requestActivityResubmission"), "UTF8String");
    v25 = v5->_queue;
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __42___DASScheduler_initWithListenerEndpoint___block_invoke;
    v27[3] = &unk_1E624BA98;
    objc_copyWeak(&v28, &location);
    notify_register_dispatch(v24, &v5->_resubmitToken, v25, v27);
    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);
  }

  return v5;
}

- (void)setupXPCConnectionWithEndpoint:(id)a3
{
  id v5;
  id v6;
  NSXPCConnection *v7;
  NSXPCConnection *xpcConnection;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
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
  void *v33;
  void *v34;
  void *v35;
  void *v36;
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
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  NSXPCConnection *v97;
  _QWORD v98[4];
  id v99;
  id location;
  _QWORD v101[3];
  _QWORD v102[3];
  _QWORD v103[3];
  _QWORD v104[3];
  _QWORD v105[3];
  _QWORD v106[3];
  _QWORD v107[2];
  _QWORD v108[3];
  _QWORD v109[5];
  _QWORD v110[2];
  _QWORD v111[2];
  _QWORD v112[2];
  _QWORD v113[2];
  _QWORD v114[2];
  _QWORD v115[2];
  _QWORD v116[4];
  _QWORD v117[3];
  _QWORD v118[3];
  _QWORD v119[6];
  _QWORD v120[6];
  _QWORD v121[2];
  _QWORD v122[2];
  _QWORD v123[5];
  _QWORD v124[4];
  _QWORD v125[2];
  _QWORD v126[2];
  _QWORD v127[2];
  _QWORD v128[4];

  v128[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[NSXPCConnection invalidate](self->_xpcConnection, "invalidate");
  v6 = objc_alloc(MEMORY[0x1E0CB3B38]);
  if (v5)
    v7 = (NSXPCConnection *)objc_msgSend(v6, "initWithListenerEndpoint:", v5);
  else
    v7 = (NSXPCConnection *)objc_msgSend(v6, "initWithMachServiceName:options:", CFSTR("com.apple.duetactivityscheduler"), 4096);
  xpcConnection = self->_xpcConnection;
  self->_xpcConnection = v7;

  objc_storeStrong((id *)&self->_endpoint, a3);
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EEEDF458);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0C99E60];
  v128[0] = objc_opt_class();
  v128[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v128, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setWithArray:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v12, sel_submittedActivitiesWithHandler_, 0, 1);

  v13 = (void *)MEMORY[0x1E0C99E60];
  v127[0] = objc_opt_class();
  v127[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v127, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setWithArray:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v15, sel_delayedRunningActivitiesWithHandler_, 0, 1);

  v16 = (void *)MEMORY[0x1E0C99E60];
  v126[0] = objc_opt_class();
  v126[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v126, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setWithArray:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v18, sel_runningActivitiesWithHandler_, 0, 1);

  v19 = (void *)MEMORY[0x1E0C99E60];
  v125[0] = objc_opt_class();
  v125[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v125, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setWithArray:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v21, sel_runningGroupActivitiesWithHandler_, 0, 1);

  v22 = (void *)MEMORY[0x1E0C99E60];
  v124[0] = objc_opt_class();
  v124[1] = objc_opt_class();
  v124[2] = objc_opt_class();
  v124[3] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v124, 4);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setWithArray:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v24, sel_currentPredictionsWithHandler_, 0, 1);

  v25 = (void *)MEMORY[0x1E0C99E60];
  v123[0] = objc_opt_class();
  v123[1] = objc_opt_class();
  v123[2] = objc_opt_class();
  v123[3] = objc_opt_class();
  v123[4] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v123, 5);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setWithArray:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v27, sel_statisticsWithHandler_, 0, 1);

  v28 = (void *)MEMORY[0x1E0C99E60];
  v122[0] = objc_opt_class();
  v122[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v122, 2);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setWithArray:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v30, sel_submitActivities_, 0, 0);

  v31 = (void *)MEMORY[0x1E0C99E60];
  v121[0] = objc_opt_class();
  v121[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v121, 2);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setWithArray:", v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v33, sel_startedActivities_, 0, 0);

  v34 = (void *)MEMORY[0x1E0C99E60];
  v120[0] = objc_opt_class();
  v120[1] = objc_opt_class();
  v120[2] = objc_opt_class();
  v120[3] = objc_opt_class();
  v120[4] = objc_opt_class();
  v120[5] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v120, 6);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setWithArray:", v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v36, sel_updateSystemConstraintsWithParameters_, 0, 0);

  v37 = (void *)MEMORY[0x1E0C99E60];
  v119[0] = objc_opt_class();
  v119[1] = objc_opt_class();
  v119[2] = objc_opt_class();
  v119[3] = objc_opt_class();
  v119[4] = objc_opt_class();
  v119[5] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v119, 6);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setWithArray:", v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v39, sel_enterTestModeWithParameters_reset_handler_, 0, 0);

  v40 = (void *)MEMORY[0x1E0C99E60];
  v118[0] = objc_opt_class();
  v118[1] = objc_opt_class();
  v118[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v118, 3);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setWithArray:", v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v42, sel_blockingPoliciesWithParameters_handler_, 0, 0);

  v43 = (void *)MEMORY[0x1E0C99E60];
  v117[0] = objc_opt_class();
  v117[1] = objc_opt_class();
  v117[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v117, 3);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setWithArray:", v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v45, sel_pauseWithParameters_handler_, 0, 0);

  v46 = (void *)MEMORY[0x1E0C99E60];
  v116[0] = objc_opt_class();
  v116[1] = objc_opt_class();
  v116[2] = objc_opt_class();
  v116[3] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v116, 4);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setWithArray:", v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v48, sel_submitRateLimitConfiguration_handler_, 0, 0);

  v49 = (void *)MEMORY[0x1E0C99E60];
  v115[0] = objc_opt_class();
  v115[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v115, 2);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "setWithArray:", v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v51, sel_delayedStartActivities_, 0, 0);

  v52 = (void *)MEMORY[0x1E0C99E60];
  v114[0] = objc_opt_class();
  v114[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v114, 2);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setWithArray:", v53);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v54, sel_submitActivity_inGroup_withHandler_, 0, 0);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v55, sel_submitTaskRequest_withHandler_, 0, 0);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v56, sel_updateProgressForOngoingTask_completionHandler_, 0, 0);

  v57 = (void *)MEMORY[0x1E0C99E60];
  v113[0] = objc_opt_class();
  v113[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v113, 2);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "setWithArray:", v58);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v59, sel_getPendingTaskRequestsWithCompletionHandler_, 0, 1);

  v60 = (void *)MEMORY[0x1E0C99E60];
  v112[0] = objc_opt_class();
  v112[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v112, 2);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "setWithArray:", v61);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v62, sel_disableAppRefreshForApps_, 0, 0);

  objc_msgSend(v9, "setXPCType:forSelector:argumentIndex:ofReply:", MEMORY[0x1E0C812F8], sel_submitTaskRequestWithIdentifier_descriptor_completionHandler_, 1, 0);
  objc_msgSend(v9, "setXPCType:forSelector:argumentIndex:ofReply:", MEMORY[0x1E0C812F8], sel_updateTaskRequestWithIdentifier_descriptor_completionHandler_, 1, 0);
  v63 = (void *)MEMORY[0x1E0C99E60];
  v111[0] = objc_opt_class();
  v111[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v111, 2);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "setWithArray:", v64);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v65, sel_reportSystemTaskWithIdentifier_producedResults_completionHandler_, 1, 0);

  v66 = (void *)MEMORY[0x1E0C99E60];
  v110[0] = objc_opt_class();
  v110[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v110, 2);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "setWithArray:", v67);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v68, sel_reportSystemTaskWithIdentifier_consumedResults_completionHandler_, 1, 0);

  v69 = (void *)MEMORY[0x1E0C99E60];
  v109[0] = objc_opt_class();
  v109[1] = objc_opt_class();
  v109[2] = objc_opt_class();
  v109[3] = objc_opt_class();
  v109[4] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v109, 5);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "setWithArray:", v70);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v71, sel_inspect_withHandler_, 0, 1);

  v72 = (void *)MEMORY[0x1E0C99E60];
  v108[0] = objc_opt_class();
  v108[1] = objc_opt_class();
  v108[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v108, 3);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "setWithArray:", v73);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v74, sel_resetFastPassActivities_resetAll_withHandler_, 0, 1);

  v75 = (void *)MEMORY[0x1E0C99E60];
  v107[0] = objc_opt_class();
  v107[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v107, 2);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "setWithArray:", v76);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v77, sel_resubmitRunningTasks_, 0, 0);

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EEEDAB38);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v79 = (void *)MEMORY[0x1E0C99E60];
  v106[0] = objc_opt_class();
  v106[1] = objc_opt_class();
  v106[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v106, 3);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "setWithArray:", v80);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "setClasses:forSelector:argumentIndex:ofReply:", v81, sel_runActivities_, 0, 0);

  v82 = (void *)MEMORY[0x1E0C99E60];
  v105[0] = objc_opt_class();
  v105[1] = objc_opt_class();
  v105[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v105, 3);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "setWithArray:", v83);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "setClasses:forSelector:argumentIndex:ofReply:", v84, sel_suspendActivities_, 0, 0);

  v85 = (void *)MEMORY[0x1E0C99E60];
  v104[0] = objc_opt_class();
  v104[1] = objc_opt_class();
  v104[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v104, 3);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "setWithArray:", v86);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "setClasses:forSelector:argumentIndex:ofReply:", v87, sel_cancelActivities_, 0, 0);

  v88 = (void *)MEMORY[0x1E0C99E60];
  v103[0] = objc_opt_class();
  v103[1] = objc_opt_class();
  v103[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v103, 3);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "setWithArray:", v89);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "setClasses:forSelector:argumentIndex:ofReply:", v90, sel_runActivitiesWithDelayedStart_, 0, 0);

  v91 = (void *)MEMORY[0x1E0C99E60];
  v102[0] = objc_opt_class();
  v102[1] = objc_opt_class();
  v102[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v102, 3);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "setWithArray:", v92);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "setClasses:forSelector:argumentIndex:ofReply:", v93, sel_handleLaunchFromDaemonForActivities_, 0, 0);

  v94 = (void *)MEMORY[0x1E0C99E60];
  v101[0] = objc_opt_class();
  v101[1] = objc_opt_class();
  v101[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v101, 3);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "setWithArray:", v95);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "setClasses:forSelector:argumentIndex:ofReply:", v96, sel_willExpireBGTaskActivities_, 0, 0);

  -[NSXPCConnection _setQueue:](self->_xpcConnection, "_setQueue:", self->_queue);
  objc_initWeak(&location, self);
  v97 = self->_xpcConnection;
  v98[0] = MEMORY[0x1E0C809B0];
  v98[1] = 3221225472;
  v98[2] = __48___DASScheduler_setupXPCConnectionWithEndpoint___block_invoke;
  v98[3] = &unk_1E624BA70;
  objc_copyWeak(&v99, &location);
  -[NSXPCConnection setInterruptionHandler:](v97, "setInterruptionHandler:", v98);
  -[NSXPCConnection setRemoteObjectInterface:](self->_xpcConnection, "setRemoteObjectInterface:", v9);
  -[NSXPCConnection setExportedInterface:](self->_xpcConnection, "setExportedInterface:", v78);
  -[NSXPCConnection setExportedObject:](self->_xpcConnection, "setExportedObject:", self);
  -[NSXPCConnection resume](self->_xpcConnection, "resume");
  -[_DASScheduler setInterrupted:](self, "setInterrupted:", 0);
  objc_destroyWeak(&v99);
  objc_destroyWeak(&location);

}

- (void)setInterrupted:(BOOL)a3
{
  self->_interrupted = a3;
}

+ (id)sharedScheduler
{
  if (sharedScheduler_onceToken_0 != -1)
    dispatch_once(&sharedScheduler_onceToken_0, &__block_literal_global_3);
  return (id)sharedScheduler_sharedScheduler;
}

- (void)setBackgroundTasksSchedulerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_backgroundTaskSchedulerDelegate, a3);
  -[_DASScheduler connectToDaemon:](self, "connectToDaemon:", 0);
}

- (void)submitActivity:(id)a3 inGroup:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  _DASSubmissionManager *submissionManager;
  void *v13;
  int v14;
  id v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[_DASScheduler submitActivityInternal:](self, "submitActivityInternal:", v6);
  objc_msgSend(v7, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setGroupName:", v8);

  -[_DASScheduler dasFrameworkLog](self, "dasFrameworkLog");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v7, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543618;
    v15 = v6;
    v16 = 2114;
    v17 = v10;
    _os_log_impl(&dword_1B0DF4000, v9, OS_LOG_TYPE_DEFAULT, "SUBMITTING: %{public}@ in group %{public}@", (uint8_t *)&v14, 0x16u);

  }
  if (objc_msgSend(v6, "preClearedMode"))
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[_DASScheduler runActivities:](self, "runActivities:", v11);
  }
  else
  {
    submissionManager = self->_submissionManager;
    -[_DASScheduler currentConnection](self, "currentConnection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "remoteObjectProxy");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[_DASSubmissionManager submitActivity:inGroup:withScheduler:](submissionManager, "submitActivity:inGroup:withScheduler:", v6, v7, v13);

  }
}

- (_DASScheduler)init
{
  return -[_DASScheduler initWithListenerEndpoint:](self, "initWithListenerEndpoint:", 0);
}

- (void)dealloc
{
  objc_super v3;

  notify_cancel(self->_resubmitToken);
  -[NSXPCConnection invalidate](self->_xpcConnection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)_DASScheduler;
  -[_DASScheduler dealloc](&v3, sel_dealloc);
}

+ (_DASScheduler)schedulerWithClientName:(id)a3
{
  id v3;
  _DASScheduler *v4;

  v3 = a3;
  v4 = -[_DASScheduler initWithListenerEndpoint:]([_DASScheduler alloc], "initWithListenerEndpoint:", 0);
  -[_DASScheduler setClientName:](v4, "setClientName:", v3);

  return v4;
}

+ (_DASScheduler)schedulerWithEndpoint:(id)a3
{
  id v3;
  _DASScheduler *v4;

  v3 = a3;
  v4 = -[_DASScheduler initWithListenerEndpoint:]([_DASScheduler alloc], "initWithListenerEndpoint:", v3);

  return v4;
}

+ (_DASScheduler)schedulerWithEndpoint:(id)a3 withClientName:(id)a4
{
  id v5;
  id v6;
  _DASScheduler *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[_DASScheduler initWithListenerEndpoint:]([_DASScheduler alloc], "initWithListenerEndpoint:", v6);

  -[_DASScheduler setClientName:](v7, "setClientName:", v5);
  return v7;
}

- (id)submittedTaskState
{
  _DASScheduler *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)-[NSMutableDictionary copy](v2->_submittedActivities, "copy");
  objc_sync_exit(v2);

  return v3;
}

- (void)resubmitRunningActivities
{
  _DASScheduler *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = self;
  objc_sync_enter(v2);
  -[NSMutableDictionary allValues](v2->_startedActivities, "allValues");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v2);

  if (objc_msgSend(v5, "count"))
  {
    -[_DASScheduler xpcConnection](v2, "xpcConnection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "remoteObjectProxy");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "startedActivities:", v5);

  }
}

- (void)resubmitPendingActivities
{
  _DASScheduler *v2;
  void *v3;
  void *v4;
  void *v5;
  _DASSubmissionManager *submissionManager;
  void *v7;
  void *v8;
  id v9;

  v2 = self;
  objc_sync_enter(v2);
  -[NSMutableDictionary allValues](v2->_submittedActivities, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self.requestsApplicationLaunch == NO && self.preClearedMode == 0"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "filteredArrayUsingPredicate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v5, "mutableCopy");

  objc_sync_exit(v2);
  if (objc_msgSend(v9, "count"))
  {
    -[_DASSubmissionManager removeAllObjects](v2->_submissionManager, "removeAllObjects");
    submissionManager = v2->_submissionManager;
    -[_DASScheduler xpcConnection](v2, "xpcConnection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "remoteObjectProxy");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_DASSubmissionManager submitActivities:withScheduler:](submissionManager, "submitActivities:withScheduler:", v9, v8);

  }
}

- (void)resubmitPendingStartActivities
{
  _DASScheduler *v2;
  void *v3;
  id v4;

  v2 = self;
  objc_sync_enter(v2);
  -[NSMutableDictionary allValues](v2->_delayedStartTasks, "allValues");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v2);

  if (objc_msgSend(v4, "count"))
  {
    -[NSXPCConnection remoteObjectProxy](v2->_xpcConnection, "remoteObjectProxy");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "delayedStartActivities:", v4);

  }
}

- (void)handleEligibleActivities:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[_DASScheduler currentConnection](self, "currentConnection");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteObjectProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleEligibleActivities:", v4);

}

- (void)submitActivitiesInternal:(id)a3
{
  id v4;
  void *v5;
  _DASScheduler *v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  _BOOL4 v13;
  NSObject *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSMutableDictionary *submittedActivities;
  void *v20;
  id v21;
  void *v22;
  __int128 v23;
  id obj;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  id v30;
  __int16 v31;
  void *v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = self;
  objc_sync_enter(v6);
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = v4;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (v7)
  {
    v9 = *(_QWORD *)v26;
    *(_QWORD *)&v8 = 138412546;
    v23 = v8;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v26 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v11, "limitationResponse", v23);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = +[_DASLimiterResponse queryActivityDecision:fromResponses:](_DASLimiterResponse, "queryActivityDecision:fromResponses:", 4, v12);

        if (v13)
        {
          v14 = v6->_dasFrameworkLog;
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v11, "name");
            v15 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "limitationResponse");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v23;
            v30 = v15;
            v31 = 2112;
            v32 = v16;
            _os_log_error_impl(&dword_1B0DF4000, v14, OS_LOG_TYPE_ERROR, "ERROR Submitting %@: Please contact das-core@group.apple.com to prevent this activity from getting rejected. Configuration: %@", buf, 0x16u);

          }
        }
        else
        {
          objc_msgSend(v11, "limitationResponse");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "count");

          if (!v18)
            goto LABEL_13;
          v14 = v6->_dasFrameworkLog;
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v11, "name");
            v21 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "limitationResponse");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v23;
            v30 = v21;
            v31 = 2112;
            v32 = v22;
            _os_log_error_impl(&dword_1B0DF4000, v14, OS_LOG_TYPE_ERROR, "WARNING Submitting %@: %@", buf, 0x16u);

          }
        }

LABEL_13:
        if (v6->_clientName)
          objc_msgSend(v11, "setClientName:");
        submittedActivities = v6->_submittedActivities;
        objc_msgSend(v11, "uuid");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](submittedActivities, "setObject:forKeyedSubscript:", v11, v20);

        objc_msgSend(v11, "setSubmitDate:", v5);
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    }
    while (v7);
  }

  objc_sync_exit(v6);
}

- (void)submitActivities:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DASScheduler submitActivitiesInternal:](self, "submitActivitiesInternal:", v4);
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v12, "preClearedMode", (_QWORD)v16))
          v13 = v5;
        else
          v13 = v6;
        objc_msgSend(v13, "addObject:", v12);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

  -[_DASScheduler runActivities:](self, "runActivities:", v5);
  -[_DASScheduler currentConnection](self, "currentConnection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "remoteObjectProxy");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "submitActivities:", v6);

}

- (void)activityStarted:(id)a3
{
  id v4;
  _DASScheduler *v5;
  NSMutableDictionary *delayedStartTasks;
  void *v7;
  void *v8;
  NSMutableDictionary *v9;
  void *v10;
  NSMutableDictionary *startedActivities;
  void *v12;
  NSObject *dasFrameworkLog;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  delayedStartTasks = v5->_delayedStartTasks;
  objc_msgSend(v4, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](delayedStartTasks, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = v5->_delayedStartTasks;
    objc_msgSend(v4, "uuid");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](v9, "removeObjectForKey:", v10);

    startedActivities = v5->_startedActivities;
    objc_msgSend(v4, "uuid");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](startedActivities, "setObject:forKeyedSubscript:", v4, v12);

  }
  else
  {
    dasFrameworkLog = v5->_dasFrameworkLog;
    if (os_log_type_enabled(dasFrameworkLog, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 138412290;
      v19 = v4;
      _os_log_impl(&dword_1B0DF4000, dasFrameworkLog, OS_LOG_TYPE_DEFAULT, "startActivity: %@ activity was not found", (uint8_t *)&v18, 0xCu);
    }
  }

  objc_sync_exit(v5);
  if (v8)
  {
    -[_DASScheduler dasFrameworkLog](v5, "dasFrameworkLog");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 138412290;
      v19 = v4;
      _os_log_impl(&dword_1B0DF4000, v14, OS_LOG_TYPE_DEFAULT, "STARTING: %@", (uint8_t *)&v18, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setStartDate:", v15);

    -[_DASScheduler currentConnection](v5, "currentConnection");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "remoteObjectProxy");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "activityStarted:", v4);

  }
}

- (id)_resetWidgetBudgets
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__0;
  v11 = __Block_byref_object_dispose__0;
  v12 = 0;
  -[_DASScheduler currentConnection](self, "currentConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __36___DASScheduler__resetWidgetBudgets__block_invoke;
  v6[3] = &unk_1E624BB10;
  v6[4] = &v7;
  objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_resetWidgetBudgets");

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (void)updateActivity:(id)a3 withParameters:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  double v16;
  char v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _DASScheduler *v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  const __CFString *v31;
  void *v32;
  _BYTE v33[128];
  _QWORD v34[8];

  v34[6] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = CFSTR("DownloadedOnWifi");
  v34[1] = CFSTR("DownloadedOnCell");
  v34[2] = CFSTR("UploadedOnWifi");
  v34[3] = CFSTR("UploadedOnCell");
  v34[4] = CFSTR("Cell");
  v34[5] = CFSTR("WiFi");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 6);
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v28;
    v25 = self;
    v26 = v6;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v28 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
        if (objc_msgSend(v8, "containsObject:", v14, v25, v26, (_QWORD)v27))
        {
          objc_msgSend(v7, "objectForKeyedSubscript:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "doubleValue");
          if (v16 > 0.0 || (objc_msgSend(v8, "containsObject:", CFSTR("Cell")) & 1) != 0)
          {

LABEL_17:
            self = v25;
            v6 = v26;
            -[_DASScheduler updateBytesConsumedForActivity:withParameters:](v25, "updateBytesConsumedForActivity:withParameters:", v26, v7);
            goto LABEL_18;
          }
          v17 = objc_msgSend(v8, "containsObject:", CFSTR("WiFi"));

          if ((v17 & 1) != 0)
            goto LABEL_17;
        }
        else if ((objc_msgSend(v8, "containsObject:", CFSTR("Cell")) & 1) != 0
               || objc_msgSend(v8, "containsObject:", CFSTR("WiFi")))
        {
          goto LABEL_17;
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
      self = v25;
      v6 = v26;
      if (v11)
        continue;
      break;
    }
  }
LABEL_18:

  if (objc_msgSend(v8, "containsObject:", CFSTR("PercentCompleted")))
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("PercentCompleted"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "doubleValue");
    v20 = v19;

    if (v20 >= 0.0)
    {
      -[_DASScheduler currentConnection](self, "currentConnection");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "remoteObjectProxy");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = CFSTR("PercentCompleted");
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("PercentCompleted"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v23;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "updateActivity:withParameters:", v6, v24);

    }
  }

}

- (void)updateSystemConstraintsWithParameters:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[_DASScheduler currentConnection](self, "currentConnection");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteObjectProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateSystemConstraintsWithParameters:", v4);

}

- (id)extendUpdateActivityDictionary:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  double v36;
  double v37;
  void *v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  void *v45;
  double v46;
  double v47;
  double v48;
  void *v49;
  void *v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  void *v56;
  double v57;
  double v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v70;
  double v71;
  double v72;
  double v73;
  double v74;
  id obj;
  double v76;
  double v77;
  void *v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  _BYTE v83[128];
  uint64_t v84;

  v84 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = v3;
  objc_msgSend(v3, "allKeys");
  v79 = 0u;
  v80 = 0u;
  v81 = 0u;
  v82 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v79, v83, 16);
  if (v4)
  {
    v5 = v4;
    v71 = 0.0;
    v72 = 0.0;
    v6 = 0.0;
    v7 = *(_QWORD *)v80;
    v76 = 0.0;
    v77 = 0.0;
    v8 = 0.0;
    v9 = 0.0;
    v10 = 0.0;
    v11 = 0.0;
    v12 = 0.0;
    while (1)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v80 != v7)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * i);
        if (objc_msgSend(v14, "isEqualToString:", CFSTR("Cell")))
        {
          objc_msgSend(v78, "objectForKeyedSubscript:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("Inexpensive"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = v16;
          if (v16)
          {
            objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("Upload"));
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "doubleValue");
            v20 = v19;

            v21 = v8 + v20;
            v12 = v12 + v20;
            v22 = v10 + v20;
            v23 = v77 + v20;
            objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("Download"));
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "doubleValue");
            v26 = v25;

            v8 = v21 + v26;
            v11 = v11 + v26;
            v10 = v22 + v26;
            v77 = v23 + v26;
          }
          objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("Expensive"));
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = v27;
          if (v27)
          {
            objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("Upload"));
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "doubleValue");
            v31 = v30;

            v32 = v9 + v31;
            v12 = v12 + v31;
            v33 = v10 + v31;
            v34 = v6 + v31;
            objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("Download"));
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "doubleValue");
            v37 = v36;

            v11 = v11 + v37;
            v9 = v32 + v37;
            v10 = v33 + v37;
            v6 = v34 + v37;
          }
        }
        else
        {
          if (!objc_msgSend(v14, "isEqualToString:", CFSTR("WiFi")))
            continue;
          v73 = v10;
          v74 = v6;
          objc_msgSend(v78, "objectForKeyedSubscript:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("Inexpensive"));
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = v38;
          if (v38)
          {
            objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("Upload"));
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "doubleValue");
            v41 = v40;

            v42 = v8 + v41;
            v12 = v12 + v41;
            v43 = v76 + v41;
            v44 = v72 + v41;
            objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("Download"));
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "doubleValue");
            v47 = v46;

            v48 = v42 + v47;
            v11 = v11 + v47;
            v76 = v43 + v47;
            v72 = v44 + v47;
          }
          else
          {
            v48 = v8;
          }
          objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("Expensive"));
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = v49;
          if (v49)
          {
            objc_msgSend(v49, "objectForKeyedSubscript:", CFSTR("Upload"));
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v50, "doubleValue");
            v52 = v51;

            v53 = v9 + v52;
            v12 = v12 + v52;
            v54 = v76 + v52;
            v55 = v71 + v52;
            objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("Download"));
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v56, "doubleValue");
            v58 = v57;

            v9 = v53 + v58;
            v11 = v11 + v58;
            v76 = v54 + v58;
            v71 = v55 + v58;
          }
          v8 = v48;
          v10 = v73;
          v6 = v74;
        }

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v79, v83, 16);
      if (!v5)
        goto LABEL_23;
    }
  }
  v71 = 0.0;
  v72 = 0.0;
  v6 = 0.0;
  v76 = 0.0;
  v77 = 0.0;
  v8 = 0.0;
  v9 = 0.0;
  v10 = 0.0;
  v11 = 0.0;
  v12 = 0.0;
LABEL_23:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v10);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "setObject:forKeyedSubscript:", v59, CFSTR("Cell"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v76);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "setObject:forKeyedSubscript:", v60, CFSTR("WiFi"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v12);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "setObject:forKeyedSubscript:", v61, CFSTR("Upload"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v11);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "setObject:forKeyedSubscript:", v62, CFSTR("Download"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v9);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "setObject:forKeyedSubscript:", v63, CFSTR("Expensive"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v8);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "setObject:forKeyedSubscript:", v64, CFSTR("Inexpensive"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v6);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "setObject:forKeyedSubscript:", v65, CFSTR("CellExpensive"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v71);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "setObject:forKeyedSubscript:", v66, CFSTR("WiFiExpensive"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v77);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "setObject:forKeyedSubscript:", v67, CFSTR("CellInexpensive"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v72);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "setObject:forKeyedSubscript:", v68, CFSTR("WiFiInexpensive"));

  return v70;
}

- (id)evaluateBytesConsumed:(id)a3 withPreviousParameters:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  double v35;
  double v36;
  void *v37;
  void *v38;
  double v39;
  void *v40;
  void *v41;
  void *v42;
  double v43;
  void *v44;
  void *v45;
  void *v46;
  double v47;
  void *v48;
  void *v49;
  void *v50;
  double v51;
  void *v52;
  void *v53;
  void *v54;
  double v55;
  void *v56;
  void *v57;
  void *v58;
  double v59;
  void *v60;
  void *v61;
  void *v62;
  double v63;
  void *v64;
  void *v65;
  void *v66;
  double v67;
  void *v68;
  void *v69;
  double v70;
  double v71;
  void *v72;
  double v73;
  double v74;
  void *v75;
  void *v76;
  double v77;
  void *v78;
  void *v79;
  void *v80;
  double v81;
  void *v82;
  void *v84;
  double v85;
  double v86;
  void *v87;
  double v88;
  double v89;
  void *v90;
  double v91;
  double v92;
  void *v93;
  double v94;
  double v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  double v130;
  void *v131;
  void *v132;
  void *v133;
  double v134;
  void *v135;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v6;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Cell"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {

LABEL_4:
    -[_DASScheduler extendUpdateActivityDictionary:](self, "extendUpdateActivityDictionary:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("Expensive"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "doubleValue");
    v15 = v14;

    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("Inexpensive"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "doubleValue");
    v18 = v17;

    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("Upload"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "doubleValue");
    v21 = v20;

    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("Download"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "doubleValue");
    v24 = v23;

    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("CellExpensive"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "doubleValue");
    v27 = v26;

    objc_msgSend(v12, "objectForKeyedSubscript:");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "doubleValue");
    v30 = v29;

    objc_msgSend(v12, "objectForKeyedSubscript:");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "doubleValue");
    v33 = v32;

    objc_msgSend(v12, "objectForKeyedSubscript:");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "doubleValue");
    v36 = v35;

    v37 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("Expensive"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "doubleValue");
    objc_msgSend(v37, "numberWithDouble:", v15 + v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v40, CFSTR("Expensive"));

    v41 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("Inexpensive"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "doubleValue");
    objc_msgSend(v41, "numberWithDouble:", v18 + v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v44, CFSTR("Inexpensive"));

    v45 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("Upload"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "doubleValue");
    objc_msgSend(v45, "numberWithDouble:", v21 + v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v48, CFSTR("Upload"));

    v49 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("Download"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "doubleValue");
    objc_msgSend(v49, "numberWithDouble:", v24 + v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v52, CFSTR("Download"));

    v53 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("CellExpensive"));
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "doubleValue");
    objc_msgSend(v53, "numberWithDouble:", v27 + v55);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v56, CFSTR("CellExpensive"));

    v57 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("CellInexpensive"));
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "doubleValue");
    objc_msgSend(v57, "numberWithDouble:", v30 + v59);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v60, CFSTR("CellInexpensive"));

    v61 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("WiFiExpensive"));
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "doubleValue");
    objc_msgSend(v61, "numberWithDouble:", v33 + v63);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v64, CFSTR("WiFiExpensive"));

    v65 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("WiFiInexpensive"));
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "doubleValue");
    objc_msgSend(v65, "numberWithDouble:", v36 + v67);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v68, CFSTR("WiFiInexpensive"));

    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("Cell"));
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "doubleValue");
    v71 = v70;

    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("WiFi"));
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "doubleValue");
    v74 = v73;

    goto LABEL_5;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("WiFi"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    goto LABEL_4;
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("DownloadedOnWifi"));
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "doubleValue");
  v86 = v85;

  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("DownloadedOnCell"));
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "doubleValue");
  v89 = v88;

  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("UploadedOnWifi"));
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "doubleValue");
  v92 = v91;

  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("UploadedOnCell"));
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "doubleValue");
  v95 = v94;

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("Expensive"));
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  if (v96)
  {
    v97 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("Expensive"));
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v98, "doubleValue");
    objc_msgSend(v97, "numberWithDouble:");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v99, CFSTR("Expensive"));

  }
  else
  {
    objc_msgSend(v8, "setObject:forKeyedSubscript:", &unk_1E6259730, CFSTR("Expensive"));
  }

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("Inexpensive"));
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  if (v100)
  {
    v101 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("Inexpensive"));
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v102, "doubleValue");
    objc_msgSend(v101, "numberWithDouble:");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v103, CFSTR("Inexpensive"));

  }
  else
  {
    objc_msgSend(v8, "setObject:forKeyedSubscript:", &unk_1E6259730, CFSTR("Inexpensive"));
  }

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("Upload"));
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  if (v104)
  {
    v105 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("Upload"));
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v106, "doubleValue");
    objc_msgSend(v105, "numberWithDouble:");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v107, CFSTR("Upload"));

  }
  else
  {
    objc_msgSend(v8, "setObject:forKeyedSubscript:", &unk_1E6259730, CFSTR("Upload"));
  }

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("Download"));
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  if (v108)
  {
    v109 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("Download"));
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v110, "doubleValue");
    objc_msgSend(v109, "numberWithDouble:");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v111, CFSTR("Download"));

  }
  else
  {
    objc_msgSend(v8, "setObject:forKeyedSubscript:", &unk_1E6259730, CFSTR("Download"));
  }

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("WiFiExpensive"));
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  if (v112)
  {
    v113 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("WiFiExpensive"));
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v114, "doubleValue");
    objc_msgSend(v113, "numberWithDouble:");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v115, CFSTR("WiFiExpensive"));

  }
  else
  {
    objc_msgSend(v8, "setObject:forKeyedSubscript:", &unk_1E6259730, CFSTR("WiFiExpensive"));
  }

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("WiFiInexpensive"));
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  if (v116)
  {
    v117 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("WiFiInexpensive"));
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v118, "doubleValue");
    objc_msgSend(v117, "numberWithDouble:");
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v119, CFSTR("WiFiInexpensive"));

  }
  else
  {
    objc_msgSend(v8, "setObject:forKeyedSubscript:", &unk_1E6259730, CFSTR("WiFiInexpensive"));
  }

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("CellExpensive"));
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  if (v120)
  {
    v121 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("CellExpensive"));
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v122, "doubleValue");
    objc_msgSend(v121, "numberWithDouble:");
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v123, CFSTR("CellExpensive"));

  }
  else
  {
    objc_msgSend(v8, "setObject:forKeyedSubscript:", &unk_1E6259730, CFSTR("CellExpensive"));
  }

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("CellInexpensive"));
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  if (v124)
  {
    v125 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("CellInexpensive"));
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v126, "doubleValue");
    objc_msgSend(v125, "numberWithDouble:");
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v127, CFSTR("CellInexpensive"));

  }
  else
  {
    objc_msgSend(v8, "setObject:forKeyedSubscript:", &unk_1E6259730, CFSTR("CellInexpensive"));
  }

  v128 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("Upload"));
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v129, "doubleValue");
  objc_msgSend(v128, "numberWithDouble:", v95 + v92 + v130);
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v131, CFSTR("Upload"));

  v132 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("Download"));
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v133, "doubleValue");
  objc_msgSend(v132, "numberWithDouble:", v89 + v86 + v134);
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v135, CFSTR("Download"));

  v71 = v89 + v95;
  v74 = v86 + v92;
LABEL_5:
  v75 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("WiFi"));
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "doubleValue");
  objc_msgSend(v75, "numberWithDouble:", v74 + v77);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v78, CFSTR("WiFi"));

  v79 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("Cell"));
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "doubleValue");
  objc_msgSend(v79, "numberWithDouble:", v71 + v81);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v82, CFSTR("Cell"));

  return v8;
}

- (void)updateBytesConsumedForActivity:(id)a3 withParameters:(id)a4
{
  id v6;
  id v7;
  NSMutableDictionary *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  id v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "dataBudgetingEnabled"))
  {
    v8 = self->_activityToDataMap;
    objc_sync_enter(v8);
    -[NSMutableDictionary objectForKeyedSubscript:](self->_activityToDataMap, "objectForKeyedSubscript:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[_DASScheduler dasFrameworkLog](self, "dasFrameworkLog");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v23 = 138412802;
      v24 = v6;
      v25 = 2112;
      v26 = v9;
      v27 = 2112;
      v28 = v7;
      _os_log_debug_impl(&dword_1B0DF4000, v10, OS_LOG_TYPE_DEBUG, "Activity %@ had %@. Updating with new parameter: %@", (uint8_t *)&v23, 0x20u);
    }

    -[_DASScheduler evaluateBytesConsumed:withPreviousParameters:](self, "evaluateBytesConsumed:withPreviousParameters:", v7, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_activityToDataMap, "setObject:forKeyedSubscript:", v11, v6);
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("WiFi"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "doubleValue");
    v14 = v13;
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("Cell"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "doubleValue");
    v17 = v16;

    v18 = v14 + v17;
    if (v18 > 1048576.0)
    {
      -[_DASScheduler dasFrameworkLog](self, "dasFrameworkLog");
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v18);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 138412802;
        v24 = v6;
        v25 = 2112;
        v26 = v20;
        v27 = 2112;
        v28 = &unk_1E6259748;
        _os_log_impl(&dword_1B0DF4000, v19, OS_LOG_TYPE_DEFAULT, "%@: %@ > %@", (uint8_t *)&v23, 0x20u);

      }
      -[_DASScheduler currentConnection](self, "currentConnection");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "remoteObjectProxy");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "updateActivity:withParameters:", v6, v11);

      objc_msgSend(v11, "removeAllObjects");
    }
    objc_sync_exit(v8);

  }
}

- (void)createActivityGroup:(id)a3
{
  _DASSubmissionManager *submissionManager;
  id v5;
  void *v6;
  id v7;

  submissionManager = self->_submissionManager;
  v5 = a3;
  -[_DASSubmissionManager createActivityGroup:](submissionManager, "createActivityGroup:", v5);
  -[_DASScheduler currentConnection](self, "currentConnection");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "remoteObjectProxy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "createActivityGroup:", v5);

}

- (BOOL)submitActivity:(id)a3 inGroup:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  _DASScheduler *v11;
  NSMutableDictionary *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  NSObject *v17;
  void *v18;
  _DASScheduler *v19;
  NSMutableDictionary *submittedActivities;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;
  id v26;
  _DASScheduler *v27;
  NSMutableDictionary *v28;
  void *v29;
  void *v30;
  BOOL v31;
  uint64_t v33;
  uint64_t v34;
  void (*v35)(uint64_t, char, void *);
  void *v36;
  _DASScheduler *v37;
  id v38;
  uint64_t *v39;
  __int128 *v40;
  _QWORD v41[5];
  id v42;
  uint64_t *v43;
  __int128 *p_buf;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  char v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 buf;
  uint64_t v54;
  uint64_t (*v55)(uint64_t, uint64_t);
  void (*v56)(uint64_t);
  id v57;
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_msgSend(v8, "setClientName:", self->_clientName);
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSubmitDate:", v10);

  v11 = self;
  objc_sync_enter(v11);
  if (objc_msgSend(v8, "requestsApplicationLaunch") && objc_msgSend(v8, "keepsPrevious"))
  {
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    v12 = v11->_submittedActivities;
    v13 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v50;
      while (2)
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v50 != v14)
            objc_enumerationMutation(v12);
          v16 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
          if ((objc_msgSend(v16, "requestsApplicationLaunch") & 1) != 0
            && objc_msgSend(v16, "isIdenticalLaunchTo:", v8))
          {
            if (os_log_type_enabled((os_log_t)v11->_dasFrameworkLog, OS_LOG_TYPE_ERROR))
              -[_DASScheduler submitActivity:inGroup:error:].cold.1();
            if (a5)
            {
              objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("_DASActivitySchedulerErrorDomain"), 5, &unk_1E6259600);
              *a5 = (id)objc_claimAutoreleasedReturnValue();
            }

            objc_sync_exit(v11);
            v31 = 0;
            goto LABEL_21;
          }
        }
        v13 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
        if (v13)
          continue;
        break;
      }
    }

  }
  objc_sync_exit(v11);

  -[_DASScheduler dasFrameworkLog](v11, "dasFrameworkLog");
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v8;
    _os_log_impl(&dword_1B0DF4000, v17, OS_LOG_TYPE_DEFAULT, "SUBMITTING: %{public}@", (uint8_t *)&buf, 0xCu);
  }

  +[_DASSubmissionRateLimiter sharedLimiter](_DASSubmissionRateLimiter, "sharedLimiter");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "trackActivity:", v8);

  v19 = v11;
  objc_sync_enter(v19);
  submittedActivities = v19->_submittedActivities;
  objc_msgSend(v8, "uuid");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](submittedActivities, "setObject:forKeyedSubscript:", v8, v21);

  objc_sync_exit(v19);
  v45 = 0;
  v46 = &v45;
  v47 = 0x2020000000;
  v48 = 0;
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v54 = 0x3032000000;
  v55 = __Block_byref_object_copy__0;
  v56 = __Block_byref_object_dispose__0;
  v57 = 0;
  -[_DASScheduler currentConnection](v19, "currentConnection");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = MEMORY[0x1E0C809B0];
  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __46___DASScheduler_submitActivity_inGroup_error___block_invoke;
  v41[3] = &unk_1E624BB38;
  v43 = &v45;
  v41[4] = v19;
  v24 = v8;
  v42 = v24;
  p_buf = &buf;
  objc_msgSend(v22, "synchronousRemoteObjectProxyWithErrorHandler:", v41);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v23;
  v34 = 3221225472;
  v35 = __46___DASScheduler_submitActivity_inGroup_error___block_invoke_302;
  v36 = &unk_1E624BB60;
  v39 = &v45;
  v37 = v19;
  v26 = v24;
  v38 = v26;
  v40 = &buf;
  objc_msgSend(v25, "submitActivity:inGroup:withHandler:", v26, v9, &v33);

  if (!*((_BYTE *)v46 + 24))
  {
    v27 = v19;
    objc_sync_enter(v27);
    v28 = v19->_submittedActivities;
    objc_msgSend(v26, "uuid", v33, v34, v35, v36, v37);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](v28, "removeObjectForKey:", v29);

    objc_sync_exit(v27);
  }
  if (a5)
  {
    v30 = *(void **)(*((_QWORD *)&buf + 1) + 40);
    if (v30)
      *a5 = objc_retainAutorelease(v30);
  }
  v31 = *((_BYTE *)v46 + 24) != 0;

  _Block_object_dispose(&buf, 8);
  _Block_object_dispose(&v45, 8);
LABEL_21:

  return v31;
}

- (BOOL)deferActivities:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v9[5];
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  -[_DASScheduler currentConnection](self, "currentConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __33___DASScheduler_deferActivities___block_invoke;
  v10[3] = &unk_1E624BB88;
  v10[4] = self;
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v6;
  v9[1] = 3221225472;
  v9[2] = __33___DASScheduler_deferActivities___block_invoke_304;
  v9[3] = &unk_1E624BBB0;
  v9[4] = &v11;
  objc_msgSend(v7, "deferActivities:withHandler:", v4, v9);

  LOBYTE(v5) = *((_BYTE *)v12 + 24);
  _Block_object_dispose(&v11, 8);

  return (char)v5;
}

- (NSMutableDictionary)submittedActivities
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v8[5];
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__0;
  v14 = __Block_byref_object_dispose__0;
  v15 = 0;
  -[_DASScheduler currentConnection](self, "currentConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __36___DASScheduler_submittedActivities__block_invoke;
  v9[3] = &unk_1E624BB88;
  v9[4] = self;
  objc_msgSend(v3, "synchronousRemoteObjectProxyWithErrorHandler:", v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  v8[1] = 3221225472;
  v8[2] = __36___DASScheduler_submittedActivities__block_invoke_306;
  v8[3] = &unk_1E624BBD8;
  v8[4] = &v10;
  objc_msgSend(v5, "submittedActivitiesWithHandler:", v8);

  v6 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return (NSMutableDictionary *)v6;
}

- (id)delayedRunningActivities
{
  dispatch_semaphore_t v3;
  void *v4;
  NSObject *v5;
  dispatch_time_t v6;
  id v7;
  _QWORD v9[4];
  NSObject *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__0;
  v16 = __Block_byref_object_dispose__0;
  v17 = 0;
  v3 = dispatch_semaphore_create(0);
  -[NSXPCConnection remoteObjectProxy](self->_xpcConnection, "remoteObjectProxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __41___DASScheduler_delayedRunningActivities__block_invoke;
  v9[3] = &unk_1E624BC00;
  v11 = &v12;
  v5 = v3;
  v10 = v5;
  objc_msgSend(v4, "delayedRunningActivitiesWithHandler:", v9);

  v6 = dispatch_time(0, 10000000000);
  dispatch_semaphore_wait(v5, v6);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (id)runningActivities
{
  dispatch_semaphore_t v3;
  void *v4;
  void *v5;
  NSObject *v6;
  dispatch_time_t v7;
  id v8;
  _QWORD v10[4];
  NSObject *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__0;
  v17 = __Block_byref_object_dispose__0;
  v18 = 0;
  v3 = dispatch_semaphore_create(0);
  -[_DASScheduler currentConnection](self, "currentConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remoteObjectProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __34___DASScheduler_runningActivities__block_invoke;
  v10[3] = &unk_1E624BC00;
  v12 = &v13;
  v6 = v3;
  v11 = v6;
  objc_msgSend(v5, "runningActivitiesWithHandler:", v10);

  v7 = dispatch_time(0, 10000000000);
  dispatch_semaphore_wait(v6, v7);
  v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v8;
}

- (id)runningGroupActivities
{
  dispatch_semaphore_t v3;
  void *v4;
  void *v5;
  NSObject *v6;
  dispatch_time_t v7;
  id v8;
  _QWORD v10[4];
  NSObject *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__0;
  v17 = __Block_byref_object_dispose__0;
  v18 = 0;
  v3 = dispatch_semaphore_create(0);
  -[_DASScheduler currentConnection](self, "currentConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remoteObjectProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __39___DASScheduler_runningGroupActivities__block_invoke;
  v10[3] = &unk_1E624BC00;
  v12 = &v13;
  v6 = v3;
  v11 = v6;
  objc_msgSend(v5, "runningGroupActivitiesWithHandler:", v10);

  v7 = dispatch_time(0, 10000000000);
  dispatch_semaphore_wait(v6, v7);
  v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v8;
}

- (void)forceRunActivities:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[5];

  v4 = a3;
  -[_DASScheduler currentConnection](self, "currentConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __36___DASScheduler_forceRunActivities___block_invoke;
  v7[3] = &unk_1E624BB88;
  v7[4] = self;
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "forceRunActivities:", v4);

}

- (void)runActivitiesWithUrgency:(int64_t)a3 activities:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[5];

  v6 = a4;
  -[_DASScheduler currentConnection](self, "currentConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __53___DASScheduler_runActivitiesWithUrgency_activities___block_invoke;
  v9[3] = &unk_1E624BB88;
  v9[4] = self;
  objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "runActivitiesWithUrgency:activities:", a3, v6);

}

- (id)scoresForActivityWithName:(id)a3
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)activityRunStatistics
{
  return (id)MEMORY[0x1E0C9AA70];
}

- (id)currentPredictions
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v8[5];
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__0;
  v14 = __Block_byref_object_dispose__0;
  v15 = (id)MEMORY[0x1E0C9AA70];
  -[_DASScheduler currentConnection](self, "currentConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __35___DASScheduler_currentPredictions__block_invoke;
  v9[3] = &unk_1E624BB88;
  v9[4] = self;
  objc_msgSend(v3, "synchronousRemoteObjectProxyWithErrorHandler:", v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  v8[1] = 3221225472;
  v8[2] = __35___DASScheduler_currentPredictions__block_invoke_308;
  v8[3] = &unk_1E624BC28;
  v8[4] = &v10;
  objc_msgSend(v5, "currentPredictionsWithHandler:", v8);

  v6 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v6;
}

- (id)statistics
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v8[5];
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__0;
  v14 = __Block_byref_object_dispose__0;
  v15 = 0;
  -[_DASScheduler currentConnection](self, "currentConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __27___DASScheduler_statistics__block_invoke;
  v9[3] = &unk_1E624BB88;
  v9[4] = self;
  objc_msgSend(v3, "synchronousRemoteObjectProxyWithErrorHandler:", v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  v8[1] = 3221225472;
  v8[2] = __27___DASScheduler_statistics__block_invoke_310;
  v8[3] = &unk_1E624BC28;
  v8[4] = &v10;
  objc_msgSend(v5, "statisticsWithHandler:", v8);

  v6 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v6;
}

- (id)resetFastPassActivities:(id)a3 resetAll:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  _QWORD v12[5];
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = a4;
  v6 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__0;
  v18 = __Block_byref_object_dispose__0;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  -[_DASScheduler currentConnection](self, "currentConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __50___DASScheduler_resetFastPassActivities_resetAll___block_invoke;
  v13[3] = &unk_1E624BB88;
  v13[4] = self;
  objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __50___DASScheduler_resetFastPassActivities_resetAll___block_invoke_311;
  v12[3] = &unk_1E624BC50;
  v12[4] = &v14;
  objc_msgSend(v9, "resetFastPassActivities:resetAll:withHandler:", v6, v4, v12);

  v10 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v10;
}

- (id)inspect:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v10[5];
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__0;
  v16 = __Block_byref_object_dispose__0;
  v17 = 0;
  -[_DASScheduler currentConnection](self, "currentConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __25___DASScheduler_inspect___block_invoke;
  v11[3] = &unk_1E624BB88;
  v11[4] = self;
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __25___DASScheduler_inspect___block_invoke_313;
  v10[3] = &unk_1E624BBD8;
  v10[4] = &v12;
  objc_msgSend(v7, "inspect:withHandler:", v4, v10);

  v8 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v8;
}

- (void)resubmitRunningTasks:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, void *);
  void *v11;
  _DASScheduler *v12;
  id v13;

  v4 = a3;
  -[_DASScheduler currentConnection](self, "currentConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __38___DASScheduler_resubmitRunningTasks___block_invoke;
  v11 = &unk_1E624BC78;
  v12 = self;
  v13 = v4;
  v6 = v4;
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", &v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "resubmitRunningTasks:", v6, v8, v9, v10, v11, v12);

}

- (void)forceResetOfResultIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[5];

  v4 = a3;
  -[_DASScheduler currentConnection](self, "currentConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __46___DASScheduler_forceResetOfResultIdentifier___block_invoke;
  v7[3] = &unk_1E624BB88;
  v7[4] = self;
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "forceResetOfResultIdentifier:", v4);

}

- (id)queryStatusOfResultIdentifier:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[5];
  _QWORD v12[5];
  id v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__0;
  v18 = __Block_byref_object_dispose__0;
  v19 = 0;
  -[_DASScheduler currentConnection](self, "currentConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __47___DASScheduler_queryStatusOfResultIdentifier___block_invoke;
  v12[3] = &unk_1E624BC78;
  v12[4] = self;
  v7 = v4;
  v13 = v7;
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __47___DASScheduler_queryStatusOfResultIdentifier___block_invoke_314;
  v11[3] = &unk_1E624BC28;
  v11[4] = &v14;
  objc_msgSend(v8, "queryStatusOfResultIdentifier:withHandler:", v7, v11);

  v9 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v9;
}

- (id)queryDependenciesOfTaskIdentifier:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[5];
  _QWORD v12[5];
  id v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__0;
  v18 = __Block_byref_object_dispose__0;
  v19 = 0;
  -[_DASScheduler currentConnection](self, "currentConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __51___DASScheduler_queryDependenciesOfTaskIdentifier___block_invoke;
  v12[3] = &unk_1E624BC78;
  v12[4] = self;
  v7 = v4;
  v13 = v7;
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __51___DASScheduler_queryDependenciesOfTaskIdentifier___block_invoke_315;
  v11[3] = &unk_1E624BC28;
  v11[4] = &v14;
  objc_msgSend(v8, "queryDependenciesOfTaskIdentifier:withHandler:", v7, v11);

  v9 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v9;
}

- (id)allBudgets
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v8[5];
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__0;
  v14 = __Block_byref_object_dispose__0;
  v15 = 0;
  -[_DASScheduler currentConnection](self, "currentConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __27___DASScheduler_allBudgets__block_invoke;
  v9[3] = &unk_1E624BB88;
  v9[4] = self;
  objc_msgSend(v3, "synchronousRemoteObjectProxyWithErrorHandler:", v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  v8[1] = 3221225472;
  v8[2] = __27___DASScheduler_allBudgets__block_invoke_316;
  v8[3] = &unk_1E624BBD8;
  v8[4] = &v10;
  objc_msgSend(v5, "allBudgetsWithHandler:", v8);

  v6 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v6;
}

- (double)balanceForBudgetWithName:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  double v9;
  _QWORD v11[5];
  _QWORD v12[5];
  id v13;
  uint64_t v14;
  double *v15;
  uint64_t v16;
  uint64_t v17;

  v4 = a3;
  v14 = 0;
  v15 = (double *)&v14;
  v16 = 0x2020000000;
  v17 = 0;
  -[_DASScheduler currentConnection](self, "currentConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __42___DASScheduler_balanceForBudgetWithName___block_invoke;
  v12[3] = &unk_1E624BC78;
  v12[4] = self;
  v7 = v4;
  v13 = v7;
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __42___DASScheduler_balanceForBudgetWithName___block_invoke_317;
  v11[3] = &unk_1E624BCA0;
  v11[4] = &v14;
  objc_msgSend(v8, "balanceForBudgetWithName:withHandler:", v7, v11);

  v9 = v15[3];
  _Block_object_dispose(&v14, 8);

  return v9;
}

- (void)setBalance:(double)a3 forBudgetWithName:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *);
  void *v13;
  _DASScheduler *v14;
  id v15;

  v6 = a4;
  -[_DASScheduler currentConnection](self, "currentConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __46___DASScheduler_setBalance_forBudgetWithName___block_invoke;
  v13 = &unk_1E624BC78;
  v14 = self;
  v15 = v6;
  v8 = v6;
  objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", &v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBalance:forBudgetWithName:", v8, a3, v10, v11, v12, v13, v14);

}

- (void)decrementBy:(double)a3 forBudgetWithName:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *);
  void *v13;
  _DASScheduler *v14;
  id v15;

  v6 = a4;
  -[_DASScheduler currentConnection](self, "currentConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __47___DASScheduler_decrementBy_forBudgetWithName___block_invoke;
  v13 = &unk_1E624BC78;
  v14 = self;
  v15 = v6;
  v8 = v6;
  objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", &v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "decrementBy:forBudgetWithName:", v8, a3, v10, v11, v12, v13, v14);

}

- (void)setCapacity:(double)a3 forBudgetWithName:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *);
  void *v13;
  _DASScheduler *v14;
  id v15;

  v6 = a4;
  -[_DASScheduler currentConnection](self, "currentConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __47___DASScheduler_setCapacity_forBudgetWithName___block_invoke;
  v13 = &unk_1E624BC78;
  v14 = self;
  v15 = v6;
  v8 = v6;
  objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", &v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setCapacity:forBudgetWithName:", v8, a3, v10, v11, v12, v13, v14);

}

- (id)policies
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v8[5];
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__0;
  v14 = __Block_byref_object_dispose__0;
  v15 = 0;
  -[_DASScheduler currentConnection](self, "currentConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __25___DASScheduler_policies__block_invoke;
  v9[3] = &unk_1E624BB88;
  v9[4] = self;
  objc_msgSend(v3, "synchronousRemoteObjectProxyWithErrorHandler:", v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  v8[1] = 3221225472;
  v8[2] = __25___DASScheduler_policies__block_invoke_319;
  v8[3] = &unk_1E624BC28;
  v8[4] = &v10;
  objc_msgSend(v5, "policiesWithHandler:", v8);

  v6 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v6;
}

- (id)clasStatus
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v8[5];
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__0;
  v14 = __Block_byref_object_dispose__0;
  v15 = 0;
  -[_DASScheduler currentConnection](self, "currentConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __27___DASScheduler_clasStatus__block_invoke;
  v9[3] = &unk_1E624BB88;
  v9[4] = self;
  objc_msgSend(v3, "synchronousRemoteObjectProxyWithErrorHandler:", v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  v8[1] = 3221225472;
  v8[2] = __27___DASScheduler_clasStatus__block_invoke_320;
  v8[3] = &unk_1E624BC28;
  v8[4] = &v10;
  objc_msgSend(v5, "clasStatusWithHandler:", v8);

  v6 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v6;
}

- (id)evaluatePolicies:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[5];
  _QWORD v12[5];
  id v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__0;
  v18 = __Block_byref_object_dispose__0;
  v19 = 0;
  -[_DASScheduler currentConnection](self, "currentConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __34___DASScheduler_evaluatePolicies___block_invoke;
  v12[3] = &unk_1E624BC78;
  v12[4] = self;
  v7 = v4;
  v13 = v7;
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __34___DASScheduler_evaluatePolicies___block_invoke_321;
  v11[3] = &unk_1E624BC28;
  v11[4] = &v14;
  objc_msgSend(v8, "evaluatePolicies:handler:", v7, v11);

  v9 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v9;
}

- (BOOL)evaluateAllActivitiesWithHandle:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v9[6];
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 1;
  -[_DASScheduler currentConnection](self, "currentConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __49___DASScheduler_evaluateAllActivitiesWithHandle___block_invoke;
  v10[3] = &unk_1E624BCC8;
  v10[4] = self;
  v10[5] = &v11;
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v6;
  v9[1] = 3221225472;
  v9[2] = __49___DASScheduler_evaluateAllActivitiesWithHandle___block_invoke_322;
  v9[3] = &unk_1E624BCF0;
  v9[4] = self;
  v9[5] = &v11;
  objc_msgSend(v7, "evaluateAllActivities:handler:", v4, v9);

  LOBYTE(self) = *((_BYTE *)v12 + 24);
  _Block_object_dispose(&v11, 8);

  return (char)self;
}

- (id)runProceedableActivities:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[5];
  _QWORD v12[5];
  id v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__0;
  v18 = __Block_byref_object_dispose__0;
  v19 = 0;
  -[_DASScheduler currentConnection](self, "currentConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __42___DASScheduler_runProceedableActivities___block_invoke;
  v12[3] = &unk_1E624BC78;
  v12[4] = self;
  v7 = v4;
  v13 = v7;
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __42___DASScheduler_runProceedableActivities___block_invoke_323;
  v11[3] = &unk_1E624BC28;
  v11[4] = &v14;
  objc_msgSend(v8, "runProceedableActivities:handler:", v7, v11);

  v9 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v9;
}

- (id)blockingPoliciesWithParameters:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v10[5];
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__0;
  v16 = __Block_byref_object_dispose__0;
  v17 = 0;
  -[_DASScheduler currentConnection](self, "currentConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __48___DASScheduler_blockingPoliciesWithParameters___block_invoke;
  v11[3] = &unk_1E624BB88;
  v11[4] = self;
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __48___DASScheduler_blockingPoliciesWithParameters___block_invoke_324;
  v10[3] = &unk_1E624BBD8;
  v10[4] = &v12;
  objc_msgSend(v7, "blockingPoliciesWithParameters:handler:", v4, v10);

  v8 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v8;
}

- (id)activityContainsOverrides:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v10[5];
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__0;
  v16 = __Block_byref_object_dispose__0;
  v17 = 0;
  -[_DASScheduler currentConnection](self, "currentConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __43___DASScheduler_activityContainsOverrides___block_invoke;
  v11[3] = &unk_1E624BB88;
  v11[4] = self;
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __43___DASScheduler_activityContainsOverrides___block_invoke_325;
  v10[3] = &unk_1E624BC28;
  v10[4] = &v12;
  objc_msgSend(v7, "activityContainsOverrides:handler:", v4, v10);

  v8 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v8;
}

- (void)enterTestModeWithParameters:(id)a3 reset:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  _QWORD v13[5];

  v4 = a4;
  v6 = a3;
  -[_DASScheduler currentConnection](self, "currentConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __51___DASScheduler_enterTestModeWithParameters_reset___block_invoke;
  v13[3] = &unk_1E624BB88;
  v13[4] = self;
  objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __51___DASScheduler_enterTestModeWithParameters_reset___block_invoke_326;
  v11[3] = &unk_1E624BD18;
  v11[4] = self;
  v12 = v6;
  v10 = v6;
  objc_msgSend(v9, "enterTestModeWithParameters:reset:handler:", v10, v4, v11);

}

- (BOOL)enableTaskRegistryMode:(BOOL)a3 processes:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v11[5];
  _QWORD v12[5];
  char v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v4 = a3;
  v6 = a4;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  -[_DASScheduler currentConnection](self, "currentConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __50___DASScheduler_enableTaskRegistryMode_processes___block_invoke;
  v12[3] = &unk_1E624BD40;
  v12[4] = self;
  v13 = v4;
  objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __50___DASScheduler_enableTaskRegistryMode_processes___block_invoke_327;
  v11[3] = &unk_1E624BBB0;
  v11[4] = &v14;
  objc_msgSend(v9, "enableTaskRegistryMode:processes:handler:", v4, v6, v11);

  LOBYTE(v4) = *((_BYTE *)v15 + 24);
  _Block_object_dispose(&v14, 8);

  return v4;
}

- (void)submitRateLimitConfiguration:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  _QWORD v11[5];

  v4 = a3;
  -[_DASScheduler currentConnection](self, "currentConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __46___DASScheduler_submitRateLimitConfiguration___block_invoke;
  v11[3] = &unk_1E624BB88;
  v11[4] = self;
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v6;
  v9[1] = 3221225472;
  v9[2] = __46___DASScheduler_submitRateLimitConfiguration___block_invoke_328;
  v9[3] = &unk_1E624BD18;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  objc_msgSend(v7, "submitRateLimitConfiguration:handler:", v8, v9);

}

- (void)pauseWithParameters:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  _QWORD v11[5];

  v4 = a3;
  -[_DASScheduler currentConnection](self, "currentConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __37___DASScheduler_pauseWithParameters___block_invoke;
  v11[3] = &unk_1E624BB88;
  v11[4] = self;
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v6;
  v9[1] = 3221225472;
  v9[2] = __37___DASScheduler_pauseWithParameters___block_invoke_329;
  v9[3] = &unk_1E624BD18;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  objc_msgSend(v7, "pauseWithParameters:handler:", v8, v9);

}

- (void)addPauseExceptParameter:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  _QWORD v11[5];

  v4 = a3;
  -[_DASScheduler currentConnection](self, "currentConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __41___DASScheduler_addPauseExceptParameter___block_invoke;
  v11[3] = &unk_1E624BB88;
  v11[4] = self;
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v6;
  v9[1] = 3221225472;
  v9[2] = __41___DASScheduler_addPauseExceptParameter___block_invoke_330;
  v9[3] = &unk_1E624BD18;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  objc_msgSend(v7, "addPauseExceptParameter:handler:", v8, v9);

}

- (void)runActivitiesWithDelayedStart:(id)a3
{
  id v4;
  void *v5;
  _DASScheduler *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  NSMutableDictionary *submittedActivities;
  void *v12;
  void *v13;
  void *v14;
  NSMutableDictionary *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  NSMutableDictionary *delayedStartTasks;
  void *v23;
  NSObject *runQueue;
  NSObject *v25;
  NSObject *dasFrameworkLog;
  void *v27;
  NSObject *v28;
  void *v29;
  id v30;
  id obj;
  void *v32;
  void *v33;
  _QWORD block[6];
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  void *v46;
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (void *)objc_msgSend(v4, "mutableCopy");
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = self;
  objc_sync_enter(v6);
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  obj = v4;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v40 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
        submittedActivities = v6->_submittedActivities;
        objc_msgSend(v10, "uuid");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](submittedActivities, "objectForKeyedSubscript:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          if (objc_msgSend(v10, "delayedStart"))
            v14 = v5;
          else
            v14 = v33;
          objc_msgSend(v14, "addObject:", v13);
          objc_msgSend(v32, "removeObject:", v13);
          v15 = v6->_submittedActivities;
          objc_msgSend(v10, "uuid");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary removeObjectForKey:](v15, "removeObjectForKey:", v16);

        }
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
    }
    while (v7);
  }

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v30 = v5;
  v17 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
  if (v17)
  {
    v18 = *(_QWORD *)v36;
    v19 = MEMORY[0x1E0C809B0];
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v36 != v18)
          objc_enumerationMutation(v30);
        v21 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * j);
        delayedStartTasks = v6->_delayedStartTasks;
        objc_msgSend(v21, "uuid");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](delayedStartTasks, "setObject:forKeyedSubscript:", v21, v23);

        objc_msgSend(v21, "handlerQueue");
        runQueue = objc_claimAutoreleasedReturnValue();
        v25 = runQueue;
        if (!runQueue)
          runQueue = v6->_runQueue;
        block[0] = v19;
        block[1] = 3221225472;
        block[2] = __47___DASScheduler_runActivitiesWithDelayedStart___block_invoke;
        block[3] = &unk_1E624B688;
        block[4] = v6;
        block[5] = v21;
        dispatch_async(runQueue, block);

      }
      v17 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
    }
    while (v17);
  }

  objc_sync_exit(v6);
  if (objc_msgSend(v32, "count"))
  {
    dasFrameworkLog = v6->_dasFrameworkLog;
    if (os_log_type_enabled(dasFrameworkLog, OS_LOG_TYPE_DEFAULT))
    {
      v27 = (void *)MEMORY[0x1E0CB37E8];
      v28 = dasFrameworkLog;
      objc_msgSend(v27, "numberWithUnsignedInteger:", objc_msgSend(v32, "count"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v44 = v29;
      v45 = 2112;
      v46 = v32;
      _os_log_impl(&dword_1B0DF4000, v28, OS_LOG_TYPE_DEFAULT, "runActivitiesWithDelayedStart: %@ activities were not found: %@", buf, 0x16u);

    }
  }
  if (objc_msgSend(v33, "count"))
    -[_DASScheduler runActivities:](v6, "runActivities:", v33);

}

- (void)runActivities:(id)a3
{
  id v4;
  void *v5;
  _DASScheduler *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  NSMutableDictionary *submittedActivities;
  void *v12;
  void *v13;
  NSMutableDictionary *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  NSMutableDictionary *startedActivities;
  void *v21;
  NSObject *v22;
  NSObject *runQueue;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t k;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  NSObject *dasFrameworkLog;
  void *v34;
  NSObject *v35;
  void *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t m;
  id v41;
  id obj;
  void *v43;
  void *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _QWORD block[5];
  id v54;
  _DASScheduler *v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  uint8_t v64[128];
  uint8_t buf[4];
  void *v66;
  __int16 v67;
  id v68;
  _BYTE v69[128];
  _BYTE v70[128];
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = (void *)objc_msgSend(v4, "mutableCopy");
  v6 = self;
  objc_sync_enter(v6);
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  obj = v4;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v71, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v61;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v61 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * i);
        submittedActivities = v6->_submittedActivities;
        objc_msgSend(v10, "uuid");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](submittedActivities, "objectForKeyedSubscript:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          objc_msgSend(v5, "addObject:", v13);
          objc_msgSend(v43, "removeObject:", v13);
          v14 = v6->_submittedActivities;
          objc_msgSend(v10, "uuid");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary removeObjectForKey:](v14, "removeObjectForKey:", v15);

        }
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v71, 16);
    }
    while (v7);
  }

  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  v41 = v5;
  v16 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v56, v70, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v57;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v57 != v17)
          objc_enumerationMutation(v41);
        v19 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * j);
        startedActivities = v6->_startedActivities;
        objc_msgSend(v19, "uuid");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](startedActivities, "setObject:forKeyedSubscript:", v19, v21);

        objc_msgSend(v19, "handlerQueue");
        v22 = objc_claimAutoreleasedReturnValue();
        runQueue = v22;
        if (!v22)
          runQueue = v6->_runQueue;
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __31___DASScheduler_runActivities___block_invoke;
        block[3] = &unk_1E624BD68;
        block[4] = v19;
        v54 = v44;
        v55 = v6;
        dispatch_async(runQueue, block);

      }
      v16 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v56, v70, 16);
    }
    while (v16);
  }

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v25 = v43;
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v49, v69, 16);
  if (v26)
  {
    v27 = *(_QWORD *)v50;
    do
    {
      for (k = 0; k != v26; ++k)
      {
        if (*(_QWORD *)v50 != v27)
          objc_enumerationMutation(v25);
        v29 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * k);
        objc_msgSend(v29, "launchReason");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v30, "hasPrefix:", CFSTR("com.apple.das.bgongoingprocessing"));

        if (v31)
        {
          objc_msgSend(v24, "addObject:", v29);
          objc_msgSend(v25, "removeObject:", v29);
        }
      }
      v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v49, v69, 16);
    }
    while (v26);
  }

  if (objc_msgSend(v24, "count"))
  {
    -[_DASScheduler backgroundTaskSchedulerDelegate](v6, "backgroundTaskSchedulerDelegate");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "scheduler:handleLaunchForActivities:", v6, v24);

  }
  objc_sync_exit(v6);

  if (objc_msgSend(v25, "count"))
  {
    dasFrameworkLog = v6->_dasFrameworkLog;
    if (os_log_type_enabled(dasFrameworkLog, OS_LOG_TYPE_DEFAULT))
    {
      v34 = (void *)MEMORY[0x1E0CB37E8];
      v35 = dasFrameworkLog;
      objc_msgSend(v34, "numberWithUnsignedInteger:", objc_msgSend(v25, "count"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v66 = v36;
      v67 = 2112;
      v68 = v25;
      _os_log_impl(&dword_1B0DF4000, v35, OS_LOG_TYPE_DEFAULT, "runActivities: %@ activities were not found: %@", buf, 0x16u);

    }
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    v37 = v25;
    v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v45, v64, 16);
    if (v38)
    {
      v39 = *(_QWORD *)v46;
      do
      {
        for (m = 0; m != v38; ++m)
        {
          if (*(_QWORD *)v46 != v39)
            objc_enumerationMutation(v37);
          -[_DASScheduler activityCanceled:](v6, "activityCanceled:", *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * m));
        }
        v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v45, v64, 16);
      }
      while (v38);
    }

  }
}

- (void)suspendActivities:(id)a3
{
  id v4;
  void *v5;
  _DASScheduler *v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  NSMutableDictionary *startedActivities;
  void *v13;
  void *v14;
  void *v15;
  BOOL v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *runQueue;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  NSObject *dasFrameworkLog;
  void *v30;
  NSObject *v31;
  void *v32;
  __int128 v33;
  id obj;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _QWORD block[4];
  NSObject *v40;
  _DASScheduler *v41;
  void *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t buf[4];
  void *v48;
  __int16 v49;
  id v50;
  _BYTE v51[128];
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(v4, "mutableCopy");
  v6 = self;
  objc_sync_enter(v6);
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  obj = v4;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
  if (v7)
  {
    v9 = *(_QWORD *)v44;
    *(_QWORD *)&v8 = 138543362;
    v33 = v8;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v44 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
        startedActivities = v6->_startedActivities;
        objc_msgSend(v11, "uuid", v33);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](startedActivities, "objectForKeyedSubscript:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          objc_msgSend(v5, "removeObject:", v14);
          objc_msgSend(v14, "suspendRequestDate");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v15 == 0;

          if (v16)
          {
            objc_msgSend(v14, "handlerQueue");
            v18 = objc_claimAutoreleasedReturnValue();
            runQueue = v18;
            if (!v18)
              runQueue = v6->_runQueue;
            block[0] = MEMORY[0x1E0C809B0];
            block[1] = 3221225472;
            block[2] = __35___DASScheduler_suspendActivities___block_invoke;
            block[3] = &unk_1E624BD68;
            v40 = v14;
            v41 = v6;
            v42 = v11;
            dispatch_async(runQueue, block);

            v17 = v40;
          }
          else
          {
            -[_DASScheduler dasFrameworkLog](v6, "dasFrameworkLog");
            v17 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v33;
              v48 = v14;
              _os_log_impl(&dword_1B0DF4000, v17, OS_LOG_TYPE_DEFAULT, "Already requested suspension for %{public}@", buf, 0xCu);
            }
          }

        }
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
    }
    while (v7);
  }

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v21 = v5;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v35, v51, 16);
  if (v22)
  {
    v23 = *(_QWORD *)v36;
    do
    {
      for (j = 0; j != v22; ++j)
      {
        if (*(_QWORD *)v36 != v23)
          objc_enumerationMutation(v21);
        v25 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * j);
        objc_msgSend(v25, "launchReason");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v26, "hasPrefix:", CFSTR("com.apple.das.bgongoingprocessing"));

        if (v27)
        {
          objc_msgSend(v20, "addObject:", v25);
          objc_msgSend(v21, "removeObject:", v25);
        }
      }
      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v35, v51, 16);
    }
    while (v22);
  }

  if (objc_msgSend(v20, "count"))
  {
    -[_DASScheduler backgroundTaskSchedulerDelegate](v6, "backgroundTaskSchedulerDelegate");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "scheduler:willExpireActivities:", v6, v20);

  }
  objc_sync_exit(v6);

  if (objc_msgSend(v21, "count"))
  {
    dasFrameworkLog = v6->_dasFrameworkLog;
    if (os_log_type_enabled(dasFrameworkLog, OS_LOG_TYPE_DEFAULT))
    {
      v30 = (void *)MEMORY[0x1E0CB37E8];
      v31 = dasFrameworkLog;
      objc_msgSend(v30, "numberWithUnsignedInteger:", objc_msgSend(v21, "count"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v48 = v32;
      v49 = 2112;
      v50 = v21;
      _os_log_impl(&dword_1B0DF4000, v31, OS_LOG_TYPE_DEFAULT, "suspendActivities: %@ activities were not running: %@", buf, 0x16u);

    }
  }

}

- (void)cancelActivities:(id)a3
{
  id v4;
  void *v5;
  _DASScheduler *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSMutableDictionary *submittedActivities;
  void *v13;
  void *v14;
  NSMutableDictionary *startedActivities;
  void *v16;
  NSMutableDictionary *v17;
  void *v18;
  NSMutableDictionary *v19;
  void *v20;
  NSMutableDictionary *v21;
  void *v22;
  NSMutableDictionary *delayedStartTasks;
  void *v24;
  uint64_t v25;
  NSObject *dasFrameworkLog;
  void *v27;
  NSObject *v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  void *v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(v4, "mutableCopy");
  v6 = self;
  objc_sync_enter(v6);
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v31;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v31 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v10);
        submittedActivities = v6->_submittedActivities;
        objc_msgSend(v11, "uuid", (_QWORD)v30);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](submittedActivities, "objectForKeyedSubscript:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
          goto LABEL_9;
        startedActivities = v6->_startedActivities;
        objc_msgSend(v11, "uuid");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](startedActivities, "objectForKeyedSubscript:", v16);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14
          || (v17 = v6->_delayedStartTasks,
              objc_msgSend(v11, "uuid"),
              v18 = (void *)objc_claimAutoreleasedReturnValue(),
              -[NSMutableDictionary objectForKeyedSubscript:](v17, "objectForKeyedSubscript:", v18),
              v14 = (void *)objc_claimAutoreleasedReturnValue(),
              v18,
              v14))
        {
LABEL_9:
          v19 = v6->_submittedActivities;
          objc_msgSend(v11, "uuid");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary removeObjectForKey:](v19, "removeObjectForKey:", v20);

          v21 = v6->_startedActivities;
          objc_msgSend(v11, "uuid");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary removeObjectForKey:](v21, "removeObjectForKey:", v22);

          delayedStartTasks = v6->_delayedStartTasks;
          objc_msgSend(v11, "uuid");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary removeObjectForKey:](delayedStartTasks, "removeObjectForKey:", v24);

        }
        else
        {
          objc_msgSend(v5, "addObject:", v11);
        }
        ++v10;
      }
      while (v8 != v10);
      v25 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
      v8 = v25;
    }
    while (v25);
  }

  objc_sync_exit(v6);
  if (objc_msgSend(v5, "count"))
  {
    dasFrameworkLog = v6->_dasFrameworkLog;
    if (os_log_type_enabled(dasFrameworkLog, OS_LOG_TYPE_DEFAULT))
    {
      v27 = (void *)MEMORY[0x1E0CB37E8];
      v28 = dasFrameworkLog;
      objc_msgSend(v27, "numberWithUnsignedInteger:", objc_msgSend(v5, "count"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v35 = v29;
      v36 = 2112;
      v37 = v5;
      _os_log_impl(&dword_1B0DF4000, v28, OS_LOG_TYPE_DEFAULT, "cancelActivities: %@ activities were not found: %@", buf, 0x16u);

    }
  }

}

- (BOOL)wasActivityAllowedToRun:(id)a3
{
  id v4;
  _DASScheduler *v5;
  NSMutableDictionary *delayedStartTasks;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  delayedStartTasks = v5->_delayedStartTasks;
  objc_msgSend(v4, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](delayedStartTasks, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(delayedStartTasks) = v8 != 0;

  objc_sync_exit(v5);
  return (char)delayedStartTasks;
}

- (void)activity:(id)a3 runWithoutHonoringPolicies:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  id v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[_DASScheduler dasFrameworkLog](self, "dasFrameworkLog");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412546;
    v10 = v6;
    v11 = 2112;
    v12 = v7;
    _os_log_impl(&dword_1B0DF4000, v8, OS_LOG_TYPE_DEFAULT, "Activity: %@ ignoring policies: %@", (uint8_t *)&v9, 0x16u);
  }

}

- (void)activity:(id)a3 blockedOnPolicies:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  id v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[_DASScheduler dasFrameworkLog](self, "dasFrameworkLog");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412546;
    v10 = v6;
    v11 = 2112;
    v12 = v7;
    _os_log_impl(&dword_1B0DF4000, v8, OS_LOG_TYPE_DEFAULT, "Activity: %@ blocked on policies: %@", (uint8_t *)&v9, 0x16u);
  }

}

- (void)endLaunchWithReason:(id)a3 forApp:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[_DASScheduler currentConnection](self, "currentConnection");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "remoteObjectProxy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "endLaunchWithReason:forApp:", v7, v6);

}

- (void)backgroundAppRefreshEnabledForApp:(id)a3 withHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[_DASScheduler currentConnection](self, "currentConnection");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "remoteObjectProxy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "backgroundAppRefreshEnabledForApp:withHandler:", v7, v6);

}

- (void)disableAppRefreshForApps:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[5];

  v4 = a3;
  -[_DASScheduler currentConnection](self, "currentConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __42___DASScheduler_disableAppRefreshForApps___block_invoke;
  v7[3] = &unk_1E624BB88;
  v7[4] = self;
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "disableAppRefreshForApps:", v4);

}

- (void)handleLaunchFromDaemonForActivities:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_1B0DF4000, v5, OS_LOG_TYPE_DEFAULT, "Handling launch from daemon for activities: %@", (uint8_t *)&v7, 0xCu);
  }

  -[_DASScheduler backgroundTaskSchedulerDelegate](self, "backgroundTaskSchedulerDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scheduler:handleLaunchForActivities:", self, v4);

}

- (void)willExpireBGTaskActivities:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_1B0DF4000, v5, OS_LOG_TYPE_DEFAULT, "Will expire BGTask activities: %@", (uint8_t *)&v7, 0xCu);
  }

  -[_DASScheduler backgroundTaskSchedulerDelegate](self, "backgroundTaskSchedulerDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scheduler:willExpireActivities:", self, v4);

}

- (void)completeTaskRequest:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  _QWORD v12[5];
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v14 = v4;
    _os_log_impl(&dword_1B0DF4000, v5, OS_LOG_TYPE_DEFAULT, "Complete task request activity: %@", buf, 0xCu);
  }

  -[_DASScheduler currentConnection](self, "currentConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __37___DASScheduler_completeTaskRequest___block_invoke;
  v12[3] = &unk_1E624BB88;
  v12[4] = self;
  objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v7;
  v10[1] = 3221225472;
  v10[2] = __37___DASScheduler_completeTaskRequest___block_invoke_339;
  v10[3] = &unk_1E624B688;
  v10[4] = self;
  v11 = v4;
  v9 = v4;
  objc_msgSend(v8, "completeTaskRequest:completionHandler:", v9, v10);

}

- (void)updateOngoingTask:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  _QWORD v10[5];

  v4 = a3;
  if (v4)
  {
    -[_DASScheduler currentConnection](self, "currentConnection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = MEMORY[0x1E0C809B0];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __35___DASScheduler_updateOngoingTask___block_invoke;
    v10[3] = &unk_1E624BB88;
    v10[4] = self;
    objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v6;
    v8[1] = 3221225472;
    v8[2] = __35___DASScheduler_updateOngoingTask___block_invoke_340;
    v8[3] = &unk_1E624B688;
    v8[4] = self;
    v9 = v4;
    objc_msgSend(v7, "updateOngoingTask:completionHandler:", v9, v8);

  }
}

- (void)updateProgress:(id)a3 forOngoingTask:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  id v14;
  _QWORD v15[5];

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6)
  {
    objc_msgSend(v7, "setProgress:", v6);
    -[_DASScheduler currentConnection](self, "currentConnection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = MEMORY[0x1E0C809B0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __47___DASScheduler_updateProgress_forOngoingTask___block_invoke;
    v15[3] = &unk_1E624BB88;
    v15[4] = self;
    objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", v15);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v10;
    v12[1] = 3221225472;
    v12[2] = __47___DASScheduler_updateProgress_forOngoingTask___block_invoke_341;
    v12[3] = &unk_1E624BD68;
    v12[4] = self;
    v13 = v6;
    v14 = v8;
    objc_msgSend(v11, "updateProgressForOngoingTask:completionHandler:", v14, v12);

  }
}

- (BOOL)acknowledgeSystemTaskLaunchWithIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  char v12;
  _QWORD v14[5];
  id v15;
  uint64_t *v16;
  uint64_t *v17;
  _QWORD v18[5];
  id v19;
  uint64_t *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;

  v6 = a3;
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__0;
  v26 = __Block_byref_object_dispose__0;
  v27 = 0;
  -[_DASScheduler currentConnection](self, "currentConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __65___DASScheduler_acknowledgeSystemTaskLaunchWithIdentifier_error___block_invoke;
  v18[3] = &unk_1E624BE00;
  v18[4] = self;
  v9 = v6;
  v19 = v9;
  v20 = &v22;
  v21 = &v28;
  objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", v18);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __65___DASScheduler_acknowledgeSystemTaskLaunchWithIdentifier_error___block_invoke_342;
  v14[3] = &unk_1E624BE28;
  v16 = &v22;
  v17 = &v28;
  v14[4] = self;
  v11 = v9;
  v15 = v11;
  objc_msgSend(v10, "acknowledgeSystemTaskLaunchWithIdentifier:completionHandler:", v11, v14);

  if (a4)
    *a4 = objc_retainAutorelease((id)v23[5]);
  v12 = *((_BYTE *)v29 + 24);

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);

  return v12;
}

- (void)acknowledgeSystemTaskSuspensionWithIdentifier:(id)a3 retryAfter:(double)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  _QWORD v14[5];
  id v15;

  v6 = a3;
  -[_DASScheduler currentConnection](self, "currentConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __74___DASScheduler_acknowledgeSystemTaskSuspensionWithIdentifier_retryAfter___block_invoke;
  v14[3] = &unk_1E624BC78;
  v14[4] = self;
  v9 = v6;
  v15 = v9;
  objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __74___DASScheduler_acknowledgeSystemTaskSuspensionWithIdentifier_retryAfter___block_invoke_343;
  v12[3] = &unk_1E624B688;
  v12[4] = self;
  v13 = v9;
  v11 = v9;
  objc_msgSend(v10, "acknowledgeSystemTaskSuspensionWithIdentifier:retryAfter:completionHandler:", v11, v12, a4);

}

- (void)handleClientLedSystemTaskExpirationWithIdentifier:(id)a3 retryAfter:(double)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  id v16;

  v8 = a3;
  v9 = a5;
  -[_DASScheduler currentConnection](self, "currentConnection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __96___DASScheduler_handleClientLedSystemTaskExpirationWithIdentifier_retryAfter_completionHandler___block_invoke;
  v14[3] = &unk_1E624BE50;
  v14[4] = self;
  v15 = v8;
  v16 = v9;
  v11 = v9;
  v12 = v8;
  objc_msgSend(v10, "synchronousRemoteObjectProxyWithErrorHandler:", v14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "handleClientLedSystemTaskExpirationWithIdentifier:retryAfter:completionHandler:", v12, v11, a4);

}

- (void)submitTaskRequestWithIdentifier:(id)a3 descriptor:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  id v17;

  v8 = a3;
  v9 = a5;
  v10 = a4;
  -[_DASScheduler currentConnection](self, "currentConnection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __78___DASScheduler_submitTaskRequestWithIdentifier_descriptor_completionHandler___block_invoke;
  v15[3] = &unk_1E624BE50;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v12 = v9;
  v13 = v8;
  objc_msgSend(v11, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "submitTaskRequestWithIdentifier:descriptor:completionHandler:", v13, v10, v12);

}

- (void)updateTaskRequestWithIdentifier:(id)a3 descriptor:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  id v17;

  v8 = a3;
  v9 = a5;
  v10 = a4;
  -[_DASScheduler currentConnection](self, "currentConnection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __78___DASScheduler_updateTaskRequestWithIdentifier_descriptor_completionHandler___block_invoke;
  v15[3] = &unk_1E624BE50;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v12 = v9;
  v13 = v8;
  objc_msgSend(v11, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "updateTaskRequestWithIdentifier:descriptor:completionHandler:", v13, v10, v12);

}

- (void)completeSystemTaskWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  _QWORD v12[5];
  id v13;

  v4 = a3;
  -[_DASScheduler currentConnection](self, "currentConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __50___DASScheduler_completeSystemTaskWithIdentifier___block_invoke;
  v12[3] = &unk_1E624BC78;
  v12[4] = self;
  v7 = v4;
  v13 = v7;
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __50___DASScheduler_completeSystemTaskWithIdentifier___block_invoke_344;
  v10[3] = &unk_1E624B688;
  v10[4] = self;
  v11 = v7;
  v9 = v7;
  objc_msgSend(v8, "completeSystemTaskWithIdentifier:completionHandler:", v9, v10);

}

- (void)unregisterSystemTaskWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  -[_DASScheduler currentConnection](self, "currentConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __70___DASScheduler_unregisterSystemTaskWithIdentifier_completionHandler___block_invoke;
  v12[3] = &unk_1E624BE50;
  v12[4] = self;
  v13 = v6;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "unregisterSystemTaskWithIdentifier:completionHandler:", v10, v9);

}

- (void)resumeTaskSchedulingWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  -[_DASScheduler currentConnection](self, "currentConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __70___DASScheduler_resumeTaskSchedulingWithIdentifier_completionHandler___block_invoke;
  v12[3] = &unk_1E624BE50;
  v12[4] = self;
  v13 = v6;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "resumeTaskSchedulingWithIdentifier:completionHandler:", v10, v9);

}

- (void)reportSystemTaskWithIdentifier:(id)a3 consumedResults:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  id v17;

  v8 = a3;
  v9 = a5;
  v10 = a4;
  -[_DASScheduler currentConnection](self, "currentConnection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __82___DASScheduler_reportSystemTaskWithIdentifier_consumedResults_completionHandler___block_invoke;
  v15[3] = &unk_1E624BE50;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v12 = v9;
  v13 = v8;
  objc_msgSend(v11, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "reportSystemTaskWithIdentifier:consumedResults:completionHandler:", v13, v10, v12);

}

- (void)reportSystemTaskWithIdentifier:(id)a3 producedResults:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  id v17;

  v8 = a3;
  v9 = a5;
  v10 = a4;
  -[_DASScheduler currentConnection](self, "currentConnection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __82___DASScheduler_reportSystemTaskWithIdentifier_producedResults_completionHandler___block_invoke;
  v15[3] = &unk_1E624BE50;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v12 = v9;
  v13 = v8;
  objc_msgSend(v11, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "reportSystemTaskWithIdentifier:producedResults:completionHandler:", v13, v10, v12);

}

- (void)resetResultsForIdentifier:(id)a3 byTaskWithIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  _QWORD v24[5];
  id v25;
  id v26;
  id v27;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[_DASScheduler currentConnection](self, "currentConnection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __82___DASScheduler_resetResultsForIdentifier_byTaskWithIdentifier_completionHandler___block_invoke;
  v24[3] = &unk_1E624BE78;
  v24[4] = self;
  v13 = v8;
  v25 = v13;
  v14 = v9;
  v26 = v14;
  v15 = v10;
  v27 = v15;
  objc_msgSend(v11, "synchronousRemoteObjectProxyWithErrorHandler:", v24);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v12;
  v20[1] = 3221225472;
  v20[2] = __82___DASScheduler_resetResultsForIdentifier_byTaskWithIdentifier_completionHandler___block_invoke_345;
  v20[3] = &unk_1E624BEA0;
  v20[4] = self;
  v21 = v13;
  v22 = v14;
  v23 = v15;
  v17 = v15;
  v18 = v14;
  v19 = v13;
  objc_msgSend(v16, "resetResultsForIdentifier:byTaskWithIdentifier:completionHandler:", v19, v18, v20);

}

- (void)reportTaskWorkloadProgress:(id)a3 target:(unint64_t)a4 completed:(unint64_t)a5 category:(unint64_t)a6 subCategory:(id)a7 completionHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, void *);
  void *v23;
  _DASScheduler *v24;
  id v25;

  v14 = a8;
  v15 = a7;
  v16 = a3;
  -[_DASScheduler currentConnection](self, "currentConnection");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = MEMORY[0x1E0C809B0];
  v21 = 3221225472;
  v22 = __100___DASScheduler_reportTaskWorkloadProgress_target_completed_category_subCategory_completionHandler___block_invoke;
  v23 = &unk_1E624BEC8;
  v24 = self;
  v25 = v14;
  v18 = v14;
  objc_msgSend(v17, "synchronousRemoteObjectProxyWithErrorHandler:", &v20);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "reportTaskWorkloadProgress:target:completed:category:subCategory:completionHandler:", v16, a4, a5, a6, v15, v18, v20, v21, v22, v23, v24);

}

- (void)resubmitRunningActivities:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (objc_msgSend(v6, "count"))
  {
    -[_DASScheduler xpcConnection](self, "xpcConnection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "remoteObjectProxy");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "startedActivities:", v6);

  }
}

- (BOOL)reportFeatureCheckpoint:(unint64_t)a3 forFeature:(unint64_t)a4 error:(id *)a5
{
  void *v9;
  uint64_t v10;
  void *v11;
  char v12;
  _QWORD v14[7];
  _QWORD v15[7];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__0;
  v24 = __Block_byref_object_dispose__0;
  v25 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  -[_DASScheduler currentConnection](self, "currentConnection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __58___DASScheduler_reportFeatureCheckpoint_forFeature_error___block_invoke;
  v15[3] = &unk_1E624BEF0;
  v15[4] = self;
  v15[5] = &v20;
  v15[6] = &v16;
  objc_msgSend(v9, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v10;
  v14[1] = 3221225472;
  v14[2] = __58___DASScheduler_reportFeatureCheckpoint_forFeature_error___block_invoke_350;
  v14[3] = &unk_1E624BF18;
  v14[4] = self;
  v14[5] = &v20;
  v14[6] = &v16;
  objc_msgSend(v11, "reportFeatureCheckpoint:forFeature:withHandler:", a3, a4, v14);

  if (a5)
    *a5 = objc_retainAutorelease((id)v21[5]);
  v12 = *((_BYTE *)v17 + 24);
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v20, 8);

  return v12;
}

- (BOOL)reportSystemWorkload:(unint64_t)a3 ofCategory:(unint64_t)a4 error:(id *)a5
{
  void *v9;
  uint64_t v10;
  void *v11;
  char v12;
  _QWORD v14[7];
  _QWORD v15[7];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__0;
  v24 = __Block_byref_object_dispose__0;
  v25 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  -[_DASScheduler currentConnection](self, "currentConnection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __55___DASScheduler_reportSystemWorkload_ofCategory_error___block_invoke;
  v15[3] = &unk_1E624BEF0;
  v15[4] = self;
  v15[5] = &v20;
  v15[6] = &v16;
  objc_msgSend(v9, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v10;
  v14[1] = 3221225472;
  v14[2] = __55___DASScheduler_reportSystemWorkload_ofCategory_error___block_invoke_351;
  v14[3] = &unk_1E624BF18;
  v14[4] = self;
  v14[5] = &v20;
  v14[6] = &v16;
  objc_msgSend(v11, "reportSystemWorkload:ofCategory:withHandler:", a3, a4, v14);

  if (a5)
    *a5 = objc_retainAutorelease((id)v21[5]);
  v12 = *((_BYTE *)v17 + 24);
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v20, 8);

  return v12;
}

- (BOOL)reportCustomCheckpoint:(unint64_t)a3 forTask:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  char v12;
  _QWORD v14[7];
  _QWORD v15[7];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v8 = a4;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__0;
  v24 = __Block_byref_object_dispose__0;
  v25 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  -[_DASScheduler currentConnection](self, "currentConnection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __54___DASScheduler_reportCustomCheckpoint_forTask_error___block_invoke;
  v15[3] = &unk_1E624BEF0;
  v15[4] = self;
  v15[5] = &v20;
  v15[6] = &v16;
  objc_msgSend(v9, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v10;
  v14[1] = 3221225472;
  v14[2] = __54___DASScheduler_reportCustomCheckpoint_forTask_error___block_invoke_352;
  v14[3] = &unk_1E624BF18;
  v14[4] = self;
  v14[5] = &v20;
  v14[6] = &v16;
  objc_msgSend(v11, "reportCustomCheckpoint:forTask:withHandler:", a3, v8, v14);

  if (a5)
    *a5 = objc_retainAutorelease((id)v21[5]);
  v12 = *((_BYTE *)v17 + 24);
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v20, 8);

  return v12;
}

- (void)activityStoppedWithParameters:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[_DASScheduler currentConnection](self, "currentConnection");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteObjectProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activityStoppedWithParameters:", v4);

}

- (void)prewarmApplication:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, void *);
  void *v11;
  _DASScheduler *v12;
  id v13;

  v4 = a3;
  -[_DASScheduler currentConnection](self, "currentConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __36___DASScheduler_prewarmApplication___block_invoke;
  v11 = &unk_1E624BC78;
  v12 = self;
  v13 = v4;
  v6 = v4;
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", &v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "prewarmApplication:", v6, v8, v9, v10, v11, v12);

}

- (void)prewarmSuspendWithHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, void *);
  void *v11;
  _DASScheduler *v12;
  id v13;

  v4 = a3;
  -[_DASScheduler currentConnection](self, "currentConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __43___DASScheduler_prewarmSuspendWithHandler___block_invoke;
  v11 = &unk_1E624BEC8;
  v12 = self;
  v13 = v4;
  v6 = v4;
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", &v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "prewarmSuspendWithHandler:", v6, v8, v9, v10, v11, v12);

}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  void *v5;
  id v6;
  void *v7;

  v5 = (void *)MEMORY[0x1E0CB3B50];
  v6 = a4;
  objc_msgSend(v5, "interfaceWithProtocol:", &unk_1EEEDAB38);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setExportedInterface:", v7);

  objc_msgSend(v6, "setExportedObject:", self);
  objc_msgSend(v6, "resume");

  return 1;
}

- (BOOL)deleteLimitForActivity:(id)a3 forLimiterWithName:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v15[5];
  id v16;
  id v17;
  uint64_t *v18;
  _QWORD v19[5];
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;

  v6 = a3;
  v7 = a4;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  -[_DASScheduler currentConnection](self, "currentConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __59___DASScheduler_deleteLimitForActivity_forLimiterWithName___block_invoke;
  v19[3] = &unk_1E624BC78;
  v19[4] = self;
  v10 = v7;
  v20 = v10;
  objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", v19);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v9;
  v15[1] = 3221225472;
  v15[2] = __59___DASScheduler_deleteLimitForActivity_forLimiterWithName___block_invoke_353;
  v15[3] = &unk_1E624BF40;
  v15[4] = self;
  v12 = v6;
  v16 = v12;
  v13 = v10;
  v17 = v13;
  v18 = &v21;
  objc_msgSend(v11, "deleteLimitForActivity:forLimiterWithName:handler:", v12, v13, v15);

  LOBYTE(v8) = *((_BYTE *)v22 + 24);
  _Block_object_dispose(&v21, 8);

  return (char)v8;
}

- (BOOL)updateLimit:(double)a3 forActivity:(id)a4 forLimiterWithName:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v17[5];
  id v18;
  id v19;
  uint64_t *v20;
  _QWORD v21[5];
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;

  v8 = a4;
  v9 = a5;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  -[_DASScheduler currentConnection](self, "currentConnection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __60___DASScheduler_updateLimit_forActivity_forLimiterWithName___block_invoke;
  v21[3] = &unk_1E624BC78;
  v21[4] = self;
  v12 = v9;
  v22 = v12;
  objc_msgSend(v10, "synchronousRemoteObjectProxyWithErrorHandler:", v21);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v11;
  v17[1] = 3221225472;
  v17[2] = __60___DASScheduler_updateLimit_forActivity_forLimiterWithName___block_invoke_354;
  v17[3] = &unk_1E624BF40;
  v17[4] = self;
  v14 = v8;
  v18 = v14;
  v15 = v12;
  v19 = v15;
  v20 = &v23;
  objc_msgSend(v13, "updateLimit:forActivity:forLimiterWithName:handler:", v14, v15, v17, a3);

  LOBYTE(v10) = *((_BYTE *)v24 + 24);
  _Block_object_dispose(&v23, 8);

  return (char)v10;
}

- (id)getLimiterResponseForActivity:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v12[5];
  id v13;
  uint64_t *v14;
  _QWORD v15[5];
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v4 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__0;
  v21 = __Block_byref_object_dispose__0;
  v22 = 0;
  -[_DASScheduler currentConnection](self, "currentConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __47___DASScheduler_getLimiterResponseForActivity___block_invoke;
  v15[3] = &unk_1E624BC78;
  v15[4] = self;
  v7 = v4;
  v16 = v7;
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v6;
  v12[1] = 3221225472;
  v12[2] = __47___DASScheduler_getLimiterResponseForActivity___block_invoke_355;
  v12[3] = &unk_1E624BF68;
  v12[4] = self;
  v9 = v7;
  v13 = v9;
  v14 = &v17;
  objc_msgSend(v8, "getLimiterResponseForActivity:handler:", v9, v12);

  v10 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v10;
}

- (double)getRuntimeLimit:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  double v10;
  _QWORD v12[5];
  id v13;
  uint64_t *v14;
  _QWORD v15[5];
  id v16;
  uint64_t v17;
  double *v18;
  uint64_t v19;
  unint64_t v20;

  v4 = a3;
  v17 = 0;
  v18 = (double *)&v17;
  v19 = 0x2020000000;
  v20 = 0xBFF0000000000000;
  -[_DASScheduler currentConnection](self, "currentConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __33___DASScheduler_getRuntimeLimit___block_invoke;
  v15[3] = &unk_1E624BC78;
  v15[4] = self;
  v7 = v4;
  v16 = v7;
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v6;
  v12[1] = 3221225472;
  v12[2] = __33___DASScheduler_getRuntimeLimit___block_invoke_356;
  v12[3] = &unk_1E624BF90;
  v12[4] = self;
  v9 = v7;
  v13 = v9;
  v14 = &v17;
  objc_msgSend(v8, "getRuntimeLimit:handler:", v9, v12);

  v10 = v18[3];
  _Block_object_dispose(&v17, 8);

  return v10;
}

- (id)getElapsedRuntimes:(id)a3 timeFilter:(id)a4 bgsqlData:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v18[5];
  id v19;
  uint64_t *v20;
  _QWORD v21[5];
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__0;
  v27 = __Block_byref_object_dispose__0;
  v28 = 0;
  -[_DASScheduler currentConnection](self, "currentConnection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __57___DASScheduler_getElapsedRuntimes_timeFilter_bgsqlData___block_invoke;
  v21[3] = &unk_1E624BC78;
  v21[4] = self;
  v13 = v8;
  v22 = v13;
  objc_msgSend(v11, "synchronousRemoteObjectProxyWithErrorHandler:", v21);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v12;
  v18[1] = 3221225472;
  v18[2] = __57___DASScheduler_getElapsedRuntimes_timeFilter_bgsqlData___block_invoke_357;
  v18[3] = &unk_1E624BFB8;
  v18[4] = self;
  v15 = v13;
  v19 = v15;
  v20 = &v23;
  objc_msgSend(v14, "getElapsedRuntimes:timeFilter:bgsqlData:handler:", v15, v9, v10, v18);

  v16 = (id)v24[5];
  _Block_object_dispose(&v23, 8);

  return v16;
}

- (id)getEstimatedRuntimes:(id)a3 timeFilter:(id)a4 bgsqlData:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v18[5];
  id v19;
  uint64_t *v20;
  _QWORD v21[5];
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__0;
  v27 = __Block_byref_object_dispose__0;
  v28 = 0;
  -[_DASScheduler currentConnection](self, "currentConnection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __59___DASScheduler_getEstimatedRuntimes_timeFilter_bgsqlData___block_invoke;
  v21[3] = &unk_1E624BC78;
  v21[4] = self;
  v13 = v8;
  v22 = v13;
  objc_msgSend(v11, "synchronousRemoteObjectProxyWithErrorHandler:", v21);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v12;
  v18[1] = 3221225472;
  v18[2] = __59___DASScheduler_getEstimatedRuntimes_timeFilter_bgsqlData___block_invoke_358;
  v18[3] = &unk_1E624BFB8;
  v18[4] = self;
  v15 = v13;
  v19 = v15;
  v20 = &v23;
  objc_msgSend(v14, "getEstimatedRuntimes:timeFilter:bgsqlData:handler:", v15, v9, v10, v18);

  v16 = (id)v24[5];
  _Block_object_dispose(&v23, 8);

  return v16;
}

- (id)getConditionsPenalties:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v12[5];
  id v13;
  uint64_t *v14;
  _QWORD v15[5];
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v4 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__0;
  v21 = __Block_byref_object_dispose__0;
  v22 = 0;
  -[_DASScheduler currentConnection](self, "currentConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __40___DASScheduler_getConditionsPenalties___block_invoke;
  v15[3] = &unk_1E624BC78;
  v15[4] = self;
  v7 = v4;
  v16 = v7;
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v6;
  v12[1] = 3221225472;
  v12[2] = __40___DASScheduler_getConditionsPenalties___block_invoke_359;
  v12[3] = &unk_1E624BFB8;
  v12[4] = self;
  v9 = v7;
  v13 = v9;
  v14 = &v17;
  objc_msgSend(v8, "getConditionsPenalties:handler:", v9, v12);

  v10 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v10;
}

- (id)getFeatureTimelines:(id)a3 timeFilter:(id)a4 bgsqlData:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v18[5];
  id v19;
  uint64_t *v20;
  _QWORD v21[5];
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__0;
  v27 = __Block_byref_object_dispose__0;
  v28 = 0;
  -[_DASScheduler currentConnection](self, "currentConnection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __58___DASScheduler_getFeatureTimelines_timeFilter_bgsqlData___block_invoke;
  v21[3] = &unk_1E624BC78;
  v21[4] = self;
  v13 = v8;
  v22 = v13;
  objc_msgSend(v11, "synchronousRemoteObjectProxyWithErrorHandler:", v21);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v12;
  v18[1] = 3221225472;
  v18[2] = __58___DASScheduler_getFeatureTimelines_timeFilter_bgsqlData___block_invoke_360;
  v18[3] = &unk_1E624BFB8;
  v18[4] = self;
  v15 = v13;
  v19 = v15;
  v20 = &v23;
  objc_msgSend(v14, "getFeatureTimelines:timeFilter:bgsqlData:handler:", v15, v9, v10, v18);

  v16 = (id)v24[5];
  _Block_object_dispose(&v23, 8);

  return v16;
}

- (id)getActivityTimelines:(id)a3 timeFilter:(id)a4 bgsqlData:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v18[5];
  id v19;
  uint64_t *v20;
  _QWORD v21[5];
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__0;
  v27 = __Block_byref_object_dispose__0;
  v28 = 0;
  -[_DASScheduler currentConnection](self, "currentConnection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __59___DASScheduler_getActivityTimelines_timeFilter_bgsqlData___block_invoke;
  v21[3] = &unk_1E624BC78;
  v21[4] = self;
  v13 = v8;
  v22 = v13;
  objc_msgSend(v11, "synchronousRemoteObjectProxyWithErrorHandler:", v21);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v12;
  v18[1] = 3221225472;
  v18[2] = __59___DASScheduler_getActivityTimelines_timeFilter_bgsqlData___block_invoke_361;
  v18[3] = &unk_1E624BFB8;
  v18[4] = self;
  v15 = v13;
  v19 = v15;
  v20 = &v23;
  objc_msgSend(v14, "getActivityTimelines:timeFilter:bgsqlData:handler:", v15, v9, v10, v18);

  v16 = (id)v24[5];
  _Block_object_dispose(&v23, 8);

  return v16;
}

- (id)getDeviceConditionTimelines:(id)a3 bgsqlData:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  _QWORD v13[6];
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v6 = a3;
  v7 = a4;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__0;
  v19 = __Block_byref_object_dispose__0;
  v20 = 0;
  -[_DASScheduler currentConnection](self, "currentConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __55___DASScheduler_getDeviceConditionTimelines_bgsqlData___block_invoke;
  v14[3] = &unk_1E624BB88;
  v14[4] = self;
  objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __55___DASScheduler_getDeviceConditionTimelines_bgsqlData___block_invoke_362;
  v13[3] = &unk_1E624BFE0;
  v13[4] = self;
  v13[5] = &v15;
  objc_msgSend(v10, "getDeviceConditionTimelines:bgsqlData:handler:", v6, v7, v13);

  v11 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v11;
}

- (id)getEstimatedMADCompletionTimes:(id)a3 endDate:(id)a4 bgsqlData:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v18[5];
  id v19;
  uint64_t *v20;
  _QWORD v21[5];
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__0;
  v27 = __Block_byref_object_dispose__0;
  v28 = 0;
  -[_DASScheduler currentConnection](self, "currentConnection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __66___DASScheduler_getEstimatedMADCompletionTimes_endDate_bgsqlData___block_invoke;
  v21[3] = &unk_1E624BC78;
  v21[4] = self;
  v13 = v8;
  v22 = v13;
  objc_msgSend(v11, "synchronousRemoteObjectProxyWithErrorHandler:", v21);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v12;
  v18[1] = 3221225472;
  v18[2] = __66___DASScheduler_getEstimatedMADCompletionTimes_endDate_bgsqlData___block_invoke_363;
  v18[3] = &unk_1E624BFB8;
  v18[4] = self;
  v15 = v13;
  v19 = v15;
  v20 = &v23;
  objc_msgSend(v14, "getEstimatedMADCompletionTimes:endDate:bgsqlData:handler:", v15, v9, v10, v18);

  v16 = (id)v24[5];
  _Block_object_dispose(&v23, 8);

  return v16;
}

- (NSString)clientName
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setClientName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void)setXpcConnection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSXPCListenerEndpoint)endpoint
{
  return self->_endpoint;
}

- (void)setEndpoint:(id)a3
{
  objc_storeStrong((id *)&self->_endpoint, a3);
}

- (BOOL)interrupted
{
  return self->_interrupted;
}

- (int)resubmitToken
{
  return self->_resubmitToken;
}

- (void)setResubmitToken:(int)a3
{
  self->_resubmitToken = a3;
}

- (void)setSubmittedActivities:(id)a3
{
  objc_storeStrong((id *)&self->_submittedActivities, a3);
}

- (NSMutableDictionary)delayedStartTasks
{
  return self->_delayedStartTasks;
}

- (void)setDelayedStartTasks:(id)a3
{
  objc_storeStrong((id *)&self->_delayedStartTasks, a3);
}

- (NSMutableDictionary)startedActivities
{
  return self->_startedActivities;
}

- (void)setStartedActivities:(id)a3
{
  objc_storeStrong((id *)&self->_startedActivities, a3);
}

- (NSMutableDictionary)activityToDataMap
{
  return self->_activityToDataMap;
}

- (void)setActivityToDataMap:(id)a3
{
  objc_storeStrong((id *)&self->_activityToDataMap, a3);
}

- (_DASSubmissionManager)submissionManager
{
  return self->_submissionManager;
}

- (void)setSubmissionManager:(id)a3
{
  objc_storeStrong((id *)&self->_submissionManager, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (OS_dispatch_queue)connectionCreationQueue
{
  return self->_connectionCreationQueue;
}

- (void)setConnectionCreationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_connectionCreationQueue, a3);
}

- (OS_dispatch_queue)runQueue
{
  return self->_runQueue;
}

- (void)setRunQueue:(id)a3
{
  objc_storeStrong((id *)&self->_runQueue, a3);
}

- (void)setDasFrameworkLog:(id)a3
{
  objc_storeStrong((id *)&self->_dasFrameworkLog, a3);
}

- (_DASActivityBackgroundTasksSchedulerDelegate)backgroundTaskSchedulerDelegate
{
  return (_DASActivityBackgroundTasksSchedulerDelegate *)objc_loadWeakRetained((id *)&self->_backgroundTaskSchedulerDelegate);
}

- (void)setBackgroundTaskSchedulerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_backgroundTaskSchedulerDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_backgroundTaskSchedulerDelegate);
  objc_storeStrong((id *)&self->_dasFrameworkLog, 0);
  objc_storeStrong((id *)&self->_runQueue, 0);
  objc_storeStrong((id *)&self->_connectionCreationQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_submissionManager, 0);
  objc_storeStrong((id *)&self->_activityToDataMap, 0);
  objc_storeStrong((id *)&self->_startedActivities, 0);
  objc_storeStrong((id *)&self->_delayedStartTasks, 0);
  objc_storeStrong((id *)&self->_submittedActivities, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_clientName, 0);
}

- (void)submitActivityInternal:(void *)a1 .cold.1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint8_t v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  objc_msgSend(a2, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "limitationResponse");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_4_0(&dword_1B0DF4000, v3, v6, "ERROR Submitting %@: Please contact das-core@group.apple.com to prevent this activity from getting rejected. Configuration: %@", v7);

  OUTLINED_FUNCTION_1_0();
}

- (void)submitActivityInternal:(void *)a1 .cold.2(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint8_t v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  objc_msgSend(a2, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "limitationResponse");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_4_0(&dword_1B0DF4000, v3, v6, "WARNING Submitting %@: %@", v7);

  OUTLINED_FUNCTION_1_0();
}

- (void)submitActivity:inGroup:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_2(&dword_1B0DF4000, v0, v1, "Not submitting %@, identical to %@");
  OUTLINED_FUNCTION_2();
}

@end
