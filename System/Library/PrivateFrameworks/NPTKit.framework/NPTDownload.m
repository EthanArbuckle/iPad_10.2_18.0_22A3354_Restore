@implementation NPTDownload

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NPTDownload)initWithNetworkActivityParent:(id)a3 testConfiguration:(id)a4
{
  id v7;
  id v8;
  NPTDownload *v9;
  NPTMetricResult *v10;
  uint64_t v11;
  NSMutableDictionary *taskDict;
  uint64_t v13;
  OS_nw_activity *downloadActivity;
  uint64_t v15;
  NSMutableArray *v16;
  NSMutableArray *buffer;
  double v18;
  NSDate *endTimeAggregate;
  NSError *downloadError;
  uint64_t v21;
  NSString *callingClient;
  NetworkQualityAssessment *nqTest;
  NetworkQualityConfiguration *nqConfig;
  objc_super v26;

  v7 = a3;
  v8 = a4;
  v26.receiver = self;
  v26.super_class = (Class)NPTDownload;
  v9 = -[NPTDownload init](&v26, sel_init);
  if (v9)
  {
    v10 = objc_alloc_init(NPTMetricResult);
    -[NPTDownload setResults:](v9, "setResults:", v10);

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v11 = objc_claimAutoreleasedReturnValue();
    taskDict = v9->taskDict;
    v9->taskDict = (NSMutableDictionary *)v11;

    objc_storeStrong((id *)&v9->activityParent, a3);
    v13 = nw_activity_create();
    downloadActivity = v9->downloadActivity;
    v9->downloadActivity = (OS_nw_activity *)v13;

    nw_activity_set_parent_activity();
    if ((objc_msgSend(v8, "stopAtFileSize") & 1) != 0)
      v15 = 1;
    else
      v15 = objc_msgSend(v8, "concurrentStreams");
    v9->processedStreamEndCount = 0;
    v9->maxConcurrentStreams = v15;
    v16 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    buffer = v9->buffer;
    v9->buffer = v16;

    objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
    v9->recentBufferTime = v18;
    endTimeAggregate = v9->endTimeAggregate;
    v9->endTimeAggregate = 0;

    v9->smartDownload = objc_msgSend(v8, "endWhenStable");
    v9->timedDownloadLength = objc_msgSend(v8, "testDuration");
    v9->stableSpeedToLog = 0.0;
    downloadError = v9->downloadError;
    v9->downloadError = 0;

    v9->stopAtFileSizeEnabled = objc_msgSend(v8, "stopAtFileSize");
    objc_msgSend(v8, "clientName");
    v21 = objc_claimAutoreleasedReturnValue();
    callingClient = v9->callingClient;
    v9->callingClient = (NSString *)v21;

    v9->maxSpeedObserved = 0.0;
    v9->legacy = objc_msgSend(v8, "legacyMode");
    nqTest = v9->nqTest;
    v9->nqTest = 0;

    nqConfig = v9->nqConfig;
    v9->nqConfig = 0;

    objc_storeStrong((id *)&v9->testConfig, a4);
  }

  return v9;
}

- (void)startNQDownloadWithCompletion:(id)a3
{
  id v4;
  NetworkQualityConfiguration *v5;
  NetworkQualityConfiguration *nqConfig;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void (**v14)(_QWORD, _QWORD, _QWORD);
  id v15;
  void *v16;
  NSDate *v17;
  NSDate *initialTime;
  NetworkQualityAssessment *v19;
  NetworkQualityAssessment *nqTest;
  void *v21;
  void *v22;
  NetworkQualityAssessment *v23;
  _QWORD v24[4];
  id v25;
  id location;

  v4 = a3;
  -[NPTDownload setCompletion:](self, "setCompletion:", v4);
  -[NPTPerformanceTestConfiguration NQDownloadConfiguration](self->testConfig, "NQDownloadConfiguration");
  v5 = (NetworkQualityConfiguration *)objc_claimAutoreleasedReturnValue();
  nqConfig = self->nqConfig;
  self->nqConfig = v5;

  -[NPTPerformanceTestConfiguration bonjourHost](self->testConfig, "bonjourHost");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[NPTPerformanceTestConfiguration bonjourHost](self->testConfig, "bonjourHost");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NetworkQualityConfiguration setBonjourHost:](self->nqConfig, "setBonjourHost:", v8);

    -[NetworkQualityConfiguration setValidateCertificate:](self->nqConfig, "setValidateCertificate:", 0);
  }
  nw_activity_activate();
  -[NPTDownload checkInterfaceSpecified](self, "checkInterfaceSpecified");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPTDownload results](self, "results");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setError:", v9);

  if (v9)
  {
    -[NPTDownload delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[NPTDownload delegate](self, "delegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "download:didFinishWithError:", self, v9);

    }
    -[NPTDownload completion](self, "completion");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      -[NPTDownload completion](self, "completion");
      v14 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, _QWORD, void *))v14)[2](v14, 0, v9);

    }
  }
  else
  {
    v15 = objc_alloc_init(MEMORY[0x24BDD1710]);
    dispatch_get_global_queue(33, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setUnderlyingQueue:", v16);

    objc_msgSend(v15, "setMaxConcurrentOperationCount:", 1);
    v17 = (NSDate *)objc_alloc_init(MEMORY[0x24BDBCE60]);
    initialTime = self->initialTime;
    self->initialTime = v17;

    v19 = (NetworkQualityAssessment *)objc_msgSend(objc_alloc(MEMORY[0x24BEDCBD8]), "initWithConfiguration:delegate:delegateQueue:", self->nqConfig, self, v15);
    nqTest = self->nqTest;
    self->nqTest = v19;

    if (self->nqTest)
    {
      -[NPTDownload delegate](self, "delegate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v21)
      {
        -[NPTDownload delegate](self, "delegate");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "downloadWillStart");

      }
    }
    objc_initWeak(&location, self);
    v23 = self->nqTest;
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __45__NPTDownload_startNQDownloadWithCompletion___block_invoke;
    v24[3] = &unk_24C990F50;
    objc_copyWeak(&v25, &location);
    -[NetworkQualityAssessment runWithCompletionHandler:](v23, "runWithCompletionHandler:", v24);
    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);

  }
}

void __45__NPTDownload_startNQDownloadWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id *v7;
  char *WeakRetained;
  NSObject *v9;
  void *v10;
  id *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void (**v22)(_QWORD, _QWORD, _QWORD);
  id v23;
  void *v24;
  int v25;
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = (id *)(a1 + 32);
  WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 32));
  +[NPTLogger network](NPTLogger, "network");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "debugDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 138412546;
    v26 = v10;
    v27 = 2112;
    v28 = v6;
    _os_log_impl(&dword_20E71B000, v9, OS_LOG_TYPE_DEFAULT, "Test complete %@, %@", (uint8_t *)&v25, 0x16u);

  }
  v11 = (id *)(WeakRetained + 128);
  if (*((_QWORD *)WeakRetained + 16))
    v12 = (void *)*((_QWORD *)WeakRetained + 16);
  else
    v12 = v6;
  objc_storeStrong((id *)WeakRetained + 16, v12);
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)*((_QWORD *)WeakRetained + 12);
  *((_QWORD *)WeakRetained + 12) = v13;

  objc_msgSend(WeakRetained, "processNQResult:", v5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "setResults:", v15);

  if (*v11)
  {
    if (objc_msgSend(*v11, "code") == -999)
      v16 = 4;
    else
      v16 = 3;
  }
  else
  {
    v16 = 2;
  }
  objc_msgSend(WeakRetained, "completeActivityWithReason:", v16);
  objc_msgSend(WeakRetained, "delegate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    if (v6)
    {
      objc_msgSend(WeakRetained, "results");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setError:", v6);

      objc_msgSend(WeakRetained, "delegate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "download:didFinishWithError:", WeakRetained, v6);
    }
    else
    {
      objc_msgSend(WeakRetained, "delegate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "results");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "download:didFinishWithResults:", WeakRetained, v20);

    }
  }
  objc_msgSend(WeakRetained, "completion");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    objc_msgSend(WeakRetained, "completion");
    v22 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v23 = objc_loadWeakRetained(v7);
    objc_msgSend(v23, "results");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, id))v22)[2](v22, v24, v6);

  }
}

- (void)startDownloadWithCompletion:(id)a3
{
  if (self->legacy)
    -[NPTDownload startLegacyDownloadWithCompletion:](self, "startLegacyDownloadWithCompletion:", a3);
  else
    -[NPTDownload startNQDownloadWithCompletion:](self, "startNQDownloadWithCompletion:", a3);
}

- (void)startLegacyDownloadWithCompletion:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  _BOOL8 v10;
  void *v11;
  id v12;
  NSURLSession *v13;
  NSURLSession *downloadSession;
  void *v15;
  void *v16;
  NSMutableURLRequest *v17;
  NSMutableURLRequest *request;
  unint64_t timedDownloadLength;
  double v20;
  NSString *callingClient;
  void *v22;
  NSObject *v23;
  void *v24;
  NSMutableURLRequest *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  unint64_t maxConcurrentStreams;
  void *v33;
  void *v34;
  unint64_t v35;
  id v36;
  NSDate *v37;
  NSDate *initialTime;
  uint8_t buf[4];
  unint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  -[NPTDownload setCompletion:](self, "setCompletion:", a3);
  nw_activity_activate();
  -[NPTDownload checkInterfaceSpecified](self, "checkInterfaceSpecified");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPTDownload results](self, "results");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setError:", v4);

  if (v4)
  {
    -[NPTDownload delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[NPTDownload delegate](self, "delegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "download:didFinishWithError:", self, v4);

    }
    -[NPTDownload completion](self, "completion");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[NPTDownload completion](self, "completion");
      v9 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, _QWORD, void *))v9)[2](v9, 0, v4);

    }
  }
  else
  {
    if (-[NPTPerformanceTestConfiguration interfaceType](self->testConfig, "interfaceType"))
      v10 = -[NPTPerformanceTestConfiguration interfaceType](self->testConfig, "interfaceType") == 3;
    else
      v10 = 1;
    objc_msgSend(MEMORY[0x24BDB74B8], "ephemeralSessionConfiguration");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_alloc_init(MEMORY[0x24BDD1710]);
    objc_msgSend(v12, "setQualityOfService:", 33);
    objc_msgSend(v12, "setMaxConcurrentOperationCount:", 1);
    objc_msgSend(v11, "setAllowsCellularAccess:", v10);
    objc_msgSend(v11, "setWaitsForConnectivity:", 0);
    objc_msgSend(v11, "setTimeoutIntervalForRequest:", 3.0);
    if (!self->timedDownloadLength)
      objc_msgSend(v11, "setTimeoutIntervalForResource:", (double)(90 * self->maxConcurrentStreams));
    objc_msgSend(v11, "setHTTPMaximumConnectionsPerHost:", self->maxConcurrentStreams + 1);
    objc_msgSend(MEMORY[0x24BDB74B0], "sessionWithConfiguration:delegate:delegateQueue:", v11, self, v12);
    v13 = (NSURLSession *)objc_claimAutoreleasedReturnValue();
    downloadSession = self->downloadSession;
    self->downloadSession = v13;

    v15 = (void *)MEMORY[0x24BDB7458];
    -[NPTPerformanceTestConfiguration downloadURL](self->testConfig, "downloadURL");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "requestWithURL:", v16);
    v17 = (NSMutableURLRequest *)objc_claimAutoreleasedReturnValue();
    request = self->request;
    self->request = v17;

    -[NSMutableURLRequest setHTTPMethod:](self->request, "setHTTPMethod:", CFSTR("GET"));
    -[NSMutableURLRequest setValue:forHTTPHeaderField:](self->request, "setValue:forHTTPHeaderField:", CFSTR("application/octet-stream"), CFSTR("Accept"));
    timedDownloadLength = self->timedDownloadLength;
    v20 = (double)timedDownloadLength * 0.9;
    if (!timedDownloadLength)
      v20 = 60.0;
    -[NSMutableURLRequest setTimeoutInterval:](self->request, "setTimeoutInterval:", v20);
    callingClient = self->callingClient;
    if (callingClient && -[NSString length](callingClient, "length"))
      -[NSMutableURLRequest setValue:forHTTPHeaderField:](self->request, "setValue:forHTTPHeaderField:", self->callingClient, CFSTR("NPTKit-Client"));
    -[NPTPerformanceTestConfiguration interfaceName](self->testConfig, "interfaceName");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      +[NPTLogger network](NPTLogger, "network");
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        -[NPTPerformanceTestConfiguration interfaceName](self->testConfig, "interfaceName");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v40 = (unint64_t)v24;
        _os_log_impl(&dword_20E71B000, v23, OS_LOG_TYPE_DEFAULT, "Force the download over the following interface: %@", buf, 0xCu);

      }
      v25 = self->request;
      -[NPTPerformanceTestConfiguration interfaceName](self->testConfig, "interfaceName");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableURLRequest setBoundInterfaceIdentifier:](v25, "setBoundInterfaceIdentifier:", v26);

    }
    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.wifiqa.NPTKit"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "infoDictionary");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "objectForKey:", CFSTR("CFBundleShortVersionString"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("NPTKit/%@"), v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableURLRequest addValue:forHTTPHeaderField:](self->request, "addValue:forHTTPHeaderField:", v30, CFSTR("User-Agent"));
    +[NPTLogger network](NPTLogger, "network");
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      maxConcurrentStreams = self->maxConcurrentStreams;
      *(_DWORD *)buf = 134217984;
      v40 = maxConcurrentStreams;
      _os_log_impl(&dword_20E71B000, v31, OS_LOG_TYPE_DEFAULT, "Will start download task to test download speed with %lu number of streams", buf, 0xCu);
    }

    if (self->downloadSession)
    {
      -[NPTDownload delegate](self, "delegate");
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      if (v33)
      {
        -[NPTDownload delegate](self, "delegate");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "downloadWillStart");

      }
      if (self->maxConcurrentStreams)
      {
        v35 = 0;
        do
        {
          v36 = -[NPTDownload setupNewDownloadTask](self, "setupNewDownloadTask");
          ++v35;
        }
        while (v35 < self->maxConcurrentStreams);
      }
      if (self->timedDownloadLength)
        -[NPTDownload setupTimer](self, "setupTimer");
      if (!self->initialTime)
      {
        v37 = (NSDate *)objc_alloc_init(MEMORY[0x24BDBCE60]);
        initialTime = self->initialTime;
        self->initialTime = v37;

      }
      -[NPTDownload startTasks](self, "startTasks");
    }

  }
}

- (void)setupTimer
{
  NSObject *v3;
  OS_dispatch_source *v4;
  OS_dispatch_source *timeoutTimer;
  NSObject *v6;
  NSObject *v7;
  dispatch_time_t v8;
  _QWORD handler[5];

  dispatch_get_global_queue(0, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, v3);
  timeoutTimer = self->timeoutTimer;
  self->timeoutTimer = v4;

  v6 = self->timeoutTimer;
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __25__NPTDownload_setupTimer__block_invoke;
  handler[3] = &unk_24C990F78;
  handler[4] = self;
  dispatch_source_set_event_handler(v6, handler);
  v7 = self->timeoutTimer;
  v8 = dispatch_time(0, 1000000000 * self->timedDownloadLength);
  dispatch_source_set_timer(v7, v8, 0xFFFFFFFFFFFFFFFFLL, 0);
  dispatch_source_set_cancel_handler((dispatch_source_t)self->timeoutTimer, &__block_literal_global_1);
  dispatch_activate((dispatch_object_t)self->timeoutTimer);
}

uint64_t __25__NPTDownload_setupTimer__block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint8_t v11[16];

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 72);
  if (v3 && !dispatch_source_testcancel(*(dispatch_source_t *)(v2 + 72)))
    dispatch_source_cancel(v3);
  v4 = objc_alloc_init(MEMORY[0x24BDBCE60]);
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 96);
  *(_QWORD *)(v5 + 96) = v4;

  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 72);
  *(_QWORD *)(v7 + 72) = 0;

  +[NPTLogger network](NPTLogger, "network");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_20E71B000, v9, OS_LOG_TYPE_DEFAULT, "Timed download timer ended", v11, 2u);
  }

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "invalidateAndCancel");
}

- (void)kickOffNewDownload
{
  id v2;

  -[NPTDownload setupNewDownloadTask](self, "setupNewDownloadTask");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resume");

}

- (id)setupNewDownloadTask
{
  NPTTaskMetrics *v3;
  void *v4;
  void *v5;

  v3 = objc_alloc_init(NPTTaskMetrics);
  -[NSURLSession dataTaskWithRequest:](self->downloadSession, "dataTaskWithRequest:", self->request);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lu"), objc_msgSend(v4, "taskIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPTTaskMetrics setTask:](v3, "setTask:", v4);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->taskDict, "setObject:forKeyedSubscript:", v3, v5);
  objc_msgSend(v4, "set_nw_activity:", self->downloadActivity);

  return v4;
}

- (void)cancel
{
  NSURLSession *downloadSession;

  -[NPTDownload cancelDispatchTimerAndSession](self, "cancelDispatchTimerAndSession");
  -[NetworkQualityAssessment cancel](self->nqTest, "cancel");
  downloadSession = self->downloadSession;
  self->downloadSession = 0;

}

- (void)cancelDispatchTimerAndSession
{
  NSDate *v3;
  NSDate *endTimeAggregate;

  v3 = (NSDate *)objc_alloc_init(MEMORY[0x24BDBCE60]);
  endTimeAggregate = self->endTimeAggregate;
  self->endTimeAggregate = v3;

  -[NPTDownload cancelDispatchTimer](self, "cancelDispatchTimer");
  -[NSURLSession invalidateAndCancel](self->downloadSession, "invalidateAndCancel");
}

- (void)cancelDispatchTimer
{
  NSObject *timeoutTimer;
  OS_dispatch_source *v4;

  timeoutTimer = self->timeoutTimer;
  if (timeoutTimer)
  {
    if (!dispatch_source_testcancel((dispatch_source_t)self->timeoutTimer))
    {
      dispatch_source_cancel(timeoutTimer);
      v4 = self->timeoutTimer;
      self->timeoutTimer = 0;

    }
  }
}

- (double)checkAndReturnSpeedStablized:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  NSMutableArray *buffer;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;

  v4 = a3;
  v5 = self->recentBufferTime + 1.0;
  objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
  v6 = 0.0;
  if (v5 < v7)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
    self->recentBufferTime = v8;
    buffer = self->buffer;
    v10 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v4, "speed");
    objc_msgSend(v10, "numberWithDouble:");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](buffer, "addObject:", v11);

    if ((unint64_t)-[NSMutableArray count](self->buffer, "count") >= 0xB)
      -[NSMutableArray removeObjectAtIndex:](self->buffer, "removeObjectAtIndex:", 0);
    if (-[NSMutableArray count](self->buffer, "count") == 10)
    {
      -[NSMutableArray valueForKeyPath:](self->buffer, "valueForKeyPath:", CFSTR("@avg.self"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "doubleValue");
      v14 = v13;

      -[NSMutableArray objectAtIndexedSubscript:](self->buffer, "objectAtIndexedSubscript:", 9);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "doubleValue");
      v17 = vabdd_f64(v16, v14);

      -[NSMutableArray objectAtIndexedSubscript:](self->buffer, "objectAtIndexedSubscript:", 9);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "doubleValue");
      v20 = v17 / v19;

      if (v20 < 0.1)
      {
        objc_msgSend(v4, "speed");
        v6 = v21;
      }
    }
  }

  return v6;
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  double v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  -[NPTDownload realTimeSpeedMetricOverall](self, "realTimeSpeedMetricOverall", a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPTDownload delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[NPTDownload delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "download:didReceiveSpeedMetric:", self, v6);

  }
  objc_msgSend(v6, "speed");
  if (v9 > self->maxSpeedObserved)
  {
    objc_msgSend(v6, "speed");
    self->maxSpeedObserved = v10;
  }
  if (self->stableSpeedToLog == 0.0)
  {
    -[NPTDownload checkAndReturnSpeedStablized:](self, "checkAndReturnSpeedStablized:", v6);
    if (v11 > 0.0)
    {
      v12 = v11;
      self->stableSpeedToLog = v11;
      +[NPTLogger network](NPTLogger, "network");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = objc_msgSend(v6, "bytesTransferred");
        objc_msgSend(v6, "timeSinceStart");
        v16 = 134218496;
        v17 = v12;
        v18 = 2048;
        v19 = v14;
        v20 = 2048;
        v21 = v15;
        _os_log_impl(&dword_20E71B000, v13, OS_LOG_TYPE_DEFAULT, "Download task has stabilized at %f Mbps after downloading %lld bytes over %f seconds", (uint8_t *)&v16, 0x20u);
      }

      if (self->smartDownload)
        -[NPTDownload cancelDispatchTimerAndSession](self, "cancelDispatchTimerAndSession");
    }
  }

}

- (void)URLSession:(id)a3 task:(id)a4 didFinishCollectingMetrics:(id)a5
{
  id v7;
  NSMutableDictionary *taskDict;
  void *v9;
  void *v10;
  NPTMetricResult *v11;
  void *v12;
  double v13;
  double v14;
  NSMutableDictionary *v15;
  void *v16;
  void *v17;
  NSMutableDictionary *v18;
  void *v19;
  void *v20;
  id v21;

  v21 = a4;
  v7 = a5;
  taskDict = self->taskDict;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lu"), objc_msgSend(v21, "taskIdentifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](taskDict, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = objc_alloc_init(NPTMetricResult);
    -[NPTMetricResult populateWithMetrics:](v11, "populateWithMetrics:", v7);
    objc_msgSend(v21, "response");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPTMetricResult populateWithURLResponse:](v11, "populateWithURLResponse:", v12);

    -[NPTMetricResult setFileSize:](v11, "setFileSize:", objc_msgSend(v21, "countOfBytesReceived"));
    v13 = (double)-[NPTMetricResult fileSize](v11, "fileSize") * 8.0;
    -[NPTMetricResult responseTime](v11, "responseTime");
    -[NPTMetricResult setSpeed:](v11, "setSpeed:", v13 / v14 / 1000000.0);
    v15 = self->taskDict;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lu"), objc_msgSend(v21, "taskIdentifier"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](v15, "objectForKeyedSubscript:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setTaskMetrics:", v7);

    v18 = self->taskDict;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lu"), objc_msgSend(v21, "taskIdentifier"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](v18, "objectForKeyedSubscript:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setResults:", v11);

  }
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  NSError *downloadError;
  NSURLSession *downloadSession;
  NSObject *v22;
  NSError *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  BOOL v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  BOOL v32;
  void (**v33)(_QWORD, _QWORD, _QWORD);
  id WeakRetained;
  void *v35;
  uint8_t buf[4];
  id v37;
  __int16 v38;
  uint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_msgSend(v10, "copy");
  if (v11 && !-[NPTDownload isTimerCancelledError:](self, "isTimerCancelledError:", v11))
    goto LABEL_6;
  objc_msgSend(v9, "response");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12 && (v14 = objc_msgSend(v12, "statusCode"), v14 > 399))
  {
    v15 = v14;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Download task: %@ failed to download payload due to: %ld"), v9, v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setValue:forKey:", v16, *MEMORY[0x24BDD0FC8]);
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.NPTKit"), v15, v17);
    v18 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)v18;
    if (v18)
    {
LABEL_6:
      +[NPTLogger network](NPTLogger, "network");
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        -[NPTDownload URLSession:task:didCompleteWithError:].cold.1((uint64_t)v9, v11, v19);

      downloadError = self->downloadError;
      ++self->processedStreamEndCount;
      if (!downloadError)
      {
        objc_storeStrong((id *)&self->downloadError, v11);
        if (!self->endTimeAggregate && self->timedDownloadLength)
          -[NPTDownload cancelDispatchTimerAndSession](self, "cancelDispatchTimerAndSession");
        if (!self->timedDownloadLength)
        {
          downloadSession = self->downloadSession;
          if (downloadSession)
            -[NSURLSession invalidateAndCancel](downloadSession, "invalidateAndCancel");
        }
      }
      goto LABEL_22;
    }
  }
  else
  {
    +[NPTLogger network](NPTLogger, "network");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v37 = v9;
      v38 = 2048;
      v39 = objc_msgSend(v9, "countOfBytesReceived");
      _os_log_impl(&dword_20E71B000, v22, OS_LOG_TYPE_DEFAULT, "Download task: %@ downloaded: %lld bytes", buf, 0x16u);
    }

    if (!self->endTimeAggregate && -[NPTDownload inTimedMode](self, "inTimedMode"))
    {
      -[NPTDownload kickOffNewDownload](self, "kickOffNewDownload");

      v11 = 0;
      goto LABEL_38;
    }

  }
  v11 = 0;
  ++self->processedStreamEndCount;
LABEL_22:
  if (-[NPTDownload isLastTask](self, "isLastTask"))
  {
    v23 = self->downloadError;
    if (v23)
    {
      if (-[NSError code](v23, "code") == -999)
        v24 = 4;
      else
        v24 = 3;
    }
    else
    {
      if (!self->endTimeAggregate && self->timedDownloadLength)
        -[NPTDownload cancelDispatchTimer](self, "cancelDispatchTimer");
      -[NSURLSession finishTasksAndInvalidate](self->downloadSession, "finishTasksAndInvalidate");
      v24 = 2;
    }
    -[NPTDownload completeActivityWithReason:](self, "completeActivityWithReason:", v24);
    -[NPTDownload aggregateResults](self, "aggregateResults");
    v25 = objc_claimAutoreleasedReturnValue();
    -[NPTDownload setResults:](self, "setResults:", v25);

    -[NPTDownload delegate](self, "delegate");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v25) = v26 == 0;

    if ((v25 & 1) == 0)
    {
      v27 = self->downloadError == 0;
      -[NPTDownload delegate](self, "delegate");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v28;
      if (v27)
      {
        -[NPTDownload results](self, "results");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "download:didFinishWithResults:", self, v30);

      }
      else
      {
        objc_msgSend(v28, "download:didFinishWithError:", self, self->downloadError);
      }

    }
    -[NPTDownload completion](self, "completion");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v31 == 0;

    if (!v32)
    {
      objc_initWeak((id *)buf, self);
      -[NPTDownload completion](self, "completion");
      v33 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      WeakRetained = objc_loadWeakRetained((id *)buf);
      objc_msgSend(WeakRetained, "results");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *, NSError *))v33)[2](v33, v35, self->downloadError);

      objc_destroyWeak((id *)buf);
    }
  }
LABEL_38:

}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[NPTDownload results](self, "results");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("downloadResult"));

}

- (NPTDownload)initWithCoder:(id)a3
{
  id v3;
  NPTDownload *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NPTDownload;
  v3 = a3;
  v4 = -[NPTDownload init](&v7, sel_init);
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("downloadResult"), v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[NPTDownload setResults:](v4, "setResults:", v5);
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  NPTDownload *v4;
  void *v5;

  v4 = -[NPTDownload init](+[NPTDownload allocWithZone:](NPTDownload, "allocWithZone:", a3), "init");
  -[NPTDownload results](self, "results");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPTDownload setResults:](v4, "setResults:", v5);

  return v4;
}

- (void)progress:(id)a3
{
  id v4;
  id v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  NSObject *v12;
  NPTSpeedMetric *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  NPTSpeedMetric *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  double v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BDBCE60]);
  objc_msgSend(v5, "timeIntervalSinceDate:", self->initialTime);
  v7 = v6;
  objc_msgSend(v4, "downlinkCapacity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "value");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "doubleValue");
  v11 = v10 / 1000000.0;

  +[NPTLogger network](NPTLogger, "network");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v29 = 134217984;
    v30 = v11;
    _os_log_impl(&dword_20E71B000, v12, OS_LOG_TYPE_DEFAULT, "Download progress speed: %f mbps", (uint8_t *)&v29, 0xCu);
  }

  v13 = [NPTSpeedMetric alloc];
  objc_msgSend(v4, "downlinkBytesTransferred");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (int)objc_msgSend(v14, "intValue");
  v16 = -[NetworkQualityConfiguration maxDownlinkData](self->nqConfig, "maxDownlinkData");
  objc_msgSend(v4, "downlinkResponsiveness");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "value");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[NPTSpeedMetric initWithPointInTime:timeSinceStart:bytesTransferred:totalBytesExpected:speed:responsiveness:](v13, "initWithPointInTime:timeSinceStart:bytesTransferred:totalBytesExpected:speed:responsiveness:", v5, v15, v16, (int)objc_msgSend(v18, "intValue"), v7, v11);

  -[NPTDownload delegate](self, "delegate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    -[NPTDownload delegate](self, "delegate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "download:didReceiveSpeedMetric:", self, v19);

  }
  -[NPTSpeedMetric speed](v19, "speed");
  if (v22 > self->maxSpeedObserved)
  {
    -[NPTSpeedMetric speed](v19, "speed");
    self->maxSpeedObserved = v23;
  }
  if (self->stableSpeedToLog == 0.0)
  {
    -[NPTDownload checkAndReturnSpeedStablized:](self, "checkAndReturnSpeedStablized:", v19);
    if (v24 > 0.0)
    {
      v25 = v24;
      self->stableSpeedToLog = v24;
      +[NPTLogger network](NPTLogger, "network");
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        v27 = -[NPTSpeedMetric bytesTransferred](v19, "bytesTransferred");
        -[NPTSpeedMetric timeSinceStart](v19, "timeSinceStart");
        v29 = 134218496;
        v30 = v25;
        v31 = 2048;
        v32 = v27;
        v33 = 2048;
        v34 = v28;
        _os_log_impl(&dword_20E71B000, v26, OS_LOG_TYPE_DEFAULT, "Download task has stabilized at %f Mbps after downloading %lld bytes over %f seconds", (uint8_t *)&v29, 0x20u);
      }

    }
  }

}

- (BOOL)isTimerCancelledError:(id)a3
{
  return objc_msgSend(a3, "code") == -999 && self->downloadSession != 0;
}

- (BOOL)inTimedMode
{
  return self->timedDownloadLength && !self->stopAtFileSizeEnabled;
}

- (BOOL)isLastTask
{
  return self->processedStreamEndCount == self->maxConcurrentStreams;
}

- (id)checkInterfaceSpecified
{
  void *v3;
  void *v4;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  -[NPTPerformanceTestConfiguration interfaceName](self->testConfig, "interfaceName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {

  }
  else if (-[NPTPerformanceTestConfiguration interfaceType](self->testConfig, "interfaceType") != 3)
  {
    +[NPTPerformanceTestConfiguration interfaceServiceName:](NPTPerformanceTestConfiguration, "interfaceServiceName:", -[NPTPerformanceTestConfiguration interfaceType](self->testConfig, "interfaceType"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to find the interface: %@"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *MEMORY[0x24BDD0FC8];
    v10[0] = v7;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.wifiqa.NPTKit"), 0, v8);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    return v4;
  }
  v4 = 0;
  return v4;
}

- (void)startTasks
{
  NSMutableDictionary *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = self->taskDict;
  v4 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        -[NSMutableDictionary objectForKey:](self->taskDict, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v7), (_QWORD)v10);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "task");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "resume");

        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

}

- (id)realTimeSpeedMetric:(unint64_t)a3
{
  NSMutableDictionary *taskDict;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  double v9;
  NPTSpeedMetric *v10;

  taskDict = self->taskDict;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lu"), a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](taskDict, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "task");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_alloc_init(MEMORY[0x24BDBCE60]);
  objc_msgSend(v8, "timeIntervalSinceDate:", self->initialTime);
  v10 = -[NPTSpeedMetric initWithPointInTime:timeSinceStart:bytesTransferred:totalBytesExpected:]([NPTSpeedMetric alloc], "initWithPointInTime:timeSinceStart:bytesTransferred:totalBytesExpected:", v8, objc_msgSend(v7, "countOfBytesReceived"), objc_msgSend(v7, "countOfBytesExpectedToReceive"), v9);

  return v10;
}

- (id)realTimeSpeedMetricOverall
{
  NSMutableDictionary *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  double v14;
  NPTSpeedMetric *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v3 = self->taskDict;
  v4 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = 0;
    v8 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v3);
        -[NSMutableDictionary objectForKey:](self->taskDict, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i), (_QWORD)v17);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "task");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v7 += objc_msgSend(v11, "countOfBytesReceived");

        objc_msgSend(v10, "task");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v6 += objc_msgSend(v12, "countOfBytesExpectedToReceive");

      }
      v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
    v7 = 0;
  }

  v13 = objc_alloc_init(MEMORY[0x24BDBCE60]);
  objc_msgSend(v13, "timeIntervalSinceDate:", self->initialTime);
  v15 = -[NPTSpeedMetric initWithPointInTime:timeSinceStart:bytesTransferred:totalBytesExpected:]([NPTSpeedMetric alloc], "initWithPointInTime:timeSinceStart:bytesTransferred:totalBytesExpected:", v13, v7, v6, v14);

  return v15;
}

- (id)overAllResultByTask:(unint64_t)a3
{
  NSMutableDictionary *taskDict;
  void *v4;
  void *v5;
  void *v6;

  taskDict = self->taskDict;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lu"), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](taskDict, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "results");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (double)minNonZeroValue:(double)a3 comparisonValue:(double)a4
{
  if (a3 != 0.0)
  {
    if (a4 <= 0.0)
    {
      return a3;
    }
    else if (a3 < a4)
    {
      return a3;
    }
  }
  return a4;
}

- (void)completeActivityWithReason:(int)a3
{
  NSObject *v4;
  OS_nw_activity *downloadActivity;
  uint8_t v6[16];

  if (self->downloadActivity && nw_activity_is_activated())
  {
    +[NPTLogger network](NPTLogger, "network");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_20E71B000, v4, OS_LOG_TYPE_DEFAULT, "Completing downloadActivity", v6, 2u);
    }

    nw_activity_complete_with_reason();
    downloadActivity = self->downloadActivity;
    self->downloadActivity = 0;

  }
}

- (id)aggregateResults
{
  NPTMetricResult *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSDate *v15;
  NSDate *endTimeAggregate;
  NSDate *v17;
  NSObject *v18;
  NPTMetricResult *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSDate *v24;
  uint64_t v25;
  uint64_t v26;
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
  NSDate *v38;
  void *v39;
  NSDate *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  void *v54;
  double v55;
  double v56;
  void *v57;
  double v58;
  double v59;
  double v60;
  void *v61;
  double v62;
  double v63;
  double v64;
  void *v65;
  double v66;
  double v67;
  double v68;
  void *v69;
  double v70;
  double v71;
  double v72;
  void *v73;
  double v74;
  void *v75;
  void *v76;
  uint64_t v77;
  void *v78;
  void *v79;
  NSObject *v80;
  void *v81;
  void *v82;
  uint64_t v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  uint64_t v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  NSObject *v99;
  double v100;
  double v101;
  double v102;
  NSObject *v103;
  void *v104;
  double v105;
  double v106;
  void *v108;
  NSMutableDictionary *obj;
  void *v110;
  void *v111;
  uint64_t v112;
  uint64_t v113;
  NSDate *v114;
  NSDate *v115;
  NPTDownload *v116;
  void *v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  uint8_t buf[4];
  void *v123;
  __int16 v124;
  void *v125;
  __int16 v126;
  uint64_t v127;
  __int16 v128;
  uint64_t v129;
  __int16 v130;
  uint64_t v131;
  _BYTE v132[128];
  uint64_t v133;

  v133 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(NPTMetricResult);
  v116 = self;
  if (-[NSMutableDictionary count](self->taskDict, "count"))
  {
    -[NSMutableDictionary allKeys](self->taskDict, "allKeys");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectAtIndex:", 0);
    v5 = objc_claimAutoreleasedReturnValue();

    -[NSMutableDictionary objectForKeyedSubscript:](v116->taskDict, "objectForKeyedSubscript:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "taskMetrics");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "transactionMetrics");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "responseStartDate");
    v10 = objc_claimAutoreleasedReturnValue();

    -[NSMutableDictionary objectForKeyedSubscript:](v116->taskDict, "objectForKeyedSubscript:", v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "taskMetrics");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "transactionMetrics");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "firstObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "responseEndDate");
    v15 = (NSDate *)objc_claimAutoreleasedReturnValue();

    endTimeAggregate = v116->endTimeAggregate;
    if (endTimeAggregate)
    {
      v17 = endTimeAggregate;

      +[NPTLogger network](NPTLogger, "network");
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20E71B000, v18, OS_LOG_TYPE_DEFAULT, "Download using synthesized end time", buf, 2u);
      }

      v114 = v17;
    }
    else
    {
      v114 = v15;
    }
    v108 = (void *)v5;
    -[NSMutableDictionary objectForKeyedSubscript:](v116->taskDict, "objectForKeyedSubscript:", v5);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "results");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v21, "copy");

    objc_msgSend(v22, "setSpeed:", 0.0);
    objc_msgSend(v22, "setFileSize:", 0);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", v116->maxConcurrentStreams);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setConcurrentStreams:", v23);

    objc_msgSend(v22, "setError:", v116->downloadError);
    v120 = 0u;
    v121 = 0u;
    v118 = 0u;
    v119 = 0u;
    obj = v116->taskDict;
    v24 = (NSDate *)v10;
    v113 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v118, v132, 16);
    if (v113)
    {
      v112 = *(_QWORD *)v119;
      v111 = v22;
      do
      {
        v25 = 0;
        do
        {
          if (*(_QWORD *)v119 != v112)
            objc_enumerationMutation(obj);
          v26 = *(_QWORD *)(*((_QWORD *)&v118 + 1) + 8 * v25);
          -[NSMutableDictionary objectForKey:](v116->taskDict, "objectForKey:", v26);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary objectForKeyedSubscript:](v116->taskDict, "objectForKeyedSubscript:", v26);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "taskMetrics");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "transactionMetrics");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "firstObject");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "responseStartDate");
          v32 = (void *)objc_claimAutoreleasedReturnValue();

          -[NSMutableDictionary objectForKeyedSubscript:](v116->taskDict, "objectForKeyedSubscript:", v26);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "taskMetrics");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "transactionMetrics");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "firstObject");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "responseEndDate");
          v117 = (void *)objc_claimAutoreleasedReturnValue();

          v37 = v32;
          if (v32 && (!v24 || -[NSDate compare:](v24, "compare:", v32) == NSOrderedDescending))
          {
            v38 = v32;

            v24 = v38;
          }
          v39 = v117;
          v22 = v111;
          v115 = v24;
          if (v117 && (!v114 || -[NSDate compare:](v114, "compare:", v117) == NSOrderedAscending))
          {
            v40 = v117;

            v114 = v40;
          }
          +[NPTLogger network](NPTLogger, "network");
          v41 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v27, "task");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "results");
            v110 = v37;
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "domainLookupTime");
            v45 = v44;
            objc_msgSend(v27, "results");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "connectionTime");
            v48 = v47;
            objc_msgSend(v27, "results");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v49, "requestTime");
            v51 = v50;
            objc_msgSend(v27, "results");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v52, "responseTime");
            *(_DWORD *)buf = 138413314;
            v123 = v42;
            v124 = 2048;
            v125 = v45;
            v126 = 2048;
            v127 = v48;
            v128 = 2048;
            v129 = v51;
            v130 = 2048;
            v131 = v53;
            _os_log_impl(&dword_20E71B000, v41, OS_LOG_TYPE_DEFAULT, "Download Task: %@ DomainLookupTime: %f, connectionTime: %f, requestTime: %f, responseTime: %f", buf, 0x34u);

            v39 = v117;
            v37 = v110;

          }
          objc_msgSend(v27, "results");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v111, "setFileSize:", objc_msgSend(v111, "fileSize") + objc_msgSend(v54, "fileSize"));

          objc_msgSend(v111, "domainLookupTime");
          v56 = v55;
          objc_msgSend(v27, "results");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "domainLookupTime");
          -[NPTDownload minNonZeroValue:comparisonValue:](v116, "minNonZeroValue:comparisonValue:", v56, v58);
          objc_msgSend(v111, "setDomainLookupTime:");

          objc_msgSend(v111, "connectionTime");
          v60 = v59;
          objc_msgSend(v27, "results");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "connectionTime");
          -[NPTDownload minNonZeroValue:comparisonValue:](v116, "minNonZeroValue:comparisonValue:", v60, v62);
          objc_msgSend(v111, "setConnectionTime:");

          objc_msgSend(v111, "secureConnectionTime");
          v64 = v63;
          objc_msgSend(v27, "results");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v65, "secureConnectionTime");
          -[NPTDownload minNonZeroValue:comparisonValue:](v116, "minNonZeroValue:comparisonValue:", v64, v66);
          objc_msgSend(v111, "setSecureConnectionTime:");

          objc_msgSend(v111, "requestTime");
          v68 = v67;
          objc_msgSend(v27, "results");
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v69, "requestTime");
          -[NPTDownload minNonZeroValue:comparisonValue:](v116, "minNonZeroValue:comparisonValue:", v68, v70);
          objc_msgSend(v111, "setRequestTime:");

          objc_msgSend(v111, "requestToResponseTime");
          v72 = v71;
          objc_msgSend(v27, "results");
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v73, "requestToResponseTime");
          -[NPTDownload minNonZeroValue:comparisonValue:](v116, "minNonZeroValue:comparisonValue:", v72, v74);
          objc_msgSend(v111, "setRequestToResponseTime:");

          objc_msgSend(v27, "results");
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v75, "cdnpop");
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          v77 = objc_msgSend(v76, "length");

          if (v77)
          {
            objc_msgSend(v27, "results");
            v78 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v78, "cdnpop");
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v111, "setCdnpop:", v79);

            +[NPTLogger network](NPTLogger, "network");
            v80 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v80, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(v27, "task");
              v95 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "results");
              v96 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v96, "cdnpop");
              v97 = v37;
              v98 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v123 = v95;
              v124 = 2112;
              v125 = v98;
              _os_log_debug_impl(&dword_20E71B000, v80, OS_LOG_TYPE_DEBUG, "Task: %@ CDN point of presence: %@", buf, 0x16u);

              v37 = v97;
            }

          }
          objc_msgSend(v27, "results");
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v81, "server");
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          v83 = objc_msgSend(v82, "length");

          if (v83)
          {
            objc_msgSend(v27, "results");
            v84 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v84, "server");
            v85 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v111, "setServer:", v85);

          }
          objc_msgSend(v27, "results");
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v86, "appleClientASNCompany");
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          v88 = objc_msgSend(v87, "length");

          if (v88)
          {
            objc_msgSend(v27, "results");
            v89 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v89, "appleClientASNCompany");
            v90 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v111, "setAppleClientASNCompany:", v90);

          }
          objc_msgSend(v27, "results");
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v91, "appleClientASN");
          v92 = (void *)objc_claimAutoreleasedReturnValue();

          if (v92)
          {
            objc_msgSend(v27, "results");
            v93 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v93, "appleClientASN");
            v94 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v111, "setAppleClientASN:", v94);

          }
          ++v25;
          v24 = v115;
        }
        while (v113 != v25);
        v113 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v118, v132, 16);
      }
      while (v113);
    }

    if (!v24)
    {
      v24 = v116->initialTime;
      +[NPTLogger network](NPTLogger, "network");
      v99 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v99, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20E71B000, v99, OS_LOG_TYPE_DEFAULT, "Download using synthesized start time", buf, 2u);
      }

    }
    -[NSDate timeIntervalSinceDate:](v114, "timeIntervalSinceDate:", v24);
    if (v100 > 0.0)
    {
      objc_msgSend(v22, "setResponseTime:");
      v101 = (double)(unint64_t)objc_msgSend(v22, "fileSize") * 8.0;
      -[NSDate timeIntervalSinceDate:](v114, "timeIntervalSinceDate:", v24);
      objc_msgSend(v22, "setSpeed:", v101 / v102 / 1000000.0);
    }
    +[NPTLogger network](NPTLogger, "network");
    v103 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v103, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v22, "speed");
      *(_DWORD *)buf = 134217984;
      v123 = v104;
      _os_log_impl(&dword_20E71B000, v103, OS_LOG_TYPE_DEFAULT, "Download performance test has finished at %f Mbps", buf, 0xCu);
    }

    objc_msgSend(v22, "speed");
    if (v105 > v116->maxSpeedObserved)
    {
      objc_msgSend(v22, "speed");
      v116->maxSpeedObserved = v106;
    }
    objc_msgSend(v22, "setMaxSpeedObserved:");
    if (v116->stableSpeedToLog > 0.0)
      objc_msgSend(v22, "setStableSpeed:");
    v19 = v22;

  }
  else
  {
    v19 = v3;
  }

  return v19;
}

- (BOOL)finishedAllTasks
{
  NSMutableDictionary *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  BOOL v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = self->taskDict;
  v4 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        -[NSMutableDictionary objectForKey:](self->taskDict, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i), (_QWORD)v12);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "taskMetrics");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v9)
        {
          v10 = 0;
          goto LABEL_11;
        }
      }
      v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v5)
        continue;
      break;
    }
  }
  v10 = 1;
LABEL_11:

  return v10;
}

- (id)processNQResult:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  unint64_t v17;
  void *v18;
  NPTTaskMetrics *v19;
  void *v20;
  NSMutableDictionary *taskDict;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v49;
  id v50;
  uint64_t v51;
  id obj;
  uint64_t v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v50 = a3;
  objc_msgSend(v50, "urlSessionMetrics");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v58, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v55;
    v7 = 0x24C990000uLL;
    v49 = *(_QWORD *)v55;
    do
    {
      v8 = 0;
      v51 = v5;
      do
      {
        if (*(_QWORD *)v55 != v6)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * v8);
        if (objc_msgSend(v9, "hasPrefix:", CFSTR("tp_")))
        {
          v53 = v8;
          objc_msgSend(v50, "urlSessionMetrics");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "objectForKeyedSubscript:", v9);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v11, "count"))
          {
            v12 = 0;
            do
            {
              objc_msgSend(v11, "objectAtIndexedSubscript:", v12);
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              v14 = objc_alloc_init(*(Class *)(v7 + 1744));
              objc_msgSend(v14, "populateWithMetrics:", v13);
              objc_msgSend(v13, "transactionMetrics");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "firstObject");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "response");
              v17 = v7;
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "populateWithURLResponse:", v18);

              v19 = objc_alloc_init(NPTTaskMetrics);
              objc_msgSend(v11, "objectAtIndexedSubscript:", v12);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              -[NPTTaskMetrics setTaskMetrics:](v19, "setTaskMetrics:", v20);

              -[NPTTaskMetrics setResults:](v19, "setResults:", v14);
              taskDict = self->taskDict;
              v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%d"), v12);
              -[NSMutableDictionary setObject:forKeyedSubscript:](taskDict, "setObject:forKeyedSubscript:", v19, v22);

              v7 = v17;
              ++v12;
            }
            while (objc_msgSend(v11, "count") > v12);
          }

          v6 = v49;
          v5 = v51;
          v8 = v53;
        }
        ++v8;
      }
      while (v8 != v5);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v58, 16);
    }
    while (v5);
  }

  -[NPTDownload aggregateResults](self, "aggregateResults");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setMaxSpeedObserved:", self->maxSpeedObserved);
  objc_msgSend(v50, "downlinkBytesTransferred");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setFileSize:", objc_msgSend(v24, "unsignedIntValue"));

  objc_msgSend(v50, "downlinkCapacity");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "value");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "doubleValue");
  objc_msgSend(v23, "setSpeed:", v27 / 1000000.0);

  objc_msgSend(v50, "downlinkCapacity");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "rating");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (v29)
  {
    objc_msgSend(v23, "setSpeedRating:", v29);
  }
  else
  {
    v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInt:", 0);
    objc_msgSend(v23, "setSpeedRating:", v30);

  }
  v31 = objc_alloc(MEMORY[0x24BDD16E0]);
  objc_msgSend(v50, "downlinkCapacity");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = (void *)objc_msgSend(v31, "initWithInteger:", objc_msgSend(v32, "confidence"));
  objc_msgSend(v23, "setSpeedConfidence:", v33);

  objc_msgSend(v50, "downlinkResponsiveness");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "value");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (v35)
  {
    objc_msgSend(v23, "setResponsiveness:", v35);
  }
  else
  {
    v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInt:", 0);
    objc_msgSend(v23, "setResponsiveness:", v36);

  }
  objc_msgSend(v50, "downlinkResponsiveness");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "rating");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  if (v38)
  {
    objc_msgSend(v23, "setResponsivenessRating:", v38);
  }
  else
  {
    v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInt:", 0);
    objc_msgSend(v23, "setResponsivenessRating:", v39);

  }
  v40 = objc_alloc(MEMORY[0x24BDD16E0]);
  objc_msgSend(v50, "downlinkResponsiveness");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = (void *)objc_msgSend(v40, "initWithInteger:", objc_msgSend(v41, "confidence"));
  objc_msgSend(v23, "setResponsivenessConfidence:", v42);

  objc_msgSend(v50, "downlinkFlows");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  if (v43)
  {
    objc_msgSend(v23, "setConcurrentStreams:", v43);
  }
  else
  {
    v44 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInt:", 0);
    objc_msgSend(v23, "setConcurrentStreams:", v44);

  }
  objc_msgSend(v50, "latency");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "value");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setLatency:", v46);

  objc_msgSend(v50, "testEndpoint");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setNqTestEndPoint:", v47);

  return v23;
}

- (id)delegate
{
  return objc_loadWeakRetained(&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak(&self->_delegate, a3);
}

- (NPTMetricResult)results
{
  return self->_results;
}

- (void)setResults:(id)a3
{
  objc_storeStrong((id *)&self->_results, a3);
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_results, 0);
  objc_destroyWeak(&self->_delegate);
  objc_storeStrong((id *)&self->nqConfig, 0);
  objc_storeStrong((id *)&self->nqTest, 0);
  objc_storeStrong((id *)&self->testConfig, 0);
  objc_storeStrong((id *)&self->callingClient, 0);
  objc_storeStrong((id *)&self->downloadError, 0);
  objc_storeStrong((id *)&self->endTimeAggregate, 0);
  objc_storeStrong((id *)&self->buffer, 0);
  objc_storeStrong((id *)&self->timeoutTimer, 0);
  objc_storeStrong((id *)&self->taskDict, 0);
  objc_storeStrong((id *)&self->downloadActivity, 0);
  objc_storeStrong((id *)&self->activityParent, 0);
  objc_storeStrong((id *)&self->request, 0);
  objc_storeStrong((id *)&self->initialTime, 0);
  objc_storeStrong((id *)&self->downloadSession, 0);
}

- (void)URLSession:(uint64_t)a1 task:(void *)a2 didCompleteWithError:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a2, "localizedDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = a1;
  v8 = 2114;
  v9 = v5;
  _os_log_error_impl(&dword_20E71B000, a3, OS_LOG_TYPE_ERROR, "Download task: %@ Errored with: %{public}@", (uint8_t *)&v6, 0x16u);

}

@end
