@implementation NDAnalyticsUploadScheduler

- (NDAnalyticsUploadScheduler)init
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

  v15 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Do not call method"));
    *(_DWORD *)buf = 136315906;
    v8 = "-[NDAnalyticsUploadScheduler init]";
    v9 = 2080;
    v10 = "NDAnalyticsUploadScheduler.m";
    v11 = 1024;
    v12 = 40;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_214674000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x24BDBCE88];
  v4 = *MEMORY[0x24BDBCAB0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[NDAnalyticsUploadScheduler init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (NDAnalyticsUploadScheduler)initWithURLSessionQueue:(id)a3
{
  id v4;
  NDAnalyticsUploadScheduler *v5;
  uint64_t v6;
  FCOperationThrottler *schedulingAndForegroundUploadThrottler;
  uint64_t v8;
  NFMutexLock *lock;
  uint64_t v10;
  FCAsyncSerialQueue *uploadQueue;
  NSOperationQueue *v12;
  NSOperationQueue *backgroundSessionQueue;
  NSOperationQueue *v14;
  uint64_t v15;
  FCBalancedCounter *backgroundSessionLaunchEventCounter;
  objc_super v18;

  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NDAnalyticsUploadScheduler initWithURLSessionQueue:].cold.1();
  v18.receiver = self;
  v18.super_class = (Class)NDAnalyticsUploadScheduler;
  v5 = -[NDAnalyticsUploadScheduler init](&v18, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x24BE6CC98]), "initWithDelegate:", v5);
    schedulingAndForegroundUploadThrottler = v5->_schedulingAndForegroundUploadThrottler;
    v5->_schedulingAndForegroundUploadThrottler = (FCOperationThrottler *)v6;

    v8 = objc_opt_new();
    lock = v5->_lock;
    v5->_lock = (NFMutexLock *)v8;

    v10 = objc_opt_new();
    uploadQueue = v5->_uploadQueue;
    v5->_uploadQueue = (FCAsyncSerialQueue *)v10;

    v12 = (NSOperationQueue *)objc_opt_new();
    -[NSOperationQueue setUnderlyingQueue:](v12, "setUnderlyingQueue:", v4);
    backgroundSessionQueue = v5->_backgroundSessionQueue;
    v5->_backgroundSessionQueue = v12;
    v14 = v12;

    v15 = objc_opt_new();
    backgroundSessionLaunchEventCounter = v5->_backgroundSessionLaunchEventCounter;
    v5->_backgroundSessionLaunchEventCounter = (FCBalancedCounter *)v15;

  }
  return v5;
}

- (NSURLSession)backgroundSession
{
  void *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__2;
  v11 = __Block_byref_object_dispose__2;
  v12 = 0;
  -[NDAnalyticsUploadScheduler lock](self, "lock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __47__NDAnalyticsUploadScheduler_backgroundSession__block_invoke;
  v6[3] = &unk_24D1DF358;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(v3, "performWithLockSync:", v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSURLSession *)v4;
}

void __47__NDAnalyticsUploadScheduler_backgroundSession__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
  if (!v2)
  {
    objc_msgSend(MEMORY[0x24BDD1858], "backgroundSessionConfigurationWithIdentifier:", CFSTR("com.apple.newsd.analytics.uploader"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "set_allowsRetryForBackgroundDataTasks:", 1);
    objc_msgSend(v3, "set_sourceApplicationBundleIdentifier:", CFSTR("com.apple.news"));
    objc_msgSend(v3, "setDiscretionary:", 1);
    v4 = (void *)MEMORY[0x24BDD1850];
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v5, "backgroundSessionQueue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sessionWithConfiguration:delegate:delegateQueue:", v3, v5, v6);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(v8 + 56);
    *(_QWORD *)(v8 + 56) = v7;

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v2);
}

- (void)handleLaunchEventForBackgroundSessionWithIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (!v6 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NDAnalyticsUploadScheduler handleLaunchEventForBackgroundSessionWithIdentifier:completion:].cold.2();
  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.newsd.analytics.uploader")) & 1) == 0
    && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    -[NDAnalyticsUploadScheduler handleLaunchEventForBackgroundSessionWithIdentifier:completion:].cold.1();
  }
  NDSharedServiceLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v11 = 136315138;
    v12 = "-[NDAnalyticsUploadScheduler handleLaunchEventForBackgroundSessionWithIdentifier:completion:]";
    _os_log_impl(&dword_214674000, v8, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v11, 0xCu);
  }

  -[NDAnalyticsUploadScheduler backgroundSessionLaunchEventCounter](self, "backgroundSessionLaunchEventCounter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "increment");
  FCDispatchQueueForQualityOfService();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "notifyWhenCountReachesZeroOnQueue:usingBlock:", v10, v7);

}

- (void)scheduleUploadInWindow:(id)a3 withForegroundUploadCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t);
  void *v17;
  NDAnalyticsUploadScheduler *v18;
  id v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (!v6 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NDAnalyticsUploadScheduler scheduleUploadInWindow:withForegroundUploadCompletion:].cold.1();
  NDSharedServiceLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v6, "earlierDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "laterDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v21 = "-[NDAnalyticsUploadScheduler scheduleUploadInWindow:withForegroundUploadCompletion:]";
    v22 = 2112;
    v23 = v9;
    v24 = 2112;
    v25 = v10;
    _os_log_impl(&dword_214674000, v8, OS_LOG_TYPE_INFO, "%s with start date %@, end date %@", buf, 0x20u);

  }
  -[NDAnalyticsUploadScheduler lock](self, "lock");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x24BDAC760];
  v15 = 3221225472;
  v16 = __84__NDAnalyticsUploadScheduler_scheduleUploadInWindow_withForegroundUploadCompletion___block_invoke;
  v17 = &unk_24D1DEBB0;
  v18 = self;
  v19 = v6;
  v12 = v6;
  objc_msgSend(v11, "performWithLockSync:", &v14);

  -[NDAnalyticsUploadScheduler schedulingAndForegroundUploadThrottler](self, "schedulingAndForegroundUploadThrottler", v14, v15, v16, v17, v18);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "tickleWithCompletion:", v7);

}

uint64_t __84__NDAnalyticsUploadScheduler_scheduleUploadInWindow_withForegroundUploadCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setDeliveryWindow:", *(_QWORD *)(a1 + 40));
}

- (void)operationThrottler:(id)a3 performAsyncOperationWithCompletion:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  void *v9;
  void *v10;
  int v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  _QWORD v15[6];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__2;
  v20 = __Block_byref_object_dispose__2;
  v21 = 0;
  -[NDAnalyticsUploadScheduler lock](self, "lock");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __85__NDAnalyticsUploadScheduler_operationThrottler_performAsyncOperationWithCompletion___block_invoke;
  v15[3] = &unk_24D1DED28;
  v15[4] = self;
  v15[5] = &v16;
  objc_msgSend(v8, "performWithLockSync:", v15);

  objc_msgSend((id)v17[5], "laterDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "fc_isEarlierThanOrEqualTo:", v10);

  NDSharedServiceLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    objc_msgSend((id)v17[5], "laterDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v23 = v13;
    _os_log_impl(&dword_214674000, v12, OS_LOG_TYPE_INFO, "Scheduling payload with delivery window end date of %@", buf, 0xCu);

  }
  if (v11)
  {
    NDSharedServiceLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_214674000, v14, OS_LOG_TYPE_INFO, "Uploading now", buf, 2u);
    }

    -[NDAnalyticsUploadScheduler _uploadWithCompletion:](self, "_uploadWithCompletion:", v7);
  }
  else
  {
    -[NDAnalyticsUploadScheduler _scheduleBackgroundUploadInWindow:](self, "_scheduleBackgroundUploadInWindow:", v17[5]);
    v7[2](v7);
  }
  _Block_object_dispose(&v16, 8);

}

void __85__NDAnalyticsUploadScheduler_operationThrottler_performAsyncOperationWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "deliveryWindow");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40)
    && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    __85__NDAnalyticsUploadScheduler_operationThrottler_performAsyncOperationWithCompletion___block_invoke_cold_1();
  }
}

- (void)URLSessionDidFinishEventsForBackgroundURLSession:(id)a3
{
  id v3;

  -[NDAnalyticsUploadScheduler backgroundSessionLaunchEventCounter](self, "backgroundSessionLaunchEventCounter", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decrement");

}

- (void)URLSession:(id)a3 task:(id)a4 willBeginDelayedRequest:(id)a5 completionHandler:(id)a6
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a6;
  NDSharedServiceLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v8, "taskDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v16 = "-[NDAnalyticsUploadScheduler URLSession:task:willBeginDelayedRequest:completionHandler:]";
    v17 = 2112;
    v18 = v11;
    _os_log_impl(&dword_214674000, v10, OS_LOG_TYPE_INFO, "%s called for task with description %@", buf, 0x16u);

  }
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __88__NDAnalyticsUploadScheduler_URLSession_task_willBeginDelayedRequest_completionHandler___block_invoke;
  v13[3] = &unk_24D1DF380;
  v14 = v9;
  v12 = v9;
  -[NDAnalyticsUploadScheduler _uploadWithCompletion:](self, "_uploadWithCompletion:", v13);

}

uint64_t __88__NDAnalyticsUploadScheduler_URLSession_task_willBeginDelayedRequest_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  int v16;
  const char *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = a5;
  NDSharedServiceLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v7, "taskDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 136315650;
    v17 = "-[NDAnalyticsUploadScheduler URLSession:task:didCompleteWithError:]";
    v18 = 2112;
    v19 = v10;
    v20 = 2112;
    v21 = v8;
    _os_log_impl(&dword_214674000, v9, OS_LOG_TYPE_INFO, "%s called for task with description %@, error %@", (uint8_t *)&v16, 0x20u);

  }
  objc_msgSend(v8, "domain");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BDD1128]))
  {
    v12 = objc_msgSend(v8, "code");

    if (v12 == 2)
      goto LABEL_12;
  }
  else
  {

  }
  objc_msgSend(v8, "domain");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "isEqualToString:", *MEMORY[0x24BDD1308]))
  {
    v14 = objc_msgSend(v8, "code");

    if (v14 == -999)
      goto LABEL_12;
  }
  else
  {

  }
  -[NDAnalyticsUploadScheduler delegate](self, "delegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "uploadSchedulerDidDropScheduledBackgroundUpload:", self);

LABEL_12:
}

- (void)_scheduleBackgroundUploadInWindow:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NDAnalyticsUploadScheduler _scheduleBackgroundUploadInWindow:].cold.1();
  -[NDAnalyticsUploadScheduler backgroundSession](self, "backgroundSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getAllTasksWithCompletionHandler:", &__block_literal_global_6);
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x24BDD1840];
  v9 = (void *)MEMORY[0x24BDBCF48];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("https://www.%@.com"), v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "URLWithString:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "requestWithURL:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "downloadTaskWithRequest:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTaskDescription:", v7);
  objc_msgSend(v4, "earlierDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setEarliestBeginDate:", v14);

  objc_msgSend(v4, "laterDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "timeIntervalSinceNow");
  objc_msgSend(v13, "set_timeoutIntervalForResource:");

  NDSharedServiceLog();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v4, "earlierDate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "laterDate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v20 = v17;
    v21 = 2112;
    v22 = v18;
    v23 = 2112;
    v24 = v7;
    _os_log_impl(&dword_214674000, v16, OS_LOG_TYPE_INFO, "Scheduling background task with start date %@, end date %@, taskDescription %@", buf, 0x20u);

  }
  objc_msgSend(v13, "resume");

}

uint64_t __64__NDAnalyticsUploadScheduler__scheduleBackgroundUploadInWindow___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "enumerateObjectsUsingBlock:", &__block_literal_global_30);
}

void __64__NDAnalyticsUploadScheduler__scheduleBackgroundUploadInWindow___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  NDSharedServiceLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v2, "taskDescription");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v4;
    _os_log_impl(&dword_214674000, v3, OS_LOG_TYPE_INFO, "Cancelling background task with taskDescription %@", (uint8_t *)&v5, 0xCu);

  }
  objc_msgSend(v2, "cancel");

}

- (void)_uploadWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NDAnalyticsUploadScheduler _uploadWithCompletion:].cold.1();
  -[NDAnalyticsUploadScheduler uploadQueue](self, "uploadQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __52__NDAnalyticsUploadScheduler__uploadWithCompletion___block_invoke;
  v7[3] = &unk_24D1DF430;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "enqueueBlock:", v7);

}

void __52__NDAnalyticsUploadScheduler__uploadWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void (**v5)(_QWORD);
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t);
  void *v11;
  id v12;
  id v13;

  v3 = a2;
  v8 = MEMORY[0x24BDAC760];
  v9 = 3221225472;
  v10 = __52__NDAnalyticsUploadScheduler__uploadWithCompletion___block_invoke_2;
  v11 = &unk_24D1DF408;
  v12 = *(id *)(a1 + 40);
  v4 = v3;
  v13 = v4;
  v5 = (void (**)(_QWORD))_Block_copy(&v8);
  objc_msgSend(*(id *)(a1 + 32), "delegate", v8, v9, v10, v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    objc_msgSend(v6, "uploadScheduler:performUploadWithCompletion:", *(_QWORD *)(a1 + 32), v5);
  else
    v5[2](v5);

}

uint64_t __52__NDAnalyticsUploadScheduler__uploadWithCompletion___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (NDAnalyticsUploadSchedulerDelegate)delegate
{
  return (NDAnalyticsUploadSchedulerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NFMutexLock)lock
{
  return self->_lock;
}

- (void)setLock:(id)a3
{
  objc_storeStrong((id *)&self->_lock, a3);
}

- (FCDateRange)deliveryWindow
{
  return self->_deliveryWindow;
}

- (void)setDeliveryWindow:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (FCOperationThrottler)schedulingAndForegroundUploadThrottler
{
  return self->_schedulingAndForegroundUploadThrottler;
}

- (void)setSchedulingAndForegroundUploadThrottler:(id)a3
{
  objc_storeStrong((id *)&self->_schedulingAndForegroundUploadThrottler, a3);
}

- (FCAsyncSerialQueue)uploadQueue
{
  return self->_uploadQueue;
}

- (void)setUploadQueue:(id)a3
{
  objc_storeStrong((id *)&self->_uploadQueue, a3);
}

- (NSOperationQueue)backgroundSessionQueue
{
  return self->_backgroundSessionQueue;
}

- (void)setBackgroundSessionQueue:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundSessionQueue, a3);
}

- (void)setBackgroundSession:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundSession, a3);
}

- (FCBalancedCounter)backgroundSessionLaunchEventCounter
{
  return self->_backgroundSessionLaunchEventCounter;
}

- (void)setBackgroundSessionLaunchEventCounter:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundSessionLaunchEventCounter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundSessionLaunchEventCounter, 0);
  objc_storeStrong((id *)&self->_backgroundSession, 0);
  objc_storeStrong((id *)&self->_backgroundSessionQueue, 0);
  objc_storeStrong((id *)&self->_uploadQueue, 0);
  objc_storeStrong((id *)&self->_schedulingAndForegroundUploadThrottler, 0);
  objc_storeStrong((id *)&self->_deliveryWindow, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)initWithURLSessionQueue:.cold.1()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_214674000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"URLSessionQueue", v6, 2u);

  OUTLINED_FUNCTION_3();
}

- (void)handleLaunchEventForBackgroundSessionWithIdentifier:completion:.cold.1()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_214674000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"[identifier isEqualToString:NDAnalyticsUploadSchedulerBackgroundSessionIdentifier]", v6, 2u);

  OUTLINED_FUNCTION_3();
}

- (void)handleLaunchEventForBackgroundSessionWithIdentifier:completion:.cold.2()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_214674000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"identifier", v6, 2u);

  OUTLINED_FUNCTION_3();
}

- (void)scheduleUploadInWindow:withForegroundUploadCompletion:.cold.1()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_214674000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"deliveryWindow", v6, 2u);

  OUTLINED_FUNCTION_3();
}

void __85__NDAnalyticsUploadScheduler_operationThrottler_performAsyncOperationWithCompletion___block_invoke_cold_1()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("invalid nil value for '%s'"));
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_214674000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"deliveryWindow", v6, 2u);

  OUTLINED_FUNCTION_3();
}

- (void)_scheduleBackgroundUploadInWindow:.cold.1()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_214674000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"deliveryWindow", v6, 2u);

  OUTLINED_FUNCTION_3();
}

- (void)_uploadWithCompletion:.cold.1()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_214674000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"completion", v6, 2u);

  OUTLINED_FUNCTION_3();
}

@end
