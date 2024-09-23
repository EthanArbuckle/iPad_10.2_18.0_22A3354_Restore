@implementation AMSMetricsFigaroFlushTask

id __121__AMSMetricsFigaroFlushTask__flushNextBatchWithMaxRequestCount_topic_maxBatchSize_requestCount_flushedEventCount_config___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  void *v32;
  _QWORD v34[5];
  id v35;
  id v36;
  id v37;
  uint64_t v38;
  __int128 v39;
  uint64_t v40;
  id v41;
  id v42;

  v5 = a3;
  if (a2)
  {
    objc_msgSend(a2, "value");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (!v6)
    {
      objc_msgSend(*(id *)(a1 + 32), "dataSource");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "didFinishBatching");

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 56));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v18);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_18:
      goto LABEL_19;
    }
    objc_msgSend(v6, "droppedEvents");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    if (v9)
    {
      objc_msgSend(*(id *)(a1 + 32), "dataSource");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "droppedEvents");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = 0;
      v12 = objc_msgSend(v10, "removeEvents:error:", v11, &v42);
      v13 = v42;

      if ((v12 & 1) == 0)
      {
LABEL_11:
        objc_msgSend(*(id *)(a1 + 32), "dataSource");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "didFinishBatching");

        +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v13);
        v25 = objc_claimAutoreleasedReturnValue();
        goto LABEL_16;
      }
      v14 = v13;
    }
    else
    {
      v14 = 0;
    }
    objc_msgSend(v7, "skippedEvents");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "count");

    if (v20)
    {
      objc_msgSend(*(id *)(a1 + 32), "dataSource");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "skippedEvents");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = v14;
      v23 = objc_msgSend(v21, "skipEvents:error:", v22, &v41);
      v13 = v41;

      if ((v23 & 1) == 0)
        goto LABEL_11;
    }
    else
    {
      v13 = v14;
    }
    objc_msgSend(v7, "events");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "count");

    v28 = *(void **)(a1 + 32);
    if (v27)
    {
      objc_msgSend(v28, "_postBatch:", v7);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v34[0] = MEMORY[0x1E0C809B0];
      v34[1] = 3221225472;
      v34[2] = __121__AMSMetricsFigaroFlushTask__flushNextBatchWithMaxRequestCount_topic_maxBatchSize_requestCount_flushedEventCount_config___block_invoke_2;
      v34[3] = &unk_1E2543988;
      v34[4] = *(_QWORD *)(a1 + 32);
      v30 = v7;
      v31 = *(_QWORD *)(a1 + 64);
      v35 = v30;
      v38 = v31;
      v36 = *(id *)(a1 + 40);
      v39 = *(_OWORD *)(a1 + 72);
      v32 = *(void **)(a1 + 48);
      v40 = *(_QWORD *)(a1 + 56);
      v37 = v32;
      objc_msgSend(v29, "continueWithBlock:", v34);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_17:
      goto LABEL_18;
    }
    objc_msgSend(v28, "_flushNextBatchWithMaxRequestCount:topic:maxBatchSize:requestCount:flushedEventCount:config:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));
    v25 = objc_claimAutoreleasedReturnValue();
LABEL_16:
    v16 = (void *)v25;
    goto LABEL_17;
  }
  objc_msgSend(*(id *)(a1 + 32), "dataSource");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "didFinishBatching");

  +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_19:

  return v16;
}

uint64_t __69__AMSMetricsFigaroFlushTask__nextBatchWithConfig_topic_maxBatchSize___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "eventType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("loadUrl"));

  return v3;
}

uint64_t __69__AMSMetricsFigaroFlushTask__nextBatchWithConfig_topic_maxBatchSize___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "dictionaryForPosting");
}

- (id)_postBatch:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  AMSURLRequestEncoder *v17;
  id v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  AMSURLRequestEncoder *v23;
  void *v24;
  void *v25;
  void *v26;
  AMSURLRequest *v27;
  void *v28;
  AMSURLRequest *v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  uint64_t v34;
  id v35;
  uint64_t v37;
  void *v38;
  void *v39;
  _QWORD v40[4];
  id v41;
  id v42;
  id v43;
  AMSMetricsFigaroFlushTask *v44;
  id v45;
  id v46;
  uint8_t buf[4];
  uint64_t v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  id v52;
  _QWORD v53[3];
  _QWORD v54[5];

  v54[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[AMSLogConfig sharedMetricsConfig](AMSLogConfig, "sharedMetricsConfig");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "OSLogObject");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = objc_opt_class();
    AMSLogKey();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v48 = v7;
    v49 = 2114;
    v50 = v8;
    v51 = 1024;
    LODWORD(v52) = objc_msgSend(v4, "anonymous");
    _os_log_impl(&dword_18C849000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Posting batch. (anon:%d)", buf, 0x1Cu);

  }
  v54[0] = &unk_1E25B02D0;
  v53[0] = CFSTR("deliveryVersion");
  v53[1] = CFSTR("postTime");
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSMetrics serverTimeFromDate:](AMSMetrics, "serverTimeFromDate:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v54[1] = v10;
  v53[2] = CFSTR("events");
  objc_msgSend(v4, "eventDictionaries");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v54[2] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v54, v53, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v46 = 0;
  +[AMSData dataWithObject:encoding:error:](AMSData, "dataWithObject:encoding:error:", v12, 3, &v46);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v46;
  v15 = v14;
  if (!v13 || v14)
  {
    if (!v14)
    {
      AMSError(3, CFSTR("No Metrics Body"), CFSTR("Unable to post nil metrics body"), 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[AMSData compressedGzippedDataWithData:](AMSData, "compressedGzippedDataWithData:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      v39 = v12;
      if (-[AMSMetricsFigaroFlushTask metricsSigningFlavour](self, "metricsSigningFlavour"))
      {
        v37 = 0;
      }
      else
      {
        v45 = 0;
        -[AMSMetricsFigaroFlushTask _mescalSignatureWithBodyData:error:](self, "_mescalSignatureWithBodyData:error:", v13, &v45);
        v37 = objc_claimAutoreleasedReturnValue();
        v18 = v45;
        if (v18)
        {
          +[AMSLogConfig sharedMetricsConfig](AMSLogConfig, "sharedMetricsConfig");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v19)
          {
            +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v19, "OSLogObject", v37);
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            v21 = objc_opt_class();
            AMSLogKey();
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v48 = v21;
            v49 = 2114;
            v50 = v22;
            v51 = 2114;
            v52 = v18;
            _os_log_impl(&dword_18C849000, v20, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to generate mescal signature. Error = %{public}@", buf, 0x20u);

          }
        }

      }
      v23 = [AMSURLRequestEncoder alloc];
      -[AMSMetricsFigaroFlushTask bag](self, "bag");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[AMSURLRequestEncoder initWithBag:](v23, "initWithBag:", v24);

      if (objc_msgSend(v4, "anonymous"))
      {
        -[AMSURLRequestEncoder setAccount:](v17, "setAccount:", 0);
      }
      else
      {
        objc_msgSend(v4, "account");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[AMSURLRequestEncoder setAccount:](v17, "setAccount:", v25);

      }
      -[AMSURLRequestEncoder setUrlKnownToBeTrusted:](v17, "setUrlKnownToBeTrusted:", 1, v37);
      AMSLogKey();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSURLRequestEncoder setLogUUID:](v17, "setLogUUID:", v26);

      -[AMSURLRequestEncoder setAlwaysIncludeMMeClientInfoAndDeviceHeaders:](v17, "setAlwaysIncludeMMeClientInfoAndDeviceHeaders:", -[AMSMetricsFigaroFlushTask includeMMeClientInfoAndDeviceHeaders](self, "includeMMeClientInfoAndDeviceHeaders"));
      -[AMSURLRequestEncoder setIncludeClientVersions:](v17, "setIncludeClientVersions:", 0);
      v27 = [AMSURLRequest alloc];
      objc_msgSend(v4, "reportURL");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = -[AMSURLRequest initWithURL:](v27, "initWithURL:", v28);

      -[AMSURLRequest setNetworkServiceType:](v29, "setNetworkServiceType:", 3);
      -[AMSURLRequest setCachePolicy:](v29, "setCachePolicy:", 1);
      -[AMSURLRequest setTimeoutInterval:](v29, "setTimeoutInterval:", 10.0);
      -[AMSURLRequest setHTTPMethod:](v29, "setHTTPMethod:", CFSTR("POST"));
      if (-[AMSMetricsFigaroFlushTask metricsSigningFlavour](self, "metricsSigningFlavour") == 1)
        -[AMSURLRequest setHTTPBody:](v29, "setHTTPBody:", v13);
      -[AMSURLRequestEncoder requestByEncodingRequest:parameters:](v17, "requestByEncodingRequest:parameters:", v29, 0);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "reportURL");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "lastPathComponent");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v32, "isEqualToString:", CFSTR("xp_ase_appstore_ue"));

      if (v33)
      {
        objc_msgSend(v30, "thenWithBlock:", &__block_literal_global_151);
        v34 = objc_claimAutoreleasedReturnValue();

        v30 = (void *)v34;
      }
      v40[0] = MEMORY[0x1E0C809B0];
      v40[1] = 3221225472;
      v40[2] = __40__AMSMetricsFigaroFlushTask__postBatch___block_invoke_3;
      v40[3] = &unk_1E2543AB0;
      v41 = v4;
      v42 = v15;
      v43 = v38;
      v44 = self;
      v35 = v38;
      objc_msgSend(v30, "thenWithBlock:", v40);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = v39;
    }
    else
    {
      AMSError(3, CFSTR("Unable to Gzip body"), CFSTR("Unable to Gzip the metrics flush body"), 0);
      v17 = (AMSURLRequestEncoder *)objc_claimAutoreleasedReturnValue();
      +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v17);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  return v16;
}

- (unint64_t)metricsSigningFlavour
{
  return self->_metricsSigningFlavour;
}

- (BOOL)includeMMeClientInfoAndDeviceHeaders
{
  return self->_includeMMeClientInfoAndDeviceHeaders;
}

- (void)setMaxBatchSize:(int64_t)a3
{
  self->_maxBatchSize = a3;
}

- (void)setTopic:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void)setMetricsSigningFlavour:(unint64_t)a3
{
  self->_metricsSigningFlavour = a3;
}

- (void)setMaxRequestCount:(int64_t)a3
{
  self->_maxRequestCount = a3;
}

- (void)setIncludeMMeClientInfoAndDeviceHeaders:(BOOL)a3
{
  self->_includeMMeClientInfoAndDeviceHeaders = a3;
}

- (id)performFlush
{
  int64_t v3;
  void *v4;
  int64_t v5;
  id v6;
  void *v7;
  _QWORD v9[5];
  id v10;
  int64_t v11;
  int64_t v12;

  v3 = -[AMSMetricsFigaroFlushTask maxRequestCount](self, "maxRequestCount");
  -[AMSMetricsFigaroFlushTask topic](self, "topic");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[AMSMetricsFigaroFlushTask maxBatchSize](self, "maxBatchSize");
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __41__AMSMetricsFigaroFlushTask_performFlush__block_invoke;
  v9[3] = &unk_1E2543938;
  v9[4] = self;
  v10 = v4;
  v11 = v3;
  v12 = v5;
  v6 = v4;
  -[AMSTask performTaskWithPromiseBlock:](self, "performTaskWithPromiseBlock:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)topic
{
  return self->_topic;
}

- (int64_t)maxRequestCount
{
  return self->_maxRequestCount;
}

- (int64_t)maxBatchSize
{
  return self->_maxBatchSize;
}

- (AMSMetricsFigaroFlushTask)initWithDataSource:(id)a3 bag:(id)a4
{
  id v7;
  id v8;
  AMSMetricsFigaroFlushTask *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *anomalyDetectionQueue;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)AMSMetricsFigaroFlushTask;
  v9 = -[AMSTask init](&v13, sel_init);
  if (v9)
  {
    v10 = dispatch_queue_create("com.apple.AppleMediaServices.AMSMetricsAnomolies", 0);
    anomalyDetectionQueue = v9->_anomalyDetectionQueue;
    v9->_anomalyDetectionQueue = (OS_dispatch_queue *)v10;

    objc_storeStrong((id *)&v9->_dataSource, a3);
    objc_storeStrong((id *)&v9->_bag, a4);
    v9->_maxBatchSize = 500;
    v9->_maxRequestCount = 50;
    v9->_currentCancellableDataTaskPromiseLock._os_unfair_lock_opaque = 0;
    v9->_includeMMeClientInfoAndDeviceHeaders = 0;
    v9->_metricsSigningFlavour = 0;
  }

  return v9;
}

id __40__AMSMetricsFigaroFlushTask__postBatch___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v2 = a2;
  objc_msgSend(v2, "ams_addAuthKitHeaders");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "promiseAdapter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __40__AMSMetricsFigaroFlushTask__postBatch___block_invoke_2;
  v8[3] = &unk_1E2543A88;
  v9 = v2;
  v5 = v2;
  objc_msgSend(v4, "thenWithBlock:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (AMSURLSession)URLSession
{
  AMSURLSession *URLSession;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  AMSURLSession *v8;
  AMSURLSession *v9;

  URLSession = self->_URLSession;
  if (!URLSession)
  {
    v4 = (void *)MEMORY[0x1E0C92CA0];
    +[AMSProcessInfo currentProcess](AMSProcessInfo, "currentProcess");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSMetricsFigaroFlushTask bag](self, "bag");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ams_configurationWithProcessInfo:bag:", v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "setURLCache:", 0);
    objc_msgSend(v7, "setRequestCachePolicy:", 1);
    v8 = -[AMSURLSession initWithConfiguration:]([AMSURLSession alloc], "initWithConfiguration:", v7);
    v9 = self->_URLSession;
    self->_URLSession = v8;

    URLSession = self->_URLSession;
  }
  return URLSession;
}

- (AMSBagProtocol)bag
{
  return self->_bag;
}

void __69__AMSMetricsFigaroFlushTask__nextBatchWithConfig_topic_maxBatchSize___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, _BYTE *a5)
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = (void *)MEMORY[0x18D78A1C4]();
  if (!v11)
  {
    objc_msgSend(*(id *)(a1 + 32), "_detectAnomaliesForEvent:", v9);
    objc_msgSend(*(id *)(a1 + 40), "modifierForEvent:", v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "reportingURLForEvent:", v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v13, "shouldDropEvent:", v9) & 1) != 0 || !objc_msgSend(v14, "length"))
    {
      if (!objc_msgSend(v14, "length"))
      {
        +[AMSLogConfig sharedMetricsConfig](AMSLogConfig, "sharedMetricsConfig");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v16)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v16, "OSLogObject");
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          v23 = objc_opt_class();
          AMSLogKey();
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "topic");
          *(_DWORD *)buf = 138543874;
          v26 = v23;
          v27 = 2114;
          v28 = v24;
          v29 = 2114;
          v30 = objc_claimAutoreleasedReturnValue();
          v18 = (void *)v30;
          _os_log_impl(&dword_18C849000, v17, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Dropping event with no reporting URL. Topic: %{public}@", buf, 0x20u);

        }
      }
      v15 = *(void **)(a1 + 48);
    }
    else
    {
      if (!objc_msgSend(v13, "shouldSkipEvent:", v9))
      {
        v19 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
        if (v19)
          v20 = objc_msgSend(v19, "isEqualToString:", v10) ^ 1;
        else
          v20 = 0;
        if ((unint64_t)objc_msgSend(*(id *)(a1 + 64), "count") >= *(_QWORD *)(a1 + 96) || v20)
        {
          *a5 = 1;
        }
        else
        {
          objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), a3);
          objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), v14);
          v21 = *(void **)(a1 + 64);
          objc_msgSend(v13, "preparedEventPromiseWithEvent:", v9);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "addObject:", v22);

        }
        goto LABEL_15;
      }
      v15 = *(void **)(a1 + 56);
    }
    objc_msgSend(v15, "addObject:", v9, v23);
LABEL_15:

    goto LABEL_16;
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), a4);
  *a5 = 1;
LABEL_16:
  objc_autoreleasePoolPop(v12);

}

id __41__AMSMetricsFigaroFlushTask_performFlush__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  _QWORD v10[5];
  id v11;
  uint64_t v12;
  uint64_t v13;

  objc_msgSend(*(id *)(a1 + 32), "bag");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSMetricsFigaroBagConfguration configurationPromiseWithBag:](AMSMetricsFigaroBagConfguration, "configurationPromiseWithBag:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[2] = __41__AMSMetricsFigaroFlushTask_performFlush__block_invoke_2;
  v10[3] = &unk_1E2543910;
  v5 = *(void **)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v10[4] = *(_QWORD *)(a1 + 32);
  v12 = v4;
  v10[1] = 3221225472;
  v6 = v5;
  v7 = *(_QWORD *)(a1 + 56);
  v11 = v6;
  v13 = v7;
  objc_msgSend(v3, "thenWithBlock:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_mescalSignatureWithBodyData:(id)a3 error:(id *)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v12;

  objc_msgSend(a3, "ams_SHA1");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "length"))
  {
    v7 = 0;
  }
  else
  {
    AMSError(304, CFSTR("Metrics Mescal Failed"), CFSTR("Failed to generate digest"), 0);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v8 = 0;
  if (v6 && !v7)
  {
    -[AMSMetricsFigaroFlushTask bag](self, "bag");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    +[AMSMescal signatureFromData:type:bag:error:](AMSMescal, "signatureFromData:type:bag:error:", v6, 1, v9, &v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (uint64_t)v12;

    v8 = 0;
    if (!v7 && v10)
    {
      objc_msgSend(v10, "base64EncodedStringWithOptions:", 0);
      v8 = objc_claimAutoreleasedReturnValue();
    }

  }
  if (!(v8 | v7))
  {
    AMSError(304, CFSTR("Metrics Mescal Failed"), CFSTR("Signature is nil"), 0);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  if (v7)
  {

    v8 = 0;
    if (a4)
      *a4 = objc_retainAutorelease((id)v7);
  }

  return (id)v8;
}

id __41__AMSMetricsFigaroFlushTask_performFlush__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  id v7;
  void *v8;
  id v10;

  v3 = a2;
  objc_msgSend(v3, "prepareForFlush");
  objc_msgSend(*(id *)(a1 + 32), "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  AMSLogKey();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v6 = objc_msgSend(v4, "willStartBatchingWithLogKey:error:", v5, &v10);
  v7 = v10;

  if ((v6 & 1) != 0)
    objc_msgSend(*(id *)(a1 + 32), "_flushNextBatchWithMaxRequestCount:topic:maxBatchSize:requestCount:flushedEventCount:config:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), 0, 0, v3);
  else
    +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __121__AMSMetricsFigaroFlushTask__flushNextBatchWithMaxRequestCount_topic_maxBatchSize_requestCount_flushedEventCount_config___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v20;

  v5 = a2;
  v6 = a3;
  if (v6 && !objc_msgSend(*(id *)(a1 + 32), "_shouldClearEventsDespiteError:result:", v6, v5))
    goto LABEL_4;
  objc_msgSend(*(id *)(a1 + 32), "dataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "events");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v6;
  objc_msgSend(v7, "removeEvents:error:", v8, &v20);
  v9 = v20;

  v6 = v9;
  if (v9)
  {
LABEL_4:
    objc_msgSend(*(id *)(a1 + 32), "dataSource");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "didFinishBatching");

    +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v6);
    v11 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = *(_QWORD *)(a1 + 48);
    v13 = *(_QWORD *)(a1 + 64);
    v14 = *(_QWORD *)(a1 + 72);
    v15 = *(_QWORD *)(a1 + 88);
    v16 = *(_QWORD *)(a1 + 80) + 1;
    v17 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "events");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "_flushNextBatchWithMaxRequestCount:topic:maxBatchSize:requestCount:flushedEventCount:config:", v13, v12, v14, v16, objc_msgSend(v6, "count") + v15, *(_QWORD *)(a1 + 56));
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v18 = (void *)v11;

  return v18;
}

- (id)_flushNextBatchWithMaxRequestCount:(unint64_t)a3 topic:(id)a4 maxBatchSize:(int64_t)a5 requestCount:(unint64_t)a6 flushedEventCount:(unint64_t)a7 config:(id)a8
{
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[5];
  id v23;
  id v24;
  unint64_t v25;
  unint64_t v26;
  int64_t v27;
  unint64_t v28;

  v14 = a4;
  v15 = a8;
  v16 = (void *)objc_opt_new();
  if (a3 - 1 >= a6)
  {
    -[AMSMetricsFigaroFlushTask _nextBatchWithConfig:topic:maxBatchSize:](self, "_nextBatchWithConfig:topic:maxBatchSize:", v15, v14, a5);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __121__AMSMetricsFigaroFlushTask__flushNextBatchWithMaxRequestCount_topic_maxBatchSize_requestCount_flushedEventCount_config___block_invoke;
    v22[3] = &unk_1E25439B0;
    v22[4] = self;
    v25 = a7;
    v26 = a3;
    v23 = v14;
    v27 = a5;
    v28 = a6;
    v24 = v15;
    objc_msgSend(v19, "continueWithBlock:", v22);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "finishWithPromise:", v20);

  }
  else
  {
    -[AMSMetricsFigaroFlushTask dataSource](self, "dataSource");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "didFinishBatching");

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a7);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "finishWithResult:", v18);

  }
  return v16;
}

- (id)_nextBatchWithConfig:(id)a3 topic:(id)a4 maxBatchSize:(int64_t)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  NSObject *v21;
  id v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  _QWORD *v32;
  _QWORD v33[5];
  id v34;
  id v35;
  id v36;
  id v37;
  uint64_t *v38;
  _QWORD *v39;
  _QWORD *v40;
  int64_t v41;
  _QWORD v42[5];
  id v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;
  _QWORD v50[5];
  id v51;
  uint8_t buf[4];
  id v53;
  __int16 v54;
  void *v55;
  __int16 v56;
  uint64_t v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  +[AMSDefaults metricsCanaryIdentifier](AMSDefaults, "metricsCanaryIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v50[0] = 0;
  v50[1] = v50;
  v50[2] = 0x3032000000;
  v50[3] = __Block_byref_object_copy__46;
  v50[4] = __Block_byref_object_dispose__46;
  v51 = 0;
  v44 = 0;
  v45 = &v44;
  v46 = 0x3032000000;
  v47 = __Block_byref_object_copy__46;
  v48 = __Block_byref_object_dispose__46;
  v49 = 0;
  v42[0] = 0;
  v42[1] = v42;
  v42[2] = 0x3032000000;
  v42[3] = __Block_byref_object_copy__46;
  v42[4] = __Block_byref_object_dispose__46;
  v43 = 0;
  v13 = (void *)objc_opt_new();
  -[AMSMetricsFigaroFlushTask dataSource](self, "dataSource");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __69__AMSMetricsFigaroFlushTask__nextBatchWithConfig_topic_maxBatchSize___block_invoke;
  v33[3] = &unk_1E25439D8;
  v38 = &v44;
  v33[4] = self;
  v16 = v8;
  v34 = v16;
  v17 = v10;
  v35 = v17;
  v18 = v11;
  v36 = v18;
  v39 = v50;
  v19 = v13;
  v37 = v19;
  v40 = v42;
  v41 = a5;
  objc_msgSend(v14, "enumerateSortedEventsForTopic:block:", v9, v33);

  if (v45[5])
  {
    +[AMSLogConfig sharedMetricsConfig](AMSLogConfig, "sharedMetricsConfig");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v20)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v20, "OSLogObject");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v22 = (id)objc_opt_class();
      AMSLogKey();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v45[5];
      *(_DWORD *)buf = 138543874;
      v53 = v22;
      v54 = 2114;
      v55 = v23;
      v56 = 2114;
      v57 = v24;
      _os_log_impl(&dword_18C849000, v21, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to fetch next batch. Error = %{public}@", buf, 0x20u);

    }
    +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v45[5]);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[AMSPromise promiseWithSome:](AMSPromise, "promiseWithSome:", v19);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v15;
    v28[1] = 3221225472;
    v28[2] = __69__AMSMetricsFigaroFlushTask__nextBatchWithConfig_topic_maxBatchSize___block_invoke_117;
    v28[3] = &unk_1E2543A60;
    v29 = v12;
    v30 = v17;
    v31 = v18;
    v32 = v42;
    objc_msgSend(v26, "thenWithBlock:", v28);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

  }
  _Block_object_dispose(v42, 8);

  _Block_object_dispose(&v44, 8);
  _Block_object_dispose(v50, 8);

  return v25;
}

- (AMSMetricsDataSource)dataSource
{
  return self->_dataSource;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_bag, 0);
  objc_storeStrong((id *)&self->_topic, 0);
  objc_storeStrong((id *)&self->_URLSession, 0);
  objc_storeStrong((id *)&self->_currentCancellableDataTaskPromise, 0);
  objc_storeStrong((id *)&self->_anomalyDetectionQueue, 0);
}

- (BOOL)cancel
{
  void *v3;
  NSObject *v4;
  id v5;
  void *v6;
  os_unfair_lock_s *p_currentCancellableDataTaskPromiseLock;
  BOOL v8;
  objc_super v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  +[AMSLogConfig sharedMetricsConfig](AMSLogConfig, "sharedMetricsConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v3, "OSLogObject");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v12 = (id)objc_opt_class();
    v5 = v12;
    _os_log_impl(&dword_18C849000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Cancelling task", buf, 0xCu);

  }
  -[AMSMetricsFigaroFlushTask dataSource](self, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cancel");

  p_currentCancellableDataTaskPromiseLock = &self->_currentCancellableDataTaskPromiseLock;
  os_unfair_lock_lock_with_options();
  -[AMSPromise cancel](self->_currentCancellableDataTaskPromise, "cancel");
  v10.receiver = self;
  v10.super_class = (Class)AMSMetricsFigaroFlushTask;
  v8 = -[AMSTask cancel](&v10, sel_cancel);
  os_unfair_lock_unlock(p_currentCancellableDataTaskPromiseLock);
  return v8;
}

- (void)_detectAnomaliesForEvent:(id)a3
{
  id v4;
  void *v5;
  NSObject *anomalyDetectionQueue;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v4 = a3;
  if (os_variant_has_internal_content())
  {
    objc_opt_class();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    anomalyDetectionQueue = self->_anomalyDetectionQueue;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __54__AMSMetricsFigaroFlushTask__detectAnomaliesForEvent___block_invoke;
    v8[3] = &unk_1E253E2B0;
    v9 = v4;
    v10 = v5;
    v7 = v5;
    dispatch_async(anomalyDetectionQueue, v8);

  }
}

void __54__AMSMetricsFigaroFlushTask__detectAnomaliesForEvent___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  uint64_t v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  NSObject *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  NSObject *v52;
  uint64_t v53;
  void *v54;
  AMSStorageDatabase *v55;
  uint64_t (*v56)(uint64_t, uint64_t);
  id v57;
  uint64_t v58;
  void *v59;
  uint64_t (*v61)(uint64_t, uint64_t);
  char v62;
  __int128 v63;
  id obj;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  id v71;
  id v72;
  _QWORD v73[6];
  _QWORD v74[3];
  uint64_t v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  id v80;
  uint8_t v81[128];
  _BYTE buf[24];
  uint64_t (*v83)(uint64_t, uint64_t);
  _BYTE v84[20];
  uint64_t v85;

  v85 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "propertyForBodyKey:", CFSTR("ab2_data"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = v1;
  else
    v2 = 0;

  objc_msgSend(v2, "dataUsingEncoding:", 4);
  v58 = objc_claimAutoreleasedReturnValue();

  v3 = (void *)v58;
  if (v58)
  {
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v58, 0, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v57 = v4;
    else
      v57 = 0;

    objc_msgSend(*(id *)(a1 + 32), "propertyForBodyKey:", CFSTR("userId"));
    *((_QWORD *)&v63 + 1) = objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "propertyForBodyKey:", CFSTR("clientId"));
    *(_QWORD *)&v63 = objc_claimAutoreleasedReturnValue();
    if (!v57 || v63 == 0)
      goto LABEL_71;
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v5, "OSLogObject");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 40);
      AMSLogKey();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      *(_QWORD *)&buf[4] = v7;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v8;
      *(_WORD *)&buf[22] = 2112;
      v83 = (uint64_t (*)(uint64_t, uint64_t))*((_QWORD *)&v63 + 1);
      *(_WORD *)v84 = 2112;
      *(_QWORD *)&v84[2] = v63;
      *(_WORD *)&v84[10] = 2112;
      *(_QWORD *)&v84[12] = v57;
      _os_log_impl(&dword_18C849000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ [%{public}@] Verifying treatments havent changed. userID=%@ clientID=%@ ab2=%@", buf, 0x34u);

    }
    v55 = -[AMSStorageDatabase initWithDomain:]([AMSStorageDatabase alloc], "initWithDomain:", CFSTR("com.apple.AppleMediaServices"));
    v80 = 0;
    -[AMSStorageDatabase valueForKey:error:](v55, "valueForKey:error:", CFSTR("treatmentsDebugData"), &v80);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = (uint64_t (*)(uint64_t, uint64_t))v80;
    if (v9)
      v10 = v9;
    else
      v10 = (void *)MEMORY[0x1E0C9AA70];
    v65 = (void *)objc_msgSend(v10, "mutableCopy");

    if (v56)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v11)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v11, "OSLogObject");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v13 = *(_QWORD *)(a1 + 40);
        AMSLogKey();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)&buf[4] = v13;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v14;
        *(_WORD *)&buf[22] = 2114;
        v83 = v56;
        _os_log_impl(&dword_18C849000, v12, OS_LOG_TYPE_ERROR, "%{public}@ [%{public}@] Failed to fetch cached treatment debug data. %{public}@", buf, 0x20u);

      }
    }
    v79 = 0u;
    v77 = 0u;
    v78 = 0u;
    v76 = 0u;
    obj = v57;
    v70 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v76, v81, 16);
    if (v70)
    {
      v62 = 0;
      v69 = *(_QWORD *)v77;
      do
      {
        for (i = 0; i != v70; ++i)
        {
          if (*(_QWORD *)v77 != v69)
            objc_enumerationMutation(obj);
          v16 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * i);
          objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("areaId"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v71 = v17;
          else
            v71 = 0;

          objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("treatmentId"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v19 = v18;
          else
            v19 = 0;

          objc_msgSend(v19, "componentsSeparatedByString:", CFSTR(":"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          if ((unint64_t)objc_msgSend(v20, "count") >= 5)
          {
            objc_msgSend(v20, "objectAtIndexedSubscript:", 0);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "objectAtIndexedSubscript:", 1);
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "objectAtIndexedSubscript:", 2);
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "objectAtIndexedSubscript:", 3);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "objectAtIndexedSubscript:", 4);
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = objc_msgSend(v22, "isEqualToString:", CFSTR("account"));
            v24 = *((_QWORD *)&v63 + 1);
            if ((v23 & 1) != 0 || (v25 = objc_msgSend(v22, "isEqualToString:", CFSTR("device")), v24 = v63, v25))
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@+%@"), v24, v71);
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v65, "objectForKeyedSubscript:", v26);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "componentsSeparatedByString:", CFSTR("+"));
              v28 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v28, "ams_objectAtIndex:", 1);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              v30 = v29;
              if (!v29)
                goto LABEL_52;
              if ((objc_msgSend(v29, "isEqualToString:", v21) & 1) == 0)
              {
                objc_msgSend(v21, "substringToIndex:", 7);
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                v32 = objc_msgSend(v30, "hasPrefix:", v31);

                if (v32)
                {
                  v33 = (void *)MEMORY[0x1E0CB3940];
                  AMSLogKey();
                  v34 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(*(id *)(a1 + 32), "propertyForBodyKey:", CFSTR("ab2_data"));
                  v35 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v33, "stringWithFormat:", CFSTR("The treatment changed unexpectedly for the user or client ID. \nLogKey: %@, \nExisting Treatment: %@, \nab2_data: %@"), v34, v30, v35);
                  v61 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();

                  LODWORD(v33) = +[AMSUnitTests isRunningUnitTests](AMSUnitTests, "isRunningUnitTests");
                  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
                  v36 = (void *)objc_claimAutoreleasedReturnValue();
                  if ((_DWORD)v33)
                  {
                    if (!v36)
                    {
                      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
                      v36 = (void *)objc_claimAutoreleasedReturnValue();
                    }
                    v59 = v36;
                    objc_msgSend(v36, "OSLogObject");
                    v37 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
                    {
                      v38 = *(_QWORD *)(a1 + 40);
                      AMSLogKey();
                      v39 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138543874;
                      *(_QWORD *)&buf[4] = v38;
                      *(_WORD *)&buf[12] = 2114;
                      *(_QWORD *)&buf[14] = v39;
                      *(_WORD *)&buf[22] = 2114;
                      v83 = v61;
                      _os_log_impl(&dword_18C849000, v37, OS_LOG_TYPE_ERROR, "%{public}@ [%{public}@] Error: %{public}@", buf, 0x20u);

                    }
                    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
                    v40 = (void *)objc_claimAutoreleasedReturnValue();
                    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
                    v41 = objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v40, "postNotificationName:object:userInfo:", CFSTR("com.apple.AppleMediaServicesTests.FaultLogged"), v41, 0);
                  }
                  else
                  {
                    if (!v36)
                    {
                      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
                      v36 = (void *)objc_claimAutoreleasedReturnValue();
                    }
                    v40 = v36;
                    objc_msgSend(v36, "OSLogObject");
                    v41 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v41, OS_LOG_TYPE_FAULT))
                    {
                      v42 = *(_QWORD *)(a1 + 40);
                      AMSLogKey();
                      v43 = objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138543874;
                      *(_QWORD *)&buf[4] = v42;
                      *(_WORD *)&buf[12] = 2114;
                      *(_QWORD *)&buf[14] = v43;
                      *(_WORD *)&buf[22] = 2114;
                      v83 = v61;
                      v44 = (void *)v43;
                      _os_log_impl(&dword_18C849000, v41, OS_LOG_TYPE_FAULT, "%{public}@ [%{public}@] Error: %{public}@", buf, 0x20u);

                    }
                  }

                  +[AMSTapToRadar openWithTitle:description:classification:reproducibility:keywordIds:](AMSTapToRadar, "openWithTitle:description:classification:reproducibility:keywordIds:", CFSTR("Unexpected A/B Treatment Flip"), v61, 5, 4, 0);
                }
              }
              if ((objc_msgSend(v30, "isEqualToString:", v21) & 1) == 0)
              {
LABEL_52:
                v45 = (void *)MEMORY[0x1E0CB3940];
                v46 = (void *)MEMORY[0x1E0CB37E8];
                objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
                objc_msgSend(v46, "numberWithDouble:");
                v47 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v45, "stringWithFormat:", CFSTR("%@+%@"), v47, v21);
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v65, "setObject:forKeyedSubscript:", v48, v26);

                v62 = 1;
              }

            }
          }

        }
        v70 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v76, v81, 16);
      }
      while (v70);

      if ((v62 & 1) == 0)
        goto LABEL_70;
      if ((unint64_t)objc_msgSend(v65, "count") >= 0x10)
      {
        v49 = MEMORY[0x1E0C809B0];
        do
        {
          v74[0] = 0;
          v74[1] = v74;
          v74[2] = 0x2020000000;
          v75 = 0;
          objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
          v75 = v50;
          *(_QWORD *)buf = 0;
          *(_QWORD *)&buf[8] = buf;
          *(_QWORD *)&buf[16] = 0x3032000000;
          v83 = __Block_byref_object_copy__46;
          *(_QWORD *)v84 = __Block_byref_object_dispose__46;
          *(_QWORD *)&v84[8] = 0;
          v73[0] = v49;
          v73[1] = 3221225472;
          v73[2] = __54__AMSMetricsFigaroFlushTask__detectAnomaliesForEvent___block_invoke_101;
          v73[3] = &unk_1E2543960;
          v73[4] = v74;
          v73[5] = buf;
          objc_msgSend(v65, "enumerateKeysAndObjectsUsingBlock:", v73);
          if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
            objc_msgSend(v65, "setObject:forKeyedSubscript:", 0);
          _Block_object_dispose(buf, 8);

          _Block_object_dispose(v74, 8);
        }
        while ((unint64_t)objc_msgSend(v65, "count") > 0xF);
      }

      v72 = 0;
      -[AMSStorageDatabase setValue:forKey:error:](v55, "setValue:forKey:error:", v65, CFSTR("treatmentsDebugData"), &v72);
      v56 = (uint64_t (*)(uint64_t, uint64_t))v72;
      if (!v56)
      {
        v56 = 0;
        goto LABEL_70;
      }
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v51)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
      }
      obj = v51;
      objc_msgSend(v51, "OSLogObject");
      v52 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
      {
        v53 = *(_QWORD *)(a1 + 40);
        AMSLogKey();
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)&buf[4] = v53;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v54;
        *(_WORD *)&buf[22] = 2114;
        v83 = v56;
        _os_log_impl(&dword_18C849000, v52, OS_LOG_TYPE_ERROR, "%{public}@ [%{public}@] Failed to update cached treatment debug data. %{public}@", buf, 0x20u);

      }
    }

LABEL_70:
LABEL_71:

    v3 = (void *)v58;
  }

}

void __54__AMSMetricsFigaroFlushTask__detectAnomaliesForEvent___block_invoke_101(uint64_t a1, void *a2, void *a3)
{
  void *v6;
  void *v7;
  double v8;
  uint64_t v9;
  id v10;

  v10 = a2;
  objc_msgSend(a3, "componentsSeparatedByString:", CFSTR("+"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ams_objectAtIndex:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (double)objc_msgSend(v7, "longLongValue");

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (*(double *)(v9 + 24) > v8)
  {
    *(double *)(v9 + 24) = v8;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  }

}

id __69__AMSMetricsFigaroFlushTask__nextBatchWithConfig_topic_maxBatchSize___block_invoke_117(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  __CFString *v9;
  uint64_t v10;
  void *v11;
  __CFString *v12;
  void *v13;
  _BOOL8 v14;
  AMSMetricsBatch *v15;
  void *v16;
  AMSOptional *v17;
  void *v18;

  v3 = a2;
  objc_msgSend(v3, "ams_firstObjectPassingTest:", &__block_literal_global_89);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "lastObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "account");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isAnonymous");
  v8 = *(void **)(a1 + 32);
  if (v8)
  {
    v9 = v8;
  }
  else
  {
    objc_msgSend(v5, "canaryIdentifier");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    v12 = &stru_1E2548760;
    if (v10)
      v12 = (__CFString *)v10;
    v9 = v12;

  }
  objc_msgSend(v3, "ams_mapWithTransform:", &__block_literal_global_122_0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count") || objc_msgSend(*(id *)(a1 + 40), "count") || objc_msgSend(*(id *)(a1 + 48), "count"))
  {
    v14 = v4 != 0;
    v15 = objc_alloc_init(AMSMetricsBatch);
    -[AMSMetricsBatch setAccount:](v15, "setAccount:", v6);
    -[AMSMetricsBatch setAnonymous:](v15, "setAnonymous:", v7);
    -[AMSMetricsBatch setCanaryIdentifier:](v15, "setCanaryIdentifier:", v9);
    -[AMSMetricsBatch setContainsLoadURL:](v15, "setContainsLoadURL:", v14);
    -[AMSMetricsBatch setDroppedEvents:](v15, "setDroppedEvents:", *(_QWORD *)(a1 + 40));
    -[AMSMetricsBatch setEvents:](v15, "setEvents:", v3);
    -[AMSMetricsBatch setEventDictionaries:](v15, "setEventDictionaries:", v13);
    -[AMSMetricsBatch setSkippedEvents:](v15, "setSkippedEvents:", *(_QWORD *)(a1 + 48));
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSMetricsBatch setReportURL:](v15, "setReportURL:", v16);

    }
  }
  else
  {
    v15 = 0;
  }
  v17 = -[AMSOptional initWithValue:]([AMSOptional alloc], "initWithValue:", v15);
  +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

AMSPromise *__40__AMSMetricsFigaroFlushTask__postBatch___block_invoke_2(uint64_t a1)
{
  return +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", *(_QWORD *)(a1 + 32));
}

id __40__AMSMetricsFigaroFlushTask__postBatch___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;

  v3 = a2;
  v4 = objc_msgSend(*(id *)(a1 + 32), "containsLoadURL");
  objc_msgSend(v3, "properties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDisableLoadURLMetrics:", v4);

  objc_msgSend(v3, "setHTTPBody:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v3, "setValue:forHTTPHeaderField:", CFSTR("gzip"), CFSTR("Content-Encoding"));
  objc_msgSend(v3, "setValue:forHTTPHeaderField:", CFSTR("application/json; charset=utf-8"), CFSTR("Content-Type"));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld"), objc_msgSend(*(id *)(a1 + 40), "length"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forHTTPHeaderField:", v6, CFSTR("Content-Length"));

  objc_msgSend(v3, "setValue:forHTTPHeaderField:", *(_QWORD *)(a1 + 48), CFSTR("X-Apple-ActionSignature"));
  objc_msgSend(*(id *)(a1 + 32), "canaryIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forHTTPHeaderField:", v7, CFSTR("X-Apple-Canary-Id"));

  if (objc_msgSend(*(id *)(a1 + 32), "anonymous"))
    objc_msgSend(v3, "setValue:forHTTPHeaderField:", 0, CFSTR("Cookie"));
  os_unfair_lock_lock_with_options();
  if (objc_msgSend(*(id *)(a1 + 56), "isCancelled"))
  {
    AMSError(6, CFSTR("Flush Figaro Task Failed"), CFSTR("Cancelled"), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v8);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 56), "URLSession");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dataTaskPromiseWithRequest:", v3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = *(_QWORD *)(a1 + 56);
    v9 = v11;
    v8 = *(void **)(v12 + 56);
    *(_QWORD *)(v12 + 56) = v9;
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 56) + 64));
  return v9;
}

- (BOOL)_shouldClearEventsDespiteError:(id)a3 result:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v14;
  void *v16;
  int v17;
  BOOL v18;
  void *v19;
  int v20;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v6)
  {
    v8 = objc_msgSend(v6, "responseStatusCode");
LABEL_5:
    v14 = (unint64_t)(v8 - 200) < 0x64 || (unint64_t)(v8 - 400) < 0x64;
    goto LABEL_11;
  }
  objc_msgSend(v5, "userInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("AMSStatusCode"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v5, "userInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("AMSStatusCode"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v12, "integerValue");

    goto LABEL_5;
  }
  objc_msgSend(v5, "domain");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("AMSErrorDomain"));

  if (v17)
  {
    v18 = objc_msgSend(v5, "code") == 3;
  }
  else
  {
    objc_msgSend(v5, "domain");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "isEqualToString:", *MEMORY[0x1E0CB32E8]);

    if (!v20)
    {
      v14 = 0;
      goto LABEL_11;
    }
    v18 = objc_msgSend(v5, "code") == -1102;
  }
  v14 = v18;
LABEL_11:

  return v14;
}

@end
